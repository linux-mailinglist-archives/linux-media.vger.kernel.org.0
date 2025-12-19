Return-Path: <linux-media+bounces-49185-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564ECD0489
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 15:34:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1600E30BF833
	for <lists+linux-media@lfdr.de>; Fri, 19 Dec 2025 14:31:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED327329E74;
	Fri, 19 Dec 2025 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b="HrbTDQRa"
X-Original-To: linux-media@vger.kernel.org
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469F03375DC;
	Fri, 19 Dec 2025 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=185.132.182.106
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766154686; cv=fail; b=fwLqwOjz6P94CqNacivQdA4RPFwule1V5u8a/Y3E82IzZQiqdChEcuMSfrpvykqZOea+amsP5XeH9o/3E1D0xwO8MjYyViHxRP5IxP+j+8pHqhzY5l6FT5L9DEbjGUaYxPzhtrVRKdeh0BqaupMkUFZE0L9y7LghWEFRD3fUTe0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766154686; c=relaxed/simple;
	bh=AJs2XXJJtFRp2idNAoetjz1UUwh85ueEEU6wEdLn8rc=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=MlI5U1izqGGGx/jPoIbxxPM2zOGs2PmFIlvCRjr0LMMMBEXYsZPPXXBV9yHyXAHBbwaOcTgmAvuAEAI4C4JZTzFMRynErRaAhBUSIj3/Y440nivgnJMZn3zhDrw6fbwt8U4dNNQFEQQ50bFgZxQ1pxQrDkLogfzR9WV0jubhcEU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com; spf=pass smtp.mailfrom=foss.st.com; dkim=pass (2048-bit key) header.d=foss.st.com header.i=@foss.st.com header.b=HrbTDQRa; arc=fail smtp.client-ip=185.132.182.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foss.st.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foss.st.com
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJEOSRs942232;
	Fri, 19 Dec 2025 15:30:54 +0100
Received: from db3pr0202cu003.outbound.protection.outlook.com (mail-northeuropeazon11010059.outbound.protection.outlook.com [52.101.84.59])
	by mx07-00178001.pphosted.com (PPS) with ESMTPS id 4b4r33kqbg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 19 Dec 2025 15:30:54 +0100 (CET)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doVP44rJLimL5D03UJgIqRsC3ItpBnBWwwQDQw77JWQJ9jwHELzgE5Jbwfn6qlkVlszE1ohLnwo3LkeCjIlABb0PSoOKUmHg/aCpW/OT2yRz9gd70ot8oFEvcqfmuSMyLh8kdn/dqgij4x9sQTFxti9gB90VkjkcuWsKgO6AZ+KUr32/eHMvzpwlskqMDLOlLthSImwjfVPWQftEp5UiTWqD6fML613lGr4ROrhNIODpE8PeOUfdQdps9HAK2DB6ZwJkrjpbsQnwVqamJBl6hNl4Bx+xJ9cAuJekpw8LT6lVHMnrlKRAeKHR4GAzmc95w4F9Gg2RHEyop1UcVieuiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kInA5EOqS/u14ipiLEei2dfFTfP5ZaixKIYVP+EKfuU=;
 b=UXSJb+0HIXqzgWUE9jZ5ugNegv3plEv5ZsfIEQhAx1+Iqd8N9ustEyrLT+53CsZMNEBiG8NnuSDNrtKJIheR0tDNv/ANkBSUEahytSelqteKqNg0FR/Da6AenAZ/w2UJsOUPfaOvYvs4tRieDkEK1zW3F4lpptsCR7Pz0Seg9mmIgWECdHMNMR3gj1Lkj7uqAnw66zmUQCMCqo7KVDT18khcSPqA2ua02P7Ar/m8kPRVcXX7scJ/wEAcSIbqhG4yBDtGCIpc0kIHTzSrjVUJ8grSWYitx4Zb2f6su8rWC+sN2uDq7XHW9hbVzw5C2Dx9LtkuVb43gO+DQsS6V4p0yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 164.130.1.59) smtp.rcpttodomain=st-md-mailman.stormreply.com
 smtp.mailfrom=foss.st.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=foss.st.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kInA5EOqS/u14ipiLEei2dfFTfP5ZaixKIYVP+EKfuU=;
 b=HrbTDQRavj85L7OMkvKTFmvYktQGPeyE9LudLne1nDMt9ntj7Y82FbSUsYi53NYOE0dyH8E/Vn49ACjCEs3M8bjKGeidGY6c78DIUixAh6FFx1uGpOm0un9atR4S5Ebkq7+DAC3nnlqKXjstuewWJuC3s2yPk078mTIIuRnQePDldVh4Ls7pLFy4EVT6IXAdyDNhlYz9PdXKEVWD6cCd2NHzT/2Y2dld2h8kOTgawM+3zi4jkXUPpJ0k66vEo5jOwK5TmQIDNAdyFjLb18rVrXjlWGBAQDDoYtafNUaMaCr0+60rFt0YDNxLyo9qzSbWIKBlRM4hCte7EJSRYn0aHg==
Received: from AS9PR06CA0010.eurprd06.prod.outlook.com (2603:10a6:20b:462::33)
 by AS2PR10MB7070.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:596::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.9; Fri, 19 Dec
 2025 14:30:49 +0000
Received: from AMS0EPF000001A5.eurprd05.prod.outlook.com
 (2603:10a6:20b:462:cafe::f6) by AS9PR06CA0010.outlook.office365.com
 (2603:10a6:20b:462::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Fri,
 19 Dec 2025 14:30:45 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 164.130.1.59)
 smtp.mailfrom=foss.st.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=foss.st.com;
Received-SPF: Fail (protection.outlook.com: domain of foss.st.com does not
 designate 164.130.1.59 as permitted sender) receiver=protection.outlook.com;
 client-ip=164.130.1.59; helo=smtpO365.st.com;
Received: from smtpO365.st.com (164.130.1.59) by
 AMS0EPF000001A5.mail.protection.outlook.com (10.167.16.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Fri, 19 Dec 2025 14:30:49 +0000
Received: from STKDAG1NODE2.st.com (10.75.128.133) by smtpo365.st.com
 (10.250.44.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:31:38 +0100
Received: from localhost (10.130.74.193) by STKDAG1NODE2.st.com
 (10.75.128.133) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Fri, 19 Dec
 2025 15:30:48 +0100
From: Alain Volmat <alain.volmat@foss.st.com>
Subject: [PATCH 0/6] media: stm32: dcmipp: fixes & improvement on single
 pipe
Date: Fri, 19 Dec 2025 15:30:34 +0100
Message-ID: <20251219-stm32-dcmipp-enhancements-v1-0-e2f8d46f022c@foss.st.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIphRWkC/x2MwQqDMBAFf0X27EIT0dr+iniIyWu7h6QhKyKI/
 27wODAzBymKQOndHFSwico/VTBtQ/7n0hcsoTLZh+2NNS/WNXaWg4+SMyNVxyMircrLuLjBGf8
 MI6j2ueAj+/2e5vO8AISSYeJrAAAA
X-Change-ID: 20251219-stm32-dcmipp-enhancements-b8ba6a1c7d8e
To: Hugues Fruchet <hugues.fruchet@foss.st.com>,
        Mauro Carvalho Chehab
	<mchehab@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        "Alexandre
 Torgue" <alexandre.torgue@foss.st.com>,
        Sakari Ailus
	<sakari.ailus@linux.intel.com>,
        Hans Verkuil <hverkuil@kernel.org>
CC: <linux-media@vger.kernel.org>, <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Alain Volmat" <alain.volmat@foss.st.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: STKCAS1NODE1.st.com (10.75.128.134) To STKDAG1NODE2.st.com
 (10.75.128.133)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AMS0EPF000001A5:EE_|AS2PR10MB7070:EE_
X-MS-Office365-Filtering-Correlation-Id: fa0f9b21-c4c8-4469-41ed-08de3f0b34a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eURqang0K1BIMGM3MjVnOWVsajc1RXhKZURBblJKb3F1ZS90emRndlZQeXI4?=
 =?utf-8?B?OU1vQndXQlpRTWhETmVPNTQzVXRyQ29QZkNhemsyNVlzYkVnUmxsOVhPako5?=
 =?utf-8?B?eFdVWURteThUbHVSbUZZeVJ1T1p2SC9XNlRwY2wwTGc4NFUzZUdEY2M4dEN0?=
 =?utf-8?B?YnpBYU1IMWorMHdpR0xDVWdURmt3b28vVXI1cndkU1BQckdoZ3JkcFRzWVNN?=
 =?utf-8?B?Ry84OWIyRG9pR3puRXpEeUI1TnU2QWRMS0pzdFhHQk5vOHJGc0M2dGYvWThX?=
 =?utf-8?B?Zk5xcE5sbzJRNnNKRVM2cFp5eDNLbDV2cHh3Y1ZsZkt4OHIxdTNURWpnUHVO?=
 =?utf-8?B?VUVQSVpOU0JnNi9yc1FkOVZmSXU4M0lGZ1NuNzlWcy9HemVYSWpjZW52VXZx?=
 =?utf-8?B?NWlUVTdkNVBvZWZ0b3JYTkFST0xsaC84YnpTdGJCWm92RVhsUktGZTJ3SjU3?=
 =?utf-8?B?RmlET0Vlc25VdDkrUkprZGRwL0ZsdEZWZjA3U2dTWEgxTW5RTjZBNGQ4ODNX?=
 =?utf-8?B?MFNwSGRBcEhxbHdsU0RadUphOGxtNnk2Nk9IbkpTWjVFcEFRYit2OERIU0Uw?=
 =?utf-8?B?eE5HcGpIclZtYWk4cmYrTWV3a0ZIZGN4SU9yUU45b1d1L2lIY205S2x2UElH?=
 =?utf-8?B?eVZEVk90K3ZmSTNMdXdsNFlTYi82SzNVMjZhK2Rtd1cxTDVYKzlHQkdTelAr?=
 =?utf-8?B?K3d5amtHbU1CQlhwcWxqckZVemc1ZVBFZjdyVlMzZWdYK2R4ZHAwYWRlYmxr?=
 =?utf-8?B?VXdvd3JoQVFZTFRGSGZteDg5VTlkN1FLYXNCbDRmTnNWMk9mQkV5cTRpSDJs?=
 =?utf-8?B?bjByRy9HTzk3NGtLdTZiOS9CeVlPTkgvVzZxazJzOGdEcVl0MVluKzVHQjY3?=
 =?utf-8?B?VzViWjFJOEc2dnpOVW51a1BEMEp2MjZKL1NueXdxNEx1T012ZEkzZzNCbXNZ?=
 =?utf-8?B?dnZET0E1ZWhWdTkwbmlQd0pUbENQRVZSZlo0TjIrcll0ajc5WEQ1azEreUZo?=
 =?utf-8?B?NzBrWnZYaDJESzNpUGdoRG5VMGQ5cWVqRi8wMFhtRG5MMXV3RmMxVU5sbllN?=
 =?utf-8?B?S0FJSHdDbWhEMUE1UjVueDU2bkY0YnU2S3RCV0paVXNqVGlqQWt1bE1ocGNJ?=
 =?utf-8?B?aDIxdGkwbFZIWEY0WWZKR3lqRnJINlpEazN4L3FsdjE2WHQ2bHZ2WjBqa09n?=
 =?utf-8?B?MExRc0QwMTVwdGU0V3V0RmY2dmliYTdPQ1JjaHhjWUVuYXI0WG5YQ24rZ2Vl?=
 =?utf-8?B?aHpIdnY5V1puWjU0d2czMFAwaXk5QkNNS3JKQ2lPdWlEay8yTzhvbkpMNXdq?=
 =?utf-8?B?V2NwYmg1TEMyVnlpVGFHbldYTFJ5WFkrOEFqK1d2RWdmU3gxUSs3Zk1ON1Zo?=
 =?utf-8?B?UWo1QWx5cFl3RDRtdWFoUU9LS3BBSDhheVMxVjREeHhYd1ZuVlF6Yld4c0dZ?=
 =?utf-8?B?Mm82Tjg3bU5mZG9wWEwzM2NNT29VeXFxc1c5NEp5VUdyZnBhd0JTeWVQTWJ3?=
 =?utf-8?B?cC9yZ2FPOTNKSjNBRVlVMUdHRkRBNFBFQ2ZVLzZ1VWRaMllHRnNtaHJneEJW?=
 =?utf-8?B?WnJDdmxvaE1CQy9qaENyd1hEb1QyUHZqclNwdytEV3JFb0g2YVFHdnkvRDh1?=
 =?utf-8?B?OGwzNkdmbEN5czh1b0pKckdhWkJweUN1UEk1NTNoRFBNTkhrcVlPcDVPK0JO?=
 =?utf-8?B?NmczaHNKazU1SFRETmE3MkRWNHpBZ0QxTlJzSmdBRnd3WkNQU21JSGNWbCs5?=
 =?utf-8?B?V2gxaGRWTjJmYlhpR3Z2ajl1dXFoSFJ5T3BOMmthZUZxbnhKOUVoZ2Y2OHo1?=
 =?utf-8?B?bk10amZQVncvWEVVVVNzUEg3Q3lMeHRYZ20zV2IrVEt0emtIRFdlT05jYnVK?=
 =?utf-8?B?RW1uQi9tY0dlRFpOemNFdWUyaUllNjM3QmNsWmRWOU1kKzI4NzRGOGhOREV6?=
 =?utf-8?B?YU4wcG0yK3pLeWM2ZkwrVU5HV2tScVQ3ZThPMkFvRC9TVjRCdEZ1QS9jazcr?=
 =?utf-8?B?dEpaYmEyMUs0bTJwc1QwZ3kyakJ3dm9MZldZTWpucnlDZE13WW1NdDl0WkJj?=
 =?utf-8?B?OTNvYlVTeEw0UFIyc0Q3UzhVZFhINkltME1XSFFkbmdrYTZ6MVlaODg2WUdG?=
 =?utf-8?Q?/F7A=3D?=
X-Forefront-Antispam-Report:
	CIP:164.130.1.59;CTRY:IT;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:smtpO365.st.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: foss.st.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 14:30:49.2961
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa0f9b21-c4c8-4469-41ed-08de3f0b34a7
X-MS-Exchange-CrossTenant-Id: 75e027c9-20d5-47d5-b82f-77d7cd041e8f
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=75e027c9-20d5-47d5-b82f-77d7cd041e8f;Ip=[164.130.1.59];Helo=[smtpO365.st.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A5.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR10MB7070
X-Proofpoint-GUID: 7gZiDI8cqY_j4pbK17SzPSJfcR0FVM5G
X-Authority-Analysis: v=2.4 cv=HfIZjyE8 c=1 sm=1 tr=0 ts=6945619e cx=c_pps
 a=Qe+yWEEHjmVirvDf6Rj5mA==:117 a=d6reE3nDawwanmLcZTMRXA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=wL9PcE0S0AMA:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s63m1ICgrNkA:10 a=KrXZwBdWH7kA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=8b9GpE9nAAAA:8 a=9ZIQ5LHtbM7RapxRV9kA:9
 a=QEXdDO2ut3YA:10 a=T3LWEMljR5ZiDmsYVIUa:22
X-Proofpoint-ORIG-GUID: 7gZiDI8cqY_j4pbK17SzPSJfcR0FVM5G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDEyMSBTYWx0ZWRfX0M0k1v4bOYtG
 CLxi97r94mXbj2EHb+wYXvD1+fSCKN8YRAtt+pmIAJUv0YyM9OD+ZIApbQ/+0WGrPSI1/xdklu8
 WLBtrjy7XaOUAo7retoPKOLsFjArA/a6kxLsgN+32lhcbcT9zgsh/9s362AdQ2ByLt4ssTSllhu
 jlXMZZ31O5jW0nbUr+vg/9NnZ3+WM1WPW8hcPGaOTJpjm6ux+OEQAi01zFjVcfwSqowYbdMTMO/
 7pBizBW8BgDIhA03848JYzP3adXB2iAnnq13/1YUjqz+oZz6//qNgBPNNBKuAyEvcHk4zetsuA7
 JOPtHxZ9PCPMMZzqH3f6rWYYg/GquWdrJOyGa4NLdw+IQ5R1cLeuOdZKWXPndHFE7Q88CgUewlS
 JDPiWwDYoAX69k+I34ra591VabDWa8UM4KpKu/0tk64IVWfDS5rRX+4y8VAD6Oq1KbYJ+jtsVE0
 ETzcX5vp71Juzgw5aMg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_05,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 bulkscore=0
 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190121

This series provides a set of fixes and enhancements
to the existing DCMIPP in its single-pipe version.

Those commits are done prior to addition of the multi-pipe
support of the DCMIPP which comes after those commits.
I splitted the overall series (including MP25 pixel pipes)
into 2 series so that it is easier to review.

Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
---
Alain Volmat (6):
      media: stm32: dcmipp: bytecap: clear all interrupts upon stream stop
      media: stm32: dcmipp: byteproc: disable compose for all bayers
      media: stm32: dcmipp: Add RGB888 format support overall
      media: stm32: dcmipp: add Y10-Y12-Y14 in all subdevs
      media: stm32: dcmipp: byteproc: only allow compose with 8/16bit fmts
      media: stm32: dcmipp: bytecap: remove useless cmier variable

 .../st/stm32/stm32-dcmipp/dcmipp-bytecap.c         | 24 ++++++++++++----------
 .../st/stm32/stm32-dcmipp/dcmipp-byteproc.c        | 24 ++++++++++++++++------
 .../platform/st/stm32/stm32-dcmipp/dcmipp-input.c  | 10 +++++++++
 3 files changed, 41 insertions(+), 17 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20251219-stm32-dcmipp-enhancements-b8ba6a1c7d8e

Best regards,
-- 
Alain Volmat <alain.volmat@foss.st.com>


