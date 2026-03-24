Return-Path: <linux-media+bounces-56883-lists+linux-media=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-media@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YF5WO12VwmkXfAQAu9opvQ
	(envelope-from <linux-media+bounces-56883-lists+linux-media=lfdr.de@vger.kernel.org>)
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:45:01 +0100
X-Original-To: lists+linux-media@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CD46309A47
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 14:45:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E33133041791
	for <lists+linux-media@lfdr.de>; Tue, 24 Mar 2026 13:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 345BD3FD12B;
	Tue, 24 Mar 2026 13:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b="dybfMZac"
X-Original-To: linux-media@vger.kernel.org
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011042.outbound.protection.outlook.com [40.107.130.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F3F3FCB2F;
	Tue, 24 Mar 2026 13:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359537; cv=fail; b=BN3YqRWUiMhgPP4x7lSVC4nl2u1ZQuIaMa3ThJ8W5/KEPUmwFaShMk/qrEHNFzROKF0e369Q2KPugggdpzm8w73GzQvKcRjtpTbkhVmERymwel6SRLIJRbi3JkIo4Kbqpf5oC835GHHo0B5eQ52CEr3wKybhVJu4Gyz0vcR7fm8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359537; c=relaxed/simple;
	bh=/Ug7oh8pfxB9P7ib0yK8FcxOWgYbDgWXvwzsE3H8HqA=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=FhlV9jwOafedEdbw926CEvs93PwMVCtosI/Wogv7xFgTkRDLUxOX7/SxTDQ5jkGneOBULwP8hg0xZ0HEi//MyWVPsJ1J8+lEt1uqQkDNDCWDpQZkZCnhbgT078jGzEXgM7WYMzaXQQHDwcmvgXktTqmGLPfIDJ0tzEsI6KqfOG8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass smtp.mailfrom=nxp.com; dkim=pass (2048-bit key) header.d=nxp.com header.i=@nxp.com header.b=dybfMZac; arc=fail smtp.client-ip=40.107.130.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nxp.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Owujy0GBrqyYmOvbhydBCukId2WUiY10Jg5hj4DgDkni2pssuTAC0U4d7YNLTmbP5Mp/vyscD8dM9rDFhwkLiD72h9VwoFHb8yN8+iwHaELIomLaNo8dHTzht7gQDyRuVxcLfRKEOhq/Yja10zfK9bolfuQ+aE0kvHn0Als1BeXJd73NtCaUATRn7DFc9sq8ZY7RiuALc0V2GVJi7b6tsNZ/8U3MwJE63q1Zpkt8R+Qa6hLWybYisbn7xtrQn6j13wlTHu9+F/aInlkxBFnwPSSFuMgCejsIkka+0cuiQOYXsx7XmyyfBw6CX1sSqoqHO+F+2sPbeXkxjYLPPsuEYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kRYXTjj+3jPX90p8mHql8nyjSkBSP31fZ6f8r/c/zqs=;
 b=w+LzZFYltlLnqkh1JLkskyLiF6WKf8uJ+kYWelU09UEJxMZg6QyEZzwPjlEUVqhv95srimic/cvuWvc5ZYLt7qdknR4zpfzEDCg1JmbiBmRByRcHxM82j+cBX0PAakCbSk0pzxIuxsDJ3lOrkSK4gzvyyl86eY3eimwsfeQyVjHRlCSa+Mz05yCoFoEEy7Q4emUao/tjH2Ld/ElApIJR4TGhq7Rsxqx3OQ62uC58QFpl41FAlsC5WeOQ7EMMf0YQM0GV91Gm//CP36fYQol/BI29lhsk+zCE9bjVqSy3wOkXvghCmZtFVkMTyXA+Nou/U+Tep2IAPD4bwEC2kbth0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kRYXTjj+3jPX90p8mHql8nyjSkBSP31fZ6f8r/c/zqs=;
 b=dybfMZac1vy2bxgv4zZOrHGtxHsXwVhEjbfkPouHq4ZYmuE8kJtV+AazPLuEyhRTZ+No2jEZHfGzBNY4enPXwZyOLCmMtyvI/hrmluJD/eWd/VpXeYeMDjRhMROLi8XwZA/F/gylCNNWJ5zJoJ8S9Cq01TOw9i6uMdl3/4Q5FOqMBFGgksXXSoNcSdwvYo15g4VSOFsCyaAkg3D2OsDwQTihpSU5uh8syilTiOvIK8HdpAfjgI7TKRSvpIxNiie1m2lXq8XYpHsOrOK7GfF7SrpJmmIFNuiGdyj/2ZnZCbS8QaXq01FU4bTkTkmys6PhyfHrxhFFeEX+c4Wth7Roig==
Received: from PAXPR04MB9424.eurprd04.prod.outlook.com (2603:10a6:102:2b2::13)
 by PA4PR04MB7615.eurprd04.prod.outlook.com (2603:10a6:102:e6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Tue, 24 Mar
 2026 13:38:51 +0000
Received: from PAXPR04MB9424.eurprd04.prod.outlook.com
 ([fe80::671d:216f:d493:44ce]) by PAXPR04MB9424.eurprd04.prod.outlook.com
 ([fe80::671d:216f:d493:44ce%4]) with mapi id 15.20.9723.022; Tue, 24 Mar 2026
 13:38:41 +0000
From: Ioana Ciocoi Radulescu <ruxandra.radulescu@nxp.com>
To: Frank Li <frank.li@nxp.com>, Oded Gabbay <ogabbay@kernel.org>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Sumit Semwal
	<sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
	<shawnguo@kernel.org>, =?iso-8859-1?Q?Christian_K=F6nig?=
	<christian.koenig@amd.com>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, Jiwei Fu <jiwei.fu@nxp.com>, Forrest Shi
	<xuelin.shi@nxp.com>, Alexandru Iulian Taran <alexandru.taran@nxp.com>,
	Daniel Baluta <daniel.baluta@nxp.com>
Subject: RE: [PATCH v2 7/9] accel/neutron: Add job submission IOCTL
Thread-Topic: [PATCH v2 7/9] accel/neutron: Add job submission IOCTL
Thread-Index: AQHcrW0YA6y3SKZzMUyWigJjqVStgrWhu08AgBwQhwA=
Date: Tue, 24 Mar 2026 13:38:41 +0000
Message-ID:
 <PAXPR04MB94245DA907F655FDA17C74989448A@PAXPR04MB9424.eurprd04.prod.outlook.com>
References: <20260306-neutron-v2-7-3019bd8c91ef@nxp.com>
 <20260306170259.296712-1-Frank.Li@nxp.com>
In-Reply-To: <20260306170259.296712-1-Frank.Li@nxp.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR04MB9424:EE_|PA4PR04MB7615:EE_
x-ms-office365-filtering-correlation-id: ccc4f24a-4324-47df-0c8c-08de89aaa97f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|19092799006|376014|7416014|38070700021|921020|22082099003|18002099003|56012099003;
x-microsoft-antispam-message-info:
 c6vwratmFieNo/ABtarMaf5IjMiIXGbYog1TVv/Fn6d9KgopkZfro2+MqAy9rnYbbYnwjCURvIUT2RjB02+2Bqg4wfytvg0pc3J8SZd0VxAehsdsn9sQA4/DKDivf6VHmYs7zTJ/PgEQkRggD+JGBEr7WNnbRR3la3t3dkd8gXk/FEWWLvbDA0hyQr9NHCcvB6gti2N+CYDbSzNVM744NodlA1LWmh78MLj3MWa1/nZ1VUDnfvkLuNS/BBqh9O2/0330i5pyA2Xrvcz7RtxctsnRCkqZjRCHiJhxYxG+n6XAm16RyIUt4gxJkYFht+Cb+McD5LEXNsk0cP0Sbx0sPFhZijpinh4TpLwukuoHhMcMSTiB1MgEvGeyweNFGM2E8hmuRdyVFwq79qk4UxJ+FkIzPZPHJzA8c1oaX7AorPRDWmGScLeBEuSw5XcokTcTdy8DaWzPKfj5MN9nn3ciVA53i1X4fE4yKp/wNoeKQwxfmVEIQIh/ndRbGpFhwn/JlQqdUX+wIHxEperYPt1VFgf1lEPpXfPTH9bpw7tV8Sl1gGiHqM418lwD7ZOJlFjdgKGBNnbzszoggEmScg15wEPeb3VgauHTRGUhxK5la5r428aiX+lcjLZkQreQ1QJSSAGfIMqvqOJ0ETOZq4BOTXZOir1i/epHFqdFU7IHU91mgRSQQ78TjqjlqeOZLwtKIaq9ACEyEVzcI4KO9UlL9GzYSjFN7iJs6b6iF8rKhl5UKe1w055xu9vQHsVg2nSn7kHC5lYf6WOvJxNdsPXRbcVL/2h//E5/RZVZzuguxOvode7fEkL/7+ZkY6SleFbJ
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9424.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(376014)(7416014)(38070700021)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?wDa4lD8BYAumg1dtIH53faKrFmAz5M8Slw24DogzV+nhphOW0w4WFUGP25?=
 =?iso-8859-1?Q?w17cpMrGHAin+bO2837F2PJD7cAYCdHOQW8aTwhURdfPU9ZZSIAhWH/Bf4?=
 =?iso-8859-1?Q?r5+AjaWOVllvLe2Sb7GSir+Kykf3wRtEd8TsMC3GJJu3019SpBVOpWLfI6?=
 =?iso-8859-1?Q?z6AFmL4VfomDbQGkx7sS/1UUCExIeB6T7zVjizGV7omyixCeVPlWpdHQz5?=
 =?iso-8859-1?Q?AmxOyPSjnlUTjP2cpcqDYJXKPKasKi8YSHB45++jW5FL/g7eYggSDwk6Dq?=
 =?iso-8859-1?Q?lm5ObPnvCXkdRJvd6RmJsH9NGx0pWhnkgSoRMpYOzZdnx1B+AdZ1L9/qy5?=
 =?iso-8859-1?Q?qz4Qfb5W8FaQVLyy4VzQy4fhp6mab144IWrxzzhxZfEGANjeDHTU1omBc2?=
 =?iso-8859-1?Q?X8/jAzZeI/z2JjsKDk36LtJWN8e8hdjTHQurUXJ4fRkdr/fT/Mzv0nEMNj?=
 =?iso-8859-1?Q?7a6SFWC8dH89LMrFaosZDSaagZskROtkVnOeFjktoNeZGNa2Ze3hCkm5xf?=
 =?iso-8859-1?Q?5gqcqdyni6HWo0CtXqpDULgowGQkAIhAC4fbkASSv4nHt2264p3iX9k3H2?=
 =?iso-8859-1?Q?sDlbTQg0EdgLuQAAAMZjSQCLildP9PXboFXDLnpA8w344SRY7DsHlAZNwz?=
 =?iso-8859-1?Q?tTOTt4g7DcnvD2XIn+rlAjX1RNKEQHfOI/zPy6dAGV6FTEeQnK8h6HqFau?=
 =?iso-8859-1?Q?hV6d6ItVW6hrjO7wKFlGa4/8KieWp/09uwwgK1FY9IqayyPw/VpkYmMlZ5?=
 =?iso-8859-1?Q?f6m9lc9XR8aeT/013IRYfJ+ctI6dfXa/EIs5EBleZ2tgq/oziaD0ljczCa?=
 =?iso-8859-1?Q?1uSa4rd8Mzj26dvarCpvxjYg1cg0riP0n/L6D+v+6ZisuwRewtMa3qWsa2?=
 =?iso-8859-1?Q?wHtmfBpyx73SGaTw4gjQ0zf1bCDfsVkOQ3VufaSXC9/H8bnLbcHgxmHzjL?=
 =?iso-8859-1?Q?rkFGWmhmbDVOyTdyyoOIWDoU/HYNdePvj9Rj2UECGBmp7L2elJQeps3AqJ?=
 =?iso-8859-1?Q?YKWUnuTJzMjzmB6ZpLuHWC8fR/4Mk6eVQAjA9uGEw5LNiptwi/1VRVQz0q?=
 =?iso-8859-1?Q?CrXVN92DC7zYxxoSYVAT1e/hzI9f3i1UJiWNxVltvbQZFLyUNDaHe3zwmL?=
 =?iso-8859-1?Q?5+6M5FnGM4COtsw622TLPgSomcsKX2MDnhSYZpku7BfX//LYH0mWK4krsR?=
 =?iso-8859-1?Q?fFKuj2AGLIHUGRu01lxg0TGMLrZG1GHuUE+XdVH5u9XiTqmCBl2pYr4R/r?=
 =?iso-8859-1?Q?88EhsUukSU29lCLcaqP4zIkctXc8VgCtxVmvRLm6vmG/Up2c/Z6p6/y47T?=
 =?iso-8859-1?Q?UyXhPAcbccyImkUUHs0llvcTdwKidv6lybt0F5a1DJ/nIxX5N6aLfi4wwa?=
 =?iso-8859-1?Q?899FfvlEg2pAsVUr7Bwi+5U+KY9h0p46h/dpxYpyjYWDiIVDPXepXpMnar?=
 =?iso-8859-1?Q?Vh+Mbk221RZLQzsjODBlSTap5jywLwkkEw17nqT/Y+Zz/f+KJhndO29I35?=
 =?iso-8859-1?Q?5zFvVLQdntQ/49J22kQIK2DK5V7boHlzJ+UpS2GQANZ/LJKy2bxJL2sNTQ?=
 =?iso-8859-1?Q?s0ps8PsQ73/c9MUQ7bQXEsCtUgw8AUuwIGCLZ0VyITgZOrIlZgL/xX9bwh?=
 =?iso-8859-1?Q?ZPET1GQencNXWKtQ9fyb8EMfR2WzCoKr5RGmNtHE45HvKQJZ2Tj0Z3jFw/?=
 =?iso-8859-1?Q?8Y96SXGrVUq33Wy75x94IDx631sNSJAOsaBOAH3NLDgbELEKY3wau12YTt?=
 =?iso-8859-1?Q?LX+tdDxHK77Ms6Oat+c2I7EzHYYWnLCxX653jR6Q7a1WwI1mHr2MEr2vgG?=
 =?iso-8859-1?Q?6N2IhntCEQ=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9424.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc4f24a-4324-47df-0c8c-08de89aaa97f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2026 13:38:41.3903
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: HO9d+AE++cERBK2NmnPw+eANJZ7qwD89wk1YoJX6Pmhi6ZIr0r6v5v//hsfRwwwROaaX/1PiMctxovwzr6/DIYMI0pCR2WofHy52Ey1S9fE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7615
X-Spamd-Result: default: False [1.34 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[nxp.com,none];
	R_DKIM_ALLOW(-0.20)[nxp.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-56883-lists,linux-media=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ruxandra.radulescu@nxp.com,linux-media@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[nxp.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-media,dt];
	NEURAL_HAM(-0.00)[-1.000];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,PAXPR04MB9424.eurprd04.prod.outlook.com:mid,nxp.com:dkim]
X-Rspamd-Queue-Id: 8CD46309A47
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Friday, March 6, 2026 at 7:03 PM, Frank Li wrote:
> > +	if (appstatus & APPSTATUS_FAULTCAUSE_MASK) {
> > +		dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\n",
> > +			FIELD_GET(APPSTATUS_FAULTCAUSE_MASK,
> appstatus));
> > +		return neutron_job_err_handler(ndev);
>=20
> AI: neutron_job_err_handler() returns void, not int. Remove 'return'.

Ok, will fix.

>=20
> > +	ret =3D drm_sched_job_init(&job->base, &npriv->sched_entity, 1, NULL,
> > +				 filp->client_id);
> > +	if (ret)
> > +		goto out_put_syncobj;
> > +
> > +	ret =3D neutron_push_job(job, syncobj);
> > +	if (ret)
> > +		goto out_sched_cleanup;
> > +
> > +	neutron_put_job(job);
> > +	drm_syncobj_put(syncobj);
> > +
> > +	return 0;
> > +
> > +out_sched_cleanup:
> > +	drm_sched_job_cleanup(&job->base);
> > +out_put_syncobj:
> > +	drm_syncobj_put(syncobj);
> > +out_put_gem:
> > +	drm_gem_object_put(job->bo);
>=20
> AI: In the success path, neutron_put_job(job) is called which decrements
> refcnt. But if neutron_push_job() fails and we hit out_sched_cleanup, the=
 job
> refcnt is never decremented. This leaks the job structure.
> Consider: if neutron_push_job() succeeds, it calls kref_get() inside sche=
d_lock.
> If it fails, no kref_get() happens, so don't call
>=20
> (Need owner do judgment. Not sure if AI said correctly.)

I don't see an issue here, kref_get() is called at a point where
neutron_push_job() can't fail anymore. And if neutron_push_job() fails
earlier, error path looks clean, it frees everything in reverse order,
including the job struct.

Btw, what agent did you use for review?

Thanks,
Ioana

>=20
> Frank

