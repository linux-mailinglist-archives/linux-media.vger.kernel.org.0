Return-Path: <linux-media+bounces-29891-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BEA5FA83C91
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:22:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F3A03A6DDC
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:18:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B165C21A447;
	Thu, 10 Apr 2025 08:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="P7VgQnI7"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010004.outbound.protection.outlook.com [52.101.228.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C493208989;
	Thu, 10 Apr 2025 08:15:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.4
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272932; cv=fail; b=W1W5O32zWAxUGZ1ioRUYEEXeMc9tzMrVFlo+C1WuX36MCt+hTpxwKc7P6mVLHfbXBHq/8IIKPxRfUnMUfSjcqrxiNlGLNi6479P5U/SQ6/D3ix6nsNvZEL3Q3QO3eV6BeLNdjC1wJDvQWQQhUk93W8Zm3kJyYzi4RLLxvcyncBM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272932; c=relaxed/simple;
	bh=48Z19cMBlt2ZunZzBapP3JwtbM/ojLDa/OXPMmTAJDs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kFxnYdoRRbcz2hWZA9jIZYhhTHYS3flr7dpp9nrk1uRZwkpS+JW2xbB/ZlcPYJakhCoY/UHD8aFskugU0WFCaL7z5FJCKv2DVFi1MGy0k7j2pTqgOQpiysKxnIlrB/blcENohqAS8zmD69M6efRP0+E+9XiZdw+OKVBr3TWU4mM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=P7VgQnI7; arc=fail smtp.client-ip=52.101.228.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qP+eU0HIuSRE4j4rHAO8dXuv4ldwAM22yBXxFWDL1T8PYc+EH/gYfa2EGJTiPWMtUsdOsqXxd1BwzUMM9gC2pwYVrLA83w02zdiGegrHs/Wd23T1WdeLVQDnryPJyN/RpiM1+n+J6mna0CM/dzjHnyLujNjYZhFvEYPgHyalsBcJ+3FsObGo5Rb506UVeY6qCrYRb8ENlX5JKMur9hnbWQraz/K/Szym1Y0qf9xRJ5znc5x4DB0yD3TzOAenv+yWV50fDolT0SCKqpl/iSDfxxxSzx5UzZSlwykhO/r0S4iF898pRyHcylvWPRbGw+D4OnLXD6iS1228rHRDq2WnQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSgqbtpFyLO2SEZSJSEwlhJ5PAQkeB//cQVMzFpBeWA=;
 b=SWl+l2/YQ9Zj+Smo/uLXJ+PNsXnkue4GUsh4B0YPXvke9R6VtPIv7c7G0wHfm0OIBLAp/eM4BtL7LuIxgQKEEExtLuo5Z5Ucu/HalqFQYLPfwWWHKDHLcse+h940DtNVS+w4x44mYlAfvf9fnxCs/0jCAqVggPRjww9qDvjA6vPuJ/YAju1TNkC3dqDw4qXyE8u3aZUuFLp2+eWAku3pGDbgpgKLhswbpZKcnKTbnD5UH8I9GFj1gU6EAYUxgbh4U1o4m7irq79sFjLyIdUBZCoSODFlbatgs23k2lB6ASdOZiDgzqSHaZ1KyYiTSCPmDhe+us+xc9loaJb9pNfpEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSgqbtpFyLO2SEZSJSEwlhJ5PAQkeB//cQVMzFpBeWA=;
 b=P7VgQnI7c4eo91F8TqWfTXz4jbhbJZHErrb5p+fJDnji6Q2dud5Fa6e1qYXgRzJ9l8vpUu4VON6P7ztXHAZ4ZR9DfTAj0YFkRuo5AlgrezaxGwg9vWrR+LGg6uPQcXPan3hbj0565RP8bZyX9t1/5xKJXaVBClesJqAjCg7HwPI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:15:22 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:15:22 +0000
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
Subject: [PATCH v6 13/17] media: rzg2l-cru: Add image_conv offset to OF data
Date: Thu, 10 Apr 2025 10:12:17 +0200
Message-ID: <20250410081300.3133959-14-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: bb3d8428-3277-4540-b009-08dd7807d6c6
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sJCkQjf/OXgpzLFYBHrXzF2Ihu5BERrFmBD9y85s2RD6qR5LnqictWBokgei?=
 =?us-ascii?Q?AqbIDxjDEx4DIPwXfeWr6HvwSHuXaOXz3JKaKQaFptjdJ3VzM96gC8S71sDk?=
 =?us-ascii?Q?h/nHR6GBtcvs4tQmWekQGCLK/H4hSTb1D8kdePFFR5ULiPLvhPJDzRRoFxuY?=
 =?us-ascii?Q?0RsHaAmW8yJy+OL42+z0+eaDHCj+GS8GqCUaOZaHT+SJEV5mxmjDoqOCfrwj?=
 =?us-ascii?Q?iCUiVDk8QraRPoHhKDAWtVKV5H5EZw92HQ2ZV0imnBz7U2etEQZ4izHGV3nD?=
 =?us-ascii?Q?LCnrxFEeJtzMRw3M2yhgRai7akvLb+tb59ftxdqPc17jaZusmdtfAoZYjMey?=
 =?us-ascii?Q?Nvk/he2BHm5+FzTbGIK/k88I/ieIy6J5WU3fsj1KSW+iu1OMRklOK9kB8XbM?=
 =?us-ascii?Q?NbAerNiVrgZV97r9op73rRzpko8LltTAgGI41EFgR5DTGQAFoLvakHyoq3/D?=
 =?us-ascii?Q?xDisRula3WXjBXpGP9cfjv/NTBt4FB6+AQmovaiAqfayRAXvDmYMZqx2IrGD?=
 =?us-ascii?Q?bAEY8+WY2ociASl4Z7E0rdR8nDN4sll7CBXsYNDIFqiSj4bldztOZd6TYqby?=
 =?us-ascii?Q?ljqfmIxXDe7rDL0jBThk+P4HFBGPoaKejA4h5KcNrVN36VqpEUzJAkiHPA3n?=
 =?us-ascii?Q?LHasnCK5ftPDAxCXDWG/sp5QzA3c9Jzr68Rj23VZ3ZfaIfnJnROpR0Lz/DRQ?=
 =?us-ascii?Q?ZrCVr4eQQBHwKMGuZQmiRYadLXZrt9kAd3y/UstvbAi0Akas63p9OEiH5coD?=
 =?us-ascii?Q?F1X75TbMAGs+WIdfGjeZ6qpQM9oKGaaJzCLWhBE7//+iOGSw2RxFgbGLeiBV?=
 =?us-ascii?Q?dhe92w3sBtYmfGb+yNMJhgL5cfHt5g+m7trWMQrddtPnieaSeuSR9VQt/dLv?=
 =?us-ascii?Q?FLnNHiD4OV/zDPs7zFtBwXnsRJoMd1lxgNtIAI7t31tscuPHiU3C56GEDNtS?=
 =?us-ascii?Q?bbxzyMZZP4Pzl8WI8qD77vmhGZvWa0sQ9YSwVIwUBru+oJYz0V8/nfiQ0Xmw?=
 =?us-ascii?Q?NfSZdkzq+ylmdL1yK1NL+dfJkfxDlDmonNizcIgjfB6c3/uJDtiFpTiXDzfe?=
 =?us-ascii?Q?h24bcXLBO31aQA/0muzSc4bhaPr4t/hYrEuP6FS3f1mtrujI4vM7T/z4O3YX?=
 =?us-ascii?Q?jk9qe1EkYvcy5J5L+/ZQbciO7xRDWtmEIt7LPUgWfTJfEJl+jyc1GVw1cVkO?=
 =?us-ascii?Q?862OA099KGRMQAxE26vMk8xsQ1eWWrXeCj7ytN14vd3woUUt09Q3Lv3PV+P3?=
 =?us-ascii?Q?KbhtCglomCTuAH9fAIA8F4gpdncJZCJXSRV+8gOy9iXIz1DWq3UBH1ura0X0?=
 =?us-ascii?Q?d7+vPyMGNxZtjv3RsNRPhNYg9IQnjNQQHrYJVEoaJch4PZ1NXYqrjRAO9Zqp?=
 =?us-ascii?Q?06HdPVM2KBcfAymFw7l3ZoIzkVzI/G3gbBmQyFO1Gtig7VBU0bOqOmTgts1v?=
 =?us-ascii?Q?AZki0BpooRove0kD04Itctu1gpp/nx8q2+t02Ft6GyAWWTth50pk1A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?c8NwakD+TrvbMoxn9YpzD3wwaF1mMUr/ULL6aQo/Bj36qEcLbTuK8W3g7jED?=
 =?us-ascii?Q?EaLrBMG1NeorM4TYuBGacAhM9z7Mk9n1wb1sTe6WF6dZdjEqBJiZmPX0cYcB?=
 =?us-ascii?Q?Pit8Pxnia90iXz/TPzCF45vsNPP4V2YSmPgEPQ739qyZhA4OkMP87zggf2m1?=
 =?us-ascii?Q?mQdDo9e8H6cwursbEgViIaLacRnxMxpNuhkFtf90hJAYSD6TFcKLe0yzoYx6?=
 =?us-ascii?Q?sBZZw2lcPZw++qdCzB485de4ihoPAtb/2TvKDPAel8/1Ib5H04BWIXx+c6AO?=
 =?us-ascii?Q?tCnZhxPTd0mGkrUblHAGhMTHk4IVxtsMDZaTuimHJ2QaqW5EzyxhWL/Gyv3x?=
 =?us-ascii?Q?of/JX5n/vtmmdAX0bsUCINVj3KO8nXTw6w7avLQ3X8FNgDZr7cZ/WTLollPI?=
 =?us-ascii?Q?TrkQAAJg6bt4esmg8q57SxcFqVhuRnu6otdE/CQW9Xh9C1WMV9D0pAS+jLEK?=
 =?us-ascii?Q?XX282Kqf9JJ5hYZnx/f7KTM1/OQ/YJgyNoxM5jYK91ecrFuWD7uMIFCLR9jY?=
 =?us-ascii?Q?Q2hZ18UCu8qYJMZZDiIWoaH5NnSZcopAnzh1Bdw33B69k/pTKGXeeRSxALGt?=
 =?us-ascii?Q?TJsBr5O/udX065SHF+MeQtrGWgyPmT43CMHpgCeoYFCtnyBUXeEjQdu5dfkX?=
 =?us-ascii?Q?PStq+7TrSDLmrWKHQFnIaiQm3YQintv1Fp22pULHHPa4vxGO2IrEUjdLuIuE?=
 =?us-ascii?Q?IyLIuW2TUf/k1tqWGsTiAY8Y/2gWTRO0RV4i3PWpN5u8zS8cTaQMPZwTPRn2?=
 =?us-ascii?Q?VtZRHMwepZRavpZGnyB/pdJt4x8R5evRE4anoSwobiieUrj7o2D8zhbgpmAc?=
 =?us-ascii?Q?IWFVNl0+9q976OzM37/Xw7xuGn3f9A9Rz6xBrYh7r6p94LMY7EkQoWNMj1bb?=
 =?us-ascii?Q?37zKZHhL11vFsklPiib8GR1mzb+9L7ibG3oPhvrxfuAQrLaBWm4Gw7DETO9L?=
 =?us-ascii?Q?7fzQi/9HYz0u5BrgXly2aAuP7xx7XGTUPdzbXpi200wy/S6c5mT3itHd4MHI?=
 =?us-ascii?Q?IlYwi2nszpkrKGInvZZgP2qXpmkk9s/uww4EDjCdFrUjV22YHCxuM7gjmFG1?=
 =?us-ascii?Q?WZJiyrAFCj0fFo9aiGWMeFUubhUVHheEZCFf0ETunG1WiJyWz5iDG5rmRnS8?=
 =?us-ascii?Q?tq5ueRo6nehf2bAXt7Zd5nPFs3Bix4uwW2t7xppHcvmW42HADtwmJRieECjZ?=
 =?us-ascii?Q?u8lwVIMHqk5WQSkSmHA0EBVMamFBQUYMNIOxfoleOuTL9jpLlBsVPG8Sbox5?=
 =?us-ascii?Q?OCIHqJKuSsqW0d0DmX87eHM2uRl2krXDIUgdd4cN9gLS9okAyGbs1cowYSYq?=
 =?us-ascii?Q?eA9LZ1LydLB3fbRiBzTOR7NgJFMa/PqW3lAPzw2M8WvWEaqB/SJDtzNKE/1M?=
 =?us-ascii?Q?e5uRslOsPg9ZkS88Z+/Kt5dNkMBpIPU2+QI+ySuvooZBT9yztW1Kq7q7C66/?=
 =?us-ascii?Q?IsiyZem9qOIuGmtOfznbJ8ovqTWZB2zvPRB64y50chKzA4p9sxejTGmESNSo?=
 =?us-ascii?Q?QLdf67tZp+8mDmCmjzw0JTk6uq96LQ9MXMd93aHan8bdREr+caeYHocwc2WT?=
 =?us-ascii?Q?TRxG/kgCDa64fHdb3qjBMWmS4XbnooldAiiqGFlhpkLGz6yDJwp16sGDEeSM?=
 =?us-ascii?Q?H5RiuW5gzofNXMTANAnxQZI=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb3d8428-3277-4540-b009-08dd7807d6c6
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:15:22.3407
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J0ZBARHgWnuvNMoLPnDUAZ95nT23UAFZwfOykRrwlJN7jDGyQFCIKkMCsc6x/wxqPO1WL1QuuT38ZQW6cNYvy9dPLhmCCcjPRoMfHNiOzoGMjZrB9xBQHy4Fnp3nZw8h
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add `image_conv` field to the `rzg2l_cru_info` structure to store the
register offset for image conversion control. RZ/G2L uses `ICnMC`, while
RZ/G3E and RZ/V2H(P) use `ICnIPMC_C0`.

Update `rzg2l_cru_initialize_image_conv()` and `rzg2l_cru_csi2_setup()`
to use this `image_conv` offset from the OF data, facilitating future
support for RZ/G3E and RZ/V2H(P) SoCs.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v5:
 - Collected tag.
 - Dropped unnecessary outer parentheses in rzg2l_cru_csi2_setup()
   and rzg2l_cru_initialize_image_conv() as suggested by LPinchart

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c  |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h   |  1 +
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c | 14 ++++++++------
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 19f93b7fe6fb9..7e94ae8039677 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -357,6 +357,7 @@ static const u16 rzg2l_cru_regs[] = {
 static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.max_width = 2800,
 	.max_height = 4095,
+	.image_conv = ICnMC,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 6a621073948aa..ca156772b949b 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -81,6 +81,7 @@ struct rzg2l_cru_ip_format {
 struct rzg2l_cru_info {
 	unsigned int max_width;
 	unsigned int max_height;
+	u16 image_conv;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 395c4d3d0f0fa..95cce250b3272 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -246,20 +246,22 @@ static void rzg2l_cru_csi2_setup(struct rzg2l_cru_dev *cru,
 				 const struct rzg2l_cru_ip_format *ip_fmt,
 				 u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	u32 icnmc = ICnMC_INF(ip_fmt->datatype);
 
-	icnmc |= (rzg2l_cru_read(cru, ICnMC) & ~ICnMC_INF_MASK);
+	icnmc |= rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_INF_MASK;
 
 	/* Set virtual channel CSI2 */
 	icnmc |= ICnMC_VCSEL(csi_vc);
 
-	rzg2l_cru_write(cru, ICnMC, icnmc);
+	rzg2l_cru_write(cru, info->image_conv, icnmc);
 }
 
 static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 					   struct v4l2_mbus_framefmt *ip_sd_fmt,
 					   u8 csi_vc)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *cru_video_fmt;
 	const struct rzg2l_cru_ip_format *cru_ip_fmt;
 
@@ -276,11 +278,11 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 
 	/* If input and output use same colorspace, do bypass mode */
 	if (cru_ip_fmt->yuv == cru_video_fmt->yuv)
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) | ICnMC_CSCTHR);
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) | ICnMC_CSCTHR);
 	else
-		rzg2l_cru_write(cru, ICnMC,
-				rzg2l_cru_read(cru, ICnMC) & (~ICnMC_CSCTHR));
+		rzg2l_cru_write(cru, info->image_conv,
+				rzg2l_cru_read(cru, info->image_conv) & ~ICnMC_CSCTHR);
 
 	/* Set output data format */
 	rzg2l_cru_write(cru, ICnDMR, cru_video_fmt->icndmr);
-- 
2.43.0


