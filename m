Return-Path: <linux-media+bounces-67057-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id trFkC4mFTmrwOQIAu9opvQ
	(envelope-from <linux-media+bounces-67057-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 19:14:49 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 90896729123
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 19:14:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ngkZF6Lb;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67057-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-media+bounces-67057-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EBBE33030751
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 17:09:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05E5F349CDF;
	Wed,  8 Jul 2026 17:09:02 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C56C4963B2
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 17:08:54 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783530538; cv=none; b=h8KqYrQRBGb9T7PbLWJeAb69tVkWU5GRXRH9IOgS/ton/ETKIHZ3cZqpD0V6qJ6zBH5fOTVoN2qY+L7nvL7yWqqrPn/oAGv/hstuEkcmo/KM0aFZowne9MZ5zCHqKXtdCJYxq6q60wkTjuGlTo6qT8AabX0FkjSPkrGEK9oSmGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783530538; c=relaxed/simple;
	bh=EM7/zjZ1vYPWTmoE2am+DsWmjZMuw17awqS7UFK3Ydg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h2SdyNXiJZuM2sXhEKPU35hblpbHzFlqeywkp48av2SDtbFb8zHcqmxcdUrCICp9cpI0HUVkwqIV/J0rbgGEnNRycDDe9nUCc60Opf6UWyELYHPm7bofK7xnz3dbGtSBZUCfdUrLrSOvkXLnLzvhPh0QqC2VwIsD+OJi9iHv1wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ngkZF6Lb; arc=none smtp.client-ip=209.85.214.170
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2caced6038eso1419765ad.0
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 10:08:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783530533; x=1784135333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=LZAEPe4mQszZgyNJtC3nsbPxwnT67lL3aUmXfl+TtbE=;
        b=ngkZF6LbauVYE61wHhr+RV9sZk+dg5I2WYfzXlxh6yH/c6PW/tGB9+rzdbwM0a0sc+
         YsERBY2/gHDLyGzrW1ad3/TnuME1aSnOpf2GbqB4eaAXS9uo1ERLErB+zbNA2Sttukvy
         fLT2I21/pf6mbPgZXFNsAiPyHHq6OwR68sIZdiRVAd+wwQ4SV98R/EmZ6HQ0GziIBeKA
         lKEsSxdg4LFrGmPsc9cylQaaLyJkdKpZge9W7mBa0fAZrUhEfn5BggJeh2j0+IJLnOJl
         FpcK3S/Q9wlR92jQadf06WnLmBmf+4JXpUA8rNLa+liidfPU3Z8uqdxo57lM89/0Faor
         tdTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783530533; x=1784135333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LZAEPe4mQszZgyNJtC3nsbPxwnT67lL3aUmXfl+TtbE=;
        b=QCxBcQSSXEXEqRRFnobacdGBKIjI5bcfWjdjy4woJCXShskI5ZyCb6IbNvD7kuzvSZ
         0NHs+DozAePJqY5hTHb70H7hDoQYA6UHFLi7mi6NW0StnHoB5Kn5ULdcDMIhxPUeqAyy
         J55ylQaYU7VIA5jFDW13UAjRx8OhK4+HzMghXDfCTBPOfRrKJcefIxxWUIdrXCkZZxjw
         HzJrO2W8q6bJi8c8WjrqKBlapOnZMOz6Nw+s1fdG32Xjjq6ibtoZtzx1ejs1AotO7l2N
         75TriiyGV2nfcyINvDrIiuWdaXABv9tnqr5oxtlOeuf5Gn2bAItkyD4dkIDNOvdLJGfp
         N5oA==
X-Forwarded-Encrypted: i=1; AHgh+Rom04n5ULkvXjqsr9k3evRWRZw6g2hnYrZVpeYFdD3mahgW0wBdOQPX8niNqS/3epjsN3vm3RtVh7VNNA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0G3s9IHXywtGFnIhdKMLV1+iHybApN6PRqhS950uPldDbXPTY
	onbl3JAAEPRvOGvKvR6nGoIuxgqpzw2XDru5VjKdQLFMU9Y67aKvPO0t
X-Gm-Gg: AfdE7clxo+27sz8xfsOHbZsqF7zNr+HVbW6jcIhDim6wqYWdpZWM2G3CQdyV5OOIwS6
	0auU07e2Y3QvjomCdohti8/BUSdEAPtOCJ5NiKRt6Y6OtWgEpKHfZ86qsijxxvU24box610+fdx
	6BwSLzuKNc0b/pF87h7Ad2yUGe/UK8uapuWmZlxeb27pEp8gMQyYPDB4bY2fdkFZoyhzSGM+nS2
	mjFUDIfXa6/QNLRK5ozFLDp1v5CfEqOJeslF1OmwvflFnNrsFvT3WGy7BcVTjbZ6gvI0TJhlSIP
	9gSPGxC4wYQPUwd1mj1m2lap9A4fhdTGTnXzxqLejnAbmgsUDJRoNN+0FLX5YWFEBRWQAgn5Cza
	Srfp295P7f+kzvnLLiQlFPIpAjv+A9tUTSBvbeGcFsgrjQxvNYZJtzQPCrdps5qWwPL6HrzpoRA
	qLJNmTCm9sLLMJRyYsrNwQIZOleBMLva9ot5sSG+lq4xo=
X-Received: by 2002:a17:902:ce82:b0:2ca:9a9f:bb10 with SMTP id d9443c01a7336-2cccadc6e24mr73473085ad.22.1783530533340;
        Wed, 08 Jul 2026 10:08:53 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b659666e7sm26602154c88.7.2026.07.08.10.08.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Jul 2026 10:08:52 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi+renesas@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v5 0/4] media: renesas: Add missing media_entity_cleanup()
Date: Wed,  8 Jul 2026 22:38:44 +0530
Message-ID: <20260708170843.55076-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-67057-lists,linux-media=lfdr.de];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi+renesas@ideasonboard.com,m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,m:jacopo.mondi@ideasonboard.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com,vger.kernel.org];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 90896729123

This patch series addresses missing media_entity_cleanup() calls across
multiple Renesas platform drivers (rcar-csi2, csisp, rcar-vin, and
rzg2l-cru).

While media_entity_cleanup() is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Changes in v5:
- Removed "in most cases" from all commit messages per Jacopo's review.
- Fixed missing empty line before Signed-off-by across the series.
- Patched the error path in rzg2l_cru_media_init() to properly cleanup
  resources on failure per Jacopo's suggestion.
- Collected Reviewed-by tags from Jacopo Mondi for patches 1/4, 2/4,
  and 3/4.

Changes in v4:
- Formatted commit messages to strictly adhere to the 75-character limit
  per line to resolve checkpatch warnings on the mailing list.
- Removed unwrapped long lines from the commit descriptions.

Changes in v3:
- Addressed maintainer feedback from Jacopo Mondi to fix an unused-label
  compilation error in rcar-csi2.c. The teardown inversion is now handled
  cleanly inside the existing error path without requiring a new label.

Changes in v2:
- Introduced dedicated error labels in probe paths where shared error labels
  previously caused media_entity_cleanup() to be skipped or improperly
  called.


Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 6 +++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 5 +++++
 4 files changed, 16 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


