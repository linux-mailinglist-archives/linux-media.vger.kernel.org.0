Return-Path: <linux-media+bounces-30615-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8553AA951A0
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 15:26:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A48F4171EB9
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 13:26:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33300265CD5;
	Mon, 21 Apr 2025 13:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DZqMeHWm"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1691362;
	Mon, 21 Apr 2025 13:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745241954; cv=none; b=hn4XxTPdSIF9zXa6q/BuPNJcv0XCpqGPXBO8zIxuI6+4OrA5NXiW/vONZMjycmNS+6oumks4jfxuQA6JpCtGhfq8ttuVQgG8xrQpSK5u0kKJYr+B7hYhGD11GIhfvSAuwHjDmduAJ5RQFRThnKp/1dvv1R4emzw2T+2MIFDDZ70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745241954; c=relaxed/simple;
	bh=MJzn4Zot4H4HeKEF6X8CGIulijakqTFooUzzdTfATqc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PTsC30Ks412fj0xN5GVYNHFLTd072ROJbQmE9N0279jWPbsi7hTqyTYjC8s7GkteJBg83J8h0pSgvjAacbvKoWB3mR6XD6nOZLIbAZkA8Ud1FlSH/9xz+l3NAS+dr6fbb8DoH2kEOd/3bQDdtOgeQAfgpnu7taJ+T1VoN5MGp00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DZqMeHWm; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BED16D5;
	Mon, 21 Apr 2025 15:23:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745241824;
	bh=MJzn4Zot4H4HeKEF6X8CGIulijakqTFooUzzdTfATqc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DZqMeHWmEtnO3jQYs4mzh987IXhYkmAwY3UkDe26goGlZbjbRYii11+6OAkDmoGfW
	 rtPiGHHMh4br+mqXdlRHYv4cMp83OoO3aQ5Nob7J70dTPObbv82trS5jfQIjyFa5hT
	 rE/+3qbLuzb2drV6hMyvqYSBIzZWjSGz0X4hr8A4=
Date: Mon, 21 Apr 2025 16:25:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, mripard@kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	devarsht@ti.com, y-abhilashchandra@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	vaishnav.a@ti.com, s-jain1@ti.com, vigneshr@ti.com,
	sakari.ailus@linux.intel.com, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, jack.zhu@starfivetech.com
Subject: Re: [PATCH v3 09/13] media: cadence: csi2rx: Use new enable stream
 APIs
Message-ID: <20250421132549.GH29483@pendragon.ideasonboard.com>
References: <20250417065554.437541-1-r-donadkar@ti.com>
 <20250417065554.437541-10-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250417065554.437541-10-r-donadkar@ti.com>

Hi Rishikesh,

Thank you for the patch.

On Thu, Apr 17, 2025 at 12:25:50PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> The enable_streams() API in v4l2 supports passing a bitmask to enable
> each pad/stream combination individually on any media subdev instead of
> doing s_stream(1) to start all streams on the subdev at once.
> 
> This API is implemented by ds90ub960 driver (FPDLink deser) and thus the
> caller (cdns-csi2x) is required to use it. For now we only enable
> stream0.
> 
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> ---
>  drivers/media/platform/cadence/cdns-csi2rx.c | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
> index b7e9225f66a41..df05d278df379 100644
> --- a/drivers/media/platform/cadence/cdns-csi2rx.c
> +++ b/drivers/media/platform/cadence/cdns-csi2rx.c
> @@ -224,10 +224,18 @@ static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
>  static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  {
>  	unsigned int i;
> +	struct media_pad *remote_pad;
>  	unsigned long lanes_used = 0;
>  	u32 reg;
>  	int ret;
>  
> +	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);

Can't you use csi2rx->source_pad instead ?

> +	if (!remote_pad) {
> +		dev_err(csi2rx->dev,
> +			"Failed to find connected source\n");
> +		return -ENODEV;
> +	}
> +
>  	ret = clk_prepare_enable(csi2rx->p_clk);
>  	if (ret)
>  		return ret;
> @@ -311,7 +319,8 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  	reset_control_deassert(csi2rx->sys_rst);
>  
> -	ret = v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, true);
> +	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev,
> +					 remote_pad->index, BIT(0));
>  	if (ret)
>  		goto err_disable_sysclk;
>  
> @@ -339,6 +348,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
>  
>  static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  {
> +	struct media_pad *remote_pad;
>  	unsigned int i;
>  	u32 val;
>  	int ret;
> @@ -367,8 +377,12 @@ static void csi2rx_stop(struct csi2rx_priv *csi2rx)
>  	reset_control_assert(csi2rx->p_rst);
>  	clk_disable_unprepare(csi2rx->p_clk);
>  
> -	if (v4l2_subdev_call(csi2rx->source_subdev, video, s_stream, false))
> +	remote_pad = media_pad_remote_pad_first(&csi2rx->pads[CSI2RX_PAD_SINK]);
> +	if (!remote_pad ||
> +	    v4l2_subdev_disable_streams(csi2rx->source_subdev,
> +					remote_pad->index, BIT(0))) {
>  		dev_warn(csi2rx->dev, "Couldn't disable our subdev\n");
> +	}
>  
>  	if (csi2rx->dphy) {
>  		writel(0, csi2rx->base + CSI2RX_DPHY_LANE_CTRL_REG);

-- 
Regards,

Laurent Pinchart

