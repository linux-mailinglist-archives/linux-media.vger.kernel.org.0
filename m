Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B56819EDB4
	for <lists+linux-media@lfdr.de>; Sun,  5 Apr 2020 21:46:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728360AbgDETqA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Apr 2020 15:46:00 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:43308 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgDETqA (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Apr 2020 15:46:00 -0400
Received: by mail-lj1-f196.google.com with SMTP id g27so12340196ljn.10;
        Sun, 05 Apr 2020 12:45:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Md4abAgOZCcYQidA8I73EdVz57IzpvLOfwa6MGHSDhI=;
        b=NILcSVWxKZBKASc1smlAoatNtMQOzch4HoZdjxgCBmMvwvRUU9cmrs7nhXcPhq75Du
         38VDhyaGIRawXw/3S2CDo+b1rqIwbW+OPHJFmL2bYgKp8ZRxh/49hYQ8GHZcMueFcf6c
         lzIxI7AiZWtdb6J0F4ymm3A8+xB4Myzni8vtKa6aDNOjQS+wIOL1Nu0GCvkEsfDnncP5
         jWVujbUFDYawWk3yv5fxRrZWINSgG7rpEDUEahMbsydcTCL8r7Vmvwhs8qbZ4108A95Q
         f+j/aeSCegBsJbHmbZC81pH3/N0co2CNvEXyvuB3AXR95tPISP9XJLWSg12KE4+WxpUq
         zrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Md4abAgOZCcYQidA8I73EdVz57IzpvLOfwa6MGHSDhI=;
        b=QLOYkAS7YH6sDnipAGLRgk1j7C33398qiQt5QFKjR2l951fbsBm57yjC5206E9Ps+/
         y3G2fmPWnX3sl9Cf2k7g64D+v/aurnyTO0dxn1PmzBx3q2vqDA8fBqKb5LiPXyYNXR4K
         QQlSwZOf0JK9TNCR8Uf4XbHOrpw/1ObxBoxtKATILfGb3vNpIE7n47G+7pDkxGZqnNq0
         hosDyQfaD2ozgdMv4A3lagUa2IWdUW+5OqXprHuCc+oAJGwPxRqWYM/FxY5hO71Eq1KA
         bkj6R0A2TQpgulIJGUo6dKGZbAFMjzWj9nyqs6iRD4LNHH/rsXVXj3RqvaBWQEtyQVdF
         AsXQ==
X-Gm-Message-State: AGi0PubTQ3TfJlEYEFWbK0H9zut0YYpbgwSSCIE903saAOjX4uhpErzg
        lRwy2+wZ37Ni02U10mkbAt6m4X5f
X-Google-Smtp-Source: APiQypKnkKovGSYQ9FMpcOGhxxp2FUDd0svjIbvp0Ql0y1peMN/DKj5hGAnyFV7IPiWNwGaw7gzEtQ==
X-Received: by 2002:a2e:9dcf:: with SMTP id x15mr10412741ljj.106.1586115957860;
        Sun, 05 Apr 2020 12:45:57 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id r2sm10173492lfn.35.2020.04.05.12.45.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2020 12:45:57 -0700 (PDT)
Subject: Re: [RFC PATCH v6 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1585963507-12610-1-git-send-email-skomatineni@nvidia.com>
 <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3033ce67-fd77-f646-71b5-3a9671341a87@gmail.com>
Date:   Sun, 5 Apr 2020 22:45:56 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <1585963507-12610-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

04.04.2020 04:25, Sowjanya Komatineni пишет:
...
> +static int tegra_vi_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	struct tegra_vi *vi;
> +	int ret;
> +
> +	vi = kzalloc(sizeof(*vi), GFP_KERNEL);

devm_kzalloc()?

> +	if (!vi)
> +		return -ENOMEM;
> +
> +	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> +	vi->iomem = devm_ioremap_resource(&pdev->dev, res);

devm_platform_ioremap_resource()?

> +	if (IS_ERR(vi->iomem)) {
> +		ret = PTR_ERR(vi->iomem);
> +		goto cleanup;
> +	}
> +
> +	vi->soc = of_device_get_match_data(&pdev->dev);

This can't fail because match already happened.

> +	if (!vi->soc) {
> +		ret = -ENODATA;
> +		goto cleanup;
> +	}
> +
> +	vi->clk = devm_clk_get(&pdev->dev, NULL);
> +	if (IS_ERR(vi->clk)) {
> +		ret = PTR_ERR(vi->clk);
> +		dev_err(&pdev->dev, "failed to get vi clock: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	vi->vdd = devm_regulator_get(&pdev->dev, "avdd-dsi-csi");
> +	if (IS_ERR(vi->vdd)) {
> +		ret = PTR_ERR(vi->vdd);
> +		dev_err(&pdev->dev, "failed to get VDD supply: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	if (!pdev->dev.pm_domain) {
> +		ret = -ENOENT;
> +		dev_warn(&pdev->dev, "PM domain is not attached: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	ret = of_platform_populate(pdev->dev.of_node, NULL, NULL, &pdev->dev);
> +	if (ret) {
> +		dev_err(&pdev->dev,
> +			"failed to populate vi child device: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	vi->dev = &pdev->dev;
> +	vi->ops = vi->soc->ops;
> +	platform_set_drvdata(pdev, vi);
> +	pm_runtime_enable(&pdev->dev);
> +
> +	/* initialize host1x interface */
> +	INIT_LIST_HEAD(&vi->client.list);
> +	vi->client.ops = &vi_client_ops;
> +	vi->client.dev = &pdev->dev;
> +
> +	ret = host1x_client_register(&vi->client);
> +	if (ret < 0) {
> +		dev_err(vi->dev,
> +			"failed to register host1x client: %d\n", ret);
> +		ret = -ENODEV;
> +		goto rpm_disable;
> +	}
> +
> +	return 0;
> +
> +rpm_disable:
> +	pm_runtime_disable(&pdev->dev);
> +	of_platform_depopulate(vi->dev);
> +cleanup:
> +	kfree(vi);
> +	return ret;
> +}
> +
> +static int tegra_vi_remove(struct platform_device *pdev)
> +{
> +	struct tegra_vi *vi = platform_get_drvdata(pdev);
> +	int err;
> +
> +	pm_runtime_disable(vi->dev);
> +
> +	err = host1x_client_unregister(&vi->client);
> +	if (err < 0) {
> +		dev_err(vi->dev,
> +			"failed to unregister host1x client: %d\n", err);
> +		return err;
> +	}

The removal order should be opposite to the registration order.
