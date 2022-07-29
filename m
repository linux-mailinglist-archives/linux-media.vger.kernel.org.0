Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17E5A584D86
	for <lists+linux-media@lfdr.de>; Fri, 29 Jul 2022 10:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbiG2Ikx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 29 Jul 2022 04:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235712AbiG2Ikg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 29 Jul 2022 04:40:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797E083209
        for <linux-media@vger.kernel.org>; Fri, 29 Jul 2022 01:40:31 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id BDD586D4;
        Fri, 29 Jul 2022 10:40:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659084028;
        bh=57jNvG6QrWX/n1Zzt82/fHspzLGJcw5kr7AD8kiaaoo=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=DH6oV+BlytLMEdOL6FRfEX75FzxZpghvYwfkgf4liODiSF70X0ro8LE2w0ZjWe70/
         lEM4OPBExBbLje66uNtjmK17DbYyyYyJryXrMa8pxj7mG9GhgZEvFyAAcoAaXMMOmi
         d5ut3LJDzbH8CVnrk+r6nB3LG1wbDUyg8CYOLMLI=
Message-ID: <3b6f5fe4-24c5-0a3c-5932-8b0dce0b06ed@ideasonboard.com>
Date:   Fri, 29 Jul 2022 11:40:24 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [EXT] [PATCH v12 08/30] media: mc: entity: add
 media_pipeline_alloc_start & media_pipeline_stop_free
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
 <20220727103639.581567-9-tomi.valkeinen@ideasonboard.com>
 <CAG0LG97p4X9oVa7GJxiGvZKzKY45ivPMi2QHeH=k4M7GSo5FrA@mail.gmail.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <CAG0LG97p4X9oVa7GJxiGvZKzKY45ivPMi2QHeH=k4M7GSo5FrA@mail.gmail.com>
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

On 29/07/2022 11:30, Satish Nagireddy wrote:
> Hi Tomi,
> 
> Thanks for the patch.
> 
> On Wed, Jul 27, 2022 at 3:37 AM Tomi Valkeinen
> <tomi.valkeinen@ideasonboard.com> wrote:
>>
>> Add new versions of media_pipeline_start() and media_pipeline_stop().
>> The new functions can be used by drivers that do not need to extend the
>> media_pipeline with their own structs, and the new functions will handle
>> allocating and freeing the media_pipeline as needed.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/mc/mc-entity.c | 49 ++++++++++++++++++++++++++++++++++++
>>   include/media/media-entity.h | 22 ++++++++++++++++
>>   2 files changed, 71 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 0d0d6c0dda16..b7b6c6411aa7 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -579,6 +579,55 @@ void media_pipeline_stop(struct media_entity *entity)
>>   }
>>   EXPORT_SYMBOL_GPL(media_pipeline_stop);
>>
>> +__must_check int media_pipeline_alloc_start(struct media_entity *entity)
>> +{
>> +       struct media_device *mdev = entity->graph_obj.mdev;
>> +       struct media_pipeline *pipe;
>> +       int ret;
>> +       bool new_pipe = false;
>> +
>> +       mutex_lock(&mdev->graph_mutex);
>> +
>> +       /*
>> +        * Is the entity already part of a pipeline? If not, we need to allocate
>> +        * a pipe.
>> +        */
>> +       pipe = media_entity_pipeline(entity);
>> +       if (!pipe) {
>> +               pipe = kzalloc(sizeof(*pipe), GFP_KERNEL);
> 
> Please add NULL check here to handle the allocation failure.

Oops...

>> +               new_pipe = true;
>> +       }
>> +
>> +       ret = __media_pipeline_start(entity, pipe);
>> +       if (ret) {
>> +               if (new_pipe)
>> +                       kfree(pipe);
>> +       }
>> +
>> +       mutex_unlock(&mdev->graph_mutex);
>> +
>> +       return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(media_pipeline_alloc_start);
> 
> Just a suggestion. It would be nice to extend the
> media_pipeline_start() instead of adding a new function. The caller
> can pass pipe as NULL as below.
>        media_pipeline_start(entity, NULL)
> And allocation can happen inside media_pipeline_start() when pipe is NULL.

Hmm, yes, that is an option, although I'm not quite happy with such a 
call either. Passing a NULL there could be a driver bug, and with such a 
change that would not be caught.

But we also need to free the memory, for which I have the 
media_pipeline_stop_free(). If we go with your suggestion, I think we 
can add a boolean to struct media_pipeline which tells if it was 
allocated by the media_pipeline_start(), and then media_pipeline_stop() 
can free it.

This would allow us to keep the existing calls and not add any new ones.

  Tomi
