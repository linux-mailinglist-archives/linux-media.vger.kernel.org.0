Return-Path: <linux-media+bounces-65841-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id p3UZB2UYQmp00AkAu9opvQ
	(envelope-from <linux-media+bounces-65841-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:01:57 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA4B6D6AD9
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 09:01:56 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=dlfARee+;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65841-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65841-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 0809330492C1
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 06:59:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA203C141F;
	Mon, 29 Jun 2026 06:57:16 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD1D395AD9
	for <linux-media@vger.kernel.org>; Mon, 29 Jun 2026 06:57:14 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782716235; cv=none; b=NNTYdY6+zZV1pqk6UTBROWxv8ZT2uDkbeoPJKINioYHK9JYb7F8TCZEVhiMHVy9feOpRFK1rFCZqZp+OCqnTovrArjCVvYrbcKXsl7U61XMiFBMK48+N+05rLE/zVWa2OOSCAsjMCZRiwWfMoC/prwS2H0EovpJ9ccOgC3PO/Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782716235; c=relaxed/simple;
	bh=Fb+AldgvYoIX0/Z2tP0YMWCb+yO11ylhlhBO2BDAJGc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GTboxnSPLqhO3cG/EUhm1J4qHMymiGfbjFfFhZMPMH9stKZzxJBioQvKvKh+nplR6fnWVflDHS7dpvRSDyQlwD+ft/+Nm31JgYY0f6wYf3W/SPEO/fTmtla5XK9EtzFr/NRUtx39v7v3q9eEK45PEcQK0ytomcZIrpzC6EbP1hU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlfARee+; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E2F1F000E9;
	Mon, 29 Jun 2026 06:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782716234;
	bh=ngzXjOzQ0ZRM+qwpdZ7NtE/tGTrJllQwYJxXQpVyxBg=;
	h=From:To:Cc:Subject:Date;
	b=dlfARee+M5Zq00lemqoGu9aDn3SD2AFXFovi/xZkZIMRmqy6kxrcXhIHUwkgfMUE0
	 pdVFSt7iQbbAojSViS7HX4KFASisKhOxCGCgJ9CvBwfpp+QBXwfDCOMht+ggEr3ONy
	 CuSOUoU142WC2Whw6OUf08SVGSXnVXlv7lYRIeq5JEslzQc8dji+lZnXO5ZGjM8zMg
	 IvtN/BEnMqWFvoYF8n4eAmZClbjdMSxk4vLA6XXBMmu1/C2JIaXkY8jWDfufvaixrJ
	 T8k+UqNqmIynF3Hxcopu5stX/m35km9p5n2IsmlAo+Aws9bs0h90iRIdb6jp40VVqU
	 fP344H52cTqZQ==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv3 0/6] media: em28xx: fix lifecycle issues
Date: Mon, 29 Jun 2026 08:55:48 +0200
Message-ID: <cover.1782716154.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-4.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65841-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCPT_COUNT_THREE(0.00)[3];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 9AA4B6D6AD9

The first patch fixes (I believe) a bug in v4l2-async that
was introduced back in 2013. Sakari, can you take a look at this?

The second patch switches the em28xx driver to use the v4l2_device
release callback, letting the v4l2 core do all the refcounting
until the last user is gone and it is safe to free all memory.

The third patch drops the 'users' counter and uses the internal
v4l2_fh counter instead. The fourth patch switches
video_unregister_device to vb2_video_unregister_device: this
ensures all streaming is stopped when the video device is unregistered.

The fifth patch fixes a use-after-freed, and the last patch correctly
gives the vb2 buffers back to the vb2 framework if start_streaming
fails.

This has all been tested on my em28xx device.

Regards,

	Hans

Changes since v2:
- keep check if sd->asc_list.next is non-NULL in patch 1/6

Hans Verkuil (6):
  media: core: v4l2-async.c: unreg subdev if asc_list is empty
  media: em28xx: use v4l2_device release callback
  media: em28xx: drop 'users' field
  media: em28xx: use vb2_video_unregister_device
  media: em28xx: dev_info->pr_info since dev has been freed
  media: em28xx: requeue buffers if start_streaming fails

 drivers/media/usb/em28xx/em28xx-cards.c |   2 +-
 drivers/media/usb/em28xx/em28xx-video.c | 114 +++++++++++++++---------
 drivers/media/usb/em28xx/em28xx.h       |   2 -
 drivers/media/v4l2-core/v4l2-async.c    |  10 ++-
 4 files changed, 78 insertions(+), 50 deletions(-)

-- 
2.53.0


