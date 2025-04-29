Return-Path: <linux-media+bounces-31303-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A583AA0A64
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 13:45:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8A78D1893FCE
	for <lists+linux-media@lfdr.de>; Tue, 29 Apr 2025 11:45:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F682D3A70;
	Tue, 29 Apr 2025 11:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="vs5679kz"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2052D3A68;
	Tue, 29 Apr 2025 11:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745926942; cv=none; b=NX7n7lN2ZqQrQAJy+SQZPhX7UuhTu3u0VHbfz0oNR16HSC1yjyK3Afclns/BizcmxftmkPBxKyoZrZrgI+ptGWpxVFxJtpVZuPz5GhgR+Meqz1lS0xK3Yes0xvoVoFYoBt+M7ep0nufE0m4V3AnZc+lWiihpYj7S9vpF7PDvxCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745926942; c=relaxed/simple;
	bh=AZ2eZQaNSO0yCaJCJF7YZMQJ3yiP1EQgrAq27CE+3bs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Bri47K/p2UK8LkBh+RDn0YkpIf48mdGvDSXZ3lesjOSSGR1PMNYLwHz7c/L6m5H4PGIY3/nucsImZMCVPofFxNmLYEN4lYliDMqhkohKPWIkP2YTsWVD/gTti69wk19+vDlEL6GkBV7rbYgBaf4rUgbvvaEJlKz1wCFB/jLcz60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=vs5679kz; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c31:2dc0:c767:bd08:cc70:b57a])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9DCE5669;
	Tue, 29 Apr 2025 13:42:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1745926931;
	bh=AZ2eZQaNSO0yCaJCJF7YZMQJ3yiP1EQgrAq27CE+3bs=;
	h=From:Subject:Date:To:Cc:From;
	b=vs5679kzWwlXTQjwm0t3PP0k+sNKF0MlobQS8j/WP5SamnqE92G6/TJJJrRzOSaKD
	 qz/Q7wSes6oeUmgWbcfFzOWL9+rXMf9QRoTOPwz3qOQ9QI46dthTT0ZNWSJu02h/EY
	 s+7vv5Q6VULBKFu15SAmrhpXHEyXwum2TV1+3YN4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Subject: [PATCH v5 0/2] media: rockchip: rkisp1: Add support for WDR and
 AWB64
Date: Tue, 29 Apr 2025 17:11:52 +0530
Message-Id: <20250429-awb64-v5-0-2dc3163a8cfc@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAC7EGgC/3XMwU7DMAzG8VeZcibIdu1m5cR7TByS1mE50EwJK
 kNT351sUpmE2PGz/PtfTNWStJqX3cUUXVJNeW5DnnZmPPr5XW2a2jYExEgdWP8VerZuIAcw7BV
 FTfs9FY3pfOsc3to+pvqZy/ctu+D1+rewoEVLLoBqL1EEX9OkvuY5ZF+m5zF/mGtooQ0LIP5ia
 hgwuBjYIffyAHd3TCQb7mzrRBoCEqDy/gHmO2bkDXPDIXr1Av0YJvgHr+v6A/IMClZYAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2602;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=AZ2eZQaNSO0yCaJCJF7YZMQJ3yiP1EQgrAq27CE+3bs=;
 b=owEBbQKS/ZANAwAIAUPekfkkmnFFAcsmYgBoELsTxQIT+DLzaFo7pNmFfkrO1SlM1rs5Gzm65
 e0PQH3xivKJAjMEAAEIAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCaBC7EwAKCRBD3pH5JJpx
 RZSFEAC4Y9wFnZTWtjTeeGVI+ve4I/72zodwegFHDyzcxqnS/CUg8KIcE6U1F6n8BCsrGEds4RW
 Dioiv3/1cYZ1VebIWBhDlHsaquPRLQMbeIxOwd5+9oixJIvZ7UJfqrZxEVTm7ANxcF+QISdIlF8
 WNxSqQtUl48LczfSxTe/Pp0XWwHBWgpSPGi5MAXG3UClu3S1KohuO+G4+K48QY1UNsUUHHV3hhw
 Zkd8ejy3ex7JKIo8IJyxGsgLNP+lRen5idFgBK25o9+te1sbpDT2hMeUZSQDg37dznTKxoek4jP
 AOfdjqBv4JOcytGpfIhyrNfcdxHyltq4gpAnrkrBBpCuQwIc3A9SELVAo3ilK5Kz5zSqbE+s/FX
 Yx/6byzYWrxT4kJ4IQwVvvrhsmCnd7Vec9qxo1hoYXwMr+RqFoimgn78qwvo8YhrtvxwObK8dUV
 OK02Ks+MfKjA66qkAm4fGPfWuChi1uCr8xYnfgQk758Hg0B4xCgBPNWzrDYL/AkdMT3k1MkJitw
 k6W5WiTxDPzVCihFqVG6QseCOLhc3esmahUr/G/IOtEiBX/BDhzTEggUZ60biHyLCQb9yv/Z4aA
 GDw1Lw8lIWZTKvQdbZL6pCHq1Sil8dngoAHpiYkB76EYm4Oq3EC34ZVe7YdYglOPEz7VpL+1AeZ
 FPCh2ipd7uH0Qhg==
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
Changes in v5:
- Ensure WDR_USE_IREF is unset before reading params from user
- Fix spacing and alignment issues in WDR patch
- Drop reset value information from doxygen comments for WDR tone curve
- Link to v4: https://lore.kernel.org/r/20250414-awb64-v4-0-bfaea506cbd0@ideasonboard.com

Changes in v4:
- Rebase on v6.15-rc1
- Address Laurent's review comments on WDR patch
- Link to v3: https://lore.kernel.org/r/20250225-awb64-v3-0-af29b1201e48@ideasonboard.com

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
 .../media/platform/rockchip/rkisp1/rkisp1-params.c | 216 +++++++++++++++++++++
 .../media/platform/rockchip/rkisp1/rkisp1-regs.h   | 140 +++++++------
 .../media/platform/rockchip/rkisp1/rkisp1-stats.c  |  40 ++++
 include/uapi/linux/rkisp1-config.h                 | 199 +++++++++++++++++++
 6 files changed, 525 insertions(+), 75 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20241230-awb64-79270098e15e

Best regards,
-- 
Jai Luthra <jai.luthra@ideasonboard.com>


