Return-Path: <linux-media+bounces-37219-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C2EAFF1A9
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 21:17:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 238617B71A4
	for <lists+linux-media@lfdr.de>; Wed,  9 Jul 2025 19:15:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97EC823CEE5;
	Wed,  9 Jul 2025 19:16:22 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399D421FF3C;
	Wed,  9 Jul 2025 19:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752088582; cv=none; b=PNMb1HIruBrwgHeA7AiJcC4askq2DnZ9psCrbFB4vdbSgL/R1wnIUuld9fT5T87i1tQEoQmjzYX6bZQGMI9Mz+ft/JFMM+iIXGvDNuN2MWq+8ubYx00HybjXZGuFZkiM6rChaD+mT1cYe0aS4DN8ykbtiJ1rMZ+5DUBXRXR1OpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752088582; c=relaxed/simple;
	bh=KpI95TjEwinAuJ1zJVwza0gTD/QCdQKQS+LJlspGcHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D6upCMH8gM9il9+uuiM58BDg80jAGfO/Lzd2g+vBXMzmLo055+3oooZrVv0DXkK9hpeykVakOzy49XzH4qMlA36QMOy80TknvfiaVg+aAZXigIu188G86njZlWMfmQuICLqNVoM2NLSrVrlVIj3AtvkyPpLrT3P7KMFVLhVS+eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B1FCC4CEF0;
	Wed,  9 Jul 2025 19:16:19 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/5] media: renesas: Convert to modern *_PM_OPS()
Date: Wed,  9 Jul 2025 21:16:06 +0200
Message-ID: <cover.1752088108.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

	Hi all,

This patch series converts the Renesas media drivers from the old
SIMPLE_DEV_PM_OPS(), SET_SYSTEM_SLEEP_PM_OPS(), and SET_RUNTIME_PM_OPS()
helpers to the modern DEFINE_SIMPLE_DEV_PM_OPS(), SYSTEM_SLEEP_PM_OPS(),
RUNTIME_PM_OPS(), pm_ptr(), and pm_sleep_ptr() helpers.  This lets us
drop the __maybe_unused annotations from power management callbacks, and
reduces kernel size in case power management or sleep support is not
enabled.

Thanks for your comments!

Geert Uytterhoeven (5):
  media: renesas: rcar_drif: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  media: renesas: rcar-vin: Convert to DEFINE_SIMPLE_DEV_PM_OPS()
  media: renesas: fdp1: Convert to RUNTIME_PM_OPS()
  media: renesas: ceu: Convert to RUNTIME_PM_OPS()
  media: renesas: vsp1: Convert to SYSTEM_SLEEP/RUNTIME_PM_OPS()

 .../media/platform/renesas/rcar-vin/rcar-core.c    |  8 ++++----
 drivers/media/platform/renesas/rcar_drif.c         | 10 +++++-----
 drivers/media/platform/renesas/rcar_fdp1.c         | 10 ++++------
 drivers/media/platform/renesas/renesas-ceu.c       | 10 ++++------
 drivers/media/platform/renesas/vsp1/vsp1_drv.c     | 14 +++++++-------
 5 files changed, 24 insertions(+), 28 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

