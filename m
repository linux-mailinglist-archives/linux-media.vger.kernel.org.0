Return-Path: <linux-media+bounces-63620-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 1HCILAZAIGoJzQAAu9opvQ
	(envelope-from <linux-media+bounces-63620-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:53:58 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2423E638D1A
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 16:53:58 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=tHhv37+R;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63620-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63620-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 50B4A3100DD7
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 14:32:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 456F93385B6;
	Wed,  3 Jun 2026 14:32:19 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC48A27466A;
	Wed,  3 Jun 2026 14:32:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780497138; cv=none; b=SgzxPlWIInAuMPiydfl89pIbYvLlgLYg0eh3eBT7UI02QIAV318iRKYRDXVTlEceS8/fTrMSmrhiR2ssH3FJuLxBrimgWdbpaLh2hCvKbt/45a4mRW8vtBvrGpqojj+mi3HnUxGf6JRZMzXg2QTnFzDWwkVyBwAAigB16By+NhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780497138; c=relaxed/simple;
	bh=5ZH+OSBhL2so53L2WWD5PIEc1h3CV7p6yU5OwAgaHlc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=smq0v8kiOFsx9x2qRFb1NG6T6Qyfqwsodnt6KcAG5rkW7h9x8ehOjJVY/LDU+Lpr4ke55ukyrHtpTJM6AQN+DctxhzBNMwmx4A/cTzWtvkJ0xA1Q6/qYp0F/R+uEDOu1YXIyR53qLQiTb85Cn6YG24wNHKDjBtLt/y7YkU0W8jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tHhv37+R; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 19C8C8E0;
	Wed,  3 Jun 2026 16:31:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780497111;
	bh=5ZH+OSBhL2so53L2WWD5PIEc1h3CV7p6yU5OwAgaHlc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHhv37+RJOgtglW/bJI0nluzL39cPtx06NONUpIJJM4iyi3Ha1q0jaY4R1UKpzpkj
	 r0/AS5wJ0o6DIwpKKndihVEGonAEtYo7g6l8vOgxKAJK4s5Tn+fkJwlgdsSZyRi3MV
	 UEUJQnUNNVBk03dIv7YTTXJ6GlSoMN6wyhWGza2k=
Date: Wed, 3 Jun 2026 16:32:12 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 11/13] media: rppx1: lsc: Add support for lens shade
 correction
Message-ID: <aiA6lR6TeNHAxSFH@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-12-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516211320.3041412-12-niklas.soderlund+renesas@ragnatech.se>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63620-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,zed:mid,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,ragnatech.se:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2423E638D1A

Hi Niklas

On Sat, May 16, 2026 at 11:13:18PM +0200, Niklas Söderlund wrote:
> Extend the RPPX1 driver to allow setting the lens shade correction
> configuration parameters. It uses the RPPX1 framework for parameters and
> its writer abstraction to allow the user to control how, and when,
> configuration is applied to the RPPX1.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> ---
>  .../platform/dreamchip/rppx1/rpp_module.h     |   1 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
>  .../platform/dreamchip/rppx1/rppx1_lsc.c      | 119 ++++++++++++++++++
>  .../uapi/linux/media/dreamchip/rppx1-config.h |  54 +++++++-
>  4 files changed, 178 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index e039746ac542..48b61b5c35b4 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
>  union rppx1_params_block {
>  	struct v4l2_isp_block_header header;
>  	struct rppx1_bls_params bls;
> +	struct rppx1_lsc_params lsc;
>  	struct rppx1_awbg_params awbg;
>  	struct rppx1_ccor_params ccor;
>  	struct rppx1_hist_params hist;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index a83d393d0504..8d85d0c7bff1 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
>  rppx1_ext_params_blocks_info[] = {
>  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
>  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
> +	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
> +	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
> @@ -64,6 +66,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
>  			module = &rpp->pre1.bls;
>  			break;
> +		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
> +			module = &rpp->pre1.lsc;
> +			break;
>  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
>  			module = &rpp->pre1.awbg;
>  			break;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> index be49fc17ea26..8badeca23e24 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lsc.c
> @@ -55,6 +55,10 @@
>  #define LSC_TABLE_SEL_REG	0x00a8
>  #define LSC_STATUS_REG		0x00ac
>
> +#define LSC_R_TABLE_DATA_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 12))
> +#define LSC_GRAD_VALUE(v1, v2) (((v1) & 0xfff) | (((v2) & 0xfff) << 16))
> +#define LSC_SIZE_VALUE(v1, v2) (((v1) & 0x1ff) | (((v2) & 0x1ff) << 16))
> +
>  static int rppx1_lsc_probe(struct rpp_module *mod)
>  {
>  	/* Version check. */
> @@ -64,6 +68,121 @@ static int rppx1_lsc_probe(struct rpp_module *mod)
>  	return 0;
>  }
>
> +static int
> +rppx1_lsc_fill_params(struct rpp_module *mod,
> +		      const union rppx1_params_block *block,
> +		      rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_lsc_params *cfg = &block->lsc;
> +	const __u16 *v;
> +
> +	/* Always disable module as it needs be disabled before configuring. */
> +	write(priv, mod->base + LSC_CTRL_REG, 0);
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE)
> +		return 0;
> +
> +	/*
> +	 * Program the color correction sectors.
> +	 *
> +	 * There are two tables to one can program and switch between. As the
> +	 * RPPX1 supports preparing a buffer of commands to be applied later
> +	 * only use table 0. This works as long as the ISP is not used in
> +	 * inline-mode.
> +	 *
> +	 * For inline-mode support using DMA for configuration is not possible
> +	 * so this is not an issue, but needs to be address if inline-mode
> +	 * support is added to the driver.
> +	 */
> +
> +	/* Start writing at beginning of table 0. */
> +	write(priv, mod->base + LSC_R_TABLE_ADDR_REG, 0);
> +	write(priv, mod->base + LSC_GR_TABLE_ADDR_REG, 0);
> +	write(priv, mod->base + LSC_B_TABLE_ADDR_REG, 0);
> +	write(priv, mod->base + LSC_GB_TABLE_ADDR_REG, 0);
> +
> +	/* Program data tables. */
> +	for (unsigned int i = 0; i < RPPX1_LSC_SAMPLES_MAX; i++) {
> +		const __u16 *r = cfg->r_data[i];
> +		const __u16 *gr = cfg->gr_data[i];
> +		const __u16 *b = cfg->b_data[i];
> +		const __u16 *gb = cfg->gb_data[i];
> +		unsigned int j;
> +
> +		for (j = 0; j < RPPX1_LSC_SAMPLES_MAX - 1; j += 2) {
> +			write(priv, mod->base + LSC_R_TABLE_DATA_REG,
> +			      LSC_R_TABLE_DATA_VALUE(r[j], r[j + 1]));
> +			write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
> +			      LSC_R_TABLE_DATA_VALUE(gr[j], gr[j + 1]));
> +			write(priv, mod->base + LSC_B_TABLE_DATA_REG,
> +			      LSC_R_TABLE_DATA_VALUE(b[j], b[j + 1]));
> +			write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
> +			      LSC_R_TABLE_DATA_VALUE(gb[j], gb[j + 1]));
> +		}
> +
> +		write(priv, mod->base + LSC_R_TABLE_DATA_REG,
> +		      LSC_R_TABLE_DATA_VALUE(r[j], 0));
> +		write(priv, mod->base + LSC_GR_TABLE_DATA_REG,
> +		      LSC_R_TABLE_DATA_VALUE(gr[j], 0));
> +		write(priv, mod->base + LSC_B_TABLE_DATA_REG,
> +		      LSC_R_TABLE_DATA_VALUE(b[j], 0));
> +		write(priv, mod->base + LSC_GB_TABLE_DATA_REG,
> +		      LSC_R_TABLE_DATA_VALUE(gb[j], 0));
> +	}
> +
> +	/* Activate table 0. */
> +	write(priv, mod->base + LSC_TABLE_SEL_REG, 0);
> +
> +	/*
> +	 * Program X- and Y- sizes, and gradients.
> +	 */
> +
> +	v = cfg->x_grad;
> +	write(priv, mod->base + LSC_XGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_XGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_XGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_XGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_XGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_XGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
> +	write(priv, mod->base + LSC_XGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
> +	write(priv, mod->base + LSC_XGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
> +
> +	v = cfg->y_grad;
> +	write(priv, mod->base + LSC_YGRAD_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_YGRAD_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_YGRAD_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_YGRAD_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_YGRAD_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_YGRAD_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
> +	write(priv, mod->base + LSC_YGRAD_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
> +	write(priv, mod->base + LSC_YGRAD_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
> +
> +	v = cfg->x_sect_size;
> +	write(priv, mod->base + LSC_XSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_XSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_XSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_XSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_XSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_XSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
> +	write(priv, mod->base + LSC_XSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
> +	write(priv, mod->base + LSC_XSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
> +
> +	v = cfg->y_sect_size;
> +	write(priv, mod->base + LSC_YSIZE_01_REG, LSC_GRAD_VALUE(v[0], v[1]));
> +	write(priv, mod->base + LSC_YSIZE_23_REG, LSC_GRAD_VALUE(v[2], v[3]));
> +	write(priv, mod->base + LSC_YSIZE_45_REG, LSC_GRAD_VALUE(v[4], v[5]));
> +	write(priv, mod->base + LSC_YSIZE_67_REG, LSC_GRAD_VALUE(v[6], v[7]));
> +	write(priv, mod->base + LSC_YSIZE_89_REG, LSC_GRAD_VALUE(v[8], v[9]));
> +	write(priv, mod->base + LSC_YSIZE_1011_REG, LSC_GRAD_VALUE(v[10], v[11]));
> +	write(priv, mod->base + LSC_YSIZE_1213_REG, LSC_GRAD_VALUE(v[12], v[13]));
> +	write(priv, mod->base + LSC_YSIZE_1415_REG, LSC_GRAD_VALUE(v[14], v[15]));
> +
> +	/* Enable module. */
> +	write(priv, mod->base + LSC_CTRL_REG, LSC_CTRL_LSC_EN);
> +
> +	return 0;
> +}
> +
>  const struct rpp_module_ops rppx1_lsc_ops = {
>  	.probe = rppx1_lsc_probe,
> +	.fill_params = rppx1_lsc_fill_params,
>  };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 97c333c72d56..7ebcc00ace04 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -89,6 +89,8 @@ enum rppx1_meas_chan {
>   * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1: PRE1 pipe Black Level Subtraction
>   * @RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2: PRE2 pipe Black Level Subtraction
>   * @RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST: POST pipe Color Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1: PRE1 pipe Lens Shading Correction
> + * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction

missing 'pipe' after PRE2. Sorry, my mistake probably

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> @@ -103,6 +105,8 @@ enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1,
>  	RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE2,
>  	RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST,
> +	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1,
> +	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
>  };
>
>  /**
> @@ -447,6 +451,52 @@ struct rppx1_ccor_params {
>  	__u32 offset[3];
>  };
>
> +/* Lens Shade Correction */
> +#define RPPX1_LSC_SAMPLES_MAX 17
> +#define RPPX1_LSC_NUM_SECTORS 16
> +
> +/**
> + * struct rppx1_lsc_params - Lens Shading Correction configuration
> + *
> + * The RPP-X1 Lens shading correction module is available on the PRE1 and PRE2
> + * pre-fusion pipes. Userspace selects which pipe to operate by setting the
> + * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1 or
> + * RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2.
> + *
> + * The module applies per-color channel correction factors @r_data, @gr_data,
> + * @gb_data and @b_data as a 16x16 grid mapped on the image. The size of each
> + * grid segment is expressed by the @x_sect_size and @y_sect_size arrays.  Each
> + * segment shall be at least 8 pixels in size and the sum of all horizontal
> + * segments @x_sect_size shall match the input frame size width.
> + *
> + * The correction factors values are expressed as unsigned Q2.10 integers
> + * ranging from 1 to 3.999.
> + *
> + * Pre-calculated interpolation factors shall be provided in the @x_grad
> + * and @y_grad fields, expressed as 12 bits integer values.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LSC)
> + * @r_data: correction factors for the red channel in Q2.10 format
> + * @gr_data: correction factors for the green (red) channel in Q2.10 format
> + * @gb_data: correction factors for the green (blue) channel in Q2.10 format
> + * @b_data: correction factors for the blue channel in Q2.10 format
> + * @x_grad: Interpolation gradients for each horizontal sector (12 bits)
> + * @y_grad: Interpolation gradients for each vertical sector (12 bits)
> + * @x_sect_size: Horizontal sectors sizes
> + * @y_sect_size: Vertical sectors sizes
> + */
> +struct rppx1_lsc_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u16 r_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 gr_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 gb_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 b_data[RPPX1_LSC_SAMPLES_MAX][RPPX1_LSC_SAMPLES_MAX];
> +	__u16 x_grad[RPPX1_LSC_NUM_SECTORS];
> +	__u16 y_grad[RPPX1_LSC_NUM_SECTORS];
> +	__u16 x_sect_size[RPPX1_LSC_NUM_SECTORS];
> +	__u16 y_sect_size[RPPX1_LSC_NUM_SECTORS];
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -465,7 +515,9 @@ struct rppx1_ccor_params {
>  	sizeof(struct rppx1_hist_params)			+	\
>  	sizeof(struct rppx1_bls_params)				+	\
>  	sizeof(struct rppx1_bls_params)				+	\
> -	sizeof(struct rppx1_ccor_params))
> +	sizeof(struct rppx1_ccor_params)			+	\
> +	sizeof(struct rppx1_lsc_params)				+	\
> +	sizeof(struct rppx1_lsc_params))
>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> --
> 2.54.0
>

