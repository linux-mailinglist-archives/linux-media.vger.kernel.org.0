Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CCF050DE94
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235496AbiDYLRO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:17:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236667AbiDYLRM (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:17:12 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75EBB2F031
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:14:08 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id u15so28838438ejf.11
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:14:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=YCeAp+MsVN3Wftm3eDFtqaQfWTZrH5Z6Qa2DrJiohA8=;
        b=GaBpKTOMfDX35z3yhEAlmid/BZOaqo0clNtGds4utk+vTCcgUFU2BBmDB3Nk4Pbg8o
         AhZSzj32VADD4VXK14LZo841Ma6re50Hskn4ORGPrMUaplXwQCUFHfFzrzHdFPwqw7Yb
         Y7wcKwuTLk+L3B4EIoJB4GKKUoNnoh4XPt4gw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=YCeAp+MsVN3Wftm3eDFtqaQfWTZrH5Z6Qa2DrJiohA8=;
        b=qXQLpcsUn2byGiBH5cNUKtU3NMb6w3y0r85YYawBhY1BUz+K3XUQ21GpAW/+hSQcAS
         C9OxGH/8G6JlzhcgnrUrRqkusThTFPRX/HiJ5H7jyLUhLP0POUFBsN40CEl+q0r4pMg+
         H9LgcjGKH0E6gtnapwFu69MZhQJ3R4TVAzuEoIW5XZxGgk9GaAFHRZYqsLICNHmNjHWs
         Uze3sStaO0uYP2b6+6vE2bqndjonFrgVw2VcC4rA+TAzFeb62w3brAJwlxDo1Adcl3an
         3Aq2IlnXTS6/7sfM2jbtymXonZHHLlyvA9iI7ZeenoTF0qdOP4UeJsW02pMyD1LaVctv
         otfw==
X-Gm-Message-State: AOAM533OSrH7S2656IfJymX9+MawX0u78VapXrKgYlNzy2RS3D0lMr1j
        ypbJ9JblPOfYXEeMduu0gO2mFQ==
X-Google-Smtp-Source: ABdhPJxt88rlL+icmXV6pdJCdoRijSmmj4rvp2TPBC344nZ2mIxgDYBd683IwPVfeJbwEdESxhsI0A==
X-Received: by 2002:a17:906:130c:b0:6f3:8bbd:740a with SMTP id w12-20020a170906130c00b006f38bbd740amr6199424ejb.621.1650885247003;
        Mon, 25 Apr 2022 04:14:07 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id v17-20020a1709060b5100b006f38cf075cbsm1452729ejg.104.2022.04.25.04.14.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:14:06 -0700 (PDT)
Date:   Mon, 25 Apr 2022 13:13:49 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 15/21] media: rkisp1: debug: Add debugfs files to dump
 core and ISP registers
Message-ID: <YmaCbRhGF5sr/S1z@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-16-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-16-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> It's useful to dumb the value of registers for debugging purpose. Add
not all the values are dumb :P
> two debugfs files to dump key core and ISP registers.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Paul Elder <paul.elder@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
> Changes since v3:
> 
> - Fix pm_runtime_get_if_in_use() return value handling
> - Rename rkisp1_debug_register offset field to reg
> 
> Changes since v2:
> 
> - Handle runtime PM
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index 782a696ac587..63aa81553178 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -17,6 +17,70 @@
>  #include "rkisp1-common.h"
>  #include "rkisp1-regs.h"
>  
> +struct rkisp1_debug_register {
> +	u32 reg;
> +	const char * const name;
> +};
> +
> +#define RKISP1_DEBUG_REG(name)	{ RKISP1_CIF_##name, #name }
> +
> +static int rkisp1_debug_dump_regs(struct seq_file *m,
> +				  const struct rkisp1_debug_register *regs)
> +{
> +	struct rkisp1_device *rkisp1 = m->private;
> +	u32 val;
> +	int ret;
> +
> +	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> +	if (ret <= 0)
> +		return ret ? : -ENODATA;
> +
> +	for ( ; regs->name; ++regs) {
> +		val = rkisp1_read(rkisp1, regs->reg);
> +		seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> +	}
> +
> +	pm_runtime_put(rkisp1->dev);
> +
> +	return 0;
> +}
> +
> +static int rkisp1_debug_dump_core_regs_show(struct seq_file *m, void *p)
> +{
> +	static const struct rkisp1_debug_register registers[] = {
> +		RKISP1_DEBUG_REG(VI_CCL),
> +		RKISP1_DEBUG_REG(VI_ICCL),
> +		RKISP1_DEBUG_REG(VI_IRCL),
> +		RKISP1_DEBUG_REG(VI_DPCL),
> +		RKISP1_DEBUG_REG(MI_CTRL),
> +		RKISP1_DEBUG_REG(MI_BYTE_CNT),
> +		RKISP1_DEBUG_REG(MI_CTRL_SHD),
> +		RKISP1_DEBUG_REG(MI_RIS),
> +		RKISP1_DEBUG_REG(MI_STATUS),
> +		RKISP1_DEBUG_REG(MI_DMA_CTRL),
> +		RKISP1_DEBUG_REG(MI_DMA_STATUS),
> +		{ /* Sentinel */ },
> +	};
> +
> +	return rkisp1_debug_dump_regs(m, registers);
> +}
> +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_core_regs);
> +
> +static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
> +{
> +	static const struct rkisp1_debug_register registers[] = {
> +		RKISP1_DEBUG_REG(ISP_CTRL),
> +		RKISP1_DEBUG_REG(ISP_ACQ_PROP),
> +		RKISP1_DEBUG_REG(ISP_FLAGS_SHD),
> +		RKISP1_DEBUG_REG(ISP_RIS),
> +		RKISP1_DEBUG_REG(ISP_ERR),
> +		{ /* Sentinel */ },
> +	};
> +
> +	return rkisp1_debug_dump_regs(m, registers);
> +}
> +DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
> +
>  #define RKISP1_DEBUG_DATA_COUNT_BINS	32
>  #define RKISP1_DEBUG_DATA_COUNT_STEP	(4096 / RKISP1_DEBUG_DATA_COUNT_BINS)
>  
> @@ -68,6 +132,7 @@ DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_input_status);
>  void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_debug *debug = &rkisp1->debug;
> +	struct dentry *regs_dir;
>  
>  	debug->debugfs_dir = debugfs_create_dir(dev_name(rkisp1->dev), NULL);
>  
> @@ -96,6 +161,13 @@ void rkisp1_debug_init(struct rkisp1_device *rkisp1)
>  			     &debug->frame_drop[RKISP1_SELFPATH]);
>  	debugfs_create_file("input_status", 0444, debug->debugfs_dir, rkisp1,
>  			    &rkisp1_debug_input_status_fops);
> +
> +	regs_dir = debugfs_create_dir("regs", debug->debugfs_dir);
Is it worth to make a folder just for these two files?
> +
> +	debugfs_create_file("core", 0444, regs_dir, rkisp1,
> +			    &rkisp1_debug_dump_core_regs_fops);
> +	debugfs_create_file("isp", 0444, regs_dir, rkisp1,
> +			    &rkisp1_debug_dump_isp_regs_fops);
>  }
>  
>  void rkisp1_debug_cleanup(struct rkisp1_device *rkisp1)
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
