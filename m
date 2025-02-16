Return-Path: <linux-media+bounces-26194-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5B3A376F6
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 19:47:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AEA033ABD45
	for <lists+linux-media@lfdr.de>; Sun, 16 Feb 2025 18:47:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D90701A3056;
	Sun, 16 Feb 2025 18:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="othqiyfU"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C97B19CC3E;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739731622; cv=none; b=GRpj7jCytes/5yLYuqMWPG63u3EK1cl/ETO1Zlz9HraEiWlbu8OS1P0BMp/Fn/KxrTiBAns8glnrGbQzPVDlB9rtbKYrClK54Tvokqc5UmxcD5vhvkIbIPKZmTNFHy7eg+kNolE6VXQKqtvGd7PBkKylwLIXKGQxcG0lkQFiW8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739731622; c=relaxed/simple;
	bh=rJ3EJo67QZrfQjk9KphkLETXlDZM6lXQKTtE3crJb+w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kLf9RtE8tNM6IGwsF+C1Mx30j9radRrjMmAd5/i6uLt/PJyDdaVZobW6kCof2sNTIfnq7cwcsre6WGAPMh+gxK3+oxVyeVCVn49Jac+LzqaRNEvOW86/ur8h+zG75SMG5bApwEm9VPoQ+zDltBjyIgEmqAYfKi93+zyOHa4i91Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=othqiyfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 901F6C4CEDD;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739731621;
	bh=rJ3EJo67QZrfQjk9KphkLETXlDZM6lXQKTtE3crJb+w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=othqiyfUgNRdn3iyQkdUP9WyHx3QwKQS8VdsE4WUh/9B20TAMTvKLEBRhoxmr1QPg
	 H9fAMPBLerlZ9NBvm7vmR9SS93eQaaIJof2irrhilIVEHaXUj68bDaJOGAORP54JTj
	 WXxBCiimavc/lhPnQqq8rgreisVZXOiH6YwCXsTAf4nSJ5b7anRxoN/DICYOysfpzb
	 mUfOPToYa+8aUV+yP6R5ZbRU8jftbUVPnkY/TgVqgCQSXMtZDWnd4dviNY0/ehgnM1
	 TYPeoKYbbaGUO+BSZTTi1YzeNKSj8GdW9DiMQOhuUAUhFvRXQFHm6lHX9Ey8FZFzNZ
	 66arjtsN0OIvA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7ABC4C02198;
	Sun, 16 Feb 2025 18:47:01 +0000 (UTC)
From: =?utf-8?q?Andr=C3=A9_Apitzsch_via_B4_Relay?= <devnull+git.apitzsch.eu@kernel.org>
Subject: [PATCH 0/4] media: i2c: imx214: Add support for 23.88MHz clock
Date: Sun, 16 Feb 2025 19:46:43 +0100
Message-Id: <20250216-imx214_clk_freq-v1-0-812f40f07db3@apitzsch.eu>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJMysmcC/y2Myw5AMBBFf0VmrUmVWvgVESmmTLxbRCL+3QTLc
 3PPucCjI/SQBRc4PMjTPDFEYQB1Z6YWBTXMoKTSUkktaDxVlJT10JfW4SriyqZG6gZjbYCtxaG
 l8y3mxcd82zm8/eN9P6SaR0h2AAAA
X-Change-ID: 20250205-imx214_clk_freq-3bf6a05de35a
To: Ricardo Ribalda <ribalda@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Apitzsch?= <git@apitzsch.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739731620; l=884;
 i=git@apitzsch.eu; s=20240325; h=from:subject:message-id;
 bh=rJ3EJo67QZrfQjk9KphkLETXlDZM6lXQKTtE3crJb+w=;
 b=FuN7euOnqyx4NSMvv220hPYnePtYt3PcpliJNlPCs5BQwXml35M/PyWVVwPOEOKZhys5HB/QI
 Ff7rT06hnLRBN96GBH3O6Vmsj3S85D7u6C1PTJT0Nf0dnelvazd5uoD
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



