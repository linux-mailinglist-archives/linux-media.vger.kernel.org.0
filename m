Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E5A6C9D54
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 10:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbjC0INq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 04:13:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232982AbjC0INm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 04:13:42 -0400
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C121149DC
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 01:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679904813; x=1711440813;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ozDuBbZgY1XNvK6RpIjxDx6HEF6U3MFuH3+rGyyc03g=;
  b=E7qAkMIKbaBnTB7GcFim6uPCDUAzhZnXxvnuxb+vpSj0ahKuys36KbAS
   M1i3xzVdhOFpmG4inJnQMk4dxvBeb0Z8I6b+mLXjFaokwKrBG5aOfZYus
   Pz3kddba90yEB9yDijNtjJ/crTXFSh85H7HdEAnCUVQFgq5Cq7DPQSSUZ
   qa6turajZL2urKNHp3GtGcZfxFHI7lHuRyftnCwmA1dnF72taCDY772nv
   NV9qidT21UeAIlvN9aYgQoSs7kpattooUQqvdOohZMwxkSccQ9vekNsdB
   wJS4NN7Gk66Mt8Lc2C9MjtnNQdao49avzAlQQEs/mvPUfiYA4wkUPVwBg
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="426469401"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="426469401"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 01:13:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="826946370"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="826946370"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 27 Mar 2023 01:13:32 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 01:13:32 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 01:13:32 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.108)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 01:13:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bU9Lwle1lgYd2IFTP81ZC6VC8IUZYDrFEr5s3FB0q1kBsYU0cV09ATd2WHb2aHw3cDODgVZs/2lO5z3VoJb419BdwHqnFNHQ/JcawZ0Bz54AZDv4/jkn/Q7B2M5p6A644lpEAn8VvyEt3i6pfmfrsdiwixv6hm2OBun06xCmtQqliUb0yd0md8u0/ma5FvZfrK4V0V0/g987R+lEny10dNi1G/2AcBy4ZsN18eo5YMHkhLmm6VaTr1tRyc1qUKgbHUkZP1gFiuVxzlbTs5/HiJdELkRUY4Mvn5smJAOAz+U8DhHLVHZtsk8qzGjD7DC1zIGx3EPouZazvE+E4cuLAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6U8NJ1DHmbHEor/Tk3xDcNblFquZNWBUsa6QqizTFFc=;
 b=QrCLp7/T6U76R1EHZ+YTTX6AZSc9xCVlAnDwG83BbWMPaanJLHh2PCIDXnAg0g6Zf8+5qZHd48IH5rLeXgX6vMnmlaKDpwAsJq/Vn9cnp6yr82Sykv9kSS68FNl99Mmll3TGoyQcslEzHYm2UuC24vboT3zUxHF+gz+GC4CdWPD4kOWW5xNsnYiGZvmnsuZN7bQ6mleGJjY+bQ/r9IjlZB4p945IZGly1BhF9KDa1jfe4sRVF+P0p0mX1iNwF44uw6zFJ/wiueLMENcrU0UScrd/rajy1HZ/iN3dXG6HVH/74w0qTCFYQ6bNgnJX5uhFv6jQQN7PGtaIIdgFhV9pyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.28; Mon, 27 Mar
 2023 08:13:30 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee%7]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 08:13:30 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
CC:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Topic: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Index: AQHZYHShR1ChohFeu0+//9oZbrf/X68OOHSAgAABHtCAAAboAIAAAM4A
Date:   Mon, 27 Mar 2023 08:13:29 +0000
Message-ID: <MN2PR11MB431892069628328E614F03498D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
 <MN2PR11MB43184340CB813FFCE47AA68B8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFKmNKZAPwsIq/j@kekkonen.localdomain>
In-Reply-To: <ZCFKmNKZAPwsIq/j@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: sakari.ailus@linux.intel.com,bingbu.cao@linux.intel.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|PH0PR11MB4823:EE_
x-ms-office365-filtering-correlation-id: 58dd527a-43cb-4c10-2748-08db2e9b2641
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: VBqON3t0gZ6gTE8Gl/4PpJMVe7HLD+/hpMXoIYnxyYq9jVgX926qVGNC6Cf15BwFXEeegtwQAoCYt16iC2/atq+G+WvTmfDVX1V8+hwd/fkItdaZmRS47sm6q5URA3YakioOVfzHFHnsjVyCjAewmiY24FXqvYwozC/aI+oNxwLM21WKY3wquSLFyG3m/pqFCme31dzj4BjO6WIuK75xmC09l04gQ7rnsIoMXMgKoD0Sz/+SSlxgXJwBmPuWR/sFqgB14/WMREDu4dwGQzuYIOuoyRndsl1YWkFgkwEMYh3QGtGheiEYdyQsZCu4+AOP17HuadtyWkYy8FG5TznXiAF/WFYAJVsfWLojV05iJ0K2sjhlLpt/+aZwkYQnhDRMEgIsuX05RYTzhq7qK0W2tMnB/ZrbHJnVHEI/TTCDrRwJADvpIsjVgp/X3poewhVWXsvKLb/LSYq41DfiPp0Ww5Es+OhEJKjtOdR6iXi1zFz602zkyZNGBOKatPLa5SKakLo34fdrFnBu5OYCFxCKsTVPTs58hL4eVZTkmi5TsBQ9n5BZDDSBY//6KH5phkbPnY7aQJ0yx846R1aV59O+v5o7bYUfBAm1lGg56lPsIL3wmH+qX4wdx+3g4EWeKRoy
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(376002)(366004)(346002)(39860400002)(451199021)(83380400001)(76116006)(66556008)(4326008)(66476007)(66446008)(64756008)(8676002)(66946007)(54906003)(7696005)(71200400001)(478600001)(9686003)(26005)(186003)(6506007)(110136005)(316002)(55016003)(38070700005)(2906002)(33656002)(86362001)(52536014)(41300700001)(38100700002)(5660300002)(8936002)(122000001)(82960400001)(66899021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?/xVTz9+o2T+n44qJflGhKTsAuW7O+KPNZYPatURN8XAlBQCdv6eyvWkaDLlm?=
 =?us-ascii?Q?7vKjbO0t12IoqnluQqbgcMouEabM8S+XP8yDE0uW/2LYmE8XGc63DmTRfgiO?=
 =?us-ascii?Q?jR8ISlCdG5PFXHHA1RAs5Yf7PmMhUXu5799KplMNh94/hdEPyccUCAK1jknu?=
 =?us-ascii?Q?0/QLfFZBfZrCesRvfmoOSp9CFXh2IHqSU7Sa3Fyq4Ruf0BTh/Sm5ICAwol8M?=
 =?us-ascii?Q?I5Ov3wJe1LzsAkpn7RgtZb7GIlhVwZDcSpJiMhrNNShKbJv0aSmNTGmHwrhV?=
 =?us-ascii?Q?mkOxBdKn8OVxQjqJ/YNqxIoMb3oB9yZF0l56Vol1UGdgbVGQSQberZ2vEyyO?=
 =?us-ascii?Q?dCkJ6eSFVM8bx/LwWpW3TEwo8uv4zisr3jdk+xSp2BebbjLM/15M+0MpjXth?=
 =?us-ascii?Q?Uuq9sQZpCa63lFo8AQklmW7h7BNaemmRBzE9kygPXw2TZ83CflSJv9WO2br5?=
 =?us-ascii?Q?ADCw/2XewkcOOcutwVWNsNFcUmiEQ74qD2SyJsJknmKEMOpxvCIg2FvZvXRb?=
 =?us-ascii?Q?sgTLj4v+E0qt8zEQXC2J2dKx+OEfVelg1s00pEPAZTwNL5S3xNsfjKlqZkuO?=
 =?us-ascii?Q?4M+5t+ZjIivZmLZb+g/pmHICzi6KrksBH53ds8V0/HKflUhZAVVGoklh6MNz?=
 =?us-ascii?Q?CGUSs6jtI4xgBprOjs+rKAZxNCitKDOBWbaFuTFQiQiPTyo3sALj69HbEUiz?=
 =?us-ascii?Q?wrFLS+jREiPJ+37yWOtbQPPErOpCI/S6OE2aEhx5R7Fd5h7XptTMWjH92wpY?=
 =?us-ascii?Q?Hyd/Kf323qLqfckrf3YIq3AMbaPXiRiIBtzLYhqtPG+te9TmePyprHo8v/Fi?=
 =?us-ascii?Q?GzAwgP0Q4x/pvD19NLTNoPdIJIJDXm0VwJ0fynRAMKyD9hWmOp3IAS0qk/7G?=
 =?us-ascii?Q?ddqoxq5bwhYwKzcrbzb4R7P+5obJ8FTss0IP6KLmMHJmqJuDACdcSA0xLI2b?=
 =?us-ascii?Q?Z3g5q+rD+vipTiKyCNMGruf6wmrb8d/zmgKaH6UcHpuUS/h+P6aRFHWcpJ+p?=
 =?us-ascii?Q?O8CkHAemE+niGUubI7n2L9Jd/GV/GdW3S7RdXT1NVCBDyZIIaDRdObS08ahG?=
 =?us-ascii?Q?VGsuv1V/9zn3nyrWe1+2EkUJwrHzisvD/ZBLz4ZMQbFqo2hOZ1rpOVP74uga?=
 =?us-ascii?Q?zKJL7KMcOJYDrYqCrcuZ4u0sh8fvRsBr6IS7pDDgyhACbpVntDDKeV1oYhCv?=
 =?us-ascii?Q?2JUQqmcnrx2SU+kYXoal4pgkBX771fbm8DzwHQzFnv6fXpgSXtZyLB/jCpfI?=
 =?us-ascii?Q?7QkbXCYVjNuu6EJ9RkzFlfynmJo9kctJdRG65c0JxVxUVar4x/jlRRoM00bE?=
 =?us-ascii?Q?kj03rbAv0Kb732DXIbeGuU8kzRgdmiROBeqy93ODbL4hTrgoEieU3BITmFjB?=
 =?us-ascii?Q?fK2jaFAAOkrhfI0lnsElrY9tgj2qNqp5rtM0RMqaeOAXYmuTxORDqrATVs97?=
 =?us-ascii?Q?jlgL1bWNO5c9IhgXdo4vvbv/PZic8mVdrxisnmJuP6b35jhL1mx3LNWCbcYf?=
 =?us-ascii?Q?gBV4EwwNc5PrIcOWhWERXELkBZy0L3/LU10uvMUI0OafgFOWcHdtsX3A1ZzH?=
 =?us-ascii?Q?MEQc6Row+PH9bNfb6+A7222GyXF8gyFCxojJAhsl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58dd527a-43cb-4c10-2748-08db2e9b2641
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 08:13:29.9513
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nhGihUBif7JUhgVA0AsNN5UiJ0vwLNBBptNM1iAIgQkARfBs4njMok41g+D8BR20L9qNhSjOqOEs9UsZHMnIdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
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
> Sent: Monday, March 27, 2023 3:50 PM
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 07:33:48AM +0000, Wu, Wentong wrote:
> >
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Monday, March 27, 2023 3:21 PM
> > >
> > > Hi Wentong,
> > >
> > > On Mon, Mar 27, 2023 at 02:23:05PM +0800, Wentong Wu wrote:
> > > > Intel Visual Sensing Controller (IVSC), codenamed "Clover Falls",
> > > > is a companion chip designed to provide secure and low power
> > > > vision capability to IA platforms. IVSC is available in existing
> > > > commercial platforms from multiple OEMs.
> > > >
> > > > The primary use case of IVSC is to bring in context awareness.
> > > > IVSC interfaces directly with the platform main camera sensor via
> > > > a CSI-2 link and processes the image data with the embedded AI
> > > > engine. The detected events are sent over I2C to ISH (Intel Sensor
> > > > Hub) for additional data fusion from multiple sensors. The fusion
> > > > results are used to implement advanced use cases like:
> > > >  - Face detection to unlock screen
> > > >  - Detect user presence to manage backlight setting or waking up
> > > > system
> > > >
> > > > Since the Image Processing Unit(IPU) used on the host processor
> > > > needs to configure the CSI-2 link in normal camera usages, the
> > > > CSI-2 link and camera sensor can only be used in
> > > > mutually-exclusive ways by host IPU and IVSC. By default the IVSC
> > > > owns the CSI-2 link and camera sensor. The IPU driver can take
> > > > ownership of the CSI-2 link and camera sensor using interfaces expo=
rted
> via v4l2 sub-device.
> > > >
> > > > Switching ownership requires an interface with two different
> > > > hardware modules inside IVSC. The software interface to these
> > > > modules is via Intel MEI (The Intel Management Engine) commands.
> > > > These two hardware modules have two different MEI UUIDs to
> > > > enumerate. These hardware
> > > modules are:
> > > >  - ACE (Algorithm Context Engine): This module is for algorithm
> > > > computing when IVSC owns camera sensor. Also ACE module controls
> > > > camera sensor's ownership. This hardware module is used to set
> > > > ownership of
> > > camera sensor.
> > > >  - CSI (Camera Serial Interface): This module is used to route
> > > > camera sensor data either to IVSC or to host for IPU driver and app=
lication.
> > > >
> > > > IVSC also provides a privacy mode. When privacy mode is turned on,
> > > > camera sensor can't be used. This means that both ACE and host IPU
> > > > can't get image data. And when this mode is turned on, users are
> > > > informed via
> > > > v4l2 control API.
> > > >
> > > > In summary, to acquire ownership of camera by IPU driver, first
> > > > ACE module needs to be informed of ownership and then to setup
> > > > MIPI CSI-2 link for the camera sensor and IPU.
> > > >
> > > > Implementation:
> > > > There are two different drivers to handle ACE and CSI hardware
> > > > modules inside IVSC.
> > > >  - ivsc_csi: MEI client driver to send commands and receive
> > > > notifications from CSI module.
> > > >  - ivsc_ace: MEI client driver to send commands and get status
> > > > from ACE module.
> > > > Interface is exposed via v4l2 sub-devcie APIs to acquire and
> > > > release camera sensor and CSI-2 link.
> > >
> > > Thanks for the update.
> > >
> > > Could you elaborate the decision of keeping the csi_bridge entirely
> > > separate from the cio2_bridge (to be turned to ipu_bridge first)?
> > > Both are doing essentially the same and using the same data structure=
s,
> aren't they?
> >
> > yes, they're doing same thing to bridge the software nodes needed by
> > v4l2, but they have different type devices(pci and mei_client device)
> > and dependency. And they have same SSDB definition in DSDT, so the
> > structures are almost same.
>=20
> If there are differences, what are they?
>=20
The properties of swnode are same, because we need same info to configure
CSI2. But csi bridge can get sensor connected to IVSC by dependency info in=
stead
of just polling the only supported sensors for ipu. Also IVSC doesn't need =
vcm.
And the topology of dependency is different.=20

> What comes to cio2_bridge, the fact that it's related to a PCI device doe=
sn't
> seem to matter after initialisation so it could as well work with struct =
device.
>=20
> >
> > I have no idea what the ipu bridge would be like, but IVSC csi bridge
> > can be configured via kconfig to enable/disable.
>=20
> Please work out the details with Bingbu.

@bingbu.cao@linux.intel.com @Sakari Ailus Please share your design idea her=
e.
What the ipu bridge would be like?  What's the responsibility of ipu bridge=
?

>=20
> And please do wrap your lines at 74 or so.
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
