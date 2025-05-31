Return-Path: <linux-media+bounces-33725-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 215EAAC9BC0
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 18:32:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 91D1E3B5F7E
	for <lists+linux-media@lfdr.de>; Sat, 31 May 2025 16:31:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1280718DF86;
	Sat, 31 May 2025 16:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uXEII9fK"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7457313CA97
	for <linux-media@vger.kernel.org>; Sat, 31 May 2025 16:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748709129; cv=none; b=EuRIwubV8suVPsZ1C7dO6VF8HpxaAm291dAOcjpxV+XuZepsOrK54eoIoDnFCR2fJ/R74J97lczAo4IJvyDO82dbUXh/7EBVvImPgD9G5Qw3R0SrZ1yKsUCz1/uoGcWcnoDAOW+NdWn4FG3Iqx5eBgSB3kB4Zsm+GTdxI3rQxQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748709129; c=relaxed/simple;
	bh=uIdZhHonyW8TgL2dLZHDoVBJMzk+1Hx+gJoSnet/xyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QrZppYhSJi1TmeC0nxlL6yulyuNqKKqTUi2p6hSyjQjagBF9eVS4xI0QtMIoBEL60K8rKatEJG3vJK9/EDO1cyPnrPwFd79IgCVcUGCZtyFnfQEI8peFnMZ2f5pOaFnqYrk4E4s1j4ozfYs0yuAbekFSmZMJZzC3J2ZOBnuP+Kw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uXEII9fK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9C59C4CEEE;
	Sat, 31 May 2025 16:32:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748709129;
	bh=uIdZhHonyW8TgL2dLZHDoVBJMzk+1Hx+gJoSnet/xyc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uXEII9fKyxvEXXIdzgBy4a4REVnPnewdGs26GvTJNmQ4IsyxYLdNUY4dpcZP0cuw2
	 PxJAOHDXCw0/UfKG23S0c+EjNo9pQaDhD3OdNKk+PV8zZzM5U1oBxr368eMrTp1J7t
	 PATVoPWVxjXESb9V978BKjZPHarP52sI1dMHO0Yrc6prKe3l1uhpTz8fB8LLsZPjtz
	 SER5m1IMq8T3taJXdKJHEYBS6Px7u7lRJaNmvMDB2fokYWTnFFSsPXJyjf5FxVSBSe
	 QQAXE56+B+uXUbuzJxOnaq32zxzTj2PSSoCthxbdexnJ5qrH4d8kF9pdupKivnqH7q
	 lSagHOnq6Lxkg==
From: Hans de Goede <hansg@kernel.org>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mathis Foerst <mathis.foerst@mt.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Hans de Goede <hansg@kernel.org>
Subject: [PATCH v2 06/12] media: mt9m114: Tweak default hblank and vblank for more accurate fps
Date: Sat, 31 May 2025 18:31:41 +0200
Message-ID: <20250531163148.83497-7-hansg@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250531163148.83497-1-hansg@kernel.org>
References: <20250531163148.83497-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The PLL gets programmed to achieve a 48 MHz pixelclock, with the current
vblank + hblank defaults this results in a fps of:

48000000 / ((1296 + 307) * (976 + 23) = 29.974 fps

Tweak the defaults to get closer to 30 fps:

48000000 / ((1296 + 308) * (976 + 21) = 30.015 fps

This improves things from being 0.026 fps too low to 0.015 fps too high.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Hans de Goede <hansg@kernel.org>
---
 drivers/media/i2c/mt9m114.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index aa401b3fb4a7..371e96d9e281 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -333,8 +333,8 @@
  */
 #define MT9M114_MIN_HBLANK				303
 #define MT9M114_MIN_VBLANK				21
-#define MT9M114_DEF_HBLANK				307
-#define MT9M114_DEF_VBLANK				23
+#define MT9M114_DEF_HBLANK				308
+#define MT9M114_DEF_VBLANK				21
 
 #define MT9M114_DEF_FRAME_RATE				30
 #define MT9M114_MAX_FRAME_RATE				120
-- 
2.49.0


