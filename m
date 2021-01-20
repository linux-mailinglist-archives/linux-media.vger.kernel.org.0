Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD9802FCE70
	for <lists+linux-media@lfdr.de>; Wed, 20 Jan 2021 11:55:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387677AbhATKly (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 20 Jan 2021 05:41:54 -0500
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:35375 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731660AbhATJop (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 20 Jan 2021 04:44:45 -0500
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id 2A14lJCTVftvz2A1Al8jFM; Wed, 20 Jan 2021 10:43:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s2;
        t=1611135793; bh=IB09Ru0Dwkgtmy8Sizw+EPS/eOIBZ32GMG7jQ4yKpeQ=;
        h=From:To:Subject:Date:Message-Id:MIME-Version:From:Subject;
        b=kez0JI3VwuTqP+vJT8FUW7V5ftHfxwXlGHoiZkRRSRh9k30V+SQIKt1aSKQKf30uU
         Dx+hA2cRc8BUs4omFb1XJCC1AMPWthG1KGPNhwicTIdOIOnO+khptX14CBFWHL3pqS
         Zzv+dIlA0g13WFLr+sXguybfEssG70dxd6EPboqV9sHeN+0WgNBE2zo04nwtRPASPV
         rhf7/pExacoTcsh3OZLyrJmNdBFlhuYPw69SJOkkGSplbE8xFxXplj5QcT7Nj4OkgZ
         v2bF6kNUcYYsL7c/IytpPDS7e4H0JbD5mlIMfofQAGYJuCOxGO65x9a/FFs4r24j4r
         76OyJSMM1muvA==
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
To:     linux-media@vger.kernel.org
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH 09/14] pci/ivtv: release memory regions on error
Date:   Wed, 20 Jan 2021 10:43:01 +0100
Message-Id: <20210120094306.784318-10-hverkuil-cisco@xs4all.nl>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
References: <20210120094306.784318-1-hverkuil-cisco@xs4all.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMAE-Envelope: MS4xfAX5slZdcEG06gClf1fIbSEcdCCiibSaO57tXMNZ1RIGZ6Bnhop5RCmAwSDRBq0pMH9u1fnxz2YJnBjddl0CUTNYr+CsDS0ZgH7HSCI/FBqqF/Lc17c1
 spMTuaX3EY59qmTlxUrh7WdPKN+QMvl/ueTCuoV7ce54KMRIJcbPGXQgqeDUKYloleGy3kY3NfG34FOIu/4gLICuUcAx8qvPQhkcY/j7Cxe5kgNgO9ercodC
 59IpAWQKL4x5TIxzCbqj6A==
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Fix this smatch warning:

drivers/media/pci/ivtv/ivtv-driver.c:900 ivtv_setup_pci() warn: 'itv->base_addr' not released on lines: 876.

One error path didn't release the memory regions.

Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 drivers/media/pci/ivtv/ivtv-driver.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/pci/ivtv/ivtv-driver.c b/drivers/media/pci/ivtv/ivtv-driver.c
index 28acb14490d5..6e448cb3b51c 100644
--- a/drivers/media/pci/ivtv/ivtv-driver.c
+++ b/drivers/media/pci/ivtv/ivtv-driver.c
@@ -873,6 +873,11 @@ static int ivtv_setup_pci(struct ivtv *itv, struct pci_dev *pdev,
 		pci_read_config_word(pdev, PCI_COMMAND, &cmd);
 		if (!(cmd & PCI_COMMAND_MASTER)) {
 			IVTV_ERR("Bus Mastering is not enabled\n");
+			if (itv->has_cx23415)
+				release_mem_region(itv->base_addr + IVTV_DECODER_OFFSET,
+						   IVTV_DECODER_SIZE);
+			release_mem_region(itv->base_addr, IVTV_ENCODER_SIZE);
+			release_mem_region(itv->base_addr + IVTV_REG_OFFSET, IVTV_REG_SIZE);
 			return -ENXIO;
 		}
 	}
-- 
2.29.2

