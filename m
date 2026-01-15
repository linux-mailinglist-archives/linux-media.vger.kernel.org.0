Return-Path: <linux-media+bounces-50760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id CE5C6D23D34
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 11:08:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 24F9A3034181
	for <lists+linux-media@lfdr.de>; Thu, 15 Jan 2026 10:08:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96B7235EDA3;
	Thu, 15 Jan 2026 10:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="kcunv/DP"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 415C430E828;
	Thu, 15 Jan 2026 10:08:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768471729; cv=none; b=Qes6YiNDzCZfe4PVLzhaF/G/oByYREuSMCNpcuNcmQfmagKJWm+vtHhIBOnUknwV8MmrM70U0rKM5NhH41jziYKvpVnjztAV91LZs/mzllk7nhzeWc0I3uR6axvtr9vGrA/S9ao3us0F9dDj0gX4MXBbcrg2FqMz8AqCBU3Yyik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768471729; c=relaxed/simple;
	bh=pCIzyL3oA76wFJbJcD009d7AVGVAJy+49lpfc/4WxBs=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=DKsioVyn97kRfmu2ouY98Q7GjFMc4HA+z2jrhR5SiuJBkxUbHSf8WrHm7325hKt5nNIV4JwsMkdcSdkoL051b/cLUgxJgpnebppQmCZ0OuYpwV/b2dQgIO43KRNoYVwbEDpQP4U+xeYoa9HzXFaFi/PAJ/ClD6F092gcnZDOuqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=kcunv/DP; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from [127.0.1.1] (91-158-153-178.elisa-laajakaista.fi [91.158.153.178])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B34634E1;
	Thu, 15 Jan 2026 11:08:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1768471697;
	bh=pCIzyL3oA76wFJbJcD009d7AVGVAJy+49lpfc/4WxBs=;
	h=From:Subject:Date:To:Cc:From;
	b=kcunv/DPPbAf1HXIybNFopBfEzLTj2C+t1LlaDkn+LNNJQQMEtAQrnGQI6fXigwfe
	 ZyoMItjXOm9aVhWUAaAROaZQxs1dTeRJY5k3cfNS3jqAZxWaG+DnSEtb3/Ly8u1Q7/
	 A4BEsJeWCntmX23wWNFbLB1RKEbFed9iRQxSrCIw=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Subject: [PATCH 0/5] media: rcar: Streams support preparation
Date: Thu, 15 Jan 2026 12:06:56 +0200
Message-Id: <20260115-rcar-streams-prep-1-v1-0-f87700926c11@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEG8aGkC/x2MSQqAMAwAvyI5GzDVSvEr4qHUqDm4kIgI4t8tH
 mdg5gFjFTboigeULzHZtwxUFpCWuM2MMmYGV7m2IvKoKSraqRxXw0P5QEJKyQXv6xCaALnMepL
 7v/bD+35NRVR9ZQAAAA==
X-Change-ID: 20260115-rcar-streams-prep-1-1cc285538848
To: =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1095;
 i=tomi.valkeinen+renesas@ideasonboard.com; h=from:subject:message-id;
 bh=pCIzyL3oA76wFJbJcD009d7AVGVAJy+49lpfc/4WxBs=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBpaLyk/PLy3Y3gIxQIy0Y51Jerj8r071+fdiRe7
 qen+7VsUO6JAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCaWi8pAAKCRD6PaqMvJYe
 9WWzD/0fz7CVRbdWIl8xB4aIoI8T2bmfZ72yqsWCqH/pNoqUnj9Ts3TY1vQUVefVXvqfD45ns6P
 H8zSqsMjr9hMYmeLzKGosKCQ6MiZXLYVSkKMfaz+ZqMr3G0SRnVAaomRQkt/6VTggmdVsTpJq06
 Wx8SWOQp3A+o4XZdMlNOvpFq+PfWSzZV2hyT91JJIcn3Iv8eOrBqWmsm/id95yYLqBF01+nrySw
 VxmdRbZ5UY4nyw8UWjgLfQVtXn/kXQqV+SZLmY5qpMyNKZPgxGazwsj3LoPXHk2h0ZQ94/s7mEw
 X7S5YQw02U61mwuRvKBTS8j6RDUqwJ8wSaDl9F3RD1AFtN1rDPwFYhaHAki04SbMUmPrwm+R5vb
 pkwSsMRxvSkGZHCQjc96CHtfVa7cPPMSRbLh9v75RWY5agY6Gyrs7EyZCiPYviBxNtIOmzympGa
 k4/q+rSGAVpCaI2Ay75plg0l7iQTw/0GTqmYq4MfLpKJbTgEdhrt9t1BJgUYlhXOd22C3agpwuJ
 d2Yy9E9pXqN5eOsJeSBxsO+3/RKsCvHUre791n7761MSPfzdV/qzGmHvdxwYA1/JS4/tiIChtE/
 s7BNyhBxJtANXwAfpeqmY//csxDD4KzLrniEqx4wF0AhtpQ/R8WBRZYx3WOvDGHlLqOjgM3w497
 /ZOv+u7CbzybZqA==
X-Developer-Key: i=tomi.valkeinen+renesas@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5

This series is a subset of the Renesas streams series, sent as a
separate series per Niklas' request:

https://lore.kernel.org/all/20251216-rcar-streams-v4-0-f28b4831cc67%40ideasonboard.com/

This subset contains the (hopefully) easy ones that can be merged
already.

These patches should not change the driver's behavior.

 Tomi

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
---
Tomi Valkeinen (5):
      media: rcar-isp: Improve ISPPROCMODE_DT_PROC_MODE_VC
      media: rcar-csi2: Improve FLD_FLD_EN macros
      media: rcar-csi2: Move rcsi2_calc_mbps()
      media: rcar-csi2: Simplify rcsi2_calc_mbps()
      media: rcar-csi2: Optimize rcsi2_calc_mbps()

 drivers/media/platform/renesas/rcar-csi2.c      | 116 +++++++++++++-----------
 drivers/media/platform/renesas/rcar-isp/csisp.c |  13 +--
 2 files changed, 67 insertions(+), 62 deletions(-)
---
base-commit: 7d0a66e4bb9081d75c82ec4957c50034cb0ea449
change-id: 20260115-rcar-streams-prep-1-1cc285538848

Best regards,
-- 
Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>


