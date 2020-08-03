Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B0E723A81E
	for <lists+linux-media@lfdr.de>; Mon,  3 Aug 2020 16:11:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728348AbgHCOLa (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Aug 2020 10:11:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728345AbgHCOL3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 3 Aug 2020 10:11:29 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 803AEC061756;
        Mon,  3 Aug 2020 07:11:26 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id 185so29566138ljj.7;
        Mon, 03 Aug 2020 07:11:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=YH7oVYHUYOmF2ZJdLJ9+nyMxPgXidrzPU6lX6vlVRJY=;
        b=ZMmlG02vyjbYZRIKxDsPQ1IWCfK2i1G9Zv0ChJdx6D3BsN7+02eLisw6oxRkploX1E
         81SeGVNSYrZwclL6vrSDB/9ESU480wBTty8BvTlgw08fRVilSJ5bK6m5sYSz/94iW2K2
         ByggkqK70WXpRT8cpGoti4+4YMnO+rWxEf37UtRVjde7+1JZgSdvFB2js2s/Rv+1SW30
         YgRjt4wq6xozFBHT/WSBuvNRWOkHAPIdITsQLBJsTNPAnJdK/4eIBmpOVuCLwrvahkIw
         W9CiTOdwjKkymHWiBw7OVzs6vgdDKi4PfaC/xtL6fpGp7Glu1qgDCoVdXeD5vDtkf1bK
         C7tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YH7oVYHUYOmF2ZJdLJ9+nyMxPgXidrzPU6lX6vlVRJY=;
        b=iSYl7tcdhakhLwWYILVKtxXJJAUzZIppRs21ADFVD9oRFTijeh6zdsTV6sdmssNNsU
         JZzPreFMg8CGwCYpvFqz880ASUkomZeYhmkQDONTbznbpjnCXaPc8ZKW4SIfRf5kROXk
         lCT/NwxuLoPCgB1Ng6NZYF6YLhg5yeCl939Ry597GmPGLhBzLNe9dZM11g8ZGMWJ9z9C
         f5I8r1QefjeJT9vwRcjyHbHr7GQhhPtoOHthZY0C9KbI5CHxDBiIe4XAvji3DKeAWlqW
         JHetcZzQmmnYHbHeUcubRkDGjy7ZRIuzsjbfH00Qb7KAAQBbdAYfcd3Ep1TIhQKKNWjG
         nvjg==
X-Gm-Message-State: AOAM533LLgafVv1xbBc0Avh1ZlTCaNkrzRWRybX/n+3K1TAWcwlUdE9Q
        Xa5NqDtQEcwsr/lG98O/rJYFzFea
X-Google-Smtp-Source: ABdhPJyPkmQIsIxZcpJbVcfG0GS1zjreLf3UCcfaqInza2W6ea+wP8F2ZE2lzGs6+STG30tb79F5TQ==
X-Received: by 2002:a05:651c:118f:: with SMTP id w15mr8041034ljo.211.1596463884908;
        Mon, 03 Aug 2020 07:11:24 -0700 (PDT)
Received: from [192.168.2.145] (94-29-41-50.dynamic.spd-mgts.ru. [94.29.41.50])
        by smtp.googlemail.com with ESMTPSA id d6sm2596272ljg.25.2020.08.03.07.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2020 07:11:24 -0700 (PDT)
Subject: Re: [PATCH -next] media: staging: tegra-vde: Mark
 tegra_vde_runtime_suspend as __maybe_unused
To:     Yuehaibing <yuehaibing@huawei.com>, mchehab@kernel.org,
        gregkh@linuxfoundation.org, thierry.reding@gmail.com,
        jonathanh@nvidia.com, hverkuil-cisco@xs4all.nl
Cc:     linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20200803115901.44068-1-yuehaibing@huawei.com>
 <721b8d01-5d7e-09c6-5f86-705130ab31a9@gmail.com>
 <e15a688e-934b-82a8-34c5-aac07928fd8f@huawei.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <95162bdc-2658-30a7-6ed2-63e095244139@gmail.com>
Date:   Mon, 3 Aug 2020 17:11:23 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e15a688e-934b-82a8-34c5-aac07928fd8f@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

03.08.2020 16:00, Yuehaibing пишет:
> On 2020/8/3 20:51, Dmitry Osipenko wrote:
>> 03.08.2020 14:59, YueHaibing пишет:
>>> If CONFIG_PM is not set, gcc warns:
>>>
>>> drivers/staging/media/tegra-vde/vde.c:916:12:
>>>  warning: 'tegra_vde_runtime_suspend' defined but not used [-Wunused-function]
>>>
>>> Make it __maybe_unused to fix this.
>>>
>>> Signed-off-by: YueHaibing <yuehaibing@huawei.com>
>>> ---
>>>  drivers/staging/media/tegra-vde/vde.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>>> index a3c24d96d5b9..2d043d518eef 100644
>>> --- a/drivers/staging/media/tegra-vde/vde.c
>>> +++ b/drivers/staging/media/tegra-vde/vde.c
>>> @@ -913,7 +913,7 @@ static irqreturn_t tegra_vde_isr(int irq, void *data)
>>>  	return IRQ_HANDLED;
>>>  }
>>>  
>>> -static int tegra_vde_runtime_suspend(struct device *dev)
>>> +static __maybe_unused int tegra_vde_runtime_suspend(struct device *dev)
>>>  {
>>>  	struct tegra_vde *vde = dev_get_drvdata(dev);
>>>  	int err;
>>>
>>
>> Hello Yue,
>>
>> Shouldn't the tegra_vde_runtime_resume() be marked as well?
> 
> No, tegra_vde_runtime_resume() always be called by tegra_vde_shutdown().

Well.. it's unused, but compiler doesn't complain about runtime_resume()
because it sees the potential reference to that function in the code
(even that it's a dead code), while runtime_suspend() reference is
completely removed by preprocessor before compiler sees the code.

Should be nicer to have both suspend and resume functions marked, for
consistency, IMO.
