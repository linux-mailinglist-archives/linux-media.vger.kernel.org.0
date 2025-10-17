Return-Path: <linux-media+bounces-44805-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51952BE687C
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 08:05:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DC415E0A0F
	for <lists+linux-media@lfdr.de>; Fri, 17 Oct 2025 06:05:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3A2C30E0F8;
	Fri, 17 Oct 2025 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iC9npxt/"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B8EE334689;
	Fri, 17 Oct 2025 06:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760681142; cv=none; b=l0O66gdaKH6HkcEDVy4jXZTeaz1oF6aV3uqxY3fR8Ir16FLn+tXZPE1fLs9sfbly64/6Yup6qv0PYe+T6OgBs3ddxJ/4TZ9+wgCY7yOigFYqvJHGKBC7DMnxIQSqRuirkVD4Ej0/OJX9Ftcm2YFNGo3zWyPs+qHo7UX60VYUevw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760681142; c=relaxed/simple;
	bh=O2Oy8ICMUpnQA08jtfFmNb9AwQw2RYowYsYjQiBZUUU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BBKN9l+THT/HDR9/OQ7khmv4lJP6S7Ok7kgIXGEF+KjOIoh/mS0ZJjXI66sZppOZr0AtqVitUBRn6/DxseCoBmLRIGpICJAR1J5uegM0WLSxbPDULa2+D+2sz2P/8dVjmgdGGC2WI+SrcnRTFlNxp0HAFcVM6/HIwOLbCEGXcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iC9npxt/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F14C4CEF9;
	Fri, 17 Oct 2025 06:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760681142;
	bh=O2Oy8ICMUpnQA08jtfFmNb9AwQw2RYowYsYjQiBZUUU=;
	h=From:To:Cc:Subject:Date:From;
	b=iC9npxt/Gq3Cs9A+M9pNrJIR6yMWDgDXZnaNpRcejodPudhb/+5YTd6x7X5zlxXJz
	 K77fGWuUaa4QKBJptHUSe+ikzFYfIYbGtwmfV+cgFK3MoBe5ybDpgvp9kf6XHDVPHH
	 IxXb2YkjQabr4wGwNj3njIwWtsGISN2NwcUzQjxKX8Vb0b7EcNGlrSVLgVEbwft3W+
	 YKKb3WufjpUlg5k+2ynB5lkfi3xdAh0+5kI5sKPAD4zif8ieaMvQh1NHoZWxkVfDun
	 BFXSFLmcOexQn1t+YDepuMpQ7e5PmLQlJZQNJBnCzKba1Mk5JFj3r5TIhsMmNkz16X
	 odmEpH2G/fq0g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1v9day-000000002FK-43KH;
	Fri, 17 Oct 2025 08:05:45 +0200
From: Johan Hovold <johan@kernel.org>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
	Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
	"Bryan ODonoghue" <bod@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH] media: venus: drop unused module aliases
Date: Fri, 17 Oct 2025 08:05:40 +0200
Message-ID: <20251017060540.8624-1-johan@kernel.org>
X-Mailer: git-send-email 2.49.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The driver has never supported anything but OF probing so drop the
unused platform module aliases.

Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/media/platform/qcom/venus/core.c | 1 -
 drivers/media/platform/qcom/venus/vdec.c | 1 -
 drivers/media/platform/qcom/venus/venc.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index abf959b8f3a6..24d2b2fd0340 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -1146,6 +1146,5 @@ static struct platform_driver qcom_venus_driver = {
 };
 module_platform_driver(qcom_venus_driver);
 
-MODULE_ALIAS("platform:qcom-venus");
 MODULE_DESCRIPTION("Qualcomm Venus video encoder and decoder driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/qcom/venus/vdec.c b/drivers/media/platform/qcom/venus/vdec.c
index 2d822ad86dce..23376b87b6a4 100644
--- a/drivers/media/platform/qcom/venus/vdec.c
+++ b/drivers/media/platform/qcom/venus/vdec.c
@@ -1879,6 +1879,5 @@ static struct platform_driver qcom_venus_dec_driver = {
 };
 module_platform_driver(qcom_venus_dec_driver);
 
-MODULE_ALIAS("platform:qcom-venus-decoder");
 MODULE_DESCRIPTION("Qualcomm Venus video decoder driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/media/platform/qcom/venus/venc.c b/drivers/media/platform/qcom/venus/venc.c
index f1abd2bdce6b..f86ca5a3b23f 100644
--- a/drivers/media/platform/qcom/venus/venc.c
+++ b/drivers/media/platform/qcom/venus/venc.c
@@ -1661,6 +1661,5 @@ static struct platform_driver qcom_venus_enc_driver = {
 };
 module_platform_driver(qcom_venus_enc_driver);
 
-MODULE_ALIAS("platform:qcom-venus-encoder");
 MODULE_DESCRIPTION("Qualcomm Venus video encoder driver");
 MODULE_LICENSE("GPL v2");
-- 
2.49.1


