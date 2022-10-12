Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2F4285FC0FC
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 08:58:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJLG6l (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 02:58:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229563AbiJLG6g (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 02:58:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C73380F6B
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 23:58:35 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id CC7704DB;
        Wed, 12 Oct 2022 08:58:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665557913;
        bh=8hpf6+tVLIYURAQ7ar755YT3AIL7GD8obcRAVtJDFuY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=TBwccPGGEgSx9iXVIpJURbsLOKJ01GQuz0k9AkmVyCGfPqpDY4NtThq6sTx+9iRxm
         amZCsuFx6gIiJ+UCKb5IFx5IdxgATLZhT/KwQx0gX4/vnpBhGGM7QCK4R9bOdulA6a
         Rdo4g0Ozis5JQ3zpiYRZMlqH60KdlYH5/5ua7iyg=
Message-ID: <9cdae272-e73b-9acb-2011-dfb6884a033a@ideasonboard.com>
Date:   Wed, 12 Oct 2022 09:58:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 07/19] media: subdev: add v4l2_subdev_set_routing
 helper()
Content-Language: en-US
To:     Yunke Cao <yunkec@chromium.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-8-tomi.valkeinen@ideasonboard.com>
 <CAEDqmY4=yVOWA4-V-dc_5BQRA_TnGPmxBERrTj3hKBs8EXkjGg@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAEDqmY4=yVOWA4-V-dc_5BQRA_TnGPmxBERrTj3hKBs8EXkjGg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 12/10/2022 09:22, Yunke Cao wrote:
> Hi Tomi,
> 
> On Wed, Oct 12, 2022 at 2:03 PM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Add a helper function to set the subdev routing. The helper can be used
>> from subdev driver's set_routing op to store the routing table.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 31 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 16 ++++++++++++++
>>   2 files changed, 47 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index fff17b8536fc..3ae4f39a50e4 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/ioctl.h>
>>   #include <linux/mm.h>
>>   #include <linux/module.h>
>> +#include <linux/overflow.h>
>>   #include <linux/slab.h>
>>   #include <linux/types.h>
>>   #include <linux/version.h>
>> @@ -1181,6 +1182,36 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>>
>> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>> +                           struct v4l2_subdev_state *state,
>> +                           const struct v4l2_subdev_krouting *routing)
>> +{
>> +       struct v4l2_subdev_krouting *dst = &state->routing;
>> +       const struct v4l2_subdev_krouting *src = routing;
>> +       struct v4l2_subdev_krouting new_routing = { 0 };
>> +       size_t bytes;
>> +
>> +       if (unlikely(check_mul_overflow(src->num_routes, sizeof(*src->routes),
> 
> Do we need to cast (size_t)src->num_routes here?
> My compiler is complaining:
> ./include/linux/overflow.h:85:22: error: comparison of distinct
> pointer types lacks a cast [-Werror]
>     85 |         (void) (&__a == &__b);                  \
> 

Yes, I think we should do that. Thanks! I need to remember to compile 
with other compilers than arm32 too =).

  Tomi

