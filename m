Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2857114C749
	for <lists+linux-media@lfdr.de>; Wed, 29 Jan 2020 09:17:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726206AbgA2IRA (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 Jan 2020 03:17:00 -0500
Received: from mailgw02.mediatek.com ([210.61.82.184]:40454 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726116AbgA2IRA (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 Jan 2020 03:17:00 -0500
X-UUID: f4fec480e5a94d5fb23b741580d1b59c-20200129
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=pAeCviEgp5SyhyDozmBEeXR8il9ypqHLYGqVz9VurIU=;
        b=c4DqkSMXTCTiAeRIoSD0X8bqQpDGceYRNDWUdKL0JRQZI9Iq9v2uSy+Xy080RlmGoOohYqMe8bdTmxdj33WdWrw2O/iTfR5nRKFaWIGyLWFwiLGp8mC/BvDAcsTM2rZXEvGKaCvunASKQ+0zslscVlWP2Helge4MMWS3lr76KUY=;
X-UUID: f4fec480e5a94d5fb23b741580d1b59c-20200129
Received: from mtkcas06.mediatek.inc [(172.21.101.30)] by mailgw02.mediatek.com
        (envelope-from <louis.kuo@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 143140981; Wed, 29 Jan 2020 16:16:58 +0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 29 Jan 2020 16:16:56 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 29 Jan 2020 16:17:02 +0800
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
        <Rynn.Wu@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>, <devicetree@vger.kernel.org>
Subject: [RFC PATCH V5 0/3] media: support Mediatek sensor interface driver 
Date:   Wed, 29 Jan 2020 16:16:47 +0800
Message-ID: <20200129081650.8027-1-louis.kuo@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain
X-TM-SNTS-SMTP: 70D65C83CC9C06DA6BDFA9C6C27F4D408CC3BC8D2095CBD9243989F3B9DC9A682000:8
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
aW5mX2RlZi5oOiBEZWZpbmUgZGF0YSBzdHJ1Y3R1cmUgYW5kIGVudW1lcmF0aW9uLg0KKiBtdGtf
c2VuaW5mX3JlZy5oOiBEZWZpbmUgSFcgcmVnaXN0ZXIgUi9XIG1hY3JvcyBhbmQgSFcgcmVnaXN0
ZXIgbmFtZXMuDQoNClsgVjU6IHVzZSByZWNvbW1lbmRlZCBjb2Rpbmcgc3R5bGUsIHJldmlzZSBE
VCBiaW5kaW5nIGRvY3VtZW50YXRpb25dDQoNCiAgbWVkaWE6IHBsYXRmb3JtOiBtdGstaXNwOiBB
ZGQgTWVkaWF0ZWsgc2Vuc29yIGludGVyZmFjZSBkcml2ZXINCiAgZHQtYmluZGluZ3M6IG10ODE4
MzogQWRkIHNlbnNvciBpbnRlcmZhY2UgZHQtYmluZGluZ3MNCiAgZHRzOiBhcm02NDogbXQ4MTgz
OiBBZGQgc2Vuc29yIGludGVyZmFjZSBub2Rlcw0KDQogLi4uL2JpbmRpbmdzL21lZGlhL21lZGlh
dGVrLXNlbmluZi50eHQgICAgICAgIHwgICA2NiArDQogYXJjaC9hcm02NC9ib290L2R0cy9tZWRp
YXRlay9tdDgxODMuZHRzaSAgICAgIHwgICAxMiArDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9N
YWtlZmlsZSAgICAgICAgICAgICAgIHwgICAgMSArDQogZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9t
dGstaXNwL0tjb25maWcgICAgICAgIHwgICAxNyArDQogLi4uL21lZGlhL3BsYXRmb3JtL210ay1p
c3AvaXNwXzUwL01ha2VmaWxlICAgIHwgICAgMyArDQogLi4uL3BsYXRmb3JtL210ay1pc3AvaXNw
XzUwL3NlbmluZi9NYWtlZmlsZSAgIHwgICAgNiArDQogLi4uL210ay1pc3AvaXNwXzUwL3Nlbmlu
Zi9tdGtfc2VuaW5mLmMgICAgICAgIHwgMTExMiArKysNCiAuLi4vbXRrLWlzcC9pc3BfNTAvc2Vu
aW5mL210a19zZW5pbmZfZGVmLmggICAgfCAgIDcyICsNCiAuLi4vbXRrLWlzcC9pc3BfNTAvc2Vu
aW5mL210a19zZW5pbmZfcmVnLmggICAgfCA3NzQ3ICsrKysrKysrKysrKysrKysrDQogOSBmaWxl
cyBjaGFuZ2VkLCA5MDM2IGluc2VydGlvbnMoKykNCiBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21lZGlhL21lZGlhdGVrLXNlbmluZi50eHQNCiBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL0tjb25maWcN
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL2lzcF81
MC9NYWtlZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL210
ay1pc3AvaXNwXzUwL3NlbmluZi9NYWtlZmlsZQ0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21lZGlhL3BsYXRmb3JtL210ay1pc3AvaXNwXzUwL3NlbmluZi9tdGtfc2VuaW5mLmMNCiBjcmVh
dGUgbW9kZSAxMDA2NDQgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstaXNwL2lzcF81MC9zZW5p
bmYvbXRrX3NlbmluZl9kZWYuaA0KIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21lZGlhL3Bs
YXRmb3JtL210ay1pc3AvaXNwXzUwL3NlbmluZi9tdGtfc2VuaW5mX3JlZy5oDQoNCg==

