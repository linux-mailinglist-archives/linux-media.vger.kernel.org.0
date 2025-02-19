Return-Path: <linux-media+bounces-26355-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C272A3BB84
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 11:22:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7DFA018995CA
	for <lists+linux-media@lfdr.de>; Wed, 19 Feb 2025 10:21:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF6871EB5D0;
	Wed, 19 Feb 2025 10:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b="mIhcfoDr"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2102.outbound.protection.outlook.com [40.107.22.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F6A31EA7E1;
	Wed, 19 Feb 2025 10:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.102
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739960228; cv=fail; b=Uk7qA5pOC+MgtOQqisCP6i5CTENc9Qj7G+e8LjsRt+GXCGrDQeYRuEYssEzTv6LsZ0gjR//EUb+tY8pBKyfOtdRMzU+dbLDGD2f9OPuIm3lHJyTU0SSEdk374ixwMpOle2h7n+NBqWLZ2LETNTAiGpXDWx4pQZuN51Lx3qYy49Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739960228; c=relaxed/simple;
	bh=8Sv3qzMjLle5B2Db/ntmB6Er3Sh5MdDzsjE02HgBVUY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=IWCx2Coeoryn6Ew+EbNc7yzimdVvCsBG4bH9+xXcViOjc0Dw51oRwaCc8tDzuUh7O5JYMisjyZRXpx4SvsawQ95GWuz4f/ysu9LWdTUwDI6u/rf3J3CMn+ywFJsh9ZY2ClTM+Y1KJSswFHCSri/quTsbfK3kG6aF5YOQPL0PgaI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net; spf=pass smtp.mailfrom=wolfvision.net; dkim=pass (1024-bit key) header.d=wolfvision.net header.i=@wolfvision.net header.b=mIhcfoDr; arc=fail smtp.client-ip=40.107.22.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=wolfvision.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wolfvision.net
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2ckZJq2UTMSut1tBFW3kf664+0Pi+TT2KfErdRd/KI28CPhKS90daJt7CcspT0Uv+FsbPySvxxp0ardjff7pHqHnyza8mf8nW460dN01o3UBtonMCBuJ+JsumD6jP/G+5VhUrTDF23OwmA5sKNiyEMfMNWTxlguuUQlG7i08b+FR2snjd5eOj6/BhPpnflXU1kaKZ4Z4ErnzkWjfJmrFcJBXg+7UZgTSYr2Ma1kuYvUBh4926aatf12WlinnxHFITipov+b56/UocralQHPEbe0RQurDgcE7LUtcjsb+j8VT9TqqWqumBAR9p9AtoNc21aSVQLxVQuGzur97mVO+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7MmC+vttOPClVYEq8kqxqWZzmlFP5TNh88NVLGG+gkM=;
 b=k4kKEcEHTP7xNdn8c7id/ARMQIbp1c9pXvXdQPKvAidLrP15aGdgXpCnjbgQVBoUVvVhJxLljWkAMj/j/r2JXSuPaMj5c0V9O+gxu/KdoGIV+B9grhJIY30UWcmGQTGVXlVOqhN8XoQSSNJUIzyot+6SWlFWpoPcbe0v86WlLzDdK/e1raciunIE+FUOi2TIw9BNZ9cfub1gKQmqFgQWE6uGiU3WjZOrr/NUY1mwRm69RDzJJ7v+KvTd0Q4r+d168oC9z8ctecMZGOrum1ykYGplpoyhfBs6yXdYFyc1O0OOwNPr71K3EKDSuEApcPXEmd94UriLOd8dZafoTRPIDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7MmC+vttOPClVYEq8kqxqWZzmlFP5TNh88NVLGG+gkM=;
 b=mIhcfoDr/Xn3YZrP5j0pjjgErEg2RQIWL6viB5mkWDMVBuKRy72f/BhW4cKKWDe0eaccVj4cZibXOAg0v89rdTkJyyrw/uYz0TMimnfwQgSoPfb3MH4BTl7NE+NaAqs48rllQHb1TtWZ2yUyvnXDWGrDKU/q6o+CRPGGolegRCs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DU0PR08MB8138.eurprd08.prod.outlook.com (2603:10a6:10:3ed::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.18; Wed, 19 Feb
 2025 10:16:51 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4e72:c5d4:488e:f16d%5]) with mapi id 15.20.8466.015; Wed, 19 Feb 2025
 10:16:51 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
Date: Wed, 19 Feb 2025 11:16:38 +0100
Subject: [PATCH v4 07/11] media: rockchip: rkcif: add support for mipi
 csi-2 receiver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-v6-8-topic-rk3568-vicap-v4-7-e906600ae3b0@wolfvision.net>
References: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
In-Reply-To: <20250219-v6-8-topic-rk3568-vicap-v4-0-e906600ae3b0@wolfvision.net>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Fricke <sebastian.fricke@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739960197; l=24428;
 i=michael.riesch@wolfvision.net; s=20240405; h=from:subject:message-id;
 bh=8Sv3qzMjLle5B2Db/ntmB6Er3Sh5MdDzsjE02HgBVUY=;
 b=VwToprCzjkQOR7ppnTwhOZNrPMiqjtxIZ8KQxOf+SS3/NlBgCg6SQvsywJ6B0xwPRnrhcqukV
 OqWw30IpTWZAUmFSLYvrLSau+dfR90QZEoAch6+HFoh4AOVh36EtDpL
X-Developer-Key: i=michael.riesch@wolfvision.net; a=ed25519;
 pk=cSJmgKSH3B6kdCIDCl+IYDW1Pw/Ybc6g9rmnUd/G7Ck=
X-ClientProxiedBy: VI1P190CA0041.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:800:1bb::8) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DU0PR08MB8138:EE_
X-MS-Office365-Filtering-Correlation-Id: 9531973b-7ecb-4d20-34df-08dd50ce86dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|1800799024|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?LzRwbyt5bjBrK2E5cC91b1Rrem5Sek5SUjc4SEIxZko0Mm5uaTI5ODBEc1lh?=
 =?utf-8?B?NkVGV2xkaWR0UzZzRENjTlo5ZUkvNmkzWVZoRllmbFlPaFp0ZlpYU0FtemNx?=
 =?utf-8?B?cHlnVVZJaElwUVhsMWtxbFNnS1p5a2g4VURLVEY4VXVDVFRQb0h1NGtzeVBX?=
 =?utf-8?B?MTBxVWhuYmpYclk3dDVzTVJaYlh1SklKajBYMWRaVi8wVEdEUEg0cVY3cWV0?=
 =?utf-8?B?cXdpcndxUWQwNmFKUlZ0c2V2UWI4blZxbTZpMlMwaXBNd3hVRkpyOStWdXNC?=
 =?utf-8?B?cmxUTFBNWFM3OUxBdW9IZG13Mm0rVy9FUHM0R095MktDNmw2c29qWTlHbnl1?=
 =?utf-8?B?VHVUMENxS2hQL2poWjVhZXBIYkFyMnU5SVVXSkx1NmtEbFRFSWk4R2JjbGt5?=
 =?utf-8?B?bjdDbTFaQkRUK0cwUlQrSFFmWExkQjlyNGd2SUkzcWdoYWNhM0xsNWZ4cHBB?=
 =?utf-8?B?UVN2bXBoZWV2SlAvQnVHYVQ3VVhRNy9DTDdkOGZrYUFEdkx5bWJhTVBXaU0x?=
 =?utf-8?B?TW9Qamd0djh3U1FZazdaNWM4R29wdUhKTDUzWEg2eHh5b3BUYnhXVGR0NDNC?=
 =?utf-8?B?R0lUcTBjaWszYjRaMHdpRWl2Q2V5N3BTL2dhemFnMDN3WFZYc3ZKbUN1WkZU?=
 =?utf-8?B?UDlNc3Rud0N6V0daTStpc3J2MFp5Mk9mWm5MczBXS0s0ei95NUZBNDVreW5J?=
 =?utf-8?B?UHFQVHZrd3QzOHpTektJQnBGeXRvYjZGeHhmSWdpTWdpcXhEZmYvOGZ3dEtF?=
 =?utf-8?B?MjN5MU9heW9sN1dDOUlIZVIyZFNtNEdqeFcyWHVLYkRDRDZoTW1naXBNUkEw?=
 =?utf-8?B?dnZnNnJSeWpGdTZXQTlMbUJaZ3NxUkYzdVRXZTNYTEk5WUd0Vm1xbGZVMzZ2?=
 =?utf-8?B?dUJ0eWk1TmVxazJlY0d5dGpRR0VrWFhoMllXZWswUFlVNTBjdjBBanNBYVJS?=
 =?utf-8?B?aXNZM0xtMitJbzZpaldRbGI3SXlwVStId1JETkowRVA5eXR0bjNEczF3OGlJ?=
 =?utf-8?B?bndOTFg1WTBtS3BONDRCUlZHS2JQZ2ZKaWxmeW9BaE1QZDN1blNvbDZaN1Ew?=
 =?utf-8?B?WHMvN1FHVU12dXM0aW14Vi9taVNQb0t0OFAyRWZPOGVmWm95NEg1MUtqcnJp?=
 =?utf-8?B?ejhoYVNuVVdSbVE5Z1c5V1NQT2FlaWxESmZkZjFYelRhNENGcGZmaW1mR0hL?=
 =?utf-8?B?RFJMbmhRQUc2WHllZnB1aGhlTXVjNno0SkVYQnJ1YklTdExia2F5ckVvZTkz?=
 =?utf-8?B?OHFoeCtGMUx5bk4xSlVLRktkR09KUm1SYWFqZ2FTWi9wNVhWcmpuYk9hd0FF?=
 =?utf-8?B?a09lb0tqVGIwdXg1cWxqQVExNHp0dTVtTlovYzYyUkpWSmJrUjBJWkdFazQ4?=
 =?utf-8?B?VlBrbnpyQklYcEl1dzZ5c3d5RW15d0k4bGhoTEVLQ3ZvWlREYnhwRkd3VVpV?=
 =?utf-8?B?SGpMNEd0eVlKMHA3SHZWazd3ZUpVTFpuZ2Q0VkpFcXRZcmZiMjAzSi9zZng2?=
 =?utf-8?B?dkJaUnFnTXZ2cktyKzBYVWlNcm1XZFpneG1LY0lzR29lQnBUUHlrN1B3N2Rs?=
 =?utf-8?B?TzRrRTI4UXo4RWhQMXNraXV6ckJ2bm5TREVtc1orNFJEQm1rdjRkTjNKRG81?=
 =?utf-8?B?S3pYdkNuZ3Z4cnFuYmV4dHUwUk5VbW9CbzdXSnpRRzRGVXZSaytsQ3hsVmwv?=
 =?utf-8?B?RGlKNkNrRFZqN3daV28wRXkwTEl5eWhLeGdvWElZOStoeWVFbmdRNU1xd3oz?=
 =?utf-8?B?Q0E2aEhXckFKSjRsTStLM1pZdUZLY2hQR0lTNjg0RW9DSko2bmpteFlxVDZM?=
 =?utf-8?B?ZS94V25NZWgvdmZVZkovaTlSd0pFSjREc3FlQmZuNE1UNlBUQjQ2WjU3ZG9T?=
 =?utf-8?B?dDIyZ0V0bTdSb1FjVzVOTi9xVTZ1OVpMZ0FSazRtRHd3OVJzOTNyZTBVUHcr?=
 =?utf-8?B?anRxaHNpbU1wMXgzTCtneVQyUzN1VDU4RklqOXFlWHBaSlZxWVhBU0lFdENX?=
 =?utf-8?B?NU42eWxON293PT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU0PR08MB9155.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(1800799024)(366016)(921020)(38350700014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z0JJNHpVYVdpUVlSZUR4cE5nbG9YUWs0SENHbFlCMlhzTHZaQlcxdGZNR0FH?=
 =?utf-8?B?aysySTA4WURLMGtGd0RtM3hzRTFHSGdkVC9LMzZQQldCSEFMK0lJVUo0Q1Rm?=
 =?utf-8?B?UHdYNm10WDdqNCtPOUFQNlFTUG5KdWdqOXdTeE1zNncvSi9qWlNrbGZRUFVy?=
 =?utf-8?B?L3JNZi92OUthUGVDazRxbHNpTTMvbmFkandKY1g2MDZOdUdub2k2YlpRaUJV?=
 =?utf-8?B?cWpzT2R2NGF0SzlCazMvNnJqTTdJV09tWFpKTXBTYW94dDRhTGR6VUxxQnp0?=
 =?utf-8?B?a3NsWUM1dFJNLzcrYXFPbnZIdzZFQ1BERDkvU2h1dDN0cVFqdU13dDJuRTB1?=
 =?utf-8?B?SmIyM1g0dmdqOTR6cjFkaFZod01LQ2piM0J0eW5ZSEtnVmVXRDdDdURMZVhU?=
 =?utf-8?B?cWVQL3J6TWg5QnpXcDVibVY3NTFtdGMzdFk1b3R0L2JqVEFSbzFGWkhTZnBS?=
 =?utf-8?B?WHlXOEhaSDVoUW9LTVI2ekNRTkdpa0FzQmNLdkFyZUNYdmk2Q0Nwa2poRHQ5?=
 =?utf-8?B?ekhwM29kUmtHTXpWVG1GOGJCOXl6NkFWdVBNcDZJWm53TlYxbkVKcVFsTzZs?=
 =?utf-8?B?VmlaK0Vwb1grL0FYQlJlWHV5VW9pby9WNHo2V3FKRTVDL1BkTUI0VkVQNDAx?=
 =?utf-8?B?aXcvU1lJVDZEWGEyT3lmazhpWEhnYVh4bzJjZTJwSWtUT2NYeE9QSkM0cXRv?=
 =?utf-8?B?ME8vbDI0YnFWZzNnTk5UUkZoczloL0lEaytQeDdJZUMxbGkwUzBVTjI1amJR?=
 =?utf-8?B?UGQydlNEejJMSVcrc3UyNzU3MjFCRVJ0MTBXWlBMOEtsaWk3TWlNMWFBMmhi?=
 =?utf-8?B?aHQvbC9PdGZDb2hZa2NxTHlzYVFnYmI3K0QxZ3oyQlFtWkU3ckNZZzVLdkxK?=
 =?utf-8?B?anhwdDk4WnVxUWF5OXo1V2s1SUgzYzBWM0MwclRlVkV4eTZWMGx1QmNLbnlx?=
 =?utf-8?B?Ujc1R2pYRDF1ckFpVkw5bVJzQlk1MFVRMkg2cG9CR3dJT2JhcEcwRFlZQXlO?=
 =?utf-8?B?c093ZG1xOGZ2bktuSEYvSFM2SzQwaDhGSERyWlpkVDFtMHBtMncwV1lSZCth?=
 =?utf-8?B?WjV3OUx3MjhqRUdEc3JzR0V0MGNiMWN6MlNLeVhuYVJhL1FJb1grVUpha09v?=
 =?utf-8?B?OW80cGh4M2lDeG9PajdBaXNPVUp1KzU3ejB6S254d1pmajMyRTZXL3grWndQ?=
 =?utf-8?B?eFlyNklkaFE2K3UvWWIwT0N2OFEySldZb0tNZkxqSmZCVDlYWEJmbzl2NktU?=
 =?utf-8?B?Q1VxZVB5bTltN3hvQTBnS1lyZ25DdWhuUjdaSkxNUlgvSDJyY1F6WmtDTkpR?=
 =?utf-8?B?MmJiOUJyUmFwdDZGV1EvLzNmOWJBSHFpL0FUN3VDWTVJTERxVVpSdWVxK1Yy?=
 =?utf-8?B?VUFwVlVzU0RHbXdZdFNtUmdRSlBDTWZFYzlmdGwwMUY4eS9YVVF5NEVteUdo?=
 =?utf-8?B?V3Bka0g0MjJGQ0JtakF3a3kvbUdyaEJleFY0YktBMndLWU9KUlBYVllmd1E0?=
 =?utf-8?B?bEhZSjdUOVljeC9NWWgvREpzZ3RVTW5sRVVoSzcrcmxyRGZjL3dhR3ZQa1Qv?=
 =?utf-8?B?T0o1bDhnMDJLdW9tMW9JUmRKYW9TalV1V0tMa1R6eGVNSXh5RG5GRnRUQmpj?=
 =?utf-8?B?RHVCZVdSVWNiY0E2enJqdVluQU82RVZYeHR4bEZoelNGdnJkK0M0WGN5MXpo?=
 =?utf-8?B?ZnBITG8xMG4rZ3pjajN5SUc5L24xblppd1BENG42NHpkN3F3YjhuTlN6ZzI2?=
 =?utf-8?B?K1hJT3UwNFp6ckh6dEkrTk5USGJkaU1mc0RrcDBzU3hGajZLTkEyaDQvdk5H?=
 =?utf-8?B?ZDBpUXdDUmFBb1VYeVpXYjFJMS9PQ2tyQTR5cHExZGFyZHd0c2R6dnpHRVc2?=
 =?utf-8?B?SGQ4elJlNEU1VnRnaTdyaUFSMlJJeFI1VU9oQW55b2M5ZjFnQ1lnVUk0U3BW?=
 =?utf-8?B?TFVYSEpHa0Q3blZPa0tTd0tHWGN6ZTdOOTlwK1pXdHRLa3MwSzNnTlhBY3lM?=
 =?utf-8?B?VEhHTDVKRHhJMlNHbUI2WnNSbkIxT1NxVjRNOEFQbzhsQitQdzIzQ1NHY2NE?=
 =?utf-8?B?NTkrbitkYjAxNEdtZ1kyNkhqSU9KMGYrSnNpam15WUl1SVVlL2tEaDlKR3p6?=
 =?utf-8?B?WlZrWWl1SFlQRjRDVlFoUnNMd09wa1F2c0wzYVBaVXNxR0QzbEdZOHJkNmtn?=
 =?utf-8?B?Nmc9PQ==?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 9531973b-7ecb-4d20-34df-08dd50ce86dc
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2025 10:16:51.4399
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OAsQJXeEzvJNYytPye7GYlkBT2QEy406eomEyD/d8FNPsIaC/C4CZP2+cEQM/E5H9D43m7iXTWDsTUbkVauPbWM60cEnfqPwXBSvjkD5JRQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR08MB8138

The RK3568 Video Capture (VICAP) unit features a MIPI CSI-2 receiver
that can receive video data and write it into system memory using the
ping-pong scheme. Add support for it.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 .../platform/rockchip/rkcif/rkcif-capture-mipi.c   | 688 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-mipi.h   |   2 +
 .../media/platform/rockchip/rkcif/rkcif-common.h   |  16 +
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   1 +
 .../platform/rockchip/rkcif/rkcif-interface.c      |   5 +-
 drivers/media/platform/rockchip/rkcif/rkcif-regs.h |  24 +-
 6 files changed, 734 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
index 0c3f7b8cfa18..751a2351cfd2 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.c
@@ -6,22 +6,710 @@
  * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
  */
 
+#include <linux/interrupt.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-common.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-fh.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ioctl.h>
+#include <media/v4l2-mc.h>
+#include <media/v4l2-subdev.h>
+
 #include "rkcif-capture-mipi.h"
 #include "rkcif-common.h"
+#include "rkcif-interface.h"
+#include "rkcif-regs.h"
 #include "rkcif-stream.h"
 
+#define RKCIF_MIPI_CTRL0_COMPACT_EN    BIT(6)
+#define RKCIF_MIPI_CTRL0_CROP_EN       BIT(5)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW8     (0 << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW10    (1 << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_RAW12    (2 << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_RGB888   (3 << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV422SP (4 << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV420SP (5 << 1)
+#define RKCIF_MIPI_CTRL0_TYPE_YUV400   (6 << 1)
+#define RKCIF_MIPI_CTRL0_CAP_EN	       BIT(0)
+
+#define RKCIF_MIPI_INT_FRAME0_END(id)  BIT(8 + id * 2 + 0)
+#define RKCIF_MIPI_INT_FRAME1_END(id)  BIT(8 + id * 2 + 1)
+
+static const struct rkcif_output_fmt mipi_out_fmts[] = {
+	/* YUV formats */
+	{
+		.fourcc = V4L2_PIX_FMT_YUYV,
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_UYVY,
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_YVYU,
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_VYUY,
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_YUV422_8B,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	/* RGB formats */
+	{
+		.fourcc = V4L2_PIX_FMT_RGB24,
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_BGR24,
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RGB888,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RGB888,
+		},
+	},
+	/* Bayer formats */
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR8,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG8,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG8,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB8,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW8,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW8,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR10P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG10P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB10P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW10,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW10 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SBGGR12P,
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGBRG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SGRBG12P,
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12,
+		},
+	},
+	{
+		.fourcc = V4L2_PIX_FMT_SRGGB12P,
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.cplanes = 1,
+		.mipi = {
+			.dt = MIPI_CSI2_DT_RAW12,
+			.ctrl0_val = RKCIF_MIPI_CTRL0_TYPE_RAW12 | RKCIF_MIPI_CTRL0_COMPACT_EN,
+		},
+	},
+};
+
+static const struct rkcif_input_fmt mipi_in_fmts[] = {
+	/* YUV formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+	},
+	/* RGB formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_BGR888_1X24,
+	},
+	/* Bayer formats */
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+	},
+};
+
+const struct rkcif_mipi_match_data rk3568_vicap_mipi_match_data = {
+	.mipi_num = 1,
+	.regs = {
+		[RKCIF_MIPI_CTRL] = 0x20,
+		[RKCIF_MIPI_INTEN] = 0xa4,
+		[RKCIF_MIPI_INTSTAT] = 0xa8,
+	},
+	.regs_id = {
+		[RKCIF_ID0] = {
+			[RKCIF_MIPI_CTRL0] = 0x00,
+			[RKCIF_MIPI_CTRL1] = 0x04,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x24,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x2c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x34,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x3c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x28,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x30,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x38,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x40,
+			[RKCIF_MIPI_CROP_START] = 0xbc,
+		},
+		[RKCIF_ID1] = {
+			[RKCIF_MIPI_CTRL0] = 0x08,
+			[RKCIF_MIPI_CTRL1] = 0x0c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x44,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x4c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x54,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x5c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x48,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x50,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x58,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x60,
+			[RKCIF_MIPI_CROP_START] = 0xc0,
+		},
+		[RKCIF_ID2] = {
+			[RKCIF_MIPI_CTRL0] = 0x10,
+			[RKCIF_MIPI_CTRL1] = 0x14,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x64,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x6c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x74,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x7c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x68,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x70,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x78,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0x80,
+			[RKCIF_MIPI_CROP_START] = 0xc4,
+		},
+		[RKCIF_ID3] = {
+			[RKCIF_MIPI_CTRL0] = 0x18,
+			[RKCIF_MIPI_CTRL1] = 0x1c,
+			[RKCIF_MIPI_FRAME0_ADDR_Y] = 0x84,
+			[RKCIF_MIPI_FRAME0_ADDR_UV] = 0x8c,
+			[RKCIF_MIPI_FRAME0_VLW_Y] = 0x94,
+			[RKCIF_MIPI_FRAME0_VLW_UV] = 0x9c,
+			[RKCIF_MIPI_FRAME1_ADDR_Y] = 0x88,
+			[RKCIF_MIPI_FRAME1_ADDR_UV] = 0x90,
+			[RKCIF_MIPI_FRAME1_VLW_Y] = 0x98,
+			[RKCIF_MIPI_FRAME1_VLW_UV] = 0xa0,
+			[RKCIF_MIPI_CROP_START] = 0xc8,
+		},
+	},
+	.blocks = {
+		{
+			.offset = 0x80,
+		},
+	},
+};
+
+static inline unsigned int rkcif_mipi_get_reg(struct rkcif_interface *interface,
+					      unsigned int index)
+{
+	struct rkcif_device *rkcif = interface->rkcif;
+	unsigned int block, offset, reg;
+
+	block = interface->index - RKCIF_MIPI_BASE;
+
+	if (WARN_ON(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON(index > RKCIF_MIPI_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	offset = rkcif->match_data->mipi->blocks[block].offset;
+	reg = rkcif->match_data->mipi->regs[index];
+	return offset + reg;
+}
+
+static inline unsigned int rkcif_mipi_id_get_reg(struct rkcif_stream *stream,
+						 unsigned int index)
+{
+	struct rkcif_device *rkcif = stream->rkcif;
+	unsigned int block, id, offset, reg;
+
+	block = stream->interface->index - RKCIF_MIPI_BASE;
+	id = stream->id;
+
+	if (WARN_ON(block > RKCIF_MIPI_MAX - RKCIF_MIPI_BASE) ||
+	    WARN_ON(id > RKCIF_ID_MAX) ||
+	    WARN_ON(index > RKCIF_MIPI_ID_REGISTER_MAX))
+		return RKCIF_REGISTER_NOTSUPPORTED;
+
+	offset = rkcif->match_data->mipi->blocks[block].offset;
+	reg = rkcif->match_data->mipi->regs_id[id][index];
+	return offset + reg;
+}
+
+static inline __maybe_unused void
+rkcif_mipi_write(struct rkcif_interface *interface, unsigned int index, u32 val)
+{
+	unsigned int addr = rkcif_mipi_get_reg(interface, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, interface->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused void
+rkcif_mipi_stream_write(struct rkcif_stream *stream, unsigned int index,
+			u32 val)
+{
+	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return;
+
+	writel(val, stream->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_mipi_read(struct rkcif_interface *interface, unsigned int index)
+{
+	unsigned int addr = rkcif_mipi_get_reg(interface, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(interface->rkcif->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_mipi_stream_read(struct rkcif_stream *stream, unsigned int index)
+{
+	unsigned int addr = rkcif_mipi_id_get_reg(stream, index);
+
+	if (addr == RKCIF_REGISTER_NOTSUPPORTED)
+		return 0;
+
+	return readl(stream->rkcif->base_addr + addr);
+}
+
+static void rkcif_mipi_queue_buffer(struct rkcif_stream *stream,
+				    unsigned int index)
+{
+	struct rkcif_buffer *buffer = stream->buffers[index];
+	u32 frm_addr_y, frm_addr_uv;
+
+	frm_addr_y = index ? RKCIF_MIPI_FRAME1_ADDR_Y :
+			     RKCIF_MIPI_FRAME0_ADDR_Y;
+	frm_addr_uv = index ? RKCIF_MIPI_FRAME1_ADDR_UV :
+			      RKCIF_MIPI_FRAME0_ADDR_UV;
+
+	rkcif_mipi_stream_write(stream, frm_addr_y,
+				buffer->buff_addr[RKCIF_PLANE_Y]);
+	rkcif_mipi_stream_write(stream, frm_addr_uv,
+				buffer->buff_addr[RKCIF_PLANE_UV]);
+}
+
+static int rkcif_mipi_start_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	const struct rkcif_output_fmt *active_out_fmt;
+	struct v4l2_subdev_state *state;
+	u32 ctrl0 = 0, ctrl1 = 0, int_temp = 0, int_mask = 0, vlw = 0;
+	u16 height, width;
+	int ret = -EINVAL;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+
+	active_out_fmt = rkcif_stream_find_output_fmt(stream, false,
+						      stream->pix.pixelformat);
+	if (!active_out_fmt)
+		goto out;
+
+	height = stream->pix.height;
+	width = stream->pix.width;
+	/* TODO there may be different factors and/or alignment constraints */
+	vlw = ALIGN(width * 2, 8);
+
+	ctrl0 |= active_out_fmt->mipi.dt << 10;
+	ctrl0 |= active_out_fmt->mipi.ctrl0_val;
+	ctrl0 |= RKCIF_MIPI_CTRL0_CROP_EN;
+	ctrl0 |= RKCIF_MIPI_CTRL0_CAP_EN;
+
+	ctrl1 = RKCIF_XY_COORD(width, height);
+
+	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
+	int_temp |= int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_Y, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_Y, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME0_VLW_UV, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_FRAME1_VLW_UV, vlw);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, 0x0);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL1, ctrl1);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, ctrl0);
+
+	ret = 0;
+
+out:
+	v4l2_subdev_unlock_state(state);
+	return ret;
+}
+
+static void rkcif_mipi_stop_streaming(struct rkcif_stream *stream)
+{
+	struct rkcif_interface *interface = stream->interface;
+	struct v4l2_subdev_state *state;
+	u32 int_temp = 0, int_mask = 0;
+
+	state = v4l2_subdev_lock_and_get_active_state(&interface->sd);
+
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CTRL0, 0);
+
+	int_mask |= RKCIF_MIPI_INT_FRAME0_END(stream->id);
+	int_mask |= RKCIF_MIPI_INT_FRAME1_END(stream->id);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTEN);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTEN, int_temp);
+
+	int_temp = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+	int_temp &= ~int_mask;
+	rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, int_temp);
+
+	stream->stopping = false;
+
+	v4l2_subdev_unlock_state(state);
+}
+
+static void rkcif_mipi_set_crop(struct rkcif_stream *stream, u16 left, u16 top)
+{
+	u32 val;
+
+	val = RKCIF_XY_COORD(left, top);
+	rkcif_mipi_stream_write(stream, RKCIF_MIPI_CROP_START, val);
+}
+
 irqreturn_t rkcif_mipi_isr(int irq, void *ctx)
 {
+	struct device *dev = ctx;
+	struct rkcif_device *rkcif = dev_get_drvdata(dev);
 	irqreturn_t ret = IRQ_NONE;
+	u32 intstat;
+
+	for (int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		intstat = rkcif_mipi_read(interface, RKCIF_MIPI_INTSTAT);
+		rkcif_mipi_write(interface, RKCIF_MIPI_INTSTAT, intstat);
+
+		for (int j = 0; j < interface->streams_num; j++) {
+			struct rkcif_stream *stream = &interface->streams[j];
+
+			if (intstat & RKCIF_MIPI_INT_FRAME0_END(stream->id) ||
+			    intstat & RKCIF_MIPI_INT_FRAME1_END(stream->id)) {
+				rkcif_stream_pingpong(stream);
+				ret = IRQ_HANDLED;
+			}
+		}
+	}
 
 	return ret;
 }
 
 int rkcif_mipi_register(struct rkcif_device *rkcif)
 {
+	int ret, i;
+
+	if (!rkcif->match_data->mipi)
+		return 0;
+
+	for (i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		interface->index = index;
+		interface->type = RKCIF_IF_MIPI;
+		interface->in_fmts = mipi_in_fmts;
+		interface->in_fmts_num = ARRAY_SIZE(mipi_in_fmts);
+		interface->set_crop = rkcif_mipi_set_crop;
+		interface->streams_num = 0;
+		ret = rkcif_interface_register(rkcif, interface);
+		if (ret)
+			goto err;
+
+		for (int j = 0; j < 4; j++) {
+			struct rkcif_stream *stream = &interface->streams[j];
+
+			stream->id = j;
+			stream->interface = interface;
+			stream->out_fmts = mipi_out_fmts;
+			stream->out_fmts_num = ARRAY_SIZE(mipi_out_fmts);
+			stream->queue_buffer = rkcif_mipi_queue_buffer;
+			stream->start_streaming = rkcif_mipi_start_streaming;
+			stream->stop_streaming = rkcif_mipi_stop_streaming;
+			ret = rkcif_stream_register(rkcif, stream);
+			if (ret)
+				goto err;
+			interface->streams_num++;
+		}
+	}
+
 	return 0;
+
+err:
+	for (; i >= 0; i--) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		for (int j = 0; j < interface->streams_num; j++)
+			rkcif_stream_unregister(&interface->streams[j]);
+
+		rkcif_interface_unregister(interface);
+	}
+	return ret;
 }
 
 void rkcif_mipi_unregister(struct rkcif_device *rkcif)
 {
+	if (!rkcif->match_data->mipi)
+		return;
+
+	for (int i = 0; i < rkcif->match_data->mipi->mipi_num; i++) {
+		enum rkcif_interface_index index = RKCIF_MIPI_BASE + i;
+		struct rkcif_interface *interface = &rkcif->interfaces[index];
+
+		for (int j = 0; j < interface->streams_num; j++)
+			rkcif_stream_unregister(&interface->streams[j]);
+
+		rkcif_interface_unregister(interface);
+	}
 }
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
index ee1a50a59505..48d04a60c750 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-mipi.h
@@ -11,6 +11,8 @@
 
 #include "rkcif-common.h"
 
+extern const struct rkcif_mipi_match_data rk3568_vicap_mipi_match_data;
+
 int rkcif_mipi_register(struct rkcif_device *rkcif);
 
 void rkcif_mipi_unregister(struct rkcif_device *rkcif);
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-common.h b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
index 32f6f0238656..99249a85048e 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-common.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-common.h
@@ -93,9 +93,14 @@ struct rkcif_output_fmt {
 	u32 fourcc;
 	u32 mbus_code;
 	u8 cplanes;
+	u8 depth;
 
 	union {
 		u32 dvp_fmt_val;
+		struct {
+			u8 dt;
+			u32 ctrl0_val;
+		} mipi;
 	};
 };
 
@@ -183,6 +188,16 @@ struct rkcif_interface {
 	void (*set_crop)(struct rkcif_stream *stream, u16 left, u16 top);
 };
 
+struct rkcif_mipi_match_data {
+	unsigned int mipi_num;
+	unsigned int regs[RKCIF_MIPI_REGISTER_MAX];
+	unsigned int regs_id[RKCIF_ID_MAX][RKCIF_MIPI_ID_REGISTER_MAX];
+
+	struct {
+		unsigned int offset;
+	} blocks[RKCIF_MIPI_MAX - RKCIF_MIPI_BASE];
+};
+
 struct rkcif_dvp_match_data {
 	const struct rkcif_input_fmt *in_fmts;
 	unsigned int in_fmts_num;
@@ -198,6 +213,7 @@ struct rkcif_match_data {
 	const char *const *clks;
 	unsigned int clks_num;
 	const struct rkcif_dvp_match_data *dvp;
+	const struct rkcif_mipi_match_data *mipi;
 };
 
 struct rkcif_device {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index 2adf04e46a37..98513feaf985 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -49,6 +49,7 @@ static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.clks = rk3568_vicap_clks,
 	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
 	.dvp = &rk3568_vicap_dvp_match_data,
+	.mipi = &rk3568_vicap_mipi_match_data,
 };
 
 static const struct of_device_id rkcif_plat_of_match[] = {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
index 5dcbf656073b..5ee09604fb92 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-interface.c
@@ -188,7 +188,10 @@ static int rkcif_interface_enable_streams(struct v4l2_subdev *sd,
 		stream = &interface->streams[RKCIF_ID0];
 		rkcif_interface_apply_crop(stream, state);
 	} else {
-		/* TODO implement for MIPI */
+		for_each_active_route(&state->routing, route) {
+			stream = &interface->streams[route->sink_stream];
+			rkcif_interface_apply_crop(stream, state);
+		}
 	}
 
 	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_IF_PAD_SINK,
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
index 07fd64174e80..3d1f0c45c638 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-regs.h
@@ -30,7 +30,29 @@ enum rkcif_dvp_register_index {
 	RKCIF_DVP_REGISTER_MAX
 };
 
-#define RKCIF_REGISTER_NOTSUPPORTED           0x420000
+enum rkcif_mipi_register_index {
+	RKCIF_MIPI_CTRL,
+	RKCIF_MIPI_INTEN,
+	RKCIF_MIPI_INTSTAT,
+	RKCIF_MIPI_REGISTER_MAX
+};
+
+enum rkcif_mipi_id_register_index {
+	RKCIF_MIPI_CTRL0,
+	RKCIF_MIPI_CTRL1,
+	RKCIF_MIPI_FRAME0_ADDR_Y,
+	RKCIF_MIPI_FRAME0_ADDR_UV,
+	RKCIF_MIPI_FRAME0_VLW_Y,
+	RKCIF_MIPI_FRAME0_VLW_UV,
+	RKCIF_MIPI_FRAME1_ADDR_Y,
+	RKCIF_MIPI_FRAME1_ADDR_UV,
+	RKCIF_MIPI_FRAME1_VLW_Y,
+	RKCIF_MIPI_FRAME1_VLW_UV,
+	RKCIF_MIPI_CROP_START,
+	RKCIF_MIPI_ID_REGISTER_MAX
+};
+
+#define RKCIF_REGISTER_NOTSUPPORTED	       0x420000
 
 #define RKCIF_FETCH_Y(VAL)		       ((VAL) & 0x1fff)
 

-- 
2.34.1


