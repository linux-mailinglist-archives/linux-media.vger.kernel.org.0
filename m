Return-Path: <linux-media+bounces-54445-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SP6GBTv5p2mtmwAAu9opvQ
	(envelope-from <linux-media+bounces-54445-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:19:55 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C341FD78A
	for <lists+linux-media@lfdr.de>; Wed, 04 Mar 2026 10:19:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1FD563081828
	for <lists+linux-media@lfdr.de>; Wed,  4 Mar 2026 09:17:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2990C395DA3;
	Wed,  4 Mar 2026 09:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="el6NSmx2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ECF6370D5C;
	Wed,  4 Mar 2026 09:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772615862; cv=none; b=ePAkhGDZBaHWJIQlAzR0vU5alcJKMNZURGwIjHwIGINSVKBOP4d1kjDTqwNjZkxseiKvbfmeqiT3kUTjqUSsHJvFpiXivlRtQYrX0zcGrOg0NBUEk9HDUa7wTJ3hJQZgqvnxTMgYj2jDba3+XdaFg/zLcTmHkbOL/sE9s5eTDJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772615862; c=relaxed/simple;
	bh=0WLR1fFDjfupq/vqgaUSuoU9YKz4I1SwftFX5ghFKuU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=pIZnDpM5HUnMFmIkLZYgap0yj8a4GmffwSmoD9RSziiQyt9fnF3nd3avWVwLmLZ38oZBeDCOSjj6iUyRgCLe2B6oNaZjMhvRf4cgMjakFVJH9Y0PUvARQUdAGLoUGGfc/f3bT4HBrRC9gJmBohieZnSL4XOG2EDhHQabUglVrGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=el6NSmx2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8FB98C19423;
	Wed,  4 Mar 2026 09:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772615862;
	bh=0WLR1fFDjfupq/vqgaUSuoU9YKz4I1SwftFX5ghFKuU=;
	h=Date:From:To:Cc:Subject:From;
	b=el6NSmx2OgMspqUoWJHKgqXmaRFTlfYYwNMzL3F8pskIefHaxorzstHTBKoNOKndi
	 YvZTOx3i7Rj5IWmekL6IYbJVOhhKPHS5AB32Y4p2EKltkwEoi2Cd3rckcHZSWjQlgi
	 kPAlV/evgsGxAdGiyPynr7xcoMUKy0dzZf6oJCcQhFAnCL/jGRPeTnFav92hdIPsAX
	 U9Z/+DjhYPYL6xCiiRxVchmp/kP3+kPUrDPb9NP/BGjER0VPm93ZMjP4WjrJROtIQi
	 aXvz4QzuHIds3M0hamUBkjPvZiDCOpT1/YsV/tvhjHBojypT5SCHPdiy8HSn2tA9H5
	 gS5NM0fKyLj4w==
Date: Wed, 4 Mar 2026 10:17:37 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton
 <akpm@linux-foundation.org>, Linux Media Mailing List
 <linux-media@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>
Subject: [GIT PULL for v7.0-rc3] media fixes
Message-ID: <20260304101737.198de4d0@foz.lan>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 56C341FD78A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_ALL(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-54445-lists,linux-media=lfdr.de,huawei];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mchehab@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Hi Linus,

Please pull from:

	git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git media/v7.0-3

For a fix at the dvb-net handler on its MPEG-TS decoder.

Regards,
Mauro

---

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mchehab/linux-media.git tags/media/v7.0-3

for you to fetch changes up to 24d87712727a5017ad142d63940589a36cd25647:

  media: dvb-net: fix OOB access in ULE extension header tables (2026-02-27 10:57:48 +0100)

----------------------------------------------------------------
[GIT PULL for v7.0-rc3] media fixes

----------------------------------------------------------------
Ariel Silver (1):
      media: dvb-net: fix OOB access in ULE extension header tables

 drivers/media/dvb-core/dvb_net.c | 3 +++
 1 file changed, 3 insertions(+)

