Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69C4A1C33D6
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 09:44:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgEDHoX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 03:44:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727088AbgEDHoX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 03:44:23 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4CE05C061A0E;
        Mon,  4 May 2020 00:44:21 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id f11so8712066ljp.1;
        Mon, 04 May 2020 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=e4Prdlmnh5uMplVy6wvzEHluFiUsOf4wHXUycuzMInI=;
        b=rc7VQyjWHiU8q8qd53Z+gt23a2bhQs1Im6BnZyZBhVh5XJ6EL6dKzE0iatghW6oR0H
         GL9eYKW6E7wbVT1gk9tepA8LjwnLXAcv+SyREN2WF6uyqARF0upWipHGR44MIPXI3tT/
         mC01pyqegP/i+P24L1gtiPXRDUY9PRP2p68Nb79PKEkKH2FoU5Eymqqwr38LstdpGTea
         KnOXiCfrxgYoURdxxy3lnKGl2x3v2lAnAtT/n/ON2L+UsmdX48dNiAmgiwDjljQHlFKL
         gLnETiVHjve/Ud4pkfvKYZ3gQy+oiTX8KFtF6ipQcDDlKuboY0l3Ay0Iq55aUi2YKhT3
         +KAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=e4Prdlmnh5uMplVy6wvzEHluFiUsOf4wHXUycuzMInI=;
        b=U6eK5sh2SJWR3r3+sTXiTveVOcSruTCsGfzwqfPi4XwsDXL9298kDs49WG1Rcy3jOE
         bZj43S0F2wVm558nfuqGjCuunPsjOyXAyW0inrgJlA78ns9udUBJ2ziyYAxw8XKYHFtC
         f749s+B1IHs/1yJA7jQ1WZ24foE8t0SaUC/2AX/hqcnpxjS3l5JUU2Gbo53pJmjqPgyc
         Qn6YwitwCe026eStLO5QjtA9VIoYDw4GVt3QX3q6TUu5SG2y56hfbSj1PC8FASF3KXV5
         0G+gp9Zk6G18R40IqiDxLD1ICV3D3QDrheKI6efieWrzUHt5Tx3regX5quXid3DH1hoK
         CBDg==
X-Gm-Message-State: AGi0PubOfSz82sLpR9rJ0V+SNTM9NFxGBUGfXm9Jmxu5HtRNiOiUwWZb
        fzMl1abpggZhkDTeRNhuzV9RY8K/
X-Google-Smtp-Source: APiQypJ8wNAZdGO/6Y4ZZsGPSt3WVOBD64UxuHEzeznj10Lv1Ffj/SWws8iZ49zH7gwc43OFr4X0OQ==
X-Received: by 2002:a2e:5813:: with SMTP id m19mr9144139ljb.230.1588578259413;
        Mon, 04 May 2020 00:44:19 -0700 (PDT)
Received: from [192.168.2.145] (ppp91-78-208-152.pppoe.mtu-net.ru. [91.78.208.152])
        by smtp.googlemail.com with ESMTPSA id y21sm7535417ljg.66.2020.05.04.00.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 May 2020 00:44:18 -0700 (PDT)
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
Message-ID: <f1cbb602-163e-a539-aaa5-c7e947a8945b@gmail.com>
Date:   Mon, 4 May 2020 10:44:17 +0300
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
> +/*
> + * VI channel input data type enum.
> + * These data type enum value gets programmed into corresponding Tegra VI
> + * channel register bits.
> + */
> +enum tegra_image_dt {
> +	TEGRA_IMAGE_DT_YUV420_8 = 24,
> +	TEGRA_IMAGE_DT_YUV420_10,
> +
> +	TEGRA_IMAGE_DT_YUV420CSPS_8 = 28,
> +	TEGRA_IMAGE_DT_YUV420CSPS_10,
> +	TEGRA_IMAGE_DT_YUV422_8,
> +	TEGRA_IMAGE_DT_YUV422_10,
> +	TEGRA_IMAGE_DT_RGB444,
> +	TEGRA_IMAGE_DT_RGB555,
> +	TEGRA_IMAGE_DT_RGB565,
> +	TEGRA_IMAGE_DT_RGB666,
> +	TEGRA_IMAGE_DT_RGB888,
> +
> +	TEGRA_IMAGE_DT_RAW6 = 40,
> +	TEGRA_IMAGE_DT_RAW7,
> +	TEGRA_IMAGE_DT_RAW8,
> +	TEGRA_IMAGE_DT_RAW10,
> +	TEGRA_IMAGE_DT_RAW12,
> +	TEGRA_IMAGE_DT_RAW14,
> +};

Are these format IDs common to all Tegra SoCs or they unique to T210?
