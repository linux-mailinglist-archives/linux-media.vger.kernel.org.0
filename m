Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C52ED20B2B7
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 15:42:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728804AbgFZNmm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 26 Jun 2020 09:42:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725864AbgFZNmj (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 26 Jun 2020 09:42:39 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50371C03E979;
        Fri, 26 Jun 2020 06:42:39 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id u25so5204451lfm.1;
        Fri, 26 Jun 2020 06:42:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uYTmePWqL+ojg7pTw86haNnpUaWsC/kAgdQhw8L9p3s=;
        b=D4EQmPul29mEzPhiRmNlkAQlLVO731Q45fBQZY6OkZ+wySHzujY7SsWTVDr8mrxsBR
         edZdMMM1RUZAR2pH1/U56nkFLjfAQh0Z+tzZCmgyIzb1R4m9wtwen41hyy6QbZjkn4a3
         DQXrWo3o4TILXzm+c7nvVviCW9ZZNhvfBCJMWJFnULtkSFdLYJX1gb/owP2jOpmBQSFs
         xcl41OkT4PwZPmmTKp1wdxzYXlidDs6FJkvACDSZgDcZxfGBW4NtZDgyJTMUtLpgm+Ca
         hw7ULIqSewsLpOd1Mm5TFpeYlu6J/loX7xSt68G1Lt4xtrsRUXMXvRG3NdiD1/YBaXFr
         j5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uYTmePWqL+ojg7pTw86haNnpUaWsC/kAgdQhw8L9p3s=;
        b=mmNnh7HEC/3evvNeCwSPhdBBrTRPf7S7KZl8w1AvbHkEQFK656FfeOm2Dtc65wU94J
         Q6jBSfLQz+HNYKKKmQxGlc6Fvd44vU3HZ9Y5gtm2y0BkEOFyLQBvrt4uuMrze/SHO70a
         vwOAbwN7/YH46LigpYSELZc0VPXUQ/PwEstDAClOK3+p0qcTqX2Cexx10u8t8xzHq5MJ
         It65tWqobP73ZYncz2+6kYM9wpqbvleWMxt9/z2uqzAJkaVGyp7j2+ferS1mUuSMsnM2
         V9BC12lQi57bUEpyY4EsS2LOj1Wy9okN8Qnq8KLHhQwZ26LO7utFPkZ+pqLNgrNMlAel
         hKNw==
X-Gm-Message-State: AOAM531ciNPvmB/IMNlnCJFOuSl+BT3JthK72kIfzRbKW9w66a6A4zCW
        X9gv+SMEXFTodz3mGLLpdAxdg7EvXXw=
X-Google-Smtp-Source: ABdhPJxp6AHUyFV4TLjJuogPsoZl6byF7taRhly5fBVSV4mGsvuhu8kY81TASnruf/O1pYgVXAJJSA==
X-Received: by 2002:a19:c50a:: with SMTP id w10mr1958878lfe.48.1593178957515;
        Fri, 26 Jun 2020 06:42:37 -0700 (PDT)
Received: from [192.168.2.145] (79-139-237-54.dynamic.spd-mgts.ru. [79.139.237.54])
        by smtp.googlemail.com with ESMTPSA id g142sm6812892lfd.41.2020.06.26.06.42.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2020 06:42:36 -0700 (PDT)
Subject: Re: [PATCH v2 4/4] media: staging: tegra-vde: Power-cycle hardware on
 probe
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
        linux-tegra@vger.kernel.org, devel@driverdev.osuosl.org,
        linux-kernel@vger.kernel.org
References: <20200624150847.22672-1-digetx@gmail.com>
 <20200624150847.22672-5-digetx@gmail.com> <20200626074818.GD3109062@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1c306d0a-571b-dc7c-3a61-0149dfb0e2be@gmail.com>
Date:   Fri, 26 Jun 2020 16:42:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200626074818.GD3109062@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

26.06.2020 10:48, Thierry Reding пишет:
> On Wed, Jun 24, 2020 at 06:08:47PM +0300, Dmitry Osipenko wrote:
>> VDE partition is left turned ON after bootloader on most devices, hence
>> let's ensure that it's turned OFF in order to lower power leakage while
>> hardware is idling by turning it ON and OFF during of the driver's probe.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/staging/media/tegra-vde/vde.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/staging/media/tegra-vde/vde.c b/drivers/staging/media/tegra-vde/vde.c
>> index b64e35b86fb4..3be96c36bf43 100644
>> --- a/drivers/staging/media/tegra-vde/vde.c
>> +++ b/drivers/staging/media/tegra-vde/vde.c
>> @@ -1068,6 +1068,14 @@ static int tegra_vde_probe(struct platform_device *pdev)
>>  	pm_runtime_use_autosuspend(dev);
>>  	pm_runtime_set_autosuspend_delay(dev, 300);
>>  
>> +	/*
>> +	 * VDE partition may be left ON after bootloader, hence let's
>> +	 * power-cycle it in order to put hardware into a predictable lower
>> +	 * power state.
>> +	 */
>> +	pm_runtime_get_sync(dev);
>> +	pm_runtime_put(dev);
>> +
>>  	return 0;
>>  
>>  err_deinit_iommu:
> 
> Shouldn't this happen automatically? My understanding is that power
> domains are turned on automatically before ->probe() and then unless a
> runtime PM reference is taken during ->probe() it will get turned off
> again after ->probe()?

Older Tegra SoCs haven't been converted to use the generic power-domain
API and today's VDE driver supports only T20 and T30 SoCs.

> Is that not happening? Is auto-suspend perhaps getting in the way
> somehow?

We're manually toggling the PD using legacy Tegra-PD API in the driver's
RPM callbacks, that's why the RPM needs to be toggled manually as well.

Perhaps this hunk could be removed if older Tergas would get a genpd
support. I guess it shouldn't be difficult to implement the genpd
support, but then there will be a compatibility trouble with older DTs,
so perhaps it's not really worth the effort.
