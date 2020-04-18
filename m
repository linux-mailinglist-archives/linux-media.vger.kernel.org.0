Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8601B1AE90A
	for <lists+linux-media@lfdr.de>; Sat, 18 Apr 2020 02:56:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725953AbgDRA43 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Apr 2020 20:56:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725857AbgDRA43 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Apr 2020 20:56:29 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16108C061A0C
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 17:56:29 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id w11so1906450pga.12
        for <linux-media@vger.kernel.org>; Fri, 17 Apr 2020 17:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=D0ycUSgHtzyh2f1HhcCag/4fCavqLPx6ARq0T18UptE=;
        b=QLZUdpV0QN+L/J1yABPwhQURzNyJhql6+kK4ypgiDFpzHOld831eqHaJE6vIcfar2J
         Zi39Luo4e1lsxIOhZHV5V8J6ekHpii1kq1WH6i+r8InD0u9eGrCx3aglQloc+DBi6Ka6
         NbiV56I4asiqILxSgGk/a7p7WjXfuscU5h9+YK+hChSx3aC+YdmFxPxyhkrFAxCTre8c
         PPO9zX0xiaEjpyIXlrbOcFdSvHxIf1/wJ3b2x7wZTxj1i5OZsazzJbrs5Z0lM+D1BECz
         D5stzVnnqojDgm/R7G6gyKfkjP2ih9MlV+xGCuvS4L+/+YafXTklSo+2mqPXKac2BISq
         pDKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=D0ycUSgHtzyh2f1HhcCag/4fCavqLPx6ARq0T18UptE=;
        b=sTQzHbP2TEIgkXk7tSg2a6BC22ZUE/7HO0qAYnGf372nSTPEvhI8YhdlXxa+yLxU6h
         7xTb+V/RciEZgut1q/5YDeWKEXqNOgcRe62x3Pd7KatpMy075to/xJxddfNs9zjvBGFn
         VUPTXOJNFTydBEfUbbLqM7TjA/ea9XoUwc1Z3iQ1wi+TRD60aa6m9wraC5RIShL01R88
         y1EhcuBAnDxN/N8dHiPJqKVnwx+7GO2DxR1LYESKi+D+1lPgp3Hcq0cuKKEOWIgtmY9Y
         J1mu9hfOHaT8K4kk9FQc4zwKD2RYWJv8ehcMApqHyj1I84jK7ZpFrvFsjIWofGYgi9jB
         rugA==
X-Gm-Message-State: AGi0PuYK+v8sY4fR+n6wvFsGh/c6tHBd3K+YuYgOP07buep5JrkXhvge
        oKmPq22F+wQeCJ0mYdeSJL2hw15lQx8=
X-Google-Smtp-Source: APiQypJAkGn5pvV6i+wV7b287d+0DTsg/4jhfm2605g/R4kkAE1X/+rCaPVVk4aBi14th6brLgFtXw==
X-Received: by 2002:a63:41c2:: with SMTP id o185mr5538890pga.139.1587171388433;
        Fri, 17 Apr 2020 17:56:28 -0700 (PDT)
Received: from [192.168.1.101] (c-107-3-184-99.hsd1.ca.comcast.net. [107.3.184.99])
        by smtp.gmail.com with ESMTPSA id g197sm19444596pfb.54.2020.04.17.17.56.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 17:56:27 -0700 (PDT)
Subject: Re: [PATCH v4 09/17] media: video-mux: Create media links in bound
 notifier
From:   Steve Longerbeam <slongerbeam@gmail.com>
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
 <e1488ad1-fcd7-1049-8130-a10dc195ccb1@gmail.com>
Message-ID: <ccdc2a23-e94e-893a-12a9-0aa12a89b04e@gmail.com>
Date:   Fri, 17 Apr 2020 17:56:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <e1488ad1-fcd7-1049-8130-a10dc195ccb1@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

On 4/14/20 4:47 PM, Steve Longerbeam wrote:
> Hi Laurent,
>
> On 4/14/20 4:16 PM, Laurent Pinchart wrote:
>> Hi Steve,
>>
>> Thank you for the patch.
>>
>> On Tue, Mar 03, 2020 at 03:42:48PM -0800, Steve Longerbeam wrote:
>>> Implement a notifier bound op to register media links from the remote
>>> sub-device's source pad(s) to the video-mux sink pad(s).
>>>
>>> Signed-off-by: Steve Longerbeam <slongerbeam@gmail.com>
>>> ---
>>> Changes in v3:
>>> - this version does the work inline. The previous version called
>>>    a media_create_fwnode_links() which is removed in v3.
>>> ---
>>>   drivers/media/platform/video-mux.c | 92 
>>> ++++++++++++++++++++++++++++++
>>>   1 file changed, 92 insertions(+)
>>>
>>> diff --git a/drivers/media/platform/video-mux.c 
>>> b/drivers/media/platform/video-mux.c
>>> index f446ada82176..3991b1ea671c 100644
>>> --- a/drivers/media/platform/video-mux.c
>>> +++ b/drivers/media/platform/video-mux.c
>>> @@ -36,6 +36,12 @@ static const struct v4l2_mbus_framefmt 
>>> video_mux_format_mbus_default = {
>>>       .field = V4L2_FIELD_NONE,
>>>   };
>>>   +static inline struct video_mux *
>>> +notifier_to_video_mux(struct v4l2_async_notifier *n)
>>> +{
>>> +    return container_of(n, struct video_mux, notifier);
>>> +}
>>> +
>>>   static inline struct video_mux *v4l2_subdev_to_video_mux(struct 
>>> v4l2_subdev *sd)
>>>   {
>>>       return container_of(sd, struct video_mux, subdev);
>>> @@ -360,6 +366,90 @@ static const struct v4l2_subdev_ops 
>>> video_mux_subdev_ops = {
>>>       .video = &video_mux_subdev_video_ops,
>>>   };
>>>   +static int video_mux_notify_bound(struct v4l2_async_notifier 
>>> *notifier,
>>> +                  struct v4l2_subdev *sd,
>>> +                  struct v4l2_async_subdev *asd)
>>> +{
>>> +    struct video_mux *vmux = notifier_to_video_mux(notifier);
>>> +    struct fwnode_handle *vmux_fwnode = dev_fwnode(vmux->subdev.dev);
>>> +    struct fwnode_handle *sd_fwnode = dev_fwnode(sd->dev);
>>> +    struct fwnode_handle *vmux_ep;
>> There doesn't seem to be anything in this function that is specific to
>> the video_mux driver. I think it would make sense to turn it into a
>> generic helper that creates links between two subdevs based on their
>> fwnode connections.
>
> Agreed, in fact I wrote imx_media_create_fwnode_pad_links(src_sd, 
> sink_sd) (patch 8 in this series), and it is completely generic, it 
> could simply be renamed v4l2_create_fwnode_pad_links() and moved to core.
>
>> I also wonder if it wouldn't be more efficient to create links at
>> complete() time instead of bound() time, in which case the helper would
>> create all links for a given subdevice, not links between two specific
>> subdevices (or maybe all links for a given pad direction, to be able to
>> remove the existing link check below).
>
> It looks like that should be possible. The bound sub-devices at 
> complete() time are available in the notifier->done list. I'll start 
> looking at that for v5.

Actually for sub-devices that won't work. The .complete() callback is 
only called on the root notifier, not on subdev notifiers. I don't think 
it's a big deal, it works fine to create links from one source subdev at 
a time in .bound(), and I don't see it as much of a efficiency hit.

Steve

>
>
>
>>
>>> +
>>> +    fwnode_graph_for_each_endpoint(vmux_fwnode, vmux_ep) {
>>> +        struct fwnode_handle *remote_ep, *sd_ep;
>>> +        struct media_pad *src_pad, *sink_pad;
>>> +        struct fwnode_endpoint fwep;
>>> +        int src_idx, sink_idx, ret;
>>> +        bool remote_ep_belongs;
>>> +
>>> +        ret = fwnode_graph_parse_endpoint(vmux_ep, &fwep);
>>> +        if (ret)
>>> +            continue;
>>> +
>>> +        /* only create links to the vmux sink pads */
>>> +        if (fwep.port >= vmux->subdev.entity.num_pads - 1)
>>> +            continue;
>>> +
>>> +        sink_idx = fwep.port;
>>> +        sink_pad = &vmux->subdev.entity.pads[sink_idx];
>>> +
>>> +        remote_ep = fwnode_graph_get_remote_endpoint(vmux_ep);
>>> +        if (!remote_ep)
>>> +            continue;
>>> +
>>> +        /*
>>> +         * verify that this remote endpoint is owned by the
>>> +         * sd, in case the sd does not check for that in its
>>> +         * .get_fwnode_pad operation or does not implement it.
>>> +         */
>>> +        remote_ep_belongs = false;
>>> +        fwnode_graph_for_each_endpoint(sd_fwnode, sd_ep) {
>>> +            if (sd_ep == remote_ep) {
>>> +                remote_ep_belongs = true;
>>> +                fwnode_handle_put(sd_ep);
>>> +                break;
>>> +            }
>>> +        }
>>> +        if (!remote_ep_belongs)
>>> +            continue;
>>> +
>>> +        src_idx = media_entity_get_fwnode_pad(&sd->entity, remote_ep,
>>> +                              MEDIA_PAD_FL_SOURCE);
>>> +        fwnode_handle_put(remote_ep);
>>> +
>>> +        if (src_idx < 0)
>>> +            continue;
>>> +
>>> +        src_pad = &sd->entity.pads[src_idx];
>>> +
>>> +        /* skip this link if it already exists */
>>> +        if (media_entity_find_link(src_pad, sink_pad))
>>> +            continue;
>> Have you encountered this in practice ? If we only create links for sink
>> pads this shouldn't happen.
>>
>>> +
>>> +        ret = media_create_pad_link(&sd->entity, src_idx,
>>> +                        &vmux->subdev.entity,
>>> +                        sink_idx, 0);
>>> +        if (ret) {
>>> +            dev_err(vmux->subdev.dev,
>>> +                "%s:%d -> %s:%d failed with %d\n",
>>> +                sd->entity.name, src_idx,
>>> +                vmux->subdev.entity.name, sink_idx, ret);
>>> +            fwnode_handle_put(vmux_ep);
>>> +            return ret;
>>> +        }
>>> +
>>> +        dev_dbg(vmux->subdev.dev, "%s:%d -> %s:%d\n",
>>> +            sd->entity.name, src_idx,
>>> +            vmux->subdev.entity.name, sink_idx);
>>> +    }
>>> +
>>> +    return 0;
>>> +}
>>> +
>>> +static const struct v4l2_async_notifier_operations 
>>> video_mux_notify_ops = {
>>> +    .bound = video_mux_notify_bound,
>>> +};
>>> +
>>>   static int video_mux_async_register(struct video_mux *vmux,
>>>                       unsigned int num_input_pads)
>>>   {
>>> @@ -397,6 +487,8 @@ static int video_mux_async_register(struct 
>>> video_mux *vmux,
>>>           }
>>>       }
>>>   +    vmux->notifier.ops = &video_mux_notify_ops;
>>> +
>>>       ret = v4l2_async_subdev_notifier_register(&vmux->subdev,
>>>                             &vmux->notifier);
>>>       if (ret)
>

