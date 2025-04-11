Return-Path: <linux-media+bounces-30043-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE041A86430
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:12:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CFE073BE846
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:07:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BDF92222A6;
	Fri, 11 Apr 2025 17:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="YZRYUtnp"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010037.outbound.protection.outlook.com [52.101.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1712521D3FB;
	Fri, 11 Apr 2025 17:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391221; cv=fail; b=Ze26IEVtYljam+aF20DbrQSmaEy99uBIpd7Pb5zWlfm616+eWuEfMwkhxqK4SB4j/WdVOsGvfFK1GNcBSe6CjYIVkEAfDJ943jcrB/Ptrr/sdmV5XN600o6g1b2GS76uhvaBes1qrrPm9hNdxkn97v49+DI31wx90IyaQb5oSFY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391221; c=relaxed/simple;
	bh=GwC/pnvXfePMeOSqvF7zTcSuX9PSb4MHw0m9fpN4+AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MbYBfhLODpBYll91s0Y00xs5Eu9FXHrUwZcxp3ThRcyv2/awHzTTbOCBOCydcsqwItjZ5Ushl7egCYcDvgXBx3eSaVaPCu4n+K/5ZIpKAfT1MnXwcQ1zD9V2t97j6lHy6Skk1BHv9Dh3oLq8WOHez/2u6CyiSCL1jB65PNwU7nw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=YZRYUtnp; arc=fail smtp.client-ip=52.101.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uWLLcf6LsCpAHxqc6hvGoqZo1p/4NgFR+29cW4cfgY6d3TCbu0Nha5qjOUScgClMaeyQeY4ahnaKC8nvuDF8+DHGeReU3dKQ6TIMiqpgkHmEV6GLmBM/3319275t3SxwoIrA5WW/r0ZO+FfycdJmEeSnvTMQP1LcW9YLxcqJk31MkabZFy8X/IHyaCI+Sya42PsyEG7DQQWSziSmVm+JwuoLsXG4MEOKnr640E6Bi4evEE/9XqsQUCh+jg46YD1WZgQMBDThMPng56vOK76kt7Xn8eUh/xA55GE2k0pGcLPgaKlLpTBuyLhqpM4cE6uc43fXH+b3Z4xUNyoijnoxIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a+sJ/VKw9i+wYzK6ThZ2MwoL2lHU0JgBemf00RHc+9E=;
 b=ZmZOqKpQeFzY5RgjXi9CUUL80MenLWVLwlddkRZkXSRV5EopZTY/xc427RFzT/WffW9ZikrmnMU+foIlZPfhbjIc2HqBs2dauGRfoZatu6oofrfYha9lHruTvRaK716rS7iuaelIzNOp35RThXIy3lDd0bj4DsMROhjQbmhQvi685yUyKIPhR8EmCAxr2BlP4rhc7gOeKt/Wy4gfhTwBhWqQ24h1lJDzxKm4fUOryZTGIJOABujHloKZKgLhHb2TC5l4Flkd199SE1cVeaBmg6yM86OSyqn3P7mK98oMmCIUtSTapSirZHrF7yfzW2AOo+xrdVnXeqSjAzSXQxc/BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a+sJ/VKw9i+wYzK6ThZ2MwoL2lHU0JgBemf00RHc+9E=;
 b=YZRYUtnpSJDdQvFcfFjWfQrvcUwbJQb1Hy2DaOZg1SYzurEU7krHmJ20f8vaflUsTqVQby5EHWztFavkYRQCvO0QQ+j9YgH6efcznSg4XJnZ5X1YYA9MUpi5/F17deuJX5vI+9vWCsA39i0KflKBxuj2kKZ4pDr34n4XXzYa+4U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:06:53 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:06:53 +0000
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: tomm.merciai@gmail.com
Cc: linux-renesas-soc@vger.kernel.org,
	linux-media@vger.kernel.org,
	biju.das.jz@bp.renesas.com,
	prabhakar.mahadev-lad.rj@bp.renesas.com,
	Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 01/17] media: dt-bindings: renesas,rzg2l-csi2: Document Renesas RZ/V2H(P) SoC
Date: Fri, 11 Apr 2025 19:05:29 +0200
Message-ID: <20250411170624.472257-2-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250411170624.472257-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR0P281CA0196.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::18) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSZPR01MB7963:EE_
X-MS-Office365-Filtering-Correlation-Id: b432e65b-ac08-44f9-e522-08dd791b4209
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?h6+co/JC29r883mJHrzxbXOR3r0rWzQOdwe2+1TI9bi8hhu9LqbtJOw/SZ6f?=
 =?us-ascii?Q?2UmMZSrcyXS4M/8WTp2xb+ZzGuqz+lobLiP/JcmrG9miW8aNHJZU0WY3JflH?=
 =?us-ascii?Q?hQqCXyKD7B1SxJDW1ZS3VGhqfz8nhNojqS0WD/8YnnEr6ubdP8Qg9FO3QHsS?=
 =?us-ascii?Q?0CNFK+rXcg6Xj1kEwNyTBbIENKUgHaM1RaMaINPuX/sVAxH9EBonC4tCnxLo?=
 =?us-ascii?Q?HedTRLgL58bFao7rFbJ3MhZPZ5wX8VYI+tzZCdrvQB1UDGXHTc/G6Edfrgko?=
 =?us-ascii?Q?3DaFBPl7Q/K0yeU4qPu4l0/SnNTRBc0rAeNTfUwOQRLWgjBsuHe0YbUPO4Nr?=
 =?us-ascii?Q?bThxqhjzIoby5N4d2+Fd+QjDI63ssgizLLPb2XUEVBDBtCOQnrHxSb14DNF6?=
 =?us-ascii?Q?N6bgjkO/ZcEeis2SqK3kFv2R1yAMm1g2LpDUyShUaqI+/L1+IlUzY8MUhcoE?=
 =?us-ascii?Q?ZIKyZwxspB1TR8gDBb9lkXxZ0/947Ww8YlIqSdMC1hpjZ2dCp4Xq+zVdsimB?=
 =?us-ascii?Q?cEdCjgu3Rs3gcx8FJ0L9XtqAmhPiDk+sM+S9b7I+QjoRYoi2e1DicDFK4JPS?=
 =?us-ascii?Q?M1VOKp7D9MYj+Ckds06nAiAZdnpvirE9Y6Ghl0xSHyDBr/BynYtR5Xcc1FJG?=
 =?us-ascii?Q?gDn6PdEAbQG0k6LtAxvav7o0//vtDI08UL/jL7effWQ3F1SxNB/bDtvnkXgl?=
 =?us-ascii?Q?Tu82/VClhrVSfjS2CvZwAiimJ1Arf8CvZpnOXJBD3SUdGXbVB0ZRJ//60eb+?=
 =?us-ascii?Q?F/Xlm0UJMqkAsUgVUKMqSTWnBNBLrGUaNwmGNDB4pMJ0qUwi0BYEnam3dWmi?=
 =?us-ascii?Q?iQf5nnfBdcDAK9a/4fbn8LIiIZmAlw95PI3d89hEcGLHIpaQTxo+lklmXb/8?=
 =?us-ascii?Q?ytTkbxmkXqBqJMs0dgEHgloTE3Qiyc1zDp/3pHc6gutxXcD6F40JTMs3F7Wb?=
 =?us-ascii?Q?NRFlE31DupdZi0hfIWEseyk1I71AbFWjuyTnrUbQ3nLvcBOTXWNN5UFMU/Ov?=
 =?us-ascii?Q?YNCL9VHHZRwe/sbQD/aL2OINAxzOt1xyHa6jRRaOG9Ad3VjATqvv1P622YPx?=
 =?us-ascii?Q?dQML40etsAgtx6ziOc+3s2zBk3vSRpRWmf7Q/2VN+NTDsLjxlvKJsjp0AWWk?=
 =?us-ascii?Q?79cVkkCp2fSrXypbCncv5OBkPG83zGiwX7E/S5IFmZhE+JgmjMb6SaU2yi+I?=
 =?us-ascii?Q?ESXpZu+37UAC2B/zfqzrMqzbtOyTBEQMVQ3npMZ+KMo23qSI6MSxN5L0n9iS?=
 =?us-ascii?Q?KXYNkwaq0D8V0yDA87Zdc4NB3ZqJqTHkLNvN2ZmBf0DFdRFMkxLDdILYvnEp?=
 =?us-ascii?Q?pm+BjunHQDxwcMy2DZqSfyZRYTOQzWkn8pgVlgDHeZBQfklJkO5QjrVttvnt?=
 =?us-ascii?Q?U2N4PRvtlSo7p7w7ka+m9eZJoQQfzWYhRV5AE7fhdHcWfMdMxcAPwqnp1PbP?=
 =?us-ascii?Q?dxRM+NMQF28CWT1Lvg9gO4n2W2ilQ3DcpB32T0y4IuW6z8BFQ83XaQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?s8y5YVe+CUU6sGGbb6PaGteuOqQvxw+lcMZ4UyjFBaRlW0JlmUsGQOrsLyNW?=
 =?us-ascii?Q?qYbn8C9Ky6/1TgGJrXBVfJmHVPowArkjEPhJeEzmFOs4OGn93T/lLU/mtT+D?=
 =?us-ascii?Q?BH5QpIWrJ1a2+q5LIbDl5ovmP9XHlCCcfQ5/j3214DwtqlpB03jyuXCp4v7s?=
 =?us-ascii?Q?IUMiRV57zQFBzv1YJgE92HUnacUEbtMRwHgcq6Jk9MMw5nZ5H10EwSAjXy2T?=
 =?us-ascii?Q?qLIoU211wMw2g7L4Xm1nnBzPR+LVnZ4w/N82ECtdkRoYB58CEhRtvpgvTHzV?=
 =?us-ascii?Q?+LvhZYA03rD0CRaNEURe5iX6XNcC70Pr6bxzF9ZdUAj/386OgBvCDyB+cmlB?=
 =?us-ascii?Q?xnQLJ1CMXt6tR1S+9+FDVHIoySiR0uFbIkXOAUyLhxMiBSACepEO0Cua4PF+?=
 =?us-ascii?Q?zxzRG5od8rMZi7UEnogYQITHhXLvQmtCMNLoO/Ecq4VjUe7L10AUy+mQKHrw?=
 =?us-ascii?Q?r9xTXtlLhnVlka4GI/emiIgNBLPKoi1xlUia3RCKQgCW9RAGwRQiQ/wD6sf3?=
 =?us-ascii?Q?15t5qQH09JDam/lC06ANXbLLEMc5HAg1LwO1eehwSjbXOzxFyo6iPKyl15D6?=
 =?us-ascii?Q?lYheY/Xdw2ndZVANz5Th7ke5N+pVaaWag5kByoIU/6FIdRcBVBkos+wf+SZh?=
 =?us-ascii?Q?DHDpJQUJ7ILSdKYDieD+4AzeRGCqnRNCelAuCc7Uf+qq3CmXm4QB6TiL8F+z?=
 =?us-ascii?Q?gJU6KdaVBjgEgIFDN+3Xy5qpoW8YcgHv+96q3p6Ag8HuVyNwsaQOe0aoZd37?=
 =?us-ascii?Q?tPZVDDvXeo4RTIndtnS8WeBnLX7VJ3ZYZTudUh1n2fzYp50uZohvtMu4oqSj?=
 =?us-ascii?Q?oecKsbg/5zuWOFXknzO5C8mQEaZd1kVRT3XAjJDOe2gRw6nFpUDwkt8vhmZa?=
 =?us-ascii?Q?2Eb+AdrdX7BNP9El5L04r0K7J9TcRuFMGQuHFnQfivY76ktFUZQQA01wX0B/?=
 =?us-ascii?Q?JmV28Nwy/UpYrIoTp20U3eoWoRDVb2vZM5C3bk6OMuixebfaCEm9HhVOvqWh?=
 =?us-ascii?Q?zjZtitR9cECgM01+a9mX+ulvnj1ekwZpZmcyH7C64LqK8KofN2kv98y1xSFx?=
 =?us-ascii?Q?iinpQkjOv+s9ZhrqTcydvcveew3HPPJOuFEIXfwkAV2WnGnvP9xUYNaBUr08?=
 =?us-ascii?Q?LyA0u1vA5jnGhvFDPJXtPztDaSzl0RSqH6b1GH046FJKtuMzeILVVwvSZFeE?=
 =?us-ascii?Q?2bvZScMiYmuhI8yGo5f5skg84RIvXyIJaI8MNBUx0Tikbcbagbr3Uy65xpVS?=
 =?us-ascii?Q?PhE2SlzeRafESfOrN2XD9b8b43RFVRW6VVhqUkZYdfRbMR1jkQCZQ1zeK0fP?=
 =?us-ascii?Q?TX52/wsIGgpd3ndN5mBQfvL1Kfdh54N6uGH1th3HfOhVn+v1hPhfqY9ENJ9h?=
 =?us-ascii?Q?JcpLW1OeZ/fxiFiUPPyPYtGFL/HcP/gGIIHorqoj0zAu0kJlN57qPdJY6713?=
 =?us-ascii?Q?fJzqbEgoXQCz1LpLGuG+vpUEl4eJzhIqG3QchK8eTliA5xL3ZwGPqGI2NexI?=
 =?us-ascii?Q?L8qKOoLsitG145itAIxGBalimRSBM6kMaVLQsQKny/YnqGnR9n8wwqPEpMOD?=
 =?us-ascii?Q?plUgZ8ODMpNfYfV2jnut/7AReYzAEaXfSY1j4VDVwJQTfCr755ln1lu9QJ9Q?=
 =?us-ascii?Q?BVcJ6IRyCXjgLVQpSHpmFHQ=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b432e65b-ac08-44f9-e522-08dd791b4209
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:06:53.8687
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KmqIyLGbeP3uo5mWG6G5E273MJADDOUslSgGLnNEWgx3gZyJpoRUm0oDFsMqlE25+DUfdipPrCUUWe5KbHrRveAyuBqb/X+/igOA5iSaH4znSFF0zk+ZEXlBzq5kcoRF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The MIPI CSI-2 block on the Renesas RZ/V2H(P) SoC is similar to the one
found on the Renesas RZ/G2L SoC, with the following differences:
- A different D-PHY
- Additional registers for the MIPI CSI-2 link
- Only two clocks

Add a new compatible string, `renesas,r9a09g057-csi2`, for the RZ/V2H(P)
SoC.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Dropped empty line as suggested by LPinchart
 - Fixed minItems into else conditional block as suggested by RHerring

Changes since v2:
 - Collected tags
 - Fixed CRU_CMN_RSTB description as suggested by LPinchart

Changes since v3:
 - Fixed CRU_CMN_RSTB description as suggested by GUytterhoeven

 .../bindings/media/renesas,rzg2l-csi2.yaml    | 59 ++++++++++++++-----
 1 file changed, 44 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
index 7faa12fecd5bb..1f9ee37584b34 100644
--- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
@@ -17,12 +17,14 @@ description:
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043-csi2       # RZ/G2UL
-          - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
-          - renesas,r9a07g054-csi2       # RZ/V2L
-      - const: renesas,rzg2l-csi2
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043-csi2 # RZ/G2UL
+              - renesas,r9a07g044-csi2 # RZ/G2{L,LC}
+              - renesas,r9a07g054-csi2 # RZ/V2L
+          - const: renesas,rzg2l-csi2
+      - const: renesas,r9a09g057-csi2 # RZ/V2H(P)
 
   reg:
     maxItems: 1
@@ -31,16 +33,24 @@ properties:
     maxItems: 1
 
   clocks:
-    items:
-      - description: Internal clock for connecting CRU and MIPI
-      - description: CRU Main clock
-      - description: CRU Register access clock
+    oneOf:
+      - items:
+          - description: Internal clock for connecting CRU and MIPI
+          - description: CRU Main clock
+          - description: CRU Register access clock
+      - items:
+          - description: CRU Main clock
+          - description: CRU Register access clock
 
   clock-names:
-    items:
-      - const: system
-      - const: video
-      - const: apb
+    oneOf:
+      - items:
+          - const: system
+          - const: video
+          - const: apb
+      - items:
+          - const: video
+          - const: apb
 
   power-domains:
     maxItems: 1
@@ -48,7 +58,7 @@ properties:
   resets:
     items:
       - description: CRU_PRESETN reset terminal
-      - description: CRU_CMN_RSTB reset terminal
+      - description: D-PHY reset (CRU_CMN_RSTB or CRU_n_S_RESETN)
 
   reset-names:
     items:
@@ -101,6 +111,25 @@ required:
   - reset-names
   - ports
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a09g057-csi2
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+    else:
+      properties:
+        clocks:
+          minItems: 3
+        clock-names:
+          minItems: 3
+
 additionalProperties: false
 
 examples:
-- 
2.43.0


