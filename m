Return-Path: <linux-media+bounces-37282-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CA5B00050
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 13:14:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D71561C826C8
	for <lists+linux-media@lfdr.de>; Thu, 10 Jul 2025 11:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E3732E4252;
	Thu, 10 Jul 2025 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="TR3S65CY"
X-Original-To: linux-media@vger.kernel.org
Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11010032.outbound.protection.outlook.com [52.101.228.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF18C2DBF45;
	Thu, 10 Jul 2025 11:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752146081; cv=fail; b=hM6iIzgzkEDL7DiEMDs78b/ceAdxCtzePa5yV+E4oi/dnTpuaa8Afz8P9/qDF1Fx8D0GIHF9cBxFF9392opN+hBRGGYlb3HQOK9ZPMKN8oGnl+eYNk7x+RsRV0cT4NpSYaF5Ia8Z941dkjazQmmPriIksLyG7zMn8cBtGVr3B9k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752146081; c=relaxed/simple;
	bh=/ZwHr9Q2WJXDXWtq7hsJaLQuDZ+XD2VPw9NdKbjDSSk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=TPTGtPdMd094/m0Ltg15m/b1OvhJiFmKNqO4xphNlMHh004qH1d+84RtPY6mboVqBKa28n5w8rvgjjjHxZNHrq2jZ6C/FmcSt8CeqDxgVbbFAaxyuo6RqeONXTCteMHuK02JKyIUM6hYx/kiFpLxHXC8p2q32HkOd9wSm2/O+vo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=TR3S65CY; arc=fail smtp.client-ip=52.101.228.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kHwIATQPBtxmmuiJynwwHYMvfzugx20Iuc+NxFwrydnwtIvHl4ukAUs0kQG87DVuNFZLZzfwiNbg85sH1l6/SjK8YPOSXj0MPFRwKKN9/UEBbwT39t1qF2PNrvzPLA9QkcFDum/WLlxDvOnA9B2myA62vycZ3l0sXff1GaqoQM2WdmdlyfT2z8V8InQpXynNT9JBoVCshUkBX2xXuRmiWXmis9NDLsWTVVcQqZPWRDFyBC6T95VEIjNHgwr8TUjIt7HXvbv6rcf/Up4donqU3+radi3e+33S/3b5qiR7I+zUraLDyZ3RYFgrNAT1tRsQ/FjLaKJ7B8ToJf2I2hLfwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSq1P09i48aeFONQCgR7o1c+kU6dMD9URjQtS/HOPA0=;
 b=tyl10jh9RXz9Al+C5XoM2lzF0+wk4d2FHVzpEhqbO9q0Wgxx6qXC07LcuX8E7o/hRN/TUehCHt5oiqXNzRrnZ6eCrvtVPMNj1Asp3Fn7EBaxXe3hlfCeyko5NiR2r//PlBq51c6VOcgol+vP04/M0qX34YpTHF/HcAUOd4QHSeqVc/nNOxXl9C2sz8zxJut84SWwpVB8GNC2e2RIVHm5yEwtLbuf3OrEj6TJ3r8QsU53FZdp3kf2/+lQYPjLLa0JYrwU5RpccvAaTm0iGtQgREUIBD3e71EnymL4P++MjquUCoz45JUsd7FZoRCYOZQnZjyu3FY/sUfCaUo0G4QlkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSq1P09i48aeFONQCgR7o1c+kU6dMD9URjQtS/HOPA0=;
 b=TR3S65CYGWXLo9CeNTjS+FzSIusgAl0IPJXqgsee/NJFXp95koVfsqpw8bBjwDwJbWo1DGk5WAby4/3FI8kkWaw9mZ7dk9KoGPohoD7khWZcyOgQgJAjt3eubhk4Y//ZptsUWHbKq7ZFj17guxyAGU93Pf6uZwwVO2qNq4JdAVw=
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com (2603:1096:400:3cf::5)
 by TY4PR01MB15503.jpnprd01.prod.outlook.com (2603:1096:405:270::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Thu, 10 Jul
 2025 11:14:31 +0000
Received: from TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772]) by TY3PR01MB12089.jpnprd01.prod.outlook.com
 ([fe80::2ac2:8829:306b:5772%6]) with mapi id 15.20.8901.028; Thu, 10 Jul 2025
 11:14:31 +0000
From: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	=?iso-8859-1?Q?Niklas_S=F6derlund?= <niklas.soderlund@ragnatech.se>, Mauro
 Carvalho Chehab <mchehab@kernel.org>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Jacopo Mondi <jacopo@jmondi.org>,
	laurent.pinchart <laurent.pinchart@ideasonboard.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 4/5] media: renesas: ceu: Convert to RUNTIME_PM_OPS()
Thread-Topic: [PATCH 4/5] media: renesas: ceu: Convert to RUNTIME_PM_OPS()
Thread-Index: AQHb8QX+7ux1OqzbnkyJxe3sJ+CLb7QrNYJg
Date: Thu, 10 Jul 2025 11:14:30 +0000
Message-ID:
 <TY3PR01MB12089EC99645E51D0B820C378C248A@TY3PR01MB12089.jpnprd01.prod.outlook.com>
References: <cover.1752088108.git.geert+renesas@glider.be>
 <7073c5a5a4c89b9244a2e39829cfff585380d1c6.1752088108.git.geert+renesas@glider.be>
In-Reply-To:
 <7073c5a5a4c89b9244a2e39829cfff585380d1c6.1752088108.git.geert+renesas@glider.be>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TY3PR01MB12089:EE_|TY4PR01MB15503:EE_
x-ms-office365-filtering-correlation-id: 7e6cbc24-3b87-442b-53bf-08ddbfa2f14c
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?8bnyuYNRDt/7755BIGiNoVyxntQT16/eoR8R/lOkMkVl5e8T7wGhpWZA2E?=
 =?iso-8859-1?Q?AwUwEfzqsH8GIcOUpmc5lJGO8SSsfTAznnGwkx2FDo3YxLjan+6Ykc+Cne?=
 =?iso-8859-1?Q?H800QlaMH8rNGlDu1vHET7evj9mSMaOOZV6tftWwPTH9NuqLvTt8I7IsxP?=
 =?iso-8859-1?Q?VJ1AUZFpMB1YwTbddH+ilQk4pC/qhbOWjYYSpOr6ck4CHJVSdm45BBJjDg?=
 =?iso-8859-1?Q?RVTz1rpgFxpETmUZufhjRku/sm8wZpYkdGuFigZxtBtSrToF364c+GsVgh?=
 =?iso-8859-1?Q?DtlfkV90UHIwnfy4TE59lgmrnBQJvNIiNNyaQvzhq2xk5Bw0K0nXCaFnz4?=
 =?iso-8859-1?Q?0OXte8iXVIL+ND2iBBJSwl5+xMwNgeQvV8r2/DnFtKUQDWQJvdz2gfhNfp?=
 =?iso-8859-1?Q?N9YPGA/iedK4Jq/bj89t73yo6SsNRbg4cObO0WjhvQ9jrBBh7EUocca1JA?=
 =?iso-8859-1?Q?yWY4uLmWaD5mjrkzLz6eVuUKj6YCpAJUjrXBM4XllO0wWKjaiWxshqteLx?=
 =?iso-8859-1?Q?sEjg7yIrjR42J56V3bWcpZv16VRfhwhBbu2/pj9iDPLwpdkmL9lFlSSZqR?=
 =?iso-8859-1?Q?84M8PDbz+IZFbrdgcBLJRyTRmjOyDEiKOVfz8zwQ6cYnGMWqRY9ZSSIqR/?=
 =?iso-8859-1?Q?aBtxBmE06bqbialUdxtngogGbw0HcJ2cHNeB4913y3VXBOlDTFvLVCk+QZ?=
 =?iso-8859-1?Q?sDIrAbloJ8zBm+BEaNZItcW0YrkS7CfKswLAoJe3kTyN+Grv13hhIU8WTP?=
 =?iso-8859-1?Q?VDtfOMG7/iH8Sv4iv+aX0oLq+918hhgVsfU1of49BWWzsQB/qJ/2SVy+4t?=
 =?iso-8859-1?Q?AlM2wBTAZooPn1RTystYEgs7w4cR0ritBjyB+0PJELxWFfegsaPYX1S+PU?=
 =?iso-8859-1?Q?mQUd7rDJkSbdHBjxRIMpgtCpo9vCA6r4otj0fRIyfdrCsUt7XNK0Br8CF9?=
 =?iso-8859-1?Q?tTnCDWiKN+kOJWatqDUBV4uWR3wOMfKsOHYAWn+vpT9lnt0QhhBinGXYVZ?=
 =?iso-8859-1?Q?OMl9MTV6G/qZI0d9rX68zd2g+KFpusWigKGPtHNh0yGoG2YX+QlSeZWcKD?=
 =?iso-8859-1?Q?mCEKnxl7Em0gYSyMaFjoLdYNB5LQBdssrw1vwk6xOAt6PkFSWhSC+/i4Lz?=
 =?iso-8859-1?Q?G5kvQBdH4lLPNWejEcggbiHHUgJdm9yY67scBACX4QAqh1Pg5rag+jlNt2?=
 =?iso-8859-1?Q?wXZuXIznQcHrPZ65vEjnsdjPt3fSYgrHmMpS996hCh7jKdQTZIV+ZAm6+a?=
 =?iso-8859-1?Q?bBVLZDYTUOq9MgHgpsdpgDLVP1Q0KHtxzoGPnESq5Qv3CuOM3Hguu2Hjll?=
 =?iso-8859-1?Q?bagDKyeEmwev7eXSJ/M8gIG2du+Q0peDqx8TmtI2rwCvjLAsERsHxRn0bj?=
 =?iso-8859-1?Q?YU/VRuuA3uA2E35EcG9mEjyHih6pZALB2mtTT2X/5RlgrB7jnzYUoHdkKX?=
 =?iso-8859-1?Q?T/OsBnLs+f1y1P9LSpiyLxGbvmB8dNrY8WT5bISyhAJNJv8Gd+MOCsByP9?=
 =?iso-8859-1?Q?l8fCJbuPZ0jyRXarfPvH4AHtPyFqScQt5HOSmacwGR2A=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY3PR01MB12089.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?yJyB6TV37stNtldLLgJ18k/EynND7WhqztLyxQEgiYY5g3AzBATYf93f0P?=
 =?iso-8859-1?Q?CcFL6vlIlSqJR2IfWzD4oVJ9EGiMPngA5D9eYXySQWs0MHfV9eCeYikOZD?=
 =?iso-8859-1?Q?eLMgRUP+1h8O7yRHUGse+7x7LEHVtq/WZGlva6xjdWpOhuXcpdHxZPtz7h?=
 =?iso-8859-1?Q?/t52ZNchi7aszfe0WK1VN61wuUipIvlYxSI3I3ELbDRrS7VCa0yI06vmuP?=
 =?iso-8859-1?Q?gWastWoXxsPupO4QffN3RXcSdMD6QNmZUXAb+bwP6iWE3SaqM6Ur7IhkC7?=
 =?iso-8859-1?Q?ZHaxwLIa5dM6f8HxdeZlUzWf8zjJ0J7kebXibLyO6SbQtqX92xCEn+6Kxm?=
 =?iso-8859-1?Q?zRIicWellWIizshCBRbZfZnFpspm1eAsZzjvwMp6magfGdfmci/4V6OPFy?=
 =?iso-8859-1?Q?+poojs35jve1Qcj2fXi8Us3Oxqpx8qrKbizhnoe8BRyMZDhaGSpEnpN/ut?=
 =?iso-8859-1?Q?jZx0f2Am+y0NvyhYp7g+42w8vuHmPsJSABIoXs5f/S3MnbUozleYm5SJbu?=
 =?iso-8859-1?Q?18VAsrIEVqBEqqcrYQgs6RxtBkW10UdVZBMjjta/le+EMYifiibTgYdjul?=
 =?iso-8859-1?Q?ZJ0pETOmWgQOlXCnu8qa5ceWbwN/pjyINmX6KEKhY9uEdg2PY96spFAtM2?=
 =?iso-8859-1?Q?E29AKnMyNyeueHsAQEIMdctwUVd5zA2qmcXw5ie67awHS2MoNMLNMnOtFT?=
 =?iso-8859-1?Q?0slgu1vkhphsS7LgD4+vSZDpTHtx1NQEOIGSw+GD3lgM3tPOrtuQRbKqJp?=
 =?iso-8859-1?Q?5wBLKqrwmCkWLckhbQcJ5ONAkEHv4FCFIMCkUq1wAW4K455T4jUqpi4/fn?=
 =?iso-8859-1?Q?nav5uMJTuviBDI7ofTzeM3ejBMI/Odzc5lra7+GKxaesRe8fK2cb8uc6tw?=
 =?iso-8859-1?Q?P1rcaRRashVSu6vFiHQdW3sBi4ZJ0ITS4R6HwsK+fLzPD1/7+abTQiMxSP?=
 =?iso-8859-1?Q?YH5LN8E8hK9W0UDXnN+FpMcqM4UE1ZpkAdnEkFNSyTzzgZXOXFbtd79fAA?=
 =?iso-8859-1?Q?qBz8xGGK0fCZ6f/G83SC5qU2sL76EIcAANgQ5zPp7ezV5sg3NxZrL1jBLf?=
 =?iso-8859-1?Q?qOVhv2KuScckLQ2/IWu15QYLhoOjfZFMTguCc/PRyhrLIzH1ECwiSmGXDR?=
 =?iso-8859-1?Q?fMQwY/RSYR7wZdoZwy7NaC2NatP4yKlt1xt+XRff94V0SeAGlEqwcwZZxe?=
 =?iso-8859-1?Q?lvoJcqeplIMW0JZIfK4vaIuqTtiZstDnvj+brYWTfjs0KaCbLtZ7no6dtO?=
 =?iso-8859-1?Q?7tpOz8JRK2THVeznQBKfG7wykDJW3u4DP5GyGDOk1F1XULK0ZdUSCEY8Ov?=
 =?iso-8859-1?Q?UQ2PhGuuGKbc9f6ra9Df96xiZyAPabPXOQd5ggkIcNf+NkLrYllv6RABK0?=
 =?iso-8859-1?Q?hNWTZZali90eh6bUGVhVQW6vXi8a5LpVCb8zZWWaO+WsmzHnlutDTUNWp3?=
 =?iso-8859-1?Q?j39/8mIEaWtexPdP46MHys5UtNy7mzyueU+/LOOScPripPsS1OEplE4Yy9?=
 =?iso-8859-1?Q?+9WgiDiw3oZbiyodFsW9ydMZlVj50iHNav8Io6B3rrAmHIbYOwkdmZdo4K?=
 =?iso-8859-1?Q?zs4Bz3AsWgEO3M2qHUWrCNfnzq4l6d0+iYYopZFyHYX4qhmgIsKkL3OT/z?=
 =?iso-8859-1?Q?cAp5pgrwU2HSCTCZsfFfwSvSV9Q7HB/FTdw6Z5BEqlM+E5eo9kh/LROQ?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY3PR01MB12089.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e6cbc24-3b87-442b-53bf-08ddbfa2f14c
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jul 2025 11:14:30.9887
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bLmulaF8uoy2n8JdezB6mlcTKutEobLsH3JlUoFGbW/GQdYqHJKTX0QTo9GtQPz/5E3vtk4Qwgl2UVt0+qH491JnNEFNDi7KIxJmeB13wgY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB15503

> From: Geert Uytterhoeven <geert+renesas@glider.be>
> Sent: 09 July 2025 20:16
> To: Niklas S=F6derlund <niklas.soderlund@ragnatech.se>; Mauro Carvalho Ch=
ehab <mchehab@kernel.org>;
> Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Kieran Bingham
> <kieran.bingham+renesas@ideasonboard.com>; Jacopo Mondi <jacopo@jmondi.or=
g>; laurent.pinchart
> <laurent.pinchart@ideasonboard.com>
> Cc: linux-media@vger.kernel.org; linux-renesas-soc@vger.kernel.org; Geert=
 Uytterhoeven
> <geert+renesas@glider.be>
> Subject: [PATCH 4/5] media: renesas: ceu: Convert to RUNTIME_PM_OPS()
>=20
> Convert the Renesas Capture Engine Unit driver from SET_RUNTIME_PM_OPS()
> to RUNTIME_PM_OPS() and pm_ptr().  This lets us drop the __maybe_unused
> annotations from its runtime suspend and resume callbacks, and reduces
> kernel size in case CONFIG_PM is disabled.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
>  drivers/media/platform/renesas/renesas-ceu.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/renesas-ceu.c b/drivers/media=
/platform/renesas/renesas-
> ceu.c
> index 8cceafe491b1bec6..deed49d0fb10e0d7 100644
> --- a/drivers/media/platform/renesas/renesas-ceu.c
> +++ b/drivers/media/platform/renesas/renesas-ceu.c
> @@ -1048,7 +1048,7 @@ static int ceu_init_mbus_fmt(struct ceu_device *ceu=
dev)
>  /*
>   * ceu_runtime_resume() - soft-reset the interface and turn sensor power=
 on.
>   */
> -static int __maybe_unused ceu_runtime_resume(struct device *dev)
> +static int ceu_runtime_resume(struct device *dev)
>  {
>  	struct ceu_device *ceudev =3D dev_get_drvdata(dev);
>  	struct v4l2_subdev *v4l2_sd =3D ceudev->sd->v4l2_sd;
> @@ -1064,7 +1064,7 @@ static int __maybe_unused ceu_runtime_resume(struct=
 device *dev)
>   * ceu_runtime_suspend() - disable capture and interrupts and soft-reset=
.
>   *			   Turn sensor power off.
>   */
> -static int __maybe_unused ceu_runtime_suspend(struct device *dev)
> +static int ceu_runtime_suspend(struct device *dev)
>  {
>  	struct ceu_device *ceudev =3D dev_get_drvdata(dev);
>  	struct v4l2_subdev *v4l2_sd =3D ceudev->sd->v4l2_sd;
> @@ -1709,15 +1709,13 @@ static void ceu_remove(struct platform_device *pd=
ev)
>  }
>=20
>  static const struct dev_pm_ops ceu_pm_ops =3D {
> -	SET_RUNTIME_PM_OPS(ceu_runtime_suspend,
> -			   ceu_runtime_resume,
> -			   NULL)
> +	RUNTIME_PM_OPS(ceu_runtime_suspend, ceu_runtime_resume, NULL)
>  };
>=20
>  static struct platform_driver ceu_driver =3D {
>  	.driver		=3D {
>  		.name	=3D DRIVER_NAME,
> -		.pm	=3D &ceu_pm_ops,
> +		.pm	=3D pm_ptr(&ceu_pm_ops),
>  		.of_match_table =3D of_match_ptr(ceu_of_match),
>  	},
>  	.probe		=3D ceu_probe,
> --
> 2.43.0


