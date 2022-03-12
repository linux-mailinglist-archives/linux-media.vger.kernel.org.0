Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 81B5C4D6D3A
	for <lists+linux-media@lfdr.de>; Sat, 12 Mar 2022 08:22:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231219AbiCLHXu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 12 Mar 2022 02:23:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231205AbiCLHXu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 12 Mar 2022 02:23:50 -0500
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on2139.outbound.protection.outlook.com [40.107.113.139])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C486420D894;
        Fri, 11 Mar 2022 23:22:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbBWwS6oEwqa2R41wMj5wRO6V9pH8mrqSE/zLpxN+uc3a5+pVhENbUr4egpJKpzZ5H6wjnysoTmYc1TTGptK3zeW6llIQO9h3G0SuH7f0rS4fwuoIhHcQQZgA2S1oPmTOy1RKzpZO6ndkTvPOFKanQa2fczbpnCwnhn2/AIWaTrY0an/eis0OhjWoPs0i9Z/IgiiotYMUJm+ypGDqZ6fJ41YO2Ci6L7xtkHwDzo3SdGXSwCc0GXj5anMfkR94HbSGF3xNh82B/7kSRf9ECUdv8WGBDhp4G1qvsUUq/I/fMkTUXxRR97s0F9FhIOVOPMaY5+2RRZEQ9Kcn2cERNYggQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UFYG0RiW1wZKBKnjbESkES5kFsmVnAJabdyWEQSkWJ0=;
 b=PpEnMbNFxjCafFRs8wBh5Tye9z4hXZfFDqTeB97Rm6SDZaKg2B3h/IN2FVQn4JP2nUVNxpEGgRlq6LYKcwLmVVJnW7b8YcYAnbKCydm6DcOc1wcddnBedATOClZz+7mb08anpAQqGuLWd3LSlW67ZB5DStZmEvUP6YsLWDNYq/O4trtUeaVHmsnpmehPQGl4sP+P6B//rxVeiuCAaQZCs67srAWwrtBFr76M0kioy9ozT8myv3hBcHtgFntIgiD38Z7V0EsUnvvGR0cpF8N4o1jjImxs9kK2OIUtAMWL+Rx6wx3GQ36RkK3dfAC6ZJgCgd/M3xaXU1KtPKr/GOaV+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UFYG0RiW1wZKBKnjbESkES5kFsmVnAJabdyWEQSkWJ0=;
 b=NsmicUY4Z8N0peFtxK+P7RZ4nLxv5uqZJyKLk2srQeiQz7vKkYDCUd2oQSeNOKiZXDehIDa1EQx42Dma+yG2dj6vy/RiRNqeK1PtbDujbhnQZEmscnOzumDh+HTPCO9DDlcXzfp4Xz6QdPml5KypKWMlY/9l0o7tqnacAnj5HzA=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OS3PR01MB8194.jpnprd01.prod.outlook.com (2603:1096:604:174::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.21; Sat, 12 Mar
 2022 07:22:33 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::cc77:910b:66c1:524b%5]) with mapi id 15.20.5061.025; Sat, 12 Mar 2022
 07:22:32 +0000
From:   Biju Das <biju.das.jz@bp.renesas.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: RE: [PATCH v4 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Topic: [PATCH v4 3/3] media: vsp1: Add support for RZ/G2L VSPD
Thread-Index: AQHYNUg6quTVs1n6bkyC4b6GP4ysoay7WMTA
Date:   Sat, 12 Mar 2022 07:22:32 +0000
Message-ID: <OS0PR01MB59226770E359A2611C1F77B8860D9@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20220311130158.27158-1-biju.das.jz@bp.renesas.com>
 <20220311130158.27158-4-biju.das.jz@bp.renesas.com>
In-Reply-To: <20220311130158.27158-4-biju.das.jz@bp.renesas.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3de5630a-8104-44b7-4853-08da03f91300
x-ms-traffictypediagnostic: OS3PR01MB8194:EE_
x-microsoft-antispam-prvs: <OS3PR01MB81944C7238BB0ABBF649D8DD860D9@OS3PR01MB8194.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: iRQg3BHVAG7U/Fxk82lt4c7n23WzTsRWCrE6RFaBqJKs1bCkkHdIDKre6trv8q/YS7DukXh1joMep9vZf3Y1H6bGnfC9jkNBxQWy93v3eqYd8KfSU6yEG6Ypt25lyaRM0TkmnEycNC2eO9AmJp8kERVEs48xnVzla22Iye+zISRyE9egPamiXrdtfWX/XkONtGf5+Y6PDIxOD/pvHzTrt0Ew6XMDc3+0PIwHhhTi0Py5Bm2eUkRYfw2j32tHQTwpjd2wYwvoLujHjUbP1xxopmpEYQ7oMrhHI87IbekRllaunltVHHXmq0dq9o8eOGpDBrM2kB1cFp+Oky13wztwvaBXcyj+iaXDfyI9PHSp3LiR5DuGUIzUrgipk7hRzdPuPufbe49stUKNxHrLU6O3CPj7Ok/dYDBePlkoFpdzPsDd88PsUkegCVrfT628B7yBB/8wmGGNZ5xfdTaKIX4ZxaSbXPNB36Ze0TuKiXlWWcOiYlBOmNRk/I3x8tFTGpHbcWbfhLaELVJrqj87uJB89bZLuanEGnCn7D5y3Ia9f7UFH0oIzHuib3xWgYVL6CWWa8/XjmMBgPzq1eeXm3fj/RJSyq0AoCztwVhCwkCD8cFiaxEEtN+NizX+oznKLdQDFDL0xK18o3FLTS/q0+G75vL4vhrOQz8Ns4EQ3d7kam0JO1DkeWgMJLYh6ssCdHgR9XQkNf6/K2FmRXGBZW5/DQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS0PR01MB5922.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(38070700005)(9686003)(2906002)(55016003)(316002)(7696005)(6506007)(122000001)(54906003)(38100700002)(110136005)(71200400001)(66476007)(83380400001)(26005)(508600001)(186003)(86362001)(33656002)(5660300002)(52536014)(4326008)(76116006)(107886003)(66946007)(64756008)(8676002)(8936002)(66556008)(66446008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?1n++dFLqpe90CH8BZtc6rs8XcEPaFPRv6e8LINifnce9JHvqtlMgfH2M90Rd?=
 =?us-ascii?Q?OxXQ0dhOt4t/4qCi5z2rjcrVHODGtNe5cO+vtLtO2vLa3ry21XT2UsbSYfUm?=
 =?us-ascii?Q?x9NnaATW2bzoh4uzbOVa/DyNidQmi5D2wxCEr0oMIOtGvOY/jUubBMGIeE2f?=
 =?us-ascii?Q?oJ/CxlbZ5hp2K8dOC1etGnXT1pgnz/gxgvPxVqpX7xiNhQ0z6QYkn0AT1lIV?=
 =?us-ascii?Q?HkKEiS3MdQUf8pIypVoH0dY5OUcvjLF4doxebrdczNMq9cmzCBlGyD/bAaCT?=
 =?us-ascii?Q?XCRMCrfRJQ6EQwZpz+BuT5sLc20W8eecVN2v8xC00EeTokLHUh84Tw0PQ3mB?=
 =?us-ascii?Q?c+It0jnRAuwgCtTndueeb6sUtoBz3w/BrmdEPNNQeFw/ihNv6ZMnVhS79wvi?=
 =?us-ascii?Q?nCVCbHGR/gL4Tc7D1//L44mdo/DSsWpVHY3KvZPn2DTtz1+d6E4mCkJp3IHE?=
 =?us-ascii?Q?E+ZoZUOlAYZCPD6WssOnMhb0VaPauE8pfMiJmnG6XKWZecSSKszwRFevbq3H?=
 =?us-ascii?Q?riULtdaCRxsb5WveSULJ5lm9jLEh5QJ4M6YIzqji0vPsaGsrCKVBVHIQ/oES?=
 =?us-ascii?Q?tZEfJqvCMcfN2PsVSojdLKdcGon+JEyDETVEVOVXnPkG6W6SrVCYlev2mLDu?=
 =?us-ascii?Q?Hy+eW4PjlTDrY4EPZvGhHOp9Omo8KxM5uZw4TdX/nVbKkLa8KBNHEsOuTxc2?=
 =?us-ascii?Q?uQUEcb0hArBdOH5ETDsDhgGVnPMhY/lM7DTVOX5LA0NtNew+oU4ld+HCzTNe?=
 =?us-ascii?Q?om5TfBgX29q+CH/P1I7YVN+e4UvkDecy1SDUmRGCSlXvzEMneS+RQD6pWirK?=
 =?us-ascii?Q?TAJLSQjtsWIlHN3ztzKrvhdHycVPhiZinj0R+MtHrJtX6p3iV01j3bPz97jb?=
 =?us-ascii?Q?VrOwVbrOLr6F7A75FBybEn6SrVwqb2RGDtXUbdrLYRPz9CznJe2xlvayoC0H?=
 =?us-ascii?Q?tSxfLNQ6eR+xOJOrpbj1vimn6cCxGbQL+aIjiJpC4Khh1L+CLApXyr9Ufrt2?=
 =?us-ascii?Q?8dy7IaqJnEuOA24Y1DFNCM3UPxArVwSP3F0uPiakPkOYKAEXOBlwDhC1wlIN?=
 =?us-ascii?Q?AxO7LW+Dom6g+2RuIQ2iKnHLtoJJv6lGnO6Ol6ppBGN9WLxY46xsmmxqCBzJ?=
 =?us-ascii?Q?9dNcMT/d8FKqY3U+mFPvdnjFe8vHhzWiGXSGVtsf9AtKYaYAHM64drW+eAgw?=
 =?us-ascii?Q?JeLPYTag15DvqHTdCSyNrnDHLly6lm1IaLoWYHCjKaIsGY0pIHyuBxm0SqmI?=
 =?us-ascii?Q?m5DR9kwKplpbOXiz6p8jtE5CieWdwwDd4G/k+7ZszrxUvoZKmaOZasQTyorM?=
 =?us-ascii?Q?AGXfW4TbjnDH7p2kCizizxlXy0yPZuuYGVBkd/sV8p4jcnWpROTeqQ5s3omu?=
 =?us-ascii?Q?/p2/7VFOihk+LS4lhH1A85kUyiqvrk4thOj+r6T9r2Pcmvj/5K39Qpx1gJHe?=
 =?us-ascii?Q?7rTvVFEMERFFEOJXbsm1fvRjNR6mOMNkZY6RNbbTZCcIwxqEk0f64A=3D=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de5630a-8104-44b7-4853-08da03f91300
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Mar 2022 07:22:32.5622
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yFJ9ssE3N1/V/J3N/ewsjO4kUXKD/AQsSkJ0t2uOCcEaLGxH/3kwuqN4doq4uTkLdFlK+jfOSiiu8abPtqd+lVZTSy5KQ7CVWm9YEAiE4SY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB8194
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi all,

> <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Subject: [PATCH v4 3/3] media: vsp1: Add support for RZ/G2L VSPD
>=20
> The RZ/G2L VSPD provides a single VSPD instance. It has the following sub
> modules MAU, CTU, RPF, DPR, LUT, BRS, WPF and LIF.
>=20
> The VSPD block on RZ/G2L does not have a version register, so added a new
> compatible string "renesas,rzg2l-vsp2" with a data pointer containing the
> info structure. Also the reset line is shared with the DU module.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3->v4:
>  * Added Rb tag from Geert
>  * Add switch() for LIF0 buffer attribute handling for RZ/G2L and V3M
> v2->v3:
>  * Fixed version comparison in vsp1_lookup()
> v1->v2:
>  * Changed the compatible from vsp2-rzg2l->rzg2l-vsp2
>  * Added standalone device info for rzg2l-vsp2.
>  * Added vsp1_lookup helper function.
>  * Updated comments for LIF0 buffer attribute register
>  * Used last ID for rzg2l-vsp2.
> RFC->v1:
>  * Used data pointer containing info structure to retrieve version
> information
> RFC:
> ---
>  drivers/media/platform/vsp1/vsp1_drv.c  | 44 +++++++++++++++++++------
> drivers/media/platform/vsp1/vsp1_lif.c  | 16 +++++----
> drivers/media/platform/vsp1/vsp1_regs.h |  2 ++
>  3 files changed, 46 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/media/platform/vsp1/vsp1_drv.c
> b/drivers/media/platform/vsp1/vsp1_drv.c
> index 699d7d985df4..4eef6d525eda 100644
> --- a/drivers/media/platform/vsp1/vsp1_drv.c
> +++ b/drivers/media/platform/vsp1/vsp1_drv.c
> @@ -811,11 +811,37 @@ static const struct vsp1_device_info
> vsp1_device_infos[] =3D {
>  	},
>  };
>=20
> +static const struct vsp1_device_info rzg2l_vsp2_device_info =3D {
> +		.version =3D VI6_IP_VERSION_MODEL_VSPD_RZG2L,
> +		.model =3D "VSP2-D",
> +		.gen =3D 3,
> +		.features =3D VSP1_HAS_BRS | VSP1_HAS_WPF_VFLIP |
> VSP1_HAS_EXT_DL,
> +		.lif_count =3D 1,
> +		.rpf_count =3D 2,
> +		.wpf_count =3D 1,
> +};
> +
> +static const struct vsp1_device_info *vsp1_lookup(struct vsp1_device
> *vsp1,
> +						  u32 version)
> +{
> +	unsigned int i;
> +
> +	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> +		if ((version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> +		    vsp1_device_infos[i].version) {
> +			vsp1->info =3D &vsp1_device_infos[i];
> +			break;
> +		}
> +	}
> +
> +	return vsp1->info;
> +}
> +
>  static int vsp1_probe(struct platform_device *pdev)  {
>  	struct vsp1_device *vsp1;
>  	struct device_node *fcp_node;
> -	unsigned int i;
> +	u32 version;
>  	int ret;
>  	int irq;
>=20
> @@ -871,24 +897,21 @@ static int vsp1_probe(struct platform_device *pdev)
>  	if (ret < 0)
>  		goto done;
>=20
> -	vsp1->version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> -
> -	for (i =3D 0; i < ARRAY_SIZE(vsp1_device_infos); ++i) {
> -		if ((vsp1->version & VI6_IP_VERSION_MODEL_MASK) =3D=3D
> -		    vsp1_device_infos[i].version) {
> -			vsp1->info =3D &vsp1_device_infos[i];
> -			break;
> -		}
> +	vsp1->info =3D of_device_get_match_data(&pdev->dev);
> +	if (!vsp1->info) {
> +		version =3D vsp1_read(vsp1, VI6_IP_VERSION);
> +		vsp1->info =3D vsp1_lookup(vsp1, version);
>  	}
>=20
>  	if (!vsp1->info) {
>  		dev_err(&pdev->dev, "unsupported IP version 0x%08x\n",
> -			vsp1->version);
> +			version);
>  		vsp1_device_put(vsp1);
>  		ret =3D -ENXIO;
>  		goto done;
>  	}
>=20
> +	vsp1->version =3D vsp1->info->version;
>  	dev_dbg(&pdev->dev, "IP version 0x%08x\n", vsp1->version);
>=20
>  	/*
> @@ -940,6 +963,7 @@ static int vsp1_remove(struct platform_device *pdev)
> static const struct of_device_id vsp1_of_match[] =3D {
>  	{ .compatible =3D "renesas,vsp1" },
>  	{ .compatible =3D "renesas,vsp2" },
> +	{ .compatible =3D "renesas,rzg2l-vsp2", .data =3D
> &rzg2l_vsp2_device_info
> +},
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, vsp1_of_match); diff --git
> a/drivers/media/platform/vsp1/vsp1_lif.c
> b/drivers/media/platform/vsp1/vsp1_lif.c
> index 6a6857ac9327..37b767adba23 100644
> --- a/drivers/media/platform/vsp1/vsp1_lif.c
> +++ b/drivers/media/platform/vsp1/vsp1_lif.c
> @@ -107,6 +107,7 @@ static void lif_configure_stream(struct vsp1_entity
> *entity,
>=20
>  	case VI6_IP_VERSION_MODEL_VSPDL_GEN3:
>  	case VI6_IP_VERSION_MODEL_VSPD_V3:
> +	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
>  		hbth =3D 0;
>  		obth =3D 1500;
>  		lbth =3D 0;
> @@ -130,16 +131,19 @@ static void lif_configure_stream(struct vsp1_entity
> *entity,
>  			VI6_LIF_CTRL_REQSEL | VI6_LIF_CTRL_LIF_EN);
>=20
>  	/*
> -	 * On R-Car V3M the LIF0 buffer attribute register has to be set to
> a
> -	 * non-default value to guarantee proper operation (otherwise
> artifacts
> -	 * may appear on the output). The value required by the manual is
> not
> -	 * explained but is likely a buffer size or threshold.
> +	 * On R-Car V3M and RZ/G2L the LIF0 buffer attribute register has to
> be
> +	 * set to a non-default value to guarantee proper operation
> (otherwise
> +	 * artifacts may appear on the output). The value required by the
> +	 * manual is not explained but is likely a buffer size or threshold.
>  	 */
> -	if ((entity->vsp1->version & VI6_IP_VERSION_MASK) =3D=3D
> -	    (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M))
> +	switch (entity->vsp1->version & VI6_IP_VERSION_MODEL_MASK) {

My bad, It is VI6_IP_VERSION_MASK, not VI6_IP_VERSION_MODEL_MASK. I will se=
nd V5 fixing this.

Cheers,
Biju


> +	case (VI6_IP_VERSION_MODEL_VSPD_V3 | VI6_IP_VERSION_SOC_V3M):
> +	case VI6_IP_VERSION_MODEL_VSPD_RZG2L:
>  		vsp1_lif_write(lif, dlb, VI6_LIF_LBA,
>  			       VI6_LIF_LBA_LBA0 |
>  			       (1536 << VI6_LIF_LBA_LBA1_SHIFT));
> +		break;
> +	}
>  }
>=20
>  static const struct vsp1_entity_operations lif_entity_ops =3D { diff --g=
it
> a/drivers/media/platform/vsp1/vsp1_regs.h
> b/drivers/media/platform/vsp1/vsp1_regs.h
> index fae7286eb01e..3dda11fe4e08 100644
> --- a/drivers/media/platform/vsp1/vsp1_regs.h
> +++ b/drivers/media/platform/vsp1/vsp1_regs.h
> @@ -767,6 +767,8 @@
>  #define VI6_IP_VERSION_MODEL_VSPDL_GEN3	(0x19 << 8)
>  #define VI6_IP_VERSION_MODEL_VSPBS_GEN3	(0x1a << 8)
>  #define VI6_IP_VERSION_MODEL_VSPD_V3U	(0x1c << 8)
> +/* RZ/G2L SoC's have no version register, So using last ID for the
> version */
> +#define VI6_IP_VERSION_MODEL_VSPD_RZG2L	(0xff << 8)
>=20
>  #define VI6_IP_VERSION_SOC_MASK		(0xff << 0)
>  #define VI6_IP_VERSION_SOC_H2		(0x01 << 0)
> --
> 2.17.1

