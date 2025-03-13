Return-Path: <linux-media+bounces-28116-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 58375A5ED37
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 08:43:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CEEAA1886FE9
	for <lists+linux-media@lfdr.de>; Thu, 13 Mar 2025 07:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F220625FA0F;
	Thu, 13 Mar 2025 07:43:43 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4949A537FF;
	Thu, 13 Mar 2025 07:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741851823; cv=none; b=Jr1i1j4+JiEpRsyzOcadc89SiSlZOc2k02kbqOvrmuO0v3W9HZHvdzZfz07tAKymWpW7qS8YSKh0iwEmt94Mtmt54OG/6jmg7G2y1AcaUp3h6l0j6Rd6y9KUihQQB3CqF4fP9o33Z2cyFDwaFIAIM61ae5Ikb61bnkYyECeutbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741851823; c=relaxed/simple;
	bh=nhMtbscwvuO+ipkUJ63nXRFs7fO62mVD0D9qAhWmAEM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=A8dB5H6hYDxawhhqRZdW0TgCyl/yqq8fcx/ssaFgBhCYwvrd3Ay+gczJf++OAd/uQlETCp0669yXcL5H/arWPLIhDKOIAD36xAgtuD/ckm1IYvgi2MoU0HZLZMDNKgd0jMDEIkFvXvgCBPrw21kTdGPn47/3CoRvm2DTTTx9QPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
	by APP-03 (Coremail) with SMTP id rQCowAA3PlqXjNJnkJDTFA--.20692S2;
	Thu, 13 Mar 2025 15:43:27 +0800 (CST)
From: Ma Ke <make24@iscas.ac.cn>
To: mchehab@kernel.org,
	hverkuil@xs4all.nl,
	sakari.ailus@linux.intel.com,
	viro@zeniv.linux.org.uk,
	bartosz.golaszewski@linaro.org,
	make24@iscas.ac.cn,
	benjamin.gaignard@collabora.com,
	hljunggr@cisco.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH] media: v4l2-dev: fix error handling in __video_register_device()
Date: Thu, 13 Mar 2025 15:43:18 +0800
Message-Id: <20250313074318.305556-1-make24@iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3PlqXjNJnkJDTFA--.20692S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GF13GrWUGF4kuFW8uFyUZFb_yoWkZrXEqF
	1S9F9rWr1kKanxta45A343Z34rKFZI9rWfWFW7tr4ftayrZ3Zruw1kXr1Yqr4kWanF9rn8
	ZFn0grW5Cw13KjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbSxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_
	Cr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVCY1x0267AKxVWxJr
	0_GcWlnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
	F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
	4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
	648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2
	Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
	6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
	vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
	42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
	kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUOmhFUUUUU
X-CM-SenderInfo: ppdnvj2u6l2u1dvotugofq/

Once device_register() failed, we should call put_device() to
decrement reference count for cleanup. Or it could cause memory leak.

As comment of device_register() says, 'NOTE: _Never_ directly free
@dev after calling this function, even if it returned an error! Always
use put_device() to give up the reference initialized in this function
instead.'

Found by code review.

Cc: stable@vger.kernel.org
Fixes: baa057e29b58 ("media: v4l2-dev: use pr_foo() for printing messages")
Signed-off-by: Ma Ke <make24@iscas.ac.cn>
---
 drivers/media/v4l2-core/v4l2-dev.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/v4l2-core/v4l2-dev.c b/drivers/media/v4l2-core/v4l2-dev.c
index 5bcaeeba4d09..1619614e96bf 100644
--- a/drivers/media/v4l2-core/v4l2-dev.c
+++ b/drivers/media/v4l2-core/v4l2-dev.c
@@ -1060,6 +1060,7 @@ int __video_register_device(struct video_device *vdev,
 	if (ret < 0) {
 		mutex_unlock(&videodev_lock);
 		pr_err("%s: device_register failed\n", __func__);
+		put_device(&vdev->dev);
 		goto cleanup;
 	}
 	/* Register the release callback that will be called when the last
-- 
2.25.1


