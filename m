Return-Path: <linux-media+bounces-23608-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AA849F504C
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 17:07:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8992816221D
	for <lists+linux-media@lfdr.de>; Tue, 17 Dec 2024 16:06:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE5CB1F9AAC;
	Tue, 17 Dec 2024 15:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="nh5B+Mcf"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11023088.outbound.protection.outlook.com [52.101.67.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A6A1DA109;
	Tue, 17 Dec 2024 15:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.67.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734450926; cv=fail; b=nTQZW2CF762xT/e9uvG6CBzNnzU7TUhirqXQugnJbOp1qNZ9LvLQRb1loSDYiKw+dHVnvrqDkG0uyYM6A3gZRX38zJvboo0x9sPrn95g4nzxwC/BE2g9x8TmTfKI6pd0c6owJmAubI5Ub0Ipxsg+wcd9fdlloggHGf2YJK9n4V0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734450926; c=relaxed/simple;
	bh=84dAzvqqi6ZbaS/ArkaMH7z+FZ528a0O4/ApO7qsY2M=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=ACrT9komUOd2W2FjCdlgcKZuVpFXHge+V2uwE/Y92ALggDvJM37IjeE6F5lwH3naiHrtIqvoCbeYgiTZKlyWw+KFol6ChN5ZMQZErwPzzYWI1ol/7EzaTTeFGfgtcIfrp4w3fGn4gSG5bBB51E1/V+U5E+AthT6btr5HLBiZe0E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=nh5B+Mcf; arc=fail smtp.client-ip=52.101.67.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqvZIFR6M++5CyDhub1V16ihkXERokqfRApjqLgvsQxKVyijLZcIasZZXyWeItT0F2JAR4j+nXnuXsHXiOziSJUtedD7nFMhGq+HLwsQ4We1y+YJ4ss5ulXMHsfoLtMoE9RGT+pA9ER+Jady2FtL+bZiBAXA5FFu77EtKD1idCJU1MXbbw3swBKuPAWRlrql6XlCdEZvr92F32U8VYOzW8+vE+17SyIgx/9SysowoSMBfCnijzbfwf7p5XxgI3OF80nuZIayGdv6jGCtyEKy4RijQe6vnQcSXqxVQjOgFxtWxWarqFLLANPtWO+punce3pEN7OgHlYGggau7Q41KDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLUB6MPewbyNQIpMjX0irXUit4lYkxxXdSgzqb+dSWE=;
 b=CujlkRcCdte+rV4onyfXNg5FtcP3CP/DCnzTvMDpQKAu4UCPtlNHXa1achFfkfn1Scyk1hXInV8+zQHO2wbDU75x+Tf8ZxBIQtCnUn266gf99wBkjm5ySVcgxP6h5WUa1jXjsiv+T/quGraw+E94nwSg675a0lZbkW4ehgluFie9W2bQ8ckhKix37376XIJ6y5XsnDQXH3pinZ+lJMyy+NLGtvvG2eYsd8nK9ZOSfxFQBqazSN8Lwqc/SrDzWBsR5+ZvuGrBC8DvmSmYRbwQgOCpuWUI6mUqPHYgizAr4G/PPv1Kxxriv2TqeGpXc3V84981DkMDeZ2I10RXNDDWHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLUB6MPewbyNQIpMjX0irXUit4lYkxxXdSgzqb+dSWE=;
 b=nh5B+McfXeWnl8mqVT9jzwwb4l4/xyqoouuKPdkCLsQ8AQdu82OwIgsyqlzgK1XWu97wL1kGBugqsJRAYu6iOb843uMvgok/RoFmHP5h2KHEtwlgJKPtTKAsARU5aW/rU7LoMW3un1IggzQguZUTbSvE+y9pCcCDVT3al55Zjmo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS8PR08MB10149.eurprd08.prod.outlook.com (2603:10a6:20b:63f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.21; Tue, 17 Dec
 2024 15:55:20 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 15:55:20 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Subject: [PATCH v2 0/6] media: rockchip: add a driver for the rockchip
 camera interface (cif)
Date: Tue, 17 Dec 2024 16:55:12 +0100
Message-Id: <20241217-v6-8-topic-rk3568-vicap-v2-0-b1d488fcc0d3@wolfvision.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAOCeYWcC/4WPQQ7CIBREr2JY+w1QSlpX3sN0ARTkR4UGGtQ0v
 bu0HsDlm8lkZhaSbUKbyfmwkGQLZoyhAj8eiPEq3CzgWJlwygXlnEKR0MEcJzSQ7k0rOyho1AS
 6143re946IUhNa5Ut6KSC8Vv+af2IUFizeVOyDt9763Wo7DHPMX32EYVt6v++woAClx1VzCkpq
 L684sP9DpyCncmwrusXkBIp7N8AAAA=
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas@ndufresne.ca>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Mehdi Djait <mehdi.djait@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734450919; l=6549;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=84dAzvqqi6ZbaS/ArkaMH7z+FZ528a0O4/ApO7qsY2M=;
 b=c/3NKPXuFcBnl/xU/u+fcfJCPSRrWqkavGYpwxzwCO/wSFWeQv4xPnuSgfZcRDib7EE+TneqK
 wkESEkTBcdSD3w2rWfexrbSghsH3yYNjqBm+XeAuy5EbOliFNTuHjnJ
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1PR08CA0244.eurprd08.prod.outlook.com
 (2603:10a6:803:dc::17) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS8PR08MB10149:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e3fc888-e4da-440e-90ee-08dd1eb335d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|52116014|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UldjWVRuT25lUEszR2RMcUYwUzNOandodjdNYmpvV3JLc2t6em80SWFBQ29l?=
 =?utf-8?B?dDV6Y2V2b2gyTGoyTUsxblljcDFaMVBJL2RnbGZHREQyTlJJR0Z2MGd4eHZO?=
 =?utf-8?B?RU0xNlhVQXdQdnczcE1ER3htRU5IWDZ6VzQvdGpNUHRIaVJzengwVzZuRFVP?=
 =?utf-8?B?ekd4V1JvQWZtb1lGNGNSbE1HcUNHSWhvejFQK3VCZFIrRHB2cVJWU2hYc1do?=
 =?utf-8?B?dWhWcUtOMWRSL3Z3Z1dCUm1sbFp2dExIUFBvc1lrYVM0WjFJVGZudllmMnRC?=
 =?utf-8?B?bFVFNmNUZTZieXdTRUZnZjVqSGZ6RmMxdC9BZmhqUTAyRFp4SXUzUXAyTy9W?=
 =?utf-8?B?cFRvdFVhNC9yVk4wV0xhS01tMXJFdVBNOWYyUkVabmlaSnJSMzhCL0RZWVBC?=
 =?utf-8?B?NzY0VytDc0o1emwrUng3NmdvRkR5Vkp4QmlHcndKREthbk9BQ2ZmTXVvdlEv?=
 =?utf-8?B?UGpNYjNYR05JV29IWHkyY1czcWk1WXhyNjRaZHpIbXYrMy9BTE8yQnBHcmxQ?=
 =?utf-8?B?M0pNNDZqV0VtSU9RN0huSUZmNC96Q2ZaUHpWOEZiZ2h0UEFHNEw0cmsyeHA2?=
 =?utf-8?B?eDl1clVIaWZxQjlIVjJyYjJYQVpQVys3dkl1NkxrcUJIZjlqNHdjNDZCcXEw?=
 =?utf-8?B?aWtFY29IOERrUndrU1R2THdBSlBlWlROclQxVTRGOWRVUnhwOFBydTJsWitp?=
 =?utf-8?B?QWNRUkdJWTRvYXh6U1h0Qmo1VVd0Y0pURkxLUUlJWUh4TDNkRmFPay9aaGhm?=
 =?utf-8?B?c0Z1UElxZXVoblJYakN5blZmQ1FpdXU0eUMvVnJWa2taRzRkdE9GRXBPaFBD?=
 =?utf-8?B?a2ZSTEpGYVhwWE9abkZWOE4wT2RXVE4zNUY5N3k1K3pHQldObmxGMDNFVzNF?=
 =?utf-8?B?aTV4VnJMWlBnT3o5RlZSZzFKZEVrSlpIVWl6TTlkMWNJa3lJdHBtOVcxWE1k?=
 =?utf-8?B?a25hYS9kb0szQzZQRzZodkpXbU8yZVdWWXpmby9MeHB5R3ZhTTdKU1drQ1hN?=
 =?utf-8?B?ZldFU1JGSi9lakdEOGo1TW1IVCtnOXlvV2pRb3hHQWc4NEQyOGU1MzZYVDRL?=
 =?utf-8?B?RjE3eG1NeWtOWEV5NkdPemhkVTZqd2VSMkNiYUpWb2pYZmNlbzAwcHVhN1k4?=
 =?utf-8?B?bjdzTTBsWFdHUTgwTzJsQ3hwUnhCVEo4TzlrKzRRcEwvV2JTTFYzbHI4VWJE?=
 =?utf-8?B?QXdQNVVVamcvRnZRNEhKRi95MXpzTGkwTDdsUGdiMVRTclkxR1RTeDBJcnNN?=
 =?utf-8?B?UG1tUzRwOCtQdTRyT3owcW5lcGhKOXkza3NOQVJxT0RWR3FHSjBvWHBocEJK?=
 =?utf-8?B?M1B1YUJSQVFmZTRYNVNhcEtyOE1PZ0o3TjJ5VkZOeWZZSmUxTDRTNVVDL1FG?=
 =?utf-8?B?UFR3cXBTOWtvcHhkZHdGUlVYOFYrbWFvN1VoeVRkZzQ2dElvWEszaVgzQi9Q?=
 =?utf-8?B?UjVvZ1ZVam1QS0VuenBLRlgxMUdpRmZ3VnhyREp5VEh4TUQ0bjhrOFkxNXd6?=
 =?utf-8?B?U1ROQVgxZXpURlpPc0hyeHJhaHE2cjNodG91NVJuV0oyZWZEa0Y5YWEvZjNp?=
 =?utf-8?B?YlYyR2o4WjBtbzV6Y1JWS3BuaFJ1enp2c2l2YzRHbEQ1QmN6S1hXdE5PSjBG?=
 =?utf-8?B?b1VBR1VpRTRHQ2s1enVZalMwTmRsMzZDcWM3by81RHlGMVJ5b0hiL1lZdlpO?=
 =?utf-8?B?Q2xzb0dleUMxZWlub2d4TGtrendiSjM4MjYzZHpHNFZ5TnlhVHBFMjFmQTF2?=
 =?utf-8?B?bE1IVVlzbTZ0Y0tpejhld2krdEgremZ4aUdFMjlOSnY2c0NSN21kOGRjd3JQ?=
 =?utf-8?B?aWovMFl5SFRqZGJTdmw2STNwVmwvb0FIZWdQUVhLUm16L2F5MXUwMW93N0J5?=
 =?utf-8?B?aWNnbGZCVXpEd2lad0RsMXgyUXNHQkZabUh3czZTcjBtMklVM3MrTjRncVJV?=
 =?utf-8?B?WXVsZlhpN1VlNHlkNEQvN0hRdzI5dml5U21kZU11ZVU3YzNBeXc0Y1FLL2lU?=
 =?utf-8?B?N3VvbDltMDB3PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(52116014)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OXRDazkxQ0FZRmRxQUhiTExuNVJpZjRYUkRyZ2YzQXNXditGTjhLQzRka2ht?=
 =?utf-8?B?Y0JZMTNTbnBSWXgyOGFkVmVtbUR5Yys3R2prcXNJaDZUZFl5eWRBbTQ1M2Fo?=
 =?utf-8?B?UXI3cDlUZ1JhQ2RIb0ZWeDFoZzZaUEtJczZnZUJhUk1QV0RqQmt4NXBnQ3h4?=
 =?utf-8?B?M1gvaWhLdGdzZy9laHdhcGVsZkdueUlGSDZQRWtuL0Z4ZitZYW95V1NVZWd0?=
 =?utf-8?B?cWhzdVNXS3V4TE5YaFc4UlNTcFQ1WHlJazh6bmZLNTQvRWxNMHhCK050T1JN?=
 =?utf-8?B?NENKU0lrRTJJQm40ZDVsK20vSzlaOXlydm1XQ1d1Y1JBTnBHRVhacHM5b1d5?=
 =?utf-8?B?NEZORmg4OWZUNlg3cjAzL254N1NON3FqWDJJYXBCQkF5VjRPbnNqMTBpRWhy?=
 =?utf-8?B?TzY2ZXM3WS9WN2ZjUytndmJJY0YvNHdJQVlNVU5RN1B6T0ZVSFdNRHRndVZJ?=
 =?utf-8?B?V0FMazA4anZXNkFwME0wYzBmNmVxN2xMMmhEZmhNS29yd3JNa0c0UCt1eCtJ?=
 =?utf-8?B?YWZsV3BsaXRSenk4RXh0MFZHaTRTWjZRRWxGbVB1T05vOTU3QjlDNXVCbXRY?=
 =?utf-8?B?bHVlZUVBcWxJRkVQZWdacGRBQWYyTmI0WjE4RlpUc1lTcUhacDZ4Z2tLclRu?=
 =?utf-8?B?bXZWRnlJMVV6WXhXbHhraDY5dG1nbjZBTFhjVTVvclUvUnFtQUZNRHlBeGpT?=
 =?utf-8?B?NzVrSWJ2MUljNkFlU3BBaE5XdEtlT0oydDJzVVZ0WlQ2ZE9WbXJycGRjcFo2?=
 =?utf-8?B?ZmVHOGF0cmFINmJ4N0VDeVNFUHliTXR5a2M4Y1VwSVdnYXNyY2lycjNRUjEx?=
 =?utf-8?B?NHA1Z25nN2o3eHMrbkFoSEFsWENDQUtqNW9nN2pXNEVLaDAyeFZuVzJCaDI4?=
 =?utf-8?B?cXA2bjNUY3RnNERWZ3JZUnN1eER6eGpGbmJybUFpNkdFMVNxMDc0Y1dNTDhT?=
 =?utf-8?B?TnRpSGJpNXJaQTVxUms0T1dTMHZSTFZMUFo2cFp1cURSWnN1YmxvMDJCa3Bq?=
 =?utf-8?B?ZVRLNWFMcUtWZFpGL0hMeDFuT2FUSXNRZnFkRnRYY1hXZk1iMGIvdGlkaGdP?=
 =?utf-8?B?QktnVjNyWFRKZWRJTEZjbzQ2eFpHSStycnIvTWNwbmJINkgvc2JpYUxrdnQv?=
 =?utf-8?B?T3d0MFBQS0tieEdVd05ZRTNUU1N3d21HWWhpdWJoKzlkK1N1c2lhQzZ1bGN4?=
 =?utf-8?B?WkUvelpubEpOV1FOcDZxZU9Jc1oveDdNTnA0dXN1UkN1aHduS1VtSDVGKzll?=
 =?utf-8?B?QnFNeWFuQmtFaWVORzBqYnVWVE9ETExiSXgvY1huLzZJQVNwQWw1Ykp3UCtL?=
 =?utf-8?B?QkpZelBPb2xhdUVCQVdjWDhWT1ptQm5NcXcyL2ZlZHUrMXMwOG4rV2hVdlc0?=
 =?utf-8?B?Vnl4T1JXUStxTXhLVEhHNGRJbkJWWWlxTzBOWjl2UWQ2c0xwbmlLTldZdWRD?=
 =?utf-8?B?NmJZcEZnZDhoYktOeDhaUGUvcFk5N2NZMjROUVBNTEJlNTQvWkF3MVg4QVhU?=
 =?utf-8?B?Z2cxRHozQVFGWUFlY3JYUXVGMERlR09aeklJOS85NllpWXFuVS9JaHhnalhi?=
 =?utf-8?B?bE91S1oveEdrQ2pMOGdpRjRIQ3NYcG9vcXBXSTA0MU02QTRNQjVDY2JhS01U?=
 =?utf-8?B?MXlWeUtxRlp5eDROUUdLbTNlOE5aYTB4VzR5OTJWdDZ0Slh5NndLOW0zS2lH?=
 =?utf-8?B?L2l2eHZpNENFS0MwZjJRQUN2U042aURXSTBLMml6ZU42ek9NbklmNVJMRUZG?=
 =?utf-8?B?TTNTcGp2VXFHWEZCY3pxUG1mRzR4YjUyTjFNUmdmWlNWY0lvbTdVbUJNRy9n?=
 =?utf-8?B?WkJJV3RSaXJ5MVpPd0hvc3pSZWs4Y1p4V0RxYk1xemlyV29TZFZhVVdvQXlk?=
 =?utf-8?B?WC9HK1JVcnVEdTZYU1hSUVZXRUgrK3piM0lIZ3JUQXA1azlIR2h1dXV0OUxU?=
 =?utf-8?B?Sk56TkkzeHg5YyswWUVGYWduUE9BUFByeVhUdlE3S210V2d1R3lxRWRZMisx?=
 =?utf-8?B?V3dMME50V0NJaWltZGx3Ty9DV3pHRmIrZVJ1anpRVTJVMlpxY2NiSGxJcTBm?=
 =?utf-8?B?a0pKaEhIUEJwVjAzZ2J0V1VSNUFrYlhFTnJMNFFPZ1Z3U0J0bU01MExvVTIr?=
 =?utf-8?B?dU9yQnRaNlBpS2hscVJiUTBJd0ViQjNXZE4yMjduWHkrZk5TR2hQSy8veC95?=
 =?utf-8?B?cWc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e3fc888-e4da-440e-90ee-08dd1eb335d3
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 15:55:20.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rYL9nqOnUdDEH1ppiZjL6dR7a9+/5AipVgAL11mJcSffll0ZU1Z0WzS/ZXxLkPkkTbch97fB4yPJNiOJ4CUCptJIFhZlUf+1iprEzmgJ8Ao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB10149

Habidere,

TL;DR:

This series introduces support for the Rockchip Camera Interface (CIF),
which can be found (in the form of variants that differ significantly) in
different Rockchip SoCs in general, and for the Rockchip RK3568 Video
Capture (VICAP) variant in particular.

The patches are functional and have been tested successfully on a
custom RK3568 board including the ITE Tech. IT6801 HDMI receiver as
attached subdevice. The IT6801 driver still needs some loving care but
shall be submitted as well at some point.

The long story (gather 'round children):

The Rockchip Camera Interface (CIF) is featured in many Rockchip SoCs
in different variations. For example, the PX30 Video Input Processor (VIP)
is able to receive video data via the Digital Video Port (DVP, a parallel
data interface and transfer it into system memory using a double-buffering
mechanism called ping-pong mode. The RK3568 Video Capture (VICAP) unit,
on the other hand, features a DVP and a MIPI CSI-2 receiver that can
receive video data independently (both using the ping-pong scheme).
The different variants may have additional features, such as scaling
and/or cropping.
Finally, the RK3588 VICAP unit constitutes an essential piece of the camera
interface with one DVP, six MIPI CSI-2 receivers, scale/crop units, and
different data path multiplexers (to system memory, to ISP, ...).

This submission bases on the work of several Bootlin developers who have
been tirelessly submitting support for the PX30 Video Input Processor (VIP)
block for inclusion in mainline. This process has been going on for several
years now, with Maxime Chevallier working on the topic up to v5 [0] and
Mehdi Djait taking over until v13 [1].
In the review feedback on v13 a major rework with a media controller
centric driver as a goal was requested. This motivated me to take over
(with no clue about the MC framework whatsoever, though).

I decided to merge Mehdi's v13 with my v1 of the RK3568 VICAP support [2]
and refactor the whole thing. The resulting v2 of the series now adds a
basic media controller centric V4L2 driver for the Rockchip CIF with
 - support for the PX30 VIP (not tested, though, due to the lack of HW)
 - support for the RK3568 VICAP DVP
 - abstraction for the ping-pong scheme to allow for future extensions 

However, several features are not yet addressed, such as
 - support for the RK3568 MIPI CSI-2 receiver
 - support for the RK3588 variant
 - support for the scaling/cropping units that can be found in some
   variants
 - support for capturing different virtual channels (up to four IDs
   possible)
This needs to be in the scope of future work.

Finally, please forgive me if I forgot to address reviewer comments from
the previous iterations. Between v1 and v13 they have seen significant
feedback including renaming the complete driver twice (from rkcif to vip
and back to cif) and I am pretty sure that I was not able to gather
everything.

Looking forward to your comments!

[0] https://lore.kernel.org/linux-media/20201229161724.511102-1-maxime.chevallier@bootlin.com/
[1] https://lore.kernel.org/linux-media/cover.1707677804.git.mehdi.djait.k@gmail.com/
[2] https://lore.kernel.org/all/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net/

To: Mehdi Djait <mehdi.djait@linux.intel.com>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: Théo Lebrun <theo.lebrun@bootlin.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: Sakari Ailus <sakari.ailus@iki.fi>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Heiko Stuebner <heiko@sntech.de>
To: Kever Yang <kever.yang@rock-chips.com>
To: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Alexander Shiyan <eagle.alexander923@gmail.com>
To: Val Packett <val@packett.cool>
To: Rob Herring <robh@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-media@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>

Changes in v2:
- merged with Mehdi's v13
- refactored the complete driver towards a media controller centric driver
- abstracted the generic ping-pong stream (can be used for DVP as well as for CSI-2)
- switched to MPLANE API
- added support for notifications
- Link to v1: https://lore.kernel.org/r/20240220-v6-8-topic-rk3568-vicap-v1-0-2680a1fa640b@wolfvision.net

---
Mehdi Djait (2):
      media: dt-bindings: media: add bindings for rockchip px30 vip
      arm64: dts: rockchip: add the vip node to px30

Michael Riesch (4):
      media: dt-bindings: media: video-interfaces: add defines for sampling modes
      media: dt-bindings: media: add bindings for rockchip rk3568 vicap
      media: rockchip: add a driver for the rockchip camera interface (cif)
      arm64: dts: rockchip: add vicap node to rk356x

 .../bindings/media/rockchip,px30-vip.yaml          | 123 ++++
 .../bindings/media/rockchip,rk3568-vicap.yaml      | 168 +++++
 MAINTAINERS                                        |   9 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |  12 +
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |  44 ++
 drivers/media/platform/rockchip/Kconfig            |   1 +
 drivers/media/platform/rockchip/Makefile           |   1 +
 drivers/media/platform/rockchip/cif/Kconfig        |  15 +
 drivers/media/platform/rockchip/cif/Makefile       |   3 +
 .../media/platform/rockchip/cif/cif-capture-dvp.c  | 794 +++++++++++++++++++++
 .../media/platform/rockchip/cif/cif-capture-dvp.h  |  24 +
 drivers/media/platform/rockchip/cif/cif-common.h   | 163 +++++
 drivers/media/platform/rockchip/cif/cif-dev.c      | 405 +++++++++++
 drivers/media/platform/rockchip/cif/cif-regs.h     | 132 ++++
 drivers/media/platform/rockchip/cif/cif-stream.c   | 676 ++++++++++++++++++
 drivers/media/platform/rockchip/cif/cif-stream.h   |  24 +
 include/dt-bindings/media/video-interfaces.h       |   4 +
 17 files changed, 2598 insertions(+)
---
base-commit: 40384c840ea1944d7c5a392e8975ed088ecf0b37
change-id: 20240220-v6-8-topic-rk3568-vicap-b9b3f9925f44

Best regards,
-- 
Michael Riesch <michael.riesch@wolfvision.net>


