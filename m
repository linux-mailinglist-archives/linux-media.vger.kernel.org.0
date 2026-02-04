Return-Path: <linux-media+bounces-52197-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8NspLVlog2kbmgMAu9opvQ
	(envelope-from <linux-media+bounces-52197-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 16:40:09 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 37653E9143
	for <lists+linux-media@lfdr.de>; Wed, 04 Feb 2026 16:40:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6249930CA65D
	for <lists+linux-media@lfdr.de>; Wed,  4 Feb 2026 15:28:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 643252D7D42;
	Wed,  4 Feb 2026 15:28:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="b0Vm94fL"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C182BD012;
	Wed,  4 Feb 2026 15:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218915; cv=none; b=XBkb2m6Xq/B3jEiRV4NvrP8yv11coRBCx/NRFt3v79PT9fVM3vDndvYkPRgCY5tiCIJ/5ytEpes7tPanrbwoMMrn9KgrWZT7EYt++46Yfl6DcGR0RDe9rbItW01/z6FD/7sqdnofzovI9mEtvRuk012jmY6ky5VZ1Gin1kVi6Eo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218915; c=relaxed/simple;
	bh=8b7NEE0pg/AHJ7XBOifwnvN2QzfrWc6nJZvHlB+YsXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pFLmk+3tO6lETBuOTDPL+gYR44fNq5AytIRp7abDsg/wgpFcH6OyhQMPjKvsla+L//C9ll+Qbjy5VlEzCMUsUVqlYGeEwT+g4ezZ/uqBs+VRFIG+/kB7isrPTTWLYJkFX8BM1Kjkb/LQA/g8T53Knw6vVQUjK1DRWhDduNgQnrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=b0Vm94fL; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 5C1325B2;
	Wed,  4 Feb 2026 16:27:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770218871;
	bh=8b7NEE0pg/AHJ7XBOifwnvN2QzfrWc6nJZvHlB+YsXo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b0Vm94fLIs+83Fk6V4H4NAhZAPn8f+D8O3tIrhgLiGgziGvTVnCBLJjqUJVW3rzSI
	 cS/XrjCViIC+KBTsZ/XitinuPNHB6CFjOGE06d/F/0PZEozrslR+1EXU0o4F4CbGM/
	 eiASLTINLyyFKJ/kWY66M7R67dgsc0KH1iarS8MY=
Date: Wed, 4 Feb 2026 17:28:31 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/6] media: rkisp1-isp: Propagate sink -> source
 format in YUV passthough
Message-ID: <20260204152831.GA170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-5-isaac.scott@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-5-isaac.scott@ideasonboard.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52197-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_CC(0.00)[vger.kernel.org,fastmail.com,kernel.org,sntech.de,lists.infradead.org];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37653E9143
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 11:25:04AM +0000, Isaac Scott wrote:
> If we are in bypass mode, we should propagate the sink format of the ISP
> to the source format to ensure the pipeline is valid. Ensure the source
> pad format of the ISP is configured to the same format as the sink pad.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 716bd7f3c66d..c457593526c5 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -630,6 +630,11 @@ static void rkisp1_isp_set_src_fmt(struct rkisp1_isp *isp,
>  	 */
>  	sink_info = rkisp1_mbus_info_get_by_code(sink_fmt->code);
>  

A comment would be useful here, or maybe better a rework of the comment
block just above.

> +	if (sink_info->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> +		format->code = sink_fmt->code;
> +		dev_dbg(isp->rkisp1->dev, "ISP sink pad is YUV");

Drop the debug message.

> +	}
> +
>  	src_fmt->code = format->code;
>  	src_info = rkisp1_mbus_info_get_by_code(src_fmt->code);
>  	if (!src_info || !(src_info->direction & RKISP1_ISP_SD_SRC)) {

-- 
Regards,

Laurent Pinchart

