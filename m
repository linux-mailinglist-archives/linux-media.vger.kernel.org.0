Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F12255AAB0
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727038AbfF2MOe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:34 -0400
Received: from mout.gmx.net ([212.227.17.21]:55987 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727022AbfF2MOd (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810448;
        bh=sawqClbmwzP8gOS82jsaIvyieT/CKO+qLtFgq4B5t5w=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QfI4dNZW4xwaLkIHUFAtaoI9avbKQSmL8ZK3VHmFNVb+NBg9F0ZbZqWe06CP63sC5
         /OI2FIZVwKLUGJ3uMgooY5kSvMHkkENz5DwFjwhQGNL0+VG3ryQSj9JGahEBJ29d9U
         dqHq0Q1/kOTQOUPCIrIcmbhqWNZtRLRtFWjM8xnw=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MMkgl-1hd3dw48TP-008WkP; Sat, 29 Jun 2019 14:14:08 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 08/29] staging: bcm2835-camera: Fix spacing around operators
Date:   Sat, 29 Jun 2019 14:13:23 +0200
Message-Id: <1561810410-8829-9-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:uZlFCPIvwSrwoy1+6SmtOF/rdR78jw0SmsjXI8sYKvrfE3z+oes
 Xj/6YtX/idHia93ZrvoMnttlVTmSUt1DBmvmLpFN7ga4dGlwlkhehguKQ7m9FHDyEXxJSqz
 +LGBlbQ+DlJ3vdBF2L4pwIu6iohCgU5mhXV9IJx3DaucGCyDYVQOxrb5gxtK/P5xCLx1O+/
 biVMshJADUxXkuEAQWNHQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:F0c2/fsffzY=:T+2/Ooa//clQAoTZkRKW5d
 PL8T3lXqlO1H68AesSW32TSfbl5ldcK7O0yNWeB7quuDpI+0TOIhquBUb80FyYUj/wWmZIz1q
 SzmcH34NUiVTpVOs/62j0K4U+Prl/4Nen0TYY6kQxSmFswsD3+pYwp+zMJYyipHtAYSm/MCAU
 v/XPTpiXNh28Yd9xHYQOTWWnsauZx55hG51bfKnbD0+qZp0ahE2Xb7PATrCaHsvt8yT7xE3Mx
 U+4/p7NtTivJhRJcoDkRny6DLtbCJHq9Z3erdPR7kONCybZC/PDKAMhIzCMcSkfm59tUqBMPa
 pX/8f8LL4y7AiliN/QqwF2SA4erg2cFrEq4i2Jdu/fwFjKPHbQP7Ndu0XJ6lXCAqzKL3WoF8z
 yfv0hI+4jF7T9GJfIyhltvY2th8/oDAB9XvGzyZRQj7nmlflF2QF5VY6BgQWwdtgxWrU+MDf+
 O/lyDEG3pAHOHA7G9WD7ZgVjs3aQbVDzK8Orq5XvAv8sXCADqPCR91p1omfkqYd3+OpXJ+WiP
 bivf2skeYQQC6hVaoqrzKdc3G+l0vLZLhaxlmljm+A6XqLh7zOtHKlYgM//sFwGBfCwXPpKDP
 LqGha+j2Im9dDDAz+p3/OhANHg+9wqbUMQz6Iv+n3d52Pnz4GRb4UvDgS/QUwLXxobEXojQVd
 GYTtHlqQxSIiLZRqMzsWObocvYnaRC6OD/BiBlnybMNBruNpHsFNOQDYc2JyPW5bY611zTJlT
 JMVIQ3/1GiYQ3xqThG01xLRCc0A+f1koLNqXDyRcH7Svk56YshijA9+1J1i2zeEIWVWdw1aGO
 YOMA4sLocLh9vPwgiN5s5aeVYqUoBrPVwRktkZH07COMAmx4lqcm/htRPz6hjD88jCDhSXGn1
 lQPBxfU60di3Wly1TMwIh/IqxQFiKNr/WZsLo+MfstUCRoF4QE/meehjC58FhPKYE0iZjVeOT
 sLY5TQB9MomFcPThwBzBj/lp98D6L3g2SStfEk/cWNyulUzNAItF1Dfb9yO6nzCIb9XfKH1sN
 55a+BUfuMtUxwPH/3CL+VH8BWAqcKil/xCMXnglcRSzsIVeZtu7AQGWnfhxBj9UOsaMoU6/6I
 KdvW3tKtw41AN0=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix checkpatch warnings over spaces around operators.
Many were around operations that can be replaced with the
BIT(x) macro, so replace with that where appropriate.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 .../vc04_services/bcm2835-camera/controls.c        | 32 +++++++++++------=
-----
 .../vc04_services/bcm2835-camera/mmal-msg.h        |  3 +-
 .../vc04_services/bcm2835-camera/mmal-parameters.h | 12 ++++----
 3 files changed, 24 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index b142130..e79e7cd 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -1130,10 +1130,10 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctr=
ls[V4L2_CTRL_COUNT] =3D {
 	{
 		V4L2_CID_MPEG_VIDEO_H264_PROFILE,
 		MMAL_CONTROL_TYPE_STD_MENU,
-		~((1<<V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
-			(1<<V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
-			(1<<V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
-			(1<<V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
+		~(BIT(V4L2_MPEG_VIDEO_H264_PROFILE_BASELINE) |
+		  BIT(V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE) |
+		  BIT(V4L2_MPEG_VIDEO_H264_PROFILE_MAIN) |
+		  BIT(V4L2_MPEG_VIDEO_H264_PROFILE_HIGH)),
 		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
 		V4L2_MPEG_VIDEO_H264_PROFILE_HIGH, 1, NULL,
 		MMAL_PARAMETER_PROFILE,
@@ -1142,18 +1142,18 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctr=
ls[V4L2_CTRL_COUNT] =3D {
 	},
 	{
 		V4L2_CID_MPEG_VIDEO_H264_LEVEL, MMAL_CONTROL_TYPE_STD_MENU,
-		~((1<<V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
-			(1<<V4L2_MPEG_VIDEO_H264_LEVEL_4_0)),
+		~(BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_0) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1B) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_1) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_2) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_1_3) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_0) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_1) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_2_2) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_0) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_1) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_3_2) |
+		  BIT(V4L2_MPEG_VIDEO_H264_LEVEL_4_0)),
 		V4L2_MPEG_VIDEO_H264_LEVEL_4_0,
 		V4L2_MPEG_VIDEO_H264_LEVEL_4_0, 1, NULL,
 		MMAL_PARAMETER_PROFILE,
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h b/dri=
vers/staging/vc04_services/bcm2835-camera/mmal-msg.h
index f165ddf..8e0aee8 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
@@ -223,7 +223,8 @@ struct mmal_msg_port_action_reply {
 #define MMAL_BUFFER_HEADER_FLAG_FRAME_END              BIT(2)
 /* Signals that the current payload contains only complete frames (>1) */
 #define MMAL_BUFFER_HEADER_FLAG_FRAME                  \
-	(MMAL_BUFFER_HEADER_FLAG_FRAME_START|MMAL_BUFFER_HEADER_FLAG_FRAME_END)
+	(MMAL_BUFFER_HEADER_FLAG_FRAME_START | \
+	 MMAL_BUFFER_HEADER_FLAG_FRAME_END)
 /* Signals that the current payload is a keyframe (i.e. self decodable) *=
/
 #define MMAL_BUFFER_HEADER_FLAG_KEYFRAME               BIT(3)
 /*
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.=
h b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
index 96e987d..6d21594 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
@@ -23,17 +23,17 @@
 #define __MMAL_PARAMETERS_H

 /** Common parameter ID group, used with many types of component. */
-#define MMAL_PARAMETER_GROUP_COMMON            (0<<16)
+#define MMAL_PARAMETER_GROUP_COMMON            (0 << 16)
 /** Camera-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_CAMERA            (1<<16)
+#define MMAL_PARAMETER_GROUP_CAMERA            (1 << 16)
 /** Video-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_VIDEO             (2<<16)
+#define MMAL_PARAMETER_GROUP_VIDEO             (2 << 16)
 /** Audio-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_AUDIO             (3<<16)
+#define MMAL_PARAMETER_GROUP_AUDIO             (3 << 16)
 /** Clock-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_CLOCK             (4<<16)
+#define MMAL_PARAMETER_GROUP_CLOCK             (4 << 16)
 /** Miracast-specific parameter ID group. */
-#define MMAL_PARAMETER_GROUP_MIRACAST       (5<<16)
+#define MMAL_PARAMETER_GROUP_MIRACAST       (5 << 16)

 /* Common parameters */
 enum mmal_parameter_common_type {
=2D-
2.7.4

