Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1460E446DC9
	for <lists+linux-media@lfdr.de>; Sat,  6 Nov 2021 13:05:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234124AbhKFMIY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 6 Nov 2021 08:08:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:38680 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234118AbhKFMIW (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 6 Nov 2021 08:08:22 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id CDF616120D;
        Sat,  6 Nov 2021 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636200341;
        bh=FQ3MJXvIQtgpKR3juwyNry7kJNekKSdGuyc2j1tpWf8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BCYOWaiQbScuWo2vtMCWPT13gV7cq9aYss6ivIx/JZXAQJnkjp6nBm4ru2AzbEQEv
         xl4YZ9vddvFx4rA1HUqxG86A++IQG60vGrUqqpYhH1UF7+vw6Baiy5iyWWrPlreLf4
         uTRElGvUNTAEg/AQHoy2H19mPhGOWgdHDBHdatuFRkl46UDgK2pWSaDA0kqo5a7lO4
         xDcsIfCcQhbmeaGJPcgPWfhdCoUmyyqur+oaIVjxDr5+OVd+FCIlLEFjqzf9Mk4Qft
         0ZPWKjyE9t/29MgSs91tnSaiX44b3mItG8oY/ZtIpkWqSQSALNbIdaqYjRt9GDAFkg
         F/8Rvt/wWqm4g==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mjKS2-0006oy-3K; Sat, 06 Nov 2021 12:05:38 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Alan <alan@linux.intel.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matthias Maennich <maennich@google.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Yang Yingliang <yangyingliang@huawei.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/2] media: atomisp: set per-device's default mode
Date:   Sat,  6 Nov 2021 12:05:36 +0000
Message-Id: <e9a11f87b4d830d390382171461289ccc51ab786.1636200095.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636200095.git.mchehab+huawei@kernel.org>
References: <cover.1636200095.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

The atomisp driver originally used the s_parm command to
initialize the run_mode type to the driver. So, before start
setting up the streaming, s_parm should be called.

So, even having 5 "normal" video devices, one meant to be used
for each type, the run_mode was actually selected when
s_parm is called.

Without setting the run mode, applications that don't call
VIDIOC_SET_PARM with a custom atomisp parameters won't work, as
the pipeline won't be set:

	atomisp-isp2 0000:00:03.0: can't create streams
	atomisp-isp2 0000:00:03.0: __get_frame_info 1600x1200 (padded to 0) returned -22

However, commit 8a7c5594c020 ("media: v4l2-ioctl: clear fields in s_parm")
broke support for it, with a good reason, as drivers shoudn't be
extending the API for their own purposes.

So, as an step to allow generic apps to use this driver, put
the device's run_mode in preview after open.

After this patch, using v4l2grab starts to work on preview
mode (/dev/video2):

	$ v4l2grab -f YUYV -x 1600 -y 1200 -d /dev/video2 -n 1 -u
	$ feh out000.pnm

So, let's just setup the default run_mode that each video devnode
should assume, setting it at open() time.

Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

To mailbombing on a large number of people, only mailing lists were C/C on the cover.
See [PATCH 0/2] at: https://lore.kernel.org/all/cover.1636200095.git.mchehab+huawei@kernel.org/

 drivers/staging/media/atomisp/pci/atomisp_fops.c  |  5 +++++
 .../staging/media/atomisp/pci/atomisp_subdev.c    | 15 ++++++++++-----
 .../staging/media/atomisp/pci/atomisp_subdev.h    |  3 +++
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c  |  4 +++-
 drivers/staging/media/atomisp/pci/atomisp_v4l2.h  |  3 ++-
 5 files changed, 23 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_fops.c b/drivers/staging/media/atomisp/pci/atomisp_fops.c
index 036a265502fe..a57d480820bd 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_fops.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_fops.c
@@ -899,6 +899,11 @@ static int atomisp_open(struct file *file)
 	else
 		pipe->users++;
 	rt_mutex_unlock(&isp->mutex);
+
+	/* Ensure that a mode is set */
+	if (asd)
+		v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
+
 	return 0;
 
 css_error:
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.c b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
index 12f22ad007c7..ffaf11e0b0ad 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.c
@@ -1164,23 +1164,28 @@ static int isp_subdev_init_entities(struct atomisp_sub_device *asd)
 
 	atomisp_init_acc_pipe(asd, &asd->video_acc);
 
-	ret = atomisp_video_init(&asd->video_in, "MEMORY");
+	ret = atomisp_video_init(&asd->video_in, "MEMORY",
+				 ATOMISP_RUN_MODE_SDV);
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE");
+	ret = atomisp_video_init(&asd->video_out_capture, "CAPTURE",
+				 ATOMISP_RUN_MODE_STILL_CAPTURE);
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out_vf, "VIEWFINDER");
+	ret = atomisp_video_init(&asd->video_out_vf, "VIEWFINDER",
+				 ATOMISP_RUN_MODE_CONTINUOUS_CAPTURE);
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out_preview, "PREVIEW");
+	ret = atomisp_video_init(&asd->video_out_preview, "PREVIEW",
+				 ATOMISP_RUN_MODE_PREVIEW);
 	if (ret < 0)
 		return ret;
 
-	ret = atomisp_video_init(&asd->video_out_video_capture, "VIDEO");
+	ret = atomisp_video_init(&asd->video_out_video_capture, "VIDEO",
+				 ATOMISP_RUN_MODE_VIDEO);
 	if (ret < 0)
 		return ret;
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_subdev.h b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
index d6fcfab6352d..a8d210ea5f8b 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_subdev.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_subdev.h
@@ -81,6 +81,9 @@ struct atomisp_video_pipe {
 	/* the link list to store per_frame parameters */
 	struct list_head per_frame_params;
 
+	/* Store here the initial run mode */
+	unsigned int default_run_mode;
+
 	unsigned int buffers_in_css;
 
 	/* irq_lock is used to protect video buffer state change operations and
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 0223e3dd95a6..1b240891a6e2 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -447,7 +447,8 @@ const struct atomisp_dfs_config dfs_config_cht_soc = {
 	.dfs_table_size = ARRAY_SIZE(dfs_rules_cht_soc),
 };
 
-int atomisp_video_init(struct atomisp_video_pipe *video, const char *name)
+int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
+		       unsigned int run_mode)
 {
 	int ret;
 	const char *direction;
@@ -478,6 +479,7 @@ int atomisp_video_init(struct atomisp_video_pipe *video, const char *name)
 		 "ATOMISP ISP %s %s", name, direction);
 	video->vdev.release = video_device_release_empty;
 	video_set_drvdata(&video->vdev, video->isp);
+	video->default_run_mode = run_mode;
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
index 81bb356b8172..72611b8286a4 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.h
@@ -27,7 +27,8 @@ struct v4l2_device;
 struct atomisp_device;
 struct firmware;
 
-int atomisp_video_init(struct atomisp_video_pipe *video, const char *name);
+int atomisp_video_init(struct atomisp_video_pipe *video, const char *name,
+		       unsigned int run_mode);
 void atomisp_acc_init(struct atomisp_acc_pipe *video, const char *name);
 void atomisp_video_unregister(struct atomisp_video_pipe *video);
 void atomisp_acc_unregister(struct atomisp_acc_pipe *video);
-- 
2.33.1

