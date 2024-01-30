Return-Path: <linux-media+bounces-4446-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 30ABE8429C3
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 17:42:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DCF8528B4D0
	for <lists+linux-media@lfdr.de>; Tue, 30 Jan 2024 16:42:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9944128386;
	Tue, 30 Jan 2024 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="XlCsZR8R"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2100.outbound.protection.outlook.com [40.107.113.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D2AF6DD06;
	Tue, 30 Jan 2024 16:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.113.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706632953; cv=fail; b=g4vZmY2OQKWA1w1ByhAQmlIdT2YVyURWCQIoUrL0wOUsfNBCONWKXjCHhcxaDTzvAbDLnC6pBXB7dvWF2Zn2pwPqApTy5aZKrRh0g09+xQxAG6QcANWf4dWFawEefx7n9y5vCyPzhUojw9ECU/hsAEGc6B/VA5dlojJjMBAz1hU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706632953; c=relaxed/simple;
	bh=ZE7VK8Drgx2/JFqUKE9iTYcyqNC6aiRNX/D1TP7E62k=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=T4CHyOKrrDnqtESD2U/x/GdwZhjqFlt1Z5QIMnt3MiJAWMCwS+gSKClXaOX++yrirME2H/JeId9wKYqLsGWBV46COFx7O1SS/PHj4ki+d6nnXhPf+phNODKBku8YoNfaT/R6agvkBoumof3W1+gJDv1fD+E2A5UnS0C97VjG46A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=XlCsZR8R; arc=fail smtp.client-ip=40.107.113.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HTqlpCD/Bc6YYeYqVyqx9EyH7Q3B5jt4F9OxkgJtjviX3NFy6ZNhlSa+LuinEwGvlDFkGnNYeBl9EI7YVvFym9PufMCD4idQmWRSk5/I668D5DlJrKLa7cR0itkuFcp80d1fW1/76u3QU9qZgwKefMbgF2ZNsBJp3AT4BbFJhf1WxJ4+jdXOBq04eJcWnyyBGwdjlAenFO2Qza0XIKUZULDatDnADcqraNvFPVIEsGbEuu9NHqsHrd0qLYKABY7/wpnY86hNGy9rUfFB+GcTl6gT4wWpqxRWeDSg+4v3Ml63mQ8gYdnRWMF8Ny0R7wrwztfmDKKeUsutgpmElS2fgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l03QZaOcq1xiSBYv2Rs2yYNOIFUuOh+D5DBi52j0fn0=;
 b=I75C4Xr6iPOEQlaN0L3L1KaEIJZboAlWtGcS9Q38BNYVOiN7WBpDnnRMiqBVYlTl1rthPX93NBEQVGSrH6m+cwTIpg76Hfqyifnp35KFf4RL4F+3GnyJief99NNbJi5HStfCIt+rbfsgAhcHrYE5lNbPnQ5thbbYUVR9yCQzjyjDQviDP2gmeNaEDgBfETBCFMRLWdc9QyUmU3bu+9aN9xHrV75MhpQr7EqSxMOLbIyj77Cp9fzWj6HZ0BFXzVtk2b5uwwZvp6IjUW6xJW5ECia7RQrDbVwsgR0xS5Uf8iiw9q6Fs6NrV6aiopfzqdC6kkJaHGvWCkeHPIUuM5ZtQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l03QZaOcq1xiSBYv2Rs2yYNOIFUuOh+D5DBi52j0fn0=;
 b=XlCsZR8R06y939zFGw4oB3sPFK1E6Gz2fRX1m9AlbSH5Q76c80KdFmhVK4+LssPeN/s/k6AUaa91hniC1uqkj72QGAigN7QsYHuyZC18kst6mq9vBpD8L9XOCsACdplTirlXTYpvTObmU39w2in77zhxr3oI4rHkIPp6uDrr2Ok=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYWPR01MB8590.jpnprd01.prod.outlook.com
 (2603:1096:400:13d::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.22; Tue, 30 Jan
 2024 16:42:27 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::8d12:a02a:9fdc:9c78%5]) with mapi id 15.20.7249.023; Tue, 30 Jan 2024
 16:42:27 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Sakari Ailus
	<sakari.ailus@linux.intel.com>, Laurent Pinchart
	<laurent.pinchart@ideasonboard.com>, =?iso-8859-1?Q?Uwe_Kleine-K=F6nig?=
	<u.kleine-koenig@pengutronix.de>, Rob Herring <robh@kernel.org>, Prabhakar
 Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Geert
 Uytterhoeven <geert+renesas@glider.be>, biju.das.au <biju.das.au@gmail.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v2 0/4] clk_disable_unprepare
Thread-Topic: [PATCH v2 0/4] clk_disable_unprepare
Thread-Index: AQHaU5pqmjb0Ihb4mk+2urxMCJ4idLDyjx9Q
Date: Tue, 30 Jan 2024 16:42:27 +0000
Message-ID:
 <TYCPR01MB1126976A64C637D9C22ACF56C867D2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
In-Reply-To: <20240130163553.116249-1-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYWPR01MB8590:EE_
x-ms-office365-filtering-correlation-id: fc2435f4-cd70-458b-9bbf-08dc21b2719d
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 DhtmDGsBx66chvs9q12GAXXQmKxVQWmT+mGNSxSDVgzoTYZlDMpIs8ZRFGC4FXD4INPUTkvFLqc/I0TR02jlHVdt2YbqolcPKGbkwSVgD5xT89nzk91CZpQx/mPY0fOO1cBt7WYqGlqUTmlqGpM9weMVtFiEtau8WRs8hjFVYJdwX6FKo9rLYAj9136WA2/tJ0hgHGZUJk5aoDleRLlsdRQ8X1IIgyC5XwqLtJZFL9Y/D4apm1piboP2BPw1OR/k7K02DqAwZWYe6usK/R7a7e8Kbcnoq8WG1TD/bJyoJk8i9Rm1PAtGMffgjPrpugYQrRJ28f6hnkHkmIPwED2JR9JRYlgYtHZMj1NIls9U6vp/TIWwmbdJeMuAyNsAgrbxeiOxvxWIoUvZcyjt4YB07IDtYEDGDIGFXHpMkJt04XgQczqITQBLA0fmsVb8HYPVbkJ5TlwufZI/UFdqUusp49PFuJAMAkJZfCtFPtci0UZQH6RpEBSZDhnNySKd5wXEK2bN2SDZ8e2X8X4cGNf4KGUWt8LHWqw8Hv5/yAW1mGxWd0boBuOPxriAJdtnWLcsOSGR6kojJVIqLnDxn0NJgUbMW7Bv02qDIYkpPE0uQTBqZfY2P0DZZlhutqH4zHO5
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(346002)(39860400002)(136003)(230922051799003)(64100799003)(1800799012)(186009)(451199024)(8676002)(122000001)(76116006)(316002)(64756008)(66446008)(66946007)(66556008)(66476007)(55016003)(6916009)(54906003)(4326008)(53546011)(7696005)(6506007)(86362001)(2906002)(8936002)(5660300002)(52536014)(38100700002)(7416002)(33656002)(38070700009)(83380400001)(26005)(9686003)(41300700001)(478600001)(71200400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2iXgsfEGvjVnV1iAAYkuDb2cN34rcz91Mo1VdsrfFtSIheJ8i6C3ZNqaeF?=
 =?iso-8859-1?Q?/LZHilCTxAtFZeHduTEYGZrFuAGOvzU7GU4J8wQthjUnOd0IvI8/Z9Ath8?=
 =?iso-8859-1?Q?LO+jx67P3D72JQcHkVh5YYDs/KAqKAHDygB6OpgHAsrtirZx/JZzDzhwFq?=
 =?iso-8859-1?Q?bJ+i7opIycrzCJcl8Y81PjUKgueBMKmR1IQ5X3PUepnJuKmUNsHlFW6Xui?=
 =?iso-8859-1?Q?Vb5eSQONlmZv+qXt9M12PZ7Jf782vUaViZyQXub0TFh1Mw5eE9ZhmDxKOL?=
 =?iso-8859-1?Q?mP2SMMIPXbL+z15/jZrmCzvj71oEKbYLg5oF4ukItu+3zH0g4lUy22egCz?=
 =?iso-8859-1?Q?mh0KTO3yoPEDUvlAvFSQfFJeHtTHfq5MJrs95Sk8x930XswS3JbHY8Ri4s?=
 =?iso-8859-1?Q?KR2AaY6B7vYRWi+kb/X7VHQ29Ok0+fzMRi0KqQT5ipAmRUkE7AbpnG/bw0?=
 =?iso-8859-1?Q?QU1WJojG44hh83RgsllUIK3/xSU1meilT6kFoPv/nOxNFIH+Um764jv4lz?=
 =?iso-8859-1?Q?HYreabAKMl7nmXiNxpRbbKT2m6kQx2qwLA2+pbB2oPWjJJY7+gmAGd0y3o?=
 =?iso-8859-1?Q?UVnwsphISzIsX7XDykc3uaR4hfHghRZNtgECiQpd8jsBjEbUBQBfRhWqMd?=
 =?iso-8859-1?Q?qlJkhOg9/r+UJ+VrdEoDxl4BnHfOMrzL6AvpDZL5tmBSq+EC1C6pnLD1FQ?=
 =?iso-8859-1?Q?+FGI7FgLOmbQTwtGSFyLkMfr89FmidEcmvFgdyyo6qYSeBKjt/+/9WB2hD?=
 =?iso-8859-1?Q?1whqkm5UxkPj/H9lbQByMwwUkRd9vDqN2/h7+KWnl56yQ+T/juqZhoRmOW?=
 =?iso-8859-1?Q?81Q5kNocsDuEvy7lAPqvaDvxtI1drtP8uMM8hb8tN0zUKbnd9tCjIKnYlt?=
 =?iso-8859-1?Q?b8euvglhAjAejCd7sKDfj/d5bY5sBX887LPj+Twpxj0kwY2e7ue+PhEmfC?=
 =?iso-8859-1?Q?apdXeBZSHqhT+dCjcipscH7TS2QDRpYVRyJTUXP8WVOFWkDkqMoHlQshPe?=
 =?iso-8859-1?Q?+w78PC8/Ru4flnq6fHH15dwWz7DMkRcLqQkoTIPz+3MGWx6nt9kwKLn8qg?=
 =?iso-8859-1?Q?UKvR9Co2PYk6gNn4laB+NINL+bPKmZIjgo9DZ/oIKwfMDlooUtIInP+6E4?=
 =?iso-8859-1?Q?ZQ9E8vsFepghMMgbSihyQwis2vl1tXC0FWBdYigucoexE6D5cRoNL3jtFF?=
 =?iso-8859-1?Q?re+G11bn9rS+b1vCYYzuo/f0WBuxx2lQdRhMSqMjW81do2mm57eDuSH0kQ?=
 =?iso-8859-1?Q?DR5bt/v36qWj7NEqA9xBeODy0KbBHD86OqckNPrMFdOlQLV/zCCPmJTb3E?=
 =?iso-8859-1?Q?0imJnToaiujRKDXuxbfElhIgidcTw896FplmUafZRSUfPuM+PfCQ6fKAiK?=
 =?iso-8859-1?Q?FsrFDhlbYAauBUtahvzqTpTz4nYRb76AP9GtG+3VinhiXRJznnz/ZZ9QsY?=
 =?iso-8859-1?Q?xicl1GVOyUD3dExogb5EnIK5TkeTfnhh+mPRPmEyFbOXuDozWlqx+ap3Hr?=
 =?iso-8859-1?Q?METnzbi7zsdZlYAhcOhxq31R2pzP1mpdXmaHv7G9oLaakw2n0KSa/KcLKQ?=
 =?iso-8859-1?Q?bk4MadTtI7S1+35DYz4PEoer4pwOoN4bEIEQNBtYqJ7dB5dGXxRkYIdV2D?=
 =?iso-8859-1?Q?MMpRBmlmqd/0dBwS1Id2stA8ybDdmpeOSnHQ+zcZavbnbXtfLBLIL0Jg?=
 =?iso-8859-1?Q?=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc2435f4-cd70-458b-9bbf-08dc21b2719d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jan 2024 16:42:27.3641
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: s0YlDp7nxv++FmoBb5iVviMJdOFe5AIS5Im+FUHPCIFJ54ICEv5exLbalWuIxCLqYILxv3NRD534WAsW7iBBUbR8CTM11dbYypRx2ohhvTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB8590

Hi All,

> -----Original Message-----
> From: Biju Das <biju.das.jz@bp.renesas.com>
> Sent: Tuesday, January 30, 2024 4:36 PM
> Subject: [PATCH v2 0/4] clk_disable_unprepare

Oops, typo in commit header. Will resend fixing typo.

Cheers,
Biju

>=20
> This patch series aims to sync the CSI/CRU driver code with the latest
> hardware manual (R01UH0914EJ0140 Rev.1.40).
>=20
> v1->v2:
>  * Updated commit description for patch#1 removing deprecated for
>    SET_RUNTIME_PM_OPS() macro.
>  * Aligned RUNTIME_PM_OPS() macro.
>  * Added Rb tag from Laurent for patch#2 and #3.
>  * Replaced usleep_range()->fsleep().
>  * Added blank space after manual in commit description for patch#{2,3}.
>  * Dropped clk-provider.h and __clk_is_enabled() as consumer clk should
>    not use it. Plan to send RFC for clk_disable_unprepare_sync() in ccf.
>=20
> Biju Das (4):
>   media: platform: rzg2l-cru: rzg2l-csi2: Switch to RUNTIME_PM_OPS()
>   media: platform: rzg2l-cru: rzg2l-ip: Add delay after D-PHY reset
>   media: platform: rzg2l-cru: rzg2l-video: Fix image processing
>     initialization
>   media: platform: rzg2l-cru: rzg2l-video: Restructure clk handling
>=20
>  .../platform/renesas/rzg2l-cru/rzg2l-cru.h    |  3 -
>  .../platform/renesas/rzg2l-cru/rzg2l-csi2.c   | 37 +++++----
>  .../platform/renesas/rzg2l-cru/rzg2l-ip.c     | 18 ++--
>  .../platform/renesas/rzg2l-cru/rzg2l-video.c  | 83 ++++++++-----------
>  4 files changed, 62 insertions(+), 79 deletions(-)
>=20
> --
> 2.25.1


