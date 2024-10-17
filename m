Return-Path: <linux-media+bounces-19781-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F2129A1C1E
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 09:57:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 616BF1C213F5
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2024 07:57:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB0DF1D043A;
	Thu, 17 Oct 2024 07:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="WuvrDnzx"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0DE157E9F;
	Thu, 17 Oct 2024 07:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729151862; cv=none; b=NI3B1JHYUKo3kTZ/8lMZqMoWcf9ITmu94qnrhOxknJ76IuTERvg7O8c5blCXPNsogXtT/JtUa6fZOoUTNFqj9NcpSxgfsv5uebD+EFTnrvrmecO639w9arBMFVtUDFF2OsxPeXgVXQD+EdT2LWfx4Uiy7rp32df3dRVeTgfG7g4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729151862; c=relaxed/simple;
	bh=oqhvVOn5AN1n4xr/+1Vp012sPZnLeJmBzpFwLBpmLPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=glMoS0oHOO+i9pJNGEeROZwydHSWZQasgYUzTX/6gK72+tLsCDD/HXqv37sdbyHhCVuvFmohTwtt3odkDxpHqPpCAYkRb6BSDlHbnQ5AFlZPQiCWbb+CS4dF9Gif/fwiuW1ILBt+v2th8kMnzZZ4Ye/kzhu8a9r6O7UEJacLwvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=WuvrDnzx; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1729151856; bh=oqhvVOn5AN1n4xr/+1Vp012sPZnLeJmBzpFwLBpmLPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WuvrDnzx33mdNViIqXTsRypsosaI1FwR2a7AYdGM1Lo8/Q/1y4VZXuXbXOSseFGBH
	 Hin59wSDiXJVDiUsjA1T8r+D+dEDn80AJUyULP9fcEGW7l8UM4tT+KkLH76HAEM5kz
	 miyueTCJX6kwDmBUDM7QdeB4BBBdUmVNmBNxl6zzD05jdXleomZNd8Ru4WT8hKcbeI
	 L83laKq+G/emvD9/4R84dgXgK9pQbEgHKr7Bxd7cKzw9sSDLDenG43nBvadzofsMZM
	 cL2W5Wqrg3HT/asjTa+XjFL29H7+hrXOthLjV8jSNp/ZSrfY+d2hJdPfnfjM8vrryv
	 uMKZHXEHh3aHQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id EA5941002B3; Thu, 17 Oct 2024 08:57:36 +0100 (BST)
Date: Thu, 17 Oct 2024 08:57:36 +0100
From: Sean Young <sean@mess.org>
To: =?utf-8?B?6YeR6LaFLei9r+S7tumhueebrumDqA==?= <jinchao@vivo.com>
Cc: "mchehab@kernel.org" <mchehab@kernel.org>,
	=?utf-8?B?6buE55CG6bmP?= <huanglipeng@vivo.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v1] media: rc-core: Modify the timeout waiting time for
 the infrared remote control.
Message-ID: <ZxDDcHcNQLBP69Fy@gofer.mess.org>
References: <20240927105808.9284-1-shenlichuan@vivo.com>
 <Zv2xGbdhm8kXgDFe@gofer.mess.org>
 <TYZPR06MB6895415657AFF1C1723F9020DF7E2@TYZPR06MB6895.apcprd06.prod.outlook.com>
 <KL1PR0601MB445295795E1DBE993238FB17DB7F2@KL1PR0601MB4452.apcprd06.prod.outlook.com>
 <Zwk3g-B6dJWgqE41@gofer.mess.org>
 <1a2149bb-9ac5-4cb0-9361-c292b66c214b@vivo.com>
 <bf2d51c1-54de-45cf-aeef-06db1a047c2c@vivo.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf2d51c1-54de-45cf-aeef-06db1a047c2c@vivo.com>

Hi,

On Thu, Oct 17, 2024 at 07:15:21AM +0000, 金超-软件项目部 wrote:
> 
> Hi
> May I ask if there has been any progress on this issue? It affects the
> user experience and could you please take a look as soon as possible?
> Thank you
> 
> 
> 在 2024/10/12 11:09, quqiwanzi 写道:
> > Hi
> >
> > 在 2024/10/11 22:34, Sean Young 写道:
> >> On Wed, Oct 09, 2024 at 07:03:57AM +0000, 金超-软件项目部 wrote:
> >>> NORMAL: The kukong apk control remote control sends codes for other
> >>> buttons
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[0]: 4500,
> >>> 4500, 560, 560, 560, 1680, 560, 1680
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[8]: 560,
> >>> 1680, 560, 560, 560, 560, 560, 560
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[16]: 560,
> >>> 560, 560, 560, 560, 1680, 560, 1680
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[24]: 560,
> >>> 1680, 560, 560, 560, 560, 560, 560
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[32]: 560,
> >>> 560, 560, 1680, 560, 560, 560, 1680
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[40]: 560,
> >>> 1680, 560, 560, 560, 560, 560, 560
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[48]: 560,
> >>> 560, 560, 560, 560, 1680, 560, 560
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[56]: 560,
> >>> 560, 560, 1680, 560, 1680, 560, 1680
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: pattern[64]: 560,
> >>> 1680, 560, 46920, 4500, 4500, 560, 1680
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x560,
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x96200,
> >> If I sum all these lengths, I get 216000 microseconds. That's well clear
> >> of IR_MAX_DURATION (500ms).
> >>
> >> Note that the last two values 0x560 and 0x96200 look really weird,
> >> they are
> >> not hex values are all, and there is no "pattern[...]: " prefix.
> > This is to iterate through the remaining parts that are less than
> > eight digits and print them out.

So why print the decimal value 560 as 0x560?

> > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x560,
> > 10-09 11:20:18.219  1023  1023 D ConsumerIrHal: 0x96200,
> >
> >>> 10-09 11:20:18.219  1023  1023 D ConsumerIrHal:
> >>> 10-09 11:20:18.220  1023  1023 D ConsumerIrHal: IRTX: Send to driver
> >>> 10-09 11:20:18.469  1023  1023 D ConsumerIrHal: Done, Turn OFF IRTX
> >>>
> >>> SPECIAL :Sending the power button on the remote control of the
> >>> kukong app may result in additional lines of coding, leading to
> >>> transmission failure (72-88 extra)
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[0]: 4500,
> >>> 4500, 560, 560, 560, 1680, 560, 1680
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[8]: 560,
> >>> 1680, 560, 560, 560, 560, 560, 560
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[16]: 560,
> >>> 560, 560, 560, 560, 1680, 560, 1680
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[24]: 560,
> >>> 1680, 560, 560, 560, 560, 560, 560
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[32]: 560,
> >>> 560, 560, 560, 560, 560, 560, 1680
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[40]: 560,
> >>> 1680, 560, 560, 560, 560, 560, 560
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[48]: 560,
> >>> 560, 560, 1680, 560, 1680, 560, 560
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[56]: 560,
> >>> 560, 560, 1680, 560, 1680, 560, 1680
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[64]: 560,
> >>> 1680, 560, 46920, 4500, 4500, 560, 1680
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[72]: 560,
> >>> 96200, 4500, 4500, 560, 1680, 560, 96200
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[80]: 4500,
> >>> 4500, 560, 1680, 560, 96200, 4500, 4500
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: pattern[88]: 560,
> >>> 1680, 560, 96200, 4500, 4500, 560, 1680
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: 0x560,
> >>> 10-09 11:19:53.973  1023  1023 D ConsumerIrHal: 0x96200,
> >> If I sum all these lengths I get 648000 microseconds, so quit a bit more
> >> than IR_MAX_DURATION, which is why the send fails. Again the last two
> >> values
> >> are printed like garbage.
> >>
> >> The signal looks like NECx1:
> >> http://hifi-remote.com/wiki/index.php/NECx1
> >>
> >> So there is the main signal, follow by a bunch of repeats. Each repeat
> >> looks like +4500 -4500 +560 -1680 +560 -96200; the -96200 is the
> >> trailing
> >> gap. To avoid going over IR_MAX_DURATION, don't include the -96200 gap
> >> but replaced with a usleep(96200), i.e. in psuedo code:
> >>
> >>          int i, fd = open("/dev/lirc0", O_RDWR);
> >>          write(fd, [4500 4500 560 560 560 1680 560 1680 560 1680 560
> >> 560 560 560 560 560 560 560 560 560 560 1680 560 1680 560 1680 560
> >> 560 560 560 560 560 560 560 560 560 560 560 560 1680 560 1680 560 560
> >> 560 560 560 560 560 560 560 1680 560 1680 560 560 560 560 560 1680
> >> 560 1680 560 1680 560 1680 560]);
> >>          usleep(46920);
> >>          for (i=0; i<4; i++) {
> >>                  write(fd, [4500 4500 560 1680 560]);
> >>                  usleep(96200);
> >>          }
> >
> > Thank you for your suggestion. The infrared code here is the power key
> > code sent through the Kukong remote control, and there may be other
> > infrared codes that exceed IR-MAX_DURATION.

1) If you send repeats separately then no known protocol exceeds 0.5 seconds 

2) There are databases of protocols, and no protocol here exceeds 0.5 seconds
   (or even comes near).
	http://hifi-remote.com/wiki/index.php/DecodeIR
	https://github.com/bengtmartensson/IrpTransmogrifier/blob/master/src/main/resources/IrpProtocols.xml
   The longest protocols I know of are for air conditioning units and I've
   never seen one longer than 0.5 seconds.

3) If a button press on a remote would take more than 0.5 seconds the latency
   would be awful, so no manufacturer would do this. Also, the chance of
   signal being corrupted during transmit would be quite high.

4) Some of the IR transmit hardware cannot handle such long transmits, e.g. 
   mceusb, iguanair, redrat3 have limits on what can be sent due to usb
   packet limits. That means your software will never work with such hardware.

5) This limit has existed since the dawn of time in infrared. What has changed?

> > In order to ensure the
> > universality of the code and adapt to different situations, it would
> > be better to directly modify IR-MAX_DURATION.

I get the feeling you are trying to avoid the problem that you are sending
the IR signal with the key repeats all at once. 

What driver are you using for transmit?


Sean

