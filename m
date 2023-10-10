Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587647BFA5E
	for <lists+linux-media@lfdr.de>; Tue, 10 Oct 2023 13:52:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231384AbjJJLw3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 10 Oct 2023 07:52:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59136 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231421AbjJJLw2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 10 Oct 2023 07:52:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53D38B4
        for <linux-media@vger.kernel.org>; Tue, 10 Oct 2023 04:52:26 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64A17C433C7;
        Tue, 10 Oct 2023 11:52:24 +0000 (UTC)
Message-ID: <c9157c41-a890-4542-bdad-9e193dcbb833@xs4all.nl>
Date:   Tue, 10 Oct 2023 13:52:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: subdev: Don't report V4L2_SUBDEV_CAP_STREAMS when
 the streams API is disabled
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, Dennis Bonke <admin@dennisbonke.com>,
        tomi.valkeinen@ideasonboard.com
References: <20231010102458.111227-1-hdegoede@redhat.com>
 <ZSU6ZFKS5QkFJgZw@kekkonen.localdomain>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <ZSU6ZFKS5QkFJgZw@kekkonen.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.6 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/10/23 13:49, Sakari Ailus wrote:
> Hi Hans,
> 
> On Tue, Oct 10, 2023 at 12:24:58PM +0200, Hans de Goede wrote:
>> Since the stream API is still experimental it is currently locked away
>> behind the internal, default disabled, v4l2_subdev_enable_streams_api flag.
>>
>> Advertising V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
>> confuses userspace. E.g. it causes the following libcamera error:
>>
>> ERROR SimplePipeline simple.cpp:1497 Failed to reset routes for
>>   /dev/v4l-subdev1: Inappropriate ioctl for device
>>
>> Don't report V4L2_SUBDEV_CAP_STREAMS when the streams API is disabled
>> to avoid problems like this.
>>
>> Reported-by: Dennis Bonke <admin@dennisbonke.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> -Clearing the V4L2_SUBDEV_FL_STREAMS flag from sd.flags might seem
>>  appealing as an alternative fix. But this causes various v4l2-core bits
>>  to enter different code paths which confuses drivers which set
>>  V4L2_SUBDEV_FL_STREAMS, so this is a bad idea.
> 
> Thanks, this apparently had been missed while disabling the API.
> 
> Probably also should be added:
> 
> Fixes: 9a6b5bf4c1bb ("media: add V4L2_SUBDEV_CAP_STREAMS")
> Cc: stable@vger.kernel.org # for >= 6.3
> 
> Also cc'd Tomi.

Should this be queued up as a 6.6 fix?

Regards,

	Hans V.

> 
>> -No Closes: for the Reported-by since this was reported by private email
>> ---
>>  drivers/media/v4l2-core/v4l2-subdev.c | 7 +++++++
>>  1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index b92348ad61f6..31752c06d1f0 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -502,6 +502,13 @@ static long subdev_do_ioctl(struct file *file, unsigned int cmd, void *arg,
>>  				       V4L2_SUBDEV_CLIENT_CAP_STREAMS;
>>  	int rval;
>>  
>> +	/*
>> +	 * If the streams API is not enabled, remove V4L2_SUBDEV_CAP_STREAMS.
>> +	 * Remove this when the API is no longer experimental.
>> +	 */
>> +	if (!v4l2_subdev_enable_streams_api)
>> +		streams_subdev = false;
>> +
>>  	switch (cmd) {
>>  	case VIDIOC_SUBDEV_QUERYCAP: {
>>  		struct v4l2_subdev_capability *cap = arg;
> 

