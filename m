Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69F0C2C2E2A
	for <lists+linux-media@lfdr.de>; Tue, 24 Nov 2020 18:14:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389846AbgKXRNn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 12:13:43 -0500
Received: from mga01.intel.com ([192.55.52.88]:18370 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728342AbgKXRNn (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 12:13:43 -0500
IronPort-SDR: P5KjhBIP+tziHH6WVyRRpZ5qS+TTSdnsWr2a9gk5X17tgmie2TomNMoEemdMDAihDy8ZQ23zIk
 3AlaQUo+EIvg==
X-IronPort-AV: E=McAfee;i="6000,8403,9815"; a="190111338"
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="190111338"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 09:13:43 -0800
IronPort-SDR: EdjZjtpDLYN0KB6oiMHDEt9ItD97Z+85UQW4wc7puUdRqxhKl8sEZqj4i2+txAuxfhaXzmf5vb
 czz+FFw+2VsA==
X-IronPort-AV: E=Sophos;i="5.78,366,1599548400"; 
   d="scan'208";a="358868031"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2020 09:13:41 -0800
Received: by paasikivi.fi.intel.com (Postfix, from userid 1000)
        id 1462E20461; Tue, 24 Nov 2020 19:13:39 +0200 (EET)
Date:   Tue, 24 Nov 2020 19:13:39 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     dongchun.zhu@mediatek.com, mchehab@kernel.org,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tomasz Figa <tfiga@google.com>,
        Bingbu Cao <bingbu.cao@linux.intel.com>
Subject: Re: [PATCH v1] media: ov8856: Fix Bayer format dependance on mode
Message-ID: <20201124171338.GF3940@paasikivi.fi.intel.com>
References: <20201124150332.3026752-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201124150332.3026752-1-robert.foss@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Robert,

On Tue, Nov 24, 2020 at 04:03:32PM +0100, Robert Foss wrote:
> The Bayer GRBG10 mode used for earlier modes 3280x2460 and
> 1640x1232 isn't the mode output by the sensor for the
> 3264x2448 and 1632x1224 modes.
> 
> Switch from MEDIA_BUS_FMT_SGRBG10_1X10 to MEDIA_BUS_FMT_SBGGR10_1X10
> for 3264x2448 & 1632x1224 modes.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
> 
> This patch is sent out after Dongchun Zhu clarified the Bayer
> modes used by different sensor configuration in the below thread.
> 
> https://lkml.org/lkml/2020/11/24/335
> 
>  drivers/media/i2c/ov8856.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/i2c/ov8856.c b/drivers/media/i2c/ov8856.c
> index 2f4ceaa80593..a2dcbece558c 100644
> --- a/drivers/media/i2c/ov8856.c
> +++ b/drivers/media/i2c/ov8856.c
> @@ -1281,8 +1281,13 @@ static void ov8856_update_pad_format(const struct ov8856_mode *mode,
>  {
>  	fmt->width = mode->width;
>  	fmt->height = mode->height;
> -	fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>  	fmt->field = V4L2_FIELD_NONE;
> +
> +	if (mode->reg_list.regs == mode_3264x2448_regs ||
> +	    mode->reg_list.regs == mode_1632x1224_regs)
> +		fmt->code = MEDIA_BUS_FMT_SBGGR10_1X10;
> +	else
> +		fmt->code = MEDIA_BUS_FMT_SGRBG10_1X10;
>  }
>  
>  static int ov8856_start_streaming(struct ov8856 *ov8856)

Could you instead add the mode information to the ov8856_mode struct?

Also enum_mbus_code needs to be updated.

The mbus code also has priority in mode selection, thus only the modes for
the selected mbus code should considered in set_fmt.

-- 
Regards,

Sakari Ailus
