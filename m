Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 578E2420588
	for <lists+linux-media@lfdr.de>; Mon,  4 Oct 2021 07:15:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232476AbhJDFRd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 Oct 2021 01:17:33 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:56750 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbhJDFRc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 4 Oct 2021 01:17:32 -0400
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BEC5F71;
        Mon,  4 Oct 2021 07:15:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1633324542;
        bh=BK5rBDH3E2Yd5Lbph77TErxo1oe5VyF/tKEoB+WnIwc=;
        h=To:Cc:References:From:Subject:Date:In-Reply-To:From;
        b=uQZcxuvePQZRi4UkBI1lGODXSdA0AKfzWZu4/jKFIUXok3rZ3PGX2mmuOvB+EEWbA
         W02z9+DjQTQOEU2pFOUBbaq+e74KxXNDLW4jllD2Hl4kcegTe+BLtDZGVOCVq3Gfw0
         6GuVh1mGVToh8V+pi4GnbHQJfuXI0n0EoESvRkd0=
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20210830110116.488338-1-tomi.valkeinen@ideasonboard.com>
 <20210830110116.488338-29-tomi.valkeinen@ideasonboard.com>
 <c79b503e-cb83-61cb-f1d0-982e49a6f0cc@collabora.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH v8 28/36] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Message-ID: <30a468fe-e813-2b30-49e8-86192379c238@ideasonboard.com>
Date:   Mon, 4 Oct 2021 08:15:37 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <c79b503e-cb83-61cb-f1d0-982e49a6f0cc@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

On 03/10/2021 22:52, Dafna Hirschfeld wrote:

>> +/**
>> + * struct v4l2_subdev_route - A route inside a subdev
>> + *
>> + * @sink_pad: the sink pad index
>> + * @sink_stream: the sink stream identifier
>> + * @source_pad: the source pad index
>> + * @source_stream: the source stream identifier
>> + * @flags: route flags V4L2_SUBDEV_ROUTE_FL_*
>> + * @reserved: drivers and applications must zero this array
>> + */
>> +struct v4l2_subdev_route {
>> +    __u32 sink_pad;
>> +    __u32 sink_stream;
>> +    __u32 source_pad;
>> +    __u32 source_stream;
>> +    __u32 flags;
>> +    __u32 reserved[5];
>> +};
>> +
> 
> I don't understand that struct, what is the meaning of the two 
> sink_stream, source_stream fields?
> What is the relation between sink_pad and source_pad? A 'route' between 
> two pads means that 'streams' can flow through them?
> 
> If I have for example:
> 
> sink_pad = sink_stream = 0
> source_pad = source_stream = 1
> 
> what does that mean?

It means that a stream with stream ID 0 that comes to the subdev's sink 
pad 0 will be routed to the subdev's source pad 1 with stream ID 1.

So the sink_pad and source_pad tell via which pads the streams flows.

Stream IDs are numbers used to uniquely identify the stream for the 
specific pad. In other words, for the subdev's pad 0, each stream ID 
must be unique. That pad 0 is linked (media link) to another subdev's 
pad, and on that pad there must be streams with the matching IDs.

  Tomi
