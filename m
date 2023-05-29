Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B00A714590
	for <lists+linux-media@lfdr.de>; Mon, 29 May 2023 09:34:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229604AbjE2Hek (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 29 May 2023 03:34:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229592AbjE2Hej (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 29 May 2023 03:34:39 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D828C2
        for <linux-media@vger.kernel.org>; Mon, 29 May 2023 00:34:23 -0700 (PDT)
Received: from [192.168.88.20] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A46B5836;
        Mon, 29 May 2023 09:34:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1685345641;
        bh=wz8mC6Wtb10da4oXsv5JWYudtHQRf8CapMumE2cOq/w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=idFQ3apgZIzyxvjYVStgfwTHozKtM4kAMqbvHSLHhWdzjVdKBFjgZoCSQe2yVUHG5
         YU0iB8WVgjGe0caNgJ1K5h8XwMGftErLYDxJz/otFxvpLMJ1Qj45erA3d+kS6hGhfR
         ewgIOXpJIgHuq6lDogaxYOAf63vdyddH9AaUM9L0=
Message-ID: <3de25532-983d-0d13-1a3e-d818e34c01c0@ideasonboard.com>
Date:   Mon, 29 May 2023 10:34:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 2/8] media-ctl: Add support for routes and streams
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        satish.nagireddy@getcruise.com
References: <20230421124428.393261-1-tomi.valkeinen@ideasonboard.com>
 <20230421124428.393261-3-tomi.valkeinen@ideasonboard.com>
 <20230424072932.GD4926@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20230424072932.GD4926@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 24/04/2023 10:29, Laurent Pinchart wrote:

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
> 
> Naming the variable 'route' would be more explicit.
> 
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
> 
> v4l2_subdev_print_pad_dv() and v4l2_subdev_print_subdev_dv() don't
> depend on routes or streams, should they be printed outside of the loop
> ?

There's an if-block above the for loop which handles the no-routes case.

  Tomi

