Return-Path: <linux-media+bounces-65214-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id yb8bHlAFNGobLQYAu9opvQ
	(envelope-from <linux-media+bounces-65214-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:48:48 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACD06A102A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 16:48:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=linuxfoundation.org header.s=korg header.b=iYfLQCE4;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65214-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-65214-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=linuxfoundation.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 37129301D59A
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:48:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C000E35F182;
	Thu, 18 Jun 2026 14:48:42 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53E162D594F;
	Thu, 18 Jun 2026 14:48:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794122; cv=none; b=NTln4aJtW8uXubpq1TuiE3xLFMxMfHY3FAMo5u7iMKNtKQbQHM1n53q+fusbGPIvJ4cyxZygtCnVW088TtDIqotcKZPIUUWfDWKmvO+BoCisMj9UaTnwdSW0owrMfenOqx0I41WcLN+QQMdcFhaFv5lbXElRy3qH60ZA4Oob3SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794122; c=relaxed/simple;
	bh=QWpZ2puXzi9d7PBN765ayjIP1YHoRgs/hU6eoyVCtaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FDnx3eJp1UXEK0LSDlM1FXWnW+MdI71qFzPFqu/GDACWxidZDfI/Uak/ZeGaR0Q0fU5LUeCD4C9cjvqC3h1fbZ0HQrbJsSb46yHLEOVcSRg8wm14ceeITC571WEBDALlR3Q+RNO5bp2TtZ57QiggTNqgF7iiTSoe0BF3DEiujxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=iYfLQCE4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C65B71F000E9;
	Thu, 18 Jun 2026 14:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781794121;
	bh=TgGwlGOkr468osmcn/a1DKpMbn8VWjLrXEPbfU64vJ4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iYfLQCE41X7tYD/eEdeG9S8ENHusJ8ZrNrEV8bvyknUTVNUs3zKeERkTvhdMujocK
	 LxHu2H10X0mJZhYMzTSH9aFkqFsKwOwY5Jt3qKJ+iqYF27BQS2JO1TCrUYAxAyuB8n
	 9kL02O7gZBkpnJlLbLHfnKTMBdi20cL25FPpCZ6k=
Date: Thu, 18 Jun 2026 10:48:39 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: Linus Walleij <linusw@kernel.org>
Cc: Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: mali-c55: Add support for CCM and Gamma
Message-ID: <20260618-gifted-dazzling-kittiwake-8dde2b@meerkat>
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
In-Reply-To: <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=korg];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[konstantin@linuxfoundation.org,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65214-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[12];
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
	FROM_NEQ_ENVFROM(0.00)[konstantin@linuxfoundation.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,vger.kernel.org:from_smtp,linuxfoundation.org:dkim,linuxfoundation.org:from_mime,meerkat:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0ACD06A102A

On Thu, Jun 18, 2026 at 03:28:12PM +0200, Linus Walleij wrote:
> > Changes in v2:
> > - EDITME: describe what is new in this series revision.
> > - EDITME: use bulletpoints and terse descriptions.
> > - Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com
> 
> Odd changes :D
> 
> Honestly, I think this is not your fault, b4 should not allow this.
> 
> Konstantin (Ryabitsev): could we make b4 just refuse to send patch series if
> this changelog contains EDITME entries?

We already do this in pre-flight check, we just don't stop you from actually
ignoring the warning, because there can be legitimate situations in which this
should be ignored (e.g. you're sending a 'quick feedback' email to your
co-developers instead of making an actual submission).

We should have printed this warning before send:

    CRITICAL: Edit the cover: b4 prep --edit-cover

    Press Enter to ignore and send anyway or Ctrl-C to abort and fix

I don't think we should do a hard refusal here. We've already identified the
problem and invited the user to fix it.

-K

