Return-Path: <linux-media+bounces-62763-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KMejAxtdFWp7UgcAu9opvQ
	(envelope-from <linux-media+bounces-62763-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:43:07 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1175D2960
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 10:43:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44984304B2AD
	for <lists+linux-media@lfdr.de>; Tue, 26 May 2026 08:40:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C439A3CFF50;
	Tue, 26 May 2026 08:40:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JH2RhQkO"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68D9C3CC7F1;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779784832; cv=none; b=kEBeOp3xdmj7LilncV3b7fpxqip1sioumfqns46+WTugmDDtsZN18FvtNRtBISO84RUiMWN88Cj88odEO5vIx9SabV1i+FqIZc1tCus2XtGWZ7uek8kOmCP1i5uB+FoDnqxtngK1TQOafoPn/Eq2BXZdxQdxrS32SVsMGyqdxQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779784832; c=relaxed/simple;
	bh=AyN+JuzMyo4kB6MKCoa08QrCLJ+c+BCADd1S66NVbZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lEYaUZzVrXXyo8KjBwki6aVy1VR8u8mdLgp15UrIq7i45h2PV3nS2nBlevCH1FrDxAITZqFI4W0cW64tE0d7q8W2MjZl/AVV4S6HLHiojX0oEo+ADUYlhN3eiwDLnKxmVddFwKq68Kr5HI1FwiA5f4l7V/NGpB3ApvY9nSZ460Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JH2RhQkO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3F5D1C2BCF7;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779784832;
	bh=AyN+JuzMyo4kB6MKCoa08QrCLJ+c+BCADd1S66NVbZg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JH2RhQkOkx9sbOq4D+6ZIvA0Iem4yAmoKEyGz22nesCG8ICcVMNEPW3/LwLpWIAqF
	 rUWk2heknduk6fLwbDY/92j3UNG9VcMkE3d0YawT0jsvIP60/OxMiUX0e2BkBEKjk+
	 mHxkS0xYrjcLCzwry6GRxnMygx7Rcxw3RsrBd3R22qz2Egys2IESJl1+QPceRgrEPS
	 5tEdMx55WfWMWEeClck6LCzWDEXIrgK4MvlGp/OThS6MeHi/WIP3a1A+0wPBY7lXdK
	 I/mpRR2LVHjTZnZ0zuMCxe63gI7Csq03o78Jihknf9FGSP1zvMIcO6dYBknNC/gVbi
	 9ue/NxirjQT1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38166CD5BDF;
	Tue, 26 May 2026 08:40:32 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Tue, 26 May 2026 16:40:22 +0800
Subject: [PATCH RFC RESEND v5 6/6] arm64: defconfig: Enable
 CONFIG_VIDEO_AMLOGIC_VDEC
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-b4-s4-vdec-upstream-v5-6-33bc817f93f4@amlogic.com>
References: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
In-Reply-To: <20260526-b4-s4-vdec-upstream-v5-0-33bc817f93f4@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779784828; l=768;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=zpeG8QZ2+jvMHE/2NSqDBdO1rAoUz1HvG8dAn1hwiLI=;
 b=krqDTA/5rT0vhS8B/EHNhikzh4IiLOjfvt0RTIoz1G3q3G12csZ9iasBWch2hcCkHY1n+blkn
 wcWzE9zHvFCDxth6NYuj0qgqsQVBa5KPQ+g6HhJpEnbBKQhJWfSuQW7
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62763-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linaro.org,baylibre.com,googlemail.com,kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com]
X-Rspamd-Queue-Id: 5C1175D2960
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the Amlogic V4L2 stateless video decoder driver as a module
in the arm64 defconfig. This driver is needed for stateless video
decoding support on Amlogic SoCs.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 4567f4b34f29..14caac24d200 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -913,6 +913,7 @@ CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_WAVE_VPU=m
 CONFIG_VIDEO_E5010_JPEG_ENC=m

-- 
2.42.0



