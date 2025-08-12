Return-Path: <linux-media+bounces-39489-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id C624BB21BDD
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 05:55:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9EC224E2946
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 03:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 866832E2856;
	Tue, 12 Aug 2025 03:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="mY2ziEY2"
X-Original-To: linux-media@vger.kernel.org
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11012020.outbound.protection.outlook.com [52.101.126.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B332E0410;
	Tue, 12 Aug 2025 03:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754970891; cv=fail; b=khYdFrzHH73Mu8dh0VO5sHvSHHgUWo70ITnZ7spN5OIhA+fAJfP3CRDDpdi+zMYzmxCRsjcMiig6tiBDYlGq+sdaTro7mzQsO9qhbPxMLPDJG8kQCSlbgn+FRIahe9gZKoDSYBg/U4pkX1mQp8sG1DD655XJS6Om04PFdIHt9Pg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754970891; c=relaxed/simple;
	bh=dC7LCm56ELfB6fu+hLeAZWM8yja2Il08DIyPWdzkno0=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lNgCmxY7ak34UUIwXiQduHtOsC66TCvSrZ+uX9mI73j/eFprIrCdyrDJqF1d+FTMeztok1Sow1IAKr5HhG7yQys3u0HL+Z2olfrBKWOpeLMbdArPITA1kGzAYmhig06ILdJRALmX+T11eswCZV0TpXk518UEPbjVG9dTe2fnihk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=mY2ziEY2; arc=fail smtp.client-ip=52.101.126.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAlC7QM/8MBQ1QdzJrMgGMMrrv200/pS+/tS8sWdyeEVLiGauK7TFb49R+AJzXB1PibGaVOV9BpllB/Pt7hFCqK3NFGiiltWLQqU6oFjBpy9f3g0xd0r2Cm3F0LZy0v1K5c1FFHIrA5s91wprhgnfUaib910AiuLJmJPF0jNKVIpoCCOjFilyzUBNH+ht6PqivSreofhaFefMK8eeMQxuIVe+iexVjwRdhwgw8l3lUrYwLsXV+qBmQz1q6OxC6gpA3oNbgp3E9+3m0QNHe4DGvLSVlVaMRtDTDAkGhFg3nu/S4CBNKaXu0as6ayL1g8onaWoN7WExDFTA+5slQ8uRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2pk4BZL7E/bOOD27e+1UICQRmZW4DhCHaIwYeJS46/E=;
 b=TDfW55VTRUfw7eZ9nwR6Vw0Kv26wNLs+lD+35lxGQfMrX5CJ+tJjjRaT7cWTHIgG9aYu6iC0gCSxSkXB0ZnpVAXfUXxiW+0Tsrl4w6szv44VHYTopRlGlzkFjM6E/fcCX2jLCZyI5AQRswUUDWBKehtvIr5jTcPIOC3W4lXc4Gp6ggcusO/2OdQJ23K2iN4iuhuyPd25RdRoDE7V/YPaCId8aOjJB83Qa5ysfnhXzlmlqGFzHZWwjq+RwPCbrmzJNSBw30b/gPiz6MYQ7WRw72gjsK4VmhMv+iHgJD9E5es8H8jaqXj6nzonrqvfC1CP8bda/CCMZVSz/8AqXsct/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2pk4BZL7E/bOOD27e+1UICQRmZW4DhCHaIwYeJS46/E=;
 b=mY2ziEY2PmMjFsGX4I52w+RZUn1eTZUj1bHHdhA4MMYfR08RHCNwe9XEHedLHAwTwMt+0HHhPKQDGoxMQLQpCHtd4cLAgS5n+jeIYwCPDt/N5w2OaZcuDbegElijdLG/MJtqxgEWKhi0sWXA8DcB2/+SpfX5Z3In9tgFPtgI0+EAY0jUWGSdD4gQMvtJgAFmsy6QCOOjpOgWsJZThM3XusksSKdWCALm41ezFQnabi1Bb2HqI7wUzbUQR6kh95pSnxXbuBT5fgDCPXMeGLttIbymJhQ5WT1eq4N6D0sSXRbC+lLfhqwiKHhztuAr/K0imaXpU5n5f+G+q+U5anwOeg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9) by
 TYSPR06MB7046.apcprd06.prod.outlook.com (2603:1096:400:46b::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9009.21; Tue, 12 Aug 2025 03:54:47 +0000
Received: from SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666]) by SI2PR06MB5140.apcprd06.prod.outlook.com
 ([fe80::468a:88be:bec:666%4]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 03:54:47 +0000
From: Qianfeng Rong <rongqianfeng@vivo.com>
To: Akihiro Tsukada <tskd08@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	linux-media@vger.kernel.org (open list:EARTH_PT1 MEDIA DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/3] media: pt1: use vmalloc_array to simplify code
Date: Tue, 12 Aug 2025 11:53:03 +0800
Message-Id: <20250812035310.497233-3-rongqianfeng@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250812035310.497233-1-rongqianfeng@vivo.com>
References: <20250812035310.497233-1-rongqianfeng@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SI2PR06MB5140.apcprd06.prod.outlook.com (2603:1096:4:1af::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR06MB5140:EE_|TYSPR06MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: aa45b728-30a2-4e59-094a-08ddd953fada
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xOlkr3tJE36e4D6hM8CA5UTAjEenMG5ZSoR/jUrxiQmsNId0mj8sRiX23PoK?=
 =?us-ascii?Q?FKd2Z2gwxQmrG6975ZeBLjMv31h38GTx/AKMbJW3/WlABC2f4nHVKurXaw+P?=
 =?us-ascii?Q?RPke3CuhDpPqHdxhl3uOOXDzplF8IVBQoVFUWo0ZIBfPpo5FoWFV+RTGAvdo?=
 =?us-ascii?Q?S9mI077QYSNiV8I5Or8XFp/tBgLFT7J/vZFg3CKgthj8raW+kntWnlcqVcZE?=
 =?us-ascii?Q?r/o5G8OX0ZKA1071mgCpxNf3T/8bWSyIpt3xmKjoikLhtZwjzqgPp5glpIOi?=
 =?us-ascii?Q?6l5A3ZrCF+M63MpQtHQGu7poql3Q3X55weuguLf3Sx6yjONQCa7/0sAXnDAh?=
 =?us-ascii?Q?d2LwZx+BUQm6fEV5HawRswpjiAVSDEDqxD8pc18x2QasGGQcaD5LO1nWwOlY?=
 =?us-ascii?Q?3k17Z1fPU/G04kCLsKAJ8GrgoX0QFjkHQLkGVcaB0DHyWkckNq1hNcqNT82t?=
 =?us-ascii?Q?9p/ndZhdA0D1rkJ/tnf3mdz5C+aHvndCbHxQfo8vsFUad2vh/wmaWi0HCor8?=
 =?us-ascii?Q?TBzMHRS78VmG2Xv2o9LNiYH607i1+huVC/bMz2cQ4q4w5fLvEnild7/U2EmR?=
 =?us-ascii?Q?uRVtgttbztEcFy4zgAAFc9iOhHogh3Wz1tXhDYOHjVUkCeIFPcM0ACPNR6w6?=
 =?us-ascii?Q?0GoPJsW0P+bIKBNdAQlRKeWzJny0CBvn1aPx2IQjzwDnhtWLzlbVMZAtv2sc?=
 =?us-ascii?Q?TmGrj+MCk+xq81DHMDG++A+P0QtCf9EYWYo5quT7AgMmPG38967kA6vrdemd?=
 =?us-ascii?Q?RANAsHjO0avdGTPwp9vwjFp5BxMZxtrs8NoDeyXcXaPWNf4fjU0HneL091eu?=
 =?us-ascii?Q?ZLnn/HEHp207MGph33f9mdI+fslfg8qwOJyo45sVeDhcdbzPt2U9vZlnzWeT?=
 =?us-ascii?Q?K2QHSWYWa0rEqSRTI91Z06RFoeMiRlfscJq9bYsejbslInHbAaw4rb87kCJI?=
 =?us-ascii?Q?pUZj4yxDcv+nhEWv3bTQjYGcTYHioS89B3KdrGnqex3QqnVo1QNfR56B+dA/?=
 =?us-ascii?Q?hQFM9FZOb0xHwv18/QBxZzKTqU//ghrNgwIKQuqo1Q2FUJ2rSM28kvkCo3pA?=
 =?us-ascii?Q?OI4M5T2OZMvXyKYcOs+vX93BZadGWSuynUqBnEBQgx2h3eL15qVlsqQ20jFl?=
 =?us-ascii?Q?Sf7VQPFu0PIWEK8/89VCy3Cimn5iQj+Ktapn/Gj8UnDlXFL6tbYAw9At8opC?=
 =?us-ascii?Q?pOmjzzhHHQ9xQS0M/UPU5a+T0a9oLLPC6k18c9vdtsvETWmoswEcnb0d9gW7?=
 =?us-ascii?Q?CsJGvk4+SrN5AvgvjHDnX94+Xf+CHHr5rpx9xVqad132wUlqPj9W4OMuTC5x?=
 =?us-ascii?Q?B9mZOjNlUCmy+hXoVJSRn0SU8tKzf8rNZer63hxXtAaw3wTdwTXn6nc9vE1i?=
 =?us-ascii?Q?7mcX5gi8MdqN4pmqmVyK6C2JmQHVezF7uaavtmVYK80eNKcdZ1Q0QcqaBpoq?=
 =?us-ascii?Q?CDY0ZcVxp4nRvDEWgPztyOaLSenUfSAYcqfOS6Nw1mH13QiKHJCk+07I9tzX?=
 =?us-ascii?Q?4B3B8a8gxBgIGi4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SI2PR06MB5140.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Ha5atf/ydp3u4/Jmd8F+gMLdQ+NqTpdVQFdi2apRTSDJX9BoEC47DMUawMRZ?=
 =?us-ascii?Q?mLKXg0e7wjDe6MnpGn1R9Skynly7b1wJWBbk3aAKOzbR4UqkJoIdyCNtSj9B?=
 =?us-ascii?Q?GAq9mnqfixlY5AAtm6B3qOa7jPaqdc9NjVBdab0eeJHCGtgLTQtpg3qZbi5Y?=
 =?us-ascii?Q?9NORCyFRfTz82LKnKz/ASPHfTOW4AWW2grLZdMub4AcCEtAilgVnk7S0cTyu?=
 =?us-ascii?Q?AdVZyyN/Y40Xu1Tb0mRwyRhG6daKX3eQLWHspnTqqL9kX0STfS4K1zaniGRO?=
 =?us-ascii?Q?k3vjC/QrdNYrSjKx4XmxC+Xfe780ixFU/g6mWZQ7t0+A4TefYOXW+30L9WKI?=
 =?us-ascii?Q?d47ChrusnsgokZ4XbTzGR1MxP0hfScTmetiBDOCZbL8JI9o6jxUjp952FutI?=
 =?us-ascii?Q?nIYl+9g7eLzsUrd/h3DA/sW+QJgusIvY6n20ZW2v30nZr0qafs1t4n/Lkt7c?=
 =?us-ascii?Q?9r5n5b9A9o9NkaMHEjyo43qfDtZGv3kpSICsnxNj9+SA38x1/Jdb8XLhkFAq?=
 =?us-ascii?Q?le2oS2Umy2rVGORv9Om6Hrz86dMoQdLkjbo0MZd5RhktPnfY1moXbFqwHEg/?=
 =?us-ascii?Q?3OauVhs5947+8MSg83Xm86D3qOyK4LNyIuzsS3Rcmt4LkGndDrIbQbMCPHid?=
 =?us-ascii?Q?kiJSiId591BZ6GA2LytOD7UMMa3gEGnSr02qfy2pwF1u0qdrvBrhaiwefpho?=
 =?us-ascii?Q?5DkONb6qUKYzYNaj26S61GAFtJYQfA9Z92PScvpwbYUHaDt3o5rxV+HN+ZrV?=
 =?us-ascii?Q?rsVAzViy8TwJGvuGT2B3fD67JXoIbYocmybGnECGBoFj5TUI8O7gemd2Slc1?=
 =?us-ascii?Q?qSYvIa/kikH7xxT+wrHjXs8i6Fn3BZWpxsqwiURgtzxKjlSWgpD1oMIXxq0t?=
 =?us-ascii?Q?ZKA+36FC0tl8PWtFA8bYKi6Gtv3k6ShVKrrEyBA521GV17tww8jRQoq6zKJb?=
 =?us-ascii?Q?pUhMhAA/z2LGG2+EfM+6Jl7oUkw1dv+uhv1ZXW1LnkkWfVgstmHypM+bQBhf?=
 =?us-ascii?Q?PsdOJUNw8SFRgYSLhjJOuy+3MQMc6rtX1G+epiVpeC8HyyAO1inJJF8+UxSw?=
 =?us-ascii?Q?680wknQkdRiUf6x6FQpYEBIUkeJ80lYL1CTJeigxza8FLBN3T8fnArCkZzoP?=
 =?us-ascii?Q?qFEIgCUwVSDSKy1f5ipzBwJp0F8SCxs9bQbvKVUdrPK3topJZiaBRA6syAeH?=
 =?us-ascii?Q?X/X9/w83pM6yuWjjRHWa29m9jRiF9fMqSDiQwBKH/gm/mynKGlTjsCk42sXj?=
 =?us-ascii?Q?bDYw/elLoox1e4vVRMhlJwZ15FRXbrlfzVDfFFNYhWSOqaDWs8c/UkLWKb1Z?=
 =?us-ascii?Q?JbIku0iOMsVWgEaRITs7LYrM10VNukyBF0rmPfsdFSCItSVbKVLCsL33sOtC?=
 =?us-ascii?Q?HiJBdk8E/Mv5+dhKGY1yNDlPS3ppOf9dclrjg232JlD/hccMffO6HDIDd84I?=
 =?us-ascii?Q?BlIWb0p0JmypJIAFCJ/6iKPXgrapBarwkRMSQhrEGaM+DHtjWAuDYtkjavKP?=
 =?us-ascii?Q?uJMqn3LS9Cju5BFD+b90jaEeSEga7lZmMsRixkYAby4isd8JRVfvWYjBZkui?=
 =?us-ascii?Q?uja4hcInNANPLCrd/OdPiB2mLLKAQazhm6neJ1G+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa45b728-30a2-4e59-094a-08ddd953fada
X-MS-Exchange-CrossTenant-AuthSource: SI2PR06MB5140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 03:54:47.6955
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OEjl1QIQ3PvPN7CC8U0xiTAIpU8iEC6gn/SNmVBLve4wS8Bg9F7ttNaus0l62J+mBNnNWdyw7odFnvgc4nyF7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7046

Remove array_size() calls and replace vmalloc() with vmalloc_array() to
simplify the code.

Signed-off-by: Qianfeng Rong <rongqianfeng@vivo.com>
---
 drivers/media/pci/pt1/pt1.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/pci/pt1/pt1.c b/drivers/media/pci/pt1/pt1.c
index 121a4a92ea10..1ced093583ac 100644
--- a/drivers/media/pci/pt1/pt1.c
+++ b/drivers/media/pci/pt1/pt1.c
@@ -639,7 +639,7 @@ static int pt1_init_tables(struct pt1 *pt1)
 	if (!pt1_nr_tables)
 		return 0;
 
-	tables = vmalloc(array_size(pt1_nr_tables, sizeof(struct pt1_table)));
+	tables = vmalloc_array(pt1_nr_tables, sizeof(struct pt1_table));
 	if (tables == NULL)
 		return -ENOMEM;
 
-- 
2.34.1


