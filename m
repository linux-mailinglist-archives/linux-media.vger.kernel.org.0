Return-Path: <linux-media+bounces-62128-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GG0wIqhSDGqmfAUAu9opvQ
	(envelope-from <linux-media+bounces-62128-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:08:08 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DAFB57E571
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 14:08:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D4EF6308C9F8
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 11:59:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD584ADD87;
	Tue, 19 May 2026 11:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rhpZfgD4"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825AB3F1AC9
	for <linux-media@vger.kernel.org>; Tue, 19 May 2026 11:59:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779191982; cv=none; b=Cj/npo3tFzUyxdlcCVFkIXSpIwnuOeGoM3SafvImMLtdQPVxxumkm02sWFjxfg7p0s41MYqCu1/YMTgu+CvBm/BV3CyvdoGKYBVIyCGEPNHpBi7kDdo+hC5YsQUdwa2S57npCJXC5ERdTl/LgZEl6IR4GpEXLd/QjRjos3KAf/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779191982; c=relaxed/simple;
	bh=383B+m8HkKLQbnCqGyYcuRDD3acocEzN6VJi13NHvlI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HKXSrUe8BKal3oG5NFmzOVg9dqn3h2eh4/J6ijNK/16fi5S9dXtllFTM36e3ZGZiHaaTCbTcOmEqUZEQzXNPdgf633zjS5d9FEzJackt5vbQmk1UrIlVFXcXH78c45MUJkPqGwqj2rPTR/xsOzuvBSQ77VpCQY0VbpkwkWOoZjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rhpZfgD4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 690C5C2BCB3;
	Tue, 19 May 2026 11:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779191982;
	bh=383B+m8HkKLQbnCqGyYcuRDD3acocEzN6VJi13NHvlI=;
	h=From:To:Cc:Subject:Date:From;
	b=rhpZfgD4/3cuEYRC8SPsHbj5tfFUMnU++YAHlP2rst4GiaYuuE3K0yfDwtTSAgZgQ
	 nfC726d2p1HPrDeaAP+Zs6GfL/OfnfSybtsS7GXLN3cPC6mJYeLXnj3csYl2d13nq9
	 cKYANy3NMXmkk/ejQlkim/AHsovDSweppUPDtpVM/jQPPUIuw76q/R1kGMDIiTqRm4
	 CBHN8v7Ua5d9fXR+QJLR6CistdkicjjvK7O9mPfz5LMrdx6WibgOzT4qUsI4kimih7
	 dp6P0bLhqJCEG45h2a9pnxvselwHgFuOC1YlmIcFabF4kE48eue9FdGiDb1265LQgp
	 M+Sbhhokd7YyA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauricio Faria de Oliveira <mfo@igalia.com>
Subject: [PATCH 0/3] media: em28xx: fix lifecycle issues
Date: Tue, 19 May 2026 13:54:40 +0200
Message-ID: <cover.1779191683.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62128-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5DAFB57E571
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The first patch switches the em28xx driver to use the v4l2_device
release callback, letting the v4l2 core do all the refcounting
until the last user is gone and it is safe to free all memory.

The second patch drops the 'users' counter and uses the internal
v4l2_fh counter instead. And the last patch switches
video_unregister_device to vb2_video_unregister_device: this
ensures all streaming is stopped when the video device is unregistered.

All this still needs to be tested on real hardware, but that will
have to wait 2-3 weeks.

Regards,

	Hans

Hans Verkuil (3):
  media: em28xx: use v4l2_device release callback
  media: em28xx: drop 'users' field
  media: em28xx: use vb2_video_unregister_device

 drivers/media/usb/em28xx/em28xx-video.c | 96 ++++++++++++++-----------
 drivers/media/usb/em28xx/em28xx.h       |  2 -
 2 files changed, 54 insertions(+), 44 deletions(-)

-- 
2.53.0


