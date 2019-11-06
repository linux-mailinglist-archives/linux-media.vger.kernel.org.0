Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9B287F160D
	for <lists+linux-media@lfdr.de>; Wed,  6 Nov 2019 13:30:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfKFMaK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 6 Nov 2019 07:30:10 -0500
Received: from alln-iport-6.cisco.com ([173.37.142.93]:38082 "EHLO
        alln-iport-6.cisco.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728140AbfKFMaK (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 6 Nov 2019 07:30:10 -0500
X-Greylist: delayed 428 seconds by postgrey-1.27 at vger.kernel.org; Wed, 06 Nov 2019 07:30:09 EST
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3552; q=dns/txt; s=iport;
  t=1573043409; x=1574253009;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=VVrK51hRZI55odG7ZNnZp9l6jxMaGxztVQSHMnIAb8Q=;
  b=FPtQx6f5VA1d2tHSN9P8Os+/Te3f3gW242Vi/AiTfggA/vk5Br7k9CAM
   8EwHE+e1UaS0la4vxVfso1Bnh7TUplji4ZIvubMJ5623uksYJz8cwBBak
   pp+o4mp1JdaK3bUNGtYPGcwGAyYxp4MY13tVnhLF6q9PlP03C3nrueyFv
   k=;
IronPort-PHdr: =?us-ascii?q?9a23=3A+sfjExCL6egwExSTJkD4UyQJPHJ1sqjoPgMT9p?=
 =?us-ascii?q?ssgq5PdaLm5Zn5IUjD/qs03kTRU9Dd7PRJw6rNvqbsVHZIwK7JsWtKMfkuHw?=
 =?us-ascii?q?QAld1QmgUhBMCfDkiuLPfsdDI3BsdqX15+9Hb9Ok9QS47z?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A0B4AQDcucJd/4kNJK1mGgEBAQEBAQE?=
 =?us-ascii?q?BAQMBAQEBEQEBAQICAQEBAYF+gUtQBYFEIAQLKgqEH4NGA4p+ToFrJZd+glI?=
 =?us-ascii?q?DVAkBAQEMAQEtAgEBhEACF4N3JDgTAgMLAQEEAQEBAgEFBG2FNwyFUQEBAQE?=
 =?us-ascii?q?CARIRBA0MAQE3AQ8CAQgVAwICJgICAjAVEAIEAQwBBQIBAR6DAIJHAw4gAaY?=
 =?us-ascii?q?eAoE4iGB1fzOCfgEBBYUIGIIXCYEOKIwUGIFAP4E4DIJfPoRcgnmCXo1RgX0?=
 =?us-ascii?q?3nX8KgiSVNgYbmWyOQ5lkAgQCBAUCDgEBBYFpIoFYcBWDJ1ARFIMGDBcVgzu?=
 =?us-ascii?q?KU3SBKI9TAYEOAQE?=
X-IronPort-AV: E=Sophos;i="5.68,274,1569283200"; 
   d="scan'208";a="373985871"
Received: from alln-core-4.cisco.com ([173.36.13.137])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 06 Nov 2019 12:23:01 +0000
Received: from XCH-RCD-016.cisco.com (xch-rcd-016.cisco.com [173.37.102.26])
        by alln-core-4.cisco.com (8.15.2/8.15.2) with ESMTPS id xA6CN1km019096
        (version=TLSv1.2 cipher=AES256-SHA bits=256 verify=FAIL);
        Wed, 6 Nov 2019 12:23:01 GMT
Received: from xhs-aln-002.cisco.com (173.37.135.119) by XCH-RCD-016.cisco.com
 (173.37.102.26) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 06:23:00 -0600
Received: from xhs-aln-002.cisco.com (173.37.135.119) by xhs-aln-002.cisco.com
 (173.37.135.119) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 6 Nov
 2019 06:22:59 -0600
Received: from NAM05-CO1-obe.outbound.protection.outlook.com (173.37.151.57)
 by xhs-aln-002.cisco.com (173.37.135.119) with Microsoft SMTP Server (TLS) id
 15.0.1473.3 via Frontend Transport; Wed, 6 Nov 2019 06:22:59 -0600
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ILbKp2Ug3a9k8goVAGqb+/tB/NVHPRtrsS1RFdKtCeRc0u50qNb6bT3WRYUjbAubiuuAQL4Pg7+taiyin0/A6/BBP/FasPY+LvmaDRq9DSQBMHOS9vVn7Yguu6G6G7NflGnAc1EfZ3k812tIgbfcwJu46Sz3SEzQg1ciLJmzWLGWyLuuOTvpQNGOYIwUZtXv/mqItt2kybIzx16M8fepYWwB0GQ61rLipkusFIZ1Ys48xbkLPaQWaiqMKBXrjX3b8ghb8l/8cNpSCqWdxnYuZTfRwDWaukljmFigea+zKQ0Ac4QEPvJSHX/1Zc8FJbKuZwnPdmXwvklDZPxIImImFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVrK51hRZI55odG7ZNnZp9l6jxMaGxztVQSHMnIAb8Q=;
 b=R4iZ8UIVTLcK9iy4uIlPIQJBZ48OOfGXIqdTNGh3pXscu+fBMiAGtdGkXwkeGzU4UISddYONeialV1fB+N+fi2TFL5LEelCq5v257DAxSSVOkgZ3Wv42Ta2DdUzaOBdzXeTlno7W/FS/SRZz6jeFPiCJA6MiSUnVceqHjw411veJL+xRUPuAIuFAXlqXe1tJ8drvEP7XCJ5qqjyhtzs4q0JrGPxz1l1UHuzRQmmA6mPM5/giTTls6+i1Vni6tpawZ4+KMXqiHyr5vq5MzppfedhExB4/9uR24c7mLYZy9r8THXqix1DRjdurBTABF7uPHEW6UcoFzOX2oXm0MMDfVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VVrK51hRZI55odG7ZNnZp9l6jxMaGxztVQSHMnIAb8Q=;
 b=kVuElGIEXC2Z1KhawW0z8nOID1uKBRNfJbiap34MY9MrUt064AvcUxhSDjo7FnDFo36U6HmotLdrPjRTgRoJVA45qh8eL1TDPu/jR0prLc3MZyxfJ0nAiSn2/208ooRSrd62sZhX2f6gHrbL85Z8dNLIMFAdgmIN/9CguNyT/fY=
Received: from MWHPR11MB0062.namprd11.prod.outlook.com (10.164.204.34) by
 MWHPR11MB0078.namprd11.prod.outlook.com (10.164.204.38) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2408.24; Wed, 6 Nov 2019 12:22:50 +0000
Received: from MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::915:6397:4683:34e0]) by MWHPR11MB0062.namprd11.prod.outlook.com
 ([fe80::915:6397:4683:34e0%3]) with mapi id 15.20.2408.024; Wed, 6 Nov 2019
 12:22:50 +0000
From:   "Hans Verkuil (hansverk)" <hansverk@cisco.com>
To:     Helen Koike <helen.koike@collabora.com>,
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
        "ezequiel@collabora.com" <ezequiel@collabora.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "zhengsq@rock-chips.com" <zhengsq@rock-chips.com>,
        Jacob Chen <jacob2.chen@rock-chips.com>
Subject: Re: [PATCH v9 1/4] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
Thread-Topic: [PATCH v9 1/4] media: videodev2.h, v4l2-ioctl: add rkisp1 meta
 buffer format
Thread-Index: AQHVlJoMoe3KhuzWQE6zp8GXlxAXY6d+EJqA
Date:   Wed, 6 Nov 2019 12:22:50 +0000
Message-ID: <9102bcf8-0279-7972-daff-b15aaf98804d@cisco.com>
References: <20191106120132.6876-1-helen.koike@collabora.com>
 <20191106120132.6876-2-helen.koike@collabora.com>
In-Reply-To: <20191106120132.6876-2-helen.koike@collabora.com>
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
x-ms-office365-filtering-correlation-id: 08f653a5-e61c-45fd-71b3-08d762b40aad
x-ms-traffictypediagnostic: MWHPR11MB0078:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MWHPR11MB0078EB299800129990D08E13DE790@MWHPR11MB0078.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3968;
x-forefront-prvs: 02135EB356
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(376002)(136003)(396003)(366004)(346002)(199004)(189003)(31686004)(229853002)(91956017)(66556008)(99286004)(256004)(8936002)(8676002)(6246003)(3846002)(6486002)(2906002)(25786009)(71200400001)(7416002)(71190400001)(81156014)(81166006)(305945005)(4326008)(31696002)(7736002)(6436002)(66446008)(76116006)(5660300002)(65806001)(66066001)(65956001)(86362001)(6116002)(6512007)(58126008)(102836004)(64756008)(53546011)(446003)(6506007)(36756003)(486006)(14454004)(11346002)(476003)(2616005)(66476007)(54906003)(186003)(110136005)(2501003)(316002)(76176011)(26005)(66946007)(478600001);DIR:OUT;SFP:1101;SCL:1;SRVR:MWHPR11MB0078;H:MWHPR11MB0062.namprd11.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: cisco.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: r1HC8zt3SUj+w6AqAeGP8YVzEnJTRpdq9KqpVi7UhUcwOm+PzSioqgGQoG7EPZTHynGL+d4qkfFHDwjD8KUDBqyjp2kxSf0YkHdN9PYq3tGDjh07Va1jHr0DuXMFfn/XMI7dSYtoHnvrs0FTa28agalLoD3VxRYnE5VXPHaJNBRBH1QKbO+FPsgB3fKZdJoUmeb6KrwwfQNllO6pg9Ck3yUiHjiv3BsEnNUQdIYRgw1xG6DKKo9SRMZzTRMUuUR8psrOFt8ov/Jl1QjF2evsFvfQEVZeHadwiUlEGpsRR7H92/n7Fb8u/JLAMOQf7uFdfF17srtjq6RdrwgIcnIirNxUxwaAYxr548jzQ0IsqByZsAXA8FNVSj6OYBpHde68Rqct8oPFwC15Ylubozen7XG51rgB56ueOSgEeRT7CXAyQrYYTVz0xOijIYceCNCl
Content-Type: text/plain; charset="utf-8"
Content-ID: <E779B3FBDFE14F408BAD826C04919BF8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 08f653a5-e61c-45fd-71b3-08d762b40aad
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Nov 2019 12:22:50.7979
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jKR78HJF4GMbv34W5zu2G8i1HMfat/MuvMpBcnlpoY1rqLWMGEfPNNhQFEnEp3Kt/IebRFuXehsYCAO8hAMWtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB0078
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.26, xch-rcd-016.cisco.com
X-Outbound-Node: alln-core-4.cisco.com
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMTEvNi8xOSAxOjAxIFBNLCBIZWxlbiBLb2lrZSB3cm90ZToNCj4gRnJvbTogU2h1bnFpYW4g
WmhlbmcgPHpoZW5nc3FAcm9jay1jaGlwcy5jb20+DQo+IA0KPiBBZGQgdGhlIFJvY2tjaGlwIElT
UDEgc3BlY2lmaWMgcHJvY2Vzc2luZyBwYXJhbWV0ZXIgZm9ybWF0DQo+IFY0TDJfTUVUQV9GTVRf
UktfSVNQMV9QQVJBTVMgYW5kIG1ldGFkYXRhIGZvcm1hdA0KPiBWNEwyX01FVEFfRk1UX1JLX0lT
UDFfU1RBVF8zQSBmb3IgM0EuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBTaHVucWlhbiBaaGVuZyA8
emhlbmdzcUByb2NrLWNoaXBzLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogSmFjb2IgQ2hlbiA8amFj
b2IyLmNoZW5Acm9jay1jaGlwcy5jb20+DQo+IEFja2VkLWJ5OiBIYW5zIFZlcmt1aWwgPGhhbnMu
dmVya3VpbEBjaXNjby5jb20+DQoNCkkgYWNrZWQgdGhpcz8gSXQgaXMgbWlzc2luZyBkb2N1bWVu
dGF0aW9uIGZvciB0aGVzZSBuZXcgZm9ybWF0cy4NCg0KPiBbcmVmYWN0b3JlZCBmb3IgdXBzdHJl
YW1dDQo+IFNpZ25lZC1vZmYtYnk6IEhlbGVuIEtvaWtlIDxoZWxlbi5rb2lrZUBjb2xsYWJvcmEu
Y29tPg0KPiBSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBp
ZGVhc29uYm9hcmQuY29tPg0KPiANCj4gLS0tDQo+IA0KPiBDaGFuZ2VzIGluIHY5Og0KPiAtIEFk
ZCByZXZpZXdlZC1ieSB0YWcgZnJvbSBMYXVyZW50DQo+IA0KPiBDaGFuZ2VzIGluIHY4OiBOb25l
DQo+IENoYW5nZXMgaW4gdjc6DQo+IC0gcy9JUFUzL1JLX0lTUDENCj4gDQo+ICBkcml2ZXJzL21l
ZGlhL3Y0bDItY29yZS92NGwyLWlvY3RsLmMgfCAyICsrDQo+ICBpbmNsdWRlL3VhcGkvbGludXgv
dmlkZW9kZXYyLmggICAgICAgfCA0ICsrKysNCj4gIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRp
b25zKCspDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1p
b2N0bC5jIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRsMi1pb2N0bC5jDQo+IGluZGV4IDMx
NWFjMTJjM2UwYS4uYWRlOTkwNTU0Y2FmIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL21lZGlhL3Y0
bDItY29yZS92NGwyLWlvY3RsLmMNCj4gKysrIGIvZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdjRs
Mi1pb2N0bC5jDQo+IEBAIC0xMzQxLDYgKzEzNDEsOCBAQCBzdGF0aWMgdm9pZCB2NGxfZmlsbF9m
bXRkZXNjKHN0cnVjdCB2NGwyX2ZtdGRlc2MgKmZtdCkNCj4gIAljYXNlIFY0TDJfTUVUQV9GTVRf
VVZDOgkJZGVzY3IgPSAiVVZDIFBheWxvYWQgSGVhZGVyIE1ldGFkYXRhIjsgYnJlYWs7DQo+ICAJ
Y2FzZSBWNEwyX01FVEFfRk1UX0Q0WFg6CWRlc2NyID0gIkludGVsIEQ0eHggVVZDIE1ldGFkYXRh
IjsgYnJlYWs7DQo+ICAJY2FzZSBWNEwyX01FVEFfRk1UX1ZJVklEOiAgICAgICBkZXNjciA9ICJW
aXZpZCBNZXRhZGF0YSI7IGJyZWFrOw0KPiArCWNhc2UgVjRMMl9NRVRBX0ZNVF9SS19JU1AxX1BB
UkFNUzoJZGVzY3IgPSAiUm9ja2NoaXAgSVNQMSAzQSBwYXJhbXMiOyBicmVhazsNCg0KcGFyYW1z
IC0+IFBhcmFtcw0KDQo+ICsJY2FzZSBWNEwyX01FVEFfRk1UX1JLX0lTUDFfU1RBVF8zQToJZGVz
Y3IgPSAiUm9ja2NoaXAgSVNQMSAzQSBzdGF0aXN0aWNzIjsgYnJlYWs7DQoNCnN0YXRpc3RpY3Mg
LT4gU3RhdGlzdGljcw0KDQo+ICANCj4gIAlkZWZhdWx0Og0KPiAgCQkvKiBDb21wcmVzc2VkIGZv
cm1hdHMgKi8NCj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaCBi
L2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPiBpbmRleCBmOThiYmNjZWQ4ZmYuLjU2
Nzk4YjA5Y2Q4NSAxMDA2NDQNCj4gLS0tIGEvaW5jbHVkZS91YXBpL2xpbnV4L3ZpZGVvZGV2Mi5o
DQo+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aWRlb2RldjIuaA0KPiBAQCAtNzYyLDYgKzc2
MiwxMCBAQCBzdHJ1Y3QgdjRsMl9waXhfZm9ybWF0IHsNCj4gICNkZWZpbmUgVjRMMl9NRVRBX0ZN
VF9ENFhYICAgICAgICB2NGwyX2ZvdXJjYygnRCcsICc0JywgJ1gnLCAnWCcpIC8qIEQ0WFggUGF5
bG9hZCBIZWFkZXIgbWV0YWRhdGEgKi8NCj4gICNkZWZpbmUgVjRMMl9NRVRBX0ZNVF9WSVZJRAkg
IHY0bDJfZm91cmNjKCdWJywgJ0knLCAnVicsICdEJykgLyogVml2aWQgTWV0YWRhdGEgKi8NCj4g
IA0KPiArLyogVmVuZG9yIHNwZWNpZmljIC0gdXNlZCBmb3IgUktfSVNQMSBjYW1lcmEgc3ViLXN5
c3RlbSAqLw0KPiArI2RlZmluZSBWNEwyX01FVEFfRk1UX1JLX0lTUDFfUEFSQU1TCXY0bDJfZm91
cmNjKCdSJywgJ0snLCAnMScsICdQJykgLyogUm9ja2NoaXAgSVNQMSBwYXJhbXMgKi8NCj4gKyNk
ZWZpbmUgVjRMMl9NRVRBX0ZNVF9SS19JU1AxX1NUQVRfM0EJdjRsMl9mb3VyY2MoJ1InLCAnSycs
ICcxJywgJ1MnKSAvKiBSb2NrY2hpcCBJU1AxIDNBIHN0YXRpc3RpY3MgKi8NCj4gKw0KPiAgLyog
cHJpdiBmaWVsZCB2YWx1ZSB0byBpbmRpY2F0ZXMgdGhhdCBzdWJzZXF1ZW50IGZpZWxkcyBhcmUg
dmFsaWQuICovDQo+ICAjZGVmaW5lIFY0TDJfUElYX0ZNVF9QUklWX01BR0lDCQkweGZlZWRjYWZl
DQo+ICANCj4gDQoNClJlZ2FyZHMsDQoNCglIYW5z
