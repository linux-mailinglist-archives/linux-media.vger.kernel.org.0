Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B276C227979
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726749AbgGUH2R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:28:17 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:60413 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726389AbgGUH2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:28:17 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xmhAjfHvZNPeYxmhBjsDZn; Tue, 21 Jul 2020 09:28:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595316493; bh=YwcBbMTCArrhKgnmEEbsi1zljdzghYBLVsinqRd+6HU=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=qpxl/g/PSJzsqtJtO/KUPRhaELRv4jdp9aGL//scoD5Ipgp09lY/59+wR9yTH2SGl
         GqRKd9utxC9GrnuMxC3tpeTuDsJEzPgXSySoYCZzPcFMlFmFx60au7KZnrcy8OHEzh
         /2KIqRsSZsvQN30VK9XMXY6s3BFUQNrOcnrD6s4u+mIHIYOGtF3dN0ho3LPeaE9vFw
         ykCEe7Q6SA7ysZM5yc+GmpZJKZQqur9ub5ZhCaRUUdL+RnGbKtiUjnG/mk/h9Bf/eT
         Vg4VTHHlxLuoBqQMIlMC6cdnloiufyvdo89mr2rdyd0iBMQVGAJBbxdSvH6mYurjYd
         WPEvTvrs/cj8A==
Subject: Re: [PATCH v7 01/10] media: v4l2-subdev: Introduce
 [get|set]_mbus_config pad ops
To:     Jacopo Mondi <jacopo@jmondi.org>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     mchehab@kernel.org, sakari.ailus@linux.intel.com,
        laurent.pinchart@ideasonboard.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200716142713.110655-1-jacopo+renesas@jmondi.org>
 <22470298.ouqheUzb2q@z50> <20200720155650.uvnyjzx4nbten3vt@uno.localdomain>
 <1974407.bB369e8A3T@z50> <20200721072724.azy2hmo5j3dp76o4@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <9eee40cc-56ed-b227-1390-791680fd8850@xs4all.nl>
Date:   Tue, 21 Jul 2020 09:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200721072724.azy2hmo5j3dp76o4@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfEcJdFwNGY6IqF2FiwIo3tmoNuKcaGjMyvPVJ+qd0cxjnqJn2GSV0WsWJu2dwHhcRjS+VD2uCrd0oFwsL309KcbF1Amv7oqVjdqJvIYcCJPsCy/k5ryb
 F5aE2J6oqhTvBOvw9HYNB2jZq7q8zzrniF35nxVLI0sX1Hi6DSvWEKe48jg12eVxkBjZCdAesfTAZ2SHYyXcdo3eEIshjSYBVHHyR8Z7bE7qd/3j1Q/D4cPL
 sQBnDsIPv6S9diCP0G/TJN4GOXjijPZzG1ssyKOeojsnV8JvWt2I5aSfj516PaZKmz+cGb+zct3UQUPa6GZibOUG7JCYtc3p5Fo8e7NgIgRSYnGYe+g6pQGY
 xwyClIzbtDgrf1rlWnkcKzUYC7AmERexY8IfvzbM96vRzB2YrMUgR6KQOs4l38+CaFHrancBtSWjeD1SrGK8DsINpK94zvzf5dRN0LMsPKxWGqm/8/B4ZJj0
 scdMG8VocXcGI7KfxES++KZ/QVUCBh3fDfEPJ/QLopgpfvVBcEHKB2ypbXudF9VtBIIJQvVsNqBlmmQgC4Y09i0sG9ctnuxf6AWPmRbUD5DD4ih6BaaraSO3
 G+1haBX9gY3CaHx+c9ueIb0qat80ArWrua6T+bxF+2xm8f8WVJPjEdyyL5X1LGpXo0IqoLlnNNGc03FTJMamN/nOGjdWy1/V2lE0UZH1PhtvM8l49vp+mh7M
 oxqRml803F0M3kejQIkgVVgO1Vm7ndV6m0C5ApHq2wYa8OrAaSZEow==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 21/07/2020 09:27, Jacopo Mondi wrote:
> Hi Janusz,
> 
> On Mon, Jul 20, 2020 at 09:04:38PM +0200, Janusz Krzysztofik wrote:
>> On Monday, July 20, 2020 5:56:50 P.M. CEST Jacopo Mondi wrote:
>>> Hi Janusz,
>>>
>>> On Sat, Jul 18, 2020 at 01:23:24AM +0200, Janusz Krzysztofik wrote:
>>>> Hi Jacopo,
>>>>
>>>> On Friday, July 17, 2020 9:20:18 A.M. CEST Jacopo Mondi wrote:
>>>>> Hi Janusz,
>>>>>   thanks for review
>>>>>
>>>>> On Fri, Jul 17, 2020 at 12:15:27AM +0200, Janusz Krzysztofik wrote:
>>>>>> Hi Jacopo,
>>>>>>
>>>>>> On Thursday, July 16, 2020 4:27:04 P.M. CEST Jacopo Mondi wrote:
>>>>>>> Introduce two new pad operations to allow retrieving and configuring
>> the
>>>>>>> media bus parameters on a subdevice pad.
>>>>>>>
>>>>>>> The newly introduced operations aims to replace the s/g_mbus_config
>> video
>>>>>>> operations, which have been on their way for deprecation since a
>> long
>>>>>>> time.
>>>>>>>
>>>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>>>> ---
>>>>>>>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
>>>>>>>  1 file changed, 27 insertions(+)
>>>>>>>
>>>>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-
>> subdev.h
>>>>>>> index f7fe78a6f65a..d8b9d5735307 100644
>>>>>>> --- a/include/media/v4l2-subdev.h
>>>>>>> +++ b/include/media/v4l2-subdev.h
>>>>>>> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
>>>>>>>   *
>>>>>>>   * @set_frame_desc: set the low level media bus frame parameters,
>> @fd array
>>>>>>>   *                  may be adjusted by the subdev driver to device
>> capabilities.
>>>>>>> + *
>>>>>>> + * @get_mbus_config: get the media bus configuration of a remote sub-
>> device.
>>>>>>> + *		     The media bus configuration is usually retrieved
>> from the
>>>>>>> + *		     firmware interface at sub-device probe time,
>> immediately
>>>>>>> + *		     applied to the hardware and eventually adjusted
>> by the
>>>>>>> + *		     driver. Remote sub-devices (usually video
>> receivers) shall
>>>>>>> + *		     use this operation to query the transmitting
>> end bus
>>>>>>> + *		     configuration in order to adjust their own one
>> accordingly.
>>>>>>> + *		     Callers should make sure they get the most up-
>> to-date as
>>>>>>> + *		     possible configuration from the remote end,
>> likely calling
>>>>>>> + *		     this operation as close as possible to stream
>> on time. The
>>>>>>> + *		     operation shall fail if the pad index it has
>> been called on
>>>>>>> + *		     is not valid.
>>>>>>> + *
>>>>>>> + * @set_mbus_config: set the media bus configuration of a remote sub-
>> device.
>>>>>>> + *		     This operations is intended to allow, in
>> combination with
>>>>>>> + *		     the get_mbus_config operation, the negotiation
>> of media bus
>>>>>>> + *		     configuration parameters between media sub-
>> devices. The
>>>>>>> + *		     operation shall not fail if the requested
>> configuration is
>>>>>>> + *		     not supported, but the driver shall update the
>> content of
>>>>>>> + *		     the %config argument to reflect what has been
>> actually
>>>>>>> + *		     applied to the hardware. The operation shall
>> fail if the
>>>>>>> + *		     pad index it has been called on is not valid.
>>>>>
>>>>> First of all, Hans sent a pull request for this series yesterday. Are
>>>>> you ok with that and with sending patches on top, or do you think the
>>>>> inclusion of the series should be post-poned ? (you can imagine what
>>>>> my preference is :)
>>>>>
>>>>>>
>>>>>> Could this description also clarify what results are expected in case
>> of
>>>>>> hardware errors?  The ov6650 implementation you propose may suggest
>> such
>>>>>> errors may be expected to be ignored silently as long as current
>> configuration
>>>>>> can be successfully obtained from hardware and passed back to the
>> caller.
>>>>>
>>>>> I guess "it depends"(tm)
>>>>> I know this doesn't sound like a good answer :)
>>>>>
>>>>> A failure in applying or reading register likely means the driver is
>>>>> trying to access the hardware while it is in low power state. In this
>>>>> case I would consider this a driver bug, as it should try to be smart
>>>>> and cache settings and apply them at the proper time and return the
>>>>> current configuration, which should be cached as well.
>>>>>
>>>>> Of course things could go wrong for several reasons, and in the case
>>>>> if any unexpected error occurs I think an error is expected to be
>>>>> reported. Please note that this v7 of ov6650 does that by returning
>>>>> the return value of ov6650_get_mbus_config() at the end of
>>>>> ov6650_set_mbus_config.
>>>>
>>>> Current configuration is not cached in your implementation proposed for
>> ov6650.
>>>> If it was, would ov6650_set_mbus_config() always succeed, just passing it
>> back
>>>> updated with successful writes and ignoring write errors?  In other words,
>>>> is this the expected behavior of .set_mbus_config() to always treat
>>>> unsuccessful writes as recoverable errors and never report them to the
>> caller
>>>> as long as there is a current configuration available that can passed back?
>>>
>>> I don't see that driver implementing any sort of power ref-counting at
>>> the moment... In example s_ftm goes to the register without actually
>>> making sure the chip is powered or not.
>>>
>>> I guess this is /fine/, currently there's a big confusion in the i2c
>>> sensor drivers land on where this has to be implemented... However
>>> this is a 'legacy' driver, with no media controller support and no
>>> devnode exposed to userspace, so I guess the bridge driver is in
>>> charge of making sure it interacts with the sensor after s_power(1)
>>> has been called.
>>>
>>> Modern sensor drivers, which use runtime_pm and implement the
>>> VIDIOC_SUBDEV_ API to userspace, are expected to handle power properly
>>> as they can receive  calls from applications at any time. The most
>>> trivial solution would be to power up the sensor at fops.open() time
>>> and keep it powered, but that's clearly a waste, hence if the driver
>>> implements a smarter power management scheme it should take care of
>>> caching, as it would do for formats and controls.
>>>
>>> Does that make sense to you ?
>>
>> I still think hardware errors should be returned, not ignored, regardless of
>> power management support level.  Ignoring them can be confusing.  Specific
>> configuration requests shouldn't be able to give different results while still
>> returning success when hardware errors occur, I believe.  And that would be
>> the case with your ov6650 implementation if for example writes were failing
>> sporadically and reads always succeeding.
>>
>> Unless such behavior is really expected from pad operations, and that's what
>> my question was about.
> 
> Oh I see what you mean! I was sure I was returning errors on failed
> writes :/
> 
> I will send a 8.1 soon and it will look like this
> 
> /* Alter bus settings on camera side */
> static int ov6650_set_mbus_config(struct v4l2_subdev *sd,
> 				  unsigned int pad,
> 				  struct v4l2_mbus_config *cfg)
> {
> 	struct i2c_client *client = v4l2_get_subdevdata(sd);
> 	int ret = 0;
> 
> 	if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_RISING)
> 		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_PCLK_RISING, 0);
> 	else if (cfg->flags & V4L2_MBUS_PCLK_SAMPLE_FALLING)
> 		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_PCLK_RISING);
> 	if (ret)
> 		return ret;
> 
> 	if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_LOW)
> 		ret = ov6650_reg_rmw(client, REG_COMF, COMF_HREF_LOW, 0);
> 	else if (cfg->flags & V4L2_MBUS_HSYNC_ACTIVE_HIGH)
> 		ret = ov6650_reg_rmw(client, REG_COMF, 0, COMF_HREF_LOW);
> 	if (ret)
> 	        return ret;
> 
> 	if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_HIGH)
> 		ret = ov6650_reg_rmw(client, REG_COMJ, COMJ_VSYNC_HIGH, 0);
> 	else if (cfg->flags & V4L2_MBUS_VSYNC_ACTIVE_LOW)
> 		ret = ov6650_reg_rmw(client, REG_COMJ, 0, COMJ_VSYNC_HIGH);
> 	if (ret)
> 	        return ret;
> 
> 	/*
> 	 * Update the configuration to report what is actually applied to
> 	 * the hardware.
> 	 */
> 	return ov6650_get_mbus_config(sd, pad, cfg);
> }
> 
> Sorry about this, I should have noticed that you where suggesting
> s/goto error/return ret/ and not just to return the get_mbus_config()
> return value at function end.
> 
> v8.1 of this patch soon.
> 
> Hans sorry for the churn. Do you think you can still collect this
> today, maybe with Janusz's ack if he feels to ?

Sure!

	Hans
