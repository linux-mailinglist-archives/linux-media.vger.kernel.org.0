Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B6BB61B8AFA
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 04:11:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726132AbgDZCKz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 22:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726101AbgDZCKz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 22:10:55 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0623EC061A0C;
        Sat, 25 Apr 2020 19:10:55 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f18so13900445lja.13;
        Sat, 25 Apr 2020 19:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ejX76MV7B/vpfNwLttmX8i7aY8yYW3D6qvt0Zq0zF9A=;
        b=Pert3oBZT9bm9OSxFoG7i/qdZCiH84yrHo+9RFNoMWF/ct15BLCeAyOZBW6VSCIzl5
         8AMWA4xmw+OCHTNaroP/Ne82MMzXDsBWKd3xIkwiWZ7P3cgLCLidgLVTv+oNdLJLbwM2
         zZcWvDfeOm11Rc2tQ57hYvT2WPHNbl9Xok/Tvl5Jql0UxSHRNhOjkqjM0/MA+bXTFcdq
         yhEXqaTXkHoSIiTmqoEjGVFfgkhFfZyzm5hC5aB9zBchuIjP6iaw9An+xxBVweaU0gOJ
         pDjVipSR+QtO+x5G3cIzejlr0J9mAguQWQPcVHEjU7RER9QJoDZjTtwmb8CpM0OvmqTD
         Bxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ejX76MV7B/vpfNwLttmX8i7aY8yYW3D6qvt0Zq0zF9A=;
        b=tQrOa8iNRZjUlhqECUkxR3LuwHShPVWou5+0XgGV0hsSHCQAJ54036dUk+WxLvXFyB
         t5doC44VgDalnrv0HaI8LXSBewkl89hO4wmjUrXg7X4QXTzsM/1jK3PfCG8AP8GMhpp1
         LJuKeaxAGcHPJBKxPkwM/axzyCjy9btA5VQevHvAINv/41Wg3sKGl6sqcylB94k8LM8x
         Bj3f6XrxQaFy2mJPomkfqun5I+vZmdEkWqBtRoiAx/UwStn7dWHWs4WBvDrh6gg9kQmk
         Vh/C60/siwMxpY4Gm4daKZ07XEr84hmyWES5gr+1KsK8UQuB3T9rJ39lJ37YrKGmq5QO
         6tAg==
X-Gm-Message-State: AGi0Pub3zKEH/68S49SsYYMOXFblh0moGbZsCp988jkKUJ1H6/6rNzoZ
        /GLCulEkuhfDcq++4GcEM6x93BI4
X-Google-Smtp-Source: APiQypJEikJi85v3up0OBfbJN/g72TVEOllWbTiHmbtrrvjCqQd0C92gwdppBPO/ZEhkF8wo8AhBrA==
X-Received: by 2002:a2e:8056:: with SMTP id p22mr10465457ljg.266.1587867053161;
        Sat, 25 Apr 2020 19:10:53 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b73sm8110124lfg.86.2020.04.25.19.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 19:10:52 -0700 (PDT)
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
 <aabaecc4-3494-0137-7d2b-853304bfa68b@gmail.com>
 <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <61799fab-858c-8b0d-ba7d-846cd041e044@gmail.com>
Date:   Sun, 26 Apr 2020 05:10:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <09f20441-fec6-7496-2edc-c69db535e441@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.04.2020 04:43, Sowjanya Komatineni пишет:
...
>> It looks to me that at least all those hardcoded HW format IDs do not
>> match the older SoCs.
> 
> TPG hard coded formats are supported on prior Tegra.
> 
> Other supported formats are SoC dependent and  part of soc data in the
> driver already.

But I don't see where that SoC-dependent definition is made in
terga210.c. That tegra_image_format enum looks T210-specific, isn't it?

...
>> The driver will need to have a bit better separation if it's supposed to
>> have a common core for all SoCs. Each incompatible VI/CSI hardware
>> version should have its own kernel module.
> 
> currently other Tegra host1x driver (drm) also does similar. Single
> module for all Tegra SoCs.

DRM driver has a proper separation of the sub-drivers where sub-driver
won't load on unsupported hardware. The tegra-video driver should do the
same, i.e. VI and CSI should be individual drivers (and not OPS). There
could be a some common core, but for now it's not obvious to me what
that core should be, maybe just the video.c.

> With current tegra-video, all the v4l2 related common part of
> implementation is same for all tegra's and only
> tegra210.c/tegra186.c/tegra194.c will have corresponding tegra soc
> specific vi/csi programming sequence.

This code shouldn't be shared within the same driver module, IMO.


>> The tegra-video should be okay, although the "video" part sounds a bit
>> too broad since video could mean a lot of things. I think downstream
>> kernel uses (or at least used) the tegra-camera name for the driver,
>> perhaps it could be a reasonable variant as well.
> prior feedback suggests not to use camera variant instead to use video

Alright, then the tegra-video should be fine.
