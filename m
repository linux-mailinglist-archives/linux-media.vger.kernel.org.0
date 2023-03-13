Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D6CD6B7908
	for <lists+linux-media@lfdr.de>; Mon, 13 Mar 2023 14:32:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229899AbjCMNc3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 13 Mar 2023 09:32:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230022AbjCMNc1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 13 Mar 2023 09:32:27 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A17D5BDA4
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 06:32:22 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id ek18so17631270edb.6
        for <linux-media@vger.kernel.org>; Mon, 13 Mar 2023 06:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=qtec.com; s=google; t=1678714341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=umPELtClEV6D6D7N1KQZ+PxTT8wLp6BbPXsZWEbc2lE=;
        b=GNAUSQ37GuL4VCltxfaobqQR9YWBOBTlU7966O8QGxJ6Et0EtVRUA1FEM9M3bWpi//
         UazeGfMRhV8kBwfk+2JGvJ0gxN5bqvRdwUhr+HHtP67YtDVNFOWVlZasZLROA326e00s
         B+RBCqcUo2mSfUypn4PBLSuhjcegfXwDtsMen/ud7xHkfNx7WYGUxH530QtX5Ch7Wwrc
         Lc0dZvseC04qZkUhiyelLLD9gXs4DMFk00TZ53YUvU8xxH3eqYsKOFKurl4vPU+mTnOl
         4UpNNlowpStthhUWbPR2y8frjJyilpvGqDEacGqPfN3csEPsYm7tvXv7O85bwoNwaHw/
         kG/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678714341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=umPELtClEV6D6D7N1KQZ+PxTT8wLp6BbPXsZWEbc2lE=;
        b=bwtCJlzu2mSgUm43f1aJ4YuI+VN89V/gIQx9jjBTmk4Q6hX8bI6n/FvwsaiqYx2v8y
         U73NpsfZYSKCQiekHbIr3eLOSJwVpp9izJVyPNze4uM8kPCbnzFdYkRG7HQFN0po5c7W
         sg5wouKCAf1SGbktCufHuyj8xYlK5zYeLWqgIElp34k6z6TTL1QeKw7dY7BdAfU0pnoB
         mhZSfLOj1hW9w7k+BljRd1e52Ymol9/ZZu6oTyPLso7duOIcgxV9g0Yfav7EAXMLfUy8
         CF8cwIC9ghiTFaLIl/9KvE4kmI65F6zIri7dAyQtKdyEuLzl3RH0atr3V/7Kz9t9m/Aq
         TlSQ==
X-Gm-Message-State: AO0yUKUr4CTAm7BM8VI3e6dWBRT0HtXbMB2zvp7WcCxXVrGA6Qkrx3ih
        JhwE6tXj5G5dP6oh5qsjVbZ7Q+DSlFc623gmFA8QJg==
X-Google-Smtp-Source: AK7set9EPvHV+q0chVt7tuqUi+xMQAPl5kUK3vJTq4A0RzPcVxH0YK8tHP5RogY8+zuonXGroYNY0Q==
X-Received: by 2002:aa7:cb5a:0:b0:4fa:c04f:66c9 with SMTP id w26-20020aa7cb5a000000b004fac04f66c9mr6288596edt.2.1678714341022;
        Mon, 13 Mar 2023 06:32:21 -0700 (PDT)
Received: from [192.168.2.76] (cpe.ge-3-0-8-100.ryvnqe10.dk.customer.tdc.net. [80.197.57.18])
        by smtp.gmail.com with ESMTPSA id x3-20020a1709064a8300b0091f58083a15sm3385126eju.175.2023.03.13.06.32.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Mar 2023 06:32:20 -0700 (PDT)
Message-ID: <22e992f7-1c63-5ae2-0420-283b6fa0ce8a@qtec.com>
Date:   Mon, 13 Mar 2023 14:32:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] media: docs: vidioc-g-ext-ctrls.rst: Document p_s32 and
 p_s64 fields
To:     Hans Verkuil <hverkuil@xs4all.nl>, mchehab@kernel.org
Cc:     linux-media@vger.kernel.org
References: <20230307133617.116683-1-dlp@qtec.com>
 <3828a777-a538-8189-3aff-b9da6419a43c@xs4all.nl>
Content-Language: en-US
From:   Daniel Lundberg Pedersen <dlp@qtec.com>
In-Reply-To: <3828a777-a538-8189-3aff-b9da6419a43c@xs4all.nl>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



On 13/03/2023 13:44, Hans Verkuil wrote:
> Hi Daniel,
> 
> On 07/03/2023 14:36, Daniel Lundberg Pedersen wrote:
>> p_s32 and p_s64 were added to the v4l2_ext_control struct, so these
>> should have documentation as well.
> 
> This patch is missing your Signed-off-by line!
> 
> Either repost or reply to this with your Signed-off-by.

Sorry about that. Hope this is good enough.

Signed-off-by: Daniel Lundberg Pedersen <dlp@qtec.com>

Regards Daniel

> 
> It's a nice change, I'd like to merge this!
> 
> Regards,
> 
> 	Hans
> 
>> ---
>>  .../userspace-api/media/v4l/vidioc-g-ext-ctrls.rst     | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> index 892cfeb8b988..5292d5e1a91f 100644
>> --- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> +++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
>> @@ -185,6 +185,16 @@ still cause this situation.
>>        - ``p_u32``
>>        - A pointer to a matrix control of unsigned 32-bit values. Valid if
>>  	this control is of type ``V4L2_CTRL_TYPE_U32``.
>> +    * - __u32 *
>> +      - ``p_s32``
>> +      - A pointer to a matrix control of signed 32-bit values. Valid if
>> +        this control is of type ``V4L2_CTRL_TYPE_INTEGER`` and
>> +        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
>> +    * - __u32 *
>> +      - ``p_s64``
>> +      - A pointer to a matrix control of signed 64-bit values. Valid if
>> +        this control is of type ``V4L2_CTRL_TYPE_INTEGER64`` and
>> +        ``V4L2_CTRL_FLAG_HAS_PAYLOAD`` is set.
>>      * - struct :c:type:`v4l2_area` *
>>        - ``p_area``
>>        - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
> 
