Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADF5B24730C
	for <lists+linux-media@lfdr.de>; Mon, 17 Aug 2020 20:50:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403910AbgHQSu2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 17 Aug 2020 14:50:28 -0400
Received: from mail-ed1-f67.google.com ([209.85.208.67]:44878 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387923AbgHQPxf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 17 Aug 2020 11:53:35 -0400
Received: by mail-ed1-f67.google.com with SMTP id l23so12657593edv.11;
        Mon, 17 Aug 2020 08:53:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4fPSndx01WGVW2peKcNb1PP5QDdXb8VrSdxpcJHMQVM=;
        b=SdIi1LFHb0nh2u4gjR00iAR/frM6pVnO48R8H/bkmhCzd8WwEyz+xjF+s2IIYQMtde
         +9o3hxhA7NCFQ/uuQbA5y+VLG8CGi5bMMWYT2TZHDrhhXsOmjiuLWtYGqSot6gOd0B/R
         SX/0Go0F8rDw+1ZHFGfQyq24i2RQlkkBvHZAr4aDsyy2qm4umdUHXTK+PO6d1cuvXW2e
         h5eFHNOSPRT6z753ADDZc6TWq4GH+X9J/7QrXW2JX4rjdO8zrsLDHJKOOZh13wue9KDR
         OMlXRqlKCG6CuhGzeovrVJ0aa1tDY/Ivw3Efu3ppqpXpEQdfxsRtIYfiunsUlm6couyy
         BmkQ==
X-Gm-Message-State: AOAM531oEFEh59tNkXhxSUrK35TXc7195AovDEH3emUB6FG3pk1kkmBi
        u5uygkRdNIFTQz3dJMIDker0EMkaXQHfIYOP
X-Google-Smtp-Source: ABdhPJzcdTwfPoH2lTHFsuT+lYrd3SxyrdMHXbbTdfVvdAfCWHv2qUVb1BrpiYrmWYT6ovVBrKubOw==
X-Received: by 2002:a50:ba8c:: with SMTP id x12mr15957292ede.319.1597679613859;
        Mon, 17 Aug 2020 08:53:33 -0700 (PDT)
Received: from kozik-lap ([194.230.155.216])
        by smtp.googlemail.com with ESMTPSA id c5sm14476122ejb.103.2020.08.17.08.53.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 08:53:33 -0700 (PDT)
Date:   Mon, 17 Aug 2020 17:53:31 +0200
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Marek Szyprowski <m.szyprowski@samsung.com>
Cc:     linux-media@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
        Sylwester Nawrocki <snawrocki@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] ARM: exynos_defconfig: enable platform media drivers
Message-ID: <20200817155331.GE15887@kozik-lap>
References: <CGME20200807102119eucas1p21c07d7e8f24ca4e7e2b28b2e8216ff28@eucas1p2.samsung.com>
 <20200807102103.30796-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200807102103.30796-1-m.szyprowski@samsung.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Aug 07, 2020 at 12:21:03PM +0200, Marek Szyprowski wrote:
> Commit 06b93644f4d1 ("media: Kconfig: add an option to filter in/out
> platform drivers") introduced a dependency of all platform media drivers
> on the new CONFIG_MEDIA_PLATFORM_SUPPORT symbol, so add it also to
> exynos_defconfig. While touching this part, update the media related
> configs to the current layout.
> 
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>  arch/arm/configs/exynos_defconfig | 8 ++++----

Thanks, applied.

Best regards,
Krzysztof

