Return-Path: <linux-media+bounces-65209-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id NAFBBB/5M2rpJwYAu9opvQ
	(envelope-from <linux-media+bounces-65209-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:56:47 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 760EB6A0BE0
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 15:56:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=ENxJIEAO;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65209-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65209-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3D303300C596
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 13:52:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5E263EF678;
	Thu, 18 Jun 2026 13:52:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A56C19E97B;
	Thu, 18 Jun 2026 13:51:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781790720; cv=none; b=XbSiCjxyqMfNmPooi3oTCOfZIOP0wSHMkVJ95BuaScSipQR415wW9PwlS94YK+xbkQKxyvKcTogvKojbNfct3quY35MktSxgOvHe5Hcv3MdPAHCuGZOV6BYgLKQDKh9lfpeRVJrKPucTA7v72Iu2p2qrm9/hnqkaiaEWOyBjsJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781790720; c=relaxed/simple;
	bh=poBv80gi0BCFku+Vz2fDoeaP1JSqj8w6eeQ/vYv6uMc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ua6uP4FR4SNC5xKaJpmA+8P7LkV2v52YTnMuoRHmBGPxBAA/ZFfeYHHqUUWpTUR+v/3iiq6edN0DUCzK8h1nytYpxdUIObN1sLdlDgH6Oj8m5p93o1C4cx4Tdkm0ABvhekQZ/00dhTQ1dWwTmkc/jNxbL9FbzhQbG/zm0aKBBPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ENxJIEAO; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-4-199.net.vodafone.it [109.113.4.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 4DC7E2F8;
	Thu, 18 Jun 2026 15:51:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781790682;
	bh=poBv80gi0BCFku+Vz2fDoeaP1JSqj8w6eeQ/vYv6uMc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ENxJIEAOgJHDcZdrIZKbo6UUfl+cLsnv/PLKDaXLMS3il7TKw40yij7pphW8z4Qr9
	 sr3u8XRfkU/H0ZhpMCxlFxNcjYhQTXJiLJJ16OkTimy85djcmn3sV/z6rvp5iSp9Fb
	 uoFHY1ioW02RudtbzCNdLZbJmS4y+RU5Xuesc2OU=
Date: Thu, 18 Jun 2026 15:51:53 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, 
	Konstantin Ryabitsev <konstantin@linuxfoundation.org>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: mali-c55: Add support for CCM and Gamma
Message-ID: <ajP3Vkoj0jk3aly9@zed>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,m:konstantin@linuxfoundation.org,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65209-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:email,ideasonboard.com:from_mime,zed:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 760EB6A0BE0

Hi Linus

On Thu, Jun 18, 2026 at 03:28:12PM +0200, Linus Walleij wrote:
> On Tue, Jun 16, 2026 at 4:36 PM Jacopo Mondi
> <jacopo.mondi@ideasonboard.com> wrote:
>
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com
>
> Odd changes :D
>
> Honestly, I think this is not your fault, b4 should not allow this.

Ahah, indeed it is my fault instead as I forgot to update the entries

If helpful:

- Address checkpatch warning in mali_c55_params_gamma() (I didn't run
  b4 prep --check, sorry :)
- Remove unused member 'rgb_enable' from uAPI

>
> Konstantin (Ryabitsev): could we make b4 just refuse to send patch series if
> this changelog contains EDITME entries?

That would be nice!

>
> Yours,
> Linus Walleij

