Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4F858C7F
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 23:10:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726524AbfF0VKL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 17:10:11 -0400
Received: from mout.gmx.net ([212.227.15.19]:49511 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726465AbfF0VKL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 17:10:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561669791;
        bh=5x34gYp6Uyi6CJY0kFm3PZXjSzyrVChOMLS0r3Akco4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=h03fJbJW/7gg1QuO2NfaJ617tEbTmP8u13OHt/Oh5VwGfBZ8wv18oVYl4hXmT+Jah
         J76tOLrPVpmlnIpz8gsSMtTipoCWoX2oN6BjnwoG88j7tsHTHZq38YJXcRMsDH0ZnK
         ozDlOZ+574qSx8Wwmz7MEsIcl3QPgcq2AmOFSaj4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MaJ7v-1i1Fjm0J0f-00WI0A; Thu, 27 Jun 2019 23:09:51 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 29/31] staging: bcm2835-camera: Add sanity checks for queue_setup/CREATE_BUFS
Date:   Thu, 27 Jun 2019 23:09:27 +0200
Message-Id: <1561669769-2498-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561669769-2498-1-git-send-email-wahrenst@gmx.net>
References: <1561669769-2498-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:Mlex4ury0QpXvh3qld/Yk5PIv+tL8JhKdoUqZFxDDXHIXhlkusC
 QW8eAeoFawzNVxQCEbAtx2B2KjulBooNWVDk4Th/3aF3JHhuGxKcwgj8Kq8wJZTAk1kjE2l
 vcIP9JxIVI7dfrngOtFWB5KX0Ws+Q8f8K/D364z+0yp/tF+f0jTslsZx2LSZ5Ql5lXERIkf
 Z2PEolwEWNOPOsDn8Av0w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:237QWuQc4Lo=:G2mQgIER8ss0VpyNGDK6EW
 0wwn+ng2GBvhsMbuA0FnDTqlS+SSu1M+m4nhhkeVf2g3YQnZzHe2ZDqFjuH1wt41f+8WNUvjY
 /1814HtColxVjucaO3xQtdrel98cuXqUmxRboCKYKPm8f6WCMMp/UqhcFGWwjWUebd5JKll45
 WPqcIr37aicAl5RXahB7BsN5hI6FJ37Xi9EGtmw4K4BwUR/tprj4XN7VVRWw2QO9JzsHY3XeM
 eKdNX0SpN2xfQwafPQKZrlRyEbC6oH0gXQTq8BixRyNLKxhveqoM0slXXVwH8u7AR1tkkgUO6
 jmydwuK+M46olFqDJQyIX5Ztsll9UrQkoEGbbTb5YeUkptxBJMRzobN5v+E4sG7TI0q5iO35H
 K5wWcUHAJoSe01bSyyilZUZauxKhILzgXBSY7oag+VsBATc0N99tclr8zOlqJIGaYE2O7tpe7
 iGLAtpr2bLSdS9X2J6gmWxSnSnkEzsdakuUtRbfOG4Xp+UIz0zCy0KqUKS/RhKYSlv6u/qTa9
 jw4DGj5J2CaRwrBLvzWsGcz6Yhb0YzZrAp9aPUh4sHsdNCSW1rK/L13FwsF/T0IEuGiw5fR3Z
 UF4DuslEskj+a1deyol9WI7QKrxPjKAonFZB9aHxML1kkdt4ZwTgARBAE7+89KRD7cfkz6U3h
 iapci80fdiCIFQ3n+MBuQNkB6ob5lKIZlAOjLVGMn4QD8YmvlXXkjX7jBViq6p/PyGQJl03RP
 pJqwcDOxxfmkroFLYQkYOhIkC1vy/gBPjtnQ9sC1aQGEg7fYEQyT8VqQ5aDKcEWyfH4o8ILBz
 Wd8vK6eyNWOjXxY3Zkk6aEP58fFgxhTNPj5JhV7OsuM6KqQ8giC5daJP8kzW3npwP5gaCaPlT
 hqYzHWvkUyB75/vhIL7hFlMgRiohkpLWeIdiI2nNhceqynlmcB97x8uGJtATupePOAnYZtRFm
 e/IBUFm7hcoAA/iDVWvFs6xJBy08N/VnX8VcCzslHPgPgOhM4iOXbzeImaE6vGyNTdzxR8q16
 p3DbqjwGYQq/h23JGN8+nPHSwJoHJKoW+Od5/6VipTM9zKejNJSttA+uaZ+OMglcxuZMSuuIH
 sv1NPYM8NU4CWo=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fixes a v4l2-compliance failure when passed a buffer that is
too small.
queue_setup wasn't handling the case where !(*nplanes), as
used from CREATE_BUFS and requiring the driver to sanity
check the provided buffer parameters. It was assuming that
it was always being used in the REQBUFS case where it provides
the buffer properties.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 16 +++++++++++=
+++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 256667b..705644c 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -236,6 +236,22 @@ static int queue_setup(struct vb2_queue *vq,
 		return -EINVAL;
 	}

+	/* Handle CREATE_BUFS situation - *nplanes !=3D 0 */
+	if (*nplanes) {
+		if (*nplanes !=3D 1 ||
+		    sizes[0] < dev->capture.port->current_buffer.size) {
+			v4l2_dbg(1, bcm2835_v4l2_debug, &dev->v4l2_dev,
+				 "%s: dev:%p Invalid buffer request from CREATE_BUFS, size %u < %u, n=
planes %u !=3D 1\n",
+				 __func__, dev, sizes[0],
+				 dev->capture.port->current_buffer.size,
+				 *nplanes);
+			return -EINVAL;
+		} else {
+			return 0;
+		}
+	}
+
+	/* Handle REQBUFS situation */
 	size =3D dev->capture.port->current_buffer.size;
 	if (size =3D=3D 0) {
 		v4l2_err(&dev->v4l2_dev,
=2D-
2.7.4

