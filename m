Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33875584F4A
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 13:00:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231454AbiG2LAk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 07:00:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234639AbiG2LAi (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 07:00:38 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 856F328E1C
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 04:00:37 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 246DB52F;
        Fri, 29 Jul 2022 13:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659092435;
        bh=I+UE3PYijb/E50aEaNdUpbavHRirhCZzEfkSgSicEGA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=s4IwCn1OOLyyOA/xotRtpOCJoNSTD8u6wZv5RasPoSTcpq/3azzYUKGpt9FzO2esU
         2GrN95ZMltItfzrJ4r90sVR+/3ApJmyfC/k0MQNjQJyKGNOOt09X2MJEmiFurWVKo+
         vCZXi3bR5vW4DBvzdKg3S/6H5ehbbvGzWqwBFfwI=
Message-ID: <c09299e2-7507-863c-cb9f-b26b3f90af22@ideasonboard.com>
Date:   Fri, 29 Jul 2022 14:00:32 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [EXT] [PATCH v12 18/30] media: subdev: use streams in
 v4l2_subdev_link_validate()
Content-Language: en-US
To:     Satish Nagireddy <satish.nagireddy@getcruise.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-19-tomi.valkeinen@ideasonboard.com>
 <CAG0LG96XkmpP2JmMG+Nxkd0ViCdKbHOhPPqE0JxUKBgK-xrRkw@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAG0LG96XkmpP2JmMG+Nxkd0ViCdKbHOhPPqE0JxUKBgK-xrRkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2022 12:12, Satish Nagireddy wrote:
> Hi Tomi,
> 
> Thanks for the patch.
> 
> On Wed, Jul 27, 2022 at 3:37 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Update v4l2_subdev_link_validate() to use routing and streams for
>> validation.
>>
>> Instead of just looking at the format on the pad on both ends of the
>> link, the routing tables are used to collect all the streams going from
>> the source to the sink over the link, and the streams' formats on both
>> ends of the link are verified.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 255 ++++++++++++++++++++++++--
>>   1 file changed, 235 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index d26715cbd955..7ca2337ca8d3 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -16,6 +16,7 @@
>>   #include <linux/videodev2.h>
>>   #include <linux/export.h>
>>   #include <linux/version.h>
>> +#include <linux/sort.h>
>>
>>   #include <media/v4l2-ctrls.h>
>>   #include <media/v4l2-device.h>
>> @@ -1069,7 +1070,7 @@ int v4l2_subdev_link_validate_default(struct v4l2_subdev *sd,
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_link_validate_default);
>>
>>   static int
>> -v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>> +v4l2_subdev_link_validate_get_format(struct media_pad *pad, u32 stream,
>>                                       struct v4l2_subdev_format *fmt)
>>   {
>>          if (is_media_entity_v4l2_subdev(pad->entity)) {
>> @@ -1078,7 +1079,11 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>
>>                  fmt->which = V4L2_SUBDEV_FORMAT_ACTIVE;
>>                  fmt->pad = pad->index;
>> -               return v4l2_subdev_call_state_active(sd, pad, get_fmt, fmt);
>> +               fmt->stream = stream;
>> +
>> +               return v4l2_subdev_call(sd, pad, get_fmt,
>> +                                       v4l2_subdev_get_locked_active_state(sd),
>> +                                       fmt);
>>          }
>>
>>          WARN(pad->entity->function != MEDIA_ENT_F_IO_V4L,
>> @@ -1088,31 +1093,241 @@ v4l2_subdev_link_validate_get_format(struct media_pad *pad,
>>          return -EINVAL;
>>   }
>>
>> -int v4l2_subdev_link_validate(struct media_link *link)
>> +static int cmp_u32(const void *a, const void *b)
>>   {
>> -       struct v4l2_subdev *sink;
>> -       struct v4l2_subdev_format sink_fmt, source_fmt;
>> -       int rval;
>> +       u32 a32 = *(u32 *)a;
>> +       u32 b32 = *(u32 *)b;
>>
>> -       rval = v4l2_subdev_link_validate_get_format(
>> -               link->source, &source_fmt);
>> -       if (rval < 0)
>> -               return 0;
>> +       return a32 > b32 ? 1 : (a32 < b32 ? -1 : 0);
>> +}
>> +
>> +static int v4l2_link_validate_get_streams(struct media_link *link,
>> +                                         bool is_source, u32 *out_num_streams,
>> +                                         const u32 **out_streams,
>> +                                         bool *allocated)
> 
> I have a suggestion to refactor this function a bit to avoid the usage
> of is_source boolean, hopefully that makes this implementation look
> better.
> Here is my idea: Pass the media_pad (source or sink) to the function
> directly and drop the parameters link and is_source. Then...
> 
>> +{
>> +       static const u32 default_streams[] = { 0 };
>> +       struct v4l2_subdev_krouting *routing;
>> +       struct v4l2_subdev *subdev;
>> +       u32 num_streams;
>> +       u32 *streams;
>> +       unsigned int i;
>> +       struct v4l2_subdev_state *state;
>> +       int ret;
>>
>> -       rval = v4l2_subdev_link_validate_get_format(
>> -               link->sink, &sink_fmt);
>> -       if (rval < 0)
>> +       if (is_source)
>> +               subdev = media_entity_to_v4l2_subdev(link->source->entity);
>> +       else
>> +               subdev = media_entity_to_v4l2_subdev(link->sink->entity);
> 
> ... we can avoid the if check here and directly assign subdev as below.
>       subdev = media_entity_to_v4l2_subdev(pad->entity);
> Then...
> 
>> +
>> +       if (!(subdev->flags & V4L2_SUBDEV_FL_STREAMS)) {
>> +               *out_num_streams = 1;
>> +               *out_streams = default_streams;
>> +               *allocated = false;
>>                  return 0;
>> +       }
>>
>> -       sink = media_entity_to_v4l2_subdev(link->sink->entity);
>> +       state = v4l2_subdev_get_locked_active_state(subdev);
>>
>> -       rval = v4l2_subdev_call(sink, pad, link_validate, link,
>> -                               &source_fmt, &sink_fmt);
>> -       if (rval != -ENOIOCTLCMD)
>> -               return rval;
>> +       routing = &state->routing;
>> +
>> +       streams = kmalloc_array(routing->num_routes, sizeof(u32), GFP_KERNEL);
>> +       if (!streams)
>> +               return -ENOMEM;
>> +
>> +       num_streams = 0;
>> +
>> +       for (i = 0; i < routing->num_routes; ++i) {
>> +               struct v4l2_subdev_route *route = &routing->routes[i];
>> +               int j;
>> +               u32 route_pad;
>> +               u32 route_stream;
>> +               u32 link_pad;
>> +
>> +               if (!(route->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +                       continue;
>> +
>> +               if (is_source) {
>> +                       route_pad = route->source_pad;
>> +                       route_stream = route->source_stream;
>> +                       link_pad = link->source->index;
>> +               } else {
>> +                       route_pad = route->sink_pad;
>> +                       route_stream = route->sink_stream;
>> +                       link_pad = link->sink->index;
>> +               }
> 
> This can be achieved by checking pad->flags against
> MEDIA_PAD_FL_SOURCE or MEDIA_PAD_FL_SINK.
> Please let me know your opinion.

Yes, I like this. It gets rid of that annoying 'is_source' =).

>> +
>> +               if (route_pad != link_pad)
>> +                       continue;
>> +
>> +               /* look for duplicates */
>> +               for (j = 0; j < num_streams; ++j) {
>> +                       if (streams[j] == route_stream) {
>> +                               ret = -EINVAL;
>> +                               goto free_streams;
>> +                       }
>> +               }
> 
> This is good logic, but seems to be a bit inefficient as it is
> repeatedly checking the array from the start.
> I do not have a better idea :)
> 
>> +
>> +               streams[num_streams++] = route_stream;
>> +       }
>> +
>> +       sort(streams, num_streams, sizeof(u32), &cmp_u32, NULL);
>> +
>> +       *out_num_streams = num_streams;
>> +       *out_streams = streams;
>> +       *allocated = true;
>> +
>> +       return 0;
>> +
>> +free_streams:
>> +       kfree(streams);
>> +
>> +       return ret;
>> +}
>> +
>> +static int v4l2_subdev_link_validate_locked(struct media_link *link)
>> +{
>> +       struct v4l2_subdev *sink_subdev =
>> +               media_entity_to_v4l2_subdev(link->sink->entity);
>> +       struct device *dev = sink_subdev->entity.graph_obj.mdev->dev;
>> +       u32 num_source_streams;
>> +       const u32 *source_streams;
>> +       bool source_allocated;
>> +       u32 num_sink_streams;
>> +       const u32 *sink_streams;
>> +       bool sink_allocated;
>> +       unsigned int sink_idx;
>> +       unsigned int source_idx;
>> +       int ret;
>> +
>> +       dev_dbg(dev, "validating link \"%s\":%u -> \"%s\":%u\n",
>> +               link->source->entity->name, link->source->index,
>> +               link->sink->entity->name, link->sink->index);
>> +
>> +       ret = v4l2_link_validate_get_streams(link, true, &num_source_streams,
> 
> This function call can be modified as below
>      v4l2_link_validate_get_streams(link->source, &num_source_streams,
> 
>> +                                            &source_streams,
>> +                                            &source_allocated);
>> +       if (ret)
>> +               return ret;
>> +
>> +       ret = v4l2_link_validate_get_streams(link, false, &num_sink_streams,
> 
> This function call can be modified as below
>      v4l2_link_validate_get_streams(link->sink, &num_source_streams,
> 
> 
>> +                                            &sink_streams, &sink_allocated);
>> +       if (ret)
>> +               goto free_source;
>> +
>> +       /*
>> +        * It is ok to have more source streams than sink streams as extra
>> +        * source streams can just be ignored by the receiver, but having extra
>> +        * sink streams is an error as streams must have a source.
>> +        */
>> +       if (num_source_streams < num_sink_streams) {
>> +               dev_err(dev,
>> +                       "Not enough source streams: %d < %d\n",
>> +                       num_source_streams, num_sink_streams);
>> +               ret = -EINVAL;
>> +               goto free_sink;
>> +       }
>> +
>> +       /* Validate source and sink stream formats */
>> +
>> +       source_idx = 0;
> 
> Nit, This can be assigned at the declaration.

True, but I often like to initialize the variables closer to the
use if the function is a bit on the longer side.

Although nowadays we could do:

for (unsigned int sink_idx = 0, source_idx = 0; sink_idx < num_sink_streams; ++sink_idx) {

  Tomi
