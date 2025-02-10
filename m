Return-Path: <linux-media+bounces-25896-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 561F4A2E9C1
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:41:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 306433A3660
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:41:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 106A61DDC14;
	Mon, 10 Feb 2025 10:41:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Jm4x1wCv"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6EB15624D;
	Mon, 10 Feb 2025 10:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739184068; cv=none; b=JTzwPM4XguSpOEHvw0PR+EIz/S6YErFX2MyI1PFLBw3FgtCsUXVrutTWBRCj4Z8GlgGtrFY81oqNKgL5nak7USn3Ke06gHJfp+ZFixxW4C6wsH/pZSOD/WN0mG4nsTofy2mlkd/vQ0WUin/ATTVaVRbD7Tz+tW/XYL3JS34gN2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739184068; c=relaxed/simple;
	bh=14wXU91BgLiV3VpIcmWzwyO6W4OiWYnjYTvyVXydxrk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UJowPKaheEMc/ZbUMdlBkLKZXsXwDa4kA23ysnqydbO7Zmop4VuzK0YPkwaxLe188EIxifRIo5yDEmsV+NFf8gKUAUBf5z9qhFJPAP6Ej9SfdYaJhXBxAmzxWKfUDEvJ0dvSI86R3Jo3hXS9x2q0AtDmTzRcEjAE4sYQQDbuMdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Jm4x1wCv; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9emOV003742;
	Mon, 10 Feb 2025 11:07:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=selector1; bh=
	rZ3rqymKTcOrRHYBOJFcKi61/VkXrUXwCyZUwPho0Fk=; b=Jm4x1wCvVl0BJIfw
	WdaZ/oFSJeAgQwdPD8TmJ7Bl+F1CWSrqpdw7yzrIuq1XEVlnJzzrQDxaJJqPOdKY
	uwBzA1ROdhsVymQz/6U6z6j7XWZYP3li4Mp87AJni2gzut5kkR3Q5v8qabeHFrhm
	lhSUbtdu9OndZAU/X7V4ttt935HZ/QkpENx2WnnhTcHTnyYWM/UuSt+oFzJy8gEk
	dUk0h8Agk/TP0MJ/vEjVXIOsFtUPhcHwvCHFhrqIbJZX4cCzPEbDk5aBGtv43U2V
	RexB7um6WJW1tAHutQJPAtCOlS6vNjaq3pBZ78aqVm8mX1u4nnQzugZuvRkQl3c9
	lt/YCg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44phq3kvx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:07:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B2B9A4004B;
	Mon, 10 Feb 2025 11:06:13 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id AD9E82BEF84;
	Mon, 10 Feb 2025 11:05:01 +0100 (CET)
Received: from localhost (10.252.6.236) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:05:01 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 10 Feb 2025 11:04:30 +0100
Subject: [PATCH 1/2] ARM: dts: stm32: add missing dcmipp kclk clock-names
 in stm32mp135.dtsi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250210-6-14-stm32-media-fixes-v1-1-c64ebe9af8bb@foss.st.com>
References: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
In-Reply-To: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Vasut <marex@denx.de>
CC: <devicetree@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-media@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01

The dcmipp driver requires the first clock to be named as kclk hence
add a missing kclk clock-names within the dcmipp node in stm32mp135.dtsi.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm/boot/dts/st/stm32mp135.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/st/stm32mp135.dtsi b/arch/arm/boot/dts/st/stm32mp135.dtsi
index 834a4d545fe448c15feea3a3acd169da1da73e91..f9a49e7ab1f697ba8b76604cbb3e584d32a937df 100644
--- a/arch/arm/boot/dts/st/stm32mp135.dtsi
+++ b/arch/arm/boot/dts/st/stm32mp135.dtsi
@@ -14,6 +14,7 @@ dcmipp: dcmipp@5a000000 {
 			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
 			resets = <&rcc DCMIPP_R>;
 			clocks = <&rcc DCMIPP_K>;
+			clock-names = "kclk";
 			status = "disabled";
 
 			port {

-- 
2.34.1


