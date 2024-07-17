Return-Path: <linux-media+bounces-15063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8612293376F
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 08:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3C737281DBF
	for <lists+linux-media@lfdr.de>; Wed, 17 Jul 2024 06:55:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D53E71B948;
	Wed, 17 Jul 2024 06:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="k+qbST+9"
X-Original-To: linux-media@vger.kernel.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com (mail-tyzapc01on2074.outbound.protection.outlook.com [40.107.117.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF4E18EB1;
	Wed, 17 Jul 2024 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.117.74
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721199325; cv=fail; b=ihsOgBmwsFdpCnZj/w3GObVr5iLa+aVFrVjxH9++OIrT1qXybpZCaXdkvN5RWeeON84v5qtOzpI8mEH/24yOqNb+pbww/Dy99oqwPQUfPrhLalMMsiCDvS4ET/AR5JHh6AY0UNIIW8CVsgy5lQ77LdutICGEMBSakBsnNRAhDrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721199325; c=relaxed/simple;
	bh=fi+O2wT7+p+dqAneHdw0z7XKGYCtomBYcwAeYULxIH0=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=O6iA0QHemYNq2Mnfx4U5v48oSTRwHNF9UDniKMJxar5SINcLMeTx08G43WLqvke/mR55SauQ6YchI0dj6+enWGlYk+W0LvUGxn0fI54pGGCu3ucFrlBqU0gGK3SigTE36lqWTwUaYnilrqr5EsxCzXjIkkelziVv+r8mRrgsUWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=k+qbST+9; arc=fail smtp.client-ip=40.107.117.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SuMB+K2osiSp2MUbfhadPSnu+vwfOTKUrd/pwlC/zp0g4GTl24KBo+CR97DrGQQGSKEQWkpr7chNpeH7DKWJ3lA/06742mOw7ZukJFmKmhoch0Q9d7bvw51eW01ioBLZrJvX61emnzevUFGsqlTKqbZdpRkl6kCFdnw4jjNwN3j7yyQODKTdwR3E0MVmyjWMsRiVY7mUtuszE1IHOAwsSPEMjUqKNeh8p7YtnXfih7ibamq+X+vzjBkmHb7sJSjtZJMFYynV2+uo8JlMoHiKDnvxpZaNERi51C4XgkstHGOX3hzYEMxKBWnlBKSGopmiGz6YRNcL1nDBDPTRcANFTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tO6cQfZfVeBjs//Dga8fJ6F98CIz9ZZBSWTrnmZP2gM=;
 b=mCkJ5qWxkuPWeJ0+YmUsw6DTFfikjR2I6aRYHHl9tHWe94/0ARLzDJQ/U5+8cTWE8msiUObapBnKOxFf9v+NNForunCym9v/z+ljgAyXF+5a1R9qVEc1MNKKiSID/1g7Ptc1ZBpnIvJY4s91TIMmyc3SUQjfIcAsvhxVCDbbJjuTWHSmb3QRDuFYmtYDbSmZxRv4YjcpubILK/jp5YhNtORwt3/G7wTaxykQIWpN1MaUDBuE3IY16gXEmwl32Q7e9QCtiJuqb3iv3jdsjF90bxjr5kT/wyAvd/5Gw63HHT4CvM2acpkruc0vt0C+1HJbYbZqVVP4oPlAJPip87J9mA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tO6cQfZfVeBjs//Dga8fJ6F98CIz9ZZBSWTrnmZP2gM=;
 b=k+qbST+9L4h/20SRYi+lafQuYSS01c44k02/E1X0M8Flne97U7GyIZ8ZkFV/Xofitsxmc04UcxUAN7QvrjCijBRqc3SZ3k/zKWZJ6DZKwIOVpgl0MRX6/8egTJImEvaT0nr9Z9/1GfmIPvJAa/u366KXX5MF56v3S/lMyLI6+XmkHxNLSRlJChjSdeLHbqsISBLBhhyubieOrrqUK6YcLtTYqxeOtXMe0pvKRk6rX8FQSDyU03U6rP8qL7F/68spEI5vCKUk/j8Mojrqzs5OzuSMBIKjVtf2IDMfUQUtdMZMST2xgK40R96k6cATJuTXII9jNJcHqYTr6s55QROu9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
 by JH0PR06MB6510.apcprd06.prod.outlook.com (2603:1096:990:30::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.29; Wed, 17 Jul
 2024 06:55:19 +0000
Received: from PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f]) by PUZPR06MB5676.apcprd06.prod.outlook.com
 ([fe80::a00b:f422:ac44:636f%6]) with mapi id 15.20.7762.027; Wed, 17 Jul 2024
 06:55:19 +0000
From: Huan Yang <link@vivo.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	dri-devel@lists.freedesktop.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-kernel@vger.kernel.org
Cc: opensource.kernel@vivo.com,
	Huan Yang <link@vivo.com>
Subject: [PATCH] udmabuf: change folios array from kmalloc to kvmalloc
Date: Wed, 17 Jul 2024 14:54:43 +0800
Message-ID: <20240717065444.369876-1-link@vivo.com>
X-Mailer: git-send-email 2.45.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To PUZPR06MB5676.apcprd06.prod.outlook.com (2603:1096:301:f8::10)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PUZPR06MB5676:EE_|JH0PR06MB6510:EE_
X-MS-Office365-Filtering-Correlation-Id: 34236d4d-babb-4a26-5e64-08dca62d6bac
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oBpcqAz74lLAQiIwRS6ALI/5dpRnQtD3EWkghm1qaI/LwvjhSnsHThA2DXbm?=
 =?us-ascii?Q?lOHvTkxq8KTaUMfjP+xM9XTgQBfn1UJsbd/YRooAoArAWaJbfgo7zy8AQm/s?=
 =?us-ascii?Q?EHb1bb95wPPgGfHquGCENQoJY7yNWHELuuirpSUYl/E6URrlhoeUC3WLaqJQ?=
 =?us-ascii?Q?eDwaEcWB97ZOKbmLL0XHctUd4YYvLa4ZVuA9ZgDM+0ax/CoYHL2UjvhS/6kZ?=
 =?us-ascii?Q?wSE0nWz4ZLdiPulkALZER5RqwwcLGFVG1fmYNUwhk5c3PkaLUf7jkPksfUcN?=
 =?us-ascii?Q?wX4CLYqEhhOFtNjMHc1EtuQRiGSVTFKXLPmVCky/TKTKnrI0l+P/JALhE6oD?=
 =?us-ascii?Q?eurUTwq+h8c/61vLO70AyK1Nsxut3XMoJ6IJ6cXYApU7KJNtcmKwRmDB+DTF?=
 =?us-ascii?Q?6Wr+aoE2vj5fR86XOM8844G7PkOeFN5snZUYmmeGEMcnJ+LojhfMBG3QbKou?=
 =?us-ascii?Q?yyNdwo9tjV1AnVyc210txxBSBXbFttJRC/0kdPPr1aCh+eeAMhqBzXyMV6ON?=
 =?us-ascii?Q?+CBUXAOhR3GLttfEryW7WAvtAmQ50XUG35Fcx1juM/FT7DWZGZnPkZObqv2H?=
 =?us-ascii?Q?DdjkdbcUav9i1ciUF8EhvMrljeVZjaYlnY/S/Sf5zIL32bOY+AOe6IiVmFTK?=
 =?us-ascii?Q?z+mX8IvADRIpcyXNM34jBV6mQZooxDfafNBtLFNfXCdT5/5cJjtWdEIaMyKh?=
 =?us-ascii?Q?rdsSPEPtswFotXrCYUJjLKhG5H3Nqs6WKgSVsMd8QwIbTLwYX2Z2PLOXKNPp?=
 =?us-ascii?Q?cXwOfnE1cQAa1ojjAYMF4ulXAEQ/nIXB+n4yFlL4lwivQpngDlhvkr4wwrpV?=
 =?us-ascii?Q?xbu4Zb0XUsjRkd2hvquK0qvJCIHfIyAANFohzakqWf/8mgnI7j9b5R+L69vI?=
 =?us-ascii?Q?kcW0b0X88LEOam4h7irFeBySiXvoFvrjiltW06BgfTsrodGqSAyq9JMM00Gw?=
 =?us-ascii?Q?GHeNzEpLqVTr+SK/QJ/vD4io3mLZWflwsx/ImK0hkdWXmQObE4vHIbaNLgmT?=
 =?us-ascii?Q?lBOxGkWimC5LNc9dTz3E5exlFe0EKjFTDJj2oYbOdWuE9dZYApWgyA6g4Fir?=
 =?us-ascii?Q?e56rux+RKUNHzawfRvjnEdgms/0mGzOciWMzrGENw5/K1nK1qihCjhnz1kK7?=
 =?us-ascii?Q?P2skVhotdBvulvmDQl3qElpFnB+cIg9wWSyR83H6jfobizPsdfSsq59R3sZR?=
 =?us-ascii?Q?3TFMUzARim9iZ+mTX7LNUVHbOyJiL01OHLMNNYiQbfaU06e7JIrcV/Zlwib8?=
 =?us-ascii?Q?SFMhx61pO76/3uAg5FqFUn1b5rGde+zTP73M0Sjgqk8QbyPzX/HwN1gRAaEK?=
 =?us-ascii?Q?9cf6Pvg/2Z9P3nZHGNZA6b8rRfStclB36jDzioRiaS/+dFgDyGSyWvPM9TfD?=
 =?us-ascii?Q?0WWFGXnGFWtT58IeVwsKAqugMhvuxtd+McXq67KKN4SehWavhw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PUZPR06MB5676.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?o+sc8ge+hbDf9OJyDWl6PAxaFFsxnNfIXZsk+wEiGkpf6ExFkOQ/sX5C7w7E?=
 =?us-ascii?Q?u/GJJucF8I2D7MBbz18ddnjyfB+Ukrn/NFMB8hyj7+Crud1lAlGjxsZNwcPn?=
 =?us-ascii?Q?EPOsHLKT8tk2AyC6kseYhsVpNchJPAfqVFDEsOUtRwVqZlj1lQ7rgHaAzI0m?=
 =?us-ascii?Q?o9znGQWdxxAMxJQ23qrW0ReaxiiCSozQkZ/3lhAI5oPVqwwR4d7iw751uXcK?=
 =?us-ascii?Q?CR/x1gmMjW1vDhEyQQaVEoQcLvwy8LzxdNxu7XL/ZN0B6IXLwr7ZsVV9jHdL?=
 =?us-ascii?Q?CcwQYUvq9dn7hK7sVFB0xogi6HI4mbAmlFUlclAQiR5mtjAJriemvF6Nl126?=
 =?us-ascii?Q?Gpt9qJzjjZZA/mgLqwZjagCimM6AF6Qk40tZmCWtwYlY+kCAzatcnK60YOVk?=
 =?us-ascii?Q?zSwaRD99J6TGWd0u/yWRDlndQ15+mWbiDaelX1DM+aq2ENTF+D9Vzt+loRg7?=
 =?us-ascii?Q?VhBL6cxUIbwaH0jfEYXnHrAKHiYljySyzLrEt5TBPKHZUr0CE2epQ2QmH5eV?=
 =?us-ascii?Q?i0ZpIIT77C6XdixvDdfeLzJV5j73kartFFQSJJNgOnKsIehRn89rR3nBMNTV?=
 =?us-ascii?Q?a/khCrq11LEFQcNQFawCJRpLI680cwr6aH4JoABC+kWfcPXhacjglhpkNLnS?=
 =?us-ascii?Q?HDyWi/tERURFpYHtO9yUq3upOynSWixCR0YFprbH3Mw9YwvFMofBW6SWH+1i?=
 =?us-ascii?Q?tX7ZEDudi7AIDpSLvh1wFvYo9B+tuMV9/R4XHP1AyEIM/fMtx2N5RgD20A5E?=
 =?us-ascii?Q?8+q66tvvs1+Z2I8AlM1mH+Ar7BqA8Qel4/WREPzbbG/aojd4LKvFfacDgUfS?=
 =?us-ascii?Q?ruOJJ8/8ni5ZcMJRrWH4d2tINUvXM50sqc52eRdOJp+eft4uP9krPzZwVp+G?=
 =?us-ascii?Q?eEte+tzAxBLWIUiDAOGflX+MADU3MVph6stcQo5Mg+2Cge3V/YVxRV8oWXOb?=
 =?us-ascii?Q?X0drifciBorw6IaYx2UUJ7NYz0QyJx4I8vb7tClWX5FYHiTktUwn+uBbRIQC?=
 =?us-ascii?Q?QP2lDxPLr75zvhK7jW2Ut1mahCxLsrUFQfY8OZFvIJzui4mX4bGYvRyJqUmD?=
 =?us-ascii?Q?3B8wbRLIFv8TaPuqwfUSY6yaAyVtZKpEtJ4DKR1poq0ftP1cXoeIct6FEG9h?=
 =?us-ascii?Q?SWZeX0MEwCEbYdj/mcI0nqRneswv4MNX2LOWcErrR72xI/SD10F8DfqLmeUH?=
 =?us-ascii?Q?qEGk68+b2ZyRW2CLUElIOxsG28gSaiQMRflx2NjXkoBKMI5/fY5ncoBxul/A?=
 =?us-ascii?Q?qT396YrlQsYO1PAwSwlaS5fx5BWB8EENYTBWeh9aeQMzUAX7Help/AsODeTu?=
 =?us-ascii?Q?OziewR+/AwT2oa/J9FN9vf0+gEOae9m3hKi+lM6Oot84MScOqyabDQ3gtl6r?=
 =?us-ascii?Q?VSFKdOv7f4JGalp36uDGkXTnQpCCrzT5ME/byG2prmpdeMvWP+lNatrqPex+?=
 =?us-ascii?Q?hCaY4dI0PEQYNBXXuxy+Eul0E26z4eFMYK5516FhQ8VkMLoCHEV3C4Oj1wVK?=
 =?us-ascii?Q?j/+GwdgYkp72ss82mjfpwWBvm/F8pi1V/1kfKc8DNptEa/aFPXXkeCk3MJia?=
 =?us-ascii?Q?it/xMNiZnLhBgLLHV15VGTafGULLue4zB2WiMpKq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34236d4d-babb-4a26-5e64-08dca62d6bac
X-MS-Exchange-CrossTenant-AuthSource: PUZPR06MB5676.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2024 06:55:19.2015
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tbDGSbFoMyieh3RSY8ig53XyarKXp0hsi3IyB+G52S+U77YAKsOImrZTIVmNlFeC7p1ISqqqPrHTvjNOpCj7UQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6510

When PAGE_SIZE 4096, MAX_PAGE_ORDER 10, 64bit machine,
change size limit into 3GB and then create a udmabuf,
current ubuf->folios alloc from kmalloc_array will trigger this
warn and fail create:

[ 4080.876581] ------------[ cut here ]------------
[ 4080.876843] WARNING: CPU: 3 PID: 2015 at mm/page_alloc.c:4556 __alloc_pages+0x2c8/0x350
[ 4080.878839] RIP: 0010:__alloc_pages+0x2c8/0x350
[ 4080.879470] Call Trace:
[ 4080.879473]  <TASK>
[ 4080.879473]  ? __alloc_pages+0x2c8/0x350
[ 4080.879475]  ? __warn.cold+0x8e/0xe8
[ 4080.880647]  ? __alloc_pages+0x2c8/0x350
[ 4080.880909]  ? report_bug+0xff/0x140
[ 4080.881175]  ? handle_bug+0x3c/0x80
[ 4080.881556]  ? exc_invalid_op+0x17/0x70
[ 4080.881559]  ? asm_exc_invalid_op+0x1a/0x20
[ 4080.882077]  ? udmabuf_create+0x131/0x400

Because MAX_PAGE_ORDER, kmalloc can max alloc 4096 * (1 << 10), 4MB
memory, so can save 524288 pages(2GB).

So, 2GB above size can not support in current udmabuf.

Further more, costly order(order 3) may not be guaranteed that it can be
applied for, due to fragmentation.

This patch change folios arrary use kvmalloc_array, this can fallback
alloc into vmalloc, which can guarantee allocation for any size and does
not affect the performance of kmalloc allocations.

Signed-off-by: Huan Yang <link@vivo.com>
---
 drivers/dma-buf/udmabuf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/udmabuf.c b/drivers/dma-buf/udmabuf.c
index 047c3cd2ceff..71182a6d35b1 100644
--- a/drivers/dma-buf/udmabuf.c
+++ b/drivers/dma-buf/udmabuf.c
@@ -197,7 +197,7 @@ static void release_udmabuf(struct dma_buf *buf)
 
 	unpin_all_folios(&ubuf->unpin_list);
 	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 }
 
@@ -322,7 +322,7 @@ static long udmabuf_create(struct miscdevice *device,
 	if (!ubuf->pagecount)
 		goto err;
 
-	ubuf->folios = kmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
+	ubuf->folios = kvmalloc_array(ubuf->pagecount, sizeof(*ubuf->folios),
 				    GFP_KERNEL);
 	if (!ubuf->folios) {
 		ret = -ENOMEM;
@@ -399,7 +399,7 @@ static long udmabuf_create(struct miscdevice *device,
 		fput(memfd);
 	unpin_all_folios(&ubuf->unpin_list);
 	kfree(ubuf->offsets);
-	kfree(ubuf->folios);
+	kvfree(ubuf->folios);
 	kfree(ubuf);
 	return ret;
 }

base-commit: 523b23f0bee3014a7a752c9bb9f5c54f0eddae88
-- 
2.45.2


