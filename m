Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 315055863DA
	for <lists+linux-media@lfdr.de>; Mon,  1 Aug 2022 08:01:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239567AbiHAGBo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 1 Aug 2022 02:01:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239822AbiHAGB2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 1 Aug 2022 02:01:28 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 290D514091
        for <linux-media@vger.kernel.org>; Sun, 31 Jul 2022 23:01:22 -0700 (PDT)
Received: from [192.168.1.111] (91-158-154-79.elisa-laajakaista.fi [91.158.154.79])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 806A848F;
        Mon,  1 Aug 2022 08:01:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1659333679;
        bh=x6q/c83v4OXc3ravtm6aJavE2fkcPjd1C85IkRgS/Yk=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=pLpDbbPCs9pKlDhjUkTun4fiuUjUjQK/SgQiNXxcsrRBNLtqlZva2l0aAEvofgrSJ
         gENbLDts/PHUPG7Gwbx4ZEqqCU4Jd5HuX9TMTeF4ulKsB2po2oyUliECRoXfd8GjFt
         HA0yKe8Dwz5MYnyLjd0n873PmgXmnN/DgklJWVMc=
Message-ID: <15b537d0-d839-ec43-6ea3-e9c4fd71c9ad@ideasonboard.com>
Date:   Mon, 1 Aug 2022 09:01:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v12 05/30] media: mc: entity: Add media_entity_pipeline()
 to access the media pipeline
Content-Language: en-US
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     linux-media@vger.kernel.org,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Kishon Vijay Abraham <kishon@ti.com>,
        satish.nagireddy@getcruise.com, Tomasz Figa <tfiga@chromium.org>
References: <20220727103639.581567-1-tomi.valkeinen@ideasonboard.com>
 <20220727103639.581567-6-tomi.valkeinen@ideasonboard.com>
 <YuUUJCzM2HC7Tz++@paasikivi.fi.intel.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <YuUUJCzM2HC7Tz++@paasikivi.fi.intel.com>
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

On 30/07/2022 14:21, Sakari Ailus wrote:
> Moi,
> 
> On Wed, Jul 27, 2022 at 01:36:14PM +0300, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> Replace direct access to the pipe field in drivers with a new helper
>> function. This will allow easier refactoring of media pipeline handling
>> in the MC core behind the scenes without affecting drivers.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/mc/mc-entity.c                   |  6 ++++++
>>   .../platform/renesas/rcar-vin/rcar-core.c      |  5 ++---
>>   .../media/platform/renesas/rcar-vin/rcar-dma.c |  2 +-
>>   drivers/media/platform/ti/omap3isp/isp.c       |  4 +---
>>   drivers/media/platform/ti/omap3isp/ispvideo.c  |  3 +--
>>   drivers/media/platform/ti/omap3isp/ispvideo.h  | 11 +++++++++--
>>   drivers/media/platform/xilinx/xilinx-dma.c     |  3 +--
>>   drivers/media/platform/xilinx/xilinx-dma.h     |  7 ++++++-
>>   drivers/staging/media/imx/imx-media-utils.c    |  2 +-
>>   drivers/staging/media/omap4iss/iss.c           |  4 +---
>>   drivers/staging/media/omap4iss/iss_video.c     |  3 +--
>>   drivers/staging/media/omap4iss/iss_video.h     | 11 +++++++++--
>>   include/media/media-entity.h                   | 18 ++++++++++++++++++
>>   13 files changed, 57 insertions(+), 22 deletions(-)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 9f4a1c98dc43..50872d953cf9 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -923,6 +923,12 @@ int media_entity_get_fwnode_pad(struct media_entity *entity,
>>   }
>>   EXPORT_SYMBOL_GPL(media_entity_get_fwnode_pad);
>>   
>> +struct media_pipeline *media_entity_pipeline(struct media_entity *entity)
>> +{
>> +	return entity->pipe;
> 
> I'd make this an inline function. Or do you plan to add more code later?

I have this in my work tree due to comments from Satish:

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

  Tomi
