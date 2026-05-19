Return-Path: <linux-media+bounces-62065-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KN3JAz/GC2qWMQUAu9opvQ
	(envelope-from <linux-media+bounces-62065-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:09:03 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F5B5764C5
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:09:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9C6E7309614A
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB79830C608;
	Tue, 19 May 2026 02:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="VzX95sZr"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010035.outbound.protection.outlook.com [52.101.84.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6DD30AACB;
	Tue, 19 May 2026 02:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156339; cv=fail; b=kEbNeJ39IFzivDh3OejZEp4xlWiWetDWNDu1B7hn6eVIkv2WlV7c551bH8mZO+GpLrxVuR2jP6GoYuI3Xe2cfjIOjcTVQkIvvnMQ5cDxVrUp5Q8oTirh8zV6TrC2q7uzX+9uIXPEhFJKbwVdk8LHNOXhnHBbXy+3TUVzpc1wUKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156339; c=relaxed/simple;
	bh=NBUkUvQ5dmPZtJs0c7EzDFrJUMviaQkVTLo/jpjQegw=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=u4/k06LEPxR3bXVgzB8/nIGKPR+qOLFHSVihgXe1wmAS4pIhP7/lpHrx8wFBNp1UflYZHvkpTENhR/kDRs0NP2Fzx7kHue5znBiUsRT8EEQ3FYfW6dTH5QdC3gkKffpOJx/xa/L2iJYXjhumlhTzP8EmutkJo/RPaGdZirfd+mI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=VzX95sZr; arc=fail smtp.client-ip=52.101.84.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B3GgYy+sIX58J5KFro0HU/QdIWNRbTYveZ4jrZNxcecPok6qHgFkv76Pnp32PwvliOlNGtqwFPVRjBpvM70pu4cvobCWkO990wywAh4LhClr+f6mqD2YNoSZGf2vhZkxQj9dWG2lRrDi08CvioZufsEbUVWYSkxS2kTmathIJDW79Zeq834uNd2y1ZEO+qF1vIqqbFoBOjUqH+E8JTyreBGXZ5UdRTLn2nQlOLK1kUfCxm9dwM/Ou19J8HmflgVH/1jYpPtQWIK+ZoRIyi70Eg2fNkOl/gZ9hpz2wsTt9D6mAdgF6tsQwUoBtRv6sqOFOQQ/pSYKHLSZ7QCV1as76w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yG9P6GvCAgr1HcP4kUUTv9eqUDRkJuxuXTlPUoOQVsk=;
 b=pYWSrYZI0ScR6c2ZZs1X5mi88kZDvcnK6OC65DOuK5oduAO+QJRGR9OjS5YZitZhOTRfZNy97+zmNslBV4sBPxZAK5L+iVR1ZgTjDWEFxATZ6eL+52gZdoRHcWE8YIYt72bAgQ5P1MhCsS52m6U7IJ7hj8S64q+cEl8ny7a3+3xUBNd4/jO+fwgMBYZDZAm5vSdBJd+Fr3E1k9q25CMsxWsA4S3Kd40s9fAhNPnildZ1qXx9etaqw3fvLpCayIiuKL2BQnk3McZDXYfqJdfJxe8Dm9KIlXixJ3MHs7wD3AI+hIpHKxkFGpp8eIXlGfaIludMuZeiktMcOIJeps6YNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yG9P6GvCAgr1HcP4kUUTv9eqUDRkJuxuXTlPUoOQVsk=;
 b=VzX95sZrTGARDIwBvheYhlcA0XLK52uJg42tyLiLF23Bd5ilQH3GoigIw7JwFolKMAN84K6oaxbCL3PP0O8IH0lIhZ0CrXTWahyocr5qKjV7hY6qod1fgtHtQuHMhl+cq7iIhX970m3LH46aaEakTmnkD/bVO+q1qqNwhfxZ4b/vwczUc7XQRUni1Fymo29x1mZh1c8vx9X5CfW3mrCM+xukRB5uVJfOSHPfS261i0m0e1bJrUzjA3i63M7ELGsftwXs88I5fSsIdvTfhwtS4TrXRCipQJ1K3JlQrck4XHRkWbv/YBsnrR/kpwLvPvEPgFcmOiXB3p6XDIAVb1QuYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:33 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:33 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 19 May 2026 10:07:42 +0800
Subject: [PATCH v4 5/6] media: dt-bindings: add NXP i.MX95 compatible
 string
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-csi2_imx95-v4-5-84ea4bb78a88@oss.nxp.com>
References: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
In-Reply-To: <20260519-csi2_imx95-v4-0-84ea4bb78a88@oss.nxp.com>
To: Michael Riesch <michael.riesch@collabora.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.Li@nxp.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=2261;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=NBUkUvQ5dmPZtJs0c7EzDFrJUMviaQkVTLo/jpjQegw=;
 b=NiSZu/xHRFhDkoIX2Aj1WF480+bHJlo4LVQSZfZExzBYBXKC5qBUDI+mQ9X74HUNAfOQNCCqR
 HEyFqU0eaA1Clo4cSTbcjlzNpakciZM/v44b4DJW9yyIjru1Gxq+yBU
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DU7PR04MB11139:EE_
X-MS-Office365-Filtering-Correlation-Id: a4f1f67b-0978-44a0-f282-08deb54b1c25
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|3023799003|11063799003|38350700014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 JKn4dgfrOlv6ceONtQzYYnn5StIEA0LjR84oFh3w7vTCJ7wXHiAIsuaBEexgu945MhFmYKmHqGEH0Llx9GKMAlCSSa39on5LCKuejvUR3YjxPgHJ3JQnezsrSkniyB25cByrBYYOG/xGmalFO00B3Ags6aHmKMuHAQhcUliuwrgdqvJsefiNe7IRb7cMNnHf8NtcaE/CXibx7cOW6JihsAS2Uu563FCDaLE5lBLGTxEWcGBnDm1dDOo+WTGdIKyAwg8G2aMSJbLKPm4cJKDJKNG9Iq+o5aJLXxPEAcCBHIGf4H+Kn7A3QsuSOaX7K1rckkcx4wV8HuPOUKyuqeXDmTyYxTA+u7Mm1gLcJVgqR2FXsIXNNbpE2U9Sj52mJ+p7e79G0PI056EnsvNPllXRMEVtgucnL+zId643RhKwdfS/P8+X8/sedg5B75loAvbao18dBhSIDFxeLbNkEBle83puQuEu8DBFH6HpnFPXPu9l72MNGtCeSsXUNW1y8h5fmn0gBf9q4NpNrfNrKrOGdkzV7UnKT/WeofXetcUT6j1baP4jYk7mNOE1CCH8NNizv8W89N5L7i8QyOucSZDS8mcUxZm8zScRs5bzWTmkDQGLXWoC84G2hg7hJFRUVadI04+RR6zo4F52wENjC4FxeBCd+HJkweneSoHvhrs6znM5VWQY06f4yZIXB9zvDLAJglLqlvz4SuizYuCdr+C6AKSNxLawIVHt49yDhWqfcJepdcLOAIJ7/La6EjjiBb858/RYFuKNd08lhEPnMyHTsw==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(3023799003)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bVBrL1FncUhtcEdDNGhrZzA5Yis4UHMycVJySytIZmpHcElsQ1oxcFJ5bVVU?=
 =?utf-8?B?MTZEZGdCNXMvWmtodWF5cTMxSlBBWnFoelRzWGpsREprbmNrUFM0YUZuU3Ez?=
 =?utf-8?B?QUtCQ2xQeFNVQnVjb2lza01ac1VvMTZZdDBTbnBZd1k5dTRUSXdMSnZZUi9q?=
 =?utf-8?B?cStvQVdHbHU5Q090VG82VU9CSnRDdnpxSk1IZWxvMU9zc2hYV2JzZFpnTXdJ?=
 =?utf-8?B?cVhCaGZFNE5BMzV0clE3TUxFQWtLZmlOMW1wYlFPLzdjUDdxcVJzeGE3L1ZQ?=
 =?utf-8?B?UTEyRjQray8wWlpVQlBweE5vdkhQaEh1KzRObGg1TG5wY1d5VFM4RHRYNjNU?=
 =?utf-8?B?UnNKN0I1d3BvRVhsVlBkRUxEcWFpcGJlOWpLS1llT25YdTNaOFZUZ0g5TnVI?=
 =?utf-8?B?K0EzejNseHhDQnJTMG9ITUt0bVQ5OUpCaURhZVlWWHJKdXZBamJzemlTRkN5?=
 =?utf-8?B?aDUxWVNlbVcyTHllNUMwSm4zKzFWczduR1BreXAwTW5ZOGhpb09SekpsTlM4?=
 =?utf-8?B?V0Q2TDJzRTdyM1gzYmZRQW5NYlQwZzU5QlR5U1kvTDRUMGJnRVRCOFdTMGg4?=
 =?utf-8?B?VkRKWU95algrTEtIZUx6bGJZTVFQMUljd3NXaStnSHhUaDVENGJtNUR5RzFl?=
 =?utf-8?B?azV2OEZjdFlyRzUzbmNNZjA5TXRjaFpqb3Zya1RWQ3ZiOXpGMitDRkxKaS9y?=
 =?utf-8?B?d3ZqNHNxbU5SSUt2N0xvS3ZiemkxYUF4R0xoZHZFZWp1RHMrdkg3QmdDYTB0?=
 =?utf-8?B?dWpXTm9FVUJHTkdMQ0N0Qy9Ic0hqQXVaUUdQeTgzQnU2czVyNEd4Ukc4WE95?=
 =?utf-8?B?citsTXkzUUJCOHhSZEcrc3h1TWZEODhBRWNNTlRCSWYwNmx0bGo0RGdCaUxm?=
 =?utf-8?B?dFlQa0tXQlZId2hURFlzOVZma1ZNZ3BsZm9WOE5WY0pzVVo4c0llSzNSb2tm?=
 =?utf-8?B?cm5sWlBTNm9DUDJ5Z3hXaXgzMjBBZWVDQzhwRlpIbDcxWUR4YUl0ZzZVdjRz?=
 =?utf-8?B?L3lnVHVZVDZaODU2aFAyczFmWFl4Q3pZanp0ZXVWdlZMQ2dLUW0zRytya0ti?=
 =?utf-8?B?NFpOL2dqMDRxd1lKSGN6eHowcWJsdkc0eDRYcjhET3IyZ20yYjVYeUlyQVVB?=
 =?utf-8?B?NnBCaEZYQVpCLzcvTGcyNUxyd1FLTFhWV1hKZlBHRmRDWkVWdGlmMHZnMHVm?=
 =?utf-8?B?VDlLOWxBN0dkM3owa2R6QkhXeTU3cytQTkJVR2dyMUhiSHdjRDRKakZoODRu?=
 =?utf-8?B?eUNTOURucHBVU21jYTljMElicHprSFpYZVlEc0YxNmtKTnJSbjBGQXhhMyt1?=
 =?utf-8?B?T0FRVHBzeGtQdnVxSk02SnBselQrbDk3N1hBTUQ3clZ3eVNKeFFXMjdiMFgz?=
 =?utf-8?B?akluU3dFQ2xkeFRoS3dSNkw1cWVaUExaeUJvS0ZEb0FwNXVHazRhdHFoKzkw?=
 =?utf-8?B?UGIvVjRMeVQvVTM3a2ZVaG5DZXJaZEk4WE5hMW1VYzlsanMvWUVyTWFuL0Y3?=
 =?utf-8?B?Z3duM3c2QVpuRWxjSGVzRy8zSWdaam4zcHJ1NHNDd2FpL1BET3pjb2VzdUY1?=
 =?utf-8?B?OU9PcmVFSEpVZDdNS2JtTTU0YVVrcy9xTWV0Szk2T2xZdDBIR0hZVjBROURa?=
 =?utf-8?B?bXZxMEpEKzhjQ1Z4cTc2VTdRSzE3ZWt4K0dveGowQTArdWM5TFd5emlNYmwy?=
 =?utf-8?B?d095Z0YrZWF0R1UwS2txU3J6M2tXVDVodWY3a21SMUdTZTJlU2RaVUtuSElm?=
 =?utf-8?B?L0FSYzNURFpqdHR5bUg2cjhQL0lFMStkYmt3Q0JqaC9rKzRjb3hxZEhOV0dl?=
 =?utf-8?B?aWlIalVESG1SeklaM3hXWjhsUFpLQVRwUXdHQkRRTmZXbEVqQXdsa2lCSEdL?=
 =?utf-8?B?YThsZDg5VVZHcEt5TEU4MnA3N3NVWEZMbklvNHBYaTBBUit3NS9MYmR2R01s?=
 =?utf-8?B?dEY1aWpPdGZtMmF2Qi8vWHVDU1o0d0ZzQ3VhNk1GNDhRMWlPSFRlNUJSYUQz?=
 =?utf-8?B?VVZhOFg0cGRWbzJuSXoxN211aURIWmtVa3JKYVEySUdCOE4rKy96MHpTeklF?=
 =?utf-8?B?RmJuUG55Q1BEcGhJTWd4bUI4N21FNERGbWVXT1o4cEZldTdva3NkNkt6QWNQ?=
 =?utf-8?B?ZFhvckxBRU9KcWMvbDNZSSt2aGlNR1Z2SW0wRXg4a1h5ZjJEWlUrWnU0L2xv?=
 =?utf-8?B?SUJqRkhOT2J1MmZuNFcyS1lTU20xeGw4OVZId0g0VTJ3TUx4YzZDR3EwRVla?=
 =?utf-8?B?cXlzaloreCtESVhHQmE1TjJ3c1FzZC90M0U5NGVWNXYxN0NQTThzRGpwd2JU?=
 =?utf-8?B?ZVZuSXZRMmxqMGYzWjNRVXpxclozZXBCb28yMUttQXZjMHd2cWxrZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4f1f67b-0978-44a0-f282-08deb54b1c25
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:33.4030
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdEUVaWstTD6hwNFiVf17MeoB77Gcdq+rEQ+uWaphI9xQmTb7B+vYGMubEv+Ndd4znQX+Wd2cmx+pIA0T/D9xA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62065-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,qualcomm.com:email,NXP1.onmicrosoft.com:dkim,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid]
X-Rspamd-Queue-Id: 67F5B5764C5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The i.MX95 CSI-2 controller is nearly identical to i.MX93, with the
main difference being the data output interface:

i.MX93 use IPI (Image Pixel Interface), which requires:
- Pixel clock input
- Software configuration through registers

i.MX95 uses IDI (Image Data Interface), which:
- Does not require pixel clock
- Is software transparent (no register configuration needed)

Due to these differences in register layout and initialization needs,
the two variants cannot share the same compatible string. The driver
needs to distinguish between them to handle the interface correctly.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Add Reviewed-by tag from Krzysztof Kozlowski

Changes in v2:
- Add dedicated constraint block for i.MX95 to reflect different clock
  requirements (only per clock needed vs i.MX93 which needs both per
  and pixel clocks)
- Update commit message to include more details about interface differences
---
 .../bindings/media/rockchip,rk3568-mipi-csi2.yaml        | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index fbcf28e9e1da..8bfad0fca3b7 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -19,6 +19,7 @@ properties:
     oneOf:
       - enum:
           - fsl,imx93-mipi-csi2
+          - fsl,imx95-mipi-csi2
           - rockchip,rk3568-mipi-csi2
       - items:
           - enum:
@@ -140,6 +141,21 @@ allOf:
         clock-names:
           minItems: 2
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: fsl,imx95-mipi-csi2
+    then:
+      properties:
+        interrupts:
+          maxItems: 1
+        interrupt-names: false
+        clocks:
+          maxItems: 1
+        clock-names:
+          maxItems: 1
+
 examples:
   - |
     #include <dt-bindings/clock/rk3568-cru.h>

-- 
2.34.1


