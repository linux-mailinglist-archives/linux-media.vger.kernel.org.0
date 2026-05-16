Return-Path: <linux-media+bounces-61819-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EevDSjUCGqx7AMAu9opvQ
	(envelope-from <linux-media+bounces-61819-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:31:36 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 896B655DAE9
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A14B530107FA
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 20:31:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 430433644CF;
	Sat, 16 May 2026 20:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="QIQBrmCw";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="EpjI0NoB"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F3C2EA749;
	Sat, 16 May 2026 20:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778963482; cv=none; b=JP/+ufknbLY71k7e1JnbLmWH3KsBd27eQ91xG7gY6W6diAKlvbv9KGClpfS766GreEykfEBggi1GGR1LaTRHRvRILVnSf8TN6EmB4eZ2+QtS1mdI/nWzufubcw1JEUzBbA2KI1pQ48eePSzVfMxB1aUZvK92OlJ5qtUDsW9T/us=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778963482; c=relaxed/simple;
	bh=qn3pyHzEJlrl2FQcNTfsZD5cd+EWps1hQUNaWsbdtF0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H5hFKzJ7k0tUAq+OQ6c5KoqPmJ88GHqZj1VSqmL4XFQ92X9imEi4nU6BJMxeQXNAbQYbl1hWAIY1Xjy3LuVrvCIG95RpgI4hxDgDf6eSRWJJwEnPipgNdR3u6vBlgjTpUnM/HGMre9mPrYJJF+wYjNCvoFOqYQG/dMo1rqlb9Eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=QIQBrmCw; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=EpjI0NoB; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7879914000F0;
	Sat, 16 May 2026 16:31:19 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Sat, 16 May 2026 16:31:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778963479;
	 x=1779049879; bh=UEo0g3+FIkXYJVbiEv1/DeU+VVjJG4Uxd0I1yWutuJg=; b=
	QIQBrmCwgR5/VPcE7Bz54d4sY/uA/SRX3xienhlM6HT6yiF04BDp2cFJ8yPiDFSW
	uMbPn2ehAXUXh1MnpyoNJD+YHv2WoxZ7+25MIeo1piSo4feTM/yKOOmIVVsBwvv1
	cCbY1ltUXtEoFry/YJMSLVYQBqDAw5/TejCNKE+RgVYCaKrZ6WXA11bXrA83QUOW
	EMVPrqOLG0CnBlxGSvFlj7iQuOp7/vYPS8EBI/1DZ9VEPMogdVKjH6E+eG8pUKVf
	b8gXKOH6tfuCChkAGR3aBMF5De6G5Oj6aBWZhTeE1yJS0w/3gib13g37VDNpHFmm
	HpXgmJdPcxd55nwQue5Z2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778963479; x=
	1779049879; bh=UEo0g3+FIkXYJVbiEv1/DeU+VVjJG4Uxd0I1yWutuJg=; b=E
	pjI0NoBqUVoFZwqJGXxWol7ZGgzEirfXYEa3u7F/fEsGmAnZNByEdcqGNjZsfoXU
	2svGMPhMOGnkP9R/YMvidz5D33uPhu3Pk5HIClccnYa1+TRPkLX/4hdboSsmhx0W
	A5Ak4xEy2qPJLKPZFf33S911oK43DvMiU4fbaGJNxQZqhqpQ6yjPS7Uf4LkWio59
	7NV4lgAJE/PBXHwE23awt09YO+devmYXZ4pt7QIYyB6Ygic3YIyijIkKa/kr+sJO
	54POx8SD8WRR0CelzQXcy8ZZzCY+81ru6dkUQH88ciGc5dZK389kPR4SR2s/p72q
	4KUuO5v/trRuTb4/TrhIQ==
X-ME-Sender: <xms:F9QIakI4e764PtluSeh3zzwXZ6vNzKBY151us5ioctOOVBWZ8Yl99Q>
    <xme:F9QIagI-ksgsazEz6m2TWNnZzmdyizO6JxenDjjgv9d6pM-oI643j6zxMFa9zZ0v8
    ivX1pcBorJYy1jW0gkg-vEW2_97jrtHhcY0LUKWHTltCi_L7JQKkYM>
X-ME-Received: <xmr:F9QIam6DlTIoZwO49AtKuOt3OcR4j6OcM1_fZl_5FxtY819xOS0_7KSGyF4s0pAt7MkVs-RLXBj4Z8q2OJ44dzO2msX-RDDDohFh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegvdehucetufdoteggodetrf
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
X-ME-Proxy: <xmx:F9QIaieq2Z3sLHe6OkhFw5r1MTW5spfvWDHWTTnbXSJPu_VA8ig6uA>
    <xmx:F9QIapFRnvk0nyaQyXlpbHDi-FVHbfwPB4aUrcZnsP-Hfc1hHJ1Viw>
    <xmx:F9QIajS26YLnrtpVvron_Z4pJZE9kMVQ3FfEAO8ViXc_WjQ036rhiQ>
    <xmx:F9QIavZ7pUjT22zKBuABODlF3NAACUuWG9whO1ZuTA60U_tb1ObApw>
    <xmx:F9QIamh0DJYebMEKcKxc9peYZ2dofXAS5x18EaineMeh4S_bn7asgbFr>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 16:31:18 -0400 (EDT)
Date: Sat, 16 May 2026 22:31:16 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [v8 07/14] media: rppx1: hist: Add support histogram measurement
Message-ID: <20260516203116.GY332351@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-8-niklas.soderlund+renesas@ragnatech.se>
 <afti_-asx3ssZLuN@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afti_-asx3ssZLuN@zed>
X-Rspamd-Queue-Id: 896B655DAE9
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
	TAGGED_FROM(0.00)[bounces-61819-lists,linux-media=lfdr.de,renesas];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

Hello Jacopo,

Thanks for your comments.

On 2026-05-06 17:51:30 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Mon, May 04, 2026 at 03:05:49AM +0200, Niklas Söderlund wrote:
> > Extend the RPPX1 driver to allow setting the histogram measurement
> > configuration and consuming the resulting statistics. It uses the RPPX1
> > framework for parameters and its writer abstraction to allow the user to
> > control how, and when, configuration is applied to the RPPX1.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > ---
> >  .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
> >  .../platform/dreamchip/rppx1/rpp_params.c     |   6 +
> >  .../platform/dreamchip/rppx1/rpp_stats.c      |  10 ++
> >  .../platform/dreamchip/rppx1/rppx1_hist.c     | 115 +++++++++++++++++-
> >  .../uapi/linux/media/dreamchip/rppx1-config.h | 115 +++++++++++++++++-
> >  5 files changed, 245 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > index 2dc9e54027e1..5725243d0119 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > @@ -86,12 +86,14 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> >  union rppx1_params_block {
> >  	struct v4l2_isp_params_block_header header;
> >  	struct rppx1_awbg_params awbg;
> > +	struct rppx1_hist_params hist;
> >  	struct rppx1_exm_params exm;
> >  	struct rppx1_wbmeas_params wbmeas;
> >  };
> >
> >  union rppx1_stats_block {
> >  	struct v4l2_isp_params_block_header header;
> > +	struct rppx1_hist_stats hist;
> >  	struct rppx1_exm_stats exm;
> >  	struct rppx1_wbmeas_stats wbmeas;
> >  };
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > index 23094e8ce3a7..6472bec6fba3 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > @@ -18,6 +18,9 @@ static const struct v4l2_isp_block_type_info
> >  rppx1_ext_params_blocks_info[] = {
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> > +	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE1, hist),
> > +	RPPX1_PARAMS_BLOCK_INFO(HIST_PRE2, hist),
> > +	RPPX1_PARAMS_BLOCK_INFO(HIST_POST, hist),
> >  	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
> >  	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
> >  	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> > @@ -58,6 +61,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> >  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
> >  			module = &rpp->pre1.awbg;
> >  			break;
> > +		case RPPX1_PARAMS_BLOCK_TYPE_HIST_POST:
> > +			module = &rpp->post.hist;
> > +			break;
> >  		case RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1:
> >  			module = &rpp->pre1.exm;
> >  			break;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > index 0fddf50f7222..b265e858cfd1 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > @@ -16,6 +16,7 @@
> >
> >  static const struct v4l2_isp_block_type_info
> >  rppx1_stats_blocks_info[] = {
> > +	RPPX1_STATS_BLOCK_INFO(HIST_POST, hist),
> >  	RPPX1_STATS_BLOCK_INFO(EXM_PRE1, exm),
> >  	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> >  };
> > @@ -34,6 +35,15 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
> >
> >  	v4l2_isp_stats_init_buffer(stats);
> >
> > +	if (isc & RPPX1_IRQ_ID_POST_HIST_MEAS) {
> > +		block = rppx1_init_stats_block(rpp, stats,
> > +					       RPPX1_STATS_BLOCK_TYPE_HIST_POST);
> > +		if (!block)
> > +			return;
> > +
> > +		rpp_module_call(&rpp->post.hist, fill_stats, block);
> > +	}
> > +
> >  	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
> >  		block = rppx1_init_stats_block(rpp, stats,
> >  					       RPPX1_STATS_BLOCK_TYPE_EXM_PRE1);
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> > index cab498ece5a8..99044dc6c115 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_hist.c
> > @@ -25,6 +25,9 @@
> >
> >  #define HIST_LAST_MEAS_LINE_REG			0x0010
> >  #define HIST_SUBSAMPLING_REG			0x0014
> > +#define HIST_SUBSAMPLING_V_STEPSIZE(x)		(((x) & 0x7f) << 24)
> > +#define HIST_SUBSAMPLING_H_STEP_INC(x)		(((x) & 0x1ffff))
> > +
> >  #define HIST_COEFF_R_REG			0x0018
> >  #define HIST_COEFF_G_REG			0x001c
> >  #define HIST_COEFF_B_REG			0x0020
> > @@ -48,7 +51,6 @@
> >  #define HIST_FORCED_UPDATE_REG			0x0058
> >  #define HIST_VSTART_STATUS_REG			0x005c
> >
> > -#define HIST_BIN_REG_NUM			32
> >  #define HIST_BIN_REG(n)				(0x0060 + (4 * (n)))
> >
> >  static int rppx1_hist_probe(struct rpp_module *mod)
> > @@ -71,6 +73,117 @@ static int rppx1_hist_probe(struct rpp_module *mod)
> >  	return 0;
> >  }
> >
> > +#define RPPX1_HIST_WEIGHT(v0, v1, v2, v3) \
> > +	(((v0) & 0x1f) | (((v1) & 0x1f) << 8)  | \
> > +	(((v2) & 0x1f) << 16) | \
> > +	(((v3) & 0x1f) << 24))
> > +
> > +static int rppx1_hist_fill_params(struct rpp_module *mod,
> > +				  const union rppx1_params_block *block,
> > +				  rppx1_reg_write write, void *priv)
> > +{
> > +	const struct rppx1_hist_params *cfg = &block->hist;
> > +	u32 h_offs, v_offs, h_size, v_size;
> > +
> > +	/* If the modules is disabled, simply bypass it. */
> > +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		write(priv, mod->base + HIST_MODE_REG,
> > +		      HIST_MODE_HIST_MODE_DISABLE);
> > +		return 0;
> > +	}
> > +
> > +	/* Select sample point */
> > +	write(priv, mod->base + HIST_CHANNEL_SEL_REG,
> > +	      cfg->channel_sel & HIST_CHANNEL_SEL_CHANNEL_SELECT_MASK);
> > +
> > +	/*
> > +	 * Configure the input subsampling.
> > +	 *
> > +	 * v_stepsize controls which lines are processed. In Bayer mode the
> > +	 * effective value is double to account for the 2x2 macro-pixel size.
> > +	 *
> > +	 * h_step_inc is the horizontal pixel increment counter. The subsampling
> > +	 * counter is incremented by h_step_inc. When the result of the
> > +	 * increment overflows 2^16 a sampling is performed. In Bayer mode the
> > +	 * subsampling counter is only incremented for color channels selected
> > +	 * by hist_mode.
> > +	 */
> > +	write(priv, mod->base + HIST_SUBSAMPLING_REG,
> > +	      HIST_SUBSAMPLING_V_STEPSIZE(cfg->v_stepsize) |
> > +	      HIST_SUBSAMPLING_H_STEP_INC(cfg->h_step_inc));
> > +
> > +	/*
> > +	 * Adjust and set measurement window to hardware limitations,
> > +	 * - Offsets must be even.
> > +	 * - Width and height must be divisible by 10.
> > +	 */
> > +	h_offs = cfg->wnd.h_offs & 0x1ffe;
> > +	v_offs = cfg->wnd.v_offs & 0x1ffe;
> > +	h_size = cfg->wnd.h_size - cfg->wnd.h_size % 10;
> > +	v_size = cfg->wnd.v_size - cfg->wnd.v_size % 10;
> 
> I didn't modify this, but I might have missed where the divisible by
> 10 comes from (even and divisile by 5 maybe ?)

Yes, to make the window even divisile by 5.

> 
> > +
> > +	write(priv, mod->base + HIST_H_OFFS_REG, h_offs);
> > +	write(priv, mod->base + HIST_V_OFFS_REG, v_offs);
> > +	write(priv, mod->base + HIST_H_SIZE_REG, h_size / 5);
> > +	write(priv, mod->base + HIST_V_SIZE_REG, v_size / 5);
> 
> We discussed with Jai if it was better to ask userspace to provide the
> size of one window, or provide instead the size of the whole area to
> cover and divide in the driver. I think your opinion is clear from the
> above /5 but I just want to re-check.

Indeed. To me it's much clear that the window filed int the 
configuration covers the window you want to measure. Having it describe 
just one slice is IMHO confusing as it suggests you could have more 
slices that are disjointed.

> 
> > +
> > +	/*
> > +	 * Set last measurement line for ready interrupt. Ignore the value
> > +	 * from the parameters as it is only useful for fast-channel switching.
> > +	 */
> > +	write(priv, mod->base + HIST_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
> > +
> > +	/* Set measurement window weights. */
> > +	write(priv, mod->base + HIST_WEIGHT_00TO30_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[0], cfg->weights[1],
> > +				cfg->weights[2], cfg->weights[3]));
> > +	write(priv, mod->base + HIST_WEIGHT_40TO21_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[4], cfg->weights[5],
> > +				cfg->weights[6], cfg->weights[7]));
> > +	write(priv, mod->base + HIST_WEIGHT_31TO12_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[8], cfg->weights[9],
> > +				cfg->weights[10], cfg->weights[11]));
> > +	write(priv, mod->base + HIST_WEIGHT_22TO03_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[12], cfg->weights[13],
> > +				cfg->weights[14], cfg->weights[15]));
> > +	write(priv, mod->base + HIST_WEIGHT_13TO43_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[16], cfg->weights[17],
> > +				cfg->weights[18], cfg->weights[19]));
> > +	write(priv, mod->base + HIST_WEIGHT_04TO34_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[20], cfg->weights[21],
> > +				cfg->weights[22], cfg->weights[23]));
> > +	write(priv, mod->base + HIST_WEIGHT_44_REG,
> > +	      RPPX1_HIST_WEIGHT(cfg->weights[24], 0, 0, 0));
> > +
> > +	write(priv, mod->base + HIST_MODE_REG, cfg->mode);
> > +	write(priv, mod->base + HIST_COEFF_R_REG, cfg->coeff[0]);
> > +	write(priv, mod->base + HIST_COEFF_G_REG, cfg->coeff[1]);
> > +	write(priv, mod->base + HIST_COEFF_B_REG, cfg->coeff[2]);
> > +
> > +	u32 sample_reg = FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_SHIFT_MASK,
> > +				    cfg->sample_shift) |
> > +			 FIELD_PREP(HIST_SAMPLE_RANGE_SAMPLE_OFFSET_MASK,
> > +				    cfg->sample_offs);
> > +	write(priv, mod->base + HIST_SAMPLE_RANGE_REG, sample_reg);
> > +
> > +	write(priv, mod->base + HIST_FORCED_UPDATE_REG, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rppx1_hist_fill_stats(struct rpp_module *mod,
> > +				 union rppx1_stats_block *block)
> > +{
> > +	struct rppx1_hist_stats *stats = &block->hist;
> > +
> > +	for (unsigned int i = 0; i < RPPX1_HIST_NUM_BINS; i++)
> > +		stats->hist_bins[i] = rpp_module_read(mod, HIST_BIN_REG(i)) & 0xfffff;
> > +
> > +	return 0;
> > +}
> > +
> >  const struct rpp_module_ops rppx1_hist_ops = {
> >  	.probe = rppx1_hist_probe,
> > +	.fill_params = rppx1_hist_fill_params,
> > +	.fill_stats = rppx1_hist_fill_stats,
> >  };
> > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > index 18e718d43f80..909a10935772 100644
> > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > @@ -81,6 +81,9 @@ enum rppx1_meas_chan {
> >   * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
> >   * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1: PRE1 pipe Exposure Measurement
> >   * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2: PRE2 pipe Exposure Measurement
> > + * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1: PRE1 pipe Histogram Measurement
> > + * @RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2: PRE2 pipe Histogram Measurement
> > + * @RPPX1_PARAMS_BLOCK_TYPE_HIST_POST: POST pipe Histogram Measurement
> >   */
> >  enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> > @@ -89,6 +92,9 @@ enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
> >  	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1,
> >  	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2,
> > +	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
> > +	RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2,
> > +	RPPX1_PARAMS_BLOCK_TYPE_HIST_POST,
> >  };
> >
> >  /**
> > @@ -234,6 +240,85 @@ struct rppx1_exm_params {
> >  	__u8 coeff_gb;
> >  };
> >
> > +/* Histogram */
> > +#define RPPX1_HIST_WEIGHT_GRIDS_SIZE 25
> > +
> > +/**
> > + * enum rppx1_hist_mode - Histogram measurement mode
> > + *
> > + * Histogram measurement mode. Select which channel or combination of channels
> > + * the histogram measurement is performed on.
> > + *
> > + * @RPPX1_HIST_MODE_DISABLE: histogram disabled
> > + * @RPPX1_HIST_MODE_RGB_COMBINED: combined RGB histogram
> > + * @RPPX1_HIST_MODE_R_HISTOGRAM: red channel histogram
> > + * @RPPX1_HIST_MODE_GR_HISTOGRAM: green/red channel histogram
> > + * @RPPX1_HIST_MODE_B_HISTOGRAM: blue channel histogram
> > + * @RPPX1_HIST_MODE_GB_HISTOGRAM: green/blue histogram
> > + */
> > +enum rppx1_hist_mode {
> > +	RPPX1_HIST_MODE_DISABLE,
> > +	RPPX1_HIST_MODE_RGB_COMBINED,
> > +	RPPX1_HIST_MODE_R_HISTOGRAM,
> > +	RPPX1_HIST_MODE_GR_HISTOGRAM,
> > +	RPPX1_HIST_MODE_B_HISTOGRAM,
> > +	RPPX1_HIST_MODE_GB_HISTOGRAM,
> > +};
> > +
> > +/**
> > + * struct rppx1_hist_params - Histogram measurement configuration
> > + *
> > + * The RPP-X1 Histogram measurement unit is available on the PRE1, PRE2 and
> > + * MAIN_POST pipes. Userspace selects which pipe to operate by setting the
> > + * @header.type field to RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
> > + * RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2 or
> > + * RPPX1_PARAMS_BLOCK_TYPE_HIST_POST.
> > + *
> > + * The histogram measurement point is selected using the @channel field while
> > + * histogram measurement mode is selected using the @mode field.
> > + *
> > + * Histogram measurement is performed by programming subsampling factors using
> > + * the @v_stepsize and @h_step_inc fields and by weighted windowing, by
> > + * programming the size of the measurement window @wnd with @weights associated
> > + * to each cell of the 5x5 measurement grid. Weights are represented as 5 bits
> > + * integer values ranging from 0 to 16.
> > + *
> > + * The @last_line fields controls when the histogram measurement completes. It
> > + * is usually programmed to the value of (@wnd.v_offs + @wnd.v_size - 1).
> > + *
> > + * Histogram values are calculated by applying a per-color channel coefficient
> > + * represented as an 8 bits unsigned Q1.7 integer value. The @sample_offs and
> > + * @sample_shift fields allow to reduce the color dynamic range on which
> > + * histogram data are produced.
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE1,
> > + *	    type = RPPX1_PARAMS_BLOCK_TYPE_HIST_PRE2 or
> > + *	    type = RPPX1_PARAMS_BLOCK_TYPE_HIST_POST)
> > + * @mode: histogram measurement mode (from enum rppx1_hist_mode)
> > + * @channel_sel: histogram measurement point (see enum rppx1_meas_chan)
> > + * @wnd: measurement window coordinates
> > + * @weights: weighting factors for each sub-window (5x5 grid)
> > + * @last_line: line number for which the histogram measurement completes
> > + * @v_stepsize: vertical subsampling divider, 7 bits
> > + * @h_step_inc: horizontal subsampling step counter, 17 bits
> > + * @coeff: R-G-B coefficients, 8 bits unsigned Q1.7
> > + * @sample_offs: sample offset, 24 bits
> > + * @sample_shift: sample shift, 4 bits
> > + */
> > +struct rppx1_hist_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u8 mode;
> > +	__u8 channel_sel;
> > +	struct rppx1_window wnd;
> > +	__u8 weights[RPPX1_HIST_WEIGHT_GRIDS_SIZE];
> > +	__u32 last_line;
> > +	__u32 v_stepsize;
> > +	__u32 h_step_inc;
> > +	__u8 coeff[3];
> > +	__u32 sample_offs;
> > +	__u8 sample_shift;
> > +};
> > +
> >  /**
> >   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> >   *
> > @@ -246,7 +331,10 @@ struct rppx1_exm_params {
> >  	sizeof(struct rppx1_awbg_params)			+	\
> >  	sizeof(struct rppx1_awbg_params)			+	\
> >  	sizeof(struct rppx1_exm_params)				+	\
> > -	sizeof(struct rppx1_exm_params))
> > +	sizeof(struct rppx1_exm_params)				+	\
> > +	sizeof(struct rppx1_hist_params)			+	\
> > +	sizeof(struct rppx1_hist_params)			+	\
> > +	sizeof(struct rppx1_hist_params))
> >
> >  /* ---------------------------------------------------------------------------
> >   * Statistics Structures
> > @@ -263,11 +351,17 @@ struct rppx1_exm_params {
> >   * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
> >   * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE1: pre-fusion pipe1 exposure measurement
> >   * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE2: pre-fusion pipe2 exposure measurement
> > + * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE1: pre-fusion pipe1 histogram
> > + * @RPPX1_STATS_BLOCK_TYPE_HIST_PRE2: pre-fusion pipe2 histogram
> > + * @RPPX1_STATS_BLOCK_TYPE_HIST_POST: post-fusion histogram
> >   */
> >  enum rppx1_stats_block_type {
> >  	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
> >  	RPPX1_STATS_BLOCK_TYPE_EXM_PRE1,
> >  	RPPX1_STATS_BLOCK_TYPE_EXM_PRE2,
> > +	RPPX1_STATS_BLOCK_TYPE_HIST_PRE1,
> > +	RPPX1_STATS_BLOCK_TYPE_HIST_PRE2,
> > +	RPPX1_STATS_BLOCK_TYPE_HIST_POST,
> >  };
> >
> >  /**
> > @@ -304,6 +398,20 @@ struct rppx1_exm_stats {
> >  	__u32 exp_mean[RPPX1_EXM_NUM_WIN];
> >  };
> >
> > +/* Histogram */
> > +#define RPPX1_HIST_NUM_BINS 32
> > +
> > +/**
> > + * struct rppx1_hist_stats - Histogram statistics
> > + *
> > + * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_HIST_POST)
> > + * @hist_bins: accumulation histogram results in unsigned 20-bit Q16.4 format
> > + */
> > +struct rppx1_hist_stats {
> > +	struct v4l2_isp_block_header header;
> > +	__u32 hist_bins[RPPX1_HIST_NUM_BINS];
> > +};
> > +
> >  /**
> >   * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
> >   *
> > @@ -313,6 +421,9 @@ struct rppx1_exm_stats {
> >  #define RPPX1_STATS_MAX_SIZE						\
> >  	(sizeof(struct rppx1_wbmeas_stats)			+	\
> >  	sizeof(struct rppx1_exm_stats)				+	\
> > -	sizeof(struct rppx1_exm_stats))
> > +	sizeof(struct rppx1_exm_stats)				+	\
> > +	sizeof(struct rppx1_hist_stats)				+	\
> > +	sizeof(struct rppx1_hist_stats)				+	\
> > +	sizeof(struct rppx1_hist_stats))
> >
> >  #endif /* __UAPI_RPP_X1_CONFIG_H */
> > --
> > 2.54.0
> >
> >

-- 
Kind Regards,
Niklas Söderlund

