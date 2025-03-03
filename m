Return-Path: <linux-media+bounces-27387-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 423F0A4C691
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 17:17:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E1D22165A44
	for <lists+linux-media@lfdr.de>; Mon,  3 Mar 2025 16:16:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A633523C8D7;
	Mon,  3 Mar 2025 16:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="csJww6dj"
X-Original-To: linux-media@vger.kernel.org
Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11011003.outbound.protection.outlook.com [52.101.125.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 019CE215185;
	Mon,  3 Mar 2025 16:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741018201; cv=fail; b=CbVnGwXzU7w0pJLaJJ5OtYhWoO9+OQ8smIPwnmglhK+GNra9aMu5RYqoUjcB2xu0wMdhQYbAGUKzjylsPRnNaE9WjeMeWaJYF+ur58AQhzl+368wSyZSWtTlVe6EBDgsLff50uoMyLAWNSizdd1CYTcd+H/VjWufM2hTPrAQpr4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741018201; c=relaxed/simple;
	bh=LqfLMzDRg+QEn35zV+3oPZfAc+VImK8JMpyKyCgmZ6Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LE7EQoJuyYAAhVpjWfc18GOxHMy0L2llnKi4gSly/RWe6Z5mSRNlNde+bvAH3HwSCpXDcq6Byh4p4D9w9Kp2aQZXLgl2YbC7QkNX0EP/sxxdpOl86vymdb1WfcNtuiFp8bsmjhxps/gaamg959Tl0oTzAHNN+EkrrcG5dPz831o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=csJww6dj; arc=fail smtp.client-ip=52.101.125.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=chJaS1qBHeicrGUbueL3kYIl/JyLrEzxncCEHWYLVjOdnNVXxvB35tL8oO5kZUqq61jmlzECfMU3wwl2qHKBfgOtAAb9ORElfdFbXeajVRHb/3qxgNutwapleTlT/XHm3o+OLnE+x+bA+ZgTCWd0NLZFdV6Kp/z/RLS/WhnoqPP754hwVPF2acqlnHgQvstzedondFKpiSMtPq2IFPftcupIyxWlUEWGaSiUEmcCRH1TlwzVL0MyHGHadIHPnHYWYXA8uPG3L1yzfwzt2btiSuFNjrJQmErwgXwirHQ58pHTScXu6FjL03BQIXkkQCwVFnDl0eZJSM/RcdPWHh0Fpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bjun3rYJFbgHoj2Fxbo7XX+LDOGEbWMW0HgfswOEADg=;
 b=n4nP0B4a1v4lSfOoAJxzM/6zwmlAyfNxqdsY/aUORCC/h9MiFdSYKhm6Nusf9uM1Va7xAwovOIg/99WfR7GCa+Pz6xdyhhpXl+PMVIdxv41WYL8X0PjOotQfiR/aZ8dKXzmn3Y7MuWeIsOKa8tM3OVHqsM0ylYlYCu8Twwy5UNSstAmWwDG9U/mBDdTQWwtc+U5nxsVUY2V6dMCn8Ncn593aVVRbDTyoe0vK5DcvAZhjeMikXjIrTyLD6/5ew8DH8n1j7Tscgafh6Z6n1wvlsFdW3s1pRNZd9ElL9CSjIIZh0wsPysQrnGwVCNwXN+dkb71nvF0p7SsOPrbTJx2vYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bjun3rYJFbgHoj2Fxbo7XX+LDOGEbWMW0HgfswOEADg=;
 b=csJww6djm8xgc7+CmAITIK1DdRshJK21wBjp0ijMwzkYdZuTwWjGii7QXihlHUfaC8NJT8OycauP+HrBwIlOoN81CkDuMDQrvK4Q/057HFdTNKCd0KRGd6lqO6nie3TYT2FSGArD0b6oyDi7B7yxxFqMVAAse4ab+tRmhcBD+jA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com (2603:1096:604:35e::5)
 by OS3PR01MB8683.jpnprd01.prod.outlook.com (2603:1096:604:150::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.27; Mon, 3 Mar
 2025 16:09:56 +0000
Received: from OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3]) by OS9PR01MB13950.jpnprd01.prod.outlook.com
 ([fe80::244d:8815:7064:a9f3%5]) with mapi id 15.20.8489.025; Mon, 3 Mar 2025
 16:09:56 +0000
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
	Philipp Zabel <p.zabel@pengutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/17] media: rzg2l-cru: rzg2l-core: Use local variable for struct device in rzg2l_cru_probe()
Date: Mon,  3 Mar 2025 17:07:46 +0100
Message-ID: <20250303160834.3493507-7-tommaso.merciai.xr@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
References: <20250303160834.3493507-1-tommaso.merciai.xr@bp.renesas.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR5P281CA0032.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::6) To OS9PR01MB13950.jpnprd01.prod.outlook.com
 (2603:1096:604:35e::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS9PR01MB13950:EE_|OS3PR01MB8683:EE_
X-MS-Office365-Filtering-Correlation-Id: 21334519-1c9c-49d6-4815-08dd5a6dd751
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|7416014|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?/KbBsQKonBxhM74nHk+aCobjRZM0RC3gnAOxYiafB7SNeCrY10uygoooDZli?=
 =?us-ascii?Q?N2WbajLWVkp4Nz5iovGK8ZHfnrsGVZto/SpROhg0L6hU+QTGcExffiA/EAp2?=
 =?us-ascii?Q?E8GlC3yvoFr4/1OkNLcfE/jT84Bm2F9aB1hvsUZJ3giZuPmPar2auCpTLhkw?=
 =?us-ascii?Q?6nssoBGda4Bao21FtcELPwHTan/5RYmUucL3iXXrcdfRL+XXYZMW10aYnWUT?=
 =?us-ascii?Q?0dG7fJbcT0Hp0ZlNxzlMe3lmmT+fYoJTmDX+KLoADA+VMaXvdWSW+VfHm1u3?=
 =?us-ascii?Q?3PmtrPUwwEE6w0m1ZzzrLXWEcWEh3oJa8G+1iDdURCHmW9gQdrLUSU8Q+G6f?=
 =?us-ascii?Q?UKa3+R4fBqcufDp3YimLve39KRSM5YZV/nO4LZqf8VD1tdVX5sEmyRP0eNSr?=
 =?us-ascii?Q?w/5JswezvfehoRKwOevfyyde3H3qpecxHypZ+4jvfN1tnFRQZ0Z9BsrhcVlW?=
 =?us-ascii?Q?n7uaR8zzgaUOMv8bwC47UhoikrFjdWXsUeiU9WnJNgB4i06Pnr+wMwhKaovE?=
 =?us-ascii?Q?GbKYyn+Pl0p65LhV+shTe4KeTh56bZGxg1WwenjeSA0B3q2bhUyxjaOFlAWA?=
 =?us-ascii?Q?N+2t8yJwt7ctTb6ifjVBp/O00F03ngd19YeoMDW69d9DOIeOf68qYMDGkcGr?=
 =?us-ascii?Q?8AX+Ii+VFom/rKVeaI+sJvcD7O7V0D11bKGUQReirkaRG3IB6IFT4mBzjG/B?=
 =?us-ascii?Q?q2XBCZ/M7y3sJjZUWVatQwyhWNxHCo9qcD9jxXlfk/0kEtjwxVMQBgiuv67f?=
 =?us-ascii?Q?KXEpV7A8KpOGNUn9sNT/MKDFL0p9Vw+8PzRNh6+NGxYxLUYqkeX5XdXWML6M?=
 =?us-ascii?Q?/focu39RG3aVMkkoQXyYMF8J2znZFvhk1MOh+I8w6qGZflqQjLAL1OSX25tw?=
 =?us-ascii?Q?z6mnVYs6J+Z+ZjALW8CFcOEBVp0nmJCiQ4Sc0OkkA+9FjrLAVvukaE2e9Go+?=
 =?us-ascii?Q?2FlPseB40G3CydfxU89EL3/eLYqjmgD5T541P8bxEUTN15J67QhWApDzh5ld?=
 =?us-ascii?Q?E9fBmbdOGvmV304Lv2+hu94KhY8L4oDRuxanLAN9tzuQX8Y5s8I2ngZTEfji?=
 =?us-ascii?Q?H5Kf6FKyyMu3Ie2jacxrNNBsispYkynjyMGe8zbSRfnSOqUVqY9+3cBPuZq3?=
 =?us-ascii?Q?4mphMo0SC5XEDBzbGydnnb5qkytI42CsoxPWnTFHF2JV6k6WAtN+XJMk6xfr?=
 =?us-ascii?Q?tR+nms0ssCvWzf9n3Fpg0hgLIDrqZEy6uMJBEqSKkgeNYTcu6pYQQrCVEPPt?=
 =?us-ascii?Q?05OSWkMOUADuCKrzMPNVoU5lNxIoYJy+tzTZk0lLYjO9iz21HkkMYfBNdRdQ?=
 =?us-ascii?Q?CjiP7JGAlLgUIgccUB9OYPjaUGkdDBbELzAcfCZWSpzw1uye+LbKk1gb+QyA?=
 =?us-ascii?Q?F/Ekgc/w0zLetyPBevwj7608hVRejKgj+VbnQtqfPcQMybycEtwrq0IahbGr?=
 =?us-ascii?Q?iReUCJXSy/fK8HDNCM00FaNaK6Zd2PlP?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS9PR01MB13950.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LMIMZ7JdAuCrj9YFAcX4hftHlhOTrnvv53C3H5yFhKz8v8vN04H700eQkGyE?=
 =?us-ascii?Q?q32+y5tv3NVwf3m2F9mQPPjhgYqF6pzjrZB2WbVeTr6P6PhfBmyiPyUeyfw5?=
 =?us-ascii?Q?d/VNFIpjk9TFu+WMVWpbdY+uvdBlF1s4XmLMPy9Nl5l2s8J2m/1SewIP+9nB?=
 =?us-ascii?Q?3mH0U0G41xAS++UxccTqwSzw+3Gesg7iJahZCboRkbcOInww5io+qcILAiFj?=
 =?us-ascii?Q?HMDPp0FVvvDXOuxAk0pWizuSt8j7okbwacAWL9iJw3Wi/nf1TVRpFClZMIEA?=
 =?us-ascii?Q?GB/1ePAxNPLGgzr0udxRQ9zyfcOhbVNvkoSelekYbKFVSpF0H9trV/NqD60Y?=
 =?us-ascii?Q?tgtIh2TQvcZkAQKI1cU8zkOICQyQaH32YqiH/kH4H30CwQ3U6QvuSLnPf15I?=
 =?us-ascii?Q?bvIAvdn3nz6T/+nzU7dRon5+PwoJNWnPoLKJkl54OhCTDUDskAa7+rSznPd5?=
 =?us-ascii?Q?r1/1OcWapqcqgHTk9VF1pvha1zjNkIMM5ynqSHKweONIskvTLKWcCo+FBANF?=
 =?us-ascii?Q?1qCUoNHUg9BqHYfvv6l3WijMQvAKIhniu4JH3ZIxC4R9LnD5eq/5Wj8gJVHh?=
 =?us-ascii?Q?7pTK2WRopjMLSjLv2NnqDYDFpZx7bo8xDynM2NxVCSPgxeOd3phDC9hef1WT?=
 =?us-ascii?Q?gxMmcyUYevitVL/9I5opCLKgvnbGxhUN+fSKhEJmC5M2O9sUMMdLyoB7Zc+s?=
 =?us-ascii?Q?Sq7io6Tr8TckqiCaMrvnl6sQjZgo/NnhO65q3TRqoeDfKQoA0lNxPhdawhUW?=
 =?us-ascii?Q?b4SSUlJPH+yVSQWKadKfqjC1s3pFl0WoLVy3Mdoz1LhOxkO0sIMWIGifQOcZ?=
 =?us-ascii?Q?0lC8dxw7Y4YFXDicKrN2ZjN1VOxT4zwwig+TOt2p/5i8zH191q+VjtVFxmpu?=
 =?us-ascii?Q?OBbVfA5xLioxh84RR2Qd7h1TDemySncsO76pA46CLyNu1Gxq0EQPAS/K6mqD?=
 =?us-ascii?Q?9ZKySRGYqvAv0YnhoONIYE4OpxcDUzSt5ln4TqadyBT/F+2aPazY0iwY0mat?=
 =?us-ascii?Q?07QG901uxbC3VjPQjzRhdOQFrCsTy43zaBHdRTTt0Vp7/GiV2lWlVh3J/pVW?=
 =?us-ascii?Q?rg9g1hd5Fumm4mawlIN/6/mrSdQ8aNg9dJ1TAWJp5g/rcV9cEfKvbBrpfpyU?=
 =?us-ascii?Q?9HxwE8IxA8kOtk2imo4Z5CA6oa3yNrUBWkaH16eivc72At0Yp5z+wYWT+1uk?=
 =?us-ascii?Q?/4erJ7GMv0K35diMqvQORWYUR74VyezUBCXTNqeouLkRzGlnJTVtiCp8Bu7Y?=
 =?us-ascii?Q?G+V4HK8KSyGPQiy4+LUhcV8xzppWUfboC2/lMaJ4rmJJOX1ZNo5fv++vq64f?=
 =?us-ascii?Q?mZk8s8MeTmsrGuNH6E6ZJ1AKyGiEqvPRfQuwXILFH3TWJ2FcaRzRp6HSV2Ky?=
 =?us-ascii?Q?cgXlk/dkUW3Bol1Bn/uqo7w3H4NVjKHJGps9lAAyZiLgtW8OjEjj1NMVhwaw?=
 =?us-ascii?Q?1GTl4spl3tqsYg+pvrh9afRu/C9Fq2xIAl7N5ENOG8elPSF+VuVaNg8jf3Gl?=
 =?us-ascii?Q?vLd1/WAIs+zuAnqe5jjBJhC0NKKeH2z1VJip19AN9ZBkOrc4+c4nUz24DJR8?=
 =?us-ascii?Q?+aOtBOtQA1qwjpY1yPAfhZHKe6Ybgpa5j+zw/VA22APdXtlFEX1bspj2CEgT?=
 =?us-ascii?Q?Z6Q8morQ3wE1atvtxtTlAdA=3D?=
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21334519-1c9c-49d6-4815-08dd5a6dd751
X-MS-Exchange-CrossTenant-AuthSource: OS9PR01MB13950.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2025 16:09:56.8037
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vJvffJ1shGsp0BLpG+p/pSSTCs5sI9IwEvOmUodxeCf0fqNqAYTN5sW9ZJk4OO4JPpIjdJbfvrt28e5xznauxW5IdQvTVgkP9sJbYzxhQgJ1wSJatLf5zbptLbqhmdTx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8683

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Use a local variable for the struct device pointers. This increases code
readability with shortened lines.

Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>
Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Signed-off-by: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
---
Changes since v1:
 - Fixed commit msg and commit body as suggested by LPinchart
 - Collected tags

 .../platform/renesas/rzg2l-cru/rzg2l-core.c   | 29 ++++++++++---------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
index 89be584a4988..70fed0ce45ea 100644
--- a/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
+++ b/drivers/media/platform/renesas/rzg2l-cru/rzg2l-core.c
@@ -240,10 +240,11 @@ static int rzg2l_cru_media_init(struct rzg2l_cru_dev *cru)
 
 static int rzg2l_cru_probe(struct platform_device *pdev)
 {
+	struct device *dev = &pdev->dev;
 	struct rzg2l_cru_dev *cru;
 	int irq, ret;
 
-	cru = devm_kzalloc(&pdev->dev, sizeof(*cru), GFP_KERNEL);
+	cru = devm_kzalloc(dev, sizeof(*cru), GFP_KERNEL);
 	if (!cru)
 		return -ENOMEM;
 
@@ -251,32 +252,32 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 	if (IS_ERR(cru->base))
 		return PTR_ERR(cru->base);
 
-	cru->presetn = devm_reset_control_get_shared(&pdev->dev, "presetn");
+	cru->presetn = devm_reset_control_get_shared(dev, "presetn");
 	if (IS_ERR(cru->presetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->presetn),
+		return dev_err_probe(dev, PTR_ERR(cru->presetn),
 				     "Failed to get cpg presetn\n");
 
-	cru->aresetn = devm_reset_control_get_exclusive(&pdev->dev, "aresetn");
+	cru->aresetn = devm_reset_control_get_exclusive(dev, "aresetn");
 	if (IS_ERR(cru->aresetn))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->aresetn),
+		return dev_err_probe(dev, PTR_ERR(cru->aresetn),
 				     "Failed to get cpg aresetn\n");
 
-	cru->vclk = devm_clk_get(&pdev->dev, "video");
+	cru->vclk = devm_clk_get(dev, "video");
 	if (IS_ERR(cru->vclk))
-		return dev_err_probe(&pdev->dev, PTR_ERR(cru->vclk),
+		return dev_err_probe(dev, PTR_ERR(cru->vclk),
 				     "Failed to get video clock\n");
 
-	cru->dev = &pdev->dev;
-	cru->info = of_device_get_match_data(&pdev->dev);
+	cru->dev = dev;
+	cru->info = of_device_get_match_data(dev);
 
 	irq = platform_get_irq(pdev, 0);
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, rzg2l_cru_irq, 0,
+	ret = devm_request_irq(dev, irq, rzg2l_cru_irq, 0,
 			       KBUILD_MODNAME, cru);
 	if (ret)
-		return dev_err_probe(&pdev->dev, ret, "failed to request irq\n");
+		return dev_err_probe(dev, ret, "failed to request irq\n");
 
 	platform_set_drvdata(pdev, cru);
 
@@ -285,8 +286,8 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 		return ret;
 
 	cru->num_buf = RZG2L_CRU_HW_BUFFER_DEFAULT;
-	pm_suspend_ignore_children(&pdev->dev, true);
-	pm_runtime_enable(&pdev->dev);
+	pm_suspend_ignore_children(dev, true);
+	pm_runtime_enable(dev);
 
 	ret = rzg2l_cru_media_init(cru);
 	if (ret)
@@ -296,7 +297,7 @@ static int rzg2l_cru_probe(struct platform_device *pdev)
 
 error_dma_unregister:
 	rzg2l_cru_dma_unregister(cru);
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.43.0


