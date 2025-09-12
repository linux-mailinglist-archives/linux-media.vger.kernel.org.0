Return-Path: <linux-media+bounces-42456-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21756B5519D
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 16:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CAE053AF3FC
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 14:33:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23A8C329F14;
	Fri, 12 Sep 2025 14:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="ym39RtPu"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD964327A00;
	Fri, 12 Sep 2025 14:28:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757687300; cv=fail; b=covJOaCYbGV5zqnzpI97Coj81N9FASR2W6ZVtKAScCH8Fp4c5XS2zyUN9REVLBc2iDOce49BYAnittzAQAQO0QOh20wneOJeN29zmbcljbuiS5WJEvD9DHLztu3LOG1Kc5geKCy4fMQ0sxepYTdS24YV1CVkGslXY9NbPeszOVs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757687300; c=relaxed/simple;
	bh=lcGXKrtBTR0+muZ4H/q9cs2mRpqJvryZ9ywRRPkuPEU=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=uEwUL9jIAjBs2MfmpvZo2yKEgxmhXhuX0M5IuMYMgfDMC+FWE7jRXfbsy5xS4MvnD2RtTbrvi9eVWI5nDV3CzNnQPFehtk9uUAUO+IXmrKFSAzcGtMF3aROxfrn5dYbAo4VGV64XVuWO0S6PPyr9IugSjMjqmOKCI/okFmTOSQ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=ym39RtPu; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CBxkCM029570;
	Fri, 12 Sep 2025 16:28:10 +0200
Received: from mrwpr03cu001.outbound.protection.outlook.com (mail-francesouthazon11011039.outbound.protection.outlook.com [40.107.130.39])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 492fr9rx44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 16:28:09 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qSHkiucAn4XMgnkga+J4INPlO9H1jvImLSyMNJMyjvhTllT82QDArbyA+a71qlQyOwio8fBAGDqeqb6CUNO5u1CzY3QOWRMjsI0HAQS7YFJZEDcYDllrJBB9uL25LUheYSLipWI/Fbsh5ocZDf/ioFJ+cOLVZ6OWK6ecCiI+XuGR0jHhR8ojdx7Wz4R4HOjYDMhhLE9Ue6CDO9CvKdTP92hVSQxwmCTExuYWkDx9UCv3Szrftjpvkw0kMe5i8/kZN3qXPxHKJvcH4+wGWBZ0ikoNEakUDFwnQ/tW7CIuxZjXaj/A5Y9vcOsmEBIGoaLuvkiZJxTwVpdF6m5QpgTsbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48B1jCeHWcGvEh24Vex4z4tVAWeN9gdREcBCcNyyBS4=;
 b=Vw/ABXMYmESaR3eKhwrW5XTwMV8TpIbywB0rMfFVNPnSkZ7g3tap9C6B8kzdzWZ0Kln08cAX4aenHLd8wwZqcDvLomwNo5mTgAvn5m7zWqXDhEtgVpkDSh6ZzPjhe15Er2Gvbnl9jQsJtN1eYSYmq49aoiUSysDbY1Eu5P4fed77hoZd8Y39m5QLO8haHBiUAPG6czIh/thJq+me4DR/21ode6iyY6B4P9EOU7QNLFGWFl/z1tmLKJpORxKF3/XYCeKQTAIyVDaScgtOpWhLcj9ZcP8QgocjUKnV/gZOatXJcPZ3EIVEWM4a02JRTHdY6dgawNtbTr7/b3jTd/xe8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48B1jCeHWcGvEh24Vex4z4tVAWeN9gdREcBCcNyyBS4=;
 b=ym39RtPu8201MeygTgUvpvYn7Z8nn13Xdgtmouk7IbM1tSSAlPdyiYWpb733S9YxiPJXmxy5tgJo5QYuRm9MBQVSKJs3uDv7RoT5vNtjCD5JItbBiNcRBnrcEkaNwhTiIvLReBEW0TFpeNDh3LquDBmo1fp1yCmRYneYLK/FRN/YWurDnAOe7v//Xqx7Vu7uETJkHQ/+lggOBjTYvBeV1eFtE52OQxfjjqqAlutk0rJuOBwVTS/jbVS3d2RJaOABqrCJ5nTeoexYs6ZZcOjlGNBVarV9VygFDKk3LmDJUzeIcdSSbnrAXLfxR9ltzhbnKMCNAl6l2AqsKIasVsFv4w==
Received: from AS4P190CA0030.EURP190.PROD.OUTLOOK.COM (2603:10a6:20b:5d0::20)
 by AM7PR10MB3702.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:135::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 14:28:04 +0000
Received: from AM2PEPF0001C70A.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d0:cafe::2d) by AS4P190CA0030.outlook.office365.com
 (2603:10a6:20b:5d0::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 14:28:04 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 AM2PEPF0001C70A.mail.protection.outlook.com (10.167.16.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 14:28:03 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:20:55 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 16:28:02 +0200
Message-ID: <654ecfe9-962b-4cd3-901e-188d73b539a2@foss.st.com>
Date: Fri, 12 Sep 2025 16:28:01 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] media: include: remove c8sectpfe header
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
 <20250912-master-v2-2-2c0b1b891c20@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250912-master-v2-2-2c0b1b891c20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C70A:EE_|AM7PR10MB3702:EE_
X-MS-Office365-Filtering-Correlation-Id: 292c1553-4bf7-4729-3e1b-08ddf208957a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|36860700013|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?SmlvMnZraG1lK2g3V1BDUnNka21VK1VteVdtVERpQis2OFlFRTJCcVJTM25y?=
 =?utf-8?B?RXJMd0hSN2JYaUo1bG4yNVYwQXNvVWZ3aHU1WGVIZFNYWFEyWUxkTkJSbEYz?=
 =?utf-8?B?WDBGeFU2b0NxSm9IWDNTeHNQc3oyb3RnSWIramx1UDhmMmdTZDFFWTc0Z2Nk?=
 =?utf-8?B?Z0Z2bUFzOC9oUGJhYVVXbStYeTJxYzFqWGgzZ0swOHBRdnE0QXlEdG5iZGZp?=
 =?utf-8?B?aWU0NWtkVURMQXVpa3A4cFpFdzZFbllsK3Bxd2JGTGhsREpZQjREOE1TRDVP?=
 =?utf-8?B?cXRnN0s3ekhBMmsydVFUaVlBUU42SkxYK1RWRDV2bFJRbUdkT1ZKMmx2Vmcy?=
 =?utf-8?B?NjN2cHQxT0lzMzBjWlJOOGgwaVdkT21uRTc5NzhTN21WM2RDbzAvSmlJZDY3?=
 =?utf-8?B?TXVuVE5mWjVDeWR4ajFncW9zd0JVUGwyK2FkWjNpdmE4MWVBM1NFbGNlVWxq?=
 =?utf-8?B?b2llTE5IT2RLM2VkL043NU9DSUdwWWpDK1MvaTRqUDFFb1FMR2FNWjhOS3ho?=
 =?utf-8?B?MkE0SnY1TjBvYlhUNmdqdnA0Mlh0Z1JtQjcyM0czNy9FQURVbFR5Slh1L29a?=
 =?utf-8?B?WHoyNmxGdzRWaGtxdFQ5SUhhc2xLcHh3YkdYNUdaOE54L3JXcys3U3B0cDVU?=
 =?utf-8?B?ODVMNVlyTUlIeUY1M2VlbjFLUW9zNU5CNnNva3BCVm9IUFFsZHRwM1NEbGhT?=
 =?utf-8?B?MGJuSlBGbG15WXJLM3JwN0hkVnM1cm5SRDFVZXZaOU9XQ2NseTlNVGJtaUVh?=
 =?utf-8?B?NDM3bEJNWjQ0dlBQSUdRT05mMUdpOVBHbWVZTTNQYkxseUExOHlrNitIN0VV?=
 =?utf-8?B?UEFERDBhYmEydnJkNHg4dCtQREk3cVprRWtUVldBYnZmcGpWRWVMcmVuaGQv?=
 =?utf-8?B?K2g1K1pYeHNoN29uS2NmU3o3RVRYQVJYb1NWWk9LQmRRaDhCYVA5UlVud0Zz?=
 =?utf-8?B?NFZzMlhodFYydEhzK1BOZmkzWW9ZUGhjVFlPc2VVYUZ5RHZHcmVIZlV2dVdM?=
 =?utf-8?B?Q2RyTERwemNWeTY4Y3cvWWEzcHo3cGhhWWN6V3lQSU5QbTFCem1nK3BBNGhN?=
 =?utf-8?B?M0hVUjhTUkxzR0VQWjRuemMxZlVRUDZDdnU0a3NCS1NwamxWTU1pcURJSURJ?=
 =?utf-8?B?a3ZzQlhCUWtSL00vblZTaDRKTk1Rd2lmcU1PYUxzaFVSR0ZOTnErbDVqS0oz?=
 =?utf-8?B?dFlIOFVCemloM0ZkeldoeEg1cFpYaWR0R1BqUHkvV0l4L3ZYU2FHZUNZemR6?=
 =?utf-8?B?TTlwKzNWNlYxNG9TYndjVlpXZlRCT0xiWklEMjdTK3F4NjJBQ3hLOVpLT1lW?=
 =?utf-8?B?V1gzM0xIOFNKUm9seUwraFZEZnlOTlZ5YnlJNnd5RzRHazVHNG55SjdHWHJh?=
 =?utf-8?B?eEpTY0E4YnZHdHFGUzNNcW90ZW1lV1paVnBiR2VVU2RxcVg5WFlmeW1NRzMy?=
 =?utf-8?B?NkdhU1Rkcy9Nc3VNelkxSVhhYXpHdFp0ZURQY0NLNldRRDFIQW9SblRTUzB5?=
 =?utf-8?B?TjB1Nml0UnhXS0hHMVowbUFPa24vb1JTZXVVMTczU0FDTmtSajE1aDFkaVpO?=
 =?utf-8?B?TGhnNVVKMDc1RFNjWlArNDQrdm5HQ1hCZzh6OVdFWmU0QW9ZeXRpcFV2Q2RE?=
 =?utf-8?B?WEsvS09xRk9MVXYyU0VZb3RUY2VKRTkzemRRbnhYSVltalJBWS8xVGcyOE94?=
 =?utf-8?B?eWYrVnlUdENYTTlwMmpGbFE0NE9YYTVlTms4aUlycDl4UnJ1RVFqMnQzN1lY?=
 =?utf-8?B?ck5jMUN4clRHV1NodDgreC9MWmF6OFNUYzRWZk9IOGxXa1FaZVZBbkJ1NGl2?=
 =?utf-8?B?UXZlR251bkhscGdjSU5YdUYvVHFBbGVIemJxZEVyQkd1U0tYSzVrQUVXcGp1?=
 =?utf-8?B?VUZxV2FVZlU5T2tHWWhZdnV6SzkwM1g3NFoxcW1UK3VHWkZSRU5KUkxhaWpk?=
 =?utf-8?B?SU0rcWNmYjN5b2p3ZHltRG9MRW9ZdXY5V0ZvUHhrUzhNRFprTTNOaHJ0Q3pS?=
 =?utf-8?B?MGZyeUJ6ZmoxdEZkbjFGQlZvUFRCRnFhakpTSzQ3dDU3T1k1RzRPbE9uc2lm?=
 =?utf-8?Q?HF11Q6?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(36860700013)(376014)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 14:28:03.7099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 292c1553-4bf7-4729-3e1b-08ddf208957a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C70A.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR10MB3702
X-Proofpoint-ORIG-GUID: icO6HZ5SJ13sGNBPIhsoEUhC6SEp_2jm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA5MDA3MCBTYWx0ZWRfX9XdBpPyxrzue eVgoT8ViGYIH1nfp3+Qv4V3UK8nbEjdQgrvkN/KqBsYP8xYIxC6O1prFxvVYGQucYzGQCKycsFQ KGZFX/4VpITTBIzrDRR78iOWuCj814JTIHBDQHC8mLwv1L/v2DFanhe7nT1ZHD3EB9Q/SWSlv4G
 eBYdP/+vCSmi+KEo56go98oMDh+MZVwUAUc2gcNO+e53QukTFHUo+0S/GEAwFzs4L3JALCEcaMx OuUkjfGFzoN2F/LBABaOHt5lCsy0vdlyqUBUfKtOj+g0a9vsbrYlELL2fI98QR4lOMbVYZOjIyC 2tlvpOuDOgelQYXei0L8dmCBQtw+GJyCMSgqqxPga17qRWIToISqt9LidhASPIkzKF0Taj+oYVC 5buKI4aJ
X-Authority-Analysis: v=2.4 cv=We8Ma1hX c=1 sm=1 tr=0 ts=68c42df9 cx=c_pps a=6Ff6iBxcIZrrjdTuZiKJ0A==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=GGR1j4CU8oaUy6QuVE8A:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: icO6HZ5SJ13sGNBPIhsoEUhC6SEp_2jm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011 spamscore=0
 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 impostorscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509090070



On 9/12/25 13:36, Raphael Gallais-Pou wrote:
> Driver is not used anymore.  Remove header file.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  include/dt-bindings/media/c8sectpfe.h | 13 -------------
>  1 file changed, 13 deletions(-)
> 
> diff --git a/include/dt-bindings/media/c8sectpfe.h b/include/dt-bindings/media/c8sectpfe.h
> deleted file mode 100644
> index 6b1fb6f5413b8c5fbcf7dc2d786468ee3428caaf..0000000000000000000000000000000000000000
> --- a/include/dt-bindings/media/c8sectpfe.h
> +++ /dev/null
> @@ -1,13 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0 */
> -#ifndef __DT_C8SECTPFE_H
> -#define __DT_C8SECTPFE_H
> -
> -#define STV0367_TDA18212_NIMA_1	0
> -#define STV0367_TDA18212_NIMA_2	1
> -#define STV0367_TDA18212_NIMB_1	2
> -#define STV0367_TDA18212_NIMB_2	3
> -
> -#define STV0903_6110_LNB24_NIMA	4
> -#define STV0903_6110_LNB24_NIMB	5
> -
> -#endif /* __DT_C8SECTPFE_H */
> 
Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

