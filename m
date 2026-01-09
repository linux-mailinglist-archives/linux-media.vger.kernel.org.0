Return-Path: <linux-media+bounces-50271-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 992DBD07A61
	for <lists+linux-media@lfdr.de>; Fri, 09 Jan 2026 08:49:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 1D152300B362
	for <lists+linux-media@lfdr.de>; Fri,  9 Jan 2026 07:49:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA7532F0661;
	Fri,  9 Jan 2026 07:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="l32t3jWo"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19F2D2E8B78;
	Fri,  9 Jan 2026 07:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944988; cv=fail; b=quhvVA18CTBN271AOd38I84VAj5YkRLcTDbNeeuDhte95M9ZK731UHklG3P4nJ17hxgMlsTG+cWBSRceUjnoqml/1HFnLsekehuK2iw3LdkUyLc5mnciuOAjDSnOjvY4N9w9U+CdR5HxQl6eVhFGk452ErmTMaxqZB0GzCZvx9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944988; c=relaxed/simple;
	bh=RPR81lThp/S+bTeKBuvhD6EEEIHKcYPeg/OCP0LwIsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=u4OW0lWPCODkypcFiRxcHrvIiQ/jSDiByfLQ/tMFCk1Mghs+oUn+SuvahMGzpm8Jfh+JlvhEvDuCM6Y3k5eIpnwJjb0pnkAqSmrHgN+Y/R2YjuCXUqjulS9W7ctnmcGqrG/Bl0yxa41ts4tMZzipkzPK44U1BVaR0YixX0eAuqE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=l32t3jWo; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6097dm9Q092795;
	Fri, 9 Jan 2026 08:49:33 +0100
Received: from as8pr04cu009.outbound.protection.outlook.com (mail-westeuropeazon11011051.outbound.protection.outlook.com [52.101.70.51])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bjkxmsbtm-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 09 Jan 2026 08:49:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u5jeyOhkcZuu8OvcMjwhkVg3xqOD59y5HicDkB7Yyvu0F7KKydSIPIJDsbrzGTMW3njJ2QKxCYiEx/ZoKKzkAv5j517+cZ8vuXMR/Ro/V6niLaxfidBNN1d0iTodV9u4fzCRq6JFBuNLPOURrx+kxjuSLFG5/EyEhgUTqxGmYKzNTF5WVdvxN/Y+ck/OE8dkJBzAOBkz1FZ+quh9eRom9td3crLBGJcUgVVwkwzpFqMZAJEzxWg5vMRwtpEj62ZwMtgU0IemIoPbgVw+slddvFtpJjl6NbATVHu/6E5drqAKXF8GE8H2erk4M/2z0sDkZZXMMhRfQUPy8MLGEwGRlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YP/Ji01uhAm9K92jtj7rbZlu+UyrKD5cqctC4U24XMY=;
 b=pPY4G0jP1vsRp4o0Mj+5sot/ZPzTknM/gEsce+K6jvl7XaHGaf5d1/DIiR0JECnYCb/1oJmhekfu1x/XjUn8dB3F2R8gkaMZWb1i6Hv34JRFCXKZ5pyPyH2Gellk3Y1tpHoyaXzSZWGFNdySBKmm3c9rOHwuCHBZ9hzh3aS3/9LvG0W13kh3OVjnbKaCYR0MqnfgGlP0LKQ75R8/MvN1wKH3Z4vYQN4WSoeM3yKRq2MFrgGTwRY8hJeZdrGy33z/AXuAnKPuPN6gjlmdseyxpeasW2k/nWqJ7Ot0OTXOka9ANZrJETNmPZRSev+r6L97G0klAP2nR6NE6iyIXJQLPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YP/Ji01uhAm9K92jtj7rbZlu+UyrKD5cqctC4U24XMY=;
 b=l32t3jWoZ4fiABVu88PHAHm7mKWILaiR6D5VIeZv2wqsSjq+9mWmGnmzYOvdl610erz1yZiFjZm3pv1ROKSCT80i+ubatK4V0rMPRE24LcypWZ+s5OUofXgIaVx+vlSdzXWXB3DknH5WrXLxRrjVWL+3ZGCcMNHanQ4NejExGQN8fmxIEdQYnTo0/45xP35tUgUpacjMH/aAntVVOTWF6Bl5UxIR3tKSMuBIx6jX71iEWPLdr7e849SQuXSoWkp+bfo3kxHVOqi8lEkHILcXUsLCtjd5m8QModAGWoCelkog17O8mhPmyrtPy3As7/V1gBr7VxFWufZ44J29HZDGYw==
Received: from DB3PR06CA0008.eurprd06.prod.outlook.com (2603:10a6:8:1::21) by
 VI0PR10MB9334.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:2b1::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.2; Fri, 9 Jan 2026 07:49:31 +0000
Received: from DU2PEPF00028D0D.eurprd03.prod.outlook.com
 (2603:10a6:8:1:cafe::ed) by DB3PR06CA0008.outlook.office365.com
 (2603:10a6:8:1::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.4 via Frontend Transport; Fri, 9
 Jan 2026 07:49:30 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DU2PEPF00028D0D.mail.protection.outlook.com (10.167.242.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Fri, 9 Jan 2026 07:49:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 08:50:47 +0100
Received: from [10.48.86.79] (10.48.86.79) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 9 Jan
 2026 08:49:29 +0100
Message-ID: <aa296b61-eba0-407f-a80b-a5c574a6a7c9@foss.st.com>
Date: Fri, 9 Jan 2026 08:49:29 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] media: stm32: add dcmipp/csi power-domain support for
 mp2x
To: Alain Volmat <alain.volmat@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maxime Coquelin
	<mcoquelin.stm32@gmail.com>,
        Hugues Fruchet <hugues.fruchet@foss.st.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
Content-Language: en-US
From: Alexandre TORGUE <alexandre.torgue@foss.st.com>
In-Reply-To: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D0D:EE_|VI0PR10MB9334:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ef4cd0e-4290-41ad-305c-08de4f539f4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bFcyeHRLUHZxeVhHb1hmbXMwNDl6UHRFNGU3UFQyOGZNNHF5QWNLMlJvSys0?=
 =?utf-8?B?b2dFUFdoRkVzWThKTVJCSjBlY1ZoZm84TWJldnp1aHhyK0R2eWVuditEM1BW?=
 =?utf-8?B?bGt5TURMZTVsWEQvemxOcVREblAyc3dkeVB6blp0MmVCbmZPaGFzNGNZTHRa?=
 =?utf-8?B?Um1NNW9abVdzSi9DTWdQYm4xWEZvbnM3WUtjUldGOEtXb2ZvWllQZGRkeThO?=
 =?utf-8?B?aWtUNVNCSW9KK1AwOUdjeTZYK3Q2cEJ1YWU2TXBTVlpmUWpaSk5ncFFmNnFD?=
 =?utf-8?B?cTEzWXJwUGZGZnhSK3g4RFBFK3ZwSi9jdXBrd2prT0krWG52REkwblhTWnpz?=
 =?utf-8?B?TGlHaER1eWpKWkFxcUJZZkppdHVMM1J1MEpVbVlxaUp3bmhOV0xzN2RaQzBu?=
 =?utf-8?B?MFdFRjJWMGx3QU9QaWpoOUJWUzA0bVQ3ckdvSForTlhBdlUxOUYwUkdPaVhH?=
 =?utf-8?B?M3pNbnhKY1BjclRVYyt0Qk9WdHZMeWdPVTl2ZUhwamdlQWNSUXhqRXZlc0lX?=
 =?utf-8?B?eGhFaWo2VllMOVYyZUN3eVlld2RlZTdiM2prOTN3UHp5cVRmK280bWhKcXRU?=
 =?utf-8?B?NDl0RUR2MTU3UTFqVnhJMmJJeWh0V3Z6ZXlhb1NhQ29sck10aGZHa0hzbUlz?=
 =?utf-8?B?SXpCeEMwbXVSRXJ5RGZPNnY1ak0ra3hkaGtUY2ZLYlVpQndDZ3h3ZjZ1YVBU?=
 =?utf-8?B?TEtxeGU4dTJTTFd3Qyt4SXhJZXNHMGExTVczZTNSbCtEajA5d1NoM3VsaGsw?=
 =?utf-8?B?d3VVQ3hVVzVIVmo4bWlxSXNHc0t1clJYV0thMmhDQ1ZVVXY2UURQMWpIbG5m?=
 =?utf-8?B?ZlR4M0FWQWpHWVdjZ0h0ZFZxd3pXemRZZGhueFNUakIrRzQwQTRrUVBDYVpk?=
 =?utf-8?B?MThBN0dJYVZrdVhvNDRvWWVybUFKWnAyUStyTXI0cFBCRll6SGtkd2pRZzdB?=
 =?utf-8?B?VWQ3N25YNG9UZ09CZVZ0cXV1T2ZXT3hkVmJFWGpLYTExSU5kOUNOeUh5ZUEx?=
 =?utf-8?B?aG9tSHJhSXh3aG42bzFQbzhWYjhtV0hWMlZHV2hhK3hnMHI3djc1bE9NVTU3?=
 =?utf-8?B?b3JCUHlDVkFLK0UwRWM3VEhPUnNLRVN2YVh1c2ZuRjhXaUhPTi8rcVpwQWY3?=
 =?utf-8?B?MDQ3WG0vNGVlQ3BmYWduaDNJeEIxRjZiR2pVcysyT0NZUGdLOXJNWDh0Rkx6?=
 =?utf-8?B?MDdwRGZncGU0NXBsSlFqU2Rac1hiV05OcE03YkU1d25adlNOdkJ5czdBaldT?=
 =?utf-8?B?NFRnU1Z4a3lQYXNCQlZWNDQ4b1U5blM1bXk2T01XaVh4ZDhYR3lYck45ZUZ6?=
 =?utf-8?B?Zm5mM1NCK055anlkb0NSMTJKRWdCVkJDNGp3NVdJbExya0o3c0NTeDlpaHYy?=
 =?utf-8?B?NzRiWkF2V0xzaDl5MVB1VUc5YXNWbU85Q21rMUhtamhZQjhzSDhYUlNINERa?=
 =?utf-8?B?TzQ4ZWI4SHRISXJ6eFBUYnMyY3A4b2w2bU5zdDhMdFlHWjh2dmhKRkJBM1pL?=
 =?utf-8?B?WmprM0htVlVuREpqdHFoSzZNN3FXemwyanhtRXJjZ0RuSDhFOHpHZGpnUFox?=
 =?utf-8?B?bk5hZUtWN054QkdoT0twSHJZRndwa1J5bXVyUjF1SFVQSFVCdXhEVDh2eXdW?=
 =?utf-8?B?bnlnZk5uVkd4cXFzU1hnU2lRT1Jyblp1RHl1aU5VTVhZZms0ODlIWE1MYktq?=
 =?utf-8?B?TFZhYUY3YUhoUHN2UWJUV0d2MlI2a29GSExXRERWYjNhQ0RUZDNMTFpJNDJB?=
 =?utf-8?B?NE5kK2pqWE5NakxQMDZ5eDhVVDZPQlN6MWc1UjhBZHErRitGOUZpQ2poL1Iz?=
 =?utf-8?B?MnFpVncwS1laZEFVQ05PT2luaFFHQ1oxdVNQemtJd1B5a254Mk9XTDk5OVZZ?=
 =?utf-8?B?TENQVUhNN0RmQXlna002SXhBZ1RTVmpHd2RaSGtVTlphWkgvL2JGdnZKSnA0?=
 =?utf-8?B?c0RRbTRzQXNhRjhmVFc5U0FTOGhzdlAwU1d5UENaaG10VExFYTRRU243STFK?=
 =?utf-8?B?ZDZ3RENpaEhhTWVseGt1aC9PMDNlWnhaMzkxajZwUDRoZ0IvalRxTytheWY2?=
 =?utf-8?B?cnZTMnpCNGxPbWFiMFVNMUVNMWhPeW03VGNrZVZDdGxvQm55STVhNU51VmJs?=
 =?utf-8?Q?mCgQ=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014)(7416014);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2026 07:49:30.5567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ef4cd0e-4290-41ad-305c-08de4f539f4d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D0D.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB9334
X-Proofpoint-GUID: fEVlvDYnMv6DDTQjmNMymfzI4p64pTh7
X-Authority-Analysis: v=2.4 cv=O9s0fR9W c=1 sm=1 tr=0 ts=6960b30d cx=c_pps
 a=kPSeKj3yqbVmzWy7JHOGrQ==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=TP8aPCUxYTYA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=j-HlW0InjF_BdKxMxSMA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA5MDA1NCBTYWx0ZWRfXztLVCJbr+9NY
 Szvg0BYsYfkjI8Sle0ndTqEjL/D7b5fIgZidxRoPlJPYMesXT8945t4JhJZ4in8HKMK4FXBhqUK
 gChz0Yyj0hvOXocWBzJlXJQOruLP/WS9ygMtRI6rdvmBVgLbvO8PiQvTyhbLeSBxRbFpPqgWyay
 DTtXYgX/nYQzYN1tsfrZyXeevvT/8d/vf8wi431NKDGXdImazlrhYX3pvxDqrbUx3VaCwrbnBv3
 tuieHBsZNJI0VYOfKYjv4AtJ2LsnAVSoorWZaau5214Dcqq0d8vuPuhuMlNsyY2XaUHoXN+qdv6
 nuf0tCn4vbAqnZBn0jlDJ7S3j6/iDxeJTGomSUhYVmeNvzPUDfb0YNq/QC6droRH0/RVUtjaHIo
 np9HYmGk0hH/2osINqIwSD6gsOXqB+GrzLHsC3SWW84PlLnUeMgFrDeZG6OMBG+iRw8Z2TejXAy
 4iTxOevDz+ooxVPmr8A==
X-Proofpoint-ORIG-GUID: fEVlvDYnMv6DDTQjmNMymfzI4p64pTh7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-09_02,2026-01-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1011
 priorityscore=1501 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601090054

Hi Alain

On 12/19/25 16:58, Alain Volmat wrote:
> This series adds the bindings & dtsi updates related to the power-domain
> properties for CSI & DCMIPP of the STM32MP2x.
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
> Alain Volmat (6):
>        dt-bindings: media: st: csi: add 'power-domains' property
>        arm64: dts: st: add power-domain of csi in stm32mp251.dtsi
>        arm64: dts: st: add power-domain of csi in stm32mp231.dtsi
>        dt-bindings: media: st: dcmipp: add 'power-domains' property
>        arm64: dts: st: add power-domain of dcmipp in stm32mp251.dtsi
>        arm64: dts: st: add power-domain of dcmipp in stm32mp231.dtsi
> 
>   Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml  | 3 +++
>   Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 3 +++
>   arch/arm64/boot/dts/st/stm32mp231.dtsi                        | 2 ++
>   arch/arm64/boot/dts/st/stm32mp251.dtsi                        | 2 ++
>   4 files changed, 10 insertions(+)
> ---
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> change-id: 20251219-stm32-mp2x-dcmipp-csi-power-domain-7d57c8ce622f
> 
> Best regards,

Series applied on stm32-next.

Thanks
Alex

