Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DD5A2765F2
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 03:40:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726316AbgIXBkT (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 21:40:19 -0400
Received: from mga02.intel.com ([134.134.136.20]:55506 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725208AbgIXBkS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 21:40:18 -0400
IronPort-SDR: l8RV+1IJDGkhN+GgVRbOKzcvCjXLkuoQ6+Xe06zTjbCLvMh275EY42DpR2vZtVzTirCCC3YWn1
 +VEiyJ4zEa2A==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="148728894"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="148728894"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 18:40:31 -0700
IronPort-SDR: JNsHqqTQhwzKWus4gVwJ/VeaNmVFi/fQ7mz+g6Xr66vdnM+0WlkxVVfzQNzWieMZgEQBPneIsK
 TSl/fqq9ksbA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="511294863"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2020 18:40:30 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 18:40:29 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Sep 2020 18:40:29 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.103)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 23 Sep 2020 18:40:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L2hSwyh3pbHIlNolTr46XIO7Z3InLQI4WyVvtIfIRs/JfPopQ6dKpfJiDHheO5gwVPgOzWkYWTcH6JKsfZnXERjKXm6N8vNuUkU8k+72eXGAAkhfYBUqGH/Zauk3XSfOUY4TB2+T8MtPB1b4SI5831oOwcHcSMSQ+8Y+qrblSNO4xmy11oovmb8QE4lcdw+Z/81JCox30ZHaq9/f3KmchSWgcvc09/h/Xlv3ES+MurftoGUMBQNVnZAHnxh8sVmH6KvmUhWCjvB7lLBSmN6xoLmMifi7REnLHRUCTrJJ2FnRpkGy/1BHP20XrzgjMA6gsNuOY0XYiUarG/oYkUqECw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2Z5JM5R61OZ9PV3Oe6BQ9Rz0KbKq3+B2jarm7O0XlQ=;
 b=Qv/YPmZFjTsrpg0IYVA+P1PILbnX8sDC8aN1oKXqSsErXsr2P2N02orlPN4mF1lTIIzr8ftvdTcoZdtO/fDGbBba+bAOhQJdDhkSZvoA/w5mniFW/FxpiwqtWC/TuXXBT0GE7nNvRd2rXEkLup0qnJ8kaUN3lE58H6HyHnkXpiXo+tcbEGRsK1sBBL8MzlfUI0AIwu/WrOMxG8afMuOCv0zSxvZlaHg9WeZs7JifnrLmAzXhGIX03LInggO36HfSYy6a/H0qhfLrK/o/Tdh+ZgNYKTZ8EfgPWje/0QGCSIo2K+CX8b7CKRJN0T7JZ9tzw7q1hcsAOg7EaiwHOlo/ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h2Z5JM5R61OZ9PV3Oe6BQ9Rz0KbKq3+B2jarm7O0XlQ=;
 b=kTEYllHDkBZ5Ptkx3OVEMlu0UZWJbHo7aijektyjcrn7SsOjlMJL5J2ppzo376aT/Fh6GPRTh6VmfltRewEEvX96ZEQTcUK1c9jKk/puzb6Xcr2uqfU1SI1U6jOPHr9qe9k8UBe254YL0adt/yjCzhjMdc+/kp/VEKkfzIn5jM0=
Received: from BN6PR11MB3876.namprd11.prod.outlook.com (2603:10b6:405:77::17)
 by BN6PR11MB3875.namprd11.prod.outlook.com (2603:10b6:405:80::37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.23; Thu, 24 Sep
 2020 01:40:25 +0000
Received: from BN6PR11MB3876.namprd11.prod.outlook.com
 ([fe80::395c:4d38:9d0d:ad8a]) by BN6PR11MB3876.namprd11.prod.outlook.com
 ([fe80::395c:4d38:9d0d:ad8a%5]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 01:40:25 +0000
From:   "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
To:     Dave Hansen <dave.hansen@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "Tu, ShawnX" <shawnx.tu@intel.com>,
        "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: RE: [PATCH] media: fix Omnivision Intel MAINTAINERS entry
Thread-Topic: [PATCH] media: fix Omnivision Intel MAINTAINERS entry
Thread-Index: AQHWkeH6JEYp+HrfkkCTrSLIKi5XYKl3Axhw
Date:   Thu, 24 Sep 2020 01:40:25 +0000
Message-ID: <BN6PR11MB3876ED2991F0E9F874B46B14DE390@BN6PR11MB3876.namprd11.prod.outlook.com>
References: <20200923193356.188D717D@viggo.jf.intel.com>
In-Reply-To: <20200923193356.188D717D@viggo.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiOTgzMjY0YjQtNGI3ZC00YzU2LTllOTUtZGY2YzJhYmVhN2VlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiZjlhN0J1aTh4K0JKNXpCaDBlSXlBanNCSHRzY2RvbkhxNFlReGNvaUxEd3g0VzJnQ0M4TVQ0akV3MEUyQkw2ZiJ9
dlp-version: 11.5.1.3
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
dlp-reaction: no-action
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.209]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 294b9582-2001-4ca9-b4ad-08d8602acf60
x-ms-traffictypediagnostic: BN6PR11MB3875:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN6PR11MB38758E5C2DA235E8FE40B69FDE390@BN6PR11MB3875.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1060;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: BM7V19VIdhaBTJ2ghaFYkwtke8QrWQs3eFh4toerBUOAceIJ0EGUu0UH/+1Z8LhxpREB95GhSLfKGfAfiGY8WB5SlF4wQbB7mtte91Kkx/bYPdAqBNB76tfciI8aAiM6USExQs8pJLU4XFlxAhx7DIkpDUEgq0sgh0mXWCITQQI5qwVSPUdRjntsajNbtCB8iBjOmE5AwGlrgfkk/m23MUldwjNZtrjzOdJsdn7zVCwIfwdJRqWVx4JXH/0sskjTWvA3eAsqMUEr8Ln+NLKE+XK8jPWILfZhgtHTIZvYaWLfkU8UK0mKXVYjCix87cj8I13/EGjrfmUQ4nEPmykjxf8RS8ajw+14q0OXCnP/gtGeW6GBu4RmMjjyClhAqY95
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN6PR11MB3876.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(346002)(396003)(136003)(366004)(376002)(39860400002)(55016002)(9686003)(54906003)(186003)(33656002)(6506007)(7696005)(53546011)(110136005)(76116006)(26005)(66476007)(64756008)(66446008)(2906002)(66946007)(316002)(66556008)(71200400001)(8676002)(83380400001)(5660300002)(52536014)(8936002)(478600001)(86362001)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: kpPrYAwXgoimAxwM9413TJr/UfnTxYXQ0w6x/5zRUvrvOzoPKRGoq9NG/uQtSLVjNM3DJDHdX50RfR/ayCg+Uo+6qLlW3yXOb2IxbuN86B0qPQLJlF1rsJlkr13Fxq1l/qg+uK5PxJZMVroKx7BgJeJp1JcRi0oIlljS/Oq2DuiIqV6s7t5Ym+iI9oZWhn4X+EL4uGkl/SLT8KtmI409IeFK45SOAUg5HnimY8b/zMI3v7Yh3Rw0p4ALKqiwTgSO0Ev+III4FKUzgQsv03K88SVUGNu1CVFyqAK6njNaG8BmTXVIwjos+1TUHahrwSJIHdphu6VvueU+9jd2XHU7yo7XI9H0dekcApIUj+t6jVkrYkTJyApKAe1evhYSCRwQqIjSEwwc5Uccqoe7sKfap+6ChYaU3IstqEdhyPZCwodV/5q0/rPNesrXpohLjNE0GcrtkRrzINq1ymvHbOsH9h85fg8yBhkME2ObpP/BvRMhqZq2OvCJfzxUwH4N+pAtDmsBIvFV/D0dvq+1iweZyE1O/HR9uJ5yLj4C07+Lw+Q+gU/0w0t276kyUEipzQKM+PZ3MYPFRuBMNDI1IxC+0J7/PZShB1CwjRhoIW4VMPt5Z3i9fKZvkzJvjjukSDnKvMAf+OOkDogOxsyizezWvA==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN6PR11MB3876.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 294b9582-2001-4ca9-b4ad-08d8602acf60
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 01:40:25.5450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Di19nmVsx+bVSIpbHFvE0XqdmCryTDjh8AGBqC4TbQ9gGXXEL3+pNpz7oJJwWUJrMZLlCB2lVKfgOnwmvSiM5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR11MB3875
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Dave. The change is correct.
Btw, I remember this has already been corrected some time ago.

Thanks
Tianshu Qiu

> -----Original Message-----
> From: Dave Hansen <dave.hansen@linux.intel.com>
> Sent: Thursday, September 24, 2020 3:34 AM
> To: linux-kernel@vger.kernel.org
> Cc: Dave Hansen <dave.hansen@linux.intel.com>; Qiu, Tian Shu <tian.shu.qi=
u@intel.com>; Tu, ShawnX <shawnx.tu@intel.com>; Cao,
> Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org; mchehab@kerne=
l.org
> Subject: [PATCH] media: fix Omnivision Intel MAINTAINERS entry
>=20
>=20
> From: Dave Hansen <dave.hansen@linux.intel.com>
>=20
> Tianshu Qiu has three MAINTAINERS entries, and one typo.  After being
> notified if the typo a few months ago, they didn't act, so here's a
> patch.
>=20
> Tianshu, an ack would be appreciated.
>=20
> Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: Tianshu Qiu <tian.shu.qiu@intel.com>
> Cc: Shawn Tu <shawnx.tu@intel.com>
> Cc: Bingbu Cao <bingbu.cao@intel.com>
> Cc: linux-media@vger.kernel.org
> Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
> Cc: linux-kernel@vger.kernel.org
> ---
>=20
>  b/MAINTAINERS |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff -puN MAINTAINERS~bad-intel-maintainers MAINTAINERS
> --- a/MAINTAINERS~bad-intel-maintainers	2020-09-23 12:24:01.585676846 -07=
00
> +++ b/MAINTAINERS	2020-09-23 12:25:02.959676693 -0700
> @@ -12766,7 +12766,7 @@ T:	git git://linuxtv.org/media_tree.git
>  F:	drivers/media/i2c/ov2685.c
>=20
>  OMNIVISION OV2740 SENSOR DRIVER
> -M:	Tianshu Qiu <tian.shu.qiua@intel.com>
> +M:	Tianshu Qiu <tian.shu.qiu@intel.com>
>  R:	Shawn Tu <shawnx.tu@intel.com>
>  R:	Bingbu Cao <bingbu.cao@intel.com>
>  L:	linux-media@vger.kernel.org
> _
