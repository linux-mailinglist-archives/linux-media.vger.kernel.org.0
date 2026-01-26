Return-Path: <linux-media+bounces-51584-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KAIYMcald2lrjwEAu9opvQ
	(envelope-from <linux-media+bounces-51584-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:35:02 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 171048B885
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 18:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EA884302E78D
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 17:34:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC96D34D4D6;
	Mon, 26 Jan 2026 17:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jHXpl30Q"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1123C34C124
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 17:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769448893; cv=none; b=GEk3YoBx90P9fXRL/jYB0lt0A5im/quki28HrVbmK587F+sqJ3F7evtpHwjOOf6N+MBXdjZwkJ9BJGv+mrbGoBdWLyeoAZKkMFqexwjAyiA7JqgTu/bkARS1+w422OFGTk6RHK0UM3Ag5HCWQ5SL+4Dbn0/HWA0oQdrvDh7wERE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769448893; c=relaxed/simple;
	bh=h0/ub/2a0CH0c01bv1YE6IT1oluBRPkEI00u7f+PX50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Q4R5+ECo72kb2jcz2Bcrjf8nmSMlB/wRIu69fh7tfx6QpY5TRvlT6YxofY+TPG51NKFjlZk698A6B0I9otbg0+vFnuVoAwMuwgRXgMKN38n5MP/xQ8az5qLW4gkcDxuW5f+38aVT8KOWuQ6uY+EPGHW2i6MW3EBo/ziTw9BW86w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jHXpl30Q; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-bde0f62464cso1401668a12.2
        for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 09:34:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769448891; x=1770053691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cjv9fu28bLwysGYF55oXTU3CWsx7n76bAr9kUcIOrhg=;
        b=jHXpl30QutwixtbLbABlv+tUAZiY+krcW8bp3F1VDwy5zyH3t07w1xTt+yg6HvAuG9
         s3VZZdsD0qs0DWhHjpETeqRHjaDV3gLcMtAICBmcUM6x01bIEXWe+Yok3pKjsxO3+8+r
         TXwUdMh8u8FzBI+PaKN3q/aGGkiSbq0g5nZ+6ljBYdhwdNBCPh2wyPYHLaC+EV2w9/V7
         LZGYza7ykHIH1lXl5dEQ/T+WrLc9Pr7h97fvOEx2+y9WoqtonpymuvF78zrltPO5K6n7
         KGcikTUDnrtYpR68XKm9Oz9Obm9/ePInqf8POm4Q9vlXJR/OKZwehqzhrE8mMEziXoqN
         H22w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769448891; x=1770053691;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cjv9fu28bLwysGYF55oXTU3CWsx7n76bAr9kUcIOrhg=;
        b=P/apr9vwV785/GbwKJOw51tpahqVAaLiOsfu2tBAeQZM6uQPPU6OQ5pEXcLw2wENYC
         Hb+/6x27Tt7ro+EYTg5ZH0lwjT9g4ozAsD372PlqWOzjJWlj6ggXR5J78ZA7dqCqHFpD
         48AOAsfWaVE0B6eW/W7/3FPFK8otqTXrrhHD8FyHZoHxPCzkIstdmuRHjdfD64oidvKr
         3MH7Fyf4oG436O+BR3kXm8kL4RUtKirSb9qSqrfkjacrSJovmNvPRrTh4eww6DmOxHLf
         5K5v7ZT2NDnxmbrRK7Y3N7s4shS2/W7C6DFrPhlL0y0VJxbMOPTsa7crM8mWIxJjjhQb
         eDsw==
X-Gm-Message-State: AOJu0YzFhTKREaIg0FDnP4cHX3YzjNGJ8WSGySh6XQYuaeHge7kexuEr
	Nze21cZ2qJ2vvSdOhXqJhG9Wc6xJOx9CiqVA8oS1BRHf5C/zMyscZy0UjUJ4s7y/
X-Gm-Gg: AZuq6aICn0n3sAinWB3jYNLq2MjdIaVXAfe9RGuIU1f4xKuITUdYhBKAfYM4yhRYFwv
	Q7na4b0WHPFGT7yzJ07GlrePT65A9WQJldchFgR8BJ8InRAxYgsGuCF06g6zv6cCSlN0T1e/rv8
	71kdNu9PCPZ+kn1Bt/1stvesY5bfLrFPKi4sdfDp1OBFX4v6qtS4naTouw7EruBwFxITVQysMVp
	1iQdUWEPpxsdfjHT4viCu/N6au72lHajR2+gLW3/htVXpHVC5UhOWxCO6i84nD8IVkgDJgmgceW
	kyxWKjwLGeHPcrQ67ThhOgUyJCprkGbvk3iI9TmPp/7/bofeYI6iq0DKhSyHNA8MLDJt3/rvMY8
	J1XPVUKX6ub6sVSCpXEoRmAIE7W1Lp+kOYhcn1twQoarqjc9MTpH98xpLGTBMq8yyGlKzkON+uF
	y+u3m8o8vjQuImtTa44lw86M0pPtyNRTEzN1G1
X-Received: by 2002:a17:903:3bcc:b0:2a0:d5b0:dd82 with SMTP id d9443c01a7336-2a845323587mr42365825ad.61.1769448891061;
        Mon, 26 Jan 2026 09:34:51 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:e23f:af76:8280:9d84])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f61292bdsm86787a91.6.2026.01.26.09.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 09:34:50 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 0/3] media: i2c: ov02c10: Fix brownouts and power sequence
Date: Mon, 26 Jan 2026 23:04:41 +0530
Message-ID: <20260126173444.10228-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_FROM(0.00)[bounces-51584-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 171048B885
X-Rspamd-Action: no action

This series addresses stability issues with the OV02C10 sensor on Qualcomm
Snapdragon X Elite (X1E80100) platforms, specifically the Lenovo Yoga Slim 7x.

Note: This series supersedes all previous patch sets submitted by me regarding
OV02C10 / media stability and cleanup on X1E80100 (including the 'pipeline
lock' and 'brownout' series). Please disregard prior versions.

Problem 1: Brownouts during rapid cycling
On this platform, the RPMh-controlled regulators lack active discharge, taking
~2.3s to passively discharge. Rapid close/open cycles (e.g., WebRTC checks)
re-enable regulators while the rails are floating, causing the sensor to hang.
Previous attempts to manage this via open-loop delays in power_on were deemed
incorrect.

Problem 2: Incorrect Power Sequence
The driver was not strictly following the datasheet power-up timing (T1/T2),
potentially leading to race conditions between the reset pin and power rails.

Problem 3: Race condition on removal
The remove() function freed resources before powering off the device, causing
use-after-free errors if userspace (PipeWire) accessed controls during removal.

Solution in v3:
1. Implement Runtime PM Autosuspend (1000ms). This prevents the driver from
   cutting power during rapid user interactions, sidestepping the slow
   regulator discharge window entirely. (Patch 3)
2. Enforce strict datasheet power-on sequencing with ample delays to satisfy
   maintainer requirements for clean boot. (Patch 2)
3. Fix the remove() race condition by reordering cleanup. (Patch 1)

Changes in v3:
- Dropped the "always-on" regulator patch from v2.
- Added Runtime PM Autosuspend support (Patch 3).
- Added strict power-on sequencing with 10ms/20ms delays (Patch 2).
- Added fix for use-after-free in remove() (Patch 1).

Link: https://lore.kernel.org/linux-media/20260125171745.484806-1-bjsaikiran@gmail.com/T/#t [1]

Saikiran (3):
  media: i2c: ov02c10: Fix use-after-free in remove function
  media: i2c: ov02c10: Correct power-on sequence and timing
  media: i2c: ov02c10: Use runtime PM autosuspend to avoid brownouts

 drivers/media/i2c/ov02c10.c | 70 ++++++++++++++++++++++++++++++-------
 1 file changed, 58 insertions(+), 12 deletions(-)

