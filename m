Return-Path: <linux-media+bounces-15255-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1D893910F
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 16:54:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C19E01C2149E
	for <lists+linux-media@lfdr.de>; Mon, 22 Jul 2024 14:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D41AF16DEA6;
	Mon, 22 Jul 2024 14:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kQqaS/+8"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFC9D16DC24;
	Mon, 22 Jul 2024 14:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721660052; cv=none; b=ldR69oaVTjaF1DPFukpfpfVoXz9UdSzoOWMf+qfOKb0LX0DEDK3Dkz6Pn0sfCYmZ/ELBB0qej5z+Wdz/Xb6tQcORTKyZGUXwqUCNg9qgmlMWL9AeEkE+74cnmqB97KTe/Je5b8hJaq3dpt6TvZidFwFzM4qNvgsX2l+iMgeZGV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721660052; c=relaxed/simple;
	bh=Q2FwSzFq/GospOq2XVZJT/X91cvp3/KwHa3ZoDG6VQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCj8Z+/5S6+7p4UzKf7fkcIzWdPsxbz8cHtvRC+MUGLwHy+XPkVCco51nq/3iNBDqnJKGbeIz20FSmH71KHTM1Kjm90ft3XtYJoYJkI4A5zVxv3z52BitbfLvyahnn13uOTcw+BazR9rk+zZrq65lMwhHr6sAiLhBfyoQL4eLkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kQqaS/+8; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B66E4CF;
	Mon, 22 Jul 2024 16:53:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1721660007;
	bh=Q2FwSzFq/GospOq2XVZJT/X91cvp3/KwHa3ZoDG6VQA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQqaS/+8TE1LWCzzAKNvyd+UdSsFV9nIe6hkrFQXddd/hgIJxWrF3qsC1Xdp79SE2
	 ItGu+namZlkNJhw5L0PYJGvpSZoT6tzW8jlifTEjkDyUYEDoqLIdTssJWTvTKndsGY
	 mGuzUHq96yNjhZIjyfp84g1HEnq3Fqlnqn26rBLw=
Date: Mon, 22 Jul 2024 17:53:50 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mingjia Zhang <mingjia.zhang@mediatek.com>,
	Jack Zhu <jack.zhu@starfivetech.com>,
	Keith Zhao <keith.zhao@starfivetech.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v5 09/14] staging: media: starfive: Update ISP initialise
 config for 3A
Message-ID: <20240722145350.GK13497@pendragon.ideasonboard.com>
References: <20240709083824.430473-1-changhuang.liang@starfivetech.com>
 <20240709083824.430473-10-changhuang.liang@starfivetech.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240709083824.430473-10-changhuang.liang@starfivetech.com>

Hi Changhuang,

Thank you for the patch.

On Tue, Jul 09, 2024 at 01:38:19AM -0700, Changhuang Liang wrote:
> Upadte ISP initialise for 3A statistics collection data.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../media/starfive/camss/stf-isp-hw-ops.c     | 23 +++++++++++++++++++
>  .../staging/media/starfive/camss/stf-isp.h    | 21 +++++++++++++++++
>  2 files changed, 44 insertions(+)
> 
> diff --git a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
> index 3b18d09f2cc6..0bc5e36f952e 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
> +++ b/drivers/staging/media/starfive/camss/stf-isp-hw-ops.c
> @@ -300,6 +300,25 @@ static void stf_isp_config_sat(struct stfcamss *stfcamss)
>  	stf_isp_reg_write(stfcamss, ISP_REG_YADJ1, YOMAX(0x3ff) | YOMIN(0x1));
>  }
>  
> +static void stf_isp_config_sc(struct stfcamss *stfcamss)
> +{
> +	stf_isp_reg_write(stfcamss, ISP_REG_SCD_CFG_1, AXI_ID(0));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_0, HSTART(0) | VSTART(0xc));
> +	stf_isp_reg_write(stfcamss, ISP_REG_SC_CFG_1,
> +			  SC_WIDTH(0x1d) | SC_HEIGHT(0x15) |
> +			  AWB_PS_GRB_BA(0x10) | SEL_TYPE(0x3));

There's lots of magic values here and below. A comment would be good.

> +}
> +
> +static void stf_isp_config_yhist(struct stfcamss *stfcamss)
> +{
> +	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_0, 0);
> +	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_1,
> +			  YH_WIDTH(0x77f) | YH_HEIGHT(0x437));

Does this hardcode the size of the histogram window to 1920x1080 ? It
should be made configurable from userspace. Maybe that's handled in
further patches in this series.

> +	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_2,
> +			  YH_DEC_ETW(2) | YH_DEC_ETH(1));
> +	stf_isp_reg_write(stfcamss, ISP_REG_YHIST_CFG_3, 0);
> +}
> +
>  int stf_isp_reset(struct stf_isp_dev *isp_dev)
>  {
>  	stf_isp_reg_set_bit(isp_dev->stfcamss, ISP_REG_ISP_CTRL_0,
> @@ -332,7 +351,11 @@ void stf_isp_init_cfg(struct stf_isp_dev *isp_dev)
>  	stf_isp_config_sharpen(isp_dev->stfcamss);
>  	stf_isp_config_dnyuv(isp_dev->stfcamss);
>  	stf_isp_config_sat(isp_dev->stfcamss);
> +	stf_isp_config_sc(isp_dev->stfcamss);
> +	stf_isp_config_yhist(isp_dev->stfcamss);
>  
> +	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_DUMP_CFG_1,
> +			  DUMP_BURST_LEN(3) | DUMP_SD(0xb80));
>  	stf_isp_reg_write(isp_dev->stfcamss, ISP_REG_CSI_MODULE_CFG,
>  			  CSI_DUMP_EN | CSI_SC_EN | CSI_AWB_EN |
>  			  CSI_LCCF_EN | CSI_OECF_EN | CSI_OBC_EN | CSI_DEC_EN);
> diff --git a/drivers/staging/media/starfive/camss/stf-isp.h b/drivers/staging/media/starfive/camss/stf-isp.h
> index 0af7b367e57a..eca3ba1ade75 100644
> --- a/drivers/staging/media/starfive/camss/stf-isp.h
> +++ b/drivers/staging/media/starfive/camss/stf-isp.h
> @@ -110,9 +110,19 @@
>  
>  #define ISP_REG_SCD_CFG_0			0x098
>  
> +#define ISP_REG_SCD_CFG_1			0x09c
> +#define AXI_ID(n)				((n) << 24)
> +
> +#define ISP_REG_SC_CFG_0			0x0b8
> +#define VSTART(n)				((n) << 16)
> +#define HSTART(n)				((n) << 0)
> +
>  #define ISP_REG_SC_CFG_1			0x0bc
>  #define ISP_SC_SEL_MASK				GENMASK(31, 30)
>  #define SEL_TYPE(n)				((n) << 30)
> +#define AWB_PS_GRB_BA(n)			((n) << 16)
> +#define SC_HEIGHT(n)				((n) << 8)
> +#define SC_WIDTH(n)				((n) << 0)
>  
>  #define ISP_REG_LCCF_CFG_2			0x0e0
>  #define ISP_REG_LCCF_CFG_3			0x0e4
> @@ -312,6 +322,17 @@
>  #define DNRM_F(n)				((n) << 16)
>  #define CCM_M_DAT(n)				((n) << 0)
>  
> +#define ISP_REG_YHIST_CFG_0			0xcc8
> +
> +#define ISP_REG_YHIST_CFG_1			0xccc
> +#define YH_HEIGHT(n)				((n) << 16)
> +#define YH_WIDTH(n)				((n) << 0)
> +
> +#define ISP_REG_YHIST_CFG_2			0xcd0
> +#define YH_DEC_ETH(n)				((n) << 16)
> +#define YH_DEC_ETW(n)				((n) << 0)
> +
> +#define ISP_REG_YHIST_CFG_3			0xcd4
>  #define ISP_REG_YHIST_CFG_4			0xcd8
>  
>  #define ISP_REG_YHIST_ACC_0			0xd00
> -- 
> 2.25.1
> 

-- 
Regards,

Laurent Pinchart

