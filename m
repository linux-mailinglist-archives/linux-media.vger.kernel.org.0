Return-Path: <linux-media+bounces-37432-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97284B00E7D
	for <lists+linux-media@lfdr.de>; Fri, 11 Jul 2025 00:07:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 781961CA0E02
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 22:08:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6FCB2BEC53;
	Thu, 10 Jul 2025 22:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="L6Ty4wus"
X-Original-To: linux-media@vger.kernel.org
Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011067.outbound.protection.outlook.com [52.101.65.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AA4029AB16;
	Thu, 10 Jul 2025 22:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752185245; cv=fail; b=JKUhv/PIP6Rk0zbfDjC4Meuj/3oLaY88wH2IhPLd/BNGafeEkuGwBI+6xWY4EqpdobLMqDd4Z249tOnPEaj8s0jhHdmi8iOhBxwQOU57ugv+TP0dLcjCzN0QR7EMkEElQhA9dzRWp1Z0QRXcKGY0fSpYIps68/l1nEkycucfFPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752185245; c=relaxed/simple;
	bh=uLMED8+O9J3HsryF4Y4OT5//3UTmtfFL9ljoLKCXGM4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EEWA1jFO2YpGGvytdMydqmI/PUIzJB562ITJXRmGAPa/s9e5IKaKlxBGPRPcPeQI5CQTJeMG/5IPxnq8VWBlBI+DCLRKegQy1wwGZFAJ+h5AjIyrzNA4rJv8ZOHzqvvBpBpkN8t5GgFqL1vsJQUTldAalhiEDPVXDSDz0j0S8lc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=L6Ty4wus; arc=fail smtp.client-ip=52.101.65.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VLJQ4b55IFfBKsZDoPgeQdJ6QeU3b38Y8d/MayneYlFXTdBjozFF7HnxWqhoSU59Kj6ZJodmxXVqsfKenIz6RKNZqdq2G/eAFUxR4Oji+RGYnQfyXgGe0ndf1i/E+F1EZuId5stGzt5+A4AC/EpKTJf96SZgChAXFa3g0lwVEksrezKIrVRsu+O9zD8ZazZrDx9wCFebvJoHQOP2J/HbAFq2bAEFCNaNI5zpS+DVHuYiFMRvIv4yU40q5z30rLP+ut7dgIoSVhHA4FQSnPdoFCjKI7Prql54fLlvMIRxnBYtvTJuOcnHWET5r9xD3FQqubC1n+ThnDgbx73PAWaZ7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLppDm4DxqoCa8Itzg4o9T5NOkCfUytAVLTFlhO8iC4=;
 b=U7fbp7cMLY/m/jYUseXHTZh8/MyIw5I4wg3KKxu/GlriAtr7/b7Mfqke1argWSh32oNX5YjaL7hzfvHYL8QpsXxAA2DxzQRnijBF2buBUm777YbX3yDx4Q1kOoitjYRfga3IiUsyz7snmmADZU/2trJHcoJppbX8QrBnQP18sNU0U5YqSQsq803DEwSQ3jJLdlNwEBmwy6l6/wPpLfHqhOWnsuYU/KmKuSkDTVSVMd/iyhx9qV8JhhDR0PNBjacN4ciF9asVAt3jnkkk0Bkco08K9vsh2ki9ncd7xvTLXkoB7enGomTeFMk3nEjmzmHaDA2JZktjdYhR5GBDfZacnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLppDm4DxqoCa8Itzg4o9T5NOkCfUytAVLTFlhO8iC4=;
 b=L6Ty4wuskmqmNTWwgt+p1qh17krmvAxdAXh3VcqU/fHoyUyP1Vod3YXvTNYdu4XmxctMu1pJVpBBS3LMSc9InYFo29nnNJ2+ZuRv1+FRgszp+AeLmkiBRTSql+tjKFW2tATTFYpIYWtPsVgsEvlp6pFPg5X7VJ0y97yXJYdR8iVH0yG9SKO2djGuvm/2uChUUlVsoyRL8JB1LKySTieMeEao/98awNR2HBxUjq2rGZUXRTiHV1uSWweABIT8giOD49TFyQgsVa/gxVv1l+b68o5OVDX1NrMZsE2RQmlsceEWqw0yVbQq0PdHiFxNYpRS0xKoaSLluShHK+KVFW/oew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com (2603:10a6:20b:4e3::9)
 by AS1PR04MB9582.eurprd04.prod.outlook.com (2603:10a6:20b:471::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.19; Thu, 10 Jul
 2025 22:07:16 +0000
Received: from AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1]) by AS4PR04MB9244.eurprd04.prod.outlook.com
 ([fe80::7303:2cc8:d109:d7c1%5]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 22:07:16 +0000
From: Mirela Rabulea <mirela.rabulea@nxp.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	hverkuil-cisco@xs4all.nl,
	laurent.pinchart+renesas@ideasonboard.com,
	ribalda@chromium.org,
	jai.luthra@ideasonboard.com,
	laurentiu.palcu@nxp.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	LnxRevLi@nxp.com,
	julien.vuillaumier@nxp.com,
	celine.laurencin@nxp.com
Subject: [RFC 2/2] Documentation: media: Describe exposure and gain controls for multiple captures
Date: Fri, 11 Jul 2025 01:05:44 +0300
Message-ID: <20250710220544.89066-3-mirela.rabulea@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250710220544.89066-1-mirela.rabulea@nxp.com>
References: <20250710220544.89066-1-mirela.rabulea@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0211.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::7) To AS4PR04MB9244.eurprd04.prod.outlook.com
 (2603:10a6:20b:4e3::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9244:EE_|AS1PR04MB9582:EE_
X-MS-Office365-Filtering-Correlation-Id: 2a17cfb2-339d-4ecd-2e5f-08ddbffe21b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?+bq4FMkABH42OdVwSP1k9R0fQOmznU0Ax2toMzg9MwJmxTOhHhf8ViJmjJ5E?=
 =?us-ascii?Q?unS9DWKh2Clzz3uBEci0RKm2Pojt/t3Vk2tpaIFOGj5v0wkA2zTw+AYhmrLG?=
 =?us-ascii?Q?vgrpop+OxNRoQsZSac6TYcAy1dkfVkGOnTpfzH9xvtYAHpH+Vkb6auZBOPYY?=
 =?us-ascii?Q?n35oUJa4Bn5E0gG7HEAbwYby6iP0vA9vfHeJUIgOMRibeQiJz1NjEtbl2Lme?=
 =?us-ascii?Q?dZlBEdSWsIl9yWMLoxPLUpoO9lPfn5qyS44COzhef6A8udmv60Q2I+Zab2J5?=
 =?us-ascii?Q?FlD5hEa/TLuXZh8BrR3+29ijSqdwfFyWMMXeB1LjIz6t3Pq90YQY0IvGYyyi?=
 =?us-ascii?Q?EhiZQe2bjR298Y+y/2kl7LaotmLDZWBea4AZUxfYL28WvoVgaTZmqi598uTl?=
 =?us-ascii?Q?FGUkWxlAYepBUKXV1j2PnexWOw4O0VUDvloK0TlavVDbrkf51+GAxlhXsXrw?=
 =?us-ascii?Q?jWqKFViCU8MG32L6Y5u22Jo1fVo/RF9Vv1IoJzGLZWh+w6HHbF0WGJWPvuKj?=
 =?us-ascii?Q?RFEk65qBtq8vo3/gFBifuFS+vsIwdkprZVGbbYlYeugpgm/BFmlPw27+Bvzz?=
 =?us-ascii?Q?dejjR3nFcMv+cWBs7Sy+iA76TD7PVtVctbqRsbzXLnGN40HWlHTa0APQWR3O?=
 =?us-ascii?Q?pXXgvd2IhsGKIAZccRRkCRPqmaBjHLBxq7AY2/LWBWvrSgdzCB+SKKlLhDdp?=
 =?us-ascii?Q?7zu2w0XBt4r5HsSx5GFgXVEt6fUbrgPeNiO6XZTO9UU0B3usw7lzYTt7YmRQ?=
 =?us-ascii?Q?ro01aF088qxu236Z5hbFZ8MDms9kHpoOcWkDtKyKEXPIczpoYpq+8KuvzbBi?=
 =?us-ascii?Q?3WDJplmRZXGnJt50qkUzB9KEFqhdj8PY77TReteSTlbbMkmm0ZIeLoi1gowC?=
 =?us-ascii?Q?BYRM5qRNg2X9BpWgWEztwkDywXb1D8JAX2uteqliZPz6STSLmu6RyJcTy7g6?=
 =?us-ascii?Q?+SShRXeTxX0NzdTel/H3KFbJqX5rQTuoWBdwggj2tOmo5nJGnk5wwkE3L8lq?=
 =?us-ascii?Q?QlCd+/POrIL5cY9BXTysAA5sB6qTSXQChYXtg6pbFchbiix790m0gYEjr0jA?=
 =?us-ascii?Q?gPdn8JuZH8BSUJF0k89z52rxgBmp10LUErRX9/C5KO2XcXjuL03WoP+1PoaB?=
 =?us-ascii?Q?AEpcIhsjNhYJ9fxUEsKIn3l3C7zwwU1KdVZc8XKlncKw5k3MqWTilwCD/pqZ?=
 =?us-ascii?Q?PTIjhcgfqp5j4SLcE3AphZE5xuLEsSIY3QJzb9aIsl9g4407US9IgsLVdBta?=
 =?us-ascii?Q?/gfVpqZDAYYLf94xkSaVM+Xn3eO49SYE1OkX4SpVNfHTwseAuK8ch+lCM30W?=
 =?us-ascii?Q?22eH+58EHXBAGEofauDmYPbXGFUmO7qjZh/T0Ou22yVAneURZdoUl9qFXM3b?=
 =?us-ascii?Q?jYyvhCU2cz+0tXqFymCjCAv84Mlcq4DOtzYblv7wtUWq5/GRIm/oW/MiPsch?=
 =?us-ascii?Q?rnPJUYrUETmAVw2+EyVR/+AkfDKTXslJRY8WkwBwAn/lzfgUVzHqEg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS4PR04MB9244.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?6xRCQ5D9jhp+posp9YeNTHVPh+0k/2TYNp5uexhgRQH1hzUMqb3tlIsbCw1F?=
 =?us-ascii?Q?abl7CKVtPxh8Gp4Wxtz+mcRXhYpXrbKTxmOoVZuDIFJz5HnuGEM6jIsWa2+Y?=
 =?us-ascii?Q?s9Hcy3ue+HxHuI0Ii5cdffdFz1FflV8tYCWDvv1s8wkQwdqTIVPiqIe1P2eZ?=
 =?us-ascii?Q?dpYcUucY98j8iGZW6BCGpq/y+9TArUkmYbCwCayd/wZFm9PepRYdkcmPmFhJ?=
 =?us-ascii?Q?9Xumb7FOxyj4imCotYWLQKXVUurQ4UIniQvZgHAmjKE2jBjCq4FtlJ/tkb99?=
 =?us-ascii?Q?iCceHPWWObEpCRIPHyLBXicrsec+CsOn/uhxQysuguFSV7DxZIoaEMpCSMZS?=
 =?us-ascii?Q?jjQgEgripFtg6a3ocoSSMyjWTTduMLDLKDbHZUjq6G8loDimcs0KByBt33Kh?=
 =?us-ascii?Q?pyxs9NYrW25wWdLMq5Mm+VQOE4LI/Xs1Cr86bdtz355CiDPcDevvD5u2N3PV?=
 =?us-ascii?Q?kKgyBtqGs0wubV1ue0fxm484q3rWKtM1cllz6mg5r1iLRcoo/l3ujxtvqdmC?=
 =?us-ascii?Q?2YPYc4b8VG0h97RzKhSuBgBWhmNcikWmi+ahtqtkfE4nkaQDyIc6+2qKwrRx?=
 =?us-ascii?Q?0ARhokGYvsOJUrgkGTGms7SJyK9mTktNrUiXkStScoYZ4OVIW8mcgTZH37uL?=
 =?us-ascii?Q?Zs/12eul8N6YpZKjtyNwOAfRkenbxfzpsE28mywI+m9/mZBqhW6uCewrr+hz?=
 =?us-ascii?Q?ukCDJ+b91JTs+/Bx+BbxW2GepAjKEMI0+iBEJzkVtbMqmeJlH/lmWmtpKsOG?=
 =?us-ascii?Q?A3UAxEHCd3vzNfseDdM+QG30PHi0ir7OgjWjQ7xQLEmU+o1bFLR6FV9tUoFO?=
 =?us-ascii?Q?GbG0KfOgbE0zhUs8kePJJu9++20daxNPnKwYi1Dy/d09EKWymFbyT7WJFe2a?=
 =?us-ascii?Q?djYixyuRTTU8F/4tiLkIsLKygUYoM2bw6uvxLyI4iTwY2FaoS0hClpqKZaEV?=
 =?us-ascii?Q?en9pTJXSCLm2L57L3yNQBi+UGmLVtYdMlCS9dVZGCkRCMEGjBn90QL/eCo/E?=
 =?us-ascii?Q?MSQY62wb64PA58wKjng8yhjk1i4dV57BVngjb0Qpp6eZvA3Q4oelXqH1kTlm?=
 =?us-ascii?Q?gg2H6ap3EIrji6/GCFakaTy808VilputRV/6o+2LThl8pSHDmXw55NqP6U87?=
 =?us-ascii?Q?82E7wVZ9R6fQeIVhUrIDSLMYcy68GwDjo+BukI8fAwx6b/xvyQvGtJ19WCfs?=
 =?us-ascii?Q?phu/+tsexisnHk6DripGuvslJm9nF3d58lfSEuPJ2Is1V0HYetfTTkGQpqZ2?=
 =?us-ascii?Q?27lZ+m9xkdaClJnICOL6A4/EkGVj4b1On0b2L3R6baIFewbftjzr17HFFHgn?=
 =?us-ascii?Q?OVAfihsG1atFkwziWGh9XiS/0EkaQo0kCl/8FRJdnhoXFvG/BJJrMJz9yU33?=
 =?us-ascii?Q?EpAeoiYg8lN0TNoT4JfAGPFzIEu7YSnMh7eIV8C7Q7aNDygR1RQxKho6181K?=
 =?us-ascii?Q?vNvBfO31Ai63BFsEVYqcnn/PGKQHOkYxMXJ+Ek3qFMjtcr96lsO7hG1kkiw0?=
 =?us-ascii?Q?MG3eTNenySE4fP10KKtWy/aTY7Comn5fgbIaoaAhs5InezGSK35sqPY12lOT?=
 =?us-ascii?Q?k7+YPn4pLBw+1qNNayl9XwE8tZf8aZ7LxuSLK2XP?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a17cfb2-339d-4ecd-2e5f-08ddbffe21b8
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9244.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 22:07:16.7101
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R2eAqbuph5GkQoxue80vqtrVuayNIvtCjgABOnunFVfI1bc/sldn0Dum0giBL6+SNkbGZBBzjebjfZTaABgs9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS1PR04MB9582

The standard controls for exposure and gains allow a
single value, for a single capture. For sensors with HDR
capabilities or context switching, this is not enough, so
add new controls that allow multiple values, one for each
capture.

Signed-off-by: Mirela Rabulea <mirela.rabulea@nxp.com>
---
 .../media/v4l/ext-ctrls-image-source.rst             | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
index 71f23f131f97..6efdb58dacf5 100644
--- a/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
+++ b/Documentation/userspace-api/media/v4l/ext-ctrls-image-source.rst
@@ -92,3 +92,15 @@ Image Source Control IDs
     representing a gain of exactly 1.0. For example, if this default value
     is reported as being (say) 128, then a value of 192 would represent
     a gain of exactly 1.5.
+
+``V4L2_CID_EXPOSURE_MULTI (__u32 array)``
+    Same as V4L2_CID_EXPOSURE, but for multiple exposure sensors. Each
+    element of the array holds the exposure value for one capture.
+
+``V4L2_CID_AGAIN_MULTI (__u32 array)``
+    Same as V4L2_CID_ANALOGUE_GAIN, but for multiple exposure sensors. Each
+    element of the array holds the analog gain value for one capture.
+
+``V4L2_CID_DGAIN_MULTI (__u32 array)``
+    Same as V4L2_CID_DIGITAL_GAIN, but for multiple exposure sensors. Each
+    element of the array holds the digital gain value for one capture.
-- 
2.43.0


