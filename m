Return-Path: <linux-media+bounces-11666-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 865A18CA945
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 09:46:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 406F3282C38
	for <lists+linux-media@lfdr.de>; Tue, 21 May 2024 07:46:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E38C51C5F;
	Tue, 21 May 2024 07:46:06 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from new-mail.astralinux.ru (new-mail.astralinux.ru [51.250.53.164])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B85717740;
	Tue, 21 May 2024 07:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.250.53.164
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716277565; cv=none; b=ZT0fTQ/CnAPfx/41LdT72I/QdtpeBystaN08ii1wO3XNfoW5l/J5YHZHUXxyO8L+A0D0EKOnkhg85Z9M8YuJ39B2tJSi3IgeSo/ldGXlaOccM9U8WsiBv84/Xn2l9keAlZN4EzhsS6SVeji7jWsaEh07KjUfKEzpXoMAr/O58Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716277565; c=relaxed/simple;
	bh=ReNLlDgpjZ1jaZiHgCEwYSvsQ1fg9dcm9wtlMCL728U=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lhX2nNAswCQzGcohMdA7edf2M3tkAOjAtQyCEgquALohsUfd3RKnGxONyA8HNk/Hmh+qRIq9pJQKVO8z0JazS35MbJBv15gf9e8l0FoGRhxEfgqrpsgLb8jM5lJwEr8tOaX/Er8Lz8bxArzmPQeqIPA5qo5ZItzkjhoQKIGJaAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru; spf=pass smtp.mailfrom=astralinux.ru; arc=none smtp.client-ip=51.250.53.164
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=astralinux.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=astralinux.ru
Received: from rbta-msk-lt-106062.astralinux.ru (unknown [10.177.15.104])
	by new-mail.astralinux.ru (Postfix) with ESMTPA id 4Vk5qD5KW8zqSR3;
	Tue, 21 May 2024 10:36:56 +0300 (MSK)
From: Anastasia Belova <abelova@astralinux.ru>
To: Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: Anastasia Belova <abelova@astralinux.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RFC] [media] s5p-fimc: fix sleep in atomic in flite_hw_reset
Date: Tue, 21 May 2024 10:36:07 +0300
Message-Id: <20240521073607.19426-1-abelova@astralinux.ru>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DrWeb-SpamScore: -100
X-DrWeb-SpamState: legit
X-DrWeb-SpamDetail: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehuddgtddvucetufdoteggodetrfcurfhrohhfihhlvgemucfftfghgfeunecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpeetnhgrshhtrghsihgruceuvghlohhvrgcuoegrsggvlhhovhgrsegrshhtrhgrlhhinhhugidrrhhuqeenucggtffrrghtthgvrhhnpeffhfffiefggedvjeduhfdtjefgvdfhteeivdfgleevleeihfejhfefkeethfegheenucfkphepuddtrddujeejrdduhedruddtgeenucfrrghrrghmpehhvghloheprhgsthgrqdhmshhkqdhlthdquddtiedtiedvrdgrshhtrhgrlhhinhhugidrrhhupdhinhgvthepuddtrddujeejrdduhedruddtgeemfeehgeeigedpmhgrihhlfhhrohhmpegrsggvlhhovhgrsegrshhtrhgrlhhinhhugidrrhhupdhnsggprhgtphhtthhopedutddprhgtphhtthhopehsrdhnrgifrhhotghkihesshgrmhhsuhhnghdrtghomhdprhgtphhtthhopegrsggvlhhovhgrsegrshhtrhgrlhhinhhugidrrhhupdhrtghpthhtohepmhgthhgvhhgrsgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihksehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhhimhdrrghkhhhtrghrsehsrghmshhunhhgrdgtohhmpdhrtghpthhtohepkhihuhhnghhmihhnrdhprghrkh
 esshgrmhhsuhhnghdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvgguihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqkhgvrhhnvghlsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinhhugidqshgrmhhsuhhnghdqshhotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-DrWeb-SpamVersion: Vade Retro 01.423.251#02 AS+AV+AP Profile: DRWEB; Bailout: 300
X-AntiVirus: Checked by Dr.Web [MailD: 11.1.19.2307031128, SE: 11.1.12.2210241838, Core engine: 7.00.62.01180, Virus records: 12694235, Updated: 2024-May-21 05:22:48 UTC]

flite_hw_reset is called in fimc_lite_resume with spinlock
acquired that is forbidden. Replace usleep_range with udelay.

Fixes: 2b511edb986f ("[media] s5p-fimc: Add FIMC-LITE register definitions")
Signed-off-by: Anastasia Belova <abelova@astralinux.ru>
---
 drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.c b/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.c
index 2483277a6cb0..f1e7375c9a5f 100644
--- a/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.c
+++ b/drivers/media/platform/samsung/exynos4-is/fimc-lite-reg.c
@@ -30,7 +30,7 @@ void flite_hw_reset(struct fimc_lite *dev)
 		cfg = readl(dev->regs + FLITE_REG_CIGCTRL);
 		if (cfg & FLITE_REG_CIGCTRL_SWRST_RDY)
 			break;
-		usleep_range(1000, 5000);
+		udelay(1000);
 	}
 
 	cfg |= FLITE_REG_CIGCTRL_SWRST;
-- 
2.30.2


