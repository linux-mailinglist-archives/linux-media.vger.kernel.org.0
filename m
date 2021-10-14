Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D9F742D038
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 04:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhJNCQv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 22:16:51 -0400
Received: from mail-eopbgr20079.outbound.protection.outlook.com ([40.107.2.79]:2182
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229839AbhJNCQu (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 22:16:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iWj6tGPVLHHUMDqKHdCO7U13riIQHYjlr30VFkvdGpEOoxfLzVRvvD3vYHnSDoPRcgxGvDU+5BfhLjpYpN6on8ce4ll8ORDFJXiVqeJgrRUPZzHUbnQbfb/qbhoUbmumeUh0WJb8wkm9+nzw/+sS52AZ+E4+92E03ricP8Fqmkw+rOilqsmU2ha+96A+NMc+VVtbnNwnqM8xCsRDTumTIG83sXr/UFRyV436F4mBwm8CnYXGvHHFj5meKXmAvmCyu9EHkXKofn1lZRhrgLHlM7w0TLh3MRodm5fcQoIq2W5LaD4R4dkf+8MQAlspG6W26IAiI89ssRbMmLkD8cA/JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gf19d++Y40c+egSCFYrVPFhD62WPDQWL7x+UkoTmw1s=;
 b=StJS/PcGCXracp/tT5aM2/8Z+TSrwh43uCRdyngDstN7be3WcdnhYrmvPxm9WQKbU8CNBIeXp2ryE1xJo9Ea4Ed/vG3ibaoJF1IQM2x4JCWNj8E1JKQAvtQ33o6xs0JlwNxnIPXSzGcGca1IVB/ed1fQcOkRzB+HaPxA8hNjqU1URrtwJqHJVlcn+giGyl1jYhUr5INAu77EBBeY1l29NJnb77cKIRbQpA9yzMOUFl2mFr53nD1i6BctQuQM38fgX76ThbOWBZaVa9nr4V4wvH9NxyxBOOMMttKPHAEztiivhUYm/cdu+JLtIkqVWofCsdTM0+R9UcI6dJoLIHvIHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gf19d++Y40c+egSCFYrVPFhD62WPDQWL7x+UkoTmw1s=;
 b=Edzr8YXn/YsgOJ2P39I3w1iKyy7UrolOxW6EzRkj6jWaMCSdb+8E+QA1ZMWy2gSGCUU7owH5FBqPkFLap3lKiWgg7MwB7B1893xQvogfZJh1iL8k3c2R1VgEoHI2csTeSiGZU8ilRZH23U5kA6KqHtgWEYFIM3VgbdmXf7kqBaM=
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com (2603:10a6:20b:d8::14)
 by AM5PR0401MB2657.eurprd04.prod.outlook.com (2603:10a6:203:38::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.15; Thu, 14 Oct
 2021 02:14:42 +0000
Received: from AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886]) by AM6PR04MB6341.eurprd04.prod.outlook.com
 ([fe80::fc3a:8aea:2c92:3886%5]) with mapi id 15.20.4587.026; Thu, 14 Oct 2021
 02:14:42 +0000
From:   Ming Qian <ming.qian@nxp.com>
To:     Rob Herring <robh@kernel.org>
CC:     "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "hverkuil-cisco@xs4all.nl" <hverkuil-cisco@xs4all.nl>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [EXT] Re: [PATCH v10 01/13] dt-bindings: media: amphion: add
 amphion video codec bindings
Thread-Topic: [EXT] Re: [PATCH v10 01/13] dt-bindings: media: amphion: add
 amphion video codec bindings
Thread-Index: AQHXv/9guZPCwYrE5kyVNnzjNPs94avRQ2wAgAB+yHA=
Date:   Thu, 14 Oct 2021 02:14:42 +0000
Message-ID: <AM6PR04MB63414498641CD4F128EE63B6E7B89@AM6PR04MB6341.eurprd04.prod.outlook.com>
References: <cover.1634095309.git.ming.qian@nxp.com>
 <4d5e00bda369a823c55ffcc10863f29179426557.1634095309.git.ming.qian@nxp.com>
 <1634150392.524588.1324762.nullmailer@robh.at.kernel.org>
In-Reply-To: <1634150392.524588.1324762.nullmailer@robh.at.kernel.org>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=nxp.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 80aee677-9dd9-41d7-05d3-08d98eb8628a
x-ms-traffictypediagnostic: AM5PR0401MB2657:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <AM5PR0401MB26572A551D6149DF6F8955A9E7B89@AM5PR0401MB2657.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:935;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: KVYYFeicUdx5HCJRYBvOr6lZBZSjDy2vJa5yFQtyO7FDbgnp/IRFYjiDaC6smK0MAIP+2Z4HONb5jpGEUNdkAcqTBBdwBDu/DEkPlWT6bi7rdWYF6KrUZxLkkS+KcDX3OLew6cg1nnFe3aBdl22XHLR1UC65+GiCSLXp2+IqxJO4LQgHUpARh7dDXrolKDr2BcPLs3DNWC3kOk8SSr+XnktEJLpQUCWljdjZqP6SHxsXwBK0FtWkagIp/A8wDxPUi8+L21eSiyi2ImzIBgQLtKPSBZuam23lbaODrJisgihegpwy/7toRxaGVEP6dgNNJDBrGaUF3Gvtoj4rNoWWRP45419uR+HkAjUW++vejcJ920hbfrgO3nLMsh0kH6yPPGv4ixbh3uKKxhDEGRWmBdy7oXifmzijuHDqpbevu+y0aAvTHTED5aF4XpjnjJb9zDnk3G07kb2WhosAljYRH+E2Oc3ueEjgbjXRml2r5OnAUNVXk90yquUQPdDbSC2pkHTNn+NR68yit9xJlAdm79bK2Sed5FMsjQ6IeCYPD1GVs7xKP0ZpDdvd3kMqZRHPBOZaoFoPl5GL2zkiw+SzukLYNVGsvwk67n+5Ju9Ia3NFqYbPjweFd2eK/XTRFXqfpTA3IBEYR6od7JmxGipH/GHhpkz6m/VGGAL1VI/myNgzYQg1ez1M5WvOCVAAtDaCu9Ux4a8fBfPYLo0M1/QW3CvsomH1xvlLqKOj+FUFtmK+yrUYuV5HWVyuGBMS7+Yc1flPJsgu+BK9uOCESdGVreqNW+jOWjezRSiR2hYnu5NKgodwtP/14VFFaxJ7tzLWrh41I15MqdzcPnO3Wjp/XQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR04MB6341.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(83380400001)(26005)(52536014)(316002)(7696005)(44832011)(4326008)(9686003)(86362001)(66556008)(66446008)(54906003)(966005)(38070700005)(45080400002)(7416002)(66946007)(33656002)(8936002)(66476007)(71200400001)(6916009)(64756008)(76116006)(55016002)(2906002)(186003)(508600001)(5660300002)(53546011)(6506007)(122000001)(8676002)(38100700002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?Y3SPVfTkVkw7CbCUY5Ol9tItNigXwthvad57IM43rEHHinpXc2yyIsYOgjqC?=
 =?us-ascii?Q?VrY0yiUDw32kNlsWyKcZLAnxg0PcWzqtACdhb97x5x4X1xIFXCJi9nTtWMm0?=
 =?us-ascii?Q?E0OM57eCYpeCyF8sJUW2Unq4g2xIOvHnQTSfoZlZuC84Z3opedXKmmvqE0UW?=
 =?us-ascii?Q?6cMsfVBG9n/YfJi5i7/0WjsDkngxEsC2E7m2mcWK1H5F6Qv/44dOwoyO5JjC?=
 =?us-ascii?Q?jbiqwJrbKwW1TcGGwsN0HBSfdL6QPn/j9U/6TpI1l6xwXbWEg89+U8/ENdYr?=
 =?us-ascii?Q?yfbqKSuSxZR4+qcYf0MkrLfIBuprNnM8HtSCEFBc8FPGQjaTB8/zBdfBHUrK?=
 =?us-ascii?Q?n4oyxqMk5mJH+yz8QXYg3LnaXPDJD9BUV5GbVYtZqbrQ35CVaz2xi+Bymlty?=
 =?us-ascii?Q?wiElcLHGxTEzhM+eyh4DH6+bIyFRFO1MAPXoufwzdJN2uvyfsN0OSF/vtdE7?=
 =?us-ascii?Q?ftLTjZ87ekhbYSIYX90sDlHDAFFRG+1xJBPldPYJsOIMgUgibzsb50ViwBVw?=
 =?us-ascii?Q?6106Vit8/tRrJzewvofsuNh9hEEJYMsNKNZhy7Z4t317u+mUUV5YoCli7gYM?=
 =?us-ascii?Q?YAbCG9BR2CL/8HCYqahNnCiJxUCNHctCNtp6P0fVWKKpzl77ZJzHbJiQdyns?=
 =?us-ascii?Q?wSSJY/xrljmEg1i2A/+yWGTzWyYjUkkFFJVSLkPbGfqZnsPxmJmbcHXBEXvx?=
 =?us-ascii?Q?8pOGHsBh/jKV/tIkmlPbSUyjGnozwEMMFnVc/OSSnPr0xteFw7SzH4Gw9u19?=
 =?us-ascii?Q?UfWOq5SF2m1QNpsTCRkOO2BITwQLnOMOHXnahgZ4G5PA1H6EexW7v1W8EPLZ?=
 =?us-ascii?Q?uouVg+odE1zQsczel+esmkMMmHc4T1m3xziYGz4CX26BCJi3PeQ1qn0I8mtn?=
 =?us-ascii?Q?umrzwq03cuwMG82ATCElV3bkIrxkbPBr7x2my05Qm+Hs8tFhsR6IPP6/fpzE?=
 =?us-ascii?Q?382cgyxw+dvfKjp4xR2msAKAqVoV7QwVg2hopnqonoF+OjzaiMPoQir8hypm?=
 =?us-ascii?Q?fgCoNOi5LVvUma4bRX5HVfungeVhq2RYerwMcC42PQWsAk0fVSdtrfen4oZW?=
 =?us-ascii?Q?PDDmSUXH1PyrqX+I52lyA6qwHqDc99SWTTZder7lSq7vVBga+egx1pdaaG41?=
 =?us-ascii?Q?fbEXWQsKY8Dpzg7m3GBhgOofHylOC+kN84UJF6IvT2Oshm09gQtfzeq6MFjA?=
 =?us-ascii?Q?KoktJJNTdneD4db1WynCV32JUTmWHcKvpJHZiUqMc2qFg09QxL5IHgapgN4c?=
 =?us-ascii?Q?moYGCrxdFnkNxCAmYVeZEdqcuMqLa3s5/y/VXGrhbQRoE5C2561td/Cq+dsP?=
 =?us-ascii?Q?ayP07uXuAU2JWz6RdlYrsk+q?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR04MB6341.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80aee677-9dd9-41d7-05d3-08d98eb8628a
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Oct 2021 02:14:42.6675
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EdC+pKJs3zXXXURN+RuTKwLRhVg9rJK/AOyhw/F3sKhlbvILxeHUeGl3yBaBoiar5c1jITGNI2Lkgv/lH+TcXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM5PR0401MB2657
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Rob Herring [mailto:robh@kernel.org]
> Sent: Thursday, October 14, 2021 2:40 AM
> To: Ming Qian <ming.qian@nxp.com>
> Cc: shawnguo@kernel.org; Aisheng Dong <aisheng.dong@nxp.com>;
> s.hauer@pengutronix.de; robh+dt@kernel.org; festevam@gmail.com;
> hverkuil-cisco@xs4all.nl; dl-linux-imx <linux-imx@nxp.com>;
> mchehab@kernel.org; linux-media@vger.kernel.org; kernel@pengutronix.de;
> linux-arm-kernel@lists.infradead.org; devicetree@vger.kernel.org;
> linux-kernel@vger.kernel.org
> Subject: [EXT] Re: [PATCH v10 01/13] dt-bindings: media: amphion: add
> amphion video codec bindings
>=20
> Caution: EXT Email
>=20
> On Wed, 13 Oct 2021 16:27:17 +0800, Ming Qian wrote:
> > Add devicetree binding documentation for amphion Video Processing Unit
> > IP presents on NXP i.MX8Q
> >
> > Signed-off-by: Ming Qian <ming.qian@nxp.com>
> > Signed-off-by: Shijie Qin <shijie.qin@nxp.com>
> > Signed-off-by: Zhou Peng <eagle.zhou@nxp.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > ---
> >  .../bindings/media/amphion,vpu.yaml           | 178
> ++++++++++++++++++
> >  1 file changed, 178 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/media/amphion,vpu.yaml
> >
>=20
> My bot found errors running 'make DT_CHECKER_FLAGS=3D-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
>=20
> yamllint warnings/errors:
>=20
> dtschema/dtc warnings/errors:
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /amphion,vpu.yaml:
> patternProperties:^vpu_core@[0-9a-f]+$:properties:compatible:oneOf:
> [{'const': 'nxp,imx8q-vpu-decoder'}, {'const': 'nxp,imx8q-vpu-encoder'}] =
should
> not be valid under {'items': {'propertyNames': {'const': 'const'}, 'requi=
red':
> ['const']}}
>         hint: Use 'enum' rather than 'oneOf' + 'const' entries
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tr
> ee.org%2Fmeta-schemas%2Fkeywords.yaml%23&amp;data=3D04%7C01%7Cmin
> g.qian%40nxp.com%7Ce295945bcfb243ca9b6d08d98e78da87%7C686ea1d3b
> c2b4c6fa92cd99c5c301635%7C0%7C0%7C637697471988904558%7CUnkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DfOAy2B6rSge9vUFFMXg1CWuDD
> UVqapcDxEMH0DOIcbI%3D&amp;reserved=3D0
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /amphion,vpu.yaml: properties:compatible:oneOf: [{'const':
> 'nxp,imx8qm-vpu'}, {'const': 'nxp,imx8qxp-vpu'}] should not be valid unde=
r
> {'items': {'propertyNames': {'const': 'const'}, 'required': ['const']}}
>         hint: Use 'enum' rather than 'oneOf' + 'const' entries
>         from schema $id:
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttp%3A%2F%2Fdevice=
tr
> ee.org%2Fmeta-schemas%2Fkeywords.yaml%23&amp;data=3D04%7C01%7Cmin
> g.qian%40nxp.com%7Ce295945bcfb243ca9b6d08d98e78da87%7C686ea1d3b
> c2b4c6fa92cd99c5c301635%7C0%7C0%7C637697471988904558%7CUnkno
> wn%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1ha
> WwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=3DfOAy2B6rSge9vUFFMXg1CWuDD
> UVqapcDxEMH0DOIcbI%3D&amp;reserved=3D0
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/medi=
a
> /amphion,vpu.yaml: ignoring, error in schema: patternProperties:
> ^vpu_core@[0-9a-f]+$: properties: compatible: oneOf
> warning: no schema found in
> file: ./Documentation/devicetree/bindings/media/amphion,vpu.yaml
> Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0:
> /example-0/vpu@2c000000: failed to match any schema with compatible:
> ['nxp,imx8qm-vpu']
> Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0:
> /example-0/vpu@2c000000/vpu_core@2d080000: failed to match any
> schema with compatible: ['nxp,imx8q-vpu-decoder']
> Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0:
> /example-0/vpu@2c000000/vpu_core@2d090000: failed to match any
> schema with compatible: ['nxp,imx8q-vpu-encoder']
> Documentation/devicetree/bindings/media/amphion,vpu.example.dt.yaml:0:0:
> /example-0/vpu@2c000000/vpu_core@2d0a0000: failed to match any
> schema with compatible: ['nxp,imx8q-vpu-encoder']
>=20
> doc reference errors (make refcheckdocs):
>=20
> See
> https://eur01.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Fpatch=
w
> ork.ozlabs.org%2Fpatch%2F1540273&amp;data=3D04%7C01%7Cming.qian%40n
> xp.com%7Ce295945bcfb243ca9b6d08d98e78da87%7C686ea1d3bc2b4c6fa92
> cd99c5c301635%7C0%7C0%7C637697471988904558%7CUnknown%7CTWF
> pbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVC
> I6Mn0%3D%7C1000&amp;sdata=3DVZB1wJBe3b4WMHdhPVqlqZDoNRcui2mk0
> VYAN4NbXDU%3D&amp;reserved=3D0
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

I meet the error after upgrade dtschema, I'll fix it and submit again

