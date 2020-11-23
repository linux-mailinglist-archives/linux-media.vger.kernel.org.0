Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B10E2C03D6
	for <lists+linux-media@lfdr.de>; Mon, 23 Nov 2020 12:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728524AbgKWLJj (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 23 Nov 2020 06:09:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43316 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728493AbgKWLJj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 23 Nov 2020 06:09:39 -0500
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00167C0613CF;
        Mon, 23 Nov 2020 03:09:38 -0800 (PST)
Received: by mail-lj1-x243.google.com with SMTP id y10so2055631ljc.7;
        Mon, 23 Nov 2020 03:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=HjhWcAaLBjKIfTeObnhdOKRy227KwdAp+UqnwppLEWI=;
        b=WHelm+4QW3NjS5hvpThLZGiJxH5KsGlwbrRwZby2wckI/my8pTg1phIaEVYb5x3nnf
         HEkYvOiUAJmXgZnqtSXVyRbMM4ZJ55iBpMuPvtwJSeS8GvMiFcja1PeVAHJ/btpbpSte
         38U4fZ83Jqww1DP6RKVdhfR4hA3xYVOqDDax7sdr59HG59roaCv5Mui48v/LMDWKNYin
         W/E8Zp9fi/qP1wlba8m2I3h7wVWQDhbCRdlE97WIRVZ4vU/kHOc9zsZTTAcdl7XrlxFp
         W8NKttWDUTzB6sFWOa674LGXhTBnf6RhvDfm4t4PGp6FYefLP9q26r7HW4mMtDgv5B5J
         KYCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HjhWcAaLBjKIfTeObnhdOKRy227KwdAp+UqnwppLEWI=;
        b=U2wMzVGeOYAYeTTcWKo1J36oWPHdDkILLhcNUzAilYaWWZXo65ydzSqLQWDouJJ64Q
         oRJWPCkfyyEgMl+l2X2ACgf2vio+N1RjNpS9AxqcILd1GmtwnfsI7iZoEJVZ9eTUwRHB
         PsS08SfNWiRmT5F4SPfxNWnHP4Pz7nOx1KoQlv2/jGyOh8DPXVbDn276PmJFHPNNHl9C
         YZEE/41zDsCKCYEFrXVyBfm/YHQgNwPcugom+IR2OLPlDhTj5W6Xtr4uaRVLvIe4pS5v
         Mxhh88FdU1DB7bLxO/Acr7H/H5liPtZSQkjykTyPNBItgXKf0YmX4D6Y2d3OrZj+DAVF
         VScQ==
X-Gm-Message-State: AOAM533K4uodWjeSwHxAmdmSN/7cHsb+5dBLStm+xzmQucCs2+PosQTC
        /jlRp2lKJYm8J53o8+WSlok=
X-Google-Smtp-Source: ABdhPJyOFvVIdsi0jiEe2T330ZoRH2zbRtblSjL0rkMfbu56kP8aihxZt4/W61FVuc6ZGdm5iYBUgQ==
X-Received: by 2002:a2e:924e:: with SMTP id v14mr13723829ljg.264.1606129777498;
        Mon, 23 Nov 2020 03:09:37 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id h4sm1339738lfk.224.2020.11.23.03.09.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 03:09:36 -0800 (PST)
Subject: Re: [PATCH v5 2/4] staging: media: Introduce NVIDIA Tegra video
 decoder driver
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <cover.1513038011.git.digetx@gmail.com>
 <3d565db80f8dccafd14224924305243b37b75a07.1513038011.git.digetx@gmail.com>
 <CAAEAJfBZD0u6MDxcp3See-agzyCSJS7dKpwK28LMJwPvE9DLtQ@mail.gmail.com>
 <5665b221-04d7-6be9-2377-8006b9563d4b@gmail.com>
 <CAAEAJfAdGeFK7DNY3QzRZEsZx+PGbQtxyyOPwawmMsx2JByt8g@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <8372dd41-64b9-64e1-960d-7b20717d5c1e@gmail.com>
Date:   Mon, 23 Nov 2020 14:09:20 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAAEAJfAdGeFK7DNY3QzRZEsZx+PGbQtxyyOPwawmMsx2JByt8g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.11.2020 06:07, Ezequiel Garcia пишет:
> On Sat, 21 Nov 2020 at 23:01, Dmitry Osipenko <digetx@gmail.com> wrote:
>>
>> 22.11.2020 04:02, Ezequiel Garcia пишет:
>>> Hi Dmitry,
>>>
>> ...
>>>> +++ b/drivers/staging/media/tegra-vde/TODO
>>>> @@ -0,0 +1,4 @@
>>>> +TODO:
>>>> +       - Implement V4L2 API once it gains support for stateless decoders.
>>>> +
>>>> +Contact: Dmitry Osipenko <digetx@gmail.com>
>>>
>>> The API for H264 stateless decoding is ready.
>>> See https://lkml.org/lkml/2020/11/18/795.
>>
>> Hello Ezequiel,
>>
>> Thank you for the notification! My last attempt at implementing V4L API
>> support was about a year ago and it stopped once I realized that there
>> is no userspace which uses that API. FFMPEG and chromium browser had
>> some kind of V4L support, but it all was oriented at downstream driver
>> stacks, and thus, not usable. Do you know what is the current status?
>>
> 
> The bulk of the API, which relies on the stateless decoder interface [1],
> and H264 stateless V4L2 controls has been ready for some time now,
> and there are various implementations supporting it.
> 
> Chromium supports it [2], and I've tested it on chromebooks,
> through chromeos builds. We haven't tried a non-chromeos build,
> and I would say it's quite some work.
> 
> GStreamer support is available as well. See [3] which should
> work for the latest H264 controls (the ones being moved out of staging).
> 
> LibreELEC developers maintain an Ffmpeg branch [4], I expect it will
> be updated for the latest H264 controls soon, and hopefully merged
> in mainline Ffmpeg.
> 
> GStreamer and Ffmpeg are relatively straightforward to build and test.
> 
> Thanks,
> Ezequiel
> 
> [1] https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/dev-stateless-decoder.html
> [2] https://github.com/chromium/chromium/tree/master/media/gpu/v4l2
> [3] https://gitlab.freedesktop.org/ezequielgarcia/gst-plugins-bad/-/tree/h264_stable_uapi
> [4] https://github.com/Kwiboo/FFmpeg/tree/v4l2-request-hwaccel-4.3.

Alright, thank you.

