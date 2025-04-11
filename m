Return-Path: <linux-media+bounces-30046-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C05A86423
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:10:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D5FB34E35DF
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 854A22222D6;
	Fri, 11 Apr 2025 17:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KEymjIYJ"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010044.outbound.protection.outlook.com [52.101.228.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A5C22C35E;
	Fri, 11 Apr 2025 17:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391240; cv=fail; b=Gzle3hzQgCG3DmbuBGbphNNTxxLFW8/PtHMTVQO69UHl9Cx1LCYh138esoiQg9K466i+Z+SVj18av/AD+t9cQRsIcAYk1821CYgc4oS7LFmItYEpLa7TohsgZL/27znj4SMZO6eWrOifPhZtsUHrZ6yplirzTC+8IFdZzSvAHHY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391240; c=relaxed/simple;
	bh=66xXUnrKZNA3NU6Ssqm6z65XlrTcnHLH1W3SnVeC/48=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q1RogW6LFymn/W/fJHSSaX+OwNjWb3BzI9U/dQEb8DYukyWKcNEGUMwQZz1ZU/OZ4quH6ZMHi1UgsSibKfxxzrMgXqRFNaBItmttyVmml7B6cx7od6LDRt/SN+2u3MSwYHvHPj9KLXYM1ct5KjOTYoGbcjYhfxFHuQodLEamWtU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KEymjIYJ; arc=fail smtp.client-ip=52.101.228.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XtLdv6GG3OszQ4cQslmAszZt34y1Vmmst+cTXLMncilLNQmOqt+NiWiiztYS+2LTZfFQlJJioVy22IGfqWtfU6Eu59LpoWPcEjl5yvaBxRUW5xUdEb71NsfU8SeVFgeDCt/ACWQk0rq0IlYbyTq7obeIRjvmte9ycKyVDbqlW/uHCsSH4gXS3Uiqxs/5zzxnXRf759g2tRGk7XESPfp6TTtpwMCIzRxHs5hicwptwJwHyG9Z6SNxj5qkn8/xxfsYOxQOVutu81R1x5xAmn6jj/uKh7UFg1W/F/pKq4qu4FfrGKvK5qG/k/SVmPTHL5cVmdZYZp6+PX33vS4WdZR0oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Omc5F4uisa8utpUKhjmd6yIlHr37k/GjyLMcJmSW1zI=;
 b=o5I6EIC0ZkCjq0d75kabxP50SOThNnm70gB9yXJrkdzinij3IFU7cVLlnjn8KFSpiWoUS02B5J4sdyrGQ6vEvmSIgqRygca3QJFqTsJW6WAyFn1BFjtqQ4DtdleDEz4PIW22fEEPgNKekstVmyfBxTd8rvQ1gTtpKQt63siWWPCB2vAqjhUUlsiCsrfYBb1pUMh+YkzyfxKKO2AdqdG58ewbS0fdN7bzhriCsCvMZogbnFppLSY9ezCOb232VPWFo5cxnqHN1DnZztp4TNwr36fEqN4xGhQn+A+q0WjS4cJ08U6PZFQzoZim35XEfxnY3GF7urXP96c2vux2ChsGpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Omc5F4uisa8utpUKhjmd6yIlHr37k/GjyLMcJmSW1zI=;
 b=KEymjIYJroOCGFbno0yZowJj0hERB96FYkMv3VZwF7/qQGNys67/a+occm95GOTQ2NBpM0gJSwJLwqLhAV14cUW5MMGZsdvMRFJx98ffDvDV1stDIOh4TYTOkXUY6dPtq/sd82woJb2QU6wamRegdU9j9xawoWCg/8wiyItVMlo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:07:12 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:07:12 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 04/17] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
Date: Fri, 11 Apr 2025 19:05:32 +0200
Message-ID: <20250411170624.472257-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: 782bbc77-8386-42f7-7573-08dd791b4d27
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SP/sLWG8QN8LzGhAHZaTNBcTFyT25GAZk5QrVeABMYgGqH7CCSB7O1udbtVL?=
 =?us-ascii?Q?cwb9bN9zhoLZcakSU7nJDCJyAar2mQz2WwgaHiuQR6LvLSkObPUPTv/3dxBB?=
 =?us-ascii?Q?C4gi6dEKsDiRX0h3ta2kQTDBYRidxLDSorFNpM5K//m+ApuvTZgeUtaAXim3?=
 =?us-ascii?Q?GQPPbvr1GdNd56tjLATWyqDzsoJl0PsM5VD/Vi/eRhtqObzi+D6S61ubZOdI?=
 =?us-ascii?Q?VPsIt6kFdyVdcLYXte4//zJYbK9fTEkKw4ZV9P+A8S9oYBuuxOlP5iQA2b3B?=
 =?us-ascii?Q?xaVcfdKmv+4ErKX52/cBn2fvDDrWKpUKPKVCLWD+qQR6cEZYeapdZA/mpWXY?=
 =?us-ascii?Q?Pp4sprR9zgABFMC1ZQR9ftEztC6fhJWjoI5eTzrjkUuxQ7Yhv5tf38xLHvl7?=
 =?us-ascii?Q?r7GrPKaCDz9oweQ0wN84u1A/IjwarRbOkxOt4EmGkwtNRc2n0Rexf6Zwp3lt?=
 =?us-ascii?Q?4f+bo14xyPRfYhckAhdzhroBC0HbsZWKKa7oJCKQhwwMf+j8dRf5v/j23IG9?=
 =?us-ascii?Q?+7mzZeNX0l8+nu45nghx4jjeej3aZHEPC+Rga7G98m5I0DG7UwwgMemJVmlQ?=
 =?us-ascii?Q?V9UtPxoshYz8q4URP/QXzfq4MdH90ZrR2il0IsJdD18Ar2kBKiX8+e4zJPvJ?=
 =?us-ascii?Q?m9SZG2v2WMB+ZBGNcEhIx9nV2Qyd4VZKGo1IErKcvryJvyrdyKjZNq99igiD?=
 =?us-ascii?Q?DR1SQWk24WAqmKcTZVbF9anQ5O1u5Ca0HwDovBLCS/FgvuxTGUry/rMw8J17?=
 =?us-ascii?Q?T5Ke2dMBitYsxPsT3wcV4RJJ4IAbLnF3MGsTkkHbI7BtSgrlF4E8efIwUzwi?=
 =?us-ascii?Q?6IeMETVzInpC7CbobWTJfw3aD7S7EWtrWQHDfG+wYmcB9iqrXmIURFi2WRTD?=
 =?us-ascii?Q?zjULHjoRQbJE3IFCGW64xLyXyBttP6GclTDkQbyS2n0X/42JWaFg7G1a4Dkl?=
 =?us-ascii?Q?4tvpQviWU7emClkrSB2Z8VolILeCbNUv1seuzfL/od03akfjGWCAcVn3un6k?=
 =?us-ascii?Q?rs6dDf2HV+2QOjy6DJEqy4HfVgHEU96VATcJ7N0ESTSXmYDPhGr++2HcO8jd?=
 =?us-ascii?Q?aUGLdwvatknow1PvmRA8DQ1b6aZX9+T9e9X4pbwKUUqXXW1oNDAzSOgta3N0?=
 =?us-ascii?Q?u0EeMHdmWJyOfYo+U/hNAiOtABDf6yrAMZ2bcjKWvVSD7DscLZfjgMnuyP36?=
 =?us-ascii?Q?nxwmKe61DuAK+3Iq17nvLBoHrssJFZe6zl7xxU1cBkfBRnwITmdFk7NZ2t1l?=
 =?us-ascii?Q?RMauooI53leAEJZFHdHJw5HzAbwatahja6cs/bXjtfuSaaf7YJ8aUQTvRKGu?=
 =?us-ascii?Q?0l3HbHFfefVQEZed0RS5mIXXuz7Vhvyw/1VFNhkwoq4fG1cXoRKZEr8oeMYp?=
 =?us-ascii?Q?e0lMuBcKZQhcLFz5zHd764tgA+H4ow/zbE6hwCp4SffoNbECW9qec/Nyiyj/?=
 =?us-ascii?Q?VDHqpWXdBxM2q8eVzh+QGRZM+PAfZg4i8e0xNsoEqUE3c5G2GQh60Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?iTFeq2/pcLgGTQCnzPbiuCkxb5IQPyDyao3gshjIVLjJ11uyftpr1nL0ELLP?=
 =?us-ascii?Q?mh6zsyvfLR+UAPA9q39QZjBLnlxedZUkf+l36PZ+nod75HolEQXahg7JAeLl?=
 =?us-ascii?Q?fcPwlf7j3MGO5+emad5fl2DZp1u1Gw+snd+OLiDjbsgJxCE23zoUdrsOn2JJ?=
 =?us-ascii?Q?kfWsaNuzeZDnaM3JJOQopvOo6sN6HeJpQARFI3f8NyvoCKI1n768M4skSPjj?=
 =?us-ascii?Q?N7bUtB2UuBVBvrazjgWhIbw8TF5JnLsRfvDld72ay0thKgBA2fMUbl5iTGpp?=
 =?us-ascii?Q?IbZZThSBhQFws4fKXwuK2+OoufkkDJ/iC1i105rHCLT8rhMPfUHTN+44pIFF?=
 =?us-ascii?Q?RNPVD0k+FyEvnF374mxG4rEKwkGpzayFyKEadrh9L1uo/OwLL7wW7fEhDYu8?=
 =?us-ascii?Q?U3nDTNlw3P37scVPr2r3J7LJW9DIbG9PKG7XHBwqNgi5/rMY87dREnDhePo0?=
 =?us-ascii?Q?La+W1eNTzafh0mdKlWXwi0I4fHJ4AKagI40eb8qqEJClahshkPwqapOnaa6I?=
 =?us-ascii?Q?j4CQWJ6Vb8M8geomLkTMqZQiQKQBphULVcCYq0WBwT0Mb3G7oO4VWTYPuLvl?=
 =?us-ascii?Q?L3NGAAg8jn7m1imAfF2EB/j3jRWgSrNGiA8ngI50AaA8u1k6psHymY7noPWA?=
 =?us-ascii?Q?Yf2lxDPQyqIoT5MpTjzUc699/HElhpX07h0k+lxV/FpvlN+lUg5n0kK0eGaw?=
 =?us-ascii?Q?2JqY7/AD70f3ir/7IRiePmo8kNHXNFsaUrmLX85s8aKtDFN87ra1JTj1jwr8?=
 =?us-ascii?Q?E357DZA0NEXzxUdh6n9frYRxWqJHWsZwIAOHjafjfBcl+tVVr8bdN654qdXN?=
 =?us-ascii?Q?ILsdQ0LCc+8MYP4i5xyVodWgzAxiCH35K+4+/NPYHMhadfPV2mtn+MbD61WF?=
 =?us-ascii?Q?xlXzlWW9dHWansOFnkzoQPkOVKC5ey6b/ayOBXkZZzdhn2TRVCnz4UZd3YIS?=
 =?us-ascii?Q?zPHXoVCf/9cy8rG5o8+itKOyI9Ctts9Ero10US3tG0dYtfMP1xaq2gQfWjB/?=
 =?us-ascii?Q?fWgWlzMTfIC+bkrBMXX5pG167V3n5uVN17JFIRGV72vK2nee00y0L0/Sv0Ix?=
 =?us-ascii?Q?ws1bWbVaGsRG/OIFTyN16S4H+knF9Z5/Bkk2Zx3Xz7/C1VfUAXdOYLM6l2BM?=
 =?us-ascii?Q?PgkN6JhDxhoVAizX6F2vwmHnDPeNMYX/QvbOLMgu/k2XRRgvruwxcn73RQP4?=
 =?us-ascii?Q?Uoo7sIsI2LhSfBALZLLyu5nZ6vqS/+P+p1ATaHd9A7oBxj8ICpAyAI92L9aa?=
 =?us-ascii?Q?oyZvvRi6YiHzQX6frnc+QlRMIVgoFq8n8QH1b23H1bzOlRQKOM1LGL+kMc26?=
 =?us-ascii?Q?2my5k6wqjTNBVeWTT2p+t19MY8VclL0hOfDa0zx6BYUTvmzbX3jynbYkRARj?=
 =?us-ascii?Q?JdfxRhD9anPfIHyCNmf2Tq8ucGXF0rUPz3TZrhH4pQmS6+q43bc0uYD/fmIe?=
 =?us-ascii?Q?tOj7Ry8mo9FFdpAD5Vo656lhj9atlWoDnJNiR+kBPkWmtnfOr0cwgqTtVonQ?=
 =?us-ascii?Q?zJyWI6Re4dG+yZVDfVg/YkWAjYt9Zh5yCONxMu0HZZsMgkVPEcUDJQvPCKNc?=
 =?us-ascii?Q?UttgHYzsh/lkdDXuUxS/UAf3R4Irl5D+4o4JluouNHbXhvpqb8eOEMXWJFvb?=
 =?us-ascii?Q?IGYInyPrSfs+2MF0VusRCwk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 782bbc77-8386-42f7-7573-08dd791b4d27
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:07:12.2838
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMdCejU//byL/krH3u7xEDFy3tYy5oxKrZr0OfsXCDyJUmbrYE/KZ5PJPmKM2LzJo+G2EsGvVoGO6gT8A5JnlTG0L9Riq1JUDrwNVnw55IfP2VpwdkKEk1xlby/iXfte
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce023..948f1917b830d 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_csi2 *csi2;
 	int ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
 	if (!csi2)
 		return -ENOMEM;
 
@@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
 
-	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
+	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
 	if (IS_ERR(csi2->cmn_rstb))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
+		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
 				     "Failed to get cpg cmn-rstb\n");
 
-	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(csi2->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
+		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
+	csi2->sysclk = devm_clk_get(dev, "system");
 	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
 	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
-	csi2->dev = &pdev->dev;
+	csi2->dev = dev;
 
 	platform_set_drvdata(pdev, csi2);
 
@@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
 		goto error_pm;
 
-	csi2->subdev.dev = &pdev->dev;
+	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
 	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
-	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
+	v4l2_set_subdevdata(&csi2->subdev, dev);
 	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
-		 "csi-%s", dev_name(&pdev->dev));
+		 "csi-%s", dev_name(dev));
 	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
 error_pm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


