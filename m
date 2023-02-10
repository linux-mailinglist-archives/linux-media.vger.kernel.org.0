Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 48F14692097
	for <lists+linux-media@lfdr.de>; Fri, 10 Feb 2023 15:15:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232178AbjBJOPh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Feb 2023 09:15:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231904AbjBJOPg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Feb 2023 09:15:36 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF6E71E299
        for <linux-media@vger.kernel.org>; Fri, 10 Feb 2023 06:15:33 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6107C886;
        Fri, 10 Feb 2023 15:15:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1676038530;
        bh=vg+85/3JGaAnlq11Z487uYpPeSNlmUUBtMP9aheVCwM=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Lc6r8VI7yIVICK0y5Yh6gTD9HVLgj18ctycl9VLxu/TFpvviSsvPahMwmJwCORRUJ
         UkgCeEmvO4oIExxSqVlffPuMED6uYGwTJ56ihrE/O+LPo3GMFQG0CDfJI1LDaqqmwQ
         9DQPRqgZw/IXm1TbFMDRT16lrjqSbu7vJ6IFdKu8=
Message-ID: <bddd242b-d509-4d8d-9fb1-1424875e67d0@ideasonboard.com>
Date:   Fri, 10 Feb 2023 16:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 2/3] media-ctl: add support for routes and streams
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
References: <20230210115546.199809-1-tomi.valkeinen@ideasonboard.com>
 <20230210115546.199809-3-tomi.valkeinen@ideasonboard.com>
 <Y+ZCXCrRSAkTwXOv@kekkonen.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y+ZCXCrRSAkTwXOv@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_PDS_OTHER_BAD_TLD,URIBL_BLACK autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 10/02/2023 15:10, Sakari Ailus wrote:
> Hi Tomi,
> 
> Thanks for the patch.
> 
> On Fri, Feb 10, 2023 at 01:55:45PM +0200, Tomi Valkeinen wrote:
>> Add support to get and set subdev routes and to get and set
>> configurations per stream.
>>
>> Based on work from Sakari Ailus <sakari.ailus@linux.intel.com>.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   utils/media-ctl/libmediactl.c   |  41 +++++
>>   utils/media-ctl/libv4l2subdev.c | 283 ++++++++++++++++++++++++++++----
>>   utils/media-ctl/media-ctl.c     | 121 ++++++++++++--
>>   utils/media-ctl/mediactl.h      |  16 ++
>>   utils/media-ctl/options.c       |  15 +-
>>   utils/media-ctl/options.h       |   1 +
>>   utils/media-ctl/v4l2subdev.h    |  58 ++++++-
>>   7 files changed, 478 insertions(+), 57 deletions(-)
>>
>> diff --git a/utils/media-ctl/libmediactl.c b/utils/media-ctl/libmediactl.c
>> index 1fd6525b..537365d0 100644
>> --- a/utils/media-ctl/libmediactl.c
>> +++ b/utils/media-ctl/libmediactl.c
>> @@ -876,6 +876,47 @@ struct media_pad *media_parse_pad(struct media_device *media,
>>   	return &entity->pads[pad];
>>   }
>>   
>> +struct media_pad *media_parse_pad_stream(struct media_device *media,
>> +					 const char *p, unsigned int *stream,
>> +					 char **endp)
>> +{
>> +	struct media_pad *pad;
>> +	const char *orig_p = p;
>> +	char *ep;
>> +
>> +	pad = media_parse_pad(media, p, &ep);
>> +	if (pad == NULL)
>> +		return NULL;
>> +
>> +	p = ep;
>> +
>> +	if (*p == '/') {
>> +		unsigned int s;
>> +
>> +		p++;
>> +
>> +		s = strtoul(p, &ep, 10);
>> +
>> +		if (ep == p) {
>> +			printf("Unable to parse stream: '%s'\n", orig_p);
> 
> media_dbg()?

Right.

>> +			if (endp)
>> +				*endp = (char*)p;
>> +			return NULL;
>> +		}
>> +
>> +		*stream = s;
>> +
>> +		p++;
>> +	} else {
>> +		*stream = 0;
>> +	}
>> +
>> +	if (endp)
>> +		*endp = (char*)p;
>> +
>> +	return pad;
>> +}
>> +
>>   struct media_link *media_parse_link(struct media_device *media,
>>   				    const char *p, char **endp)
>>   {
>> diff --git a/utils/media-ctl/libv4l2subdev.c b/utils/media-ctl/libv4l2subdev.c
>> index 63bb3d75..d203e5b4 100644
>> --- a/utils/media-ctl/libv4l2subdev.c
>> +++ b/utils/media-ctl/libv4l2subdev.c
>> @@ -64,7 +64,7 @@ void v4l2_subdev_close(struct media_entity *entity)
>>   }
>>   
>>   int v4l2_subdev_get_format(struct media_entity *entity,
>> -	struct v4l2_mbus_framefmt *format, unsigned int pad,
>> +	struct v4l2_mbus_framefmt *format, unsigned int pad, unsigned int stream,
>>   	enum v4l2_subdev_format_whence which)
>>   {
>>   	struct v4l2_subdev_format fmt;
>> @@ -76,6 +76,7 @@ int v4l2_subdev_get_format(struct media_entity *entity,
>>   
>>   	memset(&fmt, 0, sizeof(fmt));
>>   	fmt.pad = pad;
>> +	fmt.stream = stream;
>>   	fmt.which = which;
>>   
>>   	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_FMT, &fmt);
>> @@ -88,6 +89,7 @@ int v4l2_subdev_get_format(struct media_entity *entity,
>>   
>>   int v4l2_subdev_set_format(struct media_entity *entity,
>>   	struct v4l2_mbus_framefmt *format, unsigned int pad,
>> +	unsigned int stream,
>>   	enum v4l2_subdev_format_whence which)
>>   {
>>   	struct v4l2_subdev_format fmt;
>> @@ -99,6 +101,7 @@ int v4l2_subdev_set_format(struct media_entity *entity,
>>   
>>   	memset(&fmt, 0, sizeof(fmt));
>>   	fmt.pad = pad;
>> +	fmt.stream = stream;
>>   	fmt.which = which;
>>   	fmt.format = *format;
>>   
>> @@ -111,8 +114,8 @@ int v4l2_subdev_set_format(struct media_entity *entity,
>>   }
>>   
>>   int v4l2_subdev_get_selection(struct media_entity *entity,
>> -	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
>> -	enum v4l2_subdev_format_whence which)
>> +	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
>> +	unsigned int target, enum v4l2_subdev_format_whence which)
>>   {
>>   	union {
>>   		struct v4l2_subdev_selection sel;
>> @@ -150,8 +153,8 @@ int v4l2_subdev_get_selection(struct media_entity *entity,
>>   }
>>   
>>   int v4l2_subdev_set_selection(struct media_entity *entity,
>> -	struct v4l2_rect *rect, unsigned int pad, unsigned int target,
>> -	enum v4l2_subdev_format_whence which)
>> +	struct v4l2_rect *rect, unsigned int pad, unsigned int stream,
>> +	unsigned int target, enum v4l2_subdev_format_whence which)
>>   {
>>   	union {
>>   		struct v4l2_subdev_selection sel;
>> @@ -165,6 +168,7 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
>>   
>>   	memset(&u.sel, 0, sizeof(u.sel));
>>   	u.sel.pad = pad;
>> +	u.sel.stream = stream;
>>   	u.sel.target = target;
>>   	u.sel.which = which;
>>   	u.sel.r = *rect;
>> @@ -179,6 +183,7 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
>>   
>>   	memset(&u.crop, 0, sizeof(u.crop));
>>   	u.crop.pad = pad;
>> +	u.crop.stream = stream;
>>   	u.crop.which = which;
>>   	u.crop.rect = *rect;
>>   
>> @@ -190,6 +195,69 @@ int v4l2_subdev_set_selection(struct media_entity *entity,
>>   	return 0;
>>   }
>>   
>> +int v4l2_subdev_set_routing(struct media_entity *entity,
>> +			    struct v4l2_subdev_route *routes,
>> +			    unsigned int num_routes)
>> +{
>> +	struct v4l2_subdev_routing routing = {
>> +		.which = V4L2_SUBDEV_FORMAT_ACTIVE,
>> +		.routes = (uintptr_t)routes,
>> +		.num_routes = num_routes,
>> +	};
>> +	int ret;
>> +
>> +	ret = v4l2_subdev_open(entity);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_ROUTING, &routing);
>> +	if (ret == -1)
>> +		return -errno;
>> +
>> +	return 0;
>> +}
>> +
>> +int v4l2_subdev_get_routing(struct media_entity *entity,
>> +			    struct v4l2_subdev_route **routes,
>> +			    unsigned int *num_routes)
>> +{
>> +	struct v4l2_subdev_routing routing = { 0 };
>> +	struct v4l2_subdev_route *r;
>> +	int ret;
>> +
>> +	ret = v4l2_subdev_open(entity);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> 
> You can assing this in variable declaration.

Ok.

>> +
>> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
>> +	if (ret == -1 && errno != ENOSPC)
>> +		return -errno;
>> +
>> +	if (!routing.num_routes) {
>> +		*routes = NULL;
>> +		*num_routes = 0;
>> +		return 0;
>> +	}
>> +
>> +	r = calloc(routing.num_routes, sizeof(*r));
>> +	if (!r)
>> +		return -ENOMEM;
>> +
>> +	routing.routes = (uintptr_t)r;
>> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
>> +	if (ret) {
>> +		free(r);
>> +		return ret;
>> +	}
>> +
>> +	*num_routes = routing.num_routes;
>> +	*routes = r;
>> +
>> +	return 0;
>> +}
>> +
>>   int v4l2_subdev_get_dv_timings_caps(struct media_entity *entity,
>>   	struct v4l2_dv_timings_cap *caps)
>>   {
>> @@ -264,7 +332,7 @@ int v4l2_subdev_set_dv_timings(struct media_entity *entity,
>>   
>>   int v4l2_subdev_get_frame_interval(struct media_entity *entity,
>>   				   struct v4l2_fract *interval,
>> -				   unsigned int pad)
>> +				   unsigned int pad, unsigned int stream)
>>   {
>>   	struct v4l2_subdev_frame_interval ival;
>>   	int ret;
>> @@ -275,6 +343,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
>>   
>>   	memset(&ival, 0, sizeof(ival));
>>   	ival.pad = pad;
>> +	ival.stream = stream;
>>   
>>   	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_FRAME_INTERVAL, &ival);
>>   	if (ret < 0)
>> @@ -286,7 +355,7 @@ int v4l2_subdev_get_frame_interval(struct media_entity *entity,
>>   
>>   int v4l2_subdev_set_frame_interval(struct media_entity *entity,
>>   				   struct v4l2_fract *interval,
>> -				   unsigned int pad)
>> +				   unsigned int pad, unsigned int stream)
>>   {
>>   	struct v4l2_subdev_frame_interval ival;
>>   	int ret;
>> @@ -297,6 +366,7 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
>>   
>>   	memset(&ival, 0, sizeof(ival));
>>   	ival.pad = pad;
>> +	ival.stream = stream;
>>   	ival.interval = *interval;
>>   
>>   	ret = ioctl(entity->fd, VIDIOC_SUBDEV_S_FRAME_INTERVAL, &ival);
>> @@ -307,6 +377,155 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
>>   	return 0;
>>   }
>>   
>> +static int v4l2_subdev_parse_setup_route(struct media_device *media,
>> +					 struct v4l2_subdev_route *r,
>> +					 const char *p, char **endp)
>> +{
>> +	char *end;
>> +
>> +	/* sink pad/stream */
> 
> You could remove the emply lines in places like this. Up to you.

It refers to multiple lines below. I usually leave a blank line in cases 
like this.

>> +
>> +	r->sink_pad = strtoul(p, &end, 10);
>> +
> 
> And this, too.

Ok.

>> +	if (*end != '/') {
>> +		media_dbg(media, "Expected '/'\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	p = end + 1;
>> +
>> +	r->sink_stream = strtoul(p, &end, 10);
>> +
>> +	for (; isspace(*end); ++end);
>> +
>> +	if (end[0] != '-' || end[1] != '>') {
>> +		media_dbg(media, "Expected '->'\n");
>> +		return -EINVAL;
>> +	}
>> +	p = end + 2;
>> +
>> +	/* source pad/stream */
>> +
>> +	r->source_pad = strtoul(p, &end, 10);
>> +
>> +	if (*end != '/') {
>> +		media_dbg(media, "Expected '/'\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	p = end + 1;
>> +
>> +	r->source_stream = strtoul(p, &end, 10);
>> +
>> +	/* flags */
>> +
>> +	for (; isspace(*end); ++end);
>> +
>> +	if (*end != '[') {
>> +		media_dbg(media, "Expected '['\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (end++; isspace(*end); ++end);
>> +
>> +	p = end;
>> +
>> +	r->flags = strtoul(p, &end, 0);
>> +
>> +	if (r->flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE)) {
>> +		media_dbg(media, "Bad route flags %#x\n", r->flags);
>> +		return -EINVAL;
>> +	}
>> +
>> +	for (; isspace(*end); ++end);
>> +
>> +	if (*end != ']') {
>> +		media_dbg(media, "Expected ']'\n");
>> +		return -EINVAL;
>> +	}
>> +	end++;
>> +
>> +	*endp = end;
>> +
>> +	return 0;
>> +}
>> +
>> +int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
>> +{
>> +	struct media_entity *entity;
>> +	struct v4l2_subdev_route *routes;
>> +	unsigned int num_routes;
>> +	char *end;
>> +	int ret;
>> +	int i;
>> +
>> +	entity = media_parse_entity(media, p, &end);
>> +	if (!entity)
>> +		return -EINVAL;
>> +
>> +	p = end;
>> +
>> +	if (*p != '[') {
>> +		media_dbg(media, "Expected '['\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	p++;
>> +
>> +	routes = calloc(256, sizeof(routes[0]));
>> +	if (!routes)
>> +		return -ENOMEM;
>> +
>> +	num_routes = 0;
>> +
>> +	while (*p != 0) {
>> +		struct v4l2_subdev_route *r = &routes[num_routes];
>> +
>> +		ret = v4l2_subdev_parse_setup_route(media, r, p, &end);
>> +		if (ret)
>> +			goto out;
>> +
>> +		p = end;
>> +
>> +		num_routes++;
>> +
>> +		if (*p == ',') {
>> +			p++;
>> +			continue;
>> +		}
>> +
>> +		break;
>> +	}
>> +
>> +	if (*p != ']') {
>> +		media_dbg(media, "Expected ']'\n");
>> +		ret = -EINVAL;
>> +		goto out;
>> +	}
>> +
>> +	for (i = 0; i < num_routes; ++i) {
>> +		struct v4l2_subdev_route *r = &routes[i];
>> +
>> +		media_dbg(entity->media,
>> +			  "Setting up route %s : %u/%u -> %u/%u, flags 0x%8.8x\n",
>> +			  entity->info.name,
>> +			  r->sink_pad, r->sink_stream,
>> +			  r->source_pad, r->source_stream,
>> +			  r->flags);
>> +	}
>> +
>> +	ret = v4l2_subdev_set_routing(entity, routes, num_routes);
>> +	if (ret) {
>> +		printf("VIDIOC_SUBDEV_S_ROUTING failed: %d\n", ret);
>> +		goto out;
>> +	}
>> +
>> +out:
>> +	free(routes);
>> +
>> +	return ret;
>> +}
>> +
>>   static int v4l2_subdev_parse_format(struct media_device *media,
>>   				    struct v4l2_mbus_framefmt *format,
>>   				    const char *p, char **endp)
>> @@ -442,7 +661,8 @@ static bool strhazit(const char *str, const char **p)
>>   }
>>   
>>   static struct media_pad *v4l2_subdev_parse_pad_format(
>> -	struct media_device *media, struct v4l2_mbus_framefmt *format,
>> +	struct media_device *media, unsigned int *stream,
>> +	struct v4l2_mbus_framefmt *format,
>>   	struct v4l2_rect *crop, struct v4l2_rect *compose,
>>   	struct v4l2_fract *interval, const char *p, char **endp)
>>   {
>> @@ -453,7 +673,7 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
>>   
>>   	for (; isspace(*p); ++p);
>>   
>> -	pad = media_parse_pad(media, p, &end);
>> +	pad = media_parse_pad_stream(media, p, stream, &end);
>>   	if (pad == NULL) {
>>   		*endp = end;
>>   		return NULL;
>> @@ -675,6 +895,7 @@ static struct media_pad *v4l2_subdev_parse_pad_format(
>>   }
>>   
>>   static int set_format(struct media_pad *pad,
>> +		      unsigned int stream,
>>   		      struct v4l2_mbus_framefmt *format)
>>   {
>>   	int ret;
>> @@ -683,12 +904,12 @@ static int set_format(struct media_pad *pad,
>>   		return 0;
>>   
>>   	media_dbg(pad->entity->media,
>> -		  "Setting up format %s %ux%u on pad %s/%u\n",
>> +		  "Setting up format %s %ux%u on pad %s/%u/%u\n",
>>   		  v4l2_subdev_pixelcode_to_string(format->code),
>>   		  format->width, format->height,
>> -		  pad->entity->info.name, pad->index);
>> +		  pad->entity->info.name, pad->index, stream);
>>   
>> -	ret = v4l2_subdev_set_format(pad->entity, format, pad->index,
>> +	ret = v4l2_subdev_set_format(pad->entity, format, pad->index, stream,
>>   				     V4L2_SUBDEV_FORMAT_ACTIVE);
>>   	if (ret < 0) {
>>   		media_dbg(pad->entity->media,
>> @@ -705,8 +926,8 @@ static int set_format(struct media_pad *pad,
>>   	return 0;
>>   }
>>   
>> -static int set_selection(struct media_pad *pad, unsigned int target,
>> -			 struct v4l2_rect *rect)
>> +static int set_selection(struct media_pad *pad, unsigned int stream,
>> +			 unsigned int target, struct v4l2_rect *rect)
>>   {
>>   	int ret;
>>   
>> @@ -714,11 +935,11 @@ static int set_selection(struct media_pad *pad, unsigned int target,
>>   		return 0;
>>   
>>   	media_dbg(pad->entity->media,
>> -		  "Setting up selection target %u rectangle (%u,%u)/%ux%u on pad %s/%u\n",
>> +		  "Setting up selection target %u rectangle (%u,%u)/%ux%u on pad %s/%u/%u\n",
>>   		  target, rect->left, rect->top, rect->width, rect->height,
>> -		  pad->entity->info.name, pad->index);
>> +		  pad->entity->info.name, pad->index, stream);
>>   
>> -	ret = v4l2_subdev_set_selection(pad->entity, rect, pad->index,
>> +	ret = v4l2_subdev_set_selection(pad->entity, rect, pad->index, stream,
>>   					target, V4L2_SUBDEV_FORMAT_ACTIVE);
>>   	if (ret < 0) {
>>   		media_dbg(pad->entity->media,
>> @@ -734,7 +955,7 @@ static int set_selection(struct media_pad *pad, unsigned int target,
>>   	return 0;
>>   }
>>   
>> -static int set_frame_interval(struct media_pad *pad,
>> +static int set_frame_interval(struct media_pad *pad, unsigned int stream,
>>   			      struct v4l2_fract *interval)
>>   {
>>   	int ret;
>> @@ -743,11 +964,12 @@ static int set_frame_interval(struct media_pad *pad,
>>   		return 0;
>>   
>>   	media_dbg(pad->entity->media,
>> -		  "Setting up frame interval %u/%u on pad %s/%u\n",
>> +		  "Setting up frame interval %u/%u on pad %s/%u/%u\n",
>>   		  interval->numerator, interval->denominator,
>> -		  pad->entity->info.name, pad->index);
>> +		  pad->entity->info.name, pad->index, stream);
>>   
>> -	ret = v4l2_subdev_set_frame_interval(pad->entity, interval, pad->index);
>> +	ret = v4l2_subdev_set_frame_interval(pad->entity, interval, pad->index,
>> +					     stream);
>>   	if (ret < 0) {
>>   		media_dbg(pad->entity->media,
>>   			  "Unable to set frame interval: %s (%d)",
>> @@ -770,11 +992,13 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
>>   	struct v4l2_rect crop = { -1, -1, -1, -1 };
>>   	struct v4l2_rect compose = crop;
>>   	struct v4l2_fract interval = { 0, 0 };
>> +	unsigned int stream;
>>   	unsigned int i;
>>   	char *end;
>>   	int ret;
>>   
>> -	pad = v4l2_subdev_parse_pad_format(media, &format, &crop, &compose,
>> +	pad = v4l2_subdev_parse_pad_format(media, &stream,
>> +					   &format, &crop, &compose,
>>   					   &interval, p, &end);
>>   	if (pad == NULL) {
>>   		media_print_streampos(media, p, end);
>> @@ -783,30 +1007,29 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
>>   	}
>>   
>>   	if (pad->flags & MEDIA_PAD_FL_SINK) {
>> -		ret = set_format(pad, &format);
>> +		ret = set_format(pad, stream, &format);
>>   		if (ret < 0)
>>   			return ret;
>>   	}
>>   
>> -	ret = set_selection(pad, V4L2_SEL_TGT_CROP, &crop);
>> +	ret = set_selection(pad, stream, V4L2_SEL_TGT_CROP, &crop);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -	ret = set_selection(pad, V4L2_SEL_TGT_COMPOSE, &compose);
>> +	ret = set_selection(pad, stream, V4L2_SEL_TGT_COMPOSE, &compose);
>>   	if (ret < 0)
>>   		return ret;
>>   
>>   	if (pad->flags & MEDIA_PAD_FL_SOURCE) {
>> -		ret = set_format(pad, &format);
>> +		ret = set_format(pad, stream, &format);
>>   		if (ret < 0)
>>   			return ret;
>>   	}
>>   
>> -	ret = set_frame_interval(pad, &interval);
>> +	ret = set_frame_interval(pad, stream, &interval);
>>   	if (ret < 0)
>>   		return ret;
>>   
>> -
>>   	/* If the pad is an output pad, automatically set the same format and
>>   	 * frame interval on the remote subdev input pads, if any.
>>   	 */
>> @@ -821,9 +1044,9 @@ static int v4l2_subdev_parse_setup_format(struct media_device *media,
>>   			if (link->source == pad &&
>>   			    link->sink->entity->info.type == MEDIA_ENT_T_V4L2_SUBDEV) {
>>   				remote_format = format;
>> -				set_format(link->sink, &remote_format);
>> +				set_format(link->sink, stream, &remote_format);
>>   
>> -				ret = set_frame_interval(link->sink, &interval);
>> +				ret = set_frame_interval(link->sink, stream, &interval);
>>   				if (ret < 0 && ret != -EINVAL && ret != -ENOTTY)
>>   					return ret;
>>   			}
>> diff --git a/utils/media-ctl/media-ctl.c b/utils/media-ctl/media-ctl.c
>> index 84ee7a83..831136a0 100644
>> --- a/utils/media-ctl/media-ctl.c
>> +++ b/utils/media-ctl/media-ctl.c
>> @@ -28,6 +28,7 @@
>>   #include <errno.h>
>>   #include <fcntl.h>
>>   #include <stdbool.h>
>> +#include <stdint.h>
>>   #include <stdio.h>
>>   #include <stdlib.h>
>>   #include <string.h>
>> @@ -75,23 +76,43 @@ static void print_flags(const struct flag_name *flag_names, unsigned int num_ent
>>   	}
>>   }
>>   
>> +static void v4l2_subdev_print_routes(struct media_entity *entity,
>> +				     struct v4l2_subdev_route *routes,
>> +				     unsigned int num_routes)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < num_routes; i++) {
>> +		const struct v4l2_subdev_route *r = &routes[i];
>> +
>> +		if (i == 0)
>> +			printf("\troutes:\n");
>> +
>> +		printf("\t\t%u/%u -> %u/%u [%s]\n",
>> +		       r->sink_pad, r->sink_stream,
>> +		       r->source_pad, r->source_stream,
>> +		       r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE ? "ACTIVE" : "INACTIVE");
>> +	}
>> +}
>> +
>>   static void v4l2_subdev_print_format(struct media_entity *entity,
>> -	unsigned int pad, enum v4l2_subdev_format_whence which)
>> +	unsigned int pad, unsigned int stream,
>> +	enum v4l2_subdev_format_whence which)
>>   {
>>   	struct v4l2_mbus_framefmt format;
>>   	struct v4l2_fract interval = { 0, 0 };
>>   	struct v4l2_rect rect;
>>   	int ret;
>>   
>> -	ret = v4l2_subdev_get_format(entity, &format, pad, which);
>> +	ret = v4l2_subdev_get_format(entity, &format, pad, stream, which);
>>   	if (ret != 0)
>>   		return;
>>   
>> -	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad);
>> +	ret = v4l2_subdev_get_frame_interval(entity, &interval, pad, stream);
>>   	if (ret != 0 && ret != -ENOTTY && ret != -EINVAL)
>>   		return;
>>   
>> -	printf("\t\t[fmt:%s/%ux%u",
>> +	printf("\t\t[stream:%u fmt:%s/%ux%u", stream,
>>   	       v4l2_subdev_pixelcode_to_string(format.code),
>>   	       format.width, format.height);
>>   
>> @@ -118,28 +139,28 @@ static void v4l2_subdev_print_format(struct media_entity *entity,
>>   			       v4l2_subdev_quantization_to_string(format.quantization));
>>   	}
>>   
>> -	ret = v4l2_subdev_get_selection(entity, &rect, pad,
>> +	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
>>   					V4L2_SEL_TGT_CROP_BOUNDS,
>>   					which);
>>   	if (ret == 0)
>>   		printf("\n\t\t crop.bounds:(%u,%u)/%ux%u", rect.left, rect.top,
>>   		       rect.width, rect.height);
>>   
>> -	ret = v4l2_subdev_get_selection(entity, &rect, pad,
>> +	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
>>   					V4L2_SEL_TGT_CROP,
>>   					which);
>>   	if (ret == 0)
>>   		printf("\n\t\t crop:(%u,%u)/%ux%u", rect.left, rect.top,
>>   		       rect.width, rect.height);
>>   
>> -	ret = v4l2_subdev_get_selection(entity, &rect, pad,
>> +	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
>>   					V4L2_SEL_TGT_COMPOSE_BOUNDS,
>>   					which);
>>   	if (ret == 0)
>>   		printf("\n\t\t compose.bounds:(%u,%u)/%ux%u",
>>   		       rect.left, rect.top, rect.width, rect.height);
>>   
>> -	ret = v4l2_subdev_get_selection(entity, &rect, pad,
>> +	ret = v4l2_subdev_get_selection(entity, &rect, pad, stream,
>>   					V4L2_SEL_TGT_COMPOSE,
>>   					which);
>>   	if (ret == 0)
>> @@ -455,16 +476,58 @@ static void media_print_topology_dot(struct media_device *media)
>>   }
>>   
>>   static void media_print_pad_text(struct media_entity *entity,
>> -				 const struct media_pad *pad)
>> +				 const struct media_pad *pad,
>> +				 struct v4l2_subdev_route *routes,
>> +				 unsigned int num_routes)
>>   {
>> +	unsigned int i;
>> +	uint64_t printed_streams_mask;
>> +
>>   	if (media_entity_type(entity) != MEDIA_ENT_T_V4L2_SUBDEV)
>>   		return;
>>   
>> -	v4l2_subdev_print_format(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
>> -	v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +	if (!routes) {
>> +		v4l2_subdev_print_format(entity, pad->index, 0, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +
>> +		if (pad->flags & MEDIA_PAD_FL_SOURCE)
>> +			v4l2_subdev_print_subdev_dv(entity);
>> +
>> +		return;
>> +	}
>> +
>> +	printed_streams_mask = 0;
>> +
>> +	for (i = 0; i < num_routes; ++i) {
>> +		const struct v4l2_subdev_route *r = &routes[i];
>> +		unsigned int stream;
>>   
>> -	if (pad->flags & MEDIA_PAD_FL_SOURCE)
>> -		v4l2_subdev_print_subdev_dv(entity);
>> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
>> +
>> +		if (pad->flags & MEDIA_PAD_FL_SINK) {
>> +			if (r->sink_pad != pad->index)
>> +				continue;
>> +
>> +			stream = r->sink_stream;
>> +		} else {
>> +			if (r->source_pad != pad->index)
>> +				continue;
>> +
>> +			stream = r->source_stream;
>> +		}
>> +
>> +		if (printed_streams_mask & (1 << stream))
>> +			continue;
>> +
>> +		v4l2_subdev_print_format(entity, pad->index, stream, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +
>> +		if (pad->flags & MEDIA_PAD_FL_SOURCE)
>> +			v4l2_subdev_print_subdev_dv(entity);
>> +
>> +		printed_streams_mask |= (1 << stream);
>> +	}
>>   }
>>   
>>   static void media_print_topology_text_entity(struct media_device *media,
>> @@ -480,11 +543,17 @@ static void media_print_topology_text_entity(struct media_device *media,
>>   	unsigned int num_links = media_entity_get_links_count(entity);
>>   	unsigned int j, k;
>>   	unsigned int padding;
>> +	struct v4l2_subdev_route *routes = NULL;
>> +	unsigned int num_routes = 0;
>> +
>> +	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
>> +		v4l2_subdev_get_routing(entity, &routes, &num_routes);
>>   
>>   	padding = printf("- entity %u: ", info->id);
>> -	printf("%s (%u pad%s, %u link%s)\n", info->name,
>> +	printf("%s (%u pad%s, %u link%s, %u route%s)\n", info->name,
>>   	       info->pads, info->pads > 1 ? "s" : "",
>> -	       num_links, num_links > 1 ? "s" : "");
>> +	       num_links, num_links > 1 ? "s" : "",
>> +	       num_routes, num_routes > 1 ? "s" : "");
>>   	printf("%*ctype %s subtype %s flags %x\n", padding, ' ',
>>   	       media_entity_type_to_string(info->type),
>>   	       media_entity_subtype_to_string(info->type),
>> @@ -492,12 +561,15 @@ static void media_print_topology_text_entity(struct media_device *media,
>>   	if (devname)
>>   		printf("%*cdevice node name %s\n", padding, ' ', devname);
>>   
>> +	if (media_entity_type(entity) == MEDIA_ENT_T_V4L2_SUBDEV)
>> +		v4l2_subdev_print_routes(entity, routes, num_routes);
>> +
>>   	for (j = 0; j < info->pads; j++) {
>>   		const struct media_pad *pad = media_entity_get_pad(entity, j);
>>   
>>   		printf("\tpad%u: %s\n", j, media_pad_type_to_string(pad->flags));
>>   
>> -		media_print_pad_text(entity, pad);
>> +		media_print_pad_text(entity, pad, routes, num_routes);
>>   
>>   		for (k = 0; k < num_links; k++) {
>>   			const struct media_link *link = media_entity_get_link(entity, k);
>> @@ -521,6 +593,8 @@ static void media_print_topology_text_entity(struct media_device *media,
>>   		}
>>   	}
>>   	printf("\n");
>> +
>> +	free(routes);
>>   }
>>   
>>   static void media_print_topology_text(struct media_device *media)
>> @@ -594,14 +668,16 @@ int main(int argc, char **argv)
>>   
>>   	if (media_opts.fmt_pad) {
>>   		struct media_pad *pad;
>> +		unsigned int stream;
>> +		char *p;
>>   
>> -		pad = media_parse_pad(media, media_opts.fmt_pad, NULL);
>> +		pad = media_parse_pad_stream(media, media_opts.fmt_pad, &stream, &p);
>>   		if (pad == NULL) {
>>   			printf("Pad '%s' not found\n", media_opts.fmt_pad);
>>   			goto out;
>>   		}
>>   
>> -		v4l2_subdev_print_format(pad->entity, pad->index,
>> +		v4l2_subdev_print_format(pad->entity, pad->index, stream,
>>   					 V4L2_SUBDEV_FORMAT_ACTIVE);
>>   	}
>>   
>> @@ -685,6 +761,15 @@ int main(int argc, char **argv)
>>   		}
>>   	}
>>   
>> +	if (media_opts.routes) {
>> +		ret = v4l2_subdev_parse_setup_routes(media, media_opts.routes);
>> +		if (ret) {
>> +			printf("Unable to setup routes: %s (%d)\n",
>> +			       strerror(-ret), -ret);
>> +			goto out;
>> +		}
>> +	}
>> +
>>   	if (media_opts.interactive) {
>>   		while (1) {
>>   			char buffer[32];
>> diff --git a/utils/media-ctl/mediactl.h b/utils/media-ctl/mediactl.h
>> index af360518..c0fc2962 100644
>> --- a/utils/media-ctl/mediactl.h
>> +++ b/utils/media-ctl/mediactl.h
>> @@ -394,6 +394,22 @@ struct media_entity *media_parse_entity(struct media_device *media,
>>   struct media_pad *media_parse_pad(struct media_device *media,
>>   				  const char *p, char **endp);
>>   
>> +/**
>> + * @brief Parse string to a pad and stream on the media device.
>> + * @param media - media device.
>> + * @param p - input string
>> + * @param stream - pointer to uint where the stream number is stored
>> + * @param endp - pointer to string where parsing ended
>> + *
>> + * Parse NULL terminated string describing a pad and stream and return its struct
>> + * media_pad instance and the stream number.
>> + *
>> + * @return Pointer to struct media_pad on success, NULL on failure.
>> + */
>> +struct media_pad *media_parse_pad_stream(struct media_device *media,
>> +					 const char *p, unsigned int *stream,
>> +					 char **endp);
>> +
>>   /**
>>    * @brief Parse string to a link on the media device.
>>    * @param media - media device.
>> diff --git a/utils/media-ctl/options.c b/utils/media-ctl/options.c
>> index 6d30d3dc..58ddec3c 100644
>> --- a/utils/media-ctl/options.c
>> +++ b/utils/media-ctl/options.c
>> @@ -63,6 +63,7 @@ static void usage(const char *argv0)
>>   	printf("    --get-v4l2 pad	Print the active format on a given pad\n");
>>   	printf("    --get-dv pad        Print detected and current DV timings on a given pad\n");
>>   	printf("    --set-dv pad	Configure DV timings on a given pad\n");
>> +	printf("-R, --set-routes routes Configure routes on a given subdev entity\n");
>>   	printf("-h, --help		Show verbose help and exit\n");
>>   	printf("-i, --interactive	Modify links interactively\n");
>>   	printf("-l, --links links	Comma-separated list of link descriptors to setup\n");
>> @@ -78,7 +79,7 @@ static void usage(const char *argv0)
>>   	printf("Links and formats are defined as\n");
>>   	printf("\tlinks           = link { ',' link } ;\n");
>>   	printf("\tlink            = pad '->' pad '[' flags ']' ;\n");
>> -	printf("\tpad             = entity ':' pad-number ;\n");
>> +	printf("\tpad             = entity ':' pad-number { '/' stream-number } ;\n");
>>   	printf("\tentity          = entity-number | ( '\"' entity-name '\"' ) ;\n");
>>   	printf("\n");
>>   	printf("\tv4l2            = pad '[' v4l2-properties ']' ;\n");
>> @@ -95,11 +96,16 @@ static void usage(const char *argv0)
>>   	printf("\trectangle       = '(' left ',' top, ')' '/' size ;\n");
>>   	printf("\tsize            = width 'x' height ;\n");
>>   	printf("\n");
>> +	printf("\troutes          = entity '[' route { ',' route } ']' ;\n");
>> +	printf("\troute           = pad-number '/' stream-number '->' pad-number '/' stream-number '[' route-flags ']' ;\n");
>> +	printf("\n");
>>   	printf("where the fields are\n");
>>   	printf("\tentity-number   Entity numeric identifier\n");
>>   	printf("\tentity-name     Entity name (string) \n");
>>   	printf("\tpad-number      Pad numeric identifier\n");
>> +	printf("\tstream-number   Stream numeric identifier\n");
>>   	printf("\tflags           Link flags (0: inactive, 1: active)\n");
>> +	printf("\troute-flags     Route flags (bitmask of route flags: active - 0x1, immutable - 0x2, source - 0x4)\n");
> 
> Which of these flags we have defined in the kernel right now?

Oops. I removed to references in actual code, but forgot to remove the 
flags here. Only active exists at the moment.

  Tomi

