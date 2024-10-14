Return-Path: <linux-media+bounces-19518-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB4C99BDAE
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 04:16:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F87C1F2280E
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 02:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAFA13A1DA;
	Mon, 14 Oct 2024 02:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=echolabs.net header.i=@echolabs.net header.b="wC+eKYQO"
X-Original-To: linux-media@vger.kernel.org
Received: from OUTBOUND1.ECHOLABS.NET (outbound1.echolabs.net [38.111.141.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46575288DB;
	Mon, 14 Oct 2024 02:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=38.111.141.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728872166; cv=none; b=VTNSp2RZQlJTGuqY2RigmLUfA0WURp4ZSIW7F1wwKY1p3aVlw4A0oDq6zWAicT73RW7ctrK3cnFI/z3zXKEV6CknCfwdrk2ik46xrgRGDUgjn9ORzPt73WGe5v9tbxJAbfxNoG0gRvWJKyZiYXmQhSoAJoJEuCEdPNVdXnMChg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728872166; c=relaxed/simple;
	bh=9IBFkrBjI0NDZDPqpewmJS95SscxpawAPljKLUdp/mQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L42hbSjcWwHAoBsjnhw87O1dVHoOKvtr4tS/Lrt+LP+1XbPntwatGKNRR3o5xzkzocldrZL3ASlqU5IvtavUxiBKrLch2fa+CZpAv7jouo0tropt4KP2IQZL7QOngCdwci498SlgASh7l5GHMZ4hbo5vGjSCtrAWZx8BNjtoFUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=md.metrocast.net; spf=pass smtp.mailfrom=md.metrocast.net; dkim=pass (1024-bit key) header.d=echolabs.net header.i=@echolabs.net header.b=wC+eKYQO; arc=none smtp.client-ip=38.111.141.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=md.metrocast.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=md.metrocast.net
Received: from cluster1.echolabs.net ([10.0.3.2])
	by cmsmtp with ESMTP
	id 0AaQta5wBGwCm0AaRtet1c; Sun, 13 Oct 2024 22:13:31 -0400
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=cKRDsUeN c=1 sm=1 tr=0 ts=670c7ee0 cx=a_idp_x
 a=tNr+Z7cUeTIrU1DJDzmN1A==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=3WJfbomfAAAA:8 a=GJGctE8thOuuxPmal10A:9
 a=QEXdDO2ut3YA:10 a=1cNuO-ABBywtgFSQhe9S:22
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 21
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=cKRDsUeN c=1 sm=1 tr=0 ts=670c7e9c cx=a_idp_x
 a=tNr+Z7cUeTIrU1DJDzmN1A==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=3WJfbomfAAAA:8 a=GJGctE8thOuuxPmal10A:9
 a=QEXdDO2ut3YA:10 a=1cNuO-ABBywtgFSQhe9S:22
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 27
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=echolabs.net;
	s=outbound; t=1728872011;
	bh=DB8bMHHd0Up3hS1+mFmqsWztQX6nuDag2x+iYhrvBko=; h=X-ELOB-ID:From;
	b=wC+eKYQOWOqpQrusiGNc0/aXGmxnoRqFezMeXJYuhMqLWnpliqsGTpF4wxnVYRw1u
	 MgHh3EDLxctpn0cHgvESvq+iqyuO0ww9USUs3g6Ohhyaxgl7wyIDDkPLNlh54WLzQE
	 cRrAnSZoOVIpGJi719PgHoqWXQl/ZaIKN7AE4TiY=
X-ELOB-ID: <20241013221331-0AaQta5wBGwCm0AaRtet1c-OUTBOUND1.ECHOLABS.NET@echolabs.net>
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=cKRDsUeN c=1 sm=1 tr=0 ts=670c7e4b cx=a_idp_x
 a=tNr+Z7cUeTIrU1DJDzmN1A==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=DAUX931o1VcA:10 a=3WJfbomfAAAA:8 a=GJGctE8thOuuxPmal10A:9
 a=QEXdDO2ut3YA:10 a=1cNuO-ABBywtgFSQhe9S:22
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 22
Received: from [10.0.0.91] (HELO MX01.MAIL.ECHOLABS.NET)
  by echolabs.net (CommuniGate Pro SMTP 7.0.2)
  with ESMTP id 1464250665; Sun, 13 Oct 2024 22:13:30 -0400
Received: from assateague.home.arpa ([74.214.59.219])
	by Echo Labs with ESMTPSA
	id 0AaQtJQyrAume0AaQtHswO; Sun, 13 Oct 2024 22:13:30 -0400
X-SS: 100
X-GEO: US US
X-Scanner-Info: Cloudmark - http://www.cloudmark.com
X-CNFS-Analysis: v=2.4 cv=Dsn1+3/+ c=1 sm=1 tr=0 ts=670c7e4a
 a=dHwet71K7hIblIhzQqIuGw==:117 a=dHwet71K7hIblIhzQqIuGw==:17
 a=IkcTkHD0fZMA:10 a=3WJfbomfAAAA:8 a=GJGctE8thOuuxPmal10A:9 a=QEXdDO2ut3YA:10
 a=1cNuO-ABBywtgFSQhe9S:22
X-CMAE-Score: 0.00
X-Scanned-by: CMAE - 16
X-AUTH-ID: awalls@md.metrocast.net
Message-ID: <25dab73e9f2cf859cf3db7f626b6db04c5b3c1a6.camel@md.metrocast.net>
Subject: Re: [PATCH v2] media: cx18: Remove unused cx18_reset_ir_gpio
From: Andy Walls <awalls@md.metrocast.net>
To: linux@treblig.org, mchehab@kernel.org, linux-media@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Date: Sun, 13 Oct 2024 22:13:25 -0400
In-Reply-To: <20241012233932.255211-1-linux@treblig.org>
References: <20241012233932.255211-1-linux@treblig.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4xfAfQeztkCJf1XXQ/jBW6BvmRQ4Mkq4t/HhWqc+BaBvPlh+0Ub5crUVGjEp7nTIXYB4VYQOaPgxxJEdIpmK+CNaYD8xaZTkkj3iumIFvl+73CxA9q4By3
 Xstqx0+gqsmig2m+7aoVztVHuCuCzvU7PB1NIlzckXWdIeyi3Xs0uyIKc3vPc3Og04yMQZC5CXgAaPwhGZDAVcPKBePmRbAuS8MlrPu6Na4flAKELHfG3Sbh
 r4/W8+vOQumpgnI6xASu7Q==

On Sun, 2024-10-13 at 00:39 +0100, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> cx18_reset_ir_gpio() has been unused in tree since 2009
> commit eefe1010a465 ("V4L/DVB (10759): cx18: Convert GPIO connected
> functions to act as v4l2_subdevices")
> 
> It has a comment saying it's exported for use by 'lirc_pvr150' but I
> don't
> see any sign of it in the lirc git, and I see it removed support
> for lirc_i2c.c 'Flavors of the Hauppage PVR-150...' in 2014.
> 

The IR Tx functionality of lirc_zilog (aka lirc_pvr150) used this when
it decided the Zilog 8051 microcontroller and firmware had wedged
itself.

If lirc_zilog is gone from staging and lirc_zilog/lirc_pvr150 is gone
from out of tree LIRC, then I guess there's no current caller of this
function.

Removing it prevents any current or future module from
bringing the IR chip out of a bad/stuck state via software.  So that's
the trade off for removing this function.

-Andy

> Remove it.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/media/pci/cx18/cx18-gpio.c | 15 ---------------
>  drivers/media/pci/cx18/cx18-gpio.h |  1 -
>  2 files changed, 16 deletions(-)
> 
> diff --git a/drivers/media/pci/cx18/cx18-gpio.c
> b/drivers/media/pci/cx18/cx18-gpio.c
> index c85eb8d25837..485a6cbeb15a 100644
> --- a/drivers/media/pci/cx18/cx18-gpio.c
> +++ b/drivers/media/pci/cx18/cx18-gpio.c
> @@ -305,21 +305,6 @@ int cx18_gpio_register(struct cx18 *cx, u32 hw)
>  	return v4l2_device_register_subdev(&cx->v4l2_dev, sd);
>  }
>  
> -void cx18_reset_ir_gpio(void *data)
> -{
> -	struct cx18 *cx = to_cx18(data);
> -
> -	if (cx->card->gpio_i2c_slave_reset.ir_reset_mask == 0)
> -		return;
> -
> -	CX18_DEBUG_INFO("Resetting IR microcontroller\n");
> -
> -	v4l2_subdev_call(&cx->sd_resetctrl,
> -			 core, reset, CX18_GPIO_RESET_Z8F0811);
> -}
> -EXPORT_SYMBOL(cx18_reset_ir_gpio);
> -/* This symbol is exported for use by lirc_pvr150 for the IR-blaster 
> */
> -
>  /* Xceive tuner reset function */
>  int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int
> value)
>  {
> diff --git a/drivers/media/pci/cx18/cx18-gpio.h
> b/drivers/media/pci/cx18/cx18-gpio.h
> index 0fa4c7ad2286..8d5797dea7f5 100644
> --- a/drivers/media/pci/cx18/cx18-gpio.h
> +++ b/drivers/media/pci/cx18/cx18-gpio.h
> @@ -17,5 +17,4 @@ enum cx18_gpio_reset_type {
>  	CX18_GPIO_RESET_XC2028  = 2,
>  };
>  
> -void cx18_reset_ir_gpio(void *data);
>  int cx18_reset_tuner_gpio(void *dev, int component, int cmd, int
> value);


