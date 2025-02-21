Return-Path: <linux-media+bounces-26597-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ABFD2A3FA0C
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:05:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E71E14215A8
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:00:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 910291F0E5F;
	Fri, 21 Feb 2025 15:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="OpZjgJrR"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011071.outbound.protection.outlook.com [52.101.125.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 859D821518B;
	Fri, 21 Feb 2025 15:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153395; cv=fail; b=kEwLHQhJcUQNfdd++g/lgcth64JrtzL0wl+YKS540pFvE+k/rLIqdQ8qyWeAXjCivQTv2cOAtZMVNTsZM+hZX45Z3RzvjqbuVr2gg8rt2SZnH942oRmTztfd4IMClVhNnBaJJ5CffxHGuKGTxHT4oyaHrCyxDc/bQOa18layRKA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153395; c=relaxed/simple;
	bh=QF9QNoc9bnQwMKc3EEFpjjOFxFzRK9z1VydoIxcOX+I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=gHVNVLSffQ7jayhdIuAy9saw3Df6AMOV3C1dIvpDGYZbQb1u/n/8R8wHIcW8mLsOSDnN7w21sXznLn+0Pj2oHoP7/pH6G4HI+Sq/7EwZIJWYY5luNE3lzdWf/sgbEOYlQeQ7AlNNLifBebkPcB1Id2aN3wVhvKnBzzshYjm6AiE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=OpZjgJrR; arc=fail smtp.client-ip=52.101.125.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kCWIiFYnQIDezbZlrZfzIcgXlWpEwS3C84hVhh5Q8fpAd2VN0GzxKwEUDEZg8OFHif8pjLLhou122bTWQ9k5EDLHkKpdlswAgZIrHmE1TkN51XP6duU4zIC68cEAbFI+KU8AAd8lQp0xHITp1YaIGqDfFlSsqLshA4DtnlYsNP8VRxJKbEJvB2x8ALGRADhRFPusU20RqgEodvVDIxJALREgR/gm0oP+Bm20Q29M/cvjEEw3NyU+gE9krFMRhN7d4IZk7tooKr9Q84lOXLwI6ZhYhjlvbgf/eNwn8ocevp2AulaTlShqfssdb8rV8KaG+iongCVDdvMJV0zMIuFSYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+TlBtuqBUCzJiDNjEnoVWMywswc5rmFUPfKuM4e/Nc=;
 b=rDqkkNOuCiUBFFVdvapY6PQFG3fIdzWS0SU85NU9EmX2sY4CeKI3MxCn6/KLuqQS8BD6Hxs0qemkZzY1v7ghhXWrQamIAwDqDCKuDHm7lHUsHDr9poAfFotKc2vokJgNMqXxUZ4amJFg84VE9tILcNyoF2wyW+nKjY08o/a7Hw2bHjPj9sb1n2b/Iji1rB0xfD6l3Fi6jrf379wWOLFT7ugEhg3Yd8jpi0VQsxISLiV6nUHMP5Wpnf/JUYbl2tzCQFKcudQtEb3SqDJLWsCVmWKX5n6QctWIMA/ApzEYTfQNRlzKH3u+tSthVRQXLUwSGcJY67Pb5X8QbD+VhR0A2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+TlBtuqBUCzJiDNjEnoVWMywswc5rmFUPfKuM4e/Nc=;
 b=OpZjgJrRjXvakgGEL+UOFojPEgHvxmTrEiukRyq4Meh7WJaOUdH51qIW7R3D1nie3MWlKL3k3oifRlGS7XH7M6otmD84/U5CCFgPGCGbk1AwI0o80vF98bzOTpv8FzcfoW9jNwV3EJu7uUaIwFfQdWq5uhVYJ5COnxqvLhLm7Xo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:56:30 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:56:30 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 04/18] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
Date: Fri, 21 Feb 2025 16:55:18 +0100
Message-Id: <20250221155532.576759-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250221155532.576759-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB6238:EE_
X-MS-Office365-Filtering-Correlation-Id: c65cfbd8-cf88-43b2-3617-08dd52904e3b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?hCsndrisc4bLmB7fP6M2vOTcOoU+mkkiCNffqwkDYUwtX7WkYnxXrGCB30rt?=
 =?us-ascii?Q?VS470zb0P+J0pb8W2vuTNEONohvV6i0ch6bOkc1lr6kE9M/tWWh/iDAbOiX8?=
 =?us-ascii?Q?SPaNnBNLvKb7KfGABqHZWo6Bgm9sIDXdtd3FILHMvA52nEE15qEyu9FJNl1h?=
 =?us-ascii?Q?pM5bX1dLtiXCxPFYG4LBzoGjhRFxRjwAIh1rEY8FqVyA/nRhHXN/ucFV/NH2?=
 =?us-ascii?Q?mcsFKyqks6qYahFgcsgc0QL8FTnqvKiRFi/VBao1l/dlY/Crs+QphlHClk/o?=
 =?us-ascii?Q?ykNtFlRxQW352yaUY9NZjzDBYZDoDgfW7ugh/TnAtJ1ALOuH2ZUpgfgV8K3d?=
 =?us-ascii?Q?IJMXhdHdx1bD972WYVwd1bIxnuLr8o2T7Wl+BrL4EbvYxcyCwEicnqEvrLsC?=
 =?us-ascii?Q?GmCuWfHQ4VIjqxx69ju3ZBZe+RWmJR/tLZWfQQ9KzUoEZND00ViVCXXBTXgh?=
 =?us-ascii?Q?SRdTA8J4BWzbKzkYevnO5QhD+gydKi1HPVfc46P+UIbzD4oOpRnWeLUIH4qq?=
 =?us-ascii?Q?n1dUwd+xM/xE8oa6re3dbt6JG4DYsq0GPTJgZml5FCQlrmWorauURpEGuhi9?=
 =?us-ascii?Q?QwMlmFqlpJQQ9FVy8jHuQjvbMbXna5vcqDVUe9MUYnMgnIC9o6xV8uwUpSBW?=
 =?us-ascii?Q?ho4NzN8rix5gUdOXq+dtNzSrcQjIAu5C2w2CgUK2KXKCFgQArukr6nQ3lMZJ?=
 =?us-ascii?Q?uvUbCgI5n0oRsRv8UIiEvvF/gpJciY/OFXNbuS/B0vQ9SkBveBH8IooAHVy8?=
 =?us-ascii?Q?aKGhhCLreEvU78/Ji8AfDswxOP+8B3yRiTWFm/NkMEjlNUMUx00MGHR/qR16?=
 =?us-ascii?Q?FCqTJamYv6lucbT3C5C8FOqkcq1sWmkJkrhKOf2Xj2TYfTCL9J8PKEAQJg3T?=
 =?us-ascii?Q?Wxez+XQV/OIcQUUKPENKaU4IqOnI5DziHT5Vv4lT/m7GUP3FTpIfx5P+ktEm?=
 =?us-ascii?Q?YV/G7V5hlwegeFsmGBQRR3sbiGE17vGXjZtC1Zi1PKwuAbb78G1mCX5Lp4qc?=
 =?us-ascii?Q?SVMN515qsdPcYyeGAgzXEfh8M4A+0UFsy5hhO8kW2ly7JLKXjlYJCjTz0TVI?=
 =?us-ascii?Q?FD9gkSa814PubErOkGaBWY50YV8ms4BOjMY9rb/WHxyGjXHl/jH0d88nUV3C?=
 =?us-ascii?Q?rPJz7D5QIYLX4kb/7Idn/c5RSwDMiJamd4HAPuNzVjzDFOxbUABdJiIiTG6p?=
 =?us-ascii?Q?8ZNfP0A3/QFnk+KFxSDO4s2Gq4ukwd+aGLJYHm+d5XZnBFL9bA/1KJv7P3Y+?=
 =?us-ascii?Q?hCGSNUPoBPMwiPLhB+kJ5Pbhg5LU5fVWuVJ73hP+xbFuANEsPHhpKx4Irkcz?=
 =?us-ascii?Q?wpUtKhnHOF1wtUZCqXQstpVQUIuAH9G6KQjXRzDyuDOP14OZgSRmOFAWFvuW?=
 =?us-ascii?Q?oXKD3W0NqN+w7t/zWRpPdU//QS+b3k7qLVMiWF0mwewYlgvCyB93QGhmsKKZ?=
 =?us-ascii?Q?0EL61otWv4j5WAQYKHSP1xtTh2CPAUZs?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?jxPS/dGFmSneKX7HMwZNDFdZzJ+szgmcLX3qE8eJUNwjABxByzmNIeg3ANl+?=
 =?us-ascii?Q?J8Z/x7ovhkqs3RoNJ7gbaoJKnbZrXffDexXQsryjIfBnScbEM8cyDVdivXl0?=
 =?us-ascii?Q?+Ql7YUrgXPJskiHWyscG/aA1/CHvNUu4++Xa7bqt2YlNUhmErGP9FYdMhYRu?=
 =?us-ascii?Q?gFpzo5naOGF27E4o3XFp9vX5ZxvlNRYbh29ieiYeMXp7OeP1ZCRTcV9w8bPy?=
 =?us-ascii?Q?poBAy9YyABojkY8+9XDhrADUkDbq46tRToZoG7JP5KJ6dY77BEoeJzSWmJ/5?=
 =?us-ascii?Q?3OiJgAOqCQajYC0wUMDGMY0EEkvoJJHGn1fW52B9V2+q8fgLXryoFGQUC6j1?=
 =?us-ascii?Q?rHushyzxU62+VmFQ67pcPEvfrS9qLQ0wpDhRn+XeWWuzEoaegRiFbcxNIN7K?=
 =?us-ascii?Q?nz6Z1x30NsRdn0lIpB1C1raLh1E9U8oCcxfp8xszEJFEjwHS9P9krrFGpQoz?=
 =?us-ascii?Q?QkECXedl/IW6WMrHP1zmmIDnX940fOYKORNIW5ZPz874tJk2y3Qoyz5Y0cD3?=
 =?us-ascii?Q?eJwy6mRI+F1vh/JSCwx7trzyhXwcZ06Ub1LxrHnUmlxL/3LUE1U3hcAkV5Dr?=
 =?us-ascii?Q?nj6BL2ssFgwcvHqSKFKIk+lcIuV9COz9Cg1OFSjUGdPI41R5wtG/ISjQ/JKr?=
 =?us-ascii?Q?KOYobqsM9hGJ5jEliEHnPDFNr+Ig1I5mcFj4GjgdMLW3aMlhP2L+vzpp1gDR?=
 =?us-ascii?Q?fODOLXE32h7i6pOrjg+q65aNHO739L0ZkZOb35KkHAWdEh74HbkJHCybKekJ?=
 =?us-ascii?Q?48fytqCgVXOWuNIFWMhgFWWMifiyl1FmKNWbd41griELET0gEMuJSH/CAbWF?=
 =?us-ascii?Q?B9AmWA6vNCMTBsHFBCu3IDchv4YTnfYirfRhSlL6zvloWZbmbBQIkHxr505L?=
 =?us-ascii?Q?mGpBA+F7M1ZKRdSSF4S9mx/drAFaYEV1JuCMV6fDXlFFQxgvS2+jylLDtXUt?=
 =?us-ascii?Q?agvZe0zNLrEw/YOBjOf4NUokdTwCv9RAd956S3AUUzKiYG2lmdUwUuw1nPiB?=
 =?us-ascii?Q?ko8n4Q6+VGANQjuyPu1RE9WcSfktqlJQBzld01Pox0IjBUfqykF3KYbuMdb8?=
 =?us-ascii?Q?EFlNvfZTrQZgJTxNiFL5StbqImQqeTB9Y7IddHfCaW5klSj1CQdRopr2xpt9?=
 =?us-ascii?Q?z2LyvEPS2CfNBJ/OOqp41jgK7Mlrm6tJdJZRq2uu92RRzTO31raJhCZ8M9uU?=
 =?us-ascii?Q?mSEHQtWf5s1bmtjzfqgsvhN8F/S5f+1pstLNEh3DmNJztA+Yo2B2W2YOaN/P?=
 =?us-ascii?Q?/WiU+uRMjD3lLY2uPFvh3b07aqn4+OUBUL6Zzv4ySScysSz2u3s5Gfte/9ys?=
 =?us-ascii?Q?6Oj5GQdrsPFBIa9H2MnEe4FoXxecA0pE3UCbS2tCbbvK4WOfKTTjaCFpY2xX?=
 =?us-ascii?Q?HmTLateu0JqWfL1qi/wV07j1a2XtZiL6GdXf1aM3yVZkhdlz+UmnYnf7qnnd?=
 =?us-ascii?Q?2cR9Xm+LvgUNbmJKyy8rfh4cjS6V12MCbcWmfumaNuJYWObNfk5FHsV9Rnrx?=
 =?us-ascii?Q?P9gln2Wd5p3mHkZrGVyqAa9FaB2aIAqsCz6r59mECj2waMmd++fdHqGg3cEY?=
 =?us-ascii?Q?W/eQr7RSVWI6o7gzLdxiwjEVdkw55NzCQgbqrHnQDvDMrdXMIMrmjJ9X4jY/?=
 =?us-ascii?Q?RnJTrCfMcJxmF51biLuCBUM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c65cfbd8-cf88-43b2-3617-08dd52904e3b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:56:30.0973
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4/myV1TLUbNHGiEOxRxhtX3RAsnJZExcGr3SdDXOKybIXYGazF1Vp/tvkZrmHAS6wOJUyoypEtULGJ20danChpRb1jPD57XGvU5EFQg9wLArB8Oeyom4X8tnPOppW4sC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 31 ++++++++++---------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 881e910dce02..948f1917b830 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -764,10 +764,11 @@ static const struct media_entity_operations rzg2l_csi2_entity_ops = {
 
 static int rzg2l_csi2_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_csi2 *csi2;
 	int ret;
 
-	csi2 = devm_kzalloc(&pdev->dev, sizeof(*csi2), GFP_KERNEL);
+	csi2 = devm_kzalloc(dev, sizeof(*csi2), GFP_KERNEL);
 	if (!csi2)
 		return -ENOMEM;
 
@@ -775,28 +776,28 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
 
-	csi2->cmn_rstb = devm_reset_control_get_exclusive(&pdev->dev, "cmn-rstb");
+	csi2->cmn_rstb = devm_reset_control_get_exclusive(dev, "cmn-rstb");
 	if (IS_ERR(csi2->cmn_rstb))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->cmn_rstb),
+		return dev_err_probe(dev, PTR_ERR(csi2->cmn_rstb),
 				     "Failed to get cpg cmn-rstb\n");
 
-	csi2->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	csi2->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(csi2->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->presetn),
+		return dev_err_probe(dev, PTR_ERR(csi2->presetn),
 				     "Failed to get cpg presetn\n");
 
-	csi2->sysclk = devm_clk_get(&pdev->dev, "system");
+	csi2->sysclk = devm_clk_get(dev, "system");
 	if (IS_ERR(csi2->sysclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->sysclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->sysclk),
 				     "Failed to get system clk\n");
 
-	csi2->vclk = devm_clk_get(&pdev->dev, "video");
+	csi2->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(csi2->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(csi2->vclk),
+		return dev_err_probe(dev, PTR_ERR(csi2->vclk),
 				     "Failed to get video clock\n");
 	csi2->vclk_rate = clk_get_rate(csi2->vclk);
 
-	csi2->dev = &pdev->dev;
+	csi2->dev = dev;
 
 	platform_set_drvdata(pdev, csi2);
 
@@ -804,18 +805,18 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	pm_runtime_enable(&pdev->dev);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_validate_csi2_lanes(csi2);
 	if (ret)
 		goto error_pm;
 
-	csi2->subdev.dev = &pdev->dev;
+	csi2->subdev.dev = dev;
 	v4l2_subdev_init(&csi2->subdev, &rzg2l_csi2_subdev_ops);
 	csi2->subdev.internal_ops = &rzg2l_csi2_internal_ops;
-	v4l2_set_subdevdata(&csi2->subdev, &pdev->dev);
+	v4l2_set_subdevdata(&csi2->subdev, dev);
 	snprintf(csi2->subdev.name, sizeof(csi2->subdev.name),
-		 "csi-%s", dev_name(&pdev->dev));
+		 "csi-%s", dev_name(dev));
 	csi2->subdev.flags = V4L2_SUBDEV_FL_HAS_DEVNODE;
 
 	csi2->subdev.entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
@@ -852,7 +853,7 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	v4l2_async_nf_cleanup(&csi2->notifier);
 	media_entity_cleanup(&csi2->subdev.entity);
 error_pm:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.34.1


