Return-Path: <linux-media+bounces-44450-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A1BDACF7
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6A2B1546E35
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E906530171B;
	Tue, 14 Oct 2025 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xk6tp37I"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC54221555;
	Tue, 14 Oct 2025 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463643; cv=none; b=OrG5elKEp4Y6RcPSf27jpwHZ04KeaeSgMtDpGpVJ1fmH3z0Gh77+Jr1yD1jaDTf4nUnuJ6TNSU7mJYhi65cxR1G8RlH2hchflI3eDE9bn1VK1l1GVfqcLl1hsVs469Rx4JFZ6WSDOeiu1Eq3B1/+SoREY7KbdBsb16L4MC0tImQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463643; c=relaxed/simple;
	bh=YzU/b7DDIQx+RR2mRtQMPFk7ARL4otQFnfuZxz7phOY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qnAMOEIcANxrnhqfq0QCZ69ROWXzL/rAAkXYPExkaeMeyFg2yCgv/edJjNZLSvrMA43PqjVIcvzqFFqRchmcJkEVYKdXeDCAEcFCvpU1JX04raKstv3oTJol1AuX1pm7U0qop77JmdhKPiJMYhW50L9D28YD5uMyBpnlDrSAvS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xk6tp37I; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93DAC113D0;
	Tue, 14 Oct 2025 17:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463643;
	bh=YzU/b7DDIQx+RR2mRtQMPFk7ARL4otQFnfuZxz7phOY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xk6tp37I8frr5ielPGylHH1uJ/j+mAYUQ8sHq9Pu0x+2UqZeZNccCWi862dBM+GLE
	 VkwXqq0u05UurR0RFMSKKGeJNXnWI1n6z7seURGrQjp0s7xFc0iPMitXHZTOJsVUxW
	 fwCwOF4pcxlFPqpPw9I5VSKt7KRPRXJazTAisgjAth34hyL7gI90Dwkw7X9vwcciQ3
	 x3VmPZJAyDKFO9ru5rrTNEHLmoUvN0dTW7C+pxQirzuXflSedZ/SC+k7FG9oWj/OeI
	 qkD2qR3+0NguwIj4K5TEDPzB/5ihcm2MeSnWKRpYf2QHUnVoiCi9xfn8XlJF5Wa1AZ
	 B3hJYqDaK0DIw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH 03/25] media: i2c: ov01a10: Fix gain range
Date: Tue, 14 Oct 2025 19:40:11 +0200
Message-ID: <20251014174033.20534-4-hansg@kernel.org>
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

A maximum gain of 0xffff / 65525 seems unlikely and testing indeed shows
that the gain control wraps-around at 4096, so set the maximum gain to
0xfff / 4095.

The minimum gain of 0x100 is correct. Setting bits 8-11 to 0x0 results
in the same gain values as setting these bits to 0x1, with bits 0-7
still increasing the gain when going from 0x000 - 0x0ff in the exact
same range as when going from 0x100 - 0x1ff.

Fixes: 0827b58dabff ("media: i2c: add ov01a10 image sensor driver")
Cc: stable@vger.kernel.org
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 0b1a1ecfffd0..95d6a0f046a0 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -48,7 +48,7 @@
 /* analog gain controls */
 #define OV01A10_REG_ANALOG_GAIN		0x3508
 #define OV01A10_ANAL_GAIN_MIN		0x100
-#define OV01A10_ANAL_GAIN_MAX		0xffff
+#define OV01A10_ANAL_GAIN_MAX		0xfff
 #define OV01A10_ANAL_GAIN_STEP		1
 
 /* digital gain controls */
-- 
2.51.0


