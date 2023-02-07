Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0ACFB68DA09
	for <lists+linux-media@lfdr.de>; Tue,  7 Feb 2023 15:02:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231951AbjBGOC2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 7 Feb 2023 09:02:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230194AbjBGOC0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 7 Feb 2023 09:02:26 -0500
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27F5124CB2;
        Tue,  7 Feb 2023 06:01:58 -0800 (PST)
Received: from [192.168.1.15] (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 93449589;
        Tue,  7 Feb 2023 15:01:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1675778489;
        bh=gqU5bHqDi8xgCIZiz9wZVPYc6aTM+5GVzl8RsFHv8iY=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=vXg180w4pXnUJ4oDGn08jyRIvwvYzhfJL6MpgEpjzvpT1T7dG9Wx67EhFrLHoUzzJ
         /FjOi7YSgcwttKNR/gfsBd7uusZwUl7eLxq0lWmy7jc5k7IorovxRP42coFpJEWJGD
         ZFZDmb7sVAjlcwZp/F7NuA/NOiF5SH9iuNv3qPHE=
Message-ID: <1aefdb40-af34-c378-42ba-13796d6e6d9e@ideasonboard.com>
Date:   Tue, 7 Feb 2023 16:01:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH] media: renesas: vsp1: Add underrun debug print
Content-Language: en-US
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
References: <20230207124440.123910-1-tomi.valkeinen@ideasonboard.com>
 <Y+JZd2whadJ/37k2@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
In-Reply-To: <Y+JZd2whadJ/37k2@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,SPF_HELO_PASS,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/02/2023 16:00, Laurent Pinchart wrote:
> Hi Tomi,
> 
> Thank you for the patch.
> 
> On Tue, Feb 07, 2023 at 02:44:40PM +0200, Tomi Valkeinen wrote:
>> From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>>
>> Print underrun interrupts with ratelimited print.
>>
>> Note that we don't enable the underrun interrupt. If we have underruns,
>> we don't want to get flooded with interrupts about them. It's enough to
>> see that an underrun happened at the end of a frame.
>>
>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
>> ---
>>   drivers/media/platform/renesas/vsp1/vsp1_drv.c  | 8 +++++++-
>>   drivers/media/platform/renesas/vsp1/vsp1_regs.h | 2 ++
>>   2 files changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_drv.c b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> index 5710152d6511..b24437b5b945 100644
>> --- a/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> +++ b/drivers/media/platform/renesas/vsp1/vsp1_drv.c
>> @@ -45,7 +45,8 @@
>>   
>>   static irqreturn_t vsp1_irq_handler(int irq, void *data)
>>   {
>> -	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE;
>> +	u32 mask = VI6_WPF_IRQ_STA_DFE | VI6_WPF_IRQ_STA_FRE |
>> +		   VI6_WPF_IRQ_STA_UND;
>>   	struct vsp1_device *vsp1 = data;
>>   	irqreturn_t ret = IRQ_NONE;
>>   	unsigned int i;
>> @@ -60,6 +61,11 @@ static irqreturn_t vsp1_irq_handler(int irq, void *data)
>>   		status = vsp1_read(vsp1, VI6_WPF_IRQ_STA(i));
>>   		vsp1_write(vsp1, VI6_WPF_IRQ_STA(i), ~status & mask);
>>   
>> +		if (status & VI6_WPF_IRQ_STA_UND) {
>> +			dev_warn_ratelimited(vsp1->dev,
>> +					     "Underrun occurred at WPF%u\n", i);
>> +		}
> 
> You could drop the braces.

I could, but block is not a single line, so... Well, matter of taste =).

  Tomi

