Return-Path: <linux-media+bounces-42062-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BC7B4A250
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 08:33:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC7F23A6282
	for <lists+linux-media@lfdr.de>; Tue,  9 Sep 2025 06:33:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC789303A0C;
	Tue,  9 Sep 2025 06:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="oduwjM0Q"
X-Original-To: linux-media@vger.kernel.org
Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013013.outbound.protection.outlook.com [52.101.127.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 020F13009D5;
	Tue,  9 Sep 2025 06:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757399589; cv=fail; b=NDTslX9EKGA2AtoF1Pdm/IBkTIn8XuaGAliff3IdA8O5ikcqXFFRkEDKeKWf8c/5zMHQFQx2hPnrcuZipgPp9qISdXLnlkJoF7F6lc9VQiiXOnzY/QNy9rjVnBh00ARfiVVxeFiFBhlJOXZ/5P+aGODHmQTvcQlRR7WxwO5A4Ow=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757399589; c=relaxed/simple;
	bh=jTrwuzTp9lhuE+EyGxpHDL0HLw0pc3SYb0xjtTtFioM=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=IBBPHPZr1XGvePf673gS7m9pcpObGcwOKhA8AjVwxQS8Uk5udzq5VRBM1aQNMHG+TWE4opse4+NGD4uag2Vh3B5encReNBtYNSxYlbAvpUYxvIxX1yXhoEm/s8vAcBsDcASQCY2l4i+jJEr3M03fIxeXSqwyVqWJqf02FOYCdZw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=oduwjM0Q; arc=fail smtp.client-ip=52.101.127.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu9mZs2IZp+zPlHBbCtqKxe3xxMyvfmC48rr/urOjEZd6uGQApoKwAGw7ICsXVQJrORcfZ3CF7KayqT3bhoGMHD9XKtxhVAZ7E4CicoPY0nKWsA2ahOv7vdT2vKVdKHsZWyetVolR01JTc1shMDdL8iQjNM9iscq21DX6DMatjfGe2fdYeE4xEBlWbAm9VuqNTF1ch8UqMReI9meSNSmk8rx1zQIUMg6zpmx1WyTveEn48og4wStGRc1WU/Aq06XgaUP7iclOZYiR+yUCHnqmrd6xh+pgNqaJipPz0kKHMjEtywnA2ZvIYPZo0DLw8WVgkYtGRzA9uSh2hPfOc86aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dZPyEgd7mDtNJ6yS1kIgruKhsLWdQr/VbBRyl4cQIUY=;
 b=yZFK3Nbwxph/3VppUyeR+zkbdpJuSxl/kjOO/07dXJO2qYs5zl5/j2dPQ8tvnBn1U9/LxPoIBP5bNpU0dmbShB3o+vRE2v20MPW7obS/JcIHZ7QqgHgn8dy7LyZCTrsccUctG4j3MDP8Xu/YtWhpAcaX//bxKy/dfmUA6vXg4mp7X8GgDlLbyxgZSj/00anTAN+c6rKk+Ckul+dvAvFvVOWHLzyfe4Y4YCOcaAntcUEjVAtcjsL6qOqhykLws60vpkU7kmwAQ/vYuDTf7qUncW8Uvtf85d1qI9JzFHhOWDauPHk0SqLLx7+5hqMROcExpPpCdRB5gDBs+ncvmfgo3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dZPyEgd7mDtNJ6yS1kIgruKhsLWdQr/VbBRyl4cQIUY=;
 b=oduwjM0QD0C0aUkPqjW5wmSbITofdiEUG4BbfrPHnCFFJSlC6PEHTtLBD3sjV04gxUqbgPR7lYhpUMHPbwFaYTd4nybuhfnRjz01BCCXuEKisJKeAFw178ihvmBnZRg/6UyEtLRVdamFJjmTR9KRXLP+uTA8hgPSJYsdqRegeSVCsWpf35p/hxQvNxE6FOaaURTV0xOC3IeJbvf5Jm5d9Gx2VQ8BCxFoXA6ThgWAej7WEgjNmxaeXUvQg8vzTF9GT7YePhdHhIZ7HQB8AO5CT4y5QrCIhE8veehQvvUC2DusILf0hHEQYKtiatXeweNf7ZMLGTT8bk6Im9RqGeJNMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com (2603:1096:820:146::7)
 by TY2PPF4714CF0AA.apcprd06.prod.outlook.com (2603:1096:408::78c) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Tue, 9 Sep
 2025 06:33:04 +0000
Received: from KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5]) by KL1PR06MB7330.apcprd06.prod.outlook.com
 ([fe80::d1d3:916:af43:55f5%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 06:33:04 +0000
From: Xichao Zhao <zhao.xichao@vivo.com>
To: mchehab@kernel.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Xichao Zhao <zhao.xichao@vivo.com>
Subject: [PATCH] media: dvb_ca_en50221: fix "writen"->"written"
Date: Tue,  9 Sep 2025 14:32:54 +0800
Message-Id: <20250909063254.547026-1-zhao.xichao@vivo.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To KL1PR06MB7330.apcprd06.prod.outlook.com
 (2603:1096:820:146::7)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB7330:EE_|TY2PPF4714CF0AA:EE_
X-MS-Office365-Filtering-Correlation-Id: 0faebbf8-3b57-44f4-604a-08ddef6abac3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5EK12MjLZTRvRPtNbyLF3jwef0atRkoIrJbJfBCj9EHYDYhAmUHojKU68vQY?=
 =?us-ascii?Q?jXa1NUZMFgHD3Bv31ue2b7mRTY3tUrVJaUTXdya8QXIp58yHGAuKWiM76Mck?=
 =?us-ascii?Q?qJ2T8/Zmz3roUphQbnGDPDdaxKIQCKEv1etQ0NQgHFjXOza1xSc9FRwrfuv0?=
 =?us-ascii?Q?uySdm+iZmieXHpmjgGhGGm3/aee2K8Exug+fxJPAelduPUh5rw7ngXl9LKt5?=
 =?us-ascii?Q?6Mkhu8gpJ6VFW5HWDyk3wqdqn7+d+uoZVsMTGxyWfeIquvlM1T6QyyZKh4uz?=
 =?us-ascii?Q?aKCwkzPryYTqu3yTsIzoMpqKAdc1BkZI69a7WxAq9+f1JpFGZOj0ZAG1mYwZ?=
 =?us-ascii?Q?3Tq6DvShNl8kVx3fyIyfW/iAkyqHuW06FwKEISw1UHqBbx43+gqVe3Qpjhi3?=
 =?us-ascii?Q?VFFldMVrO16KBiBH64kswYYBMfivL4i54KNO06H5yDLlTqqWBrNnh/XxUuOD?=
 =?us-ascii?Q?CptuCwdUv8IXwb08kmey7/fC5VOdmEOsd0uVDB2Hrj1yRx81MhjGR9Uyd1ib?=
 =?us-ascii?Q?kRCBtecIVaRmP571LScSZ6o2sIxjtcQrK4jSxmBIp7AOjTsTkF9qCA5bcNGb?=
 =?us-ascii?Q?Xh3vYxQ55lCOSE7n+zoIdxNPioIUaLPVUB623WhHXeNSvmfC8OHaq9WCvNg6?=
 =?us-ascii?Q?/baFrGKL0RA93+UBHyiX6n4zAz7k1GkWhBxd5a7QZj2Agt2JBh0rc6G2FtrQ?=
 =?us-ascii?Q?cJVTgWFOQpPVOnP76RQWdR1/eBlYU2cNqWLWlvWTFC17UWFTNMm89cPMw3mZ?=
 =?us-ascii?Q?2SSuE/Ap07VwNtWr6kJszIi4eLzowseqLgy7HaRil31pP/PeTqUzMAyhZT0D?=
 =?us-ascii?Q?TFJK3GWS8bUJZirVp6ZNs4KuXUkw5MpIluVphoqIKjP5shZIbR0Pxveq9TKH?=
 =?us-ascii?Q?lYNL49k/08D4aO0BCHWuKNF5D7WSQzVSc8YKbKplKw/szbe3wDqxgj2Gc/pk?=
 =?us-ascii?Q?/P/ptihiSJuh6k9egtJtMm1CfNKkhpcgmZZxrJWovIScb+gMe35Pz6x5teBM?=
 =?us-ascii?Q?be7xEyrFAPkcvLUiZ40VHla8NM6zxk5Mf1P1LnELFaOAvbFDS4bUmuXl2U9J?=
 =?us-ascii?Q?N78lvLnRHj9GEAns4+WTomSCTGLK8XJiLd5MftD7jU6hklk9t48sqCE/wd/8?=
 =?us-ascii?Q?pCAwkYWd/VoTjextjJOs80HsS21szgXrgSkaAoq7ct83zjMOyxO7ElOoY6YQ?=
 =?us-ascii?Q?hqRUTE55qMwMl88zjNpSGcD8rGLnRR3EHbahPhVXF1WQgPj4PkqlcR0J9NDN?=
 =?us-ascii?Q?Rvo+BhybNVvd9l2bSa43YUhmHnbzNOW2G5MmZA5W1pW2uaCwWWwAtmScCQvA?=
 =?us-ascii?Q?YesOqANFzcmhtWHMtksPDEU/wpGyH2+IqjZJZ/vIY2ciJ9dnKw9Do1cmUKrZ?=
 =?us-ascii?Q?rqjx2j7YjAYl9pl2eyfQmPQnq6Zv0lpWGL3v0viFue62SqKloSK+uAiBcJPf?=
 =?us-ascii?Q?NiUTOWTPAvx+0ZiA7KxyLJKDGJV1fZXCK1O3XlSwV71w8xXSCYn1bw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR06MB7330.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?NLXuUYRs61ntcG8ew93IyQnjE59/IMKRgEfHHoM/7x1WOJo5hgleQ/lkGZ06?=
 =?us-ascii?Q?eknJ3RfEf4x6ikNQYS4iZ4yJ7yOU7C6EwdXGhTjUc8orP7IZaVwCSMlOBLDS?=
 =?us-ascii?Q?IK2phTwqBeph5StCkwMh/uB1ETxvB6HyHxqMwgwevOFA9ptnCmn1YzDJkkk/?=
 =?us-ascii?Q?HxWgebwaaU3fGuXeRG29RHEdqJeBBpXi16eq3Hidmcogs/XptqUsYbVRTUg1?=
 =?us-ascii?Q?odGfNrU35Ygr1jdr0P0BLpAEGoocdh72qzaLZnbgaVZ1TlGAAAeoSVJ+HKp2?=
 =?us-ascii?Q?GsgOqjf5atlQmyOCCvnAo5V4Mey727Dc3t5MWMgGFikfBtYOdzeKCAxR9tuc?=
 =?us-ascii?Q?UNvRbkjYx7Q/NGTuY/vEIXpQZ5LPsYFjXto+SLaarsQ+3dJQT4o0W0oxg1mV?=
 =?us-ascii?Q?036evys+MB05Dpf+jvR8gin4uZzLV0afRUmWyOKg0y3XDkx7PjxeDDSPb9ew?=
 =?us-ascii?Q?+AW/R4HvVTLe2JTUnKxAK5WivK36rmzyDA8NZpPFOVM77Fg0ZcYzPwydIiDB?=
 =?us-ascii?Q?UF2+T6996eE4t5jRaXi9nZRlHtDp0mNGvl7j7qplZrN4dvlt02P0gzWYdfgv?=
 =?us-ascii?Q?hrQXffJ4hFAsId92DqTehp3zwkn/jJJ0NmLmBjHhJiAjE4UmZLPedycBosW0?=
 =?us-ascii?Q?Hk4Sf8MHaJMmhT7z+PLLAEFk7CDsvXHiuQRpGlsowkLLSA40EZjeTYUDTeqn?=
 =?us-ascii?Q?QyB263k1NJr/POVAh/fW4KDvQtitc+pEby2sDiEkisWLJr72IE95vGwA8Rww?=
 =?us-ascii?Q?r0vTb58gMyWVggQXD+iGhMqIrDuatSrXvoPwX4lxVuK+JZSoTnEFxrlH6EPj?=
 =?us-ascii?Q?61/uv2hWSkKG6XK3ybLfih0fcBlcxR59AJEKC4Jg/Jiit8dTMCA3tjQm5m5v?=
 =?us-ascii?Q?PFhP6bktU6wNJmvZgmTerT8pp7+kTvSeVnmN/w65Yqz/6ceViLnJde8UxvVk?=
 =?us-ascii?Q?VmPs+72o0Vt4f+3PGq9IuYMxeMX+4qB06f5dXpjF1DkpCwXQpGAq8TyQYeIy?=
 =?us-ascii?Q?qPODMWO1CXZyoZTu1MfHMQu7B0/DDfrhfbuhU9pv7Uxr6Op9Gw8sAkcm9j7r?=
 =?us-ascii?Q?y6oPcbu9B0Kkrugi49RyVzH8IYrN6rW7jodzo1qvAlzfsaVJnbDOqyYsV66H?=
 =?us-ascii?Q?Fq73Nq2GWCNhWza36iZ2DvKUeAIeogkekbjnv8pT0pA67wMscmjELQ9p4NkF?=
 =?us-ascii?Q?Tvc2tmTuUks3E2TLuCGokuV6nDZ9mkyQQSM5yHyzIlbYcGo1Fw5nwXW0eSNP?=
 =?us-ascii?Q?qUXpb/X2UEnc2AsvU/NEnzhwrmTcmG1bcafJpNWhU3Gp4VfgSXguodFKVIlg?=
 =?us-ascii?Q?tCf6QiSDhaJlaLEDuiW0iDDauWVD/9pbsxo/z+r9HF26/X8KNhtMzfb8fa3e?=
 =?us-ascii?Q?aod0HFi5hR39HLhilwq6n2buQWHb/Xo1/8qlxa5RXuav7gWrThh06fmDvn2N?=
 =?us-ascii?Q?TggePRZcEevCxvcxhN7P9mQ8f1n6P6HxuloFXznNJyXzgTjm63ZIP1hVUjoT?=
 =?us-ascii?Q?uEQX+WClsbp78AU9HeLV8eyPu0NVoHwevRgURegUZyvPWuMaj0Ay0YBpz/Xu?=
 =?us-ascii?Q?tJQF1+J0b6TYN+QxRzHXC/tl+5NunlveM9DI1vOP?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0faebbf8-3b57-44f4-604a-08ddef6abac3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB7330.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 06:33:03.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gnWR/O4U8UMzXEVaFBQQjNaWltOJ4v2Z7Tu5TZU3UGYV0DEepYyUjeK7tvDNUXL6+ehrSFahH6T02dGvYnKxNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PPF4714CF0AA

Trivial fix to spelling mistake in comment text.

Signed-off-by: Xichao Zhao <zhao.xichao@vivo.com>
---
 drivers/media/dvb-core/dvb_ca_en50221.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/dvb-core/dvb_ca_en50221.c b/drivers/media/dvb-core/dvb_ca_en50221.c
index baf64540dc00..7b591aa1179f 100644
--- a/drivers/media/dvb-core/dvb_ca_en50221.c
+++ b/drivers/media/dvb-core/dvb_ca_en50221.c
@@ -785,7 +785,7 @@ static int dvb_ca_en50221_read_data(struct dvb_ca_private *ca, int slot,
  *	 be written.
  * @bytes_write: Size of ebuf.
  * @size_write_flag: A flag on Command Register which says whether the link size
- * information will be writen or not.
+ * information will be written or not.
  *
  * return: Number of bytes written, or < 0 on error.
  */
-- 
2.34.1


