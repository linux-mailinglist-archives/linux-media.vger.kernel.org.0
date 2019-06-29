Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B61255AB09
	for <lists+linux-media@lfdr.de>; Sat, 29 Jun 2019 14:49:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727037AbfF2MtU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 29 Jun 2019 08:49:20 -0400
Received: from mout.gmx.net ([212.227.17.21]:54151 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727025AbfF2MtU (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 29 Jun 2019 08:49:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561812540;
        bh=AO24dhR33sAimyv1ny5zTcoHxXYyQIqUHySiBAbYjys=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=XDV6MBnWhQN6JHJAe6lAfXxJOZkAk7rOVJnbN9256tOkxGGUAxnJoJAX/0IFT58dL
         TpyC4l0qMv1nxA7hzI6KCF3uIavwEQ6YpbHePEBWGEsNGSqDZvWY+a+oxniDcOH69F
         yO81LRDrZV4g/GFwCEQwTG1GuTTkqW6udLSacFUI=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1M2f5T-1hhSy43Ryp-004ANR; Sat, 29 Jun 2019 14:48:59 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH V2 20/29] staging: bcm2835-camera: Fix multiple assignments should be avoided
Date:   Sat, 29 Jun 2019 14:48:27 +0200
Message-Id: <1561812516-9087-5-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561812516-9087-1-git-send-email-wahrenst@gmx.net>
References: <1561812516-9087-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:4nTPGPJkQrZ8QTOIRCsHWddGEo5EsUCmCY5X0F+iDLRIBIVxF6C
 26GoGSvixmPNbN6zYQcGnBQl04fIlxac5RwX53y807grnU82/cDIAeNWslR3irBOqztgqKN
 fZbfqZ+KYfqXph7uNjBnJAvhuVBqoyAP0ebiIqVjdnMFnsYZVgKdHDOdwePXakjf4xqUviZ
 pek0ZzHKdnTa1XHsuEJ4A==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:x4SvSKJslW4=:XhhQjHajOyXEX0D8Ngd4o5
 hYAGfjuTsXHXPFHiaq0YJM4H+wLwfx6r0U7EtyEAL9g7lEhzw/4xpl2BOgB2dQPT6W83i63xx
 aZzNnd2cJjpSCNpixwN96iRxfJYxwiZSZKIiP9sPEZnunaA1XYfeGEyusQhkttQfXsJ5HWCnn
 MMJGDrldzVoF4bBN6Jo5vvGmsBHwNGhMC9T851HLsrRsxko7y8ZJ3Uzp7zjl3xk7r5Ngj6fML
 6FHaRleI8qP0DddjVyWVu0FnvAi/Ldf5p8CHINEtQq7wZx7WjfcgfJ2k7fBg6lWnpjx0j26Qv
 KPvkspuxvaoMldUGUy76bqsEYiPFkmwWoNpJaJzcfGpoWRg29TkPw9reJKSHV9LvpTnqg5z/D
 HKzE2hz6/08wz8koPDVQY6KAj+/5ZCLOJNhm8yV3Ol5sLJn0NXJ+VkJ7QuT4O9jkONgiXmZuX
 Cv0IAAlNfhg3aM+1IILk39hySfgiSRNHOqkptR1i+HkbSyMDWrKszqhN4mC16Q/SQ9DQecKGr
 Di63Bd93evDOSHlqqFVv/oQM3cuCBVvyXaBsNhnri8h8HKS2P7/OJ/wqa9MLPAjS64NgNKUI/
 K8Vz/86KNeZfG4Yd1lz/NsyDkieVbLxUuoAZYMoaiVZeXNrJoPSJkYpmjMxp7TAJTQCwR0/es
 h2LSftp+N0k6AOlu+qJ/mmY5x2Nk6/b2bebxCAoBPrjxzcmiNY/qgvzOauC45pj/upPtKQ6Lw
 oUDRcNI5VoHahTK/IW0I81GoYs128HLMgFZXIMpfNwKTU/AJgs4HWw2xdpLeEJrwNUvPmqg8z
 fHD3NOjuLKI/inU7njlRzw6AwwlLCZgSGN6SexPGPyHbotGpmuYNMGZj5X63AYzrsX2iYbYqM
 E+i1QuKMhwAK9UJ+Sw7hh7hmYMj2Ovb5/PVmp3BxKjaAyUi6SH7EQIYGUoP8Wtz31HDp5Xn2D
 NIN9pZTRs/JQb/5El1VmJYFJ3He/1I45aCG2i1ARBlShvJqHf1lfJl35Ej+WAZF8z90IfD/iO
 AL8T+mBvA0dZHw7DVyDV97F/XoaW41IXseCqyejKjS9LfHaVftTDm5EpmJoBlqFGAftGSyCJR
 NMXiP1U7V3MJ8c=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Clear checkpatch complaints of "multiple assignments should be avoided"

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Acked-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
index 167c218..1aaae57 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.c
@@ -1031,11 +1031,12 @@ static int mmal_setup_components(struct bm2835_mma=
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

