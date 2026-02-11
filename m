Return-Path: <linux-media+bounces-52611-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AI/AHjihjGkkrwAAu9opvQ
	(envelope-from <linux-media+bounces-52611-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:33:12 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C4C125B51
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 16:33:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AA3393019BA2
	for <lists+linux-media@lfdr.de>; Wed, 11 Feb 2026 15:33:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BF713016E5;
	Wed, 11 Feb 2026 15:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="IuclnGz7"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010000.outbound.protection.outlook.com [52.101.69.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D84C2ECEBC;
	Wed, 11 Feb 2026 15:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770823982; cv=fail; b=fXp6lm81EZDCx6yFDgRUdlVqXNr7LroPXrbpMd+gm3hotqXOMvKJ+vyrW2n26OOqqRK65uEP8TWER9yrkbgzMryvrePvmUvaecZX/QG7lI66HU8BFTT4WYvY9vua0GA8bqjPfry/HsFIgQ/L3hQagOh9YBT2bEa6wUBBegbZqRA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770823982; c=relaxed/simple;
	bh=As/ECpwfdtYLc9wGaFz7xvlc0SmjwhLlTcYbiz8H5is=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WZS63cHnsN3DBVLetj7KyJjuxG9UlOYqzwJEnQbJWc6zfKQ2Q7GDW1a53zM9NDRz2v6F1ZV5rabZdr8PfpBjc9cE9BsjdNfmT1QIFGS4BF8NcRh4ryWG3/3bN7U8SlghOw+ltZmuuZSbsnM19xIjWqjE0JWAjeqYapdPxbjf9HY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=IuclnGz7; arc=fail smtp.client-ip=52.101.69.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uh6K5RKQcnhO3NmBrQLLLK6NtDUPC8cgrd81n8cadbnZcTM+TghxsipwKxaFVuof71IbYajm08zTPFMlM6FoZqE1GoRL4dtXLIEp41GRHYfmof3w+88uLKqFTq4yJnioDTY4aJMPgojRjHM4ymsV5g9hB4qtQzLc1xBAMGIQcsPyg1Va+5jjU7csXj1jxl0y4gznoMLNeZjBQux8SYZsl+o6Gc3G4GxGPSp3IUewDT0JorC8ttpTQQorRv/eyAvmhJm1bewWHB+xZx2c9uI29jHXP+sx+qXd4l3fBgoeEE7InUNuy5L5oo2Isqz316W9OKHwSsscRpkZ6cMlhgDzuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+SAgvLJy7lFeOr/i018gcYX4hu9sPwJfhTpHWISI/k=;
 b=wxL1Jprcc7bYmqzhxsfhOZcR85VIDqkHmiSzBho3/FXihjP2Dd6ueSJw+9bqNyBAeISPb7jeg35T4+YKjAShhQTqNJNVSfy0MEa8Ii78zNv4ujBNG7+3mBn/oUpr10nHSel+aeq3RLjj2lgxKsv9Yl78PnMZEhn5cftz9WZS2VO6d7/zoQS7N8u9ltVPGKEYOIQWvvwQLrfhbsVLovinnTEAUHLn3628UF0daJnR0gpvgzb0sCfHbMQoG0iWHVOQCS/1EOKbt3sSEZO3aYlU51ouXeD4jO0SgbzYMbVcWCpgZVBOcdAW/FklurQBByBtp8W2sGSs96cDoJqQsBjiGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+SAgvLJy7lFeOr/i018gcYX4hu9sPwJfhTpHWISI/k=;
 b=IuclnGz7rgc0QoZfXmQrAh0hFVt04qE8T5ULwVM9ITbdZSWdaw8Lky77TO26bcSH7NNVmKn/QSE2yg5qri1snjlK4ERO+YH/RbjY3kcIjU56MJxNm7qRQSt3LE8TTqBUxYbhMfZMoShj1ESXzu2Lsrl9yvxzugc7VE1H3tfd9J4OLWzFtpTQBFg8Yzw1qObRovevnNuyOpk1VC/nPs4j/nGTBrgyjxziymr+Cs96JmzhxYySWV/Lu6sPE6e7z/tqadvTDNlW6tjblsh9JsmtV5qdKUaWKfefbmCEbZrCwlhleLKLHlySrVIRFpjPeybQZqalN/HO3hGw7gvQ/7id/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com (2603:10a6:102:2a9::8)
 by VI1PR04MB9860.eurprd04.prod.outlook.com (2603:10a6:800:1d0::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.16; Wed, 11 Feb
 2026 15:32:58 +0000
Received: from PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588]) by PA4PR04MB9366.eurprd04.prod.outlook.com
 ([fe80::75e4:8143:ddbc:6588%6]) with mapi id 15.20.9587.010; Wed, 11 Feb 2026
 15:32:58 +0000
Date: Wed, 11 Feb 2026 10:32:50 -0500
From: Frank Li <Frank.li@nxp.com>
To: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
Cc: slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	gregkh@linuxfoundation.org, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: imx: remove unused header includes
Message-ID: <aYyhInSiCvtTA8pe@lizhi-Precision-Tower-5810>
References: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260211142208.112033-1-rajveer.chaudhari.linux@gmail.com>
X-ClientProxiedBy: PH5P222CA0003.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:510:34b::17) To PA4PR04MB9366.eurprd04.prod.outlook.com
 (2603:10a6:102:2a9::8)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA4PR04MB9366:EE_|VI1PR04MB9860:EE_
X-MS-Office365-Filtering-Correlation-Id: a6a726f1-194a-4d45-0156-08de6982d55e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|376014|1800799024|52116014|7416014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?ZxgMFYimXyc0+X55lhdaWpsaM8LWeCAn5X9vWeHLgHYb0Ps/dtH5yTBHDp80?=
 =?us-ascii?Q?I8LmO9QQo+vjRHheT0wPCdls1JX9afKIq3Bk/+meJ4FEqNNtaWRVWup/lqf2?=
 =?us-ascii?Q?c909fJcxM1VFH5n1/YKRlDDKmusSmFRjq3p2pmFiQTehKY6HYk1aLxBfQg3t?=
 =?us-ascii?Q?oCs3hyC4tO6SpV7DJWYqN7aVrFt6GOOnWj4X/1BQ7Pt62OfeTGGFiRZu8Mc4?=
 =?us-ascii?Q?yD+1OVoKpdW8qf/vlS+Jkbb5pRe112URpKL5rJDCtD5ul4VuJIT4ycfs+q+L?=
 =?us-ascii?Q?nImlX0W1aQBRAlVzf9so6dz1ulWn5CJwBF2dB2omrugGlQ9tD+Kv7VwUM99/?=
 =?us-ascii?Q?Hdaaeh1va1XjoDsU7AxoOcMCW2BEkZUnM4wNAKcFaJz7oJutVyRVgTUPXRp+?=
 =?us-ascii?Q?A/e/BgG3BqnKWy2YXepbgSZF+3aiuZPldztncAA/vuR4bOzjsjgvDIa9BOR5?=
 =?us-ascii?Q?g1JhtzwWjzd5434Tl8biBXqfXZXRYEmKTN6wEE7L1rP1MX06pRDHJhbRwOcr?=
 =?us-ascii?Q?ZIzA1V9plSduCvXZn5UEltSEl9hyyZHPbL8LZIvfyME2hcCTgOs+YULkSmVI?=
 =?us-ascii?Q?mwdIWB6twxA6Byx58vyREQZma5ekQEZrBOGD8KdXO8C7t1D8CLtuqfG35vxv?=
 =?us-ascii?Q?hTeHhsdag3zhj/1vsLuS/sGgI1kNHNlAe76Izrp0T2iJMjrSDI3SVLVbyYBr?=
 =?us-ascii?Q?iysg25IKNppf/qqltgd1Etv5GBiRsWRkRwqMaWBDk86G4xA14BlaM0Bn+aqo?=
 =?us-ascii?Q?K8Vq6FpfYSc3a9jJlQ35Z8kRbtS6BeTMYlKX3xzRFRIXOyx9ggcwGt+F1SUa?=
 =?us-ascii?Q?VnVgfxTr5IvGRMKDOgQk7KYzQgG/culUkzE8HcfSerYzDlTEHRHSsqH2pbyN?=
 =?us-ascii?Q?vX3u1H0nIhySnY0XJV5vUr9hedS+NpqENelLP7RYNfYZTY3qEQtfHEfcfOei?=
 =?us-ascii?Q?k7TX6f54xw1SUMn2hdlGhi4KVzZUw4FlugLPLuFWu3QaE4/Yn7aqt/Bv+7qJ?=
 =?us-ascii?Q?4C+lhOO2t8bwi0us9kQHumDPdKOopt1hTJdUy+5yf0L9+HVYZPAgmKD+Reud?=
 =?us-ascii?Q?Iu1xNUyrSFZm74/hC+spthW9MeEnVjmY+0DOjt6rWdM6DowWwZU9DvpvdIfG?=
 =?us-ascii?Q?0pd+IRuLnX8bZXSmvvOF6+6DjtLLM9cGx7RoXTE7Tnw9RUsMLaru0rE5O3zH?=
 =?us-ascii?Q?VaoRoegPIsDtAAy3jp14Gbcflf1f0Nzc+VUSDNZoEbejywAQ5AIIy+kDS1kb?=
 =?us-ascii?Q?1nA15wCO2sGXviJxzAbL4Ed6e0fcrsxa/AFavjH/2hwiRLzzfEQPd4uCaEOg?=
 =?us-ascii?Q?ikArJB5vzOCOXNtMSanhqNIyW9pqS+fDE8QV9nUfRo+OZranvWToxUX6g8em?=
 =?us-ascii?Q?CpPDv1yDE8VrWy8neH/vZ6Gd9/i4XbMJ0G3f615XWZ83wUO2SFVhztb62+2p?=
 =?us-ascii?Q?+zTx3+WeY1hQisuEGDy/LhlXKjhbuvHtNrkwk62U6lMJSbO04bol3iXW+6iI?=
 =?us-ascii?Q?KuKT84WpshOGlEG3E6u3qaO8hNViSb9qaBVOnYJ2MYxIxows8ZB7uUC/Kk3L?=
 =?us-ascii?Q?7riN6DA9WssThRzy13gjrKi9DPPCOdVZ6rF4nZ+6f6rhRiUxmKHJjGvD6Q4k?=
 =?us-ascii?Q?R2Lbm1vkNN9G0SHdZq9wyM0=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA4PR04MB9366.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(376014)(1800799024)(52116014)(7416014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Y4bk8eoD1045qNfI712dT3CGJVEXDLWMsvJ+sn0SYeaLkydtUJrGA3sOjV8k?=
 =?us-ascii?Q?68vEvdW/fALBa0IB6fNQSGmu/J6xJHztXdWYGf80VSGlddvh4jXMc3tkc7mM?=
 =?us-ascii?Q?wt5pCNLqBknMxDUkZ+MVuiZd51YwKrRBQI62LpFA+HL6RDn8emvyXS/Dz66a?=
 =?us-ascii?Q?UOYoo+mIYcNCJ7nMhaSEKl1qIAPxJJVRbL8K26oEqcP+OMXv/tHbkPOy46U2?=
 =?us-ascii?Q?EgEaD4mefEhi61+H2ZRclE6fLwhb0cV9m3K+/dLcpGlOi7RZu2U0tQ55acAD?=
 =?us-ascii?Q?JMpgd+Jlit1xLHv6JJyWkBo13ySnV9BIFCV5s6uGLLpefUWIkpvlNCvwzar+?=
 =?us-ascii?Q?NU6ZmgjnPEkflh3iXjVk6ALzsS4MencuoJzrwqwbkvz0CHeTlNvZdCzi0j/D?=
 =?us-ascii?Q?08dns9kAIaS646YDxL+Qxb3aBZm+KJ7JTzhzzb2kzOTVZWpUTx26cDBjVSSQ?=
 =?us-ascii?Q?c2Stcg+vyxSKjnPtaqsFT1cjXyQTNOsDbj+NQuQvuZi1lgjZi1cSx0S0XilG?=
 =?us-ascii?Q?uapwK7amOyhb+SMt6s1vGPM/MB8wTJuFNlltDHzMqkZx6FYTlLOmqWhdRALf?=
 =?us-ascii?Q?8jdQs88+63eyrOyyyd1m1zyRnvwco3VF0t7eixtjhZJYe16eCh2E8yoqrHj5?=
 =?us-ascii?Q?/FyjQBAXTnlSc04rh9l9t3M4R+TWuH6sMLeiHm52IDtlkAUvigS8eHlIiK4I?=
 =?us-ascii?Q?8akFlggcaZuel6RUZ7LFoI5zOaW1TZxxxbbuG3+DWmblCO94WEeUsG0DnLEp?=
 =?us-ascii?Q?5A0Ov0QWU1xw01v/DwU49aPYWGnxc7AIMhGQbBzDKUJboYWFfsNYqoh+qKC4?=
 =?us-ascii?Q?jiXRZ5+NJqrSiEu6f1AGSgHr9qNvD5nnie+tYrPruQQjRkVkvoL5ln7prk1y?=
 =?us-ascii?Q?JTLPjvWq13iBHRwRJVLbkI6dTlxijrxO6Pdjma1/t5L6dYwW0owOgGzExMKc?=
 =?us-ascii?Q?ZNZZHj9ZD/N9em6iLItNLslpGJdvkvzzO0XKRtYlm78mk0GDnexFySL3JgpO?=
 =?us-ascii?Q?gbObmy1A/nFlAPdr5bw939iABlbvGNil05yBbLGZwo+rbZt+7AauOKk4OAxC?=
 =?us-ascii?Q?8hTeT+NTXSriu51/UZbpLz+xj5I0VMVqADp12rrsaufUSgGNf7dWZDnGW/cj?=
 =?us-ascii?Q?tpt13Udbu/65/ygDbWiRZ6fn4tcC6q6iNZ2vR52wiCr0cUmaIyfOQJWTlLc1?=
 =?us-ascii?Q?Blg9WWZQa50+nGK7eZ9L3rDhJghpBTne+xFMwNHttUjc0OsNBYczu22z20d5?=
 =?us-ascii?Q?96qEI/oV2x/Ri9qa8DET/SEEJkmevmJTD6bdS2SAxBWM7xL9wkHMSDkPndV2?=
 =?us-ascii?Q?M/sWNSHfQW2ZvGCgvX92icmso2sqpmvLBNkN1MMtGLt30/15Wfr1pgN9avUh?=
 =?us-ascii?Q?QxDYA1T20zYdXubHc/Zk//df+0bSl9Ywrsyh8w3Ni/V8RXf+HWa6rvvasL2F?=
 =?us-ascii?Q?/quRLk9k1Sf9SwJWhDB/HusK+kCe1IM3+Cz/PCuRWAXSWTzo0YYesloAK+D8?=
 =?us-ascii?Q?bHm1wNeeu1vz5OyR8JEJnILW3U94oInHJUQYYrfKmllUYArY+7Xh9oeSvknU?=
 =?us-ascii?Q?DVNrcWq9rjUS5yZGrrRvZbrRmCDWvNwKsvxA3ON7C1pTKQL8i3VmfS5gsYSy?=
 =?us-ascii?Q?1ucvI+AxF0YGH+e/loz1iHJo68KXB7g70M+hu87hGqzOGtITrqfZnoFy0Hu0?=
 =?us-ascii?Q?wWWMBFksD6nmPqvTS3ga4Rz2uHqQUOH83pM276yaq+KiKx0se1axhK31Ivct?=
 =?us-ascii?Q?tDDG3tEegQ=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6a726f1-194a-4d45-0156-08de6982d55e
X-MS-Exchange-CrossTenant-AuthSource: PA4PR04MB9366.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 15:32:58.0853
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hlYnctiyT6KCXE7I4rcCSGPOQv1Mr1DqBfwllQi+5CLNUpl9pbtG4Avkb8qebIxynS3sUTvmg/u5VSWZo746qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB9860
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-52611-lists,linux-media=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[Frank.li@nxp.com,linux-media@vger.kernel.org];
	FREEMAIL_CC(0.00)[gmail.com,pengutronix.de,kernel.org,linuxfoundation.org,lists.linux.dev,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[linux-media];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DKIM_TRACE(0.00)[nxp.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nxp.com:email,nxp.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 07C4C125B51
X-Rspamd-Action: no action

On Wed, Feb 11, 2026 at 07:52:08PM +0530, Rajveer Chaudhari wrote:
> Remove unused header includes from
> imx-ic-prp.c
> imx-ic-prpencvf.c
> imx-media-capture.c
> imx-media-csc-scaler.c
> imx-media-dev.c
> to reduce unnecessary dependencies and improve compilation time.
>
> Signed-off-by: Rajveer Chaudhari <rajveer.chaudhari.linux@gmail.com>
> ---
Reviewed-by: Frank Li <Frank.Li@nxp.com>
>  drivers/staging/media/imx/imx-ic-prp.c           | 1 -
>  drivers/staging/media/imx/imx-ic-prpencvf.c      | 3 +--
>  drivers/staging/media/imx/imx-media-capture.c    | 1 -
>  drivers/staging/media/imx/imx-media-csc-scaler.c | 2 --
>  drivers/staging/media/imx/imx-media-dev.c        | 1 -
>  5 files changed, 1 insertion(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-ic-prp.c b/drivers/staging/media/imx/imx-ic-prp.c
> index 2b80d54006b3..bba125234769 100644
> --- a/drivers/staging/media/imx/imx-ic-prp.c
> +++ b/drivers/staging/media/imx/imx-ic-prp.c
> @@ -11,7 +11,6 @@
>  #include <linux/delay.h>
>  #include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
> diff --git a/drivers/staging/media/imx/imx-ic-prpencvf.c b/drivers/staging/media/imx/imx-ic-prpencvf.c
> index 77360bfe081a..1b9dc5d86926 100644
> --- a/drivers/staging/media/imx/imx-ic-prpencvf.c
> +++ b/drivers/staging/media/imx/imx-ic-prpencvf.c
> @@ -9,9 +9,8 @@
>   * Copyright (c) 2012-2017 Mentor Graphics Inc.
>   */
>  #include <linux/delay.h>
> -#include <linux/interrupt.h>
>  #include <linux/module.h>
> -#include <linux/sched.h>
> +#include <linux/interrupt.h>
>  #include <linux/slab.h>
>  #include <linux/spinlock.h>
>  #include <linux/timer.h>
> diff --git a/drivers/staging/media/imx/imx-media-capture.c b/drivers/staging/media/imx/imx-media-capture.c
> index e9cef7af000a..860f93272bbf 100644
> --- a/drivers/staging/media/imx/imx-media-capture.c
> +++ b/drivers/staging/media/imx/imx-media-capture.c
> @@ -5,7 +5,6 @@
>   * Copyright (c) 2012-2016 Mentor Graphics Inc.
>   */
>  #include <linux/delay.h>
> -#include <linux/fs.h>
>  #include <linux/module.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> diff --git a/drivers/staging/media/imx/imx-media-csc-scaler.c b/drivers/staging/media/imx/imx-media-csc-scaler.c
> index 0a27330f9790..d42652c51358 100644
> --- a/drivers/staging/media/imx/imx-media-csc-scaler.c
> +++ b/drivers/staging/media/imx/imx-media-csc-scaler.c
> @@ -7,8 +7,6 @@
>   */
>  #include <linux/module.h>
>  #include <linux/delay.h>
> -#include <linux/fs.h>
> -#include <linux/sched.h>
>  #include <linux/slab.h>
>  #include <video/imx-ipu-v3.h>
>  #include <video/imx-ipu-image-convert.h>
> diff --git a/drivers/staging/media/imx/imx-media-dev.c b/drivers/staging/media/imx/imx-media-dev.c
> index a08389b99d14..a8f39319bd8a 100644
> --- a/drivers/staging/media/imx/imx-media-dev.c
> +++ b/drivers/staging/media/imx/imx-media-dev.c
> @@ -4,7 +4,6 @@
>   *
>   * Copyright (c) 2016-2019 Mentor Graphics Inc.
>   */
> -#include <linux/fs.h>
>  #include <linux/module.h>
>  #include <linux/platform_device.h>
>  #include <media/v4l2-async.h>
> --
> 2.53.0
>

