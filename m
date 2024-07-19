Return-Path: <linux-media+bounces-15141-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F1C293761B
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 11:49:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 28C281F24A5C
	for <lists+linux-media@lfdr.de>; Fri, 19 Jul 2024 09:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07D92824BD;
	Fri, 19 Jul 2024 09:49:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from zankapfel.net (zankapfel.net [5.45.106.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C67548E1;
	Fri, 19 Jul 2024 09:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.45.106.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721382588; cv=none; b=bscGmMl/qVsmk9ZrQUzhJCOQy7Q81Qknks5BwpFVOgo9qqZcjj1tQIM25fiGHdZrE0Sh871q93b1o8WsCODfQZdZiL44Vn2WW7WD8AHp88nUFwTg5hlNln/6IhLMzlms931BRCwVwDZ4unx/ESZADTh2i82GgwWpuH3Q9I0fz2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721382588; c=relaxed/simple;
	bh=E1DctxNF5pl9fxugJCaRLIH+wqlJP0YZN7lXeY7U3hk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hkA8KZEqTqfGGH4PnAyUO9jkh7k5WL7N6oC86T7rp02RPx3FSAX+uUiuaj1k5h67a34X25LJIzMZY7VvA8U+5GHdU2m12U7Vhsce0/zjhpdu1rdc2qJuS5KJsfFV0POioqxSG/2opN2uk+XSa0eUaIDk/P9jrIWw5mD9CuIh97Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zankapfel.net; spf=none smtp.mailfrom=zankapfel.net; arc=none smtp.client-ip=5.45.106.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=zankapfel.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=zankapfel.net
Received: by zankapfel.net (Postfix, from userid 110)
	id 79D1912780B; Fri, 19 Jul 2024 11:41:43 +0200 (CEST)
X-Spam-Level: 
Received: from gurumeditation.lan (095129203040.t4.akis.net [95.129.203.40])
	by zankapfel.net (Postfix) with ESMTPSA id 0D8211277F7;
	Fri, 19 Jul 2024 11:41:40 +0200 (CEST)
From: Phil Eichinger <phil@zankapfel.net>
To: eajames@linux.ibm.com,
	mchehab@kernel.org,
	joel@jms.id.au,
	andrew@codeconstruct.com.au,
	sboyd@kernel.org,
	hverkuil-cisco@xs4all.nl,
	jae.hyun.yoo@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Phil Eichinger <phil@zankapfel.net>
Subject: [PATCH] media: aspeed: fix clock stopping logic
Date: Fri, 19 Jul 2024 11:40:56 +0200
Message-Id: <20240719094056.1169057-1-phil@zankapfel.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

When stopping clocks for Video Capture and Video Engine in
aspeed_video_off() the order is reversed.

Occasionally during screen blanking hard lock-ups occur on AST2500,
accompanied by the heart beat LED stopping.

Stopping Video Capture clock before Video Engine seems logical and fixes
the random lock-ups.

Fixes: 3536169f8531 ("media: aspeed: fix clock handling logic")
Signed-off-by: Phil Eichinger <phil@zankapfel.net>
---
 drivers/media/platform/aspeed/aspeed-video.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/aspeed/aspeed-video.c b/drivers/media/platform/aspeed/aspeed-video.c
index fc6050e3be0d..8f1f3c847162 100644
--- a/drivers/media/platform/aspeed/aspeed-video.c
+++ b/drivers/media/platform/aspeed/aspeed-video.c
@@ -661,8 +661,8 @@ static void aspeed_video_off(struct aspeed_video *video)
 	aspeed_video_write(video, VE_INTERRUPT_STATUS, 0xffffffff);
 
 	/* Turn off the relevant clocks */
-	clk_disable(video->eclk);
 	clk_disable(video->vclk);
+	clk_disable(video->eclk);
 
 	clear_bit(VIDEO_CLOCKS_ON, &video->flags);
 }
-- 
2.39.2


