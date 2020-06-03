Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4217E1ECA00
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2020 09:02:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726234AbgFCHBh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Jun 2020 03:01:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:43410 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726123AbgFCHBI (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 3 Jun 2020 03:01:08 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB80420878;
        Wed,  3 Jun 2020 07:01:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591167665;
        bh=H8ctQ2sg2LU2YVj/bJeUzHXsZxf6SNLpmvCtQX7m0hU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=jbnpGrbEEdsD6tzbYDQCSomSWUSMun64MUKh4bQZjckH+uz1npGr2DEBtC54Gx/20
         ak2SsVY6elKjL7feWhfFP0Rq7kRacGu7dNKAprkDmdQkqKLCMy3dyzZIPlOU0tQtPp
         TxVRE8iq5JUsitlp2uEXZv8dZ6kn+jLgp16sfFHA=
Received: from mchehab by mail.kernel.org with local (Exim 4.93)
        (envelope-from <mchehab@kernel.org>)
        id 1jgNOZ-004j95-P5; Wed, 03 Jun 2020 09:01:03 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        Hans Verkuil <hverkuil@xs4all.nl>
Subject: [PATCH 14/15] media: atomisp: use strscpy() instead of less secure variants
Date:   Wed,  3 Jun 2020 09:01:00 +0200
Message-Id: <3fca28b47d2f2e7d646013619a16f754f9632c19.1591167358.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1591167358.git.mchehab+huawei@kernel.org>
References: <cover.1591167358.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Replace usages of strcpy(), strlcpy() and strncpy() in favor
of strscpy().

Suggested-by: Hans Verkuil <hverkuil@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/staging/media/atomisp/pci/atomisp_file.c     |  2 +-
 .../media/atomisp/pci/atomisp_gmin_platform.c        |  2 +-
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c    | 12 ++++++------
 drivers/staging/media/atomisp/pci/atomisp_tpg.c      |  2 +-
 .../staging/media/atomisp/pci/atomisp_trace_event.h  |  6 +++---
 drivers/staging/media/atomisp/pci/atomisp_v4l2.c     |  2 +-
 drivers/staging/media/atomisp/pci/sh_css_sp.c        |  3 +--
 drivers/staging/media/atomisp/pci/sh_css_version.c   |  2 +-
 8 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_file.c b/drivers/staging/media/atomisp/pci/atomisp_file.c
index fa92b5eba740..e568ca99c45a 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_file.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_file.c
@@ -219,7 +219,7 @@ int atomisp_file_input_init(struct atomisp_device *isp)
 
 	v4l2_subdev_init(sd, &file_input_ops);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strcpy(sd->name, "file_input_subdev");
+	strscpy(sd->name, "file_input_subdev", sizeof(sd->name));
 	v4l2_set_subdevdata(sd, file_dev);
 
 	pads[0].flags = MEDIA_PAD_FL_SINK;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
index e8f835c3bbae..5d2bfe2ea971 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
@@ -936,7 +936,7 @@ static int gmin_get_hardcoded_var(struct gmin_cfg_var *varlist,
 		if (vl > *out_len - 1)
 			return -ENOSPC;
 
-		strcpy(out, gv->val);
+		strscpy(out, gv->val, *out_len);
 		*out_len = vl;
 		return 0;
 	}
diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 15567623b51b..9404a678fa6f 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -547,8 +547,8 @@ static int atomisp_querycap(struct file *file, void *fh,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 
-	strscpy(cap->driver, DRIVER, sizeof(cap->driver) - 1);
-	strscpy(cap->card, CARD, sizeof(cap->card) - 1);
+	strscpy(cap->driver, DRIVER, sizeof(cap->driver));
+	strscpy(cap->card, CARD, sizeof(cap->card));
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "PCI:%s",
 		 pci_name(isp->pdev));
 
@@ -573,8 +573,8 @@ static int atomisp_enum_input(struct file *file, void *fh,
 		return -EINVAL;
 
 	memset(input, 0, sizeof(struct v4l2_input));
-	strncpy(input->name, isp->inputs[index].camera->name,
-		sizeof(input->name) - 1);
+	strscpy(input->name, isp->inputs[index].camera->name,
+		sizeof(input->name));
 
 	/*
 	 * HACK: append actuator's name to sensor's
@@ -593,8 +593,8 @@ static int atomisp_enum_input(struct file *file, void *fh,
 
 		if (max_size > 1) {
 			input->name[cur_len] = '+';
-			strncpy(&input->name[cur_len + 1],
-				motor->name, max_size - 1);
+			strscpy(&input->name[cur_len + 1],
+				motor->name, max_size);
 		}
 	}
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_tpg.c b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
index 9477ac5e22b9..1def80bab180 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_tpg.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_tpg.c
@@ -148,7 +148,7 @@ int atomisp_tpg_init(struct atomisp_device *isp)
 	tpg->isp = isp;
 	v4l2_subdev_init(sd, &tpg_ops);
 	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
-	strcpy(sd->name, "tpg_subdev");
+	strscpy(sd->name, "tpg_subdev", sizeof(sd->name));
 	v4l2_set_subdevdata(sd, tpg);
 
 	pads[0].flags = MEDIA_PAD_FL_SINK;
diff --git a/drivers/staging/media/atomisp/pci/atomisp_trace_event.h b/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
index 61f402a642d4..538d45e008b5 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
+++ b/drivers/staging/media/atomisp/pci/atomisp_trace_event.h
@@ -44,7 +44,7 @@ TRACE_EVENT(camera_meminfo,
 	    ),
 
 	    TP_fast_assign(
-		strlcpy(__entry->name, name, 24);
+		strscpy(__entry->name, name, 24);
 		__entry->uptr_size = uptr_size;
 		__entry->counter = counter;
 		__entry->sys_size = sys_size;
@@ -74,8 +74,8 @@ TRACE_EVENT(camera_debug,
 	    ),
 
 	    TP_fast_assign(
-		strlcpy(__entry->name, name, 24);
-		strlcpy(__entry->info, info, 24);
+		strscpy(__entry->name, name, 24);
+		strscpy(__entry->info, info, 24);
 		__entry->line = line;
 	    ),
 
diff --git a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
index 158f11f4f545..e0d08040df6e 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_v4l2.c
@@ -1212,7 +1212,7 @@ static int atomisp_register_entities(struct atomisp_device *isp)
 
 	isp->media_dev.dev = isp->dev;
 
-	strlcpy(isp->media_dev.model, "Intel Atom ISP",
+	strscpy(isp->media_dev.model, "Intel Atom ISP",
 		sizeof(isp->media_dev.model));
 
 	media_device_init(&isp->media_dev);
diff --git a/drivers/staging/media/atomisp/pci/sh_css_sp.c b/drivers/staging/media/atomisp/pci/sh_css_sp.c
index 756aad4a6e43..a40020ad699d 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_sp.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_sp.c
@@ -991,8 +991,7 @@ sh_css_sp_init_stage(struct ia_css_binary *binary,
 
 	/* Make sure binary name is smaller than allowed string size */
 	assert(strlen(binary_name) < SH_CSS_MAX_BINARY_NAME - 1);
-	strncpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME - 1);
-	sh_css_isp_stage.binary_name[SH_CSS_MAX_BINARY_NAME - 1] = 0;
+	strscpy(sh_css_isp_stage.binary_name, binary_name, SH_CSS_MAX_BINARY_NAME);
 	sh_css_isp_stage.mem_initializers = *isp_mem_if;
 
 	/*
diff --git a/drivers/staging/media/atomisp/pci/sh_css_version.c b/drivers/staging/media/atomisp/pci/sh_css_version.c
index 3ef690d6f2cf..fa6de61e4995 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_version.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_version.c
@@ -31,7 +31,7 @@ ia_css_get_version(char *version, int max_size) {
 
 	if (max_size <= (int)strlen(css_version) + (int)strlen(sh_css_get_fw_version()) + 5)
 		return -EINVAL;
-	strcpy(version, css_version);
+	strscpy(version, css_version, max_size);
 	strcat(version, "FW:");
 	strcat(version, sh_css_get_fw_version());
 	strcat(version, "; ");
-- 
2.26.2

