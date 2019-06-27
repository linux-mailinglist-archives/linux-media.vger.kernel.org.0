Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F1FFF58AA5
	for <lists+linux-media@lfdr.de>; Thu, 27 Jun 2019 21:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfF0THO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 27 Jun 2019 15:07:14 -0400
Received: from mout.gmx.net ([212.227.17.21]:35263 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726384AbfF0THN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 27 Jun 2019 15:07:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1561662412;
        bh=yqq7RYAhnRBUGET7ItFqghQOuPnMkR/UpSH+qOl5n+4=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=WaGhzEXjY+wqWa7PSn38NDpZqD2AYifWeLC0inYxETkj86n+jvJmZBYUnui7iau0O
         Izac6ZjuS85XersZNOwLyZ1mAOxzKoIo2k1pTP1Qqf/ni7My29ZSZ1hZk3/CjuS3DD
         zpPKIQv53GfbLvl0lj2OvpHvBtdL/6FC/+gt9mNg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.localdomain ([37.4.249.111]) by mail.gmx.com
 (mrgmx101 [212.227.17.168]) with ESMTPSA (Nemesis) id
 0MLB89-1hgIcH02nR-000Nai; Thu, 27 Jun 2019 21:06:52 +0200
From:   Stefan Wahren <wahrenst@gmx.net>
To:     Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc:     linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, devel@driverdev.osuosl.org,
        linux-media@vger.kernel.org
Subject: [PATCH 20/31] staging: bcm2835-camera: Add multiple inclusion protection to headers
Date:   Thu, 27 Jun 2019 21:06:15 +0200
Message-Id: <1561662386-23045-1-git-send-email-wahrenst@gmx.net>
X-Mailer: git-send-email 2.7.4
X-Provags-ID: V03:K1:PJBl2hs3AQ4EP3SFhfIA7tzboj8+7feJbCUjaXtAD2tI8TZP5y9
 1TrfJ6IoFS1cuG0qC/ACSo6Yg0KbMmTpsBDdMqRqUJrk2T6xPwzgqauR+TpXpxcPPci+YT0
 SS8nCvs59R6vzUhi/unJzHscK0EpHIwyNaXcqrQvUVSGvY9HnDFQhwM2Nlo3CrXmXKDalNb
 i3QClroEqRxyqkwUVDhPg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:YaI4J7jV4gw=:wHXzSVjhJlBreliQ4fwn1i
 40EHq13B/jmrNcobHNiF0yCsv/7CQJKTaWzXabibvyZEqQ8kdAP/RdlfpioOh0pPDbApM77ke
 mHa7hOSq+VvO+Xo9gEsIoUiL2+eWEtDSE+1BUiC39TAmc0VvTORtCt/GxmShVpWLGVX0hB6oE
 eT83LuuKi6vlocfC0WkdGzm6QzgSXbQ7TdR1yFN1+MFvFodBhYEiuuDFgVuV1Upaqw/o1Wero
 qA/d35DZR4tPRJHYnG5mdHxhESljsYZeVoByETCU9p0X+shFB3+BrQdDy7qvie2n0etFdT58h
 BnrQJhrRH54S03dZqVIc8hAFdjK9YaUaoB5KFQpKLEB3dC8k2f/RmLyynXtL2Alm2x8Dzul9r
 gJq9OWaW75ReGrcwtKeSEC5HblUPbwjcr+Whkk77iIp1OOv/27snJswgj3ZvsRFJp6g8d6Xvx
 j9q4EGR3FRiJME1IzXeiEev8naCBKnzeBcd+f5nrO7ih6UrObHm5RiwWS0xdL1bOlFCBD7SnC
 yi9y2XdANio9qUJaZST1y+HLGKjtDOHZLMM9xhieWRicVOTJWFSYc2zOHO6Z8QNKYXviUgJAn
 /+yv+dM6IyMD807i+UYWcpKL3RrEdY+Cs0qB+/r7NcKvf6pYGBwpft1yFqFtLhUPICiPNriqk
 /SGCkeD66NsxaGpjgOrinX3LqHS6F6wiz5+6DlBVfAX8sAm7VS2kHLhyJGQrZmOjvUP43JOJW
 2Pi3Mi5qrmgelpJj7cq2DL3nxHV1cuwk8NfkvKfNV6kVpKUvHEt5TzjW4HCQnQYRtiKttIb0I
 pbu0n4sCRMSO8zbRtb7fBOZCIs/0j0N3CtFk06tLXJLEn3dZu2+Url7q7hG7+JcqCxsPhrdkI
 ZafdHiIk4PVWJNt6KkPPnYFICMABjPIPRG9TfNgdUbv+7c25ojYqfA0xzxnBx1xlxUy5JT1z5
 rCJuZdWUQsf7MFP5G0UO2FNxDWnz/p6q0jSRYWkYSYLdhO4zhX89GZPzJwlRAF7kdw28pZ6us
 Kr6Z2lOIuTbqyI0Kob+ZcEyDoiKQdHu5o+HFm4cwhTifYcisKkMOTO3gIqYei/zOZRo9u9/R0
 y4XqR5IYgYt3Gg=
Content-Transfer-Encoding: quoted-printable
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

From: Dave Stevenson <dave.stevenson@raspberrypi.org>

mmal-common.h and mmal-msg.h didn't have the normal
ifndef FOO / define FOO / endif protection to stop it being
included multiple times. Add it.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.org>
=2D--
 drivers/staging/vc04_services/bcm2835-camera/mmal-common.h | 3 +++
 drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h    | 3 +++
 2 files changed, 6 insertions(+)

diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h b/=
drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
index 858bdcd..6f56c51 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-common.h
@@ -13,6 +13,8 @@
  * MMAL structures
  *
  */
+#ifndef MMAL_COMMON_H
+#define MMAL_COMMON_H

 #define MMAL_FOURCC(a, b, c, d) ((a) | (b << 8) | (c << 16) | (d << 24))
 #define MMAL_MAGIC MMAL_FOURCC('m', 'm', 'a', 'l')
@@ -56,3 +58,4 @@ struct mmal_colourfx {
 	u32 u;
 	u32 v;
 };
+#endif
diff --git a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h b/dri=
vers/staging/vc04_services/bcm2835-camera/mmal-msg.h
index 8e0aee8..43cc593 100644
=2D-- a/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
+++ b/drivers/staging/vc04_services/bcm2835-camera/mmal-msg.h
@@ -23,6 +23,8 @@
  * implementation uses fixed size types and not the enums (though the
  * comments have the actual enum type
  */
+#ifndef MMAL_MSG_H
+#define MMAL_MSG_H

 #define VC_MMAL_VER 15
 #define VC_MMAL_MIN_VER 10
@@ -401,3 +403,4 @@ struct mmal_msg {
 		u8 payload[MMAL_MSG_MAX_PAYLOAD];
 	} u;
 };
+#endif
=2D-
2.7.4

