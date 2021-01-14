Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9D94C2F6354
	for <lists+linux-media@lfdr.de>; Thu, 14 Jan 2021 15:42:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727313AbhANOkg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Jan 2021 09:40:36 -0500
Received: from mga02.intel.com ([134.134.136.20]:59628 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726625AbhANOkf (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Jan 2021 09:40:35 -0500
IronPort-SDR: yrGEKf60lZcTkdwxcZdCGbgxJToyxYujprOl5UL+TuhzvhFibNPt+tHBRN4pWdXyOx8xwMhSqe
 EomSUnoxMymw==
X-IronPort-AV: E=McAfee;i="6000,8403,9863"; a="165462752"
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="165462752"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2021 06:39:53 -0800
IronPort-SDR: OXFeD7u2knJKsGftZ9Lmy23mOu+xvnqfiW1kF4Rnp5AZ5r9BnVn036tCPnxmq9BdVI0jpAzr0W
 omyZuBreM4vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.79,347,1602572400"; 
   d="scan'208";a="353921141"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmsmga008.fm.intel.com with ESMTP; 14 Jan 2021 06:39:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 Jan 2021 06:39:52 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Thu, 14 Jan 2021 06:39:51 -0800
Received: from orsmsx611.amr.corp.intel.com ([10.22.229.24]) by
 ORSMSX611.amr.corp.intel.com ([10.22.229.24]) with mapi id 15.01.1713.004;
 Thu, 14 Jan 2021 06:39:51 -0800
From:   "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
        "christian.koenig@amd.com" <christian.koenig@amd.com>,
        "airlied@redhat.com" <airlied@redhat.com>,
        "daniel@ffwll.ch" <daniel@ffwll.ch>,
        "maarten.lankhorst@linux.intel.com" 
        <maarten.lankhorst@linux.intel.com>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "kraxel@redhat.com" <kraxel@redhat.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "sean@poorly.run" <sean@poorly.run>,
        "eric@anholt.net" <eric@anholt.net>,
        "sam@ravnborg.org" <sam@ravnborg.org>
CC:     "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
        "Daniel Vetter" <daniel.vetter@ffwll.ch>,
        "virtualization@lists.linux-foundation.org" 
        <virtualization@lists.linux-foundation.org>,
        "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
 operations
Thread-Topic: [PATCH v4 01/13] dma-buf: Add vmap_local and vnumap_local
 operations
Thread-Index: AQHW5aLP4hX76tQjY0SfdcD489sfwKod5bgggAZCxwCAAxIqgA==
Date:   Thu, 14 Jan 2021 14:39:51 +0000
Message-ID: <904190b454d541e6b126108dd5d20785@intel.com>
References: <20210108094340.15290-1-tzimmermann@suse.de>
 <20210108094340.15290-2-tzimmermann@suse.de>
 <39d9d40bf6284ef29c777776f9f2b5a3@intel.com>
 <65f6679c-dc53-e902-bcd1-a960caef756b@suse.de>
In-Reply-To: <65f6679c-dc53-e902-bcd1-a960caef756b@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-reaction: no-action
dlp-version: 11.5.1.3
x-originating-ip: [10.1.200.100]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

DQoNCj4tLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPkZyb206IGRyaS1kZXZlbCA8ZHJpLWRl
dmVsLWJvdW5jZXNAbGlzdHMuZnJlZWRlc2t0b3Aub3JnPiBPbiBCZWhhbGYgT2YNCj5UaG9tYXMg
WmltbWVybWFubg0KPlNlbnQ6IFR1ZXNkYXksIEphbnVhcnkgMTIsIDIwMjEgMjo0NSBBTQ0KPlRv
OiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT47IHN1bWl0LnNlbXdh
bEBsaW5hcm8ub3JnOw0KPmNocmlzdGlhbi5rb2VuaWdAYW1kLmNvbTsgYWlybGllZEByZWRoYXQu
Y29tOyBkYW5pZWxAZmZ3bGwuY2g7DQo+bWFhcnRlbi5sYW5raG9yc3RAbGludXguaW50ZWwuY29t
OyBtcmlwYXJkQGtlcm5lbC5vcmc7DQo+a3JheGVsQHJlZGhhdC5jb207IGhkZWdvZWRlQHJlZGhh
dC5jb207IHNlYW5AcG9vcmx5LnJ1bjsNCj5lcmljQGFuaG9sdC5uZXQ7IHNhbUByYXZuYm9yZy5v
cmcNCj5DYzogbGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnOyBEYW5pZWwgVmV0dGVyIDxk
YW5pZWwudmV0dGVyQGZmd2xsLmNoPjsNCj52aXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3Vu
ZGF0aW9uLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsNCj5saW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmcNCj5TdWJqZWN0OiBSZTogW1BBVENIIHY0IDAxLzEzXSBkbWEtYnVm
OiBBZGQgdm1hcF9sb2NhbCBhbmQgdm51bWFwX2xvY2FsDQo+b3BlcmF0aW9ucw0KPg0KPkhpDQo+
DQo+QW0gMDguMDEuMjEgdW0gMTc6MTIgc2NocmllYiBSdWhsLCBNaWNoYWVsIEo6DQo+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1i
b3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4gVGhvbWFzIFpp
bW1lcm1hbm4NCj4+PiBTZW50OiBGcmlkYXksIEphbnVhcnkgOCwgMjAyMSA0OjQzIEFNDQo+Pj4g
VG86IHN1bWl0LnNlbXdhbEBsaW5hcm8ub3JnOyBjaHJpc3RpYW4ua29lbmlnQGFtZC5jb207DQo+
Pj4gYWlybGllZEByZWRoYXQuY29tOyBkYW5pZWxAZmZ3bGwuY2g7IG1hYXJ0ZW4ubGFua2hvcnN0
QGxpbnV4LmludGVsLmNvbTsNCj4+PiBtcmlwYXJkQGtlcm5lbC5vcmc7IGtyYXhlbEByZWRoYXQu
Y29tOyBoZGVnb2VkZUByZWRoYXQuY29tOw0KPj4+IHNlYW5AcG9vcmx5LnJ1bjsgZXJpY0Bhbmhv
bHQubmV0OyBzYW1AcmF2bmJvcmcub3JnDQo+Pj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+OyBkcmktDQo+ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPj4+
IHZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnOyBsaW5hcm8tbW0tc2ln
QGxpc3RzLmxpbmFyby5vcmc7DQo+Pj4gVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1
c2UuZGU+OyBsaW51eC0NCj4+PiBtZWRpYUB2Z2VyLmtlcm5lbC5vcmcNCj4+PiBTdWJqZWN0OiBb
UEFUQ0ggdjQgMDEvMTNdIGRtYS1idWY6IEFkZCB2bWFwX2xvY2FsIGFuZCB2bnVtYXBfbG9jYWwN
Cj4+PiBvcGVyYXRpb25zDQo+Pj4NCj4+PiBUaGUgZXhpc3RpbmcgZG1hLWJ1ZiBjYWxscyBkbWFf
YnVmX3ZtYXAoKSBhbmQgZG1hX2J1Zl92dW5tYXAoKSBhcmUNCj4+PiBhbGxvd2VkIHRvIHBpbiB0
aGUgYnVmZmVyIG9yIGFjcXVpcmUgdGhlIGJ1ZmZlcidzIHJlc2VydmF0aW9uIG9iamVjdA0KPj4+
IGxvY2suDQo+Pj4NCj4+PiBUaGlzIGlzIGEgcHJvYmxlbSBmb3IgY2FsbGVycyB0aGF0IG9ubHkg
cmVxdWlyZSBhIHNob3J0LXRlcm0gbWFwcGluZw0KPj4+IG9mIHRoZSBidWZmZXIgd2l0aG91dCB0
aGUgcGlubmluZywgb3IgY2FsbGVycyB0aGF0IGhhdmUgc3BlY2lhbCBsb2NraW5nDQo+Pj4gcmVx
dWlyZW1lbnRzLiBUaGVzZSBtYXkgc3VmZmVyIGZyb20gdW5uZWNlc3Nhcnkgb3ZlcmhlYWQgb3Ig
aW50ZXJmZXJlDQo+Pj4gd2l0aCByZWd1bGFyIHBpbiBvcGVyYXRpb25zLg0KPj4+DQo+Pj4gVGhl
IG5ldyBpbnRlcmZhY2VzIGRtYV9idWZfdm1hcF9sb2NhbCgpLCBkbWFfYnVmX3Z1bm1hcG9fbG9j
YWwoKSwNCj5hbmQNCj4+PiB0aGVpciByc3AgY2FsbGJhY2tzIGluIHN0cnVjdCBkbWFfYnVmX29w
cyBwcm92aWRlIGFuIGFsdGVybmF0aXZlIHdpdGhvdXQNCj4+PiBwaW5uaW5nIG9yIHJlc2VydmF0
aW9uIGxvY2tpbmcuIENhbGxlcnMgYXJlIHJlc3BvbnNpYmxlIGZvciB0aGVzZQ0KPj4+IG9wZXJh
dGlvbnMuDQo+Pj4NCj4+PiB2NDoNCj4+PiAJKiB1cGRhdGUgZG9jdW1lbnRhdGlvbiAoRGFuaWVs
KQ0KPj4+DQo+Pj4gU2lnbmVkLW9mZi1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5u
QHN1c2UuZGU+DQo+Pj4gUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJA
ZmZ3bGwuY2g+DQo+Pj4gU3VnZ2VzdGVkLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVy
QGZmd2xsLmNoPg0KPj4+IC0tLQ0KPj4+IGRyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgfCA4MQ0K
Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4+IGluY2x1ZGUv
bGludXgvZG1hLWJ1Zi5oICAgfCAzNCArKysrKysrKysrKysrKysrDQo+Pj4gMiBmaWxlcyBjaGFu
Z2VkLCAxMTUgaW5zZXJ0aW9ucygrKQ0KPj4+DQo+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1h
LWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jDQo+Pj4gaW5kZXggYjg0
NjUyNDNlY2EyLi4wMWY5Yzc0ZDk3ZmEgMTAwNjQ0DQo+Pj4gLS0tIGEvZHJpdmVycy9kbWEtYnVm
L2RtYS1idWYuYw0KPj4+ICsrKyBiL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4+PiBAQCAt
MTI5NSw2ICsxMjk1LDg3IEBAIHZvaWQgZG1hX2J1Zl92dW5tYXAoc3RydWN0IGRtYV9idWYNCj4q
ZG1hYnVmLA0KPj4+IHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKQ0KPj4+IH0NCj4+PiBFWFBPUlRf
U1lNQk9MX0dQTChkbWFfYnVmX3Z1bm1hcCk7DQo+Pj4NCj4+PiArLyoqDQo+Pj4gKyAqIGRtYV9i
dWZfdm1hcF9sb2NhbCAtIENyZWF0ZSB2aXJ0dWFsIG1hcHBpbmcgZm9yIHRoZSBidWZmZXIgb2Jq
ZWN0DQo+aW50bw0KPj4+IGtlcm5lbA0KPj4+ICsgKiBhZGRyZXNzIHNwYWNlLg0KPj4+ICsgKiBA
ZG1hYnVmOglbaW5dCWJ1ZmZlciB0byB2bWFwDQo+Pj4gKyAqIEBtYXA6CVtvdXRdCXJldHVybnMg
dGhlIHZtYXAgcG9pbnRlcg0KPj4+ICsgKg0KPj4+ICsgKiBVbmxpa2UgZG1hX2J1Zl92bWFwKCkg
dGhpcyBpcyBhIHNob3J0IHRlcm0gbWFwcGluZyBhbmQgd2lsbCBub3QgcGluDQo+Pj4gKyAqIHRo
ZSBidWZmZXIuIFRoZSBzdHJ1Y3QgZG1hX3Jlc3YgZm9yIHRoZSBAZG1hYnVmIG11c3QgYmUgbG9j
a2VkIHVudGlsDQo+Pj4gKyAqIGRtYV9idWZfdnVubWFwX2xvY2FsKCkgaXMgY2FsbGVkLg0KPj4+
ICsgKg0KPj4+ICsgKiBSZXR1cm5zOg0KPj4+ICsgKiAwIG9uIHN1Y2Nlc3MsIG9yIGEgbmVnYXRp
dmUgZXJybm8gY29kZSBvdGhlcndpc2UuDQo+Pj4gKyAqLw0KPj4+ICtpbnQgZG1hX2J1Zl92bWFw
X2xvY2FsKHN0cnVjdCBkbWFfYnVmICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX21hcA0KPj4+ICpt
YXApDQo+Pj4gK3sNCj4+PiArCXN0cnVjdCBkbWFfYnVmX21hcCBwdHI7DQo+Pj4gKwlpbnQgcmV0
ID0gMDsNCj4+PiArDQo+Pj4gKwlkbWFfYnVmX21hcF9jbGVhcihtYXApOw0KPj4+ICsNCj4+PiAr
CWlmIChXQVJOX09OKCFkbWFidWYpKQ0KPj4+ICsJCXJldHVybiAtRUlOVkFMOw0KPj4+ICsNCj4+
PiArCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGRtYWJ1Zi0+cmVzdik7DQo+Pj4gKw0KPj4+ICsJaWYg
KCFkbWFidWYtPm9wcy0+dm1hcF9sb2NhbCkNCj4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4+DQo+
PiBZb3UgYXJlIGNsZWFyaW5nIHRoZSBtYXAsIGFuZCB0aGVuIGRvaW5nIHRoZSBhYm92ZSBjaGVj
a3MuDQo+Pg0KPj4gSXMgaXQgb2sgdG8gY2hhbmdlIHRoZSBtYXAgaW5mbyBhbmQgdGhlbiBleGl0
IG9uIGVycm9yPw0KPg0KPkluIHZtYXBfbG9jYWwgbWFwIGFyZ3VtZW50IHJldHVybnMgdGhlIG1h
cHBpbmcncyBhZGRyZXNzLiBDYWxsZXJzIGFyZQ0KPmV4cGVjdGVkIHRvIGNoZWNrIHRoZSByZXR1
cm4gY29kZS4gQnV0IEkgd291bGQgZXhwZWN0IGEgY2FyZWxlc3MgY2FsbGVyDQo+dG8gbm90IGNo
ZWNrLCBvciBjaGVjayBmb3IgbWFwIGJlaW5nIGNsZWFyZWQuIENsZWFyaW5nIGl0IGhlcmUgZmly
c3QgaXMNCj50aGUgc2F2ZSB0aGluZyB0byBkby4NCg0KQWhoLCBhIHByZS1lbXB0aXZlIGF0dGVt
cHQgdG8gbWFrZSBzdXJlIHRoZSBjYWxsZXIgZG9lc24ndCBjYXVzZSBtb3JlDQpwcm9ibGVtcyBv
biBlcnJvci4g8J+Yig0KDQpUaGFua3MsDQoNCk0NCg0KPkJlc3QgcmVnYXJkcw0KPlRob21hcw0K
Pg0KPj4NCj4+IE1pa2UNCj4+DQo+Pj4gKwltdXRleF9sb2NrKCZkbWFidWYtPmxvY2spOw0KPj4+
ICsJaWYgKGRtYWJ1Zi0+dm1hcHBpbmdfY291bnRlcikgew0KPj4+ICsJCWRtYWJ1Zi0+dm1hcHBp
bmdfY291bnRlcisrOw0KPj4+ICsJCUJVR19PTihkbWFfYnVmX21hcF9pc19udWxsKCZkbWFidWYt
PnZtYXBfcHRyKSk7DQo+Pj4gKwkJKm1hcCA9IGRtYWJ1Zi0+dm1hcF9wdHI7DQo+Pj4gKwkJZ290
byBvdXRfdW5sb2NrOw0KPj4+ICsJfQ0KPj4+ICsNCj4+PiArCUJVR19PTihkbWFfYnVmX21hcF9p
c19zZXQoJmRtYWJ1Zi0+dm1hcF9wdHIpKTsNCj4+PiArDQo+Pj4gKwlyZXQgPSBkbWFidWYtPm9w
cy0+dm1hcF9sb2NhbChkbWFidWYsICZwdHIpOw0KPj4+ICsJaWYgKFdBUk5fT05fT05DRShyZXQp
KQ0KPj4+ICsJCWdvdG8gb3V0X3VubG9jazsNCj4+PiArDQo+Pj4gKwlkbWFidWYtPnZtYXBfcHRy
ID0gcHRyOw0KPj4+ICsJZG1hYnVmLT52bWFwcGluZ19jb3VudGVyID0gMTsNCj4+PiArDQo+Pj4g
KwkqbWFwID0gZG1hYnVmLT52bWFwX3B0cjsNCj4+PiArDQo+Pj4gK291dF91bmxvY2s6DQo+Pj4g
KwltdXRleF91bmxvY2soJmRtYWJ1Zi0+bG9jayk7DQo+Pj4gKwlyZXR1cm4gcmV0Ow0KPj4+ICt9
DQo+Pj4gK0VYUE9SVF9TWU1CT0xfR1BMKGRtYV9idWZfdm1hcF9sb2NhbCk7DQo+Pj4gKw0KPj4+
ICsvKioNCj4+PiArICogZG1hX2J1Zl92dW5tYXBfbG9jYWwgLSBVbm1hcCBhIHZtYXAgb2J0YWlu
ZWQgYnkNCj4+PiBkbWFfYnVmX3ZtYXBfbG9jYWwuDQo+Pj4gKyAqIEBkbWFidWY6CVtpbl0JYnVm
ZmVyIHRvIHZ1bm1hcA0KPj4+ICsgKiBAbWFwOglbaW5dCXZtYXAgcG9pbnRlciB0byB2dW5tYXAN
Cj4+PiArICoNCj4+PiArICogUmVsZWFzZSBhIG1hcHBpbmcgZXN0YWJsaXNoZWQgd2l0aCBkbWFf
YnVmX3ZtYXBfbG9jYWwoKS4NCj4+PiArICovDQo+Pj4gK3ZvaWQgZG1hX2J1Zl92dW5tYXBfbG9j
YWwoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0DQo+Pj4gZG1hX2J1Zl9tYXAgKm1hcCkN
Cj4+PiArew0KPj4+ICsJaWYgKFdBUk5fT04oIWRtYWJ1ZikpDQo+Pj4gKwkJcmV0dXJuOw0KPj4+
ICsNCj4+PiArCWRtYV9yZXN2X2Fzc2VydF9oZWxkKGRtYWJ1Zi0+cmVzdik7DQo+Pj4gKw0KPj4+
ICsJQlVHX09OKGRtYV9idWZfbWFwX2lzX251bGwoJmRtYWJ1Zi0+dm1hcF9wdHIpKTsNCj4+PiAr
CUJVR19PTihkbWFidWYtPnZtYXBwaW5nX2NvdW50ZXIgPT0gMCk7DQo+Pj4gKwlCVUdfT04oIWRt
YV9idWZfbWFwX2lzX2VxdWFsKCZkbWFidWYtPnZtYXBfcHRyLCBtYXApKTsNCj4+PiArDQo+Pj4g
KwltdXRleF9sb2NrKCZkbWFidWYtPmxvY2spOw0KPj4+ICsJaWYgKC0tZG1hYnVmLT52bWFwcGlu
Z19jb3VudGVyID09IDApIHsNCj4+PiArCQlpZiAoZG1hYnVmLT5vcHMtPnZ1bm1hcF9sb2NhbCkN
Cj4+PiArCQkJZG1hYnVmLT5vcHMtPnZ1bm1hcF9sb2NhbChkbWFidWYsIG1hcCk7DQo+Pj4gKwkJ
ZG1hX2J1Zl9tYXBfY2xlYXIoJmRtYWJ1Zi0+dm1hcF9wdHIpOw0KPj4+ICsJfQ0KPj4+ICsJbXV0
ZXhfdW5sb2NrKCZkbWFidWYtPmxvY2spOw0KPj4+ICt9DQo+Pj4gK0VYUE9SVF9TWU1CT0xfR1BM
KGRtYV9idWZfdnVubWFwX2xvY2FsKTsNCj4+PiArDQo+Pj4gI2lmZGVmIENPTkZJR19ERUJVR19G
Uw0KPj4+IHN0YXRpYyBpbnQgZG1hX2J1Zl9kZWJ1Z19zaG93KHN0cnVjdCBzZXFfZmlsZSAqcywg
dm9pZCAqdW51c2VkKQ0KPj4+IHsNCj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9kbWEt
YnVmLmggYi9pbmNsdWRlL2xpbnV4L2RtYS1idWYuaA0KPj4+IGluZGV4IDYyODY4MWJmNmM5OS4u
YWVlZDc1NGI1NDY3IDEwMDY0NA0KPj4+IC0tLSBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oDQo+
Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgNCj4+PiBAQCAtMjY0LDYgKzI2NCwzOCBA
QCBzdHJ1Y3QgZG1hX2J1Zl9vcHMgew0KPj4+DQo+Pj4gCWludCAoKnZtYXApKHN0cnVjdCBkbWFf
YnVmICpkbWFidWYsIHN0cnVjdCBkbWFfYnVmX21hcCAqbWFwKTsNCj4+PiAJdm9pZCAoKnZ1bm1h
cCkoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwDQo+Pj4gKm1hcCk7
DQo+Pj4gKw0KPj4+ICsJLyoqDQo+Pj4gKwkgKiBAdm1hcF9sb2NhbDoNCj4+PiArCSAqDQo+Pj4g
KwkgKiBDcmVhdGVzIGEgdmlydHVhbCBtYXBwaW5nIGZvciB0aGUgYnVmZmVyIGludG8ga2VybmVs
IGFkZHJlc3Mgc3BhY2UuDQo+Pj4gKwkgKg0KPj4+ICsJICogVGhpcyBjYWxsYmFjayBlc3RhYmxp
c2hlcyBzaG9ydC10ZXJtIG1hcHBpbmdzIGZvciBzaXR1YXRpb25zIHdoZXJlDQo+Pj4gKwkgKiBj
YWxsZXJzIG9ubHkgdXNlIHRoZSBidWZmZXIgZm9yIGEgYm91bmRlZCBhbW91bnQgb2YgdGltZTsg
c3VjaCBhcw0KPj4+ICsJICogdXBkYXRlcyB0byB0aGUgZnJhbWVidWZmZXIgb3IgcmVhZGluZyBi
YWNrIGNvbnRhaW5lZCBpbmZvcm1hdGlvbi4NCj4+PiArCSAqIEluIGNvbnRyYXN0IHRvIHRoZSBy
ZWd1bGFyIEB2bWFwIGNhbGxiYWNrLCB2bWFwX2xvY2FsIGRvZXMgbmV2ZXINCj4+PiBwaW4NCj4+
PiArCSAqIHRoZSBidWZmZXIgdG8gYSBzcGVjaWZpYyBkb21haW4gb3IgYWNxdWlyZSB0aGUgYnVm
ZmVyJ3MgcmVzZXJ2YXRpb24NCj4+PiArCSAqIGxvY2suDQo+Pj4gKwkgKg0KPj4+ICsJICogVGhp
cyBpcyBjYWxsZWQgd2l0aCB0aGUgJmRtYV9idWYucmVzdiBvYmplY3QgbG9ja2VkLiBDYWxsZXJz
IG11c3QNCj4+PiBob2xkDQo+Pj4gKwkgKiB0aGUgbG9jayB1bnRpbCBhZnRlciByZW1vdmluZyB0
aGUgbWFwcGluZyB3aXRoIEB2dW5tYXBfbG9jYWwuDQo+Pj4gKwkgKg0KPj4+ICsJICogVGhpcyBj
YWxsYmFjayBpcyBvcHRpb25hbC4NCj4+PiArCSAqDQo+Pj4gKwkgKiBSZXR1cm5zOg0KPj4+ICsJ
ICoNCj4+PiArCSAqIDAgb24gc3VjY2VzcyBvciBhIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFp
bHVyZS4NCj4+PiArCSAqLw0KPj4+ICsJaW50ICgqdm1hcF9sb2NhbCkoc3RydWN0IGRtYV9idWYg
KmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwDQo+Pj4gKm1hcCk7DQo+Pj4gKw0KPj4+ICsJLyoq
DQo+Pj4gKwkgKiBAdnVubWFwX2xvY2FsOg0KPj4+ICsJICoNCj4+PiArCSAqIFJlbW92ZXMgYSB2
aXJ0dWFsIG1hcHBpbmcgdGhhdCB3YXMgZXN0YWJsaXNoZWQgYnkgQHZtYXBfbG9jYWwuDQo+Pj4g
KwkgKg0KPj4+ICsJICogVGhpcyBjYWxsYmFjayBpcyBvcHRpb25hbC4NCj4+PiArCSAqLw0KPj4+
ICsJdm9pZCAoKnZ1bm1hcF9sb2NhbCkoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRt
YV9idWZfbWFwDQo+Pj4gKm1hcCk7DQo+Pj4gfTsNCj4+Pg0KPj4+IC8qKg0KPj4+IEBAIC01MDEs
NCArNTMzLDYgQEAgaW50IGRtYV9idWZfbW1hcChzdHJ1Y3QgZG1hX2J1ZiAqLCBzdHJ1Y3QNCj4+
PiB2bV9hcmVhX3N0cnVjdCAqLA0KPj4+IAkJIHVuc2lnbmVkIGxvbmcpOw0KPj4+IGludCBkbWFf
YnVmX3ZtYXAoc3RydWN0IGRtYV9idWYgKmRtYWJ1Ziwgc3RydWN0IGRtYV9idWZfbWFwDQo+Km1h
cCk7DQo+Pj4gdm9pZCBkbWFfYnVmX3Z1bm1hcChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1
Y3QgZG1hX2J1Zl9tYXANCj4+PiAqbWFwKTsNCj4+PiAraW50IGRtYV9idWZfdm1hcF9sb2NhbChz
dHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1Y3QgZG1hX2J1Zl9tYXANCj4+PiAqbWFwKTsNCj4+
PiArdm9pZCBkbWFfYnVmX3Z1bm1hcF9sb2NhbChzdHJ1Y3QgZG1hX2J1ZiAqZG1hYnVmLCBzdHJ1
Y3QNCj4+PiBkbWFfYnVmX21hcCAqbWFwKTsNCj4+PiAjZW5kaWYgLyogX19ETUFfQlVGX0hfXyAq
Lw0KPj4+IC0tDQo+Pj4gMi4yOS4yDQo+Pj4NCj4+PiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+PiBk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+Pj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwNCj4+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+PiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0
DQo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPj4NCj4NCj4tLQ0KPlRo
b21hcyBaaW1tZXJtYW5uDQo+R3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPlNVU0UgU29mdHdh
cmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPk1heGZlbGRzdHIuIDUsIDkwNDA5IE7DvHJuYmVy
ZywgR2VybWFueQ0KPihIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj5HZXNjaMOkZnRzZsO8aHJl
cjogRmVsaXggSW1lbmTDtnJmZmVyDQoNCg==
