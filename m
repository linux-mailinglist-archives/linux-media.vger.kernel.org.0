Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E78431331
	for <lists+linux-media@lfdr.de>; Fri, 31 May 2019 18:57:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726697AbfEaQ53 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 May 2019 12:57:29 -0400
Received: from twspam01.aspeedtech.com ([211.20.114.71]:23694 "EHLO
        twspam01.aspeedtech.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726518AbfEaQ53 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 May 2019 12:57:29 -0400
X-Greylist: delayed 1517 seconds by postgrey-1.27 at vger.kernel.org; Fri, 31 May 2019 12:57:26 EDT
Received: from twspam01.aspeedtech.com (localhost [127.0.0.2] (may be forged))
        by twspam01.aspeedtech.com with ESMTP id x4VGNb3q069578
        for <linux-media@vger.kernel.org>; Sat, 1 Jun 2019 00:23:37 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from mail.aspeedtech.com (twmbx02.aspeed.com [192.168.0.24])
        by twspam01.aspeedtech.com with ESMTP id x4VGNWqd069565;
        Sat, 1 Jun 2019 00:23:32 +0800 (GMT-8)
        (envelope-from ryan_chen@aspeedtech.com)
Received: from TWMBX01.aspeed.com (192.168.0.23) by TWMBX02.aspeed.com
 (192.168.0.24) with Microsoft SMTP Server (TLS) id 15.0.620.29; Sat, 1 Jun
 2019 00:32:05 +0800
Received: from TWMBX02.aspeed.com (192.168.0.24) by TWMBX01.aspeed.com
 (192.168.0.23) with Microsoft SMTP Server (TLS) id 15.0.620.29; Sat, 1 Jun
 2019 00:32:03 +0800
Received: from TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7]) by
 TWMBX02.aspeed.com ([fe80::997d:c0a7:f01f:e1a7%12]) with mapi id
 15.00.0620.020; Sat, 1 Jun 2019 00:32:03 +0800
From:   Ryan Chen <ryan_chen@aspeedtech.com>
To:     "'Jae Hyun Yoo'" <jae.hyun.yoo@linux.intel.com>,
        "'Eddie James'" <eajames@linux.vnet.ibm.com>,
        "'Eddie James'" <eajames@linux.ibm.com>,
        "'Mauro Carvalho Chehab'" <mchehab@kernel.org>,
        "'Joel Stanley'" <joel@jms.id.au>,
        "'Andrew Jeffery'" <andrew@aj.id.au>,
        "'Benjamin Herrenschmidt'" <benh@kernel.crashing.org>
CC:     "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Subject: RE: [PATCH v2 11/11] media: aspeed: add a workaround to fix a
 silicon bug
Thread-Topic: [PATCH v2 11/11] media: aspeed: add a workaround to fix a
 silicon bug
Thread-Index: AQHVEob6ZpZX2zggZUeTBw4ytvPq76aBpHqAgAA4c4CAAxSmAA==
Date:   Fri, 31 May 2019 16:32:03 +0000
Message-ID: <004c01d517ce$5fc22b00$1f468100$@aspeedtech.com>
References: <20190524231725.12320-1-jae.hyun.yoo@linux.intel.com>
 <20190524231725.12320-12-jae.hyun.yoo@linux.intel.com>
 <03a3cf74-3fd3-982e-ec37-014ed4a13b47@linux.vnet.ibm.com>
 <cd1814db-4892-bba0-027a-9f51cd49b9b5@linux.intel.com>
In-Reply-To: <cd1814db-4892-bba0-027a-9f51cd49b9b5@linux.intel.com>
Accept-Language: zh-TW, en-US
Content-Language: zh-TW
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Microsoft Outlook 16.0
Content-Type: text/plain; charset="utf-8"
Content-ID: <8A49D50AFDFD5A43A8BB755A3FDD8282@aspeedtech.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-DNSRBL: 
X-MAIL: twspam01.aspeedtech.com x4VGNWqd069565
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiANCj4gT24gNS8yNC8xOSA2OjE3IFBNLCBKYWUgSHl1biBZb28gd3JvdGU6DQo+PiBBU1QyNTAw
IHNpbGljb24gcmV2aXNpb24gQTEgYW5kIEEyIGhhdmUgYSBzaWxpY29uIGJ1ZyB3aGljaCBjYXVz
ZXMgDQo+PiBleHRyZW1seSBsb25nIGNhcHR1cmluZyB0aW1lIG9uIHNwZWNpZmljIHJlc29sdXRp
b25zICgxNjgwIHdpZHRoKS4NCj4+IFRvIGZpeCB0aGUgYnVnLCB0aGlzIGNvbW1pdCBhZGp1c3Rz
IHRoZSBjYXB0dXJpbmcgd2luZG93IHJlZ2lzdGVyIA0KPj4gc2V0dGluZyB0byAxNzI4IGlmIGRl
dGVjdGVkIHdpZHRoIGlzIDE2ODAuIFRoZSBjb21wcmVzc2lvbiB3aW5kb3cgDQo+PiByZWdpc3Rl
ciBzZXR0aW5nIHdpbGwgYmUga2VwdCBhcyB0aGUgb3JpZ2luYWwgd2lkdGggc28gb3V0cHV0IHJl
c3VsdCANCj4+IHdpbGwgYmUgdGhlIHNhbWUuDQo+IA0KPiANCj4gVGhpcyBpcyBhIGJpdCBjdXJp
b3VzLCB3aHkgMTcyOCBpbiBwYXJ0aWN1bGFyPyBBbmQgd2hhdCBpcyB0aGUgDQo+IGJlaGF2aW9y
IG9mIHRoZSBWRSB3aGVuIHRoZSBjYXB0dXJlIHdpbmRvdyBpcyBsYXJnZXIgdGhhbiB0aGUgYWN0
dWFsIA0KPiBzb3VyY2UgcmVzb2x1dGlvbj8NCg0KPkZvciBhbiBleGFtcGxlLCBpZiByZXNvbHV0
aW9uIGlzIDE2ODB4MTA1MCwgY2FwdHVyaW5nIG9wZXJhdGlvbiB0YWtlcyB2ZXJ5IGxvbmcgdGlt
ZSBiZWNhdXNlIFZFIGhhcyB0aGUgc2lsaWNvbiBidWcuIFNvIHRoaXMgcGF0Y2ggYWRqdXN0cyB0
aGUgJ0NhcHR1cmUgV2luZG93JyByZWdpc3RlciBzbGlnaHRseSBsYXJnZXIgdGhhbiA+MTY4MCB0
byBhdm9pZCB0aGUgaXNzdWUuIEFzIGEgcmVzdWx0LCBzb3VyY2UgYnVmZmVyIHdpbGwgY29weSAx
NzI4eDEwNTAgZnJhbWVzIGZyb20gdGhlIG9yaWdpbmFsIHNjcmVlbiBidWZmZXIgYnV0IHRoZSBp
bWFnZSBpcyBzdGlsbCBoYXMgdmFsaWQgaW5mb3JtYXRpb24uDQo+QXMgdGhlIG5leHQgc3RlcCBp
biBjb21wcmVzc2lvbiBwaGFzZSwgaXQgd2lsbCBzZXQgdGhlICdDb21wcmVzc2lvbiBXaW5kb3cn
IHJlZ2lzdGVyIGFzICcxNjgweDEwNTAnIHNvIGl0IHdpbGwgY29tcHJlc3MgdXNpbmcgdGhlIG9y
aWdpbmFsIGltYWdlIHJlc29sdXRpb24gd2hpY2ggaXMgYSBjcm9wcGVkIGltYWdlIGZyb20gdGhl
ID4nMTcyOHgxMDUwJyBzb3VyY2UgYnVmZmVyLg0KDQo+WW91IGNhbiBjb21wYXJlIHJlc3VsdHMg
dXNpbmcgdGhlc2Ugc2hlbGwgY29tbWFuZHMgaW4gVWJ1bnR1IEdVSSBkZXNrdG9wLg0KDQo+JCB4
cmFuZHIgLS1uZXdtb2RlICIxNjgweDEwNTBfNjAuMDAiICAxNDYuMjUgIDE2ODAgMTc4NCAxOTYw
IDEyNDAgIDEwNTANCj4xMDUzIDEwNTkgMTA4OSAtaHN5bmMgK3ZzeW5jDQo+JCB4cmFuZHIgLS1h
ZGRtb2RlIFZHQS0xIDE2ODB4MTA1MF82MC4wMCAkIHhyYW5kciAtLW91dHB1dCBWR0EtMSAtLW1v
ZGUgMTY4MHgxMDUwXzYwLjAwDQoNCj5JJ20gYWxzbyBjdXJpb3VzIGFib3V0IHdoeSB0aGF0IGlz
IDE3MjguIEFjdHVhbGx5LCB0aGlzIHdvcmthcm91bmQgd2FzIHByb3ZpZGVkIGZyb20gdGhlIGNo
aXAgdmVuZG9yLCBBc3BlZWQsIGFuZCB0aGV5IHVzZSB0aGlzIGluIHRoZWlyIFNESyBjb2RlIHRv
by4gTGV0J3MgY2hlY2sgaXQgdG8gUnlhbi4NCg0KDQo+SGkgUnlhbiwNCg0KPkNhbiB5b3UgcGxl
YXNlIGV4cGxhaW4gd2h5IHRoYXQgaXMgMTcyOCBpbiBwYXJ0aWN1bGFyLg0KDQo+VGhhbmtzLA0K
PkphZQ0KDQpUaGF0IGhhdmUgdHdvIGZhY3Rvciwgb25lIGlzIGRhdGEgdG9vIGh1Z2UgY2F1c2Ug
dGhlIG1lbW9yeSBiYW5kd2lkdGggaXMgdG9vIGJ1c3kuICANClRoZSBvdGhlciBpcyB2Z2EgcmVz
b2x1dGlvbiB3aWR0aCBpcyBub3QgYWxpZ24gdG8gMzIgb3IgNjQgcGl4ZWxzICgzMmJwcCBvciAx
NmJwcCkuDQpUaG9zZSB3aWxsIGNhdXNlIGVuZ2luZSByZWFkIGxhdGVuY3kgdGltZSB0b28gbG9u
ZywgbWF5YmUgZW5naW5lIHdpbGwgaGFuZ2UuDQoNClJ5YW4NCg0KPiANCj4gVGhhbmtzLA0KPiAN
Cj4gRWRkaWUNCj4gDQo+IA0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IEphZSBIeXVuIFlvbyA8amFl
Lmh5dW4ueW9vQGxpbnV4LmludGVsLmNvbT4NCj4+IC0tLQ0KPj4gdjEgLT4gdjI6DQo+PiAgIE5l
dy4NCj4+DQo+PiAgIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vYXNwZWVkLXZpZGVvLmMgfCAyNiAN
Cj4+ICsrKysrKysrKysrKysrKysrKystLS0tLS0tDQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L21lZGlhL3BsYXRmb3JtL2FzcGVlZC12aWRlby5jDQo+PiBiL2RyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vYXNwZWVkLXZpZGVvLmMNCj4+IGluZGV4IGIwNWIwNzNiNjNiYy4uZjkzOTg5ZjUzMmQ2IDEw
MDY0NA0KPj4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQtdmlkZW8uYw0KPj4g
KysrIGIvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9hc3BlZWQtdmlkZW8uYw0KPj4gQEAgLTgyNCw4
ICs4MjQsMjcgQEAgc3RhdGljIHZvaWQgYXNwZWVkX3ZpZGVvX3NldF9yZXNvbHV0aW9uKHN0cnVj
dA0KPj4gYXNwZWVkX3ZpZGVvICp2aWRlbykNCj4+ICAgICAgIHN0cnVjdCB2NGwyX2J0X3RpbWlu
Z3MgKmFjdCA9ICZ2aWRlby0+YWN0aXZlX3RpbWluZ3M7DQo+PiAgICAgICB1bnNpZ25lZCBpbnQg
c2l6ZSA9IGFjdC0+d2lkdGggKiBhY3QtPmhlaWdodDsNCj4+ICsgICAgLyogU2V0IGNhcHR1cmUv
Y29tcHJlc3Npb24gZnJhbWUgc2l6ZXMgKi8NCj4+ICAgICAgIGFzcGVlZF92aWRlb19jYWxjX2Nv
bXByZXNzZWRfc2l6ZSh2aWRlbywgc2l6ZSk7DQo+PiArICAgIGlmICh2aWRlby0+YWN0aXZlX3Rp
bWluZ3Mud2lkdGggPT0gMTY4MCkgew0KPj4gKyAgICAgICAgLyoNCj4+ICsgICAgICAgICAqIFRo
aXMgaXMgYSB3b3JrYXJvdW5kIHRvIGZpeCBhIHNpbGljb24gYnVnIG9uIEExIGFuZCBBMg0KPj4g
KyAgICAgICAgICogcmV2aXNpb25zLiBTaW5jZSBpdCBkb2Vzbid0IGJyZWFrIGNhcHR1cmluZyBv
cGVyYXRpb24gb24gDQo+PiArQTANCj4+ICsgICAgICAgICAqIHJldmlzaW9uLCB1c2UgaXQgZm9y
IGFsbCByZXZpc2lvbnMgd2l0aG91dCBjaGVja2luZyB0aGUNCj4+ICsgICAgICAgICAqIHJldmlz
aW9uIElELg0KPj4gKyAgICAgICAgICovDQo+PiArICAgICAgICBhc3BlZWRfdmlkZW9fd3JpdGUo
dmlkZW8sIFZFX0NBUF9XSU5ET1csDQo+PiArICAgICAgICAgICAgICAgICAgIDE3MjggPDwgMTYg
fCBhY3QtPmhlaWdodCk7DQo+PiArICAgICAgICBzaXplICs9ICgxNzI4IC0gMTY4MCkgKiB2aWRl
by0+YWN0aXZlX3RpbWluZ3MuaGVpZ2h0Ow0KPj4gKyAgICB9IGVsc2Ugew0KPj4gKyAgICAgICAg
YXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9DQVBfV0lORE9XLA0KPj4gKyAgICAgICAgICAg
ICAgICAgICBhY3QtPndpZHRoIDw8IDE2IHwgYWN0LT5oZWlnaHQpOw0KPj4gKyAgICB9DQo+PiAr
ICAgIGFzcGVlZF92aWRlb193cml0ZSh2aWRlbywgVkVfQ09NUF9XSU5ET1csDQo+PiArICAgICAg
ICAgICAgICAgYWN0LT53aWR0aCA8PCAxNiB8IGFjdC0+aGVpZ2h0KTsNCj4+ICsgICAgYXNwZWVk
X3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9TUkNfU0NBTkxJTkVfT0ZGU0VULCBhY3QtPndpZHRoICog
DQo+PiArNCk7DQo+PiArDQo+PiAgICAgICAvKiBEb24ndCB1c2UgZGlyZWN0IG1vZGUgYmVsb3cg
MTAyNCB4IDc2OCAoaXJxcyBkb24ndCBmaXJlKSAqLw0KPj4gICAgICAgaWYgKHNpemUgPCBESVJF
Q1RfRkVUQ0hfVEhSRVNIT0xEKSB7DQo+PiAgICAgICAgICAgYXNwZWVkX3ZpZGVvX3dyaXRlKHZp
ZGVvLCBWRV9UR1NfMCwgQEAgLTg0MiwxMyArODYxLDYgQEAgDQo+PiBzdGF0aWMgdm9pZCBhc3Bl
ZWRfdmlkZW9fc2V0X3Jlc29sdXRpb24oc3RydWN0DQo+PiBhc3BlZWRfdmlkZW8gKnZpZGVvKQ0K
Pj4gICAgICAgICAgIGFzcGVlZF92aWRlb191cGRhdGUodmlkZW8sIFZFX0NUUkwsIDAsIA0KPj4g
VkVfQ1RSTF9ESVJFQ1RfRkVUQ0gpOw0KPj4gICAgICAgfQ0KPj4gLSAgICAvKiBTZXQgY2FwdHVy
ZS9jb21wcmVzc2lvbiBmcmFtZSBzaXplcyAqLw0KPj4gLSAgICBhc3BlZWRfdmlkZW9fd3JpdGUo
dmlkZW8sIFZFX0NBUF9XSU5ET1csDQo+PiAtICAgICAgICAgICAgICAgYWN0LT53aWR0aCA8PCAx
NiB8IGFjdC0+aGVpZ2h0KTsNCj4+IC0gICAgYXNwZWVkX3ZpZGVvX3dyaXRlKHZpZGVvLCBWRV9D
T01QX1dJTkRPVywNCj4+IC0gICAgICAgICAgICAgICBhY3QtPndpZHRoIDw8IDE2IHwgYWN0LT5o
ZWlnaHQpOw0KPj4gLSAgICBhc3BlZWRfdmlkZW9fd3JpdGUodmlkZW8sIFZFX1NSQ19TQ0FOTElO
RV9PRkZTRVQsIGFjdC0+d2lkdGggKiANCj4+IDQpOw0KPj4gLQ0KPj4gICAgICAgc2l6ZSAqPSA0
Ow0KPj4gICAgICAgaWYgKHNpemUgPT0gdmlkZW8tPnNyY3NbMF0uc2l6ZSAvIDIpIHsNCj4gDQo+
IA0K
