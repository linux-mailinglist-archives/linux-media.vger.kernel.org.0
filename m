Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C96C2CE98C
	for <lists+linux-media@lfdr.de>; Fri,  4 Dec 2020 09:28:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729074AbgLDI2A (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 4 Dec 2020 03:28:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727056AbgLDI2A (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 4 Dec 2020 03:28:00 -0500
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D45DC061A51
        for <linux-media@vger.kernel.org>; Fri,  4 Dec 2020 00:27:19 -0800 (PST)
Received: by mail-ed1-x543.google.com with SMTP id d18so4933593edt.7
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 00:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ruXnnoPhLWZefsxaYBBLcufmNUTnKI++ZsmmBsbkXoQ=;
        b=AIGmeqXFKWcMnd0CaRU7VGuoQ6uBtBfpY0HjtA4OlX5XB4+riFjIuqIqjw+qhiIQU1
         ghVGolqoPjd0pIoGJK+8cd8NuK/XGB7lZZu5NYhaeNAHLXadSXamoDFGSCxfvafBujwV
         Cp4UGESm8DOKaEuzzdYKxBgK/jpCkaC0koh3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ruXnnoPhLWZefsxaYBBLcufmNUTnKI++ZsmmBsbkXoQ=;
        b=ChsjeKRPbdkCyH5pZpusWv00kA+4yXUvYc7LLawj89jGUpBwpcXAAUyoQfM/FIfITg
         0SueAtSAxvf5R1pQs99VJ+ncTmrMH7eDOQWyl0o+sriGFoRe5pK1rVTqrDc7PRQyIdQf
         TVeiVUQvIHq46IJZpw00XAX0B/Dlrpr09vL7BLmgha5jivcfbc+zwW+1SFEDUY4CKu7p
         Z8SM3BEBzRfKOoIrP0DwZLCylaA9OzyhLwpT2t+ouJ3frunn2IUGwTRjo8M2jit46hmf
         9tUv3dwRcXzs7tZTLygw0C61KqQ6PI0erpDriDX8YrrEwM/z1awJpZ20cA6+Uob/94kB
         jA9w==
X-Gm-Message-State: AOAM531vH91U5oTj1WG23hK+U6cdFWlZFWwDFIi6uO8XzDXVxPw3DoGr
        xQEv8jCBi17xtEtmqilv6LHUIm6No5KUbg==
X-Google-Smtp-Source: ABdhPJxVipx5OcwjBp/z49qUYoRQ3FszzKAhKvLRNEqyNtpCbnsroE06gXsSFW/E2QB8Zct4t5FlcA==
X-Received: by 2002:a50:ed17:: with SMTP id j23mr6545041eds.218.1607070437442;
        Fri, 04 Dec 2020 00:27:17 -0800 (PST)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com. [209.85.208.47])
        by smtp.gmail.com with ESMTPSA id 2sm2550938ejw.65.2020.12.04.00.27.15
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Dec 2020 00:27:15 -0800 (PST)
Received: by mail-ed1-f47.google.com with SMTP id v22so4936419edt.9
        for <linux-media@vger.kernel.org>; Fri, 04 Dec 2020 00:27:15 -0800 (PST)
X-Received: by 2002:a50:99dd:: with SMTP id n29mr6739912edb.259.1607070434703;
 Fri, 04 Dec 2020 00:27:14 -0800 (PST)
MIME-Version: 1.0
References: <20201203231505.1483971-1-arnd@kernel.org>
In-Reply-To: <20201203231505.1483971-1-arnd@kernel.org>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 4 Dec 2020 17:26:59 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUNsoQ76hi618G6i0djBoRzVvYKkTd8PovNQRacZ06LWA@mail.gmail.com>
Message-ID: <CAPBb6MUNsoQ76hi618G6i0djBoRzVvYKkTd8PovNQRacZ06LWA@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-vcodec: add remoteproc dependency
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jernej Skrabec <jernej.skrabec@siol.net>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Dec 4, 2020 at 8:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
>
> From: Arnd Bergmann <arnd@arndb.de>
>
> The SCP firmware can only be built if CONFIG_REMOTEPROC is
> enabled:
>
> WARNING: unmet direct dependencies detected for MTK_SCP
>   Depends on [n]: REMOTEPROC [=n] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])
>   Selected by [y]:
>   - VIDEO_MEDIATEK_VCODEC [=y] && MEDIA_SUPPORT [=y] && MEDIA_PLATFORM_SUPPORT [=y] && V4L_MEM2MEM_DRIVERS [=y] && (MTK_IOMMU [=y] || COMPILE_TEST [=y]) && VIDEO_DEV [=y] && VIDEO_V4L2 [=y] && (ARCH_MEDIATEK [=y] || COMPILE_TEST [=y])

Despite setting these same options I cannot reproduce this warning on
a merge of master + media. Which tree are you using?

>
> Add this as a dependency for mtk-vcodec.
>
> Fixes: c7244811b1c9 ("media: mtk-vcodec: add SCP firmware ops")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/media/platform/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index ffffef2267f4..295f74c3c04b 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -276,6 +276,7 @@ config VIDEO_MEDIATEK_VCODEC
>         # our dependencies, to avoid missing symbols during link.
>         depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
>         depends on MTK_SCP || !MTK_SCP
> +       depends on REMOTEPROC
>         select VIDEOBUF2_DMA_CONTIG
>         select V4L2_MEM2MEM_DEV
>         select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> --
> 2.27.0
>
