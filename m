Return-Path: <linux-media+bounces-32370-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0006FAB4E4E
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 10:38:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A63DD1B40D63
	for <lists+linux-media@lfdr.de>; Tue, 13 May 2025 08:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6ED7E20E319;
	Tue, 13 May 2025 08:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="RMIb8f57"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022125.outbound.protection.outlook.com [40.107.161.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7F0820D4F2;
	Tue, 13 May 2025 08:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.125
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747125496; cv=fail; b=JhYbPVmB0cLcGIV8jKxi2ymxY4p2fQa9LeQq77mOeA/wjB+9ic3A0TXeDqg/EiA3Fg0FBUVGH5jOhCiThhTY7WlbjNWB/OMg5A2nFkct+SsUXR49F29CizUuR1M7ETpFkQKf9VBPwLwwi8R1zYBdRTem4N2bqKajnmeOCsoneDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747125496; c=relaxed/simple;
	bh=c0bZ/P+PhdGjp7lnU/c1+fYi26HJUrvFTtIgY+ohozA=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ch3zFGClymC4Khcmz2OdftjGIHEuYyagSPBZ1J+wXZ86DX6pPz3ZE84psX+yUvJy6vOWR8sTg+bC8CCyZ3U+mzJADwS7zDFsXpbJTHll1DxtXTqe9Ibn1XyNtNapcUv8Dr1N/mgJHo6mEaAOZqhgvYM/737FkTV7scevBmaEwkk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=RMIb8f57; arc=fail smtp.client-ip=40.107.161.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aC6b2FaFRuAw8Q/6ZI48+NDI8yq+tileZQfpylxIvWjo1ZIWkQ5lclcJRXQo/I1EjSWeQL6PyWClFw4Qu8s9A3bq2JMEoRJcoqMI4kdMMkfhi5S/f1+rEIiJRDnqKJcGjYN3iKKfiv+PQW9XoWst/SPsCtyVWDYdF8MCHws1pCxOeA1cXMTi66FenrV05sBdkD4B/W6q55DQxkFIi4+bYY6sfuAghd0VbOpit6K3lqNuG23s0i6xtZZ6wev77bGghC62k7diKwjjncKfJuyx8dxrkahzaHcDfEG/e+yFFASzFKslOc18QYt9lnGsMAGIDlrcI/GAWLvtSj7kBJ9FeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFp4Tjgjh3J0eFVJieataMIO42Vu7UY3SQcFrXhg248=;
 b=GN9n0cfIM295irTx+R+KPgWY3WsIrbdSuE9ctHhMJnP2sSO6HB95W4hcjeA2GOUeKHK6VxWPpaNcrEjKdDSS06/IE2+L+BYbKRXI/OXHxt6Y3/bKuCRLwZ6ADOvh1Ld5WCQVrgAtqlftSIa8g7Ae0Pg9GYb43htY28RjHCvdZ9mcl0J1a6iPaD+iFBcyvwnj4oCiDXG/xfUQKk5lRw3VHJU2lNzWB9d7/fformD39riFXZsTgFyYqen5xG/mUTjrbodG11i5seNPtJgJeZFD8SLoazFgzR3NC5We5c8Uq/BX9OoqUL7+51n8ScnI3AIMTCCkIiNY5Nbe8zVsp8qIMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFp4Tjgjh3J0eFVJieataMIO42Vu7UY3SQcFrXhg248=;
 b=RMIb8f57N+kx3nYM6KvDvm+RAeoI0uy1lZRCKqX/x3sjd0ay5l+hfponQkj92bxd+NAF4Ks2RFu+r7bTCs4MsK3yirvqRSg8+7NwnaiYrUmU79oIuE3qc35BeKt28NlUCdepIN3HcE1r4LnyFvzu9Uab/8vCDGQQTjhM7TBc+GunHiqMMa/XMLCwh0ZedPWvAkgyfR2VwX0uPML7r8dinYk9TuzmGt+NcgKp9+kMNoJYzGUwUotVdh24qN3msLYOSKI+Z4Z2Ec4IKYGV2+B4WDIA1jJUOF8oMxIy4u1MtRyc5UmmIqqpobXXUuMbQPAMvwblsvbsDq4MoKc20cXk5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by MR1P264MB1891.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:10::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.30; Tue, 13 May
 2025 08:38:07 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Tue, 13 May 2025
 08:38:07 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Junhao Xie <bigfoot@classfun.cn>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RESEND PATCH 5/5] media: allegro-dvt: Add Gen 3 IP stateful decoder driver
Date: Tue, 13 May 2025 10:35:50 +0200
Message-Id: <20250513083609.328422-6-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
References: <20250513083609.328422-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR1P264CA0059.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:2ca::14) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|MR1P264MB1891:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e19b79-d504-4869-1461-08dd91f97c51
X-LD-Processed: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|7416014|366016|4022899009|921020;
X-Microsoft-Antispam-Message-Info:
 =?us-ascii?Q?vGmCMuseozvl636dGDZkgpdW+ATUGG70a4yLG3xCLBoL8GVqY2PW3eIRKUdn?=
 =?us-ascii?Q?rtK7fg5+9ZCqMosuisLwn47/0qnMjgFnwGe26d4YeI9Yx0lRcEYawpLY7k5u?=
 =?us-ascii?Q?7BDH3hJ24R7JmnKQdNoUkbC8pA6Y0a67OcxZnFjOZVice5KqkcR+b+8mOADY?=
 =?us-ascii?Q?tpCyiE/JQBnpoS3Su20Ojg/mA01yqAvt34nctXJqYXM0MirdZ5RoArm4k70g?=
 =?us-ascii?Q?HdD+NvwEjsd8NDfrfJT1dhOj84FQor6wybp33cl+44WmBfbY52Ex+DVGMypn?=
 =?us-ascii?Q?JCozH3WDO06c/M1gWFiO1xgYbhwlhMl43mSu52xAqF8iWvUPPgv5b7CsrFTY?=
 =?us-ascii?Q?54S5Qn1uQpv1flfFgbtpazWXt1ExLX4nEDlgQ7nnjywFBj1ThffkhV+avrVx?=
 =?us-ascii?Q?rPyqGQ7claS7KDj+2h7b34yNzhB8BH/MMB2ZaQdAtn/foKcn6FiGRR5qZThB?=
 =?us-ascii?Q?4He84J0E1hhzO8RZXCMIy89M/tZFdBAN/o8p7wKbycOvOAFDwT3i8bmH4cIm?=
 =?us-ascii?Q?2td7valeXSr1HU3qKzhqFQkLQq2XtM1/qq6oN9AteMVKUe1ToCGpznzdxXMn?=
 =?us-ascii?Q?Cb/+oZge9kJ8XmlqhL+t2THeY+okqd+BEWvAkeJHEzDj8f22KxXQe99NY3/d?=
 =?us-ascii?Q?E/O8MDlui+6QkdGglErLkwNtldaoKXTabcB1tizsWq8a07DAgTO5T/wn3XNa?=
 =?us-ascii?Q?TX7OzFYHnlEvQOe8h4KAKFrDO/y1NhI2LPillTp2PUsnfrEvMioSkzeOil8f?=
 =?us-ascii?Q?vKSMW29E1wvZvphfGQiIk4R9edMXT/ofL8i8L+TQuC7geGQHsa8DB7xCnoey?=
 =?us-ascii?Q?ESiADDDI7Q0M7phzcc6E4a4XnFNZXbV/Hb4GI+2ejLaB1qou5sOrlZH/pL4K?=
 =?us-ascii?Q?c+aFl1bt+pFqptAETjzn+/QLPkcPgLNxiPmEiXJEQ93aZ79mffo4t6Grck5i?=
 =?us-ascii?Q?Mxm94pNQv8QEOjPTuU7qhQ1gObRNkN57H/HijLrUpRf3FgdnP3RhbzSv1Z/X?=
 =?us-ascii?Q?jR1CF2dqelsJvcQfTwkTzFDYnWplm5x5Q/tPpINRxr4Dc1zZ1CdSYNEStAnS?=
 =?us-ascii?Q?v/3iuCllp6RI7EBIkoe5zznqsi+qb1WV9sIAwfxbMqSklYdzT3NPavVKSnJp?=
 =?us-ascii?Q?WoC3wNR1lDIIF1GDNwZsPC3didoRgBz49izstbS7J+PaB77Jq5LW/lM/FsFc?=
 =?us-ascii?Q?lI46GBn0V2z+xegx+qycBx05SI8b/SFjMUdFBHTCAu1gZ6YfaJERVqEbPNFv?=
 =?us-ascii?Q?vzd8iVBchpS09oYAyvpKiwUzNsZ08s4R/Gj/Oe49oMVtEPVXgP9sZuGrGEBF?=
 =?us-ascii?Q?6LOjSOGcbl4hfG/oZicVZsjWWfcg3xghEnzrFs2xyEZX3vTSk5HTvU+O9YVh?=
 =?us-ascii?Q?6jR9wHpcZd1UzOE5fyMQI+Bl/u+80iDMS/mQiXMFm7If3PBasIT4UhI5S5z/?=
 =?us-ascii?Q?/ptldIEMhGgrqUvazhD5M5Nxuz1yv1gbEQhbE5zQrwVmQ4XM05ljpA=3D=3D?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(4022899009)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?us-ascii?Q?DknvhjvrRJd6yaroiusZ6ZM3r8mzaFbQ5vY1iLYa1Fd76ZZbocuxwL4DAyTC?=
 =?us-ascii?Q?kSqNrDyboeDTTlHMC1i3qNQ+2K5DK4gBd7ANChSJ2rX8U9Xs7/H/MEqrPLVh?=
 =?us-ascii?Q?xiRGaBVFi5C4GVLikzdh6M8zTS0BONNFunM1kzrHX8kbEB6MTvq5XZVM7PDZ?=
 =?us-ascii?Q?52piL2wrbeeCdVGiu8+dyQWIPPHWBFJiutTsUVh12KljPGv5Bg34zPl9Ssuo?=
 =?us-ascii?Q?ZXSQaS4RwVQjGhFIgT44SxXm3996Lq/P00bByC5PJ+AZUg2PBk9MEt9oo7N5?=
 =?us-ascii?Q?TIvttGlQ87CDwvhdK3YXx5WuVyoqk0O2A8zDenjqaztCswZochSZrna+7Mki?=
 =?us-ascii?Q?4IkLEr093c2BM+83GHiiZ8Hmo/xugO3QnsomgN7vjmUX1yl6T1e1cvSAoUqr?=
 =?us-ascii?Q?zhmSCT2kRLe92ScQwK2DM/VWHF9BhsxMtLi3hsl+OFrTlgpI6qz8bldjIOMY?=
 =?us-ascii?Q?yDh1sFs50tqlEjm1UgkHs9yPcU4Ujc/3xArd2WpWnKvLlmnmzumdzoI4d5Z3?=
 =?us-ascii?Q?bbEc+XgtYnOIZd+OfH6iNmO1yyicPCStucHn8Ugk/ku4028lyjDGZQDfwZLl?=
 =?us-ascii?Q?e3snP/Om1My6jSkrvWgRDKvkTgoS8JLqQZ9S40IuCJLMahueth0+Rute9mHz?=
 =?us-ascii?Q?2Rh7KxaDXMRcO88f+WMKk9FuSBrly/FfLLByZHH6cp0IKcEJzg3Du0VPldyN?=
 =?us-ascii?Q?81qxyHNuMLP/b3b/gj16ZVMMmyDj6QOPlOBqNpDH1xnw7pOmDvG0YqFObJJ/?=
 =?us-ascii?Q?Lf7Az4k/A6C18/+RwoacuBW1PnVzuS0Hlb3LBEZhaHfUxRekcYA4POtJWv7a?=
 =?us-ascii?Q?AQa43kU9UtsN0t4kZ8y8qvm6aYckeVNzdwfrwucYSUsKouDtqXkizlxnRel3?=
 =?us-ascii?Q?ve7VMxOPfg1FnHxH3yOcDPzrcKSR72EO/zwwFCmiC+DN0nUkOUwwLi2/iKBl?=
 =?us-ascii?Q?LDavcSYFjSGDdoSWS6bc9xF5O0u7T919wTNIj7OlQ2TqDHbsnMlHugHBNoxb?=
 =?us-ascii?Q?3QNN1nkfR59/PkzMkLqK6sTg8Dl769+Y72vsfH7nVVWg3ZF4yt7WgMpiiwmS?=
 =?us-ascii?Q?Qn9LPEPzdQR1WVbGxiON6i9dpPuLkBg8k6pcYegmOOS7OOMUq81VuBSLF3C3?=
 =?us-ascii?Q?5qpO9TRh8LeFGm4Kdo0ZeBy0yRWlC+3IR5aJUJdtW1roNUGw4omoQc7MJq4f?=
 =?us-ascii?Q?IeYhdcdmERq/I0o9KRfhDgfain33eUPQMwsu+l7u2vVOL1jd/66zMEuZ5DWM?=
 =?us-ascii?Q?1WRAKnnOa9kaWK//y3/QOu/s6jqLBN0KyyqphozWZJblX6equRzCoKO0j0ba?=
 =?us-ascii?Q?1fTMXzOFKSHVsxTmN+SfjlG5XkXdqO6YDVhwrfp7WmlFq0zdNP0sXzqWbfPt?=
 =?us-ascii?Q?X5HJ8bonZIpwMqxp7VsliqoKoUIh2KhwokxPDE0wg1YBL2b2+SV0ltpg6U+2?=
 =?us-ascii?Q?ntPUQNICIhOvewLWpbIJMekIOits6uAyJEkjhTAbSQpy2RAcxzM1Dpr7eID3?=
 =?us-ascii?Q?Krnpr/QCR7V8zahYjaRzzw83x7Y0BpjUAwOPhFSXnXaqigqEVT253e6Vh3zu?=
 =?us-ascii?Q?lpr0Wr+5M7uYeD7ceHIt3eQakgao9u9lzIQmZzYp3xBJMBe8WL/OPCQOeTl+?=
 =?us-ascii?Q?Jg=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e19b79-d504-4869-1461-08dd91f97c51
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2025 08:38:07.6862
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CX4ObXmOsqq5xetOpWRTnSIpjPF8Bpog1r1Lk+asF5Lp27YuT3ITMeXBuwIU7uXJ2MAQtgM9gmspEQh+teh1Uz84KokhpJSC5pSnkqWdbAw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MR1P264MB1891

This commit introduces a new allegro-dvt V4L2 stateful decoder driver
for the Gen 3 IP with support for:
 - AVC (H.264), HEVC (H.265), and JPEG decoding
 - Output formats: NV12, NV16, I420, and P010 for capture

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 drivers/media/platform/allegro-dvt/Kconfig    |    1 +
 drivers/media/platform/allegro-dvt/Makefile   |    1 +
 .../media/platform/allegro-dvt/al300/Kconfig  |   12 +
 .../media/platform/allegro-dvt/al300/Makefile |    6 +
 .../allegro-dvt/al300/al_codec_common.c       |  789 +++++++++
 .../allegro-dvt/al300/al_codec_common.h       |  226 +++
 .../allegro-dvt/al300/al_codec_util.c         |  179 ++
 .../allegro-dvt/al300/al_codec_util.h         |  186 ++
 .../platform/allegro-dvt/al300/al_vdec_drv.c  | 1533 +++++++++++++++++
 .../platform/allegro-dvt/al300/al_vdec_drv.h  |   94 +
 10 files changed, 3027 insertions(+)
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Makefile
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h

diff --git a/drivers/media/platform/allegro-dvt/Kconfig b/drivers/media/platform/allegro-dvt/Kconfig
index e9008614c27b..0d01ed0ad08a 100644
--- a/drivers/media/platform/allegro-dvt/Kconfig
+++ b/drivers/media/platform/allegro-dvt/Kconfig
@@ -2,4 +2,5 @@
 
 comment "Allegro DVT media platform drivers"
 
+source "drivers/media/platform/allegro-dvt/al300/Kconfig"
 source "drivers/media/platform/allegro-dvt/zynqmp/Kconfig"
diff --git a/drivers/media/platform/allegro-dvt/Makefile b/drivers/media/platform/allegro-dvt/Makefile
index d2aa6875edcf..c70ca19a47fb 100644
--- a/drivers/media/platform/allegro-dvt/Makefile
+++ b/drivers/media/platform/allegro-dvt/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 
+obj-y += al300/
 obj-y += zynqmp/
diff --git a/drivers/media/platform/allegro-dvt/al300/Kconfig b/drivers/media/platform/allegro-dvt/al300/Kconfig
new file mode 100644
index 000000000000..74bafb286250
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/Kconfig
@@ -0,0 +1,12 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+config VIDEO_ALLEGRO_DVT_D300
+	tristate "Allegro DVT Video IP Decode Gen 3"
+	depends on V4L_MEM2MEM_DRIVERS
+	depends on VIDEO_DEV && OF && HAS_DMA
+	select V4L2_MEM2MEM_DEV
+	select VIDEOBUF2_DMA_CONTIG
+	select REGMAP_MMIO
+	help
+	  This is a video4linux2 driver for the Allegro DVT IP Decode Gen 3,
+	  that support codecs : AVC (H.264), HEVC (H.265), and JPEG.
diff --git a/drivers/media/platform/allegro-dvt/al300/Makefile b/drivers/media/platform/allegro-dvt/al300/Makefile
new file mode 100644
index 000000000000..3c50caccb731
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0
+
+al300-vdec-objs := al_codec_common.o al_codec_util.o
+al300-vdec-objs += al_vdec_drv.o
+
+obj-$(CONFIG_VIDEO_ALLEGRO_DVT_D300) += al300-vdec.o
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.c b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
new file mode 100644
index 000000000000..8c0700dd8abf
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.c
@@ -0,0 +1,789 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Core MCU functionality including firmware loading,
+ * memory allocation, and general MCU interaction interfaces
+ *
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+#include <linux/clk.h>
+#include <linux/dma-mapping.h>
+#include <linux/firmware.h>
+#include <linux/interrupt.h>
+#include <linux/of_reserved_mem.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+#include "al_codec_common.h"
+
+#define AL_CODEC_UID 0x0000
+#define AL_CODEC_UID_ID 0x30AB6E51
+#define AL_CODEC_RESET 0x0010
+#define AL_CODEC_RESET_CMD BIT(0)
+#define AL_CODEC_COMM_MASK BIT(0)
+#define AL_CODEC_IRQ_MASK 0x0014
+#define AL_CODEC_IRQ_STATUS_CLEAR 0x0018
+#define AL_CODEC_IRQ_MCU_2_CPU BIT(30)
+#define AL_CODEC_MCU_CLK 0x0400
+#define AL_CODEC_MCU_CLK_ENABLE BIT(0)
+#define AL_CODEC_MCU_CLK_DISABLE 0
+#define AL_CODEC_MCU_RST 0x0404
+#define AL_CODEC_MCU_RST_ENABLE BIT(0)
+#define AL_CODEC_MCU_RST_DISABLE 0
+#define AL_CODEC_MCU_IRQ 0x040C
+#define AL_CODEC_MCU_BOOT_ADDR 0x0410
+#define AL_CODEC_MCU_APB_ADDR 0x0418
+#define AL_CODEC_MCU_PERIPHERAL_ADDR 0x0428
+#define AL_CODEC_MCU_IP_INTERRUPT_MASK 0x0440
+#define AL_CODEC_INSTRUCTION_DATA_OFFSET 0x0450
+#define AL_CODEC_IP_OFFSET GENMASK(26, 25)
+#define AL_CODEC_APB_MASK GENMASK(26, 0)
+#define AL_CODEC_MAX_ADDR GENMASK_ULL(38, 0)
+
+#define AL_CODEC_MCU_BOOT_RESET_WAIT 2 /* in ms */
+
+/*
+ * struct codec_dma_buf - Allocated dma buffer
+ *
+ * @list: list head for buffer queue
+ * @paddr: physical address of the allcated DMA buffer
+ * @vaddr: virtual address of the allocated DMA buffer
+ * @size: Size of allocated dma memory
+ */
+struct codec_dma_buf {
+	void *vaddr;
+	dma_addr_t paddr;
+	u32 size;
+	struct list_head list;
+};
+
+struct mb_header {
+	u64 start;
+	u64 end;
+} __packed;
+
+struct boot_header {
+	u32 bh_version;
+	u32 fw_version;
+	char model[16];
+	u64 vaddr_start;
+	u64 vaddr_end;
+	u64 vaddr_boot;
+	struct mb_header h2m;
+	struct mb_header m2h;
+	u64 machine_id;
+	/* fill by driver before fw boot */
+	u64 ip_start;
+	u64 ip_end;
+	u64 mcu_clk_rate;
+} __packed;
+
+/* Regmap config */
+static const struct regmap_config al_regmap_config = {
+	.name = "regs",
+	.reg_bits = 32,
+	.val_bits = 32,
+	.reg_stride = 4,
+	.max_register = 0xfff,
+	.fast_io = true,
+	.cache_type = REGCACHE_NONE,
+	.can_multi_write = true,
+};
+
+static inline int al_common_read(struct al_common_dev *dev, u32 offset,
+				 u32 *val)
+{
+	return regmap_read(dev->regmap, offset, val);
+}
+
+static inline int al_common_write(struct al_common_dev *dev, u32 offset,
+				  u32 val)
+{
+	return regmap_write(dev->regmap, offset, val);
+}
+
+static inline int al_common_write_multiple(struct al_common_dev *dev,
+					   u32 offset, const void *val,
+					   u32 num_regs)
+{
+	return regmap_bulk_write(dev->regmap, offset, val, num_regs);
+}
+
+static inline int common_update_bits(struct al_common_dev *dev, u32 offset,
+				     u32 mask, u32 val)
+{
+	return regmap_update_bits(dev->regmap, offset, mask, val);
+}
+
+static void common_trigger_mcu_irq(void *arg)
+{
+	struct al_common_dev *dev = arg;
+
+	common_update_bits(dev, AL_CODEC_MCU_IRQ, AL_CODEC_COMM_MASK, BIT(0));
+}
+
+static void common_reset(struct al_common_dev *dev)
+{
+	/* reset ip */
+	common_update_bits(dev, AL_CODEC_RESET, AL_CODEC_COMM_MASK,
+			   AL_CODEC_RESET_CMD);
+
+	/* reset and stop mcu */
+	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_MCU_CLK_ENABLE);
+	al_common_write(dev, AL_CODEC_MCU_RST, AL_CODEC_MCU_RST_ENABLE);
+	/* time to reset the mct */
+	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT);
+	al_common_write(dev, AL_CODEC_MCU_CLK, AL_CODEC_MCU_CLK_DISABLE);
+
+	common_update_bits(dev, AL_CODEC_MCU_IRQ, AL_CODEC_COMM_MASK, 0);
+	al_common_write(dev, AL_CODEC_MCU_IP_INTERRUPT_MASK, 0);
+
+	mdelay(AL_CODEC_MCU_BOOT_RESET_WAIT * 5);
+	common_update_bits(dev, AL_CODEC_MCU_RST, AL_CODEC_COMM_MASK,
+			   AL_CODEC_MCU_RST_DISABLE);
+}
+
+static int common_probe_check_and_setup_hw(struct al_common_dev *dev)
+{
+	unsigned int id;
+	int ret;
+
+	/* Check regmap */
+	if (WARN_ON(!dev->regmap))
+		return -EINVAL;
+
+	ret = al_common_read(dev, AL_CODEC_UID, &id);
+
+	if (ret)
+		return ret;
+
+	if (id != AL_CODEC_UID_ID) {
+		al_codec_err(dev, "bad device id, expected 0x%08x, got 0x%08x",
+			     AL_CODEC_UID_ID, id);
+		return -ENODEV;
+	}
+
+	common_reset(dev);
+	al_common_write(dev, AL_CODEC_IRQ_MASK, AL_CODEC_IRQ_MCU_2_CPU);
+
+	return 0;
+}
+
+static void common_dma_buf_insert(struct al_common_dev *dev,
+				  struct codec_dma_buf *buf)
+{
+	mutex_lock(&dev->buf_lock);
+	list_add(&buf->list, &dev->alloc_buffers);
+	mutex_unlock(&dev->buf_lock);
+}
+
+static void common_dma_buf_remove(struct al_common_dev *dev,
+				  struct codec_dma_buf *buf)
+{
+	mutex_lock(&dev->buf_lock);
+	list_del(&buf->list);
+	mutex_unlock(&dev->buf_lock);
+}
+
+static struct codec_dma_buf *common_dma_buf_lookup(struct al_common_dev *dev,
+						   dma_addr_t buf_paddr)
+{
+	struct codec_dma_buf *buf = NULL;
+
+	mutex_lock(&dev->buf_lock);
+	list_for_each_entry(buf, &dev->alloc_buffers, list)
+		if (likely(buf->paddr == buf_paddr))
+			break;
+
+	mutex_unlock(&dev->buf_lock);
+
+	return list_entry_is_head(buf, &dev->alloc_buffers, list) ? NULL : buf;
+}
+
+static void common_dma_buf_cleanup(struct al_common_dev *dev)
+{
+	struct codec_dma_buf *buf, *tmp;
+
+	mutex_lock(&dev->buf_lock);
+	list_for_each_entry_safe(buf, tmp, &dev->alloc_buffers, list) {
+		dma_free_coherent(&dev->pdev->dev, buf->size, buf->vaddr,
+				  buf->paddr);
+		list_del(&buf->list);
+		kfree(buf);
+	}
+	mutex_unlock(&dev->buf_lock);
+}
+
+static void *common_dma_alloc(struct al_common_dev *dev, size_t size,
+			      dma_addr_t *paddr, gfp_t flag)
+{
+	void *vaddr;
+
+	vaddr = dma_alloc_coherent(&dev->pdev->dev, size, paddr, flag);
+
+	if (!vaddr)
+		return NULL;
+
+	/* PADDR <= (2^39 - 1) (39-bit MCU PADDR) */
+	if ((*paddr + size) > AL_CODEC_MAX_ADDR) {
+		al_codec_err(dev, "mem check failed for 0x%16llx of size %zu",
+			     *paddr, size);
+		dma_free_coherent(&dev->pdev->dev, size, vaddr, *paddr);
+		return NULL;
+	}
+
+	return vaddr;
+}
+
+void al_common_remove(struct al_common_dev *dev)
+{
+	common_dma_buf_cleanup(dev);
+	if (dev->fw_cpu_mem)
+		dma_free_coherent(&dev->pdev->dev, dev->fw_size,
+				  dev->fw_cpu_mem, dev->fw_phys_addr);
+
+	/* reset device */
+	common_reset(dev);
+	clk_disable_unprepare(dev->mcu_clk);
+}
+
+static void handle_alloc_memory_req(struct al_common_dev *dev,
+				    struct msg_itf_header *hdr)
+{
+	struct msg_itf_alloc_mem_reply_full reply;
+	struct msg_itf_alloc_mem_req req;
+	struct codec_dma_buf *buf;
+	int ret;
+
+	reply.reply.phyAddr = 0;
+	ret = al_common_get_data(dev, (char *)&req, hdr->payload_len);
+	if (ret) {
+		al_codec_err(dev, "Unable to get cma req");
+		return;
+	}
+
+	buf = kmalloc(sizeof(*buf), GFP_KERNEL);
+	if (!buf)
+		goto send_reply;
+
+	buf->size = req.uSize;
+	buf->vaddr = common_dma_alloc(dev, req.uSize, &buf->paddr, GFP_KERNEL);
+	if (!buf->vaddr)
+		goto send_reply;
+
+	reply.reply.phyAddr = (u64)buf->paddr;
+	common_dma_buf_insert(dev, buf);
+
+send_reply:
+	reply.hdr.type = MSG_ITF_TYPE_ALLOC_MEM_REPLY;
+	/* both fields embed info need to finish request */
+	reply.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl;
+	reply.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl;
+	reply.hdr.payload_len = sizeof(reply.reply);
+
+	ret = al_common_send(dev, &reply.hdr);
+	if (ret) {
+		al_codec_err(dev, "Unable to reply to cma alloc");
+		common_dma_buf_remove(dev, buf);
+	}
+}
+
+static void handle_free_memory_req(struct al_common_dev *dev,
+				   struct msg_itf_header *hdr)
+{
+	struct msg_itf_free_mem_reply_full reply;
+	struct msg_itf_free_mem_req req;
+	struct codec_dma_buf *buf;
+	int ret;
+
+	reply.reply.ret = -1;
+	ret = al_common_get_data(dev, (char *)&req, hdr->payload_len);
+	if (ret) {
+		al_codec_err(dev, "Unable to put cma req");
+		return;
+	}
+
+	buf = common_dma_buf_lookup(dev, req.phyAddr);
+	al_codec_dbg(3, "req.phyAddr = %p => %p, Size %d",
+		     (void *)(long)req.phyAddr, buf, buf->size);
+	if (!buf) {
+		al_codec_err(dev, "Unable to get dma handle for %p",
+			     (void *)(long)req.phyAddr);
+		reply.reply.ret = -EINVAL;
+		goto send_reply;
+	}
+
+	dma_free_coherent(&dev->pdev->dev, buf->size, buf->vaddr, buf->paddr);
+	common_dma_buf_remove(dev, buf);
+	reply.reply.ret = 0;
+
+send_reply:
+	reply.hdr.type = MSG_ITF_TYPE_FREE_MEM_REPLY;
+	/* both fields embed info need to hinish request */
+	reply.hdr.drv_ctx_hdl = hdr->drv_ctx_hdl;
+	reply.hdr.drv_cmd_hdl = hdr->drv_cmd_hdl;
+	reply.hdr.payload_len = sizeof(reply.reply);
+
+	ret = al_common_send(dev, &reply.hdr);
+	if (ret)
+		al_codec_err(dev, "Unable to reply to cma free");
+}
+
+static void handle_mcu_console_print(struct al_common_dev *dev,
+				     struct msg_itf_header *hdr)
+{
+#if defined(DEBUG)
+	struct msg_itf_write_req *req;
+	int ret;
+
+	/* one more byte to be sure to have a zero terminated string */
+	req = kzalloc(hdr->payload_len + 1, GFP_KERNEL);
+	if (!req) {
+		al_common_skip_data(dev, hdr->payload_len);
+		al_codec_err(dev, "Unable to alloc memory");
+		return;
+	}
+
+	ret = al_codec_msg_get_data(&dev->mb_m2h, (char *)req,
+				    hdr->payload_len);
+	if (ret) {
+		al_codec_err(dev, "Unable to get request");
+		kfree(req);
+		return;
+	}
+
+	al_mcu_dbg("%s", (char *)(req + 1));
+	kfree(req);
+#else
+	al_common_skip_data(dev, hdr->payload_len);
+#endif
+}
+
+static void process_one_message(struct al_common_dev *dev,
+				struct msg_itf_header *hdr)
+{
+	if (hdr->type == MSG_ITF_TYPE_ALLOC_MEM_REQ)
+		handle_alloc_memory_req(dev, hdr);
+	else if (hdr->type == MSG_ITF_TYPE_FREE_MEM_REQ)
+		handle_free_memory_req(dev, hdr);
+	else if (hdr->type == MSG_ITF_TYPE_WRITE_REQ)
+		handle_mcu_console_print(dev, hdr);
+	else if (hdr->type == MSG_ITF_TYPE_MCU_ALIVE)
+		complete(&dev->completion);
+	else
+		dev->process_msg_cb(dev->cb_arg, hdr);
+}
+
+static void common_reply_handle(struct al_common_dev *dev)
+{
+	struct msg_itf_header hdr;
+	int ret;
+
+	while (1) {
+		ret = al_codec_msg_get_header(&dev->mb_m2h, &hdr);
+		if (ret)
+			break;
+
+		process_one_message(dev, &hdr);
+	}
+}
+
+static irqreturn_t common_irq_handler(int irq, void *data)
+{
+	struct al_common_dev *dev = data;
+
+	/* poll all messages */
+	common_reply_handle(dev);
+
+	return IRQ_HANDLED;
+}
+
+static irqreturn_t common_hardirq_handler(int irq, void *data)
+{
+	struct al_common_dev *dev = data;
+	u32 irq_status;
+	int ret;
+
+	ret = al_common_read(dev, AL_CODEC_IRQ_STATUS_CLEAR, &irq_status);
+	if (ret || !irq_status)
+		return IRQ_NONE;
+
+	al_common_write(dev, AL_CODEC_IRQ_STATUS_CLEAR, AL_CODEC_IRQ_MCU_2_CPU);
+
+	return IRQ_WAKE_THREAD;
+}
+
+static inline u64 get_machine_boot_addr(struct al_common_dev *dev,
+					struct boot_header *bh)
+{
+	return dev->fw_phys_addr + bh->vaddr_boot - bh->vaddr_start;
+}
+
+static int common_start_fw(struct al_common_dev *dev, struct boot_header *bh)
+{
+	u64 boot_addr;
+	u32 regbuf[2] = { 0 };
+	int ret;
+
+	boot_addr = get_machine_boot_addr(dev, bh);
+	regbuf[0] = upper_32_bits(boot_addr);
+	regbuf[1] = lower_32_bits(boot_addr);
+
+	ret = al_common_write_multiple(dev, AL_CODEC_MCU_BOOT_ADDR, regbuf,
+				       ARRAY_SIZE(regbuf));
+	if (ret) {
+		al_codec_err(dev, "Unable to set the MCU boot address");
+		return ret;
+	}
+
+	al_codec_dbg(3, "boot_addr = %pad\n", &boot_addr);
+
+	/* Enable the MCU clock */
+	ret = common_update_bits(dev, AL_CODEC_MCU_CLK, AL_CODEC_COMM_MASK,
+				 AL_CODEC_MCU_CLK_ENABLE);
+
+	if (ret) {
+		al_codec_err(dev, " failed to enable the MCU clock");
+		return ret;
+	}
+
+	return !wait_for_completion_timeout(&dev->completion, HZ);
+}
+
+static inline u64 common_get_periph_addr(struct al_common_dev *dev)
+{
+	struct resource *res;
+
+	res = platform_get_resource_byname(dev->pdev, IORESOURCE_MEM, "apb");
+	if (!res) {
+		al_codec_err(dev, "Unable to find APB start address");
+		return 0;
+	}
+
+	if (res->start & AL_CODEC_APB_MASK) {
+		al_codec_err(dev, "APB start address is invalid");
+		return 0;
+	}
+
+	return res->start;
+}
+
+static int common_alloc_and_setup_fw_memory(struct al_common_dev *dev,
+					    struct boot_header *bh)
+{
+	u64 periph_addr;
+	u32 regbuf[4] = { 0 };
+	int ret;
+
+	dev->fw_cpu_mem = common_dma_alloc(dev, dev->fw_size,
+					   &dev->fw_phys_addr, GFP_KERNEL);
+	if (!dev->fw_cpu_mem)
+		return -ENOMEM;
+
+	ret = al_common_write_multiple(dev, AL_CODEC_INSTRUCTION_DATA_OFFSET,
+				       regbuf, ARRAY_SIZE(regbuf));
+	if (ret) {
+		al_codec_err(dev, "failed to set the (i/d)Cache address");
+		return ret;
+	}
+
+	periph_addr = common_get_periph_addr(dev);
+
+	regbuf[0] = upper_32_bits(periph_addr);
+	regbuf[1] = lower_32_bits(periph_addr);
+	ret = al_common_write_multiple(dev, AL_CODEC_MCU_PERIPHERAL_ADDR,
+				       regbuf, 2);
+	if (ret) {
+		al_codec_err(dev, "failed to set the periph address");
+		return ret;
+	}
+
+	al_codec_dbg(3, "fw phys_addr = %pad", &dev->fw_phys_addr);
+	al_codec_dbg(3, "fw virt_addr = 0x%p", dev->fw_cpu_mem);
+	al_codec_dbg(3, "periph_addr  = %pad", &periph_addr);
+
+	return 0;
+}
+
+static void common_fw_callback(const struct firmware *fw, void *context)
+{
+	struct al_common_dev *dev = context;
+	struct boot_header bh, *bhw;
+	u64 periph_addr = 0;
+	int ret;
+
+	if (!fw) {
+		al_codec_err(dev, "The MCU firmware not found!");
+		return;
+	}
+
+	/* Copy the Firmware header */
+	memcpy(&bh, fw->data, sizeof(bh));
+	dev->fw_size = bh.vaddr_end - bh.vaddr_start;
+
+	if (bh.bh_version < AL_BOOT_VERSION(2, 0, 0) ||
+	    bh.bh_version >= AL_BOOT_VERSION(3, 0, 0)) {
+		al_codec_err(dev, "bad boot header version");
+		goto fw_release;
+	}
+
+	if (WARN(bh.machine_id != 2, "Wrong machine ID"))
+		goto fw_release;
+
+	periph_addr = common_get_periph_addr(dev);
+
+	if (!periph_addr) {
+		al_codec_err(dev, "Unable to get the periph addr");
+		goto fw_release;
+	}
+
+	al_codec_dbg(3, "bh version     = 0x%08x", bh.bh_version);
+	al_codec_dbg(3, "fw version     = 0x%08x", bh.fw_version);
+	al_codec_dbg(3, "fw model       = %s", bh.model);
+	al_codec_dbg(3, "vaddress start = 0x%016llx", bh.vaddr_start);
+	al_codec_dbg(3, "vaddress end   = 0x%016llx", bh.vaddr_end);
+	al_codec_dbg(3, "boot address   = 0x%016llx", bh.vaddr_boot);
+	al_codec_dbg(3, "machineid      = %lld", bh.machine_id);
+	al_codec_dbg(3, "periph address = 0x%016llx", periph_addr);
+
+	ret = common_alloc_and_setup_fw_memory(dev, &bh);
+	if (ret) {
+		al_codec_err(dev, "out of memory %d", ret);
+		goto fw_release;
+	}
+
+	al_codec_dbg(2, "Copy %zu bytes of fw", fw->size);
+	memcpy(dev->fw_cpu_mem, fw->data, fw->size);
+
+	al_codec_mb_init(&dev->mb_h2m,
+			 dev->fw_cpu_mem + bh.h2m.start - bh.vaddr_start,
+			 bh.h2m.end - bh.h2m.start, MB_IFT_MAGIC_H2M);
+	al_codec_mb_init(&dev->mb_m2h,
+			 dev->fw_cpu_mem + bh.m2h.start - bh.vaddr_start,
+			 bh.m2h.end - bh.m2h.start, MB_IFT_MAGIC_M2H);
+
+	/* give fw information about registers location */
+	bhw = dev->fw_cpu_mem;
+	bhw->ip_start = periph_addr + AL_CODEC_IP_OFFSET;
+	bhw->ip_end = bhw->ip_start + resource_size(&dev->regs_info);
+	bhw->mcu_clk_rate = clk_get_rate(dev->mcu_clk);
+
+	al_codec_dbg(3, "ip start     = 0x%016llx", bhw->ip_start);
+	al_codec_dbg(3, "ip end       =   0x%016llx", bhw->ip_end);
+	al_codec_dbg(3, "mcu clock rate is %llu", bhw->mcu_clk_rate);
+
+	ret = common_start_fw(dev, &bh);
+	if (ret) {
+		al_codec_err(dev, "fw start has failed");
+		goto fw_release;
+	}
+
+	dev_info(&dev->pdev->dev, "mcu has boot successfully !\n");
+	dev->fw_ready_cb(dev->cb_arg);
+
+fw_release:
+	release_firmware(fw);
+}
+
+static int common_firmware_request_nowait(struct al_common_dev *dev)
+{
+	al_codec_dbg(2, "request fw %s", dev->fw_name);
+
+	return request_firmware_nowait(THIS_MODULE, true, dev->fw_name,
+				       &dev->pdev->dev, GFP_KERNEL, dev,
+				       common_fw_callback);
+}
+
+static int common_setup_dma(struct al_common_dev *dev)
+{
+	int ret;
+
+	/* setup dma memory mask */
+	ret = dma_set_mask_and_coherent(&dev->pdev->dev, DMA_BIT_MASK(64));
+	if (ret) {
+		al_codec_err(dev, "failed to set dma");
+		return -EINVAL;
+	}
+
+	/* Try to use reserved memory if we got one */
+	ret = of_reserved_mem_device_init(&dev->pdev->dev);
+	if (ret && ret != ENODEV)
+		dev_warn(&dev->pdev->dev,
+			 "No reserved memory, use cma instead\n");
+
+	return 0;
+}
+
+int al_common_probe(struct platform_device *pdev, struct al_common_dev *dev)
+{
+	struct resource *res;
+	void __iomem *regs;
+	int irq;
+	int ret;
+
+	dev->pdev = pdev;
+	mutex_init(&dev->buf_lock);
+	INIT_LIST_HEAD(&dev->alloc_buffers);
+	init_completion(&dev->completion);
+
+	/* The MCU has already default clock value */
+	dev->mcu_clk = devm_clk_get(&pdev->dev, "mcu_clk");
+	if (IS_ERR(dev->mcu_clk)) {
+		al_codec_err(dev, "failed to get MCU core clock");
+		return PTR_ERR(dev->mcu_clk);
+	}
+
+	ret = clk_prepare_enable(dev->mcu_clk);
+	if (ret) {
+		al_codec_err(dev, "Cannot enable MCU clock: %d\n", ret);
+		return ret;
+	}
+
+	/* setup dma memory */
+	ret = common_setup_dma(dev);
+	if (ret)
+		goto disable_clk;
+
+	/* Hw registers */
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
+	if (!res) {
+		al_codec_err(dev, "regs resource missing from device tree");
+		ret = -EINVAL;
+		goto disable_clk;
+	}
+
+	dev->regs_info = *res;
+
+	regs = devm_ioremap_resource(&pdev->dev, res);
+	if (!regs) {
+		al_codec_err(dev, "failed to map registers");
+		ret = -ENOMEM;
+		goto disable_clk;
+	}
+
+	dev->regmap =
+		devm_regmap_init_mmio(&pdev->dev, regs, &al_regmap_config);
+
+	if (IS_ERR(dev->regmap)) {
+		al_codec_err(dev, "init regmap failed");
+		ret = PTR_ERR(dev->regmap);
+		goto disable_clk;
+	}
+
+	irq = platform_get_irq(pdev, 0);
+	if (irq < 0) {
+		al_codec_err(dev, "Failed to get IRQ");
+		ret = -EINVAL;
+		goto disable_clk;
+	}
+
+	ret = devm_request_threaded_irq(&pdev->dev, irq, common_hardirq_handler,
+					common_irq_handler, IRQF_SHARED,
+					dev_name(&pdev->dev), dev);
+	if (ret) {
+		al_codec_err(dev, "Unable to register irq handler");
+		goto disable_clk;
+	}
+
+	ret = common_probe_check_and_setup_hw(dev);
+	if (ret) {
+		al_codec_err(dev, "Unable to setup hw");
+		goto disable_clk;
+	}
+
+	/* ok so request the fw */
+	ret = common_firmware_request_nowait(dev);
+	if (ret) {
+		al_codec_err(dev, "failed to request firmware");
+		goto disable_clk;
+	}
+
+	return 0;
+
+disable_clk:
+	clk_disable_unprepare(dev->mcu_clk);
+
+	return ret;
+}
+
+int al_common_send(struct al_common_dev *dev, struct msg_itf_header *hdr)
+{
+	return al_codec_msg_send(&dev->mb_h2m, hdr, common_trigger_mcu_irq,
+				 dev);
+}
+
+int al_common_send_req_reply(struct al_codec_dev *dev,
+			     struct list_head *cmd_list,
+			     struct msg_itf_header *hdr,
+			     struct al_common_mcu_req *req)
+{
+	struct al_codec_cmd *cmd = NULL;
+	int ret;
+
+	hdr->drv_cmd_hdl = 0;
+
+	if (req->reply_size && req->reply) {
+		cmd = al_codec_cmd_create(req->reply_size);
+		if (!cmd)
+			return -ENOMEM;
+
+		hdr->drv_cmd_hdl = al_virt_to_phys(cmd);
+	}
+
+	hdr->drv_ctx_hdl = req->pCtx;
+	hdr->type = req->req_type;
+	hdr->payload_len = req->req_size;
+
+	/* Add the list to the cmd list */
+	if (cmd)
+		list_add(&cmd->list, cmd_list);
+
+	ret = al_common_send(&dev->common, hdr);
+	if (ret)
+		goto remove_cmd;
+
+	al_v4l2_dbg(3, "Send req to mcu %d : %ld ", req->req_type,
+		    req->req_size);
+
+	if (!cmd)
+		return 0;
+
+	ret = wait_for_completion_timeout(&cmd->done, 5 * HZ);
+	if (ret <= 0) {
+		al_v4l2_err(dev, "cmd %p has %d (%s)", cmd, ret,
+			    (ret == 0) ? "failed" : "timedout");
+		ret = -ETIMEDOUT;
+		goto remove_cmd;
+	}
+
+	ret = 0;
+	memcpy(req->reply, cmd->reply, req->reply_size);
+
+remove_cmd:
+
+	if (cmd) {
+		list_del(&cmd->list);
+		al_codec_cmd_put(cmd);
+	}
+	return ret;
+}
+
+bool al_common_mcu_is_alive(struct al_codec_dev *dev)
+{
+	static const struct msg_itf_header hdr = {
+		.type = MSG_ITF_TYPE_MCU_ALIVE,
+		.payload_len = 0,
+	};
+	struct al_common_dev *cdev = &dev->common;
+	int ret;
+
+	ret = al_common_send(cdev, (struct msg_itf_header *)&hdr);
+	if (ret)
+		return false;
+
+	ret = wait_for_completion_timeout(&cdev->completion, 5 * HZ);
+	if (ret <= 0)
+		return false;
+
+	return true;
+}
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_common.h b/drivers/media/platform/allegro-dvt/al300/al_codec_common.h
new file mode 100644
index 000000000000..201a55c753f4
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_common.h
@@ -0,0 +1,226 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_CODEC_COMMON__
+#define __AL_CODEC_COMMON__
+
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/regmap.h>
+#include <media/v4l2-device.h>
+
+#include "al_codec_util.h"
+
+#define fh_to_ctx(ptr, type) container_of(ptr, type, fh)
+
+enum {
+	MSG_ITF_TYPE_CREATE_INST_REQ = MSG_ITF_TYPE_NEXT_REQ,
+	MSG_ITF_TYPE_DESTROY_INST_REQ,
+	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ,
+	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ,
+	MSG_ITF_TYPE_FLUSH_REQ,
+	MSG_ITF_TYPE_INFO_REQ,
+	MSG_ITF_TYPE_CREATE_INST_REPLY = MSG_ITF_TYPE_NEXT_REPLY,
+	MSG_ITF_TYPE_DESTROY_INST_REPLY,
+	MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REPLY,
+	MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REPLY,
+	MSG_ITF_TYPE_FLUSH_REPLY,
+	MSG_ITF_TYPE_INFO_REPLY,
+	MSG_ITF_TYPE_EVT_ERROR = MSG_ITF_TYPE_NEXT_EVT,
+};
+
+struct msg_itf_write_req {
+	u32 fd;
+	u32 len;
+	/* payload follow */
+} __packed;
+DECLARE_FULL_REQ(msg_itf_write_req);
+
+struct msg_itf_free_mem_req {
+	phys_addr_t phyAddr;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_free_mem_req);
+
+struct msg_itf_alloc_mem_req {
+	u64 uSize;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_alloc_mem_req);
+
+struct msg_itf_alloc_mem_reply {
+	phys_addr_t phyAddr;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_alloc_mem_reply);
+
+struct msg_itf_free_mem_reply {
+	s64 ret;
+};
+DECLARE_FULL_REPLY(msg_itf_free_mem_reply);
+
+struct msg_itf_create_codec_reply {
+	phys_addr_t hCodec;
+	s32 ret;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_create_codec_reply);
+
+struct msg_itf_destroy_codec_req {
+	phys_addr_t hCodec;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_destroy_codec_req);
+
+/*
+ * Note : no need to know the status of this request
+ * The codec should be destroyed, in case of the mcu
+ * hasn't received any request with the codec handler
+ */
+struct msg_itf_destroy_codec_reply {
+	u32 unused;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_destroy_codec_reply);
+
+struct al_buffer_meta {
+	u64 timestamp;
+	struct v4l2_timecode timecode;
+	bool last;
+};
+
+struct msg_itf_push_src_buf_req {
+	phys_addr_t hCodec;
+	phys_addr_t bufferHandle;
+	phys_addr_t phyAddr;
+	u64 size;
+	struct al_buffer_meta meta;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_push_src_buf_req);
+
+struct msg_itf_push_dst_buf_req {
+	phys_addr_t hCodec;
+	phys_addr_t bufferHandle;
+	phys_addr_t phyAddr;
+	u64 size;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_push_dst_buf_req);
+
+struct msg_itf_push_buffer_req {
+	phys_addr_t hCodec;
+	phys_addr_t bufferHandle;
+	phys_addr_t phyAddr;
+	u64 size;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_push_buffer_req);
+
+struct msg_itf_push_buffer_reply {
+	s32 res;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_push_buffer_reply);
+
+struct msg_itf_info_req {
+	u64 unused;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_info_req);
+
+struct msg_itf_flush_req {
+	phys_addr_t hCodec;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_flush_req);
+
+struct msg_itf_flush_reply {
+	int32_t unused;
+} __packed;
+DECLARE_FULL_REPLY(msg_itf_flush_reply);
+
+struct msg_itf_evt_error {
+	uint32_t errno;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_error);
+
+struct al_match_data {
+	const char *fw_name;
+};
+
+struct al_common_mcu_req {
+	phys_addr_t pCtx;
+	int req_type;
+	size_t req_size;
+	size_t reply_size;
+	void *reply;
+} __packed;
+
+struct al_common_dev {
+	struct platform_device *pdev;
+	void *fw_cpu_mem;
+	phys_addr_t fw_phys_addr;
+	const char *fw_name;
+	size_t fw_size;
+	struct clk *mcu_clk;
+
+	struct al_codec_mb mb_h2m;
+	struct al_codec_mb mb_m2h;
+	struct completion completion;
+
+	struct resource regs_info;
+	struct regmap *regmap;
+
+	struct list_head alloc_buffers;
+	struct mutex buf_lock;
+
+	/* callbacks set by client before common_probe */
+	void *cb_arg;
+	void (*process_msg_cb)(void *cb_arg, struct msg_itf_header *hdr);
+	void (*fw_ready_cb)(void *cb_arg);
+};
+
+struct al_codec_dev {
+	struct v4l2_device v4l2_dev;
+	struct v4l2_m2m_dev *m2m_dev;
+	struct video_device video_dev;
+	struct al_common_dev common;
+
+	/* mutex protecting vb2_queue structure */
+	struct mutex lock;
+
+	/* list of ctx (aka decoder) */
+	struct mutex ctx_mlock;
+	struct list_head ctx_q_list;
+	int is_video_init_done;
+
+	struct completion res_done;
+	/* list of cap/out supported formats */
+	struct list_head codec_q_list;
+	struct al_codec_cmd *codec_info_cmd;
+};
+
+static inline int al_common_get_header(struct al_common_dev *dev,
+				       struct msg_itf_header *hdr)
+{
+	return al_codec_msg_get_header(&dev->mb_m2h, hdr);
+}
+
+static inline int al_common_get_data(struct al_common_dev *dev, char *data,
+				     int len)
+{
+	return al_codec_msg_get_data(&dev->mb_m2h, data, len);
+}
+
+static inline int al_common_skip_data(struct al_common_dev *dev, int len)
+{
+	return al_common_get_data(dev, NULL, len);
+}
+
+int al_common_send(struct al_common_dev *dev, struct msg_itf_header *hdr);
+int al_common_send_req_reply(struct al_codec_dev *dev,
+			     struct list_head *cmd_list,
+			     struct msg_itf_header *hdr,
+			     struct al_common_mcu_req *req);
+bool al_common_mcu_is_alive(struct al_codec_dev *dev);
+
+int al_common_probe(struct platform_device *pdev, struct al_common_dev *dev);
+void al_common_remove(struct al_common_dev *dev);
+
+#endif /*__AL_CODEC_COMMON__*/
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.c b/drivers/media/platform/allegro-dvt/al300/al_codec_util.c
new file mode 100644
index 000000000000..eb468e467747
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.c
@@ -0,0 +1,179 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Mailbox communication utilities for command creation
+ * and message exchange with the MCU
+ *
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#include <asm-generic/errno.h>
+#include <linux/errno.h>
+#include <linux/jiffies.h>
+#include <linux/kernel.h>
+#include <linux/module.h>
+#include <linux/string.h>
+
+#include "al_codec_util.h"
+
+static int al_get_used_space(struct al_codec_mb *mb)
+{
+	u32 head = mb->hdr->head;
+	u32 tail = mb->hdr->tail;
+
+	return head >= tail ? head - tail : mb->size - (tail - head);
+}
+
+static int al_get_free_space(struct al_codec_mb *mb)
+{
+	return mb->size - al_get_used_space(mb) - 1;
+}
+
+static int al_has_enough_space(struct al_codec_mb *mb, int len)
+{
+	return al_get_free_space(mb) >= len;
+}
+
+static inline void al_copy_to_mb(struct al_codec_mb *mb, char *data, int len)
+{
+	u32 head = mb->hdr->head;
+	int copy_len = min(mb->size - head, (unsigned int)len);
+	int copied_len = len;
+
+	memcpy(&mb->data[head], data, copy_len);
+	len -= copy_len;
+	if (len)
+		memcpy(&mb->data[0], &data[copy_len], len);
+
+	/* Make sure that all messages are written before updating the head */
+	dma_wmb();
+	mb->hdr->head = (head + copied_len) % mb->size;
+	/* Make sure that the head is updated in DDR instead of cache */
+	dma_wmb();
+}
+
+static inline void al_copy_from_mb(struct al_codec_mb *mb, char *data, int len)
+{
+	u32 tail = mb->hdr->tail;
+	int copy_len = min(mb->size - tail, (unsigned int)len);
+	int copied_len = len;
+
+	if (!data)
+		goto update_tail;
+
+	memcpy(data, &mb->data[tail], copy_len);
+	len -= copy_len;
+	if (len)
+		memcpy(&data[copy_len], &mb->data[0], len);
+
+update_tail:
+	mb->hdr->tail = (tail + copied_len) % mb->size;
+	/* Make sure that the head is updated in DDR instead of cache */
+	dma_wmb();
+}
+
+static int al_codec_mb_send(struct al_codec_mb *mb, char *data, int len)
+{
+	if (!al_has_enough_space(mb, len))
+		return -ENOMEM;
+
+	al_copy_to_mb(mb, data, len);
+
+	return 0;
+}
+
+static int al_codec_mb_receive(struct al_codec_mb *mb, char *data, int len)
+{
+	if (al_get_used_space(mb) < len)
+		return -ENOMEM;
+
+	al_copy_from_mb(mb, data, len);
+
+	return 0;
+}
+
+void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic)
+{
+	mb->hdr = (struct al_mb_itf *)addr;
+	mb->hdr->magic = magic;
+	mb->hdr->version = MB_IFT_VERSION;
+	mb->hdr->head = 0;
+	mb->hdr->tail = 0;
+	mb->data = addr + sizeof(struct al_mb_itf);
+	mb->size = size - sizeof(struct al_mb_itf);
+	mutex_init(&mb->lock);
+}
+
+int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr)
+{
+	return al_codec_mb_receive(mb, (char *)hdr, sizeof(*hdr));
+}
+
+int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len)
+{
+	return al_codec_mb_receive(mb, data, len);
+}
+
+int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
+		      void (*trigger)(void *), void *trigger_arg)
+{
+	unsigned long timeout;
+	int ret;
+
+	timeout = jiffies + HZ;
+	mutex_lock(&mb->lock);
+	do {
+		if (time_after(jiffies, timeout)) {
+			mutex_unlock(&mb->lock);
+			return -ETIMEDOUT;
+		}
+		ret = al_codec_mb_send(mb, (char *)hdr,
+				       hdr->payload_len +
+					       sizeof(struct msg_itf_header));
+
+	} while (ret);
+	mutex_unlock(&mb->lock);
+
+	trigger(trigger_arg);
+
+	return 0;
+}
+
+static void al_codec_cmd_cleanup(struct kref *ref)
+{
+	struct al_codec_cmd *cmd =
+		container_of(ref, struct al_codec_cmd, refcount);
+	if (cmd) {
+		kfree(cmd->reply);
+		kfree(cmd);
+	}
+}
+
+void al_codec_cmd_put(struct al_codec_cmd *cmd)
+{
+	if (WARN_ON(!cmd))
+		return;
+
+	kref_put(&cmd->refcount, al_codec_cmd_cleanup);
+}
+
+struct al_codec_cmd *al_codec_cmd_create(int reply_size)
+{
+	struct al_codec_cmd *cmd;
+
+	cmd = kmalloc(sizeof(*cmd), GFP_KERNEL);
+	if (!cmd)
+		return NULL;
+
+	cmd->reply = kmalloc(reply_size, GFP_KERNEL);
+	if (!cmd->reply) {
+		kfree(cmd);
+		return NULL;
+	}
+
+	kref_init(&cmd->refcount);
+	cmd->reply_size = reply_size;
+	init_completion(&cmd->done);
+
+	return cmd;
+}
diff --git a/drivers/media/platform/allegro-dvt/al300/al_codec_util.h b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
new file mode 100644
index 000000000000..6806820bdb8a
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_codec_util.h
@@ -0,0 +1,186 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_CODEC_UTIL__
+#define __AL_CODEC_UTIL__
+
+#include <linux/mutex.h>
+#include <linux/types.h>
+#include <linux/v4l2-common.h>
+
+#include <media/v4l2-mem2mem.h>
+#include <media/videobuf2-v4l2.h>
+
+#define MB_IFT_MAGIC_H2M 0xabcd1230
+#define MB_IFT_MAGIC_M2H 0xabcd1231
+#define MB_IFT_VERSION 0x00010000
+
+#define MAJOR_SHIFT 20
+#define MAJOR_MASK 0xfff
+#define MINOR_SHIFT 8
+#define MINOR_MASK 0xfff
+#define PATCH_SHIFT 0
+#define PATCH_MASK 0xff
+
+/*
+ * AL_BOOT_VERSION() - Version format 32-bit, 12 bits for the major,
+ * the same for minor, 8bits for the patch
+ */
+#define AL_BOOT_VERSION(major, minor, patch)       \
+	((((major) & MAJOR_MASK) << MAJOR_SHIFT) | \
+	 (((minor) & MINOR_MASK) << MINOR_SHIFT) | \
+	 (((patch) & PATCH_MASK) << PATCH_SHIFT))
+
+#define al_phys_to_virt(x) ((void *)(uintptr_t)x)
+#define al_virt_to_phys(x) ((phys_addr_t)(uintptr_t)x)
+
+#define DECLARE_FULL_REQ(s)                \
+	struct s##_full {                  \
+		struct msg_itf_header hdr; \
+		struct s req;              \
+	} __packed
+
+#define DECLARE_FULL_REPLY(s)              \
+	struct s##_full {                  \
+		struct msg_itf_header hdr; \
+		struct s reply;            \
+	} __packed
+
+#define DECLARE_FULL_EVENT(s)              \
+	struct s##_full {                  \
+		struct msg_itf_header hdr; \
+		struct s event;            \
+	} __packed
+
+struct al_mb_itf {
+	u32 magic;
+	u32 version;
+	u32 head;
+	u32 tail;
+} __packed;
+
+struct al_codec_mb {
+	struct al_mb_itf *hdr;
+	struct mutex lock;
+	char *data;
+	int size;
+};
+
+struct al_codec_cmd {
+	struct kref refcount;
+	struct list_head list;
+	struct completion done;
+	int reply_size;
+	void *reply;
+};
+
+#if defined(DEBUG)
+
+extern int debug;
+/* Common logs */
+#define al_codec_err(dev, fmt, args...)                                     \
+	pr_err("[ALG_CODEC][ERROR] %s():%d: " fmt "\n", __func__, __LINE__, \
+	       ##args)
+
+#define al_codec_dbg(level, fmt, args...)                                  \
+	do {                                                               \
+		if (debug >= level)                                        \
+			pr_info("[ALG_CODEC] level=%d %s(),%d: " fmt "\n", \
+				level, __func__, __LINE__, ##args);        \
+	} while (0)
+
+/* V4L2 logs */
+#define al_v4l2_err(dev, fmt, args...)                                     \
+	pr_err("[ALG_V4L2][ERROR] %s():%d: " fmt "\n", __func__, __LINE__, \
+	       ##args)
+
+#define al_v4l2_dbg(level, fmt, args...)                                  \
+	do {                                                              \
+		if (debug >= level)                                       \
+			pr_info("[ALG_V4L2] level=%d %s(),%d: " fmt "\n", \
+				level, __func__, __LINE__, ##args);       \
+	} while (0)
+
+/* MCU debug */
+#define al_mcu_dbg(fmt, args...) pr_info("[ALG_MCU]: " fmt, ##args);
+
+#else
+
+#define al_codec_err(_dev, fmt, args...) \
+	dev_err(&_dev->pdev->dev, fmt "\n", ##args)
+
+#define al_v4l2_err(_dev, fmt, args...) \
+	dev_err(&_dev->common.pdev->dev, fmt "\n", ##args)
+
+#define al_codec_dbg(level, fmt, args...)
+#define al_v4l2_dbg(level, fmt, args...)
+#define al_mcu_dbg(fmt, args...)
+
+#endif
+
+#define MSG_ITF_TYPE_LIMIT BIT(10)
+
+/* Message types host <-> mcu */
+enum {
+	MSG_ITF_TYPE_MCU_ALIVE = 0x0,
+	MSG_ITF_TYPE_WRITE_REQ = 0x02,
+	MSG_ITF_TYPE_FIRST_REQ = 1024,
+	MSG_ITF_TYPE_NEXT_REQ,
+	MSG_ITF_TYPE_FIRST_REPLY = 2048,
+	MSG_ITF_TYPE_NEXT_REPLY,
+	MSG_ITF_TYPE_ALLOC_MEM_REQ = 3072,
+	MSG_ITF_TYPE_FREE_MEM_REQ,
+	MSG_ITF_TYPE_ALLOC_MEM_REPLY = 4096,
+	MSG_ITF_TYPE_FREE_MEM_REPLY,
+	MSG_ITF_TYPE_FIRST_EVT = 5120,
+	MSG_ITF_TYPE_NEXT_EVT = MSG_ITF_TYPE_FIRST_EVT
+};
+
+struct msg_itf_header {
+	u64 drv_ctx_hdl;
+	u64 drv_cmd_hdl;
+	u16 type;
+	u16 payload_len;
+	u16 padding[2];
+} __packed;
+
+void al_codec_mb_init(struct al_codec_mb *mb, char *addr, int size, u32 magic);
+int al_codec_msg_get_header(struct al_codec_mb *mb, struct msg_itf_header *hdr);
+int al_codec_msg_get_data(struct al_codec_mb *mb, char *data, int len);
+int al_codec_msg_send(struct al_codec_mb *mb, struct msg_itf_header *hdr,
+		      void (*trigger)(void *), void *trigger_arg);
+
+static inline bool is_type_reply(uint16_t type)
+{
+	return type >= MSG_ITF_TYPE_FIRST_REPLY &&
+	       type < MSG_ITF_TYPE_FIRST_REPLY + MSG_ITF_TYPE_LIMIT;
+}
+
+static inline bool is_type_event(uint16_t type)
+{
+	return type >= MSG_ITF_TYPE_FIRST_EVT &&
+	       type < MSG_ITF_TYPE_FIRST_EVT + MSG_ITF_TYPE_LIMIT;
+}
+
+void al_codec_cmd_put(struct al_codec_cmd *cmd);
+
+struct al_codec_cmd *al_codec_cmd_create(int reply_size);
+
+static inline struct al_codec_cmd *al_codec_cmd_get(struct list_head *cmd_list,
+						    uint64_t hdl)
+{
+	struct al_codec_cmd *cmd = NULL;
+
+	list_for_each_entry(cmd, cmd_list, list) {
+		if (likely(cmd == al_phys_to_virt(hdl))) {
+			kref_get(&cmd->refcount);
+			break;
+		}
+	}
+	return list_entry_is_head(cmd, cmd_list, list) ? NULL : cmd;
+}
+
+#endif /* __AL_CODEC_UTIL__ */
diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
new file mode 100644
index 000000000000..f7767098e844
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
@@ -0,0 +1,1533 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ *
+ * Allegro DVT stateful video decoder driver for the IP Gen 3
+ */
+
+#include <asm-generic/errno-base.h>
+#include <linux/list.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/string.h>
+#include <linux/v4l2-controls.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-device.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-ioctl.h>
+#include <media/videobuf2-dma-contig.h>
+
+#include "al_codec_common.h"
+#include "al_vdec_drv.h"
+
+#if defined(DEBUG)
+/* Log level */
+int debug;
+module_param(debug, int, 0644);
+MODULE_PARM_DESC(debug, "Debug level (0-3)");
+#endif
+
+/* default decoder params */
+#define DECODER_WIDTH_DEFAULT 640
+#define DECODER_HEIGHT_DEFAULT 480
+#define DECODER_WIDTH_MAX 3840
+#define DECODER_HEIGHT_MAX 2160
+#define DECODER_WIDTH_MIN 16
+#define DECODER_HEIGHT_MIN 16
+#define DEC_REQ_TIMEOUT msecs_to_jiffies(1000)
+#define DEC_RES_EVT_TIMEOUT DEC_REQ_TIMEOUT
+
+/* Supported formats */
+static const struct al_fmt al_src_formats[] = {
+	{
+		.pixelformat = V4L2_PIX_FMT_H264,
+		.bpp = 20,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_HEVC,
+		.bpp = 20,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_JPEG,
+		.bpp = 8,
+	}
+};
+
+static const struct al_fmt al_dst_formats[] = {
+	{
+		.pixelformat = V4L2_PIX_FMT_NV12,
+		.bpp = 12,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_P010,
+		.bpp = 12,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_NV16,
+		.bpp = 16,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_YUV420, /* YUV 4:2:0 */
+		.bpp = 12,
+	},
+	{
+		.pixelformat = V4L2_PIX_FMT_YVU420, /* YVU 4:2:0 */
+		.bpp = 12,
+	},
+};
+
+/* Default format */
+static const struct al_frame al_default_fmt = {
+
+	.width = DECODER_WIDTH_DEFAULT,
+	.height = DECODER_HEIGHT_DEFAULT,
+	.bytesperline = DECODER_WIDTH_MAX * 4,
+	.sizeimage = DECODER_WIDTH_DEFAULT * DECODER_HEIGHT_DEFAULT * 4,
+	.nbuffers = 1,
+	.fmt = &al_dst_formats[0],
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_REC709,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT
+};
+
+static struct al_frame *al_get_frame(struct al_dec_ctx *ctx,
+				     enum v4l2_buf_type type)
+{
+	if (WARN_ON(!ctx))
+		return ERR_PTR(-EINVAL);
+
+	if (type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		return &ctx->src;
+	else if (type == V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return &ctx->dst;
+
+	al_v4l2_err(ctx->dev, "Unsupported type (%d)", type);
+
+	return ERR_PTR(-EINVAL);
+}
+
+static const struct al_fmt *al_find_fmt(u32 pixelformat)
+{
+	const struct al_fmt *fmt;
+	unsigned int i;
+
+	/* check if the pixelformat exist in the src formats list */
+	for (i = 0; i < ARRAY_SIZE(al_src_formats); i++) {
+		fmt = &al_src_formats[i];
+		if (fmt->pixelformat == pixelformat)
+			return fmt;
+	}
+
+	/* check if the pixelformat exist in the dst formats list */
+	for (i = 0; i < ARRAY_SIZE(al_dst_formats); i++) {
+		fmt = &al_dst_formats[i];
+		if (fmt->pixelformat == pixelformat)
+			return fmt;
+	}
+
+	return NULL;
+}
+
+static int dec_fw_create_decoder(struct al_dec_ctx *ctx)
+{
+	struct msg_itf_create_decoder_req_full req;
+	struct msg_itf_create_codec_reply reply;
+	struct al_common_mcu_req mreq;
+	int ret;
+
+	if (ctx->hDec) {
+		al_v4l2_dbg(3, "fw decoder already exist\n");
+		return 0;
+	}
+
+	req.req.codec = ctx->codec;
+
+	mreq.pCtx = al_virt_to_phys(ctx);
+	mreq.req_type = MSG_ITF_TYPE_CREATE_INST_REQ;
+	mreq.req_size = sizeof(req.req);
+	mreq.reply_size = sizeof(reply);
+	mreq.reply = &reply;
+
+	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+
+	if (!ret && !reply.ret)
+		ctx->hDec = reply.hCodec;
+	else if (reply.ret)
+		ret = -ENODEV;
+
+	return ret;
+}
+
+static void dec_fw_destroy_decoder(struct al_dec_ctx *ctx)
+{
+	struct msg_itf_destroy_codec_req_full req;
+	struct msg_itf_destroy_codec_reply reply;
+	struct al_common_mcu_req mreq;
+	int ret;
+
+	if (!ctx->hDec) {
+		al_v4l2_dbg(3, "fw decoder doesn't exist");
+		return;
+	}
+	al_v4l2_dbg(3, "Destroy decoder %lld ", ctx->hDec);
+
+	req.req.hCodec = ctx->hDec;
+
+	mreq.pCtx = al_virt_to_phys(ctx);
+	mreq.req_type = MSG_ITF_TYPE_DESTROY_INST_REQ;
+	mreq.req_size = sizeof(req.req);
+	mreq.reply_size = sizeof(reply);
+	mreq.reply = &reply;
+
+	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+
+	if (!ret)
+		ctx->hDec = 0;
+}
+
+static int al_dec_fw_push_frame_buf(struct al_dec_ctx *ctx,
+				    struct vb2_v4l2_buffer *vbuf)
+{
+	struct msg_itf_push_dst_buf_req_full req;
+	struct v4l2_m2m_buffer *m2m_buf;
+	struct al_common_mcu_req mreq = { 0 };
+	int ret;
+
+	if (WARN(!vbuf, "NULL frame Buffer to push!!"))
+		return -EINVAL;
+
+	req.req.hCodec = ctx->hDec;
+	m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
+	req.req.bufferHandle = al_virt_to_phys(m2m_buf);
+	req.req.phyAddr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+	req.req.size = vb2_plane_size(&vbuf->vb2_buf, 0);
+
+	mreq.pCtx = al_virt_to_phys(ctx);
+	mreq.req_type = MSG_ITF_TYPE_PUT_DISPLAY_PICTURE_REQ;
+	mreq.req_size = sizeof(req.req);
+
+	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+	if (ret)
+		al_v4l2_err(ctx->dev, "Failed to push frame buffer %p %d",
+			    m2m_buf, ret);
+
+	return ret;
+}
+
+static int al_dec_fw_push_bitstream_buf(struct al_dec_ctx *ctx,
+					struct vb2_v4l2_buffer *vbuf)
+{
+	struct msg_itf_push_src_buf_req_full req;
+	struct v4l2_m2m_buffer *m2m_buf;
+	struct al_common_mcu_req mreq = { 0 };
+	int ret;
+
+	if (WARN(!vbuf, "NULL Buffer to push!!"))
+		return -EINVAL;
+
+	req.req.hCodec = ctx->hDec;
+	m2m_buf = container_of(vbuf, struct v4l2_m2m_buffer, vb);
+	req.req.bufferHandle = al_virt_to_phys(m2m_buf);
+	req.req.phyAddr = vb2_dma_contig_plane_dma_addr(&vbuf->vb2_buf, 0);
+	req.req.size = vb2_plane_size(&vbuf->vb2_buf, 0);
+
+	/* Fill the v4l2 metadata*/
+	req.req.meta.timestamp = vbuf->vb2_buf.timestamp;
+	req.req.meta.timecode = vbuf->timecode;
+	req.req.meta.last = vbuf->flags & V4L2_BUF_FLAG_LAST;
+
+	mreq.pCtx = al_virt_to_phys(ctx);
+	mreq.req_type = MSG_ITF_TYPE_PUSH_BITSTREAM_BUFFER_REQ;
+	mreq.req_size = sizeof(req.req);
+
+	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+	if (ret)
+		al_v4l2_err(ctx->dev, "Failed to push bitstream buffer %p %d",
+			    m2m_buf, ret);
+
+	return ret;
+}
+
+static int dec_fw_flush_req(struct al_dec_ctx *ctx)
+{
+	struct msg_itf_flush_req_full req;
+	struct msg_itf_flush_reply reply;
+	struct al_common_mcu_req mreq;
+	int ret;
+
+	req.req.hCodec = ctx->hDec;
+
+	mreq.pCtx = al_virt_to_phys(ctx);
+	mreq.req_type = MSG_ITF_TYPE_FLUSH_REQ;
+	mreq.req_size = sizeof(req.req);
+	mreq.reply_size = sizeof(reply);
+	mreq.reply = &reply;
+
+	ret = al_common_send_req_reply(ctx->dev, &ctx->cmd_q_list, &req.hdr,
+				       &mreq);
+
+	if (ret)
+		al_v4l2_err(ctx->dev, "Failed to flush the decoder %d", ret);
+
+	return ret;
+}
+
+static inline struct vb2_v4l2_buffer *
+al_dec_dequeue_buf(struct al_dec_ctx *ctx, uint64_t hdl,
+		   struct list_head *buffer_list)
+{
+	struct v4l2_m2m_buffer *buf, *tmp;
+	struct vb2_v4l2_buffer *ret = NULL;
+
+	mutex_lock(&ctx->buf_q_mlock);
+	list_for_each_entry_safe(buf, tmp, buffer_list, list) {
+		if (buf == al_phys_to_virt(hdl)) {
+			list_del(&buf->list);
+			ret = &buf->vb;
+			break;
+		}
+	}
+	mutex_unlock(&ctx->buf_q_mlock);
+
+	return ret;
+}
+
+static struct vb2_v4l2_buffer *al_dec_dequeue_src_buf(struct al_dec_ctx *ctx,
+						      uint64_t hdl)
+{
+	return al_dec_dequeue_buf(ctx, hdl, &ctx->stream_q_list);
+}
+
+static struct vb2_v4l2_buffer *al_dec_dequeue_dst_buf(struct al_dec_ctx *ctx,
+						      uint64_t hdl)
+{
+	return al_dec_dequeue_buf(ctx, hdl, &ctx->frame_q_list);
+}
+
+static void al_ctx_cleanup(struct kref *ref)
+{
+	struct al_dec_ctx *ctx = container_of(ref, struct al_dec_ctx, refcount);
+
+	kfree(ctx);
+}
+
+static inline struct al_dec_ctx *al_ctx_get(struct al_codec_dev *dev,
+					    uint64_t hdl)
+{
+	struct al_dec_ctx *ctx;
+	struct al_dec_ctx *ret = NULL;
+
+	mutex_lock(&dev->ctx_mlock);
+	list_for_each_entry(ctx, &dev->ctx_q_list, list) {
+		if (ctx == al_phys_to_virt(hdl)) {
+			kref_get(&ctx->refcount);
+			ret = ctx;
+			break;
+		}
+	}
+	mutex_unlock(&dev->ctx_mlock);
+
+	return ret;
+}
+
+static void al_ctx_put(struct al_dec_ctx *ctx)
+{
+	kref_put(&ctx->refcount, al_ctx_cleanup);
+}
+
+static int al_dec_start_streaming(struct vb2_queue *q, unsigned int count)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(q);
+	struct al_codec_dev *dev = ctx->dev;
+
+	v4l2_m2m_update_start_streaming_state(ctx->fh.m2m_ctx, q);
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type)) {
+		struct v4l2_m2m_buffer *buf;
+		int ret;
+
+		if (list_empty(&ctx->stream_q_list)) {
+			al_v4l2_dbg(0, "Empty stream list.");
+			return -EINVAL;
+		}
+		if (!al_common_mcu_is_alive(dev)) {
+			al_v4l2_err(dev, "Unable to ping the mcu");
+			return -ENODEV;
+		}
+
+		ret = dec_fw_create_decoder(ctx);
+		if (ret) {
+			al_v4l2_err(dev, "Unable to create the fw decoder %d",
+				    ret);
+			return ret;
+		}
+
+		/* Get the first vid-out queued buffer */
+		buf = list_first_entry(&ctx->stream_q_list,
+				       struct v4l2_m2m_buffer, list);
+
+		if (!buf) {
+			al_v4l2_err(
+				dev,
+				"Unable to get the first buffer from the stream list");
+			return -EINVAL;
+		}
+
+		if (al_dec_fw_push_bitstream_buf(ctx, &buf->vb)) {
+			al_v4l2_err(ctx->dev,
+				    "Unable to push the bitstream buffer");
+			return -EINVAL;
+		}
+
+		/* Wait until the mcu detect the resolution of the stream */
+		ret = wait_for_completion_timeout(&ctx->res_done,
+						  DEC_RES_EVT_TIMEOUT);
+		if (!ret) {
+			al_v4l2_err(ctx->dev, "unsupported stream");
+			ctx->aborting = true;
+		}
+
+		ctx->osequence = 0;
+	} else
+		ctx->csequence = 0;
+
+	return 0;
+}
+
+static void al_dec_stop_streaming_cap(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct v4l2_m2m_buffer *entry, *tmp;
+
+	mutex_lock(&ctx->buf_q_mlock);
+	if (!list_empty(&ctx->frame_q_list))
+		list_for_each_entry_safe(entry, tmp, &ctx->frame_q_list, list) {
+			list_del(&entry->list);
+			vbuf = &entry->vb;
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		}
+	mutex_unlock(&ctx->buf_q_mlock);
+
+	while (v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx)) {
+		vbuf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+		if (vbuf) {
+			vb2_set_plane_payload(&vbuf->vb2_buf, 0, 0);
+			v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+		}
+	}
+
+	v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+}
+
+static void al_dec_stop_streaming_out(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *vbuf;
+	struct v4l2_m2m_buffer *entry, *tmp;
+
+	mutex_lock(&ctx->buf_q_mlock);
+	if (!list_empty(&ctx->stream_q_list))
+		list_for_each_entry_safe(entry, tmp, &ctx->stream_q_list,
+					 list) {
+			list_del(&entry->list);
+			v4l2_m2m_buf_done(&entry->vb, VB2_BUF_STATE_ERROR);
+		}
+	mutex_unlock(&ctx->buf_q_mlock);
+
+	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx)) {
+		while ((vbuf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx)))
+			if (vbuf->vb2_buf.state == VB2_BUF_STATE_ACTIVE)
+				v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_ERROR);
+	}
+
+	dec_fw_destroy_decoder(ctx);
+}
+
+static void al_dec_stop_streaming(struct vb2_queue *q)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(q);
+
+	v4l2_m2m_update_stop_streaming_state(ctx->fh.m2m_ctx, q);
+
+	/* Releasing the dst and src buffers */
+	ctx->stopped = true;
+
+	if (V4L2_TYPE_IS_OUTPUT(q->type))
+		al_dec_stop_streaming_out(ctx);
+	else
+		al_dec_stop_streaming_cap(ctx);
+}
+
+static int al_dec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
+			      unsigned int *nplanes, unsigned int sizes[],
+			      struct device *alloc_devs[])
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(vq);
+	struct al_frame *format = al_get_frame(ctx, vq->type);
+
+	if (IS_ERR(format)) {
+		al_v4l2_err(ctx->dev, "Invalid format %p", format);
+		return PTR_ERR(format);
+	}
+
+	if (*nplanes)
+		return ((sizes[0] < format->sizeimage) ? -EINVAL : 0);
+
+	/* update queue num buffers */
+	format->nbuffers = max(*nbuffers, format->nbuffers);
+
+	*nplanes = 1;
+	sizes[0] = format->sizeimage;
+	*nbuffers = format->nbuffers;
+
+	al_v4l2_dbg(2, "%s: Get %d buffers of size %d each ",
+		    (vq->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ? "OUT" : "CAP",
+		    *nbuffers, sizes[0]);
+
+	return 0;
+}
+
+static int al_dec_buf_prepare(struct vb2_buffer *vb)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	if (ctx->aborting)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_CAPTURE(vb->type)) {
+		if (vbuf->field == V4L2_FIELD_ANY)
+			vbuf->field = V4L2_FIELD_NONE;
+		if (vbuf->field != V4L2_FIELD_NONE)
+			return -EINVAL;
+	}
+
+	al_v4l2_dbg(3, "%s : Buffer (%p) prepared ",
+		    (V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP"), vbuf);
+
+	return 0;
+}
+
+static inline void al_dec_fill_bitstream(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *src_buf;
+	struct v4l2_m2m_buffer *m2m_buf;
+	struct vb2_queue *src_vq;
+
+	lockdep_assert_held(&ctx->buf_q_mlock);
+
+	if (v4l2_m2m_num_src_bufs_ready(ctx->fh.m2m_ctx) > 0) {
+		src_buf = v4l2_m2m_next_src_buf(ctx->fh.m2m_ctx);
+		if (!src_buf)
+			return;
+
+		/* Dump empty buffers */
+		if (!vb2_get_plane_payload(&src_buf->vb2_buf, 0)) {
+			src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+			v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_DONE);
+			return;
+		}
+
+		src_vq = v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx);
+		src_buf = v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
+
+		if (src_buf) {
+			src_buf->sequence = ctx->osequence++;
+
+			if (vb2_is_streaming(src_vq) &&
+			    al_dec_fw_push_bitstream_buf(ctx, src_buf)) {
+				v4l2_m2m_buf_done(src_buf, VB2_BUF_STATE_ERROR);
+				return;
+			}
+
+			m2m_buf = container_of(src_buf, struct v4l2_m2m_buffer,
+					       vb);
+			list_add_tail(&m2m_buf->list, &ctx->stream_q_list);
+		}
+	}
+}
+
+static void al_dec_buf_queue(struct vb2_buffer *vb)
+{
+	struct al_dec_ctx *ctx = vb2_get_drv_priv(vb->vb2_queue);
+	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
+
+	v4l2_m2m_buf_queue(ctx->fh.m2m_ctx, vbuf);
+
+	if (V4L2_TYPE_IS_OUTPUT(vb->type)) {
+		mutex_lock(&ctx->buf_q_mlock);
+		al_dec_fill_bitstream(ctx);
+		mutex_unlock(&ctx->buf_q_mlock);
+	}
+
+	al_v4l2_dbg(3, "%s queued (%p) - (%d)",
+		    V4L2_TYPE_IS_OUTPUT(vb->type) ? "OUT" : "CAP", vbuf,
+		    vb->num_planes);
+}
+
+static const struct vb2_ops dec_queue_ops = {
+	.queue_setup = al_dec_queue_setup,
+	.buf_prepare = al_dec_buf_prepare,
+	.buf_queue = al_dec_buf_queue,
+	.start_streaming = al_dec_start_streaming,
+	.stop_streaming = al_dec_stop_streaming,
+	.wait_prepare = vb2_ops_wait_prepare,
+	.wait_finish = vb2_ops_wait_finish,
+};
+
+static int al_dec_queue_init(void *priv, struct vb2_queue *src_vq,
+			     struct vb2_queue *dst_vq)
+{
+	struct al_dec_ctx *ctx = priv;
+	int ret;
+
+	src_vq->dev = &ctx->dev->common.pdev->dev;
+	src_vq->type = V4L2_BUF_TYPE_VIDEO_OUTPUT;
+	src_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	src_vq->non_coherent_mem = false;
+	src_vq->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
+	src_vq->mem_ops = &vb2_dma_contig_memops;
+	src_vq->drv_priv = ctx;
+	src_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	src_vq->ops = &dec_queue_ops;
+	src_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	src_vq->lock = &ctx->dev->lock;
+	ret = vb2_queue_init(src_vq);
+	if (ret)
+		return ret;
+
+	dst_vq->dev = &ctx->dev->common.pdev->dev;
+	dst_vq->type = V4L2_BUF_TYPE_VIDEO_CAPTURE;
+	dst_vq->io_modes = VB2_MMAP | VB2_DMABUF;
+	dst_vq->non_coherent_mem = false;
+	dst_vq->dma_attrs |= DMA_ATTR_FORCE_CONTIGUOUS;
+	dst_vq->mem_ops = &vb2_dma_contig_memops;
+	dst_vq->drv_priv = ctx;
+	dst_vq->timestamp_flags = V4L2_BUF_FLAG_TIMESTAMP_COPY;
+	dst_vq->ops = &dec_queue_ops;
+	dst_vq->buf_struct_size = sizeof(struct v4l2_m2m_buffer);
+	dst_vq->lock = &ctx->dev->lock;
+	ret = vb2_queue_init(dst_vq);
+	if (ret) {
+		vb2_queue_release(src_vq);
+		return ret;
+	}
+
+	return 0;
+}
+
+static int al_dec_querycap(struct file *file, void *fh,
+			   struct v4l2_capability *cap)
+{
+	struct al_codec_dev *dev = video_drvdata(file);
+
+	strscpy(cap->driver, KBUILD_MODNAME, sizeof(cap->driver));
+	strscpy(cap->card, "Allegro DVT Video Decoder", sizeof(cap->card));
+	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:%s",
+		 dev_name(&dev->common.pdev->dev));
+
+	return 0;
+}
+
+static int al_dec_enum_fmt(struct file *file, void *fh, struct v4l2_fmtdesc *f)
+{
+	const struct al_fmt *fmt;
+
+	if (f->type != V4L2_BUF_TYPE_VIDEO_OUTPUT &&
+	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE)
+		return -EINVAL;
+
+	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
+		if (f->index >= ARRAY_SIZE(al_src_formats))
+			return -EINVAL;
+
+		fmt = &al_src_formats[f->index];
+	} else {
+		if (f->index >= ARRAY_SIZE(al_dst_formats))
+			return -EINVAL;
+
+		fmt = &al_dst_formats[f->index];
+	}
+
+	f->pixelformat = fmt->pixelformat;
+	return 0;
+}
+
+static int al_dec_try_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct v4l2_pix_format *pix = &f->fmt.pix;
+	struct al_frame *pix_fmt;
+
+	pix_fmt = al_get_frame(ctx, f->type);
+	if (IS_ERR(pix_fmt)) {
+		al_v4l2_err(ctx->dev, "Invalid frame (%p)", pix_fmt);
+		return PTR_ERR(pix_fmt);
+	}
+
+	pix_fmt->fmt = al_find_fmt(pix->pixelformat);
+	if (!pix_fmt->fmt) {
+		al_v4l2_err(ctx->dev, "Unknown format 0x%x", pix->pixelformat);
+		return -EINVAL;
+	}
+	pix->field = V4L2_FIELD_NONE;
+	pix->width = clamp_t(__u32, pix->width, DECODER_WIDTH_MIN,
+			     DECODER_WIDTH_MAX);
+	pix->height = clamp_t(__u32, pix->height, DECODER_HEIGHT_MIN,
+			      DECODER_HEIGHT_MAX);
+
+	pix->bytesperline = pix->width;
+	pix->sizeimage = (pix->width * pix->height * pix_fmt->fmt->bpp) / 8;
+
+	if (V4L2_TYPE_IS_CAPTURE(f->type))
+		if (pix->sizeimage < pix_fmt->sizeimage)
+			pix->sizeimage = pix_fmt->sizeimage;
+
+	al_v4l2_dbg(
+		3,
+		"%s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d) ",
+		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+
+	return 0;
+}
+
+static int al_dec_g_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct al_frame *pix_fmt = al_get_frame(ctx, f->type);
+	struct v4l2_pix_format *pix;
+
+	if (IS_ERR(pix_fmt)) {
+		al_v4l2_err(ctx->dev, "Invalid pixel format %p", pix_fmt);
+		return PTR_ERR(pix_fmt);
+	}
+
+	if (!pix_fmt->fmt) {
+		al_v4l2_err(ctx->dev, "Unknown format for %d", f->type);
+		return -EINVAL;
+	}
+
+	pix = &f->fmt.pix;
+	pix->width = pix_fmt->width;
+	pix->height = pix_fmt->height;
+	pix->bytesperline = pix_fmt->bytesperline;
+	pix->sizeimage = pix_fmt->sizeimage;
+	pix->pixelformat = pix_fmt->fmt->pixelformat;
+	pix->field = V4L2_FIELD_NONE;
+
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) {
+		pix->bytesperline = 0;
+		pix->pixelformat = ctx->codec;
+	}
+
+	pix->ycbcr_enc = pix_fmt->ycbcr_enc;
+	pix->quantization = pix_fmt->quantization;
+	pix->xfer_func = pix_fmt->xfer_func;
+	pix->colorspace = pix_fmt->colorspace;
+
+	al_v4l2_dbg(
+		3,
+		"%s : width (%d) , height (%d), bytesperline (%d) , sizeimage (%d)",
+		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+
+	return 0;
+}
+
+static int al_dec_s_fmt(struct file *file, void *fh, struct v4l2_format *f)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct v4l2_pix_format *pix;
+	struct al_frame *frame;
+	struct vb2_queue *vq;
+	int ret;
+
+	ret = al_dec_try_fmt(file, fh, f);
+	if (ret) {
+		al_v4l2_err(ctx->dev, "Cannot set format (%d)", f->type);
+		return ret;
+	}
+
+	frame = (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT) ? &ctx->src : &ctx->dst;
+
+	pix = &f->fmt.pix;
+	frame->fmt = al_find_fmt(pix->pixelformat);
+	if (!frame->fmt) {
+		al_v4l2_err(ctx->dev, "Unknown format for %d",
+			    pix->pixelformat);
+		return -EINVAL;
+	}
+
+	vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, f->type);
+	if (vb2_is_streaming(vq)) {
+		al_v4l2_err(ctx->dev, "queue %d busy", f->type);
+		return -EBUSY;
+	}
+
+	frame->width = pix->width;
+	frame->height = pix->height;
+	frame->bytesperline = pix->bytesperline;
+	frame->sizeimage = pix->sizeimage;
+	frame->field = pix->field;
+
+	frame->ycbcr_enc = pix->ycbcr_enc;
+	frame->quantization = pix->quantization;
+	frame->xfer_func = pix->xfer_func;
+	frame->colorspace = pix->colorspace;
+
+	/* Set decoder pixelformat */
+	if (f->type == V4L2_BUF_TYPE_VIDEO_OUTPUT)
+		ctx->codec = pix->pixelformat;
+
+	al_v4l2_dbg(
+		3,
+		" %s : width (%d) , height (%d), bytesperline (%d), sizeimage (%d)",
+		(f->type == V4L2_BUF_TYPE_VIDEO_CAPTURE) ? "CAP" : "OUT",
+		pix->width, pix->height, pix->bytesperline, pix->sizeimage);
+
+	return 0;
+}
+
+static void al_queue_eos_event(struct al_dec_ctx *ctx)
+{
+	const struct v4l2_event eos_event = {
+		.id = 0,
+		.type = V4L2_EVENT_EOS,
+	};
+
+	v4l2_event_queue_fh(&ctx->fh, &eos_event);
+}
+
+static void al_queue_res_chg_event(struct al_dec_ctx *ctx)
+{
+	static const struct v4l2_event ev_src_ch = {
+		.id = 0,
+		.type = V4L2_EVENT_SOURCE_CHANGE,
+		.u.src_change.changes = V4L2_EVENT_SRC_CH_RESOLUTION,
+	};
+
+	v4l2_event_queue_fh(&ctx->fh, &ev_src_ch);
+}
+
+static int al_dec_decoder_cmd(struct file *file, void *fh,
+			      struct v4l2_decoder_cmd *dcmd)
+{
+	struct al_dec_ctx *ctx = fh_to_ctx(fh, struct al_dec_ctx);
+	struct v4l2_m2m_ctx *m2m_ctx = ctx->fh.m2m_ctx;
+	struct vb2_v4l2_buffer *vbuf;
+	struct vb2_queue *dst_vq;
+	int ret;
+
+	ret = v4l2_m2m_ioctl_try_decoder_cmd(file, fh, dcmd);
+	if (ret)
+		return ret;
+
+	/* Get the vb2 queue for the Capture */
+	dst_vq = v4l2_m2m_get_dst_vq(m2m_ctx);
+
+	switch (dcmd->cmd) {
+	case V4L2_DEC_CMD_START:
+		vb2_clear_last_buffer_dequeued(dst_vq);
+		break;
+	case V4L2_DEC_CMD_STOP:
+		vbuf = v4l2_m2m_last_src_buf(m2m_ctx);
+		if (vbuf) {
+			al_v4l2_dbg(1, "marking last pending buffer");
+
+			vbuf->flags |= V4L2_BUF_FLAG_LAST;
+			if (v4l2_m2m_num_src_bufs_ready(m2m_ctx) == 0) {
+				al_v4l2_dbg(1, "all remaining buffers queued");
+				v4l2_m2m_try_schedule(m2m_ctx);
+			}
+		}
+		dec_fw_flush_req(ctx);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int al_dec_enum_framesizes(struct file *file, void *fh,
+				  struct v4l2_frmsizeenum *fsize)
+{
+	if (!al_find_fmt(fsize->pixel_format))
+		return -EINVAL;
+
+	/* FIXME : check step size */
+	fsize->type = V4L2_FRMSIZE_TYPE_STEPWISE;
+	fsize->stepwise.min_width = DECODER_WIDTH_MIN;
+	fsize->stepwise.max_width = DECODER_WIDTH_MAX;
+	fsize->stepwise.step_width = 8;
+	fsize->stepwise.min_height = DECODER_HEIGHT_MIN;
+	fsize->stepwise.max_height = DECODER_HEIGHT_MAX;
+	fsize->stepwise.step_height = 8;
+
+	return 0;
+}
+
+static int al_dec_subscribe_event(struct v4l2_fh *fh,
+				  const struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_EOS:
+		return v4l2_event_subscribe(fh, sub, 0, NULL);
+	case V4L2_EVENT_SOURCE_CHANGE:
+		return v4l2_src_change_event_subscribe(fh, sub);
+	default:
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int al_dec_log_status(struct file *file, void *fh)
+{
+	struct al_codec_dev *al_dev = video_drvdata(file);
+
+	v4l2_device_call_all(&al_dev->v4l2_dev, 0, core, log_status);
+	return 0;
+}
+
+static const struct v4l2_ioctl_ops al_dec_ioctl_ops = {
+	.vidioc_querycap = al_dec_querycap,
+	.vidioc_enum_fmt_vid_cap = al_dec_enum_fmt,
+	.vidioc_enum_fmt_vid_out = al_dec_enum_fmt,
+	.vidioc_g_fmt_vid_cap = al_dec_g_fmt,
+	.vidioc_g_fmt_vid_out = al_dec_g_fmt,
+	.vidioc_try_fmt_vid_cap = al_dec_try_fmt,
+	.vidioc_try_fmt_vid_out = al_dec_try_fmt,
+	.vidioc_s_fmt_vid_cap = al_dec_s_fmt,
+	.vidioc_s_fmt_vid_out = al_dec_s_fmt,
+
+	.vidioc_create_bufs = v4l2_m2m_ioctl_create_bufs,
+	.vidioc_reqbufs = v4l2_m2m_ioctl_reqbufs,
+
+	.vidioc_expbuf = v4l2_m2m_ioctl_expbuf,
+	.vidioc_querybuf = v4l2_m2m_ioctl_querybuf,
+	.vidioc_qbuf = v4l2_m2m_ioctl_qbuf,
+	.vidioc_dqbuf = v4l2_m2m_ioctl_dqbuf,
+	.vidioc_prepare_buf = v4l2_m2m_ioctl_prepare_buf,
+
+	.vidioc_streamon = v4l2_m2m_ioctl_streamon,
+	.vidioc_streamoff = v4l2_m2m_ioctl_streamoff,
+	.vidioc_log_status = al_dec_log_status,
+
+	.vidioc_try_decoder_cmd = v4l2_m2m_ioctl_try_decoder_cmd,
+	.vidioc_decoder_cmd = al_dec_decoder_cmd,
+	.vidioc_enum_framesizes = al_dec_enum_framesizes,
+
+	.vidioc_subscribe_event = al_dec_subscribe_event,
+	.vidioc_unsubscribe_event = v4l2_event_unsubscribe,
+};
+
+static void al_device_run(void *priv)
+{
+	struct al_dec_ctx *ctx = priv;
+	struct vb2_v4l2_buffer *dst_buf;
+	struct v4l2_m2m_buffer *m2m_buf;
+
+	if (unlikely(!ctx))
+		return;
+
+	if (ctx->aborting) {
+		vb2_queue_error(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx));
+		vb2_queue_error(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx));
+		return;
+	}
+
+	if (!v4l2_m2m_num_dst_bufs_ready(ctx->fh.m2m_ctx))
+		goto job_finish;
+
+	dst_buf = v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
+	if (!dst_buf)
+		goto job_finish;
+
+	if (!al_common_mcu_is_alive(ctx->dev) ||
+	    al_dec_fw_push_frame_buf(ctx, dst_buf)) {
+		vb2_set_plane_payload(&dst_buf->vb2_buf, 0, 0);
+		v4l2_m2m_buf_done(dst_buf, VB2_BUF_STATE_ERROR);
+		goto job_finish;
+	}
+
+	mutex_lock(&ctx->buf_q_mlock);
+	m2m_buf = container_of(dst_buf, struct v4l2_m2m_buffer, vb);
+	list_add_tail(&m2m_buf->list, &ctx->frame_q_list);
+	mutex_unlock(&ctx->buf_q_mlock);
+
+job_finish:
+	v4l2_m2m_job_finish(ctx->dev->m2m_dev, ctx->fh.m2m_ctx);
+}
+
+static const struct v4l2_m2m_ops al_dec_m2m_ops = {
+	.device_run = al_device_run,
+};
+
+static int al_dec_open(struct file *file)
+{
+	struct video_device *vdev = video_devdata(file);
+	struct al_codec_dev *dev = video_get_drvdata(vdev);
+	struct al_dec_ctx *ctx = NULL;
+	int ret;
+
+	if (mutex_lock_interruptible(&dev->ctx_mlock))
+		return -ERESTARTSYS;
+
+	/* Aloocate memory for the dec ctx */
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
+	if (!ctx) {
+		ret = -ENOMEM;
+		goto unlock;
+	}
+
+	ctx->dev = dev;
+	/* Init ctx mutex */
+	mutex_init(&ctx->buf_q_mlock);
+	/* Init ctx LISTHEADs*/
+	INIT_LIST_HEAD(&ctx->cmd_q_list);
+	INIT_LIST_HEAD(&ctx->frame_q_list);
+	INIT_LIST_HEAD(&ctx->stream_q_list);
+
+	/* Init the irq queue */
+	init_completion(&ctx->res_done);
+
+	v4l2_fh_init(&ctx->fh, vdev);
+
+	v4l2_ctrl_handler_init(&ctx->ctrl_handler, 0);
+	if (ctx->ctrl_handler.error) {
+		ret = ctx->ctrl_handler.error;
+		al_v4l2_err(dev, "Failed to create control %d", ret);
+		goto handler_error;
+	}
+
+	ctx->fh.ctrl_handler = &ctx->ctrl_handler;
+	v4l2_ctrl_handler_setup(&ctx->ctrl_handler);
+
+	file->private_data = &ctx->fh;
+	v4l2_fh_add(&ctx->fh);
+
+	/* Set default formats */
+	ctx->src = ctx->dst = al_default_fmt;
+
+	ctx->codec = V4L2_PIX_FMT_H264;
+	ctx->stopped = false;
+	ctx->aborting = false;
+
+	/* Setup the ctx for m2m mode */
+	ctx->fh.m2m_ctx =
+		v4l2_m2m_ctx_init(dev->m2m_dev, ctx, al_dec_queue_init);
+	if (IS_ERR(ctx->fh.m2m_ctx)) {
+		ret = PTR_ERR(ctx->fh.m2m_ctx);
+		al_v4l2_err(dev, "Failed to initialize m2m mode %d", ret);
+		goto error_ctrls;
+	}
+
+	v4l2_m2m_set_src_buffered(ctx->fh.m2m_ctx, true);
+	/* v4l2_m2m_set_dst_buffered(ctx->fh.m2m_ctx, true); */
+
+	/* Add ctx to the LIST */
+	kref_init(&ctx->refcount);
+	list_add(&ctx->list, &dev->ctx_q_list);
+
+	mutex_unlock(&dev->ctx_mlock);
+
+	return 0;
+
+error_ctrls:
+	v4l2_fh_del(&ctx->fh);
+handler_error:
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_exit(&ctx->fh);
+	kfree(ctx);
+
+unlock:
+	mutex_unlock(&dev->ctx_mlock);
+	return ret;
+}
+
+static int al_dec_release(struct file *file)
+{
+	struct al_dec_ctx *ctx =
+		fh_to_ctx(file->private_data, struct al_dec_ctx);
+	struct al_codec_dev *dev = ctx->dev;
+
+	mutex_lock(&dev->ctx_mlock);
+
+	/* It is important to do this before removing ctx from dev list.
+	 * Those commands will trigger some traffic towards fw and so we
+	 * need completion to avoid deadlock if cmds can't find ctx.
+	 */
+	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+	v4l2_fh_del(&ctx->fh);
+	v4l2_fh_exit(&ctx->fh);
+
+	list_del(&ctx->list);
+	al_ctx_put(ctx);
+	mutex_unlock(&dev->ctx_mlock);
+
+	return 0;
+}
+
+static inline bool al_mark_last_dst_buf(struct al_dec_ctx *ctx)
+{
+	struct vb2_v4l2_buffer *buf;
+	struct vb2_buffer *dst_vb;
+	struct vb2_queue *dst_vq;
+	unsigned long flags;
+
+	al_v4l2_dbg(1, "marking last capture buffer");
+
+	dst_vq = v4l2_m2m_get_vq(ctx->fh.m2m_ctx, V4L2_BUF_TYPE_VIDEO_CAPTURE);
+	spin_lock_irqsave(&dst_vq->done_lock, flags);
+	if (list_empty(&dst_vq->done_list)) {
+		spin_unlock_irqrestore(&dst_vq->done_lock, flags);
+		return false;
+	}
+
+	dst_vb = list_last_entry(&dst_vq->done_list, struct vb2_buffer,
+				 done_entry);
+	buf = to_vb2_v4l2_buffer(dst_vb);
+	buf->flags |= V4L2_BUF_FLAG_LAST;
+
+	spin_unlock_irqrestore(&dst_vq->done_lock, flags);
+	return true;
+}
+
+static const struct v4l2_file_operations al_dec_file_ops = {
+	.owner = THIS_MODULE,
+	.open = al_dec_open,
+	.release = al_dec_release,
+	.poll = v4l2_m2m_fop_poll,
+	.unlocked_ioctl = video_ioctl2,
+	.mmap = v4l2_m2m_fop_mmap,
+};
+
+static void handle_error_evt(struct al_dec_ctx *ctx, struct msg_itf_header *hdr)
+{
+	struct al_codec_dev *dev = ctx->dev;
+	struct msg_itf_evt_error evt;
+	struct v4l2_m2m_buffer *vbuf;
+
+	if (al_common_get_data(&dev->common, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(dev, "Unable to get resolution found event");
+		return;
+	}
+
+	al_v4l2_err(dev, "Decoding error  %d", evt.errno);
+
+	mutex_lock(&ctx->buf_q_mlock);
+	if (!list_empty(&ctx->stream_q_list)) {
+		vbuf = list_last_entry(&ctx->frame_q_list,
+				       struct v4l2_m2m_buffer, list);
+		list_del(&vbuf->list);
+		v4l2_m2m_buf_done(&vbuf->vb, VB2_BUF_STATE_ERROR);
+	}
+	mutex_unlock(&ctx->buf_q_mlock);
+}
+
+static void handle_resolution_found_evt(struct al_dec_ctx *ctx,
+					struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_resolution_found evt;
+	struct al_codec_dev *dev = ctx->dev;
+	struct al_frame *frame;
+	struct vb2_queue *dst_vq;
+
+	if (al_common_get_data(&dev->common, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(dev, "Unable to get resolution found event");
+		return;
+	}
+
+	frame = &ctx->dst;
+
+	if (frame->width != evt.width || frame->height != evt.height ||
+	    frame->nbuffers < evt.buffer_nb) {
+		/* Update frame properties */
+		frame->width = evt.width;
+		frame->height = evt.height;
+		frame->bytesperline = evt.bytesperline;
+		frame->sizeimage = evt.sizeimage;
+		frame->nbuffers = evt.buffer_nb;
+		frame->fmt = al_find_fmt(evt.pixelformat);
+
+		/* This has to be changed */
+		if (!frame->fmt)
+			return;
+
+		al_queue_res_chg_event(ctx);
+	}
+
+	dst_vq = v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx);
+	if (!vb2_is_streaming(dst_vq))
+		complete(&ctx->res_done);
+
+	al_v4l2_dbg(
+		3,
+		"width(%d) , height(%d), bytesperline(%d), sizeimage(%d), n_bufs(%d)",
+		frame->width, frame->height, frame->bytesperline,
+		frame->sizeimage, frame->nbuffers);
+}
+
+static void handle_bitstream_buffer_release_evt(struct al_dec_ctx *ctx,
+						struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_bitstream_buffer_release evt;
+	struct al_codec_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *vbuf;
+
+	if (al_common_get_data(&dev->common, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(dev, "Unable to get buffer release event");
+		return;
+	}
+
+	if (ctx->stopped)
+		return;
+
+	vbuf = al_dec_dequeue_src_buf(ctx, evt.bufferHandle);
+	if (!vbuf) {
+		al_v4l2_err(dev, "Unable to find bitsream buffer 0x%llx",
+			    evt.bufferHandle);
+		return;
+	}
+
+	al_v4l2_dbg(3, "Release bitstream buffer %p", vbuf);
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+}
+
+static void handle_eos_evt(struct al_dec_ctx *ctx, struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_frame_buffer_decode evt;
+	struct al_codec_dev *dev = ctx->dev;
+
+	if (al_common_get_data(&dev->common, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(dev, "Unable to get frame buffer event");
+		return;
+	}
+
+	/* set LAST_FLAG to the last done CAPTURE buffer*/
+	al_mark_last_dst_buf(ctx);
+	/* Set eos event */
+	al_queue_eos_event(ctx);
+}
+
+static void handle_frame_buffer_decode_evt(struct al_dec_ctx *ctx,
+					   struct msg_itf_header *hdr)
+{
+	struct msg_itf_evt_frame_buffer_decode evt;
+	struct al_codec_dev *dev = ctx->dev;
+	struct vb2_v4l2_buffer *vbuf;
+	struct al_buffer_meta *meta;
+
+	if (al_common_get_data(&dev->common, (char *)&evt, hdr->payload_len)) {
+		al_v4l2_err(dev, "Unable to get frame buffer event");
+		return;
+	}
+
+	vbuf = al_dec_dequeue_dst_buf(ctx, evt.bufferHandle);
+	if (!vbuf) {
+		al_v4l2_err(dev, "Unable to find frame buffer 0x%llx",
+			    evt.bufferHandle);
+		return;
+	}
+
+	meta = &evt.meta;
+	al_v4l2_dbg(3, "Decoded frame done for buffer %p (%d) (%lld)", vbuf,
+		    meta->last, evt.size);
+
+	vb2_set_plane_payload(&vbuf->vb2_buf, 0, evt.size);
+	vbuf->field = V4L2_FIELD_NONE;
+	vbuf->sequence = ctx->csequence++;
+	vbuf->timecode = meta->timecode;
+	vbuf->vb2_buf.timestamp = meta->timestamp;
+
+	if (meta->last || (vbuf->flags & V4L2_BUF_FLAG_LAST)) {
+		vbuf->flags |= V4L2_BUF_FLAG_LAST;
+		v4l2_m2m_mark_stopped(ctx->fh.m2m_ctx);
+	}
+
+	v4l2_m2m_buf_done(vbuf, VB2_BUF_STATE_DONE);
+}
+
+static int al_handle_cmd_reply(struct al_codec_dev *dev,
+			       struct msg_itf_header *hdr)
+{
+	struct al_dec_ctx *ctx;
+	struct al_codec_cmd *cmd = NULL;
+	int ret = 0;
+
+	ctx = al_ctx_get(dev, hdr->drv_ctx_hdl);
+	if (IS_ERR_OR_NULL(ctx)) {
+		al_v4l2_err(dev, "Unable to find ctx %p for reply %d",
+			    al_phys_to_virt(hdr->drv_ctx_hdl), hdr->type);
+		return -EINVAL;
+	}
+
+	cmd = al_codec_cmd_get(&ctx->cmd_q_list, hdr->drv_cmd_hdl);
+	if (!cmd) {
+		al_v4l2_err(dev, "Unable to find command %p for reply %d",
+			    al_phys_to_virt(hdr->drv_cmd_hdl), hdr->type);
+		ret = -EINVAL;
+		goto ctx_put;
+	}
+
+	if (cmd->reply_size != hdr->payload_len) {
+		al_v4l2_err(dev, "mismatch size %d %d", cmd->reply_size,
+			    hdr->payload_len);
+		ret = -EINVAL;
+		goto cmd_put;
+	}
+
+	ret = al_common_get_data(&dev->common, cmd->reply, hdr->payload_len);
+	if (ret)
+		al_v4l2_err(dev, "Unable to copy reply");
+
+	complete(&cmd->done);
+	ret = 0;
+
+cmd_put:
+	al_codec_cmd_put(cmd);
+ctx_put:
+	al_ctx_put(ctx);
+
+	return ret;
+}
+
+static int al_handle_cmd_evt(struct al_codec_dev *dev,
+			     struct msg_itf_header *hdr, int type)
+{
+	static u32 evt_sizes[] = {
+		sizeof(struct msg_itf_evt_error),
+		sizeof(struct msg_itf_evt_resolution_found),
+		sizeof(struct msg_itf_evt_bitstream_buffer_release),
+		sizeof(struct msg_itf_evt_frame_buffer_decode),
+		sizeof(struct msg_itf_evt_eos),
+	};
+
+	u32 evt_size;
+	struct al_dec_ctx *ctx = NULL;
+	int ret = 0;
+
+	if (type < MSG_ITF_TYPE_NEXT_EVT || type > MSG_ITF_TYPE_END_EVT) {
+		al_v4l2_err(dev, "Unsupporting event type %d", type);
+		return -EINVAL;
+	}
+
+	ctx = al_ctx_get(dev, hdr->drv_ctx_hdl);
+	if (!ctx) {
+		al_v4l2_err(dev, "Unable to find ctx %p for evt %d",
+			    al_phys_to_virt(hdr->drv_ctx_hdl), type);
+		return -EINVAL;
+	}
+
+	// Check the received event size and the expected one
+	evt_size = evt_sizes[type - MSG_ITF_TYPE_NEXT_EVT];
+	if (hdr->payload_len != evt_size) {
+		al_v4l2_err(
+			dev,
+			"Invalid event size for client (%p) for evt (%d) : Got (%d), expected (%d)",
+			al_phys_to_virt(hdr->drv_ctx_hdl), type,
+			hdr->payload_len, evt_size);
+		ret = -EINVAL;
+		goto clean_ctx;
+	}
+
+	al_v4l2_dbg(3, "Event received from MCU (%d)", type);
+
+	switch (type) {
+	case MSG_ITF_TYPE_EVT_ERROR:
+		handle_error_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_RESOLUTION_FOUND:
+		handle_resolution_found_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE:
+		handle_bitstream_buffer_release_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE:
+		handle_frame_buffer_decode_evt(ctx, hdr);
+		break;
+	case MSG_ITF_TYPE_EVT_EOS:
+		handle_eos_evt(ctx, hdr);
+		break;
+	default:
+		break;
+	}
+
+clean_ctx:
+	al_ctx_put(ctx);
+	return ret;
+}
+
+static void al_dec_process_msg(void *cb_arg, struct msg_itf_header *hdr)
+{
+	struct al_codec_dev *dev = cb_arg;
+	int ret;
+
+	if (is_type_reply(hdr->type))
+		ret = al_handle_cmd_reply(dev, hdr);
+	else if (is_type_event(hdr->type))
+		ret = al_handle_cmd_evt(dev, hdr, hdr->type);
+	else {
+		al_v4l2_err(dev, "Unsupported message type %d", hdr->type);
+		ret = -EINVAL;
+	}
+
+	if (ret) {
+		al_v4l2_err(dev, "Skip received data");
+		al_common_skip_data(&dev->common, hdr->payload_len);
+	}
+}
+
+static const struct video_device al_videodev = {
+	.name = "allegro-decoder",
+	.fops = &al_dec_file_ops,
+	.ioctl_ops = &al_dec_ioctl_ops,
+	.minor = -1,
+	.release = video_device_release_empty,
+	.vfl_dir = VFL_DIR_M2M,
+	.device_caps = V4L2_CAP_VIDEO_M2M | V4L2_CAP_STREAMING,
+};
+
+static void al_dec_register_v4l2(void *cb_arg)
+{
+	struct al_codec_dev *dev = cb_arg;
+	struct video_device *video_dev = NULL;
+	int ret;
+
+	ret = v4l2_device_register(&dev->common.pdev->dev, &dev->v4l2_dev);
+	if (ret) {
+		al_v4l2_err(dev, "Unable to register v4l2 device %d", ret);
+		return;
+	}
+
+	dev->m2m_dev = v4l2_m2m_init(&al_dec_m2m_ops);
+	if (IS_ERR(dev->m2m_dev)) {
+		ret = PTR_ERR(dev->m2m_dev);
+		al_v4l2_err(dev, "failed to init mem2mem device %d", ret);
+		goto v4l2_m2m_init_error;
+	}
+
+	video_dev = &dev->video_dev;
+	*video_dev = al_videodev;
+
+	video_dev->lock = &dev->lock;
+	video_dev->v4l2_dev = &dev->v4l2_dev;
+
+	video_set_drvdata(video_dev, dev);
+	ret = video_register_device(video_dev, VFL_TYPE_VIDEO, -1);
+	if (ret) {
+		al_v4l2_err(dev, "failed to register video device %d", ret);
+		goto video_register_device_error;
+	}
+
+	v4l2_info(&dev->v4l2_dev, "registered as /dev/video%d\n",
+		  dev->video_dev.num);
+
+	dev->is_video_init_done = 1;
+
+	return;
+
+video_register_device_error:
+	v4l2_m2m_release(dev->m2m_dev);
+v4l2_m2m_init_error:
+	v4l2_device_unregister(&dev->v4l2_dev);
+}
+
+static int al_dec_probe(struct platform_device *pdev)
+{
+	struct al_codec_dev *al_dev;
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	const struct al_match_data *match_data;
+	int ret;
+
+	dev_info(dev, "Probing ...\n");
+
+	match_data = device_get_match_data(dev);
+	if (!match_data) {
+		dev_err(dev, "Missing device match data\n");
+		return -EINVAL;
+	}
+
+	al_dev = devm_kzalloc(dev, sizeof(*al_dev), GFP_KERNEL);
+	if (!al_dev)
+		return -ENOMEM;
+
+	al_dev->is_video_init_done = 0;
+	mutex_init(&al_dev->lock);
+	mutex_init(&al_dev->ctx_mlock);
+	INIT_LIST_HEAD(&al_dev->ctx_q_list);
+
+	al_dev->common.cb_arg = al_dev;
+	al_dev->common.process_msg_cb = al_dec_process_msg;
+	al_dev->common.fw_ready_cb = al_dec_register_v4l2;
+
+	/* firmware-name is optional in DT */
+	of_property_read_string(np, "firmware-name", &al_dev->common.fw_name);
+	if (!al_dev->common.fw_name)
+		al_dev->common.fw_name = match_data->fw_name;
+
+	ret = al_common_probe(pdev, &al_dev->common);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, al_dev);
+	dev_info(dev, "Probing done successfully %p\n", al_dev);
+
+	return 0;
+}
+
+static void al_dec_remove(struct platform_device *pdev)
+{
+	struct al_codec_dev *dev = platform_get_drvdata(pdev);
+
+	dev_info(&pdev->dev, "remove %p\n", dev);
+
+	if (dev->is_video_init_done) {
+		video_unregister_device(&dev->video_dev);
+		if (dev->m2m_dev)
+			v4l2_m2m_release(dev->m2m_dev);
+		v4l2_device_unregister(&dev->v4l2_dev);
+	}
+
+	al_common_remove(&dev->common);
+}
+
+static const struct al_match_data ald300_data = {
+	.fw_name = "al300-vdec.fw",
+};
+
+static const struct of_device_id v4l2_al_dec_dt_match[] = {
+	{ .compatible = "allegrodvt,al300-vdec", .data = &ald300_data },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, v4l2_al_dec_dt_match);
+
+static struct platform_driver al300_vdec_drv = {
+	.probe = al_dec_probe,
+	.remove = al_dec_remove,
+	.driver = {
+		.name = "al300_vdec",
+		.of_match_table = of_match_ptr(v4l2_al_dec_dt_match),
+	},
+};
+
+module_platform_driver(al300_vdec_drv);
+
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:al300-vdec");
+MODULE_AUTHOR("Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>");
+MODULE_DESCRIPTION("Allegro DVT V4l2 decoder driver gen 3");
diff --git a/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
new file mode 100644
index 000000000000..ec1a7c450300
--- /dev/null
+++ b/drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
@@ -0,0 +1,94 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2025 Allegro DVT.
+ * Author: Yassine OUAISSA <yassine.ouaissa@allegrodvt.fr>
+ */
+
+#ifndef __AL_VDEC_DRV__
+#define __AL_VDEC_DRV__
+
+#include "al_codec_util.h"
+
+enum {
+	MSG_ITF_TYPE_EVT_RESOLUTION_FOUND = MSG_ITF_TYPE_NEXT_EVT + 1,
+	MSG_ITF_TYPE_EVT_BITSTREAM_BUFFER_RELEASE,
+	MSG_ITF_TYPE_EVT_FRAME_BUFFER_DECODE,
+	MSG_ITF_TYPE_EVT_EOS,
+	/* Mark the end of the events list.*/
+	MSG_ITF_TYPE_END_EVT,
+};
+
+struct msg_itf_create_decoder_req {
+	unsigned int codec;
+} __packed;
+DECLARE_FULL_REQ(msg_itf_create_decoder_req);
+
+struct msg_itf_evt_resolution_found {
+	u16 buffer_nb;
+	u16 width;
+	u16 height;
+	u32 pixelformat;
+	u32 sizeimage;
+	u32 bytesperline;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_resolution_found);
+
+struct msg_itf_evt_bitstream_buffer_release {
+	u64 bufferHandle;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_bitstream_buffer_release);
+
+struct msg_itf_evt_frame_buffer_decode {
+	u64 bufferHandle;
+	u64 size;
+	struct al_buffer_meta meta;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_frame_buffer_decode);
+
+struct msg_itf_evt_eos {
+	u32 unused;
+} __packed;
+DECLARE_FULL_EVENT(msg_itf_evt_eos);
+
+struct al_fmt {
+	u32 pixelformat;
+	u8 bpp;
+};
+
+struct al_frame {
+	u32 width;
+	u32 height;
+	u32 bytesperline;
+	u32 sizeimage;
+	u32 nbuffers;
+	const struct al_fmt *fmt;
+	enum v4l2_field field;
+	enum v4l2_colorspace colorspace;
+	enum v4l2_ycbcr_encoding ycbcr_enc;
+	enum v4l2_quantization quantization;
+	enum v4l2_xfer_func xfer_func;
+};
+
+struct al_dec_ctx {
+	struct al_codec_dev *dev;
+	struct v4l2_fh fh;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct kref refcount;
+	struct list_head list;
+	/* CAP and OUT frames */
+	struct al_frame src;
+	struct al_frame dst;
+	struct completion res_done; /* Resolution found event */
+	u32 codec;
+	u64 hDec;
+	struct list_head cmd_q_list; /* Store active commands */
+	struct mutex buf_q_mlock;
+	struct list_head frame_q_list;
+	struct list_head stream_q_list;
+	u32 csequence;
+	u32 osequence;
+	bool stopped;
+	bool aborting;
+};
+
+#endif /*__AL_VDEC_DRV__*/
-- 
2.30.2


