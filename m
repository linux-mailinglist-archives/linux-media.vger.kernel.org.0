Return-Path: <linux-media+bounces-53291-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EBsMKJaOnWkXQgQAu9opvQ
	(envelope-from <linux-media+bounces-53291-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:42:14 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 18479186742
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 12:42:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7AA8130C5227
	for <lists+linux-media@lfdr.de>; Tue, 24 Feb 2026 11:40:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ADAF37FF5F;
	Tue, 24 Feb 2026 11:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="l4HHNcBm"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010051.outbound.protection.outlook.com [52.101.193.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 064C837BE7A;
	Tue, 24 Feb 2026 11:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771933209; cv=fail; b=ub8PqpNMlNEGdaVxhoBBc8m+Si6SumWG73sL4maGQL7/lohasQzIUyO7WN/DdCHxT631HkIT/LdQrvo+70h38QhMhb/fvsugiEhvOgXALnlDO6J1INrNFpKI9dBVSa+U0sJhMhGPqMVXig4sQb9RfJ3ukaE3d919KWuZFcFVCKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771933209; c=relaxed/simple;
	bh=X0cZktt1wM8mJ1sSdCsi4rAl0Ymu+3mylm8+ZkXDKlE=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GL/bT3OK/YvC0j27RB1G7fHKcGYGDhdZaGbcyeLcOtjo19k3JJmnhRp/06gvO2MZ2rT+LlgrEDCG9B0GKQddq4arztikKIAf9iJsOXwx5InnBGQ3MANCDUT2nFV6fHYS+KjSpZZgGtumlpyz35zrW6vVa+3y+rYU8OSSBdfGQpM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=l4HHNcBm; arc=fail smtp.client-ip=52.101.193.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mCwPKYUCZIf9o5RBz/QeczGI08HvshX0osR9o/BG1S4+djUzsBDGIf76colth2ILrTnBAZHizm7d9EzGOKyVtxzzekpeMkjmOW+Ib6FkbqgSpEl0FjClAs6VQv9HWMQTTIE83i+LnjullmoQJ6j8JAfBOvw5gOtyVOC0Tz7UXVYFtIh0FUpmHenwqJiVJl8MKeimwP9dS0J8dEkG/aHbYv7qU8jU8Rd3IUY1LaiGo1C5v8baRaZx75XbIZkvL+Utx6FHmFVzrmXdV19hl2WWTMdq6b2UbFZgftEGOAx/FY79M50zB0GYSx1f1MDAJKs1JgkpE62plb0o3a/e7l0eYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f9g0nV6qTHJKmfChe6SqmS7YkwywShONlOZBc6f2jiU=;
 b=CDYzzYryjstmF8iaqeDkKeh/X/HWjCBYj+KeU4C2bE3JJNfg+spBJlobvMV0Gzk4yCLDkAG1AzDzrQqJbaq0FLEQ73i0whrfVcBZ/krZ8XOp9ZrbBR8Dh5b/6DJUhdR23jsiNYWEPfdJMO+tFoJpKOZxZeui5AVVRz7mmgk/OpIRJjxhDZlVNy26akgaCWo6dbuz3+kEk5NHXfJ4QbbLKzpXg374A2rADLHqlEU3fqTiNUupEquYzJwdWvtFv04qigF3TrMNEIvYW6hAxgJ3ErdKjnvJibVbP+MXI8mhebCptNnntudqnkcpzAMSEbVqQoucY2J2PGHOyzykA5nBOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f9g0nV6qTHJKmfChe6SqmS7YkwywShONlOZBc6f2jiU=;
 b=l4HHNcBmr0WaYqS2a+QU1TNaaD8EkzEg5a9LxMyCqUZcKkQIRTu35dOTwO9LKen7Xdsgq76DXNMNZszmJSgYEbuRZ1fuMPD30qQA0qldQNcydKquxuU7zYL/JYdXqfURt4xsZ1SnUz9TG1wubxmoBWaDXlb4ab09VmPReidqqU4=
Received: from BN0PR02CA0004.namprd02.prod.outlook.com (2603:10b6:408:e4::9)
 by CH0PR10MB7483.namprd10.prod.outlook.com (2603:10b6:610:18e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 11:40:04 +0000
Received: from BN1PEPF00004684.namprd03.prod.outlook.com
 (2603:10b6:408:e4:cafe::ed) by BN0PR02CA0004.outlook.office365.com
 (2603:10b6:408:e4::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9632.22 via Frontend Transport; Tue,
 24 Feb 2026 11:40:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004684.mail.protection.outlook.com (10.167.243.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.12 via Frontend Transport; Tue, 24 Feb 2026 11:40:04 +0000
Received: from DLEE200.ent.ti.com (157.170.170.75) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:40:03 -0600
Received: from DLEE206.ent.ti.com (157.170.170.90) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 24 Feb
 2026 05:40:02 -0600
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE206.ent.ti.com
 (157.170.170.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Tue, 24 Feb 2026 05:40:02 -0600
Received: from abhilash-HP.dhcp.ti.com (abhilash-hp.dhcp.ti.com [10.24.51.219])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 61OBdaF22658018;
	Tue, 24 Feb 2026 05:39:57 -0600
From: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
To: <tomi.valkeinen@ideasonboard.com>, <mchehab@kernel.org>,
	<robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
	<hverkuil@xs4all.nl>, <sakari.ailus@linux.intel.com>,
	<laurent.pinchart@ideasonboard.com>
CC: <johannes.goede@oss.qualcomm.com>, <mehdi.djait@linux.intel.com>,
	<vladimir.zapolskiy@linaro.org>, <dongcheng.yan@intel.com>,
	<sylvain.petinot@foss.st.com>, <u-kumar1@ti.com>, <jai.luthra@linux.dev>,
	<linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <y-abhilashchandra@ti.com>
Subject: [PATCH V4 3/4] media: dt-bindings: ti,ds90ub960: Add support for DS90UB954-Q1
Date: Tue, 24 Feb 2026 17:09:23 +0530
Message-ID: <20260224113925.19983-4-y-abhilashchandra@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224113925.19983-1-y-abhilashchandra@ti.com>
References: <20260224113925.19983-1-y-abhilashchandra@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00004684:EE_|CH0PR10MB7483:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a5b2e7-0a57-4ca2-0fd6-08de739973fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?9EK/2eOE9VzWx9gW4gbQnNClVpO21S4Np79/mQMNrEE4Z7aSFE9cttzqCkb4?=
 =?us-ascii?Q?ptXCHgjZ8FbAMSIxsTJ1h1huKe+fbHnLjVnARIqF0Y+sOAdudqfT7qeLJ1HP?=
 =?us-ascii?Q?DLhT4NFuo5u+OXxT1PYAahsOpePXbdmzs4DOG5GhplofKI2HbWpUX8lBcBM0?=
 =?us-ascii?Q?CgSn1Qpgites227IFIDGNJjvSYR3onm4rlb/FaxhVt4DvUUcnrlHVRoU0/dS?=
 =?us-ascii?Q?FR0UgDOgU//HCpIRjJXmGlABtpSqmmbPFX1Pb88tA1uWZpuPfAO14reLMvWf?=
 =?us-ascii?Q?9CoGitvF6gw12kkIgEEZdVV0yXgf/BUHDAJUmmRIIbighpbE7dpeO32Ve4ng?=
 =?us-ascii?Q?RBKC15Hf0fwZozWJvILIut7G4pR0I6ATCbyn7PmwhRQcGfeme7nAVW2RvHnZ?=
 =?us-ascii?Q?ZH6s0z2tw05yvRQ5N7+XBaKG/r8MVh0BDrmTIPYp1kTEoFX7g4x42ZdJp9Cq?=
 =?us-ascii?Q?qC1oPhjYLE+BCaNReJM4H4eM67GMIodk4A2MjJLFo4c7RcdLwi0Nx/nJIt4S?=
 =?us-ascii?Q?mEa14xa56JEDwToqe7y9o+/wXQsQdsjX2TRcOx/AWD0jXjMeWnWQQDA8PU/I?=
 =?us-ascii?Q?xvzJJO0LKDHLAl4EUdJ5UTgZFyVRJ1+Oli+/C7nbIAsl73s7uEKk2FqHryQn?=
 =?us-ascii?Q?Wd7WpcwPjptE5FZRnCgvwRtS0So3AYDSLNA47F4FLuNFeDSxUbYw8/H8NFci?=
 =?us-ascii?Q?5yKtSNrfA6EdD57ZaAAAKFZAbu4B9GtC/u8/rj6eavpl+1uV7KOuVt2D9me4?=
 =?us-ascii?Q?vFkrCt+Pu79+V7k8tzxgx1wg0MBEiuhi1xqPZ5TSrqb7BzZpUnGBr1nXLk4n?=
 =?us-ascii?Q?kpBHt7Hza37UGgIffw75V98nqEDt17y/bgu5p/zkdiJvdU0D7QSi1WHMgViO?=
 =?us-ascii?Q?u2R2AKOSJfFhtfU10/Gy06yJshuMkPGvff04wDeaB5qLJ4ki1Zp8vQgRz87M?=
 =?us-ascii?Q?3EgXOhTouUYGTArZR3T/5GGAwu83w2Qbhm7wX4TG7PZMm14/HxXkK1PVWfxG?=
 =?us-ascii?Q?5FEN39YydmSwsGKt9A0JMQJIm1pWcpgmlXaQCHn0BzI6kDbPHPqqEItkLo+O?=
 =?us-ascii?Q?wplMaPvDymC71x856gKxSg3hucZENaKSfOhCuKDvsS/PG+Ta89QAm0Fa0hvl?=
 =?us-ascii?Q?Mr3ktCCl/9gKuo84YDmHCs4oWXEMxFonVt9dNS5awqQCRku8qHQ4RAMFC/Qq?=
 =?us-ascii?Q?9ZWWItVzxgKPslLQT0xgFoJC4Qyyz++86FJKc3RS2SxsVSTTptVj9Y2KpPh7?=
 =?us-ascii?Q?VwREnB3SRoNydl1qW9hhrMhDh5/ripskXXJlZRQ7zBNvWPx/TaIWhPZY6LXN?=
 =?us-ascii?Q?LGychlEWhR82onMeHffquI0RWPIJBMEFJmR4C7sh95efVWhhq7gMVpT6Sh4K?=
 =?us-ascii?Q?+qQ53K9iXhJF9WlY6Klsgzs8EXHbze7RK0D31C3AdLSV2e0YMYBWSHdAEjo+?=
 =?us-ascii?Q?UB8cdYDmsaXWnj0FGJEsEsRXHJpLRi+8Awg24Go7MwpsygNTs4UzoHHFU4kK?=
 =?us-ascii?Q?XOMnd/mzNx6KQOEwu3VhtBaxKiXRU9rd1Xss0ldIUlrK8hWmE5ffGTGEhiXW?=
 =?us-ascii?Q?COYOHQYAeaJcsmVtDLq60G0+BtAQI3I0wUi4qFboUm6534S15P3DlpCJxxFu?=
 =?us-ascii?Q?codwjA9k1PYRhpkiuLHK14O+0HGppqj471k5CAMLJHWeFbT49OmlYaV8YmJm?=
 =?us-ascii?Q?cfnuNA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	f3seIczGp18LCDYuNptgQTiVRMb4fyHscFAJk21obgLaQvcb4e92JqKJZNeipQSi3A6M0gABkwNDsKE1wkGYSKB5Ggrt1ThBrEamXdzXhq6JFANo1sFHTPTbwMZrm89AtMUVmLCDLktOkOpA4D3czdF9/qhbCFENJH0ukuw5gTISMhWIGxKMa5qVSFzcnqU8aohjrabJbxe4iAOKii/11igM1NUg4Umo/b3Os6+BuwaLWNy9FIt0J2rZ42ZBaHYiLhRoiLvrT2xNL7CTSnEaSBYQBzNQy4TdxDZQqT3RvyD+BgoeQkPCaa/eLJZEDbEhM9tZtc8HOwTEXTLgE8qB3Ee54o+FFTjYbjlAT3iaNlJGNiB+F953EwXmWUr8a+3uK3Sv6nKp7nHUjZZG7+TvzTws1ieQF6RGIIKu6jw4ez07fawZ8lZQlNQiS/TAmNp9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 11:40:04.4952
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a5b2e7-0a57-4ca2-0fd6-08de739973fb
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004684.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB7483
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
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,xs4all.nl,linux.intel.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-53291-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[y-abhilashchandra@ti.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[ti.com:+];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 18479186742
X-Rspamd-Action: no action

DS90UB954-Q1 is an FPDLink-III deserializer that is mostly register
compatible with DS90UB960-Q1. The main difference is that it supports
half of the RX and TX ports, i.e. 2x FPDLink RX ports and 1x CSI TX
port. Therefore, add support for DS90UB954 within the existing bindings.

Link: https://www.ti.com/lit/gpn/ds90ub954-q1
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
---
Changelog:
Changes in v3:
- Rebase on top of next-20260223

 .../bindings/media/i2c/ti,ds90ub960.yaml      | 113 ++++++++++++------
 1 file changed, 77 insertions(+), 36 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
index cc61604eca37..8e2b82d6dc81 100644
--- a/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ti,ds90ub960.yaml
@@ -13,12 +13,10 @@ description:
   The TI DS90UB9XX devices are FPD-Link video deserializers with I2C and GPIO
   forwarding.
 
-allOf:
-  - $ref: /schemas/i2c/i2c-atr.yaml#
-
 properties:
   compatible:
     enum:
+      - ti,ds90ub954-q1
       - ti,ds90ub960-q1
       - ti,ds90ub9702-q1
 
@@ -129,39 +127,6 @@ properties:
       Ports represent FPD-Link inputs to the deserializer and CSI TX outputs
       from the deserializer. The number of ports is model-dependent.
 
-    properties:
-      port@0:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 0
-
-      port@1:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 1
-
-      port@2:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 2
-
-      port@3:
-        $ref: '#/$defs/FPDLink-input-port'
-        description: FPD-Link input 3
-
-      port@4:
-        $ref: '#/$defs/CSI2-output-port'
-        description: CSI-2 Output 0
-
-      port@5:
-        $ref: '#/$defs/CSI2-output-port'
-        description: CSI-2 Output 1
-
-    required:
-      - port@0
-      - port@1
-      - port@2
-      - port@3
-      - port@4
-      - port@5
-
 required:
   - compatible
   - reg
@@ -204,6 +169,82 @@ $defs:
           - data-lanes
           - link-frequencies
 
+allOf:
+  - $ref: /schemas/i2c/i2c-atr.yaml#
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - ti,ds90ub960-q1
+              - ti,ds90ub9702-q1
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 0
+
+            port@1:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 1
+
+            port@2:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 2
+
+            port@3:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 3
+
+            port@4:
+              $ref: '#/$defs/CSI2-output-port'
+              description: CSI-2 Output 0
+
+            port@5:
+              $ref: '#/$defs/CSI2-output-port'
+              description: CSI-2 Output 1
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+            - port@3
+            - port@4
+            - port@5
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: ti,ds90ub954-q1
+    then:
+      properties:
+        ports:
+          properties:
+            port@0:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 0
+
+            port@1:
+              $ref: '#/$defs/FPDLink-input-port'
+              description: FPD-Link input 1
+
+            port@2:
+              $ref: '#/$defs/CSI2-output-port'
+              description: CSI-2 Output 0
+
+          required:
+            - port@0
+            - port@1
+            - port@2
+
+        links:
+          properties:
+            link@2: false
+            link@3: false
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


