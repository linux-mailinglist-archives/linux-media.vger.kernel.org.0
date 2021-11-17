Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8A9B5454AB1
	for <lists+linux-media@lfdr.de>; Wed, 17 Nov 2021 17:11:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238739AbhKQQOx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Nov 2021 11:14:53 -0500
Received: from mga14.intel.com ([192.55.52.115]:23750 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232707AbhKQQOw (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Nov 2021 11:14:52 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10171"; a="234214199"
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="234214199"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 08:11:38 -0800
X-IronPort-AV: E=Sophos;i="5.87,241,1631602800"; 
   d="scan'208";a="472774149"
Received: from paasikivi.fi.intel.com ([10.237.72.42])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 08:11:35 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 9485020282;
        Wed, 17 Nov 2021 18:11:33 +0200 (EET)
Date:   Wed, 17 Nov 2021 18:11:33 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Eugen Hristev <eugen.hristev@microchip.com>
Cc:     leonl@leopardimaging.com, linux-media@vger.kernel.org,
        skomatineni@nvidia.com, luca@lucaceresoli.net,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: i2c: imx274: fix s_frame_interval runtime resume
 not requested
Message-ID: <YZUptcn1isWQuCdq@paasikivi.fi.intel.com>
References: <20211117154009.261787-1-eugen.hristev@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117154009.261787-1-eugen.hristev@microchip.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Eugen,

On Wed, Nov 17, 2021 at 05:40:09PM +0200, Eugen Hristev wrote:
> pm_runtime_resume_and_get should be called when the s_frame_interval
> is called.
> 
> The driver will try to access device registers to configure VMAX, coarse
> time and exposure.
> 
> Currently if the runtime is not resumed, this fails:
>  # media-ctl -d /dev/media0 --set-v4l2 '"IMX274 1-001a":0[fmt:SRGGB10_1X10/3840x2
> 160@1/10]'
> 
> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 3840x2160, goodness 0
> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1920x1080, goodness -3000
> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1280x720, goodness -4000
> IMX274 1-001a: imx274_binning_goodness: ask 3840x2160, size 1280x540, goodness -4180
> IMX274 1-001a: __imx274_change_compose: selected 1x1 binning
> IMX274 1-001a: imx274_set_frame_interval: input frame interval = 1 / 10
> IMX274 1-001a: imx274_read_mbreg : addr 0x300e, val=0x1 (2 bytes)
> IMX274 1-001a: imx274_set_frame_interval : register SVR = 1
> IMX274 1-001a: imx274_read_mbreg : addr 0x30f6, val=0x6a8 (2 bytes)
> IMX274 1-001a: imx274_set_frame_interval : register HMAX = 1704
> IMX274 1-001a: imx274_set_frame_length : input length = 2112
> IMX274 1-001a: imx274_write_mbreg : i2c bulk write failed, 30f8 = 884 (3 bytes)
> IMX274 1-001a: imx274_set_frame_length error = -121
> IMX274 1-001a: imx274_set_frame_interval error = -121
> Unable to setup formats: Remote I/O error (121)
> 
> The device is not resumed thus the remote I/O error.
> 
> Setting the frame interval works at streaming time, because
> pm_runtime_resume_and_get is called at s_stream time before sensor setup.
> The failure happens when only the s_frame_interval is called separately
> independently on streaming time.
> 
> Fixes: ad97bc37426c ("media: i2c: imx274: Add IMX274 power on and off sequence"
> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> ---
>  drivers/media/i2c/imx274.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/i2c/imx274.c b/drivers/media/i2c/imx274.c
> index e89ef35a71c5..6e63fdcc5e46 100644
> --- a/drivers/media/i2c/imx274.c
> +++ b/drivers/media/i2c/imx274.c
> @@ -1420,6 +1420,10 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
>  	int min, max, def;
>  	int ret;
>  
> +	ret = pm_runtime_resume_and_get(&imx274->client->dev);
> +	if (ret < 0)
> +		return ret;
> +
>  	mutex_lock(&imx274->lock);
>  	ret = imx274_set_frame_interval(imx274, fi->interval);
>  
> @@ -1451,6 +1455,7 @@ static int imx274_s_frame_interval(struct v4l2_subdev *sd,
>  
>  unlock:
>  	mutex_unlock(&imx274->lock);
> +	pm_runtime_put(&imx274->client->dev);
>  
>  	return ret;
>  }

If the device is powered off in the end, could you instead not power it on
in the first place? I.e. see how this works for the s_ctrl() callback.

-- 
Kind regards,

Sakari Ailus
