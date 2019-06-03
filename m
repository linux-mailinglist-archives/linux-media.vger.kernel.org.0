Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BB0F532D06
	for <lists+linux-media@lfdr.de>; Mon,  3 Jun 2019 11:40:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727421AbfFCJkG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 3 Jun 2019 05:40:06 -0400
Received: from mail-eopbgr800080.outbound.protection.outlook.com ([40.107.80.80]:3108
        "EHLO NAM03-DM3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726341AbfFCJkG (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 3 Jun 2019 05:40:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g3xVghtUpX1mhTaDQja477SabT74htDt1XPin70ZS6M=;
 b=u47ir6BVjpLGg0AIG/tog9keJjLhpT4+LfwY9wdedM1QiIX7QuaGLkK53wGlWGE+cHKULKtbqNihhJccTXvjtNvc+vxJ7yhqZleJ3qJqoVqAQoU9sOZ+AxmZGj0/Euaku96moJPyGqebJ6UAQBWI0IzAvNogDPLLGnXICFokilo=
Received: from CH2PR02MB6088.namprd02.prod.outlook.com (52.132.228.94) by
 CH2PR02MB6101.namprd02.prod.outlook.com (52.132.228.155) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1943.18; Mon, 3 Jun 2019 09:40:00 +0000
Received: from CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::3cca:e795:ebe2:b366]) by CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::3cca:e795:ebe2:b366%6]) with mapi id 15.20.1943.018; Mon, 3 Jun 2019
 09:40:00 +0000
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
        Luca Ceresoli <luca@lucaceresoli.net>
Subject: RE: [PATCH v7 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Topic: [PATCH v7 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Index: AQHU2ll5hXMlh9sgmEWvEs930MmUZ6YX3EIAgHJL8cA=
Date:   Mon, 3 Jun 2019 09:39:59 +0000
Message-ID: <CH2PR02MB6088E29E6F2C41A97779E127A7140@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1552562691-14445-1-git-send-email-vishal.sagar@xilinx.com>
 <1552562691-14445-3-git-send-email-vishal.sagar@xilinx.com>
 <20190322160115.4sket6kvo5aj3dds@paasikivi.fi.intel.com>
In-Reply-To: <20190322160115.4sket6kvo5aj3dds@paasikivi.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 1897ec31-900e-409f-fb0f-08d6e8077264
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:CH2PR02MB6101;
x-ms-traffictypediagnostic: CH2PR02MB6101:
x-microsoft-antispam-prvs: <CH2PR02MB6101BA308AFDD63D1A71D3D7A7140@CH2PR02MB6101.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0057EE387C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(396003)(376002)(366004)(39860400002)(136003)(346002)(13464003)(51914003)(189003)(199004)(229853002)(305945005)(3846002)(6436002)(8936002)(6116002)(68736007)(74316002)(81156014)(486006)(11346002)(446003)(7416002)(8676002)(81166006)(5660300002)(76116006)(476003)(2906002)(73956011)(66476007)(64756008)(186003)(66446008)(7736002)(9686003)(6636002)(52536014)(55016002)(66556008)(86362001)(33656002)(66066001)(76176011)(14454004)(478600001)(14444005)(256004)(66946007)(110136005)(4326008)(54906003)(7696005)(71190400001)(71200400001)(99286004)(102836004)(316002)(6246003)(53546011)(25786009)(26005)(6506007)(53936002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6101;H:CH2PR02MB6088.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: IeIy6GjGIyCXz9YzsHi13KTYNB7bdpKnw1IJriPYdXngpBEWsZrUJsRARx4SlDGiK7BTlDMr15wjrB2+xIreb19Loz/tk9m7c3LAIB1zvlQ0gDk6hciskP261SChvwi/uxcs062Q/dM+oq+DdrV8B6y1MjEzKGDOgi96zZhevO6wF5HjbipDgoXo7xz8whlcesA9VSAUeoFA8HiUUkARm/J5uWYMr8pV+zGPYnFeySzxvUICanaU3kZTv05zcA/0hYLyyIK1xTZq5QdrxJtrEJQJRyOD7NyYuz5+FXfC1GXctl+RHeYaykwhEXU8w2PNuSr4zK9FGxShq9e2Nm6MnrEG11cMHveJh0ArD3W+d8y6we3foz93DtQLQmTwFp/sFN4yNAe0g2IuymxE2XDAIuRNYeeR9sW2KbOaD9+xRAk=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1897ec31-900e-409f-fb0f-08d6e8077264
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jun 2019 09:40:00.0289
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vsagar@xilinx.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6101
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the review.=20

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus@linux.intel.com]
> Sent: Friday, March 22, 2019 9:31 PM
> To: Vishal Sagar <vishal.sagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com; Michal
> Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>
> Subject: Re: [PATCH v7 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
> Subsystem driver
>=20
> EXTERNAL EMAIL
>=20
> Hi Vishal,
>=20
> On Thu, Mar 14, 2019 at 04:54:51PM +0530, Vishal Sagar wrote:
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
> > The generic short packets received are notified to application via
> > v4l2_events.
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
> >  drivers/media/platform/xilinx/Kconfig           |   10 +
> >  drivers/media/platform/xilinx/Makefile          |    1 +
> >  drivers/media/platform/xilinx/xilinx-csi2rxss.c | 1465
> +++++++++++++++++++++++
> >  include/uapi/linux/xilinx-v4l2-controls.h       |   14 +
> >  include/uapi/linux/xilinx-v4l2-events.h         |   25 +
> >  5 files changed, 1515 insertions(+)
> >  create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
> >  create mode 100644 include/uapi/linux/xilinx-v4l2-events.h
> >
> > diff --git a/drivers/media/platform/xilinx/Kconfig
> b/drivers/media/platform/xilinx/Kconfig
> > index 74ec8aa..30b4a25 100644
> > --- a/drivers/media/platform/xilinx/Kconfig
> > +++ b/drivers/media/platform/xilinx/Kconfig
> > @@ -10,6 +10,16 @@ config VIDEO_XILINX
> >
> >  if VIDEO_XILINX
> >

<snip>

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
> > +     case V4L2_EVENT_XLNXCSIRX_SPKT:
> > +     case V4L2_EVENT_XLNXCSIRX_SPKT_OVF:
> > +     case V4L2_EVENT_XLNXCSIRX_SLBF:
> > +             ret =3D v4l2_event_subscribe(fh, sub, XCSI_MAX_SPKT_EVENT=
, NULL);
>=20
> What's your use case for notifying the user about the short packets?

I don't have a use case.
My motivation was that v4l2 events would be a good way to notify and share =
short packet with application.

> Generally these are control messages of some kind that do not need handli=
ng
> by the user.
>=20
> If it's just debugging, you could print them using dev_dbg().
>=20
> Same for the frame counter.
>=20

Ok. I will be removing these in the next version.

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

<snip>

> > +static struct v4l2_mbus_framefmt *
> > +__xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
> > +                        struct v4l2_subdev_pad_config *cfg,
> > +                        unsigned int pad, u32 which)
> > +{
> > +     switch (which) {
> > +     case V4L2_SUBDEV_FORMAT_TRY:
> > +             return v4l2_subdev_get_try_format(&xcsi2rxss->subdev, cfg=
,
> > +                                               pad);
>=20
> Fits on a single line.
>=20

Agree. I will fix this in next version.

> > +     case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +             return &xcsi2rxss->format;
> > +     default:
> > +             return NULL;
> > +     }
> > +}
> > +
> > +/**

<snip>

> > +static int xcsi2rxss_clk_get(struct xcsi2rxss_core *core)
> > +{
> > +     int ret;
> > +
> > +     core->lite_aclk =3D devm_clk_get(core->dev, "lite_aclk");
> > +     if (IS_ERR(core->lite_aclk)) {
> > +             ret =3D PTR_ERR(core->lite_aclk);
> > +             dev_err(core->dev, "failed to get lite_aclk (%d)\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     core->video_aclk =3D devm_clk_get(core->dev, "video_aclk");
> > +     if (IS_ERR(core->video_aclk)) {
> > +             ret =3D PTR_ERR(core->video_aclk);
> > +             dev_err(core->dev, "failed to get video_aclk (%d)\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static int xcsi2rxss_clk_enable(struct xcsi2rxss_core *core)
> > +{
> > +     int ret;
> > +
> > +     ret =3D clk_prepare_enable(core->lite_aclk);
> > +     if (ret) {
> > +             dev_err(core->dev, "failed enabling lite_aclk (%d)\n",
> > +                     ret);
> > +             return ret;
> > +     }
> > +
> > +     ret =3D clk_prepare_enable(core->video_aclk);
> > +     if (ret) {
> > +             dev_err(core->dev, "failed enabling video_aclk (%d)\n",
> > +                     ret);
> > +             clk_disable_unprepare(core->lite_aclk);
> > +             return ret;
> > +     }
> > +
>=20
> Could you use the *_clk_bulk_* APIs instead in the two functions? Below,
> too.
>=20

Ok. I will fix this in next version.

> > +     return ret;
> > +}
> > +
> > +static void xcsi2rxss_clk_disable(struct xcsi2rxss_core *core)
> > +{
> > +     clk_disable_unprepare(core->video_aclk);
> > +     clk_disable_unprepare(core->lite_aclk);
> > +}
> > +

<snip>

> > +/* Short packet FIFO overflow */
> > +#define V4L2_EVENT_XLNXCSIRX_SPKT_OVF
> (V4L2_EVENT_XLNXCSIRX_CLASS | 0x2)
> > +/* Stream Line Buffer full */
> > +#define V4L2_EVENT_XLNXCSIRX_SLBF    (V4L2_EVENT_XLNXCSIRX_CLASS |
> 0x3)
> > +
> > +#endif /* __UAPI_XILINX_V4L2_EVENTS_H__ */
>=20
> --
> Regards,
>=20
> Sakari Ailus
> sakari.ailus@linux.intel.com


Regards
Vishal Sagar
