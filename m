Return-Path: <linux-media+bounces-49200-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D847CD0D25
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:21:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48A30303EBB9
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 077BB35A945;
	Fri, 19 Dec 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HSllJdUQ"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06B435A926;
	Fri, 19 Dec 2025 15:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159926; cv=fail; b=TnQm2pmtT/iQhDcrjiNORb04yREA3imYharCha0pItjkD6qk+hQyLPGaHt7YL/ynq7uVvIlu3Ketd5xwIX9I95+NcKB+pQbDe1VaLK0dcu+342tucF9N5Kj6WvWeNqoNfQ5Spz1ZD8bGjO0Z42HH2Z8YshLFau7+NnpbBpXEM9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159926; c=relaxed/simple;
	bh=oeJZgaV54BhNMJAFFjICcEz1Sft0oIQr7qm48MU3kpc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=eJT9c+YTnQpnk0YeFVdVXRPjtC9Oqb4LYPn9YWJf4UvzOEcIBYxVGmcQjFAu1Sasa5nttcH4cfyjCUgdEeneIvV4ifACt3BgvHL9EWc1D8RQ8m4ng1x0WmyInjih7h3w5q0R9d0VLyd2XjJe3pu8Ft307fsZ/FxS1apD2GYU/lY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HSllJdUQ; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFeGHD1082923;
	Fri, 19 Dec 2025 16:58:33 +0100
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010034.outbound.protection.outlook.com [52.101.69.34])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r33m1u2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dfneCFd3U90X2Ziolly1zIDGFcBTEHYu9JPXfKg29eXqYNfOq23NrycF74EByb7242WmUeBvp1J+DcuIXhpV5V4J8xy929F/6KIOz3weSokR/CFz5I/a9h1etujn8RGAsz+J2C3R43g0ybf3RW3bbp+JNNhnq7mOK6hKXCEh1ugI11XNazC+etjs7njvo87ZBuebCf/lQv74oMEAT5woQJEo5wq4wb1S7vwpG0aaxKew7Zx2OcoBLoq9R+OUDYi8eBFoELoUf7ppRVIbnoSP7pBrTiWrqFqVrUjTIQUUf7yvepF6YphYNUFjfM/CpA3HVhgzV4u7tkhQG841db0KmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MOQqo6esYXr0sWX8zlUAxQpr7hNjjR8qvUZ2Bnc7ABY=;
 b=y4kDbeF7mv0o1petuzirHmyczfPx3MDcVCeo3nLp/g0zB2MHp4tVbqCfdiBAqJfo7/d19PkXgV1wy12H6p0s8WRJIByRRL/KQBgDKn9e4zSNW1GLUq5T/Okip+/UnaeYCuYYb+pamBuIQsmccujnSVMDRUoPRIQPRp9IWEoTeQotYf0do3bb6dihx2IK8ICfdEHJNO6iILmgYDvaSy6rC+wOi7ySNLV1dTj/TsQzAxBKuwIcGGBQ4K/gG577Qis3z9RSAScKzTNCtJ3LzTxQLyc0or2aGkRH17W12sIhkHVLH45yJO4uc4XYoL/TT35h6QdOPe8zeMf26EAUEJTc4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MOQqo6esYXr0sWX8zlUAxQpr7hNjjR8qvUZ2Bnc7ABY=;
 b=HSllJdUQYuFaAeCAMUVQ6v9MR9yuTjiIwGUOAOUGkULVLJPJCvWBCvAZPHAjEJ3iztCvZYm+zpkhRKSHMBS95bsfi3mcQIF99olBD7QpqahDJtinvtLfiGOzDHoKVcnpMPSILP2QUB0sRJnKcTctK+FoBm7z99YL0ilGUDSHm55LMh7cmMl/zH3jcMaced2I6hHWMDth10jFE5Vx7zsHRKETgeLWdmC+AvYlUASTFdhEec/8h6neoz0auUwmXfo7BKjkSB350JCcM9Owtw/9czhHT5U4JYJwEyAKPoGmw5q8SrP1QDq5mlseRO0TO+Lssr1J0xseMediDTQQfWoqRQ==
Received: from DUZPR01CA0340.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b8::13) by DUZPR10MB8125.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:10:4e0::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Fri, 19 Dec
 2025 15:58:30 +0000
Received: from DB5PEPF00014B8A.eurprd02.prod.outlook.com
 (2603:10a6:10:4b8:cafe::a9) by DUZPR01CA0340.outlook.office365.com
 (2603:10a6:10:4b8::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 DB5PEPF00014B8A.mail.protection.outlook.com (10.167.8.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:29 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:18 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:28 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 16:58:03 +0100
Subject: [PATCH 1/6] dt-bindings: media: st: csi: add 'power-domains'
 property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-1-a6edb2aa8154@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB5PEPF00014B8A:EE_|DUZPR10MB8125:EE_
X-MS-Office365-Filtering-Correlation-Id: cde6acf7-61df-4d2f-55be-08de3f1773d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|7416014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZmN6aDhObkZrWlEvK0p6bGlTSVRwcStTb2NQVTB0QUV1bkVNMEwxYnJDOXdx?=
 =?utf-8?B?N1FoUnRNQnZGbnNhck5YMWZCc3dQbHVFbStIc0hJMmQrbXNkUkFHT2U5RmI0?=
 =?utf-8?B?S1NBQUYvNzdhVFpoZXNKN005L0ZXKytmZU9FMW1ORENwaTlJZi82emplMXBn?=
 =?utf-8?B?U25NbWNLdVA3TkZxZWJmRm8xaUREUmpwaldBaTNVQ0tHTGgxaDNGM2RNa0hv?=
 =?utf-8?B?ZlIwaG5wdW9sWlpaUXdzWENFZW5NVTBTMlRTTVBFSDl4bWJzcUVHT3pZRFJa?=
 =?utf-8?B?QWZOcnVtMlpZUVhPUm4zWUdHWHFCWjlQZE5DMElZN2U3ODdTbFpjTUpTeTlh?=
 =?utf-8?B?dHdBUVd1eUdaYko5L0lORGhNRkhsejBobjdodGdkRXVZMVVpbmZ5bE9BV0hS?=
 =?utf-8?B?MC9VMnltZ1dWQzM0RFhEWHVHVEUvY1JlUWVRYnUxbWVFNmxFVFIvNHV2Rnp4?=
 =?utf-8?B?aDh6U1FGUVIwTHhEZ1VoWHFpbmtiKzZOc3JyRXN4UTRWZ0FKSmE5SGswOFY5?=
 =?utf-8?B?YUpKU3krUDFqSG1MWGxQN29vZVdJV09QRUxzYm9iNDVORUZtd3gvb3NHdEt2?=
 =?utf-8?B?QldiRjFWMkxQR3dwNDNJalJoTzRqV0RqWGZKS0V2NVFBOHRQT2VYek1CcHg5?=
 =?utf-8?B?dWp5ai9Kc2Vnelp2R0dyekNNT1NJZFFpNWxuKzVuVzZGYzNQR0xLcjlmMWhs?=
 =?utf-8?B?Vnd6SEJoSFdpUitZTDJXUnh3SlpEUEZTblZrVytTU0llOFdqYlBKbmtPT2ho?=
 =?utf-8?B?QnVpbW5GbVlrQzhYbkhpTytmYy90U0F1WWxEOFVIa1A2WmRnWEtRWUVVUnJJ?=
 =?utf-8?B?RGdIZVN1M05Sa0luTkRlVGxnOEN5YnI4eDBWa3NQYnN5dTh3YnQ2K1pPckZG?=
 =?utf-8?B?R0JvT200UldaSmFCaXdVVnN5Sjd5K2l4c3J1SktzdThieml4aTRnS1BDMHNI?=
 =?utf-8?B?Z0FYbkV2OC96czg2K3RiRXBNMVQxbEtNMkRHV3VXTlNUSHBFNHV3YlAxRDZD?=
 =?utf-8?B?Q1ZkTStpaXRtNTJIdUJwRkFabWJNOHI1QzFzSG9xMXUyZkhRdXNPWGlsdk5B?=
 =?utf-8?B?QWxmdC9GMlJjLzBWYzVtWEFpdEIvQUZoR292RXJRWG82RFRmcko4Y2pEaTdR?=
 =?utf-8?B?L0wrUFRNOXpKT2txSUNJWHhabzE1RzV2MnZIOHJxN1BYNyt4ci9DMmFhQlBN?=
 =?utf-8?B?UTNJVVBPNTBidkV5VFVuOUNIL21VUDROaTByQUY2M3FabnMyRDVudXJIeEJH?=
 =?utf-8?B?ZmNyeWhwQmU5WVJaSWt3OGtiYnV3MDZOenkzeGU3dGJXUGJjRlRmVXNwdWZB?=
 =?utf-8?B?MnJ5RXN3NXUrR0Q1bC9qakp3L2Nkemsyc25xVWswdUszSXhLL3lic2lkWkNM?=
 =?utf-8?B?YjFzNndLYU9wWU9nYmM2aVIvcURqYTUyYnJMWTMxbDRHYTNEeU11YTQ0VWxh?=
 =?utf-8?B?MkdIZjcyR29FdWpldnIyZ0hDQmxoTFVScDIwUHd2SHpiYm83bSs3cHNyUHpz?=
 =?utf-8?B?eWo1Qnc4WFo5K25OSllpc1BrZkw0V012T090dmV2dms2NUNqVkJ6cHJHU3Rj?=
 =?utf-8?B?bE5jNU5DSlFPemI5MUpLMTd2T0t0SlBQNW04YTZVZjE4WVV6dHFqSElkRDRG?=
 =?utf-8?B?aHdiWnlHWlpSZmFRWDFFUld5V1ZUUEpFdG1iaVhlMTBlWXdjSm5BWEFLemxZ?=
 =?utf-8?B?cjhqcys4eDlhT2JJeGF4M01CbnZxZHBpbHBnUW4wV0QwVnNobUFnUjdoL0NT?=
 =?utf-8?B?a0pxNGU5T215aEROL2V6Q2dpVGt4MDRtWWpGc2VtTEJON2xEcHl4S3NiR2Vj?=
 =?utf-8?B?SCtkTUl6ZmQ4TVZ5Mk1ZZ2tYZERjYVJNUlA5VnVOR2NYcWYrT0Npak4xZXV3?=
 =?utf-8?B?RGFuY0x0bkUxV1J2U2NJWGZqZHhtUkpscHByU1BjQUowaG96b01wbm1HOGhV?=
 =?utf-8?B?UzRkd25MWDNrQXMyYVhSbGZUUTlHVW1RTHZvbWVRbWhkRTNYR29uU3NhaVB2?=
 =?utf-8?B?REExa3NqTkhYYmk5TmRsT2lOUUNKTjcwSkNqajJMZmgvS3JpV3VpaHN0VnZF?=
 =?utf-8?B?dmxtUHA3eVMzSjMza3R5ck4yZSs5eStURGhob3FuV2FZdzlvcjBxSWJEQ0hQ?=
 =?utf-8?Q?kpE4=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(7416014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:29.2367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cde6acf7-61df-4d2f-55be-08de3f1773d8
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB5PEPF00014B8A.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR10MB8125
X-Proofpoint-GUID: 0yRGtW4K17aTljTw6N24kiD8TbejuCd4
X-Authority-Analysis: v=2.4 cv=HfIZjyE8 c=1 sm=1 tr=0 ts=69457629 cx=c_pps
 a=iHEZkuJbXSvT9MIzUTrV1w==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=DKoLgnomprVZGASOcXQA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 0yRGtW4K17aTljTw6N24kiD8TbejuCd4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfX5E6NeH+ntFJp
 GXMTRiPe/d6WmoLJUVblmLdtvoq/64U1kKGSBxg7FWpMG6qoohNa8dR3cHKuUBcdizR65KJLIJc
 +gXzIu0Xt4/B1NDfzGnKVntUg12/HuJr1GAdGXKXlP5izRuYrRHHCvBq7Th5HaxNhaYRbQe5NGW
 q+fyMfce323awRED+Pk+CdpGQmRpMkk4uHm8ZUheR8gshstmAXu6GwBzyJf5EK0tjWqYpgb1QJ2
 XlWQFG0E4WF1m/RuXo6i/k/VZb5CRmi3JEiSzJSEMIfcfkpgPNeEKWK4X0conPlbSvBDU9OFYkT
 lMNWSvZwC+eY+uDwi4e0BYLgEn7b/FswkCI2e5KhqbskWpwvFLntU8qY/QzOapBDVJyqSCN6Izo
 XF58G+Aj1kR167NnZTIl4heITJ3Z9fNdo8DxtMDpGcn7dXMVqsLqbgIwsoK0o7xcGg3TEE/oyEx
 Jnasycko+WWbcudeIDg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133

STM32 CSI may be in a power domain which is the case for the STM32MP2x
based boards. Allow a single 'power-domains' entry for STM32 CSI.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
index e9fa3cfea5d2..2ac7c9670c62 100644
--- a/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml
@@ -46,6 +46,9 @@ properties:
     minItems: 1
     maxItems: 2
 
+  power-domains:
+    maxItems: 1
+
   ports:
     $ref: /schemas/graph.yaml#/properties/ports
 

-- 
2.34.1


