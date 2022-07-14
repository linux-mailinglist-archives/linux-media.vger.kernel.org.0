Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C8760574CBD
	for <lists+linux-media@lfdr.de>; Thu, 14 Jul 2022 14:04:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236997AbiGNMEz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jul 2022 08:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231788AbiGNMEy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jul 2022 08:04:54 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B9E5C379
        for <linux-media@vger.kernel.org>; Thu, 14 Jul 2022 05:04:53 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 22CA2383;
        Thu, 14 Jul 2022 14:04:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1657800291;
        bh=RLCJUV8udXSay0jFV/96zf7AK8++W8rQb8vJV3IR5tw=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=e1ockQbq+kCI9Th8e1EOMAZ+6thSssOTnS897nxISqtHdzPr6Ps4KjJv2r/haobTd
         oCs42G93fX230Zmetwb4dkHSg6uzeTSHIePL/uR/Lt76sdi0Fidqb88wCWbhpr0Xra
         tEJbbHVLmiDm94O2R4U6ulbAnB/ej/J47b4aHyRQ=
Message-ID: <cb4af9ef-8c48-30ab-f286-8aac370f7e6e@ideasonboard.com>
Date:   Thu, 14 Jul 2022 15:04:38 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 3/4] media-ctl: add support for routes and streams
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>
References: <20211130141815.892354-1-tomi.valkeinen@ideasonboard.com>
 <20211130141815.892354-4-tomi.valkeinen@ideasonboard.com>
 <YjhXTuUF+sZUKgNb@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YjhXTuUF+sZUKgNb@pendragon.ideasonboard.com>
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

On 21/03/2022 12:45, Laurent Pinchart wrote:

>> @@ -455,16 +477,51 @@ static void media_print_topology_dot(struct media_device *media)
>>   }
>>   
>>   static void media_print_pad_text(struct media_entity *entity,
>> -				 const struct media_pad *pad)
>> +				 const struct media_pad *pad,
>> +				 struct v4l2_subdev_route *routes,
>> +				 unsigned int num_routes)
>>   {
>> +	unsigned int i;
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
>> +	for (i = 0; i < num_routes; ++i) {
>> +		const struct v4l2_subdev_route *r = &routes[i];
>> +		unsigned int stream;
>> +
>> +		if (!(r->flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
>> +			continue;
>>   
>> -	if (pad->flags & MEDIA_PAD_FL_SOURCE)
>> -		v4l2_subdev_print_subdev_dv(entity);
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
>> +		v4l2_subdev_print_format(entity, pad->index, stream, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +		v4l2_subdev_print_pad_dv(entity, pad->index, V4L2_SUBDEV_FORMAT_ACTIVE);
>> +
>> +		if (pad->flags & MEDIA_PAD_FL_SOURCE)
>> +			v4l2_subdev_print_subdev_dv(entity);
> 
> If a subdev has multiple routes coming from the same pad/stream
> (corresponding to the 1-N stream duplication use case), you will print
> the same format for the sink pad/stream multiple times.

Right. I'll change it to print only streams that haven't been printed 
before.

  Tomi
