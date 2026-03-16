Return-Path: <linux-media+bounces-55970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YD6HEVtTuGmKcAEAu9opvQ
	(envelope-from <linux-media+bounces-55970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:00:43 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB4829F6E3
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 20:00:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id C0D4D3011CA5
	for <lists+linux-media@lfdr.de>; Mon, 16 Mar 2026 19:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034D73ED12F;
	Mon, 16 Mar 2026 19:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fdb72Nt4"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5E43ED115
	for <linux-media@vger.kernel.org>; Mon, 16 Mar 2026 19:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773687637; cv=none; b=nzf7uqrcxMkawM+kN0bTmLqQ1KKtGUABR9zHsUShsEVbmpHa5xWKOZBoXdoL/PtPFaTSHu22brGam/VWEqwDuIKe7BF/rFiTjGdSReBI6lBN/oVadiuPGcK6lr5avz1Uq4pnKwbb8Sn5cdioZ9BC1upebdaxspZoCubTf9T9GVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773687637; c=relaxed/simple;
	bh=ReiqSWYIIl50WT9F2EHR1l6OqZaFKNqVSJLA3SQyexo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EjZpNQ21Dl1rChP+IBdwx2MMokkXkYH3IM9RERMd6FFXCAeVVo1bzHyRgDWZF1nwiv0pwu7DJD7bcvmM3FWYZs3+uEpm+hM+YeWw92xG5mEwQ/WO+HqypF2dMhGvNYl9fF9gyYmYpNAucpr9yWlaVp/TS5YZHxMirx+4BWbihho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fdb72Nt4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773687634; x=1805223634;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ReiqSWYIIl50WT9F2EHR1l6OqZaFKNqVSJLA3SQyexo=;
  b=Fdb72Nt45GubQd9+IH4VlXH1CaztOTC8v6uzpv1HDaHNVmMiiF14fE8A
   ovH1nXotC50KoBqxR3R0Z/G8sB0fFH03scz02uUUnuYcAnZHgTXBxgTHb
   7ls9/hB+GKdZFWo213jfKOWY2Q8Z5uQfvxLyxsdKBPVVlrmxoEkQ8+gyN
   +4eErQUsYErF7w//FzTOWOxJuIdOgx8JP6gIyrGCGxObnPCjkadtR3faB
   AVPI2QBKRDDewecL8K+1XjB/nkqo5oEHneZUtwKhBsy1n57Jyeof1UE0m
   63FZ1e2I4Ap8E7r/awoIss33/v9WiHa0QEXmeza+NxTl+8W0d8RD0jPoA
   Q==;
X-CSE-ConnectionGUID: 0/4URtWeT8qz3OcHZuSfow==
X-CSE-MsgGUID: E2lJziQhTY2Gz6Vi3eyBWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77323238"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77323238"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 12:00:33 -0700
X-CSE-ConnectionGUID: uO+Ara9WTtaMewotmqGwsw==
X-CSE-MsgGUID: lKOlDGTJRu+XpQPnnqQOjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="226144282"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.29])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Mar 2026 12:00:32 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id A2574121D04;
	Mon, 16 Mar 2026 21:00:29 +0200 (EET)
Date: Mon, 16 Mar 2026 21:00:29 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: Re: [raw2rgbpnm PATCH v4 03/11] Add 10-bit CSI-2 packed format
 support
Message-ID: <abhTTXRhGfKlRVNl@kekkonen.localdomain>
References: <20260310084615.1183141-1-sakari.ailus@linux.intel.com>
 <20260310084615.1183141-4-sakari.ailus@linux.intel.com>
 <20260316143830.GE31604@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316143830.GE31604@killaraus.ideasonboard.com>
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55970-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sakari.ailus@linux.intel.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,kekkonen.localdomain:mid]
X-Rspamd-Queue-Id: 6FB4829F6E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Laurent,

Thank you for the review.

On Mon, Mar 16, 2026 at 04:38:30PM +0200, Laurent Pinchart wrote:
> On Tue, Mar 10, 2026 at 10:46:09AM +0200, Sakari Ailus wrote:
> > Add support for the 10-bit CSI-2 packed raw formats.
> > 
> > Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > ---
> >  raw2rgbpnm.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 82 insertions(+)
> > 
> > diff --git a/raw2rgbpnm.c b/raw2rgbpnm.c
> > index 5df3ff7ab31d..14cfa7e7a46c 100644
> > --- a/raw2rgbpnm.c
> > +++ b/raw2rgbpnm.c
> > @@ -25,6 +25,7 @@
> >  
> >  #include <ctype.h>
> >  #include <stdio.h>
> > +#include <stdint.h>
> 
> You nearly got the alphabetic order right :-)

Uh-oh.

The patches have been already merged but I'll write another set to address
your review comments.

> > +static inline void raw_put(uint8_t bpp, unsigned char *ptr, unsigned int stride,
> > +			   unsigned int x, unsigned int y, uint16_t value)
> > +{
> > +	switch (bpp) {
> > +	case 10: {
> > +		unsigned char *base = ptr + y * stride + x / 4 * 5;
> > +		unsigned int idx = x & 3U;
> > +
> > +		base[idx] = value >> 2;
> > +		base[4] &= ~(3U << (idx << 1));
> > +		base[4] |= (value & 3U) << (idx << 1);
> > +		break;
> > +	}
> 
> I assume you'll need this later in the series, it's not used here.

Well, almost. It could have been used. I thought first I'd convert the
conversion code to use generic pixel get / put but opted to just convert
the format into something already supported. I'd leave this in place for
now though.

> 
> > +	case 16:
> > +		*(uint16_t *)&ptr[y * stride + x * 2] = value;
> > +		break;
> > +	default:
> > +		error("putting raw %u not supported", bpp);
> > +	}
> > +}
> > +
> >  static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src,
> >  			      int src_width, int src_height, unsigned int src_stride)
> >  {
> > @@ -283,6 +328,7 @@ static int raw_layout_to_grbg(const struct format_info *info, unsigned char *src
> >  static void raw_to_rgb(const struct format_info *info,
> >  		       unsigned char *src, int src_width, int src_height, unsigned char *rgb)
> >  {
> > +	unsigned char *tmp_src = NULL;
> >  	unsigned int src_stride = src_width * info->bpp / 8;
> >  	unsigned int rgb_stride = src_width * 3;
> >  	unsigned char *src_luma, *src_chroma;
> > @@ -298,6 +344,40 @@ static void raw_to_rgb(const struct format_info *info,
> >  	int cr_pos;
> >  	int shift;
> >  
> > +	switch (info->fmt) {
> > +	case V4L2_PIX_FMT_SBGGR10P:
> > +	case V4L2_PIX_FMT_SGBRG10P:
> > +	case V4L2_PIX_FMT_SRGGB10P:
> > +	case V4L2_PIX_FMT_SGRBG10P: {
> > +		const struct format_info *old_info = info;
> > +		unsigned int new_stride = src_width * 2;
> 
> I'd call this unpacked_stride. It's a bit longer, but clearer.

Sounds good to me.

> 
> > +
> > +		tmp_src = malloc(new_stride * src_height);
> > +		if (!tmp_src)
> 
> "tmp" isn't very descriptive either.

It is very temporary, isn't it?

> 
> > +			error("can't allocate memory for the temporary buffer");
> > +
> > +		for (src_y = 0; src_y < src_height; src_y++)
> > +			for (src_x = 0; src_x < src_width; src_x++)
> > +				raw_put(16, tmp_src, new_stride, src_x, src_y,
> > +					raw_get(info->bpp, src, src_stride,
> > +						src_x, src_y));
> > +
> > +		src_stride = new_stride;
> > +		src = tmp_src;
> > +
> > +		for (unsigned int i = 0; i < SIZE(v4l2_pix_fmt_str); i++) {
> > +			if (v4l2_pix_fmt_str[i].fmt == info->compat_fmt) {
> > +				info = &v4l2_pix_fmt_str[i];
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (info == old_info)
> > +			error("no supported format found for %s",
> > +			      old_info->name);
> 
> Maybe you could do this before handling the conversion.

Sounds good.

> 
> > +	}
> > +	}
> > +
> >  	switch (info->fmt) {
> >  	case V4L2_PIX_FMT_VYUY:
> >  	case V4L2_PIX_FMT_YVYU:
> > @@ -734,6 +814,8 @@ static void raw_to_rgb(const struct format_info *info,
> >  		}
> >  		break;
> >  	}
> > +
> > +	free(tmp_src);
> 
> This makes me which the kernel's __free() macro could be used here.

I think raw2rgbpnm could well manage without the infrastructure, couldn't
it? :-)

> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

Thank you. :-)

-- 
Kind regards,

Sakari Ailus

