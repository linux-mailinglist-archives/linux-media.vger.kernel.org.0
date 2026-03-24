Return-Path: <linux-media+bounces-56803-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cMRjA/UbwmlvZgQAu9opvQ
	(envelope-from <linux-media+bounces-56803-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:07:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF69302223
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 06:07:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 3A05C30E1057
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 05:04:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A0B62798EA;
	Tue, 24 Mar 2026 05:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b="AGbXbcPA"
X-Original-To: linux-media@vger.kernel.org
Received: from SLXP216CU001.outbound.protection.outlook.com (mail-koreacentralazon11021134.outbound.protection.outlook.com [40.107.42.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79E2285CA8;
	Tue, 24 Mar 2026 05:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.42.134
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774328660; cv=fail; b=ANgep4BBnUBRtM8cA71WXeBfTd/DdRPu6UWoldUTEe7Maq5MQWdijLhh/NCj0HEzP3kOApBU2nWa3vwWJP+VIwLvkBRPL6+hsJuXjraQDShuemE7xF72DRUWkeX4TykKKVQ2TQY/6lp881sW39aPgnd1w0aSo1u7H/b6lN1Ha1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774328660; c=relaxed/simple;
	bh=ZTI7lE+X19Hsf9fP54j1/dIyYHW/rtnHnQzdY9DwbCs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ShzYEkm4S7gNiYLMmdPRknJu4rSJJxD4YLppkZK7hvFmnprQ210v52x4EEtXH4spzbMVGrzfCrPXrY6BgEbSxQaLV+LRe16efWx+EqGWJk1rHqItn+GIxmJ6F1cEsIbUWJ4tVVno/0uWf0EeItOVDRwAujk820EhZOeSSbefae0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com; spf=fail smtp.mailfrom=chipsnmedia.com; dkim=pass (1024-bit key) header.d=chipsnmedia.com header.i=@chipsnmedia.com header.b=AGbXbcPA; arc=fail smtp.client-ip=40.107.42.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=chipsnmedia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=chipsnmedia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3BZqx/9wkq2z6Y4klkg4s0x1VLiN0ABEZvGB+cl9Ke3/HGfMcNnbtYQKKrlYEC/9V7Z/vd1gO8y/NvhPR9+Acq9x+57sODDNX4Us4WLdnkKC/KbrFJ1/TQDCCUSu7zT1F5twjZweDAworAYjp0Q9S93+iihcWS+hUcHf19tAskDSOc1gKUsMVRcieBdEBSpAkKJF3rK9qbIbIIeSX3zfCr8zTOZQUJkk8gBH9A6QdC0cW1TcdHEqSiap4cXemGqiKeD+nUs5OOcx9CevijYfa97ubF5EBQmUa1EDIXl0TmjaULvOrWgOSKfI8v3D6q7khvusmbwYwTRk+drJyoJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=20Ky5sTxtg2Mc7P7lPclVfQVgYjfPJQrHVR9x1tJ3kg=;
 b=YLNbvHnKmY15V7nFPEtI9smbxTPAPUEiE23VEd4GxyeCAb85WjAoxkBm84OFulSNzuHhw4JSbMLCcj3BJCa7D49kTzj6nylfVk0qiu/+nNZ+BJ7wF5KUM2JwNLzzMdXSQtk6guPuajf5EuNbgh7XL207SPXmO3zyBoydwftZJoPG2LZ7rK9osd1c6xHaRQCCfekDY9DeXc9Vmh7e226FxkWMU+pXzfKjiEaKp7spsBCr0+LB3dIcrQAuQEHjcsdg728Q1iBsdO1/rAChV8pqdOA3y7wAgIg8pJ/JbE0JTKRR+X1CV0y7LBDizg3vLJmIKkOKfhmVklia5zu4W35akA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=chipsnmedia.com; dmarc=pass action=none
 header.from=chipsnmedia.com; dkim=pass header.d=chipsnmedia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chipsnmedia.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=20Ky5sTxtg2Mc7P7lPclVfQVgYjfPJQrHVR9x1tJ3kg=;
 b=AGbXbcPA+NoVuU1WHBBq7kk37nBK1HJwpzMJ7wEc5XvalaWyiKAdGOSTicTL9Uc11F2dVmNQYZosApXsIRIpho2UCWx6Okr/R2t+bPCzqfr13RsMDi9D5fK4dBO+EHfmP+kxsOh3o+Iz40cnfX6MQhRD4SCJxXAP2i3Jas/XB8g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=chipsnmedia.com;
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM (2603:1096:101:f::14) by
 SE5P216MB3232.KORP216.PROD.OUTLOOK.COM (2603:1096:101:2fb::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9723.31; Tue, 24 Mar 2026 05:04:09 +0000
Received: from SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be]) by SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 ([fe80::8f6c:834c:6cef:7be%3]) with mapi id 15.20.9723.030; Tue, 24 Mar 2026
 05:04:09 +0000
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
	jackson.lee@chipsnmedia.com
Subject: [PATCH v1 3/4] media: chips-media: wave5: Support CBP profile
Date: Tue, 24 Mar 2026 14:03:59 +0900
Message-Id: <20260324050400.218-4-jackson.lee@chipsnmedia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
References: <20260324050400.218-1-jackson.lee@chipsnmedia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SEWP216CA0003.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b4::6) To SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:f::14)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SLXP216MB1148:EE_|SE5P216MB3232:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d3b1050-e4ce-40db-1623-08de8962c834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|52116014|38350700014|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	UKeQ7i2M4sPYA53lcdO7zQcGcNqIhl4R5LmH6MY1jl68Di7+FXiS7TKShqINYWZP3Jx0W9EQVG+3CEsgT5hp8AQpvu0ySZm4rTknFMb+2pM3+gKm09AUH+5cZ3qlHXi/anauGPqHAOP6Cufcw7JIFRIiW/BPzPjTS7SwjDG7QnKRxRxuhnbdcB9R05JTmjw8N2e01E5Wveia00EgSQX+wRLX1pQ8zsmM63KZThXwhLGBhvDPM5d5WhQ2cf0FfdTu+G1k7vyVapB9ZvxmzEKAG4THFA4bGPpqMoXz6KEAeVKm9C6vt1Rzx0PJRjL78yO/DERALt3YGpuL8Wh46rvox0nx94znGJmLnc9+WCbwPQnmkp+7BKQHjQtVZ2ZCEVL3uONgtu/7uuV6n8d7RrZ0Wl2wHazT9Z9xXX9JmVltzTXIItrrPJmy9PvwFTXe5WiDAHhQ7v/WPBlECUB6u4Bi7ZZrsWfAnQwvncbJMkquK2PMwwl/ebgyG9t84cd1Y+s/hyJP8bgWwCMjtEcb3ks/vpYz49N4nxTqAxVqeP+HxjjR7vva8+IP4Jp4x0ZkethapQbUoA+DNQy3vFB1Izryde3rLA6w9xm54sqMn9t5xE1lQfQONv8yzvpkAEiN9bHAcVteXmPY6hZPe6bpnxaGOerBapHuukoSl+k5YtYgsZ6aTvrj1EfKCFS3d1djCZQN0RbkQLlXK7d85oaMBK60n6kbjqPU1CZrCHT3gi1qf6nXAzkL48HtsMKIhtVwpP8IaJASV2ss2i4iv6qxmoJeZq0wRvJ/WgGKQm9yHVnYl48=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SLXP216MB1148.KORP216.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JPxqxVgA8obzxAmGUrp5b0qLuUUDdtHgNK5x2+JZ6XQ1es76e6v7ftlhj5L0?=
 =?us-ascii?Q?XKKyGqcYYUbvbGIutFmkmpDn/FpOiWODXwjzGVg0v7dB8Z5O/zBsfhgfL7mG?=
 =?us-ascii?Q?eYCr+kWiye4NnYUvvFpxtI7UL3FufkBRMBrStEUMFAY/UHlAbVSceeJ3RLfr?=
 =?us-ascii?Q?PDsm4DYP60eLqEC72v1o+qO5Y0X/fUgvkSeMJNZuROXpthA/WOTGkAtRutHG?=
 =?us-ascii?Q?nOAj3bl4txgkQe3/la8UCcACRZ8VS3QKH5vDlFt80j8mU9aMKtbfwIgN8EVy?=
 =?us-ascii?Q?kxrvN5WEzlj5Ja+yBsa1FN0i7kK/ZlqajfzT+BH+sNQfQfGe0F7gyVM9IihB?=
 =?us-ascii?Q?nWZy/sOZ4wxl4jedIMQtahrKuhc0z0NAWmJ0XD04uoysZtHQp7EcedGW7TyN?=
 =?us-ascii?Q?0fIegneKzfKnH396VtpiBCM7EpdobpvPRBdVmRkhfvcdG0qYEFWu6MGUmeXu?=
 =?us-ascii?Q?dU6x0UIMLBZdmmk7SBZh6HbMwvuehYDbYZ5gj+7xX5/Y9NelO3X49woufmV/?=
 =?us-ascii?Q?N3JGS805BVdaF8ENwKui3YwRnbkoY37Snt05yniO3qhIM32evRMmw3D4H99y?=
 =?us-ascii?Q?PIzrvI9SKGPZB2I749d1fKF2hpwVD+D19wrmrk5LHU06EGrLaYs4NqwoTZaa?=
 =?us-ascii?Q?rEi5hWrffsm/Mn2NLc739xoau0kb6MVSkkMLwTsT14ZYIu06Guxha8C6mzE+?=
 =?us-ascii?Q?ZrzF6dfXfLry9VmPWTtyN8FoqiGO0nAM0Dy7tOQDeIKfa+ezy79Vy7isOhjB?=
 =?us-ascii?Q?xrS2EI9bogChKpvlUNMI/asWMj4E2ZYqshqvyvjcFC3gPYWa81Cma1HksiZD?=
 =?us-ascii?Q?+XjT/8ASJuYjr2pV04HBs3cGpY2rehDv9eEZADNYSkJgoq/qGe8X8fGcQCAV?=
 =?us-ascii?Q?9S56R5D1w1Ht/BHj0CO9cOkfaej0kZOZO1MT175BylmPsgDIU4/q68lRhaji?=
 =?us-ascii?Q?BErSPjNU0pfRW3drJx2IgHnT/oAUWPf6QJD/eoYk0RcOPmsWIETdpF5uNwfi?=
 =?us-ascii?Q?2RKJQgtQ4Pw+OY6tkcOjkpPB3MOih7Ybp3h/32gjmRpjN1uP8qpAUbLjvtN0?=
 =?us-ascii?Q?QIisu9zjSh7K+32T+Omkk0x20pVAHIwJBX/Ogjyq7rzKG3xIxI6o0VDX+sio?=
 =?us-ascii?Q?hN1mSe+XWxkIjuXFqYvTUighInLNutO/xMpdpLkQ5Xw/hpB8zf9gzFk38cwd?=
 =?us-ascii?Q?UQ6QPURp3/TyNeCje3itndCXLDZwyb6eCelIk4sldyaLbUdnyhzbDDtSYPzR?=
 =?us-ascii?Q?Bbh1DreD9W0Dup35E74IP4nPvIEprNBzhZ2A72ABIl2cyQI5SijHvDmifBj4?=
 =?us-ascii?Q?E1LTkP4Hy9xKARWzFRTvf6pSSfF40qars1Cc0u5Y1Ey2xMoqfcpRS1yP1aGv?=
 =?us-ascii?Q?795xBSlWj0dL6dFn/Co01vqMD28hfKUDHWTh3nAmH7CJjuLfUPaRpnLlcvAi?=
 =?us-ascii?Q?itmWZmCVmGZhkWLGtO9fVTqznS/5suvlA+wMjOsX3jB8AfApQdE5HQmKyB+e?=
 =?us-ascii?Q?yvWXr7RjknKDhRKL751m/eFnF9Y4MuJz5CoHKpO2lgPhYVAPUl0mEu/Oz/jD?=
 =?us-ascii?Q?/tE03OGy+Xf5yyEMaoWDwvHD4KwgVbKuwFuVBd5cZ09zn2kf+33PHj7+DjYl?=
 =?us-ascii?Q?6oqrqnQRQCpjAMldZ1xvJixiPKHfLRiH5/TAsc9YrykC1aB6DtnVFdhHCZfx?=
 =?us-ascii?Q?C8TKCkSiCxpwwGcGT/Y6NAk5U4y8XqSPLoZR44vzJUQCiI6yoiq4x7bDcb5w?=
 =?us-ascii?Q?TPM8z/ftzMhsAmSaJ8LdzCVjpCCU1O8=3D?=
X-OriginatorOrg: chipsnmedia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d3b1050-e4ce-40db-1623-08de8962c834
X-MS-Exchange-CrossTenant-AuthSource: SLXP216MB1148.KORP216.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 05:04:09.3264
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4d70c8e9-142b-4389-b7f2-fa8a3c68c467
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MUcJbpveaeTIhr4sMIqYqJ14J276sibcluLz90rxijsUrR3Pm2QiM3bkfsETb5XkCaXj8TsneRViy5oyqdUjPELt3+JZANxsl0fjeqXE1fY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE5P216MB3232
X-Spamd-Result: default: False [1.84 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[chipsnmedia.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[jackson.lee@chipsnmedia.com,linux-media@vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-56803-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DMARC_NA(0.00)[chipsnmedia.com];
	FREEMAIL_CC(0.00)[vger.kernel.org,xs4all.nl,chipsnmedia.com,ti.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[chipsnmedia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[10];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[linux-media];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chipsnmedia.com:dkim,chipsnmedia.com:email,chipsnmedia.com:mid]
X-Rspamd-Queue-Id: 4FF69302223
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Jackson Lee <jackson.lee@chipsnmedia.com>

Constrained Baseline Profile (CBP) and Baseline Profile (BP) have been
treated as the same.
Introduce the ability to differentiate between the two.

Fixes: 9707a6254a8a ("media: chips-media: wave5: Add the v4l2 layer")
Signed-off-by: Jackson Lee <jackson.lee@chipsnmedia.com>
Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
---
 drivers/media/platform/chips-media/wave5/wave5-hw.c      | 3 +++
 drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c | 5 ++++-
 drivers/media/platform/chips-media/wave5/wave5-vpuapi.h  | 1 +
 3 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/wave5/wave5-hw.c b/drivers/media/platform/chips-media/wave5/wave5-hw.c
index c516d125f553..2392bce8d840 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-hw.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-hw.c
@@ -1763,6 +1763,9 @@ int wave5_vpu_enc_init_seq(struct vpu_instance *inst)
 			(p_param->skip_intra_trans << 25) |
 			(p_param->strong_intra_smooth_enable << 27) |
 			(p_param->en_still_picture << 30);
+	else if (inst->std == W_AVC_ENC)
+		reg_val |= (p_param->constraint_set1_flag << 29);
+
 	vpu_write_reg(inst->dev, W5_CMD_ENC_SEQ_SPS_PARAM, reg_val);
 
 	reg_val = (p_param->lossless_enable) |
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
index 6fe01217233f..775beeb10fd4 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpu-enc.c
@@ -939,6 +939,8 @@ static int wave5_vpu_enc_s_ctrl(struct v4l2_ctrl *ctrl)
 		case V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE:
 			inst->enc_param.profile = H264_PROFILE_BP;
 			inst->bit_depth = 8;
+			if (ctrl->val == V4L2_MPEG_VIDEO_H264_PROFILE_CONSTRAINED_BASELINE)
+				inst->enc_param.constraint_set1_flag = 1;
 			break;
 		case V4L2_MPEG_VIDEO_H264_PROFILE_MAIN:
 			inst->enc_param.profile = H264_PROFILE_MP;
@@ -1215,6 +1217,7 @@ static int wave5_set_enc_openparam(struct enc_open_param *open_param,
 			open_param->wave_param.intra_period = input.avc_idr_period;
 		}
 	} else {
+		open_param->wave_param.constraint_set1_flag = input.constraint_set1_flag;
 		open_param->wave_param.avc_idr_period = input.avc_idr_period;
 	}
 	open_param->wave_param.entropy_coding_mode = input.entropy_coding_mode;
@@ -1687,7 +1690,7 @@ static int wave5_vpu_open_enc(struct file *filp)
 			  -6, 6, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_8X8_TRANSFORM,
-			  0, 1, 1, 1);
+			  0, 1, 1, 0);
 	v4l2_ctrl_new_std(v4l2_ctrl_hdl, &wave5_vpu_enc_ctrl_ops,
 			  V4L2_CID_MPEG_VIDEO_H264_CONSTRAINED_INTRA_PREDICTION,
 			  0, 1, 1, 0);
diff --git a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
index dc31689e0d27..7b08fef58217 100644
--- a/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
+++ b/drivers/media/platform/chips-media/wave5/wave5-vpuapi.h
@@ -570,6 +570,7 @@ struct enc_wave_param {
 	u32 transform8x8_enable: 1; /* enable 8x8 intra prediction and 8x8 transform */
 	u32 mb_level_rc_enable: 1; /* enable MB-level rate control */
 	u32 forced_idr_header_enable: 1; /* enable header encoding before IDR frame */
+	u32 constraint_set1_flag: 1; /* enable CBP */
 	u32 bg_detection: 1; /* enable background detection */
 };
 
-- 
2.43.0


