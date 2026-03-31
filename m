Return-Path: <linux-media+bounces-57725-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MMTWKlR4y2k3HwYAu9opvQ
	(envelope-from <linux-media+bounces-57725-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:31:32 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 74574365358
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 09:31:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 377E430328FE
	for <lists+linux-media@lfdr.de>; Tue, 31 Mar 2026 07:25:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F16D13C1995;
	Tue, 31 Mar 2026 07:25:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="tTZkIgi7"
X-Original-To: linux-media@vger.kernel.org
Received: from GVXPR05CU001.outbound.protection.outlook.com (mail-swedencentralazon11013057.outbound.protection.outlook.com [52.101.83.57])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC0A3A3E61;
	Tue, 31 Mar 2026 07:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.83.57
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941924; cv=fail; b=NYB+O0GuOBiRiE66RDrr8Jn1xNbHNljI9LypdWYdDr/IEnFWL9VXsr8kjmW+bqly+gUdgkLh/UGC29BJkn2rQWHLbYHTPI6eLJtuGivRbPvoBv0jElfm+iYwKpa9bUpca51JQL54QgXUql0+C8V117ZiZDmNi9y57ofoTacdZO8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941924; c=relaxed/simple;
	bh=PTIb6L+GYWMJLvn1qLOeYSViYO7Wf2C3WLfDr6i6GOw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Us1OcZ1xApgeXilMuBManQJBodMx6eVh4T5GKXm70ffEEmEchSwcyL4oEVVWsNE4ppAjF7vAUI754x7lSmptczR2824VByD33sK/U5JcTsmF3hbtxUGz1DAi27hjKJBf7nvwVvPheXXpZ4oN02gNVXZLU9XyZ94psFxgTZB0qho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=tTZkIgi7; arc=fail smtp.client-ip=52.101.83.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fmHzis3izGfIg2BKGqH8Ch7LDcBU9SX2oyb7Wd+loAvyKeaGTbucYn1PeIS/4otHq8yJH+uuz7JY26NN50M+GKvL0/L9BaFEHlL8U8yy7FBAXXehAmH9J6jg1g/uVMwDtXu302nS4perIZ14YuTnso7lIEdvLnCTklNcon3jfOBdJGPevw8m/GtbwTst3A0RJuyV/zJFj9+HbE4/tdlANH/mBfrss/IXD1SM9U0WXdYT71TeAGWcv+1RuOWiXQuOhXV7e7rWT7jVTYXWWAW84I4o2Yu5/nkcjh6Ci35iKx3Nesn1vTDk37DqBH3TCYgGC8DXXchwh53FUy/IGh3PDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=r+CqmAlU+kqqhqICDrE2zbMTt0+PF9OoA98TBchEJSg=;
 b=ebODNttBtsVSsLE7y5rT9tzjKq4V6RyVOvn2Y9l67myM60cMzFvjR7pLItxqsjmA9IoKa6LHMnG15n/ZeKcDtkmSwdXGmrIwCOJBsEYDohREfD/am9rL3rVeUrl4PludTKpjI4hncdRi+G5k3dhxgYHpRzGXErsVZAG7OT34ezHzJLmhHQuxxXAGO+KDZ3zlPTtTFQVqQJ33W/NIsOXOhUWnsPqHYipJfAcuMKYa7D8NuJsuBh5vJ4edMyw9xvFdLkIWtgRCfvUGr0Pw2NgoNX3t27wqBn46f2tEZCkl0FipkFVPDKsTkmV0WQZyGxCWCf7PfX+eC8k64Yz3T+j0pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=r+CqmAlU+kqqhqICDrE2zbMTt0+PF9OoA98TBchEJSg=;
 b=tTZkIgi7DkUwLuaV9gM9hWsU4BIhz9QSBo3EsThrZ+LZAWTVXC18AHGw6tb/xfcYAEYYE5kT4UMVyHjb0lZ56KpzttBxEVnK/xiwHQIQINRNkIH/HhCSmPs6fT1I/HNCMfwlD+ZTqhRDgjOPZcqfF5BmAuaI1Um/fkVXGZi/kiOJJipPIoveXSbmxw3Ty1p+znAFHLi3+iEdHgW/4EUQC6sGdPIYju7BrsuMaCCCZpz4SS8UhsEDmb/lbQZyzxAKyLSt6KN3rZK5gC0jBAYE6aczpJckr522Uck/7/MAeoJYb2f5I9SKgFXILveBKMKKYIioEvaTvMCT6PTojJQnQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com (2603:10a6:20b:8::21)
 by DUZPR04MB9968.eurprd04.prod.outlook.com (2603:10a6:10:4d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.28; Tue, 31 Mar
 2026 07:25:19 +0000
Received: from AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc]) by AM6PR04MB5110.eurprd04.prod.outlook.com
 ([fe80::2866:93b6:c814:89fc%5]) with mapi id 15.20.9632.017; Tue, 31 Mar 2026
 07:25:19 +0000
From: ming.qian@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org,
	hverkuil-cisco@xs4all.nl,
	nicolas@ndufresne.ca,
	sebastian.fricke@collabora.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-imx@nxp.com,
	Frank.li@nxp.com,
	xiahong.bao@nxp.com,
	eagle.zhou@nxp.com,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [RFC PATCH 4/7] docs: media: v4l2-memtrack: Add driver API documentation
Date: Tue, 31 Mar 2026 15:23:14 +0800
Message-ID: <20260331072347.253-5-ming.qian@oss.nxp.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20260331072347.253-1-ming.qian@oss.nxp.com>
References: <20260331072347.253-1-ming.qian@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA0P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:d9::16) To AM6PR04MB5110.eurprd04.prod.outlook.com
 (2603:10a6:20b:8::21)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM6PR04MB5110:EE_|DUZPR04MB9968:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a67a62c-a326-4e0b-9b51-08de8ef6a96f
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|7416014|52116014|19092799006|18002099003|56012099003|22082099003|38350700014;
X-Microsoft-Antispam-Message-Info:
	ehENZ++LXXgf1YoRIbi3K+LSvMmfF++fUvJmdbH0GsAokKry/lOFOgp3kWg90w/4J9WxG+n2zpRXasqdEYIwQ+SIPgkbkBLamSC/CJc/NAWrynMDpqm6jnKs1vhO2gdVJiJEUjiRAI/w+YcEzS4BfSDxx48bbHBw69NOV4CQbYKrDmuhUYSVmXBMas/z8IoY8Ojt7TqhNeqzgtOm4YmvIMDhw4rsfeLZJ7VKAko4/GMRRAJKoyTpJ3r7eyDYWbTi+2CLAPJRXP0C2DFFHYkZnxex9StvVmmX0gCQd0BwDkivfLhNbJXeRY3kTT6WwkFtpV1I68+trJUjCK9Q0nhHsMOTb7Upe6YuFMlCcCE/NSacvGC6btNCgjh+w6sgUJs08k5g7vq5W1o2EM/Ms9lBK74Po0B9tpyMaBLR9on/iAddvIKlt3kDQ/EC0lEcl4xYxYj1O/q1pXk45mw+2DojI+bo+WausjCC3yyeKsX2QmnsSisWqYL4A0H2UO9RkIrHpne+3kuqzcBgmGIkZbnRc/R1w8n6auvzsSiVv6x/vDNT0lNiWRqI/SIoHhGvtke+bdpBsP0Klz3rwje2ar+i75miKDMztJCvPtezkgHMWhWa60AzIR4OOR4hsoifR8y6fxcUf4/wP/OLS9/kXvzCn50f1KERTKpzE/M5lHQbI24TEN1Oc85ww4zyG3HL6nKaN27BiEH2zvcgAdJdPZeHZnA9n55cS3TMIOEoRd1mocwPJdeCSrLq+Rj/WO3zpFYK/Kd2U5lxVA+wajdBJpUExfylX32ywBrvsraKNQYcvJ0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5110.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(52116014)(19092799006)(18002099003)(56012099003)(22082099003)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVVJN2pLb0JqVzBSTnppM0UwQXhsYVcrT3JaRjZQNUREYXFqVXgyUDNZQ0dy?=
 =?utf-8?B?N3ROSXp0a1NYem8zWUswc1ZtWFA1Vm5TMVVWS2J4VC9ycFEydnVNaEFiWU1S?=
 =?utf-8?B?dDJGRGxNVFlHeVBsdlUrbEhJMVRxdXdZN2JLdllyV1dzZnZSQ0Z1TU1sb0wz?=
 =?utf-8?B?cXVDS0wrSG1JSGdwNjFXcU4zTjYwb29qWHVWbGp1QVNSbEU1WTB5MEZiUGRB?=
 =?utf-8?B?UVVjWDN4bVRXcWg2eDA2VjlCYngrRzIwUGFQK2JkNHkxbkZwcCswM3BWcEVp?=
 =?utf-8?B?QWM4RmlVdTVmblBUL0hiNXBqQVBKZTAzdDh5eldzM3NiWkNGc3BsUFJ4SzlF?=
 =?utf-8?B?RllzUE05OUhIbFhnRGV1QzRNUlhJSG1JWEVJSHUxbFBpdG0xYTNZYjVVZEE0?=
 =?utf-8?B?L0hGNUNPbGhyUVd5bGJtbDJQZWIwUTNmOXJWUUNybUtRaS9hZ3ZXR1hNaS96?=
 =?utf-8?B?QitpaGFPeGZBamQ4dFdSQTJ2alNSNmwrKzB4Um5TZ0czbUxpQ0ZVTUpVRzRZ?=
 =?utf-8?B?NnRQUDdaeW84MC9BcUsvWFRNRm4veEo1Q3ZLWDVFUmgycWQ0N0MzcjZxU1Z2?=
 =?utf-8?B?NDB6d3BtS0l4dytTT0VraGVYQkNPWUdZK0JMcmVTMHAvUnNzV2V1UVlaOThm?=
 =?utf-8?B?OVFFZmJoeWRKMUd6N0FrcEVBRzE5UTJCQnFCZUFPY3h5N0NEMmh0UWkrMm1I?=
 =?utf-8?B?eXkxNzY5L3RjS0NjR21vZ2c2Tkl0aUxKNlpCU1daN2hMN0NHL0RrRnVFMzE0?=
 =?utf-8?B?ZGJKUisyN0RnWER6eVp3V0RzMmJ2WmVvQktKUWk0L0thQk9qVjY2bVNhVG1i?=
 =?utf-8?B?aHVaYnRlZzNBREx0OFAvcWgwcXdzandLS2NoMk9UbnpXZ01FVXlDNVowSjhP?=
 =?utf-8?B?Wm10ZVBhdTBRQmVaWndQczl6MjRKLzJHQlYvRkdib0pvZTBpRHZqOTVSbFBN?=
 =?utf-8?B?MEJxY0JvRno5MTUwZ2tIcEdzWlkzSVBDclhza2xvNVV3YWhIbHNoVWdGaTVX?=
 =?utf-8?B?bFJQSnJBRXlZV1cxN3RYSnBRb25RS2tMOHpySmlhWXVIOUNHSFllSEs5bHRN?=
 =?utf-8?B?eW5mS2JER2RRWWEvSnNTb0lxaGNSeHR2T1h5bkVweHJWS0RwajlMbHJDUG1p?=
 =?utf-8?B?bGFITDdMTTJVa1UxNnRUS3Ztb0tZZ01pQ3N2dytiLzhUSnNZQUIwU2pkR3RN?=
 =?utf-8?B?VGtpMjlCOWlZc05QaGRyaFdORGtacHZrcW1acHMxblBFSXgwdVh3NUxZckhU?=
 =?utf-8?B?VThvem9RcnJuY2NGRmVJc1U3cENRYWlmRlRBM0x3WmErTGhtLzNNVExFWXhq?=
 =?utf-8?B?cjVNaW5FTVlWWmx4Qm9QT2phT3pBWkliNFlHUWJiU0dqOEMxSmtUUzI1OER3?=
 =?utf-8?B?YkJsMlFhK0xlMHhhUGg1UldzSm5yQloyWWV5RlVzZ2c4RUk4WGVwZmVNdU94?=
 =?utf-8?B?d3ZqVUtJekljSEtGam1STTVhR0g0WEpzalBkYTcrRFk4ZkcwN0NHMmZqTFQ2?=
 =?utf-8?B?VmFmcnlQRXVoU0lmTFpWNzROWFVZU2NIWEdPN2xXeXhQVHpSd0tiVDZNb0tL?=
 =?utf-8?B?U09qUlh6cnhZTGtxV3pwNDgvNWFVelpDbXo1Q2ZuWStHd2hDQ0pmejJPaGpz?=
 =?utf-8?B?cm11NlJVenNYQUpoSFo1Mi9nb0NUVkV5TGNTa0lXcGpZY2RKSWZmL1JpRUFL?=
 =?utf-8?B?Z3BpSlZscy9FekJQOElZcW1VNXdXVGFaQzVHTlpnZEQvdGZBSkRvTy9rTGNS?=
 =?utf-8?B?Wm1jam1DdlBtNnJvT2l6eFgwSHZCM3kvQmM5Rlo5SFQwOXNYS0laeEtYVThj?=
 =?utf-8?B?WFRtbHoyZmVGSjRCL1kzNTl0S3ByOE9POXYvSUVCMzl1WlV2aFlnQ0s0MG5T?=
 =?utf-8?B?d05EbDNoajZBVnpCUWhXQjY5dEJZSTZLcHQ2RFBjWlVsczF6RVlGL2hFYklt?=
 =?utf-8?B?WkhTR2xCOWU4MzlhWi9hVW1FUXM0eWs2VzhvRmFNcU03N3BSaUxNTUdKOWth?=
 =?utf-8?B?d2dic08vVTR0ZU5QdXB5ZUZiS1VXSDlIVHVYMExvTVN2YldVcFh5R0JIZnpi?=
 =?utf-8?B?V2l0OVlFSGE1UVd3LzNEZ0VUVWJaRzAvV2dmdUUwSTBXYVRpVWxzaGx5NGdl?=
 =?utf-8?B?OFpFRlkvSE1uMTdRZXl1eGFIc2p2eC9JTXh1WTNOM1lBaHBkUzYzZjZRMjNr?=
 =?utf-8?B?TFpiRElteEdRMlZKR2RQaFl4RXJib2hlNk52dXdSbVUvWFRacjkzNktXZUMx?=
 =?utf-8?B?dHl3NS9vZWdCSCtGbFQ4bzRjcEU3QTFJRGFldngvNEVra1JwQnV6MVNScFlL?=
 =?utf-8?B?bW1MeGxvakNGUWMvSFRtTWNUV3E4Sk1QR2JOVXBFQXJYK2hadW9ndz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a67a62c-a326-4e0b-9b51-08de8ef6a96f
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5110.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2026 07:25:19.2365
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HFRXqAoNadOxr8w0rt2X8K/vr85E2eCs7RC7+lpWqqptceCzZWJ8rXr2reh8gaI/tShUQTUyrrtaC1//OtoNVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB9968
X-Spamd-Result: default: False [1.44 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-57725-lists,linux-media=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,xs4all.nl,ndufresne.ca,collabora.com,pengutronix.de,gmail.com,nxp.com,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ming.qian@oss.nxp.com,linux-media@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	TO_DN_NONE(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-media];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,oss.nxp.com:mid,NXP1.onmicrosoft.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 74574365358
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Ming Qian <ming.qian@oss.nxp.com>

Add comprehensive documentation for the V4L2 memory tracking infrastructure
in the driver API documentation. This documentation covers:

- Overview of the hierarchical memory tracking system
- Basic usage examples showing root node creation and memory tracking
- Hierarchical tracking with parent-child node relationships
- debugfs interface for runtime memory inspection
- Notification callback registration and usage warnings
- Visual examples of tree structure and debugfs output

The documentation provides driver developers with practical examples
of how to integrate memory tracking into their V4L2 drivers, including
proper setup during probe/remove, buffer allocation tracking, and
per-context memory monitoring.

Add the new v4l2-memtrack documentation to the v4l2-core index to make
it accessible in the generated documentation.

Signed-off-by: Ming Qian <ming.qian@oss.nxp.com>
---
 Documentation/driver-api/media/v4l2-core.rst  |   1 +
 .../driver-api/media/v4l2-memtrack.rst        | 140 ++++++++++++++++++
 2 files changed, 141 insertions(+)
 create mode 100644 Documentation/driver-api/media/v4l2-memtrack.rst

diff --git a/Documentation/driver-api/media/v4l2-core.rst b/Documentation/driver-api/media/v4l2-core.rst
index a5f5102c64cc..09765d028375 100644
--- a/Documentation/driver-api/media/v4l2-core.rst
+++ b/Documentation/driver-api/media/v4l2-core.rst
@@ -28,3 +28,4 @@ Video4Linux devices
     v4l2-tveeprom
     v4l2-jpeg
     v4l2-isp
+    v4l2-memtrack
diff --git a/Documentation/driver-api/media/v4l2-memtrack.rst b/Documentation/driver-api/media/v4l2-memtrack.rst
new file mode 100644
index 000000000000..bca6954cfa0b
--- /dev/null
+++ b/Documentation/driver-api/media/v4l2-memtrack.rst
@@ -0,0 +1,140 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+V4L2 Memory Usage Tracker
+=========================
+
+Overview
+--------
+
+The V4L2 memory tracking module provides hierarchical memory allocation
+tracking for V4L2 devices. It is useful for debugging memory leaks and
+monitoring buffer usage in video drivers.
+
+Features:
+
+- Tree-structured memory usage monitoring
+- Per-device and per-context tracking
+- debugfs interface for runtime inspection
+- Optional notification callbacks for memory changes
+- V4L2 control integration
+
+Usage Example
+-------------
+
+Basic usage in a V4L2 driver:
+
+.. code-block:: c
+
+    #include <media/v4l2-memtrack.h>
+
+    struct my_device {
+        struct v4l2_memtrack_node *memtrack;
+        /* ... */
+    };
+
+    static int my_probe(struct platform_device *pdev)
+    {
+        struct my_device *dev;
+
+        dev->memtrack = v4l2_memtrack_create_root("my-device");
+        if (!dev->memtrack)
+            return -ENOMEM;
+
+        return 0;
+    }
+
+    static void my_remove(struct platform_device *pdev)
+    {
+        v4l2_memtrack_destroy_node(dev->memtrack);
+    }
+
+    static int my_alloc_buffer(struct my_device *dev, size_t size)
+    {
+        void *buf = dma_alloc_coherent(dev, size, &dma_addr, GFP_KERNEL);
+        if (!buf)
+            return -ENOMEM;
+
+        v4l2_memtrack_add(dev->memtrack, size);
+        return 0;
+    }
+
+    static void my_free_buffer(struct my_device *dev, size_t size)
+    {
+        dma_free_coherent(dev, size, buf, dma_addr);
+        v4l2_memtrack_sub(dev->memtrack, size);
+    }
+
+Hierarchical Tracking
+---------------------
+
+For more detailed tracking, create child nodes:
+
+.. code-block:: c
+
+    struct my_context {
+        struct v4l2_memtrack_node *memtrack;
+    };
+
+    static int my_open(struct file *file)
+    {
+        struct my_context *ctx;
+
+        ctx->memtrack = v4l2_memtrack_create_node(dev->memtrack, "context");
+        return 0;
+    }
+
+    static int my_close(struct file *file)
+    {
+        v4l2_memtrack_destroy_node(ctx->memtrack);
+        return 0;
+    }
+
+This creates a tree structure::
+
+    my-device (root)
+    ├── context (pid=1234)
+    │   ├── buffer: 4096 bytes
+    │   └── buffer: 8192 bytes
+    └── context (pid=5678)
+        └── buffer: 4096 bytes
+
+debugfs Interface
+-----------------
+
+Memory usage is exposed via debugfs at::
+
+    /sys/kernel/debug/v4l2-memtrack/<device-name>
+
+Example output::
+
+    Total memory usage: 16384 bytes
+    my-device (tgid=1000, pid=1000) usage: 16384
+      context (tgid=1234, pid=1234) usage: 12288 (count=2)
+      context (tgid=5678, pid=5678) usage: 4096 (count=1)
+
+Notification Callbacks
+----------------------
+
+Register callbacks to be notified of memory changes:
+
+.. code-block:: c
+
+    static void my_notify(struct v4l2_memtrack_node *node,
+                          size_t total, void *priv)
+    {
+        pr_info("Memory usage changed: %zu bytes\n", total);
+    }
+
+    v4l2_memtrack_register_notify(dev->memtrack, my_notify, dev);
+
+.. warning::
+
+   Callbacks are executed without holding internal locks, so most kernel
+   functions may be called safely. However, the callback MUST NOT call
+   v4l2_memtrack_unregister_notify() or v4l2_memtrack_destroy_node() on
+   the same node, as this will cause a deadlock.
+
+API Reference
+-------------
+
+.. kernel-doc:: include/media/v4l2-memtrack.h
-- 
2.53.0


