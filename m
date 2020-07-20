Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 20E79225A53
	for <lists+linux-media@lfdr.de>; Mon, 20 Jul 2020 10:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgGTIsm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jul 2020 04:48:42 -0400
Received: from lb2-smtp-cloud8.xs4all.net ([194.109.24.25]:55927 "EHLO
        lb2-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726030AbgGTIsm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jul 2020 04:48:42 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xRTQjXJsGNPeYxRTRjmVSv; Mon, 20 Jul 2020 10:48:39 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595234919; bh=DEBkAI7wl9tcjqhkoKYz4MQGietWlpYgtiai/UuXJdg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=dpD+LbtkfSP4pSbBYXulW6bmGptdg9FLQvWpCS/NBWKx5Bcs0BmkEq2FjGBgWvzY5
         TNImcgzkgQDDiu2vL2Bacsr501Mbpcy2pl/POzb4aFDXSdvKhcHXdFvEm8T7uTAQt2
         OIuoGc0XWlafbSUzaH447JLfDP7T2ovLIsxFuI6wEHcKdtb+jU+tet1Ka2PygF4LiV
         kntA8qe09rcvWrEDSGdtCNgsTFATGn7H3sb2jS+IBVDbubNBxMxisnXkxJzQuY2tXP
         oGkoAF3VUhbZwKB4NXxO0HB1EevYACNWGOUNOnXZwCG8MukbgGw4vVyvw17qsJ4Bjc
         6BL4I0vPDXRbw==
Subject: Re: [PATCH v6 1/9] media: v4l2-subdev: Introduce
 [get|set]_mbus_config pad ops
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>, mchehab@kernel.org,
        sakari.ailus@linux.intel.com, laurent.pinchart@ideasonboard.com
Cc:     niklas.soderlund+renesas@ragnatech.se,
        kieran.bingham@ideasonboard.com, dave.stevenson@raspberrypi.com,
        hyun.kwon@xilinx.com, robert.jarzmik@free.fr,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20200714135812.55158-1-jacopo+renesas@jmondi.org>
 <20200714135812.55158-2-jacopo+renesas@jmondi.org>
 <750089f9-0e7f-3b2a-ec85-38452cb64fa1@xs4all.nl> <4043309.ejJDZkT8p0@z50>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <f60dc28c-ac30-0ddc-efb5-62b22d4cbaa7@xs4all.nl>
Date:   Mon, 20 Jul 2020 10:48:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <4043309.ejJDZkT8p0@z50>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfK7hWSke/7Amluk0S7ePNTn5Q3CdhMlsFd3m6xSonV/a+SEhwnKEiADwtuiVyy4PpJYNzeJ6TzN/x7ODxKLSfDXO9ILusoME0DJNcv/qjBIkgcTIcD6c
 c31rp5OazT8S+XygXz0f3QFdXBWE2Z7koBGxfh9VXS94j3VV0JUNoED5j2IMo5M+Rn9Pss6bZtl0hC3ON0u/Z01lm20O/zZ/dEyf4u+xCpr5+cg2rcA2rC66
 ApSUj5HHuJMnrZTWicj7kXHoAJZClhUsEsNacPP3G6oHTuIaO20u6bjiyUODM7QpR6o4ghMPYf7SfwN0KEFSenJVuxc6jnFUKpcJwH8vawSDee8gANJtDxBH
 VMQ1O0yyrn4CiRINY5DUso4+opD0yOsrf8J3bUzYNVxuuByjlChglbvFjE/FawZnywvf8AxKpCBMhssIFtrrVUTwUU1Sf5qPUiS6O9RuGoON0RvmQLrOYRPd
 Ow7g1LIHZR3DCwWNVkbtcaw7vOOlhRrseb92eBRYsc81daE+FNl48kwhGs/UxRaes8q7yyLyv4VXPPOMfnI/nbhh9Cjgbg5jyMW0V6bM+vMEcbEqJ7SsxrKl
 G6QEI2BL5d/gyxjLwKApJjubMUcBlV2NcAvFP/gS+j+GdX3+MOZRy3I/STjO6EQw///SqlQYRkdD15zj4xW6qviEA6wJkIPVmbOhvRmn4514vnoaby41Ywe4
 NhNX6KcFShp43aeQPKVIxf2VKaNYQZn7
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19/07/2020 13:18, Janusz Krzysztofik wrote:
> Hi Hans,
> 
> On Wednesday, July 15, 2020 5:08:05 P.M. CEST Hans Verkuil wrote:
>> On 14/07/2020 15:58, Jacopo Mondi wrote:
>>> Introduce two new pad operations to allow retrieving and configuring the
>>> media bus parameters on a subdevice pad.
>>>
>>> The newly introduced operations aims to replace the s/g_mbus_config video
>>> operations, which have been on their way for deprecation since a long
>>> time.
>>>
>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>> ---
>>>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
>>>  1 file changed, 27 insertions(+)
>>>
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index f7fe78a6f65a..d8b9d5735307 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
>>>   *
>>>   * @set_frame_desc: set the low level media bus frame parameters, @fd array
>>>   *                  may be adjusted by the subdev driver to device capabilities.
>>> + *
>>> + * @get_mbus_config: get the media bus configuration of a remote sub-device.
>>> + *		     The media bus configuration is usually retrieved from the
>>> + *		     firmware interface at sub-device probe time, immediately
>>> + *		     applied to the hardware and eventually adjusted by the
>>> + *		     driver. Remote sub-devices (usually video receivers) shall
>>> + *		     use this operation to query the transmitting end bus
>>> + *		     configuration in order to adjust their own one accordingly.
>>> + *		     Callers should make sure they get the most up-to-date as
>>> + *		     possible configuration from the remote end, likely calling
>>> + *		     this operation as close as possible to stream on time. The
>>> + *		     operation shall fail if the pad index it has been called on
>>> + *		     is not valid.
>>> + *
>>> + * @set_mbus_config: set the media bus configuration of a remote sub-device.
>>> + *		     This operations is intended to allow, in combination with
>>> + *		     the get_mbus_config operation, the negotiation of media bus
>>> + *		     configuration parameters between media sub-devices. The
>>> + *		     operation shall not fail if the requested configuration is
>>> + *		     not supported, but the driver shall update the content of
>>> + *		     the %config argument to reflect what has been actually
>>> + *		     applied to the hardware. The operation shall fail if the
>>> + *		     pad index it has been called on is not valid.
>>>   */
>>
>> Hm, I'd hoped I could merge this, but I think include/media/v4l2-mediabus.h
>> also needs to be updated.
>>
>> So the old g_mbus_config returned all supported configurations, while the
>> new get_mbus_config returns the *current* configuration.
>>
>> That's fine, but that means that the meaning of the struct v4l2_mbus_config
>> flags field changes as well and several comments in v4l2-mediabus.h need to
>> be updated to reflect this.
>>
>> E.g. instead of '/* How many lanes the client can use */' it becomes
>> '/* How many lanes the client uses */'.
>>
>> Frankly, these flags can be redesigned now since you only need a single
>> e.g. V4L2_MBUS_HSYNC_ACTIVE_HIGH flag since if it is not set, then that
>> means ACTIVE_LOW. And since it is now a single bit, it is also easy to
>> make each flag a bit field.
> 
> Even if this makes sense for .get_mbus_config() which returns current 
> configuration, how about keeping the old semantics of the flags and let 
> .set_mbus_config() accept a potentially incomplete or redundant set of flags 
> specified by the caller to select a supported configuration from?  That approach 
> was actually proposed before by Jacopo when he argued against my suggestion to 
> add a wrapper with a check for mutually exclusive flags[1], and I found it a 
> very good alternative to my other rejected suggestion of adding TRY support.

The information on how a sensor (or similar device) is wired up is not something
that should be negotiated. Even if a combination is theoretically possible, it
may not have been tested by the board designer and in fact it might not work.
(Yes, that happens)

It is just a bad design trying to negotiate this.

In fact, the only values that can be set as far as I am concerned are lanes and
channels. I wouldn't mind if the other settings are purely read-only. The only
driver that actively sets this is the pxa_camera driver and I wish it didn't.

But there are still two pxa boards that use this mechanism, so I guess we still
have to allow this.

Anyway, do you have a specific use-case in mind? Note that this is an internal
API, so it can always be changed later.

Regards,

	Hans

> 
> [1] https://www.spinics.net/lists/linux-media/msg171878.html
> 
> Thanks,
> Janusz
> 
>>
>> The CSI2 lanes/channels can just be a bit field for the number of lanes/channels,
>> which is much easier to read. I strongly recommend making this change at the minimum.
>>
>> Now all this can be done in a follow-up series, but the v4l2-mediabus.h
>> definitely needs to be updated to reflect the new code.
>>
>> This can be done as a v6 5.5/9 patch (since it should come right after the
>> g/s_mbus_config removal).
>>
>> Regards,
>>
>> 	Hans
>>
>>>  struct v4l2_subdev_pad_ops {
>>>  	int (*init_cfg)(struct v4l2_subdev *sd,
>>> @@ -710,6 +733,10 @@ struct v4l2_subdev_pad_ops {
>>>  			      struct v4l2_mbus_frame_desc *fd);
>>>  	int (*set_frame_desc)(struct v4l2_subdev *sd, unsigned int pad,
>>>  			      struct v4l2_mbus_frame_desc *fd);
>>> +	int (*get_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>>> +			       struct v4l2_mbus_config *config);
>>> +	int (*set_mbus_config)(struct v4l2_subdev *sd, unsigned int pad,
>>> +			       struct v4l2_mbus_config *config);
>>>  };
>>>  
>>>  /**
>>>
>>
>>
> 
> 
> 
> 

