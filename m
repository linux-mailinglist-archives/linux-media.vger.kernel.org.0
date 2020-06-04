Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 141CF1EE6E3
	for <lists+linux-media@lfdr.de>; Thu,  4 Jun 2020 16:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729037AbgFDOqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Jun 2020 10:46:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728682AbgFDOqy (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Jun 2020 10:46:54 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E03C08C5C0
        for <linux-media@vger.kernel.org>; Thu,  4 Jun 2020 07:46:52 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id q13so4954832edi.3
        for <linux-media@vger.kernel.org>; Thu, 04 Jun 2020 07:46:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ldLDzB4mmzHD9LXsk+Mx+q4eu/p5sjySWbWIwUUrWCQ=;
        b=TmjrxCi41qTCVvQcVfhx5e/tWV3MRClFtlAbh8NRjmd0NtIEBmBkzXkgQNlSQp6SwV
         BkrfZpUPBv+p2Wp/jZQiwU8RtsdgTTDe52Yl0+KLsdgCBXr6qfIdIK5J/WI7X0LxRkIf
         mutPy2jOuTSs5o4bTxSpueLduNeDrWAoL4l5JqRJOQg7Xdg3b9cdupkT7iYyOPu/bhOo
         fcmVXCoCY26aBTVP4MDM8b1WMwuaN2Eo+99YJTaed/9XNuEctFa0QW4rnhioKgJNxG1d
         Vet3scMUk4bkoPA8BoIWCWgDNVs1OGJ2OA//fUlr55nfLwan5rpA44lGPNmsXeMyRqX8
         fsLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ldLDzB4mmzHD9LXsk+Mx+q4eu/p5sjySWbWIwUUrWCQ=;
        b=ufQ0cNATGtF/o4Jdy6Fey1Al9BmloSiFFA+Nh4XAenLJh5PvL4tEnFZtzfnv/ocA3T
         Mv4fcA2DWfPl7hL+Rdz5p2G6l/9Ncz6T574KoNUG7+3gEyO0WnjCs7ucHFvcefFPn1FJ
         pSjpBQrlvZJxUFufhHekMkPb1fWeY0yJQLkk0Jf10/mJEFZUf9ZykMjug0MCeUtSNF44
         CSFV4UAejacSJu3k8xDJttVtNCMxxQVN4JY6peHaNalO3Iw1FieK9XnudFDmtxpz1qmg
         zg0MJhFYD9EVto1q8Dhmh/LWmO6YEaha5kNjESNJdHtw0qYuKFW1Gvz0THGqvZUlO7Wd
         L8Aw==
X-Gm-Message-State: AOAM530yCBYPmDv/VaILXncFbgsHbSWGikTLe3VfmQY8fZghxIcUFNe+
        JQoSM7vgit5K12K7iOiJl1M9G08Us/slxg==
X-Google-Smtp-Source: ABdhPJwpi0uT3Tq8hzWzZ+vQbxUTO8o39hx/6hR/q7kXLBwTaQ4IcPERmCyLjo0F7ZLi7Tq5jSrpOA==
X-Received: by 2002:aa7:de14:: with SMTP id h20mr3222278edv.173.1591282011509;
        Thu, 04 Jun 2020 07:46:51 -0700 (PDT)
Received: from [192.168.1.4] (212-5-158-209.ip.btc-net.bg. [212.5.158.209])
        by smtp.googlemail.com with ESMTPSA id m30sm2603338eda.16.2020.06.04.07.46.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jun 2020 07:46:50 -0700 (PDT)
Subject: Re: [RFC] docs: dev-decoder: Add two more reasons for dynamic change
To:     Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Alexandre Courbot <acourbot@chromium.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20200430113809.14872-1-stanimir.varbanov@linaro.org>
 <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b93f155d-0af7-4952-079f-16cc895b35ba@linaro.org>
Date:   Thu, 4 Jun 2020 17:46:49 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <3052f24c-18ee-1c7d-111b-ffe15ca71fcb@xs4all.nl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

On 5/26/20 1:26 PM, Hans Verkuil wrote:
> On 30/04/2020 13:38, Stanimir Varbanov wrote:
>> Here we add two more reasons for dynamic-resolution-change state
>> (I think the name is misleading espesially "resolution" word, maybe
> 
> espesially -> especially
> 
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
> 
> For this I want to have a new source change flag:

OK, I can drop colorimetry and prepare a patch for src_change. Is the
bit-depth one fine?

> 
> V4L2_EVENT_SRC_CH_COLORIMETRY
> 
> Changing colorimetry without changing resolution/bit depth does not
> require buffers to be re-allocated, it just changes how the pixel
> data is interpreted w.r.t. color. And that is important to know.
> 
> Regards,
> 
> 	Hans
> 
>>  
>>  Whenever that happens, the decoder must proceed as follows:
>>  
>>
> 

-- 
regards,
Stan
