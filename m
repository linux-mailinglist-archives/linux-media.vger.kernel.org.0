Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8674A3CB25C
	for <lists+linux-media@lfdr.de>; Fri, 16 Jul 2021 08:20:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234622AbhGPGW6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Jul 2021 02:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbhGPGW5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Jul 2021 02:22:57 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D2AC06175F
        for <linux-media@vger.kernel.org>; Thu, 15 Jul 2021 23:20:03 -0700 (PDT)
Received: from [192.168.1.111] (91-158-153-130.elisa-laajakaista.fi [91.158.153.130])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id A4E2F3F0;
        Fri, 16 Jul 2021 08:20:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1626416401;
        bh=tVmu9a54j1KhICrif7OW1FH5ZABxEZRFxy22R0MiQJY=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=T63dmsfSAnK2b3yzF0DWF0IbVD+WkjrkfutgExYFkQ/GZ2gYPVlh7BowNjClIXmNL
         vUWJhxvNcoEXUv+Tm2ekiztYMZHQBgSZjmqqbM9a+oZ5LdqcxxWYmuSehFd4CWDxCc
         90OaG2tei2Jlv7z5icgkgw0VOOBdr7WlVC6rCU1c=
Subject: Re: [PATCH v7 06/27] media: entity: Move the pipeline from entity to
 pads
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Lokesh Vutla <lokeshvutla@ti.com>
References: <20210524104408.599645-1-tomi.valkeinen@ideasonboard.com>
 <20210524104408.599645-7-tomi.valkeinen@ideasonboard.com>
 <20210708131136.zidlok5lqq5ihgvv@uno.localdomain>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <b1aaea56-fdb7-a07e-b2c7-a02358fffca8@ideasonboard.com>
Date:   Fri, 16 Jul 2021 09:19:57 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708131136.zidlok5lqq5ihgvv@uno.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/07/2021 16:11, Jacopo Mondi wrote:
> Hello again,
> 
> On Mon, May 24, 2021 at 01:43:47PM +0300, Tomi Valkeinen wrote:
>> From: Sakari Ailus <sakari.ailus@linux.intel.com>
>>
>> This moves the pipe and stream_count fields from struct media_entity to
>> struct media_pad. Effectively streams become pad-specific rather than
>> being entity specific, allowing several independent streams to traverse a
>> single entity and an entity to be part of several streams.
>>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
>>
>> - Update documentation to use 'pads'
>> - Use the media pad iterator in media_entity.c
>> - Update rcar-dma.c to use the new per-pad stream count
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>>
>> - Fix cleanup in the error path of __media_pipeline_start()
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> ---
>>   drivers/media/mc/mc-entity.c                  | 68 +++++++++++--------
>>   drivers/media/platform/exynos4-is/fimc-isp.c  |  2 +-
>>   drivers/media/platform/exynos4-is/fimc-lite.c |  2 +-
>>   drivers/media/platform/omap3isp/isp.c         |  2 +-
>>   drivers/media/platform/omap3isp/ispvideo.c    |  2 +-
>>   drivers/media/platform/omap3isp/ispvideo.h    |  2 +-
>>   drivers/media/platform/rcar-vin/rcar-core.c   | 16 +++--
>>   drivers/media/platform/rcar-vin/rcar-dma.c    |  2 +-
>>   drivers/media/platform/xilinx/xilinx-dma.c    |  2 +-
>>   drivers/media/platform/xilinx/xilinx-dma.h    |  2 +-
>>   drivers/staging/media/imx/imx-media-utils.c   |  2 +-
>>   drivers/staging/media/omap4iss/iss.c          |  2 +-
>>   drivers/staging/media/omap4iss/iss_video.c    |  2 +-
>>   drivers/staging/media/omap4iss/iss_video.h    |  2 +-
>>   include/media/media-entity.h                  | 21 +++---
>>   15 files changed, 73 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index 40ae9b6bac47..ea1cf7f63ae8 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -424,24 +424,28 @@ __must_check int __media_pipeline_start(struct media_entity *entity,
>>
>>   	while ((pad = media_graph_walk_next(graph))) {
>>   		struct media_entity *entity = pad->entity;
>> +		bool skip_validation = pad->pipe != NULL;
>> +		struct media_pad *iter;
>>
>>   		DECLARE_BITMAP(active, MEDIA_ENTITY_MAX_PADS);
>>   		DECLARE_BITMAP(has_no_links, MEDIA_ENTITY_MAX_PADS);
>>
>> -		entity->stream_count++;
>> -
>> -		if (entity->pipe && entity->pipe != pipe) {
>> -			pr_err("Pipe active for %s. Can't start for %s\n",
>> -				entity->name,
>> -				pad_err->entity->name);
>> -			ret = -EBUSY;
>> -			goto error;
>> +		media_entity_for_each_pad(entity, iter) {
>> +			if (iter->pipe && iter->pipe != pipe) {
>> +				pr_err("Pipe active for %s. Can't start for %s\n",
>> +				       entity->name, iter->entity->name);
>> +				ret = -EBUSY;
>> +			} else {
>> +				iter->pipe = pipe;
>> +			}
>> +			iter->stream_count++;
>>   		}
>>
>> -		entity->pipe = pipe;
>> +		if (ret)
> 
> ret is not initialized when declared and there is a code path that
> could lead here without assigning it. I would initialize it to 0 when
> declaring it, or even re-assign it to 0 at the beginning of this while
> loop.

Good catch! I'll fix that.

  Tomi
