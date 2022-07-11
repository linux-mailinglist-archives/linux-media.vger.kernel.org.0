Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13EF2570ACD
	for <lists+linux-media@lfdr.de>; Mon, 11 Jul 2022 21:35:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbiGKTfD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 11 Jul 2022 15:35:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42154 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiGKTfC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 11 Jul 2022 15:35:02 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AA752F030;
        Mon, 11 Jul 2022 12:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1657568100; x=1689104100;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=ipLG2jefY3q85FQI2DwP/PHjeZZe99rCde22BlQ/4ug=;
  b=X6rbpRL4Aveim5ocPdD9js4p+qGSCXC1GChbLqmSVuyHZJwxmR2RggHk
   6JSiIF987dEdQL3+LYePs9279IxLOBry8Dl/vTd45BHZU6EF3WaFDCFTQ
   L/HqhA0v14wL50ubkonfkFmkv2CAQaIFt3g6AOi4nycSn2QvXpd4NAwrg
   AWHNfAOBBzkqLaWqOy+QPF+p0rv4CVBOwb3Ez2p+w2zq/dpBP6xq+G3ll
   MwOdpZJqfbe5kMh9ekemKkwc04P70AhJk6sc2lb69GeKkBLNbtofT6RGs
   kLT8LRpDsZNB2zS6oI2iXTVnsZzFtjgcItDhA3aA2B3YktSma+V67vd3Q
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="285495542"
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="285495542"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2022 12:34:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,263,1650956400"; 
   d="scan'208";a="569899868"
Received: from orsmsx606.amr.corp.intel.com ([10.22.229.19])
  by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 12:34:55 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX606.amr.corp.intel.com (10.22.229.19) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Mon, 11 Jul 2022 12:34:55 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Mon, 11 Jul 2022 12:34:55 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.169)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2308.27; Mon, 11 Jul 2022 12:34:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kcuEBr/jN0Goj/jxhNw8OiXzRSVT4L9uyceQDPoO+wloGHZl66k5yKJRsYUFncFsquJ1N/NnG1vdDaXKZ4BkJVZxqBlmdwtUcOtfhCMrAn13JJEu25/yoeIP+anvRgpTdT4CsJTff5/mjml+sgBl/Q0brOHmZenjGNLDkU6LljjBr5cEehdBZkfAltXLR+tyKTOrAWJ5l4TM6j3VlaOACzUM7GD8l3ykP0LUpeKV4vHplpToUIh5/gRsbVP9t9TaHnxgKtRiQ+vexEcblewjjOwZD2s52EfW8xyKuXieA0bSVH32wH/1kmxJPAjBuIJ4serraQ7evpFPu+c7at+UqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ipLG2jefY3q85FQI2DwP/PHjeZZe99rCde22BlQ/4ug=;
 b=BIvwod+IAYjNmi2P+Kc0SeRDg7U0fheAmfIZNLjCsv/t70Dsw9rv8REhoqq0t10fAkxx2vzPk34DRBxJLam47k9xpFHC+Nh701VYqQCwkOhB2Cs23wYZF1BoqHyfbo+VrJQ/yZFICcndhkdnNnJ8pDx1m+H3RTgtHIhSfJhOJPckYl4rVy1R18+gD+cQEfrGbJrBIRh1oaY/hMakMFOofh252uLSZNTexbHb/8aLWVZbLJocEoAfhVnnsmWoJfI7esu40BQP5q8zyj+OTSiVhOMzsIH68wX6G1arK0g3tfXjicYotPhvA+ZvQp/5e8aonVR8dCHjgZSHVcwt2j8r6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by SA2PR11MB4828.namprd11.prod.outlook.com (2603:10b6:806:110::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5417.16; Mon, 11 Jul
 2022 19:34:53 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::dd4e:b4a9:f7ca:1b5b%7]) with mapi id 15.20.5417.026; Mon, 11 Jul 2022
 19:34:53 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH 3/6] media: i2c: ov9282: Add ov9281 compatible
Thread-Topic: [PATCH 3/6] media: i2c: ov9282: Add ov9281 compatible
Thread-Index: AQHYlP6YgXx/VR4MGUirneWwxx7AT615kJcA
Date:   Mon, 11 Jul 2022 19:34:53 +0000
Message-ID: <cbd46ea8583ff32071ccde2d5e00acace3ac686c.camel@intel.com>
References: <20220711081639.150153-1-alexander.stein@ew.tq-group.com>
         <20220711081639.150153-4-alexander.stein@ew.tq-group.com>
In-Reply-To: <20220711081639.150153-4-alexander.stein@ew.tq-group.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.3 (3.44.3-1.fc36) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 8e9331bf-2e3e-4185-afab-08da63746db7
x-ms-traffictypediagnostic: SA2PR11MB4828:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 91LlBSzC4S4yjydL3aEqU8J2PkzjoDM7mwsmrP2IX91k8PLK1AwFL8McuoV51LaEFdwDGJdtBpEQBfIW25TO+i66pKWMDHDG6/cLDMsmg7F5xwn9JgV4IGE/gmdVJUkqInL3Ep5nIcnMKEuuS4Pcyuo/X1mQi5SwM3yO6mqC99i0xkd+IJDAMV0JMlPdr1MwXjsUTKL+/CH8Xt/KNnNlep0m4e0h+HK71AQO9+kk4pv6LwFttTlQYtS+CSmo3DGXyA6DqJwClnDRcjlSljUg0VkhWMgftCQbA2JsCeOLA3RVY7DbiFwPpN0keJ6olPJUQSwknZSRaDW+mOS+9+q2c3SzO31UwXSYGRjaaXtxrswAFgjNzY3Ph+6fkHpvJs6hNlVzIEX0lqtNcsyn28JWzZHpYVc4QjKDq5rHauwoHFw+ylDyEEkNctAhLFozjprWYT6eFcq6Y9GMEG2o8z+Vr40JS9fQVvBpQ40nwGePwDGU80Y1iCf1V3aygi00p3aNTDWX+zaTzXLg1CmtK7e9itrV07qw1KQtIjGwQ5OChTMwwKNoCMYtjXj31qKypSdka0l/yIG0gzSUr9hBXQDFuA334iG0xJZWZTo9sgdxiD4YdFP3O8dq/NNi8YhHv9X30ApP/RKhvIrP0hHISMZRlgSLV7LH2vh5fgQaLCw1RCjuOdh3ZYKLLUp2W+32CLoRobUPtaaCOarTozrO3IKWnBgKX7sGpMvT+Upm3Y00RA51Q/kPNXdz0hCayDP9Esqfam8L7qSWxalYFVu1hrYRZGp1SOxdDMREIQFVR0176gGRJpHq9+/GOxQaDIn12gOB
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(346002)(39860400002)(136003)(366004)(396003)(376002)(122000001)(82960400001)(6486002)(4744005)(71200400001)(110136005)(54906003)(38100700002)(5660300002)(478600001)(316002)(8936002)(38070700005)(6506007)(4326008)(6512007)(186003)(2906002)(36756003)(8676002)(41300700001)(26005)(66556008)(91956017)(2616005)(66476007)(66946007)(64756008)(86362001)(66446008)(76116006);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YTB4eHJJMXdtOFdPV3l2TEdEREZGSVFYQWFpNUpiTkh4dGpodEFlb3daTExW?=
 =?utf-8?B?azVpUmxOTTA4U014TlVCTEZ2a3JUcFMxZUxKb2lZSkFFTjhTbnViLzA2SU00?=
 =?utf-8?B?WnZvTWJaemdwc3U2K1cvSHk1N2N6Ti9oUjM3NklYR2lZVWFyYkNmUnBHOG9V?=
 =?utf-8?B?TkVXZXBpaTlYb3Y1U0FNcWZUNmwrOWthNHQ3Sjc4SUZ1ZnRJR2I0Nzc3a1FR?=
 =?utf-8?B?NDlCUU5kakEvQ2FqTGRqbk1UZnBWMkN5andaQ3FicEwrdVpRTHBSSkVLTVhJ?=
 =?utf-8?B?elRwRGFPUnRnZ1NZTzllWjVBcUF6cGFmVEtpQVNld0JWYnNFb2RGVlMxc3hX?=
 =?utf-8?B?dHJ0OE9uV3J3alZOQmlORU4xS1JtbzVncHJTLzJVY09lUXRndWtGOU5iRkxV?=
 =?utf-8?B?SGU0ME5IQ2lTelpWTnI0QnBEbHhEU0RtQlN1dW1kdnpBeS9hOGYyWnRFMVBK?=
 =?utf-8?B?U2RtRnVxNlRZMlhjUGhJZnhOYitTdlpKdERQVFdrbWtyQ1JOV0VLL1dxd1Ro?=
 =?utf-8?B?Q3NWTmJGKzJmV3IvNnlOb0NrM1pmUEd1bnJURlJwRk9OUzJib2lDM09ocFFZ?=
 =?utf-8?B?TUtJM2E3L01rUnJ4L2wwcE5mQ2l6SkJOWlNmdUgyQ2cxa1ZSNzd2N0k0alZW?=
 =?utf-8?B?bUV1UTdFNFpzSnR0SEsrNWZkUTNSenFTTE9nRUJmQmJxaFh0Q0FOTDMvTFU1?=
 =?utf-8?B?SzFUNHNJT0hXRmJra2VSdTZWUkJHSlJUdnA5NzNuN2k0TG4velEyUWcyTDli?=
 =?utf-8?B?amZ2S2NvQTJQZ2pubitkTElRNTZ3NENNVkl6L2FicFhiYXhYNzZVQ09Cakth?=
 =?utf-8?B?ZXVvMWtVTktjUUlFM1p6bnZpWjRwbUR1cVBNU1Uzb3dTczFINUh0VWxsK1dB?=
 =?utf-8?B?eFYyaGlFa1psTGI5QlYwQ29wemJNTTY3US9Xc1c3Z1lRa2s5QnpyRm9kL0xu?=
 =?utf-8?B?dGQxNmltSUdWYU5sd1BOOUVkZnJ1dXlFSHFGQUZpSFluRmg5VTE0Q0lIbUVV?=
 =?utf-8?B?MVJWT29yYWVncGRjcXBOQjh3eTVNK2dlREtHWmZlUE51alFzd2F6ZC82NnJN?=
 =?utf-8?B?RHJ3VWUvZUdLSHdFZkxCVlhLRW1YR2xDdmJkZzQ2N3h3M01JWWY3NUxhQVVG?=
 =?utf-8?B?UlpnNEhsa1NtaGxMZzFsWGE3UTBMVHdtUUpPaHdoQ0lwWUVhWjU3Uk1hamtj?=
 =?utf-8?B?dHJyLzRVWDdUUjBJTVkxWE51TTl3c2VMblVxS3E5NFc1N1dBa09zSmw1TUZu?=
 =?utf-8?B?ZXI0Q1M5Y0I5T1loU0d4NlgxcU9UVnR5MFNMM21TQmtDaFAwOUJVRjlLN0Jy?=
 =?utf-8?B?V251MUo2emFMTE4zdUhZRHJDSEdrV1Y1ZnVoUTRTNVllelRlQ1N6ZTVqTlly?=
 =?utf-8?B?R2FNbkIvWGszS1JVclVHREl5TWVCRlpvUW1JeDFtd2NMdW5WdGdjSDBsdlMr?=
 =?utf-8?B?djBYcDZaSFovTkxDKzYzbmtCQVhVd0JBcTNuRnllL0FqRElJZTI5WWZoQUhS?=
 =?utf-8?B?OUJvYjZVdkhPSVpyMDYvZ0NCYXNnVVdQWGdrSjlRdG5LMFBCa3N0OEs3Z1ND?=
 =?utf-8?B?RklxUVk3QkR1QlRVMjFsU1NuaFQxdE5uWkJmZGxma0xONzNETXJpUUU2c25F?=
 =?utf-8?B?SU83ektYT0s2MW9wd21QV3lGaTFSYTc4ZThxQXBKRTl6bGFXc0lBUGU0V1NF?=
 =?utf-8?B?NFJ4RDc2L214NWdYOUxTT1M5QWszOFlmdDdqdmViUGhUa0pIVnJvT084aGxW?=
 =?utf-8?B?Szg5REVPTUJoWjNyd3Q5Mk0zd1JtSDB1N3JLUUV2Q1ZnWjNZbWNoMWQ1Rkc2?=
 =?utf-8?B?Q0UvUUJwTDlBWUVncjdDMWNKcTF5K25jcjJGRHFBNEp4dGFncmJvbUVxc1Y2?=
 =?utf-8?B?dGhBY01SdGh5QVptOTd3NE8vZDZISGVFQlBhRStaVnV5R09sTkt2d3UxS1cx?=
 =?utf-8?B?NWJSS04rTkN4dVplblhLN1M3VnRPdmlpbFpDWjg0VjhTNW4zTjNLU3RQeHl3?=
 =?utf-8?B?T0JJbHRTSFIrd3ZvK2pyUlVMRXNNUGtTaGg3aDI1UEM0THlyZ21PZzh3Y09R?=
 =?utf-8?B?VlFDMFdGS2cvbEdUMmoxblNUM0p0alc3cXFEUlBYWVA3cldwK0wraVRZaDFY?=
 =?utf-8?B?bEJMZDkwODlSbTMwRXNNdWxydzcwN1JsMFhTU1hrNlJULzFlTTB0aXlScVdJ?=
 =?utf-8?Q?7tMMFXvtCuEnPOn6qZ83ssE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8EB27B1E0652D4A85761EBA6EE029B2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e9331bf-2e3e-4185-afab-08da63746db7
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2022 19:34:53.3988
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fmoxoD5kzqmC/vYVpOQ8ZdXU5xO9Y3dARtQCr0Qd7EtX3i8ac/EWTPX3PpdINhFb4GFFazV1M8cTbBD3Ljpt5qO1SXkArGPHQRTv4Ue6Qnc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4828
X-OriginatorOrg: intel.com
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gTW9uLCAyMDIyLTA3LTExIGF0IDEwOjE2ICswMjAwLCBBbGV4YW5kZXIgU3RlaW4gd3JvdGU6
DQo+IEFjY29yZGluZyB0byBwcm9kdWN0IGJyaWVmIHRoZXkgYXJlIGlkZW50aWNhbCBmcm9tIHNv
ZnR3YXJlIHBvaW50IG9mDQo+IHZpZXcuDQo+IERpZmZlcmVuY2VzIGFyZSBhIGRpZmZlcmVudCBj
aGllZiByYXkgYW5nbGUgKENSQSkgYW5kIHRoZSBwYWNrYWdlLg0KPiANCj4gU2lnbmVkLW9mZi1i
eTogQWxleGFuZGVyIFN0ZWluIDxhbGV4YW5kZXIuc3RlaW5AZXcudHEtZ3JvdXAuY29tPg0KDQpB
Y2tlZC1ieTogRGFuaWVsZSBBbGVzc2FuZHJlbGxpIDxkYW5pZWxlLmFsZXNzYW5kcmVsbGlAaW50
ZWwuY29tPg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvbWVkaWEvaTJjL292OTI4Mi5jIHwgMSArDQo+
IMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9tZWRpYS9pMmMvb3Y5MjgyLmMgYi9kcml2ZXJzL21lZGlhL2kyYy9vdjkyODIuYw0KPiBp
bmRleCAzMjY5YzE5ODNiZDUuLjA0ZmRhODIyMmUwNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9t
ZWRpYS9pMmMvb3Y5MjgyLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS9pMmMvb3Y5MjgyLmMNCj4g
QEAgLTExMTQsNiArMTExNCw3IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBvdjky
ODJfcG1fb3BzID0NCj4gew0KPiDCoH07DQo+IMKgDQo+IMKgc3RhdGljIGNvbnN0IHN0cnVjdCBv
Zl9kZXZpY2VfaWQgb3Y5MjgyX29mX21hdGNoW10gPSB7DQo+ICvCoMKgwqDCoMKgwqDCoHsgLmNv
bXBhdGlibGUgPSAib3Z0aSxvdjkyODEiIH0sDQo+IMKgwqDCoMKgwqDCoMKgwqB7IC5jb21wYXRp
YmxlID0gIm92dGksb3Y5MjgyIiB9LA0KPiDCoMKgwqDCoMKgwqDCoMKgeyB9DQo+IMKgfTsNCg0K
