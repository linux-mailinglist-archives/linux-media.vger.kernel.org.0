Return-Path: <linux-media+bounces-47430-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B52E9C71EFF
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 04:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C97D74E403B
	for <lists+linux-media@lfdr.de>; Thu, 20 Nov 2025 03:14:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6260C2FBE0E;
	Thu, 20 Nov 2025 03:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dZYYE17r"
X-Original-To: linux-media@vger.kernel.org
Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013055.outbound.protection.outlook.com [40.107.162.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2999E26FA77
	for <linux-media@vger.kernel.org>; Thu, 20 Nov 2025 03:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763608462; cv=fail; b=fV0ELnKNJEMGh1A2wuNzByUVGEMcUD0hMm90SdrIfJQzxCk4GTkwPY5ic0c1e9rVjSGTlhr/CNRfrGfruVgIK4ijEJ3hUcCD1b8k5UEjTkJgoBE7P2hMht++augrzFkfHVTJbYY5ias0fIJIKkufqqlkRGkzxvgiRpdx75/xcgI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763608462; c=relaxed/simple;
	bh=+urfbD7CnId2N1mbIO/TAgcANyF1oK282jlzC+lHqLc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T4pCp932j0mRTCNGhuFulNVkYbwxcNLEmcQxP5AX2zOr49bVBGIQM2D+K6ZOv/ze39lGmOyYDNnbMPRt+epqcClUiCOykAIEUu2SpzyTv/m6lWQvoXeIrMN9/sFc9+eR9F+JwuTxE+Z4Uk1qWfAyNtbStkSZA4uDdzbWfApsW6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dZYYE17r; arc=fail smtp.client-ip=40.107.162.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLv4iWi6jtW4/6q4r7wWLaiDAgyUDqKDCWJTvIcpEO/fROWBfZDQ/ZIoTOab1FAkFuo6gcOSyUt3hZWm3InjgDo6FzJ9/+7aBLCaH3sf5yoHib0zceU0RRtUQv6oKNzdDI8Is4lEJjuTwLMexSy7iIBqMhuCLS06kWU0LEUuy5L4z4/MreFovHxt8wQNk7bLPCFycpcw7QSOr8y6PhBg+37PpbMeyoBhqqJbYEx9esleg8nSmR3Cwz2w1IH8RSA8GXmG+XqFyVzC1+LOpxEeY3XO7CPf0424ePHEdgUm58MVW1+zOPJpULPq18/QRCtfoEH55n9ajdhMt0Ohm4EqRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqjy6Ya1ehEgFRM7rnc64xGW4usu0O9nHhchAtsoS0I=;
 b=gCX6FTaWXvNAaXo+CzlFn09K1x1tsDE2gENMrcUqzx6nox2k4wJlpvB936GaS6smQ7kafNt5/ISkJ9cd/EQs9z+Z7yxPBqCP2zRHJzxjcCru/yrBqz4c6K1SlC3HUdFqUJhdYQd6wL7OHUyr6EoFrerPhbLcSJPPk4dAi1zgRlyqJXvTafwnrZkQFPP2VWPNj9r/7Wh8LCoSFFfOhs71WLCUACztK94YlS0eVstlEQBOU3/SJIO5lWVS2Cp54gLOlwUWJtzebZUuHVFl3XQv6zn0aOhqyft/MKZDoAg5mL/cXKAhlCEuXZW155r6VLimYvTk2FFRP3+41lavg1a4Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqjy6Ya1ehEgFRM7rnc64xGW4usu0O9nHhchAtsoS0I=;
 b=dZYYE17r6ciDyuMAeaX6Tr3fAb+dH3nRQ3naSzz8bapz2TZEiJgEIQMYnZU8nG2+2grg/XGkEvi4+7NvCNNQZesM+YNb/MLkOc0lMZqIBqN1UK7mH5r2OIYVda3FJxdPqrQGvFlozfFe+9Ku/9da2TSdGUdmAy0yHiQIpP74sOjlKpNsER81VYR8Ok9uRGEd0GbVZ4Z40n9DE3tV5bAusXwMBOQEVPLeX2JDZAWzBrJarP6tJMyPox5SloN1CyVH/lYdfeoLPmd6Sa0gF/mFzszWzWhCTYsjbIMZqbqW8s8slOQG1YDaK7hq9ocwZ8FsRBWf7qzOAbs7oMCWhsw27w==
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com (2603:10a6:20b:447::16)
 by PAXPR04MB8735.eurprd04.prod.outlook.com (2603:10a6:102:21f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Thu, 20 Nov
 2025 03:13:03 +0000
Received: from AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb]) by AS8PR04MB9080.eurprd04.prod.outlook.com
 ([fe80::92c2:2e03:bf99:68eb%6]) with mapi id 15.20.9343.009; Thu, 20 Nov 2025
 03:12:57 +0000
From: "G.N. Zhou" <guoniu.zhou@nxp.com>
To: Frank Li <frank.li@nxp.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Rui Miguel
 Silva <rmfrfs@gmail.com>, Martin Kepplinger <martink@posteo.de>, Purism
 Kernel Team <kernel@puri.sm>, Pengutronix Kernel Team
	<kernel@pengutronix.de>, "imx@lists.linux.dev" <imx@lists.linux.dev>, Stefan
 Klug <stefan.klug@ideasonboard.com>, Sakari Ailus <sakari.ailus@iki.fi>
Subject: RE: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel support
Thread-Topic: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel support
Thread-Index: AQHcUAZMC609j0oUu0S4ldtJEQpvR7T69D4A
Date: Thu, 20 Nov 2025 03:12:56 +0000
Message-ID:
 <AS8PR04MB90804FDFE5473E590A9570B9FAD4A@AS8PR04MB9080.eurprd04.prod.outlook.com>
References: <20251107015813.5834-1-laurent.pinchart@ideasonboard.com>
 <20251107015813.5834-7-laurent.pinchart@ideasonboard.com>
 <aQ4iwFHVoweNl/mS@lizhi-Precision-Tower-5810>
In-Reply-To: <aQ4iwFHVoweNl/mS@lizhi-Precision-Tower-5810>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR04MB9080:EE_|PAXPR04MB8735:EE_
x-ms-office365-filtering-correlation-id: e016f6db-20c6-4445-1fb8-08de27e2b407
x-ld-processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|376014|19092799006|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CnGrMIka9gFk/qnjGH0s8VTdCpB92b0JaVcWGyXzY2zOw1fzGx81k8j5/ZLI?=
 =?us-ascii?Q?P3CFf6xfwGntweh7uuNwa8F1GNJAXVouWpRS+KJA3yLxGBrSJMsCh0MXVjU1?=
 =?us-ascii?Q?GWmaDwl4p8YGZJfbjGupeDFCORhEIyWEtEs3N2ZICjubLVelSb7mX2Z9bJHM?=
 =?us-ascii?Q?l1CpVqpaEaRyIjucpZKr+RqHlo5DpBzA6ISDLTlAwIgaPCc+DUbvCW1mk2hq?=
 =?us-ascii?Q?F0ah6vbqYagAyJtgGEfcdawxdIs3t+i30Y1u6TZ+/2xEfXhGc5kmyqtKE9dG?=
 =?us-ascii?Q?6wM+regfDUP2X5QMJI6x9dR+kzp7hk0OdzPk917kLBFb1zD+y6nuCkrueNo5?=
 =?us-ascii?Q?xJ11j2u3baal24Lcm3JOSqNVEnHRO2xxlqlrvPK+v30b+bqzgMg5d5ageg0Q?=
 =?us-ascii?Q?BKKBGJ0/y90G9DDhMYB402ImTI/+luLrU4k8qMsITqm32ghEzMQ9FWqX6X1N?=
 =?us-ascii?Q?Q+ePJAXbrrpcGmPrk7s/aT2RYn4dCzdw5+euvTo11cno05Va41/jGqImcORl?=
 =?us-ascii?Q?27F7kNR6Kk3K6IzAXTbsJPhQ33DEZC/q0O6ZAgg84kzK1Sa/LZOG0NKiYpIO?=
 =?us-ascii?Q?qXgjSdFjD5+MNs3NgjRgfN5a8nJ82kD4duX1iyyeosNSDKsgu1jBDYPYEwBC?=
 =?us-ascii?Q?lT5M5kyeSQNI45AYBqshuKbopTePpk3SJU4IjCs6URnjUHWQ4ww3Hz91fxgG?=
 =?us-ascii?Q?g50HsCEMv98atrMerqseBDnjPpfns08aZTRePwmIiYSRs4ywii4pOns6hhjM?=
 =?us-ascii?Q?LAsdwIqnrQqc8uD/uH0dod22Zlvud/O3BdTkrPk5RWDPC6kOIggtcEIgp+YH?=
 =?us-ascii?Q?kh291u11gDcp1rI2Ghm2TpdPQsbnid1rABHplmdOVoyIEfuyq0g4VxKVagt9?=
 =?us-ascii?Q?siShpOeyGMxfQFACPnLnrXX5HUMVN8Xv0HCgJC38TRnfbuEZ1+Oi/GgMqbYb?=
 =?us-ascii?Q?8TNHZTrN/xHqMd33U88aZhnG4fLMJmtDTzbUdEbF+JkRwxSre/GpwN+VAUlU?=
 =?us-ascii?Q?TEPLRWlgV0CPYeK9kJA8k9Sv50WcXh9RmKmAOuM0zvhDQmf+aqK15h3VCXaj?=
 =?us-ascii?Q?LIQ/JApy68CWSX4u1plcf9O/uThqqBqdG8RH16SWUzksvMzGGCUs9N4mOci9?=
 =?us-ascii?Q?LRAX6oFzGse8Gta62/H6AGNHKEGtQWRy9zKvS3w6Qz7PzDZHWA3RrFv+x8Io?=
 =?us-ascii?Q?5ApEodbIRNUJSHr8elIIh4SmEGTyYFOc5AO0eXD+Y8giSWsVij4fvSCJHfmq?=
 =?us-ascii?Q?MVEFwwl6GdaLmUMgVbZm48EiQge9sCSPUJE1V+TOntE0GWe1jcKiwZ60sNzl?=
 =?us-ascii?Q?7x1bZk1omQXqPUsf/HCzhQoaP+/w1POdlak27f/12ekviDtm3koz9qN/TJ6c?=
 =?us-ascii?Q?7SCpwpEFRL2L4BUYS9rur/huPtBGW5L/vTTKfhk4Fag4oYQkJl0LewuUdkzo?=
 =?us-ascii?Q?9YFMMQxjfgWFMYBstqIGQnyntxIjQFB36fNTX0p90xca3xm5hXCmalMkNs/7?=
 =?us-ascii?Q?f7bEOTeJmO+hEDs6RQ10iOsfws9KbgHhoWAb?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB9080.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(19092799006)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?e3MeoMNVWbKom28fVm7sIOyES0VTSumVzXYRel8GGftRetGRhGFHvLnhK5r0?=
 =?us-ascii?Q?E+YT1SALBFo9oc2kC0yCJZJsqmRHbUNGZnJC+B84hgvubRnzosmMVCPo3bPw?=
 =?us-ascii?Q?40mqWh8BAaRs8Yr3TBrsZEkZdeoqDdMHbR6XwS51lPB3kagbh7Po2D4d9Jol?=
 =?us-ascii?Q?lHtnWJ4qTO0VHxqHbODVvuXs/AxxlNT/+nELlqrMKcLeE1JgTAiMkQQVRoX6?=
 =?us-ascii?Q?zARSvpk7B4fod3fb7awDjo6Ok8pecHP/3K7OFunqwyrLxql5GWNgISXgWuBf?=
 =?us-ascii?Q?56AhCx+R61wgD8PQNzTkTozoRm1glAjUJr0XRRuay6nSuxWIhCK/MGQztwTG?=
 =?us-ascii?Q?adObUMSx0f1SHwtrbXxt7Fmnu75RBPK1ZAPI0efoCPZ155X1mL5ax+Wzz2JE?=
 =?us-ascii?Q?ZasriqqPncrBP+igDhKoOkUILpfD+3lVwwWXAQZogy2su8rIvfOZR8ZTii7A?=
 =?us-ascii?Q?s08y1LaITUcxmmlb3R4Zg8LX/AH/eBHpExiAh1CTOImXYIjyxnBQ5blyjJt2?=
 =?us-ascii?Q?aKEOfdTTgJi6QVCFipiAN8Yg8RO2+VE4VEX7Vhl5zjDZedm3Xj+BOJA8bNiw?=
 =?us-ascii?Q?rJmyVepsu2sOD8SKa3YbVphdCjQSX1LqPWRBYN9pN59LCD5AHodjDrQl4X7+?=
 =?us-ascii?Q?QNl738Tj/VmH5FsDCccwIP0uDt5vao7H7VOIAN7kGDf2BrmGav6teX+gpS2+?=
 =?us-ascii?Q?bTVIt+3qd2ZMVMRE8grxXiHoUT0OY4YTkCWLSvhhMzypWgDNk/zFXFePyGbn?=
 =?us-ascii?Q?teFgwMOlj+/ob3raZ1Lbv4cxNyy9BhsB+dWC0u2ZZbZnQWVESkGhufarG0b0?=
 =?us-ascii?Q?Na2Mcebblc2NiGoL7f1F6PYnN+RqyeT7eKAbXwLBYQG0FJHxjVHcNp2bcoWW?=
 =?us-ascii?Q?/ZmSYlhXHvyJjz5/PItcbuouxYOZJu3oOGv0ax9VoeHOHGPD0knd3gUb4jNF?=
 =?us-ascii?Q?kh+FiWB/UGrY8wGXTt6EhKR9eg6pBgBm1/wB9OlV9VyfbKlxkMFR+THNbyhW?=
 =?us-ascii?Q?griCXiQ/2nlDDkbn2IGl80h7/jftfUn8MDPNB+W4o2MJIIUFyOohGR94SI/K?=
 =?us-ascii?Q?B7YehcLrO3ZTjyyt0hE1Jgvscs6p2yx0ntlqaS+xAmrX3gx9lsHRuWpN1vk/?=
 =?us-ascii?Q?XlHmUd2nviPW0f5yATnXBjif9dnO82iz78/1O+VmawWyFnGGnCLg3r/U3n/J?=
 =?us-ascii?Q?cq/3ahs1mVhg8kk+4vtqfX6/JGRsSpNwCuvytmz9JfTDAAND38td1YMj6hn0?=
 =?us-ascii?Q?h6+QterjGBc046PQVxTh72e76NIjBYnArgQCg4Fg4WlxADr+g50G58K9h8z6?=
 =?us-ascii?Q?PkWwic3ap66a7sOWMdPJHXEkPI/DVpczjE9ZGLcp2WfoYdzdxqQnD2/jvRWd?=
 =?us-ascii?Q?/FXF6YbDsuMabwNadRNu2TcP8OKVJJJiT7+zz3jnDjMt7EW2HwHbdXhTMYga?=
 =?us-ascii?Q?f55pWvvNq/vFv39yxw8rOT6e6axr8GDV22oVFFqK63XxI1naDHUlNnZkMFUo?=
 =?us-ascii?Q?/UePxVM5+HR87STrC6999g/Ck4StJkGsprIiy32HA882pY+0nOkzMGdzbrfg?=
 =?us-ascii?Q?/VBD3QppmqSTaxRd254=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB9080.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e016f6db-20c6-4445-1fb8-08de27e2b407
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Nov 2025 03:12:56.9494
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A40vBmOLVXUNAOxDlJ/xrszpJJqu07KzFBfJN5gw+kbV3GQ3xDuXhj/Lrcnf8ZlpNkmt9wHVF6cQb7MDwhvSRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8735

Hi Frank

> -----Original Message-----
> From: Frank Li <frank.li@nxp.com>
> Sent: Saturday, November 8, 2025 12:48 AM
> To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>; G.N. Zhou
> <guoniu.zhou@nxp.com>
> Cc: linux-media@vger.kernel.org; Rui Miguel Silva <rmfrfs@gmail.com>; Mar=
tin
> Kepplinger <martink@posteo.de>; Purism Kernel Team <kernel@puri.sm>;
> Pengutronix Kernel Team <kernel@pengutronix.de>; imx@lists.linux.dev;
> Stefan Klug <stefan.klug@ideasonboard.com>; Sakari Ailus <sakari.ailus@ik=
i.fi>
> Subject: Re: [PATCH v1 6/6] media: imx-mipi-csis: Add multi-channel suppo=
rt
>=20
> On Fri, Nov 07, 2025 at 03:58:13AM +0200, Laurent Pinchart wrote:
> > CSIS output channels can be used to demultiplex CSI-2 virtual
> > channels, and likely data types. While this feature is not clearly
> > documented, tests seem to indicate that each output channel includes
> > filters to select which VC and DT to output, with the filtering mode
> > being configured globally. Four modes are supported:
> >
> > - No filtering: all VCs and DTs are output on channel 0
> > - VC filtering: each channel filters out all but the configured VC, the
> >   DT is ignored
> > - DT filtering: each channel filters out all but the configured DT, the
> >   VC is ignored
> > - DT and VC filtering: each channel filters out all but the configured
> >   VC and DT
> >
> > Expose this feature to userspace through the streams API. The routing
> > table is expanded to support multiple routes, with the source stream
> > ID mapping to the output channel number. As the VC and DT values
> > corresponding to a stream are not known until they get queried from
> > the source, validation of the routes is postponed to stream enable
> > time in the mipi_csis_calculate_params() function that extract the
> > configuration of each output channel from the routing table. The
> > validation ensures that, when filtering is enabled, each output
> > channel is configured to output exactly one VC and one DT.
> >
> > When multiple streams are routed to the same output channel, the
> > output heights is the sum of the heights of all the streams. This is
> > implemented when propagating formats frim sink to source pads.
> >
> > Due to how the SoC glues together IP cores, multi-output operation in
> > the i.MX8MP is used only for the purpose of capturing multi-exposure
> > or multi-gain HDR streams from a camera sensor over different CSI-2
> > VCs and transmitting them to the ISP. The streams are stitched
> > together by the ISP and can't be captured individually. This has
> > allowed testing VC filtering but not DT filtering. For that reason,
> > multi-channel support is currently limited to VC filtering only.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>=20
> Add guoniu.zhou@nxp.com, patch itself look good, but I am not famillar wi=
th
> internal logic, Guoniu, can you help check it?

I searched the "Samsung MIPI_CSI-2_V3.6.3.1_User_Guide" and checked all
descriptions about its interleave_mode. There is no details about the inter=
nal
logic but according to the info in the User_Guide, I think Laurent's unders=
tanding
is correct.

>=20
> Frank
>=20
> > ---
> >  drivers/media/platform/nxp/imx-mipi-csis.c | 264
> > ++++++++++++++++++---
> >  1 file changed, 234 insertions(+), 30 deletions(-)
> >
> > diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c
> > b/drivers/media/platform/nxp/imx-mipi-csis.c
> > index d8c11223ed0a..b5c7ab7c541c 100644
> > --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> > +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> > @@ -12,6 +12,7 @@
> >   *
> >   */
> >
> > +#include <linux/bitops.h>
> >  #include <linux/clk.h>
> >  #include <linux/debugfs.h>
> >  #include <linux/delay.h>
> > @@ -334,7 +335,8 @@ struct mipi_csis_info {  };
> >
> >  struct mipi_csis_channel_params {
> > -	unsigned int data_type;
> > +	u16 vc_mask;
> > +	u16 data_type;
> >  	unsigned int width;
> >  	unsigned int height;
> >  };
> > @@ -343,6 +345,7 @@ struct mipi_csis_params {
> >  	u32 hs_settle;
> >  	u32 clk_settle;
> >
> > +	bool interleave_vc;
> >  	struct mipi_csis_channel_params
> channels[MIPI_CSIS_MAX_CHANNELS];
> > };
> >
> > @@ -626,7 +629,7 @@ static void mipi_csis_set_channel_params(struct
> mipi_csis_device *csis,
> >  		val |=3D MIPI_CSIS_ISPCFG_PIXEL_MODE_DUAL;
> >
> >  	val |=3D MIPI_CSIS_ISPCFG_DATAFORMAT(params->data_type);
> > -	val |=3D MIPI_CSIS_ISPCFG_VIRTUAL_CHANNEL(0);
> > +	val |=3D MIPI_CSIS_ISPCFG_VIRTUAL_CHANNEL(ffs(params->vc_mask) -
> 1);
> >
> >  	mipi_csis_write(csis, MIPI_CSIS_ISP_CONFIG_CH(channel), val);
> >
> > @@ -645,20 +648,148 @@ static int mipi_csis_calculate_params(struct
> mipi_csis_device *csis,
> >  				      const struct v4l2_subdev_state *state,
> >  				      struct mipi_csis_params *params)  {
> > -	const struct v4l2_mbus_framefmt *format;
> > -	const struct csis_pix_format *csis_fmt;
> > +	const struct csis_pix_format *csis_fmt =3D NULL;
> > +	struct v4l2_subdev_route *route;
> > +	struct v4l2_mbus_frame_desc fd;
> >  	s64 link_freq;
> >  	u32 lane_rate;
> > +	int ret;
> >
> > -	format =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SINK);
> > -	csis_fmt =3D find_csis_format(format->code);
> > +	memset(params, 0, sizeof(*params));
> >
> > -	params->channels[0].data_type =3D csis_fmt->data_type;
> > -	params->channels[0].width =3D format->width;
> > -	params->channels[0].height =3D format->height;
> > +	/*
> > +	 * Translate routing configuration to output channels parameters.
> > +	 *
> > +	 * The CSIS VC and DT handling is poorly documented. The device
> supports
> > +	 * a global "interleave mode" parameter in the CMN_CTRL register that
> > +	 * can be set to "VC and DT", "VC only", "DT only" or "CH0 only, no d=
ata
> > +	 * interleave". The ISP_CONFIG registers specify DT and VC values per
> > +	 * output channel.
> > +	 *
> > +	 * This can be interpreted as per-channel VC and DT filters, with the
> > +	 * filter type being configured globally and the VC and DT configured
> > +	 * per-channel. VC tests seem to corroborate this interpretation, but=
 DT
> > +	 * tests are yet to be performed.
> > +	 */
> > +	ret =3D v4l2_subdev_call(csis->source.sd, pad, get_frame_desc,
> > +			       csis->source.pad->index, &fd);
> > +	if (ret && ret !=3D -ENOIOCTLCMD) {
> > +		dev_err(csis->dev, "Failed to get source frame
> descriptors: %d\n", ret);
> > +		return ret;
> > +	}
> >
> > -	/* Calculate the line rate from the pixel rate. */
> > -	link_freq =3D v4l2_get_link_freq(csis->source.pad, csis_fmt->width,
> > +	if (ret =3D=3D -ENOIOCTLCMD) {
> > +		const struct v4l2_mbus_framefmt *format;
> > +
> > +		/*
> > +		 * The source doesn't report frame descriptors. Assume a single
> > +		 * stream on VC0.
> > +		 */
> > +		format =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SINK,
> 0);
> > +		if (!format)
> > +			return -EPIPE;
> > +
> > +		csis_fmt =3D find_csis_format(format->code);
> > +
> > +		fd.type =3D V4L2_MBUS_FRAME_DESC_TYPE_CSI2;
> > +		fd.num_entries =3D 1;
> > +		fd.entry[0].pixelcode =3D format->code;
> > +		fd.entry[0].bus.csi2.dt =3D csis_fmt->data_type;
> > +	}
> > +
> > +	/*
> > +	 * Translate sink streams to source streams and fill the channel
> > +	 * configuration vc_mask and data_type fields.
> > +	 */
> > +	for_each_active_route(&state->routing, route) {
> > +		struct mipi_csis_channel_params *channel =3D
> > +			&params->channels[route->source_stream];
> > +		const struct v4l2_mbus_frame_desc_entry *entry =3D NULL;
> > +
> > +		/*
> > +		 * Find the corresponding frame descriptor entry, to get the VC
> > +		 * and DT for the stream. Multiple entries may match the
> stream,
> > +		 * but they have to all report the same VC and DT, so we can
> > +		 * just use the first matching entry.
> > +		 */
> > +		for (unsigned int i =3D 0; i < fd.num_entries; ++i) {
> > +			if (fd.entry[i].stream =3D=3D route->sink_stream) {
> > +				entry =3D &fd.entry[i];
> > +				break;
> > +			}
> > +		}
> > +
> > +		if (!entry) {
> > +			dev_dbg(csis->dev, "No frame descriptor for
> stream %u\n",
> > +				route->sink_stream);
> > +			return -EPIPE;
> > +		}
> > +
> > +		/*
> > +		 * Routing constraint: all streams routed to the same output
> > +		 * channel need to have the same DT.
> > +		 */
> > +		if (channel->data_type &&
> > +		    channel->data_type !=3D entry->bus.csi2.dt) {
> > +			dev_dbg(csis->dev,
> > +				"DT mismatch on channel %u: stream %u DT
> 0x%02x !=3D 0x%02x\n",
> > +				route->source_stream, route->sink_stream,
> > +				entry->bus.csi2.dt, channel->data_type);
> > +			return -EPIPE;
> > +		}
> > +
> > +		/* Record the VC and DT for the output channel. */
> > +		channel->vc_mask |=3D BIT(entry->bus.csi2.vc);
> > +		channel->data_type =3D entry->bus.csi2.dt;
> > +
> > +		/*
> > +		 * If any output channel beside channel 0 is enabled, enable VC
> > +		 * interleave mode.
> > +		 */
> > +		if (route->source_stream > 0)
> > +			params->interleave_vc =3D true;
> > +	}
> > +
> > +	/*
> > +	 * Iterate over the enabled output channels to record the width and
> > +	 * height. Verify that the VC filtering matches the hardware
> > +	 * constraints.
> > +	 */
> > +	for (unsigned int i =3D 0; i < csis->num_channels; ++i) {
> > +		struct mipi_csis_channel_params *channel =3D &params-
> >channels[i];
> > +		const struct v4l2_mbus_framefmt *format;
> > +
> > +		if (!channel->vc_mask)
> > +			continue;
> > +
> > +		/*
> > +		 * In VC interleave mode, each output channel is limited to a
> > +		 * single VC.
> > +		 */
> > +		if (params->interleave_vc && hweight8(channel->vc_mask) !=3D
> 1) {
> > +			dev_dbg(csis->dev,
> > +				"Channel %u must output a single VCs\n", i);
> > +			return -EPIPE;
> > +		}
> > +
> > +		format =3D v4l2_subdev_state_get_format(state,
> CSIS_PAD_SOURCE, i);
> > +		if (!format) {
> > +			dev_dbg(csis->dev, "No format for source
> stream %u\n", i);
> > +			return -EPIPE;
> > +		}
> > +
> > +		channel->width =3D format->width;
> > +		channel->height =3D format->height;
> > +	}
> > +
> > +	/*
> > +	 * Calculate the line rate from the pixel rate. If the source support=
s
> > +	 * the .get_frame_desc() operation it has to implement the LINK_FREQ
> > +	 * control, as the link frequency can't be calculated from the pixel
> > +	 * rate with multiple streams having possibly different data types.
> > +	 */
> > +	link_freq =3D v4l2_get_link_freq(csis->source.pad,
> > +				       csis_fmt ? csis_fmt->width : 0,
> >  				       csis->bus.num_data_lanes * 2);
> >  	if (link_freq < 0) {
> >  		dev_err(csis->dev, "Unable to obtain link frequency: %d\n",
> @@
> > -704,6 +835,8 @@ static void mipi_csis_set_params(struct mipi_csis_devi=
ce
> *csis,
> >  				 const struct mipi_csis_params *params)  {
> >  	int lanes =3D csis->bus.num_data_lanes;
> > +	u32 cmn_ctrl =3D 0;
> > +	u32 clk_ctrl =3D 0;
> >  	u32 val;
> >
> >  	val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL); @@ -714,19 +847,32
> > @@ static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >
> >  	if (csis->info->version =3D=3D MIPI_CSIS_V3_3)
> >  		val |=3D MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_DT;
> > +	if (params->interleave_vc)
> > +		val |=3D MIPI_CSIS_CMN_CTRL_INTERLEAVE_MODE_VC;
> >
> >  	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val);
> >
> > -	mipi_csis_set_channel_params(csis, 0, &params->channels[0]);
> > +	for (unsigned int i =3D 0; i < csis->num_channels; ++i) {
> > +		const struct mipi_csis_channel_params *channel =3D
> > +			&params->channels[i];
> > +
> > +		if (!channel->vc_mask)
> > +			continue;
> > +
> > +		mipi_csis_set_channel_params(csis, i, channel);
> > +
> > +		cmn_ctrl |=3D MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(i);
> > +		clk_ctrl |=3D MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(i, 15)
> > +			 |  MIPI_CSIS_CLK_CTRL_WCLK_SRC(i);
> > +	}
> >
> >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_CMN_CTRL,
> >  			MIPI_CSIS_DPHY_CMN_CTRL_HSSETTLE(params-
> >hs_settle) |
> >  			MIPI_CSIS_DPHY_CMN_CTRL_CLKSETTLE(params-
> >clk_settle));
> >
> >  	val =3D mipi_csis_read(csis, MIPI_CSIS_CLK_CTRL);
> > -	val |=3D MIPI_CSIS_CLK_CTRL_WCLK_SRC(0);
> > -	val |=3D MIPI_CSIS_CLK_CTRL_CLKGATE_TRAIL(0, 15);
> >  	val &=3D ~MIPI_CSIS_CLK_CTRL_CLKGATE_EN_MASK;
> > +	val |=3D clk_ctrl;
> >  	mipi_csis_write(csis, MIPI_CSIS_CLK_CTRL, val);
> >
> >  	mipi_csis_write(csis, MIPI_CSIS_DPHY_BCTRL_L, @@ -741,8 +887,7
> @@
> > static void mipi_csis_set_params(struct mipi_csis_device *csis,
> >
> >  	/* Update the shadow register. */
> >  	val =3D mipi_csis_read(csis, MIPI_CSIS_CMN_CTRL);
> > -	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL,
> > -			val | MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW(0) |
> > +	mipi_csis_write(csis, MIPI_CSIS_CMN_CTRL, val | cmn_ctrl |
> >  			MIPI_CSIS_CMN_CTRL_UPDATE_SHADOW_CTRL);
> >  }
> >
> > @@ -1053,7 +1198,7 @@ static int mipi_csis_enum_mbus_code(struct
> v4l2_subdev *sd,
> >  		if (code->index > 0)
> >  			return -EINVAL;
> >
> > -		fmt =3D v4l2_subdev_state_get_format(state, code->pad);
> > +		fmt =3D v4l2_subdev_state_get_format(state, code->pad, code-
> >stream);
> >  		code->code =3D fmt->code;
> >  		return 0;
> >  	}
> > @@ -1069,10 +1214,57 @@ static int mipi_csis_enum_mbus_code(struct
> v4l2_subdev *sd,
> >  	return 0;
> >  }
> >
> > +static void mipi_csis_propagate_formats(struct mipi_csis_device *csis,
> > +					struct v4l2_subdev_state *state) {
> > +	const struct v4l2_mbus_framefmt
> *channels[MIPI_CSIS_MAX_CHANNELS] =3D { };
> > +	struct v4l2_subdev_route *route;
> > +
> > +	for_each_active_route(&state->routing, route) {
> > +		const struct csis_pix_format *csis_fmt;
> > +		struct v4l2_mbus_framefmt *sink_fmt;
> > +		struct v4l2_mbus_framefmt *src_fmt;
> > +
> > +		sink_fmt =3D v4l2_subdev_state_get_format(state,
> CSIS_PAD_SINK,
> > +							route->sink_stream);
> > +		src_fmt =3D v4l2_subdev_state_get_format(state,
> CSIS_PAD_SOURCE,
> > +						       route->source_stream);
> > +
> > +		csis_fmt =3D find_csis_format(sink_fmt->code);
> > +
> > +		/*
> > +		 * If the output channel corresponding to this source stream
> > +		 * isn't associated with a sink stream yet, simply propagate the
> > +		 * format from sink stream to source stream and associate the
> > +		 * sink stream with the channel.
> > +		 *
> > +		 * Otherwise, the sink stream format must match the primary
> sink
> > +		 * stream associated with the channel except for the height
> that
> > +		 * can be different. We propagate the format from the primary
> to
> > +		 * secondary sink stream, and accumulate the height in the
> > +		 * source stream format.
> > +		 */
> > +		if (!channels[route->source_stream]) {
> > +			*src_fmt =3D *sink_fmt;
> > +			src_fmt->code =3D csis_fmt->output;
> > +
> > +			channels[route->source_stream] =3D sink_fmt;
> > +		} else {
> > +			unsigned int height =3D sink_fmt->height;
> > +
> > +			*sink_fmt =3D *channels[route->source_stream];
> > +			sink_fmt->height =3D height;
> > +
> > +			src_fmt->height +=3D sink_fmt->height;
> > +		}
> > +	}
> > +}
> > +
> >  static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> >  			     struct v4l2_subdev_state *state,
> >  			     struct v4l2_subdev_format *sdformat)  {
> > +	struct mipi_csis_device *csis =3D sd_to_mipi_csis_device(sd);
> >  	const struct csis_pix_format *csis_fmt;
> >  	struct v4l2_mbus_framefmt *fmt;
> >  	unsigned int align;
> > @@ -1120,7 +1312,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev
> *sd,
> >  			      &sdformat->format.height, 1,
> >  			      CSIS_MAX_PIX_HEIGHT, 0, 0);
> >
> > -	fmt =3D v4l2_subdev_state_get_format(state, sdformat->pad);
> > +	fmt =3D v4l2_subdev_state_get_format(state, sdformat->pad,
> > +					   sdformat->stream);
> >
> >  	fmt->code =3D csis_fmt->code;
> >  	fmt->width =3D sdformat->format.width; @@ -1133,12 +1326,8 @@
> static
> > int mipi_csis_set_fmt(struct v4l2_subdev *sd,
> >
> >  	sdformat->format =3D *fmt;
> >
> > -	/* Propagate the format from sink to source. */
> > -	fmt =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
> > -	*fmt =3D sdformat->format;
> > -
> > -	/* The format on the source pad might change due to unpacking. */
> > -	fmt->code =3D csis_fmt->output;
> > +	/* Propagate the format. */
> > +	mipi_csis_propagate_formats(csis, state);
> >
> >  	return 0;
> >  }
> > @@ -1155,7 +1344,7 @@ static int mipi_csis_get_frame_desc(struct
> v4l2_subdev *sd, unsigned int pad,
> >  		return -EINVAL;
> >
> >  	state =3D v4l2_subdev_lock_and_get_active_state(sd);
> > -	fmt =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
> > +	fmt =3D v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE, 0);
> >  	csis_fmt =3D find_csis_format(fmt->code);
> >  	v4l2_subdev_unlock_state(state);
> >
> > @@ -1187,6 +1376,8 @@ static int __mipi_csis_set_routing(struct
> v4l2_subdev *sd,
> >  		.quantization =3D V4L2_QUANTIZATION_LIM_RANGE,
> >  		.xfer_func =3D V4L2_XFER_FUNC_SRGB,
> >  	};
> > +	struct mipi_csis_device *csis =3D sd_to_mipi_csis_device(sd);
> > +	struct v4l2_subdev_route *route;
> >  	int ret;
> >
> >  	ret =3D v4l2_subdev_routing_validate(sd, routing, @@ -1194,15
> +1385,27
> > @@ static int __mipi_csis_set_routing(struct v4l2_subdev *sd,
> >  	if (ret)
> >  		return ret;
> >
> > -	/* Only a single route is supported for now. */
> > -	if (routing->num_routes !=3D 1 ||
> > -	    !(routing->routes[0].flags & V4L2_SUBDEV_ROUTE_FL_ACTIVE))
> > -		return -EINVAL;
> > +	/*
> > +	 * The source stream identifies the output channel. Validate that it
> > +	 * does not exceed the number of channels available in the device. Th=
e
> > +	 * other routing constraints can't be validated now as they require
> > +	 * querying the frame descriptor on the sink side, which can only be
> > +	 * done when enabling streaming.
> > +	 */
> > +	for_each_active_route(routing, route) {
> > +		if (route->source_stream >=3D csis->num_channels) {
> > +			dev_dbg(csis->dev, "Invalid source stream %u",
> > +				route->source_stream);
> > +			return -EINVAL;
> > +		}
> > +	}
> >
> >  	ret =3D v4l2_subdev_set_routing_with_fmt(sd, state, routing, &format)=
;
> >  	if (ret)
> >  		return ret;
> >
> > +	mipi_csis_propagate_formats(csis, state);
> > +
> >  	return 0;
> >  }
> >
> > @@ -1554,7 +1757,8 @@ static int mipi_csis_subdev_init(struct
> mipi_csis_device *csis)
> >  	snprintf(sd->name, sizeof(sd->name), "csis-%s",
> >  		 dev_name(csis->dev));
> >
> > -	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> V4L2_SUBDEV_FL_HAS_EVENTS;
> > +	sd->flags |=3D V4L2_SUBDEV_FL_HAS_DEVNODE |
> V4L2_SUBDEV_FL_HAS_EVENTS
> > +		  |  V4L2_SUBDEV_FL_STREAMS;
> >  	sd->ctrl_handler =3D NULL;
> >
> >  	sd->entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > --
> > Regards,
> >
> > Laurent Pinchart
> >

