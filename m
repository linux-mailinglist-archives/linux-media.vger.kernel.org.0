Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E175A660286
	for <lists+linux-media@lfdr.de>; Fri,  6 Jan 2023 15:51:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbjAFOuo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 6 Jan 2023 09:50:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235303AbjAFOul (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Fri, 6 Jan 2023 09:50:41 -0500
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2F6880AF1
        for <linux-media@vger.kernel.org>; Fri,  6 Jan 2023 06:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673016639; x=1704552639;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qiPlbkUL3A1+fNf2PWPklCr4v6XkK+btX1dWfv7ecZk=;
  b=oEieqG9TtESTOvkY89/kOkoosEAk6J+cHUfW+aqEmroyz9qbrgUgx8mp
   8lwSp/hVeTk+n/gbCnWaHRK/eFePEBgFqUiZS8L3h4FVsz9YOSs7gONl9
   lPjUIwc5lBUnGkGVdgLODimVLvHxLGvFQW+t2iX2M2I40Gtm5U6g0tCaF
   fYBQ5TzJ//IRyjninbJb2PnffqqlgRPO16jtoJTrHRvFOFfrLZgGFv06B
   s2TZOvNoPkaq1NCbmjkcqSBlhk/hsKF5wLrrVrI034OQCwTfOm+N6WF9/
   ox784VRKy5Q/aP7wtzz/OwaXatZ87GqH1S0BYNQI9ohudLxngWBsdSHpa
   Q==;
X-IronPort-AV: E=Sophos;i="5.96,305,1665439200"; 
   d="scan'208";a="28275124"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 06 Jan 2023 15:50:37 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Fri, 06 Jan 2023 15:50:37 +0100
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Fri, 06 Jan 2023 15:50:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1673016637; x=1704552637;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qiPlbkUL3A1+fNf2PWPklCr4v6XkK+btX1dWfv7ecZk=;
  b=Hp/DET9w83GAz0eppIT8090xyd0r0VJSYRoOYcsUR+oC6iQ3+9UQ3HQV
   aEUW7pBQPM+gpcLDyrWGlWkGy4G+vCPWYAX+RFlAvA2ZlEswqHIpP6eTe
   YXU+dVeTdACh05TGUgqSvp5kty6Kw7DW/hg7psSc7z9Ibec29Va8D+VdR
   3kWl6tNwnReFHphgwoV8h104K0iEOpib1FeyTWZr1b/MBZHDd5WGWTr4m
   gStHRaJm9Eg2+N2b415VzwooyqzecKKGrvZjZDo+YJ/M81r/F0gHT1r70
   U9xhlUQZZB+hlylLgIb7meqVlQhiJIP5D/WylaKe9s554O7EJNONocPll
   A==;
X-IronPort-AV: E=Sophos;i="5.96,305,1665439200"; 
   d="scan'208";a="28275123"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 06 Jan 2023 15:50:37 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id AABEF280056;
        Fri,  6 Jan 2023 15:50:37 +0100 (CET)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     linux-media@vger.kernel.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Michael Tretter <m.tretter@pengutronix.de>,
        Philipp Zabel <p.zabel@pengutronix.de>, kernel@pengutronix.de,
        linux-imx@nxp.com
Subject: Re: [PATCH v1 5/6] media: imx-pxp: Introduce pxp_read() and pxp_write() wrappers
Date:   Fri, 06 Jan 2023 15:50:37 +0100
Message-ID: <1818343.QZUTf85G27@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20230106133227.13685-6-laurent.pinchart@ideasonboard.com>
References: <20230106133227.13685-1-laurent.pinchart@ideasonboard.com> <20230106133227.13685-6-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent,

Am Freitag, 6. Januar 2023, 14:32:26 CET schrieb Laurent Pinchart:
> Add pxp_read() and pxp_write() functions to wrap readl() and writel()
> respectively. This can be useful for debugging register accesses.

I know this is just sending old patches, but how about using regmap-mmio 
instead? This gives you access in debugfs for register values.

Best regards,
Alexander

> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/platform/nxp/imx-pxp.c | 118 +++++++++++++++------------
>  1 file changed, 64 insertions(+), 54 deletions(-)
> 
> diff --git a/drivers/media/platform/nxp/imx-pxp.c
> b/drivers/media/platform/nxp/imx-pxp.c index 68f838e3069d..e4d7a6339929
> 100644
> --- a/drivers/media/platform/nxp/imx-pxp.c
> +++ b/drivers/media/platform/nxp/imx-pxp.c
> @@ -253,6 +253,16 @@ static struct pxp_q_data *get_q_data(struct pxp_ctx
> *ctx, return &ctx->q_data[V4L2_M2M_DST];
>  }
> 
> +static inline u32 pxp_read(struct pxp_dev *dev, u32 reg)
> +{
> +	return readl(dev->mmio + reg);
> +}
> +
> +static inline void pxp_write(struct pxp_dev *dev, u32 reg, u32 value)
> +{
> +	writel(value, dev->mmio + reg);
> +}
> +
>  static u32 pxp_v4l2_pix_fmt_to_ps_format(u32 v4l2_pix_fmt)
>  {
>  	switch (v4l2_pix_fmt) {
> @@ -505,11 +515,11 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
>  				csc1_coef = csc1_coef_smpte240m_lim;
>  		}
> 
> -		writel(csc1_coef[0], dev->mmio + HW_PXP_CSC1_COEF0);
> -		writel(csc1_coef[1], dev->mmio + HW_PXP_CSC1_COEF1);
> -		writel(csc1_coef[2], dev->mmio + HW_PXP_CSC1_COEF2);
> +		pxp_write(dev, HW_PXP_CSC1_COEF0, csc1_coef[0]);
> +		pxp_write(dev, HW_PXP_CSC1_COEF1, csc1_coef[1]);
> +		pxp_write(dev, HW_PXP_CSC1_COEF2, csc1_coef[2]);
>  	} else {
> -		writel(BM_PXP_CSC1_COEF0_BYPASS, dev->mmio + 
HW_PXP_CSC1_COEF0);
> +		pxp_write(dev, HW_PXP_CSC1_COEF0, 
BM_PXP_CSC1_COEF0_BYPASS);
>  	}
> 
>  	if (!pxp_v4l2_pix_fmt_is_yuv(ctx->q_data[V4L2_M2M_SRC].fmt->fourcc) 
&&
> @@ -725,15 +735,15 @@ static void pxp_setup_csc(struct pxp_ctx *ctx)
>  				    BP_PXP_CSC2_CTRL_CSC_MODE;
>  		}
> 
> -		writel(csc2_ctrl, dev->mmio + HW_PXP_CSC2_CTRL);
> -		writel(csc2_coef[0], dev->mmio + HW_PXP_CSC2_COEF0);
> -		writel(csc2_coef[1], dev->mmio + HW_PXP_CSC2_COEF1);
> -		writel(csc2_coef[2], dev->mmio + HW_PXP_CSC2_COEF2);
> -		writel(csc2_coef[3], dev->mmio + HW_PXP_CSC2_COEF3);
> -		writel(csc2_coef[4], dev->mmio + HW_PXP_CSC2_COEF4);
> -		writel(csc2_coef[5], dev->mmio + HW_PXP_CSC2_COEF5);
> +		pxp_write(dev, HW_PXP_CSC2_CTRL, csc2_ctrl);
> +		pxp_write(dev, HW_PXP_CSC2_COEF0, csc2_coef[0]);
> +		pxp_write(dev, HW_PXP_CSC2_COEF1, csc2_coef[1]);
> +		pxp_write(dev, HW_PXP_CSC2_COEF2, csc2_coef[2]);
> +		pxp_write(dev, HW_PXP_CSC2_COEF3, csc2_coef[3]);
> +		pxp_write(dev, HW_PXP_CSC2_COEF4, csc2_coef[4]);
> +		pxp_write(dev, HW_PXP_CSC2_COEF5, csc2_coef[5]);
>  	} else {
> -		writel(BM_PXP_CSC2_CTRL_BYPASS, dev->mmio + 
HW_PXP_CSC2_CTRL);
> +		pxp_write(dev, HW_PXP_CSC2_CTRL, BM_PXP_CSC2_CTRL_BYPASS);
>  	}
>  }
> 
> @@ -820,8 +830,8 @@ static void pxp_set_data_path(struct pxp_ctx *ctx)
>  	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX17_SEL(3);
>  	ctrl1 |= BF_PXP_DATA_PATH_CTRL1_MUX16_SEL(3);
> 
> -	writel(ctrl0, dev->mmio + HW_PXP_DATA_PATH_CTRL0);
> -	writel(ctrl1, dev->mmio + HW_PXP_DATA_PATH_CTRL1);
> +	pxp_write(dev, HW_PXP_DATA_PATH_CTRL0, ctrl0);
> +	pxp_write(dev, HW_PXP_DATA_PATH_CTRL1, ctrl1);
>  }
> 
>  static int pxp_start(struct pxp_ctx *ctx, struct vb2_v4l2_buffer *in_vb,
> @@ -977,48 +987,48 @@ static int pxp_start(struct pxp_ctx *ctx, struct
> vb2_v4l2_buffer *in_vb, BF_PXP_PS_SCALE_XSCALE(xscale);
>  	ps_offset = BF_PXP_PS_OFFSET_YOFFSET(0) | 
BF_PXP_PS_OFFSET_XOFFSET(0);
> 
> -	writel(ctrl, dev->mmio + HW_PXP_CTRL);
> +	pxp_write(dev, HW_PXP_CTRL, ctrl);
>  	/* skip STAT */
> -	writel(out_ctrl, dev->mmio + HW_PXP_OUT_CTRL);
> -	writel(out_buf, dev->mmio + HW_PXP_OUT_BUF);
> -	writel(out_buf2, dev->mmio + HW_PXP_OUT_BUF2);
> -	writel(out_pitch, dev->mmio + HW_PXP_OUT_PITCH);
> -	writel(out_lrc, dev->mmio + HW_PXP_OUT_LRC);
> -	writel(out_ps_ulc, dev->mmio + HW_PXP_OUT_PS_ULC);
> -	writel(out_ps_lrc, dev->mmio + HW_PXP_OUT_PS_LRC);
> -	writel(as_ulc, dev->mmio + HW_PXP_OUT_AS_ULC);
> -	writel(as_lrc, dev->mmio + HW_PXP_OUT_AS_LRC);
> -	writel(ps_ctrl, dev->mmio + HW_PXP_PS_CTRL);
> -	writel(ps_buf, dev->mmio + HW_PXP_PS_BUF);
> -	writel(ps_ubuf, dev->mmio + HW_PXP_PS_UBUF);
> -	writel(ps_vbuf, dev->mmio + HW_PXP_PS_VBUF);
> -	writel(ps_pitch, dev->mmio + HW_PXP_PS_PITCH);
> -	writel(0x00ffffff, dev->mmio + HW_PXP_PS_BACKGROUND_0);
> -	writel(ps_scale, dev->mmio + HW_PXP_PS_SCALE);
> -	writel(ps_offset, dev->mmio + HW_PXP_PS_OFFSET);
> +	pxp_write(dev, HW_PXP_OUT_CTRL, out_ctrl);
> +	pxp_write(dev, HW_PXP_OUT_BUF, out_buf);
> +	pxp_write(dev, HW_PXP_OUT_BUF2, out_buf2);
> +	pxp_write(dev, HW_PXP_OUT_PITCH, out_pitch);
> +	pxp_write(dev, HW_PXP_OUT_LRC, out_lrc);
> +	pxp_write(dev, HW_PXP_OUT_PS_ULC, out_ps_ulc);
> +	pxp_write(dev, HW_PXP_OUT_PS_LRC, out_ps_lrc);
> +	pxp_write(dev, HW_PXP_OUT_AS_ULC, as_ulc);
> +	pxp_write(dev, HW_PXP_OUT_AS_LRC, as_lrc);
> +	pxp_write(dev, HW_PXP_PS_CTRL, ps_ctrl);
> +	pxp_write(dev, HW_PXP_PS_BUF, ps_buf);
> +	pxp_write(dev, HW_PXP_PS_UBUF, ps_ubuf);
> +	pxp_write(dev, HW_PXP_PS_VBUF, ps_vbuf);
> +	pxp_write(dev, HW_PXP_PS_PITCH, ps_pitch);
> +	pxp_write(dev, HW_PXP_PS_BACKGROUND_0, 0x00ffffff);
> +	pxp_write(dev, HW_PXP_PS_SCALE, ps_scale);
> +	pxp_write(dev, HW_PXP_PS_OFFSET, ps_offset);
>  	/* disable processed surface color keying */
> -	writel(0x00ffffff, dev->mmio + HW_PXP_PS_CLRKEYLOW_0);
> -	writel(0x00000000, dev->mmio + HW_PXP_PS_CLRKEYHIGH_0);
> +	pxp_write(dev, HW_PXP_PS_CLRKEYLOW_0, 0x00ffffff);
> +	pxp_write(dev, HW_PXP_PS_CLRKEYHIGH_0, 0x00000000);
> 
>  	/* disable alpha surface color keying */
> -	writel(0x00ffffff, dev->mmio + HW_PXP_AS_CLRKEYLOW_0);
> -	writel(0x00000000, dev->mmio + HW_PXP_AS_CLRKEYHIGH_0);
> +	pxp_write(dev, HW_PXP_AS_CLRKEYLOW_0, 0x00ffffff);
> +	pxp_write(dev, HW_PXP_AS_CLRKEYHIGH_0, 0x00000000);
> 
>  	/* setup CSC */
>  	pxp_setup_csc(ctx);
> 
>  	/* bypass LUT */
> -	writel(BM_PXP_LUT_CTRL_BYPASS, dev->mmio + HW_PXP_LUT_CTRL);
> +	pxp_write(dev, HW_PXP_LUT_CTRL, BM_PXP_LUT_CTRL_BYPASS);
> 
>  	pxp_set_data_path(ctx);
> 
> -	writel(0xffff, dev->mmio + HW_PXP_IRQ_MASK);
> +	pxp_write(dev, HW_PXP_IRQ_MASK, 0xffff);
> 
>  	/* ungate, enable PS/AS/OUT and PXP operation */
> -	writel(BM_PXP_CTRL_IRQ_ENABLE, dev->mmio + HW_PXP_CTRL_SET);
> -	writel(BM_PXP_CTRL_ENABLE | BM_PXP_CTRL_ENABLE_CSC2 |
> -	       BM_PXP_CTRL_ENABLE_ROTATE0 |
> -	       BM_PXP_CTRL_ENABLE_PS_AS_OUT, dev->mmio + HW_PXP_CTRL_SET);
> +	pxp_write(dev, HW_PXP_CTRL_SET, BM_PXP_CTRL_IRQ_ENABLE);
> +	pxp_write(dev, HW_PXP_CTRL_SET,
> +		  BM_PXP_CTRL_ENABLE | BM_PXP_CTRL_ENABLE_CSC2 |
> +		  BM_PXP_CTRL_ENABLE_ROTATE0 | 
BM_PXP_CTRL_ENABLE_PS_AS_OUT);
> 
>  	return 0;
>  }
> @@ -1091,23 +1101,23 @@ static irqreturn_t pxp_irq_handler(int irq, void
> *dev_id) struct pxp_dev *dev = dev_id;
>  	u32 stat;
> 
> -	stat = readl(dev->mmio + HW_PXP_STAT);
> +	stat = pxp_read(dev, HW_PXP_STAT);
> 
>  	if (stat & BM_PXP_STAT_IRQ0) {
>  		/* we expect x = 0, y = height, irq0 = 1 */
>  		if (stat & ~(BM_PXP_STAT_BLOCKX | BM_PXP_STAT_BLOCKY |
>  			     BM_PXP_STAT_IRQ0))
>  			dprintk(dev, "%s: stat = 0x%08x\n", __func__, 
stat);
> -		writel(BM_PXP_STAT_IRQ0, dev->mmio + HW_PXP_STAT_CLR);
> +		pxp_write(dev, HW_PXP_STAT_CLR, BM_PXP_STAT_IRQ0);
> 
>  		pxp_job_finish(dev);
>  	} else {
> -		u32 irq = readl(dev->mmio + HW_PXP_IRQ);
> +		u32 irq = pxp_read(dev, HW_PXP_IRQ);
> 
>  		dprintk(dev, "%s: stat = 0x%08x\n", __func__, stat);
>  		dprintk(dev, "%s: irq = 0x%08x\n", __func__, irq);
> 
> -		writel(irq, dev->mmio + HW_PXP_IRQ_CLR);
> +		pxp_write(dev, HW_PXP_IRQ_CLR, irq);
>  	}
> 
>  	return IRQ_HANDLED;
> @@ -1753,25 +1763,25 @@ static int pxp_soft_reset(struct pxp_dev *dev)
>  	int ret;
>  	u32 val;
> 
> -	writel(BM_PXP_CTRL_SFTRST, dev->mmio + HW_PXP_CTRL_CLR);
> -	writel(BM_PXP_CTRL_CLKGATE, dev->mmio + HW_PXP_CTRL_CLR);
> +	pxp_write(dev, HW_PXP_CTRL_CLR, BM_PXP_CTRL_SFTRST);
> +	pxp_write(dev, HW_PXP_CTRL_CLR, BM_PXP_CTRL_CLKGATE);
> 
> -	writel(BM_PXP_CTRL_SFTRST, dev->mmio + HW_PXP_CTRL_SET);
> +	pxp_write(dev, HW_PXP_CTRL_SET, BM_PXP_CTRL_SFTRST);
> 
>  	ret = readl_poll_timeout(dev->mmio + HW_PXP_CTRL, val,
>  				 val & BM_PXP_CTRL_CLKGATE, 0, 100);
>  	if (ret < 0)
>  		return ret;
> 
> -	writel(BM_PXP_CTRL_SFTRST, dev->mmio + HW_PXP_CTRL_CLR);
> -	writel(BM_PXP_CTRL_CLKGATE, dev->mmio + HW_PXP_CTRL_CLR);
> +	pxp_write(dev, HW_PXP_CTRL_CLR, BM_PXP_CTRL_SFTRST);
> +	pxp_write(dev, HW_PXP_CTRL_CLR, BM_PXP_CTRL_CLKGATE);
> 
>  	return 0;
>  }
> 
>  static u32 pxp_read_version(struct pxp_dev *dev)
>  {
> -	return readl(dev->mmio + HW_PXP_VERSION);
> +	return pxp_read(dev, HW_PXP_VERSION);
>  }
> 
>  static int pxp_probe(struct platform_device *pdev)
> @@ -1902,8 +1912,8 @@ static int pxp_remove(struct platform_device *pdev)
>  {
>  	struct pxp_dev *dev = platform_get_drvdata(pdev);
> 
> -	writel(BM_PXP_CTRL_CLKGATE, dev->mmio + HW_PXP_CTRL_SET);
> -	writel(BM_PXP_CTRL_SFTRST, dev->mmio + HW_PXP_CTRL_SET);
> +	pxp_write(dev, HW_PXP_CTRL_SET, BM_PXP_CTRL_CLKGATE);
> +	pxp_write(dev, HW_PXP_CTRL_SET, BM_PXP_CTRL_SFTRST);
> 
>  	clk_disable_unprepare(dev->clk);




