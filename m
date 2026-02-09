Return-Path: <linux-media+bounces-52462-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wISRBvIpimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52462-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:39:46 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B12113A70
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id C3C123029C22
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 553D53A9605;
	Mon,  9 Feb 2026 18:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="UZmk+I+Z"
X-Original-To: linux-media@vger.kernel.org
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010023.outbound.protection.outlook.com [52.101.46.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD43A1A2F;
	Mon,  9 Feb 2026 18:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662219; cv=fail; b=cunXFyUYSjODE20DoM/PJCy8PKVkZbjft/6nq1Ptkk7kXQhP+J4vJp39/Fuvl91YGB3vtoggZAHL1vtrcnsCxG3jiqT4q8071f134doU1BLUrHnzrVK6Bt4V6WcIsCgkZZk6ebgo3H/4z/WNaR3Bb0EncY7IgDLr5xFY4Yeek9g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662219; c=relaxed/simple;
	bh=kDL7UGbZAmpLI//rIICn2p+kAyEI5KHnFg/Qn44UXJo=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=U7ExGxzoUI3/GTorAQkp0JVvIND7SOhP372qrfiyS2T3lTJ6IradNBi8cH4MGRvFj+Ylw6OM1/DrR5S0hEsVe8SfhrGC4sFmbk4cR2ri7tGT2sRDav1mX6O8YHDb+TennWh5YZQpNXsIoO2I1SCZArW5Ldet/9rbGvMXJQrgLfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=UZmk+I+Z; arc=fail smtp.client-ip=52.101.46.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lwmDIkOnIob/xWd4pnrhsDkOheyF3xuXkLvGrMdyi/2W09VIvB46WFPtyEXEGpUcUb1IVv5fEz93bQMHRHzf51Vq23r8GBii7+yvzgr62AI0dQ7XNK2PTX6z4h7I+iDmtWJZpbCswhstK8AjGP97X/InbTzmwwwCp46PfvUyGzfoZX6v0j8kf5tNItTOAomvqd1fj0LKsNrutHOrXStQCSuTAqTKKXq9qWMd2FfqFW1pL7ZG/anpda7uaUyfoPBRmwG+XHgdkC9JDIN/XU1qQNpyC8fv7GuifKOBLP0NBugzaBe1JHOcd3p7VQhoor26grlHeeN1AThrvP78v7o6qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CXAblMTO83b8pNNhjHKwEZBHTvWgeKSSOQEhUNBte/E=;
 b=BmDsWaJ2bpW9R/DzFfLRd/Rs0Ad5YBbw505GztJJfefoeS3At3+UTp8prjKDbJ66na5ZgkolX84fG504Vug6LxzIPxRRQSDwL7TAscEnmIoN2oxF0tL0unHdfuQn5tT3ONkQ3ANi1stmHk/djqtxTKL0+Z3EIHyD7E8/CvC8X+njD0+8wItrZSg1sw6TkneLXtdcsluAIh/pUpvzMTY9uUB5occubot7rj8+kOJ8EOWnfm+DfTkXu8/eyTvJkFxU6H9KgHDGT/THLng/fo0D9gcfyvm8axUcrUYUANkKJXroFM7C5MsxgFnPBRH3GXjGNO/BUfaEVNIuYqkQhT2wKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CXAblMTO83b8pNNhjHKwEZBHTvWgeKSSOQEhUNBte/E=;
 b=UZmk+I+ZskFuNHVGT0L9iSu3A0I/Vucd2T/EDjnxrvKamcBS8Dsg1w5XrgUwTRv41vMBeqz5/y9/beowwAnbuwJ3BCX9q6aA0FVDUX477rI2E8MVJJ7fos/C8iTe2BJvBgLj9QKoVmOBqWg3woCsRRVjCcTMuO1TseBpem9grOU=
Received: from BN9PR03CA0518.namprd03.prod.outlook.com (2603:10b6:408:131::13)
 by DS0PR10MB7066.namprd10.prod.outlook.com (2603:10b6:8:140::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:36:56 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:131:cafe::39) by BN9PR03CA0518.outlook.office365.com
 (2603:10b6:408:131::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:37:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Mon, 9 Feb 2026 18:36:55 +0000
Received: from DFLE204.ent.ti.com (10.64.6.62) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:54 -0600
Received: from DFLE204.ent.ti.com (10.64.6.62) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:54 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE204.ent.ti.com
 (10.64.6.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:54 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvtD2052904;
	Mon, 9 Feb 2026 12:36:48 -0600
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
Subject: [PATCH v11 17/17] media: ti: j721e-csi2rx: Support system suspend using pm_notifier
Date: Tue, 10 Feb 2026 00:04:56 +0530
Message-ID: <20260209183456.1906327-18-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|DS0PR10MB7066:EE_
X-MS-Office365-Filtering-Correlation-Id: eb2ff5b0-9e55-4344-e3dd-08de680a3335
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|7416014|376014|36860700013;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?vr/B+ozjgiTHnlyToph3AbX9u9OmAT2mhTYz73frthIhrpeJSJJuyUJeUFQL?=
 =?us-ascii?Q?//9SczW2aqYFhlXwh76I89/lWuFfGjjs0yimrh32K6MXZXfyCyp0UiXLwPC7?=
 =?us-ascii?Q?shCu7B7ViBdYkcMuUd8E9RdRu441wJPjhIZdLaAGDG8qq3mI9rrdj/ZoZCiL?=
 =?us-ascii?Q?1WNJS627xOBeTMhUIdo3q6fvvCtLaYIeMGlq0piYbKJCArD/dBcTFXtFCJPS?=
 =?us-ascii?Q?KjS2yG9W8nk38TTPgRyxRrVjF2aD+b30gUso7p4XdjBARj5mifiv6Li1kyqd?=
 =?us-ascii?Q?pKyryBiwEQo2yefL0iCqs0yvIsMay9AWiRcr3BKjFXgXjA1OeTU2siqZQERW?=
 =?us-ascii?Q?1rD1hyAMj0gXteMPxDH52/zOTzlHzxbny3LXaPrwq3dERkHmeGrv2VJF542+?=
 =?us-ascii?Q?y3ZTk6wUWE3T1lHwEIZ41d0gt0tj0F7Yptx4BE7YVLGr0kUhDqX1gSqS5L2E?=
 =?us-ascii?Q?RTKE+2+LV9K6ZRcjU6dVJeXnrbyhw9HkJyLBkl/i68mHhIOdYBBdhK3j0TvF?=
 =?us-ascii?Q?9GD3/7TSBZu/z1KWovYIU7NVoJRdvMLMLy+GrQNGASOh1gXm4Q+RLzruIf6c?=
 =?us-ascii?Q?ZXvSm2R0QV2sM+8Hw/IZRx+2x6dxF3yDWTQXbusWNbnI7hCO0+VGf/f6mQi8?=
 =?us-ascii?Q?9ae4HUfvtYdNUxEdYeTzrMMOIfHKHke28NjcUGvT5zNpeTRdkltnRvGypJ8W?=
 =?us-ascii?Q?+RH9wSQnWZPEhu4HrR2tnN6JDgM/ut7o3QZWn81prB0rPhNSWXz61e63VcBz?=
 =?us-ascii?Q?Uh2VVp48KJp+ToehTFIPxraK0JmiUlE/fOIE5fKAbshZuNQ/EdQZCD36rOLZ?=
 =?us-ascii?Q?q+vvRXBnDAXTX5bE+zwMVF1S2K5F7nVUtSm/vEC1+WbLe+YA9CxBG1Mk9JQf?=
 =?us-ascii?Q?bmhqfhPkMhiWRLSXQWXCN1xZmm+bGk//efli22vWRC98dJzPPGkFDrZGKECA?=
 =?us-ascii?Q?wF1WIY4jdfDJzBbL6Dyot4O8cSpcEfIYMkU7980iXeSmqtz8V1/aUQBUZYkE?=
 =?us-ascii?Q?wwiQUfhaJNvNtdrSk3XbXhLzWYqRmgdrxVqy8D5kzPuqew1MuC8PsnupAUFb?=
 =?us-ascii?Q?3IzDCe6oQEHWfL3YGF8PkylgSbJ6baQTm2sSwquwfEWL+u8FQZbprv4fPRZE?=
 =?us-ascii?Q?7NzVh2CEr6eKVQzNEIbUO4u1yxBHUGDSmjkBvwBGPNDiFCTnXBKuu0ktmir7?=
 =?us-ascii?Q?+b2nMH+AI7k19Hg06bK+C4FwFEFxizM3G8r5ff1xNkR4fiQSoSTR5EaPwKgm?=
 =?us-ascii?Q?XtGxIpy4fuNlgsor6CJLhlnxMPu2j5sYxeQcc4Lkf93enODs16VDUdVvSIQc?=
 =?us-ascii?Q?5LM4r0+goqQc1IdLKpt26nFxt/XIosMGLdUzladeqZWe0qLQn7rvkmca/HJA?=
 =?us-ascii?Q?k9M8glsz7Ya49cnFIOCaBDjaFkH46w8uyA3H5cwYKdAXSGGI1DOVQEY/M0Lb?=
 =?us-ascii?Q?FQSalwa8Cx/dK0zc8gue+b5+euTdzo9ZXgk7iV+O6zXE9tXegreqgjwXFIm5?=
 =?us-ascii?Q?UMRtZIO/g+5BYycGgOQ9TXjx0BeKZJncxBTlyic7p5weGij/Q8B9I4sihsmn?=
 =?us-ascii?Q?bY/G80yWrU7qVRaeRmeyKf2FvBpoKtrjD2xZvLmViLVLFXdYhneOfWYC0hoM?=
 =?us-ascii?Q?n1rKkYvtpnb73Cn9mFztJ+TTDUC3S9dAGP+LLcmWAsEnPqfrKoplh6irGFdi?=
 =?us-ascii?Q?IXM4gA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	95ecsW6dNSbZze6Hv8651ihijeOechlLogezNbgQVidV/K7w0MMhY1Sci7IfIZujEczBUwLYj9nwt94GIX5AHbu0o7NbdK5MRH9UWeqNJoq2KLxlY0sXdGzRIRR/R9V5gLsI9BK+YlhyH0PZsfMPES/Rqp23HF2BDHJHcJoVXe4Ww4yNA65wPKtbTFkKYnrjTIJog3QFdIkCX4Vq0xor3uYlZ1MNtIkjvEuIcabkVcHIXJ9mnSaBxVtRjZGQiU2pMXo2vtnI2VSIRbYcfXCj4JID2ia3i+buLOkDNR1eloS5DTCLBXxA2v8lROzABzkQbPKObd1so10OsAoMlJie4aBCAb9/gHFEktPBouU4xMeJEJIEHQ+yP8xSgOmw4KVY7tB7uJyZuRgQC0F8HZRZLDg7s8ZXjmUehrZ4sokaljdS+8tDVZb5oHuvFbK5Q5ul
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:55.0200
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb2ff5b0-9e55-4344-e3dd-08de680a3335
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB7066
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52462-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 86B12113A70
X-Rspamd-Action: no action

From: Jai Luthra <jai.luthra@ideasonboard.com>

As this device is the "orchestrator" for the rest of the media
pipeline, we need to stop all on-going streams before system suspend and
enable them back when the system wakes up from sleep.

Using .suspend/.resume callbacks does not work, as the order of those
callbacks amongst various devices in the camera pipeline like the sensor,
FPD serdes, CSI bridge etc. is impossible to enforce, even with
device links. For example, the Cadence CSI bridge is a child device of
this device, thus we cannot create a device link with the CSI bridge as
a provider and this device as consumer. This can lead to situations
where all the dependencies for the bridge have not yet resumed when we
request the subdev to start streaming again through the .resume callback
defined in this device.

Instead here we register a notifier callback with the PM framework
which is triggered when the system is fully functional. At this point we
can cleanly stop or start the streams, because we know all other devices
and their dependencies are functional. A downside of this approach is
that the userspace is also alive (not frozen yet, or just thawed), so
the suspend notifier might complete before the userspace has completed
all ioctls, like QBUF/DQBUF/STREAMON/STREAMOFF.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 135 ++++++++++++++++++
 1 file changed, 135 insertions(+)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index eabe2aab772de..1c9221465a5de 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -131,6 +131,7 @@ struct ti_csi2rx_dev {
 	struct v4l2_subdev		*source;
 	struct v4l2_subdev		subdev;
 	struct ti_csi2rx_ctx		ctx[TI_CSI2RX_MAX_CTX];
+	struct notifier_block		pm_notifier;
 	u8				pix_per_clk;
 	/* Buffer to drain stale data from PSI-L endpoint */
 	struct {
@@ -1535,6 +1536,124 @@ static int ti_csi2rx_runtime_resume(struct device *dev)
 	return 0;
 }
 
+static int ti_csi2rx_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	enum ti_csi2rx_dma_state state;
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	unsigned long flags = 0;
+	int i, ret = 0;
+
+	/* If device was not in use we can simply suspend */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/*
+	 * If device is running, assert the pixel reset to cleanly stop any
+	 * on-going streams before we suspend.
+	 */
+	writel(0, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+
+		spin_lock_irqsave(&dma->lock, flags);
+		state = dma->state;
+		spin_unlock_irqrestore(&dma->lock, flags);
+
+		if (state != TI_CSI2RX_DMA_STOPPED) {
+			/* Disable source */
+			ret = v4l2_subdev_disable_streams(&csi->subdev,
+							  TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							  BIT(0));
+			if (ret)
+				dev_err(csi->dev, "Failed to stop subdev stream\n");
+		}
+
+		/* Stop any on-going streams */
+		writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
+
+		/* Drain DMA */
+		ti_csi2rx_drain_dma(ctx);
+
+		/* Terminate DMA */
+		ret = dmaengine_terminate_sync(ctx->dma.chan);
+		if (ret)
+			dev_err(csi->dev, "Failed to stop DMA\n");
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	struct ti_csi2rx_ctx *ctx;
+	struct ti_csi2rx_dma *dma;
+	struct ti_csi2rx_buffer *buf;
+	unsigned long flags = 0;
+	unsigned int reg;
+	int i, ret = 0;
+
+	/* If device was not in use, we can simply wakeup */
+	if (pm_runtime_status_suspended(dev))
+		return 0;
+
+	/* If device was in use before, restore all the running streams */
+	reg = SHIM_CNTL_PIX_RST;
+	writel(reg, csi->shim + SHIM_CNTL);
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ctx = &csi->ctx[i];
+		dma = &ctx->dma;
+		spin_lock_irqsave(&dma->lock, flags);
+		if (dma->state != TI_CSI2RX_DMA_STOPPED) {
+			/* Re-submit all previously submitted buffers to DMA */
+			list_for_each_entry(buf, &ctx->dma.submitted, list) {
+				ti_csi2rx_start_dma(ctx, buf);
+			}
+			spin_unlock_irqrestore(&dma->lock, flags);
+
+			/* Restore stream config */
+			ti_csi2rx_setup_shim(ctx);
+
+			ret = v4l2_subdev_enable_streams(&csi->subdev,
+							 TI_CSI2RX_PAD_FIRST_SOURCE + ctx->idx,
+							 BIT(0));
+			if (ret)
+				dev_err(ctx->csi->dev, "Failed to start subdev\n");
+		} else {
+			spin_unlock_irqrestore(&dma->lock, flags);
+		}
+	}
+
+	return ret;
+}
+
+static int ti_csi2rx_pm_notifier(struct notifier_block *nb,
+				 unsigned long action, void *data)
+{
+	struct ti_csi2rx_dev *csi =
+		container_of(nb, struct ti_csi2rx_dev, pm_notifier);
+
+	switch (action) {
+	case PM_HIBERNATION_PREPARE:
+	case PM_SUSPEND_PREPARE:
+	case PM_RESTORE_PREPARE:
+		ti_csi2rx_suspend(csi->dev);
+		break;
+	case PM_POST_SUSPEND:
+	case PM_POST_HIBERNATION:
+	case PM_POST_RESTORE:
+		ti_csi2rx_resume(csi->dev);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
 static const struct dev_pm_ops ti_csi2rx_pm_ops = {
 	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
 		       NULL)
@@ -1607,6 +1726,20 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 		goto err_notifier;
 	}
 
+	/*
+	 * Use PM notifier instead of .suspend/.resume callbacks because the
+	 * ordering of callbacks among camera pipeline devices (sensor, serdes,
+	 * CSI bridge) cannot be enforced even with device links. The notifier
+	 * is called when the system is fully functional, ensuring all
+	 * dependencies are available when stopping/starting streams.
+	 */
+	csi->pm_notifier.notifier_call = ti_csi2rx_pm_notifier;
+	ret = register_pm_notifier(&csi->pm_notifier);
+	if (ret) {
+		dev_err(csi->dev, "Failed to create PM notifier: %d\n", ret);
+		goto err_notifier;
+	}
+
 	return 0;
 
 err_notifier:
@@ -1634,6 +1767,8 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
 	ti_csi2rx_cleanup_notifier(csi);
+	unregister_pm_notifier(&csi->pm_notifier);
+
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
-- 
2.34.1


