Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 671D92EFBF1
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 01:02:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725812AbhAIACK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 8 Jan 2021 19:02:10 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:10299 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbhAIACK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 8 Jan 2021 19:02:10 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610150505; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+ZNrmFyuKwVLa+pRQs07uHq0NtINzoqRqE8VTiClUHc=;
 b=nWo0S196RafkhKdqUpvWmyyY1ogY5u+IZPK/BDRG6wtTwpWeqhsoVfdyM+gGgIsq3K1qZV7m
 EqqnEdLL/zv5+ICOnJ9ANziwZPk2ytjbqhHwjDQQAlvLIk2mIJJzTE1N8rUWdzDSIImE1s95
 NqQ47fA8oQAJLv/iVId5RS1LeLE=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI3ZjU0NiIsICJsaW51eC1tZWRpYUB2Z2VyLmtlcm5lbC5vcmciLCAiYmU5ZTRhIl0=
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n10.prod.us-west-2.postgun.com with SMTP id
 5ff8f2379dddba11a653e001 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Jan 2021 00:00:55
 GMT
Sender: veeras=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4A8C8C43465; Sat,  9 Jan 2021 00:00:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: veeras)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7936BC433C6;
        Sat,  9 Jan 2021 00:00:54 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 08 Jan 2021 16:00:54 -0800
From:   veeras@codeaurora.org
To:     John Stultz <john.stultz@linaro.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-media <linux-media@vger.kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Gustavo Padovan <gustavo@padovan.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, abhinavk@codeaurora.org,
        pdhaval@codeaurora.org, Sean Paul <sean@poorly.run>
Subject: Re: [PATCH RESEND v2 1/2] dma-fence: allow signaling drivers to set
 fence timestamp
In-Reply-To: <CALAqxLVyCuQmEKYh+TBo7k5igP8piz8mAsFt4cChF9q=qmh8XQ@mail.gmail.com>
References: <1609962554-13872-1-git-send-email-veeras@codeaurora.org>
 <CALAqxLVyCuQmEKYh+TBo7k5igP8piz8mAsFt4cChF9q=qmh8XQ@mail.gmail.com>
Message-ID: <5a4f9d51cd07e8a533446e1f093ab4a7@codeaurora.org>
X-Sender: veeras@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 2021-01-08 11:55, John Stultz wrote:
> On Thu, Jan 7, 2021 at 12:53 AM Veera Sundaram Sankaran
> <veeras@codeaurora.org> wrote:
>> 
>> Some drivers have hardware capability to get the precise timestamp of
>> certain events based on which the fences are triggered. This allows it 
>> to
>> set accurate timestamp factoring out any software and IRQ latencies. 
>> Add
>> a timestamp variant of fence signal function, 
>> dma_fence_signal_timestamp
>> to allow drivers to update the precise timestamp for fences.
>> 
> 
> So, on quick review, this seems mostly sane. Though, it might be good
> to add some more detail about how the hardware timestamping fits into
> the kernel's CLOCK_MONOTONIC time domain.
> 
> I just want to make sure this interface isn't abused to jam raw
> hardware-domain timestamps into the fence->timestamp, causing the
> meaning or time-domain of the fence->timestamp to be unclear or
> inconsistent.
> 
> It may be useful to add an additional patch to the documentation
> around the dma_fence structure to make the timestamp field semantics
> more explicit and avoid confusion?

Thanks for the comments. Sure, let me add more information in the
commit-text about the HW timestamp conversion to kernel time-domain.
Will explicitly mention the timestamp domain expected as part of the
new dma_fence_signal_timestamp api documentation, since that would
be the only place the timestamp would be set externally from drivers.
On top of it, do suggest if still documentation on dma_fence struct
would be required.

Thanks,
Veera

> 
> thanks
> -john
