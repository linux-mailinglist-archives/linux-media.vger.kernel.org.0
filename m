Return-Path: <linux-media+bounces-27257-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21861A4A731
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 01:45:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A94563BABC9
	for <lists+linux-media@lfdr.de>; Sat,  1 Mar 2025 00:45:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D72C91B95B;
	Sat,  1 Mar 2025 00:45:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KI54OpKv"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60AC781E;
	Sat,  1 Mar 2025 00:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740789925; cv=none; b=TiiybJCMAbBLlFSMd6ij2KERW0MW9GPigpTBxyYkmlBuLQGUC8CBz8nkvcWx7SHfRsAff74uho2lFlGppD45x8kbp0IqdKGPeg1vaCZJiK8JocSh87lh5qMzgr0y32UETsryfMt2hFQhY7G/X8iElII88W4XM2KPIu11Ea41eyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740789925; c=relaxed/simple;
	bh=u4ER5VeMCS9Y7zQdcDvvTBan6ITLcL5eE830Y0FQJIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NquTdk++EfKDl23tCy+pQHE/AfDtRvTAu0GtSYxvGQtDy3EouvIGhkG1ypv3Wgdy8/5ZpNRRsj8u3M42jsqKM4DMXYa7LZ7yBbUyx/oO46r5nZ3Xp+IxP8fypmtwuRYt2a4iI0KExc+rnmk3YgJitUs1fdzpjWjpNhDmL12CaqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KI54OpKv; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F3F02520;
	Sat,  1 Mar 2025 01:43:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740789832;
	bh=u4ER5VeMCS9Y7zQdcDvvTBan6ITLcL5eE830Y0FQJIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KI54OpKvOnqhvdSQL777/pI91DKMeoYS/ct2HGIH8pWIicPzYlz/lxiqGe2kreyfo
	 MMijQhGer5J0VnWs9/aZdnjoDSoLFwi7pvKfQup5cMIZZVVeALxqDi0oskiuTvSCbF
	 p4v6gQwTHyKabqbrhHTdX4c851wCQ17iaHvEAvL8=
Date: Sat, 1 Mar 2025 02:45:02 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: linux-media@vger.kernel.org, Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] media: rkisp1: Fix the quantization settings of CPROC
Message-ID: <20250301004502.GH7342@pendragon.ideasonboard.com>
References: <20250227114558.3097101-1-stefan.klug@ideasonboard.com>
 <20250227114558.3097101-3-stefan.klug@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250227114558.3097101-3-stefan.klug@ideasonboard.com>

Hi Stefan,

Thank you for the patch.

On Thu, Feb 27, 2025 at 12:45:00PM +0100, Stefan Klug wrote:
> On the imx8mp the Image Effect module is not supported.

Could you please include a patch that adds a feature flag for this, and
disables the feature on i.MX8MP ? That requires:

- Clearing the module update bits based on the feature flag in
  rkisp1_isp_isr_other_config(), as done for BLS.
- Marking the RKISP1_EXT_PARAMS_BLOCK_TYPE_IE entry in
  rkisp1_ext_params_handler with the new feature flag.

> In my case the
> effect variable had an uninitialized default value of 0x700 leading to
> limited YUV range in all cases (effects were never touched from user
> space).

I don't think the value of an uninitialized variable is relevant :-)

> The effects configuration is as far is I understand completely
> independent of CPROC.

I agree the CPROC and IMGEFF blocks are most likely separate, but they
both need to be configured according to the selected quantization.

Quantization is applied by the CSM (CSC) block, configured in
rkisp1_csm_config(). The CPROC module follows, and its
RKISP1_CIF_C_PROC_CTRL register needs to take quantization into account.
It has one bit to indicate whether its input data (produced by the CSM
block) is in full or limited range, and two bits to set the range of
output data (separately for luma and chroma, I have no idea why).

The rkisp1_cproc_config() function assumes that the input and output
quantization of the CPROC are always the same. It sets or clears all
three configuration bits based on the quantization value. As you've
noticed, it will also hardcode limited range when an image effect is
selected. That seems wrong indeed.

Note that the CPROC quantization bits only controls the Y offset
(subtracted on the input side and added on the output side) and the Y
and C clipping (on the output side). If we were to have different
quantization on the input and output, the scaling factor to adjust the
range seems to be something that userspace needs to take into account
when calculating values for the other CPROC registers.

Then, the IE (IMGEFF) block processes the data, and also needs to be
configured based on the quantization range. The control register has a
single bit that selects limited or full range. It is set in
rkisp1_ie_config():

	if (params->quantization == V4L2_QUANTIZATION_FULL_RANGE)
		eff_ctrl |= RKISP1_CIF_IMG_EFF_CTRL_YCBCR_FULL;

There's a note in the documentation of the RKISP1_CIF_IMG_EFF_CTRL
register in the RK3399 registers manual that states

  Note: full_range for image effects is supported in ISP M5_v6, M5_v7 only

The ISP version in the RK3399 seems to be M14_v2. This may be why the
code disables full range quantization in rkisp1_cproc_config() when a
image effect is selected.

All of this is a mess, and to make it worse, the implementation in the
driver is quite broken. The effect is selected by the
RKISP1_CIF_IMG_EFF_CTRL register, written in rkisp1_ie_config(), and the
rkisp1_ie_enable() function then rewrites the whole register to enable
the module, overwriting the selected effect. Only when userspace sets
the effect without updating the module enable bit does the driver seem
to handle things correctly.

Now, how do we handle this ? I think this patch is fine, but the commit
message needs a rewrite to summarize the above, and explain that the
CPROC never changes quantization. A corresponding comment in
rkisp1_cproc_config() would be useful.

Regarding the image effect configuration, I think we can consider that
it should only be enabled by userspace when using limited range, if
running on a device that doesn't support full range for image effects.
The driver doesn't need to protect against this in my opinion. A comment
in rkisp1_ie_config() could also be useful to explain that.

> Completely remove that check. This fixes full
> range mode on imx8mp and possibly others.
>
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-params.c | 8 +-------
>  1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index b28f4140c8a3..8d61e21ad475 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -764,11 +764,6 @@ static void rkisp1_aec_config_v12(struct rkisp1_params *params,
>  static void rkisp1_cproc_config(struct rkisp1_params *params,
>  				const struct rkisp1_cif_isp_cproc_config *arg)
>  {
> -	struct rkisp1_cif_isp_isp_other_cfg *cur_other_cfg =
> -		container_of(arg, struct rkisp1_cif_isp_isp_other_cfg, cproc_config);
> -	struct rkisp1_cif_isp_ie_config *cur_ie_config =
> -						&cur_other_cfg->ie_config;
> -	u32 effect = cur_ie_config->effect;
>  	u32 quantization = params->quantization;
>  
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_CONTRAST,
> @@ -778,8 +773,7 @@ static void rkisp1_cproc_config(struct rkisp1_params *params,
>  	rkisp1_write(params->rkisp1, RKISP1_CIF_C_PROC_BRIGHTNESS,
>  		     arg->brightness);
>  
> -	if (quantization != V4L2_QUANTIZATION_FULL_RANGE ||
> -	    effect != V4L2_COLORFX_NONE) {
> +	if (quantization != V4L2_QUANTIZATION_FULL_RANGE) {
>  		rkisp1_param_clear_bits(params, RKISP1_CIF_C_PROC_CTRL,
>  					RKISP1_CIF_C_PROC_YOUT_FULL |
>  					RKISP1_CIF_C_PROC_YIN_FULL |

-- 
Regards,

Laurent Pinchart

