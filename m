Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55D22223657
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 09:57:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGQH51 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 03:57:27 -0400
Received: from lb3-smtp-cloud9.xs4all.net ([194.109.24.30]:33577 "EHLO
        lb3-smtp-cloud9.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726101AbgGQH51 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 03:57:27 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud9.xs4all.net with ESMTPA
        id wLF8js8oMZ80HwLFBjWSNW; Fri, 17 Jul 2020 09:57:24 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1594972644; bh=QLGiGhkoqTtaz6WVASvubUBFehGM34hPR9IGhVgb6/4=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TY5UgLHy4SVPrb9EYqdAaCK7V/ORzGM0PzckXjJyUDDPn5L2qeB+0CdxwGXd8TyJv
         znTYeNXEECJ8KsOc3s4zQMY6HRgBGzIHF/kXvM6R4FdN3d+WGjcg7Dm6fBgTn2WuLT
         Np5X5K/7+cI5DOMsI9ghe5ofYUXBUnM0lEXMGgIQuUUtZlF/rv/1jFBWGdSQ+TUshr
         Uke2o/ra+/WdSHoQKLgtqeL55z7O8hEFJKuFNdQ31MsP34kvqfbXuJbnqiW0mebemg
         lMVQ2B1lhm9tS47JbxE4K5Bh9kihO1x1sdI4Fs3BfGX2PTAdasBK2bfQLZinO1rl+B
         e31g5mX52dWDw==
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
 <20200716142713.110655-2-jacopo+renesas@jmondi.org> <4042930.ejJDZkT8p0@z50>
 <20200717072018.crgmvfrm44kgmvcb@uno.localdomain>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <e6bb5215-1194-38bf-0421-613b4661f36a@xs4all.nl>
Date:   Fri, 17 Jul 2020 09:57:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200717072018.crgmvfrm44kgmvcb@uno.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfP+apCmIT9/T5swtsyHxcd61ddZnYJ0ZY1UNuoFRA7Z8Xx8PgyTZAFQX83k23Z6skj56teIqyi4L1w64G9mteI+i9rwOgIDtrbUanUTMH0k4X/8amc4T
 guKb619SK1bR0cIXVrZi26UhuKupWjzZtAgZwowvPlFW36TflNuVsa7+Z/h/Dkn6E+/FFwG6OujexHMB/SWL/9ka0lH4sTeYbAsVGhrcfKn/Q3j6rK3GXwwN
 81E1NWRyu5ur2NrB1RkOrCasyCwgMGwclXDpFZNWj1I4OSJI2cWraYuI6Rl4WRjCNGZDe6QO3WX1zCUzdh0a8DAqu33+eWRbGDXDvGhgNsPVYekYyBY6s34a
 5XqMdeCVrMUs5n+7rsVztjv0H3imSGnSbo2WHsMAwaZqDJkTjV7p4cnQQZk7TIMPJIt14xJeWhPVVvBiMqO2z0k7WkeBk800cWZ7MdRX3iBic8Bat3JNb6y5
 SIuVY1dC9QA1TVAg5I90Lc0l3a+mPCJpfm/I/6F5bXVCVKdFqsVUeqWxHRY7o0/WQfEzXRYJYak9f/vOYEkZkJTv5FDQdviU2zobu71I/LP/Bzzoq7rU/KLk
 t6Yr7eeB+UCj+PogwomVdmWTpjdCOfMG6K2L7+y8ZKGlmsSbK5WsvG4hzGNmmXeTAYioOZ6a6F+hmql2HZ0rDdZm
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 17/07/2020 09:20, Jacopo Mondi wrote:
> Hi Janusz,
>   thanks for review
> 
> On Fri, Jul 17, 2020 at 12:15:27AM +0200, Janusz Krzysztofik wrote:
>> Hi Jacopo,
>>
>> On Thursday, July 16, 2020 4:27:04 P.M. CEST Jacopo Mondi wrote:
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
> 
> First of all, Hans sent a pull request for this series yesterday. Are
> you ok with that and with sending patches on top, or do you think the
> inclusion of the series should be post-poned ? (you can imagine what
> my preference is :)
> 
>>
>> Could this description also clarify what results are expected in case of
>> hardware errors?  The ov6650 implementation you propose may suggest such
>> errors may be expected to be ignored silently as long as current configuration
>> can be successfully obtained from hardware and passed back to the caller.
> 
> I guess "it depends"(tm)
> I know this doesn't sound like a good answer :)
> 
> A failure in applying or reading register likely means the driver is
> trying to access the hardware while it is in low power state. In this
> case I would consider this a driver bug, as it should try to be smart
> and cache settings and apply them at the proper time and return the
> current configuration, which should be cached as well.
> 
> Of course things could go wrong for several reasons, and in the case
> if any unexpected error occurs I think an error is expected to be
> reported. Please note that this v7 of ov6650 does that by returning
> the return value of ov6650_get_mbus_config() at the end of
> ov6650_set_mbus_config.
> 
> I guess this is pretty regular behaviour, although I missed it in the
> previous version, so it might be worth adding an additional line to
> the documentation.
> 
>>
>> Moreover, since validity of the pad argument is expected to be verified, I
>> think this should be handled by the media infrastructure layer with the
>> drivers/media/v4l2-core/v4l2-subdev.c:check_pad() helper called from a
>> .set_mbus_config() wrapper added to v4l2_subdev_call_pad_wrappers, freeing
>> drivers from reimplementing it.
>>
> 
> Good point, and indeed my bad as I thought v4l2_subdev_call() would
> already do that by default, but looking at the actual implementation a
> wrapper might be a good idea indeed.
> 
> Patches on top ?

I prefer a v8. I'll just drop the PR in patchwork. This pad check is
IMHO important enough to get that in the series. I completely forgot
about that check...

Regards,

	Hans

> 
> Thanks
>   j
> 
>> Thanks,
>> Janusz
>>
>>>   */
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
>>
>>

