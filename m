Return-Path: <linux-media+bounces-20547-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A6E49B59DC
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 03:22:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1ABE9284204
	for <lists+linux-media@lfdr.de>; Wed, 30 Oct 2024 02:22:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7505198850;
	Wed, 30 Oct 2024 02:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="FHxJ8Cgr"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11013054.outbound.protection.outlook.com [52.101.67.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2A7194AF4;
	Wed, 30 Oct 2024 02:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730254938; cv=fail; b=iumb5+bufrVknFNrwDQdxge9ehEeJ/PfnfOwDox2sUM5RoftLcfJ0j2EQR5OiQg7LBPLREvbu9IYGT4J0DHNKp6fU9N9/Kl70/eRbwjGpniyeR+VToZP40dAfB80S10KyCh7ncWCi1nJqJws4IfJhcMJG00mdDRqCmxlHFa8uFc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730254938; c=relaxed/simple;
	bh=3J7HQukrMTz6WCskrPZNpBJysph2+T+IN+yd5cJXGsc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cnihryUNxSWCJDgt9rLHgBLBlxru09fD6DflOysmAbMwXbX4OgdFlpAHWB8tro3iMmHfdGABkk1RnT59nguTaNAc0JUH02Aq/KiNkd3B6DmGrkpktTznUh1SpbGSn3r6UHyBnNlLnG4Tae0r+BIByKaD3lZWYgd1jZoOslOZ/I0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=FHxJ8Cgr; arc=fail smtp.client-ip=52.101.67.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JESyYHUFAYBkz8gc6XXkV1yCfHu3sP141bQ5n4bQ7k4PXSwDXl553mULT575D3Nsck7nKakatJesU33SwPdUR50DitpUnil4q29GswiEqq4uyXJ1yXOqt8ymbzaqbpglnJC0Ua2fCZ+vYiDkkXlQJVBii/tSkxIbGWS1QRQ1ZG9mPfCk7RwpvPpa6kcSTexXQSvOlC8F9/eXreNTSwc2Uqt72gSsWVGUVLXPZNQO2us2gP7abvXQwL/Rdz+Mi4rsNaUP3qU0qgHMYwFksTFmiEnfAYR2xQ+FZGfY9zrdDaY8PFW/QXfZBT/uJqoBxmYox405ok/SL9h9vqReaueLNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3co966d8lg7YhJGpW2PyDhINGAAkGT+8kwYcfIKNyhI=;
 b=rSKI0FCOR5+C87fvaDK1U9MZgU5OwnsgnjwFQxpi+CAv1LG1NBJmiFCZuKiAQTffHe4Uj4jO9hpyLFnQDTvGmLoS4+ReQCPzjyvkWIaO+UJGWvuZP2zMnArO4A+sWKJsXyvarFpEMysUX34CBqKPjFe2epQtXnhZVbqEs7angLYghzRixeJAki43zHApxzro36gMvIx0bLBOCTDyi47DFKNZhLaqnjBdhVN7O9qgV+iIQS9ZZjQ/0flPxSDXUUkG+gX4i5u7teTNodT5xaN8y+GsxJLrahB7YE0YErybuEaRg8lN3D/Gcdy7l0EvQZOL2rJD/OJI2gLdiZ21luPWCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3co966d8lg7YhJGpW2PyDhINGAAkGT+8kwYcfIKNyhI=;
 b=FHxJ8CgrGGjVDz+Tovixfd0ByDDxiTXcR3fbC+dVGhXGLlqYrykxwtY4hP7ODxY/OYFqh06JhjQl4CaRbCgiakqF6K1ZTtvx2qi2iywVtiHrVMdbs0+VE0H6e16k7mj6RFBAaxQc0O0BKiYaxzgmvQNPfopMjvo/qFxkfS+PvzBAUgFqicsDA9i+h8p8pktzpjSID9Lnhnnl8pg7aa/23t5yW97gM6spi84ccljVwGng22VOlyTyNcZ6UhS9pI7vuSnY0PCK6QhRbwG1MoVk6rY3I5Zlf+/MpgKKX/SF3ZgK3OxH70DpLtFAbz1EAhThZz0vR3UP6WlTv3PpjEB7tw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by AS8PR04MB8705.eurprd04.prod.outlook.com (2603:10a6:20b:428::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Wed, 30 Oct
 2024 02:22:12 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%3]) with mapi id 15.20.8093.027; Wed, 30 Oct 2024
 02:22:12 +0000
From: ming.qian@oss.nxp.com
To: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl
Cc: yunkec@google.com,
	nicolas@ndufresne.ca,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	xiahong.bao@nxp.com,
	ming.zhou@nxp.com,
	eagle.zhou@nxp.com,
	tao.jiang_2@nxp.com,
	ming.qian@nxp.com,
	imx@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC v4 1/4] media: v4l2_ctrl: Add V4L2_CTRL_TYPE_RECT
Date: Wed, 30 Oct 2024 11:21:31 +0900
Message-ID: <20241030022134.1098589-2-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.43.0-rc1
In-Reply-To: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
References: <20241030022134.1098589-1-ming.qian@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0044.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::6) To PAXPR04MB8254.eurprd04.prod.outlook.com
 (2603:10a6:102:1cd::24)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8254:EE_|AS8PR04MB8705:EE_
X-MS-Office365-Filtering-Correlation-Id: 57d3479e-5b05-4e7d-54cb-08dcf889a99d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?rPBRfGzRV47S+ZncHkF0sj8ztewRk6DClfSpXaAV+tiN4KsjGbSGArqbtuzK?=
 =?us-ascii?Q?bWXfPpYx5FLHsPquOtmHA9N8plckEnZx9b+kQGP+AGy+chUCx7jFKRjmEk4c?=
 =?us-ascii?Q?q9erfICtK9yU0iw1eNRUfIRglj1FVLTkzbw53UWtPfDl/aKHIo0NuhXRlqBG?=
 =?us-ascii?Q?5SgTT42YhZIL6M26y6TDBT3Bg9gHbrZ1p2a7HXJOfP+TUHwj72dCQvS9fguI?=
 =?us-ascii?Q?wirAAxtbJ5tvhWzq9pSP3riCmUSs0754NvMh34CAmVpN/ujYNcdihJKncCev?=
 =?us-ascii?Q?0dEX2pNPs9zhnMLk/RQFHE1CbBtZuLPrk5WAEif373O7cidl04vG85odrR6s?=
 =?us-ascii?Q?TGo5QnZvMQM2w/5vE6HjKBUlcKIVcvGcF3fKwDuOpOYwDqY3Xmdc3sk3nXAE?=
 =?us-ascii?Q?6YojRpwkuUUJ9iY5eH2EdTA4g3F4Z9/1iQq6sG7TYBSLhjZfKE7v7/ww8d5e?=
 =?us-ascii?Q?AkykXzVKVxTTRPUfw1Z418kreGouvB8MWa3s0HX3sr3gCN6pU3Rm6y/xUhqX?=
 =?us-ascii?Q?ddVtp4Dqy598KlaT4AmGt3IOe+3SncCxuFKWnMuLkTMChLF68z3WH3h+WJDq?=
 =?us-ascii?Q?qIPMk9tiYj02YU6z1H2qCw4wp7KZg94j2GgUHKu7/ReZi92cgpUdU2ky2nNB?=
 =?us-ascii?Q?h/IaZi4WTr3JXaH0RU5AIVJMxCyYnFgkN+wMVnxmGQ8Xm+KgOqC3xtoSjvQp?=
 =?us-ascii?Q?+79RM3mi64NfcTPIIoOzW9fPKUknUibOnLqZcGhan6yAfg00ky2O6fq5bWfH?=
 =?us-ascii?Q?22VFLxLKE/BQY95TH9a3r4yUKyPFFDokuStQ4wpQo1CRuXltEEpBwkDgw7gS?=
 =?us-ascii?Q?PufB2Z45PQREb3ELFc0C/zqp2mFlbn8NfjvaRbfGgzlHVRS8E+3ZUpf7mp5I?=
 =?us-ascii?Q?7UBS1Dmi0Vr33cnZ0sKOzc9o4nxZCzrOtn3LdtxiksbZdLJI9AD7yQ9k/eMD?=
 =?us-ascii?Q?Bp0RR0yiF82evRG5UNLsDscx333XQGk6nGRM/NRZR0qus99UuP6tS2r5RszN?=
 =?us-ascii?Q?0hNcS65B1pM6vbI1Cm3ugafo2387/VCgdS8cxgqv0doiQEr4+aVgCyssY660?=
 =?us-ascii?Q?BDpW+vmYS/vIr+kIzso4UioPwbw0Fvznyxubh944hf0gwn6ZUR/HVcajVKbP?=
 =?us-ascii?Q?MJ3gNezNTW1L8a8EIdg4VOhn1I3FpmZL6Y44Iqi2zkvAdCj2Pl8ByGSHaD6W?=
 =?us-ascii?Q?xa8ADNBaVzBr4/CAXtXAppNQd7yEVPpmnxLXYwofz9HEp/ovK1+zrZQO2/Wl?=
 =?us-ascii?Q?MMQ0nFSSB/yiOileSrIlNo7S8Te4r/EtGENtcn19vIXxI/VHPAPpA6ZHhO+w?=
 =?us-ascii?Q?jJwrAZbHkeQinvmmfDGVuRnAg+rN/yew2kgUMj8QvUZtP1unuWbsCo7wd0s3?=
 =?us-ascii?Q?YUgTAR4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ht8oHghF8bpiNic38NtZZD1AGfBW16SvTFeyaCOcgn3ubrBG3IS5RcmBw5cP?=
 =?us-ascii?Q?ltwrKF+XiFcLX5IpqVf5Gxxsw6VB+bb3ERtAaBEKCj7Ese4iNG+Om0CmNdUy?=
 =?us-ascii?Q?Flu7k+ZvqSFsgKl6w6Uj3wQdVxELC4wDhv3MY6U8TUgTcZbjXEWJLTWCzLM0?=
 =?us-ascii?Q?TGSK6p8vt9iIuvde/tPLmHVpgCz80zMXydzeaNCzeP3w8WGssomONBryIIcl?=
 =?us-ascii?Q?w5ch7XZN4+OJOH8qfCrO0l0chqAoNmqU5bwzQAj3tus9/8ZXkKc2Az+UAbLM?=
 =?us-ascii?Q?hWPzxsp6/L6QWiSE7xpgEXo1PiUqIxjJhYDgeaL37eLjM5PYy37kiO3jba3X?=
 =?us-ascii?Q?PeW53Gty26OtHtrytFQY1zGqgzprCzhOa+5zfFNDiFsyPQ5cHWn462//S+EP?=
 =?us-ascii?Q?FOKH2b9jEWAsGRVx+ny65/vNt3u6tA0d1Gcfz9BneoS9IFKJopCqQDZ+xxNm?=
 =?us-ascii?Q?uRWbK70D5GwDaWrxkWXZTARFhbwBR72C3q5wo1B7VVuYAIsGUbMAqxRQzjZL?=
 =?us-ascii?Q?D0lNe8bXeKqmsnlDDeMF+GyW6YuFf1QznOCxoxv6uxVCZlsY+YJmPkvie+/K?=
 =?us-ascii?Q?hP3rdFpgVyB5jc/GlOqePSXPc2fjt59EZRpgYNNmcHI4BGU726a0/oMQSzA2?=
 =?us-ascii?Q?gyLe5fJBTDDJYeD+AH+ZMDsw7B6YeiqVrItHgzU2L8sioQ3mebwZ3qzkn7zb?=
 =?us-ascii?Q?dJ9JfCEw1URvmYP+oP0Ylu82ZqcHdmUaA0ph9If0XuFZW5ZOFumNczgeemTD?=
 =?us-ascii?Q?M+zlsDVhCv2EcmZHvhcBDwvQxoZDe6Q2Tx/XOBn2thpnPXTdAYsOvPDXBldA?=
 =?us-ascii?Q?gIri37wZBQ9aRBYJ1N7ByPlODPZI0JJXOP99zXrKTO+JFZWOwfUuAF8VN/ZS?=
 =?us-ascii?Q?aWSgUU8CsBON+axo8/U3pi9VriKMAPeNGhkiNzdXe5bF9B4V1MlqrHAnvy5u?=
 =?us-ascii?Q?CoRWRFx1chXhRGpr5tdTTm0aSFGxE2Ld9TQuVLWXgAyRQHOvOl6U9W/oV3ic?=
 =?us-ascii?Q?JwkVDu2ydaqU+UtDFFFIk0YG+vHaiLCOgATISRLq+1aTJ14iuPBSU0A+o2NI?=
 =?us-ascii?Q?Y2nct++b6QDDb1iNrG5J8xRU6UNRj8dqXn9oKqseXgSeoqK4wnRR0eKdnn1+?=
 =?us-ascii?Q?RfHkJ0AM+kZ12B4bLtfttIXj4N4WbObjqdNIl8A3b9bdY4Sks0AnOgLWCfWR?=
 =?us-ascii?Q?WPalVHtoJZF3V7A3hr2RRvtF0ntsY/l6sY4mccq3uUCBNu6X8q+oJgq231H2?=
 =?us-ascii?Q?98j3taLMZRrNikG1z6cAuLUdLIWyXuiVEGfOzruMMsIf4QZWAd6a5MDBxIal?=
 =?us-ascii?Q?g0IdaeUwhO1vxJ5DakLrOM1On9xc75JiSDmZrBib0adbmCLYMVXisBpgUy2j?=
 =?us-ascii?Q?JU08eUo1+ts9OUolzVFJ+1FHMi1dq9WEgI1uvnXruXyno5LUY9gAuGDjc9io?=
 =?us-ascii?Q?KMdD9mDM+3hhhCsAmHyOIIb8Bg2OpWg+LICm3hW6FSOLD+kHVcotN3KkY9h+?=
 =?us-ascii?Q?AqUE/HY19api467zPqSsahud6Yh1rmWhkiGU1KqdkVjEJeCLuOl2DNdbCTpp?=
 =?us-ascii?Q?92Cl8IilJSJ+/F4E6PFynERPq42nKdYzKOtAuzpX?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57d3479e-5b05-4e7d-54cb-08dcf889a99d
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2024 02:22:12.1662
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4j8kY2QVM0yTFLRF8jffYfTu1bUUjiBHGmxra5e42TJIXVc5+KM3TGWLr/5qwU9EaBJCb69yS0xU4bDCiwBxtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8705

From: Yunke Cao <yunkec@google.com>

Add p_rect to struct v4l2_ext_control with basic support in
v4l2-ctrls.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Ricardo Ribalda <ribalda@chromium.org>
Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Reviewed-by: Daniel Scally <dan.scally@ideasonboard.com>
Signed-off-by: Yunke Cao <yunkec@google.com>
Reviewed-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
---
 .../media/v4l/vidioc-g-ext-ctrls.rst             |  4 ++++
 .../userspace-api/media/v4l/vidioc-queryctrl.rst |  7 +++++++
 .../media/videodev2.h.rst.exceptions             |  1 +
 drivers/media/v4l2-core/v4l2-ctrls-core.c        | 16 +++++++++++++++-
 include/media/v4l2-ctrls.h                       |  2 ++
 include/uapi/linux/videodev2.h                   |  2 ++
 6 files changed, 31 insertions(+), 1 deletion(-)

diff --git a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
index 4d56c0528ad7..b74a74ac06fc 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-g-ext-ctrls.rst
@@ -199,6 +199,10 @@ still cause this situation.
       - ``p_area``
       - A pointer to a struct :c:type:`v4l2_area`. Valid if this control is
         of type ``V4L2_CTRL_TYPE_AREA``.
+    * - struct :c:type:`v4l2_rect` *
+      - ``p_rect``
+      - A pointer to a struct :c:type:`v4l2_rect`. Valid if this control is
+        of type ``V4L2_CTRL_TYPE_RECT``.
     * - struct :c:type:`v4l2_ctrl_h264_sps` *
       - ``p_h264_sps``
       - A pointer to a struct :c:type:`v4l2_ctrl_h264_sps`. Valid if this control is
diff --git a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
index 4d38acafe8e1..56d5c8b0b88b 100644
--- a/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
+++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
@@ -441,6 +441,13 @@ See also the examples in :ref:`control`.
       - n/a
       - A struct :c:type:`v4l2_area`, containing the width and the height
         of a rectangular area. Units depend on the use case.
+    * - ``V4L2_CTRL_TYPE_RECT``
+      - n/a
+      - n/a
+      - n/a
+      - A struct :c:type:`v4l2_rect`, containing a rectangle described by
+	the position of its top-left corner, the width and the height. Units
+	depend on the use case.
     * - ``V4L2_CTRL_TYPE_H264_SPS``
       - n/a
       - n/a
diff --git a/Documentation/userspace-api/media/videodev2.h.rst.exceptions b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
index 429b5cdf05c3..3cf1380b52b0 100644
--- a/Documentation/userspace-api/media/videodev2.h.rst.exceptions
+++ b/Documentation/userspace-api/media/videodev2.h.rst.exceptions
@@ -150,6 +150,7 @@ replace symbol V4L2_CTRL_TYPE_HEVC_SPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_PPS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_AREA :c:type:`v4l2_ctrl_type`
+replace symbol V4L2_CTRL_TYPE_RECT :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_FWHT_PARAMS :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP8_FRAME :c:type:`v4l2_ctrl_type`
 replace symbol V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR :c:type:`v4l2_ctrl_type`
diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4l2-core/v4l2-ctrls-core.c
index eeab6a5eb7ba..4c8744c8cd96 100644
--- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
+++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
@@ -370,7 +370,11 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *ctrl)
 	case V4L2_CTRL_TYPE_AV1_FILM_GRAIN:
 		pr_cont("AV1_FILM_GRAIN");
 		break;
-
+	case V4L2_CTRL_TYPE_RECT:
+		pr_cont("%ux%u@%dx%d",
+			ptr.p_rect->width, ptr.p_rect->height,
+			ptr.p_rect->left, ptr.p_rect->top);
+		break;
 	default:
 		pr_cont("unknown type %d", ctrl->type);
 		break;
@@ -815,6 +819,7 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 	struct v4l2_ctrl_hdr10_mastering_display *p_hdr10_mastering;
 	struct v4l2_ctrl_hevc_decode_params *p_hevc_decode_params;
 	struct v4l2_area *area;
+	struct v4l2_rect *rect;
 	void *p = ptr.p + idx * ctrl->elem_size;
 	unsigned int i;
 
@@ -1172,6 +1177,12 @@ static int std_validate_compound(const struct v4l2_ctrl *ctrl, u32 idx,
 			return -EINVAL;
 		break;
 
+	case V4L2_CTRL_TYPE_RECT:
+		rect = p;
+		if (!rect->width || !rect->height)
+			return -EINVAL;
+		break;
+
 	default:
 		return -EINVAL;
 	}
@@ -1872,6 +1883,9 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2_ctrl_handler *hdl,
 	case V4L2_CTRL_TYPE_AREA:
 		elem_size = sizeof(struct v4l2_area);
 		break;
+	case V4L2_CTRL_TYPE_RECT:
+		elem_size = sizeof(struct v4l2_rect);
+		break;
 	default:
 		if (type < V4L2_CTRL_COMPOUND_TYPES)
 			elem_size = sizeof(s32);
diff --git a/include/media/v4l2-ctrls.h b/include/media/v4l2-ctrls.h
index 59679a42b3e7..b0db167a3ac4 100644
--- a/include/media/v4l2-ctrls.h
+++ b/include/media/v4l2-ctrls.h
@@ -56,6 +56,7 @@ struct video_device;
  * @p_av1_tile_group_entry:	Pointer to an AV1 tile group entry structure.
  * @p_av1_frame:		Pointer to an AV1 frame structure.
  * @p_av1_film_grain:		Pointer to an AV1 film grain structure.
+ * @p_rect:			Pointer to a rectangle.
  * @p:				Pointer to a compound value.
  * @p_const:			Pointer to a constant compound value.
  */
@@ -89,6 +90,7 @@ union v4l2_ctrl_ptr {
 	struct v4l2_ctrl_av1_tile_group_entry *p_av1_tile_group_entry;
 	struct v4l2_ctrl_av1_frame *p_av1_frame;
 	struct v4l2_ctrl_av1_film_grain *p_av1_film_grain;
+	struct v4l2_rect *p_rect;
 	void *p;
 	const void *p_const;
 };
diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev2.h
index e7c4dce39007..c1c2ae150d30 100644
--- a/include/uapi/linux/videodev2.h
+++ b/include/uapi/linux/videodev2.h
@@ -1859,6 +1859,7 @@ struct v4l2_ext_control {
 		__s32 __user *p_s32;
 		__s64 __user *p_s64;
 		struct v4l2_area __user *p_area;
+		struct v4l2_rect __user *p_rect;
 		struct v4l2_ctrl_h264_sps __user *p_h264_sps;
 		struct v4l2_ctrl_h264_pps __user *p_h264_pps;
 		struct v4l2_ctrl_h264_scaling_matrix __user *p_h264_scaling_matrix;
@@ -1929,6 +1930,7 @@ enum v4l2_ctrl_type {
 	V4L2_CTRL_TYPE_U16	     = 0x0101,
 	V4L2_CTRL_TYPE_U32	     = 0x0102,
 	V4L2_CTRL_TYPE_AREA          = 0x0106,
+	V4L2_CTRL_TYPE_RECT	     = 0x0107,
 
 	V4L2_CTRL_TYPE_HDR10_CLL_INFO		= 0x0110,
 	V4L2_CTRL_TYPE_HDR10_MASTERING_DISPLAY	= 0x0111,
-- 
2.43.0-rc1


