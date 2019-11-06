Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC147F17BF
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 14:56:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731847AbfKFN4y (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 08:56:54 -0500
Received: from rcdn-iport-3.cisco.com ([173.37.86.74]:58631 "EHLO
        rcdn-iport-3.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731661AbfKFN4x (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 08:56:53 -0500
X-Greylist: delayed 426 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 08:56:52 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=4870; q=dns/txt; s=iport;
  t=1573048612; x=1574258212;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=svN6cFwx804hBErcQBK4s2MIwLiLUcsoWgbTbckAcGA=;
  b=SDslD5qI6JcYh5DvM7biMd2Zn/ju+xqsnySpPf+755jgi80cfPOTHDwg
   /Iie3RoDWouERMP+jnlDVHhv1Yn2rtfXokNpassxxSHaCaU1fnC9iCam/
   4XyyMpYi2Hhh9WQRgvGpBeO3MgQvJTPf5bfa/DP806VMT+bSXujAVbYIl
   c=;
IronPort-PHdr: =?us-ascii?q?9a23=3AAYeG5ROs7inDE1SbYHMl6mtXPHoupqn0MwgJ65?=
 =?us-ascii?q?Eul7NJdOG58o//OFDEu6w/l0fHCIPc7f8My/HbtaztQyQh2d6AqzhDFf4ETB?=
 =?us-ascii?q?oZkYMTlg0kDtSCDBj7JfjxcSEgH+xJVURu+DewNk0GUMs=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0ATAQDszsJd/5JdJa1lGQEBAQEBAQE?=
 =?us-ascii?q?BAQEBAQEBAQEBEQEBAQEBAQEBAQEBgX6BS1AFbFggBAsqCoQfg0YDin5OgWs?=
 =?us-ascii?q?ll36CUgNUCQEBAQwBARgLCgIBAYRAAheDdyQ4EwIDCwEBBAEBAQIBBQRthTc?=
 =?us-ascii?q?MhVEBAQEBAwEREQQNDAEBNwEPAgEIFQMCAiYCAgImChUQAgQBDAEFAgEBHoM?=
 =?us-ascii?q?AAYJGAy4BDqYeAoE4iGB1fzOCfgEBBYUHGIIXAwaBDiiMFBiBQD+BOAyCXz6?=
 =?us-ascii?q?CYgOBd4J5gl6Me1aBfTedfwqCJJAKhSwGG4I8lzCOQ4FAmCQCBAIEBQIOAQE?=
 =?us-ascii?q?FgWkigVhwFYMnUBEUgwYMFxWDO4RZhXp0AYEnj1MBgQ4BAQ?=
X-IronPort-AV: E=Sophos;i="5.68,274,1569283200"; 
   d="scan'208";a="646478144"
Received: from rcdn-core-10.cisco.com ([173.37.93.146])
  by rcdn-iport-3.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Nov 2019 13:49:45 +0000
Received: from XCH-RCD-014.cisco.com (xch-rcd-014.cisco.com [173.37.102.24])
        by rcdn-core-10.cisco.com (8.15.2/8.15.2) with ESMTPS id xA6DnjtG031290
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Wed, 6 Nov 2019 13:49:46 GMT
Received: from xhs-rcd-002.cisco.com (173.37.227.247) by XCH-RCD-014.cisco.com
 (173.37.102.24) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 07:49:45 -0600
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-rcd-002.cisco.com
 (173.37.227.247) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 07:49:44 -0600
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 6 Nov 2019 08:49:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BiFjiJPL2cJIdiI2RQGQ+ref+JilTXxsbs5PgJ8fRSyDaoxieUzQJ8buERqSiO1VUmpBkS3Q7HuHwE4wmS6T3sXuB5v2t+/aVNU+SK4Kr2dmr4Fo4vZTBUvav+s3j3i9tZzraGWaeFgkFWjy3IOP75HewW1x7NiLag2BVY8hOZGea0Iu/84sy40uAMhv/LRFm5RYb4GTSE1RCE/oYsqaRL7tumHs7vPi9LybXluEUFwpL3TNhSqk/xPMDIq0r1dOt9iwTDXEK0rhR2iInRZtVBjwJ7jY9gE3Tp/TM2l0d3z8oshp8dzUQLXdpxe/ltC56g6b+0IyKxCftDYVGsgAgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svN6cFwx804hBErcQBK4s2MIwLiLUcsoWgbTbckAcGA=;
 b=ZGMvZM5nNK+pL8gJNivYZUWnIw5c7k8B6GOFcvGW0B33/p70HIwTgUCa2VVXoaG+OcZs9Lx0jG6DgrN/738kgMOW7Q1VpgCFFJGj25N0y4O/H/ODNLzgqeaDDlv+Y+x6KyHYVv8Kk7Q2dp/Svzh9jGDW1X58kJrBHjXsrUoj7DU8h5CbfJhH/Hn6Z4IpGN5UHjL3N51bX22ZDGplI66YQPmAXgw1C7Cm7APdQjX9pgQDheZePGzwnoeLJgtT/4waSZ1BVjRREAyK2la4gKpCr3K44pup5/rLVXnJLpXb8q9j6LysZC16130WA5zeDqpSf8D7ekWiOF5z9gxcuUBuFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=svN6cFwx804hBErcQBK4s2MIwLiLUcsoWgbTbckAcGA=;
 b=CB88RV7lolJ13cWr5/PniYP0hVCMq5xH9xuiFrOl4s+GXN+xf/PWh0X0qF6hqLq+OKRoCMntGMlSrRH0PUZLsH68MwGEXLs8D//UloloBDGoGMlE1U/0nwvrpc13J8Stm2ziAdvqWYR+rCgai3MfiS4Djgqu4JRiYih57Nn6yGA=
Received: from MWHPR11MB0062.namprd11.prod.outlook.com (10.164.204.34) by
 MWHPR11MB1376.namprd11.prod.outlook.com (10.169.230.140) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 13:49:42 +0000
Received: from MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::915:6397:4683:34e0]) by MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::915:6397:4683:34e0%3]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 13:49:42 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>,
        Helen Koike <helen.koike@collabora.com>,
        "linux-rockchip@lists.infradead.org" 
        <linux-rockchip@lists.infradead.org>
CC:     "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "eddie.cai.linux@gmail.com" <eddie.cai.linux@gmail.com>,
        "mchehab@kernel.org" <mchehab@kernel.org>,
        "heiko@sntech.de" <heiko@sntech.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "jeffy.chen@rock-chips.com" <jeffy.chen@rock-chips.com>,
        "zyc@rock-chips.com" <zyc@rock-chips.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "tfiga@chromium.org" <tfiga@chromium.org>,
        "hans.verkuil@cisco.com" <hans.verkuil@cisco.com>,
        "laurent.pinchart@ideasonboard.com" 
        <laurent.pinchart@ideasonboard.com>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "kernel@collabora.com" <kernel@collabora.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "zhengsq@rock-chips.com" <zhengsq@rock-chips.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>
Subject: Re: [PATCH v9 1/4] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
Thread-Topic: [PATCH v9 1/4] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
Thread-Index: AQHVlJoMoe3KhuzWQE6zp8GXlxAXY6d+EJqAgAACQYCAABShgIAAAWOA
Date:   Wed, 6 Nov 2019 13:49:42 +0000
Message-ID: <91be7929-7130-1d52-7058-bbfa84cde90b@cisco.com>
References: <20191106120132.6876-1-helen.koike@collabora.com>
 <20191106120132.6876-2-helen.koike@collabora.com>
 <9102bcf8-0279-7972-daff-b15aaf98804d@cisco.com>
 <28cff7ab-ef56-791e-0342-571f64cb9807@collabora.com>
 <b1a8fa60a3c8922c364a18b0583dab55660f2fb4.camel@collabora.com>
In-Reply-To: <b1a8fa60a3c8922c364a18b0583dab55660f2fb4.camel@collabora.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=hansverk@cisco.com; 
x-originating-ip: [173.38.220.39]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 3de01ee9-bd96-4a3a-4e97-08d762c02d27
x-ms-traffictypediagnostic: MWHPR11MB1376:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB1376CFF73B90B87BB30F33EBDE790@MWHPR11MB1376.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(346002)(396003)(39860400002)(366004)(376002)(136003)(189003)(199004)(66066001)(71200400001)(58126008)(71190400001)(316002)(65956001)(65806001)(3846002)(305945005)(36756003)(54906003)(91956017)(66946007)(66556008)(64756008)(6116002)(66476007)(6486002)(76116006)(14454004)(478600001)(7736002)(99286004)(6436002)(66446008)(966005)(2501003)(7416002)(486006)(476003)(110136005)(25786009)(8676002)(229853002)(186003)(26005)(14444005)(5660300002)(256004)(2906002)(6306002)(81166006)(11346002)(81156014)(31696002)(86362001)(8936002)(446003)(4326008)(53546011)(6506007)(6512007)(2616005)(31686004)(6246003)(102836004)(76176011);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB1376;H:MWHPR11MB0062.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: bYfYlrcmu0sYA/P9pi4vHW63WKGRMoxb8ErDzvhx5QXGrziT1wEym3wckNBiRqorWy7oYx4n7in9tBqnAtw9YksuYedIqBohDyySZ0jI+MiW6zjD/wTQd90Oueu6OnWx1MxinAtAtbQ7HVLPrVHArcfLdxG9Swpx/LIUD1oD37bCsURIIZCzdTDdTFzXC4b9KkU6U0CXRtFep8za/Xzj7rqSohQTnwVwylOqRdQ4ndJ63iyXBZzW4Gw7/tEZegBAhjFA+25iX1aFUgjhkDtavhjqpu03t8ctcQ8x69f8HKyRiBe4xUZo/Z8BH9KbBwAB9oC2emAPVDuooRTCTKjDy+7ew7/tm9XsL4u18a91mi7K02PNMPveD3wU5evdQh8iIwztjgQjEMILQoTfBGUE4KF/T2NODqbehFiTzZWmpqGorMU0f+WVGyVKIovcz2kynCFVAmcHAj6A/rcGT4hY+eaem9JE0DNuUufWWo7KJLM=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1CD43328575457449B5419540669A812@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 3de01ee9-bd96-4a3a-4e97-08d762c02d27
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 13:49:42.5129
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aDq6W9aJzvKvxf95AXQVSbkfjYZAyLLdVFNrz+pYObxYiCKFrvqcCt0/LKCi4wEKMAUVq7IcaV8mMFBg73glUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1376
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.24, xch-rcd-014.cisco.com
X-Outbound-Node: rcdn-core-10.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvNi8xOSAyOjQ0IFBNLCBFemVxdWllbCBHYXJjaWEgd3JvdGU6DQo+IEhpIEhhbnMsIEhl
bGVuOg0KPiANCj4gT24gV2VkLCAyMDE5LTExLTA2IGF0IDA5OjMwIC0wMzAwLCBIZWxlbiBLb2lr
ZSB3cm90ZToNCj4+DQo+PiBPbiAxMS82LzE5IDEwOjIyIEFNLCBIYW5zIFZlcmt1aWwgKGhhbnN2
ZXJrKSB3cm90ZToNCj4+PiBPbiAxMS82LzE5IDE6MDEgUE0sIEhlbGVuIEtvaWtlIHdyb3RlOg0K
Pj4+PiBGcm9tOiBTaHVucWlhbiBaaGVuZyA8emhlbmdzcUByb2NrLWNoaXBzLmNvbT4NCj4+Pj4N
Cj4+Pj4gQWRkIHRoZSBSb2NrY2hpcCBJU1AxIHNwZWNpZmljIHByb2Nlc3NpbmcgcGFyYW1ldGVy
IGZvcm1hdA0KPj4+PiBWNEwyX01FVEFfRk1UX1JLX0lTUDFfUEFSQU1TIGFuZCBtZXRhZGF0YSBm
b3JtYXQNCj4+Pj4gVjRMMl9NRVRBX0ZNVF9SS19JU1AxX1NUQVRfM0EgZm9yIDNBLg0KPj4+Pg0K
Pj4+PiBTaWduZWQtb2ZmLWJ5OiBTaHVucWlhbiBaaGVuZyA8emhlbmdzcUByb2NrLWNoaXBzLmNv
bT4NCj4+Pj4gU2lnbmVkLW9mZi1ieTogSmFjb2IgQ2hlbiA8amFjb2IyLmNoZW5Acm9jay1jaGlw
cy5jb20+DQo+Pj4+IEFja2VkLWJ5OiBIYW5zIFZlcmt1aWwgPGhhbnMudmVya3VpbEBjaXNjby5j
b20+DQo+Pj4NCj4+PiBJIGFja2VkIHRoaXM/IEl0IGlzIG1pc3NpbmcgZG9jdW1lbnRhdGlvbiBm
b3IgdGhlc2UgbmV3IGZvcm1hdHMuDQo+Pg0KPj4gSSB0aGluayBzbyBodHRwczovL3d3dy5zcGlu
aWNzLm5ldC9saXN0cy9saW51eC1yb2NrY2hpcC9tc2cxODk5OS5odG1sIDopDQoNCkhtbSwgSSBw
cm9iYWJseSBoYWQgYW4gb2ZmLWRheSA6LSkNCg0KSSBub3RpY2VkIHRoYXQgdGhlIGRvY3VtZW50
YXRpb24gd2FzIGluY2x1ZGVkIGluIHBhdGNoIDMvNCAod2hpY2ggZGlkbid0DQpyZWFjaCB0aGUg
TUwgYmVjYXVzZSBpdCB3YXMgdG9vIGJpZyksIGJ1dCBJIGFza2VkIEhlbGVuIHRvIHNwbGl0IG9m
ZiB0aGUNCmRvY3VtZW50YXRpb24gaW50byBhIHNlcGFyYXRlIHBhdGNoIChvciBhZGQgaXQgdG8g
dGhpcyBwYXRjaCkuDQoNClJlZ2FyZHMsDQoNCglIYW5zDQoNCj4+DQo+PiBJJ2xsIHVwZGF0ZSB0
aGUgZG9jcyBhbmQgdGhlIGZpeGVzIHlvdSBwb2ludGVkIGJlbG93Lg0KPj4NCj4+IFRoYW5rcy4N
Cj4+IEhlbGVuDQo+Pg0KPj4+PiBbcmVmYWN0b3JlZCBmb3IgdXBzdHJlYW1dDQo+Pj4+IFNpZ25l
ZC1vZmYtYnk6IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEuY29tPg0KPj4+PiBS
ZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29uYm9h
cmQuY29tPg0KPj4+Pg0KPj4+PiAtLS0NCj4+Pj4NCj4+Pj4gQ2hhbmdlcyBpbiB2OToNCj4+Pj4g
LSBBZGQgcmV2aWV3ZWQtYnkgdGFnIGZyb20gTGF1cmVudA0KPj4+Pg0KPj4+PiBDaGFuZ2VzIGlu
IHY4OiBOb25lDQo+Pj4+IENoYW5nZXMgaW4gdjc6DQo+Pj4+IC0gcy9JUFUzL1JLX0lTUDENCj4+
Pj4NCj4+Pj4gIGRyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyB8IDIgKysNCj4+
Pj4gIGluY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCAgICAgICB8IDQgKysrKw0KPj4+PiAg
MiBmaWxlcyBjaGFuZ2VkLCA2IGluc2VydGlvbnMoKykNCj4+Pj4NCj4+Pj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYyBiL2RyaXZlcnMvbWVkaWEvdjRs
Mi1jb3JlL3Y0bDItaW9jdGwuYw0KPj4+PiBpbmRleCAzMTVhYzEyYzNlMGEuLmFkZTk5MDU1NGNh
ZiAxMDA2NDQNCj4+Pj4gLS0tIGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5j
DQo+Pj4+ICsrKyBiL2RyaXZlcnMvbWVkaWEvdjRsMi1jb3JlL3Y0bDItaW9jdGwuYw0KPj4+PiBA
QCAtMTM0MSw2ICsxMzQxLDggQEAgc3RhdGljIHZvaWQgdjRsX2ZpbGxfZm10ZGVzYyhzdHJ1Y3Qg
djRsMl9mbXRkZXNjICpmbXQpDQo+Pj4+ICAJY2FzZSBWNEwyX01FVEFfRk1UX1VWQzoJCWRlc2Ny
ID0gIlVWQyBQYXlsb2FkIEhlYWRlciBNZXRhZGF0YSI7IGJyZWFrOw0KPj4+PiAgCWNhc2UgVjRM
Ml9NRVRBX0ZNVF9ENFhYOglkZXNjciA9ICJJbnRlbCBENHh4IFVWQyBNZXRhZGF0YSI7IGJyZWFr
Ow0KPj4+PiAgCWNhc2UgVjRMMl9NRVRBX0ZNVF9WSVZJRDogICAgICAgZGVzY3IgPSAiVml2aWQg
TWV0YWRhdGEiOyBicmVhazsNCj4+Pj4gKwljYXNlIFY0TDJfTUVUQV9GTVRfUktfSVNQMV9QQVJB
TVM6CWRlc2NyID0gIlJvY2tjaGlwIElTUDEgM0EgcGFyYW1zIjsgYnJlYWs7DQo+Pj4NCj4+PiBw
YXJhbXMgLT4gUGFyYW1zDQo+Pj4NCj4+Pj4gKwljYXNlIFY0TDJfTUVUQV9GTVRfUktfSVNQMV9T
VEFUXzNBOglkZXNjciA9ICJSb2NrY2hpcCBJU1AxIDNBIHN0YXRpc3RpY3MiOyBicmVhazsNCj4+
Pg0KPj4+IHN0YXRpc3RpY3MgLT4gU3RhdGlzdGljcw0KPj4+DQo+Pj4+ICANCj4+Pj4gIAlkZWZh
dWx0Og0KPj4+PiAgCQkvKiBDb21wcmVzc2VkIGZvcm1hdHMgKi8NCj4+Pj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRl
b2RldjIuaA0KPj4+PiBpbmRleCBmOThiYmNjZWQ4ZmYuLjU2Nzk4YjA5Y2Q4NSAxMDA2NDQNCj4+
Pj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5oDQo+Pj4+ICsrKyBiL2luY2x1
ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPiANCj4gQ2FuIHdlIGF2b2lkIHRvdWNoaW5nIHZp
ZGVvZGV2Mi5oLCBhcyB3ZSBkaWQgZm9yIHRoZSBzdGF0ZWxlc3MgY29kZWMgcGl4Zm10cz8NCj4g
DQo+IFRoYW5rcywNCj4gRXplcXVpZWwNCj4gDQo+Pj4+IEBAIC03NjIsNiArNzYyLDEwIEBAIHN0
cnVjdCB2NGwyX3BpeF9mb3JtYXQgew0KPj4+PiAgI2RlZmluZSBWNEwyX01FVEFfRk1UX0Q0WFgg
ICAgICAgIHY0bDJfZm91cmNjKCdEJywgJzQnLCAnWCcsICdYJykgLyogRDRYWCBQYXlsb2FkIEhl
YWRlciBtZXRhZGF0YSAqLw0KPj4+PiAgI2RlZmluZSBWNEwyX01FVEFfRk1UX1ZJVklECSAgdjRs
Ml9mb3VyY2MoJ1YnLCAnSScsICdWJywgJ0QnKSAvKiBWaXZpZCBNZXRhZGF0YSAqLw0KPj4+PiAg
DQo+Pj4+ICsvKiBWZW5kb3Igc3BlY2lmaWMgLSB1c2VkIGZvciBSS19JU1AxIGNhbWVyYSBzdWIt
c3lzdGVtICovDQo+Pj4+ICsjZGVmaW5lIFY0TDJfTUVUQV9GTVRfUktfSVNQMV9QQVJBTVMJdjRs
Ml9mb3VyY2MoJ1InLCAnSycsICcxJywgJ1AnKSAvKiBSb2NrY2hpcCBJU1AxIHBhcmFtcyAqLw0K
Pj4+PiArI2RlZmluZSBWNEwyX01FVEFfRk1UX1JLX0lTUDFfU1RBVF8zQQl2NGwyX2ZvdXJjYygn
UicsICdLJywgJzEnLCAnUycpIC8qIFJvY2tjaGlwIElTUDEgM0Egc3RhdGlzdGljcyAqLw0KPj4+
PiArDQo+Pj4+ICAvKiBwcml2IGZpZWxkIHZhbHVlIHRvIGluZGljYXRlcyB0aGF0IHN1YnNlcXVl
bnQgZmllbGRzIGFyZSB2YWxpZC4gKi8NCj4+Pj4gICNkZWZpbmUgVjRMMl9QSVhfRk1UX1BSSVZf
TUFHSUMJCTB4ZmVlZGNhZmUNCj4+Pj4gIA0KPj4+Pg0KPj4+DQo+Pj4gUmVnYXJkcywNCj4+Pg0K
Pj4+IAlIYW5zDQo+Pj4NCj4gDQo+IA0K
