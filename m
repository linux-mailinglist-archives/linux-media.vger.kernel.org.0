Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3D0766EC36E
	for <lists+linux-media@lfdr.de>; Mon, 24 Apr 2023 03:38:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjDXBiw (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 Apr 2023 21:38:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbjDXBiu (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 Apr 2023 21:38:50 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAB8C10D8
        for <linux-media@vger.kernel.org>; Sun, 23 Apr 2023 18:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682300326; x=1713836326;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SCbyxpdgJ6YxzIVmgtoS0ABmBSoDeSMA3D3YQsx0twc=;
  b=dLMow55GJxrcxc7jQ3qI4hdEiaDL7qt+xmOgfm35ZzuLDBZi6fVAPlIK
   8AFjHL3IMeg1oRg0rbH1hqdzrUjP53rkoFd56sm9t55nP6F+uBsGeEGe2
   E4pOdk87dqwsafSeyif1H2rVp8bi7h7xP/cFcAEGPXm/iYXVdrKoz8zkg
   lDhkr9w1r9pKwBfFAAjR5cVAzAOrKpwB31hUjb6DUuVTHPyCWLMAhYO9/
   FvGUAflS8FrCAJOBNlfTh1wTmCa3o0Mn+EcgGm9FM0NtK3hJQwxPVx9ZD
   VlVFofifKQFDeHO8Zr1v7A9RsSuhhOwuelf+PFRA8uAnRkHCqmi4X8yDB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="348246319"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="348246319"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Apr 2023 18:38:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10689"; a="817076077"
X-IronPort-AV: E=Sophos;i="5.99,221,1677571200"; 
   d="scan'208";a="817076077"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga004.jf.intel.com with ESMTP; 23 Apr 2023 18:38:45 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 18:38:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Sun, 23 Apr 2023 18:38:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Sun, 23 Apr 2023 18:38:45 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.47) by
 edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Sun, 23 Apr 2023 18:38:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MDsPmFgsrVR+o7JEMr34iGW8/GVJFS4IrtyL9yYtD+NeZJtaWUsVKZ8cIRJEDgxAm88KIHoryEVIsF16t26+rNp8cDrrtxJlzRDP6f3dfWT7zVuCH5kdSUsUr9BALKoXlph3wmv7QMV5wqvJ1tgTaHnY5D34sWCkWfrb7mae8vbSWhZbGAVUK0QSjtVYWS9+Rc4yW8PDIGu1/gyp/o7i8btswm20SGs5ne9TdB2SOjO5h/taz0jYbtxy3kQUkPGB9nuqQ+NLMokXtK/Zk3Jc+eSEG87EG432DoOqLKynkWIbrXdLOQCCWh9AcFhSUABQF4ca9k1gh+pNNwUNjIoQ/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zEQIsSdCqqai1FJDE346P432a1+YpWgWTGyEnjFO9JI=;
 b=hq+5yIIvmP72bUs7oKE277okfFecNs3yhZHXWqS2uWc8b05gi0eu8R+N3xahakQqCC5WKbDz1aoE9J/CjcEt+1IWjTOKHWk1bf9qY2CCMy7ClTW2JaxLiWwzNEHr+O0D2xLFGGFvKM24tW2BREXwvK6/2khCPapnUgp5HPVAEtb6Ya4/VqjlLFwMH6VKpt5l5BHxGwu2OtXR/49RuaJ4TVGHMBYv7jJatLyWDDdxEgCaT1UNGXWHoBNyoznhYGomMhpFTLZ1vxfIfVCSkGRAGpRwyHdNFGk/gZv3u10mgDjbFBSlrdioq3Z5n6aK7YNIk9M0HPrtjFVW56/rkhNk4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by CO6PR11MB5652.namprd11.prod.outlook.com (2603:10b6:5:35e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 01:38:42 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::7caa:b0e7:d0fb:c905%5]) with mapi id 15.20.6319.033; Mon, 24 Apr 2023
 01:38:42 +0000
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
Subject: RE: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Thread-Topic: [PATCH v5 1/3] media: pci: intel: ivsc: Add CSI submodule
Thread-Index: AQHZa1qb83vOHs0GwUmrsoEqBYfnoq85MxwAgACGYOA=
Date:   Mon, 24 Apr 2023 01:38:42 +0000
Message-ID: <DM6PR11MB4316D6790B4795647537A2E08D679@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
 <1681096465-17287-2-git-send-email-wentong.wu@intel.com>
 <ZEVj2Je9sNKDcBXn@kekkonen.localdomain>
In-Reply-To: <ZEVj2Je9sNKDcBXn@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|CO6PR11MB5652:EE_
x-ms-office365-filtering-correlation-id: 490cb8f4-90e5-43c9-6b57-08db4464a2dd
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NVWphNY/ftp3ItvddsTmmN0Cnwaa9zdbdtYu0tThkwzLMko6TRvokIiGzuzmpDxdNnqrbtSUJmB18A8m1mRG0+6UURWZf/M828DkGWmo5p0L/s8/4lrO16WkhKu3r2SYxE2tumCjKx5Evlww9HIZNKhq4Ft2vM6iPf5L/UVmgKJvOPcDcIpFxUuTokUZiD7xagN1hW8aEZeFGjEJfml+4Xc79dtftDG+dfTbKn5z/UMqfEnwPc89ts5wFXv7XaI3eIE1fMM0I7TGPCqRogD5OLjM3hvY7UPh3TUQx6q/bEzeO6kruA2DPvyVzZcEPEjhn9y0Jc9Lhn+juVF7yvL87I1xs6/H+OcV/11PTlM9wwn8ccdZzL0asMsPrNANqWXUdWSOy9APL8QSxNRxUOzMh4W7Evy7BHPLegrwhfGWyrnHk2Rw4mYHhfkyeOswPavsy2uULhhDnOmET3Ikt2QCAkfQ56UXaako2isVkWu6okVRR4Z7luXIvXHdbtkcz/aZxie9N02whBGxeL/lj33IMmvaZ8OXLEaop2MdWu2qgrSquBQuDj0Yr2y4A5ZLGucyPgkEbjr45rMDihzlg17J5YiatqmKxxTw0msgeocIJWQe63P80Pf+tVZ6m6KbzKfO
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(346002)(39860400002)(136003)(396003)(451199021)(478600001)(66899021)(54906003)(86362001)(186003)(53546011)(7696005)(26005)(9686003)(6506007)(55016003)(33656002)(71200400001)(4326008)(6916009)(64756008)(66446008)(66476007)(66556008)(316002)(82960400001)(83380400001)(66946007)(76116006)(2906002)(30864003)(38100700002)(122000001)(41300700001)(8676002)(8936002)(38070700005)(5660300002)(52536014)(579004)(559001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hSROyTcxHtNd51BZfujRc/wAAgWlJ23DMmitJR0dPdyKBWGMd0ZTh1ENsqXR?=
 =?us-ascii?Q?oUCSouZnrmiknerkZStOmG9i6vTc8Tg2w2Frv+N2Q0WdRRcT3kx5GstXfDFl?=
 =?us-ascii?Q?BotqciAsYeFzJOkWp4/BV3/DkjA2YGvKlbTq6/LpOM2Jp9Dt+P3DhPFNtgns?=
 =?us-ascii?Q?4i4pDeGvKKREKL6OIUQsjzCHCfPzVk6tO2bkirSRV7GYJj+mzDAp3qGmLmnw?=
 =?us-ascii?Q?ifSmJ+px6XyVyo/+PMTN8RTM0MQeZFxyOmron5Ewt2j+2jJ70MK08KbePjDU?=
 =?us-ascii?Q?c6WKKNmSW2HdHKfjfUkqhhJsFuJvn0IuVxD/93V2yvq9ruJn4Jmd99DGQUi7?=
 =?us-ascii?Q?nLL0tL+/FeehaOGZx+PhcV+6kDvfwzWGeFoB2N7m/KkzDP7LZZ4jlgZqp/EK?=
 =?us-ascii?Q?F4HOSTkXXRcGGcR5cN0hnUlWFJ2g8VBivC5kpqJ/VIgHYojKomYZi58VYFQa?=
 =?us-ascii?Q?iBLnT2QcO3Y9N9Nf1dYC/RD/d4k7+7Sfk0g7f3nKC+sv2v+X5859+NnWTJ1z?=
 =?us-ascii?Q?sHGrN7aXRp+oQ69RS/iljXoCbYTrSkST8WtnUDFWeAmWNq6qJcZ/R060nesv?=
 =?us-ascii?Q?01kyBSd2nPKgtHsY9jcBnnLqQjc6FS+OfJhTA8P6ZTs12JDL7G6LUnhNeEnc?=
 =?us-ascii?Q?9TUxXs+mnfJvUhIY+DMy/oB7r1+xDKuusWkdZ1c0Ni8GVXUx9A1M4lpk4jHg?=
 =?us-ascii?Q?lLfAEnnw49ZlKQjI7NgOr7QlfJzo1PvVEUy5e/BtMnZfZa1s9PmsrY8cb4yI?=
 =?us-ascii?Q?OTSF81xVlrX+bEOfnH4KHeztFEuhhC9uJQKt78Hl9LF31Czs1BCCqt+SwA0o?=
 =?us-ascii?Q?IXWDA/IpQxsidM7solRxhGP3JTqa+wQacN0hNKeFSCt73MtnO/l4QBZPq1eL?=
 =?us-ascii?Q?6ezcVc+grgny4HCZuZiR4lySy3byBAdYFcV6l/CtAZmEpWMOYEh9gpUVNcH4?=
 =?us-ascii?Q?DyjQgzNg6bsAv/DR+UT3UQlKr5IyUkeFIvFPgNI0NUTQGlKuDzI2+caaKIbd?=
 =?us-ascii?Q?ms/NAto+ZUsVz1+HO0GGcalHCndJeF2F3fFO2kXwDAFPHe/fw8SQUTuCL2XX?=
 =?us-ascii?Q?r+g23C42/nUM6sDQ5Bq0STn2zV2RMTRBCExLAtMpwQu12TTbA7MNUzC+cnIl?=
 =?us-ascii?Q?pQNbD4r7i17wrRgyrjbGGGCcCpq6iTo8Kax9M5lftLB59+u6hF23LLcnbmsJ?=
 =?us-ascii?Q?dUvPDxfk73KF9ge43NOuuGf5TliUFt08tnOPt7vu+IqMDvK2nGt6njaUTQbY?=
 =?us-ascii?Q?K9D6+0IRPNWCCtEa1PwvRfI3LPORK4arDKaoiVJ4LYNFSFilriEv/fGsO0sm?=
 =?us-ascii?Q?C3FI7c5BbIRztCTEMCJvucOIDaYw3hPPZ7tiE8QZGNJ/6RkLropVowKMaW01?=
 =?us-ascii?Q?vn5Bgs6+e1mPPfeytBH6uWlEYx6MxGB/LBLvludBNLgdW6c71bRJ6JiX+TKl?=
 =?us-ascii?Q?8kdVAC1127rkujNliDSRdhYHGCjPFxUbuYhgr0iN1CJ1K9qmf4XD85dbGkvX?=
 =?us-ascii?Q?zy8Dj3/uJ+ZdODYCPXpmMw7GU4EEtu6Q4+DF/Bzd5/hGwxvxDK3k4AQNYoFR?=
 =?us-ascii?Q?k883zZqAQWWyo/CM5Euq7DFldS6/kDcljc8piwfy?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 490cb8f4-90e5-43c9-6b57-08db4464a2dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Apr 2023 01:38:42.2666
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KFuNs26RlghdMuLn+vj7WBvxyXleFBxq3yQTo5RtBUQocKDNtjmclE36kZEWG8nK01eV52pns+b9siGTQ5wYFg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR11MB5652
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks for your review

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, April 24, 2023 12:59 AM
> To: Wu, Wentong <wentong.wu@intel.com>
>=20
> Hi Wentong,
>=20
> Thank you for the update.
>=20
> On Mon, Apr 10, 2023 at 11:14:23AM +0800, Wentong Wu wrote:
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
> > turned on, user is notified via v4l2 control callback.
> >
> > Signed-off-by: Wentong Wu <wentong.wu@intel.com>
> > ---
> >  drivers/media/pci/Kconfig              |   1 +
> >  drivers/media/pci/intel/Makefile       |   2 +
> >  drivers/media/pci/intel/ivsc/Kconfig   |  12 +
> >  drivers/media/pci/intel/ivsc/Makefile  |   6 +
> >  drivers/media/pci/intel/ivsc/mei_csi.c | 772
> > +++++++++++++++++++++++++++++++++
> >  5 files changed, 793 insertions(+)
> >  create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
> >  create mode 100644 drivers/media/pci/intel/ivsc/Makefile
> >  create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
> >
> > diff --git a/drivers/media/pci/Kconfig b/drivers/media/pci/Kconfig
> > index dff0b45..c157f7c 100644
> > --- a/drivers/media/pci/Kconfig
> > +++ b/drivers/media/pci/Kconfig
> > @@ -72,6 +72,7 @@ config VIDEO_PCI_SKELETON
> >  	  when developing new drivers.
> >
> >  source "drivers/media/pci/intel/ipu3/Kconfig"
> > +source "drivers/media/pci/intel/ivsc/Kconfig"
> >
> >  endif #MEDIA_PCI_SUPPORT
> >  endif #PCI
> > diff --git a/drivers/media/pci/intel/Makefile
> > b/drivers/media/pci/intel/Makefile
> > index 0b4236c..d27ca63 100644
> > --- a/drivers/media/pci/intel/Makefile
> > +++ b/drivers/media/pci/intel/Makefile
> > @@ -4,3 +4,5 @@
> >  #
> >
> >  obj-y	+=3D ipu3/
> > +
> > +obj-$(CONFIG_INTEL_VSC) +=3D ivsc/
> > diff --git a/drivers/media/pci/intel/ivsc/Kconfig
> > b/drivers/media/pci/intel/ivsc/Kconfig
> > new file mode 100644
> > index 0000000..9535ac1
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ivsc/Kconfig
> > @@ -0,0 +1,12 @@
> > +# SPDX-License-Identifier: GPL-2.0-only # Copyright (C) 2023, Intel
> > +Corporation. All rights reserved.
> > +
> > +config INTEL_VSC
> > +	tristate "Intel Visual Sensing Controller"
> > +	depends on INTEL_MEI
> > +	help
> > +	  This adds support for Intel Visual Sensing Controller (IVSC).
> > +
> > +	  Enables the IVSC firmware services required for controlling
> > +	  camera sensor ownership and CSI-2 link through Image Processing
> > +	  Unit(IPU) driver of Intel.
> > diff --git a/drivers/media/pci/intel/ivsc/Makefile
> > b/drivers/media/pci/intel/ivsc/Makefile
> > new file mode 100644
> > index 0000000..cbd194a
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ivsc/Makefile
> > @@ -0,0 +1,6 @@
> > +# SPDX-License-Identifier: GPL-2.0-only # # Copyright (C) 2023, Intel
> > +Corporation. All rights reserved.
> > +
> > +obj-$(CONFIG_INTEL_VSC) +=3D ivsc-csi.o ivsc-csi-y +=3D mei_csi.o
> > diff --git a/drivers/media/pci/intel/ivsc/mei_csi.c
> > b/drivers/media/pci/intel/ivsc/mei_csi.c
> > new file mode 100644
> > index 0000000..a0b06a3
> > --- /dev/null
> > +++ b/drivers/media/pci/intel/ivsc/mei_csi.c
> > @@ -0,0 +1,772 @@
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
> Could you initialise this in variable declaration as I requested earlier?
> The same for other similar cases.

I believe we have discussed this on v3 patch set as below:

	> > > In some cases you're using memset and in others not. If you don't ne=
ed memset,
	> > > I'd prefer assigning the fields in variable declaration instead.
	> >=20
	> > The declaration will be like below, but it will break reverse x-mas tr=
ee style.
	> >=20
	> > struct csi_cmd cmd =3D { 0 };
	> > size_t cmd_size =3D sizeof(cmd.cmd_id) + sizeof(cmd.param.param);
	> > int ret;

	> It's not a problem if you have a dependency.

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
> > +	struct mei_csi *csi =3D sd_to_csi(sd);
> > +	struct v4l2_ctrl *ctrl;
> > +	int ret =3D 0;
>=20
> No need to initialise this, it is always set.

ack, thanks

>=20
> > +
> > +	if (!csi->remote)
> > +		return -ENODEV;
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
>=20
> Please use v4l2_get_link_freq() as already discussed.

ack, thanks,

>=20
> Didn't we also discuss that you could do this in the s_stream() callback?

We don't need configure CSI2 link if call s_stream with enable =3D 0,

But I'm ok to get this in s_stream, thanks

>=20
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
> > +		if (ret < 0) {
> > +			dev_warn(&csi->cldev->dev,
> > +				 "failed to switch CSI2 link: %d\n", ret);
> > +			ret =3D 0;
> > +		}
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
>=20
> Fits on previous line.

ack, thanks

>=20
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
>=20
> A newline here would be nice.

ack, thanks

>=20
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
> > +	csi->privacy_ctrl->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>=20
> You should also add the LINK_FREQUENCY control. Make it U64 and and
> VOLATILE, too. This way the driver's g_volatile_ctrl() gets called when t=
he
> control value is read.

ack, thanks

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
> > +	if (IS_ERR(asd)) {
> > +		fwnode_handle_put(fwnode);
> > +		return PTR_ERR(asd);
> > +	}
> > +
> > +	ret =3D v4l2_fwnode_endpoint_alloc_parse(fwnode, &v4l2_ep);
>=20
> It seems you're parsing the remote endpoint properties here. This shouldn=
't be
> needed for any reason.

We need sensor's lane number to configure IVSC's CSI2

>=20
> > +	fwnode_handle_put(fwnode);
> > +	if (ret)
> > +		return ret;
> > +	csi->nr_of_lanes =3D v4l2_ep.bus.mipi_csi2.num_data_lanes;
>=20
> Instead the number of lanes comes from the local endpoint.

The lane number of IVSC follows sensor's lane number, why local endpoint?

>=20
> > +
> > +	ret =3D v4l2_async_subdev_nf_register(&csi->subdev, &csi->notifier);
> > +	if (ret)
> > +		v4l2_async_nf_cleanup(&csi->notifier);
> > +
> > +	v4l2_fwnode_endpoint_free(&v4l2_ep);
> > +
> > +	return ret;
> > +}
> > +
> > +static int mei_csi_probe(struct mei_cl_device *cldev,
> > +			 const struct mei_cl_device_id *id) {
> > +	struct device *dev =3D &cldev->dev;
> > +	struct mei_csi *csi;
> > +	int ret;
> > +
> > +	if (!dev_fwnode(dev))
> > +		return -EPROBE_DEFER;
> > +
> > +	csi =3D devm_kzalloc(dev, sizeof(struct mei_csi), GFP_KERNEL);
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
> > +		dev_err(dev, "mei_cldev_enable failed: %d\n", ret);
> > +		goto destroy_mutex;
> > +	}
> > +
> > +	ret =3D mei_cldev_register_rx_cb(cldev, mei_csi_rx);
> > +	if (ret) {
> > +		dev_err(dev, "event cb registration failed: %d\n", ret);
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
>=20
> Please add V4L2_SUBDEV_FL_HAS_EVENTS for control events.

ack, thanks

>=20
> > +	csi->subdev.entity.function =3D MEDIA_ENT_F_VID_IF_BRIDGE;
> > +	csi->subdev.entity.ops =3D &mei_csi_entity_ops;
> > +
> > +	ret =3D mei_csi_init_control(csi);
> > +	if (ret)
> > +		goto err_ctrl_handler;
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
> > +
> > +err_entity:
> > +	media_entity_cleanup(&csi->subdev.entity);
> > +
> > +err_ctrl_handler:
> > +	v4l2_ctrl_handler_free(&csi->ctrl_handler);
> > +	v4l2_async_nf_unregister(&csi->notifier);
> > +	v4l2_async_nf_cleanup(&csi->notifier);
> > +
> > +err_disable:
> > +	mei_cldev_disable(cldev);
> > +
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
> > +	{ /* sentinel */ }
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
> Regards,
>=20
> Sakari Ailus
