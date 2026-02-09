Return-Path: <linux-media+bounces-52449-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yMakJoQpimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52449-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:37:56 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E3B11113A01
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:37:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 787D73050A17
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:35:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E022B388845;
	Mon,  9 Feb 2026 18:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="V7eVSLX0"
X-Original-To: linux-media@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013046.outbound.protection.outlook.com [40.93.196.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D77A3A0EAC;
	Mon,  9 Feb 2026 18:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662136; cv=fail; b=kMXF9DS295EoBa8mlKBfBbtrWm0vcijjr6TwCJMsK6zEewTJwEp0xXqIjYsP+D46m+lR+vBR3REnZmvMA3RZRSblq261QjT1l52askVdKoalQV20EtVKvlAyNtlOg8d9IicK2HWMkLmSrjSQLqC/NMZFmnr/bIMSpSh04Qs8rJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662136; c=relaxed/simple;
	bh=YGLRySKEOPDzPvmV+Ivvnff93ecgOVZzSGWbu7uM5F8=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Er8o9Nfca0kQZXf+/BbfocL6lrpjbzu2kEQnwA+mHOvODDFPu8h6ktUe41CNgsBxsV2MJuK/HaojcC0pz+x+WkGRtNPlz5tZpXzfTwQ03VqwE0oGDgD1zlm2JNs7r9vlVSilF/BcC9Tyi66KWC7lgTleJSt9O/e8RMQPc6ixOeA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=V7eVSLX0; arc=fail smtp.client-ip=40.93.196.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oj5oEBYmElAUFxilpxVH5qlzX9dMW1g2IiuvubaByaDKohDCsoI3lX3tkoAQLARXFhtXLFY9xyn5d9d5rDhEdeiSleGVR3upAgfCsPGB0/2hdJxxUQi3IwJzFf7HQ1KjqQ8eCW1rynoVt/XwgVp1blUce0BRMARe1zX2VGcv2Gmld4MJSL/pC1nuSUfKJ3Qap11e/2qCw9+x7gnCRiN/tyeF+KvFnDBD9FJ3y7nm8haKrUOPZSM5NaWOGgonaobkTTMYaW7VMaRlVv4EEZcP0AGT3EDSl5cH1i0ChNSmvcF/lJA+b3KgL0XWXWPocVKyEgG25VgnR7kVZokLYmoKHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xw7AsUt2zzwHbIz+Jl8l3lQ55E/X3uVD9mYVlyL2+6M=;
 b=rPuCyfoUBSWm2vJQEfrt22aLhSbJcTspMrlCzhLrInwqHYDbK/l9TZEL8G1goUyx1JRX74sPMvIqJZgU2AjIH47M+F3VxWbOwN40xt3rVV0f0v5qsD6C1c5pnaIMdvJHzn+9XY8lHFLajLcm6eWWkBv7AObQXqEzJV9DoJS3H5yddPdGDLmmsLezYWkCCdkqx8qTscu6EeW61MCHhKppKKEl0JZwjqMkH6XBvPz9iExrZfOP/WQ5jfW1gw3/m4kYY9N4bbNUvrYq4xM5WSq830c6PcXe/HQsRTUclfgkKFhK9WM7OJH7PhxoigJ6iGlEMw9OO1kg8LVfGRvvSTjaTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xw7AsUt2zzwHbIz+Jl8l3lQ55E/X3uVD9mYVlyL2+6M=;
 b=V7eVSLX0BBBuyVK9SAPiTbMYzR1Kr7CpcMtbu340ySF9RQY9Y2NRiYqoMwSOFiz8C0E3eGULvRHJjIyfzMj1lxcvktjb7t6B6px3zAw+QzglWXjFsc7mQFyg7Dw8S3Rr3gf0ZQ03g8QoDog/bdofKMBk9crieDmxFuBKa83NMsI=
Received: from MW4PR04CA0168.namprd04.prod.outlook.com (2603:10b6:303:85::23)
 by BN0PR10MB5064.namprd10.prod.outlook.com (2603:10b6:408:114::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:35:33 +0000
Received: from CO1PEPF00012E61.namprd05.prod.outlook.com
 (2603:10b6:303:85:cafe::59) by MW4PR04CA0168.outlook.office365.com
 (2603:10b6:303:85::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:35:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E61.mail.protection.outlook.com (10.167.249.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Mon, 9 Feb 2026 18:35:33 +0000
Received: from DLEE211.ent.ti.com (157.170.170.113) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:30 -0600
Received: from DLEE204.ent.ti.com (157.170.170.84) by DLEE211.ent.ti.com
 (157.170.170.113) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:35:29 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:35:29 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt02052904;
	Mon, 9 Feb 2026 12:35:23 -0600
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
Subject: [PATCH v11 04/17] media: ti: j721e-csi2rx: prepare SHIM code for multiple contexts
Date: Tue, 10 Feb 2026 00:04:43 +0530
Message-ID: <20260209183456.1906327-5-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E61:EE_|BN0PR10MB5064:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdd0920-909b-4db9-8d65-08de680a0294
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tYaQzFW8zHSv2e8Vn58xk0mYGP/f8L0xwzt6GTwrNeBHw3KDm3hvqkkGbhGK?=
 =?us-ascii?Q?C4DurSSRvsIdSYThiRozOj3bAbIXBkCLqA6f/tO5PxaZI8PeyeOCiNqbZP/l?=
 =?us-ascii?Q?gF3NUuXFZoOrfLEF4apJtLpemomoC+zcQXdwxobrFh5r1K2yZnokXDZewsNA?=
 =?us-ascii?Q?L3YDLLMeOFTRHFfOcuuS06KIOQTDWVqAkrdsVRzOKufGLtEY9mi0pHOgPegx?=
 =?us-ascii?Q?NhweYOlTT5wB32EHFso8Qqb//xOS9YoRbxGFe4BBaLjuR+NTZ+GOLTd/ZKi/?=
 =?us-ascii?Q?k2Ma7cKYM23NBVTUxEUmyCL5SF9aj4LTYVXCTpp/2cD3shf72kCVm2mnoEG9?=
 =?us-ascii?Q?0x3MlDPnj6Xr2L24LGYPBBUucGArFu6TtEsha0DOCRhSsbDH+CwgHwILs2Pv?=
 =?us-ascii?Q?cOTkVLHNzisKgEzcKCW8eMu9wquwEzQMW2EAPMY2fiA5C2iOov0u2cLZ8gLp?=
 =?us-ascii?Q?6se4QC1KYOjtwpT/VDjGL4U50mNmfrKsD4SOdEkWE/b6BUzIkV43H+e2cGNP?=
 =?us-ascii?Q?gN9IsLRUmPbFsvENN4RSi3qVy8ibdBtRPPsTxm0c6m6Qg4jdmry2E6ebQ+km?=
 =?us-ascii?Q?PscXR4Nx5BXiXELZm4imWTPP3K62/PDYK+WcXmGtCe6fzHLc7on9fOD8r/n9?=
 =?us-ascii?Q?UP5EicNJV9OWqOs2sfts/Aw9ififKNpm50bL9imuTw7d5dRuDz7ERF7TrRs8?=
 =?us-ascii?Q?mIeSgDafkugni+FJ+Na88T/CcESDhbMNS93PjpEdADTtAJldAZVI9OC6Ph0j?=
 =?us-ascii?Q?Jv6GUZ/of3gHl0U7xNiYM1qMSK6ey/1QFafacL5shzy8G8XRpfiL1ySkNAt8?=
 =?us-ascii?Q?jQhS0RaomiubY2jIm0IdY+iswWa2/59VwD+qEFBafdmBJtxXsI1rpk+QDJcS?=
 =?us-ascii?Q?wralbZtXoywdS9pku4IQw7DFpRHNlnGvMllvDUlOEbMqru4u74PDYLel/s82?=
 =?us-ascii?Q?4O0hfEL6aXTbpDtGrf88W/5kveeF49t1IgseAaeO6ztDj8DFXoaFJszLtPRo?=
 =?us-ascii?Q?gQP5xVrJH6N8WylCUVWLz4ICYcEGXU7j//yritneg85fvpKLn5CvOubf8bwH?=
 =?us-ascii?Q?VT3Yd5yiuxCRp94trBaAZquBXN0QbC9YP/unyDzsGdJwFI/ICkzYXiIRGp4b?=
 =?us-ascii?Q?BlykNB1jnbMDGr24H+ngs4w9cRvEpEbNALzDVDcWBqDpTJVrEq3jcgbDGB7a?=
 =?us-ascii?Q?kOBjATWNHUG94xv49Yi6pARdQ8sM2Tm/kyJHDKP3jQOXpxDVpqsyJpxuT3kK?=
 =?us-ascii?Q?lJPxzIu5gTwEnX5vAuESR3tqJ2wCVftns15ZlJ+kF5nxuC9NmzP0/PV0yf1O?=
 =?us-ascii?Q?E3h3oNoFpuDle4cqnSOJ7tx9Dt3irH//HWrTDg926i7M60LEZ3dztLq4qZti?=
 =?us-ascii?Q?8DmevbKt5gc+RhDNrUjIg7693PBjpYzNmKIR4T/gwlU0OKxxtfdTWnU9rkSZ?=
 =?us-ascii?Q?e53xA8Wpq6xY0e60P7OmjJbdBH0KEbk7cbtMvBv7X2wotrKhWs1GOeVDKEJT?=
 =?us-ascii?Q?6s/QA0Wew9Jlcbggsuo8/ASUOf2aT1axcW9LsukZJr3oiDLoelVEWmTIZDcU?=
 =?us-ascii?Q?ABuUdfXLr167+dUYDedyI/pmTw7ffdSd8kWIP/7KTa6tdyPhwi7HNqMgazl0?=
 =?us-ascii?Q?83P1E6BCYbvzpONsHzWD9gDeX7Za0BwhFKfqmMqUNz73TacXNAHKTo1Cd/R5?=
 =?us-ascii?Q?x8x1Dg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	rOZencGJTBWW+cCbtEmz/0TSeWKjaUkvTWN/mIu4oo5SQ1dl5tcfo41bfHKTsEPPMFQpPrSV3gkFOjkgU1FS1Fjki+IK86DZGTA+YS5gQ/5W4IPIIBkgx49/c20vYyQBSGjzFxCwhcmB/ORZq/HQXjvWR+i3LljIkAVD7l+06ItR07UnnapbbK3Mx77AjmibkL1cFTm+zyxOyvO89Edl5NDbBoF+9nv+rgVlGAKnG/O7iWImfmyOFwVnKc/YMY2bO9hZFf3jhrVq346AuzNXbfyMjchUf9dRAIAPIpMdqQy/8+/n5cvcqnnbKjfJn7Z4Yxq+4HYr4xlD5Mrr/wyC85+mHtub8YXaI5c3nHASrHrjcwYWLis0shvoe9o39sfMp9CZST+cZLm5AyWSd100Fp4QS3kkSaTDgIRHDncLYwHsvwmqgpZ+Gtt7PG05g1n9
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:35:33.4111
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdd0920-909b-4db9-8d65-08de680a0294
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E61.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5064
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
	TAGGED_FROM(0.00)[bounces-52449-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: E3B11113A01
X-Rspamd-Action: no action

From: Pratyush Yadav <p.yadav@ti.com>

Currently the SHIM code to configure the context only touches the first
context. Add support for writing to the context's registers based on the
context index.

Signed-off-by: Pratyush Yadav <p.yadav@ti.com>
Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../media/platform/ti/j721e-csi2rx/j721e-csi2rx.c    | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 23717a3b6c4cf..4adfae425f192 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -27,7 +27,7 @@
 #define SHIM_CNTL			0x10
 #define SHIM_CNTL_PIX_RST		BIT(0)
 
-#define SHIM_DMACNTX			0x20
+#define SHIM_DMACNTX(i)			(0x20 + ((i) * 0x20))
 #define SHIM_DMACNTX_EN			BIT(31)
 #define SHIM_DMACNTX_YUV422		GENMASK(27, 26)
 #define SHIM_DMACNTX_DUAL_PCK_CFG	BIT(24)
@@ -38,7 +38,7 @@
 #define SHIM_DMACNTX_SIZE_16		1
 #define SHIM_DMACNTX_SIZE_32		2
 
-#define SHIM_PSI_CFG0			0x24
+#define SHIM_PSI_CFG0(i)		(0x24 + ((i) * 0x20))
 #define SHIM_PSI_CFG0_SRC_TAG		GENMASK(15, 0)
 #define SHIM_PSI_CFG0_DST_TAG		GENMASK(31, 16)
 
@@ -568,11 +568,11 @@ static void ti_csi2rx_setup_shim(struct ti_csi2rx_ctx *ctx)
 		break;
 	}
 
-	writel(reg, csi->shim + SHIM_DMACNTX);
+	writel(reg, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	reg = FIELD_PREP(SHIM_PSI_CFG0_SRC_TAG, 0) |
 	      FIELD_PREP(SHIM_PSI_CFG0_DST_TAG, 0);
-	writel(reg, csi->shim + SHIM_PSI_CFG0);
+	writel(reg, csi->shim + SHIM_PSI_CFG0(ctx->idx));
 }
 
 static void ti_csi2rx_drain_callback(void *param)
@@ -890,7 +890,7 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 err_pipeline:
 	video_device_pipeline_stop(&ctx->vdev);
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
 	return ret;
@@ -905,7 +905,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 	video_device_pipeline_stop(&ctx->vdev);
 
 	writel(0, csi->shim + SHIM_CNTL);
-	writel(0, csi->shim + SHIM_DMACNTX);
+	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 
 	ret = v4l2_subdev_call(csi->source, video, s_stream, 0);
 	if (ret)
-- 
2.34.1


