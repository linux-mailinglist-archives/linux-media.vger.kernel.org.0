Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E63D5286EA8
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 08:23:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgJHGXv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 02:23:51 -0400
Received: from mx0b-00128a01.pphosted.com ([148.163.139.77]:58704 "EHLO
        mx0b-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726201AbgJHGXv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 02:23:51 -0400
Received: from pps.filterd (m0167091.ppops.net [127.0.0.1])
        by mx0b-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0986EKsp017724;
        Thu, 8 Oct 2020 02:23:35 -0400
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
        by mx0b-00128a01.pphosted.com with ESMTP id 33xk2a4nbx-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Oct 2020 02:23:35 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RFUSFj8qkXw6h8t2278niER9TrFKPAbo+p04rbZAzygy0iyc5979fbjDpFGx1jD3JlqWMi2zmfVIJYNR9W9o1Uurgkb3ULZeqNjng31IrANV23LUPBG6E9FUhkB9ivpvlWAT0o2on5Fwi0oCOm4oWR5mNsnDL6ZG2RsJ0ZrvawpYLuG/Lv45SHRWemxpt5BpHRpuJtdpnOdM6CyjklLkHFbftL4nXQWYbiqw+WAJwzFFUdlYzld97Q8FRDXY8tq+GL25fvxK2Uh71mUJCyVPWqQML7IMyYpd15VaM/DXXUf0rwC9+OwB0hko3KvKxpfIDeOG5SbMPIneg1LXAAguwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr/wZZCyHJApr6ea8VH+/41fWDwam37kuXaXgDEkONM=;
 b=QzcWZD67/GVlDvi2ONr/q/KkepBE8yFXVzKLtQnr4h9uXnZo/Oixtv2BkYJCLZSIXSf6h52WrCxfWQabRhtZ646FTpdr7CCJpxFdXRxFNODEYxwAEaB4VH/CPNQxEByfa/5Dn3ImJdRmH4Y4IkBSg7iHYReb/P1e4xhbTzl2sYcyNjpI8loCXiUPPElt/bib4Rwep4RRDDoDCRGoDYTYd9wWPo+OJhh4LiPah9F5UXyWX7WSVRmoVWyop0NRoC6qYIRdMUfGSc1SaKFTFHEqBgIciZAC0K/xe1cIfJxqEH8OEKu7CnOtWUehFpEBBRTQOtdFFT8wnG3Kaxe2NObzUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lr/wZZCyHJApr6ea8VH+/41fWDwam37kuXaXgDEkONM=;
 b=Cn43Q0TWKx5QS038nDCDQ5fDtg7XlafoxgoINsSk8GuBR5vxqb+szNk8AYwu2pM4/rb1xYA3mE8P7yprvSiPYJHFkSNLwbA1mUPudAAi1SFyeYjsiSWMcs4axPexGtHvSkB0LQueMXdXakLhBJR9l4GYs61sZDztRKBczAIdsuE=
Received: from DM6PR03MB5274.namprd03.prod.outlook.com (2603:10b6:5:24b::14)
 by DM6PR03MB4075.namprd03.prod.outlook.com (2603:10b6:5:8::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.21; Thu, 8 Oct 2020 06:23:34 +0000
Received: from DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd]) by DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd%4]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 06:23:33 +0000
From:   "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To:     Rob Herring <robh@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Bingbu Cao <bingbu.cao@intel.com>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Shawn Tu <shawnx.tu@intel.com>,
        Dongchun Zhu <dongchun.zhu@mediatek.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Thread-Topic: [PATCH v2 2/2] media: dt-bindings: media: i2c: Add bindings for
 ADDI9036
Thread-Index: AQHWmMEKJgJ7i+LLnE65E14czkuHVqmLEjqAgAIv8XA=
Date:   Thu, 8 Oct 2020 06:23:33 +0000
Message-ID: <DM6PR03MB527408B6BBFA25FF782DE27E9B0B0@DM6PR03MB5274.namprd03.prod.outlook.com>
References: <20201002133537.172379-1-bogdan.togorean@analog.com>
 <20201002133537.172379-2-bogdan.togorean@analog.com>
 <20201006204713.GA2807001@bogus>
In-Reply-To: <20201006204713.GA2807001@bogus>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYnRvZ29yZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy1iZjYxZDI4OS0wOTJlLTExZWItODZiNC0xODFk?=
 =?us-ascii?Q?ZWE1NDZlZDJcYW1lLXRlc3RcYmY2MWQyOGEtMDkyZS0xMWViLTg2YjQtMTgx?=
 =?us-ascii?Q?ZGVhNTQ2ZWQyYm9keS50eHQiIHN6PSIzOTIwIiB0PSIxMzI0NjYxMTc5NjE0?=
 =?us-ascii?Q?NTQ1OTIiIGg9IlJDRXR0SEhFdnI3L2JDVDNBMGdaMmR6b1JsUT0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?QUFGTjZCTzUzV0FWM25xNDcrTmQ3NFhlZXJqdjQxM3ZnREFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFIQUFBQURhQVFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFFQUFRQUJBQUFBWS9HcUp3QUFBQUFBQUFBQUFBQUFBSjRBQUFCaEFHUUFh?=
 =?us-ascii?Q?UUJmQUhNQVpRQmpBSFVBY2dCbEFGOEFjQUJ5QUc4QWFnQmxBR01BZEFCekFG?=
 =?us-ascii?Q?OEFaZ0JoQUd3QWN3QmxBRjhBWmdCdkFITUFhUUIwQUdrQWRnQmxBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUVBQUFBQUFBQUFBZ0FBQUFBQW5nQUFBR0VBWkFCcEFGOEFjd0JsQUdNQWRR?=
 =?us-ascii?Q?QnlBR1VBWHdCd0FISUFid0JxQUdVQVl3QjBBSE1BWHdCMEFHa0FaUUJ5QURF?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFRQUFBQUFBQUFBQ0FB?=
 =?us-ascii?Q?QUFBQUNlQUFBQVlRQmtBR2tBWHdCekFHVUFZd0IxQUhJQVpRQmZBSEFBY2dC?=
 =?us-ascii?Q?dkFHb0FaUUJqQUhRQWN3QmZBSFFBYVFCbEFISUFNZ0FBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFB?=
 =?us-ascii?Q?QUFBQUFBQUFBQUFBQUFBQUFCQUFBQUFBQUFBQUlBQUFBQUFBPT0iLz48L21l?=
 =?us-ascii?Q?dGE+?=
x-dg-rorf: true
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: ab4de49e-f56f-4442-6081-08d86b52aef7
x-ms-traffictypediagnostic: DM6PR03MB4075:
x-microsoft-antispam-prvs: <DM6PR03MB40750915281BE3EDD5C706849B0B0@DM6PR03MB4075.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8B+CFAjIDCy+Mz1uAKBBug4FyKBhT6+MPceJgRwoeIOeLsqfFVpIfSTSw7FG7em4lXXL9WzIOauqBzuKiSAP98lSAeKhY2x14N5UWXVdjNf5v0f5nmNUvP0344x+Oh+kC3q5as+IBPFLlYIbPLZY0lae6w6GYCOcqjdhthNXGdbnu3VtCmoOrUjy1JcDMD6AP1DBSYSXmKkHiHSIvQHAbFOD7aLaiEY9BLY5fd56x4nyWOK+UQln4IqHW5Nhb9TUyXXjfdyzKK9eQ5rguL4TsRpsD17ASNDKQXcNYXRSYJyzr0Hre1sL2OKjMVZciNvqkA/hAJHLeEGBrtkx2e1VHK4lkCyd/+h8CdZopTenIgbyg44jj4rYu0BW1/bSa3Z8ZeCJ9apjnGPcMLvEFDJkeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(136003)(376002)(366004)(39860400002)(396003)(64756008)(66446008)(66556008)(66946007)(66476007)(4326008)(8676002)(6506007)(7416002)(186003)(9686003)(26005)(7696005)(8936002)(71200400001)(76116006)(6916009)(2906002)(316002)(55016002)(86362001)(33656002)(83080400001)(5660300002)(966005)(478600001)(83380400001)(54906003)(52536014);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: 72uoZ+fHUNNI+HILMoKNCywlFOy6SAmYGOFqwWJJNNPwNXI+eCFMt1qE07RvdPS7TguVle6/qnvb+fmktF1ab0omv2ePvrJJlM5+WPt/PsLWHKqeORKPufolPi32S2uYTVC9IfXw9dGyROMkLk6/PhAEI4+ODdajscNdnqXvVFjvX2Vyrjsr4T7WK+k9gmx25vveOF/IProx/+nGQHQ00QFopZJ87aKG3XYMs8lmsBa6fgNT/vzO2lKvmR7i9DT41Q/gQiZq9cp05b3z43Y5w59sHAPMPJ81T/ITNW4RRUQXQPgH0Gfu/zhDQGCp8xN2henOuBx8kDpiDPQ/0K4wbOSXVCfx9p4MPDHnxzTZh0ZifVmPJOG4Rg8l0haLxTUIfHFUE939t+5LTCr56pTW+qtoES3ClIWufFHaUAEt5MZmY+J+onOD38Rff0rjo/Aws6nPbWHh6udCEZtNd3sGKdLlLeKMATfWBOwSLWIY8nB8GklqidDHWvibHphZCFJ98GdIRX3Gbg3yTSQYUC7FfDiZSeQtYGLFY3x7jSBFvK5Hvq2GtJcNbVkNcNBM35cdfd8iraIsn4QcfnicpiN3STqPdIrUUayJTcYH8sIun5vSyaJyiRNk9qnOFmcAgd3MiV4YbfdFUwSvu2krShLOtw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4de49e-f56f-4442-6081-08d86b52aef7
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 06:23:33.8698
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 01ny6EfEiyMnYhD3oYl+dXJbaRlvQCtMo+dIhagLrfdBLN+4BpRyl02uhPnhJ4dFY9htlGYUuEGL7WcO2zTF2pMbEV5PldsTwDKKSGkDroE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR03MB4075
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-08_03:2020-10-08,2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010080049
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thank you Rob for review
> On Fri, Oct 02, 2020 at 04:35:17PM +0300, Bogdan Togorean wrote:
> > Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD TOF
> > front-end.
> >
> > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > ---
> > v2: added reg property description
> > ---
> >  .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/adi,addi9036.y=
aml
> b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > new file mode 100644
> > index 000000000000..7c4af704db98
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > @@ -0,0 +1,76 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id:
> https://urldefense.com/v3/__http://devicetree.org/schemas/media/i2c/adi,a=
dd
> i9036.yaml*__;Iw!!A3Ni8CS0y2Y!vLJoRikiVhmxm8p3bhGjRkFIWgjXvVlcJ8ATa9okn
> JqDbtobtK46hHICblE2i2Yj2sZL$
> > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-
> schemas/core.yaml*__;Iw!!A3Ni8CS0y2Y!vLJoRikiVhmxm8p3bhGjRkFIWgjXvVlcJ
> 8ATa9oknJqDbtobtK46hHICblE2iz34fu4o$
> > +
> > +title: Analog Devices ADDI9036 VGA CCD Time of Flight Sensor
> > +
> > +maintainers:
> > +  - Bogdan Togorean <bogdan.togorean@analog.com>
> > +
> > +description: |-
> > +  The ADDI9036 is a complete, 45 MHz, front-end solution for charge co=
upled
> > +  device (CCD) time of flight (TOF) imaging applications. It is progra=
mmable
> > +  through I2C interface. Image data is sent through MIPI CSI-2 2 lanes=
 and
> > +  can output two RAW12 packed data streams. One is IR and the other is
> Depth.
> > +  Each data stream is on a separate or same MIPI Virtual Channel, depe=
nding
> > +  on configuration and each have 640x480 resolution.
> > +
> > +properties:
> > +  compatible:
> > +    const: adi,addi9036
> > +
> > +  reg:
> > +    description: I2C device address
>=20
> Can drop this.
ACK
>=20
> > +    maxItems: 1
> > +
> > +  reset-gpios:
>=20
> maxItems: 1
ACK
>=20
> > +    description: |-
> > +      Reference to the GPIO connected to the RST/SYNC pin, if any.
> > +      Must be released (set high) after all supplies are applied.
> > +
> > +  # See ../video-interfaces.txt for more details
> > +  port:
> > +    type: object
> > +    properties:
> > +      endpoint:
> > +        type: object
> > +        properties:
> > +          data-lanes:
> > +            description: |-
> > +              The sensor supports two-lane operation.
> > +              For two-lane operation the property must be set to <1 2>=
.
> > +            items:
> > +              - const: 1
> > +              - const: 2
>=20
> If this is the only possible setting, then why does it need to be in DT?
If this is not set the bus_type will be not be correctly set after call of
v4l2_fwnode_endpoint_parse.=20
>=20
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - port
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c0 {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        addi9036: addi9036_tof@64 {
> > +            compatible =3D "adi,addi9036";
> > +            reg =3D <0x64>;
> > +
> > +            reset-gpios =3D <&gpio 41 1>;
> > +
> > +            port {
> > +                addi9036_ep: endpoint {
> > +                    remote-endpoint =3D <&csi1_ep>;
> > +                    data-lanes =3D <1 2>;
> > +                };
> > +            };
> > +        };
> > +    };
> > +
> > +...
> > --
> > 2.28.0
> >

Will send V3 with updates.
