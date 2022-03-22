Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 499EA4E37D7
	for <lists+linux-media@lfdr.de>; Tue, 22 Mar 2022 05:14:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbiCVENg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 22 Mar 2022 00:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57184 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236351AbiCVENf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 22 Mar 2022 00:13:35 -0400
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7844AE2C
        for <linux-media@vger.kernel.org>; Mon, 21 Mar 2022 21:12:08 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id B58045C0138;
        Tue, 22 Mar 2022 00:12:07 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Tue, 22 Mar 2022 00:12:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
        cc:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to; s=fm3; bh=xvNR679VOFQ0XcI0ebUoIxtgRHVkWeM65SEmyR
        aE8Gc=; b=ErgmOgCxlHp6E0pAKo7KNSsKRYKrPpDVhknx9w/2l68pYAblrtMjvt
        0C3TMCqlqBn/n4IYl+uELHDKwYAulyRl9IXaCGxcY6PW5VTUko+zOb0p7BlNmh/4
        sjUR0HS9WWRbDtdc/ekFe8PVqi97hqZ1hiiqTeMyCx2KI8J5LXUwYwVRVCTY9GC0
        /hP85/Qnim/rKrfmUuT+bjk7iah7BmVYszVKyrs4x0kivl4dQ2lOE7GGZtmg908k
        xf9fV3TAFRdIg7mLBrm7XYLNS4Akq+MrxunJNyh5Zqck05vN/fYzdtXYyx8LjMUr
        9FQTAtbHAWpX/dOl9o1WNdAcagO0St4A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=xvNR679VOFQ0XcI0e
        bUoIxtgRHVkWeM65SEmyRaE8Gc=; b=oMNyXaGvCkDiL8LGp7j93NbKM3bywXmE9
        R8Sj03f7z7qbXZSXrbfSqrJIyyIryuFNDTaOvWHwtjIyGm4SekHIfFDukia0WGk5
        +beAvz/IV+8B/Ly9H5lVxB54wtCvaoaYyW1nqE5a+iTzlf1szjv8say9qZW7IEgj
        Wsie6DPHLz28AKeWJrzDMwfQkDXI2wYDn8YBCSgxGRQ4nrN9VFLUFp6WLqXG3tFj
        QH6aIui9nEkE0m2OA0bZrLyfpidoM7dKw9P09khH8U/Idgs9X1+Po2DHq6NU2AvU
        TVJRb1Nvlw91nlx1yQpIQdmQkCWjeSgYajYuLbEriNjrohTh/4SWg==
X-ME-Sender: <xms:l0w5YkXYenfjn9euTEl6xocoPfLr2Ldomk1u_dy3kZMKizlPxM-u8g>
    <xme:l0w5YokvLrsb0HRJ-yoq-Q9ZrW4U5OynfSDXQ-YB1ot9RQIvYj5c7i25_d5EcgKbq
    JZgK9YeIAvjt8J-jmc>
X-ME-Received: <xmr:l0w5YoarC8m37EqYjmpB8wLAQlKtdeYNcFvxVUQY5OnXaHIGVTaPHHxS4kAIH6X5_jsvO1De-SuzTAyzyNYvw9p->
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudeggedgieeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvffukfhfgggtuggjsehttdertddttdejnecuhfhrohhmpeffrghfnhgr
    ucfjihhrshgthhhfvghlugcuoegurghfnhgrsehfrghsthhmrghilhdrtghomheqnecugg
    ftrfgrthhtvghrnhepffelvddujefgieetvdelveetudeukeektdejvdegvdfgudelteff
    ueejvdevkeeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrfhhnrgesfhgrshhtmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:l0w5YjXYfa4S_wmheQoZtVdxfonObcb0atEJL0aIhtW0Rer_z7B4aw>
    <xmx:l0w5Yulw9N6liJFJkEEPq8NV16uLuj8O8GjlNsCMbmovT7TtrLuGJQ>
    <xmx:l0w5YocFODHgD7eweagS11z67Deq89EI6WuRRo-yUISb9I0mTYNpYw>
    <xmx:l0w5YvAj66MyptNEGVp0c2Qy1m-u1whoJwqriCJxxliimvz_N9FMtQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Mar 2022 00:12:05 -0400 (EDT)
Date:   Tue, 22 Mar 2022 06:12:03 +0200
From:   Dafna Hirschfeld <dafna@fastmail.com>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v3 12/17] media: rkisp1: Move debugfs code to a separate
 file
Message-ID: <20220322041203.37xwstrb5jcugcji@guri>
References: <20220319163100.3083-1-laurent.pinchart@ideasonboard.com>
 <20220319163100.3083-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220319163100.3083-13-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 19.03.2022 18:30, Laurent Pinchart wrote:
> To avoid cluttering the main rkisp1-dev.c driver file, move debugfs code
> to a separate source file. This prepares for extensions to the debugfs
> infrastructure.
> 
> While at it, add a missing forward declaration for struct dentry in
> rkisp1-common.h to avoid depending on indirect includes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>

> ---
>  .../media/platform/rockchip/rkisp1/Makefile   |  1 +
>  .../platform/rockchip/rkisp1/rkisp1-common.h  |  5 ++
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 50 +++++++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-dev.c     | 33 +-----------
>  4 files changed, 57 insertions(+), 32 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
> index ab32a77db8f7..1a39bdcc608e 100644
> --- a/drivers/media/platform/rockchip/rkisp1/Makefile
> +++ b/drivers/media/platform/rockchip/rkisp1/Makefile
> @@ -3,6 +3,7 @@
>  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
>  rockchip-isp1-objs += 	rkisp1-capture.o \
>  			rkisp1-common.o \
> +			rkisp1-debug.o \
>  			rkisp1-dev.o \
>  			rkisp1-isp.o \
>  			rkisp1-resizer.o \
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 3b36ab05ac34..07a92ed8bdc8 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -23,6 +23,8 @@
>  
>  #include "rkisp1-regs.h"
>  
> +struct dentry;
> +
>  /*
>   * flags on the 'direction' field in struct 'rkisp1_isp_mbus_info' that indicate
>   * on which pad the media bus format is supported
> @@ -516,4 +518,7 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
>  int rkisp1_params_register(struct rkisp1_device *rkisp1);
>  void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
>  
> +void rkisp1_debug_init(struct rkisp1_device *rkisp1);
> +void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
> +
>  #endif /* _RKISP1_COMMON_H */
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> new file mode 100644
> index 000000000000..64b33774cbdf
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -0,0 +1,50 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Rockchip ISP1 Driver - Base driver
> + *
> + * Copyright (C) 2019 Collabora, Ltd.
> + *
> + * Based on Rockchip ISP1 driver by Rockchip Electronics Co., Ltd.
> + * Copyright (C) 2017 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <linux/debugfs.h>
> +#include <linux/device.h>
> +
> +#include "rkisp1-common.h"
> +
> +void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> +{
> +	struct rkisp1_debug *debug = &rkisp1->debug;
> +
> +	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
> +
> +	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
> +			     &debug->data_loss);
> +	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
> +			     &debug->outform_size_error);
> +	debugfs_create_ulong("img_stabilization_size_error", 0444,
> +			     debug->debugfs_dir,
> +			     &debug->img_stabilization_size_error);
> +	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
> +			     &debug->inform_size_error);
> +	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
> +			     &debug->irq_delay);
> +	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
> +			     &debug->mipi_error);
> +	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
> +			     &debug->stats_error);
> +	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
> +			     &debug->stop_timeout[RKISP1_MAINPATH]);
> +	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
> +			     &debug->stop_timeout[RKISP1_SELFPATH]);
> +	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
> +			     &debug->frame_drop[RKISP1_MAINPATH]);
> +	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
> +			     &debug->frame_drop[RKISP1_SELFPATH]);
> +}
> +
> +void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> +{
> +	debugfs_remove_recursive(rkisp1->debug.debugfs_dir);
> +}
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> index f8b2573aa9da..c7ad1986e67b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-dev.c
> @@ -9,7 +9,6 @@
>   */
>  
>  #include <linux/clk.h>
> -#include <linux/debugfs.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
> @@ -460,36 +459,6 @@ static const struct of_device_id rkisp1_of_match[] = {
>  };
>  MODULE_DEVICE_TABLE(of, rkisp1_of_match);
>  
> -static void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> -{
> -	struct rkisp1_debug *debug = &rkisp1->debug;
> -
> -	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
> -	debugfs_create_ulong("data_loss", 0444, debug->debugfs_dir,
> -			     &debug->data_loss);
> -	debugfs_create_ulong("outform_size_err", 0444,  debug->debugfs_dir,
> -			     &debug->outform_size_error);
> -	debugfs_create_ulong("img_stabilization_size_error", 0444,
> -			     debug->debugfs_dir,
> -			     &debug->img_stabilization_size_error);
> -	debugfs_create_ulong("inform_size_error", 0444,  debug->debugfs_dir,
> -			     &debug->inform_size_error);
> -	debugfs_create_ulong("irq_delay", 0444,  debug->debugfs_dir,
> -			     &debug->irq_delay);
> -	debugfs_create_ulong("mipi_error", 0444, debug->debugfs_dir,
> -			     &debug->mipi_error);
> -	debugfs_create_ulong("stats_error", 0444, debug->debugfs_dir,
> -			     &debug->stats_error);
> -	debugfs_create_ulong("mp_stop_timeout", 0444, debug->debugfs_dir,
> -			     &debug->stop_timeout[RKISP1_MAINPATH]);
> -	debugfs_create_ulong("sp_stop_timeout", 0444, debug->debugfs_dir,
> -			     &debug->stop_timeout[RKISP1_SELFPATH]);
> -	debugfs_create_ulong("mp_frame_drop", 0444, debug->debugfs_dir,
> -			     &debug->frame_drop[RKISP1_MAINPATH]);
> -	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
> -			     &debug->frame_drop[RKISP1_SELFPATH]);
> -}
> -
>  static int rkisp1_probe(struct platform_device *pdev)
>  {
>  	const struct rkisp1_match_data *match_data;
> @@ -586,13 +555,13 @@ static int rkisp1_remove(struct platform_device *pdev)
>  	v4l2_async_nf_cleanup(&rkisp1->notifier);
>  
>  	rkisp1_entities_unregister(rkisp1);
> +	rkisp1_debug_cleanup(rkisp1);
>  
>  	media_device_unregister(&rkisp1->media_dev);
>  	v4l2_device_unregister(&rkisp1->v4l2_dev);
>  
>  	pm_runtime_disable(&pdev->dev);
>  
> -	debugfs_remove_recursive(rkisp1->debug.debugfs_dir);
>  	return 0;
>  }
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
