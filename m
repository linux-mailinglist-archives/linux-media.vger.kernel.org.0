Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32CDA294A61
	for <lists+linux-media@lfdr.de>; Wed, 21 Oct 2020 11:20:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437765AbgJUJUz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Oct 2020 05:20:55 -0400
Received: from mga06.intel.com ([134.134.136.31]:55857 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2437619AbgJUJUz (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Oct 2020 05:20:55 -0400
IronPort-SDR: VcJJnXrtHtYz0dtFA5QgoRCG3r4vLrI3V3rgcisnItMSAZZlVzdjCX02fy5w/y/tlnHt0ms8Yw
 /mmMPkDHMQRQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9780"; a="228964220"
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="228964220"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:20:49 -0700
IronPort-SDR: gggVILlSD/5P5JllA7+E7WJbs6+IfNmd+hOXfji2YGktVFcbFZPr368uNbHEgnC76USrtU2VvY
 rZzrq16mRCXA==
X-IronPort-AV: E=Sophos;i="5.77,400,1596524400"; 
   d="scan'208";a="320954500"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2020 02:20:46 -0700
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 853D320815; Wed, 21 Oct 2020 12:20:43 +0300 (EEST)
Date:   Wed, 21 Oct 2020 12:20:43 +0300
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, senozhatsky@chromium.org,
        tfiga@chromium.org, bingbu.cao@linux.intel.com
Subject: Re: [PATCH] media: ov2740: change the minimal exposure value to 4
Message-ID: <20201021092043.GD2703@paasikivi.fi.intel.com>
References: <1603248250-24847-1-git-send-email-bingbu.cao@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1603248250-24847-1-git-send-email-bingbu.cao@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Bingbu,

On Wed, Oct 21, 2020 at 10:44:10AM +0800, Bingbu Cao wrote:
> The minimal valid exposure value should be 4 lines instead of 8 for
> ov2740 mannual exposure control.
> 
> Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> ---
>  drivers/media/i2c/ov2740.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov2740.c b/drivers/media/i2c/ov2740.c
> index bd0d45b0d43f..0dbae4949cb3 100644
> --- a/drivers/media/i2c/ov2740.c
> +++ b/drivers/media/i2c/ov2740.c
> @@ -37,7 +37,7 @@
>  
>  /* Exposure controls from sensor */
>  #define OV2740_REG_EXPOSURE		0x3500
> -#define OV2740_EXPOSURE_MIN		8
> +#define OV2740_EXPOSURE_MIN		4
>  #define OV2740_EXPOSURE_MAX_MARGIN	8
>  #define OV2740_EXPOSURE_STEP		1

This is already in my tree --- I may forgotten to push master after
applying many patches, it is up-to-date now.

-- 
Regards,

Sakari Ailus
