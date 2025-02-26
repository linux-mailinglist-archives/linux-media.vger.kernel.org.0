Return-Path: <linux-media+bounces-27070-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB578A464BD
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:30:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5926617ED74
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0766822A1CD;
	Wed, 26 Feb 2025 15:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dktQMrsC"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011051.outbound.protection.outlook.com [40.107.74.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 362E922F151;
	Wed, 26 Feb 2025 15:26:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583605; cv=fail; b=kqHzgOgx0YewMTv0nYfba4IEkMB2Fq1BC5kXNCD/H+s3dX8oO9wz3rpb0tYYSIEGC1TGezOCw3tn2ZYdGcm2xqwe1TU13bEKox+qZ9AOYmn34OYQUCifl0OYp27pOu2kDW+RXcn5Vv1PKZcP01NH0886RfXkNQMLm8HZvA5alGc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583605; c=relaxed/simple;
	bh=RF13DkM6Q9CQ/7QlEkmWIR4ZREIFuwHvU3wNJOpyi+Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=juCkanefgfnKjtUoKeZ16/vkXR2hPaHuFQpzhU39oh5zU0cetAdouDELg7r2hBPRFYVDSnfKoMFJUPa5mEfL6BtYul+sunwYCW+KqPygU1+Oygmdi5eu7+u/MD7tMXo2cuBPsKznXk7km/AT/LNqH3h80gBI8JkgSHxZBKHkbfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dktQMrsC; arc=fail smtp.client-ip=40.107.74.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MI71DpNgiJMapW/G8Upuji4mqoGLTmu8HyyhZKSboiveINLO3M7Ol1tsxcMYY2oII0fMjEf2qM1iIRZ89Cm7wJ9uyKLAHXu8QXZ2rfKqqb5/SLAER48c3uI6tJgDecw9jm3hq/gOarhj40MdLI0Up00tJKp2HSJ6h8VQfx0k7weUnebCN0cjztWPTkkPhaIn/t6o+y88AfD8KC070yJgatm+pUfJWwatCJqljdvvD1ve0epOPxtDw9glcFtsRFeldmqzr+Ey4xuiar9nh/aG7QzWirwK3cT4CQxrIRKFMYB/YBVhdUHjmc4q8tZf+tsf7BKlQ1OiQGncZcyNy7kQKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLKpxNsBF5xTXAIuDGy5THwATi5YWhLTwHjytEbsHYE=;
 b=kqxwnpyGYQGtkoepSsEf7ul3yZGXGm2/gd6Y3GZrUtcrwhWyLo9WsxmHnZ1Fc9+UrOi1OgB4AjUDMV0VwDDUPeDBkp6+iD3QjtMB7pooppiT1eWiF/WvzoZ9QL51Xk+Bg51a4K1/JncQhFSfr4WxiIY+8DWgieKPKO/BzQypAROmvWYFBlaFr4IF6IRc8hRVMpAwmJYmnLFwZXdAAqGYUnuE9X4/ppR05HomHL4XxD1nhg6ArRX9BC6ncGjSyAjwEOcypGO7q91Y6c3E47hIDkljQXs+kJs2cyDqCZO0KDk5e3jWW/U51pxSNzNYD2ZHG3QfUDtxNFyFzALYN0Qydw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLKpxNsBF5xTXAIuDGy5THwATi5YWhLTwHjytEbsHYE=;
 b=dktQMrsC8vr7LxB4KSBhCXH/NJElmuC6vd6ug/Twk5huJM1ZvVM4gLY+yWQ8JxZDo79T4oZv6hikg+OkV5s0iLgxIzFIqplcyyT4Za/C78wnRWoB8k3Wzn9BT3A5P4BR8T/YK24yYI/ytwFoN3z5KlLm5/2clSAtruvIHdGu8lU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB10248.jpnprd01.prod.outlook.com (2603:1096:604:1e4::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Wed, 26 Feb
 2025 15:26:41 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:26:41 +0000
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 11/17] media: rzg2l-cru: Add register mapping support
Date: Wed, 26 Feb 2025 16:23:35 +0100
Message-ID: <20250226152418.1132337-12-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: bd337df9-ca19-4366-a8d6-08dd5679f7ff
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qdHbrnnJ7yNVOBnhTis/V8+QUpKpDFAdpMhFnicquEEkNbhTmaoZk1yCA7T1?=
 =?us-ascii?Q?I6o4JSojThr3GWf2peOqxi+3/ujfCCPgYnAB7FuAPF9v33+uxfmRiL951Xx8?=
 =?us-ascii?Q?j7gbEJGOXMwDFV1d7Ywf7xIMHOWpWhDIO9MCDX1iTCG3KH4JQTS/el2+SJZN?=
 =?us-ascii?Q?uaYdfJhLrSEHSfrk3f+4Nf+CYri+GavJ8FZIhZEUu3Wg6Dc9tTNHBl5bHQeo?=
 =?us-ascii?Q?QZrpr4RW7/Z8lHpNnC23rsFOcb1T80ZtU0SQlwdnYYUEpInf2VcwR06yzZMM?=
 =?us-ascii?Q?PDkZwnGespp4/XKolzcdKI92MgYvLu3Y38RZfQQno2vH45zxgTUURK8Pl/rv?=
 =?us-ascii?Q?M4hjPgexSqfnhxacoHy/J3euoD9IbuaUaBbiYy3jgJIPpFQzewMDPT2gdfw2?=
 =?us-ascii?Q?Hte2FAXbJH3FfPyXBP7yzibmwJrbWdGAH7YPd1ly4RUhBcpxdSWNkdQoKrcb?=
 =?us-ascii?Q?fgY7q2sKe22qNf4KzXEbsCAjgzEkiahkvpgqO/Zv3JBJSxpgttijdJ4NtbNO?=
 =?us-ascii?Q?6eGlIyOYpcKvLboWxWleh8bahWgqYFPNdLvo4C/H87shprXoWOVvbPHKI8v7?=
 =?us-ascii?Q?NzWd3mVYFaXHbA824tBZyJ8udOjcxDFPKx+j5NbVGIHTCj2oF3pvGQh+/Unq?=
 =?us-ascii?Q?vuKsMusaHWe984IsivjnaSjDXLaNtG5eFi5P5Ss/fVb7srGw0OyiB8lScOZl?=
 =?us-ascii?Q?kUQ0Np2GwCXBupDnexTowgdB3HXLLzv6Wkll76sinkGjupb9ZO6LJf21g6IA?=
 =?us-ascii?Q?0BjMPdgNkxJJpfaVG75rtG4eW/drergFHRYY5AMY6KvQIBf7pFWqPIaAud88?=
 =?us-ascii?Q?Aj/wG6t7/z7yiM4wLDx4zrs7FANjyslxYC4rdhemZ6KDo+zfW5AOOOxwFdBH?=
 =?us-ascii?Q?G5J4zbP6JNdThKXJH29GthwKPafpF7iRX0P8jNOgIwVPOFTHNibVlW7UnX9o?=
 =?us-ascii?Q?tG3lojDozg0DveKRkHUDQ7CK0zlx98Tsbj2hE2tSAZ8E03IjXH5wPw6YjbB+?=
 =?us-ascii?Q?nnfL2rJTuRp/VTEz+AnPJBjW0QV7V3BoJoDA40RNkDq79gSZtt43G4UgFWBl?=
 =?us-ascii?Q?njwKkbcQ+iBU09vW5HrTHHblmXXPeY57o5iSNh2Ok4a21aVtkPG/6MRpVkhI?=
 =?us-ascii?Q?7X+AFSxFkh9nficAdtmI6N36FjWERJ2QIjPye/VE4B+z1hBVbFe2/fVVbBeH?=
 =?us-ascii?Q?O5f7Bs2zBHxRfr4RfIH67IbBikSCSEBuv/7GGc1EPXw6rNBQbY+nLb4GKqTg?=
 =?us-ascii?Q?VaKBp5z86Og/hImE3A2zYK22nxOpwaC/xt3/s3wMxm0wVrZAmbNZ65HoGnL1?=
 =?us-ascii?Q?fLiPfXw+h8PsKG6bx/Tr1rRweQGKqU9x8Cbg3n/bYrf3NulqJQe866OR4XT5?=
 =?us-ascii?Q?8IYx7qpZQZlfT9L1xNueu32yEulFEPEd1keOkQ/gC3ncRcJNGth9BkUIkPzT?=
 =?us-ascii?Q?xxLBg94+XdYXcRfeKMXxH9tStcEZu3EL?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?toQE/AE4WyZdFXO8ZA7pURSMhfSb1huhZalcnFMvdPhESTm9hJbMxWcsPm0v?=
 =?us-ascii?Q?OR7FWmIBmoDwfMfOv3ZM3VFlRsIMCS+1YXpAoHO/21JAGQVYyPIVTxW5CHhv?=
 =?us-ascii?Q?brsFsRf8m3k4t16EB44kTkWFbtPO4zrLavfUQRUNQwb26015KdXrBnA9Kp0y?=
 =?us-ascii?Q?tX2bi+/cjEVaRJcaosk3lVuZJtz4X7z1oU/zL2h/Yg1Ezu0NLI77aWNjdoJL?=
 =?us-ascii?Q?CRfDx5eA7raj25wyFIetGMvUtzgRzV0j5ev5ptlVblrK9DIY7rWRhTmcYWVm?=
 =?us-ascii?Q?qXwLnqVuKcIpCtLP0QV+jyMegk7KDdsWtN6Wldl1HWVDgO5JYqP8iG/zFAAl?=
 =?us-ascii?Q?6lRJBJ9u+UFZJ90VlhiR5BrWryJD2TNuEncT83ElKwTOs+IEQ5ma+1+TvDyx?=
 =?us-ascii?Q?RAsl3Iqe32B+Gx7BPvzDWyXrFXdHYQ2MbNekEj2b2SlPuBGP2wnbAzAuCZUe?=
 =?us-ascii?Q?Szyym66stj0ubICp4gCLMwZD//aYtwy/1X6hbmP1U5o2PqsdtyBd6sxOuPjM?=
 =?us-ascii?Q?UG4S3n8dEJp1kEAEFvNonYz/CzpHkOn9MBO/8aP9at7UWx6Ph3U/F+TXF3bU?=
 =?us-ascii?Q?fij9NMrZR2wbgtL66KJLBsNdN4HEUgBhj1O0jl6ez8nCyNE3rmkMTV1Yh9Ci?=
 =?us-ascii?Q?osUGkxrDCXgi2r2LRwxKQsXg21zmdxKpCt5VxDyeAF0pvEWPgkIL1LyQkbXk?=
 =?us-ascii?Q?Z8Np3c/f4+PUqRea3//LNxWNM2MpGarMRhr2EaFql6R1hsuFnTz9vK3IaLWc?=
 =?us-ascii?Q?41hSmGktX08KmGPDoKqHF3IrSJZhdworfiZE1WAk5qJU3ZQmuYigR6YYqkbs?=
 =?us-ascii?Q?rUBl2LVKUgFQpRu2P8D/2RrqrXi1ScXZVH71bxdxZ0emlNg31ICEY6CXqbix?=
 =?us-ascii?Q?n3+Fco3VTCbFZPTgM1OecKPj4n1wA2ccpsx1WFFJiJkHBSijR8N7rjqihzXA?=
 =?us-ascii?Q?ca6kCju8eGi/kjsPytv7gLojNZobi3N19q8xwf8VPbU/qPvNiesyd9PYKwYE?=
 =?us-ascii?Q?mbPAIubyAbwcHFQt6q9wat2nYxxZeO6Tv2VWSKGu89IHXuQgu/wuwFHAeIkK?=
 =?us-ascii?Q?hUeE9AsI9W/PmbQtOWKKbgcUpEXeeAEn7FXxnf+5exmce+f9Hwv0V7HNStRN?=
 =?us-ascii?Q?C65o3ygPU9himtaVS6stucEcqEhBueaFynq6cjKPjm0csFDTl0B8nueozLH/?=
 =?us-ascii?Q?YLOBG1JTE+TvKMslZrxjVhFRXJrp7SqeFvmTqHHpHIAfNMEMw0njjg7iDzOD?=
 =?us-ascii?Q?OUBW11cnOfjLi1wANJoumaWAYMPMzULvt2QFGfyA0F+qH3UwLkytS+pxWKeN?=
 =?us-ascii?Q?m7r1eBP9B6Xj4E1A1kEgIgWCPIaLW/GCR8ePTW81kk44sZiCh3oJnHtfRmxt?=
 =?us-ascii?Q?SIvGL8oThBCRDeDI0mazydNgEFsla0r6cgB5M67c5ucf6lpkvkd8JRQxxxZF?=
 =?us-ascii?Q?MFvmFO1gM2AGnyYxmBjJO8lv4bTV56wl5SYHpf6U5vOBkSUbgV+Ki/o6Hh9S?=
 =?us-ascii?Q?6aHE5T6atBpNRTR7qLh1bUZU1ydRTCb/Q9cmppOsPGL6V+gb4ED4Vhczh7cv?=
 =?us-ascii?Q?RBk6iWdO0d/EGEGyNaKZRVY6ivByaHL3gK92clcVgi23l2sOmYlOoetxvKJd?=
 =?us-ascii?Q?OkQsHx5R7U4yzJjljLaBC8Q=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd337df9-ca19-4366-a8d6-08dd5679f7ff
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:26:40.9429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7tZGqQMx/7Ris3C8x1l8BxcqxhVCzcUBOeaKYr0SM3z5qP/x/TEBbUbNOHYpL3VFEGpv9Ot1R5rX1ZQE1Gpg3iWzq1+vKppy2HvPKAvOa8zvVWDExrsjY9ZvCDFHPo3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB10248

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

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 66 ++++++++++---------
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 58 ++++++++++++++--
 4 files changed, 139 insertions(+), 35 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index eed9d2bd0841..abc2a979833a 100644
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
index 1c9f22118a5d..86c320286246 100644
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
index 8b898ce05b84..00c3f7458e20 100644
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
index cd69c8a686d3..792f0df51a4b 100644
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
+static inline void
+__rzg2l_cru_write_constant(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	return ioread32(cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	BUILD_BUG_ON(offset >= RZG2L_CRU_MAX_REG);
+
+	iowrite32(value, cru->base + regs[offset]);
 }
 
+static inline u32
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


