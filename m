Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D9C956538C
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:11:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727972AbfGKJLl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:11:41 -0400
Received: from mail-eopbgr770045.outbound.protection.outlook.com ([40.107.77.45]:14081
        "EHLO NAM02-SN1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726997AbfGKJLl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:11:41 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOS4wAEf6doZzjL3B+gPyyTDT9WCt814P5a5dRR+2Wqh72TQ/SvGS+pB2YM6WCa75MBVX8os/r0FpWrB2dyJX6M86KAt+FKs5UC2Lx8emvcFwmCH53sSmMB3DLWxu8GD398bZVIvsekYZQT6S/p36WlP6ZjgTaIt/qL8lmLQHMPjU43ybDtDP26IJc4v/ZlCJDIPoTmtJEXVpYQfURyyobylGjZFNFe1WSe0pRKRIGCAWpTVFhTCVHbe6S1ehY0odDYl8tZEvYYV+UmnRbHstcYaMOSU9G9PsqVJomV8Y/I4ctp4oXEpeWI0O6easGBiYGORS29VURFEQiE4MH6M6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAxqZbl8XOiLKyBKtMpw7pXToRlDXvZtUUHQn5Xu+tE=;
 b=HJA2gcIF3O++0KZJKm4RcnAgyIf5cQrLNxQDGLdVAd7Y3L2rdCaUUh0odcY9iZ44t6NIeF2Ih7FXNlPtPQM6YTNkqNHHtaK2GH4VLHJzaWSt8LBiHzOgtV1khN6YIVUkg8KGJDz1jCu8FEw8YX1l2aYgCo6FrjGFh0J2E2WU5ftPMVgyfsqcqyGsxotX7IVgp8DfBhrFXm6c6p9Me5gZ/yy3zoyExhvCmwWWN3xCScSSTSWmXPNE1IR2lTmb2mr6gX9ZsJ7kCt5uepCHF5wK+yxW75FHLWSrLnwZJqRF7xl+TVEZkboMFHj1/G6AP1v3mDsvczwONtKVTarmzDGBQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=xilinx.com;dmarc=pass action=none
 header.from=xilinx.com;dkim=pass header.d=xilinx.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bAxqZbl8XOiLKyBKtMpw7pXToRlDXvZtUUHQn5Xu+tE=;
 b=V4M46TWMGtCvhC7kqTUV5jy64w/YUehd7Jhgz0Lbn8YrdcWw7Z+YP+QquYZfK4O1P3gdVH1sipPg5Y6HJI/XRJiggKLqOtis4hyPiAu1vpJis5MxM8rRHLoAVFVFEi9d0+mQgyN+HnfHxHI65zELupiPFxSfK6uA8tFKzKZrHqY=
Received: from CH2PR02MB6088.namprd02.prod.outlook.com (52.132.228.94) by
 CH2PR02MB6039.namprd02.prod.outlook.com (10.255.156.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 09:09:37 +0000
Received: from CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::456d:ace7:7c55:8639]) by CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::456d:ace7:7c55:8639%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 09:09:37 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>,
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
Subject: RE: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Topic: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Index: AQHVID4PYfrRtfYgTECjjXwqUQCuJaahkfqAgCO733A=
Date:   Thu, 11 Jul 2019 09:09:37 +0000
Message-ID: <CH2PR02MB6088B5E97833233486C53E9BA7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1560247809-117978-1-git-send-email-vishal.sagar@xilinx.com>
 <1560247809-117978-3-git-send-email-vishal.sagar@xilinx.com>
 <20190618151933.zqepfqdjjjlhea7h@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190618151933.zqepfqdjjjlhea7h@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b17bcb98-89e2-4af4-6bc5-08d705df7ff8
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:CH2PR02MB6039;
x-ms-traffictypediagnostic: CH2PR02MB6039:
x-microsoft-antispam-prvs: <CH2PR02MB6039CA5B98E3E89F05F658FCA7F30@CH2PR02MB6039.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:324;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(43544003)(199004)(189003)(45074003)(13464003)(66476007)(71190400001)(66066001)(55016002)(76116006)(66556008)(66946007)(6436002)(33656002)(66446008)(14454004)(229853002)(54906003)(7696005)(2906002)(71200400001)(25786009)(53936002)(64756008)(99286004)(6116002)(3846002)(110136005)(7736002)(74316002)(6246003)(305945005)(81156014)(7416002)(4326008)(81166006)(9686003)(52536014)(5660300002)(14444005)(256004)(76176011)(53946003)(186003)(6506007)(30864003)(53546011)(478600001)(26005)(446003)(476003)(486006)(11346002)(316002)(6636002)(86362001)(8936002)(102836004)(68736007)(8676002)(579004)(569006);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6039;H:CH2PR02MB6088.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: Cn/F1E8UmMktAg0x3y/v+E1O6VrF8siLqciINGjDWOBFuXQbbzOW4IorCOEb1R03lXffi7p6wxX6rIwf4uCmQvTFEZRseFdDhsvprwMxvxXUlJ7lEQZzlEeHEHiTriscWMqZJjSCnz2/ndxqeGZbflvcr3VIAQ2mJ7LGZWL77FL4L5HvWOmJaH3vofhD5EefFM/TvlFFnvu5AVbj4XtawD/opoctOgzylqDmwNdnPvXWSFy1JWyNdEp+GgkG0wYpC3uSjPH9gZBZhH4i9WRq0BJEUwm7YRneGeSy02mh7CNtEB+TvFTPcS7PHdMcFtWxRO00QpVflMUlyLSOYO/zcPx+jNSkkzRYQ+wCAjSv7mBkJRw/HIEpW3oOWGPTt0SMoJudCRpoQpMqSQJtUb0+cRZXzIx8FRgHBsvECYWa0+A=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b17bcb98-89e2-4af4-6bc5-08d705df7ff8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 09:09:37.7028
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsagar@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6039
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for reviewing.

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus@iki.fi]
> Sent: Tuesday, June 18, 2019 8:50 PM
> To: Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com; Michal
> Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> Subject: Re: [PATCH v9 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
> Subsystem driver
>=20
> EXTERNAL EMAIL
>=20
> Hi Vishal,
>=20
> On Tue, Jun 11, 2019 at 03:40:09PM +0530, Vishal Sagar wrote:
> > The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
> > from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
> > for image processing. Please refer to PG232 for details.
> >
> > The driver is used to set the number of active lanes, if enabled
> > in hardware. The CSI2 Rx controller filters out all packets except for
> > the packets with data type fixed in hardware. RAW8 packets are always
> > allowed to pass through.
> >
> > It is also used to setup and handle interrupts and enable the core. It
> > logs all the events in respective counters between streaming on and off=
.
> >
> > The driver supports only the video format bridge enabled configuration.
> > Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when
> the
> > CSI v2.0 feature is enabled in design. When the VCX feature is enabled,
> > the maximum number of virtual channels becomes 16 from 4.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > ---
> > v9
> > - Moved all controls and events to xilinx-csi2rxss.h
> > - Updated name and description of controls and events
> > - Get control base address from v4l2-controls.h (0x10c0)
> > - Fix KConfig for dependency on VIDEO_XILINX
> > - Added enum_mbus_code() support
> > - Added default format to be returned on open()
> > - Mark variables are const
> > - Remove references to short packet in comments
> > - Add check for streaming before setting active lanes control
> > - strlcpy -> strscpy
> > - Fix xcsi2rxss_set_format()
> >
> > v8
> > - Use clk_bulk* APIs
> > - Add gpio reset for asserting video_aresetn when stream line buffer oc=
curs
> > - Removed short packet related events and irq handling
> >   - V4L2_EVENT_XLNXCSIRX_SPKT and V4L2_EVENT_XLNXCSIRX_SPKT_OVF
> removed
> > - Removed frame counter control
> V4L2_CID_XILINX_MIPICSISS_FRAME_COUNTER
> >   and xcsi2rxss_g_volatile_ctrl()
> > - Minor formatting fixes
> >
> > v7
> > - No change
> >
> > v6
> > - No change
> >
> > v5
> > - Removed bayer and updated related parts like set default format based
> >   on Luca Cersoli's comments.
> > - Added correct YUV422 10bpc media bus format
> >
> > v4
> > - Removed irq member from core structure
> > - Consolidated IP config prints in xcsi2rxss_log_ipconfig()
> > - Return -EINVAL in case of invalid ioctl
> > - Code formatting
> > - Added reviewed by Hyun Kwon
> >
> > v3
> > - Fixed comments given by Hyun.
> > - Removed DPHY 200 MHz clock. This will be controlled by DPHY driver
> > - Minor code formatting
> > - en_csi_v20 and vfb members removed from struct and made local to dt
> parsing
> > - lock description updated
> > - changed to ratelimited type for all dev prints in irq handler
> > - Removed YUV 422 10bpc media format
> >
> > v2
> > - Fixed comments given by Hyun and Sakari.
> > - Made all bitmask using BIT() and GENMASK()
> > - Removed unused definitions
> > - Removed DPHY access. This will be done by separate DPHY PHY driver.
> > - Added support for CSI v2.0 for YUV 422 10bpc, RAW16, RAW20 and extra
> >   virtual channels
> > - Fixed the ports as sink and source
> > - Now use the v4l2fwnode API to get number of data-lanes
> > - Added clock framework support
> > - Removed the close() function
> > - updated the set format function
> > - support only VFB enabled configuration
> >
> >  drivers/media/platform/xilinx/Kconfig           |   11 +
> >  drivers/media/platform/xilinx/Makefile          |    1 +
> >  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1488
> +++++++++++++++++++++++
> >  include/uapi/linux/v4l2-controls.h              |    4 +
> >  include/uapi/linux/xilinx-csi2rxss.h            |   52 +
> >  5 files changed, 1556 insertions(+)
> >  create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
> >  create mode 100644 include/uapi/linux/xilinx-csi2rxss.h
> >
> > diff --git a/drivers/media/platform/xilinx/Kconfig
> b/drivers/media/platform/xilinx/Kconfig
> > index a2773ad..349da87 100644
> > --- a/drivers/media/platform/xilinx/Kconfig
> > +++ b/drivers/media/platform/xilinx/Kconfig
> > @@ -10,6 +10,17 @@ config VIDEO_XILINX
> >
> >  if VIDEO_XILINX
> >
> > +config VIDEO_XILINX_CSI2RXSS
> > +     tristate "Xilinx CSI2 Rx Subsystem"
> > +     depends on VIDEO_XILINX
> > +     help
> > +       Driver for Xilinx MIPI CSI2 Rx Subsystem. This is a V4L sub-dev=
ice
> > +       based driver that takes input from CSI2 Tx source and converts
> > +       it into an AXI4-Stream. The subsystem comprises of a CSI2 Rx
> > +       controller, DPHY, an optional I2C controller and a Video Format
> > +       Bridge. The driver is used to set the number of active lanes an=
d
> > +       get short packet data.
> > +
> >  config VIDEO_XILINX_TPG
> >       tristate "Xilinx Video Test Pattern Generator"
> >       depends on VIDEO_XILINX
> > diff --git a/drivers/media/platform/xilinx/Makefile
> b/drivers/media/platform/xilinx/Makefile
> > index 4cdc0b1..6119a34 100644
> > --- a/drivers/media/platform/xilinx/Makefile
> > +++ b/drivers/media/platform/xilinx/Makefile
> > @@ -3,5 +3,6 @@
> >  xilinx-video-objs +=3D xilinx-dma.o xilinx-vip.o xilinx-vipp.o
> >
> >  obj-$(CONFIG_VIDEO_XILINX) +=3D xilinx-video.o
> > +obj-$(CONFIG_VIDEO_XILINX_CSI2RXSS) +=3D xilinx-csi2rxss.o
> >  obj-$(CONFIG_VIDEO_XILINX_TPG) +=3D xilinx-tpg.o
> >  obj-$(CONFIG_VIDEO_XILINX_VTC) +=3D xilinx-vtc.o
> > diff --git a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > new file mode 100644
> > index 0000000..373d91f
> > --- /dev/null
> > +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > @@ -0,0 +1,1488 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Xilinx MIPI CSI2 Rx Subsystem
> > + *
> > + * Copyright (C) 2016 - 2019 Xilinx, Inc.
> > + *
> > + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> > + *
> > + */

<snip>

> > +/**
> > + * struct xcsi2rxss_event - Event log structure
> > + * @mask: Event mask
> > + * @name: Name of the event
> > + * @counter: Count number of events
> > + */
> > +struct xcsi2rxss_event {
> > +     u32 mask;
> > +     const char *name;
> > +     unsigned int counter;
>=20
> You can now omit the counter field that is not used anymore. The counter
> should be a separate integer array.
>

Agreed. I will make the counters into separate integer array.
=20
> > +};
> > +
> > +/*
> > + * struct xcsi2rxss_core - Core configuration CSI2 Rx Subsystem device
> structure
> > + * @dev: Platform structure
> > + * @iomem: Base address of subsystem
> > + * @enable_active_lanes: If number of active lanes can be modified
> > + * @max_num_lanes: Maximum number of lanes present
> > + * @datatype: Data type filter
> > + * @events: Structure to maintain event logs
> > + * @vcx_events: Structure to maintain VCX event logs
> > + * @en_vcx: If more than 4 VC are enabled
> > + * @clks: array of clocks
> > + * @num_clks: number of clocks
> > + * @rst_gpio: reset to video_aresetn
> > + */

<snip>

> > +
> > +/* Print event counters */
> > +static void xcsi2rxss_log_counters(struct xcsi2rxss_state *state)
> > +{
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +     int i;
>=20
> unsigned int
>

Noted. Will fix in next version.
=20
> > +
> > +     for (i =3D 0; i < XCSI_NUM_EVENTS; i++) {
> > +             if (core->events[i].counter > 0) {
> > +                     dev_info(core->dev, "%s events: %d\n",
> > +                              core->events[i].name,
> > +                              core->events[i].counter);
> > +             }
> > +     }
> > +
> > +     if (core->en_vcx) {
> > +             for (i =3D 0; i < XCSI_VCX_NUM_EVENTS; i++) {
> > +                     if (core->vcx_events[i].counter > 0) {
> > +                             dev_info(core->dev,
> > +                                      "VC %d Frame %s err vcx events: =
%d\n",
> > +                                      (i / 2) + XCSI_VCX_START,
> > +                                      i & 1 ? "Sync" : "Level",
> > +                                      core->vcx_events[i].counter);
> > +                     }
> > +             }
> > +     }
> > +}
> > +
> > +static void xcsi2rxss_log_ipconfig(struct xcsi2rxss_state *state)
> > +{
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +     dev_dbg(core->dev, "****** Xilinx MIPI CSI2 Rx SS IP Config *****=
*\n");
> > +     dev_dbg(core->dev, "vcx is %s", core->en_vcx ? "enabled" : "disab=
led");
> > +     dev_dbg(core->dev, "Enable active lanes property is %s\n",
> > +             core->enable_active_lanes ? "present" : "absent");
> > +     dev_dbg(core->dev, "Max lanes =3D %d", core->max_num_lanes);
> > +     dev_dbg(core->dev, "Pixel format set as 0x%x\n", core->datatype);
> > +     dev_dbg(core->dev,
> "**********************************************\n");
> > +}
> > +
> > +/**
> > + * xcsi2rxss_log_status - Logs the status of the CSI-2 Receiver
> > + * @sd: Pointer to V4L2 subdevice structure
> > + *
> > + * This function prints the current status of Xilinx MIPI CSI-2
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xcsi2rxss_log_status(struct v4l2_subdev *sd)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +     unsigned int reg, data, i, max_vc;
>=20
> Please use u32 for 32-bit register values.
>=20

Noted. Will fix in next version.

> > +
> > +     mutex_lock(&xcsi2rxss->lock);
> > +
> > +     xcsi2rxss_log_ipconfig(xcsi2rxss);
> > +
> > +     xcsi2rxss_log_counters(xcsi2rxss);
> > +
> > +     dev_info(core->dev, "***** Core Status *****\n");
> > +     data =3D xcsi2rxss_read(core, XCSI_CSR_OFFSET);
> > +     dev_info(core->dev, "Short Packet FIFO Full =3D %s\n",
> > +              XCSI_GET_BITSET_STR(data, XCSI_CSR_SPFIFOFULL));
> > +     dev_info(core->dev, "Short Packet FIFO Not Empty =3D %s\n",
> > +              XCSI_GET_BITSET_STR(data, XCSI_CSR_SPFIFONE));
> > +     dev_info(core->dev, "Stream line buffer full =3D %s\n",
> > +              XCSI_GET_BITSET_STR(data, XCSI_CSR_SLBF));
> > +     dev_info(core->dev, "Soft reset/Core disable in progress =3D %s\n=
",
> > +              XCSI_GET_BITSET_STR(data, XCSI_CSR_RIPCD));
> > +
> > +     /* Clk & Lane Info  */
> > +     dev_info(core->dev, "******** Clock Lane Info *********\n");
> > +     data =3D xcsi2rxss_read(core, XCSI_CLKINFR_OFFSET);
> > +     dev_info(core->dev, "Clock Lane in Stop State =3D %s\n",
> > +              XCSI_GET_BITSET_STR(data, XCSI_CLKINFR_STOP));
> > +
> > +     dev_info(core->dev, "******** Data Lane Info *********\n");
> > +     dev_info(core->dev, "Lane\tSoT Error\tSoT Sync Error\tStop State\=
n");
> > +     reg =3D XCSI_DLXINFR_OFFSET;
> > +     for (i =3D 0; i < XCSI_MAXDL_COUNT; i++) {
> > +             data =3D xcsi2rxss_read(core, reg);
> > +
> > +             dev_info(core->dev, "%d\t%s\t\t%s\t\t%s\n", i,
> > +                      XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_SOTERR),
> > +                      XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_SOTSYNCER=
R),
> > +                      XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_STOP));
> > +
> > +             reg +=3D XCSI_NEXTREG_OFFSET;
> > +     }
> > +
> > +     /* Virtual Channel Image Information */
> > +     dev_info(core->dev, "********** Virtual Channel Info
> ************\n");
> > +     dev_info(core->dev, "VC\tLine Count\tByte Count\tData Type\n");
> > +     if (core->en_vcx)
> > +             max_vc =3D XCSI_MAX_VCX;
> > +     else
> > +             max_vc =3D XCSI_MAX_VC;
> > +
> > +     reg =3D XCSI_VCXINF1R_OFFSET;
> > +     for (i =3D 0; i < max_vc; i++) {
> > +             u32 line_count, byte_count, data_type;
> > +
> > +             /* Get line and byte count from VCXINFR1 Register */
> > +             data =3D xcsi2rxss_read(core, reg);
> > +             byte_count =3D data & XCSI_VCXINF1R_BYTECOUNT;
> > +             line_count =3D data & XCSI_VCXINF1R_LINECOUNT;
> > +             line_count >>=3D XCSI_VCXINF1R_LINECOUNT_SHIFT;
> > +
> > +             /* Get data type from VCXINFR2 Register */
> > +             reg +=3D XCSI_NEXTREG_OFFSET;
> > +             data =3D xcsi2rxss_read(core, reg);
> > +             data_type =3D data & XCSI_VCXINF2R_DT;
> > +
> > +             dev_info(core->dev, "%d\t%d\t\t%d\t\t0x%x\n", i, line_cou=
nt,
> > +                      byte_count, data_type);
> > +
> > +             /* Move to next pair of VC Info registers */
> > +             reg +=3D XCSI_NEXTREG_OFFSET;
> > +     }
> > +
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * xcsi2rxss_subscribe_event - Subscribe to custom events
> > + * receive event.
> > + * @sd: V4L2 Sub device
> > + * @fh: V4L2 File Handle
> > + * @sub: Subcribe event structure
> > + *
> > + * The driver generates a line buffer full event which the application=
 may
> > + * subscribe to. On getting this event, application may stop streaming=
 and
> > + * intimate user that something is incorrect in downstream pipeline wh=
ich
> > + * is causing this event.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xcsi2rxss_subscribe_event(struct v4l2_subdev *sd,
> > +                                  struct v4l2_fh *fh,
> > +                                  struct v4l2_event_subscription *sub)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +     int ret;
> > +
> > +     mutex_lock(&xcsi2rxss->lock);
> > +
> > +     switch (sub->type) {
> > +     case V4L2_EVENT_XILINX_CSI2RX_SLBF:
> > +             ret =3D v4l2_event_subscribe(fh, sub, XCSI_MAX_EVENT, NUL=
L);
>=20
> Please either use dev_dbg() or propose an API for conveying this
> information downstream in the pipeline.
>=20

I will use a dev_alert() in the irq handler for this for now and remove thi=
s event.

> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +     }
> > +
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_unsubscribe_event - Unsubscribe from all events registere=
d
> > + * @sd: V4L2 Sub device
> > + * @fh: V4L2 file handle
> > + * @sub: pointer to Event unsubscription structure
> > + *
> > + * Return: zero on success, else a negative error code.
> > + */
> > +static int xcsi2rxss_unsubscribe_event(struct v4l2_subdev *sd,
> > +                                    struct v4l2_fh *fh,
> > +                                    struct v4l2_event_subscription *su=
b)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +     int ret;
> > +
> > +     mutex_lock(&xcsi2rxss->lock);
> > +     ret =3D v4l2_event_unsubscribe(fh, sub);
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4L2 c=
ontrols
> > + * @ctrl: V4L2 control to be set
> > + *
> > + * This function is used to set the V4L2 controls for the Xilinx MIPI
> > + * CSI-2 Rx Subsystem. It is used to set the active lanes in the syste=
m.
> > + * The event counters can be reset.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D
> > +             container_of(ctrl->handler, struct xcsi2rxss_state,
> > +                          ctrl_handler);
> > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&xcsi2rxss->lock);
> > +
> > +     switch (ctrl->id) {
> > +     case V4L2_CID_XILINX_CSI2RX_ACT_LANES:
> > +             /*
> > +              * This will be called only when "Enable Active Lanes" pa=
rameter
> > +              * is set in design.
> > +              */
> > +             if (core->enable_active_lanes && !xcsi2rxss->streaming) {
> > +                     u32 active_lanes;
> > +
> > +                     xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
> > +                                           XCSI_PCR_ACTLANES_MASK,
> > +                                           ctrl->val - 1);
> > +                     /*
> > +                      * This delay is to allow the value to reflect as=
 write
> > +                      * and read paths are different.
> > +                      */
> > +                     udelay(1);
> > +                     active_lanes =3D xcsi2rxss_read(core, XCSI_PCR_OF=
FSET);
> > +                     active_lanes &=3D XCSI_PCR_ACTLANES_MASK;
> > +                     active_lanes++;
> > +                     if (active_lanes !=3D ctrl->val)
> > +                             dev_info(core->dev, "RxByteClkHS absent\n=
");
> > +                     dev_dbg(core->dev, "active lanes =3D %d\n", ctrl-=
>val);
> > +             } else {
> > +                     ret =3D -EINVAL;
> > +             }
> > +             break;
> > +     case V4L2_CID_XILINX_CSI2RX_RESET_COUNTERS:
>=20
> This is also a debug feature. I'd suggest to remove it.
>=20

Will remove it in next version.

> > +             xcsi2rxss_reset_event_counters(xcsi2rxss);
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +             break;
> > +     }
> > +
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +
> > +     return ret;
> > +}
> > +
> > +static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state)
> > +{
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +     int ret =3D 0;
> > +
> > +     xcsi2rxss_enable(core);
> > +
> > +     ret =3D xcsi2rxss_reset(core);
> > +     if (ret < 0) {
> > +             state->streaming =3D false;
> > +             return ret;
> > +     }
> > +
> > +     xcsi2rxss_intr_enable(core);
> > +     state->streaming =3D true;
> > +
> > +     return ret;
> > +}
> > +
> > +static void xcsi2rxss_stop_stream(struct xcsi2rxss_state *state)
> > +{
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +     xcsi2rxss_intr_disable(core);
> > +     xcsi2rxss_disable(core);
> > +     state->streaming =3D false;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_irq_handler - Interrupt handler for CSI-2
> > + * @irq: IRQ number
> > + * @dev_id: Pointer to device state
> > + *
> > + * In the interrupt handler, a list of event counters are updated for
> > + * corresponding interrupts. This is useful to get status / debug.
> > + *
> > + * In case of stream line buffer full condition, the IP is reset, stop=
ped and
> > + * an event is raised.
> > + *
> > + * Return: IRQ_HANDLED after handling interrupts
> > + *         IRQ_NONE is no interrupts
> > + */
> > +static irqreturn_t xcsi2rxss_irq_handler(int irq, void *dev_id)
> > +{
> > +     struct xcsi2rxss_state *state =3D (struct xcsi2rxss_state *)dev_i=
d;
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +     u32 status;
> > +
> > +     status =3D xcsi2rxss_read(core, XCSI_ISR_OFFSET) &
> XCSI_ISR_ALLINTR_MASK;
> > +     dev_dbg_ratelimited(core->dev, "interrupt status =3D 0x%08x\n", s=
tatus);
> > +
> > +     if (!status)
> > +             return IRQ_NONE;
> > +
> > +     /* Received a short packet */
> > +     if (status & XCSI_ISR_SPFIFONE) {
> > +             dev_dbg_ratelimited(core->dev, "Short packet =3D 0x%08x\n=
",
> > +                                 xcsi2rxss_read(core, XCSI_SPKTR_OFFSE=
T));
> > +     }
> > +
> > +     /* Short packet FIFO overflow */
> > +     if (status & XCSI_ISR_SPFIFOF)
> > +             dev_alert_ratelimited(core->dev, "Short packet FIFO overf=
lowed\n");
> > +
> > +     /*
> > +      * Stream line buffer full
> > +      * This means there is a backpressure from downstream IP
> > +      */
> > +     if (status & XCSI_ISR_SLBF) {
> > +             dev_alert_ratelimited(core->dev, "Stream Line Buffer Full=
!\n");
> > +             if (core->rst_gpio) {
> > +                     gpiod_set_value(core->rst_gpio, 1);
> > +                     /* minimum 40 dphy_clk_200M cycles */
> > +                     ndelay(250);
> > +                     gpiod_set_value(core->rst_gpio, 0);
> > +             }
> > +             xcsi2rxss_stop_stream(state);
> > +             memset(&state->event, 0, sizeof(state->event));
> > +             state->event.type =3D V4L2_EVENT_XILINX_CSI2RX_SLBF;
> > +             v4l2_subdev_notify_event(&state->subdev, &state->event);
> > +     }
> > +
> > +     /* Increment event counters */
> > +     if (status & XCSI_ISR_ALLINTR_MASK) {
> > +             unsigned int i;
> > +
> > +             for (i =3D 0; i < XCSI_NUM_EVENTS; i++) {
> > +                     if (!(status & core->events[i].mask))
> > +                             continue;
> > +                     core->events[i].counter++;
> > +                     dev_dbg_ratelimited(core->dev, "%s: %d\n",
> > +                                         core->events[i].name,
> > +                                         core->events[i].counter);
> > +             }
> > +
> > +             if (status & XCSI_ISR_VCXFE && core->en_vcx) {
> > +                     u32 vcxstatus;
> > +
> > +                     vcxstatus =3D xcsi2rxss_read(core, XCSI_VCXR_OFFS=
ET);
> > +                     vcxstatus &=3D XCSI_VCXR_VCERR;
> > +                     for (i =3D 0; i < XCSI_VCX_NUM_EVENTS; i++) {
> > +                             if (!(vcxstatus & core->vcx_events[i].mas=
k))
> > +                                     continue;
> > +                             core->vcx_events[i].counter++;
> > +                     }
> > +                     xcsi2rxss_write(core, XCSI_VCXR_OFFSET, vcxstatus=
);
> > +             }
> > +     }
> > +
> > +     xcsi2rxss_write(core, XCSI_ISR_OFFSET, status);
> > +     return IRQ_HANDLED;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_s_stream - It is used to start/stop the streaming.
> > + * @sd: V4L2 Sub device
> > + * @enable: Flag (True / False)
> > + *
> > + * This function controls the start or stop of streaming for the
> > + * Xilinx MIPI CSI-2 Rx Subsystem.
> > + *
> > + * Return: 0 on success, errors otherwise
> > + */
> > +static int xcsi2rxss_s_stream(struct v4l2_subdev *sd, int enable)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +     int ret =3D 0;
> > +
> > +     mutex_lock(&xcsi2rxss->lock);
> > +
> > +     if (enable) {
> > +             if (!xcsi2rxss->streaming) {
> > +                     /* reset the event counters */
> > +                     xcsi2rxss_reset_event_counters(xcsi2rxss);
> > +                     ret =3D xcsi2rxss_start_stream(xcsi2rxss);
> > +             }
> > +     } else {
> > +             if (xcsi2rxss->streaming) {
> > +                     struct gpio_desc *rst =3D xcsi2rxss->core.rst_gpi=
o;
> > +
> > +                     if (rst) {
> > +                             gpiod_set_value_cansleep(rst, 1);
> > +                             usleep_range(1, 2);
> > +                             gpiod_set_value_cansleep(rst, 0);
> > +                     }
> > +                     xcsi2rxss_stop_stream(xcsi2rxss);
> > +             }
> > +     }
> > +
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +     return ret;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +__xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
> > +                        struct v4l2_subdev_pad_config *cfg,
> > +                        unsigned int pad, u32 which)
> > +{
> > +     switch (which) {
> > +     case V4L2_SUBDEV_FORMAT_TRY:
> > +             return v4l2_subdev_get_try_format(&xcsi2rxss->subdev, cfg=
, pad);
> > +     case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +             return &xcsi2rxss->format;
> > +     default:
> > +             return NULL;
> > +     }
> > +}
> > +
> > +/**
> > + * xcsi2rxss_get_format - Get the pad format
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + * @fmt: Pointer to pad level media bus format
> > + *
> > + * This function is used to get the pad format information.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xcsi2rxss_get_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_pad_config *cfg,
> > +                             struct v4l2_subdev_format *fmt)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +
> > +     mutex_lock(&xcsi2rxss->lock);
> > +     fmt->format =3D *__xcsi2rxss_get_pad_format(xcsi2rxss, cfg, fmt->=
pad,
> > +                                               fmt->which);
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_set_format - This is used to set the pad format
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + * @fmt: Pointer to pad level media bus format
> > + *
> > + * This function is used to set the pad format. Since the pad format i=
s fixed
> > + * in hardware, it can't be modified on run time. So when a format set=
 is
> > + * requested by application, all parameters except the format type is =
saved
> > + * for the pad and the original pad format is sent back to the applica=
tion.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
> > +                             struct v4l2_subdev_pad_config *cfg,
> > +                             struct v4l2_subdev_format *fmt)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +     struct v4l2_mbus_framefmt *__format;
> > +
> > +     /* only sink pad format can be updated */
> > +     mutex_lock(&xcsi2rxss->lock);
> > +
> > +     /*
> > +      * Only the format->code parameter matters for CSI as the
> > +      * CSI format cannot be changed at runtime.
> > +      * Ensure that format to set is copied to over to CSI pad format
> > +      */
> > +     __format =3D __xcsi2rxss_get_pad_format(xcsi2rxss, cfg,
> > +                                           fmt->pad, fmt->which);
> > +
> > +     if (fmt->pad =3D=3D XVIP_PAD_SOURCE) {
> > +             fmt->format =3D *__format;
> > +             mutex_unlock(&xcsi2rxss->lock);
> > +             return 0;
> > +     }
> > +
> > +     /*
> > +      * RAW8 is supported in all datatypes. So if requested media bus =
format
> > +      * is of RAW8 type, then allow to be set. In case core is configu=
red to
> > +      * other RAW, YUV422 8/10 or RGB888, set appropriate media bus
> format.
> > +      */
> > +     if ((fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR8_1X8 ||
> > +          fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG8_1X8 ||
> > +          fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG8_1X8 ||
> > +          fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB8_1X8) ||
> > +         (core->datatype =3D=3D XCSI_DT_RAW10 &&
> > +          (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR10_1X10 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG10_1X10 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG10_1X10 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB10_1X10)) ||
> > +         (core->datatype =3D=3D XCSI_DT_RAW12 &&
> > +          (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR12_1X12 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG12_1X12 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG12_1X12 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB12_1X12)) ||
> > +         (core->datatype =3D=3D XCSI_DT_RAW14 &&
> > +          (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR14_1X14 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG14_1X14 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG14_1X14 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB14_1X14)) ||
> > +         (core->datatype =3D=3D XCSI_DT_RAW16 &&
> > +          (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR16_1X16 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG16_1X16 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG16_1X16 ||
> > +           fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB16_1X16)) ||
> > +         (core->datatype =3D=3D XCSI_DT_YUV4228B &&
> > +          fmt->format.code =3D=3D MEDIA_BUS_FMT_UYVY8_1X16) ||
> > +         (core->datatype =3D=3D XCSI_DT_YUV42210B &&
> > +          fmt->format.code =3D=3D MEDIA_BUS_FMT_UYVY10_1X20) ||
> > +         (core->datatype =3D=3D XCSI_DT_RGB888 &&
> > +          fmt->format.code =3D=3D MEDIA_BUS_FMT_RBG888_1X24)) {
> > +             /* Copy over the format to be set */
> > +             *__format =3D fmt->format;
> > +     } else {
> > +             /* Restore the original pad format code */
> > +             dev_dbg(core->dev, "Unsupported media bus format");
> > +             fmt->format.code =3D __format->code;
> > +             *__format =3D fmt->format;
>=20
> You can do the assignment outside the conditional expression.
>=20

Ok I will take care of this in next version.

> > +     }
> > +
> > +     mutex_unlock(&xcsi2rxss->lock);
> > +
> > +     return 0;
> > +}
> > +
> > +/*
> > + * xcsi2rxss_enum_mbus_code - Handle pixel format enumeration
> > + * @sd : pointer to v4l2 subdev structure
> > + * @cfg: V4L2 subdev pad configuration
> > + * @code : pointer to v4l2_subdev_mbus_code_enum structure
> > + *
> > + * Return: -EINVAL or zero on success
> > + */
> > +int xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
> > +                          struct v4l2_subdev_pad_config *cfg,
> > +                          struct v4l2_subdev_mbus_code_enum *code)
> > +{
> > +     struct xcsi2rxss_state *state =3D to_xcsi2rxssstate(sd);
> > +
> > +     if (code->pad >=3D XCSI_MEDIA_PADS ||
>=20
> The pad is already checked by the IOCTL handler. Please remove it from
> here.
>=20

Ok. I will remove it in next version.

> > +         code->index > state->mbus_fmts_count)
> > +             return -EINVAL;
> > +
> > +     code->code =3D state->mbus_fmts[code->index];
> > +
> > +     return 0;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_open - Called on v4l2_open()
> > + * @sd: Pointer to V4L2 sub device structure
> > + * @fh: Pointer to V4L2 File handle
> > + *
> > + * This function is called on v4l2_open(). It sets the default format
> > + * for both pads.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xcsi2rxss_open(struct v4l2_subdev *sd,
> > +                       struct v4l2_subdev_fh *fh)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +     struct v4l2_mbus_framefmt *format;
> > +     unsigned int i;
> > +
> > +     for (i =3D 0; i < XCSI_MEDIA_PADS; i++) {
> > +             format =3D v4l2_subdev_get_try_format(sd, fh->pad, i);
> > +             *format =3D xcsi2rxss->default_format;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +/* -------------------------------------------------------------------=
----------
> > + * Media Operations
> > + */
> > +
> > +static const struct media_entity_operations xcsi2rxss_media_ops =3D {
> > +     .link_validate =3D v4l2_subdev_link_validate
> > +};
> > +
> > +static const struct v4l2_ctrl_ops xcsi2rxss_ctrl_ops =3D {
> > +     .s_ctrl =3D xcsi2rxss_s_ctrl
> > +};
> > +
> > +static struct v4l2_ctrl_config xcsi2rxss_ctrls[] =3D {
> > +     {
> > +             .ops    =3D &xcsi2rxss_ctrl_ops,
> > +             .id     =3D V4L2_CID_XILINX_CSI2RX_ACT_LANES,
> > +             .name   =3D "Active Lanes",
> > +             .type   =3D V4L2_CTRL_TYPE_INTEGER,
> > +             .min    =3D 1,
> > +             .max    =3D 4,
> > +             .step   =3D 1,
> > +             .def    =3D 1,
> > +     }, {
> > +             .ops    =3D &xcsi2rxss_ctrl_ops,
> > +             .id     =3D V4L2_CID_XILINX_CSI2RX_RESET_COUNTERS,
> > +             .name   =3D "Reset Counters",
> > +             .type   =3D V4L2_CTRL_TYPE_BUTTON,
> > +             .min    =3D 0,
> > +             .max    =3D 1,
> > +             .step   =3D 1,
> > +             .def    =3D 0,
> > +             .flags  =3D V4L2_CTRL_FLAG_WRITE_ONLY,
> > +     }
> > +};
> > +
> > +static const struct v4l2_subdev_core_ops xcsi2rxss_core_ops =3D {
> > +     .log_status =3D xcsi2rxss_log_status,
> > +     .subscribe_event =3D xcsi2rxss_subscribe_event,
> > +     .unsubscribe_event =3D xcsi2rxss_unsubscribe_event
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops xcsi2rxss_video_ops =3D {
> > +     .s_stream =3D xcsi2rxss_s_stream
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops xcsi2rxss_pad_ops =3D {
> > +     .get_fmt =3D xcsi2rxss_get_format,
> > +     .set_fmt =3D xcsi2rxss_set_format,
> > +     .enum_mbus_code =3D xcsi2rxss_enum_mbus_code,
> > +};
> > +
> > +static const struct v4l2_subdev_ops xcsi2rxss_ops =3D {
> > +     .core =3D &xcsi2rxss_core_ops,
> > +     .video =3D &xcsi2rxss_video_ops,
> > +     .pad =3D &xcsi2rxss_pad_ops
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops xcsi2rxss_internal_ops =
=3D {
> > +     .open =3D xcsi2rxss_open,
> > +};
> > +
> > +static void xcsi2rxss_set_default_format(struct xcsi2rxss_state *state=
)
> > +{
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +     memset(&state->default_format, 0, sizeof(state->default_format));
> > +
> > +     switch (core->datatype) {
> > +     case XCSI_DT_YUV4228B:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_UYVY8_1X16;
> > +             break;
> > +     case XCSI_DT_RGB888:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_RBG888_1X24;
> > +             break;
> > +     case XCSI_DT_YUV42210B:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_UYVY10_1X20;
> > +             break;
> > +     case XCSI_DT_RAW10:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_SRGGB10_1X10=
;
> > +             break;
> > +     case XCSI_DT_RAW12:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_SRGGB12_1X12=
;
> > +             break;
> > +     case XCSI_DT_RAW14:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_SRGGB14_1X14=
;
> > +             break;
> > +     case XCSI_DT_RAW16:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_SRGGB16_1X16=
;
> > +             break;
> > +     case XCSI_DT_RAW8:
> > +     case XCSI_DT_RGB444:
> > +     case XCSI_DT_RGB555:
> > +     case XCSI_DT_RGB565:
> > +     case XCSI_DT_RGB666:
> > +             state->default_format.code =3D MEDIA_BUS_FMT_SRGGB8_1X8;
> > +             break;
> > +     }
> > +
> > +     state->default_format.field =3D V4L2_FIELD_NONE;
> > +     state->default_format.colorspace =3D V4L2_COLORSPACE_SRGB;
> > +     state->default_format.width =3D XCSI_DEFAULT_WIDTH;
> > +     state->default_format.height =3D XCSI_DEFAULT_HEIGHT;
> > +
> > +     dev_dbg(core->dev, "default mediabus format =3D 0x%x",
> > +             state->default_format.code);
> > +}
> > +
> > +static void xcsi2rxss_init_mbus_fmts(struct xcsi2rxss_state *state)
> > +{
> > +     struct xcsi2rxss_core *core =3D &state->core;
> > +     u32 i =3D 0;
> > +
> > +     state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SRGGB8_1X8;
> > +     state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SBGGR8_1X8;
> > +     state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGRBG8_1X8;
> > +     state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGBRG8_1X8;
> > +
> > +     switch (core->datatype) {
> > +     case XCSI_DT_RAW10:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SRGGB10_1X10;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SBGGR10_1X10;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGRBG10_1X10;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGBRG10_1X10;
> > +             break;
> > +     case XCSI_DT_RAW12:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SRGGB12_1X12;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SBGGR12_1X12;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGRBG12_1X12;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGBRG12_1X12;
> > +             break;
> > +     case XCSI_DT_RAW14:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SRGGB14_1X14;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SBGGR14_1X14;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGRBG14_1X14;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGBRG14_1X14;
> > +             break;
> > +     case XCSI_DT_RAW16:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SRGGB16_1X16;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SBGGR16_1X16;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGRBG16_1X16;
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_SGBRG16_1X16;
> > +             break;
> > +     case XCSI_DT_YUV4228B:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_UYVY8_1X16;
> > +             break;
> > +     case XCSI_DT_RGB888:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_RBG888_1X24;
> > +             break;
> > +     case XCSI_DT_YUV42210B:
> > +             state->mbus_fmts[i++] =3D MEDIA_BUS_FMT_UYVY10_1X20;
> > +             break;
>=20
> This is only used for mbus format enumeration. Could you instead construc=
t
> the enumeration on fly based on the data type?
>=20
> Alternatively, it'd be good to have something here to avoid proceeding pa=
st
> the end of the array (although that doesn't currently happen).
>=20

I will add a check to throw an error in case array out of bounds access occ=
urs.

> > +     }
> > +
> > +     state->mbus_fmts_count =3D i;
> > +}
> > +
> > +static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss)
> > +{
> > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +     struct device_node *node =3D xcsi2rxss->core.dev->of_node;
> > +     struct device_node *ports =3D NULL;
> > +     struct device_node *port =3D NULL;
> > +     unsigned int nports, irq;
> > +     bool en_csi_v20, vfb;
> > +     int ret;
> > +
> > +     en_csi_v20 =3D of_property_read_bool(node, "xlnx,en-csi-v2-0");
> > +     if (en_csi_v20)
> > +             core->en_vcx =3D of_property_read_bool(node, "xlnx,en-vcx=
");
> > +
> > +     core->enable_active_lanes =3D
> > +             of_property_read_bool(node, "xlnx,en-active-lanes");
> > +
> > +     ret =3D of_property_read_u32(node, "xlnx,csi-pxl-format",
> > +                                &core->datatype);
> > +     if (ret < 0) {
> > +             dev_err(core->dev, "missing xlnx,csi-pxl-format property\=
n");
> > +             return ret;
> > +     }
> > +
> > +     switch (core->datatype) {
> > +     case XCSI_DT_YUV4228B:
> > +     case XCSI_DT_RGB444:
> > +     case XCSI_DT_RGB555:
> > +     case XCSI_DT_RGB565:
> > +     case XCSI_DT_RGB666:
> > +     case XCSI_DT_RGB888:
> > +     case XCSI_DT_RAW6:
> > +     case XCSI_DT_RAW7:
> > +     case XCSI_DT_RAW8:
> > +     case XCSI_DT_RAW10:
> > +     case XCSI_DT_RAW12:
> > +     case XCSI_DT_RAW14:
> > +             break;
> > +     case XCSI_DT_YUV42210B:
> > +     case XCSI_DT_RAW16:
> > +     case XCSI_DT_RAW20:
> > +             if (!en_csi_v20) {
> > +                     ret =3D -EINVAL;
> > +                     dev_dbg(core->dev, "enable csi v2 for this pixel =
format");
> > +             }
> > +             break;
> > +     default:
> > +             ret =3D -EINVAL;
> > +     }
> > +     if (ret < 0) {
> > +             dev_err(core->dev, "invalid csi-pxl-format property!\n");
> > +             return ret;
> > +     }
> > +
> > +     vfb =3D of_property_read_bool(node, "xlnx,vfb");
> > +     if (!vfb) {
> > +             dev_err(core->dev, "failed as VFB is disabled!\n");
> > +             return -EINVAL;
> > +     }
> > +
> > +     ports =3D of_get_child_by_name(node, "ports");
> > +     if (!ports)
> > +             ports =3D node;
> > +
> > +     nports =3D 0;
> > +     for_each_child_of_node(ports, port) {
> > +             struct device_node *endpoint;
> > +             struct v4l2_fwnode_endpoint v4lendpoint;
> > +             int ret;
> > +
> > +             if (!port->name || of_node_cmp(port->name, "port"))
> > +                     continue;
> > +
> > +             endpoint =3D of_get_next_child(port, NULL);
> > +             if (!endpoint) {
> > +                     dev_err(core->dev, "No port at\n");
> > +                     return -EINVAL;
> > +             }
> > +
> > +             /*
> > +              * since first port is sink port and it contains
> > +              * all info about data-lanes and cfa-pattern,
> > +              * don't parse second port but only check if exists
> > +              */
> > +             if (nports =3D=3D XVIP_PAD_SOURCE) {
> > +                     dev_dbg(core->dev, "no need to parse source port"=
);
> > +                     nports++;
> > +                     of_node_put(endpoint);
> > +                     continue;
> > +             }
> > +
> > +             ret =3D v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpo=
int),
> > +                                              &v4lendpoint);
> > +             of_node_put(endpoint);
> > +             if (ret)
> > +                     return ret;
> > +
> > +             dev_dbg(core->dev, "%s : port %d bus type =3D %d\n",
> > +                     __func__, nports, v4lendpoint.bus_type);
> > +
> > +             if (v4lendpoint.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
> > +                     dev_dbg(core->dev, "%s : base.port =3D %d base.id=
 =3D %d\n",
> > +                             __func__, v4lendpoint.base.port,
> > +                             v4lendpoint.base.id);
> > +
> > +                     dev_dbg(core->dev, "%s : mipi number lanes =3D %d=
\n",
> > +                             __func__,
> > +                             v4lendpoint.bus.mipi_csi2.num_data_lanes)=
;
> > +
> > +                     core->max_num_lanes =3D
> > +                             v4lendpoint.bus.mipi_csi2.num_data_lanes;
> > +             }
> > +
> > +             /* Count the number of ports. */
> > +             nports++;
> > +     }
> > +
> > +     if (nports !=3D XCSI_MEDIA_PADS) {
> > +             dev_err(core->dev, "invalid number of ports %u\n", nports=
);
> > +             return -EINVAL;
> > +     }
> > +
> > +     /* Register interrupt handler */
> > +     irq =3D irq_of_parse_and_map(node, 0);
> > +     ret =3D devm_request_irq(core->dev, irq, xcsi2rxss_irq_handler,
> > +                            IRQF_SHARED, "xilinx-csi2rxss", xcsi2rxss)=
;
> > +     if (ret) {
> > +             dev_err(core->dev, "Err =3D %d Interrupt handler reg fail=
ed!\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     xcsi2rxss_log_ipconfig(xcsi2rxss);
> > +
> > +     return 0;
> > +}
> > +
> > +static int xcsi2rxss_probe(struct platform_device *pdev)
> > +{
> > +     struct v4l2_subdev *subdev;
> > +     struct xcsi2rxss_state *xcsi2rxss;
> > +     struct xcsi2rxss_core *core;
> > +     struct resource *res;
> > +     int ret, num_ctrls, i;
> > +
> > +     xcsi2rxss =3D devm_kzalloc(&pdev->dev, sizeof(*xcsi2rxss), GFP_KE=
RNEL);
> > +     if (!xcsi2rxss)
> > +             return -ENOMEM;
> > +
> > +     core =3D &xcsi2rxss->core;
> > +     core->dev =3D &pdev->dev;
> > +
> > +     core->clks =3D devm_kmemdup(core->dev, xcsi2rxss_clks,
> > +                               sizeof(xcsi2rxss_clks), GFP_KERNEL);
> > +     if (!core->clks)
> > +             return -ENOMEM;
> > +
> > +     /* Reset GPIO */
> > +     core->rst_gpio =3D devm_gpiod_get_optional(core->dev, "reset",
> > +                                              GPIOD_OUT_HIGH);
> > +     if (IS_ERR(core->rst_gpio)) {
> > +             if (PTR_ERR(core->rst_gpio) !=3D -EPROBE_DEFER)
> > +                     dev_err(core->dev, "Video Reset GPIO not setup in=
 DT");
> > +             return PTR_ERR(core->rst_gpio);
> > +     }
> > +
> > +     mutex_init(&xcsi2rxss->lock);
> > +
> > +     ret =3D xcsi2rxss_parse_of(xcsi2rxss);
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +     core->iomem =3D devm_ioremap_resource(core->dev, res);
> > +     if (IS_ERR(core->iomem))
> > +             return PTR_ERR(core->iomem);
> > +
> > +     core->num_clks =3D ARRAY_SIZE(xcsi2rxss_clks);
> > +
> > +     ret =3D clk_bulk_get(core->dev, core->num_clks, core->clks);
> > +     if (ret)
> > +             return ret;
> > +
> > +     ret =3D clk_bulk_prepare_enable(core->num_clks, core->clks);
> > +     if (ret)
> > +             goto err_clk_put;
> > +
> > +     if (xcsi2rxss->core.rst_gpio) {
> > +             gpiod_set_value_cansleep(xcsi2rxss->core.rst_gpio, 1);
> > +             /* minimum of 40 dphy_clk_200M cycles */
> > +             usleep_range(1, 2);
> > +             gpiod_set_value_cansleep(xcsi2rxss->core.rst_gpio, 0);
> > +     }
> > +
> > +     xcsi2rxss_reset(core);
> > +
> > +     core->events =3D devm_kzalloc(&pdev->dev, sizeof(xcsi2rxss_events=
),
> > +                                 GFP_KERNEL);
> > +     for (i =3D 0; i < XCSI_NUM_EVENTS; i++) {
> > +             core->events[i].name =3D xcsi2rxss_events[i].name;
> > +             core->events[i].mask =3D xcsi2rxss_events[i].mask;
> > +     }
> > +
> > +     if (core->en_vcx) {
> > +             u32 alloc_size;
> > +
> > +             alloc_size =3D sizeof(struct xcsi2rxss_event) *
> > +                          XCSI_VCX_NUM_EVENTS;
> > +             core->vcx_events =3D devm_kzalloc(&pdev->dev, alloc_size,
> > +                                             GFP_KERNEL);
> > +             if (!core->vcx_events) {
> > +                     mutex_destroy(&xcsi2rxss->lock);
> > +                     ret =3D -ENOMEM;
> > +                     goto err_clk_disable;
> > +             }
> > +
> > +             for (i =3D 0; i < XCSI_VCX_NUM_EVENTS; i++)
> > +                     core->vcx_events[i].mask =3D 1 << i;
> > +     }
> > +
> > +     /* Initialize V4L2 subdevice and media entity */
> > +     xcsi2rxss->pads[XVIP_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> > +     xcsi2rxss->pads[XVIP_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +     /* Initialize the default format */
> > +     xcsi2rxss_set_default_format(xcsi2rxss);
> > +
> > +     /* Initialize the mbus formats supported */
> > +     xcsi2rxss_init_mbus_fmts(xcsi2rxss);
> > +
> > +     /* Initialize V4L2 subdevice and media entity */
> > +     subdev =3D &xcsi2rxss->subdev;
> > +     v4l2_subdev_init(subdev, &xcsi2rxss_ops);
> > +     subdev->dev =3D &pdev->dev;
> > +     subdev->internal_ops =3D &xcsi2rxss_internal_ops;
> > +     strscpy(subdev->name, dev_name(&pdev->dev), sizeof(subdev->name))=
;
> > +     subdev->flags |=3D V4L2_SUBDEV_FL_HAS_EVENTS |
> V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +     subdev->entity.ops =3D &xcsi2rxss_media_ops;
> > +     v4l2_set_subdevdata(subdev, xcsi2rxss);
> > +
> > +     ret =3D media_entity_pads_init(&subdev->entity, XCSI_MEDIA_PADS,
> > +                                  xcsi2rxss->pads);
> > +     if (ret < 0)
> > +             goto error;
> > +
> > +     /*
> > +      * In case the Enable Active Lanes config parameter is not set,
> > +      * dynamic lane reconfiguration is not allowed.
> > +      * So V4L2_CID_XILINX_CSI2RX_ACT_LANES ctrl will not be registere=
d.
> > +      * Accordingly allocate the number of controls
> > +      */
> > +     num_ctrls =3D ARRAY_SIZE(xcsi2rxss_ctrls);
> > +
> > +     if (!core->enable_active_lanes)
> > +             num_ctrls--;
> > +
> > +     v4l2_ctrl_handler_init(&xcsi2rxss->ctrl_handler, num_ctrls);
> > +     for (i =3D 0; i < ARRAY_SIZE(xcsi2rxss_ctrls); i++) {
> > +             struct v4l2_ctrl *ctrl;
> > +
> > +             if (xcsi2rxss_ctrls[i].id =3D=3D
> > +                     V4L2_CID_XILINX_CSI2RX_ACT_LANES) {
> > +                     if (!core->enable_active_lanes) {
> > +                             /* Don't register control */
> > +                             dev_dbg(core->dev,
> > +                                     "Skip active lane control\n");
> > +                             continue;
> > +                     }
> > +                     xcsi2rxss_ctrls[i].max =3D core->max_num_lanes;
> > +                     xcsi2rxss_ctrls[i].def =3D core->max_num_lanes;
> > +             }
> > +
> > +             dev_dbg(core->dev, "%d ctrl =3D 0x%x\n", i,
> > +                     xcsi2rxss_ctrls[i].id);
> > +             ctrl =3D v4l2_ctrl_new_custom(&xcsi2rxss->ctrl_handler,
> > +                                         &xcsi2rxss_ctrls[i], NULL);
> > +             if (!ctrl) {
> > +                     dev_err(core->dev, "Failed for %s ctrl\n",
> > +                             xcsi2rxss_ctrls[i].name);
> > +                     goto error;
> > +             }
> > +     }
> > +
> > +     if (xcsi2rxss->ctrl_handler.error) {
> > +             dev_err(core->dev, "failed to add controls\n");
> > +             ret =3D xcsi2rxss->ctrl_handler.error;
> > +             goto error;
> > +     }
> > +
> > +     subdev->ctrl_handler =3D &xcsi2rxss->ctrl_handler;
> > +     ret =3D v4l2_ctrl_handler_setup(&xcsi2rxss->ctrl_handler);
> > +     if (ret < 0) {
> > +             dev_err(core->dev, "failed to set controls\n");
> > +             goto error;
> > +     }
> > +
> > +     platform_set_drvdata(pdev, xcsi2rxss);
> > +
> > +     ret =3D v4l2_async_register_subdev(subdev);
> > +     if (ret < 0) {
> > +             dev_err(core->dev, "failed to register subdev\n");
> > +             goto error;
> > +     }
> > +
> > +     dev_info(core->dev, "Xilinx CSI2 Rx Subsystem device found!\n");
> > +
> > +     return 0;
> > +error:
> > +     v4l2_ctrl_handler_free(&xcsi2rxss->ctrl_handler);
> > +     media_entity_cleanup(&subdev->entity);
> > +     mutex_destroy(&xcsi2rxss->lock);
> > +err_clk_disable:
> > +     clk_bulk_disable_unprepare(core->num_clks, core->clks);
> > +err_clk_put:
> > +     clk_bulk_put(core->num_clks, core->clks);
> > +     return ret;
> > +}
> > +
> > +static int xcsi2rxss_remove(struct platform_device *pdev)
> > +{
> > +     struct xcsi2rxss_state *xcsi2rxss =3D platform_get_drvdata(pdev);
> > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +     struct v4l2_subdev *subdev =3D &xcsi2rxss->subdev;
> > +
> > +     v4l2_async_unregister_subdev(subdev);
> > +     v4l2_ctrl_handler_free(&xcsi2rxss->ctrl_handler);
> > +     media_entity_cleanup(&subdev->entity);
> > +     mutex_destroy(&xcsi2rxss->lock);
> > +     clk_bulk_disable_unprepare(core->num_clks, core->clks);
> > +     clk_bulk_put(core->num_clks, core->clks);
> > +
> > +     return 0;
> > +}
> > +
> > +static const struct of_device_id xcsi2rxss_of_id_table[] =3D {
> > +     { .compatible =3D "xlnx,mipi-csi2-rx-subsystem-4.0",},
>=20
> Space before closing parenthesis.
>=20

I will fix this in next version.=20

> > +     { }
> > +};
> > +MODULE_DEVICE_TABLE(of, xcsi2rxss_of_id_table);
> > +
> > +static struct platform_driver xcsi2rxss_driver =3D {
> > +     .driver =3D {
> > +             .name           =3D "xilinx-csi2rxss",
> > +             .of_match_table =3D xcsi2rxss_of_id_table,
> > +     },
> > +     .probe                  =3D xcsi2rxss_probe,
> > +     .remove                 =3D xcsi2rxss_remove,
> > +};
> > +
> > +module_platform_driver(xcsi2rxss_driver);
> > +
> > +MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
> > +MODULE_DESCRIPTION("Xilinx MIPI CSI2 Rx Subsystem Driver");
> > +MODULE_LICENSE("GPL v2");
> > diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4=
l2-
> controls.h
> > index a2669b7..98074f2 100644
> > --- a/include/uapi/linux/v4l2-controls.h
> > +++ b/include/uapi/linux/v4l2-controls.h
> > @@ -192,6 +192,10 @@ enum v4l2_colorfx {
> >   * We reserve 16 controls for this driver. */
> >  #define V4L2_CID_USER_IMX_BASE                       (V4L2_CID_USER_BA=
SE +
> 0x10b0)
> >
> > +/* The base for the Xilinx MIPI CSI2 Rx Subsystem driver controls.
> > + * We reserve 16 controls for this driver. */
> > +#define V4L2_CID_XILINX_CSI2RX_BASE          (V4L2_CID_USER_BASE +
> 0x10c0)
> > +
> >  /* MPEG-class control IDs */
> >  /* The MPEG controls are applicable to all codec controls
> >   * and the 'MPEG' part of the define is historical */
> > diff --git a/include/uapi/linux/xilinx-csi2rxss.h b/include/uapi/linux/=
xilinx-
> csi2rxss.h
> > new file mode 100644
> > index 0000000..79e2797
> > --- /dev/null
> > +++ b/include/uapi/linux/xilinx-csi2rxss.h
> > @@ -0,0 +1,52 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * Xilinx MIPI CSI2 Rx Subsystem events and controls
> > + *
> > + * Copyright (C) 2019 Xilinx, Inc.
> > + *
> > + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> > + *
> > + */
> > +
> > +#ifndef __XILINX_CSI2RXSS_H__
> > +#define __XILINX_CSI2RXSS_H__
> > +
> > +#include <linux/v4l2-controls.h>
> > +#include <linux/videodev2.h>
> > +
> > +/* Xilinx MIPI CSI2 Rx Subsystem controls */
> > +
> > +/* Active Lanes
> > + *
> > + * This control is used to dynamically set the number of active lanes.
> > + * This is present only when the "Enable Active Lanes" is set in desig=
n.
> > + * It should be called when IP is not streaming.
> > + */
> > +#define V4L2_CID_XILINX_CSI2RX_ACT_LANES
> (V4L2_CID_XILINX_CSI2RX_BASE + 1)
> > +
> > +/* Reset all event counters
> > + *
> > + * The driver has counters to keep a track of different events. These =
counters
> > + * can be printed using the log_status. This control is used to reset =
these
> > + * counters.
> > + */
> > +#define V4L2_CID_XILINX_CSI2RX_RESET_COUNTERS
> (V4L2_CID_XILINX_CSI2RX_BASE + 2)
> > +
> > +/* Xilinx MIPI CSI2 Rx Subsystem events */
> > +
> > +/* Base class */
> > +#define V4L2_EVENT_XILINX_CSI2RX_CLASS
> (V4L2_EVENT_PRIVATE_START | 0x200)
> > +
> > +/* Stream Line Buffer full event
> > + *
> > + * This event occurs when the MIPI CSI2 Rx Subsystem's line buffer is =
full.
> > + * This occurs because of back pressure from some downstream IP i.e.
> > + * the downstream IP isn't ready to accept data. This is usually due t=
o some
> > + * system design issue.
> > + *
> > + * When this event occurs, application may stop streaming, inform the =
user
> > + * about the issue and exit.
> > + */
> > +#define V4L2_EVENT_XILINX_CSI2RX_SLBF
> (V4L2_EVENT_XILINX_CSI2RX_CLASS | 0x1)
> > +
> > +#endif /* __XILINX_CSI2RXSS_H__ */
>=20
> --
> Regards,
>=20
> Sakari Ailus

Regards
Vishal Sagar
