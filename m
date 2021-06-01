Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29787396AB4
	for <lists+linux-media@lfdr.de>; Tue,  1 Jun 2021 03:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232504AbhFABuM (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 31 May 2021 21:50:12 -0400
Received: from mail-eopbgr30080.outbound.protection.outlook.com ([40.107.3.80]:56577
        "EHLO EUR03-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231714AbhFABuL (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 31 May 2021 21:50:11 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRJi81quAfvDABFVw9TyHOz2LlhRy+y+XwziPq8UJWD1lXRVV12+WB10lu0yHjwMkCcwIZ/m91t17nRHu77ZdjtGiTYqS+BBQ7HFytzPNtwUXI/dm0BRHZe5Acab7FTRw3Qt5z9Ol5Mwf++QFwEe7WLuPiCspaEyRJh7lsh8pcPVdb4rd95C4uOpfGjmDh1Z28eifx/lugClyNQgsdxLpHk5lo3gpyc0l8AL5/gSLz4akIx/bfA+UrY13O9glbcCmBpZrpqJWxtMJZEJECgtjiW3PVZHmUBTGIb6PkHyKeJa5EqnI7kXlBe5cuncAGKpn3/zqHYlxLnfgmGmNXB82w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Ybra1q7v8KWpSlYVcKamMXMGoENbxKT/znEAs6PZY=;
 b=mPQZ6CySLfaJ/sHnrsgzyR080N3SWyCNCjHxEexe4lYXv9UCfLWAfdx5y09GtD9JxWOgYsAw0fN1gC0XZezSODVGhoDK44PbsrTdhY1qFhIlvnTl7kMQOdkfYuglxTCb+/rnnCdVk0d+5Kj/RpTKqovdv8nOgRyVHEFwbsyTyms8okbHqO8FA/5bR4d4Oz8P9uQhuGasRcYkfUgDkuZ7UTQFnKcJNJk3RkUweO7x8cTRqNl1J0btRbQ6S2SP8iC8KTaYGU63VLcBO5VVOUr1jy3dwYzTdIIqiLhhBinLu7AXluzMyScgGDLb7XBJFnQBoVby+G/c33Dsd7qP6veeEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=N7Ybra1q7v8KWpSlYVcKamMXMGoENbxKT/znEAs6PZY=;
 b=j67T5XArPEBBJ725KwXom44fJkZIu4gdMTDzy4xLXSc+AZBu50cJnqsNmmL+R5Pswrtpn4L7ssjCHXlQW2ZEqjhoKzz5gmYrgScrTPziQnIUyiZ/VLl+oLbUZPIGevkukfZV7YYo1ozRYPjqcZtFrEvjktFGzZ3tVBzWIdCGhl8=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2657.eurprd04.prod.outlook.com (2603:10a6:203:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4173.21; Tue, 1 Jun
 2021 01:48:28 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::c5c1:3625:26e4:4276%5]) with mapi id 15.20.4173.030; Tue, 1 Jun 2021
 01:48:28 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>
CC:     "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH 1/5] dt-bindings: media: imx8q: add imx video
 codec bindings
Thread-Topic: [EXT] Re: [PATCH 1/5] dt-bindings: media: imx8q: add imx video
 codec bindings
Thread-Index: AQHXVcfqGsnUGl1w80aC15AYWxJrYKr9qyoAgAC4eaA=
Date:   Tue, 1 Jun 2021 01:48:28 +0000
Message-ID: <AM6PR04MB63417876332D395535F9E5D8E73E9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1622429025.git.ming.qian@nxp.com>
         <dd2c66ba07a8025da2c377c1b6e46f9d7304c9bc.1622429026.git.ming.qian@nxp.com>
 <707ca6865504c9d37f3806bdc337b50e210373df.camel@ndufresne.ca>
In-Reply-To: <707ca6865504c9d37f3806bdc337b50e210373df.camel@ndufresne.ca>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: ndufresne.ca; dkim=none (message not signed)
 header.d=none;ndufresne.ca; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 22aa64b4-868c-4c90-5007-08d9249f5a96
x-ms-traffictypediagnostic: AM5PR0401MB2657:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0401MB26577E0F73FE2FBD2C2A550CE73E9@AM5PR0401MB2657.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MM9R9mznF57smM8FF8QlGKdfZvT9pl2B7wiQ7fPwCNuh0+Bub2Apyy6SClJ2Hbak1gGZzDwViT7uLxlkyuSIgvcrmQgXSgL/PY96Akpt5v4+Pm25oahNR6mhmZDJc9u2kYOewtilyWJAbEoBRtOluNiqPmdO7F1FXagXm98jbiV8POadcXNVzStn06w5H70ecfG83YGzE8PtANZv4ofWTwAU/45uqBz2kPBCPabzYiOKtarxfP9OpJbaG2GFJzS5POX7Y/gIcmfXcIQAaXFrlZHsTfM7R7m4t/b7+DMdPRGskGQk/jpOOhodPodRlS+/MJlsMFz9vlocVb8ORf/L1VyvLOvENfK0ExHfMBa0C2PQBn4RG+TrtX23D/SouEcnh0/kBidN1BzXNXn05ll28OrxHDjPNuRvskXSDWSSzETDH634P1KlnkxdiG/h6/6Uu0wisG5WUy6ASNg494/DmkQBbSD+11fvS0+XiNk+a4fupv6V3fJx+SeCeAZfFhTId0FGwKa8Hz8ombZ8hF5nbzxZrFkGqKP+8oQYF/XZMtOFgYJ1KtZ+Y8y2vmZm+joELkLEgpl5dm9v/O92d/bC3qRe93WGFvUk1iVrjoIdXezGJvtOrhMbWk121DlFiGDX8aWW0OtDhj8ypyJkcFm57Z5VWFXYQoBSwqcju2AsCp6nlbJ4q6+nyaXo8+N4DKoExSAuzwhGC3d2IKUKgWx+dJGtCh/FY6VJV2vEWoHt0vSwct/JtxzinJ8E4A277K0Y
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(346002)(136003)(376002)(396003)(39860400002)(76116006)(5660300002)(64756008)(33656002)(66946007)(7416002)(44832011)(122000001)(38100700002)(86362001)(66556008)(2906002)(66476007)(186003)(26005)(52536014)(66446008)(54906003)(4326008)(9686003)(8676002)(55016002)(66574015)(71200400001)(45080400002)(478600001)(83380400001)(7696005)(6506007)(316002)(8936002)(110136005)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?iso-8859-1?Q?RMvPV/T3OoPnu++NBTVS7cscp37MHhVQNnDURugLFBukjuaRnXcynVdtzc?=
 =?iso-8859-1?Q?C8Hd3rz2+gqg5EF6l48IiLg3mwoYjNCwxz4ew1jsAc0fqNtu8LEtXm32HK?=
 =?iso-8859-1?Q?7K8cvj7HurxGpUQu32xqdRJGlWk6VoTlqShFOGSZuurcUpHjw7A5WmIX5H?=
 =?iso-8859-1?Q?xjmEHjOfxVQvnX2UdJPEr3d8Q+wKgPZ6X4dN3AI4YVl1vfFogb/QAUqRPo?=
 =?iso-8859-1?Q?F2WrM4BWBEJs9CO0n43ViGIsdfOmikLWh8nePb11tGoq8GNf3hf9shTN4l?=
 =?iso-8859-1?Q?22j34ZiuIADOviCWrOsOwQm1EtaCu61J/7AlESssDOuSmeGa0t/mdyra0C?=
 =?iso-8859-1?Q?8Nty3qvrkrTpQdzjkfHPyiB/TSR0BNysu3Vr2MezVtqfisAcoZh+dDvbrB?=
 =?iso-8859-1?Q?UFD9gY8MnLLBZ/QdFVvZpQnMBM8c+DWUZAfms5NRfZzLUpDuF9EVI3XUdK?=
 =?iso-8859-1?Q?ByCa3t8Z/D1bb1tAfLjm7Chdw0g5WvmpeUA9GFoomfUu3/4+aUTTQOIZPo?=
 =?iso-8859-1?Q?Ah/gZXkKWQ5vYBngP8qMihpSKzcUYJzcDLEVnPyUEFBZ+ZCh48GZN8N+o3?=
 =?iso-8859-1?Q?8ea3HAXfbHoEcrtaas6EEUHzpxJvJC5u5uj466M4NAVAXxjm47wE/DytXi?=
 =?iso-8859-1?Q?zUgwu1Oq8ZNHflz03xJfrou1M6pycrVLsw3uWVaUIn8C5XimXtMrX55Ssj?=
 =?iso-8859-1?Q?TnGfDK5CJ7MHm/ziwCXh8Ntot15KM/dyEXVIwbASMNZ47ULhU6Gyoyktsm?=
 =?iso-8859-1?Q?7VWruKpjtjVhp49FqQAyCZo08Mz5tEFc2kpSeNTcRlGAEvyCq5bReVmQaq?=
 =?iso-8859-1?Q?ujf6b9g6hR0HMEMmyPdRngIyj6U7RwJWAevFsXGF1aq3GmilZ/g9t6oakw?=
 =?iso-8859-1?Q?Pe++FSBn8wJvKWhaRCWK6XavhuslbX2iZqPpVcVPAzP2RWE6BoXR2EV+GF?=
 =?iso-8859-1?Q?318gorDCQLDMgRAXu6wvPvucSqNBqcRNqvR0VzGaOsQe99wiUXKORklxK0?=
 =?iso-8859-1?Q?PIkvZvfsp9UvuyRs50tno23wwP4vfQ2iLyjkTQxnIG+ctbvIZsfy+S4zQB?=
 =?iso-8859-1?Q?Id7/bWtB7JDWw0tawPZ/Gq3OC64wkuVkURuCXgbA4g/fHuUHHQiLW4Ia9u?=
 =?iso-8859-1?Q?qEmGwC4oaLJoyktyvRY2KsIJZlq7DzCXN+3ggFram1Kbp/asip47rBW0DN?=
 =?iso-8859-1?Q?M/KEQPAUcgrOd+fNgeF9hhmapmfFfsVCElaxjDYS9+kplXgmW60N+S1zTu?=
 =?iso-8859-1?Q?GrR65lqkwRoruROi4d4PvnPF6+H/IiJDSITb26qmffer+LiKW6bYxISFOh?=
 =?iso-8859-1?Q?s2ckUYuAw6F8wnO0aCG0FhDlKOBEgiI4Lgo6IWVA6QMzwvw=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22aa64b4-868c-4c90-5007-08d9249f5a96
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2021 01:48:28.6586
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wdGEUtoM6DpXHXi83V3XlhrGMM0pKpnuKVlbY9tJBhzYAwiWEmYy1yny4NfUnHbyHKYbZgnH9V9Q0YSneExMMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2657
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> Le lundi 31 mai 2021 =E0 10:51 +0800, Ming Qian a =E9crit :
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
> > diff --git
> > a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> > b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> > new file mode 100644
> > index 000000000000..97e428dbfdbe
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> > @@ -0,0 +1,201 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +
> > +%YAML 1.2
> > +---
> > +$id:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fschemas%2Fmedia%2Fnxp%2Cimx8q-vpu.yaml%23&amp;data
> =3D04%7C
> >
> +01%7Cming.qian%40nxp.com%7C8420b2323fb844ffb7ab08d924428216%7
> C686ea1d
> >
> +3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637580690330635265%7CUnk
> nown%7CTW
> >
> +FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI
> >
> +6Mn0%3D%7C1000&amp;sdata=3D5D8DWb4rqnARSlauGRZ838IHPH2mHJ6wG
> GKG4688gVM%
> > +3D&amp;reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cmin
> g.qian
> >
> +%40nxp.com%7C8420b2323fb844ffb7ab08d924428216%7C686ea1d3bc2b4
> c6fa92cd
> >
> +99c5c301635%7C0%7C0%7C637580690330635265%7CUnknown%7CTWFp
> bGZsb3d8eyJW
> >
> +IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 1000
> >
> +&amp;sdata=3DE0eIlneiBMKtz2EA%2FgFESzElq2k57nLt7u36J2n51gw%3D&amp
> ;reser
> > +ved=3D0
> > +
> > +title: NXP i.MX8Q video encode and decode accelerators
> > +
> > +maintainers:
> > +  - ming_qian <ming.qian@nxp.com>
> > +  - Shijie Qin <shijie.qin@nxp.com>
> > +
> > +description: |-
> > +  The Amphion MXC video encode and decode accelerators present on NXP
> i.MX8Q SoCs.
>=20
> Hi, thanks for this work. Do you think it would be possible to give a ver=
sion for
> the Amphion design that is in used ? This is for the posterity and/or if =
some
> non-NXP vendor needs to use this driver because it picked the same design=
.
> Though form what I understood, Allegro acquired it, and might not be
> continuing that model, it remains that is nicer if we document as much as=
 we
> can, to give maximum relevance to you rcontribution.

Hi Nicolas,
  We will add the description of the version for the Amphion IP in the V2 p=
atch, thank you for your advice

>=20
> > +
> > +allOf:
> > +  - $ref: /schemas/simple-bus.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +        - nxp,imx8qxp-vpu
> > +        - nxp,imx8qm-vpu
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  memory-region:
> > +    description:
> > +      Phandle to a node describing reserved memory used by VPU.
> > +      (see bindings/reserved-memory/reserved-memory.txt)
> > +
> > +  vpu_lpcg:
> > +    description:
> > +      This is vpu Low-Power Clock Gate (LPCG) module.
> > +
> > +  mu_m0:
> > +    description:
> > +      Each vpu core correspond a MU node, which used for
> communication between
> > +      driver and firmware. Implement via mailbox on driver.
> > +
> > +    vpu_core:
> > +      type: object
> > +      additionalProperties: false
> > +      description:
> > +        Each core correspond a decoder or encoder, need to configure
> them
> > +        separately.
> > +
> > +      properties:
> > +        compatible:
> > +          oneOf:
> > +            - const: nxp,imx8q-vpu-decoder
> > +            - const: nxp,imx8q-vpu-encoder
> > +
> > +        reg:
> > +          maxItems: 1
> > +
> > +        power-domains:
> > +          maxItems: 1
> > +
> > +        mbox-names:
> > +            - const: tx0
> > +            - const: tx1
> > +            - const: rx
> > +
> > +        mboxes:
> > +          maxItems: 3
> > +          description:
> > +            List of phandle of 2 MU channels for tx, 1 MU channel for =
rx.
> > +
> > +        boot-region:
> > +          description:
> > +            Phandle to a node describing reserved memory used by
> firmware
> > +            loading.
> > +
> > +        rpc-region:
> > +          description:
> > +            Phandle to a node describing reserved memory used by RPC
> shared
> > +            memory between firmware and driver.
> > +
> > +        print-offset:
> > +          description:
> > +            The memory offset from RPC address, used by reserve
> firmware log.
> > +
> > +        id:
> > +          description: Index of vpu core.
> > +
> > +      required:
> > +      - compatible
> > +      - reg
> > +      - power-domains
> > +      - mbox-names
> > +      - mboxes
> > +      - boot-region
> > +      - rpc-region
> > +      - print-offset
> > +      - id
> > +
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - memory-region
> > +  - vpu_lpcg
> > +  - mu_m0
> > +  - vpu_core
> > +
> > +examples:
> > +  # Device node example for i.MX8QM platform:
> > +  - |
> > +    #include <dt-bindings/firmware/imx/rsrc.h>
> > +
> > +    vpu: vpu-bus@2c000000 {
> > +      compatible =3D "nxp,imx8qm-vpu", "simple-bus";
> > +      ranges =3D <0x2c000000 0x2c000000 0x2000000>;
> > +      reg =3D <0x2c000000 0x1000000>;
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <1>;
> > +      power-domains =3D <&pd IMX_SC_R_VPU>;
> > +      memory-region =3D <&vpu_reserved>;
> > +
> > +      vpu_lpcg: clock-controller@2c000000 {
> > +        compatible =3D "fsl,imx8qxp-lpcg-vpu";
> > +        reg =3D <0x2c000000 0x2000000>;
> > +        #clock-cells =3D <1>;
> > +        status =3D "disabled";
> > +      };
> > +
> > +      mu_m0: mailbox@2d000000 {
> > +        compatible =3D "fsl,imx6sx-mu";
> > +        reg =3D <0x2d000000 0x20000>;
> > +        interrupts =3D <0 472 4>;
> > +        #mbox-cells =3D <2>;
> > +        power-domains =3D <&pd IMX_SC_R_VPU_MU_0>;
> > +      };
> > +
> > +      mu1_m0: mailbox@2d020000 {
> > +        compatible =3D "fsl,imx6sx-mu";
> > +        reg =3D <0x2d020000 0x20000>;
> > +        interrupts =3D <0 473 4>;
> > +        #mbox-cells =3D <2>;
> > +        power-domains =3D <&pd IMX_SC_R_VPU_MU_1>;
> > +      };
> > +
> > +      mu2_m0: mailbox@2d040000 {
> > +        compatible =3D "fsl,imx6sx-mu";
> > +        reg =3D <0x2d040000 0x20000>;
> > +        interrupts =3D <0 474 4>;
> > +        #mbox-cells =3D <2>;
> > +        power-domains =3D <&pd IMX_SC_R_VPU_MU_2>;
> > +      };
> > +
> > +      vpu_core0: vpu_decoder@2d080000 {
> > +        compatible =3D "nxp,imx8q-vpu-decoder";
> > +        reg =3D <0x2d080000 0x10000>;
> > +        power-domains =3D <&pd IMX_SC_R_VPU_DEC_0>;
> > +        mbox-names =3D "tx0", "tx1", "rx";
> > +        mboxes =3D <&mu_m0 0 0
> > +                  &mu_m0 0 1
> > +                  &mu_m0 1 0>;
> > +        boot-region =3D <&decoder_boot>;
> > +        rpc-region =3D <&decoder_rpc>;
> > +        print-offset =3D <0x180000>;
> > +        id =3D <0>;
> > +      };
> > +
> > +      vpu_core1: vpu_encoder@2d090000 {
> > +        compatible =3D "nxp,imx8q-vpu-encoder";
> > +        reg =3D <0x2d090000 0x10000>;
> > +        power-domains =3D <&pd IMX_SC_R_VPU_ENC_0>;
> > +        mbox-names =3D "tx0", "tx1", "rx";
> > +        mboxes =3D <&mu1_m0 0 0
> > +                  &mu1_m0 0 1
> > +                  &mu1_m0 1 0>;
> > +        boot-region =3D <&encoder1_boot>;
> > +        rpc-region =3D <&encoder1_rpc>;
> > +        print-offset =3D <0x80000>;
> > +        id =3D <1>;
> > +      };
> > +
> > +      vpu_core2: vpu_encoder@2d0a0000 {
> > +        reg =3D <0x2d0a0000 0x10000>;
> > +        compatible =3D "nxp,imx8q-vpu-encoder";
> > +        power-domains =3D <&pd IMX_SC_R_VPU_ENC_1>;
> > +        mbox-names =3D "tx0", "tx1", "rx";
> > +        mboxes =3D <&mu2_m0 0 0
> > +                  &mu2_m0 0 1
> > +                  &mu2_m0 1 0>;
> > +        boot-region =3D <&encoder2_boot>;
> > +        rpc-region =3D <&encoder2_rpc>;
> > +        id =3D <2>;
> > +      };
> > +    };
> > +
> > +...
>=20

