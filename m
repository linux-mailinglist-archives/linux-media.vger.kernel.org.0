Return-Path: <linux-media+bounces-41206-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FA46B38A6C
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 21:46:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 509111C209B3
	for <lists+linux-media@lfdr.de>; Wed, 27 Aug 2025 19:47:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D36AA2EF646;
	Wed, 27 Aug 2025 19:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="eyGWOI5/"
X-Original-To: linux-media@vger.kernel.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2057.outbound.protection.outlook.com [40.107.92.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F122E3361
	for <linux-media@vger.kernel.org>; Wed, 27 Aug 2025 19:46:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756323997; cv=fail; b=lxUbzlygkLcw3Sib/cDtmSUbESljl/4ql66VpSG8PmjNmzBHu4SAUaLNYHQLFXvtJcJpPEDVNvtyjTDERV7uyU/9WjhZlgOnfS6awzuUT398UEQScZbNW1A2KZlbcA7ZODDRcC/61M8yDLs1U9ZeHXKKnOVq8gNxgghMCQcn2LU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756323997; c=relaxed/simple;
	bh=xsCeODpa/XPotSek8gAn345aVF/DpVsETBM2bpBghiw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S/66S2qM56d+PqtWn0yZAjkScTsMVNkW7O25oMYF5/PhQZcS42wc+zD3Xi47ZqVUkwe4VHBklxSuv6sND8Ynd+4sKi5XzlTqf3fj9um34L64Rc5vvdN1MwPD2PP1Fs2rof9UvyGlV+peUIbG/RC2fR+vlwXaj8n00I9RalDZljo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=eyGWOI5/; arc=fail smtp.client-ip=40.107.92.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2oeLsz3CyCGTuVjMyq0gsYYs7GoVPgvYj1ZURM3x8xKFf6tQwFE3WUnxSZXPTaZWxkZSqD5B9z3x2m3op4/d902uilBhakCOZX6pEKUq8QdfUlFPjFahmTqtM40lQpIG2X9lhzXER/4BswpvNbPsY3y+LeR4xNZEi89GYecEiNAdp9NHnNF7h70ux/8E/DQmM3Z9nYTcwF24b2CaTAZDQUvQOBLTQBuTuLroBwNA0MDI7z9ZqeAcYp6wt7klwk/Mo/vaNttlmUVxL6pKV7R7mzmlbcQywRpsaESfBy6SfCy4HAFg/Ceiz0Rj/5XJOwIChqdtncksxqA2aVhkhNb3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAhbYNY7lhEpD/HdDHoTBay3Il2UjtXBVjZzIf5sjPQ=;
 b=b1g5ncNYxtasuJtWN3GPqc9UvVYcNiN/aJUdJHGbGqANc1+4du/m+aHf4syTAx5WJdW0ZCigIdpsMam07mnYseg/wStpNymlCIpCiDCqIYsDMF6D4z4rj/37LMH4Gd9zPfCIz/T+FK51LLvgxt/w5tavUnzKON4bVRnVKp88tbzUmbGCk60L4UdLz9AbvgMWydvCwXCQ7o85z6NkB72ZCFaF2olUwdUmHQy6xwAjTC4Dnup9uEj5/1R3+sae0hFxVSHYMicJS9s9eZPhh0NPeHgnoIc4HO7Pl6R3PfSCF2kSjFc5iTPWIG6c0WtwYhPgnG6Q0yyS2/jWdzvHZ9WRig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAhbYNY7lhEpD/HdDHoTBay3Il2UjtXBVjZzIf5sjPQ=;
 b=eyGWOI5/B54Quvj+S5d3Sy3M/xnUdBWdG3KbpuvOt/O8BD4D8WN+dIhwT3TfW09XBbX3GpOw696r7tqcibMVFuD8GEn5tXqlPoFAAyAXBY/D0PZAzQ9Or8tgYyM0NNjMGbpZLATh9rfySa4q33wSH2d8rm6DCM0GHpGf2OVfMQQ=
Received: from SJ0PR05CA0174.namprd05.prod.outlook.com (2603:10b6:a03:339::29)
 by SN7PR12MB8171.namprd12.prod.outlook.com (2603:10b6:806:322::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 19:46:31 +0000
Received: from MWH0EPF000989EC.namprd02.prod.outlook.com
 (2603:10b6:a03:339:cafe::3c) by SJ0PR05CA0174.outlook.office365.com
 (2603:10b6:a03:339::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Wed,
 27 Aug 2025 19:46:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 MWH0EPF000989EC.mail.protection.outlook.com (10.167.241.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 19:46:31 +0000
Received: from satlexmb10.amd.com (10.181.42.219) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 14:46:27 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by satlexmb10.amd.com
 (10.181.42.219) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.2.1748.10; Wed, 27 Aug
 2025 12:46:27 -0700
Received: from xsjanatoliy50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Wed, 27 Aug 2025 14:46:27 -0500
From: Anatoliy Klymenko <anatoliy.klymenko@amd.com>
To: <linux-media@vger.kernel.org>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Vishal Sagar
	<vishal.sagar@amd.com>, Anatoliy Klymenko <anatoliy.klymenko@amd.com>
Subject: [PATCH 1/3] media: xilinx: vip: Fix CHECKED_RETURN warnings
Date: Wed, 27 Aug 2025 12:46:24 -0700
Message-ID: <20250827194626.3194465-2-anatoliy.klymenko@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
References: <20250827194626.3194465-1-anatoliy.klymenko@amd.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000989EC:EE_|SN7PR12MB8171:EE_
X-MS-Office365-Filtering-Correlation-Id: afde9e5b-9c46-40fb-c0f2-08dde5a26bd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?8HtlhoJL3paNbpKCaozPbESfCLKvMJWJijSCttkZE1+zRbyCSl+QvARq1J3S?=
 =?us-ascii?Q?Vn/gfmyt1/8Ez9a6K/cDEUYWmgPKB5dIXr304PaIgAbcgLazfkpnqQyJ6Pw9?=
 =?us-ascii?Q?9lTmaRNglaMhkBMeTyX/44CYOOlU50LmcbwegmWTNieiruPpdabpvxdIwx/y?=
 =?us-ascii?Q?Oi3vYoICxb3104mqeDBiOhJkf/uK3yFl7+/9YWtoiWdE5QlE5wZiVrrF9bqO?=
 =?us-ascii?Q?AYbSftvUxTis1soHcgEDZCNPl/6AdFnvubq0Pn+C68ZIwPtHicNZOR+5s/mR?=
 =?us-ascii?Q?hiZAkO0bCvp21o7efPokzSERgQlhpnzLYHT+bOJ7AkCt9EXk1hrep0AOvn5S?=
 =?us-ascii?Q?v1N5d7S09/2Dj4WhgfgeR0BXeNT+AR61hvDLatb7pkhrcPUgIJCBvNvxiKPF?=
 =?us-ascii?Q?ZukCynDtyLyiIPFvuzau/VZ8+8fYSWz90d2T7tazTTlIEMfISCtdAccQOYsu?=
 =?us-ascii?Q?czsc08IT/Fvw10tQC8kphZoLeUHzxm5AzQ1nPofxCWX456OGzuOYJnRWkNmn?=
 =?us-ascii?Q?4q5iEQV7jMrj3YnxmHps/6+5M+lb4FtmpqPHrGYN7CpOJ/qDHT9ppcsgmx4k?=
 =?us-ascii?Q?SQyDm/U9PMmh757OEAh6d38VXEmdP3sjlnN+lcEBr3qq9+nHidSRe7JPjNKw?=
 =?us-ascii?Q?t0AHEh/CeFKqN957Q/4xImvPWw/jj9ftaptjEZj0HSn/2uUd+PyiFXX/d2sl?=
 =?us-ascii?Q?4u59On509msgkXi5kNGdwcydODw7p9mdhqrJxGXeqRS0giG4GMF4tsEqoScK?=
 =?us-ascii?Q?GO+IirLEy0mP9xcbZCIoPwWnMyOVmEQ+qVp0xnYB/sbwQW3SgLcYj8x6Wp5p?=
 =?us-ascii?Q?4sS3Ulquygtv5UdDKJsvcqz+EOVF0dc9Amzy6cjG36D1qPUDVVaUDinhJD7d?=
 =?us-ascii?Q?PJkrcScttjs2DZUU3/cNHgGdk2wCBTfXo4qgQ4FBYFFfsB1WmN95jBXoW+yZ?=
 =?us-ascii?Q?xcpYZAr6Ci5J6Pxn1wfLSBLp4SMGJL593ASasPVQLzjVFvtk0rBPRLoqrs+m?=
 =?us-ascii?Q?PlJXjlD+YvOnf7NFDEsWUwUmXujjqFp9qcC70lZt7CwAZ8wWi6AQXR6DwwQH?=
 =?us-ascii?Q?sBx/YlIUhObdvZy3csyFnnqLmEBy+MCV6C7WBFre9y5If19eASLbUJQD0X72?=
 =?us-ascii?Q?u03oDjWDv7Q4LtuR4ZFNugq1XH3jo9mTJqMWy5//3yYtlEqWR9yqtVrAnUfJ?=
 =?us-ascii?Q?yJ2mhL6+iuIBK0RWL6v95ElOB2pbP9nmthVP9PtFgVtLgjZerW7d6AWSsJTE?=
 =?us-ascii?Q?7/cf9o+VFJfz0fo/kVhm1HIoBQZ2Rh319jMku11/i8Qxa0ZrKxXm0iT/mACc?=
 =?us-ascii?Q?ByLY0TGNW5iA7jLjyPRbBSYkVDMdss1if/qTWQKFaMY4NiXQU9aCVrc9kl6B?=
 =?us-ascii?Q?oNzMUNpt3LxMRPIQmto3MNKFciItlJqoTHQ9QEk3So/k3RB01WKCvV/BlAp5?=
 =?us-ascii?Q?fzP+cW9xEjMg3E9kCBeVD754X5zAP4SCWZENXm4u53RoD6ASpWtJk2omACZH?=
 =?us-ascii?Q?eMAcimMGEtsOrPutiLDCq+pQj2sb1yoD6Qto?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:SATLEXMB03.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 19:46:31.1444
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: afde9e5b-9c46-40fb-c0f2-08dde5a26bd0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MWH0EPF000989EC.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8171

From: Jeegar Patel <jeegar.patel@xilinx.com>

This patch fixes CHECKED_RETURN type related coverity warnings.

Warnings:
Calling "clk_prepare_enable" without checking return value
Calling "of_property_read_string" without checking return value

Signed-off-by: Jeegar Patel <jeegar.patel@xilinx.com>
Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
---
 drivers/media/platform/xilinx/xilinx-vip.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/xilinx/xilinx-vip.c b/drivers/media/platform/xilinx/xilinx-vip.c
index f1574edd2b43..0374aae160c0 100644
--- a/drivers/media/platform/xilinx/xilinx-vip.c
+++ b/drivers/media/platform/xilinx/xilinx-vip.c
@@ -117,8 +117,13 @@ const struct xvip_video_format *xvip_of_get_format(struct device_node *node)
 	if (ret < 0)
 		return ERR_PTR(ret);
 
-	if (vf_code == XVIP_VF_MONO_SENSOR)
-		of_property_read_string(node, "xlnx,cfa-pattern", &pattern);
+	if (vf_code == XVIP_VF_MONO_SENSOR) {
+		ret = of_property_read_string(node,
+					      "xlnx,cfa-pattern",
+					      &pattern);
+		if (ret < 0)
+			return ERR_PTR(ret);
+	}
 
 	for (i = 0; i < ARRAY_SIZE(xvip_video_formats); ++i) {
 		const struct xvip_video_format *format = &xvip_video_formats[i];
@@ -216,8 +221,7 @@ int xvip_init_resources(struct xvip_device *xvip)
 	if (IS_ERR(xvip->clk))
 		return PTR_ERR(xvip->clk);
 
-	clk_prepare_enable(xvip->clk);
-	return 0;
+	return clk_prepare_enable(xvip->clk);
 }
 EXPORT_SYMBOL_GPL(xvip_init_resources);
 
-- 
2.25.1


