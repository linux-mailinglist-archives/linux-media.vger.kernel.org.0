Return-Path: <linux-media+bounces-12441-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A15F8D7E85
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 11:29:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B7CB1C20D51
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2024 09:29:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AA2C82863;
	Mon,  3 Jun 2024 09:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="BN8Av7d2"
X-Original-To: linux-media@vger.kernel.org
Received: from mail.zeus03.de (www.zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 126778060E
	for <linux-media@vger.kernel.org>; Mon,  3 Jun 2024 09:28:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717406931; cv=none; b=E7gHU9+rYD8ozWuLJVLPtGgew9k1i+D+hAgaWG9VICwlczn/1JCKzw7JgwKcup1/QnQZnQm3lyh5GwbUjbcjxfCpcfNW4nfALkgEfjqIOBfvHBbFZZjXjVDvczw1lveNjSWDS2C/5CdtioD+lTkxK3PooTcGJGJorh9Ebj8AdT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717406931; c=relaxed/simple;
	bh=9j/1lmebo/z19m1KypYAjU75AQb3RkUc+Qhh2gWNLJQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=taWdv9Mq0qeWhAlNzViFrnoSJ/VtM1up3Y8p/vAC2dBQXFjOrfi5bESBynmBaVAqxFj2/9Z9sv1Nz7ZDeZB3Zd4uOEuUvy8gXXx/hpvsO+x58kLztWCu6GUYYsy0LIrCENxOWbYZ9jIa4XZJG7M1eLlY1IQFLqmEgSVEAld9YSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=BN8Av7d2; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding; s=k1; bh=Cg0RSHzMUEKoay
	W0txderNSqwftiCY7G+69iwzXz2TM=; b=BN8Av7d2legDZ1XEcvpSV8644KOEUL
	zg5h3xDYrnnJrzscjs5PdRQ3vZpGPBYyUTcttkG8Dmgb9lYcrK5sxGxbC5SV8U+6
	MbDPTTizOgQEtW2a4V3dYuh6wK3VkXFOOThdZRJTYVuY6hyXUUHFKTZwBcDC4UfA
	AkguzOg0jXd2TyJ4zaEoiAkFz0uQ9aLrqTlAGw0aL849zXaUiZSfAAv2hmKNoZ6R
	KiPvr4eG/YnQnxv5WY9COxXbEW8kBSU86z3RQ0ffP3JB0hHJYN5K/x/0zbauP6/t
	BsJ7vGhCjrtOZCq/pdMwtqWLRjQhRMecRLp6t9VDlzLNdegGgunwheOg==
Received: (qmail 1903014 invoked from network); 3 Jun 2024 11:28:46 +0200
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 3 Jun 2024 11:28:46 +0200
X-UD-Smtp-Session: l3s3148p1@ITXK9fgZGJEgAwDPXzLGAH1eNELjOc3g
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-kernel@vger.kernel.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andrey Utkin <andrey_utkin@fastmail.com>,
	Anton Sviridenko <anton@corp.bluecherry.net>,
	Benoit Parrot <bparrot@ti.com>,
	Bluecherry Maintainers <maintainers@bluecherrydvr.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Dmitry Osipenko <digetx@gmail.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Fabien Dessenne <fabien.dessenne@foss.st.com>,
	Ismael Luceno <ismael@iodev.co.uk>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 0/8] media: use 'time_left' instead of 'timeout' with wait_*() functions
Date: Mon,  3 Jun 2024 11:28:31 +0200
Message-ID: <20240603092841.9500-1-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a confusing pattern in the kernel to use a variable named 'timeout' to
store the result of wait_*() functions causing patterns like:

        timeout = wait_for_completion_timeout(...)
        if (!timeout) return -ETIMEDOUT;

with all kinds of permutations. Use 'time_left' as a variable to make the code
obvious and self explaining.

This is part of a tree-wide series. The rest of the patches can be found here:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git i2c/time_left

Because these patches are generated, I audit them before sending. This is why I
will send series step by step. Build bot is happy with these patches, though.
No functional changes intended.

Wolfram Sang (8):
  media: allegro: use 'time_left' variable with
    wait_for_completion_timeout()
  media: atmel-isi: use 'time_left' variable with
    wait_for_completion_timeout()
  media: bdisp: use 'time_left' variable with wait_event_timeout()
  media: fimc-is: use 'time_left' variable with wait_event_timeout()
  media: platform: exynos-gsc: use 'time_left' variable with
    wait_event_timeout()
  media: solo6x10: use 'time_left' variable with
    wait_for_completion_timeout()
  media: tegra-vde: use 'time_left' variable with
    wait_for_completion_interruptible_timeout()
  media: ti: cal: use 'time_left' variable with wait_event_timeout()

 drivers/media/pci/solo6x10/solo6x10-p2m.c        |  8 ++++----
 .../media/platform/allegro-dvt/allegro-core.c    | 16 ++++++++--------
 drivers/media/platform/atmel/atmel-isi.c         |  8 ++++----
 drivers/media/platform/nvidia/tegra-vde/h264.c   | 10 +++++-----
 .../media/platform/samsung/exynos-gsc/gsc-core.c | 10 +++++-----
 .../platform/samsung/exynos4-is/fimc-core.c      | 10 +++++-----
 drivers/media/platform/st/sti/bdisp/bdisp-v4l2.c | 10 +++++-----
 drivers/media/platform/ti/cal/cal.c              |  8 ++++----
 8 files changed, 40 insertions(+), 40 deletions(-)

-- 
2.43.0


