Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDCAC3AD867
	for <lists+linux-media@lfdr.de>; Sat, 19 Jun 2021 09:25:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232949AbhFSH1V (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 19 Jun 2021 03:27:21 -0400
Received: from mail-eopbgr1400104.outbound.protection.outlook.com ([40.107.140.104]:7088
        "EHLO JPN01-TY1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232445AbhFSH1U (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 19 Jun 2021 03:27:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CGz4bUO7FOmz4KZGIr9E1T/3tk+YDLvMMyA6qx/PTlooe0BUPPbeECcImw8tRFxHWON0T0B1fxKatFEIUIeYGQMns96jYnDqPw8Z/lo822NYFfTI5e9iEj3ej3N/LUrBX47VVoC8uOUdGmuyXuXT8uNpwyqGgPSAL9YpYnuwjc+oK8tHAEJIy0nmAzdNrStAyy9FQdVD7eOnqTJzmUBo3hEHaCaY6QZ17Vxy+pC5gdtMlOMKQqueERE5Pq0tD+ux8KsuuXtTbzgtiCzuHtXHl2OR/qw19wsgnc/I5XBgaaKj9B80YlC6cgJzNFZ3r1uod9f7uDZHiCWIIhMskjJjCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwe/GMbhYI+ClndCQIcRkd/3NOh5mOPoURqvcJd5ZTg=;
 b=fv5tl3+iaQcM7xcak29iZZOGpEFpgynpnAU6LMOdFKOuqVfKiHVjxin7qndQ8bRrA+/vXuAKt5E7K35/er8EOrD790B8W15P80+tKjIj2hg9Es3bUkB/umYx5nsJtW7sfiQOJW9zvFPGP8AvExqdxJZnLQlOP6pxw4G/X30ZKKq+en/ctoX+ez7uDA7TbsQdWS6OpuRMjKwpxkZVu5IZ+0yaREpTnVlaJ1lgG8yxkDram01+N5UQpkGA+DDRRHlEZynO3g/T66lf/R/1chDnN3oYh+cudFuSe0g1YoKfDV+UpGphe68EtLa3Xiiq6wMGwIFa+XCUqJDNpS+CzjFeDA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jwe/GMbhYI+ClndCQIcRkd/3NOh5mOPoURqvcJd5ZTg=;
 b=fjqXrUWAgIe1aTYmEjb64DHQGuk9LfhGC79lioGTAbj9aOKIcmHsZwJvCEazSuBLSXJdLZMjPAvb+fry/zB/V5YwlByQEfAN8KSSiBfd/bUGILxvlJN4hW1PBQSC4bL/N94Yekxk6lqOHeDse7vtAX2NvK4Oaa6p/1G+nC6H2gc=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB7048.jpnprd01.prod.outlook.com (2603:1096:604:121::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.19; Sat, 19 Jun
 2021 07:25:05 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::b834:5e50:2ce8:9ae0%3]) with mapi id 15.20.4242.022; Sat, 19 Jun 2021
 07:25:04 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Subject: RE: [PATCH] media: vsp1: Simplify DRM UIF handling
Thread-Topic: [PATCH] media: vsp1: Simplify DRM UIF handling
Thread-Index: AQHXZHVwVRc13Ki5L0eQq/y/oBSkCasa7sUQ
Date:   Sat, 19 Jun 2021 07:25:04 +0000
Message-ID: <OS0PR01MB59225776AA6269C4EA2AD1C2860C9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
In-Reply-To: <20210618190905.580258-1-kieran.bingham@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ideasonboard.com; dkim=none (message not signed)
 header.d=none;ideasonboard.com; dmarc=none action=none
 header.from=bp.renesas.com;
x-originating-ip: [86.139.26.177]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 7115cb09-e4f0-4646-d017-08d932f35be4
x-ms-traffictypediagnostic: OS3PR01MB7048:
x-microsoft-antispam-prvs: <OS3PR01MB7048F2A759442A26CDB838C6860C9@OS3PR01MB7048.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:369;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sqcKIH1jNFqoxnIeWVsv+bKiT44UkXgv7wyrRyvKvuh1Pkn6v6B5NFDGZXxvLgaN6USzIXjp3LtS6rjWLCI5Kh0zxIUZJoXikn9WldodaLB0vfPMfOFdHP+PhlWDTLJF9YTEVFKGC2SKT+azVTB7Pbgi22FzwJryKqZyAqWffip0xKBsEJZyF14DZfedBtYxXkrFTno9xDTn2zlteUjD9q2X79ydCGOj8Xh3W0g1EdBB3/pUp4EqxjLZLn3uWHkatbM/IuKVpi5cJnk3IF/agwLF3LDe4xviWNhSjhFhMSft3ORNVVfGL/rUxSKGV03ojx3zQ4fMlG+E0+gnKSdtEnsmp9kBvKD+XRFxN+7iXoyqk5lZcfHhnZdgylHc09cdkHA3+Sc7uhv+G32wYIuZUlwftYxLQqtbo6fAuKwwMCNiJG7E/XOusqK/TVdCMe/ViFf24sEXbuM1HgErexaHp4Epg3463sG4zfpwAuTMt/Ff5YngfAZ2XsB1TivaDfGrlfIgeZhpSiXtX0KWYZ8WsvX4rZNhYHqk5wUiI/3SIPgd+snPWtGHS4uLMu+YercJPOgou+Ddsj4GfAf+deIQmVhak4xmlZqUYEIDoghdEvA=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(346002)(366004)(39850400004)(136003)(376002)(8676002)(71200400001)(8936002)(76116006)(66946007)(52536014)(66446008)(66476007)(64756008)(5660300002)(66556008)(2906002)(6506007)(26005)(55016002)(83380400001)(9686003)(316002)(122000001)(4326008)(38100700002)(186003)(86362001)(33656002)(7696005)(110136005)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?kXNVCtqPbgIghaJq9NfjvW8ElPGCdWEgRb4OD94pmefHZvHiOOL8qIPQ8sRg?=
 =?us-ascii?Q?6jSxdX7y7MvsP9xS0JejFPnrB0nQi3qYj7hCfgcBNVvrN0aCzY7do2VkYsif?=
 =?us-ascii?Q?dHK9+mj2FPXihZUC3FuHWwyOw6ljPebqpl7aQi7um8AP8sUDkTf+Xm1b93QE?=
 =?us-ascii?Q?M5Y9b8SfMSky8OpZdHV9d8fgEsbO94xU0mai18vWwjb9BT6TR0LGNNMJzKhK?=
 =?us-ascii?Q?+kpTYM0KqMzzALty8ahzUJ/4s1Kav2E1aqUZDCEF6LFUDAKJk9hivkR7xveP?=
 =?us-ascii?Q?VuQNmT48lq8kRGDczxsUXDkkvmvuB80yHv3LWjMuOJIra4pXhwW0u8dMFGEt?=
 =?us-ascii?Q?hhx597JsHLt3N7ywbfxJwABa00nWZcrqgXV5g54ZD9uYNlNdSIisCWyethVK?=
 =?us-ascii?Q?aK/cx9wskp+8DBtdgGLaFRlZJlw6g0MRMN3sWFhcMRQZLYR9ViGVHhBGDRtO?=
 =?us-ascii?Q?TE9u32kDfQgRQWPk+nNl/5k8D51xtV0tA+LitV1hYpBK6Yns2W3ZWSDZhiHW?=
 =?us-ascii?Q?OtX+UqEOZbLP3iYvSGxvYAc7zSllEsasyCWkrwRA4Nrml37Nz1OAPKRvqKRm?=
 =?us-ascii?Q?BjSYOYrgFWLgpQkJbURzOwaNXzH9MslcYV7voEx8TR6vQdadYmcnVGYEeG+B?=
 =?us-ascii?Q?9jYUqM4kiygF/UNpCe02xhVsvBqpDBkG/Fduhoed7IB4XTDEHQyhUe2VE+T3?=
 =?us-ascii?Q?ivNlRyR75c2bSaWBd/AsBVsA2Dj7JP0asovB9IcVAfpSj3SCoUASL6L0r+N2?=
 =?us-ascii?Q?xKRkXnAwCM5HV1KO3V0VO7JXJqyhzRxNF5/Dhku2IaoYVWgL8Jv7EmmFKkgx?=
 =?us-ascii?Q?bFIOq1gwFnVvxGti8qkZ/weVJK8XUwcS+sB3vevJvxKzxi6LVrWXURpPJEWb?=
 =?us-ascii?Q?7d/KvgW2FSfTF/wspP25r5BYGoUXZs7mj0qU61//iYMxb9vRmqH8G3IM66qS?=
 =?us-ascii?Q?nB5hd98C0FPR1ar7K6kOZGuimM/3y6O6T1OD3yX3SdsXHXWGtzN3uZVeCzQS?=
 =?us-ascii?Q?aqPKbSTCkM4ZvdZv6QvVaWaS9qcLf9oMAH94A6XOSQOjgSUR9GGfm9hdh6Nl?=
 =?us-ascii?Q?e6pD65ledr+StAZD+d2DeaX78IXSvSe6oF6yqRuxSM4nuzvplKUmNVC3mK79?=
 =?us-ascii?Q?3LjmMam6P9GwfuRZnhoiUO8o5D7D1SgSxt/cIcxnAYxs/ZE7mJe0NEG8LUhE?=
 =?us-ascii?Q?YISho4CpeY50THsq70hJ2dv9mtfF+b4zeEudmNdbT0Ma64YHxG6k2n47fHbg?=
 =?us-ascii?Q?f45WFLLfa8UnW+rgpbz7tBTJRQkl95XcDuogQ/6aDPJVhbepHrdGvMCvZAwG?=
 =?us-ascii?Q?A+iwlCrfvrDjP4twXaPOlJ+A?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7115cb09-e4f0-4646-d017-08d932f35be4
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Jun 2021 07:25:04.6673
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ecW6zmJLLmO2Ru0mNOF59iTbG+tKz9quWNbPI3D9chTyrIz06jAPTflNHewCTRzUE1Ja2oyOvxZ4grIihsl1lUsDbxXN7vH6BA+mAm07itI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7048
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Kieran,

Thanks for the patch.

> Subject: [PATCH] media: vsp1: Simplify DRM UIF handling
>=20
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
>=20
> In commit 6732f3139380 ("media: v4l: vsp1: Fix uif null pointer access")
> the handling of the UIF was over complicated, and the patch applied befor=
e
> review.
>=20
> Simplify it to keep the conditionals small.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

I forgot this. Thanks for taking care this.

Reviewed-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>=20
> Another one that I had lying around in my tree for too long ....
>=20
>  drivers/media/platform/vsp1/vsp1_drm.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/vsp1/vsp1_drm.c
> b/drivers/media/platform/vsp1/vsp1_drm.c
> index 06f74d410973..0c2507dc03d6 100644
> --- a/drivers/media/platform/vsp1/vsp1_drm.c
> +++ b/drivers/media/platform/vsp1/vsp1_drm.c
> @@ -455,6 +455,10 @@ static int vsp1_du_pipeline_setup_inputs(struct
> vsp1_device *vsp1,
>  		dev_err(vsp1->dev, "%s: failed to setup UIF after %s\n",
>  			__func__, BRX_NAME(pipe->brx));
>=20
> +	/* If the DRM pipe does not have a UIF there is nothing we can
> update. */
> +	if (!drm_pipe->uif)
> +		return 0;
> +
>  	/*
>  	 * If the UIF is not in use schedule it for removal by setting its
> pipe
>  	 * pointer to NULL, vsp1_du_pipeline_configure() will remove it from
> the @@ -462,9 +466,9 @@ static int vsp1_du_pipeline_setup_inputs(struct
> vsp1_device *vsp1,
>  	 * make sure it is present in the pipeline's list of entities if it
>  	 * wasn't already.
>  	 */
> -	if (drm_pipe->uif && !use_uif) {
> +	if (!use_uif) {
>  		drm_pipe->uif->pipe =3D NULL;
> -	} else if (drm_pipe->uif && !drm_pipe->uif->pipe) {
> +	} else if (!drm_pipe->uif->pipe) {
>  		drm_pipe->uif->pipe =3D pipe;
>  		list_add_tail(&drm_pipe->uif->list_pipe, &pipe->entities);
>  	}
> --
> 2.30.2

