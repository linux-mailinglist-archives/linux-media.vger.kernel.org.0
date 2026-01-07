Return-Path: <linux-media+bounces-50161-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id F0102CFEE85
	for <lists+linux-media@lfdr.de>; Wed, 07 Jan 2026 17:37:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D756930038CE
	for <lists+linux-media@lfdr.de>; Wed,  7 Jan 2026 16:37:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DE235CB68;
	Wed,  7 Jan 2026 15:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GED68igh"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CE1435BDB3
	for <linux-media@vger.kernel.org>; Wed,  7 Jan 2026 15:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767798560; cv=none; b=UWmZYk2RQejx4JsVCtN7wH3aIsq76yyt2WUn8l7VWyaKAT7JTYMagsDPaVaNHJG05Tc7vYKzBNi6/hOKxZXEX4pp7GdL2EpFhM+ADwIA5BEXE/KmITSoR32ipRDEoUZ3/KmpPWCwPSFnGwcR0v+llcTfQ8tqcupidhUFxruZf+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767798560; c=relaxed/simple;
	bh=ZU5aP8O78dSxdoTaolgYTMsruktd3PaIhLm0H61X0dY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gaUirOCqz1tk1CHfDuOik1hCkapV59feQx2PIzaFdkck5LDW2PCs3Df314p+1qEpCsvy+8oc4XavG8sz74ATFh7hRda6AGJMgA6KVihzO8natB5RHRVTuPYIwVdfc9o4mti8LbjOZxFe1TomvHrnyOR2LrtenXqNLNXU/oPwrX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GED68igh; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7bab7c997eeso1883157b3a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Jan 2026 07:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767798559; x=1768403359; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QGJr5/hzI8JoRIA81xmwa92sWuNgKBOZWdP5NsRWAM0=;
        b=GED68ighwE8iSNvK5lEtR/TcHhIPvHl0Gl5YGo1T/0DvBZYb76N2yGry93skyf8dIm
         9I0TtRxVUow8CT5exkVddP/Q/NXn6avSQttpQYwrIUF+bSfOkWBhAZxh/VCkL6/ZQ2qs
         yxragIJaTJDKza7n7FV2iqqd7lYcKl6xcWH1mfhUfPSjANlMjxIg0Wiisioa7FeC3LfG
         MbXM1sw6ovubX3gsg6t5agu1Ev8lQeeo8KCaSSQVFpESbpesj2xxoKoCflt1s2l9COZU
         ZoUTHQqH4GioK5eAT0bIfr8pyP9QgYUAXrq1PcQD4nhUZdeAy4ptSkmxiu5Y/bfja9FI
         qWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767798559; x=1768403359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QGJr5/hzI8JoRIA81xmwa92sWuNgKBOZWdP5NsRWAM0=;
        b=hNYzQxnsmHvBn9iP1kemCPXCdXkqxNnec83BuX3YZrMifI9bBUpk37mWhPnl7pOOYa
         oIAi0eHPtOLmOF/QV5FYXjJQSP4N25aifhK+cCfhKLXpRxer6NqBZaWJoZMgJUmQoz/y
         FJD3qdXKVytxslOG3gUVhWSlj3hngigtP879a36xW0/SmXzkQ4+xEpssRiVMKPFMeWFu
         iTJHvHboLuNEEYXBgWLqACmU5S0B3lg5nm/xEbFOoSK2wRmPlf82CLz5RI88xl+jz79M
         bLj24v1e+jK/gv1CXKBks8Kzo7q1sSYkr69vizg8ss9W1HYjFgRhP7TJhKmBGiwFcfcg
         HcVw==
X-Forwarded-Encrypted: i=1; AJvYcCUVLyzmSSeNRtCMVO6VXBc9kzX0+LVv9KAkExYW3EulBV+weAE95sVZOe/pVkGhkFgi47fRz7rjXnn9MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKQIr8ugF03vbyx/ZC/QznZO0r3SINrShrH6/8dwhwwd1NcuKN
	1+6GQPEPwxMAx1Hy9hibDOerY1zAmC/B7OEBCWYV1wjr9saiW3Z+zezU
X-Gm-Gg: AY/fxX4I0oM5A0Wos9dT7/nmK2l5BxfuUvTqzDug4PsagEWO3dVI49kKvfswR0epkP2
	EHehfpImnfbEllLoj/5ykB1P0ETFCatTXiD7ME62BSWn51DLl1nsmkWM8j6DQv9CvoZDDVGfY4c
	QdEsRv51YfshuFAzLVRvAGvRi7yu01f945eMXt99Isp8MUWvn7RRsWRc85uyzg3W0byMvpnjHqZ
	35plVyVERsZ3MezX3hK67UnME2xZJToKzKJYTsepc2pQmTES/QoNEfK7dSvQiRMzp58rRrUUl2l
	xUk2XAHu413ssBQKwdmeH6JRi3a56iXsyMc98Fcd5ehjwCQ3KwfpjTyGfhA5TsGz9NI2CZMtec9
	j4YLgvCyIgdSa+zE7jaY+KBniTS5gXxxK1r+Ny4U2lG83DYrFgPRE5MWOKuuc1yJhYFStzHjA5G
	AvVHoRjsTqtMs=
X-Google-Smtp-Source: AGHT+IGIOHylZejHQrceK+q3mkfYA8k9rlJp3ALqXwHKd+bcwttRKyvJp1rMrS18e3tSDE8PbwaKHA==
X-Received: by 2002:a05:6a00:81cc:b0:81c:717b:9d39 with SMTP id d2e1a72fcca58-81c717ba51amr236689b3a.56.1767798558555;
        Wed, 07 Jan 2026 07:09:18 -0800 (PST)
Received: from karthik.. ([43.247.159.43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-819c59df961sm5246114b3a.47.2026.01.07.07.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:09:18 -0800 (PST)
From: Karthikey D Kadati <karthikey3608@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Dan Carpenter <dan.carpenter@linaro.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey D Kadati <karthikey3608@gmail.com>
Subject: [PATCH v4 0/3] media: atomisp: refactoring and fixes for V4L2 compliance
Date: Wed,  7 Jan 2026 20:38:55 +0530
Message-ID: <20260107150858.79818-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses maintainer feedback and fixes build errors
in the atomisp driver.

Patch 1: Standardizes the 'Bridge' structs significantly by using
v4l2_rect instead of custom shadow structs and aligning ia_css_region
members with V4L2 conventions.
Patch 2: Introduces a helper function for statistics buffer allocation
to reduce code duplication and centralize error handling logic.
Patch 3: Adds missing error propagation for IRQ enable and XNR
configuration to improve robustness.

Changes in v4:
- Drop overflow fix (long long casts) from Patch 1 to keep it a clean
  refactor/rename patch (Dan Carpenter).
- Fix extra new lines in commit messages (Dan Carpenter).
- Strictly wrap commit messages to 72 characters (Dan Carpenter).

Changes in v3:
- Remove unnecessary s32/u32 casts in atomisp_cmd.c (Dan Carpenter).
- Propagate error codes in atomisp_ioctl.c (Dan Carpenter).
- Update commit message for Patch 3 (Dan Carpenter).
- Wrap cover letter and commit messages to 75 characters (Dan Carpenter).
- Sent as a new thread.

Changes in v2:
- Split into a 3-patch series.
- Standardized internal CSS types.
- Fixed integer overflow safety.

This series is based on the latest staging/next tree and has been
verified with checkpatch.pl --strict.

Karthikey D Kadati (3):
  media: atomisp: replace shadow zoom structs with v4l2_rect
  media: atomisp: consolidate statistics buffer allocation
  media: atomisp: propagate errors from ISP xnr and IRQ enable

 .../media/atomisp/include/linux/atomisp.h     |  19 +--
 .../staging/media/atomisp/pci/atomisp_cmd.c   | 142 +++++++++---------
 .../staging/media/atomisp/pci/atomisp_ioctl.c | 127 ++++++++++------
 .../staging/media/atomisp/pci/ia_css_types.h  |   6 +-
 .../staging/media/atomisp/pci/sh_css_params.c |  16 +-
 5 files changed, 170 insertions(+), 140 deletions(-)

-- 
2.43.0


