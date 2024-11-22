Return-Path: <linux-media+bounces-21787-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA1F99D5B07
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 09:28:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4B39DB21D10
	for <lists+linux-media@lfdr.de>; Fri, 22 Nov 2024 08:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39F4918B466;
	Fri, 22 Nov 2024 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Oy02iv0L"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2063.outbound.protection.outlook.com [40.107.94.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B940B13AA38;
	Fri, 22 Nov 2024 08:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732264101; cv=fail; b=Dgnkm2uq7rtUOAb1tBBTIEK7QyVmOgUUUIVUyCNSurqThNWg7WTZMRfoHmd2MQ1Vn0oVRUoufrqN/0cLJVUftzOKwgTq9aVZxyy60LX5mYCeLRx8AOOl5MNGbcdNHZvLLEx+mfO0sL/biKGn23dFLArJIVCKTUwJnrngTakcsx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732264101; c=relaxed/simple;
	bh=z2gyshxhiOoeO4I67iR6UGCGkSfeozbs1am7J5usw94=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=W4smg3SpdBZXYpHW7rTfkKow3fXGYecjhCzDsARvHIrxjFCA8VqGbVJPD7kptcQQDvfaN5BoQLTewrC+g6TzN2ljvUie0GvhfKusjXwgthORtt8znnZWqYZGH+UXsWk0fbl47rNJFDWo2WUuKs3FU6xDIQFF6Wc1kgtXNJ6PI6w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Oy02iv0L; arc=fail smtp.client-ip=40.107.94.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JNerJ0jklECpUpx56t58KV3+03v7qJuozZJtja0R8yzZ6LXbX2qSHkAd+Bb+VsiMNkfG1pqfQsxUOn7uo9pwFZd9c4qEPUIxaxEz3BHD5YEp0RrYw2jik5HfKvrTMwH1l/GiWcas0mGd/VPnGmrKxPS3Y6CNNX4T3MhOorc0rRXC6Bwrr3lJXsi/NqhpY/DQIoCbNxElvSKprMnI7K1N6NFRLR5DyAlP8i1l+SBIaD2cyj5h7i3Csn+H0p3KBafZzs3Qm499GO+PhbiJE7ekRvd+OfgDD0jAPW37CGTzNACryHo7tlvFNNoOurbzqcBBtw1UsOS46ErJ0NRZ+gYOWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ywWrj9p6lVGuCwzPiIF4pGcEmvSw2xaz8fP94I8C0vs=;
 b=p28Tef+aO7YWSt6rTHwVo384dFTAM/kR/1lP6X1tqDdrWWOnF6Lr9YF0Cq7UY4UQhdLoTnimbWQt7Ac5Pfc7xnBvrJMg8O5dc9d6ppPxa8tr2zFSmTOEdIblB+kzx+dGtbZDc1bOXJQ2ZVXW3fofUMx9GayiRPmyy75Anzd/Wm9D9YBZQWyECwm5THY4ZQR4/ZatMa9jbr5eA0SFxMbt6IS3FlEdliN8CxuqjQVEuGRURoCIidSgPvd5lVrSthbcv3CLR7T0kkqL9nSfiB7Ic7kCTpVXStE4rRVAP8G70FTTc11FUKmJqoNZlUNXLxer8AaQPF0KEVmvzUpo5g2k1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ywWrj9p6lVGuCwzPiIF4pGcEmvSw2xaz8fP94I8C0vs=;
 b=Oy02iv0L502ijjJl4ObDDRqlLzvWODLW1VzpluNRjdpv9G4esUd8O9lDKH14N9xEyleeNnwXZG886pm44Zy5mDkYrQvSfKtIF5hSKr5fq0up9fBzuQu8LA6hkQtCXolI8J8sj+PbiqrusYg7b43ynBLKulA0l8LYTt8B8aVfn+8=
Received: from SJ0PR03CA0016.namprd03.prod.outlook.com (2603:10b6:a03:33a::21)
 by BL1PR12MB5874.namprd12.prod.outlook.com (2603:10b6:208:396::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.21; Fri, 22 Nov
 2024 08:28:13 +0000
Received: from SJ5PEPF000001F5.namprd05.prod.outlook.com
 (2603:10b6:a03:33a:cafe::24) by SJ0PR03CA0016.outlook.office365.com
 (2603:10b6:a03:33a::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Fri, 22 Nov 2024 08:28:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 SJ5PEPF000001F5.mail.protection.outlook.com (10.167.242.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 08:28:12 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 22 Nov
 2024 02:28:08 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: <stable@kernel.org>, Sam Bobrowicz <sam@elite-embedded.com>, Hans Verkuil
	<hans.verkuil@cisco.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, "Sakari
 Ailus" <sakari.ailus@linux.intel.com>, Steve Longerbeam
	<slongerbeam@gmail.com>, "open list:V4L2 CAMERA SENSOR DRIVERS"
	<linux-media@vger.kernel.org>
Subject: [PATCH v2] media: ov5640: fix get_light_freq on auto
Date: Fri, 22 Nov 2024 09:28:01 +0100
Message-ID: <2e79be9185cbb0dbe40e670eee996cf290bab0a6.1732264079.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=790; i=michal.simek@amd.com; h=from:subject:message-id; bh=0szr4bfNMaSATMo7Tp3HwhQtJmmgaAPbwdapvnKvkvk=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhnQHh0m8fMv3Tfv+uWXaWes/Wul6O5+15Sp8rulmUdgw9 9OuytUPOmJZGASZGGTFFFmkba6c2Vs5Y4rwxcNyMHNYmUCGMHBxCsBEqkQY5mc+Fz3ZXFNavGe1 6K6f/1Q2mbxuiGGYH7DwT1291uI6xa1ZWk9YegVZ351LAQA=
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001F5:EE_|BL1PR12MB5874:EE_
X-MS-Office365-Filtering-Correlation-Id: 037fd926-5b2d-429b-8f4c-08dd0acf9a99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|82310400026|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?VwVOk953RXZTSeD35+ZwFiLcZ2/jwuPC4k8Q9n4cFK9QU3/6Y0G1iZ2L3gJo?=
 =?us-ascii?Q?a7vyWPTGs6W+cRIyXSAM8ohB0noJW0ciciX9mdulevZWCzX8NEj+SyY9lEwX?=
 =?us-ascii?Q?DaeEHcxL8XCX2fS59MN5MgOIIJA1l1e2Tx6QdNkVuCTWQY3Pskp2apv6e9Ja?=
 =?us-ascii?Q?skDyTpq1LWNTEN0HZ8b7DQvrLXDYMqSSI7g+Spf1mltYBwJC79vNTj2AYNiD?=
 =?us-ascii?Q?79D6J9u3KVKfCwQ9XON+638l290HxiTGr8xP/SpdQcjCWKsrpf4kk5J4tvef?=
 =?us-ascii?Q?lly3Z0cLwjqudblD0b0VgMwxX4vxMj+kf1Fo1W2a2pRw0Tu9AydMlEoarNBe?=
 =?us-ascii?Q?KxFXouELuxX7Yhk+XhgwqESW0PZVNQGSc91tlh/e9cbORtgq+HNqRifbauvs?=
 =?us-ascii?Q?3HW2+D8SKm5H/5R2zowWtznpvQEcVXCF8PLQRNbv70VFUr2wLpFNTD30+e0J?=
 =?us-ascii?Q?Sro94KGoxecP5g3vXJmasmSn37ZcI357vBoqxWhfldTYOTfE7vMkahzEDbke?=
 =?us-ascii?Q?0MDSdx/BjRJpEfnQdquq6id+VQz81A4J5wfA5J1WPzHyj85fnNgJDO1mzr/q?=
 =?us-ascii?Q?2GfiLTV1PX56PdABLYTNZ7GNjPkm8Ck1fZe210QfCyGa9DAx3e4VztShYzMS?=
 =?us-ascii?Q?wJSJoTLlgaBHuGqFR5PxUXQHVttNaXh5LQkj3Dv0mkoux6983jy4QsJozp7m?=
 =?us-ascii?Q?aiPOXJgIZkGN5JxByy2RkJykFtHDs9JYS5WnLuST+ob33OFBUvI2MsJpn2lu?=
 =?us-ascii?Q?TLD37RHljl0DqUXgGUYMT4/IvraLRNagCseCNfVkyQZJ4xzZpr1r/pm4wOZW?=
 =?us-ascii?Q?ELO0H10/45A+W2JTdNiaFmPYXtQbUHp8Lwuz9v8tJyLv8HRoB1TraIpH6Wkc?=
 =?us-ascii?Q?OdH6hWD90RdxsIsjvrZ7Fv0JnS7YK4sipQX10Jiahsq2KomtnLVFoBq8dFFU?=
 =?us-ascii?Q?9Aj0RDyUs2Xh4d4YAL9Y3++/oB/mI6UqFptDfrfbZ1WbdEePq8RdrdfZH7IG?=
 =?us-ascii?Q?u8iriT/AJkPQW/XIQS8MVKnZ7skxV6ZGZC2EFR3VCyhwyveJdrLcApGpN73h?=
 =?us-ascii?Q?1CF6unEpBCxB7zvsUknHTgbXH9+AGieHGgmCckjT4QJ17FzkyYLoHIFgPVlU?=
 =?us-ascii?Q?3ksFWDtjy652FpzAmgnNz4nu9hhhoZgAI/tm8o5vdMKJ5U4chJYcWIogghOb?=
 =?us-ascii?Q?UQWinYLMUPVZvIBwkbOn3eEGi6AnoInxHRJib9q/9rGDK+Nf96gKVXM1w93G?=
 =?us-ascii?Q?F1VtXDMude1QVTxNXUF7kBHuRPMePAe/VJRbHrj+36T02FmzJiHputfzQjdQ?=
 =?us-ascii?Q?JOfn1WMeYVDv2jtSn2XahPbaGk/EmlyM1EUhwhTUwcfMZZs6i14At1wqj8ib?=
 =?us-ascii?Q?VCniO3+lMIXUp5MiFQXpa4CJSB/CJLUsY+6szCyGqGHGkWdwxg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 08:28:12.1616
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 037fd926-5b2d-429b-8f4c-08dd0acf9a99
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001F5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5874

From: Sam Bobrowicz <sam@elite-embedded.com>

Light frequency was not properly returned when in auto
mode and the detected frequency was 60Hz.

Fixes: 19a81c1426c1 ("[media] add Omnivision OV5640 sensor driver")
Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
Cc: <stable@kernel.org>
---

Changes in v2:
- add Fixes tag and cc stable

 drivers/media/i2c/ov5640.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/i2c/ov5640.c b/drivers/media/i2c/ov5640.c
index c1d3fce4a7d3..8566bc2edde9 100644
--- a/drivers/media/i2c/ov5640.c
+++ b/drivers/media/i2c/ov5640.c
@@ -1982,6 +1982,7 @@ static int ov5640_get_light_freq(struct ov5640_dev *sensor)
 			light_freq = 50;
 		} else {
 			/* 60Hz */
+			light_freq = 60;
 		}
 	}
 
-- 
2.43.0


