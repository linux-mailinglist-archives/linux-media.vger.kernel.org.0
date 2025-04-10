Return-Path: <linux-media+bounces-29892-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD10A83C7F
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:20:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E66991B6699B
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:19:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 521F020CCDA;
	Thu, 10 Apr 2025 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="ThDDBv8o"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010053.outbound.protection.outlook.com [52.101.228.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC6D20AF7C;
	Thu, 10 Apr 2025 08:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272939; cv=fail; b=mvxIDMJaxCYeLrV+w2fpjreYOaORh45YU3w/4WrLW7ehZUhDWEqbD1bDUU0BEODm2MV/dKRSNQIZY0EoxrYEr5wSdGYuMc9sfqclgkdbKaodURDlNdCrFgl+gnphgktUWBtWY7dR7oyrThUczELnKYy21ot0SE891VIjqqnaWL8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272939; c=relaxed/simple;
	bh=sy4aSaj2nR6DfO4Ow/eNkTJ8JNuuj4PCgddE4cchyCc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X39vLHRv72CmpkY7ZhOnrWD8U18Kmb0wM2Cf26Te0uvd9dDDUCnRG53+YWbp3ihB/zmh/XAGtBtraAF5BGnqAlieILSz7RLWxzaNAgv4CCHCwl1+tpQssIIpwB1iuK0I0fGzpdyny9uO2UngG5CKqKqQTQqSmM1suw+T6BLSBWA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=ThDDBv8o; arc=fail smtp.client-ip=52.101.228.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vetAVW5bGKeRmYeZItWpZQ/Z8TbZ8FWYtpNarhijw6Eumw3aycsWrfPVZ56VNoRD4lAdAdozYJZy0Lus0CUTnjkofEfjqTKc7sOzn4khgjI1WqeP/1F4gyRus6rW5nomVvxlVPFa+tDjTQHqHx5DYvLhMp51BvzgF18nBHxuS94qt7NdPXZy/Egbst5DwN/t69eRsekcI7MNIVC2gjfRp42QLuu1FR94Ka4flE380Yb0DBNriEZhTkrSyatmmeNlUc5pbbOV/mmIULZiEgnIxsqdUhAQ1xHPW2dumMHncmkTnNnoxGf5ZwaF4elqDWZb661Fu5CJenUoEF4fHAEiSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RzqrfzmgpsoH2l1Nnmb2qYzTvBefNPDBN95lIwsUpxM=;
 b=Owmlc9a/spD/mTmW182DMA44oGN4juaDCeKlc4YnBKnJpvyPWt/VkCdVeoQ7F+CHWUK+0infdSojObqS42Beoc+hBvv9y2fxJ4edAjGk0gMdAoSdMmtGePLDo7mTi+P8kLNuCp+lEtFtgDfrGVVKmx2hhhrNncpo/2cU4za95CygvkgRM+8hnGf3HvqBKmTE3m3D2JQgSl6lEiIXFYNF1qZjafu5/jDROmANg3H5D1ibKOnt0Bpc3iILfhvFP+W6y7SKEoLyWs+NaD2SLpCVzJE2J4ugN4eEC3nEGXuV8IeYbrcS78NVr/qx8EPVQEuWZWA7Q7DOBuOQPsijMTAfXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RzqrfzmgpsoH2l1Nnmb2qYzTvBefNPDBN95lIwsUpxM=;
 b=ThDDBv8oGXnyAnzZ97oBsPmxgx6px8rzcmbX1Rg0N0Brsp/vw3FePA3ABasw+KBKMdcYhgi1XI1eiMp4m9Piv1kvWk/KKtPoUx/CutR9ffiAITeFiWZZfNNKch0FbTscM243nckHNqkT6kPpyPeRGd4I+TwFY3xi8BzQ0mR2lSY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:15:31 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:15:31 +0000
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
Subject: [PATCH v6 14/17] media: rzg2l-cru: Add IRQ handler to OF data
Date: Thu, 10 Apr 2025 10:12:18 +0200
Message-ID: <20250410081300.3133959-15-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250410081300.3133959-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0285.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::19) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYAPR01MB5660:EE_
X-MS-Office365-Filtering-Correlation-Id: 513cbb70-d1fc-4628-0b32-08dd7807dc44
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0Mo0dikWI5pj1uu565mtA8idNJjNB7+ARENXI8IhH7ruqjWxRESBEJiE2o01?=
 =?us-ascii?Q?8hh3wPg4fXySyBqNAtqVz728YgG/ccyaq5z2W0kwAaZHn0vPfpOzJpVE/dbq?=
 =?us-ascii?Q?hvJVcx99i2OM283CxhpJpfefHzxI96sgVC9v2cdtxZzBgRouu7du9P9xwLL0?=
 =?us-ascii?Q?aykHTJlreqZdDpXPRLMlZNu25rCV9HcM7SItfFO617PMScbBT8V4sRpT0Nyf?=
 =?us-ascii?Q?xCUB7VVNI4ztqf3iHi65OG9Wew0gDumeMJELrAFPF5A3xd+77Nrgh0FEUXHK?=
 =?us-ascii?Q?EqHTEOxIrYtnBdHQvZ213SHU/VxnCFhLOzz1ztQwiwrzT4+aDmZxFk0PIFcs?=
 =?us-ascii?Q?dJ53VsRE12KZNl+UxLcoabuq2lPSiEP1U5SgJrxzS3q2jXoIey9iXVOwN8HP?=
 =?us-ascii?Q?MBB7bXNmbUkCsE6fdwQpOzVWUs4I8gofvxKXcUqN4641fI2kVtKeCeyIvfUQ?=
 =?us-ascii?Q?tksj9aokIQb1KAdRAYSEE2BSJ1+EYYRdTXgX8yfvxQuX9PavEq7/FsZGN/Y0?=
 =?us-ascii?Q?yv2DEcU8m5rkp/Yq1Ucxq6ABonZu2BOmmaDvpyojCeHMhKe4Lh9JgGu7witj?=
 =?us-ascii?Q?zSI+wrDCirdJEzE7ZjH1Ct3H3tbVGUsqIgt0ExPYjDX1RBEPb1BMunQjHPBr?=
 =?us-ascii?Q?XPH/376FguSNz0VwnLGFzhnokRoxRAkM7AV0/+pATcORzGAri8DjvGSmmsC8?=
 =?us-ascii?Q?g+sEB5inEsEXORq2yrJAK+mGmrPUUoOPmG7RAR5W+qZelnE0gTsJ8XTrj5YP?=
 =?us-ascii?Q?/bYkeOpR1jwKBHEw5hBiE3QvkKHttbsOCWIggXsxOuJ+R0R6SAhkIkbDw0Eh?=
 =?us-ascii?Q?o37ikZPm0QFQFNNeGjNke5ScisOqYFRJEtqfoZSLMHzIGOyLxSeLgWATR11W?=
 =?us-ascii?Q?9f2aXqzZPL1OfrCRpKS3HnPOnhpDwM0SHVDGdTDaDESyMGMidv1fXKSWKSE0?=
 =?us-ascii?Q?Gmf0veaKcDVQ25Z81jyuO/rCdEb1dgmsoCe5VyxCsfXqtz8fWq24GzqCiDoM?=
 =?us-ascii?Q?REb4IkW6KBKYxQnK+5OQgMxHqYtOAlQ4I8cJXtVemrX2PkwquJjirwJ0Ph1Z?=
 =?us-ascii?Q?XQ+xhmlXVfdPh+VYQ60iMfS+I3qGA+O+BYHHmY85iDhki7KBYLueBBm/vvRr?=
 =?us-ascii?Q?7fPi8X3/Otsfqpjh4iwmEGg+lS2JdZWx7WFf9jd6jc6lF6q8Aj8HNI7e2WSi?=
 =?us-ascii?Q?DAVyrHLo5LCu/IH5JEQt/e5r7pVUK2fUacw4W+/3w3MuS64UMMY6Wjq27vB9?=
 =?us-ascii?Q?Kq8aYlTOH4v+zvT+jVmGym0TiO8NpxAVssjMi2ziDhQMvdi8xyyx24nGUqHD?=
 =?us-ascii?Q?85lDiKVvdepHolxZy0c1RrLWihaO3/tAGv40luP/bYOTi2/AExyhGZ/13UWs?=
 =?us-ascii?Q?bFpXru2k3X+okV399CXFGp9QkpHq53szMCleg5Ud6R/1OgoSruZyI5u/IeK9?=
 =?us-ascii?Q?aJu/bolb3lNrWuVgAxLpoK4KUQa88JN884zNW3vXIpTfSt2teGVcgQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?vjwllE5Qu6wF6D0JD3inh9S44qpttf6shR23SQW/i/de5nUAVHHh2Ei1FsRG?=
 =?us-ascii?Q?VUrufdTst6JQEv7v+85rShsJD+YBoMRIg3YaAOnkNXq2vv7FIfrxFfOBtWBN?=
 =?us-ascii?Q?Cq28Go5ldHVjSOFanZ+8f0Ub5bZxl1/z7eZ3mDkSf5Ptp58ms/jMSi2B2ytr?=
 =?us-ascii?Q?koNs5uRWfAPWlhgibGXaVYkKTSPy3NdQlZr3MZe0yA5qOQc/sykGRG1hKHQk?=
 =?us-ascii?Q?fJpvRtYmU3eOdmXF4l4srT6b27/Fq3YDsfwHHvHHDnYJWNo+SawfxLfVf6gq?=
 =?us-ascii?Q?oGiXDaaSjMaSGZ/VmPbnnRnKrybpx41bWj036LVHxmC+0fHWKLlIrlmgS3M+?=
 =?us-ascii?Q?TeR2rFHF3dO7TEVOm0k9/p7HZSwgEhXFtaIVlnQQsy/n1bFMuUt3gQC3iSx9?=
 =?us-ascii?Q?Q6L+/iQJ19aMGeDLOglh+bOS1dsc3OPuDHL5fZ4hjKSriUoWjtBr06JZjCHa?=
 =?us-ascii?Q?ikeXbpVe2EuwiUIZwUwn8lT3blfophZs91ZlpgWJEqjB9DbXLasv0CgyD5Vi?=
 =?us-ascii?Q?AfxzLgJaD6ZnljZsg6940Ibo7YNyxC7JJC2s773ZbmKQUeAoYUYJUSR90zGb?=
 =?us-ascii?Q?mt6RhGt+fv7x4v8yj3X2Yu2t1NWCQz5Cep72CGj5QZu5zQevgl3Sz1AAxt9u?=
 =?us-ascii?Q?09wOJzgeKsO7r5rrnNPXnDcwzXSzb7cdZIG/axP0jJV9NEMrAwYHV2GgX6ig?=
 =?us-ascii?Q?PVDlh4bvD4jLKjWfLiLGjxMwl5/46AAKUVykDTwirrrZ6vWWJidU/qksYUfq?=
 =?us-ascii?Q?37apZYGj8gWQUyAo9NbD+L+5cauHryG43+5UExpl/MspTuMSw/3/e3nMXxob?=
 =?us-ascii?Q?ANs5YxVTzpa6AxIrE0+hyAahTooVnvsp9/KWRP7/YxILnkv7TEcAnQgAGy+j?=
 =?us-ascii?Q?kt95y9mkkKSPKI+BMVNLFI5y2xneGE5IZ7oMwbKUtu4NLIT+RFNl/H6w44By?=
 =?us-ascii?Q?4C8N/Gkm9WB7zE0d/n+MCKBTFIRDZ1GF3sizlUYVqUxWEivO6/Dgx4m7t0q+?=
 =?us-ascii?Q?/Y8tSiuPj1xagD5VRHCiPgETbqMGf1KEXcM5f0p+WD2DrtiPkG/Q3gCuRgAr?=
 =?us-ascii?Q?zTobojgAVSVxEvMi7P5pM2WVWP5DnP76K9so5ToCtVROn66DcgaDB39IcQYV?=
 =?us-ascii?Q?91i0FQzopzTEGvrC2WxfphVoxeOREAEyB7m+FloLqVGJpSQRUYrXS4Z78ptc?=
 =?us-ascii?Q?gI6Lf1l+G20Y8sRMdqK1HAj0EpytXCGXlHY2onh4YPz2Jj9cXS43fjUr0sRB?=
 =?us-ascii?Q?BFsB9mfs23DNjsO4pd1RyGejZU2bBSfQGixsQztS4/5uA9oRuCoA94Dal101?=
 =?us-ascii?Q?k88eMMjiYcvKQfe4IMXfogzLggSyyOuSnYroFGQjG7mVRmO0Ym5gU7WAZ99D?=
 =?us-ascii?Q?cgnjjx/I8XNYPS+GkdCYt+9MkU6nrq1Gz95SfonwrQf1iMpSXqxqvfKrnyBA?=
 =?us-ascii?Q?4FH2AUwPHYX86f9Fd1eBkdK7fOm7qrbv5ESQOZEtLhWdVSXEV6DaSmppoUqE?=
 =?us-ascii?Q?7WCtkbTttrmtjXVzD+BMgnB53Z1JiMuvAVblVFlsFaurrit62wm4qh0wc1Kz?=
 =?us-ascii?Q?pKhVc9lZbCbnpPERsDs5d+74lxb2yuOZWl5iHnYvkGhtM749S7s+ZN6rHyhX?=
 =?us-ascii?Q?CqokOUScZh+59Usu4r4ZoTg=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 513cbb70-d1fc-4628-0b32-08dd7807dc44
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:15:31.5790
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x3QE+lUDvBMvTgJ6DpmlB0Ldi7bh4VeeVj2zNQUX2ti0TOBgCi0qR3kw4EI0XDwWAi1r326rY4CUmHPzfdhdOQjlPXTEOS5gafljbVp/U4aMqEmwoQRXZ1TEEmhuQR2R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `irq_handler` to the `rzg2l_cru_info` structure and pass it as part of
the OF data. This prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which
require a different IRQ handler. Update the IRQ request code to use the
handler from the OF data.

Add `enable_interrupts` and `disable_interrupts` function pointers to the
`rzg2l_cru_info` structure and pass them as part of the OF data. This
prepares for supporting RZ/G3E and RZ/V2H(P) SoCs, which require different
interrupt configurations.

Implement `rzg2l_cru_enable_interrupts()` and
`rzg2l_cru_disable_interrupts()` functions and update the code to use them
instead of directly writing to interrupt registers.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Squashed patch 15 and 14
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  5 ++++-
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  8 ++++++++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 19 ++++++++++++++-----
 3 files changed, 26 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 7e94ae8039677..302f792cb4159 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -278,7 +278,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, cru->info->irq_handler, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to request irq\n");
@@ -359,6 +359,9 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_height = 4095,
 	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
+	.irq_handler = rzg2l_cru_irq,
+	.enable_interrupts = rzg2l_cru_enable_interrupts,
+	.disable_interrupts = rzg2l_cru_disable_interrupts,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ca156772b949b..3f694044d8cd1 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -34,6 +34,8 @@ enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SOURCE,
 };
 
+struct rzg2l_cru_dev;
+
 /**
  * enum rzg2l_cru_dma_state - DMA states
  * @RZG2L_CRU_DMA_STOPPED:   No operation in progress
@@ -83,6 +85,9 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	irqreturn_t (*irq_handler)(int irq, void *data);
+	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
+	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -177,4 +182,7 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_code_to_fmt(unsigned int code);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_format_to_fmt(u32 format);
 const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 95cce250b3272..a104821d823f9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -300,8 +300,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 	spin_lock_irqsave(&cru->qlock, flags);
 
 	/* Disable and clear the interrupt */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001F0F0F);
+	cru->info->disable_interrupts(cru);
 
 	/* Stop the operation of image conversion */
 	rzg2l_cru_write(cru, ICnEN, 0);
@@ -393,6 +392,17 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+}
+
+void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+}
+
 int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 {
 	struct v4l2_mbus_framefmt *fmt = rzg2l_cru_ip_get_src_fmt(cru);
@@ -414,8 +424,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, CRUnRST, CRUnRST_VRESETN);
 
 	/* Disable and clear the interrupt before using */
-	rzg2l_cru_write(cru, CRUnIE, 0);
-	rzg2l_cru_write(cru, CRUnINTS, 0x001f000f);
+	cru->info->disable_interrupts(cru);
 
 	/* Initialize the AXI master */
 	rzg2l_cru_initialize_axi(cru);
@@ -428,7 +437,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	}
 
 	/* Enable interrupt */
-	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
+	cru->info->enable_interrupts(cru);
 
 	/* Enable image processing reception */
 	rzg2l_cru_write(cru, ICnEN, ICnEN_ICEN);
-- 
2.43.0


