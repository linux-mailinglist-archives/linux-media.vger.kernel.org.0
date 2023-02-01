Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 042C4686B09
	for <lists+linux-media@lfdr.de>; Wed,  1 Feb 2023 17:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231665AbjBAQB1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Feb 2023 11:01:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230369AbjBAQBZ (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Feb 2023 11:01:25 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C919E172A
        for <linux-media@vger.kernel.org>; Wed,  1 Feb 2023 08:01:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675267284; x=1706803284;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=q3CYQvMwF+GJ02RX4xJ4OmsjHaRcshJf3L0yPcZtATc=;
  b=h5+vKqfooXU8CN+bYQI4P2Qrv25FmnGtGd6x8NEGD45r0GQIlKM9JqH2
   kQ3vrs9RacmQ2J+imZe7N8BdvLc4JtwGCtjQdqRXzg/w0mSlpifIsbMav
   aNvoXDwlp1adsNrY9Pos+k9kskzgO8vNYkXqjQsGA5dyzuRd3L2+gRl+y
   fl7m0pt36yPJHScbWxNRgb9fKVhoeSZ6KyPaBBpXnS1ZbNvCVWlCcd/3H
   bKF71xzuxYsDPql588ZJ8zl3vLQMMu+CqTIprCdP55FA/Goy3aMxu8+rL
   JJHdJ6yTMnTbuDHVn1EgmwIRX0+oOjgZ+0MJVIXbDiAIpFCxtEMjKjiow
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="308523804"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="308523804"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Feb 2023 08:00:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10608"; a="807603984"
X-IronPort-AV: E=Sophos;i="5.97,263,1669104000"; 
   d="scan'208";a="807603984"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by fmsmga001.fm.intel.com with ESMTP; 01 Feb 2023 08:00:54 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 08:00:53 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 1 Feb 2023 08:00:53 -0800
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16 via Frontend Transport; Wed, 1 Feb 2023 08:00:53 -0800
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.16; Wed, 1 Feb 2023 08:00:53 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d/o27xKqwzMa7RjN/N9+BjZEdGeP6XxHc7SEMvCYsIfWkltaR2dmKbH43T4vYT+myQ2f33+AgxFtb56GewdeDyaf/jn1I/2+CXSbarCkohQExuw5B4QAfFN9uyQ33Okj9Ym5sTLjnCdx1tXnVaNt8A3V8dDCvd2HNDlZD+EE2qEMIQ82rBF3VcmB2eoNuANikl++YTbHoPB1OX8i+TEPgkyu8w1N/IZ70OUJ/MGsYAtnbH+gTEMh+5GsBs6Xq7sZsKo/XmfoKD1Cgqwlj/6Q0v2lLgypFGFK69yj5nZnSt2XdPAhXHzUS0xejJrZdcv/iXxRjvypuGOLB3v0op/bXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VFYNP9cBvSq7zvzIBTTOsFtNP8IqZqdlsYqXTzwu9dQ=;
 b=Gt0szlcvBFf4ioI/Ub+OhdplU9BZA64Q0Fl7qToPjEei0XaYVAjk7dr0DoiMdXVRBCM9I0j65l7tHo+NkGRVEIyVmbYu6EWHDRM0fc15rb+MjGIzMUFK2owRWHYlML/ciLgNzqaQNKXljCONEvsYleU1wMeErGJHvFG0ItYIe+wmbEFFOsZ1G63+RCZ+tp8bOnxSzM7ULj15vt24JFtgQBKgWfgQt41JctNxWozfVzfgcwSd8SDSFNh4fd0JjqEhvewLZV7Vj5Xtmm2j5vsWnmLqw2XouvOanUVTUUyXPkpD/JCtiSXd3G/5Sk2cAHwCy2z70syax0oZ60ihTUo7Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 DM6PR11MB4689.namprd11.prod.outlook.com (2603:10b6:5:2a0::14) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.22; Wed, 1 Feb 2023 16:00:51 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::4207:1798:c852:8fb4%7]) with mapi id 15.20.6064.024; Wed, 1 Feb 2023
 16:00:51 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 1/1] media: ipu3-cio2: Fix PM runtime usage_count in
 driver unbind
Thread-Topic: [PATCH 1/1] media: ipu3-cio2: Fix PM runtime usage_count in
 driver unbind
Thread-Index: AQHZNkJo7p2CVpKmc06//1LLNxKkoq66QAtA
Date:   Wed, 1 Feb 2023 16:00:50 +0000
Message-ID: <DM8PR11MB5653A9C8BFB09065BD73D04B99D19@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230201133751.305474-1-sakari.ailus@linux.intel.com>
In-Reply-To: <20230201133751.305474-1-sakari.ailus@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|DM6PR11MB4689:EE_
x-ms-office365-filtering-correlation-id: 37bf9761-36c2-42ab-18f1-08db046d7db3
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: kFTRhAD7Ub09JYwEvSzMUd1xCvMZJpiHWbIeorhznEG3k4LLmJY38RI2MLe1sEdVX8ROvUO6pvS0BeOX6u6jCAwFdjXsTeqotSrgcf5ISw8O6M2VY9ZSPwqS9tZlHoTrOEt9eknVGN2Vx3FurSrp7zIDiRCLaAbldh0wdJUQ4A3UnHL9n4vLac/iMLXK9oVLlQMyN9ReWRgzTizZcpuXah9G5b6UouGQ3YuhvzE120/JEhptIaTJ9iAwfiXYzjJHNjMFruYL+WTwD10FukyoI/d6hrqX+gKn0XKV60nJiWHTlJMFqmU5iXlHlntsx00xLXpBiYk7I7Y4YjNqyDjiOiikv5d0n25IJukc+QC97+RHg851KopkLqdCB9VB/TdeXisgozxQn4/qO0XrUpq6FRkzKH3Cp+pvMCbwsgj+wMIIOeRYgwfNJV/JpFEWILPxgn30ZLJ4tllUpbA+JVa6bPOw4aaUgKd37omowl88fxPKllX7aI2NwPcR5348VRNuQ1bZZUCVacQnI6Lb4zreKHrvl4c1jv8T73FppMsZsNm5jPieBSTAlVZCgm1XK/+rIwTAr8ffWSTNfteRTehCt8iRepnyHS0G5wte8kLdhug1ZP6j9pPG+YDwMGNQ2nChrP9kUJsSZOTUmHTdddsFUtqnw1LJ3+7qKYsA9K5DOdt3sZfRKsbIhM4MTxp8lUcLBbjtf9kTtKzW6gOixGORew==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(346002)(39860400002)(366004)(396003)(136003)(451199018)(55016003)(83380400001)(478600001)(7696005)(71200400001)(122000001)(86362001)(6506007)(26005)(53546011)(9686003)(186003)(38100700002)(33656002)(38070700005)(41300700001)(82960400001)(66476007)(66446008)(66946007)(66556008)(64756008)(8936002)(2906002)(316002)(5660300002)(52536014)(110136005)(8676002)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xY89r69QVWjtbkOrp8VZgl4aHpVnliTtUnuqwTveTt8A3xuWh0+ju+wuXdPi?=
 =?us-ascii?Q?A6RhUzSRRXVNou9oO41FcOUVZGaz/qxg/hJQaHrzYuaOy1JBcSClSlLMbMet?=
 =?us-ascii?Q?xJLKH13nUg6Czuv2mIa8vUJfx5Vv4IiqETWou0t/35o+UxK1O7eG/7GQWXnI?=
 =?us-ascii?Q?kAlFovt0G+JiY2BoKhJTj8Dqd4LT0+RNUf13vIwnNRyy91miwHJ2BIa6pFZ3?=
 =?us-ascii?Q?ducZqutIU0XrZaV22SCKf8ynXjGLjR43lX5z4doDYlp+UJ9bEAfevS79Ocvv?=
 =?us-ascii?Q?kqlfs3h409hi5U57gKV5zZIS9sNzxdC0m+AM/+TG8zogGUuDouJE3QxTIVRn?=
 =?us-ascii?Q?3euDNbtoVE7Weh/5be1gwq0bNyonjIelleuDuoWUT19ykl4+W/ahASotwwkb?=
 =?us-ascii?Q?rk1MsGPGOJ8wNmR1VCL98KiLayREJrT0nMBbgvRD5GvlHNTW+RvrOSihLwcF?=
 =?us-ascii?Q?UdzrdS8jLS3TvYoP2DM+Cd8PbasfqXR9Jd1RemrC1DaGfTo+3N5e7V+rZ0kg?=
 =?us-ascii?Q?9oTkU1MeQbgb/2CKthjm4Nmjl5SRLUt+ooGizEW5lQ2L/wHjjSQwdUFWJJm7?=
 =?us-ascii?Q?RuRzMYyOV1yIi0/bIP9dmUSGdwzx3YgPBVUcSDspJZvf+5IaMb0DrAtjswb5?=
 =?us-ascii?Q?er++laiTL5emzVqIEsEsaKSWIY5hjXQCIPVJoqSnLqMLtMEZg8Xc9dIgKU2Q?=
 =?us-ascii?Q?6VOzvkfRFdkfx92O0nv4+hazo/k2hYy9YctK/aFxk63CDkrBSxKKo6z9+TBK?=
 =?us-ascii?Q?kTTZlqQGy4Lc+1sCX9nPUgAtasbYxZgj9rMyB/CSor8U0T2fpPE9i49VeCM9?=
 =?us-ascii?Q?jyME2j2xkkhe4VVHIxwxZxJKnyU1c466ys4asGDfsUa9KE/zTx6ynbxTSBPV?=
 =?us-ascii?Q?KFQzt53SqxkVNfYmtcp/Pz7NJLLnbUbLjgPYoYR81LnPfiSb0oa6p0KpP7zc?=
 =?us-ascii?Q?fOZtxGe+pCpkb/L9Ok4lCnraEHu+b6y4AvI/lQB6Nw1ibxR4yJ6Nz7kelnhJ?=
 =?us-ascii?Q?RLBA2yuPIs58AAciQ9Q1piS7yh7oNvgdxDp4XulNeAYmNa2V53uc5dsjFyvZ?=
 =?us-ascii?Q?jtPkJUWXagklymtOnwIqdbfm0EANJL+gnCPYXG3ji69cU3YywxjXUEpG3ZdI?=
 =?us-ascii?Q?Df1XCQ39F4dvOXaMLAyPPgtcKBl3p7UMwskK9bkkO3W3xLrqTJdGWYvT0izd?=
 =?us-ascii?Q?SFisGBQ+3/YdNtYGcLSeX2JK4cjD3fPXKutN79o/L4zFgrCDysxaY3blaQx+?=
 =?us-ascii?Q?CSaVlkBBbMAe7PPrSndsEyZoyMdxTgudxoY122OVlqnFEeHHS24mWgmsGS6z?=
 =?us-ascii?Q?9lzJlgHFYbIXDb2sSMUiXRF/ND4GBMV+ZMeOyqBViXOnpGgvmgsEBXnq3rkC?=
 =?us-ascii?Q?m1hRQSCFe3eX76UBfx2GbRy2NUaqNmR3ABET9OTYikHxN8GaapwA0yO5S5F5?=
 =?us-ascii?Q?cRP4Hs+gO3B+Z4O2EyQM4Meou6e1wNWC3U913nlRmqEikQtTh1IkTmrN/mTg?=
 =?us-ascii?Q?s1faJla7anFDMCb3DkUY9pKHVkURzo5SI9IRXTqiuf74KktEf2cYJtZvlGaQ?=
 =?us-ascii?Q?AZ+N7l6g0CZNJsili49m8uPWWlKnkdta0UQ47R2e?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37bf9761-36c2-42ab-18f1-08db046d7db3
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Feb 2023 16:00:50.9424
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MddO+nMP8uPtJGyRwtqLff/BUUaYpOcByU5Q/R9WfGNpUCEhSehZS4Iz+w9MH4uEBBVGPbDMQAkk0+hrLrTyEg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4689
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

________________________
BRs, =20
Intel VTG - Linux & Chrome IPU SW
Bingbu Cao=20

> -----Original Message-----
> From: Sakari Ailus <sakari.ailus@linux.intel.com>
> Sent: Wednesday, February 1, 2023 21:38
> To: linux-media@vger.kernel.org
> Cc: Cao, Bingbu <bingbu.cao@intel.com>
> Subject: [PATCH 1/1] media: ipu3-cio2: Fix PM runtime usage_count in driv=
er
> unbind
>=20
> Get the PM runtime usage_count and forbid PM runtime at driver unbind. Th=
e
> opposite is being done in probe() already.
>=20
> Signed-off-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> ---
>  drivers/media/pci/intel/ipu3/ipu3-cio2-main.c | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> index 390bd5ea3472..3b76a9d0383a 100644
> --- a/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> +++ b/drivers/media/pci/intel/ipu3/ipu3-cio2-main.c
> @@ -1843,6 +1843,9 @@ static void cio2_pci_remove(struct pci_dev *pci_dev=
)
>  	v4l2_device_unregister(&cio2->v4l2_dev);
>  	media_device_cleanup(&cio2->media_dev);
>  	mutex_destroy(&cio2->lock);
> +
> +	pm_runtime_forbid(&pci_dev->dev);
> +	pm_runtime_get_noresume(&pci_dev->dev);
>  }
>=20
>  static int __maybe_unused cio2_runtime_suspend(struct device *dev)
> --
> 2.30.2

