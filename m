Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72D5C456192
	for <lists+linux-media@lfdr.de>; Thu, 18 Nov 2021 18:34:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhKRRh3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 18 Nov 2021 12:37:29 -0500
Received: from esa.microchip.iphmx.com ([68.232.154.123]:47236 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbhKRRh2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 18 Nov 2021 12:37:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1637256868; x=1668792868;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=8mjZnOAJrxOvYNhsfW08rX+GYEqJDrlREWTDz8A/d40=;
  b=jWSajhOHfKAdH4kSqP3YacvgdfnHI4XpPUPPIftmFRYOrTobX5OnZ9VX
   Cg0EwrfkkkncR9uXQ9yNcZpCrofwVAf5joJEeFOQohdKomdei9/hFKViK
   q1CMVqDbhPmiNtnqcKowInPJ1unrJLGOLwO15uwNb0Q+r/Klm2Va0VmRG
   r3n28R2Je4Q8KklACX7rUsURintT5vFsDsRYXTWksSFzkyEDhef7Y4NAI
   TdM2whp1RHrjkoIBMPKAQs1FVwxLwBckYyQhgFH5NfxEFkctEptEGmhaK
   m6cTH3FrMfxkIhAlc41yIa8ujSGM2O0235Og0dTAuG2IAq8ztHWa+DFQy
   w==;
IronPort-SDR: CzrwUKI+OKauK971yE0pDKP2BcvjHUMVKUlVhdUtoqWX+EyhWa0rU0BbLd9i8Ccb6h63Pt1Opf
 sY5rh+UoS0YFJZOAW0X7FZs7Yb7YtIXtzphNwefl9AeH5IiUiqqnbThacNszrOnaRbfoSbdQLP
 WcI2nXIZW4AHPTmW63ixoc7UK5SvkX8J6iDQqidDZXeUyCFE7J8vj8eEdk9kaKbp7lmnh7fqFO
 gE+b3PxurpTTap4eLovf4PsBjHTOxQ6+jNSRKEIaIfCEJciF/YdhTEtVzTsCdCxtq1EpLLHv6F
 hy4M9ZAhF6Iux/T7l3OJfHU/
X-IronPort-AV: E=Sophos;i="5.87,245,1631602800"; 
   d="scan'208";a="139607023"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 Nov 2021 10:34:27 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 18 Nov 2021 10:34:27 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.71) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.14 via Frontend
 Transport; Thu, 18 Nov 2021 10:34:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bC0fXIZ8MHJlcK69xrr3fwPsT8za5UQzkPFfveR2jWZsORsPy19Bc6Y9/2tyqScVQ1+E/xfO4O8xcT4Fc3iRNPRxj0uDuVZVWyqFMAJ/AAGgaBML3jBWfh0Du9T6jiRlh9sTT0WRbu1AZWA5lC7uWChez3hQevxYNDU+ZJiiMfF90O4KEqL0UvZVdRGXxlrVQ7ezK2Xsscsh1Pdkuw1Z9LCMCZoweaDzBlYOvnD7Sjg/eXVq6J5jnG+TbrcHDRwxN6QcJJFoT1icsrbE9eYPJr18+65nmO/l/bQXTewRKIGzDouo+iXLxaPKjBNyrCiijR00T7BTcSMfrFZH/l+NJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8mjZnOAJrxOvYNhsfW08rX+GYEqJDrlREWTDz8A/d40=;
 b=gOa2CADhF9rq0mWAxQB4hqdOwlJCdVvarWUQxSCogNJEQXLaO7Avee8iP0RAYx582W+g0TXgxFECX5AoJmvkXZKEUPoPfBrryNBq4Rx38T7/vvxwH8rBvQ5L4kMBL0/ay6x9x+O4vJkYH9x3T31FOhCTIA/ZX9dIlfgRYEXo+wH3cyFrdPsJEHlLTjaESAf18B1fnnw3TsSKkS5rc4CE1Mnrc/EaSScOFmfdVB9wfayH1ZgHhEszJlyaj3d0gqc4KqD4i7mYczROskS5O/MJHgM4mAtXE99tF8P68lmisBlsW7dr0GFSZQSs0UuBBkLzJ40aA0fQ9GsVSoBql+FECQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8mjZnOAJrxOvYNhsfW08rX+GYEqJDrlREWTDz8A/d40=;
 b=Qj1zxWrsw32fWjHKIRDc/sNWKN4GsFv4jaZGVexd43GQouZCSXyPx8H/uxWGlJsqQQsF1fiePxV2jKNx0PNMhdX5dPg5DDUXTXVcHiviq5M4ycMjvzHFzO9l49YOow4WAKojkR5GtEdvIq0VKmP34wvDGD+yVBXlBAZ0hSoR/ow=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN7PR11MB2529.namprd11.prod.outlook.com (2603:10b6:406:b3::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.17; Thu, 18 Nov
 2021 17:34:22 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::5933:9a3c:4793:c21%7]) with mapi id 15.20.4690.027; Thu, 18 Nov 2021
 17:34:22 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <sakari.ailus@linux.intel.com>, <luca@lucaceresoli.net>
CC:     <leonl@leopardimaging.com>, <linux-media@vger.kernel.org>,
        <skomatineni@nvidia.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: i2c: imx274: implement enum_mbus_code
Thread-Topic: [PATCH] media: i2c: imx274: implement enum_mbus_code
Thread-Index: AQHX3JKnMqlExZIWdk+AV93R39BBLKwJhYiAgAAEFgCAAAI6AA==
Date:   Thu, 18 Nov 2021 17:34:22 +0000
Message-ID: <aff9c675-cd7b-ef11-d337-c5c3de9b921a@microchip.com>
References: <20211118154009.307430-1-eugen.hristev@microchip.com>
 <fa26e991-9228-7ed7-833a-b296e6b32afc@lucaceresoli.net>
 <YZaMtGhqaXIOLhox@paasikivi.fi.intel.com>
In-Reply-To: <YZaMtGhqaXIOLhox@paasikivi.fi.intel.com>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2d1e5ea0-3bd7-4293-7e4d-08d9aab9a8b3
x-ms-traffictypediagnostic: BN7PR11MB2529:
x-microsoft-antispam-prvs: <BN7PR11MB2529C6EF29C5CD39BE303846E89B9@BN7PR11MB2529.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: wUmiJudGK4GZt9+m0hEx+7vWyO8LW+S+IrhaWFxocnu5LSotpR1APuIb/RSUVQXMKe00F9kU7yMEjN2vQQNHuTM82xs5OoVdZFU161VwGyg6weZkqm61Lpc1TPIJok4Dj6ExSC8I2be8yjonUXL+XxtGa1Axd43DqumIJIfIsOQjxmg44498+E/qqAtgYfeBJ/gsawDydJWU5LcfbcjFtfG36o7ccURJIKF/oI1JreFC+QfimG5nqdBE3EFDvBS/SGildyUc2GtobjzhYc/Zwzo3FSIY+1xAj1O9suAIWUlhOQkJqJKCiBGrXzowRfwyzQOnnKPHZon9455fATdRoYbqZbq+bMKg8TL8+zONZlOXf8eovuLUVGdJppo+pwcGlfbpVkvc02F98q9zbzLy/nrOuyIDyNTWhfWDhKqbpf6MwipEzIb9HMiilWzQtw1Bh+j3RN3MyED9aYzfZBZ6gFklQZPLta2x8fkZdtQD5Smcgp4JxeQ4It0h1YkSHR5nyzoPtWrpdJAg/UZKNgSW949sCunKDEYL2dLDb7ifeYIYpqs7zjp510g0Fd+i4Yg/z0Fz3mUvJK8b4kTgFLaA8U4DAqBCCTtOw03Yx3w+BIeA8q9+9HRUxuCtgGTP/xNCVlAE3qH52eV8oAbENSCwCu7Z2TarTK46Wnflp8iRB59g9jRP9SnOejAChsfLVodMNbsJnnR4DEQmHWcPZ+wqFKjfR+ZnHnT7HE4SrMABKnxHJVxud8Mefg8WJo4ixdTgPr76W1FUTLZNtSva/KvciQ==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(71200400001)(31696002)(66476007)(186003)(66556008)(76116006)(38100700002)(31686004)(122000001)(5660300002)(66946007)(91956017)(4326008)(6486002)(8676002)(54906003)(64756008)(110136005)(316002)(26005)(38070700005)(66446008)(86362001)(53546011)(508600001)(6512007)(6506007)(36756003)(2906002)(2616005)(8936002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?b3dmVHg2QUo4Vy9FQlJHeFNNSmdhclBpWEhpdEhaemM5ek54ZzVZYkk5Mytr?=
 =?utf-8?B?V1ZrRjFwQUpVYVNYUlMrRFNQdS9vUTJhbVVOWVZaYmhLNWhtRGFaeld5Nk9H?=
 =?utf-8?B?RTRYdW1TL3JacDgwRFpPNkRYUitYOFA4L3dqY0Vra3JKSlJPcE96L0pkR3pu?=
 =?utf-8?B?d0VWWVVQV25JM0dURXEwaVZoelBSRW5OZU1BN0FHQW90aUM1YlZ1M1ZrdXhl?=
 =?utf-8?B?UEFiTUlmSlF3aTZQL0wvMTFFWlBWSllocGpHMEl2UUVhOXhCRUtkY1N6MzU3?=
 =?utf-8?B?SVdSblhNN0U2bUhON2RrWm9hRy9aM1BPa3hMcFFmcDd5NEFheERPVDN6YmRC?=
 =?utf-8?B?TW5QZWwrbDlNMWJIRWxkYzZsb09lYXdXRkRzV0doS2Y5YWdzSlpMYVN0OHR6?=
 =?utf-8?B?OUJ1Zkl5M1BOZFlmbzVnZGd6V0ZpY3pyRXlYbmdJdnliT3lLZ3VpUHhJYmti?=
 =?utf-8?B?Qm5wN25nMG5pWU1nN0drUHYwMGl3NUhBaUZpZ1g5KzBLZ2ZVRmxKTHJHakRm?=
 =?utf-8?B?L2t5NDUzY2szeVlMcVhMcUo4ZXRvK2prUk1SL0dUNm1TMU5peHhoWkViRWti?=
 =?utf-8?B?OFVaRkZuM05MeTFjTXJaRFhSK1N1Zi9idUJiMnViK0oyVnNwekpsWXRMcHdM?=
 =?utf-8?B?VEQ0bllEVWw1cnYwU3lCRzhBVmRHblY3QzVMd0FlVkZRYmlzbXRFb0VoenUy?=
 =?utf-8?B?ZnNOUGlxWXVlblhDb1BIZVZ1eDcrNDJkNy91TEVpMWlqSkN2eUhuZmxVWU5C?=
 =?utf-8?B?S1NGaW4yN2UwUTFBNUtoWmttY25YODBxaitNYTB1NTU4TUZreHNqRW9wTW9l?=
 =?utf-8?B?Zy94cWZSRW9SOWZuQ0I2L29OWEFLM2hjQjJITm94b3dQeTBmV3BjMG0xNkho?=
 =?utf-8?B?UTY3UmZSTlFEWi9FcmJNQVhOTkg3NzBaZStaZ2ErUWxNR2xjcmp5UXdwM29k?=
 =?utf-8?B?V2Rab3BaTXNOVjhzUFhpak9NZzE3QW50djFFUjZiSWI2eFU2eGxEZGJGL0Fa?=
 =?utf-8?B?d0ZXTUlyd0U2aTAzZGlEaDI5Vjhmc1dzYkNzaUtTbkExcHdudUhWN0hGNlFT?=
 =?utf-8?B?c2hmK1MxRm5PWGJnR0haRGNwSGpLRnRQZko4L0pRWkNwc2k3dDNjSENWMVRs?=
 =?utf-8?B?bUFQWFhYME5VdWxkUnFnVjN4ZkxtZTNKeTk1ZCtLYUp0QnQ3ckR3ZU9rcll1?=
 =?utf-8?B?YzIvZ0xnWWtjMFVVSS9EZkZMZWt2TlNtVUhtL2g4bHFyL0ZqQ1RxZm9nYWE3?=
 =?utf-8?B?ZWhUWTdETHl0ZGhwSzhyWVNaSm5OeS9GZG93emVWNS9HR2VaTm1IRGtna0RF?=
 =?utf-8?B?Q3o1eGJ5UGlLSVhaUE1RbFVmOVZWL3lxVHcxeWpESjNZTWtYVm1BYW9DSHFU?=
 =?utf-8?B?aEltUm5ZNUM3QnYzbVZVSnhuaDdtUjROMVk0U3lDZk9DTzZtUHhMUFJpQWhQ?=
 =?utf-8?B?Zk9VMU8wT00rTi9vOXhHc0lzQ2xkZ2tSSEFoZmNNd3ZxbDd2MUUweUJaT1Bq?=
 =?utf-8?B?YmJqZjZ2OTNBSlV5V2hiNTBPQmh6S3lRMGF5cVBRUHZtL1BtZUdOY0RMdW5p?=
 =?utf-8?B?YnZVbHNVaEF0VEpRWEFoNWNialVTODUzQ28xNjJ4MFhQc3I4Y0d5NW0yRGxM?=
 =?utf-8?B?Vm41eUp4d3I4M0YvdzJoTUNWQlM0K3VsTGZBY2ZST245aEVkK25wRStpeS9q?=
 =?utf-8?B?MzM3QUY4SXIzZ3dJNlJRV1VHSkRmellzcUYzRzFreEZVWEI1eG5PbWxzWUlS?=
 =?utf-8?B?SytHcnRadDhOVHU5U2szMVY3M0w0NUpXKzBwdWRMTFlwKzhxN0c0OURxcExF?=
 =?utf-8?B?YU5sOSs1dERlVzN2REdsUVg5OGM1bHBBNU96aloxYVRVeHRlcVVvU0JKcVFa?=
 =?utf-8?B?UnY3V2JmUnpWRVUvNk1jM08xcUJOV21RYkV4K2xTM2d5MDF2UnhoaUQ1Zmpv?=
 =?utf-8?B?WUpzMi9SOW5MZWg0MW40eE5CdFNTVGRpczFYYlpjcDlQeWJHZndmdmgxNVJB?=
 =?utf-8?B?aGZsakJ1Zmsxa2Zpa1o3N0lIYndnNWROS2F2dmRDUXMybjBmc1ZGbHU2VnE5?=
 =?utf-8?B?KzMxRUJ3b2F1Y1EwRTV4Sms1TUlVY2V6c1FmYkdoakw0d0FhTWUxR3JvNzJ4?=
 =?utf-8?B?bDloY1dmQUkzQklwakRqa0poTE1pRWpEaFBCOVlqYW9tbk1uWS9wTEVzdUh4?=
 =?utf-8?B?VktuS25UaTYzWU90NFQvZlRrNzZKTzFyMTNpK2RrYW95ZVBGaE1WUTRnWTJR?=
 =?utf-8?B?bEUweE5VMHR1Y0drNGl6ZDh1SG9BPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <9FED7BF3787E93468CFE091F06A8661B@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d1e5ea0-3bd7-4293-7e4d-08d9aab9a8b3
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2021 17:34:22.3044
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xuIvdv/NJ8fMcepOs5DS6z3EHAqShhT7g76RPamOgkMHhWMFn+2umES93tEiNBEt0wxBnkZve0RquUtzUP88hr3BBiPyPV8pdMTD7IAzFN8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2529
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvMTgvMjEgNzoyNiBQTSwgU2FrYXJpIEFpbHVzIHdyb3RlOg0KPiBIaSBMdWNhLA0KPiAN
Cj4gT24gVGh1LCBOb3YgMTgsIDIwMjEgYXQgMDY6MTE6MzVQTSArMDEwMCwgTHVjYSBDZXJlc29s
aSB3cm90ZToNCj4+IEhpIEV1Z2VuLA0KPj4NCj4+IE9uIDE4LzExLzIxIDE2OjQwLCBFdWdlbiBI
cmlzdGV2IHdyb3RlOg0KPj4+IEN1cnJlbnQgZHJpdmVyIHN1cHBvcnRzIG9ubHkgU1JHR0IgMTAg
Yml0IFJBVyBiYXllciBmb3JtYXQuDQo+Pj4gQWRkIHRoZSBlbnVtX21idXNfY29kZSBpbXBsZW1l
bnRhdGlvbiB0byByZXBvcnQgdGhpcyBmb3JtYXQgc3VwcG9ydGVkLg0KPj4+DQo+Pj4gICAjIHY0
bDItY3RsIC1kIC9kZXYvdjRsLXN1YmRldjMgLS1saXN0LXN1YmRldi1tYnVzLWNvZGVzDQo+Pj4g
aW9jdGw6IFZJRElPQ19TVUJERVZfRU5VTV9NQlVTX0NPREUgKHBhZD0wKQ0KPj4+ICAgICAgICAg
IDB4MzAwZjogTUVESUFfQlVTX0ZNVF9TUkdHQjEwXzFYMTANCj4+PiAgICMNCj4+Pg0KPj4+IFNp
Z25lZC1vZmYtYnk6IEV1Z2VuIEhyaXN0ZXYgPGV1Z2VuLmhyaXN0ZXZAbWljcm9jaGlwLmNvbT4N
Cj4+DQo+PiBHZW5lcmFsbHkgT0ssIGJ1dCBJIGhhdmUgYSBmZXcgbWlub3IgY29tbWVudHMuDQo+
Pg0KPj4+IC0tLQ0KPj4+ICAgZHJpdmVycy9tZWRpYS9pMmMvaW14Mjc0LmMgfCAxNCArKysrKysr
KysrKysrKw0KPj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykNCj4+Pg0KPj4+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2kyYy9pbXgyNzQuYyBiL2RyaXZlcnMvbWVkaWEv
aTJjL2lteDI3NC5jDQo+Pj4gaW5kZXggMmU4MDRlM2I3MGM0Li4yNWE0ZWY4ZjYxODcgMTAwNjQ0
DQo+Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS9pMmMvaW14Mjc0LmMNCj4+PiArKysgYi9kcml2ZXJz
L21lZGlhL2kyYy9pbXgyNzQuYw0KPj4+IEBAIC0xOTA5LDcgKzE5MDksMjEgQEAgc3RhdGljIGlu
dCBpbXgyNzRfc2V0X2ZyYW1lX2ludGVydmFsKHN0cnVjdCBzdGlteDI3NCAqcHJpdiwNCj4+PiAg
ICAgIHJldHVybiBlcnI7DQo+Pj4gICB9DQo+Pj4NCj4+PiArc3RhdGljIGludCBpbXgyNzRfZW51
bV9tYnVzX2NvZGUoc3RydWN0IHY0bDJfc3ViZGV2ICpzZCwNCj4+PiArICAgICAgICAgICAgICAg
ICAgICAgICAgICAgIHN0cnVjdCB2NGwyX3N1YmRldl9zdGF0ZSAqc2Rfc3RhdGUsDQo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgdjRsMl9zdWJkZXZfbWJ1c19jb2RlX2Vu
dW0gKmNvZGUpDQo+Pj4gK3sNCj4+PiArICAgaWYgKGNvZGUtPmluZGV4ID4gMCkNCj4+PiArICAg
ICAgICAgICByZXR1cm4gLUVJTlZBTDsNCj4+DQo+PiBNYW55IGRyaXZlciBkbyBjaGVjayBjb2Rl
LT5wYWQgdG9vLCBzbyB5b3UgbWlnaHQgd2FudCB0byBkbw0KPj4NCj4+ICAgICAgICBpZiAoY29k
ZS0+cGFkID4gMCB8fCBjb2RlLT5pbmRleCA+IDApDQo+PiAgICAgICAgICAgICAgICByZXR1cm4g
LUVJTlZBTDsNCj4gDQo+IFRoZSBjYWxsZXIgd2lsbCBoYXZlIGNoZWNrZWQgdGhlIHBhZCBleGlz
dHMsIGFuZCB0aGVyZSdzIGEgc2luZ2xlIG9uZSBvbg0KPiB0aGUgc3ViZGV2IEkgc3VwcG9zZS4N
Cj4gDQo+Pg0KPj4gSG93ZXZlciBJIGRvbid0IHRoaW5rIGl0IGlzIHN0cmljdGx5IG5lY2Vzc2Fy
eSwgdGh1cw0KPj4NCj4+PiArDQo+Pj4gKyAgIC8qIG9ubHkgc3VwcG9ydGVkIGZvcm1hdCBpbiB0
aGUgZHJpdmVyIGlzIFJhdyAxMCBiaXRzIFNSR0dCICovDQo+Pj4gKyAgIGNvZGUtPmNvZGUgPSBN
RURJQV9CVVNfRk1UX1NSR0dCMTBfMVgxMDsNCj4+DQo+PiBNYXliZSBiZXR0ZXI6DQo+Pg0KPj4g
ICAgY29kZS0+Y29kZSA9ICB0b19pbXgyNzQoc2QpLT5mb3JtYXQuY29kZQ0KPiANCj4gR29vZCBp
ZGVhLg0KDQpIaSwNCg0KSW5pdGlhbGx5IEkgdGhvdWdodCBhYm91dCB0aGlzLCBidXQgbXkgaWRl
YSB3YXMgdG8ga2VlcCBpdCBzaW1wbGUuDQpJZiB3ZSByZXR1cm4gZm9ybWF0LmNvZGUsIHdlIGFy
ZSBub3QgZW51bWVyYXRpbmcgYW55dGhpbmcsIGp1c3QgDQpyZXR1cm5pbmcgdGhlIGN1cnJlbnQg
Zm9ybWF0IGFuZCB0aGF0J3MgaXQuDQoNCklmIHdlIHdhbnQgdG8gYmUgY29ycmVjdCwgSSB3b3Vs
ZCByYXRoZXIgYWRkIGEgc3RydWN0IHdpdGggc3VwcG9ydGVkIA0KZm9ybWF0cyhjdXJyZW50bHkg
anVzdCBvbmUgKSBhbmQgaXRlcmF0ZSB0aHJvdWdoIHRoaXMgc3RydWN0dXJlLg0KDQpJZiBpbiB0
aGUgZnV0dXJlIHdlIHdhbnQgdG8gc3VwcG9ydCBtb3JlIGZvcm1hdHMgKEkgc2VlIHRoaXMgc2Vu
c29yIA0KY291bGQgc3VwcG9ydCBTUkdHQiAxMiBiaXRzICksIHRoZW4gaXQgd291bGQgc3VwcG9y
dCAyIGZvcm1hdHMsIGFuZCANCnJldHVybmluZyBwcml2LT5mb3JtYXQuY29kZSB3b3VsZCBiZSBp
bmNvcnJlY3QgaGVyZSAoaXQgd291bGQgYmUgY29ycmVjdCANCmZvciBhIGdfZm10IG9ubHkgKQ0K
DQpTbywgaG93IGRvIHlvdSB0aGluayBJIHNob3VsZCBwcm9jZWVkID8NCjEvIENyZWF0ZSBhIHN0
cnVjdCB3aXRoIGEgc2luZ2xlIGVsZW1lbnQgYW5kIGl0ZXJhdGUgdGhyb3VnaCBpdA0KMi8gTGVh
dmUgaXQgbGlrZSB0aGlzIGFuZCBhbHdheXMgcmV0dXJuIFNSR0dCMTANCjMvIERvIGxpa2UgTHVj
YSBzdWdnZXN0cyBhbmQgcmV0dXJuIGZvcm1hdC5jb2RlICh3aGljaCBJIGFtIHBlcnNvbmFsbHkg
DQphZ2FpbnN0ICkNCg0KVGhhbmtzIGZvciByZXZpZXdpbmcgIQ0KDQpFdWdlbg0KDQo+IA0KPj4N
Cj4+IGp1c3QgYXMgYSBsaXR0bGUgZ3VhcmQgZm9yIGZ1dHVyZSBmb3JtYXQgY2hhbmdlcy4NCj4+
DQo+PiBXaXRoIG9yIHdpdGhvdXQgdGhlc2UgSSdtIE9LIGFueXdheSB3aXRoIHRoZSBwYXRjaCwg
c286DQo+Pg0KPj4gUmV2aWV3ZWQtYnk6IEx1Y2EgQ2VyZXNvbGkgPGx1Y2FAbHVjYWNlcmVzb2xp
Lm5ldD4NCj4+DQo+PiAtLQ0KPj4gTHVjYQ0KPiANCj4gLS0NCj4gU2FrYXJpIEFpbHVzDQo+IA0K
DQo=
