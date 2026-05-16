Return-Path: <linux-media+bounces-61822-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGoQLxjaCGrU8AMAu9opvQ
	(envelope-from <linux-media+bounces-61822-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:56:56 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B9D55DC05
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 22:56:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 86B1B300B85C
	for <lists+linux-media@lfdr.de>; Sat, 16 May 2026 20:56:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BD29375F8A;
	Sat, 16 May 2026 20:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="uJFcDzlj";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="m2PqLdfi"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D3EF27A916;
	Sat, 16 May 2026 20:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778965008; cv=none; b=YP/BHkRsbBEQBSfYkU/+1AErYvbJZBwhwFKGDCe/YbwMuOew8xXpo+Gt5yT7mKiFio+kxUdnMag75IzfVU0VWlPJ3CCEiAREXpDTF1pQdbJsG2xjeIVRjGJNoESpCwvmN+2cYXcaGAQoKC+0a7X2phUjDgwcYn3iIcSpD78Eadc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778965008; c=relaxed/simple;
	bh=Y/L+WFcxk3d4frYCB22VJMY27akbgyQNks6hbt45v9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ILzBSkDZ1IFnX6HTAcrg/wO5zqO6aeIKNA9fVu4//2u9lGKxGdRWCC0EXQuiy3EZE5dH3jEymLoI7J25UdxV/Q6olZsB2HueajZGrW/HiYhPwdJLDinLklPk7lTQIIj2clwCxhwlrbotHiRewCocdbiuq6ASBXKgKDdHqgpVH10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=uJFcDzlj; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=m2PqLdfi; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 93A13140005F;
	Sat, 16 May 2026 16:56:46 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sat, 16 May 2026 16:56:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1778965006;
	 x=1779051406; bh=iOjVVKoJnXLeDqGCp+qPTBTkxhAqsw4s0Qql+UyFoWo=; b=
	uJFcDzljhrin9IaodnPPe05eRpsi1ymZfVS3EBApPywtIwv/zldLMjltdbwHtuY6
	4jGqIzzHu+EdReVcPTlgrBbULBoMEOz+l09BAiH3E6AkFKdo33fw+uglbkPohZgR
	+pCAx+KXsk3vsPOOtZq2gZa80KuKxR11UZmJ2x6Hp0PjthhDMfch3xq7esCquxPR
	OUrRtXvTDun28klLNKMkxCElkHjYvk3M57XQP8HjEoIc0ld3axhx66mhyrx6J+Ku
	YkS7TEfseqhufMN5I/R7JEgObR7cq1/Yv9N2ftkvEcgDcjlShmPzH41PpmPuZX6Q
	PBsGpi5FcymBVzpEtyfkTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1778965006; x=
	1779051406; bh=iOjVVKoJnXLeDqGCp+qPTBTkxhAqsw4s0Qql+UyFoWo=; b=m
	2PqLdfi4NIkABBUvkEVjFGECoJmHSYYb33MSBJY+f9NQVSqQ9ygHLmluArhxOMcP
	1Xk8k5RLewZoPUohZs3h3L5PCvpg3bSGPftem9Kg6Gim0u8AxV+iJMPb9ilHFiT7
	p5mTxtOacgnYIcqZR3BUSL6fgjwhj52KrKSHAhRyA7bWPVuchc2/XXcyzkvxLCNs
	7Yp3vwkslgG9NjCe3y4ucvZZc+hN2qAHeFB9qwrTOXS6FLYnqinaXMXkydXqqCpC
	T4izaslp0UKjGGPub63/fvMckFroH5+JQdiVy612llyN4TNH3xRuPdvmBXZJO1FW
	rG+tmEJYGrsL3GWHc2xMQ==
X-ME-Sender: <xms:DtoIasYuClhI6eakH_5FZgvZHNbp354tX1mQaj_wSgry1zZKpkyIJg>
    <xme:DtoIan2EhYbawOn9lW3B3bzLlgch8VHT-HXY0cgt2wc1zxAqUYUCEdQQbsTMzVMTY
    NToJuAsICzPmv76bUSF_lyiOuuH-TbbA1JawPugf5n3Rc9JLh6XbAs>
X-ME-Received: <xmr:DtoIanqzJI4j_ZUY0kddmphybQ5T912eDzmUo-b6gPdLYCng0VhvNS1nJjQlbEFw1nOiuavUqGZYoz3RGGzu7xH61fYFmSLTA8Ii>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddufeegfedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefpihhklhgr
    shcuufpnuggvrhhluhhnugcuoehnihhklhgrshdrshhouggvrhhluhhnugdorhgvnhgvsh
    grshesrhgrghhnrghtvggthhdrshgvqeenucggtffrrghtthgvrhhnpeefhfellefhffej
    gfefudfggeejlefhveehieekhfeulefgtdefueehffdtvdelieenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehnihhklhgrshdrshhouggvrhhl
    uhhnugdorhgvnhgvshgrshesrhgrghhnrghtvggthhdrshgvpdhnsggprhgtphhtthhope
    elpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehjrggtohhpohdrmhhonhguihes
    ihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtohepjhgrihdrlhhuthhhrhgrod
    hrvghnvghsrghssehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehmtghh
    vghhrggssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehkuhhnihhnohhrihdrmhhorh
    himhhothhordhggiesrhgvnhgvshgrshdrtghomhdprhgtphhtthhopehlrghurhgvnhht
    rdhpihhntghhrghrthesihguvggrshhonhgsohgrrhgurdgtohhmpdhrtghpthhtoheplh
    hinhhugidqmhgvughirgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhrvghnvghsrghsqdhsohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepjhgrihdrlhhuthhhrhgrsehiuggvrghsohhnsghorghrugdrtghomh
X-ME-Proxy: <xmx:DtoIauPtIzf7qzH8J0cODFC2YCxwTJIRPJzIn48a_5p_EFPdZhUenQ>
    <xmx:DtoIaop08FzbojEPPXVaViP1hs3XASvNLMMs2V2mT8eyX3vsBxUNTQ>
    <xmx:DtoIahucwuYnUVTr-Yk4c4UECH_H9-ZOJ6KEjRk-4T2Q07qj3R0TQQ>
    <xmx:DtoIan2RHsiAwGAc2KX7PHVWiBUsqMAcRXPaj7nCF3UR0QM-RWxH5Q>
    <xmx:DtoIatMIw0WIRewNr27vQhy-XXFfms8kx8zQIjUf_IUmbV4CrrEFUEuZ>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 16 May 2026 16:56:45 -0400 (EDT)
Date: Sat, 16 May 2026 22:56:44 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [v8 14/14] media: rppx1: lin: Add support for gamma sensor
 linearization
Message-ID: <20260516205644.GB332351@ragnatech.se>
References: <20260504010556.2796398-1-niklas.soderlund+renesas@ragnatech.se>
 <20260504010556.2796398-15-niklas.soderlund+renesas@ragnatech.se>
 <aftkY_BuG0E_e0qC@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aftkY_BuG0E_e0qC@zed>
X-Rspamd-Queue-Id: 79B9D55DC05
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm2,messagingengine.com:s=fm3];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61822-lists,linux-media=lfdr.de,renesas];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ideasonboard.com:email]
X-Rspamd-Action: no action

Hello Jacopo,

Thanks for your self-review ;-)

On 2026-05-06 17:57:49 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Mon, May 04, 2026 at 03:05:56AM +0200, Niklas Söderlund wrote:
> > From: Jai Luthra <jai.luthra@ideasonboard.com>
> >
> > Extend the RPPX1 driver to allow setting the gamma sensor linearization
> > configuration parameters. It uses the RPPX1 framework for parameters and
> > its writer abstraction to allow the user to control how, and when,
> > configuration is applied to the RPPX1.
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
> >  .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
> >  .../platform/dreamchip/rppx1/rppx1_lin.c      | 55 +++++++++++++++++++
> >  .../uapi/linux/media/dreamchip/rppx1-config.h | 48 +++++++++++++++-
> >  4 files changed, 108 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > index 136ec4d48054..27235fdfb749 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > @@ -86,6 +86,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> >  union rppx1_params_block {
> >  	struct v4l2_isp_params_block_header header;
> >  	struct rppx1_bls_params bls;
> > +	struct rppx1_lin_params lin;
> >  	struct rppx1_lsc_params lsc;
> >  	struct rppx1_awbg_params awbg;
> >  	struct rppx1_bd_params bd;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > index edea25293d64..1995a80890f4 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > @@ -18,6 +18,8 @@ static const struct v4l2_isp_block_type_info
> >  rppx1_ext_params_blocks_info[] = {
> >  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
> >  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
> > +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
> > +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
> >  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
> >  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> > @@ -72,6 +74,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> >  		case RPPX1_PARAMS_BLOCK_TYPE_BLS_PRE1:
> >  			module = &rpp->pre1.bls;
> >  			break;
> > +		case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
> > +			module = &rpp->pre1.lin;
> > +			break;
> >  		case RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE1:
> >  			module = &rpp->pre1.lsc;
> >  			break;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > index f595f56a292e..cc8efe3b3f2c 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > @@ -24,6 +24,11 @@
> >  #define LIN_B_Y_REG_NUM				17
> >  #define LIN_B_Y_REG(n)				(0x0098 + (4 * (n)))
> >
> > +#define LIN_PRE1_DEGAMMA_CURVE_MASK		GENMASK(23, 0)
> > +#define LIN_PRE1_SAMPLE_POINTS_MASK		GENMASK(3, 0)
> > +#define LIN_PRE2_DEGAMMA_CURVE_MASK		GENMASK(11, 0)
> > +#define LIN_PRE2_SAMPLE_POINTS_MASK		GENMASK(2, 0)
> > +
> >  static int rppx1_lin_probe(struct rpp_module *mod)
> >  {
> >  	/* Version check. */
> > @@ -52,7 +57,57 @@ static int rppx1_lin_start(struct rpp_module *mod,
> >  	return 0;
> >  }
> >
> > +static int rppx1_lin_fill_params(struct rpp_module *mod,
> > +				 const union rppx1_params_block *block,
> > +				 rppx1_reg_write write, void *priv)
> > +{
> > +	const struct rppx1_lin_params *cfg = &block->lin;
> > +	u8 sample_mask;
> > +	u32 mask;
> > +
> > +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		write(priv, mod->base + LIN_ENABLE_REG, 0);
> > +		return 0;
> > +	}
> > +
> > +	switch (cfg->header.type) {
> > +	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1:
> > +		mask = LIN_PRE1_DEGAMMA_CURVE_MASK;
> > +		sample_mask = LIN_PRE1_SAMPLE_POINTS_MASK;
> > +		break;
> > +	case RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2:
> > +		mask = LIN_PRE2_DEGAMMA_CURVE_MASK;
> > +		sample_mask = LIN_PRE2_SAMPLE_POINTS_MASK;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	u32 dx_lo = 0;
> > +	u32 dx_hi = 0;
> 
> I was clearly over-excited by the modernity of C99 that allows mixing
> declarations and code. However this is still a discouraged practice
> unless there are good reasons to do so. Probably in this case there
> aren't enough.

Fixed.

> 
> > +
> > +	for (unsigned int i = 0; i < 8; ++i) {
> > +		dx_lo |= (cfg->dx[i] & sample_mask) << 4 * i;
> > +		dx_hi |= (cfg->dx[i + 8] & sample_mask) << 4 * i;
> > +	}
> > +
> > +	write(priv, mod->base + LIN_DX_LO_REG, dx_lo);
> > +	write(priv, mod->base + LIN_DX_HI_REG, dx_hi);
> > +
> > +	for (unsigned int i = 0; i < RPPX1_LIN_DEGAMMA_CURVE_NUM; i++) {
> > +		write(priv, mod->base + LIN_R_Y_REG(i), cfg->curve_r[i] & mask);
> > +		write(priv, mod->base + LIN_G_Y_REG(i), cfg->curve_g[i] & mask);
> > +		write(priv, mod->base + LIN_B_Y_REG(i), cfg->curve_b[i] & mask);
> > +	}
> > +
> > +	if ((cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_ENABLE))
> > +		write(priv, mod->base + LIN_ENABLE_REG, LIN_ENABLE_GAMMA_IN_EN);
> > +
> > +	return 0;
> > +}
> > +
> >  const struct rpp_module_ops rppx1_lin_ops = {
> >  	.probe = rppx1_lin_probe,
> >  	.start = rppx1_lin_start,
> > +	.fill_params = rppx1_lin_fill_params,
> >  };
> > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > index 0246e9af1d1d..e743e11d11e9 100644
> > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > @@ -95,6 +95,8 @@ enum rppx1_meas_chan {
> >   * @RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST: Debayer filtering
> >   * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1: PRE1 pipe De-noise Pre-Filter
> >   * @RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2: PRE2 pipe De-noise Pre-Filter
> > + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
> > + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
> >   */
> >  enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> > @@ -117,6 +119,8 @@ enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_DB_FILTER_POST,
> >  	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE1,
> >  	RPPX1_PARAMS_BLOCK_TYPE_BD_PRE2,
> > +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
> > +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
> >  };
> >
> >  /**
> > @@ -735,6 +739,46 @@ struct rppx1_bd_params {
> >  	struct rppx1_bd_nll nll;
> >  };
> >
> > +/* Linearization (Sensor De-gamma) */
> > +#define RPPX1_LIN_SAMPLE_POINTS_NUM 16
> > +#define RPPX1_LIN_DEGAMMA_CURVE_NUM 17
> > +
> > +/**
> > + * struct rppx1_lin_params - Linearization (Sensor De-gamma) configuration
> > + *
> > + * The RPP-X1 linearization module is available on the PRE1 and PRE2 pre-fusion
> > + * pipes. Userspace selects which pipe to operate by setting the @header.type
> > + * field to RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
> > + * RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2.
> > + *
> > + * The LIN module applies the per-color channel de-gamma linearization curves
> > + * @curve_r, @curve_g and @curve_b defined on the input sampling points @dx.
> > + *
> > + * For the PRE1 pipe the de-gamma curves values are 24-bits, for the PRE2 pipe
> > + * the de-gamma curve values are 12-bits.
> > + *
> > + * For the PRE1 pipe de-gamma module sampling points @dx values are in the range
> > + * [0, 15] (4 bits). For the PRE2 pipe de-gamma module sampling points values
> > + * are in the range [0, 7] (3 bits).
> > + *
> > + * Userspace is expected to provide the curve values and sampling points with a
> > + * bit-depth matching the one of pipe in use.
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1 or
> > + *	    RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2)
> > + * @curve_r: de-gamma linearization curve for red channel
> > + * @curve_g: de-gamma linearization curve for green channel
> > + * @curve_b: de-gamma linearization curve for blue channel
> > + * @dx: input sampling points
> > + */
> > +struct rppx1_lin_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u32 curve_r[RPPX1_LIN_DEGAMMA_CURVE_NUM];
> > +	__u32 curve_g[RPPX1_LIN_DEGAMMA_CURVE_NUM];
> > +	__u32 curve_b[RPPX1_LIN_DEGAMMA_CURVE_NUM];
> > +	__u8 dx[RPPX1_LIN_SAMPLE_POINTS_NUM];
> > +};
> > +
> >  /**
> >   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> >   *
> > @@ -761,7 +805,9 @@ struct rppx1_bd_params {
> >  	sizeof(struct rppx1_db_demosaic_params)			+	\
> >  	sizeof(struct rppx1_db_filter_params)			+	\
> >  	sizeof(struct rppx1_bd_params)				+	\
> > -	sizeof(struct rppx1_bd_params))
> > +	sizeof(struct rppx1_bd_params)				+	\
> > +	sizeof(struct rppx1_lin_params)				+	\
> > +	sizeof(struct rppx1_lin_params))
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

