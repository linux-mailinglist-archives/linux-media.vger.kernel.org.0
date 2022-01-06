Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 181C5486D66
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 23:51:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245283AbiAFWvo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 17:51:44 -0500
Received: from mout.gmx.net ([212.227.17.20]:33093 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245279AbiAFWvn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 17:51:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641509499;
        bh=AL6ELuGvESOTCneu0XvbjXIp415GjO8nACjeZHMPuyI=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=cOr10opSE2BMwiGZsGardZLssZLyw3yNXkEnhJpv3Q50n3AjgaZR1eOOsL6257wEa
         rsPHk3frSmW2ozXXsp87Y/04JFJFgCit+svkB99ndpnQ44W//2Gw0i14LUlbhORBm/
         ffyMD5omYFvYOJOJ/Qt+Kj95kZTxkffB2rOwJMEQ=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap68.server.lan [172.19.172.68]) (via HTTP); Thu, 6 Jan 2022
 23:51:39 +0100
MIME-Version: 1.0
Message-ID: <trinity-931c0e68-88af-46cc-91a1-986754798a4f-1641509499366@3c-app-gmx-bap68>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 2/3] media: si2157: fix bandwidth stored in dev
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 6 Jan 2022 23:51:39 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:8f7UHs1w3+HIZW1VqwYJq4Mei2zePxS2KS3OUdpzsvHBLqJm2xGbUIZutZR3ZGBFqDD7a
 pObJLKm+D3XBx78Hb6wTOOYIq6pM3lf43y99t9sQGecJT6glZHR3vqSvDxqxD6YX9Rb2WeKaEbOE
 LMxVMai1FgC1xXNH+bBZlvQ22j7EJ6C38qTKB8P7spskmIUHTRUoCIDMjkVBL+LxZFbKpQMY0oBH
 +bijISeGHhUeNmrY1XowrI4xIyJjXfusE93MNxJM4K8unWsrbbL9n5K48F0MM+ZddGrW51enIgIr
 M8=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:jWJbbwCC5+s=:lj0GtpJNY0YGwWykZrEYl0
 LfstOCZfnkdgKmYSV6ivRiz4imegIjWVAXwt0FawAPFT8Oy8tFCajmuJJyp7uCIINIqEJiJJ9
 KsxdPoAeG33AtU/Kc9TwjxhjKh7A5UN1HWbw5vw7xDwD+cf47R31kvyWbZP+vVYAQPZDjYGwe
 KpJ3Pi07M0fD+omKoCpxAE6l3CfJ+6BcdSqOWcEuQVHwS2xm3Ra/Xbv4fvNmVGqozjP61cl9O
 DO2n4rb9ZWiAJBjGJl2y15FCZ3quKaGT6y7eAPp2F8LEULOSlbSEqHrgPfq024g5v5TI2z9ji
 QUW2/eg+O0iVcllh/uP2Gt9BHGqUemf3dkiMg+dpqYE5WepFk1Llti2AX73y1jg5QnJKey5BN
 vCIaNbK3o7mjEE1PN6Gx5INT4lO8Q7ZsDFQ3Bu1R3vij4ozEU9Md9nt1Ec0z4vASxvTh6+CIR
 dKwc2qkjXIGO4i1w1AbO2ZQhzh1sUcKk9RQxDpx1KN5GJL0UDnYTdpwDWRUjkrh16EZ3hBfWa
 P1cxOZAPojeWFeGuJQ9EQEDKg5qNwkvnnB7ftrA2K7yeSbET1uWBxEODocseFn7DvAumTHQrp
 fk85Lw07DCCN0n6ihWTKDEEh/ZJR7XR1Mi1c74smsO94y2GnnWLP1zFhjbPLeRuY+hDMbAumX
 QCBnSPnL9MLb9pAIwSH8Rp6MYqchLDyfk5nxOndMhumRcbMhDQn1798H/qBtekBYlE0ZINIZG
 dQQIjP5XovcxiQ8eI8bhEzszGzLOqmes7v6cjuiyV36B4Y9HWmOSDcy0ZNL+gw2MWyVpSqR1d
 b9aVYzS
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Make digital tuning store the bandwidth in Hz in the private dev struct,
rather than the hardware-specific bandwidth property code, so that the
get_bandwidth() function returns the bandwidth in Hz, just as it already
does when using analog tuning.

Reported-by: Robert Schlabbach <robert_s@gmx.net>
Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
=2D--
 drivers/media/tuners/si2157.c | 31 +++++++++++++++++++------------
 1 file changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 76dc10dd2518..b1e00b635dbf 100644
=2D-- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -446,7 +446,8 @@ static int si2157_set_params(struct dvb_frontend *fe)
 	struct dtv_frontend_properties *c =3D &fe->dtv_property_cache;
 	int ret;
 	struct si2157_cmd cmd;
-	u8 bandwidth, delivery_system;
+	u8 bw, delivery_system;
+	u32 bandwidth;
 	u32 if_frequency =3D 5000000;

 	dev_dbg(&client->dev,
@@ -458,16 +459,22 @@ static int si2157_set_params(struct dvb_frontend *fe=
)
 		goto err;
 	}

-	if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 1700000)
-		bandwidth =3D 9;
-	else if (c->bandwidth_hz <=3D 6000000)
-		bandwidth =3D 6;
-	else if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 6100000)
-		bandwidth =3D 10;
-	else if (c->bandwidth_hz <=3D 7000000)
-		bandwidth =3D 7;
-	else
-		bandwidth =3D 8;
+	if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 1700000) {
+		bandwidth =3D 1700000;
+		bw =3D 9;
+	} else if (c->bandwidth_hz <=3D 6000000) {
+		bandwidth =3D 6000000;
+		bw =3D 6;
+	} else if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 6100000) {
+		bandwidth =3D 6100000;
+		bw =3D 10;
+	} else if (c->bandwidth_hz <=3D 7000000) {
+		bandwidth =3D 7000000;
+		bw =3D 7;
+	} else {
+		bandwidth =3D 8000000;
+		bw =3D 8;
+	}

 	switch (c->delivery_system) {
 	case SYS_ATSC:
@@ -497,7 +504,7 @@ static int si2157_set_params(struct dvb_frontend *fe)
 	}

 	memcpy(cmd.args, "\x14\x00\x03\x07\x00\x00", 6);
-	cmd.args[4] =3D delivery_system | bandwidth;
+	cmd.args[4] =3D delivery_system | bw;
 	if (dev->inversion)
 		cmd.args[5] =3D 0x01;
 	cmd.wlen =3D 6;
=2D-
2.17.1
