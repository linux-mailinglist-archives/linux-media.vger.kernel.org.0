Return-Path: <linux-media+bounces-27063-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E3A0EA46496
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:27:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A6603B5E21
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:26:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58227229B1D;
	Wed, 26 Feb 2025 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="CwualKRi"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011068.outbound.protection.outlook.com [40.107.74.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DBD225A59;
	Wed, 26 Feb 2025 15:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583545; cv=fail; b=BYUh52YyZ6v96laPaevmrUoHRO/pnWBxPaotfDFpcpXB6sWRg2lbdIUdVsqK04ltqoj8sJ42tXUOgYHybBSfOOBuH671Q0OOUVwRYtkRzC6pImskpAyynHyrMA1R7TBYrig7FxOd7cxfdM3VzTvG0XgpdLciyqX6VqPl6pSKfIM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583545; c=relaxed/simple;
	bh=OImP8N868sA9svr2gZKEzGmfQNaho8sk6AxuzXYzlMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W4i7P56MSkNfHYWqJGLtg28YhRQuHzJDZYJ7xfqbwjZaTR5V8txeClTt0SH7/+4PENglLyWPOIl/V0bQoSGsTSwsdOmWgtTWrdBb3uGOSOHQWvkBSIlZnRENsJ6IYf+69HWgEjmQjp5q0BYGPYdF6TkXogD45Sj2/puU5lfvuMo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=CwualKRi; arc=fail smtp.client-ip=40.107.74.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u3ckYOnHnEUXyJIu37Bam4gaTcI8sOXIATPQ9d2jIjr7pu87DmlFFLe8O0sIHf98jV/fVwOPKZVL8QTqn0cUEQp3AU+8QManwXlh/9W8iqaYCbo3i2kiIn5wvLudOTWw3Gc7M3NNQIxYY4L7f/SyuZ6wROv8lINpdYE6oohzJbEDs6fVe8wKk+bGNnmW7B+Oq924I1Gz8qa97JOLwmp2y2JSQX1B9OiWZXQzZC2QLvNWCt7JOVz7UvplCugt0Z9cWb2Jew5T1RhVAQ5J1i1y1VxauTqidvQBqEPr5Hd9e6fk1P3b+WJLTanamlCAlXfxZhv91lrhyGo9PhMVX1Gvyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PePgfD4GrURJ0pUGRT4e7YSpUFXsAzxMurwfw5TYoNE=;
 b=tt9/tQcbXyetxL61IwLAPhQysc54dBUmHebmUmRgfL2LjSI9UfdC24tab1en6o/TGxTe9vlObHa26Dm4qeaFUzejHGFU/JAV6tIoM1HNtEEhcAiHB5LGPDzo4ryWUcxIRFRlyUrMwTjr3d4Xe9yqwFOXO2vBQJnRDzx9ytutR8e/tohtiUb4N0ju+EQfCyD9ri5M/xsmNq4yz2xVfi2NiodMuChG7ntYW1t9dwpkmvHJlM111A8CHA/xGubZFzeGNb95oWy8h7UOOHQPtteTkbbIUTF+EVpQbZqBNp9uY1rlYKyTpN6bihoQvaf7T4on650bGNy0PUHzeC6aNU8lZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PePgfD4GrURJ0pUGRT4e7YSpUFXsAzxMurwfw5TYoNE=;
 b=CwualKRibUM6ItPobijCGp54FzSs9SoZf0l+AuvV14YUJhStSWOTX7jmMWvzHNg9bzKtzb7YWvM1w3WcjmigrZNenZvxcqXRzWzoGXLXdkYkCbFOYoOAq+NjrsZLEiV5zUPsH3GvdWt/mEzigho3QMstpKrjBcHPFwLeLWqFV90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:25:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:25:41 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/17] media: rzg2l-cru: csi2: Use local variable for struct device in rzg2l_csi2_probe()
Date: Wed, 26 Feb 2025 16:23:28 +0100
Message-ID: <20250226152418.1132337-5-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250226152418.1132337-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0073.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ce::13) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB10248:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d1ac6e3-0e96-402a-bcce-08dd5679d478
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?chWlmsA/oDiGWLUWqI/tLuesIERh65o4DEObnnsWQ203Ww6P4IUvMqA1+EMi?=
 =?us-ascii?Q?gmH5ktKYX46G95H931qqeMvywlxG7Aei9gYnRYPoMHbPIImOGS/G1609ilvH?=
 =?us-ascii?Q?MaMg4mQaE73mNqSFdiXbLrjDHYohIX7p4OrQ2h0tfA07GdLDHIA2C4ucSymC?=
 =?us-ascii?Q?SjmtbtQ0jiFXLrUPP8sDWN7tNS/Er+uGrxL9sT0KiheZXCtAZfgH5FCLwrwk?=
 =?us-ascii?Q?KzhdZuy/GzD7UkvhV52rps8Miw6Bz1+tRvxCSEvpsvWQphWcJ0X7tkhVxpAj?=
 =?us-ascii?Q?mkmckDdN86jfTKO+mdxAGn+bIfipGs6D4TJ42kxNfc3kUdooQalboOAc1Yed?=
 =?us-ascii?Q?pZtU00lJkCWr/+II517tbIh32PMRtFpUBMTQ3S72s1dKR5MIomA0LBj4fjMx?=
 =?us-ascii?Q?GZxHR2NrCAAifbvAE0OYzQQfseNf2eyAbl7BweTXFuXhMpRSDflFjZEI+60r?=
 =?us-ascii?Q?HbAzPfWCL7QBxP6wweIVx0msKcaggFubSBg/jrIzh42f7WDyz0On94ZJbhXd?=
 =?us-ascii?Q?L9Mw5+Iva+Nw0sIWkcXE/jRObwH//U1xeqwfTmtLvcu1NPhNgLFkXryEf6R0?=
 =?us-ascii?Q?LighgpxCvHb/UkSqKv6KESzXU5QUdK0NrVboqr0szQTfMBkYvkvOg33r/2j8?=
 =?us-ascii?Q?fP5O0tnVT6lor85DLXKFZQm/ZhTf9rPZsex1sWBfiBWMVpXivq7eXh49ANWK?=
 =?us-ascii?Q?irqQdZCzW1BT29oVSLCbrufJb1Pa7SteGjMuoM3AUVfVbYMkVZUnMBltJz76?=
 =?us-ascii?Q?+Np/n03l9LmNl3hRysQUBkHyS+9zp0tEzZTN6vpEHa4rPtAxYPMRL3vNOrf+?=
 =?us-ascii?Q?1xv9O73BVvge/83+nFmHodxTg8If6U2mD3QL3sv/1b7aJ/IQKvoWdDWT/ci7?=
 =?us-ascii?Q?FZB1F2ETkbNdjBl2ulwR3qIEAMY0xM0U6eQXpilYSG+g2IwMXcxIPRrDzCdZ?=
 =?us-ascii?Q?8bvSJ42/MmO0iLrjNpF2J3DY6mPPVwfJcVufYx7RA8IYMFGTrmGOQfFwr7p/?=
 =?us-ascii?Q?vM6TToZcTJJGApI5N9vSUkjFFtO4KI9MUsPLi8RElrI57hEdTDXQjEvO/gdr?=
 =?us-ascii?Q?uzWgrVmW39N5oirNr83RUkCtStnfZSSKqhJiNLRtbJTS1Tx5B5ohVCBI8Woz?=
 =?us-ascii?Q?FSPhbmtXO9Wng0KVJ0b8X8765NuhJbN0el4KLrzPTFFMkjqaZ9VKTvWE8Bmf?=
 =?us-ascii?Q?KhgEaV4kST0LVpjFCCVSugFdswNttp8Kr8Dw0zFwY812HYt0UFKWCqyOulMc?=
 =?us-ascii?Q?6Tdv/ig+hIqqnqSeIJuVJQCC9kRP12J7nko3pfs+RfqmLa0tIyP7Tx684SU0?=
 =?us-ascii?Q?j0pczX9qzDhcmg+iFMuaCa4HV1BRIkcRWM/njjOqsc7b1fZdZ0fw8SdmCwSm?=
 =?us-ascii?Q?9aoGwWESJtR/PjHc1NTl8RpQ3+GseW5DHmMyew6MCHt0bUjxs9cJF76PwAD/?=
 =?us-ascii?Q?AFmFPO9tnL/nLlcFa5+fbQkKWHIb4WlJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QztOnmlHZk9Ak3AdY4/4Nj6Vpf0K7CRteOeePpknSwblCl4usLOYINrH7WDq?=
 =?us-ascii?Q?tmCbFGI7p4edGqEUKFVwrMYYTh8hRa7xZL3xzQcg81vu21rkM7tSgDG+g4V1?=
 =?us-ascii?Q?UfQ/ifzCFFzTPz2CZF1yJYS9D1Hx/oZVhSI2OdTIZ4tfEzr6bYbViEsRp5+l?=
 =?us-ascii?Q?jB6Br4Ubj+ZtJ61qTcdnxnsr1HymbwZJr6cljCNTLg4gRYyXu6STbfyQF1s8?=
 =?us-ascii?Q?8EC50lGqzfrDNDBlkCZ85hCLyj8epnKqWMDLpWKgMcaPwiTzwWua0fvrh7vd?=
 =?us-ascii?Q?Vzmn0+ORrMAfxWsr7ojzSMmiikJWeUyRwOR7qi+UqMLn5gs7kBGsZweYzSi5?=
 =?us-ascii?Q?eR4CSY2dSp7P+6ZkUhvQtqsI4ZFQHrhOMUpaRRmlbbPsGRwQn1BZENF0UxjO?=
 =?us-ascii?Q?jyjogqsEj6LaLAueohhvQ7Rjsw81gPMvBZaYNNpUQbfVQtEPUjFLcR02yLE1?=
 =?us-ascii?Q?k1HQc/qdQegJ0pqT/H87frwFCyjkiEKlyUOCawM6T7n6kFoH+0+ywsB9duI5?=
 =?us-ascii?Q?pYsaJBDRXpd57rX4vS83amTlZNKOjnCAiktZ/ns0/D4/Z89UF1a3SHB3hUYl?=
 =?us-ascii?Q?qy0zJk4NPTb81d8qLriNwDapharTsZiAcQXyoAeUq2XTydb9W0pVbQbSyxzO?=
 =?us-ascii?Q?JMdPbOYYcgiSrSut3Wx0lL2uk0V7ps7U5RC5k0o7RMUDztSADyEcvwV7oeoZ?=
 =?us-ascii?Q?g3eRwGbheuf8bJoz7SKbKEh1tLw+lPjDaFXlpGwwO9/z2V/Tb0ZEc9ltp1Ol?=
 =?us-ascii?Q?kWy3D1YFa9EF0zYwQrdWb8s2jZ2hQyA7WJZIbOdLIe9rMSE7JtlWWKQn8sgx?=
 =?us-ascii?Q?oVEhp4904apD7kQ2C1aPByw1+GOCGFw0SqsnBVYYtfuX0MlIjlqXhj3sLWjV?=
 =?us-ascii?Q?CdL2/x+Q5wVbn+yOhpukJP8B4Dua90QzsOQYqOM9+dorj4jrDU8je6laD3bO?=
 =?us-ascii?Q?lOKjj50Cso5rm/lIiuVr4RBNrMyaKWULQ+rOuX3zi7npx/qO3AgK6tPZjApi?=
 =?us-ascii?Q?Dt2SjqKomy5bkuYjnT1Of8SDfVnx+QihjzEWZnEwecm2NoUDlCDcqqRBMnUE?=
 =?us-ascii?Q?jlhJfhefBqtm7+kGiv3WJclR9s82AVXSfJBGwOBaqxVZ3dRpCh4Cgrh+YZLR?=
 =?us-ascii?Q?gGDhu+5HQA/YiR2IeSgYV6vZhhbpqqqYbVZynks4CLXOAd4SCZEla26yYHYD?=
 =?us-ascii?Q?udRzNymCvEf2ghGQQ1+3ro7UulCbCVnaYUHf5+WCaXl/YqdnbYx5s1sOcshd?=
 =?us-ascii?Q?vxsqFD/Nfhl21cVMVty6T73uFG5gANX2MYSC6gQk0EmzjUKG8tXECxquU+NW?=
 =?us-ascii?Q?Zd21R3Cg3rDeyTtRmsXJ1PyViBULDZ9VYhwdW3rHbMH/c2o2I/qllTauZ6hv?=
 =?us-ascii?Q?P60Ph4ja++Kasj9M/2xvtqULRIp6M941oiEEsI5FwvBQyS3CnbPuEYceeAcb?=
 =?us-ascii?Q?wkdQRn7FxMNfHCL6E74aEQlrsGqAVOdf0oDBta5D6+RYSoHulVDZitSviPEw?=
 =?us-ascii?Q?qjbPtS0KeZmSjZ8mF4ROfaXta6NvH7fORkDlwj1kxWOkAcCUHWdElYu5Nytv?=
 =?us-ascii?Q?lrIJRzyUPI+yjNDd38XkHd8Z6UnYKJal6pEg9LnhKasLoDGHnGbSggnSx6yW?=
 =?us-ascii?Q?6RgU78LNlKxYe7s/d6RRktY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d1ac6e3-0e96-402a-bcce-08dd5679d478
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:25:41.3296
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lEm4kvQuOF5yzPtU3dsGxeDHRFR98as1WiYyCEDOaVco9wtgM4D3LBa7rL0o9rVGZkKHoc6ye49zksjSvLYaEgl18eyOP0UmYfB2sr21BsDKO9Fh5X2u6nny7P8Fxd4a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
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
2.43.0


