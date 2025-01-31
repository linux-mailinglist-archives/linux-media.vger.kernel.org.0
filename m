Return-Path: <linux-media+bounces-25486-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A1AA240CC
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 17:40:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C4AEA16A5DA
	for <lists+linux-media@lfdr.de>; Fri, 31 Jan 2025 16:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63E761F5606;
	Fri, 31 Jan 2025 16:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="neazvYEU"
X-Original-To: linux-media@vger.kernel.org
Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013016.outbound.protection.outlook.com [40.107.159.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFCA1F5435;
	Fri, 31 Jan 2025 16:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738341297; cv=fail; b=MLJFyo9e2pZstzNPquhlTgUQjZjDuyDmzFgnDG2ikcYSb0FWntqDTsz5r9keqYgXHUDTBwU2BHIXUnpXqL6+ezUV51lEBJazQ0rJC1MwhHpDAyYlSvF/VGRwNL+MJUTMw5c/aFjkdbupUghuaxwRJrpjM8rhGepTnhe2cYN9r3M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738341297; c=relaxed/simple;
	bh=fRNHTWxDFYyTsrv0QYiefZZYb2AVArN5438n1axWlyE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pZse5PNZ/Z62bbyKSQ8mK5bqMkXPd+irU8mV4BD8OBNGaOTg9bo0N9C6BoK2GZz3QnSGWcG5OVnYxLXESnwScXMJTdwWrLw1uMaYeBvNjYe92Lui1RfwfyLM2o2dXEAV5cZ1iHd85HywjeVmJ1zUflTGLgb0aaSa+Z7eD1i32tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=neazvYEU; arc=fail smtp.client-ip=40.107.159.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hK2vicD+BH5Cj8L+j6un7iEMHKmhLlwHvrHJ8S6UEuzo3GWca6QGE04jVRE+NWXiuL9S66uqpRpW9YvlZfwElVNlW0DNVBdUWukPdz0bgHXBwvwQgwP7FXejXlRy8zFhXoFdNe1im46lZ8ceFox0RM5XMeknstlrcVeoEoWOsa+GjGXyPEyblaizVMyoqxhYOJcAHnXlV4zoF2slQZlDMMYPacT5kq00kub5mpqK5YOXYlxzS4FOl8HlE9xTo0hsWdEhORiKBTXGfWXILb3o+t9QwPfjuM+8KEANws3KaiyC2ihYeXOSQN2v6GM9kVSy1fpXTKElBkRa+967GTWFHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aSW0G4OXovQaBEsBShWAmHq4Q7Up1gDrLIl6BdRgZbQ=;
 b=bsFnGwICVB7h0XakYuTkdxLUpB4D6O9dqjr4uklIKDkZ0fgV6+eI8y20jqEioOL5HwCgKo5rp7VLBVKWlZM3s6U2YEHwtDIuvOLyUDYNxwRXmgBcDx0t+6ck0JQILzAUtOiLx9qlU7sZz+t0IIwjN3SLAX77QK5PwbnR3PqmivPlDuaMUEhAIfA9MNNJ8bynP5EMBBqvy39/1j58jdzSCvLke64cM/W942kQcbVlVTgVZRoPBJdcKbctiBnqayvpz151dO7i4cPqOVpSeL2EOXKC4o0chuv6i5+lfOTGA7RwFetDPVi67pBtWnScN1B+SpnF7wk5+4Q34yg4w9XQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aSW0G4OXovQaBEsBShWAmHq4Q7Up1gDrLIl6BdRgZbQ=;
 b=neazvYEUN5XwHXRyPFYIwIOg11Hc7MeQd/UMUGPG1A9VIKgPCQ3YVxxF0gUeroSESiJbmk2ZMPuQvrGDVtxg9hiZVAZwUuKWLwPG4LnzuFzUh8yUAVNXHDbXeRmC8WpNw6Zz6FMgeXQy8k9fKzJNGL4LRMws2akf7DKxGmmbqUGzrN2e40siYx+BSHF68hOwjDcvhZ0GQNdV7AL8PhnCy2wG7Lfmy8DU/V89bS5yRh9aAVZyff2jbLE4TqmrSugRPH5F5jtT4HhaLVb2ESfxRclV9qlLOz9oELXt1KlylGId8TKwNTj2PbzaGmzT+QCeSzxRIjTUUtUtvgXUgRnvIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by AS8PR04MB8529.eurprd04.prod.outlook.com (2603:10a6:20b:420::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Fri, 31 Jan
 2025 16:34:47 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%6]) with mapi id 15.20.8398.017; Fri, 31 Jan 2025
 16:34:47 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [RFC 09/12] staging: media: max96712: add set_fmt routine
Date: Fri, 31 Jan 2025 18:34:03 +0200
Message-Id: <20250131163408.2019144-10-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
References: <20250131163408.2019144-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: AM0PR06CA0122.eurprd06.prod.outlook.com
 (2603:10a6:208:ab::27) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|AS8PR04MB8529:EE_
X-MS-Office365-Filtering-Correlation-Id: 33a0f83f-aa17-4247-1d61-08dd42152d1f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Nn6ghpo0r4OzulyHPZ2vu4ztw9KnAcaVHUou9ysRzN8y89eFrq7AsZ/Zgx4U?=
 =?us-ascii?Q?ED0dWCK9lTRjsiMAUS6M90uk7Hfglw7A5qz75vRE9WBz8JwKYphRw3V10Itc?=
 =?us-ascii?Q?daTzJ+AkawNbloBFm2zJZ8hapLenTfmpTdHp20UuUKWpnSxhV9hgM4neY8Mm?=
 =?us-ascii?Q?C9J4uW0i2RxbeP3CwHVrQxxTDfheZvCzd6vMlvoOAfnxRPj0noBp1ZyvF9Fr?=
 =?us-ascii?Q?/9bw+2HswPxZx7xate/z7J6AVvC24OnqeYEKpN0/tBo5w2iF6udeK9B/oWtW?=
 =?us-ascii?Q?3JaBlay+piwL3nPolxGRQMkMNBqc8U8aaxXx9Gh8AmDDqDhZdk/roe9WUhv+?=
 =?us-ascii?Q?tFIea4SszTC67iDMgivbTTHoFtiJBK77EglKaktNIyFceJRiqZPE7mo5dSNQ?=
 =?us-ascii?Q?J4bxgJmsIfWEIoWb1PQ+hDhMoFzylZmd5oThJbys+WpvLbErl6hfx505P5M4?=
 =?us-ascii?Q?w2dsJvYp0iZnwOguOhe1PSa1qlF2U6SIolP6QGOq+Ci7y3llr3FFiD3BpfSA?=
 =?us-ascii?Q?G5LSumaSWU9qszr7EVjZEwuEBvcTxWlrXdPkIbKcyN8RZnbEVegZGbZcW/RX?=
 =?us-ascii?Q?j2B6uLRu44LUjSC18DFMfYSosQdcPrXyBTDWXAOK81XmF7xGthl8DT6nxShF?=
 =?us-ascii?Q?bH3ibg+BgJeVa9G9y54wMuPDdd1yrW3A1Kn20EHECzr2+ulBd4NNHUEcmkEf?=
 =?us-ascii?Q?IGRNnf/hUO45wYugR1vXFrsa5b7uUEJ9mM1UeEL/mUoPjMAfTsJO8gDYBkn1?=
 =?us-ascii?Q?kIy8q329dO1tFucI+hK8AHuUdKaTKV9dUmmcmIg2U9/gybrNgBARvliQrNKk?=
 =?us-ascii?Q?3cAhhyFKANol/gQrU3DOK/WyHIp7HyfLtXvtEi6nvzMw+js8Q156olFIwwMZ?=
 =?us-ascii?Q?T79ucjzrKPbh8Cu5QOZoFGRKMbfideu7+UPlk3VYccy4QRsm4E57Sg9D46F5?=
 =?us-ascii?Q?wfI9Zw4hDcDPU/eYyL7g9Sf4Qdb+ZF86u0AcQGiVD9cu77ISxZ6Ga2vCPpMc?=
 =?us-ascii?Q?a+W+2nd8TVbSEKKjXK6qWijU4Y35YyvqCGZrEidaOwxQ9CEo8bXbkRyvnilV?=
 =?us-ascii?Q?FCO79M0cMBGj8/1N09I8o95iOWWt0GadPkFJd9Z6vNFbMp0Rg44ue0w0Axbe?=
 =?us-ascii?Q?vWVv460pooS9L/Oou1vyG47wrh0cPRUu20mzGBk+7CKs/kMWOZjvSTLeh+hF?=
 =?us-ascii?Q?bZvsnAiet2ME9bPW/5d52t3AxYGuHP7pZDDJuAS+pluy0Oou2sKnBtygfG4Y?=
 =?us-ascii?Q?Z9SFE984UqPaEC6+FqI8qJyi9954dOEoDr8pytUTEtE1MDvblkHWt37Q5Ri4?=
 =?us-ascii?Q?3ttWCX+SXX+hyLhqHwBd8QTPDgfn4bygCSU9uLpWwpmanaP28wxrjNKEwZ0W?=
 =?us-ascii?Q?7Jr4ytvV42BldDPdQcg6cpC8Gli7?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9576.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8A0Zpcz3EYFNtyzSu/uuyIBV295syE2fitbXCVaBAPY/Fjm4xC/8NLMhIdIt?=
 =?us-ascii?Q?11hocpynoyAQhHox3EZuRbiKdK4WrpYrzA3pNzjbRI+QnbvgHmUtbTyuK26b?=
 =?us-ascii?Q?hrKJ5Kx22JBVrBrKapr1jYEIBxvhvCmovVLniTkRgLvcIxfl96NMhK3A9EXn?=
 =?us-ascii?Q?9Cb5U/a48c6rAnUFvI5ZM656iZY2M7X8EnqPVN/zx8W6BNkvcfUE0r6Soesw?=
 =?us-ascii?Q?ZLNnWnL80gc7yg4KI5RRsetTyasDcKSqT/2EtbfS8qUUzJy1XGQCbqEFRucV?=
 =?us-ascii?Q?0QM3tuZFtnfddxyEv/ViJ3068XkgLrscTru1CO3/6wDrU4PJdGd9RGTQSMVI?=
 =?us-ascii?Q?J9TwDuStjzh6ABJQmh4kqVyBwQc1rBXCr2unNrPUdDUywF5DudczIA9Wt177?=
 =?us-ascii?Q?J2VijHqWM3zDXQWKBrBq+aXuGfQhQWiy03lnGLG168xq+tSIObGyBnUTRJTG?=
 =?us-ascii?Q?XY74Gv6sK6jRrH5wEaPjWtIaIpMcvRec1KTrGK9xUggMQpUkk3UQ4Xiwuwf4?=
 =?us-ascii?Q?ZynPo5jnmp9ARhZIW97FPgFnPn3mkUnHPUVpw56tPBtd6Mx8Dpm1jmzjpZsG?=
 =?us-ascii?Q?q4JSY88JcPdQcnHRLc9OvukL2UpqpyPn7tiSaTPLwB0w1zQBqM2diSqABxRg?=
 =?us-ascii?Q?OMqwdb+81dHMOHK5fQp6thQO+ALsn6f7nr2J93pyO/ffo7C3XZANrmvA2Xgn?=
 =?us-ascii?Q?Np/mDTrfggqxrfwgBKqlvGywycvonEYmI5MCKZK0rlPR+Tzln95mCVkB6Q7g?=
 =?us-ascii?Q?RGtKuMIKCbCv9U6nnd/3/nISOkRAXV2yR/cuWBP5yUtECbYwVnaXkzVXLwrA?=
 =?us-ascii?Q?9NYpwCSWzSx4G3oH9iLJmmMLI+YGV44Qf6biCBDt2L/ob39SHkfovJYFk8Qn?=
 =?us-ascii?Q?zSArz025vebpwFhJfLkM9Q4CymPDlklyGAqYTdr9rUxe5iusJfvK0G15m0CG?=
 =?us-ascii?Q?IcUO00KNljaXpJxkmeJ9QIDvIoKNOojJjTpTnSFOsVaItJte+J07T9Pl/Rt0?=
 =?us-ascii?Q?RZOS630BcXuzeBXlh2EH0MS6wj0NJ+oAaNh3mm86baOqtK3wJjfzThYVAKXW?=
 =?us-ascii?Q?dHmU3fNx8QiqmOYVEwljqs1J8HPnsmkY7qRd6ezqe9vF6NV1rT2VhMt2nqHl?=
 =?us-ascii?Q?4r8CL4vkdWLhghKEQU9ZVuDojVmDB8MzZesuUqEtWLNMYyvUO3wW+kkZS5dE?=
 =?us-ascii?Q?Yzq9GWoRp52MNZJ7Wg+L1hWrzCzKeZ7NyL7fF1T6TFzpyAvVSg3RCRigQ0x7?=
 =?us-ascii?Q?8BfuIJP/qTAWBxJflL7l0/FbG58OqqhCPT2nvkBkuqv/USR/RozWB71WNCym?=
 =?us-ascii?Q?cpITgkydX/1xRINZS6JCiFIQfRygiugC6GotC4bWVWU+4WKXIGR9d2qfonx6?=
 =?us-ascii?Q?J5fXChE6JIzY0jqF51VGb1+Z7T6Pql+g1srMRLUraoXf3S0fKoBJwx3YQpIc?=
 =?us-ascii?Q?x7w5mCb0fvoRI97ark1lBUuXFsF7g9YjIxfRmSoHGIZYA4bp3+/gt+ecQj/O?=
 =?us-ascii?Q?INO/NT+1Ejeae0UueM1Rv9TadHBwK5yzoKgHzuUtYIHgdBWcm5EjyaYsl+ug?=
 =?us-ascii?Q?i6rmBpXn8aLhgLy7yYRbYBkW02XtvdBVODrONhaCmb+ZNtuGBQ1S7N4JERKE?=
 =?us-ascii?Q?ew=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33a0f83f-aa17-4247-1d61-08dd42152d1f
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2025 16:34:47.6793
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oyP41MtJHuS99C4xqefCJvf96FFLpqjha50PLkpULQkAY9c08Kqw/jyzNKK9Cw7E+VQMzFNB6e799puAZQtbtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8529

Allow apps to change the format of the pads. Also, use the provided
width and height when generating the test pattern.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/staging/media/max96712/max96712.c | 57 ++++++++++++++++++++---
 1 file changed, 51 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
index d735798effa5c..ed1d46ea98cb9 100644
--- a/drivers/staging/media/max96712/max96712.c
+++ b/drivers/staging/media/max96712/max96712.c
@@ -417,15 +417,18 @@ static void max96712_mipi_configure(struct max96712_priv *priv)
 	max96712_update_bits(priv, MAX96712_MIPI_PHY_2, PHY_STDBY_N_MASK, PHY0_EN | PHY1_EN);
 }
 
-static void max96712_pattern_enable(struct max96712_priv *priv, bool enable)
+static void max96712_pattern_enable(struct max96712_priv *priv, struct v4l2_subdev_state *state,
+				    bool enable)
 {
-	const u32 h_active = 1920;
+	struct v4l2_mbus_framefmt *fmt = v4l2_subdev_state_get_format(state, MAX96712_VPG_PAD);
+
+	const u32 h_active = fmt->width;
 	const u32 h_fp = 88;
 	const u32 h_sw = 44;
 	const u32 h_bp = 148;
 	const u32 h_tot = h_active + h_fp + h_sw + h_bp;
 
-	const u32 v_active = 1080;
+	const u32 v_active = fmt->height;
 	const u32 v_fp = 4;
 	const u32 v_sw = 5;
 	const u32 v_bp = 36;
@@ -608,7 +611,7 @@ static int max96712_enable_streams(struct v4l2_subdev *sd,
 {
 	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
 
-	max96712_pattern_enable(priv, true);
+	max96712_pattern_enable(priv, state, true);
 	max96712_mipi_enable(priv, true);
 
 	return 0;
@@ -621,7 +624,7 @@ static int max96712_disable_streams(struct v4l2_subdev *sd,
 	struct max96712_priv *priv = v4l2_get_subdevdata(sd);
 
 	max96712_mipi_enable(priv, false);
-	max96712_pattern_enable(priv, false);
+	max96712_pattern_enable(priv, state, false);
 
 	return 0;
 }
@@ -663,6 +666,48 @@ static int max96712_set_routing(struct v4l2_subdev *sd, struct v4l2_subdev_state
 	return _max96712_set_routing(sd, state, routing);
 }
 
+static int max96712_set_fmt(struct v4l2_subdev *sd,
+			    struct v4l2_subdev_state *state,
+			    struct v4l2_subdev_format *format)
+{
+	struct v4l2_mbus_framefmt *fmt;
+	int i;
+
+	if (format->which == V4L2_SUBDEV_FORMAT_ACTIVE && media_entity_is_streaming(&sd->entity))
+		return -EBUSY;
+
+	/* No transcoding, source and sink formats must match. */
+	if (max96712_pad_is_source(format->pad))
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	/* Validate the format. */
+	for (i = 0; i < ARRAY_SIZE(max96712_formats); ++i) {
+		if (max96712_formats[i].code == format->format.code)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(max96712_formats))
+		format->format.code = max96712_formats[12].code;
+
+	if (format->pad == MAX96712_VPG_PAD && format->format.code != MEDIA_BUS_FMT_RGB888_1X24)
+		return -EINVAL;
+
+	fmt = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	fmt = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!fmt)
+		return -EINVAL;
+
+	*fmt = format->format;
+
+	return 0;
+}
+
 static int max96712_init_state(struct v4l2_subdev *sd,
 			       struct v4l2_subdev_state *state)
 {
@@ -690,7 +735,7 @@ static const struct v4l2_subdev_internal_ops max96712_internal_ops = {
 static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
 	.enum_mbus_code	= max96712_enum_mbus_code,
 	.get_fmt = v4l2_subdev_get_fmt,
-	.set_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = max96712_set_fmt,
 	.enable_streams = max96712_enable_streams,
 	.disable_streams = max96712_disable_streams,
 	.set_routing = max96712_set_routing,
-- 
2.44.1


