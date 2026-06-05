Return-Path: <linux-media+bounces-63875-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id bJy9MxGEImpbZgEAu9opvQ
	(envelope-from <linux-media+bounces-63875-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:08:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id CCF5F646461
	for <lists+linux-media@lfdr.de>; Fri, 05 Jun 2026 10:08:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=oqHeSE8R;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63875-lists+linux-media=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-media+bounces-63875-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id BF79B302861D
	for <lists+linux-media@lfdr.de>; Fri,  5 Jun 2026 07:46:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45B84481FA5;
	Fri,  5 Jun 2026 07:44:56 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7BE47DFA3;
	Fri,  5 Jun 2026 07:44:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780645495; cv=none; b=CmMHxNn0M0xnvpvj8FyAdpADsGDG/UN7Qy1pYLRHPWjKrZlGAMiqfuLDk6kcO2Icrj/0kplMliTyrQgz1hGxRep61N2PloS+3M0bghbyAqrdRsyo2tp1miFJXzedcALUYf0SvO/ZUk9/IKqd3QFDCfezkII0AP9gdkPj89FxxFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780645495; c=relaxed/simple;
	bh=LZAWbIwQBwcwHTwBHwzYT3w1immcTj1YOZWFgudxjwM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rF69GWsGuppiTThkWlV0Y+1XwSQtPVcvCDkupGENsOFkWRDY/+/ekho5DCSPuiuQr2RA3QgkjBAtNTY3iZhHR8K014Yi3/oc9Q/Ov2Dn2I/gQGHPBrEGVu3l2U7fiyY+rwa6cMzjvOKK7L6J3fJgw5fd/g0obDn2cZ8U1l39YE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=oqHeSE8R; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6BA138E0;
	Fri,  5 Jun 2026 09:44:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780645467;
	bh=LZAWbIwQBwcwHTwBHwzYT3w1immcTj1YOZWFgudxjwM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oqHeSE8RKerDEHRAM/4FlPVypt7XVLuuD+fvAF25XCfS1xQK2GYP+8SAZBt0nYPq/
	 JLIoD8fF6goCE5qwDG4jZ78O4J7fM/Czrv2yMkFkdkIOXo1KifwODuPTQEmhnBdK76
	 B3pPB29kA3jShvVU+oqzxksZ9S1bnmN0VfC7xsdA=
Date: Fri, 5 Jun 2026 09:44:49 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Ethan Tidmore <ethantidmore06@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, 
	Daniel Scally <dan.scally+renesas@ideasonboard.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: rzg2l-cru: Fix error pointer dereference
Message-ID: <aiJ-K9B9Eifcfg57@zed>
References: <20260217041055.88912-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260217041055.88912-1-ethantidmore06@gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ethantidmore06@gmail.com,m:prabhakar.mahadev-lad.rj@bp.renesas.com,m:mchehab@kernel.org,m:laurent.pinchart+renesas@ideasonboard.com,m:hverkuil+cisco@kernel.org,m:tommaso.merciai.xr@bp.renesas.com,m:dan.scally+renesas@ideasonboard.com,m:biju.das.jz@bp.renesas.com,m:jacopo.mondi@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:laurent.pinchart@ideasonboard.com,m:hverkuil@kernel.org,m:dan.scally@ideasonboard.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-63875-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-media,renesas,cisco];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[zed:mid,vger.kernel.org:from_smtp,ideasonboard.com:from_mime,ideasonboard.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: CCF5F646461

Hi Ethan

On Mon, Feb 16, 2026 at 10:10:55PM -0600, Ethan Tidmore wrote:
> The function media_pad_remote_pad_unique() can return an error pointer
> and is not checked. Add check for error pointer.
>
> Detected by Smatch:
> drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c:414 rzg2l_cru_get_virtual_channel() error:
> 'remote_pad' dereferencing possible ERR_PTR()
>
> Fixes: d7d72dae81d5d ("media: rzg2l-cru: Retrieve virtual channel information")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

This really fell into the cracks and you've not been given any
feedback. Sorry about this.

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 162e2ace6931..bf7d96841c78 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -411,6 +411,9 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
>  	int ret;
>
>  	remote_pad = media_pad_remote_pad_unique(&cru->ip.pads[RZG2L_CRU_IP_SINK]);
> +	if (IS_ERR(remote_pad))
> +		return PTR_ERR(remote_pad);
> +

As far as I can tell the link on the cru->ip sink pad is created with
IMMUTABLE flag, so we're sure it always is there.

I don't think the check is required.

Thanks
  j
>  	ret = v4l2_subdev_call(cru->ip.remote, pad, get_frame_desc, remote_pad->index, &fd);
>  	if (ret < 0 && ret != -ENOIOCTLCMD) {
>  		dev_err(cru->dev, "get_frame_desc failed on IP remote subdev\n");
> --
> 2.53.0
>
>

