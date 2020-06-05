Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C7F3E1EF9ED
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2020 16:06:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727776AbgFEOF7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 5 Jun 2020 10:05:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbgFEOF6 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 5 Jun 2020 10:05:58 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D807C08C5C2;
        Fri,  5 Jun 2020 07:05:58 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id a25so11901869ljp.3;
        Fri, 05 Jun 2020 07:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=E2imZowYcWsqMuYyPOGiSh8Vkqqat7rhLhXVyMR2k0w=;
        b=D/wJ7NyAluy19hD4lOArO9SudJkVEhvukrBzFKZOOidCtGQr8L7Zz5q/SToiDFhpSb
         p5UTbi5gebuWIbN8mFJ80H3cJ+qyXanlpYp6tAHrZnkCfsCkbTwF1pe0eHBrfooqhwlU
         lpiMA4Yehiqnot+x/r0IkPCAWzTBw/N1Xos/ndEeL78XLizAf9w1AGm+gMTtpRc64OZH
         mtHx+WeQepSOZP6of5WOZkXFBatcKPwQuk8aBMzg4/tBJcTerQNqSLHw6ddo540CyJgG
         iM1hrslBg2I3UsbIqpUSRl2OdYaIQLPTJBXg6hK8wDEeQv8sPB2PZpXzEjhIeR0jUM0d
         g8mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=E2imZowYcWsqMuYyPOGiSh8Vkqqat7rhLhXVyMR2k0w=;
        b=KG8jhXBpuPxdAspOVP+TA7DyLrL8yxAEP6D3sudjYr2SLPXMWMohYfyOIvLXJUW2Kw
         zF+ya/b4fip+OCmEhuVzE7+YH2vdqyhSV6JDfXMD+bFZC6a7HJ1zlrfGHaHUGXRMfDAH
         oQJz/N8mbtumpMmeiAc6hLhZntAX1WIv51l6R5zZQ7L7XjS0oneRJ7QL/d77P78wO6Hb
         JljU8VqK6Pl4WthWkRzMgtLp+6RLeVXCNfo7+vL9/zu8TWIZyAxyYvVs29H6lLFjuOXm
         gvfIXnAU6LJewePeEdMww+VTzFPilCeM64XuIuezOEPIS1B67ObOOE+Lhz/Lp1pdLdqF
         nJBQ==
X-Gm-Message-State: AOAM533FUVdAYhZASJC3IpV0Si/u5twza8QIwz8w7/M0/VLBbyEJrHKg
        SUKQDIt42wEaclfRxcm5aIM=
X-Google-Smtp-Source: ABdhPJyhDQJ3TrPRcEnQIaSKKUFiV1lqR92HYbBU8YHDoEyM3qNNPqHz0h+AjVhHM+ruxqLhmDTBYg==
X-Received: by 2002:a2e:975a:: with SMTP id f26mr4974996ljj.302.1591365956611;
        Fri, 05 Jun 2020 07:05:56 -0700 (PDT)
Received: from [192.168.2.145] (109-252-173-94.dynamic.spd-mgts.ru. [109.252.173.94])
        by smtp.googlemail.com with ESMTPSA id z133sm980669lfa.41.2020.06.05.07.05.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Jun 2020 07:05:47 -0700 (PDT)
Subject: Re: [PATCH] media: staging: tegra-vde: add missing
 pm_runtime_put_autosuspend
To:     Jon Hunter <jonathanh@nvidia.com>,
        Navid Emamdoost <navid.emamdoost@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
Cc:     emamd001@umn.edu, wu000273@umn.edu, kjlu@umn.edu, smccaman@umn.edu
References: <20200602054841.15746-1-navid.emamdoost@gmail.com>
 <7061eb81-c00c-9978-5e4b-f9896c0ffd5e@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b03670e5-2718-062e-0f53-d596434fe9a4@gmail.com>
Date:   Fri, 5 Jun 2020 17:05:46 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <7061eb81-c00c-9978-5e4b-f9896c0ffd5e@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.06.2020 09:00, Jon Hunter пишет:
> 
> On 02/06/2020 06:48, Navid Emamdoost wrote:
>> Call to pm_runtime_get_sync increments counter even in case of
>> failure leading to incorrect ref count.
>> Call pm_runtime_put_autosuspend if pm_runtime_get_sync fails.
>>
>> Signed-off-by: Navid Emamdoost <navid.emamdoost@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/vde.c | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>> index d3e63512a765..52cdd4a91e93 100644
>> --- a/drivers/staging/media/tegra-vde/vde.c
>> +++ b/drivers/staging/media/tegra-vde/vde.c
>> @@ -776,8 +776,10 @@ static int tegra_vde_ioctl_decode_h264(struct tegra_vde *vde,
>>  		goto release_dpb_frames;
>>  
>>  	ret = pm_runtime_get_sync(dev);
>> -	if (ret < 0)
>> +	if (ret < 0) {
>> +		pm_runtime_put_autosuspend(dev);
>>  		goto unlock;
>> +	}
>>  
>>  	/*
>>  	 * We rely on the VDE registers reset value, otherwise VDE
> 
> Please use the put in the error path.

This is a third version of the patch [1][2].

[1]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200514210847.9269-2-digetx@gmail.com/
[2]
https://patchwork.ozlabs.org/project/linux-tegra/patch/20200520095148.10995-1-dinghao.liu@zju.edu.cn/

I'd prefer to stick with my variant of the patch [1] because in my
opinion it's most straightforward variant and I actually tested that it
works properly.

Navid, anyways thank you for the patch. Next time please check if
somebody else already sent similar patches before you.
