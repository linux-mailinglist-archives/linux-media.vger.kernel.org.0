Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04CE443B1B8
	for <lists+linux-media@lfdr.de>; Tue, 26 Oct 2021 13:59:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234864AbhJZMCI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 26 Oct 2021 08:02:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:34148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230258AbhJZMCF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 26 Oct 2021 08:02:05 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 539C5601FC;
        Tue, 26 Oct 2021 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1635249581;
        bh=o+N5IbGsPKkryrRuzBEiPgm3mJYskObI6+XvUx6Tjh0=;
        h=From:To:Cc:Subject:Date:From;
        b=fLa5o+qHF0NpCbB0f5KzhCXqhBqzLxKNXZO0P3n/naL4FPk5Bf42WwaLY+ak06sX9
         YawG0ahpC4kT5N47xViTrFhsSd2oTHblnEFeezsypXU0nEGfAfmsI/zUwTz7RmqDkg
         UTdvJUKu58M2ZAkXwZDqNAaWP4ZkKI9V+wCSqsttXmsra+Pd33MH/EX5FAr0TGMn0M
         GxvrJL8qclWDBYeHxuyvzBpAhIsAjiAbtE5D7LcEyHvSX4+YVhi6di93mLZs35BgTB
         boTbYEo5rqYc4u+D6l6THg7CHa6RPa9mY6iFv4SDIBVYncz0mNYBB6Jt+Q1qjiq+2U
         nFcNizBDSxtUQ==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mfL7C-00CBtT-7P; Tue, 26 Oct 2021 12:59:38 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Hans de Goede" <hdegoede@redhat.com>,
        "Nable" <nable.maininbox@googlemail.com>,
        "Tsuchiya Yuto" <kitakar@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH] media: atomisp: fix enum formats logic
Date:   Tue, 26 Oct 2021 12:59:37 +0100
Message-Id: <6ce3630152cbd9ab29e02d560c6e80fb72d0fd81.1635249567.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Changeset 374d62e7aa50 ("media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument")
added an extra verification for a pads parameter for enum mbus
format code.

Such change broke atomisp, because now the V4L2 core
refuses to enum MBUS formats if the state is empty.

So, add .which field in order to select the active formats,
in order to make it work again.

While here, improve error messages.

Fixes: 374d62e7aa50 ("media: v4l2-subdev: Verify v4l2_subdev_call() pad config argument")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 23 ++++++++++++++-----
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index 01c6eda2c3cc..03f53515ce36 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -773,7 +773,10 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 	struct video_device *vdev = video_devdata(file);
 	struct atomisp_device *isp = video_get_drvdata(vdev);
 	struct atomisp_sub_device *asd = atomisp_to_video_pipe(vdev)->asd;
-	struct v4l2_subdev_mbus_code_enum code = { 0 };
+	struct v4l2_subdev_mbus_code_enum code = {
+		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
+	};
+	struct v4l2_subdev *camera;
 	unsigned int i, fi = 0;
 	int rval;
 
@@ -783,14 +786,20 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		return -EINVAL;
 	}
 
+	camera = isp->inputs[asd->input_curr].camera;
+	if(!camera) {
+		dev_err(isp->dev, "%s(): camera is NULL, device is %s\n",
+			__func__, vdev->name);
+		return -EINVAL;
+	}
+
 	rt_mutex_lock(&isp->mutex);
-	rval = v4l2_subdev_call(isp->inputs[asd->input_curr].camera, pad,
-				enum_mbus_code, NULL, &code);
+
+	rval = v4l2_subdev_call(camera, pad, enum_mbus_code, NULL, &code);
 	if (rval == -ENOIOCTLCMD) {
 		dev_warn(isp->dev,
-			 "enum_mbus_code pad op not supported. Please fix your sensor driver!\n");
-		//	rval = v4l2_subdev_call(isp->inputs[asd->input_curr].camera,
-		//				video, enum_mbus_fmt, 0, &code.code);
+			 "enum_mbus_code pad op not supported by %s. Please fix your sensor driver!\n",
+			 camera->name);
 	}
 	rt_mutex_unlock(&isp->mutex);
 
@@ -820,6 +829,8 @@ static int atomisp_enum_fmt_cap(struct file *file, void *fh,
 		f->pixelformat = format->pixelformat;
 		return 0;
 	}
+	dev_err(isp->dev, "%s(): format for code %x not found.\n",
+		__func__, code.code);
 
 	return -EINVAL;
 }
-- 
2.31.1

