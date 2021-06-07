Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5516439D7FC
	for <lists+linux-media@lfdr.de>; Mon,  7 Jun 2021 10:53:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230252AbhFGIzt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 7 Jun 2021 04:55:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhFGIzs (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 7 Jun 2021 04:55:48 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F0572C061766
        for <linux-media@vger.kernel.org>; Mon,  7 Jun 2021 01:53:57 -0700 (PDT)
Received: from [192.168.1.111] (91-157-208-71.elisa-laajakaista.fi [91.157.208.71])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0D0BCE04;
        Mon,  7 Jun 2021 10:53:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623056035;
        bh=wAl3heMQf03nEo6jS0A/Au1duG4s+5C9klk3VeNIhZc=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=EY9EYVbYWGxL6wPY2qek41qm5PhQbeBTPocwGh8C7IqEnDcta9QqHckPUT4QmKPwD
         b6JeMtPM8an77WFWA5iJqE2SYVfBH4eNRfkLcA6kEKo2cDfeZ+PNlG65Mgvx4QGBuj
         I4Yo5eUaWYH+sWk0SmWsXvMV+Gv5x6n1Dxs0kzr0=
Subject: Re: [PATCH v3 21/38] media: ti-vpe: cal: handle cal_ctx_v4l2_register
 error
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Pratyush Yadav <p.yadav@ti.com>, Lokesh Vutla <lokeshvutla@ti.com>,
        linux-media@vger.kernel.org
References: <20210524110909.672432-1-tomi.valkeinen@ideasonboard.com>
 <20210524110909.672432-22-tomi.valkeinen@ideasonboard.com>
 <YLou7fPDyQaCaz1o@pendragon.ideasonboard.com>
 <a810e868-5ddf-7cf6-df70-723aa8bd447b@ideasonboard.com>
 <YL3SOsELi3yuoqDl@pendragon.ideasonboard.com>
From:   Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Message-ID: <e65f2fdd-9ad9-c429-76d7-2bb7a112e507@ideasonboard.com>
Date:   Mon, 7 Jun 2021 11:53:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YL3SOsELi3yuoqDl@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 07/06/2021 11:00, Laurent Pinchart wrote:
> Hi Tomi,
> 
> On Mon, Jun 07, 2021 at 10:44:17AM +0300, Tomi Valkeinen wrote:
>> On 04/06/2021 16:47, Laurent Pinchart wrote:
>>> On Mon, May 24, 2021 at 02:08:52PM +0300, Tomi Valkeinen wrote:
>>>> cal_async_notifier_complete() doesn't handle errors returned from
>>>> cal_ctx_v4l2_register(). Add the error handling.
>>>>
>>>> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
>>>> ---
>>>>    drivers/media/platform/ti-vpe/cal.c | 8 ++++++--
>>>>    1 file changed, 6 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/drivers/media/platform/ti-vpe/cal.c b/drivers/media/platform/ti-vpe/cal.c
>>>> index ba8821a3b262..9e051c2e84a9 100644
>>>> --- a/drivers/media/platform/ti-vpe/cal.c
>>>> +++ b/drivers/media/platform/ti-vpe/cal.c
>>>> @@ -743,8 +743,12 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
>>>>    	int ret = 0;
>>>>    
>>>>    	for (i = 0; i < ARRAY_SIZE(cal->ctx); ++i) {
>>>> -		if (cal->ctx[i])
>>>> -			cal_ctx_v4l2_register(cal->ctx[i]);
>>>> +		if (!cal->ctx[i])
>>>> +			continue;
>>>> +
>>>> +		ret = cal_ctx_v4l2_register(cal->ctx[i]);
>>>> +		if (ret)
>>>> +			return ret;
>>>
>>> This part looks good, so
>>>
>>> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>
>>> Don't we need to call cal_ctx_v4l2_unregister() in the error path of
>>> cal_async_notifier_register() though ?
>>
>> Hmm, can you elaborate? I don't understand where and why we need to call
>> the unregister.
> 
> cal_async_notifier_complete() can be called synchronously by
> v4l2_async_notifier_register() if all async subdevs are present. If
> cal_ctx_v4l2_register() fails for one contexts, the failure will be
> propagated to cal_async_notifier_register(), then to
> cal_media_register(), and cal_probe(). Unless I'm mistaken, the contexts
> for which cal_ctx_v4l2_register() succeeded will not be cleaned
> properly.

Right. I think this can be solved easily by unrolling in the complete callback:

@@ -748,7 +748,16 @@ static int cal_async_notifier_complete(struct v4l2_async_notifier *notifier)
  
  		ret = cal_ctx_v4l2_register(cal->ctx[i]);
  		if (ret)
-			return ret;
+			break;
+	}
+
+	if (ret) {
+		unsigned int j;
+
+		for (j = 0; j < i; ++j)
+			cal_ctx_v4l2_unregister(cal->ctx[j]);
+
+		return ret;
  	}
  
  	if (cal_mc_api)

I'll squash this diff to this patch.

  Tomi
