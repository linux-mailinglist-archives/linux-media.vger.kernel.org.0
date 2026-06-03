Return-Path: <linux-media+bounces-63599-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id XILWCokxIGqjyQAAu9opvQ
	(envelope-from <linux-media+bounces-63599-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:52:09 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C5D63841F
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:52:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=tEByaRPd;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63599-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-63599-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EB6133166DC4
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 13:38:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FB5A30C629;
	Wed,  3 Jun 2026 13:38:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA2B2FD1DA;
	Wed,  3 Jun 2026 13:38:47 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780493929; cv=none; b=OOWjasYodhYS7jfgQqTgmVYvSSCRl9s/QTj+u4Z8UrnTNV4gGQ8C6OBLPaHrVI8Xko+/DLZkj4zCbr/xZrPU9ZSx3MdFQr5BI/aYIEx4Fn3G/U6rVADvJXWu336GJXFfO/U8MInyOMwvmm8fzAEGtFzd+x4r55lcPoWH645sV28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780493929; c=relaxed/simple;
	bh=fKPVotE20fGkW2T9nWm8ZIiasB4LWiX7gXuuh+z8fnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cUBJ1CIrCP3UhfBR8ffRMC2RCWWzTkQU/bvGnjLObOwxnuz9kUw0HZ3lJMNU1mhmkih4eSgwyd3u6/nyXpJhQnf/TcSYOw0r76s1Hz2wh6g3HJttkhYN5wxXvQ5KJvJCGu9WxhB7aoyx6VwipTdbdScendtykDIOB53Srdlp1lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=tEByaRPd; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (93-46-82-201.ip106.fastwebnet.it [93.46.82.201])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7F02D986;
	Wed,  3 Jun 2026 15:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780493901;
	bh=fKPVotE20fGkW2T9nWm8ZIiasB4LWiX7gXuuh+z8fnE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tEByaRPdQHC2lfHvnd1ihO+E2Cm+RiDv5M7ccdTf2J4MpdbCTkuWJbN9kfVGrpjuM
	 peNksAcoPSRelzNS0G4CYS4ObEMPH3OuKUyhyNWGO5iQvpoWokvW0cZKmaNm5d98/m
	 1t0hzgsODgqfFtpLBojQfh7iu7Fw79s6slY6mW3s=
Date: Wed, 3 Jun 2026 15:38:42 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 06/13] media: rppx1: awbg: Add support for white
 balance gain settings
Message-ID: <aiAuUs0Q_1zI0iZW@zed>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-7-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260516211320.3041412-7-niklas.soderlund+renesas@ragnatech.se>
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
	TAGGED_FROM(0.00)[bounces-63599-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund+renesas@ragnatech.se,m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:niklas.soderlund@ragnatech.se,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ideasonboard.com:dkim,ideasonboard.com:from_mime,ideasonboard.com:email,vger.kernel.org:from_smtp,ragnatech.se:email,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 96C5D63841F

Hi Niklas

On Sat, May 16, 2026 at 11:13:13PM +0200, Niklas Söderlund wrote:
> Extend the RPPX1 driver to allow setting the white balance gain
> configuration parameters. It uses the RPPX1 framework for parameters and
> its writer abstraction to allow the user to control how, and when,
> configuration is applied to the RPPX1.
>
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>

Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>

Thanks
  j

> ---
>  .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
>  .../platform/dreamchip/rppx1/rpp_params.c     |  5 +++
>  .../platform/dreamchip/rppx1/rppx1_awbg.c     | 32 +++++++++++++++
>  .../uapi/linux/media/dreamchip/rppx1-config.h | 40 ++++++++++++++++++-
>  4 files changed, 77 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> index 64a1b848f1ea..0e36b717b4ef 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> @@ -47,6 +47,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
>
>  union rppx1_params_block {
>  	struct v4l2_isp_block_header header;
> +	struct rppx1_awbg_params awbg;
>  	struct rppx1_wbmeas_params wbmeas;
>  };
>
> diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> index 7325abeba92a..17bbcf366970 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> @@ -17,6 +17,8 @@
>
>  static const struct v4l2_isp_params_block_type_info
>  rppx1_ext_params_blocks_info[] = {
> +	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> +	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
>  	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
>  };
>
> @@ -51,6 +53,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
>  		block_offset += block->header.size;
>
>  		switch (block->header.type) {
> +		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
> +			module = &rpp->pre1.awbg;
> +			break;
>  		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
>  			module = &rpp->post.wbmeas;
>  			break;
> diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
> index 4a242b41142b..f30e12d6f880 100644
> --- a/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
> +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_awbg.c
> @@ -26,6 +26,38 @@ static int rppx1_awbg_probe(struct rpp_module *mod)
>  	return 0;
>  }
>
> +static int
> +rppx1_awbg_fill_params(struct rpp_module *mod,
> +		       const union rppx1_params_block *block,
> +		       rppx1_reg_write write, void *priv)
> +{
> +	const struct rppx1_awbg_params *cfg = &block->awbg;
> +
> +	/* If the modules is disabled, simply bypass it. */
> +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> +		write(priv, mod->base + AWB_ENABLE_REG, 0);
> +		return 0;
> +	}
> +
> +	/*
> +	 * RPP gains are 18-bit with 12 bit fractional part and 0x1000 = 1.0,
> +	 * giving a possible range of 0.0 to 64.0. NOTE: RPP documentation is
> +	 * contradictory this is the register definition, the function
> +	 * description states 0x400 = 1.0 AND 18-bit with 12 fractional bits,
> +	 * which is not possible...
> +	 */
> +
> +	write(priv, mod->base + AWB_GAIN_GR_REG, cfg->gain_green_r);
> +	write(priv, mod->base + AWB_GAIN_GB_REG, cfg->gain_green_b);
> +	write(priv, mod->base + AWB_GAIN_R_REG, cfg->gain_red);
> +	write(priv, mod->base + AWB_GAIN_B_REG, cfg->gain_blue);
> +
> +	write(priv, mod->base + AWB_ENABLE_REG, AWB_ENABLE_AWB_GAIN_EN);
> +
> +	return 0;
> +}
> +
>  const struct rpp_module_ops rppx1_awbg_ops = {
>  	.probe = rppx1_awbg_probe,
> +	.fill_params = rppx1_awbg_fill_params,
>  };
> diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> index 938f8f258f9e..5ed8a335c9de 100644
> --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> @@ -48,9 +48,15 @@ struct rppx1_window {
>   * NOTE: Only append to the enumeration as the numbers are uAPI.
>   *
>   * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
> + * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1: PRE1 pipe White Balance Gains
> + * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2: PRE2 White Balance Gains
> + * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
>   */
>  enum rppx1_params_block_type {
>  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> +	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1,
> +	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2,
> +	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
>  };
>
>  /**
> @@ -109,6 +115,35 @@ struct rppx1_wbmeas_params {
>  	__u32 ccor_offs[3];
>  };
>
> +/**
> + * struct rppx1_awbg_params  - WB gain configuration
> + *
> + * The RPP-X1 White Balance Gain module is available in the PRE1 and PRE2
> + * pre-fusion pipes and in the MAIN_POST post-fusion pipe. Userspace selects
> + * which pipe to operate by setting the @header.type field to
> + * RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1, RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2
> + * or RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST.
> + *
> + * The White Balance module allows to specify per-color channel gains, expressed
> + * as unsigned fixed-point values as 18 bits unsigned integers in Q6.12 format
> + * with a maximum of 63.999.
> + *
> + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1 or
> + *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2 or
> + *	    type = RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST)
> + * @gain_red: gain for red component, 18-bit (unsigned Q6.12)
> + * @gain_green_r: gain for green component in red lines, 18-bit (unsigned Q6.12)
> + * @gain_blue: gain for blue component, 18-bit (unsigned Q6.12)
> + * @gain_green_b: gain for green component in blue lines, 18-bit (unsigned Q6.12)
> + */
> +struct rppx1_awbg_params {
> +	struct v4l2_isp_params_block_header header;
> +	__u32 gain_red;
> +	__u32 gain_green_r;
> +	__u32 gain_blue;
> +	__u32 gain_green_b;
> +};
> +
>  /**
>   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
>   *
> @@ -116,7 +151,10 @@ struct rppx1_wbmeas_params {
>   * multiple pipes.
>   */
>  #define RPPX1_PARAMS_MAX_SIZE						\
> -	(sizeof(struct rppx1_wbmeas_params))
> +	(sizeof(struct rppx1_wbmeas_params)			+	\
> +	sizeof(struct rppx1_awbg_params)			+	\
> +	sizeof(struct rppx1_awbg_params)			+	\
> +	sizeof(struct rppx1_awbg_params))
>
>  /* ---------------------------------------------------------------------------
>   * Statistics Structures
> --
> 2.54.0
>

