Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78312EEA00
	for <lists+linux-media@lfdr.de>; Fri,  8 Jan 2021 00:54:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728483AbhAGXwH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 7 Jan 2021 18:52:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727300AbhAGXwH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 7 Jan 2021 18:52:07 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E36FEC0612F4
        for <linux-media@vger.kernel.org>; Thu,  7 Jan 2021 15:51:26 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id q18so7299516wrn.1
        for <linux-media@vger.kernel.org>; Thu, 07 Jan 2021 15:51:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=/IwJYJvhzroIM+Pfr3pG5YqkSGOVXO3wvRLtqgKVXZg=;
        b=tJboVP0WNxfoUalA7fDt9Tg+qeaLCCRYNn6j+D1KMY6duswN+MdczQgQIeiOqWF1D9
         wJkHaEYOVQMJJS53eh3j1GMvI805KGwa1UQmriNLOnu/6hGz5TRMM9iMkQTKsuS8XA5G
         8l1NlKDAfLaLT37qtBZSnC3ICB6v2PBj+YKbPw/LRQt+jkDyP6XR6cXV5lpbd7kQnFvb
         y/EgdRQrGKudh29ybVVVuQC6Ie59gqRUsheRL45vpIZsUTxLFXJUJz1JAnuTSWOW2kfv
         NbeAz/mtIywgWCZc44uOpFKJ0zMmjanN/+AAjwrWlAAUJ3riNzOWJopnm3pyLC+xAIuc
         071w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=/IwJYJvhzroIM+Pfr3pG5YqkSGOVXO3wvRLtqgKVXZg=;
        b=LltaWu+TwygyFA47CJtuk+CVgxOCHppx6kyV7xZK/vH4NWoC8TnyMLLe+0HGZYBSCA
         yKKHsLDC9GSwV3FBfRvrrZalrfFEH7e6uM+OkXBUN3mCS6ebFqIyJBGzMvC9rk5qLXwo
         fq463mv4qGRK8lBvXs/luWSYr2ZluqwQxEgo7HivMlc0RdyEnAya0+WJRwcKj51pfS9r
         NbvMw7Fw1mqrIccJr7o+t7MtJ8ElBT8ESpfGE6o+4tXsIIYEYJFT2LOYiUlUG8ZOXT3D
         kSNe36mUjTY7sHqaZgDPl5FrYLrj1d9jFdNodbnoqGZTYFrMeSbQLNpB3Bxok96yDgFo
         Dp+g==
X-Gm-Message-State: AOAM530G2b7KofO9ntBY7LtS6bGAK9L4B2McyRMO3kSSnybY5FDf66H7
        rQTkBgTtuqTnbLgiTcDI9Sk=
X-Google-Smtp-Source: ABdhPJyIabBZh83FudFae/9hj7jsj9+oTGQjZURsJIk/SHdFTX98iAZp9BJk1RdWn9Wxf9XNAwmBnw==
X-Received: by 2002:adf:eecc:: with SMTP id a12mr893864wrp.312.1610063485632;
        Thu, 07 Jan 2021 15:51:25 -0800 (PST)
Received: from [172.30.88.175] (sjewanfw1-nat.mentorg.com. [139.181.7.34])
        by smtp.gmail.com with ESMTPSA id r13sm10896536wrs.6.2021.01.07.15.51.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 15:51:24 -0800 (PST)
Subject: Re: IMX frame interval monitor (FIM) available on
 ipu{1,2}_ic_prp{enc,vf} capture nodes?
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
References: <CAJ+vNU1Du8JpEMqGC+BMyD3D+wVAUP42PXqa=_unrD7L4YfDAA@mail.gmail.com>
 <30a04077-869b-9b58-a69f-15b19a3f6bd4@gmail.com>
 <CAJ+vNU2nwb2BiUVx4UZHG0AP27NtbTij_Skcm0kW=_9YTAxuQw@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <8fda4ddf-674a-07af-5e22-b993735cf3b8@gmail.com>
Date:   Thu, 7 Jan 2021 15:51:21 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU2nwb2BiUVx4UZHG0AP27NtbTij_Skcm0kW=_9YTAxuQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

On 1/5/21 3:57 PM, Tim Harvey wrote:
> On Sat, Jan 2, 2021 at 9:55 AM Steve Longerbeam <slongerbeam@gmail.com> wrote:
>> Hi Tim,
>>
>> I gave this a shot a while ago, but I recall struggling with some
>> locking problems. I haven't been able to return to it. I've updated the
>> imx/add-fim-to-prpencvf branch to latest media-tree master branch
>> (5.11.0-rc1), in my github fork [1]. The patches against master are:
>>
>> 0001-media-imx.rst-update-doc-to-reflect-FIM-changes.patch
>> 0002-media-imx-prpencvf-attach-FIM.patch
>> 0003-WIP.patch
>>
>> The last patch was my first attempts to debug the locking problems.
>>
>> I don't have access to imx6 hardware any longer, so I can't progress any
>> further on it at this point.
>>
>> Steve
>>
>> [1] git@github.com:slongerbeam/mediatree.git
> Steve,
>
> Thanks for the patches!
>
> I have found via experimentation that if you are using the VDIC to
> de-interlace and you loose/regain the signal to the adv7180 it will
> roll endlesslessly. However if you are doing raw capture the video
> will sync up within a few seconds (240 lines * 16.6ms-per-frame =
> 3.8secs max I suspect). Thus the simplest solution for users who
> suffer from this may just be to capture raw and upscale.

Yes, but for our users, a 3.8 second delay is unacceptable, for example 
in a rear-view-camera application, it's not acceptable to see rolling 
video for that long. Hence the FIM which will restore sync very quickly 
on loss/regain of the analog signal to the adv718x.

Steve

> Best regards,
>
> Tim

