Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4249B79FBA0
	for <lists+linux-media@lfdr.de>; Thu, 14 Sep 2023 08:09:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232779AbjINGJO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Sep 2023 02:09:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232171AbjINGJL (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Sep 2023 02:09:11 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 780CBE3
        for <linux-media@vger.kernel.org>; Wed, 13 Sep 2023 23:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694671747; x=1726207747;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hvbNys49X3pK754xKjvuzxSpxnXxLn0SVeU0wspwbgI=;
  b=DJfntsv1/Xdfe3+R5kEbuvBanjAlK6yjSGMaVPgtOHdWSpzYipRyRQEZ
   hiNuLJ/IxTEJdUPzsQmTBJIcwYIZvh0GM0tq4RWaTSkNeml9nCSXeKjJD
   96vaVxupEWbQajTC2CkXV0hggaMr6qtsPL8n76XLyFyAb3cy3OVyS9W/o
   tX8Yuc/gXuM3M9ZY9JBaOe4ck2RT2Jim3B6PeIJV3stYeSYo4aGE6fLDd
   iN6WDURXbbrrYytyXntMsDdrklqYq4wds8ow+aHkngVdrUgU/pNMoPfk3
   EKAk4YlPaaPnyVHb3T781t/HxjrQnFaJ20rWgcHJLZkUZGaTt6krB909r
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="369135774"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="369135774"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 23:09:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="918125930"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="918125930"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga005.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 13 Sep 2023 23:09:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 23:09:06 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Wed, 13 Sep 2023 23:09:05 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Wed, 13 Sep 2023 23:09:05 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Wed, 13 Sep 2023 23:09:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b6QFj5/Cjl3xCKku84A3VfekctAw5slbndelz4hDvDFd5AXaBv0kzdq64AvQtd1E7YgoLFtVS2QbBuUTpu02yP/I3B+Q8J0BcYHA+dBopUX31mqK6Cy/VqwfAsZQRyz19LZkV8LYSMKEr3NZw+NO6XGf2tvVfxqP1ghHDgf45br5jV4IYS85Axrf3vA2RH51QY6bXC//4afcdY+xGTHZYNJs+TJL8hPhl2sMqz0uzXcU+0BbBDHDu6rHeKa5XdmZ5joOu+t5WLhSzZPhIzDPg0/a8+OZwyTQxvFrZGERTkpp92g0eLdjqDgLZ5xhvTuvIGq7yvIjA4T8LOI9OZZiKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IgYZDfjL2P8kt3MeefAicorxh2eGHSrqzUGA5PplwKU=;
 b=MW6QwfAG5Bz6gnvMcX0UbjlkmaZWM6T+ms92YbhBk0rSeRYteTF3gt/8Lw1pbfq4+JdlFbILDDVb25AZUHrpy3ha66czFpLDBrUPaNlZzleHYuxW9yzXuOEfNMLU1yq0t1//9A20yvRgSXzMo4UfY2oQQk/E1GD0Z9me2uamxPraWsMAy+Faw/HynbMeG18ITmwiCmzd6DWtzQObySUcfmtN1Dd5OawBD8UEwZPRIfmEygGqEj3xJ5EpzCLzW5iwzK+368l7MirgFdPcDjdvgsxsqMAceQLk7BWz5QUXhnwtTc+vQw1RbpA2tWKr/s39yXkKrgTjJKaPJp8lACggbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22)
 by DM8PR11MB5574.namprd11.prod.outlook.com (2603:10b6:8:39::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6768.38; Thu, 14 Sep
 2023 06:09:03 +0000
Received: from DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::1c13:f927:574:8708]) by DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::1c13:f927:574:8708%3]) with mapi id 15.20.6768.029; Thu, 14 Sep 2023
 06:09:02 +0000
From:   "Chen, Jason Z" <jason.z.chen@intel.com>
To:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
CC:     "Yeh, Andy" <andy.yeh@intel.com>,
        "Zhang, Qingwu" <qingwu.zhang@intel.com>
Subject: RE: [PATCH] media: ov08x40: Modify the tline calculation in 1C mode
Thread-Topic: [PATCH] media: ov08x40: Modify the tline calculation in 1C mode
Thread-Index: AQHZ5tEQI+NdGpxQ3keyNvx90uuy8rAZ1Msw
Date:   Thu, 14 Sep 2023 06:09:02 +0000
Message-ID: <DS0PR11MB7459B22AE2ED6281C1C17433CCF7A@DS0PR11MB7459.namprd11.prod.outlook.com>
References: <ZPrsTs59z0tK9e8A@kekkonen.localdomain>
 <20230914060111.2621750-1-jason.z.chen@intel.com>
In-Reply-To: <20230914060111.2621750-1-jason.z.chen@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7459:EE_|DM8PR11MB5574:EE_
x-ms-office365-filtering-correlation-id: 63b74412-0936-4d1f-45de-08dbb4e91825
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 8qf468yQRA9973/ECsU5X79fPqPNSXkJRco3Z9DvIgRh8x0AOgPCWBv32n8AV66WP7zwGwfhUP3fw2o8rbIsSYVJJV3GsM2On5kl9pwxuRS6Fm5ZLIaf95+ItjRFB9eIwxpEWMEyFxQXssFkjJ5cfuiDENk4LsPdrTtn1uMu18D9zHVeEr+xbfNF/Vq8e01izwd3doRxASi1HNM+oSDDJLfFlVnRbh48QoaHZXReK5XO3a3nc7RCPVFcYLz1Um62LRs0lKcMExXDX1HX43eWkkpyEci2cs75Jmvz1Wt0wj59CBEEXSBagYd0Bmb6azHCiiFp/FxsUAlS3SOW+cBWlE/lyvYFzfGAVx3scjJdpkTenQdVKcsqaSMULTduKAn2R1uhf589stLa9goWV7EAYM+Y95XD5Rcb0b2ODF68hT0F8gXWXAmOYr41Ve6xd3osyTl8rNxwgCukslAYe0JPHJ+6gw4O097jF2BeRLo6hVN/kraPt3QZ3mW/TQ4+oaXTWLmxrLTGGdLvEl/PTFZupKvnlwSz7n1Yh8ttNtuD5gQZqpXCeDLI+CRKou++TE3Cvf2rgUfz3ZD45AAzyBeN5TtLRgjHq9aNNEFMbioxKkiQCf4sI8uViSh89Jod9C6P
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7459.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(136003)(39860400002)(346002)(1800799009)(186009)(451199024)(9686003)(38070700005)(26005)(122000001)(478600001)(38100700002)(83380400001)(82960400001)(7696005)(66446008)(41300700001)(66556008)(110136005)(64756008)(66946007)(76116006)(66476007)(6506007)(53546011)(316002)(54906003)(71200400001)(52536014)(5660300002)(4326008)(8936002)(2906002)(8676002)(86362001)(55016003)(33656002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?hTxCtJ1pxDkWHNRFmDcYdRuDyTfESRGuePQutZ4FUkzY8POzEldo0qtFX4nw?=
 =?us-ascii?Q?oPTwrKgieXFwEepjWQdwYKkRo2wViFpBrRXUjZ/ZdWK/OU9B0QoGYR+QzJ+k?=
 =?us-ascii?Q?WjhAZyC/XqQNAVHWioDNTNBrhe97SHRkO01AE1E0H8gKy9MUDkn8IDsqRoaa?=
 =?us-ascii?Q?Zk2ipJ2dww1VJNy91K5Bqdqev9oR8dvTovV28PeQXNrURxMQb17pxSDEw/ho?=
 =?us-ascii?Q?QAvZ9DCM5DERhqH97pwX77lKR/niVkxTLw73P3hXMX+oeCbTjbjYN9cX25KF?=
 =?us-ascii?Q?G3i4dclZ2t4UAVdkoaTX0thVJGaxdLu1qgkqqC1WLIV4VqfFFrhZgMV190Sc?=
 =?us-ascii?Q?Y+iri/Zo+a0D58cUJpGTV9sW50WtjyvuOra7Qy6CFRPAh8+9ynsphg46z8Tj?=
 =?us-ascii?Q?REsFryM6Xq0M0amWFdcNgL1FK+mszqddi6QysE1e+whBcbx8us0pccZOQ5Q2?=
 =?us-ascii?Q?LFyBXKz+/iJKK/u2RB7fjHBZJA/n6NI28lvekqII1DvFglbuGVb2NZwYDDZb?=
 =?us-ascii?Q?IfwgdZYdKcOxJjA+wwg6MkYJSbDqrhwm/biTLl4zGQ5vggPKdM587OIjzCeL?=
 =?us-ascii?Q?PE91Nzf238upL/hBIK1CbimOHI0go8hVOktBtn2RdrO8qg4hFDtt8WWyqrO1?=
 =?us-ascii?Q?LdiKjpw8HtopXahccSpsXaYTeysIb/rDuai0CF/EXXFdqHSEJDVhDzVIYCn8?=
 =?us-ascii?Q?neFb5AFuTSAW+ho7HO3joNhPld/pAHXhJFpOuCKJ7XIUHNqc2IRxN0TylQ1a?=
 =?us-ascii?Q?OtCP+7b0Ny497AHuwsp3T1MNAHUNwr5EGdygVW4RgMxHKL/mZcVRZF7d2HvS?=
 =?us-ascii?Q?xn0rtdSUVNCG7omIDZuquLBxlkiXM8N/Z3JoJ32kICndcnqBhwXRpakGbUcN?=
 =?us-ascii?Q?qtCc6xHn8TtPu/RBAyDP3Sx7cMMvoLj5W0eMIcAIqvJAHOPHbtto7KubXhpO?=
 =?us-ascii?Q?2C2d5fxWlw/UAke6E5vAi+0rffZgzTYS5Gj/wG9/lFhtEIUbg5TOd6mn6gbr?=
 =?us-ascii?Q?mk8i73swgwY7TLALn8uRADaep88ZGohKZm8X0HxdTt0txnN+BLzbaRzzqe2m?=
 =?us-ascii?Q?BhGcOjG39kjdmJS0C+gs73uokonb6aqkGpkqDtsgWII87s4V3injOxaf453n?=
 =?us-ascii?Q?ed6vZSGa/IZ3uYEjzM23ZL6MzjEPaw4Rn0HJe6Ft0Vbfh7rLgUAt8kJoO71W?=
 =?us-ascii?Q?XEYClNcDQaeKtR9PRMMm3ZQQOLNeX49ihhVZgtd8nOWqVlQ2KywdlSNMwM7h?=
 =?us-ascii?Q?Y8y/f54g2Xiatoniobq/+0euh4aq2KOlyhVjZH7+2b+Jc1MzxLWdqmzCPx2r?=
 =?us-ascii?Q?jR7Y5EsBYBYf5AD6wkbRMh8c/t9MuywZC47MBpdzwDpGXe3N1TdzipxK+P2B?=
 =?us-ascii?Q?RJm0iri6f9V+/Eu0wrqG/APAFmBrSW+D+WC4Wnp+dVfNxxTrNN0GXntCvq0f?=
 =?us-ascii?Q?WHeI9laC/5rePg8fyunQn7Q35TEQcuHmgV0DWWh8/+Rl5ziEfQT3IjG/NPWJ?=
 =?us-ascii?Q?pEKt9i/q3KriDYUQ6ZZHDjEE/pkNuqoj3Hs+WKVtr9U3gV603+eJtJ9SEF5R?=
 =?us-ascii?Q?2tx5B5AKxSeAykjaBjvqkPUu3duG6N7JLi27CPn6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7459.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 63b74412-0936-4d1f-45de-08dbb4e91825
X-MS-Exchange-CrossTenant-originalarrivaltime: 14 Sep 2023 06:09:02.7990
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: SMqNRYiKEGKGfH7tdCgo28zM/1yOJcbScF48MOmehh1prl56huuB+6462mMBbP6tJFJM+8HzcoZQERV9DQq+bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR11MB5574
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the review, Bingbu and Sakari.

Because I have also ran the `sensor entry criteria` to make sure the driver=
 behavior.
So it takes a delay for feedback.

I modified most ideas by previous comments.

However, we cannot take this part away.
=20
> > > +			/* frame length line need to be aligned */
> > > +			vblank =3D (vblank & 0xfffc) + OV08X40_VTS_ALIGNMENT;
> >=20
> > I think there should be an existing macro can help you do that, then=20
> > you can remove `OV08X40_VTS_ALIGNMENT`.
>I'd change vblank limits so you don't need this check anymore.

About the alignment, it needs to be added or the flick will appear.



-----Original Message-----
From: Chen, Jason Z <jason.z.chen@intel.com>=20
Sent: Thursday, September 14, 2023 2:01 PM
To: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com; bingbu.cao@l=
inux.intel.com
Cc: Yeh, Andy <andy.yeh@intel.com>; Zhang, Qingwu <qingwu.zhang@intel.com>;=
 Chen, Jason Z <jason.z.chen@intel.com>
Subject: [PATCH] media: ov08x40: Modify the tline calculation in 1C mode

From: Jason Chen <jason.z.chen@intel.com>

The tline value need to be doubled in 1C mode.
To follow the vendor's update for 1C mode:

Tline time =3D 2 * HTS / SCLK

Exposure unit :

1 * HTS =3D 0.5 Tline

Signed-off-by: Jason Chen <jason.z.chen@intel.com>
---
 drivers/media/i2c/ov08x40.c | 55 ++++++++++++++++++++++++++++---------
 1 file changed, 42 insertions(+), 13 deletions(-)

diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c inde=
x 637da4df690..fc7880f60f0 100644
--- a/drivers/media/i2c/ov08x40.c
+++ b/drivers/media/i2c/ov08x40.c
@@ -34,7 +34,7 @@
=20
 /* V_TIMING internal */
 #define OV08X40_REG_VTS			0x380e
-#define OV08X40_VTS_30FPS		0x1388
+#define OV08X40_VTS_30FPS		0x09c4	/* the VTS need to be half in 1c */
 #define OV08X40_VTS_BIN_30FPS		0x115c
 #define OV08X40_VTS_MAX			0x7fff
=20
@@ -44,7 +44,8 @@
=20
 /* Exposure control */
 #define OV08X40_REG_EXPOSURE		0x3500
-#define OV08X40_EXPOSURE_MAX_MARGIN 31
+#define OV08X40_EXPOSURE_MAX_MARGIN	8
+#define OV08X40_EXPOSURE_BIN_MAX_MARGIN	2
 #define OV08X40_EXPOSURE_MIN		1
 #define OV08X40_EXPOSURE_STEP		1
 #define OV08X40_EXPOSURE_DEFAULT	0x40
@@ -126,13 +127,17 @@ struct ov08x40_mode {
 	u32 vts_def;
 	u32 vts_min;
=20
-	/* HTS */
-	u32 hts;
+	/* Line Length Pixels */
+	u32 llp;
=20
 	/* Index of Link frequency config to be used */
 	u32 link_freq_index;
 	/* Default register values */
 	struct ov08x40_reg_list reg_list;
+
+	/* Exposure calculation */
+	int exposure_margin;
+	int exposure_shift;
 };
=20
 static const struct ov08x40_reg mipi_data_rate_800mbps[] =3D { @@ -2354,7 =
+2359,7 @@ static const char * const ov08x40_test_pattern_menu[] =3D {
=20
 /* Configurations for supported link frequencies */
 #define OV08X40_LINK_FREQ_400MHZ	400000000ULL
-
+#define OV08X40_SCLK_96MHZ		96000000ULL
 #define OV08X40_EXT_CLK			19200000
 #define OV08X40_DATA_LANES		4
=20
@@ -2392,26 +2397,30 @@ static const struct ov08x40_mode supported_modes[] =
=3D {
 		.height =3D 2416,
 		.vts_def =3D OV08X40_VTS_30FPS,
 		.vts_min =3D OV08X40_VTS_30FPS,
-		.hts =3D 640,
+		.llp =3D 0x10aa, /* in 1c mode, tline time =3D 2 * HTS / SCLK */
 		.lanes =3D 4,
 		.reg_list =3D {
 			.num_of_regs =3D ARRAY_SIZE(mode_3856x2416_regs),
 			.regs =3D mode_3856x2416_regs,
 		},
 		.link_freq_index =3D OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.exposure_shift =3D 1,
+		.exposure_margin =3D OV08X40_EXPOSURE_MAX_MARGIN,
 	},
 	{
 		.width =3D 1928,
 		.height =3D 1208,
 		.vts_def =3D OV08X40_VTS_BIN_30FPS,
 		.vts_min =3D OV08X40_VTS_BIN_30FPS,
-		.hts =3D 720,
+		.llp =3D 0x960,
 		.lanes =3D 4,
 		.reg_list =3D {
 			.num_of_regs =3D ARRAY_SIZE(mode_1928x1208_regs),
 			.regs =3D mode_1928x1208_regs,
 		},
 		.link_freq_index =3D OV08X40_LINK_FREQ_400MHZ_INDEX,
+		.exposure_shift =3D 0,
+		.exposure_margin =3D OV08X40_EXPOSURE_BIN_MAX_MARGIN,
 	},
 };
=20
@@ -2667,13 +2676,21 @@ static int ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 					     struct ov08x40, ctrl_handler);
 	struct i2c_client *client =3D v4l2_get_subdevdata(&ov08x->sd);
 	s64 max;
+	int exp, vblank;
 	int ret =3D 0;
=20
 	/* Propagate change of current control to all related controls */
 	switch (ctrl->id) {
 	case V4L2_CID_VBLANK:
 		/* Update max exposure while meeting expected vblanking */
-		max =3D ov08x->cur_mode->height + ctrl->val - OV08X40_EXPOSURE_MAX_MARGI=
N;
+		/* because in 1c mode, 1 HTS =3D 0.5 tline
+		 * fps =3D sclk / hts / vts
+		 * so the vts value needs to be double
+		 */
+		max =3D ((ov08x->cur_mode->height + ctrl->val) <<
+			ov08x->cur_mode->exposure_shift) -
+			ov08x->cur_mode->exposure_margin;
+
 		__v4l2_ctrl_modify_range(ov08x->exposure,
 					 ov08x->exposure->minimum,
 					 max, ov08x->exposure->step, max); @@ -2697,15 +2714,23 @@ static int=
 ov08x40_set_ctrl(struct v4l2_ctrl *ctrl)
 		ret =3D ov08x40_update_digital_gain(ov08x, ctrl->val);
 		break;
 	case V4L2_CID_EXPOSURE:
+		exp =3D (ctrl->val << ov08x->cur_mode->exposure_shift) -
+			ov08x->cur_mode->exposure_margin;
+
 		ret =3D ov08x40_write_reg(ov08x, OV08X40_REG_EXPOSURE,
 					OV08X40_REG_VALUE_24BIT,
-					ctrl->val);
+					exp);
 		break;
 	case V4L2_CID_VBLANK:
+		vblank =3D ((ov08x->cur_mode->height + ctrl->val) <<
+			   ov08x->cur_mode->exposure_shift);
+		/* frame length line should be aligned arccording
+		 * to the value provided by the sensor vendor
+		 */
+		vblank =3D (vblank & 0xfffc) + 4;
 		ret =3D ov08x40_write_reg(ov08x, OV08X40_REG_VTS,
 					OV08X40_REG_VALUE_16BIT,
-					ov08x->cur_mode->height
-					+ ctrl->val);
+					vblank);
 		break;
 	case V4L2_CID_TEST_PATTERN:
 		ret =3D ov08x40_enable_test_pattern(ov08x, ctrl->val); @@ -2849,7 +2874,=
9 @@ ov08x40_set_pad_format(struct v4l2_subdev *sd,
 					 1,
 					 vblank_def);
 		__v4l2_ctrl_s_ctrl(ov08x->vblank, vblank_def);
-		h_blank =3D ov08x->cur_mode->hts;
+
+		h_blank =3D ov08x->cur_mode->llp - ov08x->cur_mode->width;
+
 		__v4l2_ctrl_modify_range(ov08x->hblank, h_blank,
 					 h_blank, 1, h_blank);
 	}
@@ -3075,7 +3102,8 @@ static int ov08x40_init_controls(struct ov08x40 *ov08=
x)
 					  OV08X40_VTS_MAX - mode->height, 1,
 					  vblank_def);
=20
-	hblank =3D ov08x->cur_mode->hts;
+	hblank =3D ov08x->cur_mode->llp - ov08x->cur_mode->width;
+
 	ov08x->hblank =3D v4l2_ctrl_new_std(ctrl_hdlr, &ov08x40_ctrl_ops,
 					  V4L2_CID_HBLANK,
 					  hblank, hblank, 1, hblank);
@@ -3320,6 +3348,7 @@ static struct i2c_driver ov08x40_i2c_driver =3D {  mo=
dule_i2c_driver(ov08x40_i2c_driver);
=20
 MODULE_AUTHOR("Jason Chen <jason.z.chen@intel.com>");
+MODULE_AUTHOR("Qingwu Zhang <qingwu.zhang@intel.com>");
 MODULE_AUTHOR("Shawn Tu");
 MODULE_DESCRIPTION("OmniVision OV08X40 sensor driver");  MODULE_LICENSE("G=
PL");
--
2.34.1

