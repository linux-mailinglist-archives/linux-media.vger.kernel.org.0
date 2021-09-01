Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5463FD971
	for <lists+linux-media@lfdr.de>; Wed,  1 Sep 2021 14:22:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243996AbhIAMXl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Sep 2021 08:23:41 -0400
Received: from mail-eopbgr1400115.outbound.protection.outlook.com ([40.107.140.115]:25105
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S243964AbhIAMXk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 1 Sep 2021 08:23:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aDw25kOQh21zfRJpFCy0W59jaJRSdrxCZXCa/UGB3xF4yjbezti+XiQb/ZB65FJqBEraZ4KZcUNvy9tEg+bxSQLRig4rt7vovLoFZnBhuOsXa3OppLRv9R1fneKr0NuAWzqbGWMAyKpPipYGXXSGbyrQ0ujbeEUIPAM13x2oC5yTOXUoa/RJbGtn6t3BRPQcgZWwlI8Xl0YlaaBgh8z5hkbJKBO8hN+AtTc0+Gh02e51tMf/PtmbDPp0sRFGKdpRwSxwBjqm8mX7/Wi+PYo6XmwmUqYDkAW7uBm7CqqMJEJmFfBHMHAo+EuzUDxEuiRzLMctn3/NNl+6IgPgM9zW0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y45obPnhAPsgBpiJUlAZ+pPrkOYLZ0vzOlUc//S3iQs=;
 b=F9CXn0xVPapRVjerqV1dkqgcl9VpimwJIWfzl5BWpPg0E+LOIPnbHWHUw/+c209PYHUDz1TvdP/zOAYdtPbRZkDhPK36XaIa07Xu1ztgdQFMd2oPNMWuoMTENhNZBaMjy1aPNR/Ve8eWoSoCfh+KZM7LALduvNxDt+5hSSdxYRgMxMSCJT9ipQOUg3NH4Os8CbjNnzMdmIEtXKVnAdTciViEx83bNl75Hivp9ylUR3wMzLjj2kJ+tB/NWiIQR9qBNiIiB9Z9fr+1ZJ7NeFRdNch2oEq+N9r1862XU5mxt55ub5wd5ONJCVvD7HBC5/3SX73JEhRZ2PlC9RZN4B8EOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y45obPnhAPsgBpiJUlAZ+pPrkOYLZ0vzOlUc//S3iQs=;
 b=c9t932Qs8uYSXl9p2gAUZiySqxuHnTfKXP8uxR6x78cuqG294RLE4+bcMWalMkxV/n+bQGj9TCQc1570+dNz8lC1wLQzRKcA+6fY8o6gZB70cd9Ud6/by6Kyuw1fZJuttC/w9X9e4BqyqRNObbSNJ5yDX2df9sMDWhS0HhZethk=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.23; Wed, 1 Sep
 2021 12:22:41 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::1061:2f98:4443:a622]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::1061:2f98:4443:a622%3]) with mapi id 15.20.4457.024; Wed, 1 Sep 2021
 12:22:41 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Cai Huoqing <caihuoqing@baidu.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v4] media: rcar_drif: Make use of the helper function
 devm_platform_get_and_ioremap_resource()
Thread-Topic: [PATCH v4] media: rcar_drif: Make use of the helper function
 devm_platform_get_and_ioremap_resource()
Thread-Index: AQHXnybRQySgKZeXfU+x4i7f1u7r7auPGY6w
Date:   Wed, 1 Sep 2021 12:22:40 +0000
Message-ID: <OSAPR01MB2737C7CCB159F768EDA12ACDC2CD9@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20210901114459.31493-1-caihuoqing@baidu.com>
In-Reply-To: <20210901114459.31493-1-caihuoqing@baidu.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: baidu.com; dkim=none (message not signed)
 header.d=none;baidu.com; dmarc=none action=none header.from=renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: de924f34-ae78-4fcd-0a97-08d96d433193
x-ms-traffictypediagnostic: OSAPR01MB2737:
x-microsoft-antispam-prvs: <OSAPR01MB273723AA03DC584EBC6BAAC8C2CD9@OSAPR01MB2737.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:59;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7LegEaBKmWIUihDbz6XcExTY/c0Bd6fFntA8gvAZINjhDaiQAIo+WkUfjlcu5fCX7VfMJuwKcNKZmV7EobIsxXL4DtUg8438cNz8Nzvc83UZY5FnuSesUkRUEcQDswIRxX4xI27pw1UWKPhim5OWubY997dQpS8fEGI/8j9RZl5rKnMiUOpPpR45mO/hDCqdnDzgi3tVX5FLPk35BMX0bW2D2niCj9+dt5TXAJOBjuBajXij3GP+drAdymP4cs+D7QIVTN82jYt4LH9hf8FqxS7QiciyBEDJiiWuRnxmDWrA01TxkOXVCoq48VhvF0Ed/NntSlLJl7a1t0tFLIKHU5J275YYWLdrytujgM6A9oszhtpL3jMxzrd4VhqI+PoI6WlqgP9KzHF+OkUhFZ4tvBbay21g3JhC0Gff2hmp4FMclKFXakQpikGJhc8j8cxmcSxxVSeMz4AYWHzhWyRHlm6Z5bTF3OP864TuALrKlKPKMiecbQcnOmxcXL2QnzmbRxObOKtm9tImzTDbWN+ejH1LLO+KRCTcJT9pMj/0+xhav03WMZIc+EhwkQkwLQS2Odj1RjeUgsJzr3zWHWcpj33zQv5+9dUjg8XfYtt9MsWLGszB9S6xFnvgEzJ4p55uu8bKy5Xvj8G5RWVZw/f7Du1jsVk25jqBFZl1n+nAgiBBX1eJdgORkeWF07S1GEhdbyVzxwy0WixfYglEwWCi1Q==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(39860400002)(136003)(346002)(396003)(366004)(5660300002)(8676002)(186003)(9686003)(66476007)(316002)(76116006)(8936002)(55016002)(71200400001)(83380400001)(478600001)(122000001)(26005)(64756008)(52536014)(54906003)(66556008)(66446008)(66946007)(86362001)(38070700005)(38100700002)(6506007)(53546011)(2906002)(6916009)(7696005)(33656002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OZbLvKEly1bkOElUUXJjhSmlXhWaLt+mnEXTz1nKwGW0arpckesPPN5x74iX?=
 =?us-ascii?Q?Y8YJdaCI/GR4Qqj0kVS+7PoDQZDasr5kcSOPqG2xOBBGJslVNeq1qirM4fR1?=
 =?us-ascii?Q?E7Oa3IanibCydPsEVhsx8p5gEj3hQPuZvj2v2fPOBRo+NuTyZ3IEJqALYnqQ?=
 =?us-ascii?Q?dMPTwGd0XB6jOFfQOm10slU+cofOVu0Jcz1Maelx0IZSXe1rEgWDceTtqoeN?=
 =?us-ascii?Q?mysvikB4g/VKqROUS7c9vXHd4y9n/r4XRqabQVNfr79xKbiPyL/RJMRLnQRp?=
 =?us-ascii?Q?ju1UYPp51Gn2kSYGB64cIs1JEgMonQJG5EPWQoR8s44pOKoYLJmwukPrPnFL?=
 =?us-ascii?Q?d062fSD01t5P+GLeE/ILUPm1rZdII/Eej7PpQTEkHGBauOcD7bCS6A2UAxyU?=
 =?us-ascii?Q?jQoZIvkSpbx0UU1ngr1gbkuSiKV0oehNUxQwIZcoKcFfMMcFGetLVrERnv8U?=
 =?us-ascii?Q?l/JmNZ1x1dRHVIodRpBIwAZgoDgh67CIZHKxr+PO9zis1gEdGu5eGuoaE8B2?=
 =?us-ascii?Q?fMNlHsj6gwBLUnbP7EZ8W9C78FyPbzWgjnQMxcZgoQ6bF/B2YZGN8apmtHwL?=
 =?us-ascii?Q?lo7+C/WEs70bLaezIS1EQsSGHhz2cCA1dMlNBoYkjO/Se3e+vLjS5t3NXPmE?=
 =?us-ascii?Q?/tFlbFh8G2naqD/YPAySvTITuP4JM+wDB2lNNa+2OB9GD3cNhgjktXr6gKpI?=
 =?us-ascii?Q?DqAW2PKEUeveds2DTuk9PktKaVDTRlfrlnE/B/kxsGKAvAqhhzCLzp19f6aG?=
 =?us-ascii?Q?/lpt1Z2uQtWLK+Umaz4ERFxpep6wDdptV1oT4jf8j3NZWG3cZQ7d41iX+uKW?=
 =?us-ascii?Q?7Ozx07kCOU3x0ubwtv8bkhQ7CqrrFGHvNuZz8zAH3GvlA1eFA+P1RGFS+yfR?=
 =?us-ascii?Q?Ch+glKHITbK+BcpMkplOdfZuqlFwVPfAQjSwgRBbWQTdVky9InBF6npFW+gF?=
 =?us-ascii?Q?KmN+J1i7ejCw7wsatBRvvH3Z2cwp8CCQLo/hBYZefvgc4sfhcCxNGMRg6A6X?=
 =?us-ascii?Q?uZuIxAwiH9JhlhBH4Ult7OVNgKPHFuwUjlnZJ2xG9k6BG6fMjCRcxAzIvd5D?=
 =?us-ascii?Q?lpAn2Ve955AWT6V1gZWDKSuCuuBSrU8m2NMk/MF5hFpBS3CJiL51/dy7JxTc?=
 =?us-ascii?Q?vJNDrWMqHhp8udsmasbFXWx0eNvAaTnYN82fi0WxBu3UZ9kfi4o1E1Kkv0iu?=
 =?us-ascii?Q?Jedb/5LtrfjCoRriqyhg8WixG7l88SiSNZSrX4VTdtN1dMLeLZPuwumLSDDh?=
 =?us-ascii?Q?v/WUrlsTw8D/TZ17q/ynwjR4PdqepZ4CPQjgzyKyHaZSUAsB3wjHKfLgh6+t?=
 =?us-ascii?Q?IRWNKYyWKHpN+/Bv2JJ67dWi?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de924f34-ae78-4fcd-0a97-08d96d433193
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Sep 2021 12:22:40.9613
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4cUB7vu3Ihm5S3CNgGJM/kY+co7czf6HqUbHt2k3CVIZWJml4p/lNoIXFltn7gS49yn8eGothBGyzFW4g85dRJAuj8+aBV3XfIgfZAXSWic=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSAPR01MB2737
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> From: Cai Huoqing <caihuoqing@baidu.com>
> Sent: 01 September 2021 12:45
> To: caihuoqing@baidu.com
> Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>; Mauro Carvalho
> Chehab <mchehab@kernel.org>; linux-media@vger.kernel.org; linux-renesas-
> soc@vger.kernel.org; linux-kernel@vger.kernel.org
> Subject: [PATCH v4] media: rcar_drif: Make use of the helper function
> devm_platform_get_and_ioremap_resource()
>=20
> Use the devm_platform_get_and_ioremap_resource() helper instead of
> calling platform_get_resource() and devm_ioremap_resource()
> separately.
>=20
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Acked-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

> ---
> v1->v2:
> Use devm_platform_get_and_ioremap_resource() instead of
> devm_platform_ioremap_resource().
> v2->v3:
> Update commit message.
> v3->v4:
> Remove the change - "struct resource *res"
>=20
>  drivers/media/platform/rcar_drif.c | 3 +--
>  1 file changed, 1 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/rcar_drif.c
> b/drivers/media/platform/rcar_drif.c
> index a505d991548b..e50673276d93 100644
> --- a/drivers/media/platform/rcar_drif.c
> +++ b/drivers/media/platform/rcar_drif.c
> @@ -1395,8 +1395,7 @@ static int rcar_drif_probe(struct platform_device
> *pdev)
>  	}
>=20
>  	/* Register map */
> -	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	ch->base =3D devm_ioremap_resource(&pdev->dev, res);
> +	ch->base =3D devm_platform_get_and_ioremap_resource(pdev, 0, &res);
>  	if (IS_ERR(ch->base))
>  		return PTR_ERR(ch->base);
>=20
> --
> 2.25.1

