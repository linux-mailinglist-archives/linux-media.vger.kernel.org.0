Return-Path: <linux-media+bounces-50023-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469CCF8398
	for <lists+linux-media@lfdr.de>; Tue, 06 Jan 2026 13:07:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CBF5E3093B12
	for <lists+linux-media@lfdr.de>; Tue,  6 Jan 2026 12:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA666327204;
	Tue,  6 Jan 2026 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="odoVUTMN"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 007A51EA7DF;
	Tue,  6 Jan 2026 12:01:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767700897; cv=fail; b=SlBxiUEKS4Up2og1eub49W3Qof/7YxErozOnj3LGVd345fWsBghIfrXw2/pR7VBfq9zkyUiXwB/k0tEMRJPUJ2qSW8GJPpY9qNf77V3JYdsnB+kA8+Rrn/OIVGnBXD3btMH4B0pt28/5SV8pFKfcDZYhTmR/kBv7Vc13S2/8P+g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767700897; c=relaxed/simple;
	bh=tKKaqsaJ6xKB3JtTfCeh5LK0LboNrTaNLjXxHNbnUXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=oHRvDIkp0EN0NtGXs9/KLnZAMZEC3gScEuc0wliCgt5TE7KSnopC0Ggj8Y9AM89LPCI+OqLD0BtYd4eb6ftVBtgFFbpxOcEKZUJM7oWu9Qo67kGEbBEw+nf2hghB67GWGzSdHfCsX4eY2fCkfcUyULbklAK6wNH8nUMNj5GnoZY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=odoVUTMN; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 606BUfKQ4097576;
	Tue, 6 Jan 2026 12:34:39 +0100
Received: from osppr02cu001.outbound.protection.outlook.com (mail-norwayeastazon11013068.outbound.protection.outlook.com [40.107.159.68])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4bfdj5fesa-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 06 Jan 2026 12:34:38 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jh0A+O3uzYbC3tEMYLRblOQrdt594z7W43fBQr/hEPEE9Qi/z7uyh+vQLwqmg1p6L5GYln+nHvUFgfWGORSNf+RkIR9bCcvAzucVnUiumQFEN8eB1rn0IUgkNouKPBE4Epv0Ae03SZRPbb2FaqQHe8RIqeD+IzwEqkptiqPX9NcYuQe2WZgJeAoMcDxZDo7CgokOFwNrVi7oogtXOP+/OrZYmA7jVlFf2TuWhgYYLW5Xl0sBm1Vnj1ZxwZQV3tw6N6djbpLZ6wNP1qs/Uyy7bFR0RwzhuYEjGTkDHI1+yYpOLYpnoi8qFbSczelT6wLezfCqapmrGwFSORGi4+7lkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nMqDfgevdBZ23qNaZM8Qg7n+RaG9apdn7munHJWRxHM=;
 b=mjfaXXZUggt+/A8mPKrmm4BEsWNZFIEgcF/qYvNRTmZPnBRt5yhQryygtdAN2wM8DBABNY5qtg6XtP5IIxw7eRVm7UKpn+c2td+kFmcl1GFaQvZ18EUwSwpkiFqYSGGrFL6UhTr49lQddS5FiqbVfy9536bw/7+IZA74pnDA0fq9YN4NCSQKwti4IjbUoroth1cbc+roH9XuU/b4n3p8XEuy3mIECevp4pMFTjGrQfkxPhMbUPVchNh5drjzPn+2D8khj6iNq6khxzrAUJlePYwEyOJeiwo61chIbrZCcF/bkez+KADJwcg7/EIBd43wQvTH4oBNs4tec6z5JaeD6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nMqDfgevdBZ23qNaZM8Qg7n+RaG9apdn7munHJWRxHM=;
 b=odoVUTMNoDbd+FvmxckV3a0JnZm+6bdt0hi1NDy7nYkQKuUKcvFqvr+WnQ588ojRk5ooKVWecll3MWh36OPlMxbetLa0LRhN7VfT2k6c4tf5ic8o4dSJoxNZ6rn0mzPOwrWqMYjUDU/evGCzaac5QT0F7Uk+k/PVcIb8zY9wAI0YznyZ3lc+5h5+XSFsVkBDuD6Z2w6krZAAPntv9bJpUYkYssn+SB7BQ8rUlePcm0hohR0r687rSoXIzzpKKKNI+SSRU9W0C5g1dQIGwHbTaOPgU+/xHCwUXoOhsxQKZ7Pn+uigyFNG79kpixT2x9jvEAW+4MSU6WCzAvLhrmPHgQ==
Received: from DUZP191CA0003.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:4f9::22)
 by AS8PR10MB6127.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:548::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Tue, 6 Jan
 2026 11:34:36 +0000
Received: from DU2PEPF00028D05.eurprd03.prod.outlook.com
 (2603:10a6:10:4f9:cafe::e4) by DUZP191CA0003.outlook.office365.com
 (2603:10a6:10:4f9::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.5 via Frontend Transport; Tue, 6
 Jan 2026 11:34:34 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.60)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.60 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.60; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.60) by
 DU2PEPF00028D05.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4 via Frontend Transport; Tue, 6 Jan 2026 11:34:35 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.29; Tue, 6 Jan
 2026 12:35:48 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 6 Jan
 2026 12:34:34 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Tue, 6 Jan 2026 12:34:35 +0100
Subject: [PATCH v2 07/12] media: stm32: dcmi: use dmaengine_terminate_async
 in irq context
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260106-stm32-dcmi-dma-chaining-v2-7-70688bccd80a@foss.st.com>
References: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
In-Reply-To: <20260106-stm32-dcmi-dma-chaining-v2-0-70688bccd80a@foss.st.com>
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?=
	<christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <linaro-mm-sig@lists.linaro.org>,
        Alain Volmat <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PEPF00028D05:EE_|AS8PR10MB6127:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a13fe74-1cfd-479b-1f7a-08de4d1791ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|82310400026|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UU02bk5oUy9uYlBiZWRxVjJVeVNGSFB1dkZKQktQUFMySFgyZlU0Y3dCZTJ1?=
 =?utf-8?B?MjdyZi9DbDVoazNocTFpZlBsVUZHeFh3azNxbUYvZTBZSjZhYW9YdXY0RklS?=
 =?utf-8?B?azYzY2J5VHhDbElJdEhtUG9hMytDMWd3R0c4V1hPdi9DazErdDZ2Y0ZVSVFP?=
 =?utf-8?B?OEdFcjN3ZmtOQTNOVGpzTmp6Z1pTT2NWNHhBWGJtbTQ4NDhFN0d0YkdCdEk2?=
 =?utf-8?B?QVV5Y1A0YVF3cVpVOE1zM2IxajZoSWhVUzVRUFJYRXp3Um9CZDRGTWpaMDRo?=
 =?utf-8?B?aVZ1bkp5Z09lZnV3a3FDTk45bjhMV0ZNTDVWVE1aYnNTWithNVk3d1FDczZO?=
 =?utf-8?B?VFZhZDlLTmZkK0lRV2UweXZ6QlZCVXJNSnJ3MUJ1U3pLaEcrUHM1TDIwZnU3?=
 =?utf-8?B?djREd2ErYndvaXdDNmNNbnprL1ZWRTJ5Q2VocjEvY1V5MGtXK0UzQ3VNNk02?=
 =?utf-8?B?Ykl4UFMvNDVvem9mMkRlSitHUjBMU1M5Y3NYVUlmNGd0dENmZnAxQU92UTI3?=
 =?utf-8?B?QVRQR1RuOXlNNXNnNDROTzJGNHBIUHBpcWNubjg0dVlKbVVwaTN6WUluRGVR?=
 =?utf-8?B?R2JhK01TNTh6OVloUjJrVTZRZXh6cFptZkVqdkRZMXZDRVlTeS8ybjgvRzJ1?=
 =?utf-8?B?SWNNZ1BOOWZHQWhDSW1ZUjYxRGVkdHNWYzN1WHZiOWNudytOc0U4bnRZcEpZ?=
 =?utf-8?B?anA0bGlLY3lPS2JFUkRNL1E1bXRibFplNE5nSlBFTUZyT01vWEpsb3llbW13?=
 =?utf-8?B?QlNXcS9ad2toZDFFVVZ5aXN6WFhsYmN4NjJZa1pIc0NkS2F1eFR4ZWFpeXYy?=
 =?utf-8?B?aVdxanExUmprbmtXV0cxaXFpckRta2ZwVUZtOXFpRUFxWHp0ci8wL3p0ZDRV?=
 =?utf-8?B?Rm1NbndOMEJuclhmdmNHUHR6UXlyTVpKNTFXb2crblVqdDN3YklCUzFpVHNs?=
 =?utf-8?B?cnN4b3BPMm9oQXJTWkFhMC93VkJRaU4xeWNhZG5vVnFsMmExNkNtZk1zTzN1?=
 =?utf-8?B?OVQ3Zndsc0tWcFhkTUFtN3VtV1JDcVYwSzlGL3dVbENsdHptRlFwaDN4NzYy?=
 =?utf-8?B?L253dVMxS2NqdHVBMUYzWlRaK2MvcENoNm1saXp1T1hRdGU1SlZDWTYvSmdh?=
 =?utf-8?B?Rm5FcHJGQ1ZKcGkvMC9xeVVJSGFLeXl3Mm9wVGJGZzg1UmNtODU3SzhlU1VF?=
 =?utf-8?B?UHZWYTJSMi9lRHZvVFVneU4rRkI5VDdPMVQzNmVGckVIUGlJNFYxVjM1ZHJm?=
 =?utf-8?B?eVBIeU5BbmNJclllVTRMWG11STNoT05KZDdRSmttYVlTdmJCUHhEVDNnMjhJ?=
 =?utf-8?B?eERLcElmclpWM05TdXZVWkE5NTJSNktGRHp4TUhqSExkMEVGT3RGWE5HekhR?=
 =?utf-8?B?WWpHRUg1R3ZSTnZGUlRodnZvcDZXRmlYaWtNWWdYTmdqV3JtMVNDQ1hQclE5?=
 =?utf-8?B?TjVwa0FZeS9QdStKWmJhdytvTUp3eVY1eWlhcU8vd0pBODdzUnVjNWdSc0RG?=
 =?utf-8?B?eXhKTk1GbFMycVh5SWI3T2w2WEtnaWQ1Wk5Bdi9YYzN4V0hBU3BMeWtYLzN5?=
 =?utf-8?B?S3N1N21EenRvdUhRRVhjYk4rYzBsUHZobEFPWjNWVUhWdFQwMnFKanBDeitK?=
 =?utf-8?B?NEh1YVB5dDduZFg0TzZxTWYyOFdvT0dMaTRvakRxeklNREpPM3NoU0J1YnIv?=
 =?utf-8?B?eVFhVmZ1bU42djIvekVYMjhzSWZOSTVjTzEyWW1ja2FyTFRQd2xLOWhmNE4z?=
 =?utf-8?B?enJLV2hJOUwrSjdWTkRaSmVoM1dTVTdvTTdReFFTTTlRVC9WM1dEczlJZGZx?=
 =?utf-8?B?SnJwNnJqODh0SGVIbk5nQVEyeWZsejNOeXZSNmMzWUNiK2lNVmgvMmFPbHBx?=
 =?utf-8?B?R2t5Zk9EMVA2NnF1Q2xrT1ZHYXEwanZHbFBVVTdMK2lKL1BQR0hJOERUbG1u?=
 =?utf-8?B?Vy93M3dYWHppTTNTa3ZPcUlBY0Q2ZUY4cksxbDhBSzBMbGlNZkMzbFJtZ3Qr?=
 =?utf-8?B?WHIyUkczVWlXa0hzVXJVYVcxdXRwZjR3Y2NZMmp1SlM5ZXhFUGFWVFAvMWlp?=
 =?utf-8?B?ZXYzaGtnOVNFUWRieVJvOTF3KzZNSnFBTk1BZTB0RDY5OVhKV3JxWVcyNlZ5?=
 =?utf-8?Q?e2SI=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2026 11:34:35.9987
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a13fe74-1cfd-479b-1f7a-08de4d1791ef
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU2PEPF00028D05.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR10MB6127
X-Proofpoint-ORIG-GUID: ajr5fzmlYFu_RBw6vCAGLBUvMjaj9or-
X-Proofpoint-GUID: ajr5fzmlYFu_RBw6vCAGLBUvMjaj9or-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA2MDA5OSBTYWx0ZWRfXy41dwOcG6C4M
 CeZ92s5XXT6cd3dkH0EMtq7BJ8oWFmJDyt6RiCJ2ca6qk3vxq97heOn63+1A0wGV35Qs1WYMwKB
 F46aRJHJVQkMqTpbE/OZSEhZsP/+rOtGTo2CF7EZPIOKrVUrEQjIFnHASVLXPUW0AJp9UIimrQ9
 dKTnbIAEhAXxNnKmWAEDmd7tE3FqBY7JIDTZloltkwOXBo4NW/YLK/PWu870Jf9Y9fNPDBarHN/
 ZGUaI0g4GloDEKBvMaoqzUEtguVvnNtqin+cKs1wnB86N4AAsI74s4v5iZ0F7/81A5jP9uBWQ2W
 GhT0RFZde3TepXUGFWokqV8hgrn5vjNEfE0/iruG/g9bVWHYBxzOlFsseK+aIEQGED7QSKeAWPy
 Qe0oH9yZ1+Fb5zE5pw3RqyZdHUOcQJ2Pg4s+0KFR5PwJpqYFa/95Xse3/svd2RyEe+QcZaADqju
 A2h6sej1lHOgZw180iw==
X-Authority-Analysis: v=2.4 cv=SMBPlevH c=1 sm=1 tr=0 ts=695cf34f cx=c_pps
 a=O7yYZzH2L7cA02xUA698ZA==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=gAtnOOuIUh8xv9oTcPAA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-06_01,2026-01-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 impostorscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601060099

Whenever receiving an OVERRUN event or an end of frame, the driver stops
currently ongoing DMA transfer since the DCMI stops sending data to dma.
Not doing this would lead to having DMA & DCMI no more synchronized in term
of expected data to be copied.
Since this is done in irq handler context, it is not possible to make any
call that would lead to scheduling hence dmaengine_terminate_sync are not
possible.
Since the dcmi driver is NOT using dma callbacks, it is possible thus to
call instead dmaengine_terminate_async (aka without synchronize) and call
again right after a new dmaengine_submit to setup again a new transfer.
And since this is now a dmaengine_submit_async, there is no need to release
the spinlock around calls to the dmaengine_submit_async.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 drivers/media/platform/st/stm32/stm32-dcmi.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/st/stm32/stm32-dcmi.c b/drivers/media/platform/st/stm32/stm32-dcmi.c
index 66bb79038c54..6ca0ffcd97a3 100644
--- a/drivers/media/platform/st/stm32/stm32-dcmi.c
+++ b/drivers/media/platform/st/stm32/stm32-dcmi.c
@@ -334,10 +334,8 @@ static void dcmi_process_frame(struct stm32_dcmi *dcmi)
 		dcmi_buffer_done(dcmi, buf, 0, -EIO);
 	}
 
-	spin_unlock_irq(&dcmi->irqlock);
 	/* Abort DMA operation */
-	dmaengine_terminate_sync(dcmi->dma_chan);
-	spin_lock_irq(&dcmi->irqlock);
+	dmaengine_terminate_async(dcmi->dma_chan);
 }
 
 static irqreturn_t dcmi_irq_thread(int irq, void *arg)
@@ -355,10 +353,8 @@ static irqreturn_t dcmi_irq_thread(int irq, void *arg)
 		if (dcmi->overrun_count > OVERRUN_ERROR_THRESHOLD)
 			dcmi->errors_count++;
 
-		spin_unlock_irq(&dcmi->irqlock);
-		dmaengine_terminate_sync(dcmi->dma_chan);
+		dmaengine_terminate_async(dcmi->dma_chan);
 
-		spin_lock_irq(&dcmi->irqlock);
 		if (dcmi_restart_capture(dcmi))
 			dev_err(dcmi->dev, "%s: Cannot restart capture\n", __func__);
 		spin_unlock_irq(&dcmi->irqlock);

-- 
2.34.1


