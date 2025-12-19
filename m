Return-Path: <linux-media+bounces-49204-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3BDCD0BB6
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 17:06:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DB5E13116D7A
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 16:01:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC51035BDAF;
	Fri, 19 Dec 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="BZBFSAx5"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C30B359FB1;
	Fri, 19 Dec 2025 15:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766159928; cv=fail; b=duj+8iMrnlD3BDU8YsoYRxrcxersmYVNVM6g/oGCxlOMwXQNhZ4SZVX6CgBGr2Ad88FNCGDUgxD+HPf0h4U9FqbSCq5Ti9NrOvd62QY7Ngk4z7LFKeJVX4dUXEFVL52UsfXDJWjyd8Z1qCXaJYGnAv1XviYIsU0DG6s0nFg3TWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766159928; c=relaxed/simple;
	bh=ELcOR2ZX07oKIcFHxlSEQLXvD0pS1WvuJuGaUW1Q3tE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=TvDqzpioFZ75Aoioe5XM6aGl2ui0bGCnzbcRzeXBPUZaJZ788UgLrWLPlwKuWk6mgEC/EvP9esO2yKI/m6JDMCJGk1rCC1Y/vuA8HXrTX0IKXKhK1bc7z4BHy+i2otbJS22bBLJkkuvxvgL8leZe8gHfEhgHe4pibUr1Ismgvzs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=BZBFSAx5; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJFnoAU640090;
	Fri, 19 Dec 2025 16:58:36 +0100
Received: from du2pr03cu002.outbound.protection.outlook.com (mail-northeuropeazon11011070.outbound.protection.outlook.com [52.101.65.70])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r31c0ed-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 16:58:36 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFRxNeaL1whN+6jGqM3rQWGGlzYndgWYgyAthtcq2GWhxiBKkzScbZq1fU2Avq2yzpVSxA0jDOnTJ6bqNL2wJ/Q6J+k15p5r/TLFjV1wJfSURmlTnEDYHAq1n2+jHTUSZ/iwajdyk3HvJYWHE50rYs3Xk/WeqZyo5acb2pdRmOKxVDF0xbiJuAdAF+2uly9pr1GAJiSAlkMxaygtSDwKZ+liV/ocxdAibfiXVHMBy4ImgOXlLh1dLjfJC0okGIsSJBVBzUULixUYUGxOyszx1QmcJX+qoMFFYo4Xeefnuke5VnjhYvYJdWcec6CLWkxdUzkfEUNt3PlHkOSe4SzQEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8CgAptqiDuFuYurameA+ChBwU9YOaB2xW2dPEjzlWXg=;
 b=Tbe+//VBRr2Xh7zPCzSUZt6LaJhycOW9QZ0//QU2hT+Hhs2QVwC8LwscjeRXsTfzB5wVrNTFDSWJUnMn7zwDBas+WHEceVyPCKDph3dK6lUK9iDo250dTSmKOqcu0O8qsyGgbOHQomoXEUoi7RBeDvr8+woNidK8q0j0ygcJ5NM/o0vV4hm2zTOhZ4N2OSCFvkUIGUHpKE3wWL4pnhmPJhhVQCEvq6k/4izHBx0/nslnWQqaugdru2fA5yG5f5jLDq9GItazwLJlyxhdWSrtKERHlSS95oNlHKJMsgkmjAw1W+9MThZdoUmQ206DMcU4pR+tzJy0GI6qNTxan6hTeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.60) smtp.rcpttodomain=gmail.com smtp.mailfrom=foss.st.com;
 dmarc=fail (p=none sp=none pct=100) action=none header.from=foss.st.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8CgAptqiDuFuYurameA+ChBwU9YOaB2xW2dPEjzlWXg=;
 b=BZBFSAx5JS54Hl8ziqeahoYUG65GHIAzpZIIWCC2CVXAEp7rIMSlJcepP/h5VxcXeZks0XP0FrtpIeHZE2jHVxKItWqUJ9gniWW/hy3LvmUiaTvLs40t3BX0Z0SqX9QD1sqGpHOmtdWccDEpVZW9MBz+CxV6wks+a9v7m7Nj/T00g5rfSY046oCs0Z7470lsvzeUYk7DuXMjK7BiMkKCkj70s7ROE1KW74TCUkuBQl7clfi91nte2NSBDgUkkc81P9zutSymUNiv6t//SiogoPvtN4XWB3yYgmMzfb7eyL8bn6J7pN1eF2y3ZTlLAYaXa9KKDwXOwX8P8JaNpH7tIQ==
Received: from DU6P191CA0030.EURP191.PROD.OUTLOOK.COM (2603:10a6:10:53f::9) by
 AS4PR10MB6277.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:58c::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 15:58:32 +0000
Received: from DB1PEPF000509F4.eurprd02.prod.outlook.com
 (2603:10a6:10:53f:cafe::14) by DU6P191CA0030.outlook.office365.com
 (2603:10a6:10:53f::9) with Microsoft SMTP Server (version=TLS1_3,
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
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 15:58:32 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpO365.st.com
 (10.250.44.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:59:16 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 16:58:30 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Date: Fri, 19 Dec 2025 16:58:06 +0100
Subject: [PATCH 4/6] dt-bindings: media: st: dcmipp: add 'power-domains'
 property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251219-stm32-mp2x-dcmipp-csi-power-domain-v1-4-a6edb2aa8154@foss.st.com>
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
X-MS-TrafficTypeDiagnostic: DB1PEPF000509F4:EE_|AS4PR10MB6277:EE_
X-MS-Office365-Filtering-Correlation-Id: ef5f514d-559e-4751-016f-08de3f1775e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|36860700013|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bCtsVXNoT28rWFNlR3hRNFpWdTlWeW5WeFRrZHJaS2lDWnlsaW9HendOckMy?=
 =?utf-8?B?Q3hEMnE1N2hncWJQa1YwWXRBSFJiZzFaVU5YNUd4bzdxWk01V0Z5enNBR0tT?=
 =?utf-8?B?Q2tjMEFWaUg4NitUamRobHZxY0hLWU0xZ1pZZVJTanVDTFg0OFlOSFRpSkhC?=
 =?utf-8?B?YzRiT2o3YWJReGVSNjRIc3BNMUF5NFhDbnd4VkJyK1QyLzN1ZFhBWmJSRHUv?=
 =?utf-8?B?Z0F2VGNhVHhtL28ycXcyOFhoeG16NHVLdk8wckdqY3l6ZWc2YS9DdUgyaTFr?=
 =?utf-8?B?WW5OaFNQTWRpN3FrL1dvMVUybjRqN0t2VEtQaG9tU3kwWEFDK0xBTmdsTW1p?=
 =?utf-8?B?dTBmaFVqdFU0RHJ5WTJWZEdVZGhkV29pMVJneGZqaENsbHRyVGY0ejJLVVhD?=
 =?utf-8?B?ZlV4YWg5aE9DNHgzVnhYN0M2S2treHlYK1hTenpPYWFLR0RTZzhXVTIvVUZ5?=
 =?utf-8?B?UDU5eXBRZHg5MllEYUVJd2FHblp0UEpBM2FmbUgzSzIvSGh1MVNLaEd4WVpO?=
 =?utf-8?B?a3lrR1R4aDJGNkg5bTU5dFlNRGpJL0J2Mm1qbCtyV1I1eFdKeW9hNXBVcTVZ?=
 =?utf-8?B?eEJNcW9ySzJtdEN0ZmtXQUtIbG5HS0xzNERlTlIzZUYzb1BNM2VVQm5tNGZG?=
 =?utf-8?B?QldkUW5aOHdTZzY0Ymozdk9uSkRNOFNvWFQrSUlDc1ZwVTZ6dDNXS0xJRVNC?=
 =?utf-8?B?TEJielQ4NVdicmEzZlhXN0w5T3BvWm1JcENGajBZZTljRVROOVhsbFNmSk9z?=
 =?utf-8?B?c0ZuaVBoT3liTDZyejZNU2M5aXpQazJFejlxbGpKZWlZOHRaU0JsOG5tMmpG?=
 =?utf-8?B?R1BjakxQMjFCWHRMMjk4djlJTCswM3IxcVcxRjRNNGNsRS9SODRWSG4rSk93?=
 =?utf-8?B?V0lJTklrME9yRWFIM04rYm9xN3d2eHlrdnNBcjVtYWJIc0dpU2RkYUY2MVdH?=
 =?utf-8?B?V3Z4MXlSbFhDTHpNNHV5cTltM2pidW8wdGZNUE9oZ1o0d2dqd0hMVFduL28y?=
 =?utf-8?B?NjVDL211Sks1eFJYSWpoc2tjNEdGQ3hwckd6L1lFTVQvMVdUd29XRjVVMmNj?=
 =?utf-8?B?MTdLUlQybndLOVVMRFlxSmJTZ3F5cjNiYmovakFsWktUbjFLNGtCcEJqZEZt?=
 =?utf-8?B?Y0s2NndrZWNZOU9idkNiNVF4RmZvNUcvLzE2T3RheW1XSHgrK2xhV1hKTTZV?=
 =?utf-8?B?WStGaEEvdG5taE5pbjUvU2lJdEdxUXhaL0syMENyWjR3M0o0cDlvR0s4WDJT?=
 =?utf-8?B?Z0JBRkU5aDJFOXhST2ZqQ0NiaUZ4N2c5SzlwQVJvMHZ1OGl6ZjhZV2NseGxj?=
 =?utf-8?B?L2tBYTd2UU9TVmw3NzlSTmdzb0xwT0RyUmVEYnZNNzFMTEpXRnFRbVhBcTRr?=
 =?utf-8?B?aXpZcDFjTzdFMWN3WnpiNUd0VkZDVFplUmFSdXZIbWZWRHNueHcxU0JNTVNV?=
 =?utf-8?B?OWNaT3B3bFJEdzM0VFJtSy9HTnlzcTdNVnl0TWloT01KK0lZRXV5d0h4ckRa?=
 =?utf-8?B?WFZ0SXk0K2Frb25nWXdMcDlmRUtqalZ3SEFkOTZ2T2ZXVjcyVjVkcjJzSzdv?=
 =?utf-8?B?K3hNV1IycjY0WnpKTnFzVHh0N2lmMTNTZ2JRamQyNUt2cXdYRmJVSE5vMW9z?=
 =?utf-8?B?UGJSOFJ5bFAxOEtPVE5jUXkrRnBlNWNsQk0yMnYrS2VjRGZTOFdCb25wS0Ns?=
 =?utf-8?B?SjFnS2ZmUE9TeXMzSGZQcURWSTBGV2FtWExYc2k1S2c2MjREbFhQMGNpOTl0?=
 =?utf-8?B?T2VVSEdoVTFZYnQwb1MrRjQrTVNkNTd5d1I2cnpDMkxQYWZSZEZDL2svZS91?=
 =?utf-8?B?ZXI1b2FhdDVWTEpuUnJ6MzFmV1kvdzU1Znh0eDdDTTdKa3ZDTktuOFJHNms5?=
 =?utf-8?B?Sks5YjlweFlSZEFhQkZaL0ZrT2J5ODg5NCt6amVHWHBZV2FtSTFyMFM3MktP?=
 =?utf-8?B?cDNlb1BpbTFIRWErakNUL3FEOWlzYU1mNUtFMUd4TXBiSjhkemhzRUdqWW5T?=
 =?utf-8?B?aE1CTHRVOUNkOEEzVjlEVVVtTnkwWXdnZVFxM20rREdqZDk4Z01kejRLQjhV?=
 =?utf-8?B?TTFRQVJqSUZLRlFGWEVRKzN5UjRJMTYzOFZSbEhaWWZ6SnpKWjY0UXArckF3?=
 =?utf-8?Q?iiqU=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.60;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(36860700013)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 15:58:32.6500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ef5f514d-559e-4751-016f-08de3f1775e0
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.60];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DB1PEPF000509F4.eurprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR10MB6277
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEzMyBTYWx0ZWRfX/OvPKp5SUsSx
 wj7qpLlAj7/gzHfxOIDAhbjU+skD4QHCLud35QVhs1xkyKCocbuXj7uAePBZQe3VAzKbZ239CpE
 OcbjBNOVt5csCKyzYm4DSMvI3F7vXS75npW5jkCelAeyKtPLacUlTbc1lp0z31DsU1bZgesLwSP
 xlwg0MBlxnDARZAU9BV/L/JQnSBl/WiN9tRAkNkQG7PQ5XI6sfz2R0fwfbjWAWkAoFmFYtHGGmc
 A/jePiJbh3U33uWzMPEWMjomTKdmHjxt0cyRYF3/36jJpPkjBpw0pSJyRuk6pJ5abWmCJw8zjlY
 LgljX0/7heJ9ZYySSX+OHjK2o6AVi1ZK5+3UD+YHufQ16nWdPE1wo1yxM0D7zzWxfw/RkcZ9Gzz
 CZvYcbWoW5wwo2h7USB9mBmIefjr59/dj1jphxPIrXuPYYpEcsOuQMmKW+uns4PmENkG+SxyzrC
 5+lUYnIhBLQgfFGHLiQ==
X-Authority-Analysis: v=2.4 cv=e9ALiKp/ c=1 sm=1 tr=0 ts=6945762c cx=c_pps
 a=zFavDl515riqcEWy6M9o2g==:117 a=uCuRqK4WZKO1kjFMGfU4lQ==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=zLVqyxHnzdvKUZOKXdUA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: LCuOgO33quG5yMuOhKspNx_wqHgRgCz4
X-Proofpoint-GUID: LCuOgO33quG5yMuOhKspNx_wqHgRgCz4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_06,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 clxscore=1015 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190133

STM32 DCMIPP may be in a power domain which is the case for the
STM32MP2x based boards.
Allow a single 'power-domains' entry for STM32 DCMIPP.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
 Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
index 7b03a77adbce..162a0c526d5d 100644
--- a/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
+++ b/Documentation/devicetree/bindings/media/st,stm32-dcmipp.yaml
@@ -37,6 +37,9 @@ properties:
   resets:
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   access-controllers:
     minItems: 1
     maxItems: 2

-- 
2.34.1


