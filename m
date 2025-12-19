Return-Path: <linux-media+bounces-49201-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EA04ACD0C22
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:11:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 807CE300699D
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:10:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07C7935A947;
	Fri, 19 Dec 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="LU3aGt0U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DAFE32A3C3;
	Fri, 19 Dec 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159927; cv=fail; b=J1oTJu3ehxiy4/h4u+0CQTKab2PP7eE9ynLbH+qr8FzhOuSM0QPJCJyNgwWVZ/UvckGuvbjxK2B6UlayrYsgbqQJ0h/yPiU5/zSZRnGlxxirSaMnS3AmlVRm8hfXt3PFqnbSYcNZSVM9n0VzFOs+8oGmkcmW3Qw9NEX2YSL334c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159927; c=relaxed/simple;
	bh=hNsA4x7XZSZQ7KasGYVXzAsvHguNYg2/qESZXVWsyGM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=B86oQXNNc4l264YsMgzzztJL/P9pQ15B5EBgG+VxS7I+e9cbzKdLAqzNEZxznsHiQQ5Mt+Y2hxGbrMcfyUZuHk13mRf2Mq1begnQY5bHaPMAqdzEFwRCnnGB+UyoUe/uCJNz81P1MDY7yoOaKjOCBMdnD0fngfgqJgWz2ZldLn8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=LU3aGt0U; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFnoAT640090;
	Fri, 19 Dec 2025 16:58:33 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012037.outbound.protection.outlook.com [52.101.66.37])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31c0e6-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zqbi1O34jMPXYmZEIAG2hn2H4Amwtni3DltEkvLA2tp4hMcGYwyAx9rwXY79Ei8sMihCwuxdVAEMrXFoKQq17O8yQdIfRQA5iWUIFrlAS3aJHXdYOgpvjBptpvnGSuqWdrdlWNj/75EAi9RAt24TY/R3z1kxAMgHPZPFRomtJbDYLnUASa6be/a2C7zayCo4PBTsd6Jan2whsbMKxb1i8UuSOe+gm4ibRDFewAWNoHrbrweteKIHALB2LkJwRzI0CngAdYKjW5CFv4uoUhdNeLp+8VTRSRZ+eZA5yiCqtJ6tG4OCrClyT9Fx8md/YYasaRQbfUUr6Zbp0DD6Y6zFuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OxMJrSfN76vV/zN8Ybo8TEBkXuWV/m4HKbphssmj3NI=;
 b=kuKeJ+6ohGiE01Xb6fiJYLQFe7wZ39eDiCvuN44kUDe28nVcI2o3MLbzfJD2iwA88PYnfkFaaWAJyjMnZv6Y0ThjSeNmLm0+1BktFEV0CSyn4/tT/sjb4kPIdBsXI0pA1C4/sB9GDPwPVZYtcJG8r/HbZcvbVj//D3IJgAenbAawZZNzchbqDjecZ6ckxIscI8ambj732y0m3NpcyM3Twn1aeaeAYpSdtjtvl1IJgdRHCZHn/TIMn6nTAmNmsfZ6jq4FZPhF07wYPwcd/DJi6etkPfFtaUvLZRB4/sfS2zOq/izFb4geKGd1eBg1BYu6na6c1dG43++JuoN2QAVpQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OxMJrSfN76vV/zN8Ybo8TEBkXuWV/m4HKbphssmj3NI=;
 b=LU3aGt0Uoh4zLIZoiws5J5vzUqFxwANEBMniNJwH99th/xIT3FLw2g3r6qT7VTQxuX1LwsWj6Tg62u7VWKzi8hl9ikNJiacx5oCKhf2w/Z4+y0MeO7gp7MCxHn6pDDPKAepKix66sKlT/RyzrtOtM5s3Kh7Y1INx7vsOBCzJEtKQ/jbNlsz2/qcDPtBZOlZzH5ZtzNLXqZXeaDIjnecmOxsLSO7OvQ2MMBhYduI6Rrgqqifr/9RTwPENiPI5Co4SRmMVD4EKCbQYcu9N+NzPxsGyxdabWJnGyyPu/LD26nUe7p6XzI4fAdlqUr2rPaZb7pxMrFQEnfK6UgtL7IFBPA==
Received: from DUZPR01CA0338.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::8) by PR3PR10MB4031.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:a9::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:58:30 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::e2) by DUZPR01CA0338.outlook.office365.com
 (2603:10a6:10:4b8::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:58:36 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:19 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:29 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 16:58:05 +0100
Subject: [PATCH 3/6] arm64: dts: st: add power-domain of csi in
 stm32mp231.dtsi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-3-a6edb2aa8154@foss.st.com>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue
	<alexandre.torgue@foss.st.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|PR3PR10MB4031:EE_
X-MS-Office365-Filtering-Correlation-Id: 5035cd54-e972-46cb-462b-08de3f177498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aGh0ejJzT2wrVzNTQlcvZVh6WWRxK3piRHdvY2xGNytEY05yUWdvQmswcjNa?=
 =?utf-8?B?N1oyajNKaTBUTVVnN3l1RmU0cWhnN3dJUDZUWlRtc2Q0bnc3S01SUW55eG9m?=
 =?utf-8?B?aGZxNW9pQStDNERRVmJVWlAxeEd6RGxjclJnaUxXTzA1T05KVHlybGl4RFFs?=
 =?utf-8?B?WHRNb25MdTlGODhwbWJQWTdONjR6dzhSTGZrRDdnYWtLcUI4QmlMM1czZnRI?=
 =?utf-8?B?R09ySkk5cVVOSER0RElOeStSQXVlV3dtK2o1YUZqbjZ0VUhXTGYwVkYvNElC?=
 =?utf-8?B?SG5xN0cyL3JJVFUxQy96UGdROVVBWSs4L0I3aTRqREJpZmRwdzIzNDZ3bzUw?=
 =?utf-8?B?Tm94RUwrbk9SQVY2cW5WRWI3ZWtWNTNYNkhYTUllRDJrUmV3UkVUZVBQR1Vk?=
 =?utf-8?B?U3FMUXBhS3p5eWw1ME5Cc29rdHhCa1dFNU1qdi94VllCbmtydEo1cGhsR2Ro?=
 =?utf-8?B?cEtlNDVuR0c1bnU1d2Z1LzFsM3lRdTFuWUZxa0pQbXBPOTA3R2JFS0I2YVBs?=
 =?utf-8?B?WVFncVlzYzU1VkN4ZVM1blhUenNKRHM4WDVPVk5QbnhIRkhvQ1MwMlNnNHFY?=
 =?utf-8?B?M1hEY2RTMGZ1V1dJS3dKakZlVmNtSjRjVGxIbjZrZXJKQTd0UWZtWlhrZm13?=
 =?utf-8?B?OWJscHdpUUdnN3MveUM1cy8rbTZ1STIyMzVoWURSYUZ2cS93MXR1anpFanRE?=
 =?utf-8?B?YkFIOFBsQlF2MzNSRjNqd2JYT0FDYVpqcFphUVFlczAzUEZqZy8yYzZDZjJJ?=
 =?utf-8?B?WTdVdEhXUk9aV1c5ZEJjY2Z6ZGFHc0JpWGxvQVhVMVExMGxxK1hZNzhFcWtn?=
 =?utf-8?B?SkE2dEcrSGdXd282M01kaWJHbkE3ODExckxSamlROTZjYzh0ZGNJNHZORk9X?=
 =?utf-8?B?RW9jL3gzbmJOTW0wenJhWlZseVljVEE5ZmZlcWg0OVJucWs5ZFF6R0RkbXZp?=
 =?utf-8?B?ZGhzdk1CM3FWK3hyTXlmTzFkWS8wYWJoYzFBaE9tdVBzQm9uc2hUWS9Va0VH?=
 =?utf-8?B?ZEwxQktld3hiMzRNYXIrVDhKd1l0VHlWN2dBRFdrZWNHcEkycXpmdE9ibUVX?=
 =?utf-8?B?V3ZjR1I3ZUNrWEZGNERXazZ1OVYxYmlpTDIvY0ZuOUJoTlcyTkFWRmlnSHlt?=
 =?utf-8?B?NG4xODBCOG9IN1hhY1V0QzZYbmNkVFcwYmZQUVRUeGczOWljaytMc1k1THZ3?=
 =?utf-8?B?ZTZBcEtiVGtoS09ZdGNhcjF1TTkxV2NXd0c1NlIrN2k2bXp4bU9lRFYrcjBN?=
 =?utf-8?B?a25EZTlQcGplRkZheHZiSERNRERaRWtza3I3aVZndytrQzFaVm1yVWpJenhj?=
 =?utf-8?B?dmZOMmpjQU9YL29kdnFwQlorQUhYeTdzSXN5ZlF6ZitzYy9KSFh0dk9DdFgy?=
 =?utf-8?B?VWtoSXhXMDNBZW1IcDBHSzE4cElJM3c3UHdKdTVoSlBOMUsxR3JaQmV0UlpX?=
 =?utf-8?B?Z25vWkdiRWRTci9nY0pXOUMzcjFwOVNXS3UrL2hRWjlQVlFReDlqbVVCZ1ZP?=
 =?utf-8?B?c1g4U05hdU91dU8yTlNWc3l0VG5ncEYxbmR1d1QxVjFSdTY1MjdOWHIyTW1k?=
 =?utf-8?B?R1J2eGVHYlhaakZlN3IrNWhDK2FtYVJEMDkxVWFrcUZaYktTSkM5ZGswOTRM?=
 =?utf-8?B?WHBzRURZbHp2MXNhQ3N3ZzF4N0x1RjFVK1p0Q2ppYnBkWEdsSGlraFNNYm02?=
 =?utf-8?B?K1FCUGIycytMYmhSbmk2aHFMaldDTzRnQUpFa0hPOWU3WFpveWgwN2VaSkR1?=
 =?utf-8?B?K0d5aUU4eTFsdGZrelpqeUtqUmxtRFAydW1zSG01OWNKMGEyclBOb1Q3dzA5?=
 =?utf-8?B?eGdLcGJiZTBiNEFXaEg4dStnMlhrYWpmT3hDb0pTMlNJZHhuMXZSSEZZa3hV?=
 =?utf-8?B?Y0h6YzhXVjhBNkxZMU9tQjlma3VvM2hMTnFWeTNOT2tpZXVVOEErcmJYS1hh?=
 =?utf-8?B?b01YN0ttVTRTZS9rSmRTQS9qNjVnbzduTW9EdVVBdHR5b3J3RkIveGFhZjAw?=
 =?utf-8?B?cmVLSThHbzBEcC9sRENJREo0T2w1cDZGV0FSZlpYSHJ4cXJYYTJ0OTY4eXAv?=
 =?utf-8?B?dXJSRFNrbHJLbGUvZ0tHenUyUUwycDVNZndLMENXaWpyYmR4MytQajVVeTV0?=
 =?utf-8?Q?U4G4=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:30.4997
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5035cd54-e972-46cb-462b-08de3f177498
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR10MB4031
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfX8S7uM2K7+3A2
 qQNaNmHUgS75hzD4Yu2u7huWqHNG6bb3/CfSliYeHhiQHdhZFcweGGw3+lUBNJBm60gKJIvBFZe
 +cpdn76fHVnoTBC524VqtCTJEDkW+JqPzjGVV+zvuTJ2gZnA2fB6FkR5mSL+8C2aFzP4rNGkaDY
 iYUcK0JNlegmXu1Zx/gcny3QSh9sGbH0wSYkddnvvqBeUdoqOaEgbwLxkyDMLjTmjd/0MspZHgk
 cBKU6mAPKs93kKTxcA1ph53R7Xs/nfMjL7YOunzF9JVH8wV9EXhtd9AcR4slIiM5U0/CMtGDnsz
 08ACOfgEgW9EbE8bGSiiDyPKHwDWG8zsCH2fJYm1KUW04wlJd+jgosJ2GJSS1iaZgIUMGfHIf+o
 pLeoZVcVy4e5tMbwz7MiIkv5DzQuYxqq6sj9HmmlgljY3w/yqtVtMcsWe5ctoFUlXuABQH6l2FL
 HLgtPHspDrl0vBLvvgA==
X-Authority-Analysis: v=2.4 cv=e9ALiKp/ c=1 sm=1 tr=0 ts=69457629 cx=c_pps
 a=U69z0xrlobRtR65H8yDefA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=6OvzQsbbxumjjrQ6Je8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: HUmqyaNPg6IjTR3XNCaXo7W_oRGP2qiS
X-Proofpoint-GUID: HUmqyaNPg6IjTR3XNCaXo7W_oRGP2qiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133

Add the power-domain property in the csi node of stm32mp231.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp231.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp231.dtsi b/arch/arm64/boot/dts/st/stm32mp231.dtsi
index 88e214d395ab..be9dd882ce79 100644
--- a/arch/arm64/boot/dts/st/stm32mp231.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp231.dtsi
@@ -676,6 +676,7 @@ csi: csi@48020000 {
 					 <&rcc CK_KER_CSIPHY>;
 				clock-names = "pclk", "txesc", "csi2phy";
 				access-controllers = <&rifsc 86>;
+				power-domains = <&cluster_pd>;
 				status = "disabled";
 			};
 

-- 
2.34.1


