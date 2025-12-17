Return-Path: <linux-media+bounces-48949-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC0ACC5DC5
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 04:05:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3222D3056C44
	for <lists+linux-media@lfdr.de>; Wed, 17 Dec 2025 03:03:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D9582264A9;
	Wed, 17 Dec 2025 03:03:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LkoyYCi0"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011065.outbound.protection.outlook.com [52.101.65.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D0727F18F;
	Wed, 17 Dec 2025 03:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765940613; cv=fail; b=LRk2lJ8RX9VhJu0N5BOHj2uuslKsPsIbL6l/0Bbj7guy0iGlqbC7LnPNSHPuQhj26+0aQuiP0a3EVHe61yEikz50MjeQkc+ybF8q+JXHfOMxeFxumNSgvoa39vKykicpa/sODYqLMn2CzxRzZAMYs9XztF6vN/9ECR7Cf2B0JqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765940613; c=relaxed/simple;
	bh=zhz6zTHphl1cNOBu5bSNaxHTSpWT1zQwU6fZ92nf4go=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PYntTBuotS31+hrcFrks31jvuCLtg51jadwCZUQXppysMuYypEIBnc4mLXD+xIxpuH7vk/gyUJPw2x1KhWl3IIQP4PBNYnQRvs7nyWvGLOc0loGj+mdIgyorfsLegS+sKhrvM++oLiBiJWuTPS1glNtHdHXv9WijWwxcAHA3rtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LkoyYCi0; arc=fail smtp.client-ip=52.101.65.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hjFQwve0W013YNAA90xt9/8ZcC33srbQsUeaVPw4lG4CUInsdLbk8sXq69j0qCuexgO2raekBbVrlEGHNwSP8OEF+B87HK2iHOt7F7ZSlwy8iLESK3Xc92eOeWl8/QVPGrFkdOSNskKvLahs8LJGrpyvs8okicNC2Ll7iXTm8XTybXSSW6V+H2c1KoB0cxGar6WadYE+UC9+FzcCJTC6Erk4CPvxuXrkjs1tPY3CVmhrowvI/ZIWTRrAwmxKIljLrO90XklqH8RyhIi+ZsTiyPDwyS1GwZzW6ozG6LH2b8zxa6YVQJOfGuQLgnTviXaW9VkH0hxYr9c00B+SoHPvLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KHv32TZbv4PFkoFJhvSHtG/FL7SFKuy1/DqcTWwvfKo=;
 b=YPgr2T6NQRijDt3sS1azhbOhVRMPZQ2aVrxDUVTI5os/wB8Omc1JUjdAOcllJ5hi9A0hRFGqnAICRgSAfTM6VMLPf4KMZUzQpp3a69b7mFWRrRIZzIU8Df+fqnNs5o+JIeP98Hc5L7L5+ZABKnNcGOljfJn1+e8X4vXDSnvsGd/BC1lWBMSKrXci7+p72RfcNEXQa90ZFHid82aMPmMIvS6gC0Y14FqSNo5LfZIsLMQxCLzjHS20csi6tiGF26Zz6adHxS2djf4sWEDU+8+b4+ht2siPMXQ3sLKRZ5ucp2M72sxxQ4B5ihSXDe0/TkcwupEUnP/EOr7vbFqnmbI14A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KHv32TZbv4PFkoFJhvSHtG/FL7SFKuy1/DqcTWwvfKo=;
 b=LkoyYCi0ZgmpzMAT48B2pNr3BzCerOn87VDUtUJqQgQsif0d2DDLJP0f/N0prCUV82shEeY4M25UAVyuyZ6HS4Xn5oT5K27EnFW04d4PCD0uZz+6Vs9y5YDxYwP/hkFzo/0PFQxN0i32mx4AAgeaBILci6QkufI4ftrdb8DAM7RTrXkG+x5QKedLHxr4VHFClrZwMRAvNhWHA6sf0HjitGYkxibmnBz+xGlBnyTc4RNV91qNkMssnkXW91ryGqjPAdLTTbuKV2EYtECswlprsDUUC7WOv1/xSVC4K6vNZVMEdlndfqnfQrRbFQvZ/GHInjI+MXwccV+k2uAO4+HaPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB7864.eurprd04.prod.outlook.com (2603:10a6:20b:2a4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Wed, 17 Dec
 2025 03:03:27 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9412.011; Wed, 17 Dec 2025
 03:03:27 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/3] media: amphion: Trigger source change if colorspace changed
Date: Wed, 17 Dec 2025 11:02:23 +0800
Message-ID: <20251217030227.1546-4-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20251217030227.1546-1-ming.qian@oss.nxp.com>
References: <20251217030227.1546-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0004.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::23) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: aff072ae-8f28-4a22-a963-08de3d18d979
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|52116014|19092799006|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?FHQSTDvgNE1vx+ZaEdChTCLuAuouEulXcdh6EHwh6HPZv/zu6nZFq4NlLUpe?=
 =?us-ascii?Q?SLFMHwRE0sqkenfWxs6PSJ9Blt90R283mK1jr+Z6k5heROoBjTlXuJv+XKmR?=
 =?us-ascii?Q?v/CyaHAkf3yzn4rPh72fgB+JnvvM9w2w2gGkojidmBAnR7xUeadjea7MHp1i?=
 =?us-ascii?Q?JKRgRe04q3NRfxZWaNUShoL1e336Z87CyNdqxSIuIpoNmnkVlNMbO4aNuGcE?=
 =?us-ascii?Q?6UDh+QGk7Kutzu/5/d1oBNCYnRBCNVrE9uigIGEdOwUevgnXtUcb/wM8enD1?=
 =?us-ascii?Q?LYhJbnZZYIIrIJw3WtpD5rD1D/cQ6SsHcA5QS+9eEbHu0RFWu7gcdYo31qGk?=
 =?us-ascii?Q?h1B3JGAQKth9H4CzXI5aS+2YIxwJpno6FozY0VhLTLSbEXNaSoizlDDF9I9f?=
 =?us-ascii?Q?UNMpC/q72DyBb10k/89Y1qCGQIfThhg74CoSgT6nSMDXRUZIC9aN+eLdh/a+?=
 =?us-ascii?Q?d33aAKp2Z7KXU/NcN2aHtQxEYOCPk8lQQSyZFoNUl6uvIxEwnDP6ShoPBksB?=
 =?us-ascii?Q?E354qcep/lVHcRyaZSPeVPtpmxtR2JtgJs3LwYZLzlklBVoMA60ustuWk/vS?=
 =?us-ascii?Q?mVlra7TETx4PJyvYjzrolfM6Ij9nf7DteX8/gVXixRym13ut46OdJiPIy1l/?=
 =?us-ascii?Q?uesK9RCnoxVZIkzDcRw8cl+T8w+yCwGFSCf4At7YUfUXtslliISUeBOiIufk?=
 =?us-ascii?Q?wNoU/JNR6Xt4/88kznMNLyOG1/brHoxVQywFsviP6OsNlQxNkS0xhjoo4iE0?=
 =?us-ascii?Q?LjzIhnGpOuR+kfRn79Jq6nQSCjp49p0kmA9EpE/5tLUS3qafM0rR5bz4ob+X?=
 =?us-ascii?Q?BlOWm7xiCi0F31XO28cUA0Mh97VGAegy5OmQn1T4IDxNfZ7aSFbyayhwlFQB?=
 =?us-ascii?Q?oSkO7FiCOQlNmK3S/I4gQc+V34OJsf2ID/7oujNlUBYGvAfwCxfB5gxbOo0E?=
 =?us-ascii?Q?MW2L8UUofbSIshRhDtJUNwAEunWho7taSMfEtJ0GKVYsIzGHPP5RZc7uv9jU?=
 =?us-ascii?Q?dxXfA3VqdkZNf0qJ99K7HiqPe9XLHqzBHax3JlxrDD1t2SBKF19Q7dyuuND8?=
 =?us-ascii?Q?E80q3qy9TbZruFmMXlfVrWM+SyPLF0KTWjyPCw3UZzPIKo7/FOPf2gN7Bg8M?=
 =?us-ascii?Q?JSs7zCEwS6iyeNyPGetQFg0xfix0AuTmvYsThtfEF4XOWZzDPXrDbDiA9kdn?=
 =?us-ascii?Q?LZtY6JUPL32JAaAqTSCVawQi/yatcKHLbGyqw3GiaeXLnKCsd73/ijdQbTnc?=
 =?us-ascii?Q?nERWFWhwpJMRDxGsDIzE3yGL8lYb8bi+rHR5OBY2+KRN/jwK+P667jo8a8Pn?=
 =?us-ascii?Q?TAdaCPf3bEyQZwYG/tnhkDsP+ZlUZvTJkrniBI+c/vC83OgAlUKtJVMEM1ER?=
 =?us-ascii?Q?mij34/2icaUlRpE7eD6L/yp9nNQN7YePfdpkLZyUhm8pcP2nCNlf32BOAqPZ?=
 =?us-ascii?Q?NJ2JldzpHeWShauJbrRdB8zAR51BxWiyzN5P/jngIQMgzsqTvFJM13H8AGux?=
 =?us-ascii?Q?8tF2glu6MMmK8uXI9KiSd3596vCZlzazghYW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(52116014)(19092799006)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tPbiAQBmYA9RXr173lP/7oQvUXgTN2uHEF+MmlTDN8x/quWpdGrzZvZCAzLR?=
 =?us-ascii?Q?cfcWn5srSViqg+BKZQ5Rf0jWkxO4Dcqf5zJyF8pM3GEuj9b3uKv1O6II+dej?=
 =?us-ascii?Q?gyQp36WzvNKvhGlPkZo0LtlZw6Zg69RMgi9QdnLeO4ckgAoUCX8rAG07erU7?=
 =?us-ascii?Q?DMFJhCmQWUORDZ1BF51xxCYDnukyK8lQybDnTz3BIIgdqlup6p/QZmrMYi1B?=
 =?us-ascii?Q?qK+mbO01TWIERLgYLQgp4zjSIMhj1kQ2sSJ+RvCEtx48v9XoFoee9Y5iW80g?=
 =?us-ascii?Q?uNhzR0JZpdOp+P8vbMUdzEf6o9O1nsn908vD6AfGCVQolvJevXnv2cbWBoKp?=
 =?us-ascii?Q?LHFOM7NHp1XJKeaeWPiFPvIpeZdXI5IcpyVaVNzQsEx9p/OrQ5NuP63+4IWl?=
 =?us-ascii?Q?g0J9R30KPaCFMYfVPRfH+zyFltg8qMdw3pvRyULjydrnpcF9aQmN7kFJWHWO?=
 =?us-ascii?Q?WWW7ScR6cLRXofOs6U6JvdntgxPQcyQQgmjQW+3enfjYrFdnEJ5rpWuPUzSr?=
 =?us-ascii?Q?I2IOT8uWwDn9V9iy7qkMP01VN5qHtsg74jJSpTOWSnxiztu383s/ZIqbOZUr?=
 =?us-ascii?Q?Iz8fOqR4MiSktejtpUXsLOIcdLyDTAB3iI1DgExiKuCeVxccB4WPGI6tWhyv?=
 =?us-ascii?Q?bFqB1dK7SDcEikMiBTjSQbIoCa07SR2pb8tp2Bs/FXzWFRgoAgJTsfzTMePH?=
 =?us-ascii?Q?wyWOBRIb041bPeE7itOn1C0PjO0/qoGxGaipjXwge6nCukBXqVpwXGjYfuLy?=
 =?us-ascii?Q?lqlC9L0ubJUPK1nwtRTOqGCH18oNcPH3fl4fOKUQdB7iUNz9ik/MLd0gBkxM?=
 =?us-ascii?Q?aJfc8C+mokhOOn6e5AVBh5RxZ2czK1khueSeSKW2iwgq8sAyY9wRjIQdL9fG?=
 =?us-ascii?Q?vk0825NH8sKTwb5SxiYD7QJYL/dyEU5jcWNowz33GnsnR4PhtTJxDaz1S3uE?=
 =?us-ascii?Q?yWRENjDbb1p4Nk86ctRScLVYxtdTAfQ4di8TZz7VavNGufiia8eR16kulu0W?=
 =?us-ascii?Q?d2dFTwaM9vcJ/msDEvTOH9QS7CRuIUAyVZyWhq2sPzuTH9x5ph2oBEcFrvLO?=
 =?us-ascii?Q?yNxaj+hDLLwwjvLHWAaopQZ285WxfJkHzcxXL41jFFKO2y8muH/JYtnRQ/K/?=
 =?us-ascii?Q?LxiC9+v6TXCq9jnrJlsYNzR4uhGBnpS9qTphgbPZqNjGRClf3NRpLZ1R5rRU?=
 =?us-ascii?Q?GX8XOsPDSn6l8Xww1Qo676nfUGCBYaqt2tvHLLn6LYhE/Yw0PcZlNfTnZrLZ?=
 =?us-ascii?Q?+YB7xNXTAuPLfaHrL3bwIi4nl0p/RvDdWvtf6ubbqmmvCfXJs1nSUeGM8smD?=
 =?us-ascii?Q?uwptIqfQ0dOnj38a3iqwoi/D3krBy0AsUvzs+zzev0AGf97eV8Z12Z9qEE7J?=
 =?us-ascii?Q?TC//GZP5JOQKf11rriiPPQx8c5zZFzSGCMuGHRGuxOk5hBnmNgxRDcjn4sCt?=
 =?us-ascii?Q?dvmIdqvvygd0OwLsxybdjEA9tIB4mPQ4MN/Y+yFxBaBC4r8pqT8iil2Zg31B?=
 =?us-ascii?Q?wSa0k9U6IPaZ0FxYm6OLuVArj/PkcZou/YCJYkUJMLx7azrZSTeMwA84zhiz?=
 =?us-ascii?Q?3SC/HGokTv2wphuDHej8YR3vQvys7Ygc/8UsKGo1?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aff072ae-8f28-4a22-a963-08de3d18d979
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2025 03:03:27.4528
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: w1T5cO8iU7Tj2D/g15y2W9PRDbNBbrwllWs1MyYNm1z7yuOyRnT9nU8iPzEdKuM7wux24obO52chvRQ0vjUVQg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7864

From: Ming Qian <ming.qian@oss.nxp.com>

After encountering a colorspace change in the stream, the decoder
sends a V4L2_EVENT_SOURCE_CHANGE event with changes set to
V4L2_EVENT_SRC_CH_RESOLUTION.

Then the client can detect and handle the colorspace change without any
buffer reallocation

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 drivers/media/platform/amphion/vdec.c     | 61 +++++++++++++++--------
 drivers/media/platform/amphion/vpu_v4l2.c |  1 -
 2 files changed, 40 insertions(+), 22 deletions(-)

diff --git a/drivers/media/platform/amphion/vdec.c b/drivers/media/platform/amphion/vdec.c
index f25dbcebdccf..beeaf75c76b4 100644
--- a/drivers/media/platform/amphion/vdec.c
+++ b/drivers/media/platform/amphion/vdec.c
@@ -950,7 +950,7 @@ static void vdec_stop_done(struct vpu_inst *inst)
 	vpu_inst_unlock(inst);
 }
 
-static bool vdec_check_source_change(struct vpu_inst *inst)
+static bool vdec_check_source_change(struct vpu_inst *inst, struct vpu_dec_codec_info *hdr)
 {
 	struct vdec_t *vdec = inst->priv;
 	const struct vpu_format *sibling;
@@ -962,26 +962,35 @@ static bool vdec_check_source_change(struct vpu_inst *inst)
 		return false;
 
 	sibling = vpu_helper_find_sibling(inst, inst->cap_format.type, inst->cap_format.pixfmt);
-	if (sibling && vdec->codec_info.pixfmt == sibling->pixfmt)
-		vdec->codec_info.pixfmt = inst->cap_format.pixfmt;
+	if (sibling && hdr->pixfmt == sibling->pixfmt)
+		hdr->pixfmt = inst->cap_format.pixfmt;
 
 	if (!vb2_is_streaming(v4l2_m2m_get_dst_vq(inst->fh.m2m_ctx)))
 		return true;
-	if (inst->cap_format.pixfmt != vdec->codec_info.pixfmt)
+	if (inst->cap_format.pixfmt != hdr->pixfmt)
 		return true;
-	if (inst->cap_format.width != vdec->codec_info.decoded_width)
+	if (inst->cap_format.width != hdr->decoded_width)
 		return true;
-	if (inst->cap_format.height != vdec->codec_info.decoded_height)
+	if (inst->cap_format.height != hdr->decoded_height)
 		return true;
 	if (vpu_get_num_buffers(inst, inst->cap_format.type) < inst->min_buffer_cap)
 		return true;
-	if (inst->crop.left != vdec->codec_info.offset_x)
+	if (inst->crop.left != hdr->offset_x)
 		return true;
-	if (inst->crop.top != vdec->codec_info.offset_y)
+	if (inst->crop.top != hdr->offset_y)
 		return true;
-	if (inst->crop.width != vdec->codec_info.width)
+	if (inst->crop.width != hdr->width)
 		return true;
-	if (inst->crop.height != vdec->codec_info.height)
+	if (inst->crop.height != hdr->height)
+		return true;
+	if (!hdr->progressive)
+		return true;
+
+	if (vdec->seq_hdr_found &&
+	    (hdr->color_primaries != vdec->codec_info.color_primaries ||
+	     hdr->transfer_chars != vdec->codec_info.transfer_chars ||
+	     hdr->matrix_coeffs != vdec->codec_info.matrix_coeffs ||
+	     hdr->full_range != vdec->codec_info.full_range))
 		return true;
 
 	return false;
@@ -1333,20 +1342,25 @@ static void vdec_event_seq_hdr(struct vpu_inst *inst, struct vpu_dec_codec_info
 	struct vdec_t *vdec = inst->priv;
 
 	vpu_inst_lock(inst);
-	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
 
-	vpu_trace(inst->dev, "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d\n",
+	vpu_trace(inst->dev,
+		  "[%d] %d x %d, crop : (%d, %d) %d x %d, %d, %d, colorspace: %d, %d, %d, %d\n",
 		  inst->id,
-		  vdec->codec_info.decoded_width,
-		  vdec->codec_info.decoded_height,
-		  vdec->codec_info.offset_x,
-		  vdec->codec_info.offset_y,
-		  vdec->codec_info.width,
-		  vdec->codec_info.height,
+		  hdr->decoded_width,
+		  hdr->decoded_height,
+		  hdr->offset_x,
+		  hdr->offset_y,
+		  hdr->width,
+		  hdr->height,
 		  hdr->num_ref_frms,
-		  hdr->num_dpb_frms);
+		  hdr->num_dpb_frms,
+		  hdr->color_primaries,
+		  hdr->transfer_chars,
+		  hdr->matrix_coeffs,
+		  hdr->full_range);
 	inst->min_buffer_cap = hdr->num_ref_frms + hdr->num_dpb_frms;
-	vdec->is_source_changed = vdec_check_source_change(inst);
+	vdec->is_source_changed = vdec_check_source_change(inst, hdr);
+	memcpy(&vdec->codec_info, hdr, sizeof(vdec->codec_info));
 	vdec_init_fmt(inst);
 	vdec_init_crop(inst);
 	vdec_init_mbi(inst);
@@ -1375,7 +1389,12 @@ static void vdec_event_resolution_change(struct vpu_inst *inst)
 {
 	struct vdec_t *vdec = inst->priv;
 
-	vpu_trace(inst->dev, "[%d]\n", inst->id);
+	vpu_trace(inst->dev, "[%d] input : %d, decoded : %d, display : %d, sequence : %d\n",
+		  inst->id,
+		  vdec->params.frame_count,
+		  vdec->decoded_frame_count,
+		  vdec->display_frame_count,
+		  vdec->sequence);
 	vpu_inst_lock(inst);
 	vdec->seq_tag = vdec->codec_info.tag;
 	vdec_clear_fs(&vdec->mbi);
diff --git a/drivers/media/platform/amphion/vpu_v4l2.c b/drivers/media/platform/amphion/vpu_v4l2.c
index 47dff9a35bb4..121165a7184f 100644
--- a/drivers/media/platform/amphion/vpu_v4l2.c
+++ b/drivers/media/platform/amphion/vpu_v4l2.c
@@ -102,7 +102,6 @@ static int vpu_notify_eos(struct vpu_inst *inst)
 int vpu_notify_source_change(struct vpu_inst *inst)
 {
 	static const struct v4l2_event ev = {
-		.id = 0,
 		.type = V4L2_EVENT_SOURCE_CHANGE,
 		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION
 	};
-- 
2.52.0


