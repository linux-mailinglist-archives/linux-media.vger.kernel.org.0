Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FA2A2279BC
	for <lists+linux-media@lfdr.de>; Tue, 21 Jul 2020 09:46:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728169AbgGUHqe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 Jul 2020 03:46:34 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:38003 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726736AbgGUHqe (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 Jul 2020 03:46:34 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id xmyrjfQOcNPeYxmysjsKmi; Tue, 21 Jul 2020 09:46:30 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1595317590; bh=zrmFmZxdXke+DcwF9/ELueC7bO1mY51I3dq2vEhcjSY=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=KDt92pkG9sdqDyaiPggzqmOLod+MgR6ISJ8jrUiIbUBrVp+f0zwrTJVZF+wCBF9hy
         GVKRFUvzjX2p6OZX2nHMYngdH98ivR8qx4ukGZhTiLeShB0PYY7QTYHAGIqRnD6d4u
         Kxp942o2NO6w91VL5sfuH+bxIeeg1RMTT9UCI015WBW2XMS4/eLRkbGOZTOlTaElSf
         HzVL7Sw0hkNhPPhS5ZDktUoK5ppkFzecFsMw0lhDpzsLCn3fi1e1LxeR6/1AZQ/TSt
         U24+YEZf+BtikEZibIuqvkL0Vh3aw4+HlPzuYyNDTVhnvKOuxc1w3XticaYX5ZnNMA
         XUGk5W9jel80w==
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
 <4043309.ejJDZkT8p0@z50> <f60dc28c-ac30-0ddc-efb5-62b22d4cbaa7@xs4all.nl>
 <8674885.rMLUfLXkoz@z50>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
Message-ID: <76060057-f177-ea8a-0b1c-5d88baf094a2@xs4all.nl>
Date:   Tue, 21 Jul 2020 09:46:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <8674885.rMLUfLXkoz@z50>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfNdXwGqw64rsQY1GEeSrqJJrw6dgyL68ZNhvYaJnDSyIUkSFAakcYBs0sWJCrh7gmVncl9W6MFij4JpcysjmLvlKHDlK5UbcaZexOvF+eAxqDVyANsVY
 YnZcWn3x62tHLgRBhBRXA+w7JI5jNwKmIzh7kAchDe2/vKNHW0KZ/kv/a+heAEmzvKbqZ7CuY8xcjEgOar119ZLxxfDqZKGEw1FXJ/QsRv/K2bXnhTkevOqp
 Llz2GMCB9DqwGIKCWyJLKaVQaEgqkrVHKJE/P8jHgtAwqeLYV1h4vA+VO6DWryfRxiMNYCq/fkSA8LteG1T43Q1EK1Ulx4GFdkrNHR8dhgvvyTAFhoF3XN+t
 Lny4Khq1t8ri+3pKAz6kIGQZNOwOBnKhYawkDQCgHZdU69++AEvn7D/OI29QqCaIzjpdiHmsfpQsqIQpmmTEuJNQkcloYOJid9iLxgLdyKoDsdoIrB072tio
 ULbA9XBfGeteSVUQNTkZdMctfoGshUqsygre6TFqX14ByDch3Y84DS/9dUkWM2v3WZcdLNPAocfqylfxrbvrWHFODPFWjNYuAQC4VCWe+Ih18MMucS2ge2MH
 xOlZcJsdAvIqhxgKQk1QGfYxmSjw9UjBqifWxRoNm3cLseT+EWSnI0BGkeGEFBWyE5ZTAITk/1Dq/4gh7joYA4eouAWsRZrEySUsyQ4W6QLh56nitCfbztca
 vs3PwZHVUy+M7oZPEsD3H1eH54k98Up+
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 20/07/2020 20:44, Janusz Krzysztofik wrote:
> On Monday, July 20, 2020 10:48:36 A.M. CEST Hans Verkuil wrote:
>> On 19/07/2020 13:18, Janusz Krzysztofik wrote:
>>> Hi Hans,
>>>
>>> On Wednesday, July 15, 2020 5:08:05 P.M. CEST Hans Verkuil wrote:
>>>> On 14/07/2020 15:58, Jacopo Mondi wrote:
>>>>> Introduce two new pad operations to allow retrieving and configuring the
>>>>> media bus parameters on a subdevice pad.
>>>>>
>>>>> The newly introduced operations aims to replace the s/g_mbus_config video
>>>>> operations, which have been on their way for deprecation since a long
>>>>> time.
>>>>>
>>>>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>>>> ---
>>>>>  include/media/v4l2-subdev.h | 27 +++++++++++++++++++++++++++
>>>>>  1 file changed, 27 insertions(+)
>>>>>
>>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>>> index f7fe78a6f65a..d8b9d5735307 100644
>>>>> --- a/include/media/v4l2-subdev.h
>>>>> +++ b/include/media/v4l2-subdev.h
>>>>> @@ -670,6 +670,29 @@ struct v4l2_subdev_pad_config {
>>>>>   *
>>>>>   * @set_frame_desc: set the low level media bus frame parameters, @fd 
> array
>>>>>   *                  may be adjusted by the subdev driver to device 
> capabilities.
>>>>> + *
>>>>> + * @get_mbus_config: get the media bus configuration of a remote sub-
> device.
>>>>> + *		     The media bus configuration is usually retrieved 
> from the
>>>>> + *		     firmware interface at sub-device probe time, 
> immediately
>>>>> + *		     applied to the hardware and eventually adjusted 
> by the
>>>>> + *		     driver. Remote sub-devices (usually video 
> receivers) shall
>>>>> + *		     use this operation to query the transmitting end 
> bus
>>>>> + *		     configuration in order to adjust their own one 
> accordingly.
>>>>> + *		     Callers should make sure they get the most up-to-
> date as
>>>>> + *		     possible configuration from the remote end, likely 
> calling
>>>>> + *		     this operation as close as possible to stream on 
> time. The
>>>>> + *		     operation shall fail if the pad index it has been 
> called on
>>>>> + *		     is not valid.
>>>>> + *
>>>>> + * @set_mbus_config: set the media bus configuration of a remote sub-
> device.
>>>>> + *		     This operations is intended to allow, in 
> combination with
>>>>> + *		     the get_mbus_config operation, the negotiation of 
> media bus
>>>>> + *		     configuration parameters between media sub-
> devices. The
>>>>> + *		     operation shall not fail if the requested 
> configuration is
>>>>> + *		     not supported, but the driver shall update the 
> content of
>>>>> + *		     the %config argument to reflect what has been 
> actually
>>>>> + *		     applied to the hardware. The operation shall fail 
> if the
>>>>> + *		     pad index it has been called on is not valid.
>>>>>   */
>>>>
>>>> Hm, I'd hoped I could merge this, but I think include/media/v4l2-
> mediabus.h
>>>> also needs to be updated.
>>>>
>>>> So the old g_mbus_config returned all supported configurations, while the
>>>> new get_mbus_config returns the *current* configuration.
>>>>
>>>> That's fine, but that means that the meaning of the struct v4l2_mbus_config
>>>> flags field changes as well and several comments in v4l2-mediabus.h need to
>>>> be updated to reflect this.
>>>>
>>>> E.g. instead of '/* How many lanes the client can use */' it becomes
>>>> '/* How many lanes the client uses */'.
>>>>
>>>> Frankly, these flags can be redesigned now since you only need a single
>>>> e.g. V4L2_MBUS_HSYNC_ACTIVE_HIGH flag since if it is not set, then that
>>>> means ACTIVE_LOW. And since it is now a single bit, it is also easy to
>>>> make each flag a bit field.
>>>
>>> Even if this makes sense for .get_mbus_config() which returns current 
>>> configuration, how about keeping the old semantics of the flags and let 
>>> .set_mbus_config() accept a potentially incomplete or redundant set of flags 
>>> specified by the caller to select a supported configuration from?  That 
> approach 
>>> was actually proposed before by Jacopo when he argued against my 
> suggestion to 
>>> add a wrapper with a check for mutually exclusive flags[1], and I found it 
> a 
>>> very good alternative to my other rejected suggestion of adding TRY 
> support.
>>
>> The information on how a sensor (or similar device) is wired up is not 
> something
>> that should be negotiated. Even if a combination is theoretically possible, 
> it
>> may not have been tested by the board designer and in fact it might not 
> work.
>> (Yes, that happens)
>>
>> It is just a bad design trying to negotiate this.
>>
>> In fact, the only values that can be set as far as I am concerned are lanes 
> and
>> channels. I wouldn't mind if the other settings are purely read-only. The 
> only
>> driver that actively sets this is the pxa_camera driver and I wish it 
> didn't.
>>
>> But there are still two pxa boards that use this mechanism, so I guess we 
> still
>> have to allow this.
>>
>> Anyway, do you have a specific use-case in mind?
> 
> Non-DT platforms in general.  You repeat quite often that configuration 
> should come from DT.  While that's obvious, does that mean media is soon going 
> to drop non-DT support completely?  If not then I think that it may be better 

It's close to dropping non-DT already. The ov6650 is the only sensor driver that
supports s_mbus_config today, so trying to negotiate these settings is only possible
with that sensor. In any case, this is really not something that should be negotiated,
regardless of DT vs platform. Negotiating this was and is a bad idea and instead you
should have a well defined and tested configuration defined in either the DT or in
platform data.

> to allow negotiation where possible than require each platform driver that 
> still wishes to support non-DT platforms to define its own platform data 
> structure.  At least parallel link settings seem to be a good candidate to me.
> 
> Anyway, as long as .set_mbus_config() is going to be supported, it is still 
> possible for a platform driver to iterate through its supported configurations 
> if passing incomplete or redundant flags and let the sensor handle that is not 
> allowed.  More complicated, more time consuming, more error prone, I believe, 
> but still possible.

It's possible, but it is just not a good idea. As I mentioned before, typically
only one combination is actually tested, and negotiating this might end up
choosing a combination of settings that, while valid, is actually not working
due to HW bugs that were never noticed because the designer never tested that
combination. The other reason is that this makes things so much more complicated.

It is much easier and safer to just be explicit in the dts or platform data.

Regards,

	Hans

> 
> Thanks,
> Janusz
