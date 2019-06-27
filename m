Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E37058C79
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 23:10:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726502AbfF0VKK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 17:10:10 -0400
Received: from mout.gmx.net ([212.227.15.18]:40033 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfF0VKJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 17:10:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561669790;
        bh=oQ7ZxVIFsPJFpqsCJWfGwqfjesiNRBqjqbY8LvGfqVk=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=A1OLX6ByhH9WDn8bKzXseYkA8Q5ZV06x9b9Kcjb+STncDfhkBI7x5W6QrFRihWFHG
         Qt7I8yQi66LdSdKPYRNchq1/SyOJjMhzrkxK6zFxRMGZVaqBa8w8YaUnjUtKCANNXc
         9eVZbJ3IY5y4PscHoszzh20sNZD2yH9CQwjbM5iE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MvsIv-1iWn8530r9-00sxdo; Thu, 27 Jun 2019 23:09:50 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 28/31] staging: bcm2835-camera: Fix stride on RGB3/BGR3 formats
Date:   Thu, 27 Jun 2019 23:09:26 +0200
Message-Id: <1561669769-2498-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561669769-2498-1-git-send-email-wahrenst@gmx.net>
References: <1561669769-2498-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:6/n/L8DRjvOqCMDP7KzcXt4ACN7nJOvMmlG3h+XGo+4YJgv4/Mu
 YRA85BxZx2CQW8A0PJp/cCjIE/oQfjf0rzMp7+l4gkHQ2LhgMiXp/z85njn5ne99Qz0TaSh
 LeQvhor7xY3IvWxh7rkcq5OuqacBD2+HJnxJFL6reWstWSNwKGEsSfINfkIKBF10Hu2NncC
 +AMIVaMb5CaPmfnATTXqA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:yBBX1gyANN0=:hZXgWhfMcDYebZnyJtpOiJ
 nHIEJr/Ok0F8qB9kXSQduKpyyr4kXes7MfvUeXeLdFD9LVBooU9cpvXq62CztLdonlFPyEQQW
 JonTinfrYCk58yufXP1Ea8GUlnJDMHzJfs8JDuMfvRIj6szOyAuwPG2dZOMAf+laooWkalT0t
 lsaD83E2vonG3HsFArJ6NRXe4YV5w3Sbt9cXggz9iKVUnscFl74yCVhJ4PaE5u4C+vBXvteqF
 QjjatGY6Ji6kuoHCTPEHM7NwBGu14lImOoLX5EJK0eXk4xvy9D6v4haZ3RxTCL0UFfmEWLodB
 /BCw6XLdXkPUmKlzJ9tUTu7jYPJ8V5RU4fC9YuftvU6Jngafgk+yGT/YhookHEgZI63jaqKew
 Ijl5vklgNT6ZLfORTYDdMlt5tixAZ/ipRuheNLBRO3BCYct07B5WLDL/j7pPTYMQPKaN0REnh
 sG1voYj7/3FyPp/w9DIwg1+jLlknswfR6M6MLFu5zK9DwM2qPrsr2Me8MXptkVOslsytre0kc
 b+HsyFYihL/XJcepknaa+dVV+E/qrI0g1GqQzuEZguv4gFQ7NmkhACbY1v2zikxp6F+EC9TU5
 /MB+WSVSVeY5qxkAFpayyC/c4Iq6dttArmhTn8ie3exKggeuw30j+HbK2DJLMLerLahjTc1L6
 Of1YaEIBnIZty/bp8sUAXnRgLwVEei9pyxd5sz+U6Ga8bki+qnZgbgq1lVE5vGFntz5FTVYqq
 8YkysdTeYCja8MiuzWf9motpj3ghKot/uF03ghHEASqMwwxYUfj84NKDQ+/kOQ4uqNItoJlct
 5tqEisHRIZ4YNQaCBSIFO2Ulkt/ZoZDcw+f7BG26LtPdqSp/IOznPaq4mKoXV0tJO3pDNB6Tx
 XDtbzZhEbCvFNsP/TD/aZxfcaeA+zU6Jxi5EAEJIkrOEKZ8R7JLZNP+8pamqkyEbNQZ859zoP
 LP3gNnZg9SVcJEQon8VogIe3gvBqc1oQ/xWicByUwIY1vnRFCaNC20VvDpqFFH0sh3AEg/vot
 y9TwrZYXjOTupbmsGZjB/Caacy6z88zIvQLJYHQJju5PMBwGn8aX/94R0ZrLatDQcDw3n6N36
 Mj24VasdS9LrsU=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

RGB3/BGR3 end up being 3 bytes per pixel, which meant that
the alignment code ended up trying to align using bitmasking
with a mask of 96.
That doesn't work, so switch to an arithmetic alignment for
those formats.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 26 +++++++++++++++++=
=2D----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index bef0052..256667b 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -978,13 +978,27 @@ static int vidioc_try_fmt_vid_cap(struct file *file,=
 void *priv,
 			      1, 0);
 	f->fmt.pix.bytesperline =3D f->fmt.pix.width * mfmt->ybbp;
 	if (!mfmt->remove_padding) {
-		int align_mask =3D ((32 * mfmt->depth) >> 3) - 1;
-		/* GPU isn't removing padding, so stride is aligned to 32 */
-		f->fmt.pix.bytesperline =3D
-			(f->fmt.pix.bytesperline + align_mask) & ~align_mask;
+		if (mfmt->depth =3D=3D 24) {
+			/*
+			 * 24bpp is a pain as we can't use simple masking.
+			 * Min stride is width aligned to 16, times 24bpp.
+			 */
+			f->fmt.pix.bytesperline =3D
+				((f->fmt.pix.width + 15) & ~15) * 3;
+		} else {
+			/*
+			 * GPU isn't removing padding, so stride is aligned to
+			 * 32
+			 */
+			int align_mask =3D ((32 * mfmt->depth) >> 3) - 1;
+
+			f->fmt.pix.bytesperline =3D
+				(f->fmt.pix.bytesperline + align_mask) &
+							~align_mask;
+		}
 		v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
-			 "Not removing padding, so bytes/line =3D %d, (align_mask %d)\n",
-			 f->fmt.pix.bytesperline, align_mask);
+			 "Not removing padding, so bytes/line =3D %d\n",
+			 f->fmt.pix.bytesperline);
 	}

 	/* Image buffer has to be padded to allow for alignment, even though
=2D-
2.7.4

