Return-Path: <linux-media+bounces-42458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D1E1B5528A
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:59:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4319E174C22
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:59:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE4353126C8;
	Fri, 12 Sep 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="DUSVg9Qe"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292AA30EF70;
	Fri, 12 Sep 2025 14:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757689162; cv=fail; b=F0MgRjGoDqfcPiMYXtz39YAYi8XVvR+c9IytP7Z3xnswEEISDmonmJ1H3X1enj5aAgtLmWBKqb6mrdOO/ynRVzQIyxhDACyZitraEiukSnbiyR+869Yd6w1NEZjSPyHDkQzfLE8viPZf+fbsF6Je2E3ZgiLP4/lEUKYzk/GnCuc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757689162; c=relaxed/simple;
	bh=boO49nNIR5/Z9s4ZNVLhUozJB6zr6kIZYgqn7w44M+g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=ksreeeC7Y7SjHOM88NIaX06o/1Pt/db/O2zWkYKgbAImHkckqGoe2Me5r9wnpenLO3OpOU+GZfb9cOYUUqE2ChGxrWsrDp0MV2Z1LumLthQQLaUjTVHELrVv0Bjki0WDxZU7HC0EWX+2Konj85A4nAGAjh3Zpei7xZ7bWKe4ix0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=DUSVg9Qe; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CEo3ce024858;
	Fri, 12 Sep 2025 16:59:10 +0200
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011066.outbound.protection.outlook.com [52.101.70.66])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4929f1ackp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 16:59:10 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SMZRV7Qtm/FdcqI0xoVIGHFjtCpRhQTs5xlLVFXZpJLSrEue5tBnGEpAcOgsh0z3gUGhR3xhxQ1B7GvEAnkAk0Sxgo+/3qGQYTxoGTj5d00l7+FvLksiIXrotpiJGg8BKjU8yLUlA4C1JGJ070gq+90TIwXgSkGeYexr0F7eg5RWq/RGALUe1XMiYTxYawT/mKOEgL5BNaQubf5ae2CY0jPBMWv+WJkznP4RsV89zg6gpa7TyGIUtPsjv7cdKIY7bPkPrvQLnrfUp481QNy+xn2Krw0/mrjRjs41IgxWgfnM6wNdcVjIaYcfykgFX3bdehjLlK6Qavyl+d2cPTNwkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cII0suIFjVoUnb54yoB5AoO9OaBOfXzrZCOlODtNSQQ=;
 b=RQdyN5qcHB88qDj2f/TVz03vY9h5L1sq+P9zUPhvYXdfxi/oAYGHtcJclaAq/fQFlG1pjvo3s3gr2iVAB/tbxW9HECioB4mpqs/dpLJMjAwJBvlzedFnjwBMVwe7LDv7uL+Jsb2DcgoPl9iEQ3Oy96C+nM1RjJfCqOyRoxVNtEfpLhLv+riJ/kxHkoBf0kLs5MAQgA9vz3eVUq3nJm97KokdznJiUrpcXFbQK28QJGUAITJeb7fkglbLkpSNTVZ7T0O1mgNwVv5bZufxJAeQaMcJGT+o3o2GMN5KyX9MRM+cllllSfo5FbMRvf42ajhSnj/ECy+xWTAQqXi7hWNqyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cII0suIFjVoUnb54yoB5AoO9OaBOfXzrZCOlODtNSQQ=;
 b=DUSVg9Qeai3wleDqE2B9EuJKNcITVeWlWWfy7VPPotudnO9WMj2XSSAwHjm9UDRmhH9Pvu0gF32hMKaebngd8uqMRxtRB5uYP3WfTTTFKjzSvNh90o6IFo/JsT3I9VN5DapmINjXmXsvk6dgkncyAcgpoonoM2/TJwOOzVbUJBJsfPW3FzdEdFMhpnKTVfw9ZfCy5DBr8BQ/DDHYfhFF8csBlQkau5yF/A6w7wQvnA/Tqensr91X1rCPh2enK9faAbUxfo90vEiBpHsnX7WTtxtf2mze1WUL/cj2lpipIV5mm8fjnXMqBjjsMvzEwEz2WLuUJd41OmVIQy21+ZNeyg==
Received: from PR0P264CA0226.FRAP264.PROD.OUTLOOK.COM (2603:10a6:100:1e::22)
 by VI0PR10MB8935.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:59:05 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:100:1e:cafe::42) by PR0P264CA0226.outlook.office365.com
 (2603:10a6:100:1e::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.17 via Frontend Transport; Fri,
 12 Sep 2025 14:59:05 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:59:04 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:51:56 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:59:03 +0200
Message-ID: <23dfcdcd-c0fe-47e0-9c59-d9e2fa83d713@foss.st.com>
Date: Fri, 12 Sep 2025 16:59:02 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] clk: st: flexgen: remove unused compatible
To: Raphael Gallais-Pou <rgallaispou@gmail.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Michael Turquette
	<mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-clk@vger.kernel.org>
References: <20250912-master-v2-0-2c0b1b891c20@gmail.com>
 <20250912-master-v2-4-2c0b1b891c20@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250912-master-v2-4-2c0b1b891c20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|VI0PR10MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: f85bac95-49e2-4c38-84ec-08ddf20ceaab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|82310400026|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NHJkSlkvZGRLZDhXcG92aTI4R0JCUkQrRVdVZ1puUit4dzZtYU5HOXk0ZC9G?=
 =?utf-8?B?azlhSk1lZ0FnMVRjaGJndjBQV1ZKRzBNOHhoTnNQRGQvWGhCR2g4ME9MQ1Fu?=
 =?utf-8?B?Z1EzUFZiQURKbUkwa0s5UGtwU0t3aXFxSGx0MzlOMENlR1pNc3U0T1NtWU9i?=
 =?utf-8?B?anVmZXBMeXplOWpwUkVrYzdPTDdZeGw1akM3QjJCYkg0ZU9Fb0JPaU9VRjdW?=
 =?utf-8?B?ZlY5Z3QvTTU1LzZqeFRlS0QySjI2eDVjOHcwYk54Q1RWRXNvdjVxaHNYZytF?=
 =?utf-8?B?eFNMTUY1T04yMkgyYm5VVjZ4VjVybVY2U0VuSWgxUE9ROFFPaDJONjh3djBC?=
 =?utf-8?B?eUJDSXBsaHFXeWVBeU05dnYzTHplemtBWnM0M0I5SnZ1cjhNcnh4SWJWWks2?=
 =?utf-8?B?dWRKaU1RcDFHWmsvQlRJa2Y0NGpKUy9qZUZndEtBY3FxZzY5R0ZSRW1oRUJj?=
 =?utf-8?B?d2VYTERHdWNQeTV0Skw3amluOG56bG9pSTZBK0xzM2RBZVB1cGNRQ1dFNTdl?=
 =?utf-8?B?V0hjek9Id1k3N21rYmJTR3NMdWcxbWtQQWFaL2J2ZXR6bUVkZXBmRk1seWcy?=
 =?utf-8?B?K1dWbWtPWFRpUDd5enJLNE5Nc3l5QkhOck5kbnRyMkh0eFZ3QkJpL0FXUm9j?=
 =?utf-8?B?cEdZUmhoTnpjZjFNaW90blU2RURubjFFSmljUnJKL2ZVb1F0NkVIaUw3WmVB?=
 =?utf-8?B?ZTRLMUkvZkN6OXU1bmtQc1N5NEgxTDZLM1NUaHF1d3lET2dEMmlpeFRabkhU?=
 =?utf-8?B?d1lLMEhpRnVkTHN5azJlc0lBK05mbmx6MHNOR3ptTlR3SENqMlNsSXU1Qnlt?=
 =?utf-8?B?aDNQYkwvVWdzZGM1UFlZaldXZ2Z1VVBPUU91TW9RN2JmU0VnSlRqcmdNU043?=
 =?utf-8?B?azZlVGtGV1dIRVJXVDRacSt5N3JrZk40NG9Oa2t0elJSd01ZZWNUY01iaEJ0?=
 =?utf-8?B?MmRIWlJFZWl6d29xYlAzcTNYQmRXTWkwV2tvcFNHU2REN3dNM09nM0RHb3Uv?=
 =?utf-8?B?N1M5aTFxUkFlMWxsWnFaelMwd1FaTE9sWmxzYUxqd1ZPTkFKTGpueXJBV3A3?=
 =?utf-8?B?LzhLREVOQWZnL01iczBzaGVBeU1UcnhURWlDTEQ5M01NUGNSOFBxd056RzIy?=
 =?utf-8?B?TUJlYnJXNjQ4UFh3YUQrc29LZC9hTnRwVk5IL0pqKzc2dytMd0pLNkxDZW1h?=
 =?utf-8?B?dHovdUwwRHdqV3g4UXZiZU81YTVnYm5BQ05rZkxZQjF3bTZ4RkN6ZGZnNmRk?=
 =?utf-8?B?Z2hQcHRJOHE0ak5yQkdoYTk2MDhQMTRsQW85ZmxDcjVsU0pWY05RcXRqZWxm?=
 =?utf-8?B?UWV0ZTJNMjM0YzJ6anBrdEg5S1hWWnB1OXdFdmExNG50QmovOTlubGk3TVF5?=
 =?utf-8?B?b3lRL3A0VFpiYTJtQ3l4MmJMWlFsdVRQckFzaFk4Q2k0ZjB6ZjhhdDY2RzZD?=
 =?utf-8?B?elZrUXhYeWhDcVY2OHZPd3REK2dVVFFsYVNiSVZPT3UxYkFXa1p4RkcrYjlV?=
 =?utf-8?B?dlFZUk5LOFdEcFpnTUk1Q2VORUZFaHF2RjVxcVdJL3A5MldwWHpPb2MwTjBB?=
 =?utf-8?B?RzFndzJNUSs2UUhGUVR4V0hVbWJaanFVUDVsTU8rL2lKWTBMbnJLOU9JdXgz?=
 =?utf-8?B?YzhFQVh1TjBMMmRRcURGS2J0a29mYVhYT1lTSlhnQXk1TkRBMjR6UkpJVC9T?=
 =?utf-8?B?U01NV0V0aHFzWEZWeFI0SUxOSkdhbG5TRm9TOEUxeUVqYmFKbEMzQVFkN2d4?=
 =?utf-8?B?THVtUDF1S0NNZXBlUVh0Q2g2QmxuK0NXaCtXdDZEc2F0L2s1cjdSNCtMejJ0?=
 =?utf-8?B?UlQ4QUtyZGhkVTZpTjY2YlJZOUN1LzFaSEcyYStRU1dxUXo2QmNOVHJNWVVo?=
 =?utf-8?B?Ym1EZ3Q2VmhhQjVpK3hSUk1oc1ZLV3BNbklGL1VDK3R4c1ZRQ1d6ZjJkK2Ew?=
 =?utf-8?B?MExIMkhLSzhBRTRSdEIvam9mcytWRVdvVTR5VXM2eUd2ZXlrUzRYUENQQUtv?=
 =?utf-8?B?RllYN3RIcCtxM29meTY1TmtmUGVhU0hZNFgwcmlSanhkMUsvVUtUaHhBRHhD?=
 =?utf-8?Q?ZF7/Ev?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(82310400026)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:59:04.6113
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f85bac95-49e2-4c38-84ec-08ddf20ceaab
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8935
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=68c4353e cx=c_pps a=r7EIZDVNRsCIl7asLYOvbA==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=88iKDjgjSppyayPZQX0A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: nyZut5EHWM2PKKEI6FZICEYGTrxI03BK
X-Proofpoint-ORIG-GUID: nyZut5EHWM2PKKEI6FZICEYGTrxI03BK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDAwMCBTYWx0ZWRfXzb/8+y1ZgvtJ 3+lEpPqyzMyNUACNnHTbC6z2GLf3my5stcgNZPLlDGsNk7uTTeLEKryrW5qfENhShMAQlUTX1XA mGemo7uR/jV71bvh3vdMnVN5rNXCNr0Q4fhUf2ZrfUQDXeVgh36iWcrnU1/y3w/znnjU8cUcYCo
 SPYKzLlVPPDJLrsbYvflfi3B0IBIWpRvHjABhL8ybP+HWUxQSZg/kdaCkxNqE42C/YD7jvne5e7 ygBTPInWQSk+LHnpdS5rsO/XZmZ29g6ZKRQljHlk6nbaTFcb3MWEhV2sTW49A8UfkvWd2EHkdUK B2HG4Y6MmtOUODgj7cpSa9g5PSZuV9nvzAkSR18OcgRk5nqDbkbeyJUq2YV96U6p59odhLY+0xp 4EXIXfYX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 priorityscore=1501
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0
 malwarescore=0 phishscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090000



On 9/12/25 13:36, Raphael Gallais-Pou wrote:
> Following B2120 boards removal in commit dee546e1adef ("ARM: sti: drop
> B2120 board support"), several compatibles are left unused.  Remove
> them.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  drivers/clk/st/clk-flexgen.c | 80 --------------------------------------------
>  1 file changed, 80 deletions(-)
> 
> diff --git a/drivers/clk/st/clk-flexgen.c b/drivers/clk/st/clk-flexgen.c
> index 5292208c4dd8b45edfe7c2722e934dd0299c6d34..e8e7626c76db06b2255908a6658bca1f42600c85 100644
> --- a/drivers/clk/st/clk-flexgen.c
> +++ b/drivers/clk/st/clk-flexgen.c
> @@ -303,16 +303,6 @@ static const struct clkgen_data clkgen_video = {
>  	.mode = 1,
>  };
>  
> -static const struct clkgen_clk_out clkgen_stih407_a0_clk_out[] = {
> -	/* This clk needs to be on so that memory interface is accessible */
> -	{ .name = "clk-ic-lmi0", .flags = CLK_IS_CRITICAL },
> -};
> -
> -static const struct clkgen_data clkgen_stih407_a0 = {
> -	.outputs = clkgen_stih407_a0_clk_out,
> -	.outputs_nb = ARRAY_SIZE(clkgen_stih407_a0_clk_out),
> -};
> -
>  static const struct clkgen_clk_out clkgen_stih410_a0_clk_out[] = {
>  	/* Those clks need to be on so that memory interface is accessible */
>  	{ .name = "clk-ic-lmi0", .flags = CLK_IS_CRITICAL },
> @@ -324,51 +314,6 @@ static const struct clkgen_data clkgen_stih410_a0 = {
>  	.outputs_nb = ARRAY_SIZE(clkgen_stih410_a0_clk_out),
>  };
>  
> -static const struct clkgen_clk_out clkgen_stih407_c0_clk_out[] = {
> -	{ .name = "clk-icn-gpu", },
> -	{ .name = "clk-fdma", },
> -	{ .name = "clk-nand", },
> -	{ .name = "clk-hva", },
> -	{ .name = "clk-proc-stfe", },
> -	{ .name = "clk-proc-tp", },
> -	{ .name = "clk-rx-icn-dmu", },
> -	{ .name = "clk-rx-icn-hva", },
> -	/* This clk needs to be on to keep bus interconnect alive */
> -	{ .name = "clk-icn-cpu", .flags = CLK_IS_CRITICAL },
> -	/* This clk needs to be on to keep bus interconnect alive */
> -	{ .name = "clk-tx-icn-dmu", .flags = CLK_IS_CRITICAL },
> -	{ .name = "clk-mmc-0", },
> -	{ .name = "clk-mmc-1", },
> -	{ .name = "clk-jpegdec", },
> -	/* This clk needs to be on to keep A9 running */
> -	{ .name = "clk-ext2fa9", .flags = CLK_IS_CRITICAL },
> -	{ .name = "clk-ic-bdisp-0", },
> -	{ .name = "clk-ic-bdisp-1", },
> -	{ .name = "clk-pp-dmu", },
> -	{ .name = "clk-vid-dmu", },
> -	{ .name = "clk-dss-lpc", },
> -	{ .name = "clk-st231-aud-0", },
> -	{ .name = "clk-st231-gp-1", },
> -	{ .name = "clk-st231-dmu", },
> -	/* This clk needs to be on to keep bus interconnect alive */
> -	{ .name = "clk-icn-lmi", .flags = CLK_IS_CRITICAL },
> -	{ .name = "clk-tx-icn-disp-1", },
> -	/* This clk needs to be on to keep bus interconnect alive */
> -	{ .name = "clk-icn-sbc", .flags = CLK_IS_CRITICAL },
> -	{ .name = "clk-stfe-frc2", },
> -	{ .name = "clk-eth-phy", },
> -	{ .name = "clk-eth-ref-phyclk", },
> -	{ .name = "clk-flash-promip", },
> -	{ .name = "clk-main-disp", },
> -	{ .name = "clk-aux-disp", },
> -	{ .name = "clk-compo-dvp", },
> -};
> -
> -static const struct clkgen_data clkgen_stih407_c0 = {
> -	.outputs = clkgen_stih407_c0_clk_out,
> -	.outputs_nb = ARRAY_SIZE(clkgen_stih407_c0_clk_out),
> -};
> -
>  static const struct clkgen_clk_out clkgen_stih410_c0_clk_out[] = {
>  	{ .name = "clk-icn-gpu", },
>  	{ .name = "clk-fdma", },
> @@ -482,19 +427,6 @@ static const struct clkgen_data clkgen_stih418_c0 = {
>  	.outputs_nb = ARRAY_SIZE(clkgen_stih418_c0_clk_out),
>  };
>  
> -static const struct clkgen_clk_out clkgen_stih407_d0_clk_out[] = {
> -	{ .name = "clk-pcm-0", },
> -	{ .name = "clk-pcm-1", },
> -	{ .name = "clk-pcm-2", },
> -	{ .name = "clk-spdiff", },
> -};
> -
> -static const struct clkgen_data clkgen_stih407_d0 = {
> -	.flags = CLK_SET_RATE_PARENT,
> -	.outputs = clkgen_stih407_d0_clk_out,
> -	.outputs_nb = ARRAY_SIZE(clkgen_stih407_d0_clk_out),
> -};
> -
>  static const struct clkgen_clk_out clkgen_stih410_d0_clk_out[] = {
>  	{ .name = "clk-pcm-0", },
>  	{ .name = "clk-pcm-1", },
> @@ -596,18 +528,10 @@ static const struct of_device_id flexgen_of_match[] = {
>  		.compatible = "st,flexgen-video",
>  		.data = &clkgen_video,
>  	},
> -	{
> -		.compatible = "st,flexgen-stih407-a0",
> -		.data = &clkgen_stih407_a0,
> -	},
>  	{
>  		.compatible = "st,flexgen-stih410-a0",
>  		.data = &clkgen_stih410_a0,
>  	},
> -	{
> -		.compatible = "st,flexgen-stih407-c0",
> -		.data = &clkgen_stih407_c0,
> -	},
>  	{
>  		.compatible = "st,flexgen-stih410-c0",
>  		.data = &clkgen_stih410_c0,
> @@ -616,10 +540,6 @@ static const struct of_device_id flexgen_of_match[] = {
>  		.compatible = "st,flexgen-stih418-c0",
>  		.data = &clkgen_stih418_c0,
>  	},
> -	{
> -		.compatible = "st,flexgen-stih407-d0",
> -		.data = &clkgen_stih407_d0,
> -	},
>  	{
>  		.compatible = "st,flexgen-stih410-d0",
>  		.data = &clkgen_stih410_d0,
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

