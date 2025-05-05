Return-Path: <linux-media+bounces-31739-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D4E5AA9DC8
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 23:06:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 05AF917F538
	for <lists+linux-media@lfdr.de>; Mon,  5 May 2025 21:06:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 329C627466E;
	Mon,  5 May 2025 21:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uJ4zZa60"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78FE61DC994;
	Mon,  5 May 2025 21:06:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746479181; cv=none; b=pZkvYYR8xoli0iN65/t1tGS5euwQkD9coYoqoWsicqix/iBnvJAKnrqhmPLhjuM9HQ2IfRi4LM8Lk2I5SgQmhgiYABT7kyXAM2RdnVPXm4YEsPnKQPio3YTk0TYeSh/CDfYmFkqmEeipxNLPWl7stpMiI87DwyeNAL6ig6y3OCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746479181; c=relaxed/simple;
	bh=am5E7+Utqe8zi5JH7YG5Vf5BHDNKW2H7Tn3z0DNQRQU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=p3VA/LATk/nDAXO/d8WWm2BiGU+lrLEISmenojKX8mfwHAP3iqA7NZJy7/FL4dg5D9NmRd7ZNHXE61WXcUt5VwmP3+mm+U9aj5M4BPPQODL7L8hKFdxcWF5ZIGalH+mmP6FiizRkRyzr6ApIWptutyhIoRdiMJYzO63KKcaQy8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uJ4zZa60; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB185C4CEE4;
	Mon,  5 May 2025 21:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746479181;
	bh=am5E7+Utqe8zi5JH7YG5Vf5BHDNKW2H7Tn3z0DNQRQU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=uJ4zZa60O9pseWKTACgMvfJgkOZ8BLFJtzT2sVuRRkShaosUq7GErvFRLY5XsP/Wd
	 96zWqXXFf1ZGbW2XU7qy1ongTL96h4jALHddrJ2H/DSaHA1BE8gjy3uh4OJTpC4v79
	 3QrZzXyKbHsLPTfU6OTFKeR1cDcBhjXUqwpoVeOO8C7GXl+dmJUOvEzzcp/nX7Bt7z
	 KtxvuXUc4uBYNKrnW5HDe4bAx9scDNqP2AE/0opBu2XrgunKt1fd6K9b8XaUeKPmvn
	 7kmo/ZMvwKWgOGu5qIdKmKfnf4i7KH95xepn2TYpHtGDwAMj/+87eowpD0g3UGiIXQ
	 /zoOinty6Rg6g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7F2AC3ABB6;
	Mon,  5 May 2025 21:06:20 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH v2 0/4] media: i2c: imx214: Add support for more clock
 frequencies
Date: Mon, 05 May 2025 23:05:52 +0200
Message-Id: <20250505-imx214_ccs_pll-v2-0-f50452061ff1@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADEoGWgC/13MQQ6CMBCF4auQWVvTllbUlfcwhNR2kEkQmhYbl
 HB3K3Hl8n/J+xaIGAgjnIsFAiaKNA455K4A25nhjoxcbpBcaq74gdFjlkI11sbG9z1DZdBxPKE
 uJeSTD9jSvIHXOndHcRrDa/OT+K4/Suh/KgnGmStdVakj6vbmLsbT9I622+MT6nVdP2IoWlquA
 AAA
X-Change-ID: 20250406-imx214_ccs_pll-e4aed0e9e532
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746479179; l=1442;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=am5E7+Utqe8zi5JH7YG5Vf5BHDNKW2H7Tn3z0DNQRQU=;
 b=NvbuxybdvAAlUaRuGYo/IWVQESiEcW3K0U/sph25LQlmsSTSxh0MGK5u6cA+i4fcaHMmDTGp5
 2pAPo+eHXqnC10E+3d8D0hG3TP/wgT0FJVhiZKTGEeeOKNAYuQyt/Kg
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

The imx214 driver currently supports only a 24 MHz external clock. But
there are devices, like Qualcomm-MSM8916-based phones, which cannot
provide this frequency. To make the sensor usable by those devices, add
support for additional clock frequencies.

This series supersedes
https://lore.kernel.org/linux-media/20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu/

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
Changes in v2:
- Add A-b tags
- Switch to v4l2_ctrl_s_ctrl_int64() to acquire the control handler mutex
- Add error handling for v4l2_ctrl_s_ctrl_int64() and
  imx214_pll_update()
- Replace "read clock frequency from dt" patch by "remove hard-coded
  external clock frequency" patch
- Link to v1:
  https://lore.kernel.org/r/20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu

---
André Apitzsch (4):
      media: i2c: imx214: Reorder imx214_parse_fwnode call
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Make use of CCS PLL calculator
      media: i2c: imx214: Remove hard-coded external clock frequency

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx214.c | 266 ++++++++++++++++++++++++++++++++++-----------
 2 files changed, 204 insertions(+), 63 deletions(-)
---
base-commit: 4d4cc73d2632e07451c98c77fdb04aead3f78b00
change-id: 20250406-imx214_ccs_pll-e4aed0e9e532

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



