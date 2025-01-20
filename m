Return-Path: <linux-media+bounces-24960-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7736A16D08
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 14:11:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 56001188690B
	for <lists+linux-media@lfdr.de>; Mon, 20 Jan 2025 13:11:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 578F81E0E15;
	Mon, 20 Jan 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="DOM74JzE"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 253721B5EBC;
	Mon, 20 Jan 2025 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737378694; cv=none; b=u0o7WAtHYUfe08fE2sWyIUorQE1f9bM4nPpZS9ZgmIgA2xsiAqYvWLC79D5+wWCwxUoL9dGenFGg4kAjslXfauMG4gYLFkKJrnyYomHSHTfMifSr3n53fy3gkFMbNuIWDUxBRVXEX7FJGrAn8Io+LXxgVz7Qvhpg+0O/ZcsP44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737378694; c=relaxed/simple;
	bh=sFCtfzs2KQB+c8bAbyI+lVcvUTAaxuYGpw5HO4jgM9c=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q9bUtE9kWo3lnPcSTyr8IliJUdWUdYnAKGVIt2Ki9gOiKKPuIdWs8rmDnLlqBMUwOsb1w29LtMeHoyt67CK/0jNzkzrVB5LokY6Wklro9gEAYT8a4Edx1+6yYK1Fx1Ulghh1zyZZiTNwoffbVmHvoh0tfnuIHGAxEl/sv6RQ4ZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=DOM74JzE; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A58FF2E0;
	Mon, 20 Jan 2025 14:10:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1737378623;
	bh=sFCtfzs2KQB+c8bAbyI+lVcvUTAaxuYGpw5HO4jgM9c=;
	h=From:Subject:Date:To:Cc:From;
	b=DOM74JzE54GLsZrlzAT2E30z21r7vFN2D6J5D6WqYmTqa1lzJhgzIXXVSYns33WDF
	 7yIUTXiFN9kdv4q0Iq4J4AL5Vch7Pkn2wNStugcMKCVex6/hIU/HBKdS6qib47bIsF
	 wY36jWSCS0YcJdP8vMdwFslIfwXgvEAYOAmTbXXo=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 00/10] media: rcar: Minor cleanups and improvements
Date: Mon, 20 Jan 2025 15:10:33 +0200
Message-Id: <20250120-rcar-media-impro-v1-0-043823c3893e@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEpLjmcC/x3MPQqAMAxA4atIZgP9QUWvIg4lRs3QKimIIL27x
 fEb3nshswpnmJoXlG/JcqYK2zZAR0g7o6zV4IzrjHUGlYJi5FUCSrz0REd+IGt8z3aEml3Kmzz
 /cl5K+QBg95H3YgAAAA==
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1269;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=sFCtfzs2KQB+c8bAbyI+lVcvUTAaxuYGpw5HO4jgM9c=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnjktxyWqlO8BaXA3a31hHiL5zscps/G/pye7e/
 gZW9tTQkEaJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ45LcQAKCRD6PaqMvJYe
 9eP2D/0ZANjRWRX0GcwFeUPrbIqPU14Xxsf2dtSrvhbdb4FKRbaRHuRbYL4loVJs88jpy9ZXW1N
 u3yYlY7ls0ePyiqe53MCWozQiFM1J0vrPN7Qst8IU7LbsUhK+2tJGlZysZGAo1I8iBQso6KsPgz
 U3jnXexI504JRDZep2uDCjsnYYbqdLQ0AdTWpGyuVk7KbMXqx+pDfJA4XmXtVesXaU3v8dqX2Rm
 nj3XwqgBuw+YEsNi6YMU5QnqS4uIYSgs0F7d+XeQbpj+XyUzSJlBcABE9/5kTEEAWhNwYkPXdwk
 NC/mudtN3hst2AHsl3fctu+cMwkGOcxcNkpUjFFD0OaQqN0xafftfrW2ncgH7HPsQigeUWqn8Ol
 pLIw/+bOIAWw2BdIJ5hVzfWGMcCvkrgy8I7I5ZHq3tO3mIPxacz5a3nfVPm9seDbhOgW7235scg
 mwCEj6fYNiZW1c4Qw9D67Fg/WhO0BXLwL0xTOlJn2jnRV39OOPTjeIZnLsCdt+6axNZTG529rjM
 U46EAkTO5bkMq2WnA811E5aeKEDnYFMZZfOmdHkduzFOpKE9RrDGKLQS72ip3g4kLfHkvQg0N30
 HXMrbMh2OayUdk6GMWUMNv+PWL1IlxTUjMmxx4eeGC576D53RNQ72AfriwiqoXlkx/896Wzz2do
 I1X7eS3Q7h7LU9w==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

I've started looking at multi-stream support, and came up with these
while working towards streams.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (10):
      media: rcar-csi2: Move Y8 entry to a better place
      media: rcar-csi2: Add RAW10 and RAW12 formats
      media: rcar-isp: Add RAW8, RAW10 and RAW12 formats
      media: rcar-csi2: Use v4l2_get_link_freq()
      media: rcar-vin: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-isp: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-csi2: Use v4l2_subdev_{enable|disable}_streams()
      media: rcar-isp: Convert to subdev state
      media: rcar-isp: Convert to .{enable|disable}_streams
      media: rcar-csi2: Convert to .{enable|disable}_streams

 drivers/media/platform/renesas/rcar-csi2.c         | 118 ++++++++++-----
 drivers/media/platform/renesas/rcar-isp.c          | 162 +++++++++++++--------
 drivers/media/platform/renesas/rcar-vin/rcar-dma.c |   4 +-
 3 files changed, 190 insertions(+), 94 deletions(-)
---
base-commit: 94794b5ce4d90ab134b0b101a02fddf6e74c437d
change-id: 20250120-rcar-media-impro-2c37c1036e19

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


