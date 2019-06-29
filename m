Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 651E95AAA7
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726958AbfF2MO3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:14:29 -0400
Received: from mout.gmx.net ([212.227.17.20]:51391 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726909AbfF2MO2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:14:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561810449;
        bh=DRr7lscebZ8wctMokVnVvWYIcPpsVGDYxVCVDlgab8Y=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=Jf73JgXLpu8P1OqTc1ysI742Dp0LsmYDy3Yw/BJDEjcjOFA7ek79lVphxS7fIZHMU
         3C9WWmAXEGLjT8ube1N4xz4lFfbdoQddRtwap8ohiNb7K6MX7LBNKu0J3Dn4meChgy
         ZMDX/GSQyk8HoEyX6kQCge4wmXSt0ysomBP+gRB4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx103 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LfTC1-1iMsrB3eoL-00p35n; Sat, 29 Jun 2019 14:14:09 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 10/29] staging: bcm2835-camera: Fix multiple line dereference errors
Date:   Sat, 29 Jun 2019 14:13:25 +0200
Message-Id: <1561810410-8829-11-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
References: <1561810410-8829-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:mIp1k00YLYIRTQPgciwE7hDEy8fupJdyLOgpvG+ZfkBfWRhYiKK
 1B0oaaIJL/kqiFJmDpE0dfUdRMrRQgkbIKy/V7QTD2kAYIrp1T5WtP5HwVy2Ac3ZieJwJew
 BW5g8PtgmP7z0oumhPN+lOolZOvwijqvBIZVfPCFlcIx02Nmtq8+ghOSLMSigc+vDJU+ze5
 lwnIhbS+fMLP79hGE9Obg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Tym/dFtHE4A=:OinOAHIJJfCiT0JGpKiVS6
 7tMQHsZ5Lk2yhUAou1py6asMsBoRqXt2Of+eFscNozQFRxvm1gCdY6YBjrmL0dfvmq60fePy4
 DVV3XciQb5IDvNfMIexplpaSdN8y/M0m8hbZk5LbVn0HgER+0q1nDRiONl9/F3KFXJjFDFoW7
 KVkfe2+EX9hsLKaZ7L3e/gaup0SDnliYzIAN+6GwZuXc9V71D8cQN/FM4meEwlXcKALqJGywl
 NN2hPn/Cuz01SdC2UPIyMnjtbLb8sBEFoyB4CpfSacWKXgbWXy7lW77JBnRi0oSihfI+fHDMB
 +eAQSd+V+hn1WSaa3he0BetbwPvckNiaTUaq/KQxp5St68xIX30JSjPBzv4f7UARO7q9bgn1J
 3NCTzWXbLIDtwMGYFOC3H+G1miFr5hj52L6nNRegzw9HG/eXjHsWFCAs2FJWEoLq1xqeYeY1i
 5yqAbNqREkjY0HHmMpioayAfyMabSb1piZBTPoenQLEHLpFd4XCeaZSak4VeoD0cZkuE4/BBX
 aqg1rHN8nOy/ueiScBFKjC6Tiwd4prRK0UCi++vIeihqwY1ykSeeRt7t5p0Fi3s/GKEFFLHjq
 juaBpKiWp76hlzMAzfgicA7zF4Z2IU3ijLIsM/sdnUZ9CfrVaIg41I14ujMl4DjgMHTs4O8rs
 I7yw/yKC4K1r+Hanjzkuo00SLtFH/YJDwyixeDYuzTmdsm7dDYQtG8WXq3RorwjuAVsetHFU8
 vzCDBP/guic3CRX9pvQ0zvSI9XD+lK6pe0/ex36lpSyrUq6uX2Kv/zZXotUdbXuImtHP38Q8X
 qNP32Jnjl4TFiKznLHXnefLQ/Ea16d45853LHRTqtx+/gsjZ4pRgsW5A1x1BZiUAVVs5qbNK/
 ySla07DiMiLaQCeqHB6h8/9es1IRVodazoW4dp+AVWtvUPSmII76hm7zHj6CENETiI3Xmm+/2
 bDm1sYedAw/tm2tNDychX7iqVvZ/8xynwNNkXqkmjjr9NEZu+q8eyHWdAJZfovvSfmJ33lnnm
 R56EdO6dQoZAJDQUZ+jznUNM8Rs6zV0sUsT2XfplWhnx+flBC/y8D2gdTR/C/aR3ugF8nWMcb
 LugtI+f3Fh0tXU=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix checkpatch errors "Avoid multiple line dereference"

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 11 ++++--=
-----
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index c16a206..753c3cb 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1015,12 +1015,10 @@ static int mmal_setup_components(struct bm2835_mma=
l_dev *dev,
 		if (f->fmt.pix.width <=3D max_video_width &&
 		    f->fmt.pix.height <=3D max_video_height)
 			camera_port =3D port =3D
-			    &dev->component[COMP_CAMERA]->
-			    output[CAM_PORT_VIDEO];
+			    &dev->component[COMP_CAMERA]->output[CAM_PORT_VIDEO];
 		else
 			camera_port =3D port =3D
-			    &dev->component[COMP_CAMERA]->
-			    output[CAM_PORT_CAPTURE];
+			    &dev->component[COMP_CAMERA]->output[CAM_PORT_CAPTURE];
 		break;
 	case COMP_IMAGE_ENCODE:
 		encode_component =3D dev->component[COMP_IMAGE_ENCODE];
@@ -1211,9 +1209,8 @@ static int mmal_setup_components(struct bm2835_mmal_=
dev *dev,
 						 port->current_buffer.size);
 					port->current_buffer.size =3D
 					    (f->fmt.pix.sizeimage <
-					     (100 << 10))
-					    ? (100 << 10)
-					    : f->fmt.pix.sizeimage;
+					     (100 << 10)) ?
+					    (100 << 10) : f->fmt.pix.sizeimage;
 				}
 				v4l2_dbg(1, bcm2835_v4l2_debug,
 					 &dev->v4l2_dev,
=2D-
2.7.4

