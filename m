Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 53C6C58AA7
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 21:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfF0THQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 15:07:16 -0400
Received: from mout.gmx.net ([212.227.17.22]:55237 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726502AbfF0THO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 15:07:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561662413;
        bh=HN3lhHm+Yt2GbL8dO//CPN9hcnC7lx/vfdI7rSIW4Pk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ISIBPootMoMSbtYFcaNVsNT8f+5oqIbnZBammUzC39oBzwx66IS70gfTNP8o73tei
         2oEmQmmhRGA8iULe3HL0j5PYkb0AjenyOzK9RREbAISQyCgW6+kqYMpaoYX3vNM6+b
         a885JyOEEMaGReTp2Yhxbcj+S+T38BCTd1UD8JzM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0M3vCA-1iY7p83L2A-00rWF9; Thu, 27 Jun 2019 21:06:52 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 22/31] staging: bcm2835-camera: Fix multiple assignments should be avoided
Date:   Thu, 27 Jun 2019 21:06:17 +0200
Message-Id: <1561662386-23045-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
References: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:nDht862Sp27VYwhBb9Kh9ofjwNBUYyKYpnUiI/S8FqW7MW5NEo/
 3a0bU3PoAEYPVcTQpkI9eQfQj42yyOLe8xTC+l5hdLlrulutA/Irbt7bo23CSxTt++y3v7G
 Lq0E8VjMCa4fOGh1S55NxUVGnj4MhS0I3li7xJ6o5IlYAEIdgkPwqNVf7+LNenoQlo8Q8Sc
 3qnrR1IxS6OH6mPX6TM4Q==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:QGwz0ac8KYY=:xECsoiozVywwQUPjOJKdk0
 RXknP9fSotn2hZ1hFXEAGXMDax6+vufvh+Vg5u6DZUnFdb2GOTlzQPx++ABTuFwuJJniCly9i
 UZLN0Bx7TdiquURrdp02FvSX69z2v7gsQAsLrg53YSKNCgedHt/OclQhcs6nGPJ4zw0+MRhRb
 Lpl+q/KCfWgSFTS7PWisQukjBhqxJ9Y/ps0hgKZGmrEEItcA1Jld3Ier3Fw3//ACxpc9SY32q
 28+V4eN1NJ/AlnlDab9l4rBCKCNWEXJllUYaIukEVEFgIMCkzY9VDLB0RhUWImLCXo7Pou/5s
 sLMypqJ2GyscU1H71eSyMy/aadr9uFxav0ZYTXMuSqvHhXpJTeUC6Ct9dd5ZnuQDcCD3WNs4Y
 PN23yU4t+vefahzYaci1d5VjXj6/oM6vvuTImPbWUGh6FsV08MqEzhzADKHN8XRIUW+BXXLCU
 WWMjarSP6j84hT3uE7H+rAmy/Q6dmjbywbRn6NwAsrZNEr6b+evggBYF+YwqUYlQQvu1kw1DQ
 eqxyapX4PxZlG4mRnoEsdQYMYTrd/JCZNuFMA29A0REJxEL/0C27nMbZUQtQZTmHdyd0/otFO
 FK+zPiTjL3gkExjjcNl+3PTvsxgYP6ROg/h7EM1A99XIrFaSV2zXDMzxWdlxc33r4wOkenVwY
 WrQYwNNqoykamQR14zhVyeI1tFbVndFgEJQPMAzCxL7ndYBunPN6RR99yzsUNOJTaWWPPw3va
 KN3Yo3Aq/qlTXz7Db0FSez5iYH/bV63b6LXhdNGBXIo47BXtz3qK4aVZWvMrPE3Xm6/ikPs9X
 sTKfpHsFBREdnhRSNZtMst8bldxJl1v5KRy9QQ8LksHivHnl0xx+r0oqqd/vrbDQmBNTYHuXd
 k9gpldalO41zEhBBqPpDvFglURgsbrlnPVLQu8+kFFgd9aZglhueSqT/fvJSeQ5xJRsBnOS9t
 Hmsrb5e9g/pH9BfE1gtwMmYmDxkL9LfCe8xZBkCmIdk86hBQGWQMko1YqROC9sPkh1nbB7Zkc
 NxkXqhrxkur9Rq5RVvxWqvjeUheFJ2vjKxFsPuUgPlLTtmGIVg7EN2J6gzG7GcD75jWj8L/xB
 hoJNfVxihuQMuo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Clear checkpatch complaints of "multiple assignments should be avoided"

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 6205793..bef0052 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1049,11 +1049,12 @@ static int mmal_setup_components(struct bm2835_mma=
l_dev *dev,
 		/* Make a further decision on port based on resolution */
 		if (f->fmt.pix.width <=3D max_video_width &&
 		    f->fmt.pix.height <=3D max_video_height)
-			camera_port =3D port =3D
+			camera_port =3D
 			    &dev->component[COMP_CAMERA]->output[CAM_PORT_VIDEO];
 		else
-			camera_port =3D port =3D
+			camera_port =3D
 			    &dev->component[COMP_CAMERA]->output[CAM_PORT_CAPTURE];
+		port =3D camera_port;
 		break;
 	case COMP_IMAGE_ENCODE:
 		encode_component =3D dev->component[COMP_IMAGE_ENCODE];
=2D-
2.7.4

