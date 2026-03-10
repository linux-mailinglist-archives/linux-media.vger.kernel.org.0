Return-Path: <linux-media+bounces-55243-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aGMIHWmQsGkukgIAu9opvQ
	(envelope-from <linux-media+bounces-55243-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:43:05 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E212586E7
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 22:43:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AD2E0302989B
	for <lists+linux-media@lfdr.de>; Tue, 10 Mar 2026 21:42:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C095C3F0ABA;
	Tue, 10 Mar 2026 21:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="HwIp2Gov"
X-Original-To: linux-media@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EE63BE632;
	Tue, 10 Mar 2026 21:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773178972; cv=none; b=qChrFiqwgeJAIa9R+RD9mruoD3ybnBdz60qfjR0rhzy2mQ/MypWJ4Lm/AT6yuKLWtMM2N0aLbE1m6zICChH7IiNarnPedyd1gfWaH3pNIp49iR0AllC+9eouwhCCXoH1gvfSNIz2QOZrc43K+wcO9x9hREOZ2coQ43Hw7DfvLf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773178972; c=relaxed/simple;
	bh=y91edeQ8o1/X5XSGLJZITFd+JTr6VrnoUG18G8144I0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P5AcJPqyKf5Tr6KnouPuk7V8D3a/5Uhv0Ke2SkubN/gBPhd8F25zCQWTL9jOCsQ2WRstW0CnUY08Fb2k+UiUk+l3qVy/ncRrMpVqixzLZqMqYK4FXXfyl2vZ/VfjnAj0C9HjtCcU8zNNP5sjWs8R7Mbg5FDp7EGjxuPrOeP1z/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=HwIp2Gov; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=2f8R5GEyxkZQIaf64bF4zBHCOUbaQ3TEBtHbXujsVTs=; b=HwIp2Gov4Vq8cd4o8z42qkD5qX
	m94Yotc3CL7E1pNYm9Ix9lffgY3gHInitMQayEaOhwQMZcMFc/PgBVjgi2gpyAcEg90EgwigfbEsA
	+C6sb/M7WpXY2IfRQkDu22vPgylEym7pQhl+IyUq2X7g4cgU7nzhax5STJ3biRzAQ9xo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1w04qH-00B5j1-QZ; Tue, 10 Mar 2026 22:42:17 +0100
Date: Tue, 10 Mar 2026 22:42:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Sanjay Chitroda <sanjayembeddedse@gmail.com>
Cc: jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org,
	p.zabel@pengutronix.de, tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	johan@kernel.org, elder@kernel.org, gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de,
	kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org, ribalda@chromium.org,
	straube.linux@gmail.com, dan.carpenter@linaro.org,
	lukagejak5@gmail.com, ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
	s9430939@naver.com, tglx@kernel.org, mingo@kernel.org,
	sun.jian.kdev@gmail.com, weibu@redadmin.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, skhan@linuxfoundation.org
Subject: Re: [PATCH 7/7] staging: rtl8723bs: simplify cleanup using __free
Message-ID: <02b2587c-c885-48b0-90af-0b8d65a3a593@lunn.ch>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-8-sanjayembedded@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310200513.2162018-8-sanjayembedded@gmail.com>
X-Rspamd-Queue-Id: 76E212586E7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[lunn.ch,none];
	R_DKIM_ALLOW(-0.20)[lunn.ch:s=20171124];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-55243-lists,linux-media=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[43];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,mediatek.com,gmail.com,collabora.com,linuxfoundation.org,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,linaro.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,lists.linaro.org,lists.linux.dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andrew@lunn.ch,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[lunn.ch:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,cisco];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lunn.ch:dkim,lunn.ch:mid,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
X-Rspamd-Action: no action

On Wed, Mar 11, 2026 at 01:35:13AM +0530, Sanjay Chitroda wrote:
> From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> 
> Replace manual cleanup logic with __free attribute from cleanup.h. This
> removes explicit kfree() calls and simplifies the error handling paths.
> 
> No functional change intended for kmalloc().
> 
> Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 13 ++-----
>  drivers/staging/rtl8723bs/hal/sdio_ops.c      | 37 ++++---------------
>  2 files changed, 11 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 8d259820f103..2badf7d1aec4 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c

rtl8723bs is a networking device.

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

says:

Low level cleanup constructs (such as __free()) can be used when
building APIs and helpers, especially scoped iterators. However,
direct use of __free() within networking core and drivers is
discouraged.

Please drop this patch.

You might also want to check other subsystems and see if they have
similar policies for these magic operators.

	Andrew

