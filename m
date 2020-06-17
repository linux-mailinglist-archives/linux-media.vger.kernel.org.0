Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F28AC1FD3AB
	for <lists+linux-media@lfdr.de>; Wed, 17 Jun 2020 19:44:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726899AbgFQRnr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 17 Jun 2020 13:43:47 -0400
Received: from mga03.intel.com ([134.134.136.65]:37973 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726496AbgFQRnq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 17 Jun 2020 13:43:46 -0400
IronPort-SDR: fFczzC9lHuL3oA+hkXtO4YBhVZbdTnBKzBLmxD62U0GuluBIDl1QrSyIoKKpnWPL/8oUZb5Xpy
 Tyq8I7ELXSFA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2020 10:43:41 -0700
IronPort-SDR: KssePl707NL+g/0XryV7jrDcWNF5Zz0RRjreHnojgTajk+bksPVulyDBfGWIBKQfikc6CLTUhE
 TFRhgpH89zuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,523,1583222400"; 
   d="scan'208";a="309550149"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by fmsmga002.fm.intel.com with ESMTP; 17 Jun 2020 10:43:41 -0700
Received: from fmsmsx102.amr.corp.intel.com (10.18.124.200) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Wed, 17 Jun 2020 10:43:41 -0700
Received: from fmsmsx108.amr.corp.intel.com ([169.254.9.193]) by
 FMSMSX102.amr.corp.intel.com ([169.254.10.33]) with mapi id 14.03.0439.000;
 Wed, 17 Jun 2020 10:43:41 -0700
From:   "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To:     Charan Teja Kalla <charante@codeaurora.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "open list:DMA BUFFER SHARING FRAMEWORK" 
        <linux-media@vger.kernel.org>,
        DRI mailing list <dri-devel@lists.freedesktop.org>
CC:     Linaro MM SIG <linaro-mm-sig@lists.linaro.org>,
        "vinmenon@codeaurora.org" <vinmenon@codeaurora.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: RE: [PATCH] dmabuf: use spinlock to access dmabuf->name
Thread-Topic: [PATCH] dmabuf: use spinlock to access dmabuf->name
Thread-Index: AQHWQWvsYI6eTL2/6UmOYEBVkPsE9KjbRi5AgAADWlCAAYoMgP//5V2g
Date:   Wed, 17 Jun 2020 17:43:38 +0000
Message-ID: <14063C7AD467DE4B82DEDB5C278E866301154B8339@FMSMSX108.amr.corp.intel.com>
References: <316a5cf9-ca71-6506-bf8b-e79ded9055b2@codeaurora.org>
 <14063C7AD467DE4B82DEDB5C278E8663010F365EF5@fmsmsx107.amr.corp.intel.com>
 <14063C7AD467DE4B82DEDB5C278E8663010F365F7D@fmsmsx107.amr.corp.intel.com>
 <5b960c9a-ef9d-b43d-716d-113efc793fe5@codeaurora.org>
In-Reply-To: <5b960c9a-ef9d-b43d-716d-113efc793fe5@codeaurora.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.2.0.6
dlp-reaction: no-action
x-originating-ip: [10.1.200.107]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogY2hhcmFudGU9Y29kZWF1cm9yYS5v
cmdAbWcuY29kZWF1cm9yYS5vcmcNCj48Y2hhcmFudGU9Y29kZWF1cm9yYS5vcmdAbWcuY29kZWF1
cm9yYS5vcmc+IE9uIEJlaGFsZiBPZiBDaGFyYW4gVGVqYQ0KPkthbGxhDQo+U2VudDogV2VkbmVz
ZGF5LCBKdW5lIDE3LCAyMDIwIDI6MjkgQU0NCj5UbzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVs
LmoucnVobEBpbnRlbC5jb20+OyBTdW1pdCBTZW13YWwNCj48c3VtaXQuc2Vtd2FsQGxpbmFyby5v
cmc+OyBvcGVuIGxpc3Q6RE1BIEJVRkZFUiBTSEFSSU5HIEZSQU1FV09SSw0KPjxsaW51eC1tZWRp
YUB2Z2VyLmtlcm5lbC5vcmc+OyBEUkkgbWFpbGluZyBsaXN0IDxkcmktDQo+ZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnPg0KPkNjOiBMaW5hcm8gTU0gU0lHIDxsaW5hcm8tbW0tc2lnQGxpc3Rz
LmxpbmFyby5vcmc+Ow0KPnZpbm1lbm9uQGNvZGVhdXJvcmEub3JnOyBMS01MIDxsaW51eC1rZXJu
ZWxAdmdlci5rZXJuZWwub3JnPjsNCj5zdGFibGVAdmdlci5rZXJuZWwub3JnDQo+U3ViamVjdDog
UmU6IFtQQVRDSF0gZG1hYnVmOiB1c2Ugc3BpbmxvY2sgdG8gYWNjZXNzIGRtYWJ1Zi0+bmFtZQ0K
Pg0KPlRoYW5rcyBNaWNoYWVsIGZvciB0aGUgY29tbWVudHMuLg0KPg0KPk9uIDYvMTYvMjAyMCA3
OjI5IFBNLCBSdWhsLCBNaWNoYWVsIEogd3JvdGU6DQo+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdl
LS0tLS0NCj4+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4gUnVobCwgTWljaGFlbCBKDQo+Pj4gU2VudDog
VHVlc2RheSwgSnVuZSAxNiwgMjAyMCA5OjUxIEFNDQo+Pj4gVG86IENoYXJhbiBUZWphIEthbGxh
IDxjaGFyYW50ZUBjb2RlYXVyb3JhLm9yZz47IFN1bWl0IFNlbXdhbA0KPj4+IDxzdW1pdC5zZW13
YWxAbGluYXJvLm9yZz47IG9wZW4gbGlzdDpETUEgQlVGRkVSIFNIQVJJTkcNCj5GUkFNRVdPUksN
Cj4+PiA8bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnPjsgRFJJIG1haWxpbmcgbGlzdCA8ZHJp
LQ0KPj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4NCj4+PiBDYzogTGluYXJvIE1NIFNJ
RyA8bGluYXJvLW1tLXNpZ0BsaXN0cy5saW5hcm8ub3JnPjsNCj4+PiB2aW5tZW5vbkBjb2RlYXVy
b3JhLm9yZzsgTEtNTCA8bGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZz47DQo+Pj4gc3RhYmxl
QHZnZXIua2VybmVsLm9yZw0KPj4+IFN1YmplY3Q6IFJFOiBbUEFUQ0hdIGRtYWJ1ZjogdXNlIHNw
aW5sb2NrIHRvIGFjY2VzcyBkbWFidWYtPm5hbWUNCj4+Pg0KPj4+PiAtLS0tLU9yaWdpbmFsIE1l
c3NhZ2UtLS0tLQ0KPj4+PiBGcm9tOiBkcmktZGV2ZWwgPGRyaS1kZXZlbC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+Pj4+IENoYXJhbiBUZWphIEthbGxhDQo+
Pj4+IFNlbnQ6IFRodXJzZGF5LCBKdW5lIDExLCAyMDIwIDk6NDAgQU0NCj4+Pj4gVG86IFN1bWl0
IFNlbXdhbCA8c3VtaXQuc2Vtd2FsQGxpbmFyby5vcmc+OyBvcGVuIGxpc3Q6RE1BIEJVRkZFUg0K
Pj4+PiBTSEFSSU5HIEZSQU1FV09SSyA8bGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnPjsgRFJJ
IG1haWxpbmcgbGlzdA0KPjxkcmktDQo+Pj4+IGRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4N
Cj4+Pj4gQ2M6IExpbmFybyBNTSBTSUcgPGxpbmFyby1tbS1zaWdAbGlzdHMubGluYXJvLm9yZz47
DQo+Pj4+IHZpbm1lbm9uQGNvZGVhdXJvcmEub3JnOyBMS01MIDxsaW51eC1rZXJuZWxAdmdlci5r
ZXJuZWwub3JnPjsNCj4+Pj4gc3RhYmxlQHZnZXIua2VybmVsLm9yZw0KPj4+PiBTdWJqZWN0OiBb
UEFUQ0hdIGRtYWJ1ZjogdXNlIHNwaW5sb2NrIHRvIGFjY2VzcyBkbWFidWYtPm5hbWUNCj4+Pj4N
Cj4+Pj4gVGhlcmUgZXhpc3RzIGEgc2xlZXAtd2hpbGUtYXRvbWljIGJ1ZyB3aGlsZSBhY2Nlc3Np
bmcgdGhlIGRtYWJ1Zi0+bmFtZQ0KPj4+PiB1bmRlciBtdXRleCBpbiB0aGUgZG1hYnVmZnNfZG5h
bWUoKS4gVGhpcyBpcyBjYXVzZWQgZnJvbSB0aGUgU0VMaW51eA0KPj4+PiBwZXJtaXNzaW9ucyBj
aGVja3Mgb24gYSBwcm9jZXNzIHdoZXJlIGl0IHRyaWVzIHRvIHZhbGlkYXRlIHRoZSBpbmhlcml0
ZWQNCj4+Pj4gZmlsZXMgZnJvbSBmb3JrKCkgYnkgdHJhdmVyc2luZyB0aGVtIHRocm91Z2ggaXRl
cmF0ZV9mZCgpICh3aGljaA0KPj4+PiB0cmF2ZXJzZSBmaWxlcyB1bmRlciBzcGluX2xvY2spIGFu
ZCBjYWxsDQo+Pj4+IG1hdGNoX2ZpbGUoc2VjdXJpdHkvc2VsaW51eC9ob29rcy5jKSB3aGVyZSB0
aGUgcGVybWlzc2lvbiBjaGVja3MNCj5oYXBwZW4uDQo+Pj4+IFRoaXMgYXVkaXQgaW5mb3JtYXRp
b24gaXMgbG9nZ2VkIHVzaW5nIGR1bXBfY29tbW9uX2F1ZGl0X2RhdGEoKQ0KPndoZXJlIGl0DQo+
Pj4+IGNhbGxzIGRfcGF0aCgpIHRvIGdldCB0aGUgZmlsZSBwYXRoIG5hbWUuIElmIHRoZSBmaWxl
IGNoZWNrIGhhcHBlbiBvbg0KPj4+PiB0aGUgZG1hYnVmJ3MgZmQsIHRoZW4gaXQgZW5kcyB1cCBp
biAtPmRtYWJ1ZmZzX2RuYW1lKCkgYW5kIHVzZSBtdXRleA0KPnRvDQo+Pj4+IGFjY2VzcyBkbWFi
dWYtPm5hbWUuIFRoZSBmbG93IHdpbGwgYmUgbGlrZSBiZWxvdzoNCj4+Pj4gZmx1c2hfdW5hdXRo
b3JpemVkX2ZpbGVzKCkNCj4+Pj4gIGl0ZXJhdGVfZmQoKQ0KPj4+PiAgICBzcGluX2xvY2soKSAt
LT4gU3RhcnQgb2YgdGhlIGF0b21pYyBzZWN0aW9uLg0KPj4+PiAgICAgIG1hdGNoX2ZpbGUoKQ0K
Pj4+PiAgICAgICAgZmlsZV9oYXNfcGVybSgpDQo+Pj4+ICAgICAgICAgIGF2Y19oYXNfcGVybSgp
DQo+Pj4+ICAgICAgICAgICAgYXZjX2F1ZGl0KCkNCj4+Pj4gICAgICAgICAgICAgIHNsb3dfYXZj
X2F1ZGl0KCkNCj4+Pj4gCSAgICAgICAgY29tbW9uX2xzbV9hdWRpdCgpDQo+Pj4+IAkJICBkdW1w
X2NvbW1vbl9hdWRpdF9kYXRhKCkNCj4+Pj4gCQkgICAgYXVkaXRfbG9nX2RfcGF0aCgpDQo+Pj4+
IAkJICAgICAgZF9wYXRoKCkNCj4+Pj4gICAgICAgICAgICAgICAgICAgICAgICBkbWFidWZmc19k
bmFtZSgpDQo+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgICBtdXRleF9sb2NrKCktLT4gU2xl
ZXAgd2hpbGUgYXRvbWljLg0KPj4+Pg0KPj4+PiBDYWxsIHRyYWNlIGNhcHR1cmVkIChvbiA0LjE5
IGtlcm5lbHMpIGlzIGJlbG93Og0KPj4+PiBfX19taWdodF9zbGVlcCsweDIwNC8weDIwOA0KPj4+
PiBfX21pZ2h0X3NsZWVwKzB4NTAvMHg4OA0KPj4+PiBfX211dGV4X2xvY2tfY29tbW9uKzB4NWMv
MHgxMDY4DQo+Pj4+IF9fbXV0ZXhfbG9ja19jb21tb24rMHg1Yy8weDEwNjgNCj4+Pj4gbXV0ZXhf
bG9ja19uZXN0ZWQrMHg0MC8weDUwDQo+Pj4+IGRtYWJ1ZmZzX2RuYW1lKzB4YTAvMHgxNzANCj4+
Pj4gZF9wYXRoKzB4ODQvMHgyOTANCj4+Pj4gYXVkaXRfbG9nX2RfcGF0aCsweDc0LzB4MTMwDQo+
Pj4+IGNvbW1vbl9sc21fYXVkaXQrMHgzMzQvMHg2ZTgNCj4+Pj4gc2xvd19hdmNfYXVkaXQrMHhi
OC8weGY4DQo+Pj4+IGF2Y19oYXNfcGVybSsweDE1NC8weDIxOA0KPj4+PiBmaWxlX2hhc19wZXJt
KzB4NzAvMHgxODANCj4+Pj4gbWF0Y2hfZmlsZSsweDYwLzB4NzgNCj4+Pj4gaXRlcmF0ZV9mZCsw
eDEyOC8weDE2OA0KPj4+PiBzZWxpbnV4X2Jwcm1fY29tbWl0dGluZ19jcmVkcysweDE3OC8weDI0
OA0KPj4+PiBzZWN1cml0eV9icHJtX2NvbW1pdHRpbmdfY3JlZHMrMHgzMC8weDQ4DQo+Pj4+IGlu
c3RhbGxfZXhlY19jcmVkcysweDFjLzB4NjgNCj4+Pj4gbG9hZF9lbGZfYmluYXJ5KzB4M2E0LzB4
MTRlMA0KPj4+PiBzZWFyY2hfYmluYXJ5X2hhbmRsZXIrMHhiMC8weDFlMA0KPj4+Pg0KPj4+PiBT
bywgdXNlIHNwaW5sb2NrIHRvIGFjY2VzcyBkbWFidWYtPm5hbWUgdG8gYXZvaWQgc2xlZXAtd2hp
bGUtYXRvbWljLg0KPj4+Pg0KPj4+PiBDYzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+IFs1LjMr
XQ0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBDaGFyYW4gVGVqYSBSZWRkeSA8Y2hhcmFudGVAY29kZWF1
cm9yYS5vcmc+DQo+Pj4+IC0tLQ0KPj4+PiBkcml2ZXJzL2RtYS1idWYvZG1hLWJ1Zi5jIHwgMTMg
KysrKysrKy0tLS0tLQ0KPj4+PiBpbmNsdWRlL2xpbnV4L2RtYS1idWYuaCAgIHwgIDEgKw0KPj4+
PiAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkNCj4+Pj4N
Cj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMgYi9kcml2ZXJzL2Rt
YS1idWYvZG1hLWJ1Zi5jDQo+Pj4+IGluZGV4IDAxY2UxMjUuLjJlMDQ1NmMgMTAwNjQ0DQo+Pj4+
IC0tLSBhL2RyaXZlcnMvZG1hLWJ1Zi9kbWEtYnVmLmMNCj4+Pj4gKysrIGIvZHJpdmVycy9kbWEt
YnVmL2RtYS1idWYuYw0KPj4+PiBAQCAtNDUsMTAgKzQ1LDEwIEBAIHN0YXRpYyBjaGFyICpkbWFi
dWZmc19kbmFtZShzdHJ1Y3QgZGVudHJ5DQo+KmRlbnRyeSwNCj4+Pj4gY2hhciAqYnVmZmVyLCBp
bnQgYnVmbGVuKQ0KPj4+PiAJc2l6ZV90IHJldCA9IDA7DQo+Pj4+DQo+Pj4+IAlkbWFidWYgPSBk
ZW50cnktPmRfZnNkYXRhOw0KPj4+PiAtCWRtYV9yZXN2X2xvY2soZG1hYnVmLT5yZXN2LCBOVUxM
KTsNCj4+Pj4gKwlzcGluX2xvY2soJmRtYWJ1Zi0+bmFtZV9sb2NrKTsNCj4+Pj4gCWlmIChkbWFi
dWYtPm5hbWUpDQo+Pj4+IAkJcmV0ID0gc3RybGNweShuYW1lLCBkbWFidWYtPm5hbWUsIERNQV9C
VUZfTkFNRV9MRU4pOw0KPj4+PiAtCWRtYV9yZXN2X3VubG9jayhkbWFidWYtPnJlc3YpOw0KPj4+
PiArCXNwaW5fdW5sb2NrKCZkbWFidWYtPm5hbWVfbG9jayk7DQo+Pj4NCj4+PiBJIGFtIG5vdCBy
ZWFsbHkgY2xlYXIgb24gd2h5IHlvdSBuZWVkIHRoaXMgbG9jay4NCj4+Pg0KPj4+IElmIG5hbWUg
PT0gTlVMTCB5b3UgaGF2ZSBubyBpc3N1ZXMuDQo+Pj4gSWYgbmFtZSBpcyByZWFsLCB5b3UgaGF2
ZSBubyBpc3N1ZXMuDQo+DQo+WWVhaCwgaWRlYWwgY2FzZXMuLi4NCj4NCj4+Pg0KPj4+IElmIG5h
bWUgaXMgZnJlZWQgeW91IHdpbGwgY29weSBnYXJiYWdlLCBidXQgdGhlIG9ubHkgd2F5DQo+Pj4g
Zm9yIHRoYXQgdG8gaGFwcGVuIGlzIHRoYXQgX3NldF9uYW1lIG9yIF9yZWxlYXNlIGhhdmUgdG8g
YmUgY2FsbGVkDQo+Pj4gYXQganVzdCB0aGUgcmlnaHQgdGltZS4NCj4+Pg0KPj4+IEFuZCB0aGUg
YWJvdmUgd291bGQgcHJvYmFibHkgb25seSBiZSBhbiBpc3N1ZSBpZiB0aGUgc2V0X25hbWUNCj4+
PiB3YXMgY2FsbGVkLCBzbyB5b3Ugd2lsbCBnZXQgTlVMTCBvciBhIHJlYWwgbmFtZS4NCj4NCj5B
bmQgdGhlcmUgZXhpc3RzIGEgdXNlLWFmdGVyLWZyZWUgdG8gYXZvaWQgd2hpY2ggcmVxdWlyZXMg
dGhlIGxvY2suIFNheQ0KPnRoYXQgbWVtY3B5KCkgaW4gZG1hYnVmZnNfZG5hbWUgaXMgaW4gcHJv
Z3Jlc3MgYW5kIGluIHBhcmFsbGVsIF9zZXRfbmFtZQ0KPndpbGwgZnJlZSB0aGUgc2FtZSBidWZm
ZXIgdGhhdCBtZW1jcHkgaXMgb3BlcmF0aW5nIG9uLg0KDQpIbW0uLi4gIEkgY2FuIHNlZSB0aGF0
Lg0KDQpIb3dldmVyLCBub3RlIHRoYXQgaW4gZG1hX2J1Zl9zZXRfbmFtZSwgeW91IGNhbm5vdCB1
c2UgdGhlIHNwaW5sb2NrDQp0byBwcm90ZWN0IHRoZSBkbWFfYnVmLT5hdHRhY2hlbWVudHMgbGlz
dC4NCg0KSSB0aGluayB5b3UgbmVlZCB0byBkbyB0aGlzOg0KDQoJZG1hX3Jlc3ZfbG9jayhkbWFi
dWYtPnJlc3YsIE5VTEwpOw0KIAlpZiAoIWxpc3RfZW1wdHkoJmRtYWJ1Zi0+YXR0YWNobWVudHMp
KSB7DQogCQlyZXQgPSAtRUJVU1k7DQogCQlrZnJlZShuYW1lKTsNCiAgICAgICAgICAgICAgfQ0K
CWRtYV9yZXN2X3VubG9jayhkbWFidWYtPnJlc3YsIE5VTEwpOw0KCWlmIChyZXQpDQoJCXJldHVy
biByZXQ7DQoNCglzcGlubG9jayhuYW1fbG9jaykNCgluYW1lc3R1ZmY7DQoJc3BpbnVubG9jaw0K
DQoJcmV0dXJuIDA7DQoNCk1pa2UNCg0KPj4+IElzIHRoZXJlIGEgcmVhc29uIGZvciB0aGUgbG9j
ayBoZXJlPw0KPj4+DQo+Pj4gTWlrZQ0KPj4NCj4+IE1heWJlIGRtYWJ1Zi0+bmFtZSA9IE5VTEwg
YWZ0ZXIgdGhlIGtmcmVlKGRtYWJ1Zi0+bmFtZSkgaW46DQo+Pg0KPj4gZG1hX2J1Zl9yZWxlYXNl
KCkNCj4+DQo+PiBXb3VsZCBiZSBzdWZmaWNpZW50Pw0KPg0KPkkgZG9uJ3QgdGhpbmsgdGhhdCB3
ZSB3aWxsIGFjY2VzcyB0aGUgJ2RtYWJ1ZicodGh1cyBkbWFidWYtPm5hbWUpIG9uY2UNCj5pdCBp
cyBpbiB0aGUgZG1hX2J1Zl9yZWxlYXNlKCkuIFNvLCBzZXR0aW5nIHRoZSBOVUxMIGluIHRoZSBf
cmVsZWFzZSgpDQo+aXMgbm90IHJlcXVpcmVkIGF0IGFsbC4NCj4NCj4+DQo+PiBNDQo+Pj4+IAly
ZXR1cm4gZHluYW1pY19kbmFtZShkZW50cnksIGJ1ZmZlciwgYnVmbGVuLCAiLyVzOiVzIiwNCj4+
Pj4gCQkJICAgICBkZW50cnktPmRfbmFtZS5uYW1lLCByZXQgPiAwID8gbmFtZSA6ICIiKTsNCj4+
Pj4gQEAgLTMzNSw3ICszMzUsNyBAQCBzdGF0aWMgbG9uZyBkbWFfYnVmX3NldF9uYW1lKHN0cnVj
dCBkbWFfYnVmDQo+Pj4+ICpkbWFidWYsIGNvbnN0IGNoYXIgX191c2VyICpidWYpDQo+Pj4+IAlp
ZiAoSVNfRVJSKG5hbWUpKQ0KPj4+PiAJCXJldHVybiBQVFJfRVJSKG5hbWUpOw0KPj4+Pg0KPj4+
PiAtCWRtYV9yZXN2X2xvY2soZG1hYnVmLT5yZXN2LCBOVUxMKTsNCj4+Pj4gKwlzcGluX2xvY2so
JmRtYWJ1Zi0+bmFtZV9sb2NrKTsNCj4+Pj4gCWlmICghbGlzdF9lbXB0eSgmZG1hYnVmLT5hdHRh
Y2htZW50cykpIHsNCj4+Pj4gCQlyZXQgPSAtRUJVU1k7DQo+Pj4+IAkJa2ZyZWUobmFtZSk7DQo+
Pj4+IEBAIC0zNDUsNyArMzQ1LDcgQEAgc3RhdGljIGxvbmcgZG1hX2J1Zl9zZXRfbmFtZShzdHJ1
Y3QgZG1hX2J1Zg0KPj4+PiAqZG1hYnVmLCBjb25zdCBjaGFyIF9fdXNlciAqYnVmKQ0KPj4+PiAJ
ZG1hYnVmLT5uYW1lID0gbmFtZTsNCj4+Pj4NCj4+Pj4gb3V0X3VubG9jazoNCj4+Pj4gLQlkbWFf
cmVzdl91bmxvY2soZG1hYnVmLT5yZXN2KTsNCj4+Pj4gKwlzcGluX3VubG9jaygmZG1hYnVmLT5u
YW1lX2xvY2spOw0KPj4+PiAJcmV0dXJuIHJldDsNCj4+Pj4gfQ0KPj4+Pg0KPj4+PiBAQCAtNDA1
LDEwICs0MDUsMTAgQEAgc3RhdGljIHZvaWQgZG1hX2J1Zl9zaG93X2ZkaW5mbyhzdHJ1Y3QNCj5z
ZXFfZmlsZQ0KPj4+PiAqbSwgc3RydWN0IGZpbGUgKmZpbGUpDQo+Pj4+IAkvKiBEb24ndCBjb3Vu
dCB0aGUgdGVtcG9yYXJ5IHJlZmVyZW5jZSB0YWtlbiBpbnNpZGUgcHJvY2ZzIHNlcV9zaG93DQo+
Pj4+ICovDQo+Pj4+IAlzZXFfcHJpbnRmKG0sICJjb3VudDpcdCVsZFxuIiwgZmlsZV9jb3VudChk
bWFidWYtPmZpbGUpIC0gMSk7DQo+Pj4+IAlzZXFfcHJpbnRmKG0sICJleHBfbmFtZTpcdCVzXG4i
LCBkbWFidWYtPmV4cF9uYW1lKTsNCj4+Pj4gLQlkbWFfcmVzdl9sb2NrKGRtYWJ1Zi0+cmVzdiwg
TlVMTCk7DQo+Pj4+ICsJc3Bpbl9sb2NrKCZkbWFidWYtPm5hbWVfbG9jayk7DQo+Pj4+IAlpZiAo
ZG1hYnVmLT5uYW1lKQ0KPj4+PiAJCXNlcV9wcmludGYobSwgIm5hbWU6XHQlc1xuIiwgZG1hYnVm
LT5uYW1lKTsNCj4+Pj4gLQlkbWFfcmVzdl91bmxvY2soZG1hYnVmLT5yZXN2KTsNCj4+Pj4gKwlz
cGluX3VubG9jaygmZG1hYnVmLT5uYW1lX2xvY2spOw0KPj4+PiB9DQo+Pj4+DQo+Pj4+IHN0YXRp
YyBjb25zdCBzdHJ1Y3QgZmlsZV9vcGVyYXRpb25zIGRtYV9idWZfZm9wcyA9IHsNCj4+Pj4gQEAg
LTU0Niw2ICs1NDYsNyBAQCBzdHJ1Y3QgZG1hX2J1ZiAqZG1hX2J1Zl9leHBvcnQoY29uc3Qgc3Ry
dWN0DQo+Pj4+IGRtYV9idWZfZXhwb3J0X2luZm8gKmV4cF9pbmZvKQ0KPj4+PiAJZG1hYnVmLT5z
aXplID0gZXhwX2luZm8tPnNpemU7DQo+Pj4+IAlkbWFidWYtPmV4cF9uYW1lID0gZXhwX2luZm8t
PmV4cF9uYW1lOw0KPj4+PiAJZG1hYnVmLT5vd25lciA9IGV4cF9pbmZvLT5vd25lcjsNCj4+Pj4g
KwlzcGluX2xvY2tfaW5pdCgmZG1hYnVmLT5uYW1lX2xvY2spOw0KPj4+PiAJaW5pdF93YWl0cXVl
dWVfaGVhZCgmZG1hYnVmLT5wb2xsKTsNCj4+Pj4gCWRtYWJ1Zi0+Y2JfZXhjbC5wb2xsID0gZG1h
YnVmLT5jYl9zaGFyZWQucG9sbCA9ICZkbWFidWYtPnBvbGw7DQo+Pj4+IAlkbWFidWYtPmNiX2V4
Y2wuYWN0aXZlID0gZG1hYnVmLT5jYl9zaGFyZWQuYWN0aXZlID0gMDsNCj4+Pj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvZG1hLWJ1Zi5oIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgNCj4+
Pj4gaW5kZXggYWIwYzE1Ni4uOTMxMDhmZCAxMDA2NDQNCj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51
eC9kbWEtYnVmLmgNCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9kbWEtYnVmLmgNCj4+Pj4gQEAg
LTMxMSw2ICszMTEsNyBAQCBzdHJ1Y3QgZG1hX2J1ZiB7DQo+Pj4+IAl2b2lkICp2bWFwX3B0cjsN
Cj4+Pj4gCWNvbnN0IGNoYXIgKmV4cF9uYW1lOw0KPj4+PiAJY29uc3QgY2hhciAqbmFtZTsNCj4+
Pj4gKwlzcGlubG9ja190IG5hbWVfbG9jazsNCj4+Pj4gCXN0cnVjdCBtb2R1bGUgKm93bmVyOw0K
Pj4+PiAJc3RydWN0IGxpc3RfaGVhZCBsaXN0X25vZGU7DQo+Pj4+IAl2b2lkICpwcml2Ow0KPj4+
PiAtLQ0KPj4+PiBUaGUgUXVhbGNvbW0gSW5ub3ZhdGlvbiBDZW50ZXIsIEluYy4gaXMgYSBtZW1i
ZXIgb2YgdGhlIENvZGUgQXVyb3JhDQo+Pj4+IEZvcnVtLCBhIExpbnV4IEZvdW5kYXRpb24gQ29s
bGFib3JhdGl2ZSBQcm9qZWN0DQo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+Pj4+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QNCj4+Pj4gZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZw0KPj4+PiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPj4+IF9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+Pj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdA0K
Pj4+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4+PiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA0KPg0KPi0tDQo+VGhlIFF1
YWxjb21tIElubm92YXRpb24gQ2VudGVyLCBJbmMuIGlzIGEgbWVtYmVyIG9mIHRoZSBDb2RlIEF1
cm9yYQ0KPkZvcnVtLCBhIExpbnV4IEZvdW5kYXRpb24gQ29sbGFib3JhdGl2ZSBQcm9qZWN0DQo=
