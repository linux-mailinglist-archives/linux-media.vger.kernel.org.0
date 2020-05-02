Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 07D751C2462
	for <lists+linux-media@lfdr.de>; Sat,  2 May 2020 11:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726654AbgEBJds (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 May 2020 05:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgEBJds (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 May 2020 05:33:48 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6F34C061A0C
        for <linux-media@vger.kernel.org>; Sat,  2 May 2020 02:33:46 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id h4so2618474wmb.4
        for <linux-media@vger.kernel.org>; Sat, 02 May 2020 02:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=qGaiNdyrdu5lnBLiGpcUxv1L5915osBmIs26enQqNWc=;
        b=tcdhjy2WZn+culOf27p/Iei8Xdogu5vo/eOWRW6SeUOgqvrnj/PjOBU33dsA+QIwFi
         OH344QZVEQagPVPmFONLeAJsXCPNPEhaOAft6+cFQz7N+Z0bPwOsiXpMkFE23XokfXoT
         /zNA5kR9mjQZaOfemQYHH/pWdn9DP8y+1eFR6kGlNSfOjm1OweMwVMzhr7lSlC7jgLom
         Q9sQAM4J7Q8ZnlmYSn3wI/bnSaLOHgo2JULFyNviuw1vHauh+u29JIoGQ64GByiC+dOo
         HWvHyVQ757y0PzJhYdj+mBN2FArNObKUq6095TDlfVsHjdYl+zoBC9K8kWkD/6KXq2/+
         WmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=qGaiNdyrdu5lnBLiGpcUxv1L5915osBmIs26enQqNWc=;
        b=ZLVY0gYKHKhGxyORoLx4t+QsewkEbtxjl+m7x5OJhEG0g6zOZSYk/elxOdNpdLZ5ia
         L3WU1yxQBkPp2bN65pLkXgkaBp1lwYpChQwEydTSjBkIxhk1ELLb0gCbxhVNvWRaCe5R
         0IHvwS5zrx66zb3/0G0wIHnhluXXZUXmWnkwFEVZGw9Z8jE9VRxwo5rfPuCahF9AV0Zm
         TXhre3iqMsRC7J6PyW74GxdLrvYJuuLWA4sjdoFave8sNpBMuc/njLzermhExGkyqyV/
         C1Od93OkppmHD6ZRGJTtGUOwx34m85ilR6FO2RcvN5QCUcytb3J2qeW9qrimqeDRVEQ4
         VkIQ==
X-Gm-Message-State: AGi0PuaPcaGYovCmTgI5tteiPpWjhtowhHFyuBec7BpZVAFPTKSDawjQ
        RYIRjPBms8RWnZb/qQuambCQ3g==
X-Google-Smtp-Source: APiQypJA0HECOIr7/Pzo59aDmuNrMWweXl71hmEM16sJE3tlUltgKk4o7XAbM966T8W98VXMWtcTLQ==
X-Received: by 2002:a7b:c390:: with SMTP id s16mr3690214wmj.14.1588412025435;
        Sat, 02 May 2020 02:33:45 -0700 (PDT)
Received: from [192.168.1.2] (212-5-158-103.ip.btc-net.bg. [212.5.158.103])
        by smtp.googlemail.com with ESMTPSA id y11sm7156287wrh.59.2020.05.02.02.33.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 May 2020 02:33:44 -0700 (PDT)
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
 <d97b3c8e8a838d60d2d0d6058b77e624c0ee2fe1.camel@ndufresne.ca>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <793c9c28-f922-d1fa-bfda-1709262d4d2c@linaro.org>
Date:   Sat, 2 May 2020 12:33:43 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <d97b3c8e8a838d60d2d0d6058b77e624c0ee2fe1.camel@ndufresne.ca>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Nicolas,

On 5/1/20 5:19 PM, Nicolas Dufresne wrote:
> Le jeudi 30 avril 2020 à 14:38 +0300, Stanimir Varbanov a écrit :
>> Here we add two more reasons for dynamic-resolution-change state
>> (I think the name is misleading espesially "resolution" word, maybe
>> dynamic-bitstream-change is better to describe).
>>
>> The first one which could change in the middle of the stream is the
>> bit-depth. For worst example the stream is 8bit at the begging but
>> later in the bitstream it changes to 10bit. That change should be
>> propagated to the client so that it can take appropriate  action. In
>> this case most probably it has to stop the streaming on the capture
>> queue and re-negotiate the pixel format and start the streaming
>> again.
>>
>> The second new reason is colorspace change. I'm not sure what action
>> client should take but at least it should be notified for such change.
>> One possible action is to notify the display entity that the colorspace
>> and its parameters (y'cbcr encoding and so on) has been changed.
> 
> Just to help with the use case, colorspace changes need to be
> communicated to the following HW or software in your media pipeline.
> Let's consider a V4L2 only use case:
> 
>   m2m decoder -> m2m color transform - >...
> 
> The userspace needs to be aware on time, so that it can reconfigure the
> color transformation parameters. The V4L2 event is a miss-fit though,
> as it does not tell exactly which buffer will start having this new
> colorspace. So in theory, one would have to:
> 
>   - drain
>   - send the new csc parameters
>   - resume
> 
> I'm not sure if our drivers implement resuming after CMD_STOP, do you

According to the spec, after implicit drain the decoder is stopping and
the client have two options:

1. streamoff -> reconfigure queue -> streamon
2. decoder command start

#2 would be the case with colorspace changes.

> have information about that ? We could also go through streamoff/on
> cycle in the mean time. Most codec won't allow changing these
> parameters on delta frames, as it would force the decoder doing CSC
> conversion of the reference frames in decode process, that seems
> unrealistically complex requirement.

Shouldn't such changes be preceded by IDR (or what is applicable for the
codec)?

> 
> That being said, please keep in mind that in VP9, reference frames do
> not have to be of the same sizes. You can change the resolution at any
> point in time. No one managed to decode the related test vectors [0]
> with our current event base resolution change notification.
> 
> [0] FRM_RESIZE https://www.webmproject.org/vp9/levels/

I'd like to try those test streams.

So, If I understood your comments correctly, the colorspace change event
in stateful decoder spec isn't needed?

> 
>>
>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>> ---
>>  Documentation/userspace-api/media/v4l/dev-decoder.rst | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/dev-decoder.rst b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> index 606b54947e10..bf10eda6125c 100644
>> --- a/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> +++ b/Documentation/userspace-api/media/v4l/dev-decoder.rst
>> @@ -906,7 +906,11 @@ reflected by corresponding queries):
>>  
>>  * visible resolution (selection rectangles),
>>  
>> -* the minimum number of buffers needed for decoding.
>> +* the minimum number of buffers needed for decoding,
>> +
>> +* bit-depth of the bitstream has been changed,
>> +
>> +* colorspace (and its properties) has been changed.
>>  
>>  Whenever that happens, the decoder must proceed as follows:
>>  
> 

-- 
regards,
Stan
