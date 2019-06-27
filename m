Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 40D4E58A57
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbfF0S5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:11 -0400
Received: from mout.gmx.net ([212.227.15.19]:54297 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726542AbfF0S5K (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661813;
        bh=zd1aDqSMaJmqIjJkz0CA2ASLC5e7tiVGocbpMQusOGE=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZPNO9H8nR7gvoiXsL8VemBcF2ud11Z3PwuvDYhqijQ40c8NtELe7WkNAjgxinHdvm
         8rmfwQhUqIcBJiME1yQu5VrFAzYY+efkN34PBNqwyYHEhCPtY7UN2513Jg2bbveWi6
         51OC/ZHGl5zx+8r4VOPH8skthBa5CBAZN6nmfkrU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MFuWk-1hkRiE3rMc-00EtK9; Thu, 27 Jun 2019 20:56:53 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 11/31] staging: bcm2835-camera: Fix multiple line dereference errors
Date:   Thu, 27 Jun 2019 20:56:08 +0200
Message-Id: <1561661788-22744-12-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:PtIPEvvPTgzUk75vIog7SPhxn5Ru3GkyhRLJtUQw/cZpO6M41Lr
 hz9+bdTPs/+Q3URY7A5KhkKy5qRTJW1CwhLRzSLzVo/M1UARv/tXSiuD+qR3Pnl3ADHtvh/
 Rr9u+pfrAlzuItwHmnAYLo7giHTEaW0u+y7uPrHdvp5B4/d3GNFCRT9fnnRkEj7gQUrX39V
 prAXM5JGs6kPGNJCAwS2g==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:TooMdflaKKQ=:7hA9iBw2Jtc6Jig0lYMhEL
 mg4gXWLOf+r5undL/OAlXkVeUe4V/gN0GuhRPZGm2lPV72Gj3jSi075aiyhuIYlcP66pAJPF4
 ADoFVwg7NJAaM8OaYvHKDiRONXzbmElj4Ptyexg7QYFqqN57ai83rqdclwb9ONRj/DIoLk4Lm
 FR5IjzDZhqTTP3ceYNQNoqJ4nu2fGhzXqCm6YaqtrfWdAymqwnKnREL6lnsLYxR35nyZfSSBx
 umLc6ZQfXXqyg+ZvUi9T8IHihCfmg+WOrEJP/Xzr350aJC965Ne+i3dNycwajsA9uhj6xFUP9
 jv6oc94vweQ0aqQknVD6MUAJfVRcvXsqeqdkjcCLCRHuRQGYCApa5ZN2RUAy5SqSQAbWGR/Am
 LTkCtcBKRfWbkelqVBmVuhI00X8aSFqJ0CA8bdJhIbWWz7JYbyKeY15ksOn2GDfZd7x6b9uF2
 nIgcdMRK+yc+zfUmP/pI2cqtdmYGrkuUsfHV1xsepGlRVrAP8BBEgo4U2TMwJTzw+hSeNoc5+
 WI2DxPPZq4BhE/dmdlISVtizhvJODtE5EOkwwwE1wswSvDF2WBwEWoJcuu5K/gj9NThCEqErJ
 0mfo0IWFY8sGG/q0dyHkBi5tHesv03OB9UpX+oOjbAovM9wG4afqZm2CwIRQM9ViS8xfLZVz2
 IqusSr9W0AwSjlLRrnsE2HKzhNMKjPLkkHidJBwEFJ5gluHBPWqN0g1hPT5kJWh3gM53tyHH+
 YS8179xn2YZNGA3EZM/2ObU4hcGfSuCqvrmOVl9YHZ9mqsORtfT7hXIQZHAzDLK7g7aAtXBwL
 46lQYJCNkLAqmmDmd9EBLzPTQE4YuMPv5jGFzphlZTjObj/hOKVht76ungpMh7sWFy8dBz9O3
 fq3oI/PaDk1YgGo7QinUz5axF7Fm+AzIYj8+FOD+GkdpKZkKO79f2cZ9+a96+TDQUNWLg4MW/
 1jwOV+BRwQdcL2eK3jBVSl3o5Kb1X3sxiSzA/Kc9MHZ1NeSQ2mJ7LZCXWWukpgitz6Xql1pRS
 xF7kxdIPJGhleptE05+0P6t5G/nKYP5kXi8ydG9gXQ2jgwaT1LX1pCc+IfygOkLwfemAMc62g
 MfgnO3mT7fvLe4=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix checkpatch errors "Avoid multiple line dereference"

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 11 ++++--=
-----
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 23f7754..bde3548 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1028,12 +1028,10 @@ static int mmal_setup_components(struct bm2835_mma=
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
@@ -1224,9 +1222,8 @@ static int mmal_setup_components(struct bm2835_mmal_=
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

