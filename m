Return-Path: <linux-media+bounces-63591-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 5c53MFgmIGpCxgAAu9opvQ
	(envelope-from <linux-media+bounces-63591-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:04:24 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 38186637D5F
	for <lists+linux-media@lfdr.de>; Wed, 03 Jun 2026 15:04:24 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ragnatech.se header.s=fm3 header.b=ToZJ2lUN;
	dkim=pass header.d=messagingengine.com header.s=fm1 header.b="Q ECIuS6";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-63591-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-63591-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ragnatech.se;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 767173180F38
	for <lists+linux-media@lfdr.de>; Wed,  3 Jun 2026 12:56:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB23347ECE4;
	Wed,  3 Jun 2026 12:55:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA29E203710;
	Wed,  3 Jun 2026 12:55:56 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780491358; cv=none; b=oxqvhPiNLEYcUXcT6Hm8HXlFLH67z1pgVPbEEtIuxIpWuwVf2cDzlmmbSNLKfCoFEbk412Ze809FaP5C2wYXqF3hav2nu7UhzwOWG4/4Gpn8mS82p+C5pFfIzbd3qf+L6SqusbHiqXcMwZQfEswax5w5NZgeEg/p7Rj5R4saiz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780491358; c=relaxed/simple;
	bh=fQJBgqQ82/cJH2IDlb9HeMg1ZqhDwN1VOIbdgwfLGPk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YIZ7vUexk9PqkoioVp7qJFgWPHDf7O3NJ726Jf3DSRs49sPuAk6kaeIECAp8PqOls6BkNNgWbTwCdCY5AYauDKLkcICfjyyMqzUqNa0EKTCj4Xe54zHvJ8ifnHaWqPiSj3bZ4y57rd9Hx3wK7LYovN763z2mQJGLYX4zmG/0/kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=ToZJ2lUN; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=QECIuS6S; arc=none smtp.client-ip=103.168.172.147
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfout.phl.internal (Postfix) with ESMTP id 05FE7EC0064;
	Wed,  3 Jun 2026 08:55:56 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 03 Jun 2026 08:55:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1780491356;
	 x=1780577756; bh=FBvKkoPIXC6fTf3JOGGgJJhX/jhD7a00OKWAzQMl7JY=; b=
	ToZJ2lUN5ugl4G5dercLbgP8P03UiunLkybD7CZLwbTI6H9xlGN08+LHlP5adb3C
	PPcJZQuEysY+zEGE2w1FGFVrA8ETYhe2KpUOvyYaZZOGY8+28oNNusDIgSIzXmoU
	PF3bTdwNFuTjrFGdZdwcBlYRoV/EtHcUVfi55Jyzh3aQ/5ou393KcUhtnNGEiLoi
	ij0QF9YIkxKec6Y4Gh2rgkTgfPERiPd9b8EzS0tOVUxrvQuh3CfWZI7Q08BC8eOC
	vqMp18iYTGYQ/3sHarnm6Re6Kwz3JxsibOG/nubDZFaSLrDO1V3cXyzEOnWQmPBm
	MZMEuLdzNm3/jaT/bMcy+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1780491356; x=
	1780577756; bh=FBvKkoPIXC6fTf3JOGGgJJhX/jhD7a00OKWAzQMl7JY=; b=Q
	ECIuS6STZs618KKhm2b8eX44DUwZUkpSX5g9LI/kFPNn1frZn1+O7WpDT+0EjGjo
	1R/6STMed3+90oqfvcVCYfdm/dOVCs3hAugflmR7eHhhPnBmaZIKI9Jaq6S7pVVs
	iRUBgpdHK++KrgJnuoAX2Osb0bAA1owabH2AOOkR42esjEpssOK16wTaN8nPgXMo
	DY1bqR115YjS14tl2UII8uZTCbHA3dygFpN40FymyMzn+5+0zMpJVXMi1OgmHxcQ
	sgifQtTCPXsmaoxgvZplDzaKdjdIVsH4huvB5KDUxHc/5e9CDbtV3kd+8vl0Zm5m
	u22ScCKRDHPk9UzoqgXpw==
X-ME-Sender: <xms:WyQgaq3yxsGUupKKZXMq_LNKPF7KdiZ5aQyQYyqdF4kE2oJ7SxLPew>
    <xme:WyQgath32g5y1wEmbth4x32A8drBJqT0hkd22VBlRHTCHDleoYcR0AJG7i7tH05pP
    FYsNNoB0BT8TjhEZA2NCRFmWf-UbXICZQXRJKfuFFrOg0EKUGFZy68>
X-ME-Received: <xmr:WyQgajkT2C4fwM4DCzRP_6mbZTXtHQ5udc9tIosU-uafLnB6OonzzGV6K3b_WxD3-a9_v_4S4g6l2ZuveFQ37_K6k930EAWPC__n>
X-ME-Proxy-Cause: dmFkZTEZ7rwmg8g5gWMLeBdenIRSG93PfNUTvUzyu306DREmeMbZTlYysYi7puBFCm4ezy
    gZA8DtmTL/y7UeI+gkFqdThDw7GzUfJJMHX8XjOGWHDbB7dFlc6Db1N3G+6MHqas7MMyNI
    WVE4myVmj9C0YETuVzRsEi+LDAWLmglC9Z8LAmJSpXnuu/6JCBb1QvUEOm1euUxtZfbvxm
    qbMQJ3yKyOkTUIMLfLuhr2HujFcD6u2oQ9Hju/1q3AcCiKFJ1zdSJB73E/qGMrY+Lq4nVX
    OwfCe5tw49+m/1CaFKJnL/WJTn7PbLXDZ0mbAIaZ0/RocpIqTTT2beK/FRsOileicvGVOi
    hPAFcFkaSGhe7l4P15eFuebAwprP09kFGiGtmE06GRzxK1xjCrZK+F+Fy/9+9fjzkzqEXc
    u8Tquacv/lNf5Gt2qCJmors4b7eGQvYvDK/7Lr5Quyb8/2d/D9XKmCjvXUDzzuiSMyTUfg
    UljzW5psfP0ydWqqs2+jB5zWeowd1/KJMNmJsFZ8EUADhVNZhgzMrauustMPj4syWMhOu8
    l3QJhb8clW3yD+6rEFP9re7e6ZmkjIE+DJPXfsV3tGQ58DBcrl35QyVmorZrVPXMZ1Abv4
    yWUoCXQZMWyuCrGU8hj9WKOEI5NolXb8bB5mzoquf13t4HyyS6wDaAFUIKIg
X-ME-Proxy: <xmx:WyQgajZMnbH3sa8vozgSa4gIB3hRaM8RITKcZPpEliRgAmA-AXd28w>
    <xmx:WyQgauEv4Huql7kSCBjhTb6t5C9FJWCfz3n6Rx4KJVcugAZa2ZK7Rg>
    <xmx:WyQgaiaKWZvhmLXAoswqsdMQGyRMn_BO4qKHQwHT_EK7ZESZYyK1Ow>
    <xmx:WyQgaizOY0KD5PQImW9h_CPB1R4XOEdlcrEaFBCsDCjgcDX7JEvIEw>
    <xmx:XCQgan5vfmfjaVC_SEqaaymq1YUKRc6j9-ABgFvAN689KlG0A8ZIP14p>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 3 Jun 2026 08:55:55 -0400 (EDT)
Date: Wed, 3 Jun 2026 14:55:53 +0200
From: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jai Luthra <jai.luthra@ideasonboard.com>
Subject: Re: [PATCH v9 02/13] media: uapi: Add extensible param and stats
 blocks for RPPX1
Message-ID: <20260603125553.GD91369@ragnatech.se>
References: <20260516211320.3041412-1-niklas.soderlund+renesas@ragnatech.se>
 <20260516211320.3041412-3-niklas.soderlund+renesas@ragnatech.se>
 <aiAGtSCqOf65_zlt@zed>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiAGtSCqOf65_zlt@zed>
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
	TAGGED_FROM(0.00)[bounces-63591-lists,linux-media=lfdr.de,renesas];
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
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp,ideasonboard.com:email,messagingengine.com:dkim,ragnatech.se:mid,ragnatech.se:dkim,ragnatech.se:from_mime,ragnatech.se:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 38186637D5F

Hi Jacopo,

Thanks for your review.

On 2026-06-03 12:50:08 +0200, Jacopo Mondi wrote:
> Hi Niklas
> 
> On Sat, May 16, 2026 at 11:13:09PM +0200, Niklas Söderlund wrote:
> > From: Jai Luthra <jai.luthra@ideasonboard.com>
> >
> > Add the scaffolding for the parameters and statistics buffers for
> > Dreamchip RPPX1. The parameters for each ISP function block will be
> > added together with the logic for it.
> >
> > In addition to the scaffolding add a common struct that describes the
> > measurement window. This struct is not specific to any block and will
> > used by many of them.
> >
> > Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
> > [Niklas: Commit message]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  .../uapi/linux/media/dreamchip/rppx1-config.h | 66 +++++++++++++++++++
> >  1 file changed, 66 insertions(+)
> >  create mode 100644 include/uapi/linux/media/dreamchip/rppx1-config.h
> >
> > diff --git a/include/uapi/linux/media/dreamchip/rppx1-config.h b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > new file mode 100644
> > index 000000000000..26627be6f483
> > --- /dev/null
> > +++ b/include/uapi/linux/media/dreamchip/rppx1-config.h
> > @@ -0,0 +1,66 @@
> > +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> > +/*
> > + * Dreamchip RPP-X1 ISP Driver - Userspace API
> > + *
> > + * Copyright (C) 2026 Renesas Electronics Corp.
> > + * Copyright (C) 2026 Ideas on Board Oy
> > + * Copyright (C) 2026 Ragnatech AB
> > + */
> > +
> > +#ifndef __UAPI_RPP_X1_CONFIG_H
> > +#define __UAPI_RPP_X1_CONFIG_H
> > +
> > +#include <linux/types.h>
> 
> v4l2-isp.h already includes this one

Thanks.

> 
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +/**
> > + * struct rppx1_window - Measurement window
> > + *
> > + * RPP-X1 measurement window. Different blocks use a window or multiple
> > + * windows for measurement purposes. This defines a common type for all of
> > + * them. The number of relevant bits depends on the block where the window is
> > + * used and is specified in the per-block description
> > + *
> > + * @h_offs: horizontal offset from the left of the frame in pixels
> > + * @v_offs: vertical offset from the top of the frame in pixels
> > + * @h_size: horizontal size of the window in pixels
> > + * @v_size: vertical size of the window in pixels
> > + */
> > +struct rppx1_window {
> > +	__u16 h_offs;
> > +	__u16 v_offs;
> > +	__u16 h_size;
> > +	__u16 v_size;
> > +};
> > +
> > +/* ---------------------------------------------------------------------------
> > + * Parameter Structures
> > + *
> > + * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> > + * wider-than-8-bit results.
> > + */
> > +
> > +/**
> > + * RPPX1_PARAMS_MAX_SIZE - Maximum size of all RPP-X1 parameter blocks
> > + *
> > + * Some types are reported twice as the same block might be instantiated in
> > + * multiple pipes.
> > + */
> > +#define RPPX1_PARAMS_MAX_SIZE 0
> > +
> > +/* ---------------------------------------------------------------------------
> > + * Statistics Structures
> > + *
> > + * Native RPP-X1 precision. Fields use __u32 where the hardware provides
> > + * wider-than-8-bit results.
> > + */
> > +
> > +/**
> > + * RPPX1_STATS_MAX_SIZE - Maximum size of all RPP-X1 statistics
> > + *
> > + * Some types are reported twice as the same block might be instantiated in
> > + * multiple pipes.
> > + */
> > +#define RPPX1_STATS_MAX_SIZE 0
> > +
> > +#endif /* __UAPI_RPP_X1_CONFIG_H */
> 
> Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> 
> Thanks
>   j
> 
> > --
> > 2.54.0
> >

-- 
Kind Regards,
Niklas Söderlund

