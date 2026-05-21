Return-Path: <linux-media+bounces-62522-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKYMICQhD2rPGAYAu9opvQ
	(envelope-from <linux-media+bounces-62522-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:13:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76D5A8130
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 17:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CE92C31FC5B7
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2026 14:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12FBC306743;
	Thu, 21 May 2026 14:11:40 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EA6A29D294
	for <linux-media@vger.kernel.org>; Thu, 21 May 2026 14:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779372699; cv=none; b=jmnu6I346E4h6OZF+uU5vWGmP+YsIn4mhiu7tgqvbtbf+b4dFJLWS6BtJ9qxwUmiDiMwJPPS+7SmJfcFTRorz1fky6x5xVcl2nxlxqVIEEfIQnWlXiqvNPUvMKhxUGvM1tg7NyAJyyJEOpNdxAdcCm3QWh/0antUWyOJelDfE4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779372699; c=relaxed/simple;
	bh=SsGASIz3illZMtpamQaZ3aekGxKnq2iYrV7/XeVaGvo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jynVmfUuBASyxKEegzaf+kaX8VVwK7jrGceRUWzW/3w5sjrdAd6v04JV1BrdF+qJbG3JJ+5nR0i4hUqyshXuc5DqQN9iEiI8tJI9P4dtTth5RulruXySuXroxXbtk/MOi61wbLrfpU8XNgtseiilqLvrkVT52Y+IYyjV82iGyLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ47S-0006uw-C3; Thu, 21 May 2026 16:11:26 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ47Q-0017Ne-0g;
	Thu, 21 May 2026 16:11:24 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ47Q-00000004Ws9-2jnW;
	Thu, 21 May 2026 16:11:24 +0200
Date: Thu, 21 May 2026 16:11:24 +0200
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
Subject: Re: [PATCH v7 12/28] media: rockchip: rga: avoid odd frame sizes for
 YUV formats
Message-ID: <ag8SjJ4FvjS7GOrT@pengutronix.de>
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
 <20260521-spu-rga3-v7-12-3f33e8c7145f@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-12-3f33e8c7145f@pengutronix.de>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[19];
	TAGGED_FROM(0.00)[bounces-62522-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	R_DKIM_NA(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,collabora.com:email,pengutronix.de:mid,pengutronix.de:email]
X-Rspamd-Queue-Id: CB76D5A8130
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, 21 May 2026 00:44:17 +0200, Sven Püschel wrote:
> Avoid odd frame sizes for YUV formats, as they may cause undefined
> behavior. This is done in preparation for the RGA3, which hangs when the
> output format is set to 129x129 pixel YUV420 SP (NV12).
> 
> This requirement is documented explicitly for the RGA3 in  section 5.6.3
> of the RK3588 TRM Part 2. For the RGA2 the RK3588 TRM Part 2
> (section 6.1.2) and RK3568 TRM Part 2 (section 14.2) only mentions the
> x/y offsets and stride aligning requirements. But the vendor driver for
> the RGA2 also contains checks for the width and height to be aligned to
> 2 bytes.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 19 ++++++++++++++-----
>  1 file changed, 14 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index f599c992829dd..77b8c7ab74274 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -337,6 +337,19 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  	struct rga_ctx *ctx = file_to_rga_ctx(file);
>  	const struct rga_hw *hw = ctx->rga->hw;
>  	struct rga_fmt *fmt;
> +	struct v4l2_frmsize_stepwise frmsize = {
> +		.min_width = hw->min_width,
> +		.max_width = hw->max_width,
> +		.min_height = hw->min_height,
> +		.max_height = hw->max_height,
> +		.step_width = 1,
> +		.step_height = 1,
> +	};
> +
> +	if (v4l2_is_format_yuv(v4l2_format_info(pix_fmt->pixelformat))) {
> +		frmsize.step_width = 2;
> +		frmsize.step_height = 2;

If I understand correctly, this limitation may be a result of 4:2:0
chroma subsampling. Thus, formats with 4:2:2 subsampling would also work
with step_height = 1.

As this may be some hardware limitation, a comment that points to the
TRM (in addition to the commit message) may be beneficial, too.

Michael

> +	}
>  
>  	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
>  		const struct rga_frame *frm;
> @@ -358,11 +371,7 @@ static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  	if (!fmt)
>  		fmt = &hw->formats[0];
>  
> -	pix_fmt->width = clamp(pix_fmt->width,
> -			       hw->min_width, hw->max_width);
> -	pix_fmt->height = clamp(pix_fmt->height,
> -				hw->min_height, hw->max_height);
> -
> +	v4l2_apply_frmsize_constraints(&pix_fmt->width, &pix_fmt->height, &frmsize);
>  	v4l2_fill_pixfmt_mp(pix_fmt, fmt->fourcc, pix_fmt->width, pix_fmt->height);
>  	pix_fmt->field = V4L2_FIELD_NONE;
>  
> 
> -- 
> 2.54.0
> 
> 

