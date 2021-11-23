Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 58CC445A198
	for <lists+linux-media@lfdr.de>; Tue, 23 Nov 2021 12:35:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236221AbhKWLjE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 23 Nov 2021 06:39:04 -0500
Received: from esa.microchip.iphmx.com ([68.232.153.233]:59052 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235094AbhKWLjA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Nov 2021 06:39:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637667353; x=1669203353;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VgbXZX8rr8P3vWanzMyRIL1sFNUIUOBV+IaE5ZZCG9o=;
  b=whqF+VyBbksKGZjYpJ2BvV7KtBr7Gva7ezuKWzAwy5w1MtAa2MFS9E+Q
   KGuzCbAErI1JzPcNp81WCws+uS2Jozv2Xdtmf6TXR8jWeEG63pTB/nbyG
   tMbnQkeS/ERYl63HYc+p3wlmNsUmcL60q+klqiiuIAm7CJQQxxdc3djsE
   pgmgmcvGPZO5oSq4FlOkF8I/VpTuTdI5GCAgsJTjkIv1YwuIR6zoul5qG
   ZzmNA+sdX+XRaSoE8taTPLaO4HCsQOcz5cPRUsdAAnCVyvR9J2pod0WqU
   ELS+iDeoM8ITDsjfDf74ScbazqTOSTnnN0o/AQ++Avun2CYOXtwTjWecF
   A==;
IronPort-SDR: 6F4zFF2di/tYpV+vJf9gR6FS+802QvnjukSocN0nW1MGkuXROAUFXjJD6zesTnerIvuSztqpjQ
 SyVTV/mg98lUD8w0qnukTaK8CfkZ/gZcNdFVxYz/y9ykiXG4KnK6lc2ScpiNKntcrzPz5Im5HQ
 09Z6gZrdhcQNiw0Yiz8KBLt1ayqIdP0IoEmUI/Tqmbm40I3Dtvz/nsNehMpYVqkhhqYP33HAOx
 oe18jZnOvgudb8MME4P4yBHZJ7wToTG+EgjFAH+Nkil8y3IgA9y+SjsA+VYWLV3TyLgD9YSQI2
 GIcvZKdZpOAAW4Dxw3hC9foo
X-IronPort-AV: E=Sophos;i="5.87,257,1631602800"; 
   d="scan'208";a="152919301"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 23 Nov 2021 04:35:52 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 04:35:52 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Tue, 23 Nov 2021 04:35:52 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mIF+8FzdES5ZOM7ZVRMx2cI7KV7YjAjG/aiKHfWZHrGtneSxbzrFYynT7fpotgYZd8tsZdYsMrYCdG1kgPM6diybAbIA/8QtUNrxK06rDKleCQSpJXJPeVb2AghYYs7HhvdTC1/OnqcvRNlyAKIdD8r8D64caxBH6eELq08FR89C+7G1VyuQ1Lhm9tPrVaPh75t5PL2aNaHXAYf6iJR/mkpUVbxuERzDkGb6Fa5zo9WwoSr3BJqdNbmGxgxyAltXZna6JDGrWAyK48ZWOqGOPOMqxQDbjhYEGiH//KC+MZZEBDIGEfJACM1rLCFKYMljdn60aS23czZ2BBZAIC5ARQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgbXZX8rr8P3vWanzMyRIL1sFNUIUOBV+IaE5ZZCG9o=;
 b=SagL5s3FFnhu3R8T8vUAO46Lpql6H6j4Q8/bqweTN0atjJQXev8guvXKjApwZGwpyqehhyri5dy8FElx2WsgvIRem+YWpa9uLkFxhqqPf6ePmsRtk5keOtzJEUFZYkUs8p1ucmL/z9qY08imkpN5gNnqNtWF+rJeK/bYYV5nhiw8An37OfupCxK3drbJCNnzSs3hMjHyJ4/1QnMJRaaFlvEhT4srHFyCtw2cCVLnx5UkBFPN5waCg88VAzL5YYHpQZ1DbjwWGECKu15lmTLtMXl0FwppJRURwh0bKe4JJOSy4jeaGMV5EZEci79JJce3YS+E7VGmr9bpwyLbqysAng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgbXZX8rr8P3vWanzMyRIL1sFNUIUOBV+IaE5ZZCG9o=;
 b=quOnFfYy7/IK4XjOTRataMlqHHXlpXbIqJnOUgX38Es/JPg1S+SXv+ncwKaysL8LUc/MpFH7u1pTRyKNnv6E96F5PgPtsp/BFaH0+r1E2w/UF95JFzBddjfVFoAwnjofjMVk6/qPdgfl17CGoOewTLAgPmAaLS1nJdD08LYAWhc=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN7PR11MB2802.namprd11.prod.outlook.com (2603:10b6:406:b7::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Tue, 23 Nov
 2021 11:35:33 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.027; Tue, 23 Nov 2021
 11:35:33 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>
CC:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>,
        <skomatineni@nvidia.com>, <luca@lucaceresoli.net>,
        <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] media: i2c: imx274: simplify probe function by adding
 local variable dev
Thread-Topic: [PATCH 1/2] media: i2c: imx274: simplify probe function by
 adding local variable dev
Thread-Index: AQHX4Ft0Rnrv+C5VC0W0EA7KbxmMGawQ+M2AgAAC7YA=
Date:   Tue, 23 Nov 2021 11:35:33 +0000
Message-ID: <4ca5590d-b872-3720-d8f8-ec95a090c689@microchip.com>
References: <20211123111521.593863-1-eugen.hristev@microchip.com>
 <YZzPj4ILWyp4Ouz9@paasikivi.fi.intel.com>
In-Reply-To: <YZzPj4ILWyp4Ouz9@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: d7cb14c3-fc10-42a5-4920-08d9ae755c38
x-ms-traffictypediagnostic: BN7PR11MB2802:
x-microsoft-antispam-prvs: <BN7PR11MB280281F804886D15D24590D8E8609@BN7PR11MB2802.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: GI3qACFdkMj2CUQlP6LehwM84Qgm1M3Z29OT/YqoeIFZ9UQ4DZxUoFrSPibBrKwK0lK38SkpZTk1pyzAFYWNr7uQ+SRbPvtLwMFdEYSqpSwXQOcX3NZGKRwvhPmviuChg4QPAaFFW+lm84DXt1bXFdzdQtYYzjGksTfvviA4PIwzJ+oAAJCrhAq6OO149NOeURsptKd//S9RuJ9+7OecGLZB+vqv9SYKqzdJw/8sp7jEhEQtp21+k+svVoKiWPxAIst6l4DxYAJsBsglJLlx5/O1VjjUZdEqKtlTi7jjIktWEzuO+RXO3T9qE9UDtAWJ3WJYXhJ22ZLG1ti7juCzN7fbkSBAAtVo+xfFMdVJXIxFqB6E5Gyxj/U5d1rgt6igbZC0IhqWVZiUhXwcduzEsw5BXNw5OUjtN4YQmhNhFLj8R6/rQUFROCTdtteR6tof7Xq7k6wBUTdQ0lNUA/jZ6/9n8cWdAIyi2AX9QtO67tFzrF5LG7y0TuoHXrSYF3ny/SYvKqq31JQwyMo8AD3lgsIY2h+pCP/xDdqLI3jwFJWE505OiW8npx4Wmm5lhNnV1QdNmx1chH9acFdxrtX0/94s24XfqTJINm1I6SJQkAozrUgfk3MELc0pq7T6/BaWquEtoahkAzOoQCs0iH3XoHY4W4frpjcWogTDKrYdXXpnzhx7MHj1p38+DhRDIJ8MPOzRnxUKuK3ooQnEGLZqRRPedha7i+5mI17hXfae0zmYV40DB/4ULpfYRTR3Meh3Cyrx/NgB5/ceV8nMPKbnbQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(316002)(31686004)(4326008)(54906003)(66556008)(66476007)(6506007)(2906002)(8936002)(64756008)(53546011)(76116006)(38070700005)(36756003)(91956017)(66946007)(66446008)(26005)(6916009)(86362001)(186003)(71200400001)(38100700002)(31696002)(2616005)(508600001)(8676002)(4744005)(5660300002)(6512007)(6486002)(122000001)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cUdUOGVNZkR3L1V1RVR3eENMaWtTYW9WMDhKRFlVTGs1WTlwVTc4a0kxM3pP?=
 =?utf-8?B?MXBsaGFKMFRyLzBNdzhNMjR3emROMVRSMjczVzhLVERiNUhVbFNnVWlKT1l4?=
 =?utf-8?B?Z3QwanBpV05iR0w1bWhQRWRNQzQ0WFROWkdCQU5BbTdTK2QvbE1wTldYbFl0?=
 =?utf-8?B?MHk4dnVDMld1MFBzbTBxRGVqblpxK3R1cWdLbnRhNCttYk81RVFLSFlHdUtD?=
 =?utf-8?B?SzhWcW5XWDI1SklJeE9sTHdtdzg2dVF1Nm0wbkgzS1M1Q1hrOVdrdHRvS0xn?=
 =?utf-8?B?Um1mZnJBS21jMUlKQWlYQXhPMjYzZ2VBM21XZVNCUWJkUnRqM2VuWU84bDd6?=
 =?utf-8?B?cTlQS3BudUFzQW1JWjBQdjFNK2VRczg3cTR3TXZtRUo2MGZ1R0dhaGZPTjZT?=
 =?utf-8?B?SGVjd2Vub3VsQXYrSVlCTWdiUTN5b01sNUFIQ3R4dERrc1FnYjdzVDYvT09z?=
 =?utf-8?B?UWxFMU9MRTZ6WUw1cC8xSmIxVUZMN25acDVCcEZqN0ZVajRja3M5ZWJKK1Nw?=
 =?utf-8?B?cDJ6YURiclg3RkFFTDNNMHhEY0pJVk05eUFoK25sZ3RmZXdzZWJZTHNsemxV?=
 =?utf-8?B?WUY1ejNDWElSbXcvYmtyVUgxMDRuYVkrN1laQmZvNnNBRm5XOWt5UnJ2d1Zh?=
 =?utf-8?B?eXRFYmpMMWhSM2VuQ0tQZDJjV3JEbU5uU1p4cTlEY3ZldDUvNTZLMjJXekVX?=
 =?utf-8?B?L3JRK0RrMUtROXlaN21SQjE4UndhMHpzSFRDRTlZY1JhTmRhREdqd215MGZI?=
 =?utf-8?B?emMxbnRjblEzSjJmZGhsL3pwZUJWZi9vRm9VQzNGUk1GRi8wSGpSTndvM2Vw?=
 =?utf-8?B?YXdmUWluTXRVU2tVN0pPNEkyNDZVSTBMWFZ3ZmNvbU5xalV1SVdvRWpUdktj?=
 =?utf-8?B?UGFYeGtPRTEvYkpMblZQMWRuSHhTRmxDSkpBcWFlSnFHVmdOa094eDRJRjZl?=
 =?utf-8?B?M3RTQUFHMU5LZmlLL0s1WjNJdXJvZGcvQjVwRXZJbE1JQ2daWkZyTnhhU3RN?=
 =?utf-8?B?OEpqT0JJUzc4UDBjajk5Mkx2bDlyOEZGL3o0QnFIcEozTlVITE45K0pQNnRm?=
 =?utf-8?B?N1V1QXR4WWViUnpwbUxBbktNRzVNdlhXTlYrL1JSTVNVaEdXWnlvREROeVFY?=
 =?utf-8?B?Q0w0ZjMzZUM3VGtNM0pLb0pyQjU4ZVFzNEFiUDNzV1VpV0E4U2JDdnpCdWhM?=
 =?utf-8?B?aThETVVpS2Q5U0F5emZRNHJsUCtSc29FRy9aL29lVlFZYVNsYmZMRlRvVUZY?=
 =?utf-8?B?NFB5bURRM2I0Nlpod25pVWJNcHRIMGcvR1MzN0QrNmdtSEFHVEp2dW9QOEg5?=
 =?utf-8?B?d1gwT3puSTM5UUVZN3RyWUpFUEtIakJGRTV2U2QwRll5U3EvQWJveXE5VkUz?=
 =?utf-8?B?bTRaVFNEK05iSDhRTGx3TWxtMjJLUVRXczhSeTZiOURET3NLcWZIQ3plZnZ4?=
 =?utf-8?B?RCtwRzFzdWVwZXNNUVdmNXlqUGdCUGRJeXQ3N3F3WjdRY1MyS3VCWU1oQzJq?=
 =?utf-8?B?cTkwWXBRZWcwK2NoT3FYZkpGUWFEVXFwQ2NrcHFkQ0hVVDFOVEZueTRjN2t0?=
 =?utf-8?B?a2xzeVFpd09MS3NGbHNJcFZadmdNcEp2c2o1N0pvOXlsR2ZWSW93Um1rTXlq?=
 =?utf-8?B?WTZaT0NaOVQ3SXgxS0F6ZUphWlBtOGpSWGpuRTNNcjBMWGdqWlpVZVhNRFJr?=
 =?utf-8?B?NU1uMXhicSs4eXVodlZ5RkZ6WXFoUlM1Y0pVa24ybDBZUjhKTndZUnpmUjRz?=
 =?utf-8?B?cE92NmNWVVBXNGs2Z0pvcUlFVGhwZ3BiZkdIWjhYMWlBZGNubDNsVHRXOEhy?=
 =?utf-8?B?ajZMVk50ZWN5RGR0YVJDS1RYQmMzS3dwTDJVRytadFNVRjhkVDJ1U2FuRkdk?=
 =?utf-8?B?UTZVdk5oMmFUK1ZSd2xBMnVUZERBV3NCWE5hT1ZTM09sbzVVMWx6aUpzRTV3?=
 =?utf-8?B?dERLeXU4Z0YrcTEvcVFGSDZPckRCRi84N1d0dnRUc29KL1FJdGtLUEJJODRh?=
 =?utf-8?B?eFNDVFAyeGExZncvclkwd3BPQm9hT0U4b3F5K0s1Yi9oRk1uZld4Qlp0Mis0?=
 =?utf-8?B?L3IvSWVaSTFDK0ZNNEFvbk0zaHcvaVhuU2QrMVJ2V21Pbzl1NWk2VnRqelRS?=
 =?utf-8?B?MUtKcmpzVG5WOE1aYms2SHEwMmU3Z3FNQXFmeDN6aTk5alJXZzIzRFBoMUNF?=
 =?utf-8?B?QjRiazE1MEtIRmIreXRGTHFJYlNnQkxqaWJRSm02MFlxVFhSQitvb2pXNnJX?=
 =?utf-8?B?eW5udnFPNTdIejdmUzFXZWk1dUlBPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FD6056AF5C02ED4086F5FA7924EA4E06@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7cb14c3-fc10-42a5-4920-08d9ae755c38
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Nov 2021 11:35:33.0368
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: K75SNhDd5pnra/1rw6dUKdxOT7cd5PZGnBBD6zN1ijn+xVBfNfZcOPdI37ykKMfbVejqe/Il1LjQJtKRWuAGYuZMkxmEiiKpie/Qm6wQZ10=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2802
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvMjMvMjEgMToyNSBQTSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KDQo+IEhpIEV1Z2VuLA0K
PiANCj4gT24gVHVlLCBOb3YgMjMsIDIwMjEgYXQgMDE6MTU6MjBQTSArMDIwMCwgRXVnZW4gSHJp
c3RldiB3cm90ZToNCj4+IFNpbXBsaWZ5IHByb2JlIGZ1bmN0aW9uIGJ5IGFkZGluZyBhIGxvY2Fs
IHZhcmlhYmxlIGRldiBpbnN0ZWFkIG9mIHVzaW5nDQo+PiAmY2xpZW50LT5kZXYgYWxsIHRoZSB0
aW1lLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZA
bWljcm9jaGlwLmNvbT4NCj4gDQo+IEl0J3Mgbm90IHJlYWxseSB3cm9uZyB0byBkbyB0aGlzLCBi
dXQgaXMgaXQgdXNlZnVsPw0KPiANCj4gWW91IGNhbid0IGV2ZW4gdW53cmFwIGEgc2luZ2xlIGxp
bmUsIHRoZSBsaW5lcyBhcmUganVzdCBtYWRlIGEgbGl0dGxlIGJpdA0KPiBzaG9ydGVyLg0KDQpI
aSwNCg0KSSB0aGluayB0aGVyZSBhcmUgYSBmZXcgKDE4ICssIDIxIC0pIC4uLiBidXQgdGhlIGlk
ZWEgd2FzIHRvIG1ha2UgdGhlIA0KcHJvYmUgZnVuY3Rpb24gYSBsaXR0bGUgYml0IG1vcmUgZWFz
eSB0byByZWFkLg0KVXAgdG8geW91IGlmIHlvdSB3YW50IHRvIHRha2UgdGhpcyBwYXRjaC4NCg0K
PiANCj4gLS0NCj4gS2luZCByZWdhcmRzLA0KPiANCj4gU2FrYXJpIEFpbHVzDQo+IA0KDQo=
