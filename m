Return-Path: <linux-media+bounces-66020-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id /6pnIsPKQmpHCQoAu9opvQ
	(envelope-from <linux-media+bounces-66020-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:42:59 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 224C46DE785
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 21:42:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=NXP1.onmicrosoft.com header.s=selector1-NXP1-onmicrosoft-com header.b=sEGOcw1H;
	spf=pass (mail.lfdr.de: domain of "linux-media+bounces-66020-lists+linux-media=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-media+bounces-66020-lists+linux-media=lfdr.de@vger.kernel.org";
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=nxp.com (policy=none);
	arc=reject ("cv is fail on i=2")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1E136300A487
	for <lists+linux-media@lfdr.de>; Mon, 29 Jun 2026 19:42:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08F053CBE70;
	Mon, 29 Jun 2026 19:42:49 +0000 (UTC)
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010007.outbound.protection.outlook.com [52.101.69.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39AD939BFFE;
	Mon, 29 Jun 2026 19:42:44 +0000 (UTC)
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782762168; cv=fail; b=W3JygLwDUAHDLKoAKpT5cRF/0j5fYjhzLBFM4Bd5Bl29kgZfJPGFAYbFQBMoUpQuJOL/lgmoaJdp7UYtFAlNPlJ6sAVXml/8QdYGlgFzOdKkiOunn+l0kQb5o3GIetLoUXqUZfHm77eQCHvDKp/PVU49Jgtf+gQxx/w9S1bOIFw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782762168; c=relaxed/simple;
	bh=/VMHQnZHwr/fCqcsw6TvU5QphuGa1nD8muOF6L1XJIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V7dXxyKCLKWHTEvPx/UeF4Zj16XI6XE07LYVECIeVahvo2KiMqQT7L9BgvnPYG/m0FT891EkA3a9d10d2UW2DMhcsvTlAIQPJtvrxrKpgaM90yw17eZXlaOeLrTb1vw5RItBCCYd5gBfPupMfADPY9GLD5/mhHuvFAZIJ5F+2bY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=sEGOcw1H; arc=fail smtp.client-ip=52.101.69.7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n5eZPcdRgWnuYYmA+qQMfljHbyJQVVPOzeC1QzTQo3qGoZ8dEiD/mnAZNBz93LNcw6Qb8FuhsGDZLCe985L5nqbggSunMl+2jfacrvcRNx+rjrPFa+pCwyTPwE0wBZ4CGCxmy29E0c09oApOeheuOa2Y85pUjjiSN1Nno5EcqELHhCfOUc6XXreRIg7XrbI1+yMeqfOhcMwktRp66+wuwoNUkFGrR23BmaTTlMLTl/tEcH5aymwnHHGGshNIrrl8ZuZrQDywVU7gX122yXqmbip1pCC2nbn7dtAsgjC6UAhL57/x8/pli6Abe0G6hR8TCUZXIZifWtKXRRK14OzlEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IvlzaCqpVLCbWUgRpLFNAnrIX/zt2UpvSnovWzGYDjU=;
 b=pzEPENXIUuLCr/IJkZfaiOunM4JK4lJM+WFXy72zCiU4J+VOOdQtzocjw4Li58DIesP0to6A+t644d00htR3qh0aaT5SjwEMHDX13oAku6QY6rMJWek0ebt3f/RoJ1C6EcEyT2CTH97l1kI+POagE2hGHqtNl0abKk1SJ0OcNIFtBF2ihAG7S26rQIQ8bn3NerBnUe6dWGJwQKPdy0vvHwa3UgazDNRHv63ZZvZcWc+H3DXcfNZKa1MVZ8bOpRirkBwBmIfuI16lqLz2JoEhDE1fsJiDe11njJeplqYcT0duI/6DKc+BOtsXhSOZTENNRM6s/2XL1Vwlc/Z7JGMO4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IvlzaCqpVLCbWUgRpLFNAnrIX/zt2UpvSnovWzGYDjU=;
 b=sEGOcw1HmxbgXS/SyoxGGC0bjjjo+z9OH4PUOpYxklAtOhdX2AGH8dcUbUvrpGYlsBFVtUmJo+DvtVpRHVbSymXA+eaFhuXn/f3siagxMEwErm0ViePKazWOlq4Y907+jCyJuSZ7+vBd7V+I1QHSz6NiMHLiPQ9bowDe5g4rZWj9uVP6RXcYZ0nKt22y5hUDHTuq+Qn/dCzUmUFfnmBDrTkehbPLaH8xcuh2+qgtI5rJ69nyQ2QMxPw5l/oOgilH/FoFUqPNxUdA+0rSK+0JtQWZ5TVyAG6g0tLZztFJQJSELOsq4yeFPaqL/HD4LgiHb0uwq2ED0jRRVI2GmevIYg==
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by VI1PR04MB7101.eurprd04.prod.outlook.com (2603:10a6:800:12e::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 19:42:41 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0159.007; Mon, 29 Jun 2026
 19:42:41 +0000
From: Frank.Li@oss.nxp.com
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>,
	Aisheng Dong <aisheng.dong@nxp.com>,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: (subset) [PATCH v5 0/2] media: nxp: imx8-isi: Add virtual channel and frame descriptor support
Date: Mon, 29 Jun 2026 15:42:31 -0400
Message-ID: <178276214766.2429861.1950641421457268519.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
References: <20260521-isi_vc-v5-0-a38eb4fcd58e@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PH7P221CA0079.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:328::14) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|VI1PR04MB7101:EE_
X-MS-Office365-Filtering-Correlation-Id: 37fd557d-a144-48d5-6314-08ded61694d1
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|1800799024|376014|19092799006|366016|23010399003|6133799003|11063799006|18002099003|22082099003|56012099006;
X-Microsoft-Antispam-Message-Info:
 sfHLY+BIjhGAr4H3Tx8STBgC2k+b4PtmE9x2JFImsesY2DkQVvp9+VcuP4vLSWm4e31akV4zU6bbfO8Amv32hbEcex+zU8Zp02Y2EzQfB7L5bqhJdVCz46qlhNBVFgRW+Ed1W5dNpLRRzfwzk7jfBv2XoPugLuanQEHHp9esljKGhfTdVx+U3tN68bIM0EqjnRcNfBmLEk+blK24lWDUXmTl4wXliZxnNsZ9RTo0TJlndvbMSUz4YRp+45pkGeKYu67zOiSjO5QKF+LLPvLDZ+UJofAFi1ysWqSsQrzs5SNBpAY2/ww627n0nBiCNL/HJYRjGyC4EO7IRp37YXlUg37WLBs9bAbesjuC1ku6aK0Iw6g+eSFU5basaj8kHkBR0GNyF/PiFbTpOVAwGqO+EpZfiW9rQhaB3RAFcXmcUPrfJjWLlkmsdB9x/09/jiFmTklQEOLfafb9VBEugQBDlsaycmR6R33Z3OA435Sz54vaY7nFc2F+FIxV9HhkT1m3rbc69ZfN3EF5Ps4gJyem2b/aV2t1wqE57tLScS3rtYQ2maVNul/uF2VOEiyD1zq8P1xTEkr3hDRU/hZC81n0LBiCcFSkRGyYsXmsWyxzX1nIqXwclPDcPdCWcl30n+gxmmrCU99NMTmzBDMTd8hHpRDGskTIVuSYUdk+bqVaOTs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(19092799006)(366016)(23010399003)(6133799003)(11063799006)(18002099003)(22082099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?bjVTcEt6VWc5c09GN1M2aFRWUnNqL1VrbTJKK01aK1pXdE0zcG9ZYTBRbnJo?=
 =?utf-8?B?TUNVVzliRGp4QTZsRWpmVVppb3B1T1g4akUyT2xOZm5HUUN2Wmg2Zm90dXNB?=
 =?utf-8?B?SVRiUk1NOWlseXB3Uk02QlFQM1U4YWFRMHJaNU52cFRrNFY5MVBNWEdtbjBk?=
 =?utf-8?B?QXV3UFduRzNOa3dMaUNZaHNCZUxXZExraktVWmgrUUpiWUFwR3NGb2s2YVJZ?=
 =?utf-8?B?Zm9SYkdaSzlUR01ianB4R1RieGJSV1ZNeHlwUFVHYTV1bjZXSksrWERDTUZJ?=
 =?utf-8?B?WVNMUGNIOU1ja2t3Rjg2b0NDRmJ6cm5PVUNWSjRQN0tzOGlzTWFIR3c0QnVH?=
 =?utf-8?B?Zzd1WlVhbFVER2J4OWpJNC94V29hTXlMalBHTnIyTis1T2F0cWZYTEhWWE9P?=
 =?utf-8?B?ZWJpa1VOK0FKdVBPUWJhaHBaQzlEejFjMWV5OU5NaGZqd1pMMHZaTzBjditW?=
 =?utf-8?B?RXBGUDFsVUNERWF2ZTc4RjdMVUhRbHk0THRuUmFiZ0hVeGh5TzhaUXpTMWsx?=
 =?utf-8?B?SUwxeWQxbHZCS0dCK0xla2c0OGpqQUZLYkZ4Tm1wZ0p1ZVhLS3dQdVFQVE5l?=
 =?utf-8?B?ODQ0eFpmY1p4YnFJNjkvVFUvQjlCN3lPT09ETGJzQS9TK3hYcFBjTFZ3NDVD?=
 =?utf-8?B?SnBVek1ndUlSL2JVU0RWdEFiT01SV2RsZnprbXpESS9BWEpKczZPQUhDWWVv?=
 =?utf-8?B?QnhxbjRSL3FMeTdJTGN3UGtSL2pXNWVMQTErUnB3blpmRFJPeGZPSGkySlFP?=
 =?utf-8?B?aHp5UCtrdTEzNE1YNmtIbmpqRmNjbUVCWk9EeC81VGg1NnB2WFJDOVhEMVNw?=
 =?utf-8?B?aGtDbHNjU0RseG5rN0o1MkZOQkx6ZkFUTzErUmlZTW02RG5aN2F0Mi9HVTRt?=
 =?utf-8?B?N1RtOVVXMWZWVmRBalNZMUZEQnl2aXFSRjdSMmt1OHI4YWRqNWltd0RQNHFI?=
 =?utf-8?B?ZndHc2ZBK3lXWjR5NWI0ZUJ1TTN4MnByUjdzeXlZREptR2NDeFg5dlRTWWV0?=
 =?utf-8?B?cCtmUGRUbExXWkRMaWxXb3JwQWQ5U2U2c0lhUHZqR2d3b0oxbFpQMU1YREJV?=
 =?utf-8?B?ajBGWTBWWExxeUhxUi9sd2ZwVGxKbXZEWStvY3Y2cDVnNjRWMmZmQ3hqcmJN?=
 =?utf-8?B?Z1hQTmsraDA4MTY3eHJSZXRGMGhKN3VUWHBBTyt5aXJjUWw2WmtITUZFWTBo?=
 =?utf-8?B?Sjl5ZUpuWmNlM0tNNFZma3YrbS9ETit4dVQyMFZkOWlseU5NSkxFRWFPeTFN?=
 =?utf-8?B?TDNxUE4rVmhZdjNwRTAvV3orNktTcjNPRC9iR0l5SDh6QXc5QTVCTmNtd2NW?=
 =?utf-8?B?Z3Nnck45V1BpSldhUW1XWVpTaWl5bUdpanJPKzlqVVhFYXdWNU5tSHdlQTR1?=
 =?utf-8?B?MGp3U0Y1aHhyMlFCVko4dldSMk9CV0l5QVFHcjFuMW4rYVFCR01vR2ZiaXdw?=
 =?utf-8?B?cVkwVy9jUUpoRlplY3dRMXhQOC9abDdsUytDdW5uR2J6WnlvN0xuK0lwR1p0?=
 =?utf-8?B?NzdqZHBIQjM3NENVUXRTTTBTK2tWNlhiRFpLdUE1Z1FKeHVFQWhXQzdGVG44?=
 =?utf-8?B?TVB1YjhkM3dHaTNVQTVUUEkwYW8yYTUwTUtOc0FLY0xxUEJqK1JteFFrTG1s?=
 =?utf-8?B?TlR0SEtIbmtFK0hXeUJIWGkreWE2VW51UExiNVhBbVJtQ0lpOW1namt0RnVM?=
 =?utf-8?B?YlU2SmlyRmtldWFYYXVIdnY1UXZOalk1bjZUZDFkUlRsYWdkL2ZRZitTUGRQ?=
 =?utf-8?B?bmw0YTNyQk1qZ1FmTnNIb01BbEpLKzNNN2R4aVNFZGZtYXg2cXhzOElFeVpQ?=
 =?utf-8?B?b1hCcWJ4encwMnVlSXJFU29ueUc3VjR1Qm4zQWdCV1ZNSkFUYXRtaHpxOXBY?=
 =?utf-8?B?QnJQUmV6U2V2MjhYTFZub2kyZGJVMnFRRm5vSnAxZFF1Tjh1enkzMVJxOEpW?=
 =?utf-8?B?eTB0MmQ1c2NjZSthUVUxcVV4R1RScStuRmMvMmp0cHh0ZURtbFZvelNINjdt?=
 =?utf-8?B?VUNaYk53eklZMFdNdkNIMUNQSU94b01CeDdOd1BpKzFCL0RVT0hnaERiZUtE?=
 =?utf-8?B?ZWFzQ1pnUnNZeStaVnBidDE4QjFTRytQV3RQdlYyYnl4VzhxUGcyanpFcnBu?=
 =?utf-8?B?MGJjbnhPOUYyRlZ0Yit1T1YxVlhJNWRyVy8zNkFFNytzV2Erdk1LeEsyeXQ3?=
 =?utf-8?B?WVc2NlU5Q3V1NjgvMENOUENjdklaSGw5cUZ2RWNNMU8xSHA5NFZuS1hiQmRj?=
 =?utf-8?B?SDBmTkppdXNBL2tpbjBxcHVsV3dMNkpCSGU5R0tkRW5UUmxOWkp0SVdwdTdu?=
 =?utf-8?B?YWZtQ1dxZ2lESUlndHlhL1ZpQnJkek9DQXduK0V2WnlMMDFPd2QzdnNxMDNx?=
 =?utf-8?Q?fq/oYO/+uFghLBYxNPV/g7+VpywEWNA3zsgGF?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37fd557d-a144-48d5-6314-08ded61694d1
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 19:42:40.9425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yDzS7ISxw0ZO881f/XrNmAAaQ9B7nWGLPMgr29mRXB7M1tOs6hxOc0oi15vmLwrKLPIt/iZR+FBvso3tDEz/UWTBBcS5k3bF/DJ3HatoZla/4UDaYKESxbfGuqS8NEIc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB7101
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.94 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:laurent.pinchart@ideasonboard.com,m:mchehab@kernel.org,m:s.hauer@pengutronix.de,m:kernel@pengutronix.de,m:festevam@gmail.com,m:guoniu.zhou@oss.nxp.com,m:Frank.Li@nxp.com,m:aisheng.dong@nxp.com,m:linux-media@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-kernel@vger.kernel.org,m:guoniu.zhou@nxp.com,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER(0.00)[Frank.Li@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[ideasonboard.com,kernel.org,pengutronix.de,gmail.com,oss.nxp.com];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_FROM(0.00)[bounces-66020-lists,linux-media=lfdr.de];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo,i.mx:url,nxp.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 224C46DE785

From: Frank Li <Frank.Li@nxp.com>


On Thu, 21 May 2026 17:10:03 +0800, Guoniu Zhou wrote:
> This patch series enhances the i.MX ISI driver's with virtual channel
> support and adds frame descriptor capabilities to the crossbar subdevice.

Applied, thanks!

[1/2] media: imx8-isi: crossbar: Add get_frame_desc operation
      commit: 3e15a3510908c990ee352aa206d5f9c23d4b216e

Best regards,
-- 
Frank Li <Frank.Li@nxp.com>

