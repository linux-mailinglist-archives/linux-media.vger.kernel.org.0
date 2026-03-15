Return-Path: <linux-media+bounces-55820-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id D/C6E6Iut2lENgEAu9opvQ
	(envelope-from <linux-media+bounces-55820-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 23:11:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A813292CA6
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 23:11:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 09A7230069B1
	for <lists+linux-media@lfdr.de>; Sun, 15 Mar 2026 22:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 593D2377576;
	Sun, 15 Mar 2026 22:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="cpdIQPI6"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65305202F70
	for <linux-media@vger.kernel.org>; Sun, 15 Mar 2026 22:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773612697; cv=none; b=hrkuactjuwf1xpZ12crxv9bE1r0TRXpBPQXrz1cvB/3hRxl3iEkgQ63rY7St82aV2bc/E7A7M5o7r1Rcfn7klIoOrH4ZTN4IiIgwogQtbNrBm5B6fvdJ+j9S88kt+VD+pTty0Rg9Dq0n1JK9qBs0UN4Jigg92OLbbywNZqUa9RI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773612697; c=relaxed/simple;
	bh=sOKWYeOJco/5hbH5voBT3+j03RxuzntBQKa4hODvAdA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pVOPI8+PHQBRe+5VaX8vkG6PaMrDET3m3TO220R7aJaE/ElnZK/NaQy+O6o9v+xp9vil5jyHE/J/nJOLf0fm3/MsRg0zA/HGJNpn77S6oWW84iVGFycEycq1pcmhQkHUbXYTc8wAWsh8Xu/9/6yXcdYPviLjWk9mxfSW3kGO9aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=cpdIQPI6; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 981D49A4;
	Sun, 15 Mar 2026 23:10:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773612616;
	bh=sOKWYeOJco/5hbH5voBT3+j03RxuzntBQKa4hODvAdA=;
	h=Date:From:To:Cc:Subject:From;
	b=cpdIQPI6YN5e3cInHP+35kUWeQuLblG5fw0Hn4rGsk0Rfoe5lUPIrEUi6quDOFjo8
	 Z570xe4fE8T0r7JyBdgiMlD/J/MyBGTMeFF52cZFLvT1TNr+E1QaD47zXYYxmhrbLy
	 il9Es7kfTa5z7kWOOWc51Ox5jGFJg+UscIuUWjv4=
Date: Mon, 16 Mar 2026 00:11:26 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: libcamera-devel@lists.libcamera.org
Cc: linux-media@vger.kernel.org
Subject: [ANNOUNCEMENT] libcamera workshop 2026 - Nice, May 29th
Message-ID: <20260315221126.GA520505@killaraus.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-55820-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laurent.pinchart@ideasonboard.com,linux-media@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,openstreetmap.org:url,ideasonboard.com:dkim]
X-Rspamd-Queue-Id: 4A813292CA6
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hello everybody,

With spring approaching (at least in the northern hemisphere), it is
time to announce the next libcamera workshop. After four stops in four
different countries, we will pause our journey through Europe by
extending last year's stay in Nice for one more edition.

The workshop will be organized by Ideas on Board at the Radisson Blu
Hotel Nice ([1]) on Friday the 29th of May. It will be the perfect
occasion to meet face to face with the libcamera community and to
discuss the project's roadmap together. The event will be free of charge
for attendees.

We will be part of the "Embedded Week in Nice" ([2]), a week-long event
that extends the Embedded Recipes conference ([3]) for extra
embedded-related fun. As last year, communities we cooperate with will
be present. In addition to the PipeWire Hackfest, this edition will
bring the Display Next Hackfest to the French Riviera, and the Linux
Media Summit will also be organized in a nearby location on Tuesday the
26th ([4]).

If you would like to attend, please register your interest by replying
to this e-mail, and indicate if you have any discussion topics you would
like to include in the schedule. We will draft and circulate an agenda
after receiving topic proposals. If registrations exceed our capacity,
priority will be given based on topic submissions.

[1] https://www.openstreetmap.org/relation/5130684
[2] https://embedded-recipes.org/2026/colo/
[3] https://embedded-recipes.org/2026/
[4] https://lore.kernel.org/linux-media/92e24f36-d189-4ba8-ad0b-43277bc1aabd@kernel.org

-- 
Regards,

Laurent Pinchart

