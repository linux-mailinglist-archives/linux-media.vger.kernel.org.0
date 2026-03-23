Return-Path: <linux-media+bounces-56653-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LxFA1HawGn6NQQAu9opvQ
	(envelope-from <linux-media+bounces-56653-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 07:14:41 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 328772ECE9B
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 07:14:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9303930A4576
	for <lists+linux-media@lfdr.de>; Mon, 23 Mar 2026 06:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F17B2D2491;
	Mon, 23 Mar 2026 06:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="pCbBvcel"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F092C21C3;
	Mon, 23 Mar 2026 06:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246102; cv=fail; b=glMPdhKICzzGRDa9qKe+5RP/YXBHN1kaI/nH39FpPV5MhI9CCP/z/7F3LUkob/wIzIgPcGxnXaInKJYoTrpOa/2ScaKSEu9knqdGB+srOdf6C85oHddocpVxT9eCAmzkp+sw2SNLbtcJBNOp6YUxnzFqnvIzc21LdJ9l60aucJc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246102; c=relaxed/simple;
	bh=H1mcKP4ph4WsrSE1MXlcQyJRAy6eyuT/fjDTAdOXqqU=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Pxc4yE0GSlTVIe2PyLGGb/Pb+HTLp7wIicTetbS7joyagnIg810EGrLB37YTxFOd0OYaFdL5zR+/w8vUAY/cU8tOu7WzljGwte1FIHti9imAmbDd8o9uBxD/WFex/q+C1BuWr2vx2eHSnFxkVre/GQN1RtvK84jSKsdQ3PxuESQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=pCbBvcel; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UdjuygtxaUlHyKpTohO+TA2xLUSYDfzuDyQ0R+Oj2SofniES6DRm6ZkFz17OgawAm9ZK8PwaWA/FuUiwHXMrwdd4VpvwmTvvnnrhNBCKkbdyIRrbcQkuRZbdpQG/vx+lfdDCgS921C2qCBdAzIzZsCSY+dx5TxBemnz57PtMFdzMQXIX4+FkZ/8EE5ahwolcH7lgIXtq+22+sL9KBWATNYdTQD/wyaEnmGgW90SEOz7px1tOC6HUpUd+A77GIKWOilgCMTgy8xjzeFQQdQUyDAxH3Mksmi5W05tU+OXr+Lr0HCqULXXhZi1F/USA8Fxhrocrti12M9Y0nuhRkMIKVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H1mcKP4ph4WsrSE1MXlcQyJRAy6eyuT/fjDTAdOXqqU=;
 b=RgBoac9a3G+OXOOabp3eMGVY6EH1Rbxbxr0SU4FxaAkVaEOy8bTX7KUkFBKx3P0cKKRvPSHaMCJqWhT2KWvGTEtwecqN1cnyMDlyVg8OLDhJgqZaiDh+H8S+kGnwAOrnqcbqORuqg6Z1wAFJJD41pH2mY0bTxU1aSbAB5EzKP6yQdDRR36GE/kk1siIQYuVqGxN9BqjQ14ZtrcgM5SQ6tLkmh00IU9Xg/Th615MRm5FHsub7Ye0PcEmDBwq6IID0no/Q3Mb8pWiZfYzag1mGDwDSDN9iMdkQXZhuTvL1K79nCrV7rl/8wEvwqXDvS+nk1qiwKgJJpscV8CX4bMq7LA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H1mcKP4ph4WsrSE1MXlcQyJRAy6eyuT/fjDTAdOXqqU=;
 b=pCbBvcelzpJ3K5h188jiZdEEth8PteCfjNrA47yxZgtz31STiyzVx6Ot1f56TKcUC760E3H/0boLbk0ypNAI9JTvVHADYpXRglp1I+hCMPYJg+A24nSfmRc2mK5mGZRtAfdPkgYRqRISINrQVNyYNhMzwGPg6AGtZ4b1dD0ShkAzFb6E/g63L/AV7rGX3d6qF875my5qP7wKfK55KczCuEjN4xfJZ3uvDnRExPsKd2y+XmOhCqv0dQproCVzeKdqk98m7w9FIA8r1/z8w5hct+bq3ndi4hAf/eilF3TbnlXdgZWcagV4CGCwhqlhG6aliIurKknUIDSr1kLoqNoxkA==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by DB9PR04MB9284.eurprd04.prod.outlook.com (2603:10a6:10:36c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Mon, 23 Mar
 2026 06:08:05 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 06:08:12 +0000
From: "G.N. Zhou (OSS)" <guoniu.zhou@oss.nxp.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "G.N. Zhou (OSS)"
	<guoniu.zhou@oss.nxp.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
	=?utf-8?B?U3RlZmFuIFJpZWRtw7xsbGVy?= <s.riedmueller@phytec.de>, Jacopo Mondi
	<jacopo@jmondi.org>, "c.hemp@phytec.de" <C.Hemp@phytec.de>, Frank Li
	<frank.li@nxp.com>, Aisheng Dong <aisheng.dong@nxp.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "G.N. Zhou" <guoniu.zhou@nxp.com>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH RESEND v2] media: nxp: imx8-isi: Fix potential
 out-of-bounds issues
Thread-Topic: [PATCH RESEND v2] media: nxp: imx8-isi: Fix potential
 out-of-bounds issues
Thread-Index: AQHcuottcQmI0e6HP0qF+TbWIj3H/Q==
Date: Mon, 23 Mar 2026 06:08:11 +0000
Message-ID:
 <AS8PR04MB908045C9CABDEC5902D9485DFA4BA@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20260228-isi-v2-1-f6f9208c6844@nxp.com>
 <20260319213348.GA950375@killaraus.ideasonboard.com>
In-Reply-To: <20260319213348.GA950375@killaraus.ideasonboard.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|DB9PR04MB9284:EE_
x-ms-office365-filtering-correlation-id: 65b23999-c5d4-46eb-e519-08de88a29052
x-ms-exchange-sharedmailbox-routingagent-processed: True
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|19092799006|376014|7416014|38070700021|18002099003|22082099003|56012099003;
x-microsoft-antispam-message-info:
 MkqhMIHAug3OvqMd7cnqqfXVdeuhxS5o8JnYka+BrD54YFGenxw1uD4y2sEosvD78YHNn6d6cJXgjWHpxxcbLJFZzyZjlpiRSywH/7QG/hdT2xVn8vPnrOfMZvwqbL+1S2zvdeTwInTsIRnjejC27/WwW4OcBnL6Xvsp2+FTge+lTNNpq9oGPUy1tyg3TyaOFw2+7cX9tPxZBoz2h0eJxL6lxrZCnZiMYNlStX02kPE75ru9Y7G0YPQEGslcyseCwfffz6TS2Wsb+Qx5mv/hk/n+GbMiobidJXj/KC5+hp7/LSA6XJiub9kQoUyh19z1bT/SYqpPjjvBzW/fayoVhUPFWX3tBd2l8dxzzX+eghu8+8IhTudxxyjQiiHuvslI3Dg4em6CxewtcsvYYNlohFzmoIz18xS03Afxy6Ow8uLhcI3BbqDA4wKT8rK+DVcYglzh+v8T+oFOk0VfVLYKtPVTMIzEL+XShplJz4kklC1AZZaqvmmZZW8/4XCz3xjTaxXeWsPPwIAcrMS/gPci86/DG1a47V+wnBVrxy8Z3jbbgYP7/n7s/8MLhSG9F+8ReYOHYF5PICPyEyB0lfsb4PvYesnqm03MXZgFlcwaVYikjq9O+bcgtCrvE/fl1f07heta6xTmYglo5vmUd0gi9/jVdwNDW9olkYhlnOsBpnStNVOWbC/D3QxFWhXT9n9K10ptMQIJFN3fcHrYXLsNsuzrLF7d0HG8y+u4iI1F2fRHY65k4OrAtiHWl/FkGXs+j/9TArAP8LvZ5mGcMW01blH7qyVtrggj8PAPzaxssSQ=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(19092799006)(376014)(7416014)(38070700021)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?U3VLcjdZbWh4VWJuNzIyOXhML1NKNHJsWXRsakJlWkZOemdNbEFXN3JENC9r?=
 =?utf-8?B?SWwxWnhkRmtNNkszMzEzMzBUSzhlZE5DZU1kamhqTEZ0cXNDbzVsZ3c3ZVUr?=
 =?utf-8?B?UEowbTZiRnVWemNSOXZCdE5GOG5SNTY1Znk1RkhxNHdVZktjN1FTOGNwbG9Z?=
 =?utf-8?B?SHNZK0gwYm56Q21zcmRDVUEwc0RyS2pOYWp6dE9QTW9ob0k2Vi9TSE1ScTR1?=
 =?utf-8?B?bTJlSjlhTngrVHIvU0RvM2hlM3dEdndRd2dMUDdrQ2tOVS9zSXNhelc3U3lx?=
 =?utf-8?B?KzY4TFk3RUhWelQxL2UwMTBnTDVWMlNZbzZqamRnZlpUYSsyZWw3Q2IzallV?=
 =?utf-8?B?OGdvYmg5aFRkTmxwTGIvRWRXWVhiVW1Oak1sRXlyNlFPblpSQnVQVFVVR2RN?=
 =?utf-8?B?MGYyeWRQQTExclViS0Q3ejVBdEhGVVRhdjc4VitEVFJMY2RFWFI5SzAvQlR0?=
 =?utf-8?B?V05tby85K1VqWFlsK2pYOGlLUTg4aXpLWW9hNWdQSmwrS2x0cG9SeWlTUStm?=
 =?utf-8?B?enIwUXlNMk5VVDR6STg5YVpWdnBFZ2w1eGxSOFVGSnNzMC9Wa3VvMXFyRDJO?=
 =?utf-8?B?eGQ3YXplVWhSYU5UR1JTNG9UOSt3WGFKT2JjNFVFVU54ZGRnb2RqeGNJeFox?=
 =?utf-8?B?T0NZdmtRK20xRE1hLzVvS3RRQjBDUDhvVGpOVm03UTNjeU42SHh4SlBaaU4x?=
 =?utf-8?B?dzlYTkxqZFVwSFhTbWZMQ3JlUzA4eFpNdmx3UFVMZnpsajV5LzFNK3BrSHRQ?=
 =?utf-8?B?S2ZQaHJwc05aVXlpZ1ExMnI0cWRuc001eHVORVlTeU9oYm5veHZCaG1oUW53?=
 =?utf-8?B?U1M3TXJIdk1nNGc0TUNyOHdOTVVYZWVMdkE0dnJUc2xvb0hKbW4zd05IVU1N?=
 =?utf-8?B?RHZVMmZaelkySGoxWVh1ZWZQaGZTTWVDL3REckRCSFoySzRiaXROTFFuc2Qr?=
 =?utf-8?B?THowNGtTK0JFUWNaOXZOYkZ1d3ZDaUxBZmR6c3dYMTN3SzROc2sxNm5tMysx?=
 =?utf-8?B?V1RzNEZIZUMreU9yZmxJdThkV3QrU2lwRHk2ODdpRlhoL1gzYlpsKzIvNFl2?=
 =?utf-8?B?SnhWNUVySURSQWFQRlY3dkYyQTZlcnUxa0FiWlF6bHozT3daOVBqbHVlMnR3?=
 =?utf-8?B?OTE3SkhRSDRQSlFyT0tVSzFJcDRmbmZWVW9mL0orU0Qxc1VPWEVEekZGUUIv?=
 =?utf-8?B?dVRmc2V0WmFSU3BrclM0em5iZWJ4MGhxeExyVWZ6Nm40YWdWekJ2T0ErQ0pC?=
 =?utf-8?B?QjkzTkU3R1RXYU54OEwzWWRQZU5LcHUzVjEyVFZxYndNMVZPaXF0WCsySS94?=
 =?utf-8?B?SE1GeU02SVZKaW5oRGtVNEVXaFFDSkRBMlN0SVFCN2JkS0U4NHNvaGYzZGlC?=
 =?utf-8?B?RFNFSFh4VU9qUzJsWXdlTWIxMU05MThsRk5vQWJjeWxwcnJ3amVvQ2g1bHFt?=
 =?utf-8?B?VStFK0F3aUI1cXo0QndVdVNPS3dqUUQ5Ym85R0lib2pNbU54TzdEQ3NWQ0dS?=
 =?utf-8?B?eVVuV3dmY24xNEtIYk9LMXVtSDJJTWN2T1BRWXdSbncxTHR2b0k4TjNRUjBK?=
 =?utf-8?B?SmtUcEFqdUVBcWRreGZqVjd0R0xmZXdiaXBTdlV4YjhxRnp3Y2p2SE5UaFlR?=
 =?utf-8?B?cEd6KzRCOGcvWlRWWnJ1Y3VUdnFhbHQveGliWGtDUVYwUkVRV25sblNMMEha?=
 =?utf-8?B?SFR1am82cmI0QlRZV1lWY0ZUNlJ6N0tPWDFDUGh1b0NJME1pVkkwaXdmeUNL?=
 =?utf-8?B?VVc5Y2QxcHlDaURHL3pVZ3ZPZ2JYbXpJdEpHUGVYVjdBeStvaFdxQUpTK3Jr?=
 =?utf-8?B?UmtuVzQ3dDBTTVZheHV4ak41NTZPdk5hTjhpdGdZdDE0Sk1ZV2szT1dJQUxB?=
 =?utf-8?B?Q1pNUjhwa2U1YW40cUVybXY1VTBheWFST0d6aTBDa1QwcGFHWTZBeGh3NEpv?=
 =?utf-8?B?NFAwMWEwM0lMRzVwSUlFMmVnS2dUdU93M3VCT0trTTVhcy9uUmZucWYrTCsy?=
 =?utf-8?B?ZGJEZGkxejZiS2p4d283Z1h6dTZLUVYzY3VtVThqZVpnSVF6azJma3VkN2NV?=
 =?utf-8?B?YURwNUl3cytrcTJGMXJ3bzMvdEIvUlhneTdaeXJoeHpYUFovMC9ESzFQc2xF?=
 =?utf-8?B?Y2trbGdTdUtjamtEMVEyc2NvTHhjR1o5MkVhYnJHUjFhbFBzTnBuUWtsSjM4?=
 =?utf-8?B?d0t1QVhBOHQrbkpxWlEzNVphTXhDNzhsVTNtMkMxaVB6a3Yrcks1Q2E4TTk5?=
 =?utf-8?B?ZWNqLyswZjhtSDdUdU03M1YrWEQrOGpVL2hNL0VCVWhaTU15Ny9nSTJyTGd6?=
 =?utf-8?Q?eB7BK0AzDBk1dWAZdS?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 65b23999-c5d4-46eb-e519-08de88a29052
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2026 06:08:12.0388
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WzEGbshZAK6tl1Z6b5qWkUkfFHGx0kfD6ALQZn3bNZsswMG1dHj7mHj1cSsYr64IO/VjC33lMJ7PYA4ejBxE6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9284
X-Spamd-Result: default: False [0.54 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	R_DKIM_ALLOW(-0.20)[NXP1.onmicrosoft.com:s=selector1-NXP1-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[nxp.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56653-lists,linux-media=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[kernel.org,pengutronix.de,gmail.com,phytec.de,jmondi.org,nxp.com,vger.kernel.org,lists.linux.dev,lists.infradead.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[guoniu.zhou@oss.nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[NXP1.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media];
	NEURAL_HAM(-0.00)[-0.982];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 328772ECE9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

SGkgTGF1cmVudCwNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldy4NCg0KPiAtLS0tLU9yaWdpbmFs
IE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBMYXVyZW50IFBpbmNoYXJ0IDxsYXVyZW50LnBpbmNoYXJ0
QGlkZWFzb25ib2FyZC5jb20+DQo+IFNlbnQ6IEZyaWRheSwgTWFyY2ggMjAsIDIwMjYgNTozNCBB
TQ0KPiBUbzogRy5OLiBaaG91IChPU1MpIDxndW9uaXUuemhvdUBvc3MubnhwLmNvbT4NCj4gQ2M6
IE1hdXJvIENhcnZhbGhvIENoZWhhYiA8bWNoZWhhYkBrZXJuZWwub3JnPjsgU2hhd24gR3VvDQo+
IDxzaGF3bmd1b0BrZXJuZWwub3JnPjsgU2FzY2hhIEhhdWVyIDxzLmhhdWVyQHBlbmd1dHJvbml4
LmRlPjsNCj4gUGVuZ3V0cm9uaXggS2VybmVsIFRlYW0gPGtlcm5lbEBwZW5ndXRyb25peC5kZT47
IEZhYmlvIEVzdGV2YW0NCj4gPGZlc3RldmFtQGdtYWlsLmNvbT47IFN0ZWZhbiBSaWVkbcO8bGxl
ciA8cy5yaWVkbXVlbGxlckBwaHl0ZWMuZGU+Ow0KPiBKYWNvcG8gTW9uZGkgPGphY29wb0BqbW9u
ZGkub3JnPjsgYy5oZW1wQHBoeXRlYy5kZTsgRnJhbmsgTGkNCj4gPGZyYW5rLmxpQG54cC5jb20+
OyBBaXNoZW5nIERvbmcgPGFpc2hlbmcuZG9uZ0BueHAuY29tPjsgbGludXgtDQo+IG1lZGlhQHZn
ZXIua2VybmVsLm9yZzsgaW14QGxpc3RzLmxpbnV4LmRldjsgbGludXgtYXJtLQ0KPiBrZXJuZWxA
bGlzdHMuaW5mcmFkZWFkLm9yZzsgbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZzsgRy5OLiBa
aG91DQo+IDxndW9uaXUuemhvdUBueHAuY29tPjsgc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPiBT
dWJqZWN0OiBSZTogW1BBVENIIFJFU0VORCB2Ml0gbWVkaWE6IG54cDogaW14OC1pc2k6IEZpeCBw
b3RlbnRpYWwgb3V0LW9mLQ0KPiBib3VuZHMgaXNzdWVzDQo+IA0KPiBIZWxsbyBHdW9uaXUsDQo+
IA0KPiBUaGFuayB5b3UgZm9yIHRoZSBwYXRjaC4NCj4gDQo+IE9uIFNhdCwgRmViIDI4LCAyMDI2
IGF0IDA1OjM1OjUzUE0gKzA4MDAsIEd1b25pdSBaaG91IHdyb3RlOg0KPiA+IEZyb206IEd1b25p
dSBaaG91IDxndW9uaXUuemhvdUBueHAuY29tPg0KPiA+DQo+ID4gVGhlIG1heGltdW0gZG93bnNj
YWxpbmcgZmFjdG9yIHN1cHBvcnRlZCBieSBJU0kgY2FuIGJlIHVwIHRvIDE2LiBBZGQNCj4gPiBt
aW5pbXVtIHZhbHVlIGNvbnN0cmFpbnQgYmVmb3JlIGFwcGx5aW5nIHRoZSBzZXR0aW5nIHRvIGhh
cmR3YXJlLg0KPiA+IE90aGVyd2lzZSwgdGhlIHByb2Nlc3Mgd2lsbCBub3QgcmVzcG9uZCBldmVu
IHdoZW4gQ3RybCtDIGlzIGV4ZWN1dGVkLg0KPiANCj4gQ291bGQgeW91IHNoYXJlIGhvdyB5b3Ug
Y2FuIHRyaWdnZXIgdGhpcyBmcm9tIHVzZXJzcGFjZSA/IEknZCBsaWtlIHRvIHRlc3QgaXQgYW5k
DQo+IHNlZSB3aGVyZSB0aGUgYWJzZW5jZSBvZiByZXNwb25zZSBjb21lcyBmcm9tLg0KDQpTdXJl
LCBJIGZvdW5kIHRoaXMgaXNzdWUgb24gaS5NWDk1MiBidXQgb3RoZXIgcGxhdGZvcm0gbGlrZSBp
Lk1YOE1OIGFsc28gY291bGQgcmVwcm9kdWNlLiANCg0KQmVsbG93IGNvbW1hbmQgdXNpbmcgSVNJ
IG0ybSgvZGV2L3ZpZGVvMSkgZnVuY3Rpb24uDQpyb290QGlteDhtbmV2azp+IyB2NGwyLWN0bCAt
LWxpc3QtZGV2DQpteGMtaXNpLWNhcCAocGxhdGZvcm06MzJlMjAwMDAuaXNpKToNCiAgICAgICAg
L2Rldi92aWRlbzANCiAgICAgICAgL2Rldi92aWRlbzENCiAgICAgICAgL2Rldi9tZWRpYTANCiQg
Z3N0LWxhdW5jaC0xLjAgdmlkZW90ZXN0c3JjIG51bS1idWZmZXJzPTEwMCAnIScgdmlkZW8veC1y
YXcsd2lkdGg9MTkyMCxoZWlnaHQ9MTA4MCxmb3JtYXQ9QkdSeCAnIScgcXVldWUgJyEnIHY0bDJj
b252ZXJ0ICchJyB2aWRlby94LXJhdyx3aWR0aD0zMixoZWlnaHQ9MzIsZm9ybWF0PUJHUnggJyEn
IHF1ZXVlICchJyB3YXlsYW5kc2luaw0KDQo+IA0KPiA+IEZpeGVzOiBjZjIxZjMyOGZjYWYgKCJt
ZWRpYTogbnhwOiBBZGQgaS5NWDggSVNJIGRyaXZlciIpDQo+ID4gQ2M6IHN0YWJsZUB2Z2VyLmtl
cm5lbC5vcmcNCj4gPiBSZXZpZXdlZC1ieTogRnJhbmsgTGkgPEZyYW5rLkxpQG54cC5jb20+DQo+
ID4gU2lnbmVkLW9mZi1ieTogR3Vvbml1IFpob3UgPGd1b25pdS56aG91QG54cC5jb20+DQo+ID4g
LS0tDQo+ID4gQ2hhbmdlcyBpbiB2MjoNCj4gPiAtIEZpeCBwb3NzaWJsZSBzaWRlLWVmZmVjdHMg
Y2F1c2VkIGJ5ICdtYXhfdmFsJyBpbiBDTEFNUF9ET1dOU0NBTEVfMTYNCj4gbWFjcm8uDQo+ID4g
LSBBZGQgc3BhY2UgbGluZSBiZXR3ZWVuIHR3byBwYXJhZ3JhcGggaW4gY29tbWVudC4NCj4gPiAt
IExpbmsgdG8gdjE6DQo+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI2MDEyMi1pc2kt
djEtMS1jM2VjNmUyNjRmMTNAbnhwLmNvbQ0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmggfCAxNg0KPiA+ICsrKysrKysrKysr
KysrKysgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLW0ybS5j
DQo+ID4gfCAgNiArKystLS0gIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lt
eDgtaXNpLXBpcGUuYyB8ICA2DQo+ID4gKystLS0tDQo+ID4gIDMgZmlsZXMgY2hhbmdlZCwgMjEg
aW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMoLSkNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1jb3JlLmgNCj4gPiBiL2Ry
aXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgtaXNpLWNvcmUuaA0KPiA+IGlu
ZGV4DQo+ID4NCj4gM2NiZDM1MzA1YWYwZjgwMjZjNGY3NmI1ZWI1ZDA4NjRmOGUzNmRjMy4uODRl
MTM0ZjRkNWZiMjZiZTY1MmFjM2U2DQo+IGFlY2QNCj4gPiA0NTliYjJhMGQxYzYgMTAwNjQ0DQo+
ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktY29y
ZS5oDQo+ID4gKysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1p
c2ktY29yZS5oDQo+ID4gQEAgLTU5LDYgKzU5LDIyIEBAIHN0cnVjdCB2NGwyX20ybV9kZXY7DQo+
ID4gICNkZWZpbmUgTVhDX0lTSV9NMk0JCQkibXhjLWlzaS1tMm0iDQo+ID4gICNkZWZpbmUgTVhD
X01BWF9QTEFORVMJCQkzDQo+ID4NCj4gPiArLyoNCj4gPiArICogSVNJIHNjYWxpbmcgZW5naW5l
IHdvcmtzIGluIHR3byBwYXJ0czogaXQgcGVyZm9ybXMgcHJlLWRlY2ltYXRpb24NCj4gPiArb2YN
Cj4gPiArICogdGhlIGltYWdlIGZvbGxvd2VkIGJ5IGJpbGluZWFyIGZpbHRlcmluZyB0byBhY2hp
ZXZlIHRoZSBkZXNpcmVkDQo+ID4gKyAqIGRvd25zY2FsaW5nIGZhY3Rvci4NCj4gPiArICoNCj4g
PiArICogVGhlIGRlY2ltYXRpb24gZmlsdGVyIHByb3ZpZGVzIGEgbWF4aW11bSBkb3duc2NhbGlu
ZyBmYWN0b3Igb2YgOCwNCj4gPiArYW5kDQo+ID4gKyAqIHRoZSBzdWJzZXF1ZW50IGJpbGluZWFy
IGZpbHRlciBwcm92aWRlcyBhIG1heGltdW0gZG93bnNjYWxpbmcNCj4gPiArZmFjdG9yDQo+ID4g
KyAqIG9mIDIuIENvbWJpbmVkLCB0aGUgbWF4aW11bSBzY2FsaW5nIGZhY3RvciBjYW4gYmUgdXAg
dG8gMTYuDQo+ID4gKyAqLw0KPiA+ICsjZGVmaW5lIENMQU1QX0RPV05TQ0FMRV8xNih2YWwsIG1h
eF92YWwpCQkJXA0KPiANCj4gTGV0J3MgYWRkIGEgTVhDX0lTSV8gcHJlZml4Lg0KPiANCj4gPiAr
KHsJCQkJCQkJCVwNCj4gPiArCXR5cGVvZihtYXhfdmFsKSBfX21heF92YWwgPSAobWF4X3ZhbCk7
CQkJXA0KPiA+ICsJCQkJCQkJCVwNCj4gPiArCWNsYW1wKCh2YWwpLCBtYXgoMVUsIF9fbWF4X3Zh
bCA+PiA0KSwgX19tYXhfdmFsKTsJXA0KPiANCj4gSSB0aGluayB5b3Ugc2hvdWxkIHJvdW5kIHRo
ZSBkaXZpc2lvbiB1cCBoZXJlOg0KPiANCj4gCWNsYW1wKCh2YWwpLCBtYXgoMVUsIChfX21heF92
YWwgKyAxNSkgLyAxNiwgX19tYXhfdmFsKTsJXA0KPiANCj4gTGV0J3MgYXNzdW1lIHRoZSBpbnB1
dCBzaXplIChtYXhfdmFsKSBpcyAxMDAwLiBXaXRob3V0IHJvdW5kaW5nIHVwLCB0aGUgb3V0cHV0
DQo+IHNpemUgd2lsbCBiZSBjbGFtcGVkIHRvIDEwMDAgLyAxNiA9IDYyLiBUaGlzIGxlYWRzIHRv
IGEgZG93bnNjYWxpbmcgZmFjdG9yDQo+IHNsaWdodGx5IGFib3ZlIDE2Lg0KPiANCj4gPiArfSkN
Cj4gDQo+IEFueSByZWFzb24gbm90IHRvIG1ha2UgdGhpcyBhbiBpbmxpbmUgZnVuY3Rpb24gaW5z
dGVhZCBvZiBhIG1hY3JvID8NCg0KVGhhbmsgeW91IGZvciB0aGUgc3VnZ2VzdGlvbi4gWW91J3Jl
IHJpZ2h0IC0gYW4gaW5saW5lIGZ1bmN0aW9uIHdvdWxkIGJlIGJldHRlciBoZXJlIGZvciB0eXBl
IHNhZmV0eQ0KYW5kIGVhc2llciBkZWJ1Z2dpbmcuIFRoZSBtYWNybyB3YXMgaW5pdGlhbGx5IHVz
ZWQgd2l0aG91dCBzcGVjaWFsIGNvbnNpZGVyYXRpb24uIEknbGwgY2hhbmdlIGl0DQp0byBhIHN0
YXRpYyBpbmxpbmUgZnVuY3Rpb24gaW4gbmV4dCB2ZXJzaW9uLg0KDQo+IA0KPiA+ICsNCj4gPiAg
c3RydWN0IG14Y19pc2lfZGV2Ow0KPiA+ICBzdHJ1Y3QgbXhjX2lzaV9tMm1fY3R4Ow0KPiA+DQo+
ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lteDgt
aXNpLW0ybS5jDQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4
LWlzaS1tMm0uYw0KPiA+IGluZGV4DQo+ID4NCj4gZjQyNWFjNzg2ODU0N2RhNDAxZTg2Y2U1YTli
NzBhOTg5MGU3MjU0MS4uODg2MGQ4OTcxMzY2N2QwNmFiYzk0ZQ0KPiA2MDI0NTINCj4gPiA2ZmFi
YWM0NmZlYjcgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14
OC1pc2kvaW14OC1pc2ktbTJtLmMNCj4gPiArKysgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254
cC9pbXg4LWlzaS9pbXg4LWlzaS1tMm0uYw0KPiA+IEBAIC01MDksOSArNTA5LDkgQEAgX19teGNf
aXNpX20ybV90cnlfZm10X3ZpZChzdHJ1Y3QNCj4gbXhjX2lzaV9tMm1fY3R4ICpjdHgsDQo+ID4g
IAkJCSAgY29uc3QgZW51bSBteGNfaXNpX3ZpZGVvX3R5cGUgdHlwZSkgIHsNCj4gPiAgCWlmICh0
eXBlID09IE1YQ19JU0lfVklERU9fTTJNX0NBUCkgew0KPiA+IC0JCS8qIERvd25zY2FsaW5nIG9u
bHkgICovDQo+ID4gLQkJcGl4LT53aWR0aCA9IG1pbihwaXgtPndpZHRoLCBjdHgtPnF1ZXVlcy5v
dXQuZm9ybWF0LndpZHRoKTsNCj4gPiAtCQlwaXgtPmhlaWdodCA9IG1pbihwaXgtPmhlaWdodCwg
Y3R4LT5xdWV1ZXMub3V0LmZvcm1hdC5oZWlnaHQpOw0KPiA+ICsJCS8qIERvd25zY2FsaW5nIG9u
ZS1zaXh0ZWVudGggb25seSAgKi8NCj4gDQo+IFRoZXJlIGFyZSB0d28gc3BhY2VzIGFmdGVyICJv
bmx5Ii4NCg0KV2lsbCByZW1vdmUgaXQuDQoNCj4gDQo+ID4gKwkJcGl4LT53aWR0aCA9IENMQU1Q
X0RPV05TQ0FMRV8xNihwaXgtPndpZHRoLCBjdHgtDQo+ID5xdWV1ZXMub3V0LmZvcm1hdC53aWR0
aCk7DQo+ID4gKwkJcGl4LT5oZWlnaHQgPSBDTEFNUF9ET1dOU0NBTEVfMTYocGl4LT5oZWlnaHQs
DQo+ID4gK2N0eC0+cXVldWVzLm91dC5mb3JtYXQuaGVpZ2h0KTsNCj4gDQo+IFRvIGtlZXAgbGlu
ZXMgc2hvcnRlciwgeW91IGNhbiB3cml0ZQ0KPiANCj4gCQljb25zdCBzdHJ1Y3QgdjRsMl9waXhf
Zm9ybWF0X21wbGFuZSAqZm9ybWF0ID0NCj4gCQkJJmN0eC0+cXVldWVzLm91dC5mb3JtYXQ7DQo+
IA0KPiAJCS8qIERvd25zY2FsaW5nIG9ubHksIGJ5IHVwIHRvIDE2LiAqLw0KPiAJCXBpeC0+d2lk
dGggPSBDTEFNUF9ET1dOU0NBTEVfMTYocGl4LT53aWR0aCwgZm9ybWF0LQ0KPiA+d2lkdGgpOw0K
PiAJCXBpeC0+aGVpZ2h0ID0gQ0xBTVBfRE9XTlNDQUxFXzE2KHBpeC0+aGVpZ2h0LCBmb3JtYXQt
DQo+ID5oZWlnaHQpOw0KDQpPay4NCg0KPiANCj4gPiAgCX0NCj4gPg0KPiA+ICAJcmV0dXJuIG14
Y19pc2lfZm9ybWF0X3RyeShjdHgtPm0ybS0+cGlwZSwgcGl4LCB0eXBlKTsgZGlmZiAtLWdpdA0K
PiA+IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9ueHAvaW14OC1pc2kvaW14OC1pc2ktcGlwZS5j
DQo+ID4gYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL254cC9pbXg4LWlzaS9pbXg4LWlzaS1waXBl
LmMNCj4gPiBpbmRleA0KPiA+DQo+IGE0MWM1MWRkOWNlMGYyZWViNzc5ZTlhYTI0NjE1OTNiMGQ2
MzVmNDEuLmMzZmZjOGEzOGQxMjY5YzBhNGU2NDkzYg0KPiA0ZDc1DQo+ID4gNjkwZjAxY2M4N2Ji
IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgtaXNpL2lt
eDgtaXNpLXBpcGUuYw0KPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbnhwL2lteDgt
aXNpL2lteDgtaXNpLXBpcGUuYw0KPiA+IEBAIC02NDcsMTAgKzY0Nyw4IEBAIHN0YXRpYyBpbnQg
bXhjX2lzaV9waXBlX3NldF9zZWxlY3Rpb24oc3RydWN0DQo+ID4gdjRsMl9zdWJkZXYgKnNkLA0K
PiA+DQo+IA0KPiBUaGVyZSdzIGEgY29tbWVudCBhYm92ZSB0aGF0IHN0YXRlcw0KPiANCj4gCQkv
KiBUaGUgc2luayBjcm9wIGlzIGJvdW5kIGJ5IHRoZSBzaW5rIGZvcm1hdCBkb3duc2NhbGluZyBv
bmx5KS4NCj4gKi8NCj4gDQo+IFRoYXQncyBub3QgcmlnaHQsIGxldCdzIGZpeCBpdDoNCj4gDQo+
IAkJLyoNCj4gCQkgKiBUaGUgSVNJIHN1cHBvcnRzIGRvd25zY2FsaW5nIG9ubHksIHdpdGggYSBm
YWN0b3IgdXAgdG8gMTYuDQo+IAkJICogQ2xhbXAgdGhlIGNvbXBvc2UgcmVjdGFuZ2xlIHNpemUg
YWNjb3JkaW5nbHkuDQo+IAkJICovDQoNCldpbGwgZml4Lg0KDQo+IA0KPiBSZWFkaW5nIHRoZSBk
cml2ZXIgY29kZSB0byBjaGVjayBob3cgcm91bmRpbmcgaXMgZG9uZSB3aGVuIHByb2dyYW1taW5n
IHRoZQ0KPiBoYXJkd2FyZSwgSSBub3RpY2VkIHRoYXQgd2UgY2xhbXAgdGhlIGJpbGluZWFyIHNj
YWxpbmcgcmF0aW8gdG8NCj4gSVNJX0RPV05TQ0FMRV9USFJFU0hPTEQsIGRlZmluZWQgYXMgMHg0
MDAwOg0KPiANCj4gCXJldHVybiBtaW5fdCh1MzIsIGZyb20gKiAweDEwMDAgLyAodG8gKiAqZGVj
KSwNCj4gSVNJX0RPV05TQ0FMRV9USFJFU0hPTEQpOw0KPiANCj4gVGhlIHJhdGlvIGlzIGRvY3Vt
ZW50ZWQgdG8gYmUgYSBRMi4xMiB2YWx1ZSwgc28gMHg0MDAwIGlzIHgxLjAuIFRoZSBjb2RlIHNl
ZW1zDQo+IHdyb25nIHRvIG1lLCB3aGF0IGRvIHlvdSB0aGluayA/DQoNClllcywgeW91J3JlIHJp
Z2h0LiBJU0lfRE9XTlNDQUxFX1RIUkVTSE9MRCBzaG91bGQgYmUgMHgyMDAwIGJlY2F1c2Ugc2Nh
bGluZw0KZG93biBieSBhIGZhY3RvciBncmVhdGVyIHRoYW4gMiBpcyBub3Qgc3VwcG9ydGVkIHdp
dGggdGhlIGJpbGluZWFyIGZpbHRlciwgd2lsbCBmaXggaW4NCm5leHQgdmVyc2lvbi4gVGhhbmtz
IGZvciBwb2ludGluZyBvdXQuDQoNCj4gDQo+ID4gIAkJc2VsLT5yLmxlZnQgPSAwOw0KPiA+ICAJ
CXNlbC0+ci50b3AgPSAwOw0KPiA+IC0JCXNlbC0+ci53aWR0aCA9IGNsYW1wKHNlbC0+ci53aWR0
aCwgTVhDX0lTSV9NSU5fV0lEVEgsDQo+ID4gLQkJCQkgICAgIGZvcm1hdC0+d2lkdGgpOw0KPiA+
IC0JCXNlbC0+ci5oZWlnaHQgPSBjbGFtcChzZWwtPnIuaGVpZ2h0LCBNWENfSVNJX01JTl9IRUlH
SFQsDQo+ID4gLQkJCQkgICAgICBmb3JtYXQtPmhlaWdodCk7DQo+ID4gKwkJc2VsLT5yLndpZHRo
ID0gQ0xBTVBfRE9XTlNDQUxFXzE2KHNlbC0+ci53aWR0aCwgZm9ybWF0LQ0KPiA+d2lkdGgpOw0K
PiA+ICsJCXNlbC0+ci5oZWlnaHQgPSBDTEFNUF9ET1dOU0NBTEVfMTYoc2VsLT5yLmhlaWdodCwg
Zm9ybWF0LQ0KPiA+aGVpZ2h0KTsNCj4gPg0KPiA+ICAJCXJlY3QgPSBteGNfaXNpX3BpcGVfZ2V0
X3BhZF9jb21wb3NlKHBpcGUsIHN0YXRlLA0KPiA+ICAJCQkJCQkgICAgTVhDX0lTSV9QSVBFX1BB
RF9TSU5LKTsNCj4gPg0KPiA+IC0tLQ0KPiA+IGJhc2UtY29tbWl0OiBlYjRlZTg3MDc0N2MzYTc3
YTljM2M4NGQ4NGVmYjY0YmQ0ODEwMTNhDQo+ID4gY2hhbmdlLWlkOiAyMDI2MDEyMi1pc2ktNzRm
ODdmYmI5YTZmDQo+IA0KPiAtLQ0KPiBSZWdhcmRzLA0KPiANCj4gTGF1cmVudCBQaW5jaGFydA0K

