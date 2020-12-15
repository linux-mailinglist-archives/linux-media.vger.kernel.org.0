Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 80F8B2DAFD6
	for <lists+linux-media@lfdr.de>; Tue, 15 Dec 2020 16:12:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729623AbgLOPLJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 15 Dec 2020 10:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729908AbgLOPK5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 15 Dec 2020 10:10:57 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49FFCC0617A6
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:10:17 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id r5so21349558eda.12
        for <linux-media@vger.kernel.org>; Tue, 15 Dec 2020 07:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JL380wRjrNmc3KbZLYkNEtg0UXEZ47qwqrMmqRpr0/0=;
        b=Z2g/BO/VvsTjLTVv2qOuhcyVY2CLSV994X13g2MX/7gB1E7z6NkTlgPOBT2/TF5Z+G
         ubgpTQnYbnWze+6oTeIFurc5dkwar1XlWmtEXRSVQbtB7eFsvhZglqcqgDbxjBpJ3je7
         gc3J92qez6jx8H7vjdybznOlzdPDVmMX5hUGMVU0qFZSzUPDqcyq9umJeWE1Xvj6wD9/
         l2Me8/HVutoUcT3f0dtK3mxCHRbmSFsfqIvw7iGQrWaphh66tUtkGT9UZ3qJ6ZDC5FPR
         Rw7sy5haUireA+V6/bCqpCorC6PIjTDOeThjkaJ7FkUAZxJCUdDYSVJkh/zd75BFGoU3
         bwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JL380wRjrNmc3KbZLYkNEtg0UXEZ47qwqrMmqRpr0/0=;
        b=o8pxYdvbXmUiel6GFxuS20orA9nz38TeoaJMFwRL2mw4bQpUJHOdBfCYewosN0BJNf
         5G1jUBjK+vB9j1XoNb8IJmMhpusFbTamyefhlGWT7LQLNPIr7+Itk0vkWBVWhmxNcrCv
         y/GAK7kraJv/drXeiPUwHMGlteDXVLoVWeoULrpHEqMVCqCVTUUk7OchYoOkV9qTvLR5
         b1t3hsck6NJ97DFo++SGKQ/D0OcpJsqDEiu7ICymYNbYj3msBF3OTIhQ2tiiG7Oe31VJ
         y9+xDD12d7WnMFuykJ4tGNT5J0RVd7rb0xYO8iZu5seIvXtQalgpsFQwGnXMSXLbu/kz
         572Q==
X-Gm-Message-State: AOAM533GK5qxr9T20/jICcPjljVVw+9jUhgrNk+DdTf8CMQVVU7XXG0l
        0rnU3YTgxEBRSNbX+iKjinS2Bg==
X-Google-Smtp-Source: ABdhPJyDai9/+EgeNWq02IjXiZcb9+ZiWsxsrIsDuoKBrqz/KWOVJRlJE6fPyjxXqZt5Zb/jAyKHiQ==
X-Received: by 2002:a50:f299:: with SMTP id f25mr16503130edm.133.1608045014627;
        Tue, 15 Dec 2020 07:10:14 -0800 (PST)
Received: from [192.168.0.3] (hst-221-39.medicom.bg. [84.238.221.39])
        by smtp.googlemail.com with ESMTPSA id u23sm1586839ejc.46.2020.12.15.07.10.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Dec 2020 07:10:14 -0800 (PST)
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Subject: Re: HEIC encoder/decoder
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>
References: <5c5cd205-5c7f-1450-1f84-7d0e573dc90f@linaro.org>
 <fcc1f01b-8dbf-bb6e-87d5-95a484261dc7@xs4all.nl>
Message-ID: <39738e98-0e7b-9328-6ffc-4ce12bf89176@linaro.org>
Date:   Tue, 15 Dec 2020 17:10:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <fcc1f01b-8dbf-bb6e-87d5-95a484261dc7@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for comments!

On 12/10/20 11:19 AM, Hans Verkuil wrote:
> On 10/12/2020 00:10, Stanimir Varbanov wrote:
>> Hello,
>>
>> I have to implement HEIC image encoder (and later decoder) in Venus
>> driver and I wonder how to distinguish image vs video encoding using
>> HEVC and possibly AVC codecs.
>>
>> I could imagine those two options:
>>
>> * introduce a new compressed format V4L2_PIX_FMT_HEVC_IMAGE and reuse
>> video encoder as of now, or
> 
> This option seems to be the correct one. It is also in line with how JPEG
> is used.
> 
> I wonder if it should be called V4L2_PIX_FMT_HEIC instead, but it's not
> entirely clear to me from the wikipedia page what that makes sense or not.

This option is preferable to me as well.

I'm going to send an RFC for that and we can continue the duscussion on
the subject.

> 
>>
>> * make a separate video node which supports HEVC with profiles Main
>> Still Picture and Main 10 Still picture only. The problem here is that
>> AVC doesn't provide profiles for still pictures, and in this case the
>> driver cannot distinguish what the client wants video or image
>> encoding/decoding.
> 
> That's too messy. A separate pixel format for still images works well.
> There is a huge difference between HEVC and HEIC since with HEIC each
> frame (like JPEG) is independently encoded/decoded, so the driver behaves
> differently. It makes perfect sense to use a separate pixel format for this.
> 
> Regards,
> 
> 	Hans
> 
>>
>> It is a bit more complicated but I'd like to receive comments / ideas at
>> what would be the best way.
>>
> 

-- 
regards,
Stan
