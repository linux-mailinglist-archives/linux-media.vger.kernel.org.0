Return-Path: <linux-media+bounces-41789-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B1B44B26
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 03:11:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E75258581F
	for <lists+linux-media@lfdr.de>; Fri,  5 Sep 2025 01:11:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 403C61E379B;
	Fri,  5 Sep 2025 01:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="X/Jr1Yjo"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010006.outbound.protection.outlook.com [52.101.69.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECF3F1DE8BE
	for <linux-media@vger.kernel.org>; Fri,  5 Sep 2025 01:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757034598; cv=fail; b=RcKsGlHumflPDAI+a+t7rBDOkVyn1nKnL1RhituxvgemXo54hiks4BPreAjAIy7wBUl/nacJwP07CwR29f2fhJqx7fN18nkqE0ln5WYdFZeVs6oDEd6hIftrzLwrBWcBsOJP86TgsX5GhBTb1HzEq5WfGjP7DlTnU1ZJ+w2271M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757034598; c=relaxed/simple;
	bh=Suo7rEfY2dDHKKJ16O3OI8keqQ39vXdTyuusGn8sa+I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=tBrw+0MzRhlKEQWD0kd4sc0L7CB0E+TpAMDLFCk10fKFhQm1HVRlW5uluO8JLre+XHYdVC5K2Jcp7KLD1kuPgPBE1xgJptfLf6+BMAhwI1KMXw8B7ni+ieSYvY1g8yxrV1AR+BswKk8MdPtoHpT1VvWirsQDe1cdwSmMx94hbEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=X/Jr1Yjo; arc=fail smtp.client-ip=52.101.69.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PSnVk9kEY1Ctuz/UQ7Lq2wsMQwV3mgvkss/+psMF7VBUY85Ues/Yk3wUsOpezom85I/GoavNa+TpLPQGlmFdYA2fqf5kdcWXAeOzOazRBdQjdjZ7WE1Pe18nieBCn1eEe+ezLLsBGfF0Xhna9ZfcCBAcjpeI6BdVjHhrpqgBt4mDR2U/2cmAi9tAmvVkOkA67rxA2H1ikQa6VeAPxWQC2hfav5iqB04s59dypoIPbirla38r8HAxNyn9bCqpVdhq+7tWJ4pvczGMt0S7MN4PlEHv0XXk9/iKHtJa5vO3odrPpvGwsmcpuyoUHZVb9Kll/7/jVKQiBMZ9WwPM3AC02A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YTQcbJ/DzUi7W9sPYs0sQfCMaxK6B5S6vRgLWohclZY=;
 b=ZUgKg0PDMHxJ7/YzZ0RbXgKUW7HIjF1DR8PSbQYxeS64V+Pm3lFUaWgJ0dl7Nu98zyzbyTCPI48WsmyIiMJDZ9aAvU220id7lp4hDwY2TeSy7vYD9R3cRILraNNptT/4oR4CKpIMa0HuHkdWWHn2QawUo1Zv3u6HZ+Hzm4/A+bvcKtxx89srgGzrMnKcIu1CPrGZ7YAq3haWZDGzgZERHXH4vEX3Tq5N5wANfO8O2tN7HnqyaCgmS65t+bdPnNjZGz7yKL+1jDN9l+FHMfD1067XGaAFKNAX+WPZHuzz35+cjAZQ/Aylyx1aP/d/pIsOE6kJX7I02KaZ8s9HIR+b7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YTQcbJ/DzUi7W9sPYs0sQfCMaxK6B5S6vRgLWohclZY=;
 b=X/Jr1Yjouncr9qUBpMlgG/wOuI24QhiSmWtkUTOXH6LhZEB56RAw7iHQyDtQDtEY+3TfuJk+Ze4LqxP2B+ZDBbCECx3MAKbHmas/sZPbI668BTal/JIE05Mz2FJSv6uM7QvHoLRZ+biN+lV2BGq9QU9ruK/XR093RkKEXnMwPyNxbgGfdrvqFxS6XL1GzBHkpswl0gpnWhSt/RPXX8hdlGHZMHCyJ2pTkJZ+rMi0X0JT5iGbCeuvrsu6JLt6JpzN1prdvH9n5k15Lx0ranwb69YT8baSxFAHwTeCMTmfDbj+Hz7DZtYmm0ak7WY7QglfoQu7xa/Oiy+Zn4n8hWl8Hg==
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com (2603:10a6:102:1cd::24)
 by DB9PR04MB9792.eurprd04.prod.outlook.com (2603:10a6:10:4c2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Fri, 5 Sep
 2025 01:09:52 +0000
Received: from PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87]) by PAXPR04MB8254.eurprd04.prod.outlook.com
 ([fe80::2755:55ac:5d6f:4f87%4]) with mapi id 15.20.9094.018; Fri, 5 Sep 2025
 01:09:52 +0000
From: Ming Qian <ming.qian@nxp.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>, Eagle Zhou
	<eagle.zhou@nxp.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [EXT] [PATCH] media: amphion: Remove dummy PM handling
Thread-Topic: [EXT] [PATCH] media: amphion: Remove dummy PM handling
Thread-Index: AQHcHbFgJB9UMRcx60qZxNjqRG1PRLSDx/wQ
Date: Fri, 5 Sep 2025 01:09:51 +0000
Message-ID:
 <PAXPR04MB82544AD655A9ED27E8AFE386E703A@PAXPR04MB8254.eurprd04.prod.outlook.com>
References:
 <0829592627e599edd611e603ad420b3e5c752f89.1757000029.git.geert+renesas@glider.be>
In-Reply-To:
 <0829592627e599edd611e603ad420b3e5c752f89.1757000029.git.geert+renesas@glider.be>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB8254:EE_|DB9PR04MB9792:EE_
x-ms-office365-filtering-correlation-id: bbdae6b9-a0ed-4978-c926-08ddec18eb24
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|19092799006|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?d4FLJpBKABZAytqG++R5xO6ThmSdTkbmF0TT9tBqLvpgAd5784QxLuVlvoBw?=
 =?us-ascii?Q?rgivHgi59vzZkba4O/2QkEc8L34mHwajJOUadXsBBRm9SQAqnzk0rda9iRzL?=
 =?us-ascii?Q?PPhc9o3V5lnfz/QTcp6jSoXDZXCPiT+l2MrhwhkO6auUxHloyj0jbd/adFDb?=
 =?us-ascii?Q?vEzLNKBKLYZFD7dgmxgZrYuEA0JF2YBHpfi20GcRxfxnbyNuKrFxLhHYKB7D?=
 =?us-ascii?Q?4YAiqXxCAko/dhsq+7o0AmjDkKODYL1Sc1zF9PkdvCDy1g5V2SJeCz2HJNJI?=
 =?us-ascii?Q?0QjFiTOhpzOZfSRxewa35fsPlmAKJQXDav4IGFYYJqP5MppIjzr76hRTQkUU?=
 =?us-ascii?Q?eZ7cF/E55x0lT6J/0mliv7iwKkYFMGk3kxSFCw7Qx36wzYj9xAmHfqO0bEQa?=
 =?us-ascii?Q?jqYOJdi25gLeqWksJPZILZp2VY9e3oU2HxqS0yxVJTQikxl/Z0hZdy7kOihB?=
 =?us-ascii?Q?9eSjuMLugsUm3NglsxBZvIGeNlAmSSZhS0Y+k25C/XlC2WbAJ6LR76saIsr6?=
 =?us-ascii?Q?8BZWlFvc7R27gIKAJV3u/cdJFmzf/G6WkuOsFlmCPNgYZGc913mqlXJVs+zL?=
 =?us-ascii?Q?F4tcgIYf4IoXXIme197lYMNxN8dByZy0aqQ4hNm7FVPi9Y8TVQ5v5w6vI6Xn?=
 =?us-ascii?Q?43WW2JlkU5Z+8opqw+JfIQDiIHuwS6+SDuSOOEbx2DoXfrhe2TA2JTtX41/j?=
 =?us-ascii?Q?ah9KTqwxEO9BhZOLvgopmwTLD49A+wtkNC0axmrGXbVH5ZOn9kPWUA/PQlAm?=
 =?us-ascii?Q?Skwdo1KcoeojnYjIKyjvaGHCmSLZFOSc4TvTGCFuwatOhcI/ExaX8Qs76LEg?=
 =?us-ascii?Q?ow2F4Sv/hLJhGKnuf7oFBtAWkqiMbzscqeBxzd21NPznLdRueSkm/Quc8xRf?=
 =?us-ascii?Q?dLZbvC5nelSZRe1cvQw5jAFX1HQYVH4m6PBKqjz4jhFzbz30REEeCIDkLwdR?=
 =?us-ascii?Q?5b3KN4N7ht+j+ejs3GZBgIz/dwOt6k6um+qPy962LD9QIv96REJU09rkLpFP?=
 =?us-ascii?Q?0J+WYLwiZIPGHg6he5XhAoCAYOQnAUeqeylMSF50V1AJNLKMb6/PrrI/af7q?=
 =?us-ascii?Q?hWByrrfaT+NpdAwPRPpXUgTU/dWCnX5M9RY6CI/urnTNU8hqKpguE7AppwxL?=
 =?us-ascii?Q?kq67/HukDahmBbQ8cX/juadpsOtAh+Hp+J2kC0Uw2Ju1HgIn688x7AYWzHEu?=
 =?us-ascii?Q?I/qoGKRn6ep2GRj8A69SeRIhxcwMJq3Lkf7xzcgV/HwxbUhSy9afINBucDe1?=
 =?us-ascii?Q?ZQtRlNvofuYJnVQTdifOaK+EvMsUaK3uRIOKE/FxAG4RK8RCm7e4eNH4Op4Q?=
 =?us-ascii?Q?y+vejP3+3jI8Kdb4aFrPCTbj43MnfGIMWvL0JpoG2mxECF/W+HV7SK+e0pcp?=
 =?us-ascii?Q?iixMePie3gs+n6pNruu4a527Hxrgr+1X5Ch5/VJx5PlgSqSGnmgR42v2BF3q?=
 =?us-ascii?Q?tcvFmAX1scVrG2rwKm1ZPr6twWKw2exAN7u5Omw8Mrca5Geg11HzJQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8254.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(19092799006)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?/ew7Efa3pnmYfgcjdLD6uNvUfQ+YO8rj23vivo2dY0MJjNT9MLMDzjPUjdA3?=
 =?us-ascii?Q?GdUnWMatFCgQQ7sDkVmcwyCf/NQmwLKQ1ciu01GyjFf0XLzKbx0OBYokKbbJ?=
 =?us-ascii?Q?T4SCUoeKHXZQFUGLsW8XpDIDzpXbnFecotYlHfgA6Hf3F4wQxvps90ZS4BU5?=
 =?us-ascii?Q?4MDdepKr3brusc9D+sUJs7UQoH2GrVssv0BlARYM3lBpSMhS7LBopOXoXjXO?=
 =?us-ascii?Q?6pLhymPiv//Eovha0tF5gMx5bC92O/jJGjZLflkEzZOqsdOKJDCSAxaN8rkP?=
 =?us-ascii?Q?vvVv12ycPa0EAw+MwUFaIFnjNq9oOihIs/XXkQcraiHgww9uyCiXBDEOU+kk?=
 =?us-ascii?Q?STWmb9q83OOgdbm9HBTy5zhEaYKR8KEQVLgfaeoUM1BrSCkaNKmoSDGkf3yD?=
 =?us-ascii?Q?eFeKM0tmUqn60ccru5iIindwbCAUQV2lXoX8JK6+9oBb3l75LrBv2Zt6et3x?=
 =?us-ascii?Q?YqEIHAgtq2miPcxYr0EB6tAQs1mZgsOHyXsoJupS3J65UM2GqwKyTuiFpFkm?=
 =?us-ascii?Q?abVu/KmdnI5Xh6tUePUm8SXixS1sxDFueAq/bIBxMRxzE+SktjqKakzK1Tad?=
 =?us-ascii?Q?q4Y1038sxpwZm8eOkLMSEmbUCZge0UMcmqQ0/7/KegvatUrAUQpsSCt+uTSC?=
 =?us-ascii?Q?0wTFHRFolaVxpd7sZFgZblbnePyZjHl55/EsEuoudoh8Bcdo5fqw5NbF0uvo?=
 =?us-ascii?Q?ROntWPQjvjbY9H0O3GPTVnPHKQwS2gYgM3qehvEvTQt2XARC6ZBb7lytrQ7g?=
 =?us-ascii?Q?upIj3bMjwHDO6OqP6u1py7qCCt6QkDx1AeiHuhLWT9vTdRvDjU1P7G9d5Tfa?=
 =?us-ascii?Q?keReZnhGK7A1Bh4nfQp18wC7WH2l9c+ry/QcBS1S/u39vNGBilQ3AwIxW+zE?=
 =?us-ascii?Q?mAf3OUslvjktx0+0/TmZDcVoU8brqZcLxcJ1I1thDS3Htg/KxtMvENDPlNy4?=
 =?us-ascii?Q?pM263oBFWZCaFuvBw2DPN7ogL3SJwuJH3csNWGmfFoJ0ggSe4xNK/CNm34Q3?=
 =?us-ascii?Q?JgbRVS8lWinpNRzBwx272/rGZunKS2s3V9WndHbawpmeKSF+LbdEm3N0OJx4?=
 =?us-ascii?Q?Yv1LMnLbUp1EonwRTWRNNcMxcQ5oix3Ol9T1Z2DVi6xQWRIHPImmXl/Me4YI?=
 =?us-ascii?Q?URq1OS+mWiSL3Z2xPnwR2V08IfdlXFAj6JAli7fj+btIBv8S4ffzRHl1iSbB?=
 =?us-ascii?Q?Jcwr14C/OYuPhSLjrI7iQXU4jlBVk5f9ugih8/QzohKSHx1lwMIuRJ0rsGn5?=
 =?us-ascii?Q?XAkrhEQePyqJd6LXZW2d6SPs36X3J+a/0pBDGZC8dDVxnq683eALiGItioIy?=
 =?us-ascii?Q?zD8HsOjn35il3H0JvmbTWIkVxCJahv+yJBeU8A8p04gZij/x/YOHWDais98D?=
 =?us-ascii?Q?fFO9ae/hMsnAX/eq10PqZm1tuyC+TrDXPjJ6Xe6ZJQFytsTK47B3NyGNLxHl?=
 =?us-ascii?Q?bLopw7CEqWwlVc+qby03+oUD9dNeEmr0IeAXHc+wCZr0yCVVrIDcDnW85I0E?=
 =?us-ascii?Q?uqD38pyevPOn8VzMjWE94M6IJMxGArxqzw6LH9t7lJuAqfTqP3WF28pNC490?=
 =?us-ascii?Q?o7RDeeoFEacx8QgyLNw=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8254.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bbdae6b9-a0ed-4978-c926-08ddec18eb24
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Sep 2025 01:09:52.4793
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XnaRTdCoYHA4Z1jzvIZxlQy6OAcst6ByzUGCYRoELntNi+KoDBUxNB4/lklNbVAnriqbuwi2MaHqBEIo9N16zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9792

>From: Geert Uytterhoeven <geert+renesas@glider.be>
>Sent: Thursday, September 4, 2025 11:34 PM
>To: Ming Qian <ming.qian@nxp.com>; Eagle Zhou <eagle.zhou@nxp.com>;
>Mauro Carvalho Chehab <mchehab@kernel.org>
>Cc: linux-media@vger.kernel.org; Geert Uytterhoeven
><geert+renesas@glider.be>
>Subject: [EXT] [PATCH] media: amphion: Remove dummy PM handling
>
>Caution: This is an external email. Please take care when clicking links o=
r
>opening attachments. When in doubt, report the message using the 'Report
>this email' button
>
>
>Since commit 63d00be69348fda4 ("PM: runtime: Allow unassigned
>->runtime_suspend|resume callbacks"), unassigned
>.runtime_{suspend,resume}() callbacks are treated the same as dummy
>callbacks that just return zero.
>Unassigned system sleep callbacks were always treated the same as dummy
>callbacks that just return zero.
>
>As the driver has no other PM callbacks than dummy callbacks, all PM handl=
ing
>can be removed.
>
>Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Ming Qian <ming.qian@oss.nxp.com>

>---
>Compile-tested only.
>---
> drivers/media/platform/amphion/vpu_drv.c | 26 ------------------------
> 1 file changed, 26 deletions(-)
>
>diff --git a/drivers/media/platform/amphion/vpu_drv.c
>b/drivers/media/platform/amphion/vpu_drv.c
>index efbfd2652721f010..2cca61f41beae146 100644
>--- a/drivers/media/platform/amphion/vpu_drv.c
>+++ b/drivers/media/platform/amphion/vpu_drv.c
>@@ -175,31 +175,6 @@ static void vpu_remove(struct platform_device *pdev)
>        mutex_destroy(&vpu->lock);
> }
>
>-static int __maybe_unused vpu_runtime_resume(struct device *dev) -{
>-       return 0;
>-}
>-
>-static int __maybe_unused vpu_runtime_suspend(struct device *dev) -{
>-       return 0;
>-}
>-
>-static int __maybe_unused vpu_resume(struct device *dev) -{
>-       return 0;
>-}
>-
>-static int __maybe_unused vpu_suspend(struct device *dev) -{
>-       return 0;
>-}
>-
>-static const struct dev_pm_ops vpu_pm_ops =3D {
>-       SET_RUNTIME_PM_OPS(vpu_runtime_suspend, vpu_runtime_resume,
>NULL)
>-       SET_SYSTEM_SLEEP_PM_OPS(vpu_suspend, vpu_resume)
>-};
>-
> static struct vpu_resources imx8qxp_res =3D {
>        .plat_type =3D IMX8QXP,
>        .mreg_base =3D 0x40000000,
>@@ -231,7 +206,6 @@ static struct platform_driver amphion_vpu_driver =3D {
>        .driver =3D {
>                .name =3D "amphion-vpu",
>                .of_match_table =3D vpu_dt_match,
>-               .pm =3D &vpu_pm_ops,
>        },
> };
>
>--
>2.43.0


