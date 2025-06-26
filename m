Return-Path: <linux-media+bounces-35953-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 693F6AE9D65
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 14:23:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD9813BA479
	for <lists+linux-media@lfdr.de>; Thu, 26 Jun 2025 12:23:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF52267721;
	Thu, 26 Jun 2025 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="X0G77clW"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45FDB1AC88B;
	Thu, 26 Jun 2025 12:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750940614; cv=none; b=dg8XiN5CbMenLhjmel/ftHB2Cr2I3PiShqhV3mZd5UJnqCURZVtpmxJD7K8DAvrJNLE/RRqQNVZMub4+iJhxFzGU5IXlTUO3u7qmoal8WfIvo/kyNPsc6BjMIx/nweGetqWRATyAwMPzJBUCVpTqMOoKemICD1YnZH/6Ul4UyFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750940614; c=relaxed/simple;
	bh=2Sp612tDVYuV219ldRTTsYX/6nrY446brBlysdIfi18=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lxs3AguMsXhueJCdOjPG/nk43JeWh0kcNkdN91UJ+dPO0yHz4uZcJs7TvyX7lEcbg13STVxgcNgWNHTI9KmA8ig8Si6gZjaZc1stosIoB3OwVZyvUy+6btJdfoxZQXxlB6N0xy3f4QI5b/IwKp295hCaDxk088GLh48mXwidDsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=X0G77clW; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (85-76-34-12-nat.elisa-mobile.fi [85.76.34.12])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BF601743;
	Thu, 26 Jun 2025 14:23:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1750940592;
	bh=2Sp612tDVYuV219ldRTTsYX/6nrY446brBlysdIfi18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X0G77clWrsCFjg9iK/S3+x8qiTuEozvvB7bvzHFYmhhis9l2CWAQeVWBbeUqTEmLr
	 u7sBl14zs24/9O1pYQjioPNuQiGi4tsX0IonQ7+d6YMkr3O5++6YOkB0RnoMNraoBj
	 AMXevJ72CsxSimktvoJA4YcHg6aTY/lgYA/yRSrA=
Date: Thu, 26 Jun 2025 15:23:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: "Nirujogi, Pratap" <pnirujog@amd.com>,
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
Message-ID: <20250626122306.GI8738@pendragon.ideasonboard.com>
References: <20250609194321.1611419-1-pratap.nirujogi@amd.com>
 <6a49eb11-d434-4315-8ee9-0f8aa7347de2@intel.com>
 <aEygCdk-zEqRwfoF@kekkonen.localdomain>
 <3e8364e8-22e4-42ad-a0f0-017f86fd6bf9@amd.com>
 <20250623120929.GE826@pendragon.ideasonboard.com>
 <aFlU-E_GCHWBXErq@kekkonen.localdomain>
 <20250623134200.GB29597@pendragon.ideasonboard.com>
 <b6425dbe-44e6-47b4-a06b-b9a172a8cac4@amd.com>
 <fb719113-513f-44d9-82ae-63ff6aaca142@amd.com>
 <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <175093628786.4005407.10292502794888309807@ping.linuxembedded.co.uk>

On Thu, Jun 26, 2025 at 12:11:27PM +0100, Kieran Bingham wrote:
> Quoting Nirujogi, Pratap (2025-06-25 23:06:01)
> > Hi Sakari, Hi Laurent,
> > 
> > On 6/23/2025 5:55 PM, Nirujogi, Pratap wrote:
> > [...]
> > >>>> I think it can live in the driver for now. Given that the device uses
> > >>>> only 8 bits of register address, I would store the page number in bits
> > >>>> 15:8 instead of bits 31:24, as the CCI helpers do not make bits 27:24
> > >>>> available for driver-specific purpose.
> > >>>
> > >>> I'd use the CCI private bits, the driver uses page numbers up to 4 so 4
> > >>> bits are plenty for that. If we add pages to CCI later, this may be
> > >>> refactored then.
> > >>
> > >> That works too.
> > >>
> > > Thanks for your support. We will add the page number in the register 
> > > address 15:8 or 11:8 and will update the implementation accordingly in 
> > > the next version.
> > > 
> > I would like to share the approach we are taking to implement the CCI 
> > helpers that support page value. Could you please review the steps and 
> > let us know if they make sense or if any adjustments are needed?
> > 
> > 1: Add new macros to embed page value into the register address.
> > 
> > Ex:
> > #define CCI_PAGE_REG8(x, p)             ((1 << CCI_REG_WIDTH_SHIFT) | (p << 
> > CCI_REG_PRIVATE_SHIFT) | (x))
> > #define CCI_PAGE_REG16(x, p)            ((2 << CCI_REG_WIDTH_SHIFT) | (p << 
> > CCI_REG_PRIVATE_SHIFT) | (x))
> > 
> > 2: Create V4L2 CCI context. Initialize page control reg, current_page, 
> > regmap etc.
> > 
> > Ex:
> > struct v4l2_cci_ctx {
> >         struct mutex lock;
> >         struct regmap *map;
> >         s16 current_page;
> >         u8 page_ctrl_reg;
> > }
> > 
> > 3: Introduce new CCI helpers - cci_pwrite() and cci_pread() to handle 
> > register read-writes updating the page control register as necessary.
> 
> Out of curiosity - but couldn't the existing cci_write and cci_read
> already be used by the users - and then the default behaviour is that
> the page isn't modified if there is no page_ctrl_reg - and by default
> CCI_REG() will simply have (initilised) as page 0 - so the pages will
> never change on those calls?
> 
> Then the users can indeed define
> 
> #define TEST_PATTERN_PAGE 5
> #define TEST_PATTERN_COLOUR_BARS BIT(3)
> 
> #define MY_TEST_PATTERN_REG CCI_PAGE_REG8(0x33, TEST_PATTERN_PAGE)
> 
> and can call 
>  cci_write(regmap, MY_TEST_PATTERN_REG, TEST_PATTERN_COLOUR_BARS, &ret);
> 
> with everything handled transparently ?
> 
> 
> Or do you envisage more complications with the types of pages that might
> be supportable ?
> 
> (I perfectly understand if I'm wishing for an unreachable utopia -
> because I haven't considered something implicit about the page handling
> that I haven't yet used :D)

I don't think we should implement page support in the CCI helpers
themselves yet. We have too few drivers to look at to understand the
requirements. Instead, I would store the page number in the driver
private bits of the 32-bit address (that's bits 31:28), and add wrappers
around cci_read() and cci_write() to the OV05C10 driver that handles the
page configuration.

Once we'll have multiple drivers doing the same, it will be easier to
see what requirements they share, and move the feature to the CCI
helpers.

> > int cci_pwrite(void *data, u32 reg, u64 val, int *err)
> > {
> >         /* get v4l2_cci_ctx context from data */
> > 
> >         /* get page value from reg */
> > 
> >         /* acquire mutex */
> > 
> >         /* update cci page control reg, save current page value */
> >         
> >         /* do cci_write */
> > 
> >         /* release mutex */
> > }
> > 
> > Similar steps for cci_pread() as well.

-- 
Regards,

Laurent Pinchart

