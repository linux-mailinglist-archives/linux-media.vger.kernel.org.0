Return-Path: <linux-media+bounces-55741-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qGs4J4Y4tGl3jAAAu9opvQ
	(envelope-from <linux-media+bounces-55741-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:17:10 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 17C72286D2A
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 17:17:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 58FB6308F0B0
	for <lists+linux-media@lfdr.de>; Fri, 13 Mar 2026 16:13:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AA6C3C2770;
	Fri, 13 Mar 2026 16:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MK0kq1RN"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5885A34D4CB;
	Fri, 13 Mar 2026 16:12:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773418378; cv=none; b=NVGrkVCHIk5r/94MlrW2d3mCjAW/UYMVrdaeBq1CNWHBFlqmOcdbctO8XpK51eKEhPKkFnhKC35GsJ/RKxybzidrz+g70dvlDDZcfG/8HDDdwDDlq7JzCl41ICvYTQLcKvg+g0NEEKgMTddPsUVqFlGg5S3cee4ruv+YW+bzfac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773418378; c=relaxed/simple;
	bh=v49xlafKSMbOoJ5ezx8ckxacsG1BpSI2we6NQdCvdkE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A1TO6svN7vcn8dGa0JigBczoj64o+5Y4PUA+HOnhs1ktn0r5ZrMvUasjHFzziw+OON5WDV6/bCLSNOUSgJ7hALeXY0XNyMpH0/cceBgQ0lr9vNsYKC0Y5OaibX93L10S/QiVUWrdxoEQVW2HBHzzHJe1OrijNTdlbSl8/gcCkN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MK0kq1RN; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (unknown [37.159.122.93])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2F818E70;
	Fri, 13 Mar 2026 17:11:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773418306;
	bh=v49xlafKSMbOoJ5ezx8ckxacsG1BpSI2we6NQdCvdkE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MK0kq1RNPOLepj6Ase1zPuO3L0Ya3BYkynspU7wHa4D5XErleXEyy/k9BqM9TNlEh
	 tpDp0iZfOQjAFXlCDcc8nDYZTzhmbV7suUYVe2EXaItiK4EoGxcyGzni2b2J82eX7s
	 fAOUiopWOdGd0sStWCLZ5WaTxq3d9ugxlICWAVqQ=
Date: Fri, 13 Mar 2026 17:12:50 +0100
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Dan Scally <dan.scally@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Hans Verkuil <hverkuil+cisco@kernel.org>, linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>, 
	=?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <barnabas.pocze+renesas@ideasonboard.com>, stable@vger.kernel.org
Subject: Re: [PATCH 3/7] media: rzv2h-ivc: Write AXIRX_PIXFMT once
Message-ID: <abQ3X1MA27VKrq-N@zed>
References: <20260313-mali-ivc-fixes-v7-0-v1-0-cb0714cd1279@ideasonboard.com>
 <20260313-mali-ivc-fixes-v7-0-v1-3-cb0714cd1279@ideasonboard.com>
 <75c4cacf-9f52-4904-9cf6-44425fabaea1@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <75c4cacf-9f52-4904-9cf6-44425fabaea1@ideasonboard.com>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55741-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,cisco,renesas];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:dkim,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 17C72286D2A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Dan

On Fri, Mar 13, 2026 at 04:07:47PM +0000, Dan Scally wrote:
> Hi Jacopo (and Barnabás)
>
> On 13/03/2026 11:13, Jacopo Mondi wrote:
> > From: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> >
> > The documentation prescribes that invalid formats should not be set,
> > so do a single write to ensure that both the CLFMT and DTYPE fields
> > are set to valid values.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: f0b3984d821b ("media: platform: Add Renesas Input Video Control block driver")
> > Signed-off-by: Barnabás Pőcze <barnabas.pocze+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> >   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c | 8 ++++----
> >   drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h       | 7 ++++---
> >   2 files changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > index bfe5b0c7045e..d894a880c33f 100644
> > --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc-video.c
> > @@ -215,10 +215,10 @@ static void rzv2h_ivc_format_configure(struct rzv2h_ivc *ivc)
> >   	/* Currently only CRU packed pixel formats are supported */
> >   	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
> > -			RZV2H_IVC_INPUT_FMT_CRU_PACKED);
> > -
> > -	rzv2h_ivc_update_bits(ivc, RZV2H_IVC_REG_AXIRX_PXFMT,
> > -			      RZV2H_IVC_PXFMT_DTYPE, fmt->dtype);
> > +			FIELD_PREP(RZV2H_IVC_AXIRX_PXFMT_FIELD_DTYPE,
> > +				   fmt->dtype) |
> > +			FIELD_PREP(RZV2H_IVC_AXIRX_PXFMT_FIELD_CLFMT,
> > +				   RZV2H_IVC_CLFMT_CRU_PACKED));
>
> TIL of FIELD_PREP(), I like that! Maybe #include <linux/bitfield.h> though?

It has been included in the previous patch if I'm not mistaken ?

>
> Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
>
> >   	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_HSIZE, pix->width);
> >   	rzv2h_ivc_write(ivc, RZV2H_IVC_REG_AXIRX_VSIZE, pix->height);
> > diff --git a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> > index 4ef44c8b4656..54c70de31c1e 100644
> > --- a/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> > +++ b/drivers/media/platform/renesas/rzv2h-ivc/rzv2h-ivc.h
> > @@ -24,9 +24,10 @@
> >   #define RZV2H_IVC_ONE_EXPOSURE				0x00
> >   #define RZV2H_IVC_TWO_EXPOSURE				0x01
> >   #define RZV2H_IVC_REG_AXIRX_PXFMT			0x0004
> > -#define RZV2H_IVC_INPUT_FMT_MIPI			(0 << 16)
> > -#define RZV2H_IVC_INPUT_FMT_CRU_PACKED			BIT(16)
> > -#define RZV2H_IVC_PXFMT_DTYPE				GENMASK(7, 0)
> > +#define RZV2H_IVC_AXIRX_PXFMT_FIELD_CLFMT		GENMASK(17, 16)
> > +#define RZV2H_IVC_CLFMT_MIPI				0
> > +#define RZV2H_IVC_CLFMT_CRU_PACKED			1
> > +#define RZV2H_IVC_AXIRX_PXFMT_FIELD_DTYPE		GENMASK(7, 0)
> >   #define RZV2H_IVC_REG_AXIRX_SADDL_P0			0x0010
> >   #define RZV2H_IVC_REG_AXIRX_SADDH_P0			0x0014
> >   #define RZV2H_IVC_REG_AXIRX_SADDL_P1			0x0018
> >
>

