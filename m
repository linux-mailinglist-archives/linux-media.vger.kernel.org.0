Return-Path: <linux-media+bounces-52628-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OPO2GLeQjWl54QAAu9opvQ
	(envelope-from <linux-media+bounces-52628-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:35:03 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9DC12B5EE
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 09:35:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4B6A23034944
	for <lists+linux-media@lfdr.de>; Thu, 12 Feb 2026 08:35:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC9312571A5;
	Thu, 12 Feb 2026 08:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="QxwHFv+t"
X-Original-To: linux-media@vger.kernel.org
Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010063.outbound.protection.outlook.com [40.93.198.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821272D73A8;
	Thu, 12 Feb 2026 08:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770885301; cv=fail; b=mHPihYt1gO0B4Ck++yuryGx+TfTSdGrEYBpKUSj5/EJvOLKfZJ6GxIaZ/ZHDaS5tr19QIIeN5MfiWODuUbFSNASuCR+eFG0WrH8kLf8wM2/XnqXS6wxhTO/9Hde41Q9U+FOLp0vIW7NMihJrPtZ4Ho8nqUNSv6k8yvzajH0bSUU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770885301; c=relaxed/simple;
	bh=i8aauwa6gAJAfMfbWR13sj+xaYszm0YIunUsJeqkkJc=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TQv4nqTVG5VtEDEUgNYyPAYcl/CL6umABmhGrGCPK+8vfskBpPL4dCk8hny3c1wlw6MtmVrMQud8gN5oFVp49J+DDmZhAH0R1xIY97/Y+mEC+LVlKQzWEJkQk+OUMKMHEv80M+Ek7642SYxPYhY2AjaU0n0oiLhMjX0b2g3n0rE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=QxwHFv+t; arc=fail smtp.client-ip=40.93.198.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CRCEUo0eyCJGM81XGMTyWPYpPz4KbtuEa6TLN7NxCH6ul3hbLrBU8hvGAnjjozZa1wn4J34pSODPxnbqbylDoqhCRugkoTvJnE+q54VkS5AGYix5ccId0zKr+upjeGYNRr0ZtBengOGncHfzuHx747KWU6PFOrvtQ4A5AxT7/ZPhTDK13FmzpSMvdGjfHcPAQLEbs87bcBpEMv97MRl8R99NDNDUCZjLvwEmdzg0v4fF+3tEUHphrPfxAgPKdTo00FS8IiQT4WGqHYiN+xleZKq4cODbaE++YUpyaqnLt5MGB+uQR0UEfc8U4qAagVUPytXk/iqmNQlg+9mFw3mDCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCOpDPg2v+lOcQx7DKjsR/M1MQpGP1v8npa1na4eegA=;
 b=ofM4Ei6HeivV49KyK2C0jPRGZRDzo8KuhVTt2puObS7XYDKJjurdx1EC8o8WxSs7l6pYq8XgBBIkjXgOthlrzesTa2myAYK8B/8889aD9hSR2YPNCrfT9NsZuakTgBgYRmNdkgv2rjVOOf83AAOdndarnN+OPz0/J+pFF3eS90J4OzHCzcu2hLlpIrcnE2IgNtN9lQeiKmsTk3/A2Mt9UWaJWeVjR/Hw8PWXOr2UVtbrFRqQ5R3xOplWpvkfpUoOFYK16NCfsD9l/SANwkv5ehNoUddoa1KBI3yxK2yCKO75/lKwOVBozoOzHv5JUvNcefBUW5tpkt+kYA4MIgY/Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCOpDPg2v+lOcQx7DKjsR/M1MQpGP1v8npa1na4eegA=;
 b=QxwHFv+t41WYxO+Q3QDQPXrgRqrKDMkUBPq/SboCZhMRG05JHTuTEd6ZmgUds+P/B8mRm8KqRJqaHGWAMGjYn+mVvQscuUA4b5onrwQRqCm82Ts6u6IVShOY9nbs4f4MH2ih3ksJyFFLt1GqcHjhaQYnGoFUPULykaEKIp7+5tQ=
Received: from BL0PR05CA0027.namprd05.prod.outlook.com (2603:10b6:208:91::37)
 by DS7PR12MB5982.namprd12.prod.outlook.com (2603:10b6:8:7d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Thu, 12 Feb
 2026 08:34:53 +0000
Received: from BL02EPF0001A108.namprd05.prod.outlook.com
 (2603:10b6:208:91:cafe::b) by BL0PR05CA0027.outlook.office365.com
 (2603:10b6:208:91::37) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.11 via Frontend Transport; Thu,
 12 Feb 2026 08:34:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 BL02EPF0001A108.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.8 via Frontend Transport; Thu, 12 Feb 2026 08:34:53 +0000
Received: from 555e2b870847.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Thu, 12 Feb
 2026 02:34:48 -0600
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
	<Bin.Du@amd.com>, Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>, "Mario
 Limonciello" <superm1@kernel.org>, Alexey Zagorodnikov <xglooom@gmail.com>,
	Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v8 1/7] media: platform: amd: Introduce amd isp4 capture driver
Date: Thu, 12 Feb 2026 16:34:20 +0800
Message-ID: <20260212083426.216430-2-Bin.Du@amd.com>
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
X-MS-TrafficTypeDiagnostic: BL02EPF0001A108:EE_|DS7PR12MB5982:EE_
X-MS-Office365-Filtering-Correlation-Id: b5c86962-07fd-4936-c0c9-08de6a119878
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K9nZl113pvgm5WDsq4rQIxqvmeivHL6WwKtqMDo00LiF01sme4vEJdvDbkpc?=
 =?us-ascii?Q?2JViSfxGUM2JD5eGlTGVBKJNQanyG9s/lCrnJfsr4kV82t8muRd36gncdMHK?=
 =?us-ascii?Q?IzrKETVfTF5K1mqVlqfoebGFtquSQH6Lsd4ivS+QEieOaZVGFpSwR5PlZpMe?=
 =?us-ascii?Q?jCEkc0kGnFnRToM20c5Ywd1crOoFTbRee4aC3kXJlgiPTImn5WF5dKsdjqMr?=
 =?us-ascii?Q?anITCp5ig9tnslCPydH/Yq6aVv47AGF8j5ciISN43MIcTid/jh4mm0anVsbp?=
 =?us-ascii?Q?v/Mel+sPUC4Ru/pdf2ei3iCTvljJQLp+a3ODkX++ZgIPfmA1daYY9BE8IcMe?=
 =?us-ascii?Q?QPzZoEqR6vPNGG7L1xD/RjCeVkNpegxcvyjZ03I4Vb1GQF97o1Ht+r82CSR9?=
 =?us-ascii?Q?y9H286m8SjSRCKAtwQlZzl4yFR80Tk6M1kS4vqju6x82ODO5w8NzaujOdT+V?=
 =?us-ascii?Q?s9KtIHUVJa+/wHZXhFjRHQk59m8MUPpur5CAzdzfeQXElMmV573Z/4+OBKK5?=
 =?us-ascii?Q?Cp5dRUwY+RWydTgWF5UksU8X4wuIIYEyb5SayQVmBuvV6r5nx/PbwGFMKByO?=
 =?us-ascii?Q?hkeO/aSJYJErrtQDEcMhmL1vx2xBw0bycM48MBjmtC8pDFI0x3i56uWRmwBm?=
 =?us-ascii?Q?2h4oSfnIVLJnaIAJQMCWtJ+6IC9aC2785YGffVbbIxP2IU8YVUxIKnCrGQTf?=
 =?us-ascii?Q?8kKG0K4knqQDgqAQiMQ6puc29WWCthGIXfwHGkbw+e8XUI/mtn/tg6RLBzvO?=
 =?us-ascii?Q?f4nBmtaZnD5rkxhKpPdQB49b65QC14T6C1VqYrGEI0JuWXAZxJ9YO8G0jnec?=
 =?us-ascii?Q?F0S2axzCEfqPNm8We0iDu9cs2gO+Xzc3egMQeS5Jb53p1DyL62wZ4hA/YCe+?=
 =?us-ascii?Q?DeO7PlNNOHJuizZnYJz2B9V5sjnqdQ2v5gMcBgY/dsKeZmLwpzjAu+lHeUzd?=
 =?us-ascii?Q?/CGG9LfgsOoeUS+fs4UIH+LeGKZx6Nz7d+kcMQb5x1Zcs5OdKv/aIACgggZk?=
 =?us-ascii?Q?JNYSeF/aJFFW+Hjyy/0EJQNEAKAe7kQlwNY6HHHi0xkqfTcgLOvFYaWPe3LD?=
 =?us-ascii?Q?Reo2jazVEu8OAwIRR/i/AJhUB6iOJd5s1hCFppMt6w8WaIRpl9lcTZpK0ua9?=
 =?us-ascii?Q?sbWBk9mVZzwFlGy4YNslxEF9Eep+BHfzBuuv7uMcmUP34jMdsfn9pDBt6/bf?=
 =?us-ascii?Q?nxQbMnAgm7CH6kdWikSBZnaoahpn27Hob6S9KHUZ8kSC0z/D1u11rLlqfIAN?=
 =?us-ascii?Q?qb2iJtq9ERL8S5PeI/jQOilofRaEbDnyEQcz2KISlv3u72aDbJlpcnQMu9Cp?=
 =?us-ascii?Q?Ccqo9X+nP0axNY/WK9FQ3ZbhX3O4l3j6RP1LbErwE/v2ujzTwBzBourvnAwn?=
 =?us-ascii?Q?j2QoIflwekFZOVgrOjmck5e3nOy9MJ0J0qNyLv2/o86xiowdQZtvqpjODnFt?=
 =?us-ascii?Q?KCNXGhvfKR2Duoq8fLr73d4sL9tKTf21RmhmIOEGiL3bZAJG0ar43snf+Wig?=
 =?us-ascii?Q?VmXtsH5i1vzTXgQr4mMofgMJHqYEVtN6ROd9vYKlviYVOcXUacXMA0GPxfG1?=
 =?us-ascii?Q?7PVbTntNm5/t6bx8ADqw7QFz59OykP2jv08R8jWoo0I7Ze69x17b+RSnTdRs?=
 =?us-ascii?Q?PWZDEMpXwXJxQwMtrLUWAW6LVFU1n2Z4hJywP4WDEb7UQqbvclOb2mD6pH1M?=
 =?us-ascii?Q?69BpkQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	caWeX00QLdGb4kyf8fErzjbYlWNxtTYyuLDhikdZnShJvW5Qz0zDRKgC1QqJrpjkqWakCaAiFLb1wH/s9Ww4kPC5FcZY4AZzA4fZKT7k5K065UKX9EHvVlg0H0vJdKwHgNM30uIFPHs2tWwiRza7M8rTVKEA1j74JLdep48VkGfLh7IYqzohsdCQcxip8BB6cpOhtiH4KKjN6bK9QUaI3PG9nekMPN0pfM6V5Ipu26HYYtOPysxF95Er4U6IH7ev6cR9FaNeRr7cEmobxyLWZpSGyuJ5izIbF9EsxExL1stxs9nLY/BqLBiKpSB3yB+LB8qg/1/JsXyglZ53+X5EHsWhmnUuhLumyE9/kk1yn0AXgQQ6gchLgd7gfgTnAasMu5Nz6Ov5SSDEeLXK8iS7RrXe5/VxJTtlyszQYzP7Kuyfw6BWXg7SHoEcqFd+xRxL
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 08:34:53.7798
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b5c86962-07fd-4936-c0c9-08de6a119878
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BL02EPF0001A108.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5982
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-52628-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[amd.com,kernel.org,gmail.com,redhat.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,lists.freedesktop.org:email];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DB9DC12B5EE
X-Rspamd-Action: no action

AMD isp4 capture is a v4l2 media device which implements media controller
interface. It has one sub-device (AMD ISP4 sub-device) endpoint which can
be connected to a remote CSI2 TX endpoint. It supports only one physical
interface for now. Also add ISP4 driver related entry info into the
MAINTAINERS file

Co-developed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Signed-off-by: Sultan Alsawaf <sultan@kerneltoast.com>
Co-developed-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>
Signed-off-by: Bin Du <Bin.Du@amd.com>
Reviewed-by: Mario Limonciello (AMD) <superm1@kernel.org>
Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>
Tested-by: Alexey Zagorodnikov <xglooom@gmail.com>
Tested-by: Kate Hsuan <hpa@redhat.com>
---
 MAINTAINERS                              |  13 +++
 drivers/media/platform/Kconfig           |   1 +
 drivers/media/platform/Makefile          |   1 +
 drivers/media/platform/amd/Kconfig       |   3 +
 drivers/media/platform/amd/Makefile      |   3 +
 drivers/media/platform/amd/isp4/Kconfig  |  15 +++
 drivers/media/platform/amd/isp4/Makefile |   6 ++
 drivers/media/platform/amd/isp4/isp4.c   | 127 +++++++++++++++++++++++
 drivers/media/platform/amd/isp4/isp4.h   |  17 +++
 9 files changed, 186 insertions(+)
 create mode 100644 drivers/media/platform/amd/Kconfig
 create mode 100644 drivers/media/platform/amd/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/Kconfig
 create mode 100644 drivers/media/platform/amd/isp4/Makefile
 create mode 100644 drivers/media/platform/amd/isp4/isp4.c
 create mode 100644 drivers/media/platform/amd/isp4/isp4.h

diff --git a/MAINTAINERS b/MAINTAINERS
index cd7ff55b5d32..3640a1e3262c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1133,6 +1133,19 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git
 F:	drivers/iommu/amd/
 F:	include/linux/amd-iommu.h
 
+AMD ISP4 DRIVER
+M:	Bin Du <bin.du@amd.com>
+M:	Nirujogi Pratap <pratap.nirujogi@amd.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+T:	git git://linuxtv.org/media.git
+F:	drivers/media/platform/amd/Kconfig
+F:	drivers/media/platform/amd/Makefile
+F:	drivers/media/platform/amd/isp4/Kconfig
+F:	drivers/media/platform/amd/isp4/Makefile
+F:	drivers/media/platform/amd/isp4/isp4.c
+F:	drivers/media/platform/amd/isp4/isp4.h
+
 AMD KFD
 M:	Felix Kuehling <Felix.Kuehling@amd.com>
 L:	amd-gfx@lists.freedesktop.org
diff --git a/drivers/media/platform/Kconfig b/drivers/media/platform/Kconfig
index 9287faafdce5..772c70665510 100644
--- a/drivers/media/platform/Kconfig
+++ b/drivers/media/platform/Kconfig
@@ -63,6 +63,7 @@ config VIDEO_MUX
 
 # Platform drivers - Please keep it alphabetically sorted
 source "drivers/media/platform/allegro-dvt/Kconfig"
+source "drivers/media/platform/amd/Kconfig"
 source "drivers/media/platform/amlogic/Kconfig"
 source "drivers/media/platform/amphion/Kconfig"
 source "drivers/media/platform/aspeed/Kconfig"
diff --git a/drivers/media/platform/Makefile b/drivers/media/platform/Makefile
index 6fd7db0541c7..b207bd8d8022 100644
--- a/drivers/media/platform/Makefile
+++ b/drivers/media/platform/Makefile
@@ -6,6 +6,7 @@
 # Place here, alphabetically sorted by directory
 # (e. g. LC_ALL=C sort Makefile)
 obj-y += allegro-dvt/
+obj-y += amd/
 obj-y += amlogic/
 obj-y += amphion/
 obj-y += aspeed/
diff --git a/drivers/media/platform/amd/Kconfig b/drivers/media/platform/amd/Kconfig
new file mode 100644
index 000000000000..25af49f246b2
--- /dev/null
+++ b/drivers/media/platform/amd/Kconfig
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+source "drivers/media/platform/amd/isp4/Kconfig"
diff --git a/drivers/media/platform/amd/Makefile b/drivers/media/platform/amd/Makefile
new file mode 100644
index 000000000000..8bfc1955f22e
--- /dev/null
+++ b/drivers/media/platform/amd/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+obj-y += isp4/
diff --git a/drivers/media/platform/amd/isp4/Kconfig b/drivers/media/platform/amd/isp4/Kconfig
new file mode 100644
index 000000000000..55dd2dc453a2
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Kconfig
@@ -0,0 +1,15 @@
+# SPDX-License-Identifier: GPL-2.0+
+
+config VIDEO_AMD_ISP4_CAPTURE
+	tristate "AMD ISP4 and camera driver"
+	depends on DRM_AMD_ISP && VIDEO_DEV && HAS_DMA
+	select VIDEOBUF2_CORE
+	select VIDEOBUF2_MEMOPS
+	select VIDEOBUF2_V4L2
+	select VIDEOBUF2_VMALLOC
+	select VIDEO_V4L2_SUBDEV_API
+	help
+	  This is support for AMD ISP4 and camera subsystem driver.
+	  Say Y here to enable the ISP4 and camera device for video capture.
+	  To compile this driver as a module, choose M here. The module will
+	  be called amd_isp4_capture.
diff --git a/drivers/media/platform/amd/isp4/Makefile b/drivers/media/platform/amd/isp4/Makefile
new file mode 100644
index 000000000000..500b81ce5d14
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0+
+#
+# Copyright (C) 2025 Advanced Micro Devices, Inc.
+
+obj-$(CONFIG_VIDEO_AMD_ISP4_CAPTURE) += amd_isp4_capture.o
+amd_isp4_capture-objs := isp4.o
diff --git a/drivers/media/platform/amd/isp4/isp4.c b/drivers/media/platform/amd/isp4/isp4.c
new file mode 100644
index 000000000000..58b21258b6d3
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.c
@@ -0,0 +1,127 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#include <linux/pm_runtime.h>
+#include <linux/vmalloc.h>
+#include <media/v4l2-ioctl.h>
+
+#include "isp4.h"
+
+#define ISP4_DRV_NAME "amd_isp_capture"
+
+static const struct {
+	const char *name;
+	u32 status_mask;
+	u32 en_mask;
+	u32 ack_mask;
+	u32 rb_int_num;
+} isp4_irq[] = {
+	/* The IRQ order is aligned with the isp4_subdev.fw_resp_thread order */
+	{
+		.name = "isp_irq_global",
+		.rb_int_num = 4, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT12 */
+	},
+	{
+		.name = "isp_irq_stream1",
+		.rb_int_num = 0, /* ISP_4_1__SRCID__ISP_RINGBUFFER_WPT9 */
+	},
+};
+
+static irqreturn_t isp4_irq_handler(int irq, void *arg)
+{
+	return IRQ_HANDLED;
+}
+
+static int isp4_capture_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	int irq[ARRAY_SIZE(isp4_irq)];
+	struct isp4_device *isp_dev;
+	int ret;
+
+	isp_dev = devm_kzalloc(dev, sizeof(*isp_dev), GFP_KERNEL);
+	if (!isp_dev)
+		return -ENOMEM;
+
+	dev->init_name = ISP4_DRV_NAME;
+
+	for (size_t i = 0; i < ARRAY_SIZE(isp4_irq); i++) {
+		irq[i] = platform_get_irq(pdev, isp4_irq[i].rb_int_num);
+		if (irq[i] < 0)
+			return dev_err_probe(dev, irq[i],
+					     "fail to get irq %d\n",
+					     isp4_irq[i].rb_int_num);
+
+		ret = devm_request_irq(dev, irq[i], isp4_irq_handler,
+				       IRQF_NO_AUTOEN, isp4_irq[i].name, dev);
+		if (ret)
+			return dev_err_probe(dev, ret, "fail to req irq %d\n",
+					     irq[i]);
+	}
+
+	isp_dev->v4l2_dev.mdev = &isp_dev->mdev;
+
+	strscpy(isp_dev->mdev.model, "amd_isp41_mdev",
+		sizeof(isp_dev->mdev.model));
+	isp_dev->mdev.dev = dev;
+	media_device_init(&isp_dev->mdev);
+
+	snprintf(isp_dev->v4l2_dev.name, sizeof(isp_dev->v4l2_dev.name),
+		 "AMD-V4L2-ROOT");
+	ret = v4l2_device_register(dev, &isp_dev->v4l2_dev);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail register v4l2 device\n");
+		goto err_clean_media;
+	}
+
+	pm_runtime_set_suspended(dev);
+	pm_runtime_enable(dev);
+	ret = media_device_register(&isp_dev->mdev);
+	if (ret) {
+		dev_err_probe(dev, ret, "fail to register media device\n");
+		goto err_isp4_deinit;
+	}
+
+	platform_set_drvdata(pdev, isp_dev);
+
+	return 0;
+
+err_isp4_deinit:
+	pm_runtime_disable(dev);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+err_clean_media:
+	media_device_cleanup(&isp_dev->mdev);
+
+	return ret;
+}
+
+static void isp4_capture_remove(struct platform_device *pdev)
+{
+	struct isp4_device *isp_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	media_device_unregister(&isp_dev->mdev);
+	pm_runtime_disable(dev);
+	v4l2_device_unregister(&isp_dev->v4l2_dev);
+	media_device_cleanup(&isp_dev->mdev);
+}
+
+static struct platform_driver isp4_capture_drv = {
+	.probe = isp4_capture_probe,
+	.remove = isp4_capture_remove,
+	.driver = {
+		.name = ISP4_DRV_NAME,
+	}
+};
+
+module_platform_driver(isp4_capture_drv);
+
+MODULE_ALIAS("platform:" ISP4_DRV_NAME);
+MODULE_IMPORT_NS("DMA_BUF");
+
+MODULE_DESCRIPTION("AMD ISP4 Driver");
+MODULE_AUTHOR("Bin Du <bin.du@amd.com>");
+MODULE_AUTHOR("Pratap Nirujogi <pratap.nirujogi@amd.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/media/platform/amd/isp4/isp4.h b/drivers/media/platform/amd/isp4/isp4.h
new file mode 100644
index 000000000000..7f2db0dfa2d9
--- /dev/null
+++ b/drivers/media/platform/amd/isp4/isp4.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Copyright (C) 2025 Advanced Micro Devices, Inc.
+ */
+
+#ifndef _ISP4_H_
+#define _ISP4_H_
+
+#include <media/v4l2-device.h>
+#include <media/videobuf2-memops.h>
+
+struct isp4_device {
+	struct v4l2_device v4l2_dev;
+	struct media_device mdev;
+};
+
+#endif /* _ISP4_H_ */
-- 
2.34.1


