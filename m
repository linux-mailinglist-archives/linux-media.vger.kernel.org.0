Return-Path: <linux-media+bounces-36034-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E273AEA5E7
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 20:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC5843AC25D
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 18:56:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1A0A62EF2AC;
	Thu, 26 Jun 2025 18:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Yi0wCG64"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16F925DCFD;
	Thu, 26 Jun 2025 18:57:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750964235; cv=none; b=ht+tcZxt1orai0GynP9VTDrMWggTJly8joM33tEvXBA9kDp3OCtus51Vjl8nCTapSdC2XOZMc3jd0GSn8ZryWd/TpqROJ9qUhu+VxqeAwJPqolAb0TG248Wr02sg5x4FixI33ufqYONnEAOzw31LMPZcVs6tL+vUTKQzvgQgFtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750964235; c=relaxed/simple;
	bh=bk55FtLcKBLVsT9duDH+a/KEX21YAQREvsFIrViRJ3E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cAdz+uOPGu1hvI7vLw5sld6KZedbOAUjjb5J9kKqIi53r8QKr70OWq89KNi7iKGBPOwIRh9DMHNFsiNqKxhUccQFIGJPAHW/E1LkitMsi8n0cnwlEQKpcSFarANMwQxJ34Ee50lTnS1GuOnJTPvBPbHn5QKwQ5dmrsFLXxxiVlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=Yi0wCG64; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 05FBA6BE;
	Thu, 26 Jun 2025 20:56:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750964212;
	bh=bk55FtLcKBLVsT9duDH+a/KEX21YAQREvsFIrViRJ3E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Yi0wCG64qpShubFyg0hVQxW1c8/20grFYIF++ClhE+PjheDM95hwJrooLbZ94pLz5
	 U8PGHSgR7evtEveR6zbC39rDKuQZM0w7AaC1qs9G1WUtGP9nchqibIexwZcdHBtdcm
	 xFr2d4qnWVvjwD8Vhi1IFVIJ3Ksknm5h706RRVTo=
Date: Thu, 26 Jun 2025 21:56:47 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Nirujogi, Pratap" <pnirujog@amd.com>
Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>,
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
Message-ID: <20250626185647.GA30016@pendragon.ideasonboard.com>
References: <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
 <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
 <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
 <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
 <20250626122306.GI8738@pendragon.ideasonboard.com>
 <f59e0cdd-e41a-4865-8f11-9508b598e6b7@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <f59e0cdd-e41a-4865-8f11-9508b598e6b7@amd.com>

On Thu, Jun 26, 2025 at 02:22:00PM -0400, Nirujogi, Pratap wrote:
> On 6/26/2025 8:23 AM, Laurent Pinchart wrote:
> > On Thu, Jun 26, 2025 at 12:11:27PM +0100, Kieran Bingham wrote:
> >> Quoting Nirujogi, Pratap (2025-06-25 23:06:01)
> >>> Hi Sakari, Hi Laurent,
> >>>
> >>> On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
> >>> [...]
> >>>>>>> I think it can live in the driver for now. Given that the device uses
> >>>>>>> only 8 bits of register address, I would store the page number in bits
> >>>>>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
> >>>>>>> available for driver-specific purpose.
> >>>>>>
> >>>>>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
> >>>>>> bits are plenty for that. If we add pages to CCI later, this may be
> >>>>>> refactored then.
> >>>>>
> >>>>> That works too.
> >>>>>
> >>>> Thanks for your support. We will add the page number in the register
> >>>> address 15:8 or 11:8 and will update the implementation accordingly in
> >>>> the next version.
> >>>>
> >>> I would like to share the approach we are taking to implement the CCI
> >>> helpers that support page value. Could you please review the steps and
> >>> let us know if they make sense or if any adjustments are needed?
> >>>
> >>> 1: Add new macros to embed page value into the register address.
> >>>
> >>> Ex:
> >>> #define CCI_PAGE_REG8(x, p)             ((1 << CCI_REG_WIDTH_SHIFT) | (p <<
> >>> CCI_REG_PRIVATE_SHIFT) | (x))
> >>> #define CCI_PAGE_REG16(x, p)            ((2 << CCI_REG_WIDTH_SHIFT) | (p <<
> >>> CCI_REG_PRIVATE_SHIFT) | (x))
> >>>
> >>> 2: Create V4L2 CCI context. Initialize page control reg, current_page,
> >>> regmap etc.
> >>>
> >>> Ex:
> >>> struct v4l2_cci_ctx {
> >>>          struct mutex lock;
> >>>          struct regmap *map;
> >>>          s16 current_page;
> >>>          u8 page_ctrl_reg;
> >>> }
> >>>
> >>> 3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle
> >>> register read-writes updating the page control register as necessary.
> >>
> >> Out of curiosity - but couldn't the existing cci_write and cci_read
> >> already be used by the users - and then the default behaviour is that
> >> the page isn't modified if there is no page_ctrl_reg - and by default
> >> CCI_REG() will simply have (initilised) as page 0 - so the pages will
> >> never change on those calls?
> >>
> >> Then the users can indeed define
> >>
> >> #define TEST_PATTERN_PAGE 5
> >> #define TEST_PATTERN_COLOUR_BARS BIT(3)
> >>
> >> #define MY_TEST_PATTERN_REG CCI_PAGE_REG8(0x33, TEST_PATTERN_PAGE)
> >>
> >> and can call
> >>   cci_write(regmap, MY_TEST_PATTERN_REG, TEST_PATTERN_COLOUR_BARS, &ret);
> >>
> >> with everything handled transparently ?
> >>
> >>
> >> Or do you envisage more complications with the types of pages that might
> >> be supportable ?
> >>
> >> (I perfectly understand if I'm wishing for an unreachable utopia -
> >> because I haven't considered something implicit about the page handling
> >> that I haven't yet used :D)
> > 
> > I don't think we should implement page support in the CCI helpers
> > themselves yet. We have too few drivers to look at to understand the
> > requirements. Instead, I would store the page number in the driver
> > private bits of the 32-bit address (that's bits 31:28), and add wrappers
> > around cci_read() and cci_write() to the OV05C10 driver that handles the
> > page configuration.
> > 
> > Once we'll have multiple drivers doing the same, it will be easier to
> > see what requirements they share, and move the feature to the CCI
> > helpers.
> 
> Thanks for clarifying. I agree it would be simple and safer approach too 
> to handle this way. We will add the following macros in v4l2-cci.h and 

Please add the macros to the driver instead, not to v4l2-cci.h. Once
multiple drivers will implement a similar mechanism we can study how to
generalize it.

> update the existing wrappers ov05c10_reg_write() / ov05c10_reg_read() in 
> the driver to retrieve the page and register values to call cci_write() 
> / cci_read(). We will add new wrappers too wherever necessary in the 
> driver (ex: wrapper for cci_multi_reg_write() on replacing CCI_REG8 with 
> CCI_PAGE_REG8)
> 
> #define CCI_PAGE_REG8(x, p)		((1 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG16(x, p)		((2 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG24(x, p)		((3 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG32(x, p)		((4 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG64(x, p)		((8 << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG16_LE(x, p)		(CCI_REG_LE | (2U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG24_LE(x, p)		(CCI_REG_LE | (3U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG32_LE(x, p)		(CCI_REG_LE | (4U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_REG64_LE(x, p)		(CCI_REG_LE | (8U << CCI_REG_WIDTH_SHIFT) | (p << CCI_REG_PAGE_SHIFT) | (x))
> #define CCI_PAGE_GET(x)			FIELD_GET(CCI_REG_PAGE_MASK, x)
> 
> >>> int cci_pwrite(void *data, u32 reg, u64 val, int *err)
> >>> {
> >>>          /* get v4l2_cci_ctx context from data */
> >>>
> >>>          /* get page value from reg */
> >>>
> >>>          /* acquire mutex */
> >>>
> >>>          /* update cci page control reg, save current page value */
> >>>
> >>>          /* do cci_write */
> >>>
> >>>          /* release mutex */
> >>> }
> >>>
> >>> Similar steps for cci_pread() as well.

-- 
Regards,

Laurent Pinchart

