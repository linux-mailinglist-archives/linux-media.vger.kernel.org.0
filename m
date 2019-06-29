Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6D75AAA9
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfF2MOa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:30 -0400
Received: from mout.gmx.net ([212.227.17.22]:34649 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726963AbfF2MOa (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810451;
        bh=rIM3Cz1WAKPV0BYtLr0jELwNn1BK7VirmbeWmMyEk3Q=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=AiKFmEsKy4deUoljE7ODH/oe/LorZoaNke4syWVP47iEzWjsVWIfv9JJiNkYP3huL
         1yLYiMnL0m+cuHz5ZEekT4QciIaO6Hxr/rA8Fa/DuRWK9WIPEVB/SzaeytQBZdd0QR
         ADVvdczRUmXXcY483JoVu6/+81VEUYq52m77urLE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0M1FAK-1iaGs7066y-00tDwY; Sat, 29 Jun 2019 14:14:11 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 15/29] staging: bcm2835-camera: Remove check of the number of buffers supplied
Date:   Sat, 29 Jun 2019 14:13:30 +0200
Message-Id: <1561810410-8829-16-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:tad7qdgkQl4RWv6RpdHYArIVesPr8zvsMAid0YbAv94c5hbQZFf
 Xd5Wce7JOaEknJSu9kRrrtJBpHF+eqb4DTfJL/pheuXLMQUPcGw43RRw5zLL6Omw2ur6bN4
 o70QIbb6S3xVJyz0iOiY5nhZ5CeI7GIeheQeNJh96uxLYWH4QCL5i9dEI7rpzCouTjXO8l3
 21wAWCJJQvHAROw8zXW/Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:J27WurzvVEU=:mKcxB0F3zxrgBpjD3Hm/Yh
 XrRWggz/+56tCDUSUgXhJU+XhsfVW0BzFp7s6Pd4Wr4lHdoH2px1FBtlJmTd2sjEd3paZ4TCW
 pW82mbDcNqgpCPkVZyXwLk6bq+PnIzW9lNXC3GPAVcYsl9jjB42yH1a7SwFr51PdVNEOTTOrs
 +yqWG6BpEk4wugZJJkBwjhdl7RU+segMOjTw4FiKUv6gZdXYI+iUP/ijP6LMHQXh1Mw+LOlD/
 ZAcdSD8sDWP0zhIM3F+hHRD1cTfgdBZFNSyN9ISWuKneK88I0mEUlr9in3o49cvtTQoaNLau8
 jWq/ckN7qTSkIvDOlZmOVAQOmpzy4j2qKX8ORLDV9kWCUadd0TSEynuhAkgvg/Bg2fFdm3IF6
 C+CUgtF+KB3uxOFOCrP07he/8Jcrty2QkvCp2f9Os6co50NJrHgeBfZMnU2SP5gCJjtZ09Mc7
 V7YGixvu/yd1u7K/IQXMs2EeEMuUJmbnrLgBgKDcx/X62NJEoctvBEPW9zyd7h1QwiIg3Bafe
 8HHwNRXoiOEFA4ZAFzYAwM+yQD5XZh+xqx/7gVbZI1+7YATSp6HN1Zsk87xUd7OYJYCEaoW3i
 3YaT7KdrMjkAHFjcXOnLSvoevtS7e2xeOT9TsGxC5bUsqdoLyJkevL1Ns0qfns1ynq8h0jsal
 B9BsmNNYpNkAE/0Sbl43Pu44FAiu9H37So6JVqgHkT2P+w/E8QLyg/T9x/1uBX5UfoOQndVPq
 Hg5e7rdJJECpG9DfESwFZaWEdX7VyMrw4UdJPKtGCCSfeBfPk0fBTEWmyOXAHdCOYNiz4XKbv
 UEAn8zUzAetnvjo3yLAL0dDWV5zOIFZetCSr8ylv3VlgMz/2tanDzqOtYKLH/BxePOabOpxc1
 o3/sJwcE0DvuhRkKW1B3FnkRJr5yv32qKd7f18oULfnh5aW+eIJcnT5WPgBbvhzqISQOrx0Rb
 LXlUalqil235FrDmg28UaBORWQTQOntFRdq2PvRpEAnLqMgvWO8ECCsGBjjEzet3fWJNkprp+
 5vzRvOqScVxz89POZjl9bVnwyOu9Pd6QyBZUGAqvZdTsdNaOwDHW5a1okBvlCc7MKCBNZ4oHF
 dBlNoY721NWP+U=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Before commit "staging: bcm2835-camera: Remove V4L2/MMAL buffer remapping"
there was a need to ensure that there were sufficient buffers supplied fro=
m
the user to cover those being sent to the VPU (always 1).

Now the buffers are linked 1:1 between MMAL and V4L2,
therefore there is no need for that check, and indeed it is wrong
as there is no need to submit all the buffers before starting streaming.

Fixes: 938416707071 ("staging: bcm2835-camera: Remove V4L2/MMAL buffer rem=
apping")
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c b/d=
rivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
index 4d63176..59eb812 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c
@@ -1338,16 +1338,6 @@ static int port_enable(struct vchiq_mmal_instance *=
instance,
 	if (port->enabled)
 		return 0;

-	/* ensure there are enough buffers queued to cover the buffer headers */
-	if (port->buffer_cb) {
-		hdr_count =3D 0;
-		list_for_each(buf_head, &port->buffers) {
-			hdr_count++;
-		}
-		if (hdr_count < port->current_buffer.num)
-			return -ENOSPC;
-	}
-
 	ret =3D port_action_port(instance, port,
 			       MMAL_MSG_PORT_ACTION_TYPE_ENABLE);
 	if (ret)
=2D-
2.7.4

