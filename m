Return-Path: <linux-media+bounces-28947-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A65CA74F6B
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 18:34:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0E01B18948BC
	for <lists+linux-media@lfdr.de>; Fri, 28 Mar 2025 17:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1CA11E8356;
	Fri, 28 Mar 2025 17:32:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ikKIbPF/"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011016.outbound.protection.outlook.com [52.101.125.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61BBC1DE899;
	Fri, 28 Mar 2025 17:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743183164; cv=fail; b=AgJLszxYA7obT7VQCRP0Njb3fF0Hf2U0sCJ9J62VMpeKyaF+gLwQxnqXqusDf20EdU5juMDSifhapvfPHdsmdLOhR2hvZwYoB6Z5UMyc2FdKd2qeOhey5NoImwhJ1ufD78BKtt4euWZ7gUwGh7V+TO6PDKMSToEhqHyqp3XuMz0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743183164; c=relaxed/simple;
	bh=b/qqiWfU2TOmFQJOhjJavmi9pjSIBAMTfFqVvQlDQWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q9FuFBNYtXzGP5S5xgrZ3djTYnYzKWXC/abpM1VKYu/+IWBSkyjckYwly7JLXgK+JoynNIqSKmwcddVqm5/3MM23BpgoLYnACOdm6BFAjkI6PwH4cPZn+vGPNRJQ1vV9pnWq44ffd17YZ9S12oXf7MwSDMGc84BPD53UaLCCFUk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ikKIbPF/; arc=fail smtp.client-ip=52.101.125.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S1GGpapuLNqtuSHAVzyC4nABodFfuR+2rBdWkOOfqSrfPIJ2Rm82cHbAJb/codghaXlLFwhJNAj31WPMPiRdJRVQzmrZBIx7uxVCV13pGr3wrOFPqEV79mla2VAFKiVCUtHqPd+36Kkr/IVIJgPjHoiil/ku4mb3FHzeAf8GU9aUdX+q19cC3CCxOE/KWMqetZ4sBbfG4KzSDDtg1S+ORceoDXLbiM/eu5SktHRAG8bJHkYOeaATaDO4QxzVT4yiIHYr81r+3+5TzrVjH5TRDWODvfphT+GOmzcST9C0Qa++1EFwh0mQgxmmIDyi1lipGeR7QB6V2qGsDfjStWSE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5YA7ou01kxcGIPUJB0uSwCOp90hJ1Zsik2vF+w9z5w=;
 b=gGoAm2BkI7eJNp0jvuRUkbyrdvKV5ZTFut5ZDbIzDnsCxdODEjvtQ/aTtHtLvqafGhMU2CrX7DxlFfA0FR7InNkSaBC6i+G2Fx2Ll5W5XDrxqV1n9AYfyK2cJCaGhe8nd24PNh0U2u3R4I+DpN9216d/aFBYM72dZDlaG2x/fMa2iLLiTdJDgM/D4LWPabA3bxSadlFZe2Hr1seKlvmERZekRTTe1erxW3HhA2VkCZabGC3MHqKHEVKYq+RV5ZEolClANQmndm62O35KXzkWBSHpdJjo7ou1kdqxHsImPio0ngi4GAxaQnDZpUJnsw8s2WFokeSAlHB1QdpNSSOLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5YA7ou01kxcGIPUJB0uSwCOp90hJ1Zsik2vF+w9z5w=;
 b=ikKIbPF/EEvt3AHp6mxv+JsYHDz+YRL2nTNbWuJtD3MFs5O8MADnCZmpDZSIRbLPk0Cm1Ln37FnlHNRoBJ9pAff/6LltKafNW2xYGtZOZssWvaMi2koS+yluadOt4EOKYADvRr/4oGVnW8d9lFayABisKl7381SqDdnNzO9IAMs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB9720.jpnprd01.prod.outlook.com (2603:1096:604:1f1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.42; Fri, 28 Mar
 2025 17:32:40 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8534.043; Fri, 28 Mar 2025
 17:32:40 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/17] media: rzg2l-cru: Pass resolution limits via OF data
Date: Fri, 28 Mar 2025 18:29:48 +0100
Message-ID: <20250328173032.423322-13-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250328173032.423322-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0057.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:49::14) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB9720:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b7860d8-d84e-4ff9-c72a-08dd6e1e8a1d
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?cg7NgfA020YSvJPtDE8S9xA8eJEONy00zoiEFts0fKnXTuHtUf0L5ErBYleb?=
 =?us-ascii?Q?PnBdA33InuYoBdr0k5MDB9lF5+lxFumM44+4hKewgxlYBYwLshtIBLz6IMRF?=
 =?us-ascii?Q?7wivEa+kVNA/02XNGmoaH13i8jM8E8ZrduApF/iRZq3QzRcfwqNs1kUbc5W8?=
 =?us-ascii?Q?AcIUlIH/ffxeVAomxQnXIpbm1T9t59ObMFPx/+6TTcuUCa9UkE8BbCZSu127?=
 =?us-ascii?Q?FyiXWVO3kwrGVp+aL2sz8/JvVDBGsy8pnSjLNP2JTPvKdPMUc7DmLWMrGqyQ?=
 =?us-ascii?Q?rFo4ZoQv8Nlhn/pm+NyOG7uI4gGKqpZyDBvmHBUevqbLkOY3OeBgm0f6NHrC?=
 =?us-ascii?Q?ntlAcOf5vkBIL8Ln14DncQvrRaNn5povPgoK9xOwBLPhEA6kMpg8IUnFS+Zj?=
 =?us-ascii?Q?ZNc9hOHyKx0i9iYCX/WAUCArpRzfOb7NeOYjBUQ82T0xO00d4MoFFVScdXn4?=
 =?us-ascii?Q?7SGE/j6SV0u7FcgM+whpIW/1xQoovPEmQuHWNZjzvGIxIxH87gJ5A2v+LPiE?=
 =?us-ascii?Q?6YjkABx3xKPjCO66b0nTN0q/s0nbFGSZjhTebnAkbyNXkuOaUPq5KckYslSo?=
 =?us-ascii?Q?M92YO3W2+2cMK8/0tms7L1Y8Eri03pHnm4BsHgRSkyhjdm0hndEi2eytvYNv?=
 =?us-ascii?Q?eth2BHJoZLIXEYlj4XurIMvq0K6SuFJMJZQWH+ipKi6HZVp3lfZob7bt3j3s?=
 =?us-ascii?Q?LM6VOyJ6SWObAQUjGVF35DFY6bFRhsCtV4J6oiegE0zh/+PaxKc713vxQosk?=
 =?us-ascii?Q?XXdADYh1L88iWOQW0dD9uKF73LzFyIvi5FbSedZss46poDgU9MlamF8ET/o5?=
 =?us-ascii?Q?2ngwA+TrWASc2wxZbdmWnBAeFP5PwdsGfsuuSGS2loemNJTrgwyjOvVeXZ4V?=
 =?us-ascii?Q?nsqNg4WhLl+urvgTiHOCe/v7hhaLiwbXMbO/DpmtIlgA2WjMllpgUnIBJLNv?=
 =?us-ascii?Q?zfVLqc0y8bwjERZtW7e/pVxRZ6hd8Axs9B9ZsxY01rAX+85GXx0hFlpx/zrK?=
 =?us-ascii?Q?8PoBfACa8DzGoKhxlcyHHujbfnecfiE3v3E4j0PzO49ea9lA4YCKTHukLeFk?=
 =?us-ascii?Q?ewSK7niGWDapXMssYsuepQrA24Ifs3UgZf4lZ1GPuNiWYxXCduNfKt9JpGAo?=
 =?us-ascii?Q?6h3c7U531xSBKt7G38yeDjJb/OAzIl5WnA1+UFTgKzFqdKWYFge8YvMPAYdY?=
 =?us-ascii?Q?WRQ+rVfToief45Ap1UV4TzDSOv1vbbeI3m7UDgv7YGulmBZBbcDFb8bi4jWd?=
 =?us-ascii?Q?GW/XcQ4KcSrgzYkGJL5Ywk6rsNmA+yspgUUWI4NcT+H+wkhTF5c25bb7rxi0?=
 =?us-ascii?Q?LWp+Y55oeC4AZmBcrWO+5TLKBVVFwMnxlUmteS6+iXoZlpHxgi0L4qAFy3kn?=
 =?us-ascii?Q?6ThsLxP7ErK09PP1qb9vXA0+ecxba0BLIQTjzsmCnRR0JF9pEKtTuDa4anif?=
 =?us-ascii?Q?at/UIa7hLepDwApBpXHWnWx3dNejdm9IIypfsz7F5aVJxS+lEFYHNw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qfJGOUvdfZ1eh7HFk4WPazcrpkJbfSYGw3KgyyTaOYAFCjK2JKikVucfRlzB?=
 =?us-ascii?Q?qmcLFQ75j6Ko8sRrPX22doGx9FSr1wTfAEn+OPo6ny7KvthMudgkqJfortJO?=
 =?us-ascii?Q?qh70ILG5ZWmx7lM0UBed78WO1kd0Ko0fmVVEdWuvHjNUB4PanNIMyKWXyOOI?=
 =?us-ascii?Q?s2WeMsB8PjJfHxp/ZQjQ35WDGZOlyR0Ubtd3svROv7zo+9TsiXBibzj5rPjp?=
 =?us-ascii?Q?PlcMNfEfYRx0lcnmzy+EpLPHJ4BmFxAXOS8H7Mb+r+kBbrw74BzQ5PkDDpGC?=
 =?us-ascii?Q?iko3OZDUsxWuPgS/a3Md5m0XEGCvr8EOVv0XuBYxbe0sEGmFS9/+2t3dELCi?=
 =?us-ascii?Q?L7PIpBIJpmhbH7cMe2Xz8kNW82jILlPoQ/8u8R33SRFH0zdeYse8ke1fBtt0?=
 =?us-ascii?Q?Y9dztEI0NR3p3ZnahNGK6cIQKLhWADzNoJA0p5mNyCq9MLLDxA0z6m4wCdfL?=
 =?us-ascii?Q?DHRr1PYJ1rClOJVs73zDx9CkF3fUSvzWU+u89mh+cjdj7u07ZYj+Rk5LQhBU?=
 =?us-ascii?Q?yD3Cse5sdvowvdacNenZCRRLQEx5ty6wMVqrgu4Tjk1NfhZsEEUKyKqvjiao?=
 =?us-ascii?Q?ejzbhYtZAWo3VrNwTq69CzWCqPcuZxPLGmzpoP6rpuTepGRNqTNpZh4UW+Mq?=
 =?us-ascii?Q?N7vbjNd9ViNmmgzi8SHM3zSpQ6TgEcAjeNWV+g0uGdkjTeZurAD9mfgEztYu?=
 =?us-ascii?Q?HMg0qjDDw3ZEz83fhxmiavXH/+GI4bBMaDKA8zEHMEDyxVUW+qzld4ZhUrPN?=
 =?us-ascii?Q?83q+O+5ipFQ2lrCT8a/ok54f8xBITcdtezd2rxk2VHQLAgPr0b0veVkZH0Xh?=
 =?us-ascii?Q?/i+bXm2RaXh0ztKAkNuc29dOk8MyoLDQzwJy8cy1oshLTMqLKUD+u9fyqfvu?=
 =?us-ascii?Q?gzbBH3GIDk20PmxdaenISzGZ2AE0KxIFGZo4exQ0JisG9jUSDLdh0hu3J0Cr?=
 =?us-ascii?Q?OcFbMfp390RQKQ0SD2/NErWmrCoMGNPvwyUw7oMNn+rXlTR99mdz/LDcfHma?=
 =?us-ascii?Q?J8i2YvKkjIlAs8qz6rI9CFhkcDfCsosSfzZu0rnyAJP3Mp27vUl2CLfyu9JF?=
 =?us-ascii?Q?F9iGnmuKgWx0jxi7cctRW1VZLAWk0QCDOgN/dYQ8moVTrpN7Pvh7oZM3h0xg?=
 =?us-ascii?Q?wYkHkUw7BUmkRae303UxfxL9MhPGrPIstnKcvHZTYZ3qd0RgDXdKDJeLWhnZ?=
 =?us-ascii?Q?kuKPKNaNg8rCwi41ieZJ9YxvPTUE89aqU1ePVwprewmjTZHRtcVKKnwatW9f?=
 =?us-ascii?Q?dXek6XrOi4QxR25R4Gn4Uvg9yzb+i/kSOlokiHiYvMDmWG6FJ/Moq/5Hdtgb?=
 =?us-ascii?Q?iEnUeJwkB+6p2yvsERNto8UXxd+vmWVBHUyLTn/XUxq5GRY8ssjSOvvvOOx/?=
 =?us-ascii?Q?5krczJhBGkhYN/W/89mthrAL94QtCnnGKBiYYlAe866t3qpZAxAPbcb/yQlI?=
 =?us-ascii?Q?mIEtUTBOqkL0JePoC+AGjDJZUzZ4OGwzdm09zStk7CFWWAzTHWMYnfjKbuO6?=
 =?us-ascii?Q?8D3BGkHfXAYg2Tx/JTjXV/pYiO2psy654vezYJU+evAtIgdhwOrKkpPAy6J1?=
 =?us-ascii?Q?KDX+hBuHFliCjuJBtqr4LdVcs/4ArEBlCJNNSH+hKIx8SC7SxJqMrtjfz1+h?=
 =?us-ascii?Q?RqAZXtT3JPzlv9Kqiscc3og=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b7860d8-d84e-4ff9-c72a-08dd6e1e8a1d
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2025 17:32:40.4933
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4Soyoide21WNy9DrLSGDsY4vimWs/vQ9AkS1y6rBbWf64KNT827THyZIxMh79X1yxAIH8N85NUOFXaUpCJB3JQrg2rWm6Fe7cKeAYbcbRLyVVP+zKiz48Qlck0Oz5cN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB9720

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass `max_width` and `max_height` as part of the OF data to facilitate the
addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
This change prepares the driver for easier integration of these SoCs by
defining the resolution limits in the `rzg2l_cru_info` structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag.

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index abc2a979833aa..19f93b7fe6fb9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -355,6 +355,8 @@ static const u16 rzg2l_cru_regs[] = {
 };
 
 static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.max_width = 2800,
+	.max_height = 4095,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 00c3f7458e20a..6a621073948aa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -27,9 +27,7 @@
 #define RZG2L_CRU_CSI2_VCHANNEL		4
 
 #define RZG2L_CRU_MIN_INPUT_WIDTH	320
-#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
-#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
@@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
 };
 
 struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 76a2b451f1daf..7836c7cd53dc3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
+				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
+				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
 
 	fmt->format = *sink_format;
 
@@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
 	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
-	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
-	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
+	fse->max_width = info->max_width;
+	fse->max_height = info->max_height;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c82db80c33552..395c4d3d0f0fa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -736,6 +736,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
@@ -758,8 +759,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	}
 
 	/* Limit to CRU capabilities */
-	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
-			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
+	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
+			      &pix->height, 240, info->max_height, 2, 0);
 
 	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
-- 
2.43.0


