Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 761C06CF9DA
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 05:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229704AbjC3D6Z (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Mar 2023 23:58:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229682AbjC3D6X (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Mar 2023 23:58:23 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D338C19BA
        for <linux-media@vger.kernel.org>; Wed, 29 Mar 2023 20:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680148700; x=1711684700;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bsHLr+AhW6mRiCKPsmESPoOxeeMBUCzOe8FWBpLdZjE=;
  b=g76zZ07Q9/+3fv6BRQP8aPzd2BiTJR1gFscxHqhkA+ReJxmnCo88nID8
   wwgEgor0z3v20uD/Tgwdv4ccUuIHM46U9ZmyHjCjzPQ3lOrI2F7E2JAKu
   0Bcv4e28+l+CtKH0e3LOjxUeOLcF+TC8FOfZG8uIlig7tcQIUmBGGPkoa
   vPAqo4C1pC3AOEY9kl499RJnwte3b+gUNmnlt4zaf7xs++N1E1bcmIvTl
   PYMCnjkqNhncvIv6oMdbnREqnAFE9aQH+GdJZVKy/kNRCNCVCptCPjL9L
   RufeqyinBrnL2ViUiL4vyBfHzMX55vqe4AmU0Z42E/qYB+F04kkc9q76g
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="321447288"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="321447288"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 20:58:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="795510859"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="795510859"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga002.fm.intel.com with ESMTP; 29 Mar 2023 20:58:19 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 20:58:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 29 Mar 2023 20:58:19 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 29 Mar 2023 20:58:19 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 29 Mar 2023 20:58:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kkJ0hA/oIzvZT/oUgBInWGhQhUP5VSWFVoMoUcmJ2iC/CmKVZzZ12g9iS+ojgW4LJfcDMpQAHZllMMTNDnRVB+KM47KFkdheQ67GwcMXZgXxMFgFE/c+qz2DMMwmRRlJNLzXzSRClUZUZqe4Bl1jVH5alslG2dlEsI94LjxG4kzGF/gBCfRPbIVn7+Dcgh6xC/XjGRxLoxRtSnNakJ6amVOGCB64zNgM7FDIdTumKPsWOCu2M2/qdnkxyFBKOipN4ZoFCLuNZKr6KfcocVhyvmwP3QMUOfVIhSgii52aoBd5fmu16ZnZsnyWyB0tDs1NLGBjsyrEvihQYRUb/lb4MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PeZGhXq01YvbSVQ0j6Px8hXCtNe+YWmI70KAK8EcKWI=;
 b=LLchfrmX9vkzFiKNWvkPdb/9WAUywMjk7+3bENBDtHjDNlGRKFhUedISnOcQPrYgRSGJhAEqS1rOpRZMVlPqrHaXYQ9IX0nwqq3SsRdc0leNl5XqFPjguxxrIQ7AajuNWc93cfjOe9txiDRnjfk+7zweTy6mAuQqQB/BvNzQiZqdYRPOrZO12tgLaVf/9Eq1sxsrIwENuRwNydPHYrOAj7qqMiUig/6xFLGXYDms+7fYCV9O+/1sGYR5fzv5JNrkwaZXRqB9z2guJmoAkKa4ojVcxLpPY+hA9nlCN95Ap9Ogxtw1pNqNsjXN2ed4s9Pf5RU0nXY3EQJ6qc7M0Iu8Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by MN0PR11MB6205.namprd11.prod.outlook.com (2603:10b6:208:3c7::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Thu, 30 Mar
 2023 03:58:10 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::933f:f96c:bec5:5ef3]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::933f:f96c:bec5:5ef3%7]) with mapi id 15.20.6222.035; Thu, 30 Mar 2023
 03:58:10 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
Thread-Topic: [PATCH v3 1/3] media: pci: intel: ivsc: Add CSI submodule
Thread-Index: AQHZYHSkX1ox+ylYPE6tsqc6dpQss68RdZ0AgAE+G2A=
Date:   Thu, 30 Mar 2023 03:58:10 +0000
Message-ID: <DM6PR11MB431638656606F40EB8B1DC468D8E9@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-2-git-send-email-wentong.wu@intel.com>
 <ZCP7an1Kclm95hnL@kekkonen.localdomain>
In-Reply-To: <ZCP7an1Kclm95hnL@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|MN0PR11MB6205:EE_
x-ms-office365-filtering-correlation-id: 26b20fc2-207f-4a0f-b584-08db30d2fa38
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: f0/iOxiei+kJL9a0aehQ1GQwoZND5vqwCxXtaFX/czhlr64sfURePMqbIHhzVDGyL6KPkjUjMHTmtYASuNlrULQ/63PMJrKKVSL5k3FVR5ZkgMIaMY+lfdq35Wi2nTolAxT4K1EHA0FJVNcn3H9ayR7jjTY1QeQaKwdhz5x3nSkE4fAJd7sgNB0bvHA5wRLv3VHRBr2rzc7bf3DnpF05dPLtWD93ulbYQKM1EnPYVrWLeljZ7dLltMzSVwSCHcRYNOz7PP+/eGot6uAkkVK/tDeYEi6QIIe7UOA2tZU18YltUkNkOZmtzAkZlxx6JgxtNZmsHAzXBjJhmb8F4KIUaSwFB8HTZqTOel4mJh+7I58Q3y1jf8DoIuuzuQx0MCHuVIsE/encb8PTf5Gobl21NQ0c0l0kSMU/tDJfCMcdR3gR9/OW4xS+HtPBe2ekg/BI0XiSeoVZY+NaK/E2CaytfPLyovvC6gPsu4MRFm+hD6hzS/yyGT6se4tAYL12bXT612v//831vHv9c/aWw9K0K7WnnWMJsiUpkB11HCQqRZBAE4LP1XnKAcbAolQjHKPzYpHkTN1UHNNiVK8k7jIXADSJylYcPlrF64C49izzgGhf7nHepgb7gJbb8r5yRii7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199021)(7696005)(55016003)(6916009)(71200400001)(66899021)(4326008)(41300700001)(76116006)(316002)(8676002)(66446008)(478600001)(66556008)(64756008)(66476007)(38100700002)(66946007)(54906003)(30864003)(186003)(5660300002)(33656002)(86362001)(38070700005)(9686003)(83380400001)(2906002)(122000001)(82960400001)(52536014)(6506007)(26005)(8936002)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?MXhmflbhLIPF010BsYzdV1W12HqDvhsutGWjidTrGgczcYGgNofFMIm0e7yc?=
 =?us-ascii?Q?AE8/Nvz/eeQtnLPl3sAC3MME96MaSxI+Ts83REH1hfQqHy8adD9sK1HVj18m?=
 =?us-ascii?Q?ysFsy9ODePHp4DKmQU8GjhlttU1I27P0VD8UzzWgpQQhVuPwZ3E1kAw/RfcN?=
 =?us-ascii?Q?ufLLe8OwAM7P38e7copC2N77HCZLCN8D8782LXxiK7amUlRRemi8tcj5psBs?=
 =?us-ascii?Q?PrB4YtIeMp+KAtLs5PIBGgwbKjFXNeC+ltgdNOvTYkvrtqur3IrHg35+sCuc?=
 =?us-ascii?Q?7a0Mit/qyS+jj9apqgbExu5Mh2LLp7CWbmZa3vRwcK1v0Z8JNXUigKFnBdHo?=
 =?us-ascii?Q?Uxy88YE3nKHm9zn7NRRWvjc3YQvUSlQPgMlgIuHZxQ6HPbdN0GwVr2S2mvbf?=
 =?us-ascii?Q?bCH0JuNiy5n1WjlRonCve1vytxRf58/DAjm0ajofWH3vVAKRJOM4ZX5RcCPI?=
 =?us-ascii?Q?KdybhOTv/1rRQ2RNTYkHNhT0Tjdc3zzJL8iZ6wMS8dxT5VODztRa5eULlDyQ?=
 =?us-ascii?Q?LXBzJXzVZHz8SZ3rK9+Lxpt5+uL7zp8Li4bUMs+ZNrLan6WhRBWOd8NvKG+U?=
 =?us-ascii?Q?+pDPQ1oTaqY2M5lMj++dZr+NKi6SYrXXaXNWovJL5yBXTeBeTJed3y2bkBRN?=
 =?us-ascii?Q?bR/zFvyMTfWHOSoM9tRzhT1AxeoqBbQ+CwvFT7tclDS9Fiz0u2f8Wd/tZPWz?=
 =?us-ascii?Q?5+EH2wDB478g13MNNSJaFQvAHM8l9DqWizX2lokAoueZMZNwh1HSbaGQJBcX?=
 =?us-ascii?Q?3T93/Q78Vs01anaMDiTHGy0wz+r0+8iiDjQYg2anIDPeCCs6nz19qvpzLEVL?=
 =?us-ascii?Q?zUdy/RB26vToNK5lzV2UYKQ0yKdTgCwO5ydFk4T4Q4eFiQFsZRH5Xing+gHg?=
 =?us-ascii?Q?Pr83nKzajLERsa0krh5KIQm7um4DbhoeqEx6BIE5GS9LyHUhP4iZK3DYAacS?=
 =?us-ascii?Q?syRKq9LtU3oS0u4HgaucEoRoB0k5/HmpM1Ih+h02tUF2JAG7+g2iLK5baLVf?=
 =?us-ascii?Q?25ch1v5RpUq521GUle8FCjY5TOnmg3BBtoadlUxSNaxI8I8KqjHuBOB34Y9N?=
 =?us-ascii?Q?3kbOG3OBz2LodB0rl7jMnP4eK1hEVgBym/grjUnav1XGIceeyQ+XLelo/Ehx?=
 =?us-ascii?Q?bLfscK77l63U08rMRXvI8Es7OANMR02/akWgI6FEB0nW4oFQSI5jrRp/guDT?=
 =?us-ascii?Q?Qrryskijp7jKa6fz8z3sS13cEwyeACR5dubd/DWvDBh3XZ6stK+gYfWinCq7?=
 =?us-ascii?Q?8z755vijZFwsGwKDf5VffO7GmI/3Mh1LcYw1PgxvHiLxLagytxuyH2gwwpoy?=
 =?us-ascii?Q?oVdSYw9w65c78Hc2PsazKj3tHmVXUxCAUldDvCugdvNw3MoFBMOJ9z5+veSO?=
 =?us-ascii?Q?LtV5iTXwqoPkmyRSdG3HnRbFY2s6xtqq/zkxBdrAG9PLVxwUgvbFp+bpUzvq?=
 =?us-ascii?Q?0dS7bGekF/+/o10V8SjmoNliyDxWojRXgWr4v/LGSthUM4Wb2WH3xd6qDWJf?=
 =?us-ascii?Q?zKuFH0WJIpffdWyt9K8sjTajl6B6A4dXvN3R1W6N2i+Kds8DHfTftL7M1MH8?=
 =?us-ascii?Q?myw3Th1OhqzXZxwvzP/cw757UsYZLFFW88nJbwVT?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 26b20fc2-207f-4a0f-b584-08db30d2fa38
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 03:58:10.2027
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gcEDT7+kJy59eDiNbNBhGPrShSSK6KrG8p0XayDF7JTzbIBvYcm+AkhdMiW9PQgkP5xO5qd5qqgIt1KVizd5Pg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6205
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, March 29, 2023 4:49 PM
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 02:23:06PM +0800, Wentong Wu wrote:
> > CSI is a submodule of IVSC which can route camera sensor data to the
> > outbound MIPI CSI-2 interface.
> >
> > The interface communicating with firmware is via MEI. There is a
> > separate MEI UUID, which this driver uses to enumerate.
> >
> > To route camera sensor data to host, the information of link frequency
> > and number of data lanes is sent to firmware by sending MEI command
> > when starting stream.
> >
> > CSI also provides a privacy mode. When privacy mode is turned on,
> > camera sensor can't be used. This means that both IVSC and host Image
> > Processing Unit(IPU) can't get image data. And when this mode is
> > turned on, host Image Processing Unit(IPU) driver is informed via v4l2
> > control callback, so that user can be notified.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > ---
> >  drivers/media/pci/Kconfig                 |   1 +
> >  drivers/media/pci/intel/Makefile          |   2 +
> >  drivers/media/pci/intel/ivsc/Kconfig      |  12 +
> >  drivers/media/pci/intel/ivsc/Makefile     |   7 +
> >  drivers/media/pci/intel/ivsc/csi_bridge.c | 332 +++++++++++++
> > drivers/media/pci/intel/ivsc/csi_bridge.h | 122 +++++
> >  drivers/media/pci/intel/ivsc/mei_csi.c    | 775
> ++++++++++++++++++++++++++++++
> >  7 files changed, 1251 insertions(+)
> >  create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
> >  create mode 100644 drivers/media/pci/intel/ivsc/Makefile
> >  create mode 100644 drivers/media/pci/intel/ivsc/csi_bridge.c
> >  create mode 100644 drivers/media/pci/intel/ivsc/csi_bridge.h
> >  create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
>=20
> I'm commenting just mei_csi this time...
>=20
> > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > new file mode 100644
> > index 0000000..6a01537
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > @@ -0,0 +1,775 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Intel Corporation. All rights reserved.
> > + * Intel Visual Sensing Controller CSI Linux driver  */
> > +
> > +/*
> > + * To set ownership of CSI-2 link and to configure CSI-2 link, there
> > + * are specific commands, which are sent via MEI protocol. The send
> > + * command function uses "completion" as a synchronization mechanism.
> > + * The response for command is received via a mei callback which
> > +wakes
> > + * up the caller. There can be only one outstanding command at a time.
> > + */
> > +
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/kernel.h>
> > +#include <linux/math64.h>
> > +#include <linux/mei_cl_bus.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/units.h>
> > +#include <linux/uuid.h>
> > +#include <linux/workqueue.h>
> > +
> > +#include <media/v4l2-async.h>
> > +#include <media/v4l2-ctrls.h>
> > +#include <media/v4l2-fwnode.h>
> > +#include <media/v4l2-subdev.h>
> > +
> > +#define MEI_CSI_DRIVER_NAME "ivsc_csi"
> > +
> > +/* the 5s used here is based on experiment */ #define CSI_CMD_TIMEOUT
> > +(5 * HZ)
> > +/* to setup CSI-2 link an extra delay needed and determined
> > +experimentally */ #define CSI_FW_READY_DELAY_MS 100
> > +/* link frequency unit is 100kHz */
> > +#define CSI_LINK_FREQ(x) ((u32)(div_u64(x, 100 * HZ_PER_KHZ)))
> > +
> > +/*
> > + * identify the command id supported by firmware
> > + * IPC, as well as the privacy notification id
> > + * used when processing privacy event.
> > + */
> > +enum csi_cmd_id {
> > +	/* used to set csi ownership */
> > +	CSI_SET_OWNER =3D 0,
> > +
> > +	/* used to configure CSI-2 link */
> > +	CSI_SET_CONF =3D 2,
> > +
> > +	/* privacy notification id used when privacy state changes */
> > +	CSI_PRIVACY_NOTIF =3D 6,
> > +};
> > +
> > +/* CSI-2 link ownership definition */ enum csi_link_owner {
> > +	CSI_LINK_IVSC,
> > +	CSI_LINK_HOST,
> > +};
> > +
> > +/* privacy status definition */
> > +enum ivsc_privacy_status {
> > +	CSI_PRIVACY_OFF,
> > +	CSI_PRIVACY_ON,
> > +	CSI_PRIVACY_MAX,
> > +};
> > +
> > +enum csi_pads {
> > +	CSI_PAD_SOURCE,
> > +	CSI_PAD_SINK,
> > +	CSI_NUM_PADS
> > +};
> > +
> > +/* configuration of the CSI-2 link between host and IVSC */ struct
> > +csi_link_cfg {
> > +	/* number of data lanes used on the CSI-2 link */
> > +	u32 nr_of_lanes;
> > +
> > +	/* frequency of the CSI-2 link */
> > +	u32 link_freq;
> > +
> > +	/* for future use */
> > +	u32 rsvd[2];
> > +} __packed;
> > +
> > +/* CSI command structure */
> > +struct csi_cmd {
> > +	u32 cmd_id;
> > +	union _cmd_param {
> > +		u32 param;
> > +		struct csi_link_cfg conf;
> > +	} param;
> > +} __packed;
> > +
> > +/* CSI notification structure */
> > +struct csi_notif {
> > +	u32 cmd_id;
> > +	int status;
> > +	union _resp_cont {
> > +		u32 cont;
> > +		struct csi_link_cfg conf;
> > +	} cont;
> > +} __packed;
> > +
> > +struct mei_csi {
> > +	struct mei_cl_device *cldev;
> > +
> > +	/* command response */
> > +	struct csi_notif cmd_response;
> > +	/* used to wait for command response from firmware */
> > +	struct completion cmd_completion;
> > +	/* protect command download */
> > +	struct mutex lock;
> > +
> > +	struct v4l2_subdev subdev;
> > +	struct v4l2_subdev *remote;
> > +	struct v4l2_async_notifier notifier;
> > +	struct v4l2_ctrl_handler ctrl_handler;
> > +	struct v4l2_ctrl *privacy_ctrl;
> > +	unsigned int remote_pad;
> > +	/* start streaming or not */
> > +	int streaming;
> > +
> > +	struct media_pad pads[CSI_NUM_PADS];
> > +	struct v4l2_mbus_framefmt format_mbus[CSI_NUM_PADS];
> > +
> > +	/* number of data lanes used on the CSI-2 link */
> > +	u32 nr_of_lanes;
> > +	/* frequency of the CSI-2 link */
> > +	u64 link_freq;
> > +
> > +	/* privacy status */
> > +	enum ivsc_privacy_status status;
> > +};
> > +
> > +static const struct v4l2_mbus_framefmt mei_csi_format_mbus_default =3D=
 {
> > +	.width =3D 1,
> > +	.height =3D 1,
> > +	.code =3D MEDIA_BUS_FMT_Y8_1X8,
> > +	.field =3D V4L2_FIELD_NONE,
> > +};
> > +
> > +int csi_bridge_init(struct mei_cl_device *csi_dev);
> > +
> > +static inline struct mei_csi *notifier_to_csi(struct
> > +v4l2_async_notifier *n) {
> > +	return container_of(n, struct mei_csi, notifier); }
> > +
> > +static inline struct mei_csi *sd_to_csi(struct v4l2_subdev *sd) {
> > +	return container_of(sd, struct mei_csi, subdev); }
> > +
> > +/* send a command to firmware and mutex must be held by caller */
> > +static int mei_csi_send(struct mei_csi *csi, u8 *buf, size_t len) {
> > +	struct csi_cmd *cmd =3D (struct csi_cmd *)buf;
> > +	int ret;
> > +
> > +	reinit_completion(&csi->cmd_completion);
> > +
> > +	ret =3D mei_cldev_send(csi->cldev, buf, len);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	ret =3D wait_for_completion_killable_timeout(&csi->cmd_completion,
> > +						   CSI_CMD_TIMEOUT);
> > +	if (ret < 0) {
> > +		goto out;
> > +	} else if (!ret) {
> > +		ret =3D -ETIMEDOUT;
> > +		goto out;
> > +	}
> > +
> > +	/* command response status */
> > +	ret =3D csi->cmd_response.status;
> > +	if (ret) {
> > +		ret =3D -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	if (csi->cmd_response.cmd_id !=3D cmd->cmd_id)
> > +		ret =3D -EINVAL;
> > +
> > +out:
> > +	return ret;
> > +}
> > +
> > +/* set CSI-2 link ownership */
> > +static int csi_set_link_owner(struct mei_csi *csi, enum
> > +csi_link_owner owner) {
> > +	struct csi_cmd cmd =3D { 0 };
> > +	size_t cmd_size;
> > +	int ret;
> > +
> > +	cmd.cmd_id =3D CSI_SET_OWNER;
> > +	cmd.param.param =3D owner;
> > +	cmd_size =3D sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
>=20
> In some cases you're using memset and in others not. If you don't need me=
mset,
> I'd prefer assigning the fields in variable declaration instead.

The declaration will be like below, but it will break reverse x-mas tree st=
yle.

struct csi_cmd cmd =3D { 0 };
size_t cmd_size =3D sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
int ret;


>=20
> > +
> > +	mutex_lock(&csi->lock);
> > +
> > +	ret =3D mei_csi_send(csi, (u8 *)&cmd, cmd_size);
> > +
> > +	mutex_unlock(&csi->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +/* configure CSI-2 link between host and IVSC */ static int
> > +csi_set_link_cfg(struct mei_csi *csi) {
> > +	struct csi_cmd cmd =3D { 0 };
> > +	size_t cmd_size;
> > +	int ret;
> > +
> > +	cmd.cmd_id =3D CSI_SET_CONF;
> > +	cmd.param.conf.nr_of_lanes =3D csi->nr_of_lanes;
> > +	cmd.param.conf.link_freq =3D CSI_LINK_FREQ(csi->link_freq);
> > +	cmd_size =3D sizeof(cmd.cmd_id) + sizeof(cmd.param.conf);
>=20
> Ditto.
>=20
> > +
> > +	mutex_lock(&csi->lock);
> > +
> > +	ret =3D mei_csi_send(csi, (u8 *)&cmd, cmd_size);
> > +	/*
> > +	 * wait configuration ready if download success. placing
> > +	 * delay under mutex is to make sure current command flow
> > +	 * completed before starting a possible new one.
> > +	 */
> > +	if (!ret)
> > +		msleep(CSI_FW_READY_DELAY_MS);
> > +
> > +	mutex_unlock(&csi->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +/* callback for receive */
> > +static void mei_csi_rx(struct mei_cl_device *cldev) {
> > +	struct mei_csi *csi =3D mei_cldev_get_drvdata(cldev);
> > +	struct csi_notif notif =3D { 0 };
> > +	int ret;
> > +
> > +	ret =3D mei_cldev_recv(cldev, (u8 *)&notif, sizeof(notif));
> > +	if (ret < 0) {
> > +		dev_err(&cldev->dev, "recv error: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	switch (notif.cmd_id) {
> > +	case CSI_PRIVACY_NOTIF:
> > +		if (notif.cont.cont < CSI_PRIVACY_MAX) {
> > +			csi->status =3D notif.cont.cont;
> > +			v4l2_ctrl_s_ctrl(csi->privacy_ctrl, csi->status);
> > +		}
> > +		break;
> > +	case CSI_SET_OWNER:
> > +	case CSI_SET_CONF:
> > +		memcpy(&csi->cmd_response, &notif, ret);
> > +
> > +		complete(&csi->cmd_completion);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +static int mei_csi_pre_streamon(struct v4l2_subdev *sd, u32 flags) {
> > +	struct v4l2_querymenu qm =3D { .id =3D V4L2_CID_LINK_FREQ, };
> > +	struct v4l2_mbus_config mbus_config =3D { 0 };
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +	struct v4l2_ctrl *ctrl;
> > +	int ret =3D 0;
> > +
> > +	if (!csi->remote)
> > +		return -ENODEV;
> > +
> > +	ret =3D v4l2_subdev_call(csi->remote, pad, get_mbus_config,
> > +			       csi->remote_pad, &mbus_config);
> > +	if (ret)
> > +		return ret;
>=20
> You're already parsing the endpoint in probe(). Do you need this, assumin=
g the
> sensor has a static lane configuration? Virtually all do.

When parsing remote endpoint, just get num_data_lanes by
v4l2_fwnode_endpoint_alloc_parse?

>=20
> Could this all be done via the s_stream() op instead?

We don't need csi2 link freq and lane number when s_steam(0)

>=20
> > +
> > +	if (mbus_config.type !=3D V4L2_MBUS_CSI2_DPHY)
> > +		return -EINVAL;
> > +
> > +	csi->nr_of_lanes =3D mbus_config.bus.mipi_csi2.num_data_lanes;
> > +
> > +	ctrl =3D v4l2_ctrl_find(csi->remote->ctrl_handler, V4L2_CID_LINK_FREQ=
);
> > +	if (!ctrl)
> > +		return -EINVAL;
> > +	qm.index =3D v4l2_ctrl_g_ctrl(ctrl);
> > +
> > +	ret =3D v4l2_querymenu(csi->remote->ctrl_handler, &qm);
> > +	if (ret)
> > +		return ret;
> > +
> > +	csi->link_freq =3D qm.value;
> > +
> > +	return ret;
> > +}
> > +
> > +static int mei_csi_set_stream(struct v4l2_subdev *sd, int enable) {
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +	int ret =3D 0;
> > +
> > +	if (enable && csi->streaming =3D=3D 0) {
> > +		/* switch CSI-2 link to host */
> > +		ret =3D csi_set_link_owner(csi, CSI_LINK_HOST);
> > +		if (ret < 0)
> > +			goto err;
> > +
> > +		/* configure CSI-2 link */
> > +		ret =3D csi_set_link_cfg(csi);
> > +		if (ret < 0)
> > +			goto err;
> > +
> > +		ret =3D v4l2_subdev_call(csi->remote, video, s_stream, 1);
> > +		if (ret)
> > +			goto err;
> > +	} else if (!enable && csi->streaming =3D=3D 1) {
> > +		v4l2_subdev_call(csi->remote, video, s_stream, 0);
> > +
> > +		/* switch CSI-2 link to IVSC */
> > +		ret =3D csi_set_link_owner(csi, CSI_LINK_IVSC);
> > +		if (ret < 0)
> > +			goto err;
>=20
> I'd complain (e.g. dev_warn()) but return zero in this case. There's not =
much if
> anything the caller can do with this.

ack
>=20
> > +	}
> > +
> > +	csi->streaming =3D enable;
> > +
> > +err:
> > +	return ret;
> > +}
> > +
> > +static struct v4l2_mbus_framefmt *
> > +mei_csi_get_pad_format(struct v4l2_subdev *sd,
> > +		       struct v4l2_subdev_state *sd_state,
> > +		       unsigned int pad, u32 which) {
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +
> > +	switch (which) {
> > +	case V4L2_SUBDEV_FORMAT_TRY:
> > +		return v4l2_subdev_get_try_format(sd, sd_state, pad);
> > +	case V4L2_SUBDEV_FORMAT_ACTIVE:
> > +		return &csi->format_mbus[pad];
> > +	default:
> > +		return NULL;
> > +	}
> > +}
> > +
> > +static int mei_csi_init_cfg(struct v4l2_subdev *sd,
> > +			    struct v4l2_subdev_state *sd_state) {
> > +	struct v4l2_mbus_framefmt *mbusformat;
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +	unsigned int i;
> > +
> > +	mutex_lock(&csi->lock);
> > +
> > +	for (i =3D 0; i < sd->entity.num_pads; i++) {
> > +		mbusformat =3D v4l2_subdev_get_try_format(sd, sd_state, i);
> > +		*mbusformat =3D mei_csi_format_mbus_default;
> > +	}
> > +
> > +	mutex_unlock(&csi->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static int mei_csi_get_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_state *sd_state,
> > +			   struct v4l2_subdev_format *format) {
> > +	struct v4l2_mbus_framefmt *mbusformat;
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +
> > +	mutex_lock(&csi->lock);
> > +
> > +	mbusformat =3D mei_csi_get_pad_format(sd, sd_state, format->pad,
> > +					    format->which);
> > +	if (mbusformat)
> > +		format->format =3D *mbusformat;
> > +
> > +	mutex_unlock(&csi->lock);
> > +
> > +	return 0;
> > +}
>=20
> It'd be nice to have also enum_mbus_code support. Video mux of course did=
n't
> have this either. Something that could be done in the framework, includin=
g
> validating the mbus format.

Sorry, you mean the default MEDIA_BUS_FMT_Y8_1X8?

>=20
> > +
> > +static int mei_csi_set_fmt(struct v4l2_subdev *sd,
> > +			   struct v4l2_subdev_state *sd_state,
> > +			   struct v4l2_subdev_format *format) {
> > +	struct v4l2_mbus_framefmt *source_mbusformat;
> > +	struct v4l2_mbus_framefmt *mbusformat;
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +	struct media_pad *pad;
> > +
> > +	mbusformat =3D mei_csi_get_pad_format(sd, sd_state, format->pad,
> > +					    format->which);
> > +	if (!mbusformat)
> > +		return -EINVAL;
> > +
> > +	source_mbusformat =3D mei_csi_get_pad_format(sd, sd_state,
> > +						   CSI_PAD_SOURCE,
> > +						   format->which);
> > +	if (!source_mbusformat)
> > +		return -EINVAL;
> > +
> > +	v4l_bound_align_image(&format->format.width, 1, 65536, 0,
> > +			      &format->format.height, 1, 65536, 0, 0);
> > +
> > +	switch (format->format.code) {
> > +	case MEDIA_BUS_FMT_RGB444_1X12:
> > +	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_BE:
> > +	case MEDIA_BUS_FMT_RGB444_2X8_PADHI_LE:
> > +	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_BE:
> > +	case MEDIA_BUS_FMT_RGB555_2X8_PADHI_LE:
> > +	case MEDIA_BUS_FMT_RGB565_1X16:
> > +	case MEDIA_BUS_FMT_BGR565_2X8_BE:
> > +	case MEDIA_BUS_FMT_BGR565_2X8_LE:
> > +	case MEDIA_BUS_FMT_RGB565_2X8_BE:
> > +	case MEDIA_BUS_FMT_RGB565_2X8_LE:
> > +	case MEDIA_BUS_FMT_RGB666_1X18:
> > +	case MEDIA_BUS_FMT_RBG888_1X24:
> > +	case MEDIA_BUS_FMT_RGB666_1X24_CPADHI:
> > +	case MEDIA_BUS_FMT_BGR888_1X24:
> > +	case MEDIA_BUS_FMT_GBR888_1X24:
> > +	case MEDIA_BUS_FMT_RGB888_1X24:
> > +	case MEDIA_BUS_FMT_RGB888_2X12_BE:
> > +	case MEDIA_BUS_FMT_RGB888_2X12_LE:
> > +	case MEDIA_BUS_FMT_ARGB8888_1X32:
> > +	case MEDIA_BUS_FMT_RGB888_1X32_PADHI:
> > +	case MEDIA_BUS_FMT_RGB101010_1X30:
> > +	case MEDIA_BUS_FMT_RGB121212_1X36:
> > +	case MEDIA_BUS_FMT_RGB161616_1X48:
> > +	case MEDIA_BUS_FMT_Y8_1X8:
> > +	case MEDIA_BUS_FMT_UV8_1X8:
> > +	case MEDIA_BUS_FMT_UYVY8_1_5X8:
> > +	case MEDIA_BUS_FMT_VYUY8_1_5X8:
> > +	case MEDIA_BUS_FMT_YUYV8_1_5X8:
> > +	case MEDIA_BUS_FMT_YVYU8_1_5X8:
> > +	case MEDIA_BUS_FMT_UYVY8_2X8:
> > +	case MEDIA_BUS_FMT_VYUY8_2X8:
> > +	case MEDIA_BUS_FMT_YUYV8_2X8:
> > +	case MEDIA_BUS_FMT_YVYU8_2X8:
> > +	case MEDIA_BUS_FMT_Y10_1X10:
> > +	case MEDIA_BUS_FMT_UYVY10_2X10:
> > +	case MEDIA_BUS_FMT_VYUY10_2X10:
> > +	case MEDIA_BUS_FMT_YUYV10_2X10:
> > +	case MEDIA_BUS_FMT_YVYU10_2X10:
> > +	case MEDIA_BUS_FMT_Y12_1X12:
> > +	case MEDIA_BUS_FMT_UYVY12_2X12:
> > +	case MEDIA_BUS_FMT_VYUY12_2X12:
> > +	case MEDIA_BUS_FMT_YUYV12_2X12:
> > +	case MEDIA_BUS_FMT_YVYU12_2X12:
> > +	case MEDIA_BUS_FMT_UYVY8_1X16:
> > +	case MEDIA_BUS_FMT_VYUY8_1X16:
> > +	case MEDIA_BUS_FMT_YUYV8_1X16:
> > +	case MEDIA_BUS_FMT_YVYU8_1X16:
> > +	case MEDIA_BUS_FMT_YDYUYDYV8_1X16:
> > +	case MEDIA_BUS_FMT_UYVY10_1X20:
> > +	case MEDIA_BUS_FMT_VYUY10_1X20:
> > +	case MEDIA_BUS_FMT_YUYV10_1X20:
> > +	case MEDIA_BUS_FMT_YVYU10_1X20:
> > +	case MEDIA_BUS_FMT_VUY8_1X24:
> > +	case MEDIA_BUS_FMT_YUV8_1X24:
> > +	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
> > +	case MEDIA_BUS_FMT_UYVY12_1X24:
> > +	case MEDIA_BUS_FMT_VYUY12_1X24:
> > +	case MEDIA_BUS_FMT_YUYV12_1X24:
> > +	case MEDIA_BUS_FMT_YVYU12_1X24:
> > +	case MEDIA_BUS_FMT_YUV10_1X30:
> > +	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
> > +	case MEDIA_BUS_FMT_AYUV8_1X32:
> > +	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
> > +	case MEDIA_BUS_FMT_YUV12_1X36:
> > +	case MEDIA_BUS_FMT_YUV16_1X48:
> > +	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
> > +	case MEDIA_BUS_FMT_JPEG_1X8:
> > +	case MEDIA_BUS_FMT_AHSV8888_1X32:
> > +	case MEDIA_BUS_FMT_SBGGR8_1X8:
> > +	case MEDIA_BUS_FMT_SGBRG8_1X8:
> > +	case MEDIA_BUS_FMT_SGRBG8_1X8:
> > +	case MEDIA_BUS_FMT_SRGGB8_1X8:
> > +	case MEDIA_BUS_FMT_SBGGR10_1X10:
> > +	case MEDIA_BUS_FMT_SGBRG10_1X10:
> > +	case MEDIA_BUS_FMT_SGRBG10_1X10:
> > +	case MEDIA_BUS_FMT_SRGGB10_1X10:
> > +	case MEDIA_BUS_FMT_SBGGR12_1X12:
> > +	case MEDIA_BUS_FMT_SGBRG12_1X12:
> > +	case MEDIA_BUS_FMT_SGRBG12_1X12:
> > +	case MEDIA_BUS_FMT_SRGGB12_1X12:
> > +	case MEDIA_BUS_FMT_SBGGR14_1X14:
> > +	case MEDIA_BUS_FMT_SGBRG14_1X14:
> > +	case MEDIA_BUS_FMT_SGRBG14_1X14:
> > +	case MEDIA_BUS_FMT_SRGGB14_1X14:
> > +	case MEDIA_BUS_FMT_SBGGR16_1X16:
> > +	case MEDIA_BUS_FMT_SGBRG16_1X16:
> > +	case MEDIA_BUS_FMT_SGRBG16_1X16:
> > +	case MEDIA_BUS_FMT_SRGGB16_1X16:
> > +		break;
> > +	default:
> > +		format->format.code =3D MEDIA_BUS_FMT_Y8_1X8;
> > +		break;
> > +	}
> > +	if (format->format.field =3D=3D V4L2_FIELD_ANY)
> > +		format->format.field =3D V4L2_FIELD_NONE;
> > +
> > +	mutex_lock(&csi->lock);
> > +
> > +	pad =3D &csi->pads[format->pad];
> > +	if (pad->flags & MEDIA_PAD_FL_SOURCE)
> > +		format->format =3D csi->format_mbus[CSI_PAD_SINK];
> > +
> > +	*mbusformat =3D format->format;
> > +
> > +	if (pad->flags & MEDIA_PAD_FL_SINK)
> > +		*source_mbusformat =3D format->format;
> > +
> > +	mutex_unlock(&csi->lock);
> > +
> > +	return 0;
> > +}
> > +
> > +static const struct v4l2_subdev_video_ops mei_csi_video_ops =3D {
> > +	.s_stream =3D mei_csi_set_stream,
> > +	.pre_streamon =3D mei_csi_pre_streamon, };
> > +
> > +static const struct v4l2_subdev_pad_ops mei_csi_pad_ops =3D {
> > +	.init_cfg =3D mei_csi_init_cfg,
> > +	.get_fmt =3D mei_csi_get_fmt,
> > +	.set_fmt =3D mei_csi_set_fmt,
> > +};
> > +
> > +static const struct v4l2_subdev_ops mei_csi_subdev_ops =3D {
> > +	.video =3D &mei_csi_video_ops,
> > +	.pad =3D &mei_csi_pad_ops,
> > +};
> > +
> > +static const struct media_entity_operations mei_csi_entity_ops =3D {
> > +	.link_validate =3D v4l2_subdev_link_validate, };
> > +
> > +static int mei_csi_notify_bound(struct v4l2_async_notifier *notifier,
> > +				struct v4l2_subdev *subdev,
> > +				struct v4l2_async_subdev *asd)
> > +{
> > +	struct mei_csi *csi =3D notifier_to_csi(notifier);
> > +	int pad;
> > +
> > +	pad =3D media_entity_get_fwnode_pad(&subdev->entity, asd-
> >match.fwnode,
> > +					  MEDIA_PAD_FL_SOURCE);
> > +	if (pad < 0)
> > +		return pad;
> > +
> > +	csi->remote =3D subdev;
> > +	csi->remote_pad =3D pad;
> > +
> > +	return media_create_pad_link(&subdev->entity, pad,
> > +				     &csi->subdev.entity, 0,
> > +				     MEDIA_LNK_FL_ENABLED |
> > +				     MEDIA_LNK_FL_IMMUTABLE);
> > +}
> > +
> > +static void mei_csi_notify_unbind(struct v4l2_async_notifier *notifier=
,
> > +				  struct v4l2_subdev *subdev,
> > +				  struct v4l2_async_subdev *asd)
> > +{
> > +	struct mei_csi *csi =3D notifier_to_csi(notifier);
> > +
> > +	csi->remote =3D NULL;
> > +}
> > +
> > +static const struct v4l2_async_notifier_operations mei_csi_notify_ops =
=3D {
> > +	.bound =3D mei_csi_notify_bound,
> > +	.unbind =3D mei_csi_notify_unbind,
> > +};
> > +
> > +static int mei_csi_init_control(struct mei_csi *csi) {
> > +	v4l2_ctrl_handler_init(&csi->ctrl_handler, 1);
> > +	csi->ctrl_handler.lock =3D &csi->lock;
> > +
> > +	csi->privacy_ctrl =3D v4l2_ctrl_new_std(&csi->ctrl_handler, NULL,
> > +					      V4L2_CID_PRIVACY, 0, 1, 1, 0);
> > +	if (csi->ctrl_handler.error)
> > +		return csi->ctrl_handler.error;
>=20
> The control should be made volatile here (flags |=3D
> V4L2_CTRL_FLAG_READ_ONLY) as it can't be changed by the user.

ack
>=20
> > +
> > +	csi->subdev.ctrl_handler =3D &csi->ctrl_handler;
> > +
> > +	return 0;
> > +}
> > +
> > +static int mei_csi_parse_firmware(struct mei_csi *csi) {
> > +	struct v4l2_fwnode_endpoint v4l2_ep =3D {
> > +		.bus_type =3D V4L2_MBUS_CSI2_DPHY,
> > +	};
> > +	struct device *dev =3D &csi->cldev->dev;
> > +	struct v4l2_async_subdev *asd;
> > +	struct fwnode_handle *fwnode;
> > +	struct fwnode_handle *ep;
> > +	int ret;
> > +
> > +	ep =3D fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
> > +	if (!ep) {
> > +		dev_err(dev, "not connected to subdevice\n");
> > +		return -EINVAL;
> > +	}
> > +
> > +	ret =3D v4l2_fwnode_endpoint_parse(ep, &v4l2_ep);
> > +	if (ret) {
> > +		dev_err(dev, "could not parse v4l2 endpoint\n");
> > +		fwnode_handle_put(ep);
> > +		return -EINVAL;
> > +	}
> > +
> > +	fwnode =3D fwnode_graph_get_remote_endpoint(ep);
> > +	fwnode_handle_put(ep);
> > +
> > +	v4l2_async_nf_init(&csi->notifier);
> > +	csi->notifier.ops =3D &mei_csi_notify_ops;
> > +
> > +	asd =3D v4l2_async_nf_add_fwnode(&csi->notifier, fwnode,
> > +				       struct v4l2_async_subdev);
> > +	fwnode_handle_put(fwnode);
> > +	if (IS_ERR(asd))
> > +		return PTR_ERR(asd);
> > +
> > +	ret =3D v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
> > +	if (ret)
> > +		v4l2_async_nf_cleanup(&csi->notifier);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mei_csi_probe(struct mei_cl_device *cldev,
> > +			 const struct mei_cl_device_id *id) {
> > +	struct mei_csi *csi;
> > +	int ret;
> > +
> > +	/*
> > +	 * no connections to sensor are defined in firmware, try to
> > +	 * build connections as software_nodes parsed from SSDB.
> > +	 */
> > +	ret =3D csi_bridge_init(cldev);
> > +	if (ret)
> > +		return ret;
> > +
> > +	csi =3D devm_kzalloc(&cldev->dev, sizeof(struct mei_csi), GFP_KERNEL)=
;
> > +	if (!csi)
> > +		return -ENOMEM;
> > +
> > +	csi->cldev =3D cldev;
> > +	mutex_init(&csi->lock);
> > +	init_completion(&csi->cmd_completion);
> > +
> > +	mei_cldev_set_drvdata(cldev, csi);
> > +
> > +	ret =3D mei_cldev_enable(cldev);
> > +	if (ret < 0) {
> > +		dev_err(&cldev->dev, "mei_cldev_enable failed: %d\n", ret);
> > +		goto destroy_mutex;
> > +	}
> > +
> > +	ret =3D mei_cldev_register_rx_cb(cldev, mei_csi_rx);
> > +	if (ret) {
> > +		dev_err(&cldev->dev, "event cb registration failed: %d\n", ret);
> > +		goto err_disable;
> > +	}
> > +
> > +	ret =3D mei_csi_parse_firmware(csi);
> > +	if (ret)
> > +		goto err_disable;
> > +
> > +	csi->subdev.dev =3D &cldev->dev;
> > +	v4l2_subdev_init(&csi->subdev, &mei_csi_subdev_ops);
> > +	v4l2_set_subdevdata(&csi->subdev, csi);
> > +	csi->subdev.flags =3D V4L2_SUBDEV_FL_HAS_DEVNODE;
> > +	csi->subdev.entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > +	csi->subdev.entity.ops =3D &mei_csi_entity_ops;
> > +
> > +	ret =3D mei_csi_init_control(csi);
> > +	if (ret)
> > +		goto err_async;
>=20
> You'll also need to call v4l2_ctrl_handler_free() if setting up the handl=
er failed.
> I.e. just change the label here and remove err_async label below.
Thanks
>=20
> > +
> > +	csi->format_mbus[CSI_PAD_SOURCE] =3D mei_csi_format_mbus_default;
> > +	csi->format_mbus[CSI_PAD_SINK] =3D mei_csi_format_mbus_default;
> > +
> > +	csi->pads[CSI_PAD_SOURCE].flags =3D MEDIA_PAD_FL_SOURCE;
> > +	csi->pads[CSI_PAD_SINK].flags =3D MEDIA_PAD_FL_SINK;
> > +	ret =3D media_entity_pads_init(&csi->subdev.entity, CSI_NUM_PADS,
> > +				     csi->pads);
> > +	if (ret)
> > +		goto err_ctrl_handler;
> > +
> > +	ret =3D v4l2_subdev_init_finalize(&csi->subdev);
> > +	if (ret < 0)
> > +		goto err_entity;
> > +
> > +	ret =3D v4l2_async_register_subdev(&csi->subdev);
> > +	if (ret < 0)
> > +		goto err_subdev;
> > +
> > +	pm_runtime_enable(&cldev->dev);
> > +
> > +	return 0;
> > +
> > +err_subdev:
> > +	v4l2_subdev_cleanup(&csi->subdev);
> > +err_entity:
> > +	media_entity_cleanup(&csi->subdev.entity);
> > +err_ctrl_handler:
> > +	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > +err_async:
> > +	v4l2_async_nf_unregister(&csi->notifier);
> > +	v4l2_async_nf_cleanup(&csi->notifier);
> > +err_disable:
> > +	mei_cldev_disable(cldev);
>=20
> It'd be nice to have an additional newline before the label. Elsewhere, t=
oo.
ack
>=20
> > +destroy_mutex:
> > +	mutex_destroy(&csi->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +static void mei_csi_remove(struct mei_cl_device *cldev) {
> > +	struct mei_csi *csi =3D mei_cldev_get_drvdata(cldev);
> > +
> > +	v4l2_async_nf_unregister(&csi->notifier);
> > +	v4l2_async_nf_cleanup(&csi->notifier);
> > +	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > +	v4l2_async_unregister_subdev(&csi->subdev);
> > +	v4l2_subdev_cleanup(&csi->subdev);
> > +	media_entity_cleanup(&csi->subdev.entity);
> > +
> > +	pm_runtime_disable(&cldev->dev);
> > +
> > +	mutex_destroy(&csi->lock);
> > +}
> > +
> > +#define MEI_CSI_UUID UUID_LE(0x92335FCF, 0x3203, 0x4472, \
> > +			     0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
> > +
> > +static const struct mei_cl_device_id mei_csi_tbl[] =3D {
> > +	{ MEI_CSI_DRIVER_NAME, MEI_CSI_UUID, MEI_CL_VERSION_ANY },
> > +
>=20
> Extra newline.
>=20
> > +	/* required last entry */
>=20
> The comment could be on the same line below. E.g. "Sentinel" is appropria=
te, as
> this isn't just any last entry.
thanks
>=20
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(mei, mei_csi_tbl);
> > +
> > +static struct mei_cl_driver mei_csi_driver =3D {
> > +	.id_table =3D mei_csi_tbl,
> > +	.name =3D MEI_CSI_DRIVER_NAME,
> > +
> > +	.probe =3D mei_csi_probe,
> > +	.remove =3D mei_csi_remove,
> > +};
> > +
> > +module_mei_cl_driver(mei_csi_driver);
> > +
> > +MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > +MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
> > +MODULE_DESCRIPTION("Device driver for IVSC CSI");
> > +MODULE_LICENSE("GPL");
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
