Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDF75AAB1
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727047AbfF2MOf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:35 -0400
Received: from mout.gmx.net ([212.227.17.22]:51089 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727013AbfF2MOc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810450;
        bh=PsXPKTFlFy3F5v1GrxunrIbc0Yz6bQq+zN7/aiCfhr8=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GGL2Cui21skezh03MLIAqtwX733RXjVzL25OHafdZFiP/lnXUEexKeljJZ/frWJGw
         X/U2oguQkQyTskiVWF22rRPqGC2mjA6rPePYzjnb7oU+tQVeTKEDk8xUetq4LZ9NqD
         jL97VwTqXUf3fUWgudrDCMa5iSXtS8FkU/YFIxyc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LymjL-1iaY7h2Y23-016Alh; Sat, 29 Jun 2019 14:14:10 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 14/29] staging: bcm2835-camera: Ensure all buffers are returned on disable
Date:   Sat, 29 Jun 2019 14:13:29 +0200
Message-Id: <1561810410-8829-15-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:wyjbWJY8Q2242ZTH+m/0IHN6J/mB8YMeACQ9qibx2sJtIw+WokY
 7mCx/PHEVXIKhMLT7IlMRXaxgYIXpwGDMVjEPG6FfGQHfuIf/v/BUFKJE+o5kWBLZgN/VtU
 oxY2Av5a0RtGwZ7eJ9d814JeFG+UitWBJoaBB1F0dY/jFXQMz8lNe3j9JZDZ1jIy14sq9rg
 k6RAx/moRh5AoRPzuP6qw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:LT2QB84/kq4=:8vlHi/aT3jOjYqLyYGym3L
 LHJpVf59moRvH11N7E1MxS+r6L1EwAd0rQRwPzUv6KLx6b7tZE7ZUCfqWENr/skXle6emQaP6
 pTizpwXDjLYHbIWz4fOjEhqJqEzfStD93aqIWX95DNObnwwgvQaF9kWj64pGSiS3DafSQ7Hhk
 hy5lyKeisOrfsiXm35JKOI5RA3lobbSWBqiTT8pPd26LJX71hDjga2O/Z0rlRavxMMnwRPWhX
 lWdOq2Y+5v5a4OlvMFKlk5ig9lpmc6nkcfnfbpUism0s9qBP9IgnXCjWwIyhTplQrbPIh7ldL
 LSycy1RSb6PJInodBNMrV4d86kJkHMZPVzRUsr5voClqlytgjGj/YLOS2aPPG4XjyRxHMb5dz
 VwJc6XcJH1D1P+xY9C3PdQRb8kifoWx/MAg/jIEFiIFyg74872VpdT7Ur8XSyKyq+0yx0lQT3
 yNdDVzVyuRyWtKV5A4uYpFqy4lH2RoTwWnwRqu60rGiZ+MNRbepzkkBinkkzoFhY6XRz+l+2u
 N0JZag31x7Wk+cLQN8CAStwSGIoUbUE9OI30v6cACXyJ3Use1+UthaZIp+SiQEBR+NskjGtaB
 p1ZbuUHYPaclPemNqWuDRCaWh8/5NVgpwpMvacmqACC+WzGbk4cpxIh6Qk2404gOwEcZy395M
 6aV/zi8FPfFDC03e8k2Tg8uZLZaWOP2pm6ZJmwyYOl84TBWo86yVEDo0BIkLmaYbaTBGze8OF
 jZz2lfdRIsLIoHMTMtJTGdvTku3RDDchWacU6vR+OrmM4ZVhqZXCA5NTbrc250yXkuS/9P+kv
 TOLmpuMySlTSgxrTnoc52j2YO+fOS4/JxenTP1JneqT8XEKiNWEX66Kzgl2edC6KYNstERRUl
 DASFXzngY3bWWLPybrvx+Cda57ASWp6m3eM/n3gR/3II+uInhF+uky364lm9tG9hvBLbHBTn1
 /bopLBqahnpJMNK2mOkDezHCp3lvczZjk+/N+fx/cUvxYBWG3I71VJ1N1u4tpOviSQQDPpbUf
 b/9fFIF+/mrL+CuLIjpcLLMgxtunk1pjLmSeLBctYpwmeaTp5m9CTjfXV2r15D4PCJfw69GIf
 Tm0U00qxR8gOgg=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

With the recent change to match MMAL and V4L2 buffers there
is a need to wait for all MMAL buffers to be returned during
stop_streaming.

Fixes: 938416707071 ("staging: bcm2835-camera: Remove V4L2/MMAL buffer rem=
apping")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 22 ++++++++++++++++-=
-----
 .../vc04_services/bcm2835-camera/mmal-vchiq.c      |  4 ++++
 .../vc04_services/bcm2835-camera/mmal-vchiq.h      |  3 +++
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 5ca644c..296f4f0 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -584,6 +584,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	int ret;
 	unsigned long timeout;
 	struct bm2835_mmal_dev *dev =3D vb2_get_drv_priv(vq);
+	struct vchiq_mmal_port *port =3D dev->capture.port;

 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev, "%s: dev:%p\n",
 		 __func__, dev);
@@ -607,12 +608,6 @@ static void stop_streaming(struct vb2_queue *vq)
 				      &dev->capture.frame_count,
 				      sizeof(dev->capture.frame_count));

-	/* wait for last frame to complete */
-	timeout =3D wait_for_completion_timeout(&dev->capture.frame_cmplt, HZ);
-	if (timeout =3D=3D 0)
-		v4l2_err(&dev->v4l2_dev,
-			 "timed out waiting for frame completion\n");
-
 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 		 "disabling connection\n");

@@ -627,6 +622,21 @@ static void stop_streaming(struct vb2_queue *vq)
 			 ret);
 	}

+	/* wait for all buffers to be returned */
+	while (atomic_read(&port->buffers_with_vpu)) {
+		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+			 "%s: Waiting for buffers to be returned - %d outstanding\n",
+			 __func__, atomic_read(&port->buffers_with_vpu));
+		timeout =3D wait_for_completion_timeout(&dev->capture.frame_cmplt,
+						      HZ);
+		if (timeout =3D=3D 0) {
+			v4l2_err(&dev->v4l2_dev, "%s: Timeout waiting for buffers to be return=
ed - %d outstanding\n",
+				 __func__,
+				 atomic_read(&port->buffers_with_vpu));
+			break;
+		}
+	}
+
 	if (disable_camera(dev) < 0)
 		v4l2_err(&dev->v4l2_dev, "Failed to disable camera\n");
 }
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 0b95723..4d63176 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -246,6 +246,8 @@ static void buffer_work_cb(struct work_struct *work)
 	struct mmal_msg_context *msg_context =3D
 		container_of(work, struct mmal_msg_context, u.bulk.work);

+	atomic_dec(&msg_context->u.bulk.port->buffers_with_vpu);
+
 	msg_context->u.bulk.port->buffer_cb(msg_context->u.bulk.instance,
 					    msg_context->u.bulk.port,
 					    msg_context->u.bulk.status,
@@ -389,6 +391,8 @@ buffer_from_host(struct vchiq_mmal_instance *instance,
 	INIT_WORK(&msg_context->u.bulk.buffer_to_host_work,
 		  buffer_to_host_work_cb);

+	atomic_inc(&port->buffers_with_vpu);
+
 	/* prep the buffer from host message */
 	memset(&m, 0xbc, sizeof(m));	/* just to make debug clearer */

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
index 3498555..1750ff0 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.h
@@ -72,6 +72,9 @@ struct vchiq_mmal_port {
 	struct list_head buffers;
 	/* lock to serialise adding and removing buffers from list */
 	spinlock_t slock;
+
+	/* Count of buffers the VPU has yet to return */
+	atomic_t buffers_with_vpu;
 	/* callback on buffer completion */
 	vchiq_mmal_buffer_cb buffer_cb;
 	/* callback context */
=2D-
2.7.4

