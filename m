Return-Path: <linux-media+bounces-61818-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mKO6JzrTCGov7AMAu9opvQ
	(envelope-from <linux-media+bounces-61818-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:27:38 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E597D55DAC2
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:27:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D7C293014282
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 20:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7713E3644CF;
	Sat, 16 May 2026 20:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="nSSTYgWM";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FNHaPDev"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CD0282F0E;
	Sat, 16 May 2026 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778963246; cv=none; b=O3you3azNlXNlRsojUQfGTrEl+tlcrGp1r0ftBgvyUn1iNFMjbQ2DZ0xty+LkOVDID8iuBAY9khYmYLenSLzt63lw4L7Fr8IpfOYFIzfK3LfX00kNWPoYVNmR46oyqEh945CuEys4UkXiJ0+zcgiDHRqdI/fS3OyrXIDPe8m//o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778963246; c=relaxed/simple;
	bh=pWxO1iiZ80gf/lA/ElsJAh19CbRA7qEam/m2+gfHtI0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hD+vLFR1FGPJKJ0JZoM+SbTOvAMyVc0EKrAGz/Du0V2J1rlXxU4IJ6XeDdN1R/bjtYphOtBOY5CZA+feYI7PArmh7Cg/ThOxQO3fzC+S74PsOImUgNW2xie+1dKDgs2/B4CRtpa14qCi+2vKzWuoT61EOrqwLa0zbm8XENfzBJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=nSSTYgWM; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FNHaPDev; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7DE2C14000E5;
	Sat, 16 May 2026 16:27:23 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Sat, 16 May 2026 16:27:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778963243;
	 x=1779049643; bh=4uWuUHjZzYYrm+o6sdsjb1oxcrOVULNSo2zbL6PupNs=; b=
	nSSTYgWMFjnntctP7A6F2tVTek/LPDN+uXbxiZ2nEZE9s6qsEns3cQS1IiDe+qF1
	BorHVQ+bScpfKGEpWHFitv8RgmqR3Et2isXL+X1D6aaLuT9zL8zIjvPNfGsjcf/3
	etpUVKRzqsoHNVHMYuYixKMbz9o4NAQrMdcoxHf3zKdFPqOyhN4DY/Zvyqmo5eyj
	NUdZtn/W/deVSY+qmtLZPDeJbuzdrKo+xe4u+kglbIZYt2hh0Zma+ZB+I1eZeX2x
	pZUm88tfhFAWHoa83eSqP7N/0XCJI+R1DGkKAfOhi2Gko7SpZw6pXz6L8VBWV96H
	cmOsZcpDN1xMoSRRgjI7Ag==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778963243; x=
	1779049643; bh=4uWuUHjZzYYrm+o6sdsjb1oxcrOVULNSo2zbL6PupNs=; b=F
	NHaPDevIB9+59qK6Mj4fz5U4B6HTntzSGkeOSnCY3LYtREN0d6LaCneXYsbN/Eg8
	7Gnsb9fgR/8gr4DkeRPrd7IxuOR7KXefJbrr451MMwsVmI8ldW2+Dv7S1aSKQ5Ds
	e45I002XfBNPVqi1UjAJhCREvc42+UHidgR1M3nz/W79Rm5cxOfGIU5RCFBsTpWf
	9ZLsBrFKyy6q7TG+/Got9jku/hOeDttEUKQvWDuMpRUN7tSsujhYZv4pw5sliTls
	1p7diAZktJLeMw3ZxyTPim5Lo+l1ukzE1tHU5VtS0/SygR4OWUzk4Hler5K9FnA2
	j1zoJqsxG/nmL2TneHEaQ==
X-ME-Sender: <xms:K9MIauzNNlp47kU70O1LZUtZVIp2BRjZGleyvZSMXjksbdaFroHLtQ>
    <xme:K9MIaqtriTVJEi0c_9uZ0ymtMPfIMjrjQOplshYsGzch2us6iOiOzLDfXx_5QiyEk
    VQzk8nhYk_Io2YX8kGC2jOIjJT7uR1it11feye4wEpePEaE-j6rHD1C>
X-ME-Received: <xmr:K9MIahB26ZbFcXPJAUSn-2_xABs7kNOZfipnB-PxSCPyTqUDsb7GZa9sk2SlcNf_uyLerPi-zzZQCNwwDs_6BlgAy2y4q-rDWK_Z>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegvdegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeffkefgudekgefh
    hfejtedviedtgeetieekffeiudfhgeevteejvedtffdvkefftdenucffohhmrghinhepkh
    gvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghi
    lhhfrhhomhepnhhikhhlrghsrdhsohguvghrlhhunhguodhrvghnvghsrghssehrrghgnh
    grthgvtghhrdhsvgdpnhgspghrtghpthhtohepledpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepjhgrtghophhordhmohhnughisehiuggvrghsohhnsghorghrugdrtghomh
    dprhgtphhtthhopegrnhhtohhinhgvrdgsohhuhigvrhesnhigphdrtghomhdprhgtphht
    thhopehjrghirdhluhhthhhrrgdorhgvnhgvshgrshesihguvggrshhonhgsohgrrhgurd
    gtohhmpdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepkhhunhhinhhorhhirdhmohhrihhmohhtohdrghigsehrvghnvghsrghsrdgtohhmpd
    hrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrhhtsehiuggvrghsohhnsghorghr
    ugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrhgvnhgvshgrshdqshhotgesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:K9MIasGLBTAk5YKoCYmqUHAXx8Ewx9Hc1IG8TVbFM1l15JPx--OHEA>
    <xmx:K9MIahAgfhXtonzBSp0Po6Y_PFPJFlnsBz9wlrdYI5OMejGa2KyetQ>
    <xmx:K9MIaikItxYlVwAraaDt32jEmgFajBCTvte4bI_ftrCsZb_A_WKEDQ>
    <xmx:K9MIanMnLY0T4cBG0SIIRk9m-00Q8EWNgC9r--Z2W8zFTPti_jFFuA>
    <xmx:K9MIatuyg3lthGCtJyZg3k7utV8oKAaQXOptVYTiVfT11WDLFtc-F-LQ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 16:27:22 -0400 (EDT)
Date: Sat, 16 May 2026 22:27:21 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Antoine Bouyer <antoine.bouyer@nxp.com>,
	Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v8 04/14] media: rppx1: wbmeas: Add support for white balance
 measurement
Message-ID: <20260516202721.GX332351@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-5-niklas.soderlund+renesas@ragnatech.se>
 <e542034a-a3f2-4998-b581-70246fa7026e@nxp.com>
 <aftOSBQ6qk0v73Tx@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aftOSBQ6qk0v73Tx@zed>
X-Rspamd-Queue-Id: E597D55DAC2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-61818-lists,linux-media=lfdr.de,renesas];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hello Antoine and Jacopo,

Thanks for your review.

On 2026-05-06 16:22:30 +0200, Jacopo Mondi wrote:
> Hi Antoine
> 
> On Wed, May 06, 2026 at 03:58:30PM +0200, Antoine Bouyer wrote:
> > On 5/4/26 3:05 AM, Niklas Söderlund wrote:
> > > Extend the RPPX1 driver to allow setting the white balance measurement
> > > configuration and consuming the resulting statistics. It uses the RPPX1
> > > framework for parameters and its writer abstraction to allow the user to
> > > control how, and when, configuration is applied to the RPPX1.
> > >
> > > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > > Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > > ---
> > >   .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
> > >   .../platform/dreamchip/rppx1/rpp_params.c     |   4 +
> > >   .../platform/dreamchip/rppx1/rpp_stats.c      |  18 +++
> > >   .../platform/dreamchip/rppx1/rppx1_wbmeas.c   | 103 ++++++++++++++++++
> > >   .../uapi/linux/media/dreamchip/rppx1-config.h | 101 ++++++++++++++++-
> > >   5 files changed, 226 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > > index 742904973e35..85fb23174e57 100644
> > > --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > > @@ -85,10 +85,12 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> > >
> > >   union rppx1_params_block {
> > >          struct v4l2_isp_params_block_header header;
> > > +       struct rppx1_wbmeas_params wbmeas;
> > >   };
> > >
> > >   union rppx1_stats_block {
> > >          struct v4l2_isp_params_block_header header;
> > > +       struct rppx1_wbmeas_stats wbmeas;
> > >   };
> > >
> > >   struct rpp_module_ops {
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > > index a5feb18f3bd5..1262350d2190 100644
> > > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > > @@ -16,6 +16,7 @@
> > >
> > >   static const struct v4l2_isp_block_type_info
> > >   rppx1_ext_params_blocks_info[] = {
> > > +       RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> > >   };
> > >
> > >   int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> > > @@ -50,6 +51,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> > >                  block_offset += block->header.size;
> > >
> > >                  switch (block->header.type) {
> > > +               case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
> > > +                       module = &rpp->post.wbmeas;
> > > +                       break;
> > >                  default:
> > >                          module = NULL;
> > >                          break;
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > > index 8f43e56ba361..4c38e657e5f0 100644
> > > --- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > > @@ -14,6 +14,11 @@
> > >                  .size = sizeof(struct rppx1_ ## block ## _stats), \
> > >          }
> > >
> > > +static const struct v4l2_isp_block_type_info
> > > +rppx1_stats_blocks_info[] = {
> > > +       RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> > > +};
> > > +
> > >   #define rppx1_init_stats_block(rpp, buf, type)                         \
> > >          ((union rppx1_stats_block *)                                    \
> > >          v4l2_isp_stats_init_block((rpp)->dev, (buf),                    \
> > > @@ -23,5 +28,18 @@
> > >
> > >   void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
> > >   {
> > > +       struct v4l2_isp_buffer *stats = buf;
> > > +       union rppx1_stats_block *block;
> > > +
> > > +       v4l2_isp_stats_init_buffer(stats);
> > > +
> > > +       if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
> > > +               block = rppx1_init_stats_block(rpp, stats,
> > > +                                              RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST);
> > > +               if (!block)
> >
> > Hi Niklas
> >
> > I assume you need to use IS_ERR() here, instead of null pointer check, since
> > v4l2_isp_stats_init_block() does return an error from this series [1].
> >
> > Same applies to other stats blocks.
> 
> Duh, thanks for catching! This is defintely my bad and not Niklas' has
> I didn't update these callers when I changed the return value of
> v4l2_isp_stats_init_block() ...

Fixed.

> 
> >
> > BR
> > Antoine
> >
> > [1] https://lore.kernel.org/linux-media/20260505-extensible-stats-v1-6-e16f326b8dad@ideasonboard.com/
> >
> > > +                       return;
> > > +
> > > +               rpp_module_call(&rpp->post.wbmeas, fill_stats, block);
> > > +       }
> > >   }
> > >   EXPORT_SYMBOL_GPL(rppx1_stats_fill_isr);
> > > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > index 3d197d914d07..53263bc96280 100644
> > > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_wbmeas.c
> > > @@ -56,6 +56,109 @@ static int rppx1_wbmeas_probe(struct rpp_module *mod)
> > >          return 0;
> > >   }
> > >
> > > +static int
> > > +rppx1_wbmeas_fill_params(struct rpp_module *mod,
> > > +                        const union rppx1_params_block *block,
> > > +                        rppx1_reg_write write, void *priv)
> > > +{
> > > +       const struct rppx1_wbmeas_params *cfg = &block->wbmeas;
> > > +       u32 awb_meas_props;
> > > +
> > > +       /* If the modules is disabled, simply bypass it. */
> > > +       if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > > +               write(priv, mod->base + AWB_MEAS_PROP_REG, 0);
> > > +               return 0;
> > > +       }
> > > +
> > > +       /* Program measurement window. */
> > > +       write(priv, mod->base + AWB_MEAS_H_OFFS_REG, cfg->wnd.h_offs);
> > > +       write(priv, mod->base + AWB_MEAS_V_OFFS_REG, cfg->wnd.v_offs);
> > > +       write(priv, mod->base + AWB_MEAS_H_SIZE_REG, cfg->wnd.h_size);
> > > +       write(priv, mod->base + AWB_MEAS_V_SIZE_REG, cfg->wnd.v_size);
> > > +
> > > +       /* Set number of frames to sample. */
> > > +       write(priv, mod->base + AWB_MEAS_FRAMES_REG, cfg->frames);
> > > +
> > > +       if (cfg->mode == RPPX1_WBMEAS_MODE_YCBCR) {
> > > +               write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
> > > +                     cfg->ref_cb_max_b);
> > > +               write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
> > > +                     cfg->ref_cr_max_r);
> > > +               write(priv, mod->base + AWB_MEAS_MAX_Y_REG, cfg->max_y);
> > > +               write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
> > > +                     cfg->min_y_max_g);
> > > +               write(priv, mod->base + AWB_MEAS_MAX_CSUM_REG, cfg->max_csum);
> > > +               write(priv, mod->base + AWB_MEAS_MIN_C_REG, cfg->min_c);
> > > +
> > > +               /*
> > > +                * Program the color conversion matrix coefficients and the
> > > +                * per-color channel offsets.
> > > +                */
> > > +               for (unsigned int i = 0; i < 3; i++) {
> > > +                       for (unsigned int j = 0; j < 3; j++) {
> > > +                               unsigned int index = i * 3 + j;
> > > +
> > > +                               write(priv,
> > > +                                     mod->base + AWB_MEAS_CCOR_COEFF_REG(index),
> > > +                                     cfg->ccor_coeff[i][j]);
> > > +                       }
> > > +               }
> > > +
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG,
> > > +                     cfg->ccor_offs[0]);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG,
> > > +                     cfg->ccor_offs[1]);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG,
> > > +                     cfg->ccor_offs[2]);
> > > +
> > > +               awb_meas_props = cfg->ymax_cmp ? AWB_MEAS_PROP_YMAX : 0;
> > > +       } else {
> > > +               write(priv, mod->base + AWB_MEAS_REF_CB_MAX_B_REG,
> > > +                     cfg->ref_cb_max_b);
> > > +               write(priv, mod->base + AWB_MEAS_REF_CR_MAX_R_REG,
> > > +                     cfg->ref_cr_max_r);
> > > +               write(priv, mod->base + AWB_MEAS_MIN_Y_MAX_G_REG,
> > > +                     cfg->min_y_max_g);
> > > +
> > > +               /* Bypass color conversion matrix and color offsets. */
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(0), 0x1000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(1), 0x0000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(2), 0x0000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(3), 0x0000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(4), 0x1000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(5), 0x0000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(6), 0x0000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(7), 0x0000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_COEFF_REG(8), 0x1000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_R_REG, 0x00000000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_G_REG, 0x00000000);
> > > +               write(priv, mod->base + AWB_MEAS_CCOR_OFFSET_B_REG, 0x00000000);
> > > +
> > > +               awb_meas_props = AWB_MEAS_PROP_MEAS_MODE_RGB;
> > > +       }
> > > +
> > > +       write(priv, mod->base + AWB_MEAS_PROP_REG,
> > > +             awb_meas_props | AWB_MEAS_PROP_AWB_MODE_ON);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int rppx1_wbmeas_fill_stats(struct rpp_module *mod,
> > > +                                  union rppx1_stats_block *block)
> > > +{
> > > +       struct rppx1_wbmeas_stats *stats = &block->wbmeas;
> > > +
> > > +       /* Return measurements at native hardware precision. */
> > > +       stats->cnt = rpp_module_read(mod, AWB_MEAS_WHITE_CNT_REG);
> > > +       stats->mean_y_or_g = rpp_module_read(mod, AWB_MEAS_MEAN_Y_G_REG);
> > > +       stats->mean_cb_or_b = rpp_module_read(mod, AWB_MEAS_MEAN_CB_B_REG);
> > > +       stats->mean_cr_or_r = rpp_module_read(mod, AWB_MEAS_MEAN_CR_R_REG);
> > > +
> > > +       return 0;
> > > +}
> > > +
> > >   const struct rpp_module_ops rppx1_wbmeas_ops = {
> > >          .probe = rppx1_wbmeas_probe,
> > > +       .fill_params = rppx1_wbmeas_fill_params,
> > > +       .fill_stats = rppx1_wbmeas_fill_stats
> > >   };
> > > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > index 26627be6f483..1d76a85164c8 100644
> > > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > > @@ -40,13 +40,81 @@ struct rppx1_window {
> > >    * wider-than-8-bit results.
> > >    */
> > >
> > > +/**
> > > + * enum rppx1_params_block_type - RPP-X1 extensible params block types
> > > + *
> > > + * NOTE: Only append to the enumeration as the numbers are uAPI.
> > > + *
> > > + * @RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST: AWB Measurement Configuration
> > > + */
> > > +enum rppx1_params_block_type {
> > > +       RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> > > +};
> > > +
> > > +/**
> > > + * enum rppx1_wbmeas_mode - AWB measurement mode
> > > + *
> > > + * @RPPX1_WBMEAS_MODE_YCBCR: YCbCr measurement mode
> > > + * @RPPX1_WBMEAS_MODE_RGB: RGB measurement mode
> > > + */
> > > +enum rppx1_wbmeas_mode {
> > > +       RPPX1_WBMEAS_MODE_YCBCR,
> > > +       RPPX1_WBMEAS_MODE_RGB,
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_wbmeas_params - AWB measurement configuration
> > > + *
> > > + * The Auto-White Balance measurement module is available on the MAIN_POST pipe.
> > > + * It supports two measurement modes, selected by the @mode field. The
> > > + * measurement window is programmed through the @wnd field.
> > > + *
> > > + * To support measurement in YCbCr mode a color conversion matrix with
> > > + * programmable offset is available in the @ccor_coeff and @ccor_offs fields.
> > > + * The color conversion matrix coefficients are represented as 16 bits signed
> > > + * Q4.12 numbers ranging from -8 to +7.99. The per-color channel offsets are
> > > + * represented as 25 bits 2's complement integer numbers ranging from -16777216
> > > + * to +16777215.
> > > + *
> > > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST)
> > > + * @mode: measurement mode (from enum rppx1_wbmeas_mode)
> > > + * @ymax_cmp: enable Y_MAX compare using @max_y
> > > + * @wnd: measurement window
> > > + * @frames: number of frames for mean value calculation (0 = 1 frame)
> > > + * @ref_cr_max_r: reference Cr or max red value in RGB mode, 24 bits
> > > + * @ref_cb_max_b: reference Cb or max blue value in RGB mode, 24 bits
> > > + * @min_y_max_g: luminance minimum value or max green value in RGB mode, 24 bits
> > > + * @max_y: luminance maximum value, only valid if @mode is set to YCbCr and
> > > + *        @ymax_cmp is set to enabled, 24 bits
> > > + * @max_csum: chrominance sum maximum value, 24 bits
> > > + * @min_c: chrominance minimum value, 24 bits
> > > + * @ccor_coeff: coefficients for color conversion matrix, signed 16 bits Q4.6
> > > + * @ccor_offs: R-G-B color conversion coefficients, signed 25 bits 2's complement
> > > + */
> > > +struct rppx1_wbmeas_params {
> > > +       struct v4l2_isp_params_block_header header;
> > > +       __u8 mode;
> > > +       __u8 ymax_cmp;
> > > +       struct rppx1_window wnd;
> > > +       __u8 frames;
> > > +       __u32 ref_cr_max_r;
> > > +       __u32 ref_cb_max_b;
> > > +       __u32 min_y_max_g;
> > > +       __u32 max_y;
> > > +       __u32 max_csum;
> > > +       __u32 min_c;
> > > +       __u16 ccor_coeff[3][3];
> > > +       __u32 ccor_offs[3];
> > > +};
> > > +
> > >   /**
> > >    * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> > >    *
> > >    * Some types are reported twice as the same block might be instantiated in
> > >    * multiple pipes.
> > >    */
> > > -#define RPPX1_PARAMS_MAX_SIZE 0
> > > +#define RPPX1_PARAMS_MAX_SIZE                                          \
> > > +       (sizeof(struct rppx1_wbmeas_params))
> > >
> > >   /* ---------------------------------------------------------------------------
> > >    * Statistics Structures
> > > @@ -55,12 +123,41 @@ struct rppx1_window {
> > >    * wider-than-8-bit results.
> > >    */
> > >
> > > +/**
> > > + * enum rppx1_stats_block_type - RPP-X1 extensible stats block types
> > > + *
> > > + * NOTE: Only append to the enumeration as the numbers are uAPI.
> > > + *
> > > + * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
> > > + */
> > > +enum rppx1_stats_block_type {
> > > +       RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
> > > +};
> > > +
> > > +/**
> > > + * struct rppx1_wbmeas_stats - AWB statistics
> > > + *
> > > + * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_WBMEAS)
> > > + * @cnt: Number of pixels matched
> > > + * @mean_y_or_g: mean Y (or G in RGB mode) value, 24-bit
> > > + * @mean_cb_or_b: mean Cb (or B in RGB mode) value, 24-bit
> > > + * @mean_cr_or_r: mean Cr (or R in RGB mode) value, 24-bit
> > > + */
> > > +struct rppx1_wbmeas_stats {
> > > +       struct v4l2_isp_block_header header;
> > > +       __u32 cnt;
> > > +       __u32 mean_y_or_g;
> > > +       __u32 mean_cb_or_b;
> > > +       __u32 mean_cr_or_r;
> > > +};
> > > +
> > >   /**
> > >    * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
> > >    *
> > >    * Some types are reported twice as the same block might be instantiated in
> > >    * multiple pipes.
> > >    */
> > > -#define RPPX1_STATS_MAX_SIZE 0
> > > +#define RPPX1_STATS_MAX_SIZE                                           \
> > > +       (sizeof(struct rppx1_wbmeas_stats))
> > >
> > >   #endif /* __UAPI_RPP_X1_CONFIG_H */
> > > --
> > > 2.54.0
> > >
> > >
> >

-- 
Kind Regards,
Niklas Söderlund

