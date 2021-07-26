Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E073D5474
	for <lists+linux-media@lfdr.de>; Mon, 26 Jul 2021 09:40:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232734AbhGZG6J (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 26 Jul 2021 02:58:09 -0400
Received: from esa.microchip.iphmx.com ([68.232.153.233]:16176 "EHLO
        esa.microchip.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232655AbhGZG56 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 26 Jul 2021 02:57:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1627285108; x=1658821108;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=4Bodd07MiEkAzDttA+kkv01axwuR9NZMjelNy7ljdP4=;
  b=KGHcv8OIMBChlDMuV64pQGxltrKm03Lzum49NstJ93Zo5Xx/EWU5iToL
   lOMnteXN1bowEI342LRwQv1Wn/NGQk8ZXlhynLySR+X9LkoEVHkTEAxBe
   gdk1BwBwyxgdlWbG0C5svsUeVyZ6xkuPLiUOrT+SptqdIWbD0Gd0D9+5e
   4VloeOKNXFVuXWbq/+027ssMXP6Gn3ek7jwQink21mqw6sRa2B/DzjyaQ
   Pg8Lt64rqNukd1/Ox7gnmwTiYm6J/YlA86QQmRvuTK7KOOjc/FHfoAC70
   gp3UMmK8vfWiVkprTyjGreRslCdJXN1Wo7F8Qsg25Cg6fmIw6iWCSeuXy
   w==;
IronPort-SDR: 8tbrH6gWpPTw6TXGOpKSxUXU3/97uUg51HxOuaVSW1TcyIc2VHuvVVemhGqyBZU7IPgcnLY+oC
 d33DY1mS5F1dPRv0Ejf1fclgWo54PMKHyMhacg6NCW0yFcv4ZrNa9MAL2yLFV+/hfzHin6XWWV
 qOzHg50y6RSaMiDRsWEYwJKMVwRBBp6dDFH222urixEjeKZ4pkj/I30a9ydsKmMZszy5aJh7lG
 kdxJe4bNUoGNxUssf0SfGch6HyYP1N58Ry+AMAOCq3/A2cZP31yAfWVjRiUgpb73l5MWLyFUhl
 CF7oP6jQCWy0k0mNCJpvIags
X-IronPort-AV: E=Sophos;i="5.84,270,1620716400"; 
   d="scan'208";a="137496397"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Jul 2021 00:38:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 26 Jul 2021 00:38:20 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2
 via Frontend Transport; Mon, 26 Jul 2021 00:38:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LrWiX0RxsOdiFpNJmGJ7PTmD3Oa53CwxOWsvRDIPB4jyMlB2Zso2F35A48ftgdoff1hVWl5CKebtyCJ7scmYFvnPOIQ/sfAsLr10QeT4NDhQkYzw2rNDo2tQxaq7XfOE5fypMSATMuPo87PAQRsYYQZjNgXaC7T+JX6RzeuM0darFQgAyWCpVlVzJLxM1fXjMdlyDBcR/TkC0fWRD+VWX6yv62p+WXlgg4aUpafi5bnIg16YpDZBN7Pij2LZF2jMIzviZYc1A+ts0PORFuX1pJST6lBckZldy8xE4HipuEDx3Iwj90EBywxMR6IUBU9DAQiF0UyDmd0vBTl2OQ2R/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bodd07MiEkAzDttA+kkv01axwuR9NZMjelNy7ljdP4=;
 b=YRPUFV0oxpr6BasKKlXDZ/UqL8u+bkIlq6BjRS1v0jkkdmZLTpxdP/hS2bNnYDvuFa7GwYXG53KlWJus97VWlcbYw9DoGWw3X8vplVfer0eYm9EmD0NlKBz1nK7I+Ch+Zz6GAWl4MFObkl2czwbfE2puQFndtPmQDpVt3gqinlD+LiZNFrA1rhw5gLi2i2KnFJ3RuMfiogsAXaSWbj336Vw0XjiFRgZfnGciVdxex5GcM9ZtXl/cO4ymFjhq5+e60pNYAPYk5r0t1EHC1rKjkOAomLF7ZZbAXq3X/BnOEKdQysnZryylsaW3yOs0j6mqha0f1ocHH47ShOp1OM0sFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4Bodd07MiEkAzDttA+kkv01axwuR9NZMjelNy7ljdP4=;
 b=YOzEB4iJIVVlSOFBsdRVjhq/Ke3YctXr0KcDjn5g6KfTXeHdMh65rkSa0sgnzXtnolE/6YsEfhc0e7C+tn4K22b0xhaG6fmCUVmCoB9tnPR8r6/VTOmE0QA4/rsL6EbCDyqOGr5zXHAghc+7gWZ6UEuyHGaCy/kn5Zw6KlRCJ4o=
Received: from BN9PR11MB5514.namprd11.prod.outlook.com (2603:10b6:408:103::7)
 by BN7PR11MB2676.namprd11.prod.outlook.com (2603:10b6:406:ac::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.24; Mon, 26 Jul
 2021 07:38:16 +0000
Received: from BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12]) by BN9PR11MB5514.namprd11.prod.outlook.com
 ([fe80::6870:66e9:7cd2:ab12%9]) with mapi id 15.20.4352.031; Mon, 26 Jul 2021
 07:38:16 +0000
From:   <Eugen.Hristev@microchip.com>
To:     <rdunlap@infradead.org>, <sfr@canb.auug.org.au>,
        <linux-next@vger.kernel.org>
CC:     <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>
Subject: Re: linux-next: Tree for Jul 9
 (drivers/media/platform/atmel/atmel-isc-base.o)
Thread-Topic: linux-next: Tree for Jul 9
 (drivers/media/platform/atmel/atmel-isc-base.o)
Thread-Index: AQHXdP4aeLlr+HqyVUux7VcVYizkN6tU+HWA
Date:   Mon, 26 Jul 2021 07:38:16 +0000
Message-ID: <a5618cc3-fe19-4261-de05-6280c141ecd7@microchip.com>
References: <20210709132450.7aac126f@canb.auug.org.au>
 <955c978d-842b-c5fd-6c1b-7e403ba6fe75@infradead.org>
In-Reply-To: <955c978d-842b-c5fd-6c1b-7e403ba6fe75@infradead.org>
Accept-Language: en-US, ro-RO
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
authentication-results: infradead.org; dkim=none (message not signed)
 header.d=none;infradead.org; dmarc=none action=none
 header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 618a7f06-2d8b-4e30-bf91-08d9500854dd
x-ms-traffictypediagnostic: BN7PR11MB2676:
x-microsoft-antispam-prvs: <BN7PR11MB2676779EE8E4780BBF3FBC05E8E89@BN7PR11MB2676.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vU2S54Zk9G5xluv9bp8l5nuU+7bKWBkcho3d386/Asb1xj/ZFymzE5VXykh9NLxT3/obvaQ5F8N/BKLde4WVSC57KfVINovW5FLxUupQspGV/pWoGfGPjyKlLLVlwzmj6KWKh39/ZmpBU6XEPpzqiEbrU3oXLSMr32gTiU5pLtgNzA2z8P8T2blzEOYkIVVKSJJG4/FqXyCa+ZRh5O7Vdahf2ySkNaTQZ38q/GcKldchb1MXaPqN2N8Zx+aTvBpGFu9/E905rYqfsRapEIX1aeKyNN76VjKS4NMX6hjFSbm9+1XZ3HbYQn4qJR41CIeL6zapZKkRqg1yobIsCuVRr1mTNakvManlFI5AQdkc2KAzkiCVuHLBz7O+c9idc5w/3gTRZt73kvvzqiyO1/Nl0ANnf/NY9sU+c0IebSVU7dqjAsBJ1GyY7MmmeKS/QV6tjCARbRl6nB8OAXOjU3JL0+J0P5Kdybi5ecO1sq0SzFtZWvgSTb0ZsjdXWlG4Ax1m7Hi4JRHvvwWWb8+CrH6X+0c7rx32q2Se94JF807klt2OAS47M26VUHtYUacsaosU3kQrZnhWFk6sBVAmmmiYhrlSLYD95ZCgR3yf1F8u5y6+/jcmj5lR+3zDQDDk2bY+1YkXh9HP0ESEJ6D5kzQBqg2bDu0oxfIwbc7Pk0FhNxi0bZeVVxuRc9s+XHZEF/8zd+6scQWRTutObENzJxD35MBi5cIARu+tM+h1ZdUTef0y3iFA1DKI7JYyv7ktzJEwcRnUzwNbQkQsraZgWwhVQwPONMQXtocGkS/Wg7siKuhAV7+W9yh22Cmo3sHAbsXl03QZc3dFt9b9zES+YI2MZeHtvrHIsTpBcAETKoWeAolwjEDlB2XHywFV8/rHUMcybuztYxuxIh7IRkiaNZnHug==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR11MB5514.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(396003)(376002)(366004)(136003)(346002)(39860400002)(4326008)(110136005)(54906003)(31696002)(316002)(31686004)(36756003)(53546011)(478600001)(38100700002)(5660300002)(6512007)(76116006)(8676002)(26005)(6486002)(6506007)(66946007)(66556008)(8936002)(186003)(122000001)(86362001)(64756008)(66446008)(71200400001)(2906002)(66476007)(91956017)(2616005)(966005)(43740500002)(38070700004)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnpDRHh3WWV0OHVRVTZoS1lNQy9IcElYQ3ZZaXV0eVhrOVppRHJ1cjRhZHhI?=
 =?utf-8?B?azNyVTAwKzlkOXEza2tvQmUvZmdUUkNwVjNMQ0NSd1pOSE92NmZ5YStKZFRO?=
 =?utf-8?B?WlRuSzVKMThQY0h6c1I5SjlqM1g4Y285VGNuUWJNU1ltMWRSYldMVXFHTU9u?=
 =?utf-8?B?RzZ0STYxODJsVGpBYkFkUk12OGd4K0JLUW4yR0V4VVRVL0ZnSFVvb2x6MDhX?=
 =?utf-8?B?U04xUVNMMTB4RmhjOTgwVUtBZUhiUWUwMEtDeFJkMXZUY2MvQ2g1dzJPaStZ?=
 =?utf-8?B?NnRlbWVHZk1Tbk1NbVgyaEVwSlRMSXFTdFdCUVVrNGlNWGdnVXE4VHpxaHRr?=
 =?utf-8?B?S1VpMFNIQWxTUE1XbUZ1UmxuZjdhLy9IYXltTHpiR3dnMkVJYUNwekFSSTZo?=
 =?utf-8?B?Vk1TT01IdlpsME85RWFTdTRUV3Zrc0xQM3FsRnBnMjQ3Y2phSGxhWXgvaEkz?=
 =?utf-8?B?NFVHV29YOFlENkhjTGxQeERUa3FKRkRBZVplUm1lbjYzNnIxa0xTOGh3a042?=
 =?utf-8?B?TWYyaVFCTFR0OGxlV09Qcm8rMU9vaXc3R0tZc1VDNzQ1Rzl4bWg5a1BkUTVI?=
 =?utf-8?B?Z01XVlRVYVIzcnRhZ3kxYWR5WXgyZWlLWGRzYnZlK2hhbStmelBFTkE5cUxh?=
 =?utf-8?B?T1JPOUgvenBuY0c3SnFORkhML1BzRmpLeDA1NWU3ZHptK3ltWi9jRkdrYWhW?=
 =?utf-8?B?MXdrV29WN3R4WEUydExTWDVHS2ZtQ0RXN3FDcHdDTm1vcUMvNVh5alMrN0NF?=
 =?utf-8?B?VlpxU0E5OVlveEFmWkVwdmlOUUpSWGpseEdvQklkMHVNZnU1QktnZUkzMDVn?=
 =?utf-8?B?TVZCenlUOHhBc0dBeVJMQytId1dtMG0xbWl0RFBJNnFFMG52citWZTU3eHpu?=
 =?utf-8?B?VmY1YitDOXJpM1k2S3hFN3prWTZ0WEtxNDJCWk1ySUJUd3FNTVlzZXpGcUJo?=
 =?utf-8?B?ejB5WWJGVXV4VmNpOXJjVFhIRFNCdzc5ZkVhc3gvL1pTbE96ZXNOcW92YmZ2?=
 =?utf-8?B?am5KNklwOFdhMDc1MGwyUmdibm8xUVBmMXBQd3IvQndOWU5vclN2Vm12MVU4?=
 =?utf-8?B?ZUdRaEdjUDZFOWxOS2kyR29FK0xJTUltQVpGTTIxNGpacnBHbmhTdnMzNTh5?=
 =?utf-8?B?YmMrL2cvNHFrZ0hDdlhnTG9CZGNvQU1ZbTQ5RjFYYmhVajliNzBpWDJncXQ2?=
 =?utf-8?B?SHJ4RXJVcWxheHVFTEhnVHVGYXpzaVVMZnRYUmxla0NiOHJ2dlpNWWRJTkh2?=
 =?utf-8?B?WjJzWENCeWlaaFBXOXUybUtEOHQxZCtjNmtYcG8xVlplSlVWbXE1OHNRcHZE?=
 =?utf-8?B?VlF6MXN0WVlUTVVSeUZVZi9pRHA2aFJSazNuSGJsM0VmQmxtNzhrOEZjMTlY?=
 =?utf-8?B?UnU5ZCtBVUpCL0ZzQ0NZR29BT3RBbmhBd21VWjVsK2I4R3pDanFNcDFKTTR4?=
 =?utf-8?B?bmFoanBPTmZQVEpzVzVLcEJOVDdCM1pxYmEvbURmYkRRYlNCRkRUK1d0MFRk?=
 =?utf-8?B?S1lLbnBMYXEvMWxSNWRsYm5hYUFUSC9TNUNlLzVreGFBekRRb1EwdFloRFBt?=
 =?utf-8?B?WWhVNnpwcWppUGtJejhtN3BCOTEvWkNTamxwQ2U2SzlJVnFzQTlBcStxRE0w?=
 =?utf-8?B?TWxJckFKNmRkSEtNdE9hNExDZ0dod1EydDUrTTBjODN2VXdPQjArVGJnNTNV?=
 =?utf-8?B?RTlrcXkvYkl0ek5mbUt4ZTZyd2t5bFZTMmJqaDUyZVRkYU5jM0VjWWVvS0xB?=
 =?utf-8?Q?pVOh9XRLLG0yRFUgrA=3D?=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <C14AFA556C8BC74BA56F02C08BB80376@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5514.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 618a7f06-2d8b-4e30-bf91-08d9500854dd
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2021 07:38:16.1901
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: BSp5AAkUR7vtOH/Wmhz+dk9h3fpn9lGGe/sYcBu3lXl4omtkShX3I9k55ADyjTom9PqgnztgyHN3sJLbX1pD9Nq0hoaBnSm6Puis37bzmxQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR11MB2676
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gNy85LzIxIDExOjA3IFBNLCBSYW5keSBEdW5sYXAgd3JvdGU6DQo+IE9uIDcvOC8yMSA4OjI0
IFBNLCBTdGVwaGVuIFJvdGh3ZWxsIHdyb3RlOg0KPj4gSGkgYWxsLA0KPj4NCj4+IFBsZWFzZSBk
byBub3QgYWRkIGFueSB2NS4xNSByZWxhdGVkIG1hdGVyaWFsIHRvIHlvdXIgbGludXgtbmV4dCBp
bmNsdWRlZA0KPj4gYnJhbmNoZXMgdW50aWwgYWZ0ZXIgdjUuMTQtcmMxIGhhcyBiZWVuIHJlbGVh
c2VkLg0KPj4NCj4+IENoYW5nZXMgc2luY2UgMjAyMTA3MDg6DQo+Pg0KPiANCj4gb24geDg2XzY0
Og0KPiANCj4gbGQ6IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXRtZWwvYXRtZWwtaXNjLWJhc2Uu
bzogaW4gZnVuY3Rpb24gYGlzY19hc3luY19jb21wbGV0ZSc6DQo+IGF0bWVsLWlzYy1iYXNlLmM6
KC50ZXh0KzB4MjExNyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fdGhpc19tb2R1bGUnDQo+
IGxkOiBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLm86KC5yb2Rh
dGErMHg3NjApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBfX3RoaXNfbW9kdWxlJw0KPiBsZDog
ZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hdG1lbC9hdG1lbC1pc2MtYmFzZS5vOihfX3BhcmFtKzB4
OCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fdGhpc19tb2R1bGUnDQo+IGxkOiBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2F0bWVsL2F0bWVsLWlzYy1iYXNlLm86KF9fcGFyYW0rMHgzMCk6IHVu
ZGVmaW5lZCByZWZlcmVuY2UgdG8gYF9fdGhpc19tb2R1bGUnDQo+IA0KPiANCj4gRnVsbCByYW5k
Y29uZmlnIGZpbGUgaXMgYXR0YWNoZWQuDQo+IA0KPiANCj4gLS0NCj4gflJhbmR5DQo+IFJlcG9y
dGVkLWJ5OiBSYW5keSBEdW5sYXAgPHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4NCj4gDQoNCkhpLA0K
DQpTb3JyeSBmb3IgdGhlIGxhdGUgcmVwbHksDQoNClRoaXMgd2FzIHJlcG9ydGVkIHNvbWUgdGlt
ZSBhZ28gYW5kIHBhdGNoIHdhcyBzZW50IG9uIG11bHRpcGxlIG1haWxpbmcgDQpsaXN0cyA6DQoN
ClBhdGNoIHByb3Bvc2VkIGZvciBmaXggOg0KDQpodHRwczovL2xvcmUua2VybmVsLm9yZy9saW51
eC1hcm0ta2VybmVsLzIwMjEwNzA1MTI1NzA4LjEyMTkwMi0xLWV1Z2VuLmhyaXN0ZXZAbWljcm9j
aGlwLmNvbS8NCg0KSW5pdGlhbCByZXBvcnQ6DQoNCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xp
bnV4LW1lZGlhLzIwMjEwNjMwMTUzMS4yQmFZeVpVSS1sa3BAaW50ZWwuY29tLw0KDQpFdWdlbg0K
