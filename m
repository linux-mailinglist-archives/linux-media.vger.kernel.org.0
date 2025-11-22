Return-Path: <linux-media+bounces-47606-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B544C7C89A
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 07:29:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65BC83A776C
	for <lists+linux-media@lfdr.de>; Sat, 22 Nov 2025 06:29:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 526212F617E;
	Sat, 22 Nov 2025 06:29:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NRelajk6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0E3E2E413;
	Sat, 22 Nov 2025 06:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763792991; cv=none; b=sf8zYP29ACVFGP0/rLUkRAp/q0nkjTCrWRyDSgW3mPwiK6WX5PG16d2OcNtqpPUcLATqg2zBDLn1bKBBIM7aTYdPwBThuQZXmBoAIOyHsZ5ChcVcdpBPZb8ROTRERK1KMWzV2acE0zKGBVVFIKcL30dORtlRR04OMGehXxBNT1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763792991; c=relaxed/simple;
	bh=KCqbutL5B3VrIg/In49Xjlc1+gcJU4pHbQqJsCJTwC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jj0D+nCv8BrExBGIUv5RRFiT5E1HS0Wd1PRLM1Ft+Wr1woS3caAggysOUl8EkNwQYJ1gyyYe32ZaK5/9ZU6H+0XcC4fJkVYX4YX0cUs+cawuDNpbGxQqD7WrEdbZAQQEosYaRGdXPiKYr9B4Rb46Ilr+m57YCM9dbGaX1KrIe8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NRelajk6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC68AC4CEF5;
	Sat, 22 Nov 2025 06:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763792991;
	bh=KCqbutL5B3VrIg/In49Xjlc1+gcJU4pHbQqJsCJTwC0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NRelajk6nL9+YgVmEajHUme+graOI7HL6KyT0PlhqKCysSyRGF2HaAece8x12xi5P
	 3+fkxJsItktxrKrT0XVHWsFuOjZ8f28jU3EEh6vhBqvifvwrPlgo5EYiGxCnBINJWe
	 5bJrWx3P62E2hk0Ldcwt0UFOUPzHQRzdIXRRB7MHZsflQXlv9kEHgeCRC5wScmpM4b
	 yhqzm+wLhqFTtmvZXO4mb7DNS9RJZslKrLY4EqUwsqIdN2At7JN/E12v5kAdN9h0cv
	 /cTyD3dFXbKuXGimNITYneUq33eLZ/pwEKDIZNrRZs7yeXz4ks2tNQz43LcT1C3jBL
	 KQMSHK/k3GHAg==
Date: Fri, 21 Nov 2025 23:29:46 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ingo Molnar <mingo@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Subject: Re: drivers/media/i2c/ccs/ccs.o: error: objtool:
 ccs_set_selection(): unexpected end of section .text.ccs_set_selection
Message-ID: <20251122062946.GA3054484@ax162>
References: <aSEGwejeD3f7lnUL@rli9-mobl>
 <20251122013414.GA3094872@ax162>
 <ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ahukd6b3wonye3zgtptvwzvrxldcruazs2exfvll6etjhmcxyj@vq3eh6pd375b>

On Fri, Nov 21, 2025 at 09:51:33PM -0800, Josh Poimboeuf wrote:
> On Fri, Nov 21, 2025 at 06:34:14PM -0700, Nathan Chancellor wrote:
> > On Sat, Nov 22, 2025 at 08:41:37AM +0800, kernel test robot wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   2eba5e05d9bcf4cdea995ed51b0f07ba0275794a
> > > commit: 188d90f817e13b66e03e110eb6f82e8f5f0d654b objtool: Append "()" to function name in "unexpected end of section" warning
> > > date:   8 months ago
> > > :::::: branch date: 4 hours ago
> > > :::::: commit date: 8 months ago
> > > config: x86_64-randconfig-101-20251122 (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/config)
> > > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220717.5HHMLUHG-lkp@intel.com/reproduce)
> > > 
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/r/202511220717.5HHMLUHG-lkp@intel.com/
> > > 
> > > All errors (new ones prefixed by >>):
> > > 
> > > >> drivers/media/i2c/ccs/ccs.o: error: objtool: ccs_set_selection(): unexpected end of section .text.ccs_set_selection
> > 
> > That change obviously does not result in this warning/error. This
> > appears to be another divide by zero issue but based on my analysis so
> > far, I do not understand how...
> > 
> > https://github.com/ClangBuiltLinux/linux/issues/2129
> 
> Here ya go :-)  After looking at a gazillion of these I can often spot
> these pretty easily.  I'm not sure what the correct fix is here but this
> made the error go away.
> 
> diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
> index 1c889c878abd..2429c05bffb3 100644
> --- a/drivers/media/i2c/ccs/ccs-core.c
> +++ b/drivers/media/i2c/ccs/ccs-core.c
> @@ -2346,7 +2346,7 @@ static void ccs_set_compose_scaler(struct v4l2_subdev *subdev,
>  		* CCS_LIM(sensor, SCALER_N_MIN) / sel->r.height;
>  	max_m = crops[CCS_PAD_SINK]->width
>  		* CCS_LIM(sensor, SCALER_N_MIN)
> -		/ CCS_LIM(sensor, MIN_X_OUTPUT_SIZE);
> +		/ (CCS_LIM(sensor, MIN_X_OUTPUT_SIZE) ? : 1);
>  
>  	a = clamp(a, CCS_LIM(sensor, SCALER_M_MIN),
>  		  CCS_LIM(sensor, SCALER_M_MAX));

Aha! Thanks a lot :) I had thought it might be something with CCS_LIM()
since ccs_get_limit() returns zero if ccs_limit_ptr() errors and in the
default case of the switch statement. There are a lot of unchecked
divides with the result of CCS_LIM() throughout this driver so I figured
if that was it, there would be other instances of this warning... oh
well.

Something like the following diff also fixes it since LLVM no longer
sees 0 as a possible divisor, which seems a little better to me since it
seems like one of the other uses could turn problematic with other
optimizations.  Given these cases are both errors and have visible WARNs
in case they are hit, it seems like it is better to use a valid divisor
instead of 0.

Just one more warning to tackle in my personal configuration then I can
enable CONFIG_OBJTOOL_WERROR to make new warnings from LLVM uprevs more
obvious :)

  https://github.com/ClangBuiltLinux/linux/issues/2130

diff --git a/drivers/media/i2c/ccs/ccs-core.c b/drivers/media/i2c/ccs/ccs-core.c
index 1c889c878abd..05c3da29f14c 100644
--- a/drivers/media/i2c/ccs/ccs-core.c
+++ b/drivers/media/i2c/ccs/ccs-core.c
@@ -137,7 +137,7 @@ u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,

        ret = ccs_limit_ptr(sensor, limit, offset, &ptr);
        if (ret)
-               return 0;
+               return 1;

        switch (CCI_REG_WIDTH_BYTES(ccs_limits[ccs_limit_offsets[limit].info].reg)) {
        case sizeof(u8):
@@ -151,7 +151,7 @@ u32 ccs_get_limit(struct ccs_sensor *sensor, unsigned int limit,
                break;
        default:
                WARN_ON(1);
-               return 0;
+               return 1;
        }

        return ccs_reg_conv(sensor, ccs_limits[limit].reg, val);

