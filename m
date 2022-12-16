Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E442664EC95
	for <lists+linux-media@lfdr.de>; Fri, 16 Dec 2022 15:05:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230182AbiLPOFd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Dec 2022 09:05:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiLPOFb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Dec 2022 09:05:31 -0500
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FD7DA19D;
        Fri, 16 Dec 2022 06:05:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671199530; x=1702735530;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rf6oqwgxdkbekgXRXJUeWpiQCH4OaXW2AGT9Sm8kUlc=;
  b=JkSMiJ5c3fDw8AxjxfqmRZRtMfj1C1uyAwu2wFGmPVeRLkEzrB0KCioF
   ovSa+Gyd9Ck7xnW6cIWfOf1x4gpog3fr9AL3LljCWEdo4wf1/6gu3Euyw
   uSmAhfLFeTmISaMVo+DOo6+YsLT6r4MFZycG1Px7Y50KOpNgOdG5IVhbz
   hP5HtBJ2Fewks/mnWTxJ34CwoH1gDxw2JHrP8Ua00vCpHH5bog5f7fXej
   /GiCU5K4J3w0O/sx/vOVyc3Yf+VX/69NXIyVVA+pfyP0IaAO6RjLUBMas
   QhoYXZo0dVQgDkyj4ywzrl+zPSTy1xtZU13oYT/w/NQghTqn74G7hhbF2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="306648315"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="306648315"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 06:05:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10563"; a="792086022"
X-IronPort-AV: E=Sophos;i="5.96,249,1665471600"; 
   d="scan'208";a="792086022"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2022 06:05:21 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 2B9DC20310;
        Fri, 16 Dec 2022 15:57:37 +0200 (EET)
Date:   Fri, 16 Dec 2022 13:57:37 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Jai Luthra <j-luthra@ti.com>
Cc:     Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/3] media: ov5640: Handle delays when no reset_gpio set
Message-ID: <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
References: <20221216134409.6868-1-j-luthra@ti.com>
 <20221216134409.6868-2-j-luthra@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221216134409.6868-2-j-luthra@ti.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jai,

Thanks for the set.

On Fri, Dec 16, 2022 at 07:14:07PM +0530, Jai Luthra wrote:
> Some module manufacturers [1][2] don't expose the RESETB gpio of the
> sensor directly through the 15-pin FFC connector. Instead wiring ~PWDN
> as a proxy reset with appropriate delays.
> 
> In such cases, reset_gpio will not be available to the driver, but it
> will still be toggled when the sensor is powered on, and thus we should
> still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
> before attempting any i/o operations over SCCB.
> 
> [1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
> [2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
> [3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> 
> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> ---
>  drivers/media/i2c/ov5640.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> index e0f908af581b..4bb7bf557cfa 100644
> --- a/drivers/media/i2c/ov5640.c
> +++ b/drivers/media/i2c/ov5640.c
> @@ -2466,6 +2466,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
>  
>  	ov5640_reset(sensor);
>  	ov5640_power(sensor, true);
> +	usleep_range(26000, 30000);

I think you should only do this if you don't have RESETB pin.

I'm not sure how to best describe this in DT. It's not the same as if you
didn't have RESETB GPIO.

Cc the devicetree list and Krzysztof.

>  
>  	ret = ov5640_init_slave_id(sensor);
>  	if (ret)

-- 
Kind regards,

Sakari Ailus
