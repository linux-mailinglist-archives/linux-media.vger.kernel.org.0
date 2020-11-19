Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 718AA2B8992
	for <lists+linux-media@lfdr.de>; Thu, 19 Nov 2020 02:29:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgKSB0y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 20:26:54 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:57486 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727008AbgKSB0x (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 20:26:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605749213; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=q4wBGCTc2xIs/+st3C1LkLsB6kJ97hFAKJo6hcjnmVo=;
 b=Ddgp6Ehi5U4gE0RQVh3N0+2HHcmEkmf0Op1KEtnQBDwKQmisaO47J5F8phEb9gFQ8LVTX3UA
 fyEoDlAel2hRH9kOa1oxNm+WY1KySrq4TflLU5Wj7xQykqbCDpF32U2diQwsegW2GKBg2ssc
 Wb01JcA/4oRKhFsPqGEEzy7/8UE=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5fb5c9dc22377520ee3b83d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 19 Nov 2020 01:26:52
 GMT
Sender: veeras=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3AB0DC4346A; Thu, 19 Nov 2020 01:26:52 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: veeras)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A47A7C43463;
        Thu, 19 Nov 2020 01:26:50 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 18 Nov 2020 17:26:50 -0800
From:   veeras@codeaurora.org
To:     Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
        sumit.semwal@linaro.org, gustavo@padovan.org, airlied@linux.ie,
        robdclark@gmail.com, sean@poorly.run, pdhaval@codeaurora.org,
        abhinavk@codeaurora.org, jsanka@codeaurora.org
Subject: Re: [PATCH RESEND 2/2] drm/drm_vblank: set the dma-fence timestamp
 during send_vblank_event
In-Reply-To: <20201113204525.GV401619@phenom.ffwll.local>
References: <1605205643-12746-1-git-send-email-veeras@codeaurora.org>
 <1605205643-12746-2-git-send-email-veeras@codeaurora.org>
 <20201113204525.GV401619@phenom.ffwll.local>
Message-ID: <a21bad2bd7b5583692535ea107d38872@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2020-11-13 12:45, Daniel Vetter wrote:
> On Thu, Nov 12, 2020 at 10:27:23AM -0800, Veera Sundaram Sankaran 
> wrote:
>> The explicit out-fences in crtc are signaled as part of vblank event,
>> indicating all framebuffers present on the Atomic Commit request are
>> scanned out on the screen. Though the fence signal and the vblank 
>> event
>> notification happens at the same time, triggered by the same hardware
>> vsync event, the timestamp set in both are different. With drivers
>> supporting precise vblank timestamp the difference between the two
>> timestamps would be even higher. This might have an impact on use-mode
>> frameworks using these fence timestamps for purposes other than simple
>> buffer usage. For instance, the Android framework uses the 
>> retire-fences
>> as an alternative to vblank when frame-updates are in progress Set the
>> fence timestamp during send vblank event to avoid discrepancies.
> 
> I think a reference to the exact source code in android that does this
> would be really useful. Something in drm_hwcomposer or whatever is 
> doing
> this.
> 

Thanks for the review. Sorry for not getting back earlier, was waiting
for the review on [patch 1/2], so that both comments can be addressed 
together.
Here is the reference for Android expecting retire-fence timestamp to
match exactly with hardware vsync as it is used for the dispsync model.

Usage: https://source.android.com/devices/graphics/implement-vsync
Code: 
https://android.googlesource.com/platform/frameworks/native/+/master/services/surfaceflinger/Scheduler/Scheduler.cpp#397
Will update the commit-text with the links as part of V2 patch.

Thanks,
Veera

> Aside from documenting why we want to do this I think this all looks
> reasonable.
> -Daniel
> 
>> 
>> Signed-off-by: Veera Sundaram Sankaran <veeras@codeaurora.org>
>> ---
>>  drivers/gpu/drm/drm_vblank.c | 9 +++++++++
>>  1 file changed, 9 insertions(+)
>> 
>> diff --git a/drivers/gpu/drm/drm_vblank.c 
>> b/drivers/gpu/drm/drm_vblank.c
>> index b18e1ef..b38e50c 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -24,6 +24,7 @@
>>   * OTHER DEALINGS IN THE SOFTWARE.
>>   */
>> 
>> +#include <linux/dma-fence.h>
>>  #include <linux/export.h>
>>  #include <linux/kthread.h>
>>  #include <linux/moduleparam.h>
>> @@ -999,6 +1000,14 @@ static void send_vblank_event(struct drm_device 
>> *dev,
>>  		e->event.seq.time_ns = ktime_to_ns(now);
>>  		break;
>>  	}
>> +
>> +	/*
>> +	 * update fence timestamp with the same vblank timestamp as both
>> +	 * are signaled by the same event
>> +	 */
>> +	if (e->base.fence)
>> +		e->base.fence->timestamp = now;
>> +
>>  	trace_drm_vblank_event_delivered(e->base.file_priv, e->pipe, seq);
>>  	drm_send_event_locked(dev, &e->base);
>>  }
>> --
>> 2.7.4
>> 
