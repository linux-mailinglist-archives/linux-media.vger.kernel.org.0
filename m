Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D06D527656E
	for <lists+linux-media@lfdr.de>; Thu, 24 Sep 2020 02:53:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726681AbgIXAxm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 23 Sep 2020 20:53:42 -0400
Received: from mga03.intel.com ([134.134.136.65]:14314 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726537AbgIXAxl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 23 Sep 2020 20:53:41 -0400
IronPort-SDR: 5Br5cMSrhc3ULT7feHINDAOQhW7WlGksrjOErvJiY2WwbpeHtwmhy3l/l+nkA89ZfBp2xlYwwH
 lBdUhS2GkPxg==
X-IronPort-AV: E=McAfee;i="6000,8403,9753"; a="161131592"
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="161131592"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2020 17:53:40 -0700
IronPort-SDR: /noFWlT0GYEC95hG3uBuujdMpvzimciaO0fBhm7VnpcTHPAXW5/rjt8tV/4u7zeSJneUlCh4rq
 +xfd/NDekmJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.77,296,1596524400"; 
   d="scan'208";a="511282076"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmsmga006.fm.intel.com with ESMTP; 23 Sep 2020 17:53:40 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 23 Sep 2020 17:53:40 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1713.5
 via Frontend Transport; Wed, 23 Sep 2020 17:53:40 -0700
Received: from NAM04-CO1-obe.outbound.protection.outlook.com (104.47.45.56) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.1713.5; Wed, 23 Sep 2020 17:53:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IG3wYmf1m6vlyqJUYxjJEwLQIvTrTUUy+sY4VpkoDOOevAZUtJXCCokEhPG2qthQdzUQtz5MI+m9d93N6PJEXJ2IiBWJ9EWMzBI3/8OusOk6iWF8SOfqyh4oPBlqkwwmuMAWlsQBAMVp0Y/D+ONUlcDkFJuFSPwDxP8KAwuN5pLncYpeWbifh+nQJW7+HaBNdZJegKYz8MDo1AZ3Wu2oeFt896sKVNcBAg/zKMTPn/6jDg4lzhkpw9N41G2YUB2ld/ewM8oBQPsoeylWB9Ik+QJl0U6s8/QDHOdQQLTUtjzkGxvKtvjBo59ZiA/IIMqCfzEbwkBSMKzYuvNvlSBn5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJAlSP9v5oDRfda0lYUSYvQMamjikxd54bRRce3dcEg=;
 b=T7gMv2uJhFKeAKOd+kDKmTSn1KHP75bYenxA6NCFAZq1ry0NjekNZDZbaiCHhNRzVid4NDyLlA/eOY6Mxc4N8mpXlUM4+qu03l/4F9hu1+nC3yAttugTAr5Gh2Wr85ZXV9Qje+vLUcpNWgg6XqKsxwcGh/kYMVao+Q20aqHTKJciPVxGV5nct8kt1jRdPqmxNod8DfOOP3SnJNtbGV7xvw5Wmz36GjreZB234lpFMBnFtMW+pRvKvrE6prgzNCg7T4EEQ7xB+Z1AKBRqSwklT8fEW/rFhm64W6SnzV+atDeyvlTEoGYlaAhGr4tdvVqXYyn02/s/Ne6fcb/P7MbbPQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JJAlSP9v5oDRfda0lYUSYvQMamjikxd54bRRce3dcEg=;
 b=vbkPiHnvEVSpWYJ5foOUqnkdH96Hj3H97vTJAhyGHIGSO4qu4E15nWEIM33x5Zo52944pKGxQTzlOC1bNXEXXB+jovaQuOz3qCg4duTOmGNnwkGPyC2ZbHKPfVd35ePfN4GhiI4BRjphzR89GYAkXwzvqdotrOdnGvc+rTVZq5Q=
Received: from BY5PR11MB3991.namprd11.prod.outlook.com (2603:10b6:a03:186::26)
 by BYAPR11MB3046.namprd11.prod.outlook.com (2603:10b6:a03:86::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.16; Thu, 24 Sep
 2020 00:53:23 +0000
Received: from BY5PR11MB3991.namprd11.prod.outlook.com
 ([fe80::3907:f4fc:eeeb:a02e]) by BY5PR11MB3991.namprd11.prod.outlook.com
 ([fe80::3907:f4fc:eeeb:a02e%7]) with mapi id 15.20.3391.027; Thu, 24 Sep 2020
 00:53:23 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dave Hansen <dave.hansen@linux.intel.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
CC:     "Qiu, Tian Shu" <tian.shu.qiu@intel.com>,
        "Tu, ShawnX" <shawnx.tu@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>
Subject: RE: [PATCH] media: fix Omnivision Intel MAINTAINERS entry
Thread-Topic: [PATCH] media: fix Omnivision Intel MAINTAINERS entry
Thread-Index: AQHWkeH6/7ru982IyEC7gzpfkHoRKql29A5A
Date:   Thu, 24 Sep 2020 00:53:23 +0000
Message-ID: <BY5PR11MB3991E3E0579BE3F4FFCF9F6199390@BY5PR11MB3991.namprd11.prod.outlook.com>
References: <20200923193356.188D717D@viggo.jf.intel.com>
In-Reply-To: <20200923193356.188D717D@viggo.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
authentication-results: linux.intel.com; dkim=none (message not signed)
 header.d=none;linux.intel.com; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.147.214]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 9f407c16-c950-4f35-d5ee-08d860243d42
x-ms-traffictypediagnostic: BYAPR11MB3046:
x-ld-processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR11MB30466382915B4FFF1E67638F99390@BYAPR11MB3046.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2449;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: zmfwTp1Up9qJmK0oC1MY0Faq4ElpaSzKwx1qnw7SyXj7eMG3BAkV8JEqG0+uhtObw+OUNipk7CotcBzH4fwnr47X10vjXjcDR8uf2uWFsYMrnSsA17XUDtZZreyyR5dByLRchWSuGgYLyk0Y1o5MgYrmZBhOgreKXCfwA0RZbf5AcYMrW30hfy18qRFDoQSE8CEFsIRGSVCfu9wJxIqXKuEUtdUBzwc6FM5wgnx4uXou8blgT3hjhgPSxffs6FZtG0XUdHmskY8ambF2VrrAhCwlPycDGj1LFWLKJOLnI2NXuXGHXQBad4H0wd7nxlAKDoRK2WgEuCBd9VR1ummdp1zUZHjptIppcvDWxAK3DPPw+eIdp7T0a6c2txH86xAQH+xMIAc4Il+/o1JKKapgeQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB3991.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(136003)(39860400002)(396003)(346002)(376002)(110136005)(53546011)(76116006)(6506007)(83380400001)(478600001)(66476007)(66446008)(66556008)(7696005)(8936002)(2906002)(66946007)(64756008)(33656002)(5660300002)(71200400001)(86362001)(8676002)(9686003)(26005)(316002)(186003)(52536014)(54906003)(55016002)(4326008);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: GjEsJkafbhTZahB4vQqE6Qcvj2uDU9ePszM8RNx5NDgXKRUq4D/I0g8BymJ+8YgUfd2Ocl00cgwCW3FKn0v11hL02vZgh2HBzKW2YO66VzRGtw+STc7seNfktIqSkjPrjqMVOpAXF7uvcvtYMa2rCNxhN163aHQnGv5AVPRx1T9q/TlrgmE4tKn2XmqpxKwhhsbUs2eJthVSemMiiuqMYpj3Wc2qK3N7MnMGvcc87C1FgwhxacvkSlWh0GPtD042NnbluizjO47hiXD69rvw4vjVp7ABCOuSQazvc+aCmQ5oaOIxtz3rSKevdgZSNluJWrDeX91RgXTQQmdwmIK59DKLvMza4+pAXWxMKxzCMcR95pmPp8Ky08aBIxm1x6ftNLKi0G7/k9xYJv+wVtY74sIkFvPddVkQknLNyHOKsEqg1sacDD2BWONnn+sZ4FpSy5pQIQZPwQ8nbGNvSKnFMTKCuR4eWAxEBwF3rLe5ZWldKbPTyfk/dzeDvNk5BhvFc8WT4b2+euw+5qQrFGXrrlUL9rCHUyHw1rkzNrtIgoHhDAMy861aOM30byI7412kHY4zF0E2YopruPWdOqP+mIT3l54pfR9cSdCdRvxIlY7E4fbF1HuKS8UhmJLPu297TPC8JJpNYU73hZ6t6hj01w==
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB3991.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f407c16-c950-4f35-d5ee-08d860243d42
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2020 00:53:23.4465
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yRztH9NJxuUriKOac6njcsCVUEgz+EPXcn/SQtla5yZIxTv87QSCiv9NDmd855YSeI5zT2I+TR6cYxAYFod2kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3046
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi, Hansen

I have a patch for this, and I see that it was merged.
<URL:https://git.linuxtv.org/media_tree.git/commit/?id=3D6b7324fb4d486f348c=
7affad13ed2d5554d9e03c>

________________________
BRs, =20
Bingbu Cao                         =20


> -----Original Message-----
> From: Dave Hansen <dave.hansen@linux.intel.com>
> Sent: Thursday, September 24, 2020 3:34 AM
> To: linux-kernel@vger.kernel.org
> Cc: Dave Hansen <dave.hansen@linux.intel.com>; Qiu, Tian Shu
> <tian.shu.qiu@intel.com>; Tu, ShawnX <shawnx.tu@intel.com>; Cao,
> Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org;
> mchehab@kernel.org
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
> --- a/MAINTAINERS~bad-intel-maintainers	2020-09-23
> 12:24:01.585676846 -0700
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
