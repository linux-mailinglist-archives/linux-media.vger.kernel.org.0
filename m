Return-Path: <linux-media+bounces-46248-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id E49D1C2F904
	for <lists+linux-media@lfdr.de>; Tue, 04 Nov 2025 08:13:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id AB78F4F1AD1
	for <lists+linux-media@lfdr.de>; Tue,  4 Nov 2025 07:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8A91302776;
	Tue,  4 Nov 2025 07:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CqmGv/TK"
X-Original-To: linux-media@vger.kernel.org
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013027.outbound.protection.outlook.com [52.101.72.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83B213019A7;
	Tue,  4 Nov 2025 07:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762240396; cv=fail; b=ijPpT1swf9sr4e51rqT1fDIvgmPBtK9qqGCalyZn3Y8IV9wZpfPhBLsfkvTFz5HvKyOoOlLx8wO/TnheVz9qA6tlgKl6Ql1nnHGGeVfk20r2XJkXEudgk+R3hu/LY+0bSd0QBeDGUMRqwAaT37cp3MguH+lThenjU/Cwy5kMhTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762240396; c=relaxed/simple;
	bh=x2WjEmN4cZK0PaDU+5L3wnolWQ39LmwJWBoZAWRcV+g=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TVMXIcD/gyDjH9Z9YJtHyO/8pz7OxIjdAd4I/i1fH89EYd6Xl83X5PBL1oElWzYDKhZZf7f2FBc1t/l1k3pOSXRdsXQ8jjvfdMm9zGs8XKPLNVJgQnZBefWnysM8rudxRFeszD3hrqHtJfvGTBu1ThvFk9tqL/P/gTrvO3xiAt8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CqmGv/TK; arc=fail smtp.client-ip=52.101.72.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G0ZP4Y3l2gw/usaSmP6mAhiG+fosEtEzEFu/nNWCN23tfKK0CDzXr2HYNRpcrom2rwPPH5YGnjZoshsbGszCi3BZ/cz2wrFk2U+1CrFNtqga9/ypP4P4sCwLa09TcD0zKcpGhuaUB6IfjSwpMHZ2c0seGnVwfiOTwOyFQcd5ONu6wx1bluDBtdRox8eXtb1889AltgD8TcABEc+0+amzxEu72oHTv38Uy2YkwgSCtApxlHoDJTCGzJiRb5ROv8GeCB7RAx04BMZX5iNhqnGUPDYiT41NZjhz/rrG6KZ7YUyBxs/E0ksVRd9U+0WkijyDwM06KFc/s5amx7UdjcoqHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x2WjEmN4cZK0PaDU+5L3wnolWQ39LmwJWBoZAWRcV+g=;
 b=lB1eD6LK4c1fNjZC7pFz1Kq1Wtdepblez3N2kCWTpu/8/1fS80kwB8EkXDlZFMQWAGUd7eCiSJcFitSN5/OhtrThjln1UKj9KirqZ0y2RM7ik1Qp5WzA+d9iT1Mp2g7DvnrzI6xeaasB5ChwTrig7W/AhtyJO0OpsVzK/GyRk2Jaf7E909a/r5g5K96QxdNbS7bfMD+WVlXdRvAcas0ddPjsC4yp0uC9GW/Uu8mdywpDH9H6NcUxWUdHTrw10QH7lg5Fuh86hR6oyWFB0TclPlQ6scrMAad9Je0+B1/3aUukYRdSQJ/YnHsR1omEAuKUjPiKR5PDp/0nfxQYz1uhnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x2WjEmN4cZK0PaDU+5L3wnolWQ39LmwJWBoZAWRcV+g=;
 b=CqmGv/TKwXTq08rt5TShP3QgDIHcjETqtDCGPojtm8auRZdmZNlAnLJDIiNhnsTH0ay4byGNCIfPqmVOWZZw3qRIg0F3csdba+jRWoe6m9yZ53AYo0nCH6JA3HPHVKPQ9zGWVfc4QYFDi9uD1hWhcIHQMuVYCyYjA0OahLboF7EyamLjwirXvXV3xsrIWCY8j2+8CKP0s9KI6OVx3UDeEWQQpx6guviWiJl4f+azA6uycEi5Z9yH2chh23D3YCW8zMqWlcwND5J241W23OLZwQhsRRtFfYSFU0o6keX6t8KAxcrfEgvvegw7MyRPkxkFXXOij/r7/cv69yYgVgN7dQ==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by VI2PR04MB10572.eurprd04.prod.outlook.com (2603:10a6:800:27c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Tue, 4 Nov
 2025 07:13:08 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9275.015; Tue, 4 Nov 2025
 07:13:08 +0000
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
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>, Conor
 Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v7 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Thread-Topic: [PATCH v7 1/5] media: dt-bindings: nxp,imx8mq-mipi-csi2: Add
 i.MX8ULP compatible string
Thread-Index: AQHcTVp4y4GrTcEr9EOKDfGuDB00Gg==
Date: Tue, 4 Nov 2025 07:13:07 +0000
Message-ID:
 <AS8PR04MB9080D81CEDE343E00D1E7A64FAC4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-1-5ecb081ce79b@nxp.com>
 <20251027000537.GM13023@pendragon.ideasonboard.com>
In-Reply-To: <20251027000537.GM13023@pendragon.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|VI2PR04MB10572:EE_
x-ms-office365-filtering-correlation-id: 5fb10425-a033-4d95-e8cb-08de1b719b0c
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|7416014|376014|19092799006|1800799024|366016|38070700021;
x-microsoft-antispam-message-info:
 =?utf-8?B?aklMbmNaUFQySmpLb29mc3pZanZsRko4NWx6aDNXaVd6RkRieVJDNFZUOFpz?=
 =?utf-8?B?OUxUSWxrNVJGT3Z5d3pBcVg1eERDczRlWUk4K2xybzl0UjJ3aWQwei91N1Jo?=
 =?utf-8?B?cGtKNUtYY3ZIcVh6ZEZIVndzbDlMd1pMUUZpN0VvQTByS1N3dzBjSnJ0b1Ro?=
 =?utf-8?B?UlJnd2hFak9SVVNvdkFoNEgxaERoblJ2TE9TTlJaSmhocStiSnQydHNyeHpH?=
 =?utf-8?B?bG1CaVBHREI1a1hGQzllV3BFdUNaSVl0VDE2aWx6T2NhQVZXKzhxNlkvRzBF?=
 =?utf-8?B?cm1menM5a1BHVThoZDhYUFRmcVhrRGljWkc2dzlBNlNUZ1J6UHRSL3AvMG5k?=
 =?utf-8?B?endkMCtHdHduVkJldFRLYWVSdnFyT3BvYVRIZEZyTVlmemZ1R0UySFIxN210?=
 =?utf-8?B?TmtESm1LNTJaNEkyUGZ4R3BXN09LNy9UVkc2V1Uvd2thUmhlNXNueldPNzJP?=
 =?utf-8?B?VlUwWXBUSElQQ0tZUXZoakNRK0dNdExWTmJ2dy9oalY1YzBtblBzcjdSbDEw?=
 =?utf-8?B?QXJIVXVKOG5EakN4b3VSbEltV3FaOEUzZFZ3ZUVlQ2VnTFZuazM4YlhIU2dI?=
 =?utf-8?B?MGZLWE11cmpveUgvSTlFbVRxVGk3RVhmb1czRFVyNENVcGZMWWs5NCtiWG84?=
 =?utf-8?B?Tm5tbjQyUURPMkhaanphWk9tQ0dNOCtiUmpFQklzTmV1WW0yclNzWXhXOTNT?=
 =?utf-8?B?MmxCTjdTdzRrOGIrVTlBTVdPaE1UQ0lnRFo1cmFSWnFhUnFnV285b2UrZHhZ?=
 =?utf-8?B?VHhHbVpycnp5YU9mSGNpOS9xVUlSK3YyUlBTK0JhUGNtUDJITEtMZUE3NlBD?=
 =?utf-8?B?QVM2b3pmeWxOZ29HZDc3MllYZ0Rqb3QveGIwL0ZnaENkTE0rQkYvYXk3VFNG?=
 =?utf-8?B?OEhUNEZlWlZGWG1FanZZUU03b0VhTXhLWnZxOCtXMC9jK2YrVFJvNkJZZXdU?=
 =?utf-8?B?V0x3cGRQTEw2eEVNS0tFTERLcDdqSzh2SWxNRTBnUTZDZWRPYUd3TTRCTEVO?=
 =?utf-8?B?cTBUZ0tsYS9rRUxHWXc1K3Y5bUdqRUN2dm5BYWdVRUxKTXYxUlFYbktua1NF?=
 =?utf-8?B?MGFlQS9BSmpmRE1ldzlNeWlJczhxYis0TGI0Yi9aZzNXL2RyU28vTFA5K0xx?=
 =?utf-8?B?K2xQekpHVTFObUtucU5GMWhjNUluUUxjNm16V2FZSHR0cWZVVHljbDFoTmdR?=
 =?utf-8?B?ZU9WQUxDcE1DOGJxQzBpMUgrcWN0TWJ3MTJWaCtmSWJWQk1CR29FaWlCT0V0?=
 =?utf-8?B?SEYvVkwzUWZkTVpRMTNac2FGODYyS3poTWtDaFhJTjNZdDVhZDVlWmE5SmhY?=
 =?utf-8?B?ckFIRWgyQUlnUEVXMUxJTUF2WEFpV1BMeHRhZTFDRkpMN3k4ck0yWm4wSmRF?=
 =?utf-8?B?VDNPVkR2c01lZ2JrZDdZS3RXcnVsZHREdk9WTDZDdktkY3FLQURHeEQrTHAx?=
 =?utf-8?B?cWF4dHAzaU9zM24ycWllK3NkenJ0bGpGZ0d5dmdrdExZZys2eUlPb3k5YzhQ?=
 =?utf-8?B?MjFDVWdzbTYxMktTaExSU2ZmdE1PVVpraW96OGxZT1F0WlJ3MlFYZkgxRkY3?=
 =?utf-8?B?YldNaXBKVG9vUHFYZlNHcjRmdDB1dU94Zkl5Q29RV01qQzdoRlg3L0xWc1pK?=
 =?utf-8?B?elU4Ti81Q204UlJjbThIQXJ5SUYyeGgwbXVWQS9YZzFKZXlzdDRyNU9Qd0R6?=
 =?utf-8?B?c3lVbUVKTmRSUVQ3S2ZUWXUxSmxJcTF4cWk2eVFqazJPQkkydHRRNVZ0cTI5?=
 =?utf-8?B?TE5XakgrTU05cE1XeXFlRTN5U0ZCR0ZHV1BqSTk5bER2TGUzbEFQc3dsY05u?=
 =?utf-8?B?R1ZtM3Ezd2o2WlBjUWhua29uZ0g4Z0FXcWZIYlhMK2J4S2VONDdmS25jc1FE?=
 =?utf-8?B?aUZ0Wm1QaHFKTVV5aDdydnppVElncGZLQVdrQkJobGVjYW9pa3pxQXpSVHRD?=
 =?utf-8?B?UGp5amZaOW1EL3ZKYjQ1TnVPakVucXRKcmdQNnd5cGpLVCttUjVITUcyekRx?=
 =?utf-8?B?SGJ6WW90SGtTNWdBSkdOM09oTjBvc0owRHMwWG41L2JIRmlsc3N6dzY4dEtR?=
 =?utf-8?Q?IebHo+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(19092799006)(1800799024)(366016)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?UFc5WHdsYUZQNTFBWld4VjBMR0RHZVRYeXE0UkFCQUE2eWt2cnNCNzI1aWV4?=
 =?utf-8?B?YmV4YjRLdHpNTUQ2SExuY3k5enE2ZTJxcVFEUnYvZGZhN1VyVncwYUcrMnIr?=
 =?utf-8?B?Z1hsNitGeHp6by8xNkJKU2c1R1lpdzlmUWFDVTQrdWNUTlYvUzJhd1VXU2tk?=
 =?utf-8?B?YUJRUkJjb1BPeldvenN5NTh3N3N3bU9rVzVmcWNyc2hLcG9LeDFtc2Fic1VC?=
 =?utf-8?B?R2VnNXJQKyt6UkowY2RKRWF0UkYwWjhvZ3h0aEZVeGNJNUNWMW5POWJCeHpn?=
 =?utf-8?B?MGZ1V1VZVDJ3YWhLZG5lMERzb0wvdGVEZnNaSE9qVG1QMURTb3MvRzk4bThX?=
 =?utf-8?B?OGJsNERqTXF3TWgrRmRLRVZZS2VvckQvb2dsMzIzNzllbzA2bHZOblRLNnFu?=
 =?utf-8?B?UTA2NWZhTjJ1bEtmSlZKSjVZbUVTejk2NysxbE1pV3BpUzhmazVUK2JFMTZZ?=
 =?utf-8?B?OWZ6TzVPQ2NGc1k0TWFuUkRFWnh6YTY5N21ScVRzd2JvVlhmTEhwREYwbkQy?=
 =?utf-8?B?aTcySmpyY2FUVWtoSjJDTHhBb0ZSRkZEMWlYejlyUmZiSFVReEV1d3JmR2Fz?=
 =?utf-8?B?TDNtcVlTdDhSeVpzaG1ITHhFYjZTQ3FwMHlxTWMyVmJJK1duYUloRjB3YTZN?=
 =?utf-8?B?UmlPZGxTTXE2NGNaUW42c0pBVUpGQVE1a2pTcTZNeXYzQ1NZWEtpbjgwdVRm?=
 =?utf-8?B?NllnZEdWaVJXcm5nUjVHSkwyOGM5cnZTSmsvSC9wWHlBWjBmRzQzajU0VlVx?=
 =?utf-8?B?M29nY2syTjIybS9BSnQrYUc3YktoQklXK2NjUWJxL0NzbEdsZGZjb3NnUUkx?=
 =?utf-8?B?MEZDZWVBd3FQeGVvZnUveWhIMXJDenJNckk2eUlMRDBlaWRaWTA2OFVmcHZz?=
 =?utf-8?B?UGZRWjJvc3BIdmhDZG9kbXF3NlVzdkJTT1BzVGZpby9VdmFLK0FQNDVaVjdw?=
 =?utf-8?B?Q21XakZIMlkrM01UU01qT1BURG5QVVh1YWV5bzJ2dHVHcENNNEpaVGQ5VTlS?=
 =?utf-8?B?RzUxK3ZlcW40MDBFdmp1Z2dWdytNQm5GZk1aOU1KSkc5ODBKR2xkaDRPRUlm?=
 =?utf-8?B?eG1qc2crZzNBSU5GTStKMDRyYnV1QjAvbVNjcmdDVkV6aDA0WitJRDFiVjVG?=
 =?utf-8?B?dlhRNnF3dFhuSUdoZmZIL0xaai9BT0QxTGNCOUtyWU14Z21iL2hqOXB4Q3Ru?=
 =?utf-8?B?N001Nyt2TkJiTFNUa3p2K2xhWllyVWpORERidmVVQjkvVkZlN2xYZjNZeWlw?=
 =?utf-8?B?NUd3V3lJR2VnRTVqeWtLM2pCS0FxS2NlcjEwbHBlUzNDalhQc2N5MnBJa0tQ?=
 =?utf-8?B?Q3hsRmRDOFRHeTdjOEVTVlBQcGhSclJycmo5RWg4NTVmQ0NnZjEyM21OODNa?=
 =?utf-8?B?ejMxUkdqS3FnY0VqaHRidUtkQVhQMWlxODlDZ21OdCt2YUFWQW5VM212cFlk?=
 =?utf-8?B?V25FUHBGZG5tWlJsSTlwckxZN1FFRnVqN0hieUdMTVV6VEpnajY1QS9XOHZu?=
 =?utf-8?B?UDhFTWdJblBPTVRIL21xSDg5MjNBUzloQzJVSHF1YUZWeVJtaEJjTXdzK0dE?=
 =?utf-8?B?c3BkZnd3ekQzVWlpOEVHckc0cEg2anBtNWdVZnVrTnN4TFJJclVwMUpHelRv?=
 =?utf-8?B?Si9uOU9MQVpCSUtQeGZ5aURvWTRZRXgrWWNqRURCRkVvdklpQU5mVUQ3NEQ5?=
 =?utf-8?B?MFN5dnRaVnNmeWZ0U3l5Q1pOdEV1U0hQTmdoVUN1YlpGMzNjbENxSVJvWGxs?=
 =?utf-8?B?S3NydTdwdEExaFQ5SEg3SGx4Y0JQN3FvbFJLOGowRDkxS21nWUt5NW9QRElS?=
 =?utf-8?B?bEQ3Z0ZQM0oxcHdJVG1wNkkyclVWU3VqZzNUSGJlTnFqRm1mS0lZSkdvdlNU?=
 =?utf-8?B?cCszWEVESnN3RzQrREErVTV4U1ZzanorVC9lYjNWLzZ5ZGl1cGJvNFVnNS8z?=
 =?utf-8?B?TjVKeVcxWVFQNFRFOHl6d2Q3M0RtaU5XT2ZzTmpRelRGb3FEaHNaMEhHWW5x?=
 =?utf-8?B?QWZDL2IwTDNQZTVhUXdmYnE4cktCaTFYYmRubEQrdlFqUndaZEErT1hUVTBR?=
 =?utf-8?B?bW9kcWpiaUxuMUJDazQvYnJTZEJGN3RsRFh1d01Jb2FSSkVzUElOWDgzZXNv?=
 =?utf-8?Q?+96br8g/Jo2kHo2yjYhqplkfs?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fb10425-a033-4d95-e8cb-08de1b719b0c
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Nov 2025 07:13:07.9322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RvuXIIrHRqatfUWn2S23mInOLQ36FueP4rRPBpKSWCmxJekzZnYLnpKPPE7Z29/dz+XSw/k3JIMPk93sxV9tfQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB10572

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgT2N0b2JlciAyNywgMjAyNSA4OjA2
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
Z3Vvbml1Lnpob3VAbnhwLmNvbT47IENvbm9yIERvb2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hp
cC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjcgMS81XSBtZWRpYTogZHQtYmluZGluZ3M6
IG54cCxpbXg4bXEtbWlwaS1jc2kyOiBBZGQNCj4gaS5NWDhVTFAgY29tcGF0aWJsZSBzdHJpbmcN
Cj4gDQo+IEhpIEd1b25pdSwNCj4gDQo+IE9uIFRodSwgT2N0IDIzLCAyMDI1IGF0IDA1OjE5OjQy
UE0gKzA4MDAsIEd1b25pdSBaaG91IHdyb3RlOg0KPiA+IEZyb206IEd1b25pdSBaaG91IDxndW9u
aXUuemhvdUBueHAuY29tPg0KPiA+DQo+ID4gVGhlIENTSS0yIHJlY2VpdmVyIGluIHRoZSBpLk1Y
OFVMUCBpcyBhbG1vc3QgaWRlbnRpY2FsIHRvIHRoZSB2ZXJzaW9uDQo+ID4gcHJlc2VudCBpbiB0
aGUgaS5NWDhRWFAvUU0sIGJ1dCBpLk1YOFVMUCBDU0ktMiBjb250cm9sbGVyIG5lZWRzIHBjbGsN
Cj4gPiBjbG9jayBhcyB0aGUgaW5wdXQgY2xvY2sgZm9yIGl0cyBBUEIgaW50ZXJmYWNlIG9mIENv
bnRyb2wgYW5kIFN0YXR1cw0KPiA+IHJlZ2lzdGVyKENTUikuIFNvIGFkZCBjb21wYXRpYmxlIHN0
cmluZyBmc2wsaW14OHVscC1taXBpLWNzaTIgYW5kDQo+ID4gaW5jcmVhc2UgbWF4SXRlbXMgb2Yg
Q2xvY2tzIChjbG9jay1uYW1lcykgdG8gNCBmcm9tIDMuICBBbmQga2VlcCB0aGUNCj4gPiBzYW1l
IHJlc3RyaWN0aW9uIGZvciBleGlzdGluZyBjb21wYXRpYmxlLg0KPiA+DQo+ID4gUmV2aWV3ZWQt
Ynk6IEZyYW5rIExpIDxGcmFuay5MaUBueHAuY29tPg0KPiA+IEFja2VkLWJ5OiBDb25vciBEb29s
ZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b25p
dSBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+IC0tLQ0KPiA+ICAuLi4vYmluZGluZ3Mv
bWVkaWEvbnhwLGlteDhtcS1taXBpLWNzaTIueWFtbCAgICAgICB8IDQxDQo+ICsrKysrKysrKysr
KysrKysrKysrLS0NCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDM5IGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0DQo+ID4gYS9Eb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGlteDhtcS1taXBpLWNzaTIueWFtbA0KPiA+IGIvRG9j
dW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL254cCxpbXg4bXEtbWlwaS1jc2ky
LnlhbWwNCj4gPiBpbmRleA0KPiA+DQo+IDMzODliYWIyNjZhOWFkYmRhMzEzYzhhZDc5NWI5OTg2
NDFkZjEyZjMuLmRhMzk3OGRhMWNhYjc1MjkyYWRhM2YyDQo+IDQ4Mzc0DQo+ID4gNDNmN2Y0YWI2
NDE4IDEwMDY0NA0KPiA+IC0tLQ0KPiA+IGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL21lZGlhL254cCxpbXg4bXEtbWlwaS1jc2kyLnlhbWwNCj4gPiArKysgYi9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbnhwLGlteDhtcS1taXBpLQ0KPiBjc2kyLnlh
bQ0KPiA+ICsrKyBsDQo+ID4gQEAgLTIwLDYgKzIwLDcgQEAgcHJvcGVydGllczoNCj4gPiAgICAg
ICAgLSBlbnVtOg0KPiA+ICAgICAgICAgICAgLSBmc2wsaW14OG1xLW1pcGktY3NpMg0KPiA+ICAg
ICAgICAgICAgLSBmc2wsaW14OHF4cC1taXBpLWNzaTINCj4gPiArICAgICAgICAgIC0gZnNsLGlt
eDh1bHAtbWlwaS1jc2kyDQo+ID4gICAgICAgIC0gaXRlbXM6DQo+ID4gICAgICAgICAgICAtIGNv
bnN0OiBmc2wsaW14OHFtLW1pcGktY3NpMg0KPiA+ICAgICAgICAgICAgLSBjb25zdDogZnNsLGlt
eDhxeHAtbWlwaS1jc2kyIEBAIC0zOSwxMiArNDAsMTYgQEANCj4gPiBwcm9wZXJ0aWVzOg0KPiA+
ICAgICAgICAgICAgICAgICAgICAgICBjbG9jayB0aGF0IHRoZSBSWCBEUEhZIHJlY2VpdmVzLg0K
PiA+ICAgICAgICAtIGRlc2NyaXB0aW9uOiB1aSBpcyB0aGUgcGl4ZWwgY2xvY2sgKHBoeV9yZWYg
dXAgdG8gMzMzTWh6KS4NCj4gPiAgICAgICAgICAgICAgICAgICAgICAgU2VlIHRoZSByZWZlcmVu
Y2UgbWFudWFsIGZvciBkZXRhaWxzLg0KPiA+ICsgICAgICAtIGRlc2NyaXB0aW9uOiBwY2xrIGlz
IGNsb2NrIGZvciBjc3IgQVBCIGludGVyZmFjZS4NCj4gPiArICAgIG1pbkl0ZW1zOiAzDQo+ID4N
Cj4gPiAgICBjbG9jay1uYW1lczoNCj4gPiAgICAgIGl0ZW1zOg0KPiA+ICAgICAgICAtIGNvbnN0
OiBjb3JlDQo+ID4gICAgICAgIC0gY29uc3Q6IGVzYw0KPiA+ICAgICAgICAtIGNvbnN0OiB1aQ0K
PiA+ICsgICAgICAtIGNvbnN0OiBwY2xrDQo+ID4gKyAgICBtaW5JdGVtczogMw0KPiA+DQo+ID4g
ICAgcG93ZXItZG9tYWluczoNCj4gPiAgICAgIG1heEl0ZW1zOiAxDQo+ID4gQEAgLTEzMCwxOSAr
MTM1LDUxIEBAIGFsbE9mOg0KPiA+ICAgICAgICAgIGNvbXBhdGlibGU6DQo+ID4gICAgICAgICAg
ICBjb250YWluczoNCj4gPiAgICAgICAgICAgICAgZW51bToNCj4gPiAtICAgICAgICAgICAgICAt
IGZzbCxpbXg4cXhwLW1pcGktY3NpMg0KPiA+ICsgICAgICAgICAgICAgIC0gZnNsLGlteDh1bHAt
bWlwaS1jc2kyDQo+ID4gKyAgICB0aGVuOg0KPiA+ICsgICAgICBwcm9wZXJ0aWVzOg0KPiA+ICsg
ICAgICAgIHJlZzoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+ID4gKyAgICAgICAgcmVz
ZXRzOg0KPiA+ICsgICAgICAgICAgbWluSXRlbXM6IDINCj4gPiArICAgICAgICAgIG1heEl0ZW1z
OiAyDQo+ID4gKyAgICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAgICAgbWluSXRlbXM6IDQNCj4g
PiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAgICAgICAgIG1pbkl0ZW1zOiA0DQo+IA0K
PiBEbyB3ZSBuZWVkIHRoZSBjbG9jay1uYW1lcyBjb25zdHJhaW50ID8gVGhlIERUIHNjaGVtYXMg
d2lsbCBlbmZvcmNlIHRoYXQNCj4gY2xvY2tzIGFuZCBjbG9jay1uYW1lcyBhbHdheXMgaGF2ZSB0
aGUgc2FtZSBudW1iZXIgb2YgZWxlbWVudHMuDQoNClllcywgSSBwcmVmZXIgdG8gaGF2ZSBpdCBz
aW5jZSBleHBsaWNpdCBjb25zdHJhaW50IGNvdWxkIG1ha2Ugb3VyIHlhbWwgZmlsZSBtb3JlIGNs
ZWFyIHRvIHNob3cNCm91ciBkZXNpZ24gcHVycG9zZS4gSW4gYWRkaXRpb24sIGl0IGNhbiBhbHNv
IGhlbHAgcGVvcGxlIHdobyBhcmUgbm90IGZhbWlsaWFyIHdpdGggdGhlIGltcGxpY2l0DQpjb25z
dHJhaW50IGluIERUIHNjaGVtYSBhdm9pZCBtYWtpbmcgbWlzdGFrZXMuDQoNCj4gDQo+ID4gKw0K
PiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29tcGF0
aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBjb25zdDog
ZnNsLGlteDhxeHAtbWlwaS1jc2kyDQo+ID4gICAgICB0aGVuOg0KPiA+ICAgICAgICBwcm9wZXJ0
aWVzOg0KPiA+ICAgICAgICAgIHJlZzoNCj4gPiAgICAgICAgICAgIG1pbkl0ZW1zOiAyDQo+ID4g
ICAgICAgICAgcmVzZXRzOg0KPiA+ICAgICAgICAgICAgbWF4SXRlbXM6IDENCj4gPiAtICAgIGVs
c2U6DQo+ID4gKyAgICAgICAgY2xvY2tzOg0KPiA+ICsgICAgICAgICAgbWF4SXRlbXM6IDMNCj4g
PiArICAgICAgICBjbG9jay1uYW1lczoNCj4gPiArICAgICAgICAgIG1heEl0ZW1zOiAzDQo+ID4g
Kw0KPiA+ICsgIC0gaWY6DQo+ID4gKyAgICAgIHByb3BlcnRpZXM6DQo+ID4gKyAgICAgICAgY29t
cGF0aWJsZToNCj4gPiArICAgICAgICAgIGNvbnRhaW5zOg0KPiA+ICsgICAgICAgICAgICBlbnVt
Og0KPiA+ICsgICAgICAgICAgICAgIC0gZnNsLGlteDhtcS1taXBpLWNzaTINCj4gPiArICAgIHRo
ZW46DQo+ID4gICAgICAgIHByb3BlcnRpZXM6DQo+ID4gICAgICAgICAgcmVnOg0KPiA+ICAgICAg
ICAgICAgbWF4SXRlbXM6IDENCj4gPiAgICAgICAgICByZXNldHM6DQo+ID4gICAgICAgICAgICBt
aW5JdGVtczogMw0KPiA+ICsgICAgICAgIGNsb2NrczoNCj4gPiArICAgICAgICAgIG1heEl0ZW1z
OiAzDQo+ID4gKyAgICAgICAgY2xvY2stbmFtZXM6DQo+ID4gKyAgICAgICAgICBtYXhJdGVtczog
Mw0KPiA+ICAgICAgICByZXF1aXJlZDoNCj4gPiAgICAgICAgICAtIGZzbCxtaXBpLXBoeS1ncHIN
Cj4gPg0KPiANCj4gQ291bGQgeW91IHBsZWFzZSBzb3J0IHRob3NlIGNvbmRpdGlvbmFsIGJsb2Nr
cyBieSBhbHBoYWJldGljYWwgb3JkZXIgb2YgdGhlDQo+IGNvbXBhdGlibGUgc3RyaW5ncyA/DQoN
ClN1cmUNCg0KPiANCj4gLS0NCj4gUmVnYXJkcywNCj4gDQo+IExhdXJlbnQgUGluY2hhcnQNCg==

