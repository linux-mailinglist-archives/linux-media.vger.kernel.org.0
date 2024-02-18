Return-Path: <linux-media+bounces-5383-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id F03D785994A
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 21:43:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC7382817C1
	for <lists+linux-media@lfdr.de>; Sun, 18 Feb 2024 20:43:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC7F71B4F;
	Sun, 18 Feb 2024 20:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="fAcYKFbZ"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AAF26BFC5;
	Sun, 18 Feb 2024 20:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708289031; cv=none; b=GMaD28TK5xBsERfY5HWIR4S3xBYnCtlm7xRuGOHgUuDlFbEWVlCLGi8Qkl3mAgcF/IP+A83lJZdKO91ZS8r1jOnM9dZgQBGuYLnj2JN4jp0fFk2H4J7zegAfKSsvd5F69zox/0d3Jod/FCyAosv7tSMbMXdR5snWVA7hxQH5YDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708289031; c=relaxed/simple;
	bh=PWkeVUUpTQ/DoFtZiJ9jtqyC24tDanuBmFzxU2p+Gg4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N5rzbhBxG9pyOezU5HIGZkrLw6FH6UeXJMix8KTehY78BmHscheGn1qmXiflezJEdXDh0IasWfnjnPXOskFj44WnfKvOvDAhtEIsTVxebhvWoierXQG4c8BKKzDeRhfb+mqtPPWS5PagGG1plxS3eT0jtZFKsgMl2AX8sTY/b4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=fAcYKFbZ; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B3CD8480;
	Sun, 18 Feb 2024 21:43:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1708289020;
	bh=PWkeVUUpTQ/DoFtZiJ9jtqyC24tDanuBmFzxU2p+Gg4=;
	h=From:To:Cc:Subject:Date:From;
	b=fAcYKFbZbVUZ1zJbCS6tX+6sUmO+jPLisKO/M42Zt0B7h1TUck1pfofa4QerYStWt
	 oLQ41Qs/iLU+uV+XguL7V9dMKU/H9EZ26Pq/o2uyr/Z/gy2Uys20Y36208SUqIBpjY
	 0+hZouQRybeWFeMWcH7ibcXgNSIa2sS9XMKEgmXw=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Adam Ford <aford173@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Helen Koike <helen.koike@collabora.com>,
	Kieran Bingham <kieran.bingham@ideasonboard.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Rob Herring <robh+dt@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	devicetree@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v13 00/12] media: rkisp1: Add support for i.MX8MP
Date: Sun, 18 Feb 2024 22:43:38 +0200
Message-ID: <20240218204350.10916-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This series extends the rkisp1 driver to support the ISP found in the
NXP i.MX8MP SoC.

The ISP IP cores in the Rockchip RK3399 (known as the "Rockchip ISP1")
and in the NXP i.MX8MP have the same origin, and have slightly diverged
over time as they are now independently developed (afaik) by Rockchip
and VeriSilicon. The latter is marketed under the name "ISP8000Nano",
and is close enough to the RK3399 ISP that it can easily be supported by
the same driver.

This version of the series specifically has been tested on a Polyhex
Debix model A with an IMX219 camera sensor (Raspberry Pi cam v2).

See individual patches for a detailed description of changes compared to
v12.

This should hopefully be the last version, I plan to send a pull request
in a few days, in time for v6.9.

Laurent Pinchart (2):
  media: rkisp1: Add and use rkisp1_has_feature() macro
  media: rkisp1: Configure gasket on i.MX8MP

Paul Elder (10):
  media: rkisp1: Support setting memory stride for main path
  media: rkisp1: Support devices lacking self path
  media: rkisp1: Support devices lacking dual crop
  dt-bindings: media: rkisp1: Add i.MX8MP ISP to compatible
  media: rkisp1: Add version enum for i.MX8MP ISP
  media: rkisp1: Support i.MX8MP's 34-bit DMA
  media: rkisp1: Add YC swap capability
  media: rkisp1: Add UYVY as an output format
  media: rkisp1: Fix endianness on raw streams on i.MX8MP
  media: rkisp1: Add match data for i.MX8MP ISP

 .../bindings/media/rockchip-isp1.yaml         |  37 +++-
 .../platform/rockchip/rkisp1/rkisp1-capture.c | 180 ++++++++++++++----
 .../platform/rockchip/rkisp1/rkisp1-common.h  |  35 +++-
 .../platform/rockchip/rkisp1/rkisp1-dev.c     |  71 ++++++-
 .../platform/rockchip/rkisp1/rkisp1-isp.c     | 131 ++++++++++++-
 .../platform/rockchip/rkisp1/rkisp1-regs.h    |  35 ++++
 .../platform/rockchip/rkisp1/rkisp1-resizer.c |  19 +-
 include/uapi/linux/rkisp1-config.h            |  50 ++---
 8 files changed, 472 insertions(+), 86 deletions(-)


base-commit: e0b8eb0f6d652981bfd9ba7c619c9d81ed087ad0
-- 
Regards,

Laurent Pinchart


