Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8553934E42D
	for <lists+linux-media@lfdr.de>; Tue, 30 Mar 2021 11:19:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231699AbhC3JSc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Mar 2021 05:18:32 -0400
Received: from ni.piap.pl ([195.187.100.5]:43316 "EHLO ni.piap.pl"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231438AbhC3JSA (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Mar 2021 05:18:00 -0400
Received: from t19.piap.pl (OSB1819.piap.pl [10.0.9.19])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ni.piap.pl (Postfix) with ESMTPSA id 423AC443A5D;
        Tue, 30 Mar 2021 11:17:54 +0200 (CEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 ni.piap.pl 423AC443A5D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=piap.pl; s=mail;
        t=1617095874; bh=U2rsxJHSxkDfNMjPvbE4U2R3Ifu51mUaDNbjIjemCo0=;
        h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
        b=CMx6RSUE3GH8pnvGM3gD0WNsqqMpaK2pQYvhUxkn8vWL8ZHTWYgZylsadjY+C/sgX
         2B8FGtU+VCyWr3+CRP9iVq3NHwsuhIOOxjSfxKyQABC3UhLN4V2UCj5gnx/BiZPQZR
         XvWjJbtvK5DwlplL9YlynSQbtMhZ0O1peB3YbiQc=
From:   =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     devicetree@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: RFC: dt-binding: media: document ON Semi AR0521 sensor bindings
References: <m3o8fjs02a.fsf@t19.piap.pl>
        <YFEBRGF20xhpHese@pendragon.ideasonboard.com>
Sender: khalasa@piap.pl
Date:   Tue, 30 Mar 2021 11:17:54 +0200
In-Reply-To: <YFEBRGF20xhpHese@pendragon.ideasonboard.com> (Laurent Pinchart's
        message of "Tue, 16 Mar 2021 21:04:36 +0200")
Message-ID: <m3czvhxanx.fsf@t19.piap.pl>
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

Laurent Pinchart <laurent.pinchart@ideasonboard.com> writes:

>> +  reg:
>> +    description: I2C bus address of the sensor device
>
> You can drop this, it's implicit for I2C devices.

Do you mean just dropping these two lines (and MaxItems: 1), and leaving
"reg" in "required" and in the example? E.g.:
...
required:
  - compatible
  - reg
  - clocks
  - clock-names
  - port

additionalProperties: false

examples:
  - |
    #include <dt-bindings/gpio/gpio.h>
    #include <dt-bindings/clock/imx6qdl-clock.h>

    i2c {
            #address-cells =3D <1>;
            #size-cells =3D <0>;

            ar0521: camera-sensor@36 {
                    compatible =3D "onnn,ar0521";
                    reg =3D <0x36>;
                    pinctrl-names =3D "default";

...

It protests with:

Documentation/devicetree/bindings/media/i2c/onnn,ar0521.example.dt.yaml:
camera-sensor@36: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
        From schema: /usr/src/linux/imx6/Documentation/devicetree/bindings/=
media/i2c/onnn,ar0521.yaml

Thus I'm currently leaving it as is.
--=20
Krzysztof Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
