Return-Path: <linux-media+bounces-30065-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2C8A866AE
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 21:53:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EE0F1B86F23
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:53:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8B90280A39;
	Fri, 11 Apr 2025 19:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="n0pYCUCQ"
X-Original-To: linux-media@vger.kernel.org
Received: from forward206b.mail.yandex.net (forward206b.mail.yandex.net [178.154.239.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAF722DF9B;
	Fri, 11 Apr 2025 19:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744401210; cv=none; b=qQXPQKurlRvuKandqYTXhDHcZrjFxauv0Zsp3TxkFeaf+wnU1DwGbL7uGC9h+N/LjFtoR25UFiuLEvGBEqWsq/TFnNa5ZowzTYQ2cJd5sGJgnbQ5Waj1n4FSNvKMDwmKCbEd0J99Htr9hzJoQPSvVlPdG85+uHAefqK1ZOrCR1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744401210; c=relaxed/simple;
	bh=oIUdq8AwuUOn/B0I+QRLY7ZU+A1r3xm26JATmOYKwCc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y19fP77XDjzYgPg1JankMEK8QnxSOPldsvDqs3deeHGb5bVtxcwzra6mf7TQqgv79m7ueWPJDJKR5iJQZuz8bIJDLyKbCxGjnrhBCLTavRekrUQJYndDyHBSqDH9YoRhbCklCdGTylTHeHT4JVrwFDPKm5Qj2hZ6ALstQgeJT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=n0pYCUCQ; arc=none smtp.client-ip=178.154.239.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Received: from forward100b.mail.yandex.net (forward100b.mail.yandex.net [IPv6:2a02:6b8:c02:900:1:45:d181:d100])
	by forward206b.mail.yandex.net (Yandex) with ESMTPS id EEA6064D0C;
	Fri, 11 Apr 2025 22:49:16 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net [IPv6:2a02:6b8:c0c:740a:0:640:fb7d:0])
	by forward100b.mail.yandex.net (Yandex) with ESMTPS id 4EECF60CFE;
	Fri, 11 Apr 2025 22:49:09 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net (smtp/Yandex) with ESMTPSA id 7nmKVk5LZuQ0-6DSHF7no;
	Fri, 11 Apr 2025 22:49:08 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1744400948; bh=j3/qr7nsjFYAjOc/eCRPG4PZjLWu5vJaVnHvpnIJ6R0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=n0pYCUCQGLOH4g/mWmf6ZEeP2OoClVnuYuew2aeosciXNOCnbnt+qARYMSGmBPg63
	 rg1kaCnAgiQevh0kd04ldAcdbsO3Ntn52XA6i8GKbVTkpNNysRadzKyK1WzwfxgOWC
	 KZT1P7eLuVhz4I+IhHN+LrzM1euiO7QjcX8/jX04=
Authentication-Results: mail-nwsmtp-smtp-production-main-77.iva.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Dmitry Nikiforov <Dm1tryNk@yandex.ru>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Johan Hovold <johan@kernel.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	lvc-project@linuxtesting.org
Subject: [PATCH] media: davinci: vpif: Fix memory leak in probe error path
Date: Fri, 11 Apr 2025 22:48:17 +0300
Message-ID: <20250411194818.11635-1-Dm1tryNk@yandex.ru>
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

Fix this by adding `platform_device_del(pdev_capture)` in the error path.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Fixes: 43acb728bbc4 ("media: davinci: vpif: fix use-after-free on driver unbind")
Signed-off-by: Dmitry Nikiforov <Dm1tryNk@yandex.ru>
---
 drivers/media/platform/ti/davinci/vpif.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/ti/davinci/vpif.c b/drivers/media/platform/ti/davinci/vpif.c
index a81719702a22..d803631072c4 100644
--- a/drivers/media/platform/ti/davinci/vpif.c
+++ b/drivers/media/platform/ti/davinci/vpif.c
@@ -527,6 +527,7 @@ static int vpif_probe(struct platform_device *pdev)
 
 err_put_pdev_display:
 	platform_device_put(pdev_display);
+	platform_device_del(pdev_capture);
 err_put_pdev_capture:
 	platform_device_put(pdev_capture);
 err_put_rpm:
-- 
2.49.0


