Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C0B935C270
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 12:03:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239235AbhDLJoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 05:44:04 -0400
Received: from mga04.intel.com ([192.55.52.120]:27906 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244083AbhDLJni (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 05:43:38 -0400
IronPort-SDR: 3VhcuKfuSGJ8nkhXrDfptN2zuo4cLCgjZk+ztq3LJasMmCjVEbEiPqr8gnpbmwJAmvy5YjdjC6
 ng2MAoy9tkzQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="192021293"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="192021293"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:43:06 -0700
IronPort-SDR: c3qofnFRJu4y+V5m3FVtUxb1haaRQdz6XGFkubCHPk2VHDvvzoGGQsabXKRtntCKT63wT/g8lS
 2J3/coYr/TPA==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; 
   d="scan'208";a="599915096"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2021 02:43:03 -0700
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5DC89205AA;
        Mon, 12 Apr 2021 12:42:30 +0300 (EEST)
Date:   Mon, 12 Apr 2021 12:42:30 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Mitali Borkar <mitaliborkar810@gmail.com>
Cc:     bingbu.cao@intel.com, tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
        linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
        outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: Re: [PATCH 1/6] staging: media: intel-ipu3: replace bit shifts with
 BIT() macro
Message-ID: <20210412094230.GI3@paasikivi.fi.intel.com>
References: <cover.1618180659.git.mitaliborkar810@gmail.com>
 <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cc7b827a3264f08cedb76adddd16a34df48f935f.1618180659.git.mitaliborkar810@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mitali,

On Mon, Apr 12, 2021 at 04:38:39AM +0530, Mitali Borkar wrote:
> Added #include <linux/bitops.h> and replaced bit shifts by BIT() macro.
> This BIT() macro from linux/bitops.h is used to define IPU3_UAPI_GRID_Y_START_EN
> and IPU3_UAPI_AWB_RGBS_THR_B_* bitmask.
> Use of macro is better and neater. It maintains consistency.
> Reported by checkpatch.
> 
> Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
> ---
>  drivers/staging/media/ipu3/include/intel-ipu3.h | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
> index edd8edda0647..589d5ccee3a7 100644
> --- a/drivers/staging/media/ipu3/include/intel-ipu3.h
> +++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
> @@ -5,6 +5,7 @@
>  #define __IPU3_UAPI_H
>  
>  #include <linux/types.h>
> +#include <linux/bitops.h>
>  
>  /* from /drivers/staging/media/ipu3/include/videodev2.h */
>  
> @@ -22,11 +23,11 @@
>  #define IPU3_UAPI_MAX_BUBBLE_SIZE			10
>  
>  #define IPU3_UAPI_GRID_START_MASK			((1 << 12) - 1)
> -#define IPU3_UAPI_GRID_Y_START_EN			(1 << 15)
> +#define IPU3_UAPI_GRID_Y_START_EN			BIT(15)

This header is used in user space where you don't have the BIT() macro.

>  
>  /* controls generation of meta_data (like FF enable/disable) */
> -#define IPU3_UAPI_AWB_RGBS_THR_B_EN			(1 << 14)
> -#define IPU3_UAPI_AWB_RGBS_THR_B_INCL_SAT		(1 << 15)
> +#define IPU3_UAPI_AWB_RGBS_THR_B_EN			BIT(14)
> +#define IPU3_UAPI_AWB_RGBS_THR_B_INCL_SAT		BIT(15)
>  
>  /**
>   * struct ipu3_uapi_grid_config - Grid plane config

-- 
Kind regards,

Sakari Ailus
