Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB364DC25C
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 10:10:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231765AbiCQJL6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 05:11:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231425AbiCQJL5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 05:11:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 365741D12F6
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 02:10:42 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id B45F6EE;
        Thu, 17 Mar 2022 10:10:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647508240;
        bh=cCCVeDHKnjj55s/alLb81YhOc4sLex10zr1RKrRZzOE=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pZ7c55WDJeaUX4V30thPBg3Kje6BjLJOJEmBNzHOTqF118ico9Pq4pw0KUbtf708J
         FXzolIjbyyjnIx9DVHE8Qy2+lUZiCkH3KIfcWC1d2e8PGmpK/GbkjrlRvHJ7rzUcpL
         Fvzq9OMXe6tn2o1KFw52pFL2NgaC81uXRbM4JJKg=
Message-ID: <b8912e83-2d8b-77b4-0d34-c5c4dc0dc409@ideasonboard.com>
Date:   Thu, 17 Mar 2022 11:10:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 28/36] media: subdev: add "opposite" stream helper
 funcs
Content-Language: en-US
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20220301161156.1119557-1-tomi.valkeinen@ideasonboard.com>
 <20220301161156.1119557-29-tomi.valkeinen@ideasonboard.com>
 <20220316105008.i4hz2bflnqrjdalb@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316105008.i4hz2bflnqrjdalb@uno.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 16/03/2022 12:50, Jacopo Mondi wrote:
> Hi Tomi,
> 
> On Tue, Mar 01, 2022 at 06:11:48PM +0200, Tomi Valkeinen wrote:
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
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 48 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 36 ++++++++++++++++++++
>>   2 files changed, 84 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 091b854e00d0..e65f802fe2aa 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1459,6 +1459,54 @@ v4l2_subdev_state_get_stream_format(struct v4l2_subdev_state *state,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_state_get_stream_format);
>>
>> +int v4l2_subdev_routing_find_opposite_end(const struct v4l2_subdev_krouting *routing,
>> +					  u32 pad, u32 stream, u32 *other_pad,
>> +					  u32 *other_stream)
>> +{
>> +	unsigned int i;
>> +
>> +	for (i = 0; i < routing->num_routes; ++i) {
>> +		struct v4l2_subdev_route *route = &routing->routes[i];
>> +
> 
> Is it intentional to include routes that might be active ?

You mean not active? I don't see why this function should only consider 
active routes. So yes, I guess you could call it intentional.


  Tomi
