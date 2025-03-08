Return-Path: <linux-media+bounces-27892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF1AA57EF7
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 22:48:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1B78E3A9885
	for <lists+linux-media@lfdr.de>; Sat,  8 Mar 2025 21:48:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECEAA212D67;
	Sat,  8 Mar 2025 21:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GaGOmCI7"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 473AA2BB13;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741470491; cv=none; b=iLnGmAHtAFJB4/SoQGymsSNrJHwEO5GzQc2L/JRi2dkqVNYD4yERa/fYBqrDEXXOyQQkP7uXEFoNSzSGUtXoUxDOnBUFMTFqWCftMs0CE60UmOajjNm5OgsyM5yTYFqy3Y4qBx+A/PT4AsDnfg9tOOcSpqIA5jVTyBjuVde6gDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741470491; c=relaxed/simple;
	bh=zUId9PjSmn0obYH/MQAPLhkKVd5X65P4v7UboY1hDOU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UN4vsuYwGF3yX+rJHGB6YzIlCXC0n7uccWN7c7Kd5nZPsq4QO/TFb4b8E4hiSBgjwqW65bFyKAqYOt27ATwga2u2kOwrqjcAncN5TX29crNLfRVp2v+0+truzg8+nmtJqNgR9a/Uo+i6bKjyj/6VLH3VyQJrgzqjCBdNFJWBQN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GaGOmCI7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAE63C4CEE0;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741470490;
	bh=zUId9PjSmn0obYH/MQAPLhkKVd5X65P4v7UboY1hDOU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=GaGOmCI7zEC1lNgGaQz9b82iWHu+EOBhuJnMKulktCqkNAlemy8ivEzO7jz7a5iSy
	 FAegUYgw2ho3xhNfHx+43FAb66k2Sua4GtpgCNW1A7ILznHxPq1aqHMfWMbrtw3fzC
	 TEu2X/ZVjmyfRGJ+QsWNqnVcOOKbGUd5uq2KiqA5XXFgSHUlGfxVz/xfNt4GGNnzJR
	 hCXbjAMyuRG/6V6ctllEGGrjY0aiiDZXEomzigf6RsJ9Xx/Qks1LF8YjiUVgcsSDRu
	 CtGDr1GntpSCqytGduloUWHeLhpovF1ygw/ZFtz2H2aTi7HTd8uRsjamMqhgMy2HRb
	 OdcF9bO3VjqSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B0C6C282EC;
	Sat,  8 Mar 2025 21:48:10 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH RESEND 0/4] media: i2c: imx214: Add support for 23.88MHz
 clock
Date: Sat, 08 Mar 2025 22:47:54 +0100
Message-Id: <20250308-imx214_clk_freq-v1-0-467a4c083c35@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741470489; l=883;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=zUId9PjSmn0obYH/MQAPLhkKVd5X65P4v7UboY1hDOU=;
 b=kuBfcjUn9LmwUeVpxN9JMXjKpC9oj0KgSPIF23LkhTf4kcucoLbcuUuXdPD1nrIiL6oLkcO+J
 2jDHZ+cYj/3BXn2MDnuYRTe9FSn8xeDi56og5e7IYivKLsZXM3Dx3Zz
X-Developer-Key: i=git@apitzsch.eu; a=ed25519;
 pk=wxovcZRfvNYBMcTw4QFFtNEP4qv39gnBfnfyImXZxiU=
X-Endpoint-Received: by B4 Relay for git@apitzsch.eu/20240325 with
 auth_id=142
X-Original-From: =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
Reply-To: git@apitzsch.eu

The imx214 driver currently supports only a 24MHz external clock. But
there are devices, like Qualcomm-MSM8916-based phones, which cannot
provide this frequency. To make the sensor usable by those devices, add
support for 23.88MHz clock.

Signed-off-by: André Apitzsch <git@apitzsch.eu>
---
André Apitzsch (4):
      media: i2c: imx214: Calculate link bit rate from clock frequency
      media: i2c: imx214: Prepare for variable clock frequency
      media: i2c: imx214: Read clock frequency from device tree
      media: i2c: imx214: Add support for 23.88MHz clock

 drivers/media/i2c/imx214.c | 188 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 146 insertions(+), 42 deletions(-)
---
base-commit: 942a51cca29ed20f23ba37f34ff52a6af32ab6c4
change-id: 20250205-imx214_clk_freq-3bf6a05de35a

Best regards,
-- 
André Apitzsch <git@apitzsch.eu>



