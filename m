Return-Path: <linux-media+bounces-26604-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 919BAA3FA36
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 17:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8B96F860874
	for <lists+linux-media@lfdr.de>; Fri, 21 Feb 2025 16:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCE09201269;
	Fri, 21 Feb 2025 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="spuc6Zip"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010006.outbound.protection.outlook.com [52.101.229.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005381E3DFC;
	Fri, 21 Feb 2025 15:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740153449; cv=fail; b=XLngOHqmR6YghAaT8OJHDqM6mvlRLKIFKCfiGm0EXxGocuETLDXzNybqE7P0JoAy2n8FE3Z8r9haosKqyVWKbbzzgNMf9ogkXVhQ5wGN0iQXo9tHT8bZhxmsxDOHUQKQ8B1LMdAGYlaTy31q4mhTmCYlKf6RuxJsFO4QbDxw1zY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740153449; c=relaxed/simple;
	bh=WjQFUyLz65Xlo4Xkq3cU90l7h+N2WnAMzhaHT49lbOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Qk+ZX/dC+iCjPc66+B8BcIjQOr6zBijsDgMwD+t4Fkobv/Xql9PffKO/CRn47Jyc/5Z7yuStivbXhMFs+z3cq0yrv0Gd3aUYaLl7kvfTbbfmzOiIWlvOnZseb/WIEKDec3j7AUARSUldeTJZoFBo3jOUOyek1fMC3D7Zm+ktQa8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=spuc6Zip; arc=fail smtp.client-ip=52.101.229.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cgvg/TCW+3tXXPy2+/C8NI2R+rmKgGWPeX83GlPdio/8tRvHpuQ+H1dUvioTwgfyrVEu50Zrj8qGvJNMus9cZE6U3yzu5Mm8v8PHJ8PBCGoVpgknWgWY1VPTz7bdIj6tgkrea6+lnmAVQyp8dwlibX4YJW1rcB5RNm9FtaDHCWnhFXlVcH45mcCknbd9yw6KjLdyJZMDCIRCX8F5OX6yCpVuUWOyJvJwf7TYFqVW9KEJ3bl3qtvYPehZt+mZ2IKSXQxCzXJ5W+PRET6cYv59G7PEKERKBj3mOOEXqGs5s7E9GWQCBXwKZyisdNQVLfOupfB2fNYJlNnr/mUgG5fG5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OjKNglkcoYNKxZHVb7txnbXClDVQ+o/dJ0ULOpZv3q4=;
 b=X/TVL16yFkVqjcCi3JUMQ/cQP+SAAL9aryC9lPCvt8rD04e+Z+EvOPNM0Ieasmy/UjEdPaE94NHU/gPoy6/1bRZkCYqHdCwd8Uh2DJDUcSw770hYv/hRGtOGu/94RshyOKGH2WMLA8PaTmtBmOsZquq2DlbiCJFkVdFDsRZ4FvopB/LW0rwPiMoOHDRy6wYNhWvwxifiKX/ERp9wL+XFvvDC3Bxx1we+ZgTc4OXa/5dnCcI9SutqlfzzrwgcntM6RXdn7JLHImxNFw6rtAojqISyvxFl4RWwWaHY4ezuX0sLEXoQ1BMPxUkgmVDTgHBM4yyxG446+bQeceika6296g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OjKNglkcoYNKxZHVb7txnbXClDVQ+o/dJ0ULOpZv3q4=;
 b=spuc6ZipA7YyHFzYQwiXiXLAnZm7/s5Nq8minAESYHKVT1ZWWHwGKH8w3xLkxnjSW0PK4A3vhpBwSiL7o/jXYYS6GxuePuHcx0aqlUWMj0rvT3KnCkZlNjXU/dpUbxFo3Fv33WurADnyNuROzSHxWd5ZZo8tm/iWQnxb2mHPvAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB6238.jpnprd01.prod.outlook.com (2603:1096:400:7d::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.17; Fri, 21 Feb
 2025 15:57:25 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8466.016; Fri, 21 Feb 2025
 15:57:25 +0000
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
Subject: [PATCH v2 11/18] media: rzg2l-cru: Add register mapping support
Date: Fri, 21 Feb 2025 16:55:25 +0100
Message-Id: <20250221155532.576759-12-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: 9efe55f5-6720-40cc-02a0-08dd52906f13
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?81AzEvbrElVqBtSNc0QOYfgS8peMNv3ly3aHVpe9R7xcKXinheH2GuagTg2n?=
 =?us-ascii?Q?ptSjLq+FKxm9okB8Ycqxvc1eB+LfSFdglaOQhx+n64TeMxl+GvmmqV59EN9e?=
 =?us-ascii?Q?Sg2PiuEfY80UvEMFqNVe7Zpxzr/9Fr9rHbdjJKKsj6ipn8LYVNCaYuPFfuMP?=
 =?us-ascii?Q?g/uqxuhHTZ0aEd9WValq5zbS45ZjfwpSXudnng2CZyu6zoqirECEN2PKEy5s?=
 =?us-ascii?Q?GxP/LovPkf2K/XcwCwaHYkT8J8IIlcpVsrumhhhzON5jFMgGOVVugOfAGvdR?=
 =?us-ascii?Q?BQPLihPXcXbztXZyQG5FAfULmVgZcVfJB7WV2feCxrw19xhd/mMXMyUyOJZG?=
 =?us-ascii?Q?diLf5D7AKvPmvS0ndCjvu4xiZ29L5UBdxSzavRnUxSk+DQB5jeCQATPttFDC?=
 =?us-ascii?Q?a1JFQSLLCwte+kdpMbGDzr3kXs+RXrJZM9TPIxRWMcOhR82ralFQFZqNgzmc?=
 =?us-ascii?Q?cR8O+/M/7+Bvp7FtGEKeEI2uqh3PWJQPmghImsOBr/9zvHbnFH+5QFB+qiee?=
 =?us-ascii?Q?holNlRwFs0aNuwtWqZ/Dw93F9201yRJEqftid7/JaqL7J3oKbruxYaANGUYt?=
 =?us-ascii?Q?DDBkuQWDc3uZ9s80WLBbAH8K5vb+UrzeyZxrydWedU1bwKB5Qi9oKWPpoJlc?=
 =?us-ascii?Q?Q+OzWgD52hfGcEIaMyE5rMe7QNxY2gZnNAGNLQiwePE2oJMJ5CaIidqieT+0?=
 =?us-ascii?Q?aJ4ZsNtoS+5LRl9OVN516Q8Wywg+iCeY/HNi+MP7BTIBG2b3j/j/IPFR5+nx?=
 =?us-ascii?Q?cB9Gzx5O4LotGbIVzwaKjGPUryhM0R0G9c4e5J7btLlxeZZ74iMG2AwesCP4?=
 =?us-ascii?Q?QUfLWded9yiLcHj3RmschCSsgejaRPWuoQNTC03cyw19zqfoheX8Wwz32jFz?=
 =?us-ascii?Q?i6ihwLES+o+wtfgLL3NffmzDVo+PIoidRk+9Yy5W1X6ADQKjOs4uj8VNitrN?=
 =?us-ascii?Q?IBs1OS8SwzkHO3HxgBsZ9DySVUPu2bMQF2ag0uZuJ/8jxbC0FmrYsseHmy7R?=
 =?us-ascii?Q?DFhhlp/QKMSpPGSX+EgGhZXbZ+gAzb8MCbN0ZX48gS+SalHFSdBFpm64xjky?=
 =?us-ascii?Q?Het7Yx7fwl7Yhd0FLyDfwnXG3bqIsRsmPGtZHjIedw2K853izR0pV/72avu5?=
 =?us-ascii?Q?TElLYH8FpsQKfptdx7s7nCdRlkQuna5bV4B5QYiNb1I1VMPs+wsyCfSyBdQ1?=
 =?us-ascii?Q?A0evsdKmbbw0vG3sJ0i3Zl8UtW8V0zD1LZTsDWpFyg7Cokfx3lriOnsJgxdj?=
 =?us-ascii?Q?bmee5NcoBu1ecJApcWwG1DasaNgKSwyh3vSpjMPwnMpfKCVEQUnZlevg69+J?=
 =?us-ascii?Q?xztaai4PfuPRJ4MhpO90+F29gZBxtToOlTpAJJFkpJhigpXL4gqUP5YaeT5v?=
 =?us-ascii?Q?/P7AovIWy4AgO4Ma7bSFp2Pbj5Y6ncJsbgdOa6zbTu+gi2YBDJC4izQgUizV?=
 =?us-ascii?Q?x2M0It4PQ2tUjz2n6hxb4IRr9Axi9/Au?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0+TclWyVmKFCpJXzLezaTRSretGWxZGxD6JVkXtwMVBrjtOz3c68x/ZIicgn?=
 =?us-ascii?Q?5nggE5XV627XfMYl7ofl94SOP+ger883jwQL27yqgmjdoTm9sXrZyYsoZ//3?=
 =?us-ascii?Q?+oR2iXFTdgn5cEJ+DDARo6kYJfzN4pJPiZNgf9+Aiz/48GVpsgBY8cIl4bHy?=
 =?us-ascii?Q?Ss7QacozJgk/ttoyAiKqdRlC7RUamaMb3NF+aTm2v63kdhFdZ65V8PSYnTua?=
 =?us-ascii?Q?mt4u1yscWNP8EXjZ037AOCBap+dF1y1XMNFkQVHY3tifDsvszRRTxUeiDt/y?=
 =?us-ascii?Q?ygHG2iDYDIVvzZNdEArKFZ/8GLAihZhoKt9yYZoRT7mWezIHlXGJ1qCtHMEp?=
 =?us-ascii?Q?Wi5QZAmlGU8zeiN6AVoEEwFq8+gyLQsyXAs1pwUApMaqfdNiFJcpWqKKZMxr?=
 =?us-ascii?Q?9ZDOZynDr1kfgfY4fOt+71/yPSygU+BgWUcoEEJTcx1xbrHsFkSdtlGryIwG?=
 =?us-ascii?Q?wEqdcSwQsryUzzlw5E4rYTqdwFgRYqKwjBJwXg8iqwVsrYog+9yKmrvlIE+T?=
 =?us-ascii?Q?5IJ9MfrZbbs4w8fr7t/jDO93PQddWHRERDHWUCO3R6q7nlp9rBgWIw1VtV0w?=
 =?us-ascii?Q?ixMCt5Xv+sVWIOXUWotrgpcXiW6CZl/cCebTjh/81GC/rmJFC/Vii2zGNoQv?=
 =?us-ascii?Q?80HjDajbofDpcDuCqUR9SlyvHQCVmWrS0HPWtYvCHVSzrdiPrqy6odO+T11e?=
 =?us-ascii?Q?EVMaJINsyQ1x3OzaZhugnqEEEUgb5oNlKKnuP7dopFcK2oGhX+mZGjjpppuP?=
 =?us-ascii?Q?t2PqH2nUaUvAyPYD+UUMD7WhbJ2IwvMsE7xrZ8ouRmSSz60fm6VWAoaH8Dit?=
 =?us-ascii?Q?IUo7eIZMoUThOJH0owhmtE15cIxHC95DPS9a83QttflcSnluG7/M2+511c1q?=
 =?us-ascii?Q?EhqOeYPs9KWVCTvBrZLKwAHaFV5P+Ecpz0SNazTg2UQNPAXBVU5JFpk2PR6N?=
 =?us-ascii?Q?FuXMcoU/8l+nqP5TG1UK2ISkC4G5rwoSPtkyj4zJIk+2PbgQFr7XrmyEEsw8?=
 =?us-ascii?Q?03GRWGZrD0xC4OoH8l1eLlVFicRC6EvW4K4WDreJ1mHnEqxtJWeFdBaz+RFj?=
 =?us-ascii?Q?aT25SG0pefFWjriZZTiRC7LAupFQt6QawGIXcyXI7j4n78ZVLX60HoP4jRAJ?=
 =?us-ascii?Q?tgGWq4Nafy+IrmjrcSthSpuYFM8WUhyXWmkMz4TnGHiqDXyYjTu/7fd6erwS?=
 =?us-ascii?Q?ZHK3R5s0Y+XJd7M0BYDKSpM7zmoJqIkc+ct6gHNpUazLF+OWdJiUeNp/xCd1?=
 =?us-ascii?Q?1HBNCCChWVQeS52YR+44FzDyQbNEUHF1O2LyHhwnSFWqCWRdgaKk9T5UmqH0?=
 =?us-ascii?Q?YbE5i1L7okhfEJG2e5RIjOWTSyIkXRn6pj7p3xqoHcgzJfAh9kOSR1PySGpG?=
 =?us-ascii?Q?Pb2gZDbGBhblVtQWtgElrlQIq6UU4EkkBWTu6d37B7GOQNuwykyrURv7zabU?=
 =?us-ascii?Q?7UjqX9Pdss+/8+lLjtEj1J4/i9PHwZWrNP1tFf7sH6AOPlZmhvUpACnmYVQG?=
 =?us-ascii?Q?j/I3KZHe1tZdp0QPsUWelTGsxWa8BhmCgsgeMgnFVGz3psCxrJLfYT5VZ7+t?=
 =?us-ascii?Q?I4c8vhvDsZi4SVJhR6OhKzii06gct4XoqiDUUao72HFxgRlFIHeA93IhG4YC?=
 =?us-ascii?Q?s3TqSpcbTrenhzDMp4zcjfU=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efe55f5-6720-40cc-02a0-08dd52906f13
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Feb 2025 15:57:24.9803
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WYZTh+kGGwwoJrfwmPP74z+vSdG5SSWrVjzWxpfP1ghLbKowmOIGlpGgRq//y209bTR7MnBhPON7nWoSb3P78U7F5E3WwAHN9/dpiQ1dniYl9I08Rjtar5ErX/1P2HBS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6238

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Prepare for adding support for RZ/G3E and RZ/V2HP SoCs, which have a
CRU-IP that is mostly identical to RZ/G2L but with different register
offsets and additional registers. Introduce a flexible register mapping
mechanism to handle these variations.

Define the `rzg2l_cru_info` structure to store register mappings and
pass it as part of the OF match data. Update the read/write functions
to use indexed register offsets from `rzg2l_cru_info`, ensuring
compatibility across different SoC variants.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 46 ++++++++++++-
 .../renesas/rzg2l-cru/rzg2l-cru-regs.h        | 65 ++++++++++---------
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 12 ++--
 4 files changed, 92 insertions(+), 35 deletions(-)

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
index 1c9f22118a5d..82920db7134e 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru-regs.h
@@ -10,71 +10,76 @@
 
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
+#define AMnMBxADDRL(base, x)		((base) + (x) * 2)
 
 /* Memory Bank Base Address (Higher) Register for CRU Image Data */
-#define AMnMBxADDRH(x)			(0x104 + ((x) * 8))
+#define AMnMBxADDRH(base, x)		AMnMBxADDRL(base, x)
 
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
index cd69c8a686d3..f25fd9b35c55 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -44,12 +44,16 @@ struct rzg2l_cru_buffer {
  */
 static void rzg2l_cru_write(struct rzg2l_cru_dev *cru, u32 offset, u32 value)
 {
-	iowrite32(value, cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	iowrite32(value, cru->base + regs[offset]);
 }
 
 static u32 rzg2l_cru_read(struct rzg2l_cru_dev *cru, u32 offset)
 {
-	return ioread32(cru->base + offset);
+	const u16 *regs = cru->info->regs;
+
+	return ioread32(cru->base + regs[offset]);
 }
 
 /* Need to hold qlock before calling */
@@ -132,8 +136,8 @@ static void rzg2l_cru_set_slot_addr(struct rzg2l_cru_dev *cru,
 		return;
 
 	/* Currently, we just use the buffer in 32 bits address */
-	rzg2l_cru_write(cru, AMnMBxADDRL(slot), addr);
-	rzg2l_cru_write(cru, AMnMBxADDRH(slot), 0);
+	rzg2l_cru_write(cru, AMnMBxADDRL(AMnMB1ADDRL, slot), addr);
+	rzg2l_cru_write(cru, AMnMBxADDRH(AMnMB1ADDRH, slot), 0);
 }
 
 /*
-- 
2.34.1


