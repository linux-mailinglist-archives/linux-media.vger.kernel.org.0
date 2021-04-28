Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EC62136D39F
	for <lists+linux-media@lfdr.de>; Wed, 28 Apr 2021 10:05:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236787AbhD1IF6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 28 Apr 2021 04:05:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229643AbhD1IFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 28 Apr 2021 04:05:53 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50CA0C061574;
        Wed, 28 Apr 2021 01:05:07 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id a5so34255136ljk.0;
        Wed, 28 Apr 2021 01:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Nps3nttZguJ8BCD0NvcBimYy31g7NyHD2WV72x2rWLs=;
        b=scSO1JI2a1WTmBO2H/Tv1tlocFWHO1F1qZLoPwpZbG2D7xUkdpbBZrcN+R9+dNVG3d
         lx+Gvzn8Z1G/A6pg9rnrjis1Bh+m7iFL2BLoQsJI3JQBnBW1+9QURc7oK6pwP86UQ+4I
         bv/9z8+yk5GYeIObu6e4WXOdwdJ1nPbX9LNB8BuXqK7SVZTVnpOibFdZWaSJQ77JkKkf
         FVKzw2j9pCmFA7Ufk66d5GcyzMeBSLFmqeOPWR3MlmT7Mb8KUiyvJOaytc4tboFfrAWy
         g57cQG+k/ihpkB3mxhHFMyWl414dNqsBmYR4vUoO1qh+PATE3DM5DEI4XBZIUZIXHkWY
         bqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Nps3nttZguJ8BCD0NvcBimYy31g7NyHD2WV72x2rWLs=;
        b=ETNm1l4ytqaRMQpBxnIcEANa0OZG+HpdxUvaahfoLL0YI5hpcrtbpURi1Tp+N/8JZR
         O7LfbUePcBS06Hjmz9UCfti5MdBTIwZsZ+8qxoxNlrBoqENlikK0LsXwpMsoOSJsvCIm
         m0p2P/67PEvN5pOyykWkmxc13MqEVZvpacfloZcGalTbouT+3nytNCHtQtWsFg2Angj+
         0w0P1lOpXvf6ILsmtXRH2y7/nFCWc4srWpdfWI0s8TOFEsYLwihzRhshKjo96sbPoz4k
         9wBWsXEClYTtpEBHGFVb1ZFo/mlAIqej+sehx34A9rhF+ci/y8lojBkNwsrTXeNVJYvu
         FUzA==
X-Gm-Message-State: AOAM532nw/urEFsgocjmwhyqo7AzrKLObiKXy6wpWvl3LeYxw2JF/PWo
        m9WHv0p6/42snhFCpC6EYU+IAS9UEL8=
X-Google-Smtp-Source: ABdhPJzdMSR2iHItWodo7Bu1HRxq1zEW2JmCm7rT5HXh8mlSNUuxgSjlcM8R1zaHbOgEbpqbC0RWdA==
X-Received: by 2002:a05:651c:550:: with SMTP id q16mr20156382ljp.70.1619597105514;
        Wed, 28 Apr 2021 01:05:05 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id q9sm522412lfc.201.2021.04.28.01.05.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Apr 2021 01:05:05 -0700 (PDT)
Subject: Re: [PATCH v3 25/79] staging: media: vde: use
 pm_runtime_resume_and_get()
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     linuxarm@huawei.com, mauro.chehab@huawei.com,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org, linux-tegra@vger.kernel.org
References: <cover.1619519080.git.mchehab+huawei@kernel.org>
 <d7fb2d00224d37ba1c6c6e9b73609af95c886844.1619519080.git.mchehab+huawei@kernel.org>
 <2e8bdea5-b2a7-df95-9d93-7c1f2df6158d@gmail.com>
 <20210428092043.380c9d4c@coco.lan>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <433bd38c-aec9-a17e-35ca-8a6fca5fa5ef@gmail.com>
Date:   Wed, 28 Apr 2021 11:05:04 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210428092043.380c9d4c@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

28.04.2021 10:20, Mauro Carvalho Chehab пишет:
> Em Tue, 27 Apr 2021 14:47:01 +0300
> Dmitry Osipenko <digetx@gmail.com> escreveu:
> 
>> 27.04.2021 13:26, Mauro Carvalho Chehab пишет:
>>> @@ -1088,8 +1090,9 @@ static int tegra_vde_remove(struct platform_device *pdev)
>>>  {
>>>  	struct tegra_vde *vde = platform_get_drvdata(pdev);
>>>  	struct device *dev = &pdev->dev;
>>> +	int ret;
>>>  
>>> -	pm_runtime_get_sync(dev);
>>> +	ret = pm_runtime_resume_and_get(dev);  
>>
>> Should be cleaner to return error directly here, IMO.
> 
> I double-checked how drivers/base/platform.c deals with non-zero
> returns at the .remove method:
> 
> 	static int platform_remove(struct device *_dev)
> 	{
> 	        struct platform_driver *drv = to_platform_driver(_dev->driver);
> 	        struct platform_device *dev = to_platform_device(_dev);
> 	
> 	        if (drv->remove) {
> 	                int ret = drv->remove(dev);
> 	
> 	                if (ret)
> 	                        dev_warn(_dev, "remove callback returned a non-zero value. This will be ignored.\n");
> 	        }
> 	        dev_pm_domain_detach(_dev, true);
> 	
> 	        return 0;
> 	}
> 
> Basically, it will print a message but will ignore whatever happens
> afterwards.
> 
> So, if the driver is changed to return an error there, it will leak
> resources.

Indeed, thank you. But then the pm_runtime_get_sync() should be more
appropriate since this function is specifically made for such cases
where returned value is ignored.

A better option could be better to add a clarifying comment to the code
rather than to change it to a variant which introduces confusion, IMO.

