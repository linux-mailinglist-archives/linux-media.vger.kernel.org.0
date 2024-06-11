Return-Path: <linux-media+bounces-12908-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE481902DD7
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 03:04:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6E4E91F23C4E
	for <lists+linux-media@lfdr.de>; Tue, 11 Jun 2024 01:04:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F14AA6FCC;
	Tue, 11 Jun 2024 01:04:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="Av3wtQsA"
X-Original-To: linux-media@vger.kernel.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on2081.outbound.protection.outlook.com [40.107.7.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2798ABA4B;
	Tue, 11 Jun 2024 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.7.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718067864; cv=fail; b=ZQCmY60fc/JEF2AJ87EYkhSMVrHFxwkKMIq40kA2pjeMaDut8kaPaf7B2AiaKeEIrGGsnW2DMhkkz1Dt2fPC+A1a78ArhmA0PX5ggySgk9/4PqsbYxljIbm7DlL1ogktvGyXgLgSLBYI3C9jOMDMXFM1XWjvPUxhx/YEuO1ZGdI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718067864; c=relaxed/simple;
	bh=sgmwGkc54QbuJ1TzvLFhAta5EPzAhIHNmfWEPRU7qqI=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ihZR6ABsCnkFevT7RkMjNPBVo7VZGa8GPPPe3hAtxCtC6SoziDq8Pmr8OGAhD+mds3w2YSyL2Z4ECQHHT8rF5L9JYVkXRFE+AmvF+sSXNjK+8TcKmsXyCs0TLiaCwnUInBLiU0jmoYf8FkrEvluAjalAenG91NOxcqFwwiwNEwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b=Av3wtQsA; arc=fail smtp.client-ip=40.107.7.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q/mP1VG81q0l7L0Qa8sf7WiPlCPFmNCyxQll0o9S5Qy5YUu0uSFMcYRrtnz7QTgcsmUTkujrzEqWysi6T9ylIY/7WUXMSNNBKgW8MeXWcbv7NBj0eKnoanj3sqX+ojvj67UsPToTg9N6bZ6YBzz8xQVlzLnblxREEvYpdQV0R8Iu1g4k+aSUOfO/WX6CAr430EePb5fATBJUphOiWCfNnXMdEwCTPIzrWDlaj3rKhM03g9wtbMxa+J6G6PbGYMPRJVWtMMomShjVqHLkbXjqa3vCPd1kUi3VBsLrP/SH0BrnO63c5km3h3qLk1s82phV+Qg5zU84D8h++p9Tb9AeiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgmwGkc54QbuJ1TzvLFhAta5EPzAhIHNmfWEPRU7qqI=;
 b=l94nRD1ftIJTkfvYciQQCxnkulfozOG72fWdicv8jetgGxXGlFVLF585nggId+/fHL8p6lMsBNhEbcFLEqHNun8jCIv7tA4fQG6dlBfAOiUPbMfYLF70smIvTqtUw8tW8W2GLjUKqONWQNYtPLDeCRSXfTv2slh+C5cOkY23ppTQOPdwWra/YKm/uRpEloOF3tgJHry/K2CpeCcarKH7f1lo3VF3ZEfQrjIiVYabuhfbG1mRVqA5aUPOfJIweI/hLr7Sd+wffTV2OSRHV1AH1yalMdTp5Id1/B2Z+eDmMXIU2m1bayByo89E+G5fgB37K5dPcXVAdHkldE7HmNQXIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgmwGkc54QbuJ1TzvLFhAta5EPzAhIHNmfWEPRU7qqI=;
 b=Av3wtQsAm71HwdSFvULnj14REJZp0vFf0+awy2fBESkP3aBID0pf6ardRZkMdk813jt5WfFB4GKWVkrm/ekgl/J7TQ9j6RUPyeqFkxYLxDo+NHRj4B47hBMZYFpJUD8RGcKrRYLw3qxm0CFQbwLJ5jG5WO3sA+d5CtlWJ/zREew=
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com (2603:10a6:20b:9e::16)
 by VI1PR04MB6816.eurprd04.prod.outlook.com (2603:10a6:803:12d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.33; Tue, 11 Jun
 2024 01:04:19 +0000
Received: from AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256]) by AM6PR04MB5941.eurprd04.prod.outlook.com
 ([fe80::9f4e:b695:f5f0:5256%5]) with mapi id 15.20.7633.036; Tue, 11 Jun 2024
 01:04:19 +0000
From: Peng Fan <peng.fan@nxp.com>
To: Adam Ford <aford173@gmail.com>, Alexander Stein
	<alexander.stein@ew.tq-group.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, Paul Elder
	<paul.elder@ideasonboard.com>, Conor Dooley <conor+dt@kernel.org>, Fabio
 Estevam <festevam@gmail.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Marek Vasut <marex@denx.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha
 Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Thread-Topic: [PATCH v2] arm64: dts: imx8mp: Add DT nodes for the two ISPs
Thread-Index: AQHauqqq7GSURcCnVkyyXCflECJukLHBwK3Q
Date: Tue, 11 Jun 2024 01:04:19 +0000
Message-ID:
 <AM6PR04MB59412D143AA8C20AFB479E8F88C72@AM6PR04MB5941.eurprd04.prod.outlook.com>
References: <20240325151339.19041-1-laurent.pinchart@ideasonboard.com>
 <4879631.GXAFRqVoOG@steina-w>
 <20240325204924.GY18799@pendragon.ideasonboard.com>
 <2929432.e9J7NaK4W3@steina-w>
 <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
In-Reply-To:
 <CAHCN7xLFjJUZQZwPbj5xyxnprwAV3TOvd_6A6sBwOPK+V6uQPA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AM6PR04MB5941:EE_|VI1PR04MB6816:EE_
x-ms-office365-filtering-correlation-id: c666fb7b-4b15-4153-7400-08dc89b26c21
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|376005|7416005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info:
 =?utf-8?B?VmRHcmRTOTd1aUlHV1ZGUVlNQ3hNVEFQWHZWWXdZNWZQSmdvb2ZpOFNRSnJ2?=
 =?utf-8?B?M2FVcVlHYnA1eDcxdjI3OE12TGJLc0JhUW91dUl4cWVGUlJHamM4aVZGU20y?=
 =?utf-8?B?cDZob1RwN2JBMStQcWRYbzE4aVord0prUjVNbXFlaS9Ba0FBckg1VGk4ZFpR?=
 =?utf-8?B?cWxaUU14Um9FUThqYzBXTENNUDJCVnN5TURqaVhCNVk5czNYQXhCNXpKZzhH?=
 =?utf-8?B?bWtUNWlnNFJ0MXZralc0MUg0TTJDK2NxajFmOWd1NDZUUTk4LzBkaDM3YVNY?=
 =?utf-8?B?U0RHQlovVUtaQ3U0OUo4WllqVWFTVmZwcXE4c2kxNFlVdGtVc0hrU0VacGtD?=
 =?utf-8?B?TXpyamtsdk92N3pKcVpIakdTMHRXQ3EwVEhDcUFMclhpbDFOZ2FpUmVkRHY3?=
 =?utf-8?B?bzJOcWM4dE1ZMlpPeHZFQWlKNlFCanlPbVBpZ2p6cFI1TWllMlVTUEVLMDBF?=
 =?utf-8?B?NkpZbkhpcEpMRjRBTWtrUmdlZytKQ0c5T1J3RGhQalRVdTNUVkV4d3pQeGtR?=
 =?utf-8?B?SG9WU0pmbWFzRGZDNGhWYlAzRzVWV2h1S0JHQnUybUl5NzY0VVhXSkRSMUhi?=
 =?utf-8?B?ajFyVTdiSitXYmFyYXdUWVF0aTRWWWN3di9SdTFJbmhrbjI1cklnVWVmL1FY?=
 =?utf-8?B?NG5ma1kzNHQrTmZVSjArb0xQdXJMbU5tZ1RqWlJEWUYwVDl2YVZqbzJnK3Rx?=
 =?utf-8?B?NmdEcVdxZmNLNWUrQlEzdU4xbjRkVFpxSmlHbzcwNGExUldXU0VwZExwemxY?=
 =?utf-8?B?b1FtVDVKUWk5ZERKTkJnOTlRdG05c2UycXd0Nnl0Y29Vb0ZBU1FQa3NEdHRz?=
 =?utf-8?B?Y0ExeXJiMUNjK0Q0blpYRllrait6Y011dXZLZGlhZ0tveldRNWRQMzJ2bmFF?=
 =?utf-8?B?bE04UW92QzdVRTJEMFY1QU93RWErQzFNaUJwdXZFTm5jdEJSWUZ4ZGtsK2pi?=
 =?utf-8?B?WHoyV2t4TU41czhPQ083OWp2STVtbll3NjJSdHZzTnJWKzdjbGZDOW1qSUFL?=
 =?utf-8?B?VjltSGpkRmxOWC9teG5ZQjJGaEc4WElNaFpGdVJRYzVJWmsvbEFPUVZKclVj?=
 =?utf-8?B?SGltN2t1M0hTM2ttMFdxQy8xYmgrallzdUNwR3g5dmNuSmU2V2FseTI2RXRM?=
 =?utf-8?B?RHVXb2I4a1NiVHZraTcyQkhZbW1BbFVHM01GUG9qYmkwS3BTaDlZc05Mbm5n?=
 =?utf-8?B?aFUrODl5MmxUQ2J6U0NVVisvdjg2UGk5aFhmZVU1UkdqSmdvcE02cUFCN2tO?=
 =?utf-8?B?dEJyWEZjd2ZFc1k3dmJEM3ZLelVvdWNscGFRdFhvbjBnQThtb0pHSkdUTmFz?=
 =?utf-8?B?Qjl5eDBVUzdTNG5YcTY4T0pRTWpTT2UzM1lnMnVGQXdrdTdrSGdIUDlxcTYr?=
 =?utf-8?B?a3ZqZ1FiRlV0alZ4RDIvdFlRNEVhTDdER3NnSWhYS3NScG1TNWFGSHlsL050?=
 =?utf-8?B?TmRjMWFmWWdBUytHZlQ1MlRBS3hMNEpNK3BtSnVacFFrWEJFWjFDRm43M2dS?=
 =?utf-8?B?V3V5NlIrWTErODl3c25idEtVaU9kK3VJYnpOVkZjK1luUFpzcGJhTFZQSlEy?=
 =?utf-8?B?aTdqOWFDNlZCam0zU0JkY1lxY3B2Qk4ybWoyZVN1RERERWlXTGRVUzJkOUhn?=
 =?utf-8?B?TTQrcGtRMWpubnc2V21SaGJlN3E0NDVNekovdDlkS1NTME5ERm50Y0JzQnJ1?=
 =?utf-8?B?dUhneUJUOVpGTW5Cd1V0cVhaWGZEUlU3ZE9FR0VjMDJuWjFWaC9LcmEzUkxa?=
 =?utf-8?B?SEM4L2lOc2FBMWdkTTJZNUZNVVlXdzd1WFNYOXhCenFVeUdLU2swbzVRWTBt?=
 =?utf-8?Q?sorJMQe9RRA/nct7yVGIf2hbAQ+oiaCSbTRlg=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB5941.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(7416005)(1800799015)(366007)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?SHVtYXhBSDhoZHlCNWdNejAyY3dBNHI2SERwYjZwbHpkaDlON3N1dVNlK2dj?=
 =?utf-8?B?c1dXMWJ1VjVMYlFwSllTV0JZQUZJTDJwZEZVaUFMSlI3bkVqUDFWK0N2d3lU?=
 =?utf-8?B?MGx6dm85TC84bEl4QUl1SERqMzhFKy9hOU03dFRDL1JmTXJsMXBOTllPZ1M5?=
 =?utf-8?B?ODRtZUg3TmliQ2xwUjNPQzRlSXZZYWd4ZzE0VnZocHNpMUlpWEdVeUlLUnZH?=
 =?utf-8?B?aWh6OUxCOUNsTzJoRDJ6OVI3NWtKMWM5SjFidlZ3YWoxL1hRWm1ueEdYYnNV?=
 =?utf-8?B?YjFjdFozQW1EQU1Uc3pyL3NRcGlmQTZPQmRkU05Bb0JDUit3dWdiTCs5VmZU?=
 =?utf-8?B?bk9rczJrOVdmSDVpbXRiUmpJQjVMblNsZmxmcUZ6WDl3dSs3U0FnUE1HQ1V1?=
 =?utf-8?B?djFmZVorMWZXb1JEa2VZVTlGRVZYQmJQQ3E2Q0NTQ2FGbVJNNFJ5aFdhYndx?=
 =?utf-8?B?YlVKcDJ3TFZNMUNSck1GMFYxbHZmNmZKUWJORWY0SUNUZU1lMDlEZVFpTHAx?=
 =?utf-8?B?UlNTeFd4NFhMMXo3Vmd4ekxyOGdPZGZ2TURnQ2w4L2VvUDNwSXFYZHFWbHky?=
 =?utf-8?B?V29rOTV1eW5qQ2V4Mmx3TWxpZk03U1A1bXlwak54b1dtdm5YRXFmcVFQTzFV?=
 =?utf-8?B?d2dpRlEzekkyaXNna1FuanduNVNUN21SdDZpSkJjZWxwR1RocUpkT05Fa0Rs?=
 =?utf-8?B?dW4ySjhCSUs0MWl6bG0vTGJtQmJ5eENlWmpOMTU4RzhaMXVVclczVCsyOEpW?=
 =?utf-8?B?Rm9WY0JBUkhLaWx5YjA2bDVCdk5lSE5XQ045S3Y1bnlLRWFpSHlLRHhSV2ZX?=
 =?utf-8?B?VkwxNE0raGZKSFZyaGRnbFhJUXcxYTZTRmNERWovMWpHR3AycUZTQzlhRGlX?=
 =?utf-8?B?S0tTVnZHbFMyajc4WlFoUjQxVHRlTllHT1lTeG1TcUd5b09Bc2JOOE1DQU9C?=
 =?utf-8?B?MDkxdzc4RHFpYTBySzhOWXRweFozaElrcm9kK0FOUkMxdDZ4dFVMSUxDWitS?=
 =?utf-8?B?MktKa1F6RW1KYnhyYmQ5Nk9zZ3RJMDB3UC9yVEhxaHJaZk5rOFpaMjV5Kyt6?=
 =?utf-8?B?VG9qS1FNZm1VNmx4cDM5ZzgzWHVVY1V2R3RmTjJsSEVFYnBHaHdheHdGWjNH?=
 =?utf-8?B?ZjAvVUhDei9pTmUxSUhUNEJYRk80a0RBVlNoeWxlTitiNHlXbDhlMDdxUXNK?=
 =?utf-8?B?NlcwcDcvWFlEd09WaVB0MkdiaDM0YWJEZEZnbi9zaDNaREtYU04ra0E0Qk4r?=
 =?utf-8?B?V1hKWkVzeXY3eWZNdnNnSHpWT1BITXV2NkJRVXJHN3hncG9BMTA4YkM3Q3BO?=
 =?utf-8?B?RUtiRDJiMFhkZk5jaGhKWWk4ZkJnUG9XWVRWZ3IvSmY3WU05c21uMXEvQS9Q?=
 =?utf-8?B?NTI5QitFdUM5dzI3dnIwNG0xeFlaRlJ2RTZBR29xQXZrdXFkdTJwTXR3ZFQ3?=
 =?utf-8?B?bys0U1M5RWh1MTBaZHdaY0hEbUg3Yi9iaDN5a25CbTlvSVYrRXNEV1ltRm1G?=
 =?utf-8?B?ZEpqdkZQNzJtOUNtMVVyYmRMOGJpaGRudG5YNFBIUmFVRWJubEZWWm83Zytu?=
 =?utf-8?B?ejd3MXpvY2xBZVNEME90dURzVmFSYk16OUkwYXlYdWpLbTBhaUZHaHZ4ekps?=
 =?utf-8?B?cU5RY1BLOTgrdy9QaXB6SEs1YS9LMjdybFlNVzhONTA4WDFmVkhwaUNzZFYy?=
 =?utf-8?B?RHRQdWdid2JWSHlXYVpudU8yRTRocE5wNUw4cHBseitUbml1S0ZFOVJnd1hx?=
 =?utf-8?B?b2twMFhLS0ZCSUtiTFdQRzNzc1Z1ZlJpeDNjZTM5bDlYdnR6eU9KZFBSenJp?=
 =?utf-8?B?Nk9RYURJMURLRTV1dmwzS21rNitYdjJScXExL21uZXlUaEh1MWRjSmc3azRF?=
 =?utf-8?B?QjczWXRmK2NCUkJyUnRRYms2THVnSDZQTndTV1NKOElBUmQ1ajl5SDZNOHd3?=
 =?utf-8?B?cEVneVZTdzQyYWdOODRHSXBNNDNkblRHelQ1MUtDejNRbTV3R29HdEhiUTZ0?=
 =?utf-8?B?MDlLY041L2pKb2Jwb1N5T0tpaFhqanRnT21xby9KbVBYa2RpMndSV3JOaWRx?=
 =?utf-8?B?ZnhTRU5oQmZoWWd4bkNtVHlRem5EREZGUmZ5QndLSWluM0ZTQmlJTDRzdVlF?=
 =?utf-8?Q?9+S0=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB5941.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c666fb7b-4b15-4153-7400-08dc89b26c21
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jun 2024 01:04:19.0450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: i3y2Cg1I49cJWQcCyn2Hod4aMaDDFtcgTyK3b/ObWQkBrMmTyT+HjRtf4vX/Gm56drViFGU282AMsk3n/LrIRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB6816

PiBTdWJqZWN0OiBSZTogW1BBVENIIHYyXSBhcm02NDogZHRzOiBpbXg4bXA6IEFkZCBEVCBub2Rl
cyBmb3IgdGhlIHR3byBJU1BzDQo+ID4gPg0KPiA+ID4gPiBTb21ldGhpbmcgbGlrZQ0KPiA+ID4g
PiAtLS04PC0tLQ0KPiA+ID4gPiAtLS0gYS9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4bXAuZHRzaQ0KPiA+ID4gPiArKysgYi9hcmNoL2FybTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9p
bXg4bXAuZHRzaQ0KPiA+ID4gPiBAQCAtMTgzNywxMSArMTgzNywxMyBAQCBtZWRpYV9ibGtfY3Ry
bDogYmxrLWN0cmxAMzJlYzAwMDAgew0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xrIElNWDhNUF9DTEtfTUVESUFfQVBCPiwNCj4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8
JmNsayBJTVg4TVBfQ0xLX01FRElBX0RJU1AxX1BJWD4sDQo+ID4gPiA+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGsNCj4gPiA+ID4gSU1YOE1Q
X0NMS19NRURJQV9ESVNQMl9QSVg+LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIDwmY2xrDQo+ID4gPiA+ICsgSU1YOE1QX0NMS19NRURJ
QV9JU1A+LA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIDwmY2xrIElNWDhNUF9WSURFT19QTEwxPjsNCj4gPiA+ID4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9jay1wYXJlbnRzID0gPCZjbGsNCj4gSU1Y
OE1QX1NZU19QTEwyXzEwMDBNPiwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgPCZjbGsgSU1YOE1QX1NZU19QTEwxXzgwME0+
LA0KPiA+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICA8JmNsayBJTVg4TVBfVklERU9fUExMMV9PVVQ+LA0KPiA+ID4gPiAtICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsayBJ
TVg4TVBfVklERU9fUExMMV9PVVQ+Ow0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA8JmNsayBJTVg4TVBfVklERU9fUExMMV9P
VVQ+LA0KPiA+ID4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICA8JmNsaw0KPiA+ID4gPiArIElNWDhNUF9TWVNfUExMMl81MDBNPjsNCj4g
PiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBhc3NpZ25lZC1jbG9jay1yYXRl
cyA9IDw1MDAwMDAwMDA+LCA8MjAwMDAwMDAwPiwNCj4gPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIDwwPiwgPDA+LA0KPiA+ID4gPiA8
MTAzOTUwMDAwMD47DQo+ID4gPg0KPiANCj4gQWNjb3JkaW5nIHRvIHRoZSBpLk1YOE1QIERhdGEg
c2hlZXQsIHRoZSBub21pbmFsIHNwZWVkIGZvcg0KPiBNRURJQV9JU1BfQ0xPQ0xfUk9PVCBpcyA0
MDBNSFogd2l0aCA1MDBNSHogYmVpbmcgYWxsb3dlZCBpbg0KPiBvdmVyZHJpdmUgbW9kZS4NCj4g
DQo+IEkgdGhpbmsgdGhpcyBjbG9jayByYXRlIHNob3VsZCBkcm9wIHRvICB0aGUgbm9taW5hbCB2
YWx1ZSBvZiA0MDBNSHogYW5kIHRob3NlDQo+IGJvYXJkcyB3aG8gc3VwcG9ydCBvdmVyZHJpdmUg
Y2FuIGluY3JlYXNlIGl0IHRvIDUwME1IeiB0byBhdm9pZCBzdGlhYmlsaXR5DQo+IGlzc3VlcyBh
bmQvb3IgcnVubmluZyBvdXQgb2Ygc3BlYy4gIEkgY3JlYXRlZCBhbiBpbXg4bW0gYW5kIGlteDht
bi0NCj4gb3ZlcmRyaXZlLmR0c2kgZmlsZS4gIElmIHRoZXJlIGlzIGludGVyZXN0LCBJIGNhbiBk
byB0aGUgc2FtZSBmb3IgdGhlIDhNUCBhcyB3ZWxsLg0KPiANCj4gSSBoYXZlbid0IGdvbmUgdGhy
b3VnaCBhbGwgdGhlIGNsb2NrcyB0byBkZXRlcm1pbmUgaWYvd2hhdCBjbG9ja3MgYXJlIGJlaW5n
DQo+IG92ZXJkcml2ZW4uDQoNClNob3VsZG4ndCB0aGUgYm9vdGxvYWRlciB0YWtlIHRoZSB3b3Jr
IHRvIHJ1bnRpbWUgdXBkYXRlIHRoZSBmcmVxPw0KV2h5IG5lZWQgaW50cm9kdWNlIGFuIGV4dHJh
IG92ZXJkcml2ZS5kdHNpPw0KDQpUaGFua3MsDQpQZW5nLg0K

