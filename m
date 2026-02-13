Return-Path: <linux-media+bounces-52684-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CGStNjKzjmmvDwEAu9opvQ
	(envelope-from <linux-media+bounces-52684-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:14:26 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D2E132F59
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 06:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 7BBDB30D24C5
	for <lists+linux-media@lfdr.de>; Fri, 13 Feb 2026 05:13:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63310275AE4;
	Fri, 13 Feb 2026 05:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0T56e58"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08D72417D9;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770959588; cv=none; b=gT2OS87S+ajemuOsGKkNrMqKZgdKAFCkCicMQPZjPU7f0MJjq+LaSivH0Wn/4jqH+knkw6+JXwGCerAxxMsqw8/pMob050l7XA0/xsfnvvUeyWtWvTM1zo9e/6IEA0SBklg5HDFlZhr3//zVNn4ejWeSeEcDqfF7/3Xm7Q7ABEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770959588; c=relaxed/simple;
	bh=Hqko3B+eU60qX6t1+qYYKZ1HEXCgSYoKp0YMBxJzQx0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wpc4QWy4Rn/jHulLrEbj8dNme3BbC6GegahAEzljkLh1aD3+tfIt2xvCKZDzFtyi1Jup/VFf2qPG9guA9G2R5VSh+Py1cwgZRuEox6eEUiX6JZof2n+849o3BYLh316lGeIjTfgOVTyy0zuHXWpQ84SKIZlFt23urA6+LXjnhac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0T56e58; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 831E0C2BCB0;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770959588;
	bh=Hqko3B+eU60qX6t1+qYYKZ1HEXCgSYoKp0YMBxJzQx0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=s0T56e58NSdt73zPF4GUKvSOp/jUHfHa4cLzYqFZTNhOuu9kmX/izGfQ1AUMd+Dih
	 1MJMQI3NBzgMB4+9wT+1RVAGoYqakEezM/8UkbaWPAq8oqM1o9QQQXNlZpPan0nn7s
	 tWZh7Sq/4nFaVSnmgV3bAR9VE32UzMZLbTW9splBANcGrfy44SMrRuO1PRbOPXP5KL
	 qr72YEpiA1ZX2VOZk996vjTFf9547w3V24jUvVDfj1ahuHUhAdIxOZ0Kx4CG69ZTlm
	 Zsawo2WStCJzvlJjqCBFO5j8ipDOsSXLzDl4gCVhojCRGQkaXJyq7N5rGAwPyxIc5r
	 GtMt4o972gyhQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 795A5EF48CC;
	Fri, 13 Feb 2026 05:13:08 +0000 (UTC)
From: Zhentao Guo via B4 Relay <devnull+zhentao.guo.amlogic.com@kernel.org>
Date: Fri, 13 Feb 2026 13:12:41 +0800
Subject: [PATCH RFC v4 4/4] arm64: defconfig: Enable VDEC driver for
 Amlogic SoCs
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-b4-s4-vdec-upstream-v4-4-c7112d00d662@amlogic.com>
References: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
In-Reply-To: <20260213-b4-s4-vdec-upstream-v4-0-c7112d00d662@amlogic.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, Zhentao Guo <zhentao.guo@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770959584; l=650;
 i=zhentao.guo@amlogic.com; s=20251024; h=from:subject:message-id;
 bh=tZYyYrW/TB9dy7rEz6q886OC4BRJpy/nB4/purIpLWE=;
 b=ZiWA6cHH1VfHqOEpB6uGKoAT/cyVYPEBcCIgtwhKNvMtBLfnHI+UY5CjYQmtq3wPOhW3+4v0O
 VOnGidHAtxxCZWyjQMvfmLuQ1YDAe8OuJ1wZjbq3cSZ3KJTvQ4dCAop
X-Developer-Key: i=zhentao.guo@amlogic.com; a=ed25519;
 pk=5yfDKrjreXwcAoEUsdtWafy6YN500upXp/CgtnXjLVU=
X-Endpoint-Received: by B4 Relay for zhentao.guo@amlogic.com/20251024 with
 auth_id=555
X-Original-From: Zhentao Guo <zhentao.guo@amlogic.com>
Reply-To: zhentao.guo@amlogic.com
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52684-lists,linux-media=lfdr.de,zhentao.guo.amlogic.com];
	FREEMAIL_TO(0.00)[kernel.org,linaro.org,baylibre.com,googlemail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	HAS_REPLYTO(0.00)[zhentao.guo@amlogic.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amlogic.com:mid,amlogic.com:email,amlogic.com:replyto,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 37D2E132F59
X-Rspamd-Action: no action

From: Zhentao Guo <zhentao.guo@amlogic.com>

Enable the driver for Amlogic's stateless decoder.

Signed-off-by: Zhentao Guo <zhentao.guo@amlogic.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index b67d5b1fc45b..9c1dc377d519 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -905,6 +905,7 @@ CONFIG_USB_VIDEO_CLASS=m
 CONFIG_V4L_PLATFORM_DRIVERS=y
 CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
+CONFIG_VIDEO_AMLOGIC_VDEC=m
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m

-- 
2.42.0



