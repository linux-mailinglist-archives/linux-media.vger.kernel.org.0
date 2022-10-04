Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D45AD5F3EA4
	for <lists+linux-media@lfdr.de>; Tue,  4 Oct 2022 10:44:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230134AbiJDIoE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 4 Oct 2022 04:44:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229788AbiJDIoD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 4 Oct 2022 04:44:03 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A118222285
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 01:44:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51A3EB8190F
        for <linux-media@vger.kernel.org>; Tue,  4 Oct 2022 08:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08443C433C1;
        Tue,  4 Oct 2022 08:43:56 +0000 (UTC)
Message-ID: <eea402df-7468-f9fc-ed05-8581ea67f5d3@xs4all.nl>
Date:   Tue, 4 Oct 2022 10:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v15 05/19] media: subdev: Add [GS]_ROUTING subdev ioctls
 and operations
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>,
        Michal Simek <michal.simek@xilinx.com>
References: <20221003121852.616745-1-tomi.valkeinen@ideasonboard.com>
 <20221003121852.616745-6-tomi.valkeinen@ideasonboard.com>
 <7b56d565-5358-67be-84b8-101a97f97f2b@xs4all.nl>
 <Yztb06LVmPBKf8J2@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <Yztb06LVmPBKf8J2@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-9.1 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

On 10/4/22 00:01, Sakari Ailus wrote:
> Hi Hans,
> 
> On Mon, Oct 03, 2022 at 04:26:32PM +0200, Hans Verkuil wrote:
>>> +#define V4L2_SUBDEV_ROUTE_FL_SOURCE		(1U << 1)
>>
>> Can we rename this to _FL_INTERNAL_SOURCE? Just 'SOURCE' is very confusing
>> IMHO. The name 'INTERNAL_SOURCE' makes it clear that it is generated internally,
>> and so does not come from an external sink-side endpoint.
>>
>> I also think that the documentation for this flag in patch 04/19 is very vague,
>> I'll comment on that patch as well.
> 
> Having descriptive names is important but I think "SOURCE" as such is fine
> for the purpose. Adding "INTERNAL_" adds 9 characters to what is already a
> very long name, making the flag very clumsy to use in code. That's why I
> would prefer to keep it as-is.
> 

_FL_SOURCE is meaningless (at least to me): there are so many 'source' and 'sink'
references, that just plain 'SOURCE' doesn't help me understand what the flag
means. I did consider INT_SOURCE, but I thought 'INT' is too close to 'interrupt'.
I'm OK with that, though.

Another alternative would be _FL_NO_SINK: that clearly conveys that 1) there is
no sink, and implies that 2) the source is internally generated.

Or perhaps: _FL_SOURCE_ONLY?

But let's avoid V4L2_SUBDEV_ROUTE_FL_SOURCE: to me that just says that the route
has a source, but that's true for all routes. There is nothing in the flag name
to indicate that the route has *only* a source and no sink.

Regards,

	Hans
