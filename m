Return-Path: <linux-media+bounces-27802-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE44A56399
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 10:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D5473B57A7
	for <lists+linux-media@lfdr.de>; Fri,  7 Mar 2025 09:20:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EAD20C484;
	Fri,  7 Mar 2025 09:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="KSpoOqsK"
X-Original-To: linux-media@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12CB2206F2E;
	Fri,  7 Mar 2025 09:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741339221; cv=pass; b=P35EKEGcSrnx4FdMMDCsjZHhEbn0f+G77xO8rnk3DiJuhAwCErvcL3pqMg92CEQntPIDcGSwxhx2qvIXCyPAYPjAbkNY3ntk4eDfj01+By4r/sc6McYD13E+Eg6sQOdPkKzzBIgnvcjNd5ZSBVPPRTr/9/0Ite/Gpl299yZWF5c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741339221; c=relaxed/simple;
	bh=MCVLwHtjp9cOKQrVeDdnlO2+2vwGDRg37Vk1PFA+8Qo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h4ADQS3zpDQVb7x/myHOZo4CxFdbV+DpLvG/S8V3Zsnt1M7giSAPZgnIHHjV4qTTBmZINCJtpY1y6mPuDag5K8aZwFCB/9wENJGw7+PbuOVD+injEB0fkc6zfjNTIKlOcb7DAyC6rO6yt6dfBomKUOIIC3iNEkjes0xFjBwpJUM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=KSpoOqsK; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1741339175; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=kd2PxLRyDbHiEsHU4i2pu2uulTUubchrEKAJv9Ql/9HjC8TZCGciBkngP5jmdGoFYbJMICoQZiUA/9AEQ6F05UscKLmmgL1o1VRIMu5ywlmy+iR6PgMKDOP9NP8rPDZyY/0X4zqsKYk3ftZ52OztECzhSMFZ0yQSqDYXJzC32AA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1741339175; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=/U61HHgit3TG325CG81jVLePHjTZCns1zkq/zcF+5IM=; 
	b=AI3a4cWZ3/EmRVHMZ3Uy2KimoiGjkNC1Uu7Uc4n8VVjZvmUeWbCGKBa9xI1vNpt4a62weqzUnnhUP2heIxhSFcLo5I6dkpN/cK/ytUYOBevOeKrU8HRK7Kl8taehUFvTmZRzUA81XYci1MyVxG9GePOhcrRbGKSuhxgKwqEhBh8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1741339175;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=/U61HHgit3TG325CG81jVLePHjTZCns1zkq/zcF+5IM=;
	b=KSpoOqsKWm0EIVaANKirRhaJc4PtPKZB5jRk87SkXHUoy109PI6NKWxNKlTiPbq0
	cUHY5FLZSkHoVCImZvLQAExt4UcYwce4gVq92epySJGGuQGuCbQEjA9tHmMLjR7rvdJ
	egcyfmQxPFr4EgW3hi4tsElyn8TPkzc97iw7Nxi0=
Received: by mx.zohomail.com with SMTPS id 1741339174644626.3807889582921;
	Fri, 7 Mar 2025 01:19:34 -0800 (PST)
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Shreeya Patel <shreeya.patel@collabora.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	jose.abreu@synopsys.com,
	nelson.costa@synopsys.com,
	shawn.wen@rock-chips.com,
	nicolas.dufresne@collabora.com,
	Sebastian Reichel <sebastian.reichel@collabora.com>
Cc: kernel@collabora.com,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Tim Surber <me@timsurber.de>
Subject: [PATCH v15 2/2] arm64: dts: rockchip: Enable HDMI receiver on rock-5b
Date: Fri,  7 Mar 2025 12:18:57 +0300
Message-ID: <20250307091857.646581-3-dmitry.osipenko@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250307091857.646581-1-dmitry.osipenko@collabora.com>
References: <20250307091857.646581-1-dmitry.osipenko@collabora.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External

From: Sebastian Reichel <sebastian.reichel@collabora.com>

The Rock 5B has a Micro HDMI port, which can be used for receiving
HDMI data. This enables support for it.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Signed-off-by: Shreeya Patel <shreeya.patel@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
index d597112f1d5b..54a59a691538 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts
@@ -220,6 +220,17 @@ hdmi0_out_con: endpoint {
 	};
 };
 
+&hdmi_receiver_cma {
+	status = "okay";
+};
+
+&hdmi_receiver {
+	hpd-gpios = <&gpio1 RK_PC6 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim1_rx_cec &hdmim1_rx_hpdin &hdmim1_rx_scl &hdmim1_rx_sda &hdmirx_hpd>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &hdptxphy_hdmi0 {
 	status = "okay";
 };
@@ -377,6 +388,12 @@ &pcie3x4 {
 };
 
 &pinctrl {
+	hdmirx {
+		hdmirx_hpd: hdmirx-5v-detection {
+			rockchip,pins = <1 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.48.1


