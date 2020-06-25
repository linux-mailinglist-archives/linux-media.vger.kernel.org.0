Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF350209CF1
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 12:35:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404000AbgFYKfY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 06:35:24 -0400
Received: from lb3-smtp-cloud8.xs4all.net ([194.109.24.29]:48919 "EHLO
        lb3-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2403915AbgFYKfX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 06:35:23 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud8.xs4all.net with ESMTPA
        id oPDijedwv97i5oPDojVYwI; Thu, 25 Jun 2020 12:35:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1593081319; bh=71QouyxVlzPLdQw1woXCX8Y47OI4YHpkvJr3hRn19Tc=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=BfUe4EaTK3iY7Gwf2X6YEgAVmgsTLwflgkMg6eG9HXjeq5hh1eCZ1NJCZU+0z3oiV
         Wo/qDuE/6BBOrmujLQ21XuXpXXY2aBFgfwJLj9HbwU+EBuy29wootpRtEKKNW4eZRg
         eDAfznHvs0Js2W4cC8bNTbdh5k2oJjPXMGZbkAgduvL2DtzIW6acTtPHITIo4sXW8A
         2wWaDaviur5wSbgZTWLYFAYdzVeNyWnRyoYBZ0xx33cQGlHSwnIzOWeUiHOcEG2SLr
         dxc/NEiDl9zJN69L0uZT3MRLCSnVFMMON0I3rKKMiSrmN81nStrjhGuXLo6SRSwVb0
         ZpmesOrXomddw==
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Ramzi Ben Meftah <rbmeftah@de.adit-jv.com>
Cc:     Jacopo Mondi <jacopo@jmondi.org>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Michael Rodin <mrodin@de.adit-jv.com>,
        efriedrich@de.adit-jv.com, erosca@de.adit-jv.com
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
 <20200624075307.hl6wew7vr5ue225t@uno.localdomain>
 <20200625020138.GW5980@pendragon.ideasonboard.com>
 <20200625093046.GA91893@vmlxhi-110.adit-jv.com>
 <20200625094724.GE5865@pendragon.ideasonboard.com>
 <20200625101835.GA5081@vmlxhi-110.adit-jv.com>
 <20200625102701.GG5865@pendragon.ideasonboard.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <f0fef540-aaeb-9831-c045-77eb8c95b3b9@xs4all.nl>
Date:   Thu, 25 Jun 2020 12:35:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200625102701.GG5865@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfGQseboPO/YlnfguVN2z9afJsb6ufxpzBU0kM6LkWisChFZB8uYHlwg8CZGx+VM8QH7ovVMzJMPeyizDkY0l9C8nL/zPaAavRQYX9w5+Ynv3psPUYt2A
 r0xc9dbRWvCt1xvmNvivVwX7rHzoDRZLKx3nYC/E/APBT+rPFUgIVMskWoszHRIugG8jEPaEn3oYpFVph/ENFbaFtOUqk75SnJB9s4Z3nUOuC7YBrRwT+qfb
 n23bN0FKQEfYrm50o5Im3zHw7TJCXzjNURwPQMaTegqjcf79lU/xI21orVhczW/ry/LpjmfXliCHoKI59jt6AkOfWNFFBiFu0HOifuXKtBscK24v+oOta7Pw
 VnmPdbXng4ILOrPrnUyKZYz+slHXxjndv7Bw7jUVrrhqqhUfcMKVf48PGn+u+ywrZnFdhwLDUNh/CedXgxqTSA+MPwibWfeLtLIb/y4fRxjkl2vbMNUv4Ony
 VXQJL57MYEwRmiUK8HIwpVWvURsSOEwNQqrneuKK9Uis6RicY3SGEC5ACwQM0CInAguURrT9uScxJW5XxGVZ6s1DCxkWZmARJlNItSIOThseYkzeOtQZjSey
 JHObYvR7DUBKm+T2Bf1BPkS62E7PgZ0nhFw1AXGaHUY8BQfIEmegNRCyY+q8/beYgcU7ByjWDHfls3iJ1R1kMQZnmt0EBjHVvvxuEt+CUHodb0cUGZmfqRuv
 p9/a5hZWI1FqaUt3mMENGG3chiYBqOCZqfLA47GSLWCFb7MY4BzKbQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/06/2020 12:29, Laurent Pinchart wrote:
> Hi Ramzi,
> 
> On Thu, Jun 25, 2020 at 12:18:35PM +0200, Ramzi Ben Meftah wrote:
>> On Thu, Jun 25, 2020 at 12:47:24PM +0300, Laurent Pinchart wrote:
>>> On Thu, Jun 25, 2020 at 11:30:46AM +0200, Ramzi Ben Meftah wrote:
>>>> On Thu, Jun 25, 2020 at 05:01:38AM +0300, Laurent Pinchart wrote:
>>>>> On Wed, Jun 24, 2020 at 09:53:07AM +0200, Jacopo Mondi wrote:
>>>>>> On Tue, Jun 16, 2020 at 12:00:15PM +0200, Ramzi BEN MEFTAH wrote:
>>>>>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>>>
>>>>>>  +Niklas, +Laurent
>>>>>>
>>>>>> Niklas, Laurent, how does this play with CAP_IO_MC ?
>>>>>
>>>>> I don't think it's related to CAP_IO_MC, but I don't think it's a good
>>>>> idea either :-) Routing doesn't go through the subdev [gs]_input
>>>>> operations in MC-based drivers. It should be configured through link
>>>>> setup instead. This patch goes in the wrong direction, sorry Steve.
>>>>
>>>> ENUMINPUT ioctl allow to get the input signal status. Is there an alternative
>>>> with Media Controller?
>>>
>>> No there isn't at the moment. I'm not opposed to adding such a feature,
>>> but VIDIOC_ENUMINPUT isn't the right choice. This would have to be a
>>> subdev pad operation (v4l2_subdev_pad_ops), not a video operation
>>> (v4l2_subdev_video_ops). We also likely shouldn't call it "enum" input,
>>> as it would retrieve properties of the input corresponding to the pad,
>>> not enumerate inputs.
>>
>> Looking to v4l2_subdev_pad_ops, there is g_input_status which seems to fulfill
>> this need. But, seems this is not expose to user space although many drivers
>> do implememt it.
>> Should I add VIDIOC_SUBDEV_G_INPUT_STATUS?
> 
> Isn't g_input_status a video operation ? I would propose adding a
> g_input_status pad operation, and expose that to userspace. We should
> take that as an opportunity to consider designing that new operation
> from scratch (possibly naming it differently) and make sure it could
> address both analog and digital systems (for instance being able to
> report the status of an SDI input).

Yes, I was wondering the same. The status bits are ancient and we might
want to improve on it.

Ramzi, what exactly is your use-case? Is this for an HDMI input? Analog
video input? Before adding a new ioctl I'd like to know why you think
you need it :-)

Regards,

	Hans

> 
>>>>>>> This commit enables VIDIOC_ENUMINPUT, VIDIOC_G_INPUT, and VIDIOC_S_INPUT
>>>>>>> ioctls for use via v4l2 subdevice node.
>>>>>>>
>>>>>>> This commit should probably not be pushed upstream, because the (old)
>>>>>>> idea of video inputs conflicts with the newer concept of establishing
>>>>>>> media links between src->sink pads.
>>>>>>>
>>>>>>> However it might make sense for some subdevices to support enum/get/set
>>>>>>> inputs. One example would be the analog front end subdevice for the
>>>>>>> ADV748x. By providing these ioctls, selecting the ADV748x analog inputs
>>>>>>> can be done without requiring the implementation of media entities that
>>>>>>> would define the analog source for which to establish a media link.
>>>>>>>
>>>>>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>>>>>>> ---
>>>>>>>  drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
>>>>>>>  include/media/v4l2-subdev.h           | 11 +++++++++++
>>>>>>>  2 files changed, 20 insertions(+)
>>>>>>>
>>>>>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>>> index 6b989fe..73fbfe9 100644
>>>>>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>>>>>> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>>>>>>  			return -ENOTTY;
>>>>>>>  		return v4l2_querymenu(vfh->ctrl_handler, arg);
>>>>>>>
>>>>>>> +	case VIDIOC_ENUMINPUT:
>>>>>>> +		return v4l2_subdev_call(sd, video, enuminput, arg);
>>>>>>> +
>>>>>>> +	case VIDIOC_G_INPUT:
>>>>>>> +		return v4l2_subdev_call(sd, video, g_input, arg);
>>>>>>> +
>>>>>>> +	case VIDIOC_S_INPUT:
>>>>>>> +		return v4l2_subdev_call(sd, video, s_input, *(u32 *)arg);
>>>>>>> +
>>>>>>>  	case VIDIOC_G_CTRL:
>>>>>>>  		if (!vfh->ctrl_handler)
>>>>>>>  			return -ENOTTY;
>>>>>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>>>>>> index f7fe78a..6e1a9cd 100644
>>>>>>> --- a/include/media/v4l2-subdev.h
>>>>>>> +++ b/include/media/v4l2-subdev.h
>>>>>>> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
>>>>>>>   * @g_input_status: get input status. Same as the status field in the
>>>>>>>   *	&struct &v4l2_input
>>>>>>>   *
>>>>>>> + * @enuminput: enumerate inputs. Should return the same input status as
>>>>>>> + *      @g_input_status if the passed input index is the currently active
>>>>>>> + *      input.
>>>>>>> + *
>>>>>>> + * @g_input: returns the currently active input index.
>>>>>>> + *
>>>>>>> + * @s_input: set the active input.
>>>>>>> + *
>>>>>>>   * @s_stream: used to notify the driver that a video stream will start or has
>>>>>>>   *	stopped.
>>>>>>>   *
>>>>>>> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
>>>>>>>  	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
>>>>>>>  	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
>>>>>>>  	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
>>>>>>> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
>>>>>>> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
>>>>>>> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
>>>>>>>  	int (*s_stream)(struct v4l2_subdev *sd, int enable);
>>>>>>>  	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
>>>>>>>  	int (*g_frame_interval)(struct v4l2_subdev *sd,
> 

