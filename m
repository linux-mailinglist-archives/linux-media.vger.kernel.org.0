Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9BCCA63ABEA
	for <lists+linux-media@lfdr.de>; Mon, 28 Nov 2022 16:05:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbiK1PFF (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 28 Nov 2022 10:05:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231598AbiK1PFE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 28 Nov 2022 10:05:04 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4DDB20378
        for <linux-media@vger.kernel.org>; Mon, 28 Nov 2022 07:05:03 -0800 (PST)
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 624EF2D8;
        Mon, 28 Nov 2022 16:05:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1669647901;
        bh=fyox9wWzLbKtbpw9HIhomL1nxAgU3KgZPBPK9PeEBP8=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=ZgA6kYCNSnpfIw9tNAFCDMG6dl04/+ThrQeDwNex3kVs//mS2Gt2qWlxAGEMGp9bm
         aZ2Gaga2rkM3//Qu+F8qlcyYOD+7SUbYPoa4bA0YXLxi1exzHuSHBSQkE6WLrqzRfX
         wDvQHAN4UkaQxhU2UetrE1Zfi7VqTDhi/wLzm3ug=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <Y4TAmvy6gKNdc0n6@bender.k.g>
References: <20221125153120.541298-1-petko.manolov@konsulko.com> <166963953216.1079859.6469563044691422088@Monstersaurus> <Y4Sziw2nt8gSyjSv@bender.k.g> <166964269270.1079859.9052080973667851964@Monstersaurus> <Y4TAmvy6gKNdc0n6@bender.k.g>
Subject: Re: [PATCH v1 0/5] Adds media driver for Sony IMX492 sensor
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        sakari.ailus@iki.fi
To:     Petko Manolov <petko.manolov@konsulko.com>
Date:   Mon, 28 Nov 2022 15:04:58 +0000
Message-ID: <166964789892.3066484.11547308551447660064@Monstersaurus>
User-Agent: alot/0.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Quoting Petko Manolov (2022-11-28 14:07:22)
> On 22-11-28 13:38:12, Kieran Bingham wrote:
> > Quoting Petko Manolov (2022-11-28 13:11:39)
> > > On 22-11-28 12:45:32, Kieran Bingham wrote:
> > > > Hi Petko,
> > > >=20
> > > > What device/ISP are you testing this sensor on?
> > >=20
> > > I'll tell you, but only if you promise to not laugh too much.  Deal?
> > >=20
> > > i.MX8M-Mini
> > >=20
> > > I hope nobody will notice the above line...
> >=20
> > I won't laugh at all. We've just merged the ISI pipeline handler for
> > libcamera, which should let you use libcamera on this target (I think).
>=20
> I think i saw your patch in the ML.
>=20
> > I would hope sometime in the future you'd be able to use the ISI pipeli=
ne
> > handler with a GPU based ISP with this sensor too.
>=20
> Both of the above are present in i.MX8M-Plus, not the Mini.
>=20
> > How are you managing the image 3a? the imx492 is a raw sensor isn't it ?
>=20
> Not sure what you mean by "image 3a" and yes, it's a raw sensor.

I meant how are you handling "Auto-exposure" "Auto-gain"
"Auto-whitebalance" (known as 3a).

There's more than that of course, but those are the basics that are
expected to be able to get a 'usable' image. Unless of course you're
doing everything with manual controls ... which is the alternative for a
fixed/known lighting environment.

But without an ISP on the device anyway, perhaps there's already more
going on elsewhere?

--
Kieran.



> > > > Quoting Petko Manolov (2022-11-25 15:31:15)
> > > > > This patch adds dt-bindings documentation, driver source, etc for=
 Sony imx492
> > > > > image sensor.
> > > > >=20
> > > > > imx492 is a diagonal 23.1 mm (Type 1.4) CMOS image sensor with co=
lor or
> > > > > monochrome square pixel array and approximately 47.08 M effective=
 pixels. 12-bit
> > > > > digital output makes it possible to output the signals with high =
definition for
> > > > > moving pictures. It is programmable through I2C interface. The I2=
C client
> > > > > address can be either 0x10 or 0x1a depending on SLASEL pin. Image=
 data is sent
> > > > > through MIPI CSI-2.
> > > > >=20
> > > > > Petko Manolov (5):
> > > > >   DT bindings for imx492
> > > > >   media: i2c: imx492: driver's header
> > > > >   media: i2c: imx492: driver's source
> > > > >   media: i2c: add imx492 config entry
> > > > >   media: i2c: add imx492 entry for make
> > > >=20
> > > > Could you squash patches 2, 3, 4, and 5 into a single patch please?
> > >=20
> > > This is the exact opposite to what the networking folks would prefer,=
 but it's
> > > OK with me.
> >=20
> > Haha ... yes - isn't it great working in mulitple subsystems....
>=20
> Yeah, easy to get confused... :)
>=20
> > > > Also - I think you'll need an entry in MAINTAINERS.
> > >=20
> > > Right, that one too.
> > >=20
> > > > I can't see any reference to the selection controls:
> > > >  - V4L2_SEL_TGT_CROP_DEFAULT
> > > >  - V4L2_SEL_TGT_CROP
> > > >  - V4L2_SEL_TGT_CROP_BOUNDS
> > >=20
> > > These are in a very early phase of implementing.
> >=20
> > Ok
> >=20
> > > > Do you have the datasheet or sufficient information to be able to i=
mplement
> > > > these controls?
> > >=20
> > > Of course not.  We are brute forcing our way forward by mostly reverse
> > > engineering another solution that has an FPGA on the other end of the=
 CSI link.
> >=20
> > Understood ;-) (and ... I think what I was fearing/anticipating).
>=20
> I would have been too easy otherwise.
>=20
>=20
>                 Petko
