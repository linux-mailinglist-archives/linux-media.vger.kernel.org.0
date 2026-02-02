Return-Path: <linux-media+bounces-52023-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YP8WG/StgGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52023-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:00:20 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B541CD0D1
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:00:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D3E373028501
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:59:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72B2A36B05D;
	Mon,  2 Feb 2026 13:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="dHmkv5Ge"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3F8236B069;
	Mon,  2 Feb 2026 13:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040697; cv=fail; b=nxUY7wZjD2mZq1+OMLEYNHypo2sp9msUmEgjir4pmCzRWnYpGwyWi4F1skkukdPiqrMLK5KReTIt1/FVWtstRkpYcWxvSPkHR1RMNOSFEYL43yOFE5GKXqLYJoftrBtOUY0o3cSUOAMbvrATd+f0bjWjmrFF4zCHbCaxB1WA+FA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040697; c=relaxed/simple;
	bh=6N+lzR8i8KlHFHP49PSD9SxcCGl818MqnvwHjTFhmYQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=UxUOLQZxaNfb1utgxp380GklCS6poMwM3Gf4A0wOJvwO27xp8F2zqNZFRkJ7NHRTcJmdTi0iM+SDAwxSrP/599dCV7KiJOc4+uLhtpxShQANcwZayavVaPikD7rqdyYcCKLOEn+OP9tajyacEvgBwbMPqmTh+ZrA3VayRGuOXqg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=dHmkv5Ge; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DfobJ2359518;
	Mon, 2 Feb 2026 14:58:00 +0100
Received: from pa4pr04cu001.outbound.protection.outlook.com (mail-francecentralazon11013000.outbound.protection.outlook.com [40.107.162.0])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1v654dg1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:58:00 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kF6vY/6E/zD5RQCVCh6UfSSX40TXwk2EcsTZnS51686OEi8XaKtthdutxO6j272k1oBGOW435nfeDG9dMxUHAQIt1cBgSxqVXe7nlUOLuSKX9dNC5ric84DBgxHjBMg2JdDymkvWgHzBP99pPv3fooXcg3YByWhIQD2VCuvg8OwxMBo22mIymN2K4IHjTzaoMWEyIKivynhQYu89BBLb7ACiGJW6Z/J/194szbRVgNGDuZiLIEN1QVpwLbGCHhog/1PVhU/RRN4Pm10vLjGOVvZa9VkVanSWb+wojdc9E17lL2otf129DyADAx41nl+7X29s9KSLpNXF5Qc6db3f8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PCf31ZmIEzai8pdGne0lASQmkXN93lRUWAkwiLc9F1Q=;
 b=OXjT0aonV73cBbRdBDZ4AylS/oOQNJE0tHNUPHx7o1c7yfWAm6RWJaRmWLFaFQvSxvJCKbG/YUgWu0/Zujrw8jmkg34lfbG9MDRrcdreyxDSu3ZX4pkdupC/2FKlRWY+KSBZdT9gKWys2yuBa+kyqZjPwsNNhCiSa69REFU2dgZeO/PU6hUpeU+SS63vY2271V7Byb5eaTi2OOgKFad+nBY+vVwBs0Wqk618DSh3hmcJjov5ZC0NSPujgaQNFCF+t55aC9OfNXQyfJx90EFuBs9yFGueuBB+b7Wpys12yhJsfT+fm8T1xLG4x8qwxfQsptb1GvnkbhAuocDkIlHSgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PCf31ZmIEzai8pdGne0lASQmkXN93lRUWAkwiLc9F1Q=;
 b=dHmkv5GedskNlPvZQcV9R9bNC0CiviIuRBFgfA6wc2DnpOlVDj0Yns0yfuTKdw8xAI61dRHrgY63zvgG4gFh1xfUZHZQFF5R4uD3/447b0oEE8G8yqIUaVVGJ8okXaVV94LHdFSyACQjnDo/VOiO5ELvIIfQs32yObgIlkzTidZ8/DxO/H+Lm6oZjVq6gxgDvBSWyjwl04jk2w60FgnGktCNOL6tpGaeMW00tTMcJY8VNzPakN3B5UboxsPIfQCsrGcW3CVfXEW2UYnrezgML9JkZtCQcdkA180++l7O3U+JHl5fUyDhoY0cRneJAIkKel6llqHmJb+pIS1NkVXflg==
Received: from AM8P251CA0024.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::29)
 by AS8PR10MB7280.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:614::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:55 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::7f) by AM8P251CA0024.outlook.office365.com
 (2603:10a6:20b:21b::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Mon,
 2 Feb 2026 13:57:47 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:54 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:31 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:52 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:37 +0100
Subject: [PATCH 12/13] media: stm32: dcmipp: rename bytecap into capture
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-12-8d8d51f5e014@foss.st.com>
References: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
In-Reply-To: <20260202-stm32-dcmipp-pixel-pipes-support-v1-0-8d8d51f5e014@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|AS8PR10MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 17c47691-9ddd-4081-58ce-08de6263106e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UWR1aDNyZUZHaVdKYnFpTmlrSHc0Z0pLNHRubDJBdzUya1Nhbi9Rd2pSRlF4?=
 =?utf-8?B?NjlBRWJnKytNQVF1UGd0WDhUUmxlQ2VwM095RUp3dW8xQzc0amZ6QjJMWUJo?=
 =?utf-8?B?aFF5VjJ3aFJDUUFqSjVkQjY0bDlmRHVIWEdDQjBGb2Z3M0ZneDlNM1UyN3dQ?=
 =?utf-8?B?eDhFWk0yYlZmUVo4b0lQVE5HQk5qSDVoa2FpdHpUZDJNRGYzb0VTR3QzMkNq?=
 =?utf-8?B?aXR2YnVtWlVhU1lkWFQ4b213bzViRDhmNnR4SnZPL0dFbjJnZWM3bzluTSt1?=
 =?utf-8?B?Wi8xQldCRjB2N2syRTNaUHdHLzhzTW0zck1Xa3pqSmw1T01TbEhnVndQVDZj?=
 =?utf-8?B?aXVhY1VDdWFwSmhlQ0dPcXZOUk1iTzN5ekVqK3NaZlRrYmp3YWd4eHRVRFJt?=
 =?utf-8?B?V2tFcFlvTTMzdXNlVWdQbzdtQUdTNU9nMm1RQWVSNWphdlhTMmp4VllySFJz?=
 =?utf-8?B?SUF6OXNpN2p0cVFybW5JcHJQL3FIYVl3RzNVVFU3QlpzQ2l0SFdMV21CMmpC?=
 =?utf-8?B?RUFQMTdKcVArN0ZnMkI5RGI3WXJrWmtya3R0SndoVVZ0QVJvSjlIRjdHS0pi?=
 =?utf-8?B?ZzA4blpJZnZSM3c3ekxiSkxNUDFsSW5TUE5MYWxBcGlodEdMV1YwUjN2dm8v?=
 =?utf-8?B?cXdHejk1d0U0eU5SSEJuOU9rdUwvcFdaM1VNZUx0T1lTYzZTYThxMHJWSHVk?=
 =?utf-8?B?RWhpa0krOEdQc2pjREFZZlhDenhkUFFpQklFMStBL0Vac0ovdm5sYXpmZGxQ?=
 =?utf-8?B?ZGRUdmVwaytja0tVYUsrQ3B4UFl4ckFDTDF6WTVqTVBpMHF1Q3hWMTN4aUMz?=
 =?utf-8?B?WTA0aDB1NjFTWE1Xd0IwWWNMS1FrZ1NvWnNTVFlPV0tmaHBYcjlQQnlpRitH?=
 =?utf-8?B?ZGZSNGxhV0lUWGRmRldYbEVYWm8vQk5CNkMwTVRQdmk5M2xjTmQ2Y0VMUkxh?=
 =?utf-8?B?R1VzMC9abHAxaENsblNwT3dHeHJONW45aGZPQzhSVURRRlhrMEsxOUEzUTdJ?=
 =?utf-8?B?bXd5bkdWbVRnUEUzY2xUYkZ5ay8ycDhqd0Vyd2NLd2ZZa3pmRDgyOTBzaFA0?=
 =?utf-8?B?cytia0xGQ2EwUks3YWlsSWV5RlI4MzhOcjhmRFBEOCtaOFhqN3l1R2FLbkU1?=
 =?utf-8?B?anVYaVdER1JBeFVWVVVVU2dLMmtwcEtSL0thelIvc1d4UU04Um16K1JBQnQ2?=
 =?utf-8?B?TGdLTkl0SSsyd21EaXNudDRpMTQwWkFlVnY5bTJHU3kreXVmSjUxM0IyVDFI?=
 =?utf-8?B?VWhFNEdkNm41bnBGREhzRDdvc09YKzc0bktRRkpUdzJkdE5yS2N2R1FONXBr?=
 =?utf-8?B?ZjFadEFLZS9GVS9kVmFiM0lvNXZ4UVlYaGI1WUUzdVJhUmtLSm9VZTR1MldE?=
 =?utf-8?B?c3FrNHBlcVZ4OXlWNllrVTdEZkpWcnVudityYmVVT09MUGxjWjV6ZVpQbWY4?=
 =?utf-8?B?T1czQzVuL29SM0ZNQzdJMW1KdUkwZnBHZzd5RUVLWGtUc2sxdTNWQWF6QStU?=
 =?utf-8?B?V3hEUmNadFlGeHVXdm9iNkNzV3ovL2dHb2dFaytmRC94YnBYbGRhcFZkc21v?=
 =?utf-8?B?U0FSUUdkTGRBcXdrZGNldXVuUkUxalVyUFcvQjRPYmlreDd3azlWdkFRQW9T?=
 =?utf-8?B?dUlSNmFqaEFOekovRHJtTFZRc0FPWTdQZzc3akVpeCtCVkpsS2NKNTIxYmNM?=
 =?utf-8?B?SFhTNXFhRWNDNGtWWXlXaTZlSUJ6RW83bzk0bGVOT2lONDdacHVSTEMvYjV1?=
 =?utf-8?B?Q2t5b1krRzVBTDF5QVNuYzVMcDVVcXh0YnhnZUR5TUxqSXAvbmFKNnVLcEtk?=
 =?utf-8?B?UTE5ei9SeTBLM0p0a29VMnZwL2o3eG1rdEdDbGl0NktFbjRmdjVvT0tTaXNO?=
 =?utf-8?B?OEZML2JBU2U5N29lY3V0ajF2b3lHcTR4RnN3SjVVR1hmUkpmNEJ4NW1HcGVM?=
 =?utf-8?B?Tnd4UEl4dnFBN0RYMzZ2MDdsczM0emZoZWdGUSt5U1B6Si83enRMcXRmK2xs?=
 =?utf-8?B?RVhjc1J6K285QmVlY0RpbktFeXZUSHM4Ky8wZkF0UEwzbGFyV3V5YkM4MFpG?=
 =?utf-8?B?di92UDlkeWdQb1BCZWFJUGozbXpQdHZHdjliMGpoTzE3eHhiR1hqN1EyQlNy?=
 =?utf-8?B?MVpFY1M1bHZ4b1Q4ZXFQTVBXODAyUlcwYWVtWkk5S1QrTWFtNytxMmpESmw4?=
 =?utf-8?B?UGxyWjYrc2NXTjRGVUVMd05LYkhNSWVkd1RadTQ1OGV4TTR6TEphZkJySG9s?=
 =?utf-8?B?MzJMRWp5ZDl5dFduNW0ycWtvZjFBPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RjAzq5p/dGiIXHX3suxVKZgyTk+sLssWMHAnV2L6hqsIhL1LkDNGXREG2rJSB3XBm13nOAikpzDKKtc14jYP05k6CiKERMlO+jftLFTOTFr48MmHGGQFD5uA1O8EHPtu8sNdLiPUv2FjxZYDE3y2joBaUWbKuYBUb9TQfJQo7TD/TCz0EUwg8R7a3FYD1U4pz935qGw4U2E8kzA6nrvAtHojlkHbWwH5BtKe07C+M+Ik+yomth2GuS3uip3eD+S8f0qbxu9BFHJ819IlgLcbzH5tEJ9zUNg4WCylFQ0ZRgSsjUSPvTyJu0yWmxB4LBNZ7GkBNqExR2SKMFP0bMYxWzsTwhMy7WvJ2dZn50XClckW+QrFBpZ4JOWhHScA/3GQVdWR5/XYC7Vz3TTN92h4/F2WM1PhmLWDAXH1K008KSRr+rlC03D8UQ9qTDlFsYhH
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:54.9246
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 17c47691-9ddd-4081-58ce-08de6263106e
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB7280
X-Authority-Analysis: v=2.4 cv=XvL3+FF9 c=1 sm=1 tr=0 ts=6980ad68 cx=c_pps
 a=MgKGjZA+ld+Omnnxn8FnZw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=a74OAJdhv809jlhGsvcA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 6ZUw0INmZbi14a8KbMteLh9BFwnPOfvM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX8U1W2bPlrFt2
 Tg7CefJz4KYfq3HjAsR1+wIR5Jc59zG1kvE7WTEf1elpnkQGNloRms3YKNPd18pCagB7APHRG+F
 DdZQZBURtaSDAX8ohOPcZstCPCiK45zP9m1AhV1vGH0vSm/hsLB+HhgJODxoLYlTldlFG7mccTx
 +Qo3kwhYHxOTW4xVqv0I+E8/lV0qXVzXPJ82SqY07fPiJUbiJqiXfTwHRUWVtdQFZ8XjzNd0ixG
 LpwzrPWNWK5hMCskhsm5nK6LEyeba7O9TGyRORgVbiDwS+IiBEgKvuWBGzWnd4h0en5BXvsmV/t
 jl72pXgHR/dmd3wqsmbFbWs+Ef3jZxMtKcvmp2BgUxk6xb/KMGlNIGlfrpeVWbe0nbPwD0Dar5G
 sB1IUHxY+E5Xww/UHO5tp9zL/HPP5UqyF8lDyRPFJCS3UG5Pauamd6wcslvOER1+5y+hQI37Y3n
 o5tbyLZUA3QYOSnektQ==
X-Proofpoint-ORIG-GUID: 6ZUw0INmZbi14a8KbMteLh9BFwnPOfvM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52023-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 0B541CD0D1
X-Rspamd-Action: no action

Since the bytecap video driver is now handling all
capture (byte & pixel), rename the file and structs
*into capture. This is done by:
  - renaming of dcmipp-bytecap.c into dcmipp-capture.c
  - replace of dcmipp_bytecap strings into dcmipp_capture

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../{dcmipp-bytecap.c => dcmipp-capture.c}         | 188 ++++++++++-----------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-core.c   |   8 +-
 4 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 7178934bb116..e35d45a0aca2 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-capture.o
 stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
similarity index 85%
rename from drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
rename to drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
index e96ba7931b27..d9a2b7f159ea 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-capture.c
@@ -95,7 +95,7 @@
 
 #define DCMIPP_PxPPCR_SWAPRB		BIT(4)
 
-struct dcmipp_bytecap_pix_map {
+struct dcmipp_capture_pix_map {
 	unsigned int code;
 	u32 pixelformat;
 	u32 plane_nb;
@@ -109,7 +109,7 @@ struct dcmipp_bytecap_pix_map {
 		.pixelformat = V4L2_PIX_FMT_##fmt	\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] = {
+static const struct dcmipp_capture_pix_map dcmipp_capture_dump_pix_map_list[] = {
 	PIXMAP_MBUS_PFMT(RGB565_2X8_LE, RGB565),
 	PIXMAP_MBUS_PFMT(RGB565_1X16, RGB565),
 	PIXMAP_MBUS_PFMT(RGB888_1X24, RGB24),
@@ -153,7 +153,7 @@ static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_dump_pix_map_list[] =
 		.swap_uv = swap,			\
 	}
 
-static const struct dcmipp_bytecap_pix_map dcmipp_bytecap_pixel_pix_map_list[] = {
+static const struct dcmipp_capture_pix_map dcmipp_capture_pixel_pix_map_list[] = {
 	/* Coplanar formats are supported on main & aux pipe */
 	PIXMAP_MBUS_PIXEL_PFMT(RGB888_1X24, RGB565, 1, DCMIPP_PxPPCR_FORMAT_RGB565, 0),
 	PIXMAP_MBUS_PIXEL_PFMT(YUV8_1X24, YUYV, 1, DCMIPP_PxPPCR_FORMAT_YUYV, 0),
@@ -188,7 +188,7 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-struct dcmipp_bytecap_device {
+struct dcmipp_capture_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
 	struct device *dev;
@@ -220,7 +220,7 @@ struct dcmipp_bytecap_device {
 
 	u32 pipe_id;
 
-	const struct dcmipp_bytecap_pix_map *pix_map;
+	const struct dcmipp_capture_pix_map *pix_map;
 	unsigned int pix_map_array_size;
 
 	u32 cmsr2;
@@ -238,8 +238,8 @@ struct dcmipp_bytecap_device {
 	} count;
 };
 
-static const struct dcmipp_bytecap_pix_map *
-dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
+static const struct dcmipp_capture_pix_map *
+dcmipp_capture_pix_map_by_pixelformat(struct dcmipp_capture_device *vcap,
 				      u32 pixelformat)
 {
 	for (unsigned int i = 0; i < vcap->pix_map_array_size; i++) {
@@ -250,11 +250,11 @@ dcmipp_bytecap_pix_map_by_pixelformat(struct dcmipp_bytecap_device *vcap,
 	return NULL;
 }
 
-static bool dcmipp_bytecap_is_format_valid(struct dcmipp_bytecap_device *vcap,
+static bool dcmipp_capture_is_format_valid(struct dcmipp_capture_device *vcap,
 					   unsigned int pixelformat)
 {
-	const struct dcmipp_bytecap_pix_map *vpix =
-		dcmipp_bytecap_pix_map_by_pixelformat(vcap, pixelformat);
+	const struct dcmipp_capture_pix_map *vpix =
+		dcmipp_capture_pix_map_by_pixelformat(vcap, pixelformat);
 
 	if (!vpix || (vpix->plane_nb > 1 && vcap->pipe_id != 1))
 		return false;
@@ -342,7 +342,7 @@ static inline int frame_planes(dma_addr_t base_addr, dma_addr_t addrs[],
 	return 0;
 }
 
-static int dcmipp_bytecap_querycap(struct file *file, void *priv,
+static int dcmipp_capture_querycap(struct file *file, void *priv,
 				   struct v4l2_capability *cap)
 {
 	strscpy(cap->driver, DCMIPP_PDEV_NAME, sizeof(cap->driver));
@@ -351,20 +351,20 @@ static int dcmipp_bytecap_querycap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_g_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_g_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 
 	f->fmt.pix = vcap->format;
 
 	return 0;
 }
 
-static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_try_fmt_vid_cap(struct file *file, void *priv,
 					  struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	struct v4l2_pix_format *format = &f->fmt.pix;
 	/* Take into consideration the width constraint of the pixel packer */
 	unsigned int walign = (vcap->pipe_id != 0 ?
@@ -372,7 +372,7 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 	u32 in_w, in_h;
 
 	/* Don't accept a pixelformat that is not on the table */
-	if (!dcmipp_bytecap_is_format_valid(vcap, format->pixelformat))
+	if (!dcmipp_capture_is_format_valid(vcap, format->pixelformat))
 		format->pixelformat = fmt_default.pixelformat;
 
 	/* Adjust width & height */
@@ -402,17 +402,17 @@ static int dcmipp_bytecap_try_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_s_fmt_vid_cap(struct file *file, void *priv,
 					struct v4l2_format *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	int ret;
 
 	/* Do not change the format while stream is on */
 	if (vb2_is_busy(&vcap->queue))
 		return -EBUSY;
 
-	ret = dcmipp_bytecap_try_fmt_vid_cap(file, priv, f);
+	ret = dcmipp_capture_try_fmt_vid_cap(file, priv, f);
 	if (ret)
 		return ret;
 
@@ -434,10 +434,10 @@ static int dcmipp_bytecap_s_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
+static int dcmipp_capture_enum_fmt_vid_cap(struct file *file, void *priv,
 					   struct v4l2_fmtdesc *f)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 	unsigned int index = f->index;
 	unsigned int i, prev_pixelformat = 0;
 
@@ -475,17 +475,17 @@ static int dcmipp_bytecap_enum_fmt_vid_cap(struct file *file, void *priv,
 	return 0;
 }
 
-static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
+static int dcmipp_capture_enum_framesizes(struct file *file, void *fh,
 					  struct v4l2_frmsizeenum *fsize)
 {
-	struct dcmipp_bytecap_device *vcap = video_drvdata(file);
+	struct dcmipp_capture_device *vcap = video_drvdata(file);
 
 
 	if (fsize->index)
 		return -EINVAL;
 
 	/* Only accept code in the pix map table */
-	if (!dcmipp_bytecap_is_format_valid(vcap, fsize->pixel_format))
+	if (!dcmipp_capture_is_format_valid(vcap, fsize->pixel_format))
 		return -EINVAL;
 
 	fsize->type = V4L2_FRMSIZE_TYPE_CONTINUOUS;
@@ -499,7 +499,7 @@ static int dcmipp_bytecap_enum_framesizes(struct file *file, void *fh,
 	return 0;
 }
 
-static const struct v4l2_file_operations dcmipp_bytecap_fops = {
+static const struct v4l2_file_operations dcmipp_capture_fops = {
 	.owner		= THIS_MODULE,
 	.open		= v4l2_fh_open,
 	.release	= vb2_fop_release,
@@ -509,14 +509,14 @@ static const struct v4l2_file_operations dcmipp_bytecap_fops = {
 	.mmap           = vb2_fop_mmap,
 };
 
-static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
-	.vidioc_querycap = dcmipp_bytecap_querycap,
+static const struct v4l2_ioctl_ops dcmipp_capture_ioctl_ops = {
+	.vidioc_querycap = dcmipp_capture_querycap,
 
-	.vidioc_g_fmt_vid_cap = dcmipp_bytecap_g_fmt_vid_cap,
-	.vidioc_s_fmt_vid_cap = dcmipp_bytecap_s_fmt_vid_cap,
-	.vidioc_try_fmt_vid_cap = dcmipp_bytecap_try_fmt_vid_cap,
-	.vidioc_enum_fmt_vid_cap = dcmipp_bytecap_enum_fmt_vid_cap,
-	.vidioc_enum_framesizes = dcmipp_bytecap_enum_framesizes,
+	.vidioc_g_fmt_vid_cap = dcmipp_capture_g_fmt_vid_cap,
+	.vidioc_s_fmt_vid_cap = dcmipp_capture_s_fmt_vid_cap,
+	.vidioc_try_fmt_vid_cap = dcmipp_capture_try_fmt_vid_cap,
+	.vidioc_enum_fmt_vid_cap = dcmipp_capture_enum_fmt_vid_cap,
+	.vidioc_enum_framesizes = dcmipp_capture_enum_framesizes,
 
 	.vidioc_reqbufs = vb2_ioctl_reqbufs,
 	.vidioc_create_bufs = vb2_ioctl_create_bufs,
@@ -529,7 +529,7 @@ static const struct v4l2_ioctl_ops dcmipp_bytecap_ioctl_ops = {
 	.vidioc_streamoff = vb2_ioctl_streamoff,
 };
 
-static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_start_capture(struct dcmipp_capture_device *vcap,
 				 struct dcmipp_buf *buf)
 {
 	/* Set buffer address */
@@ -556,7 +556,7 @@ static void dcmipp_start_capture(struct dcmipp_bytecap_device *vcap,
 	reg_set(vcap, DCMIPP_PxFCTCR(vcap->pipe_id), DCMIPP_PxFCTCR_CPTREQ);
 }
 
-static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_capture_all_buffers_done(struct dcmipp_capture_device *vcap,
 					    enum vb2_buffer_state state)
 {
 	struct dcmipp_buf *buf, *node;
@@ -567,10 +567,10 @@ static void dcmipp_bytecap_all_buffers_done(struct dcmipp_bytecap_device *vcap,
 	}
 }
 
-static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
+static int dcmipp_capture_start_streaming(struct vb2_queue *vq,
 					  unsigned int count)
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	struct media_entity *entity = &vcap->vdev.entity;
 	struct dcmipp_buf *buf;
 	struct media_pad *pad;
@@ -581,7 +581,7 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 
 	/*
 	 * Get source subdev - since link is IMMUTABLE, pointer is cached
-	 * within the dcmipp_bytecap_device structure
+	 * within the dcmipp_capture_device structure
 	 */
 	if (!vcap->s_subdev) {
 		pad = media_pad_remote_pad_first(&vcap->vdev.entity.pads[0]);
@@ -613,8 +613,8 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	spin_lock_irq(&vcap->irqlock);
 
 	if (vcap->pipe_id != 0) {
-		const struct dcmipp_bytecap_pix_map *vpix =
-			dcmipp_bytecap_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
+		const struct dcmipp_capture_pix_map *vpix =
+			dcmipp_capture_pix_map_by_pixelformat(vcap, vcap->format.pixelformat);
 		unsigned int ppcr = 0;
 
 		/*
@@ -663,14 +663,14 @@ static int dcmipp_bytecap_start_streaming(struct vb2_queue *vq,
 	 * Return all buffers to vb2 in QUEUED state.
 	 * This will give ownership back to userspace
 	 */
-	dcmipp_bytecap_all_buffers_done(vcap, VB2_BUF_STATE_QUEUED);
+	dcmipp_capture_all_buffers_done(vcap, VB2_BUF_STATE_QUEUED);
 	vcap->active = NULL;
 	spin_unlock_irq(&vcap->irqlock);
 
 	return ret;
 }
 
-static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
+static void dcmipp_dump_status(struct dcmipp_capture_device *vcap)
 {
 	struct device *dev = vcap->dev;
 
@@ -686,9 +686,9 @@ static void dcmipp_dump_status(struct dcmipp_bytecap_device *vcap)
  * Stop the stream engine. Any remaining buffers in the stream queue are
  * dequeued and passed on to the vb2 framework marked as STATE_ERROR.
  */
-static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
+static void dcmipp_capture_stop_streaming(struct vb2_queue *vq)
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	int ret;
 	u32 status;
 
@@ -726,7 +726,7 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 	spin_lock_irq(&vcap->irqlock);
 
 	/* Return all queued buffers to vb2 in ERROR state */
-	dcmipp_bytecap_all_buffers_done(vcap, VB2_BUF_STATE_ERROR);
+	dcmipp_capture_all_buffers_done(vcap, VB2_BUF_STATE_ERROR);
 	INIT_LIST_HEAD(&vcap->buffers);
 
 	vcap->active = NULL;
@@ -746,9 +746,9 @@ static void dcmipp_bytecap_stop_streaming(struct vb2_queue *vq)
 			 vcap->count.underrun, vcap->count.buffers);
 }
 
-static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
+static int dcmipp_capture_buf_prepare(struct vb2_buffer *vb)
 {
-	struct dcmipp_bytecap_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
+	struct dcmipp_capture_device *vcap =  vb2_get_drv_priv(vb->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
 	struct v4l2_pix_format *format = &vcap->format;
@@ -798,9 +798,9 @@ static int dcmipp_bytecap_buf_prepare(struct vb2_buffer *vb)
 	return 0;
 }
 
-static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
+static void dcmipp_capture_buf_queue(struct vb2_buffer *vb2_buf)
 {
-	struct dcmipp_bytecap_device *vcap =
+	struct dcmipp_capture_device *vcap =
 		vb2_get_drv_priv(vb2_buf->vb2_queue);
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb2_buf);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
@@ -824,13 +824,13 @@ static void dcmipp_bytecap_buf_queue(struct vb2_buffer *vb2_buf)
 	spin_unlock_irq(&vcap->irqlock);
 }
 
-static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
+static int dcmipp_capture_queue_setup(struct vb2_queue *vq,
 				      unsigned int *nbuffers,
 				      unsigned int *nplanes,
 				      unsigned int sizes[],
 				      struct device *alloc_devs[])
 {
-	struct dcmipp_bytecap_device *vcap = vb2_get_drv_priv(vq);
+	struct dcmipp_capture_device *vcap = vb2_get_drv_priv(vq);
 	unsigned int size;
 
 	size = vcap->format.sizeimage;
@@ -848,7 +848,7 @@ static int dcmipp_bytecap_queue_setup(struct vb2_queue *vq,
 	return 0;
 }
 
-static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
+static int dcmipp_capture_buf_init(struct vb2_buffer *vb)
 {
 	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
 	struct dcmipp_buf *buf = container_of(vbuf, struct dcmipp_buf, vb);
@@ -858,19 +858,19 @@ static int dcmipp_bytecap_buf_init(struct vb2_buffer *vb)
 	return 0;
 }
 
-static const struct vb2_ops dcmipp_bytecap_qops = {
-	.start_streaming	= dcmipp_bytecap_start_streaming,
-	.stop_streaming		= dcmipp_bytecap_stop_streaming,
-	.buf_init		= dcmipp_bytecap_buf_init,
-	.buf_prepare		= dcmipp_bytecap_buf_prepare,
-	.buf_queue		= dcmipp_bytecap_buf_queue,
-	.queue_setup		= dcmipp_bytecap_queue_setup,
+static const struct vb2_ops dcmipp_capture_qops = {
+	.start_streaming	= dcmipp_capture_start_streaming,
+	.stop_streaming		= dcmipp_capture_stop_streaming,
+	.buf_init		= dcmipp_capture_buf_init,
+	.buf_prepare		= dcmipp_capture_buf_prepare,
+	.buf_queue		= dcmipp_capture_buf_queue,
+	.queue_setup		= dcmipp_capture_queue_setup,
 };
 
-static void dcmipp_bytecap_release(struct video_device *vdev)
+static void dcmipp_capture_release(struct video_device *vdev)
 {
-	struct dcmipp_bytecap_device *vcap =
-		container_of(vdev, struct dcmipp_bytecap_device, vdev);
+	struct dcmipp_capture_device *vcap =
+		container_of(vdev, struct dcmipp_capture_device, vdev);
 
 	dcmipp_pads_cleanup(vcap->ved.pads);
 	mutex_destroy(&vcap->lock);
@@ -878,16 +878,16 @@ static void dcmipp_bytecap_release(struct video_device *vdev)
 	kfree(vcap);
 }
 
-void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved)
+void dcmipp_capture_ent_release(struct dcmipp_ent_device *ved)
 {
-	struct dcmipp_bytecap_device *vcap =
-		container_of(ved, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+		container_of(ved, struct dcmipp_capture_device, ved);
 
 	media_entity_cleanup(ved->ent);
 	vb2_video_unregister_device(&vcap->vdev);
 }
 
-static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_buffer_done(struct dcmipp_capture_device *vcap,
 			       struct dcmipp_buf *buf,
 			       size_t bytesused,
 			       int err)
@@ -911,7 +911,7 @@ static void dcmipp_buffer_done(struct dcmipp_bytecap_device *vcap,
 
 /* irqlock must be held */
 static void
-dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
+dcmipp_capture_set_next_frame_or_stop(struct dcmipp_capture_device *vcap)
 {
 	if (!vcap->next && list_is_singular(&vcap->buffers)) {
 		/*
@@ -949,7 +949,7 @@ dcmipp_bytecap_set_next_frame_or_stop(struct dcmipp_bytecap_device *vcap)
 }
 
 /* irqlock must be held */
-static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
+static void dcmipp_capture_process_frame(struct dcmipp_capture_device *vcap,
 					 size_t bytesused)
 {
 	int err = 0;
@@ -975,10 +975,10 @@ static void dcmipp_bytecap_process_frame(struct dcmipp_bytecap_device *vcap,
 	vcap->active = NULL;
 }
 
-static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
+static irqreturn_t dcmipp_capture_irq_thread(int irq, void *arg)
 {
-	struct dcmipp_bytecap_device *vcap =
-			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+			container_of(arg, struct dcmipp_capture_device, ved);
 	u32 cmsr2_pxframef;
 	u32 cmsr2_pxvsyncf;
 	u32 cmsr2_pxovrf;
@@ -1008,7 +1008,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 			bytesused = reg_read(vcap, DCMIPP_P0DCCNTR);
 		else
 			bytesused = vcap->format.sizeimage;
-		dcmipp_bytecap_process_frame(vcap, bytesused);
+		dcmipp_capture_process_frame(vcap, bytesused);
 	}
 
 	if (vcap->cmsr2 & cmsr2_pxvsyncf) {
@@ -1028,7 +1028,7 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 		 * active (but not used) buffer and put it back into next.
 		 */
 		swap(vcap->active, vcap->next);
-		dcmipp_bytecap_set_next_frame_or_stop(vcap);
+		dcmipp_capture_set_next_frame_or_stop(vcap);
 	}
 
 out:
@@ -1036,10 +1036,10 @@ static irqreturn_t dcmipp_bytecap_irq_thread(int irq, void *arg)
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
+static irqreturn_t dcmipp_capture_irq_callback(int irq, void *arg)
 {
-	struct dcmipp_bytecap_device *vcap =
-			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_capture_device *vcap =
+			container_of(arg, struct dcmipp_capture_device, ved);
 	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
@@ -1054,12 +1054,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 	return IRQ_WAKE_THREAD;
 }
 
-static int dcmipp_bytecap_link_validate(struct media_link *link)
+static int dcmipp_capture_link_validate(struct media_link *link)
 {
 	struct media_entity *entity = link->sink->entity;
 	struct video_device *vd = media_entity_to_video_device(entity);
-	struct dcmipp_bytecap_device *vcap = container_of(vd,
-					struct dcmipp_bytecap_device, vdev);
+	struct dcmipp_capture_device *vcap = container_of(vd,
+					struct dcmipp_capture_device, vdev);
 	struct v4l2_subdev *source_sd =
 		media_entity_to_v4l2_subdev(link->source->entity);
 	struct v4l2_subdev_format source_fmt = {
@@ -1115,8 +1115,8 @@ static int dcmipp_bytecap_link_validate(struct media_link *link)
 	return 0;
 }
 
-static const struct media_entity_operations dcmipp_bytecap_entity_ops = {
-	.link_validate = dcmipp_bytecap_link_validate,
+static const struct media_entity_operations dcmipp_capture_entity_ops = {
+	.link_validate = dcmipp_capture_link_validate,
 };
 
 static int dcmipp_name_to_pipe_id(const char *name)
@@ -1131,17 +1131,17 @@ static int dcmipp_name_to_pipe_id(const char *name)
 		return -EINVAL;
 }
 
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp)
 {
-	struct dcmipp_bytecap_device *vcap;
+	struct dcmipp_capture_device *vcap;
 	struct device *dev = dcmipp->dev;
 	struct video_device *vdev;
 	struct vb2_queue *q;
 	const unsigned long pad_flag = MEDIA_PAD_FL_SINK;
 	int ret = 0;
 
-	/* Allocate the dcmipp_bytecap_device struct */
+	/* Allocate the dcmipp_capture_device struct */
 	vcap = kzalloc(sizeof(*vcap), GFP_KERNEL);
 	if (!vcap)
 		return ERR_PTR(-ENOMEM);
@@ -1155,11 +1155,11 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 
 	/* Initialize supported format table format */
 	if (vcap->pipe_id == 0) {
-		vcap->pix_map = dcmipp_bytecap_dump_pix_map_list;
-		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_dump_pix_map_list);
+		vcap->pix_map = dcmipp_capture_dump_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_capture_dump_pix_map_list);
 	} else {
-		vcap->pix_map = dcmipp_bytecap_pixel_pix_map_list;
-		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_bytecap_pixel_pix_map_list);
+		vcap->pix_map = dcmipp_capture_pixel_pix_map_list;
+		vcap->pix_map_array_size = ARRAY_SIZE(dcmipp_capture_pixel_pix_map_list);
 	}
 
 	/* Allocate the pads */
@@ -1174,7 +1174,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	/* Initialize the media entity */
 	vcap->vdev.entity.name = entity_name;
 	vcap->vdev.entity.function = MEDIA_ENT_F_IO_V4L;
-	vcap->vdev.entity.ops = &dcmipp_bytecap_entity_ops;
+	vcap->vdev.entity.ops = &dcmipp_capture_entity_ops;
 	ret = media_entity_pads_init(&vcap->vdev.entity, 1, vcap->ved.pads);
 	if (ret)
 		goto err_clean_pads;
@@ -1189,7 +1189,7 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	q->lock = &vcap->lock;
 	q->drv_priv = vcap;
 	q->buf_struct_size = sizeof(struct dcmipp_buf);
-	q->ops = &dcmipp_bytecap_qops;
+	q->ops = &dcmipp_capture_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
 	q->min_queued_buffers = 1;
@@ -1218,8 +1218,8 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 
 	/* Fill the dcmipp_ent_device struct */
 	vcap->ved.ent = &vcap->vdev.entity;
-	vcap->ved.handler = dcmipp_bytecap_irq_callback;
-	vcap->ved.thread_fn = dcmipp_bytecap_irq_thread;
+	vcap->ved.handler = dcmipp_capture_irq_callback;
+	vcap->ved.thread_fn = dcmipp_capture_irq_thread;
 	vcap->dev = dev;
 	vcap->regs = dcmipp->regs;
 
@@ -1227,9 +1227,9 @@ struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 	vdev = &vcap->vdev;
 	vdev->device_caps = V4L2_CAP_VIDEO_CAPTURE | V4L2_CAP_STREAMING |
 			    V4L2_CAP_IO_MC;
-	vdev->release = dcmipp_bytecap_release;
-	vdev->fops = &dcmipp_bytecap_fops;
-	vdev->ioctl_ops = &dcmipp_bytecap_ioctl_ops;
+	vdev->release = dcmipp_capture_release;
+	vdev->fops = &dcmipp_capture_fops;
+	vdev->ioctl_ops = &dcmipp_capture_ioctl_ops;
 	vdev->lock = &vcap->lock;
 	vdev->queue = q;
 	vdev->v4l2_dev = &dcmipp->v4l2_dev;
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index 8f41473605aa..c0f7ed3acbfc 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -279,9 +279,9 @@ struct dcmipp_ent_device *
 dcmipp_byteproc_ent_init(const char *entity_name,
 			 struct dcmipp_device *dcmipp);
 void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
-struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
+struct dcmipp_ent_device *dcmipp_capture_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp);
-void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
+void dcmipp_capture_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
 					      struct dcmipp_device *dcmipp);
 void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index 9aba16096d28..a52b3b0e3c37 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -50,8 +50,8 @@ static const struct dcmipp_ent_config stm32mp13_ent_config[] = {
 	},
 	{
 		.name = "dcmipp_dump_capture",
-		.init = dcmipp_bytecap_ent_init,
-		.release = dcmipp_bytecap_ent_release,
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
 	},
 };
 
@@ -88,8 +88,8 @@ static const struct dcmipp_ent_config stm32mp25_ent_config[] = {
 	},
 	{
 		.name = "dcmipp_dump_capture",
-		.init = dcmipp_bytecap_ent_init,
-		.release = dcmipp_bytecap_ent_release,
+		.init = dcmipp_capture_ent_init,
+		.release = dcmipp_capture_ent_release,
 	},
 };
 

-- 
2.34.1


