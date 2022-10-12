Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 52B965FC0E6
	for <lists+linux-media@lfdr.de>; Wed, 12 Oct 2022 08:46:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229635AbiJLGqo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Oct 2022 02:46:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbiJLGqn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Oct 2022 02:46:43 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 942F811452
        for <linux-media@vger.kernel.org>; Tue, 11 Oct 2022 23:46:42 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9432B4DB;
        Wed, 12 Oct 2022 08:46:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1665557200;
        bh=70zL/7JQ7f0Zqpczjaowp+OHWpSX4O7/pOq8zR7na/k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=aSAeLLq9oCAw2BT1g33ju2dHWRIE2X/vMOPh52zroiX6byEwuAKQC2Ntl/Pwqd20L
         7aMcIS9Q0yzAMAhfGdV08im5n5GysResDc5wfIsSar36KRbkhu5QzxGYI5twN5lTE5
         iusjzQNe8iOQO834UAjam+wOcdAG8rj7ixeL9ZJc=
Message-ID: <f42c01da-e0b6-480e-70c8-6f37c88ea3e1@ideasonboard.com>
Date:   Wed, 12 Oct 2022 09:46:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v15 12/19] media: subdev: add "opposite" stream helper
 funcs
Content-Language: en-US
To:     Dafna Hirschfeld <dafna@fastmail.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Jacopo Mondi <jacopo@jmondi.org>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-13-tomi.valkeinen@ideasonboard.com>
 <20221009070614.rud3yx6acsxwt6kl@guri>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20221009070614.rud3yx6acsxwt6kl@guri>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/10/2022 10:06, Dafna Hirschfeld wrote:
> On 03.10.2022 15:18, Tomi Valkeinen wrote:
>> Add two helper functions to make dealing with streams easier:
>>
>> v4l2_subdev_routing_find_opposite_end - given a routing table and a pad
>> + stream, return the pad + stream on the opposite side of the subdev.
>>
>> v4l2_subdev_state_get_opposite_stream_format - return a pointer to the
>> format on the pad + stream on the opposite side from the given pad +
>> stream.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> Reviewed-by: Jacopo Mondi <jacopo@jmondi.org>
>> ---
>> drivers/media/v4l2-core/v4l2-subdev.c | 49 +++++++++++++++++++++++++++
>> include/media/v4l2-subdev.h           | 36 ++++++++++++++++++++
>> 2 files changed, 85 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c 
>> b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 1cea6ec750c0..7d2d8e8d3aea 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1514,6 +1514,55 @@ v4l2_subdev_state_get_stream_compose(struct 
>> v4l2_subdev_state *state,
>> }
>> EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_compose);
>>
>> +int v4l2_subdev_routing_find_opposite_end(const struct 
>> v4l2_subdev_krouting *routing,
>> +                      u32 pad, u32 stream, u32 *other_pad,
>> +                      u32 *other_stream)
>> +{
>> +    unsigned int i;
>> +
>> +    for (i = 0; i < routing->num_routes; ++i) {
>> +        struct v4l2_subdev_route *route = &routing->routes[i];
>> +
>> +        if (route->source_pad == pad &&
>> +            route->source_stream == stream) {
>> +            if (other_pad)
>> +                *other_pad = route->sink_pad;
>> +            if (other_stream)
>> +                *other_stream = route->sink_stream;
>> +            return 0;
>> +        }
>> +
>> +        if (route->sink_pad == pad && route->sink_stream == stream) {
> 
> Hi, I think here you should also check that the FL_SOURCE flag is not 
> set to make sure
> that sink_pad/stream are used

Yes, you are correct. I'll add the check.

  Tomi

