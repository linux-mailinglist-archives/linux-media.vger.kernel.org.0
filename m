Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 25E5B58A45
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726557AbfF0S5K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:10 -0400
Received: from mout.gmx.net ([212.227.15.18]:50015 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726480AbfF0S5J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661814;
        bh=6ZFvvnoUoNYJ167DymQmDLXQrXXbVJGmoz5xkFUFkxo=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=c/706gY0UgJYyKs8+M9mLDm95snT8ou0/+k7AY02/q20EFG8UvMBWwXxdHm8kiaLO
         nQQUwGTgzB1cK93HERpct22ndA0KGxjcN94dsH4SbYVDv2JRzbgcCUDJtzlD0n73dl
         mEsw6OEmBzhpYD6vXrYNrZi3eHpeeJB1VrCHWQsk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MexFh-1hvkuV23UP-00OY5a; Thu, 27 Jun 2019 20:56:54 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 15/31] staging: bcm2835-camera: Ensure all buffers are returned on disable
Date:   Thu, 27 Jun 2019 20:56:12 +0200
Message-Id: <1561661788-22744-16-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:O5HYnB3cVymPrHoiHasYk5no3ykdniffUN7zAl1Rg8DafcpG+T4
 bMmsrtIPQWVMTk6RRq7LYJc2xvruBTi45jIn/zlwKzmn66kZyPE8CQH/Quots59VbICXMDG
 mGu+nBwhKtD4bnr7xQhkBu8YRzu0RArdoKdnmFkBx+C7LNRROAJl2bNW/B7zdoKYAgcHe4X
 ofyLC947wtCBd9WRF2v/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:9s8AdhaoNL8=:3lw3QTv8BeSWT/9P/JphVY
 rwMfz8IiukzeYAHGgsC8dO7EvdYBP6MiZMtCsmT8V+aWwzPEWB/yofwLfIYBD+yX+MdGrqIAd
 Vbt6ngCRtAZomwSXU2rxk9yLlM9gC4gC8WHN3Zg9d5whYlPYWQuyghpUe1uEkLlKKFjBsJE9d
 q/bM3HWaNhMqx8vdXD1U66T3/bWy5EO7as+hyMLsVm0d99jc+1GaV2M1X7F3CoJoEpzJUiCmN
 23yBEVfaf3VXY9iefmcjsCF3W+4+SJvTDvthy/FtnqRWc1Zq9vDre3swZewFDV6d2IXOxbzzo
 iGfa3rxLjzbdbe/NlUS5xDUXVejEt/TXs9TZaU9l3Rrwe7UwbYFpYmaKxVNvtoYzeuDUzlewS
 ZqidhVs21joVa20WJWOSAtayfgEwK1djFVXO00/CUlVtPZ5uS6k7iwxpM9JGUuKOzSIWckYG+
 aQmFmaceFI9BV9waZgQZV2+GlgFW7gqqdlBo9B5uODBKdlF4v512UTsktfQjnL/WvKCREh+CZ
 0ZCbf/6lg0V4feJilrmP4DzWc4mcZ1BR6huHNorWXBVlYssYku5rF59jDtmSphUntaCdtMY+4
 a5SyHT2hlesoBmSSyGsrR6Gqid8hKwPQtBk0mU7ac29s2uWTdjyO5dnS2FKEEEWhHsJfyNTgf
 UWGhO8CyFdslm2abEoj4Ne0IQPUYZ7FUaimyYktzAqeFO8Zz19+AA5qklHdA+zUva8lPBDMe1
 wXA5CDX72f8HCNABtWP3/0yDHGyZvBkqRC/77GfX9NJkOysA1u0uTT1YEdjTqTUGqYWQIKVMp
 174QzoPb3Mr6BfRgRVyEGXSFWQv7CBJNJauVYhWFz4LxhdiAbgM3GZKO67iHc8RcqXTKlQqLl
 ep6U0EHC6v+YzfdaU+sSsFgaTwvxPF8HTwdaR+PdgM3E/uWnlBvnFeN18xb/NYrr4FNU5/rK8
 H8RGYrQxmn9QhNFC7NSL2qFK9nkNzkoh+kOIg7v5cB1BzX/vzO+/r7q6APWHn5Oo3OUyXF/dH
 mSH1B0nGyk+gceokqYh4aJcslHTT3ZB6BmeznLX+eRjA8epAa6sXxZ752CswN8VDrMFtx6Tvr
 0K5MiHbDdhCLjU=
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
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 22 ++++++++++++++++-=
-----
 .../vc04_services/bcm2835-camera/mmal-vchiq.c      |  4 ++++
 .../vc04_services/bcm2835-camera/mmal-vchiq.h      |  3 +++
 3 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 4968782..36eb4d6 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -595,6 +595,7 @@ static void stop_streaming(struct vb2_queue *vq)
 	int ret;
 	unsigned long timeout;
 	struct bm2835_mmal_dev *dev =3D vb2_get_drv_priv(vq);
+	struct vchiq_mmal_port *port =3D dev->capture.port;

 	v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev, "%s: dev:%p\n",
 		 __func__, dev);
@@ -618,12 +619,6 @@ static void stop_streaming(struct vb2_queue *vq)
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

@@ -638,6 +633,21 @@ static void stop_streaming(struct vb2_queue *vq)
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

