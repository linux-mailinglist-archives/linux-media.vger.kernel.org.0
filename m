Return-Path: <linux-media+bounces-26947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD27A43FBE
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 13:55:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 995A2189FD82
	for <lists+linux-media@lfdr.de>; Tue, 25 Feb 2025 12:55:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8ACE2268FC2;
	Tue, 25 Feb 2025 12:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="ClrOZbsT"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4946A38DE0;
	Tue, 25 Feb 2025 12:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740488087; cv=none; b=Wtd5ElYlTmjsGPaf0bbxaC0SNhkgv5lEGmSqEZi+E0W/2fYZ/CSDQddt5a2mLSJZfrBOZaWHbYa9qgwRTQAhYzKMKg4lyIEPrlW0+qOp7KI2mbN8sE6HbSHMSg2otjNnrTD/FqO5mSNVLOG6p5TADgN7w7v8p3DBNO+VY7yRgEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740488087; c=relaxed/simple;
	bh=K8hIYu68rnMk8PuN3JrllsDdE9qN2sKwvnV/8hDc6p0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dQ8UxHZsKIN4ylJTmjF0poTQ5QJ8sbauT5L4k8smBPbsI14Cx/e04NlYwCPg/aINSPOmSO9DBbr6NYcNSsgBjrsG6gRCHAEWvtI89tYZa0r2tIs5t3YfQvgTMv/q4Y5QlyK0FBAXPJlsy4nxo0X6Hgk+bMvchYuYT08HPhXasVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=ClrOZbsT; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [223.190.81.179])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8778EA30;
	Tue, 25 Feb 2025 13:53:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1740487996;
	bh=K8hIYu68rnMk8PuN3JrllsDdE9qN2sKwvnV/8hDc6p0=;
	h=From:Subject:Date:To:Cc:From;
	b=ClrOZbsTTH3DFN6wyn7XRIdWSNmRUQOenqTON8mDFWaaecoAKayo7wfkldy88kzIj
	 +WkWCtf8F38ZoVrUeXhdADCYcYlhNeTg0os08ccJIlpsq5+u3obe/gt3LTU9xM5fgM
	 knG0E664+BWc1QyCxotQVOnTuCWl6MMMqLwTWSX4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v3 0/2] media: rockchip: rkisp1: Add support for WDR and
 AWB64
Date: Tue, 25 Feb 2025 18:23:03 +0530
Message-Id: <20250225-awb64-v3-0-af29b1201e48@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC+9vWcC/22MQQ7CIBBFr9LMWgxDoagr72FcQDu1s7AYMKhpe
 ndpE10Yl+/nvzdBosiU4FBNEClz4jAWqDcVtIMbLyS4KwxKKo2qlsI9fKOF3Ssr5X5HaAjK9xa
 p5+faOZ0LD5zuIb7WbMZl/S1kFCiU9ZKoMb0xeOSOXAqjDy522zZcYQll9ZGNRPzKqsgSve29t
 qgb80ee5/kNj7Bkud4AAAA=
X-Change-ID: 20241230-awb64-79270098e15e
To: Dafna Hirschfeld <dafna@fastmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Stefan Klug <stefan.klug@ideasonboard.com>, 
 Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2127;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=K8hIYu68rnMk8PuN3JrllsDdE9qN2sKwvnV/8hDc6p0=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBnvb2C0Sz5JW3o1cB9kaxxMhz3Co6XvCbcwa+yt
 ERkLN8E8KOJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCZ729ggAKCRBD3pH5JJpx
 RSEOEACmkSF2j1EvX0tKWSiVJJoKSMR1M3KwyauCfPpS8pNOq3ZDvdopd9//jpCoXQH3UBdfiXZ
 bpJR50h+tmP6PL8T3Ce28lxyJMbxW2iHQwXpw2kJf7SNwj7j5k4QwE+pG/Et74MpvLSZUi+ObHw
 YhpjpacxX7bhQP5weDBxEYQRZ0rPJbyS3/4zfIudidmYqYGCVrCqShBXvBwbVUaw+qA2tPSfneW
 AwLW5d9u7TTFklxU7jnj5DnqY9OITUfDb+4WxZ75so/21DGCaQXWOd+RVsLOyZuWwX6xCeQxvss
 ncCcofForN6WSIewgNBntA+aTify6GzJGXvYgsHZdm7u6f0Wt9Oa7Hp2bfaZJ4aG65iOHBRP/L4
 Ogx6ixXEKfEqiTffFtSSnZ2PTLq0Sb//+DI33+eozLu9DiQwtz3h8ceO63uYMWJ8o84GnXGCeBF
 FGyZlKQ5Eq5jBgq3EGohhoiFtgdj7rRWJ+tdI/Vd6K3dLflxbGGz8h76LlOkKg3ATrVfSH8kn13
 FF0PfQq60+Z08TNJGlkTYB/UL+NRaro3Ah8L/vP9ginucPo/o5oY7aqOhWzaXoLnYvLMMn6zhod
 sO7vraJbSIUF8l31zrUrsYJe5KmeWjFjyjmi/z75I1QPM58/ZFei353LSzYNabYxx6TjT8FTQ6t
 LoywyKrqHaKfWjg==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145

Add support for Wide Dynamic Range and Auto White Balance 64 modules of
the ISP.

This series is in continuation of the v2 posted earlier that enabled
only AWB64. We add a new patch enabling WDR, and rebase the AWB64
patch on top of it, as WDR is a simpler module which is present across
different variants of the ISP.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Add a new patch that enables support for WDR module, and rebase AWB64
  support on top of it
- Document the fractional bits used for AWB64 configuration parameters
- Link to v2: https://lore.kernel.org/r/20250110-awb64-v2-1-01b7fb471465@ideasonboard.com

Changes in v2:
- Fix register offsets
- Drop the _v10 suffix from awb64 functions
- Combine the min and max for R, G, B components into a single value in
  the struct
- Move all the configuration except IRQ and module enable in the
  meas_config() routine, making sure the bool bits are cleared if
  userspace updates the struct
- Fix documentation and indent at various places
- Create a single function for getting both AWB and AWB64 stats for
  IMX8MP
- Rename accumulator fields to only specify RGB and not YUV, as AWB64
  block does not operate on YUV colorspace
- Link to v1: https://lore.kernel.org/r/20241230-awb64-v1-1-27b0ee65f551@ideasonboard.com

---
Jai Luthra (2):
      media: rockchip: rkisp1: Add support for Wide Dynamic Range
      media: rockchip: rkisp1: Add support for AWB64

 .../media/platform/rockchip/rkisp1/rkisp1-common.h |   2 +
 .../media/platform/rockchip/rkisp1/rkisp1-dev.c    |   3 +-
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 215 +++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 140 +++++++-------
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  40 ++++
 include/uapi/linux/rkisp1-config.h                 | 208 ++++++++++++++++++++
 6 files changed, 533 insertions(+), 75 deletions(-)
---
base-commit: d082ecbc71e9e0bf49883ee4afd435a77a5101b6
change-id: 20241230-awb64-79270098e15e

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


