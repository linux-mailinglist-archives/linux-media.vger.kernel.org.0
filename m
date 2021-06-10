Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 701943A2AEF
	for <lists+linux-media@lfdr.de>; Thu, 10 Jun 2021 14:00:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230267AbhFJMCl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 10 Jun 2021 08:02:41 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:24979 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230262AbhFJMCk (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 10 Jun 2021 08:02:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1623326444; x=1654862444;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=nJf81dHKx5OHZ+BwWiTrrHODYko7I7PAwDcE1F12idg=;
  b=t/KdHFwl1y48Ri7Jo2FKz+7+3EjX5xFHls2cMPwpmkmVMoEYx0V3AivK
   +snPdp7R4qhBMRK9X/09LmoqazCCWfnpA5le3rp15qKM+h/zze8svmGyG
   YL6tF39caNaR0m5CFvR1Agl1zqLPHFRl/pW4a/FHouAsG5vfsgonFauku
   uUE3ePSLujUANDzhyZ28AKA4oY+KMPN7pahQC7Cjvkrt1bOoi7rbliTQY
   Rc0u8FpyFtrERXL0XU4HIphpIrLmAgy+FmkFd2D0+wvs8rfmbGJj/t8UM
   kyn3CJp9RqACiMnwzfTxPOrSumNgnKkSF2QEAXFcwc6tfZ+dVymF7uH9X
   w==;
IronPort-SDR: pweOYlzeVejbME/7Il/oEqkj34g4F5ogtr0ii0gUIL3Rn/nWT9Z7A71ssoR72ytI36eLecbZG6
 a1CAWHlJ6ya1DapPMKJ9XR2ktByL2qhFq2qFzMMXWwxbM6v8sr9KTeLwVgo9gknQMKTjJgYEu2
 bpLFpYJuIOeY+wf6c9VryzOBPC9yFsYvX5Mpfqsmays93/Zg5YPEwMkTl6wbC6Ksmk+4NI1o/A
 GHYlF97BZgb26UX+Vnf3T/8et+pY13R1xsHkJBXeazc1N8eD5c0ei7oDt/5Fj1OZLgs9/fzhTV
 BRI=
X-IronPort-AV: E=Sophos;i="5.83,263,1616482800"; 
   d="scan'208";a="124790671"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 10 Jun 2021 05:00:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 10 Jun 2021 05:00:43 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 10 Jun 2021 05:00:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lDilVFc0AT6SuH0YVQ8mQ/xyRV6gnhs4CsFWDJHbdO5cnUtPC69ixTVGhkxDFW9XbV5QMA7IFaP3T4m1gJXmlD4zvhk6D3TU72AiGcJkmHTRcoRhE7GFzIV9zbaX2b0k8AzMBl0n+c6Pfi42DAPf3HJLxafV50av3ONfQYQ+pOS9cx/4dwjA99AUFGaoxcG3FfFz1MP0z8hCiy1IMlXxXFzqAOA8NaycWyG8s686Wcn4IE39lKYOjM/L2Ek7V5USyWfrXCmBxJwpI1tQXLxcf6U7dl/a8t7nk3u8EoS3wYLJh351MjthDkbOycbaZaY9NJ2r9ImsTm6zw/VnIrSJSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJf81dHKx5OHZ+BwWiTrrHODYko7I7PAwDcE1F12idg=;
 b=lKme7dD0WtZUdpjz2SK7fochhgTC8eUboNVsB847kHtJGxaRQ7Droy8uBn6o/ab3W1KrYFoKxLar4EfMYYwAe/tJ7rNj/JmnFaeW0tGIhYd0AEkT/IhoBSqjWluyD1vXxL0rSzv3b8e9KWMfRTNXxtxeF9PDED6wxgXRdOTglH9cunCb1EOaiao7GqVQrpw77rcSMv/kgRYzH46APp5EmDk+WEAsStpYZiFt+DA3cEWrL29XlgTGqqTW+NNDdSIzR08F3nEx/KxktL+MKQfbAYHBYwyiiQ/mRjEM2IUei6wd87eJqWDoFvhI579CZH7Fdr6XMn5A5QYE4bGC4moBRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nJf81dHKx5OHZ+BwWiTrrHODYko7I7PAwDcE1F12idg=;
 b=G8++tlbogikaQX33YQLcDT9rqvVU+Qxx5z5lXVSjfmgup1IIMkYda4ZMSvZCdSS81JDRpfozifGGzOalV/7ShhJG/AoXy+B5bGrh2rvQKlYFTDK1LW9niDFUxFJgqYWFs1byjOfMjlV22/XJYH3Jd7hzkzHwhTBxFA4HC2HSRDY=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN9PR11MB5242.namprd11.prod.outlook.com (2603:10b6:408:133::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20; Thu, 10 Jun
 2021 12:00:42 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::1de9:8da4:2f63:fc9d]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::1de9:8da4:2f63:fc9d%4]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 12:00:42 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <mchehab+huawei@kernel.org>
CC:     <Jonathan.Cameron@Huawei.com>, <linuxarm@huawei.com>,
        <mauro.chehab@huawei.com>, <alexandre.belloni@bootlin.com>,
        <Ludovic.Desroches@microchip.com>, <mchehab@kernel.org>,
        <Nicolas.Ferre@microchip.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
        <Claudiu.Beznea@microchip.com>
Subject: Re: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Topic: [PATCH 08/25] media: atmel: properly get pm_runtime
Thread-Index: AQHXQZL+MGs0ijyAgUSZwiGLPkSbCarUy5mAgDhgXQCAAAmegIAAJ7wA
Date:   Thu, 10 Jun 2021 12:00:42 +0000
Message-ID: <e25d024e-4fa6-dd67-b97a-1d2640f2b560@microchip.com>
References: <cover.1620207353.git.mchehab+huawei@kernel.org>
 <975645970144b6c8401ab9bd1243619978a868a9.1620207353.git.mchehab+huawei@kernel.org>
 <20210505130835.000006b7@Huawei.com>
 <cd524923-93f0-e15c-816f-595a80184206@microchip.com>
 <20210610113827.57db9e77@coco.lan>
In-Reply-To: <20210610113827.57db9e77@coco.lan>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=microchip.com;
x-originating-ip: [188.25.124.15]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a1bfa588-0561-4cbf-118b-08d92c075f1f
x-ms-traffictypediagnostic: BN9PR11MB5242:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BN9PR11MB5242427E8445C774D1910AA0E8359@BN9PR11MB5242.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: Aj/quyPeuJKoQ7Uvlg+vIR6eNRyLig+aC1VHnEuddxq2D0nOdIMVTW5G902YZGRj7elYItuxlD9B8/+9YELfsNxgTqRXOxKBYCx2xsPWl5oYnmpsCboTspapSM/MuEPgQkKd19T9s3wKNk9yac7hIvnY9GHUs7H8uoBcyu/EDdnyPobn/lO53YnE4rz86W+yFWWgByoOP4ScLLCgErL6fJXdtFUhV208uW805q1F6CEFHS6jyL8B7l1/37FonAkE5h/Vme7aXGHekJGjAT+1kN0WvIJprbIMQHr4FCvzOcBsN1EU4XYJqS2MGUT+aFjfDv14D4FE4TmKoSkQLEbeBDn4he5JP+GZrkYT3+xjpGQYiq2C+kiK5HFFxKBvXz2BBt7G0jwKTIEDN0CPeBHuePHPEJUyB5pJ3ccIDZqSINSGnym0EBMHzZyVYiGY21cyoY63T1usA/taXVP3YI3urlFys7Fz5YDsSVbdM98wglFASzeGCviiK09ikpSW1Ee9MubE40REMDc64XU013W9C9kM8MlUmoM8o8x8UqG0cIKjDtCp+SA470ssEN+r+/kADI6OMYXDwAovQ866ZgSfYUMAyLo7zFjkYTJxv8RwUx5mPqe2Qy3E89Cjryxy6w+8Yiq6NIyGIE6ltUcK8LGQ2UWRE39FTxVtvifUwzkUUP19SA1o4lAuUipe+ZFemkoo
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(136003)(346002)(39860400002)(366004)(122000001)(8676002)(316002)(6506007)(53546011)(83380400001)(36756003)(26005)(71200400001)(186003)(64756008)(38100700002)(54906003)(91956017)(478600001)(76116006)(4326008)(5660300002)(66476007)(2906002)(66556008)(86362001)(6486002)(107886003)(66446008)(31696002)(2616005)(66946007)(8936002)(6512007)(31686004)(45980500001)(43740500002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bTBjaFpaNmt5OThHVE1aSk40enBuMy9oQ2x4empIODJnOVNyVjBJR1F2dU9x?=
 =?utf-8?B?M1RJZlRWNFdzeFVDWHk3RUxiVU91WWxPeFdkdnR4bTJlRXpKMysraVdkV0FV?=
 =?utf-8?B?S1BsRW1NaE9LZHRrWlErSTRFWm5qWm16MlpxOEZ1byt1d0QwQnNXOTYwS0l2?=
 =?utf-8?B?TUFKNlB5Yk9QK1AvNnJEQmR0N3M4YTIrQjcrOWp2OEFhY0hWVzh1Z0MyVzJN?=
 =?utf-8?B?OWw5ZHdic2NnYWZNbWZHcHNwNldDSnBFOTErQnUzeG1yVFovTk9NRENON2I5?=
 =?utf-8?B?a255blY1cm1DTlgzK1B1bzVrd2NXOVh1NXdqc1lwT0tBUXgvbmMyT0NUT2c4?=
 =?utf-8?B?VWtUTU4vNTI1Y0Q2WkhSM1hGNTI4M2J0bzVTT1BRNnpQRld3UHJuOTRBU3JO?=
 =?utf-8?B?TmRiMkgrUkhvVjdIdU1RQ3JhUnVET3ZyQXJUekJXZHVhYjVoUjBTWEZ4YTdu?=
 =?utf-8?B?VkEyRXZ5ZDIvaXhZeWZzN0lZZjZhTkg3N0xoa09PWThCUys5VzJVWkxSSkdz?=
 =?utf-8?B?bFNTMnEvaExFMXpWS2lrVm1vVFlDVmRBV2JOUGxyejlUYXBxOFVrd1dnVTRI?=
 =?utf-8?B?NkZGdVJCaDBVU3dCbzlWa0JsSjl1TmZKNlZvUHhwaDE0QlBGNlU3Tm9mcDYz?=
 =?utf-8?B?b0RqcUJ0UHJ6NGhVc0tMVWN2NzZQWGZZdnZhMFlrbVE1eGthWVZYTW5wdHFy?=
 =?utf-8?B?Tmg3VFpKYWRLb3AyZVpNZFJzYUxONURvcTh3Y2ZxU0pXcFRlWWgwYzRqZGVW?=
 =?utf-8?B?ZWxBeFcyYUNnT3pIZnpnZ0pUQVJWNmIzNFdqTDFHSm9YSmZINnNZR1cvSnZt?=
 =?utf-8?B?SFV5ZlF1OUV4MWZRb2JvMnNKdXBjNjkxMlIwSTZvQi9QdUplS1RTanNNVjQ3?=
 =?utf-8?B?RGg3clIxdThwL1BaU0NFZVlVeU01c053a1MxVHlRK2Irdi8rMEpSNjhWMGZ1?=
 =?utf-8?B?b0d5eG9iSE82UVdHQXpkMTRqWEtKbWlZR3NybkdJNjlhbENHcXV2OUtnbjFr?=
 =?utf-8?B?dGdkdkVoNGJTbGc1QXpJZzVjY1g5dEtFQmZ3eXNJMXg3Wkc5Yk9uQTR6eGpV?=
 =?utf-8?B?WTB5OFljUndNMWVMWTNsamQxVUd0ZThjRkZiY2NBV0VnZmdkZ2lVbWpMNW9z?=
 =?utf-8?B?V1JkNmFUZWxkNU4wQjBxUTBDOElieTNJaXFuOExUT1JiS1JPQTRRdVlTaHRx?=
 =?utf-8?B?a1dST0VDKyswNS85TEJGS05qZ0VUVjdrc0ozcnlIWkxKcEtZYml4VnlJbUwy?=
 =?utf-8?B?WkR3VFdjdm5YdVNXeGdsNDJKSWxPRzZ3NnFsZlZwSzM2MWREWDJzQVBsNGhY?=
 =?utf-8?B?UW1GcHlTKzF6QW5WWk1XZFNGYmZOTGlPN3VibjNWd1pnTnFQNUlwTENNdzFR?=
 =?utf-8?B?V01DRDVCUHc1cHc5T1B6WjFKNkI2TTVQSmlNTFN3c3J2cWg4cGdZYmJkS3ZO?=
 =?utf-8?B?SWlDRVJ0UWRNSVgzYm1nZm4zZm1ZMmgvd1VKYVZyZnJIR1VNQ1BVWitRcDR1?=
 =?utf-8?B?ZFlHU3lyNWJ5ck5JYnREWGVJclpLOTRLZEVOcXNxbGhRbXBYSTdRaXl6SUFj?=
 =?utf-8?B?ZmdaYnVOeWFPUEZGdW9HVkt0RzZOcWRxaUlnMWQrTnNCbEM1eXlrZzFqRXpE?=
 =?utf-8?B?R29uSTdjaGZmZWJVVTlpY3UyNjlrdzJjYlFOa1UwSm5WMFg3S2pmZGZFYmlY?=
 =?utf-8?B?UlZwbkIwbXRibDF3SnBvbi9kYXh4WXdOcFV5cS94VWIxdXpXMnE5RUVhTXJI?=
 =?utf-8?Q?F5lVO9RxNS903yVNUM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <42CE496DBDE09745AD692AC1A4C9ABEC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1bfa588-0561-4cbf-118b-08d92c075f1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Jun 2021 12:00:42.0805
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z8XQjhaxHiyHDv8y7UPh0PyreMnvR1ODJSmNNJK8CPNa8SPZz4h6pG9/YQbNCUrYA05XZCLGFj6JAiqyah6wVYCLWr1IznK9Oe5dk5omCr0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5242
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNi8xMC8yMSAxMjozOCBQTSwgTWF1cm8gQ2FydmFsaG8gQ2hlaGFiIHdyb3RlOg0KPiBFWFRF
Uk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNz
IHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IEVtIFRodSwgMTAgSnVuIDIwMjEg
MDk6MDQ6MDcgKzAwMDANCj4gPEV1Z2VuLkhyaXN0ZXZAbWljcm9jaGlwLmNvbT4gZXNjcmV2ZXU6
DQo+IA0KPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1l
bC1pc2MtYmFzZS5jIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFz
ZS5jDQo+Pj4+IGluZGV4IGZlM2VjOGQwZWFlZS4uY2U4ZTEzNTFmYTUzIDEwMDY0NA0KPj4+PiAt
LS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLmMNCj4+Pj4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5jDQo+Pj4+
IEBAIC0yOTQsOSArMjk0LDEzIEBAIHN0YXRpYyBpbnQgaXNjX3dhaXRfY2xrX3N0YWJsZShzdHJ1
Y3QgY2xrX2h3ICpodykNCj4+Pj4gICAgc3RhdGljIGludCBpc2NfY2xrX3ByZXBhcmUoc3RydWN0
IGNsa19odyAqaHcpDQo+Pj4+ICAgIHsNCj4+Pj4gICAgICAgICBzdHJ1Y3QgaXNjX2NsayAqaXNj
X2NsayA9IHRvX2lzY19jbGsoaHcpOw0KPj4+PiArICAgICBpbnQgcmV0Ow0KPj4+Pg0KPj4+PiAt
ICAgICBpZiAoaXNjX2Nsay0+aWQgPT0gSVNDX0lTUENLKQ0KPj4+PiAtICAgICAgICAgICAgIHBt
X3J1bnRpbWVfZ2V0X3N5bmMoaXNjX2Nsay0+ZGV2KTsNCj4+Pj4gKyAgICAgaWYgKGlzY19jbGst
PmlkID09IElTQ19JU1BDSykgew0KPj4+PiArICAgICAgICAgICAgIHJldCA9IHBtX3J1bnRpbWVf
cmVzdW1lX2FuZF9nZXQoaXNjX2Nsay0+ZGV2KTsNCj4+Pj4gKyAgICAgICAgICAgICBpZiAocmV0
IDwgMCkNCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+Pj4+ICsgICAg
IH0NCj4+DQo+PiBIaSBNYXVybywNCj4+DQo+PiBXaXRoIHRoaXMgcGF0Y2gsIHRoZSBJU0MgaXMg
YnJva2VuIG9uIGxhdGVzdCBtZWRpYSB0cmVlLiBJdCBsb29rcyBsaWtlDQo+PiBwbV9ydW50aW1l
X3Jlc3VtZV9hbmRfZ2V0IGZvciB0aGUgSVNDX0lTUENLIGNsb2NrIHJldHVybnMgLUVOT0FDQ0VT
UyBhbmQNCj4+IHRodXMsIHRoZSBwcm9iZSBvZiB0aGUgZHJpdmVyIGZhaWxzOg0KPj4NCj4+IGF0
bWVsLXNhbWE1ZDItaXNjIGYwMDA4MDAwLmlzYzogZmFpbGVkIHRvIGVuYWJsZSBpc3BjazogLTEz
DQo+PiBhdG1lbC1zYW1hNWQyLWlzYzogcHJvYmUgb2YgZjAwMDgwMDAuaXNjIGZhaWxlZCB3aXRo
IGVycm9yIC0xMw0KPj4NCj4+DQo+PiBDb3VsZCB5b3UgcG9pbnQgb3V0IGhvdyBJIGNvdWxkIGZp
eCB0aGlzID8gTWF5YmUgdGhlIGlzY19jbGstPmRldiBpcyBub3QNCj4+IHByb3Blcmx5IGhhbmRs
ZWQvaW5pdGlhbGl6ZWQgaW4gc29tZSBvdGhlciBwYXJ0IG9mIHRoZSBjb2RlID8NCj4gDQo+IExv
b2tpbmcgYXQgUlBNIGltcGxlbWVudGF0aW9uOg0KPiANCj4gICAgICAgICAgc3RhdGljIGludCBy
cG1fcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldiwgaW50IHJwbWZsYWdzKQ0KPiAgICAgICAgICB7
DQo+IC4uLg0KPiAgICAgICAgICBpZiAoZGV2LT5wb3dlci5ydW50aW1lX2Vycm9yKQ0KPiAgICAg
ICAgICAgICAgICAgIHJldHZhbCA9IC1FSU5WQUw7DQo+ICAgICAgICAgIGVsc2UgaWYgKGRldi0+
cG93ZXIuZGlzYWJsZV9kZXB0aCA9PSAxICYmIGRldi0+cG93ZXIuaXNfc3VzcGVuZGVkDQo+ICAg
ICAgICAgICAgICAmJiBkZXYtPnBvd2VyLnJ1bnRpbWVfc3RhdHVzID09IFJQTV9BQ1RJVkUpDQo+
ICAgICAgICAgICAgICAgICAgcmV0dmFsID0gMTsNCj4gICAgICAgICAgZWxzZSBpZiAoZGV2LT5w
b3dlci5kaXNhYmxlX2RlcHRoID4gMCkNCj4gICAgICAgICAgICAgICAgICByZXR2YWwgPSAtRUFD
Q0VTOw0KPiAuLi4NCj4gDQo+IEl0IHNvdW5kcyB0aGF0IFJQTSBpcyBkaXNhYmxlZCBmb3IgdGhp
cyBjbG9jay4gRGlkIHlvdSBjYWxsDQo+IHBtX3J1bnRpbWVfZW5hYmxlKCkgYmVmb3JlIGNhbGxp
bmcgaXNjX2Nsa19wcmVwYXJlKCk/DQo+IA0KPiBUaGFua3MsDQo+IE1hdXJvDQo+IA0KDQpJIHRy
aWVkIHRvIGNhbGwgcG1fcnVudGltZV9lbmFibGUgZm9yIHRoZSBjbGsgYXQgY2xrX2luaXQgdGlt
ZSwgYnV0IA0KZG9pbmcgdGhhdCBtYWtlcyB0aGUgcnVudGltZSBmb3IgdGhlIElTQyBmYWlsIGxp
a2UgdGhpczoNCg0KYXRtZWwtc2FtYTVkMi1pc2MgZjAwMDgwMDAuaXNjOiBVbmJhbGFuY2VkIHBt
X3J1bnRpbWVfZW5hYmxlIQ0K
