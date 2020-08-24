Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A38B24F183
	for <lists+linux-media@lfdr.de>; Mon, 24 Aug 2020 05:27:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727024AbgHXD1L (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Aug 2020 23:27:11 -0400
Received: from mga05.intel.com ([192.55.52.43]:54060 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726684AbgHXD1L (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Aug 2020 23:27:11 -0400
IronPort-SDR: SC9BCE1OJp0/5pzzQ+Prs6+hVwRI5Fa3NG8yKmNWiugxIshY2Kd4th9SHLTVxcSLNBP00sjUHF
 Ag+6NrJmIRBQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="240652813"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="240652813"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2020 20:27:09 -0700
IronPort-SDR: K+fZ6JLXSmksjbeNCGf+l7l5S9udUDS7ZP6MfHpEr3qjEgheL81KEtWSpCouTUfT+vCyrPFruo
 DQM/5lLAG3UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="322006007"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 23 Aug 2020 20:27:07 -0700
Subject: Re: [PATCH] media: staging/intel-ipu3: css: Correctly reset some
 memory
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
        tian.shu.qiu@intel.com, mchehab@kernel.org,
        gregkh@linuxfoundation.org, yong.zhi@intel.com
Cc:     linux-media@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <20200822131124.157917-1-christophe.jaillet@wanadoo.fr>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <5ae34514-13dc-671f-35a6-75c0343ddd68@linux.intel.com>
Date:   Mon, 24 Aug 2020 11:26:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200822131124.157917-1-christophe.jaillet@wanadoo.fr>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the patch.

On 8/22/20 9:11 PM, Christophe JAILLET wrote:
> The intent here is to reset the whole 'scaler_coeffs_luma' array, not just
> the first element.
> 
> Fixes: 	e11110a5b744 ("media: staging/intel-ipu3: css: Compute and program ccs")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/staging/media/ipu3/ipu3-css-params.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/ipu3/ipu3-css-params.c b/drivers/staging/media/ipu3/ipu3-css-params.c
> index fbd53d7c097c..e9d6bd9e9332 100644
> --- a/drivers/staging/media/ipu3/ipu3-css-params.c
> +++ b/drivers/staging/media/ipu3/ipu3-css-params.c
> @@ -159,7 +159,7 @@ imgu_css_scaler_calc(u32 input_width, u32 input_height, u32 target_width,
>  
>  	memset(&cfg->scaler_coeffs_chroma, 0,
>  	       sizeof(cfg->scaler_coeffs_chroma));
> -	memset(&cfg->scaler_coeffs_luma, 0, sizeof(*cfg->scaler_coeffs_luma));
> +	memset(&cfg->scaler_coeffs_luma, 0, sizeof(cfg->scaler_coeffs_luma));
>  	do {
>  		phase_step_correction++;
>  
> 
Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

-- 
Best regards,
Bingbu Cao
