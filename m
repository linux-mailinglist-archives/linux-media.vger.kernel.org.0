Return-Path: <linux-media+bounces-51702-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QCpqMKrveGkCuAEAu9opvQ
	(envelope-from <linux-media+bounces-51702-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 18:02:34 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F21981F3
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 18:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 639D8302B346
	for <lists+linux-media@lfdr.de>; Tue, 27 Jan 2026 16:50:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 181C8362131;
	Tue, 27 Jan 2026 16:50:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WMSbe1ef"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF5636074D
	for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 16:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769532634; cv=none; b=iQJ3umeH+alM8a1z3zOgqu/c8vW9fNAOZj6uMdLXpMrGT2lTR3qbunjq5y75FqkDWoPEs+1L3JTtVydHcUsjQrE7PXqxHTCWq6lQKkN17LsW3/CresRWBuuT0hXo9Tk1IC1++jgrbt8Wks0iWJVOkl2TcRGpAcBQ2D9KRVdrYvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769532634; c=relaxed/simple;
	bh=aEx3pLBj8gvBTEDpyhyp7pqHwhzZ8IHrcrqz1f12G78=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ja0YiJmC2uEIFAnUPvS5p/47d9UBg3rVOQPNhK8KzuazrcSJULqr7N5f+WFxCtZXOJhv7Z9Nj3zBqtDE24/ZKliKE6YRMKiyex4J/PkIPuITF81Mx3tXtJIY4IxFX16nHNphT1S8GWg6UNNZiTz2IkYCOnQZdtIPlUqwCKGGalo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WMSbe1ef; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29f102b013fso53692415ad.2
        for <linux-media@vger.kernel.org>; Tue, 27 Jan 2026 08:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769532632; x=1770137432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HFUtSxTOqds6zm0elI90Vt4eXQm0HV+4Gibl436HNNU=;
        b=WMSbe1efUxlmBC/tnU21vJTuWfsil+HIYKpxT/azzzuEmIcyfPtyjQQlsXwyuyBuMM
         p6ccEVf6oRO0FQ2l+h4sKqxCzvXfQkNt8i+8RBOxzcNR8Kj4uvR3gq79slGU1CPD1zRO
         eHWkSvNm3KXveMrznxiaTQ2d55fN0xzDEh2II4+fOdQPbf5xfBIsNS9HXjAjc1US/zSv
         PNIQNaRB96TJT6nD/YCGnEmwAjbqg83IEyKHf79zQRldZ1DYZxJ6LASW1AaQiJq9xFD/
         BzzRsczNQdjp0JhVSKRPPqG/zqE/NMmfPu0Q+t6iYPI7Y2q5BSM+yCqr+2unZVKtlvfL
         bTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769532632; x=1770137432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HFUtSxTOqds6zm0elI90Vt4eXQm0HV+4Gibl436HNNU=;
        b=Hv15QZa2xbC9LWnJVOJ7Yn/OzgYAb6GN2wPeoYg7nIoj5ZyvvAm00hTYNVIoujOmRl
         kQEsB6a5sm9xNRT0geEx3J1g7ko7csFf0EpwxupDO1HYmAxKo/QwDeeUjWg38oJ5cvkm
         hPUdGcPc9QPiAJKI55oA3wjvCP0phyNslZYeNNLM1Ovqzd7riIomxkkuB5ocJlyGNVnm
         mrJy3SCaFDtdnmfxDoOEBOqvxqXOz8bYkO0ErbzOXhQtDkRgdYsW7goI18sEOns4QrBT
         tbxnBPOgADYLGkL8VD+eAHXCAj2EOU3O4l0pNLZmHoXdVbh2sFmV9080HKQfLtBaQzlF
         Zu4g==
X-Gm-Message-State: AOJu0YwhzlHj0V7nQvweWsfFYehcZU+2aNXUCVG3G+dpRvOiuWbU3Yfu
	UJbpFWfUBReGdkuQgHuaQ/bmCwDm4AglJZwRubqKSA0KWSx5dmK4MwE/oVxxzdH4
X-Gm-Gg: AZuq6aKVwrXk9TaLZjD7S/qgjTuPSgxogrEM1NWSPQeREB22sv/pKUnA6WI7y3tPXTw
	djdRWRmJOw2UAz916O2YUMh6mTKwWAb0d+bQhqRtj5qoktRqqLh4rLtoNA6l8YTGKBK69vkD/EE
	XJ98MnOee5ATs6PGUW2lmOXg0BVOdWM0bHdWcYScOVS6eEQhzGyPOSCfaAeH16dB4dMxWoXE6B4
	xuqV7IjZ03XT5mYyb5OeOnktl9WAq1maTJGi2RDOQyGIhAsoty43DRtUWUd8ErjQVNFj2PsIhXC
	1SBs3AfPnruZi3t2UWUm4qKgKzsd2UzzF+U/FBTNKIUYaq6mro5DvwdcCot9nIsGwQRW30Tx+8w
	7OUumnYxhHaYeoQbSe0GgoWy2ylKqN26YhedrSa+G/+HTLN5cc6bolM4mslQvcw+V+846n1BgB4
	vxxD3Gg5aie+RHdKvt20dG0wHR86WZ04Q4/2Y=
X-Received: by 2002:a17:903:1b10:b0:24b:24dc:91a7 with SMTP id d9443c01a7336-2a870ddda67mr26361515ad.45.1769532632328;
        Tue, 27 Jan 2026 08:50:32 -0800 (PST)
Received: from saikiran-Yoga-Slim-7-14Q8X9 ([2402:e280:3d17:646:d29a:ea37:2567:751])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa46fsm120318675ad.21.2026.01.27.08.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 08:50:32 -0800 (PST)
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
Subject: [PATCH v4 0/2] media: i2c: ov02c10: Fix race condition and power sequence
Date: Tue, 27 Jan 2026 22:20:22 +0530
Message-ID: <20260127165024.46156-1-bjsaikiran@gmail.com>
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
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[1.2.3.5.c.f.2.1.0.0.0.0.0.0.0.0.5.7.0.0.1.0.0.e.5.1.c.3.0.0.6.2.asn6.rspamd.com:query timed out];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-51702-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	DKIM_TRACE(0.00)[gmail.com:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bjsaikiran@gmail.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[11];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D2F21981F3
X-Rspamd-Action: no action

This series addresses driver correctness and stability issues in the OV02C10
sensor driver. It fixes a use-after-free race condition during removal and
aligns the power-on sequence with the datasheet requirements.

Note on v3/Brownouts:
The "Autosuspend" workaround proposed in v3 to handle regulator brownouts on
Qualcomm X1E80100 platforms has been dropped from this series.

I am pursuing the root-cause analysis for the regulator discharge delays
separately. The platform-specific constraints (2.3s passive discharge) will
be handled via the regulator subsystem (linux-arm-msm) and device tree,
keeping the media driver clean of platform-specific workarounds. I will
continue investigating the underlying physical discharge characteristics
and PMIC status registers as requested by maintainers.

This v4 series now strictly focuses on generic driver correctness:

Patch 1: Fixes a critical race condition in the remove() function where
resources were freed while the device was potentially still active, leading
to kernel oops.

Patch 2: Corrects the power-on sequence to strictly follow the datasheet
timing (T1) by asserting the reset pin for 5ms before enabling power rails.
This ensures the sensor enters a known clean state during cold boot.

Changes in v4:
- Dropped Patch 3 (Runtime PM Autosuspend) to separate platform-specific
  regulator fixes from generic driver cleanup.
- Modified Patch 2:
  - Reduced reset assertion delay from 10ms to 5ms (usleep_range 5000-6000)
    to match datasheet specs and maintainer feedback.
  - Removed the software reset (0x0103) and extra regulator delays to keep
    the sequence minimal and compliant.
- Patch 1 carried forward with Reviewed-by tag.

Changes in v3:
- Superseded previous "pipeline lock" and "brownout" series.
- Added strict power-on sequencing.
- Added fix for use-after-free in remove().

Saikiran (2):
  media: i2c: ov02c10: Fix use-after-free in remove function
  media: i2c: ov02c10: Correct power-on sequence and timing

 drivers/media/i2c/ov02c10.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

