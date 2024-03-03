Return-Path: <linux-media+bounces-6306-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E2E9786F5D9
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 16:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 99FD11F22B96
	for <lists+linux-media@lfdr.de>; Sun,  3 Mar 2024 15:27:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9999167E99;
	Sun,  3 Mar 2024 15:27:25 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from mail.rmail.be (mail.rmail.be [85.234.218.189])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3A1D67C49
	for <linux-media@vger.kernel.org>; Sun,  3 Mar 2024 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.234.218.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709479645; cv=none; b=lLF9wquLb0F2pzx3PD08hA3En0jX7vaWXKKVJaH+mUslfrfBa97gzie40GtgEXojm/M5jrhbkz7EbvKEqzfV5rVykRgNMtWKDmaelbusS7mP7Vw/I9oGMk3zlBeJOzQAbce7EhUU/CpBaaVtFaxmsTNhAw8d0bxyQy4j6Ud+lHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709479645; c=relaxed/simple;
	bh=tYRWwbzaEotAmfjxD4oBBKEJGTz8aeo760EuaV5ozX4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iPNST6J0D96PhDEyTIr4x8OhLPa5Nw5XO9w1HQV6GWT6cUPybfrAi6gR9EGw5f0ovyuqs3oRdbH5xSyq6WaPm1rJgzPQ3rLimKAgBQwIp7YkjeepaMGzU3jJ3+d1HN6eJ/ASLVKICKl9wVIQ8IaYMZX/d00akVE7CBm7zEWHD1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be; spf=pass smtp.mailfrom=rmail.be; arc=none smtp.client-ip=85.234.218.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rmail.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rmail.be
Received: from localhost.rmail.be (unknown [10.238.9.208])
	by mail.rmail.be (Postfix) with ESMTP id BB0A74C09D;
	Sun,  3 Mar 2024 16:27:22 +0100 (CET)
From: Maarten Vanraes <maarten@rmail.be>
To: Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
	linux-media@vger.kernel.org
Cc: Kieran Bingham <kbingham@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Umang Jain <umang.jain@ideasonboard.com>,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	Maarten Vanraes <maarten@rmail.be>
Subject: [RFC PATCH 10/13] staging/mmal-vchiq: Rationalise included headers
Date: Sun,  3 Mar 2024 16:10:05 +0100
Message-ID: <20240303152635.2762696-11-maarten@rmail.be>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240303152635.2762696-1-maarten@rmail.be>
References: <20240303152635.2762696-1-maarten@rmail.be>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dave Stevenson <dave.stevenson@raspberrypi.com>

The list of includes was slightly over generic, and wasn't
in alphabetical order. Clean it up.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
Signed-off-by: Maarten Vanraes <maarten@rmail.be>
---
 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
index 1209b7db8f30..479b8114dcdb 100644
--- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
+++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
@@ -15,15 +15,14 @@
 
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
+#include <linux/completion.h>
 #include <linux/errno.h>
 #include <linux/kernel.h>
+#include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
-#include <linux/mm.h>
-#include <linux/slab.h>
-#include <linux/completion.h>
 #include <linux/vmalloc.h>
-#include <media/videobuf2-vmalloc.h>
+#include <media/videobuf2-v4l2.h>
 
 #include "../include/linux/raspberrypi/vchiq.h"
 #include "mmal-common.h"
-- 
2.41.0


