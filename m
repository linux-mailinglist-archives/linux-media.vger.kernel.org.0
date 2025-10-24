Return-Path: <linux-media+bounces-45480-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B864EC056A8
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 11:48:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3D4AB35617A
	for <lists+linux-media@lfdr.de>; Fri, 24 Oct 2025 09:48:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCF8830E854;
	Fri, 24 Oct 2025 09:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="TODx6+m5"
X-Original-To: linux-media@vger.kernel.org
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012048.outbound.protection.outlook.com [52.101.66.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F185730E837;
	Fri, 24 Oct 2025 09:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761299219; cv=fail; b=gZ5k86eo06+nIOt+2uxAg7JPczbpavINxsS4zkru/TTCbTstx+EgMvnUqp3XEgpn6NP06+/kSsnrepr+926cMFhp8FvWspGCN5S3Df13H1ItyZw31xiQIUvHG+HOGW2P5Hz4gvvqh6Bc2SgJwL8svAxdssRRxVL26FzRonkF3mU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761299219; c=relaxed/simple;
	bh=JGQd+OA05ZA6ZCi+Xq8fHKXsqix7xhMmK4rphRQ8aAI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=nsjonOxq0uOJxsYwtPLuCXnA3NmB/JitR42eyxtGeq+ycih/Jl6LGghZptv9egbRhjde/tLjDOmuGPmiVrD8euOxwX47RekSqowfzHqLxDGQyBgBTGEvxjMeFOYC162X+/05e8esShTEybdAK0eNMuae1O6hAQQwxD+7cqs2Oxk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=TODx6+m5; arc=fail smtp.client-ip=52.101.66.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xrpq1ZNCf1gfM1P2qsdxZgqa+/n2o39weuma/1aNZJODsh7tvW/Ui0/nA52F28JrAt4I4M3BntUs2aW0aShqLcvKgmb9NiOrgwz1g2B9kAVJ8n0TCGm9uG7PSTCW3t3aMe3PvVIrYHL263NCgdwNZI00+kyxT1AEhuBI+dytFx/PKPbBm5eooRqIfq6VI7oFjArTsRV9MwkwSHtYVNTkwnHOgg7eARK4AmyUzkdMTEjwxwChOS56japix7zIY8g7VbVBxnbgkoBYP7KX9o7kSiOK0888x1xsLDTHtH85z5K8kTe2MdKhRomaAFwjDyOhXzg7XKMsiE8FeW8OzPYwHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g5/zpfuRr6mUvsTuqaIUqnYLpWAavDlO2za1TDiF5MI=;
 b=UQm4Dvl3EDOoxSrArbSAClNWwT6U8PS7l/l0evlwl8JtOvBzBFlx+UAOtVBi2JbSNdcY3ICwJuH+PJ/14rBB48TNL3QrRZCIVFBpIvp+9PFWslOKGpk7eO/NefNSoKopc389IcasoyGC7aqkCe0TclvYwu+TX1Nt9nAGeCIWjQ/UdwbVss8QNW1vGer1cJnJmCVBZJCnVFzBeGHX2nEaYpCGFhF4D4idNZYehl2NUM93vqfjTNKuu1bAyzF/o96uBC5TkWzG4xmK5i7exRx3YfS/pwr914c1uEKInweL2uu0V+7MBzTj8UDYomZGR1dgJUzCBNC450Zh+n88Pun9fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g5/zpfuRr6mUvsTuqaIUqnYLpWAavDlO2za1TDiF5MI=;
 b=TODx6+m5w1EOSVktHe199UKEAX2zkHV175JHoUYWHv2+UZ+GQB8je9Uu4Sp/wne8yPO9NT9eucOd4EuyhOFLh4YkTX4RDmMtdaL9nZ9W369vjDpxunM1K6+8BTRAQ1vm8BkaRyrpxtIWZ6zpIwHrSgKihOG93qkumH8kIlyXzQEBBpvn1IRHxeRrPnebXTXoSmF4J2vEfDM180Aopmcnc0DcHjg2mXJL7Y2gHH/6mJZQhUWkdy4foeK1uuVdifaItpngM9cW9LQJzUoU+sKqwcCHo46gwifokX6ghDqcSwzAZItS5OJttsDs0IjfinmjLAEvKY6PUXvulYgP8xNqhg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com (2603:10a6:102:225::22)
 by DU4PR04MB11361.eurprd04.prod.outlook.com (2603:10a6:10:5cd::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Fri, 24 Oct
 2025 09:46:54 +0000
Received: from PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488]) by PAXPR04MB9089.eurprd04.prod.outlook.com
 ([fe80::7bfd:652a:2f5b:e488%4]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 09:46:54 +0000
From: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Date: Fri, 24 Oct 2025 17:46:54 +0800
Subject: [PATCH 3/3] media: nxp: imx8-isi: Add ISI support for i.MX95
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-isi_imx95-v1-3-3ad1af7c3d61@nxp.com>
References: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
In-Reply-To: <20251024-isi_imx95-v1-0-3ad1af7c3d61@nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761299238; l=4723;
 i=guoniu.zhou@nxp.com; s=20250815; h=from:subject:message-id;
 bh=LxBaJ0ZNq1L/wwlbyj/1g6LVgNzyRFmGZGOp+N0qmN4=;
 b=hkv0JsEEISk7LSn9sbBByfWU3NUk1+c61RFABEUSua7hUkTKo6C8rWg5LuWB2u1p13EDRXd8Y
 IZb+Wxa46YeAxWCpcXsxiUJACyPZu1B1x1Qc3s5dknuCtXSRq5A3GCz
X-Developer-Key: i=guoniu.zhou@nxp.com; a=ed25519;
 pk=MM+/XICg5S78/gs+f9wtGP6yIvkyjTdZwfaxXeu5rlo=
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PAXPR04MB9089.eurprd04.prod.outlook.com
 (2603:10a6:102:225::22)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9089:EE_|DU4PR04MB11361:EE_
X-MS-Office365-Filtering-Correlation-Id: 9139b7f0-61aa-45d3-b1f5-08de12e2432e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|52116014|19092799006|366016|376014|7416014|1800799024|38350700014|921020;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?YmgyK3c4MnRBdGU1YkNLM0d3RTFENUFLZlFwVFlvdzk2V3Z2QlNobW9HK1ZZ?=
 =?utf-8?B?Zk56MDhUV05qZ29ZSlAxeTI2MGFETitnSVppVTVyd1hzbWxrc3NCdVBiSDh3?=
 =?utf-8?B?WmN1Z0ZpalJTVG8ydFRuOW1zSmNYY3FXT1RRWi9yaENhZmJsbzVnSzNJTVNI?=
 =?utf-8?B?aXAxRHpvV3VLVGNZNHV1R2t3OXpocEpRMkZxVGwzMWZDZmpaWFRaSFF5M3dt?=
 =?utf-8?B?RkdrQXRZYXRhZE5SMVliRmJ6ZDJHM05LK1pINEJFWnBPa0NrSXY4eHE1Y1h5?=
 =?utf-8?B?T2t1UVNJNTVqRVRYa3hTOGgrengzZjhZalEzUisxWlJSZHZyeUxQbXlMT3pC?=
 =?utf-8?B?MFF5WjRxK2NvT2hSWXlEMEVETmpjNkQybE5USnJVZExyTDVYN0FIK05yQ2c0?=
 =?utf-8?B?S0pRSVRCUVp4RzNGeTdmRldNZ1l6bjdEbDNkY0lmdWRzeHpiWEVCejIwMGpI?=
 =?utf-8?B?clJPNnBxZTRhSnV2RTNzLzBnRGNNeWZDV1ZOQkVKTWRoTUE2VEcrUERab2tw?=
 =?utf-8?B?VWh0TVo1c01NMWJ1eGNGSDFpUUQxbnFFcmYveWZ3SXVEL3JUZ0ZyWnlTMW13?=
 =?utf-8?B?WFU5OFY4eHlOWWtOb1gwOG04YnVtQlZXQkovTExuTitRbnl0YjIvUVkyQXlH?=
 =?utf-8?B?WTFXQmpManpUbFFub3A5NjVkNFYxU3ZRTzRXUHg5ZW02UmF2eHdsR29wem9a?=
 =?utf-8?B?SDhJVTlBMXJucFRnNzhlTmd5TEtYeksvRlYvN2JpTjhXYUYwUDhKOW84L2ZZ?=
 =?utf-8?B?Y1V4U2FQTVQzRHAxbTB3ODl6WGEvYnZxc2NOMUtTZjg5eFdoYWtwb2JkRVJO?=
 =?utf-8?B?eUMyZU1QSXZZMEFjTWJaaHFvUVVBSDRmeG95cHpxbkJHMlVFTHlEcEFmeGNy?=
 =?utf-8?B?dXlBMHFzQU9DZTM2NkF3MlczN2pnNG1MOXQ5a2dhZ1ZFV2NBc1gvKzRNRk41?=
 =?utf-8?B?eFRSSDBWYlpQZlNxb0NXLzJLa0JOdGVFdTgrVENub3pvaFQzTjEwWlpQOGcw?=
 =?utf-8?B?RmZRcjZBTk5tajQ3QzVjTmxOVkdvK1RPY3BsWXRNN1ZxNitDVHdIWlZUMUN2?=
 =?utf-8?B?UlZtMmlFWU1Fbk15STZLb09UdW91S0Nqb0djK3BLL1ByeTFqM0pHNW1JeVln?=
 =?utf-8?B?VitWQ1YwN3VNSUJMTTJMdHlZeVlYeVZBby9qckNDdXVGbWE2Qm5EVEFtbnpV?=
 =?utf-8?B?RmIxUzdoMUQ5WHZscU44dEFSWHJ0WjZTZGtndmZuaGdjeEFKRjVEVmh0bjFn?=
 =?utf-8?B?Nit1cTI0aU1ySUpSajhQTStQQVVERjdyOS9RVDZDZmhGdzdaaUFHYm05RkZh?=
 =?utf-8?B?QUVuaTVWeCtuaWp3WUkzUnlQOVdJNnc5VXFoblhCQ1dURzFjU28wUG5Sc0Jw?=
 =?utf-8?B?RENSMVJFM3RnMmdwV1RNeW5kb1lqL2NsR24vV2Z6YUZhTHY3aWJzUlp4RDNF?=
 =?utf-8?B?cTZsamlvY2swOHhrL3l3VG5FMkd1NWlGRUlnaTZDaW9pRk1UcWUrM1RUb3py?=
 =?utf-8?B?cTluQTQySzdkQkVPbkNlTnpUVktnZzd0N0pkbUxnVTRIUVFFbFlub0k2T3F6?=
 =?utf-8?B?VGkwTW5BSFpTbXVYYXNjWU8wcjNlNVhtREI0dHhrNnRNYUFHMldyQXkxVno4?=
 =?utf-8?B?MTZ3VldQUW44a2FDOXBtUkczNkl0bEczUGZuZ0QvNG90VnJWYlJad0txN3lr?=
 =?utf-8?B?Y2xyL1ZLMjRmUCtRV3d2NlRjQXhMbE5BclJ0ZkY5SmNHZVBmMkhsN1VjUFZn?=
 =?utf-8?B?QjcwZmNyWHJ6Wit5UmxPWVhlK1hUSXNtU1RBcGluR0xDYTJ2MnVwaWpQNnlZ?=
 =?utf-8?B?VEhtZGhDT1FBVEtsYUErZUk4bXZ3dmo3QklHb0c2bVdnTHBxUkw3VGZwTVFL?=
 =?utf-8?B?N1BYcER0YlZXQnY3MkFycVpUa2Y3QXFsaTcxRStObkJCMDBFSkY0SlRPQ2U0?=
 =?utf-8?B?N2Qwcm91YittZW5NVFFSU1RsZGlpWE96ZzQvdlMzOEtEcGxUM0Z4dkgxSWYx?=
 =?utf-8?B?MjdFM3l6UzlzbUFsWEMxeUViM042MFVDK1hqRkw2MlVtbS9lSXYvY3RNZGhW?=
 =?utf-8?B?M2ZZS3lMTWJUa1luK3hqaUZCS3VsVW9abnZnQT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9089.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(19092799006)(366016)(376014)(7416014)(1800799024)(38350700014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?TUZ2Y3FvVGJ0YkJWc0JGZzVEVUQ2b2VnYWpEVDlWeXQ1Y1dFeW1pazBpdmx6?=
 =?utf-8?B?NjJ2WVRsRTlJV0tUUkdMTCtOSng0VXBWOUZlM0NoMTNDMjhJRmZlOHBhUHhJ?=
 =?utf-8?B?YWFnUDJiOEppK1NNVVZMNDd4b2dpTFdnNWNSZkZGaFZBeVhseVJGVzZPcVFw?=
 =?utf-8?B?TzU5cEFGdFRpWnMwelpuci9sejZ4cldCbWtyQi9qY29zMGY4SlVxUXhHRURx?=
 =?utf-8?B?NmszTmYwZFUwbkJMUHBDd2RPbm9PYW9HemlPWEFva2EyejFpaU1ZdFRxRDJ4?=
 =?utf-8?B?d0JuQUVVRi96WUp4NUdEaWFTclFtLzBaLzVKSW11ajhXYVRVSDRIellwVDIr?=
 =?utf-8?B?aWN6UXZzWXV6WnlQN0RMZjAxWFc0MDBraFNwVlpWTUV3M2hwVnFhQkNQS1ov?=
 =?utf-8?B?UGJiTnUxbXlidDhHSno4Z2Q3WWlpNUhBWkxKWDZEZjRVYzZObUwrSXJxYW5Y?=
 =?utf-8?B?QjNQT212VWdYeEZ0ekpQeTZLVzB6K0thL0NLbVp3SXpURGZxcmRqUE16M1N0?=
 =?utf-8?B?UDRZTzhTWGdkVFV6SXUwVnV3YjgwcnFJdjFjVjYvejRoeE9yRGlzTWZHb2xn?=
 =?utf-8?B?V1cxUkdDWDlCQ3VGTzlsSTE4Qk0yVE5wdk5pemI0S0JEK3dhZzk1TkdyVS9U?=
 =?utf-8?B?cmpQWXVhdXhGYXRraXMrZzF0b1BlN0xLSUhRM2ZlSG9reHY4NEdQZ3dla1BB?=
 =?utf-8?B?T3dwQzIweDVuRmpmMVdtbitxZWh2MGkxZlJ3ck9pWis3V2xNeFloMDUrVHBO?=
 =?utf-8?B?akM4ajl2NXAyQndBVUVFUFE5ZStLZVNSc3MwLzBMR0hoYjE2VE5HU04zWWJi?=
 =?utf-8?B?Y3huaDgrRlZGUXZsOStkU3V1eXR6aFZ6bGltVThORWJFb21RaXBMM2piV1Fv?=
 =?utf-8?B?UVVOTFJHdDhaVHFtdm5waytEVDY1cDFDcW5tdWk1elBTMGVEbm9tWVd6TjNz?=
 =?utf-8?B?cGlFZ0FJV0t0RUJrTVdXbVVRU3Ric212NVlnM1JVRXdPdThtRFZxOG9BYjk1?=
 =?utf-8?B?RlhyamdPQzFaOFJUQW5mTnQ1ZkFwc20yUklOSCt1WHVwQWZTWlV5V1BqUWpT?=
 =?utf-8?B?NVVLUEw2UHpoRFJMbk9HYjFwekdsZlJ5VnpTMUZZRWVTMkwxYXJrL0JUbjZ3?=
 =?utf-8?B?b0QyMUZ6cUY2eEVkVnlaS3FBQ2N0NmQ5bmF5dlVtVUZ5VURKQTh4eEt0dlcw?=
 =?utf-8?B?MjZ5Q3FVWTVYbThzTGhjdWwwcGZGb091LzhYYm1QYVNRWDhJMGVjc0tsaHlL?=
 =?utf-8?B?d0F6ZDNNVFUwNVZFTmlZWlVtd3BYbGZpU3JFNURpZC95cTZ3WEtJQkgybFgw?=
 =?utf-8?B?R0hRQ2o3OGFPRUYyd21oZ1NzR1B1NlpVNFN0ZWRWNk5va3Rwck1FcXhuY0Vj?=
 =?utf-8?B?Q3BpcktHbC9NcytLcExKS2F4c0dKMXZjZkpqTVdWYXlYd1pFczQ3UG5GZ3hr?=
 =?utf-8?B?cjVicTl6cVpLNU83aERwMGVqUUs1L0NsUjdUaWt1RGhxRkliVGVWTURJTWlX?=
 =?utf-8?B?ZUZydnJWUW1CZUtPZXg5azBKb3NzMWxmODkyck1FZzdPZkY5amNZVjc0djJ0?=
 =?utf-8?B?YmRhRlRKOXNwMVBqMG1SZnFrc21HamlkTzBVdnp2Wk5hOTB2TUlKSDBoUWVz?=
 =?utf-8?B?ZEdWclZQUjJmOUV0cTlEMnRXZGRtRUhBUTVXeDlXWkJMRGRPMEV0a1IybjlF?=
 =?utf-8?B?YTNWcWNsR2QvM0x0Uk9TUElqelNRb3hnU1BiSEtQR0RweXVhNHRuWHhJNFpj?=
 =?utf-8?B?TTNGSmh1ZEF0YWtRdHhhNStpVklsYURGUFVuNkFhT29YaGdKamdFdU84ZFRP?=
 =?utf-8?B?NU5ncjd4ZUxHZG1RN3RFMDBHaURCVGR6TFRoYmhJVElPb3JLbmViNG5Xb3F1?=
 =?utf-8?B?L1hpTHRKZytOaW8yVjcrU1p2WnJTVlFkNWFGdTMrWTF1bm5oQ0FQdS8yWnpy?=
 =?utf-8?B?cGxVMGtkQjlrQW5XTFVCQTNLcTNjbkRsazZodVBSdTV6dVh5RzhDRXBncDNs?=
 =?utf-8?B?b09PdnN1UklWbTlLUTUzS2JUNk1FK3Zva1Evc2ZpcTBPOFBnZ1crQ3U2dlcz?=
 =?utf-8?B?MTBDaFY5bTBWY0l1Rk9TN1BnQWdITHh5YkRVUW40Tk81Ynk2cFNSdmF1VFU0?=
 =?utf-8?Q?BA6PCCwbu1xYap69xNZ5oKsXI?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9139b7f0-61aa-45d3-b1f5-08de12e2432e
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9089.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 09:46:53.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OlfAjO3yY/Oxmlwo3YvkD6obY/FUVY1hcwAChCDnUeHZEXF+xx20Bsey8Giz64nA9gJQ4a+4z5q5Ry2DWGWN4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU4PR04MB11361

From: Guoniu Zhou <guoniu.zhou@nxp.com>

The ISI module on i.MX95 supports up to eight channels and four link
sources to obtain the image data for processing in its pipelines. It
can process up to eight image sources at the same time.

In i.MX95, the gasket callbacks set ISI QoS which decide the priority
to access system memory when there are multiple masters access memory
simultaneously in camera domain.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
---
 .../media/platform/nxp/imx8-isi/imx8-isi-core.c    | 13 +++++++
 .../media/platform/nxp/imx8-isi/imx8-isi-core.h    |  2 +
 .../media/platform/nxp/imx8-isi/imx8-isi-gasket.c  | 44 ++++++++++++++++++++++
 3 files changed, 59 insertions(+)

diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
index adc8d9960bf0df87d4e475661a3439beaf5ce9f6..ea9cc6d72bd4605000c6cbac2fa8cb9806e3cd3b 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.c
@@ -337,6 +337,18 @@ static const struct mxc_isi_plat_data mxc_imx93_data = {
 	.has_36bit_dma		= false,
 };
 
+static const struct mxc_isi_plat_data mxc_imx95_data = {
+	.model			= MXC_ISI_IMX95,
+	.num_ports		= 4,
+	.num_channels		= 8,
+	.reg_offset		= 0x10000,
+	.ier_reg		= &mxc_imx8_isi_ier_v2,
+	.set_thd		= &mxc_imx8_isi_thd_v1,
+	.buf_active_reverse	= true,
+	.gasket_ops		= &mxc_imx95_gasket_ops,
+	.has_36bit_dma		= true,
+};
+
 static const struct mxc_isi_plat_data mxc_imx8qm_data = {
 	.model			= MXC_ISI_IMX8QM,
 	.num_ports		= 5,
@@ -548,6 +560,7 @@ static const struct of_device_id mxc_isi_of_match[] = {
 	{ .compatible = "fsl,imx8qxp-isi", .data = &mxc_imx8qxp_data },
 	{ .compatible = "fsl,imx8ulp-isi", .data = &mxc_imx8ulp_data },
 	{ .compatible = "fsl,imx93-isi", .data = &mxc_imx93_data },
+	{ .compatible = "fsl,imx95-isi", .data = &mxc_imx95_data },
 	{ /* sentinel */ },
 };
 MODULE_DEVICE_TABLE(of, mxc_isi_of_match);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
index e84af5127e4e7938e55e31b7063bee5e2cd4cb11..d1297ac26c56bdd97e4dd325b2a7394430a7adb9 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-core.h
@@ -161,6 +161,7 @@ enum model {
 	MXC_ISI_IMX8QXP,
 	MXC_ISI_IMX8ULP,
 	MXC_ISI_IMX93,
+	MXC_ISI_IMX95,
 };
 
 struct mxc_isi_plat_data {
@@ -297,6 +298,7 @@ struct mxc_isi_dev {
 
 extern const struct mxc_gasket_ops mxc_imx8_gasket_ops;
 extern const struct mxc_gasket_ops mxc_imx93_gasket_ops;
+extern const struct mxc_gasket_ops mxc_imx95_gasket_ops;
 
 int mxc_isi_crossbar_init(struct mxc_isi_dev *isi);
 void mxc_isi_crossbar_cleanup(struct mxc_isi_crossbar *xbar);
diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
index f69c3b5d478209c083738477edf380e3f280c471..6418ee1aabdad3cb92e84f2ef6406c5503987401 100644
--- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
+++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-gasket.c
@@ -3,6 +3,7 @@
  * Copyright 2019-2023 NXP
  */
 
+#include <linux/bits.h>
 #include <linux/regmap.h>
 
 #include <media/mipi-csi2.h>
@@ -83,3 +84,46 @@ const struct mxc_gasket_ops mxc_imx93_gasket_ops = {
 	.enable = mxc_imx93_gasket_enable,
 	.disable = mxc_imx93_gasket_disable,
 };
+
+/* -----------------------------------------------------------------------------
+ * i.MX95 gasket
+ */
+#define ISI_QOS						0x10
+#define ISI_QOS_AWQOS(x)				FIELD_PREP(GENMASK(2, 0), (x))
+
+#define ISI_PANIC_QOS					0x14
+#define ISI_PANIC_QOS_HURRY_AWQOS(x)			FIELD_PREP(GENMASK(2, 0), (x))
+
+static void mxc_imx95_set_qos(struct mxc_isi_dev *isi, unsigned int val)
+{
+	/* Config QoS */
+	regmap_write(isi->gasket, ISI_QOS, ISI_QOS_AWQOS(val));
+
+	/* Config Panic QoS */
+	regmap_write(isi->gasket, ISI_PANIC_QOS, ISI_PANIC_QOS_HURRY_AWQOS(val));
+}
+
+static void mxc_imx95_clear_qos(struct mxc_isi_dev *isi)
+{
+	regmap_write(isi->gasket, ISI_QOS, 0x0);
+	regmap_write(isi->gasket, ISI_PANIC_QOS, 0x0);
+}
+
+static void mxc_imx95_gasket_enable(struct mxc_isi_dev *isi,
+				    const struct v4l2_mbus_frame_desc *fd,
+				    const struct v4l2_mbus_framefmt *fmt,
+				    const unsigned int port)
+{
+	mxc_imx95_set_qos(isi, 0x3);
+}
+
+static void mxc_imx95_gasket_disable(struct mxc_isi_dev *isi,
+				     unsigned int port)
+{
+	mxc_imx95_clear_qos(isi);
+}
+
+const struct mxc_gasket_ops mxc_imx95_gasket_ops = {
+	.enable = mxc_imx95_gasket_enable,
+	.disable = mxc_imx95_gasket_disable,
+};

-- 
2.34.1


