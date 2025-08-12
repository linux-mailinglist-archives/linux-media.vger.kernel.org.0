Return-Path: <linux-media+bounces-39641-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B638BB23AFD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:48:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E126D585B20
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D3F32DFA2A;
	Tue, 12 Aug 2025 21:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="m9M/7Fbe"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F4A92DF3F9
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 21:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035212; cv=none; b=ZogLYl338YmNl/sSXXp4TBTbBzPWp4dGFsqhzoXaHv/mx+nXltPhyBF8phIOa/Y2kj7Ny1OMUeLDMnf9tqQjqvGlPNd2fJhYXLYZEAPZGugtGPiT0aMq+vIYiqbx0m8TGK9JmfeMKbwzgpoifej8ow4xcYpCUhPqYmiYSudsatU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035212; c=relaxed/simple;
	bh=TqJRCv5nMVW0L+4EFqcsPeC7+L8BZK0bfXYu6r0SQfk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JuA40Jwg3LUVqCOB26llEgB1eYWJz62gHDu5Au1vYnc2jzzQV2Y3HD4KxpkSZZrn65ctbAB1Uhe4RGdxv1/3pZTpdR+RL+giOYhW3HldssiFDN8nXh7sjAhWIqLgs20+phK4yKOu/6O5Skh1zMpnqESgtQ48VSLmJSCmzFSB3Bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=m9M/7Fbe; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id DCA2C1738
	for <linux-media@vger.kernel.org>; Tue, 12 Aug 2025 23:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035154;
	bh=TqJRCv5nMVW0L+4EFqcsPeC7+L8BZK0bfXYu6r0SQfk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=m9M/7FbeNnLH5VFrOMhlN/fVJFqkKRXmN9bC9EE35idDBI2R+w+HtuAZa9hJwE9Lw
	 uH+IpRffRcX8MpNzfkIQFGUCM8HR3T2/3USb/vSLb78jbg1/VGH6oDLyob2rsLVdKk
	 HOFCzgcVGJ8SCZYnho6VpHkCFiBK6T5/m2v0jwnU=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Subject: [PATCH v2 05/72] media: i2c: mt9v022: Drop unused mt9v022.h header
Date: Wed, 13 Aug 2025 00:45:13 +0300
Message-ID: <20250812214620.30425-6-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mt9v022 driver got removed in commit e7eab49132ba ("media:
staging/media/soc_camera: remove this driver"), but its platform header
file got left behind. Remove it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 include/media/i2c/mt9v022.h | 13 -------------
 1 file changed, 13 deletions(-)
 delete mode 100644 include/media/i2c/mt9v022.h

diff --git a/include/media/i2c/mt9v022.h b/include/media/i2c/mt9v022.h
deleted file mode 100644
index 6966eb538165..000000000000
--- a/include/media/i2c/mt9v022.h
+++ /dev/null
@@ -1,13 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * mt9v022 sensor
- */
-
-#ifndef __MT9V022_H__
-#define __MT9V022_H__
-
-struct mt9v022_platform_data {
-	unsigned short y_skip_top;	/* Lines to skip at the top */
-};
-
-#endif
-- 
Regards,

Laurent Pinchart


