Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37C3B1B8ABB
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 03:26:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726143AbgDZB0H (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 21:26:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726070AbgDZB0F (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 21:26:05 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C6D7C061A0C;
        Sat, 25 Apr 2020 18:26:05 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id r17so10883080lff.2;
        Sat, 25 Apr 2020 18:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PJ5SdqUzErX47qSo76sTAhtveEg7L+g5fhu/mwEX3I0=;
        b=vBJ5DG8+dP+Cx1VxxxUelWljxWOWbM+gc9+WKjPz4Xg/QKvMNRRWEdH8k9njOcLneE
         VUUgUxHcnQZ4J0ATZri26BWe1zmYsRIWo5iut9TiHrkFicVmIii3ssUtXHaxB3fEIQ2J
         G6GbEjSKkmBq9WiJgdT5aJLm3GVUwG+T6LvHmikxRxyAwTg96+y//ZjIy8qkCO2LMfWj
         8S7Ak6H8HiCweY/Of8wqf8NdQ4ycewLFud5KJR1ETSWeKF8JiGkJqzOVwEsqaXDcjIyW
         wiITGvumXXlMMblzi/iCN0UJBR1380YjcWWx1YfOISXzsSA+o46JG+/XorbRfEWONOuU
         Lmiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PJ5SdqUzErX47qSo76sTAhtveEg7L+g5fhu/mwEX3I0=;
        b=bVaQncy8WXMNOumoDyt9EDZPY0H4w4ivFiH4ghh5sNuT8uMmGPH2VDPQbnde/VNGBx
         EHphaSc7oSTCvz0oT2u+4xvk+kGXGZMPvlta+QFN5tHpnC4vhqQs3MzW/x9GRGCxq4O+
         gtkvd+1jPkjU2jWdK/zplZyG5I4R017a6qDnp1pT2O5i6fDidPardPXfTPm7v4hb/xu3
         ABHfxJJfX17VULcUqv0JpkIa6Acczn4bwWVufmgr896ri24JA+5K6HV1+Ifu8RFXNmDQ
         e7GB5tOWjUhIeO2pvN2XaQGil2+pWSQd9DULwKJHso5OVKV5VPdTxMagYnfkjsVXhrSC
         nTmg==
X-Gm-Message-State: AGi0PubedVS7LV2mLwrUihNtZr/85KvJ76ZAPEAK02LNco5vvKeT0QXK
        cJkRRmKZi/dRCcHxBslwiGrXRtoi
X-Google-Smtp-Source: APiQypJTDyUc+mABc9irWwCHesc3rz7Cj2W8V7E9oQG8pDGxeL7odSzpXMgzkH+QHT9fK0HCxDueHw==
X-Received: by 2002:ac2:5c45:: with SMTP id s5mr11155627lfp.28.1587864363200;
        Sat, 25 Apr 2020 18:26:03 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id m23sm7143408ljb.87.2020.04.25.18.26.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 18:26:02 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, frankc@nvidia.com, sakari.ailus@iki.fi,
        helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
 <6ca93ff9-ca59-544f-767c-4355d01a5c20@gmail.com>
 <62546d1f-eca5-06be-2bc2-e45ccd53830a@xs4all.nl>
 <50fd1016-ca8b-ec5d-e5a8-f257138b152e@gmail.com>
 <658c4232-94d9-3051-8c93-bff7046cf5f2@nvidia.com>
 <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
Date:   Sun, 26 Apr 2020 04:26:01 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <03426915-25ea-69b4-bc64-f87f3046d33f@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 04:08, Sowjanya Komatineni пишет:
> 
> On 4/25/20 5:41 PM, Sowjanya Komatineni wrote:
>>
>> On 4/25/20 5:36 PM, Dmitry Osipenko wrote:
>>> External email: Use caution opening links or attachments
>>>
>>>
>>> 25.04.2020 12:36, Hans Verkuil пишет:
>>> ...
>>>>> The media/tegra/ sounds a bit too generic, the media/tegra-vi/ path
>>>>> should better reflect the driver, IMO.
>>>>>
>>>>> It also should be better to name the compiled kernel module as
>>>>> tegra-vi,
>>>>> IMO.
>>>>>
>>>> The driver name and the directory should be in sync, so either
>>>> tegra-video
>>>> or tegra-vi for both. I have no preference myself, as long as they
>>>> are the
>>>> same.
>>>>
>>>> This can be done as a follow-up patch.
>>> Given that this driver isn't going to be reused by older pre-Tegra210
>>> SoCs, perhaps it will also be worthwhile to name it as tegra210-vi or
>>> tegra210-video.
>>
>> Can you explain what do you meant by can't be reused for pre-tegra210
>> or for tegra186/194?

It looks to me that at least all those hardcoded HW format IDs do not
match the older SoCs.

>> support for other tegra's can be added to same tegra-video driver.
>> tegra-video host1x driver can be updated to add other tegra's vi and
>> csi compatibles to host1x subdevs and vi and csi driver can be updated
>> to add other tegra soc data and need to add coresponding
>> tegra186/194/xxx.c file with tegra specific prog sequence
>>
> Same tegra-video.ko can be used for all tegra soc as driver supports
> adding other soc related as well.

Well, I'm still not sure why you would want to have all the unnecessary
code of a different SoCs shared within the same kernel module, it will
be quite be a lot wasted space in comparison to a used part of the driver.

The driver will need to have a bit better separation if it's supposed to
have a common core for all SoCs. Each incompatible VI/CSI hardware
version should have its own kernel module.

> Also was thinking instead of renaming media/tegra as media/tegra-vi,
> probably we can rename as media/tegra-video so it will be inline with
> module name we already chosen and also mainly we have vi and csi with in
> that so instead of tegra-vi probably we can use media/tegra-video?

The tegra-video should be okay, although the "video" part sounds a bit
too broad since video could mean a lot of things. I think downstream
kernel uses (or at least used) the tegra-camera name for the driver,
perhaps it could be a reasonable variant as well.
