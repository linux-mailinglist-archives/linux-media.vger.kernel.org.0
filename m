Return-Path: <linux-media+bounces-63590-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id EUc1DI0jIGpawwAAu9opvQ
	(envelope-from <linux-media+bounces-63590-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 14:52:29 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E57637B44
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 14:52:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=m+dQGWl0;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="P 2tRVVQ";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63590-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63590-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 16F7830E3E2F
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 12:48:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E6C73C4577;
	Wed,  3 Jun 2026 12:48:23 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5628D47F2FA;
	Wed,  3 Jun 2026 12:48:16 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780490901; cv=none; b=qiC3U+mwpY6LWkAcG7IvgaN1wD58dKxrTXmXL/fVLlMl0B/I+CZQaM9LqEt++BqCTTsqtCWcHj0/wH9OnF0WUjYOiOk8rjeK73tOvOFS5W1CaP+8Ngj4I+fESVDkHRggMnZYOs6kY5iZ4x5gXnjjHr0IBg70xSm6qwOswW//cOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780490901; c=relaxed/simple;
	bh=2D8xsDwXfteC536ig9mB/AcCB/Fmi04aowDTBlUWiwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOS3O69IAJ6ZFna0vIo5UfPOOiV9W50WWoCBLKdNtVa2O/XgQPq05nQXNPQU5SAvC84eSRUI7Ah/mHwwwVIrCkt3vHx82azPNXIRpUJNt6/Jk6GIyvIiDvMo6nK2x8bgbQmkJ8/R9DU+Pgu2GUaAsDTYT0nLhZPnJtvHZ3xv9wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=m+dQGWl0; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=P2tRVVQU; arc=none smtp.client-ip=103.168.172.147
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 40761EC0040;
	Wed,  3 Jun 2026 08:48:15 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Wed, 03 Jun 2026 08:48:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780490895;
	 x=1780577295; bh=yw8MkrWFm4eSg2NjVccBRlxKR6CvAd4ayidRifo4nSo=; b=
	m+dQGWl0bRlhUZI7T2+kQuXE/MXX+HLfVZ4v/d54cMkKxCZol2mjy0DGLMMYnq8t
	tdQ9zYlPvhcbK3QaRo0HiBcA/EYwhXCX3AS90tAsmD55bwdSB5xa8IFNApGzwbJE
	FZWeaTPEdKblIwER17e3XCTgFdJvQZ24D+/2HqUakgv4AFIllE242C1q2KBP0/P7
	Fr8cDjENp2evvXqFTuRphkpyYDJFOFiN0xCYa7hEme67Ldpd5XaewJIdV9N2s4eq
	nwjQtw2a/3VjC0ADaUroyhW3/9XS69MZQ/IH/Pl4I3uOCJN7pl4DrpAMcZs4DQk1
	cZz8oMaSKafsIMDJAuTrTA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780490895; x=
	1780577295; bh=yw8MkrWFm4eSg2NjVccBRlxKR6CvAd4ayidRifo4nSo=; b=P
	2tRVVQUVHAnmVDFOFm9FvsGMWlcZTsPm+RQzM5M1BXh36+s2/nQu4ZUf1Fu9qanz
	ow1JyL3a4RXYq6vPslOE9QlHuYc+0nNiWfpe3+MMx1CIRKwLBbD+K1p3XxErqiVo
	WC9dyfS37de40iabNQebmzLoFhXnRhFcPh5OXXr8SXhElD0UHMS53qXk78YibEv0
	w6KmQg6DQ5IujRBBuJFcj7WaM8d/m679nSuP6QNyHaaWON4bdUyvJTamcS5VFvHt
	XlcJks+ZbUJyy4I5JYfIA6E5qkQBHVpbOjtel70KPDBLOBelaim+y9DUKz1P16VT
	z9ys2ZaLxEOZ916hcMH7Q==
X-ME-Sender: <xms:jyIgaheOODcseZrBVCfI6sXxnlpdYkg2FyhQhdHIxZjxAIMl7LIqVQ>
    <xme:jyIgarMnqSJhRxb9gMXwevAefcXyATtM9f3gE5lh-2JunY3JHqAfQrv5u_AsW9Qef
    DmizZfMjeq1R6EV7vno0KZNqmVYPCAN0-usZ5NOJBZTrQuQUBERL1N5>
X-ME-Received: <xmr:jyIgassJeBFS5q6hhvZiQOcjrTyDWQBEdttQh9nyT6bEeT7YrnFtbf1g0XIWVBWuwU598Wa6CAA-m_5X8PjfzvZdi5oOxEvNiHkB>
X-ME-Proxy-Cause: dmFkZTEzcVZ86N4uR6EOlDo9UWs50WEEP5dY4TEfJeSueR0m5DVXif+BmFenNP5UxILp2l
    f9bX5JqD29q7wUMm7BU1hOsiHmck3FP4qwp1UQfMfk+/N7IA44uh70Mmk14hU1mapG0qM1
    dm2od3UOyUxb30qjYatz8poNXphzDpYiTLut2GwOkX8+0uKGl0JTYbmrrEgK+3m9r1hi5L
    dpBeO1sHF69iOtxluzAqWPNWmGSgImBdpV6dIdGQclHzFsMjk3y1n/U098H/JCiS2SI9OP
    qoqa5fHUhQlxuoY5TV7YZddx5Nv2tuftuS/2jWkgCO+XvsvcfJt7dvZVBIj8yep06+WZIB
    1dIOlvdO0Kyve6usp8wI9P82ZuMtH6U154TOcGnEl2M/pJnhB+MzxinGvpkj14RQRLildI
    8rvepnFuFPu113S+C1yK3haCwRm8Cthk2/ux7rmzqTTkKNCW4LNoVIlr3QS1qkTev+otFU
    0k8Nbnp7NNkOiSFrpdSI81W3vr8m21t2cCyKnxaYNa7VSzGMsrMwkXZOMOOVAQdsa2biAs
    QHqJBANR7IdHceTVHhVFYO1IQKMdLg9EITjRP2q/kbdje2cOEPn3WryltsJS7AxKd0YXD5
    12YlJhozm/l4wZyBXRtbVTqKyKxyu1CE6IYhlK9w6IbYPdbm8I4oF16z4+Og
X-ME-Proxy: <xmx:jyIgasBtwIxSlgNEAQ6zi6LVd3QguZvO-Dzr8s_u_zIQ9-eR4YDWrQ>
    <xmx:jyIgarYPpwR994Vrq_mgsb8nn10EqVVMkxNB8CblFJHGYfNCTfyEOw>
    <xmx:jyIgavXpk3AePz6nETI9kS4yWRi8h9AVsLY5aSK-U12QOJ4STgZ_2w>
    <xmx:jyIgaiPriHiZECc_j-r4RSrPB-xjpwjE--XTHXTu1gc9wMDXB4Rf9g>
    <xmx:jyIgarwChpT2s61iOeSd5NMml6Y4Gazh-64J550YnFqWVqZDyhWl7qb6>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 08:48:14 -0400 (EDT)
Date: Wed, 3 Jun 2026 14:48:13 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/13] media: Add RPP_X1_PARAMS and RPP_X1_STATS meta
 formats
Message-ID: <20260603124813.GC91369@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-2-niklas.soderlund+renesas@ragnatech.se>
 <aiAGShBotGpjm64f@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiAGShBotGpjm64f@zed>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ragnatech.se,none];
	R_DKIM_ALLOW(-0.20)[ragnatech.se:s=fm3,messagingengine.com:s=fm1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-63590-lists,linux-media=lfdr.de,renesas];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jacopo.mondi@ideasonboard.com,m:jai.luthra+renesas@ideasonboard.com,m:mchehab@kernel.org,m:kuninori.morimoto.gx@renesas.com,m:laurent.pinchart@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jai.luthra@ideasonboard.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[ragnatech.se:+,messagingengine.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[niklas.soderlund@ragnatech.se,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ideasonboard.com:email,vger.kernel.org:from_smtp,messagingengine.com:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,ragnatech.se:mid,ragnatech.se:dkim,ragnatech.se:from_mime,ragnatech.se:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 97E57637B44

Hi Jacopo,

Thanks for your feedback.

On 2026-06-03 12:49:11 +0200, Jacopo Mondi wrote:
> Hi Niklas,
> 
> On Sat, May 16, 2026 at 11:13:08PM +0200, Niklas Söderlund wrote:
> > From: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> >
> > Register V4L2 metadata fourcc codes for the Dreamchip RPP-X1 ISP
> > parameters and statistics buffers. These formats are used by the driver
> > to exchange ISP configuration and 3A statistics with userspace through
> > the extensible parameters framework.
> >
> > Signed-off-by: Jai Luthra <jai.luthra+renesas@ideasonboard.com>
> > Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> > Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Depending on the discussion on
> [PATCH 0/6] media: v4l2-isp: Add support for extensible statistics
> we might be able to drop these two.

Indeed.

> 
> In case we don't is it intentional to split documenting them to a
> later patch ?

Yes.

> 
> > ---
> >  drivers/media/v4l2-core/v4l2-ioctl.c | 2 ++
> >  include/uapi/linux/videodev2.h       | 4 ++++
> >  2 files changed, 6 insertions(+)
> >
> > diff --git a/drivers/media/v4l2-core/v4l2-ioctl.c b/drivers/media/v4l2-core/v4l2-ioctl.c
> > index a2b650f4ec3c..cd3f4a86e27f 100644
> > --- a/drivers/media/v4l2-core/v4l2-ioctl.c
> > +++ b/drivers/media/v4l2-core/v4l2-ioctl.c
> > @@ -1471,6 +1471,8 @@ static void v4l_fill_fmtdesc(struct v4l2_fmtdesc *fmt)
> >  	case V4L2_META_FMT_C3ISP_STATS:		descr = "Amlogic C3 ISP Statistics"; break;
> >  	case V4L2_META_FMT_MALI_C55_PARAMS:	descr = "ARM Mali-C55 ISP Parameters"; break;
> >  	case V4L2_META_FMT_MALI_C55_STATS:	descr = "ARM Mali-C55 ISP 3A Statistics"; break;
> > +	case V4L2_META_FMT_RPP_X1_PARAMS:	descr = "Dreamchip RPP-X1 ISP Parameters"; break;
> > +	case V4L2_META_FMT_RPP_X1_STATS:	descr = "Dreamchip RPP-X1 ISP Statistics"; break;
> >  	case V4L2_PIX_FMT_NV12_8L128:	descr = "NV12 (8x128 Linear)"; break;
> >  	case V4L2_PIX_FMT_NV12M_8L128:	descr = "NV12M (8x128 Linear)"; break;
> >  	case V4L2_PIX_FMT_NV12_10BE_8L128:	descr = "10-bit NV12 (8x128 Linear, BE)"; break;
> > diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
> > index eda4492e40dc..1f78b5378b3b 100644
> > --- a/include/uapi/linux/videodev2.h
> > +++ b/include/uapi/linux/videodev2.h
> > @@ -889,6 +889,10 @@ struct v4l2_pix_format {
> >  #define V4L2_META_FMT_MALI_C55_PARAMS	v4l2_fourcc('C', '5', '5', 'P') /* ARM Mali-C55 Parameters */
> >  #define V4L2_META_FMT_MALI_C55_STATS	v4l2_fourcc('C', '5', '5', 'S') /* ARM Mali-C55 3A Statistics */
> >
> > +/* Vendor specific - used for Dreamchip RPP-X1 ISP */
> > +#define V4L2_META_FMT_RPP_X1_PARAMS	v4l2_fourcc('D', 'R', '1', 'P') /* Dreamchip RPP-X1 Parameters */
> > +#define V4L2_META_FMT_RPP_X1_STATS	v4l2_fourcc('D', 'R', '1', 'S') /* Dreamchip RPP-X1 Statistics */
> > +
> >  #ifdef __KERNEL__
> >  /*
> >   * Line-based metadata formats. Remember to update v4l_fill_fmtdesc() when
> > --
> > 2.54.0
> >

-- 
Kind Regards,
Niklas Söderlund

