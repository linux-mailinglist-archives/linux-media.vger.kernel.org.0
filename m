Return-Path: <linux-media+bounces-66594-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id auOFHLxISWoH0AAAu9opvQ
	(envelope-from <linux-media+bounces-66594-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:54:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B67317081FB
	for <lists+linux-media@lfdr.de>; Sat, 04 Jul 2026 19:54:03 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=omWA6th9;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66594-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-66594-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F3F61301F9D0
	for <lists+linux-media@lfdr.de>; Sat,  4 Jul 2026 17:53:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C213749EA;
	Sat,  4 Jul 2026 17:53:52 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2897027AC45
	for <linux-media@vger.kernel.org>; Sat,  4 Jul 2026 17:53:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783187632; cv=none; b=RDreNBILHJCribpLbZ3mjI/jh6aqhm+SXs2byTaDf8zBusVfnOF/dZia6IiqQMQ/ZtXeG4M8A2pyu5/6ffcmhwdmxmmdtMX/r09LkXk4CMMIEs4uU96CaRMW08Qx2I2dWvB9QTXSi2Tgm314RyzZ1wkp6uFQdZe+owqPZgOLfi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783187632; c=relaxed/simple;
	bh=35nwSOQ07RSdbmMk0T5r+J++6twNGq7wEcf4jJZIyhk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AwShBPQNAAxoUeS1KdmrOzTGdDP7+SyUkhhiQhIjH7bRDgh44vQAI1iB51lXO1VpF/Bju3Pg6+o0DsbzX7gIkk25w/h9D7yLc0+n72a2J2ax4Iw4WLngb//mlm7nc4pmKEdr/CkaMeiwmGdWizRoRxw08KOnm94X1opOEUwZ/eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=omWA6th9; arc=none smtp.client-ip=209.85.216.49
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-384930ca5e2so297582a91.3
        for <linux-media@vger.kernel.org>; Sat, 04 Jul 2026 10:53:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783187630; x=1783792430; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGOj+lcLEIoUGW5g1S/36ZoafArbXJU/eQ3z+w9OW4s=;
        b=omWA6th9XpeF+e7vdyGIGZW4xDu+E90p2GrG/FCL7oQTomNQi/ly77sbDrKNfKGPrg
         bLbBmClUy7D9XL5fZ7/br/GqHXMOvX7X2GJBb8OQmqIlmnYCQRo0WdBQXnvMEmzktO6q
         Ro2mixXBeme4tc7CH7Gx1wdOiFifHTvT88HAdxKqFjjyqZgjfGs/dHZVGtcEy5M2ME8K
         cQ1IHFk7k6LwPOwm30MmevINxTSF5oYEz1fPk9v0fO7phK1ij8AQP8oyfLMNoo6kR7yw
         7y4xz6NvTytQ8mriN6hmoxOc8k3zEOPVKiufJPHXXvIt2RnukQPj9dFSWcfef+5pDYNu
         tylg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783187630; x=1783792430;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGOj+lcLEIoUGW5g1S/36ZoafArbXJU/eQ3z+w9OW4s=;
        b=kSADalahx9rwDE0nUPyO/oy82GaNzmHKPHRKIDrQ9iC2J6Ziyvw43jA1MRo8oQRf4i
         qY0AGe9aBI2yEjWYGZe8tIkEHJlvUl+4nNLW9NtRMZGO4t/j/5oNIcG88TyTRsxH+7lR
         bcdVEefaf8dYsilo6ZZp4lPnKbGlpvmLH7vsc2JOxzKHiFQf+TfxR1sKQA3J/49D2eN3
         pRRcc6f3ys/ztbV0g90NAIUEgJUx8MmA+mQOVReaoE8SjS6ByKAsTVr6Z+TitjYUDS4O
         n1nMPi6B05GA7LTfPRaSrUw4C/QCMIWeOwCcmitGQETjoj8bGeFxqOG4EkaIVM7x1HQi
         SmLA==
X-Gm-Message-State: AOJu0YxplCTDOk2e7Sj6LYVBE9A3Z5OAYgdq3KbC+AouI34akJNGW6iR
	0W7oARQe9VuIgdEaNowuQo1Ws8WB2e/s+n94U+SFoFER8mHYn6dCYeNCmPwcg3wf
X-Gm-Gg: AfdE7cmzKzHLqkaAL2BiNGN1j08Bj0NT7sQXGtNEYESeaTA5QFYKdI077ujZHU2jfBf
	ddjJs3O7GjYMKpuZcCrFBimd9fx0yHN4Hgcn7rHSDVd5M2pCBrC4MNH5F8Zv3Hs2+9alt0y1wJx
	5e193p6JGANt1Xgfab9Nxw+zExzoe1iv35e0yjoVpfSXuHpjF0lHgNodUWVOQysbUncXxvyJpHD
	g3v0ldD+bTR1kXShEu4aJC+rbCc+hSt/ein2WiQV92yLtf5l/tlWlXc7Ex7FHpdGiq052H7esNz
	NTcxkbf80HgmUNpmlE2YxHpIbRuoUtzb1leiAWzJmRpz6iwGF3FbFLawbF0gj1xFQH5xGG1XlNc
	mPtqnZDhKW/yEj5J7BBcD/pkVXoLmpGWEV4F7dhve+EvaX9mHxuhY6VpzELCqQcgm9aXZpx5pKt
	Y1wHFrnsh3lJCUC8R3c+m+0fqEZ8KS4ZZc+NTrdz0vaSE=
X-Received: by 2002:a17:90b:3b91:b0:37f:c69d:ce69 with SMTP id 98e67ed59e1d1-38280d9b8afmr4152886a91.10.1783187630445;
        Sat, 04 Jul 2026 10:53:50 -0700 (PDT)
Received: from localhost.localdomain ([49.207.223.101])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30f39e07e0bsm15588749eec.30.2026.07.04.10.53.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 04 Jul 2026 10:53:50 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	niklas.soderlund@ragnatech.se,
	mchehab@kernel.org,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	laurent.pinchart@ideasonboard.com,
	jacopo.mondi@ideasonboard.com,
	Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH v3 0/4] media: renesas: Fix missing media_entity_cleanup()
Date: Sat,  4 Jul 2026 23:16:39 +0530
Message-ID: <20260704174638.66302-6-birenpandya@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,ragnatech.se,kernel.org,glider.be,gmail.com,ideasonboard.com];
	TAGGED_FROM(0.00)[bounces-66594-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:linux-renesas-soc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:niklas.soderlund@ragnatech.se,m:mchehab@kernel.org,m:geert+renesas@glider.be,m:magnus.damm@gmail.com,m:laurent.pinchart@ideasonboard.com,m:jacopo.mondi@ideasonboard.com,m:birenpandya@gmail.com,m:geert@glider.be,m:magnusdamm@gmail.com,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	ALIAS_RESOLVED(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B67317081FB

Hi all,

This patch series addresses missing `media_entity_cleanup()` calls across
multiple Renesas platform drivers (`rcar-csi2`, `csisp`, `rcar-vin`, and
`rzg2l-cru`).

While `media_entity_cleanup()` is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Changes in v3:
- Addressed maintainer feedback from Jacopo Mondi to fix an unused-label
  compilation error in `rcar-csi2.c`. The teardown inversion is now handled
  cleanly inside the existing error path without requiring a new label.

Changes in v2:
- Introduced dedicated error labels in probe paths where shared error labels
  previously caused `media_entity_cleanup()` to be skipped or improperly
  called.

Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 2 ++
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 4 files changed, 11 insertions(+), 2 deletions(-)

-- 
2.50.1 (Apple Git-155)


