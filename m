Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C7A863A9BB
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 14:38:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbiK1NiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 08:38:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbiK1NiR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 08:38:17 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F270F6579
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 05:38:16 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 585D9501;
        Mon, 28 Nov 2022 14:38:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669642695;
        bh=ZHRdXifb1ybNQGawKkxu2I9UFzdOkj5TFRCDdWagunM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=LUxEBZiy8MZkL57PqGbkFqQ8JZcbPMPaTb5+y2WUZJb5/Q6IXn7z3dr7f9gWXZ18Q
         AUwRHlmlBBRvA3IGBn8oryK7iaOMD+AIBowouDarioMq1V12ZPWt6EEyyHNFtj0zCk
         1KE9e+OAMTw/5Ll7Tsb1UzkCPpAG36VREiayY4Oo=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y4Sziw2nt8gSyjSv@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com> <166963953216.1079859.6469563044691422088@Monstersaurus> <Y4Sziw2nt8gSyjSv@bender.k.g>
Subject: Re: [PATCH v1 0/5] Adds media driver for Sony IMX492 sensor
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi
To:     Petko Manolov <petko.manolov@konsulko.com>
Date:   Mon, 28 Nov 2022 13:38:12 +0000
Message-ID: <166964269270.1079859.9052080973667851964@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Petko Manolov (2022-11-28 13:11:39)
> On 22-11-28 12:45:32, Kieran Bingham wrote:
> > Hi Petko,
> >=20
> > What device/ISP are you testing this sensor on?
>=20
> I'll tell you, but only if you promise to not laugh too much.  Deal?
>=20
> i.MX8M-Mini
>=20
> I hope nobody will notice the above line...

I won't laugh at all. We've just merged the ISI pipeline handler for
libcamera, which should let you use libcamera on this target (I think).

I would hope sometime in the future you'd be able to use the ISI
pipeline handler with a GPU based ISP with this sensor too.

How are you managing the image 3a? the imx492 is a raw sensor isn't it ?


> > Quoting Petko Manolov (2022-11-25 15:31:15)
> > > This patch adds dt-bindings documentation, driver source, etc for Son=
y imx492
> > > image sensor.
> > >=20
> > > imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with color =
or
> > > monochrome square pixel array and approximately 47.08 M effective pix=
els. 12-bit
> > > digital output makes it possible to output the signals with high defi=
nition for
> > > moving pictures. It is programmable through I2C interface. The I2C cl=
ient
> > > address can be either 0x10 or 0x1a depending on SLASEL pin. Image dat=
a is sent
> > > through MIPI CSI-2.
> > >=20
> > > Petko Manolov (5):
> > >   DT bindings for imx492
> > >   media: i2c: imx492: driver's header
> > >   media: i2c: imx492: driver's source
> > >   media: i2c: add imx492 config entry
> > >   media: i2c: add imx492 entry for make
> >=20
> > Could you squash patches 2, 3, 4, and 5 into a single patch please?
>=20
> This is the exact opposite to what the networking folks would prefer, but=
 it's
> OK with me.

Haha ... yes - isn't it great working in mulitple subsystems....

> > Also - I think you'll need an entry in MAINTAINERS.
>=20
> Right, that one too.
>=20
> > I can't see any reference to the selection controls:
> >  - V4L2_SEL_TGT_CROP_DEFAULT
> >  - V4L2_SEL_TGT_CROP
> >  - V4L2_SEL_TGT_CROP_BOUNDS
>=20
> These are in a very early phase of implementing.

Ok

> > Do you have the datasheet or sufficient information to be able to imple=
ment
> > these controls?
>=20
> Of course not.  We are brute forcing our way forward by mostly reverse
> engineering another solution that has an FPGA on the other end of the CSI=
 link.

Understood ;-) (and ... I think what I was fearing/anticipating).

--
Kieran




> > --
> > Kieran
> >=20
> > >  .../bindings/media/i2c/sony,imx492.yaml       |  101 ++
> > >  drivers/media/i2c/Kconfig                     |   14 +
> > >  drivers/media/i2c/Makefile                    |    1 +
> > >  drivers/media/i2c/imx492.c                    | 1092 +++++++++++++++=
++
> > >  drivers/media/i2c/imx492.h                    |  555 +++++++++
> > >  5 files changed, 1763 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/media/i2c/sony,=
imx492.yaml
> > >  create mode 100644 drivers/media/i2c/imx492.c
> > >  create mode 100644 drivers/media/i2c/imx492.h
> > >=20
> > > --=20
> > > 2.30.2
> > >
>=20
>=20
>                 Petko
