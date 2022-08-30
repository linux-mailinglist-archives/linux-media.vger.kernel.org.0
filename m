Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF5DC5A63A9
	for <lists+linux-media@lfdr.de>; Tue, 30 Aug 2022 14:40:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiH3Mko (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 30 Aug 2022 08:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiH3Mkh (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 30 Aug 2022 08:40:37 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CC77A9C19
        for <linux-media@vger.kernel.org>; Tue, 30 Aug 2022 05:40:36 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id AF117481;
        Tue, 30 Aug 2022 14:40:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1661863234;
        bh=O1uNeNY2vei8cvEZjNA+RhZbjF7uqVMGJCHLR9QwLN4=;
        h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
        b=uYlv5WRMRTyQW1kR+z/uHVQRgXC022Hi/J6WUJycYWUg/VfkUTtQWlInepNXQHXSH
         DB37Tx+KyTjBLO4QTBjWex4XPEywzlM39Y63mwz36SprYnFN0927zVjzDtO8aTBYnY
         hqFkAjUVqxNfBCKv/XB61gexJXIsAmPXE+5nJ/nU=
Message-ID: <fbf717fc-ecb7-ddc1-096f-f2bcd93a25e3@ideasonboard.com>
Date:   Tue, 30 Aug 2022 15:40:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v13 14/34] media: mc: entity: Rewrite
 media_pipeline_start()
Content-Language: en-US
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
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
 <51d2f837-6234-eb66-c1cc-a12a9e51c136@ideasonboard.com>
In-Reply-To: <51d2f837-6234-eb66-c1cc-a12a9e51c136@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 30/08/2022 14:44, Tomi Valkeinen wrote:

>>> @@ -966,10 +1318,29 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>>>   struct media_pipeline *media_entity_pipeline(struct media_entity 
>>> *entity)
>>>   {
>>> -    return entity->pipe;
>>> +    struct media_pipeline *pipe;
>>> +    struct media_pad *pad;
>>> +
>>> +    if (entity->num_pads == 0)
>>> +        return NULL;
>>> +
>>> +    pipe = entity->pads->pipe;
>>> +
>>> +    media_entity_for_each_pad(entity, pad) {
>>> +        if (WARN_ON(pad->pipe != pipe))
>>> +            return NULL;
>>> +    }
>>
>> This wasn't done in v12, could you explain the rationale ? The
>> documentation of media_entity_pipeline() should probably be updated too.
> 
> This is just a sanity check.
> 
> The doc says "This function is to be used only for entities that do not 
> support multiple pipelines". So the pipeline must be the same for all 
> pads, and if that's not the case, something is horribly wrong.
> 
> However, now that I think about it, can we have NULL pipes in some pads, 
> if those pads are e.g. not linked... Then I think the check should be 
> (pipe && pad->pipe && pipe != pad->pipe).
> 
> But if that's the case, does this even work... The code expects the 
> first pad to contain the pipeline for the entity. If the first pad's 
> pipe can be NULL, but, say, second and fourth pads contain the pipeline 
> (as those pads are actually used), then this is quite broken.

Looks like my concern has some grounds. While I don't have a perfect 
setup to test this, I think my test with UB960 shows that unlinked pads 
have NULL pipeline. So if we have an entity with two sink pads (0 and 1) 
and two source pads (2 and 3), and the pipeline goes through pads 1 and 
3, this function will always return NULL.

I'm not sure how to fix this. One option would be to make this function 
available only for entities with 1 or 2 (a sink and a source) pads. But 
I have no idea if that covers the current users.

Or should this function iterate through the pads and return the first 
non-null pipe?

Looks like there are only a few users for this. The one in 
imx-media-utils.c can be dropped easily. omap4iss and omap3isp uses are 
not clear to me yet.

  Tomi
