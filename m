Return-Path: <linux-media+bounces-49187-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EDB7CD04B0
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:36:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDD5B30D587F
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B338733B6D7;
	Fri, 19 Dec 2025 14:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="WGZ9zGXD"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94F3375C3;
	Fri, 19 Dec 2025 14:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154687; cv=fail; b=gURL6a+kcGGWRiC5X4rpMDhi9oamugIQI8fBHDSHtaJUvhmRaSmlBOwa0pEa24g0UhE6JfBSjDHA+QfC8rndk1zGLgKWx910nf9Qhsm05zMMv6RvlQAY14rNeHPwT6+0Po1tLtbnq2y2nIKZl6m6N+0JZM5h3MDtypsOOmAmJ2o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154687; c=relaxed/simple;
	bh=w+5uueXdTNqETJzwCZgdrxZS09kdSO49taLF4vBHeWE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=PVmdSdat4xkR/FvmfTzIgRXuBO6M13DRSwSFRMyJCL7SPOqn74Tu0O5sXWmXg/YtvUzp+a7vtJbnQkuMpX1zgJDsrTnlITHWDxL8ujR+JEa2hrzHdALh73V9lYL0i59+5/SeAk9Z31iTC4fR9HKSaFclHjZ7UP5kZm2OZCB+Ins=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=WGZ9zGXD; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJEQRoX1580356;
	Fri, 19 Dec 2025 15:30:56 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013025.outbound.protection.outlook.com [40.107.159.25])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31bq9g-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hkZc3ZwKrhPdfWnZ6dFBLE3VAOgUp66hUv6bvS9nv0ki9BXjNOH78KgtCiFfpGs0H509KoJHjg75AwmF5rfgZQjWuJ5D6u70+pgwbREQjLchqXCAJJIIEXf4pQJktAmQ/eS9486y8V9XluchUP2nHNgdlIuqV5IhZxnLUV9v+gZr764D7VcXfenw033vg0KYQtQ/LlUDubE23f9jm1rW8ySho7uH2NW4fLyCMkX2USgkrn4MZn3tv+700h/Rg03jSZ5Yx/aQp0K/1m3RnrleDlJuHDm8UHuoM0gSWRNx3e/iUFDq9UA9qZq0IQ6ahRIttmzzaUHZ3/F/M2odXdgIyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KUo+pmFmED9qWz2F5KWYRnNt0niPgdEfg0BRFSunOTU=;
 b=sXG0RwPwqTN01tVZGyPk7jI+JDAkJf8+kauIsRcxVDSqelNnslJR2YE9OcQe7JRFrhHE+YI9xC66WOBBIGhe3XktsfITTDpT3QoNa/9cgjLu4/ERDqSECpSXZjaVFVHFwBhfZzefp63smmP32ieM2dfTq5qaFuN3a581Ohx0LkS1YmdQk/uXh17Ze4eCVqWqM0lK6MbTMkcQLXWNHhJrzB8S64AR11rUPMUQsyF64Xnoa2Tvd+eW53gRLbjTTnr1a8xrMFXzeXCrOyd69gIJcUGGwW7/kgoTUvNnYTGvLzymVh49RgJZ3X8b9UfdclpsEKEoUhH7oW50SjgNc2x8gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KUo+pmFmED9qWz2F5KWYRnNt0niPgdEfg0BRFSunOTU=;
 b=WGZ9zGXDsLj545J3uYdWgNcxjayTF/gnkZzlvaggnOMVICPMmBw2b8xjcu52O21iN7I5DdlKLRd6PWKErVkbWiCDAElTC/g69aq21AKKBeszsWDzMao68OxWdeRNHEE/2SkXNo7RWEG00GIc6lVtWaGgokmYFEen4Jh2CH7ksFJ95J1SpyaQ+6VjVdeVRO2OU/qU67GziRwwU/PlnqoWwBTHzMvjIQMnGdipCLl8GFq+cn9/gh9WI7eP4DNWmCHnSbFdW1jUpUJi8+I1hMoqgayWE0lTn7w2QysrAmFrk2yTbA1wC2sCPss5P6pyl5NPoUWiK/LNvN+Z9rTaYiibnA==
Received: from AM8P190CA0025.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:219::30)
 by PA1PR10MB9124.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:453::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 14:30:53 +0000
Received: from AMS0EPF000001AB.eurprd05.prod.outlook.com
 (2603:10a6:20b:219:cafe::13) by AM8P190CA0025.outlook.office365.com
 (2603:10a6:20b:219::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 14:30:51 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AMS0EPF000001AB.mail.protection.outlook.com (10.167.16.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:53 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:38 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 15:30:39 +0100
Subject: [PATCH 5/6] media: stm32: dcmipp: byteproc: only allow compose
 with 8/16bit fmts
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-5-e2f8d46f022c@foss.st.com>
References: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
In-Reply-To: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001AB:EE_|PA1PR10MB9124:EE_
X-MS-Office365-Filtering-Correlation-Id: 15a9c541-91af-4f13-2481-08de3f0b375d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eW1pK2hOeDYyMFZ5Tm92NVA0S25wWjZoZnFaa3JZVTBkaTJPQW1jSnV1akVW?=
 =?utf-8?B?WVZiN3dKT2h5YUtsc0ZpZVJKMUlaclY0aUxMQksySzhDNnhqK05tYS9DNlhU?=
 =?utf-8?B?eTV0K0Q3eklZV0tzMkw2N2RTUlJnQkFTUzcxRVVxVmpZZXBDMHpSUTN1aDcv?=
 =?utf-8?B?YVZwU0YvS2gxdUQ1TjJIQTFYV0VJVk55ZStIazJhTW01cFRIRE9ITGkveitI?=
 =?utf-8?B?ZENTWG81M0J1QVAwNG9kOE00Yis5b0gwR2paU1RuL0QrUW8wSzBudEtqMmF3?=
 =?utf-8?B?NnBva0c0OVIxdFp4dDRrZ2VMdERaQ2NwOTZZS2xNLzhWWHRvOS9GSFNOQUxi?=
 =?utf-8?B?VnBkZkwwY1ZVcEUrOFI1V2cvYzdTazdicldNb3B2WndoWkxMbURHVVprdVN2?=
 =?utf-8?B?eW5DNmtUa3N6Q0kzaXo3a09kNm5KbTEyTVc4VHBnaWs5Vm42SGs0N3hoVUNC?=
 =?utf-8?B?aUxBeEtBc296OFBPdEhWS0ZyNEJwZWpncW40RVZGS0pUaVIzTHRnNktqU1BD?=
 =?utf-8?B?YnhrRWhjbzRxL2V2Y1ZzZFlCMDYvZExDSmZLRXYzR1VzRGZwa2hudTBmMUpT?=
 =?utf-8?B?ZWVlQzM2aTA2VGhXMFJCT2gwYlovWTZBSXlDRDRtUkNybWw5cDBpc0RhNnl6?=
 =?utf-8?B?SysrcGlmUEtRakJaR2tyQVFJUTQ5M21MVCtGVXlJU3c1QUFtMytRbStzbGM1?=
 =?utf-8?B?SWVtNnd5TGwxckR1WHVubGc0VHJHaXdhaU9oTk5sZ3Q5eDI3UzVuOVFWTmlT?=
 =?utf-8?B?Mjhya255OVc4dDVOa0xMMi83d3NhNVNabytpUFZxOGZEY1ZTb3BlZWl1Z1Iv?=
 =?utf-8?B?cUxhZi8yS2E5bmhuNjJZdXoyOGM5L1I4LzcrbXRxSjlTVUNRQ1JsVTBVYlJV?=
 =?utf-8?B?Q3pYd2ROdit5OTlSYTljV0M4M1RKUmpRTDFTSWRmM0twM2ZSNWM0M25nVURr?=
 =?utf-8?B?dTBwZWZZd3N6SzBWblVUeGNEamluTEh1TU0weGpVRG1GNjM0RWJCZ25qbGpi?=
 =?utf-8?B?ajY2cjFrWDhZUDhBRHQzYVdkS0xrZ0N3SFFiZitYMjN4eURqMWN3bEVSNDBB?=
 =?utf-8?B?M2NBQVR5anV3empsSVF3cDBaZ2hocWtDTHB2ODk5ZmNxRU10WVhJRTM3T3RK?=
 =?utf-8?B?d2RSNkNiTmJRbE1MSHNJRnpaekxBdGZNSlhDekJzYW1kYzhVYzhJV2pVNllP?=
 =?utf-8?B?NkIyaDlzVHhCeHlZcEtkcFhsYjBhRStRMzBvV2tCUDdHK0ZmeUVINzFPSitO?=
 =?utf-8?B?QWQ5VlV5eWNkR0VlSWVZc3B6aUVrcXFOMWhEZE1WUGxqL3RaQU9sVXA2VVE2?=
 =?utf-8?B?bXJaaFlOY2RqcXhyVnJxWVdvWWtVM1VWNXZCZU1Pc003M25oUW5GeXZpN1RI?=
 =?utf-8?B?U0hUcXFKN2ZxbEtnVzJ1TGNFVmQyb2Vib2JDb3lJWFB2SEZNSVYyc3RzbUQz?=
 =?utf-8?B?SVpSbUZwNVlTUWNLbmZod2J6a1ZqeXNEMS9Cb0NUMGhHaWVtUTVPYXpPd3Fq?=
 =?utf-8?B?NUFJeHpoeGw0Q3BpcHVzNXl0cEt4ck53d3d6TEtQK1dhSjVIY3JYbDduMGIr?=
 =?utf-8?B?T0lpWHZnRTBBVndYZ1FVNjNWYVdieEg5OWlzTFhFNklCTytIcno2NCtKVkhB?=
 =?utf-8?B?MzdnQzB3NVQxeFE1bFR2T3FnT2gvck9VdGVTZ0N0ZnVjcXh1S2d6YjdKRzRz?=
 =?utf-8?B?Y1A0ZVdXNXkxS0lxTCtsWG80VEJQOUoxUVpsQWY5bVZ6YW1VTDZrU2hWZHhz?=
 =?utf-8?B?dVB4QzhCRkcyaFZpcDVFMDRvdkcvWUlKblNKZVFESzZIdnVVL3BUWEJXZFlY?=
 =?utf-8?B?eW5OVlNxWlZHTTJFS21raDVTUW5neTJjR1l3MURIcHZ4Z1VNN1ZEbUlNZjVZ?=
 =?utf-8?B?eE11dlVCUHc2V0NGNk5jUVZ0ZE81OE9oUktYMTNGSkUrL1F2enBnV2dtcWp4?=
 =?utf-8?B?UUFtMGZhaHdlRVkwWUlWek1yVHZiejNsN0d1Z21tM0x2ek94MXNjMk10MlIw?=
 =?utf-8?B?dlpvV0IxUHVua0dwcVJMZHdlSEpCaXpCS2hWK1U1VGdlYVVwZEV4SE1pVG40?=
 =?utf-8?B?N01lLzdBc2UwSkZyODBRVEFmb1krdEY2ckdTc1NOY0JFN2Vma09VTWJTNVJE?=
 =?utf-8?Q?qphM=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:53.8407
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15a9c541-91af-4f13-2481-08de3f0b375d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001AB.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA1PR10MB9124
X-Proofpoint-GUID: KIEuPI8Ld4Nah_CiNwdGytb1SEkc8eem
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfX5boKVbcxZez6
 kjhok3FKZlda2iEgucK/dOLrkB8tBi0hdYSBheznPryrzyfGX/p+VTRe037twZ7GHfWN55vYqi8
 UBz4xo/ULV/4V8KwYg2M69Ol6tIFkw6ngvFCu+dwJr4RVzfss3+rKwbD9Ez+bXNetL4fLJL2cMv
 boLA+ELfDenzW2D6ZXzVVFCm8oaUOIN+1Y/oTxCFLcmSxfnDCQHy84V02NT8+kW64EDDUChvzuG
 MABlyHhusSO9EKVt+3JotxOs4zkGBxWkW4wMKCl8WamrzRHWW7ljlQ5g/2eoXM06qM5ThgakWOo
 /zSSoLakOVsHI4s0kIldKKqcCEBvCCvJyIE8zenhaanqN6C5Ycxim3cGHbqx5LlemoYeK0qtfkc
 bFFjksKOPQgjiKZ6n1GKYZMLQ3uMiVQuePnEDCbYrUYLjqvOvf415F2dhCnZm1oK6GxkwuUNmtp
 9AWntlsgue1UshvKlGw==
X-Authority-Analysis: v=2.4 cv=G+4R0tk5 c=1 sm=1 tr=0 ts=694561a0 cx=c_pps
 a=w11UtTSpiFIZaJ08iWVpLg==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=C0NDw3wMbQKSMC0Udz8A:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: KIEuPI8Ld4Nah_CiNwdGytb1SEkc8eem
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1011 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121

Since the byteproc is working at byte level, it is not possible to
perform decimation with formats other than 8 or 16 bit per pixel.
Ensure any other format won't be able to set a compose.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c   | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
index f45a3027f8f3..f9e4a3a9ef3f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-byteproc.c
@@ -131,6 +131,8 @@ static void dcmipp_byteproc_adjust_crop(struct v4l2_rect *r,
 static void dcmipp_byteproc_adjust_compose(struct v4l2_rect *r,
 					   const struct v4l2_mbus_framefmt *fmt)
 {
+	const struct dcmipp_byteproc_pix_map *vpix;
+
 	r->top = 0;
 	r->left = 0;
 
@@ -142,6 +144,14 @@ static void dcmipp_byteproc_adjust_compose(struct v4l2_rect *r,
 		return;
 	}
 
+	/* Prevent compose on formats which are not 1 or 2 bytes per pixel */
+	vpix = dcmipp_byteproc_pix_map_by_code(fmt->code);
+	if (vpix->bpp != 1 && vpix->bpp != 2) {
+		r->width = fmt->width;
+		r->height = fmt->height;
+		return;
+	}
+
 	/* Adjust height - we can only perform 1/2 decimation */
 	if (r->height <= (fmt->height / 2))
 		r->height = fmt->height / 2;
@@ -149,7 +159,7 @@ static void dcmipp_byteproc_adjust_compose(struct v4l2_rect *r,
 		r->height = fmt->height;
 
 	/* Adjust width /2 or /4 for 8bits formats and /2 for 16bits formats */
-	if (fmt->code == MEDIA_BUS_FMT_Y8_1X8 && r->width <= (fmt->width / 4))
+	if (vpix->bpp == 1 && r->width <= (fmt->width / 4))
 		r->width = fmt->width / 4;
 	else if (r->width <= (fmt->width / 2))
 		r->width = fmt->width / 2;

-- 
2.34.1


