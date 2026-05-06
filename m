Return-Path: <linux-media+bounces-60552-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4AfSJ20D+2kbVQMAu9opvQ
	(envelope-from <linux-media+bounces-60552-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:01:33 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC114D83FF
	for <lists+linux-media@lfdr.de>; Wed, 06 May 2026 11:01:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E020230B7A12
	for <lists+linux-media@lfdr.de>; Wed,  6 May 2026 08:53:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43E47282F1E;
	Wed,  6 May 2026 08:53:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="dF7k51OX"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013028.outbound.protection.outlook.com [52.101.72.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CA2A3E928A;
	Wed,  6 May 2026 08:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778057576; cv=fail; b=Ya0ljU0fAStuT5xItm7Zo6n5fVV//D8GbKZEytA9RzUHwJ2hCW9W8mir/605xguhGfB+foW/Tz/CNuoNAt3SIkaBSjE4oCmo5lJVKzMJO0yeIvBm5FuBKo3Xpf3hzzu1bO1YvA2wTurw+1l9z3YqcrlKwmZ6dzG5+/O2+zAXY5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778057576; c=relaxed/simple;
	bh=FEG5bYsPBxZ4dSkv2k1aIVamftOpHreA3QLGwnJexfk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Rsb/AarLAx4/+xugtvc2b8qM+wgQ5ubWpam1NeplKm3B22SD8Be7d1eZ9MA0VtGDaay4lf1mtOhyFxL1h3pMS1l3UMjb8vbxkXnzbGCDF+2xKCMlUPohwGO9r2Lmc6VYIIp12XKV+EYD0vcX8BD4Wt7M7Z7lGTUYEQZaZv0es3I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=dF7k51OX; arc=fail smtp.client-ip=52.101.72.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jJPrsQXL7noWBi4ffksK1aoj9/kjLd7coL4r5KHQgz1vgNkp3hyCt7znZMUU61BK8v2/9SHDZ+gPbNCxhpPj2UNGZF9CSSe3LCOTsFcl0mgOJ2ECGuq6SFR+acxJEVNQVjLyeV+VT8oY2QI0YIx4srIEvMhvq03enShiyUquFjx233Fq5/JkPPiqgMKTdiWB3yxIUY7sThw95BX5KNjJT6nc4bAgBFvd3byolLVFu/wAhIzTKj6OvK5m5PVRsE4JwsW2owjkCnLdlB/O6HbJwLDn4tINZ9TFbXIWaFT6QKN902g+n3xWgmhX8VvArDqYydUr4vS1nQtY27+59XVBUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVPS/YZ1oSIlrkSb8D1UOrXNB6sJr5b517OMbwu23HY=;
 b=aSRN5n+CKSgXIg3KB9jdtRXh6SQPqjUVxdRdgrPTqe6ci4VAW/DAqeONpCAA7e5MYtSht3DRUXCnqRR3IdPOi0DUibN5uiL1AgZwhSwfa2InPcfJ6ODzuNOVX3canYM+EokkB098Q1geplfcZK4O1Zn3Jzb5PBiR1CORBlqHBUndQiLCqk9Xqc8t5iZ2q6SgGtRPqKVpqpcjumkTINMIMjc8g9oQlNE4kBawYQPufoMMoqhsN4sVkNy9zKDupJdvsdsoXOVaWCqeHjRGc+DgX/ANJJzYMkK5F2bjpntlesDGzK64uLfm5t197TS6cUs7nD4OlI97l8ksmBel9OI78g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVPS/YZ1oSIlrkSb8D1UOrXNB6sJr5b517OMbwu23HY=;
 b=dF7k51OXEdkN9vez6c6JVq/JZQgyf9XM932C2jg19SWJB/ir+xeyB89LRfhAH/VylRuvp6j7EutquCq9t+zOFd0y9Ir2j3lPaf8P2SKxFlEDEv0EyI7AS+PA87QuL4cf8ht9jrwCFGb2wRszQ76Hgr3uTRwS2yKTqJOSEn9JUF0bfM1LsoEKYL3nGWTuneto1ZiZMspq3v+hwOLCtGbd76SOZU0tG9V8wu49MegIzvum6b3v5yW/P/6gjC2kQqVvD247DKXn+ecegbL07ziRk0js/B0bnZbBOT5Cl9NKoeOOHKEtNzn2hTmoNGagltNOnWNi9rWo0uGwjAGYFvI4xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB8091.eurprd04.prod.outlook.com (2603:10a6:10:245::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.15; Wed, 6 May
 2026 08:52:44 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9891.008; Wed, 6 May 2026
 08:52:43 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Wed, 06 May 2026 16:54:06 +0800
Subject: [PATCH v3 7/7] media: synopsys: Add support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260506-csi2_imx95-v3-7-953b6e1a80dd@oss.nxp.com>
References: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
In-Reply-To: <20260506-csi2_imx95-v3-0-953b6e1a80dd@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778057665; l=2362;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=FEG5bYsPBxZ4dSkv2k1aIVamftOpHreA3QLGwnJexfk=;
 b=dNPZd3JC/pYsUDCKlSIv407oUEEFZsirO1UjkfjwBlsU1cNnp9PMJTmuPJ4ac4du7zKiN1jFl
 f4f/NEmXkG1AQjmNiiISPI4rPpQoUSI3OGjwpCSlGYCQ93tYeQ0iVVg
X-Developer-Key: i=guoniu.zhou@oss.nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SG2PR04CA0203.apcprd04.prod.outlook.com
 (2603:1096:4:187::22) To AS8PR04MB9080.eurprd04.prod.outlook.com
 (2603:10a6:20b:447::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|DB9PR04MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: e6b02116-8f18-4716-1bbd-08deab4cd605
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|376014|19092799006|1800799024|7416014|366016|921020|38350700014|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
 vLJglNAZgu6kMUgl0hF2EoXpoQq35R1UKPAPiCE3AggRYASy1QSezxYFRigJXNvvoa+m80X6Fv5lUgscEFlvpKsGAY3HwBKVyVq39tw8fJXkz4YuesYJ/ct+ox2LcTdqgCkqlxrbOR2Kt9lZeJeLOr7Z347Wn3LG8+IJDK/dZtqxFElNTwgOYP6D9HJ7qn9Qp/mhkz9+9iO3aFnw+sJGQHgdk+5j+MAtUTFF2+R6iyfIVftxDGVihVJa+hLOBoX8YP05ezsSHXHFmx+vP62sUS4wSgi3RsT1/P7M46lXfRMg9FPMg7E9OFPciT8uBClwGjvhiHrKW8Ts/LIWIetUd8B2p4CTFAJoGATvAfBEXYY2bJPm7+b5kaKCVf0JMjFaFQdkTTM7aMeogDNU1S13FOW1P3fZlGjNJKoGBc+GjH+EWnvXabxX93WhcbI/v3I5DrKkbmM1VjjV+Csrsc8TYbqcHyaY9b3rLsCByYepB5zyPo7h1If2OtsyyzJstVJAR9wSXZ0p8m3mr8I7T5t7ieW8XojRnIVLO+qOB+5jFVypT4TjgdHbVJi5RIEVEWTlcorS/Y7bTp9jELGg1o/D+5W7peIi/PrKhDM3lWEYiohWXMIaHSdR6e26VNZK7a6FfIoFXcbgpAPTqfFRuVwQE2rG6ygFrCmpXh5O2tlXu3U6zi2Vi1p+TKp0jUAagIxwpAe7ueoxfgxrrUX+UNN8812iONWgJKNz6SUE2mYZUeqgDt4goJUAVz9PdiEQrWoJYdGKlXWjw+h2qr1oD7D6FA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(19092799006)(1800799024)(7416014)(366016)(921020)(38350700014)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?K2JvV1NZMXJ1OHhhVmFMWHpGV1psUkg1c0lSMFdxM2NVYm03MDlWN2M2WVpH?=
 =?utf-8?B?RFdJYVFPWTNQYms0R3N3N2tpeVBQTmpUU0RJRlNSVnQvM0FDK0J3TzlQVkYv?=
 =?utf-8?B?RVJuaDF2WXhLRnhaMHRkRWFGenZVZy9zMEFsSWlpNVZ2Wm9Fb290SHZ2S1JV?=
 =?utf-8?B?TUxnQUxWRDUyZUUwM1lMcmJIMEwyaVZ6TG0wQWZveDVvK1RiMHUyWlhSK1lt?=
 =?utf-8?B?Z08rT0x3b2tvcEZVWFdJY2NiSjNTWk95bkthYlBkU2ZsK3UvS01nSlV0Zkgv?=
 =?utf-8?B?WCtPRUpvUm5pSXRoSElpVlBGWngrLzIzSElONWtmZ21IdklUUi9jUTBGUEUv?=
 =?utf-8?B?N2pXdzNiNjYyRGxEWUk5b0VyalVESFY2V1l0MUVqRGlKT3h0Q2kvSVlOeW9F?=
 =?utf-8?B?NEEyYWFhVDQxZHJGSExlaENLTGxOZ2pwZXZVSEtmeENucHh1L1VoZTl3cUJK?=
 =?utf-8?B?cmxGQWpQQVhxRWwyR1JUNXh6dEtPajNmQm1OdjQ4ZTdZb2tTL2VMblM0WXN0?=
 =?utf-8?B?cjUrcGR5akRhOWFOdTFDM2JxQk5yQ01LcFNLM1J0WTlzVCtISjNJL0IvK1Jr?=
 =?utf-8?B?OE9BdkJrRTdoYmMvRURJWEY0ZmNhYndxMUpnQjc4NmFTbndicGQwN1JmYy91?=
 =?utf-8?B?NWZYWGVBMzBtVDlVUm50VGc5bFpBSk9UMDBld3ZjU2JSQmd2Ky9NRExjUk1w?=
 =?utf-8?B?UWFXdVJiZGN1OTNRakZIZ3pGbVpYbzREZW90UmlVMkpkZEcyR1ZIdHVXNURT?=
 =?utf-8?B?SHV5K25uak84OVZLVGdoTDkyN3Z2N2hMVDRQVUpzZEw2bkJLazE5Nm1OK1lm?=
 =?utf-8?B?K25memdVOFFERlJqaXg5cGdXVHY0YU9aSFdKQzV6N0p1Z2cyYW9WcUQvclZP?=
 =?utf-8?B?N2l5eEZGVEFFTFp1aEwra2hvdXFwVXRmV2JwZndsR2M3SGpSSjJtckJHK1JL?=
 =?utf-8?B?K0NGMEJPYkpGUW1ybEdRUm0yQXp4WEdWTUZsVDVtRjFjOURIbnBRbEhrdTNR?=
 =?utf-8?B?OWlydzViTm1KcjdTZ3ovZGJ4Z2p4Q2kwSHV6NEU5aTBPVHJSWEZIVDR4V1gv?=
 =?utf-8?B?WGU2WE0zMXlPdHM0c0FYWmNQaFNQUUw2SE5GL2orVWVNeDNhVElVRHYwK3Bl?=
 =?utf-8?B?cit2TUxGUTEvREhwbDNVcHQ3L0RoeHZCVmtET3dPV3JXUit3SWhjYjczL081?=
 =?utf-8?B?VTl2clowL2x4NGV0QlNKaVV2QkMxU2kwSzNPbUtYSWM0VHFqVDJNRmQyN0hG?=
 =?utf-8?B?RTkyTCs2VjJiUXY0TzZvYzhLUGRkTm1jcGxWdnFuUlRCeUhQU3NLa3dQbG5s?=
 =?utf-8?B?RU9vMVkzZkdiZzN4dlJ1amtTRGhlbW9aT2hSVGtxOTB1M0txYmErWndaMjVY?=
 =?utf-8?B?M2pFVHl5WWpER0FUR2ZrWjlmalBzVkczNzZZL2FrOTJ5V3FmYmdRT3ZHekdl?=
 =?utf-8?B?elg2cHhERkVoWWdOOHZWUjN5cVpTY0tjclM0V283V0d4T2ZJWkoyTUI0OE5p?=
 =?utf-8?B?SVVqMmZvWXM2R3ZVeTZCRHZkM2s3d3Z1a0RncTZDRGhoVkRRcGNFcFpURFc1?=
 =?utf-8?B?L3l2Q3pGci9WR2EyTFdMcWxsNGlWazV1RGxVQVZ5WnVWSThlZVhQOUc1U1lB?=
 =?utf-8?B?aUN3SVFhQVJ6ZDFrNkZEbjJGRi9zaWtwYVVQWTY5eTl6ODgrWXFrb0l3QjMz?=
 =?utf-8?B?eU9nZ2pydE15WFcvbEFZRWZnVnVtNUVKSU4zT1djZHB0ZWV1aGhFdEJBcXlj?=
 =?utf-8?B?b2x1T2FhQVNSL3pMT1RzM2p6Nkc1TDZPbElFZks3RDdPZjJlUXMwYmhkQkdr?=
 =?utf-8?B?Y3B4TTJ1L2FUZytaZ2kwQ0FTNDMvV1o4Y2FmT0ZMb1NQRzVuTmk0VjIzMG45?=
 =?utf-8?B?Q05SeFV4dFZGYVFZNlZBWFYrZi9PdE1hQkgxdWxTY09LU1Y2Q3A0M3F4MUpM?=
 =?utf-8?B?V3ZpQ1dBU2k1aCtCZ1J1bDJMcWpEbnhQMzlxRllXUTJlR3hiMXNtNFVFWEVl?=
 =?utf-8?B?TTFpU2N0aXA3d1JTbWZTVUNEQVBaZ0IxUlJUVlh3UGttaG9oRWp5M2trVGNK?=
 =?utf-8?B?bmRrZ0l4L3RVWUtJSkZKVkFqZUpDVmcwdE1DazZjYjY1QnRCbEM1MDRheDlY?=
 =?utf-8?B?UEx5MFNrUUJ5R3o3QnBhREpIWmg4N2UycSs1eGlTbjdsR0hhL2x0NzZaWXFi?=
 =?utf-8?B?Z0dnYmk1Y2d6ZHQxNlE1WEhlUi9OYWhzdElIMmV3NjdzcVkwbk9aMW9CZmxE?=
 =?utf-8?B?dGFWYjBURC9mMlVlUnF3UVkxVUE0TUZDY24zUy94VnJtaG9xUDhjM1E5QUlQ?=
 =?utf-8?B?Y0lRcmRLZnpmV0EzcThSdDdEbkdsSUlZNXBNV1ozRU9uK2F5RVlWZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6b02116-8f18-4716-1bbd-08deab4cd605
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2026 08:52:43.2138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JxKoDhjwsC6+3rCMr71f230twOKV/sorRzqVu62HbG1ZJPwT7UCS4YF5tyuY+VmCOhRmglhhyvvrnJeV2TRhmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8091
X-Rspamd-Queue-Id: 5EC114D83FF
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-60552-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[19];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-media,dt,cisco];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]

Add support for the i.MX95 MIPI CSI-2 receiver. The i.MX95 variant is
nearly identical to i.MX93, with the main difference being the use of
IDI (Image Data Interface) instead of IPI (Image Pixel Interface).
However, the IDI interface is transparent to software, requiring only
a different register map definition while sharing the same PHY control
functions with i.MX93.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v2:
- Add Reviewed-by tag from Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index 8a34aec550ad..41e48365167e 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -154,6 +154,17 @@ static const u32 imx93_regs[DW_MIPI_CSI2RX_MAX] = {
 	[DW_MIPI_CSI2RX_IPI_SOFTRSTN] = DW_REG(0xa0),
 };
 
+static const u32 imx95_regs[DW_MIPI_CSI2RX_MAX] = {
+	[DW_MIPI_CSI2RX_N_LANES] = DW_REG(0x4),
+	[DW_MIPI_CSI2RX_RESETN] = DW_REG(0x8),
+	[DW_MIPI_CSI2RX_PHY_SHUTDOWNZ] = DW_REG(0x40),
+	[DW_MIPI_CSI2RX_DPHY_RSTZ] = DW_REG(0x44),
+	[DW_MIPI_CSI2RX_PHY_STATE] = DW_REG(0x48),
+	[DW_MIPI_CSI2RX_PHY_STOPSTATE] = DW_REG(0x4c),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL0] = DW_REG(0x50),
+	[DW_MIPI_CSI2RX_PHY_TST_CTRL1] = DW_REG(0x54),
+};
+
 static const struct v4l2_mbus_framefmt default_format = {
 	.width = 3840,
 	.height = 2160,
@@ -914,11 +925,22 @@ static const struct dw_mipi_csi2rx_drvdata imx93_drvdata = {
 	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
 };
 
+static const struct dw_mipi_csi2rx_drvdata imx95_drvdata = {
+	.regs = imx95_regs,
+	.dphy_assert_reset = imx93_csi2rx_dphy_assert_reset,
+	.dphy_deassert_reset = imx93_csi2rx_dphy_deassert_reset,
+	.wait_for_phy_stopstate = imx93_csi2rx_wait_for_phy_stopstate,
+};
+
 static const struct of_device_id dw_mipi_csi2rx_of_match[] = {
 	{
 		.compatible = "fsl,imx93-mipi-csi2",
 		.data = &imx93_drvdata,
 	},
+	{
+		.compatible = "fsl,imx95-mipi-csi2",
+		.data = &imx95_drvdata,
+	},
 	{
 		.compatible = "rockchip,rk3568-mipi-csi2",
 		.data = &rk3568_drvdata,

-- 
2.34.1


