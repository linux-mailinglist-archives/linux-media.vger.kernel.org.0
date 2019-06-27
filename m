Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8346E58AA4
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 21:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbfF0THO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 15:07:14 -0400
Received: from mout.gmx.net ([212.227.17.22]:35127 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726497AbfF0THN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 15:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561662412;
        bh=jDTS8viFYqrDbHal1MRfayty/onAySUVJktCMM7U9LA=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
        b=boyR1b1cVnoKHMYAWqz5F14XVnOO+5f+PR5CnjctNVZzad1WK3Vy7CadjSAX0ljbH
         O6Pk7QST70wbzg6ci6XpQ7XmQsQeBk2s1EDQ7PIn9caoY/6l/g8chMvCYxfyYKa1Qe
         nXUBRA9lg6F9vG3GD28ROjT+q8WtCG8Ph6IZqkdM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0M6730-1iVuty1hPe-00y91P; Thu, 27 Jun 2019 21:06:52 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 21/31] staging: bcm2835-camera: Unify header inclusion defines
Date:   Thu, 27 Jun 2019 21:06:16 +0200
Message-Id: <1561662386-23045-2-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
References: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
X-Provags-ID: V03:K1:u2byLpeY81owIOe0u0m7dsEbi1BMOnsvUw8J/3/4FrRXeaW/irC
 LoXykJgzLFToxCJLBQfNgDO3MuvZJ78slALKTqVjV5Ln8lJCa+ONkMb4KLK03VBpkYLIPqV
 waJKxhxujuJXV29xe7NALB9W7esBFPD46qUJ2wo6/K35MUpWRSo0Lub26e+9NpeIWqsv6ax
 klNVgSeMRmS0FU3LTlYSg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:Dz6jkUEmH98=:d5Jk/boCMg8s1Sc0nJL9K3
 7TrzZunCtfiu8SMe6z4qS/qwMuGih7CpkVhHJEYspFnnOmcpIlWUAuYXbR8M7zMyCWqo3om+D
 FLmBcTKDSiLvqdrGhi/X4Xvjtsd0xS3w07bPiN1ozjF/f0n5yE6eVPOJid1U6wAASNavjUpj/
 CR7YbVBNyMp42Hqf8XKIUiTXFS/4VE0m1pfaCq1XavTj5VLhuzafPwXV9hJmR2E2OAy52MhlA
 fZzg65dtHyahvFzYW6ynkl7XLJmYNw89JjC04300NJ6AwBuqAik6r9gdPctofRfU42x7K5cz1
 j88PIsx4Is56WQhjskTfBlRnt/ZnQFrUkw0gAqtgWj29NrF5zHd2HLA40dWxfeUV5T31lG4OT
 pWR+YpzY3FNQoiK6H0BfxOabM9p+9/OtZRIgG74EPRKFPSYX5NhPDZw4SHzTbLbdXANiNsb45
 g2IJjijr72WX48pUWcK0M0Y0XaaH983wsXm+pCn0u5SYwy0CbyAL0aykZNF7AeA8M58U+ExTz
 o0yb0VzKrqtVwqVz5Nmo4y7S1+eCUSo/UTAJA/RptPhfpm1RgUB0mIbDWEvaG6tvUAm7xBxjM
 akVIGlzgI1KD2hJj9LHsJWSLDvgyvFh7Fsg85s2zluAYQgvJbNPmr5u0Ak+w1yQPvkknhB4u6
 49QoIoKiEhWJR0XzH+0htR3i24EvPG69+hfVug1pi1k5BL2sRhxMaaKYg7OYf0qS4xmfPHCKw
 WvuCZfVTQ8nzaB3ehfiYDN71MjwY+RMy2qNEro8DUzpiE0rEd72vIP/N7HPrKFEYlpGgFoqA/
 7XFd8EGLrdyj3rfLN5AOrM+3xmBNWCCbrbFW6vWyoqcZ/jJ2CwmXyzjdSR2jcZSsT7h0UuwAe
 KVj2bo5C9c/igB4fv5EtOgXYhBSCOMOu+J+7ozqGdxKhIuXZsbSs9B2Nr3EYmxpi/VUKH14Zm
 wEXAcUsuIx83vHacAWD+pKiXNBTRi0LF7TPGZ9vFnNyZz3lhMf/BtSeyBJsAlOFruHPzPlDB4
 kIPrfg1P/18XBzQzRvJ5RiZunT0pBQp9wdfskaK/GcKwvvTZX4zyedAsaksY+9veSBjYXxO7/
 KSQppR5fjlZh00=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

Most of the headers use ifndef FOO_H, whilst mmal-parameters.h
used ifndef __FOO_H.

Revise mmal-parameters.h to drop the underscores and make the
headers all consistent.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.=
h b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
index 6d21594..da21ec5 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-parameters.h
@@ -19,8 +19,8 @@
  * @{
  */

-#ifndef __MMAL_PARAMETERS_H
-#define __MMAL_PARAMETERS_H
+#ifndef MMAL_PARAMETERS_H
+#define MMAL_PARAMETERS_H

 /** Common parameter ID group, used with many types of component. */
 #define MMAL_PARAMETER_GROUP_COMMON            (0 << 16)
=2D-
2.7.4

