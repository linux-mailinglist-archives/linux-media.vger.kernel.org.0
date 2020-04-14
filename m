Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D2B841A8F49
	for <lists+linux-media@lfdr.de>; Wed, 15 Apr 2020 01:53:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2634394AbgDNXrz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Apr 2020 19:47:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2634364AbgDNXrn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Apr 2020 19:47:43 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14DA0C061A0E
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:47:43 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id y12so570672pll.2
        for <linux-media@vger.kernel.org>; Tue, 14 Apr 2020 16:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=d4qrGPFK1pm1Zq5e3Wm5KmbRlRyvqLmehN5SlEiK6ck=;
        b=Jk4MTbMxyCiJs/TF0wjLAPWRlcNWwyx3XElcuh2hvjEf3LzZW12qWEtwu9+LKwGXla
         2OSPYzYgAWn5qz4TBGnZmmLuheZn/DB9kNClGs4PU6mTSaaq1dTGBoYufl7exauFDzTc
         p3gurbvU68HkJaIDPvnRsuyrQQYmT59TqzB2HJ8H0qilqrgTVAoy6T2j4qbKhbLXb/sC
         zMRHOqAW904XPkfcc9nxRuaSpOpL0cCgxWbN04GJT6MPK3yuNAiK0vRlwVqhUF/uY1AF
         aX6AE9EgT+TngY2d+pydcNJnXCeLo4uxD9gwsTaR6dPNjbd6tBIhhFF/2Uu9njPjw1mN
         fNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=d4qrGPFK1pm1Zq5e3Wm5KmbRlRyvqLmehN5SlEiK6ck=;
        b=HvCofaAU4qMI3SAjx2oc8zfA7Xdi81icfJwxCC7fMMGlAgiqo0lapeWoQVTROpQzjl
         w/GRF6ZhNPcT2oprB0D50l9v066gkucanNxlCLub9G8ZirPGNbBMTKKKsXZLCxaxKM3D
         VdFQk6Mni160p1EmgjPLo77gMvr7z9xbd+Yj0JRJg3WtN7E4tz1IRt80Ui9TJssZ5iaE
         4b5EK2NjOLByYvuqLe/Zrw6bmeJ6EnWQCJ84s/NISe27tw7Xc/h3EYh4tMGO6wbKVzSa
         eTTbbxV39YlGy8GDLjVKaZ560AxkemZm+s4zTXkMndij92amQNyd4M3ttjS0KyUx4gVP
         r9pw==
X-Gm-Message-State: AGi0Pub5GH2WIFnGf8mrwZoW0soxNxxETxYRrK3fCMcE1dtNb2VQpRCL
        pp1wHFpZkiyJ2uqzHsi+mFc=
X-Google-Smtp-Source: APiQypKRxh6cVRC5G18h/UuR2mkfMVbbqPOj+vZUyGQzeJojm7rH4bD+iq2mloLoUsvB5Jz7Mn3Icg==
X-Received: by 2002:a17:90a:a111:: with SMTP id s17mr3030976pjp.129.1586908062369;
        Tue, 14 Apr 2020 16:47:42 -0700 (PDT)
Received: from [192.168.1.101] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id i14sm11122820pgh.47.2020.04.14.16.47.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 16:47:41 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] media: video-mux: Create media links in bound
 notifier
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Rui Miguel Silva <rmfrfs@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>
References: <20200303234256.8928-1-slongerbeam@gmail.com>
 <20200303234256.8928-10-slongerbeam@gmail.com>
 <20200414231617.GE27621@pendragon.ideasonboard.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <e1488ad1-fcd7-1049-8130-a10dc195ccb1@gmail.com>
Date:   Tue, 14 Apr 2020 16:47:40 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200414231617.GE27621@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 4/14/20 4:16 PM, Laurent Pinchart wrote:
> Hi Steve,
>
> Thank you for the patch.
>
> On Tue, Mar 03, 2020 at 03:42:48PM -0800, Steve Longerbeam wrote:
>> Implement a notifier bound op to register media links from the remote
>> sub-device's source pad(s) to the video-mux sink pad(s).
>>
>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>> ---
>> Changes in v3:
>> - this version does the work inline. The previous version called
>>    a media_create_fwnode_links() which is removed in v3.
>> ---
>>   drivers/media/platform/video-mux.c | 92 ++++++++++++++++++++++++++++++
>>   1 file changed, 92 insertions(+)
>>
>> diff --git a/drivers/media/platform/video-mux.c b/drivers/media/platform/video-mux.c
>> index f446ada82176..3991b1ea671c 100644
>> --- a/drivers/media/platform/video-mux.c
>> +++ b/drivers/media/platform/video-mux.c
>> @@ -36,6 +36,12 @@ static const struct v4l2_mbus_framefmt video_mux_format_mbus_default = {
>>   	.field = V4L2_FIELD_NONE,
>>   };
>>   
>> +static inline struct video_mux *
>> +notifier_to_video_mux(struct v4l2_async_notifier *n)
>> +{
>> +	return container_of(n, struct video_mux, notifier);
>> +}
>> +
>>   static inline struct video_mux *v4l2_subdev_to_video_mux(struct v4l2_subdev *sd)
>>   {
>>   	return container_of(sd, struct video_mux, subdev);
>> @@ -360,6 +366,90 @@ static const struct v4l2_subdev_ops video_mux_subdev_ops = {
>>   	.video = &video_mux_subdev_video_ops,
>>   };
>>   
>> +static int video_mux_notify_bound(struct v4l2_async_notifier *notifier,
>> +				  struct v4l2_subdev *sd,
>> +				  struct v4l2_async_subdev *asd)
>> +{
>> +	struct video_mux *vmux = notifier_to_video_mux(notifier);
>> +	struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
>> +	struct fwnode_handle *sd_fwnode = dev_fwnode(sd->dev);
>> +	struct fwnode_handle *vmux_ep;
> There doesn't seem to be anything in this function that is specific to
> the video_mux driver. I think it would make sense to turn it into a
> generic helper that creates links between two subdevs based on their
> fwnode connections.

Agreed, in fact I wrote imx_media_create_fwnode_pad_links(src_sd, 
sink_sd) (patch 8 in this series), and it is completely generic, it 
could simply be renamed v4l2_create_fwnode_pad_links() and moved to core.

> I also wonder if it wouldn't be more efficient to create links at
> complete() time instead of bound() time, in which case the helper would
> create all links for a given subdevice, not links between two specific
> subdevices (or maybe all links for a given pad direction, to be able to
> remove the existing link check below).

It looks like that should be possible. The bound sub-devices at 
complete() time are available in the notifier->done list. I'll start 
looking at that for v5.

Steve


>
>> +
>> +	fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
>> +		struct fwnode_handle *remote_ep, *sd_ep;
>> +		struct media_pad *src_pad, *sink_pad;
>> +		struct fwnode_endpoint fwep;
>> +		int src_idx, sink_idx, ret;
>> +		bool remote_ep_belongs;
>> +
>> +		ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
>> +		if (ret)
>> +			continue;
>> +
>> +		/* only create links to the vmux sink pads */
>> +		if (fwep.port >= vmux->subdev.entity.num_pads - 1)
>> +			continue;
>> +
>> +		sink_idx = fwep.port;
>> +		sink_pad = &vmux->subdev.entity.pads[sink_idx];
>> +
>> +		remote_ep = fwnode_graph_get_remote_endpoint(vmux_ep);
>> +		if (!remote_ep)
>> +			continue;
>> +
>> +		/*
>> +		 * verify that this remote endpoint is owned by the
>> +		 * sd, in case the sd does not check for that in its
>> +		 * .get_fwnode_pad operation or does not implement it.
>> +		 */
>> +		remote_ep_belongs = false;
>> +		fwnode_graph_for_each_endpoint(sd_fwnode, sd_ep) {
>> +			if (sd_ep == remote_ep) {
>> +				remote_ep_belongs = true;
>> +				fwnode_handle_put(sd_ep);
>> +				break;
>> +			}
>> +		}
>> +		if (!remote_ep_belongs)
>> +			continue;
>> +
>> +		src_idx = media_entity_get_fwnode_pad(&sd->entity, remote_ep,
>> +						      MEDIA_PAD_FL_SOURCE);
>> +		fwnode_handle_put(remote_ep);
>> +
>> +		if (src_idx < 0)
>> +			continue;
>> +
>> +		src_pad = &sd->entity.pads[src_idx];
>> +
>> +		/* skip this link if it already exists */
>> +		if (media_entity_find_link(src_pad, sink_pad))
>> +			continue;
> Have you encountered this in practice ? If we only create links for sink
> pads this shouldn't happen.
>
>> +
>> +		ret = media_create_pad_link(&sd->entity, src_idx,
>> +					    &vmux->subdev.entity,
>> +					    sink_idx, 0);
>> +		if (ret) {
>> +			dev_err(vmux->subdev.dev,
>> +				"%s:%d -> %s:%d failed with %d\n",
>> +				sd->entity.name, src_idx,
>> +				vmux->subdev.entity.name, sink_idx, ret);
>> +			fwnode_handle_put(vmux_ep);
>> +			return ret;
>> +		}
>> +
>> +		dev_dbg(vmux->subdev.dev, "%s:%d -> %s:%d\n",
>> +			sd->entity.name, src_idx,
>> +			vmux->subdev.entity.name, sink_idx);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +static const struct v4l2_async_notifier_operations video_mux_notify_ops = {
>> +	.bound = video_mux_notify_bound,
>> +};
>> +
>>   static int video_mux_async_register(struct video_mux *vmux,
>>   				    unsigned int num_input_pads)
>>   {
>> @@ -397,6 +487,8 @@ static int video_mux_async_register(struct video_mux *vmux,
>>   		}
>>   	}
>>   
>> +	vmux->notifier.ops = &video_mux_notify_ops;
>> +
>>   	ret = v4l2_async_subdev_notifier_register(&vmux->subdev,
>>   						  &vmux->notifier);
>>   	if (ret)

