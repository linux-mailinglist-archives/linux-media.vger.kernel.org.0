Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 57B6436B035
	for <lists+linux-media@lfdr.de>; Mon, 26 Apr 2021 11:08:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232134AbhDZJIp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Apr 2021 05:08:45 -0400
Received: from mga14.intel.com ([192.55.52.115]:36381 "EHLO mga14.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232068AbhDZJIo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Apr 2021 05:08:44 -0400
IronPort-SDR: OI+MzMobPHliAxOohUBpnv6S5nLuhdzvU6V8FEv8EVKJ2YLXR+PvujUfjQ3IvPJs3A/kDydtSw
 e+/eWJ6op+Pg==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195857430"
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="195857430"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Apr 2021 02:08:02 -0700
IronPort-SDR: fYMhU1aHYtzWdFQciCeLfZjnuX1u49R54BZXfKdonLj0fvpry7wzSzC3pVuTvbRlwum36998UF
 2fGDHgFL9u+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,252,1613462400"; 
   d="scan'208";a="525678287"
Received: from orsmsx604.amr.corp.intel.com ([10.22.229.17])
  by fmsmga001.fm.intel.com with ESMTP; 26 Apr 2021 02:08:02 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX604.amr.corp.intel.com (10.22.229.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 26 Apr 2021 02:08:02 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 26 Apr 2021 02:08:01 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2
 via Frontend Transport; Mon, 26 Apr 2021 02:08:01 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.104)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2106.2; Mon, 26 Apr 2021 02:06:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YHBDcsEcCuOmmCkospJG3f3w8jBGBqpTIc0ZoK6beAGVqURfB8qSA08pxuF7ii9C68I7f1yhSN8ZRdVJq3HKZKum8yiG8/4ErFd0fQ5gRywksZ4+LSn0veA6P/2TvtKEeDZOIM3zQkGiXxF4E4jDk4Ep4waHlqccqf/F445Gwl2rgZbjssecO/NqZ0m543A/hpJlswoczxbROgD/TWEu2paSzJJWcSs6pH7RKu5RGB7q5X3JOXxkEqbGTHZFfbAghUQh0Vekq6otAw5RB1tjvXZhcv1MnwVcwLMINPRqTq7LsEUe2JuLXiriRRUSzmacQLZozczWm35+2lbnF/wdew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hxOPyN3c1uHhSil+UqObKlh10AO/bBZuNTWVJ3Ccgg=;
 b=WG/OCphPk6qLELOvs3bfNkxZRNeSt+dmFPJ5fxgY3CNr7ndH+ZTtdSSrBcxe6csCSD4PrfHg/FoSRouMuaWpU0PE4sb/mIv3vVuSyqz7FhRFPVRf92L+DRprwsy0TYGuuHjjz2tGXWQWH1RWVlqjecRY0zu5ymgseTVIk1prU51zrvyjZG3Ze83iPC3N/euolsxlj37zCwLYRSAqKOd+U8J7QzdQVaqtyD2kiE2aAnkInyEV5Yo7IYjZRc2Cy/u4RadQERaKNwLm18NT1BdS989VNucXwIfOp9cfMyvuBhDwrgWjQ/0SOi3vSYGS2s1z98/Q5Q9j/zf/WbH7hkk23w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.onmicrosoft.com;
 s=selector2-intel-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1hxOPyN3c1uHhSil+UqObKlh10AO/bBZuNTWVJ3Ccgg=;
 b=UwvQTcF3EnA2u0vxwNXBxZewoPhR8YqvBH8c/vPTpgfYCdBvAcZYzRoXq5lvPxRmE7NKPYOQAgvybdC5aUVJwpwNy+kuEnOyBKjCmJvvjPVCY7/ev4gBOJJZmueNvFPFm6kiX3aj9zjUNg+dNYiU7YaxcgGb2+bOctr/XKetAf8=
Received: from SN6PR11MB3055.namprd11.prod.outlook.com (2603:10b6:805:dc::18)
 by SN6PR11MB2575.namprd11.prod.outlook.com (2603:10b6:805:57::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.25; Mon, 26 Apr
 2021 09:06:54 +0000
Received: from SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::15d2:c175:b922:8d8c]) by SN6PR11MB3055.namprd11.prod.outlook.com
 ([fe80::15d2:c175:b922:8d8c%3]) with mapi id 15.20.4065.027; Mon, 26 Apr 2021
 09:06:54 +0000
From:   "Alessandrelli, Daniele" <daniele.alessandrelli@intel.com>
To:     "mchehab+huawei@kernel.org" <mchehab+huawei@kernel.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "Krasteva, MartinaX" <martinax.krasteva@intel.com>,
        "linuxarm@huawei.com" <linuxarm@huawei.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Murphy, Paul J" <paul.j.murphy@intel.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "mauro.chehab@huawei.com" <mauro.chehab@huawei.com>,
        "Rosikopulos, GjorgjiX" <gjorgjix.rosikopulos@intel.com>
Subject: Re: [PATCH 36/78] media: i2c: imx334: use pm_runtime_resume_and_get()
Thread-Topic: [PATCH 36/78] media: i2c: imx334: use
 pm_runtime_resume_and_get()
Thread-Index: AQHXONV2H5cIXEMPWkiVg5zR4bikIarGhU2A
Date:   Mon, 26 Apr 2021 09:06:54 +0000
Message-ID: <027d86485fd1e65e2d3c8ef94b5fb5ba25536c91.camel@intel.com>
References: <cover.1619191723.git.mchehab+huawei@kernel.org>
         <07cca2da63bfe905e3c4dc9c51945ead79c63572.1619191723.git.mchehab+huawei@kernel.org>
In-Reply-To: <07cca2da63bfe905e3c4dc9c51945ead79c63572.1619191723.git.mchehab+huawei@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.36.5 (3.36.5-2.fc32) 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=intel.com;
x-originating-ip: [192.198.151.44]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6cd79ca4-5c88-44e8-1e4c-08d90892a316
x-ms-traffictypediagnostic: SN6PR11MB2575:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <SN6PR11MB25758B22BA6AB2F8B47E30A5F2429@SN6PR11MB2575.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RDBjBTj1/oy5/R361yAnnmZ354l45YhYRaAes8gF7PrE7tmixi3uL44YYIHRD+G/xHqqIkOPsQD4JGJUnDvJryiYEk+70lm9lzkKhv5QYbijhCIdtsdpfhWg78lXCnyVSQZrJaggOe9CzW3rivr+LpztVhl7ZqcvNLQreZp3dcMIWdOJBUH/TIFX+AyH9gCsou1YHhiuBkCuBntcJpcus5PENrzBfMYXSfMdtoVeuS1vBoVS5j5H6Rz+AD/K0gVJsDKY1686B+f5ac2U6heJcNAxkeobniUgaC7m1vsPNBZSUdKOjaVUL5ULu0BN1lmvc8PhYOw9MeXSDLzNVZ0AqAVHORBepy1UDGsyr9YOO7znG5RwlxJ6b7D6NKybIFUf5bPbbZuSWgVJrkd+1Ton2H77L1JKiwvHMe1CZ5fmE63HuA7L8fM8F1/F6GViEOzqcOWU4I6q9XMuJr7rXvhKOvNogFKb1iwOYpl2n4C2p0i9CPgiB9TiitXTWq3PFw+eCiVomazJ09DLLo0ZQKevtgNswpxBNJlEpkECyJjIllKLZmB3Dx0jX8W8iWoPrPmQjmseFVvMrMMp5mTbM74N6aMn1fxD8GXQV9TySD2F+bc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR11MB3055.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(376002)(346002)(366004)(396003)(136003)(39860400002)(83380400001)(186003)(36756003)(4326008)(2906002)(26005)(122000001)(66476007)(76116006)(2616005)(478600001)(64756008)(66946007)(6486002)(91956017)(66556008)(66446008)(38100700002)(86362001)(5660300002)(6512007)(8936002)(107886003)(8676002)(54906003)(71200400001)(6506007)(316002);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: =?utf-8?B?RWpWNGVRS29RMU1qMmVxRk84Q1NtTmoyOGJ5Sk1WRlJ4RllFNDUzekpwWlhK?=
 =?utf-8?B?QTJsNDREK3JxbGdycmdibFpvd29pbytLdS81d2hCYmtOb29mUnJEQTJOTmVa?=
 =?utf-8?B?NllOTExHeEJVY0k0YkpaeitQYWtFV0N0UTVaOHJaMzFpV01ZTUpydzJzYXFv?=
 =?utf-8?B?cmFqUHA4eFFjUDVSajczYkQvTHdCYzBGUE5Ya0VJR3d4bllNOWZlckIvVGda?=
 =?utf-8?B?ZEdsOUdyZ1YwSFV6am1XNHBRWGNiTC94RXpWcTJHWDFnRXZKMUxvV3hQKzha?=
 =?utf-8?B?OWVLN2JHZDdkclJzQU5qUGdYK0lyY3dxbGxkVFNYNm05Y04vTGxMWEErVmU3?=
 =?utf-8?B?TDlrQkdlSVFZZXFubHBqcjlOdWp2cmlKRDFVY0h4THFPNm5JL0ZrR0sxSDAr?=
 =?utf-8?B?S252aHY4b2cxdVY2Y3ZtMGVXVWRxelRsODhsdEU5SllmSDhuNUI5UVhXYi81?=
 =?utf-8?B?TlNNelNQQ0RRV2daelZ1Ym9NVVdoQjlpMlpDZjRab2k2QThJNnN6UXo2elM1?=
 =?utf-8?B?RU9BQmU2QlZ3TkRHZkhzZ1VlVk1WQUl4Mm9jbUoxTDRKaUx0R09kbmtObHYw?=
 =?utf-8?B?UzRZdDAvWVh6R3ZFYXdlT2JmZ3lXNCs3TVd6R1BIZ201YVNxZ1YwekxNT2JF?=
 =?utf-8?B?eHorOGk4RDdLZnBUTjJ5dzlGRkc5VTcvWUQycTE2TEN4UnZtUlN2QVZLb1VF?=
 =?utf-8?B?Qng3MzN1TUhnUXU3S0kzVzFsQzJuRTloanpFdEFpSEdCTGd3Z1FPN3FSNHJT?=
 =?utf-8?B?aWhldVVHZ3Vac1drMDJnUUZ1R21uUEJjeTlNclhNbWtXamZxUlMrcVJqUmhT?=
 =?utf-8?B?bHFzZ2dMbGlKRi96OVhReGxOY2NRQ2l1eWhLakJHVEZ5MTdaRE5za0hlbThZ?=
 =?utf-8?B?WDdwcEFSeW1hVGhBSTVGMFFycmhOWDJNNUY0WmpRTlEyYUxpOHJHU1A1SGln?=
 =?utf-8?B?SEp6cUFNWEsyQ3U0NkNJV3ZDUlBNaDJFYUFxZ3kxVTlkRHFsYVVIbjE0QlZK?=
 =?utf-8?B?dTE2eXFkTE8wUXNlcmpEMFg0c2NYd1JrNTJsQ29yRnQvTXMwMGV0ZUlFVjZt?=
 =?utf-8?B?YmM2ZUdKV0ppSzB2VS96K1MvekRyV2FnWER0eVlYcDViMHlWbTA1QUQzWFNV?=
 =?utf-8?B?NFVrTlNhNnBSRnNUWjUyQjk2UGpDOFhVMHFjUlNPajU0Lzdwc3lwWXV6M3ZO?=
 =?utf-8?B?Y0hGcVY0STZleWRQL2N1akk1Mm5pb2M0UGxkOU5pUkZBenRVK0ZId0Y0NzQy?=
 =?utf-8?B?Nk5IMmpOV3BxNEJKcG14all2Tlk1Tk44dk9QN2JPM012djBuOHBoblpKYytr?=
 =?utf-8?B?Ymo4QzY0aGFNbzRPWFhqb2tjeko0R0RSWGVaejRPVDFXRzdYMlBEWTYzWW9s?=
 =?utf-8?B?QnVjUkYwaW5hRDFRZnRRS2g0Rzl2RE5IaXMrUVE4cEpkVm9zclh5WkRVQVZK?=
 =?utf-8?B?bnJIUG1FQkZWZlB5T2UwYk1kdEdYb0g5cUxGZytVZWRkMnNldm1mYTRUREE0?=
 =?utf-8?B?MytwMkc5MEpad1pXV29jY3pSL1RlZSs5Nk9vem9GelVGZmlqcXFoSytqS3Zt?=
 =?utf-8?B?NDF4bnh1STNWcGpqblp6VDZvZFl3YktMV2I5MDFFVkpUNmx5eVNPWTFWTnhT?=
 =?utf-8?B?VjFkTjJtbnVRYlBtTXhUT2J2dndYRFpId084TVIwSUxQOFZOQnhxWlNBaWcv?=
 =?utf-8?B?aktwck92V3d0Y1Z2NklFRUIrWEhYRDB6VjByUkswV1JsOFFoR2ZPV2dwY0FR?=
 =?utf-8?B?T3ducVlPelJqQVlRWk9QNjlhWHgvR0hOaVhSTHVWNEN6NEM5ZGlzNFFxaVVx?=
 =?utf-8?B?QVdvZHp6QmhaaXM5dERJQT09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <02F9C1FD896A3E42B7C89EFD9347EA33@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR11MB3055.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cd79ca4-5c88-44e8-1e4c-08d90892a316
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Apr 2021 09:06:54.3169
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 0mENXTNM/6bVSj4KYi6JMF9hcrBmxHVeVe37oLct47CJhA6XWA+pylSL/rcjaaUhYFvtuVxeXOs/zFTKnCe3zQg5RZBvc44ymXAEZ86J6EE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR11MB2575
X-OriginatorOrg: intel.com
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTWF1cm8sDQoNClRoYW5rcyBmb3IgdGhlIHBhdGNoLg0KDQpPbiBTYXQsIDIwMjEtMDQtMjQg
YXQgMDg6NDQgKzAyMDAsIE1hdXJvIENhcnZhbGhvIENoZWhhYiB3cm90ZToNCj4gQ29tbWl0IGRk
ODA4OGQ1YTg5NiAoIlBNOiBydW50aW1lOiBBZGQgcG1fcnVudGltZV9yZXN1bWVfYW5kX2dldCB0
bw0KPiBkZWFsIHdpdGggdXNhZ2UgY291bnRlciIpDQo+IGFkZGVkIHBtX3J1bnRpbWVfcmVzdW1l
X2FuZF9nZXQoKSBpbiBvcmRlciB0byBhdXRvbWF0aWNhbGx5IGhhbmRsZQ0KPiBkZXYtPnBvd2Vy
LnVzYWdlX2NvdW50IGRlY3JlbWVudCBvbiBlcnJvcnMuDQo+IA0KPiBVc2UgdGhlIG5ldyBBUEks
IGluIG9yZGVyIHRvIGNsZWFudXAgdGhlIGVycm9yIGNoZWNrIGxvZ2ljLg0KPiANCj4gU2lnbmVk
LW9mZi1ieTogTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIDxtY2hlaGFiK2h1YXdlaUBrZXJuZWwub3Jn
Pg0KPiAtLS0NCj4gIGRyaXZlcnMvbWVkaWEvaTJjL2lteDMzNC5jIHwgNSArKystLQ0KPiAgMSBm
aWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYg
LS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL2lt
eDMzNC5jDQo+IGluZGV4IDA0N2FhNzY1OGQyMS4uYTVhMDNiYjRhNmFlIDEwMDY0NA0KPiAtLS0g
YS9kcml2ZXJzL21lZGlhL2kyYy9pbXgzMzQuYw0KPiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9p
bXgzMzQuYw0KPiBAQCAtNzE3LDkgKzcxNyw5IEBAIHN0YXRpYyBpbnQgaW14MzM0X3NldF9zdHJl
YW0oc3RydWN0IHY0bDJfc3ViZGV2DQo+ICpzZCwgaW50IGVuYWJsZSkNCj4gIAl9DQo+ICANCj4g
IAlpZiAoZW5hYmxlKSB7DQo+IC0JCXJldCA9IHBtX3J1bnRpbWVfZ2V0X3N5bmMoaW14MzM0LT5k
ZXYpOw0KPiArCQlyZXQgPSBwbV9ydW50aW1lX3Jlc3VtZV9hbmRfZ2V0KGlteDMzNC0+ZGV2KTsN
Cj4gIAkJaWYgKHJldCkNCj4gLQkJCWdvdG8gZXJyb3JfcG93ZXJfb2ZmOw0KPiArCQkJZ290byBl
cnJvcl91bmxvY2s7DQo+ICANCj4gIAkJcmV0ID0gaW14MzM0X3N0YXJ0X3N0cmVhbWluZyhpbXgz
MzQpOw0KPiAgCQlpZiAocmV0KQ0KPiBAQCAtNzM3LDYgKzczNyw3IEBAIHN0YXRpYyBpbnQgaW14
MzM0X3NldF9zdHJlYW0oc3RydWN0IHY0bDJfc3ViZGV2DQo+ICpzZCwgaW50IGVuYWJsZSkNCj4g
IA0KPiAgZXJyb3JfcG93ZXJfb2ZmOg0KPiAgCXBtX3J1bnRpbWVfcHV0KGlteDMzNC0+ZGV2KTsN
Cj4gK2Vycm9yX3VubG9jazoNCj4gIAltdXRleF91bmxvY2soJmlteDMzNC0+bXV0ZXgpOw0KPiAg
DQo+ICAJcmV0dXJuIHJldDsNCg0KTG9va3MgZ29vZCB0byBtZS4NCg0KUmV2aWV3ZWQtYnk6IERh
bmllbGUgQWxlc3NhbmRyZWxsaSA8ZGFuaWVsZS5hbGVzc2FuZHJlbGxpQGludGVsLmNvbT4NCg0K
