Return-Path: <linux-media+bounces-49205-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3619FCD0B17
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:01:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 6B679301FDFF
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:01:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 33D1C35BDC8;
	Fri, 19 Dec 2025 15:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="NQj9k00t"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C22F359FAF;
	Fri, 19 Dec 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159928; cv=fail; b=fvig6esV59umF6PTUF9ku3XBBRBinL/MyLTrQQVqeAxYt2Y1BLf41AtV9c9EaepYSU0P6xKQHDX3aPSo4NQAx1viL2fGQajUC+sHkWtC7tTsqLc8quOVkWJFnrQj1BeLOTMOWej7bqPGf54LdA/GvIHLA6dPaIxqS3O2ybv8WX8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159928; c=relaxed/simple;
	bh=i82wiBKuRgQNDVQ6XGHKByaKoTWT8CGEXodlLTbfbeQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=OfI9GkXlku8e8dqLTIfOfzBChP8D8bkjAQ+atMavJzD06rlAYStcwMjOA0OIl+amqNKVMWEFsqWGW2LweuVKelPNs0K+3P720Ai1zru5jnQ0DPwYx3BAErARevhIQb5GJ02nTxPj5HiMsQogF7jG5a0ncluq4Ry561/rrMyDoy8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=NQj9k00t; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0288072.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFdj7B1717999;
	Fri, 19 Dec 2025 16:58:34 +0100
Received: from duzpr83cu001.outbound.protection.outlook.com (mail-northeuropeazon11012002.outbound.protection.outlook.com [52.101.66.2])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31c1qb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:34 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xwnVXLWqdzU0xZGg3o5sNqIr+DGTQBUoRjkXX6M5sqw0JDjXKTU/foNWpFt/b2DLoGu1XWBe3QOoOjbnC3CDYo8+NfL0Ch4ITB2Py/UVCIEioXzfFj5821OZeDSJ1rWUCPxR4FU2buoPqRLimDiadL7Y07DCCsVXqkxou9pfonwSQ8kBXRE3SIjLenIODKCK8/Rok+paZ1AQdCZ4fmTStPBOfDPPmfcl/tR/a93ElnEoLJPw2Bqq6CKQGhDAWHQqDU0WsHq01xjVXsVU6vIUUw3yX+fAMNCO/F+O02gJoua0v3OiEWWuwu2UBcws7yDtKTigJT3/XoU5gfIUBEguKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J7Rl7ljxcKguA5AwKXJFpQfWYU59Logqb2SshUsa7/M=;
 b=OHHu+hhujnF8NjNFics7aYlzW5x57gYrnkTBfmwbf7ZkdwWAoStd9wYCdH6DKhl7CkYBjxbQkj7D+e10jvEkZQvcvymrPRH0MJ73TBtBGZ9czmPI+9cVtJMo3oJSISVaC0XAy/MKGP9AotUxaGbimLTZh4WwGJPTgt8NRd1PwGA/RqzKGBXQRTr/HOg1h/qHUFgF8QXo0J2Vw3mSBgMk/HlHciZd9Mi8dhpvT/SKFrABeNlVWStRlRUjZefBTKTjm5TPu76+GKmynlfURbU3LtsmXRNRD7xPca9HwawSihJgkX/DVtRtjyHr1iji4nHRJ2B0iKA4sJbt0fcKvsafVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J7Rl7ljxcKguA5AwKXJFpQfWYU59Logqb2SshUsa7/M=;
 b=NQj9k00tp0voG9VP1edbXRnlPvHIuAA+KFUfmubHdMd1zeCdglcmpRRcEdVTJ05Rhkn54JGzOODbg003kKt7bz4/L5ftyxvHAmkUBNA+rF0Mbp2BnvMhK7hVF/z7vmjknadX5/2x+9ZCdXbuG01kd/TrUwQy48/Mx7omQLJTLQRB5LneJxlCj5ybqUMHjagLmtiTxkbGqLy/z5oBhbvrdGJe+4Mcs+Wb6f7Unr7lxsq8iRnEXIvnAbDePT72RX+xkTiGdEMG3+Jen8C6yN7plnIb8LqwZ+WIMgyzdXVgHUEf20qOqdSoAjPqkpOVb9yVoZ/qQG5z4v1+nXTMUz9+Nw==
Received: from DUZPR01CA0074.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:3c2::20) by PAVPR10MB7356.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:102:31f::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:58:32 +0000
Received: from DB5PEPF00014B8C.eurprd02.prod.outlook.com
 (2603:10a6:10:3c2:cafe::6f) by DUZPR01CA0074.outlook.office365.com
 (2603:10a6:10:3c2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:59:11 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8C.mail.protection.outlook.com (10.167.8.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:31 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:20 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 16:58:07 +0100
Subject: [PATCH 5/6] arm64: dts: st: add power-domain of dcmipp in
 stm32mp251.dtsi
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-5-a6edb2aa8154@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8C:EE_|PAVPR10MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: e216bb37-dac9-4193-65d0-08de3f177545
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|7416014|376014|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?OEVtY0FIaHlhWjExVittdGkzS05pVDJkNG9SOHBvbFVOUmlDaTRFNmNoUFVQ?=
 =?utf-8?B?bEw1cERZditGWmlaelcyZHV6eXZUYy9xcDRXZCtzdXM0cG9sVkx3c3Yyd0hH?=
 =?utf-8?B?cTJVWmZYeVVlcGVyV1hqRlJGRkFOM2dVRWp6dWVlMittWVdEZFVDM2pHaHM3?=
 =?utf-8?B?dkQ1aWpxYjd3SDM5QzRVOHZkbWdaV0NkVEdieTdnWjhWRTBOZXBNL1hTRG13?=
 =?utf-8?B?UGFxcWUrSjVqdmFqTmlidmN1Z2lQUS95Vk1FTEpWSjE3TjlLRThod0laVnVs?=
 =?utf-8?B?NWJReEtMSHpQL09RNDM2aGVxVnJCd0ZDVllJRzdNZWJ4MmNSV284U2FIVEkv?=
 =?utf-8?B?RHQ5V2VwR2l1RW0veWlzR3dmTE95OWNRWi84Y1NTbjZvRjdrTG9qR3ZVUVA1?=
 =?utf-8?B?SWhRQlJadmJQOTc2N0RVcHlmUHlFZytSVjZodHVqODRXaUtIdDZEUWdCM3F2?=
 =?utf-8?B?OEE2RmVWSk1JUEdVOVBMdklsYkRrMzV5MlBYOUNvSW5VMmF4dFZIaDZBUEtM?=
 =?utf-8?B?aWl4VmhpQzVBQlVPNWRqZjVpWDZRK1ZvNXhCbm5TVGpjbnFla210OWQ2UGhQ?=
 =?utf-8?B?YlpqemVNMjYvNDNVQzFTYjEzWnc5SFFHa2hHcjZNSUdzNEd0amU2NmdWSyth?=
 =?utf-8?B?L2VGU2I3eFh3QjdRb3JwVWVGU0REcWw1SlRvaWZSYjA3OGR1L0dwSzFpOXBU?=
 =?utf-8?B?Q045WEVuOElYUlNpR0NPUzVsSkFXYU1EWG9WOHlNTFQxaWc5SVVRajdnN1J6?=
 =?utf-8?B?WjB0dUQ4LzJhT201Y2MraElGMzZXaWp4NXduMk15V1R0Y2dlVFlVVllEbTRP?=
 =?utf-8?B?Ylo0S2VVNUFYcUdjWjlJSWY1cldDc2ZiaEtCL0prMXhXWmViVldJYTJiaFZ3?=
 =?utf-8?B?SmZXWWIxRmpmaVFOVnBQL25na2VWdmg0NjVPbWZBaWtPVStYaXdRc3VGOUVr?=
 =?utf-8?B?aWtHWFF5S2loeE80UXM2VjY5WnlPbi9vZVpMcHRsaGdVeUpFOWZFY3RSNWhE?=
 =?utf-8?B?Z2YzYWVSaCtMS2VESnplcGlMeUR2MHVHRmVCUWIvVWVpSndZMUE5UnNkZ2Q2?=
 =?utf-8?B?MDVwNzFsZTlrV1RFUXZIeU5KUk1Ba1AzZFFBbHhqUFEvb0R5Q214R0xDNmEw?=
 =?utf-8?B?OVY1cG9mbUk3U1hUMjRuV0lZc3Q1aENxU0ZUYnZjNlgvMXFpd0d5RmQvYVd4?=
 =?utf-8?B?K2o0dDRSWHEwalVYb2orUTVTSnJWb0E3bDl3UzVWZWJkd3l4RG1YUzI4OGp4?=
 =?utf-8?B?SkdHRGZCdGpCcnVqS0JwaFRheS92a0diWUhUdjlFZW04WllCYlNaUE85RVlV?=
 =?utf-8?B?ZGRkRklhYm83dU5URm1uWkJRK3cwRVNVeHRNT3VKRU1vS2I3SlNTTVBLYVQ2?=
 =?utf-8?B?WWNCeWpzYW5zSEs5ZVZibVpOSWMydGxwUm9rR0Ftdm1nVlpHaXU0SGluUTRx?=
 =?utf-8?B?UTBDWSswczcwTUJzK3VaYnJUTzRpTXJ4TEQ4dXZ0em5mVDh0ZjhJR1V1OThH?=
 =?utf-8?B?dG80TWJnME9SdnJwM0Zqb0V3VHlUMG90V09CVWtaMGtkZmZvYzlzMndGcDlH?=
 =?utf-8?B?U29WZjdhd01lVFBqeHdmbXJodDkyQ3hJaElvcW01NWY0Smc3UFRvR2g4eDdx?=
 =?utf-8?B?bU1QS3pvWERLMzJqa0d2dVhHeXptdVptekZqdGNtTVUvbVZjbjdkTDFQblJn?=
 =?utf-8?B?M3VwQ0E5cmhMRTd1VmFpWXEvVTZ6aDVJeDU1QWhkWFdSMkJkbHU2RnhESDVH?=
 =?utf-8?B?UEtZMXdxaURNV3djcHJLSitXRDBKRkZNQ3JOYmx6YTV1dlhlV00rdWl0VFJI?=
 =?utf-8?B?T1IxbldHeURpb1FONVhySDNRN1grQzE3UXJ5Nzg2V3hBZGxQR3RiQTFVdGNX?=
 =?utf-8?B?UFlaQ2xwbVp5ZXVpZFkzcG5YSWJEV3pKOWZIa2QreHd1RWkrUVZ5RjFxWldQ?=
 =?utf-8?B?S1JoMTJQUklaTFhDWkkxWHNKSUpJMCt1TVpjV3VmckhDWWlyV29GREVoTmlL?=
 =?utf-8?B?YjY2Q1ZHaCtIeVpDd3Z5WndqU0kwbHdIdGllWVljWGNjSjl4TzhaMVV4Y3VQ?=
 =?utf-8?B?elpGQ1lzN3NGajZJMzMvd3lLaHcrNlNhR0JIUWYwdzl0TE1WWnp5QWFuWS93?=
 =?utf-8?Q?wtNY=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(7416014)(376014)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:31.6287
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e216bb37-dac9-4193-65d0-08de3f177545
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8C.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR10MB7356
X-Proofpoint-GUID: SORP76tz_XdaFqq_OctR4cqJknChaO2W
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfX5zz7lvNJl1gY
 4tAK1tDDum0NlYtqMnwdES0pFB7KxnX0oW5l+m8gFGthBgZffmGRy604bgAP6peHjqW3Rv0640M
 OMZEaMTegyuAH/LR5NQ2VD7BH6VSawNLNMe7qnhUdCl+wD8xWlsY7Tbomo6omFT1/SMFKXf4YtP
 7gG7ie6XGvE0TuXKjbTnPa2WfHAz4qjT9zWXAkfQQ0YZCnJD4C8UDzJjlrTLXy5fxVEMvg5W5zp
 T924P3MUPPNCqUKyFqyS0YnsnLBvDZMtphKfmqtmspfbrMO+LY2q2bZvKUfGK2vLmkrTQLxMv0m
 9EEpc/oC3F2R2nrIyktPZ2sxhLPsH5Kp71hLkB0t4FuWwLW/iPrPYvdDOCVP4n2j1NeUwA32Mrt
 XUP5rDtPixnoy/Dpv1NDpvsXr/YjL93LS1CZQ8JHzB3CjZfLngGN8642Q16JUlCg8BrhUts3usv
 PoovQP9wxun73k18gKA==
X-Authority-Analysis: v=2.4 cv=G+4R0tk5 c=1 sm=1 tr=0 ts=6945762a cx=c_pps
 a=Qfp2hYxCm4TKCtBwJVH4Fg==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=nGTE4TbgFE4Mitb3AD0A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: SORP76tz_XdaFqq_OctR4cqJknChaO2W
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133

Add the power-domain property in the dcmipp node of stm32mp251.dtsi

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 arch/arm64/boot/dts/st/stm32mp251.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/st/stm32mp251.dtsi b/arch/arm64/boot/dts/st/stm32mp251.dtsi
index c83fa864eb3d..e8b6a593f237 100644
--- a/arch/arm64/boot/dts/st/stm32mp251.dtsi
+++ b/arch/arm64/boot/dts/st/stm32mp251.dtsi
@@ -1601,6 +1601,7 @@ dcmipp: dcmipp@48030000 {
 				clocks = <&rcc CK_BUS_DCMIPP>, <&rcc CK_KER_CSI>;
 				clock-names = "kclk", "mclk";
 				access-controllers = <&rifsc 87>;
+				power-domains = <&CLUSTER_PD>;
 				status = "disabled";
 			};
 

-- 
2.34.1


