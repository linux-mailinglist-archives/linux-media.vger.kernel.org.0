Return-Path: <linux-media+bounces-29699-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 52FD8A81971
	for <lists+linux-media@lfdr.de>; Wed,  9 Apr 2025 01:35:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 727AE444FC0
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 23:34:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B34FE256C68;
	Tue,  8 Apr 2025 23:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="pqKcA53d"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8992561DF;
	Tue,  8 Apr 2025 23:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744155234; cv=none; b=X8nE/2SGzFzIRl5/KxXSpTq/mBCwcvYuDJ1KjYFYhBRbyR9S6VVfar+a4tUr9A8GM/n4gV827heG1a7r97C3mTnA9ExgB/QZli94HUP7mmf7etlCtVwVO0q48jNoFrHGhItOrs+LM4PetwZHxzT7EQH15E+b78UPrqDKrsiCdEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744155234; c=relaxed/simple;
	bh=2ZUs/f2p0gojhx6JlmQ7danCbHFV6tPTQnveKTYOoBQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uohAH6sdC5t40PLwXlrskmzqME6qb8qVKG7TpvE6Ph98L1AyCwRhrNE9BFrHHVXIvUsqmsKk0xUHVCT4UmEfFr9H2TPsrKMLmDFJqre4S5Y4poWP/zzUj9blPVCdWuE9+72AsnnNkp1RJv+z0/crXjmS7XDwGSdCZ5CZDMkIGjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=pqKcA53d; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 7444482E;
	Wed,  9 Apr 2025 01:31:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1744155112;
	bh=2ZUs/f2p0gojhx6JlmQ7danCbHFV6tPTQnveKTYOoBQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pqKcA53dzbNuwMpuaYNoBBkW3ffpxH5TqUJPaaBN6Utw87ikH05821gxMJlRzVf20
	 aY5zaS7ivNemdIDLYHhxsD6xx7cVpsiuZ8bRXgeUIp9Jonty3b4O+X3QZTuAeTuJdT
	 xLyDBn2c3ABnnQE1Ard5FIxHM1za23q7Z0adwMKk=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
	Sakari Ailus <sakari.ailus@iki.fi>,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [yavta] [PATCH 1/3] Use SPDX license tag and update copyright
Date: Wed,  9 Apr 2025 02:33:21 +0300
Message-ID: <20250408233323.7650-2-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250408233323.7650-1-laurent.pinchart@ideasonboard.com>
References: <20250408233323.7650-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Replace the license boilerplate text with an SPDX tag, and update the
copyright notice to cover the last 15 years of development.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 yavta.c | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/yavta.c b/yavta.c
index 546b91d73f41..89b5c4a24cfc 100644
--- a/yavta.c
+++ b/yavta.c
@@ -1,20 +1,8 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
 /*
  * yavta --  Yet Another V4L2 Test Application
  *
- * Copyright (C) 2005-2010 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
- *
- * This program is free software; you can redistribute it and/or modify
- * it under the terms of the GNU General Public License as published by
- * the Free Software Foundation; either version 2 of the License, or
- * (at your option) any later version.
- *
- * This program is distributed in the hope that it will be useful,
- * but WITHOUT ANY WARRANTY; without even the implied warranty of
- * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
- * GNU General Public License for more details.
- *
- * You should have received a copy of the GNU General Public License along
- * with this program; if not, write to the Free Software Foundation, Inc.,
+ * Copyright (C) 2005-2025 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
  */
 
 #define __STDC_FORMAT_MACROS
-- 
Regards,

Laurent Pinchart


