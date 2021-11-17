Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE52D454DF6
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 20:34:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240537AbhKQThT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 14:37:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:45526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S240506AbhKQThL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 14:37:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id C2E4E61BFB;
        Wed, 17 Nov 2021 19:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1637177650;
        bh=bNH4TlgQ+lg/SdNYNZKDeseEUp9in8zyWU06Z5yoQ0I=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MFD9dGMkyLmxotmkTd/vqTbPf2deg8WOvypcyaSV1D2picBq1vzP/xFwYFUy9xPnB
         HSWGQHuH8hZ2dzvUYuQeSQJHoOqk5tEX16uTlJL32WkZc9IyaROW/Sp6iXi5lt0M/b
         bEgx37oQD3n3jXI9JhQGYtDS29FO8YKEQvk8u6HiQCMMzemHGkVvwH9pNuCi5MfOT4
         vcZIbVwm7AWJX+TCQdzn/49YAE8cpwAdVaYsVHfiayLkssZT+3gIIh7OdpJ/Wi6ifZ
         9WH/l6sjfQv/dwq5aQHx7Na+t2VF/1JlrlyAePrdNot+wpc7zc/IsBhmwtUNT2QKDh
         N/jNp8NO7EbCw==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mnQh6-00DXHf-1m; Wed, 17 Nov 2021 19:34:08 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Aditya Srivastava <yashsri421@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Baokun Li <libaokun1@huawei.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Maennich <maennich@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 2/8] media: atomisp: get rid of set pipe version custom ctrl
Date:   Wed, 17 Nov 2021 19:34:00 +0000
Message-Id: <3d93044724f204f3a61af6b71e77b5f310018eea.1637177402.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1637177402.git.mchehab+huawei@kernel.org>
References: <cover.1637177402.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

It doesn't make sense to have a control for that. Besides that,
the Intel Aero implementation doesn't have, which means that
even the custom control is not used in practice, at least
outside Android.

So, get rid of it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To avoid mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/8] at: https://lore.kernel.org/all/cover.1637177402.git.mchehab+huawei@kernel.org/

 .../media/atomisp/pci/atomisp_compat_css20.c  |  9 --------
 .../media/atomisp/pci/atomisp_subdev.c        | 23 -------------------
 .../media/atomisp/pci/atomisp_subdev.h        |  1 -
 3 files changed, 33 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
index 7edee293b132..1173be0e72b0 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_compat_css20.c
@@ -611,15 +611,6 @@ static void __apply_additional_pipe_config(
 		if (stream_env->pipe_configs[pipe_id].
 		    default_capture_config.mode == IA_CSS_CAPTURE_MODE_RAW)
 			stream_env->pipe_configs[pipe_id].enable_dz = false;
-
-		if (IS_ISP2401) {
-			/* the isp default to use ISP2.2 and the camera hal will
-			* control whether use isp2.7 */
-			if (asd->select_isp_version->val == ATOMISP_CSS_ISP_PIPE_VERSION_2_7)
-				stream_env->pipe_configs[pipe_id].isp_pipe_version =  SH_CSS_ISP_PIPE_VERSION_2_7;
-			else
-				stream_env->pipe_configs[pipe_id].isp_pipe_version = SH_CSS_ISP_PIPE_VERSION_2_2;
-		}
 		break;
 	case IA_CSS_PIPE_ID_VIDEO:
 		/* enable reduced pipe to have binary
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index a3f3c42f9db7..1807cfa786a7 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1058,24 +1058,6 @@ static const struct v4l2_ctrl_config ctrl_depth_mode = {
 	.def = 0,
 };
 
-/*
- * Control for selectting ISP version
- *
- * When enabled, that means ISP version will be used ISP2.7. when disable, the
- * isp will default to use ISP2.2.
- * Note: Make sure set this configuration before creating stream.
- */
-static const struct v4l2_ctrl_config ctrl_select_isp_version = {
-	.ops = &ctrl_ops,
-	.id = V4L2_CID_ATOMISP_SELECT_ISP_VERSION,
-	.type = V4L2_CTRL_TYPE_BOOLEAN,
-	.name = "Select Isp version",
-	.min = 0,
-	.max = 1,
-	.step = 1,
-	.def = 0,
-};
-
 static void atomisp_init_subdev_pipe(struct atomisp_sub_device *asd,
 				     struct atomisp_video_pipe *pipe, enum v4l2_buf_type buf_type)
 {
@@ -1223,11 +1205,6 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 	    v4l2_ctrl_new_custom(&asd->ctrl_handler,
 				 &ctrl_disable_dz,
 				 NULL);
-	if (IS_ISP2401) {
-		asd->select_isp_version = v4l2_ctrl_new_custom(&asd->ctrl_handler,
-							       &ctrl_select_isp_version,
-							       NULL);
-	}
 
 	/* Make controls visible on subdev as well. */
 	asd->subdev.ctrl_handler = &asd->ctrl_handler;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index a8d210ea5f8b..7d731f1fee72 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -319,7 +319,6 @@ struct atomisp_sub_device {
 
 	/* ISP2401 */
 	struct v4l2_ctrl *ion_dev_fd;
-	struct v4l2_ctrl *select_isp_version;
 
 	struct v4l2_ctrl *disable_dz;
 
-- 
2.33.1

