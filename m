Return-Path: <linux-media+bounces-34352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACCCAD2008
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 15:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5C17E16F91D
	for <lists+linux-media@lfdr.de>; Mon,  9 Jun 2025 13:49:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A715E25DB0A;
	Mon,  9 Jun 2025 13:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Lt5N6aut"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405CF25D213;
	Mon,  9 Jun 2025 13:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.132.182.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749476909; cv=none; b=TK67SVwesOgivKws6Z4nlBvw1Mehh/uFWgRLhsMRuBKOFGCkfYIMNwsUd4xxU9Tv2JHgf97k47CL5Sd06m7RMJ/O1a8lC7gTtDLNEJlShX5+hpwmh0nwBdpFEQrFDQvjq+T2Ti2JeMsA+0GZngSomE+/+n+0N4BA7yPgB4L8DWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749476909; c=relaxed/simple;
	bh=4qugy7Gy5U65rUpSrg/izCrdxe0g4Ueqlc2us62UIBk=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=nqI44uIy1AGYP42ts+/E8XN7udp6IbDaw2j2RGab3N32u49+F91l+0rT133rwC2lnMgNBGwsfqQ/OMNsf1DzSp1EX8Iq+Xd/qlU25wOGKh3CkN6xFBzOjOKMiQg551LUkMJJxFPEF2E6ffxSBd4fiWAnv34w6uYpVavdUs1uce8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Lt5N6aut; arc=none smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 559COvv8017946;
	Mon, 9 Jun 2025 15:48:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=selector1; bh=AtOGsJ73mV0jL0X8jvB+hS
	JgoFR3MN4h96wOeayj0zU=; b=Lt5N6autJxn0o+t4AIRdriYKSZT8Ppeh7f0hWf
	rn6hLFPvGMjs49Ie8DPpvSqhfrrmfJ3IB1QyLcoWm45ka9UeM4u+U3EePCcTlKXM
	GsBnHJRQevAbr4qXZKm5Sbdo0xMCLjMI6Q/BLh5HXRlClDoM/YKy/kQxdAKM8qRp
	CoEMnyNi0BFad9BjxU9Uhd2M3wfELn+shwUbnCNemgPtOe/2k6H9U8Tx20gTxjhg
	VYCma3D4Jum0cg8xEUQsxRJyDQ0no6fE/zlWJFUMGxflNvjY8xdDKnn4jtA1cRUq
	iFQexnz684Fb8QiZ/E4SragB85HeRADjQtOxs/opH53zWDPg==
Received: from beta.dmz-ap.st.com (beta.dmz-ap.st.com [138.198.100.35])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 474cs2fxvn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Jun 2025 15:48:13 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-ap.st.com (STMicroelectronics) with ESMTP id 246A8400CA;
	Mon,  9 Jun 2025 15:47:20 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node1.st.com [10.75.129.69])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 1E628A55953;
	Mon,  9 Jun 2025 15:46:30 +0200 (CEST)
Received: from localhost (10.130.73.167) by SHFDAG1NODE1.st.com (10.75.129.69)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 9 Jun
 2025 15:46:29 +0200
From: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
Subject: [PATCH 0/4] media: i2c: vd55g1: Miscellaneous fixes
Date: Mon, 9 Jun 2025 15:46:20 +0200
Message-ID: <20250609-fix_vd55g1-v1-0-594f1134e3fb@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKzlRmgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDMwNL3bTMiviyFFPTdENdC+NUSyMTMxOLFAtTJaCGgqJUoCzYsOjY2lo
 Az5h8plwAAAA=
X-Change-ID: 20250609-fix_vd55g1-83e924648d85
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sylvain Petinot
	<sylvain.petinot@foss.st.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Benjamin
 Mugnier <benjamin.mugnier@foss.st.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01

This series provides small fixes and style improvements to the vd55g1
driver.
Nothing fancy really, just to keep everything up to date.

Signed-off-by: Benjamin Mugnier <benjamin.mugnier@foss.st.com>
---
Benjamin Mugnier (4):
      media: i2c: vd55g1: Fix RATE macros not being expressed in bps
      media: i2c: vd55g1: Fix return code in vd55g1_enable_streams error path
      media: i2c: vd55g1: Setup sensor external clock before patching
      media: i2c: vd55g1: Use first index of mbus codes array as default

 drivers/media/i2c/vd55g1.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)
---
base-commit: 5e1ff2314797bf53636468a97719a8222deca9ae
change-id: 20250609-fix_vd55g1-83e924648d85

Best regards,
-- 
Benjamin Mugnier <benjamin.mugnier@foss.st.com>


