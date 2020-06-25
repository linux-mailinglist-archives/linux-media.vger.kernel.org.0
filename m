Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F06E720A42C
	for <lists+linux-media@lfdr.de>; Thu, 25 Jun 2020 19:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405170AbgFYRlP (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 13:41:15 -0400
Received: from esa4.mentor.iphmx.com ([68.232.137.252]:17793 "EHLO
        esa4.mentor.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405083AbgFYRlP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 13:41:15 -0400
IronPort-SDR: RmN9LfFRFNe2G7Q0PERxj/pvfRH/4iI8Aj/76yhTph297BRag65e+1JOBL0ikEOTc8z3HPK19/
 rGTNChYx1uj0uTePzJrFejznXqaI1cWTaHC8WKhFQJDyZyBkdwg49/GNA3ByroA1GpL+xpYHVx
 aNYNoQHX+3oa8p9z3ChLrueDgqzkHD6y1kKz+N0419g65RBLV+48WKAwoAhzh8udxpttd66dWY
 m2G5RB833Y/lXUbURApw2E8u7JDsc563BE6V7xGOlQek9SwYnawD+cvYvqew5OVjhxf+y0cmux
 h+k=
X-IronPort-AV: E=Sophos;i="5.75,280,1589270400"; 
   d="scan'208";a="50322167"
Received: from orw-gwy-02-in.mentorg.com ([192.94.38.167])
  by esa4.mentor.iphmx.com with ESMTP; 25 Jun 2020 09:41:13 -0800
IronPort-SDR: LWkbEBr2wJvlrPZvGOT4sExRu+WgOSN1jMXf9Jzhe3/acdh+oohcAtfQQpH669DLSKWL4MojVw
 6vkqHSlueSV5IWJq5/wXJq2UlHwKNDDNC1UfQT2E9usRwfVNTT19wHliXosyyzVELlWuA46Ge+
 AroaIF7bkfkcPIauWop0p6zLdLUv9TYER3VDDDv3yjT6ePpMT12RXPDicMCN83cp93X6niy0AD
 EM6u3MfDrEPFdjKPK7lVj8Cc7Xw63YDyuURMpXZLnp50ZLT0HOzUu3t0ePdvXpqnCpp+g+TKeJ
 1mg=
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo@jmondi.org>
CC:     Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>,
        niklas soderlund <niklas.soderlund@ragnatech.se>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, <linux-media@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Michael Rodin <mrodin@de.adit-jv.com>,
        <efriedrich@de.adit-jv.com>, <erosca@de.adit-jv.com>
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
 <20200624075307.hl6wew7vr5ue225t@uno.localdomain>
 <20200625020138.GW5980@pendragon.ideasonboard.com>
From:   Steve Longerbeam <steve_longerbeam@mentor.com>
Message-ID: <c57d416d-14d4-6d5d-a281-ddbf3183395a@mentor.com>
Date:   Thu, 25 Jun 2020 10:41:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200625020138.GW5980@pendragon.ideasonboard.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: svr-orw-mbx-04.mgc.mentorg.com (147.34.90.204) To
 svr-orw-mbx-02.mgc.mentorg.com (147.34.90.202)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, all,

On 6/24/20 7:01 PM, Laurent Pinchart wrote:
> Hi Jacopo,
>
> On Wed, Jun 24, 2020 at 09:53:07AM +0200, Jacopo Mondi wrote:
>> On Tue, Jun 16, 2020 at 12:00:15PM +0200, Ramzi BEN MEFTAH wrote:
>>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>>   +Niklas, +Laurent
>>
>> Niklas, Laurent, how does this play with CAP_IO_MC ?
> I don't think it's related to CAP_IO_MC, but I don't think it's a good
> idea either :-) Routing doesn't go through the subdev [gs]_input
> operations in MC-based drivers. It should be configured through link
> setup instead. This patch goes in the wrong direction, sorry Steve.

That's OK! :) I didn't submit this patch, and as stated in the commit 
header, I never recommended this patch be submitted to upstream in the 
first place.

Selecting inputs at a subdev should normally make use of media link 
setup. But for selecting analog signal inputs, such as the ADV748x AFE 
standard definition inputs, that would  mean there would need to exist 
source "analog" subdevs that connect to the AFE inputs, if only for the 
purpose of selecting those inputs, which seems silly IMHO. The ADV748x 
AFE subdev defines these inputs as media pads, but have no connections, 
so link setup API can't be used to select those inputs.

So a new subdev pad API is clearly needed, not just to get input status 
at a subdev pad, but to select/make active such analog inputs without 
requiring link setup API.

Steve



>
>>> This commit enables VIDIOC_ENUMINPUT, VIDIOC_G_INPUT, and VIDIOC_S_INPUT
>>> ioctls for use via v4l2 subdevice node.
>>>
>>> This commit should probably not be pushed upstream, because the (old)
>>> idea of video inputs conflicts with the newer concept of establishing
>>> media links between src->sink pads.
>>>
>>> However it might make sense for some subdevices to support enum/get/set
>>> inputs. One example would be the analog front end subdevice for the
>>> ADV748x. By providing these ioctls, selecting the ADV748x analog inputs
>>> can be done without requiring the implementation of media entities that
>>> would define the analog source for which to establish a media link.
>>>
>>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
>>> ---
>>>   drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
>>>   include/media/v4l2-subdev.h           | 11 +++++++++++
>>>   2 files changed, 20 insertions(+)
>>>
>>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>>> index 6b989fe..73fbfe9 100644
>>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>>> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>>   			return -ENOTTY;
>>>   		return v4l2_querymenu(vfh->ctrl_handler, arg);
>>>
>>> +	case VIDIOC_ENUMINPUT:
>>> +		return v4l2_subdev_call(sd, video, enuminput, arg);
>>> +
>>> +	case VIDIOC_G_INPUT:
>>> +		return v4l2_subdev_call(sd, video, g_input, arg);
>>> +
>>> +	case VIDIOC_S_INPUT:
>>> +		return v4l2_subdev_call(sd, video, s_input, *(u32 *)arg);
>>> +
>>>   	case VIDIOC_G_CTRL:
>>>   		if (!vfh->ctrl_handler)
>>>   			return -ENOTTY;
>>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>>> index f7fe78a..6e1a9cd 100644
>>> --- a/include/media/v4l2-subdev.h
>>> +++ b/include/media/v4l2-subdev.h
>>> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
>>>    * @g_input_status: get input status. Same as the status field in the
>>>    *	&struct &v4l2_input
>>>    *
>>> + * @enuminput: enumerate inputs. Should return the same input status as
>>> + *      @g_input_status if the passed input index is the currently active
>>> + *      input.
>>> + *
>>> + * @g_input: returns the currently active input index.
>>> + *
>>> + * @s_input: set the active input.
>>> + *
>>>    * @s_stream: used to notify the driver that a video stream will start or has
>>>    *	stopped.
>>>    *
>>> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
>>>   	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
>>>   	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
>>>   	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
>>> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
>>> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
>>> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
>>>   	int (*s_stream)(struct v4l2_subdev *sd, int enable);
>>>   	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
>>>   	int (*g_frame_interval)(struct v4l2_subdev *sd,

