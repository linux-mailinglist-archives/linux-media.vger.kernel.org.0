Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9596A1A42E0
	for <lists+linux-media@lfdr.de>; Fri, 10 Apr 2020 09:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726657AbgDJHRl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 10 Apr 2020 03:17:41 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:8319 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725858AbgDJHRl (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 10 Apr 2020 03:17:41 -0400
X-UUID: 7a06195a8f71485d999338faa905be88-20200410
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=vYfMs9/1iEBCtaElVkxErOIYD7/OvfRvtH3nKu3LNUQ=;
        b=JZwCQi0BcDi3Z/Px6HO/Sb4JfPtAETUG5+XDpnZ9t5up8b5JVB+7Cd4FZMWziy7OjyyMapao3XGo1fDzFRA/UeOxvEAmsrMtUDlq8hqqe/KzDO7nvgLxynIK6W8ZenUBsjUaMulM3YhU9mg7eNEKzI8S4S15saBk2iZPL/B434o=;
X-UUID: 7a06195a8f71485d999338faa905be88-20200410
Received: from mtkcas07.mediatek.inc [(172.21.101.84)] by mailgw01.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1316574916; Fri, 10 Apr 2020 15:17:34 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 10 Apr 2020 15:17:30 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 10 Apr 2020 15:17:30 +0800
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
Subject: [RFC PATCH V6 0/3] media: support Mediatek sensor interface driver
Date:   Fri, 10 Apr 2020 15:17:20 +0800
Message-ID: <20200410071723.19720-1-louis.kuo@mediatek.com>
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
aW5mX3JlZy5oOiBEZWZpbmUgSFcgcmVnaXN0ZXIgUi9XIG1hY3JvcyBhbmQgSFcgcmVnaXN0ZXIg
bmFtZXMuDQoqIG10a19zZW5pbmZfcnhfcmVnLmg6IERlZmluZSBIVyBSWCByZWdpc3RlciBSL1cg
bWFjcm9zIGFuZCBIVyByZWdpc3RlciBuYW1lcy4NCg0KWyBWNjogQ2hhbmdlIHBhcnNlIGVuZHBv
aW50cyBBUEksIGZpeCBjb2Rpbmcgc3R5bGUsIHJlZmluZSBlcnJvciBoYW5kbGluZyBhbmQgcmV0
dXJuIHZhbHVlLA0KcmVtb3ZlIHJlZHVuZGFudCBtYWNyb3MgYW5kIGhlYWRlciBmaWxlc10NCg0K
ICBtZWRpYTogcGxhdGZvcm06IG10ay1pc3A6IEFkZCBNZWRpYXRlayBzZW5zb3IgaW50ZXJmYWNl
IGRyaXZlcg0KICBkdC1iaW5kaW5nczogbXQ4MTgzOiBBZGQgc2Vuc29yIGludGVyZmFjZSBkdC1i
aW5kaW5ncw0KICBkdHM6IGFybTY0OiBtdDgxODM6IEFkZCBzZW5zb3IgaW50ZXJmYWNlIG5vZGVz
DQoNCiAuLi4vYmluZGluZ3MvbWVkaWEvbWVkaWF0ZWstc2VuaW5mLnlhbWwgICAgICAgfCAgMjE5
ICsrKw0KIGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ4MTgzLmR0c2kgICAgICB8ICAg
MjUgKw0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vTWFrZWZpbGUgICAgICAgICAgICAgICB8ICAg
IDEgKw0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9LY29uZmlnICAgICAgICB8ICAg
MTggKw0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9NYWtlZmlsZSAgICAgICB8ICAg
IDMgKw0KIC4uLi9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9NYWtlZmlsZSAgICB8ICAg
IDUgKw0KIGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9zZW5pbmYvVE9ETyAgICB8ICAg
MTggKw0KIC4uLi9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5mLmMgICAgICB8IDEx
NzMgKysrKysrKysrKysrKw0KIC4uLi9wbGF0Zm9ybS9tdGstaXNwL3NlbmluZi9tdGtfc2VuaW5m
X3JlZy5oICB8IDE0OTEgKysrKysrKysrKysrKysrKysNCiAuLi4vbXRrLWlzcC9zZW5pbmYvbXRr
X3NlbmluZl9yeF9yZWcuaCAgICAgICAgfCAxMzk4ICsrKysrKysrKysrKysrKysNCiAxMCBmaWxl
cyBjaGFuZ2VkLCA0MzUxIGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXNlbmluZi55YW1sDQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9LY29uZmln
DQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXRrLWlzcC9NYWtl
ZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Av
c2VuaW5mL01ha2VmaWxlDQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWVkaWEvcGxhdGZv
cm0vbXRrLWlzcC9zZW5pbmYvVE9ETw0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmYuYw0KIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1pc3Avc2VuaW5mL210a19zZW5pbmZfcmVnLmgN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL3Nlbmlu
Zi9tdGtfc2VuaW5mX3J4X3JlZy5oDQoNCg==

