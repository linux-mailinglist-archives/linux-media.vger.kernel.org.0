Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 128D150DF40
	for <lists+linux-media@lfdr.de>; Mon, 25 Apr 2022 13:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241731AbiDYLt2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 Apr 2022 07:49:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241704AbiDYLtV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 Apr 2022 07:49:21 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC9F73F886
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:46:15 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id l18so2436985ejc.7
        for <linux-media@vger.kernel.org>; Mon, 25 Apr 2022 04:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4LiQigWckfpLwMbrYIQQOgR6X6QiTKfRradFl3Q0U4M=;
        b=EOjnsgMRVs+UQF+QmVfWr8VLWOMyWvgz2+/8OS6nu2Fs/RboxdceerikqF1i7HKJmW
         Ykprh7BSRNUKv4cBku/kC1IOQLmNHLNKqBaouQsREpW8aX0psHPuXXpYutT+nOTxJqja
         qSMR32lYjwDlVJGNs7P3W60UdQIDJwXVLI7nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=4LiQigWckfpLwMbrYIQQOgR6X6QiTKfRradFl3Q0U4M=;
        b=eIpO6+trSbRaPy+057aoi6t2D6MRiXR5sj4SdxKAmfpo2eR097Ukg/9YbtmEuoBomG
         Q+e4RfTE/mSiNm0l75dqW8z6r8ShjSjfNDSqFdOov9e3z1L5M38SRER6IIYooNMq2AGD
         4GWDXZRFCweb6awyJLHMrh01n3T4hByRa00YoOqTDmplN74y67W+1vJmSCS8FHLu2WHj
         196DLrubU31chWCwcHu0pgoVl0MqFeQS5mR6HrVHSx/0bZ4sOAhjH0+IJRf6UwAJuAhI
         dxMxXtbUqKU4mj4PXv2bjoqHDrgw9jRxr4DTFzo6uoo89n0NKY45jY0LEeW8MecuJQ6k
         xklg==
X-Gm-Message-State: AOAM5308nRt5ef2HSYHeOVSF0wxZ8AzNU1fThtNP839iiRWIJvF/KdFQ
        tFenpJhyp8qBZMO5uuESIqtyOw==
X-Google-Smtp-Source: ABdhPJyE5kgy54xqVNFY/KCbw57qoI7YORvA2f7LZSt+EWorLhJirchXBjKEwWV86bp8UUNzlltzGA==
X-Received: by 2002:a17:907:c297:b0:6e8:b7dd:5bc1 with SMTP id tk23-20020a170907c29700b006e8b7dd5bc1mr16540028ejc.173.1650887174497;
        Mon, 25 Apr 2022 04:46:14 -0700 (PDT)
Received: from gmail.com ([100.104.168.197])
        by smtp.gmail.com with ESMTPSA id c6-20020a50f606000000b00425adbac753sm4536369edn.21.2022.04.25.04.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Apr 2022 04:46:14 -0700 (PDT)
Date:   Mon, 25 Apr 2022 13:45:56 +0200
From:   Ricardo Ribalda <ribalda@chromium.org>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Paul Elder <paul.elder@ideasonboard.com>,
        Tomasz Figa <tfiga@google.com>,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH v4 17/21] media: rkisp1: debug: Consolidate reg dumps for
 shadow registers
Message-ID: <YmaJ9GGdEpZUufkL@gmail.com>
References: <20220421234240.1694-1-laurent.pinchart@ideasonboard.com>
 <20220421234240.1694-18-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220421234240.1694-18-laurent.pinchart@ideasonboard.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Laurent Pinchart wrote:

> Extend the rkisp1_debug_register structure and the
> rkisp1_debug_dump_regs() function to support shadow registers, and
> replace the manual registers dump implementation in
> rkisp1_debug_dump_rsz_regs_show() with a call to
> rkisp1_debug_dump_regs().
> 
> Support for printing register values in decimal is dropped, as it was
> actually confusing to print resizer register expressed as fixed-point
> values in decimal.
> 
> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
> ---
>  .../platform/rockchip/rkisp1/rkisp1-debug.c   | 83 ++++++++-----------
>  1 file changed, 33 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> index d6cfbfaba3cb..2c226f20f525 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-debug.c
> @@ -19,16 +19,20 @@
>  
>  struct rkisp1_debug_register {
>  	u32 reg;
> +	u32 shd;
>  	const char * const name;
>  };
>  
> -#define RKISP1_DEBUG_REG(name)	{ RKISP1_CIF_##name, #name }
> +#define RKISP1_DEBUG_REG(name)		{ RKISP1_CIF_##name, 0, #name }
> +#define RKISP1_DEBUG_SHD_REG(name) { \
> +	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name \
> +}
>  
> -static int rkisp1_debug_dump_regs(struct seq_file *m,
> +static int rkisp1_debug_dump_regs(struct rkisp1_device *rkisp1,
> +				  struct seq_file *m, unsigned int offset,
>  				  const struct rkisp1_debug_register *regs)
>  {
> -	struct rkisp1_device *rkisp1 = m->private;
> -	u32 val;
> +	u32 val, shd;
>  	int ret;
>  
>  	ret = pm_runtime_get_if_in_use(rkisp1->dev);
> @@ -36,8 +40,15 @@ static int rkisp1_debug_dump_regs(struct seq_file *m,
>  		return ret ? : -ENODATA;
>  
>  	for ( ; regs->name; ++regs) {
> -		val = rkisp1_read(rkisp1, regs->reg);
> -		seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> +		val = rkisp1_read(rkisp1, offset + regs->reg);
> +
> +		if (regs->shd) {
> +			shd = rkisp1_read(rkisp1, offset + regs->shd);
> +			seq_printf(m, "%14s: 0x%08x/0x%08x\n", regs->name,
> +				   val, shd);
> +		} else {
> +			seq_printf(m, "%14s: 0x%08x\n", regs->name, val);
> +		}
>  	}
>  
>  	pm_runtime_put(rkisp1->dev);
> @@ -61,8 +72,9 @@ static int rkisp1_debug_dump_core_regs_show(struct seq_file *m, void *p)
>  		RKISP1_DEBUG_REG(MI_DMA_STATUS),
>  		{ /* Sentinel */ },
>  	};
> +	struct rkisp1_device *rkisp1 = m->private;
>  
> -	return rkisp1_debug_dump_regs(m, registers);
> +	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
>  }
>  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_core_regs);
>  
> @@ -76,59 +88,30 @@ static int rkisp1_debug_dump_isp_regs_show(struct seq_file *m, void *p)
>  		RKISP1_DEBUG_REG(ISP_ERR),
>  		{ /* Sentinel */ },
>  	};
> +	struct rkisp1_device *rkisp1 = m->private;
>  
> -	return rkisp1_debug_dump_regs(m, registers);
> +	return rkisp1_debug_dump_regs(rkisp1, m, 0, registers);
>  }
>  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_isp_regs);
>  
> -#define RKISP1_DEBUG_RSZ_REG_DEC(name) { \
> -	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, false \
> -}
> -
> -#define RKISP1_DEBUG_RSZ_REG_HEX(name) { \
> -	RKISP1_CIF_##name, RKISP1_CIF_##name##_SHD, #name, true \
> -}
> -
>  static int rkisp1_debug_dump_rsz_regs_show(struct seq_file *m, void *p)
>  {
> -	static const struct {
> -		u32 reg;
> -		u32 shadow;
> -		const char * const name;
> -		bool hex;
> -	} registers[] = {
> -		RKISP1_DEBUG_RSZ_REG_HEX(RSZ_CTRL),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HY),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCB),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_HCR),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VY),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_SCALE_VC),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HY),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_HC),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VY),
> -		RKISP1_DEBUG_RSZ_REG_DEC(RSZ_PHASE_VC),
> +	static const struct rkisp1_debug_register registers[] = {
> +		RKISP1_DEBUG_SHD_REG(RSZ_CTRL),
> +		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_HY),
> +		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_HCB),
> +		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_HCR),
> +		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_VY),
> +		RKISP1_DEBUG_SHD_REG(RSZ_SCALE_VC),
> +		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_HY),
> +		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_HC),
> +		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_VY),
> +		RKISP1_DEBUG_SHD_REG(RSZ_PHASE_VC),
>  		{ /* Sentinel */ },
>  	};
> -
>  	struct rkisp1_resizer *rsz = m->private;
> -	typeof(registers[0]) *reg;
> -	u32 val, shd;
> -	int ret;
>  
> -	ret = pm_runtime_get_if_in_use(rsz->rkisp1->dev);
> -	if (ret <= 0)
> -		return ret ? : -ENODATA;
> -
> -	for (reg = registers; reg->name; ++reg) {
> -		val = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->reg);
> -		shd = rkisp1_read(rsz->rkisp1, rsz->regs_base + reg->shadow);
> -		seq_printf(m, reg->hex ? "%14s: 0x%08x/0x%08x\n" : "%14s: %u/%u\n",
> -			   reg->name, val, shd);
> -	}
> -
> -	pm_runtime_put(rsz->rkisp1->dev);
> -
> -	return 0;
> +	return rkisp1_debug_dump_regs(rsz->rkisp1, m, rsz->regs_base, registers);
>  }
>  DEFINE_SHOW_ATTRIBUTE(rkisp1_debug_dump_rsz_regs);
>  
> -- 
> Regards,
> 
> Laurent Pinchart
> 
> 
