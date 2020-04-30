Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 275A41BF9A0
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727802AbgD3Nez (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:34:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726685AbgD3Ney (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:34:54 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E66FC035494;
        Thu, 30 Apr 2020 06:34:54 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id f11so6540113ljp.1;
        Thu, 30 Apr 2020 06:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=fCQ3rEpE5jQHFq26jG3Uzev2rOHW4jFOBpkkcGSf+aI=;
        b=nVAIx27ki5G+TMmHDPTsuP61ioX7yieaJw4ochVVtSlwbseqOqSIFuOYpzNVJ1b9t0
         UqIulYybPWYhL7U2kRXVy88J9GH7/SPXy/Gu3/n3WGdj2apwn4QlsbPSpcsiRLQGuoFH
         YGJUtI5d6ybUNcERa6kGRfmn6gJok3vZsmPBGIVM+cEZ5cfwXcBESEmpZMkVbZBWHT4t
         Hum1AYt40hOvHBvOpJiYw1tXWJgWQ1K27VIW4QHdep3DISYQKT1ox26VFXqre5d8u3aY
         uYcBgMidlmAra67srG8dPxksuoY5Nlotks3+2LBru5tUKKfWNdbRNGhtkptGoSgq4zF8
         MBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fCQ3rEpE5jQHFq26jG3Uzev2rOHW4jFOBpkkcGSf+aI=;
        b=r+4fxRBsSO2u9GW7Xo7N1IFyFH2mn59qAENe4UUEk0GG5L1knPaI1YQFf6dLJhybnI
         Se1S6IirtldNXmh38zbvUOfZcV83VfVe6xpismEYCGOP5VjAUb1Clq9xBwfPR6Ne+R3d
         /qbOG+5TtBMG1QVrs07odBaCIExmHvcPZkUM6hoxLQ3gmVuMbha5nnn3FKua3E2HCsx1
         QowsIsdf7uWg2QUa7XRy8SEL0GwJ50IgvoM8Ttcr3CnSxjrnjm0xDMfWjPLjLCM0ovp7
         PmMCQN8Fb617Z6ZEDZDjR0Y+l2LEmgPiaoPuqLHm0+b51VrbUuGBCJ/9ErOGmZIGSuJ4
         Qfog==
X-Gm-Message-State: AGi0PuZGFK/OLuD5fEl8xTWhrpCpmdWF0N4wyT//MTtrOXKW8d3nJ8+C
        01I0xEFmn6TQvuW8axWVes+xIQSw
X-Google-Smtp-Source: APiQypKwRQ8qpaW2NliuGwwjM4IpowpPy3uwLgkBVIs12DIw0YuuwLuRDpkUTKJeub/QxzKZisSpbQ==
X-Received: by 2002:a2e:87d0:: with SMTP id v16mr2163032ljj.137.1588253692311;
        Thu, 30 Apr 2020 06:34:52 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id g11sm4373852ljg.24.2020.04.30.06.34.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2020 06:34:51 -0700 (PDT)
Subject: Re: [RFC PATCH v11 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588197606-32124-1-git-send-email-skomatineni@nvidia.com>
 <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <18d457dd-17cb-633e-cdec-e0abfe73b0b0@gmail.com>
Date:   Thu, 30 Apr 2020 16:34:50 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1588197606-32124-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

30.04.2020 01:00, Sowjanya Komatineni пишет:
> +static int tegra_csi_init(struct host1x_client *client)
> +{
> +	struct tegra_csi *csi = host1x_client_to_csi(client);
> +	struct tegra_video_device *vid = dev_get_drvdata(client->host);
> +	int ret;
> +
> +	INIT_LIST_HEAD(&csi->csi_chans);
> +
> +	ret = tegra_csi_tpg_channels_alloc(csi);
> +	if (ret < 0) {
> +		dev_err(csi->dev,
> +			"failed to allocate tpg channels: %d\n", ret);
> +		goto cleanup;
> +	}
> +
> +	ret = tegra_csi_channels_init(csi);
> +	if (ret < 0)
> +		goto cleanup;
> +
> +	vid->csi = csi;
> +
> +	return 0;
> +
> +cleanup:
> +	tegra_csi_channels_cleanup(csi);
> +	pm_runtime_put_sync(csi->dev);

This pm_runtime_put_sync() should be removed.

> +	return ret;
> +}

