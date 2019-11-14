Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 933A5FC17F
	for <lists+linux-media@lfdr.de>; Thu, 14 Nov 2019 09:24:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfKNIYt (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 Nov 2019 03:24:49 -0500
Received: from Mailgw01.mediatek.com ([1.203.163.78]:50813 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725920AbfKNIYt (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 Nov 2019 03:24:49 -0500
X-UUID: dd95c5a7a6eb42b895d11eb66e6739c9-20191114
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=kexpRd4flOuhangcMaXAJjeofb2Q82afKSKqLkqvJp8=;
        b=J21jGvIKR+7w3H6lnBvOVb2VcJynQrkXU64lSVnr1xrbBEBMAZ3BO8j68f1xwLDmB4IdPOMKC/clwcHD1IDdzQaLX710O8UnO+0xrAVPCS2hzpjnzM40CUGFc/VpKgqPSErEIz4BmBfDoq1zifoq/S4gJ7HVWDi/h9Kcum2Xk0Q=;
X-UUID: dd95c5a7a6eb42b895d11eb66e6739c9-20191114
Received: from mtkcas36.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 1813750280; Thu, 14 Nov 2019 16:24:37 +0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N2.mediatek.inc
 (172.27.4.87) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Thu, 14 Nov
 2019 16:24:33 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 14 Nov 2019 16:24:32 +0800
Message-ID: <1573719874.7173.11.camel@mhfsdcap03>
Subject: Re: [PATCH v2 12/13] usb: gadget: udc: gr_udc: create debugfs
 directory under usb root
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     Felipe Balbi <balbi@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Peter Chen <Peter.Chen@nxp.com>,
        Minas Harutyunyan <hminas@synopsys.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Kevin Cernekee <cernekee@gmail.com>,
        Florian Fainelli <f.fainelli@gmail.com>,
        <bcm-kernel-feedback-list@broadcom.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>, Bin Liu <b-liu@ti.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        "Stephen Boyd" <swboyd@chromium.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Colin Ian King <colin.king@canonical.com>,
        Biju Das <biju.das@bp.renesas.com>,
        "Fabrizio Castro" <fabrizio.castro@bp.renesas.com>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Yangtao Li <tiny.windzz@gmail.com>,
        <linux-media@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Thu, 14 Nov 2019 16:24:34 +0800
In-Reply-To: <20191114032117.GA130252@kroah.com>
References: <1573541519-28488-1-git-send-email-chunfeng.yun@mediatek.com>
         <1573541519-28488-12-git-send-email-chunfeng.yun@mediatek.com>
         <20191114032117.GA130252@kroah.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 94DD5A98996FAB57FF50602EBAAB0F99593AF0E7BCF212FC48787D535B2269092000:8
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

T24gVGh1LCAyMDE5LTExLTE0IGF0IDExOjIxICswODAwLCBHcmVnIEtyb2FoLUhhcnRtYW4gd3Jv
dGU6DQo+IE9uIFR1ZSwgTm92IDEyLCAyMDE5IGF0IDAyOjUxOjU4UE0gKzA4MDAsIENodW5mZW5n
IFl1biB3cm90ZToNCj4gPiBOb3cgdGhlIFVTQiBnYWRnZXQgc3Vic3lzdGVtIGNhbiB1c2UgdGhl
IFVTQiBkZWJ1Z2ZzIHJvb3QgZGlyZWN0b3J5LA0KPiA+IHNvIG1vdmUgaXQncyBkaXJlY3Rvcnkg
ZnJvbSB0aGUgcm9vdCBvZiB0aGUgZGVidWdmcyBmaWxlc3lzdGVtIGludG8NCj4gPiB0aGUgcm9v
dCBvZiB1c2INCj4gPiANCj4gPiBTaWduZWQtb2ZmLWJ5OiBDaHVuZmVuZyBZdW4gPGNodW5mZW5n
Lnl1bkBtZWRpYXRlay5jb20+DQo+ID4gLS0tDQo+ID4gdjI6DQo+ID4gICAxLiBhYmFuZG9uIG5l
dyBBUEkgdXNiX2RlYnVnZnNfY3JlYXRlX2RpcigpLCBhbmQgdXNlIHVzYl9kZWJ1Z19yb290DQo+
ID4gLS0tDQo+ID4gIGRyaXZlcnMvdXNiL2dhZGdldC91ZGMvZ3JfdWRjLmMgfCAyICstDQo+ID4g
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQ0KPiA+IA0KPiA+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jIGIvZHJpdmVycy91
c2IvZ2FkZ2V0L3VkYy9ncl91ZGMuYw0KPiA+IGluZGV4IDdhMGU5YTU4YzJkOC4uNWZhYTA5YTZj
NzcwIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvdXNiL2dhZGdldC91ZGMvZ3JfdWRjLmMNCj4g
PiArKysgYi9kcml2ZXJzL3VzYi9nYWRnZXQvdWRjL2dyX3VkYy5jDQo+ID4gQEAgLTIwOCw3ICsy
MDgsNyBAQCBzdGF0aWMgdm9pZCBncl9kZnNfY3JlYXRlKHN0cnVjdCBncl91ZGMgKmRldikNCj4g
PiAgew0KPiA+ICAJY29uc3QgY2hhciAqbmFtZSA9ICJncl91ZGNfc3RhdGUiOw0KPiA+ICANCj4g
PiAtCWRldi0+ZGZzX3Jvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZGV2LT5kZXYp
LCBOVUxMKTsNCj4gPiArCWRldi0+ZGZzX3Jvb3QgPSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoZGV2X25h
bWUoZGV2LT5kZXYpLCB1c2JfZGVidWdfcm9vdCk7DQo+ID4gIAlkZWJ1Z2ZzX2NyZWF0ZV9maWxl
KG5hbWUsIDA0NDQsIGRldi0+ZGZzX3Jvb3QsIGRldiwgJmdyX2Rmc19mb3BzKTsNCj4gPiAgfQ0K
PiA+ICANCj4gDQo+IFRoaXMgYnJlYWtzIHRoZSBidWlsZDoNCj4gZHJpdmVycy91c2IvZ2FkZ2V0
L3VkYy9ncl91ZGMuYzogSW4gZnVuY3Rpb24g4oCYZ3JfZGZzX2NyZWF0ZeKAmToNCj4gZHJpdmVy
cy91c2IvZ2FkZ2V0L3VkYy9ncl91ZGMuYzoyMTE6NTc6IGVycm9yOiDigJh1c2JfZGVidWdfcm9v
dOKAmSB1bmRlY2xhcmVkIChmaXJzdCB1c2UgaW4gdGhpcyBmdW5jdGlvbikNCj4gICAyMTEgfCAg
ZGV2LT5kZnNfcm9vdCA9IGRlYnVnZnNfY3JlYXRlX2RpcihkZXZfbmFtZShkZXYtPmRldiksIHVz
Yl9kZWJ1Z19yb290KTsNCj4gICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIF5+fn5+fn5+fn5+fn5+DQo+IGRyaXZlcnMvdXNiL2dh
ZGdldC91ZGMvZ3JfdWRjLmM6MjExOjU3OiBub3RlOiBlYWNoIHVuZGVjbGFyZWQgaWRlbnRpZmll
ciBpcyByZXBvcnRlZCBvbmx5IG9uY2UgZm9yIGVhY2ggZnVuY3Rpb24gaXQgYXBwZWFycyBpbg0K
PiBtYWtlWzRdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjY1OiBkcml2ZXJzL3VzYi9n
YWRnZXQvdWRjL2dyX3VkYy5vXSBFcnJvciAxDQo+IA0KPiBzbyBJJ3ZlIGRyb3BwZWQgaXQgZnJv
bSB0aGUgcGF0Y2ggc2VyaWVzLg0KPiANCj4gUGxlYXNlIGZpeCB1cCBhbmQgcmVzZW5kLg0KT2sN
Cj4gDQo+IEFuZCBvZiBjb3Vyc2UsIGFsd2F5cyB0ZXN0LWJ1aWxkIHlvdXIgcGF0Y2hlcyBiZWZv
cmUgeW91IHNlbmQgdGhlbQ0KPiBvdXQuLi4NClNvcnJ5LCB3aWxsIGRvIGl0DQo+IA0KPiBncmVn
IGstaA0KDQo=

