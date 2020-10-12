Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E76D428AF67
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 09:43:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726732AbgJLHnO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 03:43:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:32796 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726120AbgJLHnO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 03:43:14 -0400
Received: from coco.lan (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A79652080D;
        Mon, 12 Oct 2020 07:43:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602488592;
        bh=bAc0d6eqVxt5kvlc4/0fQ1Dt0V8pQkYKNF5xQvY2t1c=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=I4bI/s+y9vhd/nExxWZ2y1XlzgBQbfzcWfLW4DA6opqThS+SEVWVra3xcsUSwUYB0
         7GWCy1HVs91CGAzCZP450EzLotvskdCmFtt/vKkoa3U+yoSRHrcwYguEsMFOFnqg1U
         ScjBKMOPw39aL8eSQFn+wWTOTiWmAeXR+nP5bhMI=
Date:   Mon, 12 Oct 2020 09:43:07 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, gnurou@gmail.com,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one
 of VPU or SCP is enabled
Message-ID: <20201012094307.1f32155b@coco.lan>
In-Reply-To: <20201012053557.4102148-3-acourbot@chromium.org>
References: <20201012053557.4102148-1-acourbot@chromium.org>
        <20201012053557.4102148-3-acourbot@chromium.org>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Em Mon, 12 Oct 2020 14:35:57 +0900
Alexandre Courbot <acourbot@chromium.org> escreveu:

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
> Acked-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
> Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/platform/Kconfig                | 22 +++++++++++++++----
>  drivers/media/platform/mtk-vcodec/Makefile    | 10 +++++++--
>  .../platform/mtk-vcodec/mtk_vcodec_fw_priv.h  | 18 +++++++++++++++
>  3 files changed, 44 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
> index a3cb104956d5..457b6c39ddc0 100644
> --- a/drivers/media/platform/Kconfig
> +++ b/drivers/media/platform/Kconfig
> @@ -253,18 +253,32 @@ config VIDEO_MEDIATEK_VCODEC
>  	depends on MTK_IOMMU || COMPILE_TEST
>  	depends on VIDEO_DEV && VIDEO_V4L2
>  	depends on ARCH_MEDIATEK || COMPILE_TEST
> +	depends on VIDEO_MEDIATEK_VPU || MTK_SCP
> +	# The two following lines ensure we have the same state ("m" or "y") as
> +	# our dependencies, to avoid missing symbols during link.
> +	depends on VIDEO_MEDIATEK_VPU || !VIDEO_MEDIATEK_VPU
> +	depends on MTK_SCP || !MTK_SCP
>  	select VIDEOBUF2_DMA_CONTIG
>  	select V4L2_MEM2MEM_DEV
> -	select VIDEO_MEDIATEK_VPU
> -	select MTK_SCP
> +	select VIDEO_MEDIATEK_VCODEC_VPU if VIDEO_MEDIATEK_VPU
> +	select VIDEO_MEDIATEK_VCODEC_SCP if MTK_SCP
>  	help
>  	    Mediatek video codec driver provides HW capability to
> -	    encode and decode in a range of video formats
> -	    This driver rely on VPU driver to communicate with VPU.
> +	    encode and decode in a range of video formats on MT8173
> +	    and MT8183.
> +
> +	    Note that support for MT8173 requires VIDEO_MEDIATEK_VPU to
> +	    also be selected. Support for MT8183 depends on MTK_SCP.
>  
>  	    To compile this driver as modules, choose M here: the
>  	    modules will be called mtk-vcodec-dec and mtk-vcodec-enc.

Just my 2 cents here, and to complement my last e-mail, the helper message
here IMO is a lot more confusing than if you do this, instead:

	config VIDEO_MEDIATEK_CODEC
	         depends on VIDEO_MEDIATEK_VPU_SCP || VIDEO_MEDIATEK_VPU
		 default y

	config VIDEO_MEDIATEK_VPU
            depends on VIDEO_DEV && VIDEO_V4L2
            depends on ARCH_MEDIATEK || COMPILE_TEST
            tristate "Enable Mediatek Video Processor Unit for MT8173"
	    help
		Select this option to enable Mediatek VPU on MT8173.

	config VIDEO_MEDIATEK_VPU_SCP
            depends on VIDEO_DEV && VIDEO_V4L2
            depends on ARCH_MEDIATEK || COMPILE_TEST
            tristate "Enable Mediatek Video Processor Unit for MT8183"
	    help
		Select this option to enable Mediatek VPU on MT8183.

To be clear, from my side, I can live with either one of the alternatives,
but, IMHO, the above is a lot clearer for anyone wanting to use
VPU, as, if MTK_SCP is disabled, the MT8183 Kconfig prompt will
disappear.


Thanks,
Mauro
