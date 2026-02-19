Return-Path: <linux-media+bounces-53086-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mGVVAoLklmlbqgIAu9opvQ
	(envelope-from <linux-media+bounces-53086-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:22:58 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D9D615DBEF
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 11:22:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 641313016ED0
	for <lists+linux-media@lfdr.de>; Thu, 19 Feb 2026 10:22:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 715E831A56B;
	Thu, 19 Feb 2026 10:22:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RvqLnIxa"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B31238FA3
	for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 10:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771496563; cv=none; b=o7f+3i4dbRAxULwgaIhTdeq81fGt6tlOcmhOZWxBRIHV7fO7VW6rD6QRquCR/AmRSzCqKNOSS8SyQSSZIc69D54GPh+4uxuiQwhuCGV3bAaiODRl8fXRmVN15pFJawZk/LbiNZBgJvS0JysTASyI3bIpWkBl5RRikIhBl5agnew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771496563; c=relaxed/simple;
	bh=YWN7icCLbVQIbP0Jswyr+4rVyLgzQAMYcQUZRJ0EADc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DsCRwPnO5jfUq1SKUam6V6tDWNErqZevBr8ghDDHXHWOG19ykjy+Rek2IMFLW/7DWNRj5hZZ3q0FfeEUXtHF0v8GcyeDiKkwjU3YyE7UO1vlzJdwRXUZ2rNuwWM4VVKQ/OEjuqnEVfz26UkfIMGk9GrpkooK8o1UoOx+SzGz0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RvqLnIxa; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso2949855a12.0
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 02:22:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1771496560; x=1772101360; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rQQQMOTsW14LxSECPnLPPpv9g/0jDVgR/EfEr502syA=;
        b=RvqLnIxaWb1eo45a2t2VS4CCPqoUmTzuP4Xy/YSQbZlqIDOCARsaBYRa56AeOn8YoG
         vXRgnA6jWn5Tb1FklKWu46L4V3xsEMcA/+EaYomj6Z4kbXPL0v0BmtwoYIKc1vJPpj+C
         8RZcKXPFt/iqfe5x+PXOXKaZocwyeVdrQEH98=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771496560; x=1772101360;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rQQQMOTsW14LxSECPnLPPpv9g/0jDVgR/EfEr502syA=;
        b=YSkkOSUTt3xcK2D55yGv2uGpsXaUYGE+YYl0kglyo+c+62AsOieLbDi80cLezqOVUj
         Fw5v9hZBtDkY/il7XYLmxAWIXuYUhiD+LQ0I2NLvGuopb7Ic+uoValHEG6mv7JGykHgQ
         +D8dZul5iPqPpKRm1mhcIRz1ZQpYrMQGmHno17MoNpq9i69+ZQpXlqW/Wqd3O9djEmmx
         C6PM9q7C0J+/E3mMkuuC9mCnc9chC/zN/J+/Ucu4FBVthtqxq1YmFFlfIyFKXQ4naoTO
         Zgh4Semu1jALxRaI9ShXfiW5+XVjYKZAOpthcypMwiI76Rvro42m8iR8XD/BLbzna8pb
         i1+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWh4JXnS9/7nBIStjJ3+pZlSWvGhYM2J0m7lySV1OakXGfmmt4p5Si/2PptfB+i5RaErmfTptaPWzubyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwqQD0WDLww/BqjW/bYFbyUEWal5g4iN8x40r5BFr5ROd71MN2+
	PxJMhZxUQ3muWsChHJV6MypM/DF7MDbX0vZ2dM0lHDZDFM7yvbWm+FRaIxhADvvOKMj6ErRZXV7
	NaUctcA==
X-Gm-Gg: AZuq6aJnlW3tYAzIinCGX9+tVYpTtR9uZ1TipIU/yJUsepkrrXJpdcoNo7l35VRYEdv
	elpaGOMFkPsPgW41l0n52HYxWgQ9tvXUoXM/5As1dAq0/HcSHj0t51+X8he8TzZqU4kOvtHJSTJ
	/qowxlJDH0/mRIPqRY+ByL1NysYSWcIH0UwYLlaapce0SrYk0UeIG6+H/TwQ2AN/DrCyWzx0rPV
	WmUW9hfzEvOlvU4h2LdAZAw9JAxMqmaLc+0mNRy/a5BxwRQtwSb/oBtnueHH/st6Hpu0nHkkYZw
	lhaKZ+P2DqESYHLXQxmchrR0FtnAcrcktbx7UKZXml0ZuzzSUks0vskZjKn/uqckh+KnHU7p5xN
	JMYsQvXwWHreOp8Kaj8Md0YEcLAErvHTP8kniq+AzEFVSNNk7XuT2G+5io93o3nN5hMf7UfUvdf
	XsNrwFzQuGMHbhXrSNAJKG84LV8kcjMk1Z3RmgzSNHjr23etxjZIjykJr3zPH+
X-Received: by 2002:a17:906:d553:b0:b87:cf6d:8ea with SMTP id a640c23a62f3a-b905444b802mr74065666b.27.1771496560148;
        Thu, 19 Feb 2026 02:22:40 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-65bad19bed1sm3743615a12.7.2026.02.19.02.22.38
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 02:22:39 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65a1970b912so2990268a12.1
        for <linux-media@vger.kernel.org>; Thu, 19 Feb 2026 02:22:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXcv5RlizUZZSswJIGTcqmmMFYT1T243+hzGlhg5uBQ+UIz9QQqm2MmiLHigeOp76FY6b6kBQIFgJw2fw==@vger.kernel.org
X-Received: by 2002:a17:907:802:b0:b79:ea1b:f13d with SMTP id
 a640c23a62f3a-b9054921cbcmr80936766b.2.1771496557721; Thu, 19 Feb 2026
 02:22:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <AMBPR10MB9376E972B02F45815C729C318D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <CANiDSCtPKtKr7UgEj934BGpV0NEvyHbYcutMV_umBa=JiCNDuw@mail.gmail.com>
 <AMBPR10MB9376F52A5A6C5EC76EC263CA8D6AA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260218222211.GE57525@killaraus.ideasonboard.com> <AMBPR10MB9376A5762A4DF0BA3759437A8D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260219082157.GD520738@killaraus.ideasonboard.com> <AMBPR10MB937601B40E77906128A82B758D6BA@AMBPR10MB9376.EURPRD10.PROD.OUTLOOK.COM>
 <20260219091628.GG520738@killaraus.ideasonboard.com>
In-Reply-To: <20260219091628.GG520738@killaraus.ideasonboard.com>
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Thu, 19 Feb 2026 11:22:24 +0100
X-Gmail-Original-Message-ID: <CANiDSCvM6joCn2sNgUG8O74KKQ8xbiCK_J=6ADdW-MVZjTvqrA@mail.gmail.com>
X-Gm-Features: AaiRm53QOLrqNK5cdNu5mkcAvLAIfpvQwDlnGS1rWM3nzNvZdayiBxKpTvkaH7g
Message-ID: <CANiDSCvM6joCn2sNgUG8O74KKQ8xbiCK_J=6ADdW-MVZjTvqrA@mail.gmail.com>
Subject: Re: uvcvideo regression: loss of access to full UVC payload header
 for generic UVC devices since 6.17
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Itay Perl <itay.perl@q.ai>, Hans de Goede <hansg@kernel.org>, 
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Itay Chamiel <itay.chamiel@q.ai>
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-53086-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ribalda@chromium.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2D9D615DBEF
X-Rspamd-Action: no action

Hi Itay

On Thu, 19 Feb 2026 at 10:16, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Thu, Feb 19, 2026 at 09:01:15AM +0000, Itay Perl wrote:
> > On 19 February 2026 16:21, Laurent Pinchart wrote:
> > > On Thu, Feb 19, 2026 at 06:03:49AM +0000, Itay Perl wrote:
> > > > ON 19 February 2026 06:22, Laurent Pinchart wrote:
> > > > > On Wed, Feb 18, 2026 at 11:56:28AM +0000, Itay Perl wrote:
> > > > > > On 18 February 2026 19:17, Ricardo Ribalda wrote:
> > > > > > > On Wed, 18 Feb 2026 at 11:59, Itay Perl wrote:
> > > > > > > > Would restoring the previous behavior be acceptable for compatibility?
> > > > > > > > Alternatively (or additionally), would it make sense to introduce a dedicated
> > > > > > > > metadata format that allows userspace to request the full UVC header for
> > > > > > > > generic devices?
> > > > > > >
> > > > > > > By any chance the device that you are using supports
> > > > > > > V4L2_META_FMT_UVC_MSXU_1_5 ?
> > > > > > > If the device exposes the UVC_MSXU_CONTROL_METADATA control, that
> > > > > > > format should be available, and it provices access to all the UVC
> > > > > > > header as you had before.
> > > > > > >
> > > > > > > Alternatively, if this is needed for a specific device you could send
> > > > > > > a patch adding the UVC_QUIRK_MSXU_META for that device.
> > > > > > > Would that work for you?
> > > > > >
> > > > > > My device is an internal development platform and does not have a public VID/PID
> > > > > > that could reasonably be added to the driver.
> > > > > >
> > > > > > I may be able to implement the MSXU control on the device side as a workaround,
> > > > > > but I'm concerned that this could cause issues when the device is used on a
> > > > > > Windows machine, which may expect the UVC header to follow a certain
> > > > > > format when MSXU is present.
> > > > >
> > > > > Does your device implement a vendor-specific metadata format ?
> > > >
> > > > Yes, the device uses a vendor-specific metadata format to attach
> > > > platform-specific data to each frame.  This is the most straightforward way to
> > > > add per-frame metadata without otherwise affecting UVC functionality.  We have
> > > > used this method successfully on Linux (using the 0-format hack) and on
> > > > Windows, where it required a registry configuration but was otherwise
> > > > supported.
> > >
> > > To support that device on Linux, the right way is to define a meta
> > > format (such as V4L2_META_FMT_UVC and V4L2_META_FMT_UVC_MSXU_1_5) and
> > > either add a VID:PID entry to the driver's uvc_ids[] array if the number
> > > of devices is small, or define an XU that advertises support for the
> > > format if you expect a larger number of devices. The metadata format
> > > needs to be documented.
> >
> > I understand the device-specific metadata approach via uvc_ids. However, my
> > device is an internal development platform not intended for public
> > availability, so adding specific support for it in the kernel would not be
> > appropriate.
> >
> > Would it be reasonable to consider a generic metadata format (such as
> > V4L2_META_FMT_UVC_RAW/EXT) that could be used with generic devices? This could
> > be a useful feature for UVC device development and testing in general.
>
> The reason for the current design is to ensure that metadata formats get
> publicly documented. A generic format would defeat that.

If you plan to release a device with a proprietary metada the easiest
way fwd would be create a new new format (as Laurent suggested).

During the development phase you can use a quirk to force
V4L2_META_FMT_UVC_MSXU_1_5 in your device. Something like:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/usb/uvc/uvcvideo.h#n83

rmmod uvcvideo
modprobe uvcvideo quirks=0x00040000

Btw, If you have the chance, I'd recommend going with the
V4L2_META_FMT_UVC_MSXU_1_5 format. It is quite flexible and the driver
already supports it, there's no reason to re-invent the wheel if you
can avoid it.

Regards!
>
> --
> Regards,
>
> Laurent Pinchart



-- 
Ricardo Ribalda

