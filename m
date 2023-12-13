Return-Path: <linux-media+bounces-2284-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BE81080A
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 03:16:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C3731F216EA
	for <lists+linux-media@lfdr.de>; Wed, 13 Dec 2023 02:16:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C31861109;
	Wed, 13 Dec 2023 02:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Geqg4rWL"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D18AF
	for <linux-media@vger.kernel.org>; Tue, 12 Dec 2023 18:16:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702433797; x=1733969797;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=dVhDUAY9xR3BO5/wfr8v9yO4HMv6MWNwHn0w/oPvqVU=;
  b=Geqg4rWLXAAUwbxiDEdU7b6M0N3PirK9EUzCvu0RkLA+liNb3lUlwx4Z
   AgJ8Y25KSM2F4+esLgZ2I0EH9vMp9snpJ3d6/ursDDtrXD8qRzuM8Y2u3
   bLkX2Eb5o3SuUq84Xol622MHH5tKEyUVz01wO+w0esglV1rxDiAiXZswx
   ga82IhCfpNy/p4tYJLxF9PLuBZpENZyeZZ0KvpevJZ0/S3N+42tII+M6R
   Z/Nggyn6gUe2q4uSkLElDpfHw1DObtI+x73nOWwnGotkzISzxb/al99Ba
   1Cu9Xbjs4LNOAOfrT6obst12SbnP7r6ByhvoV9Z5JvBQpkjoQyP2iymB1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="459220738"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="459220738"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 18:16:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1105142307"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="1105142307"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Dec 2023 18:16:36 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 12 Dec 2023 18:16:35 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 12 Dec 2023 18:16:35 -0800
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 12 Dec 2023 18:16:34 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oL9/0vVg0rdXbe6/ujgi+IYKy/cMbxlI1ARqX8PsNUo122ZQ53VdOzTk/A0GbhoGoKfP4B0QBLwoq4TnYQSJojtHTySF5oO5H3Qq7eEFC/QdICUVoA7PADekHgRPjB0yUKV+3iQNV6qxb6yFtUDOl/I/2ehOVKLBissbAJhmhN/5DBq2T7y3BXEj9V7Wi1DZS9yDOwBDYCMpxRKpv/mxF64zCdbIOY/qwM0reCxeTOaDvklt8t09aDCTYijzbpvlfZdC0fEgVL2GvOcP9BqsTjiIXpQJBRGDlWarCHG+QMj7kEoOoauwSP9Al/7gDCssIzMI8pFWRyWB2VYNNVgNlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3SCsLBvClfFcmTmnXszIRgtoL59mVg93+u3QJ6mB/Rw=;
 b=a4FFtf2gIukg5vLt1pT1VfRNMsKyxaqaPXGxtqUwc+g5ZUAaaE08rGr1kj+9bDwTA3B+3vVcEpE7B8egwow0AtYr05whTj2krD0IUg1n9yHxEtentWJyZbehweyPpJQ20pobdYUwTX8KA1Hz2/HlU4v+rm/vAKt+fJHP1qKGvWAqckVo60k7KXEtIPprZxLa7iOQ1+0Q+tdTRrudUoKmH+aFtEm/ypQ5wxZWYDSZ07oiRs8n0P3prQiGjB6qGgMyyEcLrUPtKpnXc6m1ncKZTbgHruDHs3RG+FtEjyuKbVKm+uA2n04Tdk/QG0LD6tq0zjLBYoRNzrRJC76qcPRtuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 LV3PR11MB8577.namprd11.prod.outlook.com (2603:10b6:408:1b8::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.33; Wed, 13 Dec
 2023 02:16:32 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::2eaa:4647:7ac0:eb52%4]) with mapi id 15.20.7068.033; Wed, 13 Dec 2023
 02:16:31 +0000
From: "Cao, Bingbu" <bingbu.cao@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>
CC: "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>,
	"jacopo.mondi@ideasonboard.com" <jacopo.mondi@ideasonboard.com>, "Qiu, Tian
 Shu" <tian.shu.qiu@intel.com>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: RE: [PATCH 3/4] media: imx319: Use v4l2_link_frequencies_to_bitmap
 helper
Thread-Topic: [PATCH 3/4] media: imx319: Use v4l2_link_frequencies_to_bitmap
 helper
Thread-Index: AQHaLDtYDykz7nrfHU+ADILpOxJNyrCmey4A
Date: Wed, 13 Dec 2023 02:16:31 +0000
Message-ID: <DM8PR11MB5653BF1531D11FF180CA5EB4998DA@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20231211140658.366268-1-sakari.ailus@linux.intel.com>
 <20231211140658.366268-4-sakari.ailus@linux.intel.com>
In-Reply-To: <20231211140658.366268-4-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|LV3PR11MB8577:EE_
x-ms-office365-filtering-correlation-id: 64d52d69-1431-4b24-449f-08dbfb818591
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Xxo2EFIIcxOmu3H0kb2lELydzY7f4qugouRr4vXGDOOH5k8X68YGG+4PIOu9l+wtFMedSrInAMVBR5Wu8c06XY91+nKRAWuJnZSoqoeBeEyK9BmRTcB/p9PJG7KmvfXGbwY4qHdzQfYXjk4PlhuhMDg/FmqYxJ/gbZNqiRoPG45Xd2dz1HuTNliiTKYd3+uQnRojiF0yS0rRzvKiCvzdqOKkGa0jouGVEdk0d4guKJ8+dGnvKbgN5DodfsispNu8GQ8Bc1e4ub8Gl/x1y65OiCeSHDJGVO0tn+GdyONZRERRz7fCLzHJ3ZR4Os2LHv6KwF1gtJH1iL++/G6rzwDiPpUkhR0BGTfWqDPGJ46+MHg+5z9AOvSoskKW35pOT98WOVC/4TR+ezUy3AoU5iXI255FYWH7ErdT0IlFhSitAS1UTI7G0KOK0sidL058op+N5R5dWqAcrLkIot2b/nceoH4BkCWMIN2pyO2rCsgHpdJvCEJVDh5FpBmknDZLNTmo1LcemL+TDmc5CQa1nBmFl7ES1P5BFEgINl8MI0QtHhW4mtjdfC8ngAfP3x0xFcjbQP2FsN/E3dlCrweZANsv3PLu09h5Oz2XHT3Lk1WXG+49tuehnPwJGMUtMDfb23WIX+alTccRqCkEjJOU+EadR3prnJmB4fvRAwDiQkhtnfqzf9vCSFsOTTUqpOE/bLK/
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(136003)(39860400002)(376002)(346002)(396003)(230273577357003)(230922051799003)(230173577357003)(451199024)(186009)(64100799003)(1800799012)(66946007)(83380400001)(7696005)(9686003)(122000001)(6506007)(4326008)(5660300002)(41300700001)(8936002)(2906002)(110136005)(316002)(26005)(478600001)(52536014)(71200400001)(8676002)(66476007)(54906003)(64756008)(66446008)(76116006)(38100700002)(33656002)(86362001)(82960400001)(66556008)(38070700009)(55016003)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?v5Bb5tZm0xopW7MKr5wXAE+tiJWtOwytEOU/xvf9HErAPBBCs3vAr7mPsPRv?=
 =?us-ascii?Q?t2eQio2QxA20BVIN7XyPgypatUaJh/lh90Zka92xkhgSOg6oqT6R0D4aJR0a?=
 =?us-ascii?Q?FVU2ikcGA9RmxddOzppFMnQUViUeAxd6HtoDg70uqoOW1obkcC+dNuEYzk3y?=
 =?us-ascii?Q?iSMRChP4EgSD7VLuYrHtNf+RmFy0FGMT09QFWmuDWDz8DteTJV0JHBpaF2hI?=
 =?us-ascii?Q?gN81jf7NZS+yhBjvlriut46Zm1n0brLlrpEEEiOLOrZpP9Sna0B44MssMINg?=
 =?us-ascii?Q?i9yRZ9jxjooqxQclU3CQ6x8Jd8Vq58NQg+1UVE4HmWZmWJ7q/v5t2Wv62uXE?=
 =?us-ascii?Q?EGSgOKOfw37XlzrvP25/tyJeCmVbDxD3dUtk+zwaXxydlvZntklWwWjhVwS2?=
 =?us-ascii?Q?fj1TEMS1C5WKdu7wBlef2McETqUfTGDZpaIchlon/TZwJHdwdZGBNm1yTrQu?=
 =?us-ascii?Q?DQND8MzAsHUJnaXAa0YIoibWhXj9u8UTmedf/ywHu4uKOWOHyTnu/sq+aW2a?=
 =?us-ascii?Q?r0aU2Y5z+DkbO6RH3t0f9c3/8fi55sTSOW2ImV33s9vo9oIwjtUY9Tjwa/tp?=
 =?us-ascii?Q?xt6l424SO0RJtvPpcH6TF0jbRDgSwxYj5DmNLSN3z6OB/aMqxWFGxQ+oieE2?=
 =?us-ascii?Q?pLwdL0d0tAVNM5gv+8Q7xDWOzqBq3q2t7NGKKe+xEO7oeyvrbe7xP7iSwFPM?=
 =?us-ascii?Q?dHmRRaZWjKHrtGU6r75SsgOQzHRBGwEbsQ1zgmzFLdRt3VJ9Tzkpdr90QOVi?=
 =?us-ascii?Q?XFxaVD9S5wa8k9K6nONX/1SVdZArJ8QE8Wx1xznkxef3FjiHAIi3Hjf5ee3R?=
 =?us-ascii?Q?h8OtLVoYpH9X9ReJmVVkBrEJHfYRNxMwP/qOVR3TKbNCdHJMscLLzAiAtAaV?=
 =?us-ascii?Q?2o8pFQbPbFJOaD4/PVR+RdjWYkFx6a6eLNqiVFlt0wyF3Yota6DjlG+ptwAi?=
 =?us-ascii?Q?5Og2kAZilDWJJ5WsjkkG1srjM/k/3oDj2IhXz27Q4B5tjSL8+rqJW2gOCpV5?=
 =?us-ascii?Q?KybbPh4/a9MfY0UlSCiXR0Dv8GvSMHJolqlJeCjK1S2GCG+mDfMD8dId9Wa0?=
 =?us-ascii?Q?To4uuSFLz8bML4N8YR1VJTTPUSjLuvKCvnXGCiZlKQ3vpr06VKRx6yV/9SyT?=
 =?us-ascii?Q?ZgoXah2xyG0gKv9r0451OpNQk/0mR4CMO4x7hDWHq08mrECxsbx+qxN7Uxj2?=
 =?us-ascii?Q?lrM+tBkhgLGqOq6F4HWQOz1hk3bLet3NAjX3iE1mWu+ulgTbcc24BV4/jwWP?=
 =?us-ascii?Q?4WcdGOeo8mV88ut3k5p5i2VDq+/PIIbKksyISrVGw0jlMO0etGgkiIE97Sor?=
 =?us-ascii?Q?t/UcPWv5RxtmpvyOEpuFBSzY8m4YTeowLPougjsr/SFYmI/8MxKMPMNJTlqM?=
 =?us-ascii?Q?QWUl9cNR2+7vG3F8rmQLnX4w7MbBrvtUHdmyMtv7Lp9h85yZl+qTGAHQuagn?=
 =?us-ascii?Q?eS1vBkchgERG725Hg1vhWqC+Tnng4zV9LJ9oyJfnD7nnG9lk8pATQwtAr7fV?=
 =?us-ascii?Q?KBcpNT9jyymPAH89tQAVfvFyGC8xzkqvBLW4qCJIXScuNEOlkMTu0ewzlyzv?=
 =?us-ascii?Q?GW9UDTYvWGL3bKb8IgxRTTjye+84A2Zak/RV/0uC?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64d52d69-1431-4b24-449f-08dbfb818591
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Dec 2023 02:16:31.2706
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: V0Y2R+xG3wT4gMpIj0m7vXmOZ6LiipNpExR/QsofzkhA/t35++LlAwYrrXX4/BUq91HckBbbFenVrIz8mNT73w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8577
X-OriginatorOrg: intel.com

Sakari,=20

Thanks for the patch.

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Monday, December 11, 2023 10:07 PM
>To: linux-media@vger.kernel.org
>Cc: laurent.pinchart@ideasonboard.com; jacopo.mondi@ideasonboard.com; Cao,
>Bingbu <bingbu.cao@intel.com>; Qiu, Tian Shu <tian.shu.qiu@intel.com>; Han=
s
>Verkuil <hverkuil-cisco@xs4all.nl>
>Subject: [PATCH 3/4] media: imx319: Use v4l2_link_frequencies_to_bitmap
>helper
>
>Use the v4l2_link_frequencies_to_bitmap() helper to figure out which
>driver-supported link frequencies can be used on a given system.
>
>Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
>---
> drivers/media/i2c/imx319.c | 53 ++++++++++----------------------------
> 1 file changed, 14 insertions(+), 39 deletions(-)
>
>diff --git a/drivers/media/i2c/imx319.c b/drivers/media/i2c/imx319.c index
>e47eff672e0c..3fdda6f7d01a 100644
>--- a/drivers/media/i2c/imx319.c
>+++ b/drivers/media/i2c/imx319.c
>@@ -70,7 +70,7 @@
> #define IMX319_REG_ORIENTATION		0x0101
>
> /* default link frequency and external clock */
>-#define IMX319_LINK_FREQ_DEFAULT	482400000
>+#define IMX319_LINK_FREQ_DEFAULT	482400000LL
> #define IMX319_EXT_CLK			19200000
> #define IMX319_LINK_FREQ_INDEX		0
>
>@@ -107,8 +107,7 @@ struct imx319_mode {
>
> struct imx319_hwcfg {
> 	u32 ext_clk;			/* sensor external clk */
>-	s64 *link_freqs;		/* CSI-2 link frequencies */
>-	unsigned int nr_of_link_freqs;
>+	unsigned long link_freq_bitmap;
> };
>
> struct imx319 {
>@@ -129,7 +128,6 @@ struct imx319 {
> 	const struct imx319_mode *cur_mode;
>
> 	struct imx319_hwcfg *hwcfg;
>-	s64 link_def_freq;	/* CSI-2 link default frequency */
>
> 	/*
> 	 * Mutex for serialized access:
>@@ -1654,7 +1652,10 @@ static const char * const imx319_test_pattern_menu[=
]
>=3D {
> 	"Pseudorandom Sequence (PN9)",
> };
>
>-/* supported link frequencies */
>+/*
>+ * When adding more than the one below, make sure the disallowed ones
>+will
>+ * actually be disabled in the LINK_FREQ control.
>+ */
> static const s64 link_freq_menu_items[] =3D {
> 	IMX319_LINK_FREQ_DEFAULT,
> };
>@@ -2058,7 +2059,7 @@ imx319_set_pad_format(struct v4l2_subdev *sd,
> 		*framefmt =3D fmt->format;
> 	} else {
> 		imx319->cur_mode =3D mode;
>-		pixel_rate =3D imx319->link_def_freq * 2 * 4;
>+		pixel_rate =3D IMX319_LINK_FREQ_DEFAULT * 2 * 4;
> 		do_div(pixel_rate, 10);
> 		__v4l2_ctrl_s_ctrl_int64(imx319->pixel_rate, pixel_rate);
> 		/* Update limits and set FPS to default */ @@ -2255,7 +2256,7
>@@ static int imx319_init_controls(struct imx319 *imx319)
> 		imx319->link_freq->flags |=3D V4L2_CTRL_FLAG_READ_ONLY;
>
> 	/* pixel_rate =3D link_freq * 2 * nr_of_lanes / bits_per_sample */
>-	pixel_rate =3D imx319->link_def_freq * 2 * 4;
>+	pixel_rate =3D IMX319_LINK_FREQ_DEFAULT * 2 * 4;
> 	do_div(pixel_rate, 10);
> 	/* By default, PIXEL_RATE is read only */
> 	imx319->pixel_rate =3D v4l2_ctrl_new_std(ctrl_hdlr, &imx319_ctrl_ops,
>@@ -2332,7 +2333,6 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struct
>device *dev)
> 	};
> 	struct fwnode_handle *ep;
> 	struct fwnode_handle *fwnode =3D dev_fwnode(dev);
>-	unsigned int i;
> 	int ret;
>
> 	if (!fwnode)
>@@ -2364,24 +2364,14 @@ static struct imx319_hwcfg *imx319_get_hwcfg(struc=
t
>device *dev)
> 		goto out_err;
> 	}
>
>-	dev_dbg(dev, "num of link freqs: %d",
>bus_cfg.nr_of_link_frequencies);
>-	if (!bus_cfg.nr_of_link_frequencies) {
>-		dev_warn(dev, "no link frequencies defined");
>-		goto out_err;
>-	}
>-
>-	cfg->nr_of_link_freqs =3D bus_cfg.nr_of_link_frequencies;
>-	cfg->link_freqs =3D devm_kcalloc(dev,
>-				       bus_cfg.nr_of_link_frequencies + 1,
>-				       sizeof(*cfg->link_freqs), GFP_KERNEL);
>-	if (!cfg->link_freqs)
>+	ret =3D v4l2_link_frequencies_to_bitmap(dev, bus_cfg.link_frequencies,
>+					      bus_cfg.nr_of_link_frequencies,
>+					      link_freq_menu_items,
>+					      ARRAY_SIZE(link_freq_menu_items),
>+					      &cfg->link_freq_bitmap);
>+	if (ret)
> 		goto out_err;
>
>-	for (i =3D 0; i < bus_cfg.nr_of_link_frequencies; i++) {
>-		cfg->link_freqs[i] =3D bus_cfg.link_frequencies[i];
>-		dev_dbg(dev, "link_freq[%d] =3D %lld", i, cfg->link_freqs[i]);
>-	}
>-
> 	v4l2_fwnode_endpoint_free(&bus_cfg);
> 	fwnode_handle_put(ep);
> 	return cfg;
>@@ -2397,7 +2387,6 @@ static int imx319_probe(struct i2c_client *client)
> 	struct imx319 *imx319;
> 	bool full_power;
> 	int ret;
>-	u32 i;
>
> 	imx319 =3D devm_kzalloc(&client->dev, sizeof(*imx319), GFP_KERNEL);
> 	if (!imx319)
>@@ -2425,20 +2414,6 @@ static int imx319_probe(struct i2c_client *client)
> 		goto error_probe;
> 	}
>
>-	imx319->link_def_freq =3D link_freq_menu_items[IMX319_LINK_FREQ_INDEX];
>-	for (i =3D 0; i < imx319->hwcfg->nr_of_link_freqs; i++) {
>-		if (imx319->hwcfg->link_freqs[i] =3D=3D imx319->link_def_freq) {
>-			dev_dbg(&client->dev, "link freq index %d matched", i);
>-			break;
>-		}
>-	}
>-
>-	if (i =3D=3D imx319->hwcfg->nr_of_link_freqs) {
>-		dev_err(&client->dev, "no link frequency supported");
>-		ret =3D -EINVAL;
>-		goto error_probe;
>-	}
>-

Do we also need change the link frequency ctrl *max* value once we get
The bitmap?

> 	/* Set default mode to max resolution */
> 	imx319->cur_mode =3D &supported_modes[0];
>
>--
>2.39.2


