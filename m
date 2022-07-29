Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 91B5B584DB9
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 10:53:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235404AbiG2Ixw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 04:53:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235311AbiG2Ixv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 04:53:51 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 575FE82FBE
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 01:53:50 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DCFF52F;
        Fri, 29 Jul 2022 10:53:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659084828;
        bh=6RMsukyc9kPRvqVH8PwfTQdPTe5CW3uhsQnWhcemZE0=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=SwFzdjC6nWtMpe+I1gNwhv9vvdVS0ux0ZIc77xmblb0Roz3Qe9oortLJaUaQMzcej
         ANjq15zIZNj3XePEP2V03NE4sc8LOorQdSwd8x96PiTshnwf1cjWhTsSLAbjwFEPX9
         7zUe20jCTXqO7KhjtAXkMFD3Ti+b7YMGsSn31y/0=
Message-ID: <438685f9-1a18-31c3-ffbc-15e87ef7493d@ideasonboard.com>
Date:   Fri, 29 Jul 2022 11:53:46 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [EXT] [PATCH v12 09/30] media: mc: entity: Rewrite
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
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAG0LG94ADymN_R0Mw0hSf-M0nwUcWW_Xtr8gLM=wsqdH7Ep2Wg@mail.gmail.com>
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

On 29/07/2022 11:45, Satish Nagireddy wrote:

>> @@ -1011,7 +1342,7 @@ EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>>
>>   struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
>>   {
>> -       return entity->pipe;
>> +       return entity->pads->pipe;
> 
> I am not sure If it is always safe to return the pipe associated with
> the first pad. I think this will work with all the existing drivers.
> Let's say If pads of an entity are associated with different pipes,
> this function might require extending the support of returning
> pipe based on pad index. Please let me know your opinion.

That's true. The kdoc for this function says:

  * In general, entities can be part of multiple pipelines, when carrying
  * multiple streams (either on different pads, or on the same pad using
  * multiplexed streams). This function is ill-defined in that case. It
  * currently returns the pipeline associated with the first pad of the 
entity.

I did consider adding a warning if the function is called for entities 
with more than one pad. But that probably would give false warnings, 
e.g. for a simple entity with one sink and one source pad. In that case 
both pads are always part of the same pipeline, and 
media_entity_pipeline() works correctly.

We could perhaps add a check here which verifies that all the pads in 
the entity have the same pipe.

>>   }
>>   EXPORT_SYMBOL_GPL(media_entity_pipeline);
> 
> nit, It would be nice to rename this function to media_entity_get_pipe
> or media_entity_get_pipeline for better readability.

I'm ok with that, but we do have other functions with this style: 
media_entity_remote_pad(), media_entity_id(), ...

  Tomi
