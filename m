Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D8CE375A520
	for <lists+linux-media@lfdr.de>; Thu, 20 Jul 2023 06:33:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229681AbjGTEdh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 20 Jul 2023 00:33:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229668AbjGTEde (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 20 Jul 2023 00:33:34 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3157E1FE1;
        Wed, 19 Jul 2023 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1689827611; x=1721363611;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=DJWn+RMwFiFyhOR08QumUDN0/Qdy1RU9hvkDM1qgRWo=;
  b=Fdzx7VYDtr1tGxeIQMRjojA32JlYONYgdEZTpkWllp2Y+Y0QPg7hz/oA
   2tCosgmtWHIFAJGzwSSptW293Oy7dPs5j4o2fucimVL4SnPc1QYpx5r94
   LqMemwfRziYA5Q+2SV/61DoMJbwC6Wd46/C1DW4v+QrXbHLjZ/ajl5hZL
   aXMt+PwIl2zT8TpXePNs8G2wY1zQ+V4nt3V1uBTqO9xbhJwUGAiqXrr1x
   G6JIeRRkaoYaXV135HhOCPp1JrX2ersJqAo2gx1mzFxej/Fp24ZxqMJXu
   NIVJ6oizrkDmchTu1hcLJKSv15wWDCO1yipmSnAtG0SmCr4w62RUrotT7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="356593828"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="356593828"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2023 21:33:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10776"; a="789645914"
X-IronPort-AV: E=Sophos;i="6.01,216,1684825200"; 
   d="scan'208";a="789645914"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga008.fm.intel.com with ESMTP; 19 Jul 2023 21:33:30 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Wed, 19 Jul 2023 21:33:29 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Wed, 19 Jul 2023 21:33:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.47) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Wed, 19 Jul 2023 21:33:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fDU4VrE8uJo1XvrkyXJKgF9zxS8R9xmLBxVxZaIOooxXx3Q9+taX5zfVCaasQBZpQlTl6Pl9nbYprnA5qpkC5h198ZepK2aqwEqX4CoVGHgOpas0aEeMnxr1On1w9g7qpRORRGDV5zgNPbp1LjV9OwKjoNTJiEYZNJ5qq6S8DfVH4ouGoAuGsQpgBkELbvrk+2G1EqLko65Dd/e2HeWBP06LIzgJK7mPJqXpFva+G9P4QkaKtxvDC4GwZqNeYbqLIYHczx0E+qwuiDeUdL6G6G4/AiIxNcZ6cvQ5CKYhHoU36rG02eFj0j7Wh9JH3hPiqpINnZCRx2OZbfLAtqflwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JJ+al1VqHzhtzGFhVH4kohPejYK1OgWPWm5P5+kccRc=;
 b=GtLmPEkqIfUoaTjQXCZJLKb3qWlIp3Ie/ENWfhwtOeAHRFHAax0bHHSiYtGg/49Xc0G6Fh6rhrKEpApvmNtDfpc9AZImXLxMOSdhyJPL7a8CGJut84ff06MKzOsBUvSsqhl1u2sMp9p0vfjnW1IDm6todMnFOAKoloXMFdZfsLDd9tQri0FQ2DRPeU3z5Gh8TOE7clMZMSseezXrTMpx9cuoqmiCRuHxlxuQf4vFQO/lDjHX6Vn2ul+/+MfdxYt7IBtQOJHoc8En8Dr8uVhOOMkIpsZGc8ftCR3yr7ZIOpvq9kljKp5lBYpXEkY9EPpE8O/HGMWeXP0TfpUfFQmQGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.31; Thu, 20 Jul 2023 04:33:11 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3382:a13a:ef37:f584%5]) with mapi id 15.20.6609.024; Thu, 20 Jul 2023
 04:33:10 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Dan Carpenter <dan.carpenter@linaro.org>
CC:     "Kao, Arec" <arec.kao@intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        "Yao, Hao" <hao.yao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: RE: [PATCH] media: ov13b10: Fix some error checking in probe
Thread-Topic: [PATCH] media: ov13b10: Fix some error checking in probe
Thread-Index: AQHZuioW13hlBU6DQkO+UIJh8YArua/CCQdQ
Date:   Thu, 20 Jul 2023 04:33:10 +0000
Message-ID: <DM8PR11MB5653363F77D31A3E5F4C03B6993EA@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <b7ed2497-35d6-490e-b2a6-089f8099290a@moroto.mountain>
In-Reply-To: <b7ed2497-35d6-490e-b2a6-089f8099290a@moroto.mountain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|CY8PR11MB7012:EE_
x-ms-office365-filtering-correlation-id: b2c123a2-1b15-4c03-0ac9-08db88da6c51
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: oqDJOKcU+/l+Qwbno6xQADEj1CgQTF5QySu+/Y8gdRDiRRuCLW+OXI6sKFSk5SRRyR4/vf7HzPUyuX1W9uHUFpm5F8vi9QfdKTP9auB4JZwvKtrH1o8Wrb/dNX0YSygTMPeHdq5Wjwg44zKfNLwYxlbOYUTb71CUHEbEymiEQMCRf1rz0Nld4ZIcWCFhRwxJHZ9jkO5UAt1JexquDHXAISk2dxykgWE9OV1677DcADNbENepa2RJ++4UJb+pfcmO/hfcR7shVoEELMvMT7qS1v5C0w8LCjlASqDTDXvbmJN7+EWeGUfOXZ86v+Beoa/Z433808+C0Qm09j5yxpvGRMoZAuGmGasBD3mTfwmQlyI7anI3c1VY9t1VJ3ZmCFRXNa0nu2k86rHs4sONG80KrLxDStxuc0v4jAwQ8/RQKgNQTHHCgl5QJNM6b8G9pnpW2MVlC1rBdeCgDvxEw3Um7hOf2IW3rKH7XSdPJX8WO4Y1sggLTaSAudtD6Qig8jhR//TlZp/I2SNWmuEjmBmcm0zFlQFVqlKY/ASyLLmOwaMceYfBmk2EfVDVGYTbck1A6QlVpzvPXr28p/Y+tgp0PXa2+wgjHCKdFQJYc0jNx033bxPiVWIpcx0vUm2cou+hoDTueIHwehL5q0lasNOsdQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(346002)(39860400002)(396003)(136003)(376002)(84040400005)(451199021)(86362001)(2906002)(33656002)(38070700005)(55016003)(186003)(83380400001)(9686003)(6506007)(26005)(82960400001)(122000001)(7696005)(38100700002)(71200400001)(54906003)(66446008)(64756008)(478600001)(4326008)(66476007)(66556008)(5660300002)(316002)(76116006)(6916009)(66946007)(41300700001)(8936002)(8676002)(52536014)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?iLeizg2FswmcaBhJ6kIUWQy2TrqlQ9bBFBab75wmEZ4V6jLs3fW/m1wsO9UC?=
 =?us-ascii?Q?NisMA8ROmqw0e5lyaCQWKMDRt0svEe9MQuG+A4Y1ANAy65nKugPhPdh7U1nC?=
 =?us-ascii?Q?ls2PmZMdUg0WUttjVRD7EbiOsdpqgxNFywC/ti4HBMZ0pXB6Etv7q0sZIz04?=
 =?us-ascii?Q?bysWpGbbQR+9NdJauqnM5VaY+5yJAX0Hqv1AFxwT6qxnYYLbOqO+OqMbYseI?=
 =?us-ascii?Q?AME/Z+farxuEWbQpxhapRLeognjKoAryjU980WQb/XxV+koBc56e7aPCm3G2?=
 =?us-ascii?Q?G55i7nYe7rl6GVk7k5esiFJYOrKQK7/BDOR85jpF211KJUEPpu9ia7c9n/cm?=
 =?us-ascii?Q?dMA8P30Tqe5ozo6EJeWZpDKUUa0OyxyXZTryP6/sNMj6dC8x5i04NKXn8ojK?=
 =?us-ascii?Q?d/06vAjQAD9BBu9y9L2k7Gw1CLCisZ3tHfB2ay+LXo7f/WJ3+54XHOlywPRM?=
 =?us-ascii?Q?5te0EdHT61ZlFXSF9MmOp8w0UFm1zak1YuHZogX76E7iu3pkrqxPPFYKvWkN?=
 =?us-ascii?Q?dPiSYFU/wAQ/rpXtvlCOuY20a+/IsO7m9ZoAG+t/r+GatQXNmRJvaiZjN8n5?=
 =?us-ascii?Q?lsyYgcpgpLsjxlaGcMVb7XgQ9xhSXg9NuBLSg8dhhsdKZKPXzISgN9T7SJe3?=
 =?us-ascii?Q?KpupV+QMJ7urWzjhRNvD2yZV4WpE4oFo3IOb1bg13ROZ64F9Ps2al/+GI4oI?=
 =?us-ascii?Q?fYVjG9qhZ+Fs8EYnLz6jOIcnx+lyPNB9aVorTU0ki+ba3hg44FOflccP7YiE?=
 =?us-ascii?Q?6U4l9tT5IzcX0le3B9o7OYKSXibGueh3UkbJDQD1wolf/i8rsqpouQcGHBv7?=
 =?us-ascii?Q?uzD84LFzS1Yi5mxqJwaCwky2yrCppK1e8THW+KivWBLiGV2NeiC7eSHk32ja?=
 =?us-ascii?Q?CXQ7YvOi60gF/Kd9WinYjsyaZmSy+DcB6M/qmR6r2HrJOwb0CgNKfGryIYID?=
 =?us-ascii?Q?H/YQeRVCsD/tSqxKq+Bts6VmPKbequln/Z4Hrfou7O7Gjh2sVlznCPsVGPyg?=
 =?us-ascii?Q?4tj1x6Eu52HANz2HY41Q9gKD7udQSAnNIvGeVcALsAC6DyS5XQKybKNADHNp?=
 =?us-ascii?Q?lbdM0kBts0S82LxsBBPiN8o9oekQI/Z4LLsSCR9I1HxrjkfARsG4i6m2pLYh?=
 =?us-ascii?Q?C8uJaHIrmMlmBgGHVTa3bQ3RevtpJQbSkmgOnxprDuhK+lZbmyOmthB/PHJW?=
 =?us-ascii?Q?euGmjN751a++WS7U2Ydu3KaE6G6NlO4Rtx/851TMy093PqLrNEKCVJ6NX1DM?=
 =?us-ascii?Q?JNyY88tAjmirkLxNP/BalP9C2EmJKj43pDM+1l15uh7SGd4NwrWakL8FcdHm?=
 =?us-ascii?Q?4XpFDrDilWlJwQx5VM6p/osqc8e2Ujglsomgq266vLmseCucBSMhjEl3tnLL?=
 =?us-ascii?Q?cqG1JHMYZCs8SowiX7gm65Asea6ZNeO7cTEpjFgDGTUmJYurTaie6ExoWYC9?=
 =?us-ascii?Q?2KZBkOIxIIk4UWEtRd0zTRXZLDGi5tbsx3g+e0u5L3J3jS53EMf8u0lDW2Pe?=
 =?us-ascii?Q?h9mpbyM6/bTTWVtdQAGfG8NvT6LWPn5UaP7XP1lFN3wZPJlO7Sy+ZiFGeAX8?=
 =?us-ascii?Q?IizaPqCJh96tHuQrzdHVEvLyvmd5CXRTWQT5Sfi+?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2c123a2-1b15-4c03-0ac9-08db88da6c51
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jul 2023 04:33:10.4055
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: puJevpEbdjMMdhEobnjpZ6nXKaFPysVQuNaN6LHzBksaHqRlTrkgitjWQAE9+X6KkZRYI25v67cEGWrXLyHJEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>

Thanks!

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Dan Carpenter <dan.carpenter@linaro.org>
>Sent: Wednesday, July 19, 2023 6:16 PM
>To: Cao, Bingbu <bingbu.cao@intel.com>
>Cc: Kao, Arec <arec.kao@intel.com>; Sakari Ailus
><sakari.ailus@linux.intel.com>; Mauro Carvalho Chehab <mchehab@kernel.org>=
;
>Hans de Goede <hdegoede@redhat.com>; Yao, Hao <hao.yao@intel.com>; linux-
>media@vger.kernel.org; kernel-janitors@vger.kernel.org
>Subject: [PATCH] media: ov13b10: Fix some error checking in probe
>
>The "ret =3D " assignment was missing, so ov13b10_power_on() is not checke=
d
>for errors.  Add the assignment.
>
>Fixes: 6e28afd15228 ("media: ov13b10: add PM control support based on powe=
r
>resources")
>Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>---
>Adding error handling always risky breaking the driver and I have not
>tested this patch.
>
> drivers/media/i2c/ov13b10.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/media/i2c/ov13b10.c b/drivers/media/i2c/ov13b10.c
>index dbc642c5995b..8ebdb32dd3db 100644
>--- a/drivers/media/i2c/ov13b10.c
>+++ b/drivers/media/i2c/ov13b10.c
>@@ -1501,7 +1501,7 @@ static int ov13b10_probe(struct i2c_client *client)
>
> 	full_power =3D acpi_dev_state_d0(&client->dev);
> 	if (full_power) {
>-		ov13b10_power_on(&client->dev);
>+		ret =3D ov13b10_power_on(&client->dev);
> 		if (ret) {
> 			dev_err(&client->dev, "failed to power on\n");
> 			return ret;
>--
>2.39.2

