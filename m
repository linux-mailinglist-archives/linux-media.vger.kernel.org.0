Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3C1A750DE57
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 12:59:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237778AbiDYLCY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236072AbiDYLCX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:02:23 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CF084EE2
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 03:59:18 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id k27so2717738edk.4
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=O1iprrpCyW8nMod8KqXFZ0yaB3MuDhgdVhmxGRC2XzM=;
        b=PuiMslhSYv6mHfIdEZ3pVqGUwpPr6htgYW/9T1trx+mX4tzT73Lx1cABYZwE03yiq3
         KiVieb+3w5OiP06oYQbg+K/bF91Lxh2A54QHkTOIGWCSBBBNfw9Me2gwYlr2g9YNVwro
         Khmany6fQiypxNi9JxiGEtKHFlcYpR3Yl3/wY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=O1iprrpCyW8nMod8KqXFZ0yaB3MuDhgdVhmxGRC2XzM=;
        b=6s6HttbYOfhKcIDAsOxSQ4+EXfa5NtGp7TwAZce0jfadc3JjHiifWPR3hOMKCURcQT
         otHUsKGBCYWNB/Jfxynhtm52aigunGjSoJfUx/2g+EKHrSe+AR9AyqN0Zu/2S4h6MLdr
         YtIop8Txf1+Irq8FNopniByBOcnuOejJ7iPevzyvGLB3oL9FKKpNV5x1yUoWGxkeeLT7
         g3LzL44eG4IRtpJu3vClSO4qWikRsClCMbl/3g+BLaUyp02zS4ac+oMLjoBfKVaamJR4
         xUyjyBvQ+f+aaHD29wN3UVPTmDFg2r2O9D1yETkiuKMI6SnZijbW3tOHrKggUkghLviu
         2gWg==
X-Gm-Message-State: AOAM532Mj4mQV74TenmyOebLZIi2dqHmNoLJ1cVQWoLBYlXqZgW44+x8
        rGimXScxTrcHccYMLL3s67ehFQ==
X-Google-Smtp-Source: ABdhPJyqgs/NukQzf3sVSsYkCX51tqbzzjoB6SaUQloy7ljsvs2raQu8muD0XYTY0jRqhqd8pCrvNw==
X-Received: by 2002:a05:6402:254c:b0:423:e51b:e1b2 with SMTP id l12-20020a056402254c00b00423e51be1b2mr18363348edb.161.1650884357262;
        Mon, 25 Apr 2022 03:59:17 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id g17-20020a056402425100b00425f2816b85sm445472edb.27.2022.04.25.03.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 03:59:16 -0700 (PDT)
Date:   Mon, 25 Apr 2022 12:58:59 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 13/21] media: rkisp1: Compile debugfs support
 conditionally
Message-ID: <YmZ+89lToRXl4vFB@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-14-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-14-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> When CONFIG_DEBUGFS is disabled, there's no need to compile the debugfs
> support in. Make it conditional.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Dafna Hirschfeld <dafna@fastmail.com>
> ---
> Changes since v3:
> 
> - Fix double mention of rkisp1-debug.o in Makefile
> ---
>  .../media/platform/rockchip/rkisp1/Makefile    | 18 ++++++++++--------
>  .../platform/rockchip/rkisp1/rkisp1-common.h   |  9 +++++++++
>  2 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/Makefile b/drivers/media/platform/rockchip/rkisp1/Makefile
> index 1a39bdcc608e..f7543a82aa10 100644
> --- a/drivers/media/platform/rockchip/rkisp1/Makefile
> +++ b/drivers/media/platform/rockchip/rkisp1/Makefile
> @@ -1,11 +1,13 @@
>  # SPDX-License-Identifier: GPL-2.0
>
Are you sure that this work when rockchip is built as module?

> +rockchip-isp1-y := rkisp1-capture.o \
> +		   rkisp1-common.o \
> +		   rkisp1-dev.o \
> +		   rkisp1-isp.o \
> +		   rkisp1-resizer.o \
> +		   rkisp1-stats.o \
> +		   rkisp1-params.o
> +
> +rockchip-isp1-$(CONFIG_DEBUG_FS) += rkisp1-debug.o
> +
>  obj-$(CONFIG_VIDEO_ROCKCHIP_ISP1) += rockchip-isp1.o
> -rockchip-isp1-objs += 	rkisp1-capture.o \
> -			rkisp1-common.o \
> -			rkisp1-debug.o \
> -			rkisp1-dev.o \
> -			rkisp1-isp.o \
> -			rkisp1-resizer.o \
> -			rkisp1-stats.o \
> -			rkisp1-params.o
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 07a92ed8bdc8..a7ffe2830fa8 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -518,7 +518,16 @@ void rkisp1_stats_unregister(struct rkisp1_device *rkisp1);
>  int rkisp1_params_register(struct rkisp1_device *rkisp1);
>  void rkisp1_params_unregister(struct rkisp1_device *rkisp1);
>  
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
>  void rkisp1_debug_init(struct rkisp1_device *rkisp1);
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1);
> +#else
> +static inline void rkisp1_debug_init(struct rkisp1_device *rkisp1)
> +{
> +}
> +static inline void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> +{
> +}
> +#endif
>  
>  #endif /* _RKISP1_COMMON_H */
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
