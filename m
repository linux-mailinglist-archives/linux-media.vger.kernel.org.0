Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BAFE0467894
	for <lists+linux-media@lfdr.de>; Fri,  3 Dec 2021 14:39:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381081AbhLCNmX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 3 Dec 2021 08:42:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239175AbhLCNmU (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 3 Dec 2021 08:42:20 -0500
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 477EBC061757
        for <linux-media@vger.kernel.org>; Fri,  3 Dec 2021 05:38:56 -0800 (PST)
Received: by mail-ed1-x52e.google.com with SMTP id r11so11562995edd.9
        for <linux-media@vger.kernel.org>; Fri, 03 Dec 2021 05:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=jZ0k65IEv+mkTjXj+Hsssr+TTC6PuB+uri2MNkshlgg=;
        b=QdEZ/4DlPgf5qAJIhxS4IiSzj47x69iMSbtz+4keNZevkJKHBOQ6KaXs+ONRRpGca4
         eLfvjCq4/SdlnzYvfJgbw8xWtg/stWatgwswPL+eJ+PjKhoD64Q9NPb+IiJCAujLdP86
         BsS13GIC/MJa61NY5ljnuOssYsukUWJjZiYlk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=jZ0k65IEv+mkTjXj+Hsssr+TTC6PuB+uri2MNkshlgg=;
        b=2kfLw9N8aQMd/+cTCpjILWrRqfuCnug5TUCLPpLNh2i3HMbBfl6tGnMtFDsqbfhngN
         vUloMawY2QtxRyvElb0TbGUPry4ziqPVqB6Ptr7XuJqo42XsV0/riUnLy/mgBnPDR2RW
         s3Q+CeumJw3d6GdiNp8d5Vef6G2sK3RU1Ny2CBwroPcMgxAa8wKp18NYMzhQa/zMpBiE
         FoEPlmcfW6yC5J1VeJmYvLrpi70CyWbfL6sXGDF/0jQAUUxacvKVbe0+zdg2w8FssHyK
         3ZQ2aZdTYTLGDWYQC199ZFFaev/W8A/eDK3o9DDzjGiiyYHeKQ2WNrxr0A3kUX7bQRhA
         O9Rg==
X-Gm-Message-State: AOAM533OmLLqcJ0fjmE+Q3v2/j1NSkVjO0EvKh0POq9TfzW9UDi/Fa76
        zNUX2GSyNxDzyb6+39XJ2c+ztQ==
X-Google-Smtp-Source: ABdhPJzuITPnpzlSsz+9aNcFmFcrY+OtVEN7ewcsLzPDRrY8OL090gK8pD8o0pIwVC2mE1Ynmj9yMg==
X-Received: by 2002:a05:6402:2809:: with SMTP id h9mr26838816ede.351.1638538734105;
        Fri, 03 Dec 2021 05:38:54 -0800 (PST)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id s2sm2246751ejn.96.2021.12.03.05.38.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Dec 2021 05:38:53 -0800 (PST)
Date:   Fri, 3 Dec 2021 14:38:35 +0100
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com,
        irui.wang@mediatek.com
Subject: Re: [PATCH V6, 0/5] Support multi-hardware jpeg encoding using
 of_platform_populate
Message-ID: <Yaod22NaGQveuevu@gmail.com>
References: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com>
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi

Any idea why this series is not available at
https://patchwork.linuxtv.org/ but it exists in 
https://lore.kernel.org/all/1638501230-13417-1-git-send-email-kyrie.wu@mediatek.com/#r

thanks!

kyrie.wu wrote:

> This series adds support for multi hardware jpeg encoding, by first
> adding use of_platform_populate to manage each hardware information:
> interrupt, clock, register bases and power. Secondly add encoding 
> work queue to deal with the encoding requestsof multi-hardware
> at the same time. Lastly, add output picture reorder function
> interface to eliminate the out of order images.
> 
> This series has been tested with both MT8195.
> Encoding worked for this chip.
> 
> Patches 1~2 use of_platform_populate to replace component framework
> to manage multi-hardware.
> 
> Patch 3 add jpeg encoding timeout function to judge hardware timeout.
> 
> Patch 4 add encoding work queue to deal with multi-hardware encoding
> at the same time.
> 
> Patch 5 add output picture reorder function to order images.
> ---
> Changes compared with v5:
> - use of_platform_populate to replace component framework to
> manage multi-hardware in patch 2.
> 
> Changes compared with v4:
> --No change compaered with v4
> 
> Changes compared with v3:
> --Structure patches for consistency, non-backward
>   compatible and do not break any existing functionality
> 
> Changes compared with v2:
> --Split the last two patches into several patches
>   to enhance readability
> --Correct some syntax errors
> --Explain why the component framework is used
> 
> Changes compared with v1:
> --Add jpeg encoder dt-bindings for MT8195
> --Use component framework to manage jpegenc HW
> --Add jpegenc output pic reorder function interface
> 
> kyrie.wu (5):
>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: manage jpegenc multi-hardware
>   media: mtk-jpegenc: add jpegenc timeout func interface
>   media: mtk-jpegenc: add jpeg encode worker interface
>   media: mtk-jpegenc: add output pic reorder interface
> 
>  .../bindings/media/mediatek-jpeg-encoder.yaml      |   3 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c    | 287 +++++++++++++++----
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.h    |  91 +++++-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.c  |   1 +
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_dec_hw.h  |   3 +-
>  drivers/media/platform/mtk-jpeg/mtk_jpeg_enc_hw.c  | 316 ++++++++++++++++++++-
>  6 files changed, 644 insertions(+), 57 deletions(-)
> 
> -- 
> 2.6.4
> 
> 
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
> 
