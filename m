Return-Path: <linux-media+bounces-30579-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B87A94DCB
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 10:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC029189218E
	for <lists+linux-media@lfdr.de>; Mon, 21 Apr 2025 08:14:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D41C210F45;
	Mon, 21 Apr 2025 08:13:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="LVeDbWIG"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011025.outbound.protection.outlook.com [52.101.70.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D914921421F;
	Mon, 21 Apr 2025 08:13:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.25
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223229; cv=fail; b=oQVkL4xJwHppka77DsXnU/q56iKZxnbScEkxz6olsAgq5hn/BI+bi1T8GJ+3/LYU8fA8h+zfDSY2PxbQvhitwBKqmJliqkUgUh9v7ue2Ed/B6VJG7lmlRcgGZnUvBELBH236Td4uGrc2uNO9QcC3E9clGQHGbuDdiEiqITPWSMY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223229; c=relaxed/simple;
	bh=/psIwS8SZqv4TZ6lOez+2etOYxkQ9VfqBWmkr6zIm4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GrziPPSY28EsQ4XEZ0tK/Kcib5L+/yRa3CZXIwPDYj0JFxW3csDkEkReYO0CBDPFQXCQ3QRwy5Hx0VLfsg7ls6GmSA5fbxWvZNWJ6u2rjA5AmYZxuu8RwOeFa34IZa48S9dENbnC9YkDXa6qIRnq10I5JmtaXCzc/HtGYZ7FjVw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=LVeDbWIG; arc=fail smtp.client-ip=52.101.70.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BacdKi4TlOwTwWVH3JBcV6sVvkgpo+OiuYyI4lY2eWJM8x8qoKPfI8nETyOOoZQf0x4sGxfOZQ4HeKQx7Vrcjn77DxOWu2zf2JBtvmltT/LarAp2HF0X9xPOr/mN6OxwA9SRPYOQHqaF460XxoBvm6miU3Adg5YUTOZAWsR7FG6S0mQ6TKpjwZctPJS7L7zn8/HFTqILkh09wvpPmryuE6ApnU1zVuXFiTAX0HoCBSraYWa/vt5lEM5vzoQNKBoxbA3miIfgcuQVYygxnA21FvQafMJe65DfD0W0+w0DtSP0iQ1oWoEFnK9n3xZV+f7ihDkTMbajviH3YIa50ei/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rm4ljQwdITTIhJn363QDbUOnuqr1n2gFWk8bbkj8NhU=;
 b=M6+3qcb3v5cDFkjS5zrYGJI4x7MJeiKKpp8iOO61ETHhajz0nMWAjFaXYq2NfFwtm1oIbGrJenFm+G/vl75c1KX80pQFng6oCWjDt6APnZGWDZdivRRH9JHPEnlvk1WN/lLQTQjCt6vK5LqXxWTrUWsomCr2FiCLXOyHRDDIWj8qKCwlv6afvrFrGOyqmWVEUC42xlBGAPCp7UD0JIRCIrkUvRAYvvz9aGvB7HYjwWTfAZ8I0qTOSbFqRVf2o4Pf9Jzb6gAfHGqV7MmGJqttojrQ16yZF9EI7znm4JISfxZWEdEf4sxea2WxsYCANywuoPXurq6KGn7O2MZbENcCCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rm4ljQwdITTIhJn363QDbUOnuqr1n2gFWk8bbkj8NhU=;
 b=LVeDbWIGuSPcnyWI89+nkYUeN3sNBvD5hkAkecrCDnN3c6ZoW4Gb8TG5dgVQGGGfFhUP7XBUWAAqRjJr9caJRGk5stG+paX+DHSlZnedJPxeDNhOolH04+6mg8e8/VQqzRiz8YUE0oqdF1240vjy57pnPQC8h72uJ3zi7HN+iqxOMBR3m1anx5zIF5VaoozmT9CzNz81FajOhKnvvkBkScPpHRXM68UlgRdzkikCFWX82lXRw6fThmkYHEsEnUQIam46gZFtXmCc9yGmoWr9IQlG4GepLO9321vW/5yJM0Lvi+KvKrfiFxP1s0L2pv8lo9xqjjdVxJFl5p5pMNTIUQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by VI0PR04MB10104.eurprd04.prod.outlook.com (2603:10a6:800:248::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.35; Mon, 21 Apr
 2025 08:13:43 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.8655.033; Mon, 21 Apr 2025
 08:13:43 +0000
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
Subject: [PATCH v6 1/5] media: imx-jpeg: Move mxc_jpeg_free_slot_data() ahead
Date: Mon, 21 Apr 2025 16:12:52 +0800
Message-ID: <20250421081301.1304-2-ming.qian@oss.nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6bfbbff5-e131-491f-3a00-08dd80ac6eab
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?aj5RQm3/l8W/andy79ukAIFebsxlcf3GseS8aUHieel6WCCwvAzKmgKYEyG8?=
 =?us-ascii?Q?Co6Q64mkAsbv7eAHnVtHp5DqplHhiYjtbwXSXblKFBoky1sB1+bCPNK9kgil?=
 =?us-ascii?Q?GBayTQ2SGb0lvHa9rgacUuN/5RsMgM29QtdHLxdubGdaxmtgf5x+Upi0Sizg?=
 =?us-ascii?Q?j6ycE865THouyhnKSqy2I9KUp34GIyRaWe6StuZaYKtP6Wl6q4JjPBNp+q36?=
 =?us-ascii?Q?+jC/GyGZrSC3mUXYc0Zgq4skubfdC+xLSmQxFUs0Z1yvfI+AM9q3mdE9pcuE?=
 =?us-ascii?Q?kPHohr+f6rwr/0Rb1xrf3MUx2VWgJ0mG16Qvcdw+bAPXc6lBSdM/lBw8vG4A?=
 =?us-ascii?Q?9I2KJf6guzIkL7lQBsTy3Ti12vsdKY5W0BLiF5WC8edt7VaYtBAT6jjvYXDg?=
 =?us-ascii?Q?fWi7tTv6mczbyvForhX6ScGvhJvdq7neSYrYPdkZq+H2eDtb2pNUSTZoqGun?=
 =?us-ascii?Q?jznaNb6+rEHb5KZioW34Lc2wf60bxkOMNKkw+M88SGZde7wTXPuFX8guOkb9?=
 =?us-ascii?Q?1UqNNZBIByp5JxUYm7J6qUqWHBEGDHaXcqTDxbyDS4uisUtsS+ppt7X/Wybj?=
 =?us-ascii?Q?bqQH++bynIp2BBNB10Jh5ZW8/66IUQ+9LhjkzleMJPOe4YSIpG0SEL/siTuN?=
 =?us-ascii?Q?X+J120P2Ad3ANskQy7+jNpqvCS3nHt67Rm8LgjFNWpaBLA4U7N8l9CN/71GX?=
 =?us-ascii?Q?cseFK0ogIxQLDhMxH9pjKeEYM0RDvrTciNtsAYVpvmB0XVHIVgWjyb70XKz8?=
 =?us-ascii?Q?vuksU57PbLB208MGBBhuSO8nYM5NQONN3daBnXFuzCD1Q9lCakqgrxfMbnUB?=
 =?us-ascii?Q?xwE9Ky0dh2eAh9oF6ixAJPG+CO1yPg0wHH1eHkiSc2WfIsoPn41RKVB+xyvH?=
 =?us-ascii?Q?jLLgnRvPi83YHmS77z/OfWjK+OJ4gv5ZElRcdHBareqSoxGjDg3qhaYma59a?=
 =?us-ascii?Q?K5XIocb6iLhVCoW6MxIaWtn0eZJk+B4SFUWT9UuDahFEjK2iN339qgVO7m5e?=
 =?us-ascii?Q?yhCOCVVPeG0yJivaoJQ5J9KBXt+7XvUKA8KJpY2XtUBZDlUH1jIhxox2UD5f?=
 =?us-ascii?Q?2C0/x6EzexpZYeGSHKA32O+v3Ajp0bIjlI/rbgMupVZMeewRMbiQGJ1JE2H7?=
 =?us-ascii?Q?i9G/qPOPU9gj5CnW9abyJsl2nvmf9idsWA9oV9jcbSrlEqVyISD+JzefVRB3?=
 =?us-ascii?Q?5+N1QwBLaIl3VV9knR9UFHIqJbi3Cc2Z9NNoPXtbpsvbKTYlBlyJcS3OQBox?=
 =?us-ascii?Q?NKo2434JE14toSMX9zOM5PDjFM5/iCHgHa6w+BTuE5eJ3+JzHFpngIk2BuYK?=
 =?us-ascii?Q?6LhGUs7oMQ2ah/5uWXvlsDc6vg4Bu2i+GaKwI0gqjnmJ5dpTQQ9O5+cis6qo?=
 =?us-ascii?Q?sw04ca5otGtrSWMAYkPrSgb5S0i+2XrICS4ju4OTgL5RbtTMobmhgLCOYFVR?=
 =?us-ascii?Q?KQLDoQY3ec6d8MOu7PlxtvKZWe+KVpW3w2lPHPF7bEKoKItwNdr5h2IUDKrr?=
 =?us-ascii?Q?ajNk9KJ1H3BiYb0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4qKsYly1ZIm76Tw2Kz4gNAmwQz6k7m6pmD+QamkkIzupzpr1VODYZL4zH5zM?=
 =?us-ascii?Q?PFh6tn1zo4L4yQHx6jd2ZuRoncxt/vny/yHeE7CHqKejuC9eU3miegtsJizH?=
 =?us-ascii?Q?7yqFREx830YQjwXAHPhFExxpp6nrF6KDVzghfjyKtb6WUXtssA1UvGakZwW4?=
 =?us-ascii?Q?eV5Z9rhUtgyHo/y5TCDaj0ncpnmtZe4fIAhCtfPDlmTSPihQOdDbDkIr+jzL?=
 =?us-ascii?Q?Zo0pScTr8UKmWHtv0banXkFh4eTemTkZPDuBP/drtvKnmZQwu/q75Jpd/2Y8?=
 =?us-ascii?Q?mTeK+IUoiELHkZtGKBPn8j8cxR5+Ce7r3t1UCplw7xKrCr3KzW+a/zxsAYd2?=
 =?us-ascii?Q?m/quNuMzDnBwgM9zKL41ercFwcMQITiEIRfxth4nF3AgzKLu/oQA4QxHKUHW?=
 =?us-ascii?Q?yxB3W7MlFBikoKIQajdXeDSmzisolZaqtI63TyrS7GIj7WNhyiJTXxvpYJBY?=
 =?us-ascii?Q?DKt9SchjsFQv1l48phcSLW1vCNmXmHV3JGO11fLj3EFOGMFnwgII+Y8NgpBH?=
 =?us-ascii?Q?Qh1hR/tzNXFig2o7dPIUC3SxVAOk6dfTspmE2iSDYalEJb5zwTZxkPpjF0oN?=
 =?us-ascii?Q?a4L+Bge1TLDdZm/It7tZ3tDUbAvKtajzcfSiQuj2fe4EfmIyUPDtbqfVwbtr?=
 =?us-ascii?Q?neXeKo9XL8LU5P0CPt7c+CdKxyYtlrZ7SBYSRJEIMS3bpGivY0sh2A2Yxjw0?=
 =?us-ascii?Q?s0YD1LQDXnwoVYH84pc+L+Ew+Qk5x5bHLuA+oI/iPk0plb3gWaMSjz+EaMXQ?=
 =?us-ascii?Q?b4zSdDEfB2Gu8Ltq1zv+pnEhaHa1jEQ9rTeZPsNXuD/1ULtm7419OaABYDj6?=
 =?us-ascii?Q?eZ56SbJBuE2zpYZmDWNW9PJP/fxUja6RAzvaxXo2roeISiRv5q5kf1nZYL9U?=
 =?us-ascii?Q?NKm7danHRzHwg/n1GAXfC4vispQhymDuGvUa29XZVL9rwMudGBvWax61yE5i?=
 =?us-ascii?Q?5TaDbYMEv/vX09A0E2yHhNhM3HTVHfZG+VFXzNYXZncLneOlDRFZfv5T0CdY?=
 =?us-ascii?Q?PviqPPdKJftjvcNCSBy3KPCK676CinkQUe8cltOOV7o7A/VnxHSo4keqJvbd?=
 =?us-ascii?Q?EWUAx7aEklMgJV0HZZSfFzIt+nKohBXs2fOs4ygjZ+oHMr5Q4twk1KTIOEZq?=
 =?us-ascii?Q?lrP7R2tOPmobYD1WEwVJBsm5ce1Y1Tl1T6MNJFXg6cbg5aZQo3/D7qA08HsP?=
 =?us-ascii?Q?nuUuW0H3nkvAiN/2ie9bWSusKhZmhelrwCbP5mJQ1HHDipJsCith7kRxATYQ?=
 =?us-ascii?Q?e9NmfBMJSInG6Do2czVm51l6UGjTCP3Zc3VGHjczjfpKLlLOBz/HL9OdmpbP?=
 =?us-ascii?Q?Ad+TPpQuD52iNkXKWU0pOeosS/gMkiTjOwksznqVZ+unulIzf5GFODaHjycO?=
 =?us-ascii?Q?UxjMGbCyxk45YMRNOASPwHXyuD3pt4TpOoYcDsoL8lzzgs+S/MdkKwPrvwz+?=
 =?us-ascii?Q?W0SRC2JbvppVVgt+BAtB/VApRxOLHUgXfaiD+/tH1zKrWRGxutjXMk/MgVkG?=
 =?us-ascii?Q?NUSnfMn+Vv8+mD5XvseLx3ESj4dxNAtaPiiG88mgLc/aORPXeeocu+PJVhms?=
 =?us-ascii?Q?fiONi0VRDOHFtfnY5Uhg4C3NyIZICgtLDamGHe2d?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bfbbff5-e131-491f-3a00-08dd80ac6eab
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Apr 2025 08:13:43.8816
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1gv3dkSusba5BAy7BB8Kt1YYD9dOvW5hApyJABU/lVezTo1IU0i+MS9HgKmdDnQIPoxUfNMb+bnQTQz8lvt4Bw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10104

From: Ming Qian <ming.qian@oss.nxp.com>

Move function mxc_jpeg_free_slot_data() above mxc_jpeg_alloc_slot_data()
allowing to call that function during allocation failures.
No functional changes are made.

Fixes: 2db16c6ed72c ("media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder")
Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
v6
- Add Fixes tag

v5
- Split the resetting pointer in free to a separate patch
- Add the Fixes tag

v3
- Split the moving of code into a separate patch
---
 .../media/platform/nxp/imx-jpeg/mxc-jpeg.c    | 40 +++++++++----------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
index 840dd62c2531..ad2284e87985 100644
--- a/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
+++ b/drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c
@@ -752,6 +752,26 @@ static int mxc_get_free_slot(struct mxc_jpeg_slot_data *slot_data)
 	return -1;
 }
 
+static void mxc_jpeg_free_slot_data(struct mxc_jpeg_dev *jpeg)
+{
+	/* free descriptor for decoding/encoding phase */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.desc,
+			  jpeg->slot_data.desc_handle);
+
+	/* free descriptor for encoder configuration phase / decoder DHT */
+	dma_free_coherent(jpeg->dev, sizeof(struct mxc_jpeg_desc),
+			  jpeg->slot_data.cfg_desc,
+			  jpeg->slot_data.cfg_desc_handle);
+
+	/* free configuration stream */
+	dma_free_coherent(jpeg->dev, MXC_JPEG_MAX_CFG_STREAM,
+			  jpeg->slot_data.cfg_stream_vaddr,
+			  jpeg->slot_data.cfg_stream_handle);
+
+	jpeg->slot_data.used = false;
+}
+
 static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
 {
 	struct mxc_jpeg_desc *desc;
@@ -798,26 +818,6 @@ static bool mxc_jpeg_alloc_slot_data(struct mxc_jpeg_dev *jpeg)
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


