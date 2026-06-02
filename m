Return-Path: <linux-media+bounces-63357-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DKvGF2cHmpVCgAAu9opvQ
	(envelope-from <linux-media+bounces-63357-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 11:03:25 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6529C62B05D
	for <lists+linux-media@lfdr.de>; Tue, 02 Jun 2026 11:03:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B7D773035674
	for <lists+linux-media@lfdr.de>; Tue,  2 Jun 2026 08:56:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8FCB3BED27;
	Tue,  2 Jun 2026 08:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ZZfmyi1a"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26AF946A;
	Tue,  2 Jun 2026 08:55:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780390558; cv=none; b=Sa8n2C8oXrD7VU85eQ9lALqeqFJe/JCcBQj0xXwf6bM3chgkg0Gs0qsnHviQahvO9YJ8Gg50IyKL/rwVVx/K/scC9AM7DGGBwRN4NB4H2vidXNMryOQezOFYv1yqVwDmzQfkmn9e/PCvqTfObXM5pPVclLJlWc4GbEW0uBAL/NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780390558; c=relaxed/simple;
	bh=KQ73qwK5IiveHVPsdWHAUZ10+xlrciJvCLssA2NROiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WS6pfznxRSiJWLy8GuW+HcMIldwaBjpUMxSfpabUy0HjW9GHpjoPIENC4SDFcRNbTwbu6d+pVvtg3txeTZsd4zuapiKyt6KoIFdIUnILIC5S6LgNktSKMFiuilZe2vTt9MEzccew3it1ajhM8pPnpxl2MW0dHYJaTw0+lCZmyMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ZZfmyi1a; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (unknown [IPv6:2a01:e0a:e80:2e70:a22d:ffa9:436b:a9db])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6FA6A802;
	Tue,  2 Jun 2026 10:55:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780390529;
	bh=KQ73qwK5IiveHVPsdWHAUZ10+xlrciJvCLssA2NROiQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZZfmyi1a3rk5lH7G0xXSaIznRMBSNnbujvQxC8sIBzDA74Dqe/74nzLszygtam6bL
	 pFOGDNym1iL1/Q7WY4Nvw8fiRnpGlnzjrJO3Qnd+UlkWohj/OLr8ahHpCsKPhlRxS0
	 lUXhKWFrhfMm7Yj9jdXy1YDkCBLOffG8oD0tjjAw=
Date: Tue, 2 Jun 2026 10:55:51 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: bod@kernel.org
Cc: p.zabel@pengutronix.de, xavier.roumegue@oss.nxp.com, hverkuil@xs4all.nl,
	mchehab@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stefan Klug <stefan.klug@ideasonboard.com>
Subject: Re: [PATCH 2/2] MAINTAINERS: Add myself to dw100 as reviewer
Message-ID: <20260602085551.GA850227@killaraus.ideasonboard.com>
References: <20260601155059.1332290-1-bod@kernel.org>
 <20260601155059.1332290-2-bod@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601155059.1332290-2-bod@kernel.org>
X-Rspamd-Queue-Id: 6529C62B05D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-63357-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[pengutronix.de,oss.nxp.com,xs4all.nl,kernel.org,vger.kernel.org,ideasonboard.com];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,i.mx:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,ideasonboard.com:dkim,killaraus.ideasonboard.com:mid]
X-Rspamd-Action: no action

Hi Bryan,

On Mon, Jun 01, 2026 at 04:50:59PM +0100, bod@kernel.org wrote:
> From: Bryan O'Donoghue <bod@kernel.org>
> 
> To facilitate cross-pollination between one arch and another I'd like to
> add myself as reviewer to the dw100. We discussed @ Nice it would be
> beneficial to have different maintainers reading/reviewing things not
> directly inside of their remit. This driver was mentioned, I'd be happy to
> join in.

Thanks for volunteering :-)

This may however not be the best candidate. The dw100 driver is well
maintained today, by Xavier as well as Stefan, as Ideas on Board makes
active use of it (Stefan, you could also volunteer as a reviewer).

Drivers that I think would most benefit from your reviews would be
imx8mq-mipi-csi2, dw-mipi-csi2rx (technically a Synopsys driver, but
used in NXP SoCs), and the new imx95-csi-formatter driver ([1]).

Other candidates could be imx7-media-csi and imx-mipi-csis, but those
see little activity as they support older hardware. The imx media
staging drivers could also do with some love, but that would be active
development and not just review.

[1] https://lore.kernel.org/20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com

> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ec0743b41a463..35368c2ff0ca6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19243,6 +19243,7 @@ F:	drivers/media/platform/nxp/imx8-isi/
>  
>  NXP i.MX 8MP DW100 V4L2 DRIVER
>  M:	Xavier Roumegue <xavier.roumegue@oss.nxp.com>
> +R:	Bryan O'Donoghue <bod@kernel.org>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/media/nxp,dw100.yaml

-- 
Regards,

Laurent Pinchart

