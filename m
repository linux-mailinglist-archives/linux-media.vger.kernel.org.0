Return-Path: <linux-media+bounces-29890-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD28A83C6E
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 10:18:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CCCCC7A401C
	for <lists+linux-media@lfdr.de>; Thu, 10 Apr 2025 08:17:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CBD58215779;
	Thu, 10 Apr 2025 08:15:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="dPEHWaTl"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010005.outbound.protection.outlook.com [52.101.228.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2752A20A5E7;
	Thu, 10 Apr 2025 08:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744272918; cv=fail; b=gNq4CPy+wmQ929+K18Dk4fgg4shlL9XX4GiPYQfLlkTk/E8gjPF25hSrDGQxRLee8UGDth6SF64fHxfrHaPdRgFPtO8qE35I4JO9kMP8m3mO6Rpz8jSKKCtFK1ZEvmDgabIaAkZ3ANrBYumF6Plmim9kH5CUePaMECW7h9KxWiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744272918; c=relaxed/simple;
	bh=b/qqiWfU2TOmFQJOhjJavmi9pjSIBAMTfFqVvQlDQWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=B96kHrbPrmrIzq4j/JqIiw9JvnfhzbatXHb7wlPNgb7nGKujz5DJMMYI9kKiPA+4ZbLm3CCi7wCkWfsGCuMRlYLzif5kg5g1rGXPj9c7QlaNnpLktgBpP7Yh7Ly9sqwvYUTHoMyA2bgGzvqI9kitoft46z7ylZrdrJV5coDBOBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=dPEHWaTl; arc=fail smtp.client-ip=52.101.228.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lGEXJ99IIv+M8BdKVs2dvdR4ytE73Bs6U57xy3trHrQMAkBPTuYgPbWwf83x5T6uXIDo/t9GumnZ5I5YqPf9b4ycWPoE3wElXxWceInSW2XlBLVyxx4CGp1m9hkTEC4QaQvChdmiTEDlQD+Fq0ZKR0BV7VkCcz3Ry64BJUjFzFHORzIuQ0JOxqL1lGijFd/IehHsSpsHlXYqrj7JMBXdPrKRYT9Kbsey0ybneuV1NkILDtu87VVFcN9jRgDs1ubnZvuCUWyrqVtjNW2OQupKCOrzqEao6MpChbrSQcbiOq32i33V2L1Fe3vNMWbGDEl05NrEQEaFQfi3YtrDTU7DzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V5YA7ou01kxcGIPUJB0uSwCOp90hJ1Zsik2vF+w9z5w=;
 b=Aiz41oUipIvlrMdX+IfdpO/UjZmgbtQ4Ay30t7DpHx81rrTGpIwmCvcCCo72zR3+TQRnoC5nPnvlibedqD48ITB0fhNheTo8zCH12LJbp7NxbfmVUcGw8LItLNlz3mmDOfNu7Zv3kDokbklzo0HFwXmB5UWfOSWm1k/of1yYuj/ZHuNfrVkEQ7ewj+ylXDt0ULYCirrRgK/Bkgn9EApm5U5eEQjv90GeHKyCgXd0KeGh1Unx+vVxnznBQjFB0PQb28J7Y9zRZq8VHRiYVL7ROx/A0A8hUK5XKZUgqtdJxdlIKuFh7D0r4u1+fJp6G8HbCOlYa91b6ZckZuzJ5ZOKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V5YA7ou01kxcGIPUJB0uSwCOp90hJ1Zsik2vF+w9z5w=;
 b=dPEHWaTlan4DGbggpFKk+F+F4T6nYvWe0p57zgZwQQ7/AG3U4GnRVgjU0ZzPrRIVpZ2eX7jpuqPjzgLPzXE4Zek0LLRuQ+js0YZrbv49Kn+lDz1aZudLXb56TtGHXSA/CxhPDeiPtW/+Z7m6Vvvd+lBhaHfaNL/uymPDntYzvHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYAPR01MB5660.jpnprd01.prod.outlook.com (2603:1096:404:8059::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Thu, 10 Apr
 2025 08:15:10 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%4]) with mapi id 15.20.8606.029; Thu, 10 Apr 2025
 08:15:10 +0000
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
Subject: [PATCH v6 12/17] media: rzg2l-cru: Pass resolution limits via OF data
Date: Thu, 10 Apr 2025 10:12:16 +0200
Message-ID: <20250410081300.3133959-13-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-Office365-Filtering-Correlation-Id: af39c264-fa2f-420e-180d-08dd7807cf67
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SkDNgo1E/2y4h3K4togQiVp/y0kNGB2gDA/bxLBnXEYbyiQyhzGADXBTmYqQ?=
 =?us-ascii?Q?scW1Q4RzklATzT0yx+OZ3qTd/gafn7np+TvOk785yHyI++uy+MzgPiPxoZ1U?=
 =?us-ascii?Q?oykRtCw/TCDnb0eWx9KjFDQx7nTUKJ+hQq9Mqfk0zl2p6161gVWVkrb57Fe0?=
 =?us-ascii?Q?Xu3WZfsUILJvWxiMrsXQoyaCDzXZUldfdkCBQtMtU9enmGbB817Vax/fXwbM?=
 =?us-ascii?Q?9j8hWaDipvwsI3hioHOOjPG6HcMJxK5BE7+UybS6AwS/qEEA6405wQRCtJLP?=
 =?us-ascii?Q?mKb9NTtoeYTvIwaCmO5iekvciUGhtXMVm3CpaUxh/equaLebg70jcWcA+wrl?=
 =?us-ascii?Q?wMnotGkxx2dgMiIB2zl3F8PaEmt9Qj67e0AEEbH+6QgxHfEovQec/8RgDKh4?=
 =?us-ascii?Q?y5Lk0pHF47w+T7OKmq6d2FYjEbAzBTQJqcfQujMllPe/0vUSjqCXt+0n62Do?=
 =?us-ascii?Q?//7R3+JuUBs9pql3Tdr0iHUCPnLGuHGpOC3B9AUJ9ryiYocQklEeBJ5H8r54?=
 =?us-ascii?Q?YS5mmFgY7CbbEWR9RbMFnFOfFQI76QCcAzoTEIGX/7tcdAz9deKkQkuMNIqi?=
 =?us-ascii?Q?v4I47VnBAN/iFrfjLEV1XrSQ9wJtT2ua6kpACRMLlLhoLnNljt/eSo/ECWco?=
 =?us-ascii?Q?r6OkVkLoT+MpVuZGql3CS/S0GXqNHFZK6eRHpx4cbfY6h1t6D7nWsyb5AWA+?=
 =?us-ascii?Q?vD1leiShURSIPVre1Qeg09615x/GPnsyxHLAMBdRy9kLz968lb0Y3Ds09iXq?=
 =?us-ascii?Q?G9NjkBp579LcH7T/DkHEN6FRFW+GuXIIQU5pFn7Bp17Z/EhrSUmkZFzNlFdc?=
 =?us-ascii?Q?tP7c77Ym7Hg4F9iiWP8hAtXK2BHDVG5HLZp5JW/nmQeZfdi6hDIvKnv48tsn?=
 =?us-ascii?Q?YXrDEoYvVh8MeqMIxB9Wfkm84KeTVybrQUccEtpSUHof3k1FFj6VMuYPlq7T?=
 =?us-ascii?Q?TPGfHyULxCObjgNOhrivs9EDRzcqQndMPsWh2RyCBPZaR9BcXHL4CLlJe2p7?=
 =?us-ascii?Q?6crtIrSXb2Eu2n5J3n33Qlc8jPLjUOC27vllJTFc9TaPNevBjUVzBCvITNQb?=
 =?us-ascii?Q?PUHpHWmpNL6l/+0zPR11OI4Mjt0YW/Kc/YDDIi2q8PWv4Pv6LIOczFemMunz?=
 =?us-ascii?Q?x+/fMqwRE4KBoKTDzN8ZoIydAmr40M2AGKeivMFzSRDo6enzWO65Jnok/p99?=
 =?us-ascii?Q?s0b1clMwYLVO0OZkQwg/yWCz4gPQ7aDoA8FJHlGEQyrFLtpL/8FA+IpzDWTf?=
 =?us-ascii?Q?FxtqVCvppBPiyeAWzE45eMZeuSq+OcBKnnj/RQZN8GuU23/X0H4TnQ2GoijM?=
 =?us-ascii?Q?nvUU6D1d/mX1oFW3BBscMcjmsA1anwoCMN2XTBr3ZJFEZFvdPb8KFmB7Q+Qz?=
 =?us-ascii?Q?lFFX9a9+/tHlxgrE87TcnBGTl3pn3RLjYmeheVtWtF0uvKjzEh74H1T4L03s?=
 =?us-ascii?Q?ZN984rp/K3SUhfNarJGzI0EGhFsNpF0mgVyC3lCbE5sMS3XFyMl8/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?0HjKXf2itZoxIZYK6q96h+xCkzN4mYJoqr/STTzo2+pn1Wp30eZq3cj/CIXx?=
 =?us-ascii?Q?4BxfuA1TErFz3N966vLvUci4h0BJYcQ0sblKuonxJNj3Gs9WFYWC2L5bc28d?=
 =?us-ascii?Q?BMaLjpsp3AexVa7ufDOHYzAigPtD3xnLA/b90MDZB4VN4tTcRf9r7+ZXPSfh?=
 =?us-ascii?Q?8Bkwl6btdvVCiYOXvznlYTndWH/ktafLVhbeTCEmF9q9Y5lzCs3J1RouUm3+?=
 =?us-ascii?Q?CPAMCEBQWG2pv5tQ/3crsINV9/W+SHiNQiQ1MRRmtVPsdW2S3Ar73saH3z/E?=
 =?us-ascii?Q?7/BjXQDZQNEuVUKcA28Gv08j2N4lwVfs/XUNROawGssxfnlbLT14yXetASy1?=
 =?us-ascii?Q?YkN30GZEq7BRMwIsM3armZZOkqgN8hfWgU/2d7g+ybY3WKwLpPghK3nNrSlQ?=
 =?us-ascii?Q?XPH1E+hafi3FOgYHEYZOchSHfu7MdVr6M76cSrT6fytR7y+heHEGpmNm+8Oo?=
 =?us-ascii?Q?BJSPBohhIvcWO48kdty3E1UcHFafObK2Q7YdgepTo1U0NBup2FmDMQFWojuV?=
 =?us-ascii?Q?OFojlQmu6EvA94tJdX5unDzGiqxemjGLBxF2/wKc+zoj94lqehd8UgT1LZ5L?=
 =?us-ascii?Q?4orefmb01njYEpO+XD+Yw0HqWl8a10VJzWL2t7aCfvC6nkN4+w12Bt/78l0w?=
 =?us-ascii?Q?NlswEt9Yt+fYXlqjqVfLCsDXPe4qi6NV9j29H6z4q7EKdXcyZPjhGajRthPE?=
 =?us-ascii?Q?cjicwSic06dSjkcJ6WXq5H1xtEvjL2gjMQnmPxhWJlFb6klvQ72APPmlVSty?=
 =?us-ascii?Q?BOXuu99nswfZmqmXasMk30EkliGY6LX106mUf1/MH6w+6ywJOl/qcvOIysHn?=
 =?us-ascii?Q?Bm3+vEPIpoAO/M8gKDIfJfevwt2wwY0V17lZnSj3bclgePUX6tq7gv8EV3rb?=
 =?us-ascii?Q?sLMkyWFFGM5tB/h4Hpv33+ULiNQSEvV9yC1+PZHwH+CYhkC8W+A6DdDCiaWk?=
 =?us-ascii?Q?LBvPM0vYCEaTTNnBujVMqTOa9qJXiRmz+CMtuZ3KlBbfzebtJF3rSRclArum?=
 =?us-ascii?Q?CC2DkU1eKlGYm2JkOBxtKrwmfuQt4KFdhJaX0oIZsVklVTDvhda4/dhjy0T+?=
 =?us-ascii?Q?DxscHeqjLbBNPI1PKXaWIyOl7PsHz1jG+AXQiJ9BlB1ZMlw9AMX9cYdUDCFI?=
 =?us-ascii?Q?PYh7blNGEsBPNCaUD78SUIqVaQ/VShPz9B/M424EFl6rwDUTIAlW75J4eGe3?=
 =?us-ascii?Q?6O7Pa8x7uA9xriAcly8N8EqhQgRS5B/jEwRV9lR3mUAHgrLlVQCC8bowY+Up?=
 =?us-ascii?Q?X5YpS7jZG+Nf35LGRdWfOvHrdZwZS0Yej3cN6vX/X/PUhAhxO2nB7vGhOC60?=
 =?us-ascii?Q?dT4Wg7pVjc+MwlLxNybcdvl1cuZhj4edNei7vVrYKOyHWVCaYRkm4zdtMkdE?=
 =?us-ascii?Q?33aA8ZKAhlKEgrXLUYeVzKeV45ifOaFLN4C6kLy0Xhx/7GT3RKF5kTxKSrNc?=
 =?us-ascii?Q?XdN0KZoSdKMtWUrGuPFLDVYtN3lQ5DJS+B8hDDjLAT8YvTtMjOSlXpsp9OET?=
 =?us-ascii?Q?0yp963oSIY1VQczvaUxAm0ZIhzGWxZPcHF99ypDCnuO3tBQKb1Hrh1ZguJwq?=
 =?us-ascii?Q?ZZczxVSxRs4O8Gfe4YxvJYFnH4a9Ksgpz6PuF4DZvRBJCDHPUNsju0Yp2NyI?=
 =?us-ascii?Q?X896qYmc2rbu+dW0r9gckf0=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: af39c264-fa2f-420e-180d-08dd7807cf67
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2025 08:15:09.9612
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lqWXV/ps0yUaC1+XA2oWYXoh+B32hxpjEKbOS0s1sGpfDg8A5uw+6T1BNAlCBRsdwclv1ULUL624Z3Juu8ivME7fW7MNdOGnSSnH471Kx7BRVKTaSGzLzaMQTm4CADiC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYAPR01MB5660

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Pass `max_width` and `max_height` as part of the OF data to facilitate the
addition of support for RZ/G3E and RZ/V2H(P) SoCs. These SoCs have a
maximum resolution of 4096x4096 as compared to 2800x4095 on RZ/G2L SoC.
This change prepares the driver for easier integration of these SoCs by
defining the resolution limits in the `rzg2l_cru_info` structure.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Collected tag.

 .../media/platform/renesas/rzg2l-cru/rzg2l-core.c   |  2 ++
 .../media/platform/renesas/rzg2l-cru/rzg2l-cru.h    |  4 ++--
 drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c | 13 +++++++++----
 .../media/platform/renesas/rzg2l-cru/rzg2l-video.c  |  5 +++--
 4 files changed, 16 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index abc2a979833aa..19f93b7fe6fb9 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -355,6 +355,8 @@ static const u16 rzg2l_cru_regs[] = {
 };
 
 static const struct rzg2l_cru_info rzgl2_cru_info = {
+	.max_width = 2800,
+	.max_height = 4095,
 	.regs = rzg2l_cru_regs,
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 00c3f7458e20a..6a621073948aa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -27,9 +27,7 @@
 #define RZG2L_CRU_CSI2_VCHANNEL		4
 
 #define RZG2L_CRU_MIN_INPUT_WIDTH	320
-#define RZG2L_CRU_MAX_INPUT_WIDTH	2800
 #define RZG2L_CRU_MIN_INPUT_HEIGHT	240
-#define RZG2L_CRU_MAX_INPUT_HEIGHT	4095
 
 enum rzg2l_csi2_pads {
 	RZG2L_CRU_IP_SINK = 0,
@@ -81,6 +79,8 @@ struct rzg2l_cru_ip_format {
 };
 
 struct rzg2l_cru_info {
+	unsigned int max_width;
+	unsigned int max_height;
 	const u16 *regs;
 };
 
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
index 76a2b451f1daf..7836c7cd53dc3 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-ip.c
@@ -148,6 +148,8 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 				   struct v4l2_subdev_state *state,
 				   struct v4l2_subdev_format *fmt)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
 	struct v4l2_mbus_framefmt *src_format;
 	struct v4l2_mbus_framefmt *sink_format;
 
@@ -170,9 +172,9 @@ static int rzg2l_cru_ip_set_format(struct v4l2_subdev *sd,
 	sink_format->ycbcr_enc = fmt->format.ycbcr_enc;
 	sink_format->quantization = fmt->format.quantization;
 	sink_format->width = clamp_t(u32, fmt->format.width,
-				     RZG2L_CRU_MIN_INPUT_WIDTH, RZG2L_CRU_MAX_INPUT_WIDTH);
+				     RZG2L_CRU_MIN_INPUT_WIDTH, info->max_width);
 	sink_format->height = clamp_t(u32, fmt->format.height,
-				      RZG2L_CRU_MIN_INPUT_HEIGHT, RZG2L_CRU_MAX_INPUT_HEIGHT);
+				      RZG2L_CRU_MIN_INPUT_HEIGHT, info->max_height);
 
 	fmt->format = *sink_format;
 
@@ -197,6 +199,9 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 					struct v4l2_subdev_state *state,
 					struct v4l2_subdev_frame_size_enum *fse)
 {
+	struct rzg2l_cru_dev *cru = v4l2_get_subdevdata(sd);
+	const struct rzg2l_cru_info *info = cru->info;
+
 	if (fse->index != 0)
 		return -EINVAL;
 
@@ -205,8 +210,8 @@ static int rzg2l_cru_ip_enum_frame_size(struct v4l2_subdev *sd,
 
 	fse->min_width = RZG2L_CRU_MIN_INPUT_WIDTH;
 	fse->min_height = RZG2L_CRU_MIN_INPUT_HEIGHT;
-	fse->max_width = RZG2L_CRU_MAX_INPUT_WIDTH;
-	fse->max_height = RZG2L_CRU_MAX_INPUT_HEIGHT;
+	fse->max_width = info->max_width;
+	fse->max_height = info->max_height;
 
 	return 0;
 }
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index c82db80c33552..395c4d3d0f0fa 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -736,6 +736,7 @@ int rzg2l_cru_dma_register(struct rzg2l_cru_dev *cru)
 static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 				   struct v4l2_pix_format *pix)
 {
+	const struct rzg2l_cru_info *info = cru->info;
 	const struct rzg2l_cru_ip_format *fmt;
 
 	fmt = rzg2l_cru_ip_format_to_fmt(pix->pixelformat);
@@ -758,8 +759,8 @@ static void rzg2l_cru_format_align(struct rzg2l_cru_dev *cru,
 	}
 
 	/* Limit to CRU capabilities */
-	v4l_bound_align_image(&pix->width, 320, RZG2L_CRU_MAX_INPUT_WIDTH, 1,
-			      &pix->height, 240, RZG2L_CRU_MAX_INPUT_HEIGHT, 2, 0);
+	v4l_bound_align_image(&pix->width, 320, info->max_width, 1,
+			      &pix->height, 240, info->max_height, 2, 0);
 
 	pix->bytesperline = pix->width * fmt->bpp;
 	pix->sizeimage = pix->bytesperline * pix->height;
-- 
2.43.0


