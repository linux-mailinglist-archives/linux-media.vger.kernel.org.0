Return-Path: <linux-media+bounces-56670-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6KAADZ/7wGkwPAQAu9opvQ
	(envelope-from <linux-media+bounces-56670-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:36:47 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 527EA2EE534
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 09:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A3F293010807
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 08:35:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E0B35CB81;
	Mon, 23 Mar 2026 08:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="BdJe1XLr"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013032.outbound.protection.outlook.com [40.107.162.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9439737F733;
	Mon, 23 Mar 2026 08:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774254911; cv=fail; b=dH/qOwY+/RRCiQi2T7gz27Ip/UX2e1gGmWMpw8k/csCERto6H9U6OEmY6ku/Pnw87eA/K23MtuhEYUDqyQHHExQXhQqJ8HQ7CPOXAvZF25Dv+XppNFsSgWso9VEHUntqqfYNnLYv5wUwzch7zhNfjl1Wgf45cj0jN61FSFlQChU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774254911; c=relaxed/simple;
	bh=ybOcXAPF1eFhzWlQz+pwIqWusCShwgB0BfeFmPZz5oo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=nm8lM8TmoQLxPeqVty7CTBOftuiisDPymrKhO6OQgNaMoJdX8eX9+rT4gNU+mMWS0fsrLnQRNaWchQClfXNLQ4Q87hNWZSJDuNGRE2wRaKsJ+O1DxWzw2rYERXyoiW+4PCrnKkksJc/oWNSXELhsobOnBC9sy7ADicA66K5AiJQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=BdJe1XLr; arc=fail smtp.client-ip=40.107.162.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lVGI687eifrsHGRSFbbK3r4moroApS1CSysC6s2tKQZNi/oSNyVn8vPU09AbHUDciy66BcrWx+PwXZe5VBCzAN4aSMtpcuRIRQcRLC5o+8jiFMgCi8zrAnPxK9mB9ZNvfNlaHsfMLRMgWyKSTeAN4GejuaNTNnARCuAop2kHv8d9Tc/4kYab9pGNnkutgLrSiwoPrCGvMWEmD9V8/LVgYbyWnnUhiyqBTnbZz0nBVbmdME/Vk0ncAlxjTqZEVbANg/jpbJlGgSjSVqQpDnbNJf4IyDXmgaRrMrCdod9elCwithpgo3Vw/x+uhCOPD0P4L7MjBvn3BGjG87Mh87UoIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ybOcXAPF1eFhzWlQz+pwIqWusCShwgB0BfeFmPZz5oo=;
 b=ecVSM7OVuHia4kLG3MrxaR/yijd1AxaMrUk8PWdhHHW7SKEF+6tDpoKXc+HcPAnlGf9sBrG8emuwYdJO3BuG0EUnLSQVe0D4hRVeWAnhacEDBFHUjM7wvfS1jOvBaZ0pzSJjW3xuQHvEqdMSQEFXk9GqyGYLRwb1U7NXGyfoAEFHJ2GjQFlwU1RI8WWh1c9kJ7Wz6NNYO3jAfGZ8OAnKg1D78uKuzhHc8+bQ9SU6wDusdxM3Zv9LpmjWuRzzXYqj8drK/58X7dJ5bQQZGhvucWvbvXUatxAnAqoTUiVXGpIz4lpsG4SSnBIAQPi+J64t8EGS27Ij0uiUntqrcd9lPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ybOcXAPF1eFhzWlQz+pwIqWusCShwgB0BfeFmPZz5oo=;
 b=BdJe1XLr5YAHIWobqrFBcQgEFiN1d0Pg/QfgkbDogNT6pph0E69ODanOFnQuLwGQFSCjT1FAMb/iz8cC/Vwh43Z2B2oBT19pVuwYEfLOCFXumTP5GD5XIwgOWg+sQnbe393qvzcQUAiwU/YTK868osXRzAzJKC2m/Vq/smiMYDt7WLZWTrpIMkzCDfICHWWsqsqRO2+AyMUx+NbsSeW/TscHWMNdHUQ9az0J9LR3KN1ZPxjsR7VDPolZ8EGM8oJ/53N7fCwrJYiDrLqE5aTCzchRRdTJBcpSW2w7+A6+qovePEpK/OMameMEjBDDLxok7KQ+xoZBiL3VrzIO2L8PIw==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AS4PR04MB9387.eurprd04.prod.outlook.com (2603:10a6:20b:4ea::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 08:35:09 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 08:35:01 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Rui Miguel Silva <rmfrfs@gmail.com>, Martin Kepplinger
	<martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, Mauro Carvalho
 Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <frank.li@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v10 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Topic: [PATCH v10 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Index: AQHcZcaOy1jIyOSz3USRRoh+mkyhd7W3Ix+AgAVQ7qA=
Date: Mon, 23 Mar 2026 08:35:01 +0000
Message-ID:
 <AS8PR04MB9080B1876973EE0C86D45354FA4BA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251205-csi2_imx8ulp-v10-0-190cdadb20a3@nxp.com>
 <20251205-csi2_imx8ulp-v10-2-190cdadb20a3@nxp.com>
 <20260319232305.GA967713@killaraus.ideasonboard.com>
In-Reply-To: <20260319232305.GA967713@killaraus.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AS4PR04MB9387:EE_
x-ms-office365-filtering-correlation-id: 5810e8fa-798c-4956-805f-08de88b71358
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|19092799006|1800799024|7416014|376014|38070700021|22082099003|56012099003|18002099003;
x-microsoft-antispam-message-info:
 CDqmTqG9fAaCahRUQ8Ma5syBYSpQUVy8RAd5nIgzrsUP/uBez+CWzPxdhkk24m4iWvvdMWT9n0uCArVmb3QE6CY84h4yDBnGi8HllxVbGNyTlC6YOhXYBnC2y6JlZXJb+51iWB4KeCChvMGQZs5N5n3WApobSxRRH0nE0oVJRwEfh2UK5QSepnqNA+73m56uAtPNAd/cbZUgBoPUvYWuUStV5Yd6tONXH2zjEG5+ETJEgVZksAkvQpFHsQgDkGkEFHBOvfvzl2HsJThRWiEx2GqRsDeFP+7L3dfxhJzllUSzf13UZDHH9BJdtPOmhKg+ETN33PCQYjbHZ28OJWg+EUaMTLKrtBkBjH2P6ONLlnyY/oljDYbOJkPMdKlDjIknQe24l1BFjj/N3JY/DuvHbNZfB+bsOAniAQajJ6eCI2R7NpBxogGP2Auv0HFv7TZXQYs1iTW85JfK2tnDiq25fkSVcQoRnEW5OjvAov3NzGB83sbxT1mGOaZHWODVA/dbw3SqMICKZFw93kh4zGBntLHXcCxyGHivlLVRMPeMbZit+zKn3usd+/bwaCDkY2qYrqpv9OvTD51M6BRmsPipXh4zIbCrLK6r7IgM5Ph6JgkXF5yMn72CwpTosj0ZmWxkkq+wvUCRMrBZcc32pvwPv7T7NnH/jywdDR4QBpVRrAigPQGvenrj8fgLZ6Hy+pNyyfw+QR+XW6k6FgcoeZknQ1s/XPJIY+LwLZOjDJCu3Gqlqd1GTiTgoKGQr/+4ymp1wjGyYcgIswSKpRm4KtLuB2Fm4WEcrPpA+CkbRDApbqU=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(19092799006)(1800799024)(7416014)(376014)(38070700021)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?cCtLUFBFSFplMmdza1NKM01VSGQ4T1psMjNIQWFzbmpncHUxOTQxbFRScWN2?=
 =?utf-8?B?SWx5ZlYrRW40OUtSZitEbWtoSEhRRWx6Z1BWeFY0blc0UXdzOEhKZVlzZytw?=
 =?utf-8?B?RmZ0OXc5MCtqaW4zd1BoVVJWU2x3Ny9heUtCRHExSjcvV1o1VFIrU1M2azMv?=
 =?utf-8?B?cmhwY0hnYUo0UDNxZE1FSExuaCtJd2Q2aDR6S09PVGJhTWozTUl0b0NwWmxM?=
 =?utf-8?B?N1lIVUNXUjYzV1UwVW5ySTlyd21mbUl1bFRSeFB4R2VsK3dBQjRHdk1HbVhB?=
 =?utf-8?B?aUJGQndxa3NqOThPMEx6T2s5NFg2cCtrOSthRGlHdXBDcHdaUFp3ODM2RW1N?=
 =?utf-8?B?Si9Jc21NSmJzOE1uSXgzZjg1c3gzajM3eENzdWpid1dGaDFJVlBEcm5zb0ox?=
 =?utf-8?B?L095UkpHVmY3Z3NidWZ5dTJhd1FEWGhpYzVGOStydXp5VTQ5Zk8zektXZ3Vu?=
 =?utf-8?B?akZyTnlvSnBZbCswRE0vMXcwTzZxRktNclhiNWd5Vk9lWXFZMExTRk9iQTM3?=
 =?utf-8?B?Z2pBUDFDa1NXamdkS0pqaXZMT0hTMTk2aHZ4VGVuMkNiNXZnUzh2U3M4VUVC?=
 =?utf-8?B?c2ZkcnJFeHBtMUQwV3ZhbkRVZmhqdHhLazBoV0ZmSFRITFhhUW5mVE84U3R5?=
 =?utf-8?B?ZWtGM1NZRGtvaDVFa3lCeVVsQ0xmbnVZTDF4WHVMTi9Fa1ZGZlkvamlmandl?=
 =?utf-8?B?eW5id2ZBZUQzZ1pJZ3k2ZE52cXlEb1ZFYzZ2TXRTZURFNURXc3hvYi9lL3lt?=
 =?utf-8?B?S2NCTmt0aTdkMTdlNXRtNER5dDYzZmVsTjkwZDBWZXV2L095c0pWL1dvWGov?=
 =?utf-8?B?S3dzUWZyYlBYaG9Wc2FEZFZxQmJ6cVlUNlJhYnI1TzFVZmZIZTVUTmJYaCtk?=
 =?utf-8?B?MXllL2lpdlkwZGRUVFUzQXozQVJSTXkxNExGL3B5YTlPT2ZQMkFaaWFsWXEy?=
 =?utf-8?B?VUxqaHUyV0tma3U5YmxRMlpYNjhualZMVElJbzJod054Sml2bjg2SUF2RUFq?=
 =?utf-8?B?aVcrMUF0cmIzTEhZV1RscXQyNFBwRCt0S2ZyVWwwMTAyN0M2RlB0aUdvZnBy?=
 =?utf-8?B?TkpXcjA4Skt6TTNSZUZGcUZLYUNFeXVCOStST1kxOUpBQ2RmeDNsMHdvUWFn?=
 =?utf-8?B?MXE0SkllaEdqMDY3K1U3Vms2a1JMbzc4YllhSXdTeHd2eHRKN0crQmtoOXA0?=
 =?utf-8?B?ODVjZTN2OUMwWnNOUTBNU25YYmVnU3pXMngyZEtxaDBwQWtsd1B5WEFiUFZQ?=
 =?utf-8?B?ZFZuZkZ5OUlJMDRxZ21hWE1yVkVNUVdpMm1vem9teVhiSzd6MmRoNFNubGF3?=
 =?utf-8?B?YVNkQXQ2SWY0bkNnK2tSa0ZPdVduMGFMRXBiMjEyV1UwL1N5ZGgzYlY2Ym1E?=
 =?utf-8?B?K3VTdUtHd2JJMEVFaE1IS2pxaFpOVUpNS2J1bXk2RU1ITjBJcFY3TWVtZ2JM?=
 =?utf-8?B?dks2bXJWTkVvVmpkZkthN1I1SjRsR1NxNW40aisxRDJNeC9halBpL0hnbVJ1?=
 =?utf-8?B?enVlTUdaKzJla3hyNkh0Zy92Tm5FK01hczdXOExQaEg4cUM5VWhjZHBmMTBr?=
 =?utf-8?B?VjErekE2OExqYnQwemJOZHlMdysrOGNPdDNkRTRFUmpGeFJaUXFpZHhpeDB6?=
 =?utf-8?B?SjVleGNOR0NWZS9HeURzaXBkeU1Mc1hNVHNpREkxQXEyVG1CMVQ4Y0UxNjFM?=
 =?utf-8?B?RVhoNGVYbU5uVHJUbXBJbzNoS3o3RVBTQ1VZRm9Yd2VpWlExOXd2SERpU08z?=
 =?utf-8?B?VC84NlFpei81OEpqaEJRTk1tUTZFSXNWWXphUURsUGZ3RCtBWTY2MEZScVBy?=
 =?utf-8?B?WUd2M3l6WHUvUnRtcjJTZGVlaUVBRndKNFhUZDBWMStDQWhPSVdHaGROQkxu?=
 =?utf-8?B?aitxZ0RyamhadmNlenhwQ1d6MnV1NGo3bmh6QnhYWUJxQ0pHMmJrS2pVNTF0?=
 =?utf-8?B?Q0ZEUENmNG05UFhxSzVsemlPcS82b0RhWWcyZ2VlY1RnTm5uYTd3U3Z4WDNr?=
 =?utf-8?B?ZXhFS2ltd3l6R1ZzTVVDZkdZb0Z1UlJSUSs1cC9CeVNTcmhHS3gvdndaZVBP?=
 =?utf-8?B?REJGRkFrcEQzVDgrL09qS0RVNUhrUUliRjNjR01oN1E1N25HL1pyRVEwWmZW?=
 =?utf-8?B?ZWpEZXdKTHpYTkxyRVpvcFV2RXBVakJsL3QyUHl1UnN6RzlMREo0R1J6cjdN?=
 =?utf-8?B?RGkxUFczbm0zRnRWa25YbTRyMGV1SVppZlErV0FrdEhseVI5cDcxRlk1RGJ6?=
 =?utf-8?B?ZnkrOFdkZjF0Vjl5OEF4VzF2K1ovZ0JObDVXNjBwcmEyT3p5Qzc4OE03RW1o?=
 =?utf-8?Q?l0tgFR2K3Pm1dPA6cy?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5810e8fa-798c-4956-805f-08de88b71358
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 08:35:01.7821
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UhVc+TmEBH0xBakwud4WqeEsIwqR7Q7dysJtvLNyeYhupUvvR3s2rXQHtzmIZ3FVkxLCVpNIVeyLfVhbMZcOeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS4PR04MB9387
X-Spamd-Result: default: False [3.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56670-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,posteo.de,puri.sm,kernel.org,pengutronix.de,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	NEURAL_HAM(-0.00)[-0.992];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-media,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 527EA2EE534
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjAsIDIwMjYgNzoyMyBB
TQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6
IFJ1aSBNaWd1ZWwgU2lsdmEgPHJtZnJmc0BnbWFpbC5jb20+OyBNYXJ0aW4gS2VwcGxpbmdlcg0K
PiA8bWFydGlua0Bwb3N0ZW8uZGU+OyBQdXJpc20gS2VybmVsIFRlYW0gPGtlcm5lbEBwdXJpLnNt
PjsgTWF1cm8NCj4gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBSb2IgSGVy
cmluZyA8cm9iaEBrZXJuZWwub3JnPjsNCj4gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6aytkdEBr
ZXJuZWwub3JnPjsgQ29ub3IgRG9vbGV5DQo+IDxjb25vcitkdEBrZXJuZWwub3JnPjsgU2hhd24g
R3VvIDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyDQo+IDxzLmhhdWVyQHBlbmd1
dHJvbml4LmRlPjsgUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0NCj4gPGtlcm5lbEBwZW5ndXRyb25p
eC5kZT47IEZhYmlvIEVzdGV2YW0gPGZlc3RldmFtQGdtYWlsLmNvbT47IFBoaWxpcHANCj4gWmFi
ZWwgPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBGcmFuayBMaSA8ZnJhbmsubGlAbnhwLmNvbT47
IGxpbnV4LQ0KPiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmc7IGRldmljZXRyZWVAdmdlci5rZXJuZWwu
b3JnOyBpbXhAbGlzdHMubGludXguZGV2OyBsaW51eC0NCj4gYXJtLWtlcm5lbEBsaXN0cy5pbmZy
YWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnDQo+IFN1YmplY3Q6IFJlOiBb
UEFUQ0ggdjEwIDIvNV0gbWVkaWE6IGlteDhtcS1taXBpLWNzaTI6IFVzZQ0KPiBkZXZtX2Nsa19i
dWxrX2dldF9hbGwoKSB0byBmZXRjaCBjbG9ja3MNCj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+IFRo
YW5rIHlvdSBmb3IgdGhlIHBhdGNoLg0KPiANCj4gT24gRnJpLCBEZWMgMDUsIDIwMjUgYXQgMDU6
MDc6NDRQTSArMDgwMCwgR3Vvbml1IFpob3Ugd3JvdGU6DQo+ID4gRnJvbTogR3Vvbml1IFpob3Ug
PGd1b25pdS56aG91QG54cC5jb20+DQo+ID4NCj4gPiBVc2UgZGV2bV9jbGtfYnVsa19nZXRfYWxs
KCkgaGVscGVyIHRvIHNpbXBsaWZ5IGNsb2NrIGhhbmRsZSBjb2RlLg0KPiA+DQo+ID4gTm8gZnVu
Y3Rpb25hbCBjaGFuZ2VzIGludGVuZGVkLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZyYW5rIExp
IDxGcmFuay5MaUBueHAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25pdSBaaG91IDxndW9u
aXUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL254
cC9pbXg4bXEtbWlwaS1jc2kyLmMgfCA1NQ0KPiA+ICsrKysrKysrKystLS0tLS0tLS0tLS0tLS0t
LQ0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygrKSwgMzUgZGVsZXRpb25zKC0p
DQo+ID4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1x
LW1pcGktY3NpMi5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlw
aS1jc2kyLmMNCj4gPiBpbmRleA0KPiA+DQo+IDM3MWI0ZTgxMzI4YzEwNzI2OWY4OWRhMjM4MThh
YjBhYmQwMTc5ZGEuLjBlM2E0MWNkMzVlZGZlZmM1MWI1NjMxDQo+IGUyYzM2DQo+ID4gZmQ3NmUz
ZTE0ZDgzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDht
cS1taXBpLWNzaTIuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDht
cS1taXBpLWNzaTIuYw0KPiA+IEBAIC03MSwyMSArNzEsNiBAQCBlbnVtIHsNCj4gPiAgCVNUX1NV
U1BFTkRFRAk9IDQsDQo+ID4gIH07DQo+ID4NCj4gPiAtZW51bSBpbXg4bXFfbWlwaV9jc2lfY2xr
IHsNCj4gPiAtCUNTSTJfQ0xLX0NPUkUsDQo+ID4gLQlDU0kyX0NMS19FU0MsDQo+ID4gLQlDU0ky
X0NMS19VSSwNCj4gPiAtCUNTSTJfTlVNX0NMS1MsDQo+ID4gLX07DQo+ID4gLQ0KPiA+IC1zdGF0
aWMgY29uc3QgY2hhciAqIGNvbnN0IGlteDhtcV9taXBpX2NzaV9jbGtfaWRbQ1NJMl9OVU1fQ0xL
U10gPSB7DQo+ID4gLQlbQ1NJMl9DTEtfQ09SRV0gPSAiY29yZSIsDQo+ID4gLQlbQ1NJMl9DTEtf
RVNDXSA9ICJlc2MiLA0KPiA+IC0JW0NTSTJfQ0xLX1VJXSA9ICJ1aSIsDQo+ID4gLX07DQo+ID4g
LQ0KPiA+IC0jZGVmaW5lIENTSTJfTlVNX0NMS1MJQVJSQVlfU0laRShpbXg4bXFfbWlwaV9jc2lf
Y2xrX2lkKQ0KPiA+IC0NCj4gPiAgc3RydWN0IGlteDhtcV9wbGF0X2RhdGEgew0KPiA+ICAJaW50
ICgqZW5hYmxlKShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSwgdTMyIGhzX3NldHRsZSk7DQo+ID4g
IAl2b2lkICgqZGlzYWJsZSkoc3RydWN0IGNzaV9zdGF0ZSAqc3RhdGUpOyBAQCAtMTExLDcgKzk2
LDkgQEAgc3RydWN0DQo+ID4gY3NpX3N0YXRlIHsNCj4gPiAgCXN0cnVjdCBkZXZpY2UgKmRldjsN
Cj4gPiAgCWNvbnN0IHN0cnVjdCBpbXg4bXFfcGxhdF9kYXRhICpwZGF0YTsNCj4gPiAgCXZvaWQg
X19pb21lbSAqcmVnczsNCj4gPiAtCXN0cnVjdCBjbGtfYnVsa19kYXRhIGNsa3NbQ1NJMl9OVU1f
Q0xLU107DQo+ID4gKwlzdHJ1Y3QgY2xrX2J1bGtfZGF0YSAqY2xrczsNCj4gPiArCXN0cnVjdCBj
bGsgKmVzY19jbGs7DQo+ID4gKwl1MzIgbnVtX2Nsa3M7DQo+ID4gIAlzdHJ1Y3QgcmVzZXRfY29u
dHJvbCAqcnN0Ow0KPiA+ICAJc3RydWN0IHJlZ3VsYXRvciAqbWlwaV9waHlfcmVndWxhdG9yOw0K
PiA+DQo+ID4gQEAgLTM4NCwyNCArMzcxLDE2IEBAIHN0YXRpYyB2b2lkIGlteDhtcV9taXBpX2Nz
aV9zZXRfcGFyYW1zKHN0cnVjdA0KPiBjc2lfc3RhdGUgKnN0YXRlKQ0KPiA+ICAJCQkgICAgICBD
U0kyUlhfU0VORF9MRVZFTCk7DQo+ID4gIH0NCj4gPg0KPiA+IC1zdGF0aWMgaW50IGlteDhtcV9t
aXBpX2NzaV9jbGtfZW5hYmxlKHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlKSAtew0KPiA+IC0JcmV0
dXJuIGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKENTSTJfTlVNX0NMS1MsIHN0YXRlLT5jbGtzKTsN
Cj4gPiAtfQ0KPiA+IC0NCj4gPiAtc3RhdGljIHZvaWQgaW14OG1xX21pcGlfY3NpX2Nsa19kaXNh
YmxlKHN0cnVjdCBjc2lfc3RhdGUgKnN0YXRlKSAtew0KPiA+IC0JY2xrX2J1bGtfZGlzYWJsZV91
bnByZXBhcmUoQ1NJMl9OVU1fQ0xLUywgc3RhdGUtPmNsa3MpOw0KPiA+IC19DQo+ID4gLQ0KPiA+
IC1zdGF0aWMgaW50IGlteDhtcV9taXBpX2NzaV9jbGtfZ2V0KHN0cnVjdCBjc2lfc3RhdGUgKnN0
YXRlKQ0KPiA+ICtzdGF0aWMgc3RydWN0IGNsayAqZmluZF9lc2NfY2xrKHN0cnVjdCBjc2lfc3Rh
dGUgKnN0YXRlKQ0KPiANCj4gaW14OG1xX21pcGlfY3NpX2ZpbmRfZXNjX2NsaygpLg0KPiANCj4g
PiAgew0KPiA+ICAJdW5zaWduZWQgaW50IGk7DQo+ID4NCj4gPiAtCWZvciAoaSA9IDA7IGkgPCBD
U0kyX05VTV9DTEtTOyBpKyspDQo+ID4gLQkJc3RhdGUtPmNsa3NbaV0uaWQgPSBpbXg4bXFfbWlw
aV9jc2lfY2xrX2lkW2ldOw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IHN0YXRlLT5udW1fY2xrczsg
aSsrKSB7DQo+ID4gKwkJaWYgKCFzdHJjbXAoc3RhdGUtPmNsa3NbaV0uaWQsICJlc2MiKSkNCj4g
PiArCQkJcmV0dXJuIHN0YXRlLT5jbGtzW2ldLmNsazsNCj4gPiArCX0NCj4gPg0KPiA+IC0JcmV0
dXJuIGRldm1fY2xrX2J1bGtfZ2V0KHN0YXRlLT5kZXYsIENTSTJfTlVNX0NMS1MsIHN0YXRlLT5j
bGtzKTsNCj4gPiArCXJldHVybiBFUlJfUFRSKC1FTk9ERVYpOw0KPiA+ICB9DQo+ID4NCj4gPiAg
c3RhdGljIGludCBpbXg4bXFfbWlwaV9jc2lfY2FsY19oc19zZXR0bGUoc3RydWN0IGNzaV9zdGF0
ZSAqc3RhdGUsIEBADQo+ID4gLTQ1Niw3ICs0MzUsNyBAQCBzdGF0aWMgaW50IGlteDhtcV9taXBp
X2NzaV9jYWxjX2hzX3NldHRsZShzdHJ1Y3QgY3NpX3N0YXRlDQo+ICpzdGF0ZSwNCj4gPiAgCSAq
IGRvY3VtZW50YXRpb24gcmVjb21tZW5kcyBwaWNraW5nIGEgdmFsdWUgYXdheSBmcm9tIHRoZQ0K
PiBib3VuZGFyaWVzLg0KPiA+ICAJICogTGV0J3MgcGljayB0aGUgYXZlcmFnZS4NCj4gPiAgCSAq
Lw0KPiA+IC0JZXNjX2Nsa19yYXRlID0gY2xrX2dldF9yYXRlKHN0YXRlLT5jbGtzW0NTSTJfQ0xL
X0VTQ10uY2xrKTsNCj4gPiArCWVzY19jbGtfcmF0ZSA9IGNsa19nZXRfcmF0ZShzdGF0ZS0+ZXNj
X2Nsayk7DQo+ID4gIAlpZiAoIWVzY19jbGtfcmF0ZSkgew0KPiA+ICAJCWRldl9lcnIoc3RhdGUt
PmRldiwgIkNvdWxkIG5vdCBnZXQgZXNjIGNsb2NrIHJhdGUuXG4iKTsNCj4gPiAgCQlyZXR1cm4g
LUVJTlZBTDsNCj4gPiBAQCAtNzgzLDcgKzc2Miw3IEBAIHN0YXRpYyB2b2lkIGlteDhtcV9taXBp
X2NzaV9wbV9zdXNwZW5kKHN0cnVjdA0KPiA+IGRldmljZSAqZGV2KQ0KPiA+DQo+ID4gIAlpZiAo
c3RhdGUtPnN0YXRlICYgU1RfUE9XRVJFRCkgew0KPiA+ICAJCWlteDhtcV9taXBpX2NzaV9zdG9w
X3N0cmVhbShzdGF0ZSk7DQo+ID4gLQkJaW14OG1xX21pcGlfY3NpX2Nsa19kaXNhYmxlKHN0YXRl
KTsNCj4gPiArCQljbGtfYnVsa19kaXNhYmxlX3VucHJlcGFyZShzdGF0ZS0+bnVtX2Nsa3MsIHN0
YXRlLT5jbGtzKTsNCj4gPiAgCQlzdGF0ZS0+c3RhdGUgJj0gflNUX1BPV0VSRUQ7DQo+ID4gIAl9
DQo+ID4NCj4gPiBAQCAtODAxLDcgKzc4MCw3IEBAIHN0YXRpYyBpbnQgaW14OG1xX21pcGlfY3Np
X3BtX3Jlc3VtZShzdHJ1Y3QNCj4gZGV2aWNlDQo+ID4gKmRldikNCj4gPg0KPiA+ICAJaWYgKCEo
c3RhdGUtPnN0YXRlICYgU1RfUE9XRVJFRCkpIHsNCj4gPiAgCQlzdGF0ZS0+c3RhdGUgfD0gU1Rf
UE9XRVJFRDsNCj4gPiAtCQlyZXQgPSBpbXg4bXFfbWlwaV9jc2lfY2xrX2VuYWJsZShzdGF0ZSk7
DQo+ID4gKwkJcmV0ID0gY2xrX2J1bGtfcHJlcGFyZV9lbmFibGUoc3RhdGUtPm51bV9jbGtzLCBz
dGF0ZS0+Y2xrcyk7DQo+ID4gIAl9DQo+ID4gIAlpZiAoc3RhdGUtPnN0YXRlICYgU1RfU1RSRUFN
SU5HKSB7DQo+ID4gIAkJc2Rfc3RhdGUgPSB2NGwyX3N1YmRldl9sb2NrX2FuZF9nZXRfYWN0aXZl
X3N0YXRlKHNkKTsNCj4gPiBAQCAtMTAyNyw5ICsxMDA2LDE1IEBAIHN0YXRpYyBpbnQgaW14OG1x
X21pcGlfY3NpX3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlp
ZiAoSVNfRVJSKHN0YXRlLT5yZWdzKSkNCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihzdGF0ZS0+cmVn
cyk7DQo+ID4NCj4gPiAtCXJldCA9IGlteDhtcV9taXBpX2NzaV9jbGtfZ2V0KHN0YXRlKTsNCj4g
PiArCXJldCA9IGRldm1fY2xrX2J1bGtfZ2V0X2FsbChkZXYsICZzdGF0ZS0+Y2xrcyk7DQo+ID4g
IAlpZiAocmV0IDwgMCkNCj4gPiAtCQlyZXR1cm4gcmV0Ow0KPiA+ICsJCXJldHVybiBkZXZfZXJy
X3Byb2JlKGRldiwgcmV0LCAiRmFpbGVkIHRvIGdldCBjbG9ja3NcbiIpOw0KPiA+ICsNCj4gPiAr
CXN0YXRlLT5udW1fY2xrcyA9IHJldDsNCj4gPiArDQo+ID4gKwlzdGF0ZS0+ZXNjX2NsayA9IGZp
bmRfZXNjX2NsayhzdGF0ZSk7DQo+ID4gKwlpZiAoSVNfRVJSKHN0YXRlLT5lc2NfY2xrKSkNCj4g
PiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoc3RhdGUtPmVzY19jbGspLCAi
Q291bGRuJ3QNCj4gZmluZA0KPiA+ICtlc2MgY2xvY2tcbiIpOw0KPiANCj4gVGhpcyBjb3VsZCBi
ZSBsaW5lLXdyYXBwZWQuDQo+IA0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1
cmVudC5waW5jaGFydEBpZGVhc29uYm9hcmQuY29tPg0KPiANCj4gSSBjYW4gbWFrZSB0aG9zZSBz
bWFsbCBjaGFuZ2VzIHdoZW4gYXBwbHlpbmcgaWYgdGhlcmUncyBubyBvdGhlciBuZWVkIHRvDQo+
IHN1Ym1pdCBhIG5ldyB2ZXJzaW9uLg0KDQpUaGFuayB5b3UgZm9yIHRoZSByZXZpZXcgYW5kIG9m
ZmVyISBJIGhhdmUgbm8gb3RoZXIgY2hhbmdlcywgc28gcGxlYXNlIGZlZWwgZnJlZQ0KdG8gbWFr
ZSB0aG9zZSBhZGp1c3RtZW50cyB3aGVuIGFwcGx5aW5nLg0KDQo+IA0KPiA+DQo+ID4gIAlwbGF0
Zm9ybV9zZXRfZHJ2ZGF0YShwZGV2LCAmc3RhdGUtPnNkKTsNCj4gPg0KPiA+DQo+IA0KPiAtLQ0K
PiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

