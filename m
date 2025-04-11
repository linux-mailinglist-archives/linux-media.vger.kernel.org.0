Return-Path: <linux-media+bounces-30059-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2D89A8645B
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 19:15:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EE24D16E4A2
	for <lists+linux-media@lfdr.de>; Fri, 11 Apr 2025 17:12:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E584230D3D;
	Fri, 11 Apr 2025 17:09:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="sEJpkIB7"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D3EC2367D4;
	Fri, 11 Apr 2025 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744391354; cv=fail; b=Xm4x0FEHbwKZcZqX2OY0wSfW6ayjI53JBiUPQU7FIcHRW7Ai8Nu+IElE/QrwX3t6peNFIAJXyfdZLr0m0K91Iy3dn++SJCZcsCrzh4pGku9Kc1lLHoHUomV6D9tI4f1t42wQYHdZ+giXa9NxaeP7cJbPrtKnjXxlYgH9DF6+prY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744391354; c=relaxed/simple;
	bh=vAWCdEk6xrDRsLUILz+qyZrsQwZ16JosdeCJdo21inI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z5a/MKF7vMkKff+X1B4n5K1BDDOwKqvLhkRmEwG84KXwdtHOdFzu4+3pz2G/j/Rw9A4/F4eWDHA4tB6Vm7seYjDFeFVPDJ2bpy/Qf/abBIAX/Lctkb7GRhl4/Tf6HZTVNK4lPUa7zGSp5l+KyAaiRrOGPyHO1AFY2L58mKE7bC0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=sEJpkIB7; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rzcm9nc/eqGnh5TfhCNSwDQiOTOI8wPq6NR0coaiHGGX5bRxZsqO0cvs4StganjpEjgFYYvQ5rvzmDLpJy5AJMAstfWMv+mV9zQ6AyRVWzEfmrljKCs3lLzVzaMhsqfvrAMfa9yXFhlvnDurM5RtfEIeoZM5y3iO+qX88DgzRl6RJYP3QsyzxshqFZOUMvUQu4RUj2npXZGpvwbervywIqlpTSU1Ju0FRs2UU2z9/cXbRxbDdNXEOvu4tTh1trIxa1UXmziDIwxfFoRrvGya6ZXkb0DY99AVtM89XqCJdg9j0nsGvEizp+pMCHq57LRrCo6SdVKEaT0MjkNgFK5ZsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1Wx5Hhk+L4Klafvo5dZcoLsZMGQF+IghaQxlXFIN1I0=;
 b=ErLSxbTgRNmQCVCFF8zjCs04TghAuOk3FpY0Lk8fDX3FMiwZb6hadgTGh33pf0NIH1OuWL/3GQYdCIh3sJ3Oe9Wkl9JwS1Ag2TtGyeCEGWm5XE1P4uz7nE9EL3uHRac/3qe0IPTYCJv3r08KSJLHhpfvc/QzmTzAjuRhBd0Dhwl42BxIcNuNZjjbEbRcuPYn/sSNjaFmKHuSegK789BMQQTkFxXu/R1W3vHwW06qMkWTn+6K/chNnuH03muYu9nN88gS+e20HyBdu5sSLWxbIuwW7XJVrr+2+L+zJxBk/tjCy3QibWoUPx7Fi47b4ujW8lPOSvQa4q4vyFpk/B5ncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1Wx5Hhk+L4Klafvo5dZcoLsZMGQF+IghaQxlXFIN1I0=;
 b=sEJpkIB7y9PCnw1jx0AGvb3oUaoSnomwplDW1e1iomTQLPIBDIS/GwMKw7qq5nOBxCaesK/UEneYb+oTabWf6CXm/r8i6oJSdQPDCJRf8gkN3DKuiWkrxU4fdsyVIl/DdvSNunXMag0IfnDKBCD5bog/ETfgm6e15vEU7e5DHHQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OSCPR01MB12643.jpnprd01.prod.outlook.com (2603:1096:604:338::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.34; Fri, 11 Apr
 2025 17:09:05 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Fri, 11 Apr 2025
 17:09:05 +0000
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
Subject: [PATCH v7 17/17] media: rzg2l-cru: Add support for RZ/G3E SoC
Date: Fri, 11 Apr 2025 19:05:45 +0200
Message-ID: <20250411170624.472257-18-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OSCPR01MB12643:EE_
X-MS-Office365-Filtering-Correlation-Id: aab1d4d9-3de8-4972-bdb3-08dd791b908b
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|52116014|366016|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?tT3rtboB2Dpl7d5njfzN5vP5zWNqHdenPMXkPknMxFfFefzjMf3V0QV6RH7v?=
 =?us-ascii?Q?jBduTs0LX9uuD5FH+QkQoUM2QOgJef6Q2sjWzV2jcoDBsWH+Kkpk4eHblUAZ?=
 =?us-ascii?Q?pQnqaZU6nUPV8B+vgp7eFyio43KTF0lSYZ6PemQd34hVVyjmhuFW4CPDqkRa?=
 =?us-ascii?Q?52B/0peZwFxdwD+xYsOKtrvZlKeGMF7s/f0xg96saEgMUGM/F3MgfFftGyWG?=
 =?us-ascii?Q?6UWWDYGmO/7EXIl8TdDJvM8270RyEZCpxHVXQM9ineS0admAmouWdejRxB47?=
 =?us-ascii?Q?uSTSuhCeX10UQVxJmuR5l9XZySBFNjiudL18xtH3WgCzBqFLKI0hycVRuKUK?=
 =?us-ascii?Q?lXOWH5zMFjC2Ov5emadm4noNhQlRDDrx2QnWnDeeVk/KB49B+6t+PUhQuiEU?=
 =?us-ascii?Q?tp60RY5mT3KVyMEQA8G1NeGZeQZMS0mMgyG3rr+77NpKu61W81/EfsnEVR0b?=
 =?us-ascii?Q?0FTXXup8Pz5Mbhmhf5EKvnivSsACkhAV1obXS1UNgGycae72w6qMg/VL8YEv?=
 =?us-ascii?Q?WfEKacZz7H6xoIKGe7rkP8OxRD+OsOz3ezx131FdgJKBZeJCsE9McGl7JSkK?=
 =?us-ascii?Q?fM/37navoaMKtUTdStBKc15cfdP/FaftPY+SqJv9h42W61160L2LcFgMKLtt?=
 =?us-ascii?Q?rctptuSL/7bi4RkJ7RxxUrUioa2TZjHYDf7wMzEVPJKKnDPugjIKpKH+4F/K?=
 =?us-ascii?Q?D+FoCpMIvQYyhl8u+btmWksn1ywbuRY0AV2scpkF1TqdsnxLk/rAg6CUZjEQ?=
 =?us-ascii?Q?wG8qCljXEuf2WxERit1iIHdMIFf/oRUv6QbOWTrHVxGPWKhp74cmm2UgA59+?=
 =?us-ascii?Q?UTgg6X/e7gXdSNQ9/il404ldmA2lepLrmdzDzQCn8tAOnTsp9KukyNfPCsbs?=
 =?us-ascii?Q?g7gmontJ4JmEifOHFOF/uhT4rNI34XAiouLG/yCm9Qp9OOAXgwHKRpv423Kc?=
 =?us-ascii?Q?zwD6alC5NfoGY6uSNZfqrxecq68w2xnOBtvrvFwB/lMM8LnW1WuoZGHjr8q7?=
 =?us-ascii?Q?6qpXXxiVo1I2rukL99D5W9KbUkrDiHSd19saxrXZeDhCalROcUlsJZJcNGCv?=
 =?us-ascii?Q?x4JFl2S7Ky664KhBen9mwxQMkFuQcN9VUlQXQ4NFnq97dXVPbvnKVYQMgyEC?=
 =?us-ascii?Q?LBiDzsR4Y+LBUADnhrwRPIDqRemSWAPzkH5N5m06qBCb/e9qpaZQ1ttFpp/A?=
 =?us-ascii?Q?g17yt3fKZWX7xoVbGhXFv8NH4cc7wtLSO5Qh+NsRj3A+KNtNxPdtBMVqkgsU?=
 =?us-ascii?Q?ALlBOoQ18IxIObxi2giayTkWnul2MYa29k/6H9/MOhfELgFu7Vo20Qe5cRNY?=
 =?us-ascii?Q?odSS/99HXmSSN6CIn1QgjtevA+R2MRZlPIu1VUyaYInMp8a1GGtjLmLN+9V6?=
 =?us-ascii?Q?5VcbsoqpOeNL1lhLFVFFwyGTmxNG4iF3+v5stPpnVj6fttcb5tW6zaJ/vO8z?=
 =?us-ascii?Q?Ep7+4eIAsLkPxy3SpSu04UTxKbBa1/iZ4Ri0MNNBgDVA5oY51DS3tQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(52116014)(366016)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?hjD38GYyzRyPtmigvBW5mx60y0wR3Dp2ldWkaZQP28NUXDpsAg1INImxQs44?=
 =?us-ascii?Q?GW6BorZrZZwleYkPl0IQRLZtAvjkmXfT19DedRJn9+mxccfHcD7SakyKTDIu?=
 =?us-ascii?Q?1O6QQeKRjvHm4xoJbWgn2tj6mAyBYofVo0rLaa+2cj6xioh1VQx+DaSkaTay?=
 =?us-ascii?Q?p1lTIAvkw7tG2/RvBfkigDKr4YPlS8lw4Q4Pt37HmvLtFn6X1x6W6z9oQS04?=
 =?us-ascii?Q?D+m+M626wFJJ7DXx55KakmMhC++BRatuTyDk/sjAodi9RogW+cB3v4JXIybG?=
 =?us-ascii?Q?OcsbpSRVDg3tA3aeH69+cdd+qh3jyVatHx5bc7L8ChJNnItcsKKrfS2z9U0+?=
 =?us-ascii?Q?NMe6RaPhfi+nN+MiEEKm6a1aaayyXktEkgBZKrAYRYYlP3fQt8ntRW9p3aqW?=
 =?us-ascii?Q?xr8C69TT/DKIbaOBjL5gZh+Jyh6op+Vn87ZOqbfaxV6zN1efk5AIBNIf50iG?=
 =?us-ascii?Q?vqthP47OLCaMDstEwfmr0EpF9cN0LH3+92O3LApseiwUuLXm9YltcMHa17Ao?=
 =?us-ascii?Q?6sXjt3oukAjIqTklUZ1AdxCncSXmyxnHQkH4FTXjgwBhEMENNOWXq+OKT7OT?=
 =?us-ascii?Q?exXa0WHJ6rgDiyAOqzWo3VFbQLIXzbtE128gDYT1xb5vTeyjeOFksJj7mi94?=
 =?us-ascii?Q?nDcAHqG/J4lGvP+8CAzTUkXwMBVnOiEqbZ5IbJm22+Vg7X+wRLb9drCuz2/O?=
 =?us-ascii?Q?0hijO0PAzgJsxCsBiYfgVo6TH9eLYHjl+JZ2zvE/EMEWlFdEO9BcbCCXEes3?=
 =?us-ascii?Q?3baRBVb3tTi4fr9uLy2deVbA1UhVlLXAFEnkFme+z8yVZO4YW8qat7TXbyEl?=
 =?us-ascii?Q?uP22MRDNTHOwKrnfxUmZkfDOiL2cHYrbqHO7MVbODx0kq0WNN2Zv3Qw48wo+?=
 =?us-ascii?Q?H417F91l5Xa6AYfVarlDOr4rXnY2CBbkqBrQDaQzFQ2coEkUAo7ExeksDmAf?=
 =?us-ascii?Q?BmsZUFWDEtjJl8a5Xy8JwctsAMlzgsh8ogpjd+CASSZneJnDgIhKNgGkkyem?=
 =?us-ascii?Q?Fj0QvA7EJ3xtvbwGByZRmmJzPaeHN7x9BHiYSA7wFUUVlSPx0o91xMAH82jH?=
 =?us-ascii?Q?Gmsnp470aRzskgjC21btNeGev8n4ZovLbv7F8NJ6EavGtOSK/erwpi5eb3u7?=
 =?us-ascii?Q?5kplsktZxK4UrsqtXO4nnxOVXlCD/3hpkVPikdIBq/ytopWWakQSYyMsmcEE?=
 =?us-ascii?Q?L2OPEI/TP5A+apDd6i8VkHkJjUfhkZ71IvY8qclzFPUllTmy0nssCWTfkPgf?=
 =?us-ascii?Q?Mdz6OWax2dvs8t0G7DX1JBlRkruch4Zx/NfhUcETcHZ57j30qmHtRbm9hg1+?=
 =?us-ascii?Q?YzSVUN8B88bZtzd/L/5IKq0Wu9SNUc0veI6s0v/46n1Iyb+k2zmjTzJ7Rxqc?=
 =?us-ascii?Q?8FbnSAfLQ0lZ2mbfi545vz4/6C8oTyMUjMXOTH/I4ke3KB73V2XGnLuD/B69?=
 =?us-ascii?Q?EjUzcvBK7IWojL/QrZr3cLy9LsuS8T3KPhcKtgv2Lf7U5OdUCdmJ/tmMAwLt?=
 =?us-ascii?Q?c1mSCmTDbPXUFz5dwfwLiNxD82JgXc8Y0wYL3vUoJopaABWjMYdr4ZGVsNAu?=
 =?us-ascii?Q?DupCaDWtZVb8XQkrXNnp4HfQm5X+nI+MmTfd/tNxYmybGRvDDvf6ffBpqtmS?=
 =?us-ascii?Q?BFpqVLBr0u12Yx3xEjdTiME=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aab1d4d9-3de8-4972-bdb3-08dd791b908b
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 17:09:05.6242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nW1iWHlSQ0CjkYVKa1GfxLfcvW/bfXue48qhRy0YKbAh+zPcu5LMMJQe9WQTyWDX+9WaANQ7OwbzCqtOb63Y1Xk6E/+vi5a5l9SRHiqT5rKkQvlRTxN9NhXAVPYQUknz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSCPR01MB12643

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

The CRU block on the Renesas RZ/G3E SoC is similar to the one found on
the Renesas RZ/G2L SoC, with the following differences:

- Additional registers rzg3e_cru_regs.
- A different irq handler rzg3e_cru_irq.
- A different rzg3e_cru_csi2_setup.
- A different max input width.
- Additional stride register.

Introduce rzg3e_cru_info struct to handle differences between RZ/G2L
and RZ/G3E and related RZ/G3E functions:

 - rzg3e_cru_enable_interrupts()
 - rzg3e_cru_enable_interrupts()
 - rz3e_fifo_empty()
 - rzg3e_cru_csi2_setup()
 - rzg3e_cru_get_current_slot()

Add then support for the RZ/G3E SoC CRU block with the new compatible
string "renesas,r9a09g047-cru".

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Use dma_addr_t with buf_addr directly instead of splitting that into
   cru->mem_banks (high and low address) as suggested by LPinchart.
 - Moved and improved stride adjustment into rzg2l_cru_format_align()
   as suggested by LPinchart.
 - Use csi_vc into rzg3e_cru_csi2_setup() instead of cru->svc_channel as
   suggested by LPinchart
 - Added has_stride field to handle soc differences as suggested by LPinchart.

Changes since v3:
 - Fixed kernel test robot warnings from rzg3e_cru_get_current_slot() and
   rzg3e_cru_irq()

Changes since v5:
 - Collected tag.
 - Dropped outer parentheses in rzg3e_cru_csi2_setup()
 - Use fixed array for buf_addr as suggested by LPinchart.
 - Drop the outer parentheses + used curly braces for the for statement
   in rzg3e_cru_get_current_slot() as suggested by LPinchart.
 - Added scoped_guard() in rzg3e_cru_irq() as suggested by LPinchart
 - Used a local variable for the queue entry in rzg3e_cru_irq() as suggested
   by LPinchart

Changes since v6:
 - Fixed indentation + missing space into rzg3e_cru_get_current_slot()

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  56 ++++++
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        |  25 +++
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  13 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 168 +++++++++++++++++-
 4 files changed, 261 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index e0f04f7e19dfb..5fa73ab2db53c 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -318,6 +318,58 @@ static void rzg2l_cru_remove(struct platform_device *pdev)
 	rzg2l_cru_dma_unregister(cru);
 }
 
+static const u16 rzg3e_cru_regs[] = {
+	[CRUnCTRL] = 0x0,
+	[CRUnIE] = 0x4,
+	[CRUnIE2] = 0x8,
+	[CRUnINTS] = 0xc,
+	[CRUnINTS2] = 0x10,
+	[CRUnRST] = 0x18,
+	[AMnMB1ADDRL] = 0x40,
+	[AMnMB1ADDRH] = 0x44,
+	[AMnMB2ADDRL] = 0x48,
+	[AMnMB2ADDRH] = 0x4c,
+	[AMnMB3ADDRL] = 0x50,
+	[AMnMB3ADDRH] = 0x54,
+	[AMnMB4ADDRL] = 0x58,
+	[AMnMB4ADDRH] = 0x5c,
+	[AMnMB5ADDRL] = 0x60,
+	[AMnMB5ADDRH] = 0x64,
+	[AMnMB6ADDRL] = 0x68,
+	[AMnMB6ADDRH] = 0x6c,
+	[AMnMB7ADDRL] = 0x70,
+	[AMnMB7ADDRH] = 0x74,
+	[AMnMB8ADDRL] = 0x78,
+	[AMnMB8ADDRH] = 0x7c,
+	[AMnMBVALID] = 0x88,
+	[AMnMADRSL] = 0x8c,
+	[AMnMADRSH] = 0x90,
+	[AMnAXIATTR] = 0xec,
+	[AMnFIFOPNTR] = 0xf8,
+	[AMnAXISTP] = 0x110,
+	[AMnAXISTPACK] = 0x114,
+	[AMnIS] = 0x128,
+	[ICnEN] = 0x1f0,
+	[ICnSVCNUM] = 0x1f8,
+	[ICnSVC] = 0x1fc,
+	[ICnIPMC_C0] = 0x200,
+	[ICnMS] = 0x2d8,
+	[ICnDMR] = 0x304,
+};
+
+static const struct rzg2l_cru_info rzg3e_cru_info = {
+	.max_width = 4095,
+	.max_height = 4095,
+	.image_conv = ICnIPMC_C0,
+	.has_stride = true,
+	.regs = rzg3e_cru_regs,
+	.irq_handler = rzg3e_cru_irq,
+	.enable_interrupts = rzg3e_cru_enable_interrupts,
+	.disable_interrupts = rzg3e_cru_disable_interrupts,
+	.fifo_empty = rz3e_fifo_empty,
+	.csi_setup = rzg3e_cru_csi2_setup,
+};
+
 static const u16 rzg2l_cru_regs[] = {
 	[CRUnCTRL] = 0x0,
 	[CRUnIE] = 0x4,
@@ -364,6 +416,10 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
+	{
+		.compatible = "renesas,r9a09g047-cru",
+		.data = &rzg3e_cru_info,
+	},
 	{
 		.compatible = "renesas,rzg2l-cru",
 		.data = &rzgl2_cru_info,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
index 86c3202862465..52324b076674b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -14,8 +14,13 @@
 
 #define CRUnIE_EFE			BIT(17)
 
+#define CRUnIE2_FSxE(x)			BIT(((x) * 3))
+#define CRUnIE2_FExE(x)			BIT(((x) * 3) + 1)
+
 #define CRUnINTS_SFS			BIT(16)
 
+#define CRUnINTS2_FSxS(x)		BIT(((x) * 3))
+
 #define CRUnRST_VRESETN			BIT(0)
 
 /* Memory Bank Base Address (Lower) Register for CRU Image Data */
@@ -32,7 +37,14 @@
 #define AMnAXIATTR_AXILEN		(0xf)
 
 #define AMnFIFOPNTR_FIFOWPNTR		GENMASK(7, 0)
+#define AMnFIFOPNTR_FIFOWPNTR_B0	AMnFIFOPNTR_FIFOWPNTR
+#define AMnFIFOPNTR_FIFOWPNTR_B1	GENMASK(15, 8)
 #define AMnFIFOPNTR_FIFORPNTR_Y		GENMASK(23, 16)
+#define AMnFIFOPNTR_FIFORPNTR_B0	AMnFIFOPNTR_FIFORPNTR_Y
+#define AMnFIFOPNTR_FIFORPNTR_B1	GENMASK(31, 24)
+
+#define AMnIS_IS_MASK			GENMASK(14, 7)
+#define AMnIS_IS(x)			((x) << 7)
 
 #define AMnAXISTP_AXI_STOP		BIT(0)
 
@@ -40,6 +52,11 @@
 
 #define ICnEN_ICEN			BIT(0)
 
+#define ICnSVC_SVC0(x)			(x)
+#define ICnSVC_SVC1(x)			((x) << 4)
+#define ICnSVC_SVC2(x)			((x) << 8)
+#define ICnSVC_SVC3(x)			((x) << 12)
+
 #define ICnMC_CSCTHR			BIT(5)
 #define ICnMC_INF(x)			((x) << 16)
 #define ICnMC_VCSEL(x)			((x) << 22)
@@ -52,7 +69,9 @@
 enum rzg2l_cru_common_regs {
 	CRUnCTRL,	/* CRU Control */
 	CRUnIE,		/* CRU Interrupt Enable */
+	CRUnIE2,	/* CRU Interrupt Enable(2) */
 	CRUnINTS,	/* CRU Interrupt Status */
+	CRUnINTS2,	/* CRU Interrupt Status(2) */
 	CRUnRST, 	/* CRU Reset */
 	AMnMB1ADDRL,	/* Bank 1 Address (Lower) for CRU Image Data */
 	AMnMB1ADDRH,	/* Bank 1 Address (Higher) for CRU Image Data */
@@ -72,12 +91,18 @@ enum rzg2l_cru_common_regs {
 	AMnMB8ADDRH,    /* Bank 8 Address (Higher) for CRU Image Data */
 	AMnMBVALID,	/* Memory Bank Enable for CRU Image Data */
 	AMnMBS,		/* Memory Bank Status for CRU Image Data */
+	AMnMADRSL,	/* VD Memory Address Lower Status Register */
+	AMnMADRSH,	/* VD Memory Address Higher Status Register */
 	AMnAXIATTR,	/* AXI Master Transfer Setting Register for CRU Image Data */
 	AMnFIFOPNTR,	/* AXI Master FIFO Pointer for CRU Image Data */
 	AMnAXISTP,	/* AXI Master Transfer Stop for CRU Image Data */
 	AMnAXISTPACK,	/* AXI Master Transfer Stop Status for CRU Image Data */
+	AMnIS,		/* Image Stride Setting Register */
 	ICnEN,		/* CRU Image Processing Enable */
+	ICnSVCNUM,	/* CRU SVC Number Register */
+	ICnSVC,		/* CRU VC Select Register */
 	ICnMC,		/* CRU Image Processing Main Control */
+	ICnIPMC_C0,	/* CRU Image Converter Main Control 0 */
 	ICnMS,		/* CRU Module Status */
 	ICnDMR,		/* CRU Data Output Mode */
 	RZG2L_CRU_MAX_REG,
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index ccaba5220f1c8..c30f3b2812846 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -85,6 +85,7 @@ struct rzg2l_cru_info {
 	unsigned int max_height;
 	u16 image_conv;
 	const u16 *regs;
+	bool has_stride;
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
@@ -108,6 +109,8 @@ struct rzg2l_cru_info {
  * @vdev:		V4L2 video device associated with CRU
  * @v4l2_dev:		V4L2 device
  * @num_buf:		Holds the current number of buffers enabled
+ * @svc_channel:	SVC0/1/2/3 to use for RZ/G3E
+ * @buf_addr:		Memory addresses where current video data is written.
  * @notifier:		V4L2 asynchronous subdevs notifier
  *
  * @ip:			Image processing subdev info
@@ -144,6 +147,9 @@ struct rzg2l_cru_dev {
 	struct v4l2_device v4l2_dev;
 	u8 num_buf;
 
+	u8 svc_channel;
+	dma_addr_t buf_addr[RZG2L_CRU_HW_BUFFER_DEFAULT];
+
 	struct v4l2_async_notifier notifier;
 
 	struct rzg2l_cru_ip ip;
@@ -175,6 +181,7 @@ void rzg2l_cru_dma_unregister(struct rzg2l_cru_dev *cru);
 int rzg2l_cru_video_register(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_video_unregister(struct rzg2l_cru_dev *cru);
 irqreturn_t rzg2l_cru_irq(int irq, void *data);
+irqreturn_t rzg3e_cru_irq(int irq, void *data);
 
 const struct v4l2_format_info *rzg2l_cru_format_from_pixel(u32 format);
 
@@ -188,10 +195,16 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc);
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc);
 
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 809c43d686e26..067c6af14e956 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -31,6 +31,9 @@
 #define RZG2L_CRU_DEFAULT_FIELD		V4L2_FIELD_NONE
 #define RZG2L_CRU_DEFAULT_COLORSPACE	V4L2_COLORSPACE_SRGB
 
+#define RZG2L_CRU_STRIDE_MAX		32640
+#define RZG2L_CRU_STRIDE_ALIGN		128
+
 struct rzg2l_cru_buffer {
 	struct vb2_v4l2_buffer vb;
 	struct list_head list;
@@ -184,6 +187,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 	/* Currently, we just use the buffer in 32 bits address */
 	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
 	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
+
+	cru->buf_addr[slot] = addr;
 }
 
 /*
@@ -224,6 +229,7 @@ static void rzg2l_cru_fill_hw_slot(struct rzg2l_cru_dev *cru, int slot)
 
 static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	unsigned int slot;
 	u32 amnaxiattr;
 
@@ -236,12 +242,39 @@ static void rzg2l_cru_initialize_axi(struct rzg2l_cru_dev *cru)
 	for (slot = 0; slot < cru->num_buf; slot++)
 		rzg2l_cru_fill_hw_slot(cru, slot);
 
+	if (info->has_stride) {
+		u32 stride = cru->format.bytesperline;
+		u32 amnis;
+
+		stride /= RZG2L_CRU_STRIDE_ALIGN;
+		amnis = rzg2l_cru_read(cru, AMnIS) & ~AMnIS_IS_MASK;
+		rzg2l_cru_write(cru, AMnIS, amnis | AMnIS_IS(stride));
+	}
+
 	/* Set AXI burst max length to recommended setting */
 	amnaxiattr = rzg2l_cru_read(cru, AMnAXIATTR) & ~AMnAXIATTR_AXILEN_MASK;
 	amnaxiattr |= AMnAXIATTR_AXILEN;
 	rzg2l_cru_write(cru, AMnAXIATTR, amnaxiattr);
 }
 
+void rzg3e_cru_csi2_setup(struct rzg2l_cru_dev *cru,
+			  const struct rzg2l_cru_ip_format *ip_fmt,
+			  u8 csi_vc)
+{
+	const struct rzg2l_cru_info *info = cru->info;
+	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
+
+	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
+
+	/* Set virtual channel CSI2 */
+	icnmc |= ICnMC_VCSEL(csi_vc);
+
+	rzg2l_cru_write(cru, ICnSVCNUM, csi_vc);
+	rzg2l_cru_write(cru, ICnSVC, ICnSVC_SVC0(0) | ICnSVC_SVC1(1) |
+			ICnSVC_SVC2(2) | ICnSVC_SVC3(3));
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
+}
+
 void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 			  const struct rzg2l_cru_ip_format *ip_fmt,
 			  u8 csi_vc)
@@ -290,6 +323,19 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
+bool rz3e_fifo_empty(struct rzg2l_cru_dev *cru)
+{
+	u32 amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	if ((((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B1) >> 24) ==
+	     ((amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B1) >> 8)) &&
+	    (((amnfifopntr & AMnFIFOPNTR_FIFORPNTR_B0) >> 16) ==
+	     (amnfifopntr & AMnFIFOPNTR_FIFOWPNTR_B0)))
+		return true;
+
+	return false;
+}
+
 bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
@@ -401,6 +447,20 @@ static int rzg2l_cru_get_virtual_channel(struct rzg2l_cru_dev *cru)
 	return fd.entry[0].bus.csi2.vc;
 }
 
+void rzg3e_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FSxE(cru->svc_channel));
+	rzg2l_cru_write(cru, CRUnIE2, CRUnIE2_FExE(cru->svc_channel));
+}
+
+void rzg3e_cru_disable_interrupts(struct rzg2l_cru_dev *cru)
+{
+	rzg2l_cru_write(cru, CRUnIE, 0);
+	rzg2l_cru_write(cru, CRUnIE2, 0);
+	rzg2l_cru_write(cru, CRUnINTS, rzg2l_cru_read(cru, CRUnINTS));
+	rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+}
+
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru)
 {
 	rzg2l_cru_write(cru, CRUnIE, CRUnIE_EFE);
@@ -423,6 +483,7 @@ int rzg2l_cru_start_image_processing(struct rzg2l_cru_dev *cru)
 	if (ret < 0)
 		return ret;
 	csi_vc = ret;
+	cru->svc_channel = csi_vc;
 
 	spin_lock_irqsave(&cru->qlock, flags);
 
@@ -601,6 +662,104 @@ irqreturn_t rzg2l_cru_irq(int irq, void *data)
 	return IRQ_RETVAL(handled);
 }
 
+static int rzg3e_cru_get_current_slot(struct rzg2l_cru_dev *cru)
+{
+	u64 amnmadrs;
+	int slot;
+
+	/*
+	 * When AMnMADRSL is read, AMnMADRSH of the higher-order
+	 * address also latches the address.
+	 *
+	 * AMnMADRSH must be read after AMnMADRSL has been read.
+	 */
+	amnmadrs = rzg2l_cru_read(cru, AMnMADRSL);
+	amnmadrs |= (u64)rzg2l_cru_read(cru, AMnMADRSH) << 32;
+
+	/* Ensure amnmadrs is within this buffer range */
+	for (slot = 0; slot < cru->num_buf; slot++) {
+		if (amnmadrs >= cru->buf_addr[slot] &&
+		    amnmadrs < cru->buf_addr[slot] + cru->format.sizeimage)
+			return slot;
+	}
+
+	dev_err(cru->dev, "Invalid MB address 0x%llx (out of range)\n", amnmadrs);
+	return -EINVAL;
+}
+
+irqreturn_t rzg3e_cru_irq(int irq, void *data)
+{
+	struct rzg2l_cru_dev *cru = data;
+	u32 irq_status;
+	int slot;
+
+	scoped_guard(spinlock, &cru->qlock) {
+		irq_status = rzg2l_cru_read(cru, CRUnINTS2);
+		if (!irq_status)
+			return IRQ_NONE;
+
+		dev_dbg(cru->dev, "CRUnINTS2 0x%x\n", irq_status);
+
+		rzg2l_cru_write(cru, CRUnINTS2, rzg2l_cru_read(cru, CRUnINTS2));
+
+		/* Nothing to do if capture status is 'RZG2L_CRU_DMA_STOPPED' */
+		if (cru->state == RZG2L_CRU_DMA_STOPPED) {
+			dev_dbg(cru->dev, "IRQ while state stopped\n");
+			return IRQ_HANDLED;
+		}
+
+		if (cru->state == RZG2L_CRU_DMA_STOPPING) {
+			if (irq_status & CRUnINTS2_FSxS(0) ||
+			    irq_status & CRUnINTS2_FSxS(1) ||
+			    irq_status & CRUnINTS2_FSxS(2) ||
+			    irq_status & CRUnINTS2_FSxS(3))
+				dev_dbg(cru->dev, "IRQ while state stopping\n");
+			return IRQ_HANDLED;
+		}
+
+		slot = rzg3e_cru_get_current_slot(cru);
+		if (slot < 0)
+			return IRQ_HANDLED;
+
+		dev_dbg(cru->dev, "Current written slot: %d\n", slot);
+		cru->buf_addr[slot] = 0;
+
+		/*
+		 * To hand buffers back in a known order to userspace start
+		 * to capture first from slot 0.
+		 */
+		if (cru->state == RZG2L_CRU_DMA_STARTING) {
+			if (slot != 0) {
+				dev_dbg(cru->dev, "Starting sync slot: %d\n", slot);
+				return IRQ_HANDLED;
+			}
+			dev_dbg(cru->dev, "Capture start synced!\n");
+			cru->state = RZG2L_CRU_DMA_RUNNING;
+		}
+
+		/* Capture frame */
+		if (cru->queue_buf[slot]) {
+			struct vb2_v4l2_buffer *buf = cru->queue_buf[slot];
+
+			buf->field = cru->format.field;
+			buf->sequence = cru->sequence;
+			buf->vb2_buf.timestamp = ktime_get_ns();
+			vb2_buffer_done(&buf->vb2_buf, VB2_BUF_STATE_DONE);
+			cru->queue_buf[slot] = NULL;
+		} else {
+			/* Scratch buffer was used, dropping frame. */
+			dev_dbg(cru->dev, "Dropping frame %u\n", cru->sequence);
+		}
+
+		cru->sequence++;
+
+		/* Prepare for next frame */
+		rzg2l_cru_fill_hw_slot(cru, slot);
+	}
+
+	return IRQ_HANDLED;
+}
+
 static int rzg2l_cru_start_streaming_vq(struct vb2_queue *vq, unsigned int count)
 {
 	struct rzg2l_cru_dev *cru = vb2_get_drv_priv(vq);
@@ -782,7 +941,14 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
 			      &pix->height, 240, info->max_height, 2, 0);
 
-	pix->bytesperline = pix->width * fmt->bpp;
+	if (info->has_stride) {
+		u32 stride = clamp(pix->bytesperline, pix->width * fmt->bpp,
+				   RZG2L_CRU_STRIDE_MAX);
+		pix->bytesperline = round_up(stride, RZG2L_CRU_STRIDE_ALIGN);
+	} else {
+		pix->bytesperline = pix->width * fmt->bpp;
+	}
+
 	pix->sizeimage = pix->bytesperline * pix->height;
 
 	dev_dbg(cru->dev, "Format %ux%u bpl: %u size: %u\n",
-- 
2.43.0


