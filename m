Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C7F40AD53
	for <lists+linux-media@lfdr.de>; Tue, 14 Sep 2021 14:16:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232507AbhINMRn (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 14 Sep 2021 08:17:43 -0400
Received: from mailgw01.mediatek.com ([60.244.123.138]:53302 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S232467AbhINMRm (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 14 Sep 2021 08:17:42 -0400
X-UUID: a1be9fabfa8643dbac1eca4be3bc9d8d-20210914
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=adSqRYNHJjIKQSMNvjW+uevqONE1tx3rtVypYeRw44A=;
        b=jU2j9iBMKm+jVXZjqe7lvs4pNbFC6ebId8WKtQfUFDouEYfUP1e4Jn6ERhMpx9wm1Ic+TjcsJZfFjYDSnOt7iYz5GqkSLmbyvUfbEZxceynKI66/qwyBM0m8VA3ZX9gnx9BaZGYmmIq6ektK+jUXMZfvOn0c4/Cgz7O+i8vtIRI=;
X-UUID: a1be9fabfa8643dbac1eca4be3bc9d8d-20210914
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw01.mediatek.com
        (envelope-from <yunfei.dong@mediatek.com>)
        (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1536403208; Tue, 14 Sep 2021 20:16:23 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 14 Sep 2021 20:16:21 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 14 Sep 2021 20:16:20 +0800
Message-ID: <aba7fb4ffe6e45ac90869b5017468386bce64d28.camel@mediatek.com>
Subject: Re: [PATCH v6, 00/15] Using component framework to support multi
 hardware decode
From:   "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        "Tiffany Lin" <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        srv_heupstream <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        Project_Global_Chrome_Upstream_Group 
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Tue, 14 Sep 2021 20:16:22 +0800
In-Reply-To: <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
References: <20210901083215.25984-1-yunfei.dong@mediatek.com>
         <CAAEAJfDOt_GyDPojcj5P6Wou9HC2GC8YzRt2wYyqdrCOjfeOog@mail.gmail.com>
         <3b9463e88d88ce85205da08f8263252da7726ade.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgRXplcXVpZWwsDQoNCk9uIEZyaSwgMjAyMS0wOS0wMyBhdCAxMTowOCArMDgwMCwgeXVuZmVp
LmRvbmdAbWVkaWF0ZWsuY29tIHdyb3RlOg0KPiBIaSBFemVxdWllbCwNCj4gDQo+IFRoYW5rcyBm
b3IgeW91ciBzdWdnZXN0aW9uLg0KPiBPbiBUaHUsIDIwMjEtMDktMDIgYXQgMTM6MzAgLTAzMDAs
IEV6ZXF1aWVsIEdhcmNpYSB3cm90ZToNCj4gPiBPbiBXZWQsIDEgU2VwdCAyMDIxIGF0IDA1OjMy
LCBZdW5mZWkgRG9uZyA8eXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tDQo+ID4gPg0KPiA+IHdyb3Rl
Og0KPiA+ID4gDQo+ID4gPiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIG11bHRpIGhhcmR3
YXJlIGRlY29kZSBpbnRvIG10ay0NCj4gPiA+IHZjb2RlYywgDQo+ID4gPiBieSBmaXJzdA0KPiA+
ID4gYWRkaW5nIGNvbXBvbmVudCBmcmFtZXdvcmsgdG8gbWFuYWdlIGVhY2ggaGFyZHdhcmUgaW5m
b3JtYXRpb246DQo+ID4gPiBpbnRlcnJ1cHQsDQo+ID4gPiBjbG9jaywgcmVnaXN0ZXIgYmFzZXMg
YW5kIHBvd2VyLiBTZWNvbmRseSBhZGQgY29yZSB0aHJlYWQgdG8gZGVhbA0KPiA+ID4gd2l0aCBj
b3JlDQo+ID4gPiBoYXJkd2FyZSBtZXNzYWdlLCBhdCB0aGUgc2FtZSB0aW1lLCBhZGQgbXNnIHF1
ZXVlIGZvciBkaWZmZXJlbnQNCj4gPiA+IGhhcmR3YXJlDQo+ID4gPiBzaGFyZSBtZXNzYWdlcy4g
TGFzdGx5LCB0aGUgYXJjaGl0ZWN0dXJlIG9mIGRpZmZlcmVudCBzcGVjcyBhcmUNCj4gPiA+IG5v
dA0KPiA+ID4gdGhlIHNhbWUsDQo+ID4gPiB1c2luZyBzcGVjcyB0eXBlIHRvIHNlcGFyYXRlIHRo
ZW0uDQo+ID4gPiANCj4gPiA+IFRoaXMgc2VyaWVzIGhhcyBiZWVuIHRlc3RlZCB3aXRoIGJvdGgg
TVQ4MTgzIGFuZCBNVDgxNzMuIERlY29kaW5nDQo+ID4gPiB3YXMgd29ya2luZw0KPiA+ID4gZm9y
IGJvdGggY2hpcHMuDQo+ID4gPiANCj4gPiA+IFBhdGNoZXMgMX4zIHJld3JpdGUgZ2V0IHJlZ2lz
dGVyIGJhc2VzIGFuZCBwb3dlciBvbi9vZmYNCj4gPiA+IGludGVyZmFjZS4NCj4gPiA+IA0KPiA+
ID4gUGF0Y2ggNCBhZGQgY29tcG9uZW50IGZyYW1ld29yayB0byBzdXBwb3J0IG11bHRpIGhhcmR3
YXJlLg0KPiA+ID4gDQo+ID4gPiBQYXRjaCA1IHNlcGFyYXRlIHZpZGVvIGVuY29kZXIgYW5kIGRl
Y29kZXIgZG9jdW1lbnQNCj4gPiA+IA0KPiA+ID4gUGF0Y2hlcyA2LTE1IGFkZCBpbnRlcmZhY2Vz
IHRvIHN1cHBvcnQgY29yZSBoYXJkd2FyZS4NCj4gPiA+IC0tLS0NCj4gPiA+IFRoaXMgcGF0Y2gg
ZGVwZW5kZW50cyBvbiA6ICJtZWRpYTogbXRrLXZjb2RlYzogc3VwcG9ydCBmb3IgTVQ4MTgzDQo+
ID4gPiBkZWNvZGVyIlsxXSBhbmQNCj4gPiA+ICJNZWRpYXRlayBNVDgxOTIgY2xvY2sgc3VwcG9y
dCJbMl0uDQo+ID4gPiANCj4gPiA+IDE6IE11bHRpIGhhcmR3YXJlIGRlY29kZSBpcyBiYXNlZCBv
biBzdGF0ZWxlc3MgZGVjb2RlciwgTVQ4MTgzIGlzDQo+ID4gPiB0aGUgZmlyc3QgdGltZQ0KPiA+
ID4gdG8gYWRkIHN0YXRlbGVzcyBkZWNvZGVyLiBPdGhlcndpc2UgaXQgd2lsbCBjYXVzZSBjb25m
bGljdC4gVGhpcw0KPiA+ID4gcGF0Y2ggd2lsbCBiZQ0KPiA+ID4gYWNjZXB0ZWQgaW4gNS4xNVsx
XS4NCj4gPiA+IA0KPiA+ID4gMjogVGhlIGRlZmluaXRpb24gb2YgZGVjb2RlciBjbG9ja3MgYXJl
IGluIG10ODE5Mi1jbGsuaCwgdGhpcw0KPiA+ID4gcGF0Y2gNCj4gPiA+IGFscmVhZHkgaW4gY2xr
IHRyZWVbMl0uDQo+ID4gPiANCj4gPiA+IFsxXQ0KPiA+ID4gDQpodHRwczovL3BhdGNod29yay5s
aW51eHR2Lm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhL2xpc3QvP3Nlcmllcz01ODI2DQo+ID4gPiBb
Ml0NCj4gPiA+IA0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9n
aXQvY2xrL2xpbnV4LmdpdC9jb21taXQvP2g9Y2xrLW5leHQmaWQ9ZjM1ZjFhMjNlMGUxMmUzMTcz
ZTllOWRlZGJjMTUwZDEzOTAyNzE4OQ0KPiA+ID4gLS0tLQ0KPiA+ID4gQ2hhbmdlcyBjb21wYXJl
ZCB3aXRoIHY1Og0KPiA+ID4gLUFkZCBkZWNvZGVyIGhhcmR3YXJlIGJsb2NrIGRpYWdyYW0gZm9y
IHBhdGNoIDEzLzE1DQo+ID4gPiANCj4gPiANCj4gPiANCj4gPiBUaGUgZGlzY3Vzc2lvbiBvbiB2
NSB3YXMgc3RpbGwgb24tZ29pbmcsIHNvIHNlbmRpbmcgdGhpcyB2Ng0KPiA+IGlzIG5vdCBoZWxw
ZnVsLiBUaGUgY29udGV4dCBmb3IgdjUncyBkaXNjdXNzaW9uIGlzIG5vdyBoYXJkZXIgdG8NCj4g
PiBmaW5kLg0KPiA+IA0KPiA+IFBsZWFzZSBhdm9pZCBzZW5kaW5nIGEgbmV3IHZlcnNpb24gd2l0
aG91dCBwcm9wZXJseQ0KPiA+IGRpc2N1c3NpbmcgYWxsIHRoZSBmZWVkYmFjaywgYW5kIHdpdGhv
dXQgcmVhY2hpbmcgY29uc2Vuc3VzLg0KPiA+IFRoaXMgaXMgdmVyeSBpbXBvcnRhbnQsIHBsZWFz
ZSBrZWVwIGl0IGluIG1pbmQuDQo+ID4gDQo+IA0KPiBUaGFua3MgZm9yIHlvdXIgcmVtaW5kLCBJ
IHdpbGwga2VlcCB0aGlzIHBhdGNoIHVudGlsIGdldCB0aGUNCj4gc29sdXRpb24uDQo+IA0KPiA+
IFNwZWNpZmljYWxseSwgdGhlIGZlZWRiYWNrIG9uIHY1IHdhcyBOQUssIHdpdGggdGhlIHJlcXVl
c3QgdG8gYXZvaWQNCj4gPiB1c2luZyBhbnkgYXN5bmMgZnJhbWV3b3JrLCBhbmQgaW5zdGVhZCB0
cnkgdG8gZmluZCBhIHNpbXBsZXINCj4gPiBzb2x1dGlvbi4NCj4gPiANCj4gPiBGb3IgaW5zdGFu
Y2UsIHlvdSBjYW4gbW9kZWwgdGhpbmdzIHdpdGggYSBidXMtbGlrZSBwYXR0ZXJuLA0KPiA+IHdo
aWNoIHRpZXMgYWxsIHRoZSBkZXZpY2VzIHRvZ2V0aGVyLCB1bmRlciBhIHBhcmVudCBub2RlLg0K
PiA+IFRoaXMgcGF0dGVybiBpcyBjb21tb24gaW4gdGhlIGtlcm5lbCwgdGhlIHBhcmVudA0KPiA+
IG5vZGUgY2FuIHVzZSBvZl9wbGF0Zm9ybV9wb3B1bGF0ZSBvciBzaW1pbGFyDQo+ID4gKGdpdCBn
cmVwIG9mX3BsYXRmb3JtX3BvcHVsYXRlLCB5b3Ugd2lsbCBzZWUgcGxlbnR5IG9mIGV4YW1wbGVz
KS4NCj4gPiANCj4gPiBZb3Ugd2lsbCBzdGlsbCBoYXZlIHRvIGRvIHNvbWUgd29yayB0byBoYXZl
IHRoZSBwcm9wZXINCj4gPiByZWdzIHJlc291cmNlcywgYnV0IHRoaXMgaXMgZG9hYmxlLiBFYWNo
IGNoaWxkIGlzIGEgZGV2aWNlLA0KPiA+IHNvIGl0IGNhbiBoYXZlIGl0cyBvd24gcmVzb3VyY2Vz
IChjbG9ja3MsIGludGVycnVwdHMsIGlvbW11cykuDQo+ID4gDQo+ID4gWW91IGRvbid0IG5lZWQg
YW55IGFzeW5jIGZyYW1ld29yay4NCj4gPiANCj4gDQpUaGFua3MgZm9yIHlvdXIgc3VnZ2VzdGlv
biB2ZXJ5IG11Y2gsIGFuZCB0aGVyZSBhcmUgc2V2ZXJhbCBhY3Rpb25zDQpuZWVkIHRvIGNoZWNr
Lg0KDQoxOiBUaGUgaW9tbXUgcmVnaXN0ZXIgbGlrZSB0aGlzOg0KcmV0ID0gYnVzX3NldF9pb21t
dSgmcGxhdGZvcm1fYnVzX3R5cGUsDQombXRrX2lvbW11X29wcyk7IA0KSXQgZXhwZWN0IHRoZSBj
b25zdW1lciBpcyBhIHN0YW5kYXJkIHBsYXRmb3JtIGRldmljZS4NCm90aGVyd2lzZSBpdA0KY291
bGQgbm90IGVudGVyIHRvIHRoZSBpb21tdSBvZl94bGF0ZS4pDQoNClNvIGlmIHB1dHRpbmcgdGhl
IGlvbW11cyBwcm9wZXJ0eSBpbiB0aGUgY2hpbGQgbm9kZSwgYWxsIHRoZSBjaGlsZA0KZGV2aWNl
IG5lZWQgdG8gcmVnaXN0ZXJlZCBhcyBwbGF0Zm9ybSBkZXZpY2UuDQoNCjI6IEZvciB0aGUgaW50
ZXJydXB0IGluIGVhY2ggY2hpbGQgbm9kZSwgYnV0IHRoZSBsb2dpY2FsIHByb2Nlc3NpbmcgaW4N
CnBhcmVudCBwYXJ0LiBDaGlsZCBhbmQgcGFyZW50IG5lZWQgdG8gc2VuZCBtZXNzYWdlIGZvciBl
YWNoIG90aGVyLiBJbg0Kb3JkZXIgdG8gY29udHJvbCBjbGsvcG93ZXIvaXJxIGZvciBtdWx0aSBp
bnN0YW5jZSwgbmVlZCBzZW5kIG1lc3NhZ2UgdG8NCmNoaWxkIHRvIHNlcGFyYXRlIGRpZmZlcmVu
dCBoYXJkd2FyZTsgY2hpbGQgYWxzbyBuZWVkIHNlbmQgbWVzc2FnZSB0bw0KcGFyZW50IHdoZW4g
Z2V0IGludGVycnVwdC4NCg0KMzogQWJvdXQgQ2hlbi1ZdSdzIG1haWwsIGRvIHlvdSBoYXZlIGFu
eSBhZHZpY2U/DQoNCkRvIHlvdSBoYXZlIGFueSBzdWdnZXN0aW9uIGFib3V0IHRoZXNlIHR3byBz
Y2VuYXJpb3M/DQpJJ20gdmVyeSBoYXBweSB0byBnZXQgeW91ciByZXBseS4NCg0KVGhhbmtzDQpZ
dW5mZWkgRG9uZw0KDQo+ID4gICAgIHZjb2RlY19kZWM6IHZjb2RlY19kZWNAMTYwMDAwMDAgew0K
PiA+ICAgICAgICAgY29tcGF0aWJsZSA9ICJtZWRpYXRlayxtdDgxOTItdmNvZGVjLWRlYyI7DQo+
ID4gICAgICAgICByZWcgPSA8c29tZXRoaW5nPjsNCj4gPiAgICAgICAgIG1lZGlhdGVrLHNjcCA9
IDwmc2NwPjsNCj4gPiAgICAgICAgIGlvbW11cyA9IDwmaW9tbXUwIE00VV9QT1JUX0w0X1ZERUNf
TUNfRVhUPjsNCj4gPiAgICAgICAgIGRtYS1yYW5nZXMgPSA8MHgxIDB4MCAweDAgMHg0MDAwMDAw
MCAweDAgMHhmZmYwMDAwMD47DQo+ID4gDQo+ID4gICAgICAgICB2Y29kZWNfbGF0QDB4MTAwMDAg
ew0KPiA+ICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAibWVkaWF0ZWssbXRrLXZjb2RlYy1sYXQi
Ow0KPiA+ICAgICAgICAgICAgIHJlZyA9IDwweDEwMDAwIDB4ODAwPjsgICAgICAvKiBWREVDX01J
U0MgKi8NCj4gPiAgICAgICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDI2IElSUV9UWVBF
X0xFVkVMX0hJR0ggMD47DQo+ID4gICAgICAgICAgICAgLy8gZXRjDQo+ID4gICAgICAgICB9Ow0K
PiA+IA0KPiA+ICAgICAgICAgdmNvZGVjX2NvcmVAMHgyNTAwMCB7DQo+ID4gICAgICAgICAgICBj
b21wYXRpYmxlID0gIm1lZGlhdGVrLG10ay12Y29kZWMtY29yZSI7DQo+ID4gICAgICAgICAgICBy
ZWcgPSA8MHgyNTAwMCAweDEwMDA+OyAgICAgIC8qIFZERUNfQ09SRV9NSVNDICovDQo+ID4gICAg
ICAgICAgICBpbnRlcnJ1cHRzID0gPEdJQ19TUEkgNDI1IElSUV9UWVBFX0xFVkVMX0hJR0ggMD47
DQo+ID4gICAgICAgICAgICAvLyBldGMNCj4gPiAgICAgICAgIH07DQo+ID4gICAgIH07DQo+ID4g
DQo+ID4gVGhhbmtzLA0KPiA+IEV6ZXF1aWVsDQo=

