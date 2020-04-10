Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C58E21A44EF
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 12:04:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725955AbgDJKEV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 06:04:21 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:21627 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725861AbgDJKEV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 06:04:21 -0400
X-UUID: 0a6fe8f9b531430883dba5321b13b01b-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=LeSP52FTso2EkwLO6QyHaBzAPIfPN+/Ucz6epX0Z0us=;
        b=B0kuxl4RBQLZM50E9DWv8vwfSIwW4Xm8b5HYUtNwuNGD+LL1x9IhXmmA6yL2u42TfNEDQ3YBXmM9Y+DRcoJ/o3dRYo/ZpAUuiUjhI6x3hsXjTUyTXk+TtKzCDOkGOhDOduShZpkhXImZqnYuo0wQlC4eXwMiAecvNAyDqPm3JB0=;
X-UUID: 0a6fe8f9b531430883dba5321b13b01b-20200410
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <jungo.lin@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 984110726; Fri, 10 Apr 2020 18:04:18 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 18:04:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Apr 2020 18:04:14 +0800
Message-ID: <1586513057.8406.101.camel@mtksdccf07>
Subject: Re: [v6, 1/5] media: dt-bindings: mt8183: Added camera ISP Pass 1
From:   Jungo Lin <jungo.lin@mediatek.com>
To:     Helen Koike <helen.koike@collabora.com>
CC:     <tfiga@chromium.org>, <hverkuil-cisco@xs4all.nl>,
        <laurent.pinchart@ideasonboard.com>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>, <shik@chromium.org>,
        <devicetree@vger.kernel.org>, <Sean.Cheng@mediatek.com>,
        <suleiman@chromium.org>, <Rynn.Wu@mediatek.com>,
        <srv_heupstream@mediatek.com>, <robh@kernel.org>,
        <ryan.yu@mediatek.com>, <Jerry-ch.Chen@mediatek.com>,
        <frankie.chiu@mediatek.com>, <sj.huang@mediatek.com>,
        <yuzhao@chromium.org>, <linux-mediatek@lists.infradead.org>,
        <zwisler@chromium.org>, <ddavenport@chromium.org>,
        <frederic.chen@mediatek.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-media@vger.kernel.org>
Date:   Fri, 10 Apr 2020 18:04:17 +0800
In-Reply-To: <77afc8e7-26b8-471d-0ec0-c77a9c379433@collabora.com>
References: <Jungo Lin <jungo.lin@mediatek.com>
         <20191219054930.29513-1-jungo.lin@mediatek.com>
         <20191219054930.29513-2-jungo.lin@mediatek.com>
         <77afc8e7-26b8-471d-0ec0-c77a9c379433@collabora.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGksIEhlbGVuOg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudC4NCg0KT24gVHVlLCAyMDIwLTAz
LTMxIGF0IDEyOjM0IC0wMzAwLCBIZWxlbiBLb2lrZSB3cm90ZToNCj4gSGkgSnVuZ28sDQo+IA0K
PiBPbiAxMi8xOS8xOSAzOjQ5IEFNLCBKdW5nbyBMaW4gd3JvdGU6DQo+ID4gVGhpcyBwYXRjaCBh
ZGRzIERUIGJpbmRpbmcgZG9jdW1lbnQgZm9yIHRoZSBQYXNzIDEgKFAxKSB1bml0DQo+ID4gaW4g
TWVkaWF0ZWsncyBjYW1lcmEgSVNQIHN5c3RlbS4gVGhlIFBhc3MgMSB1bml0IGdyYWJzIHRoZSBz
ZW5zb3INCj4gPiBkYXRhIG91dCBmcm9tIHRoZSBzZW5zb3IgaW50ZXJmYWNlLCBhcHBsaWVzIElT
UCBpbWFnZSBlZmZlY3RzDQo+ID4gZnJvbSB0dW5pbmcgZGF0YSBhbmQgb3V0cHV0cyB0aGUgaW1h
Z2UgZGF0YSBvciBzdGF0aXN0aWNzIGRhdGEgdG8gRFJBTS4NCj4gPiANCj4gPiBSZXZpZXdlZC1i
eTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBKdW5n
byBMaW4gPGp1bmdvLmxpbkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gQ2hhbmdlcyBmcm9t
IHY2Og0KPiA+ICAtIEFkZCBwb3J0IG5vZGUgZGVzY3JpcHRpb24gaW4gdGhlIGR0LWJpbmRpbmcg
ZG9jdW1lbnQuDQo+ID4gLS0tDQo+ID4gIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlayxjYW1p
c3AudHh0ICAgICAgICB8IDgzICsrKysrKysrKysrKysrKysrKysNCj4gDQo+IEl0IHdvdWxkIGJl
IHJlYWxseSBuaWNlIHRvIGNvbnZlcnQgdGhpcyB0byB5YW1sLg0KPiANCj4gRm9yIHJlZmVyZW5j
ZTogaHR0cHM6Ly9sd24ubmV0L0FydGljbGVzLzc3MTYyMS8NCj4gDQo+IFJlZ2FyZHMsDQo+IEhl
bGVuDQo+IA0KDQpXZSB3aWxsIHBsYW4gdG8gY292ZXJ0IHR4dCB0byB5YW1sLg0KSG9wZWZ1bGx5
LCB3ZSBjb3VsZCBvdmVyY29tZSB0aGUgbGVhcm5pbmcgY3VlIG9mIHlhbWwuDQoNClRoYW5rcywN
Cg0KSnVuZ28NCg0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgODMgaW5zZXJ0aW9ucygrKQ0KPiA+ICBj
cmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L21lZGlhdGVrLGNhbWlzcC50eHQNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLGNhbWlzcC50eHQgYi9Eb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWssY2FtaXNwLnR4dA0KPiA+
IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+ID4gaW5kZXggMDAwMDAwMDAwMDAwLi5hODVmMzdjMGI4
N2QNCj4gPiAtLS0gL2Rldi9udWxsDQo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVl
L2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLGNhbWlzcC50eHQNCj4gPiBAQCAtMCwwICsxLDgzIEBA
DQo+ID4gKyogTWVkaWF0ZWsgSW1hZ2UgU2lnbmFsIFByb2Nlc3NvciBQYXNzIDEgKElTUCBQMSkN
Cj4gPiArDQo+ID4gK1RoZSBQYXNzIDEgdW5pdCBvZiBNZWRpYXRlaydzIGNhbWVyYSBJU1Agc3lz
dGVtIGdyYWJzIHRoZSBzZW5zb3IgZGF0YSBvdXQNCj4gPiArZnJvbSB0aGUgc2Vuc29yIGludGVy
ZmFjZSwgYXBwbGllcyBJU1AgZWZmZWN0cyBmcm9tIHR1bmluZyBkYXRhIGFuZCBvdXRwdXRzDQo+
ID4gK3RoZSBpbWFnZSBkYXRhIGFuZCBzdGF0aXN0aWNzIGRhdGEgdG8gRFJBTS4gRnVydGhlcm1v
cmUsIFBhc3MgMSB1bml0IGhhcw0KPiA+ICt0aGUgYWJpbGl0eSB0byBvdXRwdXQgdHdvIGRpZmZl
cmVudCByZXNvbHV0aW9ucyBmcmFtZXMgYXQgdGhlIHNhbWUgdGltZSB0bw0KPiA+ICtpbmNyZWFz
ZSB0aGUgcGVyZm9ybWFuY2Ugb2YgdGhlIGNhbWVyYSBhcHBsaWNhdGlvbi4NCj4gPiArDQo+ID4g
K1JlcXVpcmVkIHByb3BlcnRpZXM6DQo+ID4gKy0gY29tcGF0aWJsZTogTXVzdCBiZSAibWVkaWF0
ZWssbXQ4MTgzLWNhbWlzcCIgZm9yIE1UODE4My4NCj4gPiArLSByZWc6IFBoeXNpY2FsIGJhc2Ug
YWRkcmVzcyBvZiB0aGUgY2FtZXJhIGZ1bmN0aW9uIGJsb2NrIHJlZ2lzdGVyIGFuZA0KPiA+ICsg
IGxlbmd0aCBvZiBtZW1vcnkgbWFwcGVkIHJlZ2lvbi4gTXVzdCBjb250YWluIGFuIGVudHJ5IGZv
ciBlYWNoIGVudHJ5DQo+ID4gKyAgaW4gcmVnLW5hbWVzLg0KPiA+ICstIHJlZy1uYW1lczogTXVz
dCBpbmNsdWRlIHRoZSBmb2xsb3dpbmcgZW50cmllczoNCj4gPiArICAiY2FtX3N5cyI6IENhbWVy
YSBiYXNlIGZ1bmN0aW9uIGJsb2NrDQo+ID4gKyAgImNhbV91bmkiOiBDYW1lcmEgVU5JIGZ1bmN0
aW9uIGJsb2NrDQo+ID4gKyAgImNhbV9hIjogQ2FtZXJhIElTUCBQMSBoYXJkd2FyZSB1bml0IEEN
Cj4gPiArICAiY2FtX2IiOiBDYW1lcmEgSVNQIFAxIGhhcmR3YXJlIHVuaXQgQg0KPiA+ICsgICJj
YW1fYyI6IENhbWVyYSBJU1AgUDEgaGFyZHdhcmUgdW5pdCBDDQo+ID4gKy0gaW50ZXJydXB0czog
TXVzdCBjb250YWluIGFuIGVudHJ5IGZvciBlYWNoIGVudHJ5IGluIGludGVycnVwdC1uYW1lcy4N
Cj4gPiArLSBpbnRlcnJ1cHQtbmFtZXMgOiBNdXN0IGluY2x1ZGUgdGhlIGZvbGxvd2luZyBlbnRy
aWVzOg0KPiA+ICsgICJjYW1fdW5pIjogQ2FtZXJhIFVOSSBpbnRlcnJ1cHQNCj4gPiArICAiY2Ft
X2EiOiBDYW1lcmEgdW5pdCBBIGludGVycnVwdA0KPiA+ICsgICJjYW1fYiI6IENhbWVyYSB1bml0
IEIgaW50ZXJydXB0DQo+ID4gKyAgImNhbV9jIjogQ2FtZXJhIHVuaXQgQyBpbnRlcnJ1cHQNCj4g
PiArLSBpb21tdXM6IFNoYWxsIHBvaW50IHRvIHRoZSByZXNwZWN0aXZlIElPTU1VIGJsb2NrIHdp
dGggbWFzdGVyIHBvcnQNCj4gPiArICBhcyBhcmd1bWVudCwgc2VlIERvY3VtZW50YXRpb24vZGV2
aWNldHJlZS9iaW5kaW5ncy9pb21tdS9tZWRpYXRlayxpb21tdS50eHQNCj4gPiArICBmb3IgZGV0
YWlscy4NCj4gPiArLSBjbG9ja3M6IEEgbGlzdCBvZiBwaGFuZGxlIGFuZCBjbG9jayBzcGVjaWZp
ZXIgcGFpcnMgYXMgbGlzdGVkDQo+ID4gKyAgaW4gY2xvY2stbmFtZXMgcHJvcGVydHksIHNlZQ0K
PiA+ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9jbG9jay1iaW5k
aW5ncy50eHQgZm9yIGRldGFpbHMuDQo+ID4gKy0gY2xvY2stbmFtZXM6IE11c3QgYmUgImNhbXN5
c19jYW1fY2dwZG4iIGFuZCAiY2Ftc3lzX2NhbXRnX2NncGRuIi4NCj4gPiArLSBtZWRpYXRlayxs
YXJiOiBNdXN0IGNvbnRhaW4gdGhlIGxvY2FsIGFyYml0ZXJzIGluIHRoZSBjdXJyZW50IFNvQ3Ms
IHNlZQ0KPiA+ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZW1vcnktY29u
dHJvbGxlcnMvbWVkaWF0ZWssc21pLWxhcmIudHh0DQo+ID4gKyAgZm9yIGRldGFpbHMuDQo+ID4g
Ky0gcG93ZXItZG9tYWluczogYSBwaGFuZGxlIHRvIHRoZSBwb3dlciBkb21haW4sIHNlZQ0KPiA+
ICsgIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9wb3dlci9wb3dlcl9kb21haW4u
dHh0IGZvciBkZXRhaWxzLg0KPiA+ICstIG1lZGlhdGVrLHNjcDogVGhlIG5vZGUgb2Ygc3lzdGVt
IGNvbnRyb2wgcHJvY2Vzc29yIChTQ1ApLCBzZWUNCj4gPiArICBEb2N1bWVudGF0aW9uL2Rldmlj
ZXRyZWUvYmluZGluZ3MvcmVtb3RlcHJvYy9tdGssc2NwLnR4dCBmb3IgZGV0YWlscy4NCj4gPiAr
LSBwb3J0OiBjaGlsZCBwb3J0IG5vZGUgY29ycmVzcG9uZGluZyB0byB0aGUgZGF0YSBpbnB1dCwg
aW4gYWNjb3JkYW5jZSB3aXRoDQo+ID4gKyAgdGhlIHZpZGVvIGludGVyZmFjZSBiaW5kaW5ncyBk
ZWZpbmVkIGluDQo+ID4gKyAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlh
L3ZpZGVvLWludGVyZmFjZXMudHh0LiBUaGUgcG9ydA0KPiA+ICsgIG5vZGUgbXVzdCBjb250YWlu
IGF0IGxlYXN0IG9uZSBlbmRwb2ludC4NCj4gPiArDQo+ID4gK0V4YW1wbGU6DQo+ID4gK1NvQyBz
cGVjaWZpYyBEVCBlbnRyeToNCj4gPiArDQo+ID4gKwljYW1pc3A6IGNhbWlzcEAxYTAwMDAwMCB7
DQo+ID4gKwkJY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxODMtY2FtaXNwIjsNCj4gPiArCQly
ZWcgPSA8MCAweDFhMDAwMDAwIDAgMHgxMDAwPiwNCj4gPiArCQkJCTwwIDB4MWEwMDMwMDAgMCAw
eDEwMDA+LA0KPiA+ICsJCQkJPDAgMHgxYTAwNDAwMCAwIDB4MjAwMD4sDQo+ID4gKwkJCQk8MCAw
eDFhMDA2MDAwIDAgMHgyMDAwPiwNCj4gPiArCQkJCTwwIDB4MWEwMDgwMDAgMCAweDIwMDA+Ow0K
PiA+ICsJCXJlZy1uYW1lcyA9ICJjYW1fc3lzIiwNCj4gPiArCQkJCSJjYW1fdW5pIiwNCj4gPiAr
CQkJCSJjYW1fYSIsDQo+ID4gKwkJCQkiY2FtX2IiLA0KPiA+ICsJCQkJImNhbV9jIjsNCj4gPiAr
CQlpbnRlcnJ1cHRzID0gPEdJQ19TUEkgMjUzIElSUV9UWVBFX0xFVkVMX0xPVz4sDQo+ID4gKwkJ
CQk8R0lDX1NQSSAyNTQgSVJRX1RZUEVfTEVWRUxfTE9XPiwNCj4gPiArCQkJCTxHSUNfU1BJIDI1
NSBJUlFfVFlQRV9MRVZFTF9MT1c+LA0KPiA+ICsJCQkJPEdJQ19TUEkgMjU2IElSUV9UWVBFX0xF
VkVMX0xPVz47DQo+ID4gKwkJaW50ZXJydXB0LW5hbWVzID0gImNhbV91bmkiLA0KPiA+ICsJCQkJ
ImNhbV9hIiwNCj4gPiArCQkJCSJjYW1fYiIsDQo+ID4gKwkJCQkiY2FtX2MiOw0KPiA+ICsJCWlv
bW11cyA9IDwmaW9tbXUgTTRVX1BPUlRfQ0FNX0lNR08+Ow0KPiA+ICsJCWNsb2NrcyA9IDwmY2Ft
c3lzIENMS19DQU1fQ0FNPiwNCj4gPiArCQkJCTwmY2Ftc3lzIENMS19DQU1fQ0FNVEc+Ow0KPiA+
ICsJCWNsb2NrLW5hbWVzID0gImNhbXN5c19jYW1fY2dwZG4iLA0KPiA+ICsJCQkJImNhbXN5c19j
YW10Z19jZ3BkbiI7DQo+ID4gKwkJbWVkaWF0ZWssbGFyYiA9IDwmbGFyYjM+LA0KPiA+ICsJCQkJ
PCZsYXJiNj47DQo+ID4gKwkJcG93ZXItZG9tYWlucyA9IDwmc2Nwc3lzIE1UODE4M19QT1dFUl9E
T01BSU5fQ0FNPjsNCj4gPiArCQltZWRpYXRlayxzY3AgPSA8JnNjcD47DQo+ID4gKw0KPiA+ICsJ
CXBvcnQgew0KPiA+ICsJCQljYW1pc3BfZW5kcG9pbnQ6IGVuZHBvaW50IHsNCj4gPiArCQkJCXJl
bW90ZS1lbmRwb2ludCA9IDwmc2VuaW5mX2NhbWlzcF9lbmRwb2ludD47DQo+ID4gKwkJCX07DQo+
ID4gKwkJfTsNCj4gPiArCX07DQo+ID4gDQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXw0KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QNCj4g
TGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZw0KPiBodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrDQoNCg==

