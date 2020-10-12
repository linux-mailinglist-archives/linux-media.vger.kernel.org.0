Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BD0E28AB87
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 03:50:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727626AbgJLBuO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Oct 2020 21:50:14 -0400
Received: from mga06.intel.com ([134.134.136.31]:8236 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbgJLBuN (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Oct 2020 21:50:13 -0400
IronPort-SDR: OT1J+6bHOYdNZUpkKVE8CiF+QpFvw5/QjzVYyBvoFF+a4d+My9h3sdvmbAqc1X+/CNuHu+QTcS
 t2X5x3W5+F8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="227324930"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="227324930"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 18:50:09 -0700
IronPort-SDR: helCqSey1NHWpKXQHVL9I1isUNfD/48vKS8lA7ZrUW6hc8VMoTsNiFtFM8jbqbbCx+RbrwhbXt
 Qa3/J7vMPd9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="299135573"
Received: from fmsmsx604.amr.corp.intel.com ([10.18.126.84])
  by fmsmga008.fm.intel.com with ESMTP; 11 Oct 2020 18:50:09 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx604.amr.corp.intel.com (10.18.126.84) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 11 Oct 2020 18:50:09 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 11 Oct 2020 18:50:09 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.104)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 11 Oct 2020 18:50:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Fjf6Y8r2+PS3C4ciNSGWbBvjq+Fp1Ef8Dm1S82ZTX7ugudk0sUzVqy4wSAC1Yn8dUPkish/hFSlVitd7UNTauNi+yorAg5ojp+tN3MdisCVdL4iLDmMDl13pLjChDaFOXnkv89uhswO53elT+ePQjDPIk2bibZ4P15zAmgXqogfbwFtLFwfY6uSbAEYa9+1QTFZ/TdhhOHSqqeQ83SXu6HGqTAN0qm+khvSvkslxh0yCWqPoX2GchlGmYI5U6iJkQQl52kM4c/H/MqzqI51XKKenXm9WIXEEjRX6Gj1Z4hSBAz4rsGzEN6WI4cSX7cP9qMScCXCCDXREDmXZcu4G2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrjajczaTQ3bvDkuu66ue3Jgoz7XFQxoGQ2OIopNxbs=;
 b=Ek25tzXQmFQu3K2uKYQ+j05HGdYKW1n9vhM1mKytarYSSTV8iWTnjBBaWlnGkdQ3LqbANwVBm7KK1XUaSf4Z67maHhv8A+SpbnlMKQDupYuM0U8B+tH8phqNu8wIgPhkpPyTirpKdVGceAD3dxdL4jF1RYsmPyP/ot3hubaD2eAUTP5f51KdsnqRwxQlPZnc1fFefnZGsJdHZ2NI6f+/dw5OxetfJW3+WlW3de3UogT5/Yac78X7K5fntAbaB+XjYk2jmWAmNdfp3yzv/r0rS5O/DNTODf4HjEMRbe8Vhra9OM4OnWu2MaEGYAqlZXdJJE9xJPD/iIih1yreXhao4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GrjajczaTQ3bvDkuu66ue3Jgoz7XFQxoGQ2OIopNxbs=;
 b=HaPlkY6VPYCwABX5mq2EQJaRytOgl77r8ZNYsmMCDRLBZvlg5Q+ngBCGvCoO60yEGm2f/z5lgeTTCPKxP4mbalFRlcnPDcaOL9VPtod4Q3jBCElUP60woW+xx4OInj3hW9KoeyIZqhAep/SWOUBA62QThw8URSEVCcxMsIVggPM=
Received: from DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) by
 DM6PR11MB4201.namprd11.prod.outlook.com (2603:10b6:5:200::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.24; Mon, 12 Oct 2020 01:50:03 +0000
Received: from DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21]) by DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21%3]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 01:50:03 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Tsuchiya Yuto <kitakar@gmail.com>,
        "Zhi, Yong" <yong.zhi@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 1/5] ipu3-cio2: Return actual subdev format
Thread-Topic: [PATCH 1/5] ipu3-cio2: Return actual subdev format
Thread-Index: AQHWnk4EICrUn2zogEyTvH9/KzfikKmTNi/g
Date:   Mon, 12 Oct 2020 01:50:03 +0000
Message-ID: <DM6PR11MB3995F16A01902354A7C098AA99070@DM6PR11MB3995.namprd11.prod.outlook.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-2-sakari.ailus@linux.intel.com>
In-Reply-To: <20201009150756.3397-2-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.204]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 379e5ecc-fa00-4c13-9110-08d86e5122f4
x-ms-traffictypediagnostic: DM6PR11MB4201:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB4201AC320283AF31A05B8CE899070@DM6PR11MB4201.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: c5YMv7hKB27HyKn4/9voPbcwFclJo+29WVJzTZE2AYG6+p08XDb+aBBHxZOFUaMC+T1wUaByeQL/iV80F0n7FH7mUIYHw1FhJoJU5GYqYqWdPXg1/hGM1NH5b8XTU/eJpw4kuWdrpdLmnZwUZZfVIN8mrLJha4TOBWAAIJi2ztfnMM36m0kRYeL5Z6pSJeSg3jAsQX1EWGpaVAPkU9yZr9hotB8pndddjvLj8e30Bt/RcLBg0Uh7EiKkSmoHFGY2+lRLGhf3D0JafeDpEcF8rTKzU0BvIaHm5r8AWuqYlA+g4LgiOMUtG0p805p6qYyC
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(136003)(366004)(396003)(346002)(39860400002)(376002)(8936002)(71200400001)(33656002)(5660300002)(478600001)(6506007)(86362001)(9686003)(4326008)(8676002)(66946007)(66556008)(76116006)(64756008)(66446008)(7696005)(53546011)(316002)(52536014)(186003)(110136005)(54906003)(26005)(2906002)(66476007)(83380400001)(55016002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: UHUJrZlQAXa11/+lIKoepaaLPkzRWV8L7mHcAtQDq2qnozHHukw5py5a/QHD5N4ExdsfGfpSt9K2WkDPq2blMO6Ad8VUjEN1hReoqrzpMzOOfAstX2SzIIANA/2BiMD9VUVcHCZjVdyL9a+7OB8Wt5QSp6hlAJ7rghRS3PF3gFC6xGy6EtHpPx/EWpYdh56AwyThl6Ot7VriLxxD/+3aS+ATbKnvKeA8d0FE1l0q2eP4vK7FPka2rfXrppsqOWQ4UEgLCRMoyNKOSHNwB62GC21JDI00ThlJJzidZNulXKh+B+iADMZZv80VjmxI3pCra7gXrLzdlFv6dvv4IcCZzoRjooXNdP6D0lfIP8Y3OZnvRTKEDSyEL1gNTlR+W0jru5fd8DYF9+6HQDZTd1+jxPGqfjGk535ATjoYZeXCAXo3rpIkL+dTJAqET1P0NpD90SldqiDwepfpSCXiOblK4NoSjzpxqiGZAdooZNt1oP9E3FOQV2wu3ooNS/h5Bb8YPJ6LZksX4ntDRcG7oq53nbpvRBa7Rizige/9ex22kkv+HPVR5xwdkpYme/QMh9MxVAiGrRqrRQ8IdXYyumVKJVeTgLczGEZ13DDiXqcKZKMCXJhlk+RUyLTdgtCNsfVsd5OWTaIWBcyCJwjXcbj7ww==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 379e5ecc-fa00-4c13-9110-08d86e5122f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 01:50:03.0195
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MJiEZJXUf4D2oU5OSahS+zmyG6vVfn2Ra59/UYmykGhaXz7XHEZeHWfnRsB1NIDy0ZBCXxyhYjuDxwUiMqHd5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4201
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, thanks for your patch.

Reviewed-by: Bingbu Cao <Bingbu.cao@intel.com>

________________________
BRs, =20
Bingbu Cao                         =20


> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Friday, October 9, 2020 11:08 PM
> To: linux-media@vger.kernel.org
> Cc: Tsuchiya Yuto <kitakar@gmail.com>; Cao, Bingbu <bingbu.cao@intel.com>=
;
> Zhi, Yong <yong.zhi@intel.com>; Qiu, Tian Shu <tian.shu.qiu@intel.com>;
> laurent.pinchart@ideasonboard.com
> Subject: [PATCH 1/5] ipu3-cio2: Return actual subdev format
>=20
> Return actual subdev format on ipu3-cio2 subdev pads. The earlier
> implementation was based on an infinite recursion that exhausted the stac=
k.
>=20
> Reported-by: Tsuchiya Yuto <kitakar@gmail.com>
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 24 +++---------------------
>  1 file changed, 3 insertions(+), 21 deletions(-)
>=20
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 4e598e937dfe..afa472026ba4 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1232,29 +1232,11 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev
> *sd,
>  			       struct v4l2_subdev_format *fmt)  {
>  	struct cio2_queue *q =3D container_of(sd, struct cio2_queue, subdev);
> -	struct v4l2_subdev_format format;
> -	int ret;
>=20
> -	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
> +	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>  		fmt->format =3D *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
> -		return 0;
> -	}
> -
> -	if (fmt->pad =3D=3D CIO2_PAD_SINK) {
> -		format.which =3D V4L2_SUBDEV_FORMAT_ACTIVE;
> -		ret =3D v4l2_subdev_call(sd, pad, get_fmt, NULL,
> -				       &format);
> -
> -		if (ret)
> -			return ret;
> -		/* update colorspace etc */
> -		q->subdev_fmt.colorspace =3D format.format.colorspace;
> -		q->subdev_fmt.ycbcr_enc =3D format.format.ycbcr_enc;
> -		q->subdev_fmt.quantization =3D format.format.quantization;
> -		q->subdev_fmt.xfer_func =3D format.format.xfer_func;
> -	}
> -
> -	fmt->format =3D q->subdev_fmt;
> +	else
> +		fmt->format =3D q->subdev_fmt;
>=20
>  	return 0;
>  }
> --
> 2.27.0

