Return-Path: <linux-media+bounces-25892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC9FA2E8B8
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 11:08:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51B933AB7B2
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2025 10:07:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 241B51CAA6F;
	Mon, 10 Feb 2025 10:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="4xWJWD3A"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB351C5F12;
	Mon, 10 Feb 2025 10:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.207.212.93
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182069; cv=none; b=D1lLvJB0ZDe1KoJN+citeHO8W/VzUEeunsh9kSHQXfd+fbKkaX8Q4PeSO2ym71PrRobQFlES8xwSjvR1LDF0Asjr15uPMDpDc0YJ/ckWhVQFG7aEr7RVR/t6G+Puu3OqmGx75OjIWT3b0C1+yfbaIlZYEbALw/YNOuY9N7wCkuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182069; c=relaxed/simple;
	bh=qQ68sf6xTmfS+0HraBhqE6LqqgYEwQblx/dTeVABmZ0=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=drcQNbGE2ulmizYOpHgU+6+8JavgSZ06KQvtDwzIDkTKVaIMAqMUXVCgPSDJuM/6uoP24TLPwkRo158LcurO/hYsKCKa59f6iRp9F5xYX5+DLQ3LgUJYkQjWsd6psiWafIMwQSb1fN7e2ZM2QWxkc2y6iSoTjADFPlpoamV+bxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=4xWJWD3A; arc=none smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51A9epr5012596;
	Mon, 10 Feb 2025 11:07:13 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=/H+us+EpN5gsIUBiB28735
	vhfURAgKzhJf8uRl0O2pI=; b=4xWJWD3AB2S4EH6i28/FicuBfQaDy5KGsqp9Yy
	xQ3UBm+EpK9IRp4LP1dIXUoCjDHyicQORR+48DCdMMmhBbmktc28Zsfnj5QvEnwH
	0e+JPa6a9TGy5l3D/wk7wrHYxTaH/XyA/9mkPDzDKKRk0Kz4xSS+L3i+avQUfNfJ
	VbdxPRlKddOdD7xVAs+pyKXyoqOF0j4bPj3zVbPEDdWYZJPvXPSRLKKFxkCY2Uin
	81krOXng//YV27/HSDLEkfTQFv/IFj5wFPnT3QPkgLpon+SONoaMhEzhqU8MzRIY
	QPfTEBYkS8msORr6G3foOogx3CbFw1PxxllHUJjFYlhjYpdw==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 44p0wswptp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 11:07:13 +0100 (CET)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id B2C4E4004C;
	Mon, 10 Feb 2025 11:06:14 +0100 (CET)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 9629D2BE929;
	Mon, 10 Feb 2025 11:05:00 +0100 (CET)
Received: from localhost (10.252.6.236) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 10 Feb
 2025 11:05:00 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/2] ARM: dts: stm32: correct dtsi and yaml related to
 dcmipp & mipid02
Date: Mon, 10 Feb 2025 11:04:29 +0100
Message-ID: <20250210-6-14-stm32-media-fixes-v1-0-c64ebe9af8bb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC3PqWcC/x3LSQqAMAxA0atI1gaa2jpdRVw4RM3CgUZEEO9uc
 fn4/AeUg7BCnTwQ+BKVfYugNIFh6baZUcZosMZ6Y8lgjuRQzzWzuPIoHU5ys6IvyfRu4r6iAuJ
 8BP5DfJv2fT/o7CZcaAAAAA==
X-Change-ID: 20250210-6-14-stm32-media-fixes-5810b4feb917
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
        <linux-media@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>,
        <stable@vger.kernel.org>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_05,2025-02-10_01,2024-11-22_01

This series corrects two issues found on the stm32mp135f-dk related
to a missing clock-names property within the stm32mp135.dtsi and a
st-mipid02 device-tree bindings issue.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (2):
      ARM: dts: stm32: add missing dcmipp kclk clock-names in stm32mp135.dtsi
      dt-bindings: media: st,stmipid02: correct lane-polarities maxItems

 Documentation/devicetree/bindings/media/i2c/st,st-mipid02.yaml | 2 +-
 arch/arm/boot/dts/st/stm32mp135.dtsi                           | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)
---
base-commit: a64dcfb451e254085a7daee5fe51bf22959d52d3
change-id: 20250210-6-14-stm32-media-fixes-5810b4feb917

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


