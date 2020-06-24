Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D15120707D
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 11:55:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390121AbgFXJzO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 05:55:14 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:55503 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2389015AbgFXJzN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 05:55:13 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o27UjtEQbx3Ajo27YjimTj; Wed, 24 Jun 2020 11:55:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592992510; bh=sXTRp63sJBpuUOf5lXyhThUaThxMsXaLxRlRX8FMtPw=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=DlmcRrZw0Xtai3y9wiI9RS5Pm++B+h1jyYdeWuI7z62Yaw2ek4eBCvtA/DcOV+A+o
         mdnN4gy0KuIAQd4DahkoLYaYQPD+P1F9SJ28oo9odv9T5Xu8HjqGqMpMb9RppFRbkC
         sbdJWhKI4mM42miJIeHtTDpLE3OexuPxzirgM7+xB80taSg49IhulXVdds2qGdJz/E
         pAZ1+UbL5wJFyRq0BmEnAVuiHIJAcHPJjcCnPSi2nkGu3LF+2lBi6fC1LDgbQ+eeM7
         OFy5STADTyFmO6dVut+T+Vrx5r7LEivefM2h4DzgWcAk4nzmOLs2ya0bPj/EJTV8tF
         r5mzjwaFMT6ng==
Subject: Re: [PATCH v5 03/10] media: i2c: ov6650: Use new
 [get|set]_mbus_config ops
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, linux-media@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20200616141244.49407-1-jacopo+renesas@jmondi.org>
 <20200616141244.49407-4-jacopo+renesas@jmondi.org> <1837100.yKVeVyVuyW@z50>
 <20200624081106.njf535vhbwb3fhwk@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9e0397f3-cb6d-53ea-78f2-b963d4e8f269@xs4all.nl>
Date:   Wed, 24 Jun 2020 11:55:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200624081106.njf535vhbwb3fhwk@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfFeROlS6VtJrvO2tb0k9tAMrCRAhuZaf0CUgdbLoK4Oz9fP+ncGTvZ+Rj9hfWzQetHDgL5OuNhHRQFrqie9PnLik+UfUO6MNlzMb0sLdhIbpvzdxsYkB
 Y/65dSpTTZT4OJLxxQN0DWLSxTF7o6U4M19YJRt4zgP+ABIzpobTjgh03xHF3S0wXOYzvGPnfwuEAIm/SmGap6fPL2qNsVdFlc/gEXewqBG3M4lhkRW5LBIZ
 oKQ+aZShL681mzXf1eUhixyfHCdHNbPaM4m90mstiJlWRvm8d3Pu26hbyLKyXHHiRvPPJWlJ4pHswBmlWwL4cErlLgOKsvtdDVflpKeLURP8gbfSfcVADPrV
 hGKuH49HWBsJWfLTmxrf9XRlRKgwUnQ5ZzMUpCa7r7zQIbd1C1liMUIuOR1f9FtdebxzGv9LvdAt8Ue5fLx4Yvbdv+VzSYvWKbk/uJlw5gPqPp0C3fBddD7a
 /LXMX+HQLPnfmLm5wVvoDQPgAlrNCOc4jDxsQ795ApVTkXnPgtpD/h8wQ7O9LpRHk7rpT2JWqJdhH9p2ciOIUtIADlrxb34QSaL+2EpakMuvbyNVyVIz3jXH
 KepOCn282hZa9CmTGOdh8WBkWwxZ08Gvk3ZQFBPNtDvNdQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2020 10:11, Jacopo Mondi wrote:
> Hello Janusz,
>    thanks for your quick reply
> 
> On Sun, Jun 21, 2020 at 01:38:46PM +0200, Janusz Krzysztofik wrote:
>> Hi Jacopo,
>>
>> Thanks for bringing my attention to this patch.
>>
>> On Tuesday, June 16, 2020 4:12:38 P.M. CEST Jacopo Mondi wrote:
>>> Use the new get_mbus_config and set_mbus_config pad operations in place
>>> of the video operations currently in use.
>>>
>>> Compared to other drivers where the same conversion has been performed,
>>> ov6650 proved to be a bit more tricky, as the existing g_mbus_config
>>> implementation did not report the currently applied configuration but
>>> the set of all possible configuration options.
>>
>> Assuming that was in line with officially supported semantics of the old API,
>> not a misinterpretation, I would really like to see that limitation of the new
>> API actually compensated with V4L2_SUBDEV_FORMAT_TRY support added to it.
>>
> 
> I'm not sure this is a limitation, it's more by design that the new
> get_mbus_config() only reports the current configuration.

Right. The old behavior was a left-over from the soc-camera driver that
required that. But soc-camera is from pre-device-tree times, and today this
information should come from the device tree.

> 
> To be honest, compared to the other users of the old g_mbus_config()
> this driver was the only one implementing the operation in this way,
> maybe as it's the sole user of s_mbus_config() left out of staging ?
> 
> I would however consider supporting FORMAT_TRY even if I'm not
> actually sure if fully makes sense. For the format operations
> (get/set_format()) FORMAT_TRY is used for concurrent applications to
> test a format without stepping on each other toes.
> get|set_mbus_config() are kAPI only, and I'm not sure we need to stay
> safe against concurrent configuration attempts... I'll think about
> this a bit more. Seems a development that could go on top, right ?

I wouldn't do this unless it turns out to be actually needed.

Regards,

	Hans

> 
>>>
>>> Adapt the driver to support the semantic of the two newly introducedV4L2_SUBDEV_FORMAT_TRY
>>> operations:
>>> - get_mbus_config reports the current media bus configuration
>>> - set_mbus_config applies only changes explicitly requested and updates
>>>   the provided cfg parameter to report what has actually been applied to
>>>   the hardware.
>>>
>>> Compile-tested only.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>  drivers/media/i2c/ov6650.c | 56 ++++++++++++++++++++++++++------------
>>>  1 file changed, 39 insertions(+), 17 deletions(-)
>>>
>>> diff --git a/drivers/media/i2c/ov6650.c b/drivers/media/i2c/ov6650.c
>>> index 91906b94f978..d2e7a8556ed7 100644
>>> --- a/drivers/media/i2c/ov6650.c
>>> +++ b/drivers/media/i2c/ov6650.c
>>> @@ -921,46 +921,68 @@ static const struct v4l2_subdev_core_ops ov6650_core_ops = {
>>>  };
>>>
>>>  /* Request bus settings on camera side */
>>> -static int ov6650_g_mbus_config(struct v4l2_subdev *sd,
>>> -				struct v4l2_mbus_config *cfg)
>>> +static int ov6650_get_mbus_config(struct v4l2_subdev *sd,
>>> +				  unsigned int pad,
>>> +				  struct v4l2_mbus_config *cfg)
>>>  {
>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>> +	u8 comj, comf;
>>> +	int ret;
>>> +
>>> +	ret = ov6650_reg_read(client, REG_COMJ, &comj);
>>> +	if (ret)
>>> +		return ret;
>>>
>>> -	cfg->flags = V4L2_MBUS_MASTER |
>>> -		V4L2_MBUS_PCLK_SAMPLE_RISING | V4L2_MBUS_PCLK_SAMPLE_FALLING |
>>> -		V4L2_MBUS_HSYNC_ACTIVE_HIGH | V4L2_MBUS_HSYNC_ACTIVE_LOW |
>>> -		V4L2_MBUS_VSYNC_ACTIVE_HIGH | V4L2_MBUS_VSYNC_ACTIVE_LOW |
>>> -		V4L2_MBUS_DATA_ACTIVE_HIGH;
>>> +	ret = ov6650_reg_read(client, REG_COMF, &comf);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	cfg->flags = V4L2_MBUS_MASTER
>>> +		   | ((comj & COMJ_VSYNC_HIGH)  ? V4L2_MBUS_VSYNC_ACTIVE_HIGH
>>> +						: V4L2_MBUS_VSYNC_ACTIVE_LOW)
>>> +		   | ((comf & COMF_HREF_LOW)    ? V4L2_MBUS_HSYNC_ACTIVE_LOW
>>> +						: V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>>> +		   | ((comj & COMJ_PCLK_RISING) ? V4L2_MBUS_PCLK_SAMPLE_RISING
>>> +						: V4L2_MBUS_PCLK_SAMPLE_FALLING);
>>
>> You probably missed hardware default V4L2_MBUS_DATA_ACTIVE_HIGH.
>>
> 
> Indeed I did :/
> 
> Thanks for spotting
> 
>>>  	cfg->type = V4L2_MBUS_PARALLEL;
>>>
>>>  	return 0;
>>>  }
>>>
>>>  /* Alter bus settings on camera side */
>>> -static int ov6650_s_mbus_config(struct v4l2_subdev *sd,
>>> -				const struct v4l2_mbus_config *cfg)
>>> +static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
>>> +				  unsigned int pad,
>>> +				  struct v4l2_mbus_config *cfg)
>>>  {
>>>  	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>> -	int ret;
>>> +	int ret = 0;
>>>
>>>  	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
>>>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
>>> -	else
>>> +	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
>>
>> Have you thought of extending v4l2_subdev_call_pad_wrappers with a check for
>> only one of mutually exclusive flags specified by user?
>>
> 
> Good question, but I wonder if this shouldn't be an accepted
> behaviour. The caller can provide all settings it want to allow the
> callee to chose which one to apply. The operation returns what has
> been actually applied by the callee, so that the caller can adjust
> itself to what the callee chose.
> 
> Alternatively, it's up to the caller to specify its preference without
> mutually exclusive options, and the callee tries to adjust to what has
> been requested. Also in this case the operation returns what has
> actually been applied, so the caller can later adjust if it could.
> 
> Seems like a small difference, but it might be good to exapnd the
> operations description to describe this to avoid each single
> implementer going in slightly different directions ?
> 
>>>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
>>>  	if (ret)
>>> -		return ret;
>>> +		goto error;
>>>
>>>  	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
>>>  		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
>>> -	else
>>> +	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
>>>  		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
>>>  	if (ret)
>>> -		return ret;
>>> +		goto error;
>>>
>>>  	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
>>>  		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
>>> -	else
>>> +	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
>>>  		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
>>>
>>> +error:
>>> +	/*
>>> +	 * Update the configuration to report what is actually applied to
>>> +	 * the hardware.
>>> +	 */
>>> +	ov6650_get_mbus_config(sd, pad, cfg);
>>
>> Populating cfg->flags by ov6650_get_mbus_config() without checking for a
>> potential error it may return can result in invalid data silently returned to
>> user.  Maybe it would be better to fetch current hardware status first, fail on
>> error, then update the result with successfully performed hardware state
>> modifications.
> 
> I'm not sure I got what you mean 8)
> 
> Would if be enough to check for the return value of
> ov6650_get_mbus_config() (or actually returning it directly at the end
> of this function).
> 
> Thanks
>    j
> 
>>
>> Thanks,
>> Janusz
>>
>>> +
>>>  	return ret;
>>>  }
>>>
>>> @@ -968,8 +990,6 @@ static const struct v4l2_subdev_video_ops ov6650_video_ops = {
>>>  	.s_stream	= ov6650_s_stream,
>>>  	.g_frame_interval = ov6650_g_frame_interval,
>>>  	.s_frame_interval = ov6650_s_frame_interval,
>>> -	.g_mbus_config	= ov6650_g_mbus_config,
>>> -	.s_mbus_config	= ov6650_s_mbus_config,
>>>  };
>>>
>>>  static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
>>> @@ -978,6 +998,8 @@ static const struct v4l2_subdev_pad_ops ov6650_pad_ops = {
>>>  	.set_selection	= ov6650_set_selection,
>>>  	.get_fmt	= ov6650_get_fmt,
>>>  	.set_fmt	= ov6650_set_fmt,
>>> +	.get_mbus_config = ov6650_get_mbus_config,
>>> +	.set_mbus_config = ov6650_set_mbus_config,
>>>  };
>>>
>>>  static const struct v4l2_subdev_ops ov6650_subdev_ops = {
>>>
>>
>>
>>
>>

