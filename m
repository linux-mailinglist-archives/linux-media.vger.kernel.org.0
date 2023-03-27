Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EED66C9C51
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:37:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232653AbjC0Hhn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:37:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232646AbjC0Hhf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:37:35 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E6404C32
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679902613; x=1711438613;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=UnOZG1r3BXNqi/CZCwMONhk2Ly02iQ5bs/WbKWUcKHU=;
  b=nWeknnnm3HDAUW2++4JSf5mAJhUMt2wXcHqQww5j8RteyTb5NLQrWaam
   nwd/8grnEK8/FzKT6ZqZHftPMg3mvbUnUBgJCZSkdNrUdRgK3jFktChzF
   z1iGhiRFoUFQml/7apFTxBDuhWaD4aUKOBIKs6qZZpt3W7j8RrC0bJ1LF
   kQuFqAsMJkfvaDmkeR01JVSHBqyeh0BkUcwKBWvSZgvLQRed9Fp8UTsUW
   5S6SNSGhIYgJFYliMoUoa2te/xDU5ROZL6HjjeRb+8nPyVZoZyo3vj384
   d3Zv9hvK7jRCa92v9s+/71dQszzIeS1B5HIeiksG4nFyUE5DKj/5FRieu
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="340227625"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="340227625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:36:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="747896277"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="747896277"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP; 27 Mar 2023 00:36:40 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:36:40 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:36:39 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 00:36:39 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 00:36:39 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X5b4sl8fdlmT7MYEEB/1Yul0Z92muxnQiN4mR0I5VMAEsGiEX07JEUR9/BXTUAbsTmnoIqvI4cU0UvObqAEsYwY69T2d1uSBQ0bzo5aVA8CmMsbqsZ55gM8w+UeWVilbqORTwZIgYC+AU9OdC6/K8TQZTheFJRf2HtiV0e8RgR0NXB+tASqZpkR5x8H6El7oYWSd/TzrMhxFSdm0+j7xnp8yeE0mORqYbRE6PLwoim3I4HCFdBFCNjnw9+gSXZfF8YSG+yO2d82OK0oYgbXYBvwUrbjuft+4RI+smtoR95LDUS1D4m10bkWs6G68gwBnfOUCpjDaOueouFwWDgQXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5JCRR02KSY3xBmv26ImVdJM1BQ3ffwOthxH43FJmtzs=;
 b=ZC7dydu4MZmhsDwJ/JKdxrMCbr1f7q8r4/M8F/y4kW/Rzw1HfEddcnjorMZ7zuL+OUGs4xgN5S+mWdrEw6grdTSHC4U8PPCb1fx1z6qahyuAODI3jOua0d5MPC/1LN8e4XwOI5phTbcx+YhcBWVvHMXjuYtqTtMv+eCPfA//wLcvoQcQk6EDSYJjRRqrYowap4Bz4/Yu/XBwSS1Y6I1IIQp45m3qBgcsH+Ry8S2gw+EwsZwVPf6KrjG45u/2zebD8RCkiVBDnlIpObmluZ3PhnrKhiAPqbedw6l34Hi247fagIfwxhvyx+gqnvwtC9d4JJX/GFhoayERSEQ+pzIjdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by PH0PR11MB5032.namprd11.prod.outlook.com (2603:10b6:510:3a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 07:36:38 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee%7]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 07:36:37 +0000
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
Subject: RE: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to INTC1059 device
Thread-Topic: [PATCH v3 3/3] ACPI: delay enumeration of devices with a _DEP
 pointing to INTC1059 device
Thread-Index: AQHZYHSoIMpybNOzaUmhJ49K1Psa268ONIIAgAABrvCAAAWXgIAAAK4g
Date:   Mon, 27 Mar 2023 07:36:37 +0000
Message-ID: <MN2PR11MB43182CB5434AC3457C4E8DBE8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <1679898188-14426-4-git-send-email-wentong.wu@intel.com>
 <ZCFAjoaIG2VxtLJr@kekkonen.localdomain>
 <MN2PR11MB43180EF14AEB08D0969AE8378D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFGp3BMRUKlmqoD@kekkonen.localdomain>
In-Reply-To: <ZCFGp3BMRUKlmqoD@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|PH0PR11MB5032:EE_
x-ms-office365-filtering-correlation-id: 7eb8b31b-7680-430a-e6b0-08db2e95ffb6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vIRD0TDwbrevddIEWjY6f9UvsmHH28EeVzb+NoVt7oNOTMPqD0tGiAc1FBi8NDT4eL/Jy2YXxzEqfx9K6wPCeHMkYZf/UYEv7Fj+X+LC7nKcMHIQnjXiQr8Oql4rh2i+M/lcC+mwZTNT36VRH7NTcxBqlTyJdccLHq3M5R1zhz+cEJFkBFj5tvqhjY6SqLe+Al5EC/lTFipEkuZQ8i0o0l94oTebntSedi2mcbA9ai26FwCHlFMFAPZQ7dtPoe5o8UWP1agqKu1b9eRDXITMP2/amte2cwK1pN0IgTlepp3ai+vdn02W8fs23FMYSlTKeqDIXh5lLTmQcm+f5SfmIp5WvNTT5xCYh/QSf255XbdrZCD8afDJpL4YvQUModI4KUNwPkdqIT2KqBIBhMOSpXtksmnCzllKk3nNzpRs7hReS35wwJPjTLHdQyNf47q4QdpWgeG/tZYsoyCG1C4zbN1vFbcE51qQg/xmVIfgkPfTAp92giwSE1fYYMoTPCep9R70N58YylKL/UdwewR+iT89bKcOvG6YcYqtdOHkCRpxU3CqCoPfc4g5INuIw5aj74E+g+5vtwLDH+VQJ6Vpk450A5Znpi6rgm4MFpMXkrRTzw0vfbv1mz/qGU4Q0dsH
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(136003)(376002)(366004)(396003)(451199021)(83380400001)(52536014)(41300700001)(33656002)(86362001)(5660300002)(38100700002)(82960400001)(8936002)(122000001)(54906003)(478600001)(7696005)(71200400001)(76116006)(66556008)(64756008)(6916009)(8676002)(66946007)(4326008)(66476007)(66446008)(2906002)(55016003)(38070700005)(186003)(6506007)(9686003)(26005)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?vYbQjBVA5tcQSV+SEsdIZKn7IagXmCH406sE6Xmlo3NIz6kmUCbY0E0d5Cdy?=
 =?us-ascii?Q?NHwj549kgk1jP1c3AD1ks1R2jctfOnuKd6JjgpaOK/PuTFeAG7tEwF47mz3y?=
 =?us-ascii?Q?ndb2oYl9+bmP8r4Id17SUSCa1Fg0ebxayZaS7VZyX1GvTi5kwkK0WblMZtaT?=
 =?us-ascii?Q?k3w71ZtVSCEPf4hQJOpyxNZCtRi8Xt0d6KRfGJ6DEY8MNP/nLhGuqrV6GO+z?=
 =?us-ascii?Q?IBdjd1t6VgkjKh5J60CMjoVvC0KiYlujn2Uxe2zkRj3n8Y1XIY2NKn071QbW?=
 =?us-ascii?Q?RscBvvaJQ2xmuCQu7xBpuQgshRtimMu+zM89O+KMcuzJMX+ysUT4Sqae3dOB?=
 =?us-ascii?Q?RqHxLTy+tCI59vJlfmihXDeT09hlqa7lfmrB9rWc1ciPIFpi7H8ttLgfBbg/?=
 =?us-ascii?Q?RVj/cieaTtWW6twPpLyIvDiKLz1a3hEm9J4v6wF7uo0Ej3J08itxyG3//JsA?=
 =?us-ascii?Q?+25cx79Qvwv4kZb/9IDtWg6obqD813cq+niKTKcYp7HH0JwOnX8oU217vBFO?=
 =?us-ascii?Q?PqDVDiabufVd11i+rR780Zhh/Ce3ktbG4bwYwAExEsgOk3bWZlVoqLHcCv91?=
 =?us-ascii?Q?bYmjiHlOI4C3mTLZqrMNHF4aQuG3NiPwx28bi1NOIWxuygQXfk4wn5wVu9Ov?=
 =?us-ascii?Q?J9KILul5fNFSK3R+H+gSYnzUWQDuJXOOHEHvhOvv4oZB3QONzq+kpGoT38ac?=
 =?us-ascii?Q?1gsnHap8fdAK2lQL4HUfy71oPXLRRwVxJB0amNoPQObmQ5q6NN3o1KERhob8?=
 =?us-ascii?Q?G7f6b5nxp+hdHPBrxDQ9nqxEWkoQ8ak5MCzDtznGOpNdnwwKU3/UV4M6C6iF?=
 =?us-ascii?Q?OwQIn7hCSLGm4py0x3LCcDUZugUde2pMrDLg4UWFScZq8les/ktC4TnkFIqY?=
 =?us-ascii?Q?yKLitZrc7YpCmkrZjM4rmyFiVmeV8V/RfzetZnWL6pu7n2NOHZi3OVXvk82g?=
 =?us-ascii?Q?g1zv3wFAxEIc52jrZeO5HUmKjp0nCXAwF2mx8uQiguHG1EZVlnq473VmoyA6?=
 =?us-ascii?Q?P9vzLSP9u70+RZ3y0Om8LrLaB1XxzOpdNGXX9XFwZaW1u6tqIJ1xPIzdTXdd?=
 =?us-ascii?Q?4zF92A3mbKCir8f+SygjBEGITE40O+/qpl7kb4k4R/Mwg7MhboU1eXzxtDsS?=
 =?us-ascii?Q?iIe/kl+SsVNbX0qa8RXI4BZsQUT+ksurJ3YN7v0m6ysu/rEsfwTZ4DqZgG8v?=
 =?us-ascii?Q?u83rTaWes9oPSYA6X39SeC7CQxIdu3qpCC6AmWHT4OguTCliWP2DsntGzX2t?=
 =?us-ascii?Q?h9qN3smPlylmESSuu3CahuK9d5AGBwAFOa2+1Lxm5ih+n0O3QFI8fLEh8q6f?=
 =?us-ascii?Q?Kbb4GysYmiznHq0Zhk4EhH3D/Nh9bU2zx8smnweOzkXz121C5AWUXVDAWK3B?=
 =?us-ascii?Q?vdJD6M6zQRTrQB+SIpSJ2bjTOk4TA7DWZNDOGljUMfJBeprrnn2GI4T7tfqy?=
 =?us-ascii?Q?alOXXjWCWeLONp/P9/7E9YTBmUHIIrPLCp17wsTSxrSDV4PYBydCd1w+S0rQ?=
 =?us-ascii?Q?YN3STohyTY0w9B8t/bKij4/3bf9nCgkMx6JLyg0eegvNNCrtO9Fjut6JPJua?=
 =?us-ascii?Q?a7sq8Rvne4Wxlmkn+sJ/RiPGjF3mjN1lhBriwTsZ?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7eb8b31b-7680-430a-e6b0-08db2e95ffb6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 07:36:37.7769
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Hfjcsj6HwBmLvjwLLv3LLG/OVxNQuMN1Be+qTON9W+pVHjoTBbIPXJtK2J4jvh1VDoulh8Sp8bEQJ1gA3Yn9Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5032
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org



> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Monday, March 27, 2023 3:33 PM
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 07:17:13AM +0000, Wu, Wentong wrote:
> >
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > >
> > > Hi Wentong,
> > >
> > > On Mon, Mar 27, 2023 at 02:23:08PM +0800, Wentong Wu wrote:
> > > > Inside IVSC, switching ownership requires an interface with two
> > > > different hardware modules, ACE and CSI. The software interface to
> > > > these modules is based on Intel MEI framework. Usually mei client
> > > > devices are dynamically created, so the info of consumers
> > > > depending on mei client devices is not present in the firmware tabl=
es.
> > >
> > > Ouch.
> >
> > MEI client devices are not ACPI devices in our case.
> >
> > >
> > > >
> > > > This causes problems with the probe ordering with respect to
> > > > drivers for consumers of these mei client devices. But on these
> > > > camera sensor devices, the ACPI nodes describing the sensors all
> > > > have a _DEP dependency on the matching INTC1059 ACPI device, so
> > > > adding INTC1059 to acpi_honor_dep_ids allows solving the
> > > > probe-ordering problem by delaying the enumeration of ACPI-devices
> > > > which have a _DEP dependency on
> > > an INTC1059 device.
> > >
> > > What does the INTC1059 device represent?
> >
> > This is the IVSC device on which camera sensor has _DEP
> >
> >             Device (CVFD)
> >             {
> >                 Name (_HID, "INTC1059")  // _HID: Hardware ID
> >                 Name (_DDN, "Intel CVF Device")  // _DDN: DOS Device Na=
me
> >                 Method (SID, 1, Serialized)
> >                 {
> >                     Return (HCID (One))
> >                 }
> >             }
>=20
> Should this be interpreted that if you have a _DEP to this device, then t=
he IVSC is
> between the sensor and the IPU?

Ok, I can explain more in next version patch set. Thanks

BR,
Wentong

>=20
> --
> Kind regards,
>=20
> Sakari Ailus
