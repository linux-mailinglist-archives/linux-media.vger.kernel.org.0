Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B8A3F4010DF
	for <lists+linux-media@lfdr.de>; Sun,  5 Sep 2021 18:27:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238057AbhIEQ14 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 5 Sep 2021 12:27:56 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:35105 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231847AbhIEQ1z (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 5 Sep 2021 12:27:55 -0400
X-UUID: bdd6364aafb040cdaf2dc137b408bffc-20210906
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=EIqz+ZnAUQZmH1HiU63bFHwu9as+swac7cV0J0RfSGs=;
        b=rewXP08bW62y1vc1ogaDStDnHLXxO/F/DIoWoLGif0Xpd6yhrAEoAcSdxLYBUbeYMpw04gqQqPAypXIzGsQvP/fs8IvOrM+rqIwmGnx+1Adu7+LxGtqbIaMUZd+8hX2T9KLwudc7kf4m8QYh4IxMCbBUmasm/K+AiiDyYZebiR8=;
X-UUID: bdd6364aafb040cdaf2dc137b408bffc-20210906
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <houlong.wei@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 2105537368; Mon, 06 Sep 2021 00:23:30 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N2.mediatek.inc
 (172.27.4.72) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 6 Sep
 2021 00:23:18 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 6 Sep 2021 00:23:17 +0800
Message-ID: <fc309940c9e59f80397b90c8b11424fea344e1b5.camel@mediatek.com>
Subject: Re: [PATCH v7 2/7] mtk-mdp: add driver to probe mdp components
From:   houlong wei <houlong.wei@mediatek.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
        Eizan Miyamoto <eizan@chromium.org>,
        Hans Verkuil <hverkuil@xs4all.nl>
CC:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
        Yong Wu =?UTF-8?Q?=28=E5=90=B4=E5=8B=87=29?= 
        <Yong.Wu@mediatek.com>, "wenst@chromium.org" <wenst@chromium.org>,
        CK Hu =?UTF-8?Q?=28=E8=83=A1=E4=BF=8A=E5=85=89=29?= 
        <ck.hu@mediatek.com>,
        "Enric Balletbo i Serra" <enric.balletbo@collabora.com>,
        Yongqiang Niu =?UTF-8?Q?=28=E7=89=9B=E6=B0=B8=E5=BC=BA=29?= 
        <yongqiang.niu@mediatek.com>,
        Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?= 
        <Andrew-CT.Chen@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Minghsiu Tsai =?UTF-8?Q?=28=E8=94=A1=E6=98=8E=E4=BF=AE=29?= 
        <Minghsiu.Tsai@mediatek.com>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-media <linux-media@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>, <houlong.wei@mediatek.com>
Date:   Mon, 6 Sep 2021 00:23:19 +0800
In-Reply-To: <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
References: <20210825063323.3607738-1-eizan@chromium.org>
         <20210825163247.v7.2.Ie6d1e6e39cf9b5d6b2108ae1096af34c3d55880b@changeid>
         <CAAEAJfDNDXdJFfB-bHhFcqnnKZ0TY--d_wLGddKRymQOLQY4TQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 082D29C5DBC44AB8D275D6244F57556B6E4A615786D52C2D39DE45030E8DE3322000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNClRoYW5rIHlvdSBmb3IgeW91ciBhdHRlbnRpb24gdG8gdGhpcyBzZXJp
ZXMgb2YgcGF0Y2hlcy4gSSBhbnN3ZXIgcGFydGlhbCBvZiB5b3VyIHF1ZXN0aW9ucyBiZWxvdy4N
ClJlZ2FyZHMsDQpIb3Vsb25nDQoNCk9uIFNhdCwgMjAyMS0wOS0wNCBhdCAyMDozNCArMDgwMCwg
RXplcXVpZWwgR2FyY2lhIHdyb3RlOg0KPiBIaSBFaXphbiwNCj4gDQo+IFNvcnJ5IGZvciBzZWVp
bmcgdGhpcyBzZXJpZXMgc28gbGF0ZS4NCj4gDQo+IE9uIFdlZCwgMjUgQXVnIDIwMjEgYXQgMDM6
MzUsIEVpemFuIE1peWFtb3RvIDxlaXphbkBjaHJvbWl1bS5vcmc+DQo+IHdyb3RlOg0KPiA+IA0K
PiA+IEJyb2FkbHksIHRoaXMgcGF0Y2ggKDEpIGFkZHMgYSBkcml2ZXIgZm9yIHZhcmlvdXMgTVRL
IE1EUA0KPiA+IGNvbXBvbmVudHMgdG8NCj4gPiBnbyBhbG9uZ3NpZGUgdGhlIG1haW4gTVRLIE1E
UCBkcml2ZXIsIGFuZCAoMikgaG9va3MgdGhlbSBhbGwNCj4gPiB0b2dldGhlcg0KPiA+IHVzaW5n
IHRoZSBjb21wb25lbnQgZnJhbWV3b3JrLg0KPiA+IA0KPiA+ICgxKSBVcCB1bnRpbCBub3csIHRo
ZSBNVEsgTURQIGRyaXZlciBjb250cm9scyA4IGRldmljZXMgaW4gdGhlDQo+ID4gZGV2aWNlDQo+
ID4gdHJlZSBvbiBpdHMgb3duLiBXaGVuIHJ1bm5pbmcgdGVzdHMgZm9yIHRoZSBoYXJkd2FyZSB2
aWRlbyBkZWNvZGVyLA0KPiA+IHdlDQo+ID4gZm91bmQgdGhhdCB0aGUgaW9tbXVzIGFuZCBMQVJC
cyB3ZXJlIG5vdCBiZWluZyBwcm9wZXJseSBjb25maWd1cmVkLg0KPiANCj4gV2h5IHdlcmUgbm90
IGJlaW5nIHByb3Blcmx5IGNvbmZpZ3VyZWQ/IFdoYXQgd2FzIHRoZSBwcm9ibGVtPw0KPiBXaHkg
bm90IGZpeGluZyB0aGF0IGluc3RlYWQ/DQo+IA0KPiBEb2VzIHRoaXMgbWVhbiB0aGUgZHJpdmVy
IGlzIGN1cnJlbnRseSBicm9rZW4gYW5kIHVudXNhYmxlPw0KDQpUaGlzIHNlcmllcyBvZiBwYXRj
aGVzIGFyZSBzdXBwbGVtZW50cyB0byBhbm90aGVyIHNlcmllcywgcGxlYXNlIHJlZmVyDQp0byAg
DQpodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2plY3QvbGludXgtbWVkaWF0ZWsvbGlz
dC8/c2VyaWVzPTUxNTEyOWMNCiwgd2hpY2ggYWRkIGRldmljZSBsaW5rIGJldHdlZW4gdGhlIG10
ay1pb21tdSBjb25zdW1lciBhbmQgdGhlIG10ay1sYXJiIA0KZGV2aWNlcy4gV2l0aG91dCB0aGF0
IHNlcmllcyBvZiBwYXRjaGVzLCB0aGUgbXRrLW1kcCBkcml2ZXIgY2FuIHdvcmsNCndlbGwgc28g
ZmFyLg0KQnV0IHdpdGggdGhhdCBzZXJpZXMsIGl0IHNlZW1zIHRoZSBkZXZpY2UgbGluayBvbmx5
IGNhbiBiZSBlc3RhYmxpc2hlZA0KZm9yIHRoZSBkZXZpY2Ugd2hpY2ggaXMgcmVnaXN0ZXJlZCBh
cyBhIHBsYXRmb3JtIGRyaXZlci4gVGhhdCdzIHdoeQ0KRWl6YW4gYWRkcyB0aGlzIHNlcmllcyBv
ZiBwYXRjaGVzIHRvIG1ha2UgYWxsIG1kcCBjb21wb25lbnRzIHRvIGJlDQpyZWdpc3RlcmVkIGFz
IHBsYXRmb3JtIGRyaXZlcnMuDQoNCj4gDQo+ID4gVG8NCj4gPiBjb25maWd1cmUgdGhlbSwgYSBk
cml2ZXIgZm9yIGVhY2ggYmUgYWRkZWQgdG8gbXRrX21kcF9jb21wIHNvIHRoYXQNCj4gPiBtdGtf
aW9tbXVfYWRkX2RldmljZSgpIGNhbiAoZXZlbnR1YWxseSkgYmUgY2FsbGVkIGZyb20NCj4gPiBk
bWFfY29uZmlndXJlKCkNCj4gPiBpbnNpZGUgcmVhbGx5X3Byb2JlKCkuDQo+ID4gDQo+ID4gKDIp
IFRoZSBpbnRlZ3JhdGlvbiBpbnRvIHRoZSBjb21wb25lbnQgZnJhbWV3b3JrIGFsbG93cyB1cyB0
byBkZWZlcg0KPiA+IHRoZQ0KPiA+IHJlZ2lzdHJhdGlvbiB3aXRoIHRoZSB2NGwyIHN1YnN5c3Rl
bSB1bnRpbCBhbGwgdGhlIE1EUC1yZWxhdGVkDQo+ID4gZGV2aWNlcw0KPiA+IGhhdmUgYmVlbiBw
cm9iZWQsIHNvIHRoYXQgdGhlIHJlbGV2YW50IGRldmljZSBub2RlIGRvZXMgbm90IGJlY29tZQ0K
PiA+IGF2YWlsYWJsZSB1bnRpbCBpbml0aWFsaXphdGlvbiBvZiBhbGwgdGhlIGNvbXBvbmVudHMg
aXMgY29tcGxldGUuDQo+ID4gDQo+ID4gU29tZSBub3RlcyBhYm91dCBob3cgdGhlIGNvbXBvbmVu
dCBmcmFtZXdvcmsgaGFzIGJlZW4gaW50ZWdyYXRlZDoNCj4gPiANCj4gPiAtIFRoZSBkcml2ZXIg
Zm9yIHRoZSByZG1hMCBjb21wb25lbnQgc2VydmVzIGRvdWJsZSBkdXR5IGFzIHRoZQ0KPiA+ICJt
YXN0ZXIiDQo+ID4gICAoYWdncmVnYXRlKSBkcml2ZXIgYXMgd2VsbCBhcyBhIGNvbXBvbmVudCBk
cml2ZXIuIFRoaXMgaXMgYSBub24tDQo+ID4gaWRlYWwNCj4gPiAgIGNvbXByb21pc2UgdW50aWwg
YSBiZXR0ZXIgc29sdXRpb24gaXMgZGV2ZWxvcGVkLiBUaGlzIGRldmljZSBpcw0KPiA+ICAgZGlm
ZmVyZW50aWF0ZWQgZnJvbSB0aGUgcmVzdCBieSBjaGVja2luZyBmb3IgYSAibWVkaWF0ZWssdnB1
Ig0KPiA+IHByb3BlcnR5DQo+ID4gICBpbiB0aGUgZGV2aWNlIG5vZGUuDQo+ID4gDQo+IA0KPiBB
cyBJIGhhdmUgc3RhdGVkIGluIFl1bmZlaSwgSSBhbSBub3QgY29udmluY2VkIHlvdSBuZWVkIGFu
IGFzeW5jDQo+IGZyYW1ld29yaw0KPiBhdCBhbGwuIEl0IHNlZW1zIGFsbCB0aGVzZSBkZXZpY2Vz
IGNvdWxkIGhhdmUgYmVlbiBsaW5rZWQgdG9nZXRoZXINCj4gaW4gdGhlIGRldmljZSB0cmVlLCBh
bmQgdGhlbiBoYXZlIGEgbWFzdGVyIGRldmljZSB0byB0aWUgdGhlbS4NCj4gDQo+IEkuZS4gc29t
ZXRoaW5nIGxpa2UNCj4gDQo+IG1kcCB7DQo+ICAgbWRwX3JkbWEwIHsNCj4gICB9DQo+ICAgbWRw
X3JzejAgew0KPiAgIH0NCj4gICBtZHBfcnN6MSB7DQo+ICAgfQ0KPiB9DQo+IA0KDQpUaGUgY29t
bWl0IG1lc3NhZ2Ugb2YgdGhlIHBhdGNoIGJlbG93IGV4cGxhaW5zIHRoYXQgIiBJZiB0aGUgbWRw
XyoNCm5vZGVzIGFyZSB1bmRlciBhbiBtZHAgc3ViLW5vZGUsIHRoZWlyIGNvcnJlc3BvbmRpbmcg
cGxhdGZvcm0gZGV2aWNlDQpkb2VzIG5vdCBhdXRvbWF0aWNhbGx5IGdldCBpdHMgaW9tbXUgYXNz
aWduZWQgcHJvcGVybHkuIg0KUGxlYXNlIHJlZmVyIHRvIA0KaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvc3RhYmxlL2xpbnV4LmdpdC9jb21taXQvYXJjaC9h
cm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxNzMuZHRzaT9oPXY1LjE0LjEmaWQ9ODEyNzg4MWY3
NDFkYmJmOWExZGE5ZTliYzU5MTMzODIwMTYwYjIxNw0KDQo+IEFsbCB0aGlzIGFzeW5jIGdhbWVz
IHNlZW0gbGlrZSBtYWtpbmcgdGhlIGRyaXZlciByZWFsbHkgb2JmdXNjYXRlZCwNCj4gd2hpY2gg
d2lsbCBtZWFuIGhhcmRlciB0byBkZWJ1ZyBhbmQgbWFpbnRhaW4uDQo+IEkgYW0gbm90IHN1cmUg
d2Ugd2FudCB0aGF0IGJ1cmRlbi4NCj4gDQo+IEV2ZW4gaWYgd2UgYXJlIGFsbCBmdWxseSBjb252
aW5jZWQgdGhhdCB5b3UgYWJzb2x1dGVseSBuZWVkDQo+IGFuIGFzeW5jIGZyYW1ld29yaywgdGhl
biB3aGF0J3Mgd3Jvbmcgd2l0aCB2NGwyLWFzeW5jPw0KPiANCj4gSSB3b3VsZCBzdGFydCBieSBh
ZGRyZXNzaW5nIHdoYXQgaXMgd3Jvbmcgd2l0aCB0aGUgSU9NTVVzDQo+IGluIHRoZSBjdXJyZW50
IGRlc2lnbi4NCj4gDQo+IFRoYW5rcywNCj4gRXplcXVpZWwNCj4gDQo+ID4gLSBUaGUgbGlzdCBv
ZiBtZHAgY29tcG9uZW50cyByZW1haW5zIGhhcmQtY29kZWQgYXMNCj4gPiBtdGtfbWRwX2NvbXBf
ZHRfaWRzW10NCj4gPiAgIGluIG10a19tZHBfY29yZS5jLCBhbmQgYXMgbXRrX21kcF9jb21wX2Ry
aXZlcl9kdF9tYXRjaFtdIGluDQo+ID4gICBtdGtfbWRwX2NvbXAuYy4gVGhpcyB1bmZvcnR1bmF0
ZSBkdXBsaWNhdGlvbiBvZiBpbmZvcm1hdGlvbiBpcw0KPiA+ICAgYWRkcmVzc2VkIGluIGEgZm9s
bG93aW5nIHBhdGNoIGluIHRoaXMgc2VyaWVzLg0KPiA+IA0KPiA+IC0gVGhlIGNvbXBvbmVudCBk
cml2ZXIgY2FsbHMgY29tcG9uZW50X2FkZCgpIGZvciBlYWNoIGRldmljZSB0aGF0DQo+ID4gaXMN
Cj4gPiAgIHByb2JlZC4NCj4gPiANCj4gPiAtIEluIG10a19tZHBfcHJvYmUgKHRoZSAibWFzdGVy
IiBkZXZpY2UpLCB3ZSBzY2FuIHRoZSBkZXZpY2UgdHJlZQ0KPiA+IGZvcg0KPiA+ICAgYW55IG1h
dGNoaW5nIG5vZGVzIGFnYWluc3QgbXRrX21kcF9jb21wX2R0X2lkcywgYW5kIGFkZCBjb21wb25l
bnQNCj4gPiAgIG1hdGNoZXMgZm9yIHRoZW0uIFRoZSBtYXRjaCBjcml0ZXJpYSBpcyBhIG1hdGNo
aW5nIGRldmljZSBub2RlDQo+ID4gICBwb2ludGVyLg0KPiA+IA0KPiA+IC0gV2hlbiB0aGUgc2V0
IG9mIGNvbXBvbmVudHMgZGV2aWNlcyB0aGF0IGhhdmUgYmVlbiBwcm9iZWQNCj4gPiBjb3JyZXNw
b25kcw0KPiA+ICAgd2l0aCB0aGUgbGlzdCB0aGF0IGlzIGdlbmVyYXRlZCBieSB0aGUgIm1hc3Rl
ciIsIHRoZSBjYWxsYmFjayB0bw0KPiA+ICAgbXRrX21kcF9tYXN0ZXJfYmluZCgpIGlzIG1hZGUs
IHdoaWNoIHRoZW4gY2FsbHMgdGhlIGNvbXBvbmVudA0KPiA+IGJpbmQNCj4gPiAgIGZ1bmN0aW9u
cy4NCj4gPiANCj4gPiAtIEluc2lkZSBtdGtfbWRwX21hc3Rlcl9iaW5kKCksIG9uY2UgYWxsIHRo
ZSBjb21wb25lbnQgYmluZA0KPiA+IGZ1bmN0aW9ucw0KPiA+ICAgaGF2ZSBiZWVuIGNhbGxlZCwg
d2UgY2FuIHRoZW4gcmVnaXN0ZXIgb3VyIGRldmljZSB0byB0aGUgdjRsMg0KPiA+ICAgc3Vic3lz
dGVtLg0KPiA+IA0KPiA+IC0gVGhlIGNhbGwgdG8gcG1fcnVudGltZV9lbmFibGUoKSBpbiB0aGUg
bWFzdGVyIGRldmljZSBpcyBjYWxsZWQNCj4gPiBhZnRlcg0KPiA+ICAgYWxsIHRoZSBjb21wb25l
bnRzIGhhdmUgYmVlbiByZWdpc3RlcmVkIGJ5IHRoZWlyIGJpbmQoKSBmdW5jdGlvbnMNCj4gPiAg
IGNhbGxlZCBieSBtdGtfbXRwX21hc3Rlcl9iaW5kKCkuIEFzIGEgcmVzdWx0LCB0aGUgbGlzdCBv
Zg0KPiA+IGNvbXBvbmVudHMNCj4gPiAgIHdpbGwgbm90IGNoYW5nZSB3aGlsZSBwb3dlciBtYW5h
Z2VtZW50IGNhbGxiYWNrcw0KPiA+IG10a19tZHBfc3VzcGVuZCgpLw0KPiA+ICAgcmVzdW1lKCkg
YXJlIGFjY2Vzc2luZyB0aGUgbGlzdCBvZiBjb21wb25lbnRzLg0KPiA+IA0KPiA+IFNpZ25lZC1v
ZmYtYnk6IEVpemFuIE1peWFtb3RvIDxlaXphbkBjaHJvbWl1bS5vcmc+DQo+ID4gUmV2aWV3ZWQt
Ynk6IEVucmljIEJhbGxldGJvIGkgU2VycmEgPGVucmljLmJhbGxldGJvQGNvbGxhYm9yYS5jb20+
DQo+ID4gUmV2aWV3ZWQtYnk6IEhvdWxvbmcgV2VpIDxob3Vsb25nLndlaUBtZWRpYXRlay5jb20+
DQo+ID4gLS0tDQo+ID4gDQoNCg==

