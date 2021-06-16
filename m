Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 281D63A9106
	for <lists+linux-media@lfdr.de>; Wed, 16 Jun 2021 07:14:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230319AbhFPFQG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 01:16:06 -0400
Received: from ni.piap.pl ([195.187.100.5]:35862 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229476AbhFPFQF (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 01:16:05 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 144EB444303;
        Wed, 16 Jun 2021 07:13:56 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 144EB444303
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1623820436; bh=c/pH9U+Ve+BSKl9inLEXRVuYQI7VKgWmeCogGi08N8Y=;
        h=From:To:Cc:Subject:Date:From;
        b=GiPW3wN08r3ictYZ5BYkDFYy0SitE0zaF83usyVCIeUEji/FLl9+rLDA4QSe3WNXl
         AwRMm8gtyL4iQ0eJ/uc8481vvKQXtGOm2GybRPtVDHHrIm2G5/KGlcN/ogc/ChBO55
         xe52484+a17wW1/cXNkuQzuwVTOSsrmlXWn4gB4Y=
From:   Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH v2] TDA1997x: enable EDID support
Sender: khalasa@piap.pl
Date:   Wed, 16 Jun 2021 07:13:55 +0200
Message-ID: <m3mtrq75nw.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 4
X-KLMS-Message-Action: skipped
X-KLMS-AntiSpam-Status: not scanned, whitelist
X-KLMS-AntiPhishing: not scanned, whitelist
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, not scanned, whitelist
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Without this patch, the TDA19971 chip's EDID is inactive.
EDID never worked with this driver, it was all tested with HDMI signal
sources which don't need EDID support.

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>
Fixes: 9ac0038db9a7 ("media: i2c: Add TDA1997x HDMI receiver driver")

--- a/drivers/media/i2c/tda1997x.c
+++ b/drivers/media/i2c/tda1997x.c
@@ -2233,6 +2233,7 @@ static int tda1997x_core_init(struct v4l2_subdev *sd)
 	/* get initial HDMI status */
 	state->hdmi_status =3D io_read(sd, REG_HDMI_FLAGS);
=20
+	io_write(sd, REG_EDID_ENABLE, EDID_ENABLE_A_EN | EDID_ENABLE_B_EN);
 	return 0;
 }
=20

--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
