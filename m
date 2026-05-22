Return-Path: <linux-media+bounces-62651-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AMp+FgvKEGpAdwYAu9opvQ
	(envelope-from <linux-media+bounces-62651-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:26:35 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E7825BA6C2
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 23:26:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 51BBC3010713
	for <lists+linux-media@lfdr.de>; Fri, 22 May 2026 21:24:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5BEE391E54;
	Fri, 22 May 2026 21:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFPDQ332"
X-Original-To: linux-media@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E59B38AC92;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779484998; cv=none; b=slHyfLVzpOqFiFpu7ttQZiQIqNjszwA0XAsf/JH4a2Z2qn9Twcy3mSMiCTD/146kG9uBjRUpBFtWW28f8/2KWXi9rbYVCSMo3HdrYLwQiYu5iyF1/fDo6uahxHclWBNmRWw1u5uJQmP1X8LVULC6g4JWiGHalJ9gc3zGt7NtbKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779484998; c=relaxed/simple;
	bh=HY6HXz1rUxunVE83orvuh0gY4psjWh1saEXwMh/vrh4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DcQrm0Ln4CVjPlEztifDe3iu2zVn10D6Kl/c/QiM09drAgcmPalkgeX6CT3RCtyBgZQkOYHmP4etAct/Rzmu+0awrbCzaSKURrXS/EmKiKvbA6N91WWPaigV/QRnRKGB9Ro+uIG8V+bFWDjIT7Mqh6FIen2hQcCd7MNDWzyCv9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFPDQ332; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4416EC2BCC9;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779484997;
	bh=HY6HXz1rUxunVE83orvuh0gY4psjWh1saEXwMh/vrh4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=JFPDQ332VK/XtDPabk8fNoHSESgwzZjBUUbyotUVWAcuyiBQ/PkLAdB6o8c6Dhh6b
	 1xmR87vSarPT+2xab+Dt/O9wBPXT1RjeVWk1M8/Km00oqAI6RvbmMbHTuyIl7iZ/6Z
	 0FkqvRt00DNGKekWq5clt2+coo1jv8FmuNi2YJ5Tyc5m/aSDhEBnIbMqv1Qa//Rg5r
	 BEknQaodQd5i3xZGdBIQNJv1rVEnd008cQKebE74tDoYj/icNACTdZUHy9eyHbMMlo
	 DIEQGxxxjQKNqPuXq/kPQ37T0+xYhm8Cb8Mp4raJS+xAYaCdP2vaqoRdUYk08koCgu
	 q+tLKM4Ro6IyQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B029CD4F3D;
	Fri, 22 May 2026 21:23:17 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 22 May 2026 23:23:14 +0200
Subject: [PATCH v5 8/8] arm64: defconfig: enable designware mipi csi-2
 receiver
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-rk3588-vicap-v5-8-d1d1f5265c56@collabora.com>
References: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
In-Reply-To: <20260522-rk3588-vicap-v5-0-d1d1f5265c56@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779484994; l=1048;
 i=michael.riesch@collabora.com; s=20260428; h=from:subject:message-id;
 bh=a8sioWJftfSyXN0rqDXq8bBppSiXX8eZImBE70llAi8=;
 b=IqmzJqKJkEHjtsNbaC/h3Bc2jLgWi0PGoQF+I307c9pB+aqLWY0c76oUHf57BbpVC+xz2Wtsh
 bNMI9SKvxgcD9ja101x3XnKmRLP60yM7U5tQL+Aq5v7j30/QtXQDhrT
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=tAbmpPTE1MELYweXqqDU40fa18uCO6s32GJL/RzyW2Y=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20260428
 with auth_id=759
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
Reply-To: michael.riesch@collabora.com
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-62651-lists,linux-media=lfdr.de,michael.riesch.collabora.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[linux.intel.com,ideasonboard.com,kernel.org,sntech.de,rock-chips.com,amarulasolutions.com,gmail.com,posteo.net,collabora.com];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-media@vger.kernel.org];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	HAS_REPLYTO(0.00)[michael.riesch@collabora.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,collabora.com:replyto,collabora.com:mid,collabora.com:email]
X-Rspamd-Queue-Id: 7E7825BA6C2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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



