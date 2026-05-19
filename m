Return-Path: <linux-media+bounces-62127-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHqaOPVSDGqmfAUAu9opvQ
	(envelope-from <linux-media+bounces-62127-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:09:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFEB57E5BA
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1311E30830A7
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 800914BCAB1;
	Tue, 19 May 2026 11:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dJdcYF++"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A7C4405C5F;
	Tue, 19 May 2026 11:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191954; cv=none; b=slUcc41RTK5ioBGOBcnByOjG/agP9kpJjr73i3E2MnXmPwC5A4Xmx4zoVzPAbqYWAMMlyU9Ifkc81AEVqpg5RDlLbk5PfGIiF3v4eZrWTq/jMfE0DsITH/YbQYx/sWcxbFzeTLIg4C045QK9vxE3gh2Sow6mKdTwLIqiy8Y63qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191954; c=relaxed/simple;
	bh=uFpEgceK7X5FzoDNi0opm73IZGLOoyUSBsRLdFdiWjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V6hqSpSvpY5d5hLNNpb2Onz3LYY6gM0Ui+4bJ2wbRJEL8EhHNoKs75ZxBvUl22kDOszZFpIAWdDRe+8jocTToekdgW8z/zcC37l5qrIp0tl2w/r8NzLobs6QRaN0Svrp/KRlo4cldTjhiyZKNyVP103rkXi5SmI2ltq6ne9SHuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dJdcYF++; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779191953; x=1810727953;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uFpEgceK7X5FzoDNi0opm73IZGLOoyUSBsRLdFdiWjQ=;
  b=dJdcYF++rpPFTkR0UjNqnTBlTMztjwcQ5nqPgeJTTtBHhiz1K4IefF41
   fU86gVKZVywuWkkbZufOZBvR/44k1q4takEb4vnW5uUryhg7nQjXFCZlD
   xWyRWwE0sgq8YqGKxcuWkjaBjcgxG4d0Qb8CPHsEdoqr56JXKCo8UySlh
   9lc/u81aFja0dMmlPkJ5tac5g9fwZFOFjsc1vWtmAViiYnnYSVc/NxqpE
   TXyyuFfmtgQLw4orFEp5Esn4uyiyJH+f9Kk3NFQglp7HZ8S9Qi5K64R0E
   LXpKtsvFv9kggllbfffDyjMST8P0RXTJPf+lOs7jW1YsbvuJ/iLRzI77v
   g==;
X-CSE-ConnectionGUID: vTj4TTo3R8iDYSOjr0NF9A==
X-CSE-MsgGUID: kY1T0mK/TzKAmzacCQyzzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11790"; a="90646163"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="90646163"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:59:12 -0700
X-CSE-ConnectionGUID: 3JO6rFXfRuORAEGTZ6KWkQ==
X-CSE-MsgGUID: xLyV59V7RNSaqP9YbqNQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="240005552"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.204])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 04:59:07 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8A6FA120E58;
	Tue, 19 May 2026 14:59:03 +0300 (EEST)
Date: Tue, 19 May 2026 14:59:03 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Rishikesh Donadkar <r-donadkar@ti.com>
Cc: jai.luthra@linux.dev, laurent.pinchart@ideasonboard.com,
	mripard@kernel.org, y-abhilashchandra@ti.com, devarsht@ti.com,
	s-jain1@ti.com, vigneshr@ti.com, mchehab@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, p.zabel@pengutronix.de,
	conor+dt@kernel.org, hverkuil-cisco@xs4all.nl,
	tomi.valkeinen@ideasonboard.com, jai.luthra@ideasonboard.com,
	changhuang.liang@starfivetech.com, sjoerd@collabora.com,
	dan.carpenter@linaro.org, hverkuil+cisco@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v12 10/17] media: ti: j721e-csi2rx: add support for
 processing virtual channels
Message-ID: <agxQhwefGqKx9nu-@kekkonen.localdomain>
References: <20260313090701.646534-1-r-donadkar@ti.com>
 <20260313090701.646534-11-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260313090701.646534-11-r-donadkar@ti.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62127-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,ideasonboard.com,kernel.org,ti.com,pengutronix.de,xs4all.nl,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,kekkonen.localdomain:mid,intel.com:dkim,ideasonboard.com:email]
X-Rspamd-Queue-Id: CDFEB57E5BA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Rishikesh,

On Fri, Mar 13, 2026 at 02:36:54PM +0530, Rishikesh Donadkar wrote:
> From: Jai Luthra <j-luthra@ti.com>
> 
> Use get_frame_desc() to get the frame desc from the connected source,
> and use the provided virtual channel and DT instead of defaults.
> 
> As we don't support multiple streams yet, we will just always use
> stream 0. If the source doesn't support get_frame_desc(), fall back
> to the previous method of always capturing virtual channel 0.
> 
> Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> Co-developed-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
> Signed-off-by: Jai Luthra <j-luthra@ti.com>
> Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
> Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 51 ++++++++++++++++++-
>  1 file changed, 50 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> index 26a8eaa98b3da..24b687b4ea32a 100644
> --- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> +++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
> @@ -32,6 +32,7 @@
>  #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
>  #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
>  #define SHIM_DMACNTX_SIZE		GENMASK(21, 20)
> +#define SHIM_DMACNTX_VC			GENMASK(9, 6)
>  #define SHIM_DMACNTX_FMT		GENMASK(5, 0)
>  #define SHIM_DMACNTX_YUV422_MODE_11	3
>  #define SHIM_DMACNTX_SIZE_8		0
> @@ -110,6 +111,9 @@ struct ti_csi2rx_ctx {
>  	struct media_pad		pad;
>  	u32				sequence;
>  	u32				idx;
> +	u32				vc;
> +	u32				dt;
> +	u32				stream;
>  };
>  
>  struct ti_csi2rx_dev {
> @@ -569,7 +573,7 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  	ti_csi2rx_request_max_ppc(csi);
>  
>  	reg = SHIM_DMACNTX_EN;
> -	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, fmt->csi_dt);
> +	reg |= FIELD_PREP(SHIM_DMACNTX_FMT, ctx->dt);
>  
>  	/*
>  	 * The hardware assumes incoming YUV422 8-bit data on MIPI CSI2 bus
> @@ -608,6 +612,8 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
>  		break;
>  	}
>  
> +	reg |= FIELD_PREP(SHIM_DMACNTX_VC, ctx->vc);
> +
>  	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
>  
>  	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
> @@ -881,12 +887,46 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
>  	}
>  }
>  
> +static int ti_csi2rx_get_vc_and_dt(struct ti_csi2rx_ctx *ctx)
> +{
> +	struct ti_csi2rx_dev *csi = ctx->csi;
> +	struct v4l2_mbus_frame_desc fd;
> +	struct media_pad *pad;
> +	int ret, i;
> +
> +	pad = media_entity_remote_pad_unique(&csi->subdev.entity, MEDIA_PAD_FL_SOURCE);
> +	if (!pad)

Same for media_entity_remote_pad_unique() it returns an error code on
error.

> +		return -ENODEV;
> +
> +	ret = v4l2_subdev_call(csi->source, pad, get_frame_desc, pad->index, &fd);
> +	if (ret)
> +		return ret;
> +
> +	if (fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2)
> +		return -EINVAL;
> +
> +	for (i = 0; i < fd.num_entries; i++) {
> +		if (ctx->stream == fd.entry[i].stream) {
> +			ctx->vc = fd.entry[i].bus.csi2.vc;
> +			ctx->dt = fd.entry[i].bus.csi2.dt;
> +			break;
> +		}
> +
> +		/* Return error if no matching stream found */
> +		if (i == fd.num_entries)
> +			return -EINVAL;
> +	}
> +
> +	return 0;
> +}
> +
>  static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  {
>  	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vq);
>  	struct ti_csi2rx_dev *csi = ctx->csi;
>  	struct ti_csi2rx_dma *dma = &ctx->dma;
>  	struct ti_csi2rx_buffer *buf;
> +	const struct ti_csi2rx_fmt *fmt;
>  	unsigned long flags;
>  	int ret = 0;
>  
> @@ -901,6 +941,15 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
>  	if (ret)
>  		goto err;
>  
> +	ret = ti_csi2rx_get_vc_and_dt(ctx);
> +	if (ret == -ENOIOCTLCMD) {
> +		ctx->vc = 0;
> +		fmt = find_format_by_fourcc(ctx->v_fmt.fmt.pix.pixelformat);
> +		ctx->dt = fmt->csi_dt;
> +	} else if (ret < 0) {
> +		goto err;
> +	}
> +
>  	ti_csi2rx_setup_shim(ctx);
>  
>  	ctx->sequence = 0;

-- 
Regards,

Sakari Ailus

