Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABD91B8A01
	for <lists+linux-media@lfdr.de>; Sun, 26 Apr 2020 01:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726346AbgDYX3M (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 25 Apr 2020 19:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726271AbgDYX3M (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 25 Apr 2020 19:29:12 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8761C061A0C;
        Sat, 25 Apr 2020 16:29:11 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id g10so10713170lfj.13;
        Sat, 25 Apr 2020 16:29:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uUmIclMlYVTRQ0AH98CQR2SVPnCjdFss7aD8R0Frm1Y=;
        b=Pc7sphNfT8aH7gdSj8s17XDIF7utZ1Gt+iOWNmgqfAq074bei1rn6OQXXRC6lt/Iny
         EantFkZlcM6SHrV7CJmd6uOMtyu5rzLhRCGZ125ZKikKoF4BP2/Yz2v5P22s1TGocfB2
         QCW6d45Kx+jZrn5gQiXivh2VikCvoMfH2ZwWoJPS3M3WAM/Yhm2RlJVdLPdjI0YwRAE6
         5ry/S4HxYq60YlZbvKfOwP0CxeFCN3X8oK+UPWnZBGFlLrbrXK+bM4QBUoLzfbKpo6km
         9w+tUMZBNpiaHenBdOM06llF3sUgaw8tmQjliv6iDJpygWpg9bjgf5Gsyd7IRmWb49QW
         HGAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uUmIclMlYVTRQ0AH98CQR2SVPnCjdFss7aD8R0Frm1Y=;
        b=iy1wtr777XHLY0i/AvL4hR92YIPJeAMmGAeoODrAiva8bnUpy6KrfokUaYUZuljz7Q
         Qz75c3kyhng/Ih1y5sxKxyPUceW8LMsFCoGrQwOBBzPBBa4eOD42UicAmJC6fEAjSd6F
         H4J49NrpLhv3exc2gLPv/jLNZZGyEwFtMMbZUY2OxvwLN2DkpHB72q1k4FQ1w2SPt6s0
         kZHq4W/njf3EUxLjxXfXT50qUtM5ZwCN3vG7JILJrr0oN0sC87xCp7AKqE/TD8HIyqMf
         QdQ37V6W0k/vEGIR293EVWkfVgfVpDSc8x/xPuvYK6plBwkC1M+S8cZUFiAQwyyRMUNA
         FvRg==
X-Gm-Message-State: AGi0PuaawKAdkPFIcdN44xndbvgtRXG96+OgXbP/B6+WTlKeBIj0ieWm
        TKZGmwGyhJZdEufMi8JRK691mtxP
X-Google-Smtp-Source: APiQypJqOSUWVUmRmaSc984aIBzcofS/QZwU+9/r2vadTsuZ/TLJ4POjQU2jlZCmz1ucz3qFWgtPKA==
X-Received: by 2002:ac2:4257:: with SMTP id m23mr10696394lfl.141.1587857348353;
        Sat, 25 Apr 2020 16:29:08 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id b25sm6651319ljp.105.2020.04.25.16.29.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2020 16:29:07 -0700 (PDT)
Subject: Re: [RFC PATCH v10 6/9] media: tegra: Add Tegra210 Video input driver
To:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, frankc@nvidia.com,
        hverkuil@xs4all.nl, sakari.ailus@iki.fi, helen.koike@collabora.com
Cc:     sboyd@kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1587700513-28449-1-git-send-email-skomatineni@nvidia.com>
 <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <ae7a4614-c84c-f5dd-d0a5-4090e1bf5a9d@gmail.com>
Date:   Sun, 26 Apr 2020 02:29:06 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <1587700513-28449-7-git-send-email-skomatineni@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

24.04.2020 06:55, Sowjanya Komatineni пишет:
> +static int tegra_csi_init(struct host1x_client *client)
> +{
> +	struct tegra_csi *csi = host1x_client_to_csi(client);
> +	struct tegra_video_device *vid = dev_get_drvdata(client->host);
> +	int ret;
> +
> +	INIT_LIST_HEAD(&csi->csi_chans);
> +
> +	ret = pm_runtime_get_sync(csi->dev);
> +	if (ret < 0) {
> +		dev_err(csi->dev, "failed to get runtime PM: %d\n", ret);
> +		pm_runtime_put_noidle(csi->dev);
> +		return ret;
> +	}

The whole point of RPM is to keep hardware enabled only when needed,
i.e. during of the capture process in this case. You should move all RPM
handling to the capture start / stop functions.
