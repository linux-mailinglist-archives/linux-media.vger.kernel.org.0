Return-Path: <linux-media+bounces-57983-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLeVNLe2zmmTpgYAu9opvQ
	(envelope-from <linux-media+bounces-57983-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:34:31 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA25338D344
	for <lists+linux-media@lfdr.de>; Thu, 02 Apr 2026 20:34:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A43A2300E180
	for <lists+linux-media@lfdr.de>; Thu,  2 Apr 2026 18:34:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 387D43DE458;
	Thu,  2 Apr 2026 18:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UHVFAX7v"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAC036C0DC
	for <linux-media@vger.kernel.org>; Thu,  2 Apr 2026 18:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775154858; cv=none; b=UOm2TsRMyuixNwluqmC2hz5X3ufIbeTMG55LaFwocwXTfRuJZwjO2fYqUVwzxLPMqR8lNNxLyoMxPFaleZTk4jcR2pJq0+ugpbJThkT4z+SR6XtTE0FcHu7byWF5OlWUtTq96BVKCQ0kHqCh1LRIxalFwOwGRLsYg9ckJwZ1pu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775154858; c=relaxed/simple;
	bh=G2LiP/nMT2KkVlegs7AcS102qYzLjyaDSQu2Wg0AbH4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/3cRnxy6VaV+WXLqOQRp+tXwh9fnzyxsFBjqbLMK7dIiQcRRJZIr0xbPjdELJ/LB+DZW9wENRzdSAorN5nIi9MiSRBbeBCvD96loY/Sef826AaM4boo4790Q9aJ7mx6ILecL0k/7EQycErptjHm1L6f7KlWH8FDk3vRLfR9ZFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UHVFAX7v; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-486fb439299so10725775e9.0
        for <linux-media@vger.kernel.org>; Thu, 02 Apr 2026 11:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775154855; x=1775759655; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=T6yjfxpYPYFMWVyjMIQNMKPqFadWr1YU9eOzubcyd/4=;
        b=UHVFAX7vuJdaoJfD5zpZ2X1MxPhtQfMiFpMQMNOxo26fb9eZwHVeCqaqyGP/KzWkxa
         zQcF1DIH+bqkVb8ZqJOIztVYtS/DXXfPDTSbU8atczExbfANqI08iQijwrDJo+1RDd39
         TnGoSmWvOZTMj5LJn0kbwnxVM/fvzZU+FdTHxfvaULRJGzsJb9/z8SbK/6IkC0hUweTx
         Y9VpWo2O9wzn3Qco8mma1OcF/gSc9puzfKem0R4yz/yTPPoHLkv87S/6+36LCwGXtu+A
         UIlZfX65fIJiuialCtobWoZatd2y0m+a3OMNJOH1nOKLtBYqDU3Cdu05bKQfDMltwuTA
         jcjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775154855; x=1775759655;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T6yjfxpYPYFMWVyjMIQNMKPqFadWr1YU9eOzubcyd/4=;
        b=iurmrnENR/cpJZFGJTpANO9JPBKLtlMQSgVcL6WTv0R05o7t8IPgGeoseV3Jqcdvre
         RWZgUmpImBOB8dP5lnwVhz1XYnqb1rLQsZ1pdxhlplzwfxopY2G8f/Pag6dDm9RtYpQm
         wlRCOVrEd1lsPGndI2MUHPPkH/i9+Bvd4g95ZlTu1Kqups5s79eISKCIeW7na/SJbFbN
         /UWs24zQXm1pphnl9UR7usYIwv9P8oamf/8WCyDP3rYmb9vJNEiYRC5CVq9EESOGnf0w
         XQsw2zCvkz2//8MLQJ6FvUWrA5Y+tUePwvlqykzLRXO+oButHD8SwUzGHzu1zYvEvtHu
         uXGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUq+vy6s7Rj8H9UmoP7Jb0QBLed/47p8BCOGqnZdu6qEMjxYUzGqCq8SUGgoLVEb5bbyT1H3vjMRa4PkQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwDnj9dVnW0v0CLXrR+SIYE6qcpXpXcFJkbVNYWQ0z6ofpI6c5c
	1nasPN21etv/9by58QncSgbjIcUppGv0hOw3lNVZdq0IfhHC27otlDKT
X-Gm-Gg: ATEYQzwqv7p1pAubEfQXCYZIxESSfSaHEowWAq19wNrFzVBCHrlIzeuLf8imvD/Dn9d
	XaY5Nzz28O7XfEy8AZlhJGk1JQE31Q4+AowX8E1iqrc3Ekq1vY7TE6EWp83NmqDYYVScvQGbSoQ
	IeSbm4WHAbVExGnNmY1zw+cHI3EvgiuI5dNt8cGZcLsjkTYlDMw/Xpzk8gS9CY3Mo8G52ZOGuTz
	rpCVQOol70SbpZtR0GmnbVsMXgIKh29t7M+A/a2xc8A2VwOGOAH2wEbjb05Dai3xnh4SrKrARZW
	q1320+mjfMH+hICf1fmMod0yDdnPqLWCj88BuoiOEbm2K9rTNABtxtImJli2+wDnDeOyyFzoFUw
	2V2UOaFzRvoP01+EE3w11RNUuOJIIblMCH13io/y8gMcv3VVYjPFkit736i5LGQzgbw9Xr9oJAF
	IcF9PFJDHczppIryMNquqD/AYFggSwDxiv9f5mE3L86yIB
X-Received: by 2002:a05:600c:a318:b0:485:39b2:a47c with SMTP id 5b1f17b1804b1-488997dd6camr596125e9.25.1775154855371;
        Thu, 02 Apr 2026 11:34:15 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:1cc5:ab9:2a0c:50ff:fe2f:36f4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm205797825e9.1.2026.04.02.11.34.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 11:34:14 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/2] media: atomisp: clean up ISP configuration path
Date: Thu,  2 Apr 2026 20:33:43 +0200
Message-ID: <20260402183402.444630-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-57983-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[azpijr@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: DA25338D344
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

NOT TESTED, REVIEW CAREFULLY.

This series cleans up technical debt in the ISP configuration path of
the AtomISP driver.

Resolves a long-standing FIXME by gating ref and TNR frame configuration
behind the ISP feature flags that already govern their allocation,
rather than unconditionally attempting to use frames that may not have
been built into the pipeline, and removes a duplicate call that
overwrites the same cached state with identical values.

v3:
- Picked up RB tag from Andy Shevchenko.
- Fixed typo. (either -> neither)
- Removed 'staging:' from subject lines.
- Added links to previous versions.

v2:
- Replaced NULL checks with feature flag guards to address the root
  cause rather than the symptom.
- Updated subject line and commit message accordingly in patch 1/2.
- Expanded commit message to explain why the duplicate call is safe to
  remove in patch 2/2.
- Updated subject line in patch 2/2.

Link [v2]: https://lore.kernel.org/linux-staging/20260331211649.421777-1-azpijr@gmail.com/
Link [v1]: https://lore.kernel.org/linux-staging/20260328192721.255493-1-azpijr@gmail.com/

Jose A. Perez de Azpillaga (2):
  media: atomisp: gate ref and tnr frame config behind ISP enable flags
  media: atomisp: remove redundant call to ia_css_output0_configure()

 drivers/staging/media/atomisp/pci/sh_css_sp.c | 41 +++++++++----------
 1 file changed, 19 insertions(+), 22 deletions(-)

--
2.53.0


