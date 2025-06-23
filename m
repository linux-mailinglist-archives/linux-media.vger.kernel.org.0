Return-Path: <linux-media+bounces-35629-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DCCAE3FB1
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 14:22:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B7763BEA10
	for <lists+linux-media@lfdr.de>; Mon, 23 Jun 2025 12:15:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8941324BD1F;
	Mon, 23 Jun 2025 12:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="wntj8czy"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C29724A066;
	Mon, 23 Jun 2025 12:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750680593; cv=none; b=RUKhXdhwvk6W/qZeD0FjYNxY0OuuuzFhURQWFK0T3IjEVPqYnOokUv1Dh9b4JhDUBYGctTfrIryWoevMdZq0prWmKPMx3ITida0eNd/4a4gumKYQ9gZxUmkBioM9EhJCyYggfwzyLmsmmpnyui+SPCWwqm9/sRJ1gVfRhhyTRuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750680593; c=relaxed/simple;
	bh=Qoev+AvdmPBHglTzwsX/BxL22BmFnBv4u3qjgg8DWOk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxwCYSodx/OYiB0eu1tH6p+TMLTP+eorM4klRMTwYOJ4umcEmhk/TR2IIpt1Az8X3vY/fymCz1k8br+NYHanLG6AH7ACqrewDK2ZO8NrUpUXOgObI0A1X/nhVV8ptO4zf9qvgiRxv/n9b63YaPXjP/42BnSboKaOB0Bt9+voUpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=wntj8czy; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 87C81D77;
	Mon, 23 Jun 2025 14:09:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750680572;
	bh=Qoev+AvdmPBHglTzwsX/BxL22BmFnBv4u3qjgg8DWOk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wntj8czyfGuouGhXsDmdmJYNx8DA/iiizco08QWeLVw5voHz45L9GC7058rLm38Hs
	 h4uB3fdygpLZN7xHBfpqhNPUVwiSXheq7qejH6UU0gGreTfc+dgbBB7mQOeOWXh9Q4
	 K3qpT08hT5uxOCCK9M6MuWe2Gay2P7qRZ4zO/HE0=
Date: Mon, 23 Jun 2025 15:09:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
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
Message-ID: <20250623120929.GE826@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>

On Mon, Jun 16, 2025 at 07:12:28PM -0400, Nirujogi, Pratap wrote:
> On 6/13/2025 6:02 PM, Sakari Ailus wrote:
> > On Fri, Jun 13, 2025 at 12:55:46PM +0800, Hao Yao wrote:
> >> Hi Pratap,
> >>
> >> Thanks for your patch.
> >>
> >> This patch is written for your camera sensor module, which seems very
> >> different from those already applied on Dell laptops (some of "Dell Pro"
> >> series). Looking into the driver, I think this version will break the
> >> devices using ov05c10 sensor.
> > 
> > There never was such a driver in upstream so nothing breaks. However, in
> > order to support these, could you check what would it take to support them
> > using this driver and post patches, please?
> > 
> >> I think this patch is better to be validated on existing devices, but please
> >> do some fixes before we can do validation. Please check my comments inline.
> >>
> >> On 2025/6/10 03:42, Pratap Nirujogi wrote:
> >>> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
> >>> supports only the full size normal 2888x1808@30fps 2-lane
> >>> sensor profile.
> >>>
> >>> Co-developed-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> >>> Signed-off-by: Venkata Narendra Kumar Gutta <vengutta@amd.com>
> >>> Co-developed-by: Bin Du <bin.du@amd.com>
> >>> Signed-off-by: Bin Du <bin.du@amd.com>
> >>> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>

[snip]

> >> Hi Sakari,
> >>
> >> Seems there are already several camera sensors using page-based registers.
> >> Is it a good idea to add page support in CCI interface?
> > 
> > Sounds like a good idea as such but I'm not sure how common this really is,
> > I think I've seen a few Omnivision sensors doing this. If implemented, I
> > think it would be nice if the page could be encoded in the register address
> > which V4L2 CCI would store and switch page if needed only. This would
> > require serialising accesses, too. There's some room in CCI register raw
> > value space so this could be done without even changing that, say, with
> > 8-bit page and 8-bit register address.
> 
> Hi Sakari, thank you for sharing your insights and guiding us. Could you 
> please suggest if we should take up this work implementing the helpers 
> in CCI and submit the patch or is it okay to leave it as-is for now and 
> take care of updating in future once the implementation is ready.

I think it can live in the driver for now. Given that the device uses
only 8 bits of register address, I would store the page number in bits
15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
available for driver-specific purpose.

-- 
Regards,

Laurent Pinchart

