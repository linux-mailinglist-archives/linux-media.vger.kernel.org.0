Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E67F5AD1A
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 21:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfF2TdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 15:33:03 -0400
Received: from mout.gmx.net ([212.227.15.15]:52727 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726946AbfF2TdC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 15:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561836762;
        bh=EseqlfgzCuf/2Cl1h+E1XvwMILq15RJLvE3ijWYQ0lI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=FrJzy+5QBjbS3NLcmnI7cYCPjjhIKL0hWeZZ7tToTp1vlJ9zwD5t7XnaVVr9F2Nbi
         SBb1VZI7azq0qiE7jiQUNbPYbBWx6sueV4Mkxwf5b7wn8NDcEgajVSIex2qzqULDPo
         PD4JDSKI+5jqPcAh8mxQW7iKvtXAEqHCW9Z+r0t0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MLfLH-1hgU8n1SuB-000x6C; Sat, 29 Jun 2019 21:32:42 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 26/29] staging: bcm2835-camera: Fix stride on RGB3/BGR3 formats
Date:   Sat, 29 Jun 2019 21:31:40 +0200
Message-Id: <1561836703-2528-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
References: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:TYN5LMuAfpARE6vm8oAc8tSbskTP/sKRht8r6aUhwmgX2tUX6c1
 kfyokFTyrx6gBhZ7CbbZ2IcA8S4pFgWx/f4VAI+k9C0KB2GeZTGMgnk32f/G7Gm8mtFd6x7
 J1/SIis+6+YDvfNOWf4a7J/+nwUm9CmWf9UqCj3o33y0EGGfB+m7JRxErn2xP079uqLRMgI
 z4vtQQavPspjw5KNZphZw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:52dxJ0fYAuI=:bSuUagRayxJ0o+uKxC1jME
 0HU9BtwjJCXXO4BM6AtbYFqDaMi6V09fDjcO1s/JYaD2zitKu9csOegGZwqeMCZTbhmE2M/19
 tYUK0WglmxI7b0PJRyEHaI2jCloQQd0hlW86IhMcs/alSlQrQar6W5G63KydQCJ9SWrP1oXNr
 k9B/l1Z3xd/d1RTFfyxrjZC1GD2ZVcmPvynZlrqcElCptg2RFSJM+dTHvMjjeLbAi9b2buOvv
 XMcdIwEJ+hEFw+drq10Q2bpfDDbf/Q99I5jCtWJF9vmLhcntTQrRNqZeN5cV+QOAWtTjkS/gU
 B+xZFkFIIp8KaxJW9Z+cWm7GJxHuI6j8tDUWjkv/NEGSUmZGbM8oDAzMtj0cjgrqUaTEak/Fj
 d5JVT1Xnft2U0KsTp8BQ/dg3KS8hlewh3oNaU2zIP4ooZFMsxbmkLXpnbk2xrGScyU+GG+9AK
 /CjRFptToH5ZaVyi2srGVzjmucAG0BkltfGSNl97KODjht4Vjet2/TIA5rgDhcd4it5pEaTG3
 rrbh2P8U6VcF1EZZo0gv5cpu69InMkhbT7DBWMoDVOoqc52urMju+rRXnFgU+Chdk+ymzF5B5
 fynDK4Yj0HkFVBTBBRrjs1pHMLL5p60uHWi18eLAFi3Y5bb2Si2OE1rI1tj3mQJdKepiTC1g9
 YtDhE+8Ob5XVZPn64r8K3PiGpFejwfAk3BK/RwzG8820zk1oeOx3B3O85DZ+K8B+bZokgA99b
 017NvElpjIuPDk1A9dUSrT3Y10WMZ4ZQFSZGEIYq4qvXHEuDUO2D18nqYlE7rJrfRYkkVk0od
 dKhvohD09LtSVkoBMkdUmqSI0WlfRgJOo9HL7uwg+a8Ge+9ZwIHwmsn/Jz+lsO8Xn2n+itnFB
 LfiXSZ1JvopsXBz68gQnkXnulippL5MmnocXlsY9L8JYP7FZhKMcHSxbnCPaM/lynZnMEXOtP
 Tb9NGyLEPkTNsWuUFrIexdtar3lIfyEiSBxwpS4tNtberAAkkoEVAvNb7126iilzDDj7SqdH0
 qJ/fJb7UOKyMJJjG2XlQgT1T3GN24GjxUa73yn2WMTL3YK1sEZg8sXacpwkO1TptXYyXhVxDT
 WaWxnxZgxt5kpE=
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
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c  | 26 +++++++++++++++++=
=2D----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 1aaae57..1ad65dd 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -960,13 +960,27 @@ static int vidioc_try_fmt_vid_cap(struct file *file,=
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

