Return-Path: <linux-media+bounces-28608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94B86A6D5C9
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 09:05:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9C6D7A4718
	for <lists+linux-media@lfdr.de>; Mon, 24 Mar 2025 08:04:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97B7225C716;
	Mon, 24 Mar 2025 08:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="t3sX6v/e"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9023918B470;
	Mon, 24 Mar 2025 08:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742803505; cv=none; b=jHNDPmcq+vrsNGXIJGuUh8PkR3IEaRCht2AVU5oOOEQNVB7Ptm3IKMPWX50K7ULIhjNTkud6h7N7ihtV23A2iy8cJRxaWpWQxRZF565g+ji2xmBBHgOdWD6cmnXVaMb5q+F8emsDqxciNTkpXayr6C9ZF+AqT98iYKre4d6Cr+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742803505; c=relaxed/simple;
	bh=TKskNBLPeo1lBhgmUyu9myMXtF9h3YS7rpbRm8JCR5M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WFIkJ0CWwBMo9zNoGpEkr57vIb4wvf/G4OsMZlhXxiUJ6zXK2m95bu83Qx1QGfyBLmpS5SaiogpOI9yO7BK0YmdbovQJIrp52Ti439A+1SSEpRJCFbr5EcIvxt6J3W9rjYtX+y/p/WqGXhV0OyQVA/JRo1K52YPdN0+63B4kgEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=t3sX6v/e; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 5E29563F;
	Mon, 24 Mar 2025 09:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1742803395;
	bh=TKskNBLPeo1lBhgmUyu9myMXtF9h3YS7rpbRm8JCR5M=;
	h=From:Subject:Date:To:Cc:From;
	b=t3sX6v/eNu7LkRA2bl18o+72DnaEPDQrq6dIoqi2TtcCWo/7g5jDyskE+XWX1yurz
	 PsFjrGtY/NfeJjenK8yvYtaGZVK6C4dy32xz7iTt/mN0vHve04yFYO0a0Xx6PSlntJ
	 OQbX/G5Gquv5An0WEWBRy8PJWVd+ptobSTn3y9MU=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH v4 0/3] media: subdev: Add
 v4l2_subdev_get_frame_desc_passthrough and use it
Date: Mon, 24 Mar 2025 10:04:43 +0200
Message-Id: <20250324-frame-desc-passthrough-v4-0-dbe2412297cc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABwS4WcC/4XNsQ6DIBDG8VcxzKURDlQ69T2aDiinMigGLGljf
 PeiSzvUdPxfcr9vIQG9xUAu2UI8RhusG1OIU0aaXo8dUmtSE55zmXNW0dbrAanB0NBJhzD33j2
 6nhZFlUsUDFQpSHqePLb2ucO3e+rehtn5174T2Xb9S0ZGc6qBC1m1EkomrtagDm6snfbm3LiBb
 HLk35o61HjSJANpZImNKfSBBh8tTR9qkDSloAKlWatq+KGt6/oGMUGphV8BAAA=
X-Change-ID: 20250218-frame-desc-passthrough-66805e413974
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1586;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=TKskNBLPeo1lBhgmUyu9myMXtF9h3YS7rpbRm8JCR5M=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBn4RIrfO4q48FllCcKgconQwH4aphtt4vlcXCXg
 CH0zaDsXO+JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ+ESKwAKCRD6PaqMvJYe
 9dTgD/9DtFTyDJMUZdI01jwnuZ3MoTSK1N7/xZrAaKTNVXxWpAfGZBgWYY5bwTw3DfdF49tEJU0
 C2sw9XBzQq8iQ4tRw1S9g2vC4C4P6pf6nH0Gd02U35w2LYwTyQQINso3jJFhQcNec4K2RRiLETk
 kiyzfgTYCYuwB7yEv8Do239XJbSQXQbsW4EnK+q7nCaP4qz9RMPgv2UUUuiCWlxcE4JcD8KMBB4
 IXghONlD/lYn5nbQ/Ezu2r6U8z9WigGaPOq0j3MQnH/rSf+tKRp6W+1ylaP9d5gNwLn25B6Agz3
 X2T7e2Cpyg6sf67VivUo4YXSwgpb4EFsfnTqKDL0H4joiDmOC5E6rylTYks+6AYekyGPjP9nTGd
 AwmeUyNEpgnAyIT4YsimUC8kMyTal4D2TJvP40UyH2bc8l0yuuqX6fWBimo7Q7bT8nl1i2n0IHk
 4XIyKQJUMWusj+nIkKDLgG9ShkRGNxHsn0Q/k6ssqjW39Loa6Oa3l6dWyy0DuQqkhRO67gtL5JC
 1DrwKRbj4tvKMLNDhCFxzmDS/W4Shks6bmlr8TgS/aXaRHKQnuSyOySxrxtqvI+Yn8wy5j8QTal
 S/X9ggax6OE0EOMkTDBqs72kjW6Rpwj6ecfPe0/VO7H3K1p4/hBW6ROtVtmKx8B+1JbFx7UqYLR
 3gKTR1HmJuMktXQ==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

When writing the exact same code the third time for Renesas, I thought
we probably need a helper.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Changes in v4:
- Update the helper name in commit descriptions too
- Link to v3: https://lore.kernel.org/r/20250324-frame-desc-passthrough-v3-0-993839a1f9b3@ideasonboard.com

Changes in v3:
- Rename the helper to v4l2_subdev_get_frame_desc_passthrough()
- Check for fd->entry[] array overflow
- Add error prints (with dev_dbg)
- Link to v2: https://lore.kernel.org/r/20250219-frame-desc-passthrough-v2-0-5135d57ecd6a@ideasonboard.com

Changes in v2:
- Fix "uninitialized symbol 'ret'"
- Reorder local variables
- Link to v1: https://lore.kernel.org/r/20250218-frame-desc-passthrough-v1-0-a32458f53714@ideasonboard.com

---
Tomi Valkeinen (3):
      media: subdev: Add v4l2_subdev_get_frame_desc_passthrough helper
      media: i2c: ds90ub953: Use v4l2_subdev_get_frame_desc_passthrough
      media: i2c: ds90ub913: Use v4l2_subdev_get_frame_desc_passthrough

 drivers/media/i2c/ds90ub913.c         |  59 +-----------------
 drivers/media/i2c/ds90ub953.c         |  61 +-----------------
 drivers/media/v4l2-core/v4l2-subdev.c | 113 ++++++++++++++++++++++++++++++++++
 include/media/v4l2-subdev.h           |  22 +++++++
 4 files changed, 137 insertions(+), 118 deletions(-)
---
base-commit: f2151613e040973c868d28c8b00885dfab69eb75
change-id: 20250218-frame-desc-passthrough-66805e413974

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


