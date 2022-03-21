Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D4CCD4E2479
	for <lists+linux-media@lfdr.de>; Mon, 21 Mar 2022 11:37:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346405AbiCUKjQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 21 Mar 2022 06:39:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238264AbiCUKjM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 21 Mar 2022 06:39:12 -0400
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99FD0141FED
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 03:37:47 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 22LAbaHD021253;
        Mon, 21 Mar 2022 05:37:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1647859056;
        bh=n+ae04x6/Zjr2g0bUduYtkrYR9bZNC/+hFlL65D0gJ4=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=KNUeb59yzRYvHw+urKcw88aU9H7Gj0X19joiMj1za+bdhnaFxdUmIq6NM6gaoQJs7
         xkCyg3yVZ1oyJRHPHvZOwZKF2Vr1OwlN+8SpAb5yaXKCbzR9RwmvxYAAd80efeflDt
         DST/10xeFzPYyoe8pHa6sV5gU8UfSz0W6idp7jnQ=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 22LAbanl056203
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 21 Mar 2022 05:37:36 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 21
 Mar 2022 05:37:36 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 21 Mar 2022 05:37:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 22LAbZ6S024489;
        Mon, 21 Mar 2022 05:37:35 -0500
Date:   Mon, 21 Mar 2022 16:07:34 +0530
From:   Pratyush Yadav <p.yadav@ti.com>
To:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
CC:     <linux-media@vger.kernel.org>, <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        <niklas.soderlund+renesas@ragnatech.se>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: Re: [PATCH v1 3/4] media-ctl: add support for routes and streams
Message-ID: <20220321103734.yl6xdidu2c5rc26x@ti.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
 <20211130141815.892354-4-tomi.valkeinen@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20211130141815.892354-4-tomi.valkeinen@ideasonboard.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Spam-Status: No, score=-4.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomi,

On 30/11/21 04:18PM, Tomi Valkeinen wrote:
> Add support to get and set subdev routes and to get and set
> configurations per stream.
> 
> Based on work from Sakari Ailus <sakari.ailus@linux.intel.com>.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

I tried this on TI's downstream fork with your routing patches. It works 
fine for setting and viewing formats and routes.

Tested-by: Pratyush Yadav <p.yadav@ti.com>

I have not gone through the code too thoroughly. A few small things I 
noticed below.

> ---
>  utils/media-ctl/libmediactl.c   |  41 +++++
>  utils/media-ctl/libv4l2subdev.c | 256 ++++++++++++++++++++++++++++----
>  utils/media-ctl/media-ctl.c     | 113 +++++++++++---
>  utils/media-ctl/mediactl.h      |  16 ++
>  utils/media-ctl/options.c       |  15 +-
>  utils/media-ctl/options.h       |   1 +
>  utils/media-ctl/v4l2subdev.h    |  58 +++++++-
>  7 files changed, 444 insertions(+), 56 deletions(-)
> 
[...]
> +int v4l2_subdev_get_routing(struct media_entity *entity,
> +			    struct v4l2_subdev_route **routes,
> +			    unsigned int *num_routes)
> +{
> +	struct v4l2_subdev_routing routing = { 0 };
> +	struct v4l2_subdev_route *r;
> +	int ret;
> +
> +	ret = v4l2_subdev_open(entity);
> +	if (ret < 0)
> +		return ret;
> +
> +	routing.which = V4L2_SUBDEV_FORMAT_ACTIVE;
> +
> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
> +	if (ret == -1 && errno != ENOSPC)
> +		return -errno;
> +
> +	r = calloc(routing.num_routes, sizeof(*r));
> +	if (!r)

calloc man page says:

  If nmemb or size is 0, then calloc() returns either NULL, or a unique 
  pointer value that can later be successfully passed to free().

So if a subdev reports 0 routes then you could end up with a non-NULL 
pointer that you should not use, other than to pass to free(). I don't 
know if any implementation out there does actually return anything other 
than NULL though. I suggest explicitly checking for num_routes == 0 to 
avoid all this.

> +		return -ENOMEM;
> +
> +	routing.routes = (uintptr_t)r;
> +	ret = ioctl(entity->fd, VIDIOC_SUBDEV_G_ROUTING, &routing);
> +	if (ret) {
> +		free(r);
> +		return ret;
> +	}
> +
> +	*num_routes = routing.num_routes;
> +	*routes = r;
> +
> +	return 0;
> +}
> +
>  int v4l2_subdev_get_dv_timings_caps(struct media_entity *entity,
>  	struct v4l2_dv_timings_cap *caps)
>  {
[...]
> @@ -306,6 +370,135 @@ int v4l2_subdev_set_frame_interval(struct media_entity *entity,
>  	return 0;
>  }
>  
> +int v4l2_subdev_parse_setup_routes(struct media_device *media, const char *p)
> +{
> +	struct media_entity *entity;
> +	struct v4l2_subdev_route *routes;
> +	unsigned int num_routes;
> +	char *end;
> +	int ret;
> +	int i;
> +
> +	entity = media_parse_entity(media, p, &end);
> +	if (!entity)
> +		return -EINVAL;
> +
> +	p = end;
> +
> +	if (*p != '[') {
> +		media_dbg(media, "Expected '['\n");
> +		return -EINVAL;
> +	}
> +
> +	p++;
> +
> +	routes = calloc(256, sizeof(routes[0]));

You are not checking for NULL here.

> +	num_routes = 0;
> +
> +	while (*p != 0) {
> +		struct v4l2_subdev_route *r = &routes[num_routes];
> +
> +		/* sink pad/stream */
> +
> +		r->sink_pad = strtoul(p, &end, 10);
> +
> +		if (*end != '/') {
> +			media_dbg(media, "Expected '/'\n");
> +			return -EINVAL;
> +		}
> +
> +		p = end + 1;
> +
> +		r->sink_stream = strtoul(p, &end, 10);
> +
> +		for (; isspace(*end); ++end);
> +
> +		if (end[0] != '-' || end[1] != '>') {
> +			media_dbg(media, "Expected '->'\n");
> +			return -EINVAL;
> +		}
> +		p = end + 2;
> +
> +		/* source pad/stream */
> +
> +		r->source_pad = strtoul(p, &end, 10);
> +
> +		if (*end != '/') {
> +			media_dbg(media, "Expected '/'\n");
> +			return -EINVAL;
> +		}
> +
> +		p = end + 1;
> +
> +		r->source_stream = strtoul(p, &end, 10);
> +
> +		/* flags */
> +
> +		for (; isspace(*end); ++end);
> +
> +		if (*end != '[') {
> +			media_dbg(media, "Expected '['\n");
> +			return -EINVAL;
> +		}
> +
> +		for (end++; isspace(*end); ++end);
> +
> +		p = end;
> +
> +		r->flags = strtoul(p, &end, 0);
> +
> +		if (r->flags & ~(V4L2_SUBDEV_ROUTE_FL_ACTIVE |
> +				 V4L2_SUBDEV_ROUTE_FL_IMMUTABLE |
> +				 V4L2_SUBDEV_ROUTE_FL_SOURCE)) {
> +			media_dbg(media, "Bad route flags %#x\n", r->flags);
> +			return -EINVAL;
> +		}
> +
> +		for (; isspace(*end); ++end);
> +
> +		if (*end != ']') {
> +			media_dbg(media, "Expected ']'\n");
> +			return -EINVAL;
> +		}
> +		end++;
> +
> +		p = end;
> +
> +		num_routes++;
> +
> +		if (*p == ',') {
> +			p++;
> +			continue;
> +		}
> +
> +		break;
> +	}
> +
> +	if (*p != ']') {
> +		media_dbg(media, "Expected ']'\n");
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < num_routes; ++i) {
> +		struct v4l2_subdev_route *r = &routes[i];
> +
> +		media_dbg(entity->media,
> +			  "Setting up route %s : %u/%u -> %u/%u, flags 0x%8.8x\n",
> +			  entity->info.name,
> +			  r->sink_pad, r->sink_stream,
> +			  r->source_pad, r->source_stream,
> +			  r->flags);
> +	}
> +
> +	ret = v4l2_subdev_set_routing(entity, routes, num_routes);
> +	if (ret) {
> +		printf("VIDIOC_SUBDEV_S_ROUTING failed: %d\n", ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int v4l2_subdev_parse_format(struct media_device *media,
>  				    struct v4l2_mbus_framefmt *format,
>  				    const char *p, char **endp)
[...]

-- 
Regards,
Pratyush Yadav
Texas Instruments Inc.
