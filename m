Return-Path: <linux-media+bounces-14546-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F0E59246AE
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 19:51:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C72571F25886
	for <lists+linux-media@lfdr.de>; Tue,  2 Jul 2024 17:51:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7EF71BF325;
	Tue,  2 Jul 2024 17:51:28 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp21.cstnet.cn [159.226.251.21])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C9E01BE234;
	Tue,  2 Jul 2024 17:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719942688; cv=none; b=rnex/RjxGscCtAimzpXeuaYr0S/mY1etvRD6pRbx84oV+8zH0xmfYVX5/Mw5EDZnGIPuSwsgA4IRrBkUpi2UVWzXIlBFao4S17a+m5m4ZB6xNJAtJmXbvuG8hzG1rPFpzxZNz8rjLa1okXM4SQVdY6X6hV4XtE+1bTSjvGJLZi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719942688; c=relaxed/simple;
	bh=H+U1EYcxPs8vYHE+bBElJ5nD7JX1Ny122D1CoXoM0nE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=fDACJpzpRn23zsJy5KaOV0/BtRc3dkbSHFyVkzwrNcIo0XR1lgw3xTwXv/h5amWVsPhmzWOj9eMB2Lr3F4pI4r52tSiJPlZEWr2xC80C/EI/oC6Kv7BaEsw2BxLJajn/zCLutdqfWagdCNU3xFGLIlk0Ygj7udhmDQo85nTQzWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from ljl-virtual-machine.localdomain (unknown [106.58.225.219])
	by APP-01 (Coremail) with SMTP id qwCowABnR0zvPYRmR0g9AQ--.968S2;
	Wed, 03 Jul 2024 01:51:06 +0800 (CST)
From: Junlin Li <make24@iscas.ac.cn>
To: mchehab@kernel.org,
	laurent.pinchart+renesas@ideasonboard.com,
	tzimmermann@suse.de,
	wsa+renesas@sang-engineering.com,
	hkallweit1@gmail.com,
	robh@kernel.org,
	crope@iki.fi
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Junlin Li <make24@iscas.ac.cn>
Subject: [PATCH] drivers: media: dvb-frontends/rtl2830: fix an out-of-bounds write error
Date: Wed,  3 Jul 2024 01:50:23 +0800
Message-Id: <20240702175023.3921-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:qwCowABnR0zvPYRmR0g9AQ--.968S2
X-Coremail-Antispam: 1UD129KBjvdXoW7XrWkAryrWw4xur4rGrW3ZFb_yoWkJwc_G3
	4SqrsxXFyjqF1Yya1Y9w45ZrWq9rW7XwsYgF15t3y3tFW5ZFy8KFyqg3ZFyFy8WFy7Wrn8
	AFnxGF1Sk3W29jkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb3kFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6r1S6rWUM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Jr0_JF4l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_
	Gr1l84ACjcxK6I8E87Iv67AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
	VFxhVjvjDU0xZFpf9x0JUQZ23UUUUU=
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

Fixes: df70ddad81b4 ("[media] rtl2830: implement PID filter")
Signed-off-by: Junlin Li <make24@iscas.ac.cn>
---
 drivers/media/dvb-frontends/rtl2830.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-frontends/rtl2830.c b/drivers/media/dvb-frontends/rtl2830.c
index 30d10fe4b33e..320aa2bf99d4 100644
--- a/drivers/media/dvb-frontends/rtl2830.c
+++ b/drivers/media/dvb-frontends/rtl2830.c
@@ -609,7 +609,7 @@ static int rtl2830_pid_filter(struct dvb_frontend *fe, u8 index, u16 pid, int on
 		index, pid, onoff);
 
 	/* skip invalid PIDs (0x2000) */
-	if (pid > 0x1fff || index > 32)
+	if (pid > 0x1fff || index >= 32)
 		return 0;
 
 	if (onoff)
-- 
2.34.1


