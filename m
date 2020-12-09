Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7891C2D4D3D
	for <lists+linux-media@lfdr.de>; Wed,  9 Dec 2020 23:05:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388361AbgLIWFh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Dec 2020 17:05:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388472AbgLIWFc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Dec 2020 17:05:32 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7A7DC061794
        for <linux-media@vger.kernel.org>; Wed,  9 Dec 2020 14:04:51 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id j10so4311302lja.5
        for <linux-media@vger.kernel.org>; Wed, 09 Dec 2020 14:04:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=jCsfhHIJoUn5Z/oCr7ROOlaEKUZ9pTwd6ZEGEqsbXCc=;
        b=RLbQQ35Yught/nRsF8JNjzIPzLNQK660COrZM/ByFBCc3/6Hgywc3KMnYtkIH5ppKU
         Ua11aDWjR//iiWrQrfZ7SrrBUNdWQYCGv0bc2J9JVZcrIYcf/1E3KnAwim5L+dYg1gp7
         ecGML0QUR7An16+AlY5FNiXOjIqtoG//Z0raPjJah7KhuDtaQid6AL5fiiTz9KOpKT7C
         vAei+fHm8H+z5DBPMNUkA7k1F5qjYzYAWlMQhfXGMA00c+t+i9o1WEGWwBe9DoAm0yN9
         zSB03/EDQ1QjHTd3q3iqfWL4MsNNMBuMiba0B2nUIXHDL+bjjQfdIgr2KWquKyE/UdvS
         LGsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jCsfhHIJoUn5Z/oCr7ROOlaEKUZ9pTwd6ZEGEqsbXCc=;
        b=N/X8+WLGDdopBR3oYLH9sDoYNQbvDgSayuqnyrJNeb/mhH994RzhQmSCzsk41A7+Rq
         F8EiMhkBvcPyRtd4LYHHEX7wn9wOy2Lst2F5WvFcrQui/rRu/sw8veQ2pNNV3zpwRz32
         FD544PMHG74cNW56SoF96+386C1b4fY43RDDDd1kwYjtmb2uYfizdUmN92+DlWZ7JjyY
         cD86OwNWP62mRYDqtkYzKATjEed/F4xq3aWqO8eSkHypTOpI2mxqUNT5U7z7jGO7hTs5
         Mz+0xHHqMQvY2i17H0HbTFn3ifS2apJDIfZ2TLnco+cJzzBsr+vzAjedz0pH0SmarVsZ
         cCaw==
X-Gm-Message-State: AOAM531s1v1fzH1MgcIc2XzUrN3NQdBErVmzYDjNtTv7YVWrUVRBs7ob
        S0GeKVsJJmYK0S5pimrHt0szaQ==
X-Google-Smtp-Source: ABdhPJz5Kb/bkE/PYXy2Hk4XSnUqE2czHgByEdfBqiFfnE7ja3qVkZHotHoB2oo5CGNiV1800vC+TQ==
X-Received: by 2002:a2e:8315:: with SMTP id a21mr1959586ljh.29.1607551490217;
        Wed, 09 Dec 2020 14:04:50 -0800 (PST)
Received: from [192.168.118.216] ([85.249.43.75])
        by smtp.gmail.com with ESMTPSA id m21sm297522lfh.234.2020.12.09.14.04.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Dec 2020 14:04:48 -0800 (PST)
Subject: Re: [PATCH 1/2] media: camss: Fix signedness bug in video_enum_fmt()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Robert Foss <robert.foss@linaro.org>,
        Todor Tomov <todor.too@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
References: <X9BzujGgPAM/s+rG@mwanda>
 <CAG3jFyt_sj91k89U2qPKZbzRO4+Miox-7dBf2CMEnjDmTAJ5Aw@mail.gmail.com>
From:   Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <b9ee71b9-8e70-f0e6-faa2-8af9c55eb781@linaro.org>
Date:   Thu, 10 Dec 2020 01:04:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAG3jFyt_sj91k89U2qPKZbzRO4+Miox-7dBf2CMEnjDmTAJ5Aw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Dan,

Good catch!

Reviewed-by: Andrey Konovalov <andrey.konovalov@linaro.org>

Thanks,
Andrey

On 09.12.2020 13:55, Robert Foss wrote:
> Hey Dan,
> 
> Thank you for submitting this.
> 
> Reviewed-by: Robert Foss <robert.foss@linaro.org>
> 
> On Wed, 9 Dec 2020 at 07:50, Dan Carpenter <dan.carpenter@oracle.com> wrote:
>>
>> This test has a problem because we want to know if "k" is -1 or a
>> positive value less than "f->index".  But the "f->index" variable is a
>> u32 so if "k == -1" then -1 gets type promoted to UINT_MAX which is
>> larger than "f->index".  I've added an explicit test to check for -1.
>>
>> Fixes: a3d412d4b9f3 ("media: Revert "media: camss: Make use of V4L2_CAP_IO_MC"")
>> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
>> ---
>> I could equally well have casted "k < (int)f->index" but I feel like
>> this is more explicit and readable.
>>
>>   drivers/media/platform/qcom/camss/camss-video.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/media/platform/qcom/camss/camss-video.c b/drivers/media/platform/qcom/camss/camss-video.c
>> index bd9334af1c73..2fa3214775d5 100644
>> --- a/drivers/media/platform/qcom/camss/camss-video.c
>> +++ b/drivers/media/platform/qcom/camss/camss-video.c
>> @@ -579,7 +579,7 @@ static int video_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
>>                          break;
>>          }
>>
>> -       if (k < f->index)
>> +       if (k == -1 || k < f->index)
>>                  /*
>>                   * All the unique pixel formats matching the arguments
>>                   * have been enumerated (k >= 0 and f->index > 0), or
>> --
>> 2.29.2
>>
