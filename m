Return-Path: <linux-media+bounces-67073-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id AMa8DcrDTmqcTgIAu9opvQ
	(envelope-from <linux-media+bounces-67073-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 23:40:26 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 944E972A977
	for <lists+linux-media@lfdr.de>; Wed, 08 Jul 2026 23:40:25 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=snderf5a;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-67073-lists+linux-media=lfdr.de@vger.kernel.org" designates 2600:3c04:e001:36c::12fc:5321 as permitted sender) smtp.mailfrom="linux-media+bounces-67073-lists+linux-media=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C5601300B87B
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2026 21:36:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29263F787E;
	Wed,  8 Jul 2026 21:36:47 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6DCD3F660B
	for <linux-media@vger.kernel.org>; Wed,  8 Jul 2026 21:36:45 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783546607; cv=none; b=K4ZrwZTGjQKbI9/Bjxb8TAXLH+N4Te45YzRflfOp8j90ckL5zFOnvtkxAJLgOGRjDsYcxGw9lv5e/eJVY85ghwt8tIi/2bjsXkuHsIEPUPJskCBT9Uw2gHXqMQldS+MdvcRqrXbLJ2NklxY0wvnupO5YL0lVqJLiXG8Ir6r74ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783546607; c=relaxed/simple;
	bh=5m54YSkayBjfymTOaMTs63W9YSbPr5wsG6NiuXstMy0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p+0a0XH5SarJu8mbXRtzFHXXyRJv/S3SYV7vVu00QVLgdNsZIjxL8Q06vLPxVH+YNlxmXW1OC7gvaocGZhZqtCNk06x5LQqSupbWst5TPYb/mlKXj2U7uozwMDPUR75qegVHaZL+7UUr7PuAI7v8XvSMc7i6+AlfKz/ZgljGqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=snderf5a; arc=none smtp.client-ip=209.85.128.43
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493c19bad03so11216105e9.2
        for <linux-media@vger.kernel.org>; Wed, 08 Jul 2026 14:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783546604; x=1784151404; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nfr4hNPDMxSC3hDg5gyegf7QLZwqwa7EAfP6d1SzZr0=;
        b=snderf5anVnu1clOujZ2nDKvzB2vbpS8zIQGAL6p+WTX+FNQ0OadP0gHT+NZLZrwfv
         KhYqUivgJ1ryUXTdbtVuwAis+aDW77QBP2cVVYUHakOuorSmiRhL2sMcws+MzaLHpY8M
         Bje7YwExXEGjS+5P9CiLVtdGzBf0sLeU8SRWUCQD9YAMLvNdtXo6+QwdNQ6957lifR79
         Kqha31ENlqT9LeA6HdfVynxlUbRfrSrhbZhS+2MlE5acmc2wKltf0f4aHRTvdX/U3Aen
         ibx1gQxHv0135WyNhcAItuAtbUK2URcQHs35VAblUZL3TQHl1ah5BUILNMBWK5mqryiE
         71Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783546604; x=1784151404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nfr4hNPDMxSC3hDg5gyegf7QLZwqwa7EAfP6d1SzZr0=;
        b=JCw5sNdgjAZaGCTE2zCNS9ddjOUeOem5vdOu7lu7hawnCjL4vkynQAJgr8Q5Uixfmm
         XCuly6Xkty0qT7uXtsf5WapvlGC9oYTE4nGSJh609+sAoJ3l/Md+0H+MenwzQ1DL2gp/
         UrPZ5MHhg0sgqjFKRrU0dDLHBJx8QiWtO8loRdyzfT9LO0ya3/frUZuKBWQj1yzzrJPk
         hSRQmIM7XbecnDaVfM8qj+jIbVNIOn9V9WJYyHvy/uHcWBTr1v28dezuaI4RtD+NLE2p
         GvPIM5XVfIdARHLCax+XTq29T+RkX/yuA8WYiESYmBN+cSpj/cnWoUKKix8D9gipdIiC
         Ta2w==
X-Forwarded-Encrypted: i=1; AHgh+RogrIrxjeV0xhva0jeSP5ugUBvlJgqDli9KxBUpzy86mAG2+TH7FoluYzgdH4VcDFMu89/SBUEuOeJ12w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl+wXTb2CFY24baX1vuwUYioWN1qrXpE9Kmdi6aVsSZtEhFACb
	07d1OOWz59Gk8zvlx4XXevPGN8cwlOf0dbfaKXe5KbcaFyHKY/y4I6Lh
X-Gm-Gg: AfdE7cmatVYP+AgLSpSoKYH/Ade6G/7lNo8fpyS5Aw3WMq7zeYIM1k18EZd1YV1iKDQ
	8QZnKOQj4n59cgMDfdtQbtGZoA0W8KwSejhSMejeLnTSaMfkhoQy3WUYoafeXYGPFFwxZOlaCmO
	J1lPt2RJw0w6IdIrWR7miSFsQWKhgvI74JbKleQoswr4SLwCBztB9DE7EV0lEhnidKn7VGYZpCT
	GBRVnpLoZOX5RiyfvaVqYUHRfPp/l8AwnWqTQwPDNd2YGKdQSKMuFZjF+BB3V+aHdytZGXoQhPC
	vJMzi6EkexwP1lQ2TtTr8dgfjBHtQzIuZXXC2kGT4liM3+hoZk739gypWRit4vyEzyrs2/YYM2e
	zHzYLoLpj1PC0iE3+vAeS/qheStX35eArtLzbHq/qOr4dIMp/9eAbDpS4dM9q14BryJNRXXFK2c
	0t6Xwnn47//zR3qA9fz9SoKoO10DEZ/Ux7MBl83A==
X-Received: by 2002:a05:600c:3548:b0:493:c4e1:40a6 with SMTP id 5b1f17b1804b1-493e6873594mr39471085e9.32.1783546604034;
        Wed, 08 Jul 2026 14:36:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:5d3a:fe75:ecea:55a7:5b01:7b9f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9e3e2702sm47900063f8f.9.2026.07.08.14.36.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 14:36:43 -0700 (PDT)
From: Fernando Rimoli <fernandorimoli11@gmail.com>
To: Daniel Scally <dan.scally@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-kernel@vger.kernel.org,
	Fernando Rimoli <fernandorimoli11@gmail.com>
Subject: [PATCH] media: ov5693: add OVTI5693 ACPI HID for IPU6 Surface devices
Date: Wed,  8 Jul 2026 23:36:33 +0200
Message-ID: <20260708213633.18392-1-fernandorimoli11@gmail.com>
X-Mailer: git-send-email 2.43.0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,vger.kernel.org,gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-67073-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dan.scally@ideasonboard.com,m:sakari.ailus@linux.intel.com,m:linux-media@vger.kernel.org,m:mchehab@kernel.org,m:linux-kernel@vger.kernel.org,m:fernandorimoli11@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[fernandorimoli11@gmail.com,linux-media@vger.kernel.org];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[fernandorimoli11@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 944E972A977

The ov5693 driver only matches the "INT33BE" ACPI HID. Some Intel IPU6
Surface devices (e.g. Microsoft Surface Pro 9) enumerate the same OV5693
front camera with the ACPI HID "OVTI5693" instead. Without this HID the
i2c core never binds the driver, and the IPU bridge never builds the
firmware node graph for the sensor, so the front camera is unusable.

Add "OVTI5693" to the sensor driver's ACPI match table and to the IPU
bridge's supported-sensor list. The link frequency (419200000) matches
the existing INT33BE entry, as it is the same sensor. Devices that use
"INT33BE" (e.g. Surface Go 4) are unaffected.

Tested on Surface Pro 9 (IPU6): the sensor enumerates as OVTI5693:00
(ACPI path \_SB_.PC00.I2C3.CAMF) and binds with this change.

Link: https://github.com/linux-surface/linux-surface/pull/2171
Signed-off-by: Fernando Rimoli <fernandorimoli11@gmail.com>
---
Note: this HID addition makes the sensor bind and enumerate, but a fully
working front camera on IPU6 also requires programming MIPI_CTRL00
(0x4800 = 0x2d) before stream-on, otherwise the IPU6 CSI-2 receiver never
locks and capture times out. That register change is being handled
separately (see the Link: above). This patch is independent and useful on
its own for enumeration, so I'm sending it standalone; happy to reorder if
you'd prefer it after the register fix.

 drivers/media/i2c/ov5693.c           | 1 +
 drivers/media/pci/intel/ipu-bridge.c | 2 ++
 2 files changed, 3 insertions(+)

diff --git a/drivers/media/i2c/ov5693.c b/drivers/media/i2c/ov5693.c
index 4cc796bbe..02236f3db 100644
--- a/drivers/media/i2c/ov5693.c
+++ b/drivers/media/i2c/ov5693.c
@@ -1396,6 +1396,7 @@ static const struct dev_pm_ops ov5693_pm_ops = {
 
 static const struct acpi_device_id ov5693_acpi_match[] = {
 	{"INT33BE"},
+	{"OVTI5693"},
 	{},
 };
 MODULE_DEVICE_TABLE(acpi, ov5693_acpi_match);
diff --git a/drivers/media/pci/intel/ipu-bridge.c b/drivers/media/pci/intel/ipu-bridge.c
index 88581a4c0..b70d61099 100644
--- a/drivers/media/pci/intel/ipu-bridge.c
+++ b/drivers/media/pci/intel/ipu-bridge.c
@@ -93,6 +93,8 @@ static const struct ipu_sensor_config ipu_supported_sensors[] = {
 	IPU_SENSOR_CONFIG("OVTI2680", 1, 331200000),
 	/* Omnivision OV5675 */
 	IPU_SENSOR_CONFIG("OVTI5675", 1, 450000000),
+	/* Omnivision OV5693 */
+	IPU_SENSOR_CONFIG("OVTI5693", 1, 419200000),
 	/* Omnivision OV8856 */
 	IPU_SENSOR_CONFIG("OVTI8856", 3, 180000000, 360000000, 720000000),
 	/* Sony IMX471 */
-- 
2.43.0


