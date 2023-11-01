Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBD6B7DDC93
	for <lists+linux-media@lfdr.de>; Wed,  1 Nov 2023 07:26:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230397AbjKAG0t (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Nov 2023 02:26:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229569AbjKAG0s (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Nov 2023 02:26:48 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC07E98
        for <linux-media@vger.kernel.org>; Tue, 31 Oct 2023 23:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698820002; x=1730356002;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=hCWPoz6GJs04Tod27xNizNPAt5XfgNYZfHP57fd9oOU=;
  b=T3fNppSj9Tb/ZY0mb3s9BJisVSwe5H4BRcNZ7PVCcKNWqNSYxaI1JX3E
   AKK7JRdBTk9dIEGk0aRKM/HK9XV8xPhA+n3erqajJFdy40G2QOb2X1Mt0
   e6r8HRbaAAqodTdTtnb2JWZYDmoPA0lely1Mf4jyFJHP8kRc0seVO3kxz
   PNU+8yvQyNQQtRzISfASPyEZk6GhGfJ/mU63Xg3fTqAu+EoG7FitT1oG/
   VcTunCLs6CHEPxWWhdJ2wALShr+ObjEs/GJeU0TtsXfgo981QutEAT0wt
   we5Hs9zrhZqndxP369z5H/QeTvph0SuZF31YnDoHIpPvJMkSNJZoGRrs3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="474682483"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="474682483"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2023 23:26:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10880"; a="826666895"
X-IronPort-AV: E=Sophos;i="6.03,267,1694761200"; 
   d="scan'208";a="826666895"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by fmsmga008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 31 Oct 2023 23:26:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 23:26:42 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Tue, 31 Oct 2023 23:26:41 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Tue, 31 Oct 2023 23:26:41 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Tue, 31 Oct 2023 23:26:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VaWCy0idhbjP5toohDOIbFnnnZV7hKL6W0jS9W+x2xCo5f0z0Wq7h5YSYM9Y3N4vpLeQ0dXK4ll2O0wgiA3wd8ub109oHAvChyVg7uPHn/MYEmOSFoihUJuea+bVT39eR9k7KbAS+9XbURwew2QVV7+NCLJTKRltBBTYOQGvQI8HZbJ3LuYP1oPf1j6YbeCDBu0Mu/YgA+5mnLaro+59QDF2vbgGZo6g5PZBWRHI50okd2NVJT46SPbarLB+cGlRFjP5GDRancLLg4xwgCIqoWzus0g+BvD4JSa6+0cpXFHL0k9zXTiK+WS9mWDMST923ZBFrA/fr3J2a9qi6WVIvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kkB76hr4VsVZl1ktotMV9iSSZgI+t/xx2r6M3iAwEyg=;
 b=gh8uO3RSVKDqDcYdgwn9zbRQCk0o5AQesbJaVd3X7m4erkpC41Vywj0hLX6b5bQHCe9rFUdBL/4C95xnbVecWq4aU7rvi2xAVhHsvD9Sl42jcg2G1MXtfAalCloHzcD0CsF6rPaJoOn/y89XCdVQ6MZArNwE6Bv796Djk/RkSMw1Sq4qkJbwZk7Ujbxbz1AGVCzu430cEwpY5R0TOxWzml1uXrrYjNdjz4qPvrS3VIWxa03MCSobVwHFRU0+5CyTKcDSVdlxOZ7wyjn2xrDWAVfTVnx3v1KZhoP9YlnlyGWPnZnI+AhpLQVZ2ohyKDCebhpVS0pEywgY3HdvNKCywA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 LV3PR11MB8766.namprd11.prod.outlook.com (2603:10b6:408:212::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.27; Wed, 1 Nov
 2023 06:26:39 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9818:3765:1b10:1c5a]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9818:3765:1b10:1c5a%7]) with mapi id 15.20.6954.019; Wed, 1 Nov 2023
 06:26:39 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Sakari Ailus <sakari.ailus@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     Bingbu Cao <bingbu.cao@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Thread-Topic: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
 device-link between VCM and sensor
Thread-Index: AQHZqSDTvmce4y3l2U2ALjubC9kVbrBixHeAgAAG7ICAAADDgIAABzUAgALxaZA=
Date:   Wed, 1 Nov 2023 06:26:39 +0000
Message-ID: <DM8PR11MB565366E1CEB9BB5F8F1074CE99A7A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <20230627175643.114778-12-hdegoede@redhat.com>
 <d1736dfb-e66c-2497-a71b-97f2e28f435f@linux.intel.com>
 <ZT9vfSpEyVk_pO0H@kekkonen.localdomain>
 <8ec5d2b6-8f35-48dd-bb09-4e214415d643@redhat.com>
 <ZT92LDE9z46kxX-h@kekkonen.localdomain>
In-Reply-To: <ZT92LDE9z46kxX-h@kekkonen.localdomain>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|LV3PR11MB8766:EE_
x-ms-office365-filtering-correlation-id: 3425d966-2dd1-4e9a-c61d-08dbdaa381cb
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yYzQAhWz7KWVUnVa/VUAlSBFG21GBgmmLwwg4JJ3zl+IAgiyJRcKqyBK8yG7tonI3xR0tls/xwjSoblwGri4KzD8JNqIjyhxUL+a9ogDDSbWsXoC4TX+gYBOpA/MStATeOsQ/kRYTxokjONtiHqEL11xh15Ryhj5sVDCBNlSXzJqWg8j4stFnp96jgPxXLNzmegm+MOpHyqdylrB6wocSkBI3JCUuBY4+WDRDTicNVZxKUN9VeR6xyt23yhLkV28IBu/uF1B09js7kn7vo1XtBEEBMpyQUdGz4ZGBm0Ubppzuta5j3jOvtdC7Pfmd4YwdFN6F2IPus2r30nnjyc3iCbXZk82AU2AwybMYE9f6nlml9mh3+cMgyOVjtBq0xbUpe0Motb8XaiwdRv1niAT1sdFISGvaalqTClpGCNirwSOraAiqbQexv0BZ1Iwl/ZS3pveLo3rSiV2uQTzW+OPMMaJzckFcow+ztePISxzc0TKz0j9jGgwabsAsttxszvKzeK5oaNnBAqxuEb2h3gmnG4pMG5vobi0xNgmtoNgmqb0Asz6xJdj5ThvTnqGyAKvTDE5b/k0Y8hfv9SWFMmnL2z4YxEYQW9rH6qrY6AeRs0Zm7Znc+qkHzMdCkwsCkX2
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(39860400002)(366004)(346002)(396003)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(38070700009)(2906002)(55016003)(33656002)(5660300002)(41300700001)(52536014)(86362001)(4326008)(8936002)(8676002)(316002)(7696005)(64756008)(122000001)(38100700002)(54906003)(82960400001)(66446008)(76116006)(66556008)(83380400001)(66946007)(110136005)(53546011)(66476007)(71200400001)(26005)(6506007)(9686003)(478600001);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?j5ijc2GXTgyuThWOFvNfV/BOsc3pLpan6MsFbR8jcm1FkjI8Q4abDjZU7DU2?=
 =?us-ascii?Q?UiUdvs9X1UCgZKZmMH/NeGhvcZmaw9Yg+Ihj6p7dHFllwvTq2+VEFkmwAYax?=
 =?us-ascii?Q?GLCmQY0qWM2vI+U/nNsQlYIIq9r0Ab2nMv8Vfw3xeak5akoSYAi3TcrTjVSd?=
 =?us-ascii?Q?PxB4cLS9aCJfh1mWgjiINAItmUCa7iLYDolFtAAqmTZrUPacYM5tSfpvweGB?=
 =?us-ascii?Q?UMyW67SoHQ6VANlhvpTLcJ2t3odUSaWjBHpY6lCw00n0nw7DcUCLpw/FodK8?=
 =?us-ascii?Q?D6lpEejBMliXRydNkBqYZExfxa1buC1kdUiSptyaXThbwl4RrgqaNy3UWV24?=
 =?us-ascii?Q?V2IrPq4Nj8JUE54kD6Tl+gMSiQINqH1+d826lRHKSQESu5YUrqHNN2XThRvI?=
 =?us-ascii?Q?FiIXHH4Jmxh3qiLKhUCFKuNkS4dS/uqO+Tv0jvNBJbRXQbRpX3UJtagxcrtL?=
 =?us-ascii?Q?lIm3Lgnv3OnBU9enYTH6yiMY3hIVuxu4FRA7fJ8ixH7IHl+2X8UvjmOlaxQ0?=
 =?us-ascii?Q?KYlQClHsh8XHkBbNpQpd0zfKG+1/LlfUsdiuXnoZ6ansEw9X7T4ofcPVxaM9?=
 =?us-ascii?Q?hTQscjzfGoDMHL3CcG+v5p0LaptxlusduIHwJ8HccKrIHefLZ35XkOp65WwB?=
 =?us-ascii?Q?gblwZQHgp8QSbvilIgpHMRROJr7IGsXkXsY23N02yWG/Ow6i1B+neQKpF0Lh?=
 =?us-ascii?Q?fkPdButCBHDtYHDovkD5USiAvLkXpVsshk/lKct+htd7x4C5Cmj7R9CVqe4Q?=
 =?us-ascii?Q?UMbMn/cG4nFWsqi6h2+Vd+iZYQxYa2esC0NSroIQlgamvdbhSjS9aWPTj2KV?=
 =?us-ascii?Q?CU6+UgStgxuAHm/9vRY2zZL8goBUEtAzic89REYUWrH0Mf2vcRFkJHcO7+/3?=
 =?us-ascii?Q?ejHMNzoBZ2iPoee/FtjPty7jj3MgmnU0wFTtHND6VVtC26SziPars1EmOnJ9?=
 =?us-ascii?Q?5P4IvbqGJ+2spJrL55q3pehzG7UFCRDWU5HmlUVQ4tISdNK9VUKl3NAIfctm?=
 =?us-ascii?Q?0I3o70W9FPJq37jYzeh/obakBYBLQFOSKyOyfWDT1xfsmkmpBoPLy0iOVh5Y?=
 =?us-ascii?Q?D9HjOtvsivMH1MWiXg1edN3ZKd9C0NdTGCPhN2yqVHQTkpR7WvmIj2MFq6K5?=
 =?us-ascii?Q?GhP1rsV/BvrCjJ5ED2TSy3fofnTZhbwebaf/m74waRdDSGuNQf29ROO0Z2ZB?=
 =?us-ascii?Q?hpCdKI2sHLRjbobIAQ5eXa1T3RByvY84V72A+CqpDQmynCFy92A4mHg03S5v?=
 =?us-ascii?Q?63dngoWY2Wd04xZYKJ3Ja2qxneh10LYVnw+jkzlB/U769hvtdcl1xo2Nx/7F?=
 =?us-ascii?Q?aqYjzt1j/hegW1InLXsndY7r/wXQs2mtDs0vx0xitScN0sBFZKOVRXStG1gX?=
 =?us-ascii?Q?d3UO0cyeCFAlC/qB/ZmgpEuSfTF63odqJGOerLmsy1una7NLOaZGlHt/7TSy?=
 =?us-ascii?Q?Xc6H4EeXFR7M4pt5XHMKQwj5oYEdZnAskJxz7ElsM69YP8ZDWepQpDH1r4Ei?=
 =?us-ascii?Q?B2PyDNN+yHJ9O1uIOsbzBSIX9tY9Kgrp6v9mylx+GUPywyACWV1eVBptaSfG?=
 =?us-ascii?Q?ICy2IshKoNfrA9RFAieiHb4WDRJ/QZo2On9rEuX6?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3425d966-2dd1-4e9a-c61d-08dbdaa381cb
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2023 06:26:39.4637
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: cWn1oobcOkvWY83JJaUcSIZpvuzwi779+qaozwdvADvQVyocVTKDbaSvDhEQsFBwSP6ZtjxT81P/+8LeSEaFew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8766
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Sakari and Hans,

------------------------------------------------------------------------
BRs, =20
Bingbu Cao=20

>-----Original Message-----
>From: Sakari Ailus <sakari.ailus@linux.intel.com>
>Sent: Monday, October 30, 2023 5:24 PM
>To: Hans de Goede <hdegoede@redhat.com>
>Cc: Bingbu Cao <bingbu.cao@linux.intel.com>; Laurent Pinchart
><laurent.pinchart@ideasonboard.com>; Daniel Scally
><dan.scally@ideasonboard.com>; Mauro Carvalho Chehab <mchehab@kernel.org>;
>Andy Shevchenko <andy@kernel.org>; Kate Hsuan <hpa@redhat.com>; Cao, Bingb=
u
><bingbu.cao@intel.com>; linux-media@vger.kernel.org
>Subject: Re: [PATCH 11/12] media: intel-cio2-bridge: Add a runtime-pm
>device-link between VCM and sensor
>
>Hi Hans,
>
>On Mon, Oct 30, 2023 at 09:58:09AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 10/30/23 09:55, Sakari Ailus wrote:
>> > Hi Bingbu,
>> >
>> > On Mon, Oct 30, 2023 at 04:30:39PM +0800, Bingbu Cao wrote:
>> >>> +static void intel_cio2_bridge_instantiate_vcm_work(struct
>> >>> +work_struct *_work) {
>> >>> +	struct intel_cio2_bridge_instantiate_vcm_work_data *work =3D
>> >>> +		container_of(_work,
>> >>> +			     struct
>intel_cio2_bridge_instantiate_vcm_work_data,
>> >>> +			     work);
>> >>> +	struct acpi_device *adev =3D ACPI_COMPANION(work->sensor);
>> >>> +	struct i2c_client *vcm_client;
>> >>> +	bool put_fwnode =3D true;
>> >>> +	int ret;
>> >>>
>> >>> -	snprintf(name, sizeof(name), "%s-VCM", acpi_dev_name(sensor->adev)=
);
>> >>> -	board_info.dev_name =3D name;
>> >>> -	strscpy(board_info.type, sensor->vcm_type,
>ARRAY_SIZE(board_info.type));
>> >>> -	board_info.swnode =3D &sensor->swnodes[SWNODE_VCM];
>> >>> -
>> >>> -	sensor->vcm_i2c_client =3D
>> >>> -		i2c_acpi_new_device_by_fwnode(acpi_fwnode_handle(sensor-
>>adev),
>> >>> -					      1, &board_info);
>> >>> -	if (IS_ERR(sensor->vcm_i2c_client)) {
>> >>> -		dev_warn(&sensor->adev->dev, "Error instantiation VCM i2c-
>client: %ld\n",
>> >>> -			 PTR_ERR(sensor->vcm_i2c_client));
>> >>> -		sensor->vcm_i2c_client =3D NULL;
>> >>> +	/*
>> >>> +	 * The client may get probed before the device_link gets added bel=
ow
>> >>> +	 * make sure the sensor is powered-up during probe.
>> >>> +	 */
>> >>> +	ret =3D pm_runtime_get_sync(work->sensor);
>> >>> +	if (ret < 0) {
>> >>> +		dev_err(work->sensor, "Error %d runtime-resuming sensor,
>cannot instantiate VCM\n",
>> >>> +			ret);
>> >>> +		goto out;
>> >>>  	}
>> >>
>> >> One question here: how do we make sure that the runtime PM of the
>> >> sensor is enabled during the .bound callback? Or is it a mandatory
>> >> requirement of driver of such camera sensors?
>> >
>> > The sensor driver needs to enable runtime PM in probe, otherwise
>> > this won't work. But I don't see why a driver wouldn't? Of course
>> > otherwise it wouldn't be a hard requirement.
>
>I meant to write "wasn't earlier a hard requirement". This could also be
>documented, I can write a patch for this.

The problem here is that some driver doesn't enable the runtime PM before
v4l2_async_register_subdev_sensor(), that may cause race condition and
VCM instantiation failure as the runtime PM is not enabled yet. Then there
is no chance for VCM instantiation to succeed.=20

Does this 'requirement' or limit really make sense?

>
>>
>> Right. I believe that having runtime pm support is more or less a hard
>> requirement for sensor drivers used on x86. This is also necessary in
>> cases where the power on/off sequence is (partially) implemented in
>> ACPI AML code in the _PS0 and _PS3 methods of the sensor's ACPI device.
>>
>> This happens on [atom]ISP2 based devices and AFAIK also on ChromeOS
>> devices.
>>
>> So I think it is safe to assume that sensor drivers implement runtime
>> pm support and in cases where the driver does not we need to fix the
>driver.
>
>I agree.
>
>--
>Regards,
>
>Sakari Ailus
