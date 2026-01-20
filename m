Return-Path: <linux-media+bounces-51119-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8PpvHbN4cGktYAAAu9opvQ
	(envelope-from <linux-media+bounces-51119-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 07:56:51 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2FD5272D
	for <lists+linux-media@lfdr.de>; Wed, 21 Jan 2026 07:56:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 98EC166B6CF
	for <lists+linux-media@lfdr.de>; Tue, 20 Jan 2026 12:23:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBC58428461;
	Tue, 20 Jan 2026 12:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrapHvxu"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25C7F42316D;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768911752; cv=none; b=Rg9ZWwe/zVTv+vLnAclQjTfzaBRU5g85I7I0v1VQPs8qDifKKztjHFxpA4vLE68UrqfqZeVtgR0kKteYIQR4rBpE9ko/jT69kcD4Xq8OBCPcvseh3b/11XHhx4qmVZMSiPzRFL4GiSDBpbmayoj9K/j3OQvowuFXLK4tdpIKUh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768911752; c=relaxed/simple;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EmsSvp5MbZT+wNCQUK5cNhGOZEaMk0YYnfZCrS/YaqVdNmdXJkxJYw/HaNEts8CkU+7CBMLPYcDxPsPz5XQhpIPOcPxwwSi/ltLQsU+/Pl/xRIqoWc1v+sjDcneV5llXjO3318SRKWQtK9SFvNKlSMvq4sZVRfR7eHZoP6YDg1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrapHvxu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1ECFC2BCB5;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768911751;
	bh=SBMojAQMLBEsq97VBBgUN3ogr+3rX2KzJ0Dl48KhAsI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=WrapHvxu9wzC6dPh+d2Diu33um8C+StFfh5MJrVUMKJHx0sZtchoh7hfLoDgGjpa1
	 8mHz2LgITw35uFF7Ajq6uP27pqoxElgAAHpZyiHmP5GZ8u74C5U3+C5GjPgBeH+JmN
	 k7SXgBg5+1M5NZ9dJd8P459Z+A1MXkdTMNJNCB2+8VsHd6/sOgqn+79rOt68u5Yg0B
	 RNUjI1vhFCtXtDAhuRl8s/ri2VknucbJ7q+2tOAunD2MF2N3iLtEzMRpCG6NiXVxF7
	 xz/o776+HawJM+cXWt12eAExfMmwB0lJbJDMxWLgsq4R/0xuplyQ7VOkY8gl4BjOuf
	 Lpu/CqdwuH3NQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB0AD2ED15;
	Tue, 20 Jan 2026 12:22:31 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 20 Jan 2026 13:22:29 +0100
Subject: [PATCH v8 3/3] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-rockchip-mipi-receiver-v8-3-bd1cf5cb9588@collabora.com>
References: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
In-Reply-To: <20251114-rockchip-mipi-receiver-v8-0-bd1cf5cb9588@collabora.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Chaoyi Chen <chaoyi.chen@rock-chips.com>, 
 Kever Yang <kever.yang@rock-chips.com>, Frank Li <Frank.li@nxp.com>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768911749; l=786;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=4/e4J7LessS5jdywMTVpeb4iDs9BMTFRupZRi4shvqg=;
 b=vM+9GvcUuupfbEtXCVYeCqoIhDdyKGXeBgK5EHF4Y7GG0wfQPK5IhDW3ee+Q8DGNb9+HqRDbd
 cXR5vbU9VxTCsLddpvbjSWg4A95nbSX+dQKQNM2sHkwQtLb5lkuN4Pw
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [0.54 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-51119-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DMARC_POLICY_ALLOW(0.00)[kernel.org,quarantine];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 2D2FD5272D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into
recent Rockchip SoCs, such as the RK3568 and the RK3588.
Enable the driver for it in the default configuration.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 45288ec9eaf7..58bda738819a 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -873,6 +873,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.39.5



