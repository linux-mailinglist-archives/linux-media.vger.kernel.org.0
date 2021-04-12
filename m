Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA42835C873
	for <lists+linux-media@lfdr.de>; Mon, 12 Apr 2021 16:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240857AbhDLOP7 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Apr 2021 10:15:59 -0400
Received: from esa.microchip.iphmx.com ([68.232.154.123]:34018 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237579AbhDLOP5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Apr 2021 10:15:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1618236939; x=1649772939;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=cPRLve9aWbZdPFFTG82n/Z7lzXlGzgvRiGve41AyUK8=;
  b=0R4gg17fHxQiyrtumWSeW9W5x+YUg5p2LyoNcdEw6E70fG/uyj+x8FvN
   pEGNPbwNrtelan3UOZ6lwuZixcdLHrBYEyLUCkwExIYaf11d4od5i1h/r
   ly1sTJiClO7y+6KUu1sfn/+XKlOaYJdUB4i/U5A3qFVfXOAKcDPrbEBmO
   3p+WabaHyqmKcTNcsSM7JvkevStHdLsH893wHkWB50QbtdvRNbdoNb3ux
   QN79vopFIbAYlmvXhzxiZm0V5IuHNMvjXlPVJ0rN/dUPhCTs/kx0tBFW1
   ylQBRor0SblUBNHs8YzfRDL+Ha5lcvrN5+dptmO0YNrfOsOHQsOaRZDo2
   Q==;
IronPort-SDR: EmscTxeWEgF9Psqd9y/4S7xe9g07adTlN7R0ZeOI3SwgTXesslPlgTRMCr7zyXLvrnWijQQz6q
 L5cotQHKsmK4vlBurEmI6yScgpiuKJFCNaMviDevZlcY4tOsERe4B6FelaYnEhD7grqr4AnYGM
 UQXMW3AFHd1vrbNG5EOKxMHzVGZGnC+zW/aRKmyimsgFNVkcaFgOWNgan9FeQlZQoNHN9ZAnbO
 MWwWwlwWojE5TgA2UHCdxa+I1P95LFbCtsXuzY3vzkvHce6E+dZuAN42GmB7iyqtlk/E4v6WA/
 KzA=
X-IronPort-AV: E=Sophos;i="5.82,216,1613458800"; 
   d="scan'208";a="50820198"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 12 Apr 2021 07:15:38 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 12 Apr 2021 07:15:38 -0700
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Mon, 12 Apr 2021 07:15:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsJZmxqTaxomamfi+1L9Lj3PP1jT/5QmD1JoRmFwOSGl6CKN/mJtXVQfKibUKUx+xM5OeIkQ/HpvMeWf7eSOk9Ei0xiYBUbAPzzKV1awE7yCBRtgzkxSrFXt1dqH63QgrsLGq9Ub9oXOC9NCFD2xgxQo/HiRpBkVdhTyUZqHMjEpXj/bkKY9s8IxfINiJkr+tWuvTVzxapprUYGBFaiygOP4tHbWmb274mla/rrhgFKp8gNu9V1jib5MKtjzpm6A7aVlGN6l5K5z8hZkKr9HbzNDVzFlLqHeBBOmekA9kajhZZPKh7n0z8AB7Rb376hh4exkOtmJlf7s7Wy43ACcRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPRLve9aWbZdPFFTG82n/Z7lzXlGzgvRiGve41AyUK8=;
 b=B+5s7SEoVg3+wvVcOVj5mZEj6WZ/Nu5YzdxmUdrf6kCl0Bk81rhzIl+O0Y8YSOWUXFBvEGLVH2IFfyndj36s/OpX1FisnKgTlfJIQ2vcbAKC2aKR/p3LL5r5mF+JyTWMOt1Gvxr9Ef6le3k+upGf8efP2Zd8IOvV4DirAVbmP5pmsw+vIsMqOV5Y2u5EgRaZ15BjYy6JEKOmNsrTu4nKTEBWHC+Iz9TYgzOKWD+gQlEe7zsrry+bow7P/9rT7LTkgY5cmNcGTH6hxyV4cK8mFIk4DtGpOAmNoXNVIkBrOZ7GJZ+Fo5WRO2Y4rco+3m3ytp6kSKtZ/WLk6zmv6E4qjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cPRLve9aWbZdPFFTG82n/Z7lzXlGzgvRiGve41AyUK8=;
 b=XiUUnQw5GzWcxGyvKPViYbPIj5jOfcOQI0afC7Re3GGggBRSDgtUStYc2eaC6JOvSuDs4jqrtC85uee5x1SHDeirs18ah2oMy/xqbG8vDGk4mBV9vhdG6grPpf196+tvfDuCauUMWoYL+CuEbHkWIm8n0J36jO9ay3x3Dy/jMqs=
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com (2603:10b6:a03:2dd::20)
 by BYAPR11MB3719.namprd11.prod.outlook.com (2603:10b6:a03:fa::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.26; Mon, 12 Apr
 2021 14:15:33 +0000
Received: from SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::743e:9115:21df:d5a]) by SJ0PR11MB4896.namprd11.prod.outlook.com
 ([fe80::743e:9115:21df:d5a%5]) with mapi id 15.20.4020.022; Mon, 12 Apr 2021
 14:15:33 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <jacopo@jmondi.org>
CC:     <devicetree@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 30/30] media: atmel: atmel-isc: add microchip-xisc
 driver
Thread-Topic: [PATCH v2 30/30] media: atmel: atmel-isc: add microchip-xisc
 driver
Thread-Index: AQHXKjTQZot1sFqtDEqlsngPs3uv4aqw3NIAgAAR+oCAAAlhgA==
Date:   Mon, 12 Apr 2021 14:15:32 +0000
Message-ID: <52f03c2b-01bd-0de3-83c5-204e6b577b9d@microchip.com>
References: <20210405155105.162529-1-eugen.hristev@microchip.com>
 <20210405155105.162529-31-eugen.hristev@microchip.com>
 <a22c2065-1a79-8a96-2b54-a2e28fa08b8a@microchip.com>
 <20210412134157.4cqva5thylmiqds7@uno.localdomain>
In-Reply-To: <20210412134157.4cqva5thylmiqds7@uno.localdomain>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: jmondi.org; dkim=none (message not signed)
 header.d=none;jmondi.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [86.121.125.229]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 356f4cdf-3de7-4637-0de2-08d8fdbd6f47
x-ms-traffictypediagnostic: BYAPR11MB3719:
x-microsoft-antispam-prvs: <BYAPR11MB371916B47F4F36B788794E69E8709@BYAPR11MB3719.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xZVWn2XxqL1bvV2oxsQrz7Ks76+bYvNaejIfk9ifDWCrrj2MUS3zjmfxcyc8nzmM7n/sNsEKZveiO6wjbCMKLvhrwFEfTkVxFJDa/TtgHvv+wTDwZ57CQGs4H4HThKxerfMb929bCa+xeuN5FoHRecIt044L9kAocfoVewj2iw/XSCiVNHXqA4LGXpm/CFxMnhDZyC6us8H/+91aePkOWTrD2liM8fftbS607BnlQX6ES9J8PpJ/+zEfnMIVWSjVlfdLsq3lndQp60AttObalzX39SIloaxNP6uvn8gW2kI+Ge6ynu9IgLDQVw2NJnM6G4f+K9zhOmLPUfM+qUI6RX4DK8C59ZGBuTuDcHIaB5k3iNH+ZMPwYotZbYkrsIu+y7hbRjFq7pPvk5kzFLnCbAD7Q7CjFV13xIkZIc8ggn1KLSG9KjuA9wsH61g2vsm2+1kF/os5nluX5/gGw0k/4NUpAgtAuenqV/xjUeOh0xYvpPML8eVTDzJ1nMkhX0lKau0/4J7UHdT/N9jwGqwWfHorKeCm1O0aaibkwVE0a2LTbyRVqwHn7lQJMYmAeIwJ1kwrRB9tQqCw7w4dN2WDKOAHMk0YtQk7Pm/aytShtY54gVqP6ZNuOin9JP/CBGWic6SfmnZ4CCZSJ5a8nchZdjginAzGg3yueBAElAIqGjGc0E9fS4dZTzaZ0WTdx/Ba
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB4896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(366004)(376002)(136003)(346002)(396003)(8936002)(66556008)(186003)(4326008)(31696002)(86362001)(478600001)(6512007)(316002)(54906003)(83380400001)(26005)(91956017)(8676002)(71200400001)(36756003)(53546011)(66946007)(64756008)(76116006)(6506007)(6916009)(2616005)(66476007)(5660300002)(6486002)(2906002)(31686004)(30864003)(38100700002)(66446008)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?utf-8?B?dWhvV2NLcXNGNVlkRGF3ZDJtOUlENS8vem9JMlNmYk5YcmI4UE9HSlBUbGg0?=
 =?utf-8?B?RmtDRE53NlZMRjNvTDNoZy9nY0pZeloybXBIZEI4QndNWklCTzUvVVhpY01J?=
 =?utf-8?B?OHMyZnVuK3QrclIxKzNqNHFjNGdpcjJoellRSjdtMU9NK0lUby9HUnJCTWE2?=
 =?utf-8?B?OGxraFMvVVlDUlNYOXBBcnQycjBQWlRwbkx5ejVnTUR5TFVFcUZIOXVqSG9x?=
 =?utf-8?B?VDFFa3RST25UYTVIZ2szd3kyZGtpSmJtVldZdFBMQ0FjOExzUkloeU5pKzlL?=
 =?utf-8?B?M3VnTUQ4VGluY05LV05NUUtXYlRLeVJ1NDEyU3VlZmV5SWpZd3dJMGJDeEx5?=
 =?utf-8?B?RTBoOUYyd3JjdnMxZHpkNnNoUG9aWUxrTW9YeWJiYmJ5bGJOWjQzRlVMMWsr?=
 =?utf-8?B?bWI4QXVGMnFKbGVRbkErc0pTcnhzczVqMVlsajMrdzFCYmZlM2JOMTVBQzdQ?=
 =?utf-8?B?U3orVTFKSUN0NGVTcXlLSXdYaWUvdTNKcHRuRXdPYWdzajJFa3c2am1DSS9h?=
 =?utf-8?B?cUdaeThLYUlQajJ1UG9kV1pqYlFUaFFuZUVsbmhxK0gwYU8yTjN6UlRTVHR2?=
 =?utf-8?B?aS9RRXFncXJsd2hPcVJrRERLcTNHY05mZWpqaDk3OUxrdG5vcXRPMk9qdmNE?=
 =?utf-8?B?SDBndExSSUJtaTVBZmFXUXlkVDFyY2tPS0ViMmdtYVBJa1FVeTNjMFpRSzFM?=
 =?utf-8?B?d2o5MzBCOHlHK3NrOFRiRDllYXZialI4L1JXd0hlckVpb2R6V2VycGdtTnVT?=
 =?utf-8?B?LzlzQkZJMUlPSkZpUWlsZGhaTnlTVXE2dC9OWEI5eUlLLzBETzdrVHBmWUhv?=
 =?utf-8?B?VENlQlJPNFl4WndNVEdjOTNZS0p2TTlLZkl3ck1qVjJOSXlLdzhzQWpXSVBx?=
 =?utf-8?B?UFV3Y08rckJDaHJEWjJFWjlHYnYzVUJOelBjSzM5OHhKUlh0b3FHMlVSTEJD?=
 =?utf-8?B?a3ovZDI0d0k5ajdpSGpIR2pmdFovVXVrTWJHQzFiTHlVblRxWHMzL1crVk83?=
 =?utf-8?B?Um5IbTJpRFNkdU5QVVJ5Z0NkaUI2cmw1T2syT2xMZFNIVXJZV2s2cEJZZXpV?=
 =?utf-8?B?cTNIQ1Y0YVBWMTBRenF0Tnh0b0hXaEhIUVcvWVl0ZTc4dndRQ2pjeWhOb29t?=
 =?utf-8?B?ZHRGWDlkTlFWK21mMVQ0VTRSdW45MmYyL2RQUUlrVDNtR0NSb1FZUGlnZFpk?=
 =?utf-8?B?bmcwUmFhazllT1crSlh6SzlBOC85SE1TbkxIVnVMWGZPZ0duVmRlZmhFQUtM?=
 =?utf-8?B?Yk5wNFV5VjNNRFRpeXNrL2FwY0tGQTlaUHBsU2J0emY5d2d2Z3JRaDZsM012?=
 =?utf-8?B?Z2xkZ1Y5QmhQcHpGSmVhN0pVcnVaOWY5aTlYSjl4RkczYWN0L2dUd2JEQ1Z6?=
 =?utf-8?B?OHhBMlJ4ak1wNmVHcStHNUdsV1NoSW1TZnowbzBPN0pURDRvazhpc3JrZEcy?=
 =?utf-8?B?VENLbnlYVVRSbC91Nk1Yd0pFWUxIeE15V1laVFYyVEVlVDhkR1FISEhla01l?=
 =?utf-8?B?V1JpSEtMVUk3TTVNTWVudk91NGx5WitkdGUvcE5ycWNxaWk0QVJhM2RwTFho?=
 =?utf-8?B?UExmM2FPZEpNdXZZc1R2R2FaejdCV1JsaDIwN29JMXN1UFJUMjlJeHl4d3Vq?=
 =?utf-8?B?ZEtJeUFPMnpXVGxDWWhob3lleWVZZDA1Zlo5MjBhSmNaNEpHL3F3am9QdW9O?=
 =?utf-8?B?bG8zL3VONjVEOEJBeWlTVE1XclFFSzl1N2hhVGNIaDhpaUlRdm9Jb2ZlSWRO?=
 =?utf-8?Q?/WYVAjZC+itHDLTq7GfcDKSeEwZXc1v5XIDrcO5?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <A8822A07E61B4A47BCF8386DF94F39D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB4896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 356f4cdf-3de7-4637-0de2-08d8fdbd6f47
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Apr 2021 14:15:32.9871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: hH8V/ZTL32z6876JomOhLh97qegwdWMCvnpuocDNRGq7AWLxlP4Xj1RBfuJkWlEyDfs1+N1WZ9ABW+mIWyw0H26FLohGa4a91tCtS8DXoFg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3719
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNC8xMi8yMSA0OjQxIFBNLCBKYWNvcG8gTW9uZGkgd3JvdGU6DQo+IEhpIEV1Z2VuZSwNCj4g
DQo+IE9uIE1vbiwgQXByIDEyLCAyMDIxIGF0IDEyOjM3OjQxUE0gKzAwMDAsIEV1Z2VuLkhyaXN0
ZXZAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+PiArc3RhdGljIGludCB4aXNjX3BhcnNlX2R0KHN0
cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGlzY19kZXZpY2UgKmlzYykNCj4+PiArew0KPj4+ICsg
ICBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gZGV2LT5vZl9ub2RlOw0KPj4+ICsgICBzdHJ1Y3Qg
ZGV2aWNlX25vZGUgKmVwbiA9IE5VTEw7DQo+Pj4gKyAgIHN0cnVjdCBpc2Nfc3ViZGV2X2VudGl0
eSAqc3ViZGV2X2VudGl0eTsNCj4+PiArICAgdW5zaWduZWQgaW50IGZsYWdzOw0KPj4+ICsgICBp
bnQgcmV0Ow0KPj4+ICsgICBib29sIG1pcGlfbW9kZTsNCj4+PiArDQo+Pj4gKyAgIElOSVRfTElT
VF9IRUFEKCZpc2MtPnN1YmRldl9lbnRpdGllcyk7DQo+Pj4gKw0KPj4+ICsgICBtaXBpX21vZGUg
PSBvZl9wcm9wZXJ0eV9yZWFkX2Jvb2wobnAsICJtaWNyb2NoaXAsbWlwaS1tb2RlIik7DQo+Pj4g
Kw0KPj4+ICsgICB3aGlsZSAoMSkgew0KPj4+ICsgICAgICAgICAgIHN0cnVjdCB2NGwyX2Z3bm9k
ZV9lbmRwb2ludCB2NGwyX2VwbiA9IHsgLmJ1c190eXBlID0gMCB9Ow0KPj4+ICsNCj4+PiArICAg
ICAgICAgICBlcG4gPSBvZl9ncmFwaF9nZXRfbmV4dF9lbmRwb2ludChucCwgZXBuKTsNCj4+PiAr
ICAgICAgICAgICBpZiAoIWVwbikNCj4+PiArICAgICAgICAgICAgICAgICAgIHJldHVybiAwOw0K
Pj4+ICsNCj4+PiArICAgICAgICAgICByZXQgPSB2NGwyX2Z3bm9kZV9lbmRwb2ludF9wYXJzZShv
Zl9md25vZGVfaGFuZGxlKGVwbiksDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgJnY0bDJfZXBuKTsNCj4+PiArICAgICAgICAgICBpZiAocmV0KSB7DQo+
Pj4gKyAgICAgICAgICAgICAgICAgICByZXQgPSAtRUlOVkFMOw0KPj4+ICsgICAgICAgICAgICAg
ICAgICAgZGV2X2VycihkZXYsICJDb3VsZCBub3QgcGFyc2UgdGhlIGVuZHBvaW50XG4iKTsNCj4+
PiArICAgICAgICAgICAgICAgICAgIGJyZWFrOw0KPj4+ICsgICAgICAgICAgIH0NCj4+PiArDQo+
Pj4gKyAgICAgICAgICAgc3ViZGV2X2VudGl0eSA9IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigq
c3ViZGV2X2VudGl0eSksDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBHRlBfS0VSTkVMKTsNCj4+PiArICAgICAgICAgICBpZiAoIXN1YmRldl9lbnRpdHkpIHsN
Cj4+PiArICAgICAgICAgICAgICAgICAgIHJldCA9IC1FTk9NRU07DQo+Pj4gKyAgICAgICAgICAg
ICAgICAgICBicmVhazsNCj4+PiArICAgICAgICAgICB9DQo+Pj4gKyAgICAgICAgICAgc3ViZGV2
X2VudGl0eS0+ZXBuID0gZXBuOw0KPj4+ICsNCj4+PiArICAgICAgICAgICBmbGFncyA9IHY0bDJf
ZXBuLmJ1cy5wYXJhbGxlbC5mbGFnczsNCj4+PiArDQo+Pj4gKyAgICAgICAgICAgaWYgKGZsYWdz
ICYgVjRMMl9NQlVTX0hTWU5DX0FDVElWRV9MT1cpDQo+Pj4gKyAgICAgICAgICAgICAgICAgICBz
dWJkZXZfZW50aXR5LT5wZmVfY2ZnMCA9IElTQ19QRkVfQ0ZHMF9IUE9MX0xPVzsNCj4+PiArDQo+
Pj4gKyAgICAgICAgICAgaWYgKGZsYWdzICYgVjRMMl9NQlVTX1ZTWU5DX0FDVElWRV9MT1cpDQo+
Pj4gKyAgICAgICAgICAgICAgICAgICBzdWJkZXZfZW50aXR5LT5wZmVfY2ZnMCB8PSBJU0NfUEZF
X0NGRzBfVlBPTF9MT1c7DQo+Pj4gKw0KPj4+ICsgICAgICAgICAgIGlmIChmbGFncyAmIFY0TDJf
TUJVU19QQ0xLX1NBTVBMRV9GQUxMSU5HKQ0KPj4+ICsgICAgICAgICAgICAgICAgICAgc3ViZGV2
X2VudGl0eS0+cGZlX2NmZzAgfD0gSVNDX1BGRV9DRkcwX1BQT0xfTE9XOw0KPj4+ICsNCj4+PiAr
ICAgICAgICAgICBpZiAodjRsMl9lcG4uYnVzX3R5cGUgPT0gVjRMMl9NQlVTX0JUNjU2KQ0KPj4+
ICsgICAgICAgICAgICAgICAgICAgc3ViZGV2X2VudGl0eS0+cGZlX2NmZzAgfD0gSVNDX1BGRV9D
RkcwX0NDSVJfQ1JDIHwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBJ
U0NfUEZFX0NGRzBfQ0NJUjY1NjsNCj4+DQo+PiBIaSBKYWNvcG8sDQo+Pg0KPj4gSWYgSSB1c2Ug
dGhlIGJ1cy10eXBlIHByb3BlcnR5IGZvciB0aGUgJ3BvcnQnICwgZG8gSSBhY3R1YWxseSBoYXZl
IHRvDQo+PiBjaGFuZ2Ugc29tZXRoaW5nIGhlcmUgPw0KPiANCj4gWW91IGNhbiBzZXQgYnVzX3R5
cGUgdG8gdGhlIGRlc2lyZWQgdHlwZSwgaWYgaXQgZG9lc24ndCBtYXRjaCB0aGUNCj4gJ2J1cy10
eXBlJyBwcm9wZXJ0eSB5b3Ugd2lsbCBoYXZlIGFuIGltbWVkaWF0ZSBlcnJvciBhbmQgYSBtb3Jl
IHN0cmljdA0KPiBjaGVjayBvbiB0aGUgcHJvcGVydGllcy4NCj4gDQo+IFlvdSB3b3VsZCBsaWtl
bHk6DQo+IA0KPiAgICAgICAgICB2NGwyX2Vwbi5idXNfdHlwZSA9IFY0TDJfTUJVU19QQVJBTExF
TDsNCj4gICAgICAgICAgcmV0ID0gdjRsMl9md25vZGVfZW5kcG9pbnRfcGFyc2UoKQ0KPiAgICAg
ICAgICBpZiAoIXJldCkgew0KPiAgICAgICAgICAgICAgICAgIC8qIEl0J3MgcGFyYWxsZWwgKi8N
Cj4gICAgICAgICAgfSBlbHNlIHsNCj4gICAgICAgICAgICAgICAgICB2NGwyX2Vwbi5idXNfdHlw
ZSA9IFY0TDJfTUJVU19CVDY1NjsNCj4gICAgICAgICAgICAgICAgICByZXQgPSB2NGwyX2Z3bm9k
ZV9lbmRwb2ludF9wYXJzZSgpDQo+ICAgICAgICAgICAgICAgICAgaWYgKHJldCkgew0KPiAgICAg
ICAgICAgICAgICAgICAgICAgICAgLyogVW5zdXBwb3J0ZWQgYnVzIHR5cGU6IGVycm9yIG91dC4g
Ki8NCj4gICAgICAgICAgICAgICAgICB9DQo+IA0KPiAgICAgICAgICAgICAgICAgIC8qIEl0J3Mg
QlQ2NTYgKi8NCj4gICAgICAgICAgfQ0KDQppZiB0aGUgdjRsMl9md25vZGVfZW5kcG9pbnRfcGFy
c2Ugd2lsbCBhbHJlYWR5IGZpbGwgaW4gdGhlIA0KdjRsMl9lcG4uYnVzX3R5cGUgYmFzZWQgb24g
d2hhdCBpcyBmb3VuZCBpbiB0aGUgJ2J1cy10eXBlJyAsIHdoeSBkbyBJIA0KbmVlZCB0byBkbyB0
aGlzIGFzc3VtcHRpb24tZmFpbC1hc3N1bXB0aW9uLWZhaWwgc2NlbmFyaW8gPw0KQ2FuJ3QgSSBz
aW1wbHkgY2hlY2sgdGhlIHZhbHVlIG9mIHY0bDJfZXBuLmJ1c190eXBlICwgYXMgSSBhbSBkb2lu
ZyBpdCANCmFscmVhZHkgPw0KDQo+IA0KPiBOb3QgdGhlIGdyZWF0ZXN0IEFQSSwgYnV0IGl0J3Mg
bW9yZSByb2J1c3QuDQo+IA0KPj4gdGhlIHY0bDJfZXBuLmJ1c190eXBlIHdvbid0IGJlIHNldCBh
dXRvbWF0aWNhbGx5ID8gYnkgdGhlIGVuZHBvaW50DQo+PiBwYXJzZXIgSSBtZWFuLg0KPiANCj4g
WWVzLCB0aGF0J3Mgd2hhdCBhdXRvLWRpc2NvdmVyeSBpcywgdGhlIGVuZHBvaW50IHBhcnNlciB0
cmllcyB0bw0KPiBkZWR1Y2UgdGhlIGJ1cyB0eXBlIGZyb20gdGhlIHByb3BlcnRpZXMgdGhhdCBh
cmUgdGhlcmUgc3BlY2lmaWVkLiBJdA0KPiB3b3JrcywgYnV0IGxlYXZlcyBxdWl0ZSBzb21lIGFt
YmlndWl0eSBiZXR3ZWVuIGllIFBBUkFMTEVMIGFuZCBCVDY1Ng0KPiBhcyBzb21lIHBvbGFyaXRp
ZXMgbWlnaHQgbm90IGJlIG5lY2Vzc2FyaWx5IHNwZWNpZmllZCBldmVuIGZvcg0KPiBQQVJBTExF
TCBidXMgdHlwZXMuDQo+IA0KPiBBcyBJJ3ZlIHNhaWQsIHRoZXJlJ3Mgc3RpbGwgcGxlbnR5IG9m
IGNvZGUgdGhhdCByZWxpZXMgb24NCj4gYXV0by1kaXNjb3Zlcnkgc28gSSBkb24ndCB0aGluayB0
aGlzIGlzIGJsb2NraW5nLCBhbHNvIGJlY2F1c2UgbWFraW5nDQo+IGJ1cy10eXBlIG1hbmRhdG9y
eSBvbiBleGlzdGluZyBEVFMgaXMgcXVpdGUgcGFpbmZ1bC4gU2luY2UgdGhpcyBpcyBhDQo+IG5l
dyBEVFMgeW91IGNhbiBjb25zaWRlciB0aGlzIHNvbHV0aW9uIGlmIHlvdSB3YW50IHRvLg0KPiAN
Cj4gVGhhbmtzDQo+ICAgICBqDQo+IA0KPj4NCj4+IFRoYW5rcywNCj4+IEV1Z2VuDQo+Pg0KPj4+
ICsNCj4+PiArICAgICAgICAgICBpZiAobWlwaV9tb2RlKQ0KPj4+ICsgICAgICAgICAgICAgICAg
ICAgc3ViZGV2X2VudGl0eS0+cGZlX2NmZzAgfD0gSVNDX1BGRV9DRkcwX01JUEk7DQo+Pj4gKw0K
Pj4+ICsgICAgICAgICAgIGxpc3RfYWRkX3RhaWwoJnN1YmRldl9lbnRpdHktPmxpc3QsICZpc2Mt
PnN1YmRldl9lbnRpdGllcyk7DQo+Pj4gKyAgIH0NCj4+PiArICAgb2Zfbm9kZV9wdXQoZXBuKTsN
Cj4+PiArDQo+Pj4gKyAgIHJldHVybiByZXQ7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0YXRpYyBp
bnQgbWljcm9jaGlwX3hpc2NfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikNCj4+
PiArew0KPj4+ICsgICBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmcGRldi0+ZGV2Ow0KPj4+ICsgICBz
dHJ1Y3QgaXNjX2RldmljZSAqaXNjOw0KPj4+ICsgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlczsNCj4+
PiArICAgdm9pZCBfX2lvbWVtICppb19iYXNlOw0KPj4+ICsgICBzdHJ1Y3QgaXNjX3N1YmRldl9l
bnRpdHkgKnN1YmRldl9lbnRpdHk7DQo+Pj4gKyAgIGludCBpcnE7DQo+Pj4gKyAgIGludCByZXQ7
DQo+Pj4gKyAgIHUzMiB2ZXI7DQo+Pj4gKw0KPj4+ICsgICBpc2MgPSBkZXZtX2t6YWxsb2MoZGV2
LCBzaXplb2YoKmlzYyksIEdGUF9LRVJORUwpOw0KPj4+ICsgICBpZiAoIWlzYykNCj4+PiArICAg
ICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+PiArDQo+Pj4gKyAgIHBsYXRmb3JtX3NldF9kcnZk
YXRhKHBkZXYsIGlzYyk7DQo+Pj4gKyAgIGlzYy0+ZGV2ID0gZGV2Ow0KPj4+ICsNCj4+PiArICAg
cmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlKHBkZXYsIElPUkVTT1VSQ0VfTUVNLCAwKTsNCj4+
PiArICAgaW9fYmFzZSA9IGRldm1faW9yZW1hcF9yZXNvdXJjZShkZXYsIHJlcyk7DQo+Pj4gKyAg
IGlmIChJU19FUlIoaW9fYmFzZSkpDQo+Pj4gKyAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIoaW9f
YmFzZSk7DQo+Pj4gKw0KPj4+ICsgICBpc2MtPnJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfbW1p
byhkZXYsIGlvX2Jhc2UsICZpc2NfcmVnbWFwX2NvbmZpZyk7DQo+Pj4gKyAgIGlmIChJU19FUlIo
aXNjLT5yZWdtYXApKSB7DQo+Pj4gKyAgICAgICAgICAgcmV0ID0gUFRSX0VSUihpc2MtPnJlZ21h
cCk7DQo+Pj4gKyAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gaW5pdCByZWdpc3Rl
ciBtYXA6ICVkXG4iLCByZXQpOw0KPj4+ICsgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4gKyAg
IH0NCj4+PiArDQo+Pj4gKyAgIGlycSA9IHBsYXRmb3JtX2dldF9pcnEocGRldiwgMCk7DQo+Pj4g
KyAgIGlmIChpcnEgPCAwKQ0KPj4+ICsgICAgICAgICAgIHJldHVybiBpcnE7DQo+Pj4gKw0KPj4+
ICsgICByZXQgPSBkZXZtX3JlcXVlc3RfaXJxKGRldiwgaXJxLCBpc2NfaW50ZXJydXB0LCAwLA0K
Pj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICJtaWNyb2NoaXAtc2FtYTdnNS14aXNjIiwg
aXNjKTsNCj4+PiArICAgaWYgKHJldCA8IDApIHsNCj4+PiArICAgICAgICAgICBkZXZfZXJyKGRl
diwgImNhbid0IHJlZ2lzdGVyIElTUiBmb3IgSVJRICV1IChyZXQ9JWkpXG4iLA0KPj4+ICsgICAg
ICAgICAgICAgICAgICAgaXJxLCByZXQpOw0KPj4+ICsgICAgICAgICAgIHJldHVybiByZXQ7DQo+
Pj4gKyAgIH0NCj4+PiArDQo+Pj4gKyAgIGlzYy0+Z2FtbWFfdGFibGUgPSBpc2Nfc2FtYTdnNV9n
YW1tYV90YWJsZTsNCj4+PiArICAgaXNjLT5nYW1tYV9tYXggPSAwOw0KPj4+ICsNCj4+PiArICAg
aXNjLT5tYXhfd2lkdGggPSBJU0NfU0FNQTdHNV9NQVhfU1VQUE9SVF9XSURUSDsNCj4+PiArICAg
aXNjLT5tYXhfaGVpZ2h0ID0gSVNDX1NBTUE3RzVfTUFYX1NVUFBPUlRfSEVJR0hUOw0KPj4+ICsN
Cj4+PiArICAgaXNjLT5jb25maWdfZHBjID0gaXNjX3NhbWE3ZzVfY29uZmlnX2RwYzsNCj4+PiAr
ICAgaXNjLT5jb25maWdfY3NjID0gaXNjX3NhbWE3ZzVfY29uZmlnX2NzYzsNCj4+PiArICAgaXNj
LT5jb25maWdfY2JjID0gaXNjX3NhbWE3ZzVfY29uZmlnX2NiYzsNCj4+PiArICAgaXNjLT5jb25m
aWdfY2MgPSBpc2Nfc2FtYTdnNV9jb25maWdfY2M7DQo+Pj4gKyAgIGlzYy0+Y29uZmlnX2dhbSA9
IGlzY19zYW1hN2c1X2NvbmZpZ19nYW07DQo+Pj4gKyAgIGlzYy0+Y29uZmlnX3JscCA9IGlzY19z
YW1hN2c1X2NvbmZpZ19ybHA7DQo+Pj4gKyAgIGlzYy0+Y29uZmlnX2N0cmxzID0gaXNjX3NhbWE3
ZzVfY29uZmlnX2N0cmxzOw0KPj4+ICsNCj4+PiArICAgaXNjLT5hZGFwdF9waXBlbGluZSA9IGlz
Y19zYW1hN2c1X2FkYXB0X3BpcGVsaW5lOw0KPj4+ICsNCj4+PiArICAgaXNjLT5vZmZzZXRzLmNz
YyA9IElTQ19TQU1BN0c1X0NTQ19PRkZTRVQ7DQo+Pj4gKyAgIGlzYy0+b2Zmc2V0cy5jYmMgPSBJ
U0NfU0FNQTdHNV9DQkNfT0ZGU0VUOw0KPj4+ICsgICBpc2MtPm9mZnNldHMuc3ViNDIyID0gSVND
X1NBTUE3RzVfU1VCNDIyX09GRlNFVDsNCj4+PiArICAgaXNjLT5vZmZzZXRzLnN1YjQyMCA9IElT
Q19TQU1BN0c1X1NVQjQyMF9PRkZTRVQ7DQo+Pj4gKyAgIGlzYy0+b2Zmc2V0cy5ybHAgPSBJU0Nf
U0FNQTdHNV9STFBfT0ZGU0VUOw0KPj4+ICsgICBpc2MtPm9mZnNldHMuaGlzID0gSVNDX1NBTUE3
RzVfSElTX09GRlNFVDsNCj4+PiArICAgaXNjLT5vZmZzZXRzLmRtYSA9IElTQ19TQU1BN0c1X0RN
QV9PRkZTRVQ7DQo+Pj4gKyAgIGlzYy0+b2Zmc2V0cy52ZXJzaW9uID0gSVNDX1NBTUE3RzVfVkVS
U0lPTl9PRkZTRVQ7DQo+Pj4gKyAgIGlzYy0+b2Zmc2V0cy5oaXNfZW50cnkgPSBJU0NfU0FNQTdH
NV9ISVNfRU5UUllfT0ZGU0VUOw0KPj4+ICsNCj4+PiArICAgaXNjLT5jb250cm9sbGVyX2Zvcm1h
dHMgPSBzYW1hN2c1X2NvbnRyb2xsZXJfZm9ybWF0czsNCj4+PiArICAgaXNjLT5jb250cm9sbGVy
X2Zvcm1hdHNfc2l6ZSA9IEFSUkFZX1NJWkUoc2FtYTdnNV9jb250cm9sbGVyX2Zvcm1hdHMpOw0K
Pj4+ICsgICBpc2MtPmZvcm1hdHNfbGlzdCA9IHNhbWE3ZzVfZm9ybWF0c19saXN0Ow0KPj4+ICsg
ICBpc2MtPmZvcm1hdHNfbGlzdF9zaXplID0gQVJSQVlfU0laRShzYW1hN2c1X2Zvcm1hdHNfbGlz
dCk7DQo+Pj4gKw0KPj4+ICsgICAvKiBzYW1hN2c1LWlzYyBSQU0gYWNjZXNzIHBvcnQgaXMgZnVs
bCBBWEk0IC0gMzIgYml0cyBwZXIgYmVhdCAqLw0KPj4+ICsgICBpc2MtPmRjZmcgPSBJU0NfRENG
R19ZTUJTSVpFX0JFQVRTMzIgfCBJU0NfRENGR19DTUJTSVpFX0JFQVRTMzI7DQo+Pj4gKw0KPj4+
ICsgICByZXQgPSBpc2NfcGlwZWxpbmVfaW5pdChpc2MpOw0KPj4+ICsgICBpZiAocmV0KQ0KPj4+
ICsgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4gKw0KPj4+ICsgICBpc2MtPmhjbG9jayA9IGRl
dm1fY2xrX2dldChkZXYsICJoY2xvY2siKTsNCj4+PiArICAgaWYgKElTX0VSUihpc2MtPmhjbG9j
aykpIHsNCj4+PiArICAgICAgICAgICByZXQgPSBQVFJfRVJSKGlzYy0+aGNsb2NrKTsNCj4+PiAr
ICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBnZXQgaGNsb2NrOiAlZFxuIiwgcmV0
KTsNCj4+PiArICAgICAgICAgICByZXR1cm4gcmV0Ow0KPj4+ICsgICB9DQo+Pj4gKw0KPj4+ICsg
ICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaXNjLT5oY2xvY2spOw0KPj4+ICsgICBpZiAocmV0
KSB7DQo+Pj4gKyAgICAgICAgICAgZGV2X2VycihkZXYsICJmYWlsZWQgdG8gZW5hYmxlIGhjbG9j
azogJWRcbiIsIHJldCk7DQo+Pj4gKyAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+PiArICAgfQ0K
Pj4+ICsNCj4+PiArICAgcmV0ID0gaXNjX2Nsa19pbml0KGlzYyk7DQo+Pj4gKyAgIGlmIChyZXQp
IHsNCj4+PiArICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBpbml0IGlzYyBjbG9j
azogJWRcbiIsIHJldCk7DQo+Pj4gKyAgICAgICAgICAgZ290byB1bnByZXBhcmVfaGNsazsNCj4+
PiArICAgfQ0KPj4+ICsNCj4+PiArICAgaXNjLT5pc3BjayA9IGlzYy0+aXNjX2Nsa3NbSVNDX0lT
UENLXS5jbGs7DQo+Pj4gKw0KPj4+ICsgICByZXQgPSBjbGtfcHJlcGFyZV9lbmFibGUoaXNjLT5p
c3Bjayk7DQo+Pj4gKyAgIGlmIChyZXQpIHsNCj4+PiArICAgICAgICAgICBkZXZfZXJyKGRldiwg
ImZhaWxlZCB0byBlbmFibGUgaXNwY2s6ICVkXG4iLCByZXQpOw0KPj4+ICsgICAgICAgICAgIGdv
dG8gdW5wcmVwYXJlX2hjbGs7DQo+Pj4gKyAgIH0NCj4+PiArDQo+Pj4gKyAgIC8qIGlzcGNrIHNo
b3VsZCBiZSBncmVhdGVyIG9yIGVxdWFsIHRvIGhjbG9jayAqLw0KPj4+ICsgICByZXQgPSBjbGtf
c2V0X3JhdGUoaXNjLT5pc3BjaywgY2xrX2dldF9yYXRlKGlzYy0+aGNsb2NrKSk7DQo+Pj4gKyAg
IGlmIChyZXQpIHsNCj4+PiArICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWxlZCB0byBzZXQg
aXNwY2sgcmF0ZTogJWRcbiIsIHJldCk7DQo+Pj4gKyAgICAgICAgICAgZ290byB1bnByZXBhcmVf
Y2xrOw0KPj4+ICsgICB9DQo+Pj4gKw0KPj4+ICsgICByZXQgPSB2NGwyX2RldmljZV9yZWdpc3Rl
cihkZXYsICZpc2MtPnY0bDJfZGV2KTsNCj4+PiArICAgaWYgKHJldCkgew0KPj4+ICsgICAgICAg
ICAgIGRldl9lcnIoZGV2LCAidW5hYmxlIHRvIHJlZ2lzdGVyIHY0bDIgZGV2aWNlLlxuIik7DQo+
Pj4gKyAgICAgICAgICAgZ290byB1bnByZXBhcmVfY2xrOw0KPj4+ICsgICB9DQo+Pj4gKw0KPj4+
ICsgICByZXQgPSB4aXNjX3BhcnNlX2R0KGRldiwgaXNjKTsNCj4+PiArICAgaWYgKHJldCkgew0K
Pj4+ICsgICAgICAgICAgIGRldl9lcnIoZGV2LCAiZmFpbCB0byBwYXJzZSBkZXZpY2UgdHJlZVxu
Iik7DQo+Pj4gKyAgICAgICAgICAgZ290byB1bnJlZ2lzdGVyX3Y0bDJfZGV2aWNlOw0KPj4+ICsg
ICB9DQo+Pj4gKw0KPj4+ICsgICBpZiAobGlzdF9lbXB0eSgmaXNjLT5zdWJkZXZfZW50aXRpZXMp
KSB7DQo+Pj4gKyAgICAgICAgICAgZGV2X2VycihkZXYsICJubyBzdWJkZXYgZm91bmRcbiIpOw0K
Pj4+ICsgICAgICAgICAgIHJldCA9IC1FTk9ERVY7DQo+Pj4gKyAgICAgICAgICAgZ290byB1bnJl
Z2lzdGVyX3Y0bDJfZGV2aWNlOw0KPj4+ICsgICB9DQo+Pj4gKw0KPj4+ICsgICBsaXN0X2Zvcl9l
YWNoX2VudHJ5KHN1YmRldl9lbnRpdHksICZpc2MtPnN1YmRldl9lbnRpdGllcywgbGlzdCkgew0K
Pj4+ICsgICAgICAgICAgIHN0cnVjdCB2NGwyX2FzeW5jX3N1YmRldiAqYXNkOw0KPj4+ICsNCj4+
PiArICAgICAgICAgICB2NGwyX2FzeW5jX25vdGlmaWVyX2luaXQoJnN1YmRldl9lbnRpdHktPm5v
dGlmaWVyKTsNCj4+PiArDQo+Pj4gKyAgICAgICAgICAgYXNkID0gdjRsMl9hc3luY19ub3RpZmll
cl9hZGRfZndub2RlX3JlbW90ZV9zdWJkZXYoDQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgJnN1YmRldl9lbnRpdHktPm5vdGlmaWVyLA0KPj4+ICsgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIG9mX2Z3bm9kZV9oYW5kbGUoc3ViZGV2X2VudGl0eS0+ZXBu
KSwNCj4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRsMl9h
c3luY19zdWJkZXYpOw0KPj4+ICsNCj4+PiArICAgICAgICAgICBvZl9ub2RlX3B1dChzdWJkZXZf
ZW50aXR5LT5lcG4pOw0KPj4+ICsgICAgICAgICAgIHN1YmRldl9lbnRpdHktPmVwbiA9IE5VTEw7
DQo+Pj4gKw0KPj4+ICsgICAgICAgICAgIGlmIChJU19FUlIoYXNkKSkgew0KPj4+ICsgICAgICAg
ICAgICAgICAgICAgcmV0ID0gUFRSX0VSUihhc2QpOw0KPj4+ICsgICAgICAgICAgICAgICAgICAg
Z290byBjbGVhbnVwX3N1YmRldjsNCj4+PiArICAgICAgICAgICB9DQo+Pj4gKw0KPj4+ICsgICAg
ICAgICAgIHN1YmRldl9lbnRpdHktPm5vdGlmaWVyLm9wcyA9ICZpc2NfYXN5bmNfb3BzOw0KPj4+
ICsNCj4+PiArICAgICAgICAgICByZXQgPSB2NGwyX2FzeW5jX25vdGlmaWVyX3JlZ2lzdGVyKCZp
c2MtPnY0bDJfZGV2LA0KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgJnN1YmRldl9lbnRpdHktPm5vdGlmaWVyKTsNCj4+PiArICAgICAgICAgICBpZiAo
cmV0KSB7DQo+Pj4gKyAgICAgICAgICAgICAgICAgICBkZXZfZXJyKGRldiwgImZhaWwgdG8gcmVn
aXN0ZXIgYXN5bmMgbm90aWZpZXJcbiIpOw0KPj4+ICsgICAgICAgICAgICAgICAgICAgZ290byBj
bGVhbnVwX3N1YmRldjsNCj4+PiArICAgICAgICAgICB9DQo+Pj4gKw0KPj4+ICsgICAgICAgICAg
IGlmICh2aWRlb19pc19yZWdpc3RlcmVkKCZpc2MtPnZpZGVvX2RldikpDQo+Pj4gKyAgICAgICAg
ICAgICAgICAgICBicmVhazsNCj4+PiArICAgfQ0KPj4+ICsNCj4+PiArICAgcG1fcnVudGltZV9z
ZXRfYWN0aXZlKGRldik7DQo+Pj4gKyAgIHBtX3J1bnRpbWVfZW5hYmxlKGRldik7DQo+Pj4gKyAg
IHBtX3JlcXVlc3RfaWRsZShkZXYpOw0KPj4+ICsNCj4+PiArICAgcmVnbWFwX3JlYWQoaXNjLT5y
ZWdtYXAsIElTQ19WRVJTSU9OICsgaXNjLT5vZmZzZXRzLnZlcnNpb24sICZ2ZXIpOw0KPj4+ICsg
ICBkZXZfaW5mbyhkZXYsICJNaWNyb2NoaXAgWElTQyB2ZXJzaW9uICV4XG4iLCB2ZXIpOw0KPj4+
ICsNCj4+PiArICAgcmV0dXJuIDA7DQo+Pj4gKw0KPj4+ICtjbGVhbnVwX3N1YmRldjoNCj4+PiAr
ICAgaXNjX3N1YmRldl9jbGVhbnVwKGlzYyk7DQo+Pj4gKw0KPj4+ICt1bnJlZ2lzdGVyX3Y0bDJf
ZGV2aWNlOg0KPj4+ICsgICB2NGwyX2RldmljZV91bnJlZ2lzdGVyKCZpc2MtPnY0bDJfZGV2KTsN
Cj4+PiArDQo+Pj4gK3VucHJlcGFyZV9jbGs6DQo+Pj4gKyAgIGNsa19kaXNhYmxlX3VucHJlcGFy
ZShpc2MtPmlzcGNrKTsNCj4+PiArdW5wcmVwYXJlX2hjbGs6DQo+Pj4gKyAgIGNsa19kaXNhYmxl
X3VucHJlcGFyZShpc2MtPmhjbG9jayk7DQo+Pj4gKw0KPj4+ICsgICBpc2NfY2xrX2NsZWFudXAo
aXNjKTsNCj4+PiArDQo+Pj4gKyAgIHJldHVybiByZXQ7DQo+Pj4gK30NCj4+PiArDQo+Pj4gK3N0
YXRpYyBpbnQgbWljcm9jaGlwX3hpc2NfcmVtb3ZlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBk
ZXYpDQo+Pj4gK3sNCj4+PiArICAgc3RydWN0IGlzY19kZXZpY2UgKmlzYyA9IHBsYXRmb3JtX2dl
dF9kcnZkYXRhKHBkZXYpOw0KPj4+ICsNCj4+PiArICAgcG1fcnVudGltZV9kaXNhYmxlKCZwZGV2
LT5kZXYpOw0KPj4+ICsNCj4+PiArICAgaXNjX3N1YmRldl9jbGVhbnVwKGlzYyk7DQo+Pj4gKw0K
Pj4+ICsgICB2NGwyX2RldmljZV91bnJlZ2lzdGVyKCZpc2MtPnY0bDJfZGV2KTsNCj4+PiArDQo+
Pj4gKyAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShpc2MtPmlzcGNrKTsNCj4+PiArICAgY2xrX2Rp
c2FibGVfdW5wcmVwYXJlKGlzYy0+aGNsb2NrKTsNCj4+PiArDQo+Pj4gKyAgIGlzY19jbGtfY2xl
YW51cChpc2MpOw0KPj4+ICsNCj4+PiArICAgcmV0dXJuIDA7DQo+Pj4gK30NCj4+PiArDQo+Pj4g
K3N0YXRpYyBpbnQgX19tYXliZV91bnVzZWQgeGlzY19ydW50aW1lX3N1c3BlbmQoc3RydWN0IGRl
dmljZSAqZGV2KQ0KPj4+ICt7DQo+Pj4gKyAgIHN0cnVjdCBpc2NfZGV2aWNlICppc2MgPSBkZXZf
Z2V0X2RydmRhdGEoZGV2KTsNCj4+PiArDQo+Pj4gKyAgIGNsa19kaXNhYmxlX3VucHJlcGFyZShp
c2MtPmlzcGNrKTsNCj4+PiArICAgY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGlzYy0+aGNsb2NrKTsN
Cj4+PiArDQo+Pj4gKyAgIHJldHVybiAwOw0KPj4+ICt9DQo+Pj4gKw0KPj4+ICtzdGF0aWMgaW50
IF9fbWF5YmVfdW51c2VkIHhpc2NfcnVudGltZV9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQ0K
Pj4+ICt7DQo+Pj4gKyAgIHN0cnVjdCBpc2NfZGV2aWNlICppc2MgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsNCj4+PiArICAgaW50IHJldDsNCj4+PiArDQo+Pj4gKyAgIHJldCA9IGNsa19wcmVwYXJl
X2VuYWJsZShpc2MtPmhjbG9jayk7DQo+Pj4gKyAgIGlmIChyZXQpDQo+Pj4gKyAgICAgICAgICAg
cmV0dXJuIHJldDsNCj4+PiArDQo+Pj4gKyAgIHJldCA9IGNsa19wcmVwYXJlX2VuYWJsZShpc2Mt
PmlzcGNrKTsNCj4+PiArICAgaWYgKHJldCkNCj4+PiArICAgICAgICAgICBjbGtfZGlzYWJsZV91
bnByZXBhcmUoaXNjLT5oY2xvY2spOw0KPj4+ICsNCj4+PiArICAgcmV0dXJuIHJldDsNCj4+PiAr
fQ0KPj4+ICsNCj4+PiArc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcG1fb3BzIG1pY3JvY2hpcF94
aXNjX2Rldl9wbV9vcHMgPSB7DQo+Pj4gKyAgIFNFVF9SVU5USU1FX1BNX09QUyh4aXNjX3J1bnRp
bWVfc3VzcGVuZCwgeGlzY19ydW50aW1lX3Jlc3VtZSwgTlVMTCkNCj4+PiArfTsNCj4+PiArDQo+
Pj4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkIG1pY3JvY2hpcF94aXNjX29mX21h
dGNoW10gPSB7DQo+Pj4gKyAgIHsgLmNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNhbWE3ZzUtaXNj
IiB9LA0KPj4+ICsgICB7IH0NCj4+PiArfTsNCj4+PiArTU9EVUxFX0RFVklDRV9UQUJMRShvZiwg
bWljcm9jaGlwX3hpc2Nfb2ZfbWF0Y2gpOw0KPj4+ICsNCj4+PiArc3RhdGljIHN0cnVjdCBwbGF0
Zm9ybV9kcml2ZXIgbWljcm9jaGlwX3hpc2NfZHJpdmVyID0gew0KPj4+ICsgICAucHJvYmUgID0g
bWljcm9jaGlwX3hpc2NfcHJvYmUsDQo+Pj4gKyAgIC5yZW1vdmUgPSBtaWNyb2NoaXBfeGlzY19y
ZW1vdmUsDQo+Pj4gKyAgIC5kcml2ZXIgPSB7DQo+Pj4gKyAgICAgICAgICAgLm5hbWUgICAgICAg
ICAgID0gIm1pY3JvY2hpcC1zYW1hN2c1LXhpc2MiLA0KPj4+ICsgICAgICAgICAgIC5wbSAgICAg
ICAgICAgICA9ICZtaWNyb2NoaXBfeGlzY19kZXZfcG1fb3BzLA0KPj4+ICsgICAgICAgICAgIC5v
Zl9tYXRjaF90YWJsZSA9IG9mX21hdGNoX3B0cihtaWNyb2NoaXBfeGlzY19vZl9tYXRjaCksDQo+
Pj4gKyAgIH0sDQo+Pj4gK307DQo+Pj4gKw0KPj4+ICttb2R1bGVfcGxhdGZvcm1fZHJpdmVyKG1p
Y3JvY2hpcF94aXNjX2RyaXZlcik7DQo+Pj4gKw0KPj4+ICtNT0RVTEVfQVVUSE9SKCJFdWdlbiBI
cmlzdGV2IDxldWdlbi5ocmlzdGV2QG1pY3JvY2hpcC5jb20+Iik7DQo+Pj4gK01PRFVMRV9ERVND
UklQVElPTigiVGhlIFY0TDIgZHJpdmVyIGZvciBNaWNyb2NoaXAtWElTQyIpOw0KPj4+ICtNT0RV
TEVfTElDRU5TRSgiR1BMIHYyIik7DQo+Pj4gK01PRFVMRV9TVVBQT1JURURfREVWSUNFKCJ2aWRl
byIpOw0KPj4+DQo+Pg0KDQo=
