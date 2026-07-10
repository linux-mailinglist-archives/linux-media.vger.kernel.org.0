Return-Path: <linux-media+bounces-67307-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id FOMRJosMUWqO+gIAu9opvQ
	(envelope-from <linux-media+bounces-67307-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 17:15:23 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D919C73C242
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 17:15:22 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=Sw1jAGBJ;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67307-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67307-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5DF4E301017B
	for <lists+linux-media@lfdr.de>; Fri, 10 Jul 2026 15:08:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31B502D8DDF;
	Fri, 10 Jul 2026 15:08:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A0C2D5C7A
	for <linux-media@vger.kernel.org>; Fri, 10 Jul 2026 15:08:03 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783696084; cv=none; b=bBsAadkOKvqlTSkRNKxDndMOD9JKf+CLc6YsZMtY9KFICF5Z3ea9lJIy8EEATGSARM7B+qkQB84HzW77ibyxevY4SCdMPMAppXju09bRII9CkWB+OcWm2DYexHWFTUefAPfWSaj3w1L8DkKGvxn4JknT5/ij42C6quyA7NNBRZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783696084; c=relaxed/simple;
	bh=u76B2sZqmDfvNKk8fZ48vL80K3KvqjzSLiCsUfBnnOA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=OSt97WlLKWUvnPDnYqzdPjjIpPvaiZm650iJdPX643KZ7CobAe+cT2VxhBh2h4dq2MJD1KuqhzJVg229f+QB+bH+peWI6rBfT13/suHNBgQzYJWJ4hjYlAz8a9BI4yQYU/9poq//Ohv+rxaJCGeI/na2NyVSiVKa7wXbFf0ZAB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sw1jAGBJ; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDE3F1F000E9;
	Fri, 10 Jul 2026 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783696083;
	bh=yC4Kfi1fjsTWdBbHQtAG8DbMjs4FRnQ1l33xZJ44dTc=;
	h=Date:From:Subject:To:Cc;
	b=Sw1jAGBJ1uORNTCqdxw9YOrf5EtHHZX7FAA+NEge04U7LYzP4RK+tkmuVet5b2dU+
	 Ai0fHyeFvyr7KTM560X7kpUOXdU1uNeeP2Xh47sRJD9Tz+9w3x1BqIlnYYZPoAZfy8
	 88imEi1ZqrGE2N9ToRabDTW60DW/oB1wDqZj2cj9wObRO39Al9SqJ04gBo9FmsS9hc
	 3wbGxz7vQ81kTixZeSb2yP3czEQMPwCBruuuq6LgQVMScPBgUeJubhBmugbJzeWlES
	 ofTBV7J8YbjVmdMwjUvz3esH/EpEI+cJzuwqrarTI3d453XXf8bRtJ7Fcz/9hSUdjO
	 nubJm0zL2F33g==
Message-ID: <e94a6342-3731-470e-8c9b-370338daa7c1@kernel.org>
Date: Fri, 10 Jul 2026 17:08:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: [GIT PULL FOR v7.3] media: em28xx: lifetime fixes
To: Linux Media Mailing List <linux-media@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-5.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67307-lists,linux-media=lfdr.de,cisco];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWO(0.00)[2];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mchehab@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	URIBL_MULTI_FAIL(0.00)[gitlab.freedesktop.org:server fail,sea.lore.kernel.org:server fail,vger.kernel.org:server fail];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,gitlab.freedesktop.org:url]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: D919C73C242

This series fixes lifetime handling of the em28xx driver plus some fixes.
Hopefully once this is merged people will stop posting bad patches trying to fix
the lifetime issues.

While working on this I also found a small v4l2-async regression which is
fixed in the first patch.

CI: https://gitlab.freedesktop.org/linux-media/users/hverkuil/-/pipelines/1704107

Regards,

	Hans

The following changes since commit 85aa8122459eb96d2f3e0d32af436cf8d0961f8f:

  media: drivers/media/dvb-core: CodeStyle for dvb_frontend_open() (2026-07-10 14:17:56 +0200)

are available in the Git repository at:

  git://www.linuxtv.org/hverkuil/media.git tags/br-v7.3d

for you to fetch changes up to 2848eaa6a2066985146bc3bb22fdb9d44672767e:

  media: em28xx: requeue buffers if start_streaming fails (2026-07-10 15:41:27 +0200)

----------------------------------------------------------------
Tag for for-v7.3d branch

----------------------------------------------------------------
Hans Verkuil (6):
      media: v4l2-async: Unregister sub-device if asc_list is empty
      media: em28xx: use v4l2_device release callback
      media: em28xx: drop 'users' field
      media: em28xx: use vb2_video_unregister_device
      media: em28xx: dev_info->pr_info since dev has been freed
      media: em28xx: requeue buffers if start_streaming fails

 drivers/media/usb/em28xx/em28xx-cards.c |   2 +-
 drivers/media/usb/em28xx/em28xx-video.c | 114 ++++++++++++++++++++++++++++++++++++++++++++----------------------------
 drivers/media/usb/em28xx/em28xx.h       |   2 --
 drivers/media/v4l2-core/v4l2-async.c    |  15 ++++++++--
 4 files changed, 83 insertions(+), 50 deletions(-)

