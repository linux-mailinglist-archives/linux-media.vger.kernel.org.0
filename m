Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BD9650B20
	for <lists+linux-media@lfdr.de>; Mon, 19 Dec 2022 13:07:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231350AbiLSMHS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Dec 2022 07:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231520AbiLSMGT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Dec 2022 07:06:19 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BCCB27F;
        Mon, 19 Dec 2022 04:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671451540; x=1702987540;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NjOj/eD7MgtCr6kPlTqG1Vhb9exMYDrDhWCwdEBwL6I=;
  b=lYqtkm80xYLAqzSFJNKr6MIbak2VXPJcgGt71ci/NdwVb688hoRWUdRK
   MiuZnrh3gbr+JRs9qJryw7vw0KnyWKjNWHBHwz9n86roHo8MnUgCg1gxC
   pbmpqB9D+kweVQh7JwG4A6vum6iodDCqvRLQVBC8adrq5F34fopGaHLj5
   npEwpNcKqFjvYk6G8oshHbW+0d7GYBIHSuvHWUYpFr0mW2S8jDIqfHZAO
   VBnC9weaIAxK8Ytdmue4deIr7/35L3zrDhAgGtAt3SiF/pD4ySWG1Zc3A
   F6Q0WGFEUzT/bhhhDKzES2HEjbEkS6BSx9IVoLvJ3o82TEFeC3zKxLFr4
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="302758317"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="302758317"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 04:05:17 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10565"; a="824829004"
X-IronPort-AV: E=Sophos;i="5.96,255,1665471600"; 
   d="scan'208";a="824829004"
Received: from punajuuri.fi.intel.com (HELO paasikivi.fi.intel.com) ([10.237.72.43])
  by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2022 04:05:12 -0800
Received: from paasikivi.fi.intel.com (localhost [127.0.0.1])
        by paasikivi.fi.intel.com (Postfix) with SMTP id 5CBD62015F;
        Mon, 19 Dec 2022 14:05:10 +0200 (EET)
Date:   Mon, 19 Dec 2022 12:05:10 +0000
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Jai Luthra <j-luthra@ti.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] media: ov5640: Handle delays when no reset_gpio set
Message-ID: <Y6BTdlAg4IClm1jJ@paasikivi.fi.intel.com>
References: <20221216134409.6868-1-j-luthra@ti.com>
 <20221216134409.6868-2-j-luthra@ti.com>
 <Y5x5UbtLFDpFIoEp@paasikivi.fi.intel.com>
 <51ef1ff4-db3d-64aa-aa9d-82f604a314c1@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <51ef1ff4-db3d-64aa-aa9d-82f604a314c1@linaro.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Krzysztof,

On Fri, Dec 16, 2022 at 03:10:55PM +0100, Krzysztof Kozlowski wrote:
> On 16/12/2022 14:57, Sakari Ailus wrote:
> > Hi Jai,
> > 
> > Thanks for the set.
> > 
> > On Fri, Dec 16, 2022 at 07:14:07PM +0530, Jai Luthra wrote:
> >> Some module manufacturers [1][2] don't expose the RESETB gpio of the
> >> sensor directly through the 15-pin FFC connector. Instead wiring ~PWDN
> >> as a proxy reset with appropriate delays.
> >>
> >> In such cases, reset_gpio will not be available to the driver, but it
> >> will still be toggled when the sensor is powered on, and thus we should
> >> still honor the wait time of >= 5ms + 1ms + 20ms (see figure 2-3 in [3])
> >> before attempting any i/o operations over SCCB.
> >>
> >> [1] https://digilent.com/reference/_media/reference/add-ons/pcam-5c/pcam_5c_sch.pdf
> >> [2] https://www.alinx.com/public/upload/file/AN5641_User_Manual.pdf
> >> [3] https://cdn.sparkfun.com/datasheets/Sensors/LightImaging/OV5640_datasheet.pdf
> >>
> >> Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
> >> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> >> ---
> >>  drivers/media/i2c/ov5640.c | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> >> index e0f908af581b..4bb7bf557cfa 100644
> >> --- a/drivers/media/i2c/ov5640.c
> >> +++ b/drivers/media/i2c/ov5640.c
> >> @@ -2466,6 +2466,7 @@ static int ov5640_set_power_on(struct ov5640_dev *sensor)
> >>  
> >>  	ov5640_reset(sensor);
> >>  	ov5640_power(sensor, true);
> >> +	usleep_range(26000, 30000);
> > 
> > I think you should only do this if you don't have RESETB pin.
> > 
> > I'm not sure how to best describe this in DT. It's not the same as if you
> > didn't have RESETB GPIO.
> 
> Why it's not the same? I understand the RESETB pin is always there just
> sometimes going to GPIO and sometimes to some other line.

The end result is the same but it's only the PWDN GPIO that the driver
controls, and through some logic, that also controls the RESETB GPIO. The
end result may be the same but the driver isn't in control of this, so at
the very least a comment in the driver needs to be added to document this.

I'd just drop the check in the beginning of ov5640_reset().

Speaking of which --- it's unlikely the device needs to be power cycled to
reset it as it has a reset pin. Also ov5640_set_power_on() has an extra
call to ov5640_power(). These are not problems in this patch though.

-- 
Kind regards,

Sakari Ailus
