Return-Path: <linux-media+bounces-16482-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B7957023
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 18:25:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D81E82818D5
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 16:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1C89175D53;
	Mon, 19 Aug 2024 16:25:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVRBK5/3"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1730A16D307;
	Mon, 19 Aug 2024 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724084705; cv=none; b=Whu7ONXNiMIFCu1ykfaBCtpfpWIVoLb9jxdN1bQepfrx2V17vaVlH6BVpx99Xu2vW8MZHGDcDdmEtdz/JK0RmKZ6Ofusitb0ExbZnyMqaA4UOquxafoA7Edi1kzZn86DqJ0bTuDp9QNU3uhM2ytYUa8pNWeSIHNVbPyJZnmsbjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724084705; c=relaxed/simple;
	bh=WGe0v6H3T/2YiBVe4JIwGeKG4yeuSR6dQ9wH2L9jyuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WNQebAcxhGdsjhA/uWJ+/9G8E2d4ERlHx8So/3JA2Dvu7RIXpX4c/wEYJReNCFBUAq3Uf6+ntcV0ujbHaEwhS1FpGmXBzTQfEi9LN5CdZCO4HuyD7VgWEeiNf0kcCAx48pi6Gymmz8U8Q11kdrUtHYAyKk+eg+0y4FBWJqZY9TE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVRBK5/3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC7BAC32782;
	Mon, 19 Aug 2024 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724084704;
	bh=WGe0v6H3T/2YiBVe4JIwGeKG4yeuSR6dQ9wH2L9jyuk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=oVRBK5/3jDwy4aPzOGAuBWP8NULcTWmKWaD2Ikgfvqqf9RQdobNFiE5OMMErWMOdP
	 0fqbqGC+aThxxd/c5Vp+qCs6mmibUBZ9U5UpRpb8z/YDxZ8htxeQ7iqvNcdUp6ssyt
	 tNXi9mHMU78eQrpD24e03CPfMoYkgAjNDeqGh0FeLmEvL9gwHr1X0SKk5TdJR0upmq
	 3jJqHgWM9+ragIx0kp1s2SWzytuReqxL1J2EDstxMhBCFeMzso7YSPybdqZz2TKnsU
	 /vIYgzYJOin+UVUmkSt8XkFbVdTpaI8H0J5XuOhMZaecEgBcS7X4/ytXjJuVLFMGzU
	 1xSPOWg154vCg==
Date: Mon, 19 Aug 2024 18:24:56 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, syzbot
 <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <20240819182456.5e13315a@foz.lan>
In-Reply-To: <54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
	<0000000000009f6f85061e684e92@google.com>
	<51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
	<1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
	<2024081909-afar-trolling-2a67@gregkh>
	<20240819101358.77aea582@foz.lan>
	<54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 Aug 2024 10:32:05 -0400
Alan Stern <stern@rowland.harvard.edu> escreveu:

> On Mon, Aug 19, 2024 at 10:15:11AM +0200, Mauro Carvalho Chehab wrote:
> > This patch is duplicated of this one:
> > 
> > https://patchwork.linuxtv.org/project/linux-media/patch/20240409143634.33230-1-n.zhandarovich@fintech.ru/
> > 
> > The part I didn't like with such approach is that it checks only for
> > bulk endpoints. Most media devices have also isoc. Now, I'm not sure
> > about Siano devices. There are 3 different major chipsets supported
> > by this driver (sm1000, sm11xx, sm2xxx). Among them, sm1000 has one
> > USB ID for cold boot, and, once firmware is loaded, it gains another
> > USB ID for a a warm boot.  
> 
> Are you sure about all this?  The one source file in 
> drivers/media/usb/siano refers only to bulk endpoints, and the files in 
> drivers/media/common/siano don't refer to endpoints or URBs at all.  
> Nothing in either directory refers to isochronous endpoints.  Is there 
> some other place I should be looking?
> Also, while there are many constants in those files whose names start 
> with SMS1, there aren't any whose names start with SMS2 or SM2 (or their 
> lowercase equivalents).  And the Kconfig help text mentions only Siano 
> SMS1xxx.
> >
> > Your patch and the previously submitted one are not only checking
> > for the direction, but it is also discarding isoc endpoints.
> > Applying a change like that without testing with real hardware of
> > those three types just to make fuzz testing happy, sounded a little 
> > bit risky to my taste.
> > 
> > I would be more willing to pick it if the check would either be
> > tested on real hardware or if the logic would be changed to
> > accept either bulk or isoc endpoints, just like the current code.  
> 
> If the driver did apply to devices that used isochronous transfers, the 
> ideal approach would be to check the endpoint type against the device 
> type.  However, as it stands this doesn't seem to be necessary.

The initial driver had support only for SM1000 and SM11xx. There is a small 
note there about the sm1000 devices there (I guess this is the chipset
number of Stellar, but my memories might be tricking me), but without
a real association with the chipset number:

	/* This device is only present before firmware load */
	{ USB_DEVICE(0x187f, 0x0010),
		.driver_info = SMS1XXX_BOARD_SIANO_STELLAR_ROM },
	/* This device pops up after firmware load */
	{ USB_DEVICE(0x187f, 0x0100),
		.driver_info = SMS1XXX_BOARD_SIANO_STELLAR },

Years later, support for sm2xxx was added.

Those two boards, for instance (see drivers/media/common/siano/sms-cards.c)
are variants of sm2xxx (one of them is sm2270, if I'm not mistaken) that
supports Brazilian TV standard:

	[SMS1XXX_BOARD_SIANO_PELE] = {
		.name = "Siano Pele Digital Receiver",
		.type = SMS_PELE,
		.default_mode = DEVICE_MODE_ISDBT_BDA,
	},
	[SMS1XXX_BOARD_SIANO_RIO] = {
		.name = "Siano Rio Digital Receiver",
		.type = SMS_RIO,
		.default_mode = DEVICE_MODE_ISDBT_BDA,
	},

There are some boards there with a different version of sm22xx
that supports only DVB (can't remember anymore what boards).

Basically, the actual SMS device type is given by this enum:

	enum sms_device_type_st {
		SMS_UNKNOWN_TYPE = -1,

		SMS_STELLAR = 0,
		SMS_NOVA_A0,
		SMS_NOVA_B0,
		SMS_VEGA,
		SMS_VENICE,
		SMS_MING,
		SMS_PELE,
		SMS_RIO,
		SMS_DENVER_1530,
		SMS_DENVER_2160,

		SMS_NUM_OF_DEVICE_TYPES	/* This is just a count */
	};

But I dunno if there are a 1:1 mapping between type and chipset 
number. The above type names probably match some vendor internal 
names, but we never had any tables associating them to a device number,
as the vendor never provided us such information.

Btw I vaguely remember I heard about a newer Siano chipsets (sm3xxx), 
but never saw such devices.

-

Now, I'm not sure about what endpoints this specific driver exports, as
I'm lacking vendor's documentation. What I said is that almost all DVB 
devices have isoc endpoints, but I dunno if this is the case of Siano.

Thanks,
Mauro

