Return-Path: <linux-media+bounces-4881-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 008EF84F8AC
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 16:35:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A06DF287960
	for <lists+linux-media@lfdr.de>; Fri,  9 Feb 2024 15:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3265574E12;
	Fri,  9 Feb 2024 15:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EssEH30j"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A4E36AE7;
	Fri,  9 Feb 2024 15:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707492913; cv=none; b=B00kSkUIUdMoqdQlK+v8DcpbnWHS3rsacC+uBKR/mHJ0bO4Pt0e5+dXiVs7paNi3/vDqvsIDEUaMLoysAYSbWKe9dKQb53o7kX8hIoahY4EYcjmU14EqucnMumP5+7Z7KWpQWStcpn7PX0yXrNALKTKTyObBncEux4SAIOsTbDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707492913; c=relaxed/simple;
	bh=QSwwJyOLJruCh0mDW2GQRAS1XgNMnLXVYXqtsV5wQdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t4D8hk/aqHLAb1x1qD3IT+9TKOcYW68gTTHItySbvPKNE2VWlazdlZWoIKXx2WHOsxvyT0d8qWhSmTQPxb+UhMl5BiC7Scu6zewsPjkjaDKnCTf0Ztb4fEZWgZwANH7k0+w/EKNgCLq64h+a0LL/MJ44xKeHaKDm6e8FnwMOTcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EssEH30j; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707492912; x=1739028912;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QSwwJyOLJruCh0mDW2GQRAS1XgNMnLXVYXqtsV5wQdQ=;
  b=EssEH30jHzGFQwFlAec0wkC4mCJtSL0jvnGKZUQYSlWpKT7YtV9tLrBd
   BiVwH5xlJAPkHdA1xzwtqBltnGX3WMYLniEpzNofeJ8Q4BvfZOnjD/1yT
   T8lrP9nqErhDz5H301jf4qF0II6tRdRjlBODugOm3q1l/m4gJpuakPxfl
   JhAqrAE6jQp7QnvgnF0T3CfwvLx41K7zYpppUI/5RjAaSlZjXY7blkJ6D
   61pTQYn3DJ6ohkjS4HkU1lBLUTuxlPjZp3LA3JT40iD1WkhVqQpCGpgcP
   Pbne0KWTeJsWSI7sMkAhgbnAY28GRMBOnyZvN5OEmLcVOMNFdqh9Bjhv/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="1328114"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="1328114"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 07:35:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="934454716"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="934454716"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 07:35:08 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 5FD1611FADC;
	Fri,  9 Feb 2024 17:17:45 +0200 (EET)
Date: Fri, 9 Feb 2024 15:17:45 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"biju.das.au" <biju.das.au@gmail.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: Re: [PATCH v2 5/5] arm64: dts: renesas:
 r9a07g043u11-smarc-cru-csi-ov5645: Reduce I2C frequency
Message-ID: <ZcZCGZn0xHMHVVD1@kekkonen.localdomain>
References: <20240126133116.121981-1-biju.das.jz@bp.renesas.com>
 <20240126133116.121981-6-biju.das.jz@bp.renesas.com>
 <CAMuHMdUa+wd36-ErDRgb91KpRbryNYzA2Mmhvzjx0-_47=zfdg@mail.gmail.com>
 <TYCPR01MB11269FEE3A8C6D695CBBACEE086792@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB11269379C39A0242C9F87A40E867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
 <TYCPR01MB112693439518B0DA3E7E11693864B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <TYCPR01MB112693439518B0DA3E7E11693864B2@TYCPR01MB11269.jpnprd01.prod.outlook.com>

Hi folks,

On Fri, Feb 09, 2024 at 02:36:22PM +0000, Biju Das wrote:
> Hi Geert,
> 
> > -----Original Message-----
> > From: Biju Das
> > Sent: Tuesday, January 30, 2024 2:15 PM
> > Subject: RE: [PATCH v2 5/5] arm64: dts: renesas: r9a07g043u11-smarc-cru-
> > csi-ov5645: Reduce I2C frequency
> > 
> > Hi Geert,
> > 
> > > -----Original Message-----
> > > From: Biju Das
> > > Sent: Friday, January 26, 2024 3:57 PM
> > > Subject: RE: [PATCH v2 5/5] arm64: dts: renesas:
> > > r9a07g043u11-smarc-cru-
> > > csi-ov5645: Reduce I2C frequency
> > >
> > > Hi Geert,
> > >
> > > Thanks for the feedback.
> > >
> > > > -----Original Message-----
> > > > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > > > Sent: Friday, January 26, 2024 1:53 PM
> > > > Subject: Re: [PATCH v2 5/5] arm64: dts: renesas:
> > > > r9a07g043u11-smarc-cru-
> > > > csi-ov5645: Reduce I2C frequency
> > > >
> > > > Hi Biju,
> > > >
> > > > On Fri, Jan 26, 2024 at 2:31 PM Biju Das
> > > > <biju.das.jz@bp.renesas.com>
> > > > wrote:
> > > > > Reduce i2c freq from 400->100 kHz on RZ/G2UL SMARC EVK as the
> > > > > captured image is not proper with the sensor configuration over I2C.
> > > > >
> > > > > Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> > > >
> > > > Thanks for your patch!
> > > >
> > > > > ---
> > > > > a/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.dt
> > > > > so
> > > > > +++ b/arch/arm64/boot/dts/renesas/r9a07g043u11-smarc-cru-csi-ov5645.
> > > > > +++ dt
> > > > > +++ so
> > > > > @@ -19,3 +19,7 @@ &ov5645 {
> > > > >         enable-gpios = <&pinctrl RZG2L_GPIO(4, 4) GPIO_ACTIVE_HIGH>;
> > > > >         reset-gpios = <&pinctrl RZG2L_GPIO(0, 1) GPIO_ACTIVE_LOW>;
> > > > > };
> > > > > +
> > > > > +&i2c0 {
> > > > > +       clock-frequency = <100000>; };
> > > >
> > > > Is this a limitation of one of the I2C devices on the bus, or a PCB
> > > > design issue?
> > >
> > > Currently versa3 clock generator connected to the same bus and it
> > > works ok with 400kHz clock. Maybe it is stressed not that much
> > > compared to OV5645 sensor configuration.
> > >
> > > At the moment with 400kHz I2C bus clock, Camera capture is not working
> > > properly on RZ/G2UL, but with same bus frequency the same works fine
> > > on RZ/{G2L,G2LC,V2L}.
> > > There may be some hardware differences which is causing this issue.
> > >
> > > >
> > > > Doesn't this need a Fixes tag?
> > >
> > > I can create a new patch updating bus frequency as 100kHz and add
> > > fixes tag.
> > > After this I will drop this patch as it no longer needed.
> > >
> > > Please let me know.
> > 
> > + media
> > 
> > Adding a delay after Software reset makes it to work at 400kHz with
> > RZ/G2UL SMARC EVK.
> > 
> > So not sure we need to add delay after software reset?
> > 
> > Now after OV5645 gpio reset, then there is 20msec delay and then again we
> > are issuing software reset and there is no delay after this for this
> > software reset.
> > 
> > diff --git a/drivers/media/i2c/ov5645.c b/drivers/media/i2c/ov5645.c index
> > a26ac11c989d..d67a5e23fe5a 100644
> > --- a/drivers/media/i2c/ov5645.c
> > +++ b/drivers/media/i2c/ov5645.c
> > @@ -622,11 +622,19 @@ static int ov5645_set_register_array(struct ov5645
> > *ov5645,  {
> >         unsigned int i;
> >         int ret;
> > 
> >         for (i = 0; i < num_settings; ++i, ++settings) {
> >                 ret = ov5645_write_reg(ov5645, settings->reg, settings-
> > >val);
> >                 if (ret < 0)
> >                         return ret;
> > +
> > +               if (settings->reg == OV5645_SYSTEM_CTRL0)
> > +                       fsleep(1000);
> > 
> 
> This issue seen on RZ/G2L SMARC EVK as well. My testing on G2L family shows
> we need to add delay to make OV5645 to work @400kHZ.

Typically there's a delay before the chip is accessible over I²C after
resetting it. It's a bit open whether this one needs it, very probably it
does. It'd be nicer nonetheless to do this outside the register list and
instead use a separate ov5645_write_reg() call.

Probably the first write is redundant. The second write resets the device.
0x80 should be sufficient value for that.

-- 
Regards,

Sakari Ailus

