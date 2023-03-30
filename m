Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D59F46CFCD1
	for <lists+linux-media@lfdr.de>; Thu, 30 Mar 2023 09:33:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231206AbjC3HdG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Mar 2023 03:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231225AbjC3Hcu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Mar 2023 03:32:50 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F5716A7F
        for <linux-media@vger.kernel.org>; Thu, 30 Mar 2023 00:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680161566; x=1711697566;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SKsvP9uO8g0/+pkHhOrTE4wAZW+Eozx2wgIGQhO0WUI=;
  b=VnMTeG+5ibAklcbZ7oJiP0bYsH65W1WoC1A3kS6zNqGqpCEZLW0CsIh7
   HIY2BoEP/1+x4t5DEDOvKuoUUtEDJqqjp6RcYJ2QQIVwjvHxoolFhaex0
   s+2OUzyak/FkoDLxQ7BtqJ0Qpee3YNT4zfQc1BSnQijAx4m+vNnVkEajC
   DPh2NzhSFU9u41aGYY+PYe2mxQVrH+RePB2VeR1/wU93LOKfVRaJ4vGE+
   wf1F+vsy0p3cENbN1B8IRNkgK5iRJZwRjAskRf5JwlQQAflMXbVjl40nz
   6ow0FZAYwNkgZVjjdqTftmj0wpJBRmhuiuOMGmoymixOAbYfw7+mt4bMO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="406052100"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="406052100"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 00:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="753886552"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="753886552"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga004.fm.intel.com with ESMTP; 30 Mar 2023 00:32:31 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 30 Mar 2023 00:32:30 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Thu, 30 Mar 2023 00:32:30 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.103)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Thu, 30 Mar 2023 00:32:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kCHyFqOJufocvpeA6l674Uic3psmGdNXnOIGwACfMrZGM5WfCjZOOv8yxBa+OpFUaFTJ2RzklkPBok8qkakov460NojER/GQQzHQ4aBBk3kIpeQEzL+4AOThVinVNTbMKuNbPyEgpNIqbdU6nCkWDw/l74mNmbqFNEWU3hoenxo0EodaEsiWHxptms314Ggn96MbGHOjoUQG/y7KJYc9mdNAO4hoK7PDXm25OsFD9tT0I/n4Mo1CHsXH+UGGSaeVmpUvjWURzldn0i+uNdKe8cWYhXbyhyaR3eRjYyjsuL2zBSdtuA+75eNRQhhHyb0HOozPHdE9jN2FmvQmtRMIKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emnHsDM2ozrB0STALQ3qto00pGaK3Wb06bGOxUsihoU=;
 b=XpoI3QMpkusFjq3reHuHsuLHfiBcCstqUpO+K28E3msS6Zt7ckvU1BTwM4RL9cRRU/V/8660d6tAXgZcXoqp9WzGGmjmsa/bGbFBkbqv8BAC8Z1i0cnkEGquD/XJ3hkdi+jSdajwpAURf9QyM9nvPRqkgD7VrsA+370/u6Ys2Es4DJNiIEip1ISrL2/cbajKJvqaY8iEXbIfcJA+MN+xUcrMTTWzuVaQzlhPP2+NF8YTHKYfK71R94Oc6HlIFd7Zs6DAOCiq+SADMZ7V9D9fBsMIUQvRGIFoQSaylt2W0KeU11wbKvEUwOsoRqrvPxs0GKd7HZzHWQImWTyYHn7Sng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by IA1PR11MB8222.namprd11.prod.outlook.com (2603:10b6:208:44e::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.32; Thu, 30 Mar
 2023 07:32:28 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee%7]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 07:32:27 +0000
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
Subject: RE: [PATCH v3 2/3] media: pci: intel: ivsc: Add ACE submodule
Thread-Topic: [PATCH v3 2/3] media: pci: intel: ivsc: Add ACE submodule
Thread-Index: AQHZYHSrw/WvZvrRP0SpBk8aEHTczq8RaR+AgAGGGeA=
Date:   Thu, 30 Mar 2023 07:32:27 +0000
Message-ID: <MN2PR11MB4318F9FC62A33A86B9ED64FB8D8E9@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-3-git-send-email-wentong.wu@intel.com>
 <ZCPw7wiHJX4nkpG3@kekkonen.localdomain>
In-Reply-To: <ZCPw7wiHJX4nkpG3@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|IA1PR11MB8222:EE_
x-ms-office365-filtering-correlation-id: bb327be1-4b75-4ee2-a34f-08db30f0e98d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 4jp8R2h3TPVGXbwY8uangIO/Li81nn+ZVcjSFiXJKLKDmBmlYI7XiGsTLp4EUosIYPidG+nKgZxA7/COeVHov+YUAn9XDkY+77kEd2O32qXbFkf8AYSUXdQ/NtFYg4ey1ZEA654HolgN+a+aej6iONOJTCDWleqOd5cLHEGagISN9rlYKA+xDspf/Ba1MQCrw+v6N/+XN5UYAi1Fz6ffKAjKU57X8WMGxDFCa5Ro3N36a0aioCNawhmrPKmve/eAasrHNCyEbLxIyVBKcgs6ZdGc2sgLtlQP0a2AWnCa5XczhoT7FWNDKft79YZ/pxw/2eUeRwKGBWCVEcyfcFSY3rWa45cHt8k9tE75CDNQfoPwP3h1CsRlJMi4q+qpNZah7i//PIG9vhxkiHaCuZWfzyjWKGathSSOync4CmJMbklqYUVd2zDMxZoSGWLsNueEQdaDMxZKbDRCsifgrtKYuKMm9nnKrW8bLUwc7GlQ9QVf28XhrYkEcAAndWeQjvbZ2I/wECvHXCdgyMNM4jqlNGavHyb+20gUSYd+Y7y/PKMlLIABSNT65upV5LfnYVnp+cTWfv+ugLdJfgGrXudc46Jk5ehvP9T3GImH1bXmjaLz0sG+kW4jwmqarQDD8NHv
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(39860400002)(366004)(376002)(346002)(451199021)(86362001)(2906002)(38070700005)(33656002)(55016003)(76116006)(66946007)(83380400001)(478600001)(71200400001)(38100700002)(54906003)(9686003)(5660300002)(66446008)(8676002)(66556008)(7696005)(66476007)(64756008)(316002)(122000001)(4326008)(6506007)(52536014)(6916009)(30864003)(8936002)(82960400001)(186003)(41300700001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?tKqe7JLDaUP40MoOqWiN7JFmXWaHgBytH3MuiERaukH/V1XIhMArhdJo0t?=
 =?iso-8859-1?Q?IRPfncnnMZuEHFw/cyYCbAVRRnN8JPjZeDtyrXlrpNSo9L6UMwTo6No/dA?=
 =?iso-8859-1?Q?OqJu2quoB3x7uWiLzgM+ZDtV3aFCSgFL4LiiG4RIP08b+U014biko/o/YR?=
 =?iso-8859-1?Q?iQkw4OmFyj2Uc5QSKmkWOSSLmDWHIPdDbhfL35rEZsJwI/uFH5RYA+gl6K?=
 =?iso-8859-1?Q?RgHfYlKYP5tOMngfSyNvYDMuh32wIkStFsf6PDmZ9rL05zjYHwYHZj4ShW?=
 =?iso-8859-1?Q?3bW1x2le7IAJ9L6yT9xjJEtJa+sI/rnrr5fkpu9eUJ903bNtuwKPMeifBr?=
 =?iso-8859-1?Q?hu+boGJ5cp0M/fM0cWH/3bbrkm+V/ucHlEu/CqGuRov91yfikis0r1t/gU?=
 =?iso-8859-1?Q?N+d1RDdOsU5LmCEdSZ+H0dKpxllPfCguj+Qo2N8EXvYOBckR4CKFVvR+yI?=
 =?iso-8859-1?Q?rCixr8wK0ivU9Uo5gP+skXw2qWeeRWAeglC9weSEHgDwD1VCh2ybiiqUpN?=
 =?iso-8859-1?Q?huDeLV7Hu/sUkWlSf9ME4a/4Y5QzpVaLxFcwd/rJ1E8dOO/LTkf1djX2eV?=
 =?iso-8859-1?Q?GzkA593GOmOZCzDfYUX4dHYSc1KNaT0vXInylHdivt2cbuoXnB2ynrwSxx?=
 =?iso-8859-1?Q?N6n7ecEBkbxYnfFXKuhdFg4MnzaCT9N/zf21c4/IqO85KHbn3J5MU0MazR?=
 =?iso-8859-1?Q?I5Wp00CDzYgPHVfaZ2qkuQ03HuqKNU4qZOOdm/oIE7i05q/ZEE71V7Qsbq?=
 =?iso-8859-1?Q?RoSt511w90wUN8PVx91lgdbeQnQqTsFAWw5xlX7vN+HqHNUKZ4u02Kv6se?=
 =?iso-8859-1?Q?B3ZvAO5iH7A/jgnYsEvUoNAW8oDMk/7RC3Why/0V2Ev0Ep5DLEnTkY/oBA?=
 =?iso-8859-1?Q?PRHbDKGVNAfdNqUJny7jy8YjSAxNnbSPI02zC4yx/mRlMAImJ6MmFeSFnI?=
 =?iso-8859-1?Q?G8VOgIXasmqW//VmOAPVus6nYPkacQXU1JT2sfG10yqpoauZ0ifIu4D0zo?=
 =?iso-8859-1?Q?xjl/SdO7gRVYYWxrq82KDMEryTuThvj1uMxq1wkAMT5U7BEmUXInESkRBL?=
 =?iso-8859-1?Q?bEmhGnUObzFKZlqZClFdhaa0iTzX093vsjfiQqdd480CxsaVpnoWkTA527?=
 =?iso-8859-1?Q?ZwYxu74rcSFyyKnDE5fsg2aTD+6bUBAZtv+TqLZ2vLk/iubHaZOLKtAUNu?=
 =?iso-8859-1?Q?Yt+Ae2aRf3FKSMPTmdIrrJuctBb6qpSD1UQyGMm2cKpv3eqplm12hVulDW?=
 =?iso-8859-1?Q?ev23N3pocs3GrhpNhlMIiz4P55l68zEtyKyHOrR7x85DmdjZnCEsvpC4MZ?=
 =?iso-8859-1?Q?ej+j7+l/O0HZu36+ra8Ly9ip1TEmBy1PhXUiDWDaTrxz5dgr6lage+qNTf?=
 =?iso-8859-1?Q?0AbJRXR+3mtImbSPRU+HiW4tQxp0I2PTzFQgFWh8GBBhTpklKXZSqeSGRO?=
 =?iso-8859-1?Q?DdwZTZ+9u2mvmSIKTP6/rwb4stbdgyvPSj2DD9ooiPJ1A9MbnT2JvBYAWj?=
 =?iso-8859-1?Q?TkMPIfqTNjqS30DH9JN9EvDct028oMTt0S6Et0tqffGG0BbfWA+oXwcUeT?=
 =?iso-8859-1?Q?oi3m3LBOzw+OnXdHkW2qXimEUoSfukhBqBivSNFEeR4Kzob7kg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb327be1-4b75-4ee2-a34f-08db30f0e98d
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Mar 2023 07:32:27.1153
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: myRbLGcIWMjpCumuBEo0+Gvjn8XX9S4Y0DEgUTKmnHgKwFpQ8KQcOMcGI6WBAf8LGg31SWx7PVqDDJSK0m6rhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8222
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, March 29, 2023 4:04 PM
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 02:23:07PM +0800, Wentong Wu wrote:
> > ACE is a submodule of IVSC which controls camera sensor's ownership,
> > belonging to host or IVSC. When IVSC owns camera sensor, it is for
> > algorithm computing. When host wants to control camera sensor, ACE
> > module needs to be informed of ownership with defined interface.
> >
> > The interface is via MEI. There is a separate MEI UUID, which this
> > driver uses to enumerate.
> >
> > To switch ownership of camera sensor between IVSC and host, the caller
> > specifies the defined ownership information which will be sent to
> > firmware by sending MEI command.
> >
> > Device link(device_link_add) is used to set the right camera sensor
> > ownership before accessing the sensor via I=B2C. With DL_FLAG_PM_RUNTIM=
E
> > and DL_FLAG_RPM_ACTIVE, the supplier device will be PM runtime resumed
> > before the consumer(camera sensor).
> > So use runtime PM callbacks to transfer the ownership between host and
> > IVSC.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > ---
> >  drivers/media/pci/intel/ivsc/Makefile  |   3 +
> >  drivers/media/pci/intel/ivsc/mei_ace.c | 534
> > +++++++++++++++++++++++++++++++++
> >  2 files changed, 537 insertions(+)
> >  create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
> >
> > diff --git a/drivers/media/pci/intel/ivsc/Makefile
> > b/drivers/media/pci/intel/ivsc/Makefile
> > index 7e4c5f0..a641f14 100644
> > --- a/drivers/media/pci/intel/ivsc/Makefile
> > +++ b/drivers/media/pci/intel/ivsc/Makefile
> > @@ -5,3 +5,6 @@
> >  obj-$(CONFIG_INTEL_VSC) +=3D ivsc-csi.o  ivsc-csi-y +=3D mei_csi.o
> > ivsc-csi-y +=3D csi_bridge.o
> > +
> > +obj-$(CONFIG_INTEL_VSC) +=3D ivsc-ace.o ivsc-ace-y +=3D mei_ace.o
> > diff --git a/drivers/media/pci/intel/ivsc/mei_ace.c
> > b/drivers/media/pci/intel/ivsc/mei_ace.c
> > new file mode 100644
> > index 0000000..434b072
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ivsc/mei_ace.c
> > @@ -0,0 +1,534 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (C) 2023 Intel Corporation. All rights reserved.
> > + * Intel Visual Sensing Controller ACE Linux driver  */
> > +
> > +/*
> > + * To set ownership of camera sensor, there is specific command,
> > +which
> > + * is sent via MEI protocol. That's a two-step scheme where the
> > +firmware
> > + * first acks receipt of the command and later responses the command
> > +was
> > + * executed. The command sending function uses "completion" as the
> > + * synchronization mechanism. The notification for command is
> > +received
> > + * via a mei callback which wakes up the caller. There can be only
> > +one
> > + * outstanding command at a time.
>=20
> Could you document the dependencies in the sensor initialisation (ace +
> csi)=20

This is about ownership instead of dependency, if host sensor driver config=
ure
sensor with ownership on IVSC, probably it will be changed by firmware some=
how.

> and how the sensor is powered (i.e. no direct control of the PMIC from th=
e
> host?)?=20

The power line is directly connected to IVSC instead of host, when ownershi=
p
switched to host, sensor is already powered up by firmware.=20

> This doesn't seem like a bad place to do it.
>=20
> > + */
> > +
> > +#include <linux/acpi.h>
> > +#include <linux/completion.h>
> > +#include <linux/delay.h>
> > +#include <linux/kernel.h>
> > +#include <linux/mei_cl_bus.h>
> > +#include <linux/module.h>
> > +#include <linux/mutex.h>
> > +#include <linux/pm_runtime.h>
> > +#include <linux/slab.h>
> > +#include <linux/uuid.h>
> > +
> > +#define	MEI_ACE_DRIVER_NAME	"ivsc_ace"
> > +
> > +/* indicating driver message */
> > +#define	ACE_DRV_MSG		1
> > +/* indicating set command */
> > +#define	ACE_CMD_SET		4
> > +/* command timeout determined experimentally */
> > +#define	ACE_CMD_TIMEOUT		(5 * HZ)
> > +/* indicating the first command block */
> > +#define	ACE_CMD_INIT_BLOCK	1
> > +/* indicating the last command block */
> > +#define	ACE_CMD_FINAL_BLOCK	1
> > +/* size of camera status notification content */
> > +#define	ACE_CAMERA_STATUS_SIZE	5
> > +
> > +/* UUID used to get firmware id */
> > +#define ACE_GET_FW_ID_UUID UUID_LE(0x6167DCFB, 0x72F1, 0x4584,
> 0xBF, \
> > +				   0xE3, 0x84, 0x17, 0x71, 0xAA, 0x79, 0x0B)
> > +
> > +/* UUID used to get csi device */
> > +#define MEI_CSI_UUID UUID_LE(0x92335FCF, 0x3203, 0x4472, \
> > +			     0xAF, 0x93, 0x7b, 0x44, 0x53, 0xAC, 0x29, 0xDA)
> > +
> > +/* identify firmware event type */
> > +enum ace_event_type {
> > +	/* firmware ready */
> > +	ACE_FW_READY =3D 0x8,
> > +
> > +	/* command response */
> > +	ACE_CMD_RESPONSE =3D 0x10,
> > +};
> > +
> > +/* identify camera sensor ownership */ enum ace_camera_owner {
> > +	ACE_CAMERA_IVSC,
> > +	ACE_CAMERA_HOST,
> > +};
> > +
> > +/* identify the command id supported by firmware IPC */ enum
> > +ace_cmd_id {
> > +	/* used to switch camera sensor to host */
> > +	ACE_SWITCH_CAMERA_TO_HOST =3D 0x13,
> > +
> > +	/* used to switch camera sensor to IVSC */
> > +	ACE_SWITCH_CAMERA_TO_IVSC =3D 0x14,
> > +
> > +	/* used to get firmware id */
> > +	ACE_GET_FW_ID =3D 0x1A,
> > +};
> > +
> > +/* ACE command header structure */
> > +struct ace_cmd_hdr {
> > +	u32 firmware_id : 16;
> > +	u32 instance_id : 8;
> > +	u32 type : 5;
> > +	u32 rsp : 1;
> > +	u32 msg_tgt : 1;
> > +	u32 _hw_rsvd_1 : 1;
> > +	u32 param_size : 20;
> > +	u32 cmd_id : 8;
> > +	u32 final_block : 1;
> > +	u32 init_block : 1;
> > +	u32 _hw_rsvd_2 : 2;
> > +} __packed;
> > +
> > +/* ACE command parameter structure */ union ace_cmd_param {
> > +	uuid_le uuid;
> > +	u32 param;
> > +};
> > +
> > +/* ACE command structure */
> > +struct ace_cmd {
> > +	struct ace_cmd_hdr hdr;
> > +	union ace_cmd_param param;
> > +} __packed;
> > +
> > +/* ACE notification header */
> > +union ace_notif_hdr {
> > +	struct _confirm {
> > +		u32 status : 24;
> > +		u32 type : 5;
> > +		u32 rsp : 1;
> > +		u32 msg_tgt : 1;
> > +		u32 _hw_rsvd_1 : 1;
> > +		u32 param_size : 20;
> > +		u32 cmd_id : 8;
> > +		u32 final_block : 1;
> > +		u32 init_block : 1;
> > +		u32 _hw_rsvd_2 : 2;
> > +	} __packed ack;
> > +
> > +	struct _event {
> > +		u32 rsvd1 : 16;
> > +		u32 event_type : 8;
> > +		u32 type : 5;
> > +		u32 ack : 1;
> > +		u32 msg_tgt : 1;
> > +		u32 _hw_rsvd_1 : 1;
> > +		u32 rsvd2 : 30;
> > +		u32 _hw_rsvd_2 : 2;
> > +	} __packed event;
> > +
> > +	struct _response {
> > +		u32 event_id : 16;
> > +		u32 notif_type : 8;
> > +		u32 type : 5;
> > +		u32 rsp : 1;
> > +		u32 msg_tgt : 1;
> > +		u32 _hw_rsvd_1 : 1;
> > +		u32 event_data_size : 16;
> > +		u32 request_target : 1;
> > +		u32 request_type : 5;
> > +		u32 cmd_id : 8;
> > +		u32 _hw_rsvd_2 : 2;
> > +	} __packed response;
> > +};
> > +
> > +/* ACE notification content */
> > +union ace_notif_cont {
> > +	u16 firmware_id;
> > +	u8 state_notif;
> > +	u8 camera_status[ACE_CAMERA_STATUS_SIZE];
> > +};
> > +
> > +/* ACE notification structure */
> > +struct ace_notif {
> > +	union ace_notif_hdr hdr;
> > +	union ace_notif_cont cont;
> > +} __packed;
> > +
> > +struct mei_ace {
> > +	struct mei_cl_device *cldev;
> > +
> > +	/* command ack */
> > +	struct ace_notif cmd_ack;
> > +	/* command response */
> > +	struct ace_notif cmd_response;
> > +	/* used to wait for command ack and response */
> > +	struct completion cmd_completion;
> > +	/* lock used to prevent multiple call to ace */
> > +	struct mutex lock;
> > +
> > +	/* used to construct command */
> > +	u16 firmware_id;
> > +
> > +	/* runtime PM link from ace to csi */
> > +	struct device_link *csi_link;
> > +	/* runtime PM link from ace to sensor */
> > +	struct device_link *sensor_link;
> > +};
> > +
> > +static inline void init_cmd_hdr(struct ace_cmd_hdr *hdr) {
> > +	memset(hdr, 0, sizeof(struct ace_cmd_hdr));
> > +
> > +	hdr->type =3D ACE_CMD_SET;
> > +	hdr->msg_tgt =3D ACE_DRV_MSG;
> > +	hdr->init_block =3D ACE_CMD_INIT_BLOCK;
> > +	hdr->final_block =3D ACE_CMD_FINAL_BLOCK; }
> > +
> > +static int construct_command(struct mei_ace *ace, struct ace_cmd *cmd,
> > +			     enum ace_cmd_id cmd_id)
> > +{
> > +	union ace_cmd_param *param =3D &cmd->param;
> > +	struct ace_cmd_hdr *hdr =3D &cmd->hdr;
> > +
> > +	init_cmd_hdr(hdr);
> > +
> > +	hdr->cmd_id =3D cmd_id;
> > +	switch (cmd_id) {
> > +	case ACE_GET_FW_ID:
> > +		param->uuid =3D ACE_GET_FW_ID_UUID;
> > +		hdr->param_size =3D sizeof(param->uuid);
> > +		break;
> > +	case ACE_SWITCH_CAMERA_TO_IVSC:
> > +		param->param =3D 0;
> > +		hdr->firmware_id =3D ace->firmware_id;
> > +		hdr->param_size =3D sizeof(param->param);
> > +		break;
> > +	case ACE_SWITCH_CAMERA_TO_HOST:
> > +		hdr->firmware_id =3D ace->firmware_id;
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return hdr->param_size + sizeof(cmd->hdr); }
> > +
> > +/* send a command to firmware and mutex must be held by caller */
> > +static int mei_ace_send(struct mei_ace *ace, struct ace_cmd *cmd,
> > +			size_t len, bool only_ack)
> > +{
> > +	union ace_notif_hdr *resp_hdr =3D &ace->cmd_response.hdr;
> > +	union ace_notif_hdr *ack_hdr =3D &ace->cmd_ack.hdr;
> > +	struct ace_cmd_hdr *cmd_hdr =3D &cmd->hdr;
> > +	int ret;
> > +
> > +	reinit_completion(&ace->cmd_completion);
> > +
> > +	ret =3D mei_cldev_send(ace->cldev, (u8 *)cmd, len);
> > +	if (ret < 0)
> > +		goto out;
> > +
> > +	ret =3D wait_for_completion_killable_timeout(&ace->cmd_completion,
> > +						   ACE_CMD_TIMEOUT);
> > +	if (ret < 0) {
> > +		goto out;
> > +	} else if (!ret) {
> > +		ret =3D -ETIMEDOUT;
> > +		goto out;
> > +	}
> > +
> > +	if (ack_hdr->ack.cmd_id !=3D cmd_hdr->cmd_id) {
> > +		ret =3D -EINVAL;
> > +		goto out;
> > +	}
> > +
> > +	/* command ack status */
> > +	ret =3D ack_hdr->ack.status;
> > +	if (ret) {
> > +		ret =3D -EIO;
> > +		goto out;
> > +	}
> > +
> > +	if (only_ack)
> > +		goto out;
> > +
> > +	ret =3D wait_for_completion_killable_timeout(&ace->cmd_completion,
> > +						   ACE_CMD_TIMEOUT);
> > +	if (ret < 0) {
> > +		goto out;
> > +	} else if (!ret) {
> > +		ret =3D -ETIMEDOUT;
> > +		goto out;
> > +	}
> > +
> > +	if (resp_hdr->response.cmd_id !=3D cmd_hdr->cmd_id)
> > +		ret =3D -EINVAL;
> > +
> > +out:
> > +	return ret;
> > +}
> > +
> > +static int ace_set_camera_owner(struct mei_ace *ace, enum
> > +ace_camera_owner owner) {
> > +	enum ace_cmd_id cmd_id;
> > +	struct ace_cmd cmd;
> > +	int cmd_size;
> > +	int ret;
> > +
> > +	if (owner =3D=3D ACE_CAMERA_IVSC)
> > +		cmd_id =3D ACE_SWITCH_CAMERA_TO_IVSC;
> > +	else
> > +		cmd_id =3D ACE_SWITCH_CAMERA_TO_HOST;
> > +
> > +	mutex_lock(&ace->lock);
> > +
> > +	cmd_size =3D construct_command(ace, &cmd, cmd_id);
>=20
> There doesn't seem to be a need to take the lock during construct_command=
().
> Maybe just during mei_ace_send()? You could also acquire and release the =
lock
> there I guess.

Thanks
>=20
> > +	if (cmd_size >=3D 0)
> > +		ret =3D mei_ace_send(ace, &cmd, cmd_size, false);
> > +	else
> > +		ret =3D cmd_size;
> > +	mutex_unlock(&ace->lock);
> > +
> > +	return ret;
> > +}
> > +
> > +/* the first command downloaded to firmware */ static inline int
> > +ace_get_firmware_id(struct mei_ace *ace) {
> > +	struct ace_cmd cmd;
> > +	int cmd_size;
> > +	int ret;
> > +
> > +	cmd_size =3D construct_command(ace, &cmd, ACE_GET_FW_ID);
> > +	if (cmd_size >=3D 0)
> > +		ret =3D mei_ace_send(ace, &cmd, cmd_size, true);
> > +	else
> > +		ret =3D cmd_size;
> > +
> > +	return ret;
> > +}
> > +
> > +static void handle_command_response(struct mei_ace *ace,
> > +				    struct ace_notif *resp, int len) {
> > +	union ace_notif_hdr *hdr =3D &resp->hdr;
> > +
> > +	switch (hdr->response.cmd_id) {
> > +	case ACE_SWITCH_CAMERA_TO_IVSC:
> > +	case ACE_SWITCH_CAMERA_TO_HOST:
> > +		memcpy(&ace->cmd_response, resp, len);
> > +		complete(&ace->cmd_completion);
> > +		break;
> > +	case ACE_GET_FW_ID:
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +static void handle_command_ack(struct mei_ace *ace,
> > +			       struct ace_notif *ack, int len) {
> > +	union ace_notif_hdr *hdr =3D &ack->hdr;
> > +
> > +	switch (hdr->ack.cmd_id) {
> > +	case ACE_GET_FW_ID:
> > +		ace->firmware_id =3D ack->cont.firmware_id;
> > +		fallthrough;
> > +	case ACE_SWITCH_CAMERA_TO_IVSC:
> > +	case ACE_SWITCH_CAMERA_TO_HOST:
> > +		memcpy(&ace->cmd_ack, ack, len);
> > +		complete(&ace->cmd_completion);
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +/* callback for receive */
> > +static void mei_ace_rx(struct mei_cl_device *cldev) {
> > +	struct mei_ace *ace =3D mei_cldev_get_drvdata(cldev);
> > +	struct ace_notif event;
> > +	union ace_notif_hdr *hdr =3D &event.hdr;
> > +	int ret;
> > +
> > +	ret =3D mei_cldev_recv(cldev, (u8 *)&event, sizeof(event));
> > +	if (ret < 0) {
> > +		dev_err(&cldev->dev, "recv error: %d\n", ret);
> > +		return;
> > +	}
> > +
> > +	if (hdr->event.ack) {
> > +		handle_command_ack(ace, &event, ret);
> > +		return;
> > +	}
> > +
> > +	switch (hdr->event.event_type) {
> > +	case ACE_CMD_RESPONSE:
> > +		handle_command_response(ace, &event, ret);
> > +		break;
> > +	case ACE_FW_READY:
> > +		/*
> > +		 * firmware ready notification sent to driver
> > +		 * after HECI client connected with firmware.
> > +		 */
> > +		dev_dbg(&cldev->dev, "firmware ready\n");
> > +		break;
> > +	default:
> > +		break;
> > +	}
> > +}
> > +
> > +static int mei_ace_setup_dev_link(struct mei_ace *ace) {
> > +	struct device *dev =3D &ace->cldev->dev;
> > +	uuid_le uuid =3D MEI_CSI_UUID;
> > +	struct acpi_device *adev;
> > +	struct device *csi_dev;
> > +	char name[64];
> > +
> > +	sprintf(name, "%s-%pUl", dev_name(dev->parent), &uuid);
>=20
> snprintf(), please.
Thanks
>=20
> > +	csi_dev =3D device_find_child_by_name(dev->parent, name);
> > +	if (!csi_dev)
> > +		return -EPROBE_DEFER;
> > +
> > +	/* sensor's ACPI _DEP is mei bus device */
> > +	adev =3D acpi_dev_get_next_consumer_dev(ACPI_COMPANION(dev-
> >parent),
> > +NULL);
>=20
> Nice.
>=20
> Please also run this on the patchset:
>=20
> 	./scripts/checkpatch.pl --strict --max-line-length=3D80
ack
>=20
> > +	if (!adev)
> > +		return -EPROBE_DEFER;
> > +
> > +	/* setup link between mei_ace and mei_csi */
> > +	ace->csi_link =3D device_link_add(csi_dev, dev,
> > +					DL_FLAG_PM_RUNTIME |
> DL_FLAG_RPM_ACTIVE);
> > +
> > +	/* setup link between mei_ace and sensor */
> > +	ace->sensor_link =3D device_link_add(&adev->dev, dev,
> > +					   DL_FLAG_PM_RUNTIME |
> DL_FLAG_RPM_ACTIVE);
>=20
> device_link_add() may fail.
Thanks
>=20
> > +
> > +	return 0;
> > +}
> > +
> > +static int mei_ace_probe(struct mei_cl_device *cldev,
> > +			 const struct mei_cl_device_id *id) {
> > +	struct device *dev =3D &cldev->dev;
> > +	struct mei_ace *ace;
> > +	int ret;
> > +
> > +	ace =3D devm_kzalloc(dev, sizeof(struct mei_ace), GFP_KERNEL);
> > +	if (!ace)
> > +		return -ENOMEM;
> > +
> > +	ace->cldev =3D cldev;
> > +
> > +	ret =3D mei_ace_setup_dev_link(ace);
> > +	if (ret)
> > +		return ret;
> > +
> > +	mutex_init(&ace->lock);
> > +	init_completion(&ace->cmd_completion);
> > +
> > +	mei_cldev_set_drvdata(cldev, ace);
> > +
> > +	ret =3D mei_cldev_enable(cldev);
> > +	if (ret < 0) {
> > +		dev_err(dev, "mei_cldev_enable failed: %d\n", ret);
> > +		goto destroy_mutex;
> > +	}
> > +
> > +	ret =3D mei_cldev_register_rx_cb(cldev, mei_ace_rx);
> > +	if (ret) {
> > +		dev_err(dev, "event cb registration failed: %d\n", ret);
> > +		goto err_disable;
> > +	}
> > +
> > +	ret =3D ace_get_firmware_id(ace);
> > +	if (ret) {
> > +		dev_err(dev, "get firmware id failed: %d\n", ret);
> > +		goto err_disable;
> > +	}
> > +
> > +	pm_runtime_set_active(dev);
> > +	pm_runtime_enable(dev);
> > +
> > +	acpi_dev_clear_dependencies(ACPI_COMPANION(dev->parent));
> > +
> > +	return 0;
> > +
> > +err_disable:
> > +	mei_cldev_disable(cldev);
> > +destroy_mutex:
> > +	mutex_destroy(&ace->lock);
> > +
> > +	device_link_del(ace->csi_link);
> > +	device_link_del(ace->sensor_link);
> > +
> > +	return ret;
> > +}
> > +
> > +static void mei_ace_remove(struct mei_cl_device *cldev) {
> > +	struct mei_ace *ace =3D mei_cldev_get_drvdata(cldev);
> > +
> > +	device_link_del(ace->csi_link);
> > +	device_link_del(ace->sensor_link);
> > +
> > +	pm_runtime_disable(&cldev->dev);
> > +	pm_runtime_set_suspended(&cldev->dev);
> > +
> > +	mutex_destroy(&ace->lock);
> > +}
> > +
> > +static int __maybe_unused mei_ace_runtime_suspend(struct device *dev)
> > +{
> > +	struct mei_ace *ace =3D dev_get_drvdata(dev);
> > +
> > +	return ace_set_camera_owner(ace, ACE_SWITCH_CAMERA_TO_IVSC); }
> > +
> > +static int __maybe_unused mei_ace_runtime_resume(struct device *dev)
> > +{
> > +	struct mei_ace *ace =3D dev_get_drvdata(dev);
> > +
> > +	return ace_set_camera_owner(ace,
> ACE_SWITCH_CAMERA_TO_HOST); }
> > +
> > +static const struct dev_pm_ops mei_ace_pm_ops =3D {
> > +	SET_RUNTIME_PM_OPS(mei_ace_runtime_suspend,
> > +			   mei_ace_runtime_resume,
> > +			   NULL)
> > +};
> > +
> > +#define MEI_ACE_UUID UUID_LE(0x5DB76CF6, 0x0A68, 0x4ED6, \
> > +			     0x9B, 0x78, 0x03, 0x61, 0x63, 0x5E, 0x24, 0x47)
> > +
> > +static const struct mei_cl_device_id mei_ace_tbl[] =3D {
> > +	{ MEI_ACE_DRIVER_NAME, MEI_ACE_UUID, MEI_CL_VERSION_ANY },
> > +
> > +	/* required last entry */
> > +	{ }
> > +};
> > +MODULE_DEVICE_TABLE(mei, mei_ace_tbl);
> > +
> > +static struct mei_cl_driver mei_ace_driver =3D {
> > +	.id_table =3D mei_ace_tbl,
> > +	.name =3D MEI_ACE_DRIVER_NAME,
> > +
> > +	.probe =3D mei_ace_probe,
> > +	.remove =3D mei_ace_remove,
> > +
> > +	.driver =3D {
> > +		.pm =3D &mei_ace_pm_ops,
> > +	},
> > +};
> > +
> > +module_mei_cl_driver(mei_ace_driver);
> > +
> > +MODULE_AUTHOR("Wentong Wu <wentong.wu@intel.com>");
> > +MODULE_AUTHOR("Zhifeng Wang <zhifeng.wang@intel.com>");
> > +MODULE_DESCRIPTION("Device driver for IVSC ACE");
> > +MODULE_LICENSE("GPL");
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
