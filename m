Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF0DD6AC160
	for <lists+linux-media@lfdr.de>; Mon,  6 Mar 2023 14:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231249AbjCFNfh (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 6 Mar 2023 08:35:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjCFNfe (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 6 Mar 2023 08:35:34 -0500
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6AB8279B9
        for <linux-media@vger.kernel.org>; Mon,  6 Mar 2023 05:35:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678109732; x=1709645732;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=BJZujeI7qSOpZfCMEE5Hymzx69VtQEBuvdCKcUYk/4Q=;
  b=EGr74OtEBGJVMCxiKqS8xQv7/kDeCwriDH4STCmxj3fNEOBIsM55QtAn
   9ak1TJIE62I+WO8mWiLsoX/bUkz0UL3k1g6reMWn6TGbIw4/+QukGZf5X
   QBm6k2ayazL9TrcYxekw5P31fueJzfK4EBtNR8qNNwYL7yWNEYkKPtQVY
   CMZEx/jrWpCfG9r7BnbTvMZ1AXiQpmmj8nQZpmUPVVfRv3W9jSMirPJ0O
   hSaEIfTS2bMOOdx5KZzgnWs5ub//RXaeNUSoyT6046i0DG7MpxzRA4ti3
   M/yosBD7b/46i4T7IyuMqriF++Jt+VNWjCGfGD0nFm4UWZhZyhdt998hK
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="335573372"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="335573372"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2023 05:33:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="1005399140"
X-IronPort-AV: E=Sophos;i="5.98,236,1673942400"; 
   d="scan'208";a="1005399140"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
  by fmsmga005.fm.intel.com with ESMTP; 06 Mar 2023 05:33:32 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 6 Mar 2023 05:33:32 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Mon, 6 Mar 2023 05:33:32 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 6 Mar 2023 05:33:32 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jv0AJP+Dt4hxD4I9DrgSlU0efwMrlYdadptvenXLjbKkXDCUZKXg2Uo+o3xIDjbEyVZAlGdqp/FJ9rlhgs/rO6CHSbing+gGC8TV+1UxkNUYKZw+PXhO63IShH9pwCyBYn/NUco+rTtSX2JTFLvHg/gm741XGYAd8mjxRDqIvCYWid8GYb77FbIe8ZQwgdJRtWhYDvLTrbaQMtSyIeMI56KajexT7NeUIn07mfn2wiXI0WRV6YqEaUg4kHOt2WlkqZEP/4IKnjo9TRcmXMuO/ER+gQHv6PTUCzVFwf6J5jpQcj73IJpcsaihzCVKvggXOWOrGd7fm/+iLzwOhXoE+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zPaSyMPxU86mSY7uBKq9Z8KZ+qCFUCpfVLto8BdjDhQ=;
 b=WcYra21kFH2Pg7gFmM4EdE4wSv06t6r+wiz/eEaoLvvtMR1KI/oWK8YQs8LO8GYB+RZnrpHK0ykopsunZE2b7VNWvaZGSMsSB5jLG9QOECGpJtUXGhnO4f2+M0PlQYkOpEdr/v1k2zY3YVxtMkzOg52NTHxFVTfvY+BOGozcvYlusMHlH/P7gUW+DR3Y62XC2XHlzI+U4Mtu1+j/I9QMhnrGsO/hb5TH16uh3uc23VCQ0htdFu+9Qg7rKQoebDUpBdtQGlWWo8VmU2KDv15+vuLflq1L62NP0grfdA7JJukzHoTeiGLex3Uv+7/eznMAOI6bL1MEQzK9fSe7JGyNuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB7040.namprd11.prod.outlook.com (2603:10b6:806:2b7::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.25; Mon, 6 Mar
 2023 13:33:30 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3250:3daa:1e9c:b9ae]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::3250:3daa:1e9c:b9ae%3]) with mapi id 15.20.6156.028; Mon, 6 Mar 2023
 13:33:30 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs with
 HID name
Thread-Topic: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs with
 HID name
Thread-Index: AQHZTd1o89cH4VxJB0ilsqzCRginBa7toVQAgAAhZbA=
Date:   Mon, 6 Mar 2023 13:33:30 +0000
Message-ID: <DM8PR11MB565375ACA9BECCB175EE931199B69@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230303144432.2108677-1-bingbu.cao@intel.com>
 <ZAXN9EszoxHt+F7w@smile.fi.intel.com>
In-Reply-To: <ZAXN9EszoxHt+F7w@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SA1PR11MB7040:EE_
x-ms-office365-filtering-correlation-id: 9a00eee6-ad19-49fa-5320-08db1e475fc7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 80IMceAg/lvptT2e8riuMN1A6c4J+m9cmQTjqUHa1eg5GIY9384fNzT+ea0Z5n3yFDxDZ/3BECF7HIwOKUMDEix2oaddAaeZkicOFiMarHOXUiFmH+Y28CFlf6BCevhUdZvjztjYOQIsN5wO9G5OI1nlE85OpmqrQ+A6tfkeAneWGtD9mSjkjxUrBnXqC7EzIZERuIHfXO8kayZ9drsFCgVUoQ62FlTc5oBKu/1iSPdYSfVy829DkxsLgx2/UlehyEQsnf0wW96oeWfnirsCea5QpUuOZsf86xti9oG/GNecmZZpR7cEi0T51tH9H+ZtV5K3sGB481UeuCj3BBrEC0towUzkagkJIh4vJkNggwk22VErxpzGFeiwAt8OgoBiaAmQy9q+Ai7IiaHP248mjsh5wouQwU6pQqq4Sn8i6bo0brshR8nqjeqfEq8m170ju8mU72yHXLBTJTbRfoWwmzlzTjiwuCm8O6agNmgtH5v29rmZtab0nVxlw9+vJ2aHL3pxstAmY9kIOMcQ4fR5/YkI8BvS/8JeVutyjEklN6tLIEA1yosPCE7d+vAwoWsQVry5eZM82Dbnh2HWRYyfMfTPWDttoaS8zHFXMk40TF7N0GoyMchMZOgNkm1jO8PjRMvDqwRk2wspWD5utf5sfAGXie/2DGGUKgk7pfjRoJtM0sSzjy4YBrPH6uiksUyUBtgQmjm+b4WAXlZ0ktEjuEZlvNHnDpZp3rPANxLBQRg=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(136003)(376002)(346002)(396003)(39860400002)(451199018)(76116006)(66556008)(6916009)(66476007)(64756008)(66446008)(4326008)(8676002)(122000001)(82960400001)(55016003)(38100700002)(52536014)(33656002)(5660300002)(38070700005)(41300700001)(66946007)(86362001)(54906003)(8936002)(316002)(26005)(9686003)(53546011)(186003)(6506007)(7696005)(71200400001)(478600001)(2906002)(83380400001)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?t1HxdmpwB34yvYP89x01EtWmDJDF6B60j5cuRtI5sniw5a1H26uWjx0XJ8?=
 =?iso-8859-1?Q?+WoGeNAX8Aw8glz7AoKvqG1DFuRmq2qyVlx2owvs6PxxLclrpT3AeZ7xtG?=
 =?iso-8859-1?Q?7QZx1vPW4J7sxdmQwb2zZ4YA9Q/BmGffkxmGVG4cC3BI0CAAAnlYWayEf4?=
 =?iso-8859-1?Q?1/Pwrd2yCj+GmMSXAuUPmWVNCB/DB98pQ0wIwdMNUWW467gJNhUJKkLYDL?=
 =?iso-8859-1?Q?bgp7WXHwMDm6/Dgn/seRIZyQu8+tWE+JX9VfqSnojAFTDHMST75X5cHeye?=
 =?iso-8859-1?Q?lopJmyPRiTfN1iUqpro+YPf4CALQsZnD2wtXw1y4ZROHHXQ8tYgzgfF4Hs?=
 =?iso-8859-1?Q?4ZBttxwHPKy/ctCDyd//pnirq6B/Er0UdCojStAtXP7vD7EhAoSNOek1wP?=
 =?iso-8859-1?Q?hrHT/KgNqIQkODVzs4+rpWFa8OHAjFZeUJqA2nAijmfgQ2sf8nWwep6Rjp?=
 =?iso-8859-1?Q?VN4yu1Az9d/sH5G9NYqb6MW129BiT8F1LoZnQEAw8OTMWIk7Cf5nEMv7Mb?=
 =?iso-8859-1?Q?ZqV0o24WjPdeSnRz3ujNtNXCXb7TDKfGk7CbHV1tOfr7UjWWYgj+9JoZH9?=
 =?iso-8859-1?Q?7RHUzkKDh8DXD77+FK3p6ZvRfZWtHzXvVMj+a1Vv7EXLQqsAvsrlXhXQFj?=
 =?iso-8859-1?Q?Rkuz/nnBP1+Syxro4yIMryxgorFTuAFnFQhp+PjfUpj03grJym8yC06J0m?=
 =?iso-8859-1?Q?4Xfz35ZheuK/So7RvKfD1YyVe6mzfvOIhuKp/7GGpkrtXjAPqS1ZSqtD36?=
 =?iso-8859-1?Q?99qf79SqRPmh6gfAG158Ub39iuLeHPK1dYMO2k84RGOvK9NCnrAMjRIPO6?=
 =?iso-8859-1?Q?lqEhuYKhY8H9SZ/6wm4icyhOycigPD9xM4JP/5EpATsZbJhLMIyv+NTIC/?=
 =?iso-8859-1?Q?+GpgzWn9W3uae8aJSl70ktlk5chWfyPDfDbTwviMI9V9xVWZVU4lKsZtf9?=
 =?iso-8859-1?Q?n8Hx2GPbgI2hVcbIAJyWu54rQQxmJO6lvDDQAwMCpSQDxsExlpXiusEDrp?=
 =?iso-8859-1?Q?yM0yc7MLYj7cHF9xFxVjF0Gu7g+qu3th9+srOARulbHCTSp60xPPI6JJFM?=
 =?iso-8859-1?Q?1XDz3oOahzPcE83g0tl0J2MwYdGEZdiT/c33bnIlJVietDeJpvV33qsyC1?=
 =?iso-8859-1?Q?AhI7hAvS/pYJtosOwfa9d2kpoGCzSPFWvXGkx5JV9y7/PO5U/aeTFiOvwC?=
 =?iso-8859-1?Q?CceR2FXXRAqSvzNFLmmRen7CvdnrLK3XFJX/55T/oRPQ4g31EltrktupBs?=
 =?iso-8859-1?Q?HO1PWrvKwQPtoNlkKY6hmf8DI9L1NrWukbeMaU0M7hiKTEXI5TbSfZubcb?=
 =?iso-8859-1?Q?i2iUX25MbSV5bF8v9cRKlpeKxHMAI5fbEypFZS2LXrCwzZN2y/8Vj/mRme?=
 =?iso-8859-1?Q?3ywbSuagXGDl2KpfeJG1t3jaTpYMCbnb7BLV+50YasJoT3lA4jRibZWs4m?=
 =?iso-8859-1?Q?dIHSLfJt7HNwRZbRyA6KLje4NjWsVSUUpR75lm7FvG92amltLiTQbsUzOu?=
 =?iso-8859-1?Q?yHva+MwTedGd0OO/VVvlb27g8gLeno8WOa86PwEzyptsdLCjdwq4NfzBLy?=
 =?iso-8859-1?Q?CzIl21hO5qjfIzfZcb53j5BCnSRoswzsTlvrHmdIm0Tf/RIlbszjOmuofu?=
 =?iso-8859-1?Q?z+jOenENl9WjT4CtdUDAPGDszY+I4pKSv5?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a00eee6-ad19-49fa-5320-08db1e475fc7
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Mar 2023 13:33:30.1310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7D5gjcYKn/FuIdxPbWwLhpakqwxuBZD2YO3eOq1aZ6RK+iOw9EQkh7A6KdwUC0iJQFoYejGE5qVk3lBQV7hI0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7040
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Any,=20

Thanks for your review.

------------------------------------------------------------------------
BRs, =20
Intel VTG - Linux & Chrome IPU SW
Bingbu Cao=20

> -----Original Message-----
> From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Sent: Monday, March 6, 2023 19:27
> To: Cao, Bingbu <bingbu.cao@intel.com>
> Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com;
> djrscally@gmail.com; bingbu.cao@linux.intel.com
> Subject: Re: [PATCH] media: ipu3-cio2: support multiple sensors and VCMs
> with HID name
>=20
> On Fri, Mar 03, 2023 at 10:44:32PM +0800, bingbu.cao@intel.com wrote:
> > From: Bingbu Cao <bingbu.cao@intel.com>
> >
> > In current cio2-bridge, it is using the hid as node name to register
> > software node and swnode will create kobject and sysfs entry with the
> > node name, if there are multiple sensors and VCMs which are sharing
> > same HID name, it will cause the software nodes registration failure:
> >
> > [ 7.142311] sysfs: cannot create duplicate filename
> '/kernel/software_nodes/dw9714'
> > ...
> > [ 7.142328] Call Trace:
> > [ 7.142330]=A0 <TASK>
> > [ 7.142336]=A0 dump_stack_lvl+0x49/0x63
> > [ 7.142341]=A0 dump_stack+0x10/0x16
> > [ 7.142343]=A0 sysfs_warn_dup.cold+0x17/0x2b [ 7.142346]
> > sysfs_create_dir_ns+0xbc/0xd0 [ 7.142351]
> > kobject_add_internal+0xb1/0x2b0 [ 7.142356]
> > kobject_init_and_add+0x71/0xa0 [ 7.142360]
> > swnode_register+0x136/0x210 [ 7.142363]
> > software_node_register+0xd2/0x120 [ 7.142364]
> > software_node_register_nodes+0x83/0xf0
> > [ 7.142366]=A0 ? acpi_get_physical_device_location+0x65/0xc0
> > [ 7.142371]=A0 cio2_bridge_init+0x82a/0xb5e ...
> > [ 7.142448] kobject_add_internal failed for dw9714 with -EEXIST, don't
> > try to register things with the same name in the same directory.
>=20
> Please cut unneeded context of the backtrace as it's explained in the
> Submitting Patches documentation.

Thanks, will amend in v2.

>=20
> > One solution is appending the sensor link(Mipi Port) in SSDB as suffix
> > of the node name to fix this problem.
>=20
> ...
>=20
> > +	if (sensor->ssdb.vcmtype) {
> > +		scnprintf(vcm_name, sizeof(vcm_name), "%s-%u",
> > +			  cio2_vcm_types[sensor->ssdb.vcmtype - 1],
> > +			  sensor->ssdb.link);
>=20
> Is using 'c' variant a cargo cult? Otherwise explain, why dropping the
> last part of the number is not a problem.

Sorry, I can't understand. What is cargo cult?

>=20
> > +		nodes[SWNODE_VCM] =3D NODE_VCM(vcm_name);
> > +	}
>=20
> ...
>=20
> > +		scnprintf(sensor->name, sizeof(sensor->name), "%s-%u",
> > +			  cfg->hid, sensor->ssdb.link);
>=20
>=20
> Ditto.
>=20
> ...
>=20
> > -	char name[ACPI_ID_LEN];
> > +	char name[ACPI_ID_LEN + 4];
>=20
> Why 4 is chosen? This needs an explanation.

'link' is u8, so it is supposed to be max 4 characters along with '-'.


>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

