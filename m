Return-Path: <linux-media+bounces-29886-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D01F8A83C53
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:16:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 061797B004D
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8CB420FA84;
	Thu, 10 Apr 2025 08:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="F6OWkE8F"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010052.outbound.protection.outlook.com [52.101.228.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91F2045B3;
	Thu, 10 Apr 2025 08:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272877; cv=fail; b=Lq5XcTd1f8HkZKuFiP1NfKCW8o7mG+3TvpzXTCmuW8n+fwdj3zk+3qaUWSEFlvVX0WU65txZPQFFbFAp00T01/nsQig4pURiU68bEOzSMkKDLC86ODLLgiDTj7AC0FpJFdlxcs8PLfjrr5dkZj8LNm4nelAINfxKPxo+1Sc87s4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272877; c=relaxed/simple;
	bh=8rPwWyKGU42djKH6MYxaE82TLxzNheQbC/s6A7rWfWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=tMzxB8ZbLp2Hb6GRwFXEQbUuBjz4Ilffecu+XujyQ8iOCLcozJl1uFLO54SoEKWSehxGRhWOGi6cjBg6YEKrtu7xsBWaYVKS/dwO7gTNRk5ez7L4Kw6NPpaGzFSUULbOLfsPMPO5SVWu8bdhbmUCBYqm0R3v8C95/I4XHsBQRvE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=F6OWkE8F; arc=fail smtp.client-ip=52.101.228.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g+lV9zOnzEIczwaYvSgyvhuJ98pdgxbxwwe+M+IsJTQ2db30bKE+R8Zgn5IgQF5MeyJnNbCQ94oId1XShBEUGazUJX8BqS0jSYomA17AQU2cnQ0w3T5Z0yfeuT73qj+kr+d7q8huFz6mktii0zjjQMhCBC+iorhI7y9Gc4CuswBGDaewF5hPKJ5HqKv+yW5B0OB6rLDD1VMSLzTNHabPHR6pLe1lvP4yNLo0XGF2e0ooRHcudVM9UmlLTokKSvxy/k8wPXdc/4ogb16rSDmccR/+4siLrkN/XivXY2c5y9GYtGC2qzk82CmB2YHdXQrt9fpSZEOAfuJRV2O5mAB08g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bM/KzKiGFXhJddIsb0wAEvP17kYlm0x8ySJwv+CLakc=;
 b=jjgVdS493l6VH7nIjEMfJfJgxulp+z2arX7GOHOiNG9Yv2C4F9UkRuWDN4EE3SMKRGC+72qNdf06aZDopQnqWerQg5Mr/OcGYnCJXP51uIO4gYziPLiVNn+7T0C9U5mCFi9WBa/JyAxjTo12UvLny11Gv9ykf2lOaxSyY8vGjz1W/hdXIYqCygmXlyx8pwh/uhEYri9y49OgvkLMM7rU38eE3GeeEcKxvpE/zYkUnMKwS+m/0XcqoWnKKTzmN2eGv4jvnReQWfqPU15E8hFl/RvWjE7Y2JEUhqwDN6y0afBkBoyf/cWYw+MG4UO+w1fIVpzCUtnD5LN3dfAv4sjv4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bM/KzKiGFXhJddIsb0wAEvP17kYlm0x8ySJwv+CLakc=;
 b=F6OWkE8Fym7lESDOl7tTYwMVjuO5Cvp39Pf9bMKTu38a5qy7qrbxllOJ2vd+gh1Up3zxk7Yn0hFmZTWc56enydcWncXHujBGaKgOvpuFfGl8skIoeM12vqNitP8sBwd3zfzPboQg7SO6c6IAKWYFk0HlqzSLR1cjWMoi5JayTD4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:14:29 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:14:29 +0000
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
Subject: [PATCH v6 08/17] media: rzg2l-cru: csi2: Introduce SoC-specific D-PHY handling
Date: Thu, 10 Apr 2025 10:12:12 +0200
Message-ID: <20250410081300.3133959-9-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: d1fa969d-66b9-4d3d-d137-08dd7807b6f4
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?PxpT+azhqI1udYycjQDs/5COtZ1vJbLdqNlmQWl8X7TLA+AdsgGSdP5B3kDu?=
 =?us-ascii?Q?QtTTUPavG6qtdtRkg06X/k1W9dlH43j5eR3evwkm4kZl8nlfIKDT1ZXN2YsQ?=
 =?us-ascii?Q?gA6fB6pOseTHFX6cOXndbEdjxxQP3Kop7HGuNVZ4DZIZk94rQN93MdlJ5PFI?=
 =?us-ascii?Q?e6N4lWXzQ9Jut6FtgQB5k9+6vXcqVILdTROmkAdgYgw424LFkUUPkw3P/404?=
 =?us-ascii?Q?sdojarQn2lK0lbbBzbu7yVSj/TtF7C9M0LnBr008paB40LiPzYJ13NgjBm6b?=
 =?us-ascii?Q?wbz/Sn99pOpQbsp8EReJzt31jNq+N4sJ1SHRlN6qkmYJOMauwcthSWE4qSTt?=
 =?us-ascii?Q?07IAVoADpBeFRYxzsbvpC33aNZpLeeeK5IZ3t8JYupS56Sk3L0F6bM9cOJZ3?=
 =?us-ascii?Q?ZUKP+ydTO9GdEyZpx4qu2snZCYNAiPYFPNDHblxbuIGQt7AnDKRtGQvCzUGZ?=
 =?us-ascii?Q?bRnq+y5lCjX7UlWeS1o6X5misq5qycJqfb1zgAgvrtqpYYMRJwYRIBX37r8G?=
 =?us-ascii?Q?XqCJHL2KhSI9dhsJCnJdJhI95sxG4BBXVL0vxWeQh5ksaw34eQ4VoaZCpBrk?=
 =?us-ascii?Q?x9q1xv9RbTsRLeotRnx8G4xtyB+PwEn30jVZetNr/AN1nlYHEAtpzyJByjXG?=
 =?us-ascii?Q?BDxQfW9YsJ+HJ0DxqyeRsoT4L1ya86EHZv1r7Ik43u6zGmHAM1qiJAMGMz0o?=
 =?us-ascii?Q?Ue3+IiD+uuE4VwQzAkWsBjm8WQO3SZxQJ9J7rA98nx9CqPN0d/mAv+/HNkFP?=
 =?us-ascii?Q?KpIrNg3BjoWEoiSXXAb96YWr8vKPrDMxjTCh1VcJBSliVWTPVtd4zd/1msCX?=
 =?us-ascii?Q?Zyp+1LekZabb5/4wv8Z1NbNzy2M8XcWky2L9Ih+rcWwueJS4sTTh8uiUd0+2?=
 =?us-ascii?Q?KpiTZMRPyYDO3cHJkdjRG61IJsMIc3DWVm3ul7Od4+ZJPww5DA8IOG24cwJc?=
 =?us-ascii?Q?VjC0NZEXXMei3E2/h3lcyi0TQEBsglUVPytjGO8JDxVc7FTtkyWbK4xQHYzB?=
 =?us-ascii?Q?JOZTqJ4P8iT3mPCJPYivMJMDKiNONrDGLPcbbDEj+R595VtLgNjUJuHqWlkX?=
 =?us-ascii?Q?H/IWLYHo8iHjJCPL/1lcRb1Xx+zxtEFZKc1hJn3Z/wqHqm2XY0cjZRYQ/MVm?=
 =?us-ascii?Q?z5gj76NNg7rl3uT4rrthuKyA7o5e3pX7POmfmbGv/5VRVZH1iFaCZ98iPWQo?=
 =?us-ascii?Q?ZFr+OKna0T2A6m8GPiZ4giJlrt2AksrpdFwCCzlqKAR9/dK0+GNKt+adLGsG?=
 =?us-ascii?Q?q5FqeO5sEtVVyW9qO2Mgjak5ADDMq7LWLBzpn9RoqodiU7XtwmNAYXlwJslv?=
 =?us-ascii?Q?IwTjVhxZ7djMK/pt/6c+EBYn3jSB3c8AefSm1cYXAi5muIhBITORCHhyGW1T?=
 =?us-ascii?Q?rgWpZD6QxhOuu/o1z1N9Y9itaNUQDxiGObnHQ/rTgINT6NK87YBwg6HfcpXk?=
 =?us-ascii?Q?Zb2ePWTa95lDzsfvQ3ANiIz4r4MChykafico2zfeP9VMQ6/FtW5zbw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?ftIYU8s280ldFnH3vKWLLqcCjxzptoA5RuUvE0wGjPvgn8VcofBks4fHMxtN?=
 =?us-ascii?Q?FZEJzV0QccHEWkLItOki8i8BcwZgejATtDG8CGVKDRZb4XgWfMcHeqNn3D75?=
 =?us-ascii?Q?snpUy0EvKRayWQCK517w3Ahgjutf7BG9UPHlf5A8kOPyF8utGcVAoNtj4Z29?=
 =?us-ascii?Q?x/Ox6nJ23Gc8p8awqs1GnyRDd21yhE9fzWny2w/C13S7bifxTBo7EjNaa/NT?=
 =?us-ascii?Q?y4TErm+E1754tT8Ep6nH0jNODPp6dnxQe3NYrHSyujfWZWDE47Od2sYVLCyd?=
 =?us-ascii?Q?o2y1IgpJuHrhy8cqvg/fxr3hBIYuTVscOh+cyyBl1X9poKNWjeXSDFjgNqvj?=
 =?us-ascii?Q?AlRxVpLltqhReW/0+g5Sd1SG3VTeIVbZgQmZppP1AoEXkeWBKShewvmuelzZ?=
 =?us-ascii?Q?zhj/hrrRN49EZVyaEWh7AN3RywyNg5e5Cuf7RPaIVxCV/54zUethv1AaJoDM?=
 =?us-ascii?Q?UtSEfEnBw1+BJjOC7okp6/z9uvD8YrODvODfKGihteWMTol9vXpo0i83ZFiJ?=
 =?us-ascii?Q?Vgh+Nt15qX+gL2QukqaMDmKuPF81I6EDtKfW+ChX8p9KmDm4ArmjPqfGbHAD?=
 =?us-ascii?Q?JD1WiyRvHTH+h73AVAEtfY2mkfhqIcf6neXhHXZ8jE4adHz+PMSwtC4Xl+gn?=
 =?us-ascii?Q?XsDeyvrlU7OGqhL0BJW+hcQZ9Qb77XFlEllZHPiz6rNTCFQZ+L8YmReWQ7PG?=
 =?us-ascii?Q?14GGm1xERGI9O8MdGUBkd4apvENSJAqtgwpw63EIpAaIFv6HBfchleAzsLhj?=
 =?us-ascii?Q?6eA0Rpf36I6qOe2crRpk+Oo4Yd0XpO0uUF7j4OGiA+OlcJ+1X9SU6WjBRkXm?=
 =?us-ascii?Q?mQn0DNIPKUMI0c1wnrN/Z2p6lPjUy/VNAKcdBzYZo16YU1dJ/Ezcg3BvtGtC?=
 =?us-ascii?Q?wgOCSersvrZIofoq97+vUkbWW8oznZX+zTZO5i5hUONdUHlhuNTp16pp83zJ?=
 =?us-ascii?Q?2k/z2hpr2unxppxURJar47tes2UKFAiJcDI5Eb/yzvRFrOC/5c3dlBGJWwDr?=
 =?us-ascii?Q?mFmz8WUzPYFX8aR/+XQSc8ECo1CFiWjzBZJ43rqHuU8jTNvIBVYb6BkCOoPc?=
 =?us-ascii?Q?PIrjdMdsGdFXC/WtW2RikLd6AXVaYxYcqb1C0P0B//jsY/KgQqJVGpsfwJf1?=
 =?us-ascii?Q?4MQTx2+YjsAm45YPZyVS6CdiumwBCug3abD+Ix8QT/UPY9eyGX3ri8mat/XT?=
 =?us-ascii?Q?v4iaRFosGU/eXdOGrD3C+4wdJ2ebMJ6LBD6LkZZl5XsD7mtvbK60w0T4mssG?=
 =?us-ascii?Q?BIfqpmhnBVUxsBLsGSKSu/qxrfRr/655Gk3hWG5311/bLZJYOF7EeXlS8I5g?=
 =?us-ascii?Q?UacnXOedfnOO1Q22NOer5O6Nn+06FnzHxIDYLc2Xfd4714KBI+3qSSb5ETo9?=
 =?us-ascii?Q?e4+3WolNioYPpSENwonPPciutY3vmqS8GtCntDIAnMXXDKVLUgH7x24kFIid?=
 =?us-ascii?Q?1ltq0DAterbyILvKcds6iUZrrPxZqoxN9BnTNiWFnUOBbg6LkAd59s6HAEYD?=
 =?us-ascii?Q?WEoB3rwUEmUTWI2QpVkF5RyyfSqmXQDLO+spRNdCajJP/meiWEDByK8HbgvE?=
 =?us-ascii?Q?z6ndWR5imJMxKGNnOLbpZ0QtFJQw1cNls3IncHStORPtXXYvXe4AbV3maCna?=
 =?us-ascii?Q?uuU2nzovs0rpm6vqGdxyWSw=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1fa969d-66b9-4d3d-d137-08dd7807b6f4
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:14:28.9544
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ava7NNQ0PCksMbVDQWFvGoUY0sy70M2ZvVgIN04AiJQ7rT58c2f0yqQNYKL1GbZXTZmXOhUNCkXqpOrgH3bKygcFoGyiRSkIyMmfv7x2j5HBvWFvr0dUe0nDO0q1uUJC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

In preparation for adding support for the RZ/V2H(P) SoC, where the D-PHY
differs from the existing RZ/G2L implementation, introduce a new
rzg2l_csi2_info structure. This structure provides function pointers for
SoC-specific D-PHY enable and disable operations.

Modify rzg2l_csi2_dphy_setting() to use these function pointers instead of
calling rzg2l_csi2_dphy_enable() and rzg2l_csi2_dphy_disable() directly.
Update the device match table to store the appropriate function pointers
for each compatible SoC.

This change prepares the driver for future extensions without affecting
the current functionality for RZ/G2L.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Moved rzg2l_csi2_info below the definition of the rzg2l_csi2_dphy_enable()
   function as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 24 ++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
index 4ccf7c5ea58b0..4aa5d58dde5bd 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-csi2.c
@@ -107,6 +107,7 @@ struct rzg2l_csi2 {
 	void __iomem *base;
 	struct reset_control *presetn;
 	struct reset_control *cmn_rstb;
+	const struct rzg2l_csi2_info *info;
 	struct clk *sysclk;
 	struct clk *vclk;
 	unsigned long vclk_rate;
@@ -123,6 +124,11 @@ struct rzg2l_csi2 {
 	bool dphy_enabled;
 };
 
+struct rzg2l_csi2_info {
+	int (*dphy_enable)(struct rzg2l_csi2 *csi2);
+	int (*dphy_disable)(struct rzg2l_csi2 *csi2);
+};
+
 struct rzg2l_csi2_timings {
 	u32 t_init;
 	u32 tclk_miss;
@@ -355,14 +361,19 @@ static int rzg2l_csi2_dphy_enable(struct rzg2l_csi2 *csi2)
 	return ret;
 }
 
+static const struct rzg2l_csi2_info rzg2l_csi2_info = {
+	.dphy_enable = rzg2l_csi2_dphy_enable,
+	.dphy_disable = rzg2l_csi2_dphy_disable,
+};
+
 static int rzg2l_csi2_dphy_setting(struct v4l2_subdev *sd, bool on)
 {
 	struct rzg2l_csi2 *csi2 = sd_to_csi2(sd);
 
 	if (on)
-		return rzg2l_csi2_dphy_enable(csi2);
+		return csi2->info->dphy_enable(csi2);
 
-	return rzg2l_csi2_dphy_disable(csi2);
+	return csi2->info->dphy_disable(csi2);
 }
 
 static int rzg2l_csi2_mipi_link_enable(struct rzg2l_csi2 *csi2)
@@ -772,6 +783,10 @@ static int rzg2l_csi2_probe(struct platform_device *pdev)
 	if (!csi2)
 		return -ENOMEM;
 
+	csi2->info = of_device_get_match_data(dev);
+	if (!csi2->info)
+		return dev_err_probe(dev, -EINVAL, "Failed to get OF match data\n");
+
 	csi2->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(csi2->base))
 		return PTR_ERR(csi2->base);
@@ -891,7 +906,10 @@ static const struct dev_pm_ops rzg2l_csi2_pm_ops = {
 };
 
 static const struct of_device_id rzg2l_csi2_of_table[] = {
-	{ .compatible = "renesas,rzg2l-csi2", },
+	{
+		.compatible = "renesas,rzg2l-csi2",
+		.data = &rzg2l_csi2_info,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_csi2_of_table);
-- 
2.43.0


