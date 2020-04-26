Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 317501B8C26
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 06:42:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726121AbgDZEmx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 26 Apr 2020 00:42:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726103AbgDZEmw (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 26 Apr 2020 00:42:52 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53384C061A0C;
        Sat, 25 Apr 2020 21:42:52 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id j14so11022296lfg.9;
        Sat, 25 Apr 2020 21:42:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ut2TYyc9G9ns++9ie5u15WlTrG49P99weEhAeDJkQwo=;
        b=QRyTNtMKX80TlpgGEkrRojHmHYFc8LwB7CbHR3u33mPt1H5r8MoxrAnjg9uCKhkBRR
         18+ygiqQXDC4m+fU6EyQSeefuRvp/4Cnh8RB7Oy1IH8BOQHSw/n42wQbO6XvRFkU6Vy4
         fjd+3qD6ZZjMmNyvs/6qga+xwOhXzee+pV+7chk5u+WxUmDWhe5Q0Dn6sZPRRBs5806V
         YmW9TppLIBKohynmXHPwPIAJITpHV6MpSH+GWwSp/C8Lnzq5cQc+vj2mVQFJJ1MA2MVn
         2ID8Zkt5kzX+n4EPzFzgKWmoZzSrfPJtgLkqqnTC8GMpC+WQbc1xEKCy09us7XIhlkkm
         RlYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ut2TYyc9G9ns++9ie5u15WlTrG49P99weEhAeDJkQwo=;
        b=DGDl8lrU5TRuC96luWVvTxrW+kv25sNBmI9FYuP3x3ByTLlNta7zkdKh56MHStUEWU
         U9HDF2249B6An6zMehDZrjM+GbTfatQFi060qxf0Pa6kvYGlGZlc3mvfu51jn0scV3M1
         UVRJo/4ONNLvS7Eodf8T2wgzvsqAReMCu1BwaPd5obUmLw4glwZzCnUONEYFWlStIw+x
         QxHoNJH/LL/L6z/NSZi6QEl9wQN3bgSkDJeios6PnegC7xMEAEnvWw6dcxVTSf4bMCzB
         PiTbxjCAVsKtRI9pP+exT8qZo+O+cm6/b49kCuK6ImtNY8SFrjH0w7chfOZd9941YPBn
         TtRQ==
X-Gm-Message-State: AGi0PuZaz4upGXJCqk+/XzUfs+SWLH1BSlBXtcG9Mko7cZwS5Cc+HddG
        gJ8Tf5CubjSIJt7S//UNwjOrEQVy
X-Google-Smtp-Source: APiQypLEzbW7V4ATEDfkQJjIeOXrT6sszGRc0icYk3qrnJSB1amavwuGoNM+uRnbfUu7Vly+Dj4/5Q==
X-Received: by 2002:a05:6512:1111:: with SMTP id l17mr11284561lfg.206.1587876170420;
        Sat, 25 Apr 2020 21:42:50 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id i3sm7386886ljg.82.2020.04.25.21.42.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 21:42:49 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
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
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
 <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
Message-ID: <7dfca778-e402-3a6f-617c-dd8448187a13@gmail.com>
Date:   Sun, 26 Apr 2020 07:42:48 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 05:10, Dmitry Osipenko пишет:
> 26.04.2020 04:43, Sowjanya Komatineni пишет:
> ...
>>> It looks to me that at least all those hardcoded HW format IDs do not
>>> match the older SoCs.
>>
>> TPG hard coded formats are supported on prior Tegra.
>>
>> Other supported formats are SoC dependent and  part of soc data in the
>> driver already.
> 
> But I don't see where that SoC-dependent definition is made in
> terga210.c. That tegra_image_format enum looks T210-specific, isn't it?
> 
> ...
>>> The driver will need to have a bit better separation if it's supposed to
>>> have a common core for all SoCs. Each incompatible VI/CSI hardware
>>> version should have its own kernel module.
>>
>> currently other Tegra host1x driver (drm) also does similar. Single
>> module for all Tegra SoCs.
> 
> DRM driver has a proper separation of the sub-drivers where sub-driver
> won't load on unsupported hardware. The tegra-video driver should do the
> same, i.e. VI and CSI should be individual drivers (and not OPS). There
> could be a some common core, but for now it's not obvious to me what
> that core should be, maybe just the video.c.

Although, you're right that tegra_drm is compiled as a single module.
That's not good, I'm actually not sure now whether it is possible to
modularize host1x drivers properly without changing the whole host1x bus.
