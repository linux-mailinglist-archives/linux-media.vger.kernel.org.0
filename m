Return-Path: <linux-media+bounces-37576-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1801B03259
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 19:33:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 29DF43BB0F5
	for <lists+linux-media@lfdr.de>; Sun, 13 Jul 2025 17:32:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CDFC2857EF;
	Sun, 13 Jul 2025 17:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="e31CTjy1"
X-Original-To: linux-media@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0E82B9CD;
	Sun, 13 Jul 2025 17:33:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752427990; cv=none; b=Vu9pfXjW4XRA49BnIvlLTHZVqFGv9KtsIuNSzgOf5374j/85z+O0issKyk+LSPTZPiKJnetagDYY+FDbCEGsIYCm/Pr9OGfzVsq21B3FAbHxdhY2WgMCNQoJezeIHOXTOdfUqD/Z2ob0Av61f5fKEZkwxZfB6oxtnj5Y0rTjJ1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752427990; c=relaxed/simple;
	bh=ruw8MsWdjdaHoC4Ni49xb4Ca5QkM/9HpQEr2TzWhxs8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iGACnk/+9AD+mzLnXtG03heTXVcFOvnDyVCQzfCShbsAdS4+QNmMSBQqn9tv0gE36mwdF88PR5L48QNGsgqUKzxriQotbluePbVfsScCSkw2oUKKIsDiw7gYCHNuF4ctORokQkbw6ErLIAPnNISIItaKM/0KWXee8iUkThmAzKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=e31CTjy1; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=KhHj/5VYrCrDjXwAFx8MG3eFf+YqsuNGtQA1PpGFXwM=; b=e31CTjy1FSq5tSKi
	8XO3Yn9PcjmjDwWOWW/WS9t2B++sirF+oFqpinIrqv7e3bi6EIBvjCtHFMU935gY49lwUgMtJRV6n
	vuTvFp+zqL4dwaLrkHA9yPKXBK2S+HiyeQy5lwQJfl2AGCRi7jsZJXdTcKIgnMhY6jEOhdj27jMbE
	pDV7F2+lNIaxFIwyxEsS2KZIfKuc3+nt00iGatPus4a7eg2HhMd2G1GynWOxV/n30GBOUJhvkA0MR
	aKHjx6r1QhhiyHiJDVP2QyE/TTi11NPcyF/leonQltOL9i9TgS7bq5wWe1WkXH96irR6wGD6iZDn3
	HDzYXTsup0dGJbuCdA==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1ub0ZS-00Fo6P-1u;
	Sun, 13 Jul 2025 17:33:02 +0000
From: linux@treblig.org
To: clabbe@baylibre.com,
	mchehab@kernel.org
Cc: mjpeg-users@lists.sourceforge.net,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] media: pci: zoran: Remove unused debug parameter
Date: Sun, 13 Jul 2025 18:33:01 +0100
Message-ID: <20250713173301.246043-1-linux@treblig.org>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

Nothing has checked the zr36067_debug variable since 2021 after
commit efdd0d42e276 ("media: staging: media: zoran: remove
detect_guest_activity")

It's set as a module parameter, remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/media/pci/zoran/zoran_card.c | 4 ----
 drivers/media/pci/zoran/zoran_card.h | 2 --
 2 files changed, 6 deletions(-)

diff --git a/drivers/media/pci/zoran/zoran_card.c b/drivers/media/pci/zoran/zoran_card.c
index e31f9f19a48a..d81facf735d9 100644
--- a/drivers/media/pci/zoran/zoran_card.c
+++ b/drivers/media/pci/zoran/zoran_card.c
@@ -67,10 +67,6 @@ module_param(pass_through, int, 0644);
 MODULE_PARM_DESC(pass_through,
 		 "Pass TV signal through to TV-out when idling");
 
-int zr36067_debug = 1;
-module_param_named(debug, zr36067_debug, int, 0644);
-MODULE_PARM_DESC(debug, "Debug level (0-5)");
-
 #define ZORAN_VERSION "0.10.1"
 
 MODULE_DESCRIPTION("Zoran-36057/36067 JPEG codec driver");
diff --git a/drivers/media/pci/zoran/zoran_card.h b/drivers/media/pci/zoran/zoran_card.h
index 518cb426b446..c4f81777e6ce 100644
--- a/drivers/media/pci/zoran/zoran_card.h
+++ b/drivers/media/pci/zoran/zoran_card.h
@@ -12,8 +12,6 @@
 #ifndef __ZORAN_CARD_H__
 #define __ZORAN_CARD_H__
 
-extern int zr36067_debug;
-
 /* Anybody who uses more than four? */
 #define BUZ_MAX 4
 
-- 
2.50.1


