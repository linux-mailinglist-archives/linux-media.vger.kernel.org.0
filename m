Return-Path: <linux-media+bounces-18434-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6005297DE7D
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 21:17:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E73431F21A11
	for <lists+linux-media@lfdr.de>; Sat, 21 Sep 2024 19:17:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0B0F762C1;
	Sat, 21 Sep 2024 19:17:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="m6QnIqdS";
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="S3cCOpOT"
X-Original-To: linux-media@vger.kernel.org
Received: from gofer.mess.org (gofer.mess.org [88.97.38.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 470341392;
	Sat, 21 Sep 2024 19:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.97.38.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726946256; cv=none; b=e9xVYPqAAp8G7SDGPOzWqjC1IbJI19ck3POFQAd0fu9ixUjaOWuaDqcyuJz+Eup26rUsnjJs8yICmBWWtuQIFTs/njtohsK7vxH/3UgRR3ffnAVSEM+Ol1epR2BoB5YXc4Ab4dr8+N1/G4xtuSkojWfYISZXzSVSOlFop1w4Dco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726946256; c=relaxed/simple;
	bh=cgRQbwJVNpvi+0gMyBwLXOX4Nb7zmR8PfJXPOhfQyYU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=prSV9UdV+JFmeXVGyLq5rEjTLJsOP73nHxwCZwOCxRRAgB3r8t+f5tow7c0QadxcGiMB0ltbedqav8L5Z7L3jSuYveZgFjYrPVVffA/QEPCUmBfkvopWwkqZll1SZ1LBLd5gqDtSjuh6eZAMLJuiZrI66mKzecij9mW/DTTro2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=m6QnIqdS; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=S3cCOpOT; arc=none smtp.client-ip=88.97.38.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1726945656; bh=cgRQbwJVNpvi+0gMyBwLXOX4Nb7zmR8PfJXPOhfQyYU=;
	h=From:To:Cc:Subject:Date:From;
	b=m6QnIqdSsw2JbFTBwE+R+1mrxhMOD5BfretrH/js4VDcsiactSb6lIGPDBuOUMTiX
	 0q/ddrLPJs5uhSopFwQpbyFLkvWFmrXD7Uk72ryVLaQAHtLcvSa765awBQnZLX6siM
	 sxy/9YBYHfNngoI97AqNZvgVqqgQg1jL4iJ4hPjQ5dhAru5P45BWhjDtEIk7qqN5fq
	 pIoRPjPz3R4L2DkISVBQZjbrAtxXWUjQW5sr/cG5GLoz3ujdsww8T3AeJDwGFGRveu
	 Z3JZZqlOL3AC+/UdvYuDjdjNRJfAt+P8GlpUJzkfIsRuPh3kKCvpGdyqELEraZxeq4
	 wBlgbg0w4y5hg==
Received: by gofer.mess.org (Postfix, from userid 501)
	id 6ACFB1003BE; Sat, 21 Sep 2024 20:07:36 +0100 (BST)
X-Spam-Level: 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1726945655; bh=cgRQbwJVNpvi+0gMyBwLXOX4Nb7zmR8PfJXPOhfQyYU=;
	h=From:To:Cc:Subject:Date:From;
	b=S3cCOpOTDPHpIl9Ly0cGT/4qAKgmxyeFY2tQEB7tYjGlJ7yky3FVNyIS17uSSLWVe
	 tsTn+YVTV4QuDafVdjh6mti4dlLVBp9lNk5x+wbh41b+YQz74UcPk5jLO/jwz0iqr8
	 zKnhSmQ+KTNK/YyGiXuuAxQlXtCKmODVtFNV+VJjJ8vfVTZeooSv2r3Kvdu0rRNW7I
	 P7cgE1KzVuc9d3YrLGzYKiYTq5eNWebFYjR2KY1BqEBvNwT9tTUiZSiDR0bD8TCwoy
	 oDcpkFh8vgdxvTMCdQ8+YcjYq7edDQyE0Q1FNOL2MO9ppGiPebvy0p0oJqq5Wcqcx7
	 rhyceWyCC7JPQ==
Received: from localhost.localdomain (bigcore.local [IPv6:2a02:8011:d000:212:bc3c:1b4a:a6fa:362f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by gofer.mess.org (Postfix) with ESMTPSA id A72DB1003B9;
	Sat, 21 Sep 2024 20:07:35 +0100 (BST)
From: Sean Young <sean@mess.org>
To: linux-media@vger.kernel.org,
	linux-rt-users@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH] media: gpio-ir-tx: Driver does not behave with PREEMPT_RT
Date: Sat, 21 Sep 2024 20:07:20 +0100
Message-ID: <20240921190721.6082-1-sean@mess.org>
X-Mailer: git-send-email 2.46.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This driver bit-bangs a signal with interrupts disabled. The signal can
last for up to half a second (IR_MAX_DURATION).

A much better way of transmitting IR is using the pwm-ir-tx driver,
which does not disable interrupts.

Signed-off-by: Sean Young <sean@mess.org>
---
 drivers/media/rc/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/rc/Kconfig b/drivers/media/rc/Kconfig
index 74d69ce22a33e..0a8aeafdb7e07 100644
--- a/drivers/media/rc/Kconfig
+++ b/drivers/media/rc/Kconfig
@@ -184,6 +184,7 @@ config IR_GPIO_TX
 	tristate "GPIO IR Bit Banging Transmitter"
 	depends on LIRC
 	depends on (OF && GPIOLIB) || COMPILE_TEST
+	depends on !PREEMPT_RT
 	help
 	   Say Y if you want to a GPIO based IR transmitter. This is a
 	   bit banging driver.
-- 
2.46.1


