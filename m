Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8509B4DC27C
	for <lists+linux-media@lfdr.de>; Thu, 17 Mar 2022 10:18:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbiCQJTd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Mar 2022 05:19:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbiCQJTc (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Mar 2022 05:19:32 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A4911C2A
        for <linux-media@vger.kernel.org>; Thu, 17 Mar 2022 02:18:16 -0700 (PDT)
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 97A97493;
        Thu, 17 Mar 2022 10:18:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1647508695;
        bh=Jhi9pJNAcDpTYI/TJDESiVqvL41AprJdea9jOoVxD9w=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=X7k/4I9uJn+I74imQt4e9FsokGbCqNj0CbjDqPTwhNy6oDi5wl/Y1N9WUxG0fZ9yN
         DT4c+HqDyTiGXeOY/8sDPyJxKz+VfHL6PmGyEWFwloatj+2Duqp7rQPx2qzgQg8Qko
         5eZ+nbCGBjOLPMoIVoadK8oq/G5HPbW421MvJYSE=
Message-ID: <6e162278-9b85-4445-7c32-e46607bbcedf@ideasonboard.com>
Date:   Thu, 17 Mar 2022 11:18:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v11 30/36] media: subdev: Fallback to pad config in
 v4l2_subdev_get_fmt()
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
 <20220301161156.1119557-31-tomi.valkeinen@ideasonboard.com>
 <20220316110329.mhuarq2vk4w7gcqv@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <20220316110329.mhuarq2vk4w7gcqv@uno.localdomain>
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

On 16/03/2022 13:03, Jacopo Mondi wrote:
> On Tue, Mar 01, 2022 at 06:11:50PM +0200, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> If the subdev doesn't implement routing support, fallback to pad config
>> as the storage for pad formats. This allows using the V4L2 subdev active
>> state API and the v4l2_subdev_get_fmt() helper in subdev drivers that
>> don't implement routing support.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/media/v4l2-core/v4l2-subdev.c | 10 ++++++++--
>>   1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
>> index c1cc9b91dba7..7f50871054cd 100644
>> --- a/drivers/media/v4l2-core/v4l2-subdev.c
>> +++ b/drivers/media/v4l2-core/v4l2-subdev.c
>> @@ -1512,8 +1512,14 @@ int v4l2_subdev_get_fmt(struct v4l2_subdev *sd, struct v4l2_subdev_state *state,
>>   {
>>   	struct v4l2_mbus_framefmt *fmt;
>>
>> -	fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
>> -						  format->stream);
>> +	if (sd->flags & V4L2_SUBDEV_FL_MULTIPLEXED)
>> +		fmt = v4l2_subdev_state_get_stream_format(state, format->pad,
>> +							  format->stream);
>> +	else if (format->pad < sd->entity.num_pads && format->stream == 0)
>> +		fmt = v4l2_subdev_get_try_format(sd, state, format->pad);
>> +	else
>> +		fmt = NULL;
> 
> You could initialize fmt = NULL and skip the else

I do like it better this way, I think it's more understandable to have 
all the three cases listed there.

  Tomi
