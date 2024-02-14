Return-Path: <linux-media+bounces-5176-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53482855751
	for <lists+linux-media@lfdr.de>; Thu, 15 Feb 2024 00:34:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D636F28FBC8
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 23:34:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D51151420A2;
	Wed, 14 Feb 2024 23:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="I7arg7NI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD661419A6;
	Wed, 14 Feb 2024 23:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707953660; cv=none; b=cOzGyzbOiT6PfDrYGmA2Od+2ugiO6EdNwXbA3x7h2ynV2uNoKhfHuOBlsr/T0xD8O2b6ucEmNfNvZFt5ltYUVcp1eWfANF46ZjoOkkBctXsjyFV1xcn94DOKHdPyFYqr1XLkPOEeF1D1UH4S035a61dC3szSGPiG3/5rF6u9izM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707953660; c=relaxed/simple;
	bh=EhoG56pQh3Z7IB5fQjHs5pWDeKTByk/4gaFqXtrewrA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=NSbZd5cHayMkcTjq8GsGjiRn2nvlaf/fuZ40lP8wCS7gO7f0A6XCrogTmyeErO0i1EFgmfHtj3EBTCfMxbNHJQBqoeuxoTEVPntwoyPA6FjXywFZkpJt0j3EbaajPgHYcLrpEgKPqaTwdL7vDs33yOyz2PGiGR0DGHTvJPoUt4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=I7arg7NI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (aztw-30-b2-v4wan-166917-cust845.vm26.cable.virginm.net [82.37.23.78])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0C035231;
	Thu, 15 Feb 2024 00:34:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1707953652;
	bh=EhoG56pQh3Z7IB5fQjHs5pWDeKTByk/4gaFqXtrewrA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=I7arg7NIMPTKawvJDW0PUoTusLyDXoFQk4aUrEN7SVIWqPC4k3gj72lgOcqKhUz/q
	 nbdzTu6ivuWvFpblcNnmfKazXQqz6xD9NqOBXANrTjK9uD5EwUsSzDtdy9oRggUd+z
	 keN3X3DTXq5LbTpOPL/INYGEEqPqot9Cv9qYmqNg=
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <TYCPR01MB11269D1C9578F27DE69E732B6864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com> <20240213140240.159057-2-biju.das.jz@bp.renesas.com> <ZcvsyRfVwC0aJ5fb@shikoro> <CADT+UeDNFBTvRMHd4_J85Yz0RYED4ioG9wjUe4C0X4x6LzVD9w@mail.gmail.com> <Zcx6Ty2tu_ZGdURj@ninjato> <TYCPR01MB11269CC8B2EAB564154C829A2864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com> <Zc0nWfwFFGhqxHQq@kekkonen.localdomain> <TYCPR01MB11269F35E38BE52CDD6628006864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com> <TYCPR01MB11269D1C9578F27DE69E732B6864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Subject: RE: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 from ov5645_global_init_setting
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Wolfram Sang <wsa@kernel.org>, biju.das.au <biju.das.au@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org <linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org <linux-renesas-soc@vger.kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>, Sakari Ailus <sakari.ailus@linux.intel.com>
Date: Wed, 14 Feb 2024 23:34:12 +0000
Message-ID: <170795365234.2765369.4101452918614439944@ping.linuxembedded.co.uk>
User-Agent: alot/0.10

Quoting Biju Das (2024-02-14 20:57:36)
> Hi Sakari,
>=20
> > -----Original Message-----
> > From: Biju Das
> > Sent: Wednesday, February 14, 2024 8:55 PM
> > Subject: RE: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008 f=
rom
> > ov5645_global_init_setting
> >=20
> > Hi Sakari,
> >=20
> > Thanks for the feedback.
> >=20
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Wednesday, February 14, 2024 8:49 PM
> > > To: Biju Das <biju.das.jz@bp.renesas.com>
> > > Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register 0x3008
> > > from ov5645_global_init_setting
> > >
> > > Hi Biju,
> > >
> > > On Wed, Feb 14, 2024 at 08:25:16PM +0000, Biju Das wrote:
> > > > Hi Wolfram,
> > > >
> > > > Thanks for the feedback.
> > > >
> > > > > -----Original Message-----
> > > > > From: Wolfram Sang <wsa@kernel.org>
> > > > > Sent: Wednesday, February 14, 2024 8:31 AM
> > > > > Subject: Re: [PATCH 1/2] media: i2c: ov5645: Move the register
> > > > > 0x3008 from ov5645_global_init_setting
> > > > >
> > > > > Hi Biju,
> > > > >
> > > > > > I think it is different here. That 1 msec is delay associated
> > > > > > with applying hardware power see [1]
> > > > >
> > > > > Okay, ack.
> > > > >
> > > > > > I will restore it.
> > > > >
> > > > > Thanks!
> > > > >
> > > > > I had meanwhile another thought. What if we kind of merge the two
> > > > > patches, so the outcome is basically this:
> > > > >
> > > > > In ov5645_set_register_array:
> > > > >
> > > > >         If (settings->reg =3D=3D 0x3008 && settings->val =3D=3D 0=
x82)
> > > > >                 usleep_range(1000, 2000)
> > > > >
> > > > > ?
> > > > >
> > > > > Then, we don't need to split the array and we are also future
> > > > > proof if we ever need to set the reset bit again somewhere else.
> > > > >
> > > > > Bonus points for replacing 0x82 with a define :)

Pulling up the datasheet OV5645-A66A v1.1 from the web:

(a little google-fu++ got there, let me know if you need hints if you
want to do a full clean up)

2.8 reset

The OV5645 sensor includes a RESETB pin that forces a complete hardware
reset when it is pulled low (GND). The OV5645 clears all registers and
resets them to their default values when a hardware reset occurs. A
reset can also be initiated through the SCCB interface by setting
register 0x3008[7] to high.  Manually applying a hard reset upon power
up is required even though on-chip reset is included. The hard reset is
active low with an asynchronized design. The reset pulse width should be
greater than or equal to 1 ms.

2.9 hardware and software standby
Two suspend modes are available for the OV5645:

=E2=80=A2 hardware standby
=E2=80=A2 SCCB software standby

To initiate hardware standby mode, the PWDNB pin must be tied to low
(while in MIPI mode, set register 0x300E[4:3] to 2=E2=80=99b11 before the P=
WDNB
pin is set to low). When this occurs, the OV5645 internal device clock
is halted and all internal counters are reset and registers are
maintained.  Executing a software standby through the SCCB interface
suspends internal circuit activity but does not halt the device clock.
All register content is maintained in standby mode.


 Address: 0x3008=20
 RegName: SYSTEM_CTROL0
 Default: 0x02
 R/W:	RW
Description: System Control
  Bit[7]: Software reset
  Bit[6]: Software power down

Then later in the datasheet it also describes:
System Control
Bit[7]: Software reset
Bit[6]: Software power down
Bit[5]: Debug mode
Bit[4]: SRB clock sync enable
Bit[3]: Isolation suspend select
Bit[2]: MIPI reset mask
Bit[1]: MIPI suspend mask
Bit[0]: MIPI reset select


> > > > >
> > > > > What do you think?
> > > >
> > > >
> > > > OK, this will do check for all other registers.
> > > >
> > > > But from your power down clue and checking ov5640.c Looks like there
> > > > are 2 registers changes values after writing.
> > > >
> > > > [1] 0x3008, 0x82-->0x80
> > > > [2] 0x0601, 0x02-->0x00
> > > >
> > > > I think [1] is soft reset based on ov5640. Since there is a gpio
> > > > based hardware reset available, we can safely remove soft reset[1]
> > > > and like ov5640.c, if there is no gpio for reset, then do the soft
> > reset[1].
> > >
> > > I guess that would work. My understanding is that hard reset control
> > > is mandatory for the device, so there really should be no need for
> > > soft reset in the driver.
> >=20
> > OK.
> >=20
> > >
> > > >
> > > >
> > > > Then add 1msec delay for power down/up(0x3008: 0x42,0x02) and 0x0601
> > > > registers.
> > > >
> > > > With this looks like the Camera works ok @400kHz.
> > > >
> > > > The plans is to add a u8 variable for delay and enable delays for
> > > > the above registers and add a check like below
> > > >
> > > > static int ov5645_set_register_array(struct ov5645 *ov5645,
> > > >                                const struct reg_value *settings,
> > > >                                unsigned int num_settings)
> > > > {
> > > >   unsigned int i;
> > > >   int ret;
> > > >
> > > >   for (i =3D 0; i < num_settings; ++i, ++settings) {
> > > >           ret =3D ov5645_write_reg(ov5645, settings->reg, settings-=
>val);
> > > >           if (ret < 0)
> > > >                   return ret;
> > > >
> > > >           if (settings->delay_ms)
> > > >                   usleep_range(1000 * settings->delay_ms, 2 * 1000 *
> > > > settings->delay_ms);
> > >
> > > I'd prefer checking the register address in the write function instead
> > > of this if you really need it. But it seems you don't.
> >=20
> > With delays in powerup/down registers (0x3008 : 0x42,0x02) it is not
> > stable.
>=20
> Typo: without delays in powerup/down registers (0x3008 : 0x42,0x02) it is=
 not
> stable.
>=20
> You can see 0x42 followed by 0x02 which is an indication of power down/up=
 procedure.
>=20
> Cheers,
> Biju

