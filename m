Return-Path: <linux-media+bounces-52629-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 0ICsGwGRjWl54QAAu9opvQ
	(envelope-from <linux-media+bounces-52629-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:36:17 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DA48612B631
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:36:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B907B30A5CC6
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 335D327A476;
	Thu, 12 Feb 2026 08:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NC6kmAxU"
X-Original-To: linux-media@vger.kernel.org
Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010050.outbound.protection.outlook.com [52.101.193.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F262D63FC;
	Thu, 12 Feb 2026 08:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885306; cv=fail; b=bISnBc/+N43KP/dwhbr3lsjNJ6cigKqzFhd0AQJlqy3FV7K3PH6lUKaEI59SdqY8x2bhUti3mgCISRNDfaRFebGr03uFDOxJXXSmFbMMyGH2n8KXq4F1hnYN3cq+fJDqsstNVgDNtS8kIwRW2rBhkZdQ+T2uYmWhMzjnCamtro4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885306; c=relaxed/simple;
	bh=UZKMJIQMkoWXnbLs7HZ8aZMvGiKgBmySJHFblgw414k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RxOOjcVTPv9KjCKptQOOflkGs9Qh6NXhguclUtP30w+8zOSkSv6KfRmZcHHAB4uzMfU0rJYY8nSrAg6bWUicjGU9maI99O9dzopDkgdv1MLwEhNeUXWunCp02Yw93VsW0f8jsH7rnbvYWacE81EcwEqO+49MfmMPgY8OzHoc2vE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NC6kmAxU; arc=fail smtp.client-ip=52.101.193.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZlzmpCaj3N2cN/D6Y4UloBkpMXINtmjNtqJfd23801SQBzh+nTBEC+ah9EIP760K0K8DJXEODuaghOcVp8Eq3j/bc7GWOq2n7FClc5R82J45Ko7LAEU3TKAxrM7rLC51qkFmRVtvaxhWdBWZI3RrnZYw2HETj/YpsEvFo+ZF64PrXA2H/J/YVDdIfj/fajvPSVsGT4aJKJg1qcckpK4CNdP+/OAFKcRswOfMtXgQWGyDqeK+GuMdr1mVSUIjAjzxo+of8lxvJYb6+R+qiV09DE6jB1YH39GnWhgF2bRr4KQw5FoeLq9OkP+ym1vxuDy1RWFBsnurJv33Y5ti63W4hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t4FPtJVaEQ0IeEFVybSiUYncZJIIBrSmQA7Udkxbsjo=;
 b=C1xObV8WrD6zsum4iO4g341dSGM+EtXPglDGq1uhOwoDxc1n3KeyZdglHAIDpX5gAv5KtMGBhlBoO7Bc/wHGI+PqtPFIsNIsNxYP7hEUQHKdhoKlXBxK03T2OaWziMhsotZzm9RVqQnywpQh2n7//Sbh6H6yzr7jb+CWEERGlR2m1B0NmRjEBbaOGDEbxWNQTPTRyEAeqshg2piOLI2RKMV1tOa9fWACqa/kbTaF56VBZMEtkMKYBYaApTLtNDA2tFCwpx93NiKRGUD4uP3iPyNOFVlYdR+fPDNoA0ZuCV+wPD9PZ13Fopy4rMli7NfQG193/O/X81IVSY4crzq2dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t4FPtJVaEQ0IeEFVybSiUYncZJIIBrSmQA7Udkxbsjo=;
 b=NC6kmAxUGQiEkQaLnUKSn4d2GNM2r+Fv1Uv5N8EXLoFppltRdsGHG/fFqtJBqd+gP8tk4rNuaOU7Jb5PWF9HPTsRucdI5R1LNmL8kKd9+3BE3QwX8Teh+DSiKpI3DTPPgwRLTVXgzR2oEIAIGyLD3kNxEyl6TePlhRTZ4mPBzAg=
Received: from BL1PR13CA0301.namprd13.prod.outlook.com (2603:10b6:208:2c1::6)
 by DS7PR12MB8251.namprd12.prod.outlook.com (2603:10b6:8:e3::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.11; Thu, 12 Feb 2026 08:34:59 +0000
Received: from BL02EPF0001A106.namprd05.prod.outlook.com
 (2603:10b6:208:2c1:cafe::7a) by BL1PR13CA0301.outlook.office365.com
 (2603:10b6:208:2c1::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.10 via Frontend Transport; Thu,
 12 Feb 2026 08:35:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A106.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 08:34:59 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 02:34:53 -0600
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
Subject: [PATCH v8 2/7] media: platform: amd: low level support for isp4 firmware
Date: Thu, 12 Feb 2026 16:34:21 +0800
Message-ID: <20260212083426.216430-3-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A106:EE_|DS7PR12MB8251:EE_
X-MS-Office365-Filtering-Correlation-Id: 4207dadd-91b6-440b-decc-08de6a119bda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700013|376014|7416014|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?MjWQ+DWKN2eYwHxAM7Cgyhdu7fkZdMtG+jvZOsz7+44R8wFNeo0DO++YJBYP?=
 =?us-ascii?Q?ga7q0Bbo/5D/92M1f4AGAFNDz4//QJo+8+RNNFQAIu6KQAWv0AKrXPrlOzl6?=
 =?us-ascii?Q?6nJ2lpZzJHvumXHuAWK+mh9dQulq6VgVnfX1ipkvIPCqEQI9YfXtTowO4b3a?=
 =?us-ascii?Q?VsKbwwa527vkgcyk7CN/qG1GvMUGi96RW5ALEpuCmqA2gcEjWyxtzTPRPE6c?=
 =?us-ascii?Q?LY6ziuMtzc2NB+V2kSN9oqcSVbaVmZKJ39TDt+S5f+XJeOVWjVb2H/tz0c/k?=
 =?us-ascii?Q?pjAYaWCYtUb/J/LtQPysjMmMwO8oIyYC0ksn/k9iElZYmxMbWtad1xJzqaDL?=
 =?us-ascii?Q?po6MGw8Uz/BqtM0ZMu6JuUU2OiuzMjmzNYjM7Dtto0p/44k6UWFmeJxDY6Mx?=
 =?us-ascii?Q?991PXydt20FKowKKJq+qC9OMzmjmgYTbYch9fWdztIszWPPuEpRotqZmzFrG?=
 =?us-ascii?Q?33jeylcWL1TtVezb0v4kvPKTXnyoQub/0JsylLOx5pKrvSLNO4bAQly1Va33?=
 =?us-ascii?Q?uPw0msNEnc9enlANkjmGx4+5UVThDV5MDEZncAsVis/zK6GouSU9G/E8Pjx4?=
 =?us-ascii?Q?3/Zsn0vWnuCI7LD0detOkHJBT+UT4JphRoPth5FRSFR1G7YsaXBqtxrCq25j?=
 =?us-ascii?Q?4lAFsuVosflOqkHYLDocKvyd0bL8D8/gvd73LnUHv0i+M4aTTZEOQtbkovD/?=
 =?us-ascii?Q?UwSsB/HJICNC7Vsdtn2ALMnfH8PcdinE9qLILLt53w6Mga7+5qXD1KVOqTnI?=
 =?us-ascii?Q?H232jQDRZKdGmL43qF56iTO6LUs/oPTZX1mgvwvDEn6Fi6ssiNLGNwtDurDV?=
 =?us-ascii?Q?bQN3/i8+TNJd0BeHhEmrm6ShYXd/Bfw69+cKKW/VWNVBKpR7jHCny5CCWmRV?=
 =?us-ascii?Q?f95cdPh144qu0ZbDaij+qaNntjAih377RvYWTS3T7oY2j4Ig5jwjFBLaBViN?=
 =?us-ascii?Q?Osa14oojeBhN5M0EIyxB/8RUFNHECqDelHePheIxctZPWuiistsVZ091CGXy?=
 =?us-ascii?Q?ZwJKvnEMC1T848Bna8IA0Tg/ZHf4JYoj8pw2yoNZebPmZRxZQxnd4lQC1jQ6?=
 =?us-ascii?Q?qiiQJL8ZfxgDYH6Fz/diZz/lWBpGJVxPWO6egKW5P7aLWu4J5fqs9MwcAhBt?=
 =?us-ascii?Q?WhFITmaa1Ljz64LaSAcZp5itf/f8/8VXRP1Oiau0EbJj9/3mcfy58IVOS8aX?=
 =?us-ascii?Q?E6FWUDTaeuwHUQpZ4idDigTtySJ293nUimYF97jILYWpNZ88dWTh5YcWJait?=
 =?us-ascii?Q?bhKl5NQJ4AQ+xZG+ErjfiXJj6D+PgdngkJcx3Ag7R5UmeydU2UqK8KkPjG6Y?=
 =?us-ascii?Q?Ze8oObP6e62WoEv7W/SBjivlq6Gp6WZ+IOn20eU1sjSQpQvNQoIk1GMV70CV?=
 =?us-ascii?Q?ogihozQEwXVhrLPa4y7jpXIh1p7d2TjK1qEDMy/Byj4l0M6e/Ljdl7q5ByrP?=
 =?us-ascii?Q?rqWO5JHFkI95FcRemz8sjEdDTgbwLp7WqTySxz7FEi+4/jtsrR3E8/TyIZuo?=
 =?us-ascii?Q?h0qGbHuWxFMftC99IYxZmmgREsi86RTa6nDgc3Ga5AhjUWKcLsqOJi7bg6if?=
 =?us-ascii?Q?bbpsNtBHF7az+KqQAOLfcydyIZ6Auf/50WcZgdCo68+Ysjac+S+DVsFedPkR?=
 =?us-ascii?Q?cFSQJiQw+wz7VL7/BNu+iZtoDlCKdm78gegDXRH6eT9nZT6v5arlwpYzCadA?=
 =?us-ascii?Q?xSDBUA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700013)(376014)(7416014)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	WytUoOvK1cQucRigOZTkfniDcOmldQhwdBTi3hV1EnmoQXPZWDqnc2ay3JBgoYf1dg2FTT1DKrDmkrZbX/Yz6oL6OQLqWGFop89Xa+zptZbox6QXPmEqv/M16IQo52SfciGSQkhD5k1eljdJ/8PbpZ/tlHpSr0LJl/H1F6qEo/CchvbuM2TYYKx7lPjMIRtewbk91tKBRTb4Nt/snJ8iYm5asi1mOvvnaxVq7h5qyqfThsWwh9squNnLX0P4dw0t0k2yh/V2Rzs3nw+BErdjB28iI0QV2Kwad/8fanumnzfRmsg5VW6lv2BgIRyWXYiUs5LJlIkVnKqwXrKRgdZYjdAoZlizbaBfWaIBWG8aAAdm9pYlr+KyJ4id01mhZIlu/dcxj7HEf0OKd67yoQbD9paIglIwHSVQg2NyZOoG9a9M40+vFgwAJdKnU6f6Qs8l
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:34:59.4629
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4207dadd-91b6-440b-decc-08de6a119bda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A106.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8251
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52629-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,gmail.com,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:mid,amd.com:dkim,amd.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,kerneltoast.com:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DA48612B631
X-Rspamd-Action: no action

Low level functions for accessing the registers and mapping to their
ranges. This change also includes register definitions for ring buffer
used to communicate with ISP Firmware. Ring buffer is the communication
interface between driver and ISP Firmware. Command and responses are
exchanged through the ring buffer.

Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                                   |   1 +
 drivers/media/platform/amd/isp4/isp4_hw_reg.h | 124 ++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100644 drivers/media/platform/amd/isp4/isp4_hw_reg.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 3640a1e3262c..7aa17c7e71d6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1145,6 +1145,7 @@ F:	drivers/media/platform/amd/isp4/Kconfig
 F:	drivers/media/platform/amd/isp4/Makefile
 F:	drivers/media/platform/amd/isp4/isp4.c
 F:	drivers/media/platform/amd/isp4/isp4.h
+F:	drivers/media/platform/amd/isp4/isp4_hw_reg.h
 
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
diff --git a/drivers/media/platform/amd/isp4/isp4_hw_reg.h b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
new file mode 100644
index 000000000000..09c76f75c5ee
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4_hw_reg.h
@@ -0,0 +1,124 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_HW_REG_H_
+#define _ISP4_HW_REG_H_
+
+#include <linux/io.h>
+
+#define ISP_SOFT_RESET			0x62000
+#define ISP_SYS_INT0_EN			0x62010
+#define ISP_SYS_INT0_STATUS		0x62014
+#define ISP_SYS_INT0_ACK		0x62018
+#define ISP_CCPU_CNTL			0x62054
+#define ISP_STATUS			0x62058
+#define ISP_LOG_RB_BASE_LO0		0x62148
+#define ISP_LOG_RB_BASE_HI0		0x6214c
+#define ISP_LOG_RB_SIZE0		0x62150
+#define ISP_LOG_RB_RPTR0		0x62154
+#define ISP_LOG_RB_WPTR0		0x62158
+#define ISP_RB_BASE_LO1			0x62170
+#define ISP_RB_BASE_HI1			0x62174
+#define ISP_RB_SIZE1			0x62178
+#define ISP_RB_RPTR1			0x6217c
+#define ISP_RB_WPTR1			0x62180
+#define ISP_RB_BASE_LO2			0x62184
+#define ISP_RB_BASE_HI2			0x62188
+#define ISP_RB_SIZE2			0x6218c
+#define ISP_RB_RPTR2			0x62190
+#define ISP_RB_WPTR2			0x62194
+#define ISP_RB_BASE_LO3			0x62198
+#define ISP_RB_BASE_HI3			0x6219c
+#define ISP_RB_SIZE3			0x621a0
+#define ISP_RB_RPTR3			0x621a4
+#define ISP_RB_WPTR3			0x621a8
+#define ISP_RB_BASE_LO4			0x621ac
+#define ISP_RB_BASE_HI4			0x621b0
+#define ISP_RB_SIZE4			0x621b4
+#define ISP_RB_RPTR4			0x621b8
+#define ISP_RB_WPTR4			0x621bc
+#define ISP_RB_BASE_LO5			0x621c0
+#define ISP_RB_BASE_HI5			0x621c4
+#define ISP_RB_SIZE5			0x621c8
+#define ISP_RB_RPTR5			0x621cc
+#define ISP_RB_WPTR5			0x621d0
+#define ISP_RB_BASE_LO6			0x621d4
+#define ISP_RB_BASE_HI6			0x621d8
+#define ISP_RB_SIZE6			0x621dc
+#define ISP_RB_RPTR6			0x621e0
+#define ISP_RB_WPTR6			0x621e4
+#define ISP_RB_BASE_LO7			0x621e8
+#define ISP_RB_BASE_HI7			0x621ec
+#define ISP_RB_SIZE7			0x621f0
+#define ISP_RB_RPTR7			0x621f4
+#define ISP_RB_WPTR7			0x621f8
+#define ISP_RB_BASE_LO8			0x621fc
+#define ISP_RB_BASE_HI8			0x62200
+#define ISP_RB_SIZE8			0x62204
+#define ISP_RB_RPTR8			0x62208
+#define ISP_RB_WPTR8			0x6220c
+#define ISP_RB_BASE_LO9			0x62210
+#define ISP_RB_BASE_HI9			0x62214
+#define ISP_RB_SIZE9			0x62218
+#define ISP_RB_RPTR9			0x6221c
+#define ISP_RB_WPTR9			0x62220
+#define ISP_RB_BASE_LO10		0x62224
+#define ISP_RB_BASE_HI10		0x62228
+#define ISP_RB_SIZE10			0x6222c
+#define ISP_RB_RPTR10			0x62230
+#define ISP_RB_WPTR10			0x62234
+#define ISP_RB_BASE_LO11		0x62238
+#define ISP_RB_BASE_HI11		0x6223c
+#define ISP_RB_SIZE11			0x62240
+#define ISP_RB_RPTR11			0x62244
+#define ISP_RB_WPTR11			0x62248
+#define ISP_RB_BASE_LO12		0x6224c
+#define ISP_RB_BASE_HI12		0x62250
+#define ISP_RB_SIZE12			0x62254
+#define ISP_RB_RPTR12			0x62258
+#define ISP_RB_WPTR12			0x6225c
+
+#define ISP_POWER_STATUS		0x60000
+
+/* ISP_SOFT_RESET */
+#define ISP_SOFT_RESET__CCPU_SOFT_RESET_MASK			0x00000001UL
+
+/* ISP_CCPU_CNTL */
+#define ISP_CCPU_CNTL__CCPU_HOST_SOFT_RST_MASK			0x00040000UL
+
+/* ISP_STATUS */
+#define ISP_STATUS__CCPU_REPORT_MASK				0x000000feUL
+
+/* ISP_SYS_INT0_STATUS */
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT9_INT_MASK	0x00010000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT10_INT_MASK	0x00040000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT11_INT_MASK	0x00100000UL
+#define ISP_SYS_INT0_STATUS__SYS_INT_RINGBUFFER_WPT12_INT_MASK	0x00400000UL
+
+/* ISP_SYS_INT0_EN */
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT9_EN_MASK	0x00010000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT10_EN_MASK	0x00040000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT11_EN_MASK	0x00100000UL
+#define ISP_SYS_INT0_EN__SYS_INT_RINGBUFFER_WPT12_EN_MASK	0x00400000UL
+
+/* ISP_SYS_INT0_ACK */
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT9_ACK_MASK	0x00010000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT10_ACK_MASK	0x00040000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT11_ACK_MASK	0x00100000UL
+#define ISP_SYS_INT0_ACK__SYS_INT_RINGBUFFER_WPT12_ACK_MASK	0x00400000UL
+
+/* Helper functions for reading isp registers */
+static inline u32 isp4hw_rreg(void __iomem *base, u32 reg)
+{
+	return readl(base + reg);
+}
+
+/* Helper functions for writing isp registers */
+static inline void isp4hw_wreg(void __iomem *base, u32 reg, u32 val)
+{
+	return writel(val, base + reg);
+}
+
+#endif /* _ISP4_HW_REG_H_ */
-- 
2.34.1


