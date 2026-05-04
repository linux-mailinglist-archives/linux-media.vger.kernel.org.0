Return-Path: <linux-media+bounces-60256-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEgQCUtX+GnTtAIAu9opvQ
	(envelope-from <linux-media+bounces-60256-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:22:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FED4BA1CC
	for <lists+linux-media@lfdr.de>; Mon, 04 May 2026 10:22:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 40B413010EE4
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2026 08:22:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19735329E5D;
	Mon,  4 May 2026 08:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TI84OB9a"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4994C328616;
	Mon,  4 May 2026 08:22:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777882950; cv=none; b=Ii/gYo96Mzcp6/5iDMLzOneuBqol90ukiOGUNTe2HN1XKxBCQ6MdZ4L4M+V5jHmPVHqeaeOtzD/BpU+Lg3wwTjQk1bk1krIXw0g4kD3fHEH7/6Okxk14r8e/+mEtVQ+frmvQtPHZC4iHmuKqz7WNGKii04HY0CwyrixKAu9Wx5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777882950; c=relaxed/simple;
	bh=ZIQDkX/cvyL0xNjSSic8qAT8zD4NaIC2T3Yp1s4yTic=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dkwTIn+v7sklCVx3uMVV1Exj2rxuckXzf6Qj4VAAIVi+ml/oFLotobhgu1ckv9OYV5ocDgy7xd8uwZka7/+NguP46wyox6jKa3+smUXnJzJVNQsPLSEKRwKQ0hORJ8yzdK1ID7rxBY+aT5lg8ia/XtV0Px+5hFGCAGOjFISSEoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TI84OB9a; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777882949; x=1809418949;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZIQDkX/cvyL0xNjSSic8qAT8zD4NaIC2T3Yp1s4yTic=;
  b=TI84OB9aTg+BfEoKpPCi9/j3Zy5YE8Yzg6VH9yg/SIHKZwm+jspU/y8Z
   xIMNYUeEWc9SIueF04gtFasrVfxhu5INKjkWaD7jdyu/YWSqQ8livZdW6
   Y2RM1wILFWpA/po8a+LGtYf8rvRHJQzgzrYCUK8M+xF4EmR27FXKL0krH
   2TXPVdrIXKi4VVFG+ZdW0dGqxFr5CP6KvPEj1Phh4K/19Dmy4XZe9C6RZ
   DMPvmZ9QLErqDnG8wtN4iwfNKOAYg3fw9H7csHUMfy1z/EEpceqENuF11
   zfBZ6Xm6Z01S6i/1IpmUhwY39dnCKymYdEJyNCtVifj7u9TLygZlXy1v4
   g==;
X-CSE-ConnectionGUID: eShhhG9iRNSCq1Ve0unngA==
X-CSE-MsgGUID: JAiR7YmIRv6KQ6ULyIohOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="66267917"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="66267917"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:22:28 -0700
X-CSE-ConnectionGUID: IeblzqfFSCaWSKGT56oHgA==
X-CSE-MsgGUID: wp0kBrMXSH+Yc1eYFiHnRg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="235515020"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.114])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 01:22:25 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 23E5F121CC4;
	Mon, 04 May 2026 11:22:24 +0300 (EEST)
Date: Mon, 4 May 2026 11:22:24 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Nas Chung <nas.chung@chipsnmedia.com>,
	Jackson Lee <jackson.lee@chipsnmedia.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Keke Li <keke.li@amlogic.com>, Yong Zhi <yong.zhi@intel.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
	stable@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: staging: ipu3-imgu: Add range check for
 imgu_css_cfg_acc_stripe
Message-ID: <afhXQOcJn11-UGCq@kekkonen.localdomain>
References: <20260501-smatch-7-1-v2-0-a2fcfb2531ac@chromium.org>
 <20260501-smatch-7-1-v2-5-a2fcfb2531ac@chromium.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260501-smatch-7-1-v2-5-a2fcfb2531ac@chromium.org>
X-Rspamd-Queue-Id: 89FED4BA1CC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60256-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media,samsung];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,chromium.org:email,kekkonen.localdomain:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Hi Ricardo,

On Fri, May 01, 2026 at 11:32:50AM +0000, Ricardo Ribalda wrote:
> If the driver's stripe information is invalid it can result in an integer
> overflow. Add a range check with a WARN_ON to expose this kind of
> error.

This would be an underflow, not overflow. There's also no longer a
WARN_ON() here.

I presume this might not be the only such issue in the driver.

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
> +		acc->stripe.bds_out_stripes[1].offset = offset;
>  	}
>  
>  	acc->stripe.effective_stripes[0].height =
> 

-- 
Regards,

Sakari Ailus

