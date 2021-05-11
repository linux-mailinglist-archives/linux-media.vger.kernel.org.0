Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B4D8937A2A1
	for <lists+linux-media@lfdr.de>; Tue, 11 May 2021 10:51:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231193AbhEKIwn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 11 May 2021 04:52:43 -0400
Received: from mail-eopbgr1410112.outbound.protection.outlook.com ([40.107.141.112]:37861
        "EHLO JPN01-OS2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231162AbhEKIwj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 11 May 2021 04:52:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5jbGigr2GGGuHHHkl3B/9cM4oA1aT5jkj+IKGH1iZKGTxkv+Q2BVD9andJMBnjSQZCxrIEEFVQJFNpXMYjFvw09GSwijAc2gAr44lVWSZqJ60c8hPIOZnOxHZqckVi733Y5pwSgtgjddUKAV6y+VUwmrPx2o1nZzrDXi917bD1edjkp8SCnwhEYB6PL1LvBx1PjP+q8lBWyVHiZ5+IpTCQBBrSW0lwaUyQDIoX2M8G4mBwi4Xyy3Us3GkwKFE4ECDy5T62akGTWRFMUzfgjvhIQ+FTDFi4dyZAS3P3Rq384EZ9Lt1WuUFAVewoaYEcIAmtr2yR+MUCKlq+/9sKbNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIEU7rnNNYaHDewmSxYSN0FOMJOEafVezuPyuxNoAEA=;
 b=l+HjitCw+Uv82KIqQ+sq+O0QC10QJfICWywDtOIEaNRAyHU6vClZFbVJlAuUgugfnSK1MC0WhSKfzgto3o07ZFbZNLyAVSEsrST/xg4/bB32Rhf75gAjVKug5iJgaUC3pr5RrNqCWBxNWy3iE2Sx43MZKh8Scxu+TIV2bvm7vSl0yCoLynQ4sHEaVr8d47Avd2xHDqVL2UtizQPRJyDXcamZqTTPkksap5IxwjDgZDUwOWU236aGHbOzj+mOh5RxQ1W8MR3ervkOGKFi1PsCMDFUmCk6qm/ET9iD8j3mFSqVdlXzT+QTm14xxIsOVmqKBmwXgi6BdzIzcu0PqgoTBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector2-renesasgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KIEU7rnNNYaHDewmSxYSN0FOMJOEafVezuPyuxNoAEA=;
 b=ReiknLBbQOxt/+6g3L/0TyRTen3e4ne0sfxaGbYx7jNtLiNso5Dvr0f8TJvaf7JTX6Zx/f4nJWJCBhjMZg5aKNqiu/fTF6uLXd2omynNzgeoH+fVW9JTWXZnb42VEG1juGUTu3xo2eLyCxYcjxtZv2hiCc+H707yB/Mssgd2I/o=
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com (2603:1096:603:38::21)
 by OS3PR01MB6292.jpnprd01.prod.outlook.com (2603:1096:604:f0::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25; Tue, 11 May
 2021 08:51:27 +0000
Received: from OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::48dd:a7cb:a2b2:8d46]) by OSAPR01MB2737.jpnprd01.prod.outlook.com
 ([fe80::48dd:a7cb:a2b2:8d46%6]) with mapi id 15.20.4108.032; Tue, 11 May 2021
 08:51:26 +0000
From:   Fabrizio Castro <fabrizio.castro.jz@renesas.com>
To:     Rob Herring <robh@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Ramesh Shanmugasundaram <rashanmu@gmail.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH] dt-bindings: media: renesas,drif: Use graph schema
Thread-Topic: [PATCH] dt-bindings: media: renesas,drif: Use graph schema
Thread-Index: AQHXRdv/jnc1n9IF/0+AWGHP9QP/dKrd+MIw
Date:   Tue, 11 May 2021 08:51:26 +0000
Message-ID: <OSAPR01MB27373779BEED96CA812710BEC2539@OSAPR01MB2737.jpnprd01.prod.outlook.com>
References: <20210510203514.603471-1-robh@kernel.org>
In-Reply-To: <20210510203514.603471-1-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=renesas.com;
x-originating-ip: [2.28.163.2]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bf61f38c-3531-4277-83ca-08d91459f679
x-ms-traffictypediagnostic: OS3PR01MB6292:
x-microsoft-antispam-prvs: <OS3PR01MB629227C7CF040894EC8CA855C2539@OS3PR01MB6292.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oa57LrHHfrPuHUYIk/Fxn2P1EHOBhEeshdFeFS9OAPDf5BytTqEDou/Gq2M5ToWigjlf+odeswR0oPHkwsBpSK/brEdf0Zlf0r9u7qdokQlomG5mD9ZsdAeNCpsNfsW7qMgAwC53qsvjag93dIFKFi2VAV8aHF6liECizO2t6Q8r0WTs4k2s87thdzhaPENvofX6ZI41gvDokA+Vb5+tfCIVX4VP/14G8cE1YHZkujzcDD2wJ20p3pJjWP6DJCGeQ8ciN3OTis12gszqJp/Sdzw77TSs/GN3t1QdXnDHfF9fnCnuIaKi4SHdDei4WhG5EqWiAGYbGxwLJzRtf/fEChYvrUfucKKEYZ1mX608uPi8FNwaM+x3Xj+acDPc//MVBhChmQgUMHITK90vLHglW5kzG9TXygqheLRHbR1npFVo/+ThIVFug7K+4NWzGzwAa3xtJwvkQGLlirt5JznmB16Aimo6eJa0ot+cQqZfCTlEY1w2z0UrgmYgDRD+u+1VtXxOpmtCW05PnDWj93yLpAZbjjHKZ02jR0lJIGRNSWVoHpVJhsMegxHOMQX5HgZuHK+HGArUNaUyV8irUzQqWFCFrfdtiDJVpIA+ftJmzG8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OSAPR01MB2737.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(498600001)(186003)(76116006)(4326008)(33656002)(110136005)(71200400001)(53546011)(52536014)(6506007)(5660300002)(86362001)(66946007)(66556008)(64756008)(66476007)(66446008)(8936002)(38100700002)(7696005)(26005)(55016002)(9686003)(122000001)(2906002)(54906003)(8676002)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?kWjPP6cykMxJJPkapfKImzAlWS22JxKgQc28sho3xlWfHyB/OUtwFU5aLk8Y?=
 =?us-ascii?Q?CHjvlaAzSi4tUcgkxh9RovvL8U+5rYMdvLzX6fQGcGVWzRUr/Ozm45rcg0rL?=
 =?us-ascii?Q?CFPDYf1JvSsuk283YniWFWtVJaDtiCt/5KRVBEzx/sxgDU9u3MRo0dtAhrTI?=
 =?us-ascii?Q?WMq35Dxz8PfKzH6GrlkUHmXvhxynyJnFlrf/3pAd0hMR4rXGwks2oHXQ2EoB?=
 =?us-ascii?Q?bO1rpv6iAxA/fySFpejDRUBLSYa8eufBWS/upHQ1y1RCDTYHxulxwaJ0QNhB?=
 =?us-ascii?Q?UVp0N08zhpzy40514BI/0TTZyErmyDAys9bgr+PT4Qh0JAj5GFPhr3UQt9xV?=
 =?us-ascii?Q?nOjGi+2LaPSTrMnOGzomDl613ahOpqdCtMjSfAZmMwgxa1NrA/QnNcmOxs6l?=
 =?us-ascii?Q?+MOohWDH4ffa8+E7VSNsGmFrBhgBVaf0cMjKdwPSf0dsGfWxJvWbIsDXknTl?=
 =?us-ascii?Q?APC1NC1ApUuEtvC9J0g/o0QHhvI1Cn5pZmT3QFA7dXvvPwdH5yLndhs25ocO?=
 =?us-ascii?Q?9eoqE1Iczhp2yKvPyLfcP95MOkANrHHDdmS2cZ8d9yOfR+CzjGkUbWLZegyh?=
 =?us-ascii?Q?/Hoq71XArfIgNIsqHJiJqTdyCMDr+zNA/LbVksIWC94oOvaj4NTeamG58c9b?=
 =?us-ascii?Q?no+F4LdtqS42arJR+H5sXoIKyWllbgaxIzo1ZbGh35usjcWTzm8UTwJZ97nW?=
 =?us-ascii?Q?xnliQK4hH62N93jYBhOKsF2u4P4a4jvINHmY/RrKCDg/TJboAV+j6iU761JZ?=
 =?us-ascii?Q?kWrH+yyud239IR3O0stAexVBUoTPRee4lmxFOpnWx0LrSM7RoAklWk86NCcc?=
 =?us-ascii?Q?5L0RLCf9l6jxn0yL/nOLO7AuokZQytlJnNPDfLyYO/4xw8F7DtMrSg7FCxLS?=
 =?us-ascii?Q?Ncm53IzRk8VDrb/PsiEap7aJlkLUozaBlMJQqYj52LxAZmUw2HbmOBOulvCb?=
 =?us-ascii?Q?f7kjqCKuqSMqJIUqpCmMeFF5ryPXb/LkUDrnoUmoNGkXUBm0cn1EicB+CvC7?=
 =?us-ascii?Q?Fdc/PsGagd8KCP0uvPjZ69ipUC79v05ZMwRHQxIvJQtMWqrcuBCrVKlWBIUT?=
 =?us-ascii?Q?m604q42IUiLYIvasQEmHgMVDGE3wEcpUUgB4rnhsi9sewaPByLIIw1Z2wTEs?=
 =?us-ascii?Q?VomB9htguaiOGcVz0PRh6uuubNzEbZpM/kEt6jtqG/LcETWLxBh7NhnXb8E+?=
 =?us-ascii?Q?dgRyP2yqnWTH3E0kXq7FZCpTl1SDn31M/CloTaqcq/OI2ApX55efDrQYotHZ?=
 =?us-ascii?Q?ZpEMWyFUlt8JAfPTO6GkGGZJ5/5tgw6xIQZRVR/09H+0T/PN2kcO8oitygnG?=
 =?us-ascii?Q?L0w=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OSAPR01MB2737.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf61f38c-3531-4277-83ca-08d91459f679
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 May 2021 08:51:26.7530
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X4SCgC41IRxHCmhn6LfU5e504wBoTEzwR8gw5+p9tOankVHPjUj7jPsnSIX2IDhVJiXoh+LBczDDBeiP67TGuBPO9CYYkxEOFRAKyUj0uKM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB6292
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Rob,

thank you for your patch.

> From: Rob Herring <robh@kernel.org>
> Sent: 10 May 2021 21:35
> Subject: [PATCH] dt-bindings: media: renesas,drif: Use graph schema
>=20
> Convert the renesas,drif binding schema to use the graph schema. The
> binding referred to video-interfaces.txt, but it doesn't actually use any
> properties from it as 'sync-active' is a custom property. As 'sync-active=
'
> is custom, it needs a type definition.
>=20
> Cc: Fabrizio Castro <fabrizio.castro.jz@renesas.com>
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: Ramesh Shanmugasundaram <rashanmu@gmail.com>
> Cc: linux-media@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Fabrizio Castro <fabrizio.castro.jz@renesas.com>

Best regards,
Fab

> ---
>  .../bindings/media/renesas,drif.yaml          | 20 +++++++------------
>  1 file changed, 7 insertions(+), 13 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> index f1bdaeab4053..ce505a7c006a 100644
> --- a/Documentation/devicetree/bindings/media/renesas,drif.yaml
> +++ b/Documentation/devicetree/bindings/media/renesas,drif.yaml
> @@ -99,32 +99,26 @@ properties:
>        Indicates that the channel acts as primary among the bonded
> channels.
>=20
>    port:
> -    type: object
> +    $ref: /schemas/graph.yaml#/properties/port
> +    unevaluatedProperties: false
>      description:
> -      Child port node corresponding to the data input, in accordance wit=
h
> the
> -      video interface bindings defined in
> -      Documentation/devicetree/bindings/media/video-interfaces.txt.
> -      The port node must contain at least one endpoint.
> +      Child port node corresponding to the data input. The port node mus=
t
> +      contain at least one endpoint.
>=20
>      properties:
>        endpoint:
> -        type: object
> +        $ref: /schemas/graph.yaml#/$defs/endpoint-base
> +        unevaluatedProperties: false
>=20
>          properties:
> -          remote-endpoint:
> -            description:
> -              A phandle to the remote tuner endpoint subnode in remote
> node
> -              port.
> -
>            sync-active:
> +            $ref: /schemas/types.yaml#/definitions/uint32
>              enum: [0, 1]
>              description:
>                Indicates sync signal polarity, 0/1 for low/high
> respectively.
>                This property maps to SYNCAC bit in the hardware manual.
> The
>                default is 1 (active high).
>=20
> -        additionalProperties: false
> -
>  required:
>    - compatible
>    - reg
> --
> 2.27.0

