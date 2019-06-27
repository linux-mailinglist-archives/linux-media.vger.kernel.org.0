Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5F93358A53
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfF0S5T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:19 -0400
Received: from mout.gmx.net ([212.227.15.15]:57695 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfF0S5R (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661815;
        bh=xwevpd3UAGKeJbtFyF2EvwHUvugWto7ZUSOWbHEHbAQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=NABCt/6lAnSpd6iJn0ZVtz5xgpg1DEss5JEA5sRnjmvUFvMY4hXMLfnn5D87Dd6Ur
         z1xR/Likh8ZIrYbYxUkdg84vPf4yp86+qIkkIyVXn6y/GavT4jhHKqe0yvHu8smDut
         zHXwOPVn7d3b4EiTyBdWYUHmLYUhXZzPp8aEKmX4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LptId-1iAfj61ApT-00ffZM; Thu, 27 Jun 2019 20:56:55 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 17/31] staging: bcm2835-camera: Handle empty EOS buffers whilst streaming
Date:   Thu, 27 Jun 2019 20:56:14 +0200
Message-Id: <1561661788-22744-18-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:ad5ZMW8ssO/JOMcoPglsVFDcUUPcE+j5mOD1h+5+S9QIq6KEEez
 +F/fWmiSF+kapuxSEKTXwOWP5Se38WYc1OtY1VYgSI/FFD40vMUGeLCNa1azj7bAomoZj9i
 ZdL3oFS1FFj/SLqKJ6BrZGxkaIWpSWrKgy3HzHc1yAAybwsdbBx/Bv2SxIJNTzm69yC855G
 vw2YzvmY+GvrpiH2v8K1A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:EzprZ/Xai+o=:JLVbiZUaBS2wNJFY7emiS3
 wa4Qw/7oJzJPaQIfxATEnsvicsrWhLst2rFDsI+Qt2HmAe4DoXqipaldNRzgkTiIgw+gLDcQG
 p/EmD0/gCAG9isV/wW2LtKuizm370kYQzXLIViLiwLNzHSpLA0/J/JdRT8DUAz0uIlY3Adz4k
 1f2RnIo9Vn+DSO0PrFHa9EPlL1Xj4gXHxgxLc1Sv2rmlkdaogyVCB2D+iScFeNzyKtSezjZaj
 lkljxY+gqtDipKML/kfU1mC9zcASE/Qo6oJe204B6DqTVh1x6IErP7uKSq3zK80SVLl+RfaVj
 GFPNU5oeZ1LRummQPXI2kqN9Z6vxrKfANDomTXX8WxErVAsDoiyyYRHbdB9H6wZXJXwmhYD9s
 d5eEEllnydaa6fa4MsJVOkoEKldON1qUpR3uRLDxme39F7D5/M4rlMn1yo9RMxUEtbdBeZkLK
 XAZWprC0bc6iqk/cAfVBZRiBL7Ki7uXbxgJ/Tqn5/fscjFEMap1ppV0+FtaTBMTY93OSZdN0T
 /t62yRzSC+BhrWVUW5VzUHsTQ+IlOCjCX/AzhSlrjxyayxpEKlqB5R0HYwm7/OhE5ONOn4fxR
 4/bnbXGhScCzxheEJU62NRybJeBfcpcVL7QO9RmGX8mej87sl2FVwatHf+MxuN0gnmxbQOQnx
 RBfbJ0ShmyorMVLmQwpH/NDt3TzsM8vUo33VARhpCEahvhGO2zLTXOGrg+Q8oyIjLycNABpWc
 ZEFdIJG7Lr1eBxfLIceE2zcJKbZ7VAZzNWlierSTs4AoMNItTv4IUvTFmJIq3IvMiMvxlwEpd
 VY/PYFZj+9taP8/F23iEP6PUAcdpwNopjPOIQxuZvmZz+tlmXqBz+JoCJltTOd82nhyltZw7I
 iN3qenf/lk2rsqo6IPiLWWq7t5DHKILKpJMZPhg8u7fkjbrNL5Zpv6Of3wUxi//pvNfVJCLpd
 /+EPDi47fs4Sa77OAVUlwJOPEKXIfKTtK1vLM1/dPwJpxjm/K4UrsBdqpsAiv9ZTY8SL03QY1
 PI/qP+g9iqMPNeOZtOpimOlPfdfSAYw3dTQuZVbLGKMBHWj6zzDbRY/OGziYNHZiltmHAuRzj
 u+wYfJZyBYPA9E=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The change to mapping V4L2 to MMAL buffers 1:1 didn't handle
the condition we get with raw pixel buffers (eg YUV and RGB)
direct from the camera's stills port. That sends the pixel buffer
and then an empty buffer with the EOS flag set. The EOS buffer
wasn't handled and returned an error up the stack.

Handle the condition correctly by returning it to the component
if streaming, or returning with an error if stopping streaming.

Fixes: 938416707071 ("staging: bcm2835-camera: Remove V4L2/MMAL buffer rem=
apping")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c   | 21 ++++++++++++----=
-----
 .../vc04_services/bcm2835-camera/mmal-vchiq.c       |  5 +++--
 2 files changed, 15 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 36eb4d6..f2e951c 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -339,16 +339,13 @@ static void buffer_cb(struct vchiq_mmal_instance *in=
stance,

 	if (length =3D=3D 0) {
 		/* stream ended */
-		if (buf) {
-			/* this should only ever happen if the port is
-			 * disabled and there are buffers still queued
+		if (dev->capture.frame_count) {
+			/* empty buffer whilst capturing - expected to be an
+			 * EOS, so grab another frame
 			 */
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-			pr_debug("Empty buffer");
-		} else if (dev->capture.frame_count) {
-			/* grab another frame */
 			if (is_capturing(dev)) {
-				pr_debug("Grab another frame");
+				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+					 "Grab another frame");
 				vchiq_mmal_port_parameter_set(
 					instance,
 					dev->capture.camera_port,
@@ -356,8 +353,14 @@ static void buffer_cb(struct vchiq_mmal_instance *ins=
tance,
 					&dev->capture.frame_count,
 					sizeof(dev->capture.frame_count));
 			}
+			if (vchiq_mmal_submit_buffer(instance, port, buf))
+				v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+					 "Failed to return EOS buffer");
 		} else {
-			/* signal frame completion */
+			/* stopping streaming.
+			 * return buffer, and signal frame completion
+			 */
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
 			complete(&dev->capture.frame_cmplt);
 		}
 		return;
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 59eb812..d0f7b67 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -332,8 +332,6 @@ static int bulk_receive(struct vchiq_mmal_instance *in=
stance,

 	/* store length */
 	msg_context->u.bulk.buffer_used =3D rd_len;
-	msg_context->u.bulk.mmal_flags =3D
-	    msg->u.buffer_from_host.buffer_header.flags;
 	msg_context->u.bulk.dts =3D msg->u.buffer_from_host.buffer_header.dts;
 	msg_context->u.bulk.pts =3D msg->u.buffer_from_host.buffer_header.pts;

@@ -461,6 +459,9 @@ static void buffer_to_host_cb(struct vchiq_mmal_instan=
ce *instance,
 		return;
 	}

+	msg_context->u.bulk.mmal_flags =3D
+				msg->u.buffer_from_host.buffer_header.flags;
+
 	if (msg->h.status !=3D MMAL_MSG_STATUS_SUCCESS) {
 		/* message reception had an error */
 		pr_warn("error %d in reply\n", msg->h.status);
=2D-
2.7.4

