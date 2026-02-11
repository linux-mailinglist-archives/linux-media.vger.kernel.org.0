Return-Path: <linux-media+bounces-52574-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YEi1EHhGjGnXkQAAu9opvQ
	(envelope-from <linux-media+bounces-52574-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:06:00 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D05E612285E
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 10:05:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 60E7E30160DD
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 09:05:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04EB9350D78;
	Wed, 11 Feb 2026 09:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPEY0jo5"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DF953375A7
	for <linux-media@vger.kernel.org>; Wed, 11 Feb 2026 09:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770800744; cv=none; b=RtEunbe6H9gfAo5rxU9gB4l8BZjLqDYmu5kKzVK9HwaXURD6Xn604EY4jXEYLvnFZlvozHZpWvK7Siox/cmRFU3ZvAX+QDnTPkzTVgvRfWA8YSthjnyh528VSHMujRE135+NARRVW59DzCSOvrbMc0x5huWsf9FTOzA3RQJaFY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770800744; c=relaxed/simple;
	bh=nV3PV9ukLwoxAVDSFzjk0rJnISxqdaE9DidsO8Y4HWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GZv4LHyvB9WjMvDpOdeaNkik0TQgNZO2SbbFcXm28cPuQ0zmLXT3iGEsnEuMLKBXqwcPZu2f3AuejDorKeBwcBNkb1jm4dD5JuNr/otpWv0eq9CqpKFfy/N+crIouhLtF7zHF6IOLejIHAmrERRsrjJeIhoAM/T1pEkIzBiUl44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPEY0jo5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 933B2C4CEF7;
	Wed, 11 Feb 2026 09:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770800744;
	bh=nV3PV9ukLwoxAVDSFzjk0rJnISxqdaE9DidsO8Y4HWk=;
	h=From:To:Cc:Subject:Date:From;
	b=jPEY0jo51YChIdbM4Dk12jTUF/LYrqUgqcDMK3D8ZkD1M9Y8PbiFkVzqna1SevPgf
	 9yKuGWobknJ9mhTlZe74S80fSxLR0IKhDfgx5MA3udEndexrFnjUrRCFaWq/5q0LFJ
	 7UPHwMrC+2yq5K0HhpBSROPNscRbPqopvFdVcAm/074DBmXFbT2nL5U984HNX45jiZ
	 +XF8L9eXxMKZrjJBvpu6CPiszr/+UJUoPRu2WonAHpBNTM1fnS6TKiC6Bg7crDkEfF
	 s/6T1goMgvE9DlXC2cbOsSWks7eVB4SeI3WgCzOcY+Ioih3DEhEkmrBQqzblyf5Drm
	 TSPQIcL34tCYA==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sean Young <sean@mess.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCHv9 0/3] docs: media: multicommitters model documentation
Date: Wed, 11 Feb 2026 09:58:37 +0100
Message-ID: <cover.1770800320.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52574-lists,linux-media=lfdr.de,cisco];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_NEQ_ENVFROM(0.00)[hverkuil@kernel.org,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-media,huawei];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,xs4all.nl:url]
X-Rspamd-Queue-Id: D05E612285E
X-Rspamd-Action: no action

The main changes since v8 are:

- Typo/grammar fixes from Mauro
- Added additional maintainer areas for Laurent and Sakari (patch 2/3)
- Additional links to git development trees

Patch 1/3 updates maintainer-entry-profile.rst: it introduces the
three Media maintainer levels (Media Driver Maintainer, Media Core Maintainer
and Media Subsystem Maintainer) and what the responsibilities are.

Patch 2/3 adds back and updates the list of Media Maintainers that
disappeared in patch 1/3. Please verify this whether the email
addresses are the correct ones, and verify that the areas of responsibility
are correct and that nothing is missing.

Patch 3/3 adds media-committers.rst: that focusses on the additional
commit rights that can be granted to a Media Maintainer.

I have uploaded the documentation with these patches here:

https://hverkuil.home.xs4all.nl/spec/driver-api/maintainer-entry-profile.html
https://hverkuil.home.xs4all.nl/spec/driver-api/media-committers.html

Regards,

	Hans

Hans Verkuil (1):
  docs: media: document Media Maintainers

Mauro Carvalho Chehab (2):
  docs: media: update maintainer-entry-profile for multi-committers
  docs: media: document media multi-committers rules and process

 Documentation/driver-api/media/index.rst      |   1 +
 .../media/maintainer-entry-profile.rst        | 461 +++++++++++++++---
 .../driver-api/media/media-committers.rst     | 201 ++++++++
 3 files changed, 601 insertions(+), 62 deletions(-)
 create mode 100644 Documentation/driver-api/media/media-committers.rst

-- 
2.51.0


