Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1308536EA9F
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234147AbhD2MjG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:39:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232657AbhD2MjG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:39:06 -0400
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B54B5C06138B;
        Thu, 29 Apr 2021 05:38:19 -0700 (PDT)
Received: by mail-lj1-x22e.google.com with SMTP id b21so3762335ljf.11;
        Thu, 29 Apr 2021 05:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=C9ADd+O1J2g7WPah5TPp1y5aPWH188p57AR71wN8M7Y=;
        b=jNb3LRNDZRY9dtWQ93oZg3Us255+OUEcb5r+MjK5sgkqGm7K9ak2patahQ6FZcQ4SG
         28gHOMaQhLQK4D5cZpgiMVK1xT5XaPCU5pkFtSOVIMAZQ9BBiOgPnc/cXivzWcDrNz2i
         H9506pQwYfGU9WiNOhZ3cIL0FTWvHooUSMBpK5u6BPyF2ggTLCQG09bdSv95I1JnkX3g
         nh3pI0amvi5YoTJBsug51S7QoV+mrkdy5sDhpRttOD/vmKonfuRbaUBS+GKkabP6a7Az
         uTEygRG6Qdg7dwzw0ebu4kUpHrNm2Jc9NyFuOLXfFVRJyurvbkzpJUP+ZLKUZztvchJ2
         eX7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=C9ADd+O1J2g7WPah5TPp1y5aPWH188p57AR71wN8M7Y=;
        b=Mm9rHTI72nTTyaQzdJGEmKuoNrI/jp4EG2F7DanwU9C+0/F+sQBAk/Xf1clfXU02X/
         +l8H4sKrAZvMPMofSR+4/fGpeNBMuemSaYoxa8J9+aP20lz+F+mpk8Jwe8t+XtxyNmtF
         xOR8CW3Sp8WLF+oPxl1m8nmM5Vu6xISI/Dwhov619MZF36BqEQaCS1uOn2A72blmFrW+
         A03w+1PDvX06uY5iDGJjTY5KVWIquZpgGCXxq7rJ88M3Gv4Y0piGe7XfY8bdQABppbmB
         ntswtyKkpFgypWAoB8B8m2nwGVytgl6orrj0lFoIXwVgnM9V56M1VyvsXHvHE03MzG9I
         y5iw==
X-Gm-Message-State: AOAM531Xb1KTWqW1fdbWLTTHfNpBSwFHLXeEnGjj9hvKIZ4q6kvANgFV
        gXOkDwtyTPW+lZdlstvJmJcHF5p3tcI=
X-Google-Smtp-Source: ABdhPJzTvng8yQNg4q9VfyFfl15qNbeKD7GZ3dV96aB9VC37IqAWamJguU8SXFBqPTn3oiUW9HRVMA==
X-Received: by 2002:a2e:140b:: with SMTP id u11mr24386345ljd.125.1619699898040;
        Thu, 29 Apr 2021 05:38:18 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id v130sm515026lfa.262.2021.04.29.05.38.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:38:17 -0700 (PDT)
Subject: Re: [PATCH v4 25/79] staging: media: tegra-vde: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <bc2b9048d4ad510eec97988ce8f3fd0d2bb26f39.1619621413.git.mchehab+huawei@kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ec7048b0-bd5e-82e5-08fb-b51d633105ff@gmail.com>
Date:   Thu, 29 Apr 2021 15:38:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <bc2b9048d4ad510eec97988ce8f3fd0d2bb26f39.1619621413.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2021 17:51, Mauro Carvalho Chehab пишет:
> @@ -1069,11 +1071,17 @@ static int tegra_vde_probe(struct platform_device *pdev)
>  	 * power-cycle it in order to put hardware into a predictable lower
>  	 * power state.
>  	 */
> -	pm_runtime_get_sync(dev);
> +	if (pm_runtime_resume_and_get(dev) < 0)
> +		goto err_pm_runtime;
> +
>  	pm_runtime_put(dev);
>  
>  	return 0;
>  
> +err_pm_runtime:
> +	pm_runtime_dont_use_autosuspend(dev);
> +	pm_runtime_disable(dev);
> +
>  err_deinit_iommu:
>  	tegra_vde_iommu_deinit(vde);

This is incorrect error unwinding, the miscdev isn't unregistered.
