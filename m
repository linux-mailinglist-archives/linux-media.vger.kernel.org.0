Return-Path: <linux-media+bounces-52456-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2ItmOncqimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52456-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:41:59 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70E113B10
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:41:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 59021309685A
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2528E3A0B33;
	Mon,  9 Feb 2026 18:36:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="Gv+cWTb/"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010029.outbound.protection.outlook.com [40.93.198.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B2E1388845;
	Mon,  9 Feb 2026 18:36:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662180; cv=fail; b=p/wE3d42rtx/hGeLg97ar2GBbPvpvIBCltH0VQNEn1zj7SLTg+mQJxbObWKpIY1wcydajLOo51QL/OV24sakAUQbV+unFe7kPqScjpeijoTNeqzsud5Oan71D3KHottGtMyDhNrqkmWikZmnMGtD0r3zwOQxVBH4ye2AgBjAfP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662180; c=relaxed/simple;
	bh=I6bM29YqWXT+QNFagH3hoxNmF107SoXOXdRsDbeeUos=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CKkazMkN97ri24wpKojiZMwpLtQIcTU3XRrAmC9FV6jYwqhCOQmo9s7rg95kZVU0wU8T7ILb7JepQDjzdvd6+GSHsWVyKFLKjUaO9ug1YI621e5S3yPSLMzO6EOT/ZhJMeNeTmFBazxPm0/qyNbx3rO/TkCk4QWGqGIHaCkTyR0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=Gv+cWTb/; arc=fail smtp.client-ip=40.93.198.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vnfz9TFkdBqYHIk9dgA42Dg+YxYctzmqKCasnmS2ZdXeCZfJRp6a8DnKELM7xwkgmGQg4FKGpRfKhmtRu/VKc7S7XDUFt1pEdvCjdNiZgIAEd9wNNw0/u0YtetqCaziWih3GZr5dFqZsIElMoA+IzeT5RQ6C8JDYkokVRUBgnOWObc8FrL5JT8IyzvthvyRg8QG5Df50iExZN1JJQk4td6h0unVF9VKMC0ZzdhY1YETVaiWyJyyC+HcFNApn41LCDqgpXi1SFGGyReC+lYnsLkdT+a6TXTQkQSUKFOhb9PVTTCHDAkeAK8o4R83d2zTdy/cNUq31H3OYvZqUdE/Eow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zclgqvKUBhFKE5qxGeEnmUEwneTSFgR8GG20ae50Dgs=;
 b=DWTHYu128vDDDxPVWOPmeKA9A1BrUSCchxhnTp9Zy5wYC3zK6xDN1DZ8fdiEOccEM9/5RV05fmMhUDtxPz9kvtgZ2MfG6m8hBnIxYcheoWqqeVpfN+vhO0cD/QeC50wtjNdrx28f/K1/60wqLK7BA2f1tj7erpjwH2k4I61AsR1N5c0chM0M//0aUJnZECmoc+xISTcdej7A0hgP8+90agthLy7uMSycwDmXqRPZO+Uy+borMSiRF4ShTh2D0ycRLM83peL0fNZeC5ffsyvqUxbK1TLSePlUDXMxwk3Fz4cJ3V+zo1SN/Gkyv+XE6Nt2S80f2QSVhDxDL/FlxyMMDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zclgqvKUBhFKE5qxGeEnmUEwneTSFgR8GG20ae50Dgs=;
 b=Gv+cWTb/HvVij/y2s4ACRNq7Jlm1Da54USQIedzd0cB55h9xZlxZBmnX3gkoE+TPAaHetS6IaYvThBPs7gv8SY7/IuvEOE8XsxOZmMwyWJseIHsfMGiLMbV8ai3VyjZVcbk4A46CXlu4WudqeYO+YIyFqxK8Mdhsk8Qu290yq+I=
Received: from BY5PR16CA0027.namprd16.prod.outlook.com (2603:10b6:a03:1a0::40)
 by SA1PR10MB5759.namprd10.prod.outlook.com (2603:10b6:806:23d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Mon, 9 Feb
 2026 18:36:16 +0000
Received: from CO1PEPF00012E66.namprd05.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::df) by BY5PR16CA0027.outlook.office365.com
 (2603:10b6:a03:1a0::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:36:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CO1PEPF00012E66.mail.protection.outlook.com (10.167.249.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:36:16 +0000
Received: from DLEE205.ent.ti.com (157.170.170.85) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:15 -0600
Received: from DLEE203.ent.ti.com (157.170.170.78) by DLEE205.ent.ti.com
 (157.170.170.85) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:15 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE203.ent.ti.com
 (157.170.170.78) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:15 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvt72052904;
	Mon, 9 Feb 2026 12:36:09 -0600
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
Subject: [PATCH v11 11/17] media: cadence: csi2rx: add multistream support
Date: Tue, 10 Feb 2026 00:04:50 +0530
Message-ID: <20260209183456.1906327-12-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF00012E66:EE_|SA1PR10MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 1d17eef0-0887-4613-eb91-08de680a1c0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oolMINPL0gQyeYFrFsRjyyhvSD73jIVQzhrlT8UeSb0XwrVwRXzcygsIXtIn?=
 =?us-ascii?Q?Z8HauIW9oLTxNk82qqVcXH/dVWfXi7mJZHDuqYsI92w3QURuH8bzcPAmykUP?=
 =?us-ascii?Q?WrqSIcVpyVuM26F5YCq9GAveH28pN75E4/hh3JGnlcd+Lm2c0W3y8SpwiD6X?=
 =?us-ascii?Q?eaL5mhJfg/6RuYIN4KVjMrDJtbhemeLB70Q/YUwMQkiZeN55yBE5A+LFmD0i?=
 =?us-ascii?Q?d9L0POwwOqJwlUiH87yYw1to9IopJ9VT1tGawYMZQbFiA4AtsTQc1OibzD41?=
 =?us-ascii?Q?hpQPhL7kielYJoE2yhjBs++V445ynIN365fuBfBe0JnzhUcZkvwYVtrbkAbO?=
 =?us-ascii?Q?E6aLkp5z4Wm0bHo5XKgsra9oZKgL6zNQtw4mXqcPMADDWHha7Jq4ziQ4sSkF?=
 =?us-ascii?Q?vv2bZL4LEPThoRVBs7ZFCgQx0ZnV0krHKBZnyDHTu4UXstRNFLxbxDsVKSJQ?=
 =?us-ascii?Q?NGSwjbrggUYx2FZ1PCIjZJRVM4qlHhcz421ry/6w40KgPg5Tk7rx8ZBt3AE0?=
 =?us-ascii?Q?2QURdZ0W1deXYLNXzH+gewvy4NFqZZuAlGxJe5tocQ2ImToex7CTUIPv3EF5?=
 =?us-ascii?Q?UcKo5MI+Sck6OJKuD7L9ui1HO82eM1a35CCS78u6T89Y8HyNBKN6xhmfJZHM?=
 =?us-ascii?Q?trmoX4bc9tMASm5bL8UOSSsFFz+VNIGxPKX9PxVr+ebDT+4lnuxSXyc04iAl?=
 =?us-ascii?Q?IGYP/pmq2OnaE1wEbfNAFJsXrlKjGs8kNhyvFJyFD7oNZkBdv5034N/HZm8B?=
 =?us-ascii?Q?UA0yZoZ0uwuePAgAHqE31i/nb9WfJ8ZriwqXKBsbNI2teYcWbLQ3OctjeBZf?=
 =?us-ascii?Q?d04b5cufxdyjN106aHzpTjPfRMW48VRrYfpM0Yhl/OxrtRE+qBbyCWkdefS4?=
 =?us-ascii?Q?kEs/DgXyZb1ZZMHww4jQcrMnPqWavNWql/MfNRWL6K9TmDNBSDX05GSACPKz?=
 =?us-ascii?Q?Gr10oIa9raRwXfQ4F+jzUoFo3KtruKF74xD9p7gkBgjnE9eYzsjdFYkAECTd?=
 =?us-ascii?Q?AlDjvPgAHQvaNLg8clSt8xg7uKzi8GN6n7bhn3RYbkIZY8dQfJT/ngV3LKqs?=
 =?us-ascii?Q?S+MTKaILp4vPQqjk2CSCusoRezJUZF4gb/CHff0wyE/uGhMjDbNYYRd2EF63?=
 =?us-ascii?Q?s06xAPoz7lpkYrWmiYvAGJGGvkHKKyfXKbiCLk8uK+v3Tht4myBbI1nIz1MG?=
 =?us-ascii?Q?jRqZ8KP4BnoOVXr9159dVADsOTYyidYcb8dIcl4/KmIY+vjHIQXhSgwXKUW9?=
 =?us-ascii?Q?TUbs6IWAc9HwWwM0lFScRpksssU+8bLl4ndYTtMGzIOPzi1xYkvISUo4cxkt?=
 =?us-ascii?Q?f8QGfZXAousin9HhMAZSUnXGnOXWo3kF8q3yRNDSfW0j3Lt3FVxwhnaEciCM?=
 =?us-ascii?Q?Usp5BXht6e0/eaqfE6i0q6Q067YcdUOp3XQYZQ/M+IPYcxPAFtLQKwfO5KZo?=
 =?us-ascii?Q?OkRlnlmG8+geZFmUjvR40GSfXeb1Udzy8m5PM/KBKBRq1qnsJjSFJRKRyToJ?=
 =?us-ascii?Q?EIZNeFGtwrqvDCLiMDGVW7OlboHwvilLTe6i+2Bb/TnNUCCYdVANnEifHXdv?=
 =?us-ascii?Q?XoCRsA18ocDrunmU+cKcDAYVm5Bkv0W79XS4TM/1s/7AxbFosWZju3B7Dfg4?=
 =?us-ascii?Q?ygZz+MCM7yyTyTjaT69IOd7Qp50qpPga0OutVzIDf4dpKR0OXkC0e5olA+nZ?=
 =?us-ascii?Q?1JVNqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	CNVlVOc7FJSayvgNwR4fFkNkLeAmq0Nt83CjyNRZncIRLIrL8EYZ2tMHOmyt8LoEIJY+wwSQIPj8qnyhfKAgVDTN7W6IDDVTxtcD4wz0CDOiz6ipassqHCNXdyr6kCAhRNmhaX9LzkPp0koueBi7KGREkJBc7KmEQZaC+xJmYNJrQ3PHS0iZwkT7wXZFPSAqiCgY2nLaiq+raLrpNSxsCO+jVlmF+y7qCImaAJ9G+1BiaP82qehPnzaG/EKUfCZP7xsteRaNAN7kmD2ebpvLTkUn8GPt+46ZmsnTqkSflFP9Odj+qbR+TGtN7TiYkNbjskQjv7l6xvDeNSc8A9HEOXRL7YLzTWWV/S+E9GrPU2pZqMppftlWXDo2Wl//CrrHBjqQfWm0SXhuz4KICW2J/W601dEkc/eja6/V9vr22ju+0hZTUDvmL00HKXi75JXx
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:16.1509
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d17eef0-0887-4613-eb91-08de680a1c0f
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CO1PEPF00012E66.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5759
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
	TAGGED_FROM(0.00)[bounces-52456-lists,linux-media=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[ti.com:mid,ti.com:dkim,ti.com:email,ideasonboard.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,starfivetech.com:email];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3F70E113B10
X-Rspamd-Action: no action

From: Jai Luthra <j-luthra@ti.com>

Cadence CSI-2 bridge IP supports capturing multiple virtual "streams"
of data over the same physical interface using MIPI Virtual Channels.

While the hardware IP supports usecases where streams coming in the sink
pad can be broadcasted to multiple source pads, the driver will need
significant re-architecture to make that possible. The two users of this
IP in mainline linux are TI Shim and StarFive JH7110 CAMSS, and both
have only integrated the first source pad i.e stream0 of this IP. So for
now keep it simple and only allow 1-to-1 mapping of streams from sink to
source, without any broadcasting.

Signed-off-by: Jai Luthra <j-luthra@ti.com>
Reviewed-by: Changhuang Liang <changhuang.liang@starfivetech.com>
Reviewed-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/cadence/cdns-csi2rx.c | 278 +++++++++++++++----
 1 file changed, 226 insertions(+), 52 deletions(-)

diff --git a/drivers/media/platform/cadence/cdns-csi2rx.c b/drivers/media/platform/cadence/cdns-csi2rx.c
index 65c6acb02f85b..db9871fdbe3a4 100644
--- a/drivers/media/platform/cadence/cdns-csi2rx.c
+++ b/drivers/media/platform/cadence/cdns-csi2rx.c
@@ -135,6 +135,7 @@ struct csi2rx_priv {
 	struct phy			*dphy;
 
 	u8				num_pixels[CSI2RX_STREAMS_MAX];
+	u32				vc_select[CSI2RX_STREAMS_MAX];
 	u8				lanes[CSI2RX_LANES_MAX];
 	u8				num_lanes;
 	u8				max_lanes;
@@ -273,30 +274,46 @@ static void csi2rx_reset(struct csi2rx_priv *csi2rx)
 
 static int csi2rx_configure_ext_dphy(struct csi2rx_priv *csi2rx)
 {
-	struct media_pad *src_pad =
-		&csi2rx->source_subdev->entity.pads[csi2rx->source_pad];
 	union phy_configure_opts opts = { };
 	struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
-	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *framefmt;
+	struct v4l2_subdev_state *state;
 	const struct csi2rx_fmt *fmt;
+	struct v4l2_subdev_route *route;
+	int source_pad = csi2rx->source_pad;
+	struct media_pad *pad = &csi2rx->source_subdev->entity.pads[source_pad];
 	s64 link_freq;
 	int ret;
+	u32 bpp;
 
 	state = v4l2_subdev_get_locked_active_state(&csi2rx->subdev);
 
-	framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK, 0);
-	if (!framefmt) {
-		dev_err(csi2rx->dev, "Did not find active sink format\n");
-		return -EINVAL;
-	}
+	/*
+	 * For multi-stream transmitters there is no single pixel rate.
+	 *
+	 * In multistream usecase pass bpp as 0 so that v4l2_get_link_freq()
+	 * returns an error if it falls back to V4L2_CID_PIXEL_RATE.
+	 */
+	if (state->routing.num_routes > 1) {
+		bpp = 0;
+	} else {
+		route = &state->routing.routes[0];
+		framefmt = v4l2_subdev_state_get_format(state, CSI2RX_PAD_SINK,
+							route->sink_stream);
+		if (!framefmt) {
+			dev_err(csi2rx->dev, "Did not find active sink format\n");
+			return -EINVAL;
+		}
 
-	fmt = csi2rx_get_fmt_by_code(framefmt->code);
+		fmt = csi2rx_get_fmt_by_code(framefmt->code);
+		bpp = fmt->bpp;
+	}
 
-	link_freq = v4l2_get_link_freq(src_pad,
-				       fmt->bpp, 2 * csi2rx->num_lanes);
-	if (link_freq < 0)
+	link_freq = v4l2_get_link_freq(pad, bpp, 2 * csi2rx->num_lanes);
+	if (link_freq < 0) {
+		dev_err(csi2rx->dev, "Unable to calculate link frequency\n");
 		return link_freq;
+	}
 
 	ret = phy_mipi_dphy_get_default_config_for_hsclk(link_freq,
 							 csi2rx->num_lanes, cfg);
@@ -394,11 +411,7 @@ static int csi2rx_start(struct csi2rx_priv *csi2rx)
 					  csi2rx->num_pixels[i]),
 		       csi2rx->base + CSI2RX_STREAM_CFG_REG(i));
 
-		/*
-		 * Enable one virtual channel. When multiple virtual channels
-		 * are supported this will have to be changed.
-		 */
-		writel(CSI2RX_STREAM_DATA_CFG_VC_SELECT(0),
+		writel(csi2rx->vc_select[i],
 		       csi2rx->base + CSI2RX_STREAM_DATA_CFG_REG(i));
 
 		writel(CSI2RX_STREAM_CTRL_START,
@@ -486,18 +499,57 @@ static int csi2rx_log_status(struct v4l2_subdev *sd)
 	return 0;
 }
 
+static void csi2rx_update_vc_select(struct csi2rx_priv *csi2rx,
+				    struct v4l2_subdev_state *state)
+{
+	struct v4l2_mbus_frame_desc fd = {0};
+	struct v4l2_subdev_route *route;
+	unsigned int i;
+	int ret;
+
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &fd);
+	if (ret || fd.type != V4L2_MBUS_FRAME_DESC_TYPE_CSI2) {
+		dev_dbg(csi2rx->dev,
+			"Failed to get source frame desc, allowing only VC=0\n");
+		for (i = 0; i < CSI2RX_STREAMS_MAX; i++)
+			csi2rx->vc_select[i] = CSI2RX_STREAM_DATA_CFG_VC_SELECT(0);
+		return;
+	}
+
+	/* If source provides per-stream VC info, use it to filter by VC */
+	memset(csi2rx->vc_select, 0, sizeof(csi2rx->vc_select));
+
+	for_each_active_route(&state->routing, route) {
+		u32 cdns_stream = route->source_pad - CSI2RX_PAD_SOURCE_STREAM0;
+
+		for (i = 0; i < fd.num_entries; i++) {
+			if (fd.entry[i].stream != route->sink_stream)
+				continue;
+
+			csi2rx->vc_select[cdns_stream] |=
+				CSI2RX_STREAM_DATA_CFG_VC_SELECT(fd.entry[i].bus.csi2.vc);
+		}
+	}
+}
+
 static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 				 struct v4l2_subdev_state *state, u32 pad,
 				 u64 streams_mask)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	u64 sink_streams;
 	int ret;
 
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
+
 	/*
 	 * If we're not the first users, there's no need to
 	 * enable the whole controller.
 	 */
 	if (!csi2rx->count) {
+		csi2rx_update_vc_select(csi2rx, state);
 		ret = csi2rx_start(csi2rx);
 		if (ret)
 			return ret;
@@ -505,10 +557,11 @@ static int csi2rx_enable_streams(struct v4l2_subdev *subdev,
 
 	/* Start streaming on the source */
 	ret = v4l2_subdev_enable_streams(csi2rx->source_subdev, csi2rx->source_pad,
-					 BIT_U64(0));
+					 sink_streams);
 	if (ret) {
 		dev_err(csi2rx->dev,
-			"Failed to start streams %d on subdev\n", 0);
+			"Failed to start streams %#llx on subdev\n",
+			sink_streams);
 		if (!csi2rx->count)
 			csi2rx_stop(csi2rx);
 		return ret;
@@ -523,9 +576,14 @@ static int csi2rx_disable_streams(struct v4l2_subdev *subdev,
 				  u64 streams_mask)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	u64 sink_streams;
+
+	sink_streams = v4l2_subdev_state_xlate_streams(state, pad,
+						       CSI2RX_PAD_SINK,
+						       &streams_mask);
 
 	if (v4l2_subdev_disable_streams(csi2rx->source_subdev,
-					csi2rx->source_pad, BIT_U64(0))) {
+						 csi2rx->source_pad, sink_streams)) {
 		dev_err(csi2rx->dev, "Couldn't disable our subdev\n");
 	}
 
@@ -550,12 +608,56 @@ static int csi2rx_enum_mbus_code(struct v4l2_subdev *subdev,
 	return 0;
 }
 
+static int _csi2rx_set_routing(struct v4l2_subdev *subdev,
+			       struct v4l2_subdev_state *state,
+			       struct v4l2_subdev_krouting *routing)
+{
+	static const struct v4l2_mbus_framefmt format = {
+		.width = 640,
+		.height = 480,
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.field = V4L2_FIELD_NONE,
+		.colorspace = V4L2_COLORSPACE_SRGB,
+		.ycbcr_enc = V4L2_YCBCR_ENC_601,
+		.quantization = V4L2_QUANTIZATION_LIM_RANGE,
+		.xfer_func = V4L2_XFER_FUNC_SRGB,
+	};
+	int ret;
+
+	if (routing->num_routes > V4L2_FRAME_DESC_ENTRY_MAX)
+		return -EINVAL;
+
+	ret = v4l2_subdev_routing_validate(subdev, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	return v4l2_subdev_set_routing_with_fmt(subdev, state, routing, &format);
+}
+
+static int csi2rx_set_routing(struct v4l2_subdev *subdev,
+			      struct v4l2_subdev_state *state,
+			      enum v4l2_subdev_format_whence which,
+			      struct v4l2_subdev_krouting *routing)
+{
+	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	int ret;
+
+	if (which == V4L2_SUBDEV_FORMAT_ACTIVE && csi2rx->count)
+		return -EBUSY;
+
+	ret = _csi2rx_set_routing(subdev, state, routing);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
 static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 			  struct v4l2_subdev_state *state,
 			  struct v4l2_subdev_format *format)
 {
 	struct v4l2_mbus_framefmt *fmt;
-	unsigned int i;
 
 	/* No transcoding, source and sink formats must match. */
 	if (format->pad != CSI2RX_PAD_SINK)
@@ -567,14 +669,16 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 	format->format.field = V4L2_FIELD_NONE;
 
 	/* Set sink format */
-	fmt = v4l2_subdev_state_get_format(state, format->pad);
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
 	*fmt = format->format;
 
-	/* Propagate to source formats */
-	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++) {
-		fmt = v4l2_subdev_state_get_format(state, i);
-		*fmt = format->format;
-	}
+	/* Propagate to source format */
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
 
 	return 0;
 }
@@ -582,21 +686,22 @@ static int csi2rx_set_fmt(struct v4l2_subdev *subdev,
 static int csi2rx_init_state(struct v4l2_subdev *subdev,
 			     struct v4l2_subdev_state *state)
 {
-	struct v4l2_subdev_format format = {
-		.pad = CSI2RX_PAD_SINK,
-		.format = {
-			.width = 640,
-			.height = 480,
-			.code = MEDIA_BUS_FMT_UYVY8_1X16,
-			.field = V4L2_FIELD_NONE,
-			.colorspace = V4L2_COLORSPACE_SRGB,
-			.ycbcr_enc = V4L2_YCBCR_ENC_601,
-			.quantization = V4L2_QUANTIZATION_LIM_RANGE,
-			.xfer_func = V4L2_XFER_FUNC_SRGB,
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = CSI2RX_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = CSI2RX_PAD_SOURCE_STREAM0,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
 		},
 	};
 
-	return csi2rx_set_fmt(subdev, state, &format);
+	struct v4l2_subdev_krouting routing = {
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+
+	return _csi2rx_set_routing(subdev, state, &routing);
 }
 
 int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
@@ -604,25 +709,44 @@ int cdns_csi2rx_negotiate_ppc(struct v4l2_subdev *subdev, unsigned int pad,
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
 	const struct csi2rx_fmt *csi_fmt;
+	struct v4l2_subdev_route *route;
 	struct v4l2_subdev_state *state;
 	struct v4l2_mbus_framefmt *fmt;
+	int ret = 0;
 
 	if (!ppc || pad < CSI2RX_PAD_SOURCE_STREAM0 || pad >= CSI2RX_PAD_MAX)
 		return -EINVAL;
 
 	state = v4l2_subdev_lock_and_get_active_state(subdev);
-	fmt = v4l2_subdev_state_get_format(state, pad);
-	csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+	/* Check all streams on requested pad */
+	for_each_active_route(&state->routing, route) {
+		if (route->source_pad != pad)
+			continue;
+
+		fmt = v4l2_subdev_state_get_format(state, route->source_pad,
+						   route->source_stream);
+		if (!fmt) {
+			ret = -EPIPE;
+			*ppc = 1;
+			break;
+		}
 
-	/* Reduce requested PPC if it is too high */
-	*ppc = min(*ppc, csi_fmt->max_pixels);
+		csi_fmt = csi2rx_get_fmt_by_code(fmt->code);
+		if (!csi_fmt) {
+			ret = -EINVAL;
+			*ppc = 1;
+			break;
+		}
 
+		/* Reduce requested PPC if it is too high for this stream */
+		*ppc = min(*ppc, csi_fmt->max_pixels);
+	}
 	v4l2_subdev_unlock_state(state);
 
 	csi2rx->num_pixels[pad - CSI2RX_PAD_SOURCE_STREAM0] =
 		CSI2RX_STREAM_CFG_NUM_PIXELS(*ppc);
 
-	return 0;
+	return ret;
 }
 EXPORT_SYMBOL_FOR_MODULES(cdns_csi2rx_negotiate_ppc, "j721e-csi2rx");
 
@@ -630,17 +754,66 @@ static int csi2rx_get_frame_desc(struct v4l2_subdev *subdev, unsigned int pad,
 				 struct v4l2_mbus_frame_desc *fd)
 {
 	struct csi2rx_priv *csi2rx = v4l2_subdev_to_csi2rx(subdev);
+	struct v4l2_mbus_frame_desc source_fd = {0};
+	struct v4l2_subdev_route *route;
+	struct v4l2_subdev_state *state;
+	int ret;
+
+	ret = csi2rx_get_frame_desc_from_source(csi2rx, &source_fd);
+	if (ret)
+		return ret;
+
+	fd->type = V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
+
+	state = v4l2_subdev_lock_and_get_active_state(subdev);
+
+	for_each_active_route(&state->routing, route) {
+		struct v4l2_mbus_frame_desc_entry *source_entry = NULL;
+		unsigned int i;
+
+		if (route->source_pad != pad)
+			continue;
+
+		for (i = 0; i < source_fd.num_entries; i++) {
+			if (source_fd.entry[i].stream == route->sink_stream) {
+				source_entry = &source_fd.entry[i];
+				break;
+			}
+		}
+
+		if (!source_entry) {
+			dev_err(csi2rx->dev,
+				"Failed to find stream from source frame desc\n");
+			ret = -EPIPE;
+			goto err_missing_stream;
+		}
+
+		fd->entry[fd->num_entries].stream = route->source_stream;
+		fd->entry[fd->num_entries].flags = source_entry->flags;
+		fd->entry[fd->num_entries].length = source_entry->length;
+		fd->entry[fd->num_entries].pixelcode = source_entry->pixelcode;
+		fd->entry[fd->num_entries].bus.csi2.vc =
+			source_entry->bus.csi2.vc;
+		fd->entry[fd->num_entries].bus.csi2.dt =
+			source_entry->bus.csi2.dt;
 
-	return csi2rx_get_frame_desc_from_source(csi2rx, fd);
+		fd->num_entries++;
+	}
+
+err_missing_stream:
+	v4l2_subdev_unlock_state(state);
+
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops csi2rx_pad_ops = {
-	.enum_mbus_code	= csi2rx_enum_mbus_code,
-	.get_fmt	= v4l2_subdev_get_fmt,
-	.set_fmt	= csi2rx_set_fmt,
-	.enable_streams         = csi2rx_enable_streams,
-	.disable_streams        = csi2rx_disable_streams,
-	.get_frame_desc	= csi2rx_get_frame_desc,
+	.enum_mbus_code		= csi2rx_enum_mbus_code,
+	.get_fmt		= v4l2_subdev_get_fmt,
+	.set_fmt		= csi2rx_set_fmt,
+	.get_frame_desc		= csi2rx_get_frame_desc,
+	.set_routing		= csi2rx_set_routing,
+	.enable_streams		= csi2rx_enable_streams,
+	.disable_streams	= csi2rx_disable_streams,
 };
 
 static const struct v4l2_subdev_core_ops csi2rx_core_ops = {
@@ -876,7 +1049,8 @@ static int csi2rx_probe(struct platform_device *pdev)
 	csi2rx->pads[CSI2RX_PAD_SINK].flags = MEDIA_PAD_FL_SINK;
 	for (i = CSI2RX_PAD_SOURCE_STREAM0; i < CSI2RX_PAD_MAX; i++)
 		csi2rx->pads[i].flags = MEDIA_PAD_FL_SOURCE;
-	csi2rx->subdev.flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	csi2rx->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE |
+		V4L2_SUBDEV_FL_STREAMS;
 	csi2rx->subdev.entity.ops = &csi2rx_media_ops;
 
 	ret = media_entity_pads_init(&csi2rx->subdev.entity, CSI2RX_PAD_MAX,
-- 
2.34.1


