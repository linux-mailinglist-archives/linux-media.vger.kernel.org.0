Return-Path: <linux-media+bounces-58966-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kF9ICRjr4WmKzgAAu9opvQ
	(envelope-from <linux-media+bounces-58966-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:11:04 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E0A4186D0
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 10:11:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 2048230555D1
	for <lists+linux-media@lfdr.de>; Fri, 17 Apr 2026 07:58:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1110E35F613;
	Fri, 17 Apr 2026 07:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="FzD3zKQ1"
X-Original-To: linux-media@vger.kernel.org
Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023098.outbound.protection.outlook.com [40.107.44.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1032A32FA2B;
	Fri, 17 Apr 2026 07:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776412701; cv=fail; b=iulYTorlvhi+CvB9g53Tt/PHhf5Nq3KDpICqAk1hRo671fke9y4Xv4G3Dfr4XVC+OJZnPftn/zB9oRT0HWUaJo6tork4BNpQDkJ1HNAy6L9yRiPt5onPNh3wRJu3F54PBZJd4U0QDuXezrX3O2vO/nnFaRZoB4cPA9hYz8KyYQE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776412701; c=relaxed/simple;
	bh=OaSWP05pF7Y9xJAoaYI4Sw3216rHLVtUmzQHAFugs8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=nhYlEhhtGId+8jJZiV0/MTNVSO9HxYK8u8HA989da4TLjiBP4wp8Km7D2cKyjmcqwfhpRET1rIEnlMvvyKcA6TLhIa1IG5AxBmcKIwGcwmaScavPZY1xdibt+oZKVLukZvHUe+FkzqE20C0FJ0tpTb4TuABbdPnIjbQPpWhKEs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=FzD3zKQ1; arc=fail smtp.client-ip=40.107.44.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nlH4JhRWzh1SCbeMeWf2op5YaI4TpbA+c+2dOm7qIGigaa8qpLEgMtS4HMjrlRBUS5vQ6AXi7zF6N3aPHJElqO3IzH/a1foJhTMPdW/QV02/Mchuq2CrF8lkDuFqwL1sUKLBixb2LorARL6iD+qdVT0F7zHdyUYb/8Ge+GgQSfDQJxkaHO5Ujk6l7CHikrU2alp8c4ltRWHTBeSZ/CJJaQNfJMZWTgd1585PXlRosMxtkEM7zhIurS/j9ztuocwmjInHXWjJSdOBk23qKuyupgJxfETYUvC+nDkRnIA35IpU9xZYfV2pMCkyDzmgDsL19BF9rdY1ajmE3YyJdLYpIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FA/LEkgXm+/Be/Gkee+Ldbe5Rhf+XpVEei77SjoZF7g=;
 b=MqLn4Jl/CvGiVFQzNg0uJXbGN/HaEXEtA9xqGBtRkPQHZc37MuDRxF29JxmsjaEDyihHowZ5sQJI1pIhosN8kduZ76gnTqCrBQbaWfF6wDtL9cTPCisPM3xgqsFIdbn5YFdzduqOgDiZIU8C+Zm3uaC9zwiVQ0dzSFe8h+UQg7dbTlf43yt8IKgpc2MzlUwzRkawoWXnEcVInnFQUVCiDeXGETE4XM/C+aajBWsvbUJkGbNh0UsXeclX/8nmH6m6lTT8Fqq+zevAlZSY/O7oWAHPBwy8i8N4eoB4xVQUxvP0W+ZHwKDFVB7HAU4J7R9DVCxOKe8S0eyglO/gup4Ahg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FA/LEkgXm+/Be/Gkee+Ldbe5Rhf+XpVEei77SjoZF7g=;
 b=FzD3zKQ1LApVmsOcbDprUEp74jTvQWYVvuC+VYQ2ZEMpinhHAz+EabE5UUFQYO6FuEp6ehOJh2GfeEtgvG8REW0JuwG3Y0sctJkjE4M6/h4Di9xwx8Qp1H4JRsWL+hZuDadAEpI7nn5+eldRwHf05yLB1dF1kjnzMxU5+GXtJbeeEtetESwyu/hrkBBA1/JlvgofYMlBCV57Y8ou+G3Z8UhMgafjgsQUsPBMw+LponJDdYX6h2w+6NILSWJdzy1S6Iw6cloB6BaItW7Z4pVkJw/8HRhMOMDu3R9nfUzse3zTAHqSj7/ETWnTRDMCJOZTkCnuteYfe56Z+vhsnmgAsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by TYZPR01MB4609.apcprd01.prod.exchangelabs.com
 (2603:1096:400:261::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9818.25; Fri, 17 Apr
 2026 07:58:15 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9818.023; Fri, 17 Apr 2026
 07:58:15 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH] staging: media: ipu7: fix MMU resource leak in ipu7_psys_init()
Date: Fri, 17 Apr 2026 15:58:07 +0800
Message-ID: <20260417075807.2691958-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0034.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::10) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|TYZPR01MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 9acc4a3b-6d5d-43fb-aa24-08de9c57145a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|786006|376014|52116014|38350700014|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	ArnVwPZLNyCh6kEXxVEl5/qltH2//0jjJJHSrkD312ZZJrUkZqvQqX7eLMdThqYrRnpxkRIC8+9GFM5SO3Yvs7P5MEi9pRvpZQQrlpWSswYuDp36AnBTNl63eGr43CiTEiFcl5ZAKdwihqYw7YEIuOZemVk7XXCa2jEqZicPBR01KiZLT1n1NAQLedEcV0MJIiZb212802H2hfxQu/ZMKlud9q+6RwPHd31tNBW0/nWxs7MsIXLw9orlvbgfLMyVNjqV8I/f1mGuH2SQTlblKgxK/FFcpwFbeY/raVZMokofSR4CZNMRpWpqqKA/2FZln04Y1nkIwYePyZxZpXGDug++nQ8zeL6xYpJT6wp8fZpc2eW3NkGpXOQkAhfG76+EG1n3dKbfxUIId0JepLLDmxGjdl5EbeqKh+Fxy8SsqkfUkQwn6M57VR1DgawEKtSpBPvXIV4lRaM/PEoVAm5s9aSkBJqEKMyDhGdkFR9C6cdUh5zKzr1gVMzXxXCZAD1BMNLbQw6oeGI6lqgkWeX6pCTImuGpwsl9+uLa7wt9U2CK3nrl7bPduAV7DZfi0PzaDUKQLxsHU9P6Tnnat41QMBE2Qy00QfTHSm5HkSyFFKgPBe7kXMDWl7UiywWW48wnBnTg+oFLrvOfo3zwE7hinNGuGZLHSO0ttAZ8iTpG9an+F6xECe731503mXfEi/9PmhNgSok7Mtgk9A8D5Cp1s3fFZl1C7Q8DN5ZqXjnb6ewKge8B/vwu0pSHi9iWjZzsl+fF2AGOxqd2NX45yPXj1vPZRpkRVtYN6jqnK5vaES4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(786006)(376014)(52116014)(38350700014)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?aKuJ8riT98YXNZnHu5uqQgTSK6t1ulymHswLSQCH/t9n/guF7XIn7cHpFhpH?=
 =?us-ascii?Q?wE21wH0Eb1DDKAkbOclR9V6RnRGcz2a1HFze2FLgpD+guONk7KV+/HlQA5BT?=
 =?us-ascii?Q?dHdYNvjsHDn0wJtfxk0Eqbbiel+AIncidQAQ+L0NK4Z4VBqKxeVRi5sFgMpz?=
 =?us-ascii?Q?Yc+BIeDRjoxVFRjpJuRNIx23CvSgIyAOnqjlea2bhUJkuOvL6Tm/uk7l1ov2?=
 =?us-ascii?Q?C4NcZb2S1CsGROc+anJ+X616z4zYK99dz1s1/bS8RN+8LncUvulEMvUlogvc?=
 =?us-ascii?Q?VM6jJH8RSXi6aMt57W/cF+A2nzJ9WHPTUge1r2tJXNPFaSnRH55rfTSDgOPu?=
 =?us-ascii?Q?JlNPBOoWMWszMQ8OTTCk3U6bnQjFhKw0b9oKSFjv9EeqbEAbOt4noK09vJJz?=
 =?us-ascii?Q?ztUY/1D/uer74saB0OV1YDiblWDkSgo1XgHchGQfiogFGG6LxSSFzLR9inur?=
 =?us-ascii?Q?nnHe5/XdTWfW5ooPVoOzDeHT3wdmIagK8wae7iRQCnCrbTOhDJ6n79VO2FIq?=
 =?us-ascii?Q?dpMMTK6kB0ixw2WpOM7HWrc7IHL8qnxQAAldPvQfGInDoDURjInlfqJQvJtp?=
 =?us-ascii?Q?wbSjcqw6i/FYQQ2JNCwEb0mWAV7Hnx2NmMcp7mjGH1Y/kdssIvHWdde1TroZ?=
 =?us-ascii?Q?rd5R7snYb4xitWYm80pCCO+xsNa7NXM/uT2enuCk7gtODTTsuCKX05h5YH3i?=
 =?us-ascii?Q?yRXdLGBKaE1C+rm2eQ0But6FklZ0KdKKItG2XUqQ80jO3QCPjYS3YE2u7XHp?=
 =?us-ascii?Q?pJk+H/6DLEQhM/J8pmJojdJRo4KVALJy//MV2E90mqLb08dh2syVOgBrLVWp?=
 =?us-ascii?Q?RefhBqrl8seK1YrAF28VuBv/tgvbxZ2mYzfe7q4TNXGoPyTU1p0fVFPn95+B?=
 =?us-ascii?Q?4F9okmkGDiOTvEfgMDsOCyVx1PbQ4N0xzc3h3c1Y5i+PQKFvYjg0M2Lnlw6l?=
 =?us-ascii?Q?QljuxmDJB7N2l9Q/6OKlYwsLJxubSBXK8TEwrDK85BL4SlomNCPBckA+iPRe?=
 =?us-ascii?Q?NODniSoE8TqV6zfLdETxQAr05icjMkiMuGXmA79FJj80sMWC0AVNXUxJhOE/?=
 =?us-ascii?Q?nfkycGg6qnQBWOhOgqLiS7qyLxo8aa4tYIkfJ89uTi7fFZB/YTpNHkpLVh8i?=
 =?us-ascii?Q?tLWDnJf/ofXijqbL2cSjnV40F02bxQPIuT74wDq7cr8L15AuiQ9as2dWrfex?=
 =?us-ascii?Q?eY4e5BZyxPCWDX2lX1YoZTU2URpsZm8C+txKX5vSNijGQdqxSdDsUdHLQnzu?=
 =?us-ascii?Q?LLjFt4GNMlBdPqUKHpISfcu1g0v7EI0xgAK+fV4GjKF5Z1a5ffc7YIMW2Roq?=
 =?us-ascii?Q?8R9tmrEcFFvN2Qn83yI5iN6qa16aLn7dMmGh5F2+e0VUXFZ7cQsgbNmejcOK?=
 =?us-ascii?Q?+XT77M5lGAwX2Xy3zlPAq1RN6Ss+MptPuDHPrgKSMMHe6HTsNkwE3+1psmjR?=
 =?us-ascii?Q?0sLfTW+XukB8YF7FRQBxSRTcG5Gm+m+pQi0ks73C6dqiHttkhvkK3fdH0Hnn?=
 =?us-ascii?Q?nC59kMcsdfH+ub/G+1Ca2QgVB+MELddeTl9m7KyA1gRrYigQDoySPNUr0m1l?=
 =?us-ascii?Q?6GFguD0bg0wlwxjWb/LquNDCCbYiUfJoXvdu5bUr+jqQwjiFs45Viv2LUbo6?=
 =?us-ascii?Q?lw/vrJ8QRlCncD7G4zVcXRbf/AX5xjPemaIx4QaUFmq0JdmHHtoOKjbTJnpc?=
 =?us-ascii?Q?aEdAr4jdaf+HLYnlGTbGhofZE9dnsrbw5b2nNWrrqOwWlqv8cG+0uBlI8SLX?=
 =?us-ascii?Q?iQhBqdDcaw=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 9acc4a3b-6d5d-43fb-aa24-08de9c57145a
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2026 07:58:15.2498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: epp72ZdxwkSlXZG/y5jGyH37RKiXpKrn0WH4K9JUQj8Pbgo7KFSoZ4a5skNrZncoJoQS89zCkClMLqBr+dFsJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB4609
X-Spamd-Result: default: False [5.84 / 15.00];
	SEM_URIBL(3.50)[smu.edu.sg:dkim,smu.edu.sg:email];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	MAILLIST(-0.15)[generic];
	BAD_REP_POLICIES(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_ALLOW(0.00)[smu.edu.sg:s=selector1];
	GREYLIST(0.00)[pass,body];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58966-lists,linux-media=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[smu.edu.sg,quarantine];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	NEURAL_SPAM(0.00)[0.198];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	R_SPF_ALLOW(0.00)[+ip6:2600:3c04:e001:36c::/64:c];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,smu.edu.sg:dkim,smu.edu.sg:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 92E0A4186D0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

There is a memory leak in drivers/staging/media/ipu7/ipu7.c.

In ipu7_psys_init(), psys_adev->mmu is allocated by ipu7_mmu_init().
When ipu7_bus_add_device() fails, the function returns without
cleaning up the MMU resources.

Add the missing ipu7_mmu_cleanup() call on the error path to free
the MMU resources.

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
 drivers/staging/media/ipu7/ipu7.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/staging/media/ipu7/ipu7.c b/drivers/staging/media/ipu7/ipu7.c
index c771e763f8c5..4039e548dc8f 100644
--- a/drivers/staging/media/ipu7/ipu7.c
+++ b/drivers/staging/media/ipu7/ipu7.c
@@ -2228,6 +2228,7 @@ ipu7_psys_init(struct pci_dev *pdev, struct device *parent,
 
 	ret = ipu7_bus_add_device(psys_adev);
 	if (ret) {
+		ipu7_mmu_cleanup(psys_adev->mmu);
 		kfree(pdata);
 		return ERR_PTR(ret);
 	}
-- 
2.50.1


