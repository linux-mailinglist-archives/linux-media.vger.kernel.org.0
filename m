Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0359A25B0FC
	for <lists+linux-media@lfdr.de>; Wed,  2 Sep 2020 18:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728690AbgIBQNY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Sep 2020 12:13:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:54052 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728338AbgIBQK5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Sep 2020 12:10:57 -0400
Received: from mail.kernel.org (ip5f5ad5c3.dynamic.kabel-deutschland.de [95.90.213.195])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A47C5221EC;
        Wed,  2 Sep 2020 16:10:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599063046;
        bh=yoQ8zZE5m2/tDG9AeXtLxMJl3im46ZkFGZeqJRxitE4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qaY1oFSYcDv+ogzDVXr3d5fhrEopUrBB+TvKnkK+8pPRIyrZ8YN7uilwgwszUJEYu
         WRNubUMqmwMnnz2wAm74KhVfPq/69qs8XxivES3DC8Tt01R7jCwS884wVvisuVIRoc
         0xOgFDGhvUwe83zUer5g3Zi3hnxdtLbswSBjmiUY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kDVLQ-000tBN-S2; Wed, 02 Sep 2020 18:10:44 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 36/38] media: atomisp: csi_rx.c: add a missing includes
Date:   Wed,  2 Sep 2020 18:10:39 +0200
Message-Id: <ee16e19b9176fb65341fd5f2b81ecbf98e5ba1b4.1599062230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599062230.git.mchehab+huawei@kernel.org>
References: <cover.1599062230.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Due to that, smatch warns with:

	drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c:18:11:  warning: symbol 'N_SHORT_PACKET_LUT_ENTRIES' was not declared. Should it be static?
	drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c:24:11:  warning: symbol 'N_LONG_PACKET_LUT_ENTRIES' was not declared. Should it be static?
	drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c:30:11:  warning: symbol 'N_CSI_RX_FE_CTRL_DLANES' was not declared. Should it be static?
	drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c:37:11:  warning: symbol 'N_CSI_RX_BE_SID_WIDTH' was not declared. Should it be static?
	drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c:19:11:  warning: symbol 'N_IBUF_CTRL_PROCS' was not declared. Should it be static?

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c  | 1 +
 .../staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c   | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
index 8e661091f7d9..9a8d8f546da7 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx.c
@@ -14,6 +14,7 @@
  */
 
 #include "system_global.h"
+#include "csi_rx_global.h"
 
 const u32 N_SHORT_PACKET_LUT_ENTRIES[N_CSI_RX_BACKEND_ID] = {
 	4,	/* 4 entries at CSI_RX_BACKEND0_ID*/
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
index 58fec54a914d..8d19c9875a71 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/ibuf_ctrl.c
@@ -15,6 +15,7 @@
 
 #include <type_support.h>
 #include "system_global.h"
+#include "ibuf_ctrl_global.h"
 
 const u32 N_IBUF_CTRL_PROCS[N_IBUF_CTRL_ID] = {
 	8,	/* IBUF_CTRL0_ID supports at most 8 processes */
-- 
2.26.2

