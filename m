Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E01173FE53E
	for <lists+linux-media@lfdr.de>; Thu,  2 Sep 2021 00:07:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244373AbhIAWIm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 18:08:42 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:52984 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbhIAWIm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Sep 2021 18:08:42 -0400
Received: from [192.168.0.20] (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 75B4E340;
        Thu,  2 Sep 2021 00:07:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1630534063;
        bh=2vlbw2B0+YVF5+3bLaXaRE4or7W26cse9l7d+lCgGoc=;
        h=Subject:To:Cc:References:Reply-To:From:Date:In-Reply-To:From;
        b=qQWe3PcUs7d7nbdvB3kmT/ZX2fCMllmZI4g2yPFk2QiB5SFsOjtbYacpN7jH+K4lb
         QA2Tiq6HoCEsT74WQ9vxQMyrawKoO8b+Zt3GIIur6oIPu9gxopr/u4vLf1peCDPWR/
         Mhh6v6YLVfqyQ2uMj1IVWaIHa1HJ5aew7agugVlk=
Subject: Re: [PATCH] media: vsp1: Simplify DRM UIF handling
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     linux-renesas-soc@vger.kernel.org, linux-media@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
References: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
 <YMz0+aiRDqHfWarV@pendragon.ideasonboard.com>
Reply-To: kieran.bingham+renesas@ideasonboard.com
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Organization: Ideas on Board
Message-ID: <c9d2529f-8d4f-dbae-7e34-d8e9662b0be0@ideasonboard.com>
Date:   Wed, 1 Sep 2021 23:07:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YMz0+aiRDqHfWarV@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 18/06/2021 20:33, Laurent Pinchart wrote:
> Hi Kieran,
> 
> Thank you for the patch.
> 
> On Fri, Jun 18, 2021 at 08:09:05PM +0100, Kieran Bingham wrote:
>> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>>
>> In commit 6732f3139380 ("media: v4l: vsp1: Fix uif null pointer access")
>> the handling of the UIF was over complicated, and the patch applied
>> before review.
>>
>> Simplify it to keep the conditionals small.
>>
>> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>> ---
>>
>> Another one that I had lying around in my tree for too long ....
> 
> It seems to have survived bitrot quite well.

This still applies with git am to my tree here ...

> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thanks, do I need to do anything else to progress this ?

--
Kieran


> 
>>  drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++++--
>>  1 file changed, 6 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c b/drivers/media/platform/vsp1/vsp1_drm.c
>> index 06f74d410973..0c2507dc03d6 100644
>> --- a/drivers/media/platform/vsp1/vsp1_drm.c
>> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
>> @@ -455,6 +455,10 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
>>  		dev_err(vsp1->dev, "%s: failed to setup UIF after %s\n",
>>  			__func__, BRX_NAME(pipe->brx));
>>  
>> +	/* If the DRM pipe does not have a UIF there is nothing we can update. */
>> +	if (!drm_pipe->uif)
>> +		return 0;
>> +
>>  	/*
>>  	 * If the UIF is not in use schedule it for removal by setting its pipe
>>  	 * pointer to NULL, vsp1_du_pipeline_configure() will remove it from the
>> @@ -462,9 +466,9 @@ static int vsp1_du_pipeline_setup_inputs(struct vsp1_device *vsp1,
>>  	 * make sure it is present in the pipeline's list of entities if it
>>  	 * wasn't already.
>>  	 */
>> -	if (drm_pipe->uif && !use_uif) {
>> +	if (!use_uif) {
>>  		drm_pipe->uif->pipe = NULL;
>> -	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
>> +	} else if (!drm_pipe->uif->pipe) {
>>  		drm_pipe->uif->pipe = pipe;
>>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
>>  	}
> 

