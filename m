Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 989D75AAAA
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbfF2MOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:30 -0400
Received: from mout.gmx.net ([212.227.17.20]:42317 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726906AbfF2MOa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810449;
        bh=2vMmB60hqr3zxMDs/2xUlpIve2eQnaNGGEk/RnKtgqI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=hryCDATcdajfsa2L0v+1NRa6wMbUF95A2u4SMfsqcHQhewuM6Alof/qDnrPRaHKqW
         Qpm7fh9GBVsD18jSm0621o7vTkMBfXBI+yAeiS2xl/oWmW9khOE7X6QQ9n/thpr/4Z
         dtYR2QatwXEOE+1AvzKo65MWj7PkO3rkppPd+Lic=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LhwAY-1iKOgN1HQg-00n8LY; Sat, 29 Jun 2019 14:14:09 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 11/29] staging: bcm2835-camera: Fix brace style issues.
Date:   Sat, 29 Jun 2019 14:13:26 +0200
Message-Id: <1561810410-8829-12-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:xg82IR/YrwzDKkqe0xrUSHWdnUCYSrOu/C4kVV5IZoQAEU+xv4w
 Cb9T95Vs//MaV27yrM58adcxfOUBiDeECBh8N6AzgP3k/vomS7kGutCoyqYIkKTQMnxSty3
 AWnxw8xECdE5LymmoScdh8/tIqJfHbZBKjQFuWiP6boqtMbDwy3pmT1Ehv2D7l4/97iWsJf
 ht7cz52+UZW7PgtVbSIoA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:zD7mBSQaAx0=:jGmpEMPg9ZYJO67MKaSmFL
 8kjek2SG/fuUHrN0UkD0cYwhvIbH0L3rCW0OCk+jG1/Ric3+E9jaCDh+STIhPYxYNiqoCvn4P
 aqDIMdlD3dGY6nd614v46QPIrEeC/TJAQq+jTHf4PNpWAIR3B94VzDQMKFtJxUFlkLuFy+6mE
 yA8sphZ1lm73n3v73wF7kyqe35+lgw0rCG5PQ7ebnThakwbpJ6GIUYF/ZyvmEFg3oiY88PjI7
 eF8YYmY9n3dP2mXKezA/tUyY1xeLv2Y0J/Qjw6SklkgVn3vl1qNBj8JBOTLoQWQ5FCfW0lLAT
 cMH0GeQiV2493m1rZuMF+4E/NC0a9XUmNd5oNpghPiwVj5cBVlO+RqSiXglt/iMDMyR7QxmLi
 s8irWsZQ47A4Gp8wYWiK+zBBwam/udByYVIu5QNgJLJGI0QpSt6ks1q6MUeLBrO7qQvobzibC
 tD51bylGKFHwdd/iPBnHZgx6VVhVBthsv6ar6QVVWMC1Lt3rfZaDkVywYqlZTovPjzg+6/Quw
 QMX9LXsASPiXz0NWJgy3xgtZ8XVE+JQywWdAgf3W5wvNlIPm1tHBlaJHQ5emgthn/JI/AAafz
 VJbHIaUuFs0PkhLgpRWFXIeqSlj3AesIw/luiEKyAk515sbkl3shR8TuVoUW5uhZfxe+IeY6Y
 9HgBg2Zuk8NgAvbpdZAQHx/4Wnn6ERCT6GecQZNM4tSnmYRWyvaqtnq5cxE/gKWs//gSgZJYg
 Zdjt+6sedlRd9Zy4ODtIG/DhIQZadUyOVJJw5kfIB0Yp+9sM8PNYzG+fi20OD/6e9YKeYb9xD
 +543KVos5qrSoKxPpA+tCQhp/r7v1QdYDHgZeQpaBJa+SIn3J/o20UN3ulk4/jAKUY2p9yQb/
 C5pRpa8AavYiKI2nXPxo/NhaIPSnN6Hc0uGywv1cFKNeETuiF3r6KmTsXykIIu4/0DHlpXoN5
 jMY/3NHyvEnIsof9aMtbwOvXU9Ce8eDIhSkis7BXMU48RejDPlh+cAmARHnrmkRg7T9aem4Ry
 KhwwoOkxfzW4XYX9q0nUS/U7JRA27bGtYZZ8nrKncz98FW8xbrgyqFy5VjshXTIU2mcKkdfxM
 k9F4iYn8BsLu1o=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix mismatched or missing brace issues flagged by checkpatch.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 3 ++-
 drivers/staging/vc04_services/bcm2835-camera/controls.c       | 3 ++-
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c     | 3 ++-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 753c3cb..8813ffc 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -543,10 +543,11 @@ static int start_streaming(struct vb2_queue *vq, uns=
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

