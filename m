Return-Path: <linux-media+bounces-28623-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 98A26A6D94B
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 12:49:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5A13116C838
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 11:49:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C74BB25E467;
	Mon, 24 Mar 2025 11:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kFSbO+BR"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C28E1A317E;
	Mon, 24 Mar 2025 11:49:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742816963; cv=none; b=FKF0rPqItQpYn8OnGdxOHAsiUd5wz28/DPXK5Ytc397cTNp0EnFFTycAfeBxO8u1gRVKbylmwQOn5HtPxAq5JfnpJKs009AcG4rf/9Ubj6hBSa/WMAgsfc+hMmq5V4AIbDyLsrfcBGStSvigY+ZDBsGaZwa34kzCinwBwHGYt4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742816963; c=relaxed/simple;
	bh=277UfwMe2ihlp5omB3hoUJLlTXn0pZ8v1JNlMqQWxSk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C2wPqhVDbIW18y+NWZwkOVKQaQQ/YaJR6Ur+dVodNiARULKZ9uJ6zxurkx76TPwgSf0pLdKwOzZlLk4N1ZU8RD+SsJEijGAxPD5rPopQ2NBoMfceazm/Lstfyx4BTN3Sr89Hod0dFBjgFTmlRRdIXGznaWeJBSdQR340AWzOUsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kFSbO+BR; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D47E8455;
	Mon, 24 Mar 2025 12:47:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742816853;
	bh=277UfwMe2ihlp5omB3hoUJLlTXn0pZ8v1JNlMqQWxSk=;
	h=From:Subject:Date:To:Cc:From;
	b=kFSbO+BRIF0NC/Ia7iU/b5dZFokEanJ6rvIfm3FM2iY7eq/rF2AIf3me8FMNyPtxs
	 +Mgz0t3gCARZmp30V1Bjyr+uB4wAVLQAxb1wuP4ga7eT9xv/XwCzWWmhWsHXymzjab
	 WNTl3sX6ommeDLDaGmKgopzi1wz8Q7abEvCsV1s8=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 0/3] media: rcar: Fix RAW formats
Date: Mon, 24 Mar 2025 13:48:51 +0200
Message-Id: <20250324-rcar-fix-raw-v1-0-ae56c1c7a2f6@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKRG4WcC/x2MQQqAIBAAvyJ7bqG0svpKdBBbay8WK1QQ/j3pO
 AwzLyQSpgSTekHo4sRHLNBUCvzu4kbIa2HQte5qo1sU7wQDPyjuRm/H3oYwdKshKMkpVNS/m5e
 cP4ZrW2teAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=277UfwMe2ihlp5omB3hoUJLlTXn0pZ8v1JNlMqQWxSk=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4Ua5lchyUbRCiI3K0IYN0JUIImR9zNiKsYmAI
 eKHZbYawweJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+FGuQAKCRD6PaqMvJYe
 9f2kD/9Jj0VpVgGQWU9FYRwpe+DoKZ7vSTUgLN5EF7xO2sFpsl8287jgVva/i6KPrMvCUi4WN0B
 HyaLmefvw3a0F7gFFRaUDpeyEOzPLSLui1SCgLDimw8andOCmk8wQ+wFE7VQwHEpQtHwcsz3NYQ
 FM+yK2CW/1o8FfTz8Nn3ExrTP++y2zattPlHgNiS0bdeai/y/OHnAxHQaMFebPZF+IBfQkn9Vwr
 K9O9nBkMdi0C9rhruv1SMuoGc80CTCWj4GiY4cNZF9Q3etNno9aFs6ScSn4gOKjXx7WugBfr7mn
 uq2XvRwqfUbnPzTcV+WHPd/+b8LSvz28ZuG20TBOfpf2RoqHYVTK4WFwNEb7RY+rj1UtaGIAllK
 +B8qIxlaqaYHl5t8f2VNRHbzC9doLRRtl5C1I0kjkb7ekeJWs0plw9FeuRaJAOqCLNVW671S0Th
 a6Pb/JqhtYPeoTfzpUdAkC2M6FBd5qh77k+oSFrAKSWLFasfcML5ypz+9ScmxMDZUsov9dsA2te
 sVzonY0cVviK3X8gbcrS/p/QbNKISlG1qoiGxApc1gcJHsqyXoPK2tdYqZd8NdhDKi0wzKhOyo4
 HcQwfetRKaiyDDBk2WYaAMD/t/A4GEzCGjKxfOWZLTTaXzKrp1yp0nx7nanISj3g5Uyi7xjATHH
 okTMvkDmZO4zwxg==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Fix RAW8 and RAW10 formats. These are taken from the previously sent
"[PATCH 00/18] media: rcar: Streams support" series.

I can only test these with multi-stream setup, which requires a big pile
of patches on top, so these are not really tested in upstream.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (3):
      media: rcar-vin: Add RCAR_GEN4 model value
      media: rcar-vin: Fix RAW8
      media: rcar-vin: Fix RAW10

 drivers/media/platform/renesas/rcar-vin/rcar-core.c |  2 +-
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c  | 20 ++++++++++++++------
 drivers/media/platform/renesas/rcar-vin/rcar-v4l2.c |  8 ++++----
 drivers/media/platform/renesas/rcar-vin/rcar-vin.h  |  1 +
 4 files changed, 20 insertions(+), 11 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250324-rcar-fix-raw-c7967ff85d3e

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


