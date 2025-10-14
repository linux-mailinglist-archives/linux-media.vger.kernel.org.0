Return-Path: <linux-media+bounces-44453-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD10BDAD15
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4559B54747C
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3EA304BD5;
	Tue, 14 Oct 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KY0x1Li2"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DA5308F31;
	Tue, 14 Oct 2025 17:40:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463649; cv=none; b=geXBt3mkG9ONoInqj6t9xh/xYJmAQexkdZ53VI0ttXKeL9tNqHzEqx1EW7VdGhn7nDYMKzQImzt5S8pYwC/DUJBu1l2aQP7IRcLumPF3NMjEfOjd/Fd5jQn5aS6NdUI5rHCiyb7MankVTxcWAeEaxufRckbLoEOcj6JcORuXiTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463649; c=relaxed/simple;
	bh=9uDuG9i4HzNUImpczib5NeGIF7tI1WXlc2cu4ugkO8s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q/Soyul7x2ak2KOJw5nbxuips5QLx3/+yJSrruO9q1sAPzWL95IURutPf/YDl7jrlkxfVRhf40MsxsO4ZXTNjsb7+vwbX5UW9sy6fLVo2Pxk/nVcQ6g9X2O9moMX/vVWCx4sQGWfE3f0MwSTWeuMcc50btRFg7B/s9mFu1o1h5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KY0x1Li2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 812AEC4CEE7;
	Tue, 14 Oct 2025 17:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463648;
	bh=9uDuG9i4HzNUImpczib5NeGIF7tI1WXlc2cu4ugkO8s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KY0x1Li2HJ+DRcqkl0w7wuAMwIdA5Eoun5fiIChHiIp4oHNOEedaPgyfRzX1EbTqY
	 a3yHW8gBEP967EI6OXmbWfQnxO5LpQ9NpdeZEiyMlvm6ecbQV1vIrL+WWZbWWp0ca9
	 +V8rsHAcn+mdzyygjmzDYVwT2RFqQeYR7bBLh0DcAeSA/EZlWwdNCG6uRLyjFY9j/M
	 47Qe+ukgiu4A57T0l7vXDKc7XjHCRKvu2R1rw+d5gDTQGIpIpXpBzZkkm9XxjBzpvZ
	 qebzrLceIzOYvt5tChiUhtglhOVHZJ2vld2H9ycOb5aBmZlX6znZe4VbRNQzzjuATO
	 +Cf5qPkNrvrOQ==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 06/25] media: i2c: ov01a10: Fix test-pattern disabling
Date: Tue, 14 Oct 2025 19:40:14 +0200
Message-ID: <20251014174033.20534-7-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251014174033.20534-1-hansg@kernel.org>
References: <20251014174033.20534-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When the test-pattern control gets set to 0 (Disabled) 0 should be written
to the test-pattern register, rather then doing nothing.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0405ec7c75fd..733e5bf0180c 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -406,10 +406,8 @@ static int ov01a10_update_digital_gain(struct ov01a10 *ov01a10, u32 d_gain)
 
 static int ov01a10_test_pattern(struct ov01a10 *ov01a10, u32 pattern)
 {
-	if (!pattern)
-		return 0;
-
-	pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
+	if (pattern)
+		pattern = (pattern - 1) | OV01A10_TEST_PATTERN_ENABLE;
 
 	return ov01a10_write_reg(ov01a10, OV01A10_REG_TEST_PATTERN, 1, pattern);
 }
-- 
2.51.0


