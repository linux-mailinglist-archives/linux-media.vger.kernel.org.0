Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A24248ACC4
	for <lists+linux-media@lfdr.de>; Tue, 11 Jan 2022 12:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238895AbiAKLjk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 Jan 2022 06:39:40 -0500
Received: from mga17.intel.com ([192.55.52.151]:43525 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239005AbiAKLjM (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 Jan 2022 06:39:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641901152; x=1673437152;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=TKCFAvUfZzqVh2Arewkid+2/QZHpIx7qByMTG7YoazQ=;
  b=T1ef59n9evpPLzmgaWldw7D4hVhcZOiYJvn1E2RlJO35uuwbr0Zx7WqS
   2vJIrdPKCYA6nYIynD63zhTqFg7Yy1VWD+AfcOYFybvYgej+hm1KR9Xny
   TvLGW+adfNJav7lsgJ+5HII3IPrSvDK6lcHBp72zvn/6Wo/TLwyFpP4F3
   +7hNCletEU+er0u5EdS8GGlp2o2EsxGS5CVTOVlLeOYSJQMZBVtUfZCoH
   fPbYFlt4Y8Knt+imfw14Yv4pBn2vAXC7Nd6gQ6b90TKuvSYUs+WyUlgX1
   nvrTefGjvbrTd7fUtJYekg1ImX8T7ccfaXviyuq5+0wjrW9TbyWQqg0TP
   w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10223"; a="224162581"
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="224162581"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:39:11 -0800
X-IronPort-AV: E=Sophos;i="5.88,279,1635231600"; 
   d="scan'208";a="576180174"
Received: from smile.fi.intel.com ([10.237.72.61])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 03:39:07 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.95)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1n7FTN-009Crz-SF;
        Tue, 11 Jan 2022 13:37:53 +0200
Date:   Tue, 11 Jan 2022 13:37:53 +0200
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Nick Desaulniers <ndesaulniers@google.com>, hverkuil@xs4all.nl
Subject: Re: [PATCH 1/1] v4l: Avoid unaligned access warnings when printing
 4cc modifiers
Message-ID: <Yd1sEVQe2R0vk7II@smile.fi.intel.com>
References: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220110224656.266536-1-sakari.ailus@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jan 11, 2022 at 12:46:56AM +0200, Sakari Ailus wrote:
> Pointers V4L2 pixelformat and dataformat fields in a few packed structs
> are directly passed to printk family of functions. This could result in an
> unaligned access albeit no such possibility appears to exist at the
> moment i.e. this clang warning appears to be a false positive.
> 
> Address the warning by copying the pixelformat or dataformat value to a
> local variable first.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: e927e1e0f0dd ("v4l: ioctl: Use %p4cc printk modifier to print FourCC codes")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
> Hi Andy, Nick,
> 
> How about this one?
> 
> I believe it does address the clang warning although I haven't tested it.

With addressed comments, pointed by Nick,

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thanks!

Note, applying this doesn't automatically discard my patch.

>  drivers/media/v4l2-core/v4l2-ioctl.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> index 9ac557b8e146..642cb90f457c 100644
> --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> @@ -279,8 +279,8 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	const struct v4l2_vbi_format *vbi;
>  	const struct v4l2_sliced_vbi_format *sliced;
>  	const struct v4l2_window *win;
> -	const struct v4l2_sdr_format *sdr;
>  	const struct v4l2_meta_format *meta;
> +	u32 pixelformat;
>  	u32 planes;
>  	unsigned i;
>  
> @@ -299,8 +299,9 @@ static void v4l_print_format(const void *arg, bool write_only)
>  	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
>  	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
>  		mp = &p->fmt.pix_mp;
> +		pixelformat = mp->pixelformat;
>  		pr_cont(", width=%u, height=%u, format=%p4cc, field=%s, colorspace=%d, num_planes=%u, flags=0x%x, ycbcr_enc=%u, quantization=%u, xfer_func=%u\n",
> -			mp->width, mp->height, &mp->pixelformat,
> +			mp->width, mp->height, &pixelformat,
>  			prt_names(mp->field, v4l2_field_names),
>  			mp->colorspace, mp->num_planes, mp->flags,
>  			mp->ycbcr_enc, mp->quantization, mp->xfer_func);
> @@ -343,14 +344,15 @@ static void v4l_print_format(const void *arg, bool write_only)
>  		break;
>  	case V4L2_BUF_TYPE_SDR_CAPTURE:
>  	case V4L2_BUF_TYPE_SDR_OUTPUT:
> -		sdr = &p->fmt.sdr;
> -		pr_cont(", pixelformat=%p4cc\n", &sdr->pixelformat);
> +		pixelformat = p->fmt.sdr.pixelformat;
> +		pr_cont(", pixelformat=%p4cc\n", &pixelformat);
>  		break;
>  	case V4L2_BUF_TYPE_META_CAPTURE:
>  	case V4L2_BUF_TYPE_META_OUTPUT:
>  		meta = &p->fmt.meta;
> +		pixelformat = meta->dataformat;
>  		pr_cont(", dataformat=%p4cc, buffersize=%u\n",
> -			&meta->dataformat, meta->buffersize);
> +			&pixelformat, meta->buffersize);
>  		break;
>  	}
>  }
> -- 
> 2.30.2
> 

-- 
With Best Regards,
Andy Shevchenko


