Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D653E3AA8E7
	for <lists+linux-media@lfdr.de>; Thu, 17 Jun 2021 04:20:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231510AbhFQCWk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 16 Jun 2021 22:22:40 -0400
Received: from mail-eopbgr40080.outbound.protection.outlook.com ([40.107.4.80]:22339
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230155AbhFQCWi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 16 Jun 2021 22:22:38 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AFKBpmRgvpS/u4b0Up8EK7iiNNPg280w8k25UqgAgVnu+JDuk79OEc8b1hAH6SQTf5wzemokZ0+4arrLV6/aDQnqJ8SWXkat35ONbEyCrnL6sT6l7iDUstUSsCGUp6FviXWujxrUu4mgfqpiJfH7CfffQPFRrm+XuZn3Yf4mS/u5eYdhcdKNywPk42w0Rv3MzzjoFsJU3msQ37RmMgugMf5FkS7Z4MUgZQkIQzCpGaSqaFdnPlSlatsmfIsAppypwgTodgdHrbG4TOKwb+0m8yBeYk/fenwUXwQAJiTPj+WiY5/2zuZ4VgL9Js/WwN6G24xZGUCwgDus+V9KsXeVTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfKpVvvKK7/vOW0SEnJwtULRTPaDekY0dt78nSKSZVU=;
 b=MgNlzRp1xG0eNRj8Vgxk08QQm9c9jKzXYU51e7XWufx5QDzIm4gOijSSOMIKj18mFpisiSr/414qCQLKEvPMx1FYQ1TkxaSoW7FYY+XguySSiXyQ3WnluQLVfx3pszelwR8ToNU3AazNichl2NvmEwITwfoB+KApJbNAskBFu3E8JcpjMWNrh1G+BaS1MsXN8oMbZUTkJtGtTa2vy9YCsPBDNY5tvuXEQI6aGRWZH+LG+9XPncI3w4BCw79XB3dv6oVGPCQtAI85vvzXehL7F4jsAQ5TS3BICER+fzVniG4scY9Dh11KNYT5BZf2JiIFyHqeRDT7FgwHrY/n/oIaKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XfKpVvvKK7/vOW0SEnJwtULRTPaDekY0dt78nSKSZVU=;
 b=dq+wY6qGvBTHdxzKK9G5mv3YwNEC255/ppGhfzlFQ5458RKJ8Dmr1s9F3q5gQRRUdzIkaffD4X+puPLY/KmTgsEnAlW62OUJQqK1zxyG8hI0sFYcOS4sUsD779MkYw7111BNTnD2NAH3uXx0nAWsuQyvor6Gw1lHn+pJKx3+1D0=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AS8PR04MB7654.eurprd04.prod.outlook.com (2603:10a6:20b:290::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.18; Thu, 17 Jun
 2021 02:20:29 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::f91a:68d6:ffb8:1642%3]) with mapi id 15.20.4219.025; Thu, 17 Jun 2021
 02:20:29 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "mchehab@kernel.org" <mchehab@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: RE: [EXT] Re: [PATCH v2 01/13] dt-bindings: media: imx8q: add imx
 video codec bindings
Thread-Topic: [EXT] Re: [PATCH v2 01/13] dt-bindings: media: imx8q: add imx
 video codec bindings
Thread-Index: AQHXW3fHs2uPwPgs9U2+Dh0bHc7XIKsXYJQAgAAm15A=
Date:   Thu, 17 Jun 2021 02:20:29 +0000
Message-ID: <AM6PR04MB6341845B7065929EF4B425B4E70E9@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1623054584.git.ming.qian@nxp.com>
 <7cd02157f9a9cc7a773bd02137a92a04077638e5.1623054584.git.ming.qian@nxp.com>
 <20210617000018.GA316656@robh.at.kernel.org>
In-Reply-To: <20210617000018.GA316656@robh.at.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-originating-ip: [119.31.174.71]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 4ac35576-5cbc-4b2c-5baa-08d931367a2a
x-ms-traffictypediagnostic: AS8PR04MB7654:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AS8PR04MB765446054A8D0932A523AF56E70E9@AS8PR04MB7654.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4125;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7fZWjqbgw3ZkEAQXOi9kL/MfGnl5QSihUhH4QYCeQXyX25NbLjuPDzPGo3uGTzK7SpFF3XfTzATe+sRG7sNOpXDVoT6KduOKWNeujdfSsQszQoafVIdrUO3VSNZoS2qFFtni2/7W+9LpOoenHHYG58lOxwg7Q5BYqUxO8G7kBbliGSrauCgZIO4PX1PciDchlJPd9HQubDOjGTrK8icbCoTknEOGcBu+o2kK423OEsHRCXzQDb4hj9Qioozo5M7Z9CD73sibdjXkt6ayhTaFyEOpKjklWd8qaAYOGhUIMb65VBwhxI3+p2gZyls3KaA0azJqCN7ASvKOukAvI95r4LtslLhusO8zEBlYQ2SzM8DfXrYhCNuI7AJr2InSb5wRh/lMSTj/rYSwPAWhUnNX8aUbRDp9dYbDQsiqPOJWgK+SGhUVJFjNLdVhP0Ish1EIsF9SBrztu11MF+yz9bHdAGt6FVv+2taRQeAxEyDbQ2GcsHIoCX70L3GNHZ+U5fzbjNImkgn+kCJfftqnIN7u7fr/gGa29PJlqkmTRWVet+Ka/UNlAHnRDqy/v63x7UEXGJZeuHsUCcMzM+Y0yo3PYSqeu1/xgDVqsBUvIvo0zeOVwRFOE0ZovCfBWj/strAiHQNAp8OMTCJ52pqVN5XnQyjmbo6gu5dLAluaGC1Ap4BfosupFhcihxcljNzVcqFqLoBugz9X9/Q7M9kGuPiClb1lXP/lfBelWcOelVpygey41WCVRkQcnGaTJBcu51qYGkCtMiEIJkkY12bCzNOLpQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(136003)(366004)(396003)(39860400002)(346002)(316002)(54906003)(26005)(83380400001)(71200400001)(2906002)(8936002)(52536014)(186003)(8676002)(5660300002)(478600001)(45080400002)(66946007)(6916009)(64756008)(122000001)(4326008)(44832011)(38100700002)(86362001)(66476007)(6506007)(76116006)(55016002)(9686003)(7696005)(7416002)(53546011)(66446008)(33656002)(66556008)(32563001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?rkjcokR4nAhxyniuntQUTJtWGph85uMlAFlEBOLhWTORMqN3LQIaG2kWq/Km?=
 =?us-ascii?Q?pZEiyKUPV1nwTVNAHYLnvDcTMN3KNlLlucNhooujWW8p+0x2WmUBqEKP4xRp?=
 =?us-ascii?Q?SU6zUDZm8xdKmT2f+KKVTqCBt1FB4+Lraq+dT4lL95t/jkYTS10DRtLU95BJ?=
 =?us-ascii?Q?+Cx9DKZqA7tdDuYm+Dw2VpmhdgiJI8H906O3Y/0sO4LcaEiBeSl9EteYJFn9?=
 =?us-ascii?Q?INSaL6qdUPoY/MDDBKcmN284sF6K3qcVYZtn55HNY7ulIaS3lDmcvT1c0qSL?=
 =?us-ascii?Q?NIg0VO6Xc39cRyKE1bwgq92YPzrIB52LD0Bh3PaXq/rPHDJwvItEgXf/CLm4?=
 =?us-ascii?Q?Ce6Z5YkYXJdEUbyttvillOgFBHR3N2899m2jExFn6zfXCqO9AqOoUCh5/kjM?=
 =?us-ascii?Q?JN1DkcI+OOnEDuWtV4jLv+sWPUnEl+HdGpW8dWrXl/0SD2qs/GBEMRqx5RJ4?=
 =?us-ascii?Q?LAcEpJkmb95w05kZRGZJqE1zP2AigqIw4G3+JSlo5RiwSW3KbsO2KvxsDP4J?=
 =?us-ascii?Q?kIzn4z7zDu54NmW8+q+V1ooXE0hgCRqdA0ne4GsjCyV3XjdNX8iySaAinmzB?=
 =?us-ascii?Q?hrTrWqXqfrR6+Ur/dZZoKojW739lD3ZyqFjlEiFyChDutkpBIbZihAbozhNG?=
 =?us-ascii?Q?c7zxnMrulXgfB3Bpi/d/M78lbdUJV54sAwNraktQbfcm8bQd4U5VB60oAN4w?=
 =?us-ascii?Q?bZD8dE3UMcRFkWanzgFowuttILJ6JgXYkkYlr4N9xrdjk+lgi14CilLRcWNd?=
 =?us-ascii?Q?iI5JBmmFCWQ+D9bfKH7yfA/3XNCqz1zyJSAWGUhDgtKQUWxm/1iEN/vC1avO?=
 =?us-ascii?Q?NWYqq8L07voB65y4VNduC8bF/J5F6LzO4S6wkCN/EB+mPJ2oMuwR5J+kMTam?=
 =?us-ascii?Q?THBVev/2seUJ2OhJFWm76Cxr/GxZG5xe72f60bge3jZCLkT5NUnD6aK0NlyG?=
 =?us-ascii?Q?1ciSJJWNS0jmm3gXOkzidRcEJm/Fep4x9ZdTthU1QxyHpGxzB4kK80G3ypwZ?=
 =?us-ascii?Q?EEIPi/BX2vxrmuVe2Yrk5PTn+BMH2zRq0rmIyUdhjDpO/WvelQle5UMbB/9j?=
 =?us-ascii?Q?PU8vmEihaX18O456JJuC2fQ+MX2AbP8dl0QXryebkgkZoP+ZjyUUdfZDsCEg?=
 =?us-ascii?Q?yM7FaUN/ZAbxN+FjYWABX+gXjqXphTcYVKw2lB3KEyfQZvcy38OkGwDP7fI/?=
 =?us-ascii?Q?r4eAuy9RmfzFJLPdsH9l+L+QRdNiQyKnIBc4yXz+9U01d5NVpKsMizxVOzFg?=
 =?us-ascii?Q?jxClKI9BlPM5I800Ju08PNoakNh0UyVYxJKRu/yK5CV5t7XmMusqLox+Hau/?=
 =?us-ascii?Q?380BexsqmCsqYfd7u2BvHNHw?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ac35576-5cbc-4b2c-5baa-08d931367a2a
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 02:20:29.6447
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LT6FaTSu4rYKH7gcFR7glB31JEHIgyD58XdvB6s4bq8VYhpyqYbE9KZSqYL8S91NbOxYtB36sSQsVh3tuvOnmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7654
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, June 17, 2021 8:00 AM
> To: Ming Qian <ming.qian@nxp.com>
> Cc: mchehab@kernel.org; shawnguo@kernel.org; s.hauer@pengutronix.de;
> hverkuil-cisco@xs4all.nl; kernel@pengutronix.de; festevam@gmail.com;
> dl-linux-imx <linux-imx@nxp.com>; Aisheng Dong <aisheng.dong@nxp.com>;
> linux-media@vger.kernel.org; linux-kernel@vger.kernel.org;
> devicetree@vger.kernel.org; linux-arm-kernel@lists.infradead.org
> Subject: [EXT] Re: [PATCH v2 01/13] dt-bindings: media: imx8q: add imx vi=
deo
> codec bindings
>=20
> Caution: EXT Email
>=20
> On Mon, Jun 07, 2021 at 04:42:48PM +0800, Ming Qian wrote:
> > Add devicetree binding documentation for IMX8Q Video Processing Unit
> > IP
> >
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > ---
> >  .../bindings/media/nxp,imx8q-vpu.yaml         | 198
> ++++++++++++++++++
> >  1 file changed, 198 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> >
> > diff --git
> > a/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> > b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> > new file mode 100644
> > index 000000000000..058ca69c107a
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/nxp,imx8q-vpu.yaml
> > @@ -0,0 +1,198 @@
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
> +01%7Cming.qian%40nxp.com%7Cb8af894b4dd946c3b96108d93122e833%7
> C686ea1d
> >
> +3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637594848261515925%7CUnk
> nown%7CTW
> >
> +FpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJX
> VCI
> >
> +6Mn0%3D%7C1000&amp;sdata=3DFYRPH5nh6SysbLJ0bkKy%2Bv1QhNciUh4ijp
> bNqAJCGN
> > +8%3D&amp;reserved=3D0
> > +$schema:
> > +https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdev=
i
> >
> +cetree.org%2Fmeta-schemas%2Fcore.yaml%23&amp;data=3D04%7C01%7Cmin
> g.qian
> >
> +%40nxp.com%7Cb8af894b4dd946c3b96108d93122e833%7C686ea1d3bc2b
> 4c6fa92cd
> >
> +99c5c301635%7C0%7C0%7C637594848261525925%7CUnknown%7CTWFp
> bGZsb3d8eyJW
> >
> +IjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C
> 1000
> >
> +&amp;sdata=3D6O4zADjEKA0Mvfchy%2FNVzGEKMfdoYUa%2FoHQ9VEHqXaU%
> 3D&amp;res
> > +erved=3D0
> > +
> > +title: NXP i.MX8Q video encode and decode accelerators
> > +
> > +maintainers:
> > +  - Ming Qian <ming.qian@nxp.com>
> > +  - Shijie Qin <shijie.qin@nxp.com>
> > +
> > +description: |-
> > +  The Amphion MXC video encoder(Windsor) and decoder(Malone)
> > +accelerators present
> > +  on NXP i.MX8Q SoCs.
> > +
> > +allOf:
> > +  - $ref: /schemas/simple-bus.yaml#
>=20
> This is not a 'simple-bus'. A simple bus doesn't have power-domains,
> memory-region, or mailbox.
>=20
> simple-mfd maybe, but looks like there's dependencies here so you should
> trigger probing yourself.

I will modify the driver and this document according to your suggestion

> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^vpu-bus@[0-9a-f]+$"
> > +
> > +  compatible:
> > +    contains:
>=20
> No, must be exact.
>=20
> > +      items:
> > +        - enum:
> > +            - nxp,imx8qm-vpu
> > +            - nxp,imx8qxp-vpu
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
> > +  mailbox:
>=20
> This needs to be a pattern looking at the example.
>=20
> > +    description:
> > +      Each vpu encoder or decoder correspond a MU, which used for
> communication
> > +      between driver and firmware. Implement via mailbox on driver.
> > +      (see bindings/mailbox/fsl,mu.yaml)
>=20
> Do a $ref to the file.
>=20
> > +
> > +patternProperties:
> > +  "^vpu_[en, de]coder@[0-9a-f]+$":
>=20
> (en|de)
>=20
> > +    type: object
> > +    description:
> > +      Each core correspond a decoder or encoder, need to configure the=
m
> > +      separately. NXP i.MX8QM SoC has one decoder and two encoder,
> i.MX8QXP SoC
> > +      has one decoder and one encoder.
> > +
> > +    properties:
> > +      compatible:
> > +        oneOf:
> > +          - const: nxp,imx8q-vpu-decoder
> > +          - const: nxp,imx8q-vpu-encoder
> > +
> > +      reg:
> > +        maxItems: 1
> > +
> > +      power-domains:
> > +        maxItems: 1
> > +
> > +      mbox-names:
> > +        items:
> > +          - const: tx0
> > +          - const: tx1
> > +          - const: rx
> > +
> > +      mboxes:
> > +        description:
> > +          List of phandle of 2 MU channels for tx, 1 MU channel for rx=
.
>=20
> How many? (maxItems: 1 or an 'items' list needed)
>=20
> > +      boot-region:
> > +        description:
> > +          Phandle to a node describing reserved memory used by
> firmware
> > +          loading.
> > +
> > +      rpc-region:
> > +        description:
> > +          Phandle to a node describing reserved memory used by RPC
> shared
> > +          memory between firmware and driver.
> > +
> > +      print-offset:
> > +        description:
> > +          The memory offset from RPC address, used by reserve firmware
> log.
>=20
> These need vendor prefix and type ref.
>=20
> > +
> > +      id:
> > +        description: Index of vpu core.
>=20
> Nope. We don't do indexes.
>=20
> > +
> > +    required:
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
> > +    additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - power-domains
> > +  - memory-region
> > +
> > +additionalProperties: true
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
> > +        print-offset =3D <0x80000>;
> > +        id =3D <2>;
> > +      };
> > +    };
> > +
> > +...
> > --
> > 2.31.1
