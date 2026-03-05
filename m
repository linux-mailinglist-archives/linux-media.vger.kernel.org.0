Return-Path: <linux-media+bounces-54608-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8HBzNURaqWkL6AAAu9opvQ
	(envelope-from <linux-media+bounces-54608-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:26:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F1AF20FA86
	for <lists+linux-media@lfdr.de>; Thu, 05 Mar 2026 11:26:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9DE923011BF4
	for <lists+linux-media@lfdr.de>; Thu,  5 Mar 2026 10:21:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42532378D9C;
	Thu,  5 Mar 2026 10:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dXuMygBO"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC5437EFF1
	for <linux-media@vger.kernel.org>; Thu,  5 Mar 2026 10:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772706108; cv=none; b=Sm4jQ19uQzWB+VMjmp9Qv9v+Kv7DnxSF9RCqh4mDfvX9vsl2Z4GJXRLNno+Za4GVecb0RE9/D0gj3uj3BPy9fUznUqJ5BD0e+G4MeM4StFEECAY3iz4+0auZ9Lr7AbPgk2t7CMdBCvTQDdw6xCi1ge2aWJJO9ZcMNF/IuqyNIzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772706108; c=relaxed/simple;
	bh=kCf0b7r3+aYWKlEFLmr5M/pVZbkqCg9FOYJ6cnxL51E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RMEYOSpC8nm4cvu/oWYYVXcJns7zpCk8HzsRPPyGEPqyQHK/+oZFjw/Ly3a9WNjo/BH3hwEpUoNFkHhlPWKzHShBEngpqE9fN5xndUa0bmV8VZra0kmzG+TwqhOYMag9FY8hS7STIRLQct7hl7Ahr76zNIFzKyPblJmcqvgYZW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dXuMygBO; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-439cb5af25bso1342814f8f.1
        for <linux-media@vger.kernel.org>; Thu, 05 Mar 2026 02:21:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772706106; x=1773310906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xq+iU3O0H56kjgqFLX7flDI07VtXwGN9nbYmC0naI+o=;
        b=dXuMygBODYDtjGqDZ9xTMu3FlmkqBKpaZPd0RtwDfyyt9wlF9a8MjB0gN0bbKRJSSz
         67NCvw12Gzw7gqAYcvhvuMKdmsl/h2d7sEquqzBPV5oek6eNs7uzhAC80l8p2zLFGvVP
         Hnlr0rM0ZTXEQIvmOLzQ51L+QMr7CKaxBCRUtxHg1SkfX+RIVMrMrL3Ar5f/sFC6Mz75
         jrIn1kxL9HGhmYxNjX8ZqABxGcyy0SjheWxJPQio498Yy12LSTP1foDRQ0vRwgsZKKXi
         2zsVE1Yul2TO/H/KsgHnm0ciOwbtCpL927qfrnv0uebNPUOYJoqTuCLqiRMfmvPYde/u
         o9IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706106; x=1773310906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Xq+iU3O0H56kjgqFLX7flDI07VtXwGN9nbYmC0naI+o=;
        b=f3qLTJepjwIynAkjy8aoden+hf7uwaOHntk7kQqvMRdp9P6//aD8uBmcUwQZ3DdoSZ
         8qW8u/l0gGjVnr36arCGqJSjJiDhDS2onvkhjEBZ3oeIUWDVhTsRR4pFi/khxbJz7Y6t
         0J6FISP1TCDJo0SRtbTUuWep2TwyHrEUhlS638Vm35/87oN0t4TEzLB1iLIZRnBHTex3
         VgmpTYkSXQootWmugw5xRucshYt/Gg7iFAkqZzypIEfZOrZDIyFEaB7dGRwynowlO3gj
         DyJkCwsaM30kX+v/1yZgTeVMlGM9VJ6N+kGp3B346jQKKQV7Uz1y3bpsx10ko+eugjio
         ExMw==
X-Gm-Message-State: AOJu0YxGgifzu+ozgRAwipkAWqOz2v0sgbbMKeEQvk2Biz95B1CUTypm
	WqL75f429z6Omu4zg7WN5QoCIKXjcpYhoCXNfZUReURS+4DSmp0gLKwT
X-Gm-Gg: ATEYQzz0vazEe2bQ2NfGGkmf4JRV0D521/BRnZbq+M381jzl1McRGlRFDLbI3jadfzx
	PnGhzFXkHHZi1uZjNEHg+j/AJqnLWdM65qfYVkg+d9uaRdWrTT8VSsLSjvadbVuuoiskEPJhXfa
	CiMx5QKC3SHBeVARRB/p2wkYZuU2+TQCxchuMpTxagdN7zV/5JTGn2KOP4DXI6YAa4WooldOSrC
	n64fcy2Y+omWlEI/BIRL5IiKIeKQi51Ljd/B2I0+aB8G6q6laoOwsgaS7mhrGwfIY6wu0vYYbHo
	IfeVeZcQF1QQHY1H1Axn4fPX3Fo8zQ0WjY6+fntbuJQeXTiaSBLtoxrfZ548cdCsKh+MVj8OwxK
	GwagsR6yYnMyPNuk/83CJGe0ZDF4DkXCKZKNdT6T0juCHaZYm2tHEFtXWxZ4l24BMIXw1IFi8oE
	zFB8WMvZtsnsDx
X-Received: by 2002:a05:6000:2011:b0:439:b6f9:b438 with SMTP id ffacd0b85a97d-439c7fd955dmr9774946f8f.33.1772706105447;
        Thu, 05 Mar 2026 02:21:45 -0800 (PST)
Received: from xeon ([188.163.112.72])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b503425asm32625444f8f.25.2026.03.05.02.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 02:21:44 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] media: i2c: mt9m114: add support for Aptina MI1040
Date: Thu,  5 Mar 2026 12:21:20 +0200
Message-ID: <20260305102123.17216-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 1F1AF20FA86
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_FROM(0.00)[bounces-54608-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,linux.intel.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[clamor95@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-0.999];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo]
X-Rspamd-Action: no action

Slightly different version of MT9M114 camera module is used in a several
devices like ASUS Nexus 7 (2012) or ASUS Transformer Prime TF201 and is
called Aptina MI1040. Add support for MI1040 into MT9M114 driver and
document it in schema.

---
Changes in v4:
- added mt9m114_models_default to ACPI data

Changes in v3:
- state_polling > state_standby_polling
- added check for device_get_match_data

Changes in v2:
- dropped conditional polling of command register 
- switched to device_get_match_data
- cosmetic changes and typo fixes
---

Svyatoslav Ryhel (2):
  dt-bindings: media: mt9m114: document MI1040 sensor
  media: i2c: mt9m114: add support for Aptina MI1040

 .../bindings/media/i2c/onnn,mt9m114.yaml      |  4 ++-
 drivers/media/i2c/mt9m114.c                   | 35 +++++++++++++++----
 2 files changed, 31 insertions(+), 8 deletions(-)

-- 
2.51.0


