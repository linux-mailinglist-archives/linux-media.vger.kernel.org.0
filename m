Return-Path: <linux-media+bounces-49202-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F1CD0BA4
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:06:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CED3A30B1187
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:01:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60F1135B12B;
	Fri, 19 Dec 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="KnjWXq3V"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FB9C359FAB;
	Fri, 19 Dec 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159927; cv=fail; b=pROWMrE8meLM0bqUjC48g8Uws8cnlldPJKz0EP9sZ4vZ5OPD+kDVDa/Yhg+FeEaN/HhZukWWIWfrIZfdc26nrbFi4uBCW0CXzN8O8nQTst3WG+fi4Nwpboam0BV1vQt53UfVrIDOIrdtqzN/76kODnaRweaVmYal3WYkgMsAL9o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159927; c=relaxed/simple;
	bh=m0tQuCf5pABChn2n7A8mOwVHvuXkFctbZhoNz0ZrSaY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=Z1Fjy1p4zqio5LCMcBLPXPyMo6u/AFHJGBfL3ElycGqlm10OvqADE20SbNrzuwaExyfIfC/n+PMMhkxGs735nJxUoTIyDh6a/dwedzQEXKLoHSi8HnvWvVjVj87Bxta5bwvLQz0IlFIfDp4EkrFblgZPHqjd7+wamdhfByBhMtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=KnjWXq3V; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFnM1q639537;
	Fri, 19 Dec 2025 16:58:33 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010009.outbound.protection.outlook.com [52.101.84.9])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31c0e8-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:33 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIjNKBxiV7Sm3vd5u1BxlKivn7eYDGA4WMgSu0J8t2VawENkNVlcE3p+5f2afLz6zkN5Nj3Dtwt5loiB/nO9d7ndlYh2u2vjHfk9oIweV9U/R4daCFCI8bEdvgcpyX5G7jTcu0xItwuVce9lKaPY2acRoLUuzsOUjQi8OJlQxaxQ8L2Qnw4Jf5O1imfEv5wjxumYV1boY2c75rMALLDRT8a2pOKNsJTKv8BdSsjNrxxeQIifMHFiB758qTsJ7c7kl9EaamgMLDY6VZTNVQJjfqUADdurCEMA41MlV27gCIXr5e7y97+Bn3IHs4xH8MbcBwcFZZ2FiZivRfGCAOfiQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=P83z54t4RVIdn+BxXjJj4Lwknz95Dev3B9gpdESw+Ig=;
 b=yOMETxNjaMDSNEuJZ/AoqvdrRWI2TVBdw/yBInYzx0P3NmrEX4bhAgkbjqTkr4i22uaJ8ztEAif7ly6tdn2j8jSSfGheykDmrpkeahP9fDdtbQcXzFk8JxnUMJ1f8kQP+t/Y6WhYyrEFHCHyd0EzdWMLklbMmfnUwjvX5wxBGHjd1C6KU610I24UKP7wXyFuR1WdXBy1+ZEQssetPYF4TW2lZhmHv/feJ0CeisBrPfZu+si+lpPo/eXQuhWhNDywCroEH+DDvnv+6Pi3nhNOa0BlTtGowiNYXh4bGKIIvwiQfjk/NHkt5stjVtAFLg0ay80YSdDo4zPOH5vFc9SulA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=P83z54t4RVIdn+BxXjJj4Lwknz95Dev3B9gpdESw+Ig=;
 b=KnjWXq3VMQ4D4euFlkHxVO7cwhnxCjJOYH6jfqIBeLYNWuvt3RADvLE0VHIm8+/du2CDTP99pjsteFHWjS+jEc3jctVIU6RsX6s8ya4H76LRdhVytpJdUdqQGhBNwmZ6PPqax5arWjbrFFcXYmG+gz9I5w4XARowp+f8WcOEX/o6LjaPqCAS+p40SOAjqBj1xNxuqVadojemq11pmcJcy6dHYTiqbLjjaDzFOr4BJy/JfMuvGtliIUXARqW+NErHCMqtYZVV3qd/vcn4058OwO+eHGVSqd+z3RwmGC8mmqheN65Vj+A6eIQSvtNuNaR8m5p2+Pl/E/Pix9kYassAMQ==
Received: from DU6P191CA0039.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::13)
 by DU0PR10MB7460.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:10:425::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Fri, 19 Dec
 2025 15:58:30 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::41) by DU6P191CA0039.outlook.office365.com
 (2603:10a6:10:53f::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.9 via Frontend Transport; Fri,
 19 Dec 2025 15:58:27 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DB1PEPF000509F4.mail.protection.outlook.com (10.167.242.150) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:30 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:14 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:28 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/6] media: stm32: add dcmipp/csi power-domain support for
 mp2x
Date: Fri, 19 Dec 2025 16:58:02 +0100
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-0-a6edb2aa8154@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAp2RWkC/x3NwQrCMAyA4VcZORuwkbnNVxEPI800h7ahER2Mv
 fvKjt/l/zdwqSoOj26DKj91LbkhXDrgz5zfghqbga7UBwoT+jfdCJPRipGTmiG7opW/VIwlzZp
 xiP3AI8udaIEWsiqLrufk+dr3A44Lvwp0AAAA
X-Change-ID: 20251219-stm32-mp2x-dcmipp-csi-power-domain-7d57c8ce622f
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|DU0PR10MB7460:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c6ba75d-e05b-4f48-fe4e-08de3f17747c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dGI2aUxpNk9icnRGWWlsQWRjTGVVNFVkTE9veDg0cUZjbk4rQVFGWkVDYjN2?=
 =?utf-8?B?TjlWVjdwNkorUUVKSm5NSjErSUxVYVR1UWs5RERhTG1zSkhzNURzT3gzbkta?=
 =?utf-8?B?Z1BHOC9OVkpCVHNnWERoZlo2Mk9CL3JEQTBsc3VKSnhIZ0Q4YWtsUWZhMnor?=
 =?utf-8?B?OE1iaEtlbUtEejhzanVIZXZhcDVZWnJHMUVjd2Q1bDVEMXVPVGFpMTVRaEZX?=
 =?utf-8?B?OVNPOGpBUitWWnNvTWdtYWJ3WWk3QUJTUDJVZTdjRHN0RE5rQndoU3pRWWFG?=
 =?utf-8?B?WkhxMW8zei9HSzF0eTlWZWZ0SWxGUlBjL2l5OGFvTkJuZjBERHo1OHVEaVNS?=
 =?utf-8?B?TnZQT1liKzBHb3RSTHNyRlJ6UHhtU2JrUmFvNHFvUzloN0VqUWdwSkVHem5R?=
 =?utf-8?B?UXdMOENMSGtxRGVMYU1IVHNvdHNTbTBpcDc4Q0UxaElCUm1Oc0dOdkkwNXli?=
 =?utf-8?B?azRmU0l3YzdDTjJ2QXZVY1JxOUtBQWdmL2dENEw0dzhDTUxjdUJQQmh0Z2k0?=
 =?utf-8?B?dG9mdTdtUjBISGhkeUoxamUrOVVlL25LQXBZZ09tb3lBOVZYSnJSVFVHTUZV?=
 =?utf-8?B?ZWR6dWtBcURyZUNSd2ovemJ5TEtEc3pVbjAwTVVqS3pyZW1QSW9nbkprc0xG?=
 =?utf-8?B?VC94UnNvMVBYTG5lcmU0K1k0b3BSN1NieEdybHlwMm5mby9DRHM5Tkl3S04x?=
 =?utf-8?B?bkZFeXFydWkxeVdjZ3ZaQjFHbWU0ajQ0V0F6Yy9pNjNUMXJJclFYbTczdGsx?=
 =?utf-8?B?MzlGK1JQdlRDT1ZwYXUzVGpoMFN3dHNLWDZ5ejl3dkRhS0VPcktVWlVGUm1Y?=
 =?utf-8?B?VjZUM0NRQzhHUGYvd1lCdGNXd1RtdWx6TzZoNUp3TW83UXVDMmpCOEhhMU1T?=
 =?utf-8?B?WS9IbUY5cEpGWTBwZGJvcmtsMzNsTm00TDE4WUxKVjJ4YVZvTFZUME9aZUtF?=
 =?utf-8?B?ZHp0ZHBnUUNQY2Qyd2htYVdscy8xMmZXWTV2V1gvR0svVG9OTGpkbVJxZlda?=
 =?utf-8?B?MEVZSzZObzduSXMrL0RaODlGUWNVY3o1bGVtM3JpRWQxMWo0V3hlUTg0UDZV?=
 =?utf-8?B?b2VhUk5rTGJZRGNrdWtQN0Nad280dXhBdDI2K2ZhWWZCWFdWTkhYWXVFcnRr?=
 =?utf-8?B?bUU2YXZFNHhiOXQvZXJhaUsrK3QyS0pGQmF2bllDdnNZUUs1Z0lUMnpVdXJr?=
 =?utf-8?B?WHgxWTdLUmFzcklZWml0ajRyRTN3MVl6QkRlYTZyL1dDd3NLdkUwS2t5ZUZV?=
 =?utf-8?B?TThuT1FuY2pNOE5uVS9DMWtaWEc2eCtjZWhhUmtuZWJMcXZnMjNHUXFqL3h0?=
 =?utf-8?B?SlZidjRiTzF5RitqdHNPOVZkT3RHS0R2RGNGTUpPZ3k4cWlaVnRpck1PS2Vm?=
 =?utf-8?B?NEJXa2RYenRYUXFHTjZMVWRPT0JkSkVUc1B1bVQ0ZTIrOWpNcGptL2xIdTl5?=
 =?utf-8?B?MktRQlM1aVEwOWFiWkJ6dS8rKzdwN1hsSFRNaXozNU9PaFkyUXE2cHdrZEY1?=
 =?utf-8?B?aE0rWFNUYzBpWWljYXhwaFNPR1EyT3NnZW5GNHVaNVlHcHo2QzBZZ1F5OGs2?=
 =?utf-8?B?eHNyNjJHd0ltWnNXaGpQYWFQNkNUU1JmRkhncmIvSHNsRDNiR0hheUdqY2w4?=
 =?utf-8?B?dXYxQnV0emEzb3NZakE0UVU2RzF2SWhKc2N2UXp5NVBzaTh0dW1GVHlISXcr?=
 =?utf-8?B?WUlmM09kZFRabzBZRXRsemtuTU9CanF4ZDNKbWV0emMxcWNtVHRNRGJoaDRz?=
 =?utf-8?B?UGg5ZEQxRWp3L3Z2cHYyK2gyejhUd0I1ZGpLUWswMjlOejYzNG1YRU5odTUw?=
 =?utf-8?B?RWhNS2RRckxBeHp6NTM1WHNvQjJaSHlhOHYzQXlwU2krTERQZDIvV2tWWkNC?=
 =?utf-8?B?VytTdUlma3IzMTdKMENDMGFTRmJzVlFmMUk3VkplRTZRcm15MmNHUjZJOUJE?=
 =?utf-8?B?R1RRTmJUUzFZamYrQWVoak55NUIzN3NkK1RaSWZaTkhEeU9NUkw0RzZ1ZXFD?=
 =?utf-8?B?aUFpUVppZTdnM2plU1ZxZzAxczIwSEhMWnRZWFlsNzZlakl6amVGR2ZoaFVP?=
 =?utf-8?B?cWtsZ2hzWUo0c1ZzSnZLaC9kTFJQdlRZNWRZcFJFY0NTWXVoYVczbENHVkhz?=
 =?utf-8?Q?YhaA=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:30.3156
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c6ba75d-e05b-4f48-fe4e-08de3f17747c
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR10MB7460
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfXwV92qlZBEeZU
 xuo33FGIGVdsTBewPsalXTjCC+eJtpLyucqWemNJiiv97+sIF+S2UYebeLc4qVZCdXP0y8A/py6
 dLy6FwKI+zZ6oQ/3BiZluCCszrREGwghC9q9eqTlAXQrPz5uMda9ArnYWsTumCL9Foq0QOEKBjp
 Z3hYoqMOJhqPvUjbik4eXEU5kz/bBeno6sYhSevSbtcoVNKgF0maF4EWQtqMNKjuub7e++BcJev
 +RXrPPEMZuU71YO0VpkjnSj5xkDpo428PKqOI6Ehn70gtf61SxESgk9wc7GeYM2uM3IjtLtrUhj
 T3I5hAE3IH87Wfh6HGhcZyCEdvVnFqsOxibQ/zx5ZSt51HIZDwRjKRm30xdkXwpUoGCim6ehYuC
 0lcq7INnLNl6TUsV4HqZe5+cpbvh7gD4ocDz7Uni6JZICE6qi5+UDffYhaP0CSaAySGpXGJpM1B
 RnEuTchHr79UWPeWuIw==
X-Authority-Analysis: v=2.4 cv=e9ALiKp/ c=1 sm=1 tr=0 ts=69457629 cx=c_pps
 a=vGiblOlS/LqLBBgUNMMFMw==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=5zBtNcBaJgCfjQ6ISLUA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 6HDoRO2kAAtqTZ7ieLXQIT612-qCGWZY
X-Proofpoint-GUID: 6HDoRO2kAAtqTZ7ieLXQIT612-qCGWZY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133

This series adds the bindings & dtsi updates related to the power-domain
properties for CSI & DCMIPP of the STM32MP2x.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (6):
      dt-bindings: media: st: csi: add 'power-domains' property
      arm64: dts: st: add power-domain of csi in stm32mp251.dtsi
      arm64: dts: st: add power-domain of csi in stm32mp231.dtsi
      dt-bindings: media: st: dcmipp: add 'power-domains' property
      arm64: dts: st: add power-domain of dcmipp in stm32mp251.dtsi
      arm64: dts: st: add power-domain of dcmipp in stm32mp231.dtsi

 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml  | 3 +++
 Documentation/devicetree/bindings/media/st,stm32mp25-csi.yaml | 3 +++
 arch/arm64/boot/dts/st/stm32mp231.dtsi                        | 2 ++
 arch/arm64/boot/dts/st/stm32mp251.dtsi                        | 2 ++
 4 files changed, 10 insertions(+)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251219-stm32-mp2x-dcmipp-csi-power-domain-7d57c8ce622f

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


