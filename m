Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C42316C9C15
	for <lists+linux-media@lfdr.de>; Mon, 27 Mar 2023 09:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232548AbjC0Hd4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 27 Mar 2023 03:33:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232544AbjC0Hdy (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 27 Mar 2023 03:33:54 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E45604EF6
        for <linux-media@vger.kernel.org>; Mon, 27 Mar 2023 00:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679902432; x=1711438432;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=kuyhUOviLNaGJXx29tnoQexz0TMw5fy81nArH81egEQ=;
  b=m/R0rTFtuKaJ0/KCB4IY+JK6/Q4Sm0kilu6qmrSeL0WA88jcahdBoCHO
   uvSseGRwwpM7hvRf5HIrLvJ6jgUXH+etFV7mQybQc+xEym/VuAVlefBFY
   I9gEEyogM7TI9Ii+rmpzU87ovY8WCwcO0fA/t3qA40zQkJEMZm89bhMUN
   CRZiGX+VWr0WfsgDPxToddYNEmi76Df+shugiCMYaH25sWixidkTe9bdO
   Iymvlv38m5ePsJSEQz5luqXDdlLXMME7UW43iikrqFMtfXRZn9/FTGUaz
   riYOKFR9z6LmbgYqY5mHtvK19m/OPbPsjXRF8vkfil2nccax7DsNbfVjv
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="338919930"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="338919930"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2023 00:33:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10661"; a="857569774"
X-IronPort-AV: E=Sophos;i="5.98,294,1673942400"; 
   d="scan'208";a="857569774"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga005.jf.intel.com with ESMTP; 27 Mar 2023 00:33:51 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:33:51 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 27 Mar 2023 00:33:51 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 27 Mar 2023 00:33:51 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 27 Mar 2023 00:33:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bJLRdE9E0a+iK8Z3bhVDfquh34DpdRak0QS78i443reXsLajikyQO736adJvD1q0kTonxEDmeCmcIPROGs6J3KnDF777i9wlIJVk40h0DMgQ4xkl8SDZ6bX0U/BaJjPKRQtNDAzpYt0eetAfDpujjVlgM544hriaJBANOi1WlR4z/lSCfNJa2GCZS91KrpIaF+gPz9jlvwV9vzXRaoOGTYruUDM/Xz3Nwu4qOtSwOnHMWCY0cFKK0C50amKgkZAu4rqiTzXMaaDA0CahlZYU5WopWwezB5xRF/fIJQwsu8nSzHnm8+DjE/VpbnDsgUbvgxZF37A3A7qxUWVWV1AgwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nAii5NirVRDSohyDG2S7T/pdTkHqDdVK+x4TOz6RbY4=;
 b=IYzhM1bC86FQdC+q2qKPetz6UbExnnhGlC9dOTNZL5rzxgxQfqRv+YFNbZ/uddlWV2W+3Z91IktzdEuGC9z1T4IjHoinJrR7PxwYlvbfkTlmhRzX0bIwJxYGGT3sL1c8kKgM42K96jgsSdxs3RVErYUkpQ+BfFQmrwus15YsiFev+uir3Gn8I1A6luoDs3BwFhTnczLNarIn28Vdz3pmAahWUdKaCC9aPUpno/CIO2UBM4TYiqTlP5VvCYMFm1wvfSVfwi8ZRdnf7UBO++HjorI4xP/9UZYQ/nhzqRTC2leJ1aD/zwxzokoTP4yFYlujJcnHJ0Y/3ZuF/n89WtSgyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by DS0PR11MB7406.namprd11.prod.outlook.com (2603:10b6:8:136::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.41; Mon, 27 Mar
 2023 07:33:49 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee%7]) with mapi id 15.20.6178.041; Mon, 27 Mar 2023
 07:33:49 +0000
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
Subject: RE: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Topic: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Index: AQHZYHShR1ChohFeu0+//9oZbrf/X68OOHSAgAABHtA=
Date:   Mon, 27 Mar 2023 07:33:48 +0000
Message-ID: <MN2PR11MB43184340CB813FFCE47AA68B8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
In-Reply-To: <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|DS0PR11MB7406:EE_
x-ms-office365-filtering-correlation-id: c004cec8-eda1-4acd-01d0-08db2e959af4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: W1Z/KDkYAd0oITzOD1Xs0deD0W7ygv1skiYA9+d4Tu1r7k/7WdFmsswK70WMi5sHl7ys6z7pHUYgfFCaOe/QPhYfnJPGLLuo3c2i/8szVqrC9JF+UdmW4bAk2dqVoK2kG/Zj5ZTlO3A13gc3ApYV5dPiPc5gr+qxzgZbDug1lHw2JgPqU/SRnyeyws6vR4DDdD0tHXDb6jRXEqVqKaWSuXefbMC/tXjbs48vp+eu9BV5Kh7sl2kPSxJBvc70KoThyku4pgo2L1jFNzgujTkP3tZfBEyJR1TqkPrPoTDh+9evpE0y+AXdSYh4tm2xVTUSA7ZZ5kSed3NbXoYWMGdCgcO1Smfa26DVTlKLIsDFOn/ZAJWSqCgXxry2Ki2mrefSZ2AOiUUhR9ACJl25ujPB5Tuj9BtTlSUCoJFi95clvHXgWR45ZmpEh2isEb4d2QRpAbCKFM8TVicLukh9EdV36BKErtxVa3JeKqfMjA364UMRJWP6nXAbFax2CAvfeBEgalc7iMPCNzXSZ/7C0xyXFsss1Sk/PKPoP0Py2X++c7g7K9Sevl5WxhzIIu8oM4e17rx4WryokRydUg0deLKl5X03xvlf755JrKoFzp/2sDuTbuWU9TzjZFU9nc67QkT8
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199021)(41300700001)(76116006)(8676002)(4326008)(6916009)(66446008)(66476007)(66556008)(66946007)(64756008)(186003)(2906002)(83380400001)(5660300002)(38100700002)(38070700005)(86362001)(82960400001)(33656002)(122000001)(55016003)(52536014)(478600001)(54906003)(71200400001)(7696005)(8936002)(66899021)(9686003)(26005)(6506007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?6NjXgkHSL2sFmenacWk6g5iKzQKqKZsMyQa8iqD/05+DmC36cSsW+N936YtQ?=
 =?us-ascii?Q?iwoCNtDUVC+QxDB34UJ0ZSgsoUjVQwFNzbl5358MwRi/YWR1LCgNb+lTx5b/?=
 =?us-ascii?Q?mMzWWIe8zGlnMtxx0yWaX+oak2xb+3W/PjRhNiiztigyhEgNGw7vQ5lqU/Am?=
 =?us-ascii?Q?AhF7ySTr58TK9ZjqzW0MjWZ12tcbIr3reX9ODKLu1Q7/Aj86ff2+smND45gX?=
 =?us-ascii?Q?S422p7eRE+QEjjHrMOtBoIJcJaW7jse7zLbLsJyjHgDe8+8rvN7KKRxvo3qF?=
 =?us-ascii?Q?iI8RhopYqcqCok3c/95ztq3i7kXdd7o57lSL4WU7JtmCKG1Zi19LFqQSEKK4?=
 =?us-ascii?Q?YSxJc1E+seexVjPo/zHRMUNERchxVq6f63O7CuBf/LqAFGT1mgA6Nio3n/JS?=
 =?us-ascii?Q?Qa0VOC36L4S5VtL/9bIl7dDmiQcu5PkK9XFydvhto2VyxeVvkf3IOy+0oQkI?=
 =?us-ascii?Q?6Py7C5dWRExRwNFjofAbsCCPP54+ReHjNedqEvRtQyUwNCRLEktHVDjqeyUh?=
 =?us-ascii?Q?LIoXKF30zCneIzs788/DDtNo3NK5lbfMd2AcYIvt7XW+cIUrTFHeY7kA0vsO?=
 =?us-ascii?Q?oqClt7AUgevaDk5Jm871O5Ld8WWAqouxYB32vyZLrF8uEImhS4bGKWPXKco0?=
 =?us-ascii?Q?VllM9EDpT3bGtW8tEZqVc7Vy+2cab7YuhGeI86S4HLxYG7bQYrcc4zvTsUns?=
 =?us-ascii?Q?W+X/bsVQrkZEBRivfPL2S7fh7wZ6rZltLvGkc3xH9cKsuP4cpGcfKLW7lt5p?=
 =?us-ascii?Q?D7xT8EM4VkqOFfWTlJeoKnDIgbnaD2s1rz+3rUjRN0p1PEpYIxKBmVr4BEDU?=
 =?us-ascii?Q?RFXnfCGBfbBIBZAgVk8TnhTik6/2yvlAZ5gwTSvj9GDJ9Azzu6Uee/bt/ajL?=
 =?us-ascii?Q?Wm0ZXcrHlVW0DKRI0Rq70BxBJ5yzF7YDULoA44/+GM9dcqs77nWlWIK1oQca?=
 =?us-ascii?Q?j+aaYZaUJyU/urLKnpHU0OfhFjwsxowU4pIZvhG8rJd3hfPV61S6zx49R+JT?=
 =?us-ascii?Q?SxmBTQ+QxMuMgHh93/R83+P8VhKEEWWTpXni81ptWTmmjI87GJXMTtEqmD1g?=
 =?us-ascii?Q?lgbt9GTgNQi+xxAjCPeJDMu5dH1k6fE0BThGVbvdO47bQTpYZE2bTYB5O28P?=
 =?us-ascii?Q?zrvCBGwCj2ycFmunLo5NeQYHJDtuN/K7UcMhbqdBu/AM299lyY/LnsYH6UV9?=
 =?us-ascii?Q?BQhMcAJPweOR2e7H3db7qq9eUPQAxsJBdmlJCngH3tU23Jpo8ijm52T/lmng?=
 =?us-ascii?Q?EDzpsXR3UeQJgPyUaTcOBKx/mn7cUXS4IV3h7IC2yVcIBjtMdh7ztPQ4INv7?=
 =?us-ascii?Q?/4tzTx0fMeNsXUz7tDkoWPgm3lzebHdQay0lzm0ADUclNsI5U2apcvh8xsh3?=
 =?us-ascii?Q?oZ3cvzwPF0BAQtCIEbdanQC0xdBI2XVgEncKxcbM0HodKq7/4dh9j2LjtWp1?=
 =?us-ascii?Q?LFdo8fIRVBY52oBq3JBTNlxXjXc1z+8ao1T07778RdkrsPSfqx6W13FU98Fu?=
 =?us-ascii?Q?9L9WXE9MJKocUNREr3IVIWcVDl9mF1unEmAr/xJ2fnyDP84E/hOfSeQEWgkX?=
 =?us-ascii?Q?zVlpBDf/llxMfnCudZMlqQIXmD8QS6PizfDhm5AR?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c004cec8-eda1-4acd-01d0-08db2e959af4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Mar 2023 07:33:48.7431
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LarB0bvl0EwNT0/InewRw+V8rXpUm9MlZmAUp66zr1VhdpUTxKtDS5GJfYNbkGs1QkLbF+ULFgj+FmNWhO0MBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7406
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
> Sent: Monday, March 27, 2023 3:21 PM
>=20
> Hi Wentong,
>=20
> On Mon, Mar 27, 2023 at 02:23:05PM +0800, Wentong Wu wrote:
> > Intel Visual Sensing Controller (IVSC), codenamed "Clover Falls", is a
> > companion chip designed to provide secure and low power vision
> > capability to IA platforms. IVSC is available in existing commercial
> > platforms from multiple OEMs.
> >
> > The primary use case of IVSC is to bring in context awareness. IVSC
> > interfaces directly with the platform main camera sensor via a CSI-2
> > link and processes the image data with the embedded AI engine. The
> > detected events are sent over I2C to ISH (Intel Sensor Hub) for
> > additional data fusion from multiple sensors. The fusion results are
> > used to implement advanced use cases like:
> >  - Face detection to unlock screen
> >  - Detect user presence to manage backlight setting or waking up
> > system
> >
> > Since the Image Processing Unit(IPU) used on the host processor needs
> > to configure the CSI-2 link in normal camera usages, the CSI-2 link
> > and camera sensor can only be used in mutually-exclusive ways by host
> > IPU and IVSC. By default the IVSC owns the CSI-2 link and camera
> > sensor. The IPU driver can take ownership of the CSI-2 link and camera
> > sensor using interfaces exported via v4l2 sub-device.
> >
> > Switching ownership requires an interface with two different hardware
> > modules inside IVSC. The software interface to these modules is via
> > Intel MEI (The Intel Management Engine) commands. These two hardware
> > modules have two different MEI UUIDs to enumerate. These hardware
> modules are:
> >  - ACE (Algorithm Context Engine): This module is for algorithm
> > computing when IVSC owns camera sensor. Also ACE module controls
> > camera sensor's ownership. This hardware module is used to set ownershi=
p of
> camera sensor.
> >  - CSI (Camera Serial Interface): This module is used to route camera
> > sensor data either to IVSC or to host for IPU driver and application.
> >
> > IVSC also provides a privacy mode. When privacy mode is turned on,
> > camera sensor can't be used. This means that both ACE and host IPU
> > can't get image data. And when this mode is turned on, users are
> > informed via
> > v4l2 control API.
> >
> > In summary, to acquire ownership of camera by IPU driver, first ACE
> > module needs to be informed of ownership and then to setup MIPI CSI-2
> > link for the camera sensor and IPU.
> >
> > Implementation:
> > There are two different drivers to handle ACE and CSI hardware modules
> > inside IVSC.
> >  - ivsc_csi: MEI client driver to send commands and receive
> > notifications from CSI module.
> >  - ivsc_ace: MEI client driver to send commands and get status from
> > ACE module.
> > Interface is exposed via v4l2 sub-devcie APIs to acquire and release
> > camera sensor and CSI-2 link.
>=20
> Thanks for the update.
>=20
> Could you elaborate the decision of keeping the csi_bridge entirely separ=
ate
> from the cio2_bridge (to be turned to ipu_bridge first)? Both are doing
> essentially the same and using the same data structures, aren't they?

yes, they're doing same thing to bridge the software nodes needed by v4l2, =
but
they have different type devices(pci and mei_client device) and dependency.=
 And
they have same SSDB definition in DSDT, so the structures are almost same.

I have no idea what the ipu bridge would be like, but IVSC csi bridge can b=
e configured
via kconfig to enable/disable.

>=20
> --
> Kind regards,
>=20
> Sakari Ailus
