Return-Path: <linux-media+bounces-33138-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A5FAC0D9C
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 16:07:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 79F2316D475
	for <lists+linux-media@lfdr.de>; Thu, 22 May 2025 14:07:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B1A328C5B6;
	Thu, 22 May 2025 14:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="R6eAAxIt"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013043.outbound.protection.outlook.com [40.107.159.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C4128D839;
	Thu, 22 May 2025 14:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747922810; cv=fail; b=jo97Ch20qcId/nDZJvEd4+LTs7Pb3d5KTD61SYjuJRE5skFD8pM69BnDG+AZqFEiTmTEzfLAsrQ9/vyM3tFMEmBWSJgN2DcmjmbAI9eMWpy9faI5nVBDuanph6foz/SbzAnOtm1x8NC35aNHnPziVSSLFld/TJGOSPmHOgQTyys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747922810; c=relaxed/simple;
	bh=XglT25YQ7/4JyuapuoZMBvjH3lmviw8Mc/sNnvrVsv4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vt6MG9ouQjepK5GGikGd4YkUy3npLV9R0oKFUMRZIhOj+qa3h7OhZk3jPk5TnG/XK68rGdtZoLAWGdGsBPOCYWo8YhkzlVpswRB5JlBBB64iRXAKMXK+rNcqLY3JVjHDeCHOcjlIeypoeHBuXaRmw0Lb/1X/KNXZQNM9aR3WUok=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=R6eAAxIt; arc=fail smtp.client-ip=40.107.159.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R5n38AlWdiXRDVyDXnbPUgql1kYjb0o0pF3Ko9zEBM/++E7VRjrBd1LvaeVzDioQBG+HrEQ1SnLMKOR+oMr24Qi85LohU7Hjont06o8LOTaLwyhG1NA+XD6CQH2ehsy0ZST35WVAq+LwWAWBaZflmTVDTLjqmfNGrN/SHrJ7uGK9oheX+0Msffy//qm6AKp47yyG9Qq6krlW5I7bs8gszsLsV6COMlg9n51NXEZTuen936fWvV8h5qxtQ7NYuWHj9M92IIIKvKjCb1jmF+6lvEzt5Jd2OE7IeGCD+hlVIzeqICrr+D1q0v1gd1AkJBcsDn6jDEBt4hHGB8E8geullQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JvBfpDNKIS8G9U0mqjg4+8koxtak3Odq25AXxLm7/Dg=;
 b=JOrkdfVo82lpTlMsQ86y52Dyye/4357meduLvSIXy6ZquUonTKF/fH2A4dop6Es+h7Vcj72pn4IGfu2n6XDFzbjMe7tSqFRxNtSyAhulKmU/cw9yTXZ1zF92XZzIukcB9ky+GWEXXMBl6YW6V1ymL0ByLOqAQ5MzqP/NDPvogzDmCW4kYY4HvtgtXm1cxr1v3jbugJv77Y95OWHaoINrAiT0n9BvacdmHEIJbkYDHpBT162xbDTqaWi9lrj1tc/Ex7gWFRJ51pPvBq5ZIpVOEbejZ+ncRGv8wFdu1gIidiqvkrdrSYMBykH/QQJh77QqZ+l0xvQKpWyc+cy9PJd6ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JvBfpDNKIS8G9U0mqjg4+8koxtak3Odq25AXxLm7/Dg=;
 b=R6eAAxItPfwEfafmJybYd/oL3eByjPDa6nbWPCb/iUKYKd1dM8egASt/ZwUJng5Lkt4ShBNM3NonzMy2lYJknV/SLEi6JUerif33DmTxnvoGguM1A9KATOwqU8R/CpTbIjwKyKD4//ZOueY5a/7eeoaXpana1T5jC1Z1v/+nm6sRhfQGVvMBQxJ0uiueqIRWJFn/NEpD7SmGgrLM6PVkL7MKCZIoDBmprfOYw9O7Bsmcdpsma8Tybqk2AatE+ul7akMczVFQhPc0cMlsQqX0Uh/o64smsow2XUiXCJ2w501rl+2uxRqZfZp14wI8QtCVMdHYP+imM2BeUC0eMgEg9A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com (2603:10a6:10:53a::11)
 by PAXPR03MB8252.eurprd03.prod.outlook.com (2603:10a6:102:23e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Thu, 22 May
 2025 14:06:45 +0000
Received: from DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf]) by DBBPR03MB10396.eurprd03.prod.outlook.com
 ([fe80::ee3c:c9be:681:c0bf%2]) with mapi id 15.20.8746.030; Thu, 22 May 2025
 14:06:45 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Steve Longerbeam <slongerbeam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-staging@lists.linux.dev,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v5 3/7] media: mt9m114: Factor out mt9m114_configure_pa
Date: Thu, 22 May 2025 16:06:09 +0200
Message-Id: <20250522140613.104963-4-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522140613.104963-1-mathis.foerst@mt.com>
References: <20250522140613.104963-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR2P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:52::15) To DBBPR03MB10396.eurprd03.prod.outlook.com
 (2603:10a6:10:53a::11)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DBBPR03MB10396:EE_|PAXPR03MB8252:EE_
X-MS-Office365-Filtering-Correlation-Id: c855dbcd-ce6b-482e-195c-08dd9939e29f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?N9jcDtGFL8r7x/sMahkiWWdulNMNJ+YdD8I9VoLv+CdvQgmlS9QuZyMqcvVj?=
 =?us-ascii?Q?l1O3Dt2h1Y0cJW8F/Yf0elBp8OP0rsCdU39XRp3AklDtjEBO8Qx2NJ71Dj2p?=
 =?us-ascii?Q?w7iFAS0dOayiWcEC4irv3Njj2sSPmYSSHSdcv+4oLsIJJCDFLUVLQ9l0qL1G?=
 =?us-ascii?Q?9KpN9zDZnA4srB/EcIiJbIFyU/jEPPC6MEQu7Ne8A3du72lQPDZomTykPoPy?=
 =?us-ascii?Q?kRJQFAz3n5vxI9v/NqVZk8HRMtEoWbQxXcIjPuGxk5HzSkZ43N0olJtdtKtk?=
 =?us-ascii?Q?wfkE8T7txsHHJorX0ht5as+NyoEmHYuWyqxmZ+P291TPNxb2pMa2KB9goaS2?=
 =?us-ascii?Q?yuv2cvSqoe3A6wMG9v5pmGo3N1MJpFwr7AsIV1keJnihZmqsU4m02fsEGPmd?=
 =?us-ascii?Q?x+T/9ab7bNQ84O+LBP6HbriTqWMsgcsXCrCHOeB+NxdOXIvNNApJEp6QP2R4?=
 =?us-ascii?Q?Xk2xuXc3VfSt4Qes4r9+m69B99knQISwYqv7uCMowdLYgXW/COaItM2dpGRD?=
 =?us-ascii?Q?mZHMX+YSYTDYOySbjIcC0vFHcc8f2c2YN2w4j1IkK6blppgkTlWMw0Gz683R?=
 =?us-ascii?Q?PFXHRYtYdMyYI4GAWdtDUes79P2He8iB/AoRN+d8nAl64yZiDK3JmkQgjKd+?=
 =?us-ascii?Q?GNubjR2Yccwsb0CAfpn+J8ir6E1eiGCYiRPNX0ZL0Btm/19XQYX+Z1T3bLjv?=
 =?us-ascii?Q?0cScf3Oe2xEvtTbCjEBBqDUqrKIjmFaS2r90axFkvZaQwbsb+f9ZFdObxg1R?=
 =?us-ascii?Q?5xLieHxHYB06xkYZUDOX93hHSve5Was7mse3CtDDtct1hkmlHCBDWlFZAtDl?=
 =?us-ascii?Q?NQe8Zro2Fgvp8ocSFp6pXAoJ2Iym5q5xw1KvP4J5QNZBnjuMxZQwzbsAu0d0?=
 =?us-ascii?Q?zoKyp4u4YJE7p6cBYJmQbsiY+NFihzDZaY+89HPTVaNM7oPbSNKs4fTNRMes?=
 =?us-ascii?Q?M2LLHPKMrDxB5iSEiTZy3ygg9FsX4nAXGZoF+gW0xuWL9damV+MW/8/RUq2w?=
 =?us-ascii?Q?qsEii+gE/kB5t6yF8c+eWveF3XNoKZVUrgT6/vgjTNmoGgrTfyTLP+IJ0wTt?=
 =?us-ascii?Q?/gdjtyacGVt2K0soNFSWg84ZMFX4EMc8RHBM52CGNxPxTLvGlzaN2Drmydd/?=
 =?us-ascii?Q?iOgvKT0rCPSZXoPdhwP/sGg0Q76uMtdlFXjEhX3fwraF6f5KAcLCIv+LLLAr?=
 =?us-ascii?Q?HGXmLTUbPbpJigZYpMenxY3Z2mKkIBZMGiMX2s87aHvRWhcKafn2GrJbQ6Tm?=
 =?us-ascii?Q?rdMVDXwmRu1yua0McS1L2hwfmmqyB1KYDSJrxAIuqEkhFbs3wbSne4EJRX4F?=
 =?us-ascii?Q?OcvKP1NsgewzDxZQARoHzTrrqaDjwmft8jVVrqwDMb3OnD/tU+8bCMEDwZra?=
 =?us-ascii?Q?d2lxM02qbE7MNcjKic5GxBkFHIGakDWXOAN4ISGo2hbRuHeTwmeXOfX99KcZ?=
 =?us-ascii?Q?Wurw8YPZbLc+nmmT6AMA+3dkHMGnrI4Zuau5QkMROOkx15RYZqMo0g=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DBBPR03MB10396.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kSIaVPZPJZZTZ2XDWtcOKtqH3NaL7kxt21NQzMDWvWEYEl6e1y4I1U1fUadD?=
 =?us-ascii?Q?s72RvhzupgaWuXYzjwnm3eREdE8qYDgbLR++lr9r6D0SFbE0XJg+gaSaOAcC?=
 =?us-ascii?Q?sYJ1E7ZoyOv/LYshoCzsZDtifyGIj1qnoLLUF0gLRI/4Dp3Qs+JnOsUhjngz?=
 =?us-ascii?Q?JvANl7UwHVIM5yTLVeH3uUjYLW4NH7xZEHdGPu4HQ7NhbaYjrhuiFCck+TTQ?=
 =?us-ascii?Q?JB17Sa7Q7BzdSssKPDsErLlnqehnilc//RiDg36CJ5jQuNd4O5ynKwRzum+j?=
 =?us-ascii?Q?ueK5O0lVf6f+w2vIEZEIF40DbvKxg3WdLh0Wth8J//IeL7FtE3m8/b2w9ZA8?=
 =?us-ascii?Q?wxNvZz3BEXHo3dk9WXg1RS9B3LdpvkQgcO3HdNBQRLbIHc3DOJa4mxV2xWkK?=
 =?us-ascii?Q?/vtulR7Y+qRud+Ao5zr7SV8qY8B+RNwmTTobvLfPMO6jPCGP1US9Y+bfuh8J?=
 =?us-ascii?Q?jC+8C2zrMX+rf69qCodadf1XnVzpMqMFP/s3QZFz5zzBFnO3jdju+OeXQGRG?=
 =?us-ascii?Q?zTDS+hGlFnysccA1E3BSYzv8peCXBGsdnu6wTpOm1FQOMcggVWgXHwEO1aS9?=
 =?us-ascii?Q?SO6PM95aw4gexHT82q2DZTa0lkVR3ctVKSLQ6jdPCGn/s+lOHqADj522tgoo?=
 =?us-ascii?Q?rI4DwLW+/b/dCm9XcJzg96DPI+v6cuotNruH8nG/ZYKGq0QTHdDfrPdjAP2w?=
 =?us-ascii?Q?t5qUWyQI0g5jFeWrmqTKAMSPpt2EQmKr7mUM3hGVWRhoWAGURsoBL/oxRJ9s?=
 =?us-ascii?Q?ZbZHKnYpCK4Jioz82r+WwZHYNnpL+qzSw9mRQb4QjZXDNrjCtbGpEblL4D3o?=
 =?us-ascii?Q?LEpZqfW246z2Y7JKk4SokquoiGXxMr3SFxA9mzQX0zbOKgWsGEuUstpEsgGc?=
 =?us-ascii?Q?B60mFP/0fDn/RJP5LW+ZRzAp6dF6a+1ZUnUiYnvxjZAD9drIrUcePXk12uFz?=
 =?us-ascii?Q?1ARkY81v40cEguSHmnNvJqYP78cwcQobg9doX5mwVFT6hVmj3Mm1JxAsJddv?=
 =?us-ascii?Q?LJh4U5AzwPAWm4pYtH8aHY2QQDbikhnKD8w7waPFeNClzuX7N3p9C0Zh036n?=
 =?us-ascii?Q?/9ODJSfg9EyiBGvJuZAJUH7tZFVJv0/T4cyMWhInr20Oav1tK9Ai+uILsS9h?=
 =?us-ascii?Q?CVOW39Cyxrq/NeyyXiRtjWoQkqs507308ZzwZvL3UdMp26Uh+HtOGKIvciwu?=
 =?us-ascii?Q?zhGfplMPkGZXcWj4nzaHvCwdyNwp6ZnhKQtEDvCPFfMSluuvf/fwILk6OdFp?=
 =?us-ascii?Q?xpyZ2UxHEHCsiqZi2iVOmxc/qFxVYfFPx4vD7Gr1tch14PjaVERvX6zgmxD1?=
 =?us-ascii?Q?DwsUGL4ovdwOAjjjBFPUSOJvwyqiLXalpa5AYZGAhfRfZ5TPVvwGBR9Oem0K?=
 =?us-ascii?Q?jAyntCpBYN1chrd2ZvrU3W/BrsNAFk6h/M5aUvSutYy565w2qwjdu5s+3IB5?=
 =?us-ascii?Q?6gJymjVj1ms5gqYHd+kLTGlyuw3WzWbUzXXGhF+xShKxwsCNAKQKP0Pxq6vJ?=
 =?us-ascii?Q?nfbDfBt39fRAjFmws13fjXq2bznRqf5w/ZtIJFgPlvrGk4fEJdiEMyfTuusL?=
 =?us-ascii?Q?v7LJL6e85U7ukqt5B6xUax4S4CzmtBIMjREjghYV?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c855dbcd-ce6b-482e-195c-08dd9939e29f
X-MS-Exchange-CrossTenant-AuthSource: DBBPR03MB10396.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 14:06:45.2453
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C0YUsxBhrI6kkWAdzezXOXi7C4FYp+Dxd/3otjAlNPFkjxz2u9cy85HH56IghS3PUnwkDgFFRy0ywUlSvnKHUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB8252

The function mt9m114_configure writes the configuration registers of both,
the pixel array (pa) and the image flow processor (ifp).
This is undesirable if only the config of the pa should be changed without
affecting the ifp.

Factor out the function mt9m114_configure_pa() that just writes the
pa-configuration.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
---
 drivers/media/i2c/mt9m114.c | 95 +++++++++++++++++++++----------------
 1 file changed, 53 insertions(+), 42 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index c3ec2eb0b134..6c80c6926aef 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -790,41 +790,25 @@ static int mt9m114_initialize(struct mt9m114 *sensor)
 	return 0;
 }
 
-static int mt9m114_configure(struct mt9m114 *sensor,
-			     struct v4l2_subdev_state *pa_state,
-			     struct v4l2_subdev_state *ifp_state)
+static int mt9m114_configure_pa(struct mt9m114 *sensor,
+				struct v4l2_subdev_state *state)
 {
-	const struct v4l2_mbus_framefmt *pa_format;
-	const struct v4l2_rect *pa_crop;
-	const struct mt9m114_format_info *ifp_info;
-	const struct v4l2_mbus_framefmt *ifp_format;
-	const struct v4l2_rect *ifp_crop;
-	const struct v4l2_rect *ifp_compose;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
 	unsigned int hratio, vratio;
-	u64 output_format;
 	u64 read_mode;
-	int ret = 0;
-
-	pa_format = v4l2_subdev_state_get_format(pa_state, 0);
-	pa_crop = v4l2_subdev_state_get_crop(pa_state, 0);
+	int ret;
 
-	ifp_format = v4l2_subdev_state_get_format(ifp_state, 1);
-	ifp_info = mt9m114_format_info(sensor, 1, ifp_format->code);
-	ifp_crop = v4l2_subdev_state_get_crop(ifp_state, 0);
-	ifp_compose = v4l2_subdev_state_get_compose(ifp_state, 0);
+	format = v4l2_subdev_state_get_format(state, 0);
+	crop = v4l2_subdev_state_get_crop(state, 0);
 
 	ret = cci_read(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		       &read_mode, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
-		       &output_format, NULL);
-	if (ret < 0)
-		return ret;
-
-	hratio = pa_crop->width / pa_format->width;
-	vratio = pa_crop->height / pa_format->height;
+	hratio = crop->width / format->width;
+	vratio = crop->height / format->height;
 
 	/*
 	 * Pixel array crop and binning. The CAM_SENSOR_CFG_CPIPE_LAST_ROW
@@ -833,15 +817,15 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	 * example sensor modes.
 	 */
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_X_ADDR_START,
-		  pa_crop->left, &ret);
+		  crop->left, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_Y_ADDR_START,
-		  pa_crop->top, &ret);
+		  crop->top, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_X_ADDR_END,
-		  pa_crop->width + pa_crop->left - 1, &ret);
+		  crop->width + crop->left - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_Y_ADDR_END,
-		  pa_crop->height + pa_crop->top - 1, &ret);
+		  crop->height + crop->top - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CFG_CPIPE_LAST_ROW,
-		  (pa_crop->height - 4) / vratio - 1, &ret);
+		  (crop->height - 4) / vratio - 1, &ret);
 
 	read_mode &= ~(MT9M114_CAM_SENSOR_CONTROL_X_READ_OUT_MASK |
 		       MT9M114_CAM_SENSOR_CONTROL_Y_READ_OUT_MASK);
@@ -854,6 +838,29 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_SENSOR_CONTROL_READ_MODE,
 		  read_mode, &ret);
 
+	return ret;
+}
+
+static int mt9m114_configure_ifp(struct mt9m114 *sensor,
+				 struct v4l2_subdev_state *state)
+{
+	const struct mt9m114_format_info *info;
+	const struct v4l2_mbus_framefmt *format;
+	const struct v4l2_rect *crop;
+	const struct v4l2_rect *compose;
+	u64 output_format;
+	int ret = 0;
+
+	format = v4l2_subdev_state_get_format(state, 1);
+	info = mt9m114_format_info(sensor, 1, format->code);
+	crop = v4l2_subdev_state_get_crop(state, 0);
+	compose = v4l2_subdev_state_get_compose(state, 0);
+
+	ret = cci_read(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
+		       &output_format, NULL);
+	if (ret < 0)
+		return ret;
+
 	/*
 	 * Color pipeline (IFP) cropping and scaling. Subtract 4 from the left
 	 * and top coordinates to compensate for the lines and columns removed
@@ -861,18 +868,18 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	 * not in the hardware.
 	 */
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_XOFFSET,
-		  ifp_crop->left - 4, &ret);
+		  crop->left - 4, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_YOFFSET,
-		  ifp_crop->top - 4, &ret);
+		  crop->top - 4, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_WIDTH,
-		  ifp_crop->width, &ret);
+		  crop->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_WINDOW_HEIGHT,
-		  ifp_crop->height, &ret);
+		  crop->height, &ret);
 
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_WIDTH,
-		  ifp_compose->width, &ret);
+		  compose->width, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_HEIGHT,
-		  ifp_compose->height, &ret);
+		  compose->height, &ret);
 
 	/* AWB and AE windows, use the full frame. */
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XSTART,
@@ -880,18 +887,18 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YSTART,
 		  0, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_XEND,
-		  ifp_compose->width - 1, &ret);
+		  compose->width - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AWB_CLIP_WINDOW_YEND,
-		  ifp_compose->height - 1, &ret);
+		  compose->height - 1, &ret);
 
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XSTART,
 		  0, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YSTART,
 		  0, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_XEND,
-		  ifp_compose->width / 5 - 1, &ret);
+		  compose->width / 5 - 1, &ret);
 	cci_write(sensor->regmap, MT9M114_CAM_STAT_AE_INITIAL_WINDOW_YEND,
-		  ifp_compose->height / 5 - 1, &ret);
+		  compose->height / 5 - 1, &ret);
 
 	cci_write(sensor->regmap, MT9M114_CAM_CROP_CROPMODE,
 		  MT9M114_CAM_CROP_MODE_AWB_AUTO_CROP_EN |
@@ -903,7 +910,7 @@ static int mt9m114_configure(struct mt9m114 *sensor,
 			   MT9M114_CAM_OUTPUT_FORMAT_FORMAT_MASK |
 			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_BYTES |
 			   MT9M114_CAM_OUTPUT_FORMAT_SWAP_RED_BLUE);
-	output_format |= ifp_info->output_format;
+	output_format |= info->output_format;
 
 	cci_write(sensor->regmap, MT9M114_CAM_OUTPUT_FORMAT,
 		  output_format, &ret);
@@ -934,7 +941,11 @@ static int mt9m114_start_streaming(struct mt9m114 *sensor,
 	if (ret)
 		return ret;
 
-	ret = mt9m114_configure(sensor, pa_state, ifp_state);
+	ret = mt9m114_configure_ifp(sensor, ifp_state);
+	if (ret)
+		goto error;
+
+	ret = mt9m114_configure_pa(sensor, pa_state);
 	if (ret)
 		goto error;
 
-- 
2.34.1


