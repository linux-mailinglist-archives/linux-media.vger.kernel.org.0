Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 107EE58AA3
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 21:07:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbfF0THM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 15:07:12 -0400
Received: from mout.gmx.net ([212.227.17.20]:36039 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfF0THM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 15:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561662414;
        bh=LRyz6YBXxxPj6I4Vwjk1xVVm3VP1fgqB6kgOc9SZZ2c=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=GirP0fljl41TxQXSm1O9gJJhCN7MtAvA2NBIiwQ1KIGrkVfPAHj5Sw6fDcvYKJtfu
         E2osrqmE8u2cTkC3cE840XaN8IrmJZu7A/fIroOc7WbAh3bGnOCjBGDXaha1CpbSbd
         zZoHQI4w7AkPHYC0kt1W6a9CXQRsjQtCaDZHzNsg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MLB89-1hgIcJ1gDx-000Nai; Thu, 27 Jun 2019 21:06:54 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 26/31] staging: bcm2835-camera: Remove/amend some obsolete comments
Date:   Thu, 27 Jun 2019 21:06:21 +0200
Message-Id: <1561662386-23045-7-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
References: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:4xomtyWSvBDrQz0zJqh5x0hXvsx0k3JhFaFYg3KGa6+d+DFRHEf
 bxv7FTElzUlvQ4k51+EbPC6FX/4pGQbQ4EKK5gQOxEoefI9XJMHsohhv7Sr87ki0H6aV+by
 GX7eVNC2peAsNFNkVgXvYJxN6YStYZi3vtpUzeoQ309nbnK0uWHnU354e36D8hBOUJpsfkw
 SkIiLpwSJsfSQRg98to6A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:ZnwXJ6Xicg4=:lytjMVXwZM643hxn+PT0hD
 L/OZl/YY16Ftz3EXRg2qGYJRcT1eXFvSBo2v/CCL3DMphM4+c4ugw6rlorf0e0+DfR4nwTpel
 zCFReDmiZ+b+JLnkQ5TmfsxUm5EZaoTJI/S8goBbuLxCzctOId5FBoUgX6epxXKv6kty99lqV
 7hqXn7dtmDoPYVer7R6PvvnKWM7FhFVDvJsloC4IFzxhnHaRlrvNynisitWfs/vwSyyJNRXfs
 QLwSSmw+9zud3MyS20SOItxYjn5rmajUTg+xHDiJTkXn60+0VTFnWfrT03pKeECt/dV3Y7HNG
 zSWv6Zt9hZCAONTZlcqtIkgwn5b8wYYtNfWY24kthmz9/TWaIr8rWFSZUpvdndfjhoc+iyP2x
 zaPAXJZ+MynjnMLvRKShmK/xlUNT/KocM4RtJCG8a/7QJV5WVcjUR6AmR2rndubwnLAhmeHqP
 um4Q0KQw1S0uIr9NG6220M51MjM4HTCrdEFvLYxj3jwPEP0m9XC+j4AeJgzRglYb2YYMYr7qY
 47rASphbqix3KtXZEoLNpRFIqoYDJcvOlA27Cf2hNnSQAeHxWRbHlWsdZ119Gd3rDmZIRObOH
 29xyIin8zMCtqu84GaN+Cfe7SEGwPSakbOW0gJRpHrQ+RL1QRkugRhI7wIQfcdQZFfwckckMi
 x6Qvz9GzW1lyEmFLol6azUFLu3fbW/yh+W7uZpmj0nFlKi049NuUMXTM8Bh1sAI6PHAM4xcL6
 oQOcPmVX0clJAsuLbmoXsFUxaOsufsfmlUwd86blc6UaA1fYPsttn3eFkFcaFvm74pPMD76fK
 xyGXm0k9xjsIcqnKW4tXuJPZ1KctvzX0jSgRhhfGvK1UpcfIpX6fxQK2iv0UjrHMctfbckThR
 dc8i7Y7uCR0Yp3h5gzWj+RA15KbX4G4zJQYw0aFqx8eh0tE6Y1o4Yc4fNLaqwhPoLi0Ic5VGw
 NsLoaXsQnnvdwJ/G5HMqBBVPNtXB4dpW9wXx9QS2KD7F0zYkxPdKeJ+tGSJMYrvKBQ5rST8e+
 ini5oieKZ7DFA/JEvcgIAyUAyYyThr82ux+g0Md5sHPtP7QyAhfaiMzHgIXlNGcXFyr7hxb21
 pAaWxZ7mpklkYY=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Remove a todo which has been done.
Remove a template line that was redundant.
Make a comment clearer as to the non-obvious meaning of a field.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/controls.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index b8aaedd..848b14a 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -971,10 +971,6 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[=
V4L2_CTRL_COUNT] =3D {
 		ctrl_set_value,
 		false
 	},
-/*	{
- *		0, MMAL_CONTROL_TYPE_CLUSTER, 3, 1, 0, NULL, 0, NULL
- *	},
- */
 	{
 		V4L2_CID_EXPOSURE_AUTO, MMAL_CONTROL_TYPE_STD_MENU,
 		~0x03, V4L2_EXPOSURE_APERTURE_PRIORITY, V4L2_EXPOSURE_AUTO, 0,
@@ -982,11 +978,6 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls[=
V4L2_CTRL_COUNT] =3D {
 		ctrl_set_exposure,
 		false
 	},
-/* todo this needs mixing in with set exposure
- *	{
- *		V4L2_CID_SCENE_MODE, MMAL_CONTROL_TYPE_STD_MENU,
- *	},
- */
 	{
 		V4L2_CID_EXPOSURE_ABSOLUTE, MMAL_CONTROL_TYPE_STD,
 		/* Units of 100usecs */
@@ -1152,7 +1143,7 @@ static const struct bm2835_mmal_v4l2_ctrl v4l2_ctrls=
[V4L2_CTRL_COUNT] =3D {
 	},
 	{
 		V4L2_CID_SCENE_MODE, MMAL_CONTROL_TYPE_STD_MENU,
-		-1,	/* Min is computed at runtime */
+		-1,	/* Min (mask) is computed at runtime */
 		V4L2_SCENE_MODE_TEXT,
 		V4L2_SCENE_MODE_NONE, 1, NULL,
 		MMAL_PARAMETER_PROFILE,
=2D-
2.7.4

