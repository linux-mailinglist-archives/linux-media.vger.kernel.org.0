Return-Path: <linux-media+bounces-1942-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E1680A1CB
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 12:06:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 30D182819E0
	for <lists+linux-media@lfdr.de>; Fri,  8 Dec 2023 11:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFF8619BCC;
	Fri,  8 Dec 2023 11:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T+dxdd3p"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5CEF172E
	for <linux-media@vger.kernel.org>; Fri,  8 Dec 2023 03:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702033576; x=1733569576;
  h=subject:to:references:from:message-id:date:mime-version:
   in-reply-to:content-transfer-encoding;
  bh=yo/7y2aKw7SJF3STgLacmtHUzZvFhmA3yv1509/yvsE=;
  b=T+dxdd3pnWF0o8d5a3IhV8ZVuDL6EoV+9mmGUGCtDdzkaXaD9S2C68i8
   IBqiIMOGTnqp7uN3bkKp/IE0H9qz9E/tzqB3gXKYZyYSmKgN51kmlkp4b
   Bl7GkdeflPBSmo9nutfG/CxhIzP1fQ06MJSe0Q0m+MUru+kAwF8ImBOCf
   5hQuiEc/go1BmJWXPDA979+tXT/SLlXKj5nwhA0uFRplaYpm3XJg0CDTs
   Rq0GTLzhZi2vPVPISRVfUCnRlHhqK2W4wqIB6lpbyoSKw5nOL/30BY65t
   8oeEwg5jRhY06pUncXqR7iPm/tsO8dWeDB/auXRehUjNX4tIxWqNd60DS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="1456026"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="1456026"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2023 03:06:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10917"; a="838096734"
X-IronPort-AV: E=Sophos;i="6.04,260,1695711600"; 
   d="scan'208";a="838096734"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.136]) ([10.238.232.136])
  by fmsmga008.fm.intel.com with ESMTP; 08 Dec 2023 03:06:13 -0800
Subject: Re: [PATCH] yavta: add support for 12-bit packed and 14-bit
 unpacked/packed bayer formats
To: bingbu.cao@intel.com, linux-media@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, sakari.ailus@linux.intel.com
References: <20231012085216.3346754-1-bingbu.cao@intel.com>
From: Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <db881a47-4224-816a-e556-76d6fcb26444@linux.intel.com>
Date: Fri, 8 Dec 2023 19:01:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231012085216.3346754-1-bingbu.cao@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Laurent and Sakari,

Do you have any chance to review this? :)

On 10/12/23 4:52 PM, bingbu.cao@intel.com wrote:
> From: Bingbu Cao <bingbu.cao@intel.com>
> 
> Add bayer formats:
> V4L2_PIX_FMT_SBGGR12P
> V4L2_PIX_FMT_SGBRG12P
> V4L2_PIX_FMT_SGRBG12P
> V4L2_PIX_FMT_SRGGB12P
> V4L2_PIX_FMT_SBGGR14
> V4L2_PIX_FMT_SGBRG14
> V4L2_PIX_FMT_SGRBG14
> V4L2_PIX_FMT_SRGGB14
> V4L2_PIX_FMT_SBGGR14P
> V4L2_PIX_FMT_SGBRG14P
> V4L2_PIX_FMT_SGRBG14P
> V4L2_PIX_FMT_SRGGB14P
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  yavta.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/yavta.c b/yavta.c
> index d5628632c1f8..7d10fa39f6f7 100644
> --- a/yavta.c
> +++ b/yavta.c
> @@ -348,6 +348,18 @@ static struct v4l2_format_info {
>  	{ "SGBRG12", V4L2_PIX_FMT_SGBRG12, 1 },
>  	{ "SGRBG12", V4L2_PIX_FMT_SGRBG12, 1 },
>  	{ "SRGGB12", V4L2_PIX_FMT_SRGGB12, 1 },
> +	{ "SBGGR12P", V4L2_PIX_FMT_SBGGR12P, 1 },
> +	{ "SGBRG12P", V4L2_PIX_FMT_SGBRG12P, 1 },
> +	{ "SGRBG12P", V4L2_PIX_FMT_SGRBG12P, 1 },
> +	{ "SRGGB12P", V4L2_PIX_FMT_SRGGB12P, 1 },
> +	{ "SBGGR14", V4L2_PIX_FMT_SBGGR14, 1 },
> +	{ "SGBRG14", V4L2_PIX_FMT_SGBRG14, 1 },
> +	{ "SGRBG14", V4L2_PIX_FMT_SGRBG14, 1 },
> +	{ "SRGGB14", V4L2_PIX_FMT_SRGGB14, 1 },
> +	{ "SBGGR14P", V4L2_PIX_FMT_SBGGR14P, 1 },
> +	{ "SGBRG14P", V4L2_PIX_FMT_SGBRG14P, 1 },
> +	{ "SGRBG14P", V4L2_PIX_FMT_SGRBG14P, 1 },
> +	{ "SRGGB14P", V4L2_PIX_FMT_SRGGB14P, 1 },
>  	{ "SBGGR16", V4L2_PIX_FMT_SBGGR16, 1 },
>  	{ "SGBRG16", V4L2_PIX_FMT_SGBRG16, 1 },
>  	{ "SGRBG16", V4L2_PIX_FMT_SGRBG16, 1 },
> 

-- 
Best regards,
Bingbu Cao

