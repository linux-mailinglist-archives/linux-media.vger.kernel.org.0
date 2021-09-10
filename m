Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E997C406ACA
	for <lists+linux-media@lfdr.de>; Fri, 10 Sep 2021 13:40:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232844AbhIJLlL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Sep 2021 07:41:11 -0400
Received: from smtp-relay-canonical-0.canonical.com ([185.125.188.120]:60550
        "EHLO smtp-relay-canonical-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232613AbhIJLlK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Sep 2021 07:41:10 -0400
Received: from localhost (1.general.cking.uk.vpn [10.172.193.212])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-canonical-0.canonical.com (Postfix) with ESMTPSA id ABC164017A;
        Fri, 10 Sep 2021 11:39:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1631273998;
        bh=mfuA1EgBTXy+iiataNB51ALiNt+E78oZZkzMZc4FNvg=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type;
        b=hMuWZs23xadRY769Vco1XWflgZHsm/I51SK9Soi0VCsWx81jb1a8htcx8M8mG/RgI
         ORldhSgPLMhCfXlBxEESv6jtXwkiOoMlQdPQ0yPTCC3JGWXIbMj2NYqxtjCrIS7vmZ
         7tcv298C/4cqr+fYTAKqjr6xeEenVVETGWv3qcz9LCb/WfGUqF49H9GX7nv721xhU8
         6y3LBtfPACW5jm86c7ZjtqLiIH5hX8g3PrMAu/3vDFdZ90qqcEF0V/JTqN5Pwg4lLp
         vyp9qywBNqmUffhpLMv0GFPI0+BGk9/eFHZ8/nMYwhVX5OSgMMvy9E3P6/jNb99A3Q
         4rtbey+hsbFpA==
From:   Colin King <colin.king@canonical.com>
To:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Cc:     kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] media: saa7164: Remove redundant assignment of pointer t
Date:   Fri, 10 Sep 2021 12:39:57 +0100
Message-Id: <20210910113957.42182-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Colin Ian King <colin.king@canonical.com>

The pointer t is being assigned a value that is never read, it is being
updated later on inside the for-loop. The assignment is redundant and
can be removed.

Addresses-Coverity: ("Unused value")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/media/pci/saa7164/saa7164-api.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/pci/saa7164/saa7164-api.c b/drivers/media/pci/saa7164/saa7164-api.c
index 4ddd0f5b50f1..5526bcc7a9bd 100644
--- a/drivers/media/pci/saa7164/saa7164-api.c
+++ b/drivers/media/pci/saa7164/saa7164-api.c
@@ -1057,8 +1057,6 @@ static int saa7164_api_dump_subdevs(struct saa7164_dev *dev, u8 *buf, int len)
 			dprintk(DBGLVL_API, "  numformats   = 0x%x\n",
 				vcoutputtermhdr->numformats);
 
-			t = (struct tmComResDescrHeader *)
-				((struct tmComResDMATermDescrHeader *)(buf + idx));
 			next_offset = idx + (vcoutputtermhdr->len);
 			for (i = 0; i < vcoutputtermhdr->numformats; i++) {
 				t = (struct tmComResDescrHeader *)
-- 
2.32.0

