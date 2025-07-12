Return-Path: <linux-media+bounces-37545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 165B1B02C8D
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 21:13:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C2784A152D
	for <lists+linux-media@lfdr.de>; Sat, 12 Jul 2025 19:13:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9AE728CF40;
	Sat, 12 Jul 2025 19:13:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyThjj/y"
X-Original-To: linux-media@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEE1E275875;
	Sat, 12 Jul 2025 19:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752347626; cv=none; b=ZEYZD2FXa8kVLRn2fY3fykgjVbebABjbM9zGmHeEBFaEgUdkXgECYWd2sNjofSESsd5Fkbqx3vwk41+aGzsYFt6UAIK6hSTA3fat5BaItDbS15ipb3YhF2wpAq+9Fd86Znqe17KNsx3oSZnf5VEjOFHpNOiyPZXW6OsAyR8jELo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752347626; c=relaxed/simple;
	bh=KJin/EHTvDTBQXRUn5NEbpxZouun+ebCq9+ujQ1tSZ0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ksmxU0yhfkiDXkWwu1CLwZh2fgkfRzQZFUXe3S1KVXrcUoxtIevfxqDOx71II2ToVtQ4kelNhYMunxkWUbufRF8R0B27E2KUC6YtNQd4O75OjevRa5VLYUfAaGi5d+37LbGUm7DDnkfceLTuTAumAfBThFy7p11MwhXJa6wLAuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyThjj/y; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4f64cdc2dso448035f8f.1;
        Sat, 12 Jul 2025 12:13:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752347623; x=1752952423; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Uk7OIVhNCkZOCbdEqKaALvak+tALtSP7Gbings6es30=;
        b=NyThjj/yKrY7Ev/nayF6tUmzF70uMMY1vhZySG2vp/Pl9wzHK3m7w265OARvaGm/6d
         Bw/U6PF9jQ/xLQhRoq69aEbzmL9/mQRG4Clfau7M14sx+y3l7JmGOkaYWeL3XJqIG0RP
         cATGRx98uapFjL+8yirFEn4MKj3r+z6vwxdNILEPK4qsyE0wXhmABoWpapUIrzFn9pH9
         G21eAcZNkbYgynFwk9/7YbQTWVAbKyhB7GoXwIMi05j/15aC5vI+XP/afvKlbmLGfG5s
         /hhS4BCfdFJWDr668HmTuZQxYODbBYQdmpNIBR4oNDk9dGQa3y+4BDyZZobwSyEQgtYr
         X9kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752347623; x=1752952423;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uk7OIVhNCkZOCbdEqKaALvak+tALtSP7Gbings6es30=;
        b=saXZ/nen4DAWwIKu7VCPCLwQFV/RGslaokanhhLcJ5jUtxN6iKEF+V2R9dMJTQTFEc
         7J3+Xv78KmbY/GDOBRbfbD6Raqkr9KZw/S/ml5uXIb8sNGpq52avtYztNeCSqTEQ6CX0
         jGGhjWUmd7bov3fiMEY5vfN16hpk0URGZHJ2DuCJ+U1fN+E84gca7WWHyOKSpKBKUktv
         r5FPlfQ7ugrFpGOwLS5FeDC4+KrFteiTtEHk3JzkB7bd5i2ATqgH9XSx6GRsKhQCFxkr
         t8aEdg84r8ojJChHgrjmKrqOfHQ70ci+Q+vNJWicb/in0EJRoDQWgATgach6OlwjpLYW
         PIcA==
X-Forwarded-Encrypted: i=1; AJvYcCWsdZqDTE6YDYyjqc4aL0fjpz1QaS00W/QFNJO+GvXzzYn6lMjIJU2wZpwTrs2++tdT5W9WT12gcYeX0Ps=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRFCgw1DloRUBZOTDQfS3ltH4t9RWhUOsTIHPU3QP/2+W28kuG
	TP/M6VLVchKMKMtEDXfXxvrRO27ikenMceFDymHUIY7S6K5M9vhb/qwC
X-Gm-Gg: ASbGncuWjxxWidqTDR/rfIlIpBp/jhui5Ip6FyuFxd69S2taIkW+upcy7yte0qhDV1N
	5ek48MwWQ+OGA5d9uhZY+wqQkI51Nj2LXYScl/loLCtQpJ1zBy/mTm+tfPaFqZGLeWoZAfIeaKi
	l6+a2qb3CTG4UCuYsLEaRb9mxd9Loe1Yi4Ibx7amT42BCW/b9Mp15XJ0PQDGlAvm3C4j9U0birg
	ZnwhxIWRbpVavy78MuY5gI6uGL7jfWVswp3TFPvSoJC2AAOvsbXHp+GeAdW585QtlyuwUbSkkMo
	ay7DBzxhZ+wR572LymwkhSQ3AHLPrfxlB8UzHKw+e/aTx8dky5hgnX2j5zqJYYxXm/jxl2iVRDJ
	/myx1sm6hlt0aVSVnsuSiB3HZl7bRUcvYE2G9v2Av/GfDs6nY/Y9kNl/OWA==
X-Google-Smtp-Source: AGHT+IGrOLiglXKeSvNNhz3uLxDcdedoN3kV3nyhrWgBUWURBZi/gUNkTpSUE9cOpKnvyxpg0sxaOQ==
X-Received: by 2002:adf:9cc9:0:b0:3a5:2ee8:ee1d with SMTP id ffacd0b85a97d-3b5f18a6c77mr2090255f8f.16.1752347622114;
        Sat, 12 Jul 2025 12:13:42 -0700 (PDT)
Received: from localhost.localdomain ([102.42.96.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b5e8e26ff9sm7947939f8f.93.2025.07.12.12.13.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Jul 2025 12:13:41 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 0/3] staging: media: atomisp: More Cleanup on driver AtomIsp
Date: Sat, 12 Jul 2025 22:13:22 +0300
Message-Id: <20250712191325.132666-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continuing the cleanup work that is being done on the AtomIsp driver,
This series:

- Process the error inside hmm_init().
- Unifies the HMM init tracking method.
- move hmm related function to hmm.c.

Previously, These patches were sent individualy but they build on
each other so i resent them as one patch series

Suggested-by: Hans de Goede <hansg@kernel.org>
Signed-off-by: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Abdelrahman Fekry (3):
  staging: media: atomisp: return early on hmm_bo_device_init() failure
  staging: media: atomisp: unify HMM initialization tracking
  staging: media: atomisp: move hmm_get_mmu_base_addr()

 .../staging/media/atomisp/include/hmm/hmm.h   |  4 +--
 .../media/atomisp/include/hmm/hmm_bo.h        | 11 ++-----
 .../media/atomisp/pci/atomisp_compat_css20.c  | 12 -------
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 31 ++++++++++---------
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 17 ++++------
 5 files changed, 27 insertions(+), 48 deletions(-)

-- 
2.25.1


