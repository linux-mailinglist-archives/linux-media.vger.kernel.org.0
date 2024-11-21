Return-Path: <linux-media+bounces-21760-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 533909D4DCD
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 14:32:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 996C6B21B09
	for <lists+linux-media@lfdr.de>; Thu, 21 Nov 2024 13:32:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BBA41D79B7;
	Thu, 21 Nov 2024 13:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q4Anmx+4"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2065.outbound.protection.outlook.com [40.107.244.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB691D04A0;
	Thu, 21 Nov 2024 13:32:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732195953; cv=fail; b=aBg4stjqL1+mnC0id5GfW6HHyNZWJZmTFmgGzgtRogxujXJgMn5IB7iu7Tsv/LJ85tmdUsjCMWj46qSJqpiOZRbjOc7AEjbLoQsowOYqHQUu+f0aPk4B+yqTMPOpeOZB8weSTLwdJV9hCHyzG+F2vtg97xH0TN8/Hy3jc87cGek=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732195953; c=relaxed/simple;
	bh=qFLmQK7y8E8sYeUmEaYNTyTkDZpwv1WjSNMkXBUWNBA=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=sQMQZGkjR/cUgSRVPQnjyoOO0lDVyPVZV1+RAE3TBVCqUyGuX4HWcZWoCwV8wfrcRS9MxHcZExzDEL+NJEbP52D63w1+FgvAiqjMiefZg4KmM+KnBNrwlhoI20ihHyGGoXZ8HYkznnCA+kfg5qxcqvQ5ls/h6vCz9JEBKu2gYsw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q4Anmx+4; arc=fail smtp.client-ip=40.107.244.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K2UF1/WDDQlplCuXefFtdPmUsx1qjJPs3yEPKibu4xjN6l6gZb4fQNVIxS4unn/QSmILfCqklbdQ9Xb95qwLpYd54DNHthfo9cvz1jRbFTbCdLYd1GM/A2bWQJFbPF268R5QtvXAH1jmdB43CDn1AwZNH3iY4oSJ25pEaYk5XWN82Hwj9MAjDO+5hYxMn145qqeEeFe3wLsizs3WNZlQMspV9wDJ/q+zSysfVjrpNNGvbs+XKDuAJ2XTI8PFN/8Sa1ItkdX69voWwTbIjZuvdPtCdngnlr2IkqwpyypVk/wQgbJ3vuEIYSeiZ0uq4IRMFinYvCISdO6co535Xvq2Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X02t/7gsuBe8uNrXE/l18VC/SvTBR+TZG+Ewz5SjFUY=;
 b=HEEscs9c6NFMfrqKkaUbQ94LNSDPOjEdQ+r7GXSus85mSaL2UpMNQ/uE0npB5Ay2haWkFFab9P1qhF02HOLLfh3cdtSk8ls/+nMiu2Y9VmFeAmCRYZqBS1zr/4DHu4cyD1/nBeke2STAT+Xbe/aJ4tBv3m4GW4M8cDigERZDktJSBFhyJT6wK7aCnCKJkfPw8FnYOrUbhEae5vVQZn+SB0JgwvEWdk7+NjZ6hVqcacBeDoAAuHpWLdUq09yZ5fjeKo+V/xpqBcv4wG31JQZeDRAfu15bUALmHJvzeLePSkKRfkJJVh3WaovFrQAhAFJvCSWdOPkvcM0k80mtRd0Lng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.12) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X02t/7gsuBe8uNrXE/l18VC/SvTBR+TZG+Ewz5SjFUY=;
 b=q4Anmx+4O0519tVEvdVfoenODntVb3Z3B6Fqu2C2YLxMfuPbBiDrfgjV9TuNvdruyhVJTaTWGeoAjcxOv1XPTATXSBgkhqHWBrvgyWtA5XhqU0T2OBE6SqznkOuTKKuIuEM/IBOhzoPDi2Oip+1hgwqraTgM5GbphOaOKEI6iw8=
Received: from BL1P223CA0028.NAMP223.PROD.OUTLOOK.COM (2603:10b6:208:2c4::33)
 by DM4PR12MB6661.namprd12.prod.outlook.com (2603:10b6:8:b7::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.15; Thu, 21 Nov 2024 13:32:28 +0000
Received: from BL02EPF0001A100.namprd03.prod.outlook.com
 (2603:10b6:208:2c4:cafe::16) by BL1P223CA0028.outlook.office365.com
 (2603:10b6:208:2c4::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.24 via Frontend
 Transport; Thu, 21 Nov 2024 13:32:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.12)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.12 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.12; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.12) by
 BL02EPF0001A100.mail.protection.outlook.com (10.167.242.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8182.16 via Frontend Transport; Thu, 21 Nov 2024 13:32:28 +0000
Received: from localhost (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 21 Nov
 2024 07:32:23 -0600
From: Michal Simek <michal.simek@amd.com>
To: <linux-kernel@vger.kernel.org>, <monstr@monstr.eu>,
	<michal.simek@xilinx.com>, <git@xilinx.com>
CC: Sam Bobrowicz <sam@elite-embedded.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, "Steve
 Longerbeam" <slongerbeam@gmail.com>, "open list:V4L2 CAMERA SENSOR DRIVERS"
	<linux-media@vger.kernel.org>
Subject: [PATCH] media: ov5640: fix get_light_freq on auto
Date: Thu, 21 Nov 2024 14:32:16 +0100
Message-ID: <cb9f8aca1f07472d4c794cc66ebbde1977ee9e95.1732195934.git.michal.simek@amd.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=647; i=michal.simek@amd.com; h=from:subject:message-id; bh=Nc3NuthoJzeCmobD4j0IPQ6JUSuMgH5T2onLJIuUlgQ=; b=owGbwMvMwCR4yjP1tKYXjyLjabUkhnR7s0R+m/eaohG6jMkMC6MNIrZ4MbEoexll+vi7yMjtO D6FWb0jloVBkIlBVkyRRdrmypm9lTOmCF88LAczh5UJZAgDF6cATOT9TYb5jnnuDyUizu/bZ2S9 9pOdsYxU2akNDPMd1ukyd592UHrwI0TpzR/LA2c7zwsCAA==
X-Developer-Key: i=michal.simek@amd.com; a=openpgp; fpr=67350C9BF5CCEE9B5364356A377C7F21FE3D1F91
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A100:EE_|DM4PR12MB6661:EE_
X-MS-Office365-Filtering-Correlation-Id: 7269e849-5591-48d8-1269-08dd0a30f19e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|36860700013|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hiNUWXSS9U1/H/4yez98SWoZI2RDZbVTkCOmQPAKCYBgDolicyyLrADjDO9d?=
 =?us-ascii?Q?IdxjrsMlA7zbbLGFitgO953Cx7z+h7yuNHp8DqDH5CwK+cIY3il1jn5/4cxR?=
 =?us-ascii?Q?3ScD9mH/+kHG1972Bq13hT4aVcMOXq4EzMcNklEPy3gXV+etRCJiERrGfCZ8?=
 =?us-ascii?Q?VmxP4bChWnu9bFMRAXP+WbMEXWJMdvOXPpEQBoVvH83zXfdnAMI9VL7xUAkj?=
 =?us-ascii?Q?8XQBTEyteRFMS/8vOoaxjgp8dYSYuBP0w7emZ1gbRPeEJe5lMBA+AmAPn9um?=
 =?us-ascii?Q?lA/N0WAu+PJEZyE+vlmRbjqFOUv0erjhZBwTOyUXxnw4NGVeMX6TQ1szs+1E?=
 =?us-ascii?Q?wujChiFEUTq4/58tzufDlAO6L8sDPTilJ+QNN8fT3IGVSSCWJ2A11mp/S00u?=
 =?us-ascii?Q?rJ7s6hePgpz96tSsdTfoKCpbmxNyzEb55Fthc336Oro6/WTynLSLbIWDDi5l?=
 =?us-ascii?Q?j51LTYB+BrNZEruaBGcEso7tsGjqYQ9daUqaRVeh58IpOfUiEn54geOjTxN7?=
 =?us-ascii?Q?KSDB3pl5NHpoA5Wm0m2ELzSRYB67fxWsWIKO69ag5veFrMh+7aZ8G3/80sbD?=
 =?us-ascii?Q?PJHEffhHEo8GkpxicwjWFHc/nBPpVHTBFU8D7mUrOQ8xEZHQZW79FWtAXoSt?=
 =?us-ascii?Q?+XOV1jbax/wP/gbNJfGwlbft//VCBGF/eia84Gw0pn2/wwQEwvU9wNptqqzm?=
 =?us-ascii?Q?Z4hfFD3NnhBXdlKrblR1S0Q0r4AX0lOV4fN/uk2i/Ia6LgFEMnb8YWAwEHEY?=
 =?us-ascii?Q?TYQ2JAlgtad7eNXWb55pTEjwL2ih6AmLqZFYA+gA1fzb1uuCgOp/e2Tn4By+?=
 =?us-ascii?Q?0dXXZMj/3BRjNrgVncJy/xdh/T2WpPVhXjUFB2CgF8bB9zwWdPdhIzkVhRtV?=
 =?us-ascii?Q?uBF/03U4ToE/GEkVE9beuGqPKt8fNITqF9JPsQBFhNaJEq/eUbg7yXbG3+LB?=
 =?us-ascii?Q?aVoYE3f8P7QjZp8NyKemZcPpH2ImdExco9S/h5je7BmFUbJtQMm1A1bjn/xN?=
 =?us-ascii?Q?EctWsM4lDcR8bv3viCp6OjgHmQ8wC6MAYIbHG3CtW71kdSX8FmuJvVp8jDtF?=
 =?us-ascii?Q?bj04rIiyVfD48Bs3j/cVodelF+AJkLDumjo53Gsv8qcsBYE1GI9AbHfDaSau?=
 =?us-ascii?Q?WcB+dnWddKq2K7698YYmy+g9S8D6pF+JF7hurBS1tyczLNvAY9NcEPXktMwL?=
 =?us-ascii?Q?Ue6qW5V7SG1Lf9LkuVRDuLk+DKBfHUCedL2oYkQwUJgXRxPEM7lVl5U0iJ6q?=
 =?us-ascii?Q?x7z1ynCJpCB0MPzsdvkXrXUGRFdBkDExaPJ37/fomzMbMYkmNDcMq0aYKkkx?=
 =?us-ascii?Q?94WBSiObwv2J0UvgpzFT4LtkF4+U0B3+STNa0s4VgtWohKt7WtxusEehq972?=
 =?us-ascii?Q?R6nwOZ1IwLrFttzFyMZ43ZH0EIa//sN2vKYKSUM9P77HLyQtpg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.12;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SATLEXMB04.amd.com;PTR:atlvpn-bp.amd.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 13:32:28.4229
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7269e849-5591-48d8-1269-08dd0a30f19e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.12];Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A100.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6661

From: Sam Bobrowicz <sam@elite-embedded.com>

Light frequency was not properly returned when in auto
mode and the detected frequency was 60Hz.

Signed-off-by: Sam Bobrowicz <sam@elite-embedded.com>
Signed-off-by: Michal Simek <michal.simek@amd.com>
---

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


