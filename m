Return-Path: <linux-media+bounces-3954-lists+linux-media=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C51835978
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 03:53:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 854171F21789
	for <lists+linux-media@lfdr.de>; Mon, 22 Jan 2024 02:53:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8DBDC1370;
	Mon, 22 Jan 2024 02:53:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QFif6/pS"
X-Original-To: linux-media@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 765DDEBB
	for <linux-media@vger.kernel.org>; Mon, 22 Jan 2024 02:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705891999; cv=fail; b=fb1ReD4vwSZjFW4MKiUVCwTmqLNcU/2RRQEAYhMMrM1s3XJuDJN6RYR4RSEdT7Z/McZJiQsz7G8NOj73LbGBakgRKuHZe/5ug32S+Aj+G+WXghag5Vsy/ep3HnwhpghBf8JLMMUukFHVXfuNiJumEGmN1hGM2X7xW4KHHoCexqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705891999; c=relaxed/simple;
	bh=bH1SMKhlEfwlpwXF9BFH/uLrNERXwCm4ZyKJ/62QIVw=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=g74TRbduJ14q4WrezfhjWvvgCwFmb6wQgYEmGZcQCUWy/pt0GfSZ26h3QZ9pDlToHsPPFqnV+6wqXoEMRYQ2kjx5I0tRhG5UtelOhDMIiBMqfpr4NzTM5iPsY5u8jrSRweidg6TX5fz1WD3GPOaO96kFbqJKT0yEllyW/x9HrBk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QFif6/pS; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705891996; x=1737427996;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=bH1SMKhlEfwlpwXF9BFH/uLrNERXwCm4ZyKJ/62QIVw=;
  b=QFif6/pStOneFTozCJKqHe72vBVq194pSnfRcZkSPE8AerSDzy/YrbBq
   gKydnVJBFVLXSTWL9/TZ+9JVGbXLhkW9w/XHW42RaaqA4GaaCk7JLodcF
   aM5D48NWA1QFiY1Vr2pofdruDYGtmpUtzeTLqEHUgeO4DzVhaT6hJzxsK
   mhCgv6wFoY7pG0/tnYBUsCZu3ehX0EU4zDgotGrih1jQZc2GZhu6luyww
   UPDqoOSi3Sh9eezifPDHTvcXuG7ErEW+FncvKOi6nLQJKkH0OHUxPUAdp
   qrbQgt5ybJFfYRAOHmHCKdlZZh3ZZVp5RloP0Pn0aD4+UKxyiLQAdtd+6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8191725"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="8191725"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 18:53:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="819534690"
X-IronPort-AV: E=Sophos;i="6.05,211,1701158400"; 
   d="scan'208";a="819534690"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by orsmga001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 21 Jan 2024 18:53:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 18:53:15 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 21 Jan 2024 18:53:14 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 21 Jan 2024 18:53:14 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 21 Jan 2024 18:53:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BZmAAAkb19jCcVuJZ15M9oiSmzm1L9C0emUCqjJKLkoLPx+v8GQJ9MInoA7UDE8ZQWHZZK6u9wiiWlXt8I663RoUYLPasTDhF1b+J7EuShWn9EOx+rHwyD1GFPzcpz3YC0NtQ1Qi2idTeA0aQKzmcVf8ov2EgZ3GtoNSg1aD5rn542EM0Mv5kpGsMQ0jTj5w1IeRm3EmjOdrxnq/PAAjqqXZuLR9ky/KfumYs6cyn4SMAoZ4zexWC89Y6B0bs7LPYHZ2r+HxMcfg+xrCW77oEqKRbJxgMqAtUfCl5bzbYjjIk4/PjpROBW8lkI/N/blOPm1wnwpWJLeGGx3HVdHbww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XNJ2jXRaiRPzsIpWB/fGq4SP2BVsas8lyzHZU2GGpi0=;
 b=i/EIZrulostP/aZG5iAZ767P3/vBaJpxGXQtrJGNBdmtbqz9r1zuBsvSNdCl1p3+pWirbcGst17sn8caH/KB2n1I15+QCDo1XUaXibtSDiZ2xCXEpeZkE21IWglM/5d0KFePEFETICtyTBaqmNQYCRdUSiowLpgCxB+Q541//axPNHYLvu2D/+ZvVg6LUM3W8VL19Dk5uFpL+NF5t9fdqcr05SdoRk+FoxTNA3QGhlZZIAQFZ61dhnepY0ptyP9yvAq0tZWm0HXYuVlnHEJLbigquLS5lmzuY6R3EYfX8j4/kuEK8vFv1e/k+wqsb4FYThhz9O0tVE1KD4vFuH4bcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7459.namprd11.prod.outlook.com (2603:10b6:8:144::22)
 by BL3PR11MB6411.namprd11.prod.outlook.com (2603:10b6:208:3ba::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.32; Mon, 22 Jan
 2024 02:53:07 +0000
Received: from DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::43f3:ea84:dd5f:d8d9]) by DS0PR11MB7459.namprd11.prod.outlook.com
 ([fe80::43f3:ea84:dd5f:d8d9%4]) with mapi id 15.20.7202.028; Mon, 22 Jan 2024
 02:53:06 +0000
From: "Chen, Jason Z" <jason.z.chen@intel.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "Yeh, Andy"
	<andy.yeh@intel.com>, "Zhang, Qingwu" <qingwu.zhang@intel.com>,
	"bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH v1] media: ov08x40: Avoid sensor probing in D0 state
Thread-Topic: [PATCH v1] media: ov08x40: Avoid sensor probing in D0 state
Thread-Index: AQHaP8DhjNoILEy6vE2s6KQFG+QCIrDPm+uAgBWgITA=
Date: Mon, 22 Jan 2024 02:53:06 +0000
Message-ID: <DS0PR11MB7459F01F603FAE6F4FD7A924CC752@DS0PR11MB7459.namprd11.prod.outlook.com>
References: <20240105102008.2879073-1-jason.z.chen@intel.com>
 <ZZuz8yMCiaHNZwpB@kekkonen.localdomain>
In-Reply-To: <ZZuz8yMCiaHNZwpB@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7459:EE_|BL3PR11MB6411:EE_
x-ms-office365-filtering-correlation-id: 1d3e7da5-bdf5-4d90-6018-08dc1af54298
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: O7A6qvE7MsxH2MpaRjA9NO3+QCrG8W0AopOuyfqYhSVTAT9/si6aEcV6Ng9i/+0MYZuKkgSbt8wYGaD8lR+I7JtQM0rwywC9lDZzrzecV/TU3aYlie7KGvKAmuvbFMZs4n3Ew0Q849zY+j/tbnXNR6kxpk/juWDvdYT6n0G3dsMDFT0/jnvqoPqOgXrLLHKumt57c6OHpm+yT6OdVDzM8IxKu4alBLt9P3cfxUW9DrIveLp5aqtnuJZLUG/EASiGugAUskbd71zeRYPu3vHs3UPg489sSd/z7LVpRVDmS64EzzwgVG6Naap06Yu41MWiqVKMJzO9J5gCUij2s5EkrhH/Qx4eLUIGvpnkwx+J4SIjfgGs+OgluJW/ZUPCx72fFYelg+FDeZPG78mK3PENjfdd1jqM7nWyS/S03m9lylBUq20PnEUrq3PKtlOuXjyomtAKJwEuGxJGRBZGBELQyx9k8U8Uwib3F+NMcCT6dCF3QCjzHSlzO6bMlEhx8U6CKXBeEuNRb6A+scyLQEtUW0K/0SyuTgUYecYj1xrnivu+aWlBA9UKGv7h+e4hi3tHtQzLYntBEIwnZIK9rwHCXPiXGg6YPx0FSUkz0oNWBRE=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7459.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(346002)(376002)(39860400002)(396003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(55016003)(6506007)(7696005)(71200400001)(9686003)(53546011)(26005)(122000001)(38100700002)(86362001)(33656002)(82960400001)(38070700009)(41300700001)(52536014)(83380400001)(5660300002)(2906002)(4326008)(66556008)(66476007)(8936002)(66446008)(8676002)(478600001)(66946007)(64756008)(76116006)(316002)(54906003)(6916009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?uKCgiOf/3l5KxD/6RRF027Z3ohjStO+2W91YTMGd1gKtqc4mV1dCjdL7YXz5?=
 =?us-ascii?Q?3GrVHkNjnOOOZkOMPSGZE3UrUtWCyYZIyq5AkQMd1P2kK7fAWVL0wx4uk2Rw?=
 =?us-ascii?Q?nskMkmpLpYxCBFHo+k+QqvnX/rKJ8GFoaF0DUIAMKJndTMPRDvLykAECqhUH?=
 =?us-ascii?Q?wA1ycXB0DDnbOJSS5C87CJI3y+UY4dmuVO4IV4rUhWqZ4xKmVpuKQ3vXRKpu?=
 =?us-ascii?Q?XPRCXudgwVp/JwpeRZkjcQvXsUFwyz6jo98Dr8NfN5csxBm/gNB075dFNRJm?=
 =?us-ascii?Q?d+yt8rzVbbT6YIGStx5AmWbKqD89wNIb0CEvVSt5lQnhl8tRSya4oCUuQgL9?=
 =?us-ascii?Q?xlpfxXOpuqE/2lUvJDUEd6g17dWLR6Ib49tf04fIFexwFGSCZLLw+VvorSBX?=
 =?us-ascii?Q?vv18PEyqJsAlVmiRDgY4wrFPoj/wZ7iJsPTNCL3N260LbmUlb18OQ/C7IuUm?=
 =?us-ascii?Q?6fXLp/buz/85T9Jwlfy8y3vzwaEMWS5aWCQee7lT1Chi8u76kz0c1AhVhK6L?=
 =?us-ascii?Q?izfSXdVwvcjSpDVtuq+rwOz+Z3Wppygy7a/ppehmzzOa1L/RNilzbqgZSFmI?=
 =?us-ascii?Q?7wObhDYu2eIU8C/qV5SADyWecH/jyWLJmWZN7h7jgvg6HwvqubTyCI4mwpqp?=
 =?us-ascii?Q?0JHVcKSeRgdFfSi1gq/JQRnA8S/bHOkySVQHHM/jiBeZUUsKlo0D7rjq5kME?=
 =?us-ascii?Q?5RuJNRDMdc/WfG021xSTq+0OJXOOijGDBtG8LigZgPykAAaHbao8bxMZjF2r?=
 =?us-ascii?Q?mz4vzXBclSpouthKbDIyg093Sw2k8XC8lhxTvb4PSruFp60YPx9KEpz0iTW9?=
 =?us-ascii?Q?E0QIkgl18Zyz1NrnyvhvpXmEIiCs2HBqtAYBGqNWNxYs8lc9MtmUM6QNUxP9?=
 =?us-ascii?Q?zOalwF2S/EIa8vDHBpmfRgbSOpzgHev/+IlSE2gFUHM4Th0ehrr6BsEQJD38?=
 =?us-ascii?Q?AsOXlsjTio0mP6olzJBoCZA5AcSC/yq6zkvkpRyulDBNQeYMgmlt0CJu1O7g?=
 =?us-ascii?Q?TDM3vCjIU/8c0y/rlKIu3w7zCnopyKtsF6f7YvjckCh32ujDN+6jeYEupuX6?=
 =?us-ascii?Q?3NYcyr2qtRjj34Ges+EEcP3jD+c3LYruTSoS5JgN16D1/W2GpkI6u5sArMmO?=
 =?us-ascii?Q?aUrkNZHCRdY1UdQO8m328AeRaWuzWqgdhWcEryzaeMXA5HeFSYqVpAkykLks?=
 =?us-ascii?Q?2XF/vQe+EcfVtNLoKIlxxzSGdwicLMGxaz+aGh67Pb9qOpdxFWG3QFJoPQC/?=
 =?us-ascii?Q?BVEK5af6XwPK1auCBpY7Qj61+Gux4C8xQQVPL2FQVpJDZSY0ZkqtCdkgJZXv?=
 =?us-ascii?Q?qDkvSkdSah02leGgeLCxZ+tDqLiRzBL/QG6gWCtm+TbBO7d1ppK4KCFLmbJ6?=
 =?us-ascii?Q?nKKoHw0B+CB3u7YQ9+xpWh99b6giTO1/Hye6we1JZe+xcrB0E67yQaPUHotu?=
 =?us-ascii?Q?tyyCDMsZGwnKoGbPtSuPcG8RkG+TZPg0F8SWuD/x4EaUxjmGuRQ0Y/9rIQ5j?=
 =?us-ascii?Q?MRiFD01Aowz0lm29i4bJA4Uw+UhsYp2U2xfvoNyDHMvOpMa0B2BYzZ4xnX1q?=
 =?us-ascii?Q?d2AdipiakV6URCVOjPZXvuTTtvP+o/aKmdxFaUOl?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7459.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1d3e7da5-bdf5-4d90-6018-08dc1af54298
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Jan 2024 02:53:06.6134
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: X/tk95YVt7NX4s6X+xjG1KswdyiRcHssWzVmg4bC5sBt1bCq2mmeAPpv616pK+IGyJlh8reTZ9cfScWWocZwaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6411
X-OriginatorOrg: intel.com

Thanks for the review, Sakari.
Due to project duties, I am running late in updating the changes.
Let me update an updated version for this.

-----Original Message-----
From: Sakari Ailus <sakari.ailus@linux.intel.com>=20
Sent: Monday, January 8, 2024 4:36 PM
To: Chen, Jason Z <jason.z.chen@intel.com>
Cc: linux-media@vger.kernel.org; Yeh, Andy <andy.yeh@intel.com>; Zhang, Qin=
gwu <qingwu.zhang@intel.com>; bingbu.cao@linux.intel.com
Subject: Re: [PATCH v1] media: ov08x40: Avoid sensor probing in D0 state

Hi Jason,

On Fri, Jan 05, 2024 at 06:20:08PM +0800, Chen, Jason Z wrote:
> From: Jason Chen <jason.z.chen@intel.com>
>=20
> When the system enters the D0 state and attempt to probe the device,=20
> another component, such as LED, will also be pulled high due to the=20
> hardware design. It's advisable to keep the device being probed in a=20
> different D state.
>=20
> Signed-off-by: Jason Chen <jason.z.chen@intel.com>
> ---
>  drivers/media/i2c/ov08x40.c | 18 ++++++++++++------
>  1 file changed, 12 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/media/i2c/ov08x40.c b/drivers/media/i2c/ov08x40.c=20
> index 8f24be08c7b..f46cf0eb6c1 100644
> --- a/drivers/media/i2c/ov08x40.c
> +++ b/drivers/media/i2c/ov08x40.c
> @@ -3226,6 +3226,7 @@ static int ov08x40_probe(struct i2c_client=20
> *client)  {
>  	struct ov08x40 *ov08x;
>  	int ret;
> +	bool full_power;
> =20
>  	/* Check HW config */
>  	ret =3D ov08x40_check_hwcfg(&client->dev);
> @@ -3241,11 +3242,14 @@ static int ov08x40_probe(struct i2c_client *clien=
t)
>  	/* Initialize subdev */
>  	v4l2_i2c_subdev_init(&ov08x->sd, client, &ov08x40_subdev_ops);
> =20
> -	/* Check module identity */
> -	ret =3D ov08x40_identify_module(ov08x);
> -	if (ret) {
> -		dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> -		return ret;
> +	full_power =3D acpi_dev_state_d0(&client->dev);
> +	if (full_power) {
> +		/* Check module identity */
> +		ret =3D ov08x40_identify_module(ov08x);

This way the sensor identification will be missed if the device wasn't powe=
red on im probe. See e.g. commit d1d2ed5925c370ac09fa6efd39f5f569f562e5b7
for an example.

> +		if (ret) {
> +			dev_err(&client->dev, "failed to find sensor: %d\n", ret);
> +			return ret;
> +		}
>  	}
> =20
>  	/* Set default mode to max resolution */ @@ -3277,7 +3281,8 @@=20
> static int ov08x40_probe(struct i2c_client *client)
>  	 * Device is already turned on by i2c-core with ACPI domain PM.
>  	 * Enable runtime PM and turn off the device.
>  	 */

Please remove this comment, too.

> -	pm_runtime_set_active(&client->dev);
> +	if (full_power)
> +		pm_runtime_set_active(&client->dev);
>  	pm_runtime_enable(&client->dev);
>  	pm_runtime_idle(&client->dev);
> =20
> @@ -3321,6 +3326,7 @@ static struct i2c_driver ov08x40_i2c_driver =3D {
>  	},
>  	.probe =3D ov08x40_probe,
>  	.remove =3D ov08x40_remove,
> +	.flags =3D I2C_DRV_ACPI_WAIVE_D0_PROBE,
>  };
> =20
>  module_i2c_driver(ov08x40_i2c_driver);

--
Regards,

Sakari Ailus

