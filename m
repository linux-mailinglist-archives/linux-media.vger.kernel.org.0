Return-Path: <linux-media+bounces-29177-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04E05A78589
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 02:19:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0BCA53ACF7E
	for <lists+linux-media@lfdr.de>; Wed,  2 Apr 2025 00:18:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FE31B667;
	Wed,  2 Apr 2025 00:18:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="SkuismLY"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51C1223A9;
	Wed,  2 Apr 2025 00:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743553117; cv=none; b=fGZ9i7u5yO1cEBIkE7euTJHF38wMsjOsgKAN5vg7oRlsCLUukVpvG9FmJzrlCW7MhAMXDZqAw71E/uAulVs02L8j6CJELaCjSmpjwAUQFWTxgJ7q6OE6n2ls1OGozrruA2kz+q0rCKjqcfropZXWxtjwCVfpZkPejvyEwoqrE10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743553117; c=relaxed/simple;
	bh=V3qJk+ThYKNoDXM7IjDAmGSrHmw4IjEnzkLDri6Ldvc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jBwnbcb3asOL6S9zjdZoEeqyR13zs2smkTcp5ojX8rt7vfU8z8UkQ+VcaAxXArubXfd1QOsXGlFLPeFT+fJpofwac0z88Ycz2AP0T9xZ1Y38dougdHzQg1c0PQhfZ9hThuFcN9uN+3oY8cqEA1N+Vk2/P2fVEOLeq8SNelbx56g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=SkuismLY; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AD6AE6A2;
	Wed,  2 Apr 2025 02:16:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743553000;
	bh=V3qJk+ThYKNoDXM7IjDAmGSrHmw4IjEnzkLDri6Ldvc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkuismLYLHOuNjD6so1SaFLJyhBwsuC8eeo++le6sbXpn/J/xQHVL9fPK3mjhePLO
	 PoEXFWg0n2G+O3e83yYEdPJZym69LiQNJNG8Yd/9MTZfLUB0jEHQfSA5Mol10FJINm
	 G1UvaJsLxaXhNXOTYHeoEWejUwzt3QkozE59I53Q=
Date: Wed, 2 Apr 2025 03:18:09 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Pratap Nirujogi <pratap.nirujogi@amd.com>, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, hverkuil@xs4all.nl,
	dave.stevenson@raspberrypi.com, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, benjamin.chan@amd.com, bin.du@amd.com,
	gjorgji.rosikopulos@amd.com, king.li@amd.com,
	dominic.antony@amd.com
Subject: Re: [PATCH] media: i2c: Add OV05C camera sensor driver
Message-ID: <20250402001809.GB4845@pendragon.ideasonboard.com>
References: <20250228165317.3468075-1-pratap.nirujogi@amd.com>
 <20250228173556.GB14076@pendragon.ideasonboard.com>
 <844a1936-572b-476a-9cab-8797c7da2040@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <844a1936-572b-476a-9cab-8797c7da2040@amd.com>

Hello Pratap,

On Fri, Mar 28, 2025 at 06:10:41PM -0400, Nirujogi, Pratap wrote:
> Hi Laurent,
> 
> Thanks for reviewing and extremely sorry for the delayed response. We 
> have submitted V2 patch based on your review feedback.
> 
> Can you please help to review latest V2 patch and let us know your feedback.

Sure. It will take a bit of time though, as my review backlog is big.
Please see below for additional comments.

> On 2/28/2025 12:35 PM, Laurent Pinchart wrote:
> > 
> > Hi Pratap,
> > 
> > Thank you for the patch.
> > 
> > A few assorted comments to start with, I'll try to do a more in-depth
> > review later.
> > 
> > On Fri, Feb 28, 2025 at 11:53:12AM -0500, Pratap Nirujogi wrote:
> >> Add driver for OmniVision 5.2M OV05C10 sensor. This driver
> >> supports only the full size normal 2888x1808@30fps 2-lane
> >> sensor profile.
> > 
> > What have you tested this driver with ? I see no OF device ID or ACPI
> > device ID.
> 
> We have tested this driver on the "AMD RYZEN AI MAX PRO 385 w/ Radeon 
> 8050S" target supporting ISP HW v4.1. OMNI5C10 is ACPI HID for this 
> sensor on the target.

That's interesting. Do you have plans to post a driver for the ISP ?

> > Please provide a v4l2-compliance report.
> 
> Please refer the attached screenshot for the v4l2-compliance test 
> report. This test is ran with V2 patch. Fixed some of the compliance 
> test failures on V1 and ensured it is 100% compliant for the supported 
> IOCTLS.

Could you please post the v4l2-compliance report in a reply to v2, in
text format instead of a screenshot ?

> >> Signed-off-by: Pratap Nirujogi <pratap.nirujogi@amd.com>
> >> ---
> >>   drivers/media/i2c/Kconfig  |   10 +
> >>   drivers/media/i2c/Makefile |    1 +
> >>   drivers/media/i2c/ov05c.c  | 1031 ++++++++++++++++++++++++++++++++++++

[snip]

-- 
Regards,

Laurent Pinchart

