Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CA212513E
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2019 15:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728240AbfEUN4j (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 21 May 2019 09:56:39 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37681 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbfEUN4j (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 21 May 2019 09:56:39 -0400
Received: by mail-lf1-f65.google.com with SMTP id q17so13194081lfo.4
        for <linux-media@vger.kernel.org>; Tue, 21 May 2019 06:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9fFvqM8Le1AEj+AtSzoOuvZFhuhL6mbqr0D7N3QEUIk=;
        b=nvlSVRJkkyeOT6kpJdUfSvPkr1E+Df8oebWnj7kYz57Wi43hMuSVAp5856Y//gGaTU
         CXAG8QXXptF8rvmHdnK94/AiYjteluEwyrIuFRT0dnOvDyE+a2+kBcHuEjRgKXl3DwgS
         AByHv3sNadzVIkIvg8fd5OW2sPF3TFbhdQr2kLcju/Im0Vd/EvMNO1k5BMHD/NhI/ga0
         50ftuGhBZx3+ie5zDfOeRxy+mCicapz54dl/J5mgi3XC2IEWas36GCusj+/8IQoe8ThR
         pGM8/m/pah2mG8s+SUfY5tpwTfjt+6mEdeJsTY4wP//qbjnuvv1FBSmxW4UJBZX5yc8p
         RbLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9fFvqM8Le1AEj+AtSzoOuvZFhuhL6mbqr0D7N3QEUIk=;
        b=iOxGUsoT+3ggzHIdttnUzYNFl/DdUvjdWBVKmh1niLpb3cdW15Yjx+IK8z1WK7RdCf
         lLp/E9HljPA+Tptz3ADnr2PNRCPI7dHz2n2imXwqrx4EXAE25pSgIVWzyAcsWOmhvybK
         X1rmWmD+m90bVjUlKR+e50bEuZLn3/Qe69ilef0ELkUn1sfaY8/B0hlP8RsrOjPXJFY7
         nlymOupgvx683rLZ1vCCh/N4ihzq7tUqFNSF5E1Uqzz1EyhP+0lPj4y2HDKN3qClO3rc
         j6NNoKHuCXPNKZG87sWzUNXxA2eIdQWsbm762Zb6orAf40cONrMQpT3h8xXX+Gg3aj/P
         OzPw==
X-Gm-Message-State: APjAAAXpfUj2mh6L+47Fg2eUj+jrgikY5Fh7mFwI0EAvY1PoR6+3IAf7
        5PenIV9wNBJcO8XWAc6Q5Lov+jv9Y7Y=
X-Google-Smtp-Source: APXvYqy+bFdCfJr1OFx6UT7FUOLaqeyxrocfhqTPsgUijklEJpJUMI09ql9kl7Jz4YDggSkQ6DLCtg==
X-Received: by 2002:ac2:42c8:: with SMTP id n8mr41617518lfl.28.1558446996410;
        Tue, 21 May 2019 06:56:36 -0700 (PDT)
Received: from [192.168.27.209] ([37.157.136.206])
        by smtp.googlemail.com with ESMTPSA id j5sm1974859ljc.67.2019.05.21.06.56.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 06:56:35 -0700 (PDT)
Subject: Re: [GIT PULL for v5.2] Venus updates - take3
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Cc:     linux-media@vger.kernel.org
References: <20190425214134.31905-1-stanimir.varbanov@linaro.org>
 <20190521100359.172e02f5@coco.lan>
From:   Stanimir Varbanov <stanimir.varbanov@linaro.org>
Message-ID: <8ec6fa6b-32cc-771a-cf63-b499ed31ed3d@linaro.org>
Date:   Tue, 21 May 2019 16:56:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190521100359.172e02f5@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mauro,

On 5/21/19 4:03 PM, Mauro Carvalho Chehab wrote:
> Em Fri, 26 Apr 2019 00:41:34 +0300
> Stanimir Varbanov <stanimir.varbanov@linaro.org> escreveu:
> 
>> Hi Mauro,
>>
>> Sorry for the inconvenience, here is the third attempt.
> 
> This time, GPG signature is OK, and also the patches are there...

Finally, sigh :)

> 
>>
>> Added two more fixes for Venus v4 properties and dynamic buffer mode.
>>
>> Please pull.
>>
>> The following changes since commit 7afa8db323e37b9174cf78a1c9ab0ae7a9f5e7dd:
>>
>>   media: vsp1: Add support for missing 16-bit RGB555 formats (2019-04-25 11:07:05 -0400)
>>
>> are available in the Git repository at:
>>
>>   git://linuxtv.org/svarbanov/media_tree.git tags/venus-for-5.2-take3
>>
>> for you to fetch changes up to cac29335c397d116ec405a9b67466663de1606dd:
>>
>>   venus: helpers: fix dynamic buffer mode for v4 (2019-04-26 00:08:22 +0300)
>>
>> ----------------------------------------------------------------
>> for v5.2
>>
>> ----------------------------------------------------------------
>> Alexandre Courbot (1):
>>       media: venus: core: fix max load for msm8996 and sdm845
> 
> ... however, you forgot to add your SOB to the patches you merged here...
> 
>>
>> Kelvin Lawson (1):
>>       media: venus: Add support for H265 controls
> 
> ... and here.
> 
> 
> I'll apply them anyway, but please next time please remind to use "-s"
> when importing patches from other devels.

Note taken, thanks!

> 
>>
>> Stanimir Varbanov (2):
>>       venus: hfi_cmds: add more not-implemented properties
>>       venus: helpers: fix dynamic buffer mode for v4
>>
>>  drivers/media/platform/qcom/venus/core.c       |  4 ++--
>>  drivers/media/platform/qcom/venus/helpers.c    |  7 +++++++
>>  drivers/media/platform/qcom/venus/hfi_cmds.c   |  2 ++
>>  drivers/media/platform/qcom/venus/venc_ctrls.c | 21 ++++++++++++++++++++-
>>  4 files changed, 31 insertions(+), 3 deletions(-)
> 
> 
> 
> Thanks,
> Mauro
> 

-- 
regards,
Stan
