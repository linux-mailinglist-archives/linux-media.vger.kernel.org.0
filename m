Return-Path: <linux-media+bounces-802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8B27F476E
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 14:14:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 84E7E1C2095B
	for <lists+linux-media@lfdr.de>; Wed, 22 Nov 2023 13:14:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314B34D5A1;
	Wed, 22 Nov 2023 13:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="dkEJTgDp"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D03F9A;
	Wed, 22 Nov 2023 05:14:14 -0800 (PST)
Received: from [127.0.1.1] (91-158-149-209.elisa-laajakaista.fi [91.158.149.209])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 0E50A276;
	Wed, 22 Nov 2023 14:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1700658820;
	bh=xUp1lgq1XJQ0yPFO/RbO43/4PZtMpFPBohbQDo/f+A8=;
	h=From:Subject:Date:To:Cc:From;
	b=dkEJTgDpEU0HfTgvsJ1uVzNYn0a6ZMbzKZP6BWcffECOhtLeyjIRk3upTC2XXe3LG
	 FXxb11913gKBMg4dlefMRrdujdAjV2qlfMYkakzylR4eZKxjjr24Y0Q2qOs+ixxuTS
	 ToB3aXezYG2YyeMjxLYzoI+ES3h3A7wM1xHbXqCg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Subject: [PATCH 0/2] media: imx-mipi-csis: csis clock fixes
Date: Wed, 22 Nov 2023 15:13:47 +0200
Message-Id: <20231122-imx-csis-v1-0-0617368eb996@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIv+XWUC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI2NDQyMj3czcCt3k4sxiXXPLFCMDw5QUU8MkSyWg8oKi1LTMCrBR0bG1tQB
 R9wWfWgAAAA==
To: Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=612;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=xUp1lgq1XJQ0yPFO/RbO43/4PZtMpFPBohbQDo/f+A8=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBlXf6eANEcYpo9fhJrOO1DodWQTpcIxD8I1dgYm
 JKjiwHqtaiJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZV3+ngAKCRD6PaqMvJYe
 9TEJD/9hB869O9DsFhXVeUTS1/P8og9vzsRKOAq134o4gQqN4Jp5dSpeJQ+6Br4GcNry0jLlhy6
 HCznF78fbSFdDk2WjzrmOdoBIrdCCWSb7JVGmLRZJIMmBJnEgXTxdLbuilDLZO8b/hq0o2OkOtO
 YRMz9ASGshHD18sx9b0Uy5/n+7pL6gM+0WQG0kYpK+mqtbHFdBXKt/4JcYi5i78ruSgDiruphko
 mc4FlDLGcJ8cP0Uzrbg/NkAESBI48ElrOiPiM9hGuuGCp2wW6joPnKQ62yDVFvwmTifWxYIP+n5
 5yojuAKcabZtQYK4EN48m75apyKkHE9wqogSJ+lPlKMg78Wc6U5ZqkGNPrFJb9xK6E6F6TeRUmz
 oXFZC0wTZFbe1AdLk0dAPBMMI/9T64vtg+BbuOt8VxrSWZKH9GOmoHQq2IiSjnQqTUHey5At4l7
 BPpAIXbTbTppN23ejnKby1Ev02uYd0jQJXON8GqA33I2SZ70cPr6Hq+hhfYx++6t+9IYCUwun7X
 SoIbnKlDb/RqqUhOZZlx+UjXOzQjYdP+KGJxiYofSLWOQ/whdPN/43/amRDVrM7sKrvU5CWO5pq
 RgghuyPHGhxKUtVNoJfq3EPvagRAa6mxf+5ZWrMI4q+8JPAP2RYvq9gEewsBAtbRkhHX+I8WpAi
 I5F/IreZV71tlug==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

Two fixes to the csis driver: One to fix remove() another to only enable
the clocks when needed.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
Tomi Valkeinen (2):
      media: imx-mipi-csis: Fix clock handling in remove()
      media: imx-mipi-csis: Drop extra clock enable at probe()

 drivers/media/platform/nxp/imx-mipi-csis.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)
---
base-commit: 1865913dd590ca6d5e3207b15099a1210dd62f29
change-id: 20231122-imx-csis-79d201dd51b9

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>


