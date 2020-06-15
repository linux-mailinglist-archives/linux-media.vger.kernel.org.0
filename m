Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF43C1F921F
	for <lists+linux-media@lfdr.de>; Mon, 15 Jun 2020 10:47:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbgFOIrk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 15 Jun 2020 04:47:40 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:41628 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728593AbgFOIrk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 15 Jun 2020 04:47:40 -0400
Received: from [192.168.0.20] (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CBCFCF9;
        Mon, 15 Jun 2020 10:47:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1592210857;
        bh=CcR7t1UoqDzNpf8Tj529zMD/PKbW2l7toVxmK9rwpsE=;
        h=Reply-To:Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=sBgi/B81Np1/+e+U4P3jeP3NpxzkYGQxfkjdCrYeogl0I2cqWlhdh6pEz79jsceB4
         ayBNO3k6AG5Fow16Ot0FJsjTfceo+HcLoEmxPPEX2yNeuawG2mIsQJFfGLfcSooTGE
         yrJC05Jm6OHmyDXdLIghp7mOq0ruRgpYu+fOHVKs=
Reply-To: kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v4 9/9] media: rcar-csi2: Negotiate data lanes number
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        hverkuil-cisco@xs4all.nl, laurent.pinchart@ideasonboard.com,
        niklas.soderlund+renesas@ragnatech.se,
        dave.stevenson@raspberrypi.com, hyun.kwon@xilinx.com,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200611161651.264633-1-jacopo+renesas@jmondi.org>
 <20200611161651.264633-10-jacopo+renesas@jmondi.org>
 <20200615083405.GP16711@paasikivi.fi.intel.com>
 <20200615084306.intk7hmrf7qptsx6@uno.localdomain>
 <c2474a6e-e569-cc11-c30a-0fab94a2f32c@ideasonboard.com>
 <20200615084711.cmjx6w2so4dvmezn@uno.localdomain>
From:   Kieran Bingham <kieran.bingham@ideasonboard.com>
Autocrypt: addr=kieran.bingham@ideasonboard.com; keydata=
 mQINBFYE/WYBEACs1PwjMD9rgCu1hlIiUA1AXR4rv2v+BCLUq//vrX5S5bjzxKAryRf0uHat
 V/zwz6hiDrZuHUACDB7X8OaQcwhLaVlq6byfoBr25+hbZG7G3+5EUl9cQ7dQEdvNj6V6y/SC
 rRanWfelwQThCHckbobWiQJfK9n7rYNcPMq9B8e9F020LFH7Kj6YmO95ewJGgLm+idg1Kb3C
 potzWkXc1xmPzcQ1fvQMOfMwdS+4SNw4rY9f07Xb2K99rjMwZVDgESKIzhsDB5GY465sCsiQ
 cSAZRxqE49RTBq2+EQsbrQpIc8XiffAB8qexh5/QPzCmR4kJgCGeHIXBtgRj+nIkCJPZvZtf
 Kr2EAbc6tgg6DkAEHJb+1okosV09+0+TXywYvtEop/WUOWQ+zo+Y/OBd+8Ptgt1pDRyOBzL8
 RXa8ZqRf0Mwg75D+dKntZeJHzPRJyrlfQokngAAs4PaFt6UfS+ypMAF37T6CeDArQC41V3ko
 lPn1yMsVD0p+6i3DPvA/GPIksDC4owjnzVX9kM8Zc5Cx+XoAN0w5Eqo4t6qEVbuettxx55gq
 8K8FieAjgjMSxngo/HST8TpFeqI5nVeq0/lqtBRQKumuIqDg+Bkr4L1V/PSB6XgQcOdhtd36
 Oe9X9dXB8YSNt7VjOcO7BTmFn/Z8r92mSAfHXpb07YJWJosQOQARAQABtDBLaWVyYW4gQmlu
 Z2hhbSA8a2llcmFuLmJpbmdoYW1AaWRlYXNvbmJvYXJkLmNvbT6JAlcEEwEKAEECGwMFCwkI
 BwIGFQgJCgsCBBYCAwECHgECF4ACGQEWIQSQLdeYP70o/eNy1HqhHkZyEKRh/QUCXWTtygUJ
 CyJXZAAKCRChHkZyEKRh/f8dEACTDsbLN2nioNZMwyLuQRUAFcXNolDX48xcUXsWS2QjxaPm
 VsJx8Uy8aYkS85mdPBh0C83OovQR/OVbr8AxhGvYqBs3nQvbWuTl/+4od7DfK2VZOoKBAu5S
 QK2FYuUcikDqYcFWJ8DQnubxfE8dvzojHEkXw0sA4igINHDDFX3HJGZtLio+WpEFQtCbfTAG
 YZslasz1YZRbwEdSsmO3/kqy5eMnczlm8a21A3fKUo3g8oAZEFM+f4DUNzqIltg31OAB/kZS
 enKZQ/SWC8PmLg/ZXBrReYakxXtkP6w3FwMlzOlhGxqhIRNiAJfXJBaRhuUWzPOpEDE9q5YJ
 BmqQL2WJm1VSNNVxbXJHpaWMH1sA2R00vmvRrPXGwyIO0IPYeUYQa3gsy6k+En/aMQJd27dp
 aScf9am9PFICPY5T4ppneeJLif2lyLojo0mcHOV+uyrds9XkLpp14GfTkeKPdPMrLLTsHRfH
 fA4I4OBpRrEPiGIZB/0im98MkGY/Mu6qxeZmYLCcgD6qz4idOvfgVOrNh+aA8HzIVR+RMW8H
 QGBN9f0E3kfwxuhl3omo6V7lDw8XOdmuWZNC9zPq1UfryVHANYbLGz9KJ4Aw6M+OgBC2JpkD
 hXMdHUkC+d20dwXrwHTlrJi1YNp6rBc+xald3wsUPOZ5z8moTHUX/uPA/qhGsbkCDQRWBP1m
 ARAAzijkb+Sau4hAncr1JjOY+KyFEdUNxRy+hqTJdJfaYihxyaj0Ee0P0zEi35CbE6lgU0Uz
 tih9fiUbSV3wfsWqg1Ut3/5rTKu7kLFp15kF7eqvV4uezXRD3Qu4yjv/rMmEJbbD4cTvGCYI
 d6MDC417f7vK3hCbCVIZSp3GXxyC1LU+UQr3fFcOyCwmP9vDUR9JV0BSqHHxRDdpUXE26Dk6
 mhf0V1YkspE5St814ETXpEus2urZE5yJIUROlWPIL+hm3NEWfAP06vsQUyLvr/GtbOT79vXl
 En1aulcYyu20dRRxhkQ6iILaURcxIAVJJKPi8dsoMnS8pB0QW12AHWuirPF0g6DiuUfPmrA5
 PKe56IGlpkjc8cO51lIxHkWTpCMWigRdPDexKX+Sb+W9QWK/0JjIc4t3KBaiG8O4yRX8ml2R
 +rxfAVKM6V769P/hWoRGdgUMgYHFpHGSgEt80OKK5HeUPy2cngDUXzwrqiM5Sz6Od0qw5pCk
 NlXqI0W/who0iSVM+8+RmyY0OEkxEcci7rRLsGnM15B5PjLJjh1f2ULYkv8s4SnDwMZ/kE04
 /UqCMK/KnX8pwXEMCjz0h6qWNpGwJ0/tYIgQJZh6bqkvBrDogAvuhf60Sogw+mH8b+PBlx1L
 oeTK396wc+4c3BfiC6pNtUS5GpsPMMjYMk7kVvEAEQEAAYkCPAQYAQoAJgIbDBYhBJAt15g/
 vSj943LUeqEeRnIQpGH9BQJdizzIBQkLSKZiAAoJEKEeRnIQpGH9eYgQAJpjaWNgqNOnMTmD
 MJggbwjIotypzIXfhHNCeTkG7+qCDlSaBPclcPGYrTwCt0YWPU2TgGgJrVhYT20ierN8LUvj
 6qOPTd+Uk7NFzL65qkh80ZKNBFddx1AabQpSVQKbdcLb8OFs85kuSvFdgqZwgxA1vl4TFhNz
 PZ79NAmXLackAx3sOVFhk4WQaKRshCB7cSl+RIng5S/ThOBlwNlcKG7j7W2MC06BlTbdEkUp
 ECzuuRBv8wX4OQl+hbWbB/VKIx5HKlLu1eypen/5lNVzSqMMIYkkZcjV2SWQyUGxSwq0O/sx
 S0A8/atCHUXOboUsn54qdxrVDaK+6jIAuo8JiRWctP16KjzUM7MO0/+4zllM8EY57rXrj48j
 sbEYX0YQnzaj+jO6kJtoZsIaYR7rMMq9aUAjyiaEZpmP1qF/2sYenDx0Fg2BSlLvLvXM0vU8
 pQk3kgDu7kb/7PRYrZvBsr21EIQoIjXbZxDz/o7z95frkP71EaICttZ6k9q5oxxA5WC6sTXc
 MW8zs8avFNuA9VpXt0YupJd2ijtZy2mpZNG02fFVXhIn4G807G7+9mhuC4XG5rKlBBUXTvPU
 AfYnB4JBDLmLzBFavQfvonSfbitgXwCG3vS+9HEwAjU30Bar1PEOmIbiAoMzuKeRm2LVpmq4
 WZw01QYHU/GUV/zHJSFk
Organization: Ideas on Board
Message-ID: <30b2eab0-b544-6a55-f2c2-b2cc2aad55be@ideasonboard.com>
Date:   Mon, 15 Jun 2020 09:47:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200615084711.cmjx6w2so4dvmezn@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

On 15/06/2020 09:47, Jacopo Mondi wrote:
> Hi Kieran,
> 
> On Mon, Jun 15, 2020 at 09:40:42AM +0100, Kieran Bingham wrote:
>> Hi Jacopo,
>>
>> On 15/06/2020 09:43, Jacopo Mondi wrote:
>>> Hi Sakari,
>>>
>>> On Mon, Jun 15, 2020 at 11:34:06AM +0300, Sakari Ailus wrote:
>>>> Hi Jacopo,
>>>>
>>>> On Thu, Jun 11, 2020 at 06:16:51PM +0200, Jacopo Mondi wrote:
>>>>> Use the newly introduced get_mbus_config() subdevice pad operation to
>>>>> retrieve the remote subdevice MIPI CSI-2 bus configuration and configure
>>>>> the number of active data lanes accordingly.
>>>>>
>>>>> In order to be able to call the remote subdevice operation cache the
>>>>> index of the remote pad connected to the single CSI-2 input port.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>> ---
>>>>>  drivers/media/platform/rcar-vin/rcar-csi2.c | 61 ++++++++++++++++++++-
>>>>>  1 file changed, 58 insertions(+), 3 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/platform/rcar-vin/rcar-csi2.c b/drivers/media/platform/rcar-vin/rcar-csi2.c
>>>>> index 151e6a90c5fb..11769f004fd8 100644
>>>>> --- a/drivers/media/platform/rcar-vin/rcar-csi2.c
>>>>> +++ b/drivers/media/platform/rcar-vin/rcar-csi2.c
>>>>> @@ -363,6 +363,7 @@ struct rcar_csi2 {
>>>>>  	struct v4l2_async_notifier notifier;
>>>>>  	struct v4l2_async_subdev asd;
>>>>>  	struct v4l2_subdev *remote;
>>>>> +	unsigned int remote_pad;
>>>>>
>>>>>  	struct v4l2_mbus_framefmt mf;
>>>>>
>>>>> @@ -371,6 +372,7 @@ struct rcar_csi2 {
>>>>>
>>>>>  	unsigned short lanes;
>>>>>  	unsigned char lane_swap[4];
>>>>> +	unsigned short active_lanes;
>>>>
>>>> Do you need this? I.e. should you not always request this from the
>>>> transmitter device?
>>>
>>> It's actually the other way around. The receiver queries the
>>> transmitter to know how many data lanes it intends to use and adjusts
>>> its configuration to accommodate it.
>>>
>>>>
>>>>>  };
>>>>>
>>>>>  static inline struct rcar_csi2 *sd_to_csi2(struct v4l2_subdev *sd)
>>>>> @@ -414,7 +416,7 @@ static int rcsi2_wait_phy_start(struct rcar_csi2 *priv)
>>>>>
>>>>>  	/* Wait for the clock and data lanes to enter LP-11 state. */
>>>>>  	for (timeout = 0; timeout <= 20; timeout++) {
>>>>> -		const u32 lane_mask = (1 << priv->lanes) - 1;
>>>>> +		const u32 lane_mask = (1 << priv->active_lanes) - 1;
>>>>>
>>>>>  		if ((rcsi2_read(priv, PHCLM_REG) & PHCLM_STOPSTATECKL)  &&
>>>>>  		    (rcsi2_read(priv, PHDLM_REG) & lane_mask) == lane_mask)
>>>>> @@ -471,11 +473,57 @@ static int rcsi2_calc_mbps(struct rcar_csi2 *priv, unsigned int bpp)
>>>>>  	 * bps = link_freq * 2
>>>>>  	 */
>>>>>  	mbps = v4l2_ctrl_g_ctrl_int64(ctrl) * bpp;
>>>>> -	do_div(mbps, priv->lanes * 1000000);
>>>>> +	do_div(mbps, priv->active_lanes * 1000000);
>>>>>
>>>>>  	return mbps;
>>>>>  }
>>>>>
>>>>> +static int rcsi2_config_active_lanes(struct rcar_csi2 *priv)
>>>>> +{
>>>>> +	struct v4l2_mbus_config mbus_config = { 0 };
>>>>> +	unsigned int num_lanes = (-1U);
>>>>> +	int ret;
>>>>> +
>>>>> +	priv->active_lanes = priv->lanes;
>>>>> +	ret = v4l2_subdev_call(priv->remote, pad, get_mbus_config,
>>>>> +			       priv->remote_pad, &mbus_config);
>>>>> +	if (ret == -ENOIOCTLCMD) {
>>>>> +		dev_dbg(priv->dev, "No remote mbus configuration available\n");
>>>>> +		return 0;
>>>>> +	}
>>>>> +
>>>>> +	if (ret) {
>>>>> +		dev_err(priv->dev, "Failed to get remote mbus configuration\n");
>>>>> +		return ret;
>>>>> +	}
>>>>> +
>>>>> +	if (mbus_config.type != V4L2_MBUS_CSI2_DPHY) {
>>>>> +		dev_err(priv->dev, "Unsupported media bus type %u\n",
>>>>> +			mbus_config.type);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	if (mbus_config.flags & V4L2_MBUS_CSI2_1_LANE)
>>>>> +		num_lanes = 1;
>>>>> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_2_LANE)
>>>>> +		num_lanes = 2;
>>>>> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_3_LANE)
>>>>> +		num_lanes = 3;
>>>>> +	else if (mbus_config.flags & V4L2_MBUS_CSI2_4_LANE)
>>>>> +		num_lanes = 4;
>>>>
>>>> This is the downside of using flags... Anyway, I guess this is certainly
>>>> fine now.
>>>>
>>>
>>> Let's change this on top, if we like to (and I would like to :)
>>
>> That answers my question then ;-)
>>
> 
> There's been a discussion on one of the first version of the series
> where I tried replacing flags and introduced a union of structures
> with fields, most likely similar to what you suggested.
> 
> Based on the received comments I decided to use the existing
> V4L2_MBUS_* flags to ease the replacement of the video ops
> g|s_mbus_config() to minimize the changes. We could then on top
> replace flags.

That sound fine to me.

When I first saw this patch, I thought that this series was introducing
the V4L2_MBUS_CSI2_4_LANE flag types, but I see they are pre-existing.

I think it's perfectly reasonable to use the existing infrastructure for
this series, and adapt after.

--
Kieran



> 
> Thanks
>   j
> 
>> --
>> Kieran
>>
>>
>>>
>>> Thanks
>>>   j
>>>
>>>>> +
>>>>> +	if (num_lanes > priv->lanes) {
>>>>> +		dev_err(priv->dev,
>>>>> +			"Unsupported mbus config: too many data lanes %u\n",
>>>>> +			num_lanes);
>>>>> +		return -EINVAL;
>>>>> +	}
>>>>> +
>>>>> +	priv->active_lanes = num_lanes;
>>>>> +
>>>>> +	return 0;
>>>>> +}
>>>>> +
>>>>>  static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>>>>>  {
>>>>>  	const struct rcar_csi2_format *format;
>>>>> @@ -490,6 +538,11 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>>>>>  	/* Code is validated in set_fmt. */
>>>>>  	format = rcsi2_code_to_fmt(priv->mf.code);
>>>>>
>>>>> +	/* Get the remote mbus config to get the number of enabled lanes. */
>>>>> +	ret = rcsi2_config_active_lanes(priv);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>>>  	/*
>>>>>  	 * Enable all supported CSI-2 channels with virtual channel and
>>>>>  	 * data type matching.
>>>>> @@ -522,7 +575,7 @@ static int rcsi2_start_receiver(struct rcar_csi2 *priv)
>>>>>  	}
>>>>>
>>>>>  	phycnt = PHYCNT_ENABLECLK;
>>>>> -	phycnt |= (1 << priv->lanes) - 1;
>>>>> +	phycnt |= (1 << priv->active_lanes) - 1;
>>>>>
>>>>>  	mbps = rcsi2_calc_mbps(priv, format->bpp);
>>>>>  	if (mbps < 0)
>>>>> @@ -748,6 +801,7 @@ static int rcsi2_notify_bound(struct v4l2_async_notifier *notifier,
>>>>>  	}
>>>>>
>>>>>  	priv->remote = subdev;
>>>>> +	priv->remote_pad = pad;
>>>>>
>>>>>  	dev_dbg(priv->dev, "Bound %s pad: %d\n", subdev->name, pad);
>>>>>
>>>>> @@ -793,6 +847,7 @@ static int rcsi2_parse_v4l2(struct rcar_csi2 *priv,
>>>>>  			priv->lanes);
>>>>>  		return -EINVAL;
>>>>>  	}
>>>>> +	priv->active_lanes = priv->lanes;
>>>>>
>>>>>  	for (i = 0; i < ARRAY_SIZE(priv->lane_swap); i++) {
>>>>>  		priv->lane_swap[i] = i < priv->lanes ?
>>>>
>>>> --
>>>> Kind regards,
>>>>
>>>> Sakari Ailus
>>
>> --
>> Regards
>> --
>> Kieran

-- 
Regards
--
Kieran
