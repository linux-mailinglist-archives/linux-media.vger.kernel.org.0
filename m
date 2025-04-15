Return-Path: <linux-media+bounces-30281-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CB4A8AA08
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 23:23:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4110F442C4D
	for <lists+linux-media@lfdr.de>; Tue, 15 Apr 2025 21:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C2A2262D29;
	Tue, 15 Apr 2025 21:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwKwS4Py"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6189023370C;
	Tue, 15 Apr 2025 21:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752166; cv=none; b=DgZikzC+P0HJBpSqvEhO4WbgoUZR+hg+37CfZ75otNGETHmdunrSBESd8zIBkY1cXxc/fhwvyj4AJOfqrptG+LMbSa2mZ8rI4mr36sBzViUnbniNY2erVCOu9wAko4jwXeWIwxJg7jqU6UR6Hb0oQ27Gfzm+583sRb6zxDvJ6ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752166; c=relaxed/simple;
	bh=7zVUtljGidorOLsS4uAD2nmE4ANyfK0eCdDp8g5uebQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z30pkwjWt2lvZHZfL6BHerEwBKdGI4yqtZoFBoAT3a7rnRArYnxJUjjYxa6NOO/5pAGDHRlEOC/ubvlwN14kuf/5Ss+cs9cSvPYI99ZeRo7idJwnt2ltgSGQuroUQcLjnHD+gsX0Ku/4c63Qi9WMHzzteAHqKFgwdNW59QmYXyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwKwS4Py; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F3ABC4CEE7;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744752165;
	bh=7zVUtljGidorOLsS4uAD2nmE4ANyfK0eCdDp8g5uebQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=FwKwS4PyPVBz+If0leU/yq4hg2VIgpFOb5WJLAnTzxQY8TWLH3k3KnFbu7KLKbIZ7
	 yMRY6fcTXiN+yFRsbvQmmLWUj23b3y32jTpYC98Q/gLRCkvIJ3bkowYzcp3QpQ/OGX
	 ReKJujbB5ugnElDpKAQ2N0vbQ4emqtjmEK5gT+hCM79ljaiMBynUfHEm+/1ttnQcYZ
	 5FwOAjzJQcQmym4CuCCWVQPCVAlcC8bCrchdXriJjD9eGpNDhy8aNQhYrwned6Ok8H
	 j7LOhLzqaGlAUSkQZ+VVlfbwW9YPzgZn5MNIq/riUzXmukm6J1r1yO/3fnEg3etobV
	 cpxZ2oV2udEIQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BF8C369C1;
	Tue, 15 Apr 2025 21:22:45 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/4] media: i2c: imx214: Add support for more clock
 frequencies
Date: Tue, 15 Apr 2025 23:22:14 +0200
Message-Id: <20250415-imx214_ccs_pll-v1-0-d3d7748e5fbd@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAbO/mcC/x3MSwqAIBRG4a3EHSeoWVBbiQjRv7pgDxRCiPaeN
 PwG5zyUEBmJhuqhiJsTn0eBqitymz1WCPbFpKVupZGd4D1rZWbn0nyFIGAsvESPttFUoiti4fw
 Px+l9Pw8JVeRgAAAA
X-Change-ID: 20250406-imx214_ccs_pll-e4aed0e9e532
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744752164; l=1042;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=7zVUtljGidorOLsS4uAD2nmE4ANyfK0eCdDp8g5uebQ=;
 b=jSZ1gTTw4HzCRtRKEtmcDRQuWRaTCEle2bfWQZPN7igj2mH2SxaRIwrdEIS+LddecuwT57f59
 rIruLG1rcd0Br+V8X8DIPOIdO+HgJItymEf8qZd5PFaH7PX0vIv6mA3
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
André Apitzsch (4):
      media: i2c: imx214: Reorder imx214_parse_fwnode call
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Make use of CCS PLL calculator
      media: i2c: imx214: Read clock frequency from device tree

 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/imx214.c | 262 +++++++++++++++++++++++++++++++++++----------
 2 files changed, 205 insertions(+), 58 deletions(-)
---
base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
change-id: 20250406-imx214_ccs_pll-e4aed0e9e532

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



