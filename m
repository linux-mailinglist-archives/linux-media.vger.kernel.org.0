Return-Path: <linux-media+bounces-65020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6G8xN5tMMWoOgQUAu9opvQ
	(envelope-from <linux-media+bounces-65020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:16:11 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0F368FCEC
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 15:16:11 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=fvDGooiK;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65020-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65020-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B629302BFEB
	for <lists+linux-media@lfdr.de>; Tue, 16 Jun 2026 13:16:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10BD12D780E;
	Tue, 16 Jun 2026 13:16:07 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94DA82C0F69
	for <linux-media@vger.kernel.org>; Tue, 16 Jun 2026 13:16:05 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615766; cv=none; b=YIavQ2RRKEd6GlRKImRHlaj0agfJJXtG0iK51WXPTlP0mpUhChJEhXppAcwFH+FnAop5NPriI3ehRGAOQKs1nevj9P0mIVeyOkWvVDLvCb5+aHuRA+obwW2FK3fQh+5KCUa+tZtCPqKobDlNl1K92XtTIdHmGv7R/7+LSCACcro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615766; c=relaxed/simple;
	bh=tbuZYRFxR0SNrnUv3pyfAyT8StDufh7d+gqUtmMdbzw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LQskj9+QYUHtKaNs7zYMVJB2OwEDI9aqBpWIX7S+vQj4v5OR73z9demZajLXEw8qt3ac5PPeoRVL0w0dAjDhkP6sMdLUP29wp1JkezhTGoHy6E41KEnpkUrN9YuqRlWndAba6TLZpgewmL+Hr6goKv4Xq/Ujn0XrfDEuNx8j8DQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fvDGooiK; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 982E31F000E9;
	Tue, 16 Jun 2026 13:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781615765;
	bh=0Z0NHb0EMj7g6GIMmpJoV+JGRxQfI2+0s9My7yJr+JQ=;
	h=From:To:Cc:Subject:Date;
	b=fvDGooiKaEN+yxUoK1+cZi3oNpXbvGxByIG6fr5X02Lovo5Wst6giuXRInkqud9XF
	 4D1McrdF6GHjux6IG6LdbMz6pXnSKcEWwrNHoXNzpIho5St0idUH8ZFHZWaRW0Io5+
	 R/waOauy2o/Gvj4iJRaz2A8OhkvRe/T30Qo7BmPVl+COu/YdMtGKzuMmqJZJPfwHif
	 xx6nkE3H6Pvah8iHKo7f41zHvA5RokEK+A0T5bRWJps7Y0gOmo/JFBmXfCKI5l55HI
	 RYkosn9gU/wnW1zqWPsT7zV66yYrGGOYucWEV187TjJQLh4fuDWgJZHS8y+qDrOs8f
	 hs8CyfLOAbbFg==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCHv2 0/6] media: em28xx: fix lifecycle issues
Date: Tue, 16 Jun 2026 15:10:26 +0200
Message-ID: <cover.1781615432.git.hverkuil+cisco@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-65020-lists,linux-media=lfdr.de,cisco];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:mfo@igalia.com,m:sakari.ailus@linux.intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4A0F368FCEC

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
 drivers/media/v4l2-core/v4l2-async.c    |   4 +-
 4 files changed, 74 insertions(+), 48 deletions(-)

-- 
2.53.0


