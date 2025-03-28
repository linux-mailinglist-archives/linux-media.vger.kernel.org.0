Return-Path: <linux-media+bounces-28910-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B22FFA74402
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 07:32:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6B2413B8170
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 06:32:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B7122116F7;
	Fri, 28 Mar 2025 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="juB5P9ct"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02on2050.outbound.protection.outlook.com [40.107.249.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05B3821146B;
	Fri, 28 Mar 2025 06:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.249.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743143522; cv=fail; b=VBGZEj5uGi+zm6KP9oc0aElDqFe4O8HPtDTOsOiX1Isp0oaN+Rk1qHAoNqDQcR27voA7hGSZlkpvg2Ytv70knK+HpIZKvEbYffCE4prhGHGFyIlcvxIp/jmcAjmw4KF7tSawYR9oHpMp+P+Mtb81F/q6cglzErjcLgqQkOKP1ik=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743143522; c=relaxed/simple;
	bh=tewm9HUujxF33nXJb9ibVnV50mhG2j1m/sS9jjrNedQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=opPIua+Mi6sB4OvrmP7z86jgi1qTLgynXMu2gy6a2MPTUPHDvEZ7c1BGhLc3zvxE85tjzpb8yy7bRax1qEMEfdT8yX+ssHhsH2Kpy/e/GYCwnSCtMwivo5NcN4TqQ2CXajk1ohJe4rG9N/zv3KJMUyhLddw1E5B3Y6V76cn5yl0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=juB5P9ct; arc=fail smtp.client-ip=40.107.249.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z9db3teUr+0U2WsjXxfACdIqD3Y5oD9c0bd0Kv+y5XGsMozEv1pnRtnFRKBZMCIFN+F4ADWsxjZ+X/lrV4onw5dR8c1FQoWnX2B1WwLvOsNXwHhS3GgQyB8PCU0KQHs3oIq2p/B0gkQBkiAf1Z/o43ZzwKBBTKStNJvGrhG9078RYxS1wj4G7Y3m7JZtIrV/JjUxOrHJq1dox36/FQTLN+L8O/AdgtS7RlqYrGCuMp/CgT2QSP2tDq0zYOJlE0koJNoo4erLfUUKQwodiP/WgYlgG8VB3u/ZEi7PZLwIVALekrjl/CA/Kuf39nH03m8ai+rClbuc2BigbTR+J1qDRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojkWQJ5X3HPMUyMZDEEsnr+YzJ6HkUcFlGDrNN7QZq4=;
 b=BEohbrReTEXsqtgRBGsiOD/pVIuNSGcJu0aJitMPs5l6EMhw2gspWbSPKVOkk+UmhMRwuFxGXlzOgdHsrcJKY+oXb1xVzc7YZmumdYmcKpIZjVULZvOPiaWehR9CVOn+WhiRtYezs6p7CqQf6w5NMkd6l1eJ25NGntM45fahGpYMDjf8phErUT/o6A/jHAxEgkvXdbG5Kr788z9A25PqvieMOLaGY6CmAOhrZnJ419g521qwTjLSTm+UFp22QdHXRi+x2hpiPHhY9S1nUzA+SA+Q3+khy2Ufg6ODqfXzEH+p0Ts2wihtyAhR3svr8l/gFpXn6gIEDgJ//jRke20gJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ojkWQJ5X3HPMUyMZDEEsnr+YzJ6HkUcFlGDrNN7QZq4=;
 b=juB5P9ctW/DgGodKek2cqmkMbvb/QAftEUia9SHRq46KN/rB0lPvVmrI9BxYrZjYluOdG/O1oGf4YA86L0Olusfz/Bo816sQcxOQasUdRVkR5nBa/JfXuJD0HDYEotXTfJRrxWO+1Tpy9nV0ksOpm/GYpoA9dC//2PTKFEZ4/RN1yf0x2dHkjpdBcj4rdfRzIkCknIIMN4jXuFjs2DXjvqKvHhNjhFE0k7keb5kENWIk1IT6Qx7RJmbrpoJzFIox1TfoU1ngCPJQZHHLRxcABFve93fT4hkRJigZu9pLxmbKIStAe/cr9ORw5WicRyXmQz9j9ffTKBpfnGulrxE6Xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by GV1PR04MB9117.eurprd04.prod.outlook.com (2603:10a6:150:24::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.48; Fri, 28 Mar
 2025 06:31:57 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 06:31:57 +0000
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
Subject: [PATCH v2 1/3] media: imx-jpeg: Enhance error handling in buffer allocation
Date: Fri, 28 Mar 2025 14:30:50 +0800
Message-ID: <20250328063056.762-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250328063056.762-1-ming.qian@oss.nxp.com>
References: <20250328063056.762-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|GV1PR04MB9117:EE_
X-MS-Office365-Filtering-Correlation-Id: 05780784-5520-47b9-87d7-08dd6dc23d37
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uBCi2TZO4Wm9eUP3Vx5kePaHX+0C5BzJcM9QOguUC6p7iqHzk4QWrFDWwtI5?=
 =?us-ascii?Q?QbKyq4T7Y4FEgb5kZ5HQi8d8nSkEtruNOM4tqoYUD3JvlVqMhkNFltXMjWPp?=
 =?us-ascii?Q?bqHLvBJBDsp/o6Os4ge3gXU/kNEmnBljx4kCtXmFS07nQZtz6i8bVGtxRXSc?=
 =?us-ascii?Q?wmddbDlGxv6LKFzfRymHX8jNRkun74kymFC/Mb4IqmH8VXWsjoV+qWwsLgsV?=
 =?us-ascii?Q?uDRI+yMVAsaImiLzG/BHLVClu93gup+WT1sB+bASOesUIcnBESSZtc/QAoZ3?=
 =?us-ascii?Q?nPS3wVIMCKwmgYoGoUtGOqaxtXdeMsJPi5NoIJqtCZ8Dpo8lwEGSvS1dVy/V?=
 =?us-ascii?Q?JB3oihlUaUI1fnb5yr6m1BlXRsXkru1nEd8Om//12aMyeq4jW7ct8pazvQgZ?=
 =?us-ascii?Q?ywiTWyVJVeCVt68NCSWAuyuSD7I925YM9xQoK8Q8jlU5TiYmTvE8JnQpl13A?=
 =?us-ascii?Q?gk2UvhjJKJHPj7QniJO1ejgo97OR5awJWBp4TK7GjiJjsiMsglHJl3OOWF5l?=
 =?us-ascii?Q?UKnXJ0f6c0EXrsOVxwo8TmfhqGChQCvllgHHDlektHQQoXmIUSDxrKfl71jm?=
 =?us-ascii?Q?At2lk6AUgt2oxxrvYGfG40U+tkZZke65cmSnIUwusG5at+RclX5uJ0cyy/Ez?=
 =?us-ascii?Q?Emo4OBSkvcNuC6TN4qQD9fA5R6WkxKLepBfAebPQnk7plt6x+jpcnN6Ylqx2?=
 =?us-ascii?Q?320b8n3HiLTyvRVfLnrHbjR3PncOO+XHAPqpJ7fZaJMbjw3pLr5RJaqLW+KT?=
 =?us-ascii?Q?4Rg5049XP+LAPJ1Ooz1A9x6gn+Lq15LL5wYuqOnmlBSugIEDnIT1sgT0VrkJ?=
 =?us-ascii?Q?b9YVmFr9HCT4mJvV4VDjaz0XS49wTKLITWfsyU+b7dlifjj0xMPAW833vSJ0?=
 =?us-ascii?Q?FchVslLHjDcSk+CXmzkuPX2EScMsfxWMefW3gQuFDK8bkRQ49WBhmCsGQqMj?=
 =?us-ascii?Q?jUWX6hF61lomqY6aiPWoV2EyiS7Zm6QupHq5Ey0Buv12jPAYDdKfTUUXKgg0?=
 =?us-ascii?Q?CwyHC31gA8qkreJ68S8bxveFZBmuiERxy4O/2v/4zFKvrG/YtQ5bST18pLdl?=
 =?us-ascii?Q?fQeuN8idLelWDgP5EMf3zKXdHVQdmW8WTIDYDZOZgfOdIYazQ/oIz4bkd6Qv?=
 =?us-ascii?Q?yYdT9azUUuZ8yLzcy35NqSa7Aq0TarxcyqOVCWn9+ZPpa7ZGcp0Wi0QxSqeR?=
 =?us-ascii?Q?I/OhLhzoXZuthd/mmzPQ+zvLB4E6HgoFqpOB5Z1kNNAaD25EW3pPev8w28T6?=
 =?us-ascii?Q?6T/uTA9ykCKov1aeYGScLC5bUAsiBDj1muhcSAnmLq94yi9Jzp9UH7OzXJI5?=
 =?us-ascii?Q?WscUQ1pA1HOYK+85mlm4TH5SxkmaBmxLjdnf0FqenlgYeChG/xM9YZ8FPtjy?=
 =?us-ascii?Q?uBwc3MHI0VW0gnR1tSCPcy0iLXebnMG46/Z1Jii7lfghBiUYbxcSdz9iwbEx?=
 =?us-ascii?Q?r1DhbG/bzcOZkv8ZTqt7Hm/V7kYmFyFi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Z/H+AG4nS+muAESPsD4UrDwx8hGzay7fNr09qHK4q39XgUD8bHX5jaw3IYnh?=
 =?us-ascii?Q?tEUNDKk5Xz2zrDKuYmQ0IzWd88EFFeCrCum1gncx+P0FoikX4AxFQL/eK+LB?=
 =?us-ascii?Q?iRUt2LbrrA3jozCsLpj5O6BAg5g99UB6+5AEF9PCzABHZzI1uvlXR47whacG?=
 =?us-ascii?Q?I/5dw4hwWhaMj31nUoLoOxgOcOl2iZ8wrh304L/emGVNS7FbZojaPCc9hDYn?=
 =?us-ascii?Q?QxC9vx3Fxw9RccwCsXDNY43aUOSDrDLSf6hwDfIR10uSEOg+Q7fH2TJNlR6p?=
 =?us-ascii?Q?qFUKt/11jSR3dWObPlfkR3rhU1A2viFhJ4YCW5hMJdC+h55vRftn5TOVfJ/e?=
 =?us-ascii?Q?UwKPSA8HAaVbdHdHxZXBbwvljF/g3UFOl492x1uuhJY0tF24JQ5OHl6vNW0/?=
 =?us-ascii?Q?Vzo3ilKyZ1NTSX6zq/arctr/rCChRApEOcFxUxVrAHGyPsV3lsxJH7Xh4LY7?=
 =?us-ascii?Q?rZq939+T3itnDtC9WiggsK/ZV/5RapB4oLaDgd9IwouVHmwWw5jzeEWUFlNc?=
 =?us-ascii?Q?U2IoCMDx+wrQQ8mgehzHJjzRGij3inP8HMaA/4AE7TzbFXD3lZrf2bhmP5an?=
 =?us-ascii?Q?VTxYlkpgnWLaDmniEa9brKx1CFRmNAeAPJZ3fYN/XX4qiteK54jFtPbfOnHv?=
 =?us-ascii?Q?khfsD8B+hEao+TqwQyMnsNvUO7ddocOeqbXDhCuGfFBxdV5fw66JZu77V33f?=
 =?us-ascii?Q?gSWWsIpCNxJU/oY2LPum9dKJih0iSIbArTQ4TveGzRvEnso5H12dcpoIyMSx?=
 =?us-ascii?Q?hVAtcrYfO1+41ZdNSkx26jqLosbzaSIvF7tGDP6VmUUFK2mgM/RyW+z8dBsk?=
 =?us-ascii?Q?EhKb6LX07k6/gb879XHeS5x7FoCqgeaf27aLOaHkIIGNAbTChmsp0rZF6NwR?=
 =?us-ascii?Q?8WfPgEe9c8knCPSiah4WKa3sFXiML8ik+8KKS/TBNOD8kVPipl1nnONdIy9Z?=
 =?us-ascii?Q?icyOWhd2PDz4jxsiWKJcuINajgaaxS+AsmjBzK20PkbqToo5BU78AgFEJ+0n?=
 =?us-ascii?Q?TumuWBJD4C5UGT0d/vqjZ2qendO1Fn0k1rU4R24vIxfvKAihCeaKOkqWcr4i?=
 =?us-ascii?Q?ejgYrJAd1Oi6H/it9svzJAmdgt8ZVGHT5owinW9FwlH9mLo1As6dhzbl/dtu?=
 =?us-ascii?Q?abWfpcQTNhy/TwWqJ1jTlOaVxnw5YOVZL9lisujyz8IJAAQmlFJBiYWSAyrH?=
 =?us-ascii?Q?PhZ2/tNtKNbTqagbCfQYGtPJ6yVEGxWURNG4MTfaoVRZCzcbEeLkqh7jek4U?=
 =?us-ascii?Q?1WP2vO/H1PKCheag9K8g0O8RfPJEQaBGfIcApnMCBKkoBnatjyqLCGZMMzeA?=
 =?us-ascii?Q?gvN9JtvVecIm8pMYlBKUlJ/T4u4eLOf3st9beDeGh0BE43NiOK6gEzAsNi8h?=
 =?us-ascii?Q?AE4t228T50AhrIh16AGZYJO+7ZNAZNUoX1roMlfJFgicNq6z+NpgAxa4KK3F?=
 =?us-ascii?Q?d92Y4+W4SZMH8b4y+34pU5yRP5w8H4ncBxkhHPEsC8CjH/u5IWzfUFxL+Z6O?=
 =?us-ascii?Q?Xfmpb3nNgI9xxQHQWEqbaPq90Db+ZZIFtnz0TdOgGEo3DZjjbtesZHduHTOM?=
 =?us-ascii?Q?+ft+32Dsl6VbOx0PnNzCESgMPvjhE4cssxBUupbE?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 05780784-5520-47b9-87d7-08dd6dc23d37
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 06:31:57.8229
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QJv/1gY9DjQmGhZ0WzfC+zh9la6Ez8S62Eem20yM+dUc/Kc2YeE9oFyrurEBYujRgzGx3dqM3l/KzRGNGSVvQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9117

From: Ming Qian <ming.qian@oss.nxp.com>

In function mxc_jpeg_alloc_slot_data, driver will allocate some dma
buffer, but only return error if certain allocation failed.

Without cleanup the allocation failure, the next time it will return
success directly, but let some buffer be uninitialized.
It may result in accessing a null pointer.

Clean up if error occurs in the allocation.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
v2
- Add the Fixes tag

 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 47 +++++++++++--------
 1 file changed, 27 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 0e6ee997284b..12661c177f5a 100644
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
@@ -794,30 +820,11 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 	return true;
 err:
 	dev_err(jpeg->dev, "Could not allocate descriptors for slot %d", jpeg->slot_data.slot);
+	mxc_jpeg_free_slot_data(jpeg);
 
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


