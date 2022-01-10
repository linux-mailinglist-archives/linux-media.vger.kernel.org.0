Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 479B248909E
	for <lists+linux-media@lfdr.de>; Mon, 10 Jan 2022 08:19:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239182AbiAJHTA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Jan 2022 02:19:00 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:53882 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233081AbiAJHTA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Jan 2022 02:19:00 -0500
Received: from [192.168.1.111] (91-156-85-209.elisa-laajakaista.fi [91.156.85.209])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id EABF6A50;
        Mon, 10 Jan 2022 08:18:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1641799138;
        bh=zyb0Pglh7nrANLWYfVG8HYPvP3+n2c214Eq3ZuFScO8=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=NRu+lvxaYT78Xju5h/XUc0B7vyCGY2rozB2WDBxIUHysPIUFeyj1NhNM+Bl9l5sFb
         ljR0JPj4WV7JMkUsgzopMWZHJy3El+FCa7RnajKFrPSVcv47r3KskqtAE5vTGUROHy
         KYon8X7W8SolJyvRoGwQ238NSqi3JbocYHu1mpk4=
Subject: Re: [PATCH v10 15/38] media: entity: Add media_entity_has_route()
 function
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, sakari.ailus@linux.intel.com,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        niklas.soderlund+renesas@ragnatech.se,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Pratyush Yadav <p.yadav@ti.com>,
        Michal Simek <michal.simek@xilinx.com>
References: <20211130141536.891878-1-tomi.valkeinen@ideasonboard.com>
 <20211130141536.891878-16-tomi.valkeinen@ideasonboard.com>
 <YdoetFOzx099fajp@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <68cd6a05-e689-28e2-243b-ec29b999b8da@ideasonboard.com>
Date:   Mon, 10 Jan 2022 09:18:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YdoetFOzx099fajp@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 09/01/2022 01:31, Laurent Pinchart wrote:
> Hello Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Nov 30, 2021 at 04:15:13PM +0200, Tomi Valkeinen wrote:
>> From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>
>> This is a wrapper around the media entity has_route operation.
>>
>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>> Signed-off-by: Michal Simek <michal.simek@xilinx.com>
>> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>> ---
>>   drivers/media/mc/mc-entity.c | 19 +++++++++++++++++++
>>   include/media/media-entity.h | 17 +++++++++++++++++
>>   2 files changed, 36 insertions(+)
>>
>> diff --git a/drivers/media/mc/mc-entity.c b/drivers/media/mc/mc-entity.c
>> index b44ab423b49b..a83f004efd37 100644
>> --- a/drivers/media/mc/mc-entity.c
>> +++ b/drivers/media/mc/mc-entity.c
>> @@ -229,6 +229,25 @@ EXPORT_SYMBOL_GPL(media_entity_pads_init);
>>    * Graph traversal
>>    */
>>   
>> +bool media_entity_has_route(struct media_entity *entity, unsigned int pad0,
>> +			    unsigned int pad1)
>> +{
>> +	if (pad0 >= entity->num_pads || pad1 >= entity->num_pads)
>> +		return false;
>> +
>> +	if (pad0 == pad1)
>> +		return true;
>> +
>> +	if (!entity->ops || !entity->ops->has_route)
>> +		return true;
>> +
>> +	if (entity->pads[pad1].index < entity->pads[pad0].index)
>> +		swap(pad0, pad1);
>> +
>> +	return entity->ops->has_route(entity, pad0, pad1);
>> +}
>> +EXPORT_SYMBOL_GPL(media_entity_has_route);
> 
> As this function is only used in mc-entity.c, can we avoid exposing it
> for now ? It's a new API, and I'd rather be notified if drivers start
> using it directly by requiring a patch to expose the function at that
> point.
Sounds good to me.

  Tomi
