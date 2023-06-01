Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CEDE71932C
	for <lists+linux-media@lfdr.de>; Thu,  1 Jun 2023 08:25:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231278AbjFAGZU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 1 Jun 2023 02:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44112 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229689AbjFAGZS (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 1 Jun 2023 02:25:18 -0400
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EA50134
        for <linux-media@vger.kernel.org>; Wed, 31 May 2023 23:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685600685; x=1717136685;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=R90wrdk1+Hte8C9BenhNe0ReJHws0ymYFouJA8rbEp4=;
  b=DASFB5ww9cVPJ57us8kHjyojV86WmTM0Q1BTBvFvrvnaMKvnkHbPhY6m
   /OJ1PMtJX8f10ITrIXM1stJZWmO+s156bhvkNUsjKStABlbmxu2YOotC1
   xz7OO36yh10DScR7qHWHmCfOlhXZ7XRanmzffmmGcIEJWmWmgtMPVFdA4
   fUkgEGUGD/1YBNM77ovYxV17dR4dFXbvg8u9+LDqf/UvTbZTzUxht4BhH
   CqMRUWjA9i7SeR2mqIg0pVDnAHS0KKT0e8WdnpV12+a5aKqG8Im51toZv
   1rKQz/acaulxk9y/SZc2mNnT5Y5KewEFVZtCKACPv+JCQuu3i4aJcdP29
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="355474272"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="355474272"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2023 23:24:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="684720084"
X-IronPort-AV: E=Sophos;i="6.00,209,1681196400"; 
   d="scan'208";a="684720084"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga006.jf.intel.com with ESMTP; 31 May 2023 23:24:30 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 23:24:29 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 31 May 2023 23:24:29 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 31 May 2023 23:24:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 31 May 2023 23:24:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nyh+m09YGoyQIDyUr5uGzdDvmc90m5+lqAzglLmzCCtiUpBKUTz4dWDIdT8MNZsx6sAcopAtLQq2ZhTEK3gOdBvm7xY99nsjJGNgS7JwZIO3014vlDNzsSqGwFIVpsXQZEy0Jjw1tgyyzn0gxcIuvdhukyyTW/oFZ6+7pdoKJZkILRGx32ir5OhJvh1cWyIKicECyJ2QiDqrUOhWqWT9KjQZNgs5hRf5onPI8+sxyNfyKaigcrt34VGLPQNoCIPf6l/jl2pu2VFhXhLqbzd0gHS/NgwIQ4siVvQoqUGP5y2lmH2KC7GjETQ7B+lpOPucRcKCtTdsqFF7jryQ6vZlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R90wrdk1+Hte8C9BenhNe0ReJHws0ymYFouJA8rbEp4=;
 b=jd9OfZ/TWol4bMOJ1XwwyLHPjcyQlM5f4K0dFeMCtKUxDgk1U8SiU/qjkrIPh/6WeCLX0NztuDxPT0+82JYYIfO8m78NPODnQunHLLkCEE2/qebNXT/lMl7YGhItP90ln8X5tV9ROkaKUcNBqVbIUH03MApym31VQUfHy5tbFzNaX8hQBFHWyyrlLv1k0qvXcdm0wPT3pYJldV6BoqMkDP2Z2QZHBmrcnu7vCOozI/8ZdsBBQ9TUWrbxhRDSKivpFiEznGz9eJ1tmqbP4+WiAYBliKrbuvxuiGjxIxWsYlwLMFuPSlnvrUuXO+0rKW2sVrdACjZR9/B84CamFjKIpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 SA1PR11MB6966.namprd11.prod.outlook.com (2603:10b6:806:2bc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Thu, 1 Jun
 2023 06:24:25 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543%5]) with mapi id 15.20.6455.020; Thu, 1 Jun 2023
 06:24:25 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        "djrscally@gmail.com" <djrscally@gmail.com>,
        "dan.scally@ideasonboard.com" <dan.scally@ideasonboard.com>,
        "Yao, Hao" <hao.yao@intel.com>
CC:     "markgross@kernel.org" <markgross@kernel.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "bingbu.cao@linux.intel.com" <bingbu.cao@linux.intel.com>
Subject: RE: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Thread-Topic: [PATCH 2/3] platform/x86: int3472: Evaluate device's _DSM method
 to control imaging clock
Thread-Index: AQHZjfGHQ1+QogX8WECispvOpNfT8690cCQAgAEW+qA=
Date:   Thu, 1 Jun 2023 06:24:25 +0000
Message-ID: <DM8PR11MB56534308813BEBA5496A796C99499@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230524035135.90315-1-bingbu.cao@intel.com>
 <20230524035135.90315-2-bingbu.cao@intel.com>
 <6baeafb2-29bf-ab70-2e4e-eea55d6af440@redhat.com>
In-Reply-To: <6baeafb2-29bf-ab70-2e4e-eea55d6af440@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|SA1PR11MB6966:EE_
x-ms-office365-filtering-correlation-id: 370559a8-a016-4198-3ca5-08db6268d880
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +NA7n0u4lQZ8008eysbRvrKqi3kOwIpBNqbkaEMhpg9ir8kgoCtkKkeKofoK46C0sMyINgXZKIdbaWRVJiyfTDCnZZlbJQQxAtbvj3d2Q2CecTMYbzD+PeKuUgGCDTeB8147WfVlYmPBL7KDfFZXy1K/e6+nDHavO17OecnAHmnInUqix99BEaSggsoktgECrUCxVBvvLnnuwiulAf7q+FKjQ9RUQkScIpaUGJhu/1PJ7iRR9EzPdAIj6Ro62bzRK6KoN2hKidET4Qa5jqraLde+sf1odpi4KZF558qw8k6A328bY8FTJGv/vdlhv/iZnuV/Q/q0Jjr7v6/Sg93jpr8qI9V71InUCixOI9jNI0WewS6fwqfm7t0LN5P/K9eD97gXGC16lwittYF97AbRrXw0j2o4Sj4pLvLcudhFHN0Cu06sI8ebWX8xafc7H5QEt5+2Lk2Pl1x2HjGAAzrDgEvoimREZs0IwiExkDPtQ58hfxdVcvLNG74TXXYGvHHEg4moOJ5FNjZnAWfawJ9wkaS/wSnTZt+jx4XypDuIFfYXdjUSyAZV2CTlzYsnTMybryB5Q95PsH3V4792/ZdxOAlq1delkhInVlE+ioKL9QPUuGV1cBTUPVh+VtyxSn7OxqFtdr+tfN/yfFeVh76C9w==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(396003)(346002)(39860400002)(366004)(451199021)(52536014)(66476007)(4326008)(66446008)(2906002)(76116006)(41300700001)(316002)(8676002)(66556008)(66946007)(6636002)(64756008)(54906003)(110136005)(5660300002)(8936002)(7696005)(186003)(6506007)(55016003)(83380400001)(26005)(9686003)(86362001)(38070700005)(478600001)(71200400001)(33656002)(122000001)(82960400001)(38100700002)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZEVjL213QzM5Y01kemdoeWc2Rm1xRWhlQTlrWE5JeHN5cnhrREEzMCtzejZz?=
 =?utf-8?B?SkRFUmg3TGlSOWZDT0l5ekFvQnVtM2kzdy9YU296d054bytidEZNajgydEhq?=
 =?utf-8?B?Y01MbFdKcUx2Y1BvSzhSUUF1dGVXOUVDbUlCc1BVc0NCaEdmM1EzZU1Xc1I0?=
 =?utf-8?B?TWQ4Z0hwZThmOCtkK2ErQlYvN21KaldOUVFqNjkxZ3VIQVEwVzE4bWs2MS94?=
 =?utf-8?B?MExRckJuenF1RXFYblZFdWttaXhPSm50dDhORk9QZmpFOUNCcDVSM2RJSXZD?=
 =?utf-8?B?VWtQcmhkUHM5MXhYY3pVbXhQbi9jTWNzaG82MStTL3k1M3RpVDllTGo0WXpi?=
 =?utf-8?B?RE1CL094U0lZVEJIVmhISUZFZkdVdEpOMDFUTjFhNlFqY0dPZDQ4OVU3aDhJ?=
 =?utf-8?B?b0pMWExnWlFHK05KV3RRU09wUy8rcFlSeVNFVTM0Z3plTEl2OWhkUXY0azFv?=
 =?utf-8?B?aWRNSDJxaWZpK2cybE1MaVQwOFo4NzV6RkROVHVpS0RPVURVUktPMElkQVlO?=
 =?utf-8?B?b2hGNHNvdlpETWc4dFlOZWZ3S25LWWVqTm53RWoyendBbS9FM20vaTcySXB2?=
 =?utf-8?B?UmcxRCttNW9zaTFUNDU2di9sREhOZ1VXdEFOeEgxOVhLNmgyVTRDcXdLOTFp?=
 =?utf-8?B?V0pySHRpY2EzcUF3T0svL2FRT3lLblFyZ2w0Z1FtM3dYOVhiWk9CeWNzZDI1?=
 =?utf-8?B?SkY2Vlp4Y2ZCSWJwSWRkNVFsLzdteDA0QlRPZTNndGRYcGwzKytBZk8yc3ha?=
 =?utf-8?B?VTJHRjRxcEZhRHZYUUVrUitYRFJEN3dYbW5FYkhZY1ZrSXNJZUVKZmtCOTVU?=
 =?utf-8?B?OXRyMnBUQ1U2c0xZN0dtcFRadWRsblljMkoxRC9KUzBna0h3RGFpMGdYZFFp?=
 =?utf-8?B?a1QwY0duOXdNVmExU0RlOXhQV0VxSzI3N1ZjYjJtdVd4ajBJU2tBWlFpL3py?=
 =?utf-8?B?MWtDUXgyUE9STGlUckh5NDVBZmJYSU82NWhrcHRJR0EvMHFmZWRFTHhTQ1R1?=
 =?utf-8?B?TVlyN0lLT0loaEsya2tPQmZaVG9iNTZuQzBTVXhnSklIODNyNW05alRpeC9Y?=
 =?utf-8?B?Z1JCTlV3RjM1WEtMWjJEV1hqM2hmTVVhUVdOd0JQbHNhdG8yVzNPZ2JGQzQz?=
 =?utf-8?B?alZvaGcwc3JxeGhGRDhBbFhBRERSN3BIaktSeFlWRkptOUxRcERoT2VOY1B5?=
 =?utf-8?B?N3Awc1pXK3JCd01GdGtUWVc0Q1U1Vk5ORitqNEo2bE9OWXpUQlFlanRraWly?=
 =?utf-8?B?dlg0ZlRsSDFRb1RZWkRVVGNYNWgrR2dUSWtQSnVrTWJYb3pPS3NCdXQxYXJz?=
 =?utf-8?B?ZUh2R25SSGdJMDlKMTE4RjJ4b0xpRkplSTZBSVoxNTBlSklnNTQ2R2xONjhy?=
 =?utf-8?B?TzNXV3MvVHpoMHQ1WktiK0Vac3hLS2kyaEh4OEFyNGJaeU0zdVAwV3k0dW00?=
 =?utf-8?B?TGRLc1ZjT3QvRTRNajZaWW9XdDc1UzZtNlMzMVp6ZWZ3Qk9tM1lKZ09Td1pk?=
 =?utf-8?B?WXBIcExDVUVvbWY4WDk4dWZyRzRjcWRMaC9GWE9NU2tEbHJwb2J5TU9GRWFU?=
 =?utf-8?B?RmlBZE5oSW8wTUV0eHdDMFo3aGo0QmxNRTJGZ2tuT3M2dkVqdzNtSktpdUJ5?=
 =?utf-8?B?ZHUvWFR0aGx1Z3VvNXZSLzdTYTZUNjNVbWcyVy9USSt4ZGJZZzB6R253VUx1?=
 =?utf-8?B?cmlpQnJ6RElJVHZiVTVERGptdDBWc2VHUWtzaEUzeDkxanJPUWJTWkNRa3Vz?=
 =?utf-8?B?OEJDRkZyTVVOYm9BTExnelhqZ1lXQ1RlNTNHVEVBMHE0MFpKb2tOVHhOeGJC?=
 =?utf-8?B?RW85ZmdqWGNKaTByVDJ3bTYwNzJuTDhpcDZsQ2lEQmhnL1lrVlNDblJVdnVP?=
 =?utf-8?B?TnlYN1QrUVArRGJBd3BENUxvUTBqUmdCb2JzS0xsZmpWMHQ3cVNzRmpYR1d1?=
 =?utf-8?B?S0hxQm9FcmIwcjlxZWl1aFpBbGJaNkZFUFIwcnU0RG9scVpmWVRXREVDdVNW?=
 =?utf-8?B?VFdkajdETlJlckNRcnB1UmptK0lqYWEzekthckhrSnpXRVB0UmtOQUNaTGVS?=
 =?utf-8?B?ejRkcU9rL1VCUGNLUmtOeG9EY05oMmFwcHE4a0tXQ0JUbWNXWjNlajFDRHVt?=
 =?utf-8?Q?Oab67SGi+ScO5SY5UKcdBRZUa?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 370559a8-a016-4198-3ca5-08db6268d880
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Jun 2023 06:24:25.1139
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zNSiaAtGLpf8cT+8hmCpIwyt1Dcdzh4AMeVztCbIcme5vJqNc3VwKHkUbTcnGtkHPolORoIT11niOoZt73YR1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6966
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGFucywNCg0KVGhhbmtzIGZvciB5b3VyIHJldmlldyBhbmQgdjIgcGF0Y2guIA0KDQpIYW8sIGNv
dWxkIHlvdSBoZWxwIHZlcmlmeSB0aGUgdjIgZnJvbSBIYW5zIG9uIHlvdXIgc3lzdGVtPw0KDQot
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0NCkJScywgIA0KQmluZ2J1IENhbyANCg0KPi0tLS0tT3JpZ2luYWwgTWVz
c2FnZS0tLS0tDQo+RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj5T
ZW50OiBXZWRuZXNkYXksIE1heSAzMSwgMjAyMyAyMTo0NA0KPlRvOiBDYW8sIEJpbmdidSA8Ymlu
Z2J1LmNhb0BpbnRlbC5jb20+OyBkanJzY2FsbHlAZ21haWwuY29tOw0KPmRhbi5zY2FsbHlAaWRl
YXNvbmJvYXJkLmNvbTsgWWFvLCBIYW8gPGhhby55YW9AaW50ZWwuY29tPg0KPkNjOiBtYXJrZ3Jv
c3NAa2VybmVsLm9yZzsgbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnOw0KPnNha2FyaS5haWx1
c0BsaW51eC5pbnRlbC5jb207IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsNCj5i
aW5nYnUuY2FvQGxpbnV4LmludGVsLmNvbQ0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8zXSBwbGF0
Zm9ybS94ODY6IGludDM0NzI6IEV2YWx1YXRlIGRldmljZSdzIF9EU00NCj5tZXRob2QgdG8gY29u
dHJvbCBpbWFnaW5nIGNsb2NrDQo+DQo+SGksDQo+DQo+T24gNS8yNC8yMyAwNTo1MSwgYmluZ2J1
LmNhb0BpbnRlbC5jb20gd3JvdGU6DQo+PiBGcm9tOiBCaW5nYnUgQ2FvIDxiaW5nYnUuY2FvQGlu
dGVsLmNvbT4NCj4+DQo+PiBPbiBzb21lIHBsYXRmb3JtcywgdGhlIGltYWdpbmcgY2xvY2sgc2hv
dWxkIGJlIGNvbnRyb2xsZWQgYnkNCj4+IGV2YWx1YXRpbmcgc3BlY2lmaWMgY2xvY2sgZGV2aWNl
J3MgX0RTTSBtZXRob2QgaW5zdGVhZCBvZiBzZXR0aW5nDQo+PiBncGlvLCBzbyB0aGlzIGNoYW5n
ZSByZWdpc3RlciBjbG9jayBpZiBubyBncGlvIGJhc2VkIGNsb2NrIGFuZCB0aGVuDQo+PiB1c2Ug
dGhlIF9EU00gbWV0aG9kIHRvIGVuYWJsZSBhbmQgZGlzYWJsZSBjbG9jay4NCj4+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBCaW5nYnUgQ2FvIDxiaW5nYnUuY2FvQGludGVsLmNvbT4NCj4+IFNpZ25lZC1v
ZmYtYnk6IEhhbyBZYW8gPGhhby55YW9AaW50ZWwuY29tPg0KPg0KPlRoYW5rIHlvdSBmb3IgdGhp
cyBpbnRlcmVzdGluZyBwYXRjaC4NCj4NCj5CZXNpZGVzIEFuZHkncyBjb21tZW50cyBJIGJlbGll
dmUgdGhhdCB0aGlzIGFsc28gbmVlZHMgYW4gYWNwaV9jaGVja19kc20oKQ0KPmNhbGwgdG8gc2Vl
IGlmIHRoZSBEU00gZnVuY3Rpb25hbGl0eSBpcyBhdmFpbGFibGUgYW5kIHRoZSBjYWxsIG9mIHRo
ZSBuZXcNCj5jbGsgcmVnaXN0ZXIgZnVuY3Rpb24gc2hvdWxkIGJlIGVycm9yIGNoZWNrZWQuDQo+
DQo+U2luY2UgSSB3YXMgY3VyaW91cyBhYm91dCB0aGlzIGFuZCB3YW50ZWQgdG8gdGVzdCBpdCBt
eXNlbGYgKG9uIGEgVGhpbmtwYWQNCj5YMSBZb2dhIEdlbiA3KSBJIGhhdmUgcHJlcGFyZWQgYSB2
MiBhZGRyZXNzaW5nIGFsbCBvZiB0aGUgYWJvdmUsIHF1b3RpbmcNCj5mcm9tIHRoZSBjaGFuZ2Vs
b2c6DQo+DQo+Q2hhbmdlcyBpbiB2MiAoSGFucyBkZSBHb2VkZSk6DQo+LSBNaW5vciBjb21tZW50
IC8gY29kZSBjaGFuZ2VzIChhZGRyZXNzIEFuZHkncyByZXZpZXcgcmVtYXJrcykNCj4tIEFkZCBh
IGFjcGlfY2hlY2tfZHNtKCkgY2FsbA0KPi0gUmV0dXJuIDAgaW5zdGVhZCBvZiBlcnJvciBpZiB3
ZSBhbHJlYWR5IGhhdmUgYSBHUElPIGNsayBvciBpZg0KPiAgYWNwaV9jaGVja19kc20oKSBmYWls
cw0KPi0gUmVuYW1lIHNrbF9pbnQzNDcyX3JlZ2lzdGVyX2Nsb2NrKCkgLT4gc2tsX2ludDM0NzJf
cmVnaXN0ZXJfZ3Bpb19jbG9jaygpDQo+ICBhbmQgbmFtZSB0aGUgbmV3IGZ1bmN0aW9uOiBza2xf
aW50MzQ3Ml9yZWdpc3Rlcl9kc21fY2xvY2soKQ0KPi0gTW92ZSB0aGUgc2tsX2ludDM0NzJfcmVn
aXN0ZXJfZHNtX2Nsb2NrKCkgY2FsbCB0byBhZnRlcg0KPiAgYWNwaV9kZXZfZnJlZV9yZXNvdXJj
ZV9saXN0KCkgYW5kIGFkZCBlcnJvciBjaGVja2luZyBmb3IgaXQNCj4NCj5JJ2xsIHNlbmQgb3V0
IHRoZSB2MiByaWdodCBhZnRlciB0aGlzIGVtYWlsLiBQbGVhc2UgZ2l2ZSB2MiBhIHRyeSBhbmQg
bGV0DQo+bWUga25vdyBpZiBpdCB3b3JrcyBmb3IgeW91Lg0KPg0KPlJlZ2FyZHMsDQo+DQo+SGFu
cw0KPg0KPg0KPg0KPg0KPj4gLS0tDQo+PiAgLi4uL3g4Ni9pbnRlbC9pbnQzNDcyL2Nsa19hbmRf
cmVndWxhdG9yLmMgICAgIHwgODEgKysrKysrKysrKysrKysrKysrLQ0KPj4gIGRyaXZlcnMvcGxh
dGZvcm0veDg2L2ludGVsL2ludDM0NzIvY29tbW9uLmggICB8ICA2ICstDQo+PiAgZHJpdmVycy9w
bGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9kaXNjcmV0ZS5jIHwgIDQgKw0KPj4gIDMgZmlsZXMg
Y2hhbmdlZCwgODggaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkNCj4+DQo+PiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9jbGtfYW5kX3JlZ3VsYXRv
ci5jDQo+PiBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvY2xrX2FuZF9yZWd1
bGF0b3IuYw0KPj4gaW5kZXggZDEwODhiZTVhZjc4Li5mMGExZDJlZjEzN2IgMTAwNjQ0DQo+PiAt
LS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9pbnRlbC9pbnQzNDcyL2Nsa19hbmRfcmVndWxhdG9y
LmMNCj4+ICsrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvY2xrX2FuZF9y
ZWd1bGF0b3IuYw0KPj4gQEAgLTExLDYgKzExLDMyIEBADQo+Pg0KPj4gICNpbmNsdWRlICJjb21t
b24uaCINCj4+DQo+PiArc3RhdGljIGNvbnN0IGd1aWRfdCBpbWdfY2xrX2d1aWQgPQ0KPj4gKwlH
VUlEX0lOSVQoMHg4MmMwZDEzYSwgMHg3OGM1LCAweDQyNDQsDQo+PiArCQkgIDB4OWIsIDB4YjEs
IDB4ZWIsIDB4OGIsIDB4NTMsIDB4OWEsIDB4OGQsIDB4MTEpOw0KPj4gKw0KPj4gK3N0YXRpYyB2
b2lkIHNrbF9pbnQzNDcyX2VuYWJsZV9jbGtfYWNwaV9tZXRob2Qoc3RydWN0IGludDM0NzJfZ3Bp
b19jbG9jaw0KPipjbGssDQo+PiArCQkJCQkgICAgICAgYm9vbCBlbmFibGUpDQo+PiArew0KPj4g
KwlzdHJ1Y3QgaW50MzQ3Ml9kaXNjcmV0ZV9kZXZpY2UgKmludDM0NzIgPSB0b19pbnQzNDcyX2Rl
dmljZShjbGspOw0KPj4gKwl1bmlvbiBhY3BpX29iamVjdCBhcmdzWzNdOw0KPj4gKwl1bmlvbiBh
Y3BpX29iamVjdCBhcmd2NDsNCj4+ICsNCj4+ICsJYXJnc1swXS5pbnRlZ2VyLnR5cGUgPSBBQ1BJ
X1RZUEVfSU5URUdFUjsNCj4+ICsJYXJnc1swXS5pbnRlZ2VyLnZhbHVlID0gY2xrLT5pbWdjbGtf
aW5kZXg7DQo+PiArCWFyZ3NbMV0uaW50ZWdlci50eXBlID0gQUNQSV9UWVBFX0lOVEVHRVI7DQo+
PiArCWFyZ3NbMV0uaW50ZWdlci52YWx1ZSA9IGVuYWJsZSA/IDEgOiAwOw0KPj4gKwlhcmdzWzJd
LmludGVnZXIudHlwZSA9IEFDUElfVFlQRV9JTlRFR0VSOw0KPj4gKwlhcmdzWzJdLmludGVnZXIu
dmFsdWUgPSAxOw0KPj4gKw0KPj4gKwlhcmd2NC50eXBlID0gQUNQSV9UWVBFX1BBQ0tBR0U7DQo+
PiArCWFyZ3Y0LnBhY2thZ2UuY291bnQgPSAzOw0KPj4gKwlhcmd2NC5wYWNrYWdlLmVsZW1lbnRz
ID0gYXJnczsNCj4+ICsNCj4+ICsJYWNwaV9ldmFsdWF0ZV9kc20oYWNwaV9kZXZpY2VfaGFuZGxl
KGludDM0NzItPmFkZXYpLCAmaW1nX2Nsa19ndWlkLA0KPj4gKwkJCSAgMCwgMSwgJmFyZ3Y0KTsN
Cj4+ICt9DQo+PiArDQo+PiAgLyoNCj4+ICAgKiBUaGUgcmVndWxhdG9ycyBoYXZlIHRvIGhhdmUg
Lm9wcyB0byBiZSB2YWxpZCwgYnV0IHRoZSBvbmx5IG9wcyB3ZQ0KPmFjdHVhbGx5DQo+PiAgICog
c3VwcG9ydCBhcmUgLmVuYWJsZSBhbmQgLmRpc2FibGUgd2hpY2ggYXJlIGhhbmRsZWQgdmlhIC5l
bmFfZ3Bpb2QuDQo+PiBQYXNzIGFuIEBAIC0yMiw3ICs0OCwxMSBAQCBzdGF0aWMgaW50IHNrbF9p
bnQzNDcyX2Nsa19wcmVwYXJlKHN0cnVjdA0KPj4gY2xrX2h3ICpodykgIHsNCj4+ICAJc3RydWN0
IGludDM0NzJfZ3Bpb19jbG9jayAqY2xrID0gdG9faW50MzQ3Ml9jbGsoaHcpOw0KPj4NCj4+IC0J
Z3Bpb2Rfc2V0X3ZhbHVlX2NhbnNsZWVwKGNsay0+ZW5hX2dwaW8sIDEpOw0KPj4gKwlpZiAoY2xr
LT5lbmFfZ3BpbykNCj4+ICsJCWdwaW9kX3NldF92YWx1ZV9jYW5zbGVlcChjbGstPmVuYV9ncGlv
LCAxKTsNCj4+ICsJZWxzZQ0KPj4gKwkJc2tsX2ludDM0NzJfZW5hYmxlX2Nsa19hY3BpX21ldGhv
ZChjbGssIDEpOw0KPj4gKw0KPj4gIAlyZXR1cm4gMDsNCj4+ICB9DQo+Pg0KPj4gQEAgLTMwLDcg
KzYwLDEwIEBAIHN0YXRpYyB2b2lkIHNrbF9pbnQzNDcyX2Nsa191bnByZXBhcmUoc3RydWN0IGNs
a19odw0KPj4gKmh3KSAgew0KPj4gIAlzdHJ1Y3QgaW50MzQ3Ml9ncGlvX2Nsb2NrICpjbGsgPSB0
b19pbnQzNDcyX2Nsayhodyk7DQo+Pg0KPj4gLQlncGlvZF9zZXRfdmFsdWVfY2Fuc2xlZXAoY2xr
LT5lbmFfZ3BpbywgMCk7DQo+PiArCWlmIChjbGstPmVuYV9ncGlvKQ0KPj4gKwkJZ3Bpb2Rfc2V0
X3ZhbHVlX2NhbnNsZWVwKGNsay0+ZW5hX2dwaW8sIDApOw0KPj4gKwllbHNlDQo+PiArCQlza2xf
aW50MzQ3Ml9lbmFibGVfY2xrX2FjcGlfbWV0aG9kKGNsaywgMCk7DQo+PiAgfQ0KPj4NCj4+ICBz
dGF0aWMgaW50IHNrbF9pbnQzNDcyX2Nsa19lbmFibGUoc3RydWN0IGNsa19odyAqaHcpIEBAIC04
Niw2ICsxMTksNTANCj4+IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgY2xrX29wcyBza2xfaW50MzQ3
Ml9jbG9ja19vcHMgPSB7DQo+PiAgCS5yZWNhbGNfcmF0ZSA9IHNrbF9pbnQzNDcyX2Nsa19yZWNh
bGNfcmF0ZSwgIH07DQo+Pg0KPj4gK2ludCBza2xfaW50MzQ3Ml9yZWdpc3Rlcl9jbG9ja19zcmMo
c3RydWN0IGludDM0NzJfZGlzY3JldGVfZGV2aWNlDQo+PiArKmludDM0NzIpIHsNCj4+ICsJc3Ry
dWN0IGNsa19pbml0X2RhdGEgaW5pdCA9IHsNCj4+ICsJCS5vcHMgPSAmc2tsX2ludDM0NzJfY2xv
Y2tfb3BzLA0KPj4gKwkJLmZsYWdzID0gQ0xLX0dFVF9SQVRFX05PQ0FDSEUsDQo+PiArCX07DQo+
PiArCWludCByZXQ7DQo+PiArDQo+PiArCWlmIChpbnQzNDcyLT5jbG9jay5jbCkNCj4+ICsJCXJl
dHVybiAtRUJVU1k7DQo+PiArDQo+PiArCWluaXQubmFtZSA9IGthc3ByaW50ZihHRlBfS0VSTkVM
LCAiJXMtY2xrIiwNCj4+ICsJCQkgICAgICBhY3BpX2Rldl9uYW1lKGludDM0NzItPmFkZXYpKTsN
Cj4+ICsJaWYgKCFpbml0Lm5hbWUpDQo+PiArCQlyZXR1cm4gLUVOT01FTTsNCj4+ICsNCj4+ICsJ
aW50MzQ3Mi0+Y2xvY2suZnJlcXVlbmN5ID0gc2tsX2ludDM0NzJfZ2V0X2Nsa19mcmVxdWVuY3ko
aW50MzQ3Mik7DQo+PiArCWludDM0NzItPmNsb2NrLmNsa19ody5pbml0ID0gJmluaXQ7DQo+PiAr
CWludDM0NzItPmNsb2NrLmNsayA9IGNsa19yZWdpc3RlcigmaW50MzQ3Mi0+YWRldi0+ZGV2LA0K
Pj4gKwkJCQkJICAmaW50MzQ3Mi0+Y2xvY2suY2xrX2h3KTsNCj4+ICsJaWYgKElTX0VSUihpbnQz
NDcyLT5jbG9jay5jbGspKSB7DQo+PiArCQlyZXQgPSBQVFJfRVJSKGludDM0NzItPmNsb2NrLmNs
ayk7DQo+PiArCQlnb3RvIG91dF9mcmVlX2luaXRfbmFtZTsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlp
bnQzNDcyLT5jbG9jay5jbCA9IGNsa2Rldl9jcmVhdGUoaW50MzQ3Mi0+Y2xvY2suY2xrLCBOVUxM
LA0KPj4gKwkJCQkJICBpbnQzNDcyLT5zZW5zb3JfbmFtZSk7DQo+PiArCWlmICghaW50MzQ3Mi0+
Y2xvY2suY2wpIHsNCj4+ICsJCXJldCA9IC1FTk9NRU07DQo+PiArCQlnb3RvIGVycl91bnJlZ2lz
dGVyX2NsazsNCj4+ICsJfQ0KPj4gKw0KPj4gKwlrZnJlZShpbml0Lm5hbWUpOw0KPj4gKw0KPj4g
KwlyZXR1cm4gMDsNCj4+ICsNCj4+ICtlcnJfdW5yZWdpc3Rlcl9jbGs6DQo+PiArCWNsa191bnJl
Z2lzdGVyKGludDM0NzItPmNsb2NrLmNsayk7DQo+PiArb3V0X2ZyZWVfaW5pdF9uYW1lOg0KPj4g
KwlrZnJlZShpbml0Lm5hbWUpOw0KPj4gKw0KPj4gKwlyZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsN
Cj4+ICBpbnQgc2tsX2ludDM0NzJfcmVnaXN0ZXJfY2xvY2soc3RydWN0IGludDM0NzJfZGlzY3Jl
dGVfZGV2aWNlICppbnQzNDcyLA0KPj4gIAkJCSAgICAgICBzdHJ1Y3QgYWNwaV9yZXNvdXJjZV9n
cGlvICphZ3BpbywgdTMyIHBvbGFyaXR5KQ0KPnsgZGlmZg0KPj4gLS1naXQgYS9kcml2ZXJzL3Bs
YXRmb3JtL3g4Ni9pbnRlbC9pbnQzNDcyL2NvbW1vbi5oDQo+PiBiL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2ludGVsL2ludDM0NzIvY29tbW9uLmgNCj4+IGluZGV4IDYxNjg4ZTQ1MGNlNS4uMDM2Yjgw
NGU4ZWE1IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3
Mi9jb21tb24uaA0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9j
b21tb24uaA0KPj4gQEAgLTY0LDcgKzY0LDkgQEAgc3RydWN0IGludDM0NzJfY2xkYiB7DQo+PiAg
CXU4IGNvbnRyb2xfbG9naWNfdHlwZTsNCj4+ICAJdTggY29udHJvbF9sb2dpY19pZDsNCj4+ICAJ
dTggc2Vuc29yX2NhcmRfc2t1Ow0KPj4gLQl1OCByZXNlcnZlZFsyOF07DQo+PiArCXU4IHJlc2Vy
dmVkWzEwXTsNCj4+ICsJdTggY2xvY2tfc291cmNlOw0KPj4gKwl1OCByZXNlcnZlZDJbMTddOw0K
Pj4gIH07DQo+Pg0KPj4gIHN0cnVjdCBpbnQzNDcyX2dwaW9fZnVuY3Rpb25fcmVtYXAgew0KPj4g
QEAgLTEwMCw2ICsxMDIsNyBAQCBzdHJ1Y3QgaW50MzQ3Ml9kaXNjcmV0ZV9kZXZpY2Ugew0KPj4g
IAkJc3RydWN0IGNsa19sb29rdXAgKmNsOw0KPj4gIAkJc3RydWN0IGdwaW9fZGVzYyAqZW5hX2dw
aW87DQo+PiAgCQl1MzIgZnJlcXVlbmN5Ow0KPj4gKwkJdTggaW1nY2xrX2luZGV4Ow0KPj4gIAl9
IGNsb2NrOw0KPj4NCj4+ICAJc3RydWN0IGludDM0NzJfcGxlZCB7DQo+PiBAQCAtMTIzLDYgKzEy
Niw3IEBAIGludCBza2xfaW50MzQ3Ml9nZXRfc2Vuc29yX2FkZXZfYW5kX25hbWUoc3RydWN0DQo+
PiBkZXZpY2UgKmRldiwNCj4+DQo+PiAgaW50IHNrbF9pbnQzNDcyX3JlZ2lzdGVyX2Nsb2NrKHN0
cnVjdCBpbnQzNDcyX2Rpc2NyZXRlX2RldmljZSAqaW50MzQ3MiwNCj4+ICAJCQkgICAgICAgc3Ry
dWN0IGFjcGlfcmVzb3VyY2VfZ3BpbyAqYWdwaW8sIHUzMiBwb2xhcml0eSk7DQo+PiAraW50IHNr
bF9pbnQzNDcyX3JlZ2lzdGVyX2Nsb2NrX3NyYyhzdHJ1Y3QgaW50MzQ3Ml9kaXNjcmV0ZV9kZXZp
Y2UNCj4+ICsqaW50MzQ3Mik7DQo+PiAgdm9pZCBza2xfaW50MzQ3Ml91bnJlZ2lzdGVyX2Nsb2Nr
KHN0cnVjdCBpbnQzNDcyX2Rpc2NyZXRlX2RldmljZQ0KPj4gKmludDM0NzIpOw0KPj4NCj4+ICBp
bnQgc2tsX2ludDM0NzJfcmVnaXN0ZXJfcmVndWxhdG9yKHN0cnVjdCBpbnQzNDcyX2Rpc2NyZXRl
X2RldmljZQ0KPj4gKmludDM0NzIsIGRpZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9p
bnRlbC9pbnQzNDcyL2Rpc2NyZXRlLmMNCj4+IGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwv
aW50MzQ3Mi9kaXNjcmV0ZS5jDQo+PiBpbmRleCBlZjAyMGUyM2U1OTYuLmQ1ZDVjNjUwZDZkMiAx
MDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2ludGVsL2ludDM0NzIvZGlzY3Jl
dGUuYw0KPj4gKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvaW50ZWwvaW50MzQ3Mi9kaXNjcmV0
ZS5jDQo+PiBAQCAtMzA5LDYgKzMwOSw5IEBAIHN0YXRpYyBpbnQgc2tsX2ludDM0NzJfcGFyc2Vf
Y3JzKHN0cnVjdA0KPmludDM0NzJfZGlzY3JldGVfZGV2aWNlICppbnQzNDcyKQ0KPj4gIAlpZiAo
cmV0IDwgMCkNCj4+ICAJCXJldHVybiByZXQ7DQo+Pg0KPj4gKwkvKiBJZiBubyBncGlvIGJhc2Vk
IGNsayByZWdpc3RlcmVkLCB0cnkgcmVnaXN0ZXIgd2l0aCBjbG9jayBzb3VyY2UNCj4qLw0KPj4g
Kwlza2xfaW50MzQ3Ml9yZWdpc3Rlcl9jbG9ja19zcmMoaW50MzQ3Mik7DQo+PiArDQo+PiAgCWFj
cGlfZGV2X2ZyZWVfcmVzb3VyY2VfbGlzdCgmcmVzb3VyY2VfbGlzdCk7DQo+Pg0KPj4gIAlpbnQz
NDcyLT5ncGlvcy5kZXZfaWQgPSBpbnQzNDcyLT5zZW5zb3JfbmFtZTsgQEAgLTM1Niw2ICszNTks
NyBAQA0KPj4gc3RhdGljIGludCBza2xfaW50MzQ3Ml9kaXNjcmV0ZV9wcm9iZShzdHJ1Y3QgcGxh
dGZvcm1fZGV2aWNlICpwZGV2KQ0KPj4gIAlpbnQzNDcyLT5hZGV2ID0gYWRldjsNCj4+ICAJaW50
MzQ3Mi0+ZGV2ID0gJnBkZXYtPmRldjsNCj4+ICAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
aW50MzQ3Mik7DQo+PiArCWludDM0NzItPmNsb2NrLmltZ2Nsa19pbmRleCA9IGNsZGIuY2xvY2tf
c291cmNlOw0KPj4NCj4+ICAJcmV0ID0gc2tsX2ludDM0NzJfZ2V0X3NlbnNvcl9hZGV2X2FuZF9u
YW1lKCZwZGV2LT5kZXYsICZpbnQzNDcyLQ0KPj5zZW5zb3IsDQo+PiAgCQkJCQkJICAgJmludDM0
NzItPnNlbnNvcl9uYW1lKTsNCg0K
