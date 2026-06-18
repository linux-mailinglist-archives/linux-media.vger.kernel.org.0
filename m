Return-Path: <linux-media+bounces-65216-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id ADw5E8IINGq1LgYAu9opvQ
	(envelope-from <linux-media+bounces-65216-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:03:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F45B6A1167
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 17:03:29 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=spK4j1+h;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65216-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65216-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 0AD0530B87E6
	for <lists+linux-media@lfdr.de>; Thu, 18 Jun 2026 14:57:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 034E43BFAD0;
	Thu, 18 Jun 2026 14:57:51 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23557083C;
	Thu, 18 Jun 2026 14:57:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781794670; cv=none; b=kc0TNuq3qXigHyvTIbggbgbckbP9ISKSfdrFvtk7ZJW5PLXHdX4bxRh7dVbQu0IpXpG474zR9nGJIjWUN2lBSlJ45+Aoi0qdnHOeekXR5IugnBeXXA7C/f6hnNaVdfkmbTClXJ1FI7+djyHVCdLaidBNO6WYTOmOmYefIyLpY3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781794670; c=relaxed/simple;
	bh=U0PZUbyiQBMArrRR3Faq23INEhjgIx4zmwD0VrrClQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QI6mKqhhKOoJ6kJvBKzDudTpCs3lSXlEDqM5bQYMcR9XL+z/QTrXAG8+w4oomVQa8Gr3sF6axQLJUGirYMZa+zx+wHEbUxayStVmFtD1XgQ49RDhIDlO1EQI9xliLAI/mcrMvkeElxtlc+G4AthM2Ra9tJQlithV6DDbt7HUjjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=spK4j1+h; arc=none smtp.client-ip=213.167.242.64
Received: from ideasonboard.com (mob-109-113-4-199.net.vodafone.it [109.113.4.199])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B1644741;
	Thu, 18 Jun 2026 16:57:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1781794631;
	bh=U0PZUbyiQBMArrRR3Faq23INEhjgIx4zmwD0VrrClQw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=spK4j1+hE2HdBSJmjliKOe/M4+BtkHlS/eT+8ON6b1JO+/iJpgZ5wUSX8sYyjdlcj
	 Y5YcuSdp9JeJ41C/8/b+BjFAtSmUVz6X/czImIG5qsGi2PouPplb8rLfLvpJP0y5Lb
	 QWGDRfOkPnSSOkmgeVqOihyS26SgJCbHWqNo5u+I=
Date: Thu, 18 Jun 2026 16:57:43 +0200
From: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
To: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
Cc: Linus Walleij <linusw@kernel.org>, 
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>, Nayden.Kanchev@arm.com, 
	Konstantin Babin <Konstantin.Babin@arm.com>, Anthony McGivern <anthony.mcgivern@arm.com>, 
	vincenzo.frascino@arm.com, linus.walleij@arm.com, 
	Daniel Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>
Subject: Re: [PATCH v2 0/2] media: mali-c55: Add support for CCM and Gamma
Message-ID: <ajQG0BTLxiJ7PKIh@zed>
References: <20260616-mali-c55-ccm-gamma-v2-0-0f93e9a95d98@ideasonboard.com>
 <CAD++jL=F4HtrT0kL_9KNS1A7hXsyMc9jAgnFv0_rxbcfxBEjOg@mail.gmail.com>
 <20260618-gifted-dazzling-kittiwake-8dde2b@meerkat>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260618-gifted-dazzling-kittiwake-8dde2b@meerkat>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[jacopo.mondi@ideasonboard.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-65216-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_RECIPIENTS(0.00)[m:konstantin@linuxfoundation.org,m:linusw@kernel.org,m:jacopo.mondi@ideasonboard.com,m:Nayden.Kanchev@arm.com,m:Konstantin.Babin@arm.com,m:anthony.mcgivern@arm.com,m:vincenzo.frascino@arm.com,m:linus.walleij@arm.com,m:dan.scally@ideasonboard.com,m:mchehab@kernel.org,m:linux-media@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:jacopo.mondi+renesas@ideasonboard.com,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F45B6A1167

Hi Konstantin

On Thu, Jun 18, 2026 at 10:48:39AM -0400, Konstantin Ryabitsev wrote:
> On Thu, Jun 18, 2026 at 03:28:12PM +0200, Linus Walleij wrote:
> > > Changes in v2:
> > > - EDITME: describe what is new in this series revision.
> > > - EDITME: use bulletpoints and terse descriptions.
> > > - Link to v1: https://lore.kernel.org/r/20260616-mali-c55-ccm-gamma-v1-0-174fe4fedea3@ideasonboard.com
> >
> > Odd changes :D
> >
> > Honestly, I think this is not your fault, b4 should not allow this.
> >
> > Konstantin (Ryabitsev): could we make b4 just refuse to send patch series if
> > this changelog contains EDITME entries?
>
> We already do this in pre-flight check, we just don't stop you from actually
> ignoring the warning, because there can be legitimate situations in which this
> should be ignored (e.g. you're sending a 'quick feedback' email to your
> co-developers instead of making an actual submission).
>
> We should have printed this warning before send:
>
>     CRITICAL: Edit the cover: b4 prep --edit-cover
>
>     Press Enter to ignore and send anyway or Ctrl-C to abort and fix
>
> I don't think we should do a hard refusal here. We've already identified the
> problem and invited the user to fix it.


---
Some pre-flight checks are failing:
  - Edit the cover   : b4 prep --edit-cover
  - Run auto-to-cc   : b4 prep --auto-to-cc
---
Press Enter to ignore and send anyway or Ctrl-C to abort and fix
---

So my bad I ignored it. (the --auto-to-cc is however a false positive,
as I've run in on v1 and manually edited the recipients list).

>
> -K

