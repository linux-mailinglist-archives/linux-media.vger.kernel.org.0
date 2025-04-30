Return-Path: <linux-media+bounces-31399-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E08EAA46A4
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 11:15:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D4F299A54D9
	for <lists+linux-media@lfdr.de>; Wed, 30 Apr 2025 09:13:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5985A21C9E7;
	Wed, 30 Apr 2025 09:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="gBz5TqLL"
X-Original-To: linux-media@vger.kernel.org
Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010014.outbound.protection.outlook.com [52.101.229.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC580158218;
	Wed, 30 Apr 2025 09:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004324; cv=fail; b=NXhqidajNKQQA/rLmGCwQo1x8D19VhK4jvgiLguAS5G2X4O8FXwRTmWUMJPuZei3u00MIT4k84EccXfsJtGRDCEC/3FLd5DtiTCb9IuEWcSdIYZTaIS1ZuX8SWOKUTJlxj9uOMlhGLdqhEGbCUMggGNP//UPNjJQxHywFxsJ9kE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004324; c=relaxed/simple;
	bh=xaI6xlMJ6lomQq9cmQnTfQESiuW9YEd93qRYsegzq04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=fwDwau1Noo6B46YWV96WbkNxcNvMvnWuqdq6BQ/9eO6SHsecAb+6KIbnIbZOopaEKrDrlWuQ5o6O4eOK81KoEse9iENF+FSgh1NRPt44dBQCvG4owNg6n4VdLUTHZ0qNfRpJxH/0WN2PjQrFX+ciObCPbvS6qd0UBoGudqKWwMM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=gBz5TqLL; arc=fail smtp.client-ip=52.101.229.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vHnWuZQaqmLJi7aWRpmuzVy+lseImIFoWlA+pq1xKAZwKB9/jAltBKEFjxZJ56/rNNqnoF+Q5NS3qyQAzsOKLK6zy/kKXqX2dx9gdm0YIF9fjKufTwU8KIjpnutY2JQZ+FC69MLRTjVAOXi/lvfGjswLHT83FbjBby0e7Y9Juo4G+VHGS6MQa89orQt6eGLb9+SayE2vBMBipffDkZ2f9pRryh89005gXqBpVuEMXBcbn6t2D4jclRGK8+yqBn7xRKbglpPpf6LsK4YJwjwJjfaH9SugJUQG4TwJRvWVHOW6Vpc0+wnoNDlMlQhV6m2w6KtMXcm64QadR/c6bEv1DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YIGN7QbbVWqeIoVEB5dsj9koVbXX01EHyzVZF6oADQo=;
 b=rAlb3kcM2SZDQNDVMHXmbcP7shkhKNb/Nw6e9MN8BWTWPeVXRQu7zeR7PGj6CuLv7yAbHOzC0zGSjV/0vqZJUSfzAAxW4BqaNvIIvhMjCxzCm1iKJnPtyroUxL8B7F8LMQOy42fxyyQJULfLPVpN5kAjkY6WzLzgSEXgPm1/CFKMPbRati16L8CYH1ewNJIAI35kSrB9enqBKFYrdgxmeoNAIZxQ9/jMMGhLxOPgD2VNEt+sRGMhZ36w8EwzYjAcTVxzvXbSdm8szCS0cEkxH5pCxHUnwLohacbVRZuXCj+Z0kJ/VBb7860+VmEALXiav6Sug+P6d4soho8vLf1TQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YIGN7QbbVWqeIoVEB5dsj9koVbXX01EHyzVZF6oADQo=;
 b=gBz5TqLLvPWvQ0adpRViX4Cai4ihWpzq2m62qhX1b7Wh3JE9PGcvmEksY+Ev2IZCTgXQ71jS6ZDRFc6yOXpYch3whgS8Ssu7EEj7JY2hBRiEGZ7EmGgJvnvFBtbMP8GxhoiB7XCdiCOFZSZhao0Vx2Z/mVoS7JiQHKhZj94QoZA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by TYCPR01MB8770.jpnprd01.prod.outlook.com (2603:1096:400:18d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.34; Wed, 30 Apr
 2025 09:11:55 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%3]) with mapi id 15.20.8699.012; Wed, 30 Apr 2025
 09:11:53 +0000
Date: Wed, 30 Apr 2025 11:11:35 +0200
From: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v2 1/2] media: renesas: rzg2l-cru: Simplify FIFO empty
 check
Message-ID: <aBHpR18KE2l6VJsC@tom-desktop>
References: <20250429091609.9947-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250429091609.9947-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|TYCPR01MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: f61d99b1-0f35-4e6c-ba9c-08dd87c70c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?uyOebyDnpb3KGbLNtvP00Juf+w5yHEpyg7v9OijnuJStBaR7zxiapNekD6Me?=
 =?us-ascii?Q?aoFYUWggWg4tCcsanubuS/gaBxiu1pgiLT2/ftwG8pB5K1VoyXpoBJp/bU9p?=
 =?us-ascii?Q?YP2Yaf4WwwjhRPVVU+kXSHlBgHMF4UcdH5q/mHQOZocHVeq/KBh/MkbSRblF?=
 =?us-ascii?Q?DcyTVsJd1neg/85uPeZvJoYv/f1Wrzs8DLMIKzdLnP9vbfierhhvhEZZukxT?=
 =?us-ascii?Q?8LHwW7CEBGHHH14XMCb619xTFJrUh1DkIPIlmEDAq+26VDfDPRdcBt2NujP3?=
 =?us-ascii?Q?fPTJsqpNN2SehdXlAL7kVDarzcO2iwR0fWGy2Wm6ZmcLreq9Qw/Z9BiDvy6v?=
 =?us-ascii?Q?2CRTgZs2WN071LSEFlKLaQ/2N0ZwBe6rSv3XAo6qbDicUIP7QssXUrjHTIRS?=
 =?us-ascii?Q?5uvvgAWToTcose64ZnMKrs2znzyfKMWN/70EF/AqTrJQXlnvIwdVZwDlHKdP?=
 =?us-ascii?Q?elbYMDUfPpqa/nEu5Rkv6yWvM2byY/NPmumcvRISwbGbWW+y0wnvap1eUjMh?=
 =?us-ascii?Q?YkjBGiciMjz19FVfokPBvszjOXtxpUSWqmThW9ACOssSdEg4blGKu9Gb+0MT?=
 =?us-ascii?Q?XMdawkJlkAveQ181yNMH3Ov6CIDONQ3d6I+eL48l99lmbgYBoUoO88cKPubz?=
 =?us-ascii?Q?nFp0Mi5Xpl5HEv+ZP5h/kCO6UoE+dkY6+cV4QQS4+Z0/9yyV9i3PorqZHl9g?=
 =?us-ascii?Q?H9APy+4KS0ExRjVjQDnP/eE02GXP4k0O6R7OZ0fmemzOdwX/1iV55jVaPWDY?=
 =?us-ascii?Q?9pgDR6AJa6qTlHVAs8GSqIpMTYT9fBddvkh139C2HJnOnL0KjZQlQMt8pqb3?=
 =?us-ascii?Q?gpQZ3p5owYqpf3N9UW/sNy8rVaDz2oM3DiDhVQPXpJIBIImuHasnDkH6OA9Z?=
 =?us-ascii?Q?QqxT0Cxp0qFeyxZqarE64ZkvfBuTHr8nxgFZEl8MmT+yx8u3da+pG+yYD3aw?=
 =?us-ascii?Q?eKtn2OggR8cNR636aBe1qDPzBrUUbyoVv/6KR52zXLNyqqMBbchN1I2DII/G?=
 =?us-ascii?Q?xgPsfRM+6EBqZpNhFSAhxiGOuKeqdKHQqAn63h4iFyuqmeZ0Kttu/2Xrn7vI?=
 =?us-ascii?Q?9iRXDjkyVzJljZjNb7e0EZCGMBHYACdeCiiju0pAG5F7FrqAS1x7+8K8H8TP?=
 =?us-ascii?Q?qOrCoPxPGqh5pQ3D0QzV/7tqgOjsSy5EiU/7hI074mcjv+ZLWPB8wVmnE9iK?=
 =?us-ascii?Q?f9Z9roDLZRnCSLT+QnqyuhTjw1RwRMIWxXfgwrDc07Rk5NrTpgBcbdQMrMR5?=
 =?us-ascii?Q?jJgFh8ELg1LlCJF41JQCC+PCMxY3EsLPGzhSQS7T/3YjCaI2R9ftbm4WdNt8?=
 =?us-ascii?Q?tEu8JjruH1OK8MtzmI4s/lTrJUWQc57XOXrnUIxXM8Rvqm4IGov5pNtSXWNc?=
 =?us-ascii?Q?UgDyvNGpAluddz5wP/l2r6voMCVzJKnm/6Qmwd0mJMF1L0O22KwL9SWnnliU?=
 =?us-ascii?Q?409qeC8b47SaRQT3AUvlj78ZU4FXizULtD5prDyoty/DQZ+7GkTiDh7OXOOi?=
 =?us-ascii?Q?GCx9uYkXATGgB50=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?dZ1yaLxd/0j6FYY5pMg5EZTjinbYg4YMnTQ0yMKsO+gPt59SS7t1XVnc22af?=
 =?us-ascii?Q?ujLwavydf7zVMP2pkbyjT4+4Shq2pkUWXo5PWPlGugSkRYXqkW8COVNYVAoL?=
 =?us-ascii?Q?89HffajiJy0gWBVx5k5IL+c+pg0MWkkK00djurTVx7OJKUyIPbXqAPfkzOOT?=
 =?us-ascii?Q?TVJNCdT/ef7SK61jlebitKgpwWyqr6g7T17gishx9SaRQN2pr8kopT8DUz26?=
 =?us-ascii?Q?9rgrkjSoWMBnJ/DQ1LBtQqXnBYYP9PwLyFrYETSL7n1sEz6bsC+Hy3CGBVOl?=
 =?us-ascii?Q?JMvtv5GZZczFPeResVWmy0X5kRH+qw35xnRwrd7v6pjkeg3272Yvkmxqgsj9?=
 =?us-ascii?Q?lYbBpJXvB4fvfiVIqyrfKWH85zTDj2izrHbvq3fingqAaT/qqoM58tcD2tXW?=
 =?us-ascii?Q?+zBpHYJ1mEaApk1BaXfK8eeD4mFdQmbibos2A9o2xXt8g4b8gzacs8bXzPfm?=
 =?us-ascii?Q?RxVFrIPmwziFZ0BtxC+ZMWzlpd1EdyBRWKocgVQueSJh4jefK+Pj8fXzUqaH?=
 =?us-ascii?Q?GSHEmdBrCUNREiWrtIgJByjhMBshG6Sz/tgn9Kfe0kNMhwcAVGpuhqzCP5dK?=
 =?us-ascii?Q?mBzgWgV6Wp/wybK1d+yyW95tKnhDo779lBOO1g5gh4BQB9WBYGN5tvDmmuCG?=
 =?us-ascii?Q?sI0FfbQF0UF34PiqiEhaldJsCotIELAzkwNbIrRC3hYuu29MXKflSokZAybQ?=
 =?us-ascii?Q?Ws53epkHX8mqnRmPZsoDGqUVnUj97o/tVotywnZrMN6lpTokqBWQ6b2vlQ9Z?=
 =?us-ascii?Q?JrVq8mZd6X6DqX3NcbQsHS2QUN2RS/LOpDqI/1chqVU1MS3ypkrzHYwEEyF3?=
 =?us-ascii?Q?7B9e7DqFpLZuiBmY+yeRBW1Gzo1cWNUI98LUkwrAl/mPqWkhc+dl7ocTp1K7?=
 =?us-ascii?Q?4gsKypb8achtqyl7KA+oGe8CyR3cluA29z2MSg/jJaaa+JGb3R2qUgebZP31?=
 =?us-ascii?Q?iDbJwAzYECg0AqFD/n+Um8IjvR0fdwl2IIZhW2HLVjGp/uNU/KhJ1wtaugXD?=
 =?us-ascii?Q?xrcIEwf81GWbMiM7myq9amvO+G1znHguhqZMlmWfjtINz0TJKujMKvnUeN+v?=
 =?us-ascii?Q?xVASvvbuGJ7GTvWGLDvHt+6CsOMhb/tqJSymk9Z65kPvzSjCA4BlBefOQLZk?=
 =?us-ascii?Q?ZBvJm+gTXVQrfXLndtBp4TmQna+79kM7tmaRwWEaPGMAM0CpMLFc3UQzYKvS?=
 =?us-ascii?Q?gBAZomtQEwf+A/ByyacqReizXbDhxrk6pP9/5oyDsb8NSJHASIZcuiKBkLVh?=
 =?us-ascii?Q?x2oa33oglnY9ZVJAweBcpzqJzvqg2xBLMAoD6QOd34J1j5IEmVlISljsDH7s?=
 =?us-ascii?Q?qHfRdGEU/c71JKvqozPsmSRjVPmKriiuNCBNZSenLHz9jDvSwV2bVmeaG9yL?=
 =?us-ascii?Q?uRhHBKLM1A84gRkQc/EVsjS82o95KUkfeS9KR+ufknc2iffJnrnK3TebfxAj?=
 =?us-ascii?Q?k0rQJfR8vh9aanCB4j5ciK7jOCvvt7r4gnmWQk3xVQZcNK33f1KXFpLz+71P?=
 =?us-ascii?Q?aUSCZmjqxVu7q9YeLjewMt1PK5WWZ1Tv0Y8vWrKipxMzluZkeQklJDh5hyeU?=
 =?us-ascii?Q?t8so+F6S0MGG7kgxWnDU/WeW7hqcoLSWz75IJLbR5z+j6MtAkRpI7TeykOZY?=
 =?us-ascii?Q?f7vPfFnANNmnN15vMxLJoLk=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f61d99b1-0f35-4e6c-ba9c-08dd87c70c19
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 09:11:53.1448
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTsK5V6/7BanA38TAlB21ul8ciepzsNjL3P11OQKOTI6D9f+lwN+GE/0lgzwg6dt/D/d2aWCwBe7TcURLQg9jXfHTjm3VveyZyGl77e0e2XtZUu/WQ+Wb8xs7Cs7tJzy
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB8770

On Tue, Apr 29, 2025 at 10:16:08AM +0100, Prabhakar wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> 
> Collapse FIFO empty helper into a single return statement by removing the
> redundant `if (amnfifopntr_w == amnfifopntr_r_y) return true;` path. Make
> `rzg2l_fifo_empty()` directly return `amnfifopntr_w == amnfifopntr_r_y`
> to improve readability without changing behavior.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/all/aAtQThCibZCROETx@stanley.mountain/
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Reviewed-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Tested-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>

Thanks & Regards,
Tommaso

> ---
>  drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> index 067c6af14e95..3d0810b3c35e 100644
> --- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> +++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-video.c
> @@ -345,8 +345,6 @@ bool rzg2l_fifo_empty(struct rzg2l_cru_dev *cru)
>  	amnfifopntr_w = amnfifopntr & AMnFIFOPNTR_FIFOWPNTR;
>  	amnfifopntr_r_y =
>  		(amnfifopntr & AMnFIFOPNTR_FIFORPNTR_Y) >> 16;
> -	if (amnfifopntr_w == amnfifopntr_r_y)
> -		return true;
>  
>  	return amnfifopntr_w == amnfifopntr_r_y;
>  }
> -- 
> 2.49.0
> 
> 

