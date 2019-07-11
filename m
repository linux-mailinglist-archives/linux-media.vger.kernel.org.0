Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8752565384
	for <lists+linux-media@lfdr.de>; Thu, 11 Jul 2019 11:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbfGKJJk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 11 Jul 2019 05:09:40 -0400
Received: from mail-eopbgr720050.outbound.protection.outlook.com ([40.107.72.50]:18102
        "EHLO NAM05-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726997AbfGKJJj (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 11 Jul 2019 05:09:39 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoaipL9x/yh/ZvSMVmRPEgOp4QouWkODjfXjSkryz4tH0s51R/fjL558x+druvxYkgt0lKV6Ay7iSkdO0Nb4UEX6Jm2jjdFRLkiX/F4Izes0xExCrELX4sHlsftLszhpOyfnfYo6g128G6CTYuKQ62FwQzMS4aZbax1g5PBpNqrBmwJp+4k27dxpB5GQ5yZkvahqyhCN9t6JsYbyyFDgkNW07fGDTLbluMunIT0kJjdCQq1NNH97FXhOObJwQnbKzb9PF7aUQ9G6OR8quLbUYK5vSLXl1VQ8v6pXm5qr1txYpHZX3eqmj1CNT60CVL8IAh+FvOiA/PygkQinQC6Zbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CGxB9n3CpPDFIk+JXgdmkCMJlSerRHNQsE+rtyc0qA=;
 b=eDu1LKMO1hCczvLtsJdNH85QVenClxzJMj2Q60A8hhKTeJuTzYga0H15Y6aD5FBuffwE/3mV6XIaPXGphoKdTglO+V//jmGzAGk1JmtPyO6w9oyg5TiuYyMJKm/8mxes5rmeWf0VRb8etaaAW0FJmscaXl0za6n44PT5hsXQ7MipmTyHGzRApAgftwhaHGCJdZRSZxiXv89oY2Cg0ccSYdHJ6Ugecb6UrONvTV3Ay0J2D4N3CwEQXNGhKMnPzpx7G4tgowNxaGyCFvKK/kfHoN9YnXw8v+/ArBCkxd5zY3aB4FkQXFXDNKxuHlONTqHz6NWXR5bESzjbGndXWTp54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=xilinx.com;dmarc=pass action=none
 header.from=xilinx.com;dkim=pass header.d=xilinx.com;arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector1-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6CGxB9n3CpPDFIk+JXgdmkCMJlSerRHNQsE+rtyc0qA=;
 b=zE46ss3vP+FMhaFWz/q4QctvZoMF5Jt7OS5YztF+NRS4y4JWTIeh9p+sj1SiG7plAtpx716ZGI/Vn5f5E9MvR+B/6C8LYu7wmS/5KeDUiyGfUvoN6s+Jufaka75YKFajEPMoGo/ykiV4W5sEdoSy/W8rw4T0f3ZEa6ViXKur83I=
Received: from CH2PR02MB6088.namprd02.prod.outlook.com (52.132.228.94) by
 CH2PR02MB6039.namprd02.prod.outlook.com (10.255.156.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2073.10; Thu, 11 Jul 2019 09:09:33 +0000
Received: from CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::456d:ace7:7c55:8639]) by CH2PR02MB6088.namprd02.prod.outlook.com
 ([fe80::456d:ace7:7c55:8639%3]) with mapi id 15.20.2052.020; Thu, 11 Jul 2019
 09:09:33 +0000
From:   Vishal Sagar <vsagar@xilinx.com>
To:     Sakari Ailus <sakari.ailus@iki.fi>
CC:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vishal Sagar <vishal.sagar@xilinx.com>,
        Hyun Kwon <hyunk@xilinx.com>,
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
Subject: RE: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Topic: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
 Subsystem driver
Thread-Index: AQHVGfMaAKfbOTEUHkuDr9l8JJ/e/6aNBicAgAKUiNCAEf49AIAaFFmg
Date:   Thu, 11 Jul 2019 09:09:33 +0000
Message-ID: <CH2PR02MB6088CAF1D2DE08B71B57B668A7F30@CH2PR02MB6088.namprd02.prod.outlook.com>
References: <1559555971-193235-1-git-send-email-vishal.sagar@xilinx.com>
 <1559555971-193235-3-git-send-email-vishal.sagar@xilinx.com>
 <20190605124851.xr2hmgyoe46q6xud@kekkonen.localdomain>
 <CH2PR02MB60889F3BF23FD96BF11053A2A7100@CH2PR02MB6088.namprd02.prod.outlook.com>
 <20190618145922.sq4jovxoz2khs3tq@valkosipuli.retiisi.org.uk>
In-Reply-To: <20190618145922.sq4jovxoz2khs3tq@valkosipuli.retiisi.org.uk>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=vsagar@xilinx.com; 
x-originating-ip: [149.199.50.133]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3e636a22-b177-4af4-81f9-08d705df7d95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:CH2PR02MB6039;
x-ms-traffictypediagnostic: CH2PR02MB6039:
x-microsoft-antispam-prvs: <CH2PR02MB60399A90C22220BAC444E597A7F30@CH2PR02MB6039.namprd02.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-forefront-prvs: 0095BCF226
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(376002)(346002)(366004)(136003)(396003)(39860400002)(199004)(189003)(13464003)(66476007)(71190400001)(66066001)(55016002)(76116006)(66556008)(66946007)(6436002)(33656002)(66446008)(14454004)(229853002)(54906003)(7696005)(2906002)(71200400001)(25786009)(53936002)(64756008)(99286004)(6116002)(3846002)(7736002)(74316002)(6246003)(305945005)(81156014)(7416002)(4326008)(81166006)(9686003)(52536014)(5660300002)(14444005)(256004)(76176011)(186003)(6506007)(53546011)(478600001)(26005)(446003)(476003)(486006)(11346002)(316002)(86362001)(6916009)(8936002)(102836004)(68736007)(8676002);DIR:OUT;SFP:1101;SCL:1;SRVR:CH2PR02MB6039;H:CH2PR02MB6088.namprd02.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: xilinx.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: +bKkSRatMO+R/F0T2bAt1P4tb6t/d/51GnJqvnewgGptTK9/hpNnl71kXcPJAf/q4VwQ/sV/fFWapQiyH3kw95Fs7HLPGWZNM3u24OO6Q56Nw+0ieYvOj/oCPBWrKK7Mf9TsJ6bgncQ14NepvTwRMcQk0ITyHnJtXpcXBkf+bI69jaCTmt6BWbbbYgT0oGjtNO9Bu1qGyY1ng1LHF0k54AsqM/dnk/pVLlKznzGcbnJVknvJgsY1X7/JxGVF7PKptJYo+nOfbGu2rbDsK93xKNuzT0eBaNGkyzjK5gQSbGydhTqk7TUNz08o8NWgO7xCSVIDjIDy6CInj4GxSP6tHeONj9jFggSdtQXNeiyqAkB1T92I+wA+5vm46+Ujm9jAcarzssjeyYnEkAHqQ4rbFD5QOu9iFJof/r/mJUHmv5Q=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e636a22-b177-4af4-81f9-08d705df7d95
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2019 09:09:33.7161
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

> -----Original Message-----
> From: Sakari Ailus [mailto:sakari.ailus@iki.fi]
> Sent: Tuesday, June 18, 2019 8:29 PM
> To: Vishal Sagar <vsagar@xilinx.com>
> Cc: Sakari Ailus <sakari.ailus@linux.intel.com>; Vishal Sagar
> <vishal.sagar@xilinx.com>; Hyun Kwon <hyunk@xilinx.com>;
> laurent.pinchart@ideasonboard.com; mchehab@kernel.org;
> robh+dt@kernel.org; mark.rutland@arm.com; Michal Simek
> <michals@xilinx.com>; linux-media@vger.kernel.org;
> devicetree@vger.kernel.org; hans.verkuil@cisco.com; linux-arm-
> kernel@lists.infradead.org; linux-kernel@vger.kernel.org; Dinesh Kumar
> <dineshk@xilinx.com>; Sandip Kothari <sandipk@xilinx.com>; Luca Ceresoli
> <luca@lucaceresoli.net>; Jacopo Mondi <jacopo@jmondi.org>
> Subject: Re: [PATCH v8 2/2] media: v4l: xilinx: Add Xilinx MIPI CSI-2 Rx
> Subsystem driver
>=20
> Hi Vishal,
>=20
> On Fri, Jun 07, 2019 at 07:11:47AM +0000, Vishal Sagar wrote:
> ...
> > > > +/**
> > > > + * xcsi2rxss_s_ctrl - This is used to set the Xilinx MIPI CSI-2 V4=
L2 controls
> > > > + * @ctrl: V4L2 control to be set
> > > > + *
> > > > + * This function is used to set the V4L2 controls for the Xilinx M=
IPI
> > > > + * CSI-2 Rx Subsystem. It is used to set the active lanes in the s=
ystem.
> > > > + * The event counters can be reset.
> > > > + *
> > > > + * Return: 0 on success, errors otherwise
> > > > + */
> > > > +static int xcsi2rxss_s_ctrl(struct v4l2_ctrl *ctrl)
> > > > +{
> > > > +     struct xcsi2rxss_state *xcsi2rxss =3D
> > > > +             container_of(ctrl->handler, struct xcsi2rxss_state,
> > > > +                          ctrl_handler);
> > > > +     struct xcsi2rxss_core *core =3D &xcsi2rxss->core;
> > > > +     int ret =3D 0;
> > > > +
> > > > +     mutex_lock(&xcsi2rxss->lock);
> > > > +
> > > > +     switch (ctrl->id) {
> > > > +     case V4L2_CID_XILINX_MIPICSISS_ACT_LANES:
> > > > +             /*
> > > > +              * This will be called only when "Enable Active Lanes=
" parameter
> > > > +              * is set in design
> > > > +              */
> > >
> > > You generally get the number of lanes from firmware. There's no need =
to
> add
> > > a control for it.
> > >
> >
> > I don't understand what firmware means here. There is no other code
> running.
> > I don't see how to modify the number of lanes apart from using v4l cont=
rol.
>=20
> It's not the user that provides this information. Again, if you want this
> feature right from the time the driver is merged to mainline, then rebase
> the set on top of Jacopo's frame descriptor set. But it may take a while.
>=20

Thanks for reviewing again and sharing this.=20
Since Jacopo's frame descriptor set will take a while, I will remove this c=
ontrol for now from the driver so that the driver can get into upstream.

Regards
Vishal Sagar

> >
> > > > +             if (core->enable_active_lanes) {
> > > > +                     u32 active_lanes;
> > > > +
> > > > +                     xcsi2rxss_clr_and_set(core, XCSI_PCR_OFFSET,
> > > > +                                           XCSI_PCR_ACTLANES_MASK,
> > > > +                                           ctrl->val - 1);
> > > > +                     /*
> > > > +                      * This delay is to allow the value to reflec=
t as write
> > > > +                      * and read paths are different.
> > > > +                      */
> > > > +                     udelay(1);
> > > > +                     active_lanes =3D xcsi2rxss_read(core, XCSI_PC=
R_OFFSET);
> > > > +                     active_lanes &=3D XCSI_PCR_ACTLANES_MASK;
> > > > +                     active_lanes++;
> > > > +                     if (active_lanes !=3D ctrl->val)
> > > > +                             dev_info(core->dev, "RxByteClkHS abse=
nt\n");
> > > > +                     dev_dbg(core->dev, "active lanes =3D %d\n", c=
trl->val);
> > > > +             } else {
> > > > +                     ret =3D -EINVAL;
> > > > +             }
> > > > +             break;
> > > > +     case V4L2_CID_XILINX_MIPICSISS_RESET_COUNTERS:
> > > > +             xcsi2rxss_reset_event_counters(xcsi2rxss);
> > > > +             break;
> > > > +     default:
> > > > +             ret =3D -EINVAL;
> > > > +             break;
> > > > +     }
> > > > +
> > > > +     mutex_unlock(&xcsi2rxss->lock);
> > > > +
> > > > +     return ret;
> > > > +}
>=20
> --
> Regards,
>=20
> Sakari Ailus
