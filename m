Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7011F57CEB6
	for <lists+linux-media@lfdr.de>; Thu, 21 Jul 2022 17:15:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229732AbiGUPPq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 Jul 2022 11:15:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbiGUPPn (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 Jul 2022 11:15:43 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C35D76165;
        Thu, 21 Jul 2022 08:15:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658416541; x=1689952541;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=YCbfi4XHyUkrQkbedT4AEkkdprJHwsjkbm2DI933zvc=;
  b=ddTNxaDMoCmZzkPYuP3/dfiinraF1u3Gs8r29uiAHK+7WgDoLvyXHT3t
   U2/VsGZGB3DWccoyicCywgxRikmrMXzT4f1In3f563sL3E6UC8TDHIFKK
   iUWOYT/F8QYCWIhRLrkwxSkP7DS3xOPoR510evmc+ySWbE7+5cqbXG71K
   Vr2O2WolIPbKEVw4qsCGKz3b045PzIZjbEQBJuxb9QeL9kt0zjaLkECBy
   n2BVhEniO2GSc6nadH782kovxWDds6R5skQQgZJR4/IMLhcch//VllYzh
   gXwzME/prLONyktrcgaM3kHLZ90jMDsiwVBCvqkLs80rc2Gp8CGXHKEu6
   Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="348773553"
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="348773553"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2022 08:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,290,1654585200"; 
   d="scan'208";a="656788395"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga008.fm.intel.com with ESMTP; 21 Jul 2022 08:15:35 -0700
Received: from orsmsx607.amr.corp.intel.com (10.22.229.20) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28; Thu, 21 Jul 2022 08:15:35 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx607.amr.corp.intel.com (10.22.229.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.28 via Frontend Transport; Thu, 21 Jul 2022 08:15:35 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Thu, 21 Jul 2022 08:15:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T8gtRq9/o5n6rz7RP0ZnTfSbls5Fja8wo5rUcMhrt/kw6zWIcC7wGJ0FtxzkaLSu0+n7cAD/wgeI1x8ZxdSyBcsL+qK5KYGznWm0mhKw3IKLzjXZvOmyk5oFZDznnA/wzozWj68oLFk+B03lUQc3xjaSi+zTaNlCaiBUMvyNo2qTeUT5Rvq0pwBSj/33F3LSDmIFhObeNJEYBv27/LfoQfYDk5fs1mrVmw5M/0ozuVOq4IQjIxrSOE+aBp8zVK+tjKlwXiSOY4Fbva5CYAO8zf23bx9HB868KVo6hfqa2qqEmdu0/Xh47tifajnqlxRmfrb65LvBuXpYSST/FiPrGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YCbfi4XHyUkrQkbedT4AEkkdprJHwsjkbm2DI933zvc=;
 b=MBdSp6Tgc6FR2oAVqtpMS6T0oait9CM3PdI/oMThwYitsoNivDykdRhhDfgW1G14/C3rkBd2j4RlAPzTu43HYt8BFBexRKpyLIBbaahqT/ObFZXDm5W0TviQMZdUd8MvCbKKPShnZlzDfnkLBDhYsYAQqyyc2mzC8QQFpVFxB27sxfHmHmPQ685jN0MEuXPZtH5hg7mZGKVTTS3A2pQA6s9tHvhg+5Q7YvNZxM6hrG2ZqJPqMFwR7sDLQSMOYHaTqUIQpmZWIE5fhPgdeZ+mmiq1+p2iHCXN7Ue/EgyRi0SM1ALecZFS7DJW+mZWkuxhM5EtRvnWejf5awdSfgruUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by MW4PR11MB5935.namprd11.prod.outlook.com (2603:10b6:303:18a::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.19; Thu, 21 Jul
 2022 15:15:25 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::8d7e:2cf8:1437:2728]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::8d7e:2cf8:1437:2728%7]) with mapi id 15.20.5458.019; Thu, 21 Jul 2022
 15:15:24 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "jacopo@jmondi.org" <jacopo@jmondi.org>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "bryan.odonoghue@linaro.org" <bryan.odonoghue@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sakari.ailus@iki.fi" <sakari.ailus@iki.fi>
CC:     "konrad.dybcio@somainline.org" <konrad.dybcio@somainline.org>,
        "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
        "andrey.konovalov@linaro.org" <andrey.konovalov@linaro.org>
Subject: Re: [PATCH v2 0/3] Add imx577 compatible to imx412
Thread-Topic: [PATCH v2 0/3] Add imx577 compatible to imx412
Thread-Index: AQHYmkek5t1+JbcQI0SKNYyjX2tilq2I9NaA
Date:   Thu, 21 Jul 2022 15:15:24 +0000
Message-ID: <fe14541568ab201abac5cfd4914b750d54ef4aa6.camel@intel.com>
References: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
In-Reply-To: <20220718014215.1240114-1-bryan.odonoghue@linaro.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7695e08-74ea-492e-f3b2-08da6b2bd63b
x-ms-traffictypediagnostic: MW4PR11MB5935:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: yqAQJ/mvbkR9rk+8vaX/xio+JLhC3WJufOCZF0L6FQaZ9Wqmf0yqLpnQ+cJL8BMDr5RH3RLUkgCLPutiXtkChx/uE3Ns6QjnBbJRRKMDjHOpyO/5GiE46TYI/yxUYnQYFRkj6lZYwEpcdzbCvGnwiUrGePat3TrA2gxQ0JjYy1VY8M+auuZAmLB+3NLDw4SctRyeq+uDgFIYg0JsA1IvOILJgATPQ6yINvV4nCiqyskFsXtaMRtGJBJL8Rotvb79+pmakRaP8TycYqRJkq7sbPJAx2fiXghs/pz4Y5W4b+Pe5uiCYgaxts2gfcyec+CzgINmo5fUDX13htfQErM16+u/HeEMe0bCx6VjcqFK0jlf7IYkiKzqcKhDNv4XuiLyxZGI2iPZD+HCCSjMPRapgtLvVPLWLaT2RhwRrEvhTTKf7e+A8a/a3snj3sNgetfG1nx5dDG1zYwpBMIp6WC+KRjBMkXhhP79l5J2P1CIgna3dOcl2qKGDfZxWdvw6pm+Pe4OBTf+9w19y4Ri1uamtnLoqI0btLlYEhE0oknR/wWDFc4KH9pY1FQIvma265r6/Zo542hgXjC6Q1nxLE4Pljes2vVDfknCkJPSWX9Zx636vlASXhGSSBdUZPKvt7U5QXwf2tjVwTkMNrCpAfOUt6OGZXVk6VdAJq8socv4eGIs61Zn0HVuW87fping5aHS2ess452ujDDWw0ZbRfTULWZAkaspXTMDT4k9+Hykk6fkDlPmSwcaf7tZbB3G1K8tcLc93MC4OncZ9Tv9R9oat5Q5N8yO6E0ofvEAgmSRBSxYf/aL6UKsInXgepnmzGLro2lLy/n3qJsnUK7cOOtrpA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(136003)(396003)(366004)(376002)(39860400002)(64756008)(38100700002)(66446008)(6486002)(6506007)(66476007)(86362001)(2616005)(4326008)(76116006)(8676002)(66556008)(66946007)(478600001)(122000001)(26005)(91956017)(36756003)(41300700001)(966005)(71200400001)(83380400001)(82960400001)(2906002)(5660300002)(8936002)(6512007)(38070700005)(316002)(54906003)(186003)(110136005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?enFoc3llV3RvRTVldkc1U0tGYkdtaGpXckxna1VQTGhNNTM1cWdxSWVDMmxZ?=
 =?utf-8?B?d3h1M2lHQzJmK0tXWlVLT2JqRHR2VUFtMGx6NE1VY2hqM3RQNFh2RmNhYjVT?=
 =?utf-8?B?NTlhdkIwcm1uNjRTcnQ1RktTYWZyRW15cXFOemx6TEgwNWsyNEtYUXlqSC96?=
 =?utf-8?B?UVhhbmJFT3pHZElPK3hrUUpzVWx2SW9HUDgwTDJzVGx4OHVJenRlZHpvLzEz?=
 =?utf-8?B?LzRCZWt5Y0M5TUU4Yk9vajJRM0JzVVVsblBXWDF3NVA2R0IxSDJ1TTVYUzB2?=
 =?utf-8?B?OTlwRzRkRnp2d1RsVG4yM2FhYk1FcGdTWWRRL0Nuczc1OExjOWJ6c01IcnNW?=
 =?utf-8?B?aXRTYmx0QTYwS0dNSGsxS2lDTG1LNGE2U2NydDl5RXZPQThubUpMY3Rab201?=
 =?utf-8?B?TXIxUDkwMEVvb1QyZlRuYTl3bXFIQ0ZoQ0lId2l3SC96MWxuRGl5SUVBQkdW?=
 =?utf-8?B?RTlhVnhVdmtZYUFNMTg4VExnRDBjbFd6S2ZpaVJTc2lRSFNzRU5zSHkrME1T?=
 =?utf-8?B?aCs3aXRlLzd4R0FXSXpUNHNDc3hSL2h2YXlFU2NJeWJlR29BU1hLMU44Q0tr?=
 =?utf-8?B?cnpPK0JoN3p0STBUOGNoWGFYem0wVTUwZyttRXduQk14eWUwSGt3cndBdGpm?=
 =?utf-8?B?cVpoVmpxK0hmdTNjTyt4dGpyTTNHTU5EYzltdnNqeU53emRUQ0xuRWNKN1lT?=
 =?utf-8?B?VW1mcFRJeVFGbnJraDlZWm5vM2pURnl5bk9RRkk3bk1lYWozYUdvUmVscmVM?=
 =?utf-8?B?WEdPZU9FbFBTamlXNFRCKy96cml1SmNhb05zemlxTUFVdERUSis4WXYxNHlv?=
 =?utf-8?B?SHhOS3VrNnJxMmJ3K1dockk5Nkl5RjVOZ2w3LzhPdHpZOHl5WlJ3bVE1ZDRG?=
 =?utf-8?B?T3lEcXlkOHZlN05YaDN4OHF2em9qT1FCUGhNYTh6WmtFTmpqalBacWVJSEx0?=
 =?utf-8?B?L2NlNFhZY3h2bGY2eEpTaHpQQlp2TU8vd0ZzUUtRU3d0TmNlN3JpZVo1bGRU?=
 =?utf-8?B?QmZPN3dHcExoNnltNHlWbHRPeWp0RlltUlVldDE5Qkoxa1lIekNBc1hSVzBG?=
 =?utf-8?B?TnZZTEd2L2IzKzFkbVRrcTJOVTRQMEdWK3ZlNXV1WmpHdXlvekRLM0YwUGRJ?=
 =?utf-8?B?V3E1UDlTQjJDQjY1ZUxVOVNTbkpORmNGaEE3YmpCWGZSeUw4OTkxKzJQb0l0?=
 =?utf-8?B?K294SlMrZVRhZEcxbDhDUkZHc2VTS3NUeFB6UStyMkNlL2R3YzAxcFowc1lo?=
 =?utf-8?B?Y0RuOFhNZXJtT1hneDRvOElzcWw4VUVCeVZtd2RReGcyRHNlQTgrK0FFZENn?=
 =?utf-8?B?S1l3ODFNRk0yd2VxV3NETlJaNkVMUkx6cjQrdWNSbld3L2ZKRisrYUVneVZB?=
 =?utf-8?B?QjdXTmNzd0tlU2d5dUZKdzNVZFVIM01QTWhFQmlYT0Y4SWRYdWhXMFFyT0px?=
 =?utf-8?B?cnFsTG5UK2tBNkZ4WFFpY2pCSGtQVE9NWGN5ODVJMEE3RmI1MGlQVlZNTjVx?=
 =?utf-8?B?UlFsYmhsaHY5K0NjMHNYVTJDaS9DSmMycjZ1cHAxSHI3SjBTaW92YnhnSm95?=
 =?utf-8?B?NDVaRTNkMVRYS1pNT2UzckE5YzBDOENESWVraXVsMnh1RUFBK2hSZnkxdWhi?=
 =?utf-8?B?elFvbnBKNEdWVU9TbCt5VnNLekltcHFNcXBrU04wdksxZFZ0WE96NXVicVVS?=
 =?utf-8?B?N2NlWDJLdDVSeTdJYTYweUZCbXFMT1JIZjZFRnhNSWFINHJ3Mlh3YzNzczNq?=
 =?utf-8?B?TzJrNW5GTzV5RndHMDZ5SzFTOEhrR2s2NVV0SVRJTEpQNm9Ca0tMVmY3SG5H?=
 =?utf-8?B?TzB1RnU3U2JreEI0eUFoSEpQekFsZzk2LzhzbTVSanBQeTJaNVg4V0lST2xD?=
 =?utf-8?B?cVcvQXRiMnVvc3ROUlRXaHBFQ3U0bCszU2U2S1JCSEtwWlF6S056aFRBK1Zq?=
 =?utf-8?B?Yjc0cXJQSzJlVkEwZ1RIV3dmQ05TdTUrWWFtbEFOZDV5TDBSMCtFaFZpZ1pz?=
 =?utf-8?B?VE1zUW1oaUdRakY3eVpWRmNZeDlNaDVka3V6ZTdkVFlCS0Z1Q2xJQlh2VUwv?=
 =?utf-8?B?M0YweUFRZjhyTWpiQkUwWkwzSll1aGJmUEFTKzVuczRwTkR2NmNOekN6VlVu?=
 =?utf-8?B?eWpOUi9zUmR1dFF4N1EyVWJpK1VxNVltUGpWQ0FCMGM3d1BBYTFoME1UU1N3?=
 =?utf-8?Q?9+uMGyEkxQXLP7QI99+w5/8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <97D39C4BC575F54EB69FB60922938B2D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7695e08-74ea-492e-f3b2-08da6b2bd63b
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jul 2022 15:15:24.7896
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4FHDtKNuEMouH7L5sXIsz7gqhdAgYenNCx4jrrDhHk768Ei0/p8LqjGqrdbwfQ5YMtSoUzUgM7QGycIIGxX6Khk9aS3B8Pirm8lSnGWg3P0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB5935
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQnJ5YW4sDQoNCk9uIE1vbiwgMjAyMi0wNy0xOCBhdCAwMjo0MiArMDEwMCwgQnJ5YW4gTydE
b25vZ2h1ZSB3cm90ZToNCj4gVjI6DQo+IFNha2FyaSB3YXNuJ3QgZXNwZWNpYWxseSBzYXRpc2Zp
ZWQgd2l0aCB0aGUgYW5zd2VyIGlteDQxMiBhbmQgaW14NTc3IGhhdmUNCj4gdGhlIHNhbWUgaW5p
dCBzZXF1ZW5jZSBidXQsIHN1Z2dlc3RlZCBzZXR0aW5nIHRoZSBzdHJpbmcgZm9yIGlteDU3NyBh
cyBpcw0KPiBkb25lIGluIHRoZSBjY3MgZHJpdmVyLg0KPiANCj4gaHR0cHM6Ly9sb3JlLmtlcm5l
bC5vcmcvYWxsLzIwMjIwNjA3MTM0MDU3LjI0Mjc2NjMtMy1icnlhbi5vZG9ub2dodWVAbGluYXJv
Lm9yZy90Lw0KPiANCj4gSSB3ZW50IHRvIGxvb2sgYXQgdGhhdCBhbmQgYXNrZWQgbXlzZWxmICJo
b3cgd291bGQgSSB0ZWxsIHRoZSBkaWZmZXJlbmNlDQo+IGJldHdlZW4gdGhlIHR3byBzaWxpY29u
IHBhcnRzIi4gVGhlIG9idmlvdXMgYW5zd2VyIGlzIGEgY2hpcCBpZGVudGlmaWVyLg0KPiANCj4g
THVja2lseSB0aGlzIGNsYXNzIG9mIElNWCBzZW5zb3IgaGFzIGEgY2hpcCBpZGVudGlmaWVyIGF0
IG9mZnNldCAweDAwMTYuDQo+IA0KPiBUaGF0IGxvb2tzIGxpa2UgdGhpcyBmb3IgaW14MjU4LCBp
bXgzMTkgYW5kIGlteDM1NQ0KPiANCj4gZHJpdmVycy9tZWRpYS9pMmMvaW14MjU4LmM6I2RlZmlu
ZSBJTVgyNThfUkVHX0NISVBfSUTCoMKgwqAgMHgwMDE2DQo+IGRyaXZlcnMvbWVkaWEvaTJjL2lt
eDI1OC5jOiNkZWZpbmUgSU1YMjU4X0NISVBfSUTCoMKgwqDCoMKgwqDCoCAweDAyNTgNCj4gDQo+
IGRyaXZlcnMvbWVkaWEvaTJjL2lteDMxOS5jOiNkZWZpbmUgSU1YMzE5X1JFR19DSElQX0lEwqDC
oMKgIDB4MDAxNg0KPiBkcml2ZXJzL21lZGlhL2kyYy9pbXgzMTkuYzojZGVmaW5lIElNWDMxOV9D
SElQX0lEwqDCoMKgwqDCoMKgwqAgMHgwMzE5DQo+IA0KPiBkcml2ZXJzL21lZGlhL2kyYy9pbXgz
NTUuYzojZGVmaW5lIElNWDM1NV9SRUdfQ0hJUF9JRMKgwqDCoCAweDAwMTYNCj4gZHJpdmVycy9t
ZWRpYS9pMmMvaW14MzU1LmM6I2RlZmluZSBJTVgzNTVfQ0hJUF9JRMKgwqDCoMKgwqDCoMKgIDB4
MDM1NQ0KPiANCj4gYnV0IHRoZW4gbG9va3MgbGlrZSB0aGlzIGZvciBpbXg0MTIuDQo+IA0KPiBk
cml2ZXJzL21lZGlhL2kyYy9pbXg0MTIuYzojZGVmaW5lIElNWDQxMl9SRUdfSUTCoMKgwqDCoMKg
wqDCoMKgIDB4MDAxNg0KPiBkcml2ZXJzL21lZGlhL2kyYy9pbXg0MTIuYzojZGVmaW5lIElNWDQx
Ml9JRMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAweDU3Nw0KPiANCj4gVGhpcyBtYWRlIG5vIHNl
bnNlIGF0IGFsbCB0byBtZSwgd2h5IGlzIHRoZSBpbXg0MTIgZHJpdmVyIG5vdCBuYW1lZCBpbXg1
NzcgPw0KDQpJIHRyaWVkIHRvIHJlYWNoZWQgb3V0IHRvIHRoZSBjb2xsZWFndWVzIHdobyB3cm90
ZSB0aGUgZHJpdmVyIGJ1dCBpdA0Kc2VlbXMgdGhleSBhcmUgbm90IGluIHRoZSBjb21wYW55IGFu
eW1vcmUuDQoNCkhvd2V2ZXIsIEkgbWFuYWdlZCB0byBnZXQgdGhlIGlteDQxMiByZWdpc3RlciBt
YXAgZG9jdW1lbnRhdGlvbiB0aGV5DQp1c2VkIHdoaWxlIGRldmVsb3BpbmcgdGhlIGRyaXZlciBh
bmQgdGhlIHZhbHVlIGF0IG9mZnNldCAweDAwMTYgaXMNCnJlcG9ydGVkIHRvIGJlIDB4MDU3Ny4N
Cg0KSSBhZ3JlZSB0aGlzIGlzIHN0cmFuZ2UsIHNvLCBuZXh0IHdlZWssIEknbGwgdHJ5IHRvIHNl
ZSBpZiBJIGNhbiBnZXQgbXkNCmhhbmRzIG9uIGFuIGlteDQxMiBzZW5zb3IgdG8gdmVyaWZ5IHRo
ZSB2YWx1ZSByZXBvcnRlZCBieSB0aGUgSFcuDQoNCkluIHRoZSBtZWFudGltZSwgd291bGQgeW91
IGJlIGFibGUgdG8gY2hlY2sgd2hhdCAxNi1iaXQgdmFsdWUgdGhlDQppbXg1Nzcgc2Vuc29yIHJl
cG9ydHMgYXQgb2Zmc2V0IDB4MDAwMCAod2hpY2gsIG9uIHNvbWUgSU1YIG1vZGVscywNCnNlZW1z
IHRvIGJlIGFub3RoZXIgSUQgcmVnaXN0ZXIpPw0KDQo+IA0KPiBJIHdlbnQgYW5kIGR1ZyBpbnRv
IHRoZSBRdWFsY29tbSBjYW14L2NoaS1jZGsgc291cmNlcyB0byBmaW5kIHRoYXQgYSBmaWxlDQo+
IGNhbGxlZCBjbWtfaW14NTc3X3NlbnNvci54bWwgaGFzIGEgcHJvcGVydHkgY2FsbGVkIHNlbnNv
cklkIHdoaWNoIGlzDQo+IGNvbnN0cmFpbmVkIHRvIDB4MDU3Ny4NCj4gDQo+IEluIHRoZSBRdWFs
Y29tbSBzdGFjayB0aGlzIHBhaXJpbmcgb2YgZmlsZW5hbWUgYW5kIGlkZW50aWZpZXIgaXMNCj4g
bWFpbnRhaW5lZCBmb3IgaW14MjU4LCBpbXgzNzYsIGlteDQ3NiwgaW14NTc2LCBpbXg1MTksIGlt
eDM2MiwgaW14NDgxLA0KPiBpbXgzMTggaW14MzM0IGFuZCBpbXgzODYuDQo+IA0KPiBFdmVyeSBz
aW5nbGUgZXhhbXBsZSBJIGNhbiBmaW5kIG9mIGEgU29ueSBJTVggc2Vuc29yIHdoaWNoIHJldHVy
bnMgYSBjaGlwDQo+IGlkZW50aWZpZXIgYXQgb2Zmc2V0IDB4MDAxNiBtYXRjaGVzIHRoZSBkcml2
ZXIgbmFtZSB0byB0aGUgcmV0dXJuZWQgc2Vuc29yDQo+IGlkIGJvdGggaGVyZSB1cHN0cmVhbSBp
biBMaW51eCBhbmQgaW4gUXVhbGNvbW0ncyBjYW14IHN0YWNrLg0KPiANCj4gVGhlIGNvbmNsdXNp
b24gSSBkcmF3IGZyb20gdGhpcyBpcyB0aGF0IGlteDQxMi5jIGlzIGluYXBwcm9wcmlhdGVseSBu
YW1lZC4NCj4gDQo+IEkgdGhpbmsgdGhlIHJpZ2h0IHRoaW5nIHRvIGRvIGlzIHRvIHJlbmFtZSBp
bXg0MTIgdG8gaW14NTc3LiBJdCBpcw0KPiBjb25mdXNpbmcgYW5kIEkgdGhpbmsgd3JvbmcgdG8g
cGFpciBpbXg0MTIuYyB3aXRoIGEgY2hpcCB3aGljaCBpZGVudGlmaWVzDQo+IGFzIDB4MDU3Ny4N
Cj4gDQo+IFYxOg0KPiBSaWdodCBub3cgdGhlIGlteDQxMiBhbmQgaW14NTc3IGFyZSBjb2RlIGFu
ZCBwaW4gY29tcGF0aWJsZSBob3dldmVyLCB0aGV5DQo+IGFyZSBkaXN0aW5jdCBwaWVjZXMgb2Yg
c2lsaWNvbi4NCj4gDQo+IERvY3VtZW50IGlteDU3NyBhcyBhIGNvbXBhdGlibGUgZW51bSBhbmQg
YWRkIHRoZSBjb21wYXQgc3RyaW5nIHRvIGlteDQxMi5jLg0KPiBUaGlzIGFsbG93cyB1cyB0byBk
aWZmZXJlbnRpYXRlIHRoZXNlIGNoaXBzIGluIERUUyBhbmQgcG90ZW50aWFsbHkgdG8gYXBwbHkN
Cj4gYW55IGZ1dHVyZSBpbXg0MTIgb3IgaW14NTc3IHNwZWNpZmljIGNoYW5nZXMgYXBwcm9wcmlh
dGVseS4NCj4gDQo+IEJyeWFuIE8nRG9ub2dodWUgKDMpOg0KPiDCoCBtZWRpYTogZHQtYmluZGlu
Z3M6IG1lZGlhOiBSZW5hbWUgaW14NDEyIHRvIGlteDU3Nw0KPiDCoCBtZWRpYTogaTJjOiBpbXg1
Nzc6IFJlbmFtZSBpbXg0MTIuYyB0byBpbXg1NzcuYw0KPiDCoCBtZWRpYTogaTJjOiBpbXg1Nzc6
IEZpeCBjaGlwIGlkZW50aWZpZXIgZGVmaW5lIG5hbWUNCj4gDQo+IMKgLi4uL3tzb255LGlteDQx
Mi55YW1sID0+IHNvbnksaW14NTc3LnlhbWx9wqDCoMKgIHzCoCAxOCArLQ0KPiDCoE1BSU5UQUlO
RVJTwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgfMKgwqAgNiArLQ0KPiDCoGRyaXZlcnMvbWVkaWEvaTJjL0tjb25maWfC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDggKy0NCj4gwqBk
cml2ZXJzL21lZGlhL2kyYy9NYWtlZmlsZcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHzCoMKgIDIgKy0NCj4gwqBkcml2ZXJzL21lZGlhL2kyYy97aW14NDEyLmMgPT4gaW14
NTc3LmN9wqDCoMKgwqDCoCB8IDYyMiArKysrKysrKystLS0tLS0tLS0NCj4gwqA1IGZpbGVzIGNo
YW5nZWQsIDMyOCBpbnNlcnRpb25zKCspLCAzMjggZGVsZXRpb25zKC0pDQo+IMKgcmVuYW1lIERv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZWRpYS9pMmMve3NvbnksaW14NDEyLnlh
bWwgPT4gc29ueSxpbXg1NzcueWFtbH0gKDgzJSkNCj4gwqByZW5hbWUgZHJpdmVycy9tZWRpYS9p
MmMve2lteDQxMi5jID0+IGlteDU3Ny5jfSAoNTUlKQ0KPiANCg0K
