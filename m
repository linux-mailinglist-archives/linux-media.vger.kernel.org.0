Return-Path: <linux-media+bounces-62063-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yG4kItnFC2qWMQUAu9opvQ
	(envelope-from <linux-media+bounces-62063-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:07:21 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E6109576490
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 04:07:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 65EEA305F0AA
	for <lists+linux-media@lfdr.de>; Tue, 19 May 2026 02:05:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E84F30567B;
	Tue, 19 May 2026 02:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="qAltAGaX"
X-Original-To: linux-media@vger.kernel.org
Received: from AS8PR04CU009.outbound.protection.outlook.com (mail-westeuropeazon11011020.outbound.protection.outlook.com [52.101.70.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504DE2DF68;
	Tue, 19 May 2026 02:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.70.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779156327; cv=fail; b=T/CZ/+1MgwBW+PuRgTU/MAKErFoZ1pmT/ZHhKmhKUlYxLC5XXSA0pFcFzR6N0dZA3UenVNaQtxI23147Eyae/127otWnURtt8r/FzG711MWq6Egcv/oA3KlpE0bMte6Wv8WIRt+hfJM0kZtD5Pik+LOtfcqTNx7kgx5VOCAVrLU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779156327; c=relaxed/simple;
	bh=Ac4dI1IhT+SkNe1AR3Dtik0ILr4E1k6RHymUVMlr5FM=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Sbz7gK0hxUDOrAb5qEbM8OTQUzous8FCUFzs02xUOiWak6zd1CkmZY/UGb6G0BCVR7du58J6bOrCHCDzyJaRCN3PzKDrTu4+TJqorbsOo0YF4yZTepB/0GCotQ7xIZyLEQ4sqD7f35rEedIMTKF7Ls/rr3KG6WMoYiyusOcVzcI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=qAltAGaX; arc=fail smtp.client-ip=52.101.70.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfCiePrBoih6YQHDrOQJRtKMOCSuu6OkSkkJ7w+Ox3QxpWFjqNwFzDcRITh1/7XP9j0nkAvmlRab3kL1yIN0cJKl9rBh4Yg65hPGeVmpvs189myS6gmjZXDuAbdKGh053fqZR7SVkONFiObtLtL4zvgsxma1SjADb4cDRtWkuBUfiAeEJvjCFTRMQ9jgj/F+2Qs9MqoaIAuYfRS2scQUbc2J4kOZQ6Vy0KOsmoBgFf/ByJ6I+yMTWPkt1oaUnRCAZwJtnH3ErwgyeggmjVuJMVLujW9BOC28TuH57eRt0E0aoPJQt66KHUzLHK76cWsDmkioUt9HA5CTGs2pfOo38g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7TeNWq3Z+t+OhqRO+5qtu9+iGutiISTPerWZzvjOdF8=;
 b=t8OtbXIROaycmq1aJKwJE7Wx8XAgduUe0+YsudEk/nuR0AMq1vAmTfNjpy3Nvn8D6YAw8/WqwaIIKYwHAfQCPOv1sDkatjlVpMyOhixk+1id8QtcgSMV2uV8SyN804Q/xf5MThPPWhMjXtue92czCtsb67XO4psn2ptmr7OBokhlY29M94NLUOjHZGIKNaACDang8D7CCk/gGpLI1WHnqb/+w9jvhWewwRjHqYNZRIvyins1dmSNOcLr0xBRuPZylgknvwQKWHF3HXFL/58a+HKv+rgmiIipAKR4kVOFjX6Q+5IPat0iTs17OL507ypMWUEwbW1eflZ7CjaEd9+E8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7TeNWq3Z+t+OhqRO+5qtu9+iGutiISTPerWZzvjOdF8=;
 b=qAltAGaXVM2gQYq/KjmvST3yfNzGeRTgi0X7ELDJuMYgT8/92UZ7l0jJo4CK8YFlkhXNz7tYzh1/2dzGD5rM7XEUqmU7CwfmzyiDBvaoy1jgnZ41sJE2mFGJkKmZsfZseG5s86EtyDsKW81ZmHTyKD89pZax4ImrfWKaoT45bjBHjIM7y2Vclh5nnLn0JR/bagPWADTs8SfsWCZ0Yc60orWJe1QbonOSDSufRklnh5k3GCOb+TeXT9dB051w4S/iwWf+AwAywp7YMPnoKD/LI2pjolra4g3Bud47O+ulNVFvOvKtJNjSEbhCBKR5TNn0sQCj6ZPpjECO+BK58SiJHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DU7PR04MB11139.eurprd04.prod.outlook.com (2603:10a6:10:5b1::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.25.23; Tue, 19 May
 2026 02:05:22 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.21.0025.023; Tue, 19 May 2026
 02:05:22 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Tue, 19 May 2026 10:07:40 +0800
Subject: [PATCH v4 3/6] media: synopsys: Add support for multiple streams
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260519-csi2_imx95-v4-3-84ea4bb78a88@oss.nxp.com>
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
 Guoniu Zhou <guoniu.zhou@oss.nxp.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779156481; l=2908;
 i=guoniu.zhou@oss.nxp.com; s=20250815; h=from:subject:message-id;
 bh=Ac4dI1IhT+SkNe1AR3Dtik0ILr4E1k6RHymUVMlr5FM=;
 b=tm01bXmHfYJKTuA/USfGTxjBX/F5GKDzWqYlZOWx41TbFOb1jiiD28l0yiTk5zZd+NxPMVclH
 SwuRJXHudWZDNjnTtuR57T0iXlmpp5MMfdSgSCm+70v/Xk1wxl7eDlb
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
X-MS-Office365-Filtering-Correlation-Id: 5c7a7f98-248f-4483-c309-08deb54b1599
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|7416014|376014|1800799024|366016|19092799006|11063799003|38350700014|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
 j6qCYpoCMUAtvDyUFi4XAusRSmCdjAa9XT8pW7xM67Mm1XB5nrbOWdUufO8LziNW+yr7K/0ZRY2eRVyt0NrWCznqxdB7NC88+QTNVeohbnMI2VZnVWwON1BU+pfPuKfJsef55RGZbQyrCAVt1z3J4WIWDN4x8opmszVXP2vufHX+xEStzhBeYcOcTh0NJn2RWLha8NL3QDQj78MF2wIen3RMjb+0o7jPRdd/Ze+K/oOuyIXoWsC3scig4XbKYI0GV+FyAf8jwW6Qn7OHOxo4c2o+Za0A+cOm979aLQxF1MVcCBoDHoTc1amrKryAYIwfEFIgxMvdueTZPUpk6TqTGcgalqq3vzlcqmitMFlccbARahshUB/prWh65Srf8+WYeJGTNHkMFx2Ri24tHeH6qyFWoLfXs+4yMXTe8sPgaK/LH2NPeHacEvnfBU73K2FLGdO6Gs7pzGyUhQB0xi3+yBHg3Xt8g6A0bZmjuL1ucdWb5njtjM/+QqFvSknJswjx1xSHoR1DH2TfFbZ9yb40LfUCmFvycApX835SmfWj3KQOgx5MvOwMFMCTPjqHkI//4eJVzPjW5hRKYOS/6y6iiGIlMVe2gD24C8d8Qwc3bPqqlccMGFmbJSPUZsru47SirLN8rvxijQsvVfRS35UeJvsMaRMMr/Az+cKW00/iCVSztLRZYWuKgZwxgPkQn09O3OKzm0A09Suf4XY9vrexvlm+M9eOkpLp/9JjqDTZF74iUGp/OpfIsZXOX0v+3Ih+kazIpv1zUEUlC0stPqDfFA==
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(7416014)(376014)(1800799024)(366016)(19092799006)(11063799003)(38350700014)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?UjQ0SWVBM3BGNGdiVER5bEx5T0k0MGFScTFFR0pZZytYOTJkT0RRaytNcm03?=
 =?utf-8?B?UDRHTldnd21RYW9kbzloelZJTkV3eXRVRzAySUVQSUM0WUg2aDFpWGwrMlBY?=
 =?utf-8?B?aDUrZ05xVDhKeDl3NS84b20xa09YWkFEeGFoVFVlT24ydzh6TVJQUnFaTnRx?=
 =?utf-8?B?YjlPQUd3WGs3YWtNVlF6RWg0ekpoZ01URFRwTmZaMXZPS0FhN2wyWm1TSUZt?=
 =?utf-8?B?WnlUOCs0UzNRc01kOEp1T2ZDdGZoWjNLVUF3dHlsSVRoTTRIaUpOQVY3RUJl?=
 =?utf-8?B?RXgyMklKMDlnSmNyWGhzS1BIL0JmT0NNUFlLOXNtT25Qc2prSVd4czF5MzRi?=
 =?utf-8?B?RzJJN1FJL094NEJPYTdXOHBRc0VVbGNyeHhDR284bEpGVlZUVzByRk9oc2FK?=
 =?utf-8?B?WDNJSlNJVG9ZaVUxV2NnVXY2clR6N2ZOODRLdU4vcGtGQlVxU3lsL1ZKQWxu?=
 =?utf-8?B?UGVxSFFGN3VtQVRUQ2l0WDN1d0s4dkxCSkNaQ1RpcXlDZVZoSkdTMFc0cmxN?=
 =?utf-8?B?VTA3dUZTVmtZd3V4NVVKTHFXTVk4bTFmeTIwMnBoWW9HbUVOUmMzMlFiOEox?=
 =?utf-8?B?eTc2TGQyUC9TRFNHUUZPcDQ0blQ4UktWbkttd29kNTFSQWs3VWJ4aDByYm1w?=
 =?utf-8?B?cXNQdEdtZnFzYzBuU3VTUjZTcVBBR2NNUkhYSlFFWVE4ZjVrWU1ZT2JQQjRp?=
 =?utf-8?B?MFdhQlUvbVVRMituOGVyVktFRk5uemErV3NjSHRISlVUNmxwMi9TOHNiNXVY?=
 =?utf-8?B?T0NDZXltTE0vRDJIUENJaW9RRDRkWVA3ZjdHbzBVellNamU3UitZQnBaMWpK?=
 =?utf-8?B?bGJsYnp5bXVXK0ZpaHVkN2dJZ2FnNHZxNXZhTGhoUGljblZ6Skd3cFFRWlUx?=
 =?utf-8?B?OHpoSk51NUlYcmJCeHYvZ0NmYWVjQ3Z5TytFUGo4UE5xL2I4dUZGcTBHRjBH?=
 =?utf-8?B?Q0J4NlZoZm5hS1FQOEk3SFdUcEhITnZzeVBmanZKQ2VORGJQeGNkUnBEUVRx?=
 =?utf-8?B?OGR5ekpxQlJwamoyRVpuZXFNTTJvRUhlbVF5Um5sSzJteSt2eUQxUW1iaEpL?=
 =?utf-8?B?QXBzUW4xL1hWWmk2amRqNnlyaDNZdnFXdU5LQ01STjlCKzBpR3MwYVA3ODUz?=
 =?utf-8?B?ZXdIVU9PWjI3Qy9uREJYK0VqVnowZEtTQUt3TzlWc1FtZVRNbkJsU0dtenlV?=
 =?utf-8?B?VVVsUjZpRllUMWdpbUdZTyt0djZCNFk4M3lmWlI2YXlWSmtDT2FDOTFYRnZU?=
 =?utf-8?B?ckkvVjNWUk8rK2NoUS9CK0Vtc1NhdDU0Vyt0Uk81ODlZTVdTemJhaTlxNDk0?=
 =?utf-8?B?WTB5WTd1VUVLL21ZWVpOWk9IbXZDZVhCbzlmTFp6MHdoVGtXN1pONmFIR1NX?=
 =?utf-8?B?TWZBOVRoNDExOWMyLzRrSTRjNjJDMjNpRENueXVRZnFYKzNDUXFxdURxV0xi?=
 =?utf-8?B?N0M0UzhOR1FrRWFkU3NvWExjSy95OERSc0JSV25TYWZJekgyam5zZW4wQU1i?=
 =?utf-8?B?TllKcmhmdVE3TllKNjVzUjkvdmtTR2owdHcvemhQK1VrdGNxM1dIcTNPdUZk?=
 =?utf-8?B?WkQ4eVZGc0puRndBN3Boc2pubzhVWTJGZTZ6d0FHQnhOK1dETWgzdElISzJX?=
 =?utf-8?B?MSsxZDNtSGY4cFVyTlFxOWl3UUZEZFNkemduM0x4bytid1BiMkhjb2JPaU5i?=
 =?utf-8?B?bFFhZ2RjTjNNOGZya1NSSlYyWERmbXVxYStBZGNnRjhRd1JwbERIWEdUcmRF?=
 =?utf-8?B?LzdEeXRqSmlDZlpiVStTSSsxbXJySFNpRmphWVoxelJKK1U0ckxYcTA3Z3Fl?=
 =?utf-8?B?WWhiaFYwYWZMaU0wdXZRYm9MVTRIbWcyMGtROGpBTkVYdHhaN0p1UVVockF5?=
 =?utf-8?B?NkFpQkEzTXhkWjA5UGpoUjF1U0xwNjBIc2R4dVN1VXNwWU12ajZzRDNZZldH?=
 =?utf-8?B?UEFOSjNqUGE2N1oxTUExNGhCMHpiZHA2bnpDR3lMMk9PbGI5OUtCN1hpVjBr?=
 =?utf-8?B?eTcxWFFtVDlmQkNVUVVsUXh2VVZhRTFlYW84amJEdTVhVlhveG40WGQwS0ZL?=
 =?utf-8?B?dGxLOWdDTG5ZdTRtMmxVeWU1WFoxbUZablhLTDk2aHhUKyt4RGhGS3dkajRk?=
 =?utf-8?B?RTJxZFFGeHN0ZTVzcWpnbHFuOHQzNlB1YlliM2R3M2FRa1o1R0ViL01aSDIz?=
 =?utf-8?B?QXc0TTJqbnB6aHlyZjREOU9wQURHRE1GVUNyMmpWTDNpd2JCTXNQVUJEN3Z5?=
 =?utf-8?B?MGVvNE1BK0I0ZjdONGlleUg5UnRtbTVhWVFUY1FNUXg0UjJnOExXS2lWRkZl?=
 =?utf-8?B?eVZpTUt0TGFjejBBaU0vM3lmUFNBc2ZQWVpvdExlN2VlMExFMWlNdz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c7a7f98-248f-4483-c309-08deb54b1599
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2026 02:05:22.4418
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vLg5+zFwbWhtWi7G02p9CGSz7sgga0/r4LPZ1enrjC4IcD4HeEMalHAZISE8DMMJq8Yu9UMZmQ7aWF2wDekU3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11139
X-Spamd-Result: default: False [1.94 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-62063-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.nxp.com:mid,nxp.com:email,NXP1.onmicrosoft.com:dkim]
X-Rspamd-Queue-Id: E6109576490
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The current driver only supports single stream operation. Add support
for multiple concurrent streams by tracking enabled streams with a
bitmask and only initializing the hardware once for the first stream.

This enables use cases such as surround view systems where multiple
camera streams need to be processed simultaneously through the same
CSI-2 receiver interface.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
---
Changes in v3:
- Call pm_runtime_put() after dw_mipi_csi2rx_stop()
- Balance PM runtime get/put for asymmetric stream enable/disable operations

Changes in v2:
- Simplify error handling by keeping goto labels instead of early returns
---
 drivers/media/platform/synopsys/dw-mipi-csi2rx.c | 35 ++++++++++++++++--------
 1 file changed, 24 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
index f45466ede2bb..92178a3dec5d 100644
--- a/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
+++ b/drivers/media/platform/synopsys/dw-mipi-csi2rx.c
@@ -113,6 +113,7 @@ struct dw_mipi_csi2rx_device {
 
 	enum v4l2_mbus_type bus_type;
 	u32 lanes_num;
+	u64 enabled_streams;
 
 	const struct dw_mipi_csi2rx_drvdata *drvdata;
 };
@@ -539,26 +540,33 @@ static int dw_mipi_csi2rx_enable_streams(struct v4l2_subdev *sd,
 					       DW_MIPI_CSI2RX_PAD_SRC,
 					       &streams_mask);
 
-	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		goto err;
+	if (!csi2->enabled_streams) {
+		ret = pm_runtime_resume_and_get(dev);
+		if (ret)
+			goto err;
 
-	ret = dw_mipi_csi2rx_start(csi2);
-	if (ret) {
-		dev_err(dev, "failed to enable CSI hardware\n");
-		goto err_pm_runtime_put;
+		ret = dw_mipi_csi2rx_start(csi2);
+		if (ret) {
+			dev_err(dev, "failed to enable CSI hardware\n");
+			goto err_pm_runtime_put;
+		}
 	}
 
 	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
 	if (ret)
 		goto err_csi_stop;
 
+	csi2->enabled_streams |= streams_mask;
+
 	return 0;
 
 err_csi_stop:
-	dw_mipi_csi2rx_stop(csi2);
+	/* Stop CSI hardware if no streams are enabled */
+	if (!csi2->enabled_streams)
+		dw_mipi_csi2rx_stop(csi2);
 err_pm_runtime_put:
-	pm_runtime_put(dev);
+	if (!csi2->enabled_streams)
+		pm_runtime_put(dev);
 err:
 	return ret;
 }
@@ -583,10 +591,15 @@ static int dw_mipi_csi2rx_disable_streams(struct v4l2_subdev *sd,
 					       &streams_mask);
 
 	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		dev_err(dev, "failed to disable streams on remote subdev: %d\n", ret);
 
-	dw_mipi_csi2rx_stop(csi2);
+	csi2->enabled_streams &= ~streams_mask;
 
-	pm_runtime_put(dev);
+	if (!csi2->enabled_streams) {
+		dw_mipi_csi2rx_stop(csi2);
+		pm_runtime_put(dev);
+	}
 
 	return ret;
 }

-- 
2.34.1


