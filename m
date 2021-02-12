Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 824BA319B4F
	for <lists+linux-media@lfdr.de>; Fri, 12 Feb 2021 09:39:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229905AbhBLIhb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 12 Feb 2021 03:37:31 -0500
Received: from mga04.intel.com ([192.55.52.120]:58166 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229771AbhBLIh1 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 12 Feb 2021 03:37:27 -0500
IronPort-SDR: lfwe3S1c2v6oTsF1bzYcRPbzvDOqU1B8NUGUoCpYoIpGxCRng6wivato+MjBCwKB8sIcI8nku2
 Papg14MLSzAg==
X-IronPort-AV: E=McAfee;i="6000,8403,9892"; a="179823402"
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="179823402"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2021 00:36:46 -0800
IronPort-SDR: QUomUn6GF7IRl2CrcExR/qIj5JqxA0On8b8Z5x0sj+79oToDKfk7epDr3YDf0XgUktQ4MaLR1K
 mjToj06XNF1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,173,1610438400"; 
   d="scan'208";a="490835235"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2021 00:36:45 -0800
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:36:45 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Fri, 12 Feb 2021 00:36:44 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.2106.002;
 Fri, 12 Feb 2021 00:36:44 -0800
From:   "Kasireddy, Vivek" <vivek.kasireddy@intel.com>
To:     =?utf-8?B?Q2hyaXN0aWFuIEvDtm5pZw==?= <christian.koenig@amd.com>,
        "Gerd Hoffmann" <kraxel@redhat.com>
CC:     Daniel Vetter <daniel@ffwll.ch>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "Vetter, Daniel" <daniel.vetter@intel.com>,
        "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
        "Kim, Dongwon" <dongwon.kim@intel.com>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Topic: [RFC v3 2/3] virtio: Introduce Vdmabuf driver
Thread-Index: AQHW+gCTpvRVWdGfdEuO7KEMCe95EKpKQvKAgAQvVwCAABxAAIAAXFfggAEm5oCAAH4bcIABCTWAgAKhj6A=
Date:   Fri, 12 Feb 2021 08:36:44 +0000
Message-ID: <fd23d4d08ea84ca3b8a7610a8fb866d5@intel.com>
References: <20210203073517.1908882-1-vivek.kasireddy@intel.com>
 <20210203073517.1908882-3-vivek.kasireddy@intel.com>
 <YB1sRx1GrT8rATEg@phenom.ffwll.local>
 <20210208075748.xejgcb4il2egow2u@sirius.home.kraxel.org>
 <YCEGrrT0/eqqz/ok@phenom.ffwll.local>
 <8ba4ad64be3546bda9a2ed2129bf98e4@intel.com>
 <20210209084453.5oqepy7zdwtxgrpu@sirius.home.kraxel.org>
 <2ef01dc941684a15a4f30e6239ae42df@intel.com>
 <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
In-Reply-To: <8ac10b1d-3d64-4e39-42e6-6c65b61f0794@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.5.1.3
dlp-reaction: no-action
x-originating-ip: [10.22.254.132]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgQ2hyaXN0aWFuLA0KDQo+IA0KPiBIaSBWaXZlaywNCj4gDQo+ID4gW0thc2lyZWRkeSwgVml2
ZWtdIFdoYXQgaWYgSSBkbyBtbWFwKCkgb24gdGhlIGZkIGZvbGxvd2VkIGJ5IG1sb2NrKCkNCj4g
PiBvciBtbWFwKCkgZm9sbG93ZWQgYnkgZ2V0X3VzZXJfcGFnZXMoKT8gSWYgaXQgc3RpbGwgZmFp
bHMsIHdvdWxkDQo+ID4gaW9yZW1hcHBpbmcgdGhlIGRldmljZSBtZW1vcnkgYW5kIHBva2luZyBh
dCB0aGUgYmFja2luZyBzdG9yYWdlIGJlIGFuDQo+ID4gb3B0aW9uPyBPciwgaWYgSSBiaW5kIHRo
ZSBwYXNzdGhyb3VnaCdkIEdQVSBkZXZpY2UgdG8gdmZpby1wY2kgYW5kIHRhcA0KPiA+IGludG8g
dGhlIG1lbW9yeSByZWdpb24gYXNzb2NpYXRlZCB3aXRoIHRoZSBkZXZpY2UgbWVtb3J5LCBjYW4g
aXQgYmUgbWFkZSB0byB3b3JrPw0KPiANCj4gZ2V0X3VzZXJfcGFnZXMoKSBpcyBub3QgYWxsb3dl
ZCBvbiBtbWFwZWQgRE1BLWJ1ZnMgaW4gdGhlIGZpcnN0IHBsYWNlLg0KPiANCj4gRGFuaWVsIGlz
IGN1cnJlbnRseSBhZGRpbmcgY29kZSB0byBtYWtlIHN1cmUgdGhhdCB0aGlzIGlzIG5ldmVyIGV2
ZXIgdXNlZC4NCj4gDQo+ID4gQW5kLCBJIG5vdGljZWQgdGhhdCBmb3IgUEZOcyB0aGF0IGRvIG5v
dCBoYXZlIHZhbGlkIHN0cnVjdCBwYWdlDQo+ID4gYXNzb2NpYXRlZCB3aXRoIGl0LCBLVk0gZG9l
cyBhIG1lbXJlbWFwKCkgdG8gYWNjZXNzL21hcCB0aGVtLiBJcyB0aGlzIGFuIG9wdGlvbj8NCj4g
DQo+IE5vLCBldmVuIGZvciBzeXN0ZW0gbWVtb3J5IHdoaWNoIGhhcyBhIHZhbGlkIHN0cnVjdCBw
YWdlIHRvdWNoaW5nIGl0IHdoZW4gaXQgaXMgcGFydCBvZiBhDQo+IERNQS1idWYgaXMgaWxsZWdh
bCBzaW5jZSB0aGUgcmVmZXJlbmNlIGNvdW50IGFuZCBtYXBwaW5nIGZpZWxkcyBpbiBzdHJ1Y3Qg
cGFnZSBtaWdodCBiZQ0KPiB1c2VkIGZvciBzb21ldGhpbmcgZGlmZmVyZW50Lg0KPiANCj4gS2Vl
cCBpbiBtaW5kIHRoYXQgc3RydWN0IHBhZ2UgaXMgYSBoZWF2aWx5IG92ZXJsb2FkZWQgc3RydWN0
dXJlIGZvciBkaWZmZXJlbnQgdXNlIGNhc2VzLiBZb3UNCj4gY2FuJ3QganVzdCB1c2UgaXQgZm9y
IGEgZGlmZmVyZW50IHVzZSBjYXNlIHRoYW4gd2hhdCB0aGUgb3duZXIgb2YgdGhlIHBhZ2UgaGFz
IGludGVuZGVkIGl0Lg0KW0thc2lyZWRkeSwgVml2ZWtdIFdoYXQgaXMgeW91ciByZWNvbW1lbmRl
ZC9hY2NlcHRhYmxlIHdheSBmb3IgZG9pbmcgd2hhdCBJIGFtIHRyeWluZyB0byANCmRvPw0KDQpU
aGFua3MsDQpWaXZlaw0KDQo+IA0KPiBSZWdhcmRzLA0KPiBDaHJpc3RpYW4uDQo+IA0KPiA+DQo+
ID4NCj4gPiBUaGFua3MsDQo+ID4gVml2ZWsNCj4gPj4gdGFrZSBjYXJlLA0KPiA+PiAgICBHZXJk
DQoNCg==
