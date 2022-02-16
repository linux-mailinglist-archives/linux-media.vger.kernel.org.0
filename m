Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E3A4B8D7E
	for <lists+linux-media@lfdr.de>; Wed, 16 Feb 2022 17:11:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236127AbiBPQLr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Feb 2022 11:11:47 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:50630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236098AbiBPQLq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Feb 2022 11:11:46 -0500
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA53240B7
        for <linux-media@vger.kernel.org>; Wed, 16 Feb 2022 08:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645027894; x=1676563894;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=CG3yOmdjLT0x1uDAKWOV1RU69S6rWhwJogJt2pTN5lA=;
  b=eL1lxyscSHEz8OmOwn4n+JVNDUS9lOljVHHl8v7oa/JTlYRBPCLLeut/
   r0UrZPIAFuy2y5sLq+N+mFaBEe0Zia2zNJScXp+Ovs57Mq1xNMXHxawgr
   q+enlHtdYXcFGHDiWEUWpFsJ97NKgLOQ0c3dhKXtEVrYWGEf8PSvfro1D
   3YEv8ZU3/fDeHmMWHkwoKZcDX94RLJKY/kywFq77//2u4SeY0oUofqwDX
   qSAAzE8VnO6svsWOKKDZciZxxOZxsKZnPIwAyYsmQmgW0lAzocOKPn57D
   Jj94Z+mjTwflNZkSXz9irqSw9dE2GUZpxsTxE68jFfj48N8tr3zxvkMak
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="311395137"
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="311395137"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 08:03:48 -0800
X-IronPort-AV: E=Sophos;i="5.88,374,1635231600"; 
   d="scan'208";a="487148085"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2022 08:03:44 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 78EC8201DB;
        Wed, 16 Feb 2022 18:03:42 +0200 (EET)
Date:   Wed, 16 Feb 2022 18:03:42 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Daniel Scally <djrscally@gmail.com>
Cc:     linux-media@vger.kernel.org, yong.zhi@intel.com,
        bingbu.cao@intel.com, tian.shu.qiu@intel.com,
        andriy.shevchenko@linux.intel.com, hverkuil-cisco@xs4all.nl
Subject: Re: [PATCH 09/10] media: i2c: Remove .s_power() from ov7251
Message-ID: <Yg0gXpKJJnv4Fzle@paasikivi.fi.intel.com>
References: <20220215230737.1870630-1-djrscally@gmail.com>
 <20220215230737.1870630-10-djrscally@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215230737.1870630-10-djrscally@gmail.com>
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE,TVD_SUBJ_WIPE_DEBT,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Daniel,

On Tue, Feb 15, 2022 at 11:07:36PM +0000, Daniel Scally wrote:
> The .s_power() callback is deprecated, and now that we have pm_runtime
> functionality in the driver there's no further use for it. Delete the
> function.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/media/i2c/ov7251.c | 44 +-------------------------------------
>  1 file changed, 1 insertion(+), 43 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov7251.c b/drivers/media/i2c/ov7251.c
> index d620ed6a4e42..5e7422ca4ab9 100644
> --- a/drivers/media/i2c/ov7251.c
> +++ b/drivers/media/i2c/ov7251.c
> @@ -903,43 +903,6 @@ static int __maybe_unused ov7251_sensor_resume(struct device *dev)
>  	return ov7251_set_power_on(ov7251);
>  }
>  
> -static int ov7251_s_power(struct v4l2_subdev *sd, int on)
> -{
> -	struct ov7251 *ov7251 = to_ov7251(sd);
> -	int ret = 0;
> -
> -	mutex_lock(&ov7251->lock);
> -
> -	/* If the power state is not modified - no work to do. */
> -	if (ov7251->power_on == !!on)
> -		goto exit;
> -
> -	if (on) {
> -		ret = ov7251_set_power_on(ov7251);
> -		if (ret < 0)
> -			goto exit;
> -
> -		ret = ov7251_set_register_array(ov7251,
> -					ov7251_global_init_setting,
> -					ARRAY_SIZE(ov7251_global_init_setting));

Could this be written as part of the power-on sequence after identifying
the sensor? Likewise in probe() if it's possible the device won't be
powered down before it gets used --- I guess nothing rules that out?

> -		if (ret < 0) {
> -			dev_err(ov7251->dev, "could not set init registers\n");
> -			ov7251_set_power_off(ov7251);
> -			goto exit;
> -		}
> -
> -		ov7251->power_on = true;
> -	} else {
> -		ov7251_set_power_off(ov7251);
> -		ov7251->power_on = false;
> -	}
> -
> -exit:
> -	mutex_unlock(&ov7251->lock);
> -
> -	return ret;
> -}
> -
>  static int ov7251_set_hflip(struct ov7251 *ov7251, s32 value)
>  {
>  	u8 val = ov7251->timing_format2;
> @@ -1384,10 +1347,6 @@ static int ov7251_set_frame_interval(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>  
> -static const struct v4l2_subdev_core_ops ov7251_core_ops = {
> -	.s_power = ov7251_s_power,
> -};
> -
>  static const struct v4l2_subdev_video_ops ov7251_video_ops = {
>  	.s_stream = ov7251_s_stream,
>  	.g_frame_interval = ov7251_get_frame_interval,
> @@ -1405,7 +1364,6 @@ static const struct v4l2_subdev_pad_ops ov7251_subdev_pad_ops = {
>  };
>  
>  static const struct v4l2_subdev_ops ov7251_subdev_ops = {
> -	.core = &ov7251_core_ops,
>  	.video = &ov7251_video_ops,
>  	.pad = &ov7251_subdev_pad_ops,
>  };
> @@ -1690,7 +1648,7 @@ static int ov7251_probe(struct i2c_client *client)
>  	pm_runtime_disable(ov7251->dev);
>  	pm_runtime_put_noidle(ov7251->dev);
>  power_down:
> -	ov7251_s_power(&ov7251->sd, false);
> +	ov7251_set_power_off(ov7251);
>  free_entity:
>  	media_entity_cleanup(&ov7251->sd.entity);
>  free_ctrl:

-- 
Kind regards,

Sakari Ailus
