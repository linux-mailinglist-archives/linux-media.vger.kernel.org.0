Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B21E28AB6D
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 03:34:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726472AbgJLBeO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Oct 2020 21:34:14 -0400
Received: from mga01.intel.com ([192.55.52.88]:8769 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725967AbgJLBeO (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Oct 2020 21:34:14 -0400
IronPort-SDR: VDd0Tuu3jOlz3hr41EnONULJ4i19uv5uvkihPyiu8qEhYDpnN/86qSkDyTonkBWsr4cxOSCSXd
 E3A+2NeLzkww==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="183132101"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="183132101"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 18:34:11 -0700
IronPort-SDR: z+zboLmjERnrj4MSlQFxhUfqoskQfWLXkOJ9NJ9OEHJD8tSYzRjTi5qfFeGV59dgW0BoINPef5
 29usEVHnljIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="313283897"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by orsmga003.jf.intel.com with ESMTP; 11 Oct 2020 18:34:10 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 11 Oct 2020 18:34:10 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 11 Oct 2020 18:34:10 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (104.47.74.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 11 Oct 2020 18:34:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MWS/7MF9wZemlMC7q4i5blYR8+/2kz4EBMgFXAtuxT7J8fFd/iHAAhDDqQpqR6pjnR50wGIPKlqiQnHozvBYLU1yf4fF0za/JL1XfihBkvtOjvbGWwOPoSs3sH9xZWWvcAgK8f3g4yLeKOUlqsT7ylQiaEid3NuIgtHBlDwgJnxQFRe8qtk6ApmX6ZSwDnhBna9Qy0edhSlOsnve+xB69g8UAWRsHz63m6lQLFCYRLR+a6NKupk9hTgfypWAhjPBsuUGD6ITXFpD0FaMc4h1bRAq7XKaw8IpEpvjZFdwClko0JVkDXnTDr6B8oo51LjmrH/A52JFBgMNcvYO8Zvl1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X6xNI+p7UqKM/XbgtlaRUe5GDD9GNm0Yea5MZe0YhQ=;
 b=lrBmUu8sOfqKc4N7gRd7JQCHPVYAVnTl0iPInhiRWNobn+SM+hsR/iITNkuARSoqlYu6owSeypsPY/DkQSu/tZgBpYRZsVVtwmWt6SU1lCHpxcP3yxLzf+ZdiOYpMqS3Uqb5uu/ty1Pr3aab/yI9DbkptRAHEZ87mgA8lhsCwrHxO/r3267AHoEx6bdH35Lo8LIS2heHjJuHbVcIl2Vup4SDD99Bq+TPmKzT7srADXvCXolcx9+gMK8WFFhc1aDShO+lHsgPN4gUCjb0sdqL4dZy1yRqdssSQMn0QSbYapbm4M/qX1gVYJ00IlCWNMZ1gaZingdsyDc/JFr1hsgVgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7X6xNI+p7UqKM/XbgtlaRUe5GDD9GNm0Yea5MZe0YhQ=;
 b=S2qzd5itHzm/iAmVGKwehLFCsv1F3B2blx8rPxjsxuhEF4ddGKZxGLOrDlHacwCJVVfw3Ex54VxeinRvBRpOMD7WHH8Yfc5saD6dpXfRoa6urBGq6cXLmCehPrviovijM+IOdFfxvIU8nocMQieklnNU9MFF+sYFcHGdlaMVpH4=
Received: from DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) by
 DM6PR11MB4153.namprd11.prod.outlook.com (2603:10b6:5:19f::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.28; Mon, 12 Oct 2020 01:34:06 +0000
Received: from DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21]) by DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21%3]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 01:34:06 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Tsuchiya Yuto <kitakar@gmail.com>,
        "Zhi, Yong" <yong.zhi@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 2/5] ipu3-cio2: Serialise access to pad format
Thread-Topic: [PATCH 2/5] ipu3-cio2: Serialise access to pad format
Thread-Index: AQHWnk4D/jQT6FQXQkOPt6K/RAGJgKmTMmMA
Date:   Mon, 12 Oct 2020 01:34:06 +0000
Message-ID: <DM6PR11MB3995BED477B95DCF0C537D1D99070@DM6PR11MB3995.namprd11.prod.outlook.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-3-sakari.ailus@linux.intel.com>
In-Reply-To: <20201009150756.3397-3-sakari.ailus@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: fb599ade-ed3d-4630-d1de-08d86e4ee8d9
x-ms-traffictypediagnostic: DM6PR11MB4153:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR11MB415317B5CC50032C18F6F8CD99070@DM6PR11MB4153.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2803;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: g28q18zCVMP7UX4GugW8a6vU/QllIyS7XCdLZW/IVldz6KegzjwuLuMGOec9WOT4DCmvUKJW4aV/3GCBtndp7esWxjzNS++QJ5yZesVrtm7yBlN2ZW2zKCgj8vqfa0ctrJNMI5EuquO+Sqv3e6TulJJoDjer3cScqMDCQOxwgcPttiuVhnP2M4/Av4U6l9ggMB0e31CRQ+zM5o6aiGZZ2pxLw9qJKI74pEEoVuyaUFVthpJ9VjY/R4ULVnBxfMP4f7MsfZN9KXlo/jDq860K/3sqZTe15fKGY7SavDQymtFToOGtn59FnKW80W77STPbrC/P3VtIdxUYRE/yDxWUwg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(396003)(346002)(39860400002)(376002)(186003)(9686003)(5660300002)(8676002)(26005)(66476007)(110136005)(66556008)(66446008)(66946007)(54906003)(83380400001)(71200400001)(64756008)(33656002)(76116006)(478600001)(4326008)(7696005)(316002)(55016002)(8936002)(52536014)(53546011)(6506007)(86362001)(2906002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: zmDyHQXvsNZ0BCbHP82+QxKC7xPx9KfDL1pywCs1BENgbdYObrap3BazXWkaDEhCJ6UNP1/53LyA+pMrMYlu223AUY7h8iUNGOgUkB2iZJR6QFSlAO4KZNHoidYUDa1RSSKN5HK18MJ+cq9ooJK7DpxyUB7IRk8K2FY7Ajpo0LYVDvrmqL2BjrSvexQ/gbz/0mvaMMOt2Oa0DrSeNd9tWz+/s7XGBMz1uKcdjWU9fXZSY2oTsKva9P3a6/v0nxGKZlcAcRWZ+2bdcNNkfe9na+sBD9NEn2iASenuETdqIqJbbpTLLIiFLUybJrwpuXjw/xxWYB58JtfW2uThnm+Cn6aWFKuym/KWfkCBXsSd3zNt57j897MtO9HZDdUxcpv+OsCVwxB9a7p89FiJVSLt1RsDh929p+CJWgyw31iw4ixRP3+EF9cBVTu9KPN1dlJ1bQwZIgdoTHZQjWZNKqWUEyd0x7QMVZS1eSgvAaWZfUSrCxq1TlZ2JxM/BnO7xTiTxAvbOwD6AVZXWA+gAb3dWbJCJ7rCuFXYo2osat50sAXkZX89SWuUtMC6Kagux1WnbczPwV4PRgwPXdmz8pgqNLjXdQJrsUorD2bMiiSySEjEBQtBTgNSl7jkG/C5D7yxXF4PHwOFhhPPhg6rJ7edwg==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb599ade-ed3d-4630-d1de-08d86e4ee8d9
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 01:34:06.5529
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xg3fa4u9EqndRS9n5tPDZ9YN7ZoIN1ofFehfQ2FGwFk70XKTw55cdrT2d5ERetyfV7ngW82RQ7kUfHtKMD+ukA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4153
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari, thank you for the patch.

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

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
> Subject: [PATCH 2/5] ipu3-cio2: Serialise access to pad format
>=20
> Pad format can be accessed from user space. Serialise access to it.
>=20
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 11 +++++++++++
> drivers/media/pci/intel/ipu3/ipu3-cio2.h |  1 +
>  2 files changed, 12 insertions(+)
>=20
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index afa472026ba4..9c7b527a8800 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1233,11 +1233,15 @@ static int cio2_subdev_get_fmt(struct v4l2_subdev
> *sd,  {
>  	struct cio2_queue *q =3D container_of(sd, struct cio2_queue, subdev);
>=20
> +	mutex_lock(&q->subdev_lock);
> +
>  	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY)
>  		fmt->format =3D *v4l2_subdev_get_try_format(sd, cfg, fmt->pad);
>  	else
>  		fmt->format =3D q->subdev_fmt;
>=20
> +	mutex_unlock(&q->subdev_lock);
> +
>  	return 0;
>  }
>=20
> @@ -1261,6 +1265,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *=
sd,
>  	if (fmt->pad =3D=3D CIO2_PAD_SOURCE)
>  		return cio2_subdev_get_fmt(sd, cfg, fmt);
>=20
> +	mutex_lock(&q->subdev_lock);
> +
>  	if (fmt->which =3D=3D V4L2_SUBDEV_FORMAT_TRY) {
>  		*v4l2_subdev_get_try_format(sd, cfg, fmt->pad) =3D fmt->format;
>  	} else {
> @@ -1271,6 +1277,8 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *=
sd,
>  		fmt->format =3D q->subdev_fmt;
>  	}
>=20
> +	mutex_unlock(&q->subdev_lock);
> +
>  	return 0;
>  }
>=20
> @@ -1529,6 +1537,7 @@ static int cio2_queue_init(struct cio2_device *cio2=
,
> struct cio2_queue *q)
>=20
>  	/* Initialize miscellaneous variables */
>  	mutex_init(&q->lock);
> +	mutex_init(&q->subdev_lock);
>=20
>  	/* Initialize formats to default values */
>  	fmt =3D &q->subdev_fmt;
> @@ -1646,6 +1655,7 @@ static int cio2_queue_init(struct cio2_device *cio2=
,
> struct cio2_queue *q)
>  	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
>  fail_fbpt:
>  	mutex_destroy(&q->lock);
> +	mutex_destroy(&q->subdev_lock);
>=20
>  	return r;
>  }
> @@ -1658,6 +1668,7 @@ static void cio2_queue_exit(struct cio2_device *cio=
2,
> struct cio2_queue *q)
>  	media_entity_cleanup(&q->subdev.entity);
>  	cio2_fbpt_exit(q, &cio2->pci_dev->dev);
>  	mutex_destroy(&q->lock);
> +	mutex_destroy(&q->subdev_lock);
>  }
>=20
>  static int cio2_queues_init(struct cio2_device *cio2) diff --git
> a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> index 549b08f88f0c..146492383aa5 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.h
> @@ -335,6 +335,7 @@ struct cio2_queue {
>=20
>  	/* Subdev, /dev/v4l-subdevX */
>  	struct v4l2_subdev subdev;
> +	struct mutex subdev_lock; /* Serialise acces to subdev_fmt field */
>  	struct media_pad subdev_pads[CIO2_PADS];
>  	struct v4l2_mbus_framefmt subdev_fmt;
>  	atomic_t frame_sequence;
> --
> 2.27.0

