Return-Path: <linux-media+bounces-500-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E47EF322
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 13:58:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 851681F23CD7
	for <lists+linux-media@lfdr.de>; Fri, 17 Nov 2023 12:58:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB18630352;
	Fri, 17 Nov 2023 12:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=bp.renesas.com header.i=@bp.renesas.com header.b="KwjWeCbv"
X-Original-To: linux-media@vger.kernel.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2134.outbound.protection.outlook.com [40.107.114.134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64A82D4E;
	Fri, 17 Nov 2023 04:58:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YkuCpO8a6hH1C37q7oy16DPeVJrokS/OsBwjy7Q7VyBT13h318JwwycEv7R1DZZE5M0hrG1F26A9uoobCTX6WdiFKPWmCGyxhKi/mU3t5BUHBNA0iBzBhse0y4qU7IM9nGywANYlqjkSQK88CIJdc2qK3NZ8fOu3Ujx6dMWh4CmZi8uwowdltef6+w122AP0X1rJBdwtTpPalWxTmZpmLRhEsiQAghG6c+r2JfOHsjMfzlS1Q+ctwWRs2uj6EDh+j0u2wh/84tc1/gnjy8ELz12gXYYY7eGkjn2oOeQXP361Tx2ZlhpijBBP7JaMkTsZrwGt/14q5LBCK/mDD1aq4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z0PExbUbqNrXBkghTTvdAjizJmb/CSYUXl9owuH09jE=;
 b=M80jVy7WN8JA+AjbPtxF+ZCe2RNCfU0XHhf26tJrFE2WG6puuBzrbBe1WmbNNUCNFolSgC2nhNkMCiTZ3jnhV8RHvxO9lgCl6ui4MSL8H8oN6m0wy2ykthQJbo6Yuh9npu6AgcX8oQa2UUiIkps8CBpr1ILCzq5+Nxk0m0KJOkkITIoxNjeQCAP19m6iDdrbBZu5u8gLcjlNHmVvdwcysP8mP6rG/bivEKjv8haHGpu0t7N6LzYeiSIfmnxiYIVq3KXZOaTFZEqm0CiKzMoBw43C8EVX+3rBeM2265JFgSZCaqqa0c+JacozpMgjsK0eL0m9ovWBr8b67awVdDy7oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z0PExbUbqNrXBkghTTvdAjizJmb/CSYUXl9owuH09jE=;
 b=KwjWeCbvSrarjYeZVq0VCUxerfVxowwdY+xfseTpUVTi8u54pPKjsXIgndFO+MtS2zV3X4T7yf1VBJI7cCfIQko3MSnuKfC0mrucSYtl6yazaOqXK9vyus+IRvolrOyagG9Zbq+HfSkmbrpiLtg2KZh7s3jttwAqxGGx/fWJTwU=
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 (2603:1096:400:3c0::10) by OSZPR01MB7940.jpnprd01.prod.outlook.com
 (2603:1096:604:1bc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.23; Fri, 17 Nov
 2023 12:58:40 +0000
Received: from TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b]) by TYCPR01MB11269.jpnprd01.prod.outlook.com
 ([fe80::6069:90c7:909:c89b%7]) with mapi id 15.20.7002.025; Fri, 17 Nov 2023
 12:58:38 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC: Kieran Bingham <kieran.bingham@ideasonboard.com>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: RE: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
Thread-Topic: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
Thread-Index: AQHaBoXxkGTpbl3jPUyC5YUf97AmyrB+nhsA
Date: Fri, 17 Nov 2023 12:58:38 +0000
Message-ID:
 <TYCPR01MB11269593901BC517B1975BC7A86B7A@TYCPR01MB11269.jpnprd01.prod.outlook.com>
References: <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To:
 <20231024142522.29658-1-laurent.pinchart+renesas@ideasonboard.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYCPR01MB11269:EE_|OSZPR01MB7940:EE_
x-ms-office365-filtering-correlation-id: 3cbe446b-736e-4d1e-df4b-08dbe76ceaca
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xWk12Zcie9nh3SspDl5vVJcbk2Jh++D8aqT0H7dOm7q9NdeeDlT+XYtWq5+RshCO8iOk9rve2suHdlBbO+xF1whLa28kmHHd8/u9U7vL+qHdgWMm5sGZ9XZoVjccKeLcjnYW8dkIPnpzlxcIeAgqd+0xbhIEu0MKfPhL2nHHEZW34vrHbUQSJ4owVW+9GvcNM6BdCqA98kcn5iKIXKfurzpq5LYyi9w72+nZ7raja1IeXuUdxkcMC42hTqaJ4538ZF0+4azgmiwcV4ZjXWDyJ4IWsGTk0y9O/FQbqIMcB1SGUgY+oJSNHvxtQ0iIQnXcNDYpZnbw+m2m+4oMlKmwUOmrrVKz1Wpg8trBUy3NT3koWjpbJVwC7tiV6X8tgNdRnJZDfVGRRDByLGCYsB29zo/PCqr/XGTQ+B2xgLPVuhVOzBqayrDqHjrC9X1UEfyyFlNzB2doCDcC6b83QCBy/Nmdb/dYk6AhO8X9NvbSGaHURw+HnQVrY5TGdOJskuvVcehp8wt4NJGaQKYUZ5SMUxIBo+Y0ENMmjuebsrDDbZnI8jxBA81KMp3CxOFJFgPxGEcLVprKSwv/x/WZ0WOrr15SVL7kPM47Rlfj1Y5NJkwxa3EZYE0HbuRwO/zXUXIqxzQRVuIz+lW/iM9ltV36+tCXBkgCvMu4V4EVxb0SP/QWajwmW6QnOKTGDzpnStjF
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB11269.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(346002)(376002)(396003)(230273577357003)(230173577357003)(230922051799003)(186009)(64100799003)(451199024)(1800799009)(55016003)(86362001)(33656002)(478600001)(66556008)(66946007)(38070700009)(76116006)(110136005)(66476007)(66446008)(64756008)(316002)(6506007)(7696005)(9686003)(53546011)(4326008)(52536014)(8676002)(8936002)(71200400001)(26005)(54906003)(5660300002)(122000001)(83380400001)(2906002)(41300700001)(38100700002)(142923001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?C+7cszloLgAa6c/vw0k1Dv78X1j0wXGKA1PAa5CArSMCNUGF3bMxx8mt1Um8?=
 =?us-ascii?Q?jA7+hd9P/kbUbnuedcFoNGhOmLLB9YZedxHeUYZLIMvF2mseJEzl9jrnNObb?=
 =?us-ascii?Q?nxlR6wQxCirWsVy318mrCmCnan9a+nA9G8s9WvdtaR6BoMf6FIz8tHJo8WBA?=
 =?us-ascii?Q?3WFZcfE8OKi8mGTO610ya2ChRHuY7Hjo+/TGV7RfupWREc4EOTLDFkpRdJeO?=
 =?us-ascii?Q?mjrMiJxwflEXECSY/yrx6NIe7bBhJtSXKFnpLIHILSfG0PzEPfKtpbIJWP8w?=
 =?us-ascii?Q?1FPdJMIUSnPwnb4ZtUnzOFnOZ3w18h9D6EQkydXg98y/nuPIBGlp7aV+dyea?=
 =?us-ascii?Q?8quMLpq1fGp7VQru1ubBdmtKuXPCMKpOdx1C9zrmMynN1+UAcbgPmnMwSQ7J?=
 =?us-ascii?Q?wY9F4dHkhcikbKHHijW7slJKLObTEtgyUH5vMudyfBZ7Co84Nn8IB0q21I1g?=
 =?us-ascii?Q?9ZpTCtBbRPDzCZjx53N22eONMTzGHMXUxCNRvUUeT/gYFliqrueC5cUHLDyV?=
 =?us-ascii?Q?FdKa56ELLcXBZPzLi4j2kcwcSKAJtd8q5ZyWZ+IkpcLtbezGraD5LdaM69Y8?=
 =?us-ascii?Q?8/SsyZ57rKhr82JY2F/IWz4nBqSFF/x3kgVSFnEPbY3MYcZ5oQg500m6xwZ0?=
 =?us-ascii?Q?vnc2gKmefh/3t55RwD3yiyaExjwOL9YleHyFLb2308Y6XscWohZqUYRgD+NZ?=
 =?us-ascii?Q?+8Wn0NU7cPRoxABZYbVOC2eLhEpzdg9DNsxPtduG+NaqVpXJ2MUfHXgqw3hb?=
 =?us-ascii?Q?tSHGrRvFc0tuH3NNsGefxaqO2m6ygiS6ZbVyOhs2L2tnvOSJFWItaxy3y5CZ?=
 =?us-ascii?Q?ZnGWUzHCKk9Ta4LR/2Lvl/0h8G1SQEqqpg6vnxqU3bQQsXQRpeNOOFR31YVu?=
 =?us-ascii?Q?VL9L8wzIfwlhStO/01eg0+WVV2A+8xiRxjXElDVR4U1XOYSuSkIatYfCsi1c?=
 =?us-ascii?Q?6nVA4b08TOAxcDHngjLMg19MoAX9uErwrt9TN+HNrZ0C4veb+5qYjgp+6roa?=
 =?us-ascii?Q?+4w+oebZKuXWAhiu4SGtm+leCKY6TRMmiVuCXQVQML2mk90o+YJRF4ByiuLV?=
 =?us-ascii?Q?eEJJaqdKc1LdEl5Pn4ow/unj7CBb9+0vhELpUeu89rqbLQzlDEfqCBDu5jmI?=
 =?us-ascii?Q?8bPlHX57/tYqtC1Pkrh9R2R0815jjPXRCJy0L587Oj03sql5jRbDByCmhWiz?=
 =?us-ascii?Q?XfXayZPQSkBaw6Nl4a03e/8aTFF0UPcMteKF5RsMM6n7TgQd9wHt82RY+9je?=
 =?us-ascii?Q?ujIGAqTYrlWlZa3gSjfe8gSUD7g7jhF4hh4ALGyKq1tlC9DG4wXgcbPlsKu6?=
 =?us-ascii?Q?ocaebkc16PsejAytZ4no5y9lk/mgM8KNcpEasjNDX4dHpGmO3sjT5nhB9Nrp?=
 =?us-ascii?Q?aHqiqtmPVeaGLM7YUDmcKzOKcH1LHUZoK36MWgoE5yIFMPdI5uO9O6N5GG8H?=
 =?us-ascii?Q?6+Uk1NH/XifGlP0WlRvKyNVC9nZyyNNBgYfpuNKt4yriqUEZMbpkEGdZ9Xt/?=
 =?us-ascii?Q?BcGPDUMRWJA20611Q6q6eq7WJnFj3HSruPMzvXUBDmPu3VUy16eA8uvFx2qC?=
 =?us-ascii?Q?IZxBhvwEK6i/5Ka9wEmqIoGVrN29QrgNAPNxxfDsICOYm0TghCVl4p3CY4DK?=
 =?us-ascii?Q?ZA=3D=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 3cbe446b-736e-4d1e-df4b-08dbe76ceaca
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Nov 2023 12:58:38.4694
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: v0irIAZ+qIxOeZrlD4Z52zUap5HtlvK68EyPO4OxxXE7H/ExQg/ABrJxlKC5Fd71SSyEkXDABI4dkup7eoC0gCl9Cze9mrcAIcuIGvwLisk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSZPR01MB7940

Hi Laurent,

Thanks for the patch.

> -----Original Message-----
> From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> Sent: Tuesday, October 24, 2023 3:25 PM
> To: linux-media@vger.kernel.org
> Cc: Kieran Bingham <kieran.bingham@ideasonboard.com>; linux-renesas-
> soc@vger.kernel.org; Geert Uytterhoeven <geert@linux-m68k.org>
> Subject: [PATCH] media: vsp1: Remove unbalanced .s_stream(0) calls
>=20
> The VSP1 driver uses the subdev .s_stream() operation to stop WPF
> instances, without a corresponding call to start them. The V4L2 subdev
> core started warning about unbalanced .s_stream() calls in commit
> 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream()
> requirements"), causing a regression with this driver.
>=20
> Fix the problem by replacing the .s_stream() operation with an explicit
> function call for WPF instances. This allows sharing an additional data
> structure between RPF and WPF instances.
>=20
> Fixes: 009905ec5043 ("media: v4l2-subdev: Document and enforce .s_stream(=
)
> requirements")
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Closes:
> Signed-off-by: Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com>

Unbind/ bind calls works fine on RZ/G2L DRM driver with this patch.

Tested-by: Biju Das <biju.das.jz@bp.renesas.com>

Cheers,
Biju

> ---
>  .../media/platform/renesas/vsp1/vsp1_pipe.c   |  2 +-
>  .../media/platform/renesas/vsp1/vsp1_rpf.c    | 10 +------
>  .../media/platform/renesas/vsp1/vsp1_rwpf.c   |  8 +++--
>  .../media/platform/renesas/vsp1/vsp1_rwpf.h   |  4 ++-
>  .../media/platform/renesas/vsp1/vsp1_wpf.c    | 29 ++-----------------
>  5 files changed, 14 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> index f8093ba9539e..68d05243c3ee 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_pipe.c
> @@ -373,7 +373,7 @@ int vsp1_pipeline_stop(struct vsp1_pipeline *pipe)
>  			   (7 << VI6_DPR_SMPPT_TGW_SHIFT) |
>  			   (VI6_DPR_NODE_UNUSED << VI6_DPR_SMPPT_PT_SHIFT));
>=20
> -	v4l2_subdev_call(&pipe->output->entity.subdev, video, s_stream, 0);
> +	vsp1_wpf_stop(pipe->output);
>=20
>  	return ret;
>  }
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> index 3b17f5fa4067..ea12c3f12c92 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rpf.c
> @@ -43,14 +43,6 @@ static inline void vsp1_rpf_write(struct vsp1_rwpf
> *rpf,
>  			       data);
>  }
>=20
> -/* ---------------------------------------------------------------------=
-
> -------
> - * V4L2 Subdevice Operations
> - */
> -
> -static const struct v4l2_subdev_ops rpf_ops =3D {
> -	.pad    =3D &vsp1_rwpf_pad_ops,
> -};
> -
>  /* ---------------------------------------------------------------------=
-
> -------
>   * VSP1 Entity Operations
>   */
> @@ -411,7 +403,7 @@ struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_device
> *vsp1, unsigned int index)
>  	rpf->entity.index =3D index;
>=20
>  	sprintf(name, "rpf.%u", index);
> -	ret =3D vsp1_entity_init(vsp1, &rpf->entity, name, 2, &rpf_ops,
> +	ret =3D vsp1_entity_init(vsp1, &rpf->entity, name, 2,
> +&vsp1_rwpf_subdev_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> index 22a82d218152..e0f87c8103ca 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.c
> @@ -24,7 +24,7 @@ struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf
> *rwpf,  }
>=20
>  /* ---------------------------------------------------------------------=
-
> -------
> - * V4L2 Subdevice Pad Operations
> + * V4L2 Subdevice Operations
>   */
>=20
>  static int vsp1_rwpf_enum_mbus_code(struct v4l2_subdev *subdev, @@ -243,=
7
> +243,7 @@ static int vsp1_rwpf_set_selection(struct v4l2_subdev *subdev,
>  	return ret;
>  }
>=20
> -const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops =3D {
> +static const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops =3D {
>  	.init_cfg =3D vsp1_entity_init_cfg,
>  	.enum_mbus_code =3D vsp1_rwpf_enum_mbus_code,
>  	.enum_frame_size =3D vsp1_rwpf_enum_frame_size, @@ -253,6 +253,10 @@
> const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops =3D {
>  	.set_selection =3D vsp1_rwpf_set_selection,  };
>=20
> +const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops =3D {
> +	.pad    =3D &vsp1_rwpf_pad_ops,
> +};
> +
>  /* ---------------------------------------------------------------------=
-
> -------
>   * Controls
>   */
> diff --git a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> index eac5c04c2239..e0d212c70b2f 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_rwpf.h
> @@ -79,9 +79,11 @@ static inline struct vsp1_rwpf *entity_to_rwpf(struct
> vsp1_entity *entity)  struct vsp1_rwpf *vsp1_rpf_create(struct vsp1_devic=
e
> *vsp1, unsigned int index);  struct vsp1_rwpf *vsp1_wpf_create(struct
> vsp1_device *vsp1, unsigned int index);
>=20
> +void vsp1_wpf_stop(struct vsp1_rwpf *wpf);
> +
>  int vsp1_rwpf_init_ctrls(struct vsp1_rwpf *rwpf, unsigned int ncontrols)=
;
>=20
> -extern const struct v4l2_subdev_pad_ops vsp1_rwpf_pad_ops;
> +extern const struct v4l2_subdev_ops vsp1_rwpf_subdev_ops;
>=20
>  struct v4l2_rect *vsp1_rwpf_get_crop(struct vsp1_rwpf *rwpf,
>  				     struct v4l2_subdev_state *sd_state); diff --
> git a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> index d0074ca00920..cab4445eca69 100644
> --- a/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> +++ b/drivers/media/platform/renesas/vsp1/vsp1_wpf.c
> @@ -186,17 +186,13 @@ static int wpf_init_controls(struct vsp1_rwpf
> *wpf)  }
>=20
>  /* ---------------------------------------------------------------------=
-
> -------
> - * V4L2 Subdevice Core Operations
> + * VSP1 Entity Operations
>   */
>=20
> -static int wpf_s_stream(struct v4l2_subdev *subdev, int enable)
> +void vsp1_wpf_stop(struct vsp1_rwpf *wpf)
>  {
> -	struct vsp1_rwpf *wpf =3D to_rwpf(subdev);
>  	struct vsp1_device *vsp1 =3D wpf->entity.vsp1;
>=20
> -	if (enable)
> -		return 0;
> -
>  	/*
>  	 * Write to registers directly when stopping the stream as there
> will be
>  	 * no pipeline run to apply the display list.
> @@ -204,27 +200,8 @@ static int wpf_s_stream(struct v4l2_subdev *subdev,
> int enable)
>  	vsp1_write(vsp1, VI6_WPF_IRQ_ENB(wpf->entity.index), 0);
>  	vsp1_write(vsp1, wpf->entity.index * VI6_WPF_OFFSET +
>  		   VI6_WPF_SRCRPF, 0);
> -
> -	return 0;
>  }
>=20
> -/* ---------------------------------------------------------------------=
-
> -------
> - * V4L2 Subdevice Operations
> - */
> -
> -static const struct v4l2_subdev_video_ops wpf_video_ops =3D {
> -	.s_stream =3D wpf_s_stream,
> -};
> -
> -static const struct v4l2_subdev_ops wpf_ops =3D {
> -	.video	=3D &wpf_video_ops,
> -	.pad    =3D &vsp1_rwpf_pad_ops,
> -};
> -
> -/* ---------------------------------------------------------------------=
-
> -------
> - * VSP1 Entity Operations
> - */
> -
>  static void vsp1_wpf_destroy(struct vsp1_entity *entity)  {
>  	struct vsp1_rwpf *wpf =3D entity_to_rwpf(entity); @@ -583,7 +560,7 @@
> struct vsp1_rwpf *vsp1_wpf_create(struct vsp1_device *vsp1, unsigned int
> index)
>  	wpf->entity.index =3D index;
>=20
>  	sprintf(name, "wpf.%u", index);
> -	ret =3D vsp1_entity_init(vsp1, &wpf->entity, name, 2, &wpf_ops,
> +	ret =3D vsp1_entity_init(vsp1, &wpf->entity, name, 2,
> +&vsp1_rwpf_subdev_ops,
>  			       MEDIA_ENT_F_PROC_VIDEO_PIXEL_FORMATTER);
>  	if (ret < 0)
>  		return ERR_PTR(ret);
>=20
> base-commit: 19e67e01eb1e84f3529770d084b93f16a4894c42
> --
> Regards,
>=20
> Laurent Pinchart


