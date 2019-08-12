Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C79678A38D
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 18:42:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfHLQme (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 12:42:34 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35456 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726457AbfHLQme (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 12:42:34 -0400
Received: by mail-lj1-f195.google.com with SMTP id l14so8966120lje.2;
        Mon, 12 Aug 2019 09:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:from:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ozj3HWG6u6WFRMPDTuQbMffve34JSmH8p0q+ZkIw8XA=;
        b=kdTrnznY0ezwmK90LkssxTwtB4Fd8Cx3FNt5PqxgtfkoAL7kGnyrNFj5LUUmqjMoY2
         bLO3HJbyP+RuyCLuwIQK3TS4yblcNqm13U3EktOzREhNXejGO61zB5fmPQRwTjEtwjGT
         aABoMMF7biT8hXhaaXsyRDwsP24ALrslfudwMx4uEAIYS3So5FZ0+sX1BPepvSfpvxaS
         P3x2fQgTI/sPoIOS2NFigF5EJ7bEF2KinUM5+Exo+5fsjjXmdCGqmZMbNM5p/q7SNu+S
         liVtytDJ+Aq1MokyqNCJPTRdUBR6RNQxV3xkek+uuEWkqsTNPdTx8d5+zwBugPpNtZoL
         LCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ozj3HWG6u6WFRMPDTuQbMffve34JSmH8p0q+ZkIw8XA=;
        b=LYpninqUpLvts+yLYumg5qPbY/rf3leH1Vtfi9xyt1lQI5o/jeg0r0evna1Z9gRB9y
         0uAzEd0MabbKUhTAgZM7iyde4Lwq2H6Q3oaBeu2tUcjFq97Q5QEc8FbKGtO+sJanO2ns
         X/OxDP/gvfJNmVmqUCYzEZDgNYDl2Sm3j6Vf2ONe7D5D88Y4Xjq2FzgWH+a/Wmls/Vpm
         dMLlDYrJGmKvAXdMzAsFDKcxz0A2+yimI1VX5dqtc3m1M7b6wHB4Kfe7sxbicY95Dbtn
         5W0zxILFni3VAUANNDVJb3/LJ0Cc/HLQpL3wuSt/9D+KfOFHlLKj0gGYWjKbsYotIJao
         BGdQ==
X-Gm-Message-State: APjAAAVGKnzG/xnpwSSOMG+pHgs5Xjc0QfdiO+uU8xaHlXvKh3wFKlpf
        6QvgQFIr0CxU91QiYAvgwqaA1Eq2
X-Google-Smtp-Source: APXvYqwrsiBom6sXbAvtUH5ZNer8hQ/6TRxY2p8vbUytdt+kTSF8r3G6P2ijhZEelRwijvd+3RbMnA==
X-Received: by 2002:a2e:9819:: with SMTP id a25mr7054589ljj.99.1565628151275;
        Mon, 12 Aug 2019 09:42:31 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.34.218])
        by smtp.googlemail.com with ESMTPSA id e87sm24327081ljf.54.2019.08.12.09.42.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 09:42:30 -0700 (PDT)
Subject: Re: [PATCH v3] ARM: dts: tegra30: Connect SMMU with Video Decoder
 Engine
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-kernel@vger.kernel.org
References: <20190623170730.5095-1-digetx@gmail.com>
 <20190623170730.5095-2-digetx@gmail.com>
Message-ID: <e2dbeed2-7596-d687-d200-8f08dc267c83@gmail.com>
Date:   Mon, 12 Aug 2019 19:42:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190623170730.5095-2-digetx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

23.06.2019 20:07, Dmitry Osipenko пишет:
> Enable IOMMU support for the video decoder.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
> 
> No changes since v1.
> 
>  arch/arm/boot/dts/tegra30.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi
> index 934caa83c8db..ce162125e7bf 100644
> --- a/arch/arm/boot/dts/tegra30.dtsi
> +++ b/arch/arm/boot/dts/tegra30.dtsi
> @@ -424,6 +424,7 @@
>  		clocks = <&tegra_car TEGRA30_CLK_VDE>;
>  		reset-names = "vde", "mc";
>  		resets = <&tegra_car 61>, <&mc TEGRA30_MC_RESET_VDE>;
> +		iommus = <&mc TEGRA_SWGROUP_VDE>;
>  	};
>  
>  	apbmisc@70000800 {
> 

Hello Thierry,

Will be awesome if you could pick up this and [1][2] for v5.4. The rest of the VDE patches
are already applied by the media maintainers in linux-next, please note that [2] is required
to avoid problems caused by the notorious implicit IOMMU backing. Thanks in advance!

[1] http://patchwork.ozlabs.org/patch/1120864/
[2] http://patchwork.ozlabs.org/project/linux-tegra/list/?series=115608
