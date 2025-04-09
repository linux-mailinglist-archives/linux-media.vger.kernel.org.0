Return-Path: <linux-media+bounces-29802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 86002A832D5
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 22:55:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C59588A097D
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 20:54:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B67442135AD;
	Wed,  9 Apr 2025 20:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mGstyAOy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5321DDC04;
	Wed,  9 Apr 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232096; cv=none; b=YuelhCaX0DwGjvmcGXlQNiy8tAkFzTUUXhoexWSQjeZzjorXGA0uz8eVlsvpB/sF7wG3w9NtB7yCEmTb2mzXTPsBMpGChrVqea5Hg+mGEIcQ2BuBRNANaTzstTpDoTM+dOzT+0dvGJaO39n9JG8USR19oanZmu7vrVJHArQdBqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232096; c=relaxed/simple;
	bh=4oSZZwhw7PQhTzXV7fjqEVHEgheLJg48XzbYnFxp19A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3yed8oJqxBLV5x53NAbPhbt1LQ/9dvJyHOYuZkyuGVRQpOCZcgwNCLelYLapYB+SdYZXciqzeAoBZtbqLyetaDCBVCiyq4gLaCSvPI1aJIeIpDNhwP/dhL80YBOBp1/Fr4egUy9C3z4dxxlMDKMawAJVGgLaI1q3UnEis7UJqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mGstyAOy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E407C9CE;
	Wed,  9 Apr 2025 22:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744231974;
	bh=4oSZZwhw7PQhTzXV7fjqEVHEgheLJg48XzbYnFxp19A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mGstyAOyr2ER8aIjbnelGwUaEIXExrU8SkzTl0SiFDCR0/0Vpxyyh111y7QRl5KP+
	 BuBRnjR/iYwYjDiDNRhSwRgunXVbwt+mU9jCORSjzqJEIWMh6DS2m29h6w7jgNd1sO
	 +RUq2Nlqioxr+PKJ6tkx7LtbmxPDcR9tuCG+PzFw=
Date: Wed, 9 Apr 2025 23:54:26 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Gabriel Shahrouzi <gshahrouzi@gmail.com>
Cc: Ricardo Ribalda <ribalda@chromium.org>, hdegoede@redhat.com,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+701fc9cc0cb44e2b0fe9@syzkaller.appspotmail.com,
	skhan@linuxfoundation.org, kernelmentees@lists.linuxfoundation.org
Subject: Re: [PATCH] media: Fix invalid link creation when source entity has
 0 pads
Message-ID: <20250409205426.GA12162@pendragon.ideasonboard.com>
References: <67e26157.0c0a0220.36adcd.506e@mx.google.com>
 <CANiDSCsvEke31SAgXhs_sXEN7d6fXrwuhJFsi2mzESq1Jc8pxA@mail.gmail.com>
 <CAKUZ0zJjdSDH3cw=8iKJauU5dmcq9TFhAaJX4yS5UQoiCUaguA@mail.gmail.com>
 <20250326001336.GA23984@pendragon.ideasonboard.com>
 <CAKUZ0zKDy47cQ0ZQo-=1c7wmazbutF=VF3qX09DfZFBz01hh-g@mail.gmail.com>
 <20250402002948.GC4845@pendragon.ideasonboard.com>
 <CAKUZ0z+V0pBvAf1VRGcWf_QcROZFsTUcHmNM1T1=DpBw56yi8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKUZ0z+V0pBvAf1VRGcWf_QcROZFsTUcHmNM1T1=DpBw56yi8A@mail.gmail.com>

Hi Gabriel,

On Tue, Apr 08, 2025 at 01:35:00AM -0400, Gabriel Shahrouzi wrote:
> On Tue, Apr 1, 2025 at 8:30 PM Laurent Pinchart wrote:
> > On Sat, Mar 29, 2025 at 01:50:00PM -0400, Gabriel wrote:
> > > Hi Laurent,
> > >
> > > I’ve analyzed the bug report, and the root cause of the
> > > "WARNING-media_create_pad_link" issue is a mismatch in terminal
> > > references in the USB descriptor.
> > >
> > > The format type descriptor references terminal ID 6, while the audio
> > > streaming interface descriptor points to terminal ID 5. This
> > > discrepancy triggers the warning: "No streaming interface found for
> > > terminal 6", followed by the media pad link warning.
> >
> > Can you share the USB descriptors.
>
> The USB descriptors via the Syzkaller reproducer:
>          "\x12\x01\x00\x00\xfb\x5d\x7d\x08\x6d\x04\xc3\x08\x16\x6b\x01\x02\x03"
>          "\x01\x09\x02\x50\x00\x01\x00\x00\x00\x00\x09\x04\x1f\x00\x00\xff\x01"
>          "\x00\x00\x0a\x24\x02\x00\x00\x05\x02\x01\x02\x07\x24\x07\x05\x00\x00"
>          "\x18\xc2\x24\x08\x05\x04\x00\x04\x96\x0d\x24\x06\x01\x01\x03\x02\x00"
>          "\x01\x00\x06\x00\x06\x09\x24\x03\x05\x05\x03\x06\x05\x81\x09\x24\x03"
>          "\x06\x01\x01\x04\x05\x05\x07\x24\x04\x05\x01\x00\x9c\xbd\x89"

If I haven't made any mistake in the manual decode process (is there any
Linux tool that can decode a binary descriptors dump the same way lsusb
decodes descriptors from a device ?), the relevant UVC descriptors there
are

0x0a		bLength
0x24		bDescriptorType USB_DT_CS_INTERFACE
0x02		bDescriptorSubtype VC_INPUT_TERMINAL
0x00		bTerminalID 0 (invalid)
0x00, 0x05	bTerminalType 0x0500 (invalid)
0x02		bAssocTerminal 2 (invalid)
0x01		iTerminal 1 
0x02, 0x07

0x09		bLength
0x24		bDescriptorType USB_DT_CS_INTERFACE
0x03		bDescriptorSubtype VC_OUTPUT_TERMINAL 
0x06		bTerminalID 6 
0x01, 0x01	bTerminalType TT_STREAMING
0x04		bAssocTerminal 4 (invalid)
0x05		bSourceID 5 
0x05		iTerminal 5

0x07		bLength
0x24		bDescriptorType USB_DT_CS_INTERFACE
0x04		bDescriptorSubtype VC_SELECTOR_UNIT 
0x05		bUnitID 5 
0x01		bNrInPins 1 
0x00		baSourceID(1) 0 
0x9c		iSelector 156

Ignoring a few invalid values (bTerminalID shouldb't be 0, bTerminalType
0x0500 is defined by the specification, and the two bAssocTerminal ids
are also invalid), this creates the following chain:

VC_INPUT_TERMINAL (0) -> VC_SELECTOR_UNIT (5) -> VC_OUTPUT_TERMINAL (6)

Looking at uvc_mc_init_entity() where the media_entity->num_pads field
gets assigned by calling media_entity_pads_init(), a media entity is
only initialized when the entity type is not TT_STREAMING (so it's a
subdev), or when the entity has an associated video device. I think
that what is happening here is that the second entity in the above list
(VC_OUTPUT_TERMINAL, id 6) fails to initialize properly in
uvc_register_terms() is there is no corresponding streaming interface in
the device. This is confirmed by the

usb 1-1: No streaming interface found for terminal 6.

message in the syzbot kernel log. No video device is created for the
terminal, and no media_entity is initialized. Trying to later link the
entity in uvc_mc_create_links() then fails.

I don't want to address this in uvc_mc_create_links() as the invalid
terminal in the chain means we could have other issues elsewhere. One
option is to fail turn the missing streaming interface check in a hard
failure, at least for the chain being registered. The driver could still
proceed to registering other chains.

There's a small risk of regression for buggy devices. If that's a
problem, we could instead remove invalid terminals from the device
entities list before we proceed to scanning chains.

> > > I confirmed this by changing the terminal ID in the format descriptor
> > > from 6 to 5, which eliminates both warnings. This shows the warning is
> > > correctly identifying an invalid descriptor configuration, not a
> > > kernel bug.
> >
> > There's still something not quite right. uvc_entity->num_pads should
> > always be equal to the corresponding media_entity->num_pads. That's not
> > the case here, and I think it indicates a bug.
>
> Ah ok - the mismatch itself shouldn't happen regardless of the descriptor
>
> > > Since the USB descriptor is invalid, I believe the warning is
> > > necessary and should remain. The code should stay as is.
> >
> > There should be a warning, but I think it needs to be caught in a
> > different place, earlier.
>
> Got it.
>
> > > On Tue, Mar 25, 2025 at 8:13 PM Laurent Pinchart wrote:
> > > > On Tue, Mar 25, 2025 at 06:05:00PM -0400, Gabriel wrote:
> > > > > Hi Ricardo,
> > > > >
> > > > > > I cannot reach that URL
> > > > > I was unable to access the URL from my email client when I initially
> > > > > sent the email, but a couple of hours later, I was able to. Initially,
> > > > > copying and pasting the URL into the browser provided a workaround.
> > > > >
> > > > > > Shouldn't it be?:
> > > > > > Fixes: 4ffc2d89f38a ("[media] uvcvideo: Register subdevices for each entity")
> > > > > You're right, I incorrectly referenced the wrong commit. However, I’m
> > > > > not certain if it should reference a96aa5342d57 (Fixes: a96aa5342d57 -
> > > > > '[media] uvcvideo: Ignore entities for terminals with no supported
> > > > > format') as it's the latest commit affecting the line I'm changing or
> > > > > the one you mentioned.
> > > > >
> > > > > > Shouldn't source->num_pads be the same as remote->num_pads?
> > > > > The fuzzer (Syzkaller) that triggered the warning appears to have
> > > > > encountered a case where source->num_pads and remote->num_pads were
> > > > > different. When analyzing the case in GDB, remote->num_pads was 1,
> > > > > while source->num_pads was 0.
> > > >
> > > > This seems like the real bug that should be fixed.
> > > >
> > > > > > Are you sure that your kernel does not contain?
> > > > > > https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/drivers/media/usb/uvc/uvc_entity.c?id=41ddb251c68ac75c101d3a50a68c4629c9055e4c
> > > > > Yes, it should be included since I am running the upstream kernel.

-- 
Regards,

Laurent Pinchart

