Return-Path: <linux-media+bounces-29889-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B91DBA83C87
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:20:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B77463B08C8
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:17:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B50A204F7A;
	Thu, 10 Apr 2025 08:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="goGXqJL2"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010019.outbound.protection.outlook.com [52.101.228.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66FE020C013;
	Thu, 10 Apr 2025 08:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272907; cv=fail; b=Rpuo6x8/1SjA284+PtwS+ImucHV9QBxEfdRevISFnyUDVhzrVHQ1oAMMwYDb6/U5CM/4/rLEm4DZecGk/ZvA+JAnuajAWzaSshDzNy4p5iMZo7J2r6ld8bGrc0gmYveBxU+ltQA+IyMhI5CciL/CwY3dxp9cCRWW975Ur9LeAlY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272907; c=relaxed/simple;
	bh=yeRnwR2PhWlTlpmmTXH8PxcG0cTuV08ohn8P/eT1P4E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=A/m9TllhbZy6qOvw630qnl5xFKHwJU93Q2OKWAGUtddkiQkrkFUm278oJlCqE0j/l9eKKiGg3b8YINiqFpAtCUQezI8qTtAbVldC9JZtkVa6DJNH/GFdTDxZOnKgx6mLQDjEPD0ft21+rIJYy14F3+40D0nVHWrG5uBbVfWk5Qs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=goGXqJL2; arc=fail smtp.client-ip=52.101.228.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R8gr56WvkwnLIU0r8yyYRDeZFTgU01teO4262cbJVXKp38kahOEKRRxomB9/w9zIsrR2Jt7Ea4Iq49dqeo/1LAjs1kSXRCbW33qYI9PN3TYleyliAJJK2s8UhlmPKapb009BzTA2ZucwbvkmV1mHkqgLnvdxw+p4watPv2fLCW0mZRJAvvJNcE04aW94Gm+8pfCRYyAeM+ygt3rLd8tEew8iuwjVPDJaAME4+Rd170Wr6d25jM8A9NtFfC+Q/dTZuog9LQrHb6bV1T9TAPQNOweDbwO9x4o83XQZYS/y9YTpinUGJKJgDHRZuL+06VxEgHxmdb5OxgauVRnLZaCdtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoUVfWxmhXxIGV1LC4G+mxd+fJYCjAGhtOH5YWwk14Q=;
 b=HNc7LRbDgcX6fbDy2/6B9Kt5377aK2OTHNP7ZvMvXKMSeBo9XRzQIo1SeMz8mrX8HSpurgSGDmsP5Ju+brdaWONmZ9W5cfGfn661OuJESI4YF5MOJBcn9ifXH6xtmbTfv1qScWDpGKi834LGIf/rN7JIc6A6njugDkaKqOBDP0aEBodK4U4cMf5MyXZl3l1HrMvxhhY480MC/o3F0W1TRFZkaiTd9efy68GnU5mfeFeV6tjBSyYcjRqP8FPdeMhWz2adaNGc/hq+xCWrbMAl5zQnqndTTzs1YnfAdfdfemIhzySWsltlDT1d4QAgFiSF4ABT+Es2YTPliPr9etfb9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoUVfWxmhXxIGV1LC4G+mxd+fJYCjAGhtOH5YWwk14Q=;
 b=goGXqJL2oJuLN/wAH993bHO5vuqWHbjhm1NsxconmDpnMJya7vxMNLYdlTuBevmRXEiJiFboGrC32bUYtbgfZVJsnPe+Ubl8kgnRz0eSrl2zCqLzYSgLWfYIgBU3vCc5or/mG5c79SpzcztfhnmQQfEDf1Rg8dPG7llkIr2pGQg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:14:59 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:59 +0000
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
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 11/17] media: rzg2l-cru: Add register mapping support
Date: Thu, 10 Apr 2025 10:12:15 +0200
Message-ID: <20250410081300.3133959-12-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: ee5e9cdf-ace3-4915-bd11-08dd7807c8f7
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XQH1k8z0oB4Lvxuzf2bdGuaY08qzMGuBFc5WNTx6vV1FuI8Y9DEtLvWc5rs/?=
 =?us-ascii?Q?LRh+LA1kdqaaEZXvWcVQCaC59o3Q42ObjFGcdsg7srllh9MM1duCKCyYEEYE?=
 =?us-ascii?Q?2KO4MbvZbnMj+D+26yOnB8az6Hk3G1T0jhw436B6wH2FVT0JFSyT61snno9i?=
 =?us-ascii?Q?Pjh2A+VDCl1nM+rr/fhP45dM9+U1KNtfIvyRIKCaFDlYN6TvVLo61gxZopfF?=
 =?us-ascii?Q?kd0vgsl15XSNZQtprJnyBLFgXcDln6YVzv79asN3oodSCuqYT54EJ20YEWfZ?=
 =?us-ascii?Q?VIqv2FI0vLg2Vc6fnud1DIscQSoF2qWdoZIwyM4/EHb//Bg/qUgeztSJE1h8?=
 =?us-ascii?Q?pLPWbPnIx6Ajcozy6ACGmhJDhEcq1GMDJz+Lwb9HgorY/q6JFXXAw3Lc7Iaw?=
 =?us-ascii?Q?eoTEeAjjAgWYhsALhLaMzRnCJSn9iEONUZK673oIkYA7CC7Dk6QX/5QX80fK?=
 =?us-ascii?Q?BnQvidXBLCRzndM7FVil8oFXFbprxdMGhX+yt/Azp5IwnRyI2EuTw2xGj0Oo?=
 =?us-ascii?Q?rsAJGISrYbALm2yDUZniU/ub6nEUvZ0h6O18eB3pVM9qoe7sWvbxbwwRaKL0?=
 =?us-ascii?Q?EDb5qA6WGPpI/z9jbZ9+qzgLut6uf0XqqXBvcbtZGRuPRpg7KuwszsfyU3Id?=
 =?us-ascii?Q?r/azht8lrkT4Tf2a9l2rHPPZYhXgIn5KG2mdPLAJgqtqwPnTtlVu34g2KfzU?=
 =?us-ascii?Q?HZRYqfpj+emKw7q1kYwB69WvNmG1E4RhwZT1y+f66Ahk8EZ5pg+Z8i0zYFQq?=
 =?us-ascii?Q?eIbRefLG3qvLJ9+X85UlesISxcJ1ZW3KfU7y2ON8nIGXIdL/rBm3G9OOq5g+?=
 =?us-ascii?Q?7VGsOf1Ssr7e/KEgD39Cb2YTuqzaRk7nzIK5XNMtp0E8B8R1pUZ3NVN3gnFL?=
 =?us-ascii?Q?LCiVURYMpZ3Q9Uqx8H6q4FdhaOe4zx5aoW6T0aOGoET9iJu8hPgyVklmR29V?=
 =?us-ascii?Q?zWZkRy5J3/26znhbLWt/e6DKVYUDtPDSfWI+hGiEiEn45m9aLBPCXn3FPZe7?=
 =?us-ascii?Q?2xjka1xcZ+br5F+sVPzmRvJemrKW+AX2VJrZJoQTx5/IL9MTwsZ7JJctUYuK?=
 =?us-ascii?Q?PNOTP6rc/pfNLdlEmr09s933Lz2aaEaB7v/9QPUZIUdYksIoJavakVsBd66E?=
 =?us-ascii?Q?1v2KLniA41OOSsUpdI89+R414KQXKYUO5vBKO7HRZon94f5iK+SwPUV8AWSw?=
 =?us-ascii?Q?qkPlXwQwxjb+z52GrNimzl48jIA/bW6/jcvMRgPZOCqdS8s5ATYVxgwG8kZY?=
 =?us-ascii?Q?EgE3nxQiGbRHkwvJeY2XZ8l6pZ1tjoKFNJJwSBklZ1XTJk3vuhOlRXDVRuVQ?=
 =?us-ascii?Q?TZjRBpTDGbLWp3y0tg+JSgnJK7ou5BXcno8EhkgLRhaLo0H+EdxvHHCht6Mu?=
 =?us-ascii?Q?h1DVkJi1izYt8ruhT0EObYyuMLaZe/GtK4TTeRRkbCrbAS9DSC4qpwhYDKh3?=
 =?us-ascii?Q?CYWomEOj1lSpW05eleJNKt6hynd+BrF0vvtEhTfUiQBBaaUk7iaBXA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qzPttmbjM+PAZObRcjJhkK+/PwULDx3qTFoz2PFO68ufR8vK+G05Qg6x9fWm?=
 =?us-ascii?Q?2BfSj7twsQUOwFqLITsiY9miiEUVf/eO6ZWGonYOfQjX0XxxlQd4BEPkH+gj?=
 =?us-ascii?Q?WsC0Qdb7JE5FExCIl5v5/6E+QnydiI4vTh/ykPOxooEfU7TSvJJY0QuRcCXv?=
 =?us-ascii?Q?8IGy94aN80hqQYQmv6PFx5DcNF/pLnCIU1DWAPg+ryHWsRTTrmGCQ0x3Kd39?=
 =?us-ascii?Q?zXn9jluZscSkrUq2bRNYmuOuCr1wQHWYUJ5j5Tuqoj/ot52WtHC4G5b8xpQH?=
 =?us-ascii?Q?KHqaETKWR6x8ltMZaNPMTmzB5zmIqp+nIi9JQaznbB9cCIYZql4ictciNjLT?=
 =?us-ascii?Q?dCoo+wTbrUAdBiPPxZMkl9bOBZYE3QrDTr9Tkn3aqzYlWWy+QD63IRDXZ18I?=
 =?us-ascii?Q?8KCHz1aSEfpaVthQodVd0ng9x9TqFWcJlRMgBDQOmojxTXT0IQymXWL+fzod?=
 =?us-ascii?Q?VhFSeZFxOAuhlcIBNpsd2NoFY6OTYCWS2yL9FeP1oYOsPK2xq90qZBibaTGL?=
 =?us-ascii?Q?xvfeitwhMVeQ8xZEuBW0Meh/SyKQoaTnuHwRk8GwDM3+g0fbOFuvtlcKF312?=
 =?us-ascii?Q?Z/Flr3nKtEbGMtYHBQoSAq/XNFTcBg4pICcq9yAMjHprr3K8C5yK2BJbGqUw?=
 =?us-ascii?Q?GaMxKd1/QjH7K9SvmxJeWTHk9c7cDfu0Lxx/J6KMFZJRlZY1F0/IpdJWhy8h?=
 =?us-ascii?Q?zvOQMeZf5801w7Dt5rBg2EWtxeBKp/yT86hVyw26xAk09etDOfVmOw6eXa1Z?=
 =?us-ascii?Q?/96MaWKn/+rmMb6lPrOrO3TMYe0PWnGXCoQw10r5GieOjm9ODEIQ375f+qgA?=
 =?us-ascii?Q?hMceCTkqNgGWXrUh4gbVme7cDDs/5F4n8ou539hUiaW8Z4HQ+erw3Kfi5YeU?=
 =?us-ascii?Q?Hwu/8NG7M883x4zFTMNmN9OrsJyQEpC+hNc64DU4J8/B8dv0kzmkjv6b7IXK?=
 =?us-ascii?Q?weg6CNDZZtD9rWVtaJ99PxJVp66ltbgnUJxWYhXQXL1qFx7po5C2R8/LXyy1?=
 =?us-ascii?Q?GpXOK8N8oj+o5kOgReZiq4RU5fSzYuYr/iDKi3k9MH2DAEHCA/7+Ejme4VLe?=
 =?us-ascii?Q?oeItbFlHaK8zqSEvkKam8y65hWqKb7+UsZ7bHHtogKjoAsB5OwVEWFx6dtMo?=
 =?us-ascii?Q?LD6EtBAxJkalkoYF2QJMH0zYz5e1fSYA2Z8034QRIQjw7ViQi6uVenXxbqDc?=
 =?us-ascii?Q?0J0X/Y3lKl1OWPu5th/AumLsaZxApwAjrvKgpVcJ4Eh2HtRbymp0TO+4j/zf?=
 =?us-ascii?Q?CL48q9oKNESlHB+oQpqTT+it77qEBJpWQcX0Qt9dbvfpHFtjILnxU1Jjzn9m?=
 =?us-ascii?Q?EJGTJ1Gku4zlRo/XH+kcGAN+aIgHWHX09LNkC+fDxnUJ4s6ewtTFCrDh3lus?=
 =?us-ascii?Q?HtLOifnnJ+uGNd53pB+TJJ8rWjWrdiW6gIPlAUb/XjkjuHrSrXTvfYm0ct4G?=
 =?us-ascii?Q?gw1SBAfQJE6Joxc8i7pjcpKPUHKhIM1tiOHm8DPkXS/4guH+1gZI4P+4EoXA?=
 =?us-ascii?Q?8+DOXNh7I7sOwv58Wi4WFKkoZQAkV+GB3lnU1shdAkKfJ/neNlx8Od7qwFTp?=
 =?us-ascii?Q?yn7sTgttFESBkVBI838ofcpB/bIr06ytzdwJDnbN4vqOhUlrDne8F0zkPtp4?=
 =?us-ascii?Q?4bVTWhWd5SM2iZqvQBgzcJM=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee5e9cdf-ace3-4915-bd11-08dd7807c8f7
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:59.1639
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l1VeB+8af9/2HZ+RHj0gjyOUEE1PRYfL0TU6tywysciYiJJEGZU/+/KHWHNGXEjWgsS76JsOuo4M16TQhj1Neet0xPPnT/RguTWYMUvR1R+mC1x8w5gGPI3zRUYvT60S
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
CRU-IP that is mostly identical to RZ/G2L but with different register
offsets and additional registers. Introduce a flexible register mapping
mechanism to handle these variations.

Define the `rzg2l_cru_info` structure to store register mappings and
pass it as part of the OF match data. Update the read/write functions
to check out-of-bound accesses and use indexed register offsets from
`rzg2l_cru_info`, ensuring compatibility across different SoC variants.

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

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
 4 files changed, 139 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index eed9d2bd08414..abc2a979833aa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -22,6 +22,7 @@
 #include <media/v4l2-mc.h>
 
 #include "rzg2l-cru.h"
+#include "rzg2l-cru-regs.h"
 
 static inline struct rzg2l_cru_dev *notifier_to_cru(struct v4l2_async_notifier *n)
 {
@@ -269,6 +270,9 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 	cru->dev = dev;
 	cru->info = of_device_get_match_data(dev);
+	if (!cru->info)
+		return dev_err_probe(dev, -EINVAL,
+				     "Failed to get OF match data\n");
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
@@ -317,8 +321,48 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
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


