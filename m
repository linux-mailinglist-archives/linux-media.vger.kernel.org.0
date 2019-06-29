Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 85D395AD16
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 21:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726993AbfF2TdC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 15:33:02 -0400
Received: from mout.gmx.net ([212.227.15.19]:36879 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726891AbfF2TdC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 15:33:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561836763;
        bh=jrRQkN3aA1piA4Bl07G3I8c6oLly5GccQgg7xp8+yzY=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=TL3VRguo29vAIRsylpLnKAbl0ZOQxVlF7zB7RQlTgvyLIkxoD2iJrv0W6NkcPxpew
         xV/syWOAEe/npkRjkyHU2hsn3Vn71bSF6sos2tlxhZ3y+F0uXiwL8zDku5Mywhd9zD
         ioiraiGlRxSwI2+a16G9yq3MoXnuH2sWCKv9d8oo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx003 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0LkgAG-1iFGKV2Owe-00aYV1; Sat, 29 Jun 2019 21:32:43 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 29/29] staging: bcm2835-camera: Correct ctrl min/max/step/def to 64bit
Date:   Sat, 29 Jun 2019 21:31:43 +0200
Message-Id: <1561836703-2528-5-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
References: <1561836703-2528-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:bgoZcbjSjDVWzSZxUn5AN5Hf5YZPfhECDzvHxY8GV8k7q6xAZ1D
 S26PqL7/wPSstvrQ4QMSo+mHwA03PVdghA8/Zx+sBtRX1i7cUpTn3IAhH/tNBpVNajLjuOJ
 GWehO2nKTB25aOP+23Nko5bNVBMtIIWcnQU60FL0933UEJYDaalCcqBA2nyx+gag2moRq3z
 POo/9FZEXY2AyrlzcXCUA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:D3MrqUVb8cg=:LFsnxrzTQAbxiXnlCQFW3E
 I/jdmQSM/ySirOv4nz/dqQuxk/Ghaq5Mayle8jHaxGma/hLQCnR9fetbmp5HnZKSSHvHztFx+
 OHMIl7L/tHYYI6HEacwxAhYlLLhcVS3ScCw3Sdo+XXYPC/xd2xhSDO8TUCWtK84mrNK0M8IBm
 5wJGlJBAm7+ngYDss5dkUDKo0cVIeVXiciCOzDTnuup9aTar6YwLADpFNw9rl3PRMfcYGn7BL
 VGQoshSH4RLkEe9SVicuggN67jink9qJt/v3Oc/TyZG0E9dhtW2ZlRNxPgVyyVl92m6FT20Fe
 tdhOL13KUcWXJYqItB/filIjtcmAAC8ZamBY2a3YPzs3WQtHShUfiiWwv2EBWNvjgGv7StBa/
 w/II9CJwJAWfVpym/Fn1TXjExbO5VA5qQ1S/5HvIqNOb0OrTaOLzPp/7xq1AabQDk5Y4ipP6G
 Tc5pEdkXm8UfXPzcYAJ7g57VW0Yd0XI80uYV/sFH1tgX72MZLO2HvFaAGCdbttLpoRYhgHNEs
 QKmZgHWfi+/G+ILQD9qS3MS5Q6oMeRYCArlOEf/rdZvQ6ZCiem/Z8BovM0RsLHIxdtfGPFgwC
 WW969VzT15rxZsUFA9pQwdIWEVWMWsen4Ldi1qPPmqarIGDRsbDUI1It+Dl1QCP9Rm/80/xEX
 9ovcWDiyDgJSLXz+zEEdoqhNl8ivYFFSGCaS6ui+DrhTQ2ocyIL8IM3jTtekeSqFsdVry36rj
 S7UvDFZkfNsOyPsJgRz+VIfAX40w2wJ9HnQb7zVaFP7C2Uqs8mdx0o04JNOx9vw4miaGpFJCB
 B2/LRA5vpteMOsJMtOxUg8WOvMyjOBLZZPlD5FlHDa3b+3MPY6v62LATD2XC44K8hXHjCKeyk
 nh7xBgtK/jOinyjFjOPggobNu5ObzO5bV/ioTemfYZA0fwo/JA7NZ1n6dY9wYxmy3TJB0opqS
 yQJZT8plt/+39JF2sIs+2dOTP4f8Q60FdRsYu6D2gQLqPXDjAGO2trC+xDuNRrUmlzhngAwIQ
 g4Hv1UsOoAsaeWrwXOcFtA98OwXwdWqYwF6uX9z/8WG9gXPqeEFb7GqcR8FJmO4dgE3qo79GL
 B2wzwQ0MT9vcNw=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

The V4L2 control API was expanded to take 64 bit values in commit
0ba2aeb6dab (Apr 16 2014), but as this driver wasn't in the mainline
kernel at that point this was overlooked.

Update to use 64 bit values. This also fixes a couple of warnings
in 64 bit builds.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/controls.c | 14 +++++++-----=
--
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/controls.c b/dri=
vers/staging/vc04_services/bcm2835-camera/controls.c
index 848b14a..89786c2 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/controls.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/controls.c
@@ -78,10 +78,10 @@ struct bm2835_mmal_v4l2_ctrl {
 	/* control minimum value or
 	 * mask for MMAL_CONTROL_TYPE_STD_MENU
 	 */
-	s32 min;
-	s32 max; /* maximum value of control */
-	s32 def;  /* default value of control */
-	s32 step; /* step size of the control */
+	s64 min;
+	s64 max; /* maximum value of control */
+	s64 def;  /* default value of control */
+	u64 step; /* step size of the control */
 	const s64 *imenu; /* integer menu array */
 	u32 mmal_id; /* mmal parameter id */
 	bm2835_mmal_v4l2_ctrl_cb *setter;
@@ -1250,7 +1250,7 @@ int bm2835_mmal_init_controls(struct bm2835_mmal_dev=
 *dev,

 		case MMAL_CONTROL_TYPE_STD_MENU:
 		{
-			int mask =3D ctrl->min;
+			u64 mask =3D ctrl->min;

 			if (ctrl->id =3D=3D V4L2_CID_SCENE_MODE) {
 				/* Special handling to work out the mask
@@ -1260,11 +1260,11 @@ int bm2835_mmal_init_controls(struct bm2835_mmal_d=
ev *dev,
 				 */
 				int i;

-				mask =3D 1 << V4L2_SCENE_MODE_NONE;
+				mask =3D BIT(V4L2_SCENE_MODE_NONE);
 				for (i =3D 0;
 				     i < ARRAY_SIZE(scene_configs);
 				     i++) {
-					mask |=3D 1 << scene_configs[i].v4l2_scene;
+					mask |=3D BIT(scene_configs[i].v4l2_scene);
 				}
 				mask =3D ~mask;
 			}
=2D-
2.7.4

