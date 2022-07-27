Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B12335824A7
	for <lists+linux-media@lfdr.de>; Wed, 27 Jul 2022 12:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230459AbiG0KmU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 27 Jul 2022 06:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230218AbiG0KmT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 27 Jul 2022 06:42:19 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B672474C2
        for <linux-media@vger.kernel.org>; Wed, 27 Jul 2022 03:42:18 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 42DAA835;
        Wed, 27 Jul 2022 12:42:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1658918536;
        bh=KsaSqTJkHOPhEZIUb+LD/AKVOUw4N6YQOxkyy5EBdVg=;
        h=Date:Subject:To:References:From:In-Reply-To:From;
        b=nyyaL2YaA3cyIIUTgoYxfrFDmAg7cwcM3EVWZfH+RzF7gyb8lojyTYIi2WTj0lFdD
         y8kfEClxoc36thv2tJE2997ULklv4sIBmWjf2e4tOie2TBVGhnuPB2zib/3SJQz2Ap
         ZQUFjw1ltQmSTnMqsYqcV7ZWSQspCwLzshFxijkA=
Message-ID: <8bef1a8f-8526-f72e-4c41-f717e8e5e2db@ideasonboard.com>
Date:   Wed, 27 Jul 2022 13:42:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 00/30] v4l: routing and streams support
Content-Language: en-US
To:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
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

Hi,

# uAPI

This is both a summary of the uAPI changes for routing and streams 
support and a list of the open questions.

# Subdev Cap

Subdev capability V4L2_SUBDEV_CAP_STREAMS tells the userspace that the 
subdev supports routing and streams.

# Stream ID

We use u64 bitmask inside the kernel to represent a set of streams in a 
pad, each bit representing a stream ID, so the stream ID number is 
currently limited to a max of 63 (i.e. max 64  streams per pad). The 
userspace API doesn't have this limitation at the moment, as the stream 
ID number is passed as u32, and we don't have stream masks in the uAPI 
structs. However, the kernel checks that the Stream IDs given in 
S_ROUTING are < 64.

In theory we can increase this number later, as it won't change the 
uAPI. In practice there will be some challenges in how to do the change 
and how to find all the places in the kernel which depend on this.

If it's clear that 64 streams won't be enough, perhaps we already need 
to take some steps toward this. Maybe hiding the type behind a typedef 
and creating a set of macros/functions which need to be used to access 
the data.

# Routing

```
#define VIDIOC_SUBDEV_G_ROUTING                        _IOWR('V', 38, 
struct v4l2_subdev_routing)
#define VIDIOC_SUBDEV_S_ROUTING                        _IOWR('V', 39, 
struct v4l2_subdev_routing)

#define V4L2_SUBDEV_ROUTE_FL_ACTIVE		_BITUL(0)
#define V4L2_SUBDEV_ROUTE_FL_IMMUTABLE		_BITUL(1)
#define V4L2_SUBDEV_ROUTE_FL_SOURCE		_BITUL(2)

struct v4l2_subdev_route {
	__u32 sink_pad;
	__u32 sink_stream;
	__u32 source_pad;
	__u32 source_stream;
	__u32 flags;
	__u32 reserved[5];
};

struct v4l2_subdev_routing {
	__u32 which;
	__u32 num_routes;
	__u64 routes;
	__u32 reserved[6];
};
```

- There's a maximum of 256 for the number of routes in the routing 
table, but there's nothing in the code that relies on this limit. It is 
there just to limit the memory allocations the kernel will do based on 
the routing table we get from the userspace.

- Using S_ROUTING will overwrite the old routing table. All the 
configurations (e.g. formats) for the streams on that subdevice are lost 
(reset to defaults), so the userspace must reconfigure the subdev after 
S_ROUTING.

- If V4L2_SUBDEV_ROUTE_FL_SOURCE flag is present, the sink_pad and 
sink_stream are ignored. This is used e.g. for sensors.

- I think V4L2_SUBDEV_ROUTE_FL_IMMUTABLE should be dropped. I don't 
really know what it means or how to use it. It was there in the original 
routing patches and so far I have kept it.

- Usually V4L2_SUBDEV_ROUTE_FL_ACTIVE is not strictly needed, as the 
existence of a route in the routing table implies that the route is 
active. However, it can be used for cases where the routing table is not 
freely modifiable. E.g. a sensor that supports both a pixel stream and a 
metadata stream could always have both in its routing table, metadta 
stream inactive by default, and the user could use 
V4L2_SUBDEV_ROUTE_FL_ACTIVE to enable/disable the metadata stream.

# Stream/routing discovery of a device

We currently don't have much for this.

For example:

- How many streams a device can support?
- What kind of routing can the device do?
- What are the streams? If a sensor supports a pixel stream and a 
metadata stream, how does the userspace know which stream ID represents 
which?

I believe this is a very complex issue, as it is perhaps impossible to 
somehow describe complex device's capabilities in a form that the 
userspace could actually use.

Options:
- Just document the device's & driver's behavior and let the userspace 
deal with it. I think this is acceptable, as when streams and routing 
are involved the userspace more or less has to have detailed 
understanding of the HW in question.
- In addition to the above, for source devices we can use the (absence 
of) V4L2_SUBDEV_ROUTE_FL_ACTIVE as described above to inform the 
userspace about the available streams.
- Try to add some kind of discovery mechanism that covers the HW we have 
now, or perhaps only for "simple" pipelines, understanding that it won't 
possibly work for future HWs.

# Selection

I admit I'm not very familiar with the cropping, scaling and composition 
in v4l2 subdevs. I believe the straightforward cases should work fine 
with streams, as there should be no practical difference between a 
legacy case of one sink pad + one source pad (and implicit routing 
between those two), and a stream coming to one pad and routed to a 
source pad.

Possibly problems could arise on cases where a stream is split into two 
streams, or two streams are merged into one stream.

I'd appreciate if someone familiar with the subdev selection could study 
this and if there are problems, explain the setup where it arises.

# Streams

`__u32 stream` field has been added to the following structs:
- v4l2_subdev_format
- v4l2_subdev_crop
- v4l2_subdev_mbus_code_enum
- v4l2_subdev_frame_size_enum
- v4l2_subdev_frame_interval
- v4l2_subdev_frame_interval_enum
- v4l2_subdev_selection

In other words, all the above operations support streams, and for the 
subdevs which do not support streams, they operate on the implicit 
stream ID 0.

  Tomi

