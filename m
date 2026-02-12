Return-Path: <linux-media+bounces-52633-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLTXOmmRjWl54QAAu9opvQ
	(envelope-from <linux-media+bounces-52633-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:38:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B36112B69C
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:38:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95E8F30FA27C
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:35:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C3952D63FC;
	Thu, 12 Feb 2026 08:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qyvJfl21"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011021.outbound.protection.outlook.com [40.93.194.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77AE12DC781;
	Thu, 12 Feb 2026 08:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885334; cv=fail; b=Fr1KXgEAvd7D+Qc9Xdkfzw6gSGtfg5r+GFw5eHSus5mE0Sp21SgtUWj1z2XW7oVHmjvuuC4wbV6EC+af53rtmmz5cmVI8HR/Hr0o0/Twl/TWOFV79CAnbDxBg6kv8E9523UTADa0w5x0Vsl9aqhLMglwxAnmykpMJ9zxfD2Eqx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885334; c=relaxed/simple;
	bh=u3J4Z+gkqU8OPbSnc3vuhzwIVBcUYcvjFVElrpOXHZI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f1KqGyM4nHAT6plJMFquQhVLimw25TBxe7oQY3gtB7Il6bgRoabigqNuFRjL1YE+lLZoKxPmhlI1/71vAaJL0iKA9rhThtYaUXXu7wY2MSVrI1B2Is5O4W+xbT8nUc/5ymfKRg0D1UwB8vZmEF9sqX1rjn7n40bMegEtzmJzp3c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qyvJfl21; arc=fail smtp.client-ip=40.93.194.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IWqZfH/yqvPzfjcz3s/beSORpvnFRg53y6goGvbwDnMUt6VqjfDEVj5mO1M/xdTLx5I3xhbiOljF/DP8q3Q9ihkjR/XBIGQNLoOVmNLVdeMKzkp7qPvCHeKGz620g6jlETVU4KcN5U9HnVs2ZnozJ4nYTfTh2nKRHF5p6gIffCtS1uRzQgkmmEacY1Qu339KLwo8zrqnchhLgcgujBf2yIlNlLmbrn9n2903IxibwWlr23htzDSqvQcHUIabTQkTj6lqZAgumLeFxNOuBopqp5TNHeNmTLcggxv/IP8Lnhb67qmZ/jnlCZherYJHIZ/Whqlc6Zi7tPtlMxOctT3NsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRddMZOOSiZw7iGGWpxtX3RI0tHloP75xpcG2EaHOj8=;
 b=VKumabos+3kj8jyeezBl+urkNIzgdEUbbZYniijA5/QnWrJN86/myQ5V944/Z06FGdrpzMy2vix/9aYuivElfHCE+MYJUtFWOe0zD9SZtqoYZ43wvqoyz3zE7eQfSL3XSN6vEmpGQVDWQ0eZ2LyA5EnCThfvGwR9Pg1AjN4kHPEidvI93RS7HAHXqfBbypTp/kSr/p3LiMoFeXwMHTWmD7PaecXZK+bhIrtE/5gJ+0M/hRw33IQEcpIsg7iQ7FwudmXJENENBU+h9Oikf+rQQNH291YH7m84gnEQrrajdFAm3nkqPu9fuNKCOVhMBJ7Fgkg2FAcvsfeJPGplwprg4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRddMZOOSiZw7iGGWpxtX3RI0tHloP75xpcG2EaHOj8=;
 b=qyvJfl21h2XN4xBG3+ubCMX/oGNZKD9P8cJXspJmiZl7jjVkfqA1KrTd0V4PBZPWop1mgT8UF4vc30MNQQD/3B5atF8mob/xq/qnoOBjPmuy8Zx6Q/KnkLGEKeiT4VJG7mf917sAT8I0momEtD9eLD2YevXEl3B2ZbvrsmDgSIs=
Received: from BL1PR13CA0351.namprd13.prod.outlook.com (2603:10b6:208:2c6::26)
 by CY8PR12MB7660.namprd12.prod.outlook.com (2603:10b6:930:84::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.10; Thu, 12 Feb
 2026 08:35:21 +0000
Received: from BL02EPF0001A103.namprd05.prod.outlook.com
 (2603:10b6:208:2c6:cafe::db) by BL1PR13CA0351.outlook.office365.com
 (2603:10b6:208:2c6::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 08:35:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A103.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 08:35:20 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 02:35:14 -0600
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <pratap.nirujogi@amd.com>, <benjamin.chan@amd.com>, <king.li@amd.com>,
	<gjorgji.rosikopulos@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Alexey
 Zagorodnikov" <xglooom@gmail.com>, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v8 6/7] media: platform: amd: isp4 debug fs logging and  more descriptive errors
Date: Thu, 12 Feb 2026 16:34:25 +0800
Message-ID: <20260212083426.216430-7-Bin.Du@amd.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260212083426.216430-1-Bin.Du@amd.com>
References: <20260212083426.216430-1-Bin.Du@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb07.amd.com (10.181.42.216) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0001A103:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 8932a450-d44f-4ff6-65a1-08de6a11a890
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7416014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aP3qOXw8ekL5vvy0/fF99ZYiJHhpSKhyNmmnFRcOf3MvOAhyZTh6n7jGokhN?=
 =?us-ascii?Q?KTz3nylNON8ysk6fmeSih1DXCV8kEoXM7rXIioZDcxYn1txbdLzOXmbXvZpV?=
 =?us-ascii?Q?ccvzvdqVdWXC089XYVA8MtNb9loOc6nzyojVPDqwAGceqLh7u3fyPvYxYW4S?=
 =?us-ascii?Q?JWShUgNEKZy/tDBcrkX52MAhghZy6FFHPLQfz7VcbfT5CprbT/lizNxzIJTw?=
 =?us-ascii?Q?93zEOfQE4RlNjUZyoJSkqmjjs7XiLaX3dQk4+b7MOC+jLc3LZeMhuRPf0xh0?=
 =?us-ascii?Q?MXU4kGIpJuvTHsVa6d+dAzD9HI2KG2XbaedEtbfl6JgtgRsnqSLdsLbtU9D9?=
 =?us-ascii?Q?vanTIC/qeVhZcluh8EOcxJ/O2GoDseJvqnm6aMgw/3kY6XITrBwkRTIOPVXr?=
 =?us-ascii?Q?NIFPBAyqm/IRNuHxXxIxeMr44tRg7GzQqtwRRQSp0b269BkwrlFh25uxkEGS?=
 =?us-ascii?Q?r47D2kmLYWI82tdq8QAkWkBX4ldm4Syd2n4zByoh1qyMfiffOHF8vPGEGMOp?=
 =?us-ascii?Q?Qj5/2W4jdcZjNERh5vZK8ItYAy6LKga8n8am7OlklDlRgnNe5xuY7UCPQk5z?=
 =?us-ascii?Q?uIwOv3uLMpkA1oNUyEsGm8kevJ6ulJLtd2CsO9UVykWYOVM21eHSkBtMq043?=
 =?us-ascii?Q?V26PxNldykXGSa+UInXJvTWlRZaeL9msHaLS3VAcZk4v/J44+I+UgPN3PUSt?=
 =?us-ascii?Q?ZSI4sUUImACis3Dc7cpL+wYvy6ayX7eMcoN5Ltk+izJxPxbBceN9gTWXSwJL?=
 =?us-ascii?Q?g7UIrsuwTWAvRO42wn6N/rXYCDYGyK43hmVTlgegG0kccMhpG6bXUoPgSG6p?=
 =?us-ascii?Q?mJv6P9K/1dEk4qLrAsxv1C41Tw1seVSVocMdTws1TNTMPnV/7F48O3qQMn5U?=
 =?us-ascii?Q?6NIF4Dss5YPGgenZxCEpH+MIBULmnetPiIRkDTHm93lq7p/UVTaMZfqJyE6p?=
 =?us-ascii?Q?gQspoed1bKXqxD/+4pXwdCauJDGDoPXTCleG8JsegLasknpGCQDoInbX7TGP?=
 =?us-ascii?Q?Y7fmA2hO/cXyVTMvt/mPX6DjgsGHDovbwEBbeuCcz/gpcsGKRpqVJ3ZiF4UO?=
 =?us-ascii?Q?4k5EGlyM+I7PzJDz2HazFNywx7Wf7u4sVqrv+DIKvQcYgeiQ65v73126eGrY?=
 =?us-ascii?Q?0nFTh1+kFqU05gaNgMXlZkIXBjs+VqWHG0GNYV2NgJpgVDACz2SvoP5IGpsV?=
 =?us-ascii?Q?GIQtKbL5VWQDIVd9JkeunfMmSX6GzLFFTNE6Pkc8IHX1grJkc2CiMp4PYmTx?=
 =?us-ascii?Q?bm5EpLaZ/mmYdiDT0UdfPeVg2XLdn8GXo7cZEo4hzeTWHM6zt76QwUPvM+P3?=
 =?us-ascii?Q?BdYgTtKXF3EJXB9Ap5SwmdjQwN6pUiY0nkADtyL864TnTaM8b9pjO8KbsoXB?=
 =?us-ascii?Q?XYzEFCcbvOHzO6qjSKTSoi7Ibn6DucHEFh/JXCFcPfUrr5WUOOO6AKK6YuAY?=
 =?us-ascii?Q?O16TFklOOE+xhCKfkynlmjDHuR9aFGUirJd75g9Zfg8jPYcx3IOEqWkXlwi8?=
 =?us-ascii?Q?WcaogdW7zW1DF/xodNu2syqDmH3UfxgWIpV8WCTO7EA5kDcpMe6kk33ctV8d?=
 =?us-ascii?Q?ISmIW5Du/qgEKPkoKlaaL2fMQJDtt9pZdZllp9KM37AISKzc+3RZDxhgcFbl?=
 =?us-ascii?Q?pOCn9ZLxwmnJ983MeNorR/LtdyVcRmhqq7EA4Syz+TnFxL5ud5ksN8czXhZN?=
 =?us-ascii?Q?6s7OFg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hdENU9SY3ADk4T89D38+TAPLftKuBXeau7Z1lIkJULwOERO3iHylvXzRD3sxEBdPRLTrW9T7tm40oqKIdO3ruW/jf5MOc4G+jbk9AEsuPBUGWNhJzFPG439f9SB8kffbbM71Les3S0+MY7HNEMApctPrtFGhr0zL3mGWb2VqcVC3H+lgiNcu7er87Sgf5Bp1YUidASZnwHLCZwoWiMnqLl4GMN41imR35oe/QaZL29W8Tl52QJubYRw8Vq0+DznpknqyzK3PqG7DOpQp0h+49ER5sjT8n2s+wThXXRCn3hF2QGXm6uogV0BJdNhtZB85S+IQB3sgoMBnY0rk47AYuP55ciobRZQPgZ3tRrVlgGAqVJWQAx9hZNDQRVFKP/nSoMAx3ygEhiq8yZhFe4QMQuc1xa4jUR6tO6oSb32izvAvbahRZW42i76TQRkn9X8C
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:35:20.7774
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8932a450-d44f-4ff6-65a1-08de6a11a890
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A103.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52633-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,kerneltoast.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,cmd_ch_en.ch:url];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6B36112B69C
X-Rspamd-Action: no action

Add debug fs for isp4 driver and add more detailed descriptive error info
to some of the log message

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                                   |   2 +
 drivers/media/platform/amd/isp4/Makefile      |   3 +-
 drivers/media/platform/amd/isp4/isp4.c        |   4 +
 drivers/media/platform/amd/isp4/isp4_debug.c  | 271 ++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4_debug.h  |  41 +++
 .../media/platform/amd/isp4/isp4_interface.c  |  25 +-
 drivers/media/platform/amd/isp4/isp4_subdev.c |  29 +-
 drivers/media/platform/amd/isp4/isp4_subdev.h |   5 +
 8 files changed, 360 insertions(+), 20 deletions(-)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4_debug.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 80c966fde0b4..8478789ac265 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,6 +1145,8 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_debug.c
+F:	drivers/media/platform/amd/isp4/isp4_debug.h
 F:	drivers/media/platform/amd/isp4/isp4_fw_cmd_resp.h
 F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 F:	drivers/media/platform/amd/isp4/isp4_interface.c
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
index 3fa0ee6d8a96..3849062e17f3 100644
--- a/drivers/media/platform/amd/isp4/Makefile
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -4,6 +4,7 @@
 
 obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
 amd_isp4_capture-objs := isp4.o \
+                         isp4_debug.o \
                          isp4_interface.o \
                          isp4_subdev.o \
-                         isp4_video.o
\ No newline at end of file
+                         isp4_video.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
index 9480dfffbcb2..bf6b8e26c2c0 100644
--- a/drivers/media/platform/amd/isp4/isp4.c
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -9,6 +9,7 @@
 #include <media/v4l2-ioctl.h>
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_hw_reg.h"
 
 #define ISP4_DRV_NAME "amd_isp_capture"
@@ -191,6 +192,7 @@ static int isp4_capture_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, isp_dev);
+	isp_debugfs_create(isp_dev);
 
 	return 0;
 
@@ -210,6 +212,8 @@ static void isp4_capture_remove(struct platform_device *pdev)
 	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
 	struct device *dev = &pdev->dev;
 
+	isp_debugfs_remove(isp_dev);
+
 	media_device_unregister(&isp_dev->mdev);
 	isp4sd_deinit(&isp_dev->isp_subdev);
 	pm_runtime_disable(dev);
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.c b/drivers/media/platform/amd/isp4/isp4_debug.c
new file mode 100644
index 000000000000..2fc00fc9a194
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.c
@@ -0,0 +1,271 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include "isp4.h"
+#include "isp4_debug.h"
+#include "isp4_hw_reg.h"
+#include "isp4_interface.h"
+
+#define ISP4DBG_FW_LOG_RINGBUF_SIZE (2 * 1024 * 1024)
+#define ISP4DBG_MACRO_2_STR(X) #X
+#define ISP4DBG_ONE_TIME_LOG_LEN 510
+
+#ifdef CONFIG_DEBUG_FS
+
+void isp_debugfs_create(struct isp4_device *isp_dev)
+{
+	isp_dev->isp_subdev.debugfs_dir = debugfs_create_dir("amd_isp4", NULL);
+	debugfs_create_bool("fw_log_enable", 0644,
+			    isp_dev->isp_subdev.debugfs_dir,
+			    &isp_dev->isp_subdev.enable_fw_log);
+	isp_dev->isp_subdev.fw_log_output =
+		devm_kzalloc(isp_dev->isp_subdev.dev,
+			     ISP4DBG_FW_LOG_RINGBUF_SIZE + 32,
+			     GFP_KERNEL);
+}
+
+void isp_debugfs_remove(struct isp4_device *isp_dev)
+{
+	debugfs_remove_recursive(isp_dev->isp_subdev.debugfs_dir);
+	isp_dev->isp_subdev.debugfs_dir = NULL;
+}
+
+static u32 isp_fw_fill_rb_log(struct isp4_subdev *isp, void *sys, u32 rb_size)
+{
+	struct isp4_interface *ispif = &isp->ispif;
+	char *buf = isp->fw_log_output;
+	struct device *dev = isp->dev;
+	u32 rd_ptr, wr_ptr;
+	u32 total_cnt = 0;
+	u32 offset = 0;
+	u32 cnt;
+
+	if (!sys || !rb_size)
+		return 0;
+
+	guard(mutex)(&ispif->isp4if_mutex);
+
+	rd_ptr = isp4hw_rreg(isp->mmio, ISP_LOG_RB_RPTR0);
+	wr_ptr = isp4hw_rreg(isp->mmio, ISP_LOG_RB_WPTR0);
+
+	do {
+		if (wr_ptr > rd_ptr)
+			cnt = wr_ptr - rd_ptr;
+		else if (wr_ptr < rd_ptr)
+			cnt = rb_size - rd_ptr;
+		else
+			goto quit;
+
+		if (cnt > rb_size) {
+			dev_err(dev, "fail bad fw log size %u\n", cnt);
+			goto quit;
+		}
+
+		memcpy(buf + offset, sys + rd_ptr, cnt);
+
+		offset += cnt;
+		total_cnt += cnt;
+		rd_ptr = (rd_ptr + cnt) % rb_size;
+	} while (rd_ptr < wr_ptr);
+
+	isp4hw_wreg(isp->mmio, ISP_LOG_RB_RPTR0, rd_ptr);
+
+quit:
+	return total_cnt;
+}
+
+void isp_fw_log_print(struct isp4_subdev *isp)
+{
+	struct isp4_interface *ispif = &isp->ispif;
+	char *fw_log_buf = isp->fw_log_output;
+	u32 cnt;
+
+	if (!isp->enable_fw_log || !fw_log_buf)
+		return;
+
+	cnt = isp_fw_fill_rb_log(isp, ispif->fw_log_buf->sys_addr,
+				 ispif->fw_log_buf->mem_size);
+
+	if (cnt) {
+		char temp_ch;
+		char *str;
+		char *end;
+		/* line end */
+		char *le;
+
+		str = (char *)fw_log_buf;
+		end = ((char *)fw_log_buf + cnt);
+		fw_log_buf[cnt] = 0;
+
+		while (str < end) {
+			le = strchr(str, 0x0A);
+			if ((le && str + ISP4DBG_ONE_TIME_LOG_LEN >= le) ||
+			    (!le && str + ISP4DBG_ONE_TIME_LOG_LEN >= end)) {
+				if (le)
+					*le = 0;
+
+				if (*str != '\0')
+					dev_dbg(isp->dev, "%s", str);
+
+				if (le) {
+					*le = 0x0A;
+					str = le + 1;
+				} else {
+					break;
+				}
+			} else {
+				u32 tmp_len = ISP4DBG_ONE_TIME_LOG_LEN;
+
+				temp_ch = str[tmp_len];
+				str[tmp_len] = 0;
+				dev_dbg(isp->dev, "%s", str);
+				str[tmp_len] = temp_ch;
+				str = &str[tmp_len];
+			}
+		}
+	}
+}
+#endif
+
+char *isp4dbg_get_buf_src_str(u32 src)
+{
+	switch (src) {
+	case ISP4FW_BUFFER_SOURCE_STREAM:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_SOURCE_STREAM);
+	default:
+		return "Unknown buf source";
+	}
+}
+
+char *isp4dbg_get_buf_done_str(u32 status)
+{
+	switch (status) {
+	case ISP4FW_BUFFER_STATUS_INVALID:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_INVALID);
+	case ISP4FW_BUFFER_STATUS_SKIPPED:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_SKIPPED);
+	case ISP4FW_BUFFER_STATUS_EXIST:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_EXIST);
+	case ISP4FW_BUFFER_STATUS_DONE:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_DONE);
+	case ISP4FW_BUFFER_STATUS_LACK:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_LACK);
+	case ISP4FW_BUFFER_STATUS_DIRTY:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_DIRTY);
+	case ISP4FW_BUFFER_STATUS_MAX:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_STATUS_MAX);
+	default:
+		return "Unknown Buf Done Status";
+	}
+}
+
+char *isp4dbg_get_img_fmt_str(int fmt /* enum isp4fw_image_format * */)
+{
+	switch (fmt) {
+	case ISP4FW_IMAGE_FORMAT_NV12:
+		return "NV12";
+	case ISP4FW_IMAGE_FORMAT_YUV422INTERLEAVED:
+		return "YUV422INTERLEAVED";
+	default:
+		return "unknown fmt";
+	}
+}
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre,
+			       void *in, void *orig_buf)
+{
+	struct isp4fw_buffer_meta_info *p;
+	struct isp4if_img_buf_info *orig;
+
+	if (!in)
+		return;
+
+	if (!pre)
+		pre = "";
+
+	p = in;
+	orig = orig_buf;
+
+	dev_dbg(dev, "%s(%s) en:%d,stat:%s(%u),src:%s\n", pre,
+		isp4dbg_get_img_fmt_str(p->image_prop.image_format),
+		p->enabled, isp4dbg_get_buf_done_str(p->status), p->status,
+		isp4dbg_get_buf_src_str(p->source));
+
+	dev_dbg(dev, "%p,0x%llx(%u) %p,0x%llx(%u) %p,0x%llx(%u)\n",
+		orig->planes[0].sys_addr, orig->planes[0].mc_addr,
+		orig->planes[0].len, orig->planes[1].sys_addr,
+		orig->planes[1].mc_addr, orig->planes[1].len,
+		orig->planes[2].sys_addr, orig->planes[2].mc_addr,
+		orig->planes[2].len);
+}
+
+char *isp4dbg_get_buf_type(u32 type)
+{
+	/* enum isp4fw_buffer_type */
+	switch (type) {
+	case ISP4FW_BUFFER_TYPE_PREVIEW:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_TYPE_PREVIEW);
+	case ISP4FW_BUFFER_TYPE_META_INFO:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_TYPE_META_INFO);
+	case ISP4FW_BUFFER_TYPE_MEM_POOL:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_BUFFER_TYPE_MEM_POOL);
+	default:
+		return "unknown type";
+	}
+}
+
+char *isp4dbg_get_cmd_str(u32 cmd)
+{
+	switch (cmd) {
+	case ISP4FW_CMD_ID_START_STREAM:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_START_STREAM);
+	case ISP4FW_CMD_ID_STOP_STREAM:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_STOP_STREAM);
+	case ISP4FW_CMD_ID_SEND_BUFFER:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_SEND_BUFFER);
+	case ISP4FW_CMD_ID_SET_STREAM_CONFIG:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_SET_STREAM_CONFIG);
+	case ISP4FW_CMD_ID_SET_OUT_CHAN_PROP:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_SET_OUT_CHAN_PROP);
+	case ISP4FW_CMD_ID_ENABLE_OUT_CHAN:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_CMD_ID_ENABLE_OUT_CHAN);
+	default:
+		return "unknown cmd";
+	}
+}
+
+char *isp4dbg_get_resp_str(u32 cmd)
+{
+	switch (cmd) {
+	case ISP4FW_RESP_ID_CMD_DONE:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_RESP_ID_CMD_DONE);
+	case ISP4FW_RESP_ID_NOTI_FRAME_DONE:
+		return ISP4DBG_MACRO_2_STR(ISP4FW_RESP_ID_NOTI_FRAME_DONE);
+	default:
+		return "unknown respid";
+	}
+}
+
+char *isp4dbg_get_if_stream_str(u32 stream /* enum fw_cmd_resp_stream_id */)
+{
+	switch (stream) {
+	case ISP4IF_STREAM_ID_GLOBAL:
+		return "STREAM_GLOBAL";
+	case ISP4IF_STREAM_ID_1:
+		return "STREAM1";
+	default:
+		return "unknown streamID";
+	}
+}
+
+char *isp4dbg_get_out_ch_str(int ch /* enum isp4fw_pipe_out_ch */)
+{
+	switch ((enum isp4fw_pipe_out_ch)ch) {
+	case ISP4FW_ISP_PIPE_OUT_CH_PREVIEW:
+		return "prev";
+	default:
+		return "unknown channel";
+	}
+}
diff --git a/drivers/media/platform/amd/isp4/isp4_debug.h b/drivers/media/platform/amd/isp4/isp4_debug.h
new file mode 100644
index 000000000000..d1262e03ae64
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_debug.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_DEBUG_H_
+#define _ISP4_DEBUG_H_
+
+#include <linux/dev_printk.h>
+#include <linux/printk.h>
+
+#include "isp4_subdev.h"
+
+#ifdef CONFIG_DEBUG_FS
+struct isp4_device;
+
+void isp_debugfs_create(struct isp4_device *isp_dev);
+void isp_debugfs_remove(struct isp4_device *isp_dev);
+void isp_fw_log_print(struct isp4_subdev *isp);
+
+#else
+
+/* to avoid checkpatch warning */
+#define isp_debugfs_create(cam) ((void)(cam))
+#define isp_debugfs_remove(cam) ((void)(cam))
+#define isp_fw_log_print(isp) ((void)(isp))
+
+#endif /* CONFIG_DEBUG_FS */
+
+void isp4dbg_show_bufmeta_info(struct device *dev, char *pre, void *p,
+			       void *orig_buf /* struct sys_img_buf_handle */);
+char *isp4dbg_get_img_fmt_str(int fmt /* enum _image_format_t */);
+char *isp4dbg_get_out_ch_str(int ch /* enum _isp_pipe_out_ch_t */);
+char *isp4dbg_get_cmd_str(u32 cmd);
+char *isp4dbg_get_buf_type(u32 type);/* enum _buffer_type_t */
+char *isp4dbg_get_resp_str(u32 resp);
+char *isp4dbg_get_buf_src_str(u32 src);
+char *isp4dbg_get_buf_done_str(u32 status);
+char *isp4dbg_get_if_stream_str(u32 stream);
+
+#endif /* _ISP4_DEBUG_H_ */
diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index c1a25f45987f..87dcbb669832 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -5,6 +5,7 @@
 
 #include <linux/iopoll.h>
 
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_hw_reg.h"
 #include "isp4_interface.h"
@@ -299,8 +300,9 @@ static int isp4if_insert_isp_fw_cmd(struct isp4_interface *ispif,
 	wr_ptr = isp4hw_rreg(ispif->mmio, wreg);
 	if (rd_ptr >= len || wr_ptr >= len) {
 		dev_err(dev,
-			"rb invalid: stream=%u, rd=%u, wr=%u, len=%u, cmd_sz=%u\n",
-			stream, rd_ptr, wr_ptr, len, cmd_sz);
+			"rb invalid: stream=%u(%s), rd=%u, wr=%u, len=%u, cmd_sz=%u\n",
+			stream, isp4dbg_get_if_stream_str(stream), rd_ptr,
+			wr_ptr, len, cmd_sz);
 		return -EINVAL;
 	}
 
@@ -388,8 +390,9 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 						 rb_config->reg_wptr);
 
 			dev_err(dev,
-				"fail to get free cmdq slot, stream (%d),rd %u, wr %u\n",
-				stream, rd_ptr, wr_ptr);
+				"failed to get free cmdq slot, stream %s(%d),rd %u, wr %u\n",
+				isp4dbg_get_if_stream_str(stream), stream,
+				rd_ptr, wr_ptr);
 			ret = -ETIMEDOUT;
 			goto free_ele;
 		}
@@ -415,8 +418,8 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 		ret = isp4if_insert_isp_fw_cmd(ispif, stream, &cmd);
 		if (ret) {
 			dev_err(dev,
-				"fail for insert_isp_fw_cmd cmd_id (0x%08x)\n",
-				cmd_id);
+				"fail for insert_isp_fw_cmd cmd_id %s(0x%08x)\n",
+				isp4dbg_get_cmd_str(cmd_id), cmd_id);
 			goto err_dequeue_ele;
 		}
 	}
@@ -674,8 +677,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 	if (checksum != resp->resp_check_sum) {
 		dev_err(dev, "resp checksum 0x%x,should 0x%x,rptr %u,wptr %u\n",
 			checksum, resp->resp_check_sum, rd_ptr, wr_ptr);
-		dev_err(dev, "(%u), seqNo %u, resp_id (0x%x)\n",
-			stream, resp->resp_seq_num,
+		dev_err(dev, "%s(%u), seqNo %u, resp_id %s(0x%x)\n",
+			isp4dbg_get_if_stream_str(stream), stream,
+			resp->resp_seq_num, isp4dbg_get_resp_str(resp->resp_id),
 			resp->resp_id);
 		return -EINVAL;
 	}
@@ -684,8 +688,9 @@ int isp4if_f2h_resp(struct isp4_interface *ispif, enum isp4if_stream_id stream,
 
 err_rb_invalid:
 	dev_err(dev,
-		"rb invalid: stream=%u, rd=%u, wr=%u, len=%u, resp_sz=%u\n",
-		stream, rd_ptr, wr_ptr, len, resp_sz);
+		"rb invalid: stream=%u(%s), rd=%u, wr=%u, len=%u, resp_sz=%u\n",
+		stream, isp4dbg_get_if_stream_str(stream), rd_ptr, wr_ptr, len,
+		resp_sz);
 	return -EINVAL;
 }
 
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
index 5202232d50c5..48deea79ce6c 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.c
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
@@ -7,6 +7,7 @@
 #include <linux/units.h>
 
 #include "isp4.h"
+#include "isp4_debug.h"
 #include "isp4_fw_cmd_resp.h"
 #include "isp4_interface.h"
 
@@ -263,9 +264,9 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return -EINVAL;
 	}
 
-	dev_dbg(dev, "channel:%d,fmt %d,w:h=%u:%u,lp:%u,cp%u\n",
-		cmd_ch_prop.ch,
-		cmd_ch_prop.image_prop.image_format,
+	dev_dbg(dev, "channel:%s,fmt %s,w:h=%u:%u,lp:%u,cp%u\n",
+		isp4dbg_get_out_ch_str(cmd_ch_prop.ch),
+		isp4dbg_get_img_fmt_str(cmd_ch_prop.image_prop.image_format),
 		cmd_ch_prop.image_prop.width, cmd_ch_prop.image_prop.height,
 		cmd_ch_prop.image_prop.luma_pitch,
 		cmd_ch_prop.image_prop.chroma_pitch);
@@ -294,7 +295,8 @@ static int isp4sd_setup_output(struct isp4_subdev *isp_subdev,
 		return ret;
 	}
 
-	dev_dbg(dev, "enable channel %d\n", cmd_ch_en.ch);
+	dev_dbg(dev, "enable channel %s\n",
+		isp4dbg_get_out_ch_str(cmd_ch_en.ch));
 
 	if (!sensor_info->start_stream_cmd_sent) {
 		ret = isp4sd_kickoff_stream(isp_subdev,
@@ -381,8 +383,9 @@ static void isp4sd_fw_resp_cmd_done(struct isp4_subdev *isp_subdev,
 		isp4if_rm_cmd_from_cmdq(ispif, para->cmd_seq_num, para->cmd_id);
 	struct device *dev = isp_subdev->dev;
 
-	dev_dbg(dev, "stream %d,cmd (0x%08x)(%d),seq %u, ele %p\n",
+	dev_dbg(dev, "stream %d,cmd %s(0x%08x)(%d),seq %u, ele %p\n",
 		stream_id,
+		isp4dbg_get_cmd_str(para->cmd_id),
 		para->cmd_id, para->cmd_status, para->cmd_seq_num,
 		ele);
 
@@ -458,8 +461,9 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 		return;
 	}
 
-	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,status:%i\n",
+	dev_dbg(dev, "ts:%llu,streamId:%d,poc:%u,preview_en:%u,status:%s(%i)\n",
 		ktime_get_ns(), stream_id, meta->poc, meta->preview.enabled,
+		isp4dbg_get_buf_done_str(meta->preview.status),
 		meta->preview.status);
 
 	if (meta->preview.enabled &&
@@ -468,6 +472,8 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 	     meta->preview.status == ISP4FW_BUFFER_STATUS_DIRTY)) {
 		prev = isp4if_dequeue_buffer(ispif);
 		if (prev) {
+			isp4dbg_show_bufmeta_info(dev, "prev", &meta->preview,
+						  &prev->buf_info);
 			isp4vid_handle_frame_done(&isp_subdev->isp_vdev,
 						  &prev->buf_info);
 			isp4if_dealloc_buffer_node(prev);
@@ -475,8 +481,9 @@ static void isp4sd_fw_resp_frame_done(struct isp4_subdev *isp_subdev,
 			dev_err(dev, "fail null prev buf\n");
 		}
 	} else if (meta->preview.enabled) {
-		dev_err(dev, "fail bad preview status %u\n",
-			meta->preview.status);
+		dev_err(dev, "fail bad preview status %u(%s)\n",
+			meta->preview.status,
+			isp4dbg_get_buf_done_str(meta->preview.status));
 	}
 
 	if (isp_subdev->sensor_info.status == ISP4SD_START_STATUS_STARTED)
@@ -493,6 +500,9 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 	struct device *dev = isp_subdev->dev;
 	struct isp4fw_resp resp;
 
+	if (stream_id == ISP4IF_STREAM_ID_1)
+		isp_fw_log_print(isp_subdev);
+
 	while (true) {
 		if (isp4if_f2h_resp(ispif, stream_id, &resp)) {
 			/* Re-enable the interrupt */
@@ -522,7 +532,8 @@ static void isp4sd_fw_resp_func(struct isp4_subdev *isp_subdev,
 						  &resp.param.frame_done);
 			break;
 		default:
-			dev_err(dev, "-><- fail respid (0x%x)\n",
+			dev_err(dev, "-><- fail respid %s(0x%x)\n",
+				isp4dbg_get_resp_str(resp.resp_id),
 				resp.resp_id);
 			break;
 		}
diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.h b/drivers/media/platform/amd/isp4/isp4_subdev.h
index ddf6bdf4a62a..20ea08a830af 100644
--- a/drivers/media/platform/amd/isp4/isp4_subdev.h
+++ b/drivers/media/platform/amd/isp4/isp4_subdev.h
@@ -109,6 +109,11 @@ struct isp4_subdev {
 	bool irq_enabled;
 	/* spin lock to access ISP_SYS_INT0_EN exclusively */
 	spinlock_t irq_lock;
+#ifdef CONFIG_DEBUG_FS
+	bool enable_fw_log;
+	struct dentry *debugfs_dir;
+	char *fw_log_output;
+#endif
 };
 
 int isp4sd_init(struct isp4_subdev *isp_subdev, struct v4l2_device *v4l2_dev,
-- 
2.34.1


