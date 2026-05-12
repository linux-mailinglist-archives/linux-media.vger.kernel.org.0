Return-Path: <linux-media+bounces-61201-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aM0zBfmcAmrxuwEAu9opvQ
	(envelope-from <linux-media+bounces-61201-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 05:22:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB135193C6
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 05:22:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B228F303ADD0
	for <lists+linux-media@lfdr.de>; Tue, 12 May 2026 03:21:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A74C0342509;
	Tue, 12 May 2026 03:21:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="AlgWD6TS"
X-Original-To: linux-media@vger.kernel.org
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012027.outbound.protection.outlook.com [40.107.200.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89D419CD03;
	Tue, 12 May 2026 03:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778556109; cv=fail; b=cTTmrELU1ECdwDL4d/lfF566ebzXOoGS23vMQAQTdvrghlxmoxM6TSohV/2hnmdE9KyAWRCY1+MIx+bQD0h0dCvzZx7r8Z9lHwVoDjcl3UzuLjBqmNIgVlPuJwsiVYo1gKHfK1tAUcGmRaW3n7l59S4AQknwqJP8ZnYzBqZHb0s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778556109; c=relaxed/simple;
	bh=mG7RNV62EpSJ7/4vf/Ce4nq2Oo20JMGS2VnnXbE65Fc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=LGHWT4D+RmfOmiWErcE+dPHzb2KHZERVr4/1dxaEo9mzrcQ0B8IkRExjX9bDVj8pePSBGpvN5mDAlzCKcQNxrY8/LxDP3pVUEIRWk1kqs2dPUNaqPdKzRGswIqKZg88i5V7LWpJID9ctKqozi3JAYe6S3gy/oN5+gd/sT6ISQj4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=AlgWD6TS; arc=fail smtp.client-ip=40.107.200.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ylUbCYQV6tv7MfD1ypplqp8IYjy8oA0q0QFQS85l49MeNHhjntcqngSSM4DXuM3SkznKAj3xMo/l/jizMQXE5vkEWJ/QU0T6Ow0Ag1sXWi7WkqLTZIUeDBJQtFpRaXchde/GAAXJkZR9J/0khpDvlu09zrJpqnpBIQs87AdLrnHaee1aDA7HwVQNGCvVVf4ULiPfckusdJ/X4J5WsUuctJf5WaEYssKaiJHHYI6LLoQv3vdDiSa7ClJ3x/JyR2rDyw0Y/WQnwb+QTi/gJjMQP9M2lkDqj6B2GcSsrhkA3ZzUchEqToco0iVNMulGqeX3s6CyRpOeCLHDTgxL57C96A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cvVf9lyMjX6dsXN6WLKoeEG9lOOMXeYNR8/F0PXpp98=;
 b=J7/e0fmTiEYRfGUfOefFWd2/5weA2nQD6lumEis0Fz77380nONFP1DgTwx39Ksl0Gz7NJgfxUhACZl0YRT5799LHp/SuIJSx2pXFywr1aQWZ/fceQ+0hZ8iaT0tlKQQ9OBNmKyvFeDZfimpNQk8QF+lErD3unP7ogHUozM7a2Pj57aCaE1rQmayP3mZTKMXA/z3L6hhEz54CnpS1LySGKhbi0WUOyuk/lbBnNphxdKF6EaFaDTq5WUpLn8QCsEP0wBiTwZNc62Y/mE6DmsfLbHw5eUKiRnMyzi/TQN6sMerdCpRv2epdDpet3dQEfeZC9P3Sb6KUg5Enzvjk2ah0YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cvVf9lyMjX6dsXN6WLKoeEG9lOOMXeYNR8/F0PXpp98=;
 b=AlgWD6TS/+DYTX8fUslxYlaDOEFxld+ehdFrjMzMZETv//0ALWLIVRjJ+35RrYUiJdzPef6RdF/o+S54l1YOmr14e6h3XyhI6asA40f0vSi5Qkj+ah2b5/pdZ035qJhNzszCjIVVyzfeF/VTDS4t7tqbjdht6Wy3z9Avm7p7W1c=
Received: from MW4PR02CA0030.namprd02.prod.outlook.com (2603:10b6:303:16d::18)
 by LV3PR12MB9258.namprd12.prod.outlook.com (2603:10b6:408:1bb::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Tue, 12 May
 2026 03:21:38 +0000
Received: from SJ5PEPF000001D3.namprd05.prod.outlook.com
 (2603:10b6:303:16d:cafe::b3) by MW4PR02CA0030.outlook.office365.com
 (2603:10b6:303:16d::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9891.23 via Frontend Transport; Tue,
 12 May 2026 03:21:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ5PEPF000001D3.mail.protection.outlook.com (10.167.242.55) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.25.13 via Frontend Transport; Tue, 12 May 2026 03:21:37 +0000
Received: from ff1c6181612b.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 22:21:32 -0500
From: Bin Du <Bin.Du@amd.com>
To: <mchehab@kernel.org>, <hverkuil@xs4all.nl>,
	<laurent.pinchart+renesas@ideasonboard.com>, <bryan.odonoghue@linaro.org>,
	<sakari.ailus@linux.intel.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<sultan@kerneltoast.com>
CC: <ribalda@chromium.org>, <pratap.nirujogi@amd.com>,
	<benjamin.chan@amd.com>, <king.li@amd.com>, <Phil.Jawich@amd.com>,
	<Dominic.Antony@amd.com>, <mario.limonciello@amd.com>,
	<richard.gong@amd.com>, <anson.tsao@amd.com>, <bin.du@amd.com>, Bin Du
	<Bin.Du@amd.com>
Subject: [PATCH v2] media: platform: amd: isp4: drop stale list reinit before free
Date: Tue, 12 May 2026 11:21:14 +0800
Message-ID: <20260512032114.292725-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001D3:EE_|LV3PR12MB9258:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ece473d-45cb-48df-60fb-08deafd593b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|36860700016|82310400026|376014|18002099003|11063799003|56012099003;
X-Microsoft-Antispam-Message-Info:
	Nwxiq4BX7Q3coL7wAey6Bz/qkHjN68/9Hpc3RCUz2tMkBcZwQzewiiiXM+uGtDxvNKGzLmirTNa7ysIJf3tASLZ8d0j9B9JrsDvaCUaNmhfzGiDZsLC9x/EXb6BLcEolJSj5OPuy4zESKTONOeGhOty4hinAO1WDjVVzbLDZJZ9CSzscW5E/SFVvBVDuIq1yX3ibW+nNy/sZ5QBuT5AsjK7Givs4IyxvMURqKwZIKvAS5cRyfan+Xc6ZiPEz5aT8KcAa4lt/QOpOipBTaAPRutBpH8HetE501h8sbRJ4AKn1+4zCLfFuKxryQFaXsYzA2eD9ll/P42C/6I8Bt/V/bGA8ULwBpZUnEdeHptd0LEn4nbURFkWQIYdNygKNuh7HEiFvIoiUCrZBrG08D8nvzSmceTZAj27z7GQDjQz+p/bLXbpC2WOSGy8rL7MZRPkuSz4oDkVubZ87MEUu3mSYZROdXgpO7RVOdGqwf/rQd9oh4VtXbcvQF41yqP4XqT3EddGA4B9nkDVZXaNkNxRDF9UvWau6F1oKnUZndyXFM1JZ9AmaLhcRJbfUav6CvmFSKt3/ad2igqoUn6vV5KUeIyB1WxuTompMgnq2oRmxUFbwKV4d2Q7zAcID+Cyjg+7T3yEUXEAZQ5vP3xVunQH8O5wvwf0DX4+ei7HDtte7Wi9P0Z4TZ10CRIo4eCsWBXJGoeC7MnpBWuVpnc8fOcIhbg8LIq04VaxfRCHYop1fcf0=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(36860700016)(82310400026)(376014)(18002099003)(11063799003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JWpnIxhsLJkGSgH5E05B3cNWiwZ1m3Pp5bForjUfahCbGOey9FPTaiAWtSTQRctVnQtnbW80KJyJ2MKvR0DauyayEYDhwVVlt8a6iGQ0SmhCRu7SaOHVRCT+T9pSu0SPhTXwGUwhCErBtwfKmrdvE9ysDKhuJQR4rwjCIWJqpW9MQuZln1Ah5NSz4bMLQbZnv7v/qekWJak1yFzbCJhhv6m2y00rDHpiTQ78NfKVQSYgpD4wP4SchMS4lyBuG0IklKyINUYBqFim5UGM+yraB0fbzAW/hxosrBI0MLh3dP3P8M45sbCIHUFrOItfteeOl77VgH7HKeo+MdeZy7ZBzymZ+6au3fBcMOPInEZfAEGnqZUngfsxwNg0tlbqHusYo+/nPuIToy6tEUgBpbum1fRnxeQ7LQ9/+WzDDDYgC39BuFxBHkesn1wVdiQDtiqE
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2026 03:21:37.2748
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ece473d-45cb-48df-60fb-08deafd593b3
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001D3.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9258
X-Rspamd-Queue-Id: 6EB135193C6
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61201-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.989];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Newer Smatch snapshots no longer report the false positive around
isp4if_send_fw_cmd(), so the extra list reinitialization before kfree()
is no longer needed.

Drop the stale list reinit and keep the cleanup path simpler.

Signed-off-by: Bin Du <Bin.Du@amd.com>
---
 drivers/media/platform/amd/isp4/isp4_interface.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/media/platform/amd/isp4/isp4_interface.c b/drivers/media/platform/amd/isp4/isp4_interface.c
index 15f14eddd683..8d73f66bb42c 100644
--- a/drivers/media/platform/amd/isp4/isp4_interface.c
+++ b/drivers/media/platform/amd/isp4/isp4_interface.c
@@ -459,12 +459,6 @@ static int isp4if_send_fw_cmd(struct isp4_interface *ispif, u32 cmd_id,
 		ele = NULL;
 
 free_ele:
-	/*
-	 * The response handler or the timeout/error path must dequeue the
-	 * command element before we own the final reference.
-	 */
-	if (ele)
-		INIT_LIST_HEAD(&ele->list);
 	kfree(ele);
 	return ret;
 }
-- 
2.54.0


