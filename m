Return-Path: <linux-media+bounces-38543-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 70ECDB13830
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 11:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B40C21883472
	for <lists+linux-media@lfdr.de>; Mon, 28 Jul 2025 09:48:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4B32426AAB7;
	Mon, 28 Jul 2025 09:44:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VwYfiZLl"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB4025C802
	for <linux-media@vger.kernel.org>; Mon, 28 Jul 2025 09:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753695871; cv=none; b=V2Zg3lXRNdUzZcf7hz7bYdrXtdjyxHjEa270um9zjjudVnugSztDA3TSeRRyi46kWLttkYLEQzqZxWR5+r74XUUMBsYGZtSpADkGz12IdMlQ9mH9uNxD8DAlLNULav0J4ieq1XnlMlsblzVSkV6BCctQ+E6JP0iI19mYoAjA/Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753695871; c=relaxed/simple;
	bh=3mgkEihmtU/EZh/G1SDyR/OWTIA5RrNL3zyp2vDAy5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kydcTkZo02U/uNN6xbBOPLUYfkmEf3Bkc5NceFbS3qzs998it3m0owh8KINAWpR/juOtnYdHdjnWIJReTCqWSf71mwJZyxtGT6d3bwx1c6eMIoY24gF3BVNvSJBLjKfo+Bel/jO1nv7DmZs3FpcPYZZ94Y+FxarJ9Me75JjYc8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VwYfiZLl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3C8CC4CEF8;
	Mon, 28 Jul 2025 09:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753695871;
	bh=3mgkEihmtU/EZh/G1SDyR/OWTIA5RrNL3zyp2vDAy5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VwYfiZLlxdB2XBvGAtxYuDU0LWeezFjBMa1qtwDEqeoacclQmMArNMqPrzRGI6o/b
	 nsJ6rovnpLSuxLSQh8jC7XXuJRYPTmYJ2a8MsLGkwIj2hFWjzj0BJr2m4ySO9e74op
	 mBWwjheqJ6/oicfhpwm1ta3f2STenfWzQAuepdGNoUISiYVXghZTxyrbRnziS7nzRD
	 YuIefnCjHLL8hVt5b++y1HIEwEyRiO/t99gtNTI9MfX4LL6e0ewEGCzPTXL7fBLAt4
	 rEwc9fyX596jiK/GhJDYH/8AYrAdrolwH6wRxio4YCF4+OU/ipGyHSuyn7XJuQMPSr
	 xh/R2S04z3U1Q==
From: Hans Verkuil <hverkuil+cisco@kernel.org>
To: linux-media@vger.kernel.org
Cc: Hans Verkuil <hverkuil+cisco@kernel.org>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 8/8] gpu: drm: display: drm_dp_cec: update Hans' email address
Date: Mon, 28 Jul 2025 11:41:57 +0200
Message-ID: <c34e8330df68015a2bc5c436c0b8ca57f3295b3e.1753695717.git.hverkuil+cisco@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <cover.1753695717.git.hverkuil+cisco@kernel.org>
References: <cover.1753695717.git.hverkuil+cisco@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Hans Verkuil <hverkuil@xs4all.nl>

Replace hverkuil@xs4all.nl by hverkuil@kernel.org.

Signed-off-by: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/display/drm_dp_cec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_cec.c b/drivers/gpu/drm/display/drm_dp_cec.c
index ed31471bd0e2..d0dcc9b4b92d 100644
--- a/drivers/gpu/drm/display/drm_dp_cec.c
+++ b/drivers/gpu/drm/display/drm_dp_cec.c
@@ -41,7 +41,7 @@
  *
  * https://hverkuil.home.xs4all.nl/cec-status.txt
  *
- * Please mail me (hverkuil@xs4all.nl) if you find an adapter that works
+ * Please mail me (hverkuil@kernel.org) if you find an adapter that works
  * and is not yet listed there.
  *
  * Note that the current implementation does not support CEC over an MST hub.
-- 
2.47.2


