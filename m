Return-Path: <linux-media+bounces-40327-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D353AB2D097
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 02:15:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 005C8723C82
	for <lists+linux-media@lfdr.de>; Wed, 20 Aug 2025 00:14:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6F79F26ACB;
	Wed, 20 Aug 2025 00:14:03 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from ring0.de (ring0.de [152.53.19.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A1255680;
	Wed, 20 Aug 2025 00:14:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=152.53.19.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755648843; cv=none; b=PSoGZTp9uqDfAI2zzgh5sJvtik7MbVFziunNDD8aMlRo3VVQzSvcwzA8r2W4WfqSr5b7JiNG65iry1joDXpcg01T5vvJKjjwhhwLq1ccEaUY5+Nqb13sEsNrx5ya8jjKwZqgdYO3I8RoZtFKUS1AzfqC+9c7d+K96ZEbxfqjIcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755648843; c=relaxed/simple;
	bh=U4g1JtvDsdcbH8rRfpOM3VKcFjQCA1IDC0rsOf49jts=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KZrS3HXjWcLKRTHzvxvLfiByfmipEkUel+5Re1ZotQ9XExHTBvoYIsg3NL7QfZqplqgjah9sp9Rv9ru9QNgqnt0N4QdWZFSekJ5tw8K+sgzZQVJFsk/miIgLUDvKwPje68/Dhxgz7pU4kC03dzeYwrgWNodt7UGC4KBa4ACidMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=ring0.de; arc=none smtp.client-ip=152.53.19.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ring0.de
From: Sebastian Reichel <sre@kernel.org>
Authentication-Results: ring0.de;
	auth=pass smtp.mailfrom=sre@ring0.de
Date: Wed, 20 Aug 2025 02:13:19 +0200
Subject: [PATCH 1/2] media: ov02c10: Fix default vertical flip
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250820-ov02c10-fix-v1-1-3fcca2cfbfbf@kernel.org>
References: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
In-Reply-To: <20250820-ov02c10-fix-v1-0-3fcca2cfbfbf@kernel.org>
To: Hans de Goede <hansg@kernel.org>, Bryan O'Donoghue <bod@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>, 
 Hans Verkuil <hverkuil@kernel.org>
Cc: Frederic Stuyk <fstuyk@runbox.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068; i=sre@kernel.org;
 h=from:subject:message-id; bh=U4g1JtvDsdcbH8rRfpOM3VKcFjQCA1IDC0rsOf49jts=;
 b=owEBbQKS/ZANAwAKAdju1/PIO/qaAcsmYgBopRM48xk/kjIttvaRQ2A1pSwB9W+Jd1UaOqTi/
 NQVJMVxcIuJAjMEAAEKAB0WIQTvZg0HRj+Lcmp5VBPY7tfzyDv6mgUCaKUTOAAKCRDY7tfzyDv6
 ml7eEAClk53b/tVpqVoVM6Y9bFMAAZemuMrypT7aI9lv5ZR4xVa1sdrIzhDDWCDOXp88mcF82DN
 XQQ3Xir5+6JKYoQARav5oQ+nWWgYlyE5cPpBDgncSpGmPOyKwiyPf9lEedTJvqT2atMFuSzbOy1
 hqBXe8CAUQbev/jeSBb17eivsKJvk2htXhZWBjAFiS9pFhx+3oF3ih45Mcjta3TF3uC4vDVRDKL
 BYltoo60GSuLs513nLP4EeeDOacvqiLu4BcYyIE5jOgQX+oQSWnEPIwatk+sDrUccrivnEgmgT9
 LV3BLIylvctWlzz/fIAnSngRxCBVfx2K9QY27w9rB7jH7MgHelclIM7hnmOQvS0NJfXbflp8yo1
 G/l0Ya9vhIW4IYphyXyRg1+HiJDq9aQs/LpvcC4WYk1vmo89mj9tAHYS6Ih8jVlI1V4FCuUH4s7
 +97WNIK+wLfs8vSZiGosdl+5byJ8iHDgiY15bC6hJihZpE8a6OdvJXyw7iFiuQtqomO8fMbdD/k
 rkOauTgwJxTMI6s/I6UpnlPfZskktvL6DQTnLajks8i0VL9k71yHmsLY9rHCYmbUayatBzbX67J
 FcfKG22F85jPXD4ZYuYhPeaU2eN4ge10kHu0JiuQCkt2+QZbU86cGQZVSn2MQm6STWhpZvJ9FBX
 FKPjlrKUlSW84Zg==
X-Developer-Key: i=sre@kernel.org; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-Rspamd-Server: antispam
X-Rspamd-Queue-Id: 7D2D6E31EC
X-Spamd-Result: default: False [-1.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	FORGED_SENDER(0.30)[sre@kernel.org,sre@ring0.de];
	MIME_GOOD(-0.10)[text/plain];
	TAGGED_RCPT(0.00)[];
	ARC_NA(0.00)[];
	ASN(0.00)[asn:39351, ipnet:193.32.248.0/24, country:SE];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[kernel.org,linux.intel.com,gmail.com];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[runbox.com,vger.kernel.org,kernel.org];
	RCPT_COUNT_SEVEN(0.00)[10];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	IS_LOCAL_DOMAIN_E(0.00)[ring0.de];
	FROM_NEQ_ENVFROM(0.00)[sre@kernel.org,sre@ring0.de];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,runbox.com]
X-Rspamd-Action: no action
X-Spamd-Bar: -

The driver right now defaults to setting the vertical flip bit. This
conflicts with proper handling of the rotation property defined in
ACPI or device tree, so drop the VFLIP bit. It should be handled via
V4L2_CID_VFLIP instead.

Reported-by: Frederic Stuyk <fstuyk@runbox.com>
Closes: https://lore.kernel.org/all/b6df9ae7-ea9f-4e5a-8065-5b130f534f37@runbox.com/
Fixes: 44f89010dae0 ("media: i2c: Add Omnivision OV02C10 sensor driver")
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/media/i2c/ov02c10.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index 089a4fd9627cf6c13efa65c104caeac370b53bc0..3a02fce0a9bc0ca3ab87defe3eefd04efb4012e7 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -175,7 +175,7 @@ static const struct reg_sequence sensor_1928x1092_30fps_setting[] = {
 	{0x3816, 0x01},
 	{0x3817, 0x01},
 
-	{0x3820, 0xb0},
+	{0x3820, 0xa0},
 	{0x3821, 0x00},
 	{0x3822, 0x80},
 	{0x3823, 0x08},

-- 
2.50.1


