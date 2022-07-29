Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB8C584EC9
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 12:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231706AbiG2K1z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 06:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230272AbiG2K1w (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 06:27:52 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82125B6C
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 03:27:51 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id C859152F;
        Fri, 29 Jul 2022 12:27:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659090469;
        bh=rGpkARVpULsGcTXBRtSzvVNCQfblpngkoYVq9uo25mA=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=urBOWjffjMcwYdbVUDN7DLyYTo0h17cYMEV4H/HJnqq8ummWW1hCere55EU9epbWK
         YjahtWTXrzitENqx7ERrYPpFHkjmBiGlA0YRRoVFt17HoD06mfK19nzFkTFUFte6V7
         9PwpYRxvpRwuXNq0kWb6bKTG9oPULeNOc2TWrsd0=
Message-ID: <ce6f1e9a-21d2-cb89-87fd-1ec09ee95c4f@ideasonboard.com>
Date:   Fri, 29 Jul 2022 13:27:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [EXT] Re: [EXT] [PATCH v12 09/30] media: mc: entity: Rewrite
 media_pipeline_start() to support routes
Content-Language: en-US
To:     Satish Nagireddy <satish.nagireddy@getcruise.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-10-tomi.valkeinen@ideasonboard.com>
 <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com>
 <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com>
 <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAG0LG94AUCng800b6GxaYcATdSJRKHiVdz8wrT83cLMDC0XOtg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 29/07/2022 12:19, Satish Nagireddy wrote:
> On Fri, Jul 29, 2022 at 1:53 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> On 29/07/2022 11:45, Satish Nagireddy wrote:
>>
>>>> @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>>>>
>>>>    struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
>>>>    {
>>>> -       return entity->pipe;
>>>> +       return entity->pads->pipe;
>>>
>>> I am not sure If it is always safe to return the pipe associated with
>>> the first pad. I think this will work with all the existing drivers.
>>> Let's say If pads of an entity are associated with different pipes,
>>> this function might require extending the support of returning
>>> pipe based on pad index. Please let me know your opinion.
>>
>> That's true. The kdoc for this function says:
>>
>>    * In general, entities can be part of multiple pipelines, when carrying
>>    * multiple streams (either on different pads, or on the same pad using
>>    * multiplexed streams). This function is ill-defined in that case. It
>>    * currently returns the pipeline associated with the first pad of the
>> entity.
>>
>> I did consider adding a warning if the function is called for entities
>> with more than one pad. But that probably would give false warnings,
>> e.g. for a simple entity with one sink and one source pad. In that case
>> both pads are always part of the same pipeline, and
>> media_entity_pipeline() works correctly.
>>
>> We could perhaps add a check here which verifies that all the pads in
>> the entity have the same pipe.

Perhaps something like:

struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
{
	struct media_pipeline *pipe;
	struct media_pad *pad;

	if (entity->num_pads == 0)
		return NULL;

	pipe = entity->pads->pipe;

	media_entity_for_each_pad(entity, pad) {
		if (WARN_ON(pad->pipe != pipe))
			return NULL;
	}

	return pipe;
}

>>>>    }
>>>>    EXPORT_SYMBOL_GPL(media_entity_pipeline);
>>>
>>> nit, It would be nice to rename this function to media_entity_get_pipe
>>> or media_entity_get_pipeline for better readability.
>>
>> I'm ok with that, but we do have other functions with this style:
>> media_entity_remote_pad(), media_entity_id(), ...
>>
>>    Tomi
> 
> I could only see one function with the similar style ==>
> media_entity_get_fwnode_pad

Right, so, do you agree that we should keep the name as 
media_entity_pipeline, as we already have many other functions with 
similar style?

  Tomi
