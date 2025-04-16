Return-Path: <linux-media+bounces-30381-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4CBA90D67
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 22:52:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 212243B9D9F
	for <lists+linux-media@lfdr.de>; Wed, 16 Apr 2025 20:51:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C80E6232792;
	Wed, 16 Apr 2025 20:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="TxkO2S4w"
X-Original-To: linux-media@vger.kernel.org
Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98E55204C18;
	Wed, 16 Apr 2025 20:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744836722; cv=none; b=Rvelocw7J9F2WvVezTEpojjlJXbNu/RYBcJy47/8fhSlsIr6crPl/Y07nfXJ8dm18S1dIIYVGQEUO2i2MkA7lXtgJNHdtKNNG/BMOlwqYUAwYyazzhzGtc8EZX3be7XicHHfgAZNfKdcdKRlOTyn6tl0d+gfHU7kbhenMGIl0P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744836722; c=relaxed/simple;
	bh=FiTtog5zvspmbTqv+FZ5aKpQ31DBusR1CpLXeeR5Dys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=byTMEHSAkoCiUqMHgo5dEYhxHqTvEeRSOTRGsrVlgLA86Qkxn0RCwyxoJpEb2HaL3GuQgZ2HQ1QLy9eIy1kFaYJsAk6ihPK35alPqqVt2P/EVv9aIc7Da/bV5YLlzJkk0DH5P483gQAr0RQqCAmJt0f+9fiPjsdKFhTenRNPQ8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=TxkO2S4w; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net [IPv6:2a02:6b8:c37:8f27:0:640:e8c0:0])
	by forward101b.mail.yandex.net (Yandex) with ESMTPS id B8BA960AC1;
	Wed, 16 Apr 2025 23:51:49 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id mpPrK7PLkqM0-ToHt0h2q;
	Wed, 16 Apr 2025 23:51:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1744836709; bh=jVehpbNr4KSUhLtKlDNoBxrzz29Tw89g8VjmbtqBbuU=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=TxkO2S4wr8IiuwY912oCyS4XYzEubr4SMooT3rZRf5bYf/y5wU+WnURXMS2vd9bsx
	 ltF5GqCngDfLAICVCyDkCjCSeLwAScIv5JkHiFJrw0EonswIfx5ij9t9ZI7FPiJ9Pd
	 8FTaNOcfD6nx2OHJ/CdviBSzGJRvgQpE4XSWzfGI=
Authentication-Results: mail-nwsmtp-smtp-production-main-74.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Dmitry Nikiforov <Dm1tryNk@yandex.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Johan Hovold <johan@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH v3] media: davinci: vpif: Fix memory leak in probe error path
Date: Wed, 16 Apr 2025 23:51:19 +0300
Message-ID: <20250416205121.2348-1-Dm1tryNk@yandex.ru>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If an error occurs during the initialization of `pdev_display`,
the allocated platform device `pdev_capture` is not released properly,
leading to a memory leak.

Adjust error path handling to fix the leak.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 43acb728bbc4 ("media: davinci: vpif: fix use-after-free on driver unbind")
Signed-off-by: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
---
v2: also fix of_graph_get_endpoint_by_regs() error path.
v3: Rework incorrect error handling added in v2.
Also fix missing platform_device_del() in another error path (Johan Hovold).
 drivers/media/platform/ti/davinci/vpif.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index a81719702a22..969d623fc842 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -504,7 +504,7 @@ static int vpif_probe(struct platform_device *pdev)
 	pdev_display = kzalloc(sizeof(*pdev_display), GFP_KERNEL);
 	if (!pdev_display) {
 		ret = -ENOMEM;
-		goto err_put_pdev_capture;
+		goto err_del_pdev_capture;
 	}
 
 	pdev_display->name = "vpif_display";
@@ -527,6 +527,8 @@ static int vpif_probe(struct platform_device *pdev)
 
 err_put_pdev_display:
 	platform_device_put(pdev_display);
+err_del_pdev_capture:
+	platform_device_del(pdev_capture);
 err_put_pdev_capture:
 	platform_device_put(pdev_capture);
 err_put_rpm:
-- 
2.49.0


