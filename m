Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC82150DE48
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 12:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237876AbiDYK6Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 06:58:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241620AbiDYK5m (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 06:57:42 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9849283026
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 03:54:38 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l18so2186355ejc.7
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 03:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=i6hCp3oELR/UM/THJkQ0oUXJn3QFcO2EJ4qGGI5KEe4=;
        b=ZqDYpg3A4PPDg26sYo7VfPvQYueU6v5QbcH01SXz0SXtKmSPqF1bD8mmdaCfr3A0Eb
         XzcJFp+myJln4xa4wxnpxEADm/qzsmPVMG7KeXEdQJ65Peb2ZLW24MaiBRA8mPUBMe17
         0px9w23Q9yTyfPWVIvTMaI8vq/970SXxzEsDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=i6hCp3oELR/UM/THJkQ0oUXJn3QFcO2EJ4qGGI5KEe4=;
        b=4kuo0dyUMtO/Fs7FHXlfa/NHtQN6dmLO0f+e2PiEOrzx5rjyIEBnrdmB+KAPa67m0b
         AY7L/oSzMrbiiAzpgEhzq2z/ziu9D+V10Vy2p28d6sxnkN4JbAriTE9OajwWv4VY8gzv
         o9bYKvB89ZxhlxLzswiqh1OsXOYihW9NDgOWK/MypGlUvIL65jak0WFosgMEU67my9tk
         j+e6KXPUfXw54cWKFyCPYbpnwIICtaQ9Jm2EQ7ipD4qz09rAS1XB+TPhLXv/2IIq+qsT
         A4hPctGxiDl7ogHbE3+FMeETOc+LdU22yHlb/zbnsQAzbzYJPfPZZ970zYb5Q5Cmcz7X
         YKxQ==
X-Gm-Message-State: AOAM532k1D1VVKAyvfDnAK0XBM6T6nkDLPr9IMhxqzFIVtKXFp+UkqpG
        wO3c0fZ9YFfSbpYNjzMnmF7G9Q==
X-Google-Smtp-Source: ABdhPJxlO/xkv1pXpy8bJL4taPNl8hGo+wAnkSkAhoTghZl8eucZfyT2FTO1x29MfvNVKWRwqRm9Ug==
X-Received: by 2002:a17:906:9c83:b0:6df:839a:a6d0 with SMTP id fj3-20020a1709069c8300b006df839aa6d0mr15527098ejc.419.1650884077099;
        Mon, 25 Apr 2022 03:54:37 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id u12-20020aa7d54c000000b00423e004bf9asm4434456edr.86.2022.04.25.03.54.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 03:54:36 -0700 (PDT)
Date:   Mon, 25 Apr 2022 12:54:18 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 12/21] media: rkisp1: Move debugfs code to a separate
 file
Message-ID: <YmZ92gNFXvczsCjL@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-13-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-13-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> To avoid cluttering the main rkisp1-dev.c driver file, move debugfs code
> to a separate source file. This prepares for extensions to the debugfs
> infrastructure.
> 
> While at it, add a missing forward declaration for struct dentry in
> rkisp1-common.h to avoid depending on indirect includes.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
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
> 
