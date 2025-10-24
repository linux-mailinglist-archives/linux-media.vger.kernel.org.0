Return-Path: <linux-media+bounces-45483-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D917EC05AE8
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 12:53:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id EDCC9343026
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 10:53:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C54BC310640;
	Fri, 24 Oct 2025 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FNDE+1St"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49D21D6AA
	for <linux-media@vger.kernel.org>; Fri, 24 Oct 2025 10:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761303172; cv=none; b=rqfedCN6ng3b8+Dh7ss3zMN+A+SRVJHeMwzgQ3S733178NzhX+m8rmknqujozuatUy9+0tZ95q4JVciRC2x3vI3OSFh8HEoDgokjB8zQxS/469FziF8O8UOpcmXSHwI9zCdNiUCq3WCvLebMkgTkhCvk33EVTaENfEFLigLeaoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761303172; c=relaxed/simple;
	bh=NhKCx5QXhgTz2vAZzS2AWmlPbZPiZ4j8mKCvUtm/lZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ahTw99obZFxCp2ebeLcLk644eIMwkMhljXG4MzbkzVCbBYU6jB4kBQROZa2C1ZA1iWIWLhfQLaBGnBCfPVEhoNHAHFJDKNkUIa2Gmsf3hIfGaHsvQJg7v6CyPPkc2jeWDrUz5+tJ1s4HovZ4h4K17Tj6G25l7Iaylm/DLP5vEbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=FNDE+1St; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B6C1F8D4;
	Fri, 24 Oct 2025 12:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761303063;
	bh=NhKCx5QXhgTz2vAZzS2AWmlPbZPiZ4j8mKCvUtm/lZ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FNDE+1St3NY2ivsEWjuJ+XdZBCf0K/fL6qshtTAe7nR2I31QLRkj8erHlronnzVah
	 nTBkfkhO6uImdkxFUshslctF/O9AM+ShEW6bQKd6wrfPzyEcy1+fGW7FBRsPok+7TQ
	 iIuzIWaOxGahyo5MbIB/G//jI974qobVUB+fXWYs=
Date: Fri, 24 Oct 2025 13:52:34 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Lili Orosz <lily@floofy.city>
Cc: hansg@kernel.org, mchehab@kernel.org, linux-media@vger.kernel.org,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: Re: PROBLEM: regression in commit 0e2ee70291e64 breaks
 non-spec-compliant webcams
Message-ID: <20251024105234.GA15811@pendragon.ideasonboard.com>
References: <dd1c8e46-5616-4395-baac-56fdc4a67be2@floofy.city>
 <20251023103804.GH19043@pendragon.ideasonboard.com>
 <7dc01c6e-d9d7-4645-bd17-d0fc0f8b596d@floofy.city>
 <20251023112312.GG727@pendragon.ideasonboard.com>
 <a4c69323-e606-410e-8a63-02621980a326@floofy.city>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a4c69323-e606-410e-8a63-02621980a326@floofy.city>

Hi Lili,

On Thu, Oct 23, 2025 at 03:53:52PM +0200, Lili Orosz wrote:
> Hi Laurent,
> 
> After applying only the patch you sent, the webcam seems to function, 
> though I get the following message in dmesg:
> 
> ```
> [    3.373083] uvcvideo 1-5:1.0: Found multiple Units with ID 4
> ```

That's expected, we hope that printing an error message may help vendors
noticing the issue before the device hits the market. I won't hold my
breath, but one can always hope :-)

Thanks for testing. Can I add a

Tested-by: Lili Orosz <lily@floofy.city>

in the commit ? It would then be stored permanently in the kernel's git
history. If you prefer not being mentioned there, I will not add the
tag.

> On 2025. 10. 23. 13:23, Laurent Pinchart wrote:
> > On Thu, Oct 23, 2025 at 01:07:49PM +0200, Lili Orosz wrote:
> >> Hi Laurent,
> >>
> >> Thank you for the quick reply.
> >>
> >> Below is the output of the lsusb command:
> > Thank you.
> >
> >> ```
> >> Bus 001 Device 002: ID 1d6b:0105 Linux Foundation FunctionFS Gadget
> >> Negotiated speed: High Speed (480Mbps)
> >> Device Descriptor:
> >>     bLength                18
> >>     bDescriptorType         1
> >>     bcdUSB               2.00
> >>     bDeviceClass          239 Miscellaneous Device
> >>     bDeviceSubClass         2 [unknown]
> >>     bDeviceProtocol         1 Interface Association
> >>     bMaxPacketSize0        64
> >>     idVendor           0x1d6b Linux Foundation
> >>     idProduct          0x0105 FunctionFS Gadget
> > That's a lovely one :-)
> >
> >>     bcdDevice            4.09
> >>     iManufacturer           4 LSK Meeting Eye for Business & Home
> >>     iProduct                5 LSK Meeting Eye for Business & Home
> >>     iSerial                 0
> >>     bNumConfigurations      1
> >>     Configuration Descriptor:
> >>       bLength                 9
> >>       bDescriptorType         2
> >>       wTotalLength       0x0b33
> >>       bNumInterfaces          4
> >>       bConfigurationValue     1
> >>       iConfiguration          7 video
> >>       bmAttributes         0xc0
> >>         Self Powered
> >>       MaxPower                2mA
> >>       Interface Association:
> >>         bLength                 8
> >>         bDescriptorType        11
> >>         bFirstInterface         0
> >>         bInterfaceCount         2
> >>         bFunctionClass         14 Video
> >>         bFunctionSubClass       3 Video Interface Collection
> >>         bFunctionProtocol       0
> >>         iFunction               8 LSK Meeting Eye for Business & Home
> >>       Interface Descriptor:
> >>         bLength                 9
> >>         bDescriptorType         4
> >>         bInterfaceNumber        0
> >>         bAlternateSetting       0
> >>         bNumEndpoints           0
> >>         bInterfaceClass        14 Video
> >>         bInterfaceSubClass      1 Video Control
> >>         bInterfaceProtocol      0
> >>         iInterface              8 LSK Meeting Eye for Business & Home
> > [snip]
> >
> >>         VideoControl Interface Descriptor:
> >>           bLength                31
> >>           bDescriptorType        36
> >>           bDescriptorSubtype      6 (EXTENSION_UNIT)
> >>           bUnitID                 4
> >>           guidExtensionCode  {ffe52d21-8030-4e2c-82d9-f587d00540bd}
> >>           bNumControls           48
> >>           bNrInPins               1
> >>           baSourceID( 0)          2
> >>           bControlSize            6
> >>           bmControls( 0)       0xff
> >>           bmControls( 1)       0xff
> >>           bmControls( 2)       0xff
> >>           bmControls( 3)       0xff
> >>           bmControls( 4)       0xff
> >>           bmControls( 5)       0xff
> >>           iExtension              0
> >>         VideoControl Interface Descriptor:
> >>           bLength                 9
> >>           bDescriptorType        36
> >>           bDescriptorSubtype      3 (OUTPUT_TERMINAL)
> >>           bTerminalID             4
> >>           wTerminalType      0x0101 USB Streaming
> >>           bAssocTerminal          0
> >>           bSourceID               3
> >>           iTerminal               0
> > These are the two units that share the same ID. The ID duplication is
> > identical to the one reported in [1]. Ricardo has posted a patch in [2],
> > would you be able to test it ? It should be tested on top of a kernel
> > that exhibits the issue, without reverting 0e2ee70291e64.
> >
> > [1] https://lore.kernel.org/r/CAOzBiVuS7ygUjjhCbyWg-KiNx+HFTYnqH5+GJhd6cYsNLT=DaA@mail.gmail.com
> > [2] https://lore.kernel.org/r/20251022-uvc-grandstream-laurent-v2-1-8c5c20d6c571@chromium.org
> >
> >> I don't think it makes a difference, but this output is from a system
> >> running the patched kernel (where the webcam works).
> > It should make no difference.
> >
> >> On 2025. 10. 23. 12:38, Laurent Pinchart wrote:
> >>> On Thu, Oct 23, 2025 at 12:12:23PM +0200, Lili Orosz wrote:
> >>>> Hello,
> >>>>
> >>>> The change in commit 0e2ee70291e64 reintroduces an issue that was
> >>>> reverted once before. It prevents webcams that do not follow the spec
> >>>> and have non-unique unit IDs from being usable. This issue is present
> >>>> both in 6.12.54 (LTS) as well as mainline.
> >>>>
> >>>> The camera I tested with and can confirm is affected: LSK Meeting Eye
> >>>> for Business & Home. It's very likely that this is not the only
> >>>> non-compliant webcam out there.
> >>> Could you please share the full `lsusb -v` output for your device ?
> >>>
> >>>> If I build the kernel with that commit reverted, my webcam begins to
> >>>> function as intended again.

-- 
Regards,

Laurent Pinchart

