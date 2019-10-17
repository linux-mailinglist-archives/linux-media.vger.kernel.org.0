Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7DB9BDB16D
	for <lists+linux-media@lfdr.de>; Thu, 17 Oct 2019 17:47:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387823AbfJQPrT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 17 Oct 2019 11:47:19 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:45330 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729750AbfJQPrT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 17 Oct 2019 11:47:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id r5so2903636wrm.12
        for <linux-media@vger.kernel.org>; Thu, 17 Oct 2019 08:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3GRtuO3oVh4aU6o2afMFBsZVP5fzeIY8pAqk7hldhDI=;
        b=yssNdFFn8R7FTS39ffV4YMhGIBCb0jBXQ35jJX83CEebwrbRAIAtGxHCx5uBqe1II0
         2k6DA0p1Gd1baWgOxk8XC5PfANBekTceFbCr9OpUxHeJVfZSzNHY4DrqfihA9AbF6RV/
         AAhRuqZ6X5LdtUqIY/TCeCVBKC4rb7P1G3FFpBa9WaeY0fUCN/9VnaS9DHVsFrL7UfdV
         oCwvNP69l4xZ8uicUlRxuH2KncztU8fvqoOCiPo18EhJn8XJI8Bq/16PP4GvOOJfs2Yz
         FCf/V2QN71lSaFqwEYTDCGSl5aDMEhKqixOkZrg+ttChaJc5/KHltnRoH91cQdbuaEhm
         qOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3GRtuO3oVh4aU6o2afMFBsZVP5fzeIY8pAqk7hldhDI=;
        b=L01Xqd9zS/sJy+N1dZug0TDT1VPJKAtscElVpgrNROw0B2076vCVeW13lEV2aTAs50
         iIzGXS6WzS8AN4IJlAOS9OFWCjt9Q+ChMFjEA560vgpz2Lp7S2JIWyVW/Elu8iLn7adT
         AnPNpD7pzLUJXjd/kFituacKUh/PpakCDeFYJY1QtWI/h0l0pDt2EwSUx86E+85kEDJz
         VMlYkSrGQM3HgmD2r/WU+0FCIQ+vxowJc2FlIEmGOSr1pgkFaiOQu3lIiSI6vhOITJZR
         zFYvAoJYV5Zksvq+RPIwyUayT60578ptW799SbuD0RuAhMJ+a+TwphNJW/Wofc2dcrGY
         ts+g==
X-Gm-Message-State: APjAAAXm76l7yRHXqgVqs5OTJoSIOhOnTzEfp+1mmB0rHfshb8Mwv/r8
        IYm/W1gVZ7RGfKNO89zw0yx4GOYhZjE=
X-Google-Smtp-Source: APXvYqzFxnBtthPDQ49l5Js2Bvr5fCSljE6ftXmjn7Q7vvrmgYjzmckrqyKkmL0Q4i3nSBAA0hxMxA==
X-Received: by 2002:a5d:6787:: with SMTP id v7mr3806240wru.392.1571327237617;
        Thu, 17 Oct 2019 08:47:17 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id z9sm2727966wrv.1.2019.10.17.08.47.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Oct 2019 08:47:16 -0700 (PDT)
Subject: Re: [PATCH v4] venus: venc: Fix enum frameintervals
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     linux-media@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
References: <20191003101038.13732-1-stanimir.varbanov@linaro.org>
 <50eb3902-fe10-5952-8bdf-9b6b9ac37c62@linaro.org>
 <CAMZdPi8D8WQJJ5U15_4A4HgXjJNUR2BOGZJUc85wgX+=QsTZ0w@mail.gmail.com>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <92e1234e-174a-3fa5-f77c-ae0072bd22c2@linaro.org>
Date:   Thu, 17 Oct 2019 18:47:15 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAMZdPi8D8WQJJ5U15_4A4HgXjJNUR2BOGZJUc85wgX+=QsTZ0w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Loic,

On 10/17/19 6:08 PM, Loic Poulain wrote:
> Hi Stanimir,
> 
> On Thu, 3 Oct 2019 at 12:15, Stanimir Varbanov
> <stanimir.varbanov@linaro.org> wrote:
>>
>> I have tested this on db410c with following gst pipeline:
>>
>> gst-launch-1.0 -v videotestsrc !
>> video/x-raw,format=NV12,width=1280,height=960,framerate=24/1 !
>> v4l2h264enc
>> extra-controls="controls,h264_profile=4,h264_level="5",video_bitrate=10000000;"
>> ! filesink location=gstenc.h264
>>
>> Loic, could you give it a try on db820c too?
>>
>> Here is the info on the bug which I try to fix with current patch:
>>
>> https://bugs.96boards.org/show_bug.cgi?id=513
>>
>> On 10/3/19 1:10 PM, Stanimir Varbanov wrote:
>>> This fixes an issue when setting the encoder framerate because of
>>> missing precision. Now the frameinterval type is changed to
>>> TYPE_CONTINUOUS and step = 1. Also the math is changed when
>>> framerate property is called - the firmware side expects the
>>> framerate in Q16 values.
>>>
>>> Signed-off-by: Stanimir Varbanov <stanimir.varbanov@linaro.org>
>>> ---
>>>
>>> Changes since v3:
>>> Keep min/max numerator one, and divide frate(max/min) to frame
>>> factor (returned framerate max/min capabilities are in range
>>> 1 to 120fps but in Q16 i.e. 65536 to 7864320).
>>>
>>>  drivers/media/platform/qcom/venus/venc.c | 17 ++++++++++++-----
>>>  1 file changed, 12 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
>>> index 1b7fb2d5887c..133ff7eceb83 100644
>>> --- a/drivers/media/platform/qcom/venus/venc.c
>>> +++ b/drivers/media/platform/qcom/venus/venc.c
>>> @@ -22,6 +22,7 @@
>>>  #include "venc.h"
>>>
>>>  #define NUM_B_FRAMES_MAX     4
>>> +#define FRAMERATE_FACTOR     BIT(16)
>>>
>>>  /*
>>>   * Three resons to keep MPLANE formats (despite that the number of planes
>>> @@ -576,7 +577,7 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>>>       struct venus_inst *inst = to_inst(file);
>>>       const struct venus_format *fmt;
>>>
>>> -     fival->type = V4L2_FRMIVAL_TYPE_STEPWISE;
>>> +     fival->type = V4L2_FRMIVAL_TYPE_CONTINUOUS;
>>>
>>>       fmt = find_format(inst, fival->pixel_format,
>>>                         V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE);
>>> @@ -600,11 +601,11 @@ static int venc_enum_frameintervals(struct file *file, void *fh,
>>>               return -EINVAL;
>>>
>>>       fival->stepwise.min.numerator = 1;
>>> -     fival->stepwise.min.denominator = frate_max(inst);
>>> +     fival->stepwise.min.denominator = frate_max(inst) / FRAMERATE_FACTOR;
> 
> On 820c frate_max() returns 120 set denominator to 0, and causes
> gstreamer failure.

OK, thanks!

We have two options
- unify frate_min/max() to return in Q16 depending on the hfi version
- or move frame_factor in frate_min/max() and return the framerate (1..120)


-- 
regards,
Stan
