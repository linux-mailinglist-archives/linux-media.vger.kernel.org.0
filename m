Return-Path: <linux-media+bounces-30706-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD0CA96825
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 13:49:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15DA21891B4F
	for <lists+linux-media@lfdr.de>; Tue, 22 Apr 2025 11:50:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1FA027C167;
	Tue, 22 Apr 2025 11:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MzeAC7KC"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDF46151985
	for <linux-media@vger.kernel.org>; Tue, 22 Apr 2025 11:49:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322584; cv=none; b=DcJ5yz6CMaDdaWMblcu3u5c4MNYIzBPlHKnNUWqgzfHvWxvhFM0Z6Ase37kL+isfMGDbaDjQTw/oAOoavQFZAHYtXlESMKc7eU06pQsNBqfPhFiwH634iQuZPF8oMl/uSEZIJqMKuc9pQRlpB16NHUWRlhr0EpND3b9gTiuTC/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322584; c=relaxed/simple;
	bh=zp35Db8hrli5A4VH7n0tZUsJUvvA8zcY7K5l9bpqyb8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EgcpHeYsc4RnBh43KJ5QKXI809IXGEZvFX5z/MBOhlJMwM3jgW4dVIc9jJtDgtMzSSR+S+9XDWEgNZ5P+kXlk7mBEaNa//3vcZMLcsMBVYKpBQhcMErSRdVychYN0gWQPx7gat6byMv9bUkjG5fYJjXW7Fvjz4m9LBGKp5Knc/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MzeAC7KC; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745322582; x=1776858582;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zp35Db8hrli5A4VH7n0tZUsJUvvA8zcY7K5l9bpqyb8=;
  b=MzeAC7KChjsXz9RKCGGJTKDSwAebDpn1+iLb6V98bn0XfEZk+N+/f6sW
   BnXr8hYKfuIejky6m2u88mly10H3qKdK9a0fkmM4/XtaG2A3CAh/82r2J
   AFWTZayK4r/RgjzRUB12AFsd9wtUKEhbsG3fU6P/ZKUfXdTAjcJiYVAgZ
   HGsZ0c+QwZlogL07YOweB5eP65zf+pmlKd6ZP13bM87oV9ZEI+zn7tr6a
   9iRqFi6TeEtx82agHzbRv6U0wQoB+K7MzOQFUIuMKmi4hDaDhinFkIjIe
   GRIWw9cy2sxW/qdVI+ERS0FKF9w1i0QsO5w8nkh+qZE7MGJnReknPNh5Q
   g==;
X-CSE-ConnectionGUID: 2GNa2p7nSO+NipDpf7RfMA==
X-CSE-MsgGUID: zdbzOClESYmLdjoSZ8wZxQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11410"; a="57064896"
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="57064896"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 04:49:42 -0700
X-CSE-ConnectionGUID: dcax7IPBSa64CD4exHgwQw==
X-CSE-MsgGUID: BWMMrvqqSZ6G/0Z5mZrfTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,230,1739865600"; 
   d="scan'208";a="137085652"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2025 04:49:41 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7818B11F853;
	Tue, 22 Apr 2025 14:49:38 +0300 (EEST)
Date: Tue, 22 Apr 2025 11:49:38 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dongcheng.yan@intel.com
Subject: Re: [PATCH v2 11/11] media: ccs-pll: Document the CCS PLL flags
Message-ID: <aAeCUpgK8htNehcf@kekkonen.localdomain>
References: <20250417065354.311617-1-sakari.ailus@linux.intel.com>
 <20250417065354.311617-12-sakari.ailus@linux.intel.com>
 <20250421202921.GL17813@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421202921.GL17813@pendragon.ideasonboard.com>

Hi Laurent,

On Mon, Apr 21, 2025 at 11:29:21PM +0300, Laurent Pinchart wrote:
> Hi Sakari,
> 
> Thank you for the patch.
> 
> On Thu, Apr 17, 2025 at 09:53:54AM +0300, Sakari Ailus wrote:
> > Document the CCS PLL flags with short comments. The CCS spec has more
> > information on them while the added documentation helps finding the
> > relevant information in the CCS spec.
> 
> Oohhhh, documentation, that's nice :-)
> 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  drivers/media/i2c/ccs-pll.h | 27 ++++++++++++++++++++++++---
> >  1 file changed, 24 insertions(+), 3 deletions(-)
> > 
> > diff --git a/drivers/media/i2c/ccs-pll.h b/drivers/media/i2c/ccs-pll.h
> > index e8297db45460..6e503fe2d591 100644
> > --- a/drivers/media/i2c/ccs-pll.h
> > +++ b/drivers/media/i2c/ccs-pll.h
> > @@ -18,19 +18,40 @@
> >  #define CCS_PLL_BUS_TYPE_CSI2_DPHY				0x00
> >  #define CCS_PLL_BUS_TYPE_CSI2_CPHY				0x01
> >  
> > -/* Old SMIA and implementation specific flags */
> > -/* op pix clock is for all lanes in total normally */
> > +/* Old SMIA and implementation specific flags. */
> > +/* OP PIX clock is for all lanes in total normally. */
> >  #define CCS_PLL_FLAG_OP_PIX_CLOCK_PER_LANE			BIT(0)
> > -#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> > +
> >  /* CCS PLL flags */
> > +
> > +/* The sensor doesn't have OP clocks at all. */
> > +#define CCS_PLL_FLAG_NO_OP_CLOCKS				BIT(1)
> > +/* System speed model if this flag is unset. */
> >  #define CCS_PLL_FLAG_LANE_SPEED_MODEL				BIT(2)
> > +/* If set, the pre-PLL divider may have odd values, too. */
> >  #define CCS_PLL_FLAG_EXT_IP_PLL_DIVIDER				BIT(4)
> > +/*
> > + * If set, the OP PIX clock doesn't have to exactly match with data rate, it may
> > + * be higher. See "OP Domain Formulas" in MIPI CCS 1.1 spec.
> > + */
> >  #define CCS_PLL_FLAG_FLEXIBLE_OP_PIX_CLK_DIV			BIT(5)
> > +/* If set, the VT domain may run faster than the OP domain. */
> >  #define CCS_PLL_FLAG_FIFO_DERATING				BIT(6)
> > +/* If set, the VT domain may run slower than the OP domain. */
> >  #define CCS_PLL_FLAG_FIFO_OVERRATING				BIT(7)
> > +/* If set, the PLL tree has two PLLs instead of one. */
> >  #define CCS_PLL_FLAG_DUAL_PLL					BIT(8)
> > +/*
> > + * If set, the OP SYS clock is a dual data rate clock, transferring two bits per
> > + * cycle instead of one.
> > + */
> >  #define CCS_PLL_FLAG_OP_SYS_DDR					BIT(9)
> > +/*
> > + * If set, the OP PIX clock is a dual data rate clock, transferring two bits per
> > + * cycle instead of one.
> 
> Should this be "two pixels per cycle" ?

Good catch. I'll fix that for v3.

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you!

> 
> > + */
> >  #define CCS_PLL_FLAG_OP_PIX_DDR					BIT(10)
> > +/* If set, the PLL multipliers are required to be even. */
> >  #define CCS_PLL_FLAG_EVEN_PLL_MULTIPLIER			BIT(11)
> >  
> >  /**
> 

-- 
Kind regards,

Sakari Ailus

