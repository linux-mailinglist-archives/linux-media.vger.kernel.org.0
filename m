Return-Path: <linux-media+bounces-59484-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qBmaElUa62lTIgAAu9opvQ
	(envelope-from <linux-media+bounces-59484-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:23:01 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BEC545AA4C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 09:23:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 5B48D300A53C
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 07:22:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A335E370D57;
	Fri, 24 Apr 2026 07:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bm7tURmI"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE569203710
	for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 07:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777015372; cv=none; b=M7bXNb8BAMtmyIVGFy6SFxRvGudxl00D/8ZK/zteX7Mu5UQo3k16X5b3V0EhgG8TQr4lCpj+TMObZF120JPXMCmuZFlSS4tEGzlANYF7ZRWG0JOOaTLkLERLsm7sB9PIp3IWaLs27rXFSCnZGDzktC+PbBmZz0yiNiuM6PaEwoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777015372; c=relaxed/simple;
	bh=LGgBuPl13OVCqY6MyycN+/CmKgvRl/RP9kAEoA1MlxA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=gj7fE+UPL/Aa4stnuBF2TU+IShNGCwpAggRGMAV+kC3+SDfPjsV0E6hxVltQj7KX5VtMgjT8A6UULXgnAdxcXa6EXblRixHPbFe2xoghcl5MGgnjV0cdCgtn7L+34dQnOLFcob6F3smm/1vYl0YUveucngFo2hog0x7l312qCew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bm7tURmI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a2c500750dso8606213e87.1
        for <linux-media@vger.kernel.org>; Fri, 24 Apr 2026 00:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777015369; x=1777620169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hTQRz/Y/73N4N7zfobml6VuwnylLNpcaq2f4fU14Mdk=;
        b=Bm7tURmI9YwYmJIF4TJ+BX+QeVrvXQ7yMqwqeCh7Vhs3SO/AOFpCsGgUWLFLxVk0UM
         br0pJNhlRH3GTyGWjvvsQTTDR4azRgvFosiQJaBCpIWKOlvYL48wZEBfO7K/krR9vwTg
         vajxqXhPEQATW+rxWojHu+F5Ezl5qX1fzJQSLCuzXJTR82QDFdJ/Ks+i8OIWNsyMlsMa
         /dbktNb6rjii4z4yZY7GL6IiJD743HiUu/Fl/zTQZE5qdScUqXVfXn4Moqu8LQI/FCRY
         o1808CqS194iXwkBAXsuclBvL2zf5i6FnwkCYwFBXbqWRhYz/qajEpeIzB+PBJ9IWRe0
         AHVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777015369; x=1777620169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTQRz/Y/73N4N7zfobml6VuwnylLNpcaq2f4fU14Mdk=;
        b=YqusMG6vo2T6popiRo9fm3tFW1W435x/ysq6kIF6F3etXbLqQW3X5bKUlakRPQI8OO
         IPYSBoQDN3vEV8WM/3adCN/ZUoniOfGdGmdCMRc+DtOFKQlrzFaD2CeGSZ/Yytw20xNJ
         y+jRC01v6fo8B3idYYHCYdr46Zj08oUSkPnsV8HWUAS0+QSjGtCu6fHbPxU6tgLZE6Yp
         J6NY+5jS6tqQtvlbCh738zuNj9XF78VpupQSyjEoF/V6qKRKThPd/ACCYq7kk26lYiVw
         y1M0/tvnHuw+m+wnoBV3G8GaFt4v6iFaa3fSoS3gw9HySNkEWLX08g81jheyC9vKAKIA
         W9NQ==
X-Forwarded-Encrypted: i=1; AFNElJ9orfD+8m9fTPBXatscVhAJR2NHTKOH4M21lYt4tVXwDogcuzfH0KofKaxXJPO02F03h6IlM8wRRwssnQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOjF9JlZ2DuMPQ6HhqE0GZDtHN7hnv18wBFdOLqjd7GVHrZZL8
	JonLOwg2isFZW1yKT7aJZlagbVR+CU6aN4YShQtn1w9u/k9JpaZFGLg+qk0YsRJG
X-Gm-Gg: AeBDiesBXdFtsuRglRblgZBHvt818wMBFlHTxLlui1sxucOD9QgmkUjyQvGInX5giDk
	82s0AkGdHhW88HhujLd8kb5fOKKbVIkNbw0o8rlwNpsrx8n9+bmm8mbKjFD5j5w9+uqmBxnmJZn
	HoDtlKL1jTnJYl0591ne9+i4Z3S7Efw+Deqe/x63DCDB72oI6C/rHvE8patDq08YvyblyKVirhv
	e03VfM4/N2RJHhb7sLm2rFsEUIK22U4Ed4tVZlijE0uc8H0GbtytJrdztjx+OYL3b1O6FAts8T2
	BQBBhyloIfhbjKVk9IXiQBWOw8RecVZxygImcQVJJa6cV6v9L51BRHWHgANDF7MzKnXbcps4FM8
	0m4N2yyjwUtar8EEfNXw2QStY+oVa46YQoYoxZH/92gRWag6TO0Lr5Y2TDoWiD8hSgwVhF3baJ0
	W/871PcoEGPt/f4eLOLoWwGhJOpbXhZQQBNA==
X-Received: by 2002:a05:6512:33d6:b0:5a2:c05c:1141 with SMTP id 2adb3069b0e04-5a4172b749emr10164473e87.4.1777015368566;
        Fri, 24 Apr 2026 00:22:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a41a238563sm5612550e87.55.2026.04.24.00.22.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Apr 2026 00:22:48 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v3 0/5] media: lm3560: convert to use OF bindings
Date: Fri, 24 Apr 2026 10:22:25 +0300
Message-ID: <20260424072230.90354-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 9BEC545AA4C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59484-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]

Add missing HWEN input pin and IN supply. Fix v4l2 subdev registration.
Remove platform data and switch to OF device tree bindings.

---
Changes in v3:
- added note regarding lm3559 in the schema commit
- lm3560 power on/off functions converted to be part of PM,
  dropped redundant wrappers

Changes in v2:
- vendor properties swapped with generic LED properties
- added mutex lock usage optimization
- power supply and enable gpio commits squashed into PM
  configuration since they are both required in making
  proper on/off sequence.
---

Svyatoslav Ryhel (5):
  dt-bindings: leds: Document TI LM3560 Synchronous Boost Flash Driver
  media: i2c: lm3560: Fix v4l2 subdev registration
  media: i2c: lm3560: Optimize mutex lock usage
  media: i2c: lm3560: Convert to use OF bindings
  media: i2c: lm3560: Add support for PM features

 .../devicetree/bindings/leds/ti,lm3560.yaml   | 131 +++++++++
 drivers/media/i2c/lm3560.c                    | 250 ++++++++++++++----
 include/media/i2c/lm3560.h                    |  15 --
 3 files changed, 328 insertions(+), 68 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lm3560.yaml

-- 
2.51.0


