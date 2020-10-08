Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 476B2286ECD
	for <lists+linux-media@lfdr.de>; Thu,  8 Oct 2020 08:42:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbgJHGmW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 8 Oct 2020 02:42:22 -0400
Received: from mx0a-00128a01.pphosted.com ([148.163.135.77]:61888 "EHLO
        mx0a-00128a01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726013AbgJHGmV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 8 Oct 2020 02:42:21 -0400
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0986Wcto012203;
        Thu, 8 Oct 2020 02:42:10 -0400
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam08lp2044.outbound.protection.outlook.com [104.47.73.44])
        by mx0a-00128a01.pphosted.com with ESMTP id 33xp74ww21-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 08 Oct 2020 02:42:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nSvU6OuUNgod/6Z0/PnN4E2wF4U9SKAqi/Y6xjNnq5ABHYz/8YkYvBMb0rSYCSc9DVPmAUxIVlmVTo5OsYYTvTG9t4ParYWSevZ/1QvR0mBAQYgj26BrqkOE7gGaDW591CQ7AVKjkaLH2RAOVnLNcYX09lmmBbPCykGQb0pMX2tY2DNOvJKWn3CG6QbEjrjviedG4xAXyEn1fpZ4qUx+KQ+I3QM9DUybRkQGugsAcE2Dtqy6KD/MvyTjHidHhPm3WFF6Z9/Xsm9pzjlzo8Jj9O7pbVW64E7skYDfeuW8LSD/r5nLmSJD58v4HxE+i50jWu90o9yejFBXG+D+7APJZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhbMGtosLpFrwiIt0wC50xivx+CiaGIbOUSySpvD/hI=;
 b=QJM4gnhFA8q3RNAJtpQxxSbqf328/6NOisGyBUOvI11D2J9TuILB1VwWfYyfngsqZwNHAKlrFH/ysxqieT19PhTqAgyT0qxpNlYrPHtT3YvKpa2r8mlkZku8Ul6JE+qPUMXLLm0QupQ4FADGH6i9V1TsQsa1bFe1ce7FwbVTKtk9LntxRiulHKztRxvETK2Ggi9TWRoo6eWhmWQP0nsTkFVZxFqIFdCR/v6C3x4okkOUqgok1v5hhudjUeZQ/jH5+oNjtreUQhWv02XK7w5ZwWn61pHPpxRvMWUjYEBqNV7GmEMKnEgB+P/BeCBfnglXa7yqonHq9UtDXW2wX6geLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JhbMGtosLpFrwiIt0wC50xivx+CiaGIbOUSySpvD/hI=;
 b=exSLQo8LKWNHFSLDpWxo52V1jcw63TjqtsQk94FOIX6BQQ6K/2948xGy/wmRGfwccNEkVGW1iVJI3Ykd38vH7zn7LKiRv8hRm6AEZy9TJr1hf046SAHwz+HtuTBZYe3I6t0vm01QDRPf8szszN3KCfvzidmJJY1nBobKK9kKy/E=
Received: from DM6PR03MB5274.namprd03.prod.outlook.com (2603:10b6:5:24b::14)
 by DM5PR03MB2443.namprd03.prod.outlook.com (2603:10b6:3:75::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Thu, 8 Oct
 2020 06:42:08 +0000
Received: from DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd]) by DM6PR03MB5274.namprd03.prod.outlook.com
 ([fe80::a009:4abe:2aee:b0dd%4]) with mapi id 15.20.3455.023; Thu, 8 Oct 2020
 06:42:08 +0000
From:   "Togorean, Bogdan" <Bogdan.Togorean@analog.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     Rob Herring <robh@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
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
Thread-Index: AQHWmMEKJgJ7i+LLnE65E14czkuHVqmLEjqAgAIv8XCAAAavgIAAAE/g
Date:   Thu, 8 Oct 2020 06:42:08 +0000
Message-ID: <DM6PR03MB52745E2A577D1DED19AE97CB9B0B0@DM6PR03MB5274.namprd03.prod.outlook.com>
References: <20201002133537.172379-1-bogdan.togorean@analog.com>
 <20201002133537.172379-2-bogdan.togorean@analog.com>
 <20201006204713.GA2807001@bogus>
 <DM6PR03MB527408B6BBFA25FF782DE27E9B0B0@DM6PR03MB5274.namprd03.prod.outlook.com>
 <20201008063515.GO26842@paasikivi.fi.intel.com>
In-Reply-To: <20201008063515.GO26842@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?us-ascii?Q?PG1ldGE+PGF0IG5tPSJib2R5LnR4dCIgcD0iYzpcdXNlcnNcYnRvZ29yZWFc?=
 =?us-ascii?Q?YXBwZGF0YVxyb2FtaW5nXDA5ZDg0OWI2LTMyZDMtNGE0MC04NWVlLTZiODRi?=
 =?us-ascii?Q?YTI5ZTM1Ylxtc2dzXG1zZy01NjgxMzdkMC0wOTMxLTExZWItODZiNC0xODFk?=
 =?us-ascii?Q?ZWE1NDZlZDJcYW1lLXRlc3RcNTY4MTM3ZDEtMDkzMS0xMWViLTg2YjQtMTgx?=
 =?us-ascii?Q?ZGVhNTQ2ZWQyYm9keS50eHQiIHN6PSI0MDU3IiB0PSIxMzI0NjYxMjkwOTE2?=
 =?us-ascii?Q?NzU4MDAiIGg9ImJIRmhWYmw0eHZCaTFscVJDbXdmOGk1aUxWbz0iIGlkPSIi?=
 =?us-ascii?Q?IGJsPSIwIiBibz0iMSIgY2k9ImNBQUFBRVJIVTFSU1JVRk5DZ1VBQUVvQ0FB?=
 =?us-ascii?Q?Q1l4a2NaUHAzV0FlVElUQm5LSHJUNjVNaE1HY29ldFBvREFBQUFBQUFBQUFB?=
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
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=analog.com;
x-originating-ip: [137.71.226.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2b3eb904-bd4b-432c-86f0-08d86b554775
x-ms-traffictypediagnostic: DM5PR03MB2443:
x-microsoft-antispam-prvs: <DM5PR03MB244330EF5E6903565B78727A9B0B0@DM5PR03MB2443.namprd03.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sf5Hoc4AI59X/ieUuSPwf8DBqy/qrD5GLbLsss+uokiFOqMoB6+VN3uSfpTUzL0Abe7+oUFqL3FX4t8AAhMRLsJGOdUeKgmQi/DW4oaTs0AMBM/N9jnC0Xg6XBvjZZDe4ukir+0aVPI0iSy5atEDv3+231AfLy8SehY7gP7Vim+/B57qDgvY2nQDnfzI2G8xBe8ZGc3qrV4MCHC8iXZmf2e5GR0RlnbmrfSGpWuqc7CBD3SAFhfvm5w6hvo/mK3005jZ+msExr+HCCc9bGjuE2wKtK3yudWHvY5lRSgGI6Q9sNLbd3gYO1v1nbv1qpcEHuSSO8MsY8fDhzjv2cin5gFIYMrbMvFylVOX0xVXpEL+zXI1RryPTx20tDxpHEFlwSrNaPMbsmSx+rnah96w+g==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR03MB5274.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(86362001)(966005)(5660300002)(33656002)(478600001)(66476007)(66556008)(71200400001)(66946007)(52536014)(76116006)(2906002)(64756008)(66446008)(8936002)(8676002)(7416002)(4326008)(83080400001)(186003)(9686003)(6916009)(6506007)(7696005)(316002)(54906003)(55016002)(26005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: Eu86vait4CSNlfAg1+A3hnaQBy8ebO9Ow59nLkVYEOg5BgVJoXY3FEHvcfXqLMe8ny+Aw+bUl1/5BANCRg48PAur2hG/XDegAUHoIBFIsg3PUT81CPqmGiTinV4YThcG/rXF5LSOs1kqQsKvIWtfq6sozBOtcLXuUHpWjs9ggI004RjS5V6fyO+OrI3ZtdjtlF4Wct30l8FUR9xvEWJO7VXX1XBvmAX1w5p8rhxODtKAA5++6d03VjdolXjQNijj5HoaGE7CL8hsA5nuyQZcuqMk3NYbxpX/EUnTBkIGaxUxiGk8X9osqmnpGPbwTFSsUA8jzIFUgUbbO2+o7jmbaDkfoxkggtGAEA65YznOv+5Mcpg7jEGjXxnaipn1MfAxc1Wq/+9moDKEDzEXXdsSx9ft9mDeQqczh6iLl/pMbFBPN8Q1YcbIuJNhgk1WTa7eO9XWC7zMl+y9fhVUrf/ip9c8GIWqaVu8RJjjgZzzXI+GxW3pAFe5h0xZMuDpLILYyAgFX18KQzJ9lbLPTqV5lOSgrcqjd4mbbj2ij5NmQ8pWjz/QGAJCv18q+FpZra5EhktvuXoWlwFExveEov9OQtHkG0PT8ZM80TAf9NnhWjUw7RgZbAFfBFuq2m7mzIAzxRIni/lkNmr9E8CFFxyeNw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR03MB5274.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b3eb904-bd4b-432c-86f0-08d86b554775
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2020 06:42:08.7236
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 358nEWoR1bi3fVD7c4hZsnQFZGOuk0jZOTBzGhc1Kw90hKJNID2dQTXkeeFSSsEwNU7b0GOVrkQrHTB1+ra12OJIM4xWca0KuUxNPTnYjj4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR03MB2443
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-08_03:2020-10-08,2020-10-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2010080050
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

> Hi Bogdan,
>=20
> On Thu, Oct 08, 2020 at 06:23:33AM +0000, Togorean, Bogdan wrote:
> > Thank you Rob for review
> > > On Fri, Oct 02, 2020 at 04:35:17PM +0300, Bogdan Togorean wrote:
> > > > Add YAML device tree bindings for Analog Devices Inc. ADDI9036 CCD =
TOF
> > > > front-end.
> > > >
> > > > Signed-off-by: Bogdan Togorean <bogdan.togorean@analog.com>
> > > > ---
> > > > v2: added reg property description
> > > > ---
> > > >  .../bindings/media/i2c/adi,addi9036.yaml      | 76 +++++++++++++++=
++++
> > > >  1 file changed, 76 insertions(+)
> > > >  create mode 100644
> > > Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > >
> > > > diff --git
> a/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > > new file mode 100644
> > > > index 000000000000..7c4af704db98
> > > > --- /dev/null
> > > > +++ b/Documentation/devicetree/bindings/media/i2c/adi,addi9036.yaml
> > > > @@ -0,0 +1,76 @@
> > > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > > +%YAML 1.2
> > > > +---
> > > > +$id:
> > >
> https://urldefense.com/v3/__http://devicetree.org/schemas/media/i2c/adi,a=
dd
> > >
> i9036.yaml*__;Iw!!A3Ni8CS0y2Y!vLJoRikiVhmxm8p3bhGjRkFIWgjXvVlcJ8ATa9okn
> > > JqDbtobtK46hHICblE2i2Yj2sZL$
> > > > +$schema: https://urldefense.com/v3/__http://devicetree.org/meta-
> > >
> schemas/core.yaml*__;Iw!!A3Ni8CS0y2Y!vLJoRikiVhmxm8p3bhGjRkFIWgjXvVlcJ
> > > 8ATa9oknJqDbtobtK46hHICblE2iz34fu4o$
> > > > +
> > > > +title: Analog Devices ADDI9036 VGA CCD Time of Flight Sensor
> > > > +
> > > > +maintainers:
> > > > +  - Bogdan Togorean <bogdan.togorean@analog.com>
> > > > +
> > > > +description: |-
> > > > +  The ADDI9036 is a complete, 45 MHz, front-end solution for charg=
e
> coupled
> > > > +  device (CCD) time of flight (TOF) imaging applications. It is pr=
ogrammable
> > > > +  through I2C interface. Image data is sent through MIPI CSI-2 2 l=
anes and
> > > > +  can output two RAW12 packed data streams. One is IR and the othe=
r is
> > > Depth.
> > > > +  Each data stream is on a separate or same MIPI Virtual Channel,
> depending
> > > > +  on configuration and each have 640x480 resolution.
> > > > +
> > > > +properties:
> > > > +  compatible:
> > > > +    const: adi,addi9036
> > > > +
> > > > +  reg:
> > > > +    description: I2C device address
> > >
> > > Can drop this.
> > ACK
> > >
> > > > +    maxItems: 1
> > > > +
> > > > +  reset-gpios:
> > >
> > > maxItems: 1
> > ACK
> > >
> > > > +    description: |-
> > > > +      Reference to the GPIO connected to the RST/SYNC pin, if any.
> > > > +      Must be released (set high) after all supplies are applied.
> > > > +
> > > > +  # See ../video-interfaces.txt for more details
> > > > +  port:
> > > > +    type: object
> > > > +    properties:
> > > > +      endpoint:
> > > > +        type: object
> > > > +        properties:
> > > > +          data-lanes:
> > > > +            description: |-
> > > > +              The sensor supports two-lane operation.
> > > > +              For two-lane operation the property must be set to <=
1 2>.
> > > > +            items:
> > > > +              - const: 1
> > > > +              - const: 2
> > >
> > > If this is the only possible setting, then why does it need to be in =
DT?
> > If this is not set the bus_type will be not be correctly set after call=
 of
> > v4l2_fwnode_endpoint_parse.
>=20
> That's not a DT binding issue. The driver needs to set the field before
> calling v4l2_fwnode_endpoint_parse.
>=20
> Does the device not support one lane operation?
>=20
Now I was reading your response to driver review and understood the problem=
.
Sorry for this an I'll set the bus_type in driver before call of v4l2_fwnod=
e_endpoint_parse.

And the camera does not support one lane.
> --
> Regards,
>=20
> Sakari Ailus
