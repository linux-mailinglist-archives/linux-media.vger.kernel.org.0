Return-Path: <linux-media+bounces-62632-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0Ba+FOuKEGrEZQYAu9opvQ
	(envelope-from <linux-media+bounces-62632-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 18:57:15 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id AE9445B7D0C
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 18:57:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A2AE53059E36
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 16:49:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 86AB4478875;
	Fri, 22 May 2026 16:49:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AjeG+HgB"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA3C413247;
	Fri, 22 May 2026 16:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779468557; cv=none; b=kFxbCcHNYOnif6ex6K4KiHiNl2Y3vaGaf31uEgDGNNAY3kZU1/YB7LGpBooAP6MaXowy9trvnxTStzjwypKSJfI2htmkGKClp636jB2Niyj9Xkq+pWWc2/TgGIuCcLr2gup7CLuT9cefaIeScYD6TdeP5PviJhVktRg77opIFa0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779468557; c=relaxed/simple;
	bh=W8GuM5pxlAG5UpptTVuy5RvYky5kSAJBWzZcp48Fvoc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYCNAmY8btuVSteAT2jjb4DMaxgtQQl2irUlkKzdtke1ZBaj4u8V/T3M5FOvDdqneyf3y7CNw5ZwWnRXr+ySsFMv2Fg4E5D44YKCvL6fvj+BulubGFqQq98mxd9nN/PW0TBNrYFREPyIOaGn/l3cWapvxhftB6J0y3l5i6zWIqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AjeG+HgB; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779468556; x=1811004556;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=W8GuM5pxlAG5UpptTVuy5RvYky5kSAJBWzZcp48Fvoc=;
  b=AjeG+HgBj9gv/o7+w6KmP4m9GFPqQ5Ozb4/0CNAZPPYLKC0oU1gYP4gP
   om5XkHxGVH4PRYPPcVRBHT8aLGxOY7FnWuLgb/1JPd3LQ1FKNxWDJbjCs
   ERz+Fy0aj4OfUSb+6fMERGM7AGmdfnZCNfrVgNiwGk1oXg0ZT81rRrnJs
   xo0OI1KM3JXaAeN3wRItinluWBidHYR1Wu3mPfemHZpsXNFvf/NiXI48+
   2yMsaqzadBvJOtBKMaZQTKgGd7xs7YvQI0rmDM9OVd/7clRZoeyFRXee5
   TwDAKDVMDErSo7QxGOGwOvyMdUQ2SA0LASaljw0idhDd1O0M5mS9E6UeE
   g==;
X-CSE-ConnectionGUID: 48nqJGl0S+GJKQPsKMzrbA==
X-CSE-MsgGUID: S2k9iSc3SQyyz08CmgrsMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="84256036"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="84256036"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 09:49:15 -0700
X-CSE-ConnectionGUID: zYl/dPQWSk+qdBNelmvqjQ==
X-CSE-MsgGUID: aVMt1vH1T02G5FUmSmqVOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="245938408"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.224])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 09:49:11 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A623B1204F7;
	Fri, 22 May 2026 19:49:06 +0300 (EEST)
Date: Fri, 22 May 2026 19:49:06 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v4 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Message-ID: <ahCJAhBbfGzeRFYJ@kekkonen.localdomain>
References: <20260507-smatch-7-1-v4-0-cc195f142167@chromium.org>
 <20260507-smatch-7-1-v4-5-cc195f142167@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260507-smatch-7-1-v4-5-cc195f142167@chromium.org>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62632-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: AE9445B7D0C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Ricardo,

Thanks for the patch.

On Thu, May 07, 2026 at 08:58:10PM +0000, Ricardo Ribalda wrote:
> If the driver's stripe information is invalid it can result in an integer
> underflow. Add a range check to avoid this kind of error.
> 
> This patch fixes the following smatch error:
> drivers/staging/media/ipu3/ipu3-css-params.c:1792 imgu_css_cfg_acc_stripe() warn: 'acc->stripe.bds_out_stripes[0]->width - 2 * f' 4294967168 can't fit into 65535 'acc->stripe.bds_out_stripes[1]->offset'
> 
> Cc: stable@vger.kernel.org
> Fixes: e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index 2c48d57a3180..92cce31e35c5 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -1770,6 +1770,8 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
>  		acc->stripe.bds_out_stripes[0].width =
>  			ALIGN(css_pipe->rect[IPU3_CSS_RECT_BDS].width, f);
>  	} else {
> +		u32 offset;
> +
>  		/* Image processing is divided into two stripes */
>  		acc->stripe.bds_out_stripes[0].width =
>  			acc->stripe.bds_out_stripes[1].width =
> @@ -1788,8 +1790,10 @@ static int imgu_css_cfg_acc_stripe(struct imgu_css *css, unsigned int pipe,
>  			acc->stripe.bds_out_stripes[1].width += f;
>  		}
>  		/* Overlap between stripes is IPU3_UAPI_ISP_VEC_ELEMS * 4 */
> -		acc->stripe.bds_out_stripes[1].offset =
> -			acc->stripe.bds_out_stripes[0].width - 2 * f;
> +		offset = acc->stripe.bds_out_stripes[0].width - 2 * f;
> +		if (offset > 65535)
> +			return -EINVAL;

acc->stripe.bds_out_stripes[0].width comes from the sub-device's main
source pad, and its driver-enforced upper limit 4480. The lower limit,
though, appears to be 32, which is obviously too low.

I can post a patch for this but I'm not sure smatch can figure this out...
but let's try anyway. The driver would indeed benefit of a cleanup in this
area.

> +		acc->stripe.bds_out_stripes[1].offset = offset;
>  	}
>  
>  	acc->stripe.effective_stripes[0].height =
> 

-- 
Regards,

Sakari Ailus

