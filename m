Return-Path: <linux-media+bounces-64581-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id u5OHNgimKmpxuQMAu9opvQ
	(envelope-from <linux-media+bounces-64581-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:11:52 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0B9671B31
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 14:11:51 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=002QnNY9;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="W YReikp";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64581-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c15:e001:75::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64581-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 4FA163027CAB
	for <lists+linux-media@lfdr.de>; Thu, 11 Jun 2026 12:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B01973DB303;
	Thu, 11 Jun 2026 12:04:41 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB4D3EA970;
	Thu, 11 Jun 2026 12:04:38 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781179481; cv=none; b=CuHOomTSUGxrtdJok2QeZYbdApS+NSnWRnpKBzspaqn/8s9ws19sPLyEM1+mCvtmAAO87noV87ZZdjdNmT9ciOIfO7qpWawNX+Hn5FW0S3FMuZYi8CdKV/cJEk5wljEg41eXcUd0soLRhxrjihO08cJi+oAZ9qnduFtiEhZNL5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781179481; c=relaxed/simple;
	bh=Uwt3nWM7YUm4Kby4zkWLpNk62VxKlE3VJUMcOT9RNCM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Lpo9rpNUHz7VZZhZboyFFKssFBqlEzhVrhxn5DEVM7NK73cNBiSFFc653dWBAGQEx4U3qMB0vWOk7Zwev/ciUIGX63mulfmDMGsdNGEDQL/WJIBfsjvI7RHxpfWubX+hySaP8T+hHnmXlbjbbjxOpxa43NOUUuyowLfbmglWVWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=002QnNY9; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=WYReikpA; arc=none smtp.client-ip=103.168.172.156
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 1576F140006D;
	Thu, 11 Jun 2026 08:04:38 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Jun 2026 08:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1781179478;
	 x=1781265878; bh=lBuUXSTwWuhnGTac919jCC17R/Ls+pMmfV7+HECx0wQ=; b=
	002QnNY9K5i48Yl4axXiLgs+2wLD2sYXA/3V+9y3hBmCSx23Vb1I/2uSH3v+Vmt1
	HJDnWCz1/g8yiUilzTrTBz6GEyiVrHWCFOThIBugednGoH/GxZ2Spijr0UY/Trzh
	mj2W4dn8Xw4FDk9X4gCv9l2Bccgg44WxTSpwSX3bWjLQJDf5ma9OxD7uvP0NhkxI
	qsqXGiPcUqc7QsNlRWuNahXnv7MIELmefQTlQKcz0bI+MB0bdPsBEaeyVDpJe+B9
	hSQ3Q4qlRB58Wr1RDOEOBwfpuUCIXPo4/siUlqQn3VNvNmmY/8BNKVeZtGei5Z/I
	gyHXjs7cERZ4E+eVDIVcsg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1781179478; x=
	1781265878; bh=lBuUXSTwWuhnGTac919jCC17R/Ls+pMmfV7+HECx0wQ=; b=W
	YReikpAFAWD+1FRmwRQCAwy039zpREhcN0i5Ab+aEBGN5hQR7YCUAxGDjH9WS/B1
	ywjc1iLSgMz1XsuEHCizEXEZjJKESMLlkSSdHPazki5FRSWIXmmnixGRPV7glEoQ
	nCwXFC3Ha7Vhp5oA2w/TQ6o5NeFU7LGpS9C8uyYNo2JJwujEiRGuVdJijI7DCRe9
	AM5pfOBj0EjVr5HXoapuvTkoU/I/oFyJCfCVNyzLwinalGLbHNGNI8S6rOiQ2nif
	M0QfYfDa2N07jZU4eM54yeNZlSSXPN91PMBdnzpcBFVJEtSizKfR/kSRFd1wT1px
	81JJ0to9To0BVfOxqGgMw==
X-ME-Sender: <xms:VaQqahgeIUuPnYYU3grYGHssM5kYyVCdd3FDX4rfm3ClWs_mohtHDg>
    <xme:VaQqamcW5V1DsasiGnWEwaP9pEw8dju7yE9dVFhDfyEbtvgRP8GF2Ij2dpHszj2mf
    UHYIy4x_FnU5RmSRBIDMMR9YogO-yMMUdlPS-BoI0X7geD1muwxxdbU>
X-ME-Received: <xmr:VaQqahwQpo7JX3DD9m80BnfBmodJk_OR8GPkf7fZMO-mo5hUnNqf0dvM33Rr49LZypvqCGMiuoJq20rfZqhewA-oir99>
X-ME-Proxy-Cause: dmFkZTF38orYbcR7BwSo7dNuTfNhWIJbE/ASIUGQhL3qh9EwxMT0dNRWwZcejhJgO7xvVZ
    UHMVzJ+UEHtAn2AvLdNceoL9dVrelBNFbtDxjEo+Ff5TT2/2FBlZSgywRh2MWbeaTyO0nD
    VSRsTojbYrjyr1Yn8PQrE3tK2iDaxHeBZXvPCyLFom93sohuXkyK0uDTFSez5OadhKthQ0
    hKo4fGjq0YCTZ0Pa706NtAjqqmXcvxMzpISVHhLeqCe0oHw1sujk4jNrhzfBAfYInWfX83
    NVqwG+QirAMpLsEJ2A5VpBnx2YGxM5knFkxS9BUTjIjxqAnzRF55cKdRAxFaET8Bd6Hlmk
    idk/MV2VUT5dtgyuerdwKtf6nyKTHPTCm19rQ91Ttbt6PCbrlbOjzHjxmFUZ/FRL5F+H+6
    4pez7qv5UuUNo3Lc+pFl8/m/SQNMUX2hZY5yIf2yvVzdUxoFLtD+7It1Tkmj0kfDyJcYKH
    YNzExbNXOuLIx5IlmmobnomzIBCb5X2tbWloRe7/aHUq2Y97zNd/LpoZivryrO3elR/YaS
    BGGP/h5iQTeASUYX5XaB70O+eF1IKxnoOOomCxCxVVCGA+AG3D2yYp/2VgNHZ5q1nEGsk6
    0JLqEEbYFb5PooqVnJ43fs2GrtIDXJH/NODpOBgPxlIg/oxmnG+nSE+wBYtw
X-ME-Proxy: <xmx:VaQqat3qyYiggyAV1cgnrGc0HWpe2CEz1sNIXSfENJSISsoF2LcDGQ>
    <xmx:VaQqavzGXUS4k0mN5d1hbDFEiLxOZJIM8PEIZ2ivJ3xmJJ69Og8FWg>
    <xmx:VaQqaqUieYXR4d5Yeog6_zAUGLmteFV1Xm-nub77gPTmlZ9Hi8W8-w>
    <xmx:VaQqaj_W7QtFgpCXBUtxl15Zb07vVSHyk8UUNG3fN04khMPrQvKtvw>
    <xmx:VqQqauplLULYOxjd3Md67lsDDcXO-dovuauKQyRqKm0d7qtwDW2d9-ch>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Jun 2026 08:04:37 -0400 (EDT)
Date: Thu, 11 Jun 2026 14:04:36 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v9 07/13] media: rppx1: exm: Add support for exposure
 measurement
Message-ID: <20260611120436.GA381492@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-8-niklas.soderlund+renesas@ragnatech.se>
 <aiAvZvWUb1neohXH@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiAvZvWUb1neohXH@zed>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	TAGGED_FROM(0.00)[bounces-64581-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	TO_DN_SOME(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DE0B9671B31

Hi Jacopo,

On 2026-06-03 15:57:24 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Sat, May 16, 2026 at 11:13:14PM +0200, Niklas Söderlund wrote:
> > Extend the RPPX1 driver to allow setting the exposure measurement
> > configuration and consuming the resulting statistics. It uses the RPPX1
> > framework for parameters and its writer abstraction to allow the user to
> > control how, and when, configuration is applied to the RPPX1.
> >
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Co-developed-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > Co-developed-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > Signed-off-by: Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
> > ---
> > * Changes since v8
> > - Use IS_ERR to check rppx1_init_stats_block() return code.
> > ---
> >  .../platform/dreamchip/rppx1/rpp_module.h     |   2 +
> >  .../platform/dreamchip/rppx1/rpp_params.c     |   5 +
> >  .../platform/dreamchip/rppx1/rpp_stats.c      |  10 ++
> >  .../platform/dreamchip/rppx1/rppx1_exm.c      |  78 ++++++++++-
> >  .../uapi/linux/media/dreamchip/rppx1-config.h | 121 +++++++++++++++++-
> >  5 files changed, 213 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_module.h b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > index 0e36b717b4ef..e968ec67b9f5 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_module.h
> > @@ -48,11 +48,13 @@ void rpp_module_clrset(struct rpp_module *mod, u32 offset, u32 mask, u32 value);
> >  union rppx1_params_block {
> >  	struct v4l2_isp_block_header header;
> >  	struct rppx1_awbg_params awbg;
> > +	struct rppx1_exm_params exm;
> >  	struct rppx1_wbmeas_params wbmeas;
> >  };
> >
> >  union rppx1_stats_block {
> >  	struct v4l2_isp_block_header header;
> > +	struct rppx1_exm_stats exm;
> >  	struct rppx1_wbmeas_stats wbmeas;
> >  };
> >
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_params.c b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > index 17bbcf366970..8c0f45e8066a 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_params.c
> > @@ -19,6 +19,8 @@ static const struct v4l2_isp_params_block_type_info
> >  rppx1_ext_params_blocks_info[] = {
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE1, awbg),
> >  	RPPX1_PARAMS_BLOCK_INFO(AWBG_PRE2, awbg),
> > +	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE1, exm),
> > +	RPPX1_PARAMS_BLOCK_INFO(EXM_PRE2, exm),
> >  	RPPX1_PARAMS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> >  };
> >
> > @@ -56,6 +58,9 @@ int rppx1_params(struct rppx1 *rpp, struct vb2_buffer *vb, size_t max_size,
> >  		case RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1:
> >  			module = &rpp->pre1.awbg;
> >  			break;
> > +		case RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1:
> > +			module = &rpp->pre1.exm;
> > +			break;
> >  		case RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST:
> >  			module = &rpp->post.wbmeas;
> >  			break;
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > index c99ea158abcf..388c758d805d 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rpp_stats.c
> > @@ -17,6 +17,7 @@
> >
> >  static const struct v4l2_isp_stats_block_type_info
> >  rppx1_stats_blocks_info[] = {
> > +	RPPX1_STATS_BLOCK_INFO(EXM_PRE1, exm),
> >  	RPPX1_STATS_BLOCK_INFO(WBMEAS_POST, wbmeas),
> >  };
> >
> > @@ -34,6 +35,15 @@ void rppx1_stats_fill_isr(struct rppx1 *rpp, u32 isc, void *buf)
> >
> >  	v4l2_isp_stats_init_buffer(stats, V4L2_ISP_VERSION_V1);
> >
> > +	if (isc & RPPX1_IRQ_ID_PRE1_EXM) {
> > +		block = rppx1_init_stats_block(rpp, stats,
> > +					       RPPX1_STATS_BLOCK_TYPE_EXM_PRE1);
> > +		if (IS_ERR(block))
> > +			return;
> > +
> > +		rpp_module_call(&rpp->pre1.exm, fill_stats, block);
> > +	}
> > +
> >  	if (isc & RPPX1_IRQ_ID_POST_AWB_MEAS) {
> >  		block = rppx1_init_stats_block(rpp, stats,
> >  					       RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST);
> > diff --git a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
> > index 10b899ba201f..1694f2b487fc 100644
> > --- a/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
> > +++ b/drivers/media/platform/dreamchip/rppx1/rppx1_exm.c
> > @@ -11,10 +11,14 @@
> >  #define EXM_START_REG			0x0004
> >
> >  #define EXM_CTRL_REG			0x0008
> > +#define EXM_CTRL_EXM_AUTOSTOP		BIT(1) /* HW doc says not supported. */
> >  #define EXM_CTRL_EXM_UPDATE_ENABLE	BIT(0)
> >
> >  #define EXM_MODE_REG			0x000c
> > +
> >  #define EXM_CHANNEL_SEL_REG		0x0010
> > +#define EXM_CHANNEL_SEL_CHANNEL_SELECT_MASK	GENMASK(2, 0)
> > +
> >  #define EXM_LAST_MEAS_LINE_REG		0x0014
> >  #define EXM_COEFF_R_REG			0x0018
> >  #define EXM_COEFF_G_GR_REG		0x001c
> > @@ -27,7 +31,6 @@
> >  #define EXM_FORCED_UPD_START_LINE_REG	0x0038
> >  #define EXM_VSTART_STATUS_REG		0x003c
> >
> > -#define EXM_MEAN_REG_NUM		25
> >  #define EXM_MEAN_REG(n)			(0x0040 + (4 * (n)))
> 
> This is a bit confusing as some of the defines where there already,
> some are added here but not used by this patch. Not a big deal, if you
> like the incremental approach instead of introducing each block in one
> go I guess this might be expected

Indeed, but I think it can be improved a bit. I will remove ever 
introducing the EXM_MEAN_REG_NUM define as it is no longer used. It was 
in the past but the value now comes from another header file.

> 
> >
> >  static int rppx1_exm_probe(struct rpp_module *mod)
> > @@ -47,6 +50,79 @@ static int rppx1_exm_probe(struct rpp_module *mod)
> >  	return 0;
> >  }
> >
> > +static int
> > +rppx1_exm_fill_params(struct rpp_module *mod,
> > +		      const union rppx1_params_block *block,
> > +		      rppx1_reg_write write, void *priv)
> > +{
> > +	const struct rppx1_exm_params *cfg = &block->exm;
> > +	u32 h_offs, v_offs, h_size, v_size;
> > +
> > +	/* If the modules is disabled, simply bypass it. */
> > +	if (cfg->header.flags & V4L2_ISP_PARAMS_FL_BLOCK_DISABLE) {
> > +		write(priv, mod->base + EXM_MODE_REG, 0);
> > +		return 0;
> > +	}
> > +
> > +	switch (cfg->mode) {
> > +	case RPPX1_EXP_MEASURING_MODE_RGB:
> > +	case RPPX1_EXP_MEASURING_MODE_BAYER:
> > +		write(priv, mod->base + EXM_MODE_REG, cfg->mode);
> > +		break;
> > +	default:
> > +		write(priv, mod->base + EXM_MODE_REG, 0);
> > +		return 0;
> > +	}
> > +
> > +	write(priv, mod->base + EXM_COEFF_R_REG, cfg->coeff_r);
> > +	write(priv, mod->base + EXM_COEFF_G_GR_REG, cfg->coeff_g_gr);
> > +	write(priv, mod->base + EXM_COEFF_GB_REG, cfg->coeff_gb);
> > +	write(priv, mod->base + EXM_COEFF_B_REG, cfg->coeff_b);
> > +
> > +	/* Select sample point */
> > +	write(priv, mod->base + EXM_CHANNEL_SEL_REG,
> > +	      cfg->channel_sel & EXM_CHANNEL_SEL_CHANNEL_SELECT_MASK);
> > +
> > +	/*
> > +	 * Adjust and set measurement window to hardware limitations,
> > +	 * - Offsets must be even.
> > +	 * - Width and height must be divisible by 10.
> 
> Can we say "even and divisible in 5 windows". This is not an hardware
> limitation but our decision to have the driver split the measurement
> area in 5 windows here instead of asking userspace to do that.

Ack.

> 
> > +	 */
> > +	h_offs = cfg->wnd.h_offs & 0x1ffe;
> > +	v_offs = cfg->wnd.v_offs & 0x1ffe;
> > +	h_size = (cfg->wnd.h_size - 1) - ((cfg->wnd.h_size - 1) % 10);
> > +	v_size = (cfg->wnd.v_size - 1) - ((cfg->wnd.v_size - 1) % 10);
> > +
> > +	write(priv, mod->base + EXM_H_OFFS_REG, h_offs);
> > +	write(priv, mod->base + EXM_V_OFFS_REG, v_offs);
> > +	write(priv, mod->base + EXM_H_SIZE_REG, h_size / 5);
> > +	write(priv, mod->base + EXM_V_SIZE_REG, v_size / 5);
> > +
> > +	/*
> > +	 * Set last measurement line for ready interrupt. Ignore the value
> > +	 * from the parameters as it is only useful for fast-channel switching.
> 
> Should we ignore the userspace value ? As we program the window size
> here I presume we should, however it feels a bit weird accepting a
> parameter and then ignoring it..

I prefers to set it here as we deal with the window size. If we ever 
want to do something more advanced here we have it.

> 
> > +	 */
> > +	write(priv, mod->base + EXM_LAST_MEAS_LINE_REG, v_offs + v_size + 1);
> > +
> > +	write(priv, mod->base + EXM_START_REG, 1);
> > +
> > +	return 0;
> > +}
> > +
> > +static int rppx1_exm_fill_stats(struct rpp_module *mod,
> > +				union rppx1_stats_block *block)
> > +{
> > +	struct rppx1_exm_stats *stats = &block->exm;
> > +
> > +	/* Return measurements at native hardware precision. */
> 
> I would drop this comment, everything is now at native hw precision.

Ack, relic from the past.

> 
> > +	for (unsigned int i = 0; i < RPPX1_EXM_NUM_WIN; i++)
> > +		stats->exp_mean[i] = rpp_module_read(mod, EXM_MEAN_REG(i));
> > +
> > +	return 0;
> > +}
> > +
> >  const struct rpp_module_ops rppx1_exm_ops = {
> >  	.probe = rppx1_exm_probe,
> > +	.fill_params = rppx1_exm_fill_params,
> > +	.fill_stats = rppx1_exm_fill_stats,
> >  };
> > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > index 5ed8a335c9de..dbc1e116fdf5 100644
> > --- a/include/uapi/linux/media/dreamchip/rppx1-config.h
> > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > @@ -33,6 +33,36 @@ struct rppx1_window {
> >  	__u16 v_size;
> >  };
> >
> > +/**
> > + * enum rppx1_meas_chan - Measurement point for the Histogram and EXM Modules
> > + *
> > + * Measurement points for the RPP-X1 Histogram measurement module and Exposure
> > + * measurement module.
> > + *
> > + * All tap points are available for the PRE1/PRE2 pipes. Only
> > + * RPPX1_MEAS_CHAN_SEL4 and RPPX1_MEAS_CHAN_SEL7 are available for the
> > + * MAIN_POST pipe.
> > + *
> > + * @RPPX1_MEAS_CHAN_SEL0: after input acquisition
> > + * @RPPX1_MEAS_CHAN_SEL1: after black level subtraction
> > + * @RPPX1_MEAS_CHAN_SEL2: after sensor gamma linearization
> > + * @RPPX1_MEAS_CHAN_SEL3: after lens shading correction
> > + * @RPPX1_MEAS_CHAN_SEL4: after auto white balance gains
> > + * @RPPX1_MEAS_CHAN_SEL5: after defect pixel correction
> > + * @RPPX1_MEAS_CHAN_SEL6: after denoise pre-filter
> > + * @RPPX1_MEAS_CHAN_SEL7: after demosaicing
> > + */
> > +enum rppx1_meas_chan {
> > +	RPPX1_MEAS_CHAN_SEL0,
> > +	RPPX1_MEAS_CHAN_SEL1,
> > +	RPPX1_MEAS_CHAN_SEL2,
> > +	RPPX1_MEAS_CHAN_SEL3,
> > +	RPPX1_MEAS_CHAN_SEL4,
> > +	RPPX1_MEAS_CHAN_SEL5,
> > +	RPPX1_MEAS_CHAN_SEL6,
> > +	RPPX1_MEAS_CHAN_SEL7,
> > +};
> > +
> >  /* ---------------------------------------------------------------------------
> >   * Parameter Structures
> >   *
> > @@ -51,12 +81,16 @@ struct rppx1_window {
> >   * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1: PRE1 pipe White Balance Gains
> >   * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2: PRE2 White Balance Gains
> >   * @RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST: MAIN_POST White Balance Gains
> > + * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1: PRE1 pipe Exposure Measurement
> > + * @RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2: PRE2 pipe Exposure Measurement
> >   */
> >  enum rppx1_params_block_type {
> >  	RPPX1_PARAMS_BLOCK_TYPE_WBMEAS_POST,
> >  	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE1,
> >  	RPPX1_PARAMS_BLOCK_TYPE_AWBG_PRE2,
> >  	RPPX1_PARAMS_BLOCK_TYPE_AWBG_POST,
> > +	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1,
> > +	RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2,
> >  };
> >
> >  /**
> > @@ -144,6 +178,64 @@ struct rppx1_awbg_params {
> >  	__u32 gain_green_b;
> >  };
> >
> > +/**
> > + * enum rppx1_exm_mode - Exposure measurement mode
> > + *
> > + * Exaposure measurement mode selection (RGB/Bayer).
> > + *
> > + * @RPPX1_EXP_MEASURING_MODE_DISABLED: no measurement
> > + * @RPPX1_EXP_MEASURING_MODE_RGB: Y/R/G/B measurement
> > + * @RPPX1_EXP_MEASURING_MODE_BAYER: Bayer RGB measurement
> > + */
> > +enum rppx1_exm_mode {
> > +	RPPX1_EXP_MEASURING_MODE_DISABLED,
> > +	RPPX1_EXP_MEASURING_MODE_RGB,
> > +	RPPX1_EXP_MEASURING_MODE_BAYER,
> > +};
> > +
> > +/**
> > + * struct rppx1_exm_params - Exposure measurement configuration
> > + *
> > + * The RPP-X1 Exposure measurement unit is available on the PRE1 and PRE2
> > + * pre-fusion pipes. Userspace selects which pipe to operate by setting
> > + * the @header.type field to RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1 or
> > + * RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2.
> > + *
> > + * Exposure measurement is performed in the RGB or Bayer domain, according to
> > + * the setting of the @mode field. The exposure measurement tap point is
> > + * selected according to the value of @channel_sel.
> > + *
> > + * The exposure measurement is performed on an input window specified in @wnd.
> > + * To each color component a programmable weight coefficient is associated.
> > + * Coefficients are represented as unsigned 8 bits integer values in Q1.7 format
> > + * ranging from 0 to 1.992.
> > + *
> > + * The @last_line fields controls when the exposure measurement completes. It
> > + * is usually programmed to the value of (@wnd.v_offs + @wnd.v_size + 1).
> > + *
> > + * @header: block header (type = RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE1 or
> > + *	    type = RPPX1_PARAMS_BLOCK_TYPE_EXM_PRE2)
> > + * @mode: exposure measure mode (from enum rppx1_exm_mode)
> > + * @channel_sel: exposure measurement point (see enum rppx1_meas_chan)
> > + * @last_line: line number for which the exposure measurement completes
> > + * @wnd: measurement window coordinates
> > + * @coeff_r: coefficient for the red Bayer sample or red color channel, Q1.7
> > + * @coeff_g_gr: coefficient for the green/red Bayer sample or green color channel, Q1.7
> > + * @coeff_b: coefficient for the blue Bayer sample or blue color channel, Q1.7
> > + * @coeff_gb: coefficient for the green/blue Bayer sample, unused in RGB mode, Q1.7
> > + */
> > +struct rppx1_exm_params {
> > +	struct v4l2_isp_params_block_header header;
> > +	__u32 mode;
> > +	__u8 channel_sel;
> > +	__u32 last_line;
> > +	struct rppx1_window wnd;
> > +	__u8 coeff_r;
> > +	__u8 coeff_g_gr;
> > +	__u8 coeff_b;
> > +	__u8 coeff_gb;
> > +};
> > +
> >  /**
> >   * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> >   *
> > @@ -154,7 +246,9 @@ struct rppx1_awbg_params {
> >  	(sizeof(struct rppx1_wbmeas_params)			+	\
> >  	sizeof(struct rppx1_awbg_params)			+	\
> >  	sizeof(struct rppx1_awbg_params)			+	\
> > -	sizeof(struct rppx1_awbg_params))
> > +	sizeof(struct rppx1_awbg_params)			+	\
> > +	sizeof(struct rppx1_exm_params)				+	\
> > +	sizeof(struct rppx1_exm_params))
> >
> >  /* ---------------------------------------------------------------------------
> >   * Statistics Structures
> > @@ -171,9 +265,13 @@ struct rppx1_awbg_params {
> >   * NOTE: Only append to the enumeration as the numbers are uAPI.
> >   *
> >   * @RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST: post-fusion white-balance measurement
> > + * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE1: pre-fusion pipe1 exposure measurement
> > + * @RPPX1_STATS_BLOCK_TYPE_EXM_PRE2: pre-fusion pipe2 exposure measurement
> >   */
> >  enum rppx1_stats_block_type {
> >  	RPPX1_STATS_BLOCK_TYPE_WBMEAS_POST,
> > +	RPPX1_STATS_BLOCK_TYPE_EXM_PRE1,
> > +	RPPX1_STATS_BLOCK_TYPE_EXM_PRE2,
> >  };
> >
> >  /**
> > @@ -193,6 +291,23 @@ struct rppx1_wbmeas_stats {
> >  	__u32 mean_cr_or_r;
> >  };
> >
> > +/* Exposure Measurement */
> > +#define RPPX1_EXM_NUM_WIN 25
> > +
> > +/**
> > + * struct rppx1_exm_stats - Exposure measurement
> > + *
> > + * RPP-X1 exposure measurement calculates the mean value on 25 programmable
> > + * windows on the input picture.
> > + *
> > + * @header: block header (type = RPPX1_STATS_BLOCK_TYPE_EXM_PRE1)
> > + * @exp_mean: mean luminance values per block, up to 20-bit
> > + */
> > +struct rppx1_exm_stats {
> > +	struct v4l2_isp_block_header header;
> > +	__u32 exp_mean[RPPX1_EXM_NUM_WIN];
> > +};
> > +
> >  /**
> >   * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
> >   *
> > @@ -200,6 +315,8 @@ struct rppx1_wbmeas_stats {
> >   * multiple pipes.
> >   */
> >  #define RPPX1_STATS_MAX_SIZE						\
> > -	(sizeof(struct rppx1_wbmeas_stats))
> > +	(sizeof(struct rppx1_wbmeas_stats)			+	\
> > +	sizeof(struct rppx1_exm_stats)				+	\
> > +	sizeof(struct rppx1_exm_stats))
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> >
> >  #endif /* __UAPI_RPP_X1_CONFIG_H */
> > --
> > 2.54.0
> >

-- 
Kind Regards,
Niklas Söderlund

