Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 14B835A6157
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 13:09:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiH3LJB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 07:09:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229570AbiH3LI7 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 07:08:59 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39EA2B56C9
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 04:08:59 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 55CB9481;
        Tue, 30 Aug 2022 13:08:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661857736;
        bh=2Tc8IZqIFMvCxvlUKx3CfeVWd2yHAIkRp7U9KREWzQI=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=f6LOmQnIXN7OVi3ZEhpE7MOK2Ss1PbGen9e8g9zXEHybxRFw06e41Eni0wfAybmKJ
         BARVzdGsyiFENhEt3+cfWJPwm5/5zfSjIDSxXQXxooMJ8huODCXjplWtNruDRxM3ke
         J8MZOjfmF8Tj/decKaL3Qn+KNmbMpzf7reonEZdw=
Message-ID: <e3576d29-a2fa-32e7-78d4-583b8abb414e@ideasonboard.com>
Date:   Tue, 30 Aug 2022 14:08:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v13 12/34] media: mc: entity: add alloc variant of
 pipeline_start
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220810121122.3149086-1-tomi.valkeinen@ideasonboard.com>
 <20220810121122.3149086-13-tomi.valkeinen@ideasonboard.com>
 <Ywzv7oCiubQwqSdK@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Ywzv7oCiubQwqSdK@pendragon.ideasonboard.com>
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

On 29/08/2022 19:57, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Aug 10, 2022 at 03:11:00PM +0300, Tomi Valkeinen wrote:
>> Add new variant of media_pipeline_start(), media_pipeline_alloc_start().
>>
>> media_pipeline_alloc_start() can be used by drivers that do not need to
>> extend the media_pipeline. The function will either use the pipeline
>> already associated with the entity, if such exists, or allocate a new
>> pipeline.
>>
>> When media_pipeline_stop() is called and the pipeline's use count drops
>> to zero, the pipeline is automatically freed.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/mc/mc-entity.c       | 41 ++++++++++++++++++++++++++++++
>>   drivers/media/v4l2-core/v4l2-dev.c | 11 ++++++++
>>   include/media/media-entity.h       | 14 ++++++++++
>>   include/media/v4l2-dev.h           | 14 ++++++++++
>>   4 files changed, 80 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index b1abaa333d13..d277eed11caf 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -529,6 +529,8 @@ void __media_pipeline_stop(struct media_entity *entity)
>>   
>>   	media_graph_walk_cleanup(graph);
>>   
>> +	if (pipe->allocated)
>> +		kfree(pipe);
>>   }
>>   EXPORT_SYMBOL_GPL(__media_pipeline_stop);
>>   
>> @@ -542,6 +544,45 @@ void media_pipeline_stop(struct media_entity *entity)
>>   }
>>   EXPORT_SYMBOL_GPL(media_pipeline_stop);
>>   
>> +__must_check int media_pipeline_alloc_start(struct media_entity *entity)
>> +{
>> +	struct media_device *mdev = entity->graph_obj.mdev;
>> +	struct media_pipeline *pipe;
>> +	int ret;
>> +	bool new_pipe = false;
>> +
>> +	mutex_lock(&mdev->graph_mutex);
>> +
>> +	/*
>> +	 * Is the entity already part of a pipeline? If not, we need to allocate
>> +	 * a pipe.
>> +	 */
>> +	pipe = media_entity_pipeline(entity);
>> +	if (!pipe) {
>> +		pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
>> +
> 
> You can drop the blank line.

Ok.

>> +		if (!pipe) {
>> +			ret = -ENOMEM;
>> +			goto out;
>> +		}
>> +
>> +		new_pipe = true;
>> +		pipe->allocated = true;
>> +	}
>> +
>> +	ret = __media_pipeline_start(entity, pipe);
>> +	if (ret) {
>> +		if (new_pipe)
>> +			kfree(pipe);
> 
> If new_pipe was a media_pipeline pointer, initialized to NULL and set to
> pipe when you allocate the pipe, you could write this
> 
> 	if (ret)
> 		kfree(new_pipe);

Yes, that's slightly neater.

> I don't mind much either way.
> 
> I have no objection against this patch, but I don't think it aligns well
> with what I was imagining as further evolutions of the API. I would like
> the pipe to be turned into an object similar to a DRM atomic commit.
> There will thus never be a need for drivers to allocate the pipeline, it
> will be done by the framework. We can rework (and likely drop) this
> function when that happens.

True, but isn't this a bit in the right direction? This goes a bit 
towards automating the pipeline management. Having the drivers use this 
instead of doing the management themselves should make it easier to 
eventually move to a framework managed model.

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks!

  Tomi
