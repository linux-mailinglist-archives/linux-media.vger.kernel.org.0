Return-Path: <linux-media+bounces-52021-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wMyFBiawgGn6AQMAu9opvQ
	(envelope-from <linux-media+bounces-52021-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:09:42 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC2ACD297
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:09:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B8FC130927CC
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B285F36CE04;
	Mon,  2 Feb 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="AWZRye9c"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0D136A012;
	Mon,  2 Feb 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040695; cv=fail; b=jM6KvpaTEkX5thcpGk5URVsVSuFScH4bZ0vaGfNFSLr/Qyl75mLwiKju6TzwvIhjI/PIZdGJPRtnJM/MIeM7mhRsIaJaTCf7Yh4kuxWOQshT3RT9yi6dOFeNu8NJ8dG7gjbH0h5JHoU5JbZHdYN++Kopr7BJGAxaL7n2+mktdRY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040695; c=relaxed/simple;
	bh=xls2GFaFl8RwD7O61Kza8/8Kffsrdcf7JYyHlFkHSHw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=mO5iLdyWgKMcoP10KRZoeabRroPh6YvvMTZpXwJxvzeMoNwnNoyFJ6Mt7+firvmGU6FTQtpB/mgoZRfq/ycHMZRun0J0iAu9o5yvzLNs8DMnAV6hqhk7KCi3K7vQJueKPV+2YxvHqal0jaMhKYq2eZrriaeZcxSEzFhMcGn6nGE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=AWZRye9c; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DmTNo2371893;
	Mon, 2 Feb 2026 14:57:57 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013006.outbound.protection.outlook.com [52.101.72.6])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1v654dfp-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:56 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dbKLzsjTUkv8McwYzAQhuw468dHpgTRLgzOe1Rqlm8xxRc7YMbfeS/EhUXM4WWKk1TnuSHVTBKEBZihpmIVN+1ckiV7twmMKjcZYOxmSBtfbJjwzauOpdHA0GNri2j9LySnvzV54RhdBhH2DUw84b5nWfJqQbOf7tvRsJH9Q3Gs49gKmPBc1HpA9nMdv7oA/exyl0Pf9mtM2TefQTS6U4hb1XH1VWFpvRAOjwNlJxvfH0YC7KErZNhXyNi4V0KFRItl6mKGyOMeyUd2hmPChKzOUsJhkoALUqMEqDTyPNcGmAZJd0wBhN9Iz3/GjC67GEZep1SDc9FtTGIw78FY+dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UDXs3NUVh4lqsy31xUUf4fYjv3K6xAsm/8geEs0rf6k=;
 b=G6IkY9tn6RK7TYsgFVeOUsyqfLUS+/7zO9+iSpd0iAnEshPUwup9pxJXY5eOoXZr4P1kh6CYW85GAqSwuXkhR6+S25bZRwHtvBTVDxHHpQFNAYHOluX3mgaynPA2WuW8JJyTOEEDRtLDrll7ds3wDGBr6fUxviYybkdnjTM+N71sVeubUjc+ZzNjNiBE8K9Tm+jS9MpxNY1UvB1NENrCwM8ya2GBKC68Io4wkKfQqjvMpXQfkBCEKuxxg08yTKLtyFbXrUrxw/uMrpvWWlnowL0t7gGDIdiVxvYFQfNEJxw6gxYJWMNXXItfH2/lYVOjFPB5JzmpxqYvOR/zyBnW/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UDXs3NUVh4lqsy31xUUf4fYjv3K6xAsm/8geEs0rf6k=;
 b=AWZRye9cHmCGGlkwxtexs4LJ5GRT/nt4dsxfXB5lfHtktW0UTA7goqAkYFSlepu7fQgUBU1CL+N603blCPIxOQwoWzwpuPdKb89ogI5UXlfJkAPWcNuB9qfhS0UoqtK/FjmJXHFg6/d/fOZGsMJ5eUY7NO3VBCSdwxK3kGxQuiPLDHU4/ry1qXTQ8lvoQ3pDYYvQxGr4TGSXIfLxKksukJxuN5ejWucoDyh3ysEd0E7XQbvGvLFxGflvZ8TUgres66vcZiWn6gRIFWIgLNV+ATYxeKbl1W0x3YSBnu2ijgWs5g1Es9G5FmvsdiaRtxKKwltbja9TEl+Sx8qAjCRVbA==
Received: from CWLP265CA0435.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1d7::8)
 by DU4PR10MB8832.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:560::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:50 +0000
Received: from AMS0EPF0000019F.eurprd05.prod.outlook.com
 (2603:10a6:400:1d7:cafe::54) by CWLP265CA0435.outlook.office365.com
 (2603:10a6:400:1d7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.15 via Frontend Transport; Mon,
 2 Feb 2026 13:57:53 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF0000019F.mail.protection.outlook.com (10.167.16.251) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:50 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:35 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:49 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:34 +0100
Subject: [PATCH 09/13] media: stm32: dcmipp: addition of a dcmipp-isp
 subdev
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-9-8d8d51f5e014@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AMS0EPF0000019F:EE_|DU4PR10MB8832:EE_
X-MS-Office365-Filtering-Correlation-Id: 88c49902-704b-4025-4162-08de62630dcc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|7416014|376014|1800799024|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QVZ6ZGRhbzhlckdpTDg2dnhWWjV1SzliMlpNNHdwQW1UZDFSOFJBb2t5MlIv?=
 =?utf-8?B?Q241VFJiK21ld3VhOGhqQjgrYWVPS29IckdneTNvZjFiWnZOQVQxdjBNbWFj?=
 =?utf-8?B?eUNwcENuTlpuRUk5UUNKQjB3VVJzdEc4MXZvN0RlcHdCdzR0Z3RCK25hRWkw?=
 =?utf-8?B?eUZhVUxaOFB2MHM3M1d5NVRZZ3JYTjkza0xMcWQxSzR1ZFZVbnIrTmd2TEdn?=
 =?utf-8?B?ZTh0MVNTaVFqUWQ0eGpKeXgzbE5tVmRrY09FbGFKT3JGQzJCOXJQbWFpUDRI?=
 =?utf-8?B?SWZxT2xHQnlibEZqWkVrUnRpdnhHdTArTkF0aCtTeVZSNFpRKzk4OVptV0h0?=
 =?utf-8?B?eHd5RXY4WVE2bXBRUFV1cVQ3ckV1ZDFDZ1ByN0NhdGpYSDlHWTNiWmRYWHJZ?=
 =?utf-8?B?RUpYbU96WjVrL1NsNUFGRDl6a2NsT0lxQ0F0NEtxcmNjMDZTTlpmWm84ak1N?=
 =?utf-8?B?NWF1TnVWeTA3VlozSFV5WDFqdDJpWXlZbjRDREczN0psVUN0a0JoZW56VHNB?=
 =?utf-8?B?WkNwZ1g4MzZVa29zaVBaNXVBUkZzKzMvbUZCSWx2VUxiM0V1ZktoekZYSHli?=
 =?utf-8?B?TUdIWGJaUDdEdXo1aUxWMVZxT2xMQ0tFSWg3WTRhdEV3VnlPWFMvL0o0dTBW?=
 =?utf-8?B?bEJzZlhUQzdvY2lCcU9XTy9kM2JOdVJLRm1YVVE3ZDJvZzBmN2JabzhzOUg3?=
 =?utf-8?B?TW16UjJzdzhCak4wYm8zdmVtZGhFUjdzSzRJVEpBdmlhYXdOdUUrbmphcklI?=
 =?utf-8?B?a2lXOFJWK1NhczlBUCs1WHd4cjVwNVZmdDR2N1lxeWpWV2UyUmJXV3dFcU1l?=
 =?utf-8?B?ZmV0ZitJUTl5aks1dldJeUxmVWt3ckJYaWdhMHJFUGhaVm9yak1adVRzbGlo?=
 =?utf-8?B?RWo4YVRIeXBrcElBRU90UngwM0lFMEVLSDRkNnpOY3VySnBKbDdONWdHYWMx?=
 =?utf-8?B?U1FzaERSeHdRRVlJdmdGVmVxYjNnbTRSYS9MelE1czRZbWJIVFlaNk5Delky?=
 =?utf-8?B?ek9jS1FBc3FrdldCNUFzZVhiMWdqcUdzUERmMVhCZzBWcktCR1JFS1NQWEU0?=
 =?utf-8?B?dmRBck04RzFrTFRReDBnTHdlVUl3REZ5eFdlWmRnSTB4S1hvNlE4VHhZOEI2?=
 =?utf-8?B?R1lCOWZnZUZCMGtzQWd3UFVVVW13OXh3c01FWnN0cVZmL1RLMGF0SUl5TjR4?=
 =?utf-8?B?KytWbGRoS2ZReUxjWU5UZ3VPKzZCcnJqZkVoMVJTaXlXMWFWdXJOVlRnb1hT?=
 =?utf-8?B?WThYM05WUnRIZ0tSNVA2S2RpTGhZQnA0bWVIUEd1cFAyYWlaOGU2djB0ZVN0?=
 =?utf-8?B?cTFMMmpKblFKOUNLTExzNlJPY2pKRUdzVEp4WkNXS1Aya2NLeEtIZnFDNTRJ?=
 =?utf-8?B?djVSTkhCd1ZVUFJBUEJZSm1zTmlOWHNQK05ISTUzRUI2MFN4SEJEcjR6NlpQ?=
 =?utf-8?B?Ynp6emZVSXJqR2M4QzNzeDM0eU1QVUp6d0J1bFZaMEhkelducmxHRk1aZm4y?=
 =?utf-8?B?dVZhOWJwN0JTck9mVlJ1Mmt5aFlEcFZXaWhGaXlqMjlvZERsV1ZvM0dRVS92?=
 =?utf-8?B?MFh5dkhjK1o2cjQzSkpiUGtWQ2haV1FadGxEQW5ibWgxLzZOMUJ5cnJ4RWV6?=
 =?utf-8?B?Nm1heDB3VUdUWlpUVEhFN1ZoZ3NRd2o5cUZEUmZMMklJcklHRHZTeFAyUVhW?=
 =?utf-8?B?RUp1enBkZkRKdit3N2t5TzVnbFozdzgvMThkdUx0YkFzc2lNelVETi9yczZZ?=
 =?utf-8?B?M3diWkhTVzFTWnF0NmkyY3R0Z1dMaVlUMjZlbFpiSEFkM3dZbVl2em5DS3Jj?=
 =?utf-8?B?NkEzWC9SZzZtRVh6MTFwSXEycDFUM2FQell3cUJrN01UK3UzRzlNUWxMYkJD?=
 =?utf-8?B?eDlhYjhUQXZ1TkZkeVQ2U3FmNWRQT05HaXZiUzJGd25tbkhMZnFZdjJXQkxG?=
 =?utf-8?B?RFpzWXhLbEg1czVXdFZURVBoWURQcmdtdWlHNU9JU3BZaWJoaE1jdkdad3Iy?=
 =?utf-8?B?NmZCRUFjNFN4a3pHVzlrbXcvTkxMSjh6YTFweUtPcjVUNEtYWXR5MHRxRGZ3?=
 =?utf-8?B?dEhwSkdQaUdZLy8vc2o3NkRiUXg2TTVPSmZUR1QzdmcrVy9ncTFUUTN4eHFq?=
 =?utf-8?B?YkhNendKTXBGZFBhcEMvK3ZJbklCV3JjQmRpcGRDMWpVcTVZNFdlNnFsSkZI?=
 =?utf-8?B?bUh6OUk1bTQ0RU83UXhzSHBWenJxYmhQcXUzcU5aSi9rdnJmVlRXZVR5eGtC?=
 =?utf-8?B?bVM0WEVJcUFiT2JVL2lZcHhQbFhnPT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(7416014)(376014)(1800799024)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NKjCx2UBW4shnc+SEFroLe81oKTTtO6X8wW1KtYRcZkELgeLwiw2/6q9mQzJVDmuL0JKvA7LrCzvxZek2bI41wfLPe3n2Vzz7Jn7dV+to55wNpLb9tEkXbijFdYmqzuzZ/SBx2kcrxZyAkPHbS2HqfdZOvsdCha78bC4FMRey1B5xEZe/z0oI/Kh9eYwSxLMFii6Fwl62oqz8ELq59GLYS6QqxfD6xao/LWHNxw6iu0OpBdCy249g1U5wJX2ggle/NEWfIrzNLzwRp5MeYReBNuAtcCdizubZZw3P8GMSU4tNkRtV0NQN9pSrTO56egaGjSHHTreR3UYFwOdgCHfFw9Fy0bNtl2ug56TzyM8N+vDrtQWa3Ko22uPInx6HrizOZ0l0+NFuvOy6dlxbroHEvZBoUSYf70acIJN8HzPDnakvtLnNKl8PmhzGZFapLHg
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:50.5075
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 88c49902-704b-4025-4162-08de62630dcc
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF0000019F.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR10MB8832
X-Authority-Analysis: v=2.4 cv=XvL3+FF9 c=1 sm=1 tr=0 ts=6980ad64 cx=c_pps
 a=q0G+tp7u1Bk0++rDIKb9hg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=kGmWPbZ9RRP9_EoALOUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: LuOKlP2xjPVNGInZjOvwar7y_Ak20Kpf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX39FsIJW0p6lM
 lnSMaNbw0QwStQUYeFC7eLeGwhhhcdtNjqn3UPZTsgFdkp5ODIS8+kvtLCsyIzkxz/vzq2M660+
 sUH6jm5Bfarlzam+IHPsPE0AJDJjZVBXgjQlh9+CUwAwy4dQvkxxzr/MmKem1+aL7PDrYoPuNrC
 8SeuWPT4rDts5aZjWLT+wkiW4zHjvv7n7nfZ/qbav2RMk2xHAIN6UQP7EWEdxu4nA8TiazCjmzA
 qa3B9AtZ5pB6L/+NceswkpiUdxYT5CUFuY0c0+QjOwo827ba+nY4abF2U5zegajrdq3Z+ekXe79
 RQGoiapcggp1yBxFPAJDd+7B+VTaeBQPz8hitN+Ytf0xih93P7dZaOtop+FtU7nt9mHUXjYj48J
 JXP3+id1dptyJ420S61xERh/7I+TWU3grhJUscAI8yexojbaQjlL4MpsudxyldoE66fTaZERMb/
 Hq4tzz36QrwuJbF9yxg==
X-Proofpoint-ORIG-GUID: LuOKlP2xjPVNGInZjOvwar7y_Ak20Kpf
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52021-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[st.com:email,foss.st.com:mid,foss.st.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5AC2ACD297
X-Rspamd-Action: no action

The ISP subdev is the first element after input of the main pipeline.
Part (static configuration) of this block is done via this subdev while
other configuration done on a per-frame basis will be done via a output
metadata device attached to this subdev.
This subdev handled the following features of the ISP block:
  - statistic removal (top / bottom of the frame)
  - decimation
  - demosaicing
  - control of frame export to the aux pipeline

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
 .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   3 +
 .../platform/st/stm32/stm32-dcmipp/dcmipp-isp.c    | 482 +++++++++++++++++++++
 3 files changed, 486 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 54231569ed6f..a708534a51af 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
-stm32-dcmipp-y += dcmipp-pixelcommon.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index ee9f36268e64..e04fde86550a 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -282,5 +282,8 @@ void dcmipp_byteproc_ent_release(struct dcmipp_ent_device *ved);
 struct dcmipp_ent_device *dcmipp_bytecap_ent_init(const char *entity_name,
 						  struct dcmipp_device *dcmipp);
 void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
+struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp);
+void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
 
 #endif
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
new file mode 100644
index 000000000000..dfd2b10ffa50
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-isp.c
@@ -0,0 +1,482 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#include <linux/v4l2-mediabus.h>
+#include <media/v4l2-rect.h>
+#include <media/v4l2-subdev.h>
+
+#include "dcmipp-common.h"
+#include "dcmipp-pixelcommon.h"
+
+#define DCMIPP_P1FSCR	0x804
+#define DCMIPP_P1FSCR_PIPEDIFF BIT(18)
+
+#define DCMIPP_P1SRCR	0x820
+#define DCMIPP_P1SRCR_LASTLINE_SHIFT	0
+#define DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT	12
+#define DCMIPP_P1SRCR_CROPEN		BIT(15)
+
+#define DCMIPP_P1DECR	0x830
+#define DCMIPP_P1DECR_ENABLE		BIT(0)
+#define DCMIPP_P1DECR_HDEC_SHIFT	1
+#define DCMIPP_P1DECR_VDEC_SHIFT	3
+
+#define DCMIPP_P1DMCR	0x870
+#define DCMIPP_P1DMCR_ENABLE		BIT(0)
+#define DCMIPP_P1DMCR_TYPE_SHIFT	1
+#define DCMIPP_P1DMCR_TYPE_MASK		GENMASK(2, 1)
+#define DCMIPP_P1DMCR_TYPE_RGGB		0x0
+#define DCMIPP_P1DMCR_TYPE_GRBG		0x1
+#define DCMIPP_P1DMCR_TYPE_GBRG		0x2
+#define DCMIPP_P1DMCR_TYPE_BGGR		0x3
+
+#define ISP_MEDIA_BUS_SINK_FMT_DEFAULT MEDIA_BUS_FMT_RGB565_1X16
+#define ISP_MEDIA_BUS_SRC_FMT_DEFAULT MEDIA_BUS_FMT_RGB888_1X24
+
+struct dcmipp_isp_device {
+	struct dcmipp_ent_device ved;
+	struct v4l2_subdev sd;
+	struct device *dev;
+
+	void __iomem *regs;
+};
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.width = DCMIPP_FMT_WIDTH_DEFAULT,
+	.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+	.code = ISP_MEDIA_BUS_SINK_FMT_DEFAULT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = DCMIPP_COLORSPACE_DEFAULT,
+	.ycbcr_enc = DCMIPP_YCBCR_ENC_DEFAULT,
+	.quantization = DCMIPP_QUANTIZATION_DEFAULT,
+	.xfer_func = DCMIPP_XFER_FUNC_DEFAULT,
+};
+
+static inline unsigned int dcmipp_isp_set_compose(__u32 size, __u32 req)
+{
+	unsigned int i = 0;
+
+	if (req > size)
+		return size;
+
+	/* Maximum decimation factor is 8 */
+	while (size > req && i++ < 3)
+		size /= 2;
+
+	return size;
+}
+
+static void dcmipp_isp_adjust_fmt(struct v4l2_mbus_framefmt *fmt, u32 pad)
+{
+	/* Only accept code in the pix map table */
+	if (!dcmipp_pixelpipe_pix_map_by_code(fmt->code, DCMIPP_ISP, pad))
+		fmt->code = IS_SRC(pad) ? ISP_MEDIA_BUS_SRC_FMT_DEFAULT :
+					  ISP_MEDIA_BUS_SINK_FMT_DEFAULT;
+
+	fmt->width = clamp_t(u32, fmt->width, DCMIPP_FRAME_MIN_WIDTH,
+			     DCMIPP_FRAME_MAX_WIDTH) & ~1;
+	fmt->height = clamp_t(u32, fmt->height, DCMIPP_FRAME_MIN_HEIGHT,
+			      DCMIPP_FRAME_MAX_HEIGHT);
+
+	if (fmt->field == V4L2_FIELD_ANY || fmt->field == V4L2_FIELD_ALTERNATE)
+		fmt->field = V4L2_FIELD_NONE;
+
+	dcmipp_colorimetry_clamp(fmt);
+}
+
+static int dcmipp_isp_init_state(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state)
+{
+	for (unsigned int i = 0; i < sd->entity.num_pads; i++) {
+		struct v4l2_mbus_framefmt *mf;
+
+		mf = v4l2_subdev_state_get_format(state, i);
+		*mf = fmt_default;
+		mf->code = IS_SRC(i) ? ISP_MEDIA_BUS_SRC_FMT_DEFAULT :
+				       ISP_MEDIA_BUS_SINK_FMT_DEFAULT;
+
+		if (IS_SINK(i)) {
+			struct v4l2_rect r = {
+				.top = 0,
+				.left = 0,
+				.width = DCMIPP_FMT_WIDTH_DEFAULT,
+				.height = DCMIPP_FMT_HEIGHT_DEFAULT,
+			};
+
+			*v4l2_subdev_state_get_crop(state, i) = r;
+			*v4l2_subdev_state_get_compose(state, i) = r;
+		}
+	}
+
+	return 0;
+}
+
+static int dcmipp_isp_enum_mbus_code(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     struct v4l2_subdev_mbus_code_enum *code)
+{
+	return dcmipp_pixelpipe_enum_mbus_code(DCMIPP_ISP, code);
+}
+
+static int dcmipp_isp_enum_frame_size(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      struct v4l2_subdev_frame_size_enum *fse)
+{
+	return dcmipp_pixelpipe_enum_frame_size(DCMIPP_ISP, fse);
+}
+
+static int dcmipp_isp_set_fmt(struct v4l2_subdev *sd,
+			      struct v4l2_subdev_state *state,
+			      struct v4l2_subdev_format *fmt)
+{
+	if (v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	dcmipp_isp_adjust_fmt(&fmt->format, fmt->pad);
+
+	if (IS_SINK(fmt->pad)) {
+		struct v4l2_mbus_framefmt *src_fmt =
+			v4l2_subdev_state_get_format(state, 1);
+		struct v4l2_rect r = {
+			.top = 0,
+			.left = 0,
+			.width = fmt->format.width,
+			.height = fmt->format.height,
+		};
+
+		/* Adjust SINK pad crop/compose */
+		*v4l2_subdev_state_get_crop(state, 0) = r;
+		*v4l2_subdev_state_get_compose(state, 0) = r;
+
+		/* Forward format to SRC pads */
+		*src_fmt = fmt->format;
+		src_fmt->code = dcmipp_pixelpipe_src_format(fmt->format.code);
+		*v4l2_subdev_state_get_format(state, 2) = *src_fmt;
+	} else {
+		struct v4l2_mbus_framefmt *sink_fmt =
+			v4l2_subdev_state_get_format(state, 0);
+		struct v4l2_rect *compose =
+			v4l2_subdev_state_get_compose(state, 0);
+
+		fmt->format = *sink_fmt;
+		fmt->format.code = dcmipp_pixelpipe_src_format(sink_fmt->code);
+		if (compose->width && compose->height) {
+			fmt->format.width = compose->width;
+			fmt->format.height = compose->height;
+		}
+		/* Set to the 2nd SRC pad */
+		*v4l2_subdev_state_get_format(state, fmt->pad == 1 ? 2 : 1) =
+			fmt->format;
+	}
+
+	/* Update the selected pad format */
+	*v4l2_subdev_state_get_format(state, fmt->pad) = fmt->format;
+
+	return 0;
+}
+
+static void dcmipp_isp_adjust_crop(struct v4l2_rect *r,
+				   const struct v4l2_mbus_framefmt *fmt)
+{
+	struct v4l2_rect src_rect = {
+		.top = 0,
+		.left = 0,
+		.width = fmt->width,
+		.height = fmt->height,
+	};
+	struct v4l2_rect crop_min = {
+		.top = 8,
+		.left = 0,
+		.width = fmt->width,
+		.height = 1,
+	};
+
+	/* Disallow rectangles smaller than the minimal one. */
+	v4l2_rect_set_min_size(r, &crop_min);
+	v4l2_rect_map_inside(r, &src_rect);
+}
+
+static int dcmipp_isp_set_selection(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state,
+				    struct v4l2_subdev_selection *s)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_mbus_framefmt *sink_fmt, *src_fmt;
+	struct v4l2_rect *crop, *compose;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	if (v4l2_subdev_is_streaming(sd))
+		return -EBUSY;
+
+	crop = v4l2_subdev_state_get_crop(state, s->pad);
+	compose = v4l2_subdev_state_get_compose(state, s->pad);
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		dcmipp_isp_adjust_crop(&s->r, sink_fmt);
+
+		*crop = s->r;
+		*compose = s->r;
+
+		dev_dbg(isp->dev, "s_selection: crop (%d,%d)/%ux%u\n",
+			crop->left, crop->top, crop->width, crop->height);
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = dcmipp_isp_set_compose(crop->width, s->r.width);
+		s->r.height = dcmipp_isp_set_compose(crop->height, s->r.height);
+		*compose = s->r;
+
+		dev_dbg(isp->dev, "s_selection: compose (%d,%d)/%ux%u\n",
+			compose->left, compose->top,
+			compose->width, compose->height);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	/* Update the source pad size */
+	src_fmt = v4l2_subdev_state_get_format(state, 1);
+	src_fmt->width = s->r.width;
+	src_fmt->height = s->r.height;
+
+	return 0;
+}
+
+#define STM32_DCMIPP_IS_BAYER_VARIANT(code, variant)	\
+	((code) == MEDIA_BUS_FMT_S##variant##8_1X8 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##10_1X10 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##12_1X12 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##14_1X14 ||	\
+	 (code) == MEDIA_BUS_FMT_S##variant##16_1X16)
+static void dcmipp_isp_config_demosaicing(struct dcmipp_isp_device *isp,
+					  struct v4l2_subdev_state *state)
+{
+	__u32 code = v4l2_subdev_state_get_format(state, 0)->code;
+	unsigned int val = 0;
+
+	/* Disable demosaicing */
+	reg_clear(isp, DCMIPP_P1DMCR,
+		  DCMIPP_P1DMCR_ENABLE | DCMIPP_P1DMCR_TYPE_MASK);
+
+	/* Only perform demosaicing if format is bayer */
+	if (code < MEDIA_BUS_FMT_SBGGR8_1X8 || code >= MEDIA_BUS_FMT_JPEG_1X8)
+		return;
+
+	dev_dbg(isp->dev, "Input is RawBayer, enable Demosaicing\n");
+
+	if (STM32_DCMIPP_IS_BAYER_VARIANT(code, BGGR))
+		val = DCMIPP_P1DMCR_TYPE_BGGR << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, GBRG))
+		val = DCMIPP_P1DMCR_TYPE_GBRG << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, GRBG))
+		val = DCMIPP_P1DMCR_TYPE_GRBG << DCMIPP_P1DMCR_TYPE_SHIFT;
+	else if (STM32_DCMIPP_IS_BAYER_VARIANT(code, RGGB))
+		val = DCMIPP_P1DMCR_TYPE_RGGB << DCMIPP_P1DMCR_TYPE_SHIFT;
+
+	val |= DCMIPP_P1DMCR_ENABLE;
+
+	reg_set(isp, DCMIPP_P1DMCR, val);
+}
+
+static bool dcmipp_isp_is_aux_output_enabled(struct dcmipp_isp_device *isp)
+{
+	struct media_link *link;
+
+	for_each_media_entity_data_link(isp->ved.ent, link) {
+		if (link->source != &isp->ved.pads[2])
+			continue;
+
+		if (!(link->flags & MEDIA_LNK_FL_ENABLED))
+			continue;
+
+		if (!strcmp(link->sink->entity->name, "dcmipp_aux_postproc"))
+			return true;
+	}
+
+	return false;
+}
+
+static void dcmipp_isp_config_decimation(struct dcmipp_isp_device *isp,
+					 struct v4l2_subdev_state *state)
+{
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct v4l2_rect *compose = v4l2_subdev_state_get_compose(state, 0);
+	u32 decr;
+
+	decr = (fls(crop->width / compose->width) - 1) << DCMIPP_P1DECR_HDEC_SHIFT |
+	       (fls(crop->height / compose->height) - 1) << DCMIPP_P1DECR_VDEC_SHIFT;
+	if (decr)
+		decr |= DCMIPP_P1DECR_ENABLE;
+
+	reg_write(isp, DCMIPP_P1DECR, decr);
+}
+
+static int dcmipp_isp_enable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state,
+				     u32 pad, u64 streams_mask)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_rect *crop = v4l2_subdev_state_get_crop(state, 0);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Perform configuration only if no other pad is enabled */
+	if (sd->enabled_pads)
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Check if link between ISP & Pipe2 postproc is enabled */
+	if (dcmipp_isp_is_aux_output_enabled(isp))
+		reg_clear(isp, DCMIPP_P1FSCR, DCMIPP_P1FSCR_PIPEDIFF);
+	else
+		reg_set(isp, DCMIPP_P1FSCR, DCMIPP_P1FSCR_PIPEDIFF);
+
+	/* Configure Statistic Removal */
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	reg_write(isp, DCMIPP_P1SRCR,
+		  ((crop->top << DCMIPP_P1SRCR_FIRSTLINEDEL_SHIFT) |
+		   (crop->height << DCMIPP_P1SRCR_LASTLINE_SHIFT) |
+		   DCMIPP_P1SRCR_CROPEN));
+
+	/* Configure Decimation */
+	dcmipp_isp_config_decimation(isp, state);
+
+	/* Configure Demosaicing */
+	dcmipp_isp_config_demosaicing(isp, state);
+
+	ret = v4l2_subdev_enable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int dcmipp_isp_disable_streams(struct v4l2_subdev *sd,
+				      struct v4l2_subdev_state *state,
+				      u32 pad, u64 streams_mask)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+	struct v4l2_subdev *s_subdev;
+	struct media_pad *s_pad;
+	int ret;
+
+	/* Don't do anything if there are still other pads enabled */
+	if ((sd->enabled_pads & ~BIT(pad)))
+		return 0;
+
+	/* Get source subdev */
+	s_pad = media_pad_remote_pad_first(&sd->entity.pads[0]);
+	if (!s_pad || !is_media_entity_v4l2_subdev(s_pad->entity))
+		return -EINVAL;
+	s_subdev = media_entity_to_v4l2_subdev(s_pad->entity);
+
+	/* Disable all blocks */
+	reg_write(isp, DCMIPP_P1SRCR, 0);
+	reg_write(isp, DCMIPP_P1DECR, 0);
+	reg_write(isp, DCMIPP_P1DMCR, 0);
+
+	ret = v4l2_subdev_disable_streams(s_subdev, s_pad->index, BIT_ULL(0));
+	if (ret < 0) {
+		dev_err(isp->dev,
+			"failed to start source subdev streaming (%d)\n", ret);
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops dcmipp_isp_pad_ops = {
+	.enum_mbus_code		= dcmipp_isp_enum_mbus_code,
+	.enum_frame_size	= dcmipp_isp_enum_frame_size,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= dcmipp_isp_set_fmt,
+	.get_selection		= dcmipp_pixelpipe_get_selection,
+	.set_selection		= dcmipp_isp_set_selection,
+	.enable_streams		= dcmipp_isp_enable_streams,
+	.disable_streams	= dcmipp_isp_disable_streams,
+};
+
+static const struct v4l2_subdev_video_ops dcmipp_isp_video_ops = {
+	.s_stream = v4l2_subdev_s_stream_helper,
+};
+
+static const struct v4l2_subdev_ops dcmipp_isp_ops = {
+	.pad = &dcmipp_isp_pad_ops,
+	.video = &dcmipp_isp_video_ops,
+};
+
+static void dcmipp_isp_release(struct v4l2_subdev *sd)
+{
+	struct dcmipp_isp_device *isp = v4l2_get_subdevdata(sd);
+
+	kfree(isp);
+}
+
+static const struct v4l2_subdev_internal_ops dcmipp_isp_int_ops = {
+	.init_state = dcmipp_isp_init_state,
+	.release = dcmipp_isp_release,
+};
+
+void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved)
+{
+	struct dcmipp_isp_device *isp =
+			container_of(ved, struct dcmipp_isp_device, ved);
+
+	dcmipp_ent_sd_unregister(ved, &isp->sd);
+}
+
+struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
+					      struct dcmipp_device *dcmipp)
+{
+	struct dcmipp_isp_device *isp;
+	const unsigned long pads_flag[] = {
+		MEDIA_PAD_FL_SINK, MEDIA_PAD_FL_SOURCE,
+		MEDIA_PAD_FL_SOURCE,
+	};
+	int ret;
+
+	/* Allocate the isp struct */
+	isp = kzalloc(sizeof(*isp), GFP_KERNEL);
+	if (!isp)
+		return ERR_PTR(-ENOMEM);
+
+	isp->regs = dcmipp->regs;
+
+	/* Initialize ved and sd */
+	ret = dcmipp_ent_sd_register(&isp->ved, &isp->sd,
+				     &dcmipp->v4l2_dev, entity_name,
+				     MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER,
+				     ARRAY_SIZE(pads_flag), pads_flag,
+				     &dcmipp_isp_int_ops, &dcmipp_isp_ops,
+				     NULL, NULL);
+	if (ret) {
+		kfree(isp);
+		return ERR_PTR(ret);
+	}
+
+	isp->ved.dcmipp = dcmipp;
+	isp->dev = dcmipp->dev;
+
+	return &isp->ved;
+}

-- 
2.34.1


