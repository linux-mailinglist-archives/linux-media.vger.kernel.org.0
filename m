Return-Path: <linux-media+bounces-58151-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBh0LEq01GnvwQcAu9opvQ
	(envelope-from <linux-media+bounces-58151-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:37:46 +0200
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 11DE73AAD7A
	for <lists+linux-media@lfdr.de>; Tue, 07 Apr 2026 09:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 71C6A3031822
	for <lists+linux-media@lfdr.de>; Tue,  7 Apr 2026 07:37:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C669639EF38;
	Tue,  7 Apr 2026 07:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="I1ZcWRtR"
X-Original-To: linux-media@vger.kernel.org
Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010007.outbound.protection.outlook.com [52.101.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620C5396D15;
	Tue,  7 Apr 2026 07:37:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775547431; cv=fail; b=R9k76AGYNiahChcp+0vE09ZUnNE6IRqNmiR4jAsjQ94blLQ4N+JctHX69SC7tRVCqYSsfaDOIJLXLQxhafc+eY+5uHAuVSvOZeG5MRECkFm4SqzxGklq8au/QJCC9xRXfXHJaFpU7k+M2o+VSSb19jr3aavxQXN3Ay4hRb9NdYY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775547431; c=relaxed/simple;
	bh=pvs17D5ghxx3pT39+PyFp2DLf9URdRRhPu9F495fLJk=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=SucBG6kgZpOAtx+2sr4U06x+3GUvKrjLEouHUhVNyW/Bal2lPmBheKh1C4r0i7sjGEHmh4uPO0qT8pOyhzJTONBuaZNhISBlbvN4+A4TJmtglglxNRi6VuOdMHedJWCaSZaj0+CjYJZ+/lzrTPX1YB2IA5aMpX/oxjF0zVwCq+s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=I1ZcWRtR; arc=fail smtp.client-ip=52.101.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mr2HE5I7TRTok04JUxGAIviU+sx8bBcvPJDc0eD1OLRjMvexb8NqypykosTiz7BSMRQtT+kz9qsEXZl0sLxV52TeXdlH6/CLiTSy+J7NRvF25KbFMsiAaimD37AYkhK7F1MR1jIn1tCI6AnxOVkP0zl9rv2vVRSksjD8aGIlG0fma2Q9bKAU2SC/qwym1ThbEZEbNw/wwjwJqE/2Ncr6I2G95ktapz/y0ldXBpxD3s0TWxzZAL7qSVi9J+FWPduRbJxPKOlArUZBjUFKZiXaWrJsuA33cAQY3wDx68qaJ/pdzOLWTPCRiG/ESxa50MRS4L1MW0Btk59kKknvKR3pCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IJBRXN3P5fGYe205STdMAFvshqcm4C934yvfMQ/Cc10=;
 b=batr5VloA6X9ngVPFcphLH21s8BR+hPS6cCRk6SQdZJ6Xmp3V0OzXsBZ4oSg0vYWh3iZjW5ebL2VmTy6oaHScwKx2UslS85QaPnYiarWpKRcIpwryf1+b+OR4jVGVnHY5mYj+f7/RgHnyncJh0vSsV6jQLcVGXEPjKZksESzAfMfCIlsR2IJ4W7v4ZC8jphI6/HW7Zww9HKBKJRlGq3/+qaMHSx0tulyoDLkA8YQX7m5rYRL20GWgUfJC4OdZ1S1orJ+BJqALt/leMTz0LuLAzAcswJdj7tzVZy+aSh4UD4RcPNWT/vkEuLKrVB2qw18UABl1gYVp9giCeu/UbY6AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IJBRXN3P5fGYe205STdMAFvshqcm4C934yvfMQ/Cc10=;
 b=I1ZcWRtRdGih564alvYn/+yCE2FwfFfsb+0dL0Olv4VFsNGf98DR1/3nX5mi53x0aNdVJGBmRe5mlzLL+sQ6vYmsRhxaYaZFShuj/cgkn+7TiiYjjP8n58xY+IVwJtoFoKoxH4WBEflaL6Vb8VRJVE9HvANUkiUdmugmovDd0xX7FM7+gqbMi8UcdMtWs+XtsP80dcXOWwYMNcnMwbq0k6dlwlLD3NuuwQJsiCYikR0JwQQo2h5Xb+lVOrxFbqrS2QS59vbUbpCFx4XZTDCCRE7yISKp0amkMecAxoVpKeexOmcKexCUkSgcT6huVFZEmQdvwwXLQ95UjRTdmLwwyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16) by DU2PR04MB9020.eurprd04.prod.outlook.com
 (2603:10a6:10:2e3::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.17; Tue, 7 Apr
 2026 07:37:05 +0000
Received: from PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989]) by PA6PR04MB11910.eurprd04.prod.outlook.com
 ([fe80::d3f0:3c24:f717:4989%4]) with mapi id 15.20.9769.014; Tue, 7 Apr 2026
 07:37:05 +0000
Message-ID: <4e669a11-38ff-41a5-b54d-8f50841b0411@nxp.com>
Date: Tue, 7 Apr 2026 09:37:03 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC v1 01/11] media: uapi: v4l2-isp: Add v4l2 ISP extensible
 statistics definitions
To: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
Cc: julien.vuillaumier@nxp.com, alexi.birlinger@nxp.com,
 daniel.baluta@nxp.com, peng.fan@nxp.com, frank.li@nxp.com,
 laurent.pinchart@ideasonboard.com, mchehab@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Jai Luthra <jai.luthra@ideasonboard.com>,
 paul elder <paul.elder@ideasonboard.com>
References: <20260123080938.3367348-1-antoine.bouyer@nxp.com>
 <20260123080938.3367348-2-antoine.bouyer@nxp.com> <ac93m33MhldSpYDj@zed>
Content-Language: en-US
From: Antoine Bouyer <antoine.bouyer@nxp.com>
In-Reply-To: <ac93m33MhldSpYDj@zed>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0042.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c7::12) To PA6PR04MB11910.eurprd04.prod.outlook.com
 (2603:10a6:102:516::16)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA6PR04MB11910:EE_|DU2PR04MB9020:EE_
X-MS-Office365-Filtering-Correlation-Id: c57f8221-149a-4d8d-0ae6-08de94787758
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|376014|7416014|19092799006|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
 MMmlXQ37bnYPzoKXUgZBvS63vpd/iaZ3m0u2/VbQqxlYsQ1yYkmRukhFs3IguLpigXW3MB/sBvD/9yXnFu6qP9GT+i10kKtblw1uq+4o8mnP7vPOVo86kSRf8EU7hHEafgTBpTXQZ847rp1hteAYDP35QTtVimXDafsq9TETXVuPZeRKqG3GEmEO1MU5Ufddf2JbPZmhBbdblpbbdNXYRhbwKZstP1dSoIXpLgUsusLuZwHtAmN2cyfDGVXtaAhvXj+UXTIIS0xDujdMQe5ilrVKTZfg+S8jdVU7ELOGyuX9gQyyx2UJwjwlBixouw4bTXYJ6JlKbKcldXI43X9ttP5K8RmcEy/1FV3+rpWEI/Nn2S4a0hAr8Wxn2X7IpbFcYhBlhcvX6z1HnrX12OobqJ5Ddd37+47pwAf8wmqUgALOwXGT0fw4W8BwgDvA67AGPVpSGVK8xYEyv9P2FA9xf/7fPLwai5DDSPWGsgpGWeJDoliCNgr7D5dEkpFj1eyA2QGlYCtHgEuhq5zzfqJodBFSe25BYnJP7dlwTHxSEHay/zYhXwNJWRbLZE1C9BMVkltIzsyAyCjZPfhi/4rH+W52jdEI7LC8ztWRYALCA3VJMiJnuoD2ww3NcMZczk4CgYbycApdJeWZoi55zC+umgNUYWNQkRDHZkkacMlEI004MB3byHZfAulXKR0GBZnaUmcBhYrwPhB0XKZGKsq7ZJa/sLSzDUhLGyf15b9YUPs=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA6PR04MB11910.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(19092799006)(1800799024)(366016)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?akUxZm13NzNKb2ZZanZvU0I2U21TZmJwNlJtN0ViVXAvZ21Yd2tSb3l4a002?=
 =?utf-8?B?aUd5LzdmZ3UyN0NVVmlzZzFqeVBsd2pOMzNhcFVZNkQ5MW1JOUhWWlByOWxs?=
 =?utf-8?B?d04zdCtVeUtoTzh6ZUdnSWFXOGhGdER5a2tXYnkyeUNJYzVwNmxMdlhRQWlT?=
 =?utf-8?B?c2libUpxUy9ZZnpCbXNjcFR6TGVPNC9qM1VQZzRUVWxtS28xcFpjL0hwbHpE?=
 =?utf-8?B?R1VIbUN6SlFrUVM2ME1GcUc3QWo3S004NXkvNlBCeWIvY3VuNTEyOTJ1WlpE?=
 =?utf-8?B?SnRmYzZnbE1WT0ZsTmMrSVRLanNFWU5iamFaWUtzeUJRdTk2TGlwdWFJY2lR?=
 =?utf-8?B?MzA5eVlJVThkMWg1dDExZTltT0oyL3l1NjIzQk05MGhnNi9JUTIzbnJjai8x?=
 =?utf-8?B?aVFqajJmYlhaeGhvRWtCMmhMNE1BRWhmTVg3Q041Vm45SndEcm45cU9YdUd6?=
 =?utf-8?B?aGl4N1NVRVp5OEEvSFlZbytGa1VkNEZCY0hQaEZqVmFDei9qd3MzRmpmeUVO?=
 =?utf-8?B?Z09xRU5oSDhWTEp2ZndlSTN3by9UZGR0NGkxb2hhQnNadG55L1FDeXlFK2I1?=
 =?utf-8?B?WDNxSGgxK2VxQnJXV2MySTZFZ1JNbEpYTXBoSEN5VWUwNDBoanYzUUZ2cTh5?=
 =?utf-8?B?RGMvOE93REE3c0Y1WjkycXVObjk5ZXJsejNBTTlFUnV3R2kra2hhK1FxUEJ3?=
 =?utf-8?B?djBsOVJJbVRtelFEUXNickJhWWlGbEZMS1Z3KzQ3bmJqZ2ZmWENTWUJEV1J4?=
 =?utf-8?B?OGNyWWdkeHlVRmMwM05rRGc5MVJESThHSTF0OU9NeFlMdnc4a3hTdUZ1OW50?=
 =?utf-8?B?Q0xCN2V1Q1luQVZqOWUrdWhxZHdudFRQcnplRWpHb0JnSERSUlNrUHY0Q3lo?=
 =?utf-8?B?WkpjdWVETFJTREMwMitWUzFma2VIdnBPNWhaMUh3M0lYSlhUUVlVbjJsOXBn?=
 =?utf-8?B?alR2MkFzZ3VaSzRCaGsyQ1d0SHlsWFI0R2JINTAyaXY3WXUyQ1dZTGxhYVZW?=
 =?utf-8?B?N3VFZ1Y4TGNQSEZoWmk5dWw2aHdDRk1KM0VZc3R1dzByTWZxUkN6Uk4wSGZt?=
 =?utf-8?B?b0ZUOUZzZVh0dDBUNElzSitHNHFWQ25aS2NEMmdVbnA2dDQ4TzZ1SmIzdkxD?=
 =?utf-8?B?UTVIQk1KOU5vdC9tL1NLa3gxbTc5OGRkU05aSFIrM0xmUVVJZkdsUXdSaVlP?=
 =?utf-8?B?TGtES09EZE9RRnFTWk9hcm5NQzJJdHZCckh0WW0wRG9IVmVkend1dFBMYUZP?=
 =?utf-8?B?d0ZOdDV0cG52WEhLSlk5N1BYTWJ0YUp0a3UrRXNGNEhwWXl0dnFVRzdjbHRl?=
 =?utf-8?B?R1BlbmIwc2ovOGFwV0tqZ3pvNjQ2UldrT0lpZjk3YnRTSHJDWHlHT3dNVmp1?=
 =?utf-8?B?bGF2cWMyL2gxK1ZQaG1GcTNVbDhJaitOM1pPd216WGpxcEtTK1k4UTM1am4w?=
 =?utf-8?B?V2hiQzVWR0MvV0NJdjVNdjBLeHI1cE14VFl4Wm9RV3Z3YXVDSDY0SGZ6bURN?=
 =?utf-8?B?SXdTUDBLMWpwNlNkSHJzRitPQ0hqZTNHZnFUVjMyaCtPVUY3dDNVSWN2NXMy?=
 =?utf-8?B?dDFkbk80a1JxQzJPTTZXTGtHQVYzbWhuT1E4RDBLVmlOVTF1U2lsVG44VzNH?=
 =?utf-8?B?czNzUDN6SVE5NUZQbWs2bExwcWovSGhPRmFvb0tZQVp6OTMxNmFHL1dieTMy?=
 =?utf-8?B?UkRvazFNRXlUU3pVQkIwVkpqUW1FVkxPbTd2aE5UbkdYd2xycXZnYnF6Mzdv?=
 =?utf-8?B?TXVuMnNpRjBqM0RjYzgrRDRRMk11K1A4RTBWVU9VcE1uV3V1dUgwdXlVV2hk?=
 =?utf-8?B?WXpZa1dQa0VocWZzdHJrbEliRG1ma2lvdkFDYnN4dFNmdGo3ZVhkU3NwK3Yw?=
 =?utf-8?B?eUt0VjgvMnkwRjVmclc5eERUTUp3VVh6ZUR5NGlqYmU5cGhQOFJJQ001cHA3?=
 =?utf-8?B?cVEzK0lNNEV1d2czOGVaNy81QzJuSWdRQSt5Nm00WFM5cVQxSU15blYrUnhC?=
 =?utf-8?B?UFE4cGRyQVV5UUhkcXRNUllIVEdiRE10cEdySUJ5bmRkWGxUcnVKamF5SVRW?=
 =?utf-8?B?dGxwbG5OWkUvaEswY1ZLbVpEblFZY2ZNaEE3QUtWdlhDRnM1NmZUOW0yUlFp?=
 =?utf-8?B?Q3BMb3grQXBOeEpjcjNyeGtCRGZVRVNaVXN5SmI2MEd6U0cydnpkUy9KSWRT?=
 =?utf-8?B?dUtORFVHVzNsTVZEaUh6Vnc5dWx5QW1ueksrc09QMEN3UWx5ZnZKeW5xU2tD?=
 =?utf-8?B?bDlld0FMZjNDb09RakpjTmRYQlE0cEI0MEE3QnV4aEdHN1lwcFRKekpQOXlx?=
 =?utf-8?B?WkMwdTFvQzNZd1FBcms5dFR1a3JJeVc1U2pHRGJhYmxkdXhuK1R4dz09?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c57f8221-149a-4d8d-0ae6-08de94787758
X-MS-Exchange-CrossTenant-AuthSource: PA6PR04MB11910.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2026 07:37:05.4753
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WhSNW/njCtYccx7IUeqzIXaVAUf4fglGqawkJvZ31Qg8cgOlpu+ERg7mklp7Y7bLgMhejixqjCChVK1sgDo9/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9020
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[21];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-58151-lists,linux-media=lfdr.de];
	FREEMAIL_CC(0.00)[nxp.com,ideasonboard.com,kernel.org,pengutronix.de,gmail.com,vger.kernel.org,lists.infradead.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[antoine.bouyer@nxp.com,linux-media@vger.kernel.org];
	DKIM_TRACE(0.00)[nxp.com:+];
	NEURAL_HAM(-0.00)[-0.998];
	TAGGED_RCPT(0.00)[linux-media,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 11DE73AAD7A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


Hi Jacopo

On 4/3/26 10:19 AM, Jacopo Mondi wrote:
> 
> 
> Hello Antoine
> 
>     in cc Jai and Paul
> 
> Jai and Paul are working on upstreaming new ISP formats which would
> benefit from usage of extensible stats.
> 
> No pressure of course, just wanted to check how things are progressing
> on your side. Do you have an updated version of this patch which can
> be taken in ? Should we sync and work on an updated version ?

I'm still on it. Things are progressing well, but little bit delayed 
because of neoisp rework. I hope to submit patchset (v4l2-isp + neo) by 
end of this week.

BR
Antoine

> 
> Thanks!
>     j
> 
> On Fri, Jan 23, 2026 at 09:09:28AM +0100, Antoine Bouyer wrote:
>> Extend the v4l2-isp extensible format introduced for isp parameters buffer
>> to the statistics buffer as well.
>>
>> Like for ISP configuration purpose, that will help supporting various ISP
>> hardware versions reporting different statistics data with less impact on
>> userspace.
>>
>> The `v4l2_isp_stats_buffer` reuses the `v4l2_isp_params_buffer` container
>> definitions, with similar header, versions and flags. V0 and V1 versions
>> are provided to match with params versions. On the other side, ENABLE and
>> DISABLE flags are not really meaningfull for statistics purpose. So VALID
>> and INVALID flags are introduced. Purpose is to force ISP driver to
>> validate a statistics buffer, before it is consumed by userspace.
>>
>> Signed-off-by: Antoine Bouyer <antoine.bouyer@nxp.com>
>> ---
>>   include/uapi/linux/media/v4l2-isp.h | 85 +++++++++++++++++++++++++++++
>>   1 file changed, 85 insertions(+)
>>
>> diff --git a/include/uapi/linux/media/v4l2-isp.h b/include/uapi/linux/media/v4l2-isp.h
>> index 779168f9058e..ed1279b86694 100644
>> --- a/include/uapi/linux/media/v4l2-isp.h
>> +++ b/include/uapi/linux/media/v4l2-isp.h
>> @@ -99,4 +99,89 @@ struct v4l2_isp_params_buffer {
>>        __u8 data[] __counted_by(data_size);
>>   };
>>
>> +/**
>> + * enum v4l2_isp_stats_version - V4L2 ISP statistics versioning
>> + *
>> + * @V4L2_ISP_STATS_VERSION_V0: First version of the V4L2 ISP statistics format
>> + *                          (for compatibility)
>> + * @V4L2_ISP_STATS_VERSION_V1: First version of the V4L2 ISP statistics format
>> + *
>> + * V0 and V1 are identical, and comply with V4l2 ISP parameters versions. So
>> + * both V0 and V1 refers to the first version of the V4L2 ISP statistics
>> + * format.
>> + *
>> + * Future revisions of the V4L2 ISP statistics format should start from the
>> + * value of 2.
>> + */
>> +enum v4l2_isp_stats_version {
>> +     V4L2_ISP_STATS_VERSION_V0 = 0,
>> +     V4L2_ISP_STATS_VERSION_V1,
>> +};
>> +
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_VALID               (1U << 0)
>> +#define V4L2_ISP_PARAMS_FL_BLOCK_INVALID     (1U << 1)
>> +
>> +/*
>> + * Reserve the first 8 bits for V4L2_ISP_STATS_FL_* flag.
>> + *
>> + * Driver-specific flags should be defined as:
>> + * #define DRIVER_SPECIFIC_FLAG0     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(0))
>> + * #define DRIVER_SPECIFIC_FLAG1     ((1U << V4L2_ISP_STATS_FL_DRIVER_FLAGS(1))
>> + */
>> +#define V4L2_ISP_STATS_FL_DRIVER_FLAGS(n)       ((n) + 8)
>> +
>> +/**
>> + * struct v4l2_isp_stats_block_header - V4L2 extensible statistics block header
>> + * @type: The statistics block type (driver-specific)
>> + * @flags: A bitmask of block flags (driver-specific)
>> + * @size: Size (in bytes) of the statistics block, including this header
>> + *
>> + * This structure represents the common part of all the ISP statistics blocks.
>> + * Each statistics block shall embed an instance of this structure type as its
>> + * first member, followed by the block-specific statistics data.
>> + *
>> + * The @type field is an ISP driver-specific value that identifies the block
>> + * type. The @size field specifies the size of the parameters block.
>> + *
>> + * The @flags field is a bitmask of per-block flags V4L2_STATS_ISP_FL_* and
>> + * driver-specific flags specified by the driver header.
>> + */
>> +struct v4l2_isp_stats_block_header {
>> +     __u16 type;
>> +     __u16 flags;
>> +     __u32 size;
>> +} __attribute__((aligned(8)));
>> +
>> +/**
>> + * struct v4l2_isp_stats_buffer - V4L2 extensible statistics data
>> + * @version: The statistics buffer version (driver-specific)
>> + * @data_size: The statistics data effective size, excluding this header
>> + * @data: The statistics data
>> + *
>> + * This structure contains the statistics information of the ISP hardware,
>> + * serialized for userspace into a data buffer. Each statistics block is
>> + * represented by a block-specific structure which contains a
>> + * :c:type:`v4l2_isp_stats_block_header` entry as first member. Driver
>> + * populates the @data buffer with statistics information of the ISP blocks it
>> + * intends to share to userspace. As a consequence, the data buffer effective
>> + * size changes according to the number of ISP blocks that driver intends to
>> + * provide and is set by the driver in the @data_size field.
>> + *
>> + * The statistics buffer is versioned by the @version field to allow modifying
>> + * and extending its definition. Driver shall populate the @version field to
>> + * inform the userpsace about the version it intends to use. The userspace will
>> + * parse and handle the @data buffer according to the data layout specific to
>> + * the indicated version.
>> + *
>> + * For each ISP block that driver wants to report, a block-specific structure
>> + * is appended to the @data buffer, one after the other without gaps in
>> + * between. Driver shall populate the @data_size field with the effective
>> + * size, in bytes, of the @data buffer.
>> + */
>> +struct v4l2_isp_stats_buffer {
>> +     __u32 version;
>> +     __u32 data_size;
>> +     __u8 data[] __counted_by(data_size);
>> +};
>> +
>>   #endif /* _UAPI_V4L2_ISP_H_ */
>> --
>> 2.52.0
>>


