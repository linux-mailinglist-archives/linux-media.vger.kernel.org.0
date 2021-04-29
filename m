Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A3D136EA8F
	for <lists+linux-media@lfdr.de>; Thu, 29 Apr 2021 14:34:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233011AbhD2Meu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Apr 2021 08:34:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231490AbhD2Met (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Apr 2021 08:34:49 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213A2C06138B;
        Thu, 29 Apr 2021 05:34:03 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id z13so23555854lft.1;
        Thu, 29 Apr 2021 05:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=;
        b=pSAPQilu7n+6xTr9GdEG0tb6PJM12QM070qCxvHnWCIze3Gcr+Y1X+IbvGDtRxTUgM
         EyOOFTxf9hWQBlaRIuLofOaQebEe5v0gWxDauGIRIaLBxzQZQULJfZHJUKxGdkb10gkc
         nD1wHPGKwDBP5o9agABg3XnIArwOCYPQSKMjVhR3w59xhvXls6FFml/j10Pwe9czFo6Z
         T7faf5Qfz88VW86L60gbzCGia3II+upwMhl4urxCbGztadHzxAw5ZUEZZpuSIrEqgrti
         aMKp0DRksQp+N/9uThNAeaKzsoGRnRjp6oHq0CgRtj1ykP9X5KS4ubBguxOUwo/dtsF4
         c+pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+fbOj539U7JlJxKx94jCmhZjY1EaeG6hVLe/OeyW9BA=;
        b=NBZ6qrisZK+r/r0egW/szwjs5QHeDlkgBqldSV+slLEvVkjSX8aJY3H28isfeDdx7T
         njZDSLltdHIQZiiKnI5TVd0FYOfsYXFhgYF34BRq52KQe+BXh9DfjIF4wHGjjUvewOAs
         iiD4Zdnaai7T01uAJ2+UGcdqtItK14M7tY79FTH+Kj6yaRbyzKYEZ39J6y+X5jfsVK/S
         RjIgNfbFJImG7targ4SJT81Bqvu358EYtIA67eYZvHUpXUOi/7hL/ZPE8bUUwcUKWS8X
         ZAMOrl6/yMI0DUv+EAxqXZxzItEaYbiAJ4cO1PdADeqeRwMUQnjj37TltuTkgPshtP7l
         /wCQ==
X-Gm-Message-State: AOAM530QECKQsA7rIOeBVAEGH00SJbcCpLFv/Lw5CO0pZkGEUFMSllkv
        0/WZEkA87ftyUlHrDUIqVMo=
X-Google-Smtp-Source: ABdhPJxNUnx9qkfhLC3V1HtbXkiFpJiCYsEDSOon3AoeX+SG0EchdE86xX8g0E/VEPlskxpayZqx+w==
X-Received: by 2002:a19:ad41:: with SMTP id s1mr24627108lfd.306.1619699641558;
        Thu, 29 Apr 2021 05:34:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-102.dynamic.spd-mgts.ru. [109.252.193.102])
        by smtp.googlemail.com with ESMTPSA id n7sm515001lft.65.2021.04.29.05.33.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Apr 2021 05:34:01 -0700 (PDT)
Subject: Re: [PATCH v4 00/79] Address some issues with PM runtime at media
 subsystem
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Johan Hovold <johan@kernel.org>
Cc:     Shawn Tu <shawnx.tu@intel.com>,
        Ricardo Ribalda <ribalda@kernel.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>, linuxarm@huawei.com,
        Todor Tomov <todor.too@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        linux-stm32@st-md-mailman.stormreply.com,
        Andrzej Pietrasiewicz <andrzejtp2010@gmail.com>,
        Leon Luo <leonl@leopardimaging.com>,
        Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Matt Ranostay <matt.ranostay@konsulko.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-rockchip@lists.infradead.org, Chen-Yu Tsai <wens@csie.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Shunqian Zheng <zhengsq@rock-chips.com>,
        Tianshu Qiu <tian.shu.qiu@intel.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        devel@driverdev.osuosl.org, Jacopo Mondi <jacopo@jmondi.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        linux-tegra@vger.kernel.org,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Wenyou Yang <wenyou.yang@microchip.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        linux-arm-msm@vger.kernel.org,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media@vger.kernel.org, Maxime Ripard <mripard@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Benoit Parrot <bparrot@ti.com>,
        Helen Koike <helen.koike@collabora.com>,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        mauro.chehab@huawei.com,
        Sylwester Nawrocki <sylvester.nawrocki@gmail.com>,
        "Paul J. Murphy" <paul.j.murphy@intel.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Daniele Alessandrelli <daniele.alessandrelli@intel.com>,
        Chiranjeevi Rapolu <chiranjeevi.rapolu@intel.com>,
        linux-arm-kernel@lists.infradead.org,
        Jacob Chen <jacob-chen@iotwrt.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Hyungwoo Yang <hyungwoo.yang@intel.com>,
        linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
        Dan Scally <djrscally@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        linux-renesas-soc@vger.kernel.org, Yong Zhi <yong.zhi@intel.com>,
        Shawn Guo <shawnguo@kernel.org>
References: <cover.1619621413.git.mchehab+huawei@kernel.org>
 <YImEMN/POW5C8lG7@hovoldconsulting.com> <20210429121215.64a7cbdb@coco.lan>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <de636a0a-3fd7-d61e-c361-fa50a6d34f17@gmail.com>
Date:   Thu, 29 Apr 2021 15:33:59 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429121215.64a7cbdb@coco.lan>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

29.04.2021 13:18, Mauro Carvalho Chehab пишет:
>> This is perfectly alright. Take a look at ov7740_remove() for example:
>>
>> 	pm_runtime_get_sync(&client->dev);
>> 	pm_runtime_disable(&client->dev);
>> 	pm_runtime_set_suspended(&client->dev);
>> 	pm_runtime_put_noidle(&client->dev);
>> 	
>> 	ov7740_set_power(ov7740, 0);
>>
>> There's an explicit power-off after balancing the PM count and this will
>> work regardless of the power state when entering this function.
> Ok, but this should equally work:
> 
>  	pm_runtime_disable(&client->dev);
>  	pm_runtime_set_suspended(&client->dev);
>  	
>  	ov7740_set_power(ov7740, 0);
> 
> as there's no additional cleanup made on this particular driver
> between pm_runtime_get_sync() and pm_runtime_put_noidle().
> 

The pm_runtime_get_sync() turns hardware ON by invoking
ov7740_set_power(ov7740, 1), and thus, the ON->OFF is kept balanced in
both RPM-available and RPM-unavailable cases. The RPM state of device
should be reset after driver removal.

It doesn't look like any additional cleanups are needed by that ov7740
driver. The driver removal is opposite to the probe, hence it should be
correct as-is.
