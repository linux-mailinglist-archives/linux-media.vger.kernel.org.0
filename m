Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B1CA2070F3
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 12:16:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388377AbgFXKQk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 06:16:40 -0400
Received: from lb3-smtp-cloud7.xs4all.net ([194.109.24.31]:57965 "EHLO
        lb3-smtp-cloud7.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2387962AbgFXKQk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 06:16:40 -0400
Received: from cust-b5b5937f ([IPv6:fc0c:c16d:66b8:757f:c639:739b:9d66:799d])
        by smtp-cloud7.xs4all.net with ESMTPA
        id o2SHjtNNrx3Ajo2SKjit7o; Wed, 24 Jun 2020 12:16:37 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1592993797; bh=dTrkPOhP9OEblUbJ6sxH+uNo185PXfKyVBQch1+IaBQ=;
        h=Subject:From:To:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=TtD0zw/T5kwEbY9lxN3GUUhVYf+JKYycv02PavNAyOZRW7jdpL87368RO++nHs3X+
         O9S2xxciPr3Fu6WUHSGGCgoU1cepOJ1TweQkH1LUrq6YLSmpWG1jTm0cQAoVzD9//M
         nqTAFPaT4sqfTHq230yvBGukXKNNuLrkehKBm1n5tijY3Z8dujz4PYUEl8giHRxdWX
         K0n1zjf9QKdQupSF1QPTMVtSEZiJH4+r5UVtkXViIiNz35P6A3nw6HQbQs8Jpdddvh
         tQQHq8vZNEX64bpi3zCuib9rDnCRpWfvWMUQdiYViNiBnvfouLc1nVv/O24x2le5rA
         cynqHp9m3jZbA==
Subject: Re: [PATCH 1/3] v4l2-subdev: Add subdev ioctl support for
 ENUM/GET/SET INPUT
From:   Hans Verkuil <hverkuil@xs4all.nl>
To:     Ramzi BEN MEFTAH <rbmeftah@de.adit-jv.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Jacopo Mondi <jacopo@jmondi.org>,
        Steve Longerbeam <steve_longerbeam@mentor.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Michael Rodin <mrodin@de.adit-jv.com>, efriedrich@de.adit-jv.com,
        erosca@de.adit-jv.com
References: <1592301619-17631-1-git-send-email-rbmeftah@de.adit-jv.com>
 <32cdf1a3-1353-d3e9-66b6-82ced163d8f8@xs4all.nl>
Message-ID: <cc072f11-c562-af95-58a9-ebfcf3dfdfcd@xs4all.nl>
Date:   Wed, 24 Jun 2020 12:16:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <32cdf1a3-1353-d3e9-66b6-82ced163d8f8@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfPD8p6E/bxNdK79QwTZHHOQ4YjMlsjCCwNQ5xIW+7DdpeA++iQUfsI/TsnR+5CtWOQ7ExrSd7etNlEk6wjrc922oI4wo4aGl3QEQIt/v0fD8IicEH1Bp
 waXXc6Y69bM0CTviLJ2msol4gmQE+lH9cLUghPhP1VWOoowFmYSLT4PhkkTgn4NUuXzFQFFPl6p14XIQFrnfHOLe0slHzOlaj0f1WYlkmbF1XLIFWTpNRJl8
 nA+P8J1ne2ZyyRWqzcYg0esieF0ZYf2yAd27lE2tPGb6oHa86EuOcBkYi6hdnwzOLU0voEdnDSPbW36POfXqiFXNdwohOh8cdof/GTWJYSjUnRSa8CtsHZln
 CVN7VPXrAZuhhMJaaWn4315RrRA9FxqnxRieKEPqlagdEcpV/DnQzctng+6UohX2d4W+1GkG/uCwSlJymIcHqoJ4JsfLa7ZEMsJzfqyw8UtJn13DR+TpoXgX
 +usbmbJiHAAzMQC47ZuRF/Xb7bDwenlWqwsM2R4MgZcOAlQ+3LA3J84qgahLVcx9DXrT+UyADYfADZHs/ckX4Joe24xjNefuUaV4xyprKeDxcFj4UaTzqog/
 hLQvqLs9LPMqITJgQLg6pmXzitOky7s6tLNquiRHwtw9dQ==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/06/2020 12:08, Hans Verkuil wrote:
> On 16/06/2020 12:00, Ramzi BEN MEFTAH wrote:
>> From: Steve Longerbeam <steve_longerbeam@mentor.com>
>>
>> This commit enables VIDIOC_ENUMINPUT, VIDIOC_G_INPUT, and VIDIOC_S_INPUT
>> ioctls for use via v4l2 subdevice node.
>>
>> This commit should probably not be pushed upstream, because the (old)
>> idea of video inputs conflicts with the newer concept of establishing
>> media links between src->sink pads.
>>
>> However it might make sense for some subdevices to support enum/get/set
>> inputs. One example would be the analog front end subdevice for the
>> ADV748x. By providing these ioctls, selecting the ADV748x analog inputs
>> can be done without requiring the implementation of media entities that
>> would define the analog source for which to establish a media link.
>>
>> Signed-off-by: Steve Longerbeam <steve_longerbeam@mentor.com>
> 
> Nacked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
> 
> This doesn't work: these ioctls refer to physical inputs on a backplane
> of a device. But subdevices have no idea about that. This is high-level
> information that is typically only known to a bridge driver based on
> board information.
> 
> For PCI/USB drivers this comes from card definitions in the driver itself.
> 
> For platform drivers this should come from the device tree, but this hasn't
> been fully implemented yet.
> 
> So if this is something that you want to implement, then look at:
> 
> Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> 
> and add this to the DT for your board, and implement code to query this
> in the platform driver.

Follow-up: in system with a media device and v4l-subdev devices (so MC-centric)
this might make sense, provided the connector data is obtained from the DT.

An alternative is to expose the connectors in the media topology and use
SETUP_LINK to choose which connector to pick.

I don't have a strong preference, but in both cases this information should
come from the device tree.

Regards,

	Hans

> 
> Regards,
> 
> 	Hans
> 
>> ---
>>  drivers/media/v4l2-core/v4l2-subdev.c |  9 +++++++++
>>  include/media/v4l2-subdev.h           | 11 +++++++++++
>>  2 files changed, 20 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 6b989fe..73fbfe9 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -378,6 +378,15 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg)
>>  			return -ENOTTY;
>>  		return v4l2_querymenu(vfh->ctrl_handler, arg);
>>  
>> +	case VIDIOC_ENUMINPUT:
>> +		return v4l2_subdev_call(sd, video, enuminput, arg);
>> +
>> +	case VIDIOC_G_INPUT:
>> +		return v4l2_subdev_call(sd, video, g_input, arg);
>> +
>> +	case VIDIOC_S_INPUT:
>> +		return v4l2_subdev_call(sd, video, s_input, *(u32 *)arg);
>> +
>>  	case VIDIOC_G_CTRL:
>>  		if (!vfh->ctrl_handler)
>>  			return -ENOTTY;
>> diff --git a/include/media/v4l2-subdev.h b/include/media/v4l2-subdev.h
>> index f7fe78a..6e1a9cd 100644
>> --- a/include/media/v4l2-subdev.h
>> +++ b/include/media/v4l2-subdev.h
>> @@ -383,6 +383,14 @@ struct v4l2_mbus_frame_desc {
>>   * @g_input_status: get input status. Same as the status field in the
>>   *	&struct &v4l2_input
>>   *
>> + * @enuminput: enumerate inputs. Should return the same input status as
>> + *      @g_input_status if the passed input index is the currently active
>> + *      input.
>> + *
>> + * @g_input: returns the currently active input index.
>> + *
>> + * @s_input: set the active input.
>> + *
>>   * @s_stream: used to notify the driver that a video stream will start or has
>>   *	stopped.
>>   *
>> @@ -423,6 +431,9 @@ struct v4l2_subdev_video_ops {
>>  	int (*g_tvnorms)(struct v4l2_subdev *sd, v4l2_std_id *std);
>>  	int (*g_tvnorms_output)(struct v4l2_subdev *sd, v4l2_std_id *std);
>>  	int (*g_input_status)(struct v4l2_subdev *sd, u32 *status);
>> +	int (*enuminput)(struct v4l2_subdev *sd, struct v4l2_input *input);
>> +	int (*g_input)(struct v4l2_subdev *sd, u32 *index);
>> +	int (*s_input)(struct v4l2_subdev *sd, u32 index);
>>  	int (*s_stream)(struct v4l2_subdev *sd, int enable);
>>  	int (*g_pixelaspect)(struct v4l2_subdev *sd, struct v4l2_fract *aspect);
>>  	int (*g_frame_interval)(struct v4l2_subdev *sd,
>>
> 

