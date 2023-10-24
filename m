Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CC5337D5390
	for <lists+linux-media@lfdr.de>; Tue, 24 Oct 2023 16:01:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234525AbjJXOBW (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Oct 2023 10:01:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234097AbjJXOBU (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Oct 2023 10:01:20 -0400
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3BE1FE
        for <linux-media@vger.kernel.org>; Tue, 24 Oct 2023 07:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698156079; x=1729692079;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=gVmJWkrldP94lJS4cpo2j2dWfGg4oXhVVfsZtpVP/S0=;
  b=UHhD73pLqpEZgFNpU5YPP0M9RSq8yTwnJLs6aGbFBChzaJwCcqpY2XER
   kKaXD9HlABGROqOCk8eHJqOdZP7gy3t+bRVw63a51CFNpfezTwTCfVSm6
   ubF1Kb8wdNv9g29MCXZe9XuI+1u0pG7avLDVG2+QdZVxZ7A3iB/Axa4cJ
   v2DxVKVoaslnsUKpg687aTqLTvyuyG5/Xd5X+V8S/cqD4APPu1WT9lUYb
   PxSnRZV9GizGBcs2X8c5lwiEUqFINyRayb37WyC+JO8poTry19MFVE/RU
   zOxcyTj6711kLypVIhV9CUzR70FUUui3SpLWzVTvCtlm3LtaL90hQwyZn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="5683676"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="5683676"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2023 07:01:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="762102369"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="762102369"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 24 Oct 2023 07:01:00 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 07:00:59 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Tue, 24 Oct 2023 07:00:58 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Tue, 24 Oct 2023 07:00:58 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Tue, 24 Oct 2023 07:00:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gWOq4WD767A7jNLjY4/q/LUjE0qlK00CX9Bk8jZpMJL+utwO+SNjLU/effyELOObcNXKHw4/Cef03dC2JY5tkXCVS9N8NA8MNOWAr1fR4qnFTJX8+x5SeP0/aSb70eK+kvLEDRYHeNzsNAUPTcItjdldFhqpVuygsJ/5qhTwm3K1En+3C9+6TQiOIj4buqZOAn/ADVXpFijyAS6dIgqNwq733iqA6/LO7y+UBzJSzCkus6k60LBp9KwWpaQu1eTJFVW8DK7yS1a17mXt0xMuDiOVUZJtDloJzqRXvsprBYETQIxUwKLu3aX2F+fpI36qSY1veAvhPvt9qwaP3nXBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VMtdjA8hWSHt9C1rzjqhU6mOcihrtI2yFknN/8AMMGI=;
 b=fKkUy62/0D6MvKMKKFsYGfjERyCGkaHrrdj1uMiwM156rbnC+OQydFvfGWt9dXDFCtB+ihby/fOqRpMIsZ6vrR6UWlQRm/w2NbzpyYLvNxriX+z6pRjeaziXREieaQxHwC2CJKM8wr4THRnjVDwStlGb0+t3NzhjP1Sd6du7/XC9xY0T3t3RStzYe9i5Ccb7gdXmDmFMLGGRRwkW3oTIb9H9dVOdPVo5OkRYn+mggFTGSj69/M5Yo4SVMq8yb3r3Ec9rYHi8o0jJ98ok1SsqfRB7Jcy8MaAmdAH4ijGPK7KJkbDjjdsaTmfEuFgY3lR6TLoEeDQWCEl9ilsSE2bkMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MN2PR11MB4318.namprd11.prod.outlook.com (2603:10b6:208:17a::22)
 by MN0PR11MB6057.namprd11.prod.outlook.com (2603:10b6:208:375::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6907.26; Tue, 24 Oct
 2023 14:00:56 +0000
Received: from MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5c3d:b997:c46e:f73c]) by MN2PR11MB4318.namprd11.prod.outlook.com
 ([fe80::5c3d:b997:c46e:f73c%6]) with mapi id 15.20.6907.028; Tue, 24 Oct 2023
 14:00:56 +0000
From:   "Wu, Wentong" <wentong.wu@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
CC:     Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: RE: [PATCH 0/2] media: mei_csi/mei_ace: Fix driver modalias not
 matching device modalias
Thread-Topic: [PATCH 0/2] media: mei_csi/mei_ace: Fix driver modalias not
 matching device modalias
Thread-Index: AQHaBmK/9Ridg+ECikyyegvQ/4DcKLBY9zbA
Date:   Tue, 24 Oct 2023 14:00:56 +0000
Message-ID: <MN2PR11MB431803D884CE96CEC12CF9278DDFA@MN2PR11MB4318.namprd11.prod.outlook.com>
References: <20231024101319.11878-1-hdegoede@redhat.com>
In-Reply-To: <20231024101319.11878-1-hdegoede@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MN2PR11MB4318:EE_|MN0PR11MB6057:EE_
x-ms-office365-filtering-correlation-id: 91546361-d2e2-4f87-bf74-08dbd499a4f5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uBHgJxmSZAS+MQT5668K6PEn9xj/yWvvSBTPH5qZwWNobAtfpkCSF37VPz2LGPpeTSTqvfBh05bSuLcUhaTpP+ilLO+oCzpeKqVyvlUzTJspeDq9Ed/5G/LoXT2E7QR5BkAKHKyHPVlDElK5egu3DmbLvo/aX2Xsea9bV9ZTN3qiqfrHDgxZRqikKNMq0otFGNLFJZ2JNe+VkJSQnmLWzcPf6bZm1SqlifjkzHnMkljrF+ICwgGcUku+HL8NlWVn+WwIzWw4kAu63hl5TGv7xYXQ7ZWicStmFflcPgdNkgKssHMjnGTHGOTALZVgS3BrqmLrprvsOm5yzzla/GAxDJWBfcLJT5j7LsPSnnnm3mAHL2Z/O8SPjETmsVHU6RoaA8AJmmCI4F5nBoGLFddx+a60PfhjM5pAeCWQPGc6Lxtre1GIWtrl9aw8q9mKCPJ86OhNkZicSO8oOMwjDrdqgOkQAU74tcwFDqi613HpXCCHOzS7m9KopYF6j9KHvPnk7qKMiu6qiQrLmxWQRtMBb3CDxbNKxiLsdCfcSmvLuyxxHJBcWvbXqlZY9Y/Vf0H5eXpbPpbXWg3fcYIuzY0vtMqJPlzt8jmRxeFTlwUjjzaVT0ZlxkXAgQ2sbDKrlB/HjxuCNdPGAhIZ370tg+u1mw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR11MB4318.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(39860400002)(136003)(346002)(396003)(366004)(230922051799003)(1800799009)(64100799003)(186009)(451199024)(76116006)(38070700009)(66946007)(66556008)(66476007)(66446008)(64756008)(54906003)(316002)(6916009)(478600001)(966005)(41300700001)(8936002)(8676002)(52536014)(82960400001)(4326008)(55016003)(5660300002)(33656002)(7696005)(86362001)(6506007)(71200400001)(122000001)(83380400001)(2906002)(9686003)(38100700002)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?sb1QgQ2FOs96a6FGNSrQm4KMioe+ms8Ak61lZnQjp69/z7PNcgV+DU17w/d3?=
 =?us-ascii?Q?OqYUhDoZP0rX4KyQ0Z/xDtH7rIK9/Kv5+8gYoYZlhyzW3e34ne4+Ye3Lt+gM?=
 =?us-ascii?Q?c0tqUOwoZ67HnXkMysvnzN3Vzv7yzZ6Qb0GrKcroPry8EU+mSHakMmOttE3H?=
 =?us-ascii?Q?+skg2UDEUx0R2Uoi/M4C5YP3xATbRuxVkITovmFwFnn3aH2kXGSFWoLin7ye?=
 =?us-ascii?Q?7Nw6JO3ZtlUltQuqM+ey1VpkXOxK4NuIaRyEghU13jCMOnV5pNy5iknZIjG9?=
 =?us-ascii?Q?oDo/ICVUTMTUj2mJgKdlNGkSAvHeBT9FptVPb03qH7t77TYo4MvdMw1Akc+P?=
 =?us-ascii?Q?jvZpGdObPJuljrw6Zp6yJFmRnvSO4yfp+RiNwc8AB4fNBREqlI+fzXLDQ6Gg?=
 =?us-ascii?Q?A1WwWChNE6cKW5HQEujNqfDzolPFd/m6o3+CLqsONNaxqiY9Kal8RayR8lts?=
 =?us-ascii?Q?Hd2YoaVylDiy14B4L7QWaBAwEQaDPaumpsMArMyn2Rf3xbPV7fBdVQ/M5skh?=
 =?us-ascii?Q?pFihOMpTHFKooT+na1MZjkdnIrSbo+2Cpf7laDfFjAKdD8PmIwml+Ru4CXH5?=
 =?us-ascii?Q?BszE2ggVqtAe6pBRXWSk8tdOZV8LAGaOYB7iP3uYkTWXNMHHv2jT5KCO5NFG?=
 =?us-ascii?Q?dsTKST2A52Rz1GxaIH07/t+wzp2EKcMX2Kh894dKg2P6elhEt1c1s87Pf6cw?=
 =?us-ascii?Q?PYgwqRKmGTt6hJ+SoMdV7FIwHen+k/o+57agCRGtrnoZp5fG1zebCwqOQRmz?=
 =?us-ascii?Q?HPfyW17b0H31GIsPGc8dYNskSA7u0C8FOFqssoM0bHO61+BI4rHVuaNX9TUW?=
 =?us-ascii?Q?IU89sySpLSxcmNy8PO9geYKu5xxGnHgCWCxBgSkp1rwekrjmarRVdjrC5oAR?=
 =?us-ascii?Q?IoiY+6f75COOnEuMB6bqOaXO+xkwaFx2eia5tAIsO1vApS4BsT8pxq7ZUWkR?=
 =?us-ascii?Q?H3lrEZ7urz4/egIVCOI0te0/KrsgUVD3llgwkOSH08S223zKs4w/J7jC5v/9?=
 =?us-ascii?Q?NKrffpPxJ9pPW7kjmTvOdTpeZFNjYxqk0Y4xYnXgcvZ4tEh/bIMIZSFzfNpg?=
 =?us-ascii?Q?ohSb5v2C14wshFUEIY6aY0zhDFb5iCJtsTRO9YhFVJlJwxMQ15TTkg0+XnLN?=
 =?us-ascii?Q?nCVF3DYOuy7B+C/mtaAPzff4IdspoD/V2e6Q70Ydo8Y2D0JHrnLkG6tM7qtN?=
 =?us-ascii?Q?p7qdifFMN/TxWrByIUJm4eahMtxaq0fLMXNDY9+2KW4IBRtZs9sw9uWFSL4e?=
 =?us-ascii?Q?Ry6t7bIwSoyz9jGR0iI52Dm5AGf08kxWvrndFKQ9LakA0xa5zbKOURyuySj3?=
 =?us-ascii?Q?XOjzNeDcIpYTNcCugwUKTbNwGh9rupqp2yLhqeaiZOjMzYLEqUdJYHCkSzRp?=
 =?us-ascii?Q?Qp2lk+8EfAht2pituAC1kcRgY8ARAWPLP44H9QYlArbRtrf42PgfN/SH+ZMg?=
 =?us-ascii?Q?9cvdHOsgXBLkdbNO96GBObBXbuaCqX7ggopMTkTDCzKZWEduLZQykY5fIprm?=
 =?us-ascii?Q?Z59cVtAen+TWB6RrAb8B+pVKFK2gT2Xom06vxfacslFH/GdA7jngAlNlhoFt?=
 =?us-ascii?Q?GgcD44Qja4u0fOK+V7ALVQ33s8Oxm+h196Nv/KUd?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR11MB4318.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91546361-d2e2-4f87-bf74-08dbd499a4f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Oct 2023 14:00:56.5314
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: G9d80zfc6dDT32my9gJq3DTHWPmcUjYjvIikg4HNm+oTuWd3QSfItsw7af+NzSy0QhmxfTveFI+pVDIrWYqPrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB6057
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Hans,

Thanks for your patch, but I think this has been fixed by below commit
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/media/pci/intel/ivsc/mei_csi.c?id=3D18e35ba0d89f89bdda8001c6b34b18f=
62917d10d
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/=
drivers/media/pci/intel/ivsc/mei_ace.c?id=3D6b6f41791b443e9d141ae254ec0de83=
3841497a9

BR,
Wentong

> From: Hans de Goede <hdegoede>
>=20
> Hi All,
>=20
> This fixes an issue with the mei device-id matching which I noticed while
> debugging an out of tree IPU6 driver issue which a Fedora user was seeing=
 with
> kernels >=3D 6.5 on a Dell Precision 5470 which uses the VSC chip.
>=20
> Note the root cause there was a different issue and these patches have be=
en
> compile tested only, please test.
>=20
> Regards,
>=20
> Hans
>=20
>=20
> Hans de Goede (2):
>   media: mei_csi: Fix driver modalias not matching device modalias
>   media: mei_ace: Fix driver modalias not matching device modalias
>=20
>  drivers/media/pci/intel/ivsc/mei_ace.c | 2 +-
> drivers/media/pci/intel/ivsc/mei_csi.c | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>=20
> --
> 2.41.0

