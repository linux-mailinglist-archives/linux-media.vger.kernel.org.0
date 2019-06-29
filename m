Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 650865AD18
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 21:33:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727000AbfF2TdD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 15:33:03 -0400
Received: from mout.gmx.net ([212.227.15.15]:44279 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726921AbfF2TdC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 15:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561836763;
        bh=rK8rvK0E2D7ZbAe4zS7pHvQrYn5x7ohLrrBKZLknkUU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=ZsSBlnTDSZMEPKIUQfRD9f8auVzzQnnbvPImq8j0bJvhsuV5RyblYgAsmmpPW5k7+
         +ZGkxNj5aVGN+PveqUip6qftjkiMLIzsFDyYNoTqzu0MBsdrSLWRZ9IzRH6dfAWhuT
         d2Y+rnvlPP6kAO0/3w5fFlRKYakv7x1MQ2Yw2N5U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0MLOMM-1hgl7g3DrG-000fz3; Sat, 29 Jun 2019 21:32:42 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 27/29] staging: bcm2835-camera: Add sanity checks for queue_setup/CREATE_BUFS
Date:   Sat, 29 Jun 2019 21:31:41 +0200
Message-Id: <1561836703-2528-3-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
References: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:sDOOOORNsaWE+WMzRK4FSnZQ1bYVt3B2/9OPCk1Nghqhx6Vg08C
 whJM09RSK77gyrEeJlCWCiqRQyKzXNEmEVCKKQB9emDR/jrRSNXjUo/R/2dEHlyvnOflWFI
 wrnSRvFYi2nRBRjdTaa8OTpe25ngXRbpFcCSb6vEaDY0p/4jGsQ5AeSdpOQgou1rp3L6S6d
 ilZ9Ie2P9fKd5/JdxxBdA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:OBdmlzNyHJE=:V4tpvH6KCtlRVIuQuCx7N4
 uIP4XdWgNZVSM5w4NnwMRBWObJBBy4wA8taWEJTf/rFK/0zPusAOuRT1YHCHQ9WaymbfQPHP1
 dTBYbt8YxklwJYee53uOc5GHTVDExnfhOYSpjNWVnIl3KdgTzQhogP1iummvVnFx7Mw+ssucC
 L4tlohDr83gk5JLPDCoteeJuN18NWBRTZcy54qxKnuKCNkzXgS7XPxU6E810k+KQENeKlDDfd
 j25IgSeBMwC1Bhp0Q//PfSntR/wAzd6ohieB75X9baidQG82LqMNVhUo61P3jCm3gVd3UMncw
 7QgtXgArVmnnXe0BrP3fBtC/oX1XI12QLbZIUGQ6wF7UB7MzT9J0Hsj78IJUazjj1Mxrq2QUW
 rNeSNdlmwMJANCgnMPj1VOLme08DN8LQP4AHyBW6s1m/G/YDB6X+CNAUchEb37iOhjRTdE9gQ
 CpgVha+1npK+WnF27wR8pjuvrG0fX50/E3XwTsA0RI4SnG4ZflfPr13atf4ekraC/IGl51Yxr
 f1qylPOTjfUj3tg7CI3bR3qBWNilmxg5RjdGymRikKseH3iT0QUmcMJuS3GPavBxJQXVLKC6T
 1uazOi/q6fMTsj1OxYqo1f/d7FGK1wYOPkiS7b845pN1OimL+onTEv4nIaDteajuiNgHBlaqD
 Rtl8Ecpyk8gz6zEfxBQMf+1cQSoZTG1i3HhsfQE/g9mNavBiPEaALgvbzIUXazMEht11KNUpd
 Nh7LBHq1iHbdtBBjV1BsqIddHJRA2NnxWOA7kQPM3HRqehQEUPzb+t47mmK00cAbY5ASGPioe
 K/Yvyzf32tvkRpKnrSOfSNS0wd0UgcWOxhUfhTNJgbkgD5zMDgJaoqEW3fOzHljOkCdr2aEaI
 7yLNbZciqNTDAbaCkTGgPqWW+jfMmCPNybpWhkC2HJvwDveP9d+XLcVhPl/HgfJ4y6b4pLbqH
 9XuPmcqi7jd+7mL4jT1rbhhvKW7VUg06BA+VBZE2BzVerzSmFMaHRA2eFg4Iv6KU/EAalN8m4
 ZwbCKOLaTpe4zLkRXOAxZ0hEYaAZQmrwjD59kOx/wam+hg5M5Mdki4ESsvYj7TcB75pMmbKML
 6bYYQ3HS7627i8=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fixes a v4l2-compliance failure when passed a buffer that is
too small.
queue_setup wasn't handling the case where *nplanes !=3D 0, as
used from CREATE_BUFS and requiring the driver to sanity
check the provided buffer parameters. It was assuming that
it was always being used in the REQBUFS case where it provides
the buffer properties.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 .../vc04_services/bcm2835-camera/bcm2835-camera.c        | 16 +++++++++++=
+++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 1ad65dd..9c90d9b 100644
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

