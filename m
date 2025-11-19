Return-Path: <linux-media+bounces-47352-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 74506C6CEBA
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 07:28:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 643514EDEE3
	for <lists+linux-media@lfdr.de>; Wed, 19 Nov 2025 06:28:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78734320CA4;
	Wed, 19 Nov 2025 06:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="FEq9DJ3u"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11021073.outbound.protection.outlook.com [40.107.42.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF1531ED79;
	Wed, 19 Nov 2025 06:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763533575; cv=fail; b=mgammnMKneYW6XTuLPY6+iWjffRhM6fiFJOKdqUHh+HPSHwRkBMdYxXIklWZG2zseQs87Gd3bWcKTzoAYtXyvg83yIrMaKa8JBSu0XTTqWAWl4YvJkM81wjh30BtxWcuvq1gvq4BirOMsQcRErZjHalrQzB01pq7i6lKvc2qtlc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763533575; c=relaxed/simple;
	bh=RQl0JPIm4DXUGoKD8Lqny40Lyo2ZsPsKTEgg1XnRB40=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HGpXkkZPBSkb1ckQRqAJZjhHvAYY6b7yb9TVn3WOtaHYQOVpCJScaJdcyYNa8CCGihirxQqppNVGCKJYRPef4iR2lcAuwQzWmA93Cf7iSE79+a98/sTfMfH8fE/7OT97FRZdv4rWNB2QNXqsDlaoQswk+wRrsfGlPQk466d/oxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=FEq9DJ3u; arc=fail smtp.client-ip=40.107.42.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bz8ywHUcgYI08sSuWbXZS9fWRaDAMsyaFYqTOgwbuXaWKkOS+yrgn0Zp6jN9bgPDnzy0B8XF27HTyLUcjKPmhJPz9zFE7tG2HG9aJuhDGypjXHdCx0vrJEm+H9dkIGWtlDKQipRffXchiF2CO4GTqpEazy1EhF6WAz3JxVIokHJuGx6qTvwNBYchTCpUywn2U5qFMTcF8N+COU7h2n1kZyqBiXPlTQ0jJ54gD6fBifnM5ai6C+gDHi1xHQDWtbJ7CvRkBvslnk3LoKfWLZqAgMxPiu2EQEqwvZsgukmwk4gJYPDc8Pwl2XUEhfBzifKjnaADU2nC355p8AROHZ39SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=Et3p9Ax4Ie11r5vWAe4vprVmZSNLVSBzhoTIhlmiWTelxjGnqY4Bq9APHUqXqtRmjrCUxFf3c5SC7d/Q6TTfr/B2IXnq/+qQ/glyZ6AyBeNQiOQTBrVchjY8TEGj2yw5spL8uO3k+6qrUFXasmm7NI1aIMYQiScGeOR1xUAlFfMT1DMP0IqQ8+ZPBKSbP0dK4cKEypWUf0Y4JSsyrmpN2vglHtrDwKfYSlhtw7Pb0/oNXmtTK0kdAs31eqcYwreLQbyMhKro1ZW4Xm/NOAfddOcq7Z48veGUs10ztn9oKQM02fYPo02zxH9dovUSFNb3nt2AW345WJ9xs7VKbdfSrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/qej6knGnE79bS40DsnYcieU0Sr87uDS+XRcLsEF7Rg=;
 b=FEq9DJ3uMxlpbkk/OoIRrFG5ePqc3qfSfNeZYuX+oGL93A6iKCeIxx98Zrgxas0ur48iTKtPDLFqNF1gSEuFceymcGoFyQ+uVGENi8iPe8Z9kmvP3ZtGOt0daVPDq5ukSRPmTsQAbPp1yjTx72RxIREThdHglTKZ5rd/VXxmGh8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE1P216MB1996.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15b::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 06:26:01 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::6dcd:ad0b:394c:954f%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:26:01 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com,
	bob.beckett@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	jackson.lee@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com
Subject: [PATCH v7 3/4] media: chips-media: wave5: Add WARN_ON to check if dec_output_info is NULL
Date: Wed, 19 Nov 2025 15:25:48 +0900
Message-Id: <20251119062549.51-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
References: <20251119062549.51-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0122.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE1P216MB1996:EE_
X-MS-Office365-Filtering-Correlation-Id: 9f86bbca-8e59-457e-128d-08de2734813a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|52116014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Ng5v6Of2fNHMQAv2Z94T7bOdpMGpXNuCgSCPsOmJaDndbQVu9BVa6Sg+x2hx?=
 =?us-ascii?Q?boR29rUeFhOfq3ZOwUKCGPAq9GVAr4WgGnq/35SJ1y70NjtetZBO11vSxv55?=
 =?us-ascii?Q?sfcl1m5XoVk1eHZvochQN3LtY0PTqwm7pRwJYnZ6u/WsNituzjWtH9N3MzGY?=
 =?us-ascii?Q?JGsyQmAIkB9cs21GnEtQXDi3g26qeNxrp48c5JbJ7mTbub8DOcER+qdel5id?=
 =?us-ascii?Q?VCtckk1kHTnFOel2/hA5CpESV4VO0Z4zHt+soB03c7ifgs3CMFdM5BxJWQ23?=
 =?us-ascii?Q?xTwipjBxaKkQhyibmIrsXpeRRaDtiVW7H9FWDMnD1/+4AGgGgypFHYFGpUtB?=
 =?us-ascii?Q?i4OUpYKdCmVcdM9BaVKvO87c6jH5IMaig8kyg8eRrzLIRw1cI2taNuZq0OID?=
 =?us-ascii?Q?KR9cW2SgeksntgStod1ODTkju5RDijKWdDmwQxNrsSHwuVx8dhKsmuoC3epJ?=
 =?us-ascii?Q?HgosEiUu7MnjKG8NQA5GiQgyhMNZ1fKCjRJRKIrlE3h1NZWVJwFxAehPIvc/?=
 =?us-ascii?Q?CkYFaMZDgti3nFPhUo0yOZ0gUj0yI+rs+oXZpE3T+KyTQ6nyOLAkMkNf5bnk?=
 =?us-ascii?Q?9Fd8nHyWMXHC/bAgJC2WGy+7I5dzOIPVLRWC+wEc5g8Y5c1ExsRqyGv4yVE0?=
 =?us-ascii?Q?2dsTw8h94n2D+zM+O8OoiAumciXfXEuSdpoOexl62A104tqg9NSP5EGhQvbk?=
 =?us-ascii?Q?iuxqfA2tSXh1Z2i7Dm3SsP2ABPjY0NIBsUFFooAxxddbYXePVRYhB9GuLsCS?=
 =?us-ascii?Q?IFqVAKmWe/Epihd0TnvksnCgceOQCV0nsnHsfLzCJvy/q6+oAI6VQ+ZKD60G?=
 =?us-ascii?Q?Hp0RlaZPt1Z0R4Y+lM8e+qQ5a9m2aDNmIy2BgwvKEObhk2pGto2rLtfyEKuT?=
 =?us-ascii?Q?Ly+7U0f0vzbK+sknUhkFPfuICauQkrxP3oG9pj14EXQMkHSIxMVqeGG8WDPC?=
 =?us-ascii?Q?QJ/QUO9LxkTUP9msLZ13VmzSXmb5X3HD6g60YaHX/Pznus7Ipe85vJnQH8yI?=
 =?us-ascii?Q?gZKhJ5vL/xDCI67ExMzj09bJTv+pHyQFtOBNyC8RcsrNuIyBaLaaS0TMw8hs?=
 =?us-ascii?Q?RMk93jmarCrJhNJh1SucSKLCgFBfSTr3GZsHwwKkTmI0QEaGSEPysj31ixK7?=
 =?us-ascii?Q?YXaXhEmAqPgxB/vfyVuD2WZy04ELnIh4b7SijTN69wfjxRyAV7Rjs2lX2JQF?=
 =?us-ascii?Q?X4pHCpEi0lKJjladqhrnWY8yqYbEaQmb1tY6pEwWe/gRR8SROEPfYiNmnXnl?=
 =?us-ascii?Q?uwLxIW0JZoxCCf397Unz2D9655IXjKnmGVsZTujkxaKxxhGqvUAPU6DSRmVi?=
 =?us-ascii?Q?UAB0nUiSkxTgbvAPK6f6LOBp8ddOFm2qf9NdIiqHa/Op85AuPGSRxoJYVOd9?=
 =?us-ascii?Q?TDfOb0eZzmmhMQsohXKQ2ZdtIK+IaSqs7rFG4aHiDrMKuvvw4SeEIol6jydY?=
 =?us-ascii?Q?nCojEcgXg2kaedKLWSJxSQiobRQL6dam73HxTXPgaEl+JT/jFHILdS9digcs?=
 =?us-ascii?Q?lN5OWrM0HHAeo+lgKEZfX6VO6M0ravtEAZpn?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?h1nhaVVbcIwIkYEZ5xIxvOe4CrhLibTubEnRbAmlXjX9PSa3qfJ+18k8FDkk?=
 =?us-ascii?Q?lYdc0Jrt6v84/CIbs88oaA2hklUJyzOxZ6N02/rZzByg/ohcTxmJHDP0LBc4?=
 =?us-ascii?Q?QgoArFruramlS8yFzpBBdwjtzzceHimMTrjXKbo6XuokG7x2cOTvsaDiu5ee?=
 =?us-ascii?Q?oyE/tO7k1QCZXtHZwfl/tjQlcGWcRDWR/SS6TWtUac2XKQW/MgJz8zWZImle?=
 =?us-ascii?Q?GKWKZXoWYn+pKFWsj98Mh4owKZ9MiNvWrc3NV4HT+qKFyHt63ksG2VV/vXrR?=
 =?us-ascii?Q?FMoby9JcGlyHHoyEKhRWQA3P1Cd7os6CsGXMhPnzQSfExhXveQIWNCOF3dzs?=
 =?us-ascii?Q?FNFMlh6cYPcUyb/NrBTSRXu/H89uG6rTTK+3lHJ/Y5SOzcVNgdcF12KoxRBk?=
 =?us-ascii?Q?XioNV9OxUev67XQIsBD047lrOI5SwGyUI2GePIEgQ7JDzWKAe0Inkjwau79k?=
 =?us-ascii?Q?a1dtPxzzUQDK8ezpAmQKMuC5tQA/7g0tEbfdhdYhxxK3UN7ck79PlU1jSTxl?=
 =?us-ascii?Q?5EyH4iRhiYl3Ge2AxcEWW2GTUqh6Tiag/JEuvczBF4s4MwnkrbWRjdmDRcba?=
 =?us-ascii?Q?d/Bi1Z6rFdlFgWRwrCPNGjQ1ZZWLp3kopK8UXF+2eWi5MJwQ7Afb8hvwok2g?=
 =?us-ascii?Q?sUydFNsKO+IzvtRqu8nhuWiDpqsxHaMG41wwq3B3g/jjZDlLCLlGC38Yzoiw?=
 =?us-ascii?Q?5UroB3muK3/QXTfdvtmV5OW1fDRwaCfhPlzzANv8aqcuyzr4U+LqvjuUIZvT?=
 =?us-ascii?Q?pQ2Q8j1dzMQAzB12Cs+pkpna29aMspjPbBbNbfN9bAfX+v3UqupuDj4Mwr7f?=
 =?us-ascii?Q?XX7bV78imCW3N1E5qWrq7cLcOSuz9GnqK+9vRnnORDrzFMfY9dv4McNOTJXx?=
 =?us-ascii?Q?skUyQJBrItRKZLO5wc5RQaaBCpiGj2d/2akG5obiBglRR7gCXK4eQicK7EPS?=
 =?us-ascii?Q?2rrrV+Uw9k5T18Hi1GxBtZ7dHL1vt1C7jZB59gKGRGySUQ6ifj93fO7ZYnQI?=
 =?us-ascii?Q?RcrmApyX0+AVv11RSJMsD38KmbAG8mD9g61y/tQuOSlnI5vqVwlGqoh5qHUs?=
 =?us-ascii?Q?qbMhLQ6MYjTfV4ZoZBLpT/8IfXZ+zAw14tczjmEu6dVbcdq53XyzToHpRtx8?=
 =?us-ascii?Q?LtwqoJCvwD8WQVWFq7srPzhFiGvzIIv/x537YuZrT9F1bWXRdSDDPpE/s2ql?=
 =?us-ascii?Q?y0D0P3s5RKV3M5RXoGwL/77s5GV5CnsyBIwEkHXLkHxkVRO9zbYrB3RfGuy7?=
 =?us-ascii?Q?fJ3mwvOK6hHwoZsW3Xnu8gojkmxzSSoDesYAokt3UvdUnHzhPdwnyn3P+Xbw?=
 =?us-ascii?Q?CXOo2uzsvfUMmIOVeOYe8cKw0atRyh36oCdaVl4008uT+cI+NuiCxhAlCkRJ?=
 =?us-ascii?Q?uMb5a5tGK7wJHOlsDsx5sdMKficiwFg/ivC8aDrg2xpXdUOpAfrAmWJVkYgt?=
 =?us-ascii?Q?Hq3Tghc+gdABqlJGAnpGq90NdPk1FInDSRczr79CJAU74CQvzDLZ9EjNIrkA?=
 =?us-ascii?Q?/lQG1L8esBEfbw1xAVFnbll2UOefAIGldnOnFGv4EI2n3XvMOPeYRbN1XrwR?=
 =?us-ascii?Q?ur0Dz/VxidGRHIrWqMWIrDKSDGSMXK/9jRc30mw/hx0Xcono2ZaWTf7inlCp?=
 =?us-ascii?Q?4w=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f86bbca-8e59-457e-128d-08de2734813a
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:25:59.4335
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u49Nip312+2pufarR09gNI83y4wlFq3rHdzcHyAFdfp4zrqKg8Pb3Wig9f1v+0oR+LxAglFRfFt8Z30TRA03tq1nTSq4H5kYCLUCLwe2HO4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1P216MB1996

From: Jackson Lee <jackson.lee@chipsnmedia.com>

The dec_output_info should not be a null pointer, WARN_ON around it to
indicates a driver issue.

Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
index e94d6ebc9f81..5b10f9f49b9f 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.c
@@ -485,7 +485,7 @@ int wave5_vpu_dec_get_output_info(struct vpu_instance *inst, struct dec_output_i
 	struct vpu_device *vpu_dev = inst->dev;
 	struct dec_output_info *disp_info;
 
-	if (!info)
+	if (WARN_ON(!info))
 		return -EINVAL;
 
 	p_dec_info = &inst->codec_info->dec_info;
-- 
2.43.0


