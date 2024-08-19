Return-Path: <linux-media+bounces-16495-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6159595787D
	for <lists+linux-media@lfdr.de>; Tue, 20 Aug 2024 01:10:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1E9642826FD
	for <lists+linux-media@lfdr.de>; Mon, 19 Aug 2024 23:10:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6A321E2101;
	Mon, 19 Aug 2024 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rMuokTCE"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 166EF1DD384;
	Mon, 19 Aug 2024 23:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724109039; cv=none; b=LrobnK404y6mOTzgsr11uq5jARE3kOLRwWMPgyHGgSgiOtVhzWKFGi/8QxTYqj5g2k3oB2zMig6pHe810/eAlfdfxWkaqH4UKON/VAqk7GLZ6kbW5Dq0u/wGUpUO7Fl/KXFp6jcEwTNogptHICGbOXkSNb4qYLv2IZd3UlkeCro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724109039; c=relaxed/simple;
	bh=6oJxrdVVgTEZcqfhiejtI1ZL4nu4xacBGunuojfaR3E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I0+O4o/U/i8rNQJYkeb0Ux59rOBgeBsNh7DNibE3idS1jArVOamqD5BZd455QkJSE8M/GyKPyRvC03wu/528zWRMUreLmnD6XkRg+Fd+QisezaI7qZgqFY2ucgkTz+UoR/zGBjY8yoN5KGJ2JRRcXmkmSVobC/BhtIPXmiPSqxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rMuokTCE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16E32C32782;
	Mon, 19 Aug 2024 23:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724109038;
	bh=6oJxrdVVgTEZcqfhiejtI1ZL4nu4xacBGunuojfaR3E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rMuokTCE8YcKUlgNqRGo6fz2ZA3peNsJBUb+BshfkUx1YkkVlTH63UGmEzEzaCThb
	 vcTs95ajyNxGyHm/ti6fIvshdxRv//Vt/40yePV1ncVulZRP7yh2Lx3zu0FLpRmD5A
	 lOcSwQ/gKIs1IrQYlTeylyPfJMqBxcM5kE/gve4g8gurIiVcLf9QWXOzIPhweKQugt
	 zT4hkEHZVGf8rDOqk4UC0fZPhshEc9QV2dWWv+26QdWNaUxv9zJrwcgNFQi/7jbhw1
	 bi/sdsq+/cjlX8CChAP/pY03berBy4Xr4+7JcBfbLBYQEsknH0lgMUa5WXLOsriyyh
	 Cyqd/1dfXAzhw==
Date: Tue, 20 Aug 2024 01:10:33 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, syzbot
 <syzbot+85e3ddbf0ddbfbc85f1e@syzkaller.appspotmail.com>,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-usb@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] media/usb/siano: Fix endpoint type checking in smsusb
Message-ID: <20240820011033.79312cb5@foz.lan>
In-Reply-To: <044260d2-4aa3-4937-9f5b-91e039a1df41@rowland.harvard.edu>
References: <4442a354-87f1-4f7c-a2b0-96fbb29191d1@rowland.harvard.edu>
	<0000000000009f6f85061e684e92@google.com>
	<51b854da-f031-4a25-a19f-dac442d7bee2@rowland.harvard.edu>
	<1959a4fb-8bf2-456b-83b8-ea28d517debf@rowland.harvard.edu>
	<2024081909-afar-trolling-2a67@gregkh>
	<20240819101358.77aea582@foz.lan>
	<54c7e42c-465b-42fc-9707-d848ae53a00c@rowland.harvard.edu>
	<20240819182456.5e13315a@foz.lan>
	<044260d2-4aa3-4937-9f5b-91e039a1df41@rowland.harvard.edu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Em Mon, 19 Aug 2024 13:14:19 -0400
Alan Stern <stern@rowland.harvard.edu> escreveu:

> On Mon, Aug 19, 2024 at 06:24:56PM +0200, Mauro Carvalho Chehab wrote:
> > Basically, the actual SMS device type is given by this enum:
> > 
> > 	enum sms_device_type_st {
> > 		SMS_UNKNOWN_TYPE = -1,
> > 
> > 		SMS_STELLAR = 0,
> > 		SMS_NOVA_A0,
> > 		SMS_NOVA_B0,
> > 		SMS_VEGA,
> > 		SMS_VENICE,
> > 		SMS_MING,
> > 		SMS_PELE,
> > 		SMS_RIO,
> > 		SMS_DENVER_1530,
> > 		SMS_DENVER_2160,
> > 
> > 		SMS_NUM_OF_DEVICE_TYPES	/* This is just a count */
> > 	};
> > 
> > But I dunno if there are a 1:1 mapping between type and chipset 
> > number. The above type names probably match some vendor internal 
> > names, but we never had any tables associating them to a device number,
> > as the vendor never provided us such information.
> > 
> > Btw I vaguely remember I heard about a newer Siano chipsets (sm3xxx), 
> > but never saw such devices.
> > 
> > -
> > 
> > Now, I'm not sure about what endpoints this specific driver exports, as
> > I'm lacking vendor's documentation. What I said is that almost all DVB 
> > devices have isoc endpoints, but I dunno if this is the case of Siano.  
> 
> Currently the driver exports only bulk endpoints, even though it doesn't 
> check the endpoint type.  You can tell because the only routine in it 
> that calls usb_submit_urb() is smsusb_submit_urb(), and that routine 
> calls usb_fill_bulk_urb() before doing the submission.
> 
> Given this, I suggest merging the earlier patch submission from Nikita 
> Zhandarovich as-is.  If the driver ever evolves to include support for 
> isochronous endpoints, the probe function can be modified then.

I'll see if I can try his patch and see if device keeps working. The
logic indeed use endpoints in bulk mode, but I'm not sure if, for all the
BIOS files at drivers/media/common/siano/smscoreapi.[ch], the endpoints
are properly reported as bulk.

What happens if an endpoint is reported as ISOC, but the URB submit
is called without URB_ISO_ASAP? On a quick check, the code at usb_submit_urb()
seems to not complain about that.

I would be a lot more comfortable if the patch were using just

	if (usb_endpoint_dir_in(desc))
	...
	if (usb_endpoint_dir_out(desc))
	...

or something like this (to accept both isoc and bulk):

	if (!usb_endpoint_xfer_int(epd)) {
		if (usb_endpoint_dir_in(desc))
		...
		if (usb_endpoint_dir_out(desc))
		...
	}


instead of calling usb_endpoint_xfer_bulk(desc) to check if type
is bulk.

I'll try to do some tests, but not sure when, as I'm traveling abroad
this week.


Thanks,
Mauro

