Return-Path: <linux-media+bounces-30897-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5E5A9A2D9
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 09:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 28F10445054
	for <lists+linux-media@lfdr.de>; Thu, 24 Apr 2025 07:06:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC96A1EEA4A;
	Thu, 24 Apr 2025 07:06:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="CDPqyF5Y"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BD552701C3;
	Thu, 24 Apr 2025 07:06:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745478392; cv=none; b=gxm04D2p9qVoOoHqjiu7jD4EXMc+LnX4txkDQYqGKL2prRGnZEUKZmMLctBnc0ebFDIUsaAj+WoGQvDwI+AOKMvbO3SZ6mI6S7WR8ERecuUKqtJxsGorIclYvJCI5xxJfFyRAjieYICf4KzOYYudyZlP0nVS11lmmUcPH3bUIGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745478392; c=relaxed/simple;
	bh=QEM4fG12Du3lXyyzmwTtbn0ocTc3IJmbD83fHWzwrd8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KINmCEhQV4fxGL1wGOHve/sKAf8X4HKGQPNZkWi0kc7Q47w08OSGAiqw5CeR9P0Lk4m08w1Z7SP9knGcSd8RJcZiifqwl1VQa5pJFsLFPTfdoyodsZE3q/rupb/SxrBh4gMb+8Bdm4TX8tbybqXmHI82XgDA/+6h/rxMrhbdDCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=CDPqyF5Y; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3B8DB16A;
	Thu, 24 Apr 2025 09:06:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745478385;
	bh=QEM4fG12Du3lXyyzmwTtbn0ocTc3IJmbD83fHWzwrd8=;
	h=From:Subject:Date:To:Cc:From;
	b=CDPqyF5Ymx3fG7a1c1upo0WOqW622Tk1DGWQBZzznRW/eXShpyT5+Zc7lCcBePvUy
	 UpdZTnhyajVeZ6/gmB2/E3XzEmt7Zy12HrecHyMj0DBPKEL2DnIHvh/Tuj/mwPCIRy
	 pHBqigaR2YdRPYxr+x8jhFrXRardbtKXycNYYdyE=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v2 0/4] media: rcar: Fix RAW formats
Date: Thu, 24 Apr 2025 10:05:32 +0300
Message-Id: <20250424-rcar-fix-raw-v2-0-f6afca378124@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL3iCWgC/3WMQQ6CMBBFr0Jm7Rgo0qor72FYjO1UZiElU4Maw
 t2t7F2+//PeAplVOMO5WkB5lixpLGB2FfiBxjujhMJgatPVrTmgelKM8kalF3p3si7GYxdahqJ
 MyuXacte+8CD5mfSz1efmt/4JzQ3WSNxZ33hHJtqLBKacxlsiDXufHtCv6/oFfQH8Uq8AAAA=
X-Change-ID: 20250324-rcar-fix-raw-c7967ff85d3e
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1310;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=QEM4fG12Du3lXyyzmwTtbn0ocTc3IJmbD83fHWzwrd8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBoCeLtCNlWn7GH6DLq2bgVG41ys9YR3mm6f78yN
 KxQYmMEa3qJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaAni7QAKCRD6PaqMvJYe
 9arqD/9yrPW/VCbT1CuDx/87o3T+MuVla72PRj3GMUbxM/6CgHtiA0dHNuxGF5GVL0uoqnMN/kk
 P0q8uiyx8xwpNXAGeJRvAuhmdfHVU8Jfy9cuqbdNuJBaXyHrm46hXNTGLSqHLFegbGUGrMgJhk1
 H3uva+dAGZqZkUG1k+pMfnZtzzTJ3NRY0AY6J1Bmokr+g0JYJVlemUS9SGlnTJyeUWYtnDGIDNx
 vZwbFlXlW9Xwb9adjcqdB1jK7aG4pUpsIjAs9Xl5GnvVrKdQMLR7qqu4DWRaAbEqQXrPSWKu4EI
 yEI7H7hgUt6GGjx7AHB2bkZeKXujMwS0KetHwQeoBIPCoPQ1niQosAQGC2u0oEvZZmgqeMPKvm/
 SMT6uYiE/EDCbZ3CeJUgqCJf2GNxHU2VQd6yxTJR9DZ8x57nAluuamXEP3BjAEv004wEkCU3r/V
 OMFy7lG8v2XitoS1rfLNyzMRUIOa5zA71vEKqUmjuQvi+13CqhBEY128Xz0nhcWzA62CIXLfZBJ
 I4OpJgxyP191RnSabCGBrswQLesLBvcRTn8mPFl5QLfl7eRidPadArfBj1wWfKZbCaC7Fa/S0a2
 XKM4jsftdX2lxxkyZCUa0OjzvYqfKBHdmWc5GMnSItjHdIWnJVmfR374e9LV3hWOOwQlPHjyFkh
 tLoZAiySquADKxg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix RAW8 and RAW10 formats. These are taken from the previously sent
"[PATCH 00/18] media: rcar: Streams support" series.

I can only test these with multi-stream setup, which requires a big pile
of patches on top, so these are not really tested in upstream.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v2:
- Add a new patch "Remove unnecessary checks". This allows us to drop
  the somewhat hacky additions that were made in "Fix RAW10" in v1.
- Link to v1: https://lore.kernel.org/r/20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com

---
Tomi Valkeinen (4):
      media: rcar-vin: Add RCAR_GEN4 model value
      media: rcar-vin: Remove unnecessary checks
      media: rcar-vin: Fix RAW8
      media: rcar-vin: Fix RAW10

 .../media/platform/renesas/rcar-vin/rcar-core.c    |  2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c | 34 +++++-----------------
 .../media/platform/renesas/rcar-vin/rcar-v4l2.c    |  8 ++---
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h |  1 +
 4 files changed, 13 insertions(+), 32 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250324-rcar-fix-raw-c7967ff85d3e

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


