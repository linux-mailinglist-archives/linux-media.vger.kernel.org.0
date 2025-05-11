Return-Path: <linux-media+bounces-32235-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F672AB2934
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 16:49:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD19B169D84
	for <lists+linux-media@lfdr.de>; Sun, 11 May 2025 14:49:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8DC525B688;
	Sun, 11 May 2025 14:49:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="08mySQQU"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022122.outbound.protection.outlook.com [40.107.161.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026A12F2F;
	Sun, 11 May 2025 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746974938; cv=fail; b=Yqo/hoFfwKt+qGjEclT9J0pV8rTCwDiMmbg6k54z1r+m+kx9EVsnvwgnI/L996N8v0xqOM6nvL/oaPuiuzhYmg4r6TJYS0fZJVsrDjsgk/dMq0uGZQGz/Lp4lY+XiJmGKTVXetAYek7FqjRNVap+D2E0O5+leySwGUVoU4I5XEY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746974938; c=relaxed/simple;
	bh=38cd96FkM/dNaoA1wTezNqjeKC9/G3iaRkD/UAN6UGE=;
	h=From:To:Subject:Date:Message-Id:Content-Type:MIME-Version; b=MvNFvNWybTCfBrW68dc37VJeYl/jNv5Jwv6b4fshcEUePs7krN2fQv5WvXUZHdN7RR+9avhOR0WP0uY8K5Xm+4ntL975qkUipJDxF62FLjGcKZupXlh8aU3giQAgMWuZSm/1dAuULhK83hz83fr2YTX4pRUO5GQ2iFELbKPPQXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=08mySQQU; arc=fail smtp.client-ip=40.107.161.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ts/c2vZFdaK+Odoa/nIBKc7Ga9QoqWPZ+dukciIZL+8E+atnBdLXNpLI5LlYIoCxtupiY8xkj2tdWOFGVVbY1xwJL8+DCrTSy2tPPCZOpoOdhuPTOx3qrmbg7buSE0BjKgSQ/+P3ewBGTqwmauZyLNa1YVubrLhWVZ+muZdk5wu3IsiR9EzJmV21ybNAHyNpf5qre8R2p9dHOV43ndggO//8zBHH3U3XtqcMufAeVIXZ7iOaGud8PrjstV/mRHs1CPjUReOEIrLWxduz6MmHN60pik0b9S/3EYjrptIeMkjsOgqQIHU4bK69UQlojjv2QRiFkG+XPQqJLvRuEXyMlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+9AkyslcioKsJGR5++wupVeriIIN8RHiafrH1Nb0r0=;
 b=dtfi2fgtyQhoRgf39qV7byaGZHvJTrES+H0pu7EJSlea9zhPA+M6IEwzC27pdDEKgI4BzpkCPwPA/rou1GUnrECG7VB6iSirBDF+FKoIjbhpTlkH7gkEzN8HgWudaALrDUrqNqkN/XybTU2X7RyVb/eWFN4hmyEBqIwddQLQDIVuAlqWM4bdH+drLCPhnC0dvF2KbaXMAl9JmeZoVJt+l8P752RcATuMoozIDMRWV/bUfCUTjSFutW2P0toZ4Wkee0BWyLYv1wHqOk0JRr/DCV+Blf/bfhNmqFjsoeE09ZcHJ6Vdjy/IIxl9jGr5Abw8AdMJ+XKyWGd2Yl7+FJyS3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+9AkyslcioKsJGR5++wupVeriIIN8RHiafrH1Nb0r0=;
 b=08mySQQU7ptrgeKb7IHCYjdiNvNhNPvb7g3N/0X98chN+joeruxsEgY0ypa2sN0Hq81sp+8AVPyOLP52lr9WJUdwZslwu5aS2SEdrTJpDLWifCM+Vaib4fxeMlv57QREwLWaA6dPhQXTZv9H1GHejKjZAB6ieSG5cG/VeTl0GKtMDHsp/s8Em6h0tBabz7N4uHezb0bhaAeDYf92O1iw7cCnngUG3KnCvOdM3mKpeALky3mlSiRORmxCxjAb3wDY1IFi5oBVpMsyFRgcC5vMaB4NWskdzy7rWzezhB1SqKmi42JYc4s3uB3IwCjQUyGxvYrIF2JkUCKMfGYppDL8Hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PAZP264MB2448.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:1f3::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 14:48:48 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%3]) with mapi id 15.20.8722.027; Sun, 11 May 2025
 14:48:48 +0000
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
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 0/3] media: Add Gen 3 IP stateful decoder driver
Date: Sun, 11 May 2025 16:47:31 +0200
Message-Id: <20250511144752.504162-1-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PA7P264CA0227.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:372::14) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PAZP264MB2448:EE_
X-MS-Office365-Filtering-Correlation-Id: 42797449-1fba-4954-0b65-08dd909aefdc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Tb5bD8NzaS1UEmBaG0JHV199mjWPdy/Z2gvCJ9SjQvLUjxpB3IQvFOHxdv8b?=
 =?us-ascii?Q?+l12JqtWsJPVLovD6rERX202NHJk8Zfx1FrMieRCgzWaAvdvlPDTDLrdoHOB?=
 =?us-ascii?Q?BcfXLsq7fUNWkl/Pize6KO0a4CVczOFxWnn6PqFnOS6U34K787EHh1Nn1Uz9?=
 =?us-ascii?Q?hs4LcjmNme/L6h6gCNWv2WMcstKrufjcBV61VRkeAydgfZ6UV+jwbGixf0lT?=
 =?us-ascii?Q?X54XvH3iR/oH5g05IEXCUD8AW5b1JiX3HoXw6LXtgitqiQ4hfgZpvBOSajaE?=
 =?us-ascii?Q?7yPOAKNv2x2HfKQGwdCcHJOHm5IpTUexvgmYfUhVUc2CK+ZhQKGyMFKA3FWs?=
 =?us-ascii?Q?oQlScMwMmeFpzz6kmulFOSO/aYJbMPikwtZjCdCT2eMf0v4UbTnEVSuKq2D5?=
 =?us-ascii?Q?0RWzutqR7VJXbucg1JqGfnGn4nn2IumnUfgqZu2O0FpL0f2gNxStzBA6f0/p?=
 =?us-ascii?Q?4wrdcB6KWaiBJcSMSiHnhmk6xCO5jPUGmz2yGXwh3Z347Q/LlvXLu33FojDJ?=
 =?us-ascii?Q?5t7gaE111w5APvwilPPNf6JOAYoCr6f12LdPfqEcCkScRc735+DSq0HrVdFk?=
 =?us-ascii?Q?3tl2HQHZJ+FtG+HkbvggaGsNcn0njF6N+WxFOp6x3F/kQ8qTskpcxRwojR1M?=
 =?us-ascii?Q?Cl5ujF4qCCuyfDjU/AgVk+3PG0Kv0uwoCwa7VuFj01BP1wFSXDx98S4y6DdQ?=
 =?us-ascii?Q?pBKDZCiqnU4HEOdAKMjPhYFurOstWV/neyXN5ocbAeXtdTZE5Utz6WRVynE/?=
 =?us-ascii?Q?fhuEYRYsk6K1St1UI0pIydsnzgOJyflQpjI3rGV4NM/ron24YtjNgdj3rQa6?=
 =?us-ascii?Q?V57FhTeZM8fIOSsydt0iwHq9YRArIb3wLeMjqyzyEin2+TB67Nm/Zp83skHW?=
 =?us-ascii?Q?QMAoN1QFS4Ksnq/TC/vJoU1GTWe6yKZOK30Ibv/HU7hSwS452JaREMEEtNDh?=
 =?us-ascii?Q?Cw9XVrLcagwFhOhk6HhKwkUU+cDgJwBVnwK4E1F++7/Q+n9w0lneXhfchGCn?=
 =?us-ascii?Q?StzY2fRABWFD8B2wMXIpgInNpfFOeXbEKjqz86Ok1cN0l49U4rTc2vNyG97v?=
 =?us-ascii?Q?T8/3P6ukMwuWXFCk9FcOcWcDEh2IWJ8HbKAzbFvIvMXAXcbUbix9Auj4HBAf?=
 =?us-ascii?Q?DjbdwaiCafpYhD+RnCv7PuG+Fnc5trLYGxKyTnyIll82qrcbSfMvYns1P/Jk?=
 =?us-ascii?Q?nsg82TFGb0fBBVwizRIpPTOK2LxhV8P6+McudTxUBzHanuaixZejBabzMtaq?=
 =?us-ascii?Q?Ygntx7ELxFpk7mIy4lAFH8QNxxgjrztPziJO33fGdIEMjrEzNjffuC1xdddB?=
 =?us-ascii?Q?Z4HODE7GObCABgTco5Q6F1dEnAH/w59IlS5fmIsMgKeci8hWpRg086VitrKU?=
 =?us-ascii?Q?BivjYbeFQwY7TZKL+vGjZZ0NBZREe6WMLWGEr4NPNdpDzabPm9w5Be8Wklfw?=
 =?us-ascii?Q?WtKiP5mLtvk6bvHoDZDzyxRotXNDRDQm4o8qzmHASW1/2JxUGoce/Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?gV5U4Jhpz83ESvw9DEWIldye7iMgjWpyeT00bEB+dQkvOX1N9Vqsn2kdquRP?=
 =?us-ascii?Q?2Q7Aqq2flCevF+gzbWLxZNDS8F9ZlcUH8AstKndu2VrPsr2rOp/ILrqlw+me?=
 =?us-ascii?Q?YxOKOzd7hWm4EQidFOZ2PTg6Z7+mps/fMWJ5EzBrouD9sEr7AF31r8HEnPkl?=
 =?us-ascii?Q?MUp5ZWlnMyA3+VbVEOt9VefLDrYiI144Y//elKUANfipIl1vv/MCPvU+I2nR?=
 =?us-ascii?Q?gMC4wvjT/Xu3eBdCYU7zsxk9orXhC/GZtRasEAO6oCCq2piaZIRhM0MJsL0f?=
 =?us-ascii?Q?yblh5CPX/N48j4fPStrUJchrH+MV02euxydZXg/Po/2mlQmHw1Jsw0pBhzTu?=
 =?us-ascii?Q?CEAKPC9ot+JExuRPhvu8clmiM6KzCULUfwkFMdC+kgaLS2ePCzCPwCwQe7nc?=
 =?us-ascii?Q?6469bcBdzrpw2i3hckcTeNP3MV72r4kh7jC3zXxd3kSvzOfxheVmyJ53sixs?=
 =?us-ascii?Q?0sMU2OmnOJiuJ/9YSkWi1lDBhFkooPUiTPV4YzaeYqvItedu3TlJBPFUVNl8?=
 =?us-ascii?Q?P3rgsrgw3PiSaNnVHLSKPJb2HgqLfuN7t0UFQj4K0k4k/AD7SCA2vH9CKfXU?=
 =?us-ascii?Q?nxuCjPC/UQIsF8Nmd7BKp/YO74RNbiv2LdzWOKq+vL4Fz+0VGFMO+/aUOyvm?=
 =?us-ascii?Q?EHyoyUdd0y+Wu/pPEYAwKVUdNiPE+lqtj4t/A6JlHzctz6aa8PFo7gHo/KEx?=
 =?us-ascii?Q?AMhdod/qRIC3s1rv5xG/P/I1o8rJg2wVJ+fy759jZz5bBQBIqtFIehEe8MfP?=
 =?us-ascii?Q?f51JKZ9JCc3fF5AE6H0vb8ZG0as/opoXYzpXfzYeicxbLgs6atePV7+J9aB2?=
 =?us-ascii?Q?abkqLRVslixKY2MO/isi0XNqLKTt/3P9QqcL3O0l6+OBSLRnby1jUC1nP6oZ?=
 =?us-ascii?Q?wtgx7y8AIjwUIe/f2h6h2LPwFAlfNgvvEBxG7+CYaPszvWI7UJ028dRDWrpq?=
 =?us-ascii?Q?1z7bwPGICRGzDFuQbHeHL8v3VI7PshaoSuKW1g7RJ7iRIYfE5y6zNGaLP/q9?=
 =?us-ascii?Q?0y9wuLon8R0Qdb2v9grnrmDheK4d7jlPKs7Mk0bvXPQx4mRg/ilaA+Ppeokr?=
 =?us-ascii?Q?iqmBzAxQuSsy5oR90BRmchq72Z1Y7jI43IbztEJJGpmG7zl4gWquMBeNi+SE?=
 =?us-ascii?Q?UYIFa8Snose60SNQdOyBm/ZxMAcARHSGV1YrY4w5pLoGNBlKBoZb+iWfTyVc?=
 =?us-ascii?Q?HH1TwbTEgV0di+IR7q054QEn84Hd2EBg6jxBWhkCtTK6Ytbm+YBknSGVxm7f?=
 =?us-ascii?Q?hy9RfEWVVATJ3OOgEBCbwsoeBevxQg6qjUAoM+zOuXrXPOR7hokIqJhDvOHq?=
 =?us-ascii?Q?xyD9OM4XkwDIQcBaFSWelN1NjOTAqiu9w3CYoo+6UVqsvATSwpqqo/Wvyf4D?=
 =?us-ascii?Q?UcvUFeajwpbXnGfXf1zfl2cIlkWfZBuCp/FpmAk1CZXpAVniFVHkLg96i/q6?=
 =?us-ascii?Q?uHV1wyB9ENf8OknDudTyFf5IjaQ0u33X0mihfQQyuoUVvW2a90jz5ObcFBk4?=
 =?us-ascii?Q?zQA5KRZdCtdMkmotg41z8ddliXe0PZHrP7PXObSYRCL3+wg7dDs20TN6K+aB?=
 =?us-ascii?Q?4EOWZ2FaM73ckyaIMFS0sUwC2duw0ZrVLK1xT6+KvHcnle95elrlDX6vQyTs?=
 =?us-ascii?Q?1fVp3sUjhcGTB3I1DV8a3ftVOnZ9W6FzORSn2Zb8/IG5r+94usaDsfngGY4V?=
 =?us-ascii?Q?IJwR1w=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42797449-1fba-4954-0b65-08dd909aefdc
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 14:48:48.2362
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SiMDYnIsY2K0QfBWp6dE4KKD0Nxm0UpoXkxyUcipeMNlZkCmA+yGVoH6ZdDZCeO4ws2lGu9YaQbUexvKyZmg3hPSQpbBsvO54VMbS+km2G8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAZP264MB2448

# V4L2 Video Decoder Driver System Description

** Hardware Architecture **

The system implements a heterogeneous computing architecture with two primary components:

- **Host Subsystem**: Linux-based CPU running the V4L2 framework and associated drivers
- **IP Subsystem**: Dedicated hardware containing an MCU and a hardware video CODEC

The communication between the two subsystems uses a shared DDR shared memory with bidirectional interrupt mechanism for synchronization.

The architecture is represented in the following diagram:

```
+---------------------+                  +----------------------+
|       Host          |                  |        IP            |
|                     |                  |                      |
|  +---------------+  |                  |  +----------------+  |
|  |               |  |   DDR Shared     |  |                |  |
|  | Linux Kernel  |<-|----------------->|->|     MCU        |  |
|  | (CPU)         |  |    Memory        |  |                |  |
|  |   +--------+  |  |                  |  +----------------+  |
|  |   |        |  |  |    IRQ when      |           ^          |
|  |   | V4L2   |  |<-|----new message-->|           |          |
|  |   | Drivers|  |  |                  |           |          |
|  |   |        |  |  |                  |           | APB      |
|  |   +--------+  |  |                  |           |          |
|  |               |  |                  |           v          |
|  +---------------+  |                  |  +----------------+  |
|                     |                  |  |                |  |
|                     |                  |  |     CODEC      |  |
|                     |                  |  |                |  |
|                     |                  |  |                |  |
+---------------------+                  +----------------------+
```

** Communication Protocol **

-- Current Implementation - Custom Mailbox --

The host CPU and MCU currently communicate through a custom mailbox protocol implemented over shared memory. The protocol operates as follows:

1. When the host has a new message for the MCU:
   - The host writes data to a dedicated shared memory region
   - The host triggers an interrupt to the MCU
   - The MCU reads the shared memory to obtain the message type and data

2. Similarly, when the MCU has a message for the host:
   - The MCU writes to the shared memory
   - The MCU triggers an interrupt to the host
   - The host reads the shared memory to process the message

-- Migration to RPMSG --

The custom mailbox implementation will be replaced by the standard Linux RPMSG framework.

** Driver Implementation **

This driver implements a V4L2-compliant stateful video decoder with the following characteristics:

-- Technical Specifications --

- **Codec Support**: AVC (H.264), HEVC (H.265), and JPEG
- **Resolution Support**: Up to 4K
- **Pixel Formats**:
  - Currently supported: V4L2_PIX_FMT_NV12, V4L2_PIX_FMT_NV16, V4L2_PIX_FMT_P010
  - Additional formats planned for future releases
- **Buffer Configuration**: Currently supports semi-planar format only; multiplanar support forthcoming

-- Initialization Sequence --

During probe, the driver performs the following operations:

1. Allocates memory for the MCU firmware
2. Loads the firmware into the allocated memory
3. Initializes the MCU by configuring internal registers (e.g BOOT_ADDR)
4. Establishes the shared memory communication interface (to be replaced by RPMSG)
5. Sets up interrupt handlers for MCU communication

-- Processing Model --

The driver implements a stateful decoding model with the following workflow:

-- Stream Initialization --

1. Upon `VIDIOC_STREAMON` on the OUTPUT queue:
   - The driver sends a context creation request to the MCU
   - This operation is blocking; the driver waits until the MCU responds with a context handler
   - The context handler is stored in a driver-maintained list for subsequent operations
   - Each context has its own unique handler to support multiple simultaneous streams

2. Initial stream analysis:
   - The driver submits the first compressed buffer (OUTPUT queue)
   - The MCU analyzes the stream and reports capability via:
     - `resolution_found_event`: Stream is supported, includes stream parameters
     - `error_event`: Stream format is unsupported or invalid

-- Decoding Pipeline --

1. After successful stream initialization and receiving the resolution_found_evt:
   - The driver can begin normal decoding operations
   - V4L2 framework can be informed of format requirements

2. For each compressed buffer (OUTPUT queue):
   - The driver submits buffer to MCU with the appropriate context handler
   - The MCU processes the buffer and sends `release_bitstream_evt` when complete
   - This event signals that the input buffer can be returned to the application

3. For each decoded buffer (CAPTURE queue):
   - The MCU fills the buffer with decoded frame data
   - The MCU sends `frame_buffer_decode_evt` with important metadata including:
     - Original source buffer timestamp
     - Flags
     - Timecode
     - Actual payload size (bytes used in the decoded frame)
   - This enables the driver to properly queue the filled buffer to the application

4. End-of-stream handling:
   - The MCU sends an event with `eos_evt` when reaching the end of stream
   - This allows proper handling of end-of-stream conditions

-- Multi-stream Support --

The driver architecture supports multiple simultaneous decoding contexts with the following characteristics:

1. Each context maintains separate state information
2. The driver manages multiple context handlers returned by the MCU
3. Buffer submissions include the appropriate context handler for routing
4. The system can decode multiple independent streams concurrently

-- Stream Termination --

When `VIDIOC_STREAMOFF` is called:

1. The driver sends a flush command to the MCU for the specific context
2. The driver issues a non-blocking destroy context message
3. All associated resources are released
4. The context handler is removed from the driver's context list

** Error Handling **

The driver implements comprehensive error handling including:

1. Firmware loading failures
2. MCU initialization errors
3. Context creation failures
4. Unsupported stream formats
5. Decoding errors reported by the MCU
6. Timeout handling for unresponsive hardware

** Memory Management **

The system uses the following memory management strategy:

1. Firmware memory is allocated during probe
2. Buffer memory is managed through the V4L2 buffer management interfaces
3. DMA-capable memory is used for buffer transfers between host and MCU
4. The driver properly synchronizes memory access to avoid coherency issues

** Future Enhancements **

Planned future enhancements include:

1. Migration from custom mailbox to RPMSG (in progress)
2. Support for additional pixel formats
3. Implementation of multiplanar buffer support

This comprehensive architecture enables efficient hardware-accelerated video decoding while adhering to standard V4L2 interfaces, making it suitable for upstream inclusion in the Linux kernel.

** Decoder Compliance Testing **

-- AVC and HEVC Fluster Report --

This section contains the compliance test results from Fluster framework for both AVC and HEVC decoders.
The reports validate the decoder's conformance to relevant standards and demonstrate compatibility with a wide range of video streams.

[FLUSTER REPORT FOR THE H.264]
 -- JVT-AVC_V1

| Test                     | FFmpeg-H.264-v4l2m2m |
| ------------------------ | -------------------- |
| TOTAL                    | 79/135               |
| TOTAL TIME               | 437.031s             |
| -                        | -                    |
| AUD_MW_E                 | OK                   |
| BA1_FT_C                 | OK                   |
| BA1_Sony_D               | OK                   |
| BA2_Sony_F               | OK                   |
| BA3_SVA_C                | OK                   |
| BA_MW_D                  | OK                   |
| BAMQ1_JVC_C              | OK                   |
| BAMQ2_JVC_C              | OK                   |
| BANM_MW_D                | OK                   |
| BASQP1_Sony_C            | OK                   |
| CABA1_Sony_D             | OK                   |
| CABA1_SVA_B              | OK                   |
| CABA2_Sony_E             | OK                   |
| CABA2_SVA_B              | OK                   |
| CABA3_Sony_C             | OK                   |
| CABA3_SVA_B              | OK                   |
| CABA3_TOSHIBA_E          | OK                   |
| cabac_mot_fld0_full      | ER                   |
| cabac_mot_frm0_full      | OK                   |
| cabac_mot_mbaff0_full    | ER                   |
| cabac_mot_picaff0_full   | KO                   |
| CABACI3_Sony_B           | OK                   |
| CABAST3_Sony_E           | OK                   |
| CABASTBR3_Sony_B         | OK                   |
| CABREF3_Sand_D           | ER                   |
| CACQP3_Sony_D            | OK                   |
| CAFI1_SVA_C              | ER                   |
| CAMA1_Sony_C             | ER                   |
| CAMA1_TOSHIBA_B          | ER                   |
| cama1_vtc_c              | ER                   |
| cama2_vtc_b              | ER                   |
| CAMA3_Sand_E             | ER                   |
| cama3_vtc_b              | ER                   |
| CAMACI3_Sony_C           | ER                   |
| CAMANL1_TOSHIBA_B        | ER                   |
| CAMANL2_TOSHIBA_B        | ER                   |
| CAMANL3_Sand_E           | ER                   |
| CAMASL3_Sony_B           | ER                   |
| CAMP_MOT_MBAFF_L30       | ER                   |
| CAMP_MOT_MBAFF_L31       | ER                   |
| CANL1_Sony_E             | OK                   |
| CANL1_SVA_B              | OK                   |
| CANL1_TOSHIBA_G          | OK                   |
| CANL2_Sony_E             | OK                   |
| CANL2_SVA_B              | OK                   |
| CANL3_Sony_C             | OK                   |
| CANL3_SVA_B              | OK                   |
| CANL4_SVA_B              | OK                   |
| CANLMA2_Sony_C           | ER                   |
| CANLMA3_Sony_C           | ER                   |
| CAPA1_TOSHIBA_B          | ER                   |
| CAPAMA3_Sand_F           | ER                   |
| CAPCM1_Sand_E            | OK                   |
| CAPCMNL1_Sand_E          | OK                   |
| CAPM3_Sony_D             | OK                   |
| CAQP1_Sony_B             | OK                   |
| cavlc_mot_fld0_full_B    | ER                   |
| cavlc_mot_frm0_full_B    | OK                   |
| cavlc_mot_mbaff0_full_B  | ER                   |
| cavlc_mot_picaff0_full_B | KO                   |
| CAWP1_TOSHIBA_E          | OK                   |
| CAWP5_TOSHIBA_E          | OK                   |
| CI1_FT_B                 | OK                   |
| CI_MW_D                  | OK                   |
| CVBS3_Sony_C             | OK                   |
| CVCANLMA2_Sony_C         | ER                   |
| CVFC1_Sony_C             | OK                   |
| CVFI1_Sony_D             | ER                   |
| CVFI1_SVA_C              | ER                   |
| CVFI2_Sony_H             | ER                   |
| CVFI2_SVA_C              | ER                   |
| CVMA1_Sony_D             | ER                   |
| CVMA1_TOSHIBA_B          | ER                   |
| CVMANL1_TOSHIBA_B        | ER                   |
| CVMANL2_TOSHIBA_B        | ER                   |
| CVMAPAQP3_Sony_E         | ER                   |
| CVMAQP2_Sony_G           | ER                   |
| CVMAQP3_Sony_D           | ER                   |
| CVMP_MOT_FLD_L30_B       | ER                   |
| CVMP_MOT_FRM_L31_B       | ER                   |
| CVNLFI1_Sony_C           | ER                   |
| CVNLFI2_Sony_H           | ER                   |
| CVPA1_TOSHIBA_B          | ER                   |
| CVPCMNL1_SVA_C           | OK                   |
| CVPCMNL2_SVA_C           | OK                   |
| CVSE2_Sony_B             | OK                   |
| CVSE3_Sony_H             | OK                   |
| CVSEFDFT3_Sony_E         | OK                   |
| CVWP1_TOSHIBA_E          | OK                   |
| CVWP2_TOSHIBA_E          | OK                   |
| CVWP3_TOSHIBA_E          | OK                   |
| CVWP5_TOSHIBA_E          | OK                   |
| FI1_Sony_E               | ER                   |
| FM1_BT_B                 | ER                   |
| FM1_FT_E                 | KO                   |
| FM2_SVA_C                | ER                   |
| HCBP1_HHI_A              | OK                   |
| HCBP2_HHI_A              | OK                   |
| HCMP1_HHI_A              | OK                   |
| LS_SVA_D                 | OK                   |
| MIDR_MW_D                | OK                   |
| MPS_MW_A                 | OK                   |
| MR1_BT_A                 | OK                   |
| MR1_MW_A                 | OK                   |
| MR2_MW_A                 | OK                   |
| MR2_TANDBERG_E           | OK                   |
| MR3_TANDBERG_B           | OK                   |
| MR4_TANDBERG_C           | OK                   |
| MR5_TANDBERG_C           | OK                   |
| MR6_BT_B                 | ER                   |
| MR7_BT_B                 | OK                   |
| MR8_BT_B                 | ER                   |
| MR9_BT_B                 | ER                   |
| MV1_BRCM_D               | OK                   |
| NL1_Sony_D               | OK                   |
| NL2_Sony_H               | OK                   |
| NL3_SVA_E                | OK                   |
| NLMQ1_JVC_C              | OK                   |
| NLMQ2_JVC_C              | OK                   |
| NRF_MW_E                 | OK                   |
| Sharp_MP_Field_1_B       | ER                   |
| Sharp_MP_Field_2_B       | ER                   |
| Sharp_MP_Field_3_B       | ER                   |
| Sharp_MP_PAFF_1r2        | ER                   |
| Sharp_MP_PAFF_2r         | ER                   |
| SL1_SVA_B                | OK                   |
| SP1_BT_A                 | ER                   |
| sp2_bt_b                 | ER                   |
| SVA_BA1_B                | OK                   |
| SVA_BA2_D                | OK                   |
| SVA_Base_B               | OK                   |
| SVA_CL1_E                | OK                   |
| SVA_FM1_E                | OK                   |
| SVA_NL1_B                | OK                   |
| SVA_NL2_E                | OK                   |
| -                        | -                    |
| Test                     | FFmpeg-H.264-v4l2m2m |
| TOTAL                    | 79/135               |
| TOTAL TIME               | 439.031s             |

NOTE: The ER (ERROR) streams are not supported by the decoder.
      The driver print error message "Unsupported stream"

- JVT-FR-EXT

| Test                | FFmpeg-H.264-v4l2m2m |
| ------------------- | -------------------- |
| TOTAL               | 23/69                |
| TOTAL TIME          | 182.362s             |
| -                   | -                    |
| alphaconformanceG   | OK                   |
| brcm_freh10         | ER                   |
| brcm_freh11         | ER                   |
| brcm_freh3          | OK                   |
| brcm_freh4          | ER                   |
| brcm_freh5          | ER                   |
| brcm_freh6          | ER                   |
| brcm_freh8          | OK                   |
| brcm_freh9          | OK                   |
| FREH10-1            | ER                   |
| FREH10-2            | ER                   |
| freh12_b            | OK                   |
| freh1_b             | OK                   |
| freh2_b             | OK                   |
| freh7_b             | ER                   |
| FREXT01_JVC_D       | ER                   |
| FREXT02_JVC_C       | ER                   |
| FRExt1_Panasonic_D  | OK                   |
| FREXT1_TANDBERG_A   | ER                   |
| FRExt2_Panasonic_C  | ER                   |
| FREXT2_TANDBERG_A   | ER                   |
| FRExt3_Panasonic_E  | OK                   |
| FREXT3_TANDBERG_A   | ER                   |
| FRExt4_Panasonic_B  | ER                   |
| FRExt_MMCO4_Sony_B  | OK                   |
| HCAFF1_HHI_B        | ER                   |
| HCAFR1_HHI_C        | OK                   |
| HCAFR2_HHI_A        | OK                   |
| HCAFR3_HHI_A        | OK                   |
| HCAFR4_HHI_A        | OK                   |
| HCAMFF1_HHI_B       | ER                   |
| HCHP1_HHI_B         | OK                   |
| HCHP2_HHI_A         | OK                   |
| HCHP3_HHI_A         | ER                   |
| Hi422FR10_SONY_A    | ER                   |
| Hi422FR11_SONY_A    | ER                   |
| Hi422FR12_SONY_A    | ER                   |
| Hi422FR13_SONY_A    | ER                   |
| Hi422FR14_SONY_A    | ER                   |
| Hi422FR15_SONY_A    | ER                   |
| Hi422FR1_SONY_A     | ER                   |
| Hi422FR2_SONY_A     | ER                   |
| Hi422FR3_SONY_A     | ER                   |
| Hi422FR4_SONY_A     | ER                   |
| Hi422FR6_SONY_A     | ER                   |
| Hi422FR7_SONY_A     | ER                   |
| Hi422FR8_SONY_A     | ER                   |
| Hi422FR9_SONY_A     | ER                   |
| Hi422FREXT16_SONY_A | ER                   |
| Hi422FREXT17_SONY_A | ER                   |
| Hi422FREXT18_SONY_A | ER                   |
| Hi422FREXT19_SONY_A | ER                   |
| HPCA_BRCM_C         | OK                   |
| HPCADQ_BRCM_B       | OK                   |
| HPCAFL_BRCM_C       | ER                   |
| HPCAFLNL_BRCM_C     | ER                   |
| HPCALQ_BRCM_B       | OK                   |
| HPCAMAPALQ_BRCM_B   | ER                   |
| HPCAMOLQ_BRCM_B     | ER                   |
| HPCANL_BRCM_C       | OK                   |
| HPCAQ2LQ_BRCM_B     | OK                   |
| HPCV_BRCM_A         | OK                   |
| HPCVFL_BRCM_A       | ER                   |
| HPCVFLNL_BRCM_A     | ER                   |
| HPCVMOLQ_BRCM_B     | ER                   |
| HPCVNL_BRCM_A       | OK                   |
| HVLCFI0_Sony_B      | ER                   |
| HVLCMFF0_Sony_B     | ER                   |
| HVLCPFF0_Sony_B     | ER                   |
| -                   | -                    |
| Test                | FFmpeg-H.264-v4l2m2m |
| TOTAL               | 23/69                |
| TOTAL TIME          | 182.362s             |

NOTE: The ER (ERROR) streams are not supported by the decoder.
      The driver print error message "Unsupported stream"

- JVT-MVC

| Test       | FFmpeg-H.264-v4l2m2m |
| ---------- | -------------------- |
| TOTAL      | 18/20                |
| TOTAL TIME | 147.076s             |
| -          | -                    |
| MVCDS-4    | OK                   |
| MVCDS-5    | OK                   |
| MVCDS-6    | OK                   |
| MVCDS1     | OK                   |
| MVCDS2     | OK                   |
| MVCDS3     | OK                   |
| MVCICT-1   | ER                   |
| MVCICT-2   | ER                   |
| MVCNV-2    | OK                   |
| MVCNV-3    | OK                   |
| MVCNV1     | OK                   |
| MVCNV4     | OK                   |
| MVCRP_1    | OK                   |
| MVCRP_2    | OK                   |
| MVCRP_3    | OK                   |
| MVCRP_4    | OK                   |
| MVCRP_5    | OK                   |
| MVCRP_6    | OK                   |
| MVCSPS-1   | OK                   |
| MVCSPS-2   | OK                   |
| -          | -                    |
| Test       | FFmpeg-H.264-v4l2m2m |
| TOTAL      | 18/20                |
| TOTAL TIME | 147.076s             |

- JVT-SVC


| Test            | FFmpeg-H.264-v4l2m2m |
| --------------- | -------------------- |
| TOTAL           | 75/185               |
| TOTAL TIME      | 727.240s             |
| -               | -                    |
| SVCBC-1-L0      | OK                   |
| SVCBC-1-L1      | KO                   |
| SVCBCT-1-L0     | OK                   |
| SVCBCT-1-L1     | KO                   |
| SVCBCTS-1-r1-L0 | OK                   |
| SVCBCTS-1-r1-L1 | KO                   |
| SVCBCTS-1-r1-L2 | KO                   |
| SVCBCTS-2-r1-L0 | OK                   |
| SVCBCTS-2-r1-L1 | KO                   |
| SVCBCTS-2-r1-L2 | KO                   |
| SVCBCTS-3-L0    | OK                   |
| SVCBCTS-3-L1    | KO                   |
| SVCBCTS-3-L2    | KO                   |
| SVCBM-1-L0      | OK                   |
| SVCBM-1-L1      | KO                   |
| SVCBM-2-L0      | OK                   |
| SVCBM-2-L1      | KO                   |
| SVCBM-3-L0      | OK                   |
| SVCBM-3-L1      | KO                   |
| SVCBM-4-r1-L0   | OK                   |
| SVCBM-4-r1-L1   | KO                   |
| SVCBM-4-r1-L2   | KO                   |
| SVCBM-5-L0      | OK                   |
| SVCBM-5-L1      | KO                   |
| SVCBM-5-L2      | KO                   |
| SVCBM-5-L3      | KO                   |
| SVCBMST-1-L0    | OK                   |
| SVCBMST-1-L1    | KO                   |
| SVCBMST-1-L2    | KO                   |
| SVCBMST-2-L0    | OK                   |
| SVCBMST-2-L1    | KO                   |
| SVCBMST-2-L2    | KO                   |
| SVCBMST-3-L0    | OK                   |
| SVCBMST-3-L1    | KO                   |
| SVCBMST-3-L2    | KO                   |
| SVCBMT-1-L0     | OK                   |
| SVCBMT-1-L1     | KO                   |
| SVCBMT-10-L0    | OK                   |
| SVCBMT-10-L1    | KO                   |
| SVCBMT-11-L0    | OK                   |
| SVCBMT-11-L1    | KO                   |
| SVCBMT-12-L0    | OK                   |
| SVCBMT-12-L1    | KO                   |
| SVCBMT-13-L0    | OK                   |
| SVCBMT-13-L1    | KO                   |
| SVCBMT-13-L2    | KO                   |
| SVCBMT-2-L0     | OK                   |
| SVCBMT-2-L1     | KO                   |
| SVCBMT-3-L0     | OK                   |
| SVCBMT-3-L1     | KO                   |
| SVCBMT-4-L0     | OK                   |
| SVCBMT-4-L1     | KO                   |
| SVCBMT-5-L0     | OK                   |
| SVCBMT-5-L1     | KO                   |
| SVCBMT-6-L0     | OK                   |
| SVCBMT-6-L1     | KO                   |
| SVCBMT-7-L0     | OK                   |
| SVCBMT-7-L1     | KO                   |
| SVCBMT-8-L0     | OK                   |
| SVCBMT-8-L1     | KO                   |
| SVCBMT-9-L0     | OK                   |
| SVCBMT-9-L1     | KO                   |
| SVCBS-1-L0      | OK                   |
| SVCBS-1-L1      | KO                   |
| SVCBS-2-L0      | OK                   |
| SVCBS-2-L1      | KO                   |
| SVCBS-3-r1-L0   | OK                   |
| SVCBS-3-r1-L1   | KO                   |
| SVCBS-4-r1-L0   | OK                   |
| SVCBS-4-r1-L1   | KO                   |
| SVCBS-5-r1-L0   | OK                   |
| SVCBS-5-r1-L1   | KO                   |
| SVCBS-6-r1-L0   | OK                   |
| SVCBS-6-r1-L1   | KO                   |
| SVCBS-6-r1-L2   | KO                   |
| SVCBS-7-L0      | OK                   |
| SVCBS-7-L1      | KO                   |
| SVCBS-8-L0      | OK                   |
| SVCBS-8-L1      | KO                   |
| SVCBST-1-L0     | OK                   |
| SVCBST-1-L1     | KO                   |
| SVCBST-10-r1-L0 | OK                   |
| SVCBST-10-r1-L1 | KO                   |
| SVCBST-11-r1-L0 | OK                   |
| SVCBST-11-r1-L1 | KO                   |
| SVCBST-12-r1-L0 | OK                   |
| SVCBST-12-r1-L1 | KO                   |
| SVCBST-13-L0    | OK                   |
| SVCBST-13-L1    | KO                   |
| SVCBST-14-L0    | OK                   |
| SVCBST-14-L1    | KO                   |
| SVCBST-14-L2    | KO                   |
| SVCBST-15-L0    | OK                   |
| SVCBST-15-L1    | KO                   |
| SVCBST-15-L2    | KO                   |
| SVCBST-16-r1-L0 | OK                   |
| SVCBST-16-r1-L1 | KO                   |
| SVCBST-16-r1-L2 | KO                   |
| SVCBST-17-r1-L0 | OK                   |
| SVCBST-17-r1-L1 | KO                   |
| SVCBST-17-r1-L2 | KO                   |
| SVCBST-18-r1-L0 | OK                   |
| SVCBST-18-r1-L1 | KO                   |
| SVCBST-18-r1-L2 | KO                   |
| SVCBST-19-L0    | OK                   |
| SVCBST-19-L1    | KO                   |
| SVCBST-2-L0     | OK                   |
| SVCBST-2-L1     | KO                   |
| SVCBST-20-L0    | OK                   |
| SVCBST-20-L1    | KO                   |
| SVCBST-3-L0     | OK                   |
| SVCBST-3-L1     | KO                   |
| SVCBST-4-L0     | OK                   |
| SVCBST-4-L1     | KO                   |
| SVCBST-5-L0     | OK                   |
| SVCBST-5-L1     | KO                   |
| SVCBST-6-r1-L0  | OK                   |
| SVCBST-6-r1-L1  | KO                   |
| SVCBST-7-r1-L0  | OK                   |
| SVCBST-7-r1-L1  | KO                   |
| SVCBST-8-r1-L0  | OK                   |
| SVCBST-8-r1-L1  | KO                   |
| SVCBST-9-r1-L0  | OK                   |
| SVCBST-9-r1-L1  | KO                   |
| SVCBSTC-1-L0    | OK                   |
| SVCBSTC-1-L1    | KO                   |
| SVCBSTC-1-L2    | KO                   |
| SVCHCTS-1-r1-L0 | OK                   |
| SVCHCTS-1-r1-L1 | KO                   |
| SVCHCTS-1-r1-L2 | KO                   |
| SVCHCTS-1-r1-L3 | KO                   |
| SVCHCTS-1-r1-L4 | KO                   |
| SVCHCTS-1-r1-L5 | KO                   |
| SVCHCTS-1-r1-L6 | KO                   |
| SVCHCTS-1-r1-L7 | KO                   |
| SVCHICS-1-L0    | OK                   |
| SVCHICS-1-L1    | KO                   |
| SVCHICS-1-L2    | KO                   |
| SVCHICS-1-L3    | KO                   |
| SVCHIS-1-L0     | OK                   |
| SVCHIS-1-L1     | KO                   |
| SVCHIS-1-L2     | KO                   |
| SVCHIS-2-L0     | OK                   |
| SVCHIS-2-L1     | KO                   |
| SVCHIS-2-L2     | KO                   |
| SVCHIS-3-L0     | OK                   |
| SVCHIS-3-L1     | KO                   |
| SVCHIS-3-L2     | KO                   |
| SVCHM-1-L0      | OK                   |
| SVCHM-1-L1      | KO                   |
| SVCHM-1-L2      | KO                   |
| SVCHM-1-L3      | KO                   |
| SVCHM-2-L0      | OK                   |
| SVCHM-2-L1      | OK                   |
| SVCHM-3-L0      | OK                   |
| SVCHM-3-L1      | OK                   |
| SVCHM-4-L0      | OK                   |
| SVCHM-4-L1      | OK                   |
| SVCHM-4-L2      | OK                   |
| SVCHMTS-1-r1-L0 | OK                   |
| SVCHMTS-1-r1-L1 | KO                   |
| SVCHMTS-1-r1-L2 | KO                   |
| SVCHMTS-1-r1-L3 | KO                   |
| SVCHMTS-1-r1-L4 | KO                   |
| SVCHMTS-1-r1-L5 | KO                   |
| SVCHMTS-2-r1-L0 | OK                   |
| SVCHMTS-2-r1-L1 | KO                   |
| SVCHMTS-2-r1-L2 | KO                   |
| SVCHS-1-r1-L0   | OK                   |
| SVCHS-1-r1-L1   | KO                   |
| SVCHS-2-r1-L0   | OK                   |
| SVCHS-2-r1-L1   | KO                   |
| SVCHST-1-r1-L0  | OK                   |
| SVCHST-1-r1-L1  | KO                   |
| SVCHST-1-r1-L2  | KO                   |
| SVCHST-2-r1-L0  | OK                   |
| SVCHST-2-r1-L1  | KO                   |
| SVCHST-2-r1-L2  | KO                   |
| SVCHST-3-r1-L0  | ER                   |
| SVCHST-3-r1-L1  | ER                   |
| SVCHST-4-r1-L0  | ER                   |
| SVCHST-4-r1-L1  | ER                   |
| SVCHSTC-1-r1-L0 | OK                   |
| SVCHSTC-1-r1-L1 | KO                   |
| SVCHSTC-1-r1-L2 | KO                   |
| -               | -                    |
| Test            | FFmpeg-H.264-v4l2m2m |
| TOTAL           | 75/185               |
| TOTAL TIME      | 727.240s             |

NOTE: The current implementation of the decoder only supports Layer 0 (base layer) processing.
When attempting to decode streams that contain multiple layers (such as scalable or multi-view content), the decoding operation fails.
This limitation means that enhanced features requiring layer-based processing beyond the base layer cannot be properly handled by the current decoder.
For successful decoding, input streams must be limited to single-layer content only.

[FLUSTER REPORT FOR THE H.265]

| -                               | -                    |
| AMP_A_Samsung_7                 | OK                   |
| AMP_B_Samsung_7                 | OK                   |
| AMP_D_Hisilicon_3               | OK                   |
| AMP_E_Hisilicon_3               | OK                   |
| AMP_F_Hisilicon_3               | ER                   |
| AMVP_A_MTK_4                    | ER                   |
| AMVP_B_MTK_4                    | OK                   |
| AMVP_C_Samsung_7                | ER                   |
| BUMPING_A_ericsson_1            | OK                   |
| CAINIT_A_SHARP_4                | OK                   |
| CAINIT_B_SHARP_4                | OK                   |
| CAINIT_C_SHARP_3                | OK                   |
| CAINIT_D_SHARP_3                | OK                   |
| CAINIT_E_SHARP_3                | OK                   |
| CAINIT_F_SHARP_3                | OK                   |
| CAINIT_G_SHARP_3                | OK                   |
| CAINIT_H_SHARP_3                | OK                   |
| CIP_A_Panasonic_3               | OK                   |
| cip_B_NEC_3                     | OK                   |
| CIP_C_Panasonic_2               | OK                   |
| CONFWIN_A_Sony_1                | OK                   |
| DBLK_A_MAIN10_VIXS_4            | ER                   |
| DBLK_A_SONY_3                   | OK                   |
| DBLK_B_SONY_3                   | OK                   |
| DBLK_C_SONY_3                   | OK                   |
| DBLK_D_VIXS_2                   | OK                   |
| DBLK_E_VIXS_2                   | OK                   |
| DBLK_F_VIXS_2                   | OK                   |
| DBLK_G_VIXS_2                   | OK                   |
| DELTAQP_A_BRCM_4                | OK                   |
| DELTAQP_B_SONY_3                | OK                   |
| DELTAQP_C_SONY_3                | OK                   |
| DSLICE_A_HHI_5                  | OK                   |
| DSLICE_B_HHI_5                  | OK                   |
| DSLICE_C_HHI_5                  | OK                   |
| ENTP_A_QUALCOMM_1               | OK                   |
| ENTP_B_Qualcomm_1               | OK                   |
| ENTP_C_Qualcomm_1               | OK                   |
| EXT_A_ericsson_4                | OK                   |
| FILLER_A_Sony_1                 | OK                   |
| HRD_A_Fujitsu_3                 | OK                   |
| INITQP_A_Sony_1                 | OK                   |
| INITQP_B_Main10_Sony_1          | ER                   |
| ipcm_A_NEC_3                    | OK                   |
| ipcm_B_NEC_3                    | OK                   |
| ipcm_C_NEC_3                    | OK                   |
| ipcm_D_NEC_3                    | OK                   |
| ipcm_E_NEC_2                    | OK                   |
| IPRED_A_docomo_2                | OK                   |
| IPRED_B_Nokia_3                 | OK                   |
| IPRED_C_Mitsubishi_3            | OK                   |
| LS_A_Orange_2                   | OK                   |
| LS_B_Orange_4                   | OK                   |
| LTRPSPS_A_Qualcomm_1            | KO                   |
| MAXBINS_A_TI_5                  | OK                   |
| MAXBINS_B_TI_5                  | OK                   |
| MAXBINS_C_TI_5                  | OK                   |
| MERGE_A_TI_3                    | OK                   |
| MERGE_B_TI_3                    | OK                   |
| MERGE_C_TI_3                    | OK                   |
| MERGE_D_TI_3                    | OK                   |
| MERGE_E_TI_3                    | OK                   |
| MERGE_F_MTK_4                   | OK                   |
| MERGE_G_HHI_4                   | OK                   |
| MVCLIP_A_qualcomm_3             | OK                   |
| MVDL1ZERO_A_docomo_4            | OK                   |
| MVEDGE_A_qualcomm_3             | OK                   |
| NoOutPrior_A_Qualcomm_1         | OK                   |
| NoOutPrior_B_Qualcomm_1         | OK                   |
| NUT_A_ericsson_5                | OK                   |
| OPFLAG_A_Qualcomm_1             | OK                   |
| OPFLAG_B_Qualcomm_1             | OK                   |
| OPFLAG_C_Qualcomm_1             | OK                   |
| PICSIZE_A_Bossen_1              | OK                   |
| PICSIZE_B_Bossen_1              | ER                   |
| PICSIZE_C_Bossen_1              | OK                   |
| PICSIZE_D_Bossen_1              | ER                   |
| PMERGE_A_TI_3                   | OK                   |
| PMERGE_B_TI_3                   | OK                   |
| PMERGE_C_TI_3                   | OK                   |
| PMERGE_D_TI_3                   | OK                   |
| PMERGE_E_TI_3                   | OK                   |
| POC_A_Bossen_3                  | OK                   |
| PPS_A_qualcomm_7                | OK                   |
| PS_B_VIDYO_3                    | ER                   |
| RAP_A_docomo_6                  | OK                   |
| RAP_B_Bossen_2                  | OK                   |
| RPLM_A_qualcomm_4               | OK                   |
| RPLM_B_qualcomm_4               | OK                   |
| RPS_A_docomo_5                  | OK                   |
| RPS_B_qualcomm_5                | OK                   |
| RPS_C_ericsson_5                | OK                   |
| RPS_D_ericsson_6                | OK                   |
| RPS_E_qualcomm_5                | OK                   |
| RPS_F_docomo_2                  | OK                   |
| RQT_A_HHI_4                     | OK                   |
| RQT_B_HHI_4                     | OK                   |
| RQT_C_HHI_4                     | OK                   |
| RQT_D_HHI_4                     | OK                   |
| RQT_E_HHI_4                     | OK                   |
| RQT_F_HHI_4                     | OK                   |
| RQT_G_HHI_4                     | OK                   |
| SAO_A_MediaTek_4                | OK                   |
| SAO_B_MediaTek_5                | OK                   |
| SAO_C_Samsung_5                 | OK                   |
| SAO_D_Samsung_5                 | OK                   |
| SAO_E_Canon_4                   | OK                   |
| SAO_F_Canon_3                   | OK                   |
| SAO_G_Canon_3                   | OK                   |
| SAO_H_Parabola_1                | OK                   |
| SAODBLK_A_MainConcept_4         | OK                   |
| SAODBLK_B_MainConcept_4         | OK                   |
| SDH_A_Orange_4                  | OK                   |
| SLICES_A_Rovi_3                 | OK                   |
| SLIST_A_Sony_5                  | OK                   |
| SLIST_B_Sony_9                  | OK                   |
| SLIST_C_Sony_4                  | OK                   |
| SLIST_D_Sony_9                  | OK                   |
| SLPPLP_A_VIDYO_2                | ER                   |
| STRUCT_A_Samsung_7              | ER                   |
| STRUCT_B_Samsung_7              | ER                   |
| TILES_A_Cisco_2                 | ER                   |
| TILES_B_Cisco_1                 | ER                   |
| TMVP_A_MS_3                     | OK                   |
| TSCL_A_VIDYO_5                  | OK                   |
| TSCL_B_VIDYO_4                  | ER                   |
| TSKIP_A_MS_3                    | OK                   |
| TSUNEQBD_A_MAIN10_Technicolor_2 | ER                   |
| TUSIZE_A_Samsung_1              | OK                   |
| VPSID_A_VIDYO_2                 | ER                   |
| VPSSPSPPS_A_MainConcept_1       | KO                   |
| WP_A_MAIN10_Toshiba_3           | ER                   |
| WP_A_Toshiba_3                  | ER                   |
| WP_B_Toshiba_3                  | OK                   |
| WP_MAIN10_B_Toshiba_3           | ER                   |
| WPP_A_ericsson_MAIN10_2         | ER                   |
| WPP_A_ericsson_MAIN_2           | OK                   |
| WPP_B_ericsson_MAIN10_2         | ER                   |
| WPP_B_ericsson_MAIN_2           | OK                   |
| WPP_C_ericsson_MAIN10_2         | ER                   |
| WPP_C_ericsson_MAIN_2           | OK                   |
| WPP_D_ericsson_MAIN10_2         | ER                   |
| WPP_D_ericsson_MAIN_2           | OK                   |
| WPP_E_ericsson_MAIN10_2         | ER                   |
| WPP_E_ericsson_MAIN_2           | OK                   |
| WPP_F_ericsson_MAIN10_2         | ER                   |
| WPP_F_ericsson_MAIN_2           | OK                   |
| -                               | -                    |
| Test                            | FFmpeg-H.265-v4l2m2m |
| TOTAL                           | 120/147              |
| TOTAL TIME                      | 12669.641s           |


Failed streams :
 - VPSSPSPPS_A_MainConcept_1 : Failed due to evolutive dynamic resolution increases. The decoder cannot properly handle upward resolution changes within the same stream.
 - LTRPSPS_A_Qualcomm_1

This patch series introduces a new stateful decoder driver for the
allegrodvt GEN 3 IPs.

Yassine Ouaissa (3):
  media: allegro-dvt: Move the current driver to a subdirectory
  media: allegro-dvt: Add Gen 3 IP stateful decoder driver
  media: allegro-dvt: Add DT-bindings for the Gen 3 IP

 .../bindings/media/allegrodvt,al300-vdec.yaml |   86 +
 .../devicetree/bindings/vendor-prefixes.yaml  |    2 +-
 MAINTAINERS                                   |    5 +-
 drivers/media/platform/allegro-dvt/Kconfig    |   17 +-
 drivers/media/platform/allegro-dvt/Makefile   |    6 +-
 .../media/platform/allegro-dvt/al300/Kconfig  |   12 +
 .../media/platform/allegro-dvt/al300/Makefile |    6 +
 .../allegro-dvt/al300/al_codec_common.c       |  781 +++++++++
 .../allegro-dvt/al300/al_codec_common.h       |  226 +++
 .../allegro-dvt/al300/al_codec_util.c         |  179 ++
 .../allegro-dvt/al300/al_codec_util.h         |  186 ++
 .../platform/allegro-dvt/al300/al_vdec_drv.c  | 1536 +++++++++++++++++
 .../platform/allegro-dvt/al300/al_vdec_drv.h  |   94 +
 .../media/platform/allegro-dvt/zynqmp/Kconfig |   17 +
 .../platform/allegro-dvt/zynqmp/Makefile      |    6 +
 .../allegro-dvt/{ => zynqmp}/allegro-core.c   |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.c   |    0
 .../allegro-dvt/{ => zynqmp}/allegro-mail.h   |    0
 .../allegro-dvt/{ => zynqmp}/nal-h264.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-h264.h       |    0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-hevc.h       |    0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.c       |    0
 .../allegro-dvt/{ => zynqmp}/nal-rbsp.h       |    0
 24 files changed, 3138 insertions(+), 21 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/allegrodvt,al300-vdec.yaml
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/al300/Makefile
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_common.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_codec_util.h
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.c
 create mode 100644 drivers/media/platform/allegro-dvt/al300/al_vdec_drv.h
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Kconfig
 create mode 100644 drivers/media/platform/allegro-dvt/zynqmp/Makefile
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-core.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/allegro-mail.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-h264.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-hevc.h (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.c (100%)
 rename drivers/media/platform/allegro-dvt/{ => zynqmp}/nal-rbsp.h (100%)

-- 
2.30.2

