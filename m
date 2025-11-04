Return-Path: <linux-media+bounces-46250-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 09126C2FB68
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 08:48:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 9C0264E7F53
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 07:48:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DA0430FF36;
	Tue,  4 Nov 2025 07:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="I8CAqRAx"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013014.outbound.protection.outlook.com [52.101.72.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B3930F523;
	Tue,  4 Nov 2025 07:47:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762242472; cv=fail; b=QHX3yKsiPMM/mf4RSwrXUu7WJorTpiju13JolhXXRmPmT2/F+/8xqCPEeIfOxx+ic5HLJDf0YBTKzCyGo7eqBbpQe/0LkSNDeFJ8+b/5wrNKFzsZ7PMnOeiOFzo4xIzYC/2QdY2BHW//cNg6sF8VPT90ckIvLR88t6RAa+MF3bI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762242472; c=relaxed/simple;
	bh=DIkApSN/8ZjGcOVPlr30/B3UQmK7T4wXaURywvzvEp8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=dYacItp4To7QQl+uKRwTGBcqbvIv2I6VAEcIgnADk5PB753588WcK8NpF2odBA1ECSp/H24P5LxgQfwa39A8M4R+T14A23hjVEmreqw2KvLq/qB1s31OI02zMd3PiWrSomtJLEC4IjHQD9AJ1ETYBKQFuPtJX0kTllfivXPGZE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=I8CAqRAx; arc=fail smtp.client-ip=52.101.72.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iU9jnoxP42ZYcasA8RvNot/wysUCiDR5JTa2yoosrn8ELBnuMcx8gILf/U8VLpKeeO3g+BceVagnKJ1GIujGm0rLPSed6pQccG94BkztzoZ/pNUoxfYK7moGsNsfzH//jZwWlAHVFz/iMyTcEQwtgswygCZJAPvp3wkWFZfYqFkVQdWvVHp5x3DfM2JaEE7+GSfbHOB5fHySyEMsWfSgx21yduvZVLruNT1ANEH6wVKZqKxfJTWY2cXuB3SBhjdUPedYVZ0cnCL+p7nVD0aFW9B8WOxORNN2CAzU2Te8KhEVZ6Ihqa253p6rP9Yc0NKRYeD3bdk8k8xD6ZJplsVILw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DIkApSN/8ZjGcOVPlr30/B3UQmK7T4wXaURywvzvEp8=;
 b=Dnfe89y/sqNkkp8L/rmjF0fWvW4ViM/wX2iXxk1//ZJyNzbK/43TxeSiJAG0G9pppYz9Lr/qLuDeGstMKuTdgUBr2+jhxlD3m1VzNU6ISnARDouGf7Z3oOFu4+AXsQYI2ZFzcc/aDI/77oxSWPEBLx1OKS9LfsMmuDw79KoznC892qmYZXL/G7P76QChLN+R8tjA4pERy/fRuUXdRmxJqftWF5rYxK354WWWNyAmWy1gpFHDmn76nPpV+qH/hZuIJ5IC6vBDwOh2zQFOgyzHRkZMUpCBVDcWeBilt5QKB6k1Q3IZDVZnmrmxaM5txL6rYBSeJvUbc5IXsjGXko9z9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DIkApSN/8ZjGcOVPlr30/B3UQmK7T4wXaURywvzvEp8=;
 b=I8CAqRAxPY1DZNUp3qTYDBsT0sZYpkcB+aEdwKDdAdMS1S8LnvP8yvEs/6/Nk2StkDZZwXmIyenVF/1ljgcscmDkjc256pWR90IOB3NANyN9fP1LjdVt1Pjh7EGRfx3dcWEn6wQYJ3uFjqb44nZuhjT1NP4lo7cdXdjzXHdo9NuEBaMC1DHh0xySNi/3xIAMWlEE1w9ITS3jqGQesSEDmOUTsE2GQRPU41qZPeSsgCOZ80UW/E+BRAP5R/nVoyASLziDCtNio1ot7+L8zQS72n/0YoE6r75rugcBhnxNfEA7JyrPslwjKbWd+KbqwiTNNI9eCFw2OcR9ChxsV+IEWg==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by AM0PR04MB7170.eurprd04.prod.outlook.com (2603:10a6:208:191::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.16; Tue, 4 Nov
 2025 07:47:43 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 07:47:43 +0000
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
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>
Subject: RE: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Topic: [PATCH v7 2/5] media: imx8mq-mipi-csi2: Use
 devm_clk_bulk_get_all() to fetch clocks
Thread-Index: AQHcTV9N9UejgXVzKEOQjAZ5utkCow==
Date: Tue, 4 Nov 2025 07:47:43 +0000
Message-ID:
 <AS8PR04MB908014E336F99BEEB504EDB7FAC4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-2-5ecb081ce79b@nxp.com>
 <20251027001151.GN13023@pendragon.ideasonboard.com>
In-Reply-To: <20251027001151.GN13023@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|AM0PR04MB7170:EE_
x-ms-office365-filtering-correlation-id: d9fa1880-c494-4c71-6db3-08de1b767018
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|19092799006|376014|7416014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?MkRJQzZCUVBqcU9aNG15M3hnUGdmdm9GNmY5aDZhZys4NzczV2tYN2dXRGF6?=
 =?utf-8?B?U1dZdUkySDB0VzFnZjg4aEVPenMxYTVJQi8xMXh6RG1POGl6SWJueGM3d1NV?=
 =?utf-8?B?UERaU1doNGUxNEVaRTlYWVVHbGdGQksrY0hJK0tobXBFSVcvVjZoR2ZGRCsy?=
 =?utf-8?B?Q3pUdzZnWTJQMzJpM1V0RmFNMlNweU1vTW8zMUFvaW9SRDRJdzZHQzBwRWlv?=
 =?utf-8?B?ZmRRV0ZSeEgwZU54b2FXbVYzVEprcDFtd2wxemp0UHNJVEllYXdnTnJCOUY3?=
 =?utf-8?B?Z1F5WXlMbCtlQk8xZWVKRVl5NHk4MDZDZ2ZkckJxT1ZseEY4WnVScllXdWF2?=
 =?utf-8?B?STBiUTdPR3ZibWZGT2liaVhoY0RudVRKRGJDTnV6RU5WSGJXWEdtWGFwd01i?=
 =?utf-8?B?emg0eUJjL1hKcERvMFFwckhBNHFxakkrVlJRRzdwQmU2U2I1WlBOdk95RXJP?=
 =?utf-8?B?dVJGdTl4TGdCVHQxZXJxSG1LNGlHKzQ4TDFxWVMyVGZxV1dmR3UveFB3eWxY?=
 =?utf-8?B?aUJyWVI0S2VNOUdSa0sxY2lNQ2ZJSUNsV2tpNEhoQ2xnelVKZ1A3V1d1ZjBn?=
 =?utf-8?B?UjFKUWhpRzZQSG5CWUxVQUNHMjBmM1JTWkR6TW5nNWlYZU1Tc2t6aUVnNHUr?=
 =?utf-8?B?bE5aZWlWMlJQQ3VXQmY5QU9uTFd4UVpyenhFc1Z4TXA4VEE1OXVhbWtNcFIv?=
 =?utf-8?B?VGlybHc1WFY3cUt2cVJsdmZvTEFQUVJPOHJ2WUxTVWcwNlhmYlI0UnFzSWw4?=
 =?utf-8?B?Nm0xU2pzSHJTZlBPWGpJOTJSUjB6QnFKQzZzS0d4Mm5aT2h2bkczbitJN3Fz?=
 =?utf-8?B?T1phamNZd09uUTRjOG5RR2F0dVlhMS9NaUw0ZnhPa0xDeXN0ZGsvcEZyR0ta?=
 =?utf-8?B?bEx6d3hmM3dxNklMMG4ydC9ZZXdRSnpybjN5ZVRRRkxpV1hJUUVkVlJKaUdT?=
 =?utf-8?B?LzlURVVYOG9Td0Z0Sk1lc2szRmY1YVU1SUZhWll6bGxacHlMNERjZDdLdkE5?=
 =?utf-8?B?OHZ1M25vZDZ6b2RkYXNDTUh5WXFydVJyclpVTGF0RGFBQjRROFRXRCtQU1hB?=
 =?utf-8?B?dlZMNUNsK1p0L2hhWmNHOWFlVWw0c3RQdStMMnN1QjRiTTJ1NGVSRXFRa2dC?=
 =?utf-8?B?Q1czK2ZISkZDRXJtMllSMHZXSlA1WlJpNlhGNlBrQmdaT01ucmxSSm9hR09D?=
 =?utf-8?B?TWFhNHJzcDc4RVJ2VHBWVk5LdEtqT0wyVG1PZUpBa2twWXkyZ3h4MUY0R1By?=
 =?utf-8?B?Ynd0U0dVMmpsZ3pEd0dGaFMvWmk1aXJqeUF6V0UwNUErb0E3U0dQNFViQXlK?=
 =?utf-8?B?V2tFeldxRzUrNFBjMktHNHRleE5nWlE0UVRFSlhEaVJmeDlzcm1uVFNQSGpO?=
 =?utf-8?B?OU1raC9KMndtYnhTRXhmM1hBVlhMVEtqdCsyYTNhaExBelR1emJmbjExMVZp?=
 =?utf-8?B?N3l4cHpBOGRxb3c4dzFDK0xGMm9Sc1hZWURkbmd3Tk82RVVHZ0VFeWlHbm9O?=
 =?utf-8?B?T0pjU1hlQ3kyVzhFZ0NBZ2tJd0xXamhjNHJkK2FrdXRsRE11UVo3cnZUSENL?=
 =?utf-8?B?SElDWWo1L2ZNRzJzUEFvQmhIVjIwUjg3Y1Y5bVU5STRyYkVVUU9FZW5JMUlw?=
 =?utf-8?B?dVRJYlVveGk2L2dUTUFvZ1R3cjgzY1JZd3BsK015Zm1QZ3BJYnhJWkRNWGp1?=
 =?utf-8?B?c3hIeDZMRFVzd3RmTXY2ZHQremdKWllrWUxzS3MyZmdjdVE3WlpxVjBFUDBC?=
 =?utf-8?B?M2xodW4vWGJnR2lZcjhXbThrNFZNSjNEaDNIRFlMUG9BNnV1TFNDbDBsdHN4?=
 =?utf-8?B?ZkdMWStuZkRPcXZwNE5menJoeXNwMjFvdFJ6WjNCSmU4ZlUxRlorekxNejdE?=
 =?utf-8?B?OHo3SzhZYUM3a0xxdDNnb0pIbE9LdENPQUljYXF3T01nV2hPdU1pOUdLVEZS?=
 =?utf-8?B?QW9HN1B1dkdubmdWc1YxK0xCSmpOTUcvY05HNXBEN1BXRHNMeXB4OVVrLzdt?=
 =?utf-8?B?N2F4a2lKOW0zMWVKSjBQLzkweld4cVRyN1JpMHREZFhwcWp6ZzdEQnlheC9Q?=
 =?utf-8?Q?R6ck/j?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?NWdKRnV6SnJCVWpKZzRpNWF1YXg5a09mYnpHK3VjMUJWQ3Vja29HcUtwUFNT?=
 =?utf-8?B?ZFlLamI5cG1LRVVZRVdlZkx4NmJCOUNiKzdqVVczc0ZBNmhvZWcvbEE2T2Rm?=
 =?utf-8?B?bjl2WittQW5VU1gzRURxc1c1alRyZEcxcmRkbitQS2JqRXVJM1hZK3g3Mm9S?=
 =?utf-8?B?M0p6dTljUUUzUEt4VlZoS3FCL0hWNi9EZXRwd1hBMzQ0Ynk2c2NEcXVEV2ls?=
 =?utf-8?B?TTd0WEpkenVrZENNWVlWWkVkai9pdi9VRnFtU1R3bG45dVZMbXJ5Y0FYN0pa?=
 =?utf-8?B?bmN6c09aR0NVU2RtL05rRldmcjNnL0YyZ0d1UU1EdGJtQW9KQ05NaVpFYmVJ?=
 =?utf-8?B?MlJsZnlhNlg3OFdnUkZRaEpVMkJrRnBabEZ4SmNrMmZ4ZkZ3RC9UR1Rvd20w?=
 =?utf-8?B?b21UaGl5a0dMV21Fd1BXYTdFSVZXbUl0Slg0OThnYlJMdFEyL3Q1cEZULzd6?=
 =?utf-8?B?TzkrREZkSUgyV09pL3kva2Qyb3YxTFhMUGNtYWxiaE0zekRvd3hmVlloMC95?=
 =?utf-8?B?bHdEV1ZWV3A1dTNZSDMvMUt4YldIUzAwdytRY0lYcjhJaCs5dVBsY1lBUDNM?=
 =?utf-8?B?ak1nQkJGNnVlYTJjSWdhbFppc3lOME9rdU9xamIySDZOSFQxVEUvS1haV3dW?=
 =?utf-8?B?TE5aanRJN0tiMERWMzdsYUw2amxPQlM2QUFVSzNuRHZTa3FmMzdhVzBSTDBZ?=
 =?utf-8?B?akNrVXdWaHREdE1Ua0ZMalVwRmxuM3ZCbE91b2xUVDRscUxMVEg0TklrZ3My?=
 =?utf-8?B?UnpIM1dYS3pwM3p2M3NZV1JOUkwybGZUWDZTamZwRFpRRmxlQ1d0QTVVaG1r?=
 =?utf-8?B?dFFVeXpVa2hmSTQrT1dLNExSeEcxbnVGeDMxSjJscDFITDRYSlVtcStVZWY2?=
 =?utf-8?B?dW5ZOE1sMzZFRk9za3orSm12aUtiRVBENExBMjJ4NDRxV2lpcmdaMEVRZU4z?=
 =?utf-8?B?WlNpTURGOGx5UFlxbnUvcFZVRmxseWJzclAyZW1RSlJkZWROaFUrL1NTRERE?=
 =?utf-8?B?UTM0a2ZLcWVuYU9RTFBVTjVBbkJkY2FqS1pObEJDaXVJc1RpQlZWQXZvODVq?=
 =?utf-8?B?YWVtYy9vQzQrMVdjL1EwcmtuNzBPQXRLZHFZdjBncVAwdmJNYVhBSWc2cGVl?=
 =?utf-8?B?dll5dExIWVU0b1ZvTGwxM2tlUGxoWFVKbGt5YUdCcDdtdU5MeHQ1Y1ZsU3hJ?=
 =?utf-8?B?RDNqS0R1NG1QWXpUTnVjR0krcUZreWZSSXFqeS96QlhYZ0hEYzh2VUhibklp?=
 =?utf-8?B?KzE2RzJxclkxeG5aK3luTWovZHdOOWx2ZStqM2RjSzluY2pLdjhjaVY1Mmxy?=
 =?utf-8?B?UTdTdytndzVPOC90UGdMOTFJYzBzU3BleEQ4NUFWZzZzUmc1MXA4eDhlam1u?=
 =?utf-8?B?dXJodkd3eGljNVlDN2JicHVHcHY5a3Q3NWxNaXAxa0M1NjhvUWZFRm10aFNH?=
 =?utf-8?B?bTN1ZXZlOUVWSmp5YkNlUFVzdFlzNTJZR0RVRVEvLzg3R0FoSDhuU1g5cjJ0?=
 =?utf-8?B?RHJNYmhBekNINlpNenhwWHhUeU5pWW9ZaTc2S0pVOEd0OGpINXVxalg4K0JP?=
 =?utf-8?B?ZTl5ZllvMFFqRkZTajM5aEwxOEMrdlU5bGh5WkNZOFViM3ltQ2MwMHdYaGdt?=
 =?utf-8?B?RXZkcGNuUVJ3bEdzc0xpY3BRenBVcjBoTWoyUzFmREdBK0tjbzdoWVpTNnhU?=
 =?utf-8?B?OHpCUnpGUlMrSWRCY21LV1J3d3JPTG8zR1ppVFdnQVJhWnA4K1ZjT2JDa2Zv?=
 =?utf-8?B?WUdSOXhVbGJGSDNSQlFOOGVIamNCdFJvenQ4eVZIYVFjajlvbC9JWi96RjUv?=
 =?utf-8?B?NFkybDA0T3JxZGh3dXpvR0VzdnhleHhTQ0VhU3I3d3lvQlRnV1NJQnBpNXVr?=
 =?utf-8?B?K2gzdHB6ajZITVJrZGVxbGh1Ry9wK1lPUVRBYlIyTjJNWlpRRDI3ZFFkZlR1?=
 =?utf-8?B?TUU5ZVlub2R2eHdNckx5V1lZTTIvNml5MVpTaXk2NkdBd2RTdnczeS9hNk1s?=
 =?utf-8?B?VlgwMTkyZ28vSWRqZjNuRzRsMXF1Z3BtUUlkVnJ1TU5XRUdwcnZJSC9ld1l5?=
 =?utf-8?B?UmgxMW5WWllJMWpIRWl5RUZCdUlmdGovOG40K0dZQWNxd0FTcXNPNHRjczVa?=
 =?utf-8?Q?q5YW/HXou+04NuXJ98bHKYxIB?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: d9fa1880-c494-4c71-6db3-08de1b767018
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 07:47:43.3585
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gosj2MxdMI+wUGKgWIStaEjDjA4Je4U4vw1tYhORAGL1AEFw/dbG4qV+Y+NSYPFNywQ03Jo3HTL5AqRFgrgUmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR04MB7170

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyNywgMjAyNSA4OjEy
IEFNDQo+IFRvOiBHLk4uIFpob3UgKE9TUykgPGd1b25pdS56aG91QG9zcy5ueHAuY29tPg0KPiBD
YzogUnVpIE1pZ3VlbCBTaWx2YSA8cm1mcmZzQGdtYWlsLmNvbT47IE1hcnRpbiBLZXBwbGluZ2Vy
DQo+IDxtYXJ0aW5rQHBvc3Rlby5kZT47IFB1cmlzbSBLZXJuZWwgVGVhbSA8a2VybmVsQHB1cmku
c20+OyBNYXVybw0KPiBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9yZz47IFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Ow0KPiBLcnp5c3p0b2YgS296bG93c2tpIDxrcnprK2R0
QGtlcm5lbC5vcmc+OyBDb25vciBEb29sZXkNCj4gPGNvbm9yK2R0QGtlcm5lbC5vcmc+OyBTaGF3
biBHdW8gPHNoYXduZ3VvQGtlcm5lbC5vcmc+OyBTYXNjaGEgSGF1ZXINCj4gPHMuaGF1ZXJAcGVu
Z3V0cm9uaXguZGU+OyBQZW5ndXRyb25peCBLZXJuZWwgVGVhbQ0KPiA8a2VybmVsQHBlbmd1dHJv
bml4LmRlPjsgRmFiaW8gRXN0ZXZhbSA8ZmVzdGV2YW1AZ21haWwuY29tPjsgUGhpbGlwcA0KPiBa
YWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT47IEZyYW5rIExpIDxmcmFuay5saUBueHAuY29t
PjsgbGludXgtDQo+IG1lZGlhQHZnZXIua2VybmVsLm9yZzsgZGV2aWNldHJlZUB2Z2VyLmtlcm5l
bC5vcmc7IGlteEBsaXN0cy5saW51eC5kZXY7IGxpbnV4LQ0KPiBhcm0ta2VybmVsQGxpc3RzLmlu
ZnJhZGVhZC5vcmc7IGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc7IEcuTi4gWmhvdQ0KPiA8
Z3Vvbml1Lnpob3VAbnhwLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSCB2NyAyLzVdIG1lZGlh
OiBpbXg4bXEtbWlwaS1jc2kyOiBVc2UNCj4gZGV2bV9jbGtfYnVsa19nZXRfYWxsKCkgdG8gZmV0
Y2ggY2xvY2tzDQo+IA0KPiBPbiBUaHUsIE9jdCAyMywgMjAyNSBhdCAwNToxOTo0M1BNICswODAw
LCBHdW9uaXUgWmhvdSB3cm90ZToNCj4gPiBGcm9tOiBHdW9uaXUgWmhvdSA8Z3Vvbml1Lnpob3VA
bnhwLmNvbT4NCj4gPg0KPiA+IFVzZSBkZXZtX2Nsa19idWxrX2dldF9hbGwoKSBoZWxwZXIgdG8g
c2ltcGxpZnkgY2xvY2sgaGFuZGxlIGNvZGUuDQo+ID4NCj4gPiBObyBmdW5jdGlvbmFsIGNoYW5n
ZXMgaW50ZW5kZWQuDQo+ID4NCj4gPiBSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54
cC5jb20+DQo+ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54cC5j
b20+DQo+ID4gLS0tDQo+ID4gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDhtcS1taXBp
LWNzaTIuYyB8IDUyDQo+ID4gKysrKysrKystLS0tLS0tLS0tLS0tLS0tLS0tDQo+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAzNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4bXEtbWlwaS1jc2kyLmMN
Cj4gPiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDhtcS1taXBpLWNzaTIuYw0KPiA+
IGluZGV4DQo+ID4NCj4gZDMzM2ZmNDM1MzlmMDYxYjhiOWNmODhhZjJjZGE4YzQ0YjNlYzJhOS4u
ZmQyMDI2MDFkNDAxMTQ1ZGE4YmUyM2RmNA0KPiA0NTENCj4gPiBmNmFmNjYwNjQyYzUgMTAwNjQ0
DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5j
DQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OG1xLW1pcGktY3NpMi5j
DQo+ID4gQEAgLTcxLDIxICs3MSw2IEBAIGVudW0gew0KPiA+ICAJU1RfU1VTUEVOREVECT0gNCwN
Cj4gPiAgfTsNCj4gPg0KPiA+IC1lbnVtIGlteDhtcV9taXBpX2NzaV9jbGsgew0KPiA+IC0JQ1NJ
Ml9DTEtfQ09SRSwNCj4gPiAtCUNTSTJfQ0xLX0VTQywNCj4gPiAtCUNTSTJfQ0xLX1VJLA0KPiA+
IC0JQ1NJMl9OVU1fQ0xLUywNCj4gPiAtfTsNCj4gPiAtDQo+ID4gLXN0YXRpYyBjb25zdCBjaGFy
ICogY29uc3QgaW14OG1xX21pcGlfY3NpX2Nsa19pZFtDU0kyX05VTV9DTEtTXSA9IHsNCj4gPiAt
CVtDU0kyX0NMS19DT1JFXSA9ICJjb3JlIiwNCj4gPiAtCVtDU0kyX0NMS19FU0NdID0gImVzYyIs
DQo+ID4gLQlbQ1NJMl9DTEtfVUldID0gInVpIiwNCj4gPiAtfTsNCj4gPiAtDQo+ID4gLSNkZWZp
bmUgQ1NJMl9OVU1fQ0xLUwlBUlJBWV9TSVpFKGlteDhtcV9taXBpX2NzaV9jbGtfaWQpDQo+ID4g
LQ0KPiA+ICBzdHJ1Y3QgaW14OG1xX3BsYXRfZGF0YSB7DQo+ID4gIAlpbnQgKCplbmFibGUpKHN0
cnVjdCBjc2lfc3RhdGUgKnN0YXRlLCB1MzIgaHNfc2V0dGxlKTsNCj4gPiAgCXZvaWQgKCpkaXNh
YmxlKShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSk7IEBAIC0xMTEsNyArOTYsOCBAQCBzdHJ1Y3QN
Cj4gPiBjc2lfc3RhdGUgew0KPiA+ICAJc3RydWN0IGRldmljZSAqZGV2Ow0KPiA+ICAJY29uc3Qg
c3RydWN0IGlteDhtcV9wbGF0X2RhdGEgKnBkYXRhOw0KPiA+ICAJdm9pZCBfX2lvbWVtICpyZWdz
Ow0KPiA+IC0Jc3RydWN0IGNsa19idWxrX2RhdGEgY2xrc1tDU0kyX05VTV9DTEtTXTsNCj4gPiAr
CXN0cnVjdCBjbGtfYnVsa19kYXRhICpjbGtzOw0KPiA+ICsJaW50IG51bV9jbGtzOw0KPiA+ICAJ
c3RydWN0IHJlc2V0X2NvbnRyb2wgKnJzdDsNCj4gPiAgCXN0cnVjdCByZWd1bGF0b3IgKm1pcGlf
cGh5X3JlZ3VsYXRvcjsNCj4gPg0KPiA+IEBAIC0zODQsMjQgKzM3MCwxNiBAQCBzdGF0aWMgdm9p
ZCBpbXg4bXFfbWlwaV9jc2lfc2V0X3BhcmFtcyhzdHJ1Y3QNCj4gY3NpX3N0YXRlICpzdGF0ZSkN
Cj4gPiAgCQkJICAgICAgQ1NJMlJYX1NFTkRfTEVWRUwpOw0KPiA+ICB9DQo+ID4NCj4gPiAtc3Rh
dGljIGludCBpbXg4bXFfbWlwaV9jc2lfY2xrX2VuYWJsZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0
ZSkgLXsNCj4gPiAtCXJldHVybiBjbGtfYnVsa19wcmVwYXJlX2VuYWJsZShDU0kyX05VTV9DTEtT
LCBzdGF0ZS0+Y2xrcyk7DQo+ID4gLX0NCj4gPiAtDQo+ID4gLXN0YXRpYyB2b2lkIGlteDhtcV9t
aXBpX2NzaV9jbGtfZGlzYWJsZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkNCj4gPiArc3RhdGlj
IHN0cnVjdCBjbGsgKmZpbmRfZXNjX2NsayhzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkNCj4gDQo+
IFRoaXMgaXMgb25lIG9mIHRoZSByZWFzb25zIHdoeSBJIGRvbid0IGxpa2UgZGV2bV9jbGtfYnVs
a19nZXRfYWxsKCkuIEkgd29uJ3QNCj4gb2JqZWN0IHRvIHRoaXMgcGF0Y2gsIGJ1dCBJIGRvbid0
IGxpa2UgaXQuIEF0IHRoZSB2ZXJ5IGxlc3QsIHlvdSBzaG91bGQgbG9vayB1cCB0aGUNCj4gY2xv
Y2sgYXQgcHJvYmUgdGltZSBhbmQgY2FjaGUgaXQgaW4gdGhlIGlteDhtcV9wbGF0X2RhdGEgc3Ry
dWN0dXJlLCB0byBhdm9pZA0KPiBsb29raW5nIGl0IHVwIG11bHRpcGxlIHRpbWVzIGF0IHJ1bnRp
bWUuDQoNCk9rLCBidXQgY291bGQgd2UgY2FjaGUgdGhlIGNsb2NrIGluIHRoZSBjc2lfc3RhdGUg
c3RydWN0dXJlPyBCZWNhdXNlIHRoZSBpbXg4bXFfcGxhdF9kYXRhDQpzdHJ1Y3R1cmUgaW5zdGFu
Y2UgaXMgY29uc3QuDQoNCj4gDQo+ID4gIHsNCj4gPiAtCWNsa19idWxrX2Rpc2FibGVfdW5wcmVw
YXJlKENTSTJfTlVNX0NMS1MsIHN0YXRlLT5jbGtzKTsNCj4gPiAtfQ0KPiA+IC0NCj4gPiAtc3Rh
dGljIGludCBpbXg4bXFfbWlwaV9jc2lfY2xrX2dldChzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSkg
LXsNCj4gPiAtCXVuc2lnbmVkIGludCBpOw0KPiA+ICsJaW50IGk7DQo+ID4NCj4gPiAtCWZvciAo
aSA9IDA7IGkgPCBDU0kyX05VTV9DTEtTOyBpKyspDQo+ID4gLQkJc3RhdGUtPmNsa3NbaV0uaWQg
PSBpbXg4bXFfbWlwaV9jc2lfY2xrX2lkW2ldOw0KPiA+ICsJZm9yIChpID0gMDsgaSA8IHN0YXRl
LT5udW1fY2xrczsgaSsrKSB7DQo+IA0KPiBNYWtlIHN0YXRlLT5udW1fY2xrcyB1bnNpZ25lZCBp
bnN0ZWFkIG9mIG1ha2luZyBpIHNpZ25lZC4NCj4gDQo+ID4gKwkJaWYgKCFzdHJjbXAoc3RhdGUt
PmNsa3NbaV0uaWQsICJlc2MiKSkNCj4gPiArCQkJcmV0dXJuIHN0YXRlLT5jbGtzW2ldLmNsazsN
Cj4gPiArCX0NCj4gPg0KPiA+IC0JcmV0dXJuIGRldm1fY2xrX2J1bGtfZ2V0KHN0YXRlLT5kZXYs
IENTSTJfTlVNX0NMS1MsIHN0YXRlLT5jbGtzKTsNCj4gPiArCXJldHVybiBOVUxMOw0KPiANCj4g
VGhpcyBuZWVkcyB0byBiZWNvbWUgYSBwcm9iZSBlcnJvci4NCg0KR290IGl0LCB3aWxsIHVwZGF0
ZSBpbiBuZXh0IHZlcnNpb24uDQoNCj4gDQo+ID4gIH0NCj4gPg0KPiA+ICBzdGF0aWMgaW50IGlt
eDhtcV9taXBpX2NzaV9jYWxjX2hzX3NldHRsZShzdHJ1Y3QgY3NpX3N0YXRlICpzdGF0ZSwgQEAN
Cj4gPiAtNDU2LDcgKzQzNCw3IEBAIHN0YXRpYyBpbnQgaW14OG1xX21pcGlfY3NpX2NhbGNfaHNf
c2V0dGxlKHN0cnVjdCBjc2lfc3RhdGUNCj4gKnN0YXRlLA0KPiA+ICAJICogZG9jdW1lbnRhdGlv
biByZWNvbW1lbmRzIHBpY2tpbmcgYSB2YWx1ZSBhd2F5IGZyb20gdGhlDQo+IGJvdW5kYXJpZXMu
DQo+ID4gIAkgKiBMZXQncyBwaWNrIHRoZSBhdmVyYWdlLg0KPiA+ICAJICovDQo+ID4gLQllc2Nf
Y2xrX3JhdGUgPSBjbGtfZ2V0X3JhdGUoc3RhdGUtPmNsa3NbQ1NJMl9DTEtfRVNDXS5jbGspOw0K
PiA+ICsJZXNjX2Nsa19yYXRlID0gY2xrX2dldF9yYXRlKGZpbmRfZXNjX2NsayhzdGF0ZSkpOw0K
PiA+ICAJaWYgKCFlc2NfY2xrX3JhdGUpIHsNCj4gPiAgCQlkZXZfZXJyKHN0YXRlLT5kZXYsICJD
b3VsZCBub3QgZ2V0IGVzYyBjbG9jayByYXRlLlxuIik7DQo+ID4gIAkJcmV0dXJuIC1FSU5WQUw7
DQo+ID4gQEAgLTc4Myw3ICs3NjEsNyBAQCBzdGF0aWMgdm9pZCBpbXg4bXFfbWlwaV9jc2lfcG1f
c3VzcGVuZChzdHJ1Y3QNCj4gPiBkZXZpY2UgKmRldikNCj4gPg0KPiA+ICAJaWYgKHN0YXRlLT5z
dGF0ZSAmIFNUX1BPV0VSRUQpIHsNCj4gPiAgCQlpbXg4bXFfbWlwaV9jc2lfc3RvcF9zdHJlYW0o
c3RhdGUpOw0KPiA+IC0JCWlteDhtcV9taXBpX2NzaV9jbGtfZGlzYWJsZShzdGF0ZSk7DQo+ID4g
KwkJY2xrX2J1bGtfZGlzYWJsZV91bnByZXBhcmUoc3RhdGUtPm51bV9jbGtzLCBzdGF0ZS0+Y2xr
cyk7DQo+ID4gIAkJc3RhdGUtPnN0YXRlICY9IH5TVF9QT1dFUkVEOw0KPiA+ICAJfQ0KPiA+DQo+
ID4gQEAgLTgwMSw3ICs3NzksNyBAQCBzdGF0aWMgaW50IGlteDhtcV9taXBpX2NzaV9wbV9yZXN1
bWUoc3RydWN0DQo+IGRldmljZQ0KPiA+ICpkZXYpDQo+ID4NCj4gPiAgCWlmICghKHN0YXRlLT5z
dGF0ZSAmIFNUX1BPV0VSRUQpKSB7DQo+ID4gIAkJc3RhdGUtPnN0YXRlIHw9IFNUX1BPV0VSRUQ7
DQo+ID4gLQkJcmV0ID0gaW14OG1xX21pcGlfY3NpX2Nsa19lbmFibGUoc3RhdGUpOw0KPiA+ICsJ
CXJldCA9IGNsa19idWxrX3ByZXBhcmVfZW5hYmxlKHN0YXRlLT5udW1fY2xrcywgc3RhdGUtPmNs
a3MpOw0KPiA+ICAJfQ0KPiA+ICAJaWYgKHN0YXRlLT5zdGF0ZSAmIFNUX1NUUkVBTUlORykgew0K
PiA+ICAJCXNkX3N0YXRlID0gdjRsMl9zdWJkZXZfbG9ja19hbmRfZ2V0X2FjdGl2ZV9zdGF0ZShz
ZCk7DQo+ID4gQEAgLTEwMjcsOSArMTAwNSw5IEBAIHN0YXRpYyBpbnQgaW14OG1xX21pcGlfY3Np
X3Byb2JlKHN0cnVjdA0KPiBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+ID4gIAlpZiAoSVNfRVJS
KHN0YXRlLT5yZWdzKSkNCj4gPiAgCQlyZXR1cm4gUFRSX0VSUihzdGF0ZS0+cmVncyk7DQo+ID4N
Cj4gPiAtCXJldCA9IGlteDhtcV9taXBpX2NzaV9jbGtfZ2V0KHN0YXRlKTsNCj4gPiAtCWlmIChy
ZXQgPCAwKQ0KPiA+IC0JCXJldHVybiByZXQ7DQo+ID4gKwlzdGF0ZS0+bnVtX2Nsa3MgPSBkZXZt
X2Nsa19idWxrX2dldF9hbGwoZGV2LCAmc3RhdGUtPmNsa3MpOw0KPiA+ICsJaWYgKHN0YXRlLT5u
dW1fY2xrcyA8IDApDQo+ID4gKwkJcmV0dXJuIGRldl9lcnJfcHJvYmUoZGV2LCBzdGF0ZS0+bnVt
X2Nsa3MsICJGYWlsZWQgdG8gZ2V0DQo+ID4gK2Nsb2Nrc1xuIik7DQo+ID4NCj4gPiAgCXBsYXRm
b3JtX3NldF9kcnZkYXRhKHBkZXYsICZzdGF0ZS0+c2QpOw0KPiA+DQo+IA0KPiAtLQ0KPiBSZWdh
cmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

