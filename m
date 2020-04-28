Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F0091BC223
	for <lists+linux-media@lfdr.de>; Tue, 28 Apr 2020 16:59:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgD1O7R (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Apr 2020 10:59:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727108AbgD1O7R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Apr 2020 10:59:17 -0400
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D938AC03C1AB;
        Tue, 28 Apr 2020 07:59:16 -0700 (PDT)
Received: by mail-lf1-x141.google.com with SMTP id 198so17188304lfo.7;
        Tue, 28 Apr 2020 07:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MT+Q11l1p9dC7b9ZgXW9s1g2ErfUJa8QrYnTW64SSNw=;
        b=HF0pcv6gPu0OTjbO14po+5uESZ6J9qFvDOLLzt58ChCa28sgEuH4mE3jJyWLa1KxU7
         IzcOpJINCKU1jtxilOQnTIFPni0hPTBSJv7heA0EthTABoImbv0sbDQhGnApjs0riF/e
         s0SNBkKk83f5H0ayAuhpiFkIe8rNXQ5DAwtfnvTcqeN1Nm7rrT4vyL5u9Ujn88qpP49N
         WWhh9PIAz3u8rxTKHGVtXLiVe5N5uQrz9i2LOVBFdvwi+GqKKiXJQkTKqhMmPs2q5MAi
         nXhY327QKImDeeSOM0U61sYlMoWaRk8V+VjeoSRZqKFkaleGcYtHu4iAto9YNiPD67cp
         gUzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MT+Q11l1p9dC7b9ZgXW9s1g2ErfUJa8QrYnTW64SSNw=;
        b=TqT4vXiAOz9VWLmxakgRHjzicAZcHg7D8t+BLkIuzmBw2aSnpUenyxmUj1+pVXqJaS
         9yXdrpelc49ZLkOZOIWr98iA2C8QYM4ioFrvjP3x5ZNM52j30xu423Ip+2XeKGGpiXYt
         z14uTAnlxtsV9bRq5/r52qR5Kiy+jyLs2hz6MgrCGzL+2k2uMq23ANXgoAWNtwJQLCmz
         wKgNpbjDWDzd6OF1nVeihc8fmykUdHIPRV7KN91YGLUjWKqJDeLPzY7PS7OZ4d8aYB9K
         N/eK63kLGjaukDghqV2Bq/ryXhyVS1hm9szUedZLcr2HzVh9uj4GQVPvnR/6EF3zygMz
         9dfg==
X-Gm-Message-State: AGi0Pua1zJts5iWEGK78IEjXMMxvZk2SCrhD+SbvqSZDLF7HGcBA75jU
        e8MxUPKPaVT3fIzWqxozGanR0QQZ
X-Google-Smtp-Source: APiQypIKlIo3W122JCY1wTUltGAx0NRbS1I8wuR2nrtRoy6XFqJ/S4WBrWuMpIj6l5afGMZKSv6ZFw==
X-Received: by 2002:a19:b10:: with SMTP id 16mr19722907lfl.133.1588085955104;
        Tue, 28 Apr 2020 07:59:15 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id 25sm14316607lft.68.2020.04.28.07.59.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Apr 2020 07:59:14 -0700 (PDT)
Subject: Re: [RFC PATCH v1 3/5] media: tegra-video: Move PM runtime handle to
 streaming
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1588047650-29402-1-git-send-email-skomatineni@nvidia.com>
 <1588047650-29402-4-git-send-email-skomatineni@nvidia.com>
 <631390cb-9aff-0e3f-6c39-81d6c565987e@gmail.com>
 <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2b334095-fadb-bf0a-f7a8-62fc798c2bd2@gmail.com>
Date:   Tue, 28 Apr 2020 17:59:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <3ef69413-a606-b475-f530-d5534760b73b@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2020 17:51, Sowjanya Komatineni пишет:
> 
> On 4/28/20 6:59 AM, Dmitry Osipenko wrote:
>> External email: Use caution opening links or attachments
>>
>>
>> 28.04.2020 07:20, Sowjanya Komatineni пишет:
>>> diff --git a/drivers/staging/media/tegra-video/csi.c
>>> b/drivers/staging/media/tegra-video/csi.c
>>> index b3dd0c3..29ccdae 100644
>>> --- a/drivers/staging/media/tegra-video/csi.c
>>> +++ b/drivers/staging/media/tegra-video/csi.c
>>> @@ -272,8 +272,25 @@ static int tegra_csi_s_stream(struct v4l2_subdev
>>> *subdev, int enable)
>>>        struct tegra_vi_channel *chan = v4l2_get_subdev_hostdata(subdev);
>>>        struct tegra_csi_channel *csi_chan = to_csi_chan(subdev);
>>>        struct tegra_csi *csi = csi_chan->csi;
>>> +     int ret;
>>> +
>>> +     if (enable && atomic_add_return(1, &csi->clk_refcnt) == 1) {
>>> +             ret = pm_runtime_get_sync(csi->dev);
>>> +             if (ret < 0) {
>>> +                     dev_err(csi->dev,
>>> +                             "failed to get runtime PM: %d\n", ret);
>>> +                     pm_runtime_put_noidle(csi->dev);
>>> +                     atomic_dec(&csi->clk_refcnt);
>>> +                     return ret;
>>> +             }
>>> +     }
>>> +
>>> +     ret = csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>>
>>> -     return csi->ops->csi_streaming(csi_chan, chan->pg_mode, enable);
>>> +     if ((ret < 0 || !enable) && atomic_dec_and_test(&csi->clk_refcnt))
>>> +             pm_runtime_put_sync(csi->dev);
>> Runtime PM maintains its own refcount, why these
>> clk_refcnt/power_on_refcnt are needed?
> 
> Streaming is per channel and we can't turn power/clocks off while other
> channels may still be running.
> 

All channels use the same CSI device. You should remove the custom
refcounting.

BTW, next time you'll really need to do refcounting, use the generic kref.
