Return-Path: <linux-media+bounces-19591-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BAE4499C5E8
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 11:38:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DDD6E1C22ADB
	for <lists+linux-media@lfdr.de>; Mon, 14 Oct 2024 09:38:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FE6C159209;
	Mon, 14 Oct 2024 09:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Z9JcT4ne"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010041.outbound.protection.outlook.com [52.101.69.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 379F61586C8;
	Mon, 14 Oct 2024 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728898681; cv=fail; b=ly/JwjWPG5AGdaCGaHnfhUSv6VGWNsZyWI3df5ACbFpQ52jH6aB5zUXqowsTMTj/v7PK5ZaJSAuIMjDaNIyNEO7UDN1S8MkIjCB0Prvlpn43Hd8U4CLjzUh1RSl1tZX4mgd5ZFVDrpPZffLBwQ+myCze3p8hv6cZCKo+2J99DLY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728898681; c=relaxed/simple;
	bh=8OQoOrDoOACkeiripVPq88F+/mEJgOw8MIT3jke0mW8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jI0Xw9OyykSLd9MNKUkl1NJ25ZVUG8jWHw/PQ7Vt/hpEyb061WHLtHa1u2uhssGr0g5+qhfwJWGhZBW5qD7WSyI4rog48Wca9xE3dep9dAzbvkTLDJG78ZSDPp8cLeBASj6Y7EQe7q+ag/T9lSh7jrzYN88jyJKWY9zVqDlEThE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Z9JcT4ne; arc=fail smtp.client-ip=52.101.69.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k4Ll7YpatXX9tL32KIbUHp8IlRFbQl6ZzW3kPBThrRT8wXwhgdMnN6NV90jkj/JIcixh6Dv490PG0IrM42Q566jW/HHCC6/QlttJ4+YkSrq8gOeR+ClWfW9dycR5md1crQLlZtOtOq8NC1rhcx8isQt/k5ee3oE8TLGtbez1a9yQeNJ+NWFWeRip6gsonDtIgU5Elwi85H6wx+A/PUIfgqy7qSC5/7uwxfaNqPEcXTX5vPOUlnNOWtdUr7nA6gjm/lsaIKghgaxLiPQB5cTg2AHXU7OeHDKlsiMSqdO2gTxZv334Yp11M1+WZA07qsR2E8tOJKEpiJA+DvWBW+qD4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CYw7tuXPAUZCnDtKEQTCXpC67LkYHwuiLGOMWFC/4e0=;
 b=F/loekDWNtu2Pul2PFyXXVE5k2xTRzD8uA7WUFjxjDkKTdr+LrYrGk8BRwOW8V4rons6agOT8DPpZOeb351PcL9uks6pR7x0g8ueY4mjt3FwjllT44NlJsRLw0UrurDkrhsAGO9Ow2vX347GL0VH+XV5DltTl/madn9/OuITtsN6nZwbLsItrzxDFfb8LD7dvSXbak55sMYpOGv7Fnj2S3T6Dh2HWAgUfm98w6Tp/TIJy+PHHUyKyuBLg4+DRCmioAuch30hzo82RCiYLdzFaEMgE5RQ82TJV+M3LRaj452xuyEgQqDUcujbj8i50cG+trPpEWYp4yIKtPaOofo5zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CYw7tuXPAUZCnDtKEQTCXpC67LkYHwuiLGOMWFC/4e0=;
 b=Z9JcT4ne0moUdWYF16r7paM9PVVB/oesvwSSYMz/c3T4myI6k+gxvLspW/tzlvWZTZqXZvNDyQf70ODjhtKnxZQQunQfwAmaqQPvMuXWedXxAHVVzG4iCoMzhibhSah4Iluu+9OtvUzLlTJlRjuDnDZv5qUcvg1xShcdpLZlHbYW6wh8111D36NfrsqylVQbc2X+TIVWrFbhnOO5BjL9l7jFFYnr2YyeAgSZ7pgDpYlW8xHuvrW1GgYwIWkHxYhSxMT8bunVmbWwRYGoz6pyietSvuHDElmxXWiYXH6iQO+PtYrmpc85UZjL9fIZsc15gczOREV2lXpo9WSuq4jAZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GV1PR04MB10942.eurprd04.prod.outlook.com (2603:10a6:150:20f::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Mon, 14 Oct
 2024 09:32:52 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.8048.020; Mon, 14 Oct 2024
 09:32:52 +0000
From: guoniu.zhou@oss.nxp.com
To: linux-media@vger.kernel.org
Cc: laurent.pinchart@ideasonboard.com,
	jacopo@jmondi.org,
	mchehab@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/2] dt-bindings: media: nxp,imx8-isi: Add i.MX8ULP ISI compatible string
Date: Mon, 14 Oct 2024 17:33:14 +0800
Message-Id: <20241014093312.1588304-3-guoniu.zhou@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241014093312.1588304-1-guoniu.zhou@oss.nxp.com>
References: <20241014093312.1588304-1-guoniu.zhou@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
X-MS-TrafficTypeDiagnostic: AS8PR04MB9080:EE_|GV1PR04MB10942:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b15dd12-ebb6-4d7d-f624-08dcec332cc4
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
 BCL:0;ARA:13230040|366016|52116014|7416014|376014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
 =?utf-8?B?VnlrcG1MWmhMY1JJdlBHSFlSNldSd1RmTkVqY3pZTkRwbG4yUjNTaWtBcXdX?=
 =?utf-8?B?bjYxV2d4SWVMTldaaDRUOHkrTXQ4eVl5ck13dDRtT3JadFNjeHBRK0l0YVMy?=
 =?utf-8?B?MjAra2g0NjhiVUs0SXlTWkVaUnhHKzZtdlpUa0ZCR2F1czJ6UUsxKzQ3N0hY?=
 =?utf-8?B?S010K1R1SHFzZElsa3VTOS84OCtRWTA0MjRXemQ2ZjBtQSsxdlB1RzBGZGR0?=
 =?utf-8?B?eENJSW90Q2JqWi9HUmlOeUlmVXlwalNrbWJoa3hxZ0p3TFNDbjZ3R1dRVHNs?=
 =?utf-8?B?Z0ZCdkRkU2pEVFJNcE1JNzJ3RGpTK2xQUDVwZ1plYkY5Y2dTbDgzVHJRdGtP?=
 =?utf-8?B?bHJIdHhSL2hHWjBsbTh1a2VDME5kay9vQ3pBY1ZOYzVlNlJ5M0JsQ0lwZVVH?=
 =?utf-8?B?WEZ0RVlHWWtLd3VPMEZ6L1lhR1VNWjBEbk83ZDFWU1J6ZHdLVXdiVjc4THha?=
 =?utf-8?B?UFVNcXNQKzJiV0VRTllNNDFaVzVpMGVuRTlzMWMrcXg3dUhUOEg1R2RobDFz?=
 =?utf-8?B?cHlpQyt5RHFEbW5UY0wxYjZiNU9PaXl3ZXNGL25Obng2VUR4MDRhV1pqd21a?=
 =?utf-8?B?NUo0Q2hyM3Y2VXlNa2s4djVPK1Zta0VzWlZYc3F0Zk9IQzZSaGJMem1jdU5T?=
 =?utf-8?B?bXJKaFg5aUl5U1ZhaHNlendIR283aFdzMmFUcmhOa0o2RHNMclNpL1RNbXF6?=
 =?utf-8?B?SE45TjcraFJuU2l2TmZiMkZ4bGxPcC9iSVZJSlUyRjM4UE1QSlhBY01JRDJM?=
 =?utf-8?B?TTFBSG5KN0haV3BLZmx1TWg4K1JWY3lVTy9KdEp4bUZ2b3dtNnVqVGZpVDVr?=
 =?utf-8?B?UXRuN2djbXZNMmh2N2NEb25nU1hBbUtQNEdpMHhsWHJpNDVaeXVtN0p6Q3M3?=
 =?utf-8?B?aFVXUDVGYXgzaWltVlZaK3NpSE8zYS8wRXJSRUNncDhGb252R0hhZmwvVzRU?=
 =?utf-8?B?UEFVaTF3Mk1YT0tjbzU0dWRJMGdTWFBqWnNrRTBYT29BanJJWWUwS0xtd2ZO?=
 =?utf-8?B?aXorUWQ3Qmx1M2FRYXV1YzRuUmRYbE4vNUxLUHlyZTlSU20rREFaVWtJZWZI?=
 =?utf-8?B?czB1VUlETGU2QVFEOFBnVktVU3lLWEtGaDZJRHorQ2FhMXZROG43TGo0eXpX?=
 =?utf-8?B?cGwvSG50NEdQZ2xENjlDTWFkbG1CRzBjTXBvTTRkY0RqdWNSZmJhQnVtcE1u?=
 =?utf-8?B?a1VQOEpBSTVmdmFnTmRKK2NOTzZpcDFKakhpcEZ2ZmZpazJXY3UrYis3K2c3?=
 =?utf-8?B?Y1l4VDFtdVkyZkVHWGxMZ3ZWZFdDSFg2S2pjRFFmSkJ2SFRKb09hSFVFNk1F?=
 =?utf-8?B?aFR0Rkx6RFZVTnBVeDV5UEdhTHJ2MzR1LzJkM3R2RVoyQmRkR2xSRFRSUjZG?=
 =?utf-8?B?ZUpXSW5sNFhhWEVMeWdSdjVNYW9sbjFJZkJML3AvRFp3UHl2WGIxRTd5NS9S?=
 =?utf-8?B?TXNsUzZMQStRZm1HV2xuY1Bja3pSdTZxT0lvTVBjZW53em5Rekg3NFdPZVJh?=
 =?utf-8?B?ckw4S1VjUzVkYmtHTjZlK1JxcnR0UzhxVUF4REJGTGRoRkQ5UkxOVEZ4dnNJ?=
 =?utf-8?B?U2xFVGUyblhJNVRzbTlhQXFHMjJvYUtaNEk2cHVSUldUMG1sajdaWjdsNXhG?=
 =?utf-8?B?azdKR21nbmNlSUJES01IUFcxaEc0VnI0bFVoa1dTUFFic1pZUHl1b04rWEJD?=
 =?utf-8?B?REswQXliTDkrejJRUUpwT0lnT01KTndZZ2Rkbk9QRnRleEYyMWE3OVNqS3BW?=
 =?utf-8?B?dFFNUVFkZXQwQjVnWjkxVFZFTVBhdEVldjhYZ2dJV0xkWWFZZGtpN3pETkgy?=
 =?utf-8?B?WUNzY0xZSmZNRHRET2dqUT09?=
X-Forefront-Antispam-Report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(7416014)(376014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
 =?utf-8?B?MVNIY1dnYVQ5czh1ck54bnArNm5SV0dqdlh1TzBDSWpxWG1oYzR2b08wV0Zu?=
 =?utf-8?B?ZnoxdWJWTjM3d2dScHNXWi9ScllLVzRheW5EVk5ZdmdNaEVadjgzWnBtVTBE?=
 =?utf-8?B?ckx5TGg1eFRnbHo1S0I4czNZUitFYkU0Q0NlczRPWDMycnVLeXZib2daOW5j?=
 =?utf-8?B?aDFmY2JvTUgra2RNaFNRK1k4OUtpN1ZCM01FdG1LNDRrYWtaTGIzb3EzOWpn?=
 =?utf-8?B?Y21UYUh1TFQrcEtaZ1RNbit3c3o3RUtiZVBtbXlUeDkxMDhZMzVtTzJ2MmtV?=
 =?utf-8?B?VERFUUZsRThEZm5qaXBpTjh2NWpKODNIenFUN2l1TGtKR0svZnhVdWM5a0Zt?=
 =?utf-8?B?NndNeUlhZ3VJNFNuT3hKcFMwU0NudE9ZNEdoWUdiaWhvZ2ZSK3Uyd1B5d2ds?=
 =?utf-8?B?dDAvcTlPRG9nVERKdjlhME5KS3ZLZHhKbmZhRGxyamVzV3dZN01RcE52b3VY?=
 =?utf-8?B?cW9ZY2lmQ3I5aThaVTh5a3RpMVBxSXBPeWpZbW1wcmtXQVFWbTNjQXp1V3Rp?=
 =?utf-8?B?MU5tMnh0akFMWndSRWRpQjNxdkhVZENJV2dHcUVhS2hIM2tXbmNyWHNtbG1Z?=
 =?utf-8?B?Qy9UanQ2ZGxiaEJOejVMeHRId1p1STRXQkFma3JjSjZpYWlxSTlyeHBWazYz?=
 =?utf-8?B?ZTVEQTY1WSt3RFBZTkxZRDJubFVVS25BOEU2b0NhS2RseGI4NXJmVEc2d1Nq?=
 =?utf-8?B?M1lTVGs5cEpEL05KTDRpN1Y2c2NReWhDdk9jNVJqd25BQjlteDVkZUpPTW5V?=
 =?utf-8?B?M2sxYVQ5WE9rSENkVXdudWZLYjBhQUtBT1dZdjM4eEtJTGFZNk1ORjdKTzJz?=
 =?utf-8?B?WktOQ2RRNFVQOUxTSTRtRm53RXFPWkwxUVMycGVlTU5vVWc0bVNHNVZyS1ZC?=
 =?utf-8?B?ekpoNm9na1V0dUJ2ZDRzYkh1ZFZLM2JFYnJJSlRlenNHbmpMSkN5RVVpdUZ0?=
 =?utf-8?B?TWJ6ZnN4MHdvTTVYT0psR292OFNOejJHZlZsclplZThnQ3BISkcvWFpjRFFX?=
 =?utf-8?B?cy9RRU1OQkhtYjkycTVSdEdrZjVvUnU3UmFzRTlsT3NUQWI3NFJPNXZrWnc1?=
 =?utf-8?B?T2ZzcWloTS9Dckx0ai85S3RkTTl3RGpFaFZ6NkF4b2tFQXJKbHNRMVQwOWFP?=
 =?utf-8?B?N0tIUmNGSTBXUW12Zk12d0s1Q0NVU283Z2cyQ0UvdDlEaEgwZWR4bU1SVEZz?=
 =?utf-8?B?aFlIRGgxUW1NN202MHl2KzUrYXVKa1lydVZKNFErZUNxaGNsOUVhSjVORnJy?=
 =?utf-8?B?OHJ6QjBQbVFzVXZha3pZRm9tQmY4cUVRcC9neGRrbmUzR2FSbDROa3FmYXJ4?=
 =?utf-8?B?bkx4S21OWnZ4b1dRUVUwZ3BpWGtEN2FFait3R0hHUWlWYlFqck5pQjNHOEF2?=
 =?utf-8?B?bVVSN3VEMXlsVWl2WS9yV2hEUjl3Z0tLUFNQZVl5Wkp1aVlGN3BDSXR2enI2?=
 =?utf-8?B?dloyZk1PUFE2c2NBMHBvYnZ2ZTBHVmJXSEZJRHdqN01ZZWpUdUo1SFVmaytJ?=
 =?utf-8?B?enZMakJhWDhSMkJMQjJ0MkFINk5ZSDMrd0pENFZ2Rk4rQlNDWjZoelpnaUFR?=
 =?utf-8?B?RWtoRGk0dFcrM2orNWltUUd4TlhJMEhqYVJXMG9ZTWZsZDhyRUhGL2kxTVc3?=
 =?utf-8?B?OHl2TC9ONXo4WWJyVGliZlhEWTc1VURDbCt1bVpSU1BZN0tYRU1DN25relFE?=
 =?utf-8?B?YlVZVGZJK2lySEZUWVltV0pxZ3Z1N2MyeDZqamxjd1ZIUXBHcmFvT3U1RWVM?=
 =?utf-8?B?eDVrMy9wVklreDV0U2w0Y1RaNndHWUxuVTZLM3N0NzRxRURkMGpMaGV3MHVt?=
 =?utf-8?B?VE4zeEhBZXlaOWYrQk04U3dpSGxKclRlRU1rRUtQaEkzRExaSXlVV3I5dlNp?=
 =?utf-8?B?akdvcFZNNXFreHFMVFBuRjRZbXhVRHpDeFNIYnBxM2ZvOW9uSXRxTHMwK1FF?=
 =?utf-8?B?UHhZR2F1cnllTCsxZURiRHd5eldIZU9SNUNack9oWXozYUo3eEV4M3d1Rndx?=
 =?utf-8?B?aEhxY1pvUjI1Q1NjRThhTDNUWEYxNk5DditqUU5QTis2R2hubkh6SkNsRlpq?=
 =?utf-8?B?M2JsZ1NNazdMZ2NBZzcrTVVNZUZMV0NCM1l5dzkyd1N6aEtnTHNVOVRXK0Fy?=
 =?utf-8?Q?loK2EEoW76MtvD7JbSLRM8+oA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b15dd12-ebb6-4d7d-f624-08dcec332cc4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Oct 2024 09:32:52.1438
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b07JkyKkaBS52I2kj7YvWUPrS/wEBcJgkEejnIb+S9xYKGT2ZeC8kFi2Vx3kZVn8Dbxa0npDQF+DTkDlGvwWSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10942

From: Guoniu Zhou <guoniu.zhou@nxp.com>

Add the compatible string support for i.MX8ULP ISI.

Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
index 4d5348d456a1..f43b91984f01 100644
--- a/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
+++ b/Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml
@@ -21,6 +21,7 @@ properties:
     enum:
       - fsl,imx8mn-isi
       - fsl,imx8mp-isi
+      - fsl,imx8ulp-isi
       - fsl,imx93-isi
 
   reg:
@@ -75,6 +76,7 @@ allOf:
           contains:
             enum:
               - fsl,imx8mn-isi
+              - fsl,imx8ulp-isi
               - fsl,imx93-isi
     then:
       properties:
-- 
2.34.1


