Return-Path: <linux-media+bounces-62515-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aF32NEsTD2otFAYAu9opvQ
	(envelope-from <linux-media+bounces-62515-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:14:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7E65A6F7D
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 16:14:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EBB15328EF70
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 13:46:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 067D929A9FE;
	Thu, 21 May 2026 13:44:20 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46B9351C04
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 13:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371059; cv=none; b=hiwJ/ODIBjR3Ip3Fc63iqv+vAHpZoA2ENnDxhGS/mA1+QwC4mIZ4uaoa+TXeDQW5p8U6iKSZ4F1O1nImpgDZSCtd6S4zsrt6WqUIE4wAA3D9Q2ODGwAqvQiemYx0r6R325X97Wk9RK/N2hYq4cT0xkioGOpn7d/zEPM1wr6eQng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371059; c=relaxed/simple;
	bh=AmWsOoHyB+84rcp1z3vwXGI+MPJwBXTDaf3KWuIuIKM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+kf5CAA9tlU/E5rq0AJ8O2L7yRjzwOP1WMUNV0V2bTD8K6e6ZeXCEnKwpsyHH+kFvcrXXRA2OO1/lwJSAUT+PAf7uRFfNhlLwfK9yXIP+WDIsmpLm609Y0JYkTsWadXMdl/3M8LTT9obq8IWb5Mz/0gvAbyvRGfaX1nVLMJc2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ3h0-0001JK-60; Thu, 21 May 2026 15:44:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ3gy-00174N-2S;
	Thu, 21 May 2026 15:44:05 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ3gz-00000004WQz-0oP0;
	Thu, 21 May 2026 15:44:05 +0200
Date: Thu, 21 May 2026 15:44:05 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v7 10/28] media: rockchip: rga: announce and sync
 colorimetry
Message-ID: <ag8MJaSIVt4Q_y_U@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-media@vger.kernel.org
X-Spamd-Result: default: False [0.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-62515-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[pengutronix.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[m.tretter@pengutronix.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email]
X-Rspamd-Queue-Id: 4F7E65A6F7D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

"announce colorimetry" in the subject is a bit strange. Maybe rephrase
the subject to

	media: rockchip: rga: announce CSC and sync colorimetry

On Thu, 21 May 2026 00:44:15 +0200, Sven Püschel wrote:
> Announce the capability to adjust the quantization and ycbcr_enc on the
> capture side and check if the SET_CSC flag is set when the colorimetry
> is changed. Furthermore copy the colorimetry from the output to the
> capture side to fix the currently failing v4l2-compliance tests, which
> expect exactly this behavior.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 37 +++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index ca8d8a53dc251..8c34f73d69764 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
>  	fmt = &formats[f->index];
>  	f->pixelformat = fmt->fourcc;
>  
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)

Is there a reason for not using V4L2_TYPE_IS_CAPTURE(f->type)? I'd also
invert the condition, set the flags in the branch and have a single exit
point of this function.

> +		return 0;
> +
> +	/* allow changing the quantization and xfer func for YUV formats */
> +	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
> +			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> +
>  	return 0;
>  }
>  
> @@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
> +	struct rga_ctx *ctx = file_to_rga_ctx(file);
>  	struct rga_fmt *fmt;
>  
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		const struct rga_frame *frm;
> +
> +		frm = rga_get_frame(ctx, f->type);
> +		if (IS_ERR(frm))
> +			return PTR_ERR(frm);
> +
> +		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +			pix_fmt->quantization = frm->pix.quantization;
> +			pix_fmt->ycbcr_enc = frm->pix.ycbcr_enc;
> +		}

Are there any limits on the colorspace conversion that the RGA can do?
If I understand correctly, user space may set an arbitrary
v4l2_ycbcr_encoding (for example V4L2_YCBCR_ENC_BT2020) and the driver
will happily accept it.

> +		/* disallow values not announced in vidioc_enum_fmt */

"disallow values" sounds strange. Maybe:

		/* The RGA cannot convert colorspace and xfer_func */

> +		pix_fmt->colorspace = frm->pix.colorspace;
> +		pix_fmt->xfer_func = frm->pix.xfer_func;
> +	}
> +
>  	fmt = rga_fmt_find(pix_fmt->pixelformat);
>  	if (!fmt)
>  		fmt = &formats[0];
> @@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
>  	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
>  
> +	/*
> +	 * Copy colorimetry from output to capture as required by the
> +	 * v4l2-compliance tests
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		ctx->out.pix.colorspace = pix_fmt->colorspace;
> +		ctx->out.pix.ycbcr_enc = pix_fmt->ycbcr_enc;
> +		ctx->out.pix.quantization = pix_fmt->quantization;
> +		ctx->out.pix.xfer_func = pix_fmt->xfer_func;

I was very confused, because ctx->out is actually the format for
CAPTURE. The comment kind of helps to mark this trap. Not sure, if there
is anything that can be done about this.

Michael

> +	}
> +
>  	/* Reset crop settings */
>  	frm->crop.left = 0;
>  	frm->crop.top = 0;
> 
> -- 
> 2.54.0
> 
> 

