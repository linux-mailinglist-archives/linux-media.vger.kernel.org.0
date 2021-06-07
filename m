Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D30AF39DA99
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 13:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbhFGLG1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 07:06:27 -0400
Received: from ni.piap.pl ([195.187.100.5]:48522 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230483AbhFGLG0 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 7 Jun 2021 07:06:26 -0400
X-Greylist: delayed 485 seconds by postgrey-1.27 at vger.kernel.org; Mon, 07 Jun 2021 07:06:26 EDT
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id DA54444421E;
        Mon,  7 Jun 2021 12:56:29 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl DA54444421E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1623063390; bh=bIhGyPfdPrGhgn4HB6nQiigqBUnu3qmIFy2LxWXegeQ=;
        h=From:To:Cc:Subject:Date:From;
        b=mtuxot/zddC0WIdM+d9zoQYOgXuLOVxOxthPRUSs2BDapRrsS4ZX4ZmQXeHAAIE8A
         1INtF9ft+RMH6y9IVHeuJPD/CwHlW/giXAsrrHAhTMdar9c0aaDrq419eI6+70exON
         SYdt769KprzCu9apZmy9qVtmK6/NS7vJLcYpZr5w=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH] TDA1997x: enable EDID support
Sender: khalasa@piap.pl
Date:   Mon, 07 Jun 2021 12:56:29 +0200
Message-ID: <m3sg1uq6xu.fsf@t19.piap.pl>
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

Signed-off-by: Krzysztof Halasa <khalasa@piap.pl>

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
