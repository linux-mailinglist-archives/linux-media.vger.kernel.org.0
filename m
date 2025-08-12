Return-Path: <linux-media+bounces-39707-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A09B23B3E
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 23:52:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C018E189832F
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 21:51:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77F8E2E9EBC;
	Tue, 12 Aug 2025 21:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="MkycFtPF"
X-Original-To: linux-media@vger.kernel.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85BB22E9731;
	Tue, 12 Aug 2025 21:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.167.242.64
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755035320; cv=none; b=a5qLrr3zz4qdXTmH/p025rv3+c3ZMYJoOfc66gouV73gd/hfA0ug/7CWxn3d0hDlYJCkr6ragcmBMadQUOyijnhdPWFMqAC84bbg78DyasOglEXBI36NbV1iuthu2s2Qf4egeAnaTrIRWOolV//6bqVkNOaigkcIpYV6WKYA1A0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755035320; c=relaxed/simple;
	bh=mDC1qaAWKXxn4GhY81d6CYkLb80ty3O7EgFsFZJdbNM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dmpAwOqGeuu3/knTnHGSZPdQia+vu6r1YZdZvwldZ8Er7/A5qRv/GpunO7lrR13D7Rwr2FPm9Cg72H6O+3GsaO1fpm6sKkI5n5p9i5jbOSiTE3DisvRri38piddTuRYkU/wdWLbRxgaM9nw67trV7dXPqapIt4mkAf+/jid4JX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com; spf=pass smtp.mailfrom=ideasonboard.com; dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b=MkycFtPF; arc=none smtp.client-ip=213.167.242.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 33B7A1738;
	Tue, 12 Aug 2025 23:47:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755035264;
	bh=mDC1qaAWKXxn4GhY81d6CYkLb80ty3O7EgFsFZJdbNM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MkycFtPFr61yXRJlDZw/+JAxKm1bE7ItFhPjzwWQGJXKC4337ZQ/+2xgSluVHcHBZ
	 PTRt2K82vHHR/h9YvOMhSth9DF3sLj6xPOUOGzFmcPvbKXLJlyFSzEghZ7J2mkBsPx
	 Bamytgdm1axSrL8Tp9Rb3Qxke1wBpKJA8YU4lChg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 71/72] arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
Date: Wed, 13 Aug 2025 00:46:19 +0300
Message-ID: <20250812214620.30425-72-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
References: <20250812214620.30425-1-laurent.pinchart@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The clock-frequency for camera sensors has been deprecated in favour of
the assigned-clocks and assigned-clock-rates properties. As the clock
source for the sensor is a fixed-frequency oscillator, simply drop the
clock-frequency.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
This patch depends on "media: i2c: ov5645: Use V4L2 legacy sensor clock
helper", which we tentatively plan to merge for v6.18. It should
therefore be postponed to v6.19.
---
 arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
index 7cb5c958aece..529388f6bf2b 100644
--- a/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
+++ b/arch/arm64/boot/dts/renesas/aistarvision-mipi-adapter-2.1.dtsi
@@ -66,7 +66,6 @@ ov5645: ov5645@3c {
 		compatible = "ovti,ov5645";
 		reg = <0x3c>;
 		clocks = <&osc25250_clk>;
-		clock-frequency = <24000000>;
 		vdddo-supply = <&ov5645_vdddo_1v8>;
 		vdda-supply = <&ov5645_vdda_2v8>;
 		vddd-supply = <&ov5645_vddd_1v5>;
-- 
Regards,

Laurent Pinchart


