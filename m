Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72A1A230AFF
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 15:10:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729879AbgG1NJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 09:09:58 -0400
Received: from mga04.intel.com ([192.55.52.120]:38252 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729854AbgG1NJ5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 09:09:57 -0400
IronPort-SDR: 4ET1/IMCKRgS9Wj9McPsaJoZ5YumNzJF6rdf11IhbOggNn9VKOIAEsjM9s+VgS5Jceow/yxgU3
 B/gJdquLMylA==
X-IronPort-AV: E=McAfee;i="6000,8403,9695"; a="148666399"
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="148666399"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2020 06:09:55 -0700
IronPort-SDR: Y3jdkQZxlcWu/uQXROpzakKmjTd5cE1tD21BCZVUcSf+BWXS0HD/y//tTWLXyrLPbFEQlH0D65
 txHsGp8TBPaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,406,1589266800"; 
   d="scan'208";a="489886885"
Received: from fmsmsx108.amr.corp.intel.com ([10.18.124.206])
  by fmsmga006.fm.intel.com with ESMTP; 28 Jul 2020 06:09:55 -0700
Received: from fmsmsx152.amr.corp.intel.com (10.18.125.5) by
 FMSMSX108.amr.corp.intel.com (10.18.124.206) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 06:09:55 -0700
Received: from FMSEDG001.ED.cps.intel.com (10.1.192.133) by
 FMSMSX152.amr.corp.intel.com (10.18.125.5) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 28 Jul 2020 06:09:54 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.107)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server (TLS) id
 14.3.439.0; Tue, 28 Jul 2020 06:09:54 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mau5cCbtrn6a9ivynr34sswTZhHeiodYKih/Y2V/TFqWteCC7vhmfqXjIbUzwRmoGVRcIv9s1BcApp1VBLuZcsbYZE1G5GtM+64k/A5aVAYEHt1aqq0j6WBlznQ/ZLEvhBg0rV4Ukh5Kafuo0IZxMFrt5hFe8VkEsMnn8gZtdqkIF3bx0da/i0EebsurpUM/sa4kKxldm1pGnBPSNXrdhadbvOotjoHNii65lO0UOP5WqrT2OZf2cERPHcmAE64TEH2YWsxbhlBODIlCVwo7WzT7MWMYFuR7IpyfaBobA2Jt4FW5pxHxJm0SnkINJ0+cGAbP9usv1Vp4MCPHfF/MLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNCDFobDrzXUG/+Bc/QOBz3dHfA0cWUvA3lsPp/4iPw=;
 b=Hz7zyLS32VvKqj+ASKnijnK0HZqrBwOYl0/svxjZbrimCJNyArxL9FggF6+SnNWRGxJk4m9lcTWCl16VyRYqlri0qwmiHGCi+ZTaqpqgYGc1pTBOSGmIxFZ3719dPQWd2s22mZgN13TxVJiG2PJr+EeuU/7iUZZOiiTeuR8gdISb720JybCyLI74DlhsItqnbG+Rmb9L+aLL0qCc4coTFBimslJySGJFqXD2nfrKyInw8Y3OMPsBvTo02+QCWAAk4fsY1c5dyZQQV3tYQvLxAuTVm7kn4DqmvxE5JVSYd8AtuwdYncBrP2MHAEogCTb3Q7nmB0lNCs89RjzvQFcunw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gNCDFobDrzXUG/+Bc/QOBz3dHfA0cWUvA3lsPp/4iPw=;
 b=XuTaNuGau28f/dK2bz8hg1fVZ/GUoCOx3R+G9qJuuNRofaxpEtdxC74ggsF4O8k0k2P3BAW9PAskEmsq02ONI9wtpCiuVkCHE1uZE+XEDOsPZIczIMc4RXmVNAFJULdXBieOXPRrsdmWeYEgN5baLkPkMWimeIdkumVYkPRLSfg=
Received: from BL0PR11MB3028.namprd11.prod.outlook.com (2603:10b6:208:7a::10)
 by BL0PR11MB2915.namprd11.prod.outlook.com (2603:10b6:208:31::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3216.23; Tue, 28 Jul
 2020 13:09:53 +0000
Received: from BL0PR11MB3028.namprd11.prod.outlook.com
 ([fe80::92e:d47a:458b:8598]) by BL0PR11MB3028.namprd11.prod.outlook.com
 ([fe80::92e:d47a:458b:8598%4]) with mapi id 15.20.3216.034; Tue, 28 Jul 2020
 13:09:53 +0000
From:   "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
To:     Bjorn Helgaas <helgaas@kernel.org>
CC:     "Cao, Bingbu" <bingbu.cao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
Thread-Topic: [PATCH] MAINTAINERS: Fix email typo and correct name of Tianshu
Thread-Index: AQHWY8xSA7WDcWfT7EGs5zhSWTVff6ka0npggADdVoCAAUiRQA==
Date:   Tue, 28 Jul 2020 13:09:52 +0000
Message-ID: <BL0PR11MB3028F1986F181099B3C407BADE730@BL0PR11MB3028.namprd11.prod.outlook.com>
References: <BL0PR11MB3028D74ABDBEBCED28ADFB9EDE720@BL0PR11MB3028.namprd11.prod.outlook.com>
 <20200727173105.GA1758148@bjorn-Precision-5520>
In-Reply-To: <20200727173105.GA1758148@bjorn-Precision-5520>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiYjYwNThiYTgtMzVmMi00MDRiLTk3NDQtYjIyOTdhNGNmOWZiIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiM0NWUnpoM3QrZkZrN1lQM0lZNitnSjhHVE5nMHkzSXlVcnJ4RzdqN0ZRVWZpazU5M05VQWI2OUkrWWwxYnlUWiJ9
dlp-version: 11.2.0.6
dlp-product: dlpe-windows
x-ctpclassification: CTP_NT
dlp-reaction: no-action
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.102.204.45]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a5ab55c1-f91a-420a-447b-08d832f78459
x-ms-traffictypediagnostic: BL0PR11MB2915:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR11MB291598BB7636B3087B141D82DE730@BL0PR11MB2915.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: p4i5u1vYVmlGJjS/8mpz3jerf9Y/5ZhEsijcaJYGmooztQTUd7QZ7j1HTuWYxjmUtbWGMim09hdtGE8jjHeZrU3NRonQi/ki0NyiQQCdu1wPAxf6QYen/HiReLo5epgEjN7IqgF5+gEOPnQUHs16xlsGbVZnOO3p3oZ4wYlP7G0gCHjN99iq7ki49kVBzZ0kJlTmC7os3EOA1Upa1oasBEDAAFvvSv/fFaUOgNhjmqzJMHSVGsKmTvl7+UL657uoY+f0cvBfpDfpp9V7QCqU+7hu+KrjYfEHJfYFNPQ+z8V6/HowcWwmcnyYB0/Wk9PDZ5vr6tdA0PftI50AQaHvjg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR11MB3028.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFTY:;SFS:(4636009)(39860400002)(396003)(136003)(366004)(376002)(346002)(7696005)(8676002)(33656002)(83380400001)(5660300002)(52536014)(316002)(55016002)(186003)(54906003)(2906002)(53546011)(6506007)(8936002)(26005)(66446008)(64756008)(71200400001)(478600001)(6916009)(9686003)(4326008)(66476007)(76116006)(66556008)(66946007)(86362001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: 92ZphZPWKgC+/5+UYk7HEumYYVWkEBQIVEU80AcBS2qKxWGSO9nqwHECL2eLaeLr0l1kq/l7U6Lgw0FY3BMW3oBOSRGFlag3Y+9RgKRqnM/PTlkeGjj+S93vjmTVLP7kvkIEP4CdZlrBiyg+SQ1I6Caa3oyBu0icK+ckMFRZ8im03j9osN1zX6OM3u1lDMvVFQ4t7Bm4ezz1J/IoBOQJAUBReGGDo2ACeCdbfXR/ycCSW+OVWJ+B0bc9GQFcw94iZkS2CBbzI1kRChM2scjcNqnQtFRML4pIdTF8vSTG4T8pmLdyS/QeWBZnpvg9jj1j2aRpp+qx/1igPK1eMGIR4wf9+t64IiN21Cz3I1y0OkoQLCRYmLhSpOUHufS9rfqaSdpEDW28J+vWbWpF7/sCLQQyW1WGu2DbFCrSpbJKviVL4fF7UAa+A2clQlzmAlq0p80sv87GEZ5x33bf+uBdcdX/l4qAHBDymcE8GoC+Aj1h9iQCCwnVEMU4mdA+od7Q
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR11MB3028.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ab55c1-f91a-420a-447b-08d832f78459
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2020 13:09:52.9610
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: nwMoAR8rKMq6iv0W4lOqUXNbG3VlzmF4ZL6A/FJc4X/vt72eA5UUcyIu/6ry2mPZOCl1cpX5k3bBi+A1J7xYEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR11MB2915
X-OriginatorOrg: intel.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> -----Original Message-----
> From: Bjorn Helgaas <helgaas@kernel.org>
> Sent: Tuesday, July 28, 2020 1:31 AM
> To: Qiu, Tian Shu <tian.shu.qiu@intel.com>
> Cc: Cao, Bingbu <bingbu.cao@intel.com>; linux-media@vger.kernel.org; linu=
x-kernel@vger.kernel.org; sakari.ailus@linux.intel.com;
> bingbu.cao@linux.intel.com
> Subject: Re: [PATCH] MAINTAINERS: Fix email typo and correct name of Tian=
shu
>=20
> On Mon, Jul 27, 2020 at 04:20:39AM +0000, Qiu, Tian Shu wrote:
> > Reviewed-by: Tianshu Qiu <tian.shu.qiu@intel.com>
>=20
> This doesn't really make sense.  The patch already contains your
> Signed-off-by, which means you participated in its development (see
> Documentation/process/submitting-patches.rst), and I don't think it
> makes sense to review your own patch.

Thanks for pointing this out. Sorry I did not pay attention to this.

>=20
> > > -----Original Message-----
> > > From: Cao, Bingbu <bingbu.cao@intel.com>
> > > Sent: Monday, July 27, 2020 12:12 PM
> > > To: linux-media@vger.kernel.org; linux-kernel@vger.kernel.org; helgaa=
s@kernel.org
> > > Cc: sakari.ailus@linux.intel.com; Qiu, Tian Shu <tian.shu.qiu@intel.c=
om>; Cao, Bingbu <bingbu.cao@intel.com>;
> > > bingbu.cao@linux.intel.com
> > > Subject: [PATCH] MAINTAINERS: Fix email typo and correct name of Tian=
shu
> > >
> > > Fix the typo in email address of Tianshu Qiu and correct the name.
> > >
> > > Signed-off-by: Bingbu Cao <bingbu.cao@intel.com>
> > > Signed-off-by: Tianshu Qiu <tian.shu.qiu@intel.com>
>=20
> Also, Documentation/process/submitting-patches.rst says "the last
> Signed-off-by: must always be that of the developer submitting the
> patch," which means these should be reversed, since Bingbu submitted
> the patch.
>=20
> > > Reported-by: Bjorn Helgaas <helgaas@kernel.org>
>=20
> I don't care whether you include this or not, but if you do, it would
> typically go first, since the report comes before the writing of the
> patch.
>=20
> > > ---
> > >  MAINTAINERS | 6 +++---
> > >  1 file changed, 3 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 5392f00cec46..638dfa99751b 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -8765,7 +8765,7 @@ INTEL IPU3 CSI-2 CIO2 DRIVER
> > >  M:	Yong Zhi <yong.zhi@intel.com>
> > >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > >  M:	Bingbu Cao <bingbu.cao@intel.com>
> > > -R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
> > > +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/userspace-api/media/v4l/pixfmt-srggb10-ipu3.rst
> > > @@ -8774,7 +8774,7 @@ F:	drivers/media/pci/intel/ipu3/
> > >  INTEL IPU3 CSI-2 IMGU DRIVER
> > >  M:	Sakari Ailus <sakari.ailus@linux.intel.com>
> > >  R:	Bingbu Cao <bingbu.cao@intel.com>
> > > -R:	Tian Shu Qiu <tian.shu.qiu@intel.com>
> > > +R:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  F:	Documentation/admin-guide/media/ipu3.rst
> > > @@ -12609,7 +12609,7 @@ T:	git git://linuxtv.org/media_tree.git
> > >  F:	drivers/media/i2c/ov2685.c
> > >
> > >  OMNIVISION OV2740 SENSOR DRIVER
> > > -M:	Tianshu Qiu <tian.shu.qiua@intel.com>
> > > +M:	Tianshu Qiu <tian.shu.qiu@intel.com>
> > >  R:	Shawn Tu <shawnx.tu@intel.com>
> > >  R:	Bingbu Cao <bingbu.cao@intel.com>
> > >  L:	linux-media@vger.kernel.org
> > > --
> > > 2.7.4
> >
