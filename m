Return-Path: <linux-media+bounces-30053-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC596A8643E
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:13:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2FCF04A6750
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:10:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D699E22D7B2;
	Fri, 11 Apr 2025 17:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KKRt/U8t"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011067.outbound.protection.outlook.com [40.107.74.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC252222AF;
	Fri, 11 Apr 2025 17:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391295; cv=fail; b=bQqR8Gv0qA5M9bhQNDVGXmXp/1IM2Fk/VrckcWIBQXbuRbdljAKeOc3GAwazZ8syTmWDKZTXrJYf9cSanqLwWQUIHmnd8KvJcdCxLrasbH5OTq2l2Z8kbEqrf5e+8PfdtXqBL2vUI00ugkhwYHf0La4wDyv31uXcTAK4SbG7C/4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391295; c=relaxed/simple;
	bh=+TZW9RoShTsUE6mVMrSr+1n1nSIV5nVD8JqMLXmkS1w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=elVzP4uBwsRId0uImYTj5VgKZDGgIFXxxUMDiIWhthuj0Lera3k6dl/OybynlR5x3T789JOUtt+0BaoC3m2G2YBJD/K6lv9hJmaV4sIiPL0JOL7fR6ZViYe8Pod+AIFuY6InDYKQQ0lBG5+9Z56kqL71FfX5fIbbLqGYebJmXRs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=KKRt/U8t; arc=fail smtp.client-ip=40.107.74.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhraJWTM4xB56OKpit6RdsoXQuLf/7tu8vJcrGCJAX+OQ+V2+D9jf2rke13gZ+K/6ox6FGvdjiJL9Oux+4QhWWYisp2Swqbf5LsIm5k+l8xL/rFHqELIkJpM5tq84BSH/qC00xrxkhxHxSNGw+4C8ylDF7S4nhSH3cmMQzt/WGvmeHSbEDA5s8ds3IB2yj/jsZHsoLkBynKvqpnAvQJbPIziMGzaYUmDkDlmnkPtKeE6hXaXqrl7t0fhfMuhgcZDGUHuik9g+1ELZGzhBioYx55VrzG04xdQ6qU8yScWq4zDcn6/mqFOPYdkDu6pK09MPvZTewQu90fQGkz2cgfZ3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QN9PdEajosYpUswI/NZBsSdC905xN8Im9lQEf1B5XsE=;
 b=cLYPonhzsXY6I7IwkDg4ze3E8+xlVYCGgqnbht0or8rqdzowjW8Eyt7PGx8VLM4QQ0pvyGzZKMEe9VYEHC6IartPm0yTZIYAuQ4FshBwhzLtvxqfZcoOPsKGgbRDxm1US42JX9dqujkpkTQJLls332YK2p1CM/5p8aJALrHI4iI1cMCwSne21QLphaktgx+75KTXkBQF6giFoIhl2C5oHkXDNL6WbBTaSktduSQ6jlpSfzRz/bZiX2gWKwU33Kd0ml/XCz9qMvaytwruj4loadw/31Bn2wjM7KRauJf+3qGlzJuPOYxT5e7TA1+htfDcLIGvHDpmDT+CGwinq4DdNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QN9PdEajosYpUswI/NZBsSdC905xN8Im9lQEf1B5XsE=;
 b=KKRt/U8tilNtfx85TXT+hVwezoWszEzisEdUnIBXm0K1PcGfJCAnGk4hKSmb6PXN/KecG/X2KwDUX+HMux78lp2JdoKNAvJSdLYUTQZGIY/MN7w+tEYP8UFihewNCoD0GzGSQ+1CFFI0W4nqVi3lTFqtER3c9EbGSEPFSrr3YKg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSZPR01MB7963.jpnprd01.prod.outlook.com (2603:1096:604:1bb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Fri, 11 Apr
 2025 17:08:07 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:08:07 +0000
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
Subject: [PATCH v7 11/17] media: rzg2l-cru: Add register mapping support
Date: Fri, 11 Apr 2025 19:05:39 +0200
Message-ID: <20250411170624.472257-12-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 48d8ca69-e2e6-44e3-2088-08dd791b6dce
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?K8A6lztXRWuoPAtNg5c/ZnXCS3lIekLfiCDNZ7V4EeHc4KLrbDocZkgqytIO?=
 =?us-ascii?Q?v7+EhOkm8NjqrwGiP0DLIYkPRfjuTOj0PAN9F0+MM6lD0XH6DQ4z5ZXnB/bG?=
 =?us-ascii?Q?aVCl8FiGUtv6uQ6VsMAywCUgb6waCH1QjEe+6AV8UkMX4Sqp2QTLNf4XN9mk?=
 =?us-ascii?Q?h9HVlsCRUymjDKPWaIr2PQK/UwCy/aUHPoXyo8+ThODyl2PnjGXesxgitjH1?=
 =?us-ascii?Q?HZ2VwntprGCLfr2250rJHFy8rFhbFKTNkoq1b1wCz0wnTOAhAZljL2l/nn3D?=
 =?us-ascii?Q?pjQ8hteWYNUaPq3N+I3JPATIrPvyagGGFZhW9X6l2MztReXHhZuf/MQF88Ga?=
 =?us-ascii?Q?c2hVM8Ekim1uVc4z+SEbFXhllxtAvcUN2zoHN0MdTjJoGngsWBFAarzK4mQO?=
 =?us-ascii?Q?X59gHSgJaZ/TRGLIYP906DkiGu/Xr9lMjIMIfbk8zMEPcVB6U3JWqyiZlcMG?=
 =?us-ascii?Q?6k46qOWJK1YMMAWguvguvRLGRrZXqamkklLKcX6s50oIgDra3rG6ZMI+nnep?=
 =?us-ascii?Q?ZUvZosUgMHwGhdZ2X7oSBfcBXuUAdHkCWHYNeG+vrmoKOY2rYLwZAXSvB1yF?=
 =?us-ascii?Q?xMRJFUSRZp0Z6hZSrnH1ksKmrb06UdTvY7144tn6IXo9TJfgtOPWmBTa6TM9?=
 =?us-ascii?Q?vlQoDQxytWJy4+WvfiY3rmw7l/e/pbNrNzoMg1YX0cmmmsx8pDkMM41sHf9r?=
 =?us-ascii?Q?bYR2ZEl/CRQt1Gv+nACnODUI4d7mqyFaWo5k91WonY9tzMCalmuhpKwSZa3/?=
 =?us-ascii?Q?4wFmZT4M+vIhQdd5Ro4PlfoWzstLxEV9ntnvzV5a5aOFAFMHFbP+vsb2zwR3?=
 =?us-ascii?Q?UDriaTN5HSdTQUSamE/SnpwHW1MoGK5eRroSnUmkh2/q2vdNRWMQxGOmj6y9?=
 =?us-ascii?Q?/qPBwKvUUiQsiMu7jeUcRKU7FQbc7gHJnrxX7puAHBezCeW2VM0Tj1Vtu3hJ?=
 =?us-ascii?Q?8D4oCD7ABe4Ai0qeH7DJkE7z9lDP7h28/NB5mSw55fXTNFbOCHcBhlUer2uR?=
 =?us-ascii?Q?U6RCwk5fEHrdYPg6Wcsh4CaWnqG2xGIbnvbPwYFs5x3bINv9tTN+bjXY7w93?=
 =?us-ascii?Q?ng4eEbGAAXH6mG5xDMh0G3ln9xZlVFytRyDfEIsKQcr8i/HulFh3KVhB9e5A?=
 =?us-ascii?Q?wToR3Kq+/IbDiNbPG1A2Ew3MhoJMzCAdEBEJxqQYz7pdqTYMZLbRuFNTgiR8?=
 =?us-ascii?Q?+u9h4ziOkI1UYhH+iBFXxAjRanvPRFtmHIIeAjzyhRBmvCGi3ytaD8DhuMeh?=
 =?us-ascii?Q?ygwAAu7yyVfx92kl7Wba6fmZOBCguoFeDtk4FXJpSbrSc7kPlY2vR2MUEDtY?=
 =?us-ascii?Q?bHKQ1nRbYksGGI2GrVUIh39nY2MAexDSIdb4sl8hv5MB93ENfZwhedP30Uuf?=
 =?us-ascii?Q?El5VA1Ns6n/CDReU2295fRw3shICznL4ykUgThgDAh2OMTUSn6aDRDU1DXc9?=
 =?us-ascii?Q?anN1JyF720J6ygiuSs5JvsZLSkMyi3Yfs8IF/mJdg520XzKcpy1YJQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?RIgRiuABeoI18KFT+M29kuw9JhqucSMnUqRq8TS1YgJsJFgdx4SqjKOlzNPv?=
 =?us-ascii?Q?EnVakCJYqMQ1VoU3rJ4gdAULnw1dVJqR1V2upky5T0KlLjJk/X0ascMmassJ?=
 =?us-ascii?Q?OdBf5hhgx9ZjvolNQy6ijTOj91sM+MLiWNlZG9CItF4slMhYIX3/EdguNnfC?=
 =?us-ascii?Q?BSQYqoRdi+6mXs6pBZG0ThLJ2ldqku3PxQVHTuSaKwp1SunxkJDgcxaEL4FI?=
 =?us-ascii?Q?te/9SFzXLJvDqC/ZjHx6MzuuXG8ItBoBmw+syjdZLqeouYNdwdBmZkO8Olzs?=
 =?us-ascii?Q?Oo/AhrMO2Q6kx0Qj4SU9rKBpI9eDoLsSLR0VOKYXjFK826/2ZZSbS3TMGP5B?=
 =?us-ascii?Q?eJHcCcZll4xuOp5+n+oMN6JZl065VZmkdGEkxnCITpWhdg9NDHeQsA4LgNtr?=
 =?us-ascii?Q?WfXHeYuvjNzfbdgNIEME6lDHxal2j4a6kWHll2wq+U0MZLfh3gpZKzfFleBw?=
 =?us-ascii?Q?O6L4R21DQZ/3gs4ql0YPFyjoOyUqBaz4/gR4MVo/vxv3iMmjcPfvh0bDhx4V?=
 =?us-ascii?Q?cJVtxr4PdtkLjo/jkPCcS5jgO75peXa32PqwRphnTFpXdKAoFspfO6akFjEq?=
 =?us-ascii?Q?l6nFQlkpm0Qbjw7c0TJ98Rv5Xj0EKjXxKCZXAu5oVk60vzi9QMbroVXjwU9X?=
 =?us-ascii?Q?ccNw5FpmvwyCVavHs7gTnXCCPqLMgVgV8gfHgQdBs/isfzWiiTADAJnpZJtI?=
 =?us-ascii?Q?hbgNQG1oY9WW1ahh6qI2hLdj6s8qnfec7GzIjnXU04AFfW/B0RtdNaoxO/9R?=
 =?us-ascii?Q?gAE+xHtGyZXSxqAcq1oGS+w6sn9n+2ra4/e/QzZckuyA5lHj4wEWlPsNKvS+?=
 =?us-ascii?Q?txpt6W1aEdqj4PUgBZ7fwypnvgCOd97b0KlQRq0N7WHeQ51uQTRcSsp7yH9a?=
 =?us-ascii?Q?dboAzDHyc6RRxrXVrNOHR+13535+EYeOwmIO5pTXrBmzsPUPXj4VuL167sAM?=
 =?us-ascii?Q?eft+/jT1HaXxUSfqFOZmf3L3SyPC3fpkIVkK4/KZKbhknCvpOxTv1wh3GmDt?=
 =?us-ascii?Q?e+ayabUc+2G4D1q8WGtgnaQI5fv/5aK9wDR8UMggX5XPV/NWeD2xBXY557cm?=
 =?us-ascii?Q?DJrW14LM72XF58horDMreLg2pgG/UzDY7TAkhUAr8+D3uHV1AIpzjjtIHCV9?=
 =?us-ascii?Q?azj2Y6AWW/JWZ9xanWnhXDFMhP39f5verR66yBplDjS+sPomeuFa4lz3tpMx?=
 =?us-ascii?Q?79hj5qCgGR4QGz6qUH0Gz5dPIr6CUengJLDuEHKuDjnnuYJGg4NlNgtq8B5J?=
 =?us-ascii?Q?moMGxDdiPmo0LDl3h19gueZAH5MBOnV2qsbiYFkYrFecBUhYZihEj5rOuvdU?=
 =?us-ascii?Q?nIf9k3dqkLF6wxhv2eWEyggpV7ua1hE7dYDOnMEfxxO7/UyqYWWVwpVxGvGZ?=
 =?us-ascii?Q?VCcyAAWdcZcRihiX8DUC4X5VZDZA/SHCl/5sssxRXfowaJxOQrJCX6+8UDtD?=
 =?us-ascii?Q?e1+hYBTQbxlisAr+uiCsaxS9A4VbKJpcN9cQKurJikViB6vQ3tnoSzcQJbL6?=
 =?us-ascii?Q?bKLUsI/oLB/bh/1LNvPImtmD7rhsRfKFHDnW8LnXMKFlXwEM1GhVPCEE+N8a?=
 =?us-ascii?Q?5fRyix/1MeIYluYPI51PXW7yWYGbty0JZnwn4VZ6L1PnviQU4+4xNb6vkmVM?=
 =?us-ascii?Q?wkTPUAS2kjf2Mss5wwor6KY=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48d8ca69-e2e6-44e3-2088-08dd791b6dce
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:08:07.0990
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EUb1BffwrBHHScSzU8ey24pGLtFUr1A5gh52rAh+KgxFdzANSDoo4rcOzs2ZoyD4oSnLLYYMwmvVOGDEYQ7Z0xhRwWIfz+bnogfA02QZPqurHyIbd2c4J+Re3FEwvunN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7963

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
CRU-IP that is mostly identical to RZ/G2L but with different register
offsets and additional registers. Introduce a flexible register mapping
mechanism to handle these variations.

Define the `rzg2l_cru_info` structure to store register mappings and
pass it as part of the OF match data. Update the read/write functions
to check out-of-bound accesses and use indexed register offsets from
`rzg2l_cru_info`, ensuring compatibility across different SoC variants.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Implemented new rzg2l_cru_write/read() that now are checking out-of-bound
   accesses as suggested by LPinchart.
 - Fixed AMnMBxADDRL() and AMnMBxADDRH() as suggested by LPinchart.
 - Update commit body

Changes since v4:
 - Mark __rzg2l_cru_write_constant/__rzg2l_cru_read_constant
   as __always_inline

Changes since v6:
 - Collected tag
 - Drop the cru->info check into rzg2l_cru_probe()

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 43 +++++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
 4 files changed, 136 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index eed9d2bd08414..2da416f914490 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -22,6 +22,7 @@
 #include <media/v4l2-mc.h>
 
 #include "rzg2l-cru.h"
+#include "rzg2l-cru-regs.h"
 
 static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
 {
@@ -317,8 +318,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg2l_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnINTS] = 0x8,
+	[CRUnRST] = 0xc,
+	[AMnMB1ADDRL] = 0x100,
+	[AMnMB1ADDRH] = 0x104,
+	[AMnMB2ADDRL] = 0x108,
+	[AMnMB2ADDRH] = 0x10c,
+	[AMnMB3ADDRL] = 0x110,
+	[AMnMB3ADDRH] = 0x114,
+	[AMnMB4ADDRL] = 0x118,
+	[AMnMB4ADDRH] = 0x11c,
+	[AMnMB5ADDRL] = 0x120,
+	[AMnMB5ADDRH] = 0x124,
+	[AMnMB6ADDRL] = 0x128,
+	[AMnMB6ADDRH] = 0x12c,
+	[AMnMB7ADDRL] = 0x130,
+	[AMnMB7ADDRH] = 0x134,
+	[AMnMB8ADDRL] = 0x138,
+	[AMnMB8ADDRH] = 0x13c,
+	[AMnMBVALID] = 0x148,
+	[AMnMBS] = 0x14c,
+	[AMnAXIATTR] = 0x158,
+	[AMnFIFOPNTR] = 0x168,
+	[AMnAXISTP] = 0x174,
+	[AMnAXISTPACK] = 0x178,
+	[ICnEN] = 0x200,
+	[ICnMC] = 0x208,
+	[ICnMS] = 0x254,
+	[ICnDMR] = 0x26c,
+};
+
+static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.regs = rzg2l_cru_regs,
+};
+
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
-	{ .compatible = "renesas,rzg2l-cru", },
+	{
+		.compatible = "renesas,rzg2l-cru",
+		.data = &rzgl2_cru_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_cru_of_id_table);
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 1c9f22118a5d9..86c3202862465 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -10,71 +10,77 @@
 
 /* HW CRU Registers Definition */
 
-/* CRU Control Register */
-#define CRUnCTRL			0x0
 #define CRUnCTRL_VINSEL(x)		((x) << 0)
 
-/* CRU Interrupt Enable Register */
-#define CRUnIE				0x4
 #define CRUnIE_EFE			BIT(17)
 
-/* CRU Interrupt Status Register */
-#define CRUnINTS			0x8
 #define CRUnINTS_SFS			BIT(16)
 
-/* CRU Reset Register */
-#define CRUnRST				0xc
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
-#define AMnMBxADDRL(x)			(0x100 + ((x) * 8))
+#define AMnMBxADDRL(x)			(AMnMB1ADDRL + (x) * 2)
 
 /* Memory Bank Base Address (Higher) Register for CRU Image Data */
-#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
+#define AMnMBxADDRH(x)			(AMnMB1ADDRH + (x) * 2)
 
-/* Memory Bank Enable Register for CRU Image Data */
-#define AMnMBVALID			0x148
 #define AMnMBVALID_MBVALID(x)		GENMASK(x, 0)
 
-/* Memory Bank Status Register for CRU Image Data */
-#define AMnMBS				0x14c
 #define AMnMBS_MBSTS			0x7
 
-/* AXI Master Transfer Setting Register for CRU Image Data */
-#define AMnAXIATTR			0x158
 #define AMnAXIATTR_AXILEN_MASK		GENMASK(3, 0)
 #define AMnAXIATTR_AXILEN		(0xf)
 
-/* AXI Master FIFO Pointer Register for CRU Image Data */
-#define AMnFIFOPNTR			0x168
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
 
-/* AXI Master Transfer Stop Register for CRU Image Data */
-#define AMnAXISTP			0x174
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
-/* AXI Master Transfer Stop Status Register for CRU Image Data */
-#define AMnAXISTPACK			0x178
 #define AMnAXISTPACK_AXI_STOP_ACK	BIT(0)
 
-/* CRU Image Processing Enable Register */
-#define ICnEN				0x200
 #define ICnEN_ICEN			BIT(0)
 
-/* CRU Image Processing Main Control Register */
-#define ICnMC				0x208
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
 #define ICnMC_INF_MASK			GENMASK(21, 16)
 
-/* CRU Module Status Register */
-#define ICnMS				0x254
 #define ICnMS_IA			BIT(2)
 
-/* CRU Data Output Mode Register */
-#define ICnDMR				0x26c
 #define ICnDMR_YCMODE_UYVY		(1 << 4)
 
+enum rzg2l_cru_common_regs {
+	CRUnCTRL,	/* CRU Control */
+	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnRST, 	/* CRU Reset */
+	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
+	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
+	AMnMB2ADDRL,    /* Bank 2 Address (Lower) for CRU Image Data */
+	AMnMB2ADDRH,    /* Bank 2 Address (Higher) for CRU Image Data */
+	AMnMB3ADDRL,    /* Bank 3 Address (Lower) for CRU Image Data */
+	AMnMB3ADDRH,    /* Bank 3 Address (Higher) for CRU Image Data */
+	AMnMB4ADDRL,    /* Bank 4 Address (Lower) for CRU Image Data */
+	AMnMB4ADDRH,    /* Bank 4 Address (Higher) for CRU Image Data */
+	AMnMB5ADDRL,    /* Bank 5 Address (Lower) for CRU Image Data */
+	AMnMB5ADDRH,    /* Bank 5 Address (Higher) for CRU Image Data */
+	AMnMB6ADDRL,    /* Bank 6 Address (Lower) for CRU Image Data */
+	AMnMB6ADDRH,    /* Bank 6 Address (Higher) for CRU Image Data */
+	AMnMB7ADDRL,    /* Bank 7 Address (Lower) for CRU Image Data */
+	AMnMB7ADDRH,    /* Bank 7 Address (Higher) for CRU Image Data */
+	AMnMB8ADDRL,    /* Bank 8 Address (Lower) for CRU Image Data */
+	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
+	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
+	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
+	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
+	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
+	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	ICnEN,		/* CRU Image Processing Enable */
+	ICnMC,		/* CRU Image Processing Main Control */
+	ICnMS,		/* CRU Module Status */
+	ICnDMR,		/* CRU Data Output Mode */
+	RZG2L_CRU_MAX_REG,
+};
+
 #endif /* __RZG2L_CRU_REGS_H__ */
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 8b898ce05b847..00c3f7458e20a 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -80,6 +80,10 @@ struct rzg2l_cru_ip_format {
 	bool yuv;
 };
 
+struct rzg2l_cru_info {
+	const u16 *regs;
+};
+
 /**
  * struct rzg2l_cru_dev - Renesas CRU device structure
  * @dev:		(OF) device
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index cd69c8a686d35..c82db80c33552 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -42,16 +42,66 @@ struct rzg2l_cru_buffer {
 /* -----------------------------------------------------------------------------
  * DMA operations
  */
-static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
+static void __rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	iowrite32(value, cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	/*
+	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
+	 * rest of the registers have valid offset being set in cru->info->regs.
+	 */
+	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
+	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
+		return;
+
+	iowrite32(value, cru->base + regs[offset]);
+}
+
+static u32 __rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	const u16 *regs = cru->info->regs;
+
+	/*
+	 * CRUnCTRL is a first register on all CRU supported SoCs so validate
+	 * rest of the registers have valid offset being set in cru->info->regs.
+	 */
+	if (WARN_ON(offset >= RZG2L_CRU_MAX_REG) ||
+	    WARN_ON(offset != CRUnCTRL && regs[offset] == 0))
+		return 0;
+
+	return ioread32(cru->base + regs[offset]);
 }
 
-static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
+static __always_inline void
+__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	return ioread32(cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	iowrite32(value, cru->base + regs[offset]);
 }
 
+static __always_inline u32
+__rzg2l_cru_read_constant(struct rzg2l_cru_dev *cru, u32 offset)
+{
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	return ioread32(cru->base + regs[offset]);
+}
+
+#define rzg2l_cru_write(cru, offset, value) \
+	(__builtin_constant_p(offset) ? \
+	 __rzg2l_cru_write_constant(cru, offset, value) : \
+	 __rzg2l_cru_write(cru, offset, value))
+
+#define rzg2l_cru_read(cru, offset) \
+	(__builtin_constant_p(offset) ? \
+	 __rzg2l_cru_read_constant(cru, offset) : \
+	 __rzg2l_cru_read(cru, offset))
+
 /* Need to hold qlock before calling */
 static void return_unused_buffers(struct rzg2l_cru_dev *cru,
 				  enum vb2_buffer_state state)
-- 
2.43.0


