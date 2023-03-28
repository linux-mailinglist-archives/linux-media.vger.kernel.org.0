Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7B056CB81D
	for <lists+linux-media@lfdr.de>; Tue, 28 Mar 2023 09:33:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbjC1HdJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 03:33:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230288AbjC1HdE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 03:33:04 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58F2F40D7
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 00:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679988761; x=1711524761;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ePLR83qJhh3fK9KNqW0Z2lH4DvtQ54OJBZYx+Cd8Mkk=;
  b=O0eYrcUULPZbHkpWrpAKn6nET/rsvfrv6CIWNzFw4BhcgbWWphpGhNqT
   gKKc9CMr3Bk/I+M3OcGsV+k4V820b5au1a+af9Hx9ECYDiK1rkNbRuvtZ
   JwBvWXMw33jXET0XJJYIJgXgd60uMvMcnV6l3H7MKY64I01A959FFhuG6
   SS5FCB2BBJnejTPycd3rqqN7202K+tL1ft77P2nF9Yh2a62VcmBRnAK/a
   7QkJ+tIKwneHz6K9FAAT47CWwn6/BiAlD0XF1IqWP6cdyUyq+XsFSHKpP
   JKJi8NRFTy87XMP59F3GQ3gXDUaoRrN3x7DAWzc7F6GkSGvodMrmLhbRQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="320894172"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="320894172"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 00:32:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10662"; a="1013443457"
X-IronPort-AV: E=Sophos;i="5.98,296,1673942400"; 
   d="scan'208";a="1013443457"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga005.fm.intel.com with ESMTP; 28 Mar 2023 00:32:31 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 00:32:30 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 00:32:30 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 00:32:29 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.173)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 00:32:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F3C2YfmJp1mL3cbIwmZ8QF7YvASlKKuyXDwlxU0KwLstRoAm/8gddnM7rSOy7z/7fkRvJ7Or9xbl3l5JzmaKB+Hn4WdZxQZSdrGUsFYaPe7J3T0THMRm6xf8/csuirGmjYNjpzJbaveljDrFT3PZz8KIJAI25lMxDJLBbXLnWhxLlUJwzqhENHFtkuKl9bSndrXT2yFAs1x+1cSoxVaziftY8H+qp6lUnfF+rGDvtQTQFJCQSzsLoQgZRlXppJG10ZzWCP6INtY4Peoks+OEpgcxdKBBaqQ1iyOksZudgciTdMGO6OfEoWDfxLqlua2KBHC8xQK7r/afCdgQ0/4tig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IAo8EmlKL6dKUVOAJoOUJiTvQIFsDlUNxHVAjw5Sbdc=;
 b=mnvuy61HUgf/Bqcq2dBXszAe0glktRFiiS7fsUQjTpfa13PV7rklKN4CfUSXOiKIbRZ/73XQ7TW3ogtAsbVsJdzy3HZq9ugoviUqRntGs0vMKYvqpWNLJ0gOSZ+iSrFwkme93R/yKcmtpSnPgfH9Lqock4hH6Mv7ceGK0N+S7vX+0j+ZlFKMKRChzu6+MucgF+wxVTPoXwkfpmw61iM9FVI4HGBz3ysUD99465gx7f6OhDxN+LJjOyFlOzXeNuTWbBJYW+rrImsSA5eZedrHUH4109GaXPZ161zIHaKMI4s8M+h8FCEEb+UwXz4Nn+ZM0mcbFNvemVJO/cjGNDo8Vw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM6PR11MB4316.namprd11.prod.outlook.com (2603:10b6:5:205::16)
 by DM8PR11MB5576.namprd11.prod.outlook.com (2603:10b6:8:37::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Tue, 28 Mar
 2023 07:32:27 +0000
Received: from DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::933f:f96c:bec5:5ef3]) by DM6PR11MB4316.namprd11.prod.outlook.com
 ([fe80::933f:f96c:bec5:5ef3%7]) with mapi id 15.20.6222.030; Tue, 28 Mar 2023
 07:32:27 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
CC:     "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
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
Thread-Index: AQHZYHShR1ChohFeu0+//9oZbrf/X68OOHSAgAABHtCAAAboAIAAAM4AgAAdFQCAAWwbkA==
Date:   Tue, 28 Mar 2023 07:32:27 +0000
Message-ID: <DM6PR11MB4316138CF6D8D300C007B4DE8D889@DM6PR11MB4316.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
 <MN2PR11MB43184340CB813FFCE47AA68B8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFKmNKZAPwsIq/j@kekkonen.localdomain>
 <MN2PR11MB431892069628328E614F03498D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFjqu4P9AcNbMoZ@kekkonen.localdomain>
In-Reply-To: <ZCFjqu4P9AcNbMoZ@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB4316:EE_|DM8PR11MB5576:EE_
x-ms-office365-filtering-correlation-id: dee299e8-61d8-4759-fe07-08db2f5e94e2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Sa+JIJ594H74LAKM/gUXmI03P79ld5SYTRQpfY8FRakcQiDQj945vvMZ012AiqBytUYNBlcLUEZeLdbq1vxz34S71r55LZSWK+gjmNXEFt23hn8TUPrvcKbWO3i4GX38Y/tuPIt314TOGtlcG10CofUmvtQHIMAXjy9Ex0InEvdJVGqEnZT33Lm1bbq6et1OaJ+nLpqEr05yvyulfXaUFVU/gN64Xkntf0cCq0ve1q2zOBbRr4IC0x6tBirbHXL3lBOApY0VtAqXqMqEscrFwaBXskTZiPLgprFM3Dz0I6lU5MHvvXQNgW2y1YJBy/btgrhTdzkovxmPb+tFVozNIiimA1N2txNCXKp0lumu/2iOD828L/fvPrEGTZKMCoEVHV8O5il0VhRnloYlU4fryHDriECfQGVYcHNAbH/uZZxtQq2nhd/F1NLayFCCJsBFKebQA7yKnp6FYQBzx+Q/ekJ3obxlSYdOWNpp0bZPhAb2UHJZDDOXhhLMBXBRIqUCo37U+RRoJiwC0QcJh0lCLAqXGFZxAcfxo9Njy/6XDqg4tNaaPkNS7GjbQugfDcv+aPPLwu25BX/uH1htdS1x20CGvQs7ynxil63TEfYOxkNthb1VqNd2Kyd6urge+O/k
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB4316.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(39860400002)(346002)(366004)(376002)(136003)(451199021)(54906003)(7696005)(478600001)(8936002)(52536014)(9686003)(26005)(6506007)(316002)(71200400001)(66899021)(64756008)(66446008)(66946007)(6916009)(8676002)(66476007)(186003)(76116006)(66556008)(4326008)(41300700001)(82960400001)(122000001)(33656002)(55016003)(5660300002)(2906002)(38070700005)(38100700002)(86362001)(83380400001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r5cgcz9/efc3PEPGc5IbCAV5etWoinJ7T/M4+FXEpnG4nnx/mdtM0O9V1fPY?=
 =?us-ascii?Q?SjPeye4OGfV+xsAlt0qGBBGuuI8q5z4fDnWdPkP03oj5XlPMG3iG7o5S+23G?=
 =?us-ascii?Q?dLWXFZ5SCZmjy24VcfSJcTVDy2plcFm0OOZKsLzZeooRjI8Zk9byzUlSDbYd?=
 =?us-ascii?Q?atlp+cUBrwzdShXfKjpQefOOQWH8+J8HuSVTknwh88SIXHTWjo3MDZtO8xRv?=
 =?us-ascii?Q?pawQjwaCgY/we+H7+gMADNHMEDVadutayYnixhkF4/WB37AzjR37aMWVyGpI?=
 =?us-ascii?Q?f0j54VZSUVlNh4Xk3ZIZbqS/2ao+PsoXDYzhLNgMTFz1d4XIJ7x3hS9GKSnT?=
 =?us-ascii?Q?mgyEdomZqkeW/AVX2KTC4psvajqb7jflW5AQHB/2e1lmxBLHAL8rP2W/esSJ?=
 =?us-ascii?Q?aJI6Idlf9Tgi9DHiKlps8qSa3kijefT5OK2SwCon2swdho+FBf2LRlhNLDeC?=
 =?us-ascii?Q?SReGdk3cBLECkN1jbZns1E4YMYDfeXOTTTZqakZraAqd5qIwcey8+uz5jcZ6?=
 =?us-ascii?Q?szislVml6d85rO7Z4KgAeKyuIQmSVqfv+r00mRjhHeok5VQ+F3E1V3BXA1VW?=
 =?us-ascii?Q?CiOYVZSnUAWCFMBCAgIFNCXadki3prlg63IlD64PZFqpbcdUgj3L26dRJI4d?=
 =?us-ascii?Q?/TjRvzkNO5l5OQUPOxZpnIUQGhuS2c0sSHJBfECuvaMTjI8PLsCffW/rLA6C?=
 =?us-ascii?Q?g95eY3E7JRQVir0a5232819rjtQRvIACCsNu0kZGZcEx0hcApFSodDU2uFcK?=
 =?us-ascii?Q?UejZles/EqWLNVV75g44wpa9sdI9Cpp6O0lPgK8R0rUSsE4EO11kApCHm9Bi?=
 =?us-ascii?Q?EccvJXVUDbAVWIIpqClJmrsq7xG+At2Up0jkD5j9bXLKaAcgzwV4VNSiPpeV?=
 =?us-ascii?Q?dMcfa1OS6znzzF27GXRAw4PVOPWMT7B3OhzvSjufkdrht0DuvWE9VSfSv14k?=
 =?us-ascii?Q?Flqs3DpTRx6bdRE17Q7eSAdrTMf9QNgjn05BRg2nxr4FQ2xzL37i92MiKzF1?=
 =?us-ascii?Q?3D34fdT6VWQo4nsvUD7cQnBPbBHl6vBkAd8/P155H/kfMgZEhXGiIgSt7LK5?=
 =?us-ascii?Q?ItlvtD2WugLwNWalzRyVMqfgkoVbMzHfTCIgeRm2rLNJXbuj7N41fLbpCeza?=
 =?us-ascii?Q?TSE4CC3gSUySrcfrY9tbUGqtjYyYxv3SsDojBdQIlGNVPE4MYiX02XZFxmJx?=
 =?us-ascii?Q?N6LqvoAUlwtWWUpA69FEDhX3zk+1bJbwl/RiOqzfyBrrjV86XLH5Lxheg8Fm?=
 =?us-ascii?Q?ZdpSsgIVIVEfE7H70yxvEFLJO2IfAvi/Lj5Kxat91a177pW/MxNptbaCMgYx?=
 =?us-ascii?Q?5bpA7Gs/XiXye2WwllPx8TAewqGqLpiHExVDk59J+7/FLln0sdgzZVgJ6Udr?=
 =?us-ascii?Q?1tvlqfQZy6asbS5HH0uLEl825JFG3pwRMsgKHPv4I91P2OCQDqaL6gp1diMX?=
 =?us-ascii?Q?YE9EEl/gnhTXAA5rKYG7uIsE5PkuWLJl/aknIYwIef2MN/6p8hDk6CfPgKrT?=
 =?us-ascii?Q?0Wf33s+g9ByM83u2Bu25OL6L/PquMxk/DYs4tmk0Yrlkxby3YOrVdcLAknuk?=
 =?us-ascii?Q?hBLbfG9+8Qxom/6wkLW7m6Ms9Qn0DCwv6QtXAo45?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB4316.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dee299e8-61d8-4759-fe07-08db2f5e94e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Mar 2023 07:32:27.4198
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: pq+kEi6fTJrxIppWLRrffTo6OEeJBsnB92hpj6kZOcnpcrxSP110KYSuzCqCX1cMws7AbC2a5cCiv3JM1ln1og==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5576
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
> Sent: Monday, March 27, 2023 5:37 PM
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 08:13:29AM +0000, Wu, Wentong wrote:
> >
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Monday, March 27, 2023 3:50 PM
> > >
> > > Hi Wentong,
> > >
> > > On Mon, Mar 27, 2023 at 07:33:48AM +0000, Wu, Wentong wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Sent: Monday, March 27, 2023 3:21 PM
> > > > >
> > > > > Hi Wentong,
> > > > >
> > > > > On Mon, Mar 27, 2023 at 02:23:05PM +0800, Wentong Wu wrote:
> > > > > > Intel Visual Sensing Controller (IVSC), codenamed "Clover
> > > > > > Falls", is a companion chip designed to provide secure and low
> > > > > > power vision capability to IA platforms. IVSC is available in
> > > > > > existing commercial platforms from multiple OEMs.
> > > > > >
> > > > > > The primary use case of IVSC is to bring in context awareness.
> > > > > > IVSC interfaces directly with the platform main camera sensor
> > > > > > via a CSI-2 link and processes the image data with the
> > > > > > embedded AI engine. The detected events are sent over I2C to
> > > > > > ISH (Intel Sensor
> > > > > > Hub) for additional data fusion from multiple sensors. The
> > > > > > fusion results are used to implement advanced use cases like:
> > > > > >  - Face detection to unlock screen
> > > > > >  - Detect user presence to manage backlight setting or waking
> > > > > > up system
> > > > > >
> > > > > > Since the Image Processing Unit(IPU) used on the host
> > > > > > processor needs to configure the CSI-2 link in normal camera
> > > > > > usages, the
> > > > > > CSI-2 link and camera sensor can only be used in
> > > > > > mutually-exclusive ways by host IPU and IVSC. By default the
> > > > > > IVSC owns the CSI-2 link and camera sensor. The IPU driver can
> > > > > > take ownership of the CSI-2 link and camera sensor using
> > > > > > interfaces exported
> > > via v4l2 sub-device.
> > > > > >
> > > > > > Switching ownership requires an interface with two different
> > > > > > hardware modules inside IVSC. The software interface to these
> > > > > > modules is via Intel MEI (The Intel Management Engine) commands=
.
> > > > > > These two hardware modules have two different MEI UUIDs to
> > > > > > enumerate. These hardware
> > > > > modules are:
> > > > > >  - ACE (Algorithm Context Engine): This module is for
> > > > > > algorithm computing when IVSC owns camera sensor. Also ACE
> > > > > > module controls camera sensor's ownership. This hardware
> > > > > > module is used to set ownership of
> > > > > camera sensor.
> > > > > >  - CSI (Camera Serial Interface): This module is used to route
> > > > > > camera sensor data either to IVSC or to host for IPU driver and
> application.
> > > > > >
> > > > > > IVSC also provides a privacy mode. When privacy mode is turned
> > > > > > on, camera sensor can't be used. This means that both ACE and
> > > > > > host IPU can't get image data. And when this mode is turned
> > > > > > on, users are informed via
> > > > > > v4l2 control API.
> > > > > >
> > > > > > In summary, to acquire ownership of camera by IPU driver,
> > > > > > first ACE module needs to be informed of ownership and then to
> > > > > > setup MIPI CSI-2 link for the camera sensor and IPU.
> > > > > >
> > > > > > Implementation:
> > > > > > There are two different drivers to handle ACE and CSI hardware
> > > > > > modules inside IVSC.
> > > > > >  - ivsc_csi: MEI client driver to send commands and receive
> > > > > > notifications from CSI module.
> > > > > >  - ivsc_ace: MEI client driver to send commands and get status
> > > > > > from ACE module.
> > > > > > Interface is exposed via v4l2 sub-devcie APIs to acquire and
> > > > > > release camera sensor and CSI-2 link.
> > > > >
> > > > > Thanks for the update.
> > > > >
> > > > > Could you elaborate the decision of keeping the csi_bridge
> > > > > entirely separate from the cio2_bridge (to be turned to ipu_bridg=
e first)?
> > > > > Both are doing essentially the same and using the same data
> > > > > structures,
> > > aren't they?
> > > >
> > > > yes, they're doing same thing to bridge the software nodes needed
> > > > by v4l2, but they have different type devices(pci and mei_client
> > > > device) and dependency. And they have same SSDB definition in
> > > > DSDT, so the structures are almost same.
> > >
> > > If there are differences, what are they?
> > >
> > The properties of swnode are same, because we need same info to
> > configure CSI2. But csi bridge can get sensor connected to IVSC by
> > dependency info instead of just polling the only supported sensors for
> > ipu. Also IVSC
>=20
> It's totally fine the method for finding the sensor is different, this sh=
ould be an
> extra argument for the bridge init function and a small number of lines o=
f
> additional code.
>=20
> > doesn't need vcm. And the topology of dependency is different.
>=20
> The VCM is optional for current cio2_bridge, too.
>=20
> It also seems that this currently creates swnodes on mei csi side only fo=
r the
> connection towards the sensor, not the IPU.

IPU could find the MEI CSI software node by software_node_find_by_name,
and then setup the bridge between MEI CSI and IPU.

> At the moment you can't reliably
> add software nodes to a device that has may be already probing so both of
> these should be created at the same time.

If you're worried about sequence, IPU driver could make software node and
register it, MEI CSI bridge could find IPU software node by software_node_f=
ind_by_name,
if the return value is NULL, driver will defer the probe.

>=20
> >
> > > What comes to cio2_bridge, the fact that it's related to a PCI
> > > device doesn't seem to matter after initialisation so it could as wel=
l work
> with struct device.
> > >
> > > >
> > > > I have no idea what the ipu bridge would be like, but IVSC csi
> > > > bridge can be configured via kconfig to enable/disable.
> > >
> > > Please work out the details with Bingbu.
> >
> > @bingbu.cao@linux.intel.com @Sakari Ailus Please share your design idea
> here.
> > What the ipu bridge would be like?  What's the responsibility of ipu br=
idge?
>=20
> I'd expect Bingbu to have patches to turn the current cio2_bridge to an
> ipu_bridge at some point. These should come on top of those patches.

When will this be ready if you already make the plan? But could you please =
help
review my other patches except bridge?

Thanks
Wentong
>=20
> --
> Kind regards,
>=20
> Sakari Ailus
