Return-Path: <linux-media+bounces-44460-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 224EEBDAD00
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 19:41:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851BD188718E
	for <lists+linux-media@lfdr.de>; Tue, 14 Oct 2025 17:41:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 001433074BE;
	Tue, 14 Oct 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jAlmNCLG"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC7D286415
	for <linux-media@vger.kernel.org>; Tue, 14 Oct 2025 17:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760463661; cv=none; b=XdHMvftwVj9/jQU/ynVvbUyWs5JK3Klyr8fghfgSPF1VsdBtqz3US2uvAl0zDLWp05li4q74mgeS/T9PUAx7lZMi/atHagwevtf4uf94705QJR2Ee53pMqtr/kl4ICqgwelNiHZfaUM7JsWIwyrXWicgS0YqcN0ldHykpEt3log=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760463661; c=relaxed/simple;
	bh=M69AvaAQmLGlZWwIbTSLRr9fnRzY8bclJS/oUth9tUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c4DluH5C0/2JMgnj7/7QPQwmiE7Txk0/6uWbMwWewTm/s3+OvvcREuNOdP38oO8miUZ8Nu+9p3MJKY16b56IZdrAVKe9KqoTN4HKVHZ8aQAA+QnlaEBAv9fp1OKuCWrEzRkr1FJ/pjaRa+g1m+FpccyLRHmJPtUd1v5qCnXskOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jAlmNCLG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95662C4CEF9;
	Tue, 14 Oct 2025 17:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760463661;
	bh=M69AvaAQmLGlZWwIbTSLRr9fnRzY8bclJS/oUth9tUo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jAlmNCLG5mLky1JGAcv9uP/CGBmlE2kGJzJET6cBuMpE8phsJL8TFmvtn1xbyGTVa
	 uFkMsluP3AAU/U8K42WI+UCVYZw7oAUCkDbdL/kt9X9gkUeBW1TuQySOtJN9qw/gpC
	 dPw9CZokTyKfiypYLEbVqkpevBVUgKbAFmyhb+ROatn3QNTfarXocn3840cL63O8Et
	 gfNPNOLcsWG7hzLGbu1L3V952pZhQPXe79SpI1tjLMVt+XAEIFJj2ktMX6fTt2zFt6
	 VmGX437y/sOZbRO+QHexssxxrXQyiWLDtqO4QXMKkNHdi24D61qwhxnfDivFYm3alJ
	 zIYUafKXWYdpw==
From: Hans de Goede <hansg@kernel.org>
To: Bingbu Cao <bingbu.cao@intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 13/25] media: i2c: ov01a10: Don't update pixel_rate and link_freq from set_fmt
Date: Tue, 14 Oct 2025 19:40:21 +0200
Message-ID: <20251014174033.20534-14-hansg@kernel.org>
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

The pixel_rate and link_freq never change, stop updating them on every
set_fmt.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/ov01a10.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/media/i2c/ov01a10.c b/drivers/media/i2c/ov01a10.c
index 8fe0b0d4f9e6..21fca0d13c87 100644
--- a/drivers/media/i2c/ov01a10.c
+++ b/drivers/media/i2c/ov01a10.c
@@ -620,8 +620,6 @@ static int ov01a10_set_format(struct v4l2_subdev *sd,
 
 	if (fmt->which == V4L2_SUBDEV_FORMAT_ACTIVE) {
 		ov01a10->cur_mode = mode;
-		__v4l2_ctrl_s_ctrl(ov01a10->link_freq, mode->link_freq_index);
-		__v4l2_ctrl_s_ctrl_int64(ov01a10->pixel_rate, OV01A10_SCLK);
 
 		vblank_def = mode->vts_def - mode->height;
 		__v4l2_ctrl_modify_range(ov01a10->vblank,
-- 
2.51.0


