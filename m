Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A936B27F771
	for <lists+linux-media@lfdr.de>; Thu,  1 Oct 2020 03:32:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbgJABcq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Sep 2020 21:32:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbgJABcq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Sep 2020 21:32:46 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B04E3C0613D1
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:32:45 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id s13so1266575wmh.4
        for <linux-media@vger.kernel.org>; Wed, 30 Sep 2020 18:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=taNiUPgBuzMtfz2VM9oZBpI+WyEOvFg81s4+iAbTStM=;
        b=CwCHnsvdzIMqvRK5CFoVqMi2xm6rngci01pOEOfHnTg9zi+FMu48ewMHQ4f9GUvs1G
         Sa3KEzZo3Nier4Ns/sniD3VMZEjuSWh4jlGj7O0mLUtfnTSInogDw7Y3qhsdrOHkL2Wi
         p1WYVCOreYiBMPWWUlbQHiq2CjBFZ87CF1U4nlecGHxRUfEK8woSkswBtdiqrZloKg6r
         5Qhpftb+yNjI9dmiumHFq+/8cHRU043gMY2lfMaN+ql2TS9zd3ZanMYHBwFLf8BSLT6B
         Ww7Cu7buIFAfmFv6A+YutaPsmBuBIAwzeAIgri7QfsVgjMCKcaOhQXXy6Zl+oJTP1tH4
         Ts7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=taNiUPgBuzMtfz2VM9oZBpI+WyEOvFg81s4+iAbTStM=;
        b=XQ495xvaTzqSWQ9kMcLGqAaj5MnYE5JDl0PN4yS5RBnMB4yJULHtneFxgmR2iEAHNn
         z4WOI/1rVKcNFxr9JzavE1BXc/sVwIJuLZ6w3lMx2nG2Ai4LYsQ+s5PLqXxpVDbDCNjk
         An3sOFILNH//mQ7nw9UBHzrufYRcn1dWMLrrx21/8G5+8TNm4BZuk6KrKqPNUvQfGhI0
         9TxaWeW2YkMxlJgNXjQT2Rwh3Ljp7DjVXDF+S8JoUwy0uohQcVf+Ah8XsD1Q84wid4EH
         tjHGIskGLQS1BcZdlxE4cWOz1h9s4kFd9lh5nrYl1VHjc9v4Jdj9ghAuXClfjVFeGIHN
         S8Dg==
X-Gm-Message-State: AOAM531c0ttzmZxsT1MRQ3cRSeZgug3I688NHPflIIy4gOhho9DCEGXs
        YGEffDft/utyCORyfyjMyxqRgA==
X-Google-Smtp-Source: ABdhPJwriYyFKzwZP52UTFmcet3nKi89GTuVOFxGrQE5RbDCMNt7v0uDBdMs+Y8opRk47bniQ9+I6w==
X-Received: by 2002:a1c:4604:: with SMTP id t4mr5608525wma.156.1601515964155;
        Wed, 30 Sep 2020 18:32:44 -0700 (PDT)
Received: from [192.168.1.7] ([195.24.90.54])
        by smtp.googlemail.com with ESMTPSA id h1sm5998328wrx.33.2020.09.30.18.32.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2020 18:32:43 -0700 (PDT)
Subject: Re: [PATCH 2/2] venus: venc: fix handlig of S_SELECTION and
 G_SELECTION
To:     Tomasz Figa <tfiga@chromium.org>,
        Dikshita Agarwal <dikshita@codeaurora.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Vikash Garodia <vgarodia@codeaurora.org>
References: <1600968674-11559-1-git-send-email-dikshita@codeaurora.org>
 <1600968674-11559-3-git-send-email-dikshita@codeaurora.org>
 <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <b977eb27-9646-1c73-5acb-c3a74460e426@linaro.org>
Date:   Thu, 1 Oct 2020 04:32:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAAFQd5CTyjagd7grrCkret2WnvoLHQk83fg+1QPK+V1NbhKTvw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tomasz,

On 9/25/20 11:55 PM, Tomasz Figa wrote:
> Hi Dikshita, Stanimir,
> 
> On Thu, Sep 24, 2020 at 7:31 PM Dikshita Agarwal
> <dikshita@codeaurora.org> wrote:
>>
>> From: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>
>> - return correct width and height for G_SELECTION
>> - if requested rectangle wxh doesn't match with capture port wxh
>>   adjust the rectangle to supported wxh.
>>
>> Signed-off-by: Dikshita Agarwal <dikshita@codeaurora.org>
>> ---
>>  drivers/media/platform/qcom/venus/venc.c | 20 ++++++++++++--------
>>  1 file changed, 12 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>> index 7d2aaa8..a2cc12d 100644
>> --- a/drivers/media/platform/qcom/venus/venc.c
>> +++ b/drivers/media/platform/qcom/venus/venc.c
>> @@ -463,13 +463,13 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>>         switch (s->target) {
>>         case V4L2_SEL_TGT_CROP_DEFAULT:
>>         case V4L2_SEL_TGT_CROP_BOUNDS:
>> -               s->r.width = inst->width;
>> -               s->r.height = inst->height;
>> -               break;
>> -       case V4L2_SEL_TGT_CROP:
>>                 s->r.width = inst->out_width;
>>                 s->r.height = inst->out_height;
>>                 break;
>> +       case V4L2_SEL_TGT_CROP:
>> +               s->r.width = inst->width;
>> +               s->r.height = inst->height;
>> +               break;
>>         default:
>>                 return -EINVAL;
>>         }inter
>> @@ -490,10 +490,14 @@ static int venc_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
>>
>>         switch (s->target) {
>>         case V4L2_SEL_TGT_CROP:
>> -               if (s->r.width != inst->out_width ||
>> -                   s->r.height != inst->out_height ||
>> -                   s->r.top != 0 || s->r.left != 0)
>> -                       return -EINVAL;
>> +               if (s->r.width != inst->width ||
>> +                   s->r.height != inst->height ||
>> +                   s->r.top != 0 || s->r.left != 0) {
>> +                       s->r.top = 0;
>> +                       s->r.left = 0;
>> +                       s->r.width = inst->width;
>> +                       s->r.height = inst->height;
> 
> What's the point of exposing the selection API if no selection can
> actually be done?

If someone can guarantee that dropping of s_selection will not break
userspace applications I'm fine with removing it.

I implemented g/s_selection with the idea to add crop functionality
later because with current firmware interface it needs more work.

-- 
regards,
Stan
