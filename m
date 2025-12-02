Return-Path: <linux-media+bounces-48092-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D4B0C9C226
	for <lists+linux-media@lfdr.de>; Tue, 02 Dec 2025 17:11:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B016349EDB
	for <lists+linux-media@lfdr.de>; Tue,  2 Dec 2025 16:09:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2E5C291C33;
	Tue,  2 Dec 2025 16:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="fxXihptk"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011052.outbound.protection.outlook.com [40.107.74.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5253A2836B0;
	Tue,  2 Dec 2025 16:09:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764691757; cv=fail; b=dPe9Ia5tJshuZp86QHAKX0fkRoPLNVC76aZ3qkZ7RW84vtKuxiumuXC5yqZjHxQ1WW+NNKhwovDrmaBzplIxtM1SLHreOx/bOMvhsZPMMtSPPMpO7P5qMUm/90pdSNsf8TPwDZ9T7fjsuuTLFAQD6gHgZ+8l+J9IqfA9D4mb164=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764691757; c=relaxed/simple;
	bh=uoOTkthahwsqKB8AGDSmaLHex5vBHwJuk5onwXs4l6M=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UwrA7+NdDAEnZleM/EiKmpM5aGZBfNEYTA7X9ldNo/Q4HnBIafT+SxLg2WavATs6Za17a2J4WKlPJBE+l02G0rZInCA/WiBdFLD3Ou7rCuV34aFKZ8pIBDE8juNdZsJx0w24OG7jcZPv2drFAVvTd9k++IdjoxV7XPurIUZCa+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=fxXihptk; arc=fail smtp.client-ip=40.107.74.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JTZlvoDVhemcsgBUPTt/WiIExLMTdxbsEHw4LPk66PBavhQYUUhSYnGLEaLTJtNeGK0hfnNT5kwFGraJG7kuxhZ/slmrnjMSsIJrWo3KB8mMkDCrUHOTYzfDtiFowayyTwQuMCbrW3C4Q+rWNcAoRA6OYPVuKgLdQ3EZhnbSbXLdm9tD0HK7fkyXD+MNnfj19N8FVqnUby/vGDhN3/sd0J9SAfan7FmwQ7JFt2fKahvsRNAxEkpEIA4wOU6iwZ3IADrzocAX4O53oRx+DNq+bv78+G/8Akzu/Jm/NCe3wS6vHXFKrPcMNqyZXr10XJaeErvsfi7VYM3gGVIRGRiz9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0vTQervnHj2zIw5RDrFQI5dDh3bCpvdQe8W1Hut4W4=;
 b=RwZdgl0PDGr70JuJY2vGXdT9uk+XnmL95qzCooKsQ4YHoYaboKcNHBWamqfhLAmlWZx7wbZxXTsrSYSMuxz6P2AUCQAXFj11AgKtfZm3Ms4SoychQqL5OPOBc2W6OsDNfwjbo+CHuCkoLUbslcqqbTFwa5Tuyv7T4vlrCpu26j/yGpinBWnYmUgQHaPol5jBQWLv5p/DhCqINzfxy26gxJ5BmZ5cq6+NdVLYNbXb0baUwjVGCOdVo92n/dkORZ1E5BPqKv6TPr4fKgqm4B5cIEaBAUd+GBq9kFEN9+Lnf131t8OOM8GXUUwq8Les73OPxiIK2N1uHaNoVIoJkpJU2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0vTQervnHj2zIw5RDrFQI5dDh3bCpvdQe8W1Hut4W4=;
 b=fxXihptk/18HMWaIpjE6jct1ZZF2RkBmRInRAKXKkPcZRNDTCyHLpEYLodt9MrE7shQNIguKLz5+Jy5PBBNYlr+nWjHMblUjH2OEEWF92kTpDvvwHMjAQDaU1hnC1mdAQNRHMhTMQbCx9x5rv5xKFpLV6vRJoi/jqHbKW3V4v8s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com (2603:1096:400:3e1::6)
 by OSCPR01MB14532.jpnprd01.prod.outlook.com (2603:1096:604:3a5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Tue, 2 Dec
 2025 16:09:09 +0000
Received: from TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8]) by TYCPR01MB11947.jpnprd01.prod.outlook.com
 ([fe80::33f1:f7cd:46be:e4d8%5]) with mapi id 15.20.9388.003; Tue, 2 Dec 2025
 16:09:09 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Daniel Scally <dan.scally+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Khai Nguyen <khai.nguyen.wx@renesas.com>,
	Hao Bui <hao.bui.yg@renesas.com>
Subject: [PATCH] media: rzg2l-cru: Replace usleep_range with udelay
Date: Tue,  2 Dec 2025 17:08:41 +0100
Message-ID: <8d9896e0482a1e04ae8934a1bdaaa7de73f919f1.1764691610.git.tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0184.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9f::16) To TYCPR01MB11947.jpnprd01.prod.outlook.com
 (2603:1096:400:3e1::6)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB11947:EE_|OSCPR01MB14532:EE_
X-MS-Office365-Filtering-Correlation-Id: 872ede98-edf9-44be-d528-08de31bd2026
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?wgV3hw9O+mtZxWoZgP0XqxWnuvTdkucC0FgGWIQALS0wRJGvhURJhqHt9rU+?=
 =?us-ascii?Q?g3A4PTgL9Ogjeq+8NBocA46Bz2Iy/aDtduAKjIpAe80hOhAYvyO2qyoZo/OV?=
 =?us-ascii?Q?MghYy1yMunw0RpjpbxZX+xpxcLiCGzGNHcyPwvylYATl736RUSj0ZpH87ddO?=
 =?us-ascii?Q?crvhb+TCiDV/EpPsq7kVlR8wZqk4qNqCCMeVqy1evfImQPBC8ATQRkP6903G?=
 =?us-ascii?Q?w7RLQQqDYCy6NsI58qL6wDfM24GAlIlfRJnGL2UqyVnyGjzJgLdD53SskZAF?=
 =?us-ascii?Q?Qv8h3Oyklnfb+zN5q8l6OuLjJDFZjiHhuw1YHqhkofz6RRJ7eM8eRmbTONCh?=
 =?us-ascii?Q?oqEZfQxuY8BXinMQ5m1vM/xDEMdk/yq1sTnCY4NWTMrgNrYUo41Oo2cwRp+O?=
 =?us-ascii?Q?e6IkfBLxwXvPeEk7CoP+SLnhSTZ3XXXw9x36HtSHvsXjDeIgHhlDcBJeCAoV?=
 =?us-ascii?Q?J2ObbzGEO+y7MB3nSffF15RiwfXJlSTzFaJed87JsqbKsMuoVnqIV4AnJAlV?=
 =?us-ascii?Q?Vzza5dFv9iA7ubz7JZPlhyJm9HKeuvaiDJwdd/OjquZKRDYwwRlfakvbOBLb?=
 =?us-ascii?Q?4et0u0VLZY6TH0pS96x1AOBy/PVrYlH3f+T2CX4BH8BKrZYH5HKmCgvOle07?=
 =?us-ascii?Q?lhSnE92BddU9ZuTVolRW0q5xaI3BdhK/72Y0HBnDq31kEJHPTTs9/xW613NH?=
 =?us-ascii?Q?acOaX9pfEWDMtbwA1rbih32oyG1sbiObYDFbp4Eq9edWyLJYqF5/Uz2/3y99?=
 =?us-ascii?Q?nLWdhYHHe+5NKK3LsKIxBur3IBrgkqgsbkWK7oOMspuCh2b0V5Wy5cGFjbZf?=
 =?us-ascii?Q?ymAPdnNLm6oYTUUVhwLADSBMlh8mcEUtXfQMTQF7elqMSYnKbVwNUNseCilV?=
 =?us-ascii?Q?Wq5gTxhMgZb+ERpgoMC97kWFqF3GEKEiv6mMp1SpMBUpjeZn0tboXsAfsRYW?=
 =?us-ascii?Q?x6KdeejXHhAEJqO8iRCvwZNN5aUUtqIFqfCQ9LxD+KyJWtNPKTOsebKpHvkn?=
 =?us-ascii?Q?A8ut9GIIt4He14OVsA0IHixoa6yvKyG5sza3cWUr86eGAj8XugwyQpB7r5S/?=
 =?us-ascii?Q?YXzynU+aGzLeQtDF6SpFGGlLfGiX+fzDh84fXuQMPM37QCgLoqXeZppTzOKO?=
 =?us-ascii?Q?9mTrMfzazojPKtYdC+SJTLYcS85rPgkQs4iKlXw5cQVBljoW+cv/nGWtllCP?=
 =?us-ascii?Q?MLbHMaN21MF2ZHysddHxt1+VKb3WwruDfcMzaOOHqbUbrzCShKWg2XjfXYXI?=
 =?us-ascii?Q?pTHJULXRHxs3oKANZz0huEArTKHgepB1cPH2vxmFqrVB+9FPHWH1Gm+YkEQ4?=
 =?us-ascii?Q?4hgOZ59W/rFU1zon/4Mwv9zEncJkeWKVNVYQvYC76AJGqzMJOufMO0oaAnrV?=
 =?us-ascii?Q?o6G68+cVDcgT5FDBzV2xhBN3kM68LLmmhTxoeXo4R8VPEqPQvvq9Rtyy8Xho?=
 =?us-ascii?Q?VJUNR9JvXyq0XisQ/gVMkMYL7MVZRlJ3y+7TcMJUhJws+8/goTn4j/RdpzZo?=
 =?us-ascii?Q?/w79VLkY664KdunapRSPVCda+MjiYscG5pKg?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11947.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?i5h6DFXX5tkvzp1lDZ7EbSG3EZ+jWcygYm6j66T1mcmTQ7tsT451Q0RnKTNY?=
 =?us-ascii?Q?hOGlQJkChcdLPlrsYSN8TA6eaC2zMHImzN61cDh7tBxNsiHLT3ulEj7flo9i?=
 =?us-ascii?Q?DtKB6n1rE+VIaLrsVj1cqQjFERlkD+/pOLocylnc18BX0XGGrlmE/ZxQ4sYZ?=
 =?us-ascii?Q?GUwFHqs/+5uH379HIVdvkmcmPpidfC90p24B8262G1eT/+9QbnLdLl/DCGzU?=
 =?us-ascii?Q?8aVQY2AnjcUdAzzOw55YbmlpJ5fVtNVZ+HZwRpT2dAxnSy++y0WTikw5dlxJ?=
 =?us-ascii?Q?oU6+YrWSEZ2nNdMwDt4uKLYXbGthVshi3puR9Z+AsurCJ3n7oLn3KpkHdRMx?=
 =?us-ascii?Q?og9vDgq5gY/Zl8HeMe+IgwEBVYz1okp8h4Mmkvnm3IDEZqUOyZkWwm5/Ddug?=
 =?us-ascii?Q?bFGFvCPn1Ex2wMTM7/4prLlGvbOj1A76I12mrBOZR3XrhpxsG3GL3Q4WgP/O?=
 =?us-ascii?Q?bwOACiTR7XPDabxIz9QHSrQCUS+mFQ3I8mo/9vr4sum6nG3vcyoV5V1VOo7d?=
 =?us-ascii?Q?szOCJPoWBE3ty96UQH99zPbkIqj5FiUDEUsnzS3E4PLGdn5PjsgEcuuuJkwA?=
 =?us-ascii?Q?cxtTjX7iR2UrvtwbBuTjVmQ9/H87XuQUQtIUpcGcWsSf6VfQD+1kpbOvzlE+?=
 =?us-ascii?Q?231kSwu6ykSigLstrY2TQPfmbBw7v9QXkJRRPRX1IS8JXwSrrUf5ArqVOl38?=
 =?us-ascii?Q?WB6vXWAyRAYTTuXAiP6qNa8UXDeCKV71Q+d2P5VlWdYbSNEExxRztRJmyZ2u?=
 =?us-ascii?Q?fKH6+Sp1MBLXxMaaSIMglhtu9nvmv54GsWpBtGHVDT3E4039S0LL5u0KsS9x?=
 =?us-ascii?Q?kiJb2HiALxQ9ULkar00jLM1FrqfBkr8sWuCKEPC5Rx1EjTD1Bo18Dl+iKspi?=
 =?us-ascii?Q?uOJuEUgZ0LBqPDm37Tlo1GX/7St4BuoK/iNmEG2S1Fxj3Q+f6azL+CjKDirB?=
 =?us-ascii?Q?7geNE8tyqZzgsz/SNCSDG+2SZDuLMegbaI82aPqHhwIpGBjkQnyroHbH6e6C?=
 =?us-ascii?Q?5AVo9nLvvcuZPb1WqDPLxdJfBYzh2T8z5t5BMRW79Cr0tznLv4GtBQ3PlTl6?=
 =?us-ascii?Q?U9ibuCXYEiP2B1qQjFL2+YX6QND+caPyFABqKglCghe/aTMVweKnIYaEDhi5?=
 =?us-ascii?Q?o/S8mm9RGGkR1Z1Xc4bgID9htdt5sEr6525nyhNZEAkcufCguQla8wGhB3EV?=
 =?us-ascii?Q?1hMwsA6tMgHtSs1zSjfpGKeL2pydUkJ/K/a0MYwM+LBDMUGYIn9Yf2+X2Ug/?=
 =?us-ascii?Q?K8HoNrl29XuGkk71oFbMULA4KAJUI5r1ERucx3HNalyMlPmZvSozriKPaGAB?=
 =?us-ascii?Q?z1Kqw8rEmVnDiWq+6l2vn5ZBVLT6lEH2sc/qsXxkkZHpR9dfUDPEui9o9scE?=
 =?us-ascii?Q?V8MEDkjA4LLP1ilugh6z8hygRADrhBgOAFk/S/OjUuuCiNm9NZ25gPACsLKL?=
 =?us-ascii?Q?EXI83Z23yqwa/+TmRns4YwB3WZK6Q7qdvKZXaGwlW4o0aKe6sryWhfpPmwPF?=
 =?us-ascii?Q?G6FGY875vHiYp8I/p97IeHnKJMNzEPbgJwf4S8NJvtpZZ9XVoj6uK9HNWY0d?=
 =?us-ascii?Q?hiReRiIP11Mb6HyKDV45yx4Qfx6MaoNJQgw496ZXU7NBANlK5aj6Bi9EjXZG?=
 =?us-ascii?Q?1Wwydp9LeVLTlXf//PbWOJk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 872ede98-edf9-44be-d528-08de31bd2026
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11947.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2025 16:09:09.5227
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15w2R8VWs6IHgfy+jhpamL9E4MABZqBQWfg1cPF9sWIQdKyUlIO7lB8CyJiaA0SleKisxgR0b/k6o6lHcML4oyeokq7dpSxLCOPaHgZQCtyL4VGPU7lXWUe85PhrQbHH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB14532

`usleep_range()` should not be used in atomic contexts like between
spin_lock_irqsave()/spin_lock_irqrestore() pair inside function
rzg2l_cru_stop_image_processing(). That may cause scheduling while
atomic bug.

Signed-off-by: Khai Nguyen <khai.nguyen.wx@renesas.com>
Signed-off-by: Hao Bui <hao.bui.yg@renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 162e2ace6931..1355bfd186d4 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -369,7 +369,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 		if (cru->info->fifo_empty(cru))
 			break;
 
-		usleep_range(10, 20);
+		udelay(10);
 	}
 
 	/* Notify that FIFO is not empty here */
@@ -385,7 +385,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 			AMnAXISTPACK_AXI_STOP_ACK)
 			break;
 
-		usleep_range(10, 20);
+		udelay(10);
 	}
 
 	/* Notify that AXI bus can not stop here */
-- 
2.43.0


