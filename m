Return-Path: <linux-media+bounces-14531-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 41266923EDB
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 15:25:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9E45128676D
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 13:25:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ED8F1B4C55;
	Tue,  2 Jul 2024 13:25:12 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F16322AF16;
	Tue,  2 Jul 2024 13:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719926711; cv=none; b=Vzn7Qb8mjA4sxF8Hy9CzKsXaGBWXH65AVRBtucSXoaQottr5e7eiZcm+4EyRkxIlATnWl19hv8/dI8lp8GOyzcsch9tPrajJy9au38mMM3XdjkPA4M9RCv4nsM1xA1SgtM6+IWvYBKrSIuYN3N2uAEUais9gy7gHlMSBF4yN7no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719926711; c=relaxed/simple;
	bh=f/wnxGLtelOSX/4be9c7WcX2OArP21UEPNZ1ih4ua5s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Qd15dxOozATcsIleHCCCWUwY5owBHSBA1I+pLvy23tHBL3NbUhaZtFDq7Ncy6Jkl/HLwGy391pBPyVTQM7INIUetzr1/B1fqIFAw8NUdI7ZytXeqw3M1Ze5PIHj0AhGtZYWafE7ugj+06f3NfmHB1YdfBKJ8XWyeSqzDKeo8zBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from ljl-virtual-machine.localdomain (unknown [39.144.146.5])
	by APP-01 (Coremail) with SMTP id qwCowADn7cmA_4NmV4o1AQ--.1949S2;
	Tue, 02 Jul 2024 21:24:45 +0800 (CST)
From: Junlin Li <make24@iscas.ac.cn>
To: mchehab@kernel.org,
	tzimmermann@suse.de,
	peda@axentia.se,
	wsa+renesas@sang-engineering.com,
	hkallweit1@gmail.com,
	laurent.pinchart+renesas@ideasonboard.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Junlin Li <make24@iscas.ac.cn>
Subject: [PATCH] drivers: media: dvb-frontends/rtl2832: fix an out-of-bounds write error
Date: Tue,  2 Jul 2024 21:24:13 +0800
Message-Id: <20240702132413.4318-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowADn7cmA_4NmV4o1AQ--.1949S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWkAryrWw4xur4rGrW3ZFb_yoWDZrX_Gw
	13Xrs3XF1jyF1ay3Wv9r15ZrWq9rW3WwsYgF1FvrW3tF98uFyfGFyvg3ZFyFyUWFW7Wrn0
	yrnrJr1S9a1I9jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbcAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
	1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
	w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
	vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
	4I1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxV
	WUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI
	7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r
	1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI
	42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOlksUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Ensure index in rtl2830_pid_filter
does not exceed 31 to prevent out-of-bounds access.
dev->filters is a 32-bit value,
so set_bit and clear_bit functions should only
operate on indices from 0 to 31.
If index is 32, it will attempt to access a non-existent 33rd bit,
leading to out-of-bounds access.
Change the boundary check
from index > 32 to index >= 32 to resolve this issue.

Signed-off-by: Junlin Li <make24@iscas.ac.cn>
---
 drivers/media/dvb-frontends/rtl2832.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/rtl2832.c b/drivers/media/dvb-frontends/rtl2832.c
index 5142820b1b3d..76c3f40443b2 100644
--- a/drivers/media/dvb-frontends/rtl2832.c
+++ b/drivers/media/dvb-frontends/rtl2832.c
@@ -983,7 +983,7 @@ static int rtl2832_pid_filter(struct dvb_frontend *fe, u8 index, u16 pid,
 		index, pid, onoff, dev->slave_ts);
 
 	/* skip invalid PIDs (0x2000) */
-	if (pid > 0x1fff || index > 32)
+	if (pid > 0x1fff || index >= 32)
 		return 0;
 
 	if (onoff)
-- 
2.34.1


