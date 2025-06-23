Return-Path: <linux-media+bounces-35628-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 601D4AE3F8C
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:19:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3320F1626EA
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:14:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3AC90248867;
	Mon, 23 Jun 2025 12:06:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CUBxK4fB"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1740F23BF9F;
	Mon, 23 Jun 2025 12:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680396; cv=none; b=Jf3yyz4nHXjjk5SvnWfI+DWN/kgQldO5m906/hTHs4pKK/UtYF4C7638mROeZe0tqi4T9MoNjppKSzR0M+WvlQSQna1Fx8b8My98oFblpRUfm0uENV5yTdIM7pAKkec5VKknSuaGveSxlOrOidJHehR+K1+UFgCZuaGhDiLatJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680396; c=relaxed/simple;
	bh=tIZ8TwG4xTnOoPl1NIbbops/txuAvWrt9dcWfFv2Um0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GK3WP7acpDdsK/BZJ30RwFrHOWSPC9bkZsMoH9ykXSyL+Rm8LypfHtOqC2rb5quqVvv1gDr6T6I9eUEI7vFxu29k8gXj29jwOrm2TlUwhpNqVlHQ4UkCrYIb2B6nPL42/guuTUMLi3dp6y+DOXFOe1Dwd89DTZDf0wvZR2UZWX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CUBxK4fB; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 4CF11D77;
	Mon, 23 Jun 2025 14:06:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750680376;
	bh=tIZ8TwG4xTnOoPl1NIbbops/txuAvWrt9dcWfFv2Um0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CUBxK4fBvoKIphifs0ykjVic5ryHph3gEcvEUdCTHufWhVu4S6QkIoaD/pJ3WXGMH
	 lnIrMl2jVGPfdisrnM9EzEMqkY8dCVAs0AfJYHxukyU2asSa4rDY9ZV5Bl8vdqMf/x
	 y+xtjsbtygTe8zJpCOqHTQp3RMyNRTV+KIDckVnQ=
Date: Mon, 23 Jun 2025 15:06:13 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	hverkuil@xs4all.nl, bryan.odonoghue@linaro.org, krzk@kernel.org,
	dave.stevenson@raspberrypi.com, hdegoede@redhat.com,
	jai.luthra@ideasonboard.com, tomi.valkeinen@ideasonboard.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.chan@amd.com, bin.du@amd.com, grosikop@amd.com,
	king.li@amd.com, dantony@amd.com, vengutta@amd.com,
	dongcheng.yan@intel.com, jason.z.chen@intel.com, jimmy.su@intel.com
Subject: Re: [PATCH v3 RESEND] media: i2c: Add OV05C10 camera sensor driver
Message-ID: <20250623120613.GB19319@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <20250614225257.GO10542@pendragon.ideasonboard.com>
 <aFk6K4mYtq24MnNj@valkosipuli.retiisi.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aFk6K4mYtq24MnNj@valkosipuli.retiisi.eu>

On Mon, Jun 23, 2025 at 11:27:39AM +0000, Sakari Ailus wrote:
> On Sun, Jun 15, 2025 at 01:52:57AM +0300, Laurent Pinchart wrote:
> > > > > +#define OV05C10_REF_CLK			(24 * HZ_PER_MHZ)
> > > > 
> > > > Seems your module use 24 MHz clock input. The Dell's modules always use
> > > > 19.2MHz, which means your the PLL settings will not work on Dell's.
> > > 
> > > This is ok as further work. Please send a patch. :-)
> > 
> > The patch should calculate PLL configuration dynamically, perhaps using
> > the ccs-pll calculator if applicable.
> 
> As much as I do like your suggestion, I don't think it's really feasible to
> often do this for Omnivision sensors (most others largely do just work
> without much hassle wrt. PLL, as long as a PLL calculator exists). This
> sensor's PLL tree is different from CCS and badly documented, as expected.

How much do we know about the PLL structure ?

> > > > Seems there are already several camera sensors using page-based registers.
> > > > Is it a good idea to add page support in CCI interface?
> > > 
> > > Sounds like a good idea as such but I'm not sure how common this really is,
> > > I think I've seen a few Omnivision sensors doing this. If implemented, I
> > > think it would be nice if the page could be encoded in the register address
> > > which V4L2 CCI would store and switch page if needed only. This would
> > > require serialising accesses, too. There's some room in CCI register raw
> > > value space so this could be done without even changing that, say, with
> > > 8-bit page and 8-bit register address.
> > 
> > Ack. I've worked on a driver for the AP1302 external ISP, which also
> > uses pages registers. The full address space spans 32 bits though, but
> > fortunately the driver doesn't need to access anything above 0x00ffffff.
> 
> 0xffffff?

Yes.

> The current CCI register addresses are limited to 16 bits. To
> support that, we'd need to use u64 most likely.

I handled it in the ap1302 driver, by using bits 31:24 of address to
store a 8 bits page value. It's a hack as the CCI helper currently only
allocates 4 bits of the address to driver-specific purpose.

> For 16-bit register
> addresses and 8-bit values which probably are the most common, that starts
> to appear a bit wasteful.

It is wasteful, I don't want to turn the register address to a 64-bit
value.

-- 
Regards,

Laurent Pinchart

