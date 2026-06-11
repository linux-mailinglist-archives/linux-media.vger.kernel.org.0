Return-Path: <linux-media+bounces-64586-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id VPpWKQqoKmr2uQMAu9opvQ
	(envelope-from <linux-media+bounces-64586-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:20:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1767C671C36
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:20:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=hBpoBztB;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="K W46HJh";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64586-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64586-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 63F98308291B
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:19:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 166E93F23D1;
	Thu, 11 Jun 2026 12:19:35 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48493EFD25;
	Thu, 11 Jun 2026 12:19:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781180374; cv=none; b=MSC5IHei7hxJwYdCr0sMeIFe8XbVpd0zYTw9tDfmFG6VeArytLDtATyhwL29G/pdZInT+bGakmaIdl22disCrVXGePQyXo2AH9TUdyfTf07GB8P+d8lpyhNufpyW0b74aRtEuykD13aaqDh/oftvPGh8AWLrcS3sIvfEF6uRPDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781180374; c=relaxed/simple;
	bh=V1i2h28k6lm64ptRmcz/hJmbzW23W0ANUUCXBTPYoW8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2AuX1rUFFor4Rmnr2nP6qcmOaZCDWrFN6NQ2wVcZESf1aeWiwIVqagkOVbXjrEf+pTDl0lCkls1Ghs1Zu412uyCtZWMu1DC68xqYPgusL/ArplHyH/BTJGvNC8iC30almcsEDDQ1IuO4n5aUioVgOiHMQ/f6PJ0uc2FdLp8jEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=hBpoBztB; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=KW46HJhk; arc=none smtp.client-ip=103.168.172.156
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 2350014000F0;
	Thu, 11 Jun 2026 08:19:32 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 08:19:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781180372;
	 x=1781266772; bh=22yj4PfGuCcNMjL+aV6XkFjLvwvmE0PkJSmfoJfcnhk=; b=
	hBpoBztB66Drh6sgPgOx5Go29XE+/mPO5/T/mZHN8WTA7QPfI8LUTAT18v2qUFik
	fxE6yyiGebvTE2n0vMTW+5jeMVY5sqFnluKzHd2quQ1EF/3XY2dXN//Ulgxv2h3s
	gBD7SQgRiJyGnrYNmp+pWoYCRyMwu1v5kF8C6OxXrCSjZgvPrymnD/ecHj6C2DQ9
	otTVf2wjnWrXAIyfqd51Tm6aScF7AKax67AUGfdGLz3XVNROvmcrhz4O1EzJUXXL
	xgnI8qEua/YpKG3+BZoBo29mY/e1TzG/RJNUZ4W0A3ogAmMZsG9I6vHFXGA457A4
	QCmkhdUhhZfOFcGhPS+MUg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781180372; x=
	1781266772; bh=22yj4PfGuCcNMjL+aV6XkFjLvwvmE0PkJSmfoJfcnhk=; b=K
	W46HJhkS9HRJmQxsbvGcwYN7B/8sOxr34LG+j/Ce8VJg2e0IQHLn8LVYd689HmIe
	9n91gNnFym1t2Z+7akRGVpPoXbFhI2inL4FSVUlAxVnW+F9SUzUqyyjoYgsXJH0c
	/yQ8sATPO9lyKjSrbIorK/h0OZ6jUn40VLCkEfXFJuLT6edq4EeTzJieAlcejh3T
	xEU9mYGYw01OQwo67LtFSbIIRZgSTBSAdGh5jKMfD1XfX/PphpfIp+4ijWnbOqke
	DloPULkNfO9mryBCea/J3adgaUT9a9gT8KPOXRJ92DYhYuomqQ/lvt8UescWk272
	De6tjS/NrSdsRSglO2nrw==
X-ME-Sender: <xms:06cqagzkPhRgnZ7_oFDkNY1RG2kZ6ZlFU2nHFQXiThacLHBQwvIQVA>
    <xme:06cqakuXW9QXCNcxPLIvbqGZ5xo9fQNC6R_uPr_o-T4NwxndxyZBDa9zg79ilz3M5
    tJprQKphZKcUm27kU-sbzAl3JZU1uBWO_rAxYJzVup4mWtmcNBnDTc>
X-ME-Received: <xmr:06cqajDJFwHvWa8jlqXurlAH_2FDzm1aLGHMBlqQI9cc60YIBc1vnZT22fPc0s1pLSr1RxmCG9KpLbZAqtzLcV4gns6j>
X-ME-Proxy-Cause: dmFkZTF87SjCUZla0tR2Vxy7h9VdM3N5mV+MbCOIMB1qKtSXc9iGW5kncg/+Pw9eNbmJrC
    Ot+rEtdxP3gbOvhislhgwdl9p7RrIyujvw0wfsKImNN+gVVHeepql+q2gqugjGHica4toh
    wNY9EDI4vcjnNJ5lqK6RvVrMb266Xvy7qZ9TPLpDZBhHUqvm2rfspu/hI8zknithT9euV6
    bdetPIM017OVeTzio+gJwgFngjLzO5T3uV7+fwYAdm9ch7GR1FhkaiKREatNWKgMZ8lEsP
    n69bLPU7yWLsQj/+2/kZZDPGV68x5EpMAx3XmCEcOBZUssp+FdE1UbKtUU4GR8otRf/wo/
    kzgcZOom4x+9N75Nixh0ghhxkkjYtE0/BNFtP2VEk9us4Yh4JgojqWXosawi7rVzPeiGza
    l5a1GL4bLC4Mi6AqdCDo15Ihu3IsbTniefTmLeD5ScU2yvFnbv/QFzIjQBIxwAc0QqJ2IH
    Tc/cHP79FEf3Bpa7J4nP0751E5fgRx66kiqhEJmtHLO5b6RsxsCPz0r8Gaai/69W2SMVJK
    wVnFy2M6xrr+m4nXP8DddJxnxIVigUS7ROhCJol7MqplT9jCB622OUKPoUZeTVg1goLhGw
    WeSuOvGUI5smxUEYsbcMmchygqFhZW9VmNeVYnsFEu9BULBm7jUhycZvVuFg
X-ME-Proxy: <xmx:06cqamGw7WVNQAJqkBQ44VtamB0oA3lrLtI3LGB22tbtMdkQ6SzAOw>
    <xmx:06cqajB4vR2DtDU0TJIv8E0Tci5t58K-4XmGTm03X-Fcgf8bkN8d3Q>
    <xmx:06cqaslNXICuLDyacOD_PLw6gNXN_EFetUhdyY2BKByOQhl6gxangg>
    <xmx:06cqapOMmfQINOT65hljZV4C0no7pXyKcVd8if6bMdg_m39g2gqjAw>
    <xmx:1KcqasFIXhUCy9zW1Eohr_-pzruOxF0VRnDn7eN1UoSec-iNdrVh8j_k>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 08:19:31 -0400 (EDT)
Date: Thu, 11 Jun 2026 14:19:30 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v9 13/13] media: rppx1: lin: Add support for gamma sensor
 linearization
Message-ID: <20260611121930.GB384699@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-14-niklas.soderlund+renesas@ragnatech.se>
 <aiA7sxSVeARebisR@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiA7sxSVeARebisR@zed>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64586-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[messagingengine.com:dkim,ragnatech.se:dkim,ragnatech.se:email,ragnatech.se:mid,ragnatech.se:from_mime,ideasonboard.com:email,vger.kernel.org:from_smtp,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1767C671C36

Hi Jacopo,

Thanks for your feedback.

On 2026-06-03 16:36:52 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Sat, May 16, 2026 at 11:13:20PM +0200, Niklas Söderlund wrote:
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
> > * Changes since v8
> > - Move declaration of dx_lo and dx_hi to top of function.
> > ---
> >  .../platform/dreamchip/rppx1/rpp_module.h     |  1 +
> >  .../platform/dreamchip/rppx1/rpp_params.c     |  5 ++
> >  .../platform/dreamchip/rppx1/rppx1_lin.c      | 54 +++++++++++++++++++
> >  .../uapi/linux/media/dreamchip/rppx1-config.h | 48 ++++++++++++++++-
> >  4 files changed, 107 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > index 948e26d7361d..072309d8662d 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > @@ -48,6 +48,7 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> >  union rppx1_params_block {
> >  	struct v4l2_isp_block_header header;
> >  	struct rppx1_bls_params bls;
> > +	struct rppx1_lin_params lin;
> >  	struct rppx1_lsc_params lsc;
> >  	struct rppx1_awbg_params awbg;
> >  	struct rppx1_ccor_params ccor;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > index 86d445b52504..a75a27a8afd0 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > @@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
> >  rppx1_ext_params_blocks_info[] = {
> >  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE1, bls),
> >  	RPPX1_PARAMS_BLOCK_INFO(BLS_PRE2, bls),
> > +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE1, lin),
> > +	RPPX1_PARAMS_BLOCK_INFO(LIN_PRE2, lin),
> >  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE1, lsc),
> >  	RPPX1_PARAMS_BLOCK_INFO(LSC_PRE2, lsc),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> > @@ -68,6 +70,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
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
> > index 0a0e7ab2d1d6..04a92f24ab49 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_lin.c
> > @@ -25,6 +25,11 @@
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
> > @@ -53,7 +58,56 @@ static int rppx1_lin_start(struct rpp_module *mod,
> >  	return 0;
> >  }
> >
> > +static int rppx1_lin_fill_params(struct rpp_module *mod,
> > +				 const union rppx1_params_block *block,
> > +				 rppx1_reg_write write, void *priv)
> > +{
> > +	const struct rppx1_lin_params *cfg = &block->lin;
> > +	u8 sample_mask;
> > +	u32 dx_lo = 0;
> > +	u32 dx_hi = 0;
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
> 
> Why is this conditional ?
> 
> Do you think it could be enabled unconditionally ? the "disable" case
> is handled already above, isn't it ?

Wops, my bad. Yes it should be dropped.

> 
> 
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
> > index 05faec2f68e3..72f3fd836f41 100644
> > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > @@ -93,6 +93,8 @@ enum rppx1_meas_chan {
> >   * @RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2: PRE2 Lens Shading Correction
> >   * @RPPX1_PARAMS_BLOCK_TYPE_GA_HV: Human Vision Pipe Gamma Out Correction
> >   * @RPPX1_PARAMS_BLOCK_TYPE_GA_MV: Machine Vision Gamma Out Correction
> > + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1: PRE1 pipe Linearization (Sensor De-gamma)
> > + * @RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2: PRE2 pipe Linearization (Sensor De-gamma)
> >   */
> >  enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> > @@ -111,6 +113,8 @@ enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_LSC_PRE2,
> >  	RPPX1_PARAMS_BLOCK_TYPE_GA_HV,
> >  	RPPX1_PARAMS_BLOCK_TYPE_GA_MV,
> > +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE1,
> > +	RPPX1_PARAMS_BLOCK_TYPE_LIN_PRE2,
> >  };
> >
> >  /**
> > @@ -546,6 +550,46 @@ struct rppx1_ga_params {
> >  	__u32 gamma_y[RPPX1_GA_MAX_SAMPLES];
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
> > @@ -568,7 +612,9 @@ struct rppx1_ga_params {
> >  	sizeof(struct rppx1_lsc_params)				+	\
> >  	sizeof(struct rppx1_lsc_params)				+	\
> >  	sizeof(struct rppx1_ga_params)				+	\
> > -	sizeof(struct rppx1_ga_params))
> > +	sizeof(struct rppx1_ga_params)				+	\
> > +	sizeof(struct rppx1_lin_params)				+	\
> > +	sizeof(struct rppx1_lin_params))
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> >
> >  /* ---------------------------------------------------------------------------
> >   * Statistics Structures
> > --
> > 2.54.0
> >

-- 
Kind Regards,
Niklas Söderlund

