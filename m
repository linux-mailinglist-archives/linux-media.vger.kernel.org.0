Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 886C717CF6B
	for <lists+linux-media@lfdr.de>; Sat,  7 Mar 2020 18:25:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgCGRY6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 7 Mar 2020 12:24:58 -0500
Received: from mail-ed1-f65.google.com ([209.85.208.65]:33722 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726109AbgCGRY6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 7 Mar 2020 12:24:58 -0500
Received: by mail-ed1-f65.google.com with SMTP id z65so681647ede.0
        for <linux-media@vger.kernel.org>; Sat, 07 Mar 2020 09:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=35b//uthq/zLiKMDYcVOUg++BQZbA547JN8UvWQnB7Q=;
        b=RIiOxTWD3fmaldI2GIHJHikP9g5FfDnQHjn1GUkW3UY2BFI30ou/0PI1XtkzfNvtS4
         RsXBl3gx2/JesBLDNsGWNgiKz3O+0GYk05RmOAG4MhVvSmJRkCHIslfg42mlaMto0Rf3
         CK4pGDax2dGgBla1w6zGPIDALO4i8xRDbPkb+Jic0KCZJdHk1IVXG0N3XjdQV3Jf3aOF
         wkfwHY2lyT/NrPlBq3t13EJ+lXZYpGOskp8hZf7TBYT3EQcIHlLBO9YXjA2VjA/PNSZm
         EfGAnVpGumIEapurF87cOtM0dijkrR4Pl3ISHQyJnJty/r3VRoZoCBpE6G+tfBCKlpFw
         i2pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=35b//uthq/zLiKMDYcVOUg++BQZbA547JN8UvWQnB7Q=;
        b=RXgQs3RNCfHzxSQSKMSDwfpvnYXjh2+7p4Zr/wcTAxsjQfddYIkytq8E6RUuv19wRM
         wvHaoqlxZKQV5t6TjYhrz11NnJ0VUGYv2MYfrm6xX1YIuxZ/ZuKg7z5BePIIpSmPUg4L
         d1VYuVLWi88FuQxJHZxKa8nfT39ekkfPO5+JBFfMAlh7rHskPq+8CtoGPWN9Op8pP1U+
         cQzdkys+HIqF4zAV3cPUq8FFGNumfbMdVUOR9/XdO/WFvEYXsPIsnJ3Rq89H7cRhOKMf
         ok3eIE4SwgiGvt/TfYqfBgkKdISORAqUrCCpvrNdNDrFK/y5ESHMBKWztTZ/oG7NNubJ
         zHjQ==
X-Gm-Message-State: ANhLgQ30qiud0IvIrpzWzXYj5SNtBLH5+xyJrYIFUBDn24iuIq0EHaWL
        iM+ck/PbBcOcrynPJZmFhzRAwA==
X-Google-Smtp-Source: ADFU+vuTiqAv7FmS1sXxchDpf0BNGPpKPrU3SgTAbcxvwomWnpAFjwgnnU31OZ37Nkr4/JgZAYRvnw==
X-Received: by 2002:a05:6402:128a:: with SMTP id w10mr8523455edv.330.1583601895937;
        Sat, 07 Mar 2020 09:24:55 -0800 (PST)
Received: from [192.168.1.9] (hst-208-219.medicom.bg. [84.238.208.219])
        by smtp.googlemail.com with ESMTPSA id f4sm2026998edr.39.2020.03.07.09.24.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Mar 2020 09:24:55 -0800 (PST)
Subject: Re: [PATCH] media: venus: fix use after free for registeredbufs
To:     Jeffrey Kardatzke <jkardatzke@google.com>
Cc:     linux-media@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200306002321.3344-1-jkardatzke@google.com>
 <892a0548-df6d-a4db-921f-7f4cfd69dc06@linaro.org>
 <CA+ddPcPg_LrxdgxhOjrzkkBBawWoP0+6ijBx6CSy+CpQtP6vbQ@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <7edd7feb-80d2-de8b-44cd-84ee63201ab5@linaro.org>
Date:   Sat, 7 Mar 2020 19:24:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CA+ddPcPg_LrxdgxhOjrzkkBBawWoP0+6ijBx6CSy+CpQtP6vbQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jeff,

On 3/6/20 10:10 PM, Jeffrey Kardatzke wrote:
> On Fri, Mar 6, 2020 at 1:03 AM Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> Hi Jeff,
>>
>> Thanks for the patch!
>>
>> On 3/6/20 2:23 AM, Jeffrey Kardatzke wrote:
>>> In dynamic bufmode we do not manage the buffers in the registeredbufs
>>> list, so do not add them there when they are initialized. Adding them
>>> there was causing a use after free of the list_head struct in the buffer
>>> when new buffers were allocated after existing buffers were freed.
>>
>> Is this fixing a real issue? How you come to it?
>>
> In our code we were allocating 64x64 capture queue buffers initially,
> then got a resolution change event for the actual video resolution of
> 320x256 so we freed all the existing capture buffers and allocated new
> ones. I had noticed memory poisoning warnings in dmesg and tracked it
> down to the patch I created here. This is only a problem when the
> capture queue has its buffers freed and reallocated (which would
> happen during any resolution change).

Do you call STREAMOFF(CAPTURE) ?

Better, could you share v4l2 debug logs:

echo 0x3f > /sys/class/video4linux/videoX/dev_debug

> 
>>>
>>> Signed-off-by: Jeffrey Kardatzke <jkardatzke@google.com>
>>> ---
>>>  drivers/media/platform/qcom/venus/helpers.c | 4 +++-
>>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/helpers.c b/drivers/media/platform/qcom/venus/helpers.c
>>> index bcc603804041..688a3593b49b 100644
>>> --- a/drivers/media/platform/qcom/venus/helpers.c
>>> +++ b/drivers/media/platform/qcom/venus/helpers.c
>>> @@ -1054,8 +1054,10 @@ int venus_helper_vb2_buf_init(struct vb2_buffer *vb)
>>>       buf->size = vb2_plane_size(vb, 0);
>>>       buf->dma_addr = sg_dma_address(sgt->sgl);
>>>
>>> -     if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
>>> +     if (vb->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE &&
>>> +         !is_dynamic_bufmode(inst)) {
>>
>> If you add !is_dynamic_bufmode here, we will loose the reference frames
>> mechanism (see venus_helper_release_buf_ref()) which is not good.
> 
> In my testing, I never see venus_helper_release_buf_ref called.  I
> think something is wrong with reference frame management. I'm also

The mechanism is valid for Venus v1 and v3, might be you tried on v4
where we have a set of DPB buffers and use them for reference frames.

> seeing failure in my tests that very much look like reference frames
> that were dropped in the decoder (with or without my patch); but they
> are not consistent.
> 
>>
>> Thus, I wonder (depending on when you observe the use-after-free issue)
>> does this is the correct resolution of the problem.
> 
> I agree this is likely not the right solution to the problem, there's
> something deeper that's wrong I think because I never see events
> coming back from hfi with the release buffer reference event.
>>
>>>               list_add_tail(&buf->reg_list, &inst->registeredbufs);
>>> +     }
>>>
>>>       return 0;
>>>  }
>>>
>>
>> --
>> regards,
>> Stan

-- 
regards,
Stan
