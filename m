Return-Path: <linux-media+bounces-42121-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B583B4FFFA
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 16:48:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 19DAB7ACCD1
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 14:47:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 688B134F476;
	Tue,  9 Sep 2025 14:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r6fl8IW6"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81CA9350830;
	Tue,  9 Sep 2025 14:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757429312; cv=none; b=mU5ebUTedYYzqY5XX1+yNZhmZlLkTAxjnrGc567kkTzIMLqsWVW1tXNOoxkIkBuHvR+KVyDkGGhx/TK7l4XxMXZ939MEcnND2r01VuQMf0QenH99Cpi2NAIuOZbxpaEh97DpjUH316hsVN0KA5+q9UQEgxn74fI+zBwhJb7n45I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757429312; c=relaxed/simple;
	bh=8YgkUz49Kg03aMh6xKCDGPD/kwT6eIsnyki1Ba/c6Kg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G1coyjfwiXNRzO2Wx4KWngUztPg+rDQJeO00IwqVAQWj+4B8XlS3NVGvCsxVla3vRJ+CYyP7yMX1Z1h39MXw0vyCuBKgTrSvS02A19Io3b9SpRL5IjhaMuhvdLXdXD2u1HiRruIQT3lBr76v8mPvL65nQbEmhUAqT3MDMpYCuZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r6fl8IW6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AE26C4CEFB;
	Tue,  9 Sep 2025 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757429312;
	bh=8YgkUz49Kg03aMh6xKCDGPD/kwT6eIsnyki1Ba/c6Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r6fl8IW6HczvSMGyYFQt04OiMC94+9/KN0ZfxyiWbgOIJb8g25KcvzBEwaxFdSkO0
	 JHnfJ5Ay6yfjHBkxLefHDetfnRTBAvnnhfU5tEbX1vEDgMQYNr/SFzYwNpEzxEWbgF
	 D1Vr4hutDrengKxhPiU5Ki9VXpFjDCqVFp3usKCq2qBecgu3B6q2c/8j+kpaRF8SfZ
	 oUpVFlt/vPPHIg7FUFXeamN3TsB4eSZUbz7j/kwsqYKmDgyzUZ+shoPldZxAalqade
	 Npxr0ElKipY3Zif+ntfd9S/WJZXX1eK4YhCbPwQ6Du9Uu9f7opl1EqpMg7CvPG8SXK
	 qJYa4vBwC3N9w==
From: Hans de Goede <hansg@kernel.org>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: Hans de Goede <hansg@kernel.org>,
	Aleksandrs Vinarskis <alex@vinarskis.com>,
	platform-driver-x86@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org
Subject: [PATCH 2/2] platform/x86: int3472: Use "privacy" as con_id for the LED lookup
Date: Tue,  9 Sep 2025 16:48:23 +0200
Message-ID: <20250909144823.27540-3-hansg@kernel.org>
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

Drop the "-led" suffix from the privacy LED's lookup table con_id.

Signed-off-by: Hans de Goede <hansg@kernel.org>
---
Note this needs to be merged in the same kernel cycle as the matching
"media: v4l2-subdev: Use "privacy" as con_id when getting the privacy LED"
patch.
---
 drivers/platform/x86/intel/int3472/led.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/int3472/led.c b/drivers/platform/x86/intel/int3472/led.c
index f1d6d7b0cb75..b1d84b968112 100644
--- a/drivers/platform/x86/intel/int3472/led.c
+++ b/drivers/platform/x86/intel/int3472/led.c
@@ -43,7 +43,7 @@ int skl_int3472_register_pled(struct int3472_discrete_device *int3472, struct gp
 
 	int3472->pled.lookup.provider = int3472->pled.name;
 	int3472->pled.lookup.dev_id = int3472->sensor_name;
-	int3472->pled.lookup.con_id = "privacy-led";
+	int3472->pled.lookup.con_id = "privacy";
 	led_add_lookup(&int3472->pled.lookup);
 
 	return 0;
-- 
2.51.0


