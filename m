Return-Path: <linux-media+bounces-21765-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 862059D4DF4
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA834B21314
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:42:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E53C1D6DA8;
	Thu, 21 Nov 2024 13:41:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b="WQ47/VHg";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uSlaPB+4"
X-Original-To: linux-media@vger.kernel.org
Received: from fhigh-a1-smtp.messagingengine.com (fhigh-a1-smtp.messagingengine.com [103.168.172.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45D1D9324;
	Thu, 21 Nov 2024 13:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732196510; cv=none; b=WHlPfTdCoSyKq7gcuTJE8YQUzL/XXnQN4TDehoNTXLHFsDG+6heGYvZguivxhBrBeFR71diROkEB9BmyWbfXsEVQXgeUotl806NyzmpNZrVk7wxFRxRolExcniUxild3j5YwnococUWSlI5IelWOZU7+DJlpveks8bDoRGWNHrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732196510; c=relaxed/simple;
	bh=+xruQHeqTm8nJXrW1f6upB1nbXfUdCKap49UeYS1rxE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=o+t8yQUk9czAY2KZaBgHfHnLC8Joms0CcF0bRae+XiJjUK3bUEcbJYRuAe+tSdoKuOJaTNcSodSKFLPX7VH0O4Ypib3+7wWCDYCOy6oQKNAC+FWUavS4iYcxun/i9bRKJ5PvI6BhpvekXMqNTSmLAXeoRduagdsrKFCzUzs7uCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se; spf=pass smtp.mailfrom=ragnatech.se; dkim=pass (2048-bit key) header.d=ragnatech.se header.i=@ragnatech.se header.b=WQ47/VHg; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=uSlaPB+4; arc=none smtp.client-ip=103.168.172.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7DAFB11400A2;
	Thu, 21 Nov 2024 08:41:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Thu, 21 Nov 2024 08:41:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1732196507;
	 x=1732282907; bh=grcGNsDkKt33qsjmm220Rd9FMIJGuctg8Ed87a935xU=; b=
	WQ47/VHg4ETJrFDkz/7uN91scWtjz6hCD62H7ms4X+0zPZEHxR6NnOgv1X9zmrFj
	3+Je021OriaHBGOoaHNIR0FG26+cspPBtKiY7EACUTO9NS1Lmq0UNIOir1FWItzF
	Tcs715TiLgn/MDuQ9gfUo3ddofrjJudz+D4d/Yt0FszcDseseOqvF2toVsyeJYpW
	j2X9R7ZX5hw95Ysi9TCh8K4PWNw6LclNgWNsCXYJCG3ZAk2EXzn3iAk+uUQ1OSFU
	U4cL0jkgiBa5hDqtqEbbRpp8CbaEq+z1PAumwds1t6VGJRn9JQq07WjJkCWmXdrS
	JDt2fo1uscuX2cRy7TJnOA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1732196507; x=
	1732282907; bh=grcGNsDkKt33qsjmm220Rd9FMIJGuctg8Ed87a935xU=; b=u
	SlaPB+4CeyVXKc7V6RSWsvzh/j8CbqKe9pD6bP4ksaIzeFLhAt6ol+YztqbvgnwV
	5MQgI3B0TMIv5P3kevMBAlxlSHEB9witJf9ruD6ms6ju62OkEfMtmPakJpwk5vTu
	td9F99nF/qxeTamWBcBiCnpxRGVQnDSIsNx9Wcg+E+qne6KMvfMtzz4TlST25TgB
	GQ9e6vQ1vAUpcSxcu1/yIbp7HrPHAtPWojSpMIvD54mCvYlNlSxyDrdW5NR2bKQB
	VVQcp9UFTsGZ1hGSGQ4Et5A1rkQmjdMIfXjnGqu9hEOtuBRXgTtzHTbRSYv0CKMb
	8f8xbZLFZmvVsBeYk6oxw==
X-ME-Sender: <xms:mzg_Z31qanDuPBu45AZKu-GG1bDlvoixugBQqUAxYvdyAZFDdG57gQ>
    <xme:mzg_Z2HBLVJLv9oyVl7kLJW2pMiI9GYHR--0UyKyEbIi4KOXz_qTi3m7uwCfQfgCu
    3Q8UB4x6L5WTaSEdVM>
X-ME-Received: <xmr:mzg_Z37UBHSAGBZwZPJM2T8hI-fTEWPo3gxsMEHNUkwLY5pWNeJl8cxCZ9gCHFvmjB8f2zTtnkxjeql1EPsogNAS0A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrfeeigdehgecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfgggtgfesthekredtredtjeen
    ucfhrhhomheppfhikhhlrghsucfunpguvghrlhhunhguuceonhhikhhlrghsrdhsohguvg
    hrlhhunhguodhrvghnvghsrghssehrrghgnhgrthgvtghhrdhsvgeqnecuggftrfgrthht
    vghrnhepheeigfeuveeutdefhfehgeekvedtleeuueekveefudehhffhjeffgfegffelfe
    egnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhhi
    khhlrghsrdhsohguvghrlhhunhgusehrrghgnhgrthgvtghhrdhsvgdpnhgspghrtghpth
    htohepuddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehsrghkrghrihdrrghi
    lhhusheslhhinhhugidrihhnthgvlhdrtghomhdprhgtphhtthhopehmtghhvghhrggsse
    hkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepkhhriihkodgutheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghonh
    horhdoughtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehgvggvrhhtodhrvghnvghs
    rghssehglhhiuggvrhdrsggvpdhrtghpthhtoheplhgruhhrvghnthdrphhinhgthhgrrh
    htsehiuggvrghsohhnsghorghrugdrtghomhdprhgtphhtthhopehlihhnuhigqdhmvggu
    ihgrsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggvvhhitggvthhrvg
    gvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:mzg_Z80ZAyrKa0axLQehrKukewaN0L8fmjyN1Nhf2qu9-bU89QZqMA>
    <xmx:mzg_Z6Huv3dWkPTZFZOY-Wc0S1b2_Se-o9nYWFcox6VYPOW4Yc6dnw>
    <xmx:mzg_Z9_cb4iElLBXGEfskrNzn57TcuoFUZq07121vbK0YSoC2lk8XQ>
    <xmx:mzg_Z3n2QgqPx44NPjN5d6OJuMePG5BcKMkfmCSjhS7p8j892oIlsg>
    <xmx:mzg_Z1_lwnf5MN9NiHD2vaW-TfEFVoQQj8igm3K8O3xpsAZDSxRGD5oA>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 21 Nov 2024 08:41:46 -0500 (EST)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Cc: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH v2 3/4] arm64: dts: renesas: white-hawk-csi-dsi: Define CSI-2 data line orders
Date: Thu, 21 Nov 2024 14:41:07 +0100
Message-ID: <20241121134108.2029925-4-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
References: <20241121134108.2029925-1-niklas.soderlund+renesas@ragnatech.se>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The second CSI-2 C-PHY data-lane have a different line order (BCA) then
the two other data-lanes (ABC) for both connected CSI-2 receivers,
describe this in the device tree.

This have worked in the past as the R-Car CSI-2 driver did not have
documentation for the line order configuration and a magic value was
written to the register for this specific setup. Now the registers
involved are documented and the hardware description as well as the
driver needs to be corrected.

Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
---
 arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
index 3006b0a64f41..a5d1c1008e7e 100644
--- a/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
+++ b/arch/arm64/boot/dts/renesas/white-hawk-csi-dsi.dtsi
@@ -21,6 +21,9 @@ csi40_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
+				line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
 				remote-endpoint = <&max96712_out0>;
 			};
 		};
@@ -41,6 +44,9 @@ csi41_in: endpoint {
 				bus-type = <MEDIA_BUS_TYPE_CSI2_CPHY>;
 				clock-lanes = <0>;
 				data-lanes = <1 2 3>;
+				line-orders = <MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_BCA
+					       MEDIA_BUS_CSI2_CPHY_LINE_ORDER_ABC>;
 				remote-endpoint = <&max96712_out1>;
 			};
 		};
-- 
2.47.0


