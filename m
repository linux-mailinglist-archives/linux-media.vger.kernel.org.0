Return-Path: <linux-media+bounces-32369-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FE1AB4E4A
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:38:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9723F1B40891
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 08:38:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77BD820E6ED;
	Tue, 13 May 2025 08:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="MpDYVd3A"
X-Original-To: linux-media@vger.kernel.org
Received: from PA5P264CU001.outbound.protection.outlook.com (mail-francecentralazon11020088.outbound.protection.outlook.com [52.101.167.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030B01E9B14;
	Tue, 13 May 2025 08:37:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.167.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125471; cv=fail; b=Z9wxHCFR6rLFEqNegqmeqRfUSKUFdhRWaEFDiRXvcq2lw21/2HpJlJlJEv6EmdiG7StaSqIILsgKutAe+rp3lbDfIZbPFYJ2VZF2nibEVGM+tOND7Bks3RJ+5hMRwdeM9uyMXQbrwafAd2GaI/bmILuHQClQDlTDV2Aud2yQ95c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125471; c=relaxed/simple;
	bh=UM3lN1bOo4EWavrguOCzNa8IwjQNCxdcNP2RV90cxoE=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=J3Qh5w1r08NlacR692tiAmg4eL0HaKGYEQQLgIDSvfMLALk0D2/Ve0WQYilL+qDhHtwJBMthFf08lkwmmU/pu2bu+PFzdPT8CookPQ3jTGXmBO9JJWjOhAk5jIcPOlvig/zsV3HrVMollkbha1L0Bj88AXen1BQ6/22IdSvBRSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=MpDYVd3A; arc=fail smtp.client-ip=52.101.167.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKelDkTgJbF/0WlhSo9ymxAuTGF1oaXxRCM/VIxxsy96sQL7EAOgvCkwIUOyadMyJ911ApLMMDQjdlFTyUIsyJ+4Udl923cmeVc2e8Q2FXeUrrub5joi1/NzdA5L9MPyGu97dVj15RL4EBq4aubD37cShNYVHO3tRHvrchgKDMH+p7uFXoiZDE8vmlPZSld6aWFZzOmJxgfEcVullVlgabjFQEU9mH4qRMdcu6nGNtxPaYrUmuX7GK+EgcPU40QZQ8W3202zsaJrht2Fy38fMFUNDPnAHBlPebRB26/tKKdR8g9DmIvH/tqqmZJO13KVU9g+BK4TgTFvguug/Y6TtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfaT7q8QRt6NlrWPvcnezPdrRin8McACr0FpdF6eoAM=;
 b=mANej04DLnIhIweE1SM+6yXb6H14H3VpZfmhLSPdvR3ADWhqoXjxwz2ZrE+Gehz3F/2plhrwUJnxgx50lskOxsNtq8Mav3C2qnzq4zQcbT4gUuigLBv6cC/9BiqhQmrprwxmJmux6bZVOVICnTl1grom6I/bsIbMWARO5AOpUPxIGIOvkRUTqprg2n5NP4Jlsr6eDjfmzxl6vXK0eEKZDVA+bMUZbO6zFQY9gdwHvMHvoHbDua9KGFew1ic3tgGtgOu6AV8ev8MBMdd/feaBPOXzrt/MIqnUHhOQi5iR6bUEXNw75wWpI7qFubTcy9u2XvnnA2Kj6ChjWN4yzuKYIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfaT7q8QRt6NlrWPvcnezPdrRin8McACr0FpdF6eoAM=;
 b=MpDYVd3A4uAT7zE95o/O5JgLnjHyQJcb0PvGtfsHnJAK8VAY/kV56eWuHpR9dBv5A0XIIcyX+YBEqMkjv2lTeQMmCGInvyqe1U1vo2b2EYMVITQBEYyTviozu223csksSBrENgS3E5tGncrawG2SvCPmW+HA2uLPrEoopGr2y+QdZVKv6a8Qu4dzbH3cyctUhlUTnPjgHzFqaFVqZ0P3jFLn7QN5fZD3ukjwLOu/KhQ1QK3a/ie+ttVnPQTqIiOIBq9ZaMsUaKVcmLGNHm5FUXXCG3CQnnr8vAVfhLRxhnlPjAkUmpT/uFXnSEM4oGIkVLA5sy8yOYJPtFDLQQ8zmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1P264MB1891.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 08:37:45 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:37:45 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	Junhao Xie <bigfoot@classfun.cn>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 4/5] MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
Date: Tue, 13 May 2025 10:35:49 +0200
Message-Id: <20250513083609.328422-5-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MR2P264CA0111.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:500:33::27) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1P264MB1891:EE_
X-MS-Office365-Filtering-Correlation-Id: 6573a051-a4b7-431b-c992-08dd91f96f0a
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|7053199007|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?B2OliLmsqLKNS+DwWEOU4LzA1ZZVjQAEQxBcUoKumbuQdIyjMtKXI+AudK6n?=
 =?us-ascii?Q?tvImJR/oPIcU8RECfJb9QxscZnlrONs0kl4Ooj4qXYnY6OCLfalIMHhPnAy8?=
 =?us-ascii?Q?J5tD/Pt4n321bonNKWstLO72Ndii6kxOYfCxbN3uBfEjLmiZRWT4kD9QCu+m?=
 =?us-ascii?Q?zIwu+QW3C/vfh+BcghsiBaRfu/JjvGr2YUbMWKEQ7C3FmgYVOzwe9nkRX0Zj?=
 =?us-ascii?Q?xomx74noCsl4+X3Nd8ZNzvULNq7+bAVTSvDgojT6CHghmdnGZSWFimLt/3pX?=
 =?us-ascii?Q?sY4JPIgdM2y7qgZ8r5xh6vA4Vk/+fdPldESUt6ihWz81CeWFtw+kgtT3nDun?=
 =?us-ascii?Q?Eh0PFTJQ1bLjLFeR7bRmEi+exHDASl3NfuzGQmK6uaruqzhcR8zGT5vI4JjS?=
 =?us-ascii?Q?ubXuQs9XSQXyJHEF4CRtMtUPsI3PGk9ZJCza4JPBpmbBBUdtFZCA0IGPo2jd?=
 =?us-ascii?Q?f6wAp7EmoNQKjdre17mUFOL2iyOczGLlZ52MUOhh5TzDNZ+0YTFo1GUat6Zi?=
 =?us-ascii?Q?tqamI9ciowfm4KVU3WEV5eo74oBx9jWyIXnQpsBVkubZd4n8eN9Yt1fiDbtT?=
 =?us-ascii?Q?2ecP70tgpNZsC2WpIgb/4u6Q50cpWWjJV74eGKAQpMAryq8sAPArdjSDX4xb?=
 =?us-ascii?Q?BkjQHszJyDehLx8u4bfqm11ZsUIso3XdCEHfJmsXSLMtNT6ABd2U3RJa8aGJ?=
 =?us-ascii?Q?AKZ49FRF9TuMpn1FZac4TP49cHeBAjEQaRwstx2VRAFsAY56aLs/RwCsQ4yN?=
 =?us-ascii?Q?9F1uCb7LS5nIH9mEm0GIgaHoElr1b5mkLEA/2dzCXlzU7xwLOCnWs7D3yo6V?=
 =?us-ascii?Q?HE//WhH/8XKAjP37zcnBoqCU2VVD0PCWY4X+i7yaH3CogLgkTq3Py1FcBWWi?=
 =?us-ascii?Q?5yIGn7MEzMd9N1SkMV0VHr5Be0pVfky4InbD2pp+/38fZOe6flilZR3aunCx?=
 =?us-ascii?Q?ncWiPCrIc1Hy2Eleg0smfGMQt7BYXzieozD35mW7L1U5hOaWWdWQOdjfIYHu?=
 =?us-ascii?Q?Yke2m+Mtr7ZxNcl2q8GrzOocNuBrplOcww8axgLT4oHPWrBAmTWS3BIED6AA?=
 =?us-ascii?Q?xvL0oCtKlNOImrD6RLozbY3o8jl2v6OvJyUnKa+kmL+yJkxjwEISztwX1hL+?=
 =?us-ascii?Q?9FPO5pP0CX7U8zLUdMVqbvfgvjECIubi3YJSLymDL+t7zx1T3LxA7dmDcFTE?=
 =?us-ascii?Q?7Rk7JgObWBF7/WbwzxnCIoyWpFsY6nNjWF3ZR3Avy5lJFgdZiUWyzAPrw0GJ?=
 =?us-ascii?Q?PihMDaqrKLdgTg9U2Novr4JUiQ28V6+FCvG1vhSDD4AoaYzf7YMQFVRq5e6Z?=
 =?us-ascii?Q?eTWbNlwW2rTj+vY0gpXt78mnR8ycSLrrWg6ZDS8g2hqqAeIi6s4de7lTioZl?=
 =?us-ascii?Q?hNzk7otzx7aoszdRcjGqEPghwYfV/t85qG9na0Get/+aVVZ+m9mTcl9ZHZt/?=
 =?us-ascii?Q?OpDbHQvgw1phWVid4crwiIdvK7cU7ViRlsUQhITjgOcfuBfteFgVkQ=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(7053199007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?yIxWypBfo5XRJRTCrzBuZyoMlOQvI7nrfm0pY4WO0daShF3PB+8yCZorDj/J?=
 =?us-ascii?Q?pNMfNcaVL2NStPNUvSTYa1uH/XfqxzB2W531fLqOCRoRKvy4Gi6H+cNij0O2?=
 =?us-ascii?Q?gYdBUfHUqgkEIre4GgQHRNzF/yjlTWD1F58WHgbnAaQWGznxSyKYC23s0AeM?=
 =?us-ascii?Q?rFB5ROnxqzPbCBArvjMxY1KBHq0Gebubpxu+X4v4q8wzT6W8N6/li3gOnPY4?=
 =?us-ascii?Q?z89un59S35s9Nd8707QCUBVOuCl0AlVqAk8iKzeKTV8LxeEaEKTuvn9npmV6?=
 =?us-ascii?Q?bdNtkavGvb5F+cKAffJ2o/pARnPK4mBoqbutpGqbZNLFipHAc/vL6aiz+ZNX?=
 =?us-ascii?Q?yZM5iNb12/akZ77YHDTGqzRunaPXH6/FldE6pio75b5LITMeCqqCmR9EfSMO?=
 =?us-ascii?Q?VJ2bIGzxiPGIXiSDDLwsX49V9qOYCZEqRDbt0YDmhTexP0JAF2/n5WH5zxqq?=
 =?us-ascii?Q?UCovAu5507wPHdgRLzqZr9AgkwXm+reXk4vz1/mHVNzeeprt0Kdeyy60faIo?=
 =?us-ascii?Q?9aqJzYIG6Suetdt+zMnmDFziD7QdZf29RgVgV9jA6Le+83j3idQp34rluLE2?=
 =?us-ascii?Q?zTRJSZeM/zskByRk8GCLq5ONKfIiU81fq55A3cOs0AUx9dYd4o1Q6OQ+ZGWw?=
 =?us-ascii?Q?GpScRz4hnH/uEWO2zZ83NbQk54n6QWM4O5czB2ve0hB4I24ViO9kZ1Q+KwVs?=
 =?us-ascii?Q?lDgq+FndIBpFEZz/ykoShOSHo03Qm/arOspMbY2KkwAQ0U0kqB6f4qJqow0K?=
 =?us-ascii?Q?ygMcYf5z4rp0g9HXaAZNB9Udr8ct7EamFPusptViDt2rV+kQ/71z8Z0xImtn?=
 =?us-ascii?Q?3oYAkVAI+whMQi6cNr2QIncIIZbMiYk4gAlbvXmdSGQgtX233GZtGTpVhzlt?=
 =?us-ascii?Q?TVA3vM/ueUuEi9y9ebYYYywTVsvvpDI+7qhPF2yU18pb6upojRZuJMbDhBs0?=
 =?us-ascii?Q?EHjrurT2EoxgbiwINVicx9910ggWLDaPLiL+gliCjjmYUsFYSg4hoOSOYGUF?=
 =?us-ascii?Q?f2nbQnOBL9f010X0s++xBD6O5U/hnQyseK4GTzit3hTPW70G+0DBX/+gxLBv?=
 =?us-ascii?Q?8fi6qlnuhAw2kHxuMJS02XInY7MtDITE5cFcj6bujLHcj7+pYlaV2i1mOG9j?=
 =?us-ascii?Q?xLKJa1sDqWkIGLDj0NV/5y1hevkKZVUR0vIAPgF9SsXrf84K6o/7+11HbW7p?=
 =?us-ascii?Q?MaEK9i+QxisistwUdNRX96DT0Fe60TLUqqSwJzkwIcHzGXUktX0Lj7VeJ1cy?=
 =?us-ascii?Q?+VoOQhD0OrQAwTILtFR9Qrne5TYdHeWF/qA4/mZV9J/X+aEVq04pRCO29lsV?=
 =?us-ascii?Q?x3molOykYTuDEAgL+tGCuWFGHstVIjoJZvYqcGHP1uQe6e581Y0soB/7dbHk?=
 =?us-ascii?Q?3r+nPQjowwFtOIGUuh4xrMJ961StJAVzZAxJkOQrKeapLoJ1BElqn7zoVsY+?=
 =?us-ascii?Q?qMzWOgJc7GQWI3ygLCh34cPd6i3A+v7w9Mhc9LVWZs4GaV27uIRsAd0Zanf6?=
 =?us-ascii?Q?z6yHpqV0uOySMc/VVF8JRG6enEYDVcbNYNA8xCci15ko6JG7k58dCb6bKR7x?=
 =?us-ascii?Q?VCR+R5rNwetYMk+BXy6GIEd6Ggn5SA3DTOpDpPvc4fw0DmEqmbMQZdJbA34B?=
 =?us-ascii?Q?PA=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6573a051-a4b7-431b-c992-08dd91f96f0a
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:37:45.3586
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMOsYMt0ikZ8Hz8bkw764kTO/hflOFTJRiIPDoqi/OQOo8p9MCxH6rFZ0LcpkyStbZcOue7wPBGdFbPusqFk8S/IgJurORZqgwylhz9bX6g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1891

Add my self as maintainer of the allegrodvt Gen drivers

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d81d2756cb2e..8912fabab6ed 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -802,10 +802,13 @@ F:	drivers/platform/x86/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
+M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
 F:	Documentation/devicetree/bindings/media/allegro,al5e.yaml
+F:	Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
+F:	drivers/media/platform/allegro-dvt/al300
 F:	drivers/media/platform/allegro-dvt/zynqmp
 
 ALLIED VISION ALVIUM CAMERA DRIVER
-- 
2.30.2


