Return-Path: <linux-media+bounces-10595-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE718B9970
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 12:50:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 770C4B23215
	for <lists+linux-media@lfdr.de>; Thu,  2 May 2024 10:50:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B3FCE5D903;
	Thu,  2 May 2024 10:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="LuoIxQGZ"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2047.outbound.protection.outlook.com [40.107.113.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B5517984;
	Thu,  2 May 2024 10:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714646996; cv=fail; b=S9YArLSZ26Fs6D9BcgCONSS/YuE2bqBtDtUzqPERWVxZsv+c0Rq3Gg06O94gqF1+8owFcYuuqsZ0nLCRn2G2jMbPqcNh3xyjk2tmSwgserlYExRlULa2XG7QOxG2uu+4HdrlHJX+qeaSGYOALotrXCmnQR1Cj4ZRRiuJ8+pp2xs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714646996; c=relaxed/simple;
	bh=keZFVWBlYxoxh64eqliFm4Xz2p9py2wPMu8Cj5bCs5I=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=LmW5wmpGQm8n73sriup5UqnyiwxdtGhh3NA5KeJDA6V0u9OnX7ppSF1F/dKYY1tTzt42YBwz0vPNMTFpcMLMR2PBNuwVFSxVHGBeg+8466JYLX3+pO/TXvG5a1ykh1QGmIq6tWnTxy4Fw+bV6+75BWuCWZ2LYdby60ciuAU4rfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=LuoIxQGZ; arc=fail smtp.client-ip=40.107.113.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YPrydpgHNJneUxqMy0C1DH7JZ5PX3SyAdChADfF1DgxICqxmMzkL/z5LkAPtsDy/xuHQxnTp1bLt5sa3vmn5nEG3ORJPbBYFc6QtoH3cKZZBny5mi/VXKIyr38QUBJ2IkgfF8vuXSomETNnqSMnqBSGvTSJy+0apQ7+TOR3VrT16aLqkF0wTp423OWxCfLxEKy0Br2WW+MiGNQ3JrZVX4eqxJcAeXeKo3KkcgFhWTajLieAMwLSoutBOuAih4nRXPXegfCxBPR7fEdFt3+RE+28eVTPpWwp9d0xcD3BsLhYemkFtTgJdAPuBpwt3vmz5iyBmwPs66M0lT+DZcyw19A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ow9yx27epie+4IUP4QYfXlV2EwWyNwakcOHNNXBmLJ0=;
 b=PJHG1qbuR1fBkzoAKThelMYbdP28JUji70t/FaA95i0hiHTN34ndTDoaQHwLQplzsOoD0whfMVR8Tg+aB7IIZFCr6/Yk9fj9AQl7AC7jYVvg2Sa1p3EL5Dey+t0bRcJI3gAnpuBt8me77gOGuwR64teNpTABwWwXrVJPhb90CRreLeJiL1ELk3YgD9EW0WXKDi+y5vH/XO3sVeLwfrUuF1r7H0e3kOrHdgC/OnlSrsh67620XxgIcVvkkZoMJdHA4OuRvE9YHukTiFyifF1hsEzVooYMJ7CCOz7q489ugoo/Q9vZRK6AXiA0EzfjrjFiUJ7DUeloJhCZKFMgvPWV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ow9yx27epie+4IUP4QYfXlV2EwWyNwakcOHNNXBmLJ0=;
 b=LuoIxQGZVlisA2cs5mVgmcYLmwFP5pMKG6Y8OXxJ4WYfTsif1DSOhOUKF35dI3qrTeUEXNPNTNx1H5FTrPNhHZfhrhXnK4yIa1ButmWTp8omfkhURmhPzRgd7Gz6iqBekDTXHGQH/Cq+L+rN4l7y5n5XPI3uwplP/cpOS9t2psQ=
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com (2603:1096:400:3c0::7)
 by TYCPR01MB6430.jpnprd01.prod.outlook.com (2603:1096:400:99::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7544.30; Thu, 2 May
 2024 10:49:47 +0000
Received: from TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479]) by TYCPR01MB11332.jpnprd01.prod.outlook.com
 ([fe80::7497:30af:3081:1479%5]) with mapi id 15.20.7544.029; Thu, 2 May 2024
 10:49:47 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>
CC: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm
	<magnus.damm@gmail.com>, Prabhakar Mahadev Lad
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "devicetree@vger.kernel.org"
	<devicetree@vger.kernel.org>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>, biju.das.au <biju.das.au@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: RE: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Thread-Topic: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document
 Renesas RZ/G2UL CSI-2 block
Thread-Index: AQHaXokbVPxFqmIFPk+fhu0S7UxUIrGEP5JQ
Date: Thu, 2 May 2024 10:49:47 +0000
Message-ID:
 <TYCPR01MB1133274126C782BFECF1F145A86182@TYCPR01MB11332.jpnprd01.prod.outlook.com>
References: <20240213142941.161217-1-biju.das.jz@bp.renesas.com>
 <20240213142941.161217-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240213142941.161217-2-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11332:EE_|TYCPR01MB6430:EE_
x-ms-office365-filtering-correlation-id: f9f8c646-1a9c-4ee9-4376-08dc6a9595e8
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230031|366007|7416005|376005|1800799015|38070700009;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4IJNAVehamfwCvGkv/0ozGPNGNLsbnWN6KdMvtr79c4DmC+eFzjPICcFswyx?=
 =?us-ascii?Q?UImNHt9KiqOCp/TlmBeNHx6bukLyiIp3qgS77YgGuiA0kv2Lk1LCZjNr2mDj?=
 =?us-ascii?Q?MaEwSrF1Sj+hXhN+8Q+swk8tlp1gct99Cm37dHeLovqvNMh+uU1kET1Q2F2y?=
 =?us-ascii?Q?iiY+yvaxHrdK5Arw5m+6RiergGQWDrxL3POn7o0vxR+ROKX3bX9YKcLfEAoX?=
 =?us-ascii?Q?6qjtNQhSKSCZgGyg4I3XUi5wh2SH9H3MaUOneDDIdt9oqz4LP9ieHOJiHVuq?=
 =?us-ascii?Q?kUi98lz1w6Kc/+a9XC+angszE5ujT2bQPmlWXuKKGovHfWGR8Gkvc14AmQpu?=
 =?us-ascii?Q?frEpGlMG1lYMVp2yI8v7+tbyrP6SR7z574cxrcJrZRlyiUgv75xjMAbwJ6EW?=
 =?us-ascii?Q?ARBLnfItK/wRJ9hQCDjPYlTPa+gsyHoJlCslbs7CGO8C0OtfMQP0lzlzK/AW?=
 =?us-ascii?Q?xfVnpX0DiOlamfjbgsIDRtlcqRAO0F6+aU3SsecRK33OAs/8OswQ5xKW54vJ?=
 =?us-ascii?Q?pIa6/lOfcdL6x00lJPqerfdEO6j2X6C8zrUzaFeyJzHV9WTj10Hh/96filZA?=
 =?us-ascii?Q?DZMYiSrYnUYNnrl1l145KVt0q5gT5ML8N1AZtyM62I3eGVq3ZWmtRhdRndEn?=
 =?us-ascii?Q?mkVSlxPgf+tpuCyftbbeGh5wDzSQWyP1CjkCKShe7ahabdaZljb4tf5ZTSjP?=
 =?us-ascii?Q?Rki0rWS9ThLPesJl4UYQyz0YtSpBgHBV4rP4l3nGZjHWJsRMLdJIhGL+I/ZT?=
 =?us-ascii?Q?Umhfgq01ip48YrwDNXH+StA8YUBeWioHO7EN/wbDwlqST2MP5iei7KPFgr1X?=
 =?us-ascii?Q?ehy6AxPnsEHtimNP4VmyXYn2ydsU4OJceVmmn0O+MN+6oQHtc/8o1D2yxlqy?=
 =?us-ascii?Q?k4jqz8tvihl9P/eQpSE5OCj0VHynBMC+aEaD9Lnt1+MF13b5KrIyHVffBVRa?=
 =?us-ascii?Q?WHOV3WVw+vzX0okWHRLrtTDOYLfDlfqYIOF+scGbBnGnFWOsKonKUwbqLGjO?=
 =?us-ascii?Q?XFKsaII6wEks+hnRu4t5ON+NNMTUd5JGvuGyg8AKAQFRUKhXovLrfaKVz2sv?=
 =?us-ascii?Q?wnjHMWsT6fNc4XwaZ6zOQmvls1LQD+EHPdwyyokTE53q5Ogz2NYiZYBBerDF?=
 =?us-ascii?Q?XJzcNlnpBpJbMZVC7+hJcNvgmHUOvb7AvJFhzHqdHDgSNZEFLkP/6tN46Vm+?=
 =?us-ascii?Q?EAvitsk0/hlYwyXeL4gTwAy60YnGbLlotj3C9anlX86iG0pp3Hr1mT188DP9?=
 =?us-ascii?Q?TxvKURwgqqwB8zOf28+aL0uu5YSaZb84K1CYguD54hAsbmIuUYLluWyU9Ymg?=
 =?us-ascii?Q?wsEnyWAcsnqme0D0SvcEjrqRqVW+kx7d9GMQ5/EICGH4Lw=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11332.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366007)(7416005)(376005)(1800799015)(38070700009);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?GPQJN1wQLLh9ul8bazJTEEyD9gvRtXswQ5FOoQ5tOWuADt1EDxRV7qYAjOt/?=
 =?us-ascii?Q?IAvGA/xt8teJLMzKtK+MK0XqaWFMqlyo+x1hFMMVYkGl5u+HlN6Z8Y3jYDkx?=
 =?us-ascii?Q?7iAzBUnCtyo8BMrL1BbXHJZH1pSmejBQbrDPGNkRbUYyO1CN3lxbHqCnfd1N?=
 =?us-ascii?Q?VAOzDKOOsw+RcRj6NMGtzNMZYIkeyeMmWMB/JVbA3K2kbEU1L9/Mm9+bD1IO?=
 =?us-ascii?Q?ErUJrOP3Cyws82zbR3dQRx21EN3FELFCwUM+wp6xmF1bDI2hcqFxo/biOAno?=
 =?us-ascii?Q?aapKsVqSrcYwWVXXdfTw2Krm3I56sQbYN8u9HhpSySu98hD1oOr89ZXSqk2z?=
 =?us-ascii?Q?1V8GE3O9h75EzRCkWfPAfWAFxebQ6A9AX1ecaDEa8a02bgutnsr4ibsiW4mQ?=
 =?us-ascii?Q?UNJg919y8LAHtfHyid55v1LZlx58Ks5zpxIkrGLwJ+3fNe78ZBw+OEXW8Q8m?=
 =?us-ascii?Q?zLSPdzImuD5VlS8/4dLoDxIxZcWmwxOZF05PJeKP6OD5+whBxMJj1+CJqLBK?=
 =?us-ascii?Q?Z0fz9vzA1Wiw5MxXMisxhjdovOXw3r5ZirEbj4NCLtPn/SHEn3/Z56dd2L3b?=
 =?us-ascii?Q?RC7LPajZz5hOm/Dk84AT4zjjUW3nNphjUBXWmI/ptxmCBQ1BZGDfjM7O5zz1?=
 =?us-ascii?Q?70TbhKKMc1caIAvqhzuNI+0+8XwBB13RKhijnxlwT1bRbgWOBfdaU5aHSExn?=
 =?us-ascii?Q?888xOTMVfTSwjiuisldDCHt9ujO6vrMKHzXo5+cgqwjE9uv1fYt9RI+ln9/n?=
 =?us-ascii?Q?JiTC0rT8bAaQ/oyMCN2Hevq75tnjLfJdeMpJO4xBsEwyeC2WjDdwWap03zaE?=
 =?us-ascii?Q?vaSOGivbbqyhhPVCk8Wf4D4PMiaPaqRbcV1kTvhskswpAmIQ/mi6BI9tbnLV?=
 =?us-ascii?Q?GVuDAkklzvKmo3i/oEGmEYklUbV7mMFXHchtEAfTe4XcrAf4iWhRjCwss+q+?=
 =?us-ascii?Q?t6Gl7sgjDag3FnWUV9vA/3cRd/7Pr+NoNF12o2ZqxQSX/4CUYxylpleJ/fgA?=
 =?us-ascii?Q?p4y2sUdO5G4yzm/9ChdsmVfjwXxiP6gBiv2Hxys2KzGw+hbKAIy4uQKK3nRd?=
 =?us-ascii?Q?S2NpumYJHsriNblb6ZzJcXTz6Qcc/Kr5W7f1DPRJTXzWf8txftZs7436J+6P?=
 =?us-ascii?Q?fPRReckIjQMhY8VoGhKK+o8Z8ZOxxyiiXoqsHG7mM1Dju8+mpGiY0qp0zoPo?=
 =?us-ascii?Q?lAYs5GEPnxrPMuYfLSSJYO7UCukIPaar4NptRoFZnDLu/aoSLlpWoW1sv3zt?=
 =?us-ascii?Q?eSLPAnzQ12IDOEH6DcIG9jzPW/P/l5Us/RW+RWCnpL3gOCCfqoFWqb2vvobi?=
 =?us-ascii?Q?xBWrum7ixd6Jdg8s9GjtLWsLXTCWPIyaSDDBjDX/xl/n188lx344ESLzx89v?=
 =?us-ascii?Q?YqlhD4P2Y4kx+Wk05UMReQPGhY0wXeMPifR2tLdhw6pnwew4jjHFK7QSC0NC?=
 =?us-ascii?Q?NdAs5h5VwXqNn9qByfbRmJDcZsI2qq9wgkcvAueEZV8eHTrtyUZLNW8U/Qv1?=
 =?us-ascii?Q?LG+YDMVHS+pofw37WG+x1RhRycLOrzy7glAahm4LmALUUwNYOlO/zui6F3kI?=
 =?us-ascii?Q?BcQ53ODSvT3+JN1aiw3IMsjNyXSlo9pb7iWSSgvv0TxL+4ifZZ4ret0To6Ow?=
 =?us-ascii?Q?Kg=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11332.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9f8c646-1a9c-4ee9-4376-08dc6a9595e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 May 2024 10:49:47.7081
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O2frLjdEM0L6iGI3xnvPe4IKPpI4RG2PoOIWhY4AuWM/a0QD+jffqqHhxS2v6HBZoD6EZq8hgmsBJmcjZWR2zZn6zdswQQWy40OhD0F8WjA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB6430

Hi All,

Gentle ping. Looks like it missed out in previous kernel cycle.

Are we happy with this patch?

Cheers,
Biju

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, February 13, 2024 2:30 PM
> Subject: [PATCH v3 1/2] media: dt-bindings: renesas,rzg2l-csi2: Document =
Renesas RZ/G2UL CSI-2
> block
>=20
> Document the CSI-2 block which is part of CRU found in Renesas RZ/G2UL So=
C.
>=20
> The CSI-2 block on the RZ/G2UL SoC is identical to one found on the RZ/G2=
L SoC.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2->v3:
>  * Added Rb tag from Geert.
> v1->v2:
>  * Added Ack from Conor Dooley.
>  * Dropped driver reference from commit description.
> ---
>  Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.y=
aml
> b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> index 67eea2ac1d22..7faa12fecd5b 100644
> --- a/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,rzg2l-csi2.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      items:
>        - enum:
> +          - renesas,r9a07g043-csi2       # RZ/G2UL
>            - renesas,r9a07g044-csi2       # RZ/G2{L,LC}
>            - renesas,r9a07g054-csi2       # RZ/V2L
>        - const: renesas,rzg2l-csi2
> --
> 2.25.1


