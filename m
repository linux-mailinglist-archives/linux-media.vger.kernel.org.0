Return-Path: <linux-media+bounces-59726-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wJnMBlTH72m4FwEAu9opvQ
	(envelope-from <linux-media+bounces-59726-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 22:30:12 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C84B47A05E
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 22:30:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B394F31017C5
	for <lists+linux-media@lfdr.de>; Mon, 27 Apr 2026 20:25:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6CCA370D58;
	Mon, 27 Apr 2026 20:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="EE5ScAbO"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A54E31F984;
	Mon, 27 Apr 2026 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777321536; cv=none; b=hdpzxWBybyKQpNC1y9WYKwtqu/gttYcwv3wGiWcufimSjDzDwH4Rfz5cbTYEUAQz6tFb3DJ4krQfR/1lRdG4yXSTu2drQ07SpVTkQUt3u/4PamoFADOlTEzofRvCl2aCUnVCYnlLa891vfTuQBHjxtGwQ4Ne2xxYnagp5WSxAXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777321536; c=relaxed/simple;
	bh=oHxuF0zz8E0hhW0pls7hle2dqF6YIvkZgvJcLy3BzXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hG2tl83yhQSXzh7Iyf9QzY1BxSil12SmefJgKm1PSQ1s/hq31LPGTN25oURDgl7myPEHzUa2yy5RWV5GPc5altG/n/Q+lVIQVuuftc/rpHhVIRfpr2NXrxq8c8aKLNhNDCoBbQE0w6Nf5SnJvI2CkAvw5vhNVrRvjq+Hm8cmbL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=EE5ScAbO; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E8627145C;
	Mon, 27 Apr 2026 22:23:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777321423;
	bh=oHxuF0zz8E0hhW0pls7hle2dqF6YIvkZgvJcLy3BzXs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EE5ScAbO1F/fZr/DQTTI6ND1triKB6GpQa7Z7ASKsATJiY0tlQFgl3yZEOEPoF5bo
	 WH2kRX9EssbY1q5ZAAXju0xpBGqp6kQcBY5z1vNAW4Dw7Qpsoeessn4m+8P1vbgK5r
	 CM3rWC9Sm5MRqPpyj9tJvcZhAfzRyB5dQi3zWuDg=
Date: Mon, 27 Apr 2026 23:25:23 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	Bryan O'Donoghue <bod@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org, devicetree@vger.kernel.org,
	kieran.bingham@ideasonboard.com
Subject: Re: [PATCH v2 12/14] media: uapi: Add CAMSS ISP configuration
 definition
Message-ID: <20260427202523.GE3219146@killaraus.ideasonboard.com>
References: <20260427-camss-isp-ope-v2-0-f430e7485009@oss.qualcomm.com>
 <20260427-camss-isp-ope-v2-12-f430e7485009@oss.qualcomm.com>
 <3e72d17c-e46c-42d3-9b17-54627f6e5e28@oss.qualcomm.com>
 <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEp6-20MzQh55iJzyhn=htFZxN1yq9o+EJJAX0CWG3O6_KSyA@mail.gmail.com>
X-Rspamd-Queue-Id: 7C84B47A05E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59726-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,killaraus.ideasonboard.com:mid,qualcomm.com:email]

On Mon, Apr 27, 2026 at 10:08:59PM +0200, Loic Poulain wrote:
> On Mon, Apr 27, 2026 at 2:56 PM Konrad Dybcio wrote:
> > On 4/27/26 2:43 PM, Loic Poulain wrote:
> > > Add the uapi header camss-config.h defining the ISP parameter
> > > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > > This includes structures for white balance, chroma enhancement and
> > > color correction configuration.
> > >
> > > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > > ---
> >
> > [...]
> >
> >
> > > +/**
> > > + * struct camss_params_wb_gain - White Balance gains
> > > + *
> > > + * @header:   generic block header; @header.type = CAMSS_PARAMS_WB_GAIN
> > > + * @g_gain:   green channel gain (15uQ10)
> > > + * @b_gain:   blue channel gain (15uQ10)
> > > + * @r_gain:   red channel gain (15uQ10)
> > > + */
> > > +struct camss_params_wb_gain {
> > > +     struct v4l2_isp_params_block_header header;
> > > +     __u16 g_gain;
> > > +     __u16 b_gain;
> > > +     __u16 r_gain;
> > > +     __u16 _pad;
> > > +} __attribute__((aligned(8)));
> >
> > Should this be __le for all of the related types?
> 
> At the moment, this is purely a UAPI, the values are not dumped
> directly to hardware as-is. Instead, each field is translated into one
> or more register writes, with the appropriate math, masking and
> shifting applied. Adding explicit endianness in the definition would
> therefore require special handling on both user and kernel side
> (to_le16, from_le16).
> 
> On the other side, there are scenarios, such as platforms that rely on
> ICP (firmware-driven processing), where we may want to forward these
> structures directly within an HFI packet to the ICP MCU. In that
> context, explicitly defining the endianness could make some sense...

Would those be different structures, or do you envision that someone
could develop an ICP firmware that understands these structures ?

-- 
Regards,

Laurent Pinchart

