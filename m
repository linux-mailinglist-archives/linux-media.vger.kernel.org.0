Return-Path: <linux-media+bounces-52447-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iQmKMx4pimmsHwAAu9opvQ
	(envelope-from <linux-media+bounces-52447-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:36:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F771113951
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:36:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 060653032CCC
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A432F38A9AA;
	Mon,  9 Feb 2026 18:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZjagYHRh"
X-Original-To: linux-media@vger.kernel.org
Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E64E92E9730;
	Mon,  9 Feb 2026 18:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662123; cv=fail; b=K5j8zS7EEd7aCcQW9lECE0jZfYEatVoqm3V3ZSCRR1gk0pzem/+H6Y6lyKLRaUbMpa/EG4u/q3X6XaQoHeLU3NQY/3sRifrc1G9PxDlNUpzF8D0ttNCjHsDDV/rga2uc6ePE0gZ7O2qBUGd0wREmMVi+UXy3/Bei08/tB6RiMJQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662123; c=relaxed/simple;
	bh=s1Z6i8nmkzcw+5uOaYPg9pWYsuDmjnhT7v4WJaHkyLk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bfaI4qEnNSYf8ZWgWk9uZntagi8ag7uZ6jCvtu76b3jKvoS9elQ2D6/ZF5kAjGFGtMuIkMoCELCBnoFL4mCuR+etTb1wAYu8g3UD1LwMmWM/9dc++LpkzsQwTOIyQGCLe/iEvdD1dTaeZ4DtC3+lk4FiTUJzlm6gb8JgfceQ7zM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZjagYHRh; arc=fail smtp.client-ip=40.107.209.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uoroI6DOyyeY+BpGYb1AK/JeNQ4nmJqK1moLnbd/+rBJ+W44sbCT+qRx/YMEcR5s/m7TFPACXOb2hLXm0jkbvkRQRp8Axief5dqWBtMBe5AeK47w2FAm+6QZI7TBhCvHEyL/2UotlzUfE7tTsIPcn5ku/E+oJYjOY5NyTOfetA9W/AYf0oCqnFnRB4Nb8OahPgxwujyT7/DVLDuHe6dBLXv6GOvYvRfMWEtF39Gx/zA7JCZgkh7DS2Fj+cEtJsJu/PADws4ssO0w+hN32n2f6JrViicIdJG9HRPcofGPEO0J1jD/Qc1i9YEGszSb3Zsu8aKesiQcpESqEw3ny2wM2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=BD/cZALGSNhRsMVQFl6wHhv65x1Dc7+X1Bm5YjdrVZ/qV8Aey21JN8PI4F6rfRueYpy9oAYJ6klCFNuPi37JAxY6Ik2e2BEDd8i2ryh57rM1B3GJpNQDkNlu7T6sYu+uIUQZyPoWSPsOzmoOQ6yVsJuJ2dhf7hVfaQBhA1okGtyqXmNbYpdkw4fKVLIb6NxlbwA0zRwncMDHlWmuaD+tChPnSc/iDvBShphE2+iTEHtFvH+R8XfQRMTUzMJUxEqV4Jse51heGQXnTUvbQ0+vdXLfsds94BtVKbeLuRFo2ispmZHDIWcTQp6V456rVcYcQ8htNlMr6UjknUfU0dngOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RKOGeTrdANEFIeSncdxz10Hh/ukJDG922e6712afheg=;
 b=ZjagYHRhnV1ehf/nRjv+FSJh4T9q9C2AKLxIS0tX/ANKf7Fpv0D8laYNS/D9PxFNCGfWB/kFGvDxyV/18rCDcrvpzWKPo/PVB24NCna6Oq3xW1YL2C2nMyqaFSjzscRSJPgvnFa42O3oPStx7dnu5CAdCeUnA5Qo7ASePuT6Nlo=
Received: from SJ0PR03CA0224.namprd03.prod.outlook.com (2603:10b6:a03:39f::19)
 by CH2PR10MB4184.namprd10.prod.outlook.com (2603:10b6:610:7f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:35:20 +0000
Received: from MWH0EPF000971E3.namprd02.prod.outlook.com
 (2603:10b6:a03:39f:cafe::d0) by SJ0PR03CA0224.outlook.office365.com
 (2603:10b6:a03:39f::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:35:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 MWH0EPF000971E3.mail.protection.outlook.com (10.167.243.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:35:18 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:17 -0600
Received: from DFLE215.ent.ti.com (10.64.6.73) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:16 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE215.ent.ti.com
 (10.64.6.73) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:35:16 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvsw2052904;
	Mon, 9 Feb 2026 12:35:10 -0600
From: Rishikesh Donadkar <r-donadkar@ti.com>
To: <jai.luthra@linux.dev>, <laurent.pinchart@ideasonboard.com>,
	<mripard@kernel.org>
CC: <r-donadkar@ti.com>, <y-abhilashchandra@ti.com>, <devarsht@ti.com>,
	<s-jain1@ti.com>, <vigneshr@ti.com>, <mchehab@kernel.org>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <p.zabel@pengutronix.de>, <conor+dt@kernel.org>,
	<sakari.ailus@linux.intel.com>, <hverkuil-cisco@xs4all.nl>,
	<tomi.valkeinen@ideasonboard.com>, <jai.luthra@ideasonboard.com>,
	<changhuang.liang@starfivetech.com>, <jack.zhu@starfivetech.com>,
	<sjoerd@collabora.com>, <dan.carpenter@linaro.org>,
	<hverkuil+cisco@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v11 02/17] dt-bindings: media: ti,j721e-csi2rx-shim: Support 32 dma chans
Date: Tue, 10 Feb 2026 00:04:41 +0530
Message-ID: <20260209183456.1906327-3-r-donadkar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260209183456.1906327-1-r-donadkar@ti.com>
References: <20260209183456.1906327-1-r-donadkar@ti.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E3:EE_|CH2PR10MB4184:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cdc53d5-8997-4829-97fb-08de6809f9c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QDcYEuM3HpYsz2T4FtcF2nF1PiZPBgQ8grntPox/Yr+ZkUEA9PoFaKnjj6kh?=
 =?us-ascii?Q?MErSiClBaxU5m5wZFyTRDa236t+7iOQmzrQ5/EToO7Gyz6K+c8qhC5O/q5zQ?=
 =?us-ascii?Q?hLJKU3xzqedkl/RFogxL2KTkBb45rtCiA08AnoZQ++CUJEeOcAq7iTeA3KSq?=
 =?us-ascii?Q?tFns+bxH6uoDpiB8Q6HiVXiqDV0qhA+MmQoDD49BrJA97ijR/HlsYUKDJq/r?=
 =?us-ascii?Q?0G6B0gPb5mtVx19GcyRR3OxLBeCGwJdAp0mIoP8WW46MkXv3MeCM0mgN8onJ?=
 =?us-ascii?Q?xItPcbpHjxJKP6djkYTEUjTufc03RG4Ltjcr23fBP7KpV+8kWB4Pn3YXZr6o?=
 =?us-ascii?Q?aUoq0k8F1zYMw2Y8jqBNGWDVP7nnCMic/s805xON2tlU0p9nCwBrYYTMk17z?=
 =?us-ascii?Q?U8vAvj7oG6+yCgvY8ZAaysvyFaRjwY+ay60wAX+iNT6mYKT387x2R1b5XIaz?=
 =?us-ascii?Q?C9W2a5JCvc5OOxXx28ohJsFlRhjCBahAmGo6LuM7JUGStBofue8reIh0AH6+?=
 =?us-ascii?Q?+L2TcwXx1B70w7fmQ0POREVJzMbgIM4fP/kTD7fB8lXPClHAgGgk2slc/pZ+?=
 =?us-ascii?Q?VF4bdLKnLapvQkzxu5pnoOYv0DTrfr0jjpsWumlPo0dnDIqQzoqlzO9z4Iq5?=
 =?us-ascii?Q?u/LqXwlq+s3X1KmMzNeNQ/FY6NR8Mj2QhQQu9gCnswBYR58jvSX8lE4DgVLM?=
 =?us-ascii?Q?G+Axef9ZnoWeLbU/NovO1IqTSeZ3Ut9D30mguHI7wZEiJwiKuoSawjtHS73Q?=
 =?us-ascii?Q?YFi+fe6eoDFXS03SW4+uNIPJo56YyjZ2quxdcOtOajfdDUtlNqxpzRfDfMPT?=
 =?us-ascii?Q?icUx2vH6hjBs+huKTr1Jd0lzdaw0QPFGY+9lZ6AlGuQsW7T9H5PPpzNbRojC?=
 =?us-ascii?Q?nz78t9ZVXOEelB+eHmNB4C1vq4RNAs9F/Es4lb3MLEAR6WAQx2Ex6egDs/X0?=
 =?us-ascii?Q?bG4x54a2j4aD1NUhERbCkWFjobDGlsuxYYejBpO7Qf9Ep7hs9AV2NnyBKNZY?=
 =?us-ascii?Q?ojaPEuILbCVkE4QnlNbFHzJtzvqLI5g/QOg27LqQBvifNGl2I2Yf6CaDofb1?=
 =?us-ascii?Q?QtIczWGtQ8k2mEg6O0Qu9682f1S0MGTrXXPhxJ+ucyKx2X3FKZpJNusP+BSa?=
 =?us-ascii?Q?oiq41bpCNGdoIFkC/syGFKjk500CUTb8774Pi1d6zSK+LbJ5Gqmb+GwJqV9L?=
 =?us-ascii?Q?Lv8tGgPnM6w7n4+z0eFR7W2RdsbEPclc0cbmDNKBV4Bfy5bywSb/0LrHtPwG?=
 =?us-ascii?Q?pFSONxPpHw2iaGLOOwjBBzg3ZAMtPwORc3bAUQR+w3sSmU3ivG59QgsuUvyK?=
 =?us-ascii?Q?QU1pQrwRIiS1PvqcGbzdqmn3rsLTLnludAi7H+1aLIPgpjeixERJvW95CNRk?=
 =?us-ascii?Q?3NZLT4D16rWnzZk6///aWAHLZEgwWprH79cAJ/EA4jUuMJzE0VmGirDzSNyH?=
 =?us-ascii?Q?fA4ltEvngLCY26DC9RjhmsC6152J+3gddpdZFdLcqj7tf6yntWRIKc6RaSbu?=
 =?us-ascii?Q?j728CxaqxO73IONYaE+CPjE0BpwbxvAMkJF2TDiz5lS12a5aKpWcT0R325jP?=
 =?us-ascii?Q?g3gxyYAx+VHL0gYDjhsyDiV4FgtQVKU2/6z2pCNPbVR0cUgBxUaTEmimzB5w?=
 =?us-ascii?Q?CydbKma82OpmFoTlbGuTDcjrCICPttFfgB0HHgsHgSKUPreUyVhVOD7S/VBg?=
 =?us-ascii?Q?va46Ug=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	RSX8cpu3nR7wNYruJci0UqZ5s/Q1ebzLG2G9Frq3jWSkHu/QBfWthvKKhydvCBCRlf6/bFU8Hkk6dmBCYxJ34no5atatB4F6gloOUBDzx4LA/chrWkPyUuptSMf5rIlxDzZg7bvlZvIPNaBTUPRJ/r8mf1dz6Wgk50+SryTpk2cwu4kMz/vTmX23zC6OglA7npuKA3yvw1WfA4twUEOwvTF9xK3hN9nuIsrBLRYCmF1CMEzbUHsvh2PX5WMS0RShb8K76UIdoEZ4xiYy3HBMyPg7q84FOYmDCsltcu1VRmZI+UMUaFSoOX5PWv+NeAh5rbepxA4XUFmAkGh6rMMQQwVn74pRHStuZsvfa15feEIk+i8bWbqyqYOSUV4g9LjnyJOcxNH7Kg5jZbCs9boq4uZLxBB08ZOnHR1B8xNjNt0fKdpnnGaNIZpsrHuFVcC1
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:18.6332
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cdc53d5-8997-4829-97fb-08de6809f9c5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4184
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52447-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[ti.com,kernel.org,pengutronix.de,linux.intel.com,xs4all.nl,ideasonboard.com,starfivetech.com,collabora.com,linaro.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[r-donadkar@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:url,ti.com:email,ideasonboard.com:email,0.68.170.32:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 2F771113951
X-Rspamd-Action: no action

From: Jai Luthra <j-luthra@ti.com>

The CSI2RX SHIM IP can support 32x DMA channels. These can be used to
split incoming "streams" of data on the CSI-RX port, distinguished by
MIPI Virtual Channel (or Data Type), into different locations in memory.

Actual number of DMA channels allocated to CSI-RX is dependent on the
usecase, and can be modified using the K3 Resource Partitioning tool [1].
So set the minimum channels as 1 and maximum as 32.

Link: https://software-dl.ti.com/processor-sdk-linux/esd/AM62X/10_00_07_04/exports/docs/linux/How_to_Guides/Host/K3_Resource_Partitioning_Tool.html [1]
Link: https://www.ti.com/lit/pdf/spruiv7
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../bindings/media/ti,j721e-csi2rx-shim.yaml  | 39 +++++++++++++++++--
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
index b9f033f2f3ce4..bf62998b0445a 100644
--- a/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
+++ b/Documentation/devicetree/bindings/media/ti,j721e-csi2rx-shim.yaml
@@ -20,11 +20,44 @@ properties:
     const: ti,j721e-csi2rx-shim
 
   dmas:
-    maxItems: 1
+    minItems: 1
+    maxItems: 32
 
   dma-names:
+    minItems: 1
     items:
       - const: rx0
+      - const: rx1
+      - const: rx2
+      - const: rx3
+      - const: rx4
+      - const: rx5
+      - const: rx6
+      - const: rx7
+      - const: rx8
+      - const: rx9
+      - const: rx10
+      - const: rx11
+      - const: rx12
+      - const: rx13
+      - const: rx14
+      - const: rx15
+      - const: rx16
+      - const: rx17
+      - const: rx18
+      - const: rx19
+      - const: rx20
+      - const: rx21
+      - const: rx22
+      - const: rx23
+      - const: rx24
+      - const: rx25
+      - const: rx26
+      - const: rx27
+      - const: rx28
+      - const: rx29
+      - const: rx30
+      - const: rx31
 
   reg:
     maxItems: 1
@@ -62,8 +95,8 @@ examples:
 
     ti_csi2rx0: ticsi2rx@4500000 {
         compatible = "ti,j721e-csi2rx-shim";
-        dmas = <&main_udmap 0x4940>;
-        dma-names = "rx0";
+        dmas = <&main_udmap 0x4940>, <&main_udmap 0x4941>;
+        dma-names = "rx0", "rx1";
         reg = <0x4500000 0x1000>;
         power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
         #address-cells = <1>;
-- 
2.34.1


