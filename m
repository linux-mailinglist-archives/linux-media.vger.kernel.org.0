Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF073742214
	for <lists+linux-media@lfdr.de>; Thu, 29 Jun 2023 10:25:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229451AbjF2IZV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 29 Jun 2023 04:25:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46716 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232584AbjF2IYK (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 29 Jun 2023 04:24:10 -0400
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B776420C
        for <linux-media@vger.kernel.org>; Thu, 29 Jun 2023 01:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688026982; x=1719562982;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Tgc5TmrIVveyXNqnkPR6m3SXYZ5R9VgwkW3eRSIMIcY=;
  b=HHhAMm15HOpHjqIEe8orPQzAZU5GVgvV42goFW0j6TRbqEIO/NEajWqq
   DWEzcyTXlzv1Q+u0VMBFLOjwjbombShD+BDLaUTrZemus0wZxEgnu6RrD
   Jjc5IZINrvXvmqh5hUBvBUFQe+/yMBBjMWNXYmrSnDrWTJG//QuiUffEh
   rUL+P4AFFrcFen3ihlNc8Di9C+xXytkiQdwE5eCQ5QFy0iGeUl75kDSpN
   /aIp1NTxdhV4//PIC2FkQOm6iMh+T++pADBrAAXUjbHP9gonKSIJv2byU
   ktVQcMx3eUh7Y9olIZwXqW32Vj1p5TlG3GcFuX8C2CTAZGXlQCs36c+Xw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="359540777"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="359540777"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jun 2023 01:23:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10755"; a="963913083"
X-IronPort-AV: E=Sophos;i="6.01,168,1684825200"; 
   d="scan'208";a="963913083"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga006.fm.intel.com with ESMTP; 29 Jun 2023 01:23:01 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 01:23:01 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27; Thu, 29 Jun 2023 01:23:00 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.27 via Frontend Transport; Thu, 29 Jun 2023 01:23:00 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.27; Thu, 29 Jun 2023 01:23:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iuQ+jI/aYNbEvnYxSAiWmkU1kIdcZDyXhJZarYg2yaQKl+g2ZjY03Y8vUqL8StWwQW1oYRJ8w0GH86uTGDnhN3DhJYgX5lTr8gH2dTiI9YjogyPSYCR1jDTw2xYo3Pnj7CXScJu+EkwSfayCywKPG3EWeK8xfQVaZOCkhNRrGJms39QF47BAuCsNGnoX9AMxFCnHMZaZO2UXpF4LTzQggVdkAJBt89OFtj1K+Q+oFCS+9zwEJqRl32PD7injFD7GiIHggf0dxKtTkCzXqG+0FELPRMbzyutRlRD3Y2mEf9zoQGVKR8BHMfTN3HST9zn4xwXT323dBmHNAn4CL26Kxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tgc5TmrIVveyXNqnkPR6m3SXYZ5R9VgwkW3eRSIMIcY=;
 b=OQt2Yu6eKl3GN7nmHzq9krABdccpjT8ABIt1R931nXXselWWkQPuexdtaoEHFgBUFs6KfUTHFfHbv+w8H/RbvgmoTxNcmPjW0W1CRFM/h3pAaHHZjwB+26RRM61Jio5GajnGeG83+u8Hxxc/jK9B1xxgqjahVZXv+wrdb/0Dj4sa126GOY7OIhWKA/VazT/Y/YIXlN1hx4sQQLE9Rwc9a7XQCNkH6TNmutwo66wraUkGaZqBs6bC9+NShhCdWQT4ia44OqYIrniJs342Soc0AL+4NQojTSZ0bjPzKEUoFoFh9bX1RPsuZTq/ViNIT+4crT2f8vxkyCSQoWtjchUhiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5653.namprd11.prod.outlook.com (2603:10b6:8:25::8) by
 IA0PR11MB7258.namprd11.prod.outlook.com (2603:10b6:208:43d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Thu, 29 Jun
 2023 08:22:53 +0000
Received: from DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543]) by DM8PR11MB5653.namprd11.prod.outlook.com
 ([fe80::9d26:3f6:8afa:4543%6]) with mapi id 15.20.6544.012; Thu, 29 Jun 2023
 08:22:53 +0000
From:   "Cao, Bingbu" <bingbu.cao@intel.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>
CC:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Kate Hsuan <hpa@redhat.com>,
        "Yao, Hao" <hao.yao@intel.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Thread-Topic: [PATCH 00/12] media: intel-cio2-bridge: Add shared
 intel-cio2-bridge code, rework VCM instantiation
Thread-Index: AQHZqSDQj2iupNO4aUWVfBe6TL3XVq+fahTggADUkwCAATP5EA==
Date:   Thu, 29 Jun 2023 08:22:53 +0000
Message-ID: <DM8PR11MB56533BB556809D3083B80C269925A@DM8PR11MB5653.namprd11.prod.outlook.com>
References: <20230627175643.114778-1-hdegoede@redhat.com>
 <DM8PR11MB5653A2A59A5858F0880889369924A@DM8PR11MB5653.namprd11.prod.outlook.com>
 <f943821e-360f-b46a-7bc6-b1696afe14c9@redhat.com>
In-Reply-To: <f943821e-360f-b46a-7bc6-b1696afe14c9@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5653:EE_|IA0PR11MB7258:EE_
x-ms-office365-filtering-correlation-id: 135b055e-1f3d-4404-672c-08db787a08be
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: phLix104Dp3inHDYrTzQ8rj+yXPR7kbgAPwRCbhUYlR/vAyL+zzyunBnZfaJ92QNWKLX7z3ZXlmxwFxEVaF2LuNqKwl8e6i2nfQ9ONlFaOswlb9JRC9+DPWxm/LCEzLviTe9hviG8VxVz3iGrC8uBKgMZF72NQ4BvNPyoxmksWFWk5h+FyVV7F6RoozdxjpWtPtgIxC/mJ+Cz40NwHuKntOF6cRMCibmhIuqfsu7VGDJYKnhG10kPNrOSEn+MDjHxCFoOxIXVahi1syl8HDCzxi78uWv/XaHQFbWL9CcLk0FCdP1FkATh27hLSXV/2SxMXOG7dCGz1jvCLBtGF0tVo4EYI/BcJk3vWnsSu8imOQGyLy4rY11sDhinLx9n1B6jSC/QFIVYk/HEkVr2R9UT1sh5gsqh7NyqBhGcEAM8m60hh35H6G1z+iBj3QcIAg2M6IEa5Z33N6kB1GeDtonaFEu6KyEEu8wQpT9+FNFPsdKEmmDZ0C0QgR7uTplehLUmNaiOhZXEBExESyzQ4XjDCO+fVEakxeD5v/kEV3RZxjJma9880g9mqrGT3yL7Cj0+hgZNwJ7/swfI5EGV5CB3/2e9n8uqdw45JptKQcSzsxvBenlDBdN8K+C8yP5BqGh
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR11MB5653.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(376002)(136003)(346002)(396003)(39860400002)(451199021)(4326008)(66556008)(66476007)(38070700005)(966005)(478600001)(6506007)(7696005)(110136005)(71200400001)(54906003)(53546011)(83380400001)(26005)(186003)(2906002)(9686003)(122000001)(66946007)(55016003)(82960400001)(5660300002)(52536014)(8676002)(38100700002)(76116006)(64756008)(86362001)(33656002)(41300700001)(8936002)(316002)(66446008)(8496004);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dGtkQ0RzVWpnb2FtaWc0ZjlBN2V5RE5tTzNNV2ZRZ0dreUErdTVpTjd6VUpa?=
 =?utf-8?B?QnhwL2x6bDBaZXlxczJJa0hoSVU2VkUreWk4RExSbnJCVnNDcldSQzFBMnY3?=
 =?utf-8?B?THZEOXhjVzB4YmhhWkxzVXBEWndkbTJ0eHdScFpIVnEvRVlmWnBGRWIxa1Az?=
 =?utf-8?B?NFNOd0pNaDBDMndlRVJNMXZpamlTdUdHWlhFMURTaE9HWHFyaURhN2hNakl4?=
 =?utf-8?B?MS81a3hkRDgweUl4VjFGeFlCYklpUkcyK0NERW9aSjZDcEdZajl2YkJYWWU5?=
 =?utf-8?B?Yld5bXNaU2duaEgrQWZGaFNGV1g4MUg4c2xYQ0NPckQ4eUFJYXdEb1E4aUJ0?=
 =?utf-8?B?WjFiS1BNVGswOTVTTUtZT1hFVnB6VGFGNWNVazgrWXBqRTUrZ1ZSWWdwOG92?=
 =?utf-8?B?UlFpNXp4NGtKMlUzWllhTDBoT1VndWFpZ2diVDh0SjIwd3lUOS9BOExXMnlG?=
 =?utf-8?B?Z2RLS0VnU1pSemZiNkpqR2Y2aGlRajIxNGd1TTBhK2R0WXZIbXlHSkVhMHlG?=
 =?utf-8?B?QXJjTGgxT3A4MGRUY25oOUZWY2tsQmF2YnN4cVRZdGRTWDdMaGZmRFRVQ3Jh?=
 =?utf-8?B?dXUwWnNhMWpKMnpMMUNFR21YT1VrNXYwd2U2dGdIMVZuVHlqcXUvSk1FYUdk?=
 =?utf-8?B?ZGJXWmZnS0F3UEh1c1hFekVxSHVjcUgvNlFXMk9wRExhbDBFVmlPZG5HNFR1?=
 =?utf-8?B?YlVQU0M5dGdyQm0wZGJkQjhIOFdwWTRyMnlYK3NueHE5Q3VQcnpNaEE1M0xG?=
 =?utf-8?B?WUN1WnJUby9MRUxGS21iaWRobE9BOVc1V0NrSkRXRGxkeVMyRk9yRTUxNVJW?=
 =?utf-8?B?VlpqdU5ubTlTZWRIUk4vdnNHWTlNUE1zL2oxMllpc2pkRm93ZFM1dGpXM0hV?=
 =?utf-8?B?YUh3aCsrQ1UwR0laVEc3VU5ia0laei83aWR5MHkxc0V5TDkxZ0F4Rmp2K2pC?=
 =?utf-8?B?enB2SXhnS2xDZGVsZk90Y1Y2NkZ5NTBHbktzeCswaStscjU1enVra24zTmYz?=
 =?utf-8?B?MDRUOEVWdkp2U0VETmNxd3JvQ2ZJbi9acXh5YXlGZjd6MnQ2NHJLZ1JSaVRZ?=
 =?utf-8?B?c2VJSkU2WkQyZUY1ak9SekNqK2xvbUttVTMyMzB2bGRTeGZzOVFrVXlLREg4?=
 =?utf-8?B?MzhaVkZEYnoybzBxa05TRXhkTW4vZHZ0OUNqM29CYmpVQUs4VGpCb3dobW5P?=
 =?utf-8?B?WjM0dlc5aWJrUWZIMjN3WTlYOFkzZmJPcU5hcTRJL2k2V0hMU0E1SXI1UFds?=
 =?utf-8?B?ZlIrWDhkZDRleU1SdmpyajBLUlREZGh0RUphTHAvcFVtQ2Z2c2tQWWRFRnRq?=
 =?utf-8?B?VlZVZHgra0JuVWJzM1pkUWVWQXVZNnY1L2Z2WDhNaiswVldxekVOMzJ6RHlL?=
 =?utf-8?B?aUViV3B0TjB6T29JeGJJK0dJQ21tTjhFVGpkeDNaQUUvWXkzMGJMUjVMN1Rs?=
 =?utf-8?B?T2R4dnNWZVVFVFlINnF3OXNWb1ZENTlNQjBSbzJYM1hWdDJxODRRVTBjNHFD?=
 =?utf-8?B?b0orblZWL1luSUczMHdxMlVaZ29VRHRiZ3dvN1dyKzdXOE82UGdydGkwQ3dQ?=
 =?utf-8?B?NnIrMzlaek05OXAvMmdiYVdPTjlKRGd1eEJDM3M4T3kvampGZUtnemkySFpE?=
 =?utf-8?B?cDh1VUlEOUdZcTd1NjRjQzJjeUcrblFWTG1JN3RYTU41N0JlSnlRZkFJcTVr?=
 =?utf-8?B?STFsaE9GZTdKcjF0VFRmMXhrWG1OMTFmN1l4ZVpzcS9iYlAxQTJtTjlGRUxJ?=
 =?utf-8?B?RmluM2xGSkdKaUtVaytLbjZmR3haVUtYWEFMTzdYa0Q5bmhwODRLWjBFTHFE?=
 =?utf-8?B?dGhCNFdsWjFjMlRlVHU4Y1cvNU9kaXNxbTdRVDFKWnpjQ1BiVWpGdVFnRjhP?=
 =?utf-8?B?TVZZMDVXSy93RGVZKy9BSHM5anRBdW9lNkxkNmEvSzJQQzRRZEdwdUtIT0xl?=
 =?utf-8?B?SHlGMERTU3U2aC9zRDNHdTJPVDZkL2gxK1JjWFNNN09NcXl4czJXdFZNRmFu?=
 =?utf-8?B?UkpuczBaWmxVWnNCRXlOWEpWeGdoU3J1YkFxVGNweGd2ZGROK2xOZ0dkYmRG?=
 =?utf-8?B?ank4cEp4cFI4MGx1MHlYbWtBTVZRd3JFakZaSWRTaC8zNW51NG94WWlIbUJP?=
 =?utf-8?Q?vj29v+Mt+XfcWvtKTBwa+0dXF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5653.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 135b055e-1f3d-4404-672c-08db787a08be
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jun 2023 08:22:53.0909
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ddXko/mvXeBMJUtR3jwGIsaCN5c4DxDtx4pV6IY0PExSpUsGFPNw3sbfGqDbStyHc2+2x91Hnhqnzq9vf40uZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7258
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGFucywNCg0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkJScywgIA0KQmluZ2J1IENhbyANCg0KPi0tLS0t
T3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVk
aGF0LmNvbT4NCj5TZW50OiBXZWRuZXNkYXksIEp1bmUgMjgsIDIwMjMgMjE6NTcNCj5UbzogQ2Fv
LCBCaW5nYnUgPGJpbmdidS5jYW9AaW50ZWwuY29tPjsgU2FrYXJpIEFpbHVzDQo+PHNha2FyaS5h
aWx1c0BsaW51eC5pbnRlbC5jb20+OyBMYXVyZW50IFBpbmNoYXJ0DQo+PGxhdXJlbnQucGluY2hh
cnRAaWRlYXNvbmJvYXJkLmNvbT47IERhbmllbCBTY2FsbHkNCj48ZGFuLnNjYWxseUBpZGVhc29u
Ym9hcmQuY29tPg0KPkNjOiBNYXVybyBDYXJ2YWxobyBDaGVoYWIgPG1jaGVoYWJAa2VybmVsLm9y
Zz47IEFuZHkgU2hldmNoZW5rbw0KPjxhbmR5QGtlcm5lbC5vcmc+OyBLYXRlIEhzdWFuIDxocGFA
cmVkaGF0LmNvbT47IFlhbywgSGFvDQo+PGhhby55YW9AaW50ZWwuY29tPjsgbGludXgtbWVkaWFA
dmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDogUmU6IFtQQVRDSCAwMC8xMl0gbWVkaWE6IGludGVs
LWNpbzItYnJpZGdlOiBBZGQgc2hhcmVkIGludGVsLWNpbzItDQo+YnJpZGdlIGNvZGUsIHJld29y
ayBWQ00gaW5zdGFudGlhdGlvbg0KPg0KPkhpIEJpbmdidSwNCj4NCj5PbiA2LzI4LzIzIDAzOjE5
LCBDYW8sIEJpbmdidSB3cm90ZToNCj4+IEhhbnMsDQo+Pg0KPj4gVGhhbmtzIGZvciB5b3VyIHBh
dGNoLg0KPj4NCj4+IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCj4+IC0tDQo+PiBCUnMsDQo+PiBCaW5nYnUgQ2Fv
DQo+Pg0KPj4+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+Pj4gRnJvbTogSGFucyBkZSBH
b2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT4NCj4+PiBTZW50OiBXZWRuZXNkYXksIEp1bmUgMjgs
IDIwMjMgMDE6NTcNCj4+PiBUbzogU2FrYXJpIEFpbHVzIDxzYWthcmkuYWlsdXNAbGludXguaW50
ZWwuY29tPjsgTGF1cmVudCBQaW5jaGFydA0KPj4+IDxsYXVyZW50LnBpbmNoYXJ0QGlkZWFzb25i
b2FyZC5jb20+OyBEYW5pZWwgU2NhbGx5DQo+Pj4gPGRhbi5zY2FsbHlAaWRlYXNvbmJvYXJkLmNv
bT4NCj4+PiBDYzogSGFucyBkZSBHb2VkZSA8aGRlZ29lZGVAcmVkaGF0LmNvbT47IE1hdXJvIENh
cnZhbGhvIENoZWhhYg0KPj4+IDxtY2hlaGFiQGtlcm5lbC5vcmc+OyBBbmR5IFNoZXZjaGVua28g
PGFuZHlAa2VybmVsLm9yZz47IEthdGUgSHN1YW4NCj4+PiA8aHBhQHJlZGhhdC5jb20+OyBZYW8s
IEhhbyA8aGFvLnlhb0BpbnRlbC5jb20+OyBDYW8sIEJpbmdidQ0KPj4+IDxiaW5nYnUuY2FvQGlu
dGVsLmNvbT47IGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZw0KPj4+IFN1YmplY3Q6IFtQQVRD
SCAwMC8xMl0gbWVkaWE6IGludGVsLWNpbzItYnJpZGdlOiBBZGQgc2hhcmVkDQo+Pj4gaW50ZWwt
Y2lvMi0gYnJpZGdlIGNvZGUsIHJld29yayBWQ00gaW5zdGFudGlhdGlvbg0KPj4+DQo+Pj4gSGkg
QWxsLA0KPj4+DQo+Pj4gV2hpbGUgd29ya2luZyBvbiBhZGRpbmcgKHByb3BlcikgVkNNIHN1cHBv
cnQgdG8gdGhlIGF0b21pc3AgY29kZSBJDQo+Pj4gZm91bmQgbXlzZWxmIGNvcHlpbmcgeWV0IG1v
cmUgY29kZSBmcm9tDQo+Pj4gZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9jaW8yLQ0KPj4+
IGJyaWRnZS5jIGludG8gdGhlIGF0b21pc3AgY29kZS4NCj4+Pg0KPj4+IFNvIEkgZGVjaWRlZCB0
aGF0IGl0IHJlYWxseSB3YXMgdGltZSB0byBmYWN0b3Igb3V0IHRoZSBjb21tb24gY29kZQ0KPj4+
IChtb3N0IG9mIHRoZSBjb2RlKSBmcm9tIGludGVsL2lwdTMvY2lvMi1icmlkZ2UuYyBpbnRvIGl0
cyBvd24gaGVscGVyDQo+Pj4gbGlicmFyeSBhbmQgdGhlbiBzaGFyZSBpdCBiZXR3ZWVuIHRoZSBh
dG9taXNwIGFuZCBJUFUzIGNvZGUuDQo+Pj4NCj4+PiBUaGlzIHdpbGwgaG9wZWZ1bGx5IGFsc28g
YmUgdXNlZnVsIGZvciB0aGUgb25nb2luZyB3b3JrIHRvIHVwc3RyZWFtDQo+Pj4gSVBVNiBpbnB1
dCBzeXN0ZW0gc3VwcG9ydCB3aGljaCBhbHNvIG5lZWRzIHRoaXMgZnVuY3Rpb25hbGl0eSBhbmQN
Cj4+PiBjdXJyZW50bHkgY29udGFpbnMgYSAzdGggY29weSBvZiB0aGlzIGNvZGUgaW4gdGhlIG91
dCBvZiB0cmVlIGRyaXZlci4NCj4+Pg0KPj4+IFRoaXMgc2V0IGNvbnNpc3RzIG9mIHRoZSBmb2xs
b3dpbmcgcGFydHM6DQo+Pj4NCj4+PiBQYXRjaCAxICAgICBBIGJ1Z2ZpeCBmb3IgYSByZWNlbnQg
Y2hhbmdlIHRvIHRoZSBjaW8yLWJyaWRnZSBjb2RlDQo+Pj4gUGF0Y2hlcyAyLTggQ2xlYW51cCAv
IHByZXBhcmF0aW9uIHBhdGNoZXMNCj4+PiBQYXRjaCA5ICAgICBNb3ZlIHRoZSBtYWluIGJvZHkg
b2YgdGhlIGNpbzItYnJpZGdlLmMgY29kZSBpbnRvDQo+Pj4gICAgICAgICAgICBhIG5ldyBzaGFy
ZWQgaW50ZWwtY2lvMi1icmlkZ2UgbW9kdWxlDQo+Pg0KPj4gQW5vdGhlciBjaW8yLWJyaWRnZSBw
YXRjaCAtDQo+PiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVk
aWEvcGF0Y2gvMjAyMzA1MTcxMDMwMDQuDQo+PiA3MjQyNjQtMS1iaW5nYnUuY2FvQGludGVsLmNv
bS8gSSByZW1lbWJlciBTYWthcmkgaW5jbHVkZSBpdCBpbiB0aGUNCj4+IGxhdGVzdCBwdWxsIHJl
cXVlc3QuDQo+DQo+QWgsIHllcyBsb29rcyBsaWtlIEkgbmVlZCB0byByZWJhc2UgdGhpcyBvbiB0
b3Agb2YgdGhhdCBwYXRjaCwgYXMgRGFuIGFsc28NCj5tZW50aW9uZWQgaW4gYW5vdGhlciByZXBs
eS4NCj4NCj5CdXQgSSBkb24ndCBzZWUgdGhpcyBwYXRjaCBpbiBtZWRpYS1zdGFnaW5nIHlldDoN
Cj5odHRwczovL2dpdC5saW51eHR2Lm9yZy9tZWRpYV9zdGFnZS5naXQvbG9nLw0KPg0KPklzIHRo
ZXJlIGEgYnJhbmNoIGZvciB0aGUgcHVsbC1yZXF1ZXN0IG9uIHdoaWNoIEkgY2FuIHJlYmFzZSB0
aGlzIGF2YWlsYWJsZQ0KPnNvbWV3aGVyZSA/DQoNCkkgc2VlIHRoZXkgYXJlIGluIFNha2FyaSdz
IHJlcG8gLQ0KaHR0cHM6Ly9naXQubGludXh0di5vcmcvc2FpbHVzL21lZGlhX3RyZWUuZ2l0L2xv
Zy8/aD1mb3ItNi42LTEuNC1zaWduZWQNCg0KDQo+DQo+UmVnYXJkcywNCj4NCj5IYW5zDQo+DQo+
DQo+DQo+DQo+Pg0KPj4+IFBhdGNoIDEwICAgIERyb3AgY2lvMi1icmlkZ2UgY29kZSBjb3B5IGZy
b20gYXRvbWlzcCwgc3dpdGNoaW5nIHRvDQo+Pj4gICAgICAgICAgICB0aGUgc2hhcmVkIGludGVs
LWNpbzItYnJpZGdlIG1vZHVsZQ0KPj4+IFBhdGNoIDExICAgIFJld29yayBob3cgVkNNIGNsaWVu
dCBpbnN0YW50aWF0aW9uIGlzIGRvbmUgc28gdGhhdA0KPj4+ICAgICAgICAgICAgYSBkZXZpY2Ut
bGluayBjYW4gYmUgYWRkZWQgZnJvbSBWQ00gdG8gc2Vuc29yIHRvDQo+Pj4gICAgICAgICAgICBm
aXggaXNzdWVzIHdpdGggdGhlIFZDTSBwb3dlci1zdGF0ZSBiZWluZyB0aWVkIHRvDQo+Pj4gICAg
ICAgICAgICB0aGUgc2Vuc29yIHBvd2VyIHN0YXRlDQo+Pj4gUGF0Y2ggMTIgICAgRXhhbXBsZSBw
YXRjaCB0byBzaG93IGhvdyBwYXRjaCAxMSBhdm9pZHMgdGhlIG5lZWQNCj4+PiAgICAgICAgICAg
IGZvciBoYWNrcyBpbiBWQ00gZHJpdmVycyBjYXVzZWQgYnkgdGhlIHNoYXJlZCBwb3dlciBzdGF0
ZQ0KPj4+ICAgICAgICAgICAgKG5vdCBpbnRlbmRlZCBmb3IgbWVyZ2luZykNCj4+Pg0KPj4+IFJl
Z2FyZHMsDQo+Pj4NCj4+PiBIYW5zDQo+Pj4NCj4+Pg0KPj4+IEhhbnMgZGUgR29lZGUgKDEyKToN
Cj4+PiAgbWVkaWE6IGlwdTMtY2lvMjogRG8gbm90IHVzZSBvbiBzdGFjayBtZW1vcnkgZm9yIHNv
ZnR3YXJlX25vZGUubmFtZQ0KPj4+ICAgIGZpZWxkDQo+Pj4gIG1lZGlhOiBpcHUzLWNpbzI6IE1v
dmUgaW5pdGlhbGl6YXRpb24gb2Ygbm9kZV9uYW1lcy52Y20gdG8NCj4+PiAgICBjaW8yX2JyaWRn
ZV9pbml0X3N3bm9kZV9uYW1lcygpDQo+Pj4gIG1lZGlhOiBpcHUzLWNpbzI6IE1ha2UgY2lvMl9i
cmlkZ2VfaW5pdCgpIHRha2UgYSByZWd1bGFyIHN0cnVjdCBkZXZpY2UNCj4+PiAgICBhcyBhcmd1
bWVudA0KPj4+ICBtZWRpYTogaXB1My1jaW8yOiBTdG9yZSBkZXYgcG9pbnRlciBpbiBzdHJ1Y3Qg
Y2lvMl9icmlkZ2UNCj4+PiAgbWVkaWE6IGlwdTMtY2lvMjogT25seSBrZWVwIFBMRCBhcm91bmQg
d2hpbGUgcGFyc2luZw0KPj4+ICBtZWRpYTogaXB1My1jaW8yOiBBZGQgYSBjaW8yX2JyaWRnZV9w
YXJzZV9zZW5zb3JfZndub2RlKCkgaGVscGVyDQo+Pj4gICAgZnVuY3Rpb24NCj4+PiAgbWVkaWE6
IGlwdTMtY2lvMjogQWRkIGEgcGFyc2Vfc2Vuc29yX2Z3bm9kZSBjYWxsYmFjayB0bw0KPj4+ICAg
IGNpbzJfYnJpZGdlX2luaXQoKQ0KPj4+ICBtZWRpYTogaXB1My1jaW8yOiBBZGQgc3VwcG9ydGVk
X3NlbnNvcnMgcGFyYW1ldGVyIHRvDQo+Pj4gICAgY2lvMl9icmlkZ2VfaW5pdCgpDQo+Pj4gIG1l
ZGlhOiBpcHUzLWNpbzI6IE1vdmUgY2lvMl9icmlkZ2VfaW5pdCgpIGNvZGUgaW50byBhIG5ldyBz
aGFyZWQNCj4+PiAgICBpbnRlbC1jaW8yLWJyaWRnZS5rbw0KPj4+ICBtZWRpYTogYXRvbWlzcDog
Y3NpMi1icmlkZ2U6IFN3aXRjaCB0byBuZXcgY29tbW9uIGNpbzJfYnJpZGdlX2luaXQoKQ0KPj4+
ICBtZWRpYTogaW50ZWwtY2lvMi1icmlkZ2U6IEFkZCBhIHJ1bnRpbWUtcG0gZGV2aWNlLWxpbmsg
YmV0d2VlbiBWQ00gYW5kDQo+Pj4gICAgc2Vuc29yDQo+Pj4gIFtSRkNdIG1lZGlhOiBkdzk3MTk6
IERyb3AgaGFjayB0byBlbmFibGUgInZzaW8iIHJlZ3VsYXRvcg0KPj4+DQo+Pj4gTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA5ICsNCj4+PiBkcml2ZXJz
L21lZGlhL2NvbW1vbi9LY29uZmlnICAgICAgICAgICAgICAgICAgfCAgIDQgKw0KPj4+IGRyaXZl
cnMvbWVkaWEvY29tbW9uL01ha2VmaWxlICAgICAgICAgICAgICAgICB8ICAgMSArDQo+Pj4gZHJp
dmVycy9tZWRpYS9jb21tb24vaW50ZWwtY2lvMi1icmlkZ2UuYyAgICAgIHwgNDY0ICsrKysrKysr
KysrKysrKysrKw0KPj4+IGRyaXZlcnMvbWVkaWEvaTJjL2R3OTcxOS5jICAgICAgICAgICAgICAg
ICAgICB8ICAyNyArLQ0KPj4+IGRyaXZlcnMvbWVkaWEvcGNpL2ludGVsL2lwdTMvS2NvbmZpZyAg
ICAgICAgICB8ICAgMSArDQo+Pj4gZHJpdmVycy9tZWRpYS9wY2kvaW50ZWwvaXB1My9jaW8yLWJy
aWRnZS5jICAgIHwgNDY0ICsrKy0tLS0tLS0tLS0tLS0tLQ0KPj4+IGRyaXZlcnMvbWVkaWEvcGNp
L2ludGVsL2lwdTMvY2lvMi1icmlkZ2UuaCAgICB8IDE0NiAtLS0tLS0NCj4+PiBkcml2ZXJzL21l
ZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi1tYWluLmMgfCAgIDcgKy0NCj4+PiBkcml2ZXJz
L21lZGlhL3BjaS9pbnRlbC9pcHUzL2lwdTMtY2lvMi5oICAgICAgfCAgIDcgKy0NCj4+PiBkcml2
ZXJzL3N0YWdpbmcvbWVkaWEvYXRvbWlzcC9LY29uZmlnICAgICAgICAgfCAgIDIgKw0KPj4+IC4u
Li9zdGFnaW5nL21lZGlhL2F0b21pc3AvcGNpL2F0b21pc3BfY3NpMi5oICB8ICA2NyAtLS0NCj4+
PiAuLi4vbWVkaWEvYXRvbWlzcC9wY2kvYXRvbWlzcF9jc2kyX2JyaWRnZS5jICAgfCAzMDcgKyst
LS0tLS0tLS0tDQo+Pj4gaW5jbHVkZS9tZWRpYS9pbnRlbC1jaW8yLWJyaWRnZS5oICAgICAgICAg
ICAgIHwgMTA1ICsrKysNCj4+PiAxNCBmaWxlcyBjaGFuZ2VkLCA3MjMgaW5zZXJ0aW9ucygrKSwg
ODg4IGRlbGV0aW9ucygtKSAgY3JlYXRlIG1vZGUNCj4+PiAxMDA2NDQgZHJpdmVycy9tZWRpYS9j
b21tb24vaW50ZWwtY2lvMi1icmlkZ2UuYw0KPj4+IGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21lZGlhL3BjaS9pbnRlbC9pcHUzL2NpbzItYnJpZGdlLmgNCj4+PiBjcmVhdGUgbW9kZSAxMDA2
NDQgaW5jbHVkZS9tZWRpYS9pbnRlbC1jaW8yLWJyaWRnZS5oDQo+Pj4NCj4+PiAtLQ0KPj4+IDIu
NDEuMA0KPj4NCg0K
