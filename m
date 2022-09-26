Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC015E9906
	for <lists+linux-media@lfdr.de>; Mon, 26 Sep 2022 07:56:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233451AbiIZF4g (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Sep 2022 01:56:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231396AbiIZF4e (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Sep 2022 01:56:34 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCAC24BD6
        for <linux-media@vger.kernel.org>; Sun, 25 Sep 2022 22:56:34 -0700 (PDT)
Received: from [192.168.1.15] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2242E2B3;
        Mon, 26 Sep 2022 07:56:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1664171791;
        bh=aJwZBmIGSSoXZjj42X9UVlvc8K2hagK/NdaCSWX/aVk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=O7RBtesEmMCmJtMoPx8CQb3oeZTf7/sp9ZTTjD87SfAkHuKNCQ4rQ/maiUn7mxwjE
         8TVeSVnulXMUurAKANm6rcbqY7hv1q3ek04rvCyVFIldQR2vtqqJPpaEWaWXfALCf6
         QYJKkLcPpBmUZ/+sQp/rUYwqEWgJbnRLvh8H9QWc=
Message-ID: <2188d722-e241-f913-7dc0-0b8eee0ae86c@ideasonboard.com>
Date:   Mon, 26 Sep 2022 08:56:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v14 22/34] media: subdev: add v4l2_subdev_set_routing
 helper()
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220831141357.1396081-1-tomi.valkeinen@ideasonboard.com>
 <20220831141357.1396081-23-tomi.valkeinen@ideasonboard.com>
 <YzA66QYWk6AX8KoJ@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YzA66QYWk6AX8KoJ@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 25/09/2022 14:26, Sakari Ailus wrote:
> Moi,
> 
> On Wed, Aug 31, 2022 at 05:13:45PM +0300, Tomi Valkeinen wrote:
>> Add a helper function to set the subdev routing. The helper can be used
>> from subdev driver's set_routing op to store the routing table.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 28 +++++++++++++++++++++++++++
>>   include/media/v4l2-subdev.h           | 16 +++++++++++++++
>>   2 files changed, 44 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index 1ce9a7dc0c6e..f3f872c72180 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1180,6 +1180,34 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   }
>>   EXPORT_SYMBOL_GPL(v4l2_subdev_get_fmt);
>>   
>> +int v4l2_subdev_set_routing(struct v4l2_subdev *sd,
>> +			    struct v4l2_subdev_state *state,
>> +			    const struct v4l2_subdev_krouting *routing)
>> +{
>> +	struct v4l2_subdev_krouting *dst = &state->routing;
>> +	const struct v4l2_subdev_krouting *src = routing;
>> +	struct v4l2_subdev_krouting new_routing = { 0 };
>> +
>> +	lockdep_assert_held(state->lock);
>> +
>> +	if (src->num_routes > 0) {
>> +		new_routing.routes = kmemdup(src->routes,
>> +			src->num_routes * sizeof(*src->routes),
> 
> This can overflow.

Right. In practice it won't happen as the num_routes has been limited to 
256, but no harm to check for overflow here.

  Tomi
