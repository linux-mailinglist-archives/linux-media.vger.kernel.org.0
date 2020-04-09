Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 04DAE1A3A98
	for <lists+linux-media@lfdr.de>; Thu,  9 Apr 2020 21:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726839AbgDITel (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Apr 2020 15:34:41 -0400
Received: from mail-dm6nam10on2053.outbound.protection.outlook.com ([40.107.93.53]:6079
        "EHLO NAM10-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725987AbgDITek (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 9 Apr 2020 15:34:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CH7XTCn99Plnt8MQMTIc3KoCn8hCQ1fI8sYJPUDEt3pvrCRmOCI1lxxNhiCKJR5FHwT9uviChTNw4I52zTlQwM81Yb30UZHBrhMW2ircfxsegHnON/v+G7O91OjM57yMSA7LiPFlwY9snuBVEwN0XIMvkt+SYiIgZn3DcSR9Ca6PHZSnT7A+lSUun2TteisPb80kqNaLRk4tY/joztRlG0wpVgFvtFmvl/sWLHIHztcg7zY9tlkM1FVzDMvF8JEHneXleSpYbWj3DFkFlcTdPCnWsGItUn1C7IX5wn2697lfYK0yKGuN1rpCcvDSwCP0K72aU8Qmcib0ReR1L/agDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN36Qkz1/igBiSAUkJ5LYehZN3bK4sjzpO7s4jzqS5o=;
 b=MTxuhsYbls+wOt27bBFBzF3NG+BbHJuKESq/xOcUXCPr1ADVUv321OsfQkreIRyN4ZBTLd+2v7XuKb1hZTZBBCVZbS3KMzK6isrtNtkIeO0P+dElmKkOoaZJSRa+0FUBnCfCQE5Vl3QDCfYqERIf3A4yat6VzUHADQgToGF034QFg+M5bZjQvIbLyB5Vjt1Ll4p0F8f6tB6n54aJwFSp9QConpZ4naZwUgVxEHt/ImWtKEw/ZZJmh63geq6veRXt0VMGVa63bjwiNuCj9SSxdVMfHcTGZddpmHM8k50xTDO0JMq6+A+tpYmkXqIa8Jqfr2sf2tC9eEvT87A/5w3avA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xilinx.com; dmarc=pass action=none header.from=xilinx.com;
 dkim=pass header.d=xilinx.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vN36Qkz1/igBiSAUkJ5LYehZN3bK4sjzpO7s4jzqS5o=;
 b=erEmHL4l7HisWN9ta80om0v2wch6C5iNWuuPKcOWrgTkTdl2Qg3dwpUypYb6SuF5FE3HMUV86b1n+muXwSTUJCx9ljEXtojNaSSmfqbH0kR9O/9nAVYREkumkVZtjnhBu2Kd0CXVx3mZ0kCmBHtGcNZEMlTmilTjEDoZ4X3ntxQ=
Received: from BY5PR02MB6867.namprd02.prod.outlook.com (2603:10b6:a03:21c::9)
 by BY5PR02MB6724.namprd02.prod.outlook.com (2603:10b6:a03:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.2900.18; Thu, 9 Apr
 2020 19:34:14 +0000
Received: from BY5PR02MB6867.namprd02.prod.outlook.com
 ([fe80::3049:963a:2a0d:3bff]) by BY5PR02MB6867.namprd02.prod.outlook.com
 ([fe80::3049:963a:2a0d:3bff%5]) with mapi id 15.20.2878.023; Thu, 9 Apr 2020
 19:34:14 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
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
        Jacopo Mondi <jacopo@jmondi.org>, Hyun Kwon <hyunk@xilinx.com>
Subject: RE: [PATCH v10 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Topic: [PATCH v10 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Index: AQHVN8lXQ/fTOKOejUmwUaqoYbH8Xqb8mBIAgXZAy6A=
Date:   Thu, 9 Apr 2020 19:34:14 +0000
Message-ID: <BY5PR02MB68673EB4C3CBEBC24AA05343A7C10@BY5PR02MB6867.namprd02.prod.outlook.com>
References: <20190711091612.98175-1-vishal.sagar@xilinx.com>
 <20190711091612.98175-3-vishal.sagar@xilinx.com>
 <20190815160932.GB3504@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190815160932.GB3504@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.128]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0d6e5ec3-4965-4f18-19af-08d7dcbcfc93
x-ms-traffictypediagnostic: BY5PR02MB6724:|BY5PR02MB6724:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR02MB6724B226EDDEA2B5F1259C95A7C10@BY5PR02MB6724.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:331;
x-forefront-prvs: 0368E78B5B
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR02MB6867.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(10009020)(4636009)(376002)(396003)(39860400002)(366004)(136003)(346002)(6916009)(71200400001)(9686003)(8676002)(55016002)(2906002)(81156014)(76116006)(81166007)(186003)(26005)(33656002)(7416002)(5660300002)(64756008)(66446008)(4326008)(6506007)(53546011)(7696005)(66946007)(54906003)(8936002)(66556008)(66476007)(478600001)(30864003)(107886003)(316002)(86362001)(52536014)(579004)(559001);DIR:OUT;SFP:1101;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 36w7maWMxKBTdELRn4MKITNel4+zwScnqFkHMBOk2TiP1AfiNKiU2czXBlOTtmE9SgTlOrgNdYP5OuiRxwIKAFUSfaAWf1gJjiYJVpQ0PvRVba+C0Yl5imXzFLMq6E3bkkvbYjWXaCP3OfcIZKOsV2cNX3W7uJ3o1kGY7J0Mai9Z+46GRmyC63u0OiIAbv+Bxu7wZ0ZW+mu+48TqIhJoJeZfUw2xMbUjAdqjOJDNNpaNt3W5fAAOZXfUdbL6nJEa5QiA89d1XBqMQPeHbP9GjtOu9Xqp4eVrmY0KArKr2cbNF6upALt/3NAGkENo/HTPLSLJFJpG6nUWukqft/xiNGGuM6t3zZUgM3qTu80EfKzse/LntFQ4w/ZbJXIZ4I5djrflYte771GXRAU4ZnbRKJ/6yByhSHvIHOoaN659w6LFIaEB40puzujdFEcZRiAv
x-ms-exchange-antispam-messagedata: xvI0wgeQexD90mj9NSTVjeslYU0+MjqhA++E/95CRc0a529QdUmd4XlKLr3hLcl5ffDyenhHihJQaPVhf2WsdZNrDEQCzvA6U0yn5BuR4ST279aQoDzeiD4KQx9ZAFHKT2nK9R/AaPOu/s2mlvPIxQ==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d6e5ec3-4965-4f18-19af-08d7dcbcfc93
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Apr 2020 19:34:14.3823
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UReE4y8Bt0hO+uvkyFJ6LuzsuqxXqiEpTPk0aXm4it97Eu+eAwcmhw6bduwgjJ/g/nHW+3d1FoN44nRsdIxFYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6724
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for the review and apologies for the delayed response.

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@iki.fi>
> Sent: Thursday, August 15, 2019 9:40 PM
> To: Vishal Sagar <vsagar@xilinx.com>
> Cc: Hyun Kwon <hyunk@xilinx.com>; laurent.pinchart@ideasonboard.com;
> mchehab@kernel.org; robh+dt@kernel.org; mark.rutland@arm.com; Michal
> Simek <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>; Hyun Kwon
> <hyunk@xilinx.com>
> Subject: Re: [PATCH v10 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
> Subsystem driver
>=20
> Hi Vishal,
>=20
> Thanks for the update.
>=20
> On Thu, Jul 11, 2019 at 02:46:12PM +0530, Vishal Sagar wrote:
> > The Xilinx MIPI CSI-2 Rx Subsystem soft IP is used to capture images
> > from MIPI CSI-2 camera sensors and output AXI4-Stream video data ready
> > for image processing. Please refer to PG232 for details.
> >
> > The CSI2 Rx controller filters out all packets except for the packets
> > with data type fixed in hardware. RAW8 packets are always allowed to
> > pass through.
> >
> > It is also used to setup and handle interrupts and enable the core. It
> > logs all the events in respective counters between streaming on and off=
.
> >
> > The driver supports only the video format bridge enabled configuration.
> > Some data types like YUV 422 10bpc, RAW16, RAW20 are supported when
> > the CSI v2.0 feature is enabled in design. When the VCX feature is
> > enabled, the maximum number of virtual channels becomes 16 from 4.
> >
> > Signed-off-by: Vishal Sagar <vishal.sagar@xilinx.com>
> > Reviewed-by: Hyun Kwon <hyun.kwon@xilinx.com>
> > ---
> > v10
> > - Removed all V4L2 controls and events based on Sakari's comments.
> > - Now stop_stream() before toggling rst_gpio
> > - Updated init_mbus() to throw error on array out of bound access
> > - Make events and vcx_events as counters instead of structures
> > - Minor fixes in set_format() enum_mbus_code() as suggested by Sakari
> >
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
> > - Add gpio reset for asserting video_aresetn when stream line buffer
> > occurs
> > - Removed short packet related events and irq handling
> >   - V4L2_EVENT_XLNXCSIRX_SPKT and V4L2_EVENT_XLNXCSIRX_SPKT_OVF
> > removed
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
> > parsing
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
> >  drivers/media/platform/xilinx/Kconfig         |   11 +
> >  drivers/media/platform/xilinx/Makefile        |    1 +
> >  .../media/platform/xilinx/xilinx-csi2rxss.c   | 1230 +++++++++++++++++
> >  3 files changed, 1242 insertions(+)
> >  create mode 100644 drivers/media/platform/xilinx/xilinx-csi2rxss.c
> >
> > diff --git a/drivers/media/platform/xilinx/Kconfig
> > b/drivers/media/platform/xilinx/Kconfig
> > index a2773ad7c185..349da877c846 100644
> > --- a/drivers/media/platform/xilinx/Kconfig
> > +++ b/drivers/media/platform/xilinx/Kconfig
> > @@ -10,6 +10,17 @@ config VIDEO_XILINX
> >
> >  if VIDEO_XILINX
> >
> > +config VIDEO_XILINX_CSI2RXSS
> > +	tristate "Xilinx CSI2 Rx Subsystem"
> > +	depends on VIDEO_XILINX
>=20
> You don't need to depend on VIDEO_XILINX here due to the condition above.
>=20
[Vishal Sagar]=20
Ok. I will remove the depends line in next version.=20

> > +	help
> > +	  Driver for Xilinx MIPI CSI2 Rx Subsystem. This is a V4L sub-device
> > +	  based driver that takes input from CSI2 Tx source and converts
> > +	  it into an AXI4-Stream. The subsystem comprises of a CSI2 Rx
> > +	  controller, DPHY, an optional I2C controller and a Video Format
> > +	  Bridge. The driver is used to set the number of active lanes and
> > +	  get short packet data.
> > +
> >  config VIDEO_XILINX_TPG
> >  	tristate "Xilinx Video Test Pattern Generator"
> >  	depends on VIDEO_XILINX
> > diff --git a/drivers/media/platform/xilinx/Makefile
> > b/drivers/media/platform/xilinx/Makefile
> > index 4cdc0b1ec7a5..6119a34f3043 100644
> > --- a/drivers/media/platform/xilinx/Makefile
> > +++ b/drivers/media/platform/xilinx/Makefile
> > @@ -3,5 +3,6 @@
> >  xilinx-video-objs +=3D xilinx-dma.o xilinx-vip.o xilinx-vipp.o
> >
> >  obj-$(CONFIG_VIDEO_XILINX) +=3D xilinx-video.o
> > +obj-$(CONFIG_VIDEO_XILINX_CSI2RXSS) +=3D xilinx-csi2rxss.o
> >  obj-$(CONFIG_VIDEO_XILINX_TPG) +=3D xilinx-tpg.o
> >  obj-$(CONFIG_VIDEO_XILINX_VTC) +=3D xilinx-vtc.o diff --git
> > a/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > new file mode 100644
> > index 000000000000..1a22ca80382e
> > --- /dev/null
> > +++ b/drivers/media/platform/xilinx/xilinx-csi2rxss.c
> > @@ -0,0 +1,1230 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Driver for Xilinx MIPI CSI2 Rx Subsystem
> > + *
> > + * Copyright (C) 2016 - 2019 Xilinx, Inc.
> > + *
> > + * Contacts: Vishal Sagar <vishal.sagar@xilinx.com>
> > + *
> > + */
> > +#include <linux/clk.h>
> > +#include <linux/delay.h>
> > +#include <linux/gpio/consumer.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/of.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/v4l2-subdev.h>
> > +#include <media/media-entity.h>
> > +#include <media/v4l2-common.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +#include "xilinx-vip.h"
> > +
> > +/* Register register map */
> > +#define XCSI_CCR_OFFSET		0x00
> > +#define XCSI_CCR_SOFTRESET	BIT(1)
> > +#define XCSI_CCR_ENABLE		BIT(0)
> > +
> > +#define XCSI_PCR_OFFSET		0x04
> > +#define XCSI_PCR_MAXLANES_MASK	GENMASK(4, 3)
> > +#define XCSI_PCR_ACTLANES_MASK	GENMASK(1, 0)
> > +
> > +#define XCSI_CSR_OFFSET		0x10
> > +#define XCSI_CSR_PKTCNT		GENMASK(31, 16)
> > +#define XCSI_CSR_SPFIFOFULL	BIT(3)
> > +#define XCSI_CSR_SPFIFONE	BIT(2)
> > +#define XCSI_CSR_SLBF		BIT(1)
> > +#define XCSI_CSR_RIPCD		BIT(0)
> > +
> > +#define XCSI_GIER_OFFSET	0x20
> > +#define XCSI_GIER_GIE		BIT(0)
> > +
> > +#define XCSI_ISR_OFFSET		0x24
> > +#define XCSI_IER_OFFSET		0x28
> > +
> > +#define XCSI_ISR_FR		BIT(31)
> > +#define XCSI_ISR_VCXFE		BIT(30)
> > +#define XCSI_ISR_WCC		BIT(22)
> > +#define XCSI_ISR_ILC		BIT(21)
> > +#define XCSI_ISR_SPFIFOF	BIT(20)
> > +#define XCSI_ISR_SPFIFONE	BIT(19)
> > +#define XCSI_ISR_SLBF		BIT(18)
> > +#define XCSI_ISR_STOP		BIT(17)
> > +#define XCSI_ISR_SOTERR		BIT(13)
> > +#define XCSI_ISR_SOTSYNCERR	BIT(12)
> > +#define XCSI_ISR_ECC2BERR	BIT(11)
> > +#define XCSI_ISR_ECC1BERR	BIT(10)
> > +#define XCSI_ISR_CRCERR		BIT(9)
> > +#define XCSI_ISR_DATAIDERR	BIT(8)
> > +#define XCSI_ISR_VC3FSYNCERR	BIT(7)
> > +#define XCSI_ISR_VC3FLVLERR	BIT(6)
> > +#define XCSI_ISR_VC2FSYNCERR	BIT(5)
> > +#define XCSI_ISR_VC2FLVLERR	BIT(4)
> > +#define XCSI_ISR_VC1FSYNCERR	BIT(3)
> > +#define XCSI_ISR_VC1FLVLERR	BIT(2)
> > +#define XCSI_ISR_VC0FSYNCERR	BIT(1)
> > +#define XCSI_ISR_VC0FLVLERR	BIT(0)
> > +
> > +#define XCSI_INTR_PROT_MASK	(XCSI_ISR_VC3FSYNCERR |
> 	XCSI_ISR_VC3FLVLERR |\
> > +				 XCSI_ISR_VC2FSYNCERR |
> XCSI_ISR_VC2FLVLERR |\
> > +				 XCSI_ISR_VC1FSYNCERR |
> XCSI_ISR_VC1FLVLERR |\
> > +				 XCSI_ISR_VC0FSYNCERR |
> 	XCSI_ISR_VC0FLVLERR |\
> > +				 XCSI_ISR_VCXFE)
> > +
> > +#define XCSI_INTR_PKTLVL_MASK	(XCSI_ISR_ECC2BERR |
> XCSI_ISR_ECC1BERR |\
> > +				 XCSI_ISR_CRCERR | XCSI_ISR_DATAIDERR)
> > +
> > +#define XCSI_INTR_DPHY_MASK	(XCSI_ISR_SOTERR |
> XCSI_ISR_SOTSYNCERR)
> > +
> > +#define XCSI_INTR_SPKT_MASK	(XCSI_ISR_SPFIFOF |
> XCSI_ISR_SPFIFONE)
> > +
> > +#define XCSI_INTR_ERR_MASK	(XCSI_ISR_WCC | XCSI_ISR_ILC |
> XCSI_ISR_SLBF |\
> > +				 XCSI_ISR_STOP)
> > +
> > +#define XCSI_INTR_FRAMERCVD_MASK	(XCSI_ISR_FR)
> > +
> > +#define XCSI_ISR_ALLINTR_MASK	(XCSI_INTR_PROT_MASK |
> XCSI_INTR_PKTLVL_MASK |\
> > +				 XCSI_INTR_DPHY_MASK |
> XCSI_INTR_SPKT_MASK |\
> > +				 XCSI_INTR_ERR_MASK |
> XCSI_INTR_FRAMERCVD_MASK)
> > +
> > +/*
> > + * Removed VCXFE mask as it doesn't exist in IER
> > + * Removed STOP state irq as this will keep driver in irq handler
> > +only  */
> > +#define XCSI_IER_INTR_MASK	(XCSI_ISR_ALLINTR_MASK &\
> > +				 ~(XCSI_ISR_STOP | XCSI_ISR_VCXFE))
> > +
> > +#define XCSI_SPKTR_OFFSET	0x30
> > +#define XCSI_SPKTR_DATA		GENMASK(23, 8)
> > +#define XCSI_SPKTR_VC		GENMASK(7, 6)
> > +#define XCSI_SPKTR_DT		GENMASK(5, 0)
> > +
> > +#define XCSI_VCXR_OFFSET	0x34
> > +#define XCSI_VCXR_VCERR		GENMASK(23, 0)
> > +#define XCSI_VCXR_VCSTART	4
> > +#define XCSI_VCXR_VCEND		15
> > +#define XCSI_VCXR_FSYNCERR	BIT(1)
> > +#define XCSI_VCXR_FLVLERR	BIT(0)
> > +
> > +#define XCSI_CLKINFR_OFFSET	0x3C
> > +#define XCSI_CLKINFR_STOP	BIT(1)
> > +
> > +#define XCSI_DLXINFR_OFFSET	0x40
> > +#define XCSI_DLXINFR_STOP	BIT(5)
> > +#define XCSI_DLXINFR_SOTERR	BIT(1)
> > +#define XCSI_DLXINFR_SOTSYNCERR	BIT(0)
> > +#define XCSI_MAXDL_COUNT	0x4
> > +
> > +#define XCSI_VCXINF1R_OFFSET		0x60
> > +#define XCSI_VCXINF1R_LINECOUNT		GENMASK(31, 16)
> > +#define XCSI_VCXINF1R_LINECOUNT_SHIFT	16
> > +#define XCSI_VCXINF1R_BYTECOUNT		GENMASK(15, 0)
> > +
> > +#define XCSI_VCXINF2R_OFFSET	0x64
> > +#define XCSI_VCXINF2R_DT	GENMASK(5, 0)
> > +#define XCSI_MAXVCX_COUNT	16
> > +
> > +/*
> > + * The core takes less than 100 video clock cycles to reset.
> > + * So choosing a timeout value larger than this.
> > + */
> > +#define XCSI_TIMEOUT_VAL	1000 /* us */
> > +
> > +/*
> > + * Sink pad connected to sensor source pad.
> > + * Source pad connected to next module like demosaic.
> > + */
> > +#define XCSI_MEDIA_PADS		2
> > +#define XCSI_DEFAULT_WIDTH	1920
> > +#define XCSI_DEFAULT_HEIGHT	1080
> > +
> > +/* Max media bus formats supported for enumeration */
> > +#define XCSI_MAX_MBUS_FMTS	16
> > +
> > +/* Max string length for CSI Data type string */
> > +#define XCSI_PXLFMT_STRLEN_MAX	16
> > +
> > +/* MIPI CSI2 Data Types from spec */
> > +#define XCSI_DT_YUV4228B	0x1E
> > +#define XCSI_DT_YUV42210B	0x1F
> > +#define XCSI_DT_RGB444		0x20
> > +#define XCSI_DT_RGB555		0x21
> > +#define XCSI_DT_RGB565		0x22
> > +#define XCSI_DT_RGB666		0x23
> > +#define XCSI_DT_RGB888		0x24
> > +#define XCSI_DT_RAW6		0x28
> > +#define XCSI_DT_RAW7		0x29
> > +#define XCSI_DT_RAW8		0x2A
> > +#define XCSI_DT_RAW10		0x2B
> > +#define XCSI_DT_RAW12		0x2C
> > +#define XCSI_DT_RAW14		0x2D
> > +#define XCSI_DT_RAW16		0x2E
> > +#define XCSI_DT_RAW20		0x2F
> > +
> > +#define XCSI_VCX_START		4
> > +#define XCSI_MAX_VC		4
> > +#define XCSI_MAX_VCX		16
> > +
> > +#define XCSI_NEXTREG_OFFSET	4
> > +
> > +/* There are 2 events frame sync and frame level error per VC */
> > +#define XCSI_VCX_NUM_EVENTS	((XCSI_MAX_VCX - XCSI_MAX_VC) *
> 2)
> > +
> > +/* Macro to return "true" or "false" string if bit is set */
> > +#define XCSI_GET_BITSET_STR(val, mask)	(val) & (mask) ? "true" :
> "false"
> > +
> > +#define XADD_MBUS(state, mbus_fmt)
> 	\
> > +	do {								\
> > +		if ((state)->mbus_fmts_count < XCSI_MAX_MBUS_FMTS) {
> 	\
> > +			(state)->mbus_fmts[(state)->mbus_fmts_count++] =3D\
> > +				(mbus_fmt);				\
> > +		} else {						\
> > +			dev_err((state)->core.dev,			\
> > +				"accessing array out of bounds!\n");	\
> > +		}							\
> > +	} while (0)
> > +
> > +/**
> > + * struct xcsi2rxss_event - Event log structure
> > + * @mask: Event mask
> > + * @name: Name of the event
> > + */
> > +struct xcsi2rxss_event {
> > +	u32 mask;
> > +	const char *name;
> > +};
> > +
> > +static const struct xcsi2rxss_event xcsi2rxss_events[] =3D {
> > +	{ XCSI_ISR_FR, "Frame Received" },
> > +	{ XCSI_ISR_VCXFE, "VCX Frame Errors" },
> > +	{ XCSI_ISR_WCC, "Word Count Errors" },
> > +	{ XCSI_ISR_ILC, "Invalid Lane Count Error" },
> > +	{ XCSI_ISR_SPFIFOF, "Short Packet FIFO OverFlow Error" },
> > +	{ XCSI_ISR_SPFIFONE, "Short Packet FIFO Not Empty" },
> > +	{ XCSI_ISR_SLBF, "Streamline Buffer Full Error" },
> > +	{ XCSI_ISR_STOP, "Lane Stop State" },
> > +	{ XCSI_ISR_SOTERR, "SOT Error" },
> > +	{ XCSI_ISR_SOTSYNCERR, "SOT Sync Error" },
> > +	{ XCSI_ISR_ECC2BERR, "2 Bit ECC Unrecoverable Error" },
> > +	{ XCSI_ISR_ECC1BERR, "1 Bit ECC Recoverable Error" },
> > +	{ XCSI_ISR_CRCERR, "CRC Error" },
> > +	{ XCSI_ISR_DATAIDERR, "Data Id Error" },
> > +	{ XCSI_ISR_VC3FSYNCERR, "Virtual Channel 3 Frame Sync Error" },
> > +	{ XCSI_ISR_VC3FLVLERR, "Virtual Channel 3 Frame Level Error" },
> > +	{ XCSI_ISR_VC2FSYNCERR, "Virtual Channel 2 Frame Sync Error" },
> > +	{ XCSI_ISR_VC2FLVLERR, "Virtual Channel 2 Frame Level Error" },
> > +	{ XCSI_ISR_VC1FSYNCERR, "Virtual Channel 1 Frame Sync Error" },
> > +	{ XCSI_ISR_VC1FLVLERR, "Virtual Channel 1 Frame Level Error" },
> > +	{ XCSI_ISR_VC0FSYNCERR, "Virtual Channel 0 Frame Sync Error" },
> > +	{ XCSI_ISR_VC0FLVLERR, "Virtual Channel 0 Frame Level Error" } };
> > +
> > +#define XCSI_NUM_EVENTS		ARRAY_SIZE(xcsi2rxss_events)
> > +
> > +/*
> > + * struct xcsi2rxss_core - Core configuration CSI2 Rx Subsystem
> > +device structure
> > + * @dev: Platform structure
> > + * @iomem: Base address of subsystem
> > + * @enable_active_lanes: If number of active lanes can be modified
> > + * @max_num_lanes: Maximum number of lanes present
> > + * @datatype: Data type filter
> > + * @events: counter for events
> > + * @vcx_events: counter for vcx_events
> > + * @en_vcx: If more than 4 VC are enabled
> > + * @clks: array of clocks
> > + * @num_clks: number of clocks
> > + * @rst_gpio: reset to video_aresetn
> > + */
> > +struct xcsi2rxss_core {
> > +	struct device *dev;
> > +	void __iomem *iomem;
> > +	bool enable_active_lanes;
> > +	u32 max_num_lanes;
> > +	u32 datatype;
> > +	u32 events[XCSI_NUM_EVENTS];
> > +	u32 vcx_events[XCSI_VCX_NUM_EVENTS];
> > +	bool en_vcx;
> > +	struct clk_bulk_data *clks;
> > +	int num_clks;
> > +	struct gpio_desc *rst_gpio;
> > +};
> > +
> > +/**
> > + * struct xcsi2rxss_state - CSI2 Rx Subsystem device structure
> > + * @core: Core structure for MIPI CSI2 Rx Subsystem
> > + * @subdev: The v4l2 subdev structure
> > + * @format: Active V4L2 formats on each pad
> > + * @default_format: Default V4L2 format
> > + * @lock: mutex for accessing this structure
> > + * @pads: media pads
> > + * @mbus_fmts: List of media bus formats for enum_mbus_code
> > + * @mbus_fmts_count: Number of media bus formats
> > + * @streaming: Flag for storing streaming state
> > + *
> > + * This structure contains the device driver related parameters  */
> > +struct xcsi2rxss_state {
> > +	struct xcsi2rxss_core core;
> > +	struct v4l2_subdev subdev;
> > +	struct v4l2_mbus_framefmt format;
> > +	struct v4l2_mbus_framefmt default_format;
> > +	/* used to protect access to this struct */
> > +	struct mutex lock;
> > +	struct media_pad pads[XCSI_MEDIA_PADS];
> > +	u32 mbus_fmts[XCSI_MAX_MBUS_FMTS];
> > +	u32 mbus_fmts_count;
> > +	bool streaming;
> > +};
> > +
> > +static const struct clk_bulk_data xcsi2rxss_clks[] =3D {
> > +	{ .id =3D "lite_aclk" },
> > +	{ .id =3D "video_aclk" },
> > +};
> > +
> > +static inline struct xcsi2rxss_state * to_xcsi2rxssstate(struct
> > +v4l2_subdev *subdev) {
> > +	return container_of(subdev, struct xcsi2rxss_state, subdev); }
> > +
> > +/*
> > + * Register related operations
> > + */
> > +static inline u32 xcsi2rxss_read(struct xcsi2rxss_core *xcsi2rxss,
> > +u32 addr) {
> > +	return ioread32(xcsi2rxss->iomem + addr); }
> > +
> > +static inline void xcsi2rxss_write(struct xcsi2rxss_core *xcsi2rxss, u=
32
> addr,
> > +				   u32 value)
> > +{
> > +	iowrite32(value, xcsi2rxss->iomem + addr); }
> > +
> > +static inline void xcsi2rxss_clr(struct xcsi2rxss_core *xcsi2rxss, u32=
 addr,
> > +				 u32 clr)
> > +{
> > +	xcsi2rxss_write(xcsi2rxss, addr,
> > +			xcsi2rxss_read(xcsi2rxss, addr) & ~clr); }
> > +
> > +static inline void xcsi2rxss_set(struct xcsi2rxss_core *xcsi2rxss, u32=
 addr,
> > +				 u32 set)
> > +{
> > +	xcsi2rxss_write(xcsi2rxss, addr,
> > +			xcsi2rxss_read(xcsi2rxss, addr) | set);
>=20
> Fits on a single line.

Yes. I will fix in next version.

>=20
> > +}
> > +
> > +static void xcsi2rxss_enable(struct xcsi2rxss_core *core) {
> > +	xcsi2rxss_set(core, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE); }
> > +
> > +static void xcsi2rxss_disable(struct xcsi2rxss_core *core) {
> > +	xcsi2rxss_clr(core, XCSI_CCR_OFFSET, XCSI_CCR_ENABLE); }
> > +
> > +static void xcsi2rxss_intr_enable(struct xcsi2rxss_core *core) {
> > +	xcsi2rxss_clr(core, XCSI_GIER_OFFSET, XCSI_GIER_GIE);
> > +	xcsi2rxss_write(core, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
> > +	xcsi2rxss_set(core, XCSI_GIER_OFFSET, XCSI_GIER_GIE); }
> > +
> > +static void xcsi2rxss_intr_disable(struct xcsi2rxss_core *core) {
> > +	xcsi2rxss_clr(core, XCSI_IER_OFFSET, XCSI_IER_INTR_MASK);
> > +	xcsi2rxss_clr(core, XCSI_GIER_OFFSET, XCSI_GIER_GIE); }
> > +
> > +/**
> > + * xcsi2rxss_reset - Does a soft reset of the MIPI CSI2 Rx Subsystem
> > + * @core: Core Xilinx CSI2 Rx Subsystem structure pointer
> > + *
> > + * Core takes less than 100 video clock cycles to reset.
> > + * So a larger timeout value is chosen for margin.
> > + *
> > + * Return: 0 - on success OR -ETIME if reset times out  */ static int
> > +xcsi2rxss_reset(struct xcsi2rxss_core *core) {
> > +	u32 timeout =3D XCSI_TIMEOUT_VAL;
> > +
> > +	xcsi2rxss_set(core, XCSI_CCR_OFFSET, XCSI_CCR_SOFTRESET);
> > +
> > +	while (xcsi2rxss_read(core, XCSI_CSR_OFFSET) & XCSI_CSR_RIPCD) {
> > +		if (timeout =3D=3D 0) {
> > +			dev_err(core->dev, "soft reset timed out!\n");
> > +			return -ETIME;
> > +		}
> > +
> > +		timeout--;
> > +		udelay(1);
> > +	}
> > +
> > +	xcsi2rxss_clr(core, XCSI_CCR_OFFSET, XCSI_CCR_SOFTRESET);
> > +	return 0;
> > +}
> > +
> > +static void xcsi2rxss_reset_event_counters(struct xcsi2rxss_state
> > +*state) {
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < XCSI_NUM_EVENTS; i++)
> > +		state->core.events[i] =3D 0;
> > +
> > +	for (i =3D 0; i < XCSI_VCX_NUM_EVENTS; i++)
> > +		state->core.vcx_events[i] =3D 0;
> > +}
> > +
> > +/* Print event counters */
> > +static void xcsi2rxss_log_counters(struct xcsi2rxss_state *state) {
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < XCSI_NUM_EVENTS; i++) {
> > +		if (core->events[i] > 0) {
> > +			dev_info(core->dev, "%s events: %d\n",
> > +				 xcsi2rxss_events[i].name,
> > +				 core->events[i]);
> > +		}
> > +	}
> > +
> > +	if (core->en_vcx) {
> > +		for (i =3D 0; i < XCSI_VCX_NUM_EVENTS; i++) {
> > +			if (core->vcx_events[i] > 0) {
> > +				dev_info(core->dev,
> > +					 "VC %d Frame %s err vcx events:
> %d\n",
> > +					 (i / 2) + XCSI_VCX_START,
> > +					 i & 1 ? "Sync" : "Level",
> > +					 core->vcx_events[i]);
> > +			}
> > +		}
> > +	}
> > +}
> > +
> > +static void xcsi2rxss_log_ipconfig(struct xcsi2rxss_state *state) {
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +	dev_dbg(core->dev, "****** Xilinx MIPI CSI2 Rx SS IP Config
> ******\n");
> > +	dev_dbg(core->dev, "vcx is %s", core->en_vcx ? "enabled" :
> "disabled");
> > +	dev_dbg(core->dev, "Enable active lanes property is %s\n",
> > +		core->enable_active_lanes ? "present" : "absent");
> > +	dev_dbg(core->dev, "Max lanes =3D %d", core->max_num_lanes);
> > +	dev_dbg(core->dev, "Pixel format set as 0x%x\n", core->datatype);
> > +	dev_dbg(core->dev,
> > +"**********************************************\n");
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
> > +static int xcsi2rxss_log_status(struct v4l2_subdev *sd) {
> > +	struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +	struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +	u32 reg, data;
> > +	unsigned int i, max_vc;
> > +
> > +	mutex_lock(&xcsi2rxss->lock);
> > +
> > +	xcsi2rxss_log_ipconfig(xcsi2rxss);
> > +
> > +	xcsi2rxss_log_counters(xcsi2rxss);
> > +
> > +	dev_info(core->dev, "***** Core Status *****\n");
> > +	data =3D xcsi2rxss_read(core, XCSI_CSR_OFFSET);
> > +	dev_info(core->dev, "Short Packet FIFO Full =3D %s\n",
> > +		 XCSI_GET_BITSET_STR(data, XCSI_CSR_SPFIFOFULL));
> > +	dev_info(core->dev, "Short Packet FIFO Not Empty =3D %s\n",
> > +		 XCSI_GET_BITSET_STR(data, XCSI_CSR_SPFIFONE));
> > +	dev_info(core->dev, "Stream line buffer full =3D %s\n",
> > +		 XCSI_GET_BITSET_STR(data, XCSI_CSR_SLBF));
> > +	dev_info(core->dev, "Soft reset/Core disable in progress =3D %s\n",
> > +		 XCSI_GET_BITSET_STR(data, XCSI_CSR_RIPCD));
> > +
> > +	/* Clk & Lane Info  */
> > +	dev_info(core->dev, "******** Clock Lane Info *********\n");
> > +	data =3D xcsi2rxss_read(core, XCSI_CLKINFR_OFFSET);
> > +	dev_info(core->dev, "Clock Lane in Stop State =3D %s\n",
> > +		 XCSI_GET_BITSET_STR(data, XCSI_CLKINFR_STOP));
> > +
> > +	dev_info(core->dev, "******** Data Lane Info *********\n");
> > +	dev_info(core->dev, "Lane\tSoT Error\tSoT Sync Error\tStop
> State\n");
> > +	reg =3D XCSI_DLXINFR_OFFSET;
> > +	for (i =3D 0; i < XCSI_MAXDL_COUNT; i++) {
> > +		data =3D xcsi2rxss_read(core, reg);
> > +
> > +		dev_info(core->dev, "%d\t%s\t\t%s\t\t%s\n", i,
> > +			 XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_SOTERR),
> > +			 XCSI_GET_BITSET_STR(data,
> XCSI_DLXINFR_SOTSYNCERR),
> > +			 XCSI_GET_BITSET_STR(data, XCSI_DLXINFR_STOP));
> > +
> > +		reg +=3D XCSI_NEXTREG_OFFSET;
> > +	}
> > +
> > +	/* Virtual Channel Image Information */
> > +	dev_info(core->dev, "********** Virtual Channel Info
> ************\n");
> > +	dev_info(core->dev, "VC\tLine Count\tByte Count\tData Type\n");
> > +	if (core->en_vcx)
> > +		max_vc =3D XCSI_MAX_VCX;
> > +	else
> > +		max_vc =3D XCSI_MAX_VC;
> > +
> > +	reg =3D XCSI_VCXINF1R_OFFSET;
> > +	for (i =3D 0; i < max_vc; i++) {
> > +		u32 line_count, byte_count, data_type;
> > +
> > +		/* Get line and byte count from VCXINFR1 Register */
> > +		data =3D xcsi2rxss_read(core, reg);
> > +		byte_count =3D data & XCSI_VCXINF1R_BYTECOUNT;
> > +		line_count =3D data & XCSI_VCXINF1R_LINECOUNT;
> > +		line_count >>=3D XCSI_VCXINF1R_LINECOUNT_SHIFT;
> > +
> > +		/* Get data type from VCXINFR2 Register */
> > +		reg +=3D XCSI_NEXTREG_OFFSET;
> > +		data =3D xcsi2rxss_read(core, reg);
> > +		data_type =3D data & XCSI_VCXINF2R_DT;
> > +
> > +		dev_info(core->dev, "%d\t%d\t\t%d\t\t0x%x\n", i,
> line_count,
> > +			 byte_count, data_type);
> > +
> > +		/* Move to next pair of VC Info registers */
> > +		reg +=3D XCSI_NEXTREG_OFFSET;
> > +	}
> > +
> > +	mutex_unlock(&xcsi2rxss->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xcsi2rxss_start_stream(struct xcsi2rxss_state *state) {
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +	int ret =3D 0;
> > +
> > +	xcsi2rxss_enable(core);
> > +
> > +	ret =3D xcsi2rxss_reset(core);
> > +	if (ret < 0) {
> > +		state->streaming =3D false;
> > +		return ret;
> > +	}
>=20
> You'll need to start streaming on the upstream sub-device somewhere in th=
is
> function.
>=20
> > +
> > +	xcsi2rxss_intr_enable(core);
> > +	state->streaming =3D true;
> > +
> > +	return ret;
> > +}
> > +
> > +static void xcsi2rxss_stop_stream(struct xcsi2rxss_state *state) {
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +	xcsi2rxss_intr_disable(core);
> > +	xcsi2rxss_disable(core);
> > +	state->streaming =3D false;
>=20
> And stop it here.

Though this taken care by xvip_pipeline_start_stop() in xilinx-dma.c,
I will add the code here in next version.

>=20
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
> > + * Return: IRQ_HANDLED after handling interrupts
> > + *         IRQ_NONE is no interrupts
> > + */
> > +static irqreturn_t xcsi2rxss_irq_handler(int irq, void *dev_id) {
> > +	struct xcsi2rxss_state *state =3D (struct xcsi2rxss_state *)dev_id;
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +	u32 status;
> > +
> > +	status =3D xcsi2rxss_read(core, XCSI_ISR_OFFSET) &
> XCSI_ISR_ALLINTR_MASK;
> > +	dev_dbg_ratelimited(core->dev, "interrupt status =3D 0x%08x\n",
> > +status);
> > +
> > +	if (!status)
> > +		return IRQ_NONE;
> > +
> > +	/* Received a short packet */
> > +	if (status & XCSI_ISR_SPFIFONE) {
> > +		dev_dbg_ratelimited(core->dev, "Short packet =3D 0x%08x\n",
> > +				    xcsi2rxss_read(core, XCSI_SPKTR_OFFSET));
> > +	}
> > +
> > +	/* Short packet FIFO overflow */
> > +	if (status & XCSI_ISR_SPFIFOF)
> > +		dev_dbg_ratelimited(core->dev, "Short packet FIFO
> overflowed\n");
> > +
> > +	/*
> > +	 * Stream line buffer full
> > +	 * This means there is a backpressure from downstream IP
> > +	 */
> > +	if (status & XCSI_ISR_SLBF) {
> > +		dev_alert_ratelimited(core->dev, "Stream Line Buffer
> Full!\n");
> > +		xcsi2rxss_stop_stream(state);
> > +		if (core->rst_gpio) {
> > +			gpiod_set_value(core->rst_gpio, 1);
> > +			/* minimum 40 dphy_clk_200M cycles */
> > +			ndelay(250);
> > +			gpiod_set_value(core->rst_gpio, 0);
> > +		}
> > +	}
> > +
> > +	/* Increment event counters */
> > +	if (status & XCSI_ISR_ALLINTR_MASK) {
> > +		unsigned int i;
> > +
> > +		for (i =3D 0; i < XCSI_NUM_EVENTS; i++) {
> > +			if (!(status & xcsi2rxss_events[i].mask))
> > +				continue;
> > +			core->events[i]++;
> > +			dev_dbg_ratelimited(core->dev, "%s: %d\n",
> > +					    xcsi2rxss_events[i].name,
> > +					    core->events[i]);
> > +		}
> > +
> > +		if (status & XCSI_ISR_VCXFE && core->en_vcx) {
> > +			u32 vcxstatus;
> > +
> > +			vcxstatus =3D xcsi2rxss_read(core, XCSI_VCXR_OFFSET);
> > +			vcxstatus &=3D XCSI_VCXR_VCERR;
> > +			for (i =3D 0; i < XCSI_VCX_NUM_EVENTS; i++) {
> > +				if (!(vcxstatus & (1 << i)))
> > +					continue;
> > +				core->vcx_events[i]++;
> > +			}
> > +			xcsi2rxss_write(core, XCSI_VCXR_OFFSET, vcxstatus);
> > +		}
> > +	}
> > +
> > +	xcsi2rxss_write(core, XCSI_ISR_OFFSET, status);
> > +	return IRQ_HANDLED;
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
> > + * Return: 0 on success, errors otherwise  */ static int
> > +xcsi2rxss_s_stream(struct v4l2_subdev *sd, int enable) {
> > +	struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +	int ret =3D 0;
> > +
> > +	mutex_lock(&xcsi2rxss->lock);
> > +
> > +	if (enable) {
> > +		if (!xcsi2rxss->streaming) {
> > +			/* reset the event counters */
> > +			xcsi2rxss_reset_event_counters(xcsi2rxss);
> > +			ret =3D xcsi2rxss_start_stream(xcsi2rxss);
> > +		}
> > +	} else {
> > +		if (xcsi2rxss->streaming) {
> > +			struct gpio_desc *rst =3D xcsi2rxss->core.rst_gpio;
> > +
> > +			xcsi2rxss_stop_stream(xcsi2rxss);
> > +			if (rst) {
> > +				gpiod_set_value_cansleep(rst, 1);
> > +				usleep_range(1, 2);
> > +				gpiod_set_value_cansleep(rst, 0);
> > +			}
> > +		}
> > +	}
> > +
> > +	mutex_unlock(&xcsi2rxss->lock);
> > +	return ret;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +__xcsi2rxss_get_pad_format(struct xcsi2rxss_state *xcsi2rxss,
> > +			   struct v4l2_subdev_pad_config *cfg,
> > +			   unsigned int pad, u32 which)
> > +{
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(&xcsi2rxss->subdev, cfg,
> pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &xcsi2rxss->format;
> > +	default:
> > +		return NULL;
> > +	}
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
> > +				struct v4l2_subdev_pad_config *cfg,
> > +				struct v4l2_subdev_format *fmt)
> > +{
> > +	struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +
> > +	mutex_lock(&xcsi2rxss->lock);
> > +	fmt->format =3D *__xcsi2rxss_get_pad_format(xcsi2rxss, cfg, fmt->pad,
> > +						  fmt->which);
> > +	mutex_unlock(&xcsi2rxss->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +/**
> > + * xcsi2rxss_set_format - This is used to set the pad format
> > + * @sd: Pointer to V4L2 Sub device structure
> > + * @cfg: Pointer to sub device pad information structure
> > + * @fmt: Pointer to pad level media bus format
> > + *
> > + * This function is used to set the pad format. Since the pad format
> > +is fixed
> > + * in hardware, it can't be modified on run time. So when a format
> > +set is
> > + * requested by application, all parameters except the format type is
> > +saved
> > + * for the pad and the original pad format is sent back to the applica=
tion.
> > + *
> > + * Return: 0 on success
> > + */
> > +static int xcsi2rxss_set_format(struct v4l2_subdev *sd,
> > +				struct v4l2_subdev_pad_config *cfg,
> > +				struct v4l2_subdev_format *fmt)
> > +{
> > +	struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +	struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +	struct v4l2_mbus_framefmt *__format;
> > +
> > +	/* only sink pad format can be updated */
> > +	mutex_lock(&xcsi2rxss->lock);
> > +
> > +	/*
> > +	 * Only the format->code parameter matters for CSI as the
> > +	 * CSI format cannot be changed at runtime.
> > +	 * Ensure that format to set is copied to over to CSI pad format
> > +	 */
> > +	__format =3D __xcsi2rxss_get_pad_format(xcsi2rxss, cfg,
> > +					      fmt->pad, fmt->which);
> > +
> > +	if (fmt->pad =3D=3D XVIP_PAD_SOURCE) {
> > +		fmt->format =3D *__format;
> > +		mutex_unlock(&xcsi2rxss->lock);
> > +		return 0;
> > +	}
> > +
> > +	/*
> > +	 * RAW8 is supported in all datatypes. So if requested media bus
> format
> > +	 * is of RAW8 type, then allow to be set. In case core is configured =
to
> > +	 * other RAW, YUV422 8/10 or RGB888, set appropriate media bus
> format.
> > +	 */
> > +	if (!((fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR8_1X8 ||
> > +	       fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG8_1X8 ||
> > +	       fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG8_1X8 ||
> > +	       fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB8_1X8) ||
> > +	      (core->datatype =3D=3D XCSI_DT_RAW10 &&
> > +	       (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR10_1X10 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG10_1X10 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG10_1X10 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB10_1X10)) ||
> > +	      (core->datatype =3D=3D XCSI_DT_RAW12 &&
> > +	       (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR12_1X12 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG12_1X12 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG12_1X12 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB12_1X12)) ||
> > +	      (core->datatype =3D=3D XCSI_DT_RAW14 &&
> > +	       (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR14_1X14 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG14_1X14 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG14_1X14 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB14_1X14)) ||
> > +	      (core->datatype =3D=3D XCSI_DT_RAW16 &&
> > +	       (fmt->format.code =3D=3D MEDIA_BUS_FMT_SBGGR16_1X16 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGBRG16_1X16 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SGRBG16_1X16 ||
> > +		fmt->format.code =3D=3D MEDIA_BUS_FMT_SRGGB16_1X16)) ||
> > +	      (core->datatype =3D=3D XCSI_DT_YUV4228B &&
> > +	       fmt->format.code =3D=3D MEDIA_BUS_FMT_UYVY8_1X16) ||
> > +	      (core->datatype =3D=3D XCSI_DT_YUV42210B &&
> > +	       fmt->format.code =3D=3D MEDIA_BUS_FMT_UYVY10_1X20) ||
> > +	      (core->datatype =3D=3D XCSI_DT_RGB888 &&
> > +	       fmt->format.code =3D=3D MEDIA_BUS_FMT_RBG888_1X24))) {
> > +		/* Restore the original pad format code */
> > +		dev_dbg(core->dev, "Unsupported media bus format");
> > +		fmt->format.code =3D __format->code;
> > +	}
> > +
> > +	*__format =3D fmt->format;
>=20
> Did I already ask whether there are any limits on width or height for thi=
s
> device?
>=20

There is no limit on width and height from the protocol perspective.=20

> > +	mutex_unlock(&xcsi2rxss->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > + * xcsi2rxss_enum_mbus_code - Handle pixel format enumeration
> > + * @sd : pointer to v4l2 subdev structure
> > + * @cfg: V4L2 subdev pad configuration
> > + * @code : pointer to v4l2_subdev_mbus_code_enum structure
> > + *
> > + * Return: -EINVAL or zero on success  */ int
> > +xcsi2rxss_enum_mbus_code(struct v4l2_subdev *sd,
> > +			     struct v4l2_subdev_pad_config *cfg,
> > +			     struct v4l2_subdev_mbus_code_enum *code) {
> > +	struct xcsi2rxss_state *state =3D to_xcsi2rxssstate(sd);
> > +
> > +	if (code->index >=3D state->mbus_fmts_count)
> > +		return -EINVAL;
> > +
> > +	code->code =3D state->mbus_fmts[code->index];
> > +
> > +	return 0;
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
> > +			  struct v4l2_subdev_fh *fh)
> > +{
> > +	struct xcsi2rxss_state *xcsi2rxss =3D to_xcsi2rxssstate(sd);
> > +	struct v4l2_mbus_framefmt *format;
> > +	unsigned int i;
> > +
> > +	for (i =3D 0; i < XCSI_MEDIA_PADS; i++) {
> > +		format =3D v4l2_subdev_get_try_format(sd, fh->pad, i);
> > +		*format =3D xcsi2rxss->default_format;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +/*
> > +---------------------------------------------------------------------
> > +--------
> > + * Media Operations
> > + */
> > +
> > +static const struct media_entity_operations xcsi2rxss_media_ops =3D {
> > +	.link_validate =3D v4l2_subdev_link_validate };
> > +
> > +static const struct v4l2_subdev_core_ops xcsi2rxss_core_ops =3D {
> > +	.log_status =3D xcsi2rxss_log_status,
> > +};
> > +
> > +static const struct v4l2_subdev_video_ops xcsi2rxss_video_ops =3D {
> > +	.s_stream =3D xcsi2rxss_s_stream
> > +};
> > +
> > +static const struct v4l2_subdev_pad_ops xcsi2rxss_pad_ops =3D {
> > +	.get_fmt =3D xcsi2rxss_get_format,
> > +	.set_fmt =3D xcsi2rxss_set_format,
> > +	.enum_mbus_code =3D xcsi2rxss_enum_mbus_code,
>=20
> You'll need link_validate set to v4l2_subdev_link_validate_default here.

I will add this in the next version.

>=20
> > +};
> > +
> > +static const struct v4l2_subdev_ops xcsi2rxss_ops =3D {
> > +	.core =3D &xcsi2rxss_core_ops,
> > +	.video =3D &xcsi2rxss_video_ops,
> > +	.pad =3D &xcsi2rxss_pad_ops
> > +};
> > +
> > +static const struct v4l2_subdev_internal_ops xcsi2rxss_internal_ops =
=3D {
> > +	.open =3D xcsi2rxss_open,
> > +};
> > +
> > +static void xcsi2rxss_set_default_format(struct xcsi2rxss_state
> > +*state) {
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +	memset(&state->default_format, 0, sizeof(state->default_format));
> > +
> > +	switch (core->datatype) {
> > +	case XCSI_DT_YUV4228B:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_UYVY8_1X16;
> > +		break;
> > +	case XCSI_DT_RGB888:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_RBG888_1X24;
> > +		break;
> > +	case XCSI_DT_YUV42210B:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_UYVY10_1X20;
> > +		break;
> > +	case XCSI_DT_RAW10:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_SRGGB10_1X10;
> > +		break;
> > +	case XCSI_DT_RAW12:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_SRGGB12_1X12;
> > +		break;
> > +	case XCSI_DT_RAW14:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_SRGGB14_1X14;
> > +		break;
> > +	case XCSI_DT_RAW16:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_SRGGB16_1X16;
> > +		break;
> > +	case XCSI_DT_RAW8:
> > +	case XCSI_DT_RGB444:
> > +	case XCSI_DT_RGB555:
> > +	case XCSI_DT_RGB565:
> > +	case XCSI_DT_RGB666:
> > +		state->default_format.code =3D
> MEDIA_BUS_FMT_SRGGB8_1X8;
> > +		break;
> > +	}
> > +
> > +	state->default_format.field =3D V4L2_FIELD_NONE;
> > +	state->default_format.colorspace =3D V4L2_COLORSPACE_SRGB;
> > +	state->default_format.width =3D XCSI_DEFAULT_WIDTH;
> > +	state->default_format.height =3D XCSI_DEFAULT_HEIGHT;
> > +
> > +	dev_dbg(core->dev, "default mediabus format =3D 0x%x",
> > +		state->default_format.code);
> > +}
> > +
> > +static void xcsi2rxss_init_mbus_fmts(struct xcsi2rxss_state *state) {
> > +	struct xcsi2rxss_core *core =3D &state->core;
> > +
> > +	XADD_MBUS(state, MEDIA_BUS_FMT_SRGGB8_1X8);
> > +	XADD_MBUS(state, MEDIA_BUS_FMT_SBGGR8_1X8);
> > +	XADD_MBUS(state, MEDIA_BUS_FMT_SGRBG8_1X8);
> > +	XADD_MBUS(state, MEDIA_BUS_FMT_SGBRG8_1X8);
> > +
> > +	switch (core->datatype) {
> > +	case XCSI_DT_RAW10:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SRGGB10_1X10);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SBGGR10_1X10);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGRBG10_1X10);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGBRG10_1X10);
> > +		break;
> > +	case XCSI_DT_RAW12:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SRGGB12_1X12);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SBGGR12_1X12);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGRBG12_1X12);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGBRG12_1X12);
> > +		break;
> > +	case XCSI_DT_RAW14:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SRGGB14_1X14);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SBGGR14_1X14);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGRBG14_1X14);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGBRG14_1X14);
> > +		break;
> > +	case XCSI_DT_RAW16:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SRGGB16_1X16);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SBGGR16_1X16);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGRBG16_1X16);
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_SGBRG16_1X16);
> > +		break;
> > +	case XCSI_DT_YUV4228B:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_UYVY8_1X16);
> > +		break;
> > +	case XCSI_DT_RGB888:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_RBG888_1X24);
> > +		break;
> > +	case XCSI_DT_YUV42210B:
> > +		XADD_MBUS(state, MEDIA_BUS_FMT_UYVY10_1X20);
> > +		break;
> > +	default:
> > +		dev_err(core->dev, "Invalid data type!\n");
> > +	}
> > +}
> > +
> > +static int xcsi2rxss_parse_of(struct xcsi2rxss_state *xcsi2rxss) {
> > +	struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +	struct device_node *node =3D xcsi2rxss->core.dev->of_node;
> > +	struct device_node *ports =3D NULL;
> > +	struct device_node *port =3D NULL;
> > +	unsigned int nports, irq;
> > +	bool en_csi_v20, vfb;
> > +	int ret;
> > +
> > +	en_csi_v20 =3D of_property_read_bool(node, "xlnx,en-csi-v2-0");
> > +	if (en_csi_v20)
> > +		core->en_vcx =3D of_property_read_bool(node, "xlnx,en-vcx");
> > +
> > +	core->enable_active_lanes =3D
> > +		of_property_read_bool(node, "xlnx,en-active-lanes");
> > +
> > +	ret =3D of_property_read_u32(node, "xlnx,csi-pxl-format",
> > +				   &core->datatype);
> > +	if (ret < 0) {
> > +		dev_err(core->dev, "missing xlnx,csi-pxl-format property\n");
> > +		return ret;
> > +	}
> > +
> > +	switch (core->datatype) {
> > +	case XCSI_DT_YUV4228B:
> > +	case XCSI_DT_RGB444:
> > +	case XCSI_DT_RGB555:
> > +	case XCSI_DT_RGB565:
> > +	case XCSI_DT_RGB666:
> > +	case XCSI_DT_RGB888:
> > +	case XCSI_DT_RAW6:
> > +	case XCSI_DT_RAW7:
> > +	case XCSI_DT_RAW8:
> > +	case XCSI_DT_RAW10:
> > +	case XCSI_DT_RAW12:
> > +	case XCSI_DT_RAW14:
> > +		break;
> > +	case XCSI_DT_YUV42210B:
> > +	case XCSI_DT_RAW16:
> > +	case XCSI_DT_RAW20:
> > +		if (!en_csi_v20) {
> > +			ret =3D -EINVAL;
> > +			dev_dbg(core->dev, "enable csi v2 for this pixel
> format");
> > +		}
> > +		break;
> > +	default:
> > +		ret =3D -EINVAL;
> > +	}
> > +	if (ret < 0) {
> > +		dev_err(core->dev, "invalid csi-pxl-format property!\n");
> > +		return ret;
> > +	}
> > +
> > +	vfb =3D of_property_read_bool(node, "xlnx,vfb");
> > +	if (!vfb) {
> > +		dev_err(core->dev, "failed as VFB is disabled!\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ports =3D of_get_child_by_name(node, "ports");
> > +	if (!ports)
> > +		ports =3D node;
> > +
> > +	nports =3D 0;
> > +	for_each_child_of_node(ports, port) {
> > +		struct device_node *endpoint;
> > +		struct v4l2_fwnode_endpoint v4lendpoint;
> > +		int ret;
> > +
> > +		if (!port->name || of_node_cmp(port->name, "port"))
> > +			continue;
> > +
> > +		endpoint =3D of_get_next_child(port, NULL);
> > +		if (!endpoint) {
> > +			dev_err(core->dev, "No port at\n");
> > +			return -EINVAL;
> > +		}
>=20
> You shouldn't parse the graph data structure yourself.
>=20
> Could you use fwnode_graph_get_endpoint_by_id(), and work it from there
> without using an enumeration? You have two endpoints in there after all i=
n
> two ports.
>=20
> Please see drivers/media/pci/intel/ipu3/ipu3-cio2.c for an example.
>=20

Thanks for sharing this. I will update accordingly in next version.

> > +
> > +		/*
> > +		 * since first port is sink port and it contains
> > +		 * all info about data-lanes and cfa-pattern,
> > +		 * don't parse second port but only check if exists
> > +		 */
> > +		if (nports =3D=3D XVIP_PAD_SOURCE) {
> > +			dev_dbg(core->dev, "no need to parse source port");
> > +			nports++;
> > +			of_node_put(endpoint);
> > +			continue;
> > +		}
> > +
> > +		ret =3D
> v4l2_fwnode_endpoint_parse(of_fwnode_handle(endpoint),
> > +						 &v4lendpoint);
>=20
> Please set the bus_type to what you need on that port, e.g.
> V4L2_MBUS_CSI2_DPHY, and set the rest to zero.
>=20

Ok will do this too.

> > +		of_node_put(endpoint);
> > +		if (ret)
> > +			return ret;
> > +
> > +		dev_dbg(core->dev, "%s : port %d bus type =3D %d\n",
> > +			__func__, nports, v4lendpoint.bus_type);
> > +
> > +		if (v4lendpoint.bus_type =3D=3D V4L2_MBUS_CSI2_DPHY) {
> > +			dev_dbg(core->dev, "%s : base.port =3D %d base.id =3D
> %d\n",
> > +				__func__, v4lendpoint.base.port,
> > +				v4lendpoint.base.id);
> > +
> > +			dev_dbg(core->dev, "%s : mipi number lanes =3D
> %d\n",
> > +				__func__,
> > +				v4lendpoint.bus.mipi_csi2.num_data_lanes);
> > +
> > +			core->max_num_lanes =3D
> > +				v4lendpoint.bus.mipi_csi2.num_data_lanes;
> > +		}
> > +
> > +		/* Count the number of ports. */
> > +		nports++;
> > +	}
> > +
> > +	if (nports !=3D XCSI_MEDIA_PADS) {
> > +		dev_err(core->dev, "invalid number of ports %u\n", nports);
> > +		return -EINVAL;
> > +	}
> > +
> > +	/* Register interrupt handler */
> > +	irq =3D irq_of_parse_and_map(node, 0);
> > +	ret =3D devm_request_irq(core->dev, irq, xcsi2rxss_irq_handler,
> > +			       IRQF_SHARED, "xilinx-csi2rxss", xcsi2rxss);
> > +	if (ret) {
> > +		dev_err(core->dev, "Err =3D %d Interrupt handler reg
> failed!\n",
> > +			ret);
> > +		return ret;
> > +	}
> > +
> > +	xcsi2rxss_log_ipconfig(xcsi2rxss);
> > +
> > +	return 0;
> > +}
> > +
> > +static int xcsi2rxss_probe(struct platform_device *pdev) {
> > +	struct v4l2_subdev *subdev;
> > +	struct xcsi2rxss_state *xcsi2rxss;
> > +	struct xcsi2rxss_core *core;
> > +	struct resource *res;
> > +	int ret;
> > +
> > +	xcsi2rxss =3D devm_kzalloc(&pdev->dev, sizeof(*xcsi2rxss),
> GFP_KERNEL);
> > +	if (!xcsi2rxss)
> > +		return -ENOMEM;
> > +
> > +	core =3D &xcsi2rxss->core;
> > +	core->dev =3D &pdev->dev;
> > +
> > +	core->clks =3D devm_kmemdup(core->dev, xcsi2rxss_clks,
> > +				  sizeof(xcsi2rxss_clks), GFP_KERNEL);
> > +	if (!core->clks)
> > +		return -ENOMEM;
> > +
> > +	/* Reset GPIO */
> > +	core->rst_gpio =3D devm_gpiod_get_optional(core->dev, "reset",
> > +						 GPIOD_OUT_HIGH);
> > +	if (IS_ERR(core->rst_gpio)) {
> > +		if (PTR_ERR(core->rst_gpio) !=3D -EPROBE_DEFER)
> > +			dev_err(core->dev, "Video Reset GPIO not setup in
> DT");
> > +		return PTR_ERR(core->rst_gpio);
> > +	}
> > +
> > +	mutex_init(&xcsi2rxss->lock);
> > +
> > +	ret =3D xcsi2rxss_parse_of(xcsi2rxss);
> > +	if (ret < 0)
> > +		return ret;
> > +
> > +	res =3D platform_get_resource(pdev, IORESOURCE_MEM, 0);
> > +	core->iomem =3D devm_ioremap_resource(core->dev, res);
> > +	if (IS_ERR(core->iomem))
> > +		return PTR_ERR(core->iomem);
> > +
> > +	core->num_clks =3D ARRAY_SIZE(xcsi2rxss_clks);
>=20
> num_clks never changes, please drop it and  use ARRAY_SIZE(...) instead.

Right. I will drop num_clks from core in next version and use ARRAY_SIZE().

>=20
> > +
> > +	ret =3D clk_bulk_get(core->dev, core->num_clks, core->clks);
> > +	if (ret)
> > +		return ret;
> > +
> > +	ret =3D clk_bulk_prepare_enable(core->num_clks, core->clks);
> > +	if (ret)
> > +		goto err_clk_put;
> > +
> > +	if (core->rst_gpio) {
> > +		gpiod_set_value_cansleep(core->rst_gpio, 1);
> > +		/* minimum of 40 dphy_clk_200M cycles */
> > +		usleep_range(1, 2);
> > +		gpiod_set_value_cansleep(core->rst_gpio, 0);
> > +	}
> > +
> > +	xcsi2rxss_reset(core);
> > +
> > +	/* Initialize V4L2 subdevice and media entity */
> > +	xcsi2rxss->pads[XVIP_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> > +	xcsi2rxss->pads[XVIP_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> > +
> > +	/* Initialize the default format */
> > +	xcsi2rxss_set_default_format(xcsi2rxss);
> > +
> > +	/* Initialize the mbus formats supported */
> > +	xcsi2rxss_init_mbus_fmts(xcsi2rxss);
> > +
> > +	/* Initialize V4L2 subdevice and media entity */
> > +	subdev =3D &xcsi2rxss->subdev;
> > +	v4l2_subdev_init(subdev, &xcsi2rxss_ops);
> > +	subdev->dev =3D &pdev->dev;
> > +	subdev->internal_ops =3D &xcsi2rxss_internal_ops;
> > +	strscpy(subdev->name, dev_name(&pdev->dev), sizeof(subdev-
> >name));
> > +	subdev->flags |=3D V4L2_SUBDEV_FL_HAS_EVENTS |
> V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	subdev->entity.ops =3D &xcsi2rxss_media_ops;
> > +	v4l2_set_subdevdata(subdev, xcsi2rxss);
> > +
> > +	ret =3D media_entity_pads_init(&subdev->entity, XCSI_MEDIA_PADS,
> > +				     xcsi2rxss->pads);
> > +	if (ret < 0)
> > +		goto error;
> > +
> > +	platform_set_drvdata(pdev, xcsi2rxss);
> > +
> > +	ret =3D v4l2_async_register_subdev(subdev);
> > +	if (ret < 0) {
> > +		dev_err(core->dev, "failed to register subdev\n");
> > +		goto error;
> > +	}
> > +
> > +	dev_info(core->dev, "Xilinx CSI2 Rx Subsystem device found!\n");
> > +
> > +	return 0;
> > +error:
> > +	media_entity_cleanup(&subdev->entity);
> > +	mutex_destroy(&xcsi2rxss->lock);
> > +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> > +err_clk_put:
> > +	clk_bulk_put(core->num_clks, core->clks);
> > +	return ret;
> > +}
> > +
> > +static int xcsi2rxss_remove(struct platform_device *pdev) {
> > +	struct xcsi2rxss_state *xcsi2rxss =3D platform_get_drvdata(pdev);
> > +	struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > +	struct v4l2_subdev *subdev =3D &xcsi2rxss->subdev;
> > +
> > +	v4l2_async_unregister_subdev(subdev);
> > +	media_entity_cleanup(&subdev->entity);
> > +	mutex_destroy(&xcsi2rxss->lock);
> > +	clk_bulk_disable_unprepare(core->num_clks, core->clks);
> > +	clk_bulk_put(core->num_clks, core->clks);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct of_device_id xcsi2rxss_of_id_table[] =3D {
> > +	{ .compatible =3D "xlnx,mipi-csi2-rx-subsystem-4.0", },
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(of, xcsi2rxss_of_id_table);
> > +
> > +static struct platform_driver xcsi2rxss_driver =3D {
> > +	.driver =3D {
> > +		.name		=3D "xilinx-csi2rxss",
> > +		.of_match_table	=3D xcsi2rxss_of_id_table,
> > +	},
> > +	.probe			=3D xcsi2rxss_probe,
> > +	.remove			=3D xcsi2rxss_remove,
> > +};
> > +
> > +module_platform_driver(xcsi2rxss_driver);
> > +
> > +MODULE_AUTHOR("Vishal Sagar <vsagar@xilinx.com>");
> > +MODULE_DESCRIPTION("Xilinx MIPI CSI2 Rx Subsystem Driver");
> > +MODULE_LICENSE("GPL v2");
>=20
> This does not align with the SPDX header. v2 or v2+?

I will change the SPDX header to GPL-v2.0 as it is similar to other files i=
n this folder.

Regards
Vishal Sagar

>=20
> --
> Regards,
>=20
> Sakari Ailus
