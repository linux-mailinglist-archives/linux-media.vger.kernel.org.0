Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1C8BC44DB17
	for <lists+linux-media@lfdr.de>; Thu, 11 Nov 2021 18:28:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234355AbhKKRaw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Nov 2021 12:30:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:47820 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229608AbhKKRaw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Nov 2021 12:30:52 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id D86BE61284;
        Thu, 11 Nov 2021 17:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1636651682;
        bh=Ue73mybcp2/mEsojqL7x52d9zudKOWx0mXr346D60Nw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ZfWdtpjH4ajAqqrxuFYzxisShfAsFQx4Ix4Of+XanMiPf0QsZ/xPqf1j998WNMHfM
         ojb92CsTLB7EWmBZ8bRtbmlvuoMtnFGCcjuUjsSv5mzeWqJKXGcbh3bOPEbe1mfM4P
         s6WyRx+iY1U1wJcuxgnirpo3f9v+kyqfIc4EvdyW1p0FOfCpsmKRMdWkK9asgzRvVK
         pcy1paW6GNMO21h4WzMLrQu5h/hUBfs3tfS/INUGpkfAFv/18D41jbJEEqhdIhGr4f
         HIatdo0IfGkV3ZsuG40Yh1VbjyxDxgqP3MEichFYuM4l17b9RM58KIgcBBPLt6UkqP
         F/MOHROCacX5w==
Received: by mail.kernel.org with local (Exim 4.94.2)
        (envelope-from <mchehab@kernel.org>)
        id 1mlDrj-0001oc-W0; Thu, 11 Nov 2021 17:27:59 +0000
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Deepak R Varma <drv@mailo.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Hans de Goede <hdegoede@redhat.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev
Subject: [PATCH 1/3] media: atomisp-ov2680: implement enum frame intervals
Date:   Thu, 11 Nov 2021 17:27:56 +0000
Message-Id: <acc7a01f450a790ae7d4f946e57540349bb6025c.1636651027.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <cover.1636651027.git.mchehab+huawei@kernel.org>
References: <cover.1636651027.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Allow the sensor to report the per-resolution frame interval.

It should be noticed that, despite the ov2680 datasheet says
that, for resolutions <= 1280x720, the sensor supports 60fps,
the data at ov2680.h tells otherwise, limiting it to 30fps.

Not sure yet if this is a limitation of atomisp or if it is
just because the tables are incorrect.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---

See [PATCH 0/3] at: https://lore.kernel.org/all/cover.1636651027.git.mchehab+huawei@kernel.org/

 .../media/atomisp/i2c/atomisp-ov2680.c        | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
index d24f8830fd94..428e98310b3c 100644
--- a/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
+++ b/drivers/staging/media/atomisp/i2c/atomisp-ov2680.c
@@ -1075,6 +1075,26 @@ static int ov2680_enum_frame_size(struct v4l2_subdev *sd,
 	return 0;
 }
 
+static int ov2680_enum_frame_interval(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *sd_state,
+				      struct v4l2_subdev_frame_interval_enum *fie)
+{
+	struct v4l2_fract fract;
+
+	if (fie->index >= N_RES_PREVIEW ||
+	    fie->width > ov2680_res_preview[0].width ||
+	    fie->height > ov2680_res_preview[0].height ||
+	    fie->which > V4L2_SUBDEV_FORMAT_ACTIVE)
+		return -EINVAL;
+
+	fract.denominator =ov2680_res_preview[fie->index].fps;
+	fract.numerator = 1;
+
+	fie->interval = fract;
+
+	return 0;
+}
+
 static int ov2680_g_skip_frames(struct v4l2_subdev *sd, u32 *frames)
 {
 	struct ov2680_device *dev = to_ov2680_sensor(sd);
@@ -1103,6 +1123,7 @@ static const struct v4l2_subdev_core_ops ov2680_core_ops = {
 static const struct v4l2_subdev_pad_ops ov2680_pad_ops = {
 	.enum_mbus_code = ov2680_enum_mbus_code,
 	.enum_frame_size = ov2680_enum_frame_size,
+	.enum_frame_interval = ov2680_enum_frame_interval,
 	.get_fmt = ov2680_get_fmt,
 	.set_fmt = ov2680_set_fmt,
 };
-- 
2.33.1

