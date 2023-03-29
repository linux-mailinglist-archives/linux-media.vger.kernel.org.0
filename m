Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB9936CCF0F
	for <lists+linux-media@lfdr.de>; Wed, 29 Mar 2023 02:42:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229697AbjC2AmO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Mar 2023 20:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjC2AmN (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Mar 2023 20:42:13 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DA8A1FCA
        for <linux-media@vger.kernel.org>; Tue, 28 Mar 2023 17:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680050531; x=1711586531;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=yJpEOi/Ke0MTvu8ZibNnT+E+Si3XkL/Ui3g1+z2Stpg=;
  b=VgvG4OuGwWXGNOsYD2Gqw7yYfQvE4W0ulORJtEqydULT3cErBeCdBR1u
   9hVWqAjd6BGEotWUpTVs9JlBztTQmvUctf3+aMcnGhmlxXWk7Xa26jwwj
   LZDzzbkDzLuB+gAttzu4XrtXI8zb2rh8p0wKg84LIL4i9jYiqjbuUWJY4
   GQhw8xsEWNBJR1Nxs42VWa7vVASq48eTunIunfiNV6qwbkaP/4A+MrqAJ
   DHKqL6x6dypXQuKYQSmIw2nv4nxxCOpMdT+FeoTAcGND+3qtaJfXwiNFu
   iUHBtY5QD6qih0ja3sCBjM94HKNrpyeLDDJNVqbB6V7w3r3gyxJES9VSa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="342326239"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="342326239"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2023 17:42:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10663"; a="753373230"
X-IronPort-AV: E=Sophos;i="5.98,299,1673942400"; 
   d="scan'208";a="753373230"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga004.fm.intel.com with ESMTP; 28 Mar 2023 17:42:10 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 17:42:09 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 28 Mar 2023 17:42:09 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Tue, 28 Mar 2023 17:42:09 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.40) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Tue, 28 Mar 2023 17:42:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=glhoPZh1DB4bhKbovZJ71D5ABQZKkOe9ICCjehcrGF+RXVFCnQFY8S2h3Yf5AttvphmGwPRmFd2xM6W3kpU4CZcnLLvu3v38GQ1iVDCoUpBnnesDuOauG8yHRRky85frL5zrmWWnmhlmWn1qBZK1KSFJmwH8VMGPP0pGIx4/oR2j8NhKUG4MgUDQQkDPYqp1JCFjsd5S0BASeQqVWJ0tBPLo4/PkR+S3qoew8kGZvH5/Z0UsNIgl+xB1sxuTArAPAuD08lkASEs4lfLRlPgxKfHeiGtMvkhxc9xhsD9gmMqasf2yuxBuqhLZhvfBMdvUmRcyCGKrE+2qSelzQxDQMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dvjYD8qlpLKFPbQGJQgAb6G4OCbQQ0HQN6iXzfxTkls=;
 b=B+W3iRnkKTQc5cornbIoupzGsjGTYNyFmkxbnzWUSbuWIch4kWb3o6oG1n5+7kEUH4lbZAPECDhm4ZOGZgvsv94oTeEwAu4pv7q9jNFzAdTa2JgBZOJ/FRJL8NJmVEPu38+wDF2KLOugyV1CykeTN5MMkcgUHYR7NTFIb8BTl3K8icmqB9t/Lw960FRTn7SmomStvZRb6ruXSe97LBQ3B6Ie8hlig00BqD/szWQYyZRL2cotpGp+IXkHtXyWZYWy091N9cfPcLlDhi+JIMXYoM7y949I6a+Mfp7de3htyDlVQuTwWW3r8t7zvFZ2UObVLzC0PsVyrnDzf6TWY+JGLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by CO1PR11MB4849.namprd11.prod.outlook.com (2603:10b6:303:90::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6222.33; Wed, 29 Mar
 2023 00:42:07 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5252:a6b2:cfa8:5aee%7]) with mapi id 15.20.6222.033; Wed, 29 Mar 2023
 00:42:06 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
CC:     "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Wang, Zhifeng" <zhifeng.wang@intel.com>,
        "Ye, Xiang" <xiang.ye@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Subject: RE: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Topic: [PATCH v3 0/3] media: pci: intel: ivsc: Add driver of Intel
 Visual Sensing Controller(IVSC)
Thread-Index: AQHZYHShR1ChohFeu0+//9oZbrf/X68OOHSAgAABHtCAAAboAIAAAM4AgAAdFQCAAWwbkIAA0UeAgABP3/A=
Date:   Wed, 29 Mar 2023 00:42:06 +0000
Message-ID: <MN2PR11MB43182A9175011A4C8E3A31068D899@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <1679898188-14426-1-git-send-email-wentong.wu@intel.com>
 <ZCFD3aW4NRrn69LR@kekkonen.localdomain>
 <MN2PR11MB43184340CB813FFCE47AA68B8D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFKmNKZAPwsIq/j@kekkonen.localdomain>
 <MN2PR11MB431892069628328E614F03498D8B9@MN2PR11MB4318.namprd11.prod.outlook.com>
 <ZCFjqu4P9AcNbMoZ@kekkonen.localdomain>
 <DM6PR11MB4316138CF6D8D300C007B4DE8D889@DM6PR11MB4316.namprd11.prod.outlook.com>
 <ZCNEp6NmeDElNMRs@kekkonen.localdomain>
In-Reply-To: <ZCNEp6NmeDElNMRs@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-Mentions: laurent.pinchart@ideasonboard.com
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|CO1PR11MB4849:EE_
x-ms-office365-filtering-correlation-id: 3a1dbece-462a-4860-5c74-08db2fee6bec
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ccksGJ5ZOPXPqejehxaoEdF0fIv1YGMxxFvQbh3SLCK7LdLLyxTNBrK2KRsT+eLXKkkjv/YS5bD1OfTrFcYbIENN2yxVTKaYJgzvfdW2alDBipbi7rVDJqi5d4Xq/u2Q7gvJY4nWcgSXLZ5ABJyWtT7uxTZ9YhvPtFCBxOwVUYX0c/NLRruQzm3qNCXHR5vaOdWlK07hf34HRWkDA8BRN1eC00VN1v88fPKnuyWw8gKqgIBDx5S6udTmHnBslNySsBv9xfoxvTBIbx8dIWtv1MToahyDe4sydfNwniBzGqKUexmLXxmIn4hq1TYT9TBvv+B3VNvc9yes1YYZK/qXeiKEcEc5rgJrfX+8/4uL6pPLpheHExd8d2ilAG/rYoD/Qkb/qcG7Uxhbdv78BUm/IdM3XwiNE63V7VayyY/Jh88kK+u7+ntERuRqm4lrjaWJ0OOOzpL6aZkXg7uj1xFEVK5tzwU12dMpkJz+PU/dyswzbZ7RkeMuuI37hX+aZtu/pC/i4grIDnFbEj6jaL4C+eLU5UMMRHld7vWhSQ50F37zNMn7C58ByOmVPWia0l2PdjacQ6Hfu3Dem0CexUyQpeWhDnzxzTWgnRIkO2Z4pTOTKK4sJ+tHgWFaN4R39QIk
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(366004)(136003)(376002)(451199021)(83380400001)(38070700005)(38100700002)(186003)(2906002)(26005)(33656002)(54906003)(9686003)(6506007)(122000001)(8936002)(82960400001)(66476007)(64756008)(66946007)(8676002)(4326008)(66446008)(66556008)(5660300002)(76116006)(52536014)(86362001)(41300700001)(66899021)(7696005)(110136005)(316002)(71200400001)(478600001)(55016003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?dju9sAxAmCIlsiJ1tjuxLEIbwdgWnAppNAgU876Iop9Tx/rK1TRLqjMZyaCO?=
 =?us-ascii?Q?iDNgEzYk82jySbAmhS1LfuoNYD9hJS/G8Wtq/IRiTL9Gp2IJypw61uQgoDPt?=
 =?us-ascii?Q?Lo1m0m9y1ZOkD/4G+TV15aAtEseCFMHb868cNnMvUayLsMKebqjkGajPQxX8?=
 =?us-ascii?Q?77Xukh4BCLkWuFpNennSROZ0gtN1ZdCaznsyTGvv9Zn11nXtyjNHsYAlSeZW?=
 =?us-ascii?Q?PAJpRAEk+vo6A6OPDY5j8UC0+UhwmUoSpABF2bVtHj0uh4biRHEHUbTPbR0d?=
 =?us-ascii?Q?tZCAivPk2nF4j6d3E2g/HVMoMPuHoMjzNvp9CVDJUeKTiDAK79gnW1HEIBKq?=
 =?us-ascii?Q?7+KGUFVQJdfxkFFwByPKkBHJZN4DlVNRDePEnnRG2aZ9g5REb/K1O6LZuRn3?=
 =?us-ascii?Q?TcXCCgB7T9sk87BoMVk9yNo04Bbdk7hC97n8C0rExnbhzb/DkQ5g/XfWqw2Y?=
 =?us-ascii?Q?TnrUszrrXxgbVHqL5u7u7AiOuMndJONyXLiVrXTFRxEaZMbMVqLmowvLjtve?=
 =?us-ascii?Q?txffw8i02rhxX9GpKPx/Sqa0kILi9JDuhsJ5u6K746V2vIiIklv3HRa2Tsm6?=
 =?us-ascii?Q?7+rbM/BUpETUC49GpLAxJY8ljklOdkYBxFBByDyenV+pLF7E987LpXkrrHko?=
 =?us-ascii?Q?p0iAWc97nlRL5E0tn6XrMW5KhCL3CGodqJqM1MsdYzQLvJots+6fg9M7ca8e?=
 =?us-ascii?Q?LByzHrv0LXb0TmK125rTk8HjaQe9alE6gCPBHLh9yyYhkZHqurnlOB9Mz8Jy?=
 =?us-ascii?Q?Q9ZfsBqUGnh9PuUZ28VwmK8Ps+UVEI3MPykVvKlp7xs2d43e1uBUwZleUsvY?=
 =?us-ascii?Q?MUfbUmt8BckEV99ZT7Hl/1C9umCW5FJTNSTCR83xUrZw2QfmRkb7ADs+is9Y?=
 =?us-ascii?Q?5qqpteyB3jvncSTbnuUkVhnLVQi+BwYfPxKd4nAIGDp7zXNtBfeSnOJIqzG7?=
 =?us-ascii?Q?sjwOUJQz58FV/c2SnFslO22LnRGtjXV6O93ZnmZsbjGKwE4Ihryy0Tq5ifs6?=
 =?us-ascii?Q?CGEcrvR/mOXlRizHgiPEjuMYfVDWucxsY3Xjir/O4OkNUyGKG/dWPs9k258b?=
 =?us-ascii?Q?dWLIgNUU12oj9sxCuvSkoaSYn85eOJcPWZ5gkh1E3M/lKdd4W86Zr0+odBzy?=
 =?us-ascii?Q?ckXlv0C0EnfiG5mQcc52yq5cZVAqbOYHpc32jN058shnrajo37q5sw1fDqb6?=
 =?us-ascii?Q?zkWVN9MN4/nevDwFEunGnAi3U7lvQ1v4qihsbksCmxmLG78rrq1y3Jp0bu9f?=
 =?us-ascii?Q?FnGoKfH4JRj0FKjc1FRpqqv3s5V/Jf+Ok2yreGghkNg9L3QnnAct8X7havu4?=
 =?us-ascii?Q?+U9/bP2NXoKru7Hvh9B9GQxl0/R4HEAAZvZXfnmeewGGIqMGe23xV0KtjzH2?=
 =?us-ascii?Q?P1+wjKB8cApAP8JpsNs8LtM68aYO3KXkhvhUIyqF9TxYUhaRsIbgujW1mu+F?=
 =?us-ascii?Q?ouRBxpJvQOiLWGpWyff2Mcs1ooIVz2yhC3g9wMOGPz+MzV3fhriEp5M+cGMN?=
 =?us-ascii?Q?tB1bTOIIVfKQ9vjF4PYnRWVrkKGr1exzVYSQPfeJx4X4GTwYIZD+qatEAqZ0?=
 =?us-ascii?Q?JdSxX29ZbkbaZbNp/gcnJfdFx1j9R958dRBLfQnl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a1dbece-462a-4860-5c74-08db2fee6bec
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Mar 2023 00:42:06.2366
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hG7LNzQbFuXjbhZu3kf2e65iYE12AVXYpc3LIvMibeuGCP0qgMAdhZJSdQePXK2Jek4jHa2o/YR7nwectaaUxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4849
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Sakari,

Thanks

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, March 29, 2023 3:49 AM
>=20
> On Tue, Mar 28, 2023 at 07:32:27AM +0000, Wu, Wentong wrote:
> >
> >
> > > -----Original Message-----
> > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > Sent: Monday, March 27, 2023 5:37 PM
> > >
> > > Hi Wentong,
> > >
> > > On Mon, Mar 27, 2023 at 08:13:29AM +0000, Wu, Wentong wrote:
> > > >
> > > >
> > > > > -----Original Message-----
> > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > Sent: Monday, March 27, 2023 3:50 PM
> > > > >
> > > > > Hi Wentong,
> > > > >
> > > > > On Mon, Mar 27, 2023 at 07:33:48AM +0000, Wu, Wentong wrote:
> > > > > >
> > > > > >
> > > > > > > -----Original Message-----
> > > > > > > From: Sakari Ailus <sakari.ailus@linux.intel.com>
> > > > > > > Sent: Monday, March 27, 2023 3:21 PM
> > > > > > >
> > > > > > > Hi Wentong,
> > > > > > >
> > > > > > > On Mon, Mar 27, 2023 at 02:23:05PM +0800, Wentong Wu wrote:
> > > > > > > > Intel Visual Sensing Controller (IVSC), codenamed "Clover
> > > > > > > > Falls", is a companion chip designed to provide secure and
> > > > > > > > low power vision capability to IA platforms. IVSC is
> > > > > > > > available in existing commercial platforms from multiple OE=
Ms.
> > > > > > > >
> > > > > > > > The primary use case of IVSC is to bring in context awarene=
ss.
> > > > > > > > IVSC interfaces directly with the platform main camera
> > > > > > > > sensor via a CSI-2 link and processes the image data with
> > > > > > > > the embedded AI engine. The detected events are sent over
> > > > > > > > I2C to ISH (Intel Sensor
> > > > > > > > Hub) for additional data fusion from multiple sensors. The
> > > > > > > > fusion results are used to implement advanced use cases lik=
e:
> > > > > > > >  - Face detection to unlock screen
> > > > > > > >  - Detect user presence to manage backlight setting or
> > > > > > > > waking up system
> > > > > > > >
> > > > > > > > Since the Image Processing Unit(IPU) used on the host
> > > > > > > > processor needs to configure the CSI-2 link in normal
> > > > > > > > camera usages, the
> > > > > > > > CSI-2 link and camera sensor can only be used in
> > > > > > > > mutually-exclusive ways by host IPU and IVSC. By default
> > > > > > > > the IVSC owns the CSI-2 link and camera sensor. The IPU
> > > > > > > > driver can take ownership of the CSI-2 link and camera
> > > > > > > > sensor using interfaces exported
> > > > > via v4l2 sub-device.
> > > > > > > >
> > > > > > > > Switching ownership requires an interface with two
> > > > > > > > different hardware modules inside IVSC. The software
> > > > > > > > interface to these modules is via Intel MEI (The Intel Mana=
gement
> Engine) commands.
> > > > > > > > These two hardware modules have two different MEI UUIDs to
> > > > > > > > enumerate. These hardware
> > > > > > > modules are:
> > > > > > > >  - ACE (Algorithm Context Engine): This module is for
> > > > > > > > algorithm computing when IVSC owns camera sensor. Also ACE
> > > > > > > > module controls camera sensor's ownership. This hardware
> > > > > > > > module is used to set ownership of
> > > > > > > camera sensor.
> > > > > > > >  - CSI (Camera Serial Interface): This module is used to
> > > > > > > > route camera sensor data either to IVSC or to host for IPU
> > > > > > > > driver and
> > > application.
> > > > > > > >
> > > > > > > > IVSC also provides a privacy mode. When privacy mode is
> > > > > > > > turned on, camera sensor can't be used. This means that
> > > > > > > > both ACE and host IPU can't get image data. And when this
> > > > > > > > mode is turned on, users are informed via
> > > > > > > > v4l2 control API.
> > > > > > > >
> > > > > > > > In summary, to acquire ownership of camera by IPU driver,
> > > > > > > > first ACE module needs to be informed of ownership and
> > > > > > > > then to setup MIPI CSI-2 link for the camera sensor and IPU=
.
> > > > > > > >
> > > > > > > > Implementation:
> > > > > > > > There are two different drivers to handle ACE and CSI
> > > > > > > > hardware modules inside IVSC.
> > > > > > > >  - ivsc_csi: MEI client driver to send commands and
> > > > > > > > receive notifications from CSI module.
> > > > > > > >  - ivsc_ace: MEI client driver to send commands and get
> > > > > > > > status from ACE module.
> > > > > > > > Interface is exposed via v4l2 sub-devcie APIs to acquire
> > > > > > > > and release camera sensor and CSI-2 link.
> > > > > > >
> > > > > > > Thanks for the update.
> > > > > > >
> > > > > > > Could you elaborate the decision of keeping the csi_bridge
> > > > > > > entirely separate from the cio2_bridge (to be turned to ipu_b=
ridge
> first)?
> > > > > > > Both are doing essentially the same and using the same data
> > > > > > > structures,
> > > > > aren't they?
> > > > > >
> > > > > > yes, they're doing same thing to bridge the software nodes
> > > > > > needed by v4l2, but they have different type devices(pci and
> > > > > > mei_client
> > > > > > device) and dependency. And they have same SSDB definition in
> > > > > > DSDT, so the structures are almost same.
> > > > >
> > > > > If there are differences, what are they?
> > > > >
> > > > The properties of swnode are same, because we need same info to
> > > > configure CSI2. But csi bridge can get sensor connected to IVSC by
> > > > dependency info instead of just polling the only supported sensors
> > > > for ipu. Also IVSC
> > >
> > > It's totally fine the method for finding the sensor is different,
> > > this should be an extra argument for the bridge init function and a
> > > small number of lines of additional code.
> > >
> > > > doesn't need vcm. And the topology of dependency is different.
> > >
> > > The VCM is optional for current cio2_bridge, too.
> > >
> > > It also seems that this currently creates swnodes on mei csi side
> > > only for the connection towards the sensor, not the IPU.
> >
> > IPU could find the MEI CSI software node by
> > software_node_find_by_name, and then setup the bridge between MEI CSI
> and IPU.
> >
> > > At the moment you can't reliably
> > > add software nodes to a device that has may be already probing so
> > > both of these should be created at the same time.
> >
> > If you're worried about sequence, IPU driver could make software node
> > and register it, MEI CSI bridge could find IPU software node by
> > software_node_find_by_name, if the return value is NULL, driver will de=
fer the
> probe.
>=20
> The IPU driver would also need to figure out whether a given sensor shoul=
d be
> behind the IVSC. I imagine it'll be hard to achieve this reasonably neatl=
y if you
> split the implementation into different parts --- both of which need the =
same
> information from the same place (and in neither case it's under the same =
device
> than to which the driver is bound).
>=20
> >
> > >
> > > >
> > > > > What comes to cio2_bridge, the fact that it's related to a PCI
> > > > > device doesn't seem to matter after initialisation so it could
> > > > > as well work
> > > with struct device.
> > > > >
> > > > > >
> > > > > > I have no idea what the ipu bridge would be like, but IVSC csi
> > > > > > bridge can be configured via kconfig to enable/disable.
> > > > >
> > > > > Please work out the details with Bingbu.
> > > >
> > > > @bingbu.cao@linux.intel.com @Sakari Ailus Please share your design
> > > > idea
> > > here.
> > > > What the ipu bridge would be like?  What's the responsibility of ip=
u bridge?
> > >
> > > I'd expect Bingbu to have patches to turn the current cio2_bridge to
> > > an ipu_bridge at some point. These should come on top of those patche=
s.
> >
> > When will this be ready if you already make the plan? But could you
> > please help review my other patches except bridge?
>=20
> Please configure your e-mail client to wrap your lines at most at 74 char=
acters
> or so.
>=20
> I think it's binding this all together that is the concern, the individua=
l drivers
> much less so.

Thanks, I would remove the csi bridge in next version.

Ok, the IPU bridge will also cover the bridge between IVSC and sensor.

BTW, please hans and laurent help take a look the mei_csi and mei_ace patch=
.

BR,
Wentong
>=20
> --
> Regards,
>=20
> Sakari Ailus
