Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52CAD1ECA0D
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbgFCHCJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:02:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:43306 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725937AbgFCHBG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:06 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 8DB2020823;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=0dQGWcnYVN8Hkuw4qUnBGLhGgxiezGaQzydsDwZYL9M=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BeauKyPCyz9dTsPvpk7dKMIhtJ5y19+PB17cMIM4HYTznEubBdfHQ5sBkZU2rinSB
         SU/AUJlbgiGbOTdPduGiDnljBA4fLAlzWTooHfk/f7hNMUELcSJ83EDT7pAeJF/pmv
         pOG9aU5PMMJhSacJ9eiivoJITQMs6p+ZlTtGif1o=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j8v-LV; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Subject: [PATCH 12/15] media: atomisp: use different dfs failed messages
Date:   Wed,  3 Jun 2020 09:00:58 +0200
Message-Id: <cae52f044d860a09a62ec1956751b0fa283645b8.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

There are several parts of the driver that could produce
a "dfs failed!" message. Change the texts, in order to help
identifying from where they're coming.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c   | 4 ++--
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 4252d3d37649..6c324815c0f6 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1407,10 +1407,10 @@ static void __atomisp_css_recover(struct atomisp_device *isp, bool isp_timeout)
 				       atomisp_css_valid_sof(isp));
 
 		if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_AUTO, true) < 0)
-			dev_dbg(isp->dev, "dfs failed!\n");
+			dev_dbg(isp->dev, "DFS auto failed while recovering!\n");
 	} else {
 		if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_MAX, true) < 0)
-			dev_dbg(isp->dev, "dfs failed!\n");
+			dev_dbg(isp->dev, "DFS max failed while recovering!\n");
 	}
 
 	for (i = 0; i < isp->num_of_streams; i++) {
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 0a76f388b38b..15567623b51b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -1810,15 +1810,15 @@ static int atomisp_streamon(struct file *file, void *fh,
 		if (atomisp_streaming_count(isp) > 1) {
 			if (atomisp_freq_scaling(isp,
 						 ATOMISP_DFS_MODE_MAX, false) < 0)
-				dev_dbg(isp->dev, "dfs failed!\n");
+				dev_dbg(isp->dev, "DFS max mode failed!\n");
 		} else {
 			if (atomisp_freq_scaling(isp,
 						 ATOMISP_DFS_MODE_AUTO, false) < 0)
-				dev_dbg(isp->dev, "dfs failed!\n");
+				dev_dbg(isp->dev, "DFS auto mode failed!\n");
 		}
 	} else {
 		if (atomisp_freq_scaling(isp, ATOMISP_DFS_MODE_MAX, false) < 0)
-			dev_dbg(isp->dev, "dfs failed!\n");
+			dev_dbg(isp->dev, "DFS max mode failed!\n");
 	}
 
 	if (asd->depth_mode->val && atomisp_streaming_count(isp) ==
-- 
2.26.2

