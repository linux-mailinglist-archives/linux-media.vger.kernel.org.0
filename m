Return-Path: <linux-media+bounces-52020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YMhYFcqtgGmiAQMAu9opvQ
	(envelope-from <linux-media+bounces-52020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:59:38 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D06CD09D
	for <lists+linux-media@lfdr.de>; Mon, 02 Feb 2026 14:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 0E644300728C
	for <lists+linux-media@lfdr.de>; Mon,  2 Feb 2026 13:58:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B39CF36CE08;
	Mon,  2 Feb 2026 13:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="SvP5/mlC"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A15C36A018;
	Mon,  2 Feb 2026 13:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770040695; cv=fail; b=K/d5RkR9bRE2v0G4xpiLOEMK2IyKVJIE98+pycGulM8jCjJa1276lnXU0ggzB5B8c3XtlqpxhLe+0J2meNpQLhJnxvC4icOsDuEg1/qqlXpAyc4qenrRSKggYJOgLCl+dDj7rGBOrm8FMql5oXniwWrTSu57o1wZxpnF81KZWWc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770040695; c=relaxed/simple;
	bh=ririOBkaZtJeuAeASLNG+11CKSX81NVLBASPGzuofTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=iwVmm1x6vVHOdzX+qhfCtElJnJZuhpGFxamdJD/91w0K4sc6I0mIxxp1IYuheJ1pQNrQ7bEjdXG570jgwfxTvnGPpAb/N1xgbHyZ5uWaICSzNWsQO/XCibhrkQz5pFvhEAPe0TIu5pr0juVfX2lBIH9+dUTLoCrdwr7S8Eazu8I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=SvP5/mlC; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612DnJlJ2373383;
	Mon, 2 Feb 2026 14:57:55 +0100
Received: from am0pr02cu008.outbound.protection.outlook.com (mail-westeuropeazon11013050.outbound.protection.outlook.com [52.101.72.50])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4c1v654deg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Mon, 02 Feb 2026 14:57:55 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TCOKcDQ12RJ0DBh6pIzhF/9cgdRlt6prhp+2tooUtj6Ovc9ekSYfEVgZ9j7J7Vd9msG87LcUWrFjAqkPNu4Q8JbP+Gej2pW7bIX+NcAa8HM+oOgqnDu2ayyLJWg2d1NCvzRg/uaqb4LobvXh6vKtiqnshwaRO8ag7SPT40oOHkfmLh0LLiNc9FY5gBoNioRG9gjtXPvRdqEv61WGkBHO4ZvysPkf/DdieOfTe75wHX9szonQ0RVGsti2CJknD8InDXVlR491T2Bj75cfx44Y7t6YBAjYF0ehVLvIuvxiVJxMXbK7/cknDrhyvSRBNGIjv2UD4IPPerZYqIRa6F56dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UJT3eHN4UeJHXwVRCq2QVa4sM69W7PTrhVHDLRqcdMQ=;
 b=lHiQq4Ge2RhMrMm1jiXmj3KqD618W5mpHN0ZKm2x+evjLAyJRGgzsv+O+T341cnrCpvy0mq3AG0WSOhceftIgENtlsOLrrvrY4YzYXJYPTri1M0DYgCzJ6X9y0PqM+2WeWnDo49qBmtYBOqKQ6mF/zRaPuOv0Cfyw8znPKgjFp3IE96E/9JcbBSMsS8Ozt9KTeOrUU3GpxMN6mO2eI/INSRHDK2B5RNGbYJ5WLJAjLlX+ySIZtW/HMarb0F4cx/BBDe4QErc8IvD3NxcRRyJRrDVTrHxmUAPYch7UD8oJrX4yzC9zqX4TmoiMAVNda1jDhSKCyfYdHnRJgJCc6OMJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UJT3eHN4UeJHXwVRCq2QVa4sM69W7PTrhVHDLRqcdMQ=;
 b=SvP5/mlCr0CCKquIOxsVU39/pJ/LXjsX/ZQH7MhGDcaMD4AVyNgskzZe2CyN946+s4QoRt8j4oioPxdRIpCuVR1GW5zRYGyD7iL0AhcctPkI38n0uZIT7HyfvOWCPZWek/Q+50lHnykOhBpqoyhDvFmUNQV7271jZPWEx4PNCV4y0OYTHRkxypq9EI3XZg0I3czOxSm/fwTjhDkyvCurRQ7p8ZnN/MTes9kXQGekGyg1/GH5n+F4IQcVFdEHdpMyudH6h+RjGpdfncWpgtwbZ3DWwYVZkU+fKfhmPN2zZjFOsUY64hn5/CKUAoUq5rqsFFzMtKdAmQZvcuNO70nGtQ==
Received: from AM8P251CA0020.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:21b::25)
 by VI1PR10MB3982.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:141::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.15; Mon, 2 Feb
 2026 13:57:52 +0000
Received: from AM2PEPF0001C716.eurprd05.prod.outlook.com
 (2603:10a6:20b:21b:cafe::21) by AM8P251CA0020.outlook.office365.com
 (2603:10a6:20b:21b::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Mon,
 2 Feb 2026 13:57:23 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 AM2PEPF0001C716.mail.protection.outlook.com (10.167.16.186) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 2 Feb 2026 13:57:52 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:59:27 +0100
Received: from localhost (10.252.7.227) by STKDAG1NODE2.st.com (10.75.128.133)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Mon, 2 Feb
 2026 14:57:48 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Mon, 2 Feb 2026 14:57:33 +0100
Subject: [PATCH 08/13] media: stm32: dcmipp: add pixel pipes helper
 functions
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260202-stm32-dcmipp-pixel-pipes-support-v1-8-8d8d51f5e014@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: AM2PEPF0001C716:EE_|VI1PR10MB3982:EE_
X-MS-Office365-Filtering-Correlation-Id: 54e878e9-3f2e-4e6c-9111-08de62630edd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TUFabHAwTnJUT2dBQnhNSlFvU1AzVm9hVWJBZ2x6dEQrSDh1K1pNK2JvWnNv?=
 =?utf-8?B?ZlM5MWg5eEtQQWQ1UEtEemVLUHRHMlZ6cW9hTkRURithNDZjb1F2WmI0MVBU?=
 =?utf-8?B?cDBpdlg1RmtGN2w2dVRhYjFzV3V0RmdwUHBYMjBVLzUrQlByOWVIcHNlVmxJ?=
 =?utf-8?B?b3BPQUtVakU0WEd2aXNDaVZUTmYzZ1FMQ2JMK0Rra3hrbVVkYTNENFdHYkFx?=
 =?utf-8?B?dmJCQ1k5ajcrcHEzUXUvMU5UeFU1N2pKdmUzRWovc1JGM2hKOUlRaVJsMVNr?=
 =?utf-8?B?SmNHTHZ5RHovdnk4b29tVFRKUEYwNjByYjd2bUtPRE5CamMxVTQ3ZlFtR0Nm?=
 =?utf-8?B?d1RKWWpaS3JFNDJBamVXV3gvWnJsZ1YwNFFUZC9zWjhSNFRJaURNczNtS0ZR?=
 =?utf-8?B?Rk5XMnVnamtaYjhsRDB6bFR1VmFicjZuZ3JvRGxGNk4wSzQxQmNVeXVoWTZS?=
 =?utf-8?B?cnBsR2doRDVsU1RaNHlOdkpRL2llRWR5Z1F1Q0RWbFR2WWNQUkpnL2xyOFow?=
 =?utf-8?B?ZzE3MVhST25DakFycVVNV2FCL2pzVlpIT05NU1BEeldlV2h5U2hEaTBGZHBE?=
 =?utf-8?B?Z3BSTzdQN2liMm03eTIwT0RzYTZVNGQrd2ZVZEN2Ung2aW5xOXBmWXpXbXA5?=
 =?utf-8?B?QTQyS3hIdHJLWGF1Y2JyNURTYjZua1RYWE5pMElIVUZaVW14S3Nyanpkdkxm?=
 =?utf-8?B?WmhSbVFjZG9xZ0pjdEdCNWhZaStnWGsyL1R6VmRHM3RHWGJwMlNpN3VQYWI0?=
 =?utf-8?B?eVpJdDBjMEpqc0RpNEtyeDhGQmNTLzZMU0hadXhCclRUMnBGSkQrM01lVXNu?=
 =?utf-8?B?cW9jcXNqK2huNzRBK2pqMUdGYkxtWjlDTzVuR1VBRENXMy9OZVZLeU9jUkhF?=
 =?utf-8?B?WlZjbGkvSy95d3JGdTRubE1IZmU0Q1h1R3ppWXVHMSttYVlVRjd6b0dYbVVC?=
 =?utf-8?B?TldtaEJOT0FaODkySFM5Q2V1Y0ovWElOajFWWDh5RG1aZWpERFJqYzBLZlNC?=
 =?utf-8?B?YUdWNStueGRIUGE5K3lWV1ZRY0JCQ0ZFa3cyaFl5bUpkRjhaZlFzUE0zMytK?=
 =?utf-8?B?alhKVUFxUjZQY01CYjhWVUtoWENPMC9xcnlWektCd1VxYzNQbFZYeEgrTExB?=
 =?utf-8?B?YXJoT0FKbTFNQlA1OGkyanExeEZTRGxhRis2SnlkZ1RTYW0vQ0pqQjV6QXly?=
 =?utf-8?B?N2k5UENzNis4UDZlaDhxeEhZRHJJVDlsWm9mSThmSEMvTmJLaXMwQ2hLK2p2?=
 =?utf-8?B?clJWWURSM290NnJsK2RCNXF0MGdEUVRUMDVsdm1Ba3JxODVmL2dCSm9EbE9M?=
 =?utf-8?B?U0hsb2ZsVHVKTWxVa0J2N3V2dWMySVduQWg2RldvM1d1RjBsdnoybEk4Lzg0?=
 =?utf-8?B?b3ZEbDBJTEpJVmdJN1RQWWpkS3NoaFNPbDJScE1zWGNlV2MvTHpUWGJrNDkv?=
 =?utf-8?B?dUp2amdBcnV0bTBpdFcvZmgxZzlLcVFZRUFaOFNXN1g2a3BiVEljL0UxWnBi?=
 =?utf-8?B?c2lNMy9vcWZyVjB2TDU5aVZNdjlNV2JLcFZONTVyclo2dVA2a0tDTHVyWFBN?=
 =?utf-8?B?ZTA3dURieGhSUW1tWVIyaEpJUmNibU9renRwMWZmSUc5cGFqVFNDQ0VQYWUw?=
 =?utf-8?B?U3Y4RkxZTkdGNTY2TFlxR2tQSDdXOEZRZHdNSEFIRklqcW5yUkZLSTFnVVU2?=
 =?utf-8?B?b1NuTlkvZ2hOZGNScThFcmxYcmt5cUJxK25Sc1BNQkYzek1MWk8vNUxmaHBv?=
 =?utf-8?B?S0EzK21POTV6REU0SG83UUl4aUFSbnphM0Y5VWRpZDNlTFRFL3NKRDZ5RU9p?=
 =?utf-8?B?WkpOSEIzOGFGSWVQMmtEUWwvZFZ2UE1HdlV6V3ZLckF0dG5saFh3SzNmRzZT?=
 =?utf-8?B?SzRrT0I5MS9WRExPcGVrN3doc1ZtUTExT0psYkxyaHh2TUUyS3NxZUN2OGVS?=
 =?utf-8?B?ZklvMlpEYlF4djRrajUyaXhsSFM5ZHZIY2RjNFN1NWY4VW5wTEpka09wSnp5?=
 =?utf-8?B?VmtZcTNoT2dQVTN0L05vU2tqNFk4cjNocEF4U2IzSkxvZHFSWlc5QjlwSUov?=
 =?utf-8?B?ZWgrK29xbWFNNmRaRVA2M1N5VDRsb0JlTVZwR3g1YWpVbTdXUk01QlhReWIr?=
 =?utf-8?B?eDhmeWJ2V3ovOERnekNGVThVSjRjaGJTU2tLY2tmQU1ISlRXVlJyc0dybnFZ?=
 =?utf-8?B?Z3hEZVhabVlOVUVBa1M5OS91KzJqbjZZT1c2SjlYYmVOb0tGb2cwQkVjTkQ5?=
 =?utf-8?B?TTF0SWdNNmVKNC91bEI4ZENuL3l3PT0=?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	/o1OhXdxHpYvn1S8V7Ci+HS4Xzf11MOM0AHS3YiFabyfF8t8fE/+emquv9bXhpj6Nol1Ciash8PcHgWmQVXwfedMNn6Rmy6vJ7lkckZhTtP7Vz9lrBIQgVh+wrc8y9aP3t9C4Ip+1NFQuIhq2h/8CRu3GGnCiob9wqyAfmFPqk8EYkfZ12DHe/HsYkQTAXG30ET4PQRvl/FrM3DKv7YNz53bZxNFJlPkCvWQozlf5nErrkZ3CGnqdloYJfEttJVnR+iJqnelpULXWvYSvSRJ92rpgAlxE4GYz5xZH2YCmN/UGkVylkdrM2zvP7bTvNr8Vs8SElsbEO70LqzS3EpnWm9mY5EruWxX9OZ1VkBv6mZYrsTqYRUIlgvh/BrsaEFiV2QddKT7L3+QO+9EUF2+BCkfgcAwhElGlhFUoK0aYkBYjluV1owlsJv9o37mtgWm
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2026 13:57:52.3057
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54e878e9-3f2e-4e6c-9111-08de62630edd
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM2PEPF0001C716.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB3982
X-Authority-Analysis: v=2.4 cv=XvL3+FF9 c=1 sm=1 tr=0 ts=6980ad63 cx=c_pps
 a=v0EG2prNrbZAmvYa4Zp51w==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=Xa52oM6mtQYA:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=74FJOY0JTvdEtNMZuwsA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-GUID: CfgTKLzm5dyE6O6Y7mtZUwVkhse8fF9x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDEwOSBTYWx0ZWRfX5et2rPhUcMoW
 w3RmkqNheDGiz1ZSKVqZ1P2UqadvVz7UWI2x2AQ5NKMuLy8tTGbxwREjnqeQb+jUmUezXlItR26
 yz+eWyJpPLlhJgZX+6XHe+WPKgVqxLejdWq4WCZBm82ngLsya6JEsyRdK4ugs+luP+eYY+qGX4o
 1uCEtSY/VynKroL2DNqSQngxCL8kxdZFjYCjrSDf7gO6bEe7dDNg9c4A7ZePvqMDLkI+jsPZsSw
 qEhLiKSNbpFRw88FLRDUX0eASuRj/JLlBR+HWpL1aZ9/ZF0sLSuC/fomwtKStIjrPaa/8+3zRD3
 70x6TIARHf2RM+8lSE4+NUheldh8fjzkgA9gqj+WnyYLQl0cydF8eYEKp2YPNKXRLFn//l7rf8D
 tLlwJCDIjIHkGbueQIFSox3yiJt/uTzWkV1hgps843e/dwQZw3Eyq1eT+kdNZvA5GLgMbCuxZib
 4bZPSaLATEEZ/OI3nrg==
X-Proofpoint-ORIG-GUID: CfgTKLzm5dyE6O6Y7mtZUwVkhse8fF9x
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[foss.st.com:s=selector2];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52020-lists,linux-media=lfdr.de];
	FREEMAIL_TO(0.00)[foss.st.com,kernel.org,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns,foss.st.com:mid,foss.st.com:dkim,st.com:email];
	DKIM_TRACE(0.00)[foss.st.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[alain.volmat@foss.st.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: B1D06CD09D
X-Rspamd-Action: no action

Pixel pipes are made of an isp subdev (only main pipe) and a
postproc subdev. This commit add a helper functions common to
those 2 subdevs such as for handling format enumeration,
set_selection handling, so that they do not have to be
duplicated in the two subdeves.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   1 +
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c     | 180 +++++++++++++++++++++
 .../st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h     |  41 +++++
 3 files changed, 222 insertions(+)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
index 159105fb40b8..54231569ed6f 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
+stm32-dcmipp-y += dcmipp-pixelcommon.o
 
 obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
new file mode 100644
index 000000000000..142463bee226
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.c
@@ -0,0 +1,180 @@
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
+#define DCMIPP_ENT(id, pad) (1 << (2 * (id) + (pad)))
+#define DCMIPP_ISP_SINK			(DCMIPP_ENT(DCMIPP_ISP, 0))
+#define DCMIPP_ISP_SRC			(DCMIPP_ENT(DCMIPP_ISP, 1))
+#define DCMIPP_ISP_INOUT		(DCMIPP_ISP_SINK | DCMIPP_ISP_SRC)
+#define DCMIPP_MAIN_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_MAIN, 0))
+#define DCMIPP_MAIN_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_MAIN, 1))
+#define DCMIPP_MAIN_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_MAIN_POSTPROC_SRC)
+#define DCMIPP_AUX_POSTPROC_SINK	(DCMIPP_ENT(DCMIPP_AUX, 0))
+#define DCMIPP_AUX_POSTPROC_SRC	(DCMIPP_ENT(DCMIPP_AUX, 1))
+#define DCMIPP_AUX_POSTPROC_INOUT					\
+	(DCMIPP_AUX_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SRC)
+#define DCMIPP_ALL_POSTPROC_SINK					\
+	(DCMIPP_MAIN_POSTPROC_SINK | DCMIPP_AUX_POSTPROC_SINK)
+#define DCMIPP_ALL_POSTPROC_INOUT					\
+	(DCMIPP_MAIN_POSTPROC_INOUT | DCMIPP_AUX_POSTPROC_INOUT)
+
+#define PIXMAP_MBUS(mbus, applicable_pipes)		\
+	{						\
+		.code = MEDIA_BUS_FMT_##mbus,		\
+		.pipes = applicable_pipes,		\
+	}
+const struct dcmipp_pixelpipe_pix_map
+dcmipp_pixel_formats_list[] = {
+	/* RGB formats */
+	/* RGB565 / RGB888 */
+	PIXMAP_MBUS(RGB565_2X8_LE, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB565_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_3X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(RGB888_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_INOUT),
+	/* YUV formats */
+	PIXMAP_MBUS(YUYV8_2X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(UYVY8_1X16, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(YUV8_1X24, DCMIPP_ALL_POSTPROC_INOUT | DCMIPP_ISP_SRC),
+	/* GREY */
+	PIXMAP_MBUS(Y8_1X8, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y10_1X10, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y12_1X12, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(Y14_1X14, DCMIPP_AUX_POSTPROC_SINK | DCMIPP_ISP_SINK),
+	/* Raw Bayer */
+	/* Raw 8 */
+	PIXMAP_MBUS(SBGGR8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG8_1X8, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB8_1X8, DCMIPP_ISP_SINK),
+	/* Raw 10 */
+	PIXMAP_MBUS(SBGGR10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG10_1X10, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB10_1X10, DCMIPP_ISP_SINK),
+	/* Raw 12 */
+	PIXMAP_MBUS(SBGGR12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG12_1X12, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB12_1X12, DCMIPP_ISP_SINK),
+	/* Raw 14 */
+	PIXMAP_MBUS(SBGGR14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGBRG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SGRBG14_1X14, DCMIPP_ISP_SINK),
+	PIXMAP_MBUS(SRGGB14_1X14, DCMIPP_ISP_SINK),
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad)
+{
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (dcmipp_pixel_formats_list[i].code == code &&
+		    dcmipp_pixel_formats_list[i].pipes & DCMIPP_ENT(id, pad))
+			return &dcmipp_pixel_formats_list[i];
+	}
+
+	return NULL;
+}
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	unsigned int index = code->index;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(dcmipp_pixel_formats_list); i++) {
+		if (!(dcmipp_pixel_formats_list[i].pipes &
+		      DCMIPP_ENT(id, code->pad)))
+			continue;
+
+		if (index == 0)
+			break;
+
+		index--;
+	}
+
+	if (i == ARRAY_SIZE(dcmipp_pixel_formats_list))
+		return -EINVAL;
+
+	code->code = dcmipp_pixel_formats_list[i].code;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse)
+{
+	const struct dcmipp_pixelpipe_pix_map *vpix;
+
+	if (fse->index)
+		return -EINVAL;
+
+	/* Only accept code in the pix map table */
+	vpix = dcmipp_pixelpipe_pix_map_by_code(fse->code, id, fse->pad);
+	if (!vpix)
+		return -EINVAL;
+
+	fse->min_width = DCMIPP_FRAME_MIN_WIDTH;
+	fse->max_width = DCMIPP_FRAME_MAX_WIDTH;
+	fse->min_height = DCMIPP_FRAME_MIN_HEIGHT;
+	fse->max_height = DCMIPP_FRAME_MAX_HEIGHT;
+
+	return 0;
+}
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s)
+{
+	struct v4l2_mbus_framefmt *sink_fmt;
+
+	if (IS_SRC(s->pad))
+		return -EINVAL;
+
+	switch (s->target) {
+	case V4L2_SEL_TGT_CROP:
+	case V4L2_SEL_TGT_COMPOSE_BOUNDS:
+	case V4L2_SEL_TGT_COMPOSE_DEFAULT:
+		s->r = *v4l2_subdev_state_get_crop(state, s->pad);
+		break;
+	case V4L2_SEL_TGT_CROP_BOUNDS:
+	case V4L2_SEL_TGT_CROP_DEFAULT:
+		sink_fmt = v4l2_subdev_state_get_format(state, s->pad);
+		s->r.top = 0;
+		s->r.left = 0;
+		s->r.width = sink_fmt->width;
+		s->r.height = sink_fmt->height;
+		break;
+	case V4L2_SEL_TGT_COMPOSE:
+		s->r = *v4l2_subdev_state_get_compose(state, s->pad);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format)
+{
+	if (input_format >= MEDIA_BUS_FMT_Y8_1X8 &&
+	    input_format < MEDIA_BUS_FMT_SBGGR8_1X8)
+		return MEDIA_BUS_FMT_YUV8_1X24;
+
+	return MEDIA_BUS_FMT_RGB888_1X24;
+}
diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
new file mode 100644
index 000000000000..db29e1fe939e
--- /dev/null
+++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelcommon.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Driver for STM32 Digital Camera Memory Interface Pixel Processor
+ *
+ * Copyright (C) STMicroelectronics SA 2026
+ * Authors: Hugues Fruchet <hugues.fruchet@foss.st.com>
+ *          Alain Volmat <alain.volmat@foss.st.com>
+ *          for STMicroelectronics.
+ */
+
+#ifndef _DCMIPP_PIXELCOMMON_H
+#define _DCMIPP_PIXELCOMMON_H
+
+#define IS_SINK(pad) (!(pad))
+#define IS_SRC(pad)  ((pad))
+
+#define DCMIPP_ISP		0
+#define DCMIPP_MAIN		1
+#define DCMIPP_AUX		2
+
+struct dcmipp_pixelpipe_pix_map {
+	__u32 code;
+	__u32 pipes;
+};
+
+const struct dcmipp_pixelpipe_pix_map *
+dcmipp_pixelpipe_pix_map_by_code(__u32 code, unsigned int id, unsigned int pad);
+
+int dcmipp_pixelpipe_enum_mbus_code(unsigned int id,
+				    struct v4l2_subdev_mbus_code_enum *code);
+
+int dcmipp_pixelpipe_enum_frame_size(unsigned int id,
+				     struct v4l2_subdev_frame_size_enum *fse);
+
+int dcmipp_pixelpipe_get_selection(struct v4l2_subdev *sd,
+				   struct v4l2_subdev_state *state,
+				   struct v4l2_subdev_selection *s);
+
+__u32 dcmipp_pixelpipe_src_format(__u32 input_format);
+
+#endif

-- 
2.34.1


