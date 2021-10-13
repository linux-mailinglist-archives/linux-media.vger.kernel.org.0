Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 777FD42B5A9
	for <lists+linux-media@lfdr.de>; Wed, 13 Oct 2021 07:39:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230103AbhJMFlO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 01:41:14 -0400
Received: from ni.piap.pl ([195.187.100.5]:44190 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229735AbhJMFlN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 01:41:13 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        by ni.piap.pl (Postfix) with ESMTPSA id A707FC36955E;
        Wed, 13 Oct 2021 07:39:07 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl A707FC36955E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1634103547; bh=5GPJZkCmh6R4KMyc90zRKGcT2ecjuzI4fDbaZ5mnFYw=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=Jq7QRpZCQpKYz3uAgihW9NsSw4Ilf+tdFVpGWgi8tAdSIyVu8CPBTxDYwZ7+Gv1d6
         q/nCIjL9HmyuBKHnSymTJ9bwS43cyHofuXGi7tbmIbRBcxElVbtfT2QogBsMpgKrXK
         ohs5d066aKq6TBD2RoIRvBGF0FSjYASyEAzrtqmk=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Sakari Ailus <sakari.ailus@iki.fi>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Matteo Lisi <matteo.lisi@engicam.com>
Subject: Re: [PATCH v5] Driver for ON Semi AR0521 camera sensor
References: <m3fstfoexa.fsf@t19.piap.pl>
        <20211009102446.jrvrdr7whtd2rv4z@uno.localdomain>
        <m3mtnflpna.fsf@t19.piap.pl>
        <20211011143420.vm6ncl5gdv44nsn3@uno.localdomain>
        <m3a6jel9ce.fsf@t19.piap.pl> <YWXwSAm3OO/WTkOL@valkosipuli.retiisi.eu>
Sender: khalasa@piap.pl
Date:   Wed, 13 Oct 2021 07:39:07 +0200
In-Reply-To: <YWXwSAm3OO/WTkOL@valkosipuli.retiisi.eu> (Sakari Ailus's message
        of "Tue, 12 Oct 2021 23:30:00 +0300")
Message-ID: <m335p5lc04.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-KLMS-Rule-ID: 1
X-KLMS-Message-Action: clean
X-KLMS-AntiSpam-Lua-Profiles: 166679 [Oct 13 2021]
X-KLMS-AntiSpam-Version: 5.9.20.0
X-KLMS-AntiSpam-Envelope-From: khalasa@piap.pl
X-KLMS-AntiSpam-Rate: 0
X-KLMS-AntiSpam-Status: not_detected
X-KLMS-AntiSpam-Method: none
X-KLMS-AntiSpam-Auth: dkim=pass header.d=piap.pl
X-KLMS-AntiSpam-Info: LuaCore: 463 463 5854868460de3f0d8e8c0a4df98aeb05fb764a09, {Tracking_uf_ne_domains}, {Tracking_marketers, three}, {Tracking_from_domain_doesnt_match_to}, t19.piap.pl:7.1.1;piap.pl:7.1.1;127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;hverkuil.home.xs4all.nl:7.1.1
X-MS-Exchange-Organization-SCL: -1
X-KLMS-AntiSpam-Interceptor-Info: scan successful
X-KLMS-AntiPhishing: Clean, bases: 2021/10/13 04:39:00
X-KLMS-AntiVirus: Kaspersky Security for Linux Mail Server, version 8.0.3.30, bases: 2021/10/13 03:14:00 #17311323
X-KLMS-AntiVirus-Status: Clean, skipped
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

> 	https://hverkuil.home.xs4all.nl/spec/driver-api/camera-sensor.html

Ok:
"8.2.2. Devicetree

The currently preferred way to achieve this is using assigned-clocks,
assigned-clock-parents and assigned-clock-rates properties. See
Documentation/devicetree/bindings/clock/clock-bindings.txt for more
information. The driver then gets the frequency using clk_get_rate()."

Let's see:
Documentation/devicetree/bindings/clock/clock-bindings.txt:

"=3D=3DAssigned clock parents and rates=3D=3D

Some platforms may require initial configuration of default parent clocks
and clock frequencies. Such a configuration can be specified in a device tr=
ee
node through assigned-clocks, assigned-clock-parents and assigned-clock-rat=
es
properties. The assigned-clock-parents property should contain a list of pa=
rent
clocks in the form of a phandle and clock specifier pair and the
assigned-clock-rates property should contain a list of frequencies in Hz. B=
oth
these properties should correspond to the clocks listed in the assigned-clo=
cks
property."

So I'm after "assigned-clock-rates", right?

"Configuring a clock's parent and rate through the device node that consumes
the clock can be done only for clocks that have a single user. Specifying
conflicting parent or rate configuration in multiple consumer nodes for
a shared clock is forbidden."

This sounds a bit problematic, the clock I use is at least potentially
shared by multiple parts of the system, depending on current (run time)
configuration. I am/was getting different frequencies depending of the
particular system (all based on the same i.MX6* SoC, but with different
peripherals used/enabled). I think it's quite a common situation.

> Generally camera sensor drivers that set the clock in drivers themselves
> are (very) old.

Let's have a look... ov9282 is (one of) the newest drivers. It does:
#define OV9282_INCLK_RATE    24000000

        /* Get sensor input clock */
        ov9282->inclk =3D devm_clk_get(ov9282->dev, NULL);
        if (IS_ERR(ov9282->inclk)) {
                dev_err(ov9282->dev, "could not get inclk");
                return PTR_ERR(ov9282->inclk);
        }

        rate =3D clk_get_rate(ov9282->inclk);
        if (rate !=3D OV9282_INCLK_RATE) {
                dev_err(ov9282->dev, "inclk frequency mismatch");
                return -EINVAL;
        }

$ git grep -l ov9282
Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
MAINTAINERS
drivers/media/i2c/Kconfig
drivers/media/i2c/Makefile
drivers/media/i2c/ov9282.c

  clocks:
    description: Clock frequency from 6 to 27MHz

No in-tree DTS exists, but the single frequency (both in the driver -
this one can be fixed - and in the DTS) is rather limiting. Maybe
another:

imx412, imx335, imx334, imx258 - same here.
imx208 is ACPI-based.

Which driver should I consult?
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
