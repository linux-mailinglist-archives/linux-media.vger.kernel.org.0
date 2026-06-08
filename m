Return-Path: <linux-media+bounces-64254-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id rWszCmE2J2qFtQIAu9opvQ
	(envelope-from <linux-media+bounces-64254-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:38:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF7865AB40
	for <lists+linux-media@lfdr.de>; Mon, 08 Jun 2026 23:38:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=ideasonboard.com header.s=mail header.b=nouI7Gki;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64254-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64254-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=ideasonboard.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 624C1303131A
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2026 21:38:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B231D3AF667;
	Mon,  8 Jun 2026 21:38:00 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045B926AE5
	for <linux-media@vger.kernel.org>; Mon,  8 Jun 2026 21:37:58 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780954680; cv=none; b=rO7aQq5UiUP6vLxxi9VMtUP+5NFmCO30dluwCIXvmCPhD9X7g3BLic/WxVASTbbnCZu60vKDp+OPouJ0HBGqeUr38La5gnjwWJDz1rtpt7mTHck7bip7JNDYCyKFsu5iWpBURFrTtfeI03M//js1oT8MQKM/vgMoPBukRWQVlLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780954680; c=relaxed/simple;
	bh=/VCdDEUSjZrrAPzYvYo4PWnOUFtW1cFNk/Sviq8Dk9E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QZaD8VuRrvx9cGbB+SE3FecikZYV9R+JCc9a6KZwRcLM/x6FmPzeblxW26HFNd+vCW2OQKoVRDNmMc82d3ZWrIAp1ub5fqCer7JYkaDmJJbaRR469Idng/EJh81i0Vd6eBclN9aZovWvtLDnPyJg4hQ6tdcBvnAHApechnuqfMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=nouI7Gki; arc=none smtp.client-ip=213.167.242.64
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1704A8F;
	Mon,  8 Jun 2026 23:37:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780954649;
	bh=/VCdDEUSjZrrAPzYvYo4PWnOUFtW1cFNk/Sviq8Dk9E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nouI7GkiiEZMZrUjr+PRWt2keOlNbRZTBjTrBBdZ1XjwoJ3aM+/AArxinlshcY6D5
	 QUM+WotY3tQTUXZTDHIfHcB5RCrT+HxMFt/wCRcKAv9kQs9JZiUrvHIa6JFk7zAq6K
	 fruUWSYakzm8nO77XsFa7SXznE7MC7UXyudCUJiE=
Date: Tue, 9 Jun 2026 00:37:55 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Nicolas Dufresne <nicolas@ndufresne.ca>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Jai Luthra <jai.luthra@ideasonboard.com>,
	Linux Media Mailing List <linux-media@vger.kernel.org>
Subject: Re: Adding Linux-media to Sashiko
Message-ID: <20260608213755.GA985627@killaraus.ideasonboard.com>
References: <CANiDSCunFkyGqz5n15ezW0LHCHqU92g6xeVK43zRcqohS-QsdQ@mail.gmail.com>
 <177998407808.933414.10133969094530331086@freya>
 <CANiDSCuMUdh6MWw5O+nhFJzexMcGJRTZ38Fq1anihe7=zu5K2w@mail.gmail.com>
 <21425d0e18fd0afdfccef2a83cc5efaa153d5dbb.camel@ndufresne.ca>
 <CAGb2v66HTeQc1UZHCXg_v1yD=_CbYUTfXRSLqK8NV8HO=oyvGA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGb2v66HTeQc1UZHCXg_v1yD=_CbYUTfXRSLqK8NV8HO=oyvGA@mail.gmail.com>
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-64254-lists,linux-media=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:wens@kernel.org,m:nicolas@ndufresne.ca,m:ribalda@chromium.org,m:jai.luthra@ideasonboard.com,m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,killaraus.ideasonboard.com:mid,vger.kernel.org:from_smtp,ideasonboard.com:dkim,ideasonboard.com:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 6CF7865AB40

On Mon, Jun 08, 2026 at 11:24:17AM +0800, Chen-Yu Tsai wrote:
> On Sat, Jun 6, 2026 at 2:24 AM Nicolas Dufresne wrote:
> > Le jeudi 28 mai 2026 à 23:44 +0200, Ricardo Ribalda a écrit :
> > > Hi Jai
> > >
> > > I thought that we agreed to experiment with cc to the list to evaluate
> > > the quality of the review and then decide how to configure it.
> > >
> > > But I might also be miss-remembering it.

My understanding is that we decided to *not* get those reviews sent to
the list, *nor* to the author. Hans confirmed this on IRC. I have
reported the issue in
https://github.com/sashiko-dev/sashiko/issues/252#issuecomment-4651247882
and Roman has reverted the addition of linux-media for the time being.

Hans is working on preparing the media summit minutes. If anyone
disagrees with Hans' and my understanding of the consensus, let's
discuss it when the minutes will be posted, and refrain from enacting
any change in the meantime.

> > > The current PR in sashiko has landed, but it is very easy (and fast)
> > > to upload a change.
> >
> > I was pushing against having the emails during the summit, so I am equally
> > surprised. We can of course let it run and see how it goes, first thing I notice
> > is the amount of "existing issue" reports it adds is quite big. My a worry is
> > that people with low knowledge might try and fix them all, which just make the
> > process stalled until sashiko gets quite about a specific code base.
> 
> Unfortunately this is already happening on other lists. In the case I
> dealt with the submitter just tried to fix all the subsequent issues
> without an actual deep understanding of the problem. It didn't help that
> the submitter didn't have the hardware (or experience with the platform)
> and was just doing cleanup fixes. The end result was that the commit
> messages didn't really match reality.
> 
> I suspect that the media drivers are much larger and therefore harder
> to fix by drive-by contributors like this. So as you said it could just
> stall the whole process.
> 
> > > On Thu, 28 May 2026 at 18:01, Jai Luthra wrote:
> > > > Quoting Ricardo Ribalda (2026-05-28 20:41:56)
> > > > > Hi
> > > > >
> > > > > As we discussed in the media summit, I just created the Pull request
> > > > > to add linux-media to Sashiko.
> > > > >
> > > > > https://github.com/sashiko-dev/sashiko/pull/224
> > > >
> > > > Thank you. Does the cc option mean the list will get emails from Sashiko as
> > > > well?
> > > >
> > > > I thought the consensus during the summit was to keep the replies only to
> > > > the author (and maintainers can check sashiko manually) but maybe I'm
> > > > misremembering it.
> > > >
> > > > > Please let me know if something does not work as expected

-- 
Regards,

Laurent Pinchart

