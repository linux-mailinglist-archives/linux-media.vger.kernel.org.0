Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 52C9919EDC3
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 21:58:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727775AbgDET57 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 15:57:59 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:40692 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727356AbgDET56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 15:57:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id 19so12388753ljj.7;
        Sun, 05 Apr 2020 12:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rW/FgGrJHEIG++1Cn/Qqvz0BICOsoIaSxunR/lYMMEk=;
        b=LuQN2xoIp7OJJPSgBXY6FIElIIHRmkb3tTXaNJ8/vbXSkfnAnci7pKAttoeQWHFeL2
         RDfKL77HZIi8S0EQljX319amjshvUo1iYuuIbBhV0fNewRHfRx+p6iqsibP44XbFAVEa
         PnXbalw46LS/6jHKNg5wmEnCtRXMR1dRZEm7rPxwQpHOqxsathSB7Dvg5kiRRwkU3n4C
         WLUxj+5ygdnbsmcgVB3rjdw5TUzs+F7/DhOzoC0Gp14Pr53paFax5aBbaEa09g7vTLtb
         ppK4PZirWk3IIcMLORzFc6pe7OlyBXbmX8fU0+0AcFjVlnOsG+gnlvkAOnANVTV3uU1J
         BIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rW/FgGrJHEIG++1Cn/Qqvz0BICOsoIaSxunR/lYMMEk=;
        b=huK88qSonygZ0m2/YPPloeW2L017p11ofy30T8rSYWGuwH1fHXp9I898C9BGmnqPlp
         NWufK8aqYwq+IC19CQ/H05hDPC/PWoLBbeKQZWFoD5H5mM4herpSzxTRRe1jukeRmNPg
         QDS524guq/6hDg95UT6XuMMPA/OF0vkRn6/OUe25BYNyjUojQCa0n/+qc7tTx3gdDxuc
         8FyJjs+xehA31QSMooyZ2fcayfx7BDR2h0aacY25t+9O8cS9t4lL1rkGigxBva9CEQrP
         deeREOaTXdGGgaVOYZHnspGoMeiIM6vqyph5oTbjR5HiDwTp4AIS8z1zyPRUwBbSGTbJ
         4WfQ==
X-Gm-Message-State: AGi0PuaucxHnKQ5sTn0/cjY6rUD2IhFXks2r0HPMdTKAxB2yTPRQj0Ef
        y/cFNZ8Mc+FwbA/UXyx/guvx6gAp
X-Google-Smtp-Source: APiQypKCCzIx6TnA1PnJ3Br33yvu1xx+M8S/fDkMrQ9v3K9cUytuaTLh0cvOmu/4eyvEePkmu1kEWg==
X-Received: by 2002:a2e:9789:: with SMTP id y9mr9821274lji.207.1586116674820;
        Sun, 05 Apr 2020 12:57:54 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id c13sm8792607ljj.37.2020.04.05.12.57.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2020 12:57:54 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
 <3033ce67-fd77-f646-71b5-3a9671341a87@gmail.com>
Message-ID: <4545a0f5-8f52-37d3-7237-8d8dcb846926@gmail.com>
Date:   Sun, 5 Apr 2020 22:57:52 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <3033ce67-fd77-f646-71b5-3a9671341a87@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

05.04.2020 22:45, Dmitry Osipenko пишет:
> 04.04.2020 04:25, Sowjanya Komatineni пишет:
> ...
>> +static int tegra_vi_probe(struct platform_device *pdev)
>> +{
>> +	struct resource *res;
>> +	struct tegra_vi *vi;
>> +	int ret;
>> +
>> +	vi = kzalloc(sizeof(*vi), GFP_KERNEL);
> 
> devm_kzalloc()?
> 
>> +	if (!vi)
>> +		return -ENOMEM;
>> +
>> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
>> +	vi->iomem = devm_ioremap_resource(&pdev->dev, res);
> 
> devm_platform_ioremap_resource()?
> 
>> +	if (IS_ERR(vi->iomem)) {
>> +		ret = PTR_ERR(vi->iomem);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->soc = of_device_get_match_data(&pdev->dev);
> 
> This can't fail because match already happened.
> 
>> +	if (!vi->soc) {
>> +		ret = -ENODATA;
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->clk = devm_clk_get(&pdev->dev, NULL);
>> +	if (IS_ERR(vi->clk)) {
>> +		ret = PTR_ERR(vi->clk);
>> +		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
>> +	if (IS_ERR(vi->vdd)) {
>> +		ret = PTR_ERR(vi->vdd);
>> +		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	if (!pdev->dev.pm_domain) {
>> +		ret = -ENOENT;
>> +		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
>> +	if (ret) {
>> +		dev_err(&pdev->dev,
>> +			"failed to populate vi child device: %d\n", ret);
>> +		goto cleanup;
>> +	}
>> +
>> +	vi->dev = &pdev->dev;
>> +	vi->ops = vi->soc->ops;
>> +	platform_set_drvdata(pdev, vi);
>> +	pm_runtime_enable(&pdev->dev);
>> +
>> +	/* initialize host1x interface */
>> +	INIT_LIST_HEAD(&vi->client.list);
>> +	vi->client.ops = &vi_client_ops;
>> +	vi->client.dev = &pdev->dev;
>> +
>> +	ret = host1x_client_register(&vi->client);
>> +	if (ret < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to register host1x client: %d\n", ret);
>> +		ret = -ENODEV;
>> +		goto rpm_disable;
>> +	}
>> +
>> +	return 0;
>> +
>> +rpm_disable:
>> +	pm_runtime_disable(&pdev->dev);
>> +	of_platform_depopulate(vi->dev);
>> +cleanup:
>> +	kfree(vi);
>> +	return ret;
>> +}
>> +
>> +static int tegra_vi_remove(struct platform_device *pdev)
>> +{
>> +	struct tegra_vi *vi = platform_get_drvdata(pdev);
>> +	int err;
>> +
>> +	pm_runtime_disable(vi->dev);
>> +
>> +	err = host1x_client_unregister(&vi->client);
>> +	if (err < 0) {
>> +		dev_err(vi->dev,
>> +			"failed to unregister host1x client: %d\n", err);
>> +		return err;
>> +	}
> 
> The removal order should be opposite to the registration order.
> 

All the same to the tegra_csi, btw.
