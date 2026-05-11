Return-Path: <linux-media+bounces-61081-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mCrAGES0AWr2igEAu9opvQ
	(envelope-from <linux-media+bounces-61081-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:49:40 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BDD7E50C325
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 12:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 221DE3031CD8
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 10:43:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14F003D8915;
	Mon, 11 May 2026 10:42:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QeaCyZLv"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8481DDC1D
	for <linux-media@vger.kernel.org>; Mon, 11 May 2026 10:42:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778496164; cv=none; b=fy4qjQsD8G/kZzU+vnADrsBlp2P6PxrXoIFG84Wnuhvgi6x4MPK+F37WsV5eQhu7tlrDJkyuP0kZ6TBccAwBKx7aZbHoIaPiQRqKhl9OQgg1sSo5+dBQSmX49YqX7lob9iV5mDgs9Xka1Qoy3B1wfLI4Rv4PGCQjS7OYavSXogc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778496164; c=relaxed/simple;
	bh=b8V2d8vMGlSXXImGlEiiDODYal1zQ7OVkhB6nLGI39U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KRUVJ5eC3AwIoT2l38bAi01NDXObFd174fdIF3+B/JPxPRHL2vRaekH5atb2lsiCUM+4BUlfd1/mbxuxqvrC49OQqyFmwdXZ5KDAPLIHOpe0Tn6giBsq3LO3WJkuHsnubrF0QlScfKujIesmlzUETgo2Rr+pQzP6IfjiSUzyUes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QeaCyZLv; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-366375c4076so1752485a91.3
        for <linux-media@vger.kernel.org>; Mon, 11 May 2026 03:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778496163; x=1779100963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=QeaCyZLvMpPpxqrGR6/2KPk8wLgdcxsO0flwHjXxUeaqpT6fnrvD3tIXm9JEnuEIh3
         1gk6vkuXV36jqED/0tnY7ik4BCui6U7eZLCtrO7ZufmFIkPCp31YGzK99I9agQsi2lke
         cJ8hjXd7p8mGcd3Es/vLHh12tSBRbh7fRyA+uF1/CQzmOPWf/soJroGRHVvbaLus9hbZ
         DJv9xghmufMnT3Fnym6rIZEBinWXiUf4V43VViTkuOg8D4Lzuan2PgpBZsuKzaCzipDk
         IpFAIJSlpNqGrP8ZAh6XNZqERU0Sr71Q3+bb5KzjTr5sWp6X5AeicxQlD21PjSV+9TPx
         wfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778496163; x=1779100963;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8pJwksc69T29ge6PeayWoiQnaXWns9TCiOF+acY213w=;
        b=seYfxPWrwUtMkjglA0MJGkDW42QDCWq7Kx/wKpaKpKGMCvJXnN4k46x1YLTxmnlK4f
         SmSnoZ7mHBPufQZUvCnFBWaZ+i8eZFPneyOixJKt8USe0TMRkSUKZNuJdNWn3WPCWndT
         2V42ZlOvI7oxjwgS4f7tO31inVtEKLNka0Py3j79T6tFDFxEmmpeVeOFUBbuWtNt1pF6
         u8FYEOMpq/MduSTWczLqHl2Y7pXfpG3kIId2zuWNii8iGUaAkzU+DxyRowfNslZe3lzp
         BBGybh+6DbxXS98B2GDhYkkwO6r6XODZ94wk98GzHf6+xP5dmftlrYnPVNyGTadl9jYO
         xTTw==
X-Forwarded-Encrypted: i=1; AFNElJ+Q9neIyYMetJxgsHd1hB8qJFMcd5bzClaew3kDsD/IpMRq2AOAaGAdfkk47AsBtoYHp24X2p9/QOeqoA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxrviD3AaloJLSv7Crgx3rSs/0PwrRDSmTMQe0qUggMj2sFuVqZ
	amg9sU9MEreSC832qVIL4Vpz+S60rS2Ui88e1FL8De8E7B//aph9hn7e
X-Gm-Gg: Acq92OFI2zt6qxYKUE3B5QhM0XHNxbAOoSrqDE8FQK7dhNk+8gvypoJ99S+nb1qq3hR
	I7OmKWE18dVYmeRyUjAD0o3l3rJvM2RZDyXDMnA/Ib/257taROwVJD3RYVXBiW97p6Xt6Cj1OXI
	+Dt+oCeMSNDUeiF+wmDPKdboEewWhIPcNuUBgFdamM2w0TAnXF1tDD2j7Z6BFvgQZRY8K0DZ4mQ
	Wr0RsnTJR2JlYSi/D5U+Vo1C7ruQS85bx97V4gCwDI7QxdDHJsIN7BGXUrSVzp3mMmaSLXOJD4p
	JWTaOz41vAadkCWm9byUPFFDNS1A2JhsaXDVd0hxtPsaHhb6kW72kQPxLJkRhmRZVnjm/EQavuu
	9nCnlsbPrk6TSr5ZylmzsDx1VCJ0McE5dJJngXRH9mfVUc8N/vB7a+PoQwtKbM9W5LjvKA+dMUM
	g/pmnPIcm9vB2oFpuVJQ==
X-Received: by 2002:a17:90b:1b12:b0:366:3517:1aa2 with SMTP id 98e67ed59e1d1-367d3c75385mr8912429a91.0.1778496162532;
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-367d684009esm7533423a91.11.2026.05.11.03.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 03:42:42 -0700 (PDT)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH v4 0/5] fix and improve for Hi846
Date: Mon, 11 May 2026 18:39:22 +0800
Message-ID: <20260511103927.279550-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: BDD7E50C325
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-61081-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-0.971];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Action: no action

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v4:
- correct default lane cfg in commit for 'fix link frequency handling'
- fix messed header (the Media CI robot)
- move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- fix modes handling for different lane cases (Sebastian)
- fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- remove uncessary `else` (Sakari)
- fix link frequency (Sakari)
- correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 251 +++++++++++++++---
 2 files changed, 210 insertions(+), 43 deletions(-)

-- 
2.54.0


