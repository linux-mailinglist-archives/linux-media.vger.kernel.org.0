Return-Path: <linux-media+bounces-21626-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC629D3820
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 11:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ACA99285063
	for <lists+linux-media@lfdr.de>; Wed, 20 Nov 2024 10:18:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F04919F108;
	Wed, 20 Nov 2024 10:18:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ejpY6x6K"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5765B198E69;
	Wed, 20 Nov 2024 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732097907; cv=none; b=qXXXwF2q64MxCZo+2WN94HmB52rYtaNji8ngVFiNnwQEbeGusLe1VCgQ39twLc+ymfOuD9fqnK0CdXVKS9+bo6zywpkf0Xq7moh4mHOdzFPTCbQykbme95U5jHJ/AFi+h5DlQvcU3VphAazCtaE8U0edtygtv7k48Ucq5DRzUPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732097907; c=relaxed/simple;
	bh=uk7U3tS0/FmlL20TAwVmjFTAWbLGcMQYU5eHebmdlHw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dJbA8YQwtRPO6mgaPBqU+uBSbpV7QOsbqtBBJJK5Q19x/uEnDV6ydO4PnZ5Ryvj94uhu5O4Ss+ngLhGZUGPjJD1KVO8CctRRAVVy+JSQH/Ei00BPNBPpv9Tx7Ps8kYFFOB3LV5ZP6yaLWhbpxHTFIe1hK5b9aPilF2C6om6hLh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ejpY6x6K; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732097905; x=1763633905;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=uk7U3tS0/FmlL20TAwVmjFTAWbLGcMQYU5eHebmdlHw=;
  b=ejpY6x6Kvo0LeSSTmDjvHOx0qZ7xJlEN5wJqp0ke8h2idgS0dkjBfcFp
   VIG31Ll5cXE9AHUxzRqIJEWYbu9EHPICQ8LIry2V4LlGne+6YNcb3BQj+
   83967UCFILdz2IMF+vfGQGmELVeXEmFCd21ywskW7yIZYD9ol2wkRa30O
   84YYms431jSF9Fed9eTW2gxqtuyEx6ELl3jpnu30U8HCx6y/UNIvK3pHz
   QiP6YVizkdIPp9fyshOtnerPPzto6ocKbz34KQD6Hts1/UsumS6jgZhfK
   v+x5d8DB66NHpGFMcnvPV5YnWJdBJxcyaSGJdtX9rqHAKaOw4MFzcLfYL
   g==;
X-CSE-ConnectionGUID: N1/6DgsESQ67BUVIWc9hQQ==
X-CSE-MsgGUID: XvwOh9eeSzijqfIsedPk8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11261"; a="49676105"
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="49676105"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:18:25 -0800
X-CSE-ConnectionGUID: MZSTaxwIS5iSOxOM6e10xw==
X-CSE-MsgGUID: o+QlY7n+R2+coTKEzNPDrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,169,1728975600"; 
   d="scan'208";a="89981474"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2024 02:18:23 -0800
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id 593B211F89A;
	Wed, 20 Nov 2024 12:18:19 +0200 (EET)
Date: Wed, 20 Nov 2024 10:18:19 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/4] media: v4l: fwnode: Parse MiPI DisCo for C-PHY
 line-orders
Message-ID: <Zz23a2GyW13rpyW2@kekkonen.localdomain>
References: <20241119221249.539610-1-niklas.soderlund+renesas@ragnatech.se>
 <20241119221249.539610-3-niklas.soderlund+renesas@ragnatech.se>
 <Zz2Zgvjm21iv-qtc@kekkonen.localdomain>
 <20241120095030.GT5315@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241120095030.GT5315@ragnatech.se>

Hejssan, Niklas!

On Wed, Nov 20, 2024 at 10:50:30AM +0100, Niklas Söderlund wrote:
> Hello Sakari,
> 
> On 2024-11-20 08:10:42 +0000, Sakari Ailus wrote:
> > Hejssan,
> > 
> > On Tue, Nov 19, 2024 at 11:12:47PM +0100, Niklas Söderlund wrote:
> > > Extend the fwnode parsing to validate and fill in the CSI-2 C-PHY
> > > line-orders order properties as defined in MIPI Discovery and
> > > Configuration (DisCo) Specification for Imaging.
> > > 
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > ---
> > >  drivers/media/v4l2-core/v4l2-fwnode.c | 56 ++++++++++++++++++++++++++-
> > >  include/media/v4l2-mediabus.h         | 21 ++++++++++
> > >  2 files changed, 76 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/media/v4l2-core/v4l2-fwnode.c b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > index f19c8adf2c61..b8b2b7fb685e 100644
> > > --- a/drivers/media/v4l2-core/v4l2-fwnode.c
> > > +++ b/drivers/media/v4l2-core/v4l2-fwnode.c
> > > @@ -127,7 +127,7 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> > >  {
> > >  	struct v4l2_mbus_config_mipi_csi2 *bus = &vep->bus.mipi_csi2;
> > >  	bool have_clk_lane = false, have_data_lanes = false,
> > > -		have_lane_polarities = false;
> > > +		have_lane_polarities = false, have_line_orders = false;
> > >  	unsigned int flags = 0, lanes_used = 0;
> > >  	u32 array[1 + V4L2_MBUS_CSI2_MAX_DATA_LANES];
> > >  	u32 clock_lane = 0;
> > > @@ -197,6 +197,17 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> > >  		have_lane_polarities = true;
> > >  	}
> > >  
> > > +	rval = fwnode_property_count_u32(fwnode, "line-orders");
> > > +	if (rval > 0) {
> > > +		if (rval != num_data_lanes) {
> > > +			pr_warn("invalid number of line-orders entries (need %u, got %u)\n",
> > > +				num_data_lanes, rval);
> > > +			return -EINVAL;
> > > +		}
> > > +
> > > +		have_line_orders = true;
> > > +	}
> > > +
> > >  	if (!fwnode_property_read_u32(fwnode, "clock-lanes", &v)) {
> > >  		clock_lane = v;
> > >  		pr_debug("clock lane position %u\n", v);
> > > @@ -250,6 +261,49 @@ static int v4l2_fwnode_endpoint_parse_csi2_bus(struct fwnode_handle *fwnode,
> > >  		} else {
> > >  			pr_debug("no lane polarities defined, assuming not inverted\n");
> > >  		}
> > > +
> > > +		if (have_line_orders) {
> > > +			fwnode_property_read_u32_array(fwnode,
> > > +						       "line-orders", array,
> > > +						       num_data_lanes);
> > > +
> > > +			for (i = 0; i < num_data_lanes; i++) {
> > > +				const char *order;
> > > +
> > > +				switch (array[i]) {
> > > +				case 0:
> > > +					order = "ABC";
> > > +					break;
> > > +				case 1:
> > > +					order = "ACB";
> > > +					break;
> > > +				case 2:
> > > +					order = "BAC";
> > > +					break;
> > > +				case 3:
> > > +					order = "BCA";
> > > +					break;
> > > +				case 4:
> > > +					order = "CAB";
> > > +					break;
> > > +				case 5:
> > > +					order = "CBA";
> > > +					break;
> > 
> > Please use an array instead.
> > 
> > > +				default:
> > > +					pr_warn("lane %u invalid line-order assuming ABC (got %u)\n",
> > > +						i, array[i]);
> > > +					bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> > > +					continue;
> > > +				}
> > > +				bus->line_orders[i] = array[i];
> > > +				pr_debug("lane %u line order %s", i, order);
> > > +			}
> > > +		} else {
> > > +			for (i = 0; i < num_data_lanes; i++)
> > > +				bus->line_orders[i] = V4L2_MBUS_CSI2_CPHY_LINE_ORDER_ABC;
> > 
> > A few lines could be wrapped above.
> 
> I'm not sure I understand this comment. Do you mean I could loop over 
> num_data_lanes and initialize all lines to ABC before checking 
> have_line_orders and that way avoid having to loop here and set the 
> default ABC if we are out-of bounds in the switch?

No, just that you'd wrap lines that are over 80 characters per line, unless
there's some tangible reason to have them like that.

-- 
Med vänliga hälsningar,

Sakari Ailus

