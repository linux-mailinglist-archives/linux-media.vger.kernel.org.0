Return-Path: <linux-media+bounces-59549-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8OybHYKv62mRQQAAu9opvQ
	(envelope-from <linux-media+bounces-59549-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:59:30 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 797C64622DA
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 19:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A79B9300860F
	for <lists+linux-media@lfdr.de>; Fri, 24 Apr 2026 17:59:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEA91277C81;
	Fri, 24 Apr 2026 17:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="KhQwLhzX"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71BAB3E7140;
	Fri, 24 Apr 2026 17:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777053560; cv=none; b=h+ZiJ6mDOPum8wvMwSvW22UvkxTw8mqqnab1BGET06noOjEcn5lOs29YPizZSfFnDOZ+pfAfgrD4acwSTf/gMtqCLiTnpPFMOwVlOOk9bMe7uaYSIoOALUzqDiWWbecBHJBB0kOSpp6N1fPZ4UDdiKACh5o7D3ZVWZbX7o3c+kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777053560; c=relaxed/simple;
	bh=h5osORYQIcyPv6dVH/ARjSRhhP9JToHyEu3nT5rlBk0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QQwdPfYC167z9JOffp5rMedYAyprG8SaDI4PnnEALcySmaYwrR/sniCE1cZ56cypg6rtgY7tzWIhI3NlyquOneZ2uYAvomHgk1orrVAGUbpJdiWco2Ujydj15aNLtUkOfOCMgpT74FrC4oiX8WAdbx95tgYRvvzC9CjCd15QSlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=KhQwLhzX; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from neptunite.hamster-moth.ts.net (unknown [IPv6:2404:7a81:160:2100:5216:c7b6:205:5f59])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 285E5103F;
	Fri, 24 Apr 2026 19:57:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1777053456;
	bh=h5osORYQIcyPv6dVH/ARjSRhhP9JToHyEu3nT5rlBk0=;
	h=From:To:Cc:Subject:Date:From;
	b=KhQwLhzXPaYptJaIv+/qz3T0c6tAsMlmel4yHcrbu1yryp5RZY1KFHeOxAwPX7unF
	 Xr02Q1trChFFWXM1W6KLjtf3USySZsrIWZh0RkuZygx5AUuqbOAjo9TW+0mQJ2Tqbj
	 s2v0cu6gFtvwGCf7r5YjdIEh9w6baGhYzkwl1HrQ=
From: Paul Elder <paul.elder@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: Paul Elder <paul.elder@ideasonboard.com>,
	michael.riesch@collabora.com,
	xuhf@rock-chips.com,
	stefan.klug@ideasonboard.com,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/5] media: rockchip: rkisp2: Add driver for ISP on Rk3588
Date: Sat, 25 Apr 2026 02:58:45 +0900
Message-ID: <20260424175853.638202-1-paul.elder@ideasonboard.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 797C64622DA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ideasonboard.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[ideasonboard.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-59549-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ideasonboard.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[paul.elder@ideasonboard.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[]

Hello everyone!

This patch series adds a new rkisp2 driver that aims to support all
Rockchip 2.x and 3.x series ISPs. Here we add support for the version on
the RK3588, which as far as I'm aware is a 3.0.

Patches 1 and 2 add dt bindings and dt nodes; patches 3~5 add the actual
driver.

All my discussion points/questions/progress-reports are in patch 3.

The following two series [0] [1] will be helpful for testing the code,
as they enable the VICAP module to work on the RK3588. I've tested this
on the Orange Pi CM5 Base with an imx219. I have a branch here [2] for
convenience. A libcamera branch will be coming soon too!

[0] https://lore.kernel.org/all/20260216-rkcif-fixes-v2-0-ee40931fe0ff@collabora.com/
[1] https://lore.kernel.org/all/20250430-rk3588-vicap-v3-0-e38e428868cc@collabora.com/
[2] https://git.ideasonboard.com/epaul/linux/src/branch/epaul/v7.0/rk3588/rkisp2/upstream

Paul Elder (3):
  media: dt-bindings: Add rockchip rkisp2 bindings
  media: rkisp2: Add parameters output video node
  media: rkisp2: Add statistics capture video node

Xu Hongfei (2):
  arm64: dts: rockchip: add ISP nodes to rk3588
  media: rockchip: rkisp2: Add rkisp2 driver

 .../bindings/media/rockchip-isp2.yaml         |  127 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi |   60 +
 drivers/media/platform/rockchip/Kconfig       |    1 +
 drivers/media/platform/rockchip/Makefile      |    1 +
 .../media/platform/rockchip/rkisp2/Kconfig    |   19 +
 .../media/platform/rockchip/rkisp2/Makefile   |   13 +
 .../platform/rockchip/rkisp2/rkisp2-capture.c | 1979 ++++++++++
 .../platform/rockchip/rkisp2/rkisp2-common.c  |  180 +
 .../platform/rockchip/rkisp2/rkisp2-common.h  |  565 +++
 .../platform/rockchip/rkisp2/rkisp2-debug.c   |  236 ++
 .../platform/rockchip/rkisp2/rkisp2-dev.c     |  376 ++
 .../platform/rockchip/rkisp2/rkisp2-dmarx.c   |  687 ++++
 .../platform/rockchip/rkisp2/rkisp2-isp.c     |  917 +++++
 .../platform/rockchip/rkisp2/rkisp2-params.c  | 1013 +++++
 .../rockchip/rkisp2/rkisp2-regs-v2x.h         | 2625 +++++++++++++
 .../rockchip/rkisp2/rkisp2-regs-v3x.h         | 3427 +++++++++++++++++
 .../platform/rockchip/rkisp2/rkisp2-regs.h    | 1736 +++++++++
 .../platform/rockchip/rkisp2/rkisp2-stats.c   |  482 +++
 drivers/media/v4l2-core/v4l2-ioctl.c          |    2 +
 include/uapi/linux/rkisp1-config.h            |    1 +
 include/uapi/linux/rkisp2-config.h            |  565 +++
 include/uapi/linux/videodev2.h                |    4 +
 22 files changed, 15016 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/rockchip-isp2.yaml
 create mode 100644 drivers/media/platform/rockchip/rkisp2/Kconfig
 create mode 100644 drivers/media/platform/rockchip/rkisp2/Makefile
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-capture.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-common.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-common.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-debug.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-dev.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-dmarx.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-isp.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-params.c
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v2x.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-regs-v3x.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-regs.h
 create mode 100644 drivers/media/platform/rockchip/rkisp2/rkisp2-stats.c
 create mode 100644 include/uapi/linux/rkisp2-config.h

-- 
2.47.2


