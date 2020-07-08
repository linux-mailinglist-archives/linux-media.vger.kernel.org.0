Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A82DC218521
	for <lists+linux-media@lfdr.de>; Wed,  8 Jul 2020 12:40:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728515AbgGHKkd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 8 Jul 2020 06:40:33 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:45472 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728104AbgGHKkd (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 8 Jul 2020 06:40:33 -0400
X-UUID: 35b37eccca7c4e1bbb56518d442a388f-20200708
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=cmUMQrE1Nc11tyoLsvpy8kDypaLzBJ4JZ9W0hcNcjPE=;
        b=UWE+Qb1ECzTIRjNCrd7ahfb4+O4w9e5nfoNN8go7pRw4N415rUYv1v3L1lpAAAabVa42YkZuxSOAMaYweDUBGBRykbdDjLgwH+Hrb/RdQXTs/8kAL8/5k/cPvdNijyBwxeVMrd8FNESLPflGLuyGQrgKn1AT6mgoGnZvyEn+Blw=;
X-UUID: 35b37eccca7c4e1bbb56518d442a388f-20200708
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1482001720; Wed, 08 Jul 2020 18:40:29 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs06n1.mediatek.inc (172.21.101.129) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Jul 2020 18:40:29 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Jul 2020 18:40:26 +0800
From:   Louis Kuo <louis.kuo@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <keiichiw@chromium.org>, <matthias.bgg@gmail.com>,
        <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <louis.kuo@mediatek.com>, <frederic.chen@mediatek.com>,
        <Jerry-ch.Chen@mediatek.com>, <jungo.lin@mediatek.com>,
        <linux-media@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <devicetree@vger.kernel.org>
Subject: [RFC PATCH V7 0/3] media: support Mediatek sensor interface driver
Date:   Wed, 8 Jul 2020 18:40:20 +0800
Message-ID: <20200708104023.3225-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgaXMgdGhlIFJGQyBwYXRjaCBhZGRpbmcgU2Vuc29yIEluZmVyZmFjZShz
ZW5pbmYpIGRyaXZlciBvbiBNZWRpYXRlayBtdDgxODMgU29DLCB3aGljaCB3aWxsIGJlIHVzZWQN
CmluIGNhbWVyYSBmZWF0dXJlcyBvbiBDck9TIGFwcGxpY2F0aW9uLg0KSXQgYmVsb25ncyB0byB0
aGUgZmlyc3QgTWVkaWF0ZWsncyBjYW1lcmEgZHJpdmVyIHNlcmllcyBiYXNlZCBvbiBWNEwyIGFu
ZCBtZWRpYSBjb250cm9sbGVyIGZyYW1ld29yay4NCkkgcG9zdGVkIHRoZSBtYWluIHBhcnQgb2Yg
dGhlIHNlbmluZiBkcml2ZXIgYXMgUkZDIHRvIGRpc2N1c3MgZmlyc3QgYW5kIHdvdWxkIGxpa2Ug
c29tZSByZXZpZXcgY29tbWVudHMNCm9uIHRoZSBvdmVyYWxsIHN0cnVjdHVyZSBvZiB0aGUgZHJp
dmVyLg0KDQpUaGUgZHJpdmVyIGlzIGltcGxlbWVudGVkIHdpdGggVjRMMiBmcmFtZXdvcmsuDQox
LiBSZWdpc3RlciBhcyBhIFY0TDIgc3ViLWRldmljZS4NCjIuIE9ubHkgb25lIGVudGl0eSB3aXRo
IHNpbmsgcGFkcyBsaW5rZWQgdG8gY2FtZXJhIHNlbnNvcnMgZm9yIGNob29zaW5nIGRlc2lyZWQg
Y2FtZXJhIHNlbnNvciBieSBzZXR1cCBsaW5rDQogICBhbmQgd2l0aCBzb3VyY2UgcGFkcyBsaW5r
ZWQgdG8gY2FtLWlvIGZvciByb3V0aW5nIGRpZmZlcmVudCB0eXBlcyBvZiBkZWNvZGVkIHBhY2tl
dCBkYXRhcyB0byBQQVNTMSBkcml2ZXINCiAgIHRvIGdlbmVyYXRlIHNlbnNvciBpbWFnZSBmcmFt
ZSBhbmQgbWV0YS1kYXRhLg0KDQpUaGUgb3ZlcmFsbCBmaWxlIHN0cnVjdHVyZSBvZiB0aGUgc2Vu
aW5mIGRyaXZlciBpcyBhcyBmb2xsb3dpbmc6DQoNCiogbXRrX3NlbmluZi5jOiBJbXBsZW1lbnQg
c29mdHdhcmUgYW5kIEhXIGNvbnRyb2wgZmxvdyBvZiBzZW5pbmYgZHJpdmVyLg0KKiBtdGtfc2Vu
aW5mX2RwaHkuYzogSW1wbGVtZW50IG1pcGktcnggcGh5LWRldmljZSBvZiBzZW5pbmYgZHJpdmVy
Lg0KKiBtdGtfc2VuaW5mX3JlZy5oOiBEZWZpbmUgSFcgcmVnaXN0ZXIgUi9XIG1hY3JvcyBhbmQg
SFcgcmVnaXN0ZXIgbmFtZXMuDQoqIG10a19zZW5pbmZfcnhfcmVnLmg6IERlZmluZSBIVyBSWCBy
ZWdpc3RlciBSL1cgbWFjcm9zIGFuZCBIVyByZWdpc3RlciBuYW1lcy4NCg0KWyBWNzogVXNlIHBo
eSBkZXZpY2UgdG8gY29udHJvbCBtaXBpIGRwaHkgcngsIFNocmluayByZWdpc3RlciBkZWZpbml0
aW9uXQ0KDQogIG1lZGlhOiBwbGF0Zm9ybTogbXRrLWlzcDogQWRkIE1lZGlhdGVrIHNlbnNvciBp
bnRlcmZhY2UgZHJpdmVyDQogIGR0LWJpbmRpbmdzOiBtdDgxODM6IEFkZCBzZW5zb3IgaW50ZXJm
YWNlIGR0LWJpbmRpbmdzDQogIGR0czogYXJtNjQ6IG10ODE4MzogQWRkIHNlbnNvciBpbnRlcmZh
Y2Ugbm9kZXMNCg0KIC4uLi9iaW5kaW5ncy9tZWRpYS9tZWRpYXRlay1zZW5pbmYueWFtbCAgICAg
ICB8ICAyMjMgKysrDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRpYXRlay9tdDgxODMuZHRzaSAg
ICAgIHwgICAyNiArDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9NYWtlZmlsZSAgICAgICAgICAg
ICAgIHwgICAgMSArDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcgICAg
ICAgIHwgICAxOCArDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL01ha2VmaWxlICAg
ICAgIHwgICAgMyArDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL01ha2VmaWxl
ICAgIHwgICAgNyArDQogLi4uL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmYuYyAg
ICAgIHwgIDk3NCArKysrKysrKysrKw0KIC4uLi9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtf
c2VuaW5mX2RwaHkuYyB8ICAzNTMgKysrKw0KIC4uLi9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9t
dGtfc2VuaW5mX3JlZy5oICB8IDE0OTEgKysrKysrKysrKysrKysrKysNCiAuLi4vbXRrLWlzcC9z
ZW5pbmYvbXRrX3NlbmluZl9yeF9yZWcuaCAgICAgICAgfCAgNTE1ICsrKysrKw0KIDEwIGZpbGVz
IGNoYW5nZWQsIDM2MTEgaW5zZXJ0aW9ucygrKQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVu
dGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstc2VuaW5mLnlhbWwNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL01ha2Vm
aWxlDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9z
ZW5pbmYvTWFrZWZpbGUNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9y
bS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mLmMNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX2RwaHkuYw0KIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19z
ZW5pbmZfcmVnLmgNCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstaXNwL3NlbmluZi9tdGtfc2VuaW5mX3J4X3JlZy5oDQoNCg==

