Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD3E441F8E
	for <lists+linux-media@lfdr.de>; Mon,  1 Nov 2021 18:48:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230246AbhKARuh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Nov 2021 13:50:37 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:55704 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhKARuh (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Nov 2021 13:50:37 -0400
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 41728929;
        Mon,  1 Nov 2021 18:48:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1635788882;
        bh=W9HyK+vhDRW88PZ3tjPyKPtS1OGK3r2MbvJO5AQmumU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=sAn9kXqpjDxqMXtazqjqV0mSqE2uFmifeG/kV2VcV4YmWG6PIUipaTCg1cpQ92rz+
         02SmyVGBc5xzAr/ix6DI/qLIveQhHsh3ePzKNWWPJ1KBPfrp1PH2nRzlporAherNQ1
         0dRoaNvNkIqDxCLAP7Q/Iu3EIt6vsMITap8J+bdM=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <YYAiihIejUuF+uu0@oden.dyn.berto.se>
References: <20211101171949.1059566-1-kieran.bingham+renesas@ideasonboard.com> <YYAiihIejUuF+uu0@oden.dyn.berto.se>
Subject: Re: [PATCH] media: i2c: max9286: Depend on VIDEO_V4L2
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc:     sakari.ailus@iki.fi, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
To:     Niklas =?utf-8?q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Date:   Mon, 01 Nov 2021 17:48:00 +0000
Message-ID: <163578888022.1097798.14100032684481849335@Monstersaurus>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Niklas S=C3=B6derlund (2021-11-01 17:23:22)
> Hi Kieran,
>=20
> Thanks for your work.
>=20
> On 2021-11-01 17:19:49 +0000, Kieran Bingham wrote:
> > The MAX9286 has not explicitly declared a dependency upon VIDEO_V4L2.
> > While this dependency has likely always been met by configurations
> > including it, the device does use V4L2 core, and should depend upon it.
> >=20
> > Add VIDEO_V4L2 as a dependency to match other drivers and prevent
> > failures when compile testing.
> >=20
> > Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> >=20
> > ---
> > A bit of an RFC almost, as I haven't seen any failure on this, however
> > this does stand out as different to other drivers, and the recent
> > "max96712: Select VIDEO_V4L2" posting has shown that these deserialiser
> > drivers could find themselves being compile tested in a manner which
> > would other wise break.
> > ---
> >  drivers/media/i2c/Kconfig | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
> > index d6a5d4ca439a..9eac5e96c6aa 100644
> > --- a/drivers/media/i2c/Kconfig
> > +++ b/drivers/media/i2c/Kconfig
> > @@ -468,7 +468,7 @@ config VIDEO_VPX3220
> > =20
> >  config VIDEO_MAX9286
> >       tristate "Maxim MAX9286 GMSL deserializer support"
> > -     depends on I2C && I2C_MUX
> > +     depends on VIDEO_V4L2 && I2C && I2C_MUX
>=20
> I think the new 'depends on' shall be on a separate line. Reading this=20
> is confusing as now the V4L2 is mixed with I2C while GPIO is still on a=20
> separate line.

Indeed, I'm happy to put it on a new line too, but so very many of the
other users of VIDEO_V4L2 and I2C here in media/i2c/Kconfig use
  depends on VIDEO_V4L2 && I2C

So the difference is having the I2C_MUX ...

There are only two other 'patterns' that have also added directly to the
end of that:


drivers/media/i2c/Kconfig:      depends on VIDEO_V4L2 && I2C && I2C_MUX
drivers/media/i2c/Kconfig:      depends on VIDEO_V4L2 && I2C && GPIOLIB
drivers/media/platform/Kconfig: depends on VIDEO_V4L2 && I2C && PM

(Where the I2C_MUX is MAX9286) but it's not a very strong pattern, so
splitting is still fine with me.

--
Kieran

> >       depends on OF_GPIO
> >       select V4L2_FWNODE
> >       select VIDEO_V4L2_SUBDEV_API
> > --=20
> > 2.30.2
> >=20
>=20
> --=20
> Regards,
> Niklas S=C3=B6derlund
