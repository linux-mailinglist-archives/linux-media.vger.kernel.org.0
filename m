Return-Path: <linux-media+bounces-50186-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176AD0110A
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:23:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9828B3041557
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E2F52D73BC;
	Thu,  8 Jan 2026 05:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b="fhA8hT7U"
X-Original-To: linux-media@vger.kernel.org
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506192D5957;
	Thu,  8 Jan 2026 05:23:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.178.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767849794; cv=fail; b=fBsVWdJVpS6ZFt6Nc+VuW+jqifUqPLfnFspJToXnLYUjEvHS5mSdFG9m30xZUPYKzP5E2ETaq8nh4VWcFgY7hsDBWuCOY4eW46uwhu16F7p4olbPNKpweZdaoOU8yDhRb4dfoINF32tJVdLoDGS04Dsev3dFlInUqglY57CAnJ0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767849794; c=relaxed/simple;
	bh=OVNpS5Bl5kRB0U6Q/VwTzZxT1YcnMzhHECgjvrLSFJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=VUM/ujJVjEkwetMJHSw2u79XBcpWtEpDDHHO+PZH1wnGDSceeYCel4/UlBuT229/HSbL0uWwSPBjUz5t8707ITvZVJzZcNGLUi8/gxHuH167Xc04SU3cXW2kE8uYMbAzllIhDYOZgZYHSKWBz0imO1SHtwfQ3KoXzFsc52QTN0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com; spf=pass smtp.mailfrom=windriver.com; dkim=pass (2048-bit key) header.d=windriver.com header.i=@windriver.com header.b=fhA8hT7U; arc=fail smtp.client-ip=205.220.178.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=windriver.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=windriver.com
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60850xgC2264063;
	Thu, 8 Jan 2026 05:22:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=windriver.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	PPS06212021; bh=cHlT36ik3FqWjLWES1sVGTXIjMu/oy9RL/4gv/qT2dI=; b=
	fhA8hT7U2Jxddh933Us8iNJJ1Ix3bFNyye62jTYKVHNMa9RGR8WguhWFr5nT8tIY
	X2r9o/sx0hh2Z2phWle13vxFMInZOfg242UlFNXElwHEbZ27F3LgNdXQLndT8DMU
	gBaiiUZrzq3/ng4Jq8oUS/pQxWBzz5pSOSjYIMisU61KfigTqW0YF0irKsmIgufY
	eS+bjtpnG5kgP9PYuHhpQwXCu58vWYXfMzDoV1CFSWte80dC9CitJZdrr9kh+7Qg
	8aM9e6SiodOypR6asBruBVS5/qli9mLgWTA3YS/SOGOtryvraYcEX4YUtNoiHS/g
	3LHM3QvYGUHXQ0s2B8xCnA==
Received: from ph7pr06cu001.outbound.protection.outlook.com (mail-westus3azon11010027.outbound.protection.outlook.com [52.101.201.27])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 4beravd0wn-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 08 Jan 2026 05:22:29 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I0thXRK+1gnCbG9/T2MNu6I1MOyBBAp+HU1AXnPwNDkvRUdN1mUMmvL9UiWmlef1Y9YY6+lZnKr4kdcN18ynw12vzRUKHaIpnnvYqmmc/yHQIiY4ujVoHhuGEM8eicsR1ELXgesyCwonMin9usp67/p7joeIXV7hUuECoEXhXNhU1AL8R6LJoiNwFlOASjecXdsUhD14lgsEvfiCcGzkeQwqZcQ0jSk8qSjEJqB1+ZWJF+Q6YZQldUyLk+biF0VDwL1g/TCXMQAWBGgwEWVlLudH4OqwlwWQ/yoZLpJSvGeZOFt3gq8+l0onEjTgWaZRRAK5mGWGrEj3oybPHs6qPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cHlT36ik3FqWjLWES1sVGTXIjMu/oy9RL/4gv/qT2dI=;
 b=SygQ9apvpUkroEDKhoFBAqUSohwPqA/K9khKFliCWGwaf0AxXMlwQvbGI/22ZjOkNM42N/KtR26JyYwGFxTQWEYCMHys0ZttPt2p7WqQk4Rbos7Ynq475kF+Ll4s85c2ux2wAkvlRBZ8Q59SmEsBNfr6YRnymtSF/Tb+0Mg2gSHpk7XMBuQSxrmXxd4W82o3b+nJM49YbEVZvl72pvE5Ru+xR7hSKsMqxqtMcqsInltHL1Rwt6ZQHDx6hMBCd51K70Klde+elzNomhGkzCKGj/GVQ9PoPkEzMEad764EMghb7mCvauo0jCC9pV8qazeHIMm7EdbS1p28KxlbDWH5hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53) by LV8PR11MB8510.namprd11.prod.outlook.com
 (2603:10b6:408:1e8::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:22:27 +0000
Received: from DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e]) by DS4PPFD667CEBB6.namprd11.prod.outlook.com
 ([fe80::92d2:113:b2d3:1d3e%6]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:22:27 +0000
From: Xiaolei Wang <xiaolei.wang@windriver.com>
To: sakari.ailus@linux.intel.com, tarang.raval@siliconsignals.io,
        laurent.pinchart@ideasonboard.com, dave.stevenson@raspberrypi.com,
        jacopo@jmondi.org, mchehab@kernel.org,
        prabhakar.mahadev-lad.rj@bp.renesas.com, hverkuil+cisco@kernel.org,
        johannes.goede@oss.qualcomm.com, hverkuil-cisco@xs4all.nl,
        jai.luthra@ideasonboard.com, Xiaolei.Wang@windriver.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] media: i2c: ov5647: Convert to CCI register access helpers
Date: Thu,  8 Jan 2026 13:21:57 +0800
Message-ID: <20260108052159.3879884-2-xiaolei.wang@windriver.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
References: <20260108052159.3879884-1-xiaolei.wang@windriver.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR02CA0027.apcprd02.prod.outlook.com
 (2603:1096:4:195::14) To DS4PPFD667CEBB6.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::53)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFD667CEBB6:EE_|LV8PR11MB8510:EE_
X-MS-Office365-Filtering-Correlation-Id: 16e7b1f0-9cd6-4534-9dd1-08de4e75e9dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|52116014|1800799024|366016|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?TTjJfSWIXKXns1X3L6gliQ7yHrmXCTkotox6NNlBwzIIPDmFHZUndBW/IHs4?=
 =?us-ascii?Q?DdGaRJQHbJRAPHwNj0H7MSHPNZcH742nv3CeI0uadLE8vTSiKU/+96zeWcDm?=
 =?us-ascii?Q?zG4CawXHf2cKJ9p6uDZ6Qu1zvlg1B2ytC4SBTV6GioPvR+/DRV6K8gZCAG/X?=
 =?us-ascii?Q?k7ciSTeV42RoMGf/n8fSG10wZFmG13t6togP69sK/AX3oU9AEfUTlMtOkeFK?=
 =?us-ascii?Q?yajDlKdud77cyjRXYgylyY+8/HNjp6J2GDgTzphlM5ACCmFWEbFJ+korjqIH?=
 =?us-ascii?Q?Aq005sel0LhI2quRmp/ZOAQhjAoeazj6qzZic2kJePxE/Hn8oERY+UrNo1WP?=
 =?us-ascii?Q?g7Eg//Q11E161GG8jH8kqVKgMFuNLBdsGBvR8PNRXnvuK74YNmt2As1YgAtj?=
 =?us-ascii?Q?int+Aly4rsZeTEtpg5+aXyo5sUeIPhrJd++2Sdz6+3Xt6RWMYVx+s9T8oC3b?=
 =?us-ascii?Q?4IMbKe/cHBQN7rYcilTS+m++S5p/FAGteQFcl/0AbK7bClF3TXefYNM7QwOp?=
 =?us-ascii?Q?DJ6rc4TPpTX6jBqc/kQ33Z07XBd1shumhKDKkPD7ip1NkNXNpQU7qhTgqmAU?=
 =?us-ascii?Q?G0kcb37EHtdUMV8yh3K9ty2CcLNYk3YjuQqZnYQNQNP1aFk9pS1ySrn7P4Vk?=
 =?us-ascii?Q?shZpqYI70NsrF2mXsx3uMuq7UWP0isHbF9m8f3OZ+F9aGQVQ0go5Gqv00GUg?=
 =?us-ascii?Q?a/iI4JTxwuXhPn9cUnB+WvKor+ua8AAk5xbphZKjNLmvm9um82IL+Ojx748m?=
 =?us-ascii?Q?0Xhb3uD8tuM0b7vyoL1QstrZJ02wQuCh8AhNahixWxECYZIJJz833vKuZ3PV?=
 =?us-ascii?Q?tle3KyCeZ98klERGR2vq5PQpxYlpSREiw/yMtr5I/os0/PUTHwWRLmAtoXN9?=
 =?us-ascii?Q?ymn+PgRq0kUZG5NZ4eXErAcZbdk2tpV2sRR/nKR//jc5kpMdMfjk0kUb1x5J?=
 =?us-ascii?Q?Y2h5anXCBQAi9SvF7v+YkiwxwNqYC/L+Fe6qnxIjRVLi4KYDZ+k6yUlpqGVT?=
 =?us-ascii?Q?znh4731b4Pjb0dnACYFJNNc5Rkgk84oR69SWLmQTdN/Vs9yD5hjJW90LiODq?=
 =?us-ascii?Q?1Mndg1leIz8IlLXVzZBM3X7XxKbkbGWQQ0j6YI7Q85QXtEu7Qpz3d0A5z6kv?=
 =?us-ascii?Q?k5zuW39EofkwaITCwT3IAs5ip1NcvpH40B9UKxGaQjRGx8QyoRSuJMWgrzyo?=
 =?us-ascii?Q?GvHusIIjthcqhMCIbKIbExN+zlZQdG2d0tbGi+5GDg8W9TVdX+O31uHgiZbM?=
 =?us-ascii?Q?9sjuBlyEsSJREq6JpE0bRM7IX4O/aB/pkZhMqoW+8rWmuOm/geRV3oHFJRWH?=
 =?us-ascii?Q?DHaTOfQvLwV+AAb1DGF89Nh5eRNJF/CE0J/IaCbNHU4+ifNfBi2mlIbkF6ka?=
 =?us-ascii?Q?BD1GW+4pHBi7E11dFsNJWaoY6HagfhVfk8XgIGJFXFwZySGnImTLC6+aSIrX?=
 =?us-ascii?Q?TQ+01g+hJfu0xL3XaJmUiGYsPbJqzY4/DKnnZvv64lhaZmI+Xovmer+vQ0kN?=
 =?us-ascii?Q?hdCWwdl5MNedO+bBTYiiAYLeA87bKWUftaKo1so6drhF7BulR7MxApTMYQ?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPFD667CEBB6.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(52116014)(1800799024)(366016)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?xjlLACyMv+OKZJW1aLcQbgKYBLReMwTZFvOVmZWrWD0l2NNC4WhFRCmnZVTw?=
 =?us-ascii?Q?rjBYV9WGR574DmUst8ZfUbJ7cQyjZDvun0GHbhEJHGvnFUHSWPOMXm7bK3+P?=
 =?us-ascii?Q?YxexlfWKif9nLBd4EP8W9BZkD8uwXJEZ+fsFIzv2kTkEegs1wXvs9tSlBLns?=
 =?us-ascii?Q?XSDd+SjC/1Qfp/MComlF8dCW552V1dlNqbs9Ut/4NfigZP1QvNj53uFtLXXa?=
 =?us-ascii?Q?ArKS6LyPd37EnC7ZXbzahQIqiGpLUEB2bRTuTsE0JgLxb7HTLcT3v+8/awhZ?=
 =?us-ascii?Q?q+iuLsJu6EmiNmaSEtSCk3/GCPxBLnUq7YD8kF6/zKOd1YQ5tKkcXTtjjf4W?=
 =?us-ascii?Q?0NSwlViCQqEKpn2wCU4Rf459rZBNiLyRrIdIuh3E1/Or+ytd7KuUxevoacyH?=
 =?us-ascii?Q?zvlS2q9hnpjKrBA4B7GQrwiXkbsq1GiW1DL8AIN4YPyVp96BhgeooZhn45IV?=
 =?us-ascii?Q?+JMz7yammGcytysaIHUuw5m43Me5YGmLRgPWHBnyNI67UYbPSFy7iozCXvx8?=
 =?us-ascii?Q?+wZQyNeTZ7ruwm/9xJGDXBLGU0jGMBP9qOnFiIlxqBXFlce2OhQiph9BTxqv?=
 =?us-ascii?Q?LwM86Nr4ZowE7ukbxrxAp04yKLnqo5tcK+k7DfM5cKMHIgeZVo3v1f7agelH?=
 =?us-ascii?Q?CAxfU34PAdq7l/CJk5jH7YTY4SHBMCkf9WMeXeLr3Fo2b6wDQ/2YanY7Wv0m?=
 =?us-ascii?Q?2zwIA6oA1JWf8Wh/oKkynk6Vq/d7EYQqXsk/Wy6pOqgyP3PSav2BHvADzOTS?=
 =?us-ascii?Q?g6KAy+R1Vkxj4RSNhYY4w5tmRtL3PBP64uc8WoKYMVlYzl9+Y6Vi9HT+l35E?=
 =?us-ascii?Q?QlNaIkib3gDdtl0QC1qtyuC8xi50c8WtzSSZwYwEQCySypEQUv1b1t+iDLUM?=
 =?us-ascii?Q?7zbv1lrnhsftQXD/G1RY+j9+Y/b2fOanFbPabvjWb7lJGITHFP7TL3WRM8eW?=
 =?us-ascii?Q?tQ6uC3IdNAXG/lKaVJJpbp2WwgbIVUMk3cfOV3nRbvGevVUsSARp9q9U4p+y?=
 =?us-ascii?Q?P1XtH8C3oYQ0LEwwzxmKNvBr+Je9oziYlSFAIv7bpfRB7tPZcTC89SHDUjvB?=
 =?us-ascii?Q?sdcS/HQ6isiV8Z+1eGcAEKRZlzS/Y2jw6P0AW+dydDorKZFOpONJQK0LX11B?=
 =?us-ascii?Q?KxTsPasf3poZvmg9MBogSoONqdKl1fddcgbp+3XY+slnVSekX0JPT+DVNszP?=
 =?us-ascii?Q?sA3WQ4nsXDAx2NGJmodavs5UBo2hQ+rDpwOq6+UnU/DVB84jtvvCkXfX1z6o?=
 =?us-ascii?Q?PAT/1yDiAGp8exEym3tjKjO1/CC5P7fAuuQYBMC3tB+pilzAa3oEEiuDiPji?=
 =?us-ascii?Q?gGcj14IaedzMKEspsdi12ZJe3Tji7IFm2+Ygfi9ZEHqjtd0E7mNXX4o3CfMh?=
 =?us-ascii?Q?Tl+Zu89LTpQykrSZjY7N5wR25NLOxhEIuorSL0dnlkpusprKCQzsfwj9Vq0J?=
 =?us-ascii?Q?zFf8kaY5PKS3Ka3SEGfmtUBeAvDd/vWzAeQP8qdUFi0dX2pazMqoNb2zC/aI?=
 =?us-ascii?Q?xR1uDFICBszkbuKnlMsH32I12wLPpx7sOwK3E11B9kA0BZOl1iOwWgesxLZb?=
 =?us-ascii?Q?myN1b4WF0ndQWYUjppNb84GbSLNZESl3MVEbApkfKWI4RXC5CbfPYlQkjaZ8?=
 =?us-ascii?Q?lZ3eJT4feP8BRqPiHghDypVJH9AnWNKFzICDahbtsxskYBxIDL8nQcR5kiyH?=
 =?us-ascii?Q?91gKxnBsefoxlP7hsZlot1I1pV6w8zDkdtNXr4zvs5UAfEqk9McVQWw5tR8Y?=
 =?us-ascii?Q?nh892WSGLOY6sRyDx2zFwpFZgZSxKY8=3D?=
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e7b1f0-9cd6-4534-9dd1-08de4e75e9dd
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFD667CEBB6.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:22:27.8781
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3xYaowPMxq+BUGejywR8aoxvHNTyG4yo708iqJesqwdu3FRv9gVg7M45zbGyXOl15zWERGAghvNSF8EQLU5HJ28R5lx+2S4o0L0rcFdkV7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8510
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDAzMiBTYWx0ZWRfXxAHOqwxAIGZC
 +0vRbuLHCDwuG93zTLDnPoA6M7k1uKkQqZ+vX5chiPdqHprVPwqj69ArFWlFtWjRdBoGUmIsFyo
 9oiAwQvaTNYaQQDcHMpP7CCvdZ2/kV7un8ltIen0dIS3yBWnA1oEmFlpN/PRlYWyOWhRnUGlrgx
 yVXx5RkdFD6hMe7fy3x0nm2ujVGvhzxFOx5n98IlhkEk+rLaJfH4vlB7XiM7KzgZOJZ8rMKNDAp
 gw09xNsf/OirJA3yFM9qtAtwxOsUxB9oy9sAahMquXxlr5elexqqmcSb68MU+IlB5+Ckl6l4xtG
 f4YT4thD+clVncS1EflWKKUeIOin2gJikoeoVUhcBrrFbXajVmw2OFVXEpaUlyHiPavaE81nk/H
 Lj8IhV/qUNTBD18gmpU56BEyJ2IHtw2OsCqjj2RTEQ1GV/yS5p3JNMgB4QkPUQ9f+CKX4LpMyRO
 mGNosMjar3NXRHU5uKA==
X-Proofpoint-GUID: 3sJEKa0P63w8ZmSZH5ZAO_jVxiqUZKeT
X-Proofpoint-ORIG-GUID: 3sJEKa0P63w8ZmSZH5ZAO_jVxiqUZKeT
X-Authority-Analysis: v=2.4 cv=PZjyRyhd c=1 sm=1 tr=0 ts=695f3f15 cx=c_pps
 a=jolozQ03zpjfpn/maDJ7eQ==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=t7CeM3EgAAAA:8 a=EUspDBNiAAAA:8 a=T16h4l0tTw8x5XXCdj4A:9
 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-07_05,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 spamscore=0 malwarescore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080032

Use the new common CCI register access helpers to replace the private
register access helpers in the ov5647 driver. This simplifies the driver
by reducing the amount of code.

Signed-off-by: Xiaolei Wang <xiaolei.wang@windriver.com>
Reviewed-by: Tarang Raval <tarang.raval@siliconsignals.io>
Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/i2c/Kconfig  |   1 +
 drivers/media/i2c/ov5647.c | 398 +++++++++++--------------------------
 2 files changed, 115 insertions(+), 284 deletions(-)

diff --git a/drivers/media/i2c/Kconfig b/drivers/media/i2c/Kconfig
index befea5952..9182ada71 100644
--- a/drivers/media/i2c/Kconfig
+++ b/drivers/media/i2c/Kconfig
@@ -530,6 +530,7 @@ config VIDEO_OV5645
 
 config VIDEO_OV5647
 	tristate "OmniVision OV5647 sensor support"
+	select V4L2_CCI_I2C
 	help
 	  This is a Video4Linux2 sensor driver for the OmniVision
 	  OV5647 camera.
diff --git a/drivers/media/i2c/ov5647.c b/drivers/media/i2c/ov5647.c
index 104173210..47c0d4485 100644
--- a/drivers/media/i2c/ov5647.c
+++ b/drivers/media/i2c/ov5647.c
@@ -20,9 +20,11 @@
 #include <linux/module.h>
 #include <linux/of_graph.h>
 #include <linux/pm_runtime.h>
+#include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <linux/videodev2.h>
+#include <media/v4l2-cci.h>
 #include <media/v4l2-ctrls.h>
 #include <media/v4l2-device.h>
 #include <media/v4l2-event.h>
@@ -42,29 +44,26 @@
 #define MIPI_CTRL00_BUS_IDLE			BIT(2)
 #define MIPI_CTRL00_CLOCK_LANE_DISABLE		BIT(0)
 
-#define OV5647_SW_STANDBY		0x0100
-#define OV5647_SW_RESET			0x0103
-#define OV5647_REG_CHIPID_H		0x300a
-#define OV5647_REG_CHIPID_L		0x300b
-#define OV5640_REG_PAD_OUT		0x300d
-#define OV5647_REG_EXP_HI		0x3500
-#define OV5647_REG_EXP_MID		0x3501
-#define OV5647_REG_EXP_LO		0x3502
-#define OV5647_REG_AEC_AGC		0x3503
-#define OV5647_REG_GAIN_HI		0x350a
-#define OV5647_REG_GAIN_LO		0x350b
-#define OV5647_REG_HTS_HI		0x380c
-#define OV5647_REG_HTS_LO		0x380d
-#define OV5647_REG_VTS_HI		0x380e
-#define OV5647_REG_VTS_LO		0x380f
-#define OV5647_REG_TIMING_TC_V		0x3820
-#define OV5647_REG_TIMING_TC_H		0x3821
-#define OV5647_REG_FRAME_OFF_NUMBER	0x4202
-#define OV5647_REG_MIPI_CTRL00		0x4800
-#define OV5647_REG_MIPI_CTRL14		0x4814
-#define OV5647_REG_AWB			0x5001
-#define OV5647_REG_ISPCTRL3D		0x503d
-
+#define OV5647_SW_STANDBY		CCI_REG8(0x0100)
+#define OV5647_SW_RESET			CCI_REG8(0x0103)
+#define OV5647_REG_CHIPID		CCI_REG16(0x300a)
+#define OV5640_REG_PAD_OUT		CCI_REG8(0x300d)
+#define OV5647_REG_EXPOSURE		CCI_REG24(0x3500)
+#define OV5647_REG_AEC_AGC		CCI_REG8(0x3503)
+#define OV5647_REG_GAIN			CCI_REG16(0x350a)
+#define OV5647_REG_HTS			CCI_REG16(0x380c)
+#define OV5647_REG_VTS			CCI_REG16(0x380e)
+#define OV5647_REG_TIMING_TC_V		CCI_REG8(0x3820)
+#define OV5647_REG_TIMING_TC_H		CCI_REG8(0x3821)
+#define OV5647_REG_FRAME_OFF_NUMBER	CCI_REG8(0x4202)
+#define OV5647_REG_MIPI_CTRL00		CCI_REG8(0x4800)
+#define OV5647_REG_MIPI_CTRL14		CCI_REG8(0x4814)
+#define OV5647_REG_MIPI_CTRL14_CHANNEL_MASK	GENMASK(7, 6)
+#define OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT	6
+#define OV5647_REG_AWB			CCI_REG8(0x5001)
+#define OV5647_REG_ISPCTRL3D		CCI_REG8(0x503d)
+
+#define OV5647_CHIP_ID 0x5647
 #define REG_TERM 0xfffe
 #define VAL_TERM 0xfe
 #define REG_DLY  0xffff
@@ -104,11 +103,6 @@ static const s64 ov5647_link_freqs[] = {
 	[FREQ_INDEX_VGA]	= 145833300,
 };
 
-struct regval_list {
-	u16 addr;
-	u8 data;
-};
-
 struct ov5647_mode {
 	struct v4l2_mbus_framefmt	format;
 	struct v4l2_rect		crop;
@@ -116,12 +110,13 @@ struct ov5647_mode {
 	unsigned int			link_freq_index;
 	int				hts;
 	int				vts;
-	const struct regval_list	*reg_list;
+	const struct reg_sequence	*reg_list;
 	unsigned int			num_regs;
 };
 
 struct ov5647 {
 	struct v4l2_subdev		sd;
+	struct regmap			*regmap;
 	struct media_pad		pad;
 	struct mutex			lock;
 	struct clk			*xclk;
@@ -158,19 +153,19 @@ static const u8 ov5647_test_pattern_val[] = {
 	0x81,	/* Random Data */
 };
 
-static const struct regval_list sensor_oe_disable_regs[] = {
+static const struct reg_sequence sensor_oe_disable_regs[] = {
 	{0x3000, 0x00},
 	{0x3001, 0x00},
 	{0x3002, 0x00},
 };
 
-static const struct regval_list sensor_oe_enable_regs[] = {
+static const struct reg_sequence sensor_oe_enable_regs[] = {
 	{0x3000, 0x0f},
 	{0x3001, 0xff},
 	{0x3002, 0xe4},
 };
 
-static struct regval_list ov5647_common_regs[] = {
+static const struct reg_sequence ov5647_common_regs[] = {
 	{0x0100, 0x00},
 	{0x0103, 0x01},
 	{0x3034, 0x1a},
@@ -224,7 +219,7 @@ static struct regval_list ov5647_common_regs[] = {
 	{0x3503, 0x03},
 };
 
-static struct regval_list ov5647_2592x1944_10bpp[] = {
+static const struct reg_sequence ov5647_2592x1944_10bpp[] = {
 	{0x3036, 0x69},
 	{0x3821, 0x02},
 	{0x3820, 0x00},
@@ -260,7 +255,7 @@ static struct regval_list ov5647_2592x1944_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_1080p30_10bpp[] = {
+static const struct reg_sequence ov5647_1080p30_10bpp[] = {
 	{0x3036, 0x69},
 	{0x3821, 0x02},
 	{0x3820, 0x00},
@@ -296,7 +291,7 @@ static struct regval_list ov5647_1080p30_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_2x2binned_10bpp[] = {
+static const struct reg_sequence ov5647_2x2binned_10bpp[] = {
 	{0x3036, 0x69},
 	{0x3821, 0x03},
 	{0x3820, 0x41},
@@ -336,7 +331,7 @@ static struct regval_list ov5647_2x2binned_10bpp[] = {
 	{0x0100, 0x01},
 };
 
-static struct regval_list ov5647_640x480_10bpp[] = {
+static const struct reg_sequence ov5647_640x480_10bpp[] = {
 	{0x3036, 0x46},
 	{0x3821, 0x03},
 	{0x3820, 0x41},
@@ -463,116 +458,36 @@ static const struct ov5647_mode ov5647_modes[] = {
 #define OV5647_DEFAULT_MODE	(&ov5647_modes[3])
 #define OV5647_DEFAULT_FORMAT	(ov5647_modes[3].format)
 
-static int ov5647_write16(struct v4l2_subdev *sd, u16 reg, u16 val)
-{
-	unsigned char data[4] = { reg >> 8, reg & 0xff, val >> 8, val & 0xff};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 4);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-			__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_write(struct v4l2_subdev *sd, u16 reg, u8 val)
-{
-	unsigned char data[3] = { reg >> 8, reg & 0xff, val};
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	int ret;
-
-	ret = i2c_master_send(client, data, 3);
-	if (ret < 0) {
-		dev_dbg(&client->dev, "%s: i2c write error, reg: %x\n",
-				__func__, reg);
-		return ret;
-	}
-
-	return 0;
-}
-
-static int ov5647_read(struct v4l2_subdev *sd, u16 reg, u8 *val)
-{
-	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 buf[2] = { reg >> 8, reg & 0xff };
-	struct i2c_msg msg[2];
-	int ret;
-
-	msg[0].addr = client->addr;
-	msg[0].flags = client->flags;
-	msg[0].buf = buf;
-	msg[0].len = sizeof(buf);
-
-	msg[1].addr = client->addr;
-	msg[1].flags = client->flags | I2C_M_RD;
-	msg[1].buf = buf;
-	msg[1].len = 1;
-
-	ret = i2c_transfer(client->adapter, msg, 2);
-	if (ret != 2) {
-		dev_err(&client->dev, "%s: i2c read error, reg: %x = %d\n",
-			__func__, reg, ret);
-		return ret >= 0 ? -EINVAL : ret;
-	}
-
-	*val = buf[0];
-
-	return 0;
-}
-
-static int ov5647_write_array(struct v4l2_subdev *sd,
-			      const struct regval_list *regs, int array_size)
-{
-	int i, ret;
-
-	for (i = 0; i < array_size; i++) {
-		ret = ov5647_write(sd, regs[i].addr, regs[i].data);
-		if (ret < 0)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int ov5647_set_virtual_channel(struct v4l2_subdev *sd, int channel)
 {
-	u8 channel_id;
-	int ret;
-
-	ret = ov5647_read(sd, OV5647_REG_MIPI_CTRL14, &channel_id);
-	if (ret < 0)
-		return ret;
-
-	channel_id &= ~(3 << 6);
+	struct ov5647 *sensor = to_sensor(sd);
 
-	return ov5647_write(sd, OV5647_REG_MIPI_CTRL14,
-			    channel_id | (channel << 6));
+	return cci_update_bits(sensor->regmap, OV5647_REG_MIPI_CTRL14,
+			       OV5647_REG_MIPI_CTRL14_CHANNEL_MASK,
+			       channel << OV5647_REG_MIPI_CTRL14_CHANNEL_SHIFT,
+			       NULL);
 }
 
 static int ov5647_set_mode(struct v4l2_subdev *sd)
 {
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
 	struct ov5647 *sensor = to_sensor(sd);
-	u8 resetval, rdval;
+	u64 resetval, rdval;
 	int ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &rdval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &rdval, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_write_array(sd, ov5647_common_regs,
-				 ARRAY_SIZE(ov5647_common_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, ov5647_common_regs,
+				     ARRAY_SIZE(ov5647_common_regs));
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor common regs error\n");
 		return ret;
 	}
 
-	ret = ov5647_write_array(sd, sensor->mode->reg_list,
-				 sensor->mode->num_regs);
+	ret = regmap_multi_reg_write(sensor->regmap, sensor->mode->reg_list,
+				     sensor->mode->num_regs);
 	if (ret < 0) {
 		dev_err(&client->dev, "write sensor default regs error\n");
 		return ret;
@@ -582,13 +497,13 @@ static int ov5647_set_mode(struct v4l2_subdev *sd)
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_SW_STANDBY, &resetval);
+	ret = cci_read(sensor->regmap, OV5647_SW_STANDBY, &resetval, NULL);
 	if (ret < 0)
 		return ret;
 
 	if (!(resetval & 0x01)) {
 		dev_err(&client->dev, "Device was in SW standby");
-		ret = ov5647_write(sd, OV5647_SW_STANDBY, 0x01);
+		ret = cci_write(sensor->regmap, OV5647_SW_STANDBY, 0x01, NULL);
 		if (ret < 0)
 			return ret;
 	}
@@ -618,32 +533,25 @@ static int ov5647_stream_on(struct v4l2_subdev *sd)
 		val |= MIPI_CTRL00_CLOCK_LANE_GATE |
 		       MIPI_CTRL00_LINE_SYNC_ENABLE;
 
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00, val);
-	if (ret < 0)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x00);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00, val, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x00, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x00, &ret);
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x00);
+	return ret;
 }
 
 static int ov5647_stream_off(struct v4l2_subdev *sd)
 {
-	int ret;
-
-	ret = ov5647_write(sd, OV5647_REG_MIPI_CTRL00,
-			   MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
-			   MIPI_CTRL00_CLOCK_LANE_DISABLE);
-	if (ret < 0)
-		return ret;
+	struct ov5647 *sensor = to_sensor(sd);
+	int ret = 0;
 
-	ret = ov5647_write(sd, OV5647_REG_FRAME_OFF_NUMBER, 0x0f);
-	if (ret < 0)
-		return ret;
+	cci_write(sensor->regmap, OV5647_REG_MIPI_CTRL00,
+		  MIPI_CTRL00_CLOCK_LANE_GATE | MIPI_CTRL00_BUS_IDLE |
+		  MIPI_CTRL00_CLOCK_LANE_DISABLE, &ret);
+	cci_write(sensor->regmap, OV5647_REG_FRAME_OFF_NUMBER, 0x0f, &ret);
+	cci_write(sensor->regmap, OV5640_REG_PAD_OUT, 0x01, &ret);
 
-	return ov5647_write(sd, OV5640_REG_PAD_OUT, 0x01);
+	return ret;
 }
 
 static int ov5647_power_on(struct device *dev)
@@ -673,8 +581,8 @@ static int ov5647_power_on(struct device *dev)
 		goto error_pwdn;
 	}
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_enable_regs,
-				 ARRAY_SIZE(sensor_oe_enable_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_enable_regs,
+				     ARRAY_SIZE(sensor_oe_enable_regs));
 	if (ret < 0) {
 		dev_err(dev, "write sensor_oe_enable_regs error\n");
 		goto error_clk_disable;
@@ -702,23 +610,17 @@ static int ov5647_power_on(struct device *dev)
 static int ov5647_power_off(struct device *dev)
 {
 	struct ov5647 *sensor = dev_get_drvdata(dev);
-	u8 rdval;
 	int ret;
 
 	dev_dbg(dev, "OV5647 power off\n");
 
-	ret = ov5647_write_array(&sensor->sd, sensor_oe_disable_regs,
-				 ARRAY_SIZE(sensor_oe_disable_regs));
+	ret = regmap_multi_reg_write(sensor->regmap, sensor_oe_disable_regs,
+				     ARRAY_SIZE(sensor_oe_disable_regs));
 	if (ret < 0)
 		dev_dbg(dev, "disable oe failed\n");
 
 	/* Enter software standby */
-	ret = ov5647_read(&sensor->sd, OV5647_SW_STANDBY, &rdval);
-	if (ret < 0)
-		dev_dbg(dev, "software standby failed\n");
-
-	rdval &= ~0x01;
-	ret = ov5647_write(&sensor->sd, OV5647_SW_STANDBY, rdval);
+	ret = cci_update_bits(sensor->regmap, OV5647_SW_STANDBY, 0x01, 0x00, NULL);
 	if (ret < 0)
 		dev_dbg(dev, "software standby failed\n");
 
@@ -733,10 +635,11 @@ static int ov5647_power_off(struct device *dev)
 static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 				      struct v4l2_dbg_register *reg)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	int ret;
-	u8 val;
+	u64 val;
 
-	ret = ov5647_read(sd, reg->reg & 0xff, &val);
+	ret = cci_read(sensor->regmap, reg->reg & 0xff, &val, NULL);
 	if (ret < 0)
 		return ret;
 
@@ -749,7 +652,9 @@ static int ov5647_sensor_get_register(struct v4l2_subdev *sd,
 static int ov5647_sensor_set_register(struct v4l2_subdev *sd,
 				      const struct v4l2_dbg_register *reg)
 {
-	return ov5647_write(sd, reg->reg & 0xff, reg->val & 0xff);
+	struct ov5647 *sensor = to_sensor(sd);
+
+	return cci_write(sensor->regmap, reg->reg & 0xff, reg->val & 0xff, NULL);
 }
 #endif
 
@@ -1004,33 +909,27 @@ static const struct v4l2_subdev_ops ov5647_subdev_ops = {
 
 static int ov5647_detect(struct v4l2_subdev *sd)
 {
+	struct ov5647 *sensor = to_sensor(sd);
 	struct i2c_client *client = v4l2_get_subdevdata(sd);
-	u8 read;
+	u64 read;
 	int ret;
 
-	ret = ov5647_write(sd, OV5647_SW_RESET, 0x01);
+	ret = cci_write(sensor->regmap, OV5647_SW_RESET, 0x01, NULL);
 	if (ret < 0)
 		return ret;
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_H, &read);
+	ret = cci_read(sensor->regmap, OV5647_REG_CHIPID, &read, NULL);
 	if (ret < 0)
-		return ret;
+		return dev_err_probe(&client->dev, ret,
+				     "failed to read chip id %x\n",
+				     OV5647_REG_CHIPID);
 
-	if (read != 0x56) {
-		dev_err(&client->dev, "ID High expected 0x56 got %x", read);
+	if (read != OV5647_CHIP_ID) {
+		dev_err(&client->dev, "Chip ID expected 0x5647 got 0x%llx", read);
 		return -ENODEV;
 	}
 
-	ret = ov5647_read(sd, OV5647_REG_CHIPID_L, &read);
-	if (ret < 0)
-		return ret;
-
-	if (read != 0x47) {
-		dev_err(&client->dev, "ID Low expected 0x47 got %x", read);
-		return -ENODEV;
-	}
-
-	return ov5647_write(sd, OV5647_SW_RESET, 0x00);
+	return cci_write(sensor->regmap, OV5647_SW_RESET, 0x00, NULL);
 }
 
 static int ov5647_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
@@ -1053,99 +952,6 @@ static const struct v4l2_subdev_internal_ops ov5647_subdev_internal_ops = {
 	.open = ov5647_open,
 };
 
-static int ov5647_s_auto_white_balance(struct v4l2_subdev *sd, u32 val)
-{
-	return ov5647_write(sd, OV5647_REG_AWB, val ? 1 : 0);
-}
-
-static int ov5647_s_autogain(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-	u8 reg;
-
-	/* Non-zero turns on AGC by clearing bit 1.*/
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_AEC_AGC, val ? reg & ~BIT(1)
-							: reg | BIT(1));
-}
-
-static int ov5647_s_exposure_auto(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-	u8 reg;
-
-	/*
-	 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
-	 * clearing bit 0.
-	 */
-	ret = ov5647_read(sd, OV5647_REG_AEC_AGC, &reg);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_AEC_AGC,
-			    val == V4L2_EXPOSURE_MANUAL ? reg | BIT(0)
-							: reg & ~BIT(0));
-}
-
-static int ov5647_s_analogue_gain(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-
-	/* 10 bits of gain, 2 in the high register. */
-	ret = ov5647_write(sd, OV5647_REG_GAIN_HI, (val >> 8) & 3);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_GAIN_LO, val & 0xff);
-}
-
-static int ov5647_s_exposure(struct v4l2_subdev *sd, u32 val)
-{
-	int ret;
-
-	/*
-	 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
-	 * which we leave as zero (and don't receive in "val").
-	 */
-	ret = ov5647_write(sd, OV5647_REG_EXP_HI, (val >> 12) & 0xf);
-	if (ret)
-		return ret;
-
-	ret = ov5647_write(sd, OV5647_REG_EXP_MID, (val >> 4) & 0xff);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, OV5647_REG_EXP_LO, (val & 0xf) << 4);
-}
-
-static int ov5647_s_flip(struct v4l2_subdev *sd, u16 reg, u32 ctrl_val)
-{
-	u8 reg_val;
-	int ret;
-
-	/*
-	 * TIMING TC REG20 (Vertical) and REG21 (Horizontal):
-	 * - [2]:	ISP mirror/flip
-	 * - [1]:	Sensor mirror/flip
-	 *
-	 * We only use sensor flip.
-	 *
-	 * Using ISP flip retains the BGGR pattern at the cost of changing the
-	 * pixel array readout. This affects the selection rectangles in ways
-	 * that are not very well documented, and would be tougher to deal with
-	 * for applications compared to reading a different bayer pattern.
-	 */
-	ret = ov5647_read(sd, reg, &reg_val);
-	if (ret)
-		return ret;
-
-	return ov5647_write(sd, reg, ctrl_val ? reg_val | BIT(1)
-					      : reg_val & ~BIT(1));
-}
-
 static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 {
 	struct ov5647 *sensor = container_of(ctrl->handler,
@@ -1179,38 +985,55 @@ static int ov5647_s_ctrl(struct v4l2_ctrl *ctrl)
 
 	switch (ctrl->id) {
 	case V4L2_CID_AUTO_WHITE_BALANCE:
-		ret = ov5647_s_auto_white_balance(sd, ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_AWB,
+				ctrl->val ? 1 : 0, NULL);
 		break;
 	case V4L2_CID_AUTOGAIN:
-		ret = ov5647_s_autogain(sd, ctrl->val);
+		/* Non-zero turns on AGC by clearing bit 1.*/
+		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(1),
+				       ctrl->val ? 0 : BIT(1), NULL);
 		break;
 	case V4L2_CID_EXPOSURE_AUTO:
-		ret = ov5647_s_exposure_auto(sd, ctrl->val);
+		/*
+		 * Everything except V4L2_EXPOSURE_MANUAL turns on AEC by
+		 * clearing bit 0.
+		 */
+		return cci_update_bits(sensor->regmap, OV5647_REG_AEC_AGC, BIT(0),
+				       ctrl->val == V4L2_EXPOSURE_MANUAL ? BIT(0) : 0, NULL);
 		break;
 	case V4L2_CID_ANALOGUE_GAIN:
-		ret =  ov5647_s_analogue_gain(sd, ctrl->val);
+		/* 10 bits of gain, 2 in the high register. */
+		return cci_write(sensor->regmap, OV5647_REG_GAIN,
+				 ctrl->val & 0x3ff, NULL);
 		break;
 	case V4L2_CID_EXPOSURE:
-		ret = ov5647_s_exposure(sd, ctrl->val);
+		/*
+		 * Sensor has 20 bits, but the bottom 4 bits are fractions of a line
+		 * which we leave as zero (and don't receive in "val").
+		 */
+		ret = cci_write(sensor->regmap, OV5647_REG_EXPOSURE,
+				ctrl->val << 4, NULL);
 		break;
 	case V4L2_CID_VBLANK:
-		ret = ov5647_write16(sd, OV5647_REG_VTS_HI,
-				     sensor->mode->format.height + ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_VTS,
+				sensor->mode->format.height + ctrl->val, NULL);
 		break;
 	case V4L2_CID_HBLANK:
-		ret = ov5647_write16(sd, OV5647_REG_HTS_HI,
-				     sensor->mode->format.width + ctrl->val);
+		ret = cci_write(sensor->regmap, OV5647_REG_HTS,
+				sensor->mode->format.width + ctrl->val, &ret);
 		break;
 	case V4L2_CID_TEST_PATTERN:
-		ret = ov5647_write(sd, OV5647_REG_ISPCTRL3D,
-				   ov5647_test_pattern_val[ctrl->val]);
+		ret = cci_write(sensor->regmap, OV5647_REG_ISPCTRL3D,
+				ov5647_test_pattern_val[ctrl->val], NULL);
 		break;
 	case V4L2_CID_HFLIP:
 		/* There's an in-built hflip in the sensor, so account for that here. */
-		ret = ov5647_s_flip(sd, OV5647_REG_TIMING_TC_H, !ctrl->val);
+		ret = cci_update_bits(sensor->regmap, OV5647_REG_TIMING_TC_H, BIT(1),
+				      ctrl->val ? 0 : BIT(1), NULL);
 		break;
 	case V4L2_CID_VFLIP:
-		ret = ov5647_s_flip(sd, OV5647_REG_TIMING_TC_V, ctrl->val);
+		ret = cci_update_bits(sensor->regmap, OV5647_REG_TIMING_TC_V, BIT(1),
+				      ctrl->val ? BIT(1) : 0, NULL);
 		break;
 
 	default:
@@ -1414,6 +1237,13 @@ static int ov5647_probe(struct i2c_client *client)
 	if (ret < 0)
 		goto ctrl_handler_free;
 
+	sensor->regmap = devm_cci_regmap_init_i2c(client, 16);
+	if (IS_ERR(sensor->regmap)) {
+		ret = dev_err_probe(dev, PTR_ERR(sensor->regmap),
+				    "Failed to init CCI\n");
+		goto entity_cleanup;
+	}
+
 	ret = ov5647_power_on(dev);
 	if (ret)
 		goto entity_cleanup;
-- 
2.43.0


