Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F44B570ACB
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 21:34:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiGKTex (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 15:34:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42036 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiGKTew (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 15:34:52 -0400
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CA6D2A25B;
        Mon, 11 Jul 2022 12:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657568091; x=1689104091;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=+n5mUWPJ2adjWTEkh93wkDOkwZaoSBttpFBWA3O/0h4=;
  b=Xtr98cQFE6yTxXYvbj2DRLmn22MhSYXOpgw1Kqb2HVhtqNzbVf0DwcuF
   eSua5FSVT2FtvnqAs3sOKmXsgOev7txpibJnt0/c6jpVvCPufcp2lRnOj
   HDZ2/wutFNBZOvc7gc2znfV1Gvn3BAek3e3ddE1ERIi4UMsB9QDLkj+6e
   t/VnG/90mOS0IxfJaS3mdT8UXSByw5Ks2l6gq1bPWiAtaghTw/gpVFKss
   VXf8iBB31bpLp46yBw3zGZbWSNcH0OFTBlv3Qjl/ISUjr0rLfolQYwyKT
   b9/7Bb9MxZqo7hjVpoyR6OVSwtWISaM8tIWrTgdGtVfBCzynEbLsjiBIH
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="283506620"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="283506620"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 12:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="545139054"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
  by orsmga003.jf.intel.com with ESMTP; 11 Jul 2022 12:34:30 -0700
Received: from fmsmsx607.amr.corp.intel.com (10.18.126.87) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 12:34:29 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx607.amr.corp.intel.com (10.18.126.87) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 12:34:29 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 12:34:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 12:34:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kjP+/fz5hV4SBgwUsRR7NT79TWkdAud0B7Zp6ToxfTelWaws++BWOUFOjxGupfbPVd4/aOqFfH0VaUPWEP6vhEfl7vA8ratkdxRxJLAzCqrq+GGzZeycTnb6WhT2HX4nmklVeGas23RwSm8sP0mQundHaqML+dE4R1MS1N9dBh5aMQxHYPm2znRnE9jX/ch9lnS73MEyE0mNIjI1YTXPYmv4T/hWbJHMzbIg/mBPuAz486sK9Q4dHs6atXlW23t2fPHUlr4Y8NwbO14XxSYpuKeAvtvEasQDyELfhQu/A9gkXk42P92FE0+p4aZVGxsw2QuCQ+Q6Xx4ZoiW03oB7kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+n5mUWPJ2adjWTEkh93wkDOkwZaoSBttpFBWA3O/0h4=;
 b=X4wqIFdHWxZKpMpm2ANNS1zbilTG+5aXEMESy8aFMlhlWwoAYscWvVZ5bg24APBJULtV3jy2QUJsilbb6mVWFHde7fOyrCnYGCsEe2BFWPDNbNod1cIok7ZbvpeOit1xxWcdgvpOIl0Blf4BLOnj2Goxifa2oTcYZhdVGgB8hObbJ4hohOu4MvCzP8YvWdOClgIbwa6Xa7A0fYWE5f5bIe7gmnZHDcCa9PxVxaMyLbLmB5r3XBJUU4JqpvRCEt/s387+Cp5y3wUM3qwzau3zF/Vsdx4v6wE0N9zl9ZnRoYPPObED4LVVWf+DJ/z3nETeFg2VUO2Zj0Wqk0JDzGcijA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 19:34:27 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 19:34:27 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 1/6] media: i2c: ov9282: remove unused and unset
 i2c_client member
Thread-Topic: [PATCH 1/6] media: i2c: ov9282: remove unused and unset
 i2c_client member
Thread-Index: AQHYlP6WMgbhsSMYgk65UuVvluoIv615kHeA
Date:   Mon, 11 Jul 2022 19:34:26 +0000
Message-ID: <70624f19fea24c276f7fb828f52d2357b1f48316.camel@intel.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
         <20220711081639.150153-2-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220711081639.150153-2-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 34b1837f-a082-4ffd-4cd8-08da63745df8
x-ms-traffictypediagnostic: SA2PR11MB4828:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ceWNonvXvtdBZ33hCt8QmBgxamOCJ8GZAhwqwkpSeDNLkhj3fKu6CVl82eyVvqIUylew5J7g3lyww4/IssL9G71coDvkZ07YBqS+ct+8Sfzc7SPP2uTmVNkynv+NKFzikMRs7K2O5fAvTMkJ9+FVnwe9nmClMitxSv/ivtE7gyHbvrZsgZ8iBFyUea+6xyysZbWaHW5rVZzg25a/YaVI4YLlP/3+cN/p3JZVcACTtWVcDJAE8/gN1Mrxb9saEH5l78g59SLdnp9i4KXUzdaVVOoV7mQ8m1IJcQbjRSW1aSbWTp5WJDEPH6Kz0jtQBwDpv10Xca0L4RLglU3Hu3QgJnrvfjc1YA/BJBt7jQOVTWLKZy4iORSyiPnqwfCtY/mXdeMKNksjZfgg8fZD89p6YYBIcRx7wxf1y5zGvGZdJ9KHW/ZHmJoDsWDp/PXa13e+uLUH02GsyWuzRfoELwDAcdAD1udI5E6/h/Ua1W2abCVyIRvYQPsFyrEE+fyGOGkT/4Ywn7QHzyX5QZho/EllmP5aXj1LjFl4q0KUGFQtwqE1GtXzF6NCvvy7D+m0fwfQh5NK50PXqBvu/9V62E7g54nXwy1neEIczWawF0FpYavyNCKwL/HE9wrLVkQhacaAvEXrt1HuA8AGxKzoC3kjHxy0JF0XBI7gcr48bKbkGCOHZfv/sI+VEQO1aVWTKsPOriM3ZMK6HIjTKOakGst2dThtzzdTWyzVw1Dtb7+pBtkrcukCZc8uSxLnf8k9CLMUnJQL9+VGIBn/IIVc46RvHcP6RKxw5d7crfsLhi2VC8BO3PaOI7iw1ZrjeKLM6hfG
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(366004)(396003)(376002)(122000001)(82960400001)(6486002)(4744005)(71200400001)(110136005)(83380400001)(54906003)(38100700002)(5660300002)(478600001)(316002)(8936002)(38070700005)(6506007)(4326008)(6512007)(186003)(2906002)(36756003)(8676002)(41300700001)(26005)(66556008)(91956017)(2616005)(66476007)(66946007)(64756008)(86362001)(66446008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDdURFZ4RXdaUGtaZElqMWVGV2gwZ0p0UHM3V1pXdjVjbS9BT2xpRTNoakZM?=
 =?utf-8?B?N1hzemJYcVdlNlZKY09FN3Q3VzYwR2Q2U1Y0a1lMTEVOK3JwSThyTU1BQUFx?=
 =?utf-8?B?andSSDlpSzJLMVcxY0VqbFc0Y25zbFMxSG1wRUpnTW5OOXU0NG00TEplMHNy?=
 =?utf-8?B?cFRLM0Jhd0pPb3hQYmRqcEJaZktIWXhmcVlPWHFSb05LVUVIYkFjV3hNc2x4?=
 =?utf-8?B?UkM5SWcxL21hZkY1dUZTMVYzZHdyY29GaXBTZExDdndSNG02M0VCdjRBSjha?=
 =?utf-8?B?dk44VDdoT3k3Y3cxcGR2bXFPQTBuWHROYnkrNmtXTGhCbHNhcGhUSGZaY2Vj?=
 =?utf-8?B?dG5EYlh5dUVlbFVaaHBTTWpobHhqQVh3QmZ3MWRlRlowMFh6eGZ5cXk2bHVi?=
 =?utf-8?B?a2JZLytwL0FFbWIvYkdSUHdiWTZUWEpmNUFRbkxlNHVhQzlKTGIxVVhCWGty?=
 =?utf-8?B?cGRkTFdLVnRzeGJRUHhNb2xSYktzdk9RWnUvWG1nNytoY1R5TlBnek9hcEhD?=
 =?utf-8?B?alFiYnZFYjd3WlRaMDlZNEVPZ1JMRHhkbnJqeUs1MzU0ak92U3NxcThoN3lw?=
 =?utf-8?B?eCtSOW1Edzl4V01VTVE2bFdoUkxSWDBCUUF4N0V0cFNFZlNwclByMXJJd1ZR?=
 =?utf-8?B?Rk1mRUJteVZpekVvQXlNZHpiK1pKZUNDcWZHU0k4Z09lV2IxUER3WElVSVFY?=
 =?utf-8?B?Z0pKRUVxZHBtQkdNdHdxVWgzWFByRVFsWjl5NUlPc290NTdnM0ErclVPUWYy?=
 =?utf-8?B?dzlIdVpaWUNKSUwxOHQ2SFRRNzMvS2FJTFVIdnY2REJSamphVHpyUXlQejIy?=
 =?utf-8?B?QlpSM1ZOWEdkLy8zaVFpOGU4bGppZ1hBTytOV2Fxdm5XRGZnVHVKOVVUV2w5?=
 =?utf-8?B?WllMUUlBWXJIcXNra2dndDVNNUFRS29UYmVFN3k3UDZMbTNVVnBTYWk2VDNH?=
 =?utf-8?B?dEhJNXpRVCs5K0NBSlYwZU5JMHVzVEhQbldFdURiRlM1cit6bmZHY1JrNG9C?=
 =?utf-8?B?RGorQW5Fb00xd2tSSW5mZEVCWFhzZldzZ0xkWFR4cTZRZlVZcFZndGM4VnJi?=
 =?utf-8?B?SVhkMUEvWXR5cUg2Y3l3Q0k0Z2NZMXc2NWFSOURDMVN5WFk4Q2x0Y2FOdWpC?=
 =?utf-8?B?TElzSDlaOTBBMHJIUHpsQi9YT2hZWTlWVUJqdXVxNWdjaDdxSjJTWGpodkR2?=
 =?utf-8?B?bTNaZElwL0ZER1ZnaktzYjNkZVEvWENvdGNlTXZSa2pLU1NublNOUlhTMlhm?=
 =?utf-8?B?THdZMnh6bEpEazFwTS9kb3BIdWJpQWRVeko2ZUZrQWhuaHZFTEhkMGw1MFlW?=
 =?utf-8?B?VFN0VnBnNC9QTUtGOU44WFdiOEs0NnFrd29xMnkrNzFYNGVHNStLaW5KbDUy?=
 =?utf-8?B?SDFJUzlVT0JMbEVLbG5kSlRzOWtQSFZiUjh0TUN3ckVaTlpVS3RIc210QVRM?=
 =?utf-8?B?c3JSdmNTb1VFaVYyenpOeXlVeVBMQWpOUXJPVFgvNkFzK3BOTUN4KzdIcHRG?=
 =?utf-8?B?YThJWUhZS0l6UUwyeTJ4c3ZHdERjWW9zeEI4cjhJSTU4bmlNdFZrTENabGxM?=
 =?utf-8?B?aFpyNk10WWszdFc4NzBNNEVvcTRyUXFQa25JQVVCUWxpL2ZTeUtSQXhYZUlj?=
 =?utf-8?B?SGxuU1hsYjYrVTNWeERXMnJlQmthVTZvR0M4YTJqenQ5emNydHJQVmVkUGhN?=
 =?utf-8?B?Rk84Q21mVjlsRlphQ0hqblhQU3lsRDBHemRsK1ovTlpLV2NGYXFpczNGRlJI?=
 =?utf-8?B?YU9HZzZxcjNXRC9hU3dGc01GZ3FoSmJBOVFKYnFmSVhMMUUxV0tJNEpQQWpl?=
 =?utf-8?B?cjAxeHZpWGgzVnZzaE5US3lPTWM5bmJrK2hsc1M2V29raDZ4MVdxVnZZOE5r?=
 =?utf-8?B?U0s4cjI1ZmhIdGQyNXNwR2JFTlF3RzdIQlBSNmE5WjJrM3dEOC9MNUM5dGxM?=
 =?utf-8?B?RmpOcGJwWm1Dbjlwa21IQ01VTXlpcCtYbnZZWTNka3M0MldYekdqNm8wVjBR?=
 =?utf-8?B?ZUZ5b3BNWWYzb0dXMFpWcUN4T3FGZjAwMEplUHJWUm56SXQxeWlmczBwRzRW?=
 =?utf-8?B?NElBOTdzdWlSendKbmt4OEpka3pCbVVVTm1nWXZIcC9VVWV4eHZIc0svck84?=
 =?utf-8?B?anlmUVRPNTRyMVU3T2FjREpJZXVTTmhhMDdDdDczajBvc05DSnF5NWJyS3E0?=
 =?utf-8?Q?cSMFzKWgTPrAHZnQmVzGOEM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9E4F0DBDA14C064299B1AB054955144B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34b1837f-a082-4ffd-4cd8-08da63745df8
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 19:34:26.9943
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6zoznATQlvFEW3dvd5WDqVDRfATfm31BFQ5W3lXGN/UhocDgJsrx9icSKb0J5ZqKwKjJkk+KUe32oF2/FSkXAErAaLnEM7WWok9fkbqNA7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIyLTA3LTExIGF0IDEwOjE2ICswMjAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6
DQo+IFRoaXMgaXMgbm90IG5lZWQgYW55d2F5IGFzIHRoZSBpMmNfY2xpZW50IGlzIHN0b3JlZCBp
biB2NGwyX3N1YmRldi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEFsZXhhbmRlciBTdGVpbiA8YWxl
eGFuZGVyLnN0ZWluQGV3LnRxLWdyb3VwLmNvbT4NCg0KQWNrZWQtYnk6IERhbmllbGUgQWxlc3Nh
bmRyZWxsaSA8ZGFuaWVsZS5hbGVzc2FuZHJlbGxpQGludGVsLmNvbT4NCg0KPiAtLS0NCj4gwqBk
cml2ZXJzL21lZGlhL2kyYy9vdjkyODIuYyB8IDEgLQ0KPiDCoDEgZmlsZSBjaGFuZ2VkLCAxIGRl
bGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y5MjgyLmMg
Yi9kcml2ZXJzL21lZGlhL2kyYy9vdjkyODIuYw0KPiBpbmRleCAyZTBiMzE1ODAxZTUuLjMyNjlj
MTk4M2JkNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvb3Y5MjgyLmMNCj4gKysr
IGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y5MjgyLmMNCj4gQEAgLTEyMyw3ICsxMjMsNiBAQCBzdHJ1
Y3Qgb3Y5MjgyX21vZGUgew0KPiDCoCAqLw0KPiDCoHN0cnVjdCBvdjkyODIgew0KPiDCoMKgwqDC
oMKgwqDCoMKgc3RydWN0IGRldmljZSAqZGV2Ow0KPiAtwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgaTJj
X2NsaWVudCAqY2xpZW50Ow0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IHY0bDJfc3ViZGV2IHNk
Ow0KPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IG1lZGlhX3BhZCBwYWQ7DQo+IMKgwqDCoMKgwqDC
oMKgwqBzdHJ1Y3QgZ3Bpb19kZXNjICpyZXNldF9ncGlvOw0KDQo=
