Return-Path: <linux-media+bounces-58857-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wIwXKI6U4Gn/jwAAu9opvQ
	(envelope-from <linux-media+bounces-58857-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:49:34 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9570D40B2F7
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 09:49:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1C4E0302616A
	for <lists+linux-media@lfdr.de>; Thu, 16 Apr 2026 07:48:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD53F3BB57;
	Thu, 16 Apr 2026 07:48:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b="f5wNHe9H"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023129.outbound.protection.outlook.com [52.101.127.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C033379971;
	Thu, 16 Apr 2026 07:48:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776325697; cv=fail; b=pxJ5b/L3xWq6SMxVR4JbM8oZyxNPWSLf0EEDSRqTw7WKljd27Tb8P5Q15YQ1Nn0v0KB9ucc/8fuUgIgOcX+xV0KREbl3W8xeNBtjs2SOI0Rktv9OzVDFundMNMtQZLVj/EZIwc0d01QxdYTMVG5ajw4uQ464NNIu+/rasGjUgQo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776325697; c=relaxed/simple;
	bh=3syE1KPaFkPhVii0D5RC2pamFgxxlKzIfeIg/icZ0bM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=mznbtkd/X+uZVd+nFyxp+z2yQupK9gFmw5uF57d1+VXfCbKiSkahilNsH6+lCgNbTJkTrXnk6bg7qcbKsTKZRxzixcJXzlb24IXJUprdG8tKXpgh/jx+XcNTBd7zoFMhhMk+016rclt0iY9C47RL0PysE03cHEH4hgIp+bfEo78=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg; spf=pass smtp.mailfrom=smu.edu.sg; dkim=pass (2048-bit key) header.d=smu.edu.sg header.i=@smu.edu.sg header.b=f5wNHe9H; arc=fail smtp.client-ip=52.101.127.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=smu.edu.sg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smu.edu.sg
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KXLz2u85sT7CyGBd7rH4k2HSuzIvkfAbXNO4EyWw/ebumHVAAkpJ3n1NQvFKcivns4aChP49qAl897woZqSXg6hQLvbx9unoTyKMRROSUsc/cslb5WcSmgu8SGPeEmYmAq07OFBX0Ilbw2YSvrnOQMMAabVZbYCOD9pnKa5W29WPAr73L6ldOdAtc04XM52KH9aSYnXupRwp5Xw2sVLsSra3nZHN7RN15O5eijCybCnw2vRsz5TLJ9WJHtm0R2JqUPAFNsnGCYtGH/Scoj+nOhCW61dUxWTwNBaqD6VHlOH995RLyQpZfQJX+8d/J3Nausm6KBCGr/dEgeUSW/ce3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cqrH9AlkeHoc4PCUqNb6p6haANaz+2yztmf9uwK1G2E=;
 b=y/thvp9SuVBfS9OAALuUeG5eu7Kt9ty95itSL/K/p1eMpHsXFeUqqvcFimDvsCldHEZFjJULIInnsxduw9u9+Ws6WQBKaEn5euOzMaSyqwKyOz7537fhy0j3ghBsDdkIDGleclt7E2dGdIFNX7a4r7dnzKYpNKjeV4enZ3PsrEnV8PyUFDZcxkgld4KJ8LlFNX0SuKgUtI/ua7HAMmDKoAfbNZsAHZTt5gBcHt/zFfI/1RlKn3+vn+OfAIadye4ZK3LvwvF00UcQGd200rsCCAurpfXeOI8fL+0pctLxsdXEl8Ryc4xwxJY+yLUda82LHlicqhQsW3UDXgM+bjIK3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=smu.edu.sg; dmarc=pass action=none header.from=smu.edu.sg;
 dkim=pass header.d=smu.edu.sg; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smu.edu.sg;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cqrH9AlkeHoc4PCUqNb6p6haANaz+2yztmf9uwK1G2E=;
 b=f5wNHe9HosZLiQ54ClOf7Entj9XFgPUPwPnJr8xMX3OWLqleOZuo66e6TaOTUO/J1re79TfJT+d11FcZXvy2v7e5jkVsVfyaAuFzFQ9mcFekRpwwmnbATy06zAYXlPeV0GhtIdI5Tokj78U91kasg8qq8C7EbW5ZglgLJZwgPkrHjFhpO3kPkMR+G15F+LfHGHagCA5C3sVpSrnTGuxyubs5JvTkhvKzngexlSQSHTfBDSH2n/yig1jl5xsePuoHT+U954leYVUTzBUz+HNx3RHjMwP5BYNcEGHsapEHymLo52yWM0dVAv5Q8gxlqd2ccABht4ekLif9u1aEtlsjWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=smu.edu.sg;
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9) by TYZPR01MB5240.apcprd01.prod.exchangelabs.com
 (2603:1096:400:341::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Thu, 16 Apr
 2026 07:48:09 +0000
Received: from KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595]) by KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 ([fe80::6bd0:d704:7d90:a595%5]) with mapi id 15.20.9769.046; Thu, 16 Apr 2026
 07:48:09 +0000
From: Huihui Huang <hhhuang@smu.edu.sg>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Huihui Huang <hhhuang@smu.edu.sg>
Subject: [PATCH] staging: media: ipu7: fix boot_config leak on queue_mem failure
Date: Thu, 16 Apr 2026 15:48:00 +0800
Message-ID: <20260416074800.2493565-1-hhhuang@smu.edu.sg>
X-Mailer: git-send-email 2.50.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR02CA0131.apcprd02.prod.outlook.com
 (2603:1096:4:188::6) To KUXPR01MB7791.apcprd01.prod.exchangelabs.com
 (2603:1096:d10:3f::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KUXPR01MB7791:EE_|TYZPR01MB5240:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c811e4b-0a05-4a3f-76c4-08de9b8c80a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|786006|1800799024|366016|18002099003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	VTm3OdGNd3bmXStLBqN0Lc+8YdeNsR1b7TGwzmhC/pnrKdEw5JaALz5ux9d81e9Bo8QsYQvp4TL9PyWvQtz3voCgQcm6uB5ZgkPpN8Wd7twTaABpwdY91ivu7G+4nE4GL66N0RjWm8I69afaKzyq8Va0bfNzrxqc2KR0+1OUZ8Z6ju8KtGYjgpx++XIV7klKDIsXwEz424Z0RaHifzJhgjjWchJfqyfaS+Ucp05osMHnCeo0Uiq0eOEpAZjnuGZpQsUq6TdcJ4ZCnOtDnfPFm0Km6yGCcXPIOirACGESPfaQQqRpNqt9xhURxko1bBOIsqSmI2iow/RB4d1ISbv6YEHLMJ92lm3As+GMEDDw5mGBlM/mHHyGszTbPy/YMByDlBV0O2hw/k1rRR2mQU8Suko0MnrVuAxtoyn5QBXZuLg+xuLw4RKnAIwhIT3jr3oTmKG5boFoIP4a7qD/SMNhXdRa2kz/I8n0oDc6hZ48wzTJ+QSM4jU8vvh78D8FKlRIvzMVrpvkrQxnCQCT0Rdbtekno68ck68t2I0vHITxCEWIF5+ScjgaVdV6c8+50BWMdqaWIOXHKQlo7HlRKNb2F+ezlOSxC4df7+09yMhoOY5LHfh3uFjDIsEYYoWr8TE8ZcsO7gwLg2QO/KJ5f4L4U4F20za6602PkKT+1fBLoHuU1fcOlsxgcekUkO8HLofyZyN5qh1jOS+TuP4VZapgRTQc23YYdRORjQZ0upUOZ/5kH5K65BN9xBFJrcZVK1ekCR4Hf798GVifY19L5VzbxDgTg+owEow4pKVPDlt/GF0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUXPR01MB7791.apcprd01.prod.exchangelabs.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(786006)(1800799024)(366016)(18002099003)(56012099003)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Bkmw0ERlHMwXjmZ8zArEdZjkJHvGmEPEf1No0FkUem3ITbhQ0JNRwzc1DtW6?=
 =?us-ascii?Q?s+MiEoj748bCDMlposClULV40Ii0yalF3/wrzxBrVsVwh2/ZkWBRJXynhPh8?=
 =?us-ascii?Q?kXT35CgLgxkyytHbrTyaWMezcKy9+qh1aqUk+5QSirw9M1k4GDqssux1NRVr?=
 =?us-ascii?Q?B+di2UTAfgIqe0uBDEWWk0dl/yMubbMSU3fhTk7CDnjqASyySHOEQjcdF0+P?=
 =?us-ascii?Q?UBj3EBu/4HXE1PFxtFsjeClGMZkwGzlcaB8OtXpA3ccMOld5FYyvAKQMv1rL?=
 =?us-ascii?Q?HTq0IgjxN+iPcN3qzB4jVJBF+7H+UO7nubuhQMU/+RL0at/2d3PMnEQhx97k?=
 =?us-ascii?Q?ZcmlM3BRVFYC4yVcnvAnLFmyE3zXxigsvPycCHJaoSZJZ3qXFUNxF5wDgys5?=
 =?us-ascii?Q?Q/D3QhebNTWUWpC4nQHNqEQ20gHw8hUAQkqW6rzIdBO++sdsz3ROXy6vuNgf?=
 =?us-ascii?Q?9T4nws6rkhNh7htjm8llyWVgVq6KVqSoY4M9JxrUPa0rtPfiBh2eS9kzYM0N?=
 =?us-ascii?Q?1xifO9S5Grn7yplhjNhbxueHz74gxcOxJ/mMZgEEy9C05XEBodtSneUqq7Zt?=
 =?us-ascii?Q?afXWarlgXDSsHY8KedfY9rLjpB0tqiFhvTe2H3Ph+i2y/w5EVUokv6nKZCCt?=
 =?us-ascii?Q?0/Ii2viMGFYESy2fragik49NIjEJhlwSa76XYGBQOrrcjl8tymL8QPpjdGPH?=
 =?us-ascii?Q?QyV5hiz6FgMQDnoBobdPuuVc7cUoFln//vlUPfyG4H83sRnNyFWbv+3ukeLE?=
 =?us-ascii?Q?kE/nshIqgieb8yH7W5CjhO9ZhNjmWdP6RsRwMn+mh7y5/p+9RCX3Uq/4IXoD?=
 =?us-ascii?Q?dOrqmO2tJbLS3Y1bNRgNGiZVWwDf1DAMVF6QEH0EKt1kHrLGHgQ2eSWzZMLl?=
 =?us-ascii?Q?PLWX3QYxNv113KWPIsok61jDfvLJVH9y+cDAy9x16AUZ4cWKX29Y+w9l/V9O?=
 =?us-ascii?Q?2AfcrKpHnrNEbtdvneSqa+4nojaRw/BHY/gE5DbsUUh8YYtbiFWwLr7FZUz7?=
 =?us-ascii?Q?pNOIU6GJTkZx/o4zdGB/DgchpYSfUBaNR0IQe/CLAskO0YTopn+VQZnv+1Xw?=
 =?us-ascii?Q?o5LTLvQIQHNY+d4mz6vYorJRw6QbfGGQbW2g2Bd2b9JeAm5+ogizybPmnKFt?=
 =?us-ascii?Q?kHhExtWncuUufYfU+YvRZcijgBeHN0d6T+O9Sc2BmFzY5sckSAQbDn3VHt2X?=
 =?us-ascii?Q?iIgJdE00X1ENtWkPtZ7QH/wv3IAQ2HY78k8ihYU9sEvAdzVC0SdnBJl0bkD0?=
 =?us-ascii?Q?C7BLhyx39MyHUWMFWJeQQj/777Uvn8Klwcn5tN/rqZSfQsea0k6A6p6+NE1x?=
 =?us-ascii?Q?3FQskn1rAAipeolXK0NM8ALCbuhqPOxW31p8C5orRVJC4MoMT44PHpJqGHdj?=
 =?us-ascii?Q?qGJtklUBhhGK5CW6dQp+H/Termko0r6q1pIpXVx/KTZTgHpLHqSIj2HTkBGj?=
 =?us-ascii?Q?DzsvMAj+ATJo9fe1PSUP0hnOazctIyj9C/+LGm3MC7PN0TqedDY9WTU8kiwt?=
 =?us-ascii?Q?2/7rUp6+F0QzD426cssybb6a/5HzGnqq3jeOQaKhTYjBVgjQCPT0fH+HOSGR?=
 =?us-ascii?Q?0vnXD1L5BOZucLdEDr+tx4NYO185mHA4kQoXdpFjgXL+NyFLZ5n/yOpbQ3JJ?=
 =?us-ascii?Q?lR+UN4z24RO1t3lkHUwROtc6BbVV5wtGnmXVvLlxiLN4mjOl6HJrQxZYVsdH?=
 =?us-ascii?Q?E56J/82xM6G8G+mFMK9RR2kutI74SjOUjQuBJnSkHZScyaJsMMLQ83F0HEr5?=
 =?us-ascii?Q?ccnDyzdhBA=3D=3D?=
X-OriginatorOrg: smu.edu.sg
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c811e4b-0a05-4a3f-76c4-08de9b8c80a5
X-MS-Exchange-CrossTenant-AuthSource: KUXPR01MB7791.apcprd01.prod.exchangelabs.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2026 07:48:09.0328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c98a79ca-5a9a-4791-a243-f06afd67464d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KAds9rvSpnb5dG7VKChoxe9GEVOBwjAdtJIAIPdR2UVi8AjSxJ1EGVkbnMQmtnegiSJCotGD6EHW+TBTQNV7zA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR01MB5240
X-Spamd-Result: default: False [1.34 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[smu.edu.sg,quarantine];
	R_DKIM_ALLOW(-0.20)[smu.edu.sg:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN_FAIL(0.00)[10.253.234.172.asn.rspamd.com:server fail];
	TAGGED_FROM(0.00)[bounces-58857-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[hhhuang@smu.edu.sg,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[smu.edu.sg:+];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media];
	DBL_BLOCKED_OPENRESOLVER(0.00)[smu.edu.sg:email,smu.edu.sg:dkim,smu.edu.sg:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9570D40B2F7
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Our code analyzer reported a memory leak in
drivers/staging/media/ipu7/ipu7-boot.c.

In ipu7_boot_init_boot_config(), boot_config is allocated by
ipu7_dma_alloc(). If the second ipu7_dma_alloc() for queue_mem fails,
the function returns -ENOMEM without freeing the previously allocated
boot_config.

My patch adds the missing ipu7_dma_free() call and sets boot_config
to NULL before returning on the error path, matching the cleanup in
ipu7_boot_release_boot_config().

Signed-off-by: Huihui Huang <hhhuang@smu.edu.sg>
---
 drivers/staging/media/ipu7/ipu7-boot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/ipu7/ipu7-boot.c b/drivers/staging/media/ipu7/ipu7-boot.c
index d7901ff78b38..063312d33603 100644
--- a/drivers/staging/media/ipu7/ipu7-boot.c
+++ b/drivers/staging/media/ipu7/ipu7-boot.c
@@ -263,6 +263,9 @@ int ipu7_boot_init_boot_config(struct ipu7_bus_device *adev,
 					   GFP_KERNEL, 0);
 	if (!syscom->queue_mem) {
 		dev_err(dev, "Failed to allocate queue memory.\n");
+		ipu7_dma_free(adev, adev->boot_config_size,
+			      adev->boot_config, adev->boot_config_dma_addr, 0);
+		adev->boot_config = NULL;
 		return -ENOMEM;
 	}
 	syscom->queue_mem_size = total_queue_size_aligned;
-- 
2.50.1


