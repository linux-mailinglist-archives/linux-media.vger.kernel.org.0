Return-Path: <linux-media+bounces-2330-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCA2810FC1
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 12:23:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF2C31C20957
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 11:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 42C2723774;
	Wed, 13 Dec 2023 11:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kpQtbytX"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F61F23765;
	Wed, 13 Dec 2023 11:23:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B3DC433C8;
	Wed, 13 Dec 2023 11:23:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702466609;
	bh=dM20k1aIuurzuuEbrL9Li5fyjqQfBsAPeqrud2tbKNE=;
	h=From:To:Cc:Subject:Date:From;
	b=kpQtbytXXYBOTNSZ14250C8VyTOF1kOnoCHIm5KJngdLNB/P4RO4L1wDawKiBApHh
	 nvlOCJZfBV/VT8307P0u/xe/hkhLnC87ehAUfYJfC+cPbckYGfuqAEbUgt0RpN5YFQ
	 HvxEiOhmAiFNu+q32QQ7pbhzgPWEMin+xANEXcc8DQpNxOlH3brUB1B4FVt4ADx11n
	 AXqYQC0YF7uIy/9nb/+fbe0PzS6yDurdvg7S0YHWomyg1UL89AQlqUKnCnGT7lnfko
	 uZq0aV49rVfyFQew3RK+Nt5FEex8AWk3gHqjhrJRSggKG/0cxkTbumMgXQ2PDv58j2
	 l2FL63m7wcDag==
From: Arnd Bergmann <arnd@kernel.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] [v2] media: i2c: mt9m114: use fsleep() in place of udelay()
Date: Wed, 13 Dec 2023 12:23:07 +0100
Message-Id: <20231213112322.1655236-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

With clang-16, building without COMMON_CLK triggers a range check on
udelay() because of a constant division-by-zero calculation:

ld.lld: error: undefined symbol: __bad_udelay
>>> referenced by mt9m114.c
>>>               drivers/media/i2c/mt9m114.o:(mt9m114_power_on) in archive vmlinux.a

In this configuration, the driver already fails to probe, before
this function gets called, so it's enough to suppress the assertion.

Do this by using fsleep(), which turns long delays into sleep() calls
in place of the link failure.

This is probably a good idea regardless to avoid overly long dynamic
udelay() calls on a slow clock.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Fixes: 24d756e914fc ("media: i2c: Add driver for onsemi MT9M114 camera sensor")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/media/i2c/mt9m114.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 0a22f328981d..68adaecaf481 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -2116,7 +2116,7 @@ static int mt9m114_power_on(struct mt9m114 *sensor)
 		duration = DIV_ROUND_UP(2 * 50 * 1000000, freq);
 
 		gpiod_set_value(sensor->reset, 1);
-		udelay(duration);
+		fsleep(duration);
 		gpiod_set_value(sensor->reset, 0);
 	} else {
 		/*
-- 
2.39.2


