Return-Path: <linux-media+bounces-13377-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2390A38D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 08:00:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EC00B1F2123D
	for <lists+linux-media@lfdr.de>; Mon, 17 Jun 2024 06:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F2FE7186291;
	Mon, 17 Jun 2024 06:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="gHhjQIUH"
X-Original-To: linux-media@vger.kernel.org
Received: from SE2P216CU007.outbound.protection.outlook.com (mail-koreacentralazon11020002.outbound.protection.outlook.com [52.101.154.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 815AE17F39C;
	Mon, 17 Jun 2024 06:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.154.2
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718604012; cv=fail; b=qRC62RU+0HA9AkdixwJzXVjfnxmnxAIjzevn5OKF6Wu3QTrv3f3iEZYQ5WeZAZcPZB3o9J1Ty7Jbj8FDrCwKFdwnl8P9xJmL8ktWck/cQfjnZfX4dQjHzPVgEut7mpKnTdLfIsmsmUAmrD1NInOCPJ2NKlfsI7GbbGDwudY9JF0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718604012; c=relaxed/simple;
	bh=Jh7NMn5Ffi08bvNN1CoE3ShnyByaBguMtO82WgWG96c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LbMFaLJHONOZVUGXJUFWKyA2b34W3THxsJy0dwtjPVkvN4TSSmd7jMcXlrkm42yZ9nF3PgjULs9CkRI/7DyX6bbDeG7yTHwdn8HW6rsq935HriScq+/0e8hHxhYe4otVWNito5Vk/A4UJaFw7wxB8s2UeN1BluP7844luPqPcC4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=pass smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=gHhjQIUH; arc=fail smtp.client-ip=52.101.154.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fdoA6/cvwBetz48ZwGRuy3Vohvmq3PxQGicZ7sf5cmiUWpkLlsxpARJOUj7n6XhUgD3R6pMi/QrbPlU6urj+3rpDZbH6+ukfevQhtQS6Hztw2M81kYKpC+aFYIxF7q5eXZR/IrYNWPBXzA0+vF4uvj4DYGVLCZ6/WR9mqalYuvmGc29VQNwDCKTCbgmB4dZX1BnDtvYQ/lNWpwKD59Coidd1nL5wTv/HNafmMn24RMX4ZYaw4zT3Z+QOpGBbKkvhUhY6Z94zQuZIuafHIF8tWci+nJDwg2uRelaDE/lCfMExn4cKFJ1/hThyV1atQszgVXLHz4aY4bF1H/beqq/PTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wbHaY/RN3sriw+PWqSPfBhyDm6vcvpDz6rCL7/jkTlk=;
 b=khUb4c2KCza5pJka1rj78nhand6jGzVDfWk7za0Uf1mdWMwxpeq2HSYo28K1c28rHQnqvXUkOb3kusHGxeRf0EIDhu7QfZJrCclVJAPoHOfXretjwejvKjB2QrT5mHY7bSfXqXfX/25Zj3yOUvGDH1luJRNsGt437bwWmbGYHxPrnK7/nO9IbNOgUhIGw5J8iFhmZe5zQVZBTGnw2z+R9GTLa1pkFNJequwC2y8tn5ZWNdTcPfC27fnEswmBj1r8egYq6ZqAJJVQJpDL+TU3FN+XvZITAUTcG8yQkmiAaWcK63HOxuyfhZFG0e6HXDxBeULzk26GOVVn6EMTxaRHLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wbHaY/RN3sriw+PWqSPfBhyDm6vcvpDz6rCL7/jkTlk=;
 b=gHhjQIUH83yqA3K8NonBpNmSQhHzO0XPhy86ZRI7Uh2bKlNF1BCm8WsXg0bpGDuWGx03H2Ss3bdrw/R49Fg7WeKnLoCqmWjH15BYK9AfHmEbxvFp2tEdg4o+5yeB4NAaV2gxfQkDG8+sc8mOcwk6KfDZJLPBatGiv61xtg1cOQM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM (2603:1096:101:15::5) by
 SL2P216MB2063.KORP216.PROD.OUTLOOK.COM (2603:1096:101:152::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7677.30; Mon, 17 Jun 2024 06:00:05 +0000
Received: from SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b]) by SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 ([fe80::b711:5ab1:b5a4:d01b%4]) with mapi id 15.20.7677.030; Mon, 17 Jun 2024
 06:00:05 +0000
From: "Jackson.lee" <jackson.lee@chipsnmedia.com>
To: mchehab@kernel.org,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hverkuil@xs4all.nl,
	nas.chung@chipsnmedia.com,
	lafley.kim@chipsnmedia.com,
	b-brnich@ti.com,
	jackson.lee@chipsnmedia.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v6 1/4] media: chips-media: wave5: Support SPS/PPS generation for each IDR
Date: Mon, 17 Jun 2024 14:59:54 +0900
Message-Id: <20240617055957.135-2-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
References: <20240617055957.135-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SL2P216CA0153.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:35::8) To SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:15::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SE1P216MB1303:EE_|SL2P216MB2063:EE_
X-MS-Office365-Filtering-Correlation-Id: 7108f426-059e-4109-3809-08dc8e92bc0f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230037|376011|1800799021|366013|52116011|38350700011;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WxChFrUbV63onWN1Btp/kYA2ckrbZ41/2KMrwjXt2zJiZGHBuUIpu0ivaKpF?=
 =?us-ascii?Q?0xfAjTD6bnsMtdq3kdyPNPtCNe8JeAOLQ6ooEbbtGHkI5kM8LYWJ4Yuo7frv?=
 =?us-ascii?Q?gmlj6o+41ar5N+YPnvCoXyp1fupuBBh9gOKlKxuPfFEmYX5eLjOU0bhiddxz?=
 =?us-ascii?Q?uSVN6YzuI484qar2gV6KQKHWlMkcwMHIEsfMQDm03wxKJH1ezA87Ko/ysmvZ?=
 =?us-ascii?Q?siYXejcPF4pGGvGZMIyB0kbML3OIsT+v6KYmR8a9YblRRFtX7eY1heLtbTUB?=
 =?us-ascii?Q?lXqR54fEBY9EPyZ9A8SF1GVkm5zRuPkMDF379FXEH19bIJ0oYL/k1jeYJABb?=
 =?us-ascii?Q?tf0w26Eci5naCNspA6DCxx7pCtY8+8t4y8R+c9xx/DsLQ+VpjqPB4cWviQsB?=
 =?us-ascii?Q?uJvqAlAgEZZDbGFBy78F5ZyTRFzJrwP3a60uIuWH6Zx7+eVvARAOg1WmNgLg?=
 =?us-ascii?Q?fwsgXiO6eW7Hows/fuZ9mI4ispDWXQh+mpFcKsuJiPeT3Gr4yJlwMVHM/E66?=
 =?us-ascii?Q?krm6UBsgmZoIenzrVcBRT8RvZEVOVZ1hLRK9KgXYYt+n1igwG4EkVXifYVXp?=
 =?us-ascii?Q?VfClQREZYrfGiWLd5RIoEgm7akU/ZAqclxHoq10poVIrkHVujznQO6hSMM/O?=
 =?us-ascii?Q?h6RvPBKWDAOeWdckK4Llfti9jv2zq+ETav1IDVd6QPeGzpwgXeTTxrXDW0NT?=
 =?us-ascii?Q?ZY4YqWV638Fc1792Mij11Pg6YzG2Y7de9645b5YN8xMBvL9bsBA+h/BaeoDL?=
 =?us-ascii?Q?0vH11dZlL0ld/Zbijc+DBl2tarKF2H/IRFzHj+7dacGIFKWq9KrIeyLnMwTZ?=
 =?us-ascii?Q?OmbrnhE063ghRSZWU1HNHvntT+3uoSwCoQ4oXaImXcG1A0ZRj7IetoJgYPoV?=
 =?us-ascii?Q?qjWTMQ7ILPRoE+r9+uW7DbMEIAyWYWUypYmuSdWqQrdIGVihaa9BpdvQiYtC?=
 =?us-ascii?Q?DYgjoHk/O9gx/T7ftRyVOdE714ZAFGfAYKiMmC75pDhSyvdMHZS7v3hQ/uRO?=
 =?us-ascii?Q?H/f55sRFlhzOoQxhsfToHHXAkzW5Ph6E8+DiMP+qxyqNKDAQAT9qd1Yrd8P3?=
 =?us-ascii?Q?fuU03BRePF8GhU3hcFO+1jJdnwBAVkQe/noTTY3vEZGvUz7ZVQJ0x7xfmKe1?=
 =?us-ascii?Q?wOmzCEAJz4CQXT0H1DV3iIBZbEjnhMQTJvra1ACNfoa/FHBUac69uiL/lTRj?=
 =?us-ascii?Q?F+1q6a+Qr7XzpizjEuTLH3j8WBPBlantmYuwz7pnB2foAdvR5Vd3jij7dUGu?=
 =?us-ascii?Q?2cT+Q72v/jif4IEAVdKtZeDmu8NjIbhoOBOC2NNm9NAKFVD42974S7Y8CwA8?=
 =?us-ascii?Q?Gv5Fzj6MPoXEUiGoDSFcX38VHYocBITN0dSEjb/Tl6hOR2gMEMst171ciHI0?=
 =?us-ascii?Q?evjhmPQ=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SE1P216MB1303.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230037)(376011)(1800799021)(366013)(52116011)(38350700011);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?rUCw9eroukbGrjR+SxbQO0NjCodl/waneicPDqWgp09MPLg66xiFvjGy/h5f?=
 =?us-ascii?Q?rEbO7e94j437ziogGGCY/vPRs4Bb7Yka4aOZbto+pfO86ECzxLzt87Thm8vJ?=
 =?us-ascii?Q?+o40mbhUQFq2oty0ugi1A8Hkz2xDFgnligXUCDgAks5xF2vRnd3lkPBFl3HD?=
 =?us-ascii?Q?RuGoudiD2OOLI1i6fbIOyCUwiFRJ4G/3LBEJSIge8V2+Tq2zkl3e50GRn1a/?=
 =?us-ascii?Q?JPBRuBH4nHlcdt+Wwvzs6uEOr/Y82mS75C4E7Ea/ihF0VXEV0W1PlbgJyzdV?=
 =?us-ascii?Q?ZhQQBEBL5dL9E2vqV8zdcnDaBhAJZq1A8LoNorFWyZd/8U6LXpuz75t4UPE3?=
 =?us-ascii?Q?GX9QUD31F7ZI0vhqjt1K70DmzUiRQGFQgVGJ9RiGMEl8u8fygeFdOOitF1AE?=
 =?us-ascii?Q?cMup9PicZye6aTCNX62W9Ysm6o4r6jWzfzY8i/Raod0PWa8ifPHbfHloQi8q?=
 =?us-ascii?Q?+zvDZoT13eJxZHCE9c2B71pAmKbYKgdcgg/dOoiEnPOzgHhu/Ys4MXaUp2Eg?=
 =?us-ascii?Q?7d0aVPILBIiTIb+9QAvtZGt3w3elI9CsZlugkWTdV+B2WhLF7hCNpuZhesaB?=
 =?us-ascii?Q?d71RwdCuOA22GUAM1JpCXrpSlNBdfgbdfwpAcVvPkfTvpYawDtAa7kWEADOm?=
 =?us-ascii?Q?r18Xs3hmwhjkLX2Es5CFEZ7XzL7u1U1AVc9HmqGeqB9lYf72g7JjxTUTKVUN?=
 =?us-ascii?Q?Q+pzxwQ5p+8m/ZIJtZKa1lL3f1m7OrnW7YxU95LvyOX2QzBGY/dPFdzFApLP?=
 =?us-ascii?Q?YZp6XORsru0AboxcI/v2/eTwxe1kHK5Y7zsiDQpTmrBxuPozFo05iEF9LV2W?=
 =?us-ascii?Q?OSekMdxK5C3B8VkKDCJeo/WPvl5mFMGnepK5X+BaUeGtLDiCfMJhqtOycLy2?=
 =?us-ascii?Q?r6Wqff6vbobKmcumnYWmyRuV6k/GeW4I1zv2TCGPk7YSYCOydNTJ+9U/J1/4?=
 =?us-ascii?Q?qo0Hvs1ewnwhJhGD7k0Msfa9FxhWDadd0tfGvAo02Eb09kFBgXRPaDl6v/aT?=
 =?us-ascii?Q?stwKPDlbQNhidy7AYC39JL23K+gFeQtUAw3z8Xh+iAuOnCnEeiloI6r3svI7?=
 =?us-ascii?Q?fuPaSoLE9d6QtViIZlerUnhKmpkOapfAeCHtmJ4p2t1/KeOuKui0glR9Rkua?=
 =?us-ascii?Q?t9cjPHzy9Pswfo1mmp8OmNHtoEm83xXboL/0wzASs2v/pa8/Mw4rvzsgclSt?=
 =?us-ascii?Q?aR/wnGZWj2Tmwq/HkPKKTG+csOFZrtQ9ZEySZK0UD+P9bVEHyd/jqOFdUrLt?=
 =?us-ascii?Q?7NqRr8CNIJOyxnj6wJlVbSdwJAqYIR/tWjwogxP0zv5QvOawZxRB+qsznEv3?=
 =?us-ascii?Q?uJviqzUI/nf66zuzQ0ysOwmDzVqSByLY4kUuhCUzbUA9xDGqUwedMKkf7yYm?=
 =?us-ascii?Q?5E1jVYHO9HpgoUt1EO+ujNgVG5Q7HzutyJ546iOivZJD7RmtmrTlk8WuVozc?=
 =?us-ascii?Q?sLViJpm7TKrI1a09nfzQi1fjve4h+zTunTDmEREveQli5lExJyxjtXvgdUG8?=
 =?us-ascii?Q?1Hj7dQkZ5a2Kptu4nghOOps45UyNR9zsn5NIy25BHd2bVTXoeS9Ywa0mVkJk?=
 =?us-ascii?Q?EwsWco0Up3AeL4OVu/De+ngdzIJp3FRSd9T4kiat2jDZALU0/Hk224uKOdDm?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7108f426-059e-4109-3809-08dc8e92bc0f
X-MS-Exchange-CrossTenant-AuthSource: SE1P216MB1303.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2024 06:00:05.2340
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdDq+PoRuO5URgY6C1zv0nH/WZEUaXVajPnZ771jwbmvJd3FLaVIqlFNyhKTG6uNk11byG8Zv98X7b3qwcqGUtRRdR5eeVqkFFwqCekFOAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2P216MB2063

From: "jackson.lee" <jackson.lee@chipsnmedia.com>

Provide a control to toggle (0 = off / 1 = on), whether the SPS and
PPS are generated for every IDR.

Signed-off-by: Jackson.lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
---
 .../platform/chips-media/wave5/wave5-hw.c     | 26 +++++++++++++++----
 .../chips-media/wave5/wave5-vpu-enc.c         |  7 +++++
 .../platform/chips-media/wave5/wave5-vpuapi.h |  1 +
 3 files changed, 29 insertions(+), 5 deletions(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index 2d82791f575e..6ef5bd5fb325 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -23,6 +23,15 @@
 #define FEATURE_AVC_ENCODER		BIT(1)
 #define FEATURE_HEVC_ENCODER		BIT(0)
 
+#define ENC_AVC_INTRA_IDR_PARAM_MASK	0x7ff
+#define ENC_AVC_INTRA_PERIOD_SHIFT		6
+#define ENC_AVC_IDR_PERIOD_SHIFT		17
+#define ENC_AVC_FORCED_IDR_HEADER_SHIFT		28
+
+#define ENC_HEVC_INTRA_QP_SHIFT			3
+#define ENC_HEVC_FORCED_IDR_HEADER_SHIFT	9
+#define ENC_HEVC_INTRA_PERIOD_SHIFT		16
+
 /* Decoder support fields */
 #define FEATURE_AVC_DECODER		BIT(3)
 #define FEATURE_HEVC_DECODER		BIT(2)
@@ -33,7 +42,7 @@
 
 #define REMAP_CTRL_MAX_SIZE_BITS	((W5_REMAP_MAX_SIZE >> 12) & 0x1ff)
 #define REMAP_CTRL_REGISTER_VALUE(index)	(			\
-	(BIT(31) | (index << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)	\
+	(BIT(31) | ((index) << 12) | BIT(11) | REMAP_CTRL_MAX_SIZE_BITS)\
 )
 
 #define FASTIO_ADDRESS_MASK		GENMASK(15, 0)
@@ -1601,12 +1610,19 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 
 	if (inst->std == W_AVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM, p_param->intra_qp |
-				((p_param->intra_period & 0x7ff) << 6) |
-				((p_param->avc_idr_period & 0x7ff) << 17));
+			      ((p_param->intra_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_INTRA_PERIOD_SHIFT) |
+			      ((p_param->avc_idr_period & ENC_AVC_INTRA_IDR_PARAM_MASK)
+				<< ENC_AVC_IDR_PERIOD_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_AVC_FORCED_IDR_HEADER_SHIFT));
 	else if (inst->std == W_HEVC_ENC)
 		vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_INTRA_PARAM,
-			      p_param->decoding_refresh_type | (p_param->intra_qp << 3) |
-				(p_param->intra_period << 16));
+			      p_param->decoding_refresh_type |
+			      (p_param->intra_qp << ENC_HEVC_INTRA_QP_SHIFT) |
+			      (p_param->forced_idr_header_enable
+			       << ENC_HEVC_FORCED_IDR_HEADER_SHIFT) |
+			      (p_param->intra_period << ENC_HEVC_INTRA_PERIOD_SHIFT));
 
 	reg_val = (p_param->rdo_skip << 2) |
 		(p_param->lambda_scaling_enable << 3) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index a45a2f699000..a23908011a39 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -1061,6 +1061,9 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 	case V4L2_CID_MPEG_VIDEO_H264_ENTROPY_MODE:
 		inst->enc_param.entropy_coding_mode = ctrl->val;
 		break;
+	case V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR:
+		inst->enc_param.forced_idr_header_enable = ctrl->val;
+		break;
 	case V4L2_CID_MIN_BUFFERS_FOR_OUTPUT:
 		break;
 	default:
@@ -1219,6 +1222,7 @@ static void wave5_set_enc_openparam(struct enc_open_param *open_param,
 		else
 			open_param->wave_param.intra_refresh_arg = num_ctu_row;
 	}
+	open_param->wave_param.forced_idr_header_enable = input.forced_idr_header_enable;
 }
 
 static int initialize_sequence(struct vpu_instance *inst)
@@ -1701,6 +1705,9 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MIN_BUFFERS_FOR_OUTPUT, 1, 32, 1, 1);
+	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
+			  V4L2_CID_MPEG_VIDEO_PREPEND_SPSPPS_TO_IDR,
+			  0, 1, 1, 0);
 
 	if (v4l2_ctrl_hdl->error) {
 		ret = -ENODEV;
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index edc50450ddb8..554c40b2e002 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -566,6 +566,7 @@ struct enc_wave_param {
 	u32 lambda_scaling_enable: 1; /* enable lambda scaling using custom GOP */
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
+	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
 };
 
 struct enc_open_param {
-- 
2.43.0


