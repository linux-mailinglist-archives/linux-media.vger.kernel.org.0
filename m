Return-Path: <linux-media+bounces-29566-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9212AA7F2DC
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 04:58:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3D6991898D81
	for <lists+linux-media@lfdr.de>; Tue,  8 Apr 2025 02:58:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E3C82356AE;
	Tue,  8 Apr 2025 02:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Y9P8BoW8"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011014.outbound.protection.outlook.com [52.101.70.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E041D5170;
	Tue,  8 Apr 2025 02:58:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744081103; cv=fail; b=pbfrd2gc3AhmWegnDzhC/e+WX7B9XiL3FB2CpMu5kJ48C7VyfQ7NIWOvEveTAtO2rS6aaCieMJ5LePAeHUpdr3oVrlNzhi6vULmIqZcrB17fEisogRD18JOEXnPYoCmn/Nq4Prf9XqTu1BvN3eDQSstQpArmb3smatXhIFJuugM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744081103; c=relaxed/simple;
	bh=kNcYDGimZ6VQAtZBMZch6vc8twtgl7BYEotZ2D5Pxg8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nI03OR3j2/MD1r6YyDAzNolVD2wX4nD2mD40wRlkgGozi//b7HmMFP3rGRzbX7r539TaeyS1qLw1V4xQ7dQ2J+hpOZMPd5ICpi1SHVU0KkAAJw5TcIoJqBapFYOytvsWEp6fuVUWBPO+/ikTpwTX9KBJAmfgPiMVBhVkLmu3/Io=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Y9P8BoW8; arc=fail smtp.client-ip=52.101.70.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VjVA+FXOH/SUXA8l7m7Ywb+ZXSe9SYLrTMNGHDOoQWzIkNMcOhaV7qY8j19bdge8OQGk9qZmifkHICUDA2g31p2quY3d1E0nJY6BeokHdwdMO0z01ArTJIZpyI6gyenbFKuXEwXIPjU+RWOSRNaJqC8fSsdAVSk1v36aWgew23EGwCP+T13Y75CX965U4QdmtGC61BIq5EFUERsKszxcq/KBDp41vkyygYQAKaGvF/jcVM/s6PCh4cRYwjzB7T/FyAR+djXCyAb/m5NVuBX8N5FayDpYMdcadxwbI5jpq+rWYxwPF5kwwyOaDRsZCPQbuY4i9RrEdyhXOZ7UlZDQQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qyzSGzcIB9WApT7pOJjc5JCv3c99WWflyCpN5HHaISg=;
 b=HhCSLl/AqK2gIxXJvcHXSpcrL2I+CHoWgLyCY5IJyGRQ/bXzpIl1bHQOd1qXFczGiLOoVecYTLHQQnFmkWLObhYa8TzhsFLkJOZHkhfpyKVQAjiyTyc4xdrNOCTBdwbDFHhjsyt4moXcZAa+aQ260mAKGK2adImYrFVMRQSMtUMPkRFCC90B7FOqGuA5uVTlR4REvDfDMSs1Bp+2gNwxY+XZCXCi2XH9t78wx+jFL+7Fy9V3yonYrUibqblGXmfSQssmHKMgMjn3lxSaLZ8R+R6en6FlMDO8TIbUVKQiKjl6oh7Fcl+kZOYO3H9EkYHosp0A0YeLS3R8wCuYoODSaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qyzSGzcIB9WApT7pOJjc5JCv3c99WWflyCpN5HHaISg=;
 b=Y9P8BoW8v3PRiuQLHp9eHNXoCI2jS5ErA1wuDb/8aDObrbXEsnDLUB+b5hw9OzZ+JTQ7YArGZtRiA9QNxAKIBucnDiZuof0KVXF5wKwr2dAtW5wFMIRlVTMBdOwwKFgF8GqGlUH6MpEdUPh3+4YOeFGpxp13CyXi+U8ln1H/rJVTSz3SlKWZrlDCw6r+iljPDiEjA+qn+o90aqQXdXEeMgA8yQXBjwMub2xur+h7ZQ5wwEHxn1s8Pr5NC3udh2P6luxn5OFvuk4qM0MtGDa1CGNiE0jChPws3YAZks2rtsMcD59AjRkvnGbvVFBDgeF6Rn3MKc6amK7fUutIs9rUqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI1PR04MB6944.eurprd04.prod.outlook.com (2603:10a6:803:133::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Tue, 8 Apr
 2025 02:58:16 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8606.033; Tue, 8 Apr 2025
 02:58:16 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	linux-imx@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 1/4] media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
Date: Tue,  8 Apr 2025 10:57:17 +0800
Message-ID: <20250408025725.1244-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250408025725.1244-1-ming.qian@oss.nxp.com>
References: <20250408025725.1244-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0019.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::10) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI1PR04MB6944:EE_
X-MS-Office365-Filtering-Correlation-Id: adaac867-bc4b-4cbd-2ed1-08dd764935c0
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|52116014|7416014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?xA2RTt6rBeJaDv1yq9+b6vMkKiLuZK5gcU00grg9yzi1aigyWW0MMUZhchtg?=
 =?us-ascii?Q?z3CIf69QLdE3gqVoI6kQWuJBMCaFx1mQdZ0vKiTarAD6cE9TJmCiBinkF3k+?=
 =?us-ascii?Q?fX5rO7M+TGHreupPy46bQAvUbJJSIiUZ2a6dUozme5uO7u+cqrfkRfA+taq6?=
 =?us-ascii?Q?qajNmvOUDW1PGKMPBqc+Zq2RXvm1EEJcl93Qewsapf1QunseDYVMWv/dvimw?=
 =?us-ascii?Q?T4HQx8NFpr05uk6RKdAPPNeQOJbXEl6id7JJYI6zjoaDtTPJARl5fQIvQmRC?=
 =?us-ascii?Q?RvW9OvqYhHM02Xz5uvkMgEqeC6lQ+MHAgjLhkAknVERbz3wUPn8qMKlni69V?=
 =?us-ascii?Q?GjNUXw3qstnIlfZFL6wqzhAOr/E6WzvVRlJfn6JIfV04g9F3N72z8lrvR+xZ?=
 =?us-ascii?Q?ZsPpSzkCutYe2lLAiXWeJSq8ac8mCSFwl8HcAzk2nv3DA/p9+ha+zbODT1ZV?=
 =?us-ascii?Q?MjOH4+h/oDDJnr/6qCDvDGDfbbMxToBeQ74EX1cwFnsCtxYrlvidSr7+BAHm?=
 =?us-ascii?Q?uPfC88f6e+zCzYurnfPP/djUXem7h4ENUU4/jbpweoRLpzH8l69GVBjmtvLT?=
 =?us-ascii?Q?C87ts2OA0QDu1WX19DK5zfPfxOW8uCMBSe68U2rVIIXFHKT3ZPAWt1Je6YuE?=
 =?us-ascii?Q?lcsxPjNZbOy7l7k9HPeainYY807mT5OGoqeEg7gEYPiQgratQ67Wtrj8KDV4?=
 =?us-ascii?Q?NuYjAYZBisdre0MgFFuZsS+CGExkhSMNy2BpysYrrIbFu5ItVhh0nHRLD1f0?=
 =?us-ascii?Q?CEuiTOSEk/wgdKcmGkAy9AJ++7WboenbfFRkGIBqb0QFOpEGGn546lrMCLuq?=
 =?us-ascii?Q?qCMmPGMrd70J8oUcE+Wmp3rWtRPqDHfYc0RxvuCsPmjZRbRdwEEN1ecf/TxN?=
 =?us-ascii?Q?CC7z76ejVF9aB18aI4Qsb+uyZqTBuQTnmEQwVjIA9zsihdE1smjS7QADRG/7?=
 =?us-ascii?Q?t3Zq+jrOlZshW41ps2rubbv82c8rKJuPuUDfVjcrOsIk512ZEz7aikw80aP5?=
 =?us-ascii?Q?sM9aqErECCPijY1hi5v9Fl3nixMKECy7CoCi1KnRm4B8uo7AbB9dW1qT6D41?=
 =?us-ascii?Q?N6HBumXgHc5qSNTSo1RCUKS0ReVl6GoMXISH95qyueIYUwj+CC1BC87Y0My3?=
 =?us-ascii?Q?0CvMNysT7DeR3dD9X8cUlXLp1qI69lnibVlqzUK0yN5bUXIxs0bUrKNoRGTi?=
 =?us-ascii?Q?AfTs1Tvoc9HNL0ToxRIu9JnP2K2cyZhb/s/KX/Y07MHoZcfJCi+rY3uQfMJw?=
 =?us-ascii?Q?24VdTahhLvdw8VrAggoL7QlK4382+7qLQK9O7BARNiFqCS3e/GXAQSIQ25ZJ?=
 =?us-ascii?Q?Q7h1JtUc7cc4AJzEcEv19x9c78B31ZDoP6HnCBnkNV/4AEfJOJHbkNeSC2vc?=
 =?us-ascii?Q?OaKAaDU0aqS7ikSYqjooKl68pgVrYhHUOmMQay6hA6P20KATM4urGLng7bRx?=
 =?us-ascii?Q?b7/zat8tjVJ5PD5IPMWk6ZiKpWWZKZhp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(52116014)(7416014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qLRQkzC3RmpNswPqMNPqOaVNchujehfhsyEwh0yqI/AsopJE9l0c4gP++msD?=
 =?us-ascii?Q?qPjSKUrsrDwTba38mE7cDSAkxRhPU/6Rj6wTDjxIs7SnE0HLhn2XyLpNOBAO?=
 =?us-ascii?Q?8m4OlO+oZG1JodieqCMum3jJ4mAHWMrpog3UDubQhLHSfljMV7iO3U1JQNzW?=
 =?us-ascii?Q?rqAbdiVzHv/YzgH+smjsWcqbAgRufJZKLfQb0cuc7hN9yZummfo5H9qnfyV1?=
 =?us-ascii?Q?DSYn11tNedzK/j3rxl82PBki9F6txmss1nrbTpquMZESsiS5Kum2Nx+L9DmV?=
 =?us-ascii?Q?pNQvfPbpXaGLg1O3hV0Ni5s4ObecMVrb2AbiXFTb7BtwwsYGfXZFifmc0EaV?=
 =?us-ascii?Q?AMk7wtnFzJOBWh1X+HsQ5M5GD/rXREy0VhBWVxDzCoir4GU7bMjUeaqcBWil?=
 =?us-ascii?Q?raI4dtQTVrQZwWtROW7xvVl8E8xGeKRWIvmd2yM0OvAdQ9oGEkgEXPWD/FLZ?=
 =?us-ascii?Q?zBY1bEcGvGTm3jDMKNxYZ4gMi4UmqrwWgcUvORxAV3DhGK7iXvrvOziqob5g?=
 =?us-ascii?Q?swfc3PNu8d86AOQQa+YY/QSX937VT1rnn5Gzg7L+b7pacPkMbvb24JVvkHkM?=
 =?us-ascii?Q?2ESuDpsewkgFX2ZtFuKsuds15e0Cw7r+FSQmWqbUz7SvZ43M03T7WtZO/bfu?=
 =?us-ascii?Q?rPVA9RmYFYGZ7utMegP5UwngyJ9sywlumkCEuUn6Q8XqMMjjoO6UpVYO6VY+?=
 =?us-ascii?Q?3JBD/l4uwC+Ws7U1BnhdzWTVl6Db+x0kRLMf2f/pjVoadzfVLeDUo4nV01V0?=
 =?us-ascii?Q?DLoH67NYGRfp9a5LbIw/U0pBHQU6wbWwEFfP37gKahmbE0iHB88jmQjUBQq2?=
 =?us-ascii?Q?v9e7+578JljCDYlh9XVX0JytA26UYlMVIlBBbuYzjAwPt/8bYZe2guUaR5h4?=
 =?us-ascii?Q?izy7WN4tDVWnnX6OSqT3QdyZi1Mx5zbtov7nV2psuIPvGtOC7tKeODRCJ+FH?=
 =?us-ascii?Q?hvW5ZExpiCQY2yZ6lQIf0CMauIYeLzTGAScPXTj7UYJbSRvnuA6KcsHc3/6e?=
 =?us-ascii?Q?Y9hrGFdRpQcEJ76qiGaADixQI1V2hyzMGFxNGuGg3GYj7xtS2OsXPy7AW88w?=
 =?us-ascii?Q?KMplAfwNj3YgwMtbIG52lLpfvSvWa3/cpRgTn+5Y1SEEngSN5UZED606L8CH?=
 =?us-ascii?Q?K8/RhkrLNS1ZgEzRbg8Z0jSMPLrNFrSBCVv0AjE62ubhai+UDyzni45HyiYM?=
 =?us-ascii?Q?FVhBce7aIymByTssxwIQuSrWD+azRs2Y1EkenowqcFwAFKWILtVjI287wTr3?=
 =?us-ascii?Q?W7kghEQ2j5/X+HsR00j9mbPNkmn8B1hWFr6fy9P0cWLeREiL/tucadhy7/lc?=
 =?us-ascii?Q?1qdqdhlOHhxq3kh1T5fOAcXh8o8WgmhOos5DlGgWbKheiXG+qeu94QfGff3a?=
 =?us-ascii?Q?PGLOk/YGTVST3gMiRn+ONXAmfHrf+MQPECam6k4PPKdcwid8dwVIg/umWEfF?=
 =?us-ascii?Q?PfkN0KMUwnT5+jF6Nj13w2LNagyZi6XjGkaA1/6KsviDZJ+CFGigUYpNuXkf?=
 =?us-ascii?Q?xv8dB6aU1u0zIhw5Lh2/E+9kjt3TTSEjEWICDi+Oqh72g6IvSmztXZLfk0Ly?=
 =?us-ascii?Q?9wIYyLgHl6TTIGF5J1ZiVGv9DOvtHss7+BWxGef5?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: adaac867-bc4b-4cbd-2ed1-08dd764935c0
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2025 02:58:16.7657
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ULL38n2msliCXX1zCZT6E6TajsGtN8EwnE/sbsqSxhsb9lXGnDIWb/b6QTABouaXwZBGTBbgtD24cCJMR/Ea1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6944

From: Ming Qian <ming.qian@oss.nxp.com>

Move function mxc_jpeg_free_slot_data() ahead of
mxc_jpeg_alloc_slot_data(). Then when allocation fails,
can call it to clean up erros accordingly.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v3
- Split the moving of code into a separate patch

 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 46 +++++++++++--------
 1 file changed, 26 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 0e6ee997284b..b2f7e9ad1885 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -752,6 +752,32 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
+{
+	/* free descriptor for decoding/encoding phase */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.desc,
+			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
+
+	/* free descriptor for encoder configuration phase / decoder DHT */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.cfg_desc,
+			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
+
+	/* free configuration stream */
+	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
+			  jpeg->slot_data.cfg_stream_vaddr,
+			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
+
+	jpeg->slot_data.used = false;
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -798,26 +824,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return false;
 }
 
-static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
-{
-	/* free descriptor for decoding/encoding phase */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.desc,
-			  jpeg->slot_data.desc_handle);
-
-	/* free descriptor for encoder configuration phase / decoder DHT */
-	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
-			  jpeg->slot_data.cfg_desc,
-			  jpeg->slot_data.cfg_desc_handle);
-
-	/* free configuration stream */
-	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
-			  jpeg->slot_data.cfg_stream_vaddr,
-			  jpeg->slot_data.cfg_stream_handle);
-
-	jpeg->slot_data.used = false;
-}
-
 static void mxc_jpeg_check_and_set_last_buffer(struct mxc_jpeg_ctx *ctx,
 					       struct vb2_v4l2_buffer *src_buf,
 					       struct vb2_v4l2_buffer *dst_buf)
-- 
2.43.0-rc1


