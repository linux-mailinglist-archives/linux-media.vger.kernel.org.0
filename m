Return-Path: <linux-media+bounces-52013-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 3YQSMyqvgGn6AQMAu9opvQ
	(envelope-from <linux-media+bounces-52013-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:05:30 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2294CD1BA
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 15:05:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C3CFD3089367
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E19E336C59F;
	Mon,  2 Feb 2026 13:58:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="Sjr+U6tx"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49455369986;
	Mon,  2 Feb 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040694; cv=fail; b=O61cWKdka6o5H4sYGiYlEH/aHCDkg2PMu4mpVVPzWlrF3I0yOWWzMliMCjr286B19iNF4rMTRAWfXRUvniE4p2HWSIWLXX3mq/Pv0ROHwnqpVMzNvVGg17NWiQ+XpG5BtCkZr/ay3uDx8WDs/tBeWxKJxASkW2pOWnrRqcSQKeM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040694; c=relaxed/simple;
	bh=0icHvEK+iEppPVHfRo8CqP4sXr3rceFwGDsgLb10cjs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oxwgHgXDLvoCGr1iaS38jcowZrTq6SWI+DaCuDwg44xZ+lHr8zHlDl5akfeqdQ3h4NUtZB4yqUQRZAJW5Ic2TDKuWIKojuubjPx3InWOCvSQ1yuBQBCX2D/CYMdarFOImg4yHsIMIQsyRdjOnnjmTHF0eKbcYpAKvyjeEnt7s4k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=Sjr+U6tx; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DtJhi2923368;
	Mon, 2 Feb 2026 14:57:49 +0100
Received: from gvxpr05cu001.outbound.protection.outlook.com (mail-swedencentralazon11013007.outbound.protection.outlook.com [52.101.83.7])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1apvx2n5-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:49 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R/iszpNxgy2bXO+aJQuhgCfRLwaY8bTBUdCR1aLKsumlq24iuFjMBx3wXoX8SmxbOXEAa6Bzvoq0ty+qxv4/3Iy6oNtKGAZp8Kky/Fg0Hork2tS9ugIdTHeRxGlxnpToaqZfew7c4O/rU0nGfM3fFrl63YsTcjzee2Pp9oYAqnu9ynZpqDZQ0NfASbhWgkcP5dbQvNxy9RaACGR9cqe7EZwuLD3BMmAAcNmHe7RoIgnNYOEf0QhNhXgxb0FSlFD+gW8PWKM54jRalrC7/1dqOrXm/sGmDRguAShTBVoUbhP/2wB6NMTh01M8I2gVaoyC9yKHuydqQeBkogomtnV/RA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bgr1Nll5shg0N2vXrkopM9HLp/0rgysfX/9IP4Qq0m8=;
 b=w62e4NSQ51qvNEVK+CcCLuEMJOVpxr/YO83wNSF+9cVSHxKl02zBap1KLm8Lyfouv7ivN1mrLnYMsCSmgXPYxjAw3Txuus/Im9D6wKpPf1ISXrXR8GWUpB2tc5YjSP0eR1zUhBH1SwCxsAkFpcGhewURfRDTzAxzUsMkfTkaKuEJep0vc4UBASNrZjhpFwgKMnqwjQMevtX+zYXehDDYTpRoOeHuDqsAqMmHyJoo8pckCiCsjhYA00psWqkGBwqi5jixOAvP68o9CTRNnJs4zpmOK8yTaekWX+7i/xdnO8uWxcluwACp28M7LrmjDrS9b5Kz2jMv7TOCAf6yEce9YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bgr1Nll5shg0N2vXrkopM9HLp/0rgysfX/9IP4Qq0m8=;
 b=Sjr+U6tx0573s0ETDUfmoITMcMj0nbuJ5sjnyLXV3Lq61gPO28SmZRGTj1EYGw9eUsxpcUMthCJKKKh+PzYcsewGOwUHs+ZdUryKyaxQB+AZsaU0lA7/ad6uVcguTOVsULG3gbY6Cu91sJQDVxDaTDSQXbMnW5Ex9//fRLbgDlcx82ErDx/Q3IieewBzggwsxy6VMgvVH730HIFC35Bhuqg7RcpTZAXAmMW2H1T90rs9lObuVafm3A19BxO+pnRP6SGH5E7dj7OGQVQb+cPzKrrDGfLwjhJp+a9Jq+KVSAubevkJvRU3ED3A5gudo5kSnvLo+U8Linm5db1l5xfp5g==
Received: from AS4P251CA0003.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:5d2::9)
 by DB9PR10MB5211.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:33f::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:57:44 +0000
Received: from AM2PEPF0001C714.eurprd05.prod.outlook.com
 (2603:10a6:20b:5d2:cafe::44) by AS4P251CA0003.outlook.office365.com
 (2603:10a6:20b:5d2::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.16 via Frontend Transport; Mon,
 2 Feb 2026 13:57:44 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C714.mail.protection.outlook.com (10.167.16.184) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:44 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:21 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:42 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:27 +0100
Subject: [PATCH 02/13] media: stm32: dcmipp: make dcmipp_state & cmsr2 read
 common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-2-8d8d51f5e014@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C714:EE_|DB9PR10MB5211:EE_
X-MS-Office365-Filtering-Correlation-Id: 24c2b2a6-5b3b-40c6-e580-08de62630a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cllZVkprTWdlWlVwOHFhMXQ0aTNBaUdVb296dTJ1SWJyR2VVTzZzS0tmZXVU?=
 =?utf-8?B?L2lNVDcrYXFJRGVZcS9kck9wWW9mUEJoL0c5RUJEbHpybTVPblVtT1VkTkh5?=
 =?utf-8?B?RFREZ0pycmIrdGN2eExvRjl6ZjNsbEVDc0JXS3FPNzJkS3lseGpaYUlLQTNs?=
 =?utf-8?B?dnp4NjYwL2t2ZFgvclc0cXNWTTd6OTVIRHY3dmEwQTMzdjVrbTJ2Qy9taDJ2?=
 =?utf-8?B?elpjSGduTGZjRUV0NmJYY3ROcE5EVVFRS0FWODErWXZBeTFub1RnSHdLNjZ4?=
 =?utf-8?B?TkdJeDFhbndZaEJ5dWFmUk9Kb0cxWVZxTVBQWUYzdU03NlY3R2c4UCsvMmhI?=
 =?utf-8?B?cFhjbUFheWpWYk5vV1FhRW5hZmpRUTRHRXRFSExlK2twYjVIcW1vYmpVSEFh?=
 =?utf-8?B?clZGc1JiNSs3Y0pGS3EvejNvU0cvU0FzVmJIOUZqckJ5SDdob2ZHVGgwYzJK?=
 =?utf-8?B?bXB6U2FJNm1qVnZuT3NUSllFbFQyeW1FTmRvaVpEVXF5YlA0ZVozY3dzYTRP?=
 =?utf-8?B?emN5SGVDRG9aWUNmcVA5TlE5NTg1WmFpVE05OTdQcUd5Zkh5ODY4b2txVTBV?=
 =?utf-8?B?RkdYNVI4MnNGTE5URWVHNkYrQzgwU0NaN3g3ZjhMVEFyaWFmdmhoT3J3VWtX?=
 =?utf-8?B?K2ZkMk5DMWVwTWQrNnZKREZlSC9jYkZXbEFvN05ybXVkbmNueHc3TmxaMVAw?=
 =?utf-8?B?U0t4NTZMaCtVYlVSbkRTcnY5ZUpvUUZBeXJJejdCWUtBdFdIN0t1dUhjMGhx?=
 =?utf-8?B?U2YvSmxZemN5RGx4anB0cDFaL0xYc20wYzUwTDFZSWpOVXFRQVVpUGxvMGw5?=
 =?utf-8?B?RDMxeXZ5TmREZ0xLdGxqYVdiZkEzMUl3TndMTXZ3NWFiR3ZmSmE0Y2ZzbENz?=
 =?utf-8?B?cmFnUGw4MEZlKy9MYVU0Z0JiQVVTTC9MYUlMdExTT3RFUW1FWXJCTnJJSXVu?=
 =?utf-8?B?cHJRSVBLckNQaEtFeVFkekhHS0wyMGZWbVgyN0ZNeDF5RTIzQnRMVkhRWlF3?=
 =?utf-8?B?MHJDYjFXTzBkamdzeXQvT3Y0MjRITzJaZzdJZFNKTkp1OTlBZDF1SllFcloy?=
 =?utf-8?B?eStsbkhpTGc3YVlBVFhlZzI4STBDMTI5djZPQTlNNThsYWdidS9aZjZlakUw?=
 =?utf-8?B?MllYWmFFVDVKYVBzb0FFZ3REaWRJa1lrVytOL29SeW90dHcwNTQyVjlxNHdo?=
 =?utf-8?B?OFd2bDNGVlpBajNnMkRIaGlzbE9zWVl4bzhpbGptYjdsb0E4Z295S2hEQ1pQ?=
 =?utf-8?B?bmxXQ2VUWkVnWURlZXM0Y3d3ZDBMcnVtTDN0K0xsUFhTMzZWM3dFdEtjVG8x?=
 =?utf-8?B?b3Z2MGhPMFZpZzZQQnlSMTRLRGpmcW4yYysrZFRLQnI3VmlIeXNIb2NTcFpC?=
 =?utf-8?B?NklhQWRoUElGbGpOaFVCRkhuU2NnOFNvbC95SzZQZnc5bFFjd1RjeEE5d2Zv?=
 =?utf-8?B?UEVCd3MybCtRalBEWXFKQUY1blhwZDVyKzJvQzFJaGVNWmNSSFdVak1SL3VC?=
 =?utf-8?B?ck1vVjE4akE2TlRSYkdtVEozRDg1cVplMCtENzZ5empjM3krNjhqMko5K0dT?=
 =?utf-8?B?cGVkR3hneXJvMkFlQmNkV21kM3hub2FrSWZ4V2ZWS1BFZVhpeEwxS2JBclFi?=
 =?utf-8?B?Sk55SFlWckhBUzRveVZ3N1hHWjlZR3d2NFhwYS9ZQXU5TjNqbWZLYUxhWFkx?=
 =?utf-8?B?TWNNekYxSG1HRUdmSWRER0JvaC9JdmkvZC9RaWhTKzBKWEp0b0ZwYUxIU2ZR?=
 =?utf-8?B?STVRMDN2aXBsOFZTT1gvR01DbkJRSGQ5REt3aTI2YnQzcnVwaEhSa2plMUVB?=
 =?utf-8?B?WUwxV3RvWXZJWUNnWlZzVnpOaVk3bGFSaEkxR3JKdFpOcVNicXlBcVZabkxZ?=
 =?utf-8?B?NXptVlZ4SlRhTENWZGRHQW95SE9BZGdBTnhRcVVjdHFsdmxKMENKNC9aVDA1?=
 =?utf-8?B?bXpnWXprRWF6UXJFS2ZFREEyMGx1aE9FVDJSS1FZWmtxMWYzc0NIZG45TDho?=
 =?utf-8?B?a2h3Q0FuMHV6VjBKS2VVY3BLVHVGZ1ZTODJDRVVJaElJb2NCd09JQVhPRmVU?=
 =?utf-8?B?LzRrSE02NU5rd29xUjc3alRBQnVWZnRscCs2dzRFSmJDMmNMSGZRY3YzWGtk?=
 =?utf-8?B?TmVoODg1YlJ6WjIwUnptMUZvWkJpak53L0hSbkRZdzE3ejk1SXFKR3dJU29T?=
 =?utf-8?B?aEdpVTcxb1RRTGlVOVlTM2V1dVRadlIvUld5ZnU2aEM0aTUwUWJxTlFIVDZy?=
 =?utf-8?B?YTFnUWxTNWpPMnhNTVVYOHhSRFB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	1IDbCZM6LSzHdZlX+gHqxqJPHNNKwhWB3B5JYc/MP0i63/XezP8UX2uPgOUWYM9XcRQW+61t69r/8YifIfW/E38bIPiukNVnwDK3aNr2MIijPWHS2IjDuZ9yPcHfHO0RChBj2gQymiMOdD20WsQ73fDsnuQAUdXjGgxeSshPT4uMYPOrw11rNNvZYmEIAuXtrRQ3KPqAywP1vMj0WWGESEQIP5RORmfzPvXN8eMQDaW0GRfUwjGRMk53nk5hEzMmGMsRUKp5iGzvGKpD+RwD/MjPELDqnzCiyUDvJLb8OPcc3HfxpbYG30uZV/Yj/pFgke3o081Ri4RHvbZXj5jbQADJX+Q5iJmOdjsqMgVTI6omTZ9h8k/lOdQ9kV0UKvibmlMoj8sU3a8zsJpXmCGIwhKlIq7M3t1XDmyV3C/5XXMBL5UO0aUUg/V/WxkPBU2W
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:44.7612
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 24c2b2a6-5b3b-40c6-e580-08de62630a5d
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C714.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR10MB5211
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX2qcSCDs64Bdp
 JTAGXkOJQ+uZSEXQ6mcQ0TVYXGz/AFbQanTsPtPE/SSsUr8FqpjVIZ7/C39WKLaDJ8FOop29COa
 X7uBqDre2yGIRUk2/rOidF3HJFOQ+6gqZVXJrLvziGoWxsfrKcr5U3RVMoxAvCRUlsIYF+xOCdg
 pb7Rshg/m9Ixa90Ph3xOgoV7EMgz+4TaxMhZukokef346jP2lgV025K1wna0roAkr1OC2dAtd1p
 uUfcKJ6pIBRErimMHP+ny/mjqk8IS2mQe5fRmyu9UJd62UDtmBaxvoU8TVBbHv7EjWR5zsLPj4+
 yA7yyDBpLLP9FUT46/G7K+SDQenyXPHF75eQcXHK9xGPsFtcyJrPMhdpp+btYJ/11Z0f2LH7Hpn
 xF+M9z7HxjD0L3wq1Td9EvZFVJkPXQ/KL4FmfSWCM53K3vpS5D9WTUZIcg3AB+q+UpgP/v2Yjjx
 6kHwQ79hPoAcxSAonDw==
X-Authority-Analysis: v=2.4 cv=ILwPywvG c=1 sm=1 tr=0 ts=6980ad5d cx=c_pps
 a=ArpMZdbG1g2bWBlccyb4aA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=JmcKTV5zoc3sEJBI8OQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: 4mLW8kcmJNUJ87N1nUi65nILAKOuKFt_
X-Proofpoint-ORIG-GUID: 4mLW8kcmJNUJ87N1nUi65nILAKOuKFt_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_04,2026-01-30_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020109
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[foss.st.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52013-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[foss.st.com:mid,foss.st.com:dkim,st.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
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
X-Rspamd-Queue-Id: F2294CD1BA
X-Rspamd-Action: no action

In preparation of the introduction of the pixel pipes capture devices,
move struct dcmipp_state into common header and perform
interrupt status register CMSR2 into the core interrupt handler and
share the value with each subdevs.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c | 11 ++++-------
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h  |  7 +++++++
 drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c    |  7 +++++++
 3 files changed, 18 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
index f4b962867dc2..1b7edf0d2938 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-bytecap.c
@@ -110,12 +110,6 @@ struct dcmipp_buf {
 	struct list_head	list;
 };
 
-enum dcmipp_state {
-	DCMIPP_STOPPED = 0,
-	DCMIPP_WAIT_FOR_BUFFER,
-	DCMIPP_RUNNING,
-};
-
 struct dcmipp_bytecap_device {
 	struct dcmipp_ent_device ved;
 	struct video_device vdev;
@@ -797,9 +791,12 @@ static irqreturn_t dcmipp_bytecap_irq_callback(int irq, void *arg)
 {
 	struct dcmipp_bytecap_device *vcap =
 			container_of(arg, struct dcmipp_bytecap_device, ved);
+	struct dcmipp_ent_device *ved = arg;
 
 	/* Store interrupt status register */
-	vcap->cmsr2 = reg_read(vcap, DCMIPP_CMSR2) & DCMIPP_CMIER_P0ALL;
+	vcap->cmsr2 = ved->cmsr2 & DCMIPP_CMIER_P0ALL;
+	if (!vcap->cmsr2)
+		return IRQ_HANDLED;
 	vcap->count.it++;
 
 	/* Clear interrupt */
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
index e5c0eda8b18a..3c3996472e03 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
@@ -119,6 +119,13 @@ struct dcmipp_ent_device {
 	irq_handler_t handler;
 	irqreturn_t handler_ret;
 	irq_handler_t thread_fn;
+	u32 cmsr2;
+};
+
+enum dcmipp_state {
+	DCMIPP_STOPPED = 0,
+	DCMIPP_WAIT_FOR_BUFFER,
+	DCMIPP_RUNNING,
 };
 
 /**
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
index dd784cfcaac8..b06a4931ae95 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-core.c
@@ -33,6 +33,8 @@
 	.flags = link_flags,					\
 }
 
+#define DCMIPP_CMSR2	0x3f8
+
 static inline struct dcmipp_device *
 notifier_to_dcmipp(struct v4l2_async_notifier *n)
 {
@@ -251,10 +253,15 @@ static irqreturn_t dcmipp_irq_callback(int irq, void *arg)
 	struct dcmipp_ent_device *ved;
 	irqreturn_t ret = IRQ_HANDLED;
 	unsigned int i;
+	u32 cmsr2;
+
+	/* Centralized read of CMSR2 */
+	cmsr2 = reg_read(dcmipp, DCMIPP_CMSR2);
 
 	/* Call irq handler of each entities of pipeline */
 	for (i = 0; i < dcmipp->pipe_cfg->num_ents; i++) {
 		ved = dcmipp->entity[i];
+		ved->cmsr2 = cmsr2;
 		if (ved->handler)
 			ved->handler_ret = ved->handler(irq, ved);
 		else if (ved->thread_fn)

-- 
2.34.1


