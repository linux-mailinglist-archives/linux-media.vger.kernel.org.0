Return-Path: <linux-media+bounces-7100-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1241C87C8DD
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 07:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3186A1F21D20
	for <lists+linux-media@lfdr.de>; Fri, 15 Mar 2024 06:50:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B8C014005;
	Fri, 15 Mar 2024 06:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="uOF1tiDl"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F018114003
	for <linux-media@vger.kernel.org>; Fri, 15 Mar 2024 06:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710485009; cv=none; b=icm+WBuAu505+JjEVruF/5C7h5nn7RBjG4vIQxxRfpagISngKWtpkH/UpRjAfWQkBBN9Rbx93FbSjrQgxvpamnfXfj80lYZX7Rj2LFRCZuil2lqlXQbjQOmQjYa5b1vcEP3v8VxVd63hqWpEPsOKrENvsGbeXoZEUkA5pnLfFps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710485009; c=relaxed/simple;
	bh=YWb36XWaxlwwwL/EDnVoKMRte2z3NDGGw0DTYOP73l0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rW+cQwhI+1O/3UkLQJOhbnnBd5cRVODro9iT4Cq9Ib4Opm5t5yao7ICmt2aCX6BYtfnFbdBwxE7tBrU89/tb+aDEo+H76INMlO281G3EfyfeImkTEtOLU5yT+0o10RqMMVwN/SS+VHsFpKM6/dNbYLBb/7qL6gotvyrC+RM6g78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=uOF1tiDl; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [192.168.1.105] (unknown [103.251.226.70])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3CEAAE4;
	Fri, 15 Mar 2024 07:42:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1710484981;
	bh=YWb36XWaxlwwwL/EDnVoKMRte2z3NDGGw0DTYOP73l0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uOF1tiDlT2wml151YU2Mr5g96AZzWfum4ZUUBji2408UYS+NYKmjKvQuF/spw+piv
	 uN8/gBpCFg9bd5iDV8Q1n9E4UvJhJrOYny6aH4MGfKSoZFYIzQU8QyjWsBxvJ3b/UX
	 ADwFBqMQirFFggqTuVktYjxcYtip0FCwFEk2Vv38=
Message-ID: <7b3724aa-04ac-463c-834a-3902fae4b505@ideasonboard.com>
Date: Fri, 15 Mar 2024 12:13:15 +0530
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: imx219: Use dev_err_probe on probe
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Tommaso Merciai <tomm.merciai@gmail.com>, linux-media@vger.kernel.org,
 dave.stevenson@raspberrypi.com, sakari.ailus@linux.intel.com,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
References: <20240311090042.30280-1-umang.jain@ideasonboard.com>
 <Ze7shcxM/v1+FHCm@tom-HP-ZBook-Fury-15-G7-Mobile-Workstation>
 <b949d192-9ea5-489a-91a9-2b055ec47b22@ideasonboard.com>
 <20240314152147.GB2441@pendragon.ideasonboard.com>
From: Umang Jain <umang.jain@ideasonboard.com>
In-Reply-To: <20240314152147.GB2441@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

HI Laurent,

On 14/03/24 8:51 pm, Laurent Pinchart wrote:
> Hi Umang,
>
> On Thu, Mar 14, 2024 at 06:51:04PM +0530, Umang Jain wrote:
>> On 11/03/24 5:05 pm, Tommaso Merciai wrote:
>>> On Mon, Mar 11, 2024 at 02:30:42PM +0530, Umang Jain wrote:
>>>> Drop dev_err() and use the dev_err_probe() helper on probe path.
>>>>
>>>> No functional changes intended.
>>>>
>>>> Signed-off-by: Umang Jain <umang.jain@ideasonboard.com>
>>>> ---
>>>>    drivers/media/i2c/imx219.c | 64 +++++++++++++++++++-------------------
>>>>    1 file changed, 32 insertions(+), 32 deletions(-)
>>>>
>>>> diff --git a/drivers/media/i2c/imx219.c b/drivers/media/i2c/imx219.c
>>>> index e17ef2e9d9d0..acd27e2ef849 100644
>>>> --- a/drivers/media/i2c/imx219.c
>>>> +++ b/drivers/media/i2c/imx219.c
>>>> @@ -551,8 +551,9 @@ static int imx219_init_controls(struct imx219 *imx219)
>>>>    
>>>>    	if (ctrl_hdlr->error) {
>>>>    		ret = ctrl_hdlr->error;
>>>> -		dev_err(&client->dev, "%s control init failed (%d)\n",
>>>> -			__func__, ret);
>>>> +		dev_err_probe(&client->dev, ret,
>>>> +			      "%s control init failed\n",
>>>> +			      __func__);
> ctrl_hdlr->error can never be -EPROBE_DEFER, is dev_err_probe() really
> useful here ?

is dev_err_probe() really /only/ about -EPROBE_DEFER ?  or all probe() 
errors?

The documentation is explicitly stating for dev_Err_probe()

```
  * Note that it is deemed acceptable to use this function for error
  * prints during probe even if the @err is known to never be -EPROBE_DEFER.
  * The benefit compared to a normal dev_err() is the standardized format
  * of the error code and the fact that the error code is returned.
  *

```
>
>>>>    		goto error;
>>>>    	}
>>>>    
>>>> @@ -1025,15 +1026,15 @@ static int imx219_identify_module(struct imx219 *imx219)
>>>>    
>>>>    	ret = cci_read(imx219->regmap, IMX219_REG_CHIP_ID, &val, NULL);
>>>>    	if (ret) {
>>>> -		dev_err(&client->dev, "failed to read chip id %x\n",
>>>> -			IMX219_CHIP_ID);
>>>> -		return ret;
>>>> +		return dev_err_probe(&client->dev, ret,
>>>> +				     "failed to read chip id %x\n",
>>>> +				     IMX219_CHIP_ID);
>>>>    	}
>>> I think you can remove also here the curve brakets we don't need that
>>> anymore.
>> I think multi-line single statement like this one, is better with { ...
>> } and is actually preferred?
>>
>> I actually got a review-comment about this long ago(don't remember when)
>> in a non-related, kernel patch series.
>>
>> I'll leaving this upto maintainers probably
> I think the preferred coding style in the media subsystem is to leave
> the curly brackets out for all single statements, even if the statement
> spans multiple lines.

ack
>
>>>>    
>>>>    	if (val != IMX219_CHIP_ID) {
>>>> -		dev_err(&client->dev, "chip id mismatch: %x!=%llx\n",
>>>> -			IMX219_CHIP_ID, val);
>>>> -		return -EIO;
>>>> +		return dev_err_probe(&client->dev, -EIO,
>>>> +				     "chip id mismatch: %x!=%llx\n",
>>>> +				     IMX219_CHIP_ID, val);
>>>>    	}
>>> ditto
>>>
>>>>    
>>>>    	return 0;
>>>> @@ -1048,35 +1049,36 @@ static int imx219_check_hwcfg(struct device *dev, struct imx219 *imx219)
>>>>    	int ret = -EINVAL;
>>>>    
>>>>    	endpoint = fwnode_graph_get_next_endpoint(dev_fwnode(dev), NULL);
>>>> -	if (!endpoint) {
>>>> -		dev_err(dev, "endpoint node not found\n");
>>>> -		return -EINVAL;
>>>> -	}
>>>> +	if (!endpoint)
>>>> +		return dev_err_probe(dev, -EINVAL, "endpoint node not found\n");
> Same here, what's the advantage of using dev_err_probe() when you
> hardcode the error value to something different than -EPROBE_DEFER ?
> Same below.
>
>>>>    
>>>>    	if (v4l2_fwnode_endpoint_alloc_parse(endpoint, &ep_cfg)) {
>>>> -		dev_err(dev, "could not parse endpoint\n");
>>>> +		dev_err_probe(dev, -EINVAL, "could not parse endpoint\n");
> This I like even less. -EINVAL is meaningless here, it's not even
> guaranteed to be the error code that the function will return.
>
>>>>    		goto error_out;
>>>>    	}
>>>>    
>>>>    	/* Check the number of MIPI CSI2 data lanes */
>>>>    	if (ep_cfg.bus.mipi_csi2.num_data_lanes != 2 &&
>>>>    	    ep_cfg.bus.mipi_csi2.num_data_lanes != 4) {
>>>> -		dev_err(dev, "only 2 or 4 data lanes are currently supported\n");
>>>> +		dev_err_probe(dev, -EINVAL,
>>>> +			      "only 2 or 4 data lanes are currently supported\n");
>>>>    		goto error_out;
>>>>    	}
>>>>    	imx219->lanes = ep_cfg.bus.mipi_csi2.num_data_lanes;
>>>>    
>>>>    	/* Check the link frequency set in device tree */
>>>>    	if (!ep_cfg.nr_of_link_frequencies) {
>>>> -		dev_err(dev, "link-frequency property not found in DT\n");
>>>> +		dev_err_probe(dev, -EINVAL,
>>>> +			      "link-frequency property not found in DT\n");
>>>>    		goto error_out;
>>>>    	}
>>>>    
>>>>    	if (ep_cfg.nr_of_link_frequencies != 1 ||
>>>>    	   (ep_cfg.link_frequencies[0] != ((imx219->lanes == 2) ?
>>>>    	    IMX219_DEFAULT_LINK_FREQ : IMX219_DEFAULT_LINK_FREQ_4LANE))) {
>>>> -		dev_err(dev, "Link frequency not supported: %lld\n",
>>>> -			ep_cfg.link_frequencies[0]);
>>>> +		dev_err_probe(dev, -EINVAL,
>>>> +			      "Link frequency not supported: %lld\n",
>>>> +			      ep_cfg.link_frequencies[0]);
>>>>    		goto error_out;
>>>>    	}
>>>>    
>>>> @@ -1108,30 +1110,27 @@ static int imx219_probe(struct i2c_client *client)
>>>>    
>>>>    	imx219->regmap = devm_cci_regmap_init_i2c(client, 16);
>>>>    	if (IS_ERR(imx219->regmap)) {
>>>> -		ret = PTR_ERR(imx219->regmap);
>>>> -		dev_err(dev, "failed to initialize CCI: %d\n", ret);
>>>> -		return ret;
>>>> +		return dev_err_probe(dev, PTR_ERR(imx219->regmap),
>>>> +				     "failed to initialize CCI\n");
>>>>    	}
>>> ditto
>>>
>>>>    
>>>>    	/* Get system clock (xclk) */
>>>>    	imx219->xclk = devm_clk_get(dev, NULL);
>>>>    	if (IS_ERR(imx219->xclk)) {
>>>> -		dev_err(dev, "failed to get xclk\n");
>>>> -		return PTR_ERR(imx219->xclk);
>>>> +		return dev_err_probe(dev, PTR_ERR(imx219->xclk),
>>>> +				     "failed to get xclk\n");
> This change makes sense, the clock provider may not have probed yet
> (even if it's quite unlikely).
>
>>>>    	}
>>> ditto
>>>
>>>>    
>>>>    	imx219->xclk_freq = clk_get_rate(imx219->xclk);
>>>>    	if (imx219->xclk_freq != IMX219_XCLK_FREQ) {
>>>> -		dev_err(dev, "xclk frequency not supported: %d Hz\n",
>>>> -			imx219->xclk_freq);
>>>> -		return -EINVAL;
>>>> +		return dev_err_probe(dev, -EINVAL,
>>>> +				     "xclk frequency not supported: %d Hz\n",
>>>> +				     imx219->xclk_freq);
>>>>    	}
>>> ditto
>>>
>>>>    
>>>>    	ret = imx219_get_regulators(imx219);
>>>> -	if (ret) {
>>>> -		dev_err(dev, "failed to get regulators\n");
>>>> -		return ret;
>>>> -	}
>>>> +	if (ret)
>>>> +		return dev_err_probe(dev, ret, "failed to get regulators\n");
> Same here.
>
>>>>    
>>>>    	/* Request optional enable pin */
>>>>    	imx219->reset_gpio = devm_gpiod_get_optional(dev, "reset",
>>>> @@ -1183,20 +1182,21 @@ static int imx219_probe(struct i2c_client *client)
>>>>    
>>>>    	ret = media_entity_pads_init(&imx219->sd.entity, 1, &imx219->pad);
>>>>    	if (ret) {
>>>> -		dev_err(dev, "failed to init entity pads: %d\n", ret);
>>>> +		dev_err_probe(dev, ret, "failed to init entity pads\n");
>>>>    		goto error_handler_free;
>>>>    	}
>>>>    
>>>>    	imx219->sd.state_lock = imx219->ctrl_handler.lock;
>>>>    	ret = v4l2_subdev_init_finalize(&imx219->sd);
>>>>    	if (ret < 0) {
>>>> -		dev_err(dev, "subdev init error: %d\n", ret);
>>>> +		dev_err_probe(dev, ret, "subdev init error\n");
>>>>    		goto error_media_entity;
>>>>    	}
>>>>    
>>>>    	ret = v4l2_async_register_subdev_sensor(&imx219->sd);
>>>>    	if (ret < 0) {
>>>> -		dev_err(dev, "failed to register sensor sub-device: %d\n", ret);
>>>> +		dev_err_probe(dev, ret,
>>>> +			      "failed to register sensor sub-device\n");
>>>>    		goto error_subdev_cleanup;
>>>>    	}
>>>>    


