Return-Path: <linux-media+bounces-27398-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A348A4C6C3
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:22:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AE4BE165D5B
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E081022AE73;
	Mon,  3 Mar 2025 16:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="W54dXZCg"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010006.outbound.protection.outlook.com [52.101.228.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4809422ACF2;
	Mon,  3 Mar 2025 16:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018295; cv=fail; b=evfkM6/YbMj5e94s/zGrJF39qZXcaa6d8GU3GBtMcF0oIaObhuyxScZ+G773OggBp2Ryc0Mnlp5o0xc7NG+rkdVqIQaW9btzOMHnzE0Q3X7558TdqYXM+ZXWMb3ESX9wREtjdlba2okGyrWTGsveYfHAswDBltJigTuzqyN2V9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018295; c=relaxed/simple;
	bh=9DWDlHAmyd0VJNycd3ZXUthqysKNwhsejI1DQdf3ELM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ClWHTrF6WebEIhKKTQ3GAUIl7vdb7ZI9aXvwr9il6IKYjR4NLPjlF6DmE2z5XCzuov22lKFudp23kpIOOn9bltZfcK7o8KxqcGIHOOQUKOteN3od6N9r0kwwPYPCPGckKmdM0xoDp/4Xv1inS4OxVUXQfnSvz+P+Hcd7vEEsu8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=W54dXZCg; arc=fail smtp.client-ip=52.101.228.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EjDBsTt8B6I6P7iP5uxLfn/t6scXvZzljI7MJFb5xjFiCAEVtHwwFMPYKnicpIdBRx1xW/4WD3DbKVY5DkZ4ptD1xUONFVVWQ628gdfxjk/XbFBVF9iL6KOEm2lEL8jmjY/gKwMZ5BP3B+yGlHDEbbGUmVxHhAvRyLkozZhb1U+nepU8OgEVC3hiSXJ/GyPV3YHKa0KnRuDU5pDd1WZEcpHfqzXMGCwKK3lOrbHVTFujhtV/Wub9ZDbEbgkn3ZEh7IMOo5UTPTmvsx3Q2M0LCETzUxW+d9zFN89KrqmkLjpIBwntvcLfGC1xRq+x4YluQ5QTrYxfa5TMJu5bQjBWmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9shOnHi2lLf0mwVZQ0UKci5a3+D8SHoLbf0tvXU/1es=;
 b=nJW5sL2rMCBMvqbQeAr/fRKlfg/zSu8YERTXT0Yj/RzJXBMzNe6r2WlKMbTePKo/7Zc3ANRH2wAtVmYloXHdN+ZXAPXwhoV3K4f/cDA9d+utnBjokTzVpb+/pK0LFuY119nqk54M00cQT3DUquUSKWCRk5pV26GPi4lgb+CeFio6NGQu1D2A7pj2cjhcTsohXu2/whD08d5pR24JLsAMJ1oWNfD2KzfdNw7eKJKLmFyqhhJmoX3AS2ZSwS4Bu1SoBpHqX52Q/ME8AMafbtBceWU6X3oZdG/diB155rEVKJiwCvBViA0WTLYfonF1HxhzCXV+DR2CX95veeRsHh2qSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9shOnHi2lLf0mwVZQ0UKci5a3+D8SHoLbf0tvXU/1es=;
 b=W54dXZCgtDNYP0kVk4Clqwa3NFcXVQMC165ZvWWczGPW06Ukro39qcXulMekw2B+Ubo6xmf9ied09XaChktiYcXncHgrihgXR7HHNWAlZ2vXf2odMvCCMm14ywxqbS5UOYvtzax0lKc7vm8Cw0ld+6JqqfxnLa7dbYjCQyuM1Gk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY1PR01MB10752.jpnprd01.prod.outlook.com (2603:1096:400:321::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.28; Mon, 3 Mar
 2025 16:11:31 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:11:31 +0000
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
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/17] media: rzg2l-cru: Add function pointer to configure CSI
Date: Mon,  3 Mar 2025 17:07:56 +0100
Message-ID: <20250303160834.3493507-17-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY1PR01MB10752:EE_
X-MS-Office365-Filtering-Correlation-Id: d75fad9d-f3b3-4a55-31cb-08dd5a6e0f95
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/IzTtqluz/2O9W2W1yiEX1tpaFdfFYdawnx2N5jtPT3qLQ+pa2sqvY2lQARN?=
 =?us-ascii?Q?83X7QXdzUD2pXZvFW5WPFVv138qJF+XYstFFChreCO8oYVvy9rgprhqEYQNm?=
 =?us-ascii?Q?JpSmDLhHithxS0G57cvhMa4dLLjTlT0GMaF1E92Ppx87nayRcxvQa1g7QrMG?=
 =?us-ascii?Q?vQM0mjiRV7ZIpKguRVG130gRBOLsYCVGFssqirVCgIfyWU17MzJRXWe0iGw8?=
 =?us-ascii?Q?YyOYfV5wcG9eV0bK7k4EIRTsd2i8KoR+E828cUS/57QCbCX5fbgoYM4uWf4l?=
 =?us-ascii?Q?mmI6fJ36NNkrbdqrd3iNzC+9ARPb0vpAv57U+YyPqnCC3rlUttamiVHZjFJ/?=
 =?us-ascii?Q?+XZzHlIAGfjcCIMYTDl+FXf3jSyQdCgFhni/kXCfpPVh94pMB8tUNTjKmZkz?=
 =?us-ascii?Q?4DHm/za83pr2IEqRrHc46EfaSPnfEegLxYP0D/pVLGMIcglQfYDNcX2g2mw/?=
 =?us-ascii?Q?DM7s6QZDHODqZtIlC1z15MjmeCUUh2QqWg/LnfSQJG/bXKdPHB4OSsjs+lxV?=
 =?us-ascii?Q?jG0//Y5ml/nnn8nVwycVq+g4Br5ar9sz6Y4nBYHxPqwZGv/dMrn01Yy43DzE?=
 =?us-ascii?Q?m8P4lgrGduuubfcv8d/RJsx+tN9kjs7srO8QFZFuifzdMO/GkzxxGz7RNPRp?=
 =?us-ascii?Q?7H2mgf5TvKP5KX7dySZjUZO/pCufQngf6dIFaQ/GKUdJVmfKjIY4LzEE0cCE?=
 =?us-ascii?Q?NJn/IopmShFsSC0vD+8I2iDCX+iPwkWV8aum1YDKalwjWag6BFOgEwj4PwLu?=
 =?us-ascii?Q?QHjmJs9IGkUpgVu54tRm0HGOaaYfEuud64OVn4GLNJtp5nNfY27btfKhlqWX?=
 =?us-ascii?Q?OjsLyyMsIRS8lWqx3DeKnssP5UFDntrTiiuMKFT+yJoH7azd4M2jvXu4jIOK?=
 =?us-ascii?Q?cUQxXHlzSbajLIQZlcI+G2uPorJvaQ6NTjzkiqCg5a7yCgU0ryPzv5S+Omtg?=
 =?us-ascii?Q?QJDNp/puSvDzwRuNUF6N6s5SK18LOpHXUi7t5RIvJqhXDYpEEo4tmG2rzaOF?=
 =?us-ascii?Q?TrKkDswQ/AUr33CaAkDXyfqhe/r/+FoVQ4xe0xu+WgCAqSbjCkxjci8wgotX?=
 =?us-ascii?Q?CAx3G6sVDt2Q+5XnaYDBMFIgQTOX7aq6rgJwFiy5//yVPHKtN9r2lh/1Oa3s?=
 =?us-ascii?Q?/RtGQ3wyMcMC22nUB1OwSK3lngBDJkJUoSj6HuiAr1Q9knlvI0X/O0DV065W?=
 =?us-ascii?Q?TSqlkzN7+2M9CqagnLzbMEDNs0SHEXv52ypAptfGfPaq3I1QLNwHgTnHofpc?=
 =?us-ascii?Q?iJffXDPFSsArQBTcSD2vsrEM34OJmghztzmYwkH2w4bZt44IgDAFSMImWA5w?=
 =?us-ascii?Q?pd5Ki77f6b0c4tawWbikm/zdm5zK3wnFckVdc3YYs19A63eeAwCPz8zAtkAo?=
 =?us-ascii?Q?AeSu4tWrr6giGxDYIsiO9AHXWIOl/cOgvV2kePNzxXJRCmrBc3zLMTzXt8kp?=
 =?us-ascii?Q?lRBuCSqp6nkDefoeb6XBNdN30sOx+IVG?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?HMOjYb7oflQVW5eNZXUhmaAYHteKOtBLcQJq9wdSebSTsiJkYIjWvqrfHqBe?=
 =?us-ascii?Q?7PVpzetWqw4W8Pif3SGdqVicvf68DaXyWzmM0/eFHStHoLx6k6+AD70nnSW4?=
 =?us-ascii?Q?YiwwEEdE8YQFGW9elwQISe53Ua1UKfS1npYf/mok2xt4AY9w8zSQd1mCzij7?=
 =?us-ascii?Q?OgbIUUqKVgav/mmKWc7DrDKktmbl8wakbupEjIPTF2rszimwhPiDHa+J2YGU?=
 =?us-ascii?Q?58PC+HQ1TPnbm/8PDTdhdsELlF/N4iQodnHUAJtbSiXVJi26nxxVEGbQc0cS?=
 =?us-ascii?Q?Qpyg98bWyxrLTj+s1SO+GWKz3LrWe+qAYx7v1qYDuVUijeFGViBR4aPQJd90?=
 =?us-ascii?Q?7le38BIHX4gQuqN7ogTu48Jd91AU8Zuuj7ZHF4/yPmSdw6n7UWB41k0sqlSq?=
 =?us-ascii?Q?mubDXi50B7v6GqQGXASMrfXa96e5uP6Peu/0Rc30O+2ZwFTKVTGMUsJF1QuV?=
 =?us-ascii?Q?LUEo1vLgZU4B3RTywFcbgyo7+p/a7Q0hSFgVT3qTLMp/yFj08YojodXc5F+s?=
 =?us-ascii?Q?zU0GemuqW+55x8b9PKHasKwity05hH/YTKGYu8vjMsfzgBYgDU6zSdp5k/8T?=
 =?us-ascii?Q?xYE0AWclGZlbMQ5ofEVY9j4SfOZx6VHcZiJX5QuSyvIY2xPSo7kd0E+AnP7z?=
 =?us-ascii?Q?0pvCIXpWa56cF3fMKtTh6ZSjh3hnfuRHm2H4Drf83feD6Es9hjakIuVsfrBe?=
 =?us-ascii?Q?Qw3rn+WvAKrAZMh+b14rNGrOFw/Q0LM5K0tq6tmXeipNKrU8L6937A38uTzb?=
 =?us-ascii?Q?m1hEfj5IF7QMJIi4M+WB6TYP48RVAp2CeJOf7KLqW9xw7Wu3ouQc7gRMVhux?=
 =?us-ascii?Q?vNYJiubuO64eVv0pGusCisM9dop5v4J40x/QSJsdF2UM012Z5UkB50KY+oQj?=
 =?us-ascii?Q?0p1eEUaWxb8uUfdIUbYVUVV9PhCrvlgvjHJe2pUPrt7LsQQBMlUk5dj1EkHY?=
 =?us-ascii?Q?oM83xkHpQ8FMJpyaEyADi+OoYeb69lUBAweRKEBAHvZNG4118AHnDu1fDONP?=
 =?us-ascii?Q?har0rOhv7mFWWfKhkjZo9iGPOWLl4yaEOo8gvEnHxDIipL5k0JNN2eb3OkU6?=
 =?us-ascii?Q?k43vVyvWw6U69WsxSb+xNPDdPaLAj0UhAQqiqYDlbKdxTyNKPdmFPWHbgIxh?=
 =?us-ascii?Q?J05fCwRnPXf2x/8ziOuoT6xrvf5ebSrKg0+LNdro5SmRc1BD2t+zVSuCkhN5?=
 =?us-ascii?Q?FvyDIwv4jMVywSRIhWQfOuuPrfQsHAa+kvOr6oId0kWXfVEIEsVGOCHJhID+?=
 =?us-ascii?Q?w/ibx4YYY1M0pjkbPNFzWByJNNeaAdN8XKP2zfsug5R799SgltFRtPMiXBue?=
 =?us-ascii?Q?kvLCPR8b3oF0MopSpHsyIzPngkrrD+XX4oWTGYp7+vxtbgog5nPv1d6DKljj?=
 =?us-ascii?Q?2fVdM9pzbRYUz1q9CfWmhCtUASHTYjURduxN9X5jXFZVG/MgxpqTOLB/T309?=
 =?us-ascii?Q?tZbkEaa3AcXKzGoEkSLEAHvOma0M4G8gmW0NRO0qdTUERdpF0J72gq8qCo5B?=
 =?us-ascii?Q?H4yMCpEHJtHi/7MIRgD6TEU4g5teM6ZYAgl1ntjuhsBl3iu+oAC2U9j2+oTp?=
 =?us-ascii?Q?b/01wxUWXtEl6rEWmKz3WPWTUOvGh8GY/qFf+dPkUo+Lia79J4azs/BbmnpY?=
 =?us-ascii?Q?dAcjrTwmUU02swijgIrGGS0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d75fad9d-f3b3-4a55-31cb-08dd5a6e0f95
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:11:31.1733
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/lZdROAtCeOv71v1/5tKPN7xt0igKskOL8Nb7AfuH+kjEKAKjnYYqzoFLO7bvZl0KeJGFH1Q8EAWzA1yqr8DG6ulPif1SxmQkEMHCzNdpxJG3n8OfsBuTSkJUAlI/4/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB10752

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `csi_setup` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, additional
register configurations are required compared to the RZ/G2L SoC.

Modify `rzg2l_cru_csi2_setup()` to be referenced through this function
pointer and update the code to use it accordingly.

This change is in preparation for adding support for RZ/G3E and RZ/V2H(P)
SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag

 drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c  | 1 +
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h   | 6 ++++++
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 8 ++++----
 3 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e4fb3e12d6bf..3ae0cd83af16 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -363,6 +363,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
 	.fifo_empty = rzg2l_fifo_empty,
+	.csi_setup = rzg2l_cru_csi2_setup,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 2e17bfef43ce..ccaba5220f1c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -89,6 +89,9 @@ struct rzg2l_cru_info {
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
 	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
+	void (*csi_setup)(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 };
 
 /**
@@ -187,5 +190,8 @@ void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 83d7baa07dc7..a3c4e2a0bef6 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -242,9 +242,9 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
-static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
-				 const struct rzg2l_cru_ip_format *ip_fmt,
-				 u8 csi_vc)
+void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
 {
 	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
@@ -266,7 +266,7 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
 	cru_ip_fmt = rzg2l_cru_ip_code_to_fmt(ip_sd_fmt->code);
-	rzg2l_cru_csi2_setup(cru, cru_ip_fmt, csi_vc);
+	info->csi_setup(cru, cru_ip_fmt, csi_vc);
 
 	/* Output format */
 	cru_video_fmt = rzg2l_cru_ip_format_to_fmt(cru->format.pixelformat);
-- 
2.43.0


