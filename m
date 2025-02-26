Return-Path: <linux-media+bounces-27074-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BC19BA464D9
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 16:32:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4E1833B81D6
	for <lists+linux-media@lfdr.de>; Wed, 26 Feb 2025 15:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAB3C2343C9;
	Wed, 26 Feb 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="JIrs05FG"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11011071.outbound.protection.outlook.com [40.107.74.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEEC227E84;
	Wed, 26 Feb 2025 15:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.71
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740583645; cv=fail; b=qz9nbi6+454RDyelbXqcn2TQs/1b9qOuqkVicEjXtsGrZYUSfEWliTyA8WWVxJmbzfWFxMZ8LejMTMjA3BwnAaxn8YX/5v/m/ciur6sI3NQw+mLxYHj6+/fheBOBAMjUBDfkMtivpbC5UYA/TV7UQfwn4VGNO6wnbBuVm+fOEiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740583645; c=relaxed/simple;
	bh=0N5J5t9Nsn6MQ8N0NQbhR17Kw+prrNc/0i0sdkpJAHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Rk4gL9lOcWMsE7FSwgRwQofL8cebTykxBZb1NfE9Et4oUopX6PAvpOHAO7Vh3myQzzOH/a4cZCBhCk8wb/aNqbOm4GdAcyx2nR8OEq+1fIE7jKGI+HDbUek2PzfFeSlr9Px0Cwtl2X3Ube2vizmGcHY853BQi9C2l+MO9GGKBg4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=JIrs05FG; arc=fail smtp.client-ip=40.107.74.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RGOWG9SlrfM3WWkcYK2JFRzVDcJ3CVeMooJSN1vHICzsRXLOQKnPBvgwBaL11FoLKt5LqH5Hwjlk2YrUq/6oBJlOdehAJq4eLQU0xuliWoPdIG1m66D/8iNqSnYAmdZrmxrL9xaFxsAQB2/Ide66w8tIuWHSbCiM8QpOuI+IQN6CfFfIIX9q1lRC5uYMLSiRDakCeHL3gNgsMUCPye1zBFozZihJszOt7V8YXeGGsNwgyqqH7fv9E0lXl52BYY0gqb4lnwC6L4ppbooQxq2B4LQ+ZIwsnoY0+hMR1ADT+Uh6OGNe3l+Zksl59msvq2rNqjBDoopcxXhF/eH7J+d9CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yraSZXqLZ3J13y3fLlZaaIF1WdGX/lHryhfcSMUfv+k=;
 b=cp3DBALIxBWzbWByIDz8HXEprg0upTsIRQ8oPSNh8RIZVqRYV4KF98iQtrSVvJ67RZ7ZT4uZbw2wL1dCjCypF6zVG5kQQ1AiuIPEEzbR9mCMXDvoX9FblZJwuWIuVVXmsG8+f6KaIG4+oTNhCyk5GKnMzLWeK3Wdot2wWC4QQ16IMTC4IVDkOkkzwfmrsMMuRzbE9s3AKBmne6G7eytHL3hr6QTEiZvLAcX5vSmYbE9pjNvdjoz3bwNmxpEeN32WMR/oiKW+dvrgHnMyRCUw6+tSQOu60lcGvygvioNM0cjf4E8ReSmOM+WVHrlFDaVHFCtUamFEP1yCasX9tVNKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yraSZXqLZ3J13y3fLlZaaIF1WdGX/lHryhfcSMUfv+k=;
 b=JIrs05FGhk4FpUPTSaAUBZdNfJKPgJN3U7zU+ErjU0MFY83az/5YJpq7uiKYi+YOm7ajaRyANeHinKI83go9xuwJTNAXuX83apR8b+HxdY4l04dsSw24Vy8OeqfrVToEbUQFYo10G8rVzQjVg8UvcOySYgiGjbJ7nGMXXUAFTVo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TY3PR01MB9826.jpnprd01.prod.outlook.com (2603:1096:400:229::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.19; Wed, 26 Feb
 2025 15:27:21 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.018; Wed, 26 Feb 2025
 15:27:21 +0000
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
Subject: [PATCH v3 15/17] media: rzg2l-cru: Add function pointer to check if FIFO is empty
Date: Wed, 26 Feb 2025 16:23:39 +0100
Message-ID: <20250226152418.1132337-16-tommaso.merciai.xr@bp.renesas.com>
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
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TY3PR01MB9826:EE_
X-MS-Office365-Filtering-Correlation-Id: f47a356f-d55d-4cd2-7280-08dd567a0fec
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|7416014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?XHtbLBvYLW4lbD5uH/fFK/BhNbHAZT8Juj0uQzJ2DgxUAPmF98/lQCsoSRwN?=
 =?us-ascii?Q?cvGfocje2HqVbRo0W0YL82ULIwbXU4lBlEsmUZuySTkA82+iMCnun3BvylEs?=
 =?us-ascii?Q?sNswCwGhaNKNOXqUpQRf8l0cqmWHsCF5vJUipJXweDc/gRojgIa2G8fMASWW?=
 =?us-ascii?Q?87Pwk/LyXllt4EvqM4CYLW+RU828lUPZeOmXv5OAwGCDE9bXKnXuMVgL2CNt?=
 =?us-ascii?Q?JMAM15cjecGttSoW8/uTHFLBRTtZA+7XuVHxEvSMmzEET6e5yIY46pYqQC0b?=
 =?us-ascii?Q?hHiZMJYwE3fS5lBAQeKXulqjBbqmLyp5sDFX+LKxtQTqXuyiVHXHRyAgITWJ?=
 =?us-ascii?Q?8b8EFZGOsJlr/E1gz5XmT6He5bbp0x00bv6YJNaX6qDfj5N7hSaLc78hRkxi?=
 =?us-ascii?Q?e8Yo4VeLA+ct0tXmI7PvhdzwcTAqab6PmGuHBzlTdRzMi2x3FYi40kDJZGgk?=
 =?us-ascii?Q?wG4ga2w6rDSBAkeDP4372ZOa2Aq24Sm3OOg/z85w7cQUxT9prddcrvwV56Zi?=
 =?us-ascii?Q?Uw0/c4tppKYm7FdcWneli2Ub2JoMzKti2VCwuBZDdESOpnZ91aeR/lO4sIj6?=
 =?us-ascii?Q?VXf5JKlmY3TaUiUnCPEwVAOklh7iGH++i84eHGCaVoKrcYgS7XnFe0tyXucw?=
 =?us-ascii?Q?mP69UqHRJl0Sae6wfbGySEW1RNdQXD8lv4nCPwewwlNxWZ81omBV19RZNN9K?=
 =?us-ascii?Q?6j/2CQoQXfIwIE8+xBPrrOyprSrL7v8ql9tfZcxHoiTNpnRgBw1bdF7q4WzP?=
 =?us-ascii?Q?PlNIVLyyr7eblpLeDTZui/VcuhEu76cXtOpvAwPiLA/KHzcF+Lz+2jMt4JWO?=
 =?us-ascii?Q?SymFtP5t0r8549gM/lxc+lI8NhQ8zvJ4w/yWL3Lj7dGLC23ji6HJrFZSjX7X?=
 =?us-ascii?Q?Fpr3U7M6BptmC1zOUbCFnXP1iUp3LJkHqPqZioF2uHrY3439mQoT2/dIfxVB?=
 =?us-ascii?Q?s2vu79D3CmbUC+Mmn6QMD2pjtGfTcT86txZImtLG0jiIL6JR3pKtvUa8tB4o?=
 =?us-ascii?Q?SAyd7FekwfjJDXcatoWBF0FOI1mxrH4yhubDsmnA6K2BEA2ttN5lfLSCy1RK?=
 =?us-ascii?Q?0eIR0y+96ekE8iqtcXohNh6Bwv6Cb3DpM5II3tltXh8Cg/5QjyOWQz5vG6BW?=
 =?us-ascii?Q?orcfle+rliqQIFy4ioqdqw2o+8K6YlqlkIaORgyFjHjlTKSV9DoEwr4MmIhX?=
 =?us-ascii?Q?TjKGjP877ac6h/n63bHESV6HJraziBPziyZncV28DJU/Ghk8Khr4tKreVm1l?=
 =?us-ascii?Q?ncsTB1vSX9pznPS6LSLb8R1pIPU4Q9obYssNNZ+yqV3eUD4vqJ6rwU3gWw40?=
 =?us-ascii?Q?rVzX30S3MNHURs9bqAFoRe9OSbtJD0lBgWg20cL9xChELwAWcZfPhlHSUhoj?=
 =?us-ascii?Q?oyT0JaKcOzdRueb9PWXW04Jwf/EM4wNjrwp/MsLPNwo6S+rsPww8cRbG7cHz?=
 =?us-ascii?Q?EmHiOBu5pQVxpuUVNONjtcK4131GIW8k?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(7416014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?5MICf6BWKIi3qTubvhW5x6UfLtWKYGmxh5TUx6J3fPwrAhZ4jQf8ZHYEYCQd?=
 =?us-ascii?Q?NoVosYMjRRAF6p5eEVQBESuwTc2aFKmOayYRDUDomdnLuLZPxO26nbutuUx8?=
 =?us-ascii?Q?2zL6bnwhAT8DyQb1qvuf914tJKNiR6s+OPIEXK3tldTWmVHHmRhpB4aJJ51m?=
 =?us-ascii?Q?SBBbycO6dohVlNpISTbPyQlwneeumwb2YW39f5hjzI64bTGaMQoBtq4yrXnH?=
 =?us-ascii?Q?lEcOzoNj7lCn6TRNHRxhL0EaeP1B5+mPdlUd6ZNpnebUWF0at+bn4YJwQ5As?=
 =?us-ascii?Q?X/SDUHue6z4em+Ow+hWPujw8z23MJLLP2UbMz3/mP3HVfh2mz3OJLZvW8Hq0?=
 =?us-ascii?Q?I2JUjK+K+DZCn7P++Sjnw6APgq2JuO0ysGRXa5OELR0cm9ad1gPFOb5k5Zbq?=
 =?us-ascii?Q?irpex4vzGv+yW+lUf9EHsBvzfQA97vxsB2ZWEKsUYheBmnrYgmgZ+QEXt9/D?=
 =?us-ascii?Q?V+aeWGNC/Jx46r22wsaQZlbf4mUL/45EKEYxiGzbRVeRUmvMmNeLoptT4ep4?=
 =?us-ascii?Q?M+soKMn/+0Xm7fmGCWex/wHaFc045cu/XxFqUME7JT30kJJxR7NG2In9joHW?=
 =?us-ascii?Q?eC2Ca0bSDmWTL+htqAICyqJvKMwEG7b360CPQ4Z2GWhwUZ09juznT40ADkVK?=
 =?us-ascii?Q?T0kPzxs5QVRBd/ZJNjPLjA10VANRMuGg2n7JhV3nr7344LyMBMHjrdvQNWUP?=
 =?us-ascii?Q?ul4zO/SitCJ6xLVAzFJgtNYsUDFkf0d2ut/ESnyWZji/YTeXyb2OJ6ifVm4i?=
 =?us-ascii?Q?iAvbVHm6gwP5tTd3Fq9HiDDe82ZdnoaSgK62bgxsSqMv5LPA3Yfxi4H8f8a2?=
 =?us-ascii?Q?yol2Ar9VOiZuLV/S/dOKBJTeYeAzZRwq7SZES0tmgGR6I5eHItbJ4ae+oGX2?=
 =?us-ascii?Q?WLS4dHwr0mHBqpJyxrZslC2uoBeIqQi3OI/Fm3ZS3Vm/HBW6H/1JClDe8Ovq?=
 =?us-ascii?Q?YayNXx7jcBGi4t6GmmdSWmu+vg/Bd30sk6Y14grTG9GBJGhmJCSj+QDbvcnN?=
 =?us-ascii?Q?fQPV9U4C7Rgpc1K5HSNGsIVgBStXzXVODcfkWbccRLLyXCM2Ud5kCFWyqd0v?=
 =?us-ascii?Q?pqO4YvN7vUvd7PQj00n9mS372MewJbXePGfTZeBQJ+TjTJOGv9f6KiPTtayf?=
 =?us-ascii?Q?EzthX6u77D39fYeKHuhre0GmiMivI2F4kT5qzyB6r8IZmoe5JUdQcBIMg7uq?=
 =?us-ascii?Q?y0eLV97O0I2LlIpTQ+ILhx7vFzqZUa7Q9NcHMZVxr54UAIQwE2gvpuW5eWdT?=
 =?us-ascii?Q?j6TrwJ/6apj2KQ9hFczx3lobF20ZTozpxDfF2u53w0dAx2dm9duu7URuSbhd?=
 =?us-ascii?Q?LhqpZVNgx7LoiibvvVheN0P/8oH6VeuUFvfrlGKKcqRd+nl7VAjDd1EgjGQU?=
 =?us-ascii?Q?3g1ma8c17JXG5/q5Pc/QgmCucrxbHmUARlAFf270GcVY4+Q8SvHeGAlLbWKs?=
 =?us-ascii?Q?VbrkmgrcEndLVHzKKLLxRz/mj3qA25FSdiK9NN//oGnbnQ64Jun1MfFpGFEh?=
 =?us-ascii?Q?WYv6HkXa8RWw5SSRxF1zuO+mXZ6qM7jSPetrQIwjuz0DK/wghIHmZSv09RXU?=
 =?us-ascii?Q?UcYagfceKjYyB9cZdsgXgJJ8D9NtjmUhbxJtGEN/YTYp115+QKuxXMpHVfk+?=
 =?us-ascii?Q?unaohh035Mmwz3umRygjTxk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f47a356f-d55d-4cd2-7280-08dd567a0fec
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2025 15:27:21.2921
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /+Z9KTCW4ljQbRdxi6GDlJ6h7Zgd5gSfC7nBAQZmqsQIBqsmNDWUk7IuKXhl+YiOML6belXlXHxOPWVjxgf025MD26A1TDwRMlGQedhHN9De0sGVelw3UG4WEcv5BzdB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9826

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add a `fifo_empty` function pointer to the `rzg2l_cru_info` structure and
pass it as part of the OF data. On RZ/G3E and RZ/V2H(P) SoCs, checking if
the FIFO is empty requires a different register configuration.

Implement `rzg2l_fifo_empty()` and update the code to use it from the
function pointer.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v2:
 - Fixed return of rzg2l_fifo_empty() as suggested by LPinchart
 - Collected tag

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   |  1 +
 .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 +++
 .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 23 +++++++++++++------
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 302f792cb415..e4fb3e12d6bf 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -362,6 +362,7 @@ static const struct rzg2l_cru_info rzgl2_cru_info = {
 	.irq_handler = rzg2l_cru_irq,
 	.enable_interrupts = rzg2l_cru_enable_interrupts,
 	.disable_interrupts = rzg2l_cru_disable_interrupts,
+	.fifo_empty = rzg2l_fifo_empty,
 };
 
 static const struct of_device_id rzg2l_cru_of_id_table[] = {
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
index 3f694044d8cd..2e17bfef43ce 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-cru.h
@@ -88,6 +88,7 @@ struct rzg2l_cru_info {
 	irqreturn_t (*irq_handler)(int irq, void *data);
 	void (*enable_interrupts)(struct rzg2l_cru_dev *cru);
 	void (*disable_interrupts)(struct rzg2l_cru_dev *cru);
+	bool (*fifo_empty)(struct rzg2l_cru_dev *cru);
 };
 
 /**
@@ -185,4 +186,6 @@ const struct rzg2l_cru_ip_format *rzg2l_cru_ip_index_to_fmt(u32 index);
 void rzg2l_cru_enable_interrupts(struct rzg2l_cru_dev *cru);
 void rzg2l_cru_disable_interrupts(struct rzg2l_cru_dev *cru);
 
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru);
+
 #endif
diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
index 8995aa254c17..83d7baa07dc7 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
@@ -290,9 +290,23 @@ static int rzg2l_cru_initialize_image_conv(struct rzg2l_cru_dev *cru,
 	return 0;
 }
 
-void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
 {
 	u32 amnfifopntr, amnfifopntr_w, amnfifopntr_r_y;
+
+	amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
+
+	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
+	amnfifopntr_r_y =
+		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
+	if (amnfifopntr_w == amnfifopntr_r_y)
+		return true;
+
+	return amnfifopntr_w == amnfifopntr_r_y;
+}
+
+void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
+{
 	unsigned int retries = 0;
 	unsigned long flags;
 	u32 icnms;
@@ -320,12 +334,7 @@ void rzg2l_cru_stop_image_processing(struct rzg2l_cru_dev *cru)
 
 	/* Wait until the FIFO becomes empty */
 	for (retries = 5; retries > 0; retries--) {
-		amnfifopntr = rzg2l_cru_read(cru, AMnFIFOPNTR);
-
-		amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
-		amnfifopntr_r_y =
-			(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
-		if (amnfifopntr_w == amnfifopntr_r_y)
+		if (cru->info->fifo_empty(cru))
 			break;
 
 		usleep_range(10, 20);
-- 
2.43.0


