Return-Path: <linux-media+bounces-50191-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id C50B3D012C8
	for <lists+linux-media@lfdr.de>; Thu, 08 Jan 2026 06:55:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E88A63006993
	for <lists+linux-media@lfdr.de>; Thu,  8 Jan 2026 05:55:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A952333A703;
	Thu,  8 Jan 2026 05:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b="MbCTIAVe"
X-Original-To: linux-media@vger.kernel.org
Received: from MA0PR01CU012.outbound.protection.outlook.com (mail-southindiaazon11021117.outbound.protection.outlook.com [40.107.57.117])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62EBD469D;
	Thu,  8 Jan 2026 05:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.57.117
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767851729; cv=fail; b=cTcHQ/EoanIWkQ0V2e+PpzAyt8tE81SQLl/s05uLpnkNa76aVQwzhlCayruvDoKjG819zC3nDWSOXBwx70DrT/yM+J0OXqCZfbC40OPjYMv7mYq3XtQyOn11KxL8QPTFMUC9pw6SScEkQnu3Lus4An+/Le7FeIDwibMWEClDGx8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767851729; c=relaxed/simple;
	bh=9R39A51LdfmF0WATWhMF8enex6bkOg80fs1IJoYm/YI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Jr8sidRSl0lZTe/v/41zXyB9tcJdI2/pamRPc7O1JFNCQBSHuLjpC82se2+YYQ1esW8I00OqoSBlsa5EDzsSVTiWuo+o00rSkvRfTUI4CgFNraO4lnyOjS5j29iH42KR2Dy5Svmw49ceP42cQbsOILqE12bcahRg8xXb09IL4oE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io; spf=pass smtp.mailfrom=siliconsignals.io; dkim=pass (2048-bit key) header.d=siliconsignals.io header.i=@siliconsignals.io header.b=MbCTIAVe; arc=fail smtp.client-ip=40.107.57.117
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=siliconsignals.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=siliconsignals.io
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbrlZ52BX4njseidhXHdubm+fXJ7HQYL2Xo1uF2LRdexfZkgBFehkHVLRY8Nqlkv2hbC9D6EGoucYoJq3uFJFLqCWrVd++QuB3bRgZGboqeQe6MGl2hoEzVYSQJOArPX7XbM4vq+SH6kZnmtIo34+mtTv23lfs9lgDlUxS9ETQxbqfP0QawhmQY7AOvx7w8fzIsZCkvEodsr/KNJf5+rg36MTu+PxNAI0k1zr7SjIYHhMiXHoKW9VEK0o8iBJ+T7HP2lme0EASLyANvzzekCquoiEM8nOMHrO/5lLJmCzhD/Jkf7Sufu9GIEJCFFWx6/R15laGUil2JM3yP75IWKwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+dx7oTC5tjF9MhuQRYFaDpHe5lrj6oDlkg5BZ/BNA0=;
 b=jEtPivA+gNbEjs97H7wL+G/k0Asu7xU6wkJ40InU8YkiGTDmXbscEk+7WblqI5DfOJkTdntNfm+Abvfzd/Mdx+YhEY5TS7Qs4ZcnUKQed6ZyRiiRLLS5QpymFAgJFI9O/kuriU9xurNE/EH/sr8yS1lhO/DOiHBwJqaXD92hHpu282EiJwj42Lg0jnrwTG9qaAJCsgzy4frZc6hWeCUFnr6jk+KD1TY1EkYKNowVfKBINorRhbUO69mGrHzmNF/OHO9evBnM0ncHZOx2c8Vpzr9beNTRaExv2g3tK8W36CFl+x8WV8l7S9oD7tL/180BjxtyI6xjj9CjdoDEVVZ+Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siliconsignals.io; dmarc=pass action=none
 header.from=siliconsignals.io; dkim=pass header.d=siliconsignals.io; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siliconsignals.io;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+dx7oTC5tjF9MhuQRYFaDpHe5lrj6oDlkg5BZ/BNA0=;
 b=MbCTIAVelcg1Z8VBeesa6TGazDTPmyjZSnKzweCxywq4yx9yBtQ3TwMnOLuhvZ3VAA/yaUvIDmNCTBigA58D3FKvo2ngkHHXD9sB0UenQY67OjoPPkQwmOjdpK7354HjdHNeDNLKc9GnbSOcqHMnbNpHs99D2D9Khqxxesryq6JByaWhJXWl9+4TKdRkPczUOLqRJk0HtXnoQJyXpa/kjvEt7faAI8j9qfDYSr7t5rmBDQa6HKIhTVfdTGH27FK7YauMX/iQ3WiUuFXVDSPbSaVBIbuAHq+x7W9WagsOX/4X34TObQQcDYD+f/x8ghPPxjrL+4dwU9GbkyrnH7Hw1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siliconsignals.io;
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM (2603:1096:c01:1b8::9)
 by MAYP287MB3599.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:14d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 05:55:23 +0000
Received: from PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432]) by PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 ([fe80::ebd8:538d:c705:8432%7]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 05:55:23 +0000
From: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
To: sakari.ailus@linux.intel.com
Cc: himanshu.bhavani@siliconsignals.io,
	benjamin.mugnier@foss.st.com,
	clamor95@gmail.com,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	dongcheng.yan@intel.com,
	elgin.perumbilly@siliconsignals.io,
	git@apitzsch.eu,
	hansg@kernel.org,
	hardevsinh.palaniya@siliconsignals.io,
	heimir.sverrisson@gmail.com,
	hverkuil@kernel.org,
	krzk+dt@kernel.org,
	laurent.pinchart@ideasonboard.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	mchehab@kernel.org,
	mehdi.djait@linux.intel.com,
	robh@kernel.org,
	sylvain.petinot@foss.st.com,
	vladimir.zapolskiy@linaro.org
Subject: [PATCH] media: i2c: os05b10: Few minor improvements
Date: Thu,  8 Jan 2026 11:24:54 +0530
Message-Id: <20260108055454.71358-1-himanshu.bhavani@siliconsignals.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>
References: <20260105093420.110973-3-himanshu.bhavani@siliconsignals.io>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PN4P287CA0100.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:278::10) To PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:1b8::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0P287MB2019:EE_|MAYP287MB3599:EE_
X-MS-Office365-Filtering-Correlation-Id: d1169a37-8abf-4f88-ea7f-08de4e7a83a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?7hYs14bs8RT5bf1kDYHU6c2n5nSMvmaEKFphWQgzFAI6fQjG4LSFJj5rG7LZ?=
 =?us-ascii?Q?ZB3+Ejv54NfxbVruMOy5lc/lXxZBQIOx1s+itA4htqISwlL5+jDwmcKLLkD9?=
 =?us-ascii?Q?PhzDik4gix3IwsVnPWLSRyo32bbwJhkH5Hx051Rez/WuziM7TLW1y/WZ5aH0?=
 =?us-ascii?Q?ChXjf04VCZZxj9NH/dg0fwJdU2NdFWLhQoe117/kxvLDBe9pR/nqavs/Os9r?=
 =?us-ascii?Q?x+Qkf8dc3NPa26OT5I+gZPtWPPIG4FYrt7y1PBm7zdOzcVoqN0q0E3g7PpQI?=
 =?us-ascii?Q?ueAlvMGGipFTijJqECnOKoUUiM6IzTqLelEzWKPJ6d/aPZWxPYEwPScy3lxb?=
 =?us-ascii?Q?16IUXnbIo1MXDfJtAbwEwT+cNJTQwOn8sx0N0rn8sC6ZKytUelrlTaiewP0P?=
 =?us-ascii?Q?1B2NBsQjvYYUsZKBv6XpVsH4dipHRifQuYWzKnivQJRU0W6Id7CBVsGt4xL8?=
 =?us-ascii?Q?tFKc6OBeIMkLu22ea3hcn6OMCexak+nBDaTwIDF666iVrSlEulme5gdWYcRV?=
 =?us-ascii?Q?DlIySoNFwQNqi0vpigJnJ8Hn2J8N5v8QQSqMenqA3OB7aPLxaaXaLB0CD5x/?=
 =?us-ascii?Q?XvR2jvjW2v3IWKV89Kxex68ajU8rPj3z9uPMf/BO9XLCpAY3XR6V/6CP2mHf?=
 =?us-ascii?Q?X5YM+TPzPE7K99QMslH6v+lkie8/Ae2U7GsCuT90TDzvezCtqLQVdeDrI1kp?=
 =?us-ascii?Q?THgW1crcgxUPil9ISAkL/sRy1wWIoKJ5DetdD+K1Ab6ychSU7dvkMJbWmoMV?=
 =?us-ascii?Q?9lOs7nGL3gQ1n4ztq4ZWf3Kee8VgsLH69YGvuTO75eoKw73qlcrXdoZ9EWIj?=
 =?us-ascii?Q?TCbctEFMue6XP5jngYdi0vLMHn6/QeuLCwGpfNnL6BMFfz0TyfpNvrjLTK2q?=
 =?us-ascii?Q?CvLpJ/xrq2x+R/RsGTJNCDFprm2+fNRH96WJ1J5wAhYSlOQcWYNEqKd7VuFS?=
 =?us-ascii?Q?5u2CnfJIMc8Hb+eAUZprxNlreFwWVIowQHDsxHFl0W7tlBPyaREq23SPRmUV?=
 =?us-ascii?Q?Ew2PoAC/SjI2EhXgsShoQjMOIeKnSqsxxxVWT5x6nuwBJkimdrvNnLlefQxa?=
 =?us-ascii?Q?bEvXgQP1c0NrD9H83kHAUSb8H4R/L0pjM6Bj/My9uOZbbTXzlqTXGp3tXgZW?=
 =?us-ascii?Q?H0r1ReYke8tl30pfbVL4ZCe9XHldtLcc3OzEMOQOMdk1p8WbtT9Ske8nGi66?=
 =?us-ascii?Q?rTdhS3uzr0//DDt9RtMKAGtshuIS2faBp3QGqKr9zGP3fadz5Nd0ysfdieoU?=
 =?us-ascii?Q?TtHMNEQ6XYT9rzfiI7EMMDbos9gQrWb8hNu5jIWapCimlLWQA71Aul+b846x?=
 =?us-ascii?Q?3n00MWz+ELH9lJEjVwfhFGeXivSQmbzD2EK81dQMt8+DBgDvxcWzCmX3KCRJ?=
 =?us-ascii?Q?xnp+9vyZkTTNaN4Q1R7WJnQ+8iUUZqzXz2XlDXmKiDvG5WkKiapygdXa+4X1?=
 =?us-ascii?Q?ggCZr45jVsZ1AkyRlToosI1n67gkQadw66IWNcqOuWhTFKr33gtLgWLAsVNB?=
 =?us-ascii?Q?/Vfwj/jUszP1nkZsMHawc66OmlsTyat8b/Hi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PN0P287MB2019.INDP287.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LP+Q9fQjNqmHgEzSQvPUSWqyLPrQfDFZ7AAUHGC6O9iGbwwAFPzIwAKA8rAY?=
 =?us-ascii?Q?pQMlQbO/LaZVNjKLq/vMwsUGlakybhOYyCqQyiO4qaHDMEPbZ0BSBx34sPqH?=
 =?us-ascii?Q?2mo+9qI197q0aQZakvqRmoqasr4LARnh2+Gx5LBURvG3uSWrCWYHA6g98qZt?=
 =?us-ascii?Q?PxpQkEycwmV32Mag2HFZdXQHVacmLi38SRwuQW4bTEMPmGhYEgAXMa8KGlZk?=
 =?us-ascii?Q?eho2iC+xVCktWq/TjGn2a62cUryHOIXS+UedLao/dmqJE86OBlEeguHmqOKe?=
 =?us-ascii?Q?YCbm6OPxJUDlkFQ6WOBTyOejOScxLzZTTbIZEk3WAelQhKxOM3GlY23DDint?=
 =?us-ascii?Q?giC3ZABexglMvFQmodxdfUAn9piwk/5RC7HmbaahXORl2UM68a1VnkpGRCuH?=
 =?us-ascii?Q?hO0RdVjjIwkizDL6f58QnwaCADgZrbZkfzwylx8kXuTenBnZCnr0dg6qNaHz?=
 =?us-ascii?Q?+mg+Qlqu01PGpfNZaMjYBDZmMnQZegIOcFdT8RN82dVbTndBmIksPP6Fa8op?=
 =?us-ascii?Q?Wu9WJ5x98cn9/r6igpFaLNahUiEvlJER15g1qoO954hy8VOB+6EJwdse5mKA?=
 =?us-ascii?Q?5CgyScPenznXcrWN2n2TeG9T4B7QnPJvuGPZ21jSHDrNirpDkzTpYrRZeqZe?=
 =?us-ascii?Q?Vy63J1bKgkjbwViRNzzH7SbkKFHq7FJJExF85+34xajbAf92NCBy/w4lsPxL?=
 =?us-ascii?Q?N5L2fa31+bk2gsoksLncFZZ0HrRazwVN7+DTJZnMmv5CRG7EVKYYvYHxSm1k?=
 =?us-ascii?Q?tCMsweSk31RKDfbc1C74GkRJPgLDZZ74L7bi7XggLOWdNlgvVwAG87quQ9IG?=
 =?us-ascii?Q?ZKqKAOt7pbOBcEvuuXq3OY+61wG//FZ1nQkSRaiqy8eJiy0egRlq5Vd+CjFk?=
 =?us-ascii?Q?MHlcU6p5odyxBPt4BDrW4D3xGu5LxCi9vFrKsEKz2aEq+ZUF5C2lwJR1pkYG?=
 =?us-ascii?Q?O+vxTA9st9PAcMOvGhnkQ2uvGXL7moDXvlLJjx6IiCZY+OPAYqBAkJNBr1Fo?=
 =?us-ascii?Q?/rshAsQlxt4U6ha6iz1zL2OBcXV+BeyLh+e1LL5Hli30djjBjNYGT2cLT5E6?=
 =?us-ascii?Q?VN8VgakKcLaC51UJymVgxzAqjyfTx/Qil/BPki89MUnnDxcHM/D9e1h3+vH7?=
 =?us-ascii?Q?dQoMe9KO+WsOLSp2+5fzLXK6VNGLH2Be2iVajJfPsZIfAPEpBNLj6SgJFmbr?=
 =?us-ascii?Q?MvmYu+0HNdvQPYms5OD8w0xlPmN1v6jEhxXNpHuOPMMXlqXdx5tInau210ig?=
 =?us-ascii?Q?R4HWeJaAMdxUYU+Y+LUaOwT03xEgIVqSQbg59ZjtkVu/8CyMJirmzfG0NJVP?=
 =?us-ascii?Q?rbE/FKy/0MedVIkQBJ+IWDadfPi7jjjNRpPclFRDvz9V8LSqx6e7X/ThB+lo?=
 =?us-ascii?Q?BiS+NmOO/7egMxAZe1Ide5FE9KBscdo6qoS9VzykRaDiyeXAqUUqFNwzygrc?=
 =?us-ascii?Q?1PUzY5D9g6INPYeYetghhHEWXhWtV0EVpBVXeDUQ91QlAZh+qXVlB9F4tTHh?=
 =?us-ascii?Q?VG2flK2KsbibGKVDdJ1NnL1PXJZW9KrgkFasysbDWAl4vCjWcuIQdMuOpQwZ?=
 =?us-ascii?Q?HOv5MoarhdjlbTckwTj+9uQTVlZDhzo9dyS5+JKJ6Cxh1D9FyBfwOcRC7Arp?=
 =?us-ascii?Q?8lUPZX/TS7Vaj1Ig5o0B7FR9Y7eQ4Ary4rA8o1xqPE9YiVVBW1FlXwj10CG+?=
 =?us-ascii?Q?knd+l6iiew4VNiuzEe2NPQ4278I7hYWHxAiL6JZ0pFh7ROK6LBxYH939/U8n?=
 =?us-ascii?Q?sOts4ZLGqnhDKT97SUmi3DLpy5wiR54sNqJ+jopNiZwxNIRUJb7w?=
X-OriginatorOrg: siliconsignals.io
X-MS-Exchange-CrossTenant-Network-Message-Id: d1169a37-8abf-4f88-ea7f-08de4e7a83a2
X-MS-Exchange-CrossTenant-AuthSource: PN0P287MB2019.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 05:55:23.5964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7ec5089e-a433-4bd1-a638-82ee62e21d37
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6XsSWmjXqUKm8jjihLyRasJwMPEAPYnBpBVpktmDnQ+PxUQgHpOGpKXwA5l9dDJnRTQ2txHlE7PI88VBJ+jklkFkhQqhIi4z0Cq0PjwTdJHieT6VSEd+ni0xX5eHL0tP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYP287MB3599

Signed-off-by: Himanshu Bhavani <himanshu.bhavani@siliconsignals.io>
---
 drivers/media/i2c/os05b10.c | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/drivers/media/i2c/os05b10.c b/drivers/media/i2c/os05b10.c
index 5a457f01fe47..f1b03584b40b 100644
--- a/drivers/media/i2c/os05b10.c
+++ b/drivers/media/i2c/os05b10.c
@@ -708,7 +708,7 @@ static int os05b10_disable_streams(struct v4l2_subdev *sd,

 	pm_runtime_put(os05b10->dev);

-	return ret;
+	return 0;
 }

 static int os05b10_init_state(struct v4l2_subdev *sd,
@@ -884,17 +884,13 @@ static u64 os05b10_pixel_rate(struct os05b10 *os05b10,
 			      const struct os05b10_mode *mode)
 {
 	u64 link_freq = link_frequencies[os05b10->link_freq_index];
-	const unsigned int lanes = os05b10->data_lanes;
-	u64 numerator = link_freq * 2 * lanes;
-	unsigned int bpp = mode->bpp;
-
-	do_div(numerator, bpp);
+	u64 pixel_rate = div_u64(link_freq * 2 * os05b10->data_lanes, mode->bpp);

-	dev_info(os05b10->dev,
-		 "link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
-		 link_freq, bpp, lanes, numerator);
+	dev_dbg(os05b10->dev,
+		"link_freq=%llu bpp=%u lanes=%u pixel_rate=%llu\n",
+		link_freq, mode->bpp, os05b10->data_lanes, pixel_rate);

-	return numerator;
+	return pixel_rate;
 }

 static int os05b10_init_controls(struct os05b10 *os05b10)
@@ -977,7 +973,6 @@ static int os05b10_probe(struct i2c_client *client)
 {
 	struct os05b10 *os05b10;
 	unsigned int xclk_freq;
-	unsigned int i;
 	int ret;

 	os05b10 = devm_kzalloc(&client->dev, sizeof(*os05b10), GFP_KERNEL);
@@ -1005,7 +1000,7 @@ static int os05b10_probe(struct i2c_client *client)
 				     "xclk frequency not supported: %d Hz\n",
 				     xclk_freq);

-	for (i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)
+	for (unsigned int i = 0; i < ARRAY_SIZE(os05b10_supply_name); i++)
 		os05b10->supplies[i].supply = os05b10_supply_name[i];

 	ret = devm_regulator_bulk_get(os05b10->dev,
--
2.34.1

