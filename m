Return-Path: <linux-media+bounces-39545-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D00EB22204
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 10:55:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEA877219C0
	for <lists+linux-media@lfdr.de>; Tue, 12 Aug 2025 08:44:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA71B2DCF7C;
	Tue, 12 Aug 2025 08:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Zm+wO1ol"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011008.outbound.protection.outlook.com [40.107.130.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 124DF243968;
	Tue, 12 Aug 2025 08:44:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754988270; cv=fail; b=f1hp2Ms3H2+c0n/lJyPEy2/j5OnCCqe4DSmTWy2eZeygLfhY+mpcvbFP/gsQYPlCBKZ1mnJqjvYIWuxjaOFZspC8XSv2zZWaegL2H6O9fgxoUUgOmPAv1rZv5JP+23e1h1CqkO9fBpmDMsZi32qV836iFkzsG1G4pBu1bxw8npE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754988270; c=relaxed/simple;
	bh=MKFbWs2kjqsxrn81NWsC3o/INw7ursxD4i8/ZoJ4hNY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t/V7ss6KPaaHWfUiDabGMWJN+G+MaKLz89WYjcpvt5pEDiKyZj7u1UoCTbW3CaKgYg7WuZMpXsQ8X6X7Vc/9kDEaPSvYUtdXUN2rYYFhOFjdmSwQrFGjZm/BiX1ADZbCeveP9IyJMKlaGXSblgoHQbq8+aH4cWr79mriWh07cW8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=Zm+wO1ol; arc=fail smtp.client-ip=40.107.130.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uvCW5C3iCOGbd/Q8olqkQa44ZdRSrNFgJmX6E2tJNV5hq3Ew8H4ZMafnG/NEXxEgXcrOtzkxcjI2HxnXMGqDEKlwHWQbvRm2NTHIKZkGx/KApQ9HGGR809mXdGCrmTfj9nBQC9KD6CthRL1wxKTg3kUkUTF2N7xYXkzvnsgnXZd1IXteRF7ffxflcmtEwgOl3edBlmXQT39L9OkYsHi69mT++mnjqjBLaXriZ48qXgCNDdKkyF/fuGY5pgkTsYtjTvJg7O6KOTIWXdXaeoXI3f/Z8NFe7fPOaTVK3oON6424Uy2JXX26/bgJaWTa7pZyq+UbwqtafrciHRVxVNvj3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BgntejMXkGfNWGR0fvdwL10031c8H3yGFaP1A//X7ew=;
 b=qTJee5SByHHvtNCFS7YMp64XqVmcCZpet3Amujkt6xxAbP9quklfidr+ARP3ybx/qpnwKX+tMEx9sWXR1YfP2GtkhcqpWX9XLY0WTwZ4aJkoduZt11p1rI4occGKSjPoiToSqkBwWDSJAR9v0yFq9t7UNHiTachD27UTeDK3lFFFt+iazSW7KQ6GgqYDlKQDTsg8vIx10UhE1WxRBSPVseS/u1jHzUjTLSymf7SAb4CIUMJgVICS+/4Iq0y1w6EMpesPyAWhRueYALwSYyY3c4LbMPA04B4jpORAIO4giAWMqm+zy+StjHKF8ZopccxOwBi2Vqe94NRCwM5htE3fTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BgntejMXkGfNWGR0fvdwL10031c8H3yGFaP1A//X7ew=;
 b=Zm+wO1olfgdm15Z7FdpItCCXaz24ROVpNdqNw635OBAn/W+bfv7VWBDLiKbDhtb4AorIyVIEq9t5S5MkuOKSIdbTPguBtKuwL5pAMJG7McIEsiV3Wwo80q9kVjj6hkCzICt9d7HX2EUpNR77QjfUDbwyAUSRDtjO1nndV5C5UC+cXMLvdcgt/RXUBXMEqS3qUWSi3Exqoeyz0GmjEnrvwC5eDpMsgmeRtf5uxOeliMRwb+Kt52m6HWVOmaogjKldqwxX+SCV6rPyLG4FDINcx3bRCFi71Kpp7YLsXg5BULrdPtPFEfp/7XbGBfQOtzi8/+BPOBEg8+GD+9ozHZtflA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by GVXPR04MB10517.eurprd04.prod.outlook.com (2603:10a6:150:1e1::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.13; Tue, 12 Aug
 2025 08:44:24 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::93bd:316b:682f:5e59%6]) with mapi id 15.20.9031.012; Tue, 12 Aug 2025
 08:44:24 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Frank Li <frank.li@nxp.com>, "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
CC: "rmfrfs@gmail.com" <rmfrfs@gmail.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, "martink@posteo.de" <martink@posteo.de>,
	"kernel@puri.sm" <kernel@puri.sm>, "mchehab@kernel.org" <mchehab@kernel.org>,
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de"
	<s.hauer@pengutronix.de>, "kernel@pengutronix.de" <kernel@pengutronix.de>,
	"festevam@gmail.com" <festevam@gmail.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] media: imx8mq-mipi-csi2: Add data type field in pixel
 format
Thread-Topic: [PATCH 1/3] media: imx8mq-mipi-csi2: Add data type field in
 pixel format
Thread-Index: AQHb9uoTaRb/UjHDJEmrnljv6LKfWLQ2dUOAgChiarA=
Date: Tue, 12 Aug 2025 08:44:23 +0000
Message-ID:
 <AS8PR04MB9080696B20FE05EEC6EACA2BFA2BA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20250717071359.1910515-1-guoniu.zhou@oss.nxp.com>
 <20250717071359.1910515-2-guoniu.zhou@oss.nxp.com>
 <aHkaI/bA1EM3/Omn@lizhi-Precision-Tower-5810>
In-Reply-To: <aHkaI/bA1EM3/Omn@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|GVXPR04MB10517:EE_
x-ms-office365-filtering-correlation-id: 5b4104ec-c6d9-4f5d-d1a6-08ddd97c705f
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|376014|7416014|366016|19092799006|1800799024|7053199007|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Ccy3NK2Axari3EjlnhBvI2rIZBXMs0MaVcxshcNZXFxKcyGo6J2pLASTCniu?=
 =?us-ascii?Q?VnwecncpWLRitwQdeYoJc39GYr3QKo0jtuvmf0AK75nkgCAFBKojI0gdMJqS?=
 =?us-ascii?Q?towMgrNhZn0Cu5gzuslUAKpraJX1G36SNfteZNcrOx/7dN4zL4yFOPjCsQLt?=
 =?us-ascii?Q?GKkpwvL1NVz6cUt7tsLdHi33vvozs3+rBZbmzfHLuSDwGxqD5KttPxyitILm?=
 =?us-ascii?Q?qj114FGik2Vp3BWfKyRu9BPhbjZDBvkJqb2WEuMls02A3qa8Gmr2N/9dfKEq?=
 =?us-ascii?Q?cCazf5uFIb9x+g/wXQ+ho3oIiNIR60kXxfHTgZ5TfKQF0zuPt16J2iwUUAZO?=
 =?us-ascii?Q?RT9ycdzi5fni2e9HC8wCy5rrEDkyqX2lXmhotLJNEINbXRF/pizieKw1erBS?=
 =?us-ascii?Q?hgoVKarRHsYlkmNJa8TmxZpDVhdts7Ybm3UQ7cEBTloRRxLFoN/DNJSf1uSw?=
 =?us-ascii?Q?hCKi6bzrrpDQ0PlDOHdpmHMOqKw3AFnMye3dab8mIRjNNzZ/CRyAB+BUX080?=
 =?us-ascii?Q?BwVcAhhpWVsBNYHgaqh480+hHpOIXT6RBV+6L0agtL/NXyf0n7bVaIwH1CB1?=
 =?us-ascii?Q?p/uZdqWXQUzwrxainjaZhnTjtOdz+nPAYdGkUqTacSbz0xuYjxG1XpVFsk4a?=
 =?us-ascii?Q?PyDPTlQ0HsKBON3ypWB+uZrB9jet5H26LSlTRT23NEYZg6O3RV97W/1bCj2V?=
 =?us-ascii?Q?8kJFW4GHGHDz/HywQfSyVXhkY6MWmcVWnywjXClQsuQWCelKgaMqzPIkyBzz?=
 =?us-ascii?Q?7ElEIkypa6kdj5fbmuuylVqfUTPGp0ZqatEZwUdKLL2Frvc5WhOhHv5f00gf?=
 =?us-ascii?Q?HClsXi2Cr6Xd9y31Hu3ZK5d5UPCmd4joudDVNgANBamiUf5iP+TIIqTbriIk?=
 =?us-ascii?Q?S4IL48vXyZ7m3J2Uo11JVCrBrjWxxCPTPIarFmqSa1b1Wkz5N+InWpZIZxCo?=
 =?us-ascii?Q?pJFsV8awi6QoamnXO/AEyT5t9luoieP2I8TfUKE6ppeFbwwouPHUUGcQ3B/z?=
 =?us-ascii?Q?gCik/uR7Mz74auode6PZP9qf7TNdp804Lgv3CDM5DwmYq6nzKpbm7aQ93imK?=
 =?us-ascii?Q?lMhJRYGgQwPHO74cUKDdqDmudRo0YlgbQ+EkvvIddZUYduPB4QtBNhzdIqfm?=
 =?us-ascii?Q?OS6oGgOTQmfCb5gXoPGAfgIBG25RKC1p1Fonha6q0Z9FRttwTMih1YAYans8?=
 =?us-ascii?Q?hbLLKd9dGX+a1UDcsxcSYt6bhXsRyGo5+epbNXi/6xFkHzJGwA0+hB353ZJP?=
 =?us-ascii?Q?NLpnvIHgzyxkaFoj5ZLOu7pB0ks5LLwJDsCU3FmXvaJq5kAua5ze/+ddFX1P?=
 =?us-ascii?Q?8xl++gC1pPU9J9EOZAkuqXx9AvFyTA7FNxVwzUjMmtgLKJq0n0rcmNZrB8vz?=
 =?us-ascii?Q?YmMKBeyY7IM7zEFFmZ61VEIQsgZRf94t76yL7uJ88cei8Qn++RFy9gWbVPXE?=
 =?us-ascii?Q?iZF2NfZh1olmh6febJAS8NcUht7ssGQTfCW8ZjsVLyJBYfTaJF1gyQ=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(19092799006)(1800799024)(7053199007)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?ckQzSRMuJuoKTfUqEeWJMRADufPJ93YVixpz28CridC1cT7OZ5qc8BfllWzm?=
 =?us-ascii?Q?McoaM5/QdbfQEUTvqUU1xX3bDdGL95ld0lMimhMkXDoZWefWgUalAAr7eXNy?=
 =?us-ascii?Q?9a6mQ9ip84uPyPU2efJzWIN6rW6taE9sAJnKMt3RcIAzsjmVhTOFwWnVcQ0K?=
 =?us-ascii?Q?Jr43Ztrunm/kpvMffoFkoOrbcNMQYrp8Q+mO5S/6LyNIgSeVpH/on6i2RA7h?=
 =?us-ascii?Q?NaHfU3w2Vw0WX1HtwqP9jrTT5W+5G4mdI8UwAlNvBGlZp0G9CQle+6+RZbU+?=
 =?us-ascii?Q?IJCwj1zZ3Gogec5zqfWttWi9QI2jiTALoUwK17uyEmlY5u4/bBejA2PgCJ6L?=
 =?us-ascii?Q?RjqlmI6JCdUH4yZHPcPUJlbaBwc/TN7jFxr1QVoiBXWlV1H9WiSmOjDezaOG?=
 =?us-ascii?Q?ibsuVvia1El/YQ9uM1y874acuWAWVdVmtkqZBfVfRvXGETseQYdCeHYW70OP?=
 =?us-ascii?Q?HFEfuS2qDSgWsTM4MPAHHykzZYlvnOF68NVPgKES4J+WVPtk97JfFooxHgZ9?=
 =?us-ascii?Q?ESeARMYgWWUz4EUo9O6BV20mspCtdwHgQOO7/ss7HGIQpEqrRNzqjmlAYO1S?=
 =?us-ascii?Q?0kS37a+xIWYzpPrc/SjU+u3kW2EzhZHUjTb5OaM2fKgCfiL0G2a0j2Ez2J4A?=
 =?us-ascii?Q?AmsGYHTTAlgUstWGtemFWEKYZlbURZnM7TILaSUeRCRJ0i/uqJ9loxkSjaQ8?=
 =?us-ascii?Q?nVao38eCr+kHgRPq3pVzbu4J1K/pgwoXqW39N8nGeYGr3kt2Yb+AsgDhuQRI?=
 =?us-ascii?Q?SX1PKS1h5NOrNDCXxuF8hiQsMgjSyEjPygImA4cKI5Hgm4hrp0BC9ooc/ZWh?=
 =?us-ascii?Q?VZ5nPa0neBR4p2yXva46OTLqjO6YYnFUhPaOk7L0OtYztsXkrtNuHZ1gvL8S?=
 =?us-ascii?Q?dB+oIcG+xEzJLyTU6XtmGny6W0vNKw2py5WRBTvOokd0FMqumCwMADeOjxzz?=
 =?us-ascii?Q?plTadAaVafmiCGNXH3WjgbbOrhpnIoMrzzJeDhpjfmJPkghcbH2MgrkerfJo?=
 =?us-ascii?Q?GMe3mgKUxQ5mwt2IWmeO2fldFwmXyjnDAL5oebSw3n0Nb+grDQq8KWvzDNDo?=
 =?us-ascii?Q?ZAo8GijbFoRBoMMfbVnLdGwDLT1/un29p7CPnMB9qG0njQ51Z97qH65ANapI?=
 =?us-ascii?Q?+p3bXTqmQvf4gpDrxcm+y8CExTDy+nflQFTiHJ6uSqyDeKeJJ2eyHFAoxXt8?=
 =?us-ascii?Q?dxZDps1qih0SRQMrerFl80uUw92Y11XYOegVH4AZUWRNENbjcrWioux8xCM7?=
 =?us-ascii?Q?SSOzx9PxNlzBOGdaaQyM1ZeTHkRks6hdzK+xWUr9y/F2XMBdZ9t9phqVDpo8?=
 =?us-ascii?Q?QxGnqF93xu1un+3W7CPySQOpbxrARuBCH5voVUc0lemlwPdlm7vFTPbLtejx?=
 =?us-ascii?Q?mJ/9xniYpVZ2Qb83iFd1LM1ZuCPCsBtlyr757L4N+AvAEPV5ZrDylJ7LSdto?=
 =?us-ascii?Q?t6kItRqfK/yqz2ma82D/iqmQlx/uGfcT0BSLvqgqotzQLNvp7Ca5Hv40oF45?=
 =?us-ascii?Q?+UEJRzqnKrDIKFUJwViUd25aw6HRl4HthfrJ/Ojy+wtjWH9Nfh9K6Hn5wgVv?=
 =?us-ascii?Q?SS2+sFu6jVYd3g/IW+RBBVxrPbHnpU4//44//Ur2?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b4104ec-c6d9-4f5d-d1a6-08ddd97c705f
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2025 08:44:24.0302
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Iq1VXQDsNpx1VgWUe4798WKuAoTpGFT7iTW0O6sOJ0N2ICGspVsjtjMy9VpcRiU/YNyWv38kRoXAdKiySEFghA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10517

Hi Frank,

Thanks for your feedback.

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Thursday, July 17, 2025 11:44 PM
> To: G.N. Zhou (OSS) <guoniu.zhou@oss.nxp.com>
> Cc: rmfrfs@gmail.com; Laurent Pinchart
> <laurent.pinchart@ideasonboard.com>; martink@posteo.de; kernel@puri.sm;
> mchehab@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> kernel@pengutronix.de; festevam@gmail.com; linux-media@vger.kernel.org;
> imx@lists.linux.dev; linux-arm-kernel@lists.infradead.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH 1/3] media: imx8mq-mipi-csi2: Add data type field in =
pixel
> format
>=20
> On Thu, Jul 17, 2025 at 03:13:57PM +0800, guoniu.zhou@oss.nxp.com wrote:
> > From: "Guoniu.zhou" <guoniu.zhou@nxp.com>
> >
> > Add data type field in CSI pixel format info since the downstream
> > subdev in the pipeline need to know.
> >
> > Signed-off-by: Guoniu.zhou <guoniu.zhou@nxp.com>
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
>=20
> double signed off line.

[G.N] Will remove it in next version.

>=20
> > ---
> >  drivers/media/platform/nxp/imx8mq-mipi-csi2.c | 23
> > +++++++++++++++++++
> >  1 file changed, 23 insertions(+)
> >
> > diff --git a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > index 3a4645f59a44..7495400adc22 100644
> > --- a/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > +++ b/drivers/media/platform/nxp/imx8mq-mipi-csi2.c
> > @@ -25,6 +25,7 @@
> >  #include <linux/reset.h>
> >  #include <linux/spinlock.h>
> >
> > +#include <media/mipi-csi2.h>
> >  #include <media/v4l2-common.h>
> >  #include <media/v4l2-device.h>
> >  #include <media/v4l2-fwnode.h>
> > @@ -138,6 +139,7 @@ struct csi_state {
> >
> >  struct csi2_pix_format {
> >  	u32 code;
> > +	u32 data_type;
> >  	u8 width;
> >  };
> >
> > @@ -262,68 +264,89 @@ static const struct csi2_pix_format
> imx8mq_mipi_csi_formats[] =3D {
> >  	/* RAW (Bayer and greyscale) formats. */
> >  	{
> >  		.code =3D MEDIA_BUS_FMT_SBGGR8_1X8,
> > +		.data_type =3D MIPI_CSI2_DT_RAW8,
>=20
> I found many place have similar convert. Is it fixed map for csi2?  If ye=
s,

[G.N] Most of them are fixed, but some of them may depend on device specifi=
c, so I suggest to let driver to handle it.

>=20
> Can you add helper function, like
>=20
> in include mipi-csi2.h
>=20
> media_bus_fmt_to_csi(int bus_fmt)
> {
> 	switch (buf_fmt)
> 	{
> 	case MEDIA_BUS_FMT_SBGGR8_1X8:
> 		return MIPI_CSI2_DT_RAW8;
>=20
> 	...
> 	}
> }
>=20
> Frank
>=20
> >  		.width =3D 8,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGBRG8_1X8,
> > +		.data_type =3D MIPI_CSI2_DT_RAW8,
> >  		.width =3D 8,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGRBG8_1X8,
> > +		.data_type =3D MIPI_CSI2_DT_RAW8,
> >  		.width =3D 8,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SRGGB8_1X8,
> > +		.data_type =3D MIPI_CSI2_DT_RAW8,
> >  		.width =3D 8,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_Y8_1X8,
> > +		.data_type =3D MIPI_CSI2_DT_RAW8,
> >  		.width =3D 8,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SBGGR10_1X10,
> > +		.data_type =3D MIPI_CSI2_DT_RAW10,
> >  		.width =3D 10,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGBRG10_1X10,
> > +		.data_type =3D MIPI_CSI2_DT_RAW10,
> >  		.width =3D 10,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGRBG10_1X10,
> > +		.data_type =3D MIPI_CSI2_DT_RAW10,
> >  		.width =3D 10,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SRGGB10_1X10,
> > +		.data_type =3D MIPI_CSI2_DT_RAW10,
> >  		.width =3D 10,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_Y10_1X10,
> > +		.data_type =3D MIPI_CSI2_DT_RAW10,
> >  		.width =3D 10,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SBGGR12_1X12,
> > +		.data_type =3D MIPI_CSI2_DT_RAW12,
> >  		.width =3D 12,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGBRG12_1X12,
> > +		.data_type =3D MIPI_CSI2_DT_RAW12,
> >  		.width =3D 12,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGRBG12_1X12,
> > +		.data_type =3D MIPI_CSI2_DT_RAW12,
> >  		.width =3D 12,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SRGGB12_1X12,
> > +		.data_type =3D MIPI_CSI2_DT_RAW12,
> >  		.width =3D 12,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_Y12_1X12,
> > +		.data_type =3D MIPI_CSI2_DT_RAW12,
> >  		.width =3D 12,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SBGGR14_1X14,
> > +		.data_type =3D MIPI_CSI2_DT_RAW14,
> >  		.width =3D 14,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGBRG14_1X14,
> > +		.data_type =3D MIPI_CSI2_DT_RAW14,
> >  		.width =3D 14,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SGRBG14_1X14,
> > +		.data_type =3D MIPI_CSI2_DT_RAW14,
> >  		.width =3D 14,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_SRGGB14_1X14,
> > +		.data_type =3D MIPI_CSI2_DT_RAW14,
> >  		.width =3D 14,
> >  	},
> >  	/* YUV formats */
> >  	{
> >  		.code =3D MEDIA_BUS_FMT_YUYV8_1X16,
> > +		.data_type =3D MIPI_CSI2_DT_YUV422_8B,
> >  		.width =3D 16,
> >  	}, {
> >  		.code =3D MEDIA_BUS_FMT_UYVY8_1X16,
> > +		.data_type =3D MIPI_CSI2_DT_YUV422_8B,
> >  		.width =3D 16,
> >  	}
> >  };
> > --
> > 2.34.1
> >

