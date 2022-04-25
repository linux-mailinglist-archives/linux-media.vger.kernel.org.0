Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2B2B450DE77
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:08:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232769AbiDYLLf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:11:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33476 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiDYLLd (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:11:33 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 424EB1095
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:08:27 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id b24so17907907edu.10
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=BcdRZqKdMJBQ1wt30qPrSOU9U7EvCQM4OsprjViQEtI=;
        b=h7k/BwOCnS+jSR+bP00epoCsSh3rNlFRnzBTE2rZyIaXfPINflmd40ujUh0DQHAi0d
         axyKQW0vRbllgKHGwVhU4r+Um9xB/hbK/tcStUWxTQCzyC0lFJWVHC4rKQ+XlOQITxw5
         gBwbHTRjrkAB6jVOVPN2+9gSIc+i+yVU1EQKQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=BcdRZqKdMJBQ1wt30qPrSOU9U7EvCQM4OsprjViQEtI=;
        b=ZLU+Ju2z8DhWfT2dN6ZvAciy4jKZohXodgZumFYsbh8YelHxn8goHBLbId3dy2G+nD
         ext/TkpA1pNkd/bOGil9RrkFmiODMfZ3GuqQ+FC3rVpAhHU8yrJXLaTF6mPdiUAO8Qpe
         Rg1dvEXqVlsC9pP+1HBg+7vPJ+kuS5nPuDk9B2/AkA/nlXV+jw0AeVUT6vsoft16V23F
         ptBJwaftIncCcEBzZ+q7cYhEWgOwLViQzq1VudZjJ7IkeNnMFJpfK1gOljxN27NDnXhO
         WX86u+8jML9yoIw+x7bzWGiy9GoP6uGjQZkfwFIUL2wJL/Kir/1pD5Z+Nt6HW7JfQzmA
         RFMg==
X-Gm-Message-State: AOAM533BuWN+A+1/Ebf7hWDo6PkmjRCCJQ3ZOHcYZ/sqOa7bJk62JZw7
        6w9n4vng3SLCneNZvoavOdOidQ==
X-Google-Smtp-Source: ABdhPJyxnkGEMkSLnDsc+2vkgxuXv9ivj8nTtJLGTT9lQQ9or7oJXjoEA14ojonE2vsg/UqCcncrAg==
X-Received: by 2002:a05:6402:27cb:b0:423:d386:42be with SMTP id c11-20020a05640227cb00b00423d38642bemr18311766ede.227.1650884905802;
        Mon, 25 Apr 2022 04:08:25 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id lf5-20020a170907174500b006f3806fc9cdsm2002654ejc.39.2022.04.25.04.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:08:25 -0700 (PDT)
Date:   Mon, 25 Apr 2022 13:08:08 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 14/21] media: rkisp1: debug: Collect input status by
 sampling ISP_FLAGS_SHD
Message-ID: <YmaBGMrrbt5/v1vO@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-15-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220421234240.1694-15-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> The ISP_FLAGS_SHD register exposes the ISP parallel input signals (data
> and synchronization) in real time. This can help debugging when the
> device doesn't output any image. Sample the register 10000 times with a
> 1µs delay and expose the result through debugfs.

I think this is quite clever :)

Out of curiosity, how long does reading the debug file takes?

> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v3:
> 
> - Fix pm_runtime_get_if_in_use() return value handling
> 
> Changes since v2:
> 
> - Handle runtime PM
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 54 +++++++++++++++++++
>  .../platform/rockchip/rkisp1/rkisp1-regs.h    |  9 ++++
>  2 files changed, 63 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 64b33774cbdf..782a696ac587 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -9,9 +9,61 @@
>   */
>  
>  #include <linux/debugfs.h>
> +#include <linux/delay.h>
>  #include <linux/device.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/seq_file.h>
>  
>  #include "rkisp1-common.h"
> +#include "rkisp1-regs.h"
> +
> +#define RKISP1_DEBUG_DATA_COUNT_BINS	32
> +#define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
> +
> +static int rkisp1_debug_input_status_show(struct seq_file *m, void *p)
> +{
> +	struct rkisp1_device *rkisp1 = m->private;
> +	u16 data_count[RKISP1_DEBUG_DATA_COUNT_BINS] = { };
> +	unsigned int hsync_count = 0;
> +	unsigned int vsync_count = 0;
> +	unsigned int i;
> +	u32 data;
> +	u32 val;
> +	int ret;
> +
> +	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> +	if (ret <= 0)
> +		return ret ? : -ENODATA;
> +
> +	/* Sample the ISP input port status 10000 times with a 1µs interval. */
> +	for (i = 0; i < 10000; ++i) {
> +		val = rkisp1_read(rkisp1, RKISP1_CIF_ISP_FLAGS_SHD);
> +
> +		data = (val & RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK)
> +		     >> RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT;
> +		data_count[data / RKISP1_DEBUG_DATA_COUNT_STEP]++;
> +
> +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC)
> +			hsync_count++;
> +		if (val & RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC)
> +			vsync_count++;
> +
> +		udelay(1);
> +	}
> +
> +	pm_runtime_put(rkisp1->dev);
> +
> +	seq_printf(m, "vsync: %u, hsync: %u\n", vsync_count, hsync_count);
> +	seq_puts(m, "data:\n");
> +	for (i = 0; i < ARRAY_SIZE(data_count); ++i)
> +		seq_printf(m, "- [%04u:%04u]: %u\n",
> +			   i * RKISP1_DEBUG_DATA_COUNT_STEP,
> +			   (i + 1) * RKISP1_DEBUG_DATA_COUNT_STEP - 1,
> +			   data_count[i]);
> +
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
>  
>  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  {
> @@ -42,6 +94,8 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  			     &debug->frame_drop[RKISP1_MAINPATH]);
>  	debugfs_create_ulong("sp_frame_drop", 0444, debug->debugfs_dir,
>  			     &debug->frame_drop[RKISP1_SELFPATH]);
> +	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
> +			    &rkisp1_debug_input_status_fops);
>  }
>  
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> index a93d0127b813..2b322db97252 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-regs.h
> @@ -454,6 +454,15 @@
>  #define RKISP1_CIF_ISP_DEMOSAIC_BYPASS			BIT(10)
>  #define RKISP1_CIF_ISP_DEMOSAIC_TH(x)			((x) & 0xFF)
>  
> +/* ISP_FLAGS_SHD */
> +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_SHD		BIT(0)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_ISP_ENABLE_INFORM_SHD	BIT(1)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_INFORM_FIELD		BIT(2)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_MASK		GENMASK(27, 16)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_DATA_SHIFT		16
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_VSYNC		BIT(30)
> +#define RKISP1_CIF_ISP_FLAGS_SHD_S_HSYNC		BIT(31)
> +
>  /* AWB */
>  /* ISP_AWB_PROP */
>  #define RKISP1_CIF_ISP_AWB_YMAX_CMP_EN			BIT(2)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
