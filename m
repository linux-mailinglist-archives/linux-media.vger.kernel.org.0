Return-Path: <linux-media+bounces-60024-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +PAwMSFp8mkBqwEAu9opvQ
	(envelope-from <linux-media+bounces-60024-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:25:05 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FAA549A204
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 22:25:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 1ADE73025A5B
	for <lists+linux-media@lfdr.de>; Wed, 29 Apr 2026 20:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AECB3932E6;
	Wed, 29 Apr 2026 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="mpXcpYwi"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 460B8349AEA;
	Wed, 29 Apr 2026 20:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777494296; cv=none; b=LnYyIP9lUfVUISH6pEzBBmzIiEnwDqPNMFktr1C5I1ssbSzl3Jh8DZVsbb98B8OCBdcUAjku6K2M3wx0uPoyEQ3NuDBb6o+vJXY062RCDopxIkPnCGOt7p1GYRywyVIw8I9yBRX40qXb2NydIueV39NrU23vRhAmHpCV/WeyjnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777494296; c=relaxed/simple;
	bh=iulvXbZkDJGHDtvEgdroSaDsaJI2XiR6VVQNupN5ODQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UI3zILGCCq8oAMWV6fXHt26nyZ6ny+RXRyvaJsO7UouqogHQBvhtLhre6I9i3K+cIekvNF+N366lRZcsb2pYZ+Xm56kNUip7k3WVpqfmN8Og7X5Gqkt9lv3Y4Pj0OKXdIw92IR7ydvAoDnNU2o/H88mzIwH+o81Qd6gWhHjOUiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=mpXcpYwi; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E4DA4BB;
	Wed, 29 Apr 2026 22:23:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777494187;
	bh=iulvXbZkDJGHDtvEgdroSaDsaJI2XiR6VVQNupN5ODQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mpXcpYwiPr8eUp6AkpxGzmu1k1aNB/KQrgO1GOaTZ7snIManyeSmjnrd7OclWFFBZ
	 ubK/pLXk0K3JhWohalEDH7h9ROoIhZfFIhpvpEJ6XzapiifohBObKl9sqgQL2BXK06
	 ZAcGVHKmlD0AVcoT2ISTeo/FScLavX9p+GNiRnyA=
Date: Wed, 29 Apr 2026 23:24:49 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michal Simek <michal.simek@amd.com>, linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [PATCH][next] media: xilinx: Avoid
 -Wflex-array-member-not-at-end warning
Message-ID: <20260429202449.GA132396@killaraus.ideasonboard.com>
References: <afJiL-iZ4QbJ5v12@kspp>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <afJiL-iZ4QbJ5v12@kspp>
X-Rspamd-Queue-Id: 4FAA549A204
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	RCVD_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-60024-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]

CC'ing Tomi Valkeinen.

On a side note, Tomi, can I send a patch to add you to the "XILINX VIDEO
IP CORES" section of MAINTAINERS ?

On Wed, Apr 29, 2026 at 01:55:27PM -0600, Gustavo A. R. Silva wrote:
> -Wflex-array-member-not-at-end was introduced in GCC-14, and we are
> getting ready to enable it, globally.
> 
> Use the TRAILING_OVERLAP() helper to fix the following warning:
> 
> drivers/media/platform/xilinx/xilinx-dma.h:99:41: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> This helper creates a union between a flexible-array member (FAM)
> and a set of members that would otherwise follow it. This overlays
> the trailing members onto the FAM while preserving the original
> memory layout.
> 
> Lastly, the static_assert() ensures the alignment between the FAM
> and struct data_chunk sgl; is not inadvertently changed, and it's
> intentionally placed inmediately after the related structure (that
> is, no blank line in between).
> 
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/media/platform/xilinx/xilinx-dma.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/xilinx/xilinx-dma.h b/drivers/media/platform/xilinx/xilinx-dma.h
> index 18f77e1a7b39..65f6147ff6c6 100644
> --- a/drivers/media/platform/xilinx/xilinx-dma.h
> +++ b/drivers/media/platform/xilinx/xilinx-dma.h
> @@ -96,9 +96,14 @@ struct xvip_dma {
>  
>  	struct dma_chan *dma;
>  	unsigned int align;
> -	struct dma_interleaved_template xt;
> -	struct data_chunk sgl;
> +
> +	/* Must be last as it ends in a flexible-array member. */
> +	TRAILING_OVERLAP(struct dma_interleaved_template, xt, sgl,
> +		struct data_chunk sgl;
> +	);
>  };
> +static_assert(offsetof(struct xvip_dma, xt.sgl) ==
> +	      offsetof(struct xvip_dma, sgl));
>  
>  #define to_xvip_dma(vdev)	container_of(vdev, struct xvip_dma, video)
>  

-- 
Regards,

Laurent Pinchart

