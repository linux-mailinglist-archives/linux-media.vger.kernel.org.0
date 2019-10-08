Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFEB2CFC10
	for <lists+linux-media@lfdr.de>; Tue,  8 Oct 2019 16:12:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbfJHOM2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 8 Oct 2019 10:12:28 -0400
Received: from mail-oln040092068048.outbound.protection.outlook.com ([40.92.68.48]:23129
        "EHLO EUR02-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725795AbfJHOM2 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Tue, 8 Oct 2019 10:12:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NlPExkRgL6GgtBUt6tAKl1E7DS6OayhU6PwmnrLtQklwq+w4XaQ/CQmVo0wtnC6fegmcVWrQ4bJxpD7sVZkOgm+NjTYoRYMtar1bESO6el0bTUfmHcL0hCvymSvY9ThJfLpNaFT8uDUCKi4ty/DJeLQ4s3IeNTcXgWJLI9GNrn941EfWbgiMAYIKrNGr7cJ8g9+PbsuHce/fv61+QkWwWqL0pncUmOqKxGimuFiHfzI8RJOL9vQlxtULqFkwcW8iDqzGnpLIz+WfI6EM5GzcXO/LjCmOdbNus38w15aTg1SVcorS30U/jw3uJLkXUAX4YlXxGb9fq64dU3BX4R3fIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlZhZ6DUvhbUmRfdizhoGIvpuA2o4G6ZArFrtTIvP8k=;
 b=iEFDleA5xvbA+gyE1lLHi9WwaOTSRh5hBpW0QpuaeGs4ZLlncul2OlSuCUEl1PhYv4+RCSaLnAH/y0nx29bQCkq8Ex+kS8E0+DrivTD6+vXAxjUDML5VHrc0YPBUGMjYSwaRvZZu2LHyBvwd/mfG6Gi4BoRHMdHCtIYr1o2d9iapG4zIvow0kip7Q3IXoSRmrvX3i7bzJxHcDD2FUFE6jWMYXaN7PXzhPGID0eKidMmTyLp9Ok2TERr1i6IBJvsN7DXqE+7bGnZbaocbq1y2GdrF+kqYiXHG2ZfyxV2FeA2W5NUP9Fh07/k6tXWOAOPIYY6UZwk+IV5nYtzh89jjDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VE1EUR02FT011.eop-EUR02.prod.protection.outlook.com
 (10.152.12.60) by VE1EUR02HT132.eop-EUR02.prod.protection.outlook.com
 (10.152.13.79) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2327.20; Tue, 8 Oct
 2019 14:12:20 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com (10.152.12.51) by
 VE1EUR02FT011.mail.protection.outlook.com (10.152.12.150) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2327.20 via Frontend Transport; Tue, 8 Oct 2019 14:12:20 +0000
Received: from HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8]) by HE1PR06MB4011.eurprd06.prod.outlook.com
 ([fe80::5c5a:1160:a2e0:43d8%4]) with mapi id 15.20.2305.023; Tue, 8 Oct 2019
 14:12:20 +0000
From:   Jonas Karlman <jonas@kwiboo.se>
To:     Tomasz Figa <tfiga@chromium.org>
CC:     Ezequiel Garcia <ezequiel@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Heiko Stuebner <heiko@sntech.de>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Boris Brezillon <boris.brezillon@collabora.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        "fbuergisser@chromium.org" <fbuergisser@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
Thread-Topic: [PATCH v2 for 5.4 2/4] media: hantro: Fix H264 max frmsize
 supported on RK3288
Thread-Index: AQHVfTc2RvTWvQQ6Z06gn22kTgvMXqdQN9WAgAARyQCAAEYFgIAAMH0AgAAFHICAAAUdgA==
Date:   Tue, 8 Oct 2019 14:12:20 +0000
Message-ID: <HE1PR06MB4011B897EA5497659A19BCC6AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
References: <20191007174505.10681-1-ezequiel@collabora.com>
 <20191007174505.10681-3-ezequiel@collabora.com>
 <CAAFQd5BNu2ea3ei_imHmEwmdna0+iiSbQSv_SBsdHfP4Uh1h4Q@mail.gmail.com>
 <HE1PR06MB4011EC9E93ECBB6773252247AC9A0@HE1PR06MB4011.eurprd06.prod.outlook.com>
 <CAAFQd5CWoAP1psrEW6bVMkRmhFeTvFKtDSLjT7nefc2YiFovqQ@mail.gmail.com>
 <CAAFQd5AYCiKcA9pGc44L3gGHLPx6iMSb7KywkO8OqVv4gS8KvQ@mail.gmail.com>
 <CAAFQd5AQXGX_2gmKLfymH5mLG-uVh-v+XXtGXzbfzYzVVV42mA@mail.gmail.com>
In-Reply-To: <CAAFQd5AQXGX_2gmKLfymH5mLG-uVh-v+XXtGXzbfzYzVVV42mA@mail.gmail.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HE1PR0802CA0024.eurprd08.prod.outlook.com
 (2603:10a6:3:bd::34) To HE1PR06MB4011.eurprd06.prod.outlook.com
 (2603:10a6:7:9c::32)
x-incomingtopheadermarker: OriginalChecksum:D9264EE44C9BBA1C3C6011B3BCA1A6C674403C17A193C976153EB9A155F18205;UpperCasedChecksum:EBE47D720E54C1965C40B6989CBEE2D73E4BF2991CD66B099D8DC625E8E616F6;SizeAsReceived:8553;Count:50
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn:  [nYzaafeuMhtjNOccHZLbNFzcPtR56TrI]
x-microsoft-original-message-id: <a13d9d30-9c5d-2512-9a25-0b42d5495f49@kwiboo.se>
x-ms-publictraffictype: Email
x-incomingheadercount: 50
x-eopattributedmessage: 0
x-ms-traffictypediagnostic: VE1EUR02HT132:
x-ms-exchange-purlcount: 2
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: rkI+XNDLm1r0OjqK9cXlOLRMEroubczgD6zEoq4J7nbyD+mOxoZe1Q9jAEbNwmK4adO19M0nNghcTbqmuyWCm75dfBOTYsajeuOkO9wIqw6HC5kjqBTk6pO9ZhwMogvRe79ELYdfoq2//XjrEDpZt4jIgoJ+mSMqj1WJhuqEnWjwqNWwfM0UyZh6hWpzdz73nPHtifZ33wpZAJZ/uP4OXa69kYIvuinQbYTifyFzNIw=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="utf-8"
Content-ID: <9ED18B5529866441AD1264E8026A38ED@eurprd06.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bdffa7d-e86e-472b-199f-08d74bf98824
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Oct 2019 14:12:20.2799
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1EUR02HT132
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gMjAxOS0xMC0wOCAxNTo1MywgVG9tYXN6IEZpZ2Egd3JvdGU6DQo+IE9uIFR1ZSwgT2N0IDgs
IDIwMTkgYXQgMTA6MzUgUE0gVG9tYXN6IEZpZ2EgPHRmaWdhQGNocm9taXVtLm9yZz4gd3JvdGU6
DQo+PiBPbiBUdWUsIE9jdCA4LCAyMDE5IGF0IDc6NDIgUE0gVG9tYXN6IEZpZ2EgPHRmaWdhQGNo
cm9taXVtLm9yZz4gd3JvdGU6DQo+Pj4gT24gVHVlLCBPY3QgOCwgMjAxOSBhdCAzOjMxIFBNIEpv
bmFzIEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4gd3JvdGU6DQo+Pj4+IE9uIDIwMTktMTAtMDgg
MDc6MjcsIFRvbWFzeiBGaWdhIHdyb3RlOg0KPj4+Pj4gSGkgRXplcXVpZWwsIEpvbmFzLA0KPj4+
Pj4NCj4+Pj4+IE9uIFR1ZSwgT2N0IDgsIDIwMTkgYXQgMjo0NiBBTSBFemVxdWllbCBHYXJjaWEg
PGV6ZXF1aWVsQGNvbGxhYm9yYS5jb20+IHdyb3RlOg0KPj4+Pj4+IEZyb206IEpvbmFzIEthcmxt
YW4gPGpvbmFzQGt3aWJvby5zZT4NCj4+Pj4+Pg0KPj4+Pj4+IFRSTSBzcGVjaWZ5IHN1cHBvcnRl
ZCBpbWFnZSBzaXplIDQ4eDQ4IHRvIDQwOTZ4MjMwNCBhdCBzdGVwIHNpemUgMTYgcGl4ZWxzLA0K
Pj4+Pj4+IGNoYW5nZSBmcm1zaXplIG1heF93aWR0aC9tYXhfaGVpZ2h0IHRvIG1hdGNoIFRSTS4N
Cj4+Pj4+Pg0KPj4+Pj4+IEZpeGVzOiA3NjAzMjc5MzBlMTAgKCJtZWRpYTogaGFudHJvOiBFbmFi
bGUgSDI2NCBkZWNvZGluZyBvbiByazMyODgiKQ0KPj4+Pj4+IFNpZ25lZC1vZmYtYnk6IEpvbmFz
IEthcmxtYW4gPGpvbmFzQGt3aWJvby5zZT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiB2MjoNCj4+Pj4+
PiAqIE5vIGNoYW5nZXMuDQo+Pj4+Pj4NCj4+Pj4+PiAgZHJpdmVycy9zdGFnaW5nL21lZGlhL2hh
bnRyby9yazMyODhfdnB1X2h3LmMgfCA0ICsrLS0NCj4+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkNCj4+Pj4+Pg0KPj4+Pj4+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL3N0YWdpbmcvbWVkaWEvaGFudHJvL3JrMzI4OF92cHVfaHcuYyBiL2RyaXZlcnMv
c3RhZ2luZy9tZWRpYS9oYW50cm8vcmszMjg4X3ZwdV9ody5jDQo+Pj4+Pj4gaW5kZXggNmJmY2M0
N2QxZTU4Li5lYmIwMTdiOGEzMzQgMTAwNjQ0DQo+Pj4+Pj4gLS0tIGEvZHJpdmVycy9zdGFnaW5n
L21lZGlhL2hhbnRyby9yazMyODhfdnB1X2h3LmMNCj4+Pj4+PiArKysgYi9kcml2ZXJzL3N0YWdp
bmcvbWVkaWEvaGFudHJvL3JrMzI4OF92cHVfaHcuYw0KPj4+Pj4+IEBAIC02NywxMCArNjcsMTAg
QEAgc3RhdGljIGNvbnN0IHN0cnVjdCBoYW50cm9fZm10IHJrMzI4OF92cHVfZGVjX2ZtdHNbXSA9
IHsNCj4+Pj4+PiAgICAgICAgICAgICAgICAgLm1heF9kZXB0aCA9IDIsDQo+Pj4+Pj4gICAgICAg
ICAgICAgICAgIC5mcm1zaXplID0gew0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC5t
aW5fd2lkdGggPSA0OCwNCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAgICAgICAubWF4X3dpZHRo
ID0gMzg0MCwNCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAgICAubWF4X3dpZHRoID0gNDA5
NiwNCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAuc3RlcF93aWR0aCA9IEgyNjRfTUJf
RElNLA0KPj4+Pj4+ICAgICAgICAgICAgICAgICAgICAgICAgIC5taW5faGVpZ2h0ID0gNDgsDQo+
Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAgICAgLm1heF9oZWlnaHQgPSAyMTYwLA0KPj4+Pj4+
ICsgICAgICAgICAgICAgICAgICAgICAgIC5tYXhfaGVpZ2h0ID0gMjMwNCwNCj4+Pj4+IFRoaXMg
ZG9lc24ndCBtYXRjaCB0aGUgZGF0YXNoZWV0IEkgaGF2ZSwgd2hpY2ggaXMgUkszMjg4IERhdGFz
aGVldCBSZXYNCj4+Pj4+IDEuNCBhbmQgd2hpY2ggaGFzIHRoZSB2YWx1ZXMgYXMgaW4gY3VycmVu
dCBjb2RlLiBXaGF0J3MgdGhlIG9uZSB5b3UNCj4+Pj4+IGdvdCB0aGUgdmFsdWVzIGZyb20/DQo+
Pj4+IFRoZSBSSzMyODggVFJNIHZjb2RlYyBjaGFwdGVyIGZyb20gWzFdLCB1bmtub3duIHJldmlz
aW9uIGFuZCBkYXRlLCBsaXN0cyA0OHg0OCB0byA0MDk2eDIzMDQgc3RlcCBzaXplIDE2IHBpeGVs
cyB1bmRlciAyNS41LjEgSC4yNjQgZGVjb2Rlci4NCj4+Pj4NCj4+Pj4gSSBjYW4gYWxzbyBjb25m
aXJtIHRoYXQgb25lIG9mIG15IHRlc3Qgc2FtcGxlcyAoUFVQUElFUyBCQVRIIElOIDRLKSBpcyA0
MDk2eDIzMDQgYW5kIGNhbiBiZSBkZWNvZGVkIGFmdGVyIHRoaXMgcGF0Y2guDQo+Pj4+IEhvd2V2
ZXIgdGhlIGRlY29kaW5nIHNwZWVkIGlzIG5vdCBvcHRpbWFsIGF0IDQwME1oeiwgaWYgSSByZWNh
bGwgY29ycmVjdGx5IHlvdSBuZWVkIHRvIHNldCB0aGUgVlBVMSBjbG9jayB0byA2MDBNaHogZm9y
IDRLIGRlY29kaW5nIG9uIFJLMzI4OC4NCj4+Pj4NCj4+Pj4gSSBhbSBub3Qgc3VyZSBpZiBJIHNo
b3VsZCBpbmNsdWRlIGEgdjIgb2YgdGhpcyBwYXRjaCBpbiBteSB2MiBzZXJpZXMsIGFzLWlzIHRo
aXMgcGF0Y2ggZG8gbm90IGFwcGx5IG9uIG1hc3RlciAoSDI2NF9NQl9ESU0gaGFzIGNoYW5nZWQg
dG8gTUJfRElNIGluIG1hc3RlcikuDQo+Pj4+DQo+Pj4+IFsxXSBodHRwOi8vd3d3LnQtZmlyZWZs
eS5jb20vZG93bmxvYWQvZmlyZWZseS1yazMyODgvZG9jcy9UUk0vcmszMjg4LWNoYXB0ZXItMjUt
dmlkZW8tZW5jb2Rlci1kZWNvZGVyLXVuaXQtKHZjb2RlYykucGRmDQo+Pj4gSSBjaGVja2VkIHRo
ZSBSSzMyODggVFJNIFYxLjEgdG9vIGFuZCBpdCByZWZlcnMgdG8gMzg0MHgyMTYwQDI0ZnBzIGFz
DQo+Pj4gdGhlIG1heGltdW0uDQo+Pj4NCj4+PiBBcyBmb3IgcGVyZm9ybWFuY2UsIHdlJ3ZlIGFj
dHVhbGx5IGJlZW4gZ2V0dGluZyBhcm91bmQgMzMgZnBzIGF0IDQwMA0KPj4+IE1IeiB3aXRoIDM4
NDB4MjE2MCBvbiBvdXIgZGV2aWNlcyAodGhlIG9sZCBSSzMyODggQXN1cyBDaHJvbWVib29rDQo+
Pj4gRmxpcCkuDQo+Pj4NCj4+PiBJIGd1ZXNzIHdlIG1pZ2h0IHdhbnQgdG8gY2hlY2sgdGhhdCB3
aXRoIEhhbnRyby4NCj4+IENvdWxkIHlvdSBjaGVjayB0aGUgdmFsdWUgb2YgYml0cyAxMDowIGlu
IHJlZ2lzdGVyIGF0IDB4MGM4PyBUaGF0DQo+PiBzaG91bGQgYmUgdGhlIG1heGltdW0gc3VwcG9y
dGVkIHN0cmVhbSB3aWR0aCBpbiB0aGUgdW5pdHMgb2YgMTYNCj4+IHBpeGVscy4NCj4gQ29ycmVj
dGlvbjogVGhlIHVuaXQgaXMgMSBwaXhlbCBhbmQgdGhlcmUgYXJlIGFkZGl0aW9uYWwgMiBtb3N0
DQo+IHNpZ25pZmljYW50IGJpdHMgYXQgMHgwZDgsIDE1OjE0Lg0KDQpJIHdpbGwgY2hlY2sgdGhp
cyBsYXRlciB0b25pZ2h0IHdoZW4gSSBoYXZlIGFjY2VzcyB0byBteSBkZXZpY2VzLg0KVGhlIFBV
UFBJRVMgQkFUSCBJTiA0SyAoNDA5NngyMzA0KSBzYW1wbGUgZGVjb2RlZCB3aXRob3V0IGlzc3Vl
IHVzaW5nIHJvY2tjaGlwIDQuNCBCU1Aga2VybmVsIGFuZCBtcHAgbGFzdCB0aW1lIEkgdGVzdGVk
Lg0KDQpUaGUgdmNvZGVjIGRyaXZlciBpbiA0LjQgQlNQIGtlcm5lbCB1c2UgMzAwLzQwMCBNaHog
YXMgZGVmYXVsdCBjbG9jayByYXRlIGFuZCB3aWxsIGNoYW5nZSB0byA2MDAgTWh6IHdoZW4gd2lk
dGggaXMgb3ZlciAyNTYwLCBzZWUgWzFdOg0KwqAgcmFpc2UgZnJlcXVlbmN5IGZvciByZXNvbHV0
aW9uIGxhcmdlciB0aGFuIDE0NDBwIGF2Yw0KDQpbMV0gaHR0cHM6Ly9naXRodWIuY29tL3JvY2tj
aGlwLWxpbnV4L2tlcm5lbC9ibG9iL2RldmVsb3AtNC40L2RyaXZlcnMvdmlkZW8vcm9ja2NoaXAv
dmNvZGVjL3Zjb2RlY19zZXJ2aWNlLmMjTDI1NTEtTDI1NzANCg0KUmVnYXJkcywNCkpvbmFzDQoN
Cj4NCj4gQmVzdCByZWdhcmRzLA0KPiBUb21hc3oNCg0K
