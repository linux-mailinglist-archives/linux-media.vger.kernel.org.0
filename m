Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6B1CC2E882D
	for <lists+linux-media@lfdr.de>; Sat,  2 Jan 2021 18:56:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbhABR4W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 2 Jan 2021 12:56:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbhABR4V (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 2 Jan 2021 12:56:21 -0500
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31FD5C061573
        for <linux-media@vger.kernel.org>; Sat,  2 Jan 2021 09:55:41 -0800 (PST)
Received: by mail-pf1-x432.google.com with SMTP id a188so1179519pfa.11
        for <linux-media@vger.kernel.org>; Sat, 02 Jan 2021 09:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=S70RCfEH57adyNyWBzedG3Bkr0NdSNtkG4nKLbQAfms=;
        b=PQAEKWiuvQznyMIZuAVwxko1p7XGVoeVHV3YJYMovh8TIVJT3nj/jtZZCjf3vJCJWO
         9qNuqqH0/uhqZ2pCgMDeptsX7W6EDaaXBB+tz7rYtytg1sDX+nhbOTOvQI54X2cx5yim
         +EnkHq72hJF+2KnL8IZBH7Jt/xZpbXxA6hCgICr/8QdQ89EQxoWgV9Fqq3CggmADQFuU
         vldG7p12GGqVkG3Z4T42qmTLpJN2/SXFBzzFQjLpe9/YhT76k19NCgQbdA+ej7Qlnbjx
         bxEZeq8IqzqWZOPfR7FqpS0PH6JVZXyFY8zQY6oWbg8k4gRPo1KadeRsqBOp8aYrvwUq
         KirA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=S70RCfEH57adyNyWBzedG3Bkr0NdSNtkG4nKLbQAfms=;
        b=mb/KTKNHret8UUty7tLFdxtmR1QUV9e3ZXc8DKrbkVGlqIUHpSxXaVanNzAVepCAow
         90QPwsYnssJrFvcwypxNsEdwdBXVCztpP6+UrbKY4aemkDZ9BeLKOgn0Rx2oUc1plohR
         wSS1A26T8o0HruRKcacny3xAnFfcIZaLWSFk06BJIHq3HNIFc0LSDaw4hH7MysStGg3o
         79X8wpzvgxCvpiegonFK/MhBY9+QACgcrVp/VNumb7T1npAi31D30yw3b7W23d53OFLA
         WntizM9K74pDdSt53kMqR8VzBMDTwnDOM1IYsj4eTkwHYDtdcDIBbVSnDwVPUFoSRJ1D
         JnPw==
X-Gm-Message-State: AOAM532oVyHIOvbZXwDhiXOBXyoww8JdPloSaLVyDq3m9qbWlSHS4Ru2
        7jEpUzzRSJ722efbQdDHHaE=
X-Google-Smtp-Source: ABdhPJxwltjhuQiulPBBpEUzUw4S2VdDORp/chp4opQ/6dt/CLrqHLJnhB5VobzuE0bFzex8dS4E4w==
X-Received: by 2002:aa7:8811:0:b029:1ab:9e4f:b8ea with SMTP id c17-20020aa788110000b02901ab9e4fb8eamr56501063pfo.78.1609610140673;
        Sat, 02 Jan 2021 09:55:40 -0800 (PST)
Received: from [192.168.1.59] (c-73-202-231-77.hsd1.ca.comcast.net. [73.202.231.77])
        by smtp.gmail.com with ESMTPSA id gb9sm16243516pjb.40.2021.01.02.09.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 02 Jan 2021 09:55:40 -0800 (PST)
Subject: Re: IMX frame interval monitor (FIM) available on
 ipu{1,2}_ic_prp{enc,vf} capture nodes?
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
References: <CAJ+vNU1Du8JpEMqGC+BMyD3D+wVAUP42PXqa=_unrD7L4YfDAA@mail.gmail.com>
From:   Steve Longerbeam <slongerbeam@gmail.com>
Message-ID: <30a04077-869b-9b58-a69f-15b19a3f6bd4@gmail.com>
Date:   Sat, 2 Jan 2021 09:55:38 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU1Du8JpEMqGC+BMyD3D+wVAUP42PXqa=_unrD7L4YfDAA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Tim,

I gave this a shot a while ago, but I recall struggling with some 
locking problems. I haven't been able to return to it. I've updated the 
imx/add-fim-to-prpencvf branch to latest media-tree master branch 
(5.11.0-rc1), in my github fork [1]. The patches against master are:

0001-media-imx.rst-update-doc-to-reflect-FIM-changes.patch
0002-media-imx-prpencvf-attach-FIM.patch
0003-WIP.patch

The last patch was my first attempts to debug the locking problems.

I don't have access to imx6 hardware any longer, so I can't progress any 
further on it at this point.

Steve

[1] git@github.com:slongerbeam/mediatree.git


On 12/31/20 8:48 AM, Tim Harvey wrote:
> Steve,
>
> Some time ago you mentioned that adding FIM capability
> (imx-media-fim.c) on the ipu{1,2}_ic_prp{enc,vf} capture nodes was on
> your plate to fix as currently the controls are only available on the
> ipu{1,2}_csi{0,1} capture nodes. Do you have any patches for that or
> can you explain what needs to be done?
>
> I have a user that wishes to use FIM to deal with a lossy analog
> signal coming out of sync but they also wish to use the VDIC to
> de-interlace.
>
> Best regards,
>
> Tim

