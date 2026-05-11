Return-Path: <linux-media+bounces-61053-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SNKFN+icAWoHggEAu9opvQ
	(envelope-from <linux-media+bounces-61053-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:10:00 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6470E50AA46
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 11:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9979E30B768B
	for <lists+linux-media@lfdr.de>; Mon, 11 May 2026 09:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62EAA3BAD89;
	Mon, 11 May 2026 08:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KzzP9wMs"
X-Original-To: linux-media@vger.kernel.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012061.outbound.protection.outlook.com [40.93.195.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D7D3A257A;
	Mon, 11 May 2026 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778489977; cv=fail; b=fBoLyUT+7GTOhIfbwcqjWvwxdNX5bDAxgkzsDB8iJNEylElF/BQLSZ7zUFmTs/lN8NkOmhyI+7FLBLxWblTFBNABo/eAbHCnwIqvWTah88jlHoS/iLJBAUk+F+Vqz3a2XyK83sTKYJyd5czNx6f4J66RhAX3WR9/il9xRabkIqc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778489977; c=relaxed/simple;
	bh=73zkPWe40trfx8f/MZr8BmL+4TN4rmz/QFXdSIJVw1Y=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YPHzHDUBkdH75M9vT0fDbra8bZsVhEuW4J/9aV72jrbksooYlRvKEIyKcpg2xwzuw585epKezbwd9Gf3zsm9EqeMpQ5Wr2snMNcgD0OE+/dR8tTXy+BzBilTn9+zY2J22O6RGEbFZBNxGBAcSfEuwtR9M2aSXFzwO0j0BI3UEqs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KzzP9wMs; arc=fail smtp.client-ip=40.93.195.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yV+PcJtBcB1/xZ7jwIlHuWCAAofzZTojFJDEnsOz68AikwXDfUQOzbdLs1o27YfvzfbsvO1viK1jjjfzzKP5iCi0dXBfspaNKukoKkTT9LQALxnf4xTAx2Rvb8EUs2ZgbNI+ebNNxipZUVCLCxzkSCXWwgbXuZlpv1kjjiJmmkMPjcpkFj40bVCythgszZwD560dIKZQ2cAsiWMoc+KCja5uwtgZ2zv7H2GDSizFrBSf4oX+3J9JSaB38H4RhJ+hYepNTH/58P8lCZmayXZNzrcUJ2wHk/h+RcetDDcCi0wp1KWg1/ufV7eli3yqQMeuFb8V0/FN2rMOEijLKXgPZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jxw/uUz6C4+HMy3k19qsrxn3suHX4HpOuWBx95GlF0w=;
 b=bQlw8UO7Fm5Kf3A5JQgc+liz92gqpNAcgLHKmhtRakoS9gJBJu5UnTvqY+F4nQGVs42h02rAJg/X/62gehmw9h90qVhZxODrCHGETNwvIFVZnWhS8OoDCxUWCa++hy+lVBUPjQmAd/eDtskTumC3oUUSA5zyIDBcrzB6ugNRni27QM10BMyeDQsDTFTVBkAefLGxJOf4rdK8UA6ZQynW+1hUFC7FZFRgef2BzWAbTrJm39NIK+vjf5SKW5wvS168Iud/XKx+2dTBVhWNo0JlmF+6JfLZNPf1COeq3/Qm3ixnSc66nf+NFPOkM92zIWcTmog3JemHqDafuACz+aUMsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jxw/uUz6C4+HMy3k19qsrxn3suHX4HpOuWBx95GlF0w=;
 b=KzzP9wMshbz9LgwILtOANAMsN9VtKXx9O2TG4jFu9eDdwYryQPKBVfYoyaR53rypQtUMXxcrv+z6VwDIqWLw+tXvF37MkZUo7jBmFhQLtHdWvMESA+1J4/hIpyQOOHS24fWAVqcZKcMlpayXGeievcZ4tl15cE3StGJfCf9VmlE=
Received: from PH7PR13CA0010.namprd13.prod.outlook.com (2603:10b6:510:174::20)
 by DM4PR12MB7552.namprd12.prod.outlook.com (2603:10b6:8:10c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 08:59:32 +0000
Received: from SJ1PEPF000023D5.namprd21.prod.outlook.com
 (2603:10b6:510:174:cafe::e) by PH7PR13CA0010.outlook.office365.com
 (2603:10b6:510:174::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.25.15 via Frontend Transport; Mon, 11
 May 2026 08:59:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023D5.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.48.3 via Frontend Transport; Mon, 11 May 2026 08:59:32 +0000
Received: from ff1c6181612b.amd.com (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.41; Mon, 11 May
 2026 03:59:18 -0500
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
Subject: [PATCH] media: platform: amd: isp4: drop obsolete Smatch workaround
Date: Mon, 11 May 2026 16:59:00 +0800
Message-ID: <20260511085900.191537-1-Bin.Du@amd.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: satlexmb08.amd.com (10.181.42.217) To satlexmb07.amd.com
 (10.181.42.216)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023D5:EE_|DM4PR12MB7552:EE_
X-MS-Office365-Filtering-Correlation-Id: d647b313-9a3d-451b-e8eb-08deaf3b9dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|1800799024|82310400026|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	887x4VMZusV4F4FmrlLRApJOpPFGQViRMtRcSHUXVEre1o9EVoBA7TeP/Ummiuz18jbQyHTzWMAPQbLOgpqKarofeWBnwnYf7ZDbdfpsDSXtJQMAn3MV3iwX76ChfebBk/yxuGHGdsOke7Dz/1g7sIcRGGqUUmzwy2CuFWPD2tINhOxqrr5Ix7TEkXMS0z1q7JNSDiVlHvsbStSlOXGoIYECczAP4ZU4hk6uW2i2xnOZMbWAtF9n0Odq3ffWW/S+oBtcQbh+wR4TwmWg7t4jbvkA2Nbqsx3N3KjDRlaY1qfo/XJzp1mQr31fPo5nikpKf6MOvZ1ZLm7uuzm29LE1/YsMLj4SLfdKgpimi5UpOuK8X31/iIS2Ikm0DOp/badaTcB/ePwlUgXk1hrcUd7JTICq2WG9U6EdOU3cZLICXkX8W+I35fBWX6VnaV4q+1xRSmFLLe5ApF17DvYhGnNt62XRQsK5UKhFrJCe14/5IOck8/l+TzfIc2ZgkJtchS5cMrkSI/1QirRGATj7HQGgJExKP4/pC0CBFG1HR0X/2LioeP9uFbobRjknUY14wmVxDFVMkcbdwVwo4RAKYrA1l0V3JJZ2hz+wA+8TKMLi+iwULmTnw9QnSaFqyuOhjZNa5+Nbs+63jvEZFhBtoOpjR3JGDPqHtTOs5e4mQsfMvwgJ+aQC7Kd+1GaaHJ4YgHHL82rzletfuScAKxFP2fHsG15MtSqZX27qvKwTLJKsV2E=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(1800799024)(82310400026)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	y7u/KvaxISz7yPdirdU7vXOjr5N65wper+pZtPdAm4ge7rMAL2+2TMnWri3f5QdtVP3VoSFfBT/12D0dAmQBXd7eFWrcUQdKksZleFKvJA6fMxam2zT3/i7auBVCU15bV6Ip0AYC/nct/QYfcvArX4Lv9IFiadRLYsjoGqMgww1aNg8c6CDiLj/N9VJAdnM2LYTBmmPGK29+OiYvTe79qOkl41pHQzbNnH4DnX0kfcLWaDYv6HFmQtjuPVVr1crgHgiN8CAgfTJTJNKJGiSJEcZVVI03inBMkbVCR4my76tsuhrry5j8g47dqcrKS5R63dR0effsfDrb1FowaxJhXPBtWerYa8dqzhU3DhzMGv8FZKlebJ6ydoeEZuYJkq5cg1X1uUQpnkbZAA9ZYrYsUeZ95gztUtU676inSO7naWKDspWxHPfoW/DCeRgwXfbc
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 08:59:32.0602
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d647b313-9a3d-451b-e8eb-08deaf3b9dfc
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023D5.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7552
X-Rspamd-Queue-Id: 6470E50AA46
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [2.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[kernel.org,xs4all.nl,ideasonboard.com,linaro.org,linux.intel.com,bp.renesas.com,vger.kernel.org,kerneltoast.com];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-61053-lists,linux-media=lfdr.de];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Bin.Du@amd.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,amd.com:email,amd.com:mid,amd.com:dkim];
	TAGGED_RCPT(0.00)[linux-media,renesas];
	NEURAL_HAM(-0.00)[-0.990];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

Newer Smatch snapshots no longer report the false positive around
isp4if_send_fw_cmd(), so the explicit INIT_LIST_HEAD() workaround is no
longer needed.

Drop the workaround and keep the cleanup path simpler.

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


