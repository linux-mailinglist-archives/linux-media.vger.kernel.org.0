Return-Path: <linux-media+bounces-67392-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id g80QHQmAU2q4bQMAu9opvQ
	(envelope-from <linux-media+bounces-67392-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:52:41 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C37CF7448A0
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 13:52:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=ahZzkFIb;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67392-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-media+bounces-67392-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 376743037482
	for <lists+linux-media@lfdr.de>; Sun, 12 Jul 2026 11:52:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2D173AA1A6;
	Sun, 12 Jul 2026 11:51:57 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1450E3A4F26
	for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 11:51:55 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783857117; cv=none; b=LbsxrEEbMk7hNb6EBkABQRM7PS63SIgqDdO0QcAfubASSF6+I2rjwrXICqqKtV1ejBSxzQ6sE17R310v9fcHNgAAf+TGtgLL9BIqJbOYgeRbZxAJNoNUiOLLDQYXLra+3XZtQ7NnGGCBfRGig+ZgFEusLbpNOL7p87MbpRF4FfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783857117; c=relaxed/simple;
	bh=6+TZszz08ANN8+9ofoYjUJ5lkEzumu4XH0cVK7Cerfw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OXRRpHVOQxHw30zvHjsmf5Pyc/sk2d+mIa7jcgNXnvadr/L7NY+m4Jzl2t+ukRmy5OEjMRUA2lC1u05nosOqm/h84kT9dU1OSixTX58lzvGuEKsnFzVcIaEHW1jdgMeAXojU7ZO4940mqgqlVNCNzqNQNSGA7EcFnN3kDY3+Gbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahZzkFIb; arc=none smtp.client-ip=209.85.214.176
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so24350105ad.1
        for <linux-media@vger.kernel.org>; Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783857115; x=1784461915; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=ahZzkFIb7RNV6bXWLHbMYcxAxsTw2U/LC8/4hN/7qTqLtsZODyq6/Q0pTtYeWnJU1c
         YxVgwzGfdX87fJxUclz9MEme2ze1ICFkC0I1xZFsYz+leeiKtkuCW05TTTDef5YaIJ5c
         WMqi23LIXsU7BQ+xDc4KbUExhQOdj0eMt4r3tIiC3hcGbvvfGHhEMsbPQpV3sl4csPxR
         MK5ibDnrPqXJQUtzKV3tOxdu5juTPJh9H0NQSm/CP7dSX+N/Een+OwfRriQRw9NvTNMi
         lXHsYkSaAEWzuAnueJIUDiHkNWt0Zi2z4c6IS6aHwRQk9ttN1iSOHjTl3O5lPKxgo0kh
         LsKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783857115; x=1784461915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4Utm4P1WbP2lIpaXwLG1JxwvoUEmp6e9qMX5dfGldD8=;
        b=MrDh6H+MR3S8jwHy+O4T7TraARb0UTwlxDKRNxZXDd/AQ1kHNDpwowRiw8nvhHA42q
         dowIuvcyQji9Hm3k6bWVkyEcC0SMyLfQgvvJnYnsOZeSjMPe03XDa8n28aQ0AGYYTIdc
         m8zfVcFxuBXAyvE/YUJd8c9h5+49upfzzkUdzTU5GsRQJF/NI9ngPKwDEyok9SmOP93a
         YyXeU9t2RA6iaAc5xUHonFxKpz5OcwN23EjxkwwPlAkmsxyndJ+e3apWidpOAElD0Sxq
         Kvy+KCmBCYeuC/XkGFtu4niq47MBtNBfAmeQ/wSRCyptMXfdqmI4BE0s7xVEACmuqy9J
         YKWA==
X-Forwarded-Encrypted: i=1; AHgh+RrmjqFfyNUAYU8HLSrLbPhRJPn/WiD+/aStEWlLtU8dGbpgEWo+UBcF3235Qo1igQ9sUG02oHyshK5TQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRtmUn8UwL7/jokIuDnAmdQSWYF3E5eUXsVP5cZlFRaUvwBycP
	uFSc27Mg1pE857v534tgtauAT3uTMfByLUSnvuYExrZmrp93avPxUKT+
X-Gm-Gg: AfdE7cmpjRtlLHzPsqMvAY8ab0SsxauxJIPNpZIzTW0gQbYOmPVBdZy1XHKq7HEiIi2
	8IFbZlhWXB+xFx2s0FbxOTEX2Q5XCTWXGFz9I9p+uHvWQMA8VvIhfq/II+Jt5vwgo0KmN3T4zCY
	HwW0ZIlhBTYCGHVldNy9YZgVI2kFm4HNSi6E0m2/Upl5M8MrWgIpLAZMDrIvg+65cEbv6mb6s8m
	qP6lqKWZJCJ2IGSI9VrBZavjBGIHzLs/Q0kSlR45D67uzT7Lx6cGdSV3epVQmXiEYaH7Ghldyzt
	9MPLC67PycBb1UshKpNV67v+RAMAngeKneoo2mVZkAlPj2ikffggIpVJ3rnC+1bUbBJPIyaK1Mq
	BpDu20JbAG9+HZlAYyjM/xkKRPFeNtagojlehXYLEcNEfYHZxtMZjUXYfIiZVonhrIm0o+XwltA
	/8ODKqhhsEsiRHYfDocXPQr+ABjbeWkGA+/d9F7fDCrU6AcNZWNg==
X-Received: by 2002:a17:903:4b47:b0:2c9:ff83:41fa with SMTP id d9443c01a7336-2ce9ee1890amr53777765ad.24.1783857115288;
        Sun, 12 Jul 2026 04:51:55 -0700 (PDT)
Received: from nuvole ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bfe040sm84538295ad.31.2026.07.12.04.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 04:51:54 -0700 (PDT)
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
Subject: [PATCH v5 0/5] fix and improve for Hi846
Date: Sun, 12 Jul 2026 19:50:07 +0800
Message-ID: <20260712115012.91600-1-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.54.0
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
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-67392-lists,linux-media=lfdr.de];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:sakari.ailus@linux.intel.com,m:martink@posteo.de,m:mchehab@kernel.org,m:hverkuil@kernel.org,m:sebastian.krzyszkowiak@puri.sm,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:linux-media@vger.kernel.org,m:mitltlatltl@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,nxp.com,pengutronix.de,gmail.com,linux.intel.com,posteo.de,puri.sm];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mitltlatltl@gmail.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.infradead.org,gmail.com];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: C37CF7448A0

This series fixes errors blocking Hi846 driver function, fixes
link frequency and supports 6MP and 8MP modes on Hi846.

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
Changes in v5:
- Use separated fields instead of raw register values for PLL cfg (Sakari)
- Use mul_u64_u32_div() to avoid loss of pricision and u64/u32 issues (Sakari)
- Use v4l2_find_nearest_size_conditional() to filter for different lane cases. (Sakari)
- Drop line break (Sakari)
- Rename post_div to mipi_clk_div
- Correct div1 number from 1 to 2
- Link to v4: https://lore.kernel.org/linux-media/20260511103927.279550-1-mitltlatltl@gmail.com

Changes in v4:
- Correct default lane cfg in commit for 'fix link frequency handling'
- Fix messed header (the Media CI robot)
- Move constant to the right side when comparsion (the Media CI robot)
- Link to v3: https://lore.kernel.org/linux-media/20260511090924.269106-1-mitltlatltl@gmail.com

Changes in v3:
- Fix modes handling for different lane cases (Sebastian)
- Fix header missing (the Media CI robot)
- Link to v2: https://lore.kernel.org/linux-media/20260501095433.1609309-1-mitltlatltl@gmail.com

Changes in v2:
- Remove uncessary `else` (Sakari)
- Fix link frequency (Sakari)
- Correct link frequency for DT
- Link to v1: https://lore.kernel.org/linux-media/20260429070351.1307204-1-mitltlatltl@gmail.com


Pengyu Luo (5):
  media: hi846: fix hi846_write_reg_16 handling
  media: hi846: Fix link frequency handling
  media: hi846: fix modes handling for different lane cases
  media: hi846: Add 6MP and 8MP modes support
  arm64: dts: imx8mq-librem5: Correct link frequency list

 .../boot/dts/freescale/imx8mq-librem5.dtsi    |   2 +-
 drivers/media/i2c/hi846.c                     | 296 +++++++++++++-----
 2 files changed, 227 insertions(+), 71 deletions(-)

-- 
2.54.0


