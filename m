Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 66EFD6E1E5A
	for <lists+linux-media@lfdr.de>; Fri, 14 Apr 2023 10:32:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbjDNIct (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Apr 2023 04:32:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229457AbjDNIcr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Apr 2023 04:32:47 -0400
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D90BD194
        for <linux-media@vger.kernel.org>; Fri, 14 Apr 2023 01:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681461165; x=1712997165;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=igFcVoqYB3DgaSHsSKk8DiFx6rnxNOuEMbtvJSnTL0w=;
  b=J5msk8okAssoV/DkiOH53o2H0i3Kku/OpfXnLbD7E5ruwD5qda8uBZRr
   IE7pQpLiGTKqQWXprpjsE32NpNQtQ7cwUm+xu6VYaVV6fPQMkqd6hrHHM
   YSufXb4iSYCVMEL6lIMEI0ElW3Lg6ufIL8KxBx7TmCUbLSt22t222BADx
   O8GFNAWL+LRg3K8YJZqdri2VJ+ts+e8IdOuOPRXneBS/oEbjOXbh3F5l3
   DA33cgAL+Py6G9iAdypbhxgOW6wiu+E2Tat1WpNqlSxGRrMeI8WQP0aWJ
   IbtE2NTx1pTS5GbJnTJ4cRqcBuPVUnFBNCn4JU0FBhMRjCUtLdFQRduBX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="372277758"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="372277758"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2023 01:32:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="689730148"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; 
   d="scan'208";a="689730148"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga002.jf.intel.com with ESMTP; 14 Apr 2023 01:32:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Fri, 14 Apr 2023 01:32:44 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Fri, 14 Apr 2023 01:32:44 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.102)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Fri, 14 Apr 2023 01:32:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ROfk2upui3kjLmga3nvcWq5+tC7z4OJkNdplbm27D4V1mytflyo1PlcgtxTEW/F8+vlfXqohvCr47/bHtSLcF6hbeUdo1iUWNgbKLklgWngJt4nVq4MB1fE+5nNQtC7TizNYJIbpvigb5ZRU7I9KGYGt68I17ZxNbLm1TUmO8Bf4lTT0wnQMStBTmR911wkrmCu9mj5blsc/M3X7TESGH6Peq6pcH8BLZWSTk85uR78hOoTi1TMKpqbjBToyCyaopQP+M9+f9cZyFvMYnElAfaavnmqHB25X5dHpX4gSPA4xU4MjWJpicI43FWunPuVDunwUlARnAlJyEv1f7rCXyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7QHhcgQZpghTFgVecVSf+TQkdBP6px9/shpn9luaBGI=;
 b=f3XujXRpcy41AyShe7aK8Ut22tujm79PnQCbucWifm7D9MzsqvT/za19bMkvVMs/+DbspvlD4gX28Zw2jtLhNJDDYStvDRasCtnOgs3tUO3Lzoc/OIUhdVqljhasngWMLN6AZ2lTN6BnrW8IQsRYwtBia/LMavNB95Pdbe4o40Tupy9mLpuqX0jsGC9ccjwCqnJBMAOqjrJ0Yiipz08mXn33dqBPyb0CKQB1H3r/a1Unzydl/bw4OSE3mSIOb7dxQnlyyhYa9EVpQLHbslWHgVR4zFMeaBV9P/Vb76EIpq55h0fcVGigJcOUMBvmazXpEpWn3dazN4CYChQeYXjQIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by PH7PR11MB7097.namprd11.prod.outlook.com (2603:10b6:510:20c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Fri, 14 Apr
 2023 08:32:37 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b6f9:de9d:c70a:6f54]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::b6f9:de9d:c70a:6f54%5]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 08:32:37 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v5 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Topic: [PATCH v5 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Index: AQHZa1qXkpFtN4gq1k+QFICPdjfhLq8qgF3A
Date:   Fri, 14 Apr 2023 08:32:36 +0000
Message-ID: <DM6PR11MB431643C55D91CFAE65DF36E78D999@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
In-Reply-To: <1681096465-17287-1-git-send-email-wentong.wu@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|PH7PR11MB7097:EE_
x-ms-office365-filtering-correlation-id: ab4fef69-45a3-498f-ea21-08db3cc2cd52
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 7shpIjcCbpS8FqiR4BmnJ+yDQco1kAbPJAC47URvzzNExATlJdnTryBFqPO4AQxJvv+/ZfDyvolWQkbMw9Z/vL2C2Iiey66l27MOLtZohU6NVnGP7wuOaDDQwLyi9Z8uL8PMuC+xDZ8HvcYuTpUQEKfUh/4tGGTI9AnakD+NmBBZUKK0SLL5oVTq/mjp71CDouuVT7KfTFZvOdSaHi/rwexylA/Zhjhs4f9b2VOBej2pFkgxp8/2TxAF7bIBv3f8eWwqyNE+uNCoPSpYYwCMugjMidu/H4a/rDqVIviyVIn15/MDQ92dEcniVpKZCOHWuPIuyYQjl2D54gZzAjFbpVOk40kEeg/ZOEG08NVIxy7MV+kD8H5Ify8/Ucs8SVP1ryX8AYU4yR777xrdZH1ky8r1YqBQaYGAvNSt/pvF3lAlQrxDuAyZzeE3oRTM3lentUQdvHbRym8JEzfkZtKDOc5ws3DvHaGlVBlwy3C5oKYx5g/lWERVs21JC5YGpVAUSL2Rvaxeb2MsSIuC5bu/ZsVdDs8VNLQCx/TSgCqqInucoGsOV8FeoYmbXC+PklrqLEcdcuWcaaYWX2GGKXnq2de+4Rhd/gUg965DUbZAkw2JLd5Cks36zy55XmijUlnV
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(346002)(376002)(366004)(396003)(39860400002)(136003)(451199021)(478600001)(33656002)(86362001)(316002)(110136005)(41300700001)(66476007)(66556008)(4326008)(8676002)(66446008)(7696005)(76116006)(66946007)(54906003)(64756008)(71200400001)(38070700005)(55016003)(8936002)(5660300002)(2906002)(52536014)(186003)(38100700002)(122000001)(6506007)(9686003)(26005)(53546011)(82960400001)(83380400001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?3YD5XSVMd8GqnqtJs4DJIOleXnntxUL+8OxETpqp5RAOJZLlC9f0MHMj3I63?=
 =?us-ascii?Q?LzJafLVd3aYv38GdJWe4OUX67GsyzHyTYEo4Hcd4X9452wSj2sFYSRksaxeT?=
 =?us-ascii?Q?Cuu9naCXogFsAXcaDmKwIyeNF2Tszh+ID2xHVHZuEisqPC3lB+mKMX6Jw4/6?=
 =?us-ascii?Q?5GCHC4GO+rbyHJgUuxfPQwmQq1cIeph+jdlNg21KA30QHRqpSytNlbx30irt?=
 =?us-ascii?Q?CmNuV++hwmnjlcSCMScagZE6Gg5Aasxb9MwbGl2IFb1Hl1P4rrtsnjBcKPBk?=
 =?us-ascii?Q?uoawzT6htxZDRTTvdosrH84LWsSQlIoHeolmpCVyJjATq8qPAiVkcqOltyU6?=
 =?us-ascii?Q?n7KQoirc/KMloBBCYYTsnCxPA7znzmHd4Dq7Q+5R1iZXhVZmnCR4tS5kWyqO?=
 =?us-ascii?Q?V+uuy80tF+KtU/SKgQDQ63C+M+AkgMNB1Bl3UOJ2Va+j0N/4AKj9XD2wsmzz?=
 =?us-ascii?Q?Fouek2Edg/di/iY1KBhtYPPM+gXgck+usWPCBaoTBdWCmbp7FulnVkN8+zCb?=
 =?us-ascii?Q?PhGl2yDITbugFVczN7IW6wvZGRdnW/n1H8wJVjRWBtTZ0ay9FTsebyQoIXKx?=
 =?us-ascii?Q?hFk1wD5B3uVt1d9IylcM8+sOt78SAqdjDXs5kfG/pmrz7ixpNro/0czWZp3h?=
 =?us-ascii?Q?xuaHpixrBnFzDNqVRc8uxVmEuDLFuPz5ViDjWhX21d7vrTfc5Hg1HFQ5hmFF?=
 =?us-ascii?Q?5YMZANXGW7b7VITdSwsq5T5fsmJHlqfz4VdWg5eYToUrV2S2UgTlgySNiHaZ?=
 =?us-ascii?Q?keXOLQ3FY67KMkNKzCL8zk9aaU3IXXn/5+PpRtlzhw5LNMKgDqWx4ATHIZsu?=
 =?us-ascii?Q?SWbwW1XJQb+j+s1Zgq6j+SC9MXi6vvVYw2ULkmtBBrWQ2Et+Cv+EJtbkpYnz?=
 =?us-ascii?Q?7hcP+Zzks9H5kQpI3kP1KLMaEO+b/q/HOPmJC9gHLvVEDjHq4DoVtAwaJY/z?=
 =?us-ascii?Q?mxPXbg8mreST7my1dSnJSvNYSno4a9V18emi3VDmHO9caNK6REIk16UUxtiX?=
 =?us-ascii?Q?jzmAT3T6b1J8SW28l9BsZtAd5qKWLjym5AzENA7CzIrH/dOtaI116AR8vZn7?=
 =?us-ascii?Q?8WW+6rV65qjry42bSwRLIGWgl5VwMaeHqZiuulnp9aW6fvmTvhYGBNC3xImu?=
 =?us-ascii?Q?q1IohH1EPdcigO+djSKmo+cljYdicSTrSALuMqp2PJFGKBtl57dvlKdRCzue?=
 =?us-ascii?Q?n/Ix9uEs7yZxhsX+q1+77bl0IaR1tT3X1V4Ut2KhmweIFzrNSq2kGXBUHbU2?=
 =?us-ascii?Q?WMExqUSN0DKIUZlQriiy9mcLRqL3K7tdyxfjK4BZO71pKXv+j50PGmNedeRv?=
 =?us-ascii?Q?AA6YwlQOmwgtI0VdSuhy9xlaS5gI9JvJHPA0WizBFaQYkmIme9hNdRiX+hxY?=
 =?us-ascii?Q?Dafw6/yPmdaOSyEhaZ/Jgbx31zoUTjCRB0aIRKxs8LCtdEsfZdFnA1Xpz2SH?=
 =?us-ascii?Q?5rrT6TPMx3c48BERRnJbcxFVmFJtg4uowIWkY4hA8MiAaJ1DhYdg5DVJlwSa?=
 =?us-ascii?Q?8bm8IjPWd56kA58ogTShh5FSpBZb7WYc1mo4vojNutSeMOkCnr4ZmqvweW+f?=
 =?us-ascii?Q?lGMDAn+IEtUJ8Jgu+poI+fm2dUqAzCyNgkWRyRHx?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab4fef69-45a3-498f-ea21-08db3cc2cd52
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Apr 2023 08:32:36.8661
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: gKVANzHgwS6vM+mAVlhrLf0VkbTDPRSHS0egjCWt4Yi/FY0/pOwzM+YlkDy7LbWn4sSSuu7UFeG4ic4CsP7qjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7097
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi,

Please help review this V5 patch set, thanks a lot!

BR,
Wentong

> -----Original Message-----
> From: Wu, Wentong <wentong.wu@intel.com>
> Sent: Monday, April 10, 2023 11:14 AM
> To: sakari.ailus@linux.intel.com; hdegoede@redhat.com; djrscally@gmail.co=
m;
>=20
> Intel Visual Sensing Controller (IVSC), codenamed "Clover Falls", is a co=
mpanion
> chip designed to provide secure and low power vision capability to IA pla=
tforms.
> IVSC is available in existing commercial platforms from multiple OEMs.
>=20
> The primary use case of IVSC is to bring in context awareness. IVSC inter=
faces
> directly with the platform main camera sensor via a CSI-2 link and proces=
ses the
> image data with the embedded AI engine. The detected events are sent over=
 I2C
> to ISH (Intel Sensor Hub) for additional data fusion from multiple sensor=
s. The
> fusion results are used to implement advanced use cases like:
>  - Face detection to unlock screen
>  - Detect user presence to manage backlight setting or waking up system
>=20
> Since the Image Processing Unit(IPU) used on the host processor needs to
> configure the CSI-2 link in normal camera usages, the CSI-2 link and came=
ra
> sensor can only be used in mutually-exclusive ways by host IPU and IVSC. =
By
> default the IVSC owns the CSI-2 link and camera sensor. The IPU driver ca=
n take
> ownership of the CSI-2 link and camera sensor using the interfaces export=
ed via
> v4l2 sub-device.
>=20
> Switching ownership requires an interface with two different hardware mod=
ules
> inside IVSC. The software interface to these modules is via Intel MEI (Th=
e Intel
> Management Engine) commands. These two hardware modules have two
> different MEI UUIDs to enumerate. These hardware modules are:
>  - ACE (Algorithm Context Engine): This module is for algorithm computing=
 when
> IVSC owns camera sensor. Also ACE module controls camera sensor's ownersh=
ip.
> This hardware module is used to set ownership of camera sensor.
>  - CSI (Camera Serial Interface): This module is used to route camera sen=
sor data
> either to IVSC or to host for IPU driver and application.
>=20
> IVSC also provides a privacy mode. When privacy mode is turned on, camera
> sensor can't be used. This means that both ACE and host IPU can't get ima=
ge
> data. And when this mode is turned on, users are informed via v4l2 contro=
l API.
>=20
> In summary, to acquire ownership of camera by IPU driver, first ACE modul=
e
> needs to be informed of ownership and then to setup MIPI CSI-2 link for t=
he
> camera sensor and IPU.
>=20
> Implementation:
> There are two different drivers to handle ACE and CSI hardware modules in=
side
> IVSC.
>  - ivsc_csi: MEI client driver to send commands and receive notifications=
 from
> CSI module.
>  - ivsc_ace: MEI client driver to send commands and get status from ACE m=
odule.
> Interface is exposed via v4l2 sub-devcie APIs to acquire and release came=
ra
> sensor and CSI-2 link.
>=20
> Below diagram shows connections of IVSC/ISH/IPU/Camera sensor.
> -------------------------------------------------------------------------=
----
> | Host Processor                                                         =
   |
> |                                                                        =
   |
> |       -----------------       -----------------       ---------------  =
   |
> |       |               |       |               |       |             | I=
2C |
> |       |      IPU      |       |      ISH      |       |camera driver|--=
|  |
> |       |               |       |               |       |             |  =
|  |
> |       -----------------       -----------------       ---------------  =
|  |
> |               |                       |                      |         =
|  |
> |               |                       |               ---------------  =
|  |
> |               |                       |               |             |  =
|  |
> |               |                       |               | IVSC driver |  =
|  |
> |               |                       |               |             |  =
|  |
> |               |                       |               ---------------  =
|  |
> |               |                       |                      |         =
|  |
> ----------------|-----------------------|----------------------|---------=
|---
>                 | CSI                   | I2C                  |SPI      =
|
>                 |                       |                      |         =
|
> ----------------|-----------------------|----------------      |         =
|
> | IVSC          |                                       |      |         =
|
> |               |                                       |      |         =
|
> |       -----------------       -----------------       |      |         =
|
> |       |               |       |               |       |      |         =
|
> |       |      CSI      |       |      ACE      |       |------|         =
|
> |       |               |       |               |       |                =
|
> |       -----------------       -----------------       |                =
|
> |               |                       | I2C           |                =
|
> ----------------|-----------------------|----------------                =
|
>                 | CSI                   |                                =
|
>                 |                       |                                =
|
>             --------------------------------                             =
|
>             |                              | I2C                         =
|
>             |         camera sensor        |-----------------------------=
|
>             |                              |
>             --------------------------------
>=20
> ---
> v5:
>  - probe mei_csi only after software node has been setup
>=20
> v4:
>  - call v4l2_ctrl_handler_free() if setting up the handler failed
>  - set V4L2_CTRL_FLAG_READ_ONLY for privacy_ctrl
>  - add dev_warn if failed to switch CSI-2 link to IVSC
>  - use v4l2_fwnode_endpoint_alloc_parse to get num_data_lanes
>  - add document about how sensor connected to IVSC is powered
>  - move lock to mei_ace_send
>  - check return value for device_link_add
>=20
> Wentong Wu (3):
>   media: pci: intel: ivsc: Add CSI submodule
>   media: pci: intel: ivsc: Add ACE submodule
>   ACPI: delay enumeration of devices with a _DEP pointing to IVSC device
>=20
>  drivers/acpi/scan.c                    |   2 +
>  drivers/media/pci/Kconfig              |   1 +
>  drivers/media/pci/intel/Makefile       |   2 +
>  drivers/media/pci/intel/ivsc/Kconfig   |  12 +
>  drivers/media/pci/intel/ivsc/Makefile  |   9 +
>  drivers/media/pci/intel/ivsc/mei_ace.c | 560 ++++++++++++++++++++++++
> drivers/media/pci/intel/ivsc/mei_csi.c | 772
> +++++++++++++++++++++++++++++++++
>  7 files changed, 1358 insertions(+)
>  create mode 100644 drivers/media/pci/intel/ivsc/Kconfig
>  create mode 100644 drivers/media/pci/intel/ivsc/Makefile
>  create mode 100644 drivers/media/pci/intel/ivsc/mei_ace.c
>  create mode 100644 drivers/media/pci/intel/ivsc/mei_csi.c
>=20
> --
> 2.7.4

