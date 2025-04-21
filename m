Return-Path: <linux-media+bounces-30580-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 911B0A94DCE
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:14:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 50AE67A3605
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C12E202C44;
	Mon, 21 Apr 2025 08:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="q8IGolT3"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013020.outbound.protection.outlook.com [52.101.72.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D346F256C97;
	Mon, 21 Apr 2025 08:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223233; cv=fail; b=P2Z/n5VUSB5n0kyeaBPYcaitpqlFBy2RM/1mhO5pRJYeqjQIdJxYXIonF/anVjAyJS2C9lnb0gJZ9NFBoJWPnpzCt7QbdqQcFCdutSQVqj0wXryPhZeCGeA+oI2e0PCmjrvczmpOMJO/c0K+aXs/gNBvFz+XABzw2DBp1vVxrgw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223233; c=relaxed/simple;
	bh=KI/9I4A7dEjSnBgdPifdj2/8Q8lz38MD9bfuojxYV8o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lb/2SiVi3u1VmQxPAA3E0lFNWOR6kFREKrWUBp6LiFBXk6fOqDyFHtBuz9HuQC5w2H2Bdtb0niZ/Us3Qye89i7AwEPvV5cKcDuWXrx4h/7O68H0LAwDx62+BigthlQg2nwQpmxgByxIkujq5AvLEffFc9tTIBKSJvV3/Q8Dpido=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=q8IGolT3; arc=fail smtp.client-ip=52.101.72.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r+UjvNRuecijmvh4QufSv10wFkFjnt/ZsyNI3APHkBg9DVADoalaiG80pnctpIfQhvv/8nyIc8jUQ4XbWWU9jfOzv33I5J/ySTdAKqF801/m2iQtmqgKAaRlb2/g0FPH/Khpr+Tj2jnwc+qpw9qiPr+Citr32djlsCzgFvE5hNHUpCoK1Fro2CYx2jusOTfmPfZZOv3hR2VIxQCvBI0rj6kfrYmDmwtcAjpitlEYeJkWN6gN0IIZuor4hIT7hSfVMq9UrBldF1+56Y4yzuhY/JqbEMNy++bSLBaRID7tuNbHMZ+ETTzsZwCtMq7kPhxqmvp7wFCKLslfwKh/MCK5PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LEg1G7b04epQnnqZgLQO/IhUJ5tl9A3nCQ1JX8Ebio4=;
 b=OHpegCLIylajCOV2OlcqnCj1+IeByaGq8fo1hpXLfw5iQW6D3TQIliSJvPxkFAewIETZqyRc6TTHkWVMXEZG+aFmmYYuksFcGPNlaQSuA6Oh8KYnPH60y7VFRLr46MPu+iOdFD3dpfWhMWqLVwiHF5j0xVZcABuY+Rho1Q1urWf6Fc5Zf/5oUs2qP2ZLSXETU45JEo+SYyS1T/AlhF3N+awwI0MaeMPg/4pVqVzN2STQq1zZ7lCQoKPfVKQ8OYWsziYn+BVyz8HTW14Bb68uMmTFmT44VpzZL0/kUpvs/VO0Hxi1ip0mMiq6YUD/UU2B9aSp0JVtu/rzUgbrfE6qlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LEg1G7b04epQnnqZgLQO/IhUJ5tl9A3nCQ1JX8Ebio4=;
 b=q8IGolT3P6X7s042MxDQnFsE/PU7yqB95IyqjrxKrmaveFFAaH0GKRWyyHLoH8lyCD1CutQzrOd5T1QKDXOCP+vI9WWVMeNlJPq02EagJwN3FSKGoUWY3lEpOcxBqLOOC8aHy0rR8A08fIVTiV7TSy8TNxQ+MAI1ChuKGr7YyMVAMZ1VTtOsNcf421LKrVqFbr0+y/OBMalmgCw7SbqbiRiqxnRtQf8IXB4ieZMWbZzPLHXNLryiUwQFeTRFuJvSMLBnyfdlIv21tzAQCx+FlPtUAKyjS57avLFCG5OpdLAh8pQemE39Qt763ofX+hf5DroCZrKdyv3pTq4WueKcpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:13:49 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:13:49 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	mirela.rabulea@oss.nxp.com
Cc: nicolas@ndufresne.ca,
	shawnguo@kernel.org,
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
Subject: [PATCH v6 2/5] media: imx-jpeg: Reset slot data pointers when freed
Date: Mon, 21 Apr 2025 16:12:53 +0800
Message-ID: <20250421081301.1304-3-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250421081301.1304-1-ming.qian@oss.nxp.com>
References: <20250421081301.1304-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0023.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::17) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|VI0PR04MB10104:EE_
X-MS-Office365-Filtering-Correlation-Id: 5440e873-1331-4a3a-5e15-08dd80ac71b3
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cSxbJxSRUMnubytMLJvyP8WScC6ryzm58FCT8mX8rfyjFTfKFtK9xzJrdDXg?=
 =?us-ascii?Q?5rJWuseFQ06zjsTCMnkJBpy4j2Pa68RhgY5Xzkb1wRNVAkgZXQBai4tBuX/Z?=
 =?us-ascii?Q?tf2OUjXikz3eIpcryM+ZO2k530ienjE9OP0drBIv/H+C9nJ26pJyQS9Cyfta?=
 =?us-ascii?Q?scbuJZzXRnfc9hqnvhypfD5QdRUpSjMe+oG/Cud82cXPEpONmATOs89e/Oob?=
 =?us-ascii?Q?lNgWYbhD0B7s14lDIvkyG0f35PLZnxnGB3AAblVsZaqXMpCJ8YPFtOWLbl0M?=
 =?us-ascii?Q?PayECZDqVN9HCXBVfdhR3dPVmRQpJwMF8VNuyRNJgFuzZURgbx3ZWH+R7XUT?=
 =?us-ascii?Q?khekw35PmHcKoFgF/8G7YM/PKT1t66J29WEKB47g2hwDbl64OWjWDAaZH8P8?=
 =?us-ascii?Q?m7mZu6A68BEAL9ZcSMmhYviNnCAb0d0ajA/XHpJ6CDVDqR/5n6MyxqSVRvcx?=
 =?us-ascii?Q?CCHod3mQeStIHZBSvAgS28uoNpEAgtbKMgAgsQlfl//OgSvqDYAqFueW6cYb?=
 =?us-ascii?Q?1Ol9ZyrtQBjctIlgkIeq2GxqoJmdwblnk7rADvYct+cUgnYqEnwuoAuaNoj8?=
 =?us-ascii?Q?3g/aUFAOjzmXAaDUe4a9loSydXPgMA2TQkMSZ/WNuCXxXXqjXd6MAxWI8tip?=
 =?us-ascii?Q?LGkx+qbpsURndHdfHR4GEW6KKlM6zr1MWLacyTLpWORItlHtpx4lOE4L6SWb?=
 =?us-ascii?Q?qUGzJ54/qmpi3dgqBobm3XZcYxRcejCNgdljFSbVicG9HdiyDuaxFlaLVj5n?=
 =?us-ascii?Q?Pyqel8xIOpqSWnR1wBEF3C9ggBFxQ3lhothiXMNGpT5t4dIEGMHmXNCnYD0d?=
 =?us-ascii?Q?wr1VLBmqe4YQw+tj/l9/3I8DfhNQic7YbShlk95tv8R2f3pgHbgdsjB95H6Y?=
 =?us-ascii?Q?01cHWJTBM04AAMF5l0ekopRlxSF5E1Y9z4VhmrQjOPsPj+kxpcnofIG/n4MG?=
 =?us-ascii?Q?NqNXK+vu2CN59AVRT0zxBnHuWFkvDK5IRvKi42C/aOFSFu9fGxxK85+6yU3a?=
 =?us-ascii?Q?F032OgiDUsNIc3CRKlpYew5cTcGS7XuTtmmM8oezVgH6EDLPMIy4ApAiNctK?=
 =?us-ascii?Q?EtYjuEtqPboaIicCBDR4Wt2lyASSCuD918OPH/uAvZ7ldVinYSnK+ughxm0P?=
 =?us-ascii?Q?WMQ0YntxtJlLiITs4XPp5/9kKBiSO1BobIhhQIz/csB7bU40SrAPSuPYhGYN?=
 =?us-ascii?Q?9iJfU5OSc8ZiwQ5HGR+fnKrvH0aHA6p7C+HSEugJz2wMwiY2lc9wYdSDYLsE?=
 =?us-ascii?Q?gAsffykVsPsFcZ7tWzwNgIX6A81tDIGeQJ2mfJ43Xx0VT86F9qUvZqY62uaK?=
 =?us-ascii?Q?JGxFNImk9+d2Jj75rsQqJZ21XvSrD+gFsIFGOcM1BCa+q22M0DufqRsunz9+?=
 =?us-ascii?Q?9qK1ozZFDEhTrcc3pPDSOg8th+TcPs/6GaGaqH6rb2cZD2K55S2DPATTuKlU?=
 =?us-ascii?Q?WVYYzGqJyiLvxbKB4nf2QwtT/5opguJa5H0YlyuXz1BmRxSNn6rXuQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?bFL2Vk54zVPOmcvy7xqLgeox64H4tjQaQMrR1HmKgYWVHtWWfVTFs1IMJbtH?=
 =?us-ascii?Q?SnGnhxtG3ccdtAqOaSgOIawBo+6H69Sr2TjtEVrJkJJAQb0Qk+X12aZSOPzM?=
 =?us-ascii?Q?c4xOiCBdqIcE2X3BHsFGVINGy5w9TV6hH5lrRKUpNj/vMLeimDRiGb9njzif?=
 =?us-ascii?Q?KKpJbiEBDVt71BC1m+YnVa7n/1/melhfZ9bOB9toUpoyyU2+WsAnfq6hGbnq?=
 =?us-ascii?Q?Vx7eNwIQlGJTFbC6hglfZKPxAle2Pe4/Dut8lYKUBq7PbsDJ1m4kXWhvcC96?=
 =?us-ascii?Q?rDdNj0x/0s+QMduv1Dgxx1YQtVHX04tbmvehoVkhyQUU4XVVSiIyHGFE/NWN?=
 =?us-ascii?Q?vIODTvRZufyyys53AHMRM5/K/DgPUVRwRfe6H+pHmSkHhSkBBPFw4LP04F92?=
 =?us-ascii?Q?FOGM+E0XIXlC3Y9ARpLVE+pW8VI+OsU+zrACOPh7uEXo1msvmKva/uD+U+iL?=
 =?us-ascii?Q?qfUUlS9VhBu/2JQhj+ULGHHGmz494NP+K9uc320l70Zn60QsFg/pGnVXcZGk?=
 =?us-ascii?Q?jZ3l5Bq8R4G39oFci8H85Qh4fqD5O8jZ5hbK8MqJHvNDWqVQ5xXbweOjQzzD?=
 =?us-ascii?Q?krWWFyvNnvqrG5wYBgguz3h5NWShJk0+70+tAnJm3P1NrL9za+cn1O5K4RFD?=
 =?us-ascii?Q?cxJSLIVYG2rovhfTHUDOoz9m7zSc0W0nOmQK065rAzwLkn+NlbFxdVDLZ176?=
 =?us-ascii?Q?Yd0oKJn1jaYw9eOHu1iV1BdOEX7XbRhx8Dw8FUaaOy0Z13IxZpy/agb+aIJ7?=
 =?us-ascii?Q?lRL2VYjIheWoiEWTjj1MQxDYxA+cXIL2X5nialkGe8KFZXnt5jexXR+Ywz+1?=
 =?us-ascii?Q?XL4S5RgXC/6xLEGY2boXvsejq8kCQrinDa9mG6/AHwo/toqyaEPGLmCrFoRn?=
 =?us-ascii?Q?5aPKWlsUAc4ASJW1p6oflcHOf5ZywdDiFoKWiGZmeKpNw4KWm+9z+oVlsUZ3?=
 =?us-ascii?Q?z2b6kJxDqE0XeHLZjhXCUpRxldqVv//yO8DVQcjzOZI6sWcVj9R0PhyQEch8?=
 =?us-ascii?Q?v49/ihf+MqV7CG5Qqdp1ptjisJP735qQkjhQcaUZUWEXc4Nd5YELJKLRpWnj?=
 =?us-ascii?Q?mTguNLl6RVAStVGO7IjYQbGjp7zsYkFcjZoAYC9byygDkeqjo3j2BIvNgDeO?=
 =?us-ascii?Q?UFOChALC3rH91sLVqH2PVD9sUkpDsf6AIy4yqS4gOzYMyEtrwZRHj12j2wRB?=
 =?us-ascii?Q?zl3gIszgd7oqc5USal6rSB/aqJ3jse7rwp+gzKuwlc9OFCLKOCcmNtRkdY03?=
 =?us-ascii?Q?yQtk3hx3Z+JYyXaFUNOS2FYMIfmqvuY/iVWnv3FX8LbnniY71Bl91UakB7MK?=
 =?us-ascii?Q?Dneln1xVZmKdGXugN387mWTSEJW+zSw6Hdk120Tf1C2I701dRjXsDEnJaXsp?=
 =?us-ascii?Q?vZe9je5SynCePgjYhXz3bbgOWHEylkjeBPgg2Q0OKLlcv4FrO8H6fNH4PadP?=
 =?us-ascii?Q?rNXGBj7MXiYWLURV0vzb+X4ULr0GN19FGIupEZr0v/b7M9rWwbfqsHcYIxuM?=
 =?us-ascii?Q?nbhqiy6Ts4dCRxuhkG4mBDtcbccfPflWSYc/v1uoLlPVQ557aSVE9ex+aMSD?=
 =?us-ascii?Q?qnb4pGbQOMhXeZ5s7RvpY2PW+b5w57F+S8okKd06?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5440e873-1331-4a3a-5e15-08dd80ac71b3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:13:48.9497
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RHfW9mEY+OIW0jPbG9KS9RNGh8wEoiOo6TB5cXBjndhLvDe/pE3L8kammuunU6r6AYbFuYH5lN95QrnVbpRTSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104

From: Ming Qian <ming.qian@oss.nxp.com>

Ensure that the slot data pointers are reset to NULL and handles are
set to 0 after freeing the coherent memory. This makes he function
mxc_jpeg_alloc_slot_data() and mxc_jpeg_free_slot_data() safe to be
called multiple times.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
v6
- Improve commit message

v5
- Split the resetting pointer when freed to a separate patch
---
 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index ad2284e87985..29d3d4b08dd1 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -758,16 +758,22 @@ static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.desc,
 			  jpeg->slot_data.desc_handle);
+	jpeg->slot_data.desc = NULL;
+	jpeg->slot_data.desc_handle = 0;
 
 	/* free descriptor for encoder configuration phase / decoder DHT */
 	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
 			  jpeg->slot_data.cfg_desc,
 			  jpeg->slot_data.cfg_desc_handle);
+	jpeg->slot_data.cfg_desc_handle = 0;
+	jpeg->slot_data.cfg_desc = NULL;
 
 	/* free configuration stream */
 	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
 			  jpeg->slot_data.cfg_stream_vaddr,
 			  jpeg->slot_data.cfg_stream_handle);
+	jpeg->slot_data.cfg_stream_vaddr = NULL;
+	jpeg->slot_data.cfg_stream_handle = 0;
 
 	jpeg->slot_data.used = false;
 }
-- 
2.43.0-rc1


