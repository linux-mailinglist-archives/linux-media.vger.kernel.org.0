Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E6B93B815C
	for <lists+linux-media@lfdr.de>; Wed, 30 Jun 2021 13:36:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234269AbhF3LjL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 30 Jun 2021 07:39:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234239AbhF3LjK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 30 Jun 2021 07:39:10 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E85DC061756
        for <linux-media@vger.kernel.org>; Wed, 30 Jun 2021 04:36:41 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id l1so1804201wme.4
        for <linux-media@vger.kernel.org>; Wed, 30 Jun 2021 04:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=MXecV5KgHUZOtXYduyuVRg6vezdaVA2kncELaPA0ClU=;
        b=csBWsCYAAMfO8ZOZIfnPzWrasFWPi36ihb/fHs+XFu3o02jc7x7v6R642T22DkQqks
         s5QMsXk6k2WKGT5nstmfBF/k9EtwSmsWBY1cEgkD45QFOPu18v0PjMu7MoQTWPSXi07e
         ebTDmjmHxFdf/2/+7ZfB13xZTnJ1lAby96YuASF8STKG/VBr7SX8bCGit7CmzmjGSYGC
         MnR+JOw6IjLYnj6sUNz+7GZdYyR3wzqvht/k+ksnawwgh29BuXrGxoCpejNb2/mrmOyN
         cmCVYg32GDBYt++2pYdQt2Vz/U8w+0WDWhUayxusiXPaUBega1VzDGUVDlnwVILGpDnj
         KsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=MXecV5KgHUZOtXYduyuVRg6vezdaVA2kncELaPA0ClU=;
        b=Fsfu2mmZZcRRgmqUXOyPga4fwG7gDYIL28Vj6V4ZoZEhyTsg3eYqjhUvQ4C/lri86t
         nkVpWEsD6B3xTFb9I9laOPiGxqoJj55OvxTujuoSK8XJHFVvn1aEMEt4gY7Yf6mjCSsk
         RzPvbmsiJ4VUjUq/79cIWoU3k16KNIju6ugWuDogbUrSDbfosFTwmj9ibrY+mjl8VHfD
         jxndOGK4stZGD1SGrea9TbbzuCIoicSV/CiAGWnUIKbrQLeq4Z3MSWwpWtWXwCFB4LI/
         uLLXXvvmF9tiiQMyIlKPEjZv6r7kP+PP4J69raB+jxhCUYRwSBVlNjlUw8OEWYQmSqO6
         kApw==
X-Gm-Message-State: AOAM532+cLEXZj/KQjVhJcwLSXig3l5odhQNgw8n90pOmwGWiXvlyLIt
        ZWxgRyot9G0n3ZEZnjG0iA==
X-Google-Smtp-Source: ABdhPJz/R5ACDuO6drvLjQ151//BZVVh4TC5P+nT1zFpPlCWfcFWv77fZN4DXyqiq1yk4C58TVNyRg==
X-Received: by 2002:a7b:c3d7:: with SMTP id t23mr4149876wmj.2.1625052999298;
        Wed, 30 Jun 2021 04:36:39 -0700 (PDT)
Received: from [192.168.200.247] (ip5b434b8b.dynamic.kabel-deutschland.de. [91.67.75.139])
        by smtp.gmail.com with ESMTPSA id c1sm731943wrp.94.2021.06.30.04.36.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Jun 2021 04:36:38 -0700 (PDT)
Subject: Re: [PATCH 09/12] media: hantro: Enable H.264 on Rockchip VDPU2
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Jernej Skrabec <jernej.skrabec@gmail.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Heiko Stuebner <heiko@sntech.de>, maccraft123mc@gmail.com,
        Chris Healy <cphealy@gmail.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>, kernel@collabora.com
References: <20210624182612.177969-1-ezequiel@collabora.com>
 <20210624182612.177969-10-ezequiel@collabora.com>
 <2ae869f3-7f3a-f184-93cc-61fca0f9022f@gmail.com>
 <c882d9c4f9eacd9d0f82e6e4ce3b33c383087d8c.camel@collabora.com>
 <1979d843-129a-8b48-2926-0f50157974ec@gmail.com>
 <454371a3c93cf2fccad868fee431124429837f18.camel@collabora.com>
From:   Alex Bee <knaerzche@gmail.com>
Message-ID: <53f32921-420a-2c22-779c-693dd8481313@gmail.com>
Date:   Wed, 30 Jun 2021 13:36:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <454371a3c93cf2fccad868fee431124429837f18.camel@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Ezequiel,

Am 29.06.21 um 14:28 schrieb Ezequiel Garcia:
> Hi Alex,
>
> On Sat, 2021-06-26 at 10:33 +0200, Alex Bee wrote:
>> Hi Ezequiel,
>>
>> Am 26.06.21 um 02:46 schrieb Ezequiel Garcia:
>>> (Adding Nicolas)
>>>
>>> Hi Alex,
>>>
>>> On Fri, 2021-06-25 at 01:13 +0200, Alex Bee wrote:
>>>> Hi Ezequiel,
>>>>
>>>> Am 24.06.21 um 20:26 schrieb Ezequiel Garcia:
>>>>> Given H.264 support for VDPU2 was just added, let's enable it.
>>>>> For now, this is only enabled on platform that don't have
>>>>> an RKVDEC core, such as RK3328.
>>>> Is there any reason, you do not want to enabe H.264 on RK3399? I know
>>>> H.264 can be done by by rkvdec already, but from what I understand that
>>>> shouldn't be an issue: The first decoder found that meets the
>>>> requirements will be taken.
>>>>
>>> Thanks a lot the review.
>>>
>>> I really doubt userspace stacks are readily supporting that strategy.
>>>
>>> The first decoder device supporting the codec format will be selected,
>>> I doubt features such as profile and levels are checked to decide
>>> which decoder to use.
>>>
>>> I'd rather play safe on the kernel side and avoid offering
>>> two competing devices for the same codec.
>> I wasn't aware of that. Current ffmpeg v4l2_request implementation seems
>> to not do VIDIOC_ENUM_FRAMESIZES - so we might end up being able to
>> decode up to 1920x1088 only if hantro decoder is picked/checked first.
>>
> Speaking of ffmpeg, now that MPEG-2, VP8 and H.264 control interfaces
> are stable, I think one of the next priorities would be to push Jonas'
> ffmpeg patches.
>
> It would be really cool if someone could take the lead on that front,
> as it would reduce kodi's out of tree stack, enable mpv, and so on.

That's absolutely true.

Note that Jonas himself started upstreaming those patches right after 
H264 uapi got stable [1].

Unfortunately I'm the absolut wrong person for doing/continuing this, 
since the very first time I ever looked at the implementation details 
was just for the response I wrote here. So I asked Jernej whos know all 
the details and contributed to those patches as well - he told me he'll 
continue whenever he finds time next.

Best,

Alex

[1] https://patchwork.ffmpeg.org/project/ffmpeg/list/?series=2898

