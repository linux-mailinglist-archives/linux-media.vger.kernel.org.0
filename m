Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC54358A48
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfF0S5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:13 -0400
Received: from mout.gmx.net ([212.227.15.18]:55115 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbfF0S5M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661812;
        bh=zPuVzIwG7oo6cIYjOb93FcXMzly3ELJRL6cmztU+WNQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=QV+WwnWKRTyIriZCQ+RvGKG3Dk4Ujo/cTOatzw3+eObUwolddk6UFqRI68CCuZh68
         EtFRxZrNkce4RXtVono1p7emYHfCY3T/ZVLcZmNHKljxzEFAhD3U1qrS3fzUs50ZC4
         qXIBpl9yOiFL/bPKaX9CLwpUznVXkaxuJ3+QfOm0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LqQzp-1iBDQT0OLR-00e1fu; Thu, 27 Jun 2019 20:56:52 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 09/31] staging: bcm2835-camera: Fix spacing around operators
Date:   Thu, 27 Jun 2019 20:56:06 +0200
Message-Id: <1561661788-22744-10-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:NT/Mec+cri+fykMHmyqvjkqXqGn5VJZ3ZEojfBcXBu9tYhF80KD
 cxSUBLNchH7OlDk2+f4Sxn7aEI/dT2OGsYchfsIO6TzjWFiRJ6og4GVj5dr/7QaVNBjbNW5
 ZBaTcThWYAqN24Xx4K5b0MwHVCliVoxHGD/G3Khnh9YIZ9VSMs/krXArkb+OYXpyu8EDWJL
 6HZCL8HnPLIaJAm+DpWbw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:X0KZXUA+KFQ=:FYJv15bP809Y5HZebAIlBR
 RpL5SdtC0AqGskMrZ53Qkt23k2Lnp18M96ruYUSDW2E+OhJvB1nB4tCdQ8Qc6Vz+wFjHc9Fmt
 7Yvoq32rqjUYg9s1t19fdHOfJEQHqwd2yio9p7Mx4rBB0lhesrhZnfxG162V2NZKOwJ5EFD6G
 yd/L30f/4p7b/Hij+c6T8+JfgnKUCvMdLubFhM1F6I2JUz539b7cqAGeiuJm9p/UcMxrEvGXm
 crEqRfTEGvaBK98Dhg4lhiAOPIGg+weksyBsqSRIpstUffnYBeaAQTXtlDaLi/CS7IjVyLY7R
 4LpmAdlcZChIbdD/nhD7WLflAtSUQjoPNhlkZxPhss821iX+eFQXSuwvd3rwWOAJ8eH3WBmJe
 qMfYUMUk000IsvmYBuPJlfCNIApp88IAd1VaojqvIFBaqGwtR/da8z84VeRE5c++IfPcoTbpH
 fx49obV8vpHNySJdDTPd+VScc+Eg+Ro50oI42w/BI6IYFF3wK9tMh2WoYZyxDcKhAhXxvjWgF
 PQeEJ/qwpc9JaTkZL8AwfuBAEL2czSvUVeDrvSyM2+X9sct0PcEOKZbjAMC3bJw9+a2xQjoRQ
 9zqpZgGAq/zhzkqhgxBKBU9ojET1fIEGmitEA28qnqiKwfyn2b0sGLJcwD1i7MlCs2GcKyLOs
 5BpqGdcnqL6ZwVoxcnoJmgcVhxyKgKSoXVYg0VPxalDIMjKYxKOdTLGEo/hrpOS7xw1bT6s/u
 iT6P5HQJLKdAHGx2N/8AGzSeGfbIXT+sKMnbj6HfHm5leHmViWVGkGbx0NWL9URTzMBAf+YUq
 P5Jcn1TpwmmN53XeQugyxKY9P4FKHQ3HEWmoV+lNBu2F1MQ8951HRCP82Xsq3/bHpYOREnNzl
 sw18VKXn8KKMQz+z0BAxXiR+af0zmhSzxCnQQ6rwXH74pKRwUWWoNpEC3NA34gmG/2Ytt854n
 4FH7TFJF58OtMhAk1vPlnbFOIrXNa1uLrxVdpXiBPbw2dzs+iQtHKIVRrs2HnRnEtbgXjey/J
 wnNq++idhSp9e2egKIthRjboJrvvvPssXEZcdF6vwfgei3cnaWYA7VqhzoSnWsYOGHQ6ayWeX
 riTNMArq39kUkY=
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

