Return-Path: <linux-media+bounces-52342-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oA2VA4mwh2nwbwQAu9opvQ
	(envelope-from <linux-media+bounces-52342-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 22:37:13 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AD091072BC
	for <lists+linux-media@lfdr.de>; Sat, 07 Feb 2026 22:37:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E76E53014C67
	for <lists+linux-media@lfdr.de>; Sat,  7 Feb 2026 21:37:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEBE354AC4;
	Sat,  7 Feb 2026 21:37:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="IPhFDFtV"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C2D41E9B3A;
	Sat,  7 Feb 2026 21:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770500222; cv=none; b=eMbFy34q3leVGeQtE/IxJPpf2FrZE36aqEUNvR1kOSegY3bRZguK0pSEiNvgBRZU/LcOQtnVTf7lvZESLqvTLPD4tB3wnyQtj4SyoilVjMqlYOj9+mIZhdIABw7eCFThpvQdzj7OhEbk49gkRXIbJsKtX8natV8LjdmrbtVIzeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770500222; c=relaxed/simple;
	bh=+TlIMoVyz/7h2s1Zpa+ueB2Mik6MAN0RFF7w2ls/WaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlIhRhzPS8x0jYhrCNQrqKK9RGCuuU0dgCCpvLaA9fYyj5T8l+3NCn4Yn1JuxvRzSmRlSQAY2twzka6k3dO3BY424wYFggK7fo/a2e1bpfsu5qrgHe+Ap1CpDjFqlzJnKyagyPr0pbySUgGOQTcWM7/dRF7rG01GcVruvmOpF+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=IPhFDFtV; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 3773F460;
	Sat,  7 Feb 2026 22:26:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770499600;
	bh=+TlIMoVyz/7h2s1Zpa+ueB2Mik6MAN0RFF7w2ls/WaI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPhFDFtV6kjInHTZzWr9td58IqMkbinkgT+Y2KRpMH9tWMguIHxqo+duBNwASHjaV
	 xn1PMQCiVY3D75tvlBzUMtibdGaKB11K/g5Uau5msuwJOqKeYIx+spk56zk0w9i4V+
	 RwM8EgKexAHN4t1RKNJLbV+K8qHBiDHuNZahxWys=
Date: Sat, 7 Feb 2026 23:27:23 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Biju Das <biju.das.jz@bp.renesas.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Fix possible ERR_PTR deference
Message-ID: <20260207212723.GN1376807@killaraus.ideasonboard.com>
References: <20260207094841.603932-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207094841.603932-1-alperyasinak1@gmail.com>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_FROM(0.00)[bounces-52342-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.995];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7AD091072BC
X-Rspamd-Action: no action

On Sat, Feb 07, 2026 at 12:48:39PM +0300, Alper Ak wrote:
> The media_pad_remote_pad_unique() can return ERR_PTR() on failure
> (-ENOTUNIQ or -ENOLINK), but the code was dereferencing the return
> value without checking for errors. Add IS_ERR() check before
> dereferencing the pointer.

Have you seen this happening ?

> Fixes: d7d72dae81d5 ("media: rzg2l-cru: Retrieve virtual channel information")
> Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..a34c2188df1a 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -411,6 +411,12 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  	int ret;
>  
>  	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> +	if (IS_ERR(remote_pad)) {
> +		ret = PTR_ERR(remote_pad);
> +		dev_err(cru->dev, "Failed to get remote source pad: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
>  	if (ret < 0 && ret != -ENOIOCTLCMD) {
>  		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");

-- 
Regards,

Laurent Pinchart

