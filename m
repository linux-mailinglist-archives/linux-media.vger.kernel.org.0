Return-Path: <linux-media+bounces-52459-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ODQCI48qimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52459-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:42:23 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EEB11113B55
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:42:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 704AE3040752
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58B7E3A1A3C;
	Mon,  9 Feb 2026 18:36:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="wg2bhzbt"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9798A3A0B15;
	Mon,  9 Feb 2026 18:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662208; cv=fail; b=fhbp5AjB7B7XzzzJAvmHChR7tLjBDa/GNpM8NHyJwiscJ5dj1zqAkLOPEnSVhsWIlloZvQnx9azHk9MF+vZ2hdYXS/h9SqU4AbQOHdBNh9myHc/kMy1zSvnoNR5YE1QRYkTLMP6UAaqOHtktzXsmPWWNtQSbmNXyviLrW6fgOAk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662208; c=relaxed/simple;
	bh=PetQhmw2wwuwAw62MCZZo9sL03PCcYpdPe0rsiVmDpA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=e2guCBqyhLIJeIW6RQCJ1A62IkJzfniT5Ng7zjn7CVRn+3dd6TauIJMCBB+fUBG4NtAjloaxrVGilL9rP3dNbeUa8fm+OJMWtAEWrK+P7hsIpKAiNZTgfivfv48nhr3TmrnM6hPiJaboxngIi+G1dzaY/ZRHcZLEZJAFY4+uwI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=wg2bhzbt; arc=fail smtp.client-ip=40.93.198.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cnDAJA0VazrjGXnh/O8hZISBHIg9/gHHFxSjv6C3NvGTGl6K1hY6kZGD/J4vIK2knv9s1Dt5moNICqkapPYTGRF55Pg/TdVOkO16VWTGjYtBgFTBHXhDB2rB9mqMJDG3cv7rTV2w0+k7WAPLQ5X0caUyb43xxLszZTSyeLNq4dFhz8jP/74QmSAGXG8cGlw4INzE2kbu+AGcw8/TD4LwJuZQMUMH1dFrdJCGXLtTIoqep7aqHEJl0C5o9k8G4ofV8SovY3LxoQ41QPDTl4KfmTcXMvPEj+B3BBVXMfQ4ROiUYVm2tEGMPLbs6Z2xJOjS0gFhFPJFrqlEyEUJP1oZBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCutZNcStsZzFmvnlSnWPwCi5+YsQyMTlxB0m5yf3rY=;
 b=vxMfoKAl8Z+DPElV+SbAeuwBNSvpsLvf4Ck+AwBUAYXYKM6kaHbHfg8Xl3F0pyJ0mMUJM5A9jrDd5Uz66iNxKzOEycbmyc4j+TkUEirwGjdLOim6MCUsLcvvh4emyEwBqc5rCYfZP9yBE8ZJSLVuj3L7zl4tPEOYnAyCFnrnNYwUJoBPWVZwXkK8zjDrposfk5KpawI2p4wHheqxADXRy29napSodBJfKyEPslIvVGjSsJKEX+9O6UespvCggPc2HA/tVF9KOUvNlfBk4FzzWxVZz5WxtikKACKmzMmxc8XLtcqwHau1eS/zHO7YunfsjUZL1wHuP6XdDxWJSZRxqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCutZNcStsZzFmvnlSnWPwCi5+YsQyMTlxB0m5yf3rY=;
 b=wg2bhzbtQykZ8yMoMQtbF9g9NGILfH7PgqoxtWcIj8itPayUwyhYZPZBtrErk1c7tzOSjLOQCHdpOP7QfvhwQEODXOFwIO36tlYQnwvEB4qUbBHHoIRqRsf+ZCmp3XaLnQOlK8giyy/voC6ALq5HIUlgbwC58QDggf1uhFDMQY4=
Received: from SJ0PR03CA0300.namprd03.prod.outlook.com (2603:10b6:a03:39e::35)
 by DM6PR10MB4268.namprd10.prod.outlook.com (2603:10b6:5:220::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Mon, 9 Feb
 2026 18:36:45 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::5c) by SJ0PR03CA0300.outlook.office365.com
 (2603:10b6:a03:39e::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:36:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:36:45 +0000
Received: from DLEE215.ent.ti.com (157.170.170.118) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:35 -0600
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:34 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:34 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvtA2052904;
	Mon, 9 Feb 2026 12:36:28 -0600
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
Subject: [PATCH v11 14/17] media: ti: j721e-csi2rx: Change the drain architecture for multistream
Date: Tue, 10 Feb 2026 00:04:53 +0530
Message-ID: <20260209183456.1906327-15-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|DM6PR10MB4268:EE_
X-MS-Office365-Filtering-Correlation-Id: 1cbb82a1-15ba-480c-58bc-08de680a2d6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|1800799024|376014|82310400026|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?g1eyAdBQhF5Aa9FwbZmSUAvzdj2nhzqiqgnt8DXWcnd4tYCuSbBhzAD38lai?=
 =?us-ascii?Q?tszlSbn7CjafL3ET/H3+DqKglzXiIrX9Wr9ZaPlZZATNigg4C3sMekojM8Zc?=
 =?us-ascii?Q?SN+OM1/N8FsSNUdnrZE4u3voAcLnQcNreRFZ4obBlzPyeyH3JYdMibR6MSla?=
 =?us-ascii?Q?jvMNkcwXFFGemovt6FanRxuEqY6tO6LfEsHSrnPF74y6rFiFbTNve252lpGt?=
 =?us-ascii?Q?ssM+IUFa9Di+R5mARNWWHpu9cgOeQZeQai0FgeOMAvb84OnluYbWzG+wONeM?=
 =?us-ascii?Q?1QjCcHC4PRtDkrrZRIgOH7BoDdJnX0XvN5TROLpi61GKkZvlK2u15cBsbSeC?=
 =?us-ascii?Q?UhCTN1jIPpGhp7vmeWuHM7SsfEUYVWWnboHr3Mhh/YaVl8pRWAIDEgSJ5nY0?=
 =?us-ascii?Q?J1LHOcqEdyV8tKnplSD1mkUn/REvCxWgAizClKolBUpFucoZTeS2pDbz3w4c?=
 =?us-ascii?Q?iCEAWfgfDutJP9Si0mpwR2b6XtPdkw40gsAtzYQ75nSp82rojOFl0wviavVJ?=
 =?us-ascii?Q?4aTtw3j+9LFv3YYBd2dpnLbWq9SeSzclWcSbDOZh0iGwcg4Cwq00vz/vxACh?=
 =?us-ascii?Q?ceiH4z11iRzSeYfRZjp6TIbRrs0tHly3sUme0LGxc+Cfn4VOp7JRbmEHDQbb?=
 =?us-ascii?Q?UG4efXNsEQqGbSjkU/7k/FT3KVw6ErqluuiwvhUpc2+seM3MIgE/Ay+DjVx/?=
 =?us-ascii?Q?/8nuaYXnT98Tihd2jNnCWzmC5zc+Bt41gXbnaD74KqmfD2GIUZuQRj0SR+gL?=
 =?us-ascii?Q?fyupcn24tM9NGUsCG8nNW3Ceuh3uM+VgCWwxXMjM9JGJDmN88QNZWJiaoVDQ?=
 =?us-ascii?Q?LcCczwveWnwlB1+qaynC4uy3SB+VwhjFfWJ+UExSplHVBBPl6JyRR0C1E5lW?=
 =?us-ascii?Q?oD0j+3/w3A7PhFjZuyOd8nNOsUTUNINzR6oMBY2Ec1ny3HzYcdUDMCaTIR0z?=
 =?us-ascii?Q?n2ZpBFgHB2pKm7pz2OTg7hcaonFx1g+5/hhJlyALTKQYR72LzSK93ZDYF/sX?=
 =?us-ascii?Q?7ZDrdmRez3PxfPEOSnhvwadfGAUIKVS7jIetl/+WFUKkYBOoz2E8AL/e8MUY?=
 =?us-ascii?Q?hayl/Ikd55eUcBqCi/OCnbXT9xCh2Rlc58MV8+64RbCJ93z5k+h2i1okPmjx?=
 =?us-ascii?Q?VjJ7hYwq9ZMBOel77N5oLIGl6A2WAVgsoIYupD4M0aJzXqyFNHQlzKiw1th4?=
 =?us-ascii?Q?rK+p68nXJFtJ/Gt9dxiWBc64huk3Y4dOQYwcEt6n3mQ9mENipnRl9oLuvZWB?=
 =?us-ascii?Q?JysBbpQM6O2s3Xtn2FSVyQuPht3Hdeibi1rW+zXmGVl/xeDH3kX8PNgdu3od?=
 =?us-ascii?Q?UUCi3zcQPFtE1dekWFdOFHTjIyQcus2bFj9bCxox1za/ue7MhtrN20zXg6lq?=
 =?us-ascii?Q?ZIYLuva+mn3wAnnqxgRs2trhGjD48wUK98fIvbPUErPd67rEetFVaq06Eht2?=
 =?us-ascii?Q?undLwBITsMrtWzKhjfBLqHNtYmYk9xA0p9LrD3lLBz5W61HbOQ8TN08z8g6T?=
 =?us-ascii?Q?EoVIjN3LfNzF2fczaR3sycYAu1D9Jq6pVbgaudHAOLz4RV9yfIWbjNRAb7fL?=
 =?us-ascii?Q?PL3fpvJuE4JzvmiHAqlPlOX3XDFwE8KPbbNYy/cqFDBdBvLvZwIjTnN+kb6J?=
 =?us-ascii?Q?bTrA1SBCDoewdVj2HGpC74TEY0/TP92yHzZX/jwTCmD3PcwdxKZKt9rBQ6nJ?=
 =?us-ascii?Q?v8zDQw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	EwONpatqIEXfVpnW1nWoHKdBLNOELzD4i1LMoob3MPMCMu0JgedSndrE0UN4yFvbXkqJGfP5ctyNgeJlB5rYTcKZxI+uPkNtyNlot82OwX758Ce6zcGxwPVeAoak4No2tQjBcxVQEbr6/F7M6tzPPW/e5axtsgdooWYGYZ7gRO2N3/9FvghjpAbUoBGvDDIEBWR+thjj3nT3LlJ6CJ18tgIRjc2FiqbXtKUMioXXcRLu/V425OxXHypj/xZpG0Kn7/0QkjlN93aRR2MySXmOiDhZc0/rGRSeT8fzdk9MFsUsNI/04WiysEynXjRJiO1hoPFrD//I25xbS7cftKPMS+gP/tZ3cJ7uKOPef7YAiKD2glFEiYakd1c8LFDkhrUviOSzXjEJfjcv8/HXZ0rnhEDJpnMIU95CzikEJ51k3fiX+6BifoWOraIBGYv7HPir
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:45.2758
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cbb82a1-15ba-480c-58bc-08de680a2d6b
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4268
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52459-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,ideasonboard.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: EEB11113B55
X-Rspamd-Action: no action

On buffer starvation the DMA is marked IDLE, and the stale data in the
internal FIFOs gets drained only on the next VIDIOC_QBUF call from the
userspace. This approach works fine for a single stream case.

But in multistream scenarios, buffer starvation for one stream can
block the shared HW FIFO of the CSI2RX IP. This can stall the pipeline
for all other streams, even if buffers are available for  them.

This patch introduces a new architecture, that continuously drains data
from the shared HW FIFO into a small (32KiB) buffer if no buffers are made
available to the driver from the userspace. This ensures independence
between different streams, where a slower downstream element for one
camera does not block streaming for other cameras.

Additionally, after we drain for a stream, the next frame will be a
partial frame, as a portion of its data will have already been drained
before a valid buffer is queued by user space to the driver.
Return the partial frame to user space with VB2_BUF_STATE_ERROR.

Use wait for completion barrier to make sure the shared hardware FIFO
is cleared of the data at the end of stream after the source has stopped
sending data.

Reviewed-by: Jai Luthra <jai.luthra@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 123 +++++++++---------
 1 file changed, 60 insertions(+), 63 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index f06e1175dcd98..f81175a64a35a 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -82,8 +82,8 @@ struct ti_csi2rx_buffer {
 
 enum ti_csi2rx_dma_state {
 	TI_CSI2RX_DMA_STOPPED,	/* Streaming not started yet. */
-	TI_CSI2RX_DMA_IDLE,	/* Streaming but no pending DMA operation. */
 	TI_CSI2RX_DMA_ACTIVE,	/* Streaming and pending DMA operation. */
+	TI_CSI2RX_DMA_DRAINING, /* Dumping all the data in drain buffer */
 };
 
 struct ti_csi2rx_dma {
@@ -109,6 +109,7 @@ struct ti_csi2rx_ctx {
 	struct v4l2_format		v_fmt;
 	struct ti_csi2rx_dma		dma;
 	struct media_pad		pad;
+	struct completion		drain_complete;
 	u32				sequence;
 	u32				idx;
 	u32				vc;
@@ -249,6 +250,10 @@ static const struct ti_csi2rx_fmt ti_csi2rx_formats[] = {
 static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 			       struct ti_csi2rx_buffer *buf);
 
+/* Forward declarations needed by ti_csi2rx_drain_callback. */
+static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx);
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx);
+
 static const struct ti_csi2rx_fmt *find_format_by_fourcc(u32 pixelformat)
 {
 	unsigned int i;
@@ -608,9 +613,32 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 
 static void ti_csi2rx_drain_callback(void *param)
 {
-	struct completion *drain_complete = param;
+	struct ti_csi2rx_ctx *ctx = param;
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dma->lock, flags);
+
+	if (dma->state == TI_CSI2RX_DMA_STOPPED) {
+		complete(&ctx->drain_complete);
+		spin_unlock_irqrestore(&dma->lock, flags);
+		return;
+	}
 
-	complete(drain_complete);
+	/*
+	 * If dma->queue is empty, it indicates that no buffer has been
+	 * provided by user space. In this case, initiate a transactions
+	 * to drain the DMA. Since one drain of size DRAIN_BUFFER_SIZE
+	 * will be done here, the subsequent frame will be a
+	 * partial frame, with a size of frame_size - DRAIN_BUFFER_SIZE
+	 */
+	if (list_empty(&dma->queue)) {
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev, "DMA drain failed\n");
+	} else {
+		ti_csi2rx_dma_submit_pending(ctx);
+	}
+	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
 /*
@@ -628,12 +656,9 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct dma_async_tx_descriptor *desc;
-	struct completion drain_complete;
 	dma_cookie_t cookie;
 	int ret;
 
-	init_completion(&drain_complete);
-
 	desc = dmaengine_prep_slave_single(ctx->dma.chan, csi->drain.paddr,
 					   csi->drain.len, DMA_DEV_TO_MEM,
 					   DMA_PREP_INTERRUPT | DMA_CTRL_ACK);
@@ -643,7 +668,7 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	}
 
 	desc->callback = ti_csi2rx_drain_callback;
-	desc->callback_param = &drain_complete;
+	desc->callback_param = ctx;
 
 	cookie = dmaengine_submit(desc);
 	ret = dma_submit_error(cookie);
@@ -652,13 +677,6 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 
 	dma_async_issue_pending(ctx->dma.chan);
 
-	if (!wait_for_completion_timeout(&drain_complete,
-					 msecs_to_jiffies(DRAIN_TIMEOUT_MS))) {
-		dmaengine_terminate_sync(ctx->dma.chan);
-		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
-		ret = -ETIMEDOUT;
-		goto out;
-	}
 out:
 	return ret;
 }
@@ -702,14 +720,24 @@ static void ti_csi2rx_dma_callback(void *param)
 	spin_lock_irqsave(&dma->lock, flags);
 
 	WARN_ON(!list_is_first(&buf->list, &dma->submitted));
-	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+
+	if (dma->state == TI_CSI2RX_DMA_DRAINING) {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+		dma->state = TI_CSI2RX_DMA_ACTIVE;
+	} else {
+		vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
+	}
+
 	list_del(&buf->list);
 
 	ti_csi2rx_dma_submit_pending(ctx);
 
-	if (list_empty(&dma->submitted))
-		dma->state = TI_CSI2RX_DMA_IDLE;
-
+	if (list_empty(&dma->submitted)) {
+		dma->state = TI_CSI2RX_DMA_DRAINING;
+		if (ti_csi2rx_drain_dma(ctx))
+			dev_warn(ctx->csi->dev,
+				 "DMA drain failed on one of the transactions\n");
+	}
 	spin_unlock_irqrestore(&dma->lock, flags);
 }
 
@@ -745,6 +773,7 @@ static int ti_csi2rx_start_dma(struct ti_csi2rx_ctx *ctx,
 static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 {
 	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_dev *csi = ctx->csi;
 	enum ti_csi2rx_dma_state state;
 	unsigned long flags;
 	int ret;
@@ -754,6 +783,8 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 	dma->state = TI_CSI2RX_DMA_STOPPED;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
+	init_completion(&ctx->drain_complete);
+
 	if (state != TI_CSI2RX_DMA_STOPPED) {
 		/*
 		 * Normal DMA termination does not clean up pending data on
@@ -762,11 +793,20 @@ static void ti_csi2rx_stop_dma(struct ti_csi2rx_ctx *ctx)
 		 * enforced before terminating DMA.
 		 */
 		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
+		if (ret)
 			dev_warn(ctx->csi->dev,
 				 "Failed to drain DMA. Next frame might be bogus\n");
 	}
 
+	/* We wait for the drain to complete so that the stream stops
+	 * cleanly, making sure the shared hardware FIFO is cleared of
+	 * data from the current stream. No more data will be coming from
+	 * the source after this.
+	 */
+	if (!wait_for_completion_timeout(&ctx->drain_complete,
+					 msecs_to_jiffies(DRAIN_TIMEOUT_MS)))
+		dev_dbg(csi->dev, "DMA transfer timed out for drain buffer\n");
+
 	ret = dmaengine_terminate_sync(ctx->dma.chan);
 	if (ret)
 		dev_err(ctx->csi->dev, "Failed to stop DMA: %d\n", ret);
@@ -829,57 +869,14 @@ static void ti_csi2rx_buffer_queue(struct vb2_buffer *vb)
 	struct ti_csi2rx_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
 	struct ti_csi2rx_buffer *buf;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
-	bool restart_dma = false;
 	unsigned long flags = 0;
-	int ret;
 
 	buf = container_of(vb, struct ti_csi2rx_buffer, vb.vb2_buf);
 	buf->ctx = ctx;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	/*
-	 * Usually the DMA callback takes care of queueing the pending buffers.
-	 * But if DMA has stalled due to lack of buffers, restart it now.
-	 */
-	if (dma->state == TI_CSI2RX_DMA_IDLE) {
-		/*
-		 * Do not restart DMA with the lock held because
-		 * ti_csi2rx_drain_dma() might block for completion.
-		 * There won't be a race on queueing DMA anyway since the
-		 * callback is not being fired.
-		 */
-		restart_dma = true;
-		dma->state = TI_CSI2RX_DMA_ACTIVE;
-	} else {
-		list_add_tail(&buf->list, &dma->queue);
-	}
+	list_add_tail(&buf->list, &dma->queue);
 	spin_unlock_irqrestore(&dma->lock, flags);
-
-	if (restart_dma) {
-		/*
-		 * Once frames start dropping, some data gets stuck in the DMA
-		 * pipeline somewhere. So the first DMA transfer after frame
-		 * drops gives a partial frame. This is obviously not useful to
-		 * the application and will only confuse it. Issue a DMA
-		 * transaction to drain that up.
-		 */
-		ret = ti_csi2rx_drain_dma(ctx);
-		if (ret && ret != -ETIMEDOUT)
-			dev_warn(ctx->csi->dev,
-				 "Failed to drain DMA. Next frame might be bogus\n");
-
-		spin_lock_irqsave(&dma->lock, flags);
-		ret = ti_csi2rx_start_dma(ctx, buf);
-		if (ret) {
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-			dma->state = TI_CSI2RX_DMA_IDLE;
-			spin_unlock_irqrestore(&dma->lock, flags);
-			dev_err(ctx->csi->dev, "Failed to start DMA: %d\n", ret);
-		} else {
-			list_add_tail(&buf->list, &dma->submitted);
-			spin_unlock_irqrestore(&dma->lock, flags);
-		}
-	}
 }
 
 static int ti_csi2rx_get_stream(struct ti_csi2rx_ctx *ctx)
-- 
2.34.1


