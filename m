Return-Path: <linux-media+bounces-41203-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 954AFB38A69
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 21:46:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 96A681C20A36
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BAC9A273810;
	Wed, 27 Aug 2025 19:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eJfeQotv"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2078.outbound.protection.outlook.com [40.107.244.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41B0221F32
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323993; cv=fail; b=qfzIhGBzv2aN+KKFg/sRj6+a6L8l3pcaqmb+3Cqh8qgyXng1xW0XOnAjEO2aKW5DiySh7irrpJJHpC6n8UG92y0cUqelpgo51hkzk+B2Dcf2swJl78NPbtbopyQqdQx/jWxFe9Y5gyJ5ief7AbN4m1+gznLlsWTlcSDp68OGJ3E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323993; c=relaxed/simple;
	bh=jWrNcO9DVszRiMv94W73ypDEyh7mY5Bg1uc9itu13Cg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eQaol0KG6OGk/dp1HewhzZ6BkkPW0wAP6guYGsOMcTUqPVjWe64Wc6tm5G1Js8hWVsvu0tr7Mp0Tn03LwVmkaa/oehu4CTrLc967EOoZ5kKvjzeiT5bIZLydEOH35eGb5CdrSPTQm3YClQ6oJCPtkcz5zndczKEj4zBITI31NM0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eJfeQotv; arc=fail smtp.client-ip=40.107.244.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SudSxGAunlhDwQWpnt4AV56+TG86QaikgBKg07oGkU7gRVPOSzdJDGPtlan8TLWmqSNTK3/6yBNx1Y3qSQGNljQN2uhkqIN4Y41KS6J10E0UQQ2WnHroDAIt5eiG8HlfdkM7h5i+qiKdqJXiyCW2QgO0Bm6Hww8oHWLJoRJ9RmnGPQ8o/RFp2IkcwFxRfzTxPBWZ/ov71eBCU7m/Mpn8wIPGyyH9oFqs19kIbbm60sfNNcByeSvjF7teu+d4fy8jWr7sWRAYbseWsM2PIOEALE9yEzuJ1lZ3xnGYKzh0Hi2VkmBsxHwXY/p6VCG+f6EJflhAaZfnu8Ucle1/XopWLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k25m6PS/TlLs8TpsVc0vqdRQFzhG2baF28e2p4quPUA=;
 b=X/gwrIdZK+afNTDEdauhkTazCD9075qRAzfAx4JNMwmc0nI1mB5wYaV+kU02ej5cYs6OTl0GseqvWroKQKCsl8FAHfmQSBA6KTImWjoraCrXEIvgwaKZh177fS3VfXzCfXNnTDXQ3K8N7PcThCARfWtubXUgwZ7K9XacBocWiR933O3sdQNTnGPjoPnBQipdphdrtv0+XS1b+czRwaLg2DSDN9C9+sQHPoSRKuiC/gmXmSp9aVA+6mNEp20inHzvMT6t0xFGwbjTRNfTWAbRArNgJYY8tAnQjebQzWl+BMSoVXBZwUDdk0rwI6spCgmFobtgxlgaV38rwkr+x2tJQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k25m6PS/TlLs8TpsVc0vqdRQFzhG2baF28e2p4quPUA=;
 b=eJfeQotvMjp4DihDW3DXQnlTRMoCcx4a8gYCo1V5eHQhAeI//8Vay0D3ovSpBAolp2IrhOk0cqZtrHBoITTkniNuvrFEmaL4SPG36Ujr4R0M3Ur2bPL6VRCZndN5e3wosIGGofB1J49hEv9mgP+q2XhYeXmywdYoQjzoPSx00JI=
Received: from BY5PR04CA0024.namprd04.prod.outlook.com (2603:10b6:a03:1d0::34)
 by BY5PR12MB4227.namprd12.prod.outlook.com (2603:10b6:a03:206::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.21; Wed, 27 Aug
 2025 19:46:28 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::f8) by BY5PR04CA0024.outlook.office365.com
 (2603:10b6:a03:1d0::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.17 via Frontend Transport; Wed,
 27 Aug 2025 19:46:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9073.11 via Frontend Transport; Wed, 27 Aug 2025 19:46:27 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 14:46:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 12:46:27 -0700
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 14:46:26 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <linux-media@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vishal Sagar
	<vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH 0/3] media: xilinx: vip: Minor fixes
Date: Wed, 27 Aug 2025 12:46:23 -0700
Message-ID: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|BY5PR12MB4227:EE_
X-MS-Office365-Filtering-Correlation-Id: e5ecd637-aefb-40a2-4aba-08dde5a269e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1kBas72+untSG1NNfwTmXGiW9qV6BabL4mr1aLGt16uA4dlwbkrFBUcZ5QOv?=
 =?us-ascii?Q?geGxAFvGrUBeIIHVVSXjrEh2BfjBlaGJm2HFzzxaCfQbRBufYDicupSZKB1t?=
 =?us-ascii?Q?o06IBpsy+RW6d61wu4D3UF3uk36F5BF35KOSDhvrWIYRUDe37/LjBhXIw8Hn?=
 =?us-ascii?Q?H0uBt0VcZ7xhMrHAhmbhYNTc1ltFOmG/yyh6m3s+D8rHRIIK4w+BX7agvwSH?=
 =?us-ascii?Q?W64CIA3Bu58fmE8DmvAEDE6shadBk8E5hSI0sF8kzhLo3IVPzLQjR/df1M7/?=
 =?us-ascii?Q?1DtmQ7JWkhnk9Qu/DQka6ZGwWqC93sBFOHwXi9PNanfYT7zpSyozXXR2gszz?=
 =?us-ascii?Q?LUGNVdyqrk7PeYsd4lAkLuaCXDvnHY/YLzOT0Y9+95TZV901QGplSWbMBN2p?=
 =?us-ascii?Q?pLsyafG1s+CYHmNdZ4OrBLtR6nzeO/Vup9gIZB1sriK3uqMnCRPwI3vHFPuk?=
 =?us-ascii?Q?yiUW+/CSzLQtFYFo6u7E9ochIVapy+g7W9DvYTFilSe6r2/kumKBuHW/tytD?=
 =?us-ascii?Q?dbH+X8/d1R3nUBfrdv6+qKowzNws2T8s5ySkec1FRXeuki3g1oOqnupdV7IZ?=
 =?us-ascii?Q?Q8dQ7mjFzVYbIsgxGEx6Fp3Ef9W4vMssfntPJIInDM3JT80PP4722K4SK9+Y?=
 =?us-ascii?Q?E9+rHBlFpjyM+aLDlGc9covr8VkDKIoc8QRCUpbgN1ctR9mvmnDtoQZdBMh3?=
 =?us-ascii?Q?j4HhhKPzDQyl2PPQMSrZbR0/ftMn99N0D2MEyCH7dMvd+4pIgYDrYxrV+AHG?=
 =?us-ascii?Q?wgmxypVxOj0kM8My/BZIUsxyOMFPCHqAwMNgTzURLboVN8QygbQ1MZtjAlJY?=
 =?us-ascii?Q?Rarl2WPO2wgYw3AbhRdMJnhdzp+KkQydXChogEHZ1Y1TTo+WVW01Lu0224yi?=
 =?us-ascii?Q?0ebjSOHq6hliTIlTtKwKtBFElR/pECZWT6eicoKQrWMBPBsog3kgGIaEsDDv?=
 =?us-ascii?Q?mBBvuJvrLecQtisCCvX0VhOaIcTJZGezL+zB+n3lmkDEw2mj2BX2Z9dGlknq?=
 =?us-ascii?Q?l+DJKoafX069kazswrKrsn5fyYB2FziLlB3qFHpUzDcp6D5yWEJ0myeDYSa1?=
 =?us-ascii?Q?1BEOlOBnhMwOA9QXuOrlxl4h36YNRUkhJbll8sgy/h/Wcaeg5CbST+FA2+T0?=
 =?us-ascii?Q?nve0z3KszR5YewOgOutB5QcVDxJSqf8g55mf9JXHeYeE2QgvA53f7Gwdcnx6?=
 =?us-ascii?Q?Z4qS2Vy++QZQQhdMm1daIvqX2nzE/IdR+Oi9Apv/d8HMoIidKvoIIadvwbBX?=
 =?us-ascii?Q?NoQc1ZiEwinQQBDQAhlX5lm7w0T3RtZj2AifnaA3mtJS6uA6iqtS+CzodnHN?=
 =?us-ascii?Q?8tgKe+lRhxLtW+Y+U7aUmhYzh/vZChbm7jghqXd/prCDvihSfcuDd77JIe7d?=
 =?us-ascii?Q?+vuURye8qqZ2P2JzKsPbTEl9DYEcHa3m8yu+RPHQybdQ007N+JnflRtjnsUE?=
 =?us-ascii?Q?UeSEsvH8zDNAWi7K3/4Fs+3ln8ZEjtlb3kRWS/v0J3pvTah+35LYmPmhYWFh?=
 =?us-ascii?Q?rDxhp0flRfzjsecZQgUWVa753Cteh4Fcb2+p?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:46:27.9500
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5ecd637-aefb-40a2-4aba-08dde5a269e2
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4227

Fix a few static code analysis warnings (coverity + checkpatch.pl).

Patch 1/3: Fix unchecked return value.

Patch 2/3: Fix uninitialized variable use.

Patch 3/3: Fix code alignment.

Jeegar Patel (2):
  media: xilinx: vip: Fix CHECKED_RETURN warnings
  media: xilinx: vip: Fix UNINIT warnings

Vishal Sagar (1):
  media: xilinx: vip: Fix alignment to match open parenthesis

 drivers/media/platform/xilinx/xilinx-vip.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

-- 
2.25.1


