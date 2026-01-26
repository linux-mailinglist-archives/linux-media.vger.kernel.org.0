Return-Path: <linux-media+bounces-51520-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gHF7M44Gd2lGawEAu9opvQ
	(envelope-from <linux-media+bounces-51520-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 07:15:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFE884668
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 07:15:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2B7853009B1E
	for <lists+linux-media@lfdr.de>; Mon, 26 Jan 2026 06:15:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93D2724677B;
	Mon, 26 Jan 2026 06:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ePz3t3Xp"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E7E264614
	for <linux-media@vger.kernel.org>; Mon, 26 Jan 2026 06:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769408140; cv=none; b=UGPsqg01v8+f80HgtYRymZEKXcLrqN4XH/GQPFUh/W6m3G8UK2syI+/q6Es7DWxywE+cbqr7bHyM8Sui2lK0ToovJqYa7AM2/LV90EAR2f/y1KADM2uR0YjMZBhB0tIidP5dmqlOTd6zl6OYWZDDDpHS2LQF4HG3oTnWcmo+qPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769408140; c=relaxed/simple;
	bh=ZIKmF0boRd4aQJJl1kSLxxFnc1ZN3egassPW/w/Ka1E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Gs7Mbd89uvts7Ot8UiQWc8hsW/qZg7pfdkU+TiYzQqMPvAKeok9P0q6oM59lWaAHPOBMvHXSS4BxZqUmTmG3xjQAYWaUog6sSJfRTxk80HLzZbJwPhGZOHRYZ45P4hvGaUybBQvQ8Zwx7PxqfUiVaHJ5KlafzVxpt4d+LbjW0Sw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ePz3t3Xp; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-8230c839409so3188246b3a.3
        for <linux-media@vger.kernel.org>; Sun, 25 Jan 2026 22:15:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769408138; x=1770012938; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yo54aCp4Rf+yeSJL/ASA3fIY6d/5SoKgWC6QPgdGIz4=;
        b=ePz3t3XpsoCW3unUG4QE7ulZAfDt/gy/CiyqimHC9orXukghWZGZKQL8kZM3EtFHjl
         GhjAR0ZkAzvPP2nfvXkH8F6QNSn5WzcQDtQSi7PaD5f7LGP3PtjKZn5YkC9jPkIuWYGQ
         7OXg/L1PADtEEeCBr08YGgiZxbpcLIPRrWqvPKNr/oVRfA3mBU/91DA/UV/8P1biWfTN
         J0cngKfDDswaRpNrlJpOxnWXR1QRd4u67mKsiGeCfaOVn/2KDfw+m5hA6W+QSuOCrAY1
         z066K1C5ltGJLPzS10BjLVuSlPUHKvyvk0mb1nz0VhAd5zL7RIW7bmB93O2c/yT0ZfrH
         H69Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769408138; x=1770012938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yo54aCp4Rf+yeSJL/ASA3fIY6d/5SoKgWC6QPgdGIz4=;
        b=CaoqJ6STyVl2xkRfI/Koje1anglzuaYMl+vwIaVIhq/hUPGVvVDtJhVCdzq3ErjYNB
         EuuaR8B3sS9Wgkk2fhliydBbwOaoZRSYIyHXV9XFvyregKwZ4c0Tw5mBoDSm+hBUfX3l
         ywXWu6v7slZsQePlQA5qDXWODHy+tAYtJIonOnu3IyzY7Dj/1eP3h3pK60R9bPFXhV1z
         w2up9zr2o5YxBE0p5pESgb5uzicr1N3uYbzcXpW5wlUHtUYajzxaw3B8rZ/HtmEilCOt
         ICM498+zDgD+pxBSHZZbIjSqZO24jbE+kguVnvR2nMSWegP6MPQ56vi6iqBJX7nnywx/
         nvew==
X-Gm-Message-State: AOJu0YyXQstolEeFjT/SwJmcIWQEAcYhozeLiKePXnVTNRGOMFJ2IDwb
	JG0kyL7uQaNa1xEJDT4Izicw3iJtu/CmJ7SBbbGakP8eirRcoRGW6FBdYW8u4pgH
X-Gm-Gg: AZuq6aKcfZRR5KgiuyejyoSW9Ww3MisYKmxzOt+bGeHCmGS61LVplgvb9VP6W7CihCf
	VcpOEqLjmNjE6woE45ib0VMbMg5nAsGQO86IUJfYndIIg7wTzTquM09pFkPUzXjt8waMu7UX2sF
	0fF/VMmFywcHzpojRRgVH8Q8wXjDdgBT65phhi8sx+PBoCFGIqfWL+IZ+fmiJ8QbFWDbESZhgbP
	2E7AZYIu3VkCo/xdVzK3zebDVRIZoU3VRmDqNkQBdTQU4s5JyL9hjl9HfyH+tSMC93UudUNlAoX
	pIl9qliiC60Rvdk1DrFviPowNZR+Pv/gHkO+Dd6a1TjTHT+fkKy5VGe+JSZkMR2LTfUo1iNG1Ys
	yD+s6wARJD5uixiFvblBJOQBT0TKxJi8MfzzVe79VWw7UANyfj8UA3/ZEdwao/3y2D2P4hazLpK
	gUpjR6NNUM+xqhZeEMGdhj6HPjzRILb3cX0Ga1
X-Received: by 2002:a05:6a00:3e11:b0:81f:3f88:89ee with SMTP id d2e1a72fcca58-823411b83c6mr3630070b3a.12.1769408137739;
        Sun, 25 Jan 2026 22:15:37 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:9b36:8e2c:6fb6:590b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-823187716ebsm8543796b3a.66.2026.01.25.22.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jan 2026 22:15:37 -0800 (PST)
From: Saikiran <bjsaikiran@gmail.com>
To: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	bryan.odonoghue@linaro.org,
	bod@kernel.org,
	rfoss@kernel.org,
	todor.too@gmail.com,
	vladimir.zapolskiy@linaro.org,
	hansg@kernel.org,
	sakari.ailus@linux.intel.com,
	mchehab@kernel.org,
	Saikiran <bjsaikiran@gmail.com>
Subject: [PATCH v2 0/1] media: i2c: ov02c10: Keep power on and use reset for power management
Date: Mon, 26 Jan 2026 11:45:27 +0530
Message-ID: <20260126061528.63785-1-bjsaikiran@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260125171745.484806-1-bjsaikiran@gmail.com>
References: <20260125171745.484806-1-bjsaikiran@gmail.com>
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
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linaro.org,kernel.org,gmail.com,linux.intel.com];
	TAGGED_FROM(0.00)[bounces-51520-lists,linux-media=lfdr.de];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-media];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3CFE884668
X-Rspamd-Action: no action

This patch is a follow-up to the series "[PATCH v2 0/2] Fix OV02C10 camera
pipeline lock issues" sent yesterday [1]. It addresses the remaining brownout
stability issue on Snapdragon X Elite platforms.

This patch completes the v2 series by replacing the "cool-down" patch
(Patch 3/3) from my original v1 submission [2].

(Note: The separate series "[PATCH 0/2] Fix OV02C10 camera color and
stability issues" regarding Bayer patterns and remove() race conditions
remains independent and is currently under review.)

History:
In v1 [2], I proposed a hard 3-second delay between power cycles to prevent
brownouts. As discussed with Bryan O'Donoghue, that approach was a workaround
with a negative user experience. This patch implements the proper fix we
discussed.

Problem:
The RPMh regulators on X1E80100 platforms lack active discharge, taking
2+ seconds to passively discharge. Rapid camera cycling (e.g., WebRTC)
causes brownouts because the sensor is powered on while still holding
residual charge, locking the internal microcontroller.

Solution:
Instead of a delay, we now keep regulators and clocks continuously enabled
after the first power-on. We control sensor state exclusively via:
1. Hardware GPIO reset
2. Software reset (OmniVision register 0x0103)

This reduces power cycle latency from ~2300ms to ~70ms (including a new
50ms stabilization delay) and eliminates brownouts entirely.

Testing:
- Validated on Lenovo Yoga Slim 7x (Snapdragon X Elite).
- Performed 100+ rapid open/close cycles with no black frames or lockups.

[1] https://lore.kernel.org/linux-media/20260125171745.484806-1-bjsaikiran@gmail.com/T/#t
[2] https://lore.kernel.org/linux-media/20260124071751.5885-1-bjsaikiran@gmail.com/T/#t

Saikiran (1):
  media: i2c: ov02c10: Keep power on and use reset for power management

 drivers/media/i2c/ov02c10.c | 119 +++++++++++++++++++++---------------
 1 file changed, 69 insertions(+), 50 deletions(-)

--
2.51.0

