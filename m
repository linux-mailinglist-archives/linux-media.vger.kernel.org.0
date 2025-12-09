Return-Path: <linux-media+bounces-48458-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A03BCAF864
	for <lists+linux-media@lfdr.de>; Tue, 09 Dec 2025 11:01:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 024B7302DB64
	for <lists+linux-media@lfdr.de>; Tue,  9 Dec 2025 10:00:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 294022FD699;
	Tue,  9 Dec 2025 10:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="GZYQ/EWI"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021075.outbound.protection.outlook.com [40.107.57.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9EA3595B;
	Tue,  9 Dec 2025 10:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765274455; cv=fail; b=TPGzQi5U0JNBr43PudNpZcCuB5kUZlralsA/pFVIp55VGPBIQ+K3Bw9AnmfLhlTDbaMlkXZTiH0oHbHUvYGy0SQnZdH8dV9p/VAmzw0ZxqTxbRV2CM4ERefoPHlEhP4fRKJ73++dzNaSiT1YFsc0KbA48iPgAuBJrf03R7lPE5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765274455; c=relaxed/simple;
	bh=8fZJfnYWd2sZvU1z7V4ZSZHajLwpc3M15Acm6stNv3k=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=UIs528YsNxdfuuvvY1n+++xbTSTSS8IbipVi1VJ5BbLwwysaEJBy9LpOUGSbXqmFabkmToNpkXgbY2lOZ71wavqJKvT25S115YN+A1dMVkNvt3GNTAgFxtTV+KCnQq3A7dZEVOJkjoAlDQsIZGlb1XDccILJdWP3xKHW7nE+VZk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=GZYQ/EWI; arc=fail smtp.client-ip=40.107.57.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SrCmz1gQgRxOF1cWS50s7G+VcgjZcEOxodgniiiCxgKHJ7q1xEb2nyoK6e2dCV0EX94EL9/n5tbiOKVJjRQbFfz338aB8qv1E4wqUciye0SP/qcpHFufSZi02mxOEJfMMB7nbSqS9Tj91Z4h5MlR1M0a918239Un/SqHQg9qIXJFVjobZ0gHSi3jhwTql62UXjBD0vOaLL4Xl7pDlnZBFvMTJWFDVHHo+fHCLAMn2jvO0yJHr5xYkDG1eGHG+GFau7JSPJxt9UblqZSbhMYuh9fdpNsLaLyotTofkbihyu5MgrtmTvm1SMhiNQ5JtjheU7JzJaM444ohXlxXdUuv8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CQ1TpEpSwzjYPgvP7wdmiAxKdBIMC7bCjHVrKJCdgAc=;
 b=CldZfMXDpm0Gk7UfAUY1iE3LBg3huRuPlyaJCq/ZSygX7McEhqlbmsHsQuF7ifXOn/VfQqCAqXuyM2me/YmKX1C/dOO+zTru+zMFxHYvPM11Aw20enXEY4sHQRDfvektGUDhWlbYiG6c9kkOrhbw7bB0WXcMOjWIaICuIAQEg1IhgxReEjsXfa73jfFHtJV3V0x5fEv/airwIHLrejXI/0DZNuivQMDdcv2n8d7PDg4v9+Gn8XwAuel8iu5PBkuSeTN/ZNXGmiOTMiehbERtjSO0Q+UsNuNix6P+qKKlpWqITl+punnS+AR3ig/iMHniVuVsY/gb/iOVNbKcY+aj1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CQ1TpEpSwzjYPgvP7wdmiAxKdBIMC7bCjHVrKJCdgAc=;
 b=GZYQ/EWIAomDmdfIB/99qJr5EK8QBijNR6ROc7taWe4XASbXWTSLNF3WtUEjiechE0WBNJNmOLN5cRuKjDJ9aUokt82VOQLnMe/Yerffh8r1YJiGxsgBSfkWQAarBnvIm1RzauGibNLcpVWM7hX1SN9zIfMynj1vmlf1Z/3+rNQ8FBOgm6gg5yCedaeGzgY68KJ0sMxPttaSBGhTNtgtX1DfgChS3sHyIH79avS8oQAbmdQdJP+4RdXLMrpT8lr7Q8FNmLluQSFKa1jKqdKGAq9V741k9iAZdhif9gXIahv4NJahD2fT1F3RBjgiMvKW7vMTB+q7+UGwP0j0wFk3dQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by PN3P287MB1960.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1d2::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 10:00:48 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9388.013; Tue, 9 Dec 2025
 10:00:48 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com,
	krzk+dt@kernel.org,
	robh@kernel.org
Cc: Elgin Perumbilly <himanshu.bhavani@siliconsignals.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mehdi Djait <mehdi.djait@linux.intel.com>,
	=?UTF-8?q?Andr=C3=A9=20Apitzsch?= <git@apitzsch.eu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
	Dongcheng Yan <dongcheng.yan@intel.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	"Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
	Jingjing Xiong <jingjing.xiong@intel.com>,
	Heimir Thor Sverrisson <heimir.sverrisson@gmail.com>,
	Hardevsinh Palaniya <hardevsinh.palaniya@siliconsignals.io>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2]  media: i2c: Add os05b10 camera sensor driver
Date: Tue,  9 Dec 2025 15:30:04 +0530
Message-Id: <20251209100017.302518-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN2PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::28) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|PN3P287MB1960:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f7a1b65-ea86-4801-a3c8-08de3709d3fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|52116014|7416014|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?sIC4RY94M0oQQg0Uvclxh35iZGLMDphrp0Y/4TD+zpLgWvfzWdW0wG24vOz5?=
 =?us-ascii?Q?Ns7MlY0p7Q++2wLjw5Ah/C4dAt+sDeD0QtQ/dwSHOOb1iq0V74v48FtdsiLx?=
 =?us-ascii?Q?8pWIPNBVRfy03/jwrJNNB51iUjozCCNRSD2afBD+xuZYPknKlvub6drElSVn?=
 =?us-ascii?Q?eSf0z/EBnTSjwt77iwk8mOK3A8iPGWJKxTTBZcmjqEYc1sAY8/QEjJHVWDn+?=
 =?us-ascii?Q?bmKbK3Qfm1ApOWcV/NSMDf+PhSD52F9arHdjYT1K+lB0WqCVdHY5kRvqkw1M?=
 =?us-ascii?Q?pDp0ebG9ka+Uy5si26L2+zSpM1Mv51Secw/zOwnSE2gsri/T9wJ4TZ3qaL9U?=
 =?us-ascii?Q?XMcAACnENfY2qvrZKmSLyUMshpMKVc533VgVPOCoFZMAUJMaaOXW5ExtijlO?=
 =?us-ascii?Q?EkxrlkpxN0KVltDhmaihro4W3lblBJ0pGKJQiICotb4tgRofm3qURK3dWczL?=
 =?us-ascii?Q?NIqfm9XcHxXJSovWlLKQIOTLLavpo0K1VuQKm+84YiQlkKFkBNxpkhdsFn6F?=
 =?us-ascii?Q?FkjJwURU12wOYe6mR6Y7hlw2GwFMByOQYsWDEdOuY4bool7r4AXklkzlxoOH?=
 =?us-ascii?Q?TqO/OcA48BdyQW6zPZGJ3VgqOS7zr0sArdBKgVsi8oJM3vfJ4UKNfdR0cpnS?=
 =?us-ascii?Q?qV1SFybNjRUg/BALa4j9UpfVyCruGT7TB00bLvaoJc4rDK17JQSNyVcCsjFA?=
 =?us-ascii?Q?hUQ9xUHZYbshXzC99XSgLboI6Qor/DwUutGPJLKJlEjeAv1NRR3VxJ5QXCeD?=
 =?us-ascii?Q?RcSqN0O1vz9PQNrSSrJbsqS9L1F9YEwjpR6dcAL1cpateT5SVK5wKrnbch1A?=
 =?us-ascii?Q?NDqyXFLlQFQ/KELrFhmDQlI1PZrPFPeL8LHt8JXDwynU2dBWMwKRtMwU59+g?=
 =?us-ascii?Q?x6GDh4LGf7GnZAqNPXOXcueNYYWRQUNhx3folU94b5PfulpM2W+YjfF4HrTB?=
 =?us-ascii?Q?NAXT/v4aEfFoOmYvq9GCcYfxN2odwY9yn8R/0XqABCA0x6XpLsdIyLWO9ZaR?=
 =?us-ascii?Q?H9IL/QuOEJWnOEWOHN6XSeAp41+jr7GfoCFJKxhFUldVdqOWgXpURwYjIPD4?=
 =?us-ascii?Q?XLqc8T7Sx6RJfe8Nyv0Sj6CgCF2/89TFPLXaahmzgFGhHDk+ciXr2zQ0M+Jq?=
 =?us-ascii?Q?i+OeQqV+rJcK3U2V24LnU+ViBr7apstSaa6N3+VxbCnrsTxQDezAH3N8FUwG?=
 =?us-ascii?Q?s/zbJy3FSbnY9on7aVgKe2qP8/VvyfNooIrIg9BzxsS1mNR2IrF9FHFQMs5D?=
 =?us-ascii?Q?pjxBv40bWxRQWhv7WCXg1rSpj9qvrEGpb3MKCTcssym7UYPhL7uDWQl40Bxu?=
 =?us-ascii?Q?HPgn16mcR2xgKj4Z4i1SpXQg0NPS//5Z8YU/JLdleel+jcvCPipSY9T57cwj?=
 =?us-ascii?Q?zO5dNaM0l/GU9gJKnFadTWSCHJDh3l7BBtzAcz6uYrCQqYUojpLziDRHr8U8?=
 =?us-ascii?Q?PJQYI8JwMNhP6Hqtu75ti5pEmzekL5KGOB9XebdYVGsVSHZi7tWP9TvVSAma?=
 =?us-ascii?Q?kDP1+apoOOQwvAHWxYdRkztKCvS6tVU+602d?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(52116014)(7416014)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?WGAak0OO/P2HIlQbqJIJeer1Y0/fEv3aphN8NKxk/sBxbbqsPGTYWy7VBVqb?=
 =?us-ascii?Q?OGGSX0Dv0uQt2wNs/xqpjn70vjO2nZpKfAwgXM2AsxtEUo/RczBsRQy2KWCS?=
 =?us-ascii?Q?qFi+h3JfxBRmaC0FGXwDpNNHCqqY9Ado3vdDOUhOJiSzUFG2X9hgZ0WwHfgB?=
 =?us-ascii?Q?R5jYMvRR3P724GbNgl9vpOA9r6PS2dFYwHrO3W2payG+8CqerBt9WBshRUVp?=
 =?us-ascii?Q?tKl2pJGncNoxZ7IZEUNhrYPeLJucHRIhMU9kj3D6ZzfnQZC9Y6aOzUkFn+LG?=
 =?us-ascii?Q?rpXuBGH75bu5DxeLNoHqYYnuPDt8clCpGZo/iBrSFe7cSqfdpVSafLZd740N?=
 =?us-ascii?Q?mtbZj7NM+VBBbjA4oAmj9FMEJfbQ6oJCOu8T5PoKsjp2Ep1rnldWDUR21Tmp?=
 =?us-ascii?Q?MyhV/z9CTFc2ugJaTegEwv1TG1n04VPTgNLUgyYOG6mypBaiCmOGcdsS5ieO?=
 =?us-ascii?Q?KxGI2x6XOeMdLznrRx/EV4qmPjyyMP99HZPW+hJLL+vcASkZTFTmxYhcdXTf?=
 =?us-ascii?Q?ChvDJzyMgro1tCFPgM6XabfnRpFcrtPczZ+2f2nZPhXYi0SjDMOgdPkB3Oq/?=
 =?us-ascii?Q?tFnZuY6Ffx7l8CkjJaDfyXJ+PR3BzQnglX2wagNzBcQGfCtqwhctniDBAiRT?=
 =?us-ascii?Q?7MyxG82K0TP6hgkpUa3frv+YVcyUMYovoM5pXoksT0KlyFrdr3xG7eZuQNGG?=
 =?us-ascii?Q?0Vjz6RVLN/qGrnAeXnlJnI+3nma7LJXaEIMc+ol3vuyC0zu4Wsfi5EcNU20k?=
 =?us-ascii?Q?0uTK7KNnEjcrHrFU7dsAGVtO8L/MInT69/q+HX+TegwF4Y2zpsnoIdVxryWX?=
 =?us-ascii?Q?JuAHyChgo8nW+Q09MNJ47+0835/wlfu7FqAvqfxc/Db05Abao+gD759lawun?=
 =?us-ascii?Q?NnkvPpubIw9r8/j/BybuL3A7IA6mPzub3Bf51ye2+mpX9dkunU8OjsePaY8Q?=
 =?us-ascii?Q?BIkBUSpHRsdodc8G6bNyDHNVbx07PCAqcp7+hIlr/NkNOPN+VqPNW1iAcXwC?=
 =?us-ascii?Q?TAQ6xp1kbzlDjCWX057gAQIBQ1MWTjy9LyqrwowdAJuTxh8qwG8c1sEvhZzT?=
 =?us-ascii?Q?dzetaXjOqjY5CWFm0h8WmId1ooRqtmX94mAz22UVJ85rYOJN/vTzInppHqX/?=
 =?us-ascii?Q?KKbbKifwj4tDaL7aB9a8jm2xTrHM59ImBMiHQHwaeK3qf9nJjoLIecsBC169?=
 =?us-ascii?Q?Pra5iLLwYCIvt2ybY0vG73wayGfdfpJPck2M4wK3j4va415hNutwupin8Fgn?=
 =?us-ascii?Q?pguJywM0Cpk2YhC34McschCVb6SDz39w05jr034eupU1CAt6CSMCLdK8txEX?=
 =?us-ascii?Q?1DekmeeBpAmnMrT1JklT0jR/7gbL1ivR5wvuhmTWsUM+go9KB8ahM4Hr4aDz?=
 =?us-ascii?Q?LwwP9PNzvJ+rUIBMk6EcdCXLclNM/SziA6itiIwZlPmlSow3c8cGHvm0O7Xv?=
 =?us-ascii?Q?aAdXRadCQuHaK4CpwhB0WR5sp/loRyDHg/2aA/KhSmU4qwCWN5N/bNN8jHk4?=
 =?us-ascii?Q?gA8VqFF4cGpyEfSjefn5GhLN7gISviDqwZqXbsvWykicNHmLQ3Uon5k+D0xN?=
 =?us-ascii?Q?qkPLUPt0Fkp6+zPD0SXhVIhhSA6f47N4xZpRg/kPAE5dx8Sd6/D5CTw36Omq?=
 =?us-ascii?Q?TTnc4BIb4Lw9tdPQSXtHJQQ=3D?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f7a1b65-ea86-4801-a3c8-08de3709d3fb
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 10:00:48.7809
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t4L59m3zdsAy4NXFey68KBihgHfQyCjuQleSu/KLBg9OfLQv4X2YcUbEROXj19a8+fhOEOXPnKTk/src/bD0sG1YrIIDwXfdvf3aqoSxh1UgBwAb7n1FaJ3phtlPVvpw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3P287MB1960

From: Elgin Perumbilly <himanshu.bhavani@siliconsignals.io>

The Omnivision OS05B10 is a 1/2.78-Inch CMOS image sensor with an
active array size of 2592 x 1944.

The following features are supported:
- Manual exposure an gain control support.
- vblank/hblank control support.
- Supported resolution: 2592 x 1944 @ 60fps (SBGGR10).

The driver is tested on mainline branch v6.17 on IMX8MP Verdin Toradex.

v4l2-compliance 1.26.1-5142, 64 bits, 64-bit time_t
v4l2-compliance SHA: 4aee01a02792 2023-12-12 21:40:38

Compliance test for device /dev/v4l-subdev3:

Driver Info:
        Driver version   : 6.17.0
        Capabilities     : 0x00000000

Required ioctls:
        test VIDIOC_SUDBEV_QUERYCAP: OK
        test invalid ioctls: OK

Allow for multiple opens:
        test second /dev/v4l-subdev3 open: OK
        test VIDIOC_SUBDEV_QUERYCAP: OK
        test for unlimited opens: OK

Debug ioctls:
        test VIDIOC_LOG_STATUS: OK (Not Supported)

Input ioctls:
        test VIDIOC_G/S_TUNER/ENUM_FREQ_BANDS: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_S_HW_FREQ_SEEK: OK (Not Supported)
        test VIDIOC_ENUMAUDIO: OK (Not Supported)
        test VIDIOC_G/S/ENUMINPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDIO: OK (Not Supported)
        Inputs: 0 Audio Inputs: 0 Tuners: 0

Output ioctls:
        test VIDIOC_G/S_MODULATOR: OK (Not Supported)
        test VIDIOC_G/S_FREQUENCY: OK (Not Supported)
        test VIDIOC_ENUMAUDOUT: OK (Not Supported)
        test VIDIOC_G/S/ENUMOUTPUT: OK (Not Supported)
        test VIDIOC_G/S_AUDOUT: OK (Not Supported)
        Outputs: 0 Audio Outputs: 0 Modulators: 0

Input/Output configuration ioctls:
        test VIDIOC_ENUM/G/S/QUERY_STD: OK (Not Supported)
        test VIDIOC_ENUM/G/S/QUERY_DV_TIMINGS: OK (Not Supported)
        test VIDIOC_DV_TIMINGS_CAP: OK (Not Supported)
        test VIDIOC_G/S_EDID: OK (Not Supported)

Control ioctls:
        test VIDIOC_QUERY_EXT_CTRL/QUERYMENU: OK
        test VIDIOC_QUERYCTRL: OK
        test VIDIOC_G/S_CTRL: OK
        test VIDIOC_G/S/TRY_EXT_CTRLS: OK
        test VIDIOC_(UN)SUBSCRIBE_EVENT/DQEVENT: OK
        test VIDIOC_G/S_JPEGCOMP: OK (Not Supported)
        Standard Controls: 9 Private Controls: 0

Format ioctls:
        test VIDIOC_ENUM_FMT/FRAMESIZES/FRAMEINTERVALS: OK (Not Supported)
        test VIDIOC_G/S_PARM: OK (Not Supported)
        test VIDIOC_G_FBUF: OK (Not Supported)
        test VIDIOC_G_FMT: OK (Not Supported)
        test VIDIOC_TRY_FMT: OK (Not Supported)
        test VIDIOC_S_FMT: OK (Not Supported)
        test VIDIOC_G_SLICED_VBI_CAP: OK (Not Supported)
        test Cropping: OK (Not Supported)
        test Composing: OK (Not Supported)
        test Scaling: OK (Not Supported)

Codec ioctls:
        test VIDIOC_(TRY_)ENCODER_CMD: OK (Not Supported)
        test VIDIOC_G_ENC_INDEX: OK (Not Supported)
        test VIDIOC_(TRY_)DECODER_CMD: OK (Not Supported)

Buffer ioctls:
        test VIDIOC_REQBUFS/CREATE_BUFS/QUERYBUF: OK (Not Supported)
        test CREATE_BUFS maximum buffers: OK
        test VIDIOC_EXPBUF: OK (Not Supported)
        test Requests: OK (Not Supported)

Total for device /dev/v4l-subdev3: 44, Succeeded: 44, Failed: 0, Warnings: 0

Elgin Perumbilly (1):
  dt-bindings: media: i2c: Add os05b10 sensor

Himanshu Bhavani (1):
  media: i2c: add os05b10 image sensor driver

 .../bindings/media/i2c/ovti,os05b10.yaml      |  103 ++
 MAINTAINERS                                   |    8 +
 drivers/media/i2c/Kconfig                     |   10 +
 drivers/media/i2c/Makefile                    |    1 +
 drivers/media/i2c/os05b10.c                   | 1120 +++++++++++++++++
 5 files changed, 1242 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/ovti,os05b10.yaml
 create mode 100644 drivers/media/i2c/os05b10.c

--
2.34.1


