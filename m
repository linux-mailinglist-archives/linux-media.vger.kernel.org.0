Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDFF73983DD
	for <lists+linux-media@lfdr.de>; Wed,  2 Jun 2021 10:09:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232377AbhFBILb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 2 Jun 2021 04:11:31 -0400
Received: from mail-am6eur05on2057.outbound.protection.outlook.com ([40.107.22.57]:42762
        "EHLO EUR05-AM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229751AbhFBIL3 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 2 Jun 2021 04:11:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KFKsoa/Qja+V4awIeb9lmnH9qxTFcyongRRiPHdoOtJKbn/e1EFOZF9QGCb2IQ78G902w9z7Te7EtECea0v0WqIdTKNjsSI6jwkoZ1PyBdF3TyBxK5n9h9QtdQT74V4FcPmyaDtFQTLDQxFRM5IFFZ5RKPf6hCeJTgkZ9p6S0UZlo4P4glzWmt/B0EgQFOFR49vp5quJ9nknQ+xKFuPNGD7cw8ghTmibNM0ITwKZGdLjdchq12XxdcfF2AMPyxVlfwjaxusGO+vJ7ZqsVQWgSpid3OQLQmod94QLi5K2DhGXzgYqNUHMA7YUEAqHwAsWaXKl/GPV+cmAK1cOdpss8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89I6SFwTfNLvhTnUhThIJaa9RXIFrtK124V0bnwWVuA=;
 b=HDjBpudkosYjsjpUaR20b0ZwRqurkUGuXk4DcYORs/rTq3mzvz/NvE6owhPoOdmYAFDtjMLf/AvSXY+HKOUyiODezLAjOu5Vl43nRmGdIdkS6eX/IuUHPO+XpfFzdtKsaVI5DeYxb+He7axSPsksdIdXTFt7EfQgZnC/9K3L6XadQistGgkl5xfDTB7Rm5oQWKhc1jgySrhsObkiBVGugsK5eNuhvXTEbqI2eW3TBVRyI3aoCUlfgxJKPCe2uVovw+/bhY0mU7EODcM8C4UeuaRkSRTCJ2cUyS/eofcEy2HA19ms7VgXrP+PJk6RnfQSP+AuywjQAtg9q6/ZVM3t9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89I6SFwTfNLvhTnUhThIJaa9RXIFrtK124V0bnwWVuA=;
 b=fg84h6o+Nw/5I41EtEFmA+7jKY3fg6JXXNKoBVQ9Q3CHNQ6A8b1j7x6ukIyHIpGEEJVAWaEU88kFZ7DQnU+Q0U/P/pZFCj8OAgZQjoT2NLMx4G2HY7uMd+vq48xS4zb7lIOCE573dodchJ4MKhYPurfhy4xYdVtijR9izr0OBhY=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM6PR04MB4613.eurprd04.prod.outlook.com (2603:10a6:20b:21::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Wed, 2 Jun
 2021 08:09:42 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Wed, 2 Jun 2021
 08:09:42 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: RE: [EXT] Re: [PATCH 1/5] dt-bindings: media: imx8q: add imx video
 codec bindings
Thread-Topic: [EXT] Re: [PATCH 1/5] dt-bindings: media: imx8q: add imx video
 codec bindings
Thread-Index: AQHXVcfqGsnUGl1w80aC15AYWxJrYKr/KXwAgAE3oCA=
Date:   Wed, 2 Jun 2021 08:09:42 +0000
Message-ID: <AM6PR04MB6341C4C9DAC65CE808BD4511E73D9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
 <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
 <1622554330.037290.242362.nullmailer@robh.at.kernel.org>
In-Reply-To: <1622554330.037290.242362.nullmailer@robh.at.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 21a8c702-6d48-4985-ba9f-08d9259dc6b3
x-ms-traffictypediagnostic: AM6PR04MB4613:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM6PR04MB461355DCEAC84FF7DD8000B3E73D9@AM6PR04MB4613.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wNzx56EAbFv8k+dEJspic4b0mQ3urdV3igq07NU0+P6UhTqqvRiIJyjKGYk29sZahTWNWHh612Q/IOYexSpIdVu+4NPX3WelLbelqugzRn9yhtH7VbQ1ytoHuimxIpMs7dkdn95FKkkWcbp381AJdQZHfF8EJRj3+W9lMLNesTffaMTQQScvXhudXiCNegGFckGxZH4xoPnu7bjkQ4jqJtZ/ztFpVYHeCJDUkr2bIMqgBVBAjKjrZevPEyiYQylH/jPWKXBZNPdiJa4mSTI9UW7ENrTwCkQRf39aJZLE9oKzb/+AnmLjDrHNYk1VwmXuFwlfevwGMQ2TB31mdCvZFGghXgBZ1ZC//OG+qBQS1/G46HqR9HjO1FROlxCFiuSIcvuSTtTU5I4uUgfSwKV+QiJ9Vj8FD1KYlClozt6SRc3s8pgSTk12mJNd+9Ky2wY8rwaBwKqgP4ANXt0GYblVu6kyljLC5Btp5FfEiO/Qwy0qFcs0LAu3SB4OqNn4mxgLZX3R5x1RRxEA0koxTFJHv29gBfiN2PFHKQ7mj9NgZe2ntxBdUWEDsKjH5oI9Fku+d3sUqxfsZr796csdI4wXaX22BvRzf3duOEf5bCg8IVFWOQZ+a28Ldvv5S6IV4ysLqZJri8cjYGkxGbAxQ0NjuTmQJThZf6ViOPDA8oBpFAqBF+p8vhMk9TnihajMe5Td9/8xF237d61Bzh6gaELOKE/3fBbABv+n9Ah36jl1EGnBMAPrFjYA9hH6fOWMEPeR/m8vQHn1Rgvuev+/1hroZPjbrG9bBVXga1SUVroFNks=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(376002)(396003)(39860400002)(346002)(366004)(7696005)(6506007)(5660300002)(45080400002)(55016002)(6916009)(26005)(66446008)(478600001)(86362001)(38100700002)(8936002)(8676002)(2906002)(71200400001)(316002)(64756008)(966005)(7416002)(54906003)(4326008)(52536014)(66476007)(66946007)(76116006)(33656002)(44832011)(83380400001)(9686003)(186003)(66556008)(122000001)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?hI+1dcooVgH0cbOp832asYu4UkLMd3MJyHZZB93gZlz0fE5gQQkKCIA3Ifto?=
 =?us-ascii?Q?l9dX1bchGammZH0k2lEulKvzqFViGcIjSj5ztILCGTfdOu8ZFM2sUC6FHxBu?=
 =?us-ascii?Q?Wf+GC5V2zky9Diu+DWPNoqU4wy07Od4z+Bfi3rl6A3Oqat3BnckAHee3ULtD?=
 =?us-ascii?Q?d7nFl3fULUAmEQ6MSdVwjaNQQubdBDMFTWNageuDgpExCZfmLIRkoQUIyzrS?=
 =?us-ascii?Q?zkRq4zufwoIbghbyKP+FUpnQyuiJFYge3GzYLLYBxiI7wU9K0iPBSgwDXdLr?=
 =?us-ascii?Q?VDXRY6yZyOvGh+/px41h77CmX8bO5zHJLb3CpzG9f309zDlYFUhz19UOD5kd?=
 =?us-ascii?Q?JsIuT+AR0+PUMAh0NWgjmAZpTQwWs0VrCDFhJH7skK9xsTcPOm4GfgOcnZnZ?=
 =?us-ascii?Q?RBw6tA7rPGclfYqaODwEAedD9irOqQ2q19JW3zRqj/6d1QZ0ZQL2DhI4OjK+?=
 =?us-ascii?Q?wjmWKEOaptUttliRfMM79IDXGRb0KttbLNfsQVYH9dR5XAkZuHU+4eS05sjg?=
 =?us-ascii?Q?CPllS9o02PyE6tLJwl+B6rq/+kZOiAgPqUZt/6aKmIZWQ7JQ7/eLXZyCGa0J?=
 =?us-ascii?Q?zy564zSanNpbMuVDjA7bzKRu7ZwTdnP6kLnUPHeO5PaWNaWQ1cxcXH0mH1BQ?=
 =?us-ascii?Q?XyxAh6olpaSlmYFJ+cSaWrBalwlh1A9w+qYSJUyx4Z+klLq1k+OorJIhUZZL?=
 =?us-ascii?Q?H/F6DgEnFK22qltuBRsH63ziSLZ/6iVv3vFFp9eQTEEwIQlda7tbBOl6NwUU?=
 =?us-ascii?Q?KSWLQ+1Ls10SJWNlnrkkcuhgYq4Ym3jrX1eOcmDpyvV5qNbAh9kdVlalWpdJ?=
 =?us-ascii?Q?2lWkWPDwlgKDNoQvWgrbF0xX3o1E5YV+bB0wNXW9p0YSqO+KqW+rVeD4yOb4?=
 =?us-ascii?Q?KZlkIf09gRT4CONJNigc1SqfK+zgVFqQWJj/H+qr3T0niQzVefNMWMMc1dVu?=
 =?us-ascii?Q?6JQg4r4UzCNgloaKAsUuts57iOGtpb5DJXHtIiP3ChABpRA+DqlM2s+Nos6y?=
 =?us-ascii?Q?Tm3vRnwBVKk2mU+cCLympKgBS+nsMfloY5cZT4xF6VLfA/0ouPsmdj2+4Pqo?=
 =?us-ascii?Q?8STuuRcRcTxIlzxiPnApE4iZZznH6YxH6A/TL+pXRMuohTAdc54SV3v7AiLZ?=
 =?us-ascii?Q?Guo8b3LdOukgJbTnsE0GS3ZocUJm2IhCpMOXbrGDNSpyfGXVDvIEAhcL9BOS?=
 =?us-ascii?Q?nn9UMeCikK3ox0hJrxDHF9w9/Bqbgvr8c1Czi+nZKwVxsagJybpc+YR1OSmk?=
 =?us-ascii?Q?CBgVMx6R5PIoIMYHxSaivmdvsvAsjG1CND2s2KRTm162ynU2Pme+kW7VH/BI?=
 =?us-ascii?Q?ZYM=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21a8c702-6d48-4985-ba9f-08d9259dc6b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jun 2021 08:09:42.2097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBRg/iU/13Jg2zRVI/tBYD2weJJXrZArLq1JnHcGdd+sjtfd3Z+XusiP9JhyRPPKZo61H76y2O0VXrMwvvtMiA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB4613
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> On Mon, 31 May 2021 10:51:09 +0800, Ming Qian wrote:
> > Add devicetree binding documentation for IMX8Q Video Processing Unit
> > IP
> >
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > ---
> >  .../bindings/media/nxp,imx8q-vpu.yaml         | 201
> ++++++++++++++++++
> >  1 file changed, 201 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
> ./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml:24:9:
> [warning] wrong indentation: expected 10 but found 8 (indentation)
> ./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml:67:13:
> [warning] wrong indentation: expected 10 but found 12 (indentation)
> ./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml:94:7:
> [warning] wrong indentation: expected 8 but found 6 (indentation)
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /nxp,imx8q-vpu.yaml: properties:mu_m0: Additional properties are not
> allowed ('vpu_core' was unexpected)
>         hint: Keywords must be a subset of known json-schema keywords
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tr
> ee.org%2Fmeta-schemas%2Fkeywords.yaml%23&amp;data=3D04%7C01%7Cmin
> g.qian%40nxp.com%7Ce1c1c81d4bf349f4551408d92501bba0%7C686ea1d3b
> c2b4c6fa92cd99c5c301635%7C0%7C0%7C637581511648466898%7CUnkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dz5K2eJR%2FKDI7GZbxzI733VSgAI
> R%2FI4sx9Visl21IJe8%3D&amp;reserved=3D0
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /nxp,imx8q-vpu.yaml: properties:mu_m0: 'vpu_core' is not one of ['$ref',
> 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'co=
ntains',
> 'default', 'dependencies', 'deprecated', 'description', 'else', 'enum',
> 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minim=
um',
> 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern',
> 'patternProperties', 'properties', 'required', 'then', 'type', 'typeSize'=
,
> 'unevaluatedProperties', 'uniqueItems']
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tr
> ee.org%2Fmeta-schemas%2Fkeywords.yaml%23&amp;data=3D04%7C01%7Cmin
> g.qian%40nxp.com%7Ce1c1c81d4bf349f4551408d92501bba0%7C686ea1d3b
> c2b4c6fa92cd99c5c301635%7C0%7C0%7C637581511648466898%7CUnkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3Dz5K2eJR%2FKDI7GZbxzI733VSgAI
> R%2FI4sx9Visl21IJe8%3D&amp;reserved=3D0
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /nxp,imx8q-vpu.yaml: 'oneOf' conditional failed, one must be fixed:
>         'unevaluatedProperties' is a required property
>         'additionalProperties' is a required property
>         hint: A schema with a "$ref" to another schema either can define =
all
> properties used and use "additionalProperties" or can use
> "unevaluatedProperties"
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tr
> ee.org%2Fmeta-schemas%2Fbase.yaml%23&amp;data=3D04%7C01%7Cming.qia
> n%40nxp.com%7Ce1c1c81d4bf349f4551408d92501bba0%7C686ea1d3bc2b4
> c6fa92cd99c5c301635%7C0%7C0%7C637581511648466898%7CUnknown%7
> CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiL
> CJXVCI6Mn0%3D%7C1000&amp;sdata=3D5XtViMjNpB5Xk6d82g%2FCb54xz2J2jK
> crmhXa5cusqNA%3D&amp;reserved=3D0
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /nxp,imx8q-vpu.yaml: ignoring, error in schema: properties: mu_m0
> warning: no schema found in
> file: ./Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:
> 0: /example-0/vpu-bus@2c000000: failed to match any schema with
> compatible: ['nxp,imx8qm-vpu', 'simple-bus']
> Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:
> 0: /example-0/vpu-bus@2c000000/vpu_decoder@2d080000: failed to match
> any schema with compatible: ['nxp,imx8q-vpu-decoder']
> Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:
> 0: /example-0/vpu-bus@2c000000/vpu_encoder@2d090000: failed to match
> any schema with compatible: ['nxp,imx8q-vpu-encoder']
> Documentation/devicetree/bindings/media/nxp,imx8q-vpu.example.dt.yaml:0:
> 0: /example-0/vpu-bus@2c000000/vpu_encoder@2d0a0000: failed to match
> any schema with compatible: ['nxp,imx8q-vpu-encoder']
>=20
> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
w
> ork.ozlabs.org%2Fpatch%2F1485530&amp;data=3D04%7C01%7Cming.qian%40n
> xp.com%7Ce1c1c81d4bf349f4551408d92501bba0%7C686ea1d3bc2b4c6fa92
> cd99c5c301635%7C0%7C0%7C637581511648466898%7CUnknown%7CTWF
> pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> I6Mn0%3D%7C1000&amp;sdata=3DUuQ%2Fc7p6ybq5AQPNjxUHRqYCImyKvVeY
> 9UQCfeiE94g%3D&amp;reserved=3D0
>=20
> This check can fail if there are any dependencies. The base for a patch s=
eries is
> generally the most recent rc1.
>=20
> If you already ran 'make dt_binding_check' and didn't see the above error=
(s),
> then make sure 'yamllint' is installed and dt-schema is up to
> date:
>=20
> pip3 install dtschema --upgrade
>=20
> Please check and re-submit.

Hi Rob,
   I have found the problem, I 'll fix it and re-submit soon

