Return-Path: <linux-media+bounces-23801-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 084659F7DA4
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 16:08:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 866DD1894CB6
	for <lists+linux-media@lfdr.de>; Thu, 19 Dec 2024 15:08:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED937226548;
	Thu, 19 Dec 2024 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lcj3Nbhh"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2087.outbound.protection.outlook.com [40.107.22.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650CC226194;
	Thu, 19 Dec 2024 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734620838; cv=fail; b=DrgLR/nVl1D+Q7NMLI3WQghKB0D3+WieHJevGLJNui1oA0xCmj9/U6pPkvLSIFvA0sHsNPS4bfFdQ4AWBYtqnrb4Rt+sdeUX6z/HaFBEFUq2h96g7EPIbbysoU21LFomOwnuhgtNBYy6m8DxA4RUez5dkSxdK/HUh0uOZLGMaPU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734620838; c=relaxed/simple;
	bh=5d5/Zmp+CrKLtQ0TiesnTSbc+HJfaJnqgdvAeMzGNBA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dr6PV5fgmiMeQLV8qF4woRtKMxyHJWPImF/zzD6GTgo/eo8rrGqterlaciiMcp0ExmqWiNG+gBj1Kl22mFgrzbq+Zuv1O66eRlbf3TXpHTTyJEInPh3EoXuj/IWeKZVgNoDDUa3PsOZQH1uPM1G9ezVNVsQTiPy8jYd1JTBj9xA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lcj3Nbhh; arc=fail smtp.client-ip=40.107.22.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=muB+lgsyvBfUIeC1K5EzmtIygrLYWZNjDxLrme/XhlJ1YZg87vf/OMLde2Fxh7jh3B+Ly8zo49KR4T8y1Nhpa1PkC+Cv7aZGOyQwB6ELrdqcarWx3NMI9nTyOnH2ElzmWTshOric6HsItCysaIi+pUjlxkhs/rrq3YDVINvntA0+ohEexhjoSb+Gdh3W6ehD3DRCOXzYJ7tqsO10xn/gHaic2hB6eqdR+IuK9Eqxb3dQuvSxp6WceBEJ8kUggrfBDWFJAyNSPHqLZsIt3Le03U0/11gwL2wT3Il64dqcFgnlubpLGOBWGwqI47Gq6TFaiUrw8BRqu+CdgIHsSCGJkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q57b5MZjvIkdABDvBH4/96UQ1j433mhHswAy3Sa5U48=;
 b=KgxCaeIKkBYQ2XU1UktLGp6SV1DTiwlGZCfczgpK9FkuHHWu+n7HoJ4ewKKtFfC80YhuH1HQdyGa34I2P+FTT7u8vHW17HRmNICHsStS29mikmO6momDKwGw/fSbjNQ7SChxlHmUhzmiaY76JO1Z4vrnyNo4/ZfxQeGsAGGKeMGUoR5emCWKjDRL2TR21rkW058dkiBrXmLH8/qdTrpgCLradLctPYdv8ONVBiI4j+Vi28nPKw6EbL8vTEiQTRz0aroQSFJuOTrqZ/FNQ8bqtOObWyaLqiNyw9LtnQlkqSL8PPUhAU/yjnyv4nqpK8qrASvrEhfvIl5LZR08E4+C+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q57b5MZjvIkdABDvBH4/96UQ1j433mhHswAy3Sa5U48=;
 b=lcj3NbhhgVdWLg6nZNJhK3sxnQ700E8I0FsNIRGcDPIWYYONvM70bYmJrxK6KveQWzSSn6FXSYTO96LXVxwwFz0PRfQP42eiEDHrohPHu0zREbGcgtC/epod7oz6sIGKq8Kod2RGgqY4HbCRKAT403QIDl2a7CO+p7ew4BWR7V0A8jOiPYxsY9Exy2jr/hmpJ9GtldIB7Ap0t8EWmNqCqShRHqY8rzZtU4uBUyt23Dj5EcObrVH1DDYjbDhgca7IAAiFwgwKXDCup55ntQsXy4IK+vCLt0ehpb/eHsz7G5DwkWMCu43P/zVHkaM9d+mtFLuuuvdgvARoCO1sLzqoIA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com (2603:10a6:10:305::16)
 by DU2PR04MB9146.eurprd04.prod.outlook.com (2603:10a6:10:2f5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 15:07:13 +0000
Received: from DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e]) by DB9PR04MB9578.eurprd04.prod.outlook.com
 ([fe80::4d55:dbf6:a33f:8d4e%3]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 15:07:13 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 1/3] staging: media: max96712: fix typo
Date: Thu, 19 Dec 2024 17:06:41 +0200
Message-Id: <20241219150644.64507-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
References: <20241219150644.64507-1-laurentiu.palcu@oss.nxp.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AM4PR0302CA0028.eurprd03.prod.outlook.com
 (2603:10a6:205:2::41) To DB9PR04MB9578.eurprd04.prod.outlook.com
 (2603:10a6:10:305::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9578:EE_|DU2PR04MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: 756e9b47-8ff9-4889-3aa8-08dd203ed189
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?6fZxdE4z0DpJl2y6rqTYQ4K8z9cNjv3VFGq9XXgo3JCDbLjLvG28qMECli6F?=
 =?us-ascii?Q?uGOf0X/R0CHgBn0nzoMm189UJqb0JyxpyjYl8EulGhHn4F14LwJDDsKASCh4?=
 =?us-ascii?Q?/CNmXNeOy27sxy2qX1tI4cLWnU2pcexk7JDmLCvgqDbboNGoYBGnQAXjJsUN?=
 =?us-ascii?Q?ClvvlSsW1ErYg5vx9WOxPUSFMqPpM0Tu9gyGzXytj6Ykq2DX2zP19JaR7eDV?=
 =?us-ascii?Q?BG80fxiXKWIY5xOppThb7ZuIuY7X3onXXK7pJXK41FJ2LJyOTd4WyuXWILPl?=
 =?us-ascii?Q?ucOTU/PNsMFdEdmDKy7vm6AfxzdKghhviwa6eDH4UEUH8t6ANpxtpvug1SV2?=
 =?us-ascii?Q?+PjpqYFXofrHtfz8101vXXYON3oMSWIYGQmtPexCcLDe6x56Qd0XK4eFXbJt?=
 =?us-ascii?Q?X+WHplHvRmCaCGvYnlOJ++d7VzZScEWNia4SNOu1nTLPCRujR21/7abW4jgZ?=
 =?us-ascii?Q?/YQJy+6ljgqZzoV0ld74SbIatUVdFmOL02jo389EgwuCxIMyJ7wC20ql6yOr?=
 =?us-ascii?Q?pCDevJ8QY4Z3Szq8MGKo9y8028Da2PZFSnsBMtTchqicdSu8fKF3yZ55QcBu?=
 =?us-ascii?Q?sGQtXemIN2bFYcX5bjJ9WKfkmNEKwblGPJMASKAgeRcyRBeigk8J8WCda035?=
 =?us-ascii?Q?yLsmKJZ7shmRKnF3pQCa/Y7ACX35ZceQNx3GllZBUzZSEqj5TFf6O3ACURV0?=
 =?us-ascii?Q?mTp44CrPEFCxda1DnNrn+fLC3zNC4Wx7yrbSfFk0WkMo2efusU5JUjLbGg5W?=
 =?us-ascii?Q?ukzeTecLfVqte3K4i3GG8t0xHdrU+wmeUJnopI5Q2hLkL+pAGPksWP2UKFlP?=
 =?us-ascii?Q?k0oCmprCbDDxVB+h/4czHVxGRZQGzoXS61YMOp5EaN7gk0puiPFmikZ89Hou?=
 =?us-ascii?Q?Kqfm7pV1lx5jvkqIxYHRqdm4YDvLsMvMCgxJbGYv1bIXI/8NKRwwlOaWbU33?=
 =?us-ascii?Q?IZX5BGH9iquEXAerxvytg5B+iPlO0lom34tCbHnR7lrTgFAoqBoXFdCxuLQ3?=
 =?us-ascii?Q?Wcfa+3xljG2fDz2Fd/NB3bduMii9l5C37MbQCrmz34/5lc2XFv5k3390AZSx?=
 =?us-ascii?Q?hWYjnHX/0uy52jx1WgeglYIYefJe7UhvW8o/CQXo07WGDXAQFBshrFEnLKCE?=
 =?us-ascii?Q?i70FvCA1r87cRHgFbNu8CSh9/II+JTox9uUunup67x9TZrsNwq+DaXcGgat1?=
 =?us-ascii?Q?kUofRnPFlqx/PHqvU4skgvn5YFKZru/MY9PxLA2pOyedZN7LzlwWa4ztlLPl?=
 =?us-ascii?Q?fm28LoGUXIYykgz8dlx8molqbkFg1eXzkUQQ568dcDxGzr+rZGRSOZuB83/K?=
 =?us-ascii?Q?zRsX+GnDjKK91wdj59fh0DpfoqH8TE0vxWeraJ9hEnWXO9xbdPeDM327i7fe?=
 =?us-ascii?Q?zH1ozp1NRS0znCh6gZh/YF/NyZ9s?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9578.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?VP0Ic4g/x6570GU/MYdi+7/FkMnkqYlUJV0hQJ8OnEgJFsJniVEae0/pTWWx?=
 =?us-ascii?Q?7624wOR4qFuHa8k23LJAiYxDHJa7QF+6wUHDxFL1JClh7k66Njm5EB+ZetyF?=
 =?us-ascii?Q?5t2Gtdc2ILqnwjxOK1zMJrLRkcoQrfMrXMluhfZToCpi5R1Knb6tQH3zRXpE?=
 =?us-ascii?Q?oOpvfgSH34ak+5z/rL4pf7J2i/qx8RRdCh2TQvbYj88te+2H5ESYXdubCAjA?=
 =?us-ascii?Q?2T8FAMvDP67U6vH0voKML/PCgKvdMGrdXMJMdiXoA/7BQ6qYVAyH0/yoz3Qv?=
 =?us-ascii?Q?EdDwTmQ6adVs7aUPJqdQTjhdu092rob1vm+1AewoVdivD68xzgqUxuaovFD7?=
 =?us-ascii?Q?WGQU9SEtgfrl9iw70Z8FiXzu+L13n6vb+ho7L2ghuFaA6gQ9LAwlY49znivW?=
 =?us-ascii?Q?ekJ3UciVAmXOCY9exYRVnmv0OID7wGjPUGme0lp9N8ualdj5fYgoZvbi5tLh?=
 =?us-ascii?Q?2h9gxNbaUPo9X1pzsHSXHix0PMrhHsFqEq2OkKi8BpjCEAjpKnyX08fd7VTK?=
 =?us-ascii?Q?g5oLlyYYqPuZYwz7fj0fU663WIU1WG93er+K3OyhZkaO+VGgNdmAC0G9lnQA?=
 =?us-ascii?Q?Mfyye67LXkKHtclUG+SASE2d4gCjxf9VBcGpU1bjzjVXYlrvE1gHETcxlgwB?=
 =?us-ascii?Q?4STaAKqvXvrfX0RUK6N6lByD226T9sRImSPgJWPRadxf0toV2ZJWMp7hnuRq?=
 =?us-ascii?Q?pP8rLFhGyBzDpaFBKl3DHZm3LoBnPF9q8ymDrk33NapjEMwMr7O5sWqvj1DK?=
 =?us-ascii?Q?CexzRbpA/API9x/0j3wBPdo4hiKkft4bO5nA5N8isBTr9Y0RLQ9n5/eCUwJZ?=
 =?us-ascii?Q?alTQJv9svXPs/OaofEVTtPvgmQz1PHhkot78C2XE/KJ8D86jpW5cg+Nzfgom?=
 =?us-ascii?Q?Lj4+ngtf9nudQHN6FAxIyk0C7S4ZVYhGVRUO/sNAHCgGYIV3V5rs1Im6WV8Y?=
 =?us-ascii?Q?RF2rako1YTeUIzRXozvEFRsPb+4QU+3macgjw0hbOaWySujJzXOZzrHf6BHr?=
 =?us-ascii?Q?mAgQp7p/5mOmM1/+6Og9PaoNigpDGnRBFq8gv5OmmmZmC5vVjKt0U6F7pmlA?=
 =?us-ascii?Q?83b2jGx+XuCtMFh82Uy3v5yu80xuklWlKv1tIcMbfISQqQGtIo3flLtlmtxy?=
 =?us-ascii?Q?CqErRg9Cz87iTL2LdSzWfnslZYikT9AGhG5lLQ1yPTF3/6jqgNbxVs6xAPAd?=
 =?us-ascii?Q?bHY+Qm8CIM3sOMW6s1K94mnNWFyFjDBCTt9lWzcF1CTR2/3ISA/wdFWo8CWc?=
 =?us-ascii?Q?vTpC9PVXVbyeiEC8gK83gEad6Cn693mUeSTIkP6Nfch88aHYPFxSMmDU3Sh6?=
 =?us-ascii?Q?x5PL1BHrEIT7EBKG+4fqEdnfdPssxvvH9A5Czp6POUhE+gChUORBxhkr8R6t?=
 =?us-ascii?Q?1v46vGdLqYUdaY2T94Ex1ZJ52Pugk83S8IJ5YryqHTRRSFFQ3NqxgwphYj0G?=
 =?us-ascii?Q?aq2P46QH9iexErykCvMp/8Wwo7DWP9br2RuK0wcPaNVw5KYy1tX6mh74wsw+?=
 =?us-ascii?Q?WwUsKsh15r57KC9HbU992mRff/OoSPnrtf0OPCTIERNARhalm5ph3vl1FOjK?=
 =?us-ascii?Q?R3lV0f+f13qFGOu/qdiGQqnTx1gIzGk2gsA66b8Nsas5sPorm7/49KYIn6IV?=
 =?us-ascii?Q?1A=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 756e9b47-8ff9-4889-3aa8-08dd203ed189
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9578.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 15:07:13.2954
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3hGYpEBbJ75Swk3L7OPAMgdVE3GC5m6fAh3pOHcwgKYwviejsqnCn5UaGEOIkahUlPABGFwZ5BOVxmBphjO/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9146

Fix a typo in VS_LOW expression.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index 0751b2e048958..5228f9ec60859 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -182,7 +182,7 @@ static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
 	max96712_write_bulk_value(priv, 0x1052, 0, 3);
 	max96712_write_bulk_value(priv, 0x1055, v_sw * h_tot, 3);
 	max96712_write_bulk_value(priv, 0x1058,
-				  (v_active + v_fp + + v_bp) * h_tot, 3);
+				  (v_active + v_fp + v_bp) * h_tot, 3);
 	max96712_write_bulk_value(priv, 0x105b, 0, 3);
 	max96712_write_bulk_value(priv, 0x105e, h_sw, 2);
 	max96712_write_bulk_value(priv, 0x1060, h_active + h_fp + h_bp, 2);
-- 
2.44.1


