Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 59BAB58A49
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726586AbfF0S5N (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:13 -0400
Received: from mout.gmx.net ([212.227.15.15]:55643 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfF0S5M (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661813;
        bh=y9U91GGxjVzyJQpb1plbYIEJEQmZ+InsHm6KQ2qTC64=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=OfiHhM+ZsYHf1e67o0JonceiUwMajz6I1biGNnKCIzTUWlhpKtvFAbS0jL7jMIeEC
         kdMGRk2dXpquInZbyq6Op51eFzFPpy37nIaUcUQoCDSVNKFyyBIYeQcS3/EPAFxGBT
         o98cKSygwS9c4BHXO3TEOOF/cjRurA0wz/Qf1Cy8=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M1msU-1iaKvX1H6Q-00tm2j; Thu, 27 Jun 2019 20:56:53 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 12/31] staging: bcm2835-camera: Fix brace style issues.
Date:   Thu, 27 Jun 2019 20:56:09 +0200
Message-Id: <1561661788-22744-13-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:qVIKql/T/zw8kAu25TQYjRoKyLK87blKkEMQxwagdJRaqd3HSNg
 nnBxoYrPsVk+jLPDEdhmy+rNpT9ASf7hytS4IN8naiT4ma0wSIOLg0851yvLvoGvkEdJtlW
 oNAI6pBO2Jn10Hh0YCRGjyKwmLgX5Ncb4Zsm5ob3Tg4d+jo8kWpq/xfgZcXATzcm1K+p3EO
 L0TthjF9lznuR17YGuEYA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YI/u3WTu1tU=:KE6ESASlgMx3wbH0VlbqbU
 pI4QSiGkGMmyL4rGdwxG9C9nl03vnI60JEeXXaFFvUiot6U4cl6yzgegf25+05osESNv0qZDj
 PJtIbOu9GykDcvDyzIy5vTy1mHbrazirRPRndDdLaKxws9GM1S9svKDQ8gtynd+Lt4/itEf4F
 9iQmf85+j9NyVi6pCHGCxnlLe3TPRjRCvWh5AyCfYUj+1O4nTXaZwbm0g40Niz9ASStGSzljc
 dlaFPYG63IHNSJ7Qn3iLE7YvnoFVWWOJ3TDYA0RbZUNYKOYNri2i5xGYp9EoRfKi2lg0OS9q7
 P09fH+XSiqpu/H6GDJzQUwA9qS8Dj0m0eedW72TvAsmeU0YiCjWhSmshY0lGhax+pkhtngin+
 be2MVOMMda4obbkRuNeuoyfcFB6qbuQWDDceuJ9PHtpMfFCmkRIEiSEYg5JRAS0xOj4npA00V
 iRp3YpmMqien3Hk9PECAeBazpYNvhLGNMrzJBx/YhDWfwt/aKUj7L4d7k0vy7Hq87aGusUSfX
 rXGNsC7xOukSFPwyML/kvPForYajCkEIXLz6CkUYm1RKBfKy0dUDLp1gq14DpnKTtUDV8Wqtg
 mUVOBmrN5t5fSPVaV9S44rBENi/lJ103GWwNb4sMTDWbGgDdOUsBYCE1KoGxrXfxWwpmacYmT
 SuuXLg27Hw9zMne/WVYo5GtYoZiE96De0dXZyKQGzWP1qhCsIQYAUGjrSZOAYBcWzqzCRIguF
 23XvTPcI3087KAJQRqud4J24HhUF6kPSRfqj0uSwRVhmNhJUWBtX/1Ua1ZyxKTL4Saul85D/A
 BnPV4eWx00K+sOGoeXPbYfDnIuSEguM5eoD160GKoxDc2sB4bWVe5DxWeKrt5++IQ2Vfbtj/J
 zi1dKZzFhXn9lCQYJnwonJtVsIUhV8sP5xf6c8RS32G0TNEC95rDLJkkIM4Tfx2BV4mAUMfWK
 gQPLjH4ReDT+/cJQ+2T/BYg91IemiTyBUZkdLOmvsRsQLdYYID6IxayR41UrjaJI9TgqsQBU8
 2OBVhAid9BQapWdOUAE3WXbO/P1DNLki/5Kl7cUOX0iWffsAkYVBiTgpCTnu8wiydNoTIoaLW
 5ZfB964EfOUYrQ=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix mismatched or missing brace issues flagged by checkpatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 3 ++-
 drivers/staging/vc04_services/bcm2835-camera/controls.c       | 3 ++-
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c     | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index bde3548..c1f6141 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -553,10 +553,11 @@ static int start_streaming(struct vb2_queue *vq, uns=
igned int count)

 		/* Flag to indicate just to rely on kernel timestamps */
 		dev->capture.vc_start_timestamp =3D -1;
-	} else
+	} else {
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
 			 "Start time %lld size %d\n",
 			 dev->capture.vc_start_timestamp, parameter_size);
+	}

 	dev->capture.kernel_start_ts =3D ktime_get();
 	dev->capture.last_timestamp =3D 0;
diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index b3d7029..1a7588d 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -407,8 +407,9 @@ static int ctrl_set_metering_mode(struct bm2835_mmal_d=
ev *dev,
 		return vchiq_mmal_port_parameter_set(dev->instance, control,
 					     mmal_ctrl->mmal_id,
 					     &u32_value, sizeof(u32_value));
-	} else
+	} else {
 		return 0;
+	}
 }

 static int ctrl_set_flicker_avoidance(struct bm2835_mmal_dev *dev,
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 5175e2c..73cb295 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -1262,9 +1262,10 @@ static int port_parameter_get(struct vchiq_mmal_ins=
tance *instance,
 		memcpy(value, &rmsg->u.port_parameter_get_reply.value,
 		       *value_size);
 		*value_size =3D rmsg->u.port_parameter_get_reply.size;
-	} else
+	} else {
 		memcpy(value, &rmsg->u.port_parameter_get_reply.value,
 		       rmsg->u.port_parameter_get_reply.size);
+	}

 	pr_debug("%s:result:%d component:0x%x port:%d parameter:%d\n", __func__,
 		 ret, port->component->handle, port->handle, parameter_id);
=2D-
2.7.4

