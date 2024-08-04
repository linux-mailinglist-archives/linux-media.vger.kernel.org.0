Return-Path: <linux-media+bounces-15753-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 577CA946E41
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 12:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0AE73280E2D
	for <lists+linux-media@lfdr.de>; Sun,  4 Aug 2024 10:04:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A04F28DBC;
	Sun,  4 Aug 2024 10:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="MAZeCo3d"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3102C19E;
	Sun,  4 Aug 2024 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722765845; cv=none; b=hyccuSHh/ZJgyAIdtDTj681cfZD9eqIQrGHDxIzEcALaxrrXgS6BAgm2Q1ARweOnmZOMP1S+f/xm4HlCMrPSstpZJYXbYgFeSnVQ58nbXfsz8ASez54tAZB3NXS9hg5VuyWLncl6SyrdTSH1qBD55qfu1D3om/21b99vZvC7Il0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722765845; c=relaxed/simple;
	bh=6XRukXrSCfXrFTJxAbpsHM0yPe2QA4cJYaJ1mBYFjBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ov5XuKdRufPF+qAx1pPp9eZhbHLQsQM45JRpx8EMl3uVgXHlVSlYlA4wJhuM+O96r9E+ZX4YnL5aduMnNqb1Q684EQWCmx8zKEd9mUsUQ88KmUvP2n6UumQqTFVK6FvCLVboDasVC/iPbviBckL03wnHJGkmpAGHRgOGfIq+5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=MAZeCo3d; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1722765841; bh=6XRukXrSCfXrFTJxAbpsHM0yPe2QA4cJYaJ1mBYFjBA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MAZeCo3dhD6sA4YRM4HMOI98M2wLz4mHhLD32niiof2fddh4fNhoawvkaYMZsdHRt
	 HKT3HqypFj/9+Bhj1ldrhqZrXG+gZFDHEs/dXKdRtEY7AvWubfDqocwSaOHA83t8BS
	 V3WX+TFHeR+/Ap4lBiogIvpHVGJvFEEAn2IpK7v+BSBf26QOKxtmAzheh/bo7//OfB
	 tl1LsOHUkBZJgT2hA92iZz5WXcs5tdIc/z1w+4XvVn+RoR3mjhvetz4dOp2Oz7Y/mn
	 W2yWv+6p80qsmGTqP72+2Xj7Cz/53fF87IzBg/wQZ9CWJiNdbu3dvo2UfGQtNKqb2s
	 iJM1qc1EfoszQ==
Received: by gofer.mess.org (Postfix, from userid 1000)
	id 891441000C2; Sun,  4 Aug 2024 11:04:01 +0100 (BST)
Date: Sun, 4 Aug 2024 11:04:01 +0100
From: Sean Young <sean@mess.org>
To: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, stable@vger.kernel.org,
	patches@lists.linux.dev, Zheng Yejian <zhengyejian1@huawei.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Sasha Levin <sashal@kernel.org>, regressions@leemhuis.info,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: [PATCH 6.10 288/809] media: dvb-usb: Fix unexpected infinite
 loop in dvb_usb_read_remote_control()
Message-ID: <Zq9SEa0rEglvDx91@gofer.mess.org>
References: <20240730151724.637682316@linuxfoundation.org>
 <20240730151735.968317438@linuxfoundation.org>
 <20240801165146.38991f60@mir>
 <Zq5KcGd8g4t2d11x@gofer.mess.org>
 <20240803180852.6eb5f0cb@mir>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240803180852.6eb5f0cb@mir>

(Resend with the relevant lists CC'ed)

On Sat, Aug 03, 2024 at 06:08:52PM +0200, Stefan Lippers-Hollmann wrote:
> On 2024-08-03, Sean Young wrote:
> > On Thu, Aug 01, 2024 at 04:51:46PM +0200, Stefan Lippers-Hollmann wrote:
> > > Hi
> > >
> > > On 2024-07-30, Greg Kroah-Hartman wrote:
> > > > 6.10-stable review patch.  If anyone has any objections, please let me know.
> > > >
> > > > ------------------
> > > >
> > > > From: Zheng Yejian <zhengyejian1@huawei.com>
> > > >
> > > > [ Upstream commit 2052138b7da52ad5ccaf74f736d00f39a1c9198c ]
> > > >
> > > > Infinite log printing occurs during fuzz test:
> > > >
> > > >   rc rc1: DViCO FusionHDTV DVB-T USB (LGZ201) as ...
> > > >   ...
> > > >   dvb-usb: schedule remote query interval to 100 msecs.
> > > >   dvb-usb: DViCO FusionHDTV DVB-T USB (LGZ201) successfully initialized ...
> > > >   dvb-usb: bulk message failed: -22 (1/0)
> > > >   dvb-usb: bulk message failed: -22 (1/0)
> > > >   dvb-usb: bulk message failed: -22 (1/0)
> > > >   ...
> > > >   dvb-usb: bulk message failed: -22 (1/0)
> > > >
> > > > Looking into the codes, there is a loop in dvb_usb_read_remote_control(),
> > > > that is in rc_core_dvb_usb_remote_init() create a work that will call
> > > > dvb_usb_read_remote_control(), and this work will reschedule itself at
> > > > 'rc_interval' intervals to recursively call dvb_usb_read_remote_control(),
> > > > see following code snippet:
> > > [...]
> > >
> > > This patch, as part of v6.10.3-rc3 breaks my TeVii s480 dual DVB-S2
> > > card, reverting just this patch from v6.10-rc3 fixes the situation
> > > again (a co-installed Microsoft Xbox One Digital TV DVB-T2 Tuner
> > > keeps working).
> >
> > Thanks for reporting this ...
> >
> > So looking at the commit, it must be that one of the usb endpoints is
> > neither a send/receiver bulk endpoint. Would you mind sending a lusb -v
> > of the device, I think something like:
> >
> > 	lsusb -v -d 9022:d482
> >
> > Should do it, or -d 9022::d481
> 
> It doesn't show up as 9022:d482 or 9022:d481, but as two 9022:d660.
> 
> system 1, raptor-lake:
> 
> # lsusb -v -d 9022:d660
> 
> Bus 001 Device 003: ID 9022:d660 TeVii Technology Ltd. DVB-S2 S660

-snip-

>     Interface Descriptor:
>       bLength                 9
>       bDescriptorType         4
>       bInterfaceNumber        0
>       bAlternateSetting       0
>       bNumEndpoints           2
>       bInterfaceClass       255 Vendor Specific Class
>       bInterfaceSubClass      0 [unknown]
>       bInterfaceProtocol      0
>       iInterface              0
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x82  EP 2 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0200  1x 512 bytes
>         bInterval               1
>       Endpoint Descriptor:
>         bLength                 7
>         bDescriptorType         5
>         bEndpointAddress     0x81  EP 1 IN
>         bmAttributes            2
>           Transfer Type            Bulk
>           Synch Type               None
>           Usage Type               Data
>         wMaxPacketSize     0x0002  1x 2 bytes
>         bInterval               0

For this device, we do both a bulk snd/rcv to endpoint 1, but the descriptor
says it's an IN endpoint only. So, commit
2052138b7da52ad5ccaf74f736d00f39a1c9198c rejects the device as being invalid.

At the moment, I'm not sure why this works without the patch, surely a bulk
send to endpoint 1 should fail; there is no out entry.

I'm poking around in the usb code, in the mean time if anyone has any ideas,
that would be appreciated.


Sean

