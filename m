Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9BD8058AA2
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 21:07:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbfF0THM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 15:07:12 -0400
Received: from mout.gmx.net ([212.227.17.20]:37547 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726426AbfF0THM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 15:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561662414;
        bh=wbvRD4gZayXs5feDvbdQH+nNcCfD44PAYVIgXWdJUDQ=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=BRHB2R0X4TNtTvYYrmJsJwLW7FTRr7NXJTMG/Yv/h8BRe9WD8NgB6fLF43GiqcHFZ
         4PjX78ZO6mk+nPogbzYkFF2btZHAWh1Fjb0BeUJCBo5kEbw3K+6ZLs6xy3BtyaGX3F
         VelCFtWo+dLMo/xuWGHYtBV6zEs7Zibz7ubkB44Q=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0LiHc7-1iKbC103Ax-00nRfW; Thu, 27 Jun 2019 21:06:54 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 25/31] staging: bcm2835-camera: Correct V4L2_CID_COLORFX_CBCR behaviour
Date:   Thu, 27 Jun 2019 21:06:20 +0200
Message-Id: <1561662386-23045-6-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
References: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:Omp5apnrgEsmpUXsU1fQRehbMLMejLw0me0mFJp1WOPmGsEK/LL
 +xbXWkNp8DZT/yNnks9b0rc+oKnyhcKwjw60Py1c9KST+It9Tu1YDPhLhy3d7znO/3e1pJP
 pcsbk/YjU1k/qr5F7Pmb1IuQ52C4gaDbSUFx3FmTvtuAf1liY9o4XkAs8VyLm7KMg9rtIoQ
 +u6owyMRobELSw4qVylcg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:bBDowvqWoGc=:Os/FdnRnkN8zTlHOaR8Qd4
 DrKNstGGKMed/h4EZuRNihqiM1o/YxCo6kpTeTaTcre1FPFbYkwPzFGraNR3GB7V23VV/6aJX
 GtaIh9CBRSZxhKwDjO/qt68Kru+KNz/YWBKM4Zaq5PhQzc2AYLeijjQFWaWu+psqf4m9d7bmK
 K/k8ebU8Be/3NVatbrQqb0PBxzawZN1ytj2h3NlKIy3s4D3e9LrzaCPVSm1j4ovX79r78AzDd
 NpHSQCtX7MfJv2HaU7A7+PWia+SuyseXjt4ncadNAU5Ia4YTKt9lyJsyvwrI96apG9Uk0MK0+
 a42803Lt/8W5k0iM44ko6GBeUUCKFAlOi30EvGrqxrOPVXYxmalOJk0cdmwfgdbjELOyzqfpJ
 8DRmIqkb2g4fSJe2XOmvL9hYTE4dldxtu+pvGhuJDhRsux0B0GDVB1JTzZYKquw1l35wrOcQf
 vhZbs2y8IZk/BJ1uMKcq2/dl5PmxUQbaZocrrTFolu3d2lNf/6F6tG8ammdX87iDqsCGw9Wc1
 TdDRRedXN0unghSWrLV9tue4fdBud4dt8gtrkWwns39cIUxUQk0ie8neR/VI5wG0Otmz57gyY
 /xq6/x/xlqj9+OrgwWzdf1TuHez0bZEra16aLzrrFtG6w9we59McEWItrvA3HDYOFtLTNn61H
 M/pBYq2Qna8dxn8F/2+siPvtkcL9njyvoICZ79PQl8ZqfMzcfT37MCJs9CaBlyGcOyJFOrErf
 YnYhVfYWGXMiKfsZpaT0GDl7gBqlcx8xOH+JIKD6vbzsC19WXz5hax+dy5dqeh2M4ASrYSBfT
 zkCCwqT3khQh2+H/CbQjbcmFmKWKFptPK0vwKa4ow0hFOBCmjHHi0ek/X3CMwAz041G9eA9kj
 ZWKizhooihJpE/Kvofh2S4g8ZnPy1Ork9B3r3HPppYrjhP5zY1Wghrq8SHXRGlTs355wVp2SH
 uAFFqwhazxYeTogIdyr+Us1piEMtUFx1jdEF2QZTvIGJ7KFGh/bZoRwbYPkfzKqo1laUFnYDe
 Va/v/r3HbJX/Xhqo59HXHo2WmdEykVdhNLNRRMTXjjK3TsLoQcqHKSPtHXprKIwq6FE1e8JwO
 uLiYBhGfB1LwmE=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

With V4L2_CID_COLORFX_CBCR calling ctrl_set_colfx it was incorrectly
assigning the colour values to the enable field of dev->colourfx
instead of the u and v fields.

Correct the assignments.

Reported as a Coverity issue
Detected by CoverityScan CID#1419711 ("Unused value")

Reported-by: Colin Ian King <colin.king@canonical.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/controls.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index 038b9b9..b8aaedd 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -574,8 +574,8 @@ static int ctrl_set_colfx(struct bm2835_mmal_dev *dev,

 	control =3D &dev->component[COMP_CAMERA]->control;

-	dev->colourfx.enable =3D (ctrl->val & 0xff00) >> 8;
-	dev->colourfx.enable =3D ctrl->val & 0xff;
+	dev->colourfx.u =3D (ctrl->val & 0xff00) >> 8;
+	dev->colourfx.v =3D ctrl->val & 0xff;

 	ret =3D vchiq_mmal_port_parameter_set(dev->instance, control,
 					    MMAL_PARAMETER_COLOUR_EFFECT,
=2D-
2.7.4

