Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8390C2B5E66
	for <lists+linux-media@lfdr.de>; Tue, 17 Nov 2020 12:34:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728023AbgKQLcC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 17 Nov 2020 06:32:02 -0500
Received: from mga14.intel.com ([192.55.52.115]:2951 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728006AbgKQLcC (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 17 Nov 2020 06:32:02 -0500
IronPort-SDR: PJrnSLWadOma2bXZ+vZQUYRWHoLGC+jA6NW91k8FbOF3DFZg0szUY9zrPu/Cv3IMX/Rmgs3xN2
 yb7z77OQojLA==
X-IronPort-AV: E=McAfee;i="6000,8403,9807"; a="170122969"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="170122969"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 03:32:01 -0800
IronPort-SDR: hEmL0BRF7Y5YhjgGm/koa49SKCoiuPbl/OGMlG40XiZXnrpW078t2r7Pw9tkaroBmadXF1lfE1
 WXLTVzytuuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="358859645"
Received: from ipu5-build.bj.intel.com (HELO [10.238.232.196]) ([10.238.232.196])
  by fmsmga004.fm.intel.com with ESMTP; 17 Nov 2020 03:31:59 -0800
Subject: Re: [PATCH] media: i2c: Add ov9734 image sensor driver
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Bingbu Cao <bingbu.cao@intel.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        senozhatsky@chromium.org, tfiga@chromium.org,
        tian.shu.qiu@intel.com
References: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
 <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain>
From:   Bingbu Cao <bingbu.cao@linux.intel.com>
Message-ID: <439d549d-1069-cd35-4c18-586ba4e52756@linux.intel.com>
Date:   Tue, 17 Nov 2020 19:29:08 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sergey, thanks for review.

On 11/17/20 4:07 PM, Sergey Senozhatsky wrote:
> On (20/10/29 10:59), Bingbu Cao wrote:
> [..]
> 
> Looks good to me,
> Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
> 
> Several comments below.
> 
>> +static int ov9734_set_ctrl(struct v4l2_ctrl *ctrl)
>> +{
>> +	struct ov9734 *ov9734 = container_of(ctrl->handler,
>> +					     struct ov9734, ctrl_handler);
>> +	struct i2c_client *client = v4l2_get_subdevdata(&ov9734->sd);
>> +	s64 exposure_max;
>> +	int ret = 0;
>> +
>> +	/* Propagate change of current control to all related controls */
>> +	if (ctrl->id == V4L2_CID_VBLANK) {
>> +		/* Update max exposure while meeting expected vblanking */
>> +		exposure_max = ov9734->cur_mode->height + ctrl->val -
>> +			OV9734_EXPOSURE_MAX_MARGIN;
>> +		__v4l2_ctrl_modify_range(ov9734->exposure,
>> +					 ov9734->exposure->minimum,
>> +					 exposure_max, ov9734->exposure->step,
>> +					 exposure_max);
>> +	}
> 
> Should this be done after pm_runtime_get_if_in_use()?

My inaccurate understanding - as v4l2 see that this control was set by sub-device without error,
so it will record the value from the user as the new value, so update the exposure range to
allow user to set the exposure as well even it did not take affect.

Sakari, do you have any comments about this?

> 
>> +	/* V4L2 controls values will be applied only when power is already up */
>> +	if (!pm_runtime_get_if_in_use(&client->dev))
>> +		return 0;
>> +
> 
> Here.
> 
> [..]
> 
>> +static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
>> +{
>> +	struct ov9734 *ov9734 = to_ov9734(sd);
>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>> +	int ret = 0;
>> +
>> +	if (ov9734->streaming == enable)
>> +		return 0;
>> +
>> +	mutex_lock(&ov9734->mutex);
>> +	if (enable) {
>> +		ret = pm_runtime_get_sync(&client->dev);
>> +		if (ret < 0) {
>> +			pm_runtime_put_noidle(&client->dev);
>> +			mutex_unlock(&ov9734->mutex);
>> +			return ret;
>> +		}
>> +
>> +		ret = ov9734_start_streaming(ov9734);
>> +		if (ret) {
>> +			enable = 0;
>> +			ov9734_stop_streaming(ov9734);
>> +			pm_runtime_put(&client->dev);
>> +		}
>> +	} else {
>> +		ov9734_stop_streaming(ov9734);
>> +		pm_runtime_put(&client->dev);
>> +	}
> 
> I assume that we will never see erroneous ->s_stream(0) calls or
>  ->s_stream(0) after unsuccessful ->s_stream(1). Otherwise we will
> do extra pm_runtime_put(), not matched by pm_runtime_get().
> 
> 	-ss
> 

-- 
Best regards,
Bingbu Cao
