Return-Path: <linux-media+bounces-64060-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id gI0sMEB/JWoFIwIAu9opvQ
	(envelope-from <linux-media+bounces-64060-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 16:25:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF0650C09
	for <lists+linux-media@lfdr.de>; Sun, 07 Jun 2026 16:25:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=posteo.de header.s=2017 header.b="h1Fuk3/l";
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-64060-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-64060-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=posteo.de;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 036E0300F19B
	for <lists+linux-media@lfdr.de>; Sun,  7 Jun 2026 14:25:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C5593A9018;
	Sun,  7 Jun 2026 14:24:58 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198973FFD
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 14:24:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780842297; cv=none; b=n9RHusS0sYv0ugGuiEBEqA/b4p3r78a9aKrL75KDhUVDr7XRduF7ZLqXd9qitKEJ2XyK3JmXuZD6wEEQa+AXyP3HHZdjhP5lOni+3C/coWlLYkw7vmMUpDlkprqkv+oWX0DJsQUNTu0X6e1u5cZuo4035j7Y532A1QpUOoqn6nM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780842297; c=relaxed/simple;
	bh=fUO2J5kOXhpZM7/pSZ7gwPlnBXc6Z65XDTSuXj05Zvw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type; b=bSUq02aZWsKMaAS+q0774E6MM2zSB5s1+t+Y8mc3SjrIT8mmvEjZ9WqZZmaGL8yo0kpLWeu/Po4dqv5Th5VbuAP6EOJpJjohyczP2cg+xs/Dk37zNZYPXGPAilKud+1F3G9/zEaSUMlMj6INGDSHWysYhxkeWwWpug9e1icwP9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=posteo.de; spf=pass smtp.mailfrom=posteo.de; dkim=pass (2048-bit key) header.d=posteo.de header.i=@posteo.de header.b=h1Fuk3/l; arc=none smtp.client-ip=185.67.36.66
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 597E2240101
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 16:24:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=posteo.de; s=2017;
	t=1780842288; bh=fUO2J5kOXhpZM7/pSZ7gwPlnBXc6Z65XDTSuXj05Zvw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=h1Fuk3/lc25gIyd4urP7Q9/oAI43HVRKhbX6+uYIgcALEm1sn208v8oPDlZgLIWad
	 YGXseXPIiac93vdrHtv+6XZ4eTw0WyWWRSK0oGzb513zOhoSI/+rClYkwbMlOAimNw
	 goU/5aQhHxCHIrsoaeNVhdeOpToPtYCBYTrZtUn2v91cEeNIRf82aqCO3Mi6QeS8c9
	 tr4rqMDeAw8OW6irogibITP/x1At6mlyXszEe0YV8DGWhbMP34s+rTGPFeSzkyWikk
	 7A/V2YAYo9+fVYSjiNhU8kgOc9p53bghxXtcby6xpZ3+E0PDKuEktqkFkNxrpifU83
	 VQ9gohz/JSdBw==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4gYHW36Y3bz9rxB
	for <linux-media@vger.kernel.org>; Sun,  7 Jun 2026 16:24:47 +0200 (CEST)
Date: Sun, 07 Jun 2026 14:24:48 +0000
From: Patrick Boettcher <patrick.boettcher@posteo.de>
To: linux-media@vger.kernel.org
Subject: DVB devices for hardware archive
Message-ID: <20260607162446.243b5df2@posteo.de>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[posteo.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[posteo.de:s=2017];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	DKIM_TRACE(0.00)[posteo.de:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-64060-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[patrick.boettcher@posteo.de,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,s:lists@lfdr.de];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[patrick.boettcher@posteo.de,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[posteo.de:mid,posteo.de:from_mime,posteo.de:dkim,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 32CF0650C09

Hello Mailing List,

When cleaning up, I found a whole bunch of DVB (USB and PCI,
mostly DVB-T, but also DVB-S) devices I used for driver development in
the years from 2004 to 2015. Some of them are prototypes or development
variations of final products, some are final, some are so-called
reference designs from chip manufacturers who provided to "the big
names".

Is there someone who would be interested in these? I'm ready to ship
it (at my costs) almost anywhere in the world if I feel that it goes to
good hands.

Don't hesitate to write back.

regards
--
Patrick.

PS: Don't worry, they won't go into the trash.

