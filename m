Return-Path: <linux-media+bounces-61821-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0OQFO/XXCGqZ7gMAu9opvQ
	(envelope-from <linux-media+bounces-61821-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:47:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DB1855DBD7
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:47:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EFBD2301324B
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 20:47:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F148035E92B;
	Sat, 16 May 2026 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="JLq/wPHS";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="IfSDd8oM"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8CBD204C3B;
	Sat, 16 May 2026 20:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778964461; cv=none; b=bWamjnMYhHXmM5aQcpEq5yEDjkyCa0fm/pTbl5R8LJLK1DYAhz25G3K6x3VadGPcsEdmmgjTFEIdgpQTtc2SsxG903swSuywPZJ8B7VAe4cqAgyUcHdFdFTUiogUAEbS+DZBsgBpUtAYQBc/N6D6B+hoQjViVToEXMUXzM9GLZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778964461; c=relaxed/simple;
	bh=3zziof4nrFR85m6y+rynue5fLkcnq5VgRpSrsPnmZ4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kIToX8hgprPmF3uvEiptGBgPNcbbBrhxzA13wAa9Ho1WjwyR5EKAd26i/bUdSohCTom1rmX7W4Lf7fzCDCg9rlWqcXvqeiWBiLkeBzuyhNqBHSEnrCwdX+S9qiKOb/H8zdV2xUR2QfZF+yqIccNYw0d59tCs39UhsCqlBau5WzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=JLq/wPHS; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=IfSDd8oM; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C5E131400035;
	Sat, 16 May 2026 16:47:38 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Sat, 16 May 2026 16:47:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778964458;
	 x=1779050858; bh=TQdmOhA1GltBOTCdkunwPlFv+gs3uTfAubtKYAN6cbw=; b=
	JLq/wPHSliDd42jgLKY+0WWzN3x3VRNgImKgFs0mQ+JeqRvTnTf5qSCCY1e9shCO
	kwouM89PTlAdebbN19wu83sKMm6KFB7FYy5DV34FxqWKSYjHqihucLFd43/GSkqW
	1ydyQiydCTwGdeZMVjP3vaBBIoJwI8xPVBs1m6j1sbCZtcwhPl5svhuMA57QG3WD
	dB+3T/v126SHM6bVz1yO4iGJi7vkQz/iuyBm3Rz8oK0AY4zPaDVHc6ftX8R7najH
	fVwWiVr8osNtctg7JFVsZvCnIMQWDPRB6xZH55sB/hLypj9uuo2LEwGD/D8jhY1F
	/pn1SjGdcj+4pLAVZzElvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778964458; x=
	1779050858; bh=TQdmOhA1GltBOTCdkunwPlFv+gs3uTfAubtKYAN6cbw=; b=I
	fSDd8oMvuAnKCOKDXpQ1PW/brJbSGsl/ysGAFWVBXRrdFNEPdA9X6e7C1uLJgP8T
	AIcauA4rQ9vNjKTYpb/xga8YnxvRBZit678SZ9OedWIuTETpCTF6ZqwPuE5mGfEd
	0wK+UHAgMllShEQp5rZe/Fa8tticpWxeDVwfQ1KDGq7V6yny2kTkW8by1sLyb2so
	myyrl7Ghykycn02/fSbeK6l6kWbIIxNdQdNBiKuHw4G9Q+2uXAvidEU1mCTKbQi5
	8YtxaCcCZeqDZQ0gfSE49eqPD7YT4w65iFUVG/E1heaublfTrA9Vr3bAS1gZ2hGH
	zbynT9AzK2jEnryRnnhYQ==
X-ME-Sender: <xms:6tcIanhaTqDyPFDTVGdVuVL33tgfYmYI_ll4jW87gYgSa8qQPMVxug>
    <xme:6tcIagBT_P1IEruUd9TCqS-iSaCp8wr8DsUClrwDKCHVOSuEPt5b_8B4j7lGdE4XB
    arbzkUjm4SV9JjZHXougRk3Yz3NgFGvwHkffW1Wv1WjH2ppiAfS6gA>
X-ME-Received: <xmr:6tcIapSnxN0ACKU12N6rQu0pSjgtSOuUDL2Im9EN5I9ou-IbMQOE_7NyhJXDT5W-mlfjHGRGOpanL2JMgoLHYk2ZcWIhcNp1xMgX>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegvdekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    ekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrod
    hrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghh
    vghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorh
    himhhothhordhggiesrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehlrghurhgvnhht
    rdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplh
    hinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:6tcIalUybiKqmWeAgWefm279jbvNlrsNsyLSWuhYroNCLJoUGtDk_Q>
    <xmx:6tcIaiehnU0OGxo6UyUHMD0qkinUmfYWOu3eLev0PcBysBAYU8O1aQ>
    <xmx:6tcIahJdZxoCJxSjX8L8Q-mGimnzVJz1HDpWCYPfAGukDVD81MjsJg>
    <xmx:6tcIanz8uAWJb__DSBQVo-w2QlbEN5jStf98ghdveoGVmwkUbGdFvQ>
    <xmx:6tcIaj5Fh4WVL5_uWoEHK3SQgWtYZIvX7gc7T3ZqTvwD0vLdzplTJCYI>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 16:47:38 -0400 (EDT)
Date: Sat, 16 May 2026 22:47:36 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v8 12/14] media: rppx1: db: Add support for debayering filters
Message-ID: <20260516204736.GA332351@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-13-niklas.soderlund+renesas@ragnatech.se>
 <aftj3lgMSyVIvFda@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aftj3lgMSyVIvFda@zed>
X-Rspamd-Queue-Id: 8DB1855DBD7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61821-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ragnatech.se:email,ragnatech.se:mid,ragnatech.se:dkim,messagingengine.com:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

On 2026-05-06 17:54:36 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Mon, May 04, 2026 at 03:05:54AM +0200, Niklas Söderlund wrote:
> > Extend the RPPX1 driver to allow setting the debayering filters
> > configuration parameters. It uses the RPPX1 framework for parameters and
> > its writer abstraction to allow the user to control how, and when,
> > configuration is applied to the RPPX1.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > ---
> >  .../platform/dreamchip/rppx1/rpp_module.h     |  2 +
> >  .../platform/dreamchip/rppx1/rpp_params.c     |  7 ++
> >  .../media/platform/dreamchip/rppx1/rppx1_db.c | 82 +++++++++++++++++++
> >  .../uapi/linux/media/dreamchip/rppx1-config.h | 58 ++++++++++++-
> 
> As this block still doesn't have a user in libcamera, but I understand
> there might be value in having the module upstream, what if we
> upstream rppx1_db.c but we don't commit to a uAPI yet ? We can keep
> the types you have defined in the uAPI internal to the driver for now?

I will drop the parameters and uAPI from this series. I will however 
keep the rppx1_db.c file for the probe and verification of the version 
register.

I will do the same for rppx1_bd.c which also don't have a libcamera user 
ATM, only in my test suite.

Once this series is merged we can add this to libcamera and revisit 
these modules here.

> 
> >  4 files changed, 148 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > index 830ef0df7228..064da13082fe 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > @@ -88,6 +88,8 @@ union rppx1_params_block {
> >  	struct rppx1_bls_params bls;
> >  	struct rppx1_lsc_params lsc;
> >  	struct rppx1_awbg_params awbg;
> > +	struct rppx1_db_demosaic_params db_demosaic;
> > +	struct rppx1_db_filter_params db_filter;
> >  	struct rppx1_ccor_params ccor;
> >  	struct rppx1_hist_params hist;
> >  	struct rppx1_exm_params exm;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > index 317ed715f1de..3320ca3998bd 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > @@ -22,6 +22,8 @@ rppx1_ext_params_blocks_info[] = {
> >  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> > +	RPPX1_PARAMS_BLOCK_INFO(DB_DEMOSAIC_POST, db_demosaic),
> > +	RPPX1_PARAMS_BLOCK_INFO(DB_FILTER_POST, db_filter),
> >  	RPPX1_PARAMS_BLOCK_INFO(CCOR_POST, ccor),
> >  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
> >  	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> > @@ -74,6 +76,11 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> >  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
> >  			module = &rpp->pre1.awbg;
> >  			break;
> > +		case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
> > +		case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
> > +			/* Both types handled by the same block. */
> > +			module = &rpp->post.db;
> > +			break;
> >  		case RPPX1_PARAMS_BLOCK_TYPE_CCOR_POST:
> >  			module = &rpp->post.ccor;
> >  			break;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > index 5e233896cfc8..5571b3a9562d 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_db.c
> > @@ -39,6 +39,88 @@ static int rppx1_db_probe(struct rpp_module *mod)
> >  	return 0;
> >  }
> >
> > +static int
> > +rppx1_db_fill_params_demosaic(struct rpp_module *mod,
> > +			      const union rppx1_params_block *block,
> > +			      rppx1_reg_write write, void *priv)
> > +{
> > +	const struct rppx1_db_demosaic_params *cfg = &block->db_demosaic;
> > +
> > +	/* If the modules is disabled, simply bypass it. */
> > +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		write(priv, mod->base + DEMOSAIC_REG, 0x400);
> > +		return 0;
> > +	}
> > +
> > +	/* Native threshold is at RPP 16-bit precision. */
> > +	write(priv, mod->base + DEMOSAIC_REG, cfg->demosaic_th);
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +rppx1_db_fill_params_filter(struct rpp_module *mod,
> > +			    const union rppx1_params_block *block,
> > +			    rppx1_reg_write write, void *priv)
> > +{
> > +	const struct rppx1_db_filter_params *cfg = &block->db_filter;
> > +
> > +	/* If the modules is disabled, simply bypass it. */
> > +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		write(priv, mod->base + FILT_MODE_REG, 0);
> > +		return 0;
> > +	}
> > +
> > +	/* Native values are at RPP 18-bit precision. */
> > +	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl0);
> > +	write(priv, mod->base + FILT_THRESH_BL0_REG, cfg->thresh_bl1);
> > +	write(priv, mod->base + FILT_THRESH_SH0_REG, cfg->thresh_sh0);
> > +	write(priv, mod->base + FILT_THRESH_SH1_REG, cfg->thresh_sh1);
> > +
> > +	/* Native values are at RPP 8-bit precision. */
> > +	write(priv, mod->base + FILT_FAC_BL0_REG, cfg->fac_bl0);
> > +	write(priv, mod->base + FILT_FAC_BL1_REG, cfg->fac_bl1);
> > +	write(priv, mod->base + FILT_FAC_MID_REG, cfg->fac_mid);
> > +	write(priv, mod->base + FILT_FAC_SH0_REG, cfg->fac_sh0);
> > +	write(priv, mod->base + FILT_FAC_SH1_REG, cfg->fac_sh1);
> > +
> > +	/*
> > +	 * The lum_weight field is provided in RPP register format:
> > +	 *
> > +	 * 31		unused
> > +	 * 30:28	lum_weight_gain
> > +	 * 27:24	unused
> > +	 * 23:12	lum_weight_kink
> > +	 * 11:0		lum_weight_min
> > +	 */
> > +	write(priv, mod->base + FILT_LUM_WEIGHT_REG, cfg->lum_weight);
> > +
> > +	write(priv, mod->base + FILT_MODE_REG,
> > +	      (cfg->chr_v_mode << 4) |
> > +	      (cfg->chr_h_mode << 6) |
> > +	      (cfg->grn_stage1 << 8) |
> > +	      (cfg->mode ? FILT_MODE_FILT_MODE : 0) |
> > +	      FILT_MODE_FILT_ENABLE);
> > +
> > +	return 0;
> > +}
> > +
> > +static int
> > +rppx1_db_fill_params(struct rpp_module *mod,
> > +		     const union rppx1_params_block *block,
> > +		     rppx1_reg_write write, void *priv)
> > +{
> > +	switch (block->header.type) {
> > +	case RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST:
> > +		return rppx1_db_fill_params_demosaic(mod, block, write, priv);
> > +	case RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST:
> > +		return rppx1_db_fill_params_filter(mod, block, write, priv);
> > +	}
> > +
> > +	return -EINVAL;
> > +}
> > +
> >  const struct rpp_module_ops rppx1_db_ops = {
> >  	.probe = rppx1_db_probe,
> > +	.fill_params = rppx1_db_fill_params,
> >  };
> > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > index d173c0c1bfc0..378b18dbc48d 100644
> > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > @@ -91,6 +91,8 @@ enum rppx1_meas_chan {
> >   * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
> >   * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
> >   * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
> > + * @RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST: Debayer demosaicing
> > + * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
> >   */
> >  enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> > @@ -109,6 +111,8 @@ enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
> >  	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
> >  	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
> > +	RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST,
> > +	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
> >  };
> >
> >  /**
> > @@ -544,6 +548,56 @@ struct rppx1_ga_params {
> >  	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
> >  };
> >
> > +/**
> > + * struct rppx1_db_demosaic_params - Debayer demosaic configuration
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DB_DEMOSAIC_POST)
> > + * @demosaic_th: threshold for texture detection, 16-bit
> > + */
> > +struct rppx1_db_demosaic_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u16 demosaic_th;
> > +};
> > +
> > +/**
> > + * struct rppx1_db_filter_params - Debayer filter (denoise) configuration
> > + *
> > + * RPP-X1 thresholds are 18-bit and factors are 8-bit.
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST)
> > + * @mode: filter mode
> > + * @grn_stage1: green filter stage 1 select (range 0x0...0x8)
> > + * @chr_h_mode: chroma filter horizontal mode
> > + * @chr_v_mode: chroma filter vertical mode
> > + * @thresh_bl0: If thresh_bl1 < sum_grad < thresh_bl0 then fac_bl0 is selected (blurring th)
> > + * @thresh_bl1: If sum_grad < thresh_bl1 then fac_bl1 is selected (blurring th)
> > + * @thresh_sh0: If thresh_sh0 < sum_grad < thresh_sh1 then thresh_sh0 is selected (sharpening th)
> > + * @thresh_sh1: If thresh_sh1 < sum_grad then thresh_sh1 is selected (sharpening th)
> > + * @lum_weight: luminance weight, min (bits 0:11), kink (bits 12:23), gain (bits 28:30)
> > + * @fac_sh1: filter factor for sharp1 level
> > + * @fac_sh0: filter factor for sharp0 level
> > + * @fac_mid: filter factor for mid level and for static filter mode
> > + * @fac_bl0: filter factor for blur0 level
> > + * @fac_bl1: filter factor for blur1 level (max blur)
> > + */
> > +struct rppx1_db_filter_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u32 mode;
> > +	__u8 grn_stage1;
> > +	__u8 chr_h_mode;
> > +	__u8 chr_v_mode;
> > +	__u32 thresh_bl0;
> > +	__u32 thresh_bl1;
> > +	__u32 thresh_sh0;
> > +	__u32 thresh_sh1;
> > +	__u32 lum_weight;
> > +	__u32 fac_sh1;
> > +	__u32 fac_sh0;
> > +	__u32 fac_mid;
> > +	__u32 fac_bl0;
> > +	__u32 fac_bl1;
> > +};
> > +
> >  /**
> >   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> >   *
> > @@ -566,7 +620,9 @@ struct rppx1_ga_params {
> >  	sizeof(struct rppx1_lsc_params)				+	\
> >  	sizeof(struct rppx1_lsc_params)				+	\
> >  	sizeof(struct rppx1_ga_params)				+	\
> > -	sizeof(struct rppx1_ga_params))
> > +	sizeof(struct rppx1_ga_params)				+	\
> > +	sizeof(struct rppx1_db_demosaic_params)			+	\
> > +	sizeof(struct rppx1_db_filter_params))
> >
> >  /* ---------------------------------------------------------------------------
> >   * Statistics Structures
> > --
> > 2.54.0
> >
> >

-- 
Kind Regards,
Niklas Söderlund

