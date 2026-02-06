Return-Path: <linux-media+bounces-52272-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SeDIMhczhWkl+AMAu9opvQ
	(envelope-from <linux-media+bounces-52272-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 01:17:27 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 185D1F886D
	for <lists+linux-media@lfdr.de>; Fri, 06 Feb 2026 01:17:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6ED18301B725
	for <lists+linux-media@lfdr.de>; Fri,  6 Feb 2026 00:17:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D6C31DE8BB;
	Fri,  6 Feb 2026 00:17:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="lDU34SVI"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66104146A66;
	Fri,  6 Feb 2026 00:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770337033; cv=none; b=tS6XIw6lzh5FfF4f/uDIssDbsucPeTraa2kZKXzVOpY24YSDIzSFYEPrQYBbMN/KR1igiOE+4BjHTIbdHmWpeGlxq8umR8hT2GHegqSh2UwLndWI0/tjDIlPHOJkYjIFdGOtvkSW3BwnsHx2IOvuLYtux+3KbeK+aEQYJRtf++I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770337033; c=relaxed/simple;
	bh=+zx3CcSOxbuZHtxc0X/7I7ZXqnSEJs5fHZ7SfchUkVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R851cunPtmRLPKHCkzahiKThOEh1Mn3Td0ONKuFBITBGbfH1V2BohN4L8J3PtPLkkXAdVGgL7Ghj94mYkU4eKEvILFfk601zwhYU507JwFBjxGaw5wFGlltL6OKihBMA0Hp5krJbG/zc3dBYua6XGnXLmUkHDXJoqH+jTMWZLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=lDU34SVI; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 46BB22E0;
	Fri,  6 Feb 2026 01:16:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770336987;
	bh=+zx3CcSOxbuZHtxc0X/7I7ZXqnSEJs5fHZ7SfchUkVg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lDU34SVI83VfuujXi7Jgc/2zUau+FtyYoWl97hWYp0ZfASVbP6vI36yoQ6HfREtTG
	 JmsifRHAd6tdUoBasOdn+V5ScTmDke8CqmeD+9yAxLiGT0OHDZ3utHiG/5aVXSI5vj
	 Tclzixnxx05QksDcSk2lm5vOuzPhbQzpSdD0LRTM=
Date: Fri, 6 Feb 2026 02:17:08 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] media: rkisp1-isp: Set correct data mode for YUV
 bypass
Message-ID: <20260206001708.GD1376807@killaraus.ideasonboard.com>
References: <20260205103207.4020959-1-isaac.scott@ideasonboard.com>
 <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260205103207.4020959-2-isaac.scott@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	TAGGED_FROM(0.00)[bounces-52272-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,ideasonboard.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 185D1F886D
X-Rspamd-Action: no action

Hi Isaac,

Thank you for the patch.

On Thu, Feb 05, 2026 at 10:32:06AM +0000, Isaac Scott wrote:
> The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
> disables all ISP blocks, and makes the rkisp1 display input data from
> the MIPI CSI receiver at the output, unmodified.
> 
> To determine whether we can activate bypass, we can detect whether both
> the source and sink formats are YUV. If they are, we must configure the
> ISP to expect a YUV input, interpreting H/VSYNC signals as data
> enable / disable.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> 
> ---
> 
> Changelog since v1:
> - Removed in_bypass flag
> - Renamed the patch to better represent the functionality of the patch
> 
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2311672cedb1..21bfa0edbaf1 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -240,7 +240,9 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  		}
>  	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
>  		acq_mult = 2;
> -		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
> +		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> +			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
> +		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
>  			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
>  		} else {
>  			if (mbus_type == V4L2_MBUS_BT656)

This doesn't seem right. If the sink format is YUV, then the source
format has to be YUV too (the ISP can't produce Bayer from YUV). The
source pixel encoding condition will always be true, the other branches
will never be taken, most likely breaking parallel inputs.

Also, the documentation states that in YCbCr bypass mode, ISP_MODE
should be set to 2 (ITU-R BT.601), not 4 (data mode).

-- 
Regards,

Laurent Pinchart

