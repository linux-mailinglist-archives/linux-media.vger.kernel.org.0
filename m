Return-Path: <linux-media+bounces-42461-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BFBDB55314
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 17:20:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61B213A4E3B
	for <lists+linux-media@lfdr.de>; Fri, 12 Sep 2025 15:20:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E81EC1DE4F1;
	Fri, 12 Sep 2025 15:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="g+lwlvz0"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7EF4155A4E;
	Fri, 12 Sep 2025 15:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=91.207.212.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757690420; cv=fail; b=rvh5lXhBJeJ+eMhNXldZrtBDHjdXPzENR3BwiOeLGj85xuD0uoK1zKMdnwOBMD1VRUYkqCFYvh9PXN8zb7n3IKeXClRVSBdYurwx3X2sRKTzGqKoI3RkvT/1YvVymVQPn4q3emnRMfABftdrTltve25PYlEoQIHTWuZUFH2pFJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757690420; c=relaxed/simple;
	bh=87gJqOyfFLfwqkgPR0td062O5An8y3oxndIM0w8CXSM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=mU5o5KwceSz5XBOXhT52cw96vh9Jz7yTOWm5WnztpeXm/se5Wm+VdzBifT/30RSTyMGV2DtIkCeJRrpV6Mm0vl4L/lBRFtOXhE0xLFyjLx5Nla6DlTKcjXjxwGg9TI2Vho6HH4jnKCj6YqKMldIB3fMB0C0Xm6Glw01NdQ9JIpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=g+lwlvz0; arc=fail smtp.client-ip=91.207.212.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58CFGpWw001801;
	Fri, 12 Sep 2025 17:20:12 +0200
Received: from am0pr83cu005.outbound.protection.outlook.com (mail-westeuropeazon11010015.outbound.protection.outlook.com [52.101.69.15])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4934xjv39t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Sep 2025 17:20:11 +0200 (MEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xbZojVFqUhU12BjdVzDGg/mUGLifa4NW99wBALlGv2QpaIXxQ+WMUkU/yCPMJJ22NldeErPrcOI5+L3HwG8uiK5OZp2lQV8yhneiYPx2Z3mquEtQ8lAN6UNOJ2+KccCwXIml5tbdEfbMHZqKk97ePKz1SqvPBYcNnYT5Yq1ch+XauwCAC27xJs28UxonFXPZ+OD+sje2KloG+cZ2iGYgo85vq0Rz+t5VbmPi8Ii4b+Du7qkVUyDm5uOOn66soEi4aBMXuU7wCVifLMAiudotZYmUA4qT80S2WUDiPJSJTZ28W+hQfo3+uihADe7FOSdNYdSi/SOLbORuwbkFobLKDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QEhmiqLv2wLMRZEXQhjktlnCODU0qFhflZzCCG8zW9Y=;
 b=Y6AsqypPZwwqT7A8jNg80LdA6sn95PxPmjfztzpQg9PVcE0D0JMIvsy9LrieQt9tn63y9zFuuiN3wC1vKoegpClnvLEKWncL4z0xxArzzGXy1Rfq1wLpBRiSApK93Eq7QJgcnsmjpe2VgzdllgxEiBWSuWQLmRsmkE6J2BuQ5yAZNS7l7A/tJ22ChDOCH3uIm13hUEwVBcBF9vG2/tVUa9vslnb1b4lhfSXDlfeggnauTlQGoQFxwomDXajQQHb/o6w6rHpa5o4nz9lP8X4R752DgNzSB+FiG84+DJ2BwTIK3YLeEu0NtKiDKo4WwWn2hOF19FzmoGycc31ZvrHuIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.44) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QEhmiqLv2wLMRZEXQhjktlnCODU0qFhflZzCCG8zW9Y=;
 b=g+lwlvz0ensXCFENErNN5yEoxmmm9cluHT9NWMdkCCw0HQ4HJ/djDy6SMvB6DUEBcnkOaYZ0hGWbtim/G+qEqfFMbhDASx3UO5E9TQvwbVfuNWHZbd+2OiN8LJpe3kMMrLKHdrVF66hThWhyJWx3GEXkwNuRMCkGq4VI/ZBlAPDOXwicsxN9fu2oWoSBOD6MtBw/eg7HFjzB3MEYcrS+b1CNc2OF1KLubCK3INaz+Qz5wITXv4O8ReskdOG/emlqy46Tsy3c/fzFCOOVCiqqbqJYtw+sMq0Ud4//72M1IHHqH96W0xxYb4R0FPjXzcbqFYxikI9uOzvCbmn9qh1jTw==
Received: from DUZPR01CA0113.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bb::6) by GV2PR10MB7078.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:150:df::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Fri, 12 Sep
 2025 15:20:06 +0000
Received: from DU6PEPF00009525.eurprd02.prod.outlook.com
 (2603:10a6:10:4bb:cafe::3c) by DUZPR01CA0113.outlook.office365.com
 (2603:10a6:10:4bb::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9115.18 via Frontend Transport; Fri,
 12 Sep 2025 15:20:09 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.44)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.44 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.44; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.44) by
 DU6PEPF00009525.mail.protection.outlook.com (10.167.8.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9115.13 via Frontend Transport; Fri, 12 Sep 2025 15:20:06 +0000
Received: from SHFDAG1NODE1.st.com (10.75.129.69) by smtpO365.st.com
 (10.250.44.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 17:12:58 +0200
Received: from [10.252.28.204] (10.252.28.204) by SHFDAG1NODE1.st.com
 (10.75.129.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.57; Fri, 12 Sep
 2025 17:20:05 +0200
Message-ID: <2fe22eb9-10f1-4a29-b9ea-cc216b6fa046@foss.st.com>
Date: Fri, 12 Sep 2025 17:20:04 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] dt-bindings: clock: st: flexgen: remove deprecated
 compatibles
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
 <20250912-master-v2-5-2c0b1b891c20@gmail.com>
Content-Language: en-US
From: Patrice CHOTARD <patrice.chotard@foss.st.com>
In-Reply-To: <20250912-master-v2-5-2c0b1b891c20@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE1.st.com
 (10.75.129.69)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU6PEPF00009525:EE_|GV2PR10MB7078:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b2acbb2-d0bf-438b-ca8a-08ddf20fda9a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700013|7416014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MnFIejdHSE42bktPT0ROSERKbTRQK1UrekdZdFczK1N4clF5ZC8rN2xNYnJk?=
 =?utf-8?B?RjVjLzVVM3kyR05SZHp0emhIcm9JWE41WEljaHJiWUZadmpmc1BNZ3c5MklG?=
 =?utf-8?B?ZnhUTFdESFRxUWM2QXp3Z3lsVDBhZ0x2TEU2QW1UMDF0TkJtaFhocm91WGdm?=
 =?utf-8?B?ai8rbzAwbDh6UUpadDV3ZUREVFExQmtlS0NaVmdNM1hOT1M0TlFHaUMyMnZ1?=
 =?utf-8?B?VmUrczVxWGt3RW5hTTI1TjFuWWxxZzY5RnZmcmV3R0hoV0gyQUpjWlBVenJk?=
 =?utf-8?B?a05PeEw5WDZ0YUE2akhJNWtFRFFUNGY1UDRaMmpBdTl5bTJsVmxGUjhLQVlu?=
 =?utf-8?B?ekdSeHBLRTl6bU43ZjVETHJVQVFMQ0g5WWsxZC9SNTRDWUdxSEtkNE1nenFy?=
 =?utf-8?B?bHNzOHdLZFJQN2tEeTZTeTFQcDNhVDRjNnNIMHRscmxWUmpQTlMxQytZRUNZ?=
 =?utf-8?B?WllzUkZkdnhvMXVGcDNYMEluRHkzZlJzbUNnNWhnVUpXbms4ZnRJN2pFVVhj?=
 =?utf-8?B?c2Q3dGE4dzg3WmJMcmtvSEowdHhaT0JyTXJJeGhXNkpybjdGOTJiVExFdFVt?=
 =?utf-8?B?RHUwUG1vclhManpoRnAxRWRIQmNiejJrOW1OYmNTSmt0SzE4QnI0Zk43Vmx3?=
 =?utf-8?B?TVJOakRHckgxV2NjWHlub0VhRTNjVGFpRHhSNGIwYU5kNXp0OTA3WmhlZ2VB?=
 =?utf-8?B?N1N5Y2MyRjFjVVlwMGQzWi9lblFqcHNJeWJTcU5jUUM4enozemJxVnFuTjZr?=
 =?utf-8?B?NXliWGJobjh0Sjg2U2pONzI5S25PNjE2all3Nnkrd3k3bEVGdVc1U0FudDNR?=
 =?utf-8?B?cjU0M3Mrb3kxM2lLUUJmSldCbHNvbjJoazdvU016cmJGUk5kcUZCR25GMlZ1?=
 =?utf-8?B?UThqRzFmNThYN1dlOEJvUHA0cWxDNm5HV3JGUlA4SkZRR2ZmS2VRbnBGSWNs?=
 =?utf-8?B?NUw1WlB5RmtUUXZ4bjdSNkVkekgzbHVNMmhQTHFMWmdua1JrTnpzZTZXUWNq?=
 =?utf-8?B?dTN1RDN4N3FGUHZVN3ByZXZScXZnUmlRMVJ1OWpZWG5GMlAwQ2ZWek5xS0lT?=
 =?utf-8?B?U2xCVmV6UXJLMmNOUGlaOERRZVE1Y014MkJ1WVBXYnRMK3gwMStHR1d2STZQ?=
 =?utf-8?B?TjlObmYxTG1Xb1QxN3U4RDByTXFVRzZFVjJUVnljcWVPZjNuTDNSSlNIZmJl?=
 =?utf-8?B?bEFKRXJjY0tHeVFLcWNDdDgrQWkwYjVyTExPa0gvVTlDVTFoaFVPY09KYTAr?=
 =?utf-8?B?VWtJTVdtRHVmM2JNcVN3b09ySlJrTVA0dlBRM2FzM0kyOHFlU3YrUlR1VkpM?=
 =?utf-8?B?Z2IvbnhDc0pyTWxLaTJndk1aVEdPd0VoaWJVSCtZT2lvVFlEeE9rQ1FtVVVp?=
 =?utf-8?B?ZDN2OG1HSitQT0orQnhNb2szRjJ3cUl6VWwyRThPTCtGVm15TkdmQ3hBUkYz?=
 =?utf-8?B?T1JoV3ZveHMwYUNvVkNwZ0NTVnY2N1NISmNsTnBoamJvZHF2K0V3U1FjdURw?=
 =?utf-8?B?MWpZM0prTDRLSHJ1YUc4UUxUWEpSTnZhOWZZRDh0MTdHbGw0M0RMYi9IZElp?=
 =?utf-8?B?S1lsYld1My9RR1JLVHZxc2V3dU1qRTRxcENTZStiVnJqQVBnRTJIZ0FaWUxL?=
 =?utf-8?B?NmlBcVdiUDRWREtRek5tWjFZVXZ5dmdGdEdEK3cwK1pxRktCVGVyM1hwUjBp?=
 =?utf-8?B?SVJiNDZsalRpTjUxVjRka0gvMDhJRklILzNrUlJWa2tvSGlnSTE0bzc2b1Y5?=
 =?utf-8?B?L0h5UFVNeisrNUgreFVNTHBMSmJabU93dENaU2xLMFdnUlJmM0JzNmJObmEr?=
 =?utf-8?B?eDhDQ3RjQXd4RTJyUW4vOU1rTmlWMDhQelBPVmltcUZWRklGYzhMRGlnVGhL?=
 =?utf-8?B?UVRNMUFSZi8rUzgyRTA3NHB5WjFSWW1XTTAxekx4NlA1dWlNSG5CbE9kL2Iy?=
 =?utf-8?B?T2RRK2x0b2hvSWNjRUp3c3JHZThtRk1NcnJ4dE5UN1Zjbnd5cVN3WFp0WlIv?=
 =?utf-8?B?OTZuN1NaMGNPenNTZUhtcVJHUkNUR3JXaG1hbDhaSDRWWVhvOFZaZUZ1U20y?=
 =?utf-8?Q?Lq9Gc0?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.44;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(7416014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2025 15:20:06.1655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b2acbb2-d0bf-438b-ca8a-08ddf20fda9a
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.44];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DU6PEPF00009525.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR10MB7078
X-Proofpoint-GUID: EFTTKrm1wJB69HnGJnW2uKG7UoT4A2hG
X-Authority-Analysis: v=2.4 cv=GuFC+l1C c=1 sm=1 tr=0 ts=68c43a2b cx=c_pps a=4bRfXiRxk+dAoOwDcXsd8w==:117 a=Tm9wYGWyy1fMlzdxM1lUeQ==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=h8e1o3o8w34MuCiiGQrqVE4VwXA=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=d2j-ISUXm-8A:10 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10 a=pGLkceISAAAA:8 a=8b9GpE9nAAAA:8 a=6R5cnZJLetiTwrcwVFkA:9 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDA2NiBTYWx0ZWRfX6YXcMjiLusBB qNoTeQStP1QwwcUQD6Ci1phJIy0vqgx+CiGybozLJT9btqSwkclp9lUHaHnkI9k+BecSm/yF7TN AuKrpERUynr+ZjU4xUy7eRThnFOZcF5g/8meZrFqLxqWFMWK5hfJsHFwGw9fU/eiEtdsxueT8UR
 /o7nmLy8Rov4mKw2lmyKQqRKStk2k4PWOuM+YpsDwWqI6t1qE7oZwrbfO+o0TQd+HG6Pgu8dMap atdYwp2XXBE/CTnjhgpnLBLmXdz18PJ86ZN7D2wjEK/8N/Rt+LOGj9t72XMMjy3IolwymFU6lQM FO4lJs6v/521FCVdcl1SfgKwA0TJTVK07tDkbBIIcYzWlt3QySeJP+uZA2pq1GXFrkcPNDp8M6U du4BDkMq
X-Proofpoint-ORIG-GUID: EFTTKrm1wJB69HnGJnW2uKG7UoT4A2hG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-12_05,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0
 priorityscore=1501 adultscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100066



On 9/12/25 13:36, Raphael Gallais-Pou wrote:
> st/stih407-clock.dtsi file has been removed in commit 65322c1daf51
> ("clk: st: flexgen: remove unused compatible").  This file has three
> compatibles which are now dangling.  Remove them from documentation.
> 
> Signed-off-by: Raphael Gallais-Pou <rgallaispou@gmail.com>
> ---
>  Documentation/devicetree/bindings/clock/st/st,flexgen.txt | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> index c918075405babb99a8f930f4a4430f57269417af..a9d1c19f30a3366c2ec86b6fe84e412b4b41ea56 100644
> --- a/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> +++ b/Documentation/devicetree/bindings/clock/st/st,flexgen.txt
> @@ -64,12 +64,9 @@ Required properties:
>    audio use case)
>    "st,flexgen-video", "st,flexgen" (enable clock propagation on parent
>  					and activate synchronous mode)
> -  "st,flexgen-stih407-a0"
>    "st,flexgen-stih410-a0"
> -  "st,flexgen-stih407-c0"
>    "st,flexgen-stih410-c0"
>    "st,flexgen-stih418-c0"
> -  "st,flexgen-stih407-d0"
>    "st,flexgen-stih410-d0"
>    "st,flexgen-stih407-d2"
>    "st,flexgen-stih418-d2"
> 

Reviewed-by: Patrice Chotard <patrice.chotard@foss.st.com>

Thanks
Patrice

