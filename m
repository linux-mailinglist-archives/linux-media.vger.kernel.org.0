Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C706738DF4E
	for <lists+linux-media@lfdr.de>; Mon, 24 May 2021 04:39:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbhEXCk4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 23 May 2021 22:40:56 -0400
Received: from mailgw02.mediatek.com ([1.203.163.81]:55835 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S231867AbhEXCkz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 23 May 2021 22:40:55 -0400
X-UUID: 737b6e8ce1a34f3aa17a5d8a8ca6d708-20210524
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=VHbcpkFfbs5kF0/zn1F4IWFknNucu5ih4bu3s4aofUc=;
        b=RJNUy4y0MAik8FXA1WU86JxWfuDnqNzOSAM9DnfavLIY6/a/2ytwQPo1BAyxz8A0IrdCLgFJQKMlizqQY5kA0M71b9N/6ZBEkMmxivaVJxAQhMnKguZWK8y4AYSkLiBATFQn0fKVreV2S1LZhuhmkr4Ls3KpxBPc5LAKdkn39yY=;
X-UUID: 737b6e8ce1a34f3aa17a5d8a8ca6d708-20210524
Received: from mtkcas34.mediatek.inc [(172.27.4.253)] by mailgw02.mediatek.com
        (envelope-from <irui.wang@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 179658104; Mon, 24 May 2021 10:39:23 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Mon, 24 May
 2021 10:39:19 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 24 May 2021 10:39:18 +0800
Message-ID: <1621823958.25430.4.camel@mhfsdcap03>
Subject: Re: [PATCH v4,6/6] media: mtk-vcodec: Support MT8192 H264 4K
 encoding
From:   Irui Wang <irui.wang@mediatek.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
CC:     Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Maoguang Meng <maoguang.meng@mediatek.com>,
        "Longfei Wang" <longfei.wang@mediatek.com>,
        Yong Wu <yong.wu@mediatek.com>,
        "Yunfei Dong" <yunfei.dong@mediatek.com>,
        Fritz Koenig <frkoenig@chromium.org>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-arm-kernel@lists.infradead.org>,
        <srv_heupstream@mediatek.com>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date:   Mon, 24 May 2021 10:39:18 +0800
In-Reply-To: <CA+Px+wU+6AtcFLxAHrEXOK=E+LhwM2iX0R0JOgBvv-xzGO=Bcw@mail.gmail.com>
References: <20210521070139.20644-1-irui.wang@mediatek.com>
         <20210521070139.20644-7-irui.wang@mediatek.com>
         <CA+Px+wU+6AtcFLxAHrEXOK=E+LhwM2iX0R0JOgBvv-xzGO=Bcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 49EE3BB53A0A8C67CE60DFA93A027160F4556136395BD1B7E64842F9AF2E067B2000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gRnJpLCAyMDIxLTA1LTIxIGF0IDE2OjA2ICswODAwLCBUenVuZy1CaSBTaGloIHdyb3RlOg0K
PiBPbiBGcmksIE1heSAyMSwgMjAyMSBhdCAzOjAyIFBNIElydWkgV2FuZyA8aXJ1aS53YW5nQG1l
ZGlhdGVrLmNvbT4gd3JvdGU6DQo+ID4gICAgICAgICBmc2l6ZS0+dHlwZSA9IFY0TDJfRlJNU0la
RV9UWVBFX1NURVBXSVNFOw0KPiA+IC0gICAgICAgZnNpemUtPnN0ZXB3aXNlID0gbXRrX3ZlbmNf
ZnJhbWVzaXplczsNCj4gPiArICAgICAgIGZzaXplLT5zdGVwd2lzZSA9DQo+ID4gKyAgICAgICAg
ICAgICAgIChjdHgtPmRldi0+ZW5jX2NhcGFiaWxpdHkgJiBNVEtfVkVOQ180S19DQVBBQklMSVRZ
X0VOQUJMRSkgPw0KPiA+ICsgICAgICAgICAgICAgICBtdGtfdmVuY180a19mcmFtZXNpemVzIDog
bXRrX3ZlbmNfaGRfZnJhbWVzaXplczsNCj4gDQo+IFVzZSBhIG5vcm1hbCBpZiAuLiBlbHNlIC4u
IGlzIG1vcmUgcmVhZGFibGUuDQppZiAoY3R4LT5kZXYtPmVuY19jYXBhYmlsaXR5ICYgTVRLX1ZF
TkNfNEtfQ0FQQUJJTElUWV9FTkFCTEUpDQoJZnNpemUtPnN0ZXB3aXNlID0gbXRrX3ZlbmNfNGtf
ZnJhbWVzaXplczsNCmVsc2UNCglmc2l6ZS0+c3RlcHdpc2UgPSBtdGtfdmVuY19oZF9mcmFtZXNp
emVzOw0KDQo+IA0KPiA+IEBAIC0xMjEwLDYgKzEyMzEsOSBAQCBpbnQgbXRrX3Zjb2RlY19lbmNf
Y3RybHNfc2V0dXAoc3RydWN0IG10a192Y29kZWNfY3R4ICpjdHgpDQo+ID4gIHsNCj4gPiAgICAg
ICAgIGNvbnN0IHN0cnVjdCB2NGwyX2N0cmxfb3BzICpvcHMgPSAmbXRrX3Zjb2RlY19lbmNfY3Ry
bF9vcHM7DQo+ID4gICAgICAgICBzdHJ1Y3QgdjRsMl9jdHJsX2hhbmRsZXIgKmhhbmRsZXIgPSAm
Y3R4LT5jdHJsX2hkbDsNCj4gPiArICAgICAgIGNvbnN0IHU4IGgyNjRfbWF4X2xldmVsID0NCj4g
PiArICAgICAgICAgICAgICAgKGN0eC0+ZGV2LT5lbmNfY2FwYWJpbGl0eSAmIE1US19WRU5DXzRL
X0NBUEFCSUxJVFlfRU5BQkxFKSA/DQo+ID4gKyAgICAgICAgICAgICAgIFY0TDJfTVBFR19WSURF
T19IMjY0X0xFVkVMXzVfMSA6IFY0TDJfTVBFR19WSURFT19IMjY0X0xFVkVMXzRfMjsNCj4gQWdh
aW4sIEkgd291bGQgbGlrZSBpdCB0byBiZSBhIG5vcm1hbCBpZiAuLiBlbHNlIC4uDQp1OCBoMjY0
X21heF9sZXZlbDsNCmlmIChjdHgtPmRldi0+ZW5jX2NhcGFiaWxpdHkgJiBNVEtfVkVOQ180S19D
QVBBQklMSVRZX0VOQUJMRSkNCgloMjY0X21heF9sZXZlbCA9IFY0TDJfTVBFR19WSURFT19IMjY0
X0xFVkVMXzVfMTsNCmVsc2UNCgloMjY0X21heF9sZXZlbCA9IFY0TDJfTVBFR19WSURFT19IMjY0
X0xFVkVMXzRfMjsNCg0KUGF0Y2ggVjUgd2lsbCBiZSBzZW50IHdpdGggdGhlc2UgaWYgdGhlcmUg
aXMgbm8gbW9yZSBjb21tZW50cy4NCg==

