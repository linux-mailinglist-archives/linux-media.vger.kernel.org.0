Return-Path: <linux-media+bounces-5168-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id AD85A8553FB
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 21:30:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63126283C32
	for <lists+linux-media@lfdr.de>; Wed, 14 Feb 2024 20:30:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C26A1E503;
	Wed, 14 Feb 2024 20:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="tlAyMVaq"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2049.outbound.protection.outlook.com [40.107.114.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B107C1B7E2;
	Wed, 14 Feb 2024 20:30:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.114.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707942639; cv=fail; b=tIzjJDQKXyfqC9PyCC+JceRJkfYcraqkliG06wSBF2QbA4xJcti/UqCc7HTeYWVa/ioLxrjLse1zoTmDiNm3xGyBWNupOUJxY+gaoRVzMwRK3DWI0w85D3ZQAOLdz/Qnbs5Vfo3Pvrxv6Nc/06QgYkMoxmfvGqIKGEI7vXny4Cg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707942639; c=relaxed/simple;
	bh=/g4tr4BDFQPrWrGc6/+PUUP6Jf0LGz0mi8mys82AS1w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XnQHBK4SVO2sWeCHRN4Q5+9PlW+S6LJ5iBIB8h1F7O3ttpF9n70uEKEuPFVUQmlA5i9RjtrgJzNCUhLseGt0FN6k9ohSb9AspFUoheUky8mk9SbQsCsD7Kq83YbX/Gu7MHnIYp7dnyXldI809Gl2mS9nJs3W5DjeOf45Ksf6UXo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b=tlAyMVaq; arc=fail smtp.client-ip=40.107.114.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DL3LqW20zZxTtYbwqfBKCLAIQY3lIAXBL9PiStozwr0EWnxOT4Gg9f2TXcZGGb8+/1C4jInS6AzqM8Jxyi8T+6gvj1iUFNz9F1kJALl2aCJcj4jzfkdzWEFIVprErtyRsSMkxE1pXUYOsr9Z3SlvAnhOwxCUzpbBEULQTcjbD0jgOB8n5dExKrx920IPkBwpzUQv+jHDI/VoieS7w820QJgg59WWNhskF44qUKu78dlJzpnBUjz3rUcok1OuX5ZNVP93TXz+vcleijLcA9MtlE42VK7eESx+iKFK8u+ZaMWo6tea611ETkdutU4b41SgVX9Lr/bGIVfrfPqJiiXW7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/g4tr4BDFQPrWrGc6/+PUUP6Jf0LGz0mi8mys82AS1w=;
 b=aiyLBDPu9cYUR83ASi33FSe6Ij3y7xjlb36Oj6Y+y2T2FgdxuOXPtlT2FvoPZjCbd7Emqkl7UoS5864DuXfH9yvzDi1G5VozP82CJ4mDGf7EQv7hB7e7deC7NE1yd4JeV/eq7NURzzXlEd7olQtQPfCC83O6X+soWQrihsov5jWjOsUxk53nbHSQRPudLK2h1ep88r2X0FQ8d2207CmcQwrfKJ31iZ2cEOjHh2oq9RiXXQwlaUb17trbx/O2JHfTRtio/ITjf5a2oQaIM5b1ObVxEDokwiU1pmtF44/q7ogGDDpY4GkqhXsKZNYE7vUELs4CRNnF/KfQLMjQQZaJlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/g4tr4BDFQPrWrGc6/+PUUP6Jf0LGz0mi8mys82AS1w=;
 b=tlAyMVaqwxYtiBYmNqkbQDMHM98q771w8jx91HERtEhYBrtjnG9/x5QOY+zB5QqqUbiY7k6o927TdX0HxzWhDhlgEEg2xtA6VLaKEsUKhQbYn7Hm4Pf1SGqIYZ10LqHnDDiqCNp1Xi3TWw7+c272SOgc6pdbPufdeHJ+1pd7DNY=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by TYCPR01MB10476.jpnprd01.prod.outlook.com
 (2603:1096:400:304::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.29; Wed, 14 Feb
 2024 20:30:32 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6719:535a:7217:9f0%3]) with mapi id 15.20.7292.026; Wed, 14 Feb 2024
 20:30:32 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Wolfram Sang <wsa@kernel.org>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>,
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, biju.das.au
	<biju.das.au@gmail.com>, "linux-renesas-soc@vger.kernel.org"
	<linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH 2/2] media: i2c: ov5645: Add a small delay after writes in
 ov5645_set_register_array()
Thread-Topic: [PATCH 2/2] media: i2c: ov5645: Add a small delay after writes
 in ov5645_set_register_array()
Thread-Index: AQHaXoVWCoHPK0QH3E+HWd0VqvPPz7EI3BAAgAFu6PA=
Date: Wed, 14 Feb 2024 20:30:31 +0000
Message-ID:
 <TYCPR01MB11269BFE7A9D3DC605BA2A2A9864E2@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20240213140240.159057-1-biju.das.jz@bp.renesas.com>
 <20240213140240.159057-3-biju.das.jz@bp.renesas.com>
 <ZcvuCItn1vO6e2CZ@shikoro>
In-Reply-To: <ZcvuCItn1vO6e2CZ@shikoro>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|TYCPR01MB10476:EE_
x-ms-office365-filtering-correlation-id: 4a8df269-4135-45ee-78f2-08dc2d9bca78
x-ld-processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 shNmglBa8gR1leujPhAAzxMStauznRHelUURzuqYGyDoqUT4VyZbD0i8j6L8ZW4882ZJcf/CkWwme0pv0xeMUhNf+KLCchMU4qFXBMELgYoDENvD2qLz1bQIReX3ABmaLW9ql6g6TeL2j4g8S/25eYIYsTy7544Fo/wQu06jvxTuD350/Nxo1nAxfWsj//+i/nWURsXnYFf0EPU2/RCAF5cl0javTOj0vu8Fra2pnh4qKwOrALPPaoLC+Jj5N4uZ2DWZ+qiqJLYyInPi7gDMwV16nPdVs3hagENDbXfDxck3C9Dx2AD65uKOzFNJfXDr/4Qu5uBl8GjMl0v6Pz062XvuBK+XiU5BP7DqqywcCgebc/GdCGIY8187W4oRZSU7R+tAl/y5BFdqMy0jQuOMsGh0HBOxZOMw5og5EIumpIAuVSAo/sYr/HgkLlyr92HMO2JSTJBVNP77siIdzg/gC2Q5nLeXOon5S/sF+El0xG3fh77lYZ6BV1lkxpVayW4cbi8X//CC38mIYGITdua4wymdrJTwauPpmj5HkHzvZ6HSTm0aq7rairONF/j6SsYOFrjtnJRRYG3STIP8nJaCqxWegDOxjHzlFBdYtQmKne6uHsuXwVzTzrAMHXZTShFu
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(346002)(366004)(376002)(396003)(230922051799003)(451199024)(1800799012)(64100799003)(186009)(53546011)(6506007)(7696005)(9686003)(478600001)(41300700001)(55016003)(2906002)(5660300002)(66556008)(66946007)(6916009)(4326008)(52536014)(8676002)(8936002)(76116006)(66476007)(66446008)(64756008)(54906003)(71200400001)(316002)(38070700009)(26005)(83380400001)(86362001)(38100700002)(33656002)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?weDJi1mcln3suvdD4AHCP7yjh7EzlqLXaLLYlG/26HnbMeRQ0328DjbkEAf8?=
 =?us-ascii?Q?K4JODyitm8OmWPNioUqCvaEEawE/A7A8LbjFbzGWukdE9ePOteeQ79tJc8zq?=
 =?us-ascii?Q?nf99CwOV3J3zh7MvY7lkTAlafT4a4oSZkIepjaq8CK95Lrt1FDSJonc+UbUA?=
 =?us-ascii?Q?vMPKCRu2LDR7kgd7NPAnOvz99qqODzUjB+IK9SwuQIwhUXoLHfw5Ps5/A8Uu?=
 =?us-ascii?Q?0MQIm46pzHuS5gtQAFH/TkanWJgObtvN/18KEK7JmwjGNRCQBbms5k8Ng8qb?=
 =?us-ascii?Q?QD/fSjeXVWYFpYqZ0vcy7w7VCaApl0pVeLd6guG7mfVZ99OFt+A/d4cw3JVZ?=
 =?us-ascii?Q?kop7+YIqH1ogZqJbGzr9xqWhJnw5O8ihOSwufL2Q/NnQrTx+VFMupY0uriLK?=
 =?us-ascii?Q?K2jfvy2uE2HnEFhbOLPwGLF8Q9fhW+s8Twqf5u5tIKuEe0HSkYkmuBxK+TI/?=
 =?us-ascii?Q?YF3F9P7rTi04JrEJFgpW/EVfB/HQiLsNClnZ8QJ9bGHLOSl6hSVGFcOceSDR?=
 =?us-ascii?Q?v+p3PHMOAXdCylZiQZXhP855HCRasxnIkmVlO71HbbLcD6wR55LjJ8auAFqL?=
 =?us-ascii?Q?DfEOpp635t8PpNWmaySLEysltDdZgzGqM8NF1LU59J7ITQUi2sm5VGzwciRQ?=
 =?us-ascii?Q?KbJg/qAXrttg3UqEWDJXg2FwD1NdvHjiPHDr9+AM/z8+p6W91epZzdrKSboV?=
 =?us-ascii?Q?FGP8MRlas/8+t+ecg1QluYxpHHT0bomhpkE6IPAA962CeloOHFatn4rsvnWc?=
 =?us-ascii?Q?QlGdYM4Iyb4U2KctPCc9GbFkpRVOScg+Q7DYVq1ANK+ksgMczK4ixsaUIePy?=
 =?us-ascii?Q?bGmLL8jrI1H1WzdwYxv8w2BuY1hwIZNLBCzUKx7JEpmMazQlhMC3e06z0Fnz?=
 =?us-ascii?Q?EdDhSR/DOC3+lc0DVc0OIq+D2MJQiBDgPOCQGshLXZv/k6LVCTrU1r5gPbGU?=
 =?us-ascii?Q?cKsKdh0rW7DKeX4GvJbfg0kzUICZHf06/IA3+JYOKpXrYo1H3Yn8Hb7LgjI7?=
 =?us-ascii?Q?1m9Tq9ycrxpwwOTr/dPWA14udXlQNp/4Ptqwy8NPiv3ho9tFRxn9LJnMm1tT?=
 =?us-ascii?Q?Sv3cu126JpBuEoGwhzE3fhWn1WafE53gmBMpYP2AweVR8LscRCVYH6RyoH50?=
 =?us-ascii?Q?Pf4hs4Tj634ScOkn+Lip2Ed0CBxEMyhalM8Tr8wxlXYAQdT86qWitlwuUVlV?=
 =?us-ascii?Q?GNNGC2dETYxpZye+3oZVIc9lk2XRbtDUXRTvne1xfMkCp+o66KYjQ093eajb?=
 =?us-ascii?Q?xxr0B8/LA50f2qR2HCypidKIMErUATiiaca+YCTi39i+JajhHbLm2kJyMr5R?=
 =?us-ascii?Q?TCJvjqJ+bOthHOUsEMtBu8Y6k/9dBssm+4EFlnI9VDpkHO26mL6CI0w6HMgU?=
 =?us-ascii?Q?YA2lVYOp4J/eDHcyNaDYDisnpTIxomzNjaXU4bfZm4jMHcusb8DlEB63/gpf?=
 =?us-ascii?Q?aGdH845MI6BrTxJpP3IJ1ym2IfdfgMAeA4CEl194k3ZYHflur3BKNqZJsaLc?=
 =?us-ascii?Q?+XVPtq9cF2HC4FRsMHxz3ZRn7Fe1TGnuHBfzi55lpXcict/s2ip/1A1TvThn?=
 =?us-ascii?Q?v5PkcPSq+BRHJjpQbKlNwbTs79ovD9OwGFZAd6tY67RBJkcNMwvhyuHItGQE?=
 =?us-ascii?Q?lA=3D=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB11269.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a8df269-4135-45ee-78f2-08dc2d9bca78
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Feb 2024 20:30:31.9770
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nBV6NUjmzQU6k1ATQ/pNfThTV0zO3nxILhqu/wVOeevltUVWgMJlvVumCSjFOfQQ3JuANyyBjpIrrbPN5C/BtDU+0yPbw/DDvHn/sgegM/0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB10476

Hi Wolfram,

Thanks for the feedback.

> -----Original Message-----
> From: Wolfram Sang <wsa@kernel.org>
> Sent: Tuesday, February 13, 2024 10:33 PM
> Subject: Re: [PATCH 2/2] media: i2c: ov5645: Add a small delay after
> writes in ov5645_set_register_array()
>=20
> Hi Biju,
>=20
> On Tue, Feb 13, 2024 at 02:02:40PM +0000, Biju Das wrote:
> > Since OV5645 is showing issues @400kHz, it makes sense to add a small
> > delay after register writes for settling the register values. So
> > introduce a small delay by adding a read() after write() and also add
> > a debug code for data mismatch.
>=20
> That looks not right to me. A write reg should succeed. If it doesn't,
> then either the bus speed needs to be reduced on that board, or the
> frequency should be measured (maybe the clock on the bus is too fast and
> bigger than 400kHz?),=20

There is no error for writes. I measured the frequency and it turned out to=
 be 450kHz.
So reduced the frequency and it is around 400kHz now, still faced the issue=
.


or maybe the chip has issues so we need delays here
> and there. Just printing debug output if there is a mismatch is nothing
> for upstream as well, I'd say. It helps to find out after which register
> writes we need delays, but this is only for development, no?

I would like to drop this patch, instead will go with ov5640.c approach
Add a delay variable in LUT and handle it in write as mentioned in patch#1 =
ewsponse.

Cheers,
Biju

