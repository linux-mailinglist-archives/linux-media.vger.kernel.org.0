Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3AFF858A51
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbfF0S5S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:18 -0400
Received: from mout.gmx.net ([212.227.15.19]:57645 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726595AbfF0S5Q (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661816;
        bh=To7r9Iz4rUasrDMcLbYaTnJm0paSV59R928kdzaH15c=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Eqey5sHrRLAzyiJ01OE6yL3ppSt1FcYXzB6RfFx64URL3NX45K6EDOGBlUPqCazGC
         lrDbf5mI6nwFA9aOU/pLY7E1T5nzdAx9KFMXyvrhEtwpOw3nO2CM1+T0Rw+kUK7MUz
         2sPXa7CXpKVBcwATLXsmgfMQrGJXToKCwrQKQyCQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MGBdv-1hkAbH0NOB-00FARI; Thu, 27 Jun 2019 20:56:56 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 19/31] staging: bcm2835-camera: Ensure timestamps never go backwards.
Date:   Thu, 27 Jun 2019 20:56:16 +0200
Message-Id: <1561661788-22744-20-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:DiwyDx4wevMKzeWB2UlF1MZfZbyv3QEeiXD796J0bJwPbdVH/ek
 ctM557d2Y+BqPzZKjGQs3xAh3ukDjRC2XsDxVYg6UsmGZZxjCuxapiT7oeAz9bZqhboCLWA
 Se58s3lK3hZw2wgngI1oA3Nx/mz6FyblzsM/QlufHWoz94zBu8/r0+z+X/AfOX7ZRDgH/NK
 /qX+oDB1ar8lFYcJT2kGw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:tW9pxrt97h8=:iJMdFfIppg66aRF8YX96Sp
 552WG4My6NvYayu2ZdNWSfhmmkyBPOlq2SL0wyBeeegYc4AZ085PuFswuJzXW2ZDmRaEC7eiy
 iMfctYAvKtMHvXISeWo/MfOt3jK3G98W/6MoAeRyhwzCvOqt6vMV0Z4OtPX60r6Wr6UM2816e
 4Qtlo6NvtGC4dD5VwSUHE2T29xXLgCjgqPEsORV/O+Jx4vDAwXZKLOKeuiyTbJR+vV8EcFLsr
 JuwtqI3Tlu9JQYhcUXCLqFhYBQTVxwY9rCPKbFjTOopi/E6zRsjNqLa6/DSZQwvukQZsNKLu9
 QwhEjOtympUEugjm783ZGEYB3oRBlrhZjM2EeOIqnHs8bxON2YIqLsdwaPTSkP3jmsPUKIsUU
 cFGbMTS1lU2n93GcAFNhjfGRF0fFEypDXmGCCdRg3o5VPPnvTTCw55Oguzc4YNAR4VDN7gOmm
 YmvDpbho7CBLZp3m0+ExsAeVuVRC3TDC6uy4dqNOeckGerSkDBQdLY1VaAMggsQoE6OKjOQxd
 GWIfbDwhvbxWzDe1lEo7KhJ0D4vxnvI9LQ0JVAfjOM08SPE8PcJhXA/A2ho4neSfV0Kx9C2mx
 rP2C3DjHFOVUvnryORLydeLpXJGKVc7ULOrx7bdS2S/3ceAFXCwdyJhVgX10qevc+RVjpCGkJ
 eYIjUjHqsI0MI/EZ+YHoeqU6SchFAbMmkBeEC68BHgGURSwTIzt77edgU5qwBixB5YUzlz9hx
 t364yVHpXFgCsdyYDAEgTYP9W/TY1dbgXJQ5d1dDX/ou+iiNfaQJ+5S5nm6amB1OK35t811t8
 U9fgO4XCWlnGONw5VbUHwKMFtrObfW1j4mmGyoufcLegpPq/lsCoPlSh7DuabN0sQaibwpcRX
 AxdAW7tJXlPLmZqiButAMf5nXIjQ5m5R4BQFB/849U/QokBty8RE8P6aD7tvFdTUG60Czt4DC
 wWIu7pojgO9lb29x3qKVmu/F5H6FUt2543JBuCqiQ2pGTSl85/YbTkn0bN0J64HryQlP3ls2/
 uQV56jR1WH8053A5uJtALprvOeHnHc8UxZbQGSB8SMPJs5vAXqln9jt6Hh3NQ4xligNLRm0p5
 w43b9HdKbTdL6A=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

There is an awkward situation with H264 header bytes. Currently
they are returned with a PTS of 0 because they aren't associated
with a timestamped frame to encode. These are handled by either
returning the timestamp of the last buffer to have been received,
or in the case of the first buffer the timestamp taken at
start_streaming.
This results in a race where the current frame may have started
before we take the start time, which results in the first encoded
frame having an earlier timestamp than the header bytes.

Ensure that we never return a negative delta to the user by checking
against the previous timestamp.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 9967df9..6205793 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -387,6 +387,11 @@ static void buffer_cb(struct vchiq_mmal_instance *ins=
tance,
 			 ktime_to_ns(dev->capture.kernel_start_ts),
 			 dev->capture.vc_start_timestamp, pts,
 			 ktime_to_ns(timestamp));
+		if (timestamp < dev->capture.last_timestamp) {
+			v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+				 "Negative delta - using last time\n");
+			timestamp =3D dev->capture.last_timestamp;
+		}
 		buf->vb.vb2_buf.timestamp =3D ktime_to_ns(timestamp);
 	} else {
 		if (dev->capture.last_timestamp) {
=2D-
2.7.4

