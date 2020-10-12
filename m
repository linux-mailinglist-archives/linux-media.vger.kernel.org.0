Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FA5C28AB7D
	for <lists+linux-media@lfdr.de>; Mon, 12 Oct 2020 03:44:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgJLBou (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 11 Oct 2020 21:44:50 -0400
Received: from mga18.intel.com ([134.134.136.126]:51959 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726430AbgJLBou (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 11 Oct 2020 21:44:50 -0400
IronPort-SDR: bG3WvQKWc+xuqMJy36BJMl+8FQLzjy5UigKb5y1hzYaLJPL0kIMer0YfuNZcqpO+ZcQD4J9sr0
 NTZ1Fq4DD30Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9771"; a="153509020"
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="153509020"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2020 18:44:46 -0700
IronPort-SDR: 3cSwBDD8ed4nmwjV48isC26g0Sk7+JoEbEO7r8ufenSliiq7cXyAsMeNQJJ/1i9es9jRScqKnd
 H0DtKAAO26lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,365,1596524400"; 
   d="scan'208";a="345678185"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by orsmga008.jf.intel.com with ESMTP; 11 Oct 2020 18:44:46 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Sun, 11 Oct 2020 18:44:45 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Sun, 11 Oct 2020 18:44:45 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.175)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Sun, 11 Oct 2020 18:44:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gy8iwACMw5ztSDScSVAAeicrGm6dg3qcvmUc1zeahobUugpCSCItOB2E0bslOYMCf2MAND7zEKEvrp6RSSnlGmAseEkUQ20cg13+RzoeVsMbSMsWwJ1Spte6VUlzYqj81LVcPMFW4afVX5o4vpaeB+R8O/vs9DqJbO50Vc/CBiaW1OEM9muq2xL4YdTdnLbNjDD+yBTcsmUfW4P7QT01QvyZWoB3YFeFlUtV6ARA11tn1tlcCcE2GAI1mnk5NQ9oxRd94+Jm2UqZu03moRNgWOTz+0pcKfYCYe1NIb+v4UQvO4l5QND01irPFokjr1SmF/QbQDBeGrmPk8DDxplXUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ2+gpOkindBq7M/NORXBrc3MvlfLMvAH6A7D6bR0pM=;
 b=Fbe55K8CVA+YJCefUJqUAegMZeGtMsYq0D13yA6HQjWNuDvMV+qaS/CscCbnWlzkF2+/A5r/E+2Tc1OzxGGTuDfb5TlCS+Edgj04ZTOHfJ10+jBn7N+EAUeMzy5Tq5HRXnuSUHTupky02kr+pjuVzdfNqLfjqVx+WdxF5Ks4rxTJ9nxrlCPFFGxw6YX7SExIOiphFJ/8Wzq38sdEArM3mx2F71nJWcnsH5ZKQoGAnmzG7LeI5b4gv3kBffHE1+C9O9dKupSHjH7ppCsP0leHvpV1xNJLXhbCUBKykWJUgbRn8M6pGjnDoBh8KfgsvaCLbxWyo5T/DAK76ihlr60lnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GQ2+gpOkindBq7M/NORXBrc3MvlfLMvAH6A7D6bR0pM=;
 b=O5Imv15hWMNEe2kN7WTGxkr5jtiF9DcQb8Tm7RqPZN8Y6xpWoeF7hQIaMB1h06MDCCkQHYQSOtiXH5Rh8FSUmPsQD233CcpPkZpOR20I347RdmXMUHyf1rBfVj090VFbo99BTchX/zdtBI1uzkdky5hMrE62Pi6bxdlOjy0iEgo=
Received: from DM6PR11MB3995.namprd11.prod.outlook.com (2603:10b6:5:6::12) by
 DM5PR1101MB2105.namprd11.prod.outlook.com (2603:10b6:4:51::23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3455.24; Mon, 12 Oct 2020 01:44:44 +0000
Received: from DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21]) by DM6PR11MB3995.namprd11.prod.outlook.com
 ([fe80::28b7:f26f:9894:1a21%3]) with mapi id 15.20.3455.029; Mon, 12 Oct 2020
 01:44:44 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
CC:     Tsuchiya Yuto <kitakar@gmail.com>,
        "Zhi, Yong" <yong.zhi@intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>
Subject: RE: [PATCH 5/5] ipu3-cio2: Make the field on subdev format
 V4L2_FIELD_NONE
Thread-Topic: [PATCH 5/5] ipu3-cio2: Make the field on subdev format
 V4L2_FIELD_NONE
Thread-Index: AQHWnk4GTi5DE4HAGEKzAfTOpcHQ3KmTM0HA
Date:   Mon, 12 Oct 2020 01:44:44 +0000
Message-ID: <DM6PR11MB39953C27ED140C7A2C15C10C99070@DM6PR11MB3995.namprd11.prod.outlook.com>
References: <20201009150756.3397-1-sakari.ailus@linux.intel.com>
 <20201009150756.3397-6-sakari.ailus@linux.intel.com>
In-Reply-To: <20201009150756.3397-6-sakari.ailus@linux.intel.com>
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
x-ms-office365-filtering-correlation-id: d930c7a2-cec4-4a96-f1c7-08d86e506511
x-ms-traffictypediagnostic: DM5PR1101MB2105:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR1101MB210578894D2FDBD82A8411D599070@DM5PR1101MB2105.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6108;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MK2MIp90NaBJJV7U6cLVtrDwS6FlrX6kGPgIFIP9Z3yOBIUc4JoqjtuLZJRTOmwPkxL4lkmsKonkZAwpDuCrjHgkqj4OshaDODkqXmok5N4JNKEXPLOXxmeZErL9Usff6mRmF3ETww8iJLQWoqOGRy1PI2dIHezRVA47OR/ZRqV9Oc9dKLfS4I1vaaQz0CCYt4zB/vDZNWCpcV5JFueWGx9jxL6167JH+IcsYxGU3f4Jqz0YAVzCPfiW47AnjxCOKvfoaFNesVqUdb1nBvwmxewx7ZMKjaLHoiATjMFekBeiCIuqaPbylLPTxoaVP0cXf2QQPgrKSlTyDw6RPhhj2w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3995.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(396003)(366004)(39860400002)(376002)(346002)(136003)(66446008)(66946007)(66556008)(8936002)(64756008)(66476007)(86362001)(33656002)(9686003)(76116006)(8676002)(52536014)(71200400001)(83380400001)(316002)(110136005)(26005)(478600001)(55016002)(53546011)(7696005)(6506007)(186003)(2906002)(5660300002)(4326008)(54906003);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 0v+75hBB1zMarEZnWTKTHC8BF7rQuhFmIDgGewV+Pex6ZuYFfwFcqy4VJ1EDPuUaUbpTLzURWVKb2V+9etaS/rHECrNGkTLJzSebv65Nk+6CJFd3bQ+onp5suqacJbosutbO9fHLXrxPBISz5BOW9xgLd/FGiYijXAznwOJsLf0kv3mrdq5m4OBKEBt7DYlNMXl5XzAgJS6S2Fe2kSCy5AkrEY2rESXptGqQ8aG3D/2Swl/pWI38lajGGRTHucK7G3TECA5R94PF1mrpzqdNRXUZux63gXSaAacfWeF1RX/JW57nT1/a+S2d2s9OiA4fGIuywK0Wi89oLSbLEj73qbfL+0ZVY+uHT+43DUfX7pZ+HKn7n3P8BM3sLH95vfdXWKjyt5UyNCsO/3NIQCtIKKdzQLxHWDGapf6oAavHtfQ1N9PNAlmWaFY0T4QNqFO9HCHudTspHBLLmnXhg2eiB4sMfXTaqd1i0ISKufqcESZt49qrrAkMr0u0Ss/MaRECme5o+Xsi4FS+bk4txWwbuwwkAvIsyEqeC4zpNDzh16ts+KpvOvbe7Eu3kPeNetYZdaUl6ws1NJwmkK2Du5VNSKj5pa/dLTEMswj0pQV3NE7rgnnbgeNHlWaZzEw23YL7MSf+Fjfm0eH8fhZMCRb/ZA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3995.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d930c7a2-cec4-4a96-f1c7-08d86e506511
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2020 01:44:44.4169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ogOSZ9EBr0XnvTuToF0D1jFYN3BLwiqt1FNU+C1qbMVx9Ml+FLzU2B7EIlBeTl28uPQAD6RdEgQRDqfKN3TWGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1101MB2105
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

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
> Subject: [PATCH 5/5] ipu3-cio2: Make the field on subdev format
> V4L2_FIELD_NONE
>=20
> The ipu3-cio2 doesn't make use of the field and this is reflected in V4L2
> buffers as well as the try format. Do this in active format, too.
>=20
> Fixes: c2a6a07afe4a ("media: intel-ipu3: cio2: add new MIPI-CSI2 driver")
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> index 9726091c9985..a821c40627f9 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2.c
> @@ -1284,6 +1284,7 @@ static int cio2_subdev_set_fmt(struct v4l2_subdev *=
sd,
>=20
>  	fmt->format.width =3D min(fmt->format.width, CIO2_IMAGE_MAX_WIDTH);
>  	fmt->format.height =3D min(fmt->format.height, CIO2_IMAGE_MAX_LENGTH);
> +	fmt->format.field =3D V4L2_FIELD_NONE;
>=20
>  	mutex_lock(&q->subdev_lock);
>  	*mbus =3D fmt->format;
> --
> 2.27.0

