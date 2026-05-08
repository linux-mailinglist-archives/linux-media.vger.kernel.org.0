Return-Path: <linux-media+bounces-60970-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qNwvFIE6/mkroAAAu9opvQ
	(envelope-from <linux-media+bounces-60970-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:33:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F884FB26D
	for <lists+linux-media@lfdr.de>; Fri, 08 May 2026 21:33:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E44BF304B2F4
	for <lists+linux-media@lfdr.de>; Fri,  8 May 2026 19:32:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380AA426691;
	Fri,  8 May 2026 19:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gTIXPTTf"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029DD41C2F7;
	Fri,  8 May 2026 19:31:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778268719; cv=none; b=rJQIyShw6/Is3UFwKWEhkOUll48NrFNoN6sm3Q8RJMjq7kZFxYUMYny08TNms4UcfZyOISabDan07GV2pesTFQj/PkyIaY3WStoBI9+nOLe4NdVoGghRbC4HrkOfF6dKukS1bUvCIz6tXYxQLr6V7hwM3Jl8d5FHRFzy05z6tM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778268719; c=relaxed/simple;
	bh=HY6HXz1rUxunVE83orvuh0gY4psjWh1saEXwMh/vrh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tj35hnNKVx9BYGGiB+4erGJYzmR/FQPESEkTnXynYztsqemysTJ6hzKzIEO7A1sXheax5KWQ/+EYJ0uZritASj7bzE0UA2Q7FPh7F1UW0VyLtztLkwUEB4AH2jg4sbrud7shaB8wWFcJvsHS/Y1xlP21GIAwDfa6SwOkI4RzFUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gTIXPTTf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC3D5C2BCF4;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778268718;
	bh=HY6HXz1rUxunVE83orvuh0gY4psjWh1saEXwMh/vrh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gTIXPTTf7+HzIc+xzZtuC8AK6Sp634SwkNyF8REqW9AjlSnZ7IMKD+90+3b4Ohtqt
	 lFqbHK+PUOFqvQ395xgco3zPhMr9/oQ+Vr7PIaJ06/t5eMGJH/zFcuI+YWv9oXffD+
	 UgKzovQnBzmNqbp9JeN93r8gU5m3HWKOVHBg+QNlJeqC7ni9L+asiXLfwz3ckdoPb6
	 Q8Rf70+oddf9RawwSg+UVYQO+0vPUT8YCoRGbOCAi5Q3UuflzsBiYuM6PDAFCKTsIz
	 bNcEGp69T/E94G/9gKAO76IpppNvO2NEDxbQJxwJgzBjumdQIm5ZBnGWWLevAcTIZW
	 4rQp2L/GSsdMw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D31ACCD342F;
	Fri,  8 May 2026 19:31:58 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 08 May 2026 21:31:51 +0200
Subject: [PATCH v4 8/8] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260508-rk3588-vicap-v4-8-6a6cd6f7c90b@collabora.com>
References: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
In-Reply-To: <20260508-rk3588-vicap-v4-0-6a6cd6f7c90b@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Charalampos Mitrodimas <charmitro@posteo.net>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778268716; l=1048;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=a8sioWJftfSyXN0rqDXq8bBppSiXX8eZImBE70llAi8=;
 b=k+9b89ylohfx4XhLo13ZZ8+1xS+5spcQu5ypNg2QKU4QuObf5FXVwZudj+nb4bW5JLkDETZsV
 E6/bPi+jYKaBNXJiVjojvUp0VQTHopdEZ5A9spZGsuw0nW8j9CBO/w8
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Rspamd-Queue-Id: E0F884FB26D
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-60970-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com]
X-Rspamd-Action: no action

From: Michael Riesch <michael.riesch@collabora.com>

The Synopsys DesignWare MIPI CSI-2 Receiver is integrated into recent
Rockchip SoCs, such as the RK3568 and the RK3588. As a consequence, they
are used on a lot of Rockchip-based single board computers and/or
corresponding camera modules, such as the Radxa Camera 4K. Enable the
driver for it in the default configuration.

Reviewed-by: Mehdi Djait <mehdi.djait@linux.intel.com>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index d905a0777f939c51cc39df6230591a31058b765f..9171f750337e540f0feec998c7aa33d3444b806e 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -918,6 +918,7 @@ CONFIG_SDR_PLATFORM_DRIVERS=y
 CONFIG_V4L_MEM2MEM_DRIVERS=y
 CONFIG_VIDEO_AMPHION_VPU=m
 CONFIG_VIDEO_CADENCE_CSI2RX=m
+CONFIG_VIDEO_DW_MIPI_CSI2RX=m
 CONFIG_VIDEO_MEDIATEK_JPEG=m
 CONFIG_VIDEO_MEDIATEK_VCODEC=m
 CONFIG_VIDEO_WAVE_VPU=m

-- 
2.47.3



