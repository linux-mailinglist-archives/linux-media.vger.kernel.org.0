Return-Path: <linux-media+bounces-35708-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E392DAE5597
	for <lists+linux-media@lfdr.de>; Tue, 24 Jun 2025 00:12:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E22EA1BC57FB
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 22:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CCD3227EB9;
	Mon, 23 Jun 2025 22:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="JF4oI6hP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 101A6B676;
	Mon, 23 Jun 2025 22:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750716709; cv=none; b=nWrdxp0vCQ10z76HDE7DH4NyXt5xa3pt2k7AKmwz1rVMM/Kbzl7GOzbJe9glU0sGYdTEeiLoOxq7SD6JZUQgshnZUxIS9hPbGl/TfXn5YNTTmfShlaYOD5CqEdoaEHLGzHVIUMhNVXV1S9Z6Ml3EmDfJzperIjkC1gnXNpaww4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750716709; c=relaxed/simple;
	bh=XD+vw5mO+DY47wvWtjz1cFGmYT2c5lM1NjyZ/CthM8E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TQJNVCeVtkBG0GoT805WwrLY+EWDVkpPyMI2CSmPgKVjEAAhskaS08bFKTffMXgxzjWv62GJcz2UKTnQBMl5oNInUy3rmVHrZFD87dKhkweERY5zvtuSydCEXaRLM2LTMupZsVpk4mRPsp5U+c3h/vTL+nmdPAjXJzHNa+3AlpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=JF4oI6hP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id C82386F3;
	Tue, 24 Jun 2025 00:11:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750716689;
	bh=XD+vw5mO+DY47wvWtjz1cFGmYT2c5lM1NjyZ/CthM8E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JF4oI6hPbInP5IZ8nfk6sl1DCD81/qcBsclJ/A4IBNSdN214kS+lRFlVOwdvl1pym
	 SEtlh/8UbWabQ+V2joXGkJs2g/U0QOpqYFQ99/gfZlYA5/GX7KdtsPs3Uerh0uo6uC
	 MqEhPvqLn40oPiEFvjvyUr8CQk4fPCjo3tw1FM5c=
Date: Tue, 24 Jun 2025 01:11:25 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Sakari Ailus <sakari.ailus@iki.fi>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com,
	Svetoslav.Stoilov@amd.com, Yana.Zheleva@amd.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250623221125.GC15951@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <aFk6K4mYtq24MnNj@valkosipuli.retiisi.eu>
 <20250623120613.GB19319@pendragon.ideasonboard.com>
 <1ca1c306-ab79-4a4e-a8a8-1e1f691ae720@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1ca1c306-ab79-4a4e-a8a8-1e1f691ae720@amd.com>

On Mon, Jun 23, 2025 at 05:53:44PM -0400, Nirujogi, Pratap wrote:
> On 6/23/2025 8:06 AM, Laurent Pinchart wrote:
> > On Mon, Jun 23, 2025 at 11:27:39AM +0000, Sakari Ailus wrote:
> >> On Sun, Jun 15, 2025 at 01:52:57AM +0300, Laurent Pinchart wrote:
> >>>>>> +#define OV05C10_REF_CLK                      (24 * HZ_PER_MHZ)
> >>>>>
> >>>>> Seems your module use 24 MHz clock input. The Dell's modules always use
> >>>>> 19.2MHz, which means your the PLL settings will not work on Dell's.
> >>>>
> >>>> This is ok as further work. Please send a patch. :-)
> >>>
> >>> The patch should calculate PLL configuration dynamically, perhaps using
> >>> the ccs-pll calculator if applicable.
> >>
> >> As much as I do like your suggestion, I don't think it's really feasible to
> >> often do this for Omnivision sensors (most others largely do just work
> >> without much hassle wrt. PLL, as long as a PLL calculator exists). This
> >> sensor's PLL tree is different from CCS and badly documented, as expected.
> > 
> > How much do we know about the PLL structure ?
> 
> sorry to inform we don't have much details, we've consulted with the 
> sensor vendor, but they are not willing to share specifics regarding the 
> PLL calculations, register details, or configuration settings. They have 
> recommended reaching out to them directly for any PLL configurations 
> required for the modes we intend to support.

Do you have access to the sensor datasheet ?

> >>>>> Seems there are already several camera sensors using page-based registers.
> >>>>> Is it a good idea to add page support in CCI interface?
> >>>>
> >>>> Sounds like a good idea as such but I'm not sure how common this really is,
> >>>> I think I've seen a few Omnivision sensors doing this. If implemented, I
> >>>> think it would be nice if the page could be encoded in the register address
> >>>> which V4L2 CCI would store and switch page if needed only. This would
> >>>> require serialising accesses, too. There's some room in CCI register raw
> >>>> value space so this could be done without even changing that, say, with
> >>>> 8-bit page and 8-bit register address.
> >>>
> >>> Ack. I've worked on a driver for the AP1302 external ISP, which also
> >>> uses pages registers. The full address space spans 32 bits though, but
> >>> fortunately the driver doesn't need to access anything above 0x00ffffff.
> >>
> >> 0xffffff?
> > 
> > Yes.
> > 
> >> The current CCI register addresses are limited to 16 bits. To
> >> support that, we'd need to use u64 most likely.
> > 
> > I handled it in the ap1302 driver, by using bits 31:24 of address to
> > store a 8 bits page value. It's a hack as the CCI helper currently only
> > allocates 4 bits of the address to driver-specific purpose.
> > 
> >> For 16-bit register
> >> addresses and 8-bit values which probably are the most common, that starts
> >> to appear a bit wasteful.
> > 
> > It is wasteful, I don't want to turn the register address to a 64-bit
> > value.

-- 
Regards,

Laurent Pinchart

