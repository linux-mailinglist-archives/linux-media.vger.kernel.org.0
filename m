Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E692028BF4A
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 19:58:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403943AbgJLR56 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Oct 2020 13:57:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389885AbgJLR56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Oct 2020 13:57:58 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BF14C0613D0;
        Mon, 12 Oct 2020 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=cZw4jayN3HAr2KMB9YTkmcSf5Sy+pt/3xMbdYKhhmXk=; b=khQzpyDeKla36P5IttD3Sh6t/T
        IWz0Ju5rITG17faaDRhAMVCL/re6DGaVfUD8rSCdezrYmSxQHHMEn7ng8iUCL8nzbxL7v4+IiOebZ
        3J3mupjtOiqBHkBY1qu+lXdaTS44FHjdUzvfEAoY4YCLjCwSDxHzK6goj/DquZ3T3jAZu05Ud60M3
        klQPzj1vvhDNnK9ZsZQWJKixFvWX2vl9G8+dGCRJ//CkeYAxaRTGjNk3iPD1YtNtpUwYPMoCAGaL5
        H0Yv//MA2CUfLNNo4uNMXreNMPBx7nGhMiwOW9xpiVzihCvi/2Yavn0ZEzcYl4gJYdVqGVJDQelph
        FFuelRoQ==;
Received: from [2601:1c0:6280:3f0::507c]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kS252-0000ia-UZ; Mon, 12 Oct 2020 17:57:54 +0000
Subject: Re: [PATCH v3 2/2] media: mtk-vcodec: fix build breakage when one of
 VPU or SCP is enabled
To:     Alexandre Courbot <acourbot@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, gnurou@gmail.com
References: <20201012053557.4102148-1-acourbot@chromium.org>
 <20201012053557.4102148-3-acourbot@chromium.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <b333d437-02a0-6d2f-67fc-e798a0a562ff@infradead.org>
Date:   Mon, 12 Oct 2020 10:57:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201012053557.4102148-3-acourbot@chromium.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

For the Kconfig entries, specifically the help text:


On 10/11/20 10:35 PM, Alexandre Courbot wrote:
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

Please follow coding-style for Kconfig files:

from Documentation/process/coding-style.rst, section 10):

For all of the Kconfig* configuration files throughout the source tree,
the indentation is somewhat different.  Lines under a ``config`` definition
are indented with one tab, while help text is indented an additional two
spaces.


thanks.
-- 
~Randy

