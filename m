Return-Path: <linux-media+bounces-52458-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AH/EAospimmsHwAAu9opvQ
	(envelope-from <linux-media+bounces-52458-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:38:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD21113A11
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:38:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 18BCD3047DE4
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C9C3C3A0EAE;
	Mon,  9 Feb 2026 18:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="A+O46MPH"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012001.outbound.protection.outlook.com [40.107.200.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076C23A0B15;
	Mon,  9 Feb 2026 18:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662196; cv=fail; b=C258kXiSAKM7HyWAohlUT2cuMXgjkG0/333Xi/6E/1cFl0MJJnERb961j+2vV3mPK2TY/nSQ1hW+9qnEMuCeYansB77PikMygKOqUjOnummQL3ELPQwNRSfL+9cY6PJ7Sq02fJ0+TYDMIqUz5K2Q0HvGiaYx3dyvE1/9DRhTQk4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662196; c=relaxed/simple;
	bh=GMAxOdiQaQNRas2rLAqjVIGlXcBn0zKA3zuUcpRQw8s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=umCTZ5ZL9b+y3ABpY+QGQRRe8nTOA1wbQBVpMYDlOdcPfm3mb3xgPgXQh4uaZkkgAoULoz5p3BgIaCKgWuGbzIGrlMZj8q8Nmvi5awgNLPDZ+wVoJ3PpyWZ8TtCFqTHSL0VUqbKudJg9hCWBd0VI8lIhkEta/W5WqfLl0srWdOQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=A+O46MPH; arc=fail smtp.client-ip=40.107.200.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rjXluYZUJhtL/JoL9VGzZxApmSoXeooxaBXaPYtpVoblkRZhR5fuLm2zCTAlcTu62a7zFPwBXaU+p+bbJWPZS16/VgwxOKYZV/iiOhUX5B+0mI++0ibaxTWMd8yHk3g3CMbpUjiL39NyeLJIBBsvNdTIquuCMfQ/n9kRFSr1UWNKHjh2NVoZiyyJA7tN7sYWNJIFW3OgBQEutkSuIkUJCPWkB7Fp/o3eRC7wmv47Or2coWz5pV6NPl6ceNOa7Bc2bBTf7YgqzcIiGk+QkkHZ/u8AlC/6r1Qnr/XnEJOSUgBZO+3IDzw/05tqZFNXPFd8mnzDKwref7JSVwfxH4Vudw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4Nb7MxBoNW9C4lptnn6bZ+sYgUg4Vz9EjDjpsAERqso=;
 b=SUGQSL1mHlY5oVb3ez8plwe51relaGrlvSV5GWS6qAGZSn+GHffaw+gBxTbOro4M3IjtixsiMlIl3YGis85qAxKRaoPtnP7soUkOScflSFkTtxZmU242JwSrEOSBnIECrJIS4YJfBxi/zx31bKha+lvP0vsRUkGMtbOqu2gVKElWwyYqgMfy7ClLjfYvcULFFd5oClEBT2/bwlI27YICYSbb01f5Nft7fn6GubzkLglOA5ozdDt0E8rsim4n8jJ0NvfdMX95eHBbCE2ddb1dFILw4ECdYwJb+Nwcoi3PgWAv6/GSXE5DrIgYMmu02KXgaiRexJzUie97jwtxXwCFSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Nb7MxBoNW9C4lptnn6bZ+sYgUg4Vz9EjDjpsAERqso=;
 b=A+O46MPHiawkywfbD+1aZas+8hcPUCelUFf9skS+3PBNrAwnB5KincXkTdtv2/lO/3N3hErw7qcUt3mRqYQBM8Ll9czuwFo6xNaeBdR7Ce/WI1ueiaOobwdFPArlm0FVpZ8oJFvrXW8auVTwcWLG4X9rDffmoXxKHhLDX7lfhUU=
Received: from BL1PR13CA0124.namprd13.prod.outlook.com (2603:10b6:208:2bb::9)
 by SJ1PR10MB5980.namprd10.prod.outlook.com (2603:10b6:a03:45d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.19; Mon, 9 Feb
 2026 18:36:31 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:208:2bb:cafe::49) by BL1PR13CA0124.outlook.office365.com
 (2603:10b6:208:2bb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.6 via Frontend Transport; Mon, 9
 Feb 2026 18:36:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.0 via Frontend Transport; Mon, 9 Feb 2026 18:36:28 +0000
Received: from DFLE207.ent.ti.com (10.64.6.65) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:28 -0600
Received: from DFLE202.ent.ti.com (10.64.6.60) by DFLE207.ent.ti.com
 (10.64.6.65) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:28 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DFLE202.ent.ti.com
 (10.64.6.60) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:28 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt92052904;
	Mon, 9 Feb 2026 12:36:22 -0600
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
Subject: [PATCH v11 13/17] media: ti: j721e-csi2rx: Submit all available buffers
Date: Tue, 10 Feb 2026 00:04:52 +0530
Message-ID: <20260209183456.1906327-14-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|SJ1PR10MB5980:EE_
X-MS-Office365-Filtering-Correlation-Id: 985b2ff3-ed25-4ada-5b15-08de680a23ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|36860700013|1800799024|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?To5hF8A//0k3fezX2ywOWtWFrDFcA8jsFzAdK/+UkCWYNJFiUNV8ymecrlU6?=
 =?us-ascii?Q?pOjmcY43Wnu2kHqv/X7H0WSmNhqd/bOIw87vnSZ/8tnu4X5fYUqXTV+dGVvI?=
 =?us-ascii?Q?A/bB3C8j3wCgxpAz8aSG0U1r28sxf1uZOHCs6G6mNs5r84LnoACfvLqaeBOI?=
 =?us-ascii?Q?c2L4XQa45dX3Ch312bWY4VykGUW6kN5UaNvcnV/h/x0xgBSM2ffdh4N2NNpE?=
 =?us-ascii?Q?c2MwCVosFR8/OdVGbNu16muM1j0brgaU3mUgl2Tb4lWDRXrX2jHRBQ/XJMe9?=
 =?us-ascii?Q?GAxvlpwEKAmISm18LlZbTNF/w0RMCeAn4TQMToxG+JwZkQzqswqX3xC/aaMG?=
 =?us-ascii?Q?kXQKOt8PLnIMNHcJIboobJrhUpFsZXtj7NdixDL3lI2EaIwsQEp6rVu4C+3L?=
 =?us-ascii?Q?9br33jnqdlcW5tCNSVFwbZpAMcR6fknam/wJZo824e9/LVesjimO1Ldv0qyN?=
 =?us-ascii?Q?MJZjU0YTnu3wIVI2arBKIB0BLvaDXXV8y0J39ZEwznTVtZnhdH4hOnShiT/+?=
 =?us-ascii?Q?Dp2iB4oihT09beNwRWfXjV3bfL5r7xZlnGd1n8rFqTGiiT4PtXMnUEUAPZAE?=
 =?us-ascii?Q?x2F8+KD7Xyf2mRMh+dtEPr/20KzuA2qtbtvX+fjyemODwowdxdeYBxrB8AC6?=
 =?us-ascii?Q?IIoOefBNWOcclxbr+STNBxJTBWF7swg7/J/Beg72SSZCQS+LKx8B1iBd9WMN?=
 =?us-ascii?Q?L9QZqFSK7ZPIe0dRepYdbH9sMqMLNuTqNaR0lDVobAjZ/q6xnQPl0lYwF8Nm?=
 =?us-ascii?Q?IlDOeQ5BAAK3Ow6Hntt1MEbh1Kxh9iFEubWU+yjKlkFzCl1/Mm4hsWIBrMEA?=
 =?us-ascii?Q?pL2tVj+J5+S33jxa5VVM10munBzUQmWEhhdC9LopWvojCacPnIAeDxz6P99p?=
 =?us-ascii?Q?7KMVGQsnYi1cvzcqiCEcs2NMB+4/OGxe4C7ZttL6QKia6ARkC0GQKnEpxWRx?=
 =?us-ascii?Q?JHlp7ogf2qef/0JEv22mwlxESQhSvx810L3wRlFswuVQl5VTkaSX6QGPZQ1R?=
 =?us-ascii?Q?LrJV+1X6mKi4qRm9BOobTulZ3f1kiI7VLcI5jswExV7XSwBUdUmjeK43u17b?=
 =?us-ascii?Q?sp8jc3Eg3/SF93LvePSehWrLkYf0kptEtpDgsnDHeHM4jbVxIqWul4h9fvSt?=
 =?us-ascii?Q?e6aA+n2Och8r2Df1T8HvvZQfq+RfEGY9LeMi/muKxyIcLfLpcPteopfHnZCL?=
 =?us-ascii?Q?vzsgHZw6uTnRIlAyHUDKLGAdmoAl7yEc1QQhg7xbxjPGSrokqoRh5m5R1CC9?=
 =?us-ascii?Q?LwGnet1+i1XVtVFfyxQCuPhQL5YPgTqBQiOItq3nlvAn5CJ6WVnJwPBSOAR0?=
 =?us-ascii?Q?sU8ZkN0KDg/aUoAuSbpyi94608JYJv1a42v/gCH2FuJQwGNj7FqjsD/rYK68?=
 =?us-ascii?Q?zYeJk87aPQHx9bWDyf2ZOlGKy8QtVYsk7542alnvOQxDqcWVpWSlzkVbX2fL?=
 =?us-ascii?Q?eg8XHy8B/psdeC1werrN5kKv/2TUGCfbJhU7hrMts+pSVCNFnPOqUrKQ6aDr?=
 =?us-ascii?Q?1geIUxZ4AYGVN+oIQO/K0J15hsNYQ/NqAK81QGaWW9VIZEa0lXMPLTYdL+MR?=
 =?us-ascii?Q?G5DWdwqL4sK0dvdyeZDl+V9UCTHTK/PfP5olgPqTJR6F180tOaEwq5A0MeIA?=
 =?us-ascii?Q?JfDfUgwRpfGY/eFqeYcfRggA7zKe+DvL49q/0WpcrX0M30a36Dhq9yZy5h5F?=
 =?us-ascii?Q?XN192w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(7416014)(36860700013)(1800799024)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n0/crbpExoE6QlaI3RDVzqXeHeELztH8v3BRrOND4eNvZ/XtvWkAj3oEEAdO8cfBFiQ/cFkKG1puZqbmZ+2mEKxxRU8zyIZvuzQ56d20tzMTKxAhgPxy86NeKSi5GVDvPNvY7bIX0Uw3jll9Fq0f2D+voFazVP4t059E+RoEBBijKpunofw9StrxyYTcKq1GtNI9CVMIukHLgOUfwAKednGl/b5esaWSPjBITLODAe8Fv/hbjvh26OSPDFo6K/kET/p2Lkh79lMJTmVqjNhhZop4jfa2R+PHb5ElLEx499ku0bNljo6JpFI3otYsTww5iMXplodqxuBdWvCnGWdUdTGxBK5yFuYpopkryKE5pYEhjq5gtnjwBlqSWpxIGgzp1+KJ3B3Kv2sHSdSlKbM3Q1xR3r/MPdFIa519A9PmM2AS3saSeRIEU6HTlp9lAIsR
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:28.9627
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 985b2ff3-ed25-4ada-5b15-08de680a23ae
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR10MB5980
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
	TAGGED_FROM(0.00)[bounces-52458-lists,linux-media=lfdr.de];
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
X-Rspamd-Queue-Id: 7BD21113A11
X-Rspamd-Action: no action

From: Jai Luthra <j-luthra@ti.com>

We already make sure to submit all available buffers to DMA in each DMA
completion callback.

Move that logic in a separate function, and use it during stream start
as well, as most application queue all their buffers before stream on.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 42 +++++++++++--------
 1 file changed, 24 insertions(+), 18 deletions(-)

diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index 4d459b31cf6fb..f06e1175dcd98 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -663,11 +663,32 @@ static int ti_csi2rx_drain_dma(struct ti_csi2rx_ctx *ctx)
 	return ret;
 }
 
+static int ti_csi2rx_dma_submit_pending(struct ti_csi2rx_ctx *ctx)
+{
+	struct ti_csi2rx_dma *dma = &ctx->dma;
+	struct ti_csi2rx_buffer *buf;
+	int ret = 0;
+
+	/* If there are more buffers to process then start their transfer. */
+	while (!list_empty(&dma->queue)) {
+		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
+		ret = ti_csi2rx_start_dma(ctx, buf);
+		if (ret) {
+			dev_err(ctx->csi->dev,
+				"Failed to queue the next buffer for DMA\n");
+			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
+			list_del(&buf->list);
+		} else {
+			list_move_tail(&buf->list, &dma->submitted);
+		}
+	}
+	return ret;
+}
+
 static void ti_csi2rx_dma_callback(void *param)
 {
 	struct ti_csi2rx_buffer *buf = param;
 	struct ti_csi2rx_ctx *ctx = buf->ctx;
-	struct ti_csi2rx_dev *csi = ctx->csi;
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	unsigned long flags;
 
@@ -684,18 +705,7 @@ static void ti_csi2rx_dma_callback(void *param)
 	vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_DONE);
 	list_del(&buf->list);
 
-	/* If there are more buffers to process then start their transfer. */
-	while (!list_empty(&dma->queue)) {
-		buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
-
-		if (ti_csi2rx_start_dma(ctx, buf)) {
-			dev_err(csi->dev, "Failed to queue the next buffer for DMA\n");
-			list_del(&buf->list);
-			vb2_buffer_done(&buf->vb.vb2_buf, VB2_BUF_STATE_ERROR);
-		} else {
-			list_move_tail(&buf->list, &dma->submitted);
-		}
-	}
+	ti_csi2rx_dma_submit_pending(ctx);
 
 	if (list_empty(&dma->submitted))
 		dma->state = TI_CSI2RX_DMA_IDLE;
@@ -1135,7 +1145,6 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	struct ti_csi2rx_ctx *ctx = &csi->ctx[pad - TI_CSI2RX_PAD_FIRST_SOURCE];
 	struct ti_csi2rx_dma *dma = &ctx->dma;
 	struct media_pad *remote_pad;
-	struct ti_csi2rx_buffer *buf;
 	unsigned long flags;
 	u64 sink_streams;
 	int ret = 0;
@@ -1160,16 +1169,13 @@ static int ti_csi2rx_sd_enable_streams(struct v4l2_subdev *sd,
 	ctx->sequence = 0;
 
 	spin_lock_irqsave(&dma->lock, flags);
-	buf = list_entry(dma->queue.next, struct ti_csi2rx_buffer, list);
 
-	ret = ti_csi2rx_start_dma(ctx, buf);
+	ret = ti_csi2rx_dma_submit_pending(ctx);
 	if (ret) {
-		dev_err(csi->dev, "Failed to start DMA: %d\n", ret);
 		spin_unlock_irqrestore(&dma->lock, flags);
 		return ret;
 	}
 
-	list_move_tail(&buf->list, &dma->submitted);
 	dma->state = TI_CSI2RX_DMA_ACTIVE;
 	spin_unlock_irqrestore(&dma->lock, flags);
 
-- 
2.34.1


