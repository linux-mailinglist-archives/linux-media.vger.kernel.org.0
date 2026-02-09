Return-Path: <linux-media+bounces-52461-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UDDSKswpimm6HwAAu9opvQ
	(envelope-from <linux-media+bounces-52461-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:39:08 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9B9113A53
	for <lists+linux-media@lfdr.de>; Mon, 09 Feb 2026 19:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7D4093039339
	for <lists+linux-media@lfdr.de>; Mon,  9 Feb 2026 18:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03D343A7849;
	Mon,  9 Feb 2026 18:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="L45iIWOh"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012025.outbound.protection.outlook.com [40.93.195.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B403A640D;
	Mon,  9 Feb 2026 18:36:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770662214; cv=fail; b=EaBKwRBb4d2Kee9KCEemt7Pqk2lRt1CYgzrWfgwxb4NwrRgOEWG2E6b8cXcjOS8+/3KlQsIgqFsIzFmQbA8WkjVKo2rk5/vc5HB56BQH5R2u8ucFBXR32KwpuspFFjA1pC1ICEwJ0cJxuZs/LKRmo3/+Oj5mPVM6tEtVxw5QZP4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770662214; c=relaxed/simple;
	bh=AaPPyQWCxItAull3AJzN2hiy4BpqJx4IN08dFPmCQ8Y=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ExkTEtJAKVawhyKKeK6OSF8vspjVkbSyMsOHcZdOui00DPrKKNNhXoiSqQBY/8X+bSVrrmv20v0seG11Lp3U0/tpBipGBmb3mGZS0W6jfNyothl6RoZ+Tt2rWXLtqAl/K80uD+o6E9OaoOKOKaIfqQpGdWdz/eD6BCYFntfkMcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=L45iIWOh; arc=fail smtp.client-ip=40.93.195.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJRuaM1yEfJpWF8inXg78ayKfTGTvaWQQjgoujEYnXzUEHAj4IJbT6j9ySpjy2Vz8XFpUA7moAICV6WsJNS43cP1//MjGt3GzGaJNXk1JLxRxxlwoKsrmgnQa+oJX3URTTdQxQGYJnefaam3dws4c8Xf/dCAkTPztKUli4zFGP5RODMGK0b3oZhPO3hGucjbzOp9AemUtXk+aNpd/Vy8IAPZMuptrRMKbjbJYCBeI63qHWf5gw9PYeOlup5rP8iw1OzrMPh4eB6ciR6iTUxuK7J46jfBUqfshz4wmiUzn9ug9nucHnjMShuzAImmKPzfQ63lgDqDIifbcBiBwuTDJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qykc6DQ2xny3jKY9DbzQqLsgc+Pj5EmcEwa6VQotZc=;
 b=dMWf3sQDVTpnhP2pJwZeDVDxmldzP5CKxfhyRwA80CKLTGet46T/WYLhONdZMpXhLQ51XbTA1lkxY31L466ea0y5LtU6kWyygCn6+r79UbORrIsgCMx1llx12cFmVMdOR8EKRfVJiPTV7chL8C8Oeou2Au6TncyloMd8jXBgTZMWylfGfvw5FNRQS8ABHpNmcXH10Yb2I6B79xtkp53w/L1HL10IsBtYYH1n0MNJLEOx2G0QbIDBbW5scogGfBoBx6ZXewizkmH2GdSKpEBXScMLR/ncVEEYs7U5+KufduoscVH3R5cXjoYLsbdUDkyMyTT/kLGSXcFGP+59WKhGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+qykc6DQ2xny3jKY9DbzQqLsgc+Pj5EmcEwa6VQotZc=;
 b=L45iIWOhxCvjFMrd0irnAKr6hHoAvNv77kPSMxLdE+8yu8cncaIaqsa8Txogw6m/9qTakGwoZ4FPE6Mo7c1l50cZFXUqa5WpTRk/wUj5smmtM1jOUIZ48URf2fvjzNhrG6ujZR6Up+b7ZdnJyYm/CH9HrbygdMqzbkGH6IpPBbQ=
Received: from SJ0PR03CA0276.namprd03.prod.outlook.com (2603:10b6:a03:39e::11)
 by PH0PR10MB4696.namprd10.prod.outlook.com (2603:10b6:510:3d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Mon, 9 Feb
 2026 18:36:51 +0000
Received: from MWH0EPF000971E5.namprd02.prod.outlook.com
 (2603:10b6:a03:39e:cafe::a2) by SJ0PR03CA0276.outlook.office365.com
 (2603:10b6:a03:39e::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9587.19 via Frontend Transport; Mon,
 9 Feb 2026 18:36:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 MWH0EPF000971E5.mail.protection.outlook.com (10.167.243.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.10 via Frontend Transport; Mon, 9 Feb 2026 18:36:50 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:48 -0600
Received: from DLEE215.ent.ti.com (157.170.170.118) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 9 Feb
 2026 12:36:47 -0600
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE215.ent.ti.com
 (157.170.170.118) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 9 Feb 2026 12:36:47 -0600
Received: from ws.dhcp.ti.com (ws.dhcp.ti.com [172.24.233.149])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 619IYvtC2052904;
	Mon, 9 Feb 2026 12:36:41 -0600
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
Subject: [PATCH v11 16/17] media: ti: j721e-csi2rx: Support runtime suspend
Date: Tue, 10 Feb 2026 00:04:55 +0530
Message-ID: <20260209183456.1906327-17-r-donadkar@ti.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000971E5:EE_|PH0PR10MB4696:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a5e8660-8361-42f6-3baf-08de680a3058
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700013|82310400026|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?H93nUkitScWp3pypOwKJJtK2mYIJ6J0QAXgju7I098av20JE8Jg+N/daRVKU?=
 =?us-ascii?Q?7rHgRhfr9bK6KtQcdvuimcJXtm1AYb4y/jdwEx57diG9pXfqAAW5CVkDjSft?=
 =?us-ascii?Q?swfF+uJF9Pa0HcArZknOkSuFFXxbATLAmMk2paMDh8InFfocMVPFhmzVHiPt?=
 =?us-ascii?Q?yJQdMhQisXzIdqqcgj4T9CIgxXP7SdoxUEBdxopauJv+gw1BL18qwxaTclV9?=
 =?us-ascii?Q?IG5p1dykNo/zWcf85KJMtSB8IqcpjPQxVlADZ+vuRuwbf+saicXhqc0XDiCB?=
 =?us-ascii?Q?5hXh//ZX5wVxJ2btfaIh+p+HQ6lC7u7GsPPkfnbICr5qcL+448fTBAeCVraq?=
 =?us-ascii?Q?jnwZ+5E0cGq/r8pK+1f59ocWHAzXnwzkJ/xEM3+yiz+oalnBw8C+Yyp7bZ4J?=
 =?us-ascii?Q?NO9WcLN7qU6btioWOO7aOPdvLGekHxlbutpwWyJ2x7UTV4GrAuZNIhYGYo5b?=
 =?us-ascii?Q?Eq10s2u/sm5Ct/Te6og36p8DmDtqnLyxnvSTFbyVPQGMYIaTr1Gxgp15wlXX?=
 =?us-ascii?Q?6sSkLVraBU2I8HNlr8sUGognXAMYku4IxzkzJrJus4CeCmib2iJbE7Mkbjp5?=
 =?us-ascii?Q?i5FyXfTzRzIrM+zDUyO3gHXC11wGYUyEpfSv9wfSkdY5d+azLeZnMJF7wPO4?=
 =?us-ascii?Q?WcMgJK8eBNcbLBgjzhRQMNzbbcNs5TGsWahFvZoABTcrPkxnQoLNKbebTGnW?=
 =?us-ascii?Q?sXYtj+JVbF1nxbjCAnhkB7n8A3L8n5qn0Ht9AJK1py2Z0/9lV2T7TICDCuYh?=
 =?us-ascii?Q?BPyGisD/Jmx5ZI+aFi/s2pfDW67eUMUD0u1TbcfCkdoq2McXfz4Uc4HnxSMb?=
 =?us-ascii?Q?B7YDIrXY/iyrUxyxJ9apX6f+Z9soHGDMZ2guAYSvqqgoCexQpABMwRzUqdSY?=
 =?us-ascii?Q?+YSXRJvkjTi3sf65LPFqYD1npLvXMEaZFuIQ4mVq0pHSpWMEjYVafXwwbm85?=
 =?us-ascii?Q?Cq6/aFgxcG6UgKslwT/XbZxrIl4OfYkniQ7nePEXs9U66sgEuSji2qLUvq8c?=
 =?us-ascii?Q?x29AGdQBIyY3OI6puj0jy6sXHb6xaOlTMt9BNQvOGg9E4VlfNCinFarr6kl0?=
 =?us-ascii?Q?zjNSfKpOVDQkARNzoS0ulFvH1KybKYY2m4MaRueS1nie/JIwPJlNErMFUC0l?=
 =?us-ascii?Q?Z0SEFkcv28zkUTDklhdfuBWTJiYwhe9RoImr/pB+Pv8HOaopQq9KkbIgi3Hh?=
 =?us-ascii?Q?UvHdU8mxbuNW+sDed5Qoy9KYG+VOew6Zntq+zes9pr4inbSpX97cqsS79Q1q?=
 =?us-ascii?Q?fkDVyVcqT07wt3g+cIiQcfdPyGVkZS6DwbGC1ZkFsolja6IuePOmOooqxTDy?=
 =?us-ascii?Q?CXIj1Y8FAZqwZb3jgg6FiWDA5g0arHnW57ey6V1g2ipmgIbgibxTMrpQPecW?=
 =?us-ascii?Q?84XB5U35OmMPOy3rLSWECklduZQF3Y3SJcycmg1z3VRJx7jYzmHbrsCtC85Q?=
 =?us-ascii?Q?HqwozXQuBnai71Rg0yjw0kE1oYqLJjqGmcrJYht8WkyUFb6NBnDFjYmkxbhk?=
 =?us-ascii?Q?52qdS8hEtokv6tXT6hPPg14azoyZnLq8I/MjOEfM2iiXOZMktmLqk4sQ3HKU?=
 =?us-ascii?Q?YBpUQRPJmKJeWrQXvawNjord9lQ90uoqfN9CBQuUL+acu1zCoRCF3KbQ9AIO?=
 =?us-ascii?Q?roKNlmKNXxL9ZlBzp3FWPrNO4EKGWA8BorezWSWBWn5cfm7MdKRFXUNyupPQ?=
 =?us-ascii?Q?DFMZtQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700013)(82310400026)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	fNIPR8guoHG3kUwkA3O1wCczMdx1wWn3zDvxWqeJgrWi7mosc5LodjHFkdoZK7D4TE+UA/WwqqSxIhH5IouxTsXL8uV+E+mE1cwDFUQazKAAWOvlg3vOs8eR8U19ZnneOA8La1rCjgU2d0rmmT6TM6jTavw6eo+UWThwDrWqi1jjmpqPii9Ljt8QFv71B7HbM/FQ1yEa8MTtrWoWrsZaLo2Z2qJfjp0Fhj6BeN91uEt/t8iRRG5TQPO4FRN2LI1Su0f5LBWea/XkQr6wlZzq3EioGIjhPdxqQTKF9YblN9mNc7WjzPAbbk9QNkOkN4Ctjci2N2hP6o6cltpBcWbQqat2rE/iHyUM/+INsWbCGaiMB1klM9U6dHA1VLKQZmGYQz7Lf3r80EO2PyYquQA49k5hAUJoywp/cWXRs42CmQZPPiCbkt9/dD1VT93+0Uki
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 18:36:50.2099
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a5e8660-8361-42f6-3baf-08de680a3058
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000971E5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4696
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[ti.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[ti.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-52461-lists,linux-media=lfdr.de];
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
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 5F9B9113A53
X-Rspamd-Action: no action

From: Jai Luthra <jai.luthra@ideasonboard.com>

Add support for runtime power-management to enable powering off the
shared power domain between Cadence CSI2RX and TI CSI2RX wrapper when
the device(s) are not in use.

When powering off the IP, the PSI-L endpoint loses the paired DMA
channels. Thus we have to release the DMA channels at runtime suspend
and request them again at resume.

Tested-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
Co-developed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Rishikesh Donadkar <r-donadkar@ti.com>
---
 drivers/media/platform/ti/Kconfig             |  1 +
 .../platform/ti/j721e-csi2rx/j721e-csi2rx.c   | 59 +++++++++++++++----
 2 files changed, 50 insertions(+), 10 deletions(-)

diff --git a/drivers/media/platform/ti/Kconfig b/drivers/media/platform/ti/Kconfig
index da33facf44678..d0cb05481bd85 100644
--- a/drivers/media/platform/ti/Kconfig
+++ b/drivers/media/platform/ti/Kconfig
@@ -83,6 +83,7 @@ config VIDEO_TI_J721E_CSI2RX
 	depends on VIDEO_CADENCE_CSI2RX
 	depends on PHY_CADENCE_DPHY_RX || COMPILE_TEST
 	depends on ARCH_K3 || COMPILE_TEST
+	depends on PM
 	select VIDEOBUF2_DMA_CONTIG
 	select V4L2_FWNODE
 	help
diff --git a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
index f81175a64a35a..eabe2aab772de 100644
--- a/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
+++ b/drivers/media/platform/ti/j721e-csi2rx/j721e-csi2rx.c
@@ -13,6 +13,7 @@
 #include <linux/module.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 #include <linux/property.h>
 
 #include <media/cadence/cdns-csi2rx.h>
@@ -968,12 +969,16 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	unsigned long flags;
 	int ret = 0;
 
+	ret = pm_runtime_resume_and_get(csi->dev);
+	if (ret)
+		return ret;
+
 	spin_lock_irqsave(&dma->lock, flags);
 	if (list_empty(&dma->queue))
 		ret = -EIO;
 	spin_unlock_irqrestore(&dma->lock, flags);
 	if (ret)
-		return ret;
+		goto err;
 
 	ret = video_device_pipeline_start(&ctx->vdev, &csi->pipe);
 	if (ret)
@@ -995,6 +1000,8 @@ static int ti_csi2rx_start_streaming(struct vb2_queue *vq, unsigned int count)
 	writel(0, csi->shim + SHIM_DMACNTX(ctx->idx));
 err:
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_QUEUED);
+	pm_runtime_put(csi->dev);
+
 	return ret;
 }
 
@@ -1014,6 +1021,7 @@ static void ti_csi2rx_stop_streaming(struct vb2_queue *vq)
 
 	ti_csi2rx_stop_dma(ctx);
 	ti_csi2rx_cleanup_buffers(ctx, VB2_BUF_STATE_ERROR);
+	pm_runtime_put(csi->dev);
 }
 
 static const struct vb2_ops csi_vb2_qops = {
@@ -1259,7 +1267,6 @@ static void ti_csi2rx_cleanup_notifier(struct ti_csi2rx_dev *csi)
 
 static void ti_csi2rx_cleanup_ctx(struct ti_csi2rx_ctx *ctx)
 {
-	dma_release_channel(ctx->dma.chan);
 	vb2_queue_release(&ctx->vidq);
 
 	video_unregister_device(&ctx->vdev);
@@ -1279,7 +1286,7 @@ static int ti_csi2rx_init_vb2q(struct ti_csi2rx_ctx *ctx)
 	q->ops = &csi_vb2_qops;
 	q->mem_ops = &vb2_dma_contig_memops;
 	q->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_MONOTONIC;
-	q->dev = dmaengine_get_dma_device(ctx->dma.chan);
+	q->dev = ctx->csi->dev;
 	q->lock = &ctx->mutex;
 	q->min_queued_buffers = 1;
 	q->allow_cache_hints = 1;
@@ -1493,21 +1500,46 @@ static int ti_csi2rx_init_ctx(struct ti_csi2rx_ctx *ctx)
 	spin_lock_init(&ctx->dma.lock);
 	ctx->dma.state = TI_CSI2RX_DMA_STOPPED;
 
-	ret = ti_csi2rx_init_dma(ctx);
+	ret = ti_csi2rx_init_vb2q(ctx);
 	if (ret)
 		return ret;
 
-	ret = ti_csi2rx_init_vb2q(ctx);
-	if (ret)
-		goto cleanup_dma;
+	return 0;
+}
+
+static int ti_csi2rx_runtime_suspend(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	int i;
+
+	if (csi->enable_count != 0)
+		return -EBUSY;
+
+	for (i = 0; i < csi->num_ctx; i++)
+		dma_release_channel(csi->ctx[i].dma.chan);
 
 	return 0;
+}
 
-cleanup_dma:
-	dma_release_channel(ctx->dma.chan);
-	return ret;
+static int ti_csi2rx_runtime_resume(struct device *dev)
+{
+	struct ti_csi2rx_dev *csi = dev_get_drvdata(dev);
+	unsigned int ret, i;
+
+	for (i = 0; i < csi->num_ctx; i++) {
+		ret = ti_csi2rx_init_dma(&csi->ctx[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
 }
 
+static const struct dev_pm_ops ti_csi2rx_pm_ops = {
+	RUNTIME_PM_OPS(ti_csi2rx_runtime_suspend, ti_csi2rx_runtime_resume,
+		       NULL)
+};
+
 static int ti_csi2rx_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1563,6 +1595,8 @@ static int ti_csi2rx_probe(struct platform_device *pdev)
 			goto err_ctx;
 	}
 
+	pm_runtime_enable(csi->dev);
+
 	ret = ti_csi2rx_notifier_register(csi);
 	if (ret)
 		goto err_ctx;
@@ -1593,6 +1627,9 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	struct ti_csi2rx_dev *csi = platform_get_drvdata(pdev);
 	unsigned int i;
 
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		pm_runtime_set_suspended(&pdev->dev);
+
 	for (i = 0; i < csi->num_ctx; i++)
 		ti_csi2rx_cleanup_ctx(&csi->ctx[i]);
 
@@ -1600,6 +1637,7 @@ static void ti_csi2rx_remove(struct platform_device *pdev)
 	ti_csi2rx_cleanup_v4l2(csi);
 	dma_free_coherent(csi->dev, csi->drain.len, csi->drain.vaddr,
 			  csi->drain.paddr);
+	pm_runtime_disable(&pdev->dev);
 }
 
 static const struct of_device_id ti_csi2rx_of_match[] = {
@@ -1614,6 +1652,7 @@ static struct platform_driver ti_csi2rx_pdrv = {
 	.driver = {
 		.name = TI_CSI2RX_MODULE_NAME,
 		.of_match_table = ti_csi2rx_of_match,
+		.pm		= &ti_csi2rx_pm_ops,
 	},
 };
 
-- 
2.34.1


