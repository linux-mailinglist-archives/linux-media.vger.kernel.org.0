Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CB41D58A56
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfF0S5M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:12 -0400
Received: from mout.gmx.net ([212.227.15.15]:44105 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfF0S5K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661811;
        bh=lUdBNb/xOMYCllKOZYy4V0wd1rtgfpcEo0fxiR8IyK4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=jNLvd5ox/RcG4p+gqkIHiXg45K9W3Dj4ZxkIKsXVGSazZYmRY9A2Xi2h2M8rRyyIl
         wkhOCVSRxNlg91gN3X8uDpNIvJHrYFrVomK2iNQp9KAUVFQGVDSGKC8YaWeJBj9Jz6
         MmzfhUSxNBvgTnhE1EpPxAsxmSIn4DB5zvFCecm0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MDyil-1hmNWX3UOF-00HMIO; Thu, 27 Jun 2019 20:56:50 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 06/31] staging: bcm2835-camera: Return early on errors
Date:   Thu, 27 Jun 2019 20:56:03 +0200
Message-Id: <1561661788-22744-7-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:2Pe+ZeRMyfwAHl+ea1MX8XyHvhuOqcTh6ymq0RjberPmkWCDDFm
 heYR+ticlyINVHqyRz4DaE+LasE22v7lQ/7wTHQBbsxxR17DCbqjwSEhxGy1x1zUYP8mP85
 K7juUAPczpzPfi0XqaojFoTY/G9h1jT5EF/3MWu0I+wEaj8YQ/QuRi2bS1t+aPlKOxhiwNt
 hFJj/tKeyE8OnzSqEKTVg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:sV+a52IHZ7M=:tj7Urv2CcxzNYOLBRwLoEZ
 AqMoY4TgtX9aM0dPopTzfqk6Y6STnQuC5nNHHrBhsYI5fa1QbFOJh2Yn9dr74oteca8m85N//
 4R005ew2EhxMsCiRjFtbPiCyFhfmYkEKbOxp7rQYfZ1Mhu/5lJl1SKaGZ7c1k5qzFvzNX9xp7
 YVUFdsrBOBjh1a1vhjm/jvMRgE66KeL+gCwvKJMWipAmvN+5Y3+vsBKg0ed8Xan9qbOX1tDsS
 mIkeuwA79Od5xzk8xcd6qPfhXIRCHpRjdQrClvAi0jTZ8l9z1f9eWTLsptgo19JSg4xVueMfy
 I98zY74dvzgnlf0DECSbPWA3/QxjEFBxwjHApwj4bO31oJdQ9h/x7mUskAlXM9kKQfQNf1Coo
 ocPE/1d6GHjWoKXtykBN0JTfdH3OwFC07Uv/c3xa9THsbhzxrccrzARkvd/mJG6zLXg3VrOs7
 2Ybp9fADHbBMzdJPDzufgPEAUxY26Ix8lWnJL68ku3bDXP9s/qZsWVvotqR77RwgDpctTP3en
 VZOZJefmg1x4dFHJmbMIcvbmUGuTdQxWFv2GOXANV6BacVvVbXLMU5SuD/F5IwSDyuW3EJh7O
 mLmA3rUR+dXRZYGOfCNw3jN/cLSJegMIbs2OLKXeinwZcmMZvbS51K7GwbFm60EWeFAx22plC
 GaZUPs+/6MzzWiyKl2yrKyAzH9QmN95zvkiQCHBtnuoN1ElS6aJA9q6uw/kQr7O4TR8wsx82c
 yH49XMhBVg+QJA4WiUZo/Ygo5WrCf04ClzC7U3qPMksjqyx6ljwwTqosHrspcCKRUOUEB08HD
 4nAZ1FB5xtVBHNfwnO1/PQcDjG4rtVlf/AB79vhuzNrFoP6YLLjwecD2axF36SGsBGdljdJhH
 bCLvG7kHFrMdKFER19nWGrY7v70y3W2hcoVV1k2DACnN81co21zkcvhSIeP10/zEVgb5bLYta
 xdiVHVCw8Lca0ad6dW84jbsUEZ/rp4maisyLyuNkY+If4L4OzQhkDeXPQSSuMPjhzLm8Wtazv
 NZhmK/Wnq/4i8JAkJFviviQnH97Vi8oXaYaQDiIFJvCOGqHNr2RA5418+OzhVEzvcCdTayOLL
 O145FrnK8b6AkI=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix several instances where it is easier to return
early on error conditions than handle it as an else
clause. As requested by Mauro.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 109 +++++++++++-----=
-----
 1 file changed, 58 insertions(+), 51 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 456b686..b597475 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -334,7 +334,9 @@ static void buffer_cb(struct vchiq_mmal_instance *inst=
ance,
 			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 		}
 		return;
-	} else if (length =3D=3D 0) {
+	}
+
+	if (length =3D=3D 0) {
 		/* stream ended */
 		if (buf) {
 			/* this should only ever happen if the port is
@@ -357,56 +359,59 @@ static void buffer_cb(struct vchiq_mmal_instance *in=
stance,
 			/* signal frame completion */
 			complete(&dev->capture.frame_cmplt);
 		}
-	} else {
-		if (dev->capture.frame_count) {
-			if (dev->capture.vc_start_timestamp !=3D -1) {
-				buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
-			} else if (pts) {
-				ktime_t timestamp;
-				s64 runtime_us =3D pts -
-				    dev->capture.vc_start_timestamp;
-				timestamp =3D ktime_add_us(dev->capture.kernel_start_ts,
-							 runtime_us);
-				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
-					 "Convert start time %llu and %llu with offset %llu to %llu\n",
-					 ktime_to_ns(dev->capture.kernel_start_ts),
-					 dev->capture.vc_start_timestamp, pts,
-					 ktime_to_ns(timestamp));
-				buf->vb.vb2_buf.timestamp =3D ktime_to_ns(timestamp);
-			} else {
-				if (dev->capture.last_timestamp) {
-					buf->vb.vb2_buf.timestamp =3D
-						dev->capture.last_timestamp;
-				} else {
-					buf->vb.vb2_buf.timestamp =3D
-						ktime_to_ns(dev->capture.kernel_start_ts);
-				}
-			}
-			dev->capture.last_timestamp =3D buf->vb.vb2_buf.timestamp;
+		return;
+	}

-			vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
-			if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
-				buf->vb.flags |=3D V4L2_BUF_FLAG_KEYFRAME;
+	if (!dev->capture.frame_count) {
+		/* signal frame completion */
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		complete(&dev->capture.frame_cmplt);
+		return;
+	}

-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);

-			if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS &&
-			    is_capturing(dev)) {
-				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
-					 "Grab another frame as buffer has EOS");
-				vchiq_mmal_port_parameter_set(
-					instance,
-					dev->capture.camera_port,
-					MMAL_PARAMETER_CAPTURE,
-					&dev->capture.frame_count,
-					sizeof(dev->capture.frame_count));
-			}
+	if (dev->capture.vc_start_timestamp !=3D -1) {
+		buf->vb.vb2_buf.timestamp =3D ktime_get_ns();
+	} else if (pts) {
+		ktime_t timestamp;
+		s64 runtime_us =3D pts -
+		    dev->capture.vc_start_timestamp;
+		timestamp =3D ktime_add_us(dev->capture.kernel_start_ts,
+					 runtime_us);
+		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+			 "Convert start time %llu and %llu with offset %llu to %llu\n",
+			 ktime_to_ns(dev->capture.kernel_start_ts),
+			 dev->capture.vc_start_timestamp, pts,
+			 ktime_to_ns(timestamp));
+		buf->vb.vb2_buf.timestamp =3D ktime_to_ns(timestamp);
+	} else {
+		if (dev->capture.last_timestamp) {
+			buf->vb.vb2_buf.timestamp =3D
+				dev->capture.last_timestamp;
 		} else {
-			/* signal frame completion */
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-			complete(&dev->capture.frame_cmplt);
+			buf->vb.vb2_buf.timestamp =3D
+				ktime_to_ns(dev->capture.kernel_start_ts);
 		}
 	}
+	dev->capture.last_timestamp =3D buf->vb.vb2_buf.timestamp;
+
+	vb2_set_plane_payload(&buf->vb.vb2_buf, 0, length);
+	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_KEYFRAME)
+		buf->vb.flags |=3D V4L2_BUF_FLAG_KEYFRAME;
+
+	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	if (mmal_flags & MMAL_BUFFER_HEADER_FLAG_EOS &&
+	    is_capturing(dev)) {
+		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+			 "Grab another frame as buffer has EOS");
+		vchiq_mmal_port_parameter_set(
+			instance,
+			dev->capture.camera_port,
+			MMAL_PARAMETER_CAPTURE,
+			&dev->capture.frame_count,
+			sizeof(dev->capture.frame_count));
+	}
 }

 static int enable_camera(struct bm2835_mmal_dev *dev)
@@ -785,27 +790,29 @@ static int vidioc_overlay(struct file *file, void *f=
, unsigned int on)

 	ret =3D vchiq_mmal_port_set_format(dev->instance, src);
 	if (ret < 0)
-		goto error;
+		return ret;

 	ret =3D set_overlay_params(dev, dst);
 	if (ret < 0)
-		goto error;
+		return ret;

-	if (enable_camera(dev) < 0)
-		goto error;
+	if (enable_camera(dev) < 0) {
+		ret =3D -EINVAL;
+		return ret;
+	}

 	ret =3D vchiq_mmal_component_enable(
 			dev->instance,
 			dev->component[MMAL_COMPONENT_PREVIEW]);
 	if (ret < 0)
-		goto error;
+		return ret;

 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev, "connecting %p to %p\n",
 		 src, dst);
 	ret =3D vchiq_mmal_port_connect_tunnel(dev->instance, src, dst);
 	if (!ret)
 		ret =3D vchiq_mmal_port_enable(dev->instance, src, NULL);
-error:
+
 	return ret;
 }

=2D-
2.7.4

