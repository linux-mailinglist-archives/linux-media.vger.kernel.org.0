Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4279C3738A
	for <lists+linux-media@lfdr.de>; Thu,  6 Jun 2019 13:54:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728646AbfFFLyf (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Jun 2019 07:54:35 -0400
Received: from mail-eopbgr700079.outbound.protection.outlook.com ([40.107.70.79]:22528
        "EHLO NAM04-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728642AbfFFLyf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 6 Jun 2019 07:54:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2S+pn5LyPna6Nz2xtiiNlAnJ/tJGiCkIcJYp4i5Ui8=;
 b=qgYyHazk3OSI6tf5kDuqlSgVn3KRrBEJL+VzOwz/xdosPlGDSkWt/rjPeqmHQhQAcsSjDjkDTBEUGp8BthCzH8ijwdzsU3cYhS8/cpmSGdROpkxJAjMrlWNq8woIcNa+W9d6T5CT8RdxiYbDY9/vJd2qNDEO252NZid4ziI8gfY=
Received: from CH2PR02MB6088.namprd02.prod.outlook.com (52.132.228.94) by
 CH2PR02MB6357.namprd02.prod.outlook.com (52.132.231.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.22; Thu, 6 Jun 2019 11:54:27 +0000
Received: from CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::3cca:e795:ebe2:b366]) by CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::3cca:e795:ebe2:b366%6]) with mapi id 15.20.1943.018; Thu, 6 Jun 2019
 11:54:27 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>
CC:     Hyun Kwon <hyunk@xilinx.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        Michal Simek <michals@xilinx.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Dinesh Kumar <dineshk@xilinx.com>,
        Sandip Kothari <sandipk@xilinx.com>,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Jacopo Mondi <jacopo@jmondi.org>
Subject: RE: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx MIPI
 CSI-2 Rx Subsystem
Thread-Topic: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx
 MIPI CSI-2 Rx Subsystem
Thread-Index: AQHVGfMZOW4cFen74Uu6bLLV7F3ehaaLn6IAgALpoTA=
Date:   Thu, 6 Jun 2019 11:54:27 +0000
Message-ID: <CH2PR02MB6088D91C1EFE1C049986E118A7170@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-2-git-send-email-vishal.sagar@xilinx.com>
 <20190604152540.wd7c3scez2futh6z@paasikivi.fi.intel.com>
In-Reply-To: <20190604152540.wd7c3scez2futh6z@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 57f28c0d-8286-478d-fb7a-08d6ea75ba66
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:CH2PR02MB6357;
x-ms-traffictypediagnostic: CH2PR02MB6357:
x-microsoft-antispam-prvs: <CH2PR02MB63577260B38C2BC94BF0CBBEA7170@CH2PR02MB6357.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00603B7EEF
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(136003)(366004)(396003)(346002)(39860400002)(376002)(13464003)(51914003)(199004)(189003)(86362001)(4326008)(256004)(229853002)(2906002)(7416002)(76176011)(33656002)(305945005)(6116002)(66556008)(486006)(74316002)(9686003)(71200400001)(68736007)(5660300002)(53936002)(55016002)(478600001)(3846002)(71190400001)(316002)(52536014)(14444005)(6636002)(476003)(66946007)(73956011)(76116006)(99286004)(66446008)(6506007)(64756008)(7736002)(7696005)(66476007)(81166006)(446003)(6246003)(66066001)(186003)(11346002)(8676002)(81156014)(26005)(110136005)(54906003)(14454004)(25786009)(6436002)(53546011)(8936002)(102836004);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6357;H:CH2PR02MB6088.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: gkxnVMDTYvDyStcwERSTjWWKhaL3fa5QyzMBKnzwpZ5QtaDFF9XGY+texc7z7QDr9KJRDkElrYdNV0yot6XaHtemyJTqLuANqIyxUDo32T4EcI2Z0hqqN6KwFssfe7knA6W4DgIFMIeY65hdkrwsUUyQfHTOfqT94bkuPXA2TyJpQw6czyhWr2HvFi/AFWKhqKGi5cxwaYA1w/AB0a9A6GwjANtfykRO6jvQeks8QRAKd/YJrGECO85F9Au0BQKT9feNNiGXIvxfryF+aDhgfOhqLETX2LfA1lS6C9wBBZ/3Ls7apHFNE5vYT4+ZK3oWyK7vHK4o1/4Di9hCKucom0psSsm6NGAMkPJJ7jxnHe/K1hymLctXe/Aj1cjaLALN2jhlXKX+Ax1OJc49Ok9JvsbAkLxDQWohDmD0a4HbSz0=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57f28c0d-8286-478d-fb7a-08d6ea75ba66
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Jun 2019 11:54:27.7139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsagar@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6357
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for reviewing this.

> -----Original Message-----
> From: linux-media-owner@vger.kernel.org [mailto:linux-media-
> owner@vger.kernel.org] On Behalf Of Sakari Ailus
> Sent: Tuesday, June 04, 2019 8:56 PM
> To: Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com; Michal
> Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> Subject: Re: [PATCH v8 1/2] media: dt-bindings: media: xilinx: Add Xilinx=
 MIPI
> CSI-2 Rx Subsystem
>=20
> Hi Vishal,
>=20
> Thanks for the update. A few small issues below...
>=20
> On Mon, Jun 03, 2019 at 03:29:30PM +0530, Vishal Sagar wrote:
> > Add bindings documentation for Xilinx MIPI CSI-2 Rx Subsystem.
> >
> > The Xilinx MIPI CSI-2 Rx Subsystem consists of a CSI-2 Rx controller, a
> > DPHY in Rx mode, an optional I2C controller and a Video Format Bridge.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > Reviewed-by: Rob Herring <robh@kernel.org>
> > Reviewed-by: Luca Ceresoli <luca@lucaceresoli.net>
> > ---
> > v8
> > - Added reset-gpios optional property to assert video_aresetn
> >
> > v7
> > - Removed the control name from dt bindings
> > - Updated the example dt node name to csi2rx
> >
> > v6
> > - Added "control" after V4L2_CID_XILINX_MIPICSISS_ACT_LANES as suggeste=
d
> by Luca
> > - Added reviewed by Rob Herring
> >
> > v5
> > - Incorporated comments by Luca Cersoli
> > - Removed DPHY clock from description and example
> > - Removed bayer pattern from device tree MIPI CSI IP
> >   doesn't deal with bayer pattern.
> >
> > v4
> > - Added reviewed by Hyun Kwon
> >
> > v3
> > - removed interrupt parent as suggested by Rob
> > - removed dphy clock
> > - moved vfb to optional properties
> > - Added required and optional port properties section
> > - Added endpoint property section
> >
> > v2
> > - updated the compatible string to latest version supported
> > - removed DPHY related parameters
> > - added CSI v2.0 related property (including VCX for supporting upto 16
> >   virtual channels).
> > - modified csi-pxl-format from string to unsigned int type where the va=
lue
> >   is as per the CSI specification
> > - Defined port 0 and port 1 as sink and source ports.
> > - Removed max-lanes property as suggested by Rob and Sakari
> >
> >  .../bindings/media/xilinx/xlnx,csi2rxss.txt        | 119
> +++++++++++++++++++++
> >  1 file changed, 119 insertions(+)
> >  create mode 100644
> Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> >
> > diff --git a/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rx=
ss.txt
> b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > new file mode 100644
> > index 0000000..fef8179
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/xilinx/xlnx,csi2rxss.txt
> > @@ -0,0 +1,119 @@
> > +Xilinx MIPI CSI2 Receiver Subsystem Device Tree Bindings
> > +--------------------------------------------------------
> > +
> > +The Xilinx MIPI CSI2 Receiver Subsystem is used to capture MIPI CSI2 t=
raffic
> > +from compliant camera sensors and send the output as AXI4 Stream video
> data
> > +for image processing.
> > +
> > +The subsystem consists of a MIPI DPHY in slave mode which captures the
> > +data packets. This is passed along the MIPI CSI2 Rx IP which extracts =
the
> > +packet data. The optional Video Format Bridge (VFB) converts this data=
 to
> > +AXI4 Stream video data.
> > +
> > +For more details, please refer to PG232 Xilinx MIPI CSI-2 Receiver Sub=
system.
> > +
> > +Required properties:
> > +--------------------
> > +- compatible: Must contain "xlnx,mipi-csi2-rx-subsystem-4.0".
> > +- reg: Physical base address and length of the registers set for the d=
evice.
> > +- interrupts: Property with a value describing the interrupt number.
> > +- clocks: List of phandles to AXI Lite and Video clocks.
> > +- clock-names: Must contain "lite_aclk" and "video_aclk" in the same o=
rder
> > +  as clocks listed in clocks property.
> > +- xlnx,csi-pxl-format: This denotes the CSI Data type selected in hw d=
esign.
> > +  Packets other than this data type (except for RAW8 and User defined =
data
> > +  types) will be filtered out. Possible values are as below -
> > +  0x1E - YUV4228B
> > +  0x1F - YUV42210B
> > +  0x20 - RGB444
> > +  0x21 - RGB555
> > +  0x22 - RGB565
> > +  0x23 - RGB666
> > +  0x24 - RGB888
> > +  0x28 - RAW6
> > +  0x29 - RAW7
> > +  0x2A - RAW8
> > +  0x2B - RAW10
> > +  0x2C - RAW12
> > +  0x2D - RAW14
> > +  0x2E - RAW16
> > +  0x2F - RAW20
> > +
> > +
> > +Optional properties:
> > +--------------------
> > +- xlnx,vfb: This is present when Video Format Bridge is enabled.
> > +  Without this property the driver won't be loaded as IP won't be able=
 to
> generate
> > +  media bus format compliant stream output.
> > +- xlnx,en-csi-v2-0: Present if CSI v2 is enabled in IP configuration.
> > +- xlnx,en-vcx: When present, there are maximum 16 virtual channels, el=
se
> > +  only 4. This is present only if xlnx,en-csi-v2-0 is present.
> > +- xlnx,en-active-lanes: present if the number of active lanes can be
> > +  re-configured at runtime in the Protocol Configuration Register.
> > +  Otherwise all lanes, as set in IP configuration, are always active.
> > +- reset-gpios: Optional specifier for a GPIO that asserts video_areset=
n.
> > +
> > +Ports
> > +-----
> > +The device node shall contain two 'port' child nodes as defined in
> > +Documentation/devicetree/bindings/media/video-interfaces.txt.
> > +
> > +The port@0 is a sink port and shall connect to CSI2 source like camera=
.
> > +It must have the data-lanes property.
>=20
> Technically this is wrong as data-lanes is an endpoint property. I'd just
> leave it out here.
>=20

Ok I will remove it from here.

> > +
> > +The port@1 is a source port and can be connected to any video processi=
ng IP
> > +which can work with AXI4 Stream data.
> > +
> > +Required port properties:
> > +--------------------
> > +- reg: 0 - for sink port.
> > +       1 - for source port.
> > +
> > +Optional endpoint property:
>=20
> s/Optional/Required/
>=20
Noted. I will change it to required.

> > +---------------------------
> > +- data-lanes: specifies MIPI CSI-2 data lanes as covered in video-
> interfaces.txt.
> > +  This should be in the sink port endpoint which connects to MIPI CSI2=
 source
> > +  like sensor. The possible values are:
>=20
> And add here that it's only needed for port 0. Or put it to the heading.

Ok.

>=20
> I think this is good with these changes.
>=20
> > +  1       - For 1 lane enabled in IP.
> > +  1 2     - For 2 lanes enabled in IP.
> > +  1 2 3   - For 3 lanes enabled in IP.
> > +  1 2 3 4 - For 4 lanes enabled in IP.
> > +
> > +Example:
> > +
> > +	xcsi2rxss_1: csi2rx@a0020000 {
> > +		compatible =3D "xlnx,mipi-csi2-rx-subsystem-4.0";
> > +		reg =3D <0x0 0xa0020000 0x0 0x10000>;
> > +		interrupt-parent =3D <&gic>;
> > +		interrupts =3D <0 95 4>;
> > +		xlnx,csi-pxl-format =3D <0x2a>;
> > +		xlnx,vfb;
> > +		xlnx,en-active-lanes;
> > +		xlnx,en-csi-v2-0;
> > +		xlnx,en-vcx;
> > +		clock-names =3D "lite_aclk", "video_aclk";
> > +		clocks =3D <&misc_clk_0>, <&misc_clk_1>;
> > +		reset-gpios =3D <&gpio 86 GPIO_ACTIVE_LOW>;
> > +
> > +		ports {
> > +			#address-cells =3D <1>;
> > +			#size-cells =3D <0>;
> > +
> > +			port@0 {
> > +				/* Sink port */
> > +				reg =3D <0>;
> > +				csiss_in: endpoint {
> > +					data-lanes =3D <1 2 3 4>;
> > +					/* MIPI CSI2 Camera handle */
> > +					remote-endpoint =3D <&camera_out>;
> > +				};
> > +			};
> > +			port@1 {
> > +				/* Source port */
> > +				reg =3D <1>;
> > +				csiss_out: endpoint {
> > +					remote-endpoint =3D <&vproc_in>;
> > +				};
> > +			};
> > +		};
> > +	};
> > --
> > 1.8.3.1
>=20
> How old is that? :-)
>=20

Found out that version is nearly 6 years old.  :-)
I will update git.

> --
> Kind regards,
>=20
> Sakari Ailus
> sakari.ailus@linux.intel.com

Regards
Vishal Sagar
