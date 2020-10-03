Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA699282567
	for <lists+linux-media@lfdr.de>; Sat,  3 Oct 2020 18:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgJCQu0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 3 Oct 2020 12:50:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725793AbgJCQu0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sat, 3 Oct 2020 12:50:26 -0400
Received: from merlin.infradead.org (merlin.infradead.org [IPv6:2001:8b0:10b:1231::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC815C0613D0;
        Sat,  3 Oct 2020 09:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=+0e6+K3hwZF8MBukpU2gY6R90DOei1aWOAOJjZS9mg0=; b=OYrHGAdiqbM8IOWluCfZ4PgyVH
        YI4sF50+rzmkrJJEelwHHaRIVdMWXiaRY0Xwt0LZ7vXw3Sfo9o2yBq6FjNafNAzO3jJW4BqQyna8C
        GYhgQyXo/GfvbazLNnPLdF8gQ72/6qx2EpwSyya+w7xGpy0gdtHWWCbvR8HF2pg32/brYgnMCuXgr
        pz7j8VvKTHBWHWdeIxYG0jrIXxE1/h+SOFKS6WrXSmYApwV0UeOR3pDwhqJuKh1vbSdUbL2dBrkCe
        CcajlttSLw703Buppbvihc49ObvfgvKM5u9yvw559s8BeRn++ur8HyZsquctYoTibD67+dH6HOO+w
        B5UiNPhg==;
Received: from [2601:1c0:6280:3f0::2c9a]
        by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kOkjk-0006xp-8v; Sat, 03 Oct 2020 16:50:20 +0000
Subject: Re: [PATCH] media: mtk-vcodec: fix builds when remoteproc is disabled
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org
References: <20201003130947.555637-1-acourbot@chromium.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <43e118c9-0bc6-d85d-2f86-e74f833e1e8a@infradead.org>
Date:   Sat, 3 Oct 2020 09:50:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201003130947.555637-1-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 10/3/20 6:09 AM, Alexandre Courbot wrote:
> The addition of MT8183 support added a dependency on the SCP remoteproc
> module. However the initial patch used the "select" Kconfig directive,
> which may result in the SCP module to not be compiled if remoteproc was
> disabled. In such a case, mtk-vcodec would try to link against
> non-existent SCP symbols. "select" was clearly misused here as explained
> in kconfig-language.txt.
> 
> Replace this by a "depends" directive on at least one of the VPU and
> SCP modules, to allow the driver to be compiled as long as one of these
> is enabled, and adapt the code to support this new scenario.
> 
> Also adapt the Kconfig text to explain the extra requirements for MT8173
> and MT8183.
> 
> Reported-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

I was seeing this also, so I checked this patch. WFM.

Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested

See below.

> ---
>  drivers/media/platform/Kconfig                | 11 +--
>  .../media/platform/mtk-vcodec/mtk_vcodec_fw.c | 72 ++++++++++++-------
>  2 files changed, 55 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d5..e559d9c529b6 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -253,14 +253,17 @@ config VIDEO_MEDIATEK_VCODEC
>  	depends on MTK_IOMMU || COMPILE_TEST
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> -	select VIDEO_MEDIATEK_VPU
> -	select MTK_SCP
>  	help
>  	    Mediatek video codec driver provides HW capability to
> -	    encode and decode in a range of video formats
> -	    This driver rely on VPU driver to communicate with VPU.
> +	    encode and decode in a range of video formats on MT8173
> +	    and MT8183.
> +
> +	    Note that support for support for MT8173 requires

Drop one of "support for" above. (or "for support" ;)

> +	    VIDEO_MEDIATEK_VPU to also be selected. Support for
> +	    MT8183 depends on MTK_SCP.
>  
>  	    To compile this driver as modules, choose M here: the
>  	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.


thanks.
-- 
~Randy
