Return-Path: <linux-media+bounces-42120-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD5C6B4FFF8
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id F37207A8BE2
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:47:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1DEEA2DA75F;
	Tue,  9 Sep 2025 14:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SQ8rekfd"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7944B33EAF7;
	Tue,  9 Sep 2025 14:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429310; cv=none; b=T4lWe6cnvPl7utmuyC7CsfKXpWL12B/SZM+28N/OQkL6ajBFMnlyXi+A0oHYasWn8SHhth+4tkUWwZ/+kaUt3JOPfEodsi9lXThoiDMyqNXGWxCubtBxTO/mZLf+sZADYVjkM+w8RdscWIXCY48dCfHdbmU4NxnSeaKCCDeGn4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429310; c=relaxed/simple;
	bh=Y57TD4xv+11WAaqOW0cJAT4WRJ8eCi6MYXJ69mrwEfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WX3y1WSLEBBIIBZIoIIcvr7+SNVF0wJhCBM5XG9TqT73jky1SA7tWp5qDcO3UHdodTr/KH4OKfgUcFSsHTHCfO8RizHIBO/p4jSrBourN3X1WzkUcuogeqOJZZvgfoR0DV1LdFVr2wXU7XywRabMFmh+dW/VVQJ56gErTdmtKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SQ8rekfd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DE39C4CEF8;
	Tue,  9 Sep 2025 14:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757429310;
	bh=Y57TD4xv+11WAaqOW0cJAT4WRJ8eCi6MYXJ69mrwEfU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SQ8rekfdT6x+Vis0FktewlHimfuR/Jx/DF/syTx4hccOsYzU0YOAdQqL6aahSEWzI
	 6D4hWs72iWU4gOvOOpuRlBvaVKq8ySYVgRU+4+fS0p37Q1y+JFv4DiZMTWkxfHCmZG
	 eRhqJlCotmJRCZKJySYGoNUs4WcuTmLruxLCxfSj/PBHL7CzILtBkO9X74F/YK14Y5
	 ePj/5mVbFIah1BlD4iLMVeeM1OVcOpLeW1qg2I9YW/aszdn1RpFiKbF5Jg3YPXqP1m
	 WyRQpOfEAIY/nKmqacg8fSBRCGbGjrOhgTrc/XyS/iLmjS8yH8bh9fMmg2ymWfzQQT
	 kgv3ADvtYQGbg==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 1/2] media: v4l2-subdev: Use "privacy" as con_id when getting the privacy LED
Date: Tue,  9 Sep 2025 16:48:22 +0200
Message-ID: <20250909144823.27540-2-hansg@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250909144823.27540-1-hansg@kernel.org>
References: <20250909144823.27540-1-hansg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During DT-binding review for extending the V4L2 camera sensor privacy LED
support to systems using devicetree, it has come up that having a "-led"
suffix for the LED name / con_id is undesirable since it already is clear
that it is a LED.

Drop the "-led" suffix from the con_id argument to led_get().

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note this needs to be merged in the same kernel cycle as the matching
"platform/x86: int3472: Use "privacy" as con_id for the LED lookup"
patch.
---
 drivers/media/v4l2-core/v4l2-subdev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/v4l2-core/v4l2-subdev.c b/drivers/media/v4l2-core/v4l2-subdev.c
index 113eb74eb7c1..babcc1120354 100644
--- a/drivers/media/v4l2-core/v4l2-subdev.c
+++ b/drivers/media/v4l2-core/v4l2-subdev.c
@@ -2602,7 +2602,7 @@ EXPORT_SYMBOL_GPL(v4l2_subdev_is_streaming);
 int v4l2_subdev_get_privacy_led(struct v4l2_subdev *sd)
 {
 #if IS_REACHABLE(CONFIG_LEDS_CLASS)
-	sd->privacy_led = led_get(sd->dev, "privacy-led");
+	sd->privacy_led = led_get(sd->dev, "privacy");
 	if (IS_ERR(sd->privacy_led) && PTR_ERR(sd->privacy_led) != -ENOENT)
 		return dev_err_probe(sd->dev, PTR_ERR(sd->privacy_led),
 				     "getting privacy LED\n");
-- 
2.51.0


