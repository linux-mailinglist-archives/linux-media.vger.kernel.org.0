Return-Path: <linux-media+bounces-37468-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 38ECCB01888
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 11:44:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7C742173E87
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 09:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B1DCA23535C;
	Fri, 11 Jul 2025 09:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K3opS3PK"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A4DB263F47;
	Fri, 11 Jul 2025 09:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752227063; cv=none; b=ceoBDZZORN6HbVyX4hNwamxn6YocKTOR4LdUbVpj/nfpXBLd2sQfIiRadl8ZSMhjO0kIQbTrmKKhCiwQs+n1LtEMoTQDq/3BHk/WvLZcm9JjFNnGvDek9cL9op+hXhXdi7/isvG2d4KYelLM0Twgkfa3glKb548HJ5VvKTti8AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752227063; c=relaxed/simple;
	bh=GKKmdOgnJh4Ado9EmPiRgR7KQVoIOMeQ1qdpk8GPHNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lb/6h9dLc2uGPBDMsiHZis8eJC9da6an0K0+SwBDhedjLXCmWQKasFrPKRbrstJj6J3TAeJqBJCERHEQPtlq9+MLvGDLMVqMFIAngU1/HUE3+KFeolJmyeLCWkU8mRzhhxECnk9jq1Z3NEY4bvTxG9xiXDcwCmtpbV4LdOb7Sp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K3opS3PK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752227061; x=1783763061;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GKKmdOgnJh4Ado9EmPiRgR7KQVoIOMeQ1qdpk8GPHNU=;
  b=K3opS3PK6QUFj3XYDJp+evlJJ/dna3NaoThCK4s8yYdFCCJbMJuxI2nD
   ObwbkNIJrYDZ3Rrk+u8NMWuqS2l1G5btXv26xUEx48+H9vQl5C2tfVZ34
   0b7GTSbFGpd6cwVklTRO2UQHI/ry7TmXgH1gkcw4Up+BoFoOnZZ7Xlfvm
   aloO768d7Va9t8QsfPIY48rem0kH1jnob3tdIu+JRreKB36XrB6/J3QwD
   ZZP+/Y8jBtnAhjhAQakF965w/f/lq4DGh+zOfL1JwVH1aIEl6c/fEF8bI
   VPBblVdB6QPb3Zn7ueAi1W5UwALaeYARUr1si1f7mbDr/YcWsO5eqwAo0
   w==;
X-CSE-ConnectionGUID: jYmOfYJbTXeDmxQ8ZRICzQ==
X-CSE-MsgGUID: dDbTGyjYRzKblwaN1/b66w==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54609643"
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="54609643"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 02:44:20 -0700
X-CSE-ConnectionGUID: YQRDBvTIQL66JQwetVKbRg==
X-CSE-MsgGUID: 1gc3XEwuQW2VX85AjuwZpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,303,1744095600"; 
   d="scan'208";a="157052337"
Received: from ettammin-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.248])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2025 02:44:18 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 299E11206A0;
	Fri, 11 Jul 2025 12:44:15 +0300 (EEST)
Date: Fri, 11 Jul 2025 09:44:15 +0000
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Hans Verkuil <hverkuil@xs4all.nl>, Arnd Bergmann <arnd@arndb.de>,
	Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging/ipu7: avoid division by 64-bit value
Message-ID: <aHDc72x6HxGhYDys@kekkonen.localdomain>
References: <20250709145710.102669-1-arnd@kernel.org>
 <20250711092329.74e52573@pumpkin>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250711092329.74e52573@pumpkin>

Hi David,

On Fri, Jul 11, 2025 at 09:23:29AM +0100, David Laight wrote:
> On Wed,  9 Jul 2025 16:56:56 +0200
> Arnd Bergmann <arnd@kernel.org> wrote:
> 
> > From: Arnd Bergmann <arnd@arndb.de>
> > 
> > On 32-bit targets, this causes a link failure:
> > 
> > x86_64-linux-ld: drivers/staging/media/ipu7/ipu7-isys-csi-phy.o: in function `ipu7_isys_phy_config':
> > ipu7-isys-csi-phy.c:(.text+0x1509): undefined reference to `__udivdi3'
> > 
> > Note that this does not divide a 64-bit number by a 32-bit one as usual,
> > but the other way round, which is something that the compiler should
> > really be able to figure out but does not (as of gcc-15).
> > 
> > A few lines higher, a similar division is done using the incorrect div_u64()
> > that truncates the 64-bit divisor to 32 bits.
> > 
> > Change both to use the safe but slow div64_u64() helper.
> > 
> > Fixes: a516d36bdc3d ("media: staging/ipu7: add IPU7 input system device driver")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/staging/media/ipu7/ipu7-isys-csi-phy.c | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> > index 4407750c7f40..b8c5db7ae300 100644
> > --- a/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> > +++ b/drivers/staging/media/ipu7/ipu7-isys-csi-phy.c
> > @@ -734,6 +734,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
> >  	u16 reg;
> >  	u16 val;
> >  	u32 i;
> > +	u64 r64;
> >  	u32 r;
> >  
> >  	if (is_ipu7p5(isys->adev->isp->hw_ver))
> > @@ -806,8 +807,8 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
> >  		dwc_phy_write_mask(isys, id, reg, 2, 0, 2);
> >  	}
> >  
> > -	deass_thresh = (u16)div_u64_rem(7 * 1000 * 6, mbps * 5U, &r) + 1;
> > -	if (r != 0)
> > +	deass_thresh = (u16)div64_u64_rem(7 * 1000 * 6, mbps * 5U, &r64) + 1;
> > +	if (r64 != 0)
> >  		deass_thresh++;
> 
> While 'mbps' is presumably u64, it can't be big.
> So this can just be:
> 	deass_threas = roundup(7 * 1000 * 6 / 5, (u32)mbps) + 1;
> 
> 
> >  
> >  	reg = CORE_DIG_RW_TRIO0_2;
> > @@ -815,8 +816,7 @@ static void ipu7_isys_cphy_config(struct ipu7_isys *isys, u8 id, u8 lanes,
> >  		dwc_phy_write_mask(isys, id, reg + 0x400 * i,
> >  				   deass_thresh, 0, 7);
> >  
> > -	delay_thresh =
> > -		((224U - (9U * 7U)) * 1000U) / (5U * mbps) - 7U;
> > +	delay_thresh = div64_u64((224U - (9U * 7U)) * 1000U, 5U * mbps) - 7u;
> 
> That one just needs a (u32) cast, although the 5 can be moved.

I agree in principle but this should be done separately from fixing the bug
which is what this patch does. mbps is u64 elsewhere, too, and there
doesn't seem to be a need for that.

-- 
Regards,

Sakari Ailus

