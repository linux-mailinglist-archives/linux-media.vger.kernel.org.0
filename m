Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B48E486D61
	for <lists+linux-media@lfdr.de>; Thu,  6 Jan 2022 23:49:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245271AbiAFWtw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jan 2022 17:49:52 -0500
Received: from mout.gmx.net ([212.227.17.21]:54411 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S245167AbiAFWtv (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jan 2022 17:49:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1641509387;
        bh=B2ZEmT9Gh5ABnR3Ac9FJbisLyN2YFewVRt3F9UqwsQM=;
        h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
        b=TH/acN3FlN3+wth//RbNRdy+j1ItbAkzAr+8/3uFWa3sS0QD/X3FJxHfdLJSDI6P2
         P0sX667kv4AioXdShS6vmrUfxdFyXAtWkaWwRYnWvYpcx88LBgToKR9X+sN7bhSdtg
         3uU5ZKWkCtKa2SZEaHjFOauoCZoIzRYnOl1OjGSg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [91.65.60.26] ([91.65.60.26]) by web-mail.gmx.net
 (3c-app-gmx-bap68.server.lan [172.19.172.68]) (via HTTP); Thu, 6 Jan 2022
 23:49:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-d0015ea1-1da5-4c7d-a75b-781fb26dc339-1641509387112@3c-app-gmx-bap68>
From:   Robert Schlabbach <robert_s@gmx.net>
To:     linux-media@vger.kernel.org
Cc:     mchehab@kernel.org
Subject: [PATCH 1/3] media: si2157: fix 6MHz & 6.1MHz bandwidth setting
Content-Type: text/plain; charset=UTF-8
Date:   Thu, 6 Jan 2022 23:49:47 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:dYXUa1myVh1tNHmF2rCOtvFXnvLkJc2lNeFnm77LIblQjUcbuf850AZelwe7tWEzW++vY
 dXL5lJR/f9xpkOUvA+p/i9qX86smXJ3aPZwyK35Q3i8ua3OerXZRi8Bt10oUunuWslujPUqBh/8n
 Ja0dxvYPfQqWuvDAsUh8SO0B8IrjBcaN2bHzJhsagFwkw01c+xC+FAMfv5d5HqTSZgB5wzsf/Hem
 kVEkrdGXYH9VMmxGZreUiRY4AlHfcwG/DwEKLhUP30JFEUxGEgyqldDVenF8KRKiLgMLWD9bbYOX
 tE=
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:svet0m3gs/w=:E8nV6wj7mnCDoo7ZHkWVUo
 guGq3ZzUJ2C/cNNy9dVa8Xy3rK++ouWGTCV79F98WSV/oUhed3UiPWGrMRsxGJk5rlZ3/x6/w
 ovYZ5P691yCO2gU2dSOxtNXVIzVgtHaDc3WNC+vjUPPPKdlVwBXJwNy/+TbOCibPUq5rhGUyv
 byDo6b//GdcJNlwYPuHFbP4kO6wIEOc9ZrutM6mvBkuleClpwe/7iArEaAKN2HU8kORVFmK/H
 JS3vsiSWRwu6uNSlQ37K9ihV+zgipEzspM6itxBTN6vhrNESJg7x/4tYBXYAOfsAKJvuUqEnW
 +UMv1xau87abjC3GbZynf6SUtFQNKLLKzkDaru32nlwQf7u6JkhacgOWhIqQYoywwFZ1ncM71
 yV7MzpJOwI7Ss1Z+7cYELpiUoygKL0/m19tm7T9fDdkaUkrL5vtIQl4IOr7fXkvHUECzUAA51
 bph392bLp/YvO+Zgy8M5e/dDqSe5klykm+6jjF2tcu55hJBsP2lHTAxKpoMQ5HtJelCDJZ9u/
 yoWgUCLn6gdXylEL8nPgNdJSwgW/VTVBPhpjmADCKS/tRsoyztPjnDdHLuDYYcUDo9DwZc1I2
 g34fqzmRnJQHA7tT/qokjoYbKCjDUsG/BxE3WYc3HoydP/2cWsWxpVzPaJ5yTC9Mt1LQMlyvK
 uxHhaMkXha9OoAD2SdDxEetLgcbElgXm1DU1ByDTRVq7ihaEqSOiOXA0A6buqxDiK58j4Xx51
 pYPEnWs8rrAW/wGM6FLroJtoPnTkQ2UEm+R0tPNFwiBZWCXJ0v3wQgAhkOmgx+NlCnblrCeai
 cmoapD+
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Commit 98c65a3dac95 ("media: si2157: add support for 1.7MHz and 6.1
MHz") introduced two bugs: The 6.1MHz setting was always used for any
bandwidth less than 7MHz due to missing "else" keywords, and then the
setting was not specified as decimal 10, but as hexadecimal 0x10, which
makes the tuner refuse the tune command. In sum, it is not possible to
tune to any channels of less than 7MHz bandwidth anymore.

Add the missing "else" keywords and convert all bandwidth settings to
decimal to avoid any future decimal vs. hexadecimal confusion.

Remove the use of the undefined bandwidth setting 0x0f for bandwidths
greater than 8MHz, which is also refused by the tune command, in favour
of using the default bandwidth setting 8 for any bandwidths greater than
7MHz.

Fixes: 98c65a3dac95 ("media: si2157: add support for 1.7MHz and 6.1 MHz")
Reported-by: Robert Schlabbach <robert_s@gmx.net>
Signed-off-by: Robert Schlabbach <robert_s@gmx.net>
=2D--
 drivers/media/tuners/si2157.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/media/tuners/si2157.c b/drivers/media/tuners/si2157.c
index 481c5c3b577d..76dc10dd2518 100644
=2D-- a/drivers/media/tuners/si2157.c
+++ b/drivers/media/tuners/si2157.c
@@ -459,17 +459,15 @@ static int si2157_set_params(struct dvb_frontend *fe=
)
 	}

 	if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 1700000)
-		bandwidth =3D 0x09;
-	if (c->bandwidth_hz <=3D 6000000)
-		bandwidth =3D 0x06;
-	if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 6100000)
-		bandwidth =3D 0x10;
+		bandwidth =3D 9;
+	else if (c->bandwidth_hz <=3D 6000000)
+		bandwidth =3D 6;
+	else if (SUPPORTS_1700KHz(dev) && c->bandwidth_hz <=3D 6100000)
+		bandwidth =3D 10;
 	else if (c->bandwidth_hz <=3D 7000000)
-		bandwidth =3D 0x07;
-	else if (c->bandwidth_hz <=3D 8000000)
-		bandwidth =3D 0x08;
+		bandwidth =3D 7;
 	else
-		bandwidth =3D 0x0f;
+		bandwidth =3D 8;

 	switch (c->delivery_system) {
 	case SYS_ATSC:
=2D-
2.17.1
