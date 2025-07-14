Return-Path: <linux-media+bounces-37595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E97F6B0388B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 10:00:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C1A51898F9B
	for <lists+linux-media@lfdr.de>; Mon, 14 Jul 2025 08:00:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD6AC23A9BF;
	Mon, 14 Jul 2025 08:00:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b="alxXQ7TA"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011013.outbound.protection.outlook.com [52.101.70.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19946233712;
	Mon, 14 Jul 2025 08:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752480007; cv=fail; b=RVOtNk6A8h1cdWVKM02culK+3muV88hvOPQ81W0uC3aOoAtV9pfbt185pT7ICJ1OzlLDw26HHbIXC5oLTEiIaSz3xHlOPLF3FJ/yOLx/kXIziM62nmqAOwCPYb3LsSmpg155qmss/vjk9Y2pZMxJ9FCBjvi3oRWLBas7bLLMLVY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752480007; c=relaxed/simple;
	bh=n/GWHW62R+YzYz7cBONCAqZNunYquGSKDpfV/YITcjA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V0wuxxW++3jpzGgoYBUUX+yZygre/ssbLImLtzbD1ZAvPd/qiWjIPE/6/vyO31ghM0jtgBU8UbIDwBczNXPxT3bGIkr/8A96pGyG7paaBbTqGB+9lzTqS6ZNCWiRpMhrSdfFqE1GQrev9ibNm7VOxoO6uqy8YOllLSDvWHjm/q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com; spf=fail smtp.mailfrom=mt.com; dkim=pass (2048-bit key) header.d=mt.com header.i=@mt.com header.b=alxXQ7TA; arc=fail smtp.client-ip=52.101.70.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mt.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=mt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVyonISo9dkcU/XHt6WM+OcMFRBu8nP+DqVYh0pTux0t4KVgArUzhRpKfk2/G+W3wjBzFMW5RJDSVzLOSpgcHWi9oTJKujx3E46nO6/IXNQLwd5LDBjHiTE6jdEmGVsN03BkbscMNvhkLuAUAnPyhZXQSj+whzuWT9Dhs1YrTiihVCiwPUXz6T1VX9RSbccI/s5ZFgI7yJa+oPYFinzx3ZOnvNLid5Y5EpWp6OA5B89yk54Eay0qyiTEnx7v8cLCDX7WGjEwTvSh1gRfwUpUfSjo6+r/jN8HaXrzMyswGg0ulcOH0TpMqk+VZZ9DZpoaMuFGBxJ6znYzsVJGwMYMyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rmGzx/q977/RxJoTAyD0/j/L28psoYtSu7uynMGlF70=;
 b=D1odQS2Hsn7SpOf/oHL9TAsk0rC3U9s3alTTiCe/GoOfx3bsonbCYBfUOJkBJIJVa2fLZCp69L7FCCiLyr7/5YvZOi5u+dAD89fqJpLDg0gSqempA5y3C6j4XcxG6gUFRvJoAuI1f0D/thI3JGEFAcfaznQ07gedJ/cAipX4Cv2w4JuPchYPAGCM3sYLqaNNaDI5UCVwE6EaGs+yWxYoLvzqQhiT2TyhIDIVx3XkCPr39EUN6gOUuGguxJKFHyOqhzP4Z0FToNO08EYOdYjAWSfRnswyYpKqxdlIPNqR9J2Xuub86Uq/eebaE696Wj5S7IhbgAH15t3Vlh8pNk88TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mt.com; dmarc=pass action=none header.from=mt.com; dkim=pass
 header.d=mt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mt.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rmGzx/q977/RxJoTAyD0/j/L28psoYtSu7uynMGlF70=;
 b=alxXQ7TAL0U/4xEiab/KZ+3I8NluzGtmSHFb2VcgxouQdElq9qOPpIHkpMZy0/LwZJnDXuzXNHqDNfRkXvshqFaacaXS2/R/PP1vV629nbu3q1ba8Au+HGplcLYo0LtXOPBMURk3nGGVAfq1XmlSLlNY1DbC76s0qSOWBKCrzFHxec7oLAQTUrWqTKhnpQ2yMd2PjJKGhPqOynJmnrUXCYMNc+8s/y1y31wMpA7s59P8E0EHBRaH3EncKxYyos+W6YOa/YeEmGG3qEBeRZUGgVWKhGzcpY0HfznqohhbeU2DUupMX8nnONjbvft08WnGCXHd6QEqW0O2I0+w2LiHAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mt.com;
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com (2603:10a6:10:2cc::22)
 by GV1PR03MB8837.eurprd03.prod.outlook.com (2603:10a6:150:a2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.25; Mon, 14 Jul
 2025 08:00:02 +0000
Received: from DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54]) by DB9PR03MB7755.eurprd03.prod.outlook.com
 ([fe80::2ef6:ec79:4089:ce54%3]) with mapi id 15.20.8922.023; Mon, 14 Jul 2025
 08:00:01 +0000
From: Mathis Foerst <mathis.foerst@mt.com>
To: linux-kernel@vger.kernel.org
Cc: Mathis Foerst <mathis.foerst@mt.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	manuel.traut@mt.com,
	mathis.foerst@zuehlke.com
Subject: [PATCH v8 1/2] media: mt9m114: Allow set_selection while streaming
Date: Mon, 14 Jul 2025 09:59:26 +0200
Message-Id: <20250714075927.511610-2-mathis.foerst@mt.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250714075927.511610-1-mathis.foerst@mt.com>
References: <20250714075927.511610-1-mathis.foerst@mt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0108.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::23) To DB9PR03MB7755.eurprd03.prod.outlook.com
 (2603:10a6:10:2cc::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB7755:EE_|GV1PR03MB8837:EE_
X-MS-Office365-Filtering-Correlation-Id: 478b7482-7fdf-459c-ce93-08ddc2ac6f85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|52116014|376014|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SMu/2XCE0ONWzmfZ99L22L46dVwIU+XA5uRQ1hUq37Q9VF9Da4/HIwWoW+qG?=
 =?us-ascii?Q?yBKnKDSflqXmcIYoodyb5qePjJEhj69kuYapLag4UsUK8ixDZnjtoRiVejdH?=
 =?us-ascii?Q?FFj4wJIFRjqTstL+XAAohbQ0huEuRH8ChUnRKGmGrXJgTssnR/fnZ7e34LIB?=
 =?us-ascii?Q?2wYHfWqwD6sDifwmv/S3Js950obqUgkaJKUeI4VEnwjjdl2DvmLfdA+rBs96?=
 =?us-ascii?Q?W9129wNkaArCeDZKjIa9o9H/c/LBq1QrpR8gl5EyMxLN0gQUDgFZMjzkkfg5?=
 =?us-ascii?Q?u0CVG1gOQAzZtyKUlLVs3x3O/ATj+yXwjdJ+GV0hfVJSaY/RytSmzrE/wpPe?=
 =?us-ascii?Q?oe/0PbgnidPHT7CGOVkxNNPMFhLek0AkdPODfQOIh6/zxYWXIf7oqwUzTzRl?=
 =?us-ascii?Q?vsz8XG5As+R8+9JjoIVEGiDwiZxhRlde2N8kt3Ddq5lsFEl10+8sf0FCFvtb?=
 =?us-ascii?Q?J6Y5APCHL/7SJV9JmLgEspVXlSnqoZJISqNlbsWjSpDMByuiCMItOh337wtv?=
 =?us-ascii?Q?b+wLYD6ht0sGLzjYf+luvjUZ3hY6GQONERr6jnvD7frOSgj887JCK+lFItOr?=
 =?us-ascii?Q?H+iYiOKqL8ivqVY8KA5j4mb8xLaPjdexKk80H2aU8D5T0EcTKxnFSOEXQ2ch?=
 =?us-ascii?Q?NQd+d+GSXF6PqrABSg579dnYnZxqeqGX9CPPOWCOX68nY8q3UBGjxbbJRdp2?=
 =?us-ascii?Q?oMaqo6hJ3epPUjuyE7Yz63gA3Q2TW6JlYIySBzVu01kLGqkKyjjdLtuGe92e?=
 =?us-ascii?Q?eEdoLzGz5+SZ3CrbTFeMovP9+Vul4Ws6WBSdTuS2PLNg7BxLiZKWBczj2c5S?=
 =?us-ascii?Q?Ow9kapw7I9nGOHHaimY0BHlQ62+HlDRHsUimwp3LqVUc8+X0VMQvLyfNOXM8?=
 =?us-ascii?Q?Oqi6z4BLDPbeuizQziMOftcQdYz7bEH+DYCzDYXwYMGvRoNi86UZgLtChGu5?=
 =?us-ascii?Q?w+nh9PS/l02bzHG2wGb3zYpbCVthOSFML5TOrrAqxuvQxJ2vMJTJkMYAT9FV?=
 =?us-ascii?Q?qTZ9wYm3fA6jgx+TbQqb19rwFiVdj903adPAQWUbVHAO27Zmq+FP67SCSoRf?=
 =?us-ascii?Q?kiUk5GuBNFNeCiBQiiOYJYB/dtTAnxlHdYdV6ufW75DQpaYewsRSbFAnq4JH?=
 =?us-ascii?Q?KcqF/vrh3bN7eSfWZWNmrDw6c/7blrY7pXM9oWe1rlLbsn55qBUmytfJcl5u?=
 =?us-ascii?Q?QjanXTWKCBbCfVHORUTxSauz5cmmLudfBipEceHB0FVcXK/MMU5aa6DLErxp?=
 =?us-ascii?Q?BA2s6kY1+kL5OIaRsHefMVoJ1CWX6BpBFsUWgdmm14UQCZ2RFHZWUUw4QksS?=
 =?us-ascii?Q?ugZ8h1Y6IacIxsVu2xKNkAugQA6BUukOtdNEu6hQEjukdqNkfC4tnePInM75?=
 =?us-ascii?Q?DwM5M//RVcJv6mDUmAFzTP1GZixA6TTQy0WCpaadmrb34YFSabA5FvWVf5xP?=
 =?us-ascii?Q?QQOanSKUs7snIE65sy7S6mjiByFI+M+Bnk5mzhsVvX9Gq8lA/MUmqA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB7755.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(52116014)(376014)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?GzPD82TIXfuzYR5bG23hpiFjzfPaDQ4W3ajHtvg/IydhEPA+M8jd61ODt8LQ?=
 =?us-ascii?Q?gktTpcCpM4tvoyDYtBFRyp4JsdLUmgKpWmp+lvaYp5s9RZ+U2n/iNgmV6Eir?=
 =?us-ascii?Q?Ztd4RwI2JkiBLXCxz4R0t2Z65g4tZ5i+2k6CV4JfrWYMpElqC53f3V5n+6Jr?=
 =?us-ascii?Q?bOQb9YaFTgGek6HzU5WptpLk/SMQIfL4lHn367dd3zoubliax6CvS2DQnb5d?=
 =?us-ascii?Q?NzHFKzZg2h6icQsma/7MIZjkkDHi3qZ6rUUB2tT+hYXFNeJQF4yuyYNDPz+H?=
 =?us-ascii?Q?Jcu3K1Zggnwid4ebO1KrQgJK+I/2RGhMOxcTc0bB1jRBupvdU1Hjj3TvY2eA?=
 =?us-ascii?Q?gIUPBVrm47tzmvsqNwyOX+X0uN8LfSzir+QHyTt5NtGHZ3/woPPygGP+oa7G?=
 =?us-ascii?Q?Z7AlwFMRXXuOEicvWtRsC5YXpcm2N8KN61NcGEFAFnfplz0yq33Ne8LKYi2o?=
 =?us-ascii?Q?5BLAkWuHPjdlHa+RpK55sSHpWLllA6pdSoewFSU7ZLN7A/A5F/EW5WvMOSJ0?=
 =?us-ascii?Q?banKD5ouLVxnbs4o35IF7yb+DjvBygo40xoODXPZPtKUyswyzm91jbVTgJ1b?=
 =?us-ascii?Q?UN+zy5Bk+f9EV3UUlSz2rxtAZicg32YXOmGFnDRf6qFyk0Xhhl6m84SmP94z?=
 =?us-ascii?Q?59usf/HI2yQUzu76kUhsaAYsZWMNOqjoQsmRGiWu9WvcvKwO7xW+3nsSzKAI?=
 =?us-ascii?Q?206+yXi7ovNEMilbQER8sLjNLP2a+qeLL34PXE3zB0jrpjXoz5qBG/7mzHYp?=
 =?us-ascii?Q?JlAmWR9p4wxU9dbIxitL/U1oil8gtC2xkXsoI07YZL2RmedcDyYF2TLZuNoX?=
 =?us-ascii?Q?6t1RJFaX3zUa7zxBFuP2nFgw+5/V1kLdzz9iat0DIn81ioMwTzEOzvalGIVr?=
 =?us-ascii?Q?0pFgNCd0nvEDAuSFiT3kVVIBwZLV4HkwdqzlzeYcxcw1RoPmU8697n58ERag?=
 =?us-ascii?Q?Sucqu5lxQOotCoaRkfMvUr6UKy46/ni50DDRbHcFL/cpVSDX66azU88buiWK?=
 =?us-ascii?Q?vj6Am4iFsdPzmu/3QtkI8I+xVufPA2QkmRVAvSLI8NvxAqg/pcmmApreWdSU?=
 =?us-ascii?Q?kL25zE76UxaOF/hAgJE4d3ns55Q6u4kT7qQLiSf+FGnJxzf3HzLDa7bHlXde?=
 =?us-ascii?Q?X1sG8ivuL4DZLsHnIEpFJ5nN8S9MUB6hH+sdMQJr2BeLJ76HEcmSBI5rYKrV?=
 =?us-ascii?Q?F3G71XhydBsq3CuuCHy3pnQmscOFXkk6vdRPBkV0JUCx1DcCBL3Q7BjXJ7R0?=
 =?us-ascii?Q?/btKSo8NwkLBNZe3aYoam8/qEK5Vopj59zrg4Rhj+Gnr/zKiNh7YWp3H400S?=
 =?us-ascii?Q?j8cQDymhQ7nvAqc2rLkbBLNUffsx3BqC7t+7fLY7/Wqtwm/STOUYZGETDG2B?=
 =?us-ascii?Q?uuKjj4HpNwd369J7BBNrsd0DyicArUEg58+nnvw/69wAcIKP1LiEjEAr9Qd6?=
 =?us-ascii?Q?JGvIkfMBCqsXO5mrfsPCLlkgkoI6puMr0Ih0yppdhywEmfwdhbTvblW9UVJt?=
 =?us-ascii?Q?jOuJf2NDzyGhuP7q45lmaUVNTEG7tYXHXxfBS2hbGUxvFMltk9Fo5XhB+JgJ?=
 =?us-ascii?Q?zlfBENXLtHXq4CBcHEmetu4IlCCKi9DrBHhy+xVe?=
X-OriginatorOrg: mt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 478b7482-7fdf-459c-ce93-08ddc2ac6f85
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB7755.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 08:00:01.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fb4c0aee-6cd2-482f-a1a5-717e7c02496b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7NEWLhEp0Yu3RKg17yyj6mY5mLnSK7eBE7pYwcWnPYAht44Lgz9y2hirk9tRMt1CyjVxCU9Ewci8i6m7XFc9Og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR03MB8837

The current implementation does not apply changes to the crop-
configuration of the sensor immediately if the sensor is in
streaming state. The user has to stop and restart the stream for
the changes to be applied.

This can be undesirable e.g. in a calibration usecase where the user
wants to see the impact of his changes in a live video stream.
Under the condition that the width & height of the cropped image area
does not change, the changed cropping configuration can be applied to
the pixel-array immediately without disturbing the IFP.

Call mt9m114_configure_pa() in mt9m114_pa_set_selection() if the sensor is
in streaming state and the size of the cropping rectangle didn't change,
issue a CONFIG_CHANGE to apply the changes immediately.

Signed-off-by: Mathis Foerst <mathis.foerst@mt.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/media/i2c/mt9m114.c | 43 ++++++++++++++++++++++++++-----------
 1 file changed, 30 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/mt9m114.c b/drivers/media/i2c/mt9m114.c
index 3f540ca40f3c..2020c33cac02 100644
--- a/drivers/media/i2c/mt9m114.c
+++ b/drivers/media/i2c/mt9m114.c
@@ -1287,6 +1287,7 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	struct mt9m114 *sensor = pa_to_mt9m114(sd);
 	struct v4l2_mbus_framefmt *format;
 	struct v4l2_rect *crop;
+	int ret = 0;
 
 	if (sel->target != V4L2_SEL_TGT_CROP)
 		return -EINVAL;
@@ -1302,25 +1303,41 @@ static int mt9m114_pa_set_selection(struct v4l2_subdev *sd,
 	 * binning, but binning is configured after setting the selection, so
 	 * we can't know tell here if it will be used.
 	 */
-	crop->left = ALIGN(sel->r.left, 4);
-	crop->top = ALIGN(sel->r.top, 2);
-	crop->width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
-			      MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
-			      MT9M114_PIXEL_ARRAY_WIDTH - crop->left);
-	crop->height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
-			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
-			       MT9M114_PIXEL_ARRAY_HEIGHT - crop->top);
-
-	sel->r = *crop;
+	sel->r.left = ALIGN(sel->r.left, 4);
+	sel->r.top = ALIGN(sel->r.top, 2);
+	sel->r.width = clamp_t(unsigned int, ALIGN(sel->r.width, 4),
+			       MT9M114_PIXEL_ARRAY_MIN_OUTPUT_WIDTH,
+			       MT9M114_PIXEL_ARRAY_WIDTH - sel->r.left);
+	sel->r.height = clamp_t(unsigned int, ALIGN(sel->r.height, 2),
+				MT9M114_PIXEL_ARRAY_MIN_OUTPUT_HEIGHT,
+				MT9M114_PIXEL_ARRAY_HEIGHT - sel->r.top);
+
+	/* Changing the selection size is not allowed in streaming state. */
+	if (sensor->streaming &&
+	    (sel->r.height != crop->height || sel->r.width != crop->width))
+		return -EBUSY;
+
+	*crop = sel->r;
 
 	/* Reset the format. */
 	format->width = crop->width;
 	format->height = crop->height;
 
-	if (sel->which == V4L2_SUBDEV_FORMAT_ACTIVE)
-		mt9m114_pa_ctrl_update_blanking(sensor, format);
+	if (sel->which != V4L2_SUBDEV_FORMAT_ACTIVE)
+		return ret;
 
-	return 0;
+	mt9m114_pa_ctrl_update_blanking(sensor, format);
+
+	/* Apply values immediately if streaming. */
+	if (sensor->streaming) {
+		ret = mt9m114_configure_pa(sensor, state);
+		if (ret)
+			return ret;
+		/* Changing the cropping config requires a CONFIG_CHANGE. */
+		ret = mt9m114_set_state(sensor,
+					MT9M114_SYS_STATE_ENTER_CONFIG_CHANGE);
+	}
+	return ret;
 }
 
 static const struct v4l2_subdev_pad_ops mt9m114_pa_pad_ops = {
-- 
2.34.1


