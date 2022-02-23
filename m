Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5ADC94C1389
	for <lists+linux-media@lfdr.de>; Wed, 23 Feb 2022 14:04:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240660AbiBWNFW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Feb 2022 08:05:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236296AbiBWNFW (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Feb 2022 08:05:22 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2459793190;
        Wed, 23 Feb 2022 05:04:54 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9CCE6B81E80;
        Wed, 23 Feb 2022 13:04:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BE9AC340E7;
        Wed, 23 Feb 2022 13:04:49 +0000 (UTC)
Message-ID: <2c0b387c-d636-bc0c-74b1-f1eba3d89254@xs4all.nl>
Date:   Wed, 23 Feb 2022 14:04:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH v10 2/2] media: i2c: isl7998x: Add driver for Intersil
 ISL7998x
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        p.zabel@pengutronix.de, Ian Arkver <ian.arkver.dev@gmail.com>,
        kernel@pengutronix.de, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, Marek Vasut <marex@denx.de>
References: <20220217154407.2892822-1-m.tretter@pengutronix.de>
 <20220217154407.2892822-3-m.tretter@pengutronix.de>
 <2a2038bc-9f84-c451-deb3-1e807ac2f0d3@xs4all.nl>
 <YhYlnEBAh0QtRXZ0@paasikivi.fi.intel.com>
 <YhYuogHaHuyVPd2C@paasikivi.fi.intel.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <YhYuogHaHuyVPd2C@paasikivi.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,NICE_REPLY_A,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2/23/22 13:54, Sakari Ailus wrote:
> Hi Hans, Michael,
> 
> On Wed, Feb 23, 2022 at 02:16:28PM +0200, Sakari Ailus wrote:
>>>> +static int isl7998x_pre_streamon(struct v4l2_subdev *sd, u32 flags)
>>>> +{
>>>> +	struct i2c_client *client = v4l2_get_subdevdata(sd);
>>>> +	struct device *dev = &client->dev;
>>>> +
>>>> +	if (flags & V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP)
>>>> +		return pm_runtime_resume_and_get(dev);
>>>> +
>>>> +	return 0;
>>>
>>> This feels a bit scary: if V4L2_SUBDEV_PRE_STREAMON_FL_MANUAL_LP is NOT
>>> set, then pm_runtime_resume_and_get() isn't called, but this function
>>> still returns success...
>>
>> Good find.
>>
>> pm_runtime_resume_and_get() need to be called unconditionally.
>>
>> Alternatively, store what was done here, and put the PM use count
>> accordingly below. But I see no reason to do that.
> 
> But I think the driver is otherwise good to go.
> 
> Unless there are objections, I'll drop the check in the pre_streamon()
> callback and apply it into my tree.
> 

OK, with that change you can add my:

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

to this patch. I'll delegate the series to you in patchwork.

Regards,

	Hans
