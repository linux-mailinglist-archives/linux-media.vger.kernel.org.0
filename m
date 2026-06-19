Return-Path: <linux-media+bounces-65264-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vE/GIawYNWrRmwYAu9opvQ
	(envelope-from <linux-media+bounces-65264-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:23:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE56A5310
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 12:23:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=UfWyxZcS;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-65264-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-65264-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=gmail.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E46A6303D71A
	for <lists+linux-media@lfdr.de>; Fri, 19 Jun 2026 10:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C70D3624B3;
	Fri, 19 Jun 2026 10:23:05 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC38371D1F
	for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 10:22:59 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781864584; cv=none; b=jb9uXB2JjBv5R3CFWLJHqgNQXwYflsoAZ9jm9HT6K9F05JJbkk65i9ZmkvkrUhaUTMSVTn3mDQ7TGLeyFLsd8ZVKjRCt9/D6uRRZ0scPnD+VAUO+c1hwBF91589xQgyQopZR+JeAIIQQWac22zqk5jNXz0hGBkvMef4ZOZ/i0UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781864584; c=relaxed/simple;
	bh=Xb05YsbogZMfhq6wNa039f6ErpPnK9gOyjt0qolBRIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fIT+qKEO5XK77pjk3aogCkFod4EZYzxfGoDGlC6nQ2qGWUkL8KxGo+LQPt51GujOltYDXhERYJP0Q1GFGRS6na8oVmVy/expMVGk5wv49vw91ZkV/amZlGHIa+l+vdbsnrQh/Utpfs9g3TYdYBwBbkSUBbtciwTggW8NaNzff0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfWyxZcS; arc=none smtp.client-ip=209.85.214.177
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c6a97e1d1bso14377705ad.0
        for <linux-media@vger.kernel.org>; Fri, 19 Jun 2026 03:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781864579; x=1782469379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzvew/ayggixuo/rQgB0V28OouGuPyUxQoPWM20knrA=;
        b=UfWyxZcSsRr4QI2DRWk3fmPyBCdBQh0jrtP8CS5o3ApLkNM62lvAvKznCNqNsElehJ
         R0X4i/xiTKoUcvLYhNLe5SRFlPBNhvXNu0cEIYAyUNAVwJ4lfAjCf4RKvKZYrDyT6F04
         qUBYsNuNczjn166O3X6jpou0F+vaJSBGRqK1GVTEO0XmzNek/jFA3Z5l1sFdUIM5fMGq
         fGBloBjtjV0TR0CMcbkUBz7KjWVTzoDoTHZS/PLSLOKbMjuy39GcUOSsdgrcvY/SZm1j
         6NF1aqI2EE9+KumREBxjTGKlLesz2Uyxh200cAMHQC98ecrYG8QukHwlJq0aMTWHgokv
         3EpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781864579; x=1782469379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qzvew/ayggixuo/rQgB0V28OouGuPyUxQoPWM20knrA=;
        b=qBgZ150GKDbERqpO+xwUuKWagok4MPnujZXH19ywD9BxEZTkeh0uKmATHYn+gAFMw3
         Suu/ZiwFjhnEkt62wABXWN6+r167ogxOoo1jZaMQoiDXkpEXeshQdptOZUNeBcmDlAQP
         NMaUxD0yeDGdcH7CjmlAWLTzdzYWW8Oi71UgS55ssv7FJbaQdxVNKGGvJerxgwmwq3xp
         b98kzqVOkwroYtRwVyQl3XylCm/V/bWMx7PHLx2v9aXenycfTQVUbOqoPWISbdC/spKd
         hYjLCciuMl4sbmhBlMWmtNOHQ+DcPbBsikRb/gmSnNddcASl9DuyF7ibhbV2+tMSrEG3
         FgAw==
X-Gm-Message-State: AOJu0YwGa6oC0KnnbyUR86bW4MpGELkz7NvVWCdP7VXql3+VKKSGftzV
	qIWLyKjxF8iRdlZ638rywESoUEh/b7XBlstE6Gf2j3P+jgPok3784xG3H4hR9V6T
X-Gm-Gg: AfdE7clZka3qzAQD25TKan9SYk7yOQ6/crvIVEES7vGDyE476lWgN1F3UY7oe1Y08B0
	UafnKQfbmVQuUK9w1YAdublB2BJuHdkdLtaiIT4miGFwxNuR+pdBCtUUUfI+w3P0HZ84oZ+8LDU
	aVMXBRRVEqkthtW4hyb04yh3nYvCjE1GLpZFjlkADfGXmf5XYe6wSeZE7+Xxwp8FmJFa3ROPXN7
	PTp4xq7tvZbxWmeAdciIwUaU6G7XaOJJgpPYuo0ZPkTxMhWReRdyCBaPBQDxpPHG2BTWtvJ9VJk
	C8eQm+zG8OV/H39McIlDYIWvejE6B30/HrWTDNBcvkIsaeb/uN6BBXQOcLK1Q7QkXwR209EJ0yr
	e6jI0QDoerYNNlZqhCUcL+XqEG+R5JJfwBc9tW7c/2Lc7juLs1fegHOZOfsWeHXQ5lkv5jbBsLC
	qgZSGWjzMu5RO7PlEs3Tp+m2zS+ILHxygXL8E9YXy2uA==
X-Received: by 2002:a17:902:fc85:b0:2c0:a373:89bf with SMTP id d9443c01a7336-2c718f1f5d1mr34131045ad.1.1781864579065;
        Fri, 19 Jun 2026 03:22:59 -0700 (PDT)
Received: from localhost.localdomain ([49.207.217.37])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c720c24f73sm19486115ad.82.2026.06.19.03.22.57
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 19 Jun 2026 03:22:58 -0700 (PDT)
From: Biren Pandya <birenpandya@gmail.com>
To: linux-media@vger.kernel.org
Cc: Biren Pandya <birenpandya@gmail.com>
Subject: [PATCH 0/4] media: renesas: Add missing media_entity_cleanup() calls
Date: Fri, 19 Jun 2026 15:52:42 +0530
Message-ID: <20260619102241.22887-6-birenpandya@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-65264-lists,linux-media=lfdr.de];
	FORGED_SENDER(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:linux-media@vger.kernel.org,m:birenpandya@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[birenpandya@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E4DE56A5310

Hi all,

This patch series addresses missing `media_entity_cleanup()` calls across
multiple Renesas platform drivers (`rcar-csi2`, `csisp`, `rcar-vin`, and
`rzg2l-cru`). 

While `media_entity_cleanup()` is currently a no-op when
CONFIG_MEDIA_CONTROLLER is disabled (and even when enabled in modern
kernels, as pads are rarely dynamically allocated anymore), the media
subsystem guidelines strictly require drivers to call it to prevent future
leaks if the core framework behavior changes.

Additionally, this patch series introduces dedicated `err_entity` labels
in the probe error paths of the `rcar` drivers. This ensures that the
teardown logic remains strictly inverse to the initialization logic, 
preventing `media_entity_cleanup()` from being erroneously bypassed or 
called on uninitialized entities when shared error labels are used.

Biren Pandya (4):
  media: renesas: rcar-csi2: Add missing media_entity_cleanup()
  media: renesas: csisp: Add missing media_entity_cleanup()
  media: renesas: rcar-core: Add missing media_entity_cleanup()
  media: renesas: rzg2l-core: Add missing media_entity_cleanup()

 drivers/media/platform/renesas/rcar-csi2.c            | 5 ++++-
 drivers/media/platform/renesas/rcar-isp/csisp.c       | 5 ++++-
 drivers/media/platform/renesas/rcar-vin/rcar-core.c   | 5 ++++-
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c | 1 +
 4 files changed, 13 insertions(+), 3 deletions(-)

-- 
2.50.1 (Apple Git-155)


