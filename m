Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B9F0058A46
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 20:57:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfF0S5L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 14:57:11 -0400
Received: from mout.gmx.net ([212.227.15.19]:37617 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726508AbfF0S5J (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 14:57:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561661813;
        bh=mXNl+XXx/SsyPzhdlqC9YK8bVtXP03p3JkGORVWAcMU=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=F1G90QyPe2SlNW9KATuDq78b4ejdA75HEYki9j29jVwkYnk7mM7YpNZSPUNWjgKQf
         XU7X1Cm8A2oKhufAy2VTzLCbJkkE+PIa5OSDmOB+uDMkOjWHYUrLPUbQiUvp2DnoG0
         yanTaZx2+SbpGjN1KRs1Q4x4LEaahMi6yCzagEus=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx002 [212.227.17.190]) with ESMTPSA (Nemesis) id
 0M23zf-1ia3oM2tX1-00u39s; Thu, 27 Jun 2019 20:56:53 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 13/31] staging: bcm2835-camera: Fix missing lines between items
Date:   Thu, 27 Jun 2019 20:56:10 +0200
Message-Id: <1561661788-22744-14-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
References: <1561661788-22744-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:uTPgukxSV32JLw6V83fULGu7PQ5Wfy7OdHFGDQDF8sVHhzCMHkV
 7+/C3Bu7dmc/gSJ5AzgFDPXPceKNKWICryuJj8h3QoRiHKt92p0pxnAAW+2WZJzbrLHcmRx
 YI1aildOO5SRfw21/ln58U1I39yUN82+xpx8kzqWdNCr7gOJ4fUZSGmamLn4I5IS0+7YaZS
 0jTYHyU5AHee8t8czJoAQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:k88a5ZznIWI=:3xAviE5pDVLgLsTht3p8Pm
 UXuv8KLqXQ1NlQGuoMoGEEzmoSLRmAlV0sjt+aytKWYfPnm+Ws/PMfUCnDIgSPO8Y4IBdyM7Q
 v7XFDGOohM9FTMXFcLH4pZKIcVGPotXoiI2IrG3iiu3bACBfTAq/Q/TM9A8UwSY16YwQfuQqn
 eTB6ZFd3gvARF2iALvS6pA2gBBAq3lPVXxpYQ44w/Ic/rcxctrqkUyrLriV+Z4rqG20KDlyAO
 VkX9uFXmaTtxb34tjNEgcgubB2wleAFZ4Pw/5+lNQe1Q4CqBX5CVMS0Ubcz2hqfJxYD1ilqRO
 E8cEBrqxRbjeHMKc5Qdgz7SfFZcldpHgnghmDNjaIX6j6lrh3cs7xLj6qzXkU/rFFUns+xeGn
 0zKZDEq/1vf4GdD3EG7yVytVlJZsuyu/TUrr8Fkp/OWf3u6+SLyr10HTo4aPjC+UPNwu5MKOe
 LeoWrpwuNsBFM3QheCdHCPQdppHf22HGg73a1bcRvJ7qNU6BaR5UzcKw+qOqYZHt9xb9w5k6w
 CRwY4eoPZLYrK3cCc30iKpo10c6LHi3LR3SnLx5gMxpkRRN4I0AwA3oGaD4HeyUZy3ZkuJ85Z
 yaGeCoFbBXnmVda/4DcNnyFi0hwLFf8diTbCUT6WrK1FnxLINzD4OqB2qEcIh4xekyvlAQIqk
 rc+rsFz+zpkoVwKYE8OfQVDXLH0uhlWe6IgHeJ5mMqo/8NUx+263Nlp9X3JM5yO8B5F7dmpM1
 OzZFhPhqLsg85SOyAGFzEIxcqSoZPb9uHJyL8t3cbUV/QLp1glfKNZzvzi5rWX+2EQvxDipOA
 0+mZw6G3Q4sSgyj8euMDHETO4kxkVNHmJB7fLm/prZRL8FCt2ISHoCaeSdELiy74/oNZqiBMg
 oxkRdszjMyPgpKH0njzfEmT5T+32qpGz01STdOK8/TfT7owaWqG4SyoFhqzx0aI0lYUWMgqnU
 R99WeTJmQpUJckwiaesZYY2Djd3qhZxvHWi8G2W15QouwH5KLhgDLQNvYbyU1s2Be0Qn4kKiz
 nMhRnAM/7Z6JEXrrbp221DjRUT2Xuk5Ifnv7vrJ7RTORIyX0dzQsL+n2vWu8+BJhvymgNygN2
 oLh7kJAVzFTkd0=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Fix checkpatch errors for missing blank lines after variable
or structure declarations.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h=
 b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
index b8a466e..bbfe8fe 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/bcm2835-camera.h
@@ -130,6 +130,7 @@ int set_framerate_params(struct bm2835_mmal_dev *dev);
 		(pix_fmt)->pixelformat, (pix_fmt)->bytesperline,	\
 		(pix_fmt)->sizeimage, (pix_fmt)->colorspace, (pix_fmt)->priv); \
 }
+
 #define v4l2_dump_win_format(level, debug, dev, win_fmt, desc)	\
 {	\
 	v4l2_dbg(level, debug, dev,	\
=2D-
2.7.4

