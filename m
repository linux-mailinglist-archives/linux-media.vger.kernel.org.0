Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A75505A6253
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 13:45:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiH3LpS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 07:45:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbiH3Lox (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 07:44:53 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85D34BCBB
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 04:44:43 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 44D79481;
        Tue, 30 Aug 2022 13:44:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661859881;
        bh=l1JVD1zyiP+3YwLAroL/2nPbJm+loMYvIMBT4wLPcIQ=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=uLu9mUj3AQqCE5M6c0YDcMCejZPOgNt++HBX+prjoCyG6JShcP4wBkn4MKmPWCsst
         Qv+CZW35sHKSQbRSSXOGjMEZLDkUQp1nOmAUqBHXA7BUoGUMcGD4pUB9a6KRpzky7k
         OAgfUV4wJqFiu4we/wPSgB/iV9knB6qRDvur5tgs=
Message-ID: <51d2f837-6234-eb66-c1cc-a12a9e51c136@ideasonboard.com>
Date:   Tue, 30 Aug 2022 14:44:39 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v13 14/34] media: mc: entity: Rewrite
 media_pipeline_start()
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
 <20220810121122.3149086-15-tomi.valkeinen@ideasonboard.com>
 <Ywz06tZvurFVosly@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Ywz06tZvurFVosly@pendragon.ideasonboard.com>
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

On 29/08/2022 20:18, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Wed, Aug 10, 2022 at 03:11:02PM +0300, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> [Note: the code is mostly from Laurent but the patch description is from Tomi]
> 
> I'll review the description then :-)
> 
>> The media_pipeline_start() and media_pipeline_stop() functions use the
>> media graph walk API to traverse the graph and validate the pipeline.
>> The graph walk traverses the media graph following links between the
>> entities.
>>
>> Also, while the pipeline can't change between the start and stop calls,
>> the graph is walked again from scratch at stop time, or any time a
>> driver needs to inspect the pipeline.
>>
>> With the upcoming multiplexed streams support we will need a bit more
>> intelligent pipeline construction, as e.g. an entity may be passing
>> through two independent streams via separate pads, in which case those
> 
> Did you mean "as e.g. two independent streams may be passing through a
> single entity via separate pads" ?

Yes. That's a bit more understandable.

>> pads should not be part of the same pipeline.
>>
>> This patch essentially rewrites the media_pipeline_start/stop so that
>> a pipeline is defined as a set of pads instead of entities and the media
>> graph traversal considers the pad interdependencies when choosing which
>> links to follow.
>>
>> Currently all the entity's pads are considered as interdependent. This
>> means that the behavior with all the current drivers stays the same, but
>> in the future we can define a more fine-grained pipeline construction.
>>
>> Additionally the media pipeline's pads are cached at
>> media_pipeline_start() time, and re-used at media_pipeline_stop() which
>> avoid the need to re-walk the whole graph as the previous implementation
>> did.
>>
>> Also, caching pads in the pipeline can serve in the future as the
>> foundation to provide a better API than the media graph walk to drivers
>> to iterate over pads and entities in the pipeline.
>>
>> Note that the old media_pipeline_start/stop used the media graph walk
>> API. The new version does not use the media graph walk API, but instead
>> a new implementation.
>>
>> There are two reason for not changing the graph walk: it proved to be
>> rather difficult to change the graph walk to have the features
>> implemented in this patch, and second, this keeps the backward
>> compatibility of the graph walk as there are users of the graph walk API
>>
>> The long term plan is that all the existing code would be converted to
>> use the new cached pipeline, thus allowing us to remove the graph walk.
> 
> Could you mark the graph walk API as deprecated in this patch, or in a
> subsequent patch in the series ? I think I did in a previous version,
> but I may recall incorrectly.

I don't remember removing deprecation comments, but who knows...

>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index d277eed11caf..df8e82be2bcc 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -225,6 +225,27 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
>>    * Graph traversal
>>    */
>>   
>> +/*
>> + * This function checks the interdependency inside the entity between @pad0
>> + * and @pad1. If two pads are interdependent they are part of the same pipeline
>> + * and enabling one of the pads means that the other pad will become "locked"
>> + * and doesn't allow configuration changes.
>> + *
>> + * For the time being all pads are considered interdependent.
>> + */
>> +static bool media_entity_has_pad_interdep(struct media_entity *entity,
> 
> I won't bikeshed this name as it can easily be changed later if needed.

Thank you ;).

>> @@ -966,10 +1318,29 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>>   
>>   struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
>>   {
>> -	return entity->pipe;
>> +	struct media_pipeline *pipe;
>> +	struct media_pad *pad;
>> +
>> +	if (entity->num_pads == 0)
>> +		return NULL;
>> +
>> +	pipe = entity->pads->pipe;
>> +
>> +	media_entity_for_each_pad(entity, pad) {
>> +		if (WARN_ON(pad->pipe != pipe))
>> +			return NULL;
>> +	}
> 
> This wasn't done in v12, could you explain the rationale ? The
> documentation of media_entity_pipeline() should probably be updated too.

This is just a sanity check.

The doc says "This function is to be used only for entities that do not 
support multiple pipelines". So the pipeline must be the same for all 
pads, and if that's not the case, something is horribly wrong.

However, now that I think about it, can we have NULL pipes in some pads, 
if those pads are e.g. not linked... Then I think the check should be 
(pipe && pad->pipe && pipe != pad->pipe).

But if that's the case, does this even work... The code expects the 
first pad to contain the pipeline for the entity. If the first pad's 
pipe can be NULL, but, say, second and fourth pads contain the pipeline 
(as those pads are actually used), then this is quite broken.

  Tomi
