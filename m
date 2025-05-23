Return-Path: <linux-media+bounces-33265-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 88036AC2466
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 15:46:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id ED6675458A8
	for <lists+linux-media@lfdr.de>; Fri, 23 May 2025 13:45:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0460229552B;
	Fri, 23 May 2025 13:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b="yGRkzs+D"
X-Original-To: linux-media@vger.kernel.org
Received: from PR0P264CU014.outbound.protection.outlook.com (mail-francecentralazon11022080.outbound.protection.outlook.com [40.107.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4D293B74;
	Fri, 23 May 2025 13:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.161.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007815; cv=fail; b=Kx0uINMdfL/GPEfp8tyBM8oulM/4uSUEcHExwuBLJxJJWX+vi2mQDpomTwGKBHYMNsazZItJ8ucspC//vur1yD3fSNz8lVP6oa5clsJGopYYYBkfI5Mlo6TB+FXycV4wd0vNERPVu6j/0pCW44HxrxChNNRkI8IrmDnOVSAUyM4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007815; c=relaxed/simple;
	bh=vvAJRQfz23GtQdDF89uUzwjVerAsYfZTVjZL1QgNeCI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SMDAtg07QON+6hLTW/nAouZRQUjONt9ksnWqOmf+guz/i1Y/+z97Ut5NeMBEj027I0hMQPnKZLuLwJPIP8gTbaINFcMrbrfq0n+tc771ZHDhHpc7Q+uYlgQQoHucL31opbMl65BWfCox3g8DsLt7QFLQIdiMUbqtee5PxYdRRN0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com; spf=pass smtp.mailfrom=allegrodvt.com; dkim=pass (2048-bit key) header.d=allegrodvt.com header.i=@allegrodvt.com header.b=yGRkzs+D; arc=fail smtp.client-ip=40.107.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=allegrodvt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=allegrodvt.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BydErWj6qF4e2MLMD9orwwCSgOJkTawol3J8nI4cMmrLjcsc7HA7+1cEzDDcsUxtam7zUhPrtnRuq6S0Ykt6g6rvKg6AM9yb0orvSWUX2mAktB+RUhISfK6L/N3T7wn7lhqUbQsSUpKvcg5qe5ztwTWo2+9LSQqE9sJZvzsh9sQ9sGWbdezJSUGN7fGdMz3zHOyPe9G6AEIlL9RAK/UpdnQadu1r2ex8MZP0FczQjFamzpLjMQhao+feeLWSaB2z1IdxlRn1A7OV4McDB0jvKrS/Nznsw5Ycgcp4XZQOBi8l4/mAA6NPUii92jnftmSf3n2jhJyEjNHeS1MUt8x25g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGRP3cG/lu4arrN6xyC1FXh51VFrtMBx+8TGypIs0ZY=;
 b=lxjpbcNUeXRVySF5r68XVrUocpwyGQvIdCDCgOl/sls1p4XMl1yD6bPymUZZNQUc2lAygCHUu56vWtPJDk+U16vJiSBFA3KsFsRodo0Gz2hqqF2MBVjUd6Tni9ZfHl4Z2s9l1Boah9GxRMaa3c/knBf3K2EfwL3HaQeivcH2NeVyQD8kdys3K09y/vY7sX2H5TqUN5s9ytXEJ45b3UtyKISnIOT1OUyZ5fDK/k0gmK4xhvYKe7o+aQq87fG58480XV122CWZUnCUcSlUAcIMG0iU0T3tGUkGtH8Nd3P07gQG3YCLgy8tiBg8DJGkIyzIso/no49xJnY0TZQ3vU0OWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=allegrodvt.com; dmarc=pass action=none
 header.from=allegrodvt.com; dkim=pass header.d=allegrodvt.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=allegrodvt.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kGRP3cG/lu4arrN6xyC1FXh51VFrtMBx+8TGypIs0ZY=;
 b=yGRkzs+DlyHAGPlYJZxhSLLDOglSKo7C6O/+Mof/No2BemxnvVj+yn1EoHTk5rIc/CHatt3w7UpO+CuG5gddjVkO/SgUiFgfp0JKpjXc9VhtJ+On3LuibPKa5/SnCbxkx+rcE2SXE6PfkZjFd70OFfr7Z/ZENo6ohqiFy4vL7IdY23bWPUDa12+gaazkNBAFENVoIar3TpgGPI2rnq+RidQgexnbH326KlQeU0RCysr7VlcjnYAM466aqZHm8MHRgaF6tLtPmaBSedWA2FjcCAKMBKjP44OThINaG0XeFkHhEn5MnhpNIuSKu89yaskqICgMZkMqKMDAofb/SEapjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=allegrodvt.com;
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM (2603:10a6:501:3d::18)
 by PARP264MB6043.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:4a6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.23; Fri, 23 May
 2025 13:43:28 +0000
Received: from MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5]) by MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 ([fe80::4281:c926:ecc4:8ba5%2]) with mapi id 15.20.8769.019; Fri, 23 May 2025
 13:43:28 +0000
From: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Tretter <m.tretter@pengutronix.de>,
	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Junhao Xie <bigfoot@classfun.cn>,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Gaosheng Cui <cuigaosheng1@huawei.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/5] MAINTAINERS: Add entry for allegrodvt Gen 3 drivers
Date: Fri, 23 May 2025 15:41:48 +0200
Message-Id: <20250523134207.68481-4-yassine.ouaissa@allegrodvt.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
References: <20250523134207.68481-1-yassine.ouaissa@allegrodvt.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PR0P264CA0184.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:100:1c::28) To MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:501:3d::18)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MR1P264MB3140:EE_|PARP264MB6043:EE_
X-MS-Office365-Filtering-Correlation-Id: 15163bec-7f7f-409e-00a0-08dd99ffcc78
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GUMPiZWgyOzZ0602e069Er/rAc8RbNKFTjpN9WnNOw8tnMTcYI3hwvv8dQ31?=
 =?us-ascii?Q?AHTmUtD4q58WmGAFkUvbyahbgw4Ltbs3N43sdbvAgM6oF2ux916WZfSPdDnU?=
 =?us-ascii?Q?acUcri+OTSy88+wW88WfVhkHGAVID62yw6CS4fFjdwRpC3Bp5NeEkK8BId3A?=
 =?us-ascii?Q?GZaVCm1RjR44AGlQeJDASE+F1jpED1oZztK6+cUaCNsKtpZDHK+fdsrbviua?=
 =?us-ascii?Q?khjgM5CS41VHPNp92FruYR9Es/2Rnh+YbO6CuqafP8iK61LubIPwLbc1HFt0?=
 =?us-ascii?Q?GvrfiaWFwPjnCvwUHXNVODeLBcsZ+4u3jXh1laH5RBBi5eCtckQU35C7nQpJ?=
 =?us-ascii?Q?Z/MHAuKGWUQfh+gD/ql52zcv3QeYFIvxgliTTx13Bb9gZ+EpuTNnTeY2plvG?=
 =?us-ascii?Q?41gzaOIlcfr+jCwDAfMGiAX1wqf9VA06VXugF6AR1+8D4UKzoTD7GXoBSHav?=
 =?us-ascii?Q?I3vLxfz/PNyuQlJzITxaNhEsvyYcKRFLF29a9zwJXcFaaX6J99Py2agRaz7K?=
 =?us-ascii?Q?FnZfkjrydV9fc+OaceMPbMLigsMDiq4kAJ/jBVdC+0FC16HYRNoq6rrSQdix?=
 =?us-ascii?Q?txBYulQR4d87SIrFrGXridCI7K01/9S8Td+mm3LkvGevzD6V38mH3MdlNmAD?=
 =?us-ascii?Q?JWfkRHYGjJjIX8XNbOj3bAH9Cn79c4dbpd+PEJRaODUGTOPLFIt7Al7IBhaN?=
 =?us-ascii?Q?guwRo9EZtRGHunAsTP5u10A8gtDxMLSrnzeYKvlU7QTJmJzCM/7uyQ5ZVkbU?=
 =?us-ascii?Q?XS5OnMKhbXl2SyOqwr3/3CRsyzs4nmBcuwYYcIkoaPNd+WxSCXCI3RedB3Y+?=
 =?us-ascii?Q?BaS30gokbDlNbckn6nVsiXtaeibt4pQmaAjrJJBzFHqkW6L9YxvIvdf6WOu0?=
 =?us-ascii?Q?sBarKTnVejU7K5ba2za+Jba+I6zxsgsnP4z5KxFsAUKz8Hwn12gUHMuOWzFR?=
 =?us-ascii?Q?uveCz6oJQInRkZD26cHQnJHO7Yxb4LGdxPO4bETI4NZP275eD0Je1piPFaEB?=
 =?us-ascii?Q?XAzIBb77Kdslvv2YyDO5gWJS8wWon79GCE5gfxc7qya49eHzuSfTOp7kksA1?=
 =?us-ascii?Q?jlodICT7++H5rNPI3sBl2NYuj+ZswBju3orRttlsVGvtx1tw/BWLZxrcnq6t?=
 =?us-ascii?Q?Ddkb9LdIoR+X/he57paN7O5VgUz5fTlL/qDOuVRmjD9Ej7B/VD4ZZgpKbvU0?=
 =?us-ascii?Q?pUCssSgqGkI41Ffp0ZS4ZORD/dN6C7oeO0VEgcBvf66HKZFcOqapMW7GfILR?=
 =?us-ascii?Q?7bMK2CB2CAnOGupLw7bDtyeevzvoF3hnU2AdBfYYnLGIkDLjG4rKO/M73jEO?=
 =?us-ascii?Q?eZigwXu6BTp/y1SYl4SLfncX5brSe4dASONgRC0+fFSjRr+zuMNFjmwo8tLa?=
 =?us-ascii?Q?23o9kG+p2Ctk/D31Qn8rX21BjhJpfJaGWTf7b9J4KM/2gE4+3b0AEXcFOopT?=
 =?us-ascii?Q?58QbIqGlhu/FHk1pSL5JxCRSZIoGT+ggiBv6ItBFxvV1OYp9TKBAbg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?PxqQbO+c0RYTsl9hDn3Sp5Konn1MprUaGih77kRmH25NYKK2PUlUVZsEnOIa?=
 =?us-ascii?Q?9sJOqKZSboM7vaEusNnVCoOo04YeJL3jYh1VRY6WVlj9r90tN2W3APHgiEN+?=
 =?us-ascii?Q?XyFD3zb7O5CuDks8+floxBUPUhwm8DJI98616/df1QNGAbuN0WMMR1cZ1kJn?=
 =?us-ascii?Q?VAzWGxiF9r484aKe5aIeTds27RoBSfMGEFVhr9Hf+A3bxfjYyDsOuUVQ3BkC?=
 =?us-ascii?Q?aCMK9rSVfj82cSAXSgBlySpbn/n/H9KjIdhKop/CoR0ZS8KFzSeJd19vptes?=
 =?us-ascii?Q?HnFJSDJw3b83sM8/Od0zA7qbhddd5sSlP3DTGX8Z2+p3NTPQLKvTZSEVWwkF?=
 =?us-ascii?Q?W1HaBXtn9YIEPn5oYeDksPi9nO5MO9HmadzAsi87+Bl+CRraTEX/o8u0mrIo?=
 =?us-ascii?Q?GNCq/wkcE29Ic28zledMZfwE4qkv5Ov3jAouFeqz7CHxQg1MqbuLmAVInwr3?=
 =?us-ascii?Q?VpB7BgRCnn8iOXzLZ5wpt/fnyMpYmb//BMvz+EzIM03GwB9oae6uBB0oF1ye?=
 =?us-ascii?Q?G/YyJg+zUxyVSCfcBh20/d5m8vjW8d/YPGeXYNHCylyYY3imraFy0yYoOwLZ?=
 =?us-ascii?Q?zHo02i3DEQX/2oBac/wYMqufW3FIqg9LOMEHHnJ89p5lizxQSz3SniumMLDk?=
 =?us-ascii?Q?I7SQvSJS3uvO269IUKgcoEhzTAt5dI9+aAIQzX+sUa1BvEuFLZJV7goqBexG?=
 =?us-ascii?Q?2elXw+g2/fA664w34MBiDE5B5reVSRjCVZdGgZrWeBI6pQgXd6ZNsFthe7WY?=
 =?us-ascii?Q?P6ifNKS/Q3LyrKzUK2rHRnk8dXwkiizp+8oN7S3b34YSEw4XzyNHne1G+p/s?=
 =?us-ascii?Q?tIxulPKmuGPj+X2kx0GGNjAvknx6m9r+n0qZbG+cEoM5AySmcQd+VVJF6q9W?=
 =?us-ascii?Q?sA5lzu+1QKo5q1wjlmdfLdX2BLegUho/g5bc7XULC4vD/PkPlSrACj26//aH?=
 =?us-ascii?Q?F5KVKbupd3vKLJP7xpZIX2pksGQCksUBYgG9moNNeln7rppvzADNIL9RVvbs?=
 =?us-ascii?Q?6P1nMLW/Zpjw5O4MHvT3fQnd0L/P5X4ryr8JfbielDeWwDSKIJE3Yx2gvHJN?=
 =?us-ascii?Q?hEClYezjRLuzXY1MmOogekfIgoL0ehCJYuGHl6SyfmIMkW2dgIOfvtAJ9XA8?=
 =?us-ascii?Q?D1NiN0ToJvd99trvtFOErZlWRmEat/YCDrduTNa/FTodjlyNLyPiYReBhPMa?=
 =?us-ascii?Q?xmh2aM4jbZvBlbE3hHp0rmlAyuibCDVQwn3L4WDbm4LHDxZPtjmqA/yUlDB9?=
 =?us-ascii?Q?5kPtNBvFj+FTleCWx4P+7wmVKNad1jriVC3gAhQdUFK01YCTphRgMz0R+Ngk?=
 =?us-ascii?Q?L7YICfTJTeBUMW2lwciG57c8esPc1VKJZQXwVWgwoKoZJZAGjlBAUvLr5tD3?=
 =?us-ascii?Q?t0Ji6M0NRkYmzzprcB8F0eTKR5yhA9juQEH96Xdu54AdTSlPVFmweeM25eWc?=
 =?us-ascii?Q?r3HKshnS8TrHQUZ+lZt1Um37R39Q5bmBtHET5SCe2zhsr8Q/Y4fkx2oHd0lp?=
 =?us-ascii?Q?VBYGOMFleRtRMePW3yDCiquN0DwGupauIsKlsbdJ/x4kzODbiF2ngKv4MXMG?=
 =?us-ascii?Q?r/zln1+BSCUGEh5rPQtJZekEpba0s/HCoqw+FtBEgK21fs/ij7Y7BxVqgyOM?=
 =?us-ascii?Q?mYE0ZjVCAtAyCrCumOS1m0wkZaLxr1pIJqnmnWBEkLx+Av4ptns4KnOA9/CM?=
 =?us-ascii?Q?cMFa7Q=3D=3D?=
X-OriginatorOrg: allegrodvt.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15163bec-7f7f-409e-00a0-08dd99ffcc78
X-MS-Exchange-CrossTenant-AuthSource: MR1P264MB3140.FRAP264.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2025 13:43:28.4241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 6c7a5ec0-2d92-465a-a3e1-9e3f1e9fd917
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnYHKoEZ+XOYwHgFLjfdOV2IDI5l3mrIm7IdZL0M/GPcpIQZCTb7Vz72vSB/KzyM84j1D+khpzPn9Td1v+dPHy/C0WiiHAzvDGAhokzcfl0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PARP264MB6043

Add my self as maintainer of the allegrodvt Gen drivers

Signed-off-by: Yassine Ouaissa <yassine.ouaissa@allegrodvt.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e59011a36e6b..9285bb2f43d9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -802,6 +802,7 @@ F:	drivers/platform/x86/dell/alienware-wmi*
 
 ALLEGRO DVT VIDEO IP CORE DRIVER
 M:	Michael Tretter <m.tretter@pengutronix.de>
+M:	Yassine OUAISSA <yassine.ouaissa@allegrodvt.com>
 R:	Pengutronix Kernel Team <kernel@pengutronix.de>
 L:	linux-media@vger.kernel.org
 S:	Maintained
-- 
2.30.2


