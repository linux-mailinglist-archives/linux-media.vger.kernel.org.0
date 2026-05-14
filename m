Return-Path: <linux-media+bounces-61586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sCqQEoeUBWpLYwIAu9opvQ
	(envelope-from <linux-media+bounces-61586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 11:23:19 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A64D453FB95
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 11:23:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D9FE33045440
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2026 09:22:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 498D0394462;
	Thu, 14 May 2026 09:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="XBC0a6/U"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8703A1E7F;
	Thu, 14 May 2026 09:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778750554; cv=none; b=dS+pvWs+XOCLemWJnFhWsbfdQkkI0Is46bakttscHfJiIgXZJQyewvkcNQIejBJZaApFdrE4GXP+Icrjde3PewR+WwEbQH/yPcp26VkwkWr7wWQEgOYn+F3rCWcj8+myT1kSwA36SuueIGE2dlOoR0XfQeNKpkhFBnCpFauEGdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778750554; c=relaxed/simple;
	bh=Z7Adm7txEFIp1K26S+kHvMXcSaMh/Vwi7BRLRh5G74c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pc2CvJSA1fv6H4hCBmi3bsgH36fH1I5znJIwvo08J9e4KYBIf/ick27VCA0di0Zcc67D2L2GvZhqYR3UPZ0/c9ZQw34OVA4HU55A5PZ9CnxamrUIJFLcLOTz8354gJr8mXO93dmqwisDZf57TLzBiVNVKkEBM2dRNP4wzPCj2oA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=XBC0a6/U; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from ideasonboard.com (net-93-65-100-155.cust.vodafonedsl.it [93.65.100.155])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 2EBDA56D;
	Thu, 14 May 2026 11:22:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778750541;
	bh=Z7Adm7txEFIp1K26S+kHvMXcSaMh/Vwi7BRLRh5G74c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XBC0a6/U0PuHurCvFNooE5z+Hs1U1Z3tUePQweEdSgk2GeEaEWnF1e9vJvGVfZlAv
	 YhIXpsb+FOt5Z8GWt+6dcOXdQEwuqrT+7VBmvH14dxQSlff8zg4cYtlBVrWy9Uck/x
	 2s4tIacqsAbX+Zq7DW6U3BZkreewcxTPXuBwTLX8=
Date: Thu, 14 May 2026 11:22:27 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Steve Longerbeam <slongerbeam@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 05/11] media: i2c: ov5640: Remove unsupported bayer orders
Message-ID: <agWT298jhXxuo9Ia@zed>
References: <20260501-ov5640_cleanup-v1-0-0869a7802a33@ideasonboard.com>
 <20260501-ov5640_cleanup-v1-5-0869a7802a33@ideasonboard.com>
 <agWDRd0oOBsNfyy_@zed>
 <177874822267.2082999.7527544096525133469@ping.linuxembedded.co.uk>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <177874822267.2082999.7527544096525133469@ping.linuxembedded.co.uk>
X-Rspamd-Queue-Id: A64D453FB95
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[ideasonboard.com,linux.intel.com,gmail.com,kernel.org,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-61586-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email,ideasonboard.com:dkim]
X-Rspamd-Action: no action

Hi Kieran

On Thu, May 14, 2026 at 09:43:42AM +0100, Kieran Bingham wrote:
> Quoting Jacopo Mondi (2026-05-14 09:10:48)
> > Hi Kieran
> >
> > On Fri, May 01, 2026 at 04:39:07PM +0100, Kieran Bingham wrote:
> > > The OV5640 only outputs SBGGR8. Remove the incorrectly advertised
> > > alternatives which allow a misconfigured pipeline to be established.
> >
> > Do you have any idea why the datasheet mentions all the RGGB
> > permutations as valid outputs ?
>
> I would anticipate it's because the internal ISP component can support them.
>

Note that an analogue crop rectangle not aligned with the Bayer macro-pixel
could change the pattern, but the sensor's ISP shouldn't need to be
informed afaiu

> But now I think more I have to admit, I have no idea if other modules
> might have different physical orderings.
>
> But certainly as far as I can tell any given module can only have a
> single 'correct' value here.

analogue crop alignment apart :)

>
> So we'll have to try to work out how to confirm/verify that perhaps ?
>
> >
> > >
> > > Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > > ---
> > >  drivers/media/i2c/ov5640.c | 21 ---------------------
> > >  1 file changed, 21 deletions(-)
> > >
> > > diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
> > > index 244c341d0e77..e1e253730206 100644
> > > --- a/drivers/media/i2c/ov5640.c
> > > +++ b/drivers/media/i2c/ov5640.c
> > > @@ -309,27 +309,6 @@ static const struct ov5640_pixfmt ov5640_csi2_formats[] = {
> > >               .bpp            = 8,
> > >               .ctrl00         = 0x00,
> > >               .mux            = OV5640_FMT_MUX_RAW_DPC,
> > > -     }, {
> > > -             /* Raw bayer, GBGB... / RGRG... */
> > > -             .code           = MEDIA_BUS_FMT_SGBRG8_1X8,
> > > -             .colorspace     = V4L2_COLORSPACE_SRGB,
> > > -             .bpp            = 8,
> > > -             .ctrl00         = 0x01,
> > > -             .mux            = OV5640_FMT_MUX_RAW_DPC,
> > > -     }, {
> > > -             /* Raw bayer, GRGR... / BGBG... */
> > > -             .code           = MEDIA_BUS_FMT_SGRBG8_1X8,
> > > -             .colorspace     = V4L2_COLORSPACE_SRGB,
> > > -             .bpp            = 8,
> > > -             .ctrl00         = 0x02,
> > > -             .mux            = OV5640_FMT_MUX_RAW_DPC,
> > > -     }, {
> > > -             /* Raw bayer, RGRG... / GBGB... */
> > > -             .code           = MEDIA_BUS_FMT_SRGGB8_1X8,
> > > -             .colorspace     = V4L2_COLORSPACE_SRGB,
> > > -             .bpp            = 8,
> > > -             .ctrl00         = 0x03,
> > > -             .mux            = OV5640_FMT_MUX_RAW_DPC,
> > >       },
> >
> > Seems like you've missed the same entries in the ov5640_dvp_formats[]
> > table.
>
> That was intentional so far as I can only test the CSI variant. But
> perhaps for the same reasons mentioned above, whatever happens on one
> will be the same on the other.
>
> I hope posting this will find some wider testers 'perhaps' if anyone
> cares.
>
> --
> Kieran.
>
> >
> > >       { /* sentinel */ }
> > >  };
> > >
> > > --
> > > 2.52.0
> > >
> > >

