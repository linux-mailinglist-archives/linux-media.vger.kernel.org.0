Return-Path: <linux-media+bounces-65882-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id xqIeNPQ5Qmr/2AkAu9opvQ
	(envelope-from <linux-media+bounces-65882-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:25:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5F6D824B
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 11:25:08 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=faAj77xk;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65882-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65882-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B0EE530230D2
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 175B2400DFF;
	Mon, 29 Jun 2026 09:15:18 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9536E3FF8BD;
	Mon, 29 Jun 2026 09:15:15 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724517; cv=none; b=QdL/bvLxRUPf9pdsHdxL9D3sZ+5KfYm+ASsxlvwYGDFmf18Md7w6kAiT2zBZY2SZxLZkY2mQuzxB7/W7Ye2amftKI2qmFBTg4g7e6ZL6kHmp8nFvtA+/wMEhttcepdbESN8qeSt5ek5d5rGZsJH57w6vfKoxf53akMdD4YAolOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724517; c=relaxed/simple;
	bh=Ndg3q1/9iVJmTUcGaNIpBJ21DqmlzbnweaZiKAqo4NY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qqIX5DLemosuAaD1RvPfzqSWmfYIH2i1e5TYKs1g9wFI44t2rh+Ui7aN7Ws32RXytR82DodvnJ88bjrrxzMF5WOsvetkv/DhzpxZkw5lmqK33jc7PTeF2iZAO8llYSTber52kLPfyNKyh2EaqdLrTrX0R2H00AldtFNYRh1H2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=faAj77xk; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-0-8.net.vodafone.it [109.113.0.8])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AABA1324;
	Mon, 29 Jun 2026 11:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1782724470;
	bh=Ndg3q1/9iVJmTUcGaNIpBJ21DqmlzbnweaZiKAqo4NY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=faAj77xkzWMMWM+Aa9mr0m7n8Z/Zo/F356gj/72hUWeVAAGx9f6y7TJJMe6Hqkp2Y
	 pe94cfB+Z3+NN4BqDyJARjI20nzNF1xiU6PnvNC3I4EjVBF3Nsior6UntlQdL10oqP
	 WAto5nEXyJETEcxrNeiSDcnEsZYR2OpVUTKCmrOo=
Date: Mon, 29 Jun 2026 11:15:09 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	linus.walleij@arm.com, laurent.pinchart@ideasonboard.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v3 2/4] media: mali-c55: Implement CCM block validation
Message-ID: <akI281oHP4USBYua@zed>
References: <20260627-mali-c55-ccm-gamma-v3-0-113584c05174@ideasonboard.com>
 <20260627-mali-c55-ccm-gamma-v3-2-113584c05174@ideasonboard.com>
 <7afdc0fa-343b-4159-a357-180d692c9dd2@arm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7afdc0fa-343b-4159-a357-180d692c9dd2@arm.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:vincenzo.frascino@arm.com,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:linus.walleij@arm.com,m:laurent.pinchart@ideasonboard.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65882-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,arm.com:email,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 72A5F6D824B

Hi Vincenzo
  thanks for the review

On Mon, Jun 29, 2026 at 08:52:09AM +0100, Vincenzo Frascino wrote:
> Hi Jacopo,
>
> thank you for your patch.
>
> On 27/06/2026 15:29, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
> > Implement validation of CCM block parameters.
> >
> > CCM coefficients are expressed as 13 bits signed Q4.8 format and their
> > raw value cannot be higher than 8191 (BIT(13) - 1).
> >
> > CCM gains are expressed as unsigned 12 bits Q4.8 format and their raw
> > value cannot be higher than 4095 (BIT(12) - 1).
> >
> > CCM offsets are 12 bits unsigned integers and their value cannot be
> > higher than 4095 (BIT(12) - 1).
> >
> > Validate the parameters provided by userspace using the .block_validate
> > callback of struct v4l2_isp_params_block_type_info.
> >
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> >
>
> I have a couple of comments. With this:
>
> Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>
> > ---
> > v3:
> > - new patch
> > ---
> >  .../media/platform/arm/mali-c55/mali-c55-params.c  | 36 ++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >
> > diff --git a/drivers/media/platform/arm/mali-c55/mali-c55-params.c b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > index 0da5215c52c3..333e66ee3923 100644
> > --- a/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > +++ b/drivers/media/platform/arm/mali-c55/mali-c55-params.c
> > @@ -477,6 +477,41 @@ static const mali_c55_params_handler mali_c55_params_handlers[] = {
> >  	[MALI_C55_PARAM_BLOCK_CCM] = &mali_c55_params_ccm,
> >  };
> >
> > +static int mali_c55_ccm_validate(struct device *dev,
> > +				 const struct v4l2_isp_block_header *block)
> > +{
> > +	const struct mali_c55_params_ccm *ccm =
> > +		(const struct mali_c55_params_ccm *)(block);
> > +
> > +	for (unsigned int i = 0; i < 3; i++) {
> > +
>
> Nit: extra blank line after the for opening brace, kernel style usually avoids this.
>

I know, checkpatch reports this as well, but as I have three
validation 'blocks' it felt nicer this way. I can drop the blank line
though

> > +		for (unsigned int j = 0; j < 3; j++) {
> > +			/* Coefficients are 13 bits signed Q4.8. */
> > +			if (ccm->coeffs[i][j] > 8191) {
>
> No magic numbers please :) Maybe use GENMASK(12, 0) or BIT(13) - 1 for
> readability and consistency with the commit message, and similarly GENMASK(11,
> 0) or BIT(12) - 1 for gains and offsets. This also avoids magic numbers in
> validation. The same could be applied to the other cases in this patch.
>

Nice suggestion. I used comments to explain the meaning of 8191 and
4095 but indeed using GENMASK() is certainly more explicit.

I'll do so.

> > +				dev_dbg(dev, "Invalid ccm coefficient %u\n",
> > +					ccm->coeffs[i][j]);
> > +				return -EINVAL;
> > +			}
> > +		}
> > +
> > +		/* Gains are 12 bits unsigned Q4.8. */
> > +		if (ccm->gains[i] > 4095) {
> > +			dev_dbg(dev, "Invalid ccm gain %u\n",
> > +				ccm->gains[i]);
> > +			return -EINVAL;
> > +		}
> > +
> > +		/* Offsets are 12 bits unsigned integers. */
> > +		if (ccm->offs[i] > 4095) {
> > +			dev_dbg(dev, "Invalid ccm offset %u\n",
> > +				ccm->offs[i]);
> > +			return -EINVAL;
> > +		}
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  static const struct v4l2_isp_params_block_type_info
> >  mali_c55_params_block_types_info[] = {
> >  	[MALI_C55_PARAM_BLOCK_SENSOR_OFFS] = {
> > @@ -514,6 +549,7 @@ mali_c55_params_block_types_info[] = {
> >  	},
> >  	[MALI_C55_PARAM_BLOCK_CCM] = {
> >  		.size = sizeof(struct mali_c55_params_ccm),
> > +		.block_validate = mali_c55_ccm_validate,
> >  	},
> >  };
> >
> >
>
> --
> Regards,
> Vincenzo
>

