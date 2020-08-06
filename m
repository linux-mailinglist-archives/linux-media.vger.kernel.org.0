Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 28F5523D74F
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 09:30:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728712AbgHFHaI (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 03:30:08 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:42930 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728334AbgHFHaH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 03:30:07 -0400
X-UUID: 720e5f01ea0748e9b15c61dd3ddfae6f-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=HPY1Y8WchrDTl7dW9nXX5eI/MbrnUntKhJLM+zFG4Ko=;
        b=ldAGfpV+ws5Wa7QwAJzZLrDKqDaDR8ozIdBSqykIHKFRRFEkFQi6wM+qWHOelZOB01TJjvtwZjrKyu/m11hOotpa9O3BJYKz33Z4UbsKuynxpieDN9ZSDDMb+G8WhFqLQDE0opBURo472+NRY0zrXnTsoiZWy+MpraCiVFVpc24=;
X-UUID: 720e5f01ea0748e9b15c61dd3ddfae6f-20200806
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by mailgw01.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1028963311; Thu, 06 Aug 2020 15:30:01 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 15:29:59 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 15:29:59 +0800
From:   <frederic.chen@mediatek.com>
To:     <hans.verkuil@cisco.com>,
        <laurent.pinchart+renesas@ideasonboard.com>, <tfiga@chromium.org>,
        <matthias.bgg@gmail.com>, <mchehab@kernel.org>
CC:     <yuzhao@chromium.org>, <zwisler@chromium.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>, <Sean.Cheng@mediatek.com>,
        <sj.huang@mediatek.com>, <christie.yu@mediatek.com>,
        <frederic.chen@mediatek.com>, <linux-media@vger.kernel.org>,
        <srv_heupstream@mediatek.com>
Subject: [PATCH 0/1] media: change media_device_request_alloc to match media_ioctl_info
Date:   Thu, 6 Aug 2020 15:29:51 +0800
Message-ID: <20200806072952.11709-1-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

KioqIEJMVVJCIEhFUkUgKioqDQpIZWxsbywNCg0KVGhpcyBwYXRjaCBpcyB0byBtb2RpZnkgbWVk
aWFfZGV2aWNlX3JlcXVlc3RfYWxsb2MoKSBzbyB0aGF0IGl0IGNhbiBwYXNzDQpDRkkoQ29udHJv
bCBGbG93IEludGVncml0eSkgY2hlY2suIEkgd291bGQgbGlrZSBzb21lIHJldmlldyBjb21tZW50
cy4NCg0KbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxsb2MoKSBpcyBzYXZlZCBpbiBmbiBvZiBtZWRp
YV9pb2N0bF9pbmZvIHN0cnVjdCwNCndoaWNoIGlzIGRlZmluZWQgYXMgbG9uZyAoKmZuKShzdHJ1
Y3QgbWVkaWFfZGV2aWNlICpkZXYsIHZvaWQgKmFyZykuIFRoZQ0KdHlwZSBvZiB0aGUgc2Vjb25k
IHBhcmFtZXRlciBvZiBtZWRpYV9kZXZpY2VfcmVxdWVzdF9hbGxvYygpIGlzIGludCogbm93LA0K
YnV0IGl0IGlzIHZvaWQqIGluIGZuIG9mIG1lZGlhX2lvY3RsX2luZm8uIFdlIGdvdCBzb21lIEFC
SSB2aW9sYXRpb24gaGVyZS4NClRoZXJlZm9yZSwgd2Ugd291bGQgbGlrZSB0byB1c2Ugdm9pZCog
aW5zdGVhZCBvZiBpbnQqIGZvciB0aGUgc2Vjb25kDQpwYXJhbWV0ZXIgb2YgbWVkaWFfZGV2aWNl
X3JlcXVlc3RfYWxsb2MoKS4NCg0Kc3RhdGljIGxvbmcgbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxs
b2Moc3RydWN0IG1lZGlhX2RldmljZSAqbWRldiwNCgkJCQkgICAgICAgaW50ICphbGxvY19mZCk7
DQoNCnN0cnVjdCBtZWRpYV9pb2N0bF9pbmZvIHsNCgl1bnNpZ25lZCBpbnQgY21kOw0KCXVuc2ln
bmVkIHNob3J0IGZsYWdzOw0KCWxvbmcgKCpmbikoc3RydWN0IG1lZGlhX2RldmljZSAqZGV2LCB2
b2lkICphcmcpOw0KCWxvbmcgKCphcmdfZnJvbV91c2VyKSh2b2lkICprYXJnLCB2b2lkIF9fdXNl
ciAqdWFyZywgdW5zaWduZWQgaW50IGNtZCk7DQoJbG9uZyAoKmFyZ190b191c2VyKSh2b2lkIF9f
dXNlciAqdWFyZywgdm9pZCAqa2FyZywgdW5zaWduZWQgaW50IGNtZCk7DQp9Ow0KDQoNCkhlcmUg
aXMgYW4gZXhhbXBsZS4gV2l0aCBBbmRyb2lk4oCZcyBDRkkgY2hlY2tpbmcsIHdlIGdvdCB0aGUg
Zm9sbG93aW5nIGVycm9yDQp3aXRob3V0IHRoaXMgY2hhbmdlLg0KDQpbICAgMjMuNTAyNDc3XSBt
dGstY2FtIHNvYzpjYW1pc3A6IHNkOm10ay1jYW0gcmF3LTAgcGFkOjIgc2V0IGZvcm1hdCB3L2gv
Y29kZSAyMzI4LzE3NDgvMHgzMDA3DQpbICAgMjMuNTE4NjkwXSBLZXJuZWwgcGFuaWMgLSBub3Qg
c3luY2luZzogQ0ZJIGZhaWx1cmUgKHRhcmdldDogbWVkaWFfZGV2aWNlX3JlcXVlc3RfYWxsb2Mr
MHgwLzB4NCkNClsgICAyMy41MTk4MDRdIENQVTogNyBQSUQ6IDgxOCBDb21tOiBtdGt2NGwyX3V0
IFRhaW50ZWQ6IEcgUyAgICAgICAgIE8gICAgICA1LjQuMzktZzAyYzBhNDg1OGJlZC1kaXJ0eSAj
NDUNClsgICAyMy41MjE1NTNdIENhbGwgdHJhY2U6DQpbICAgMjMuNTIxODY4XSAgZHVtcF9iYWNr
dHJhY2UuY2ZpX2p0KzB4MC8weDQNClsgICAyMy41MjIzODldICBkdW1wX3N0YWNrKzB4YjgvMHgx
MTQNClsgICAyMy41MjI4MjRdICBwYW5pYysweDE3MC8weDNlMA0KWyAgIDIzLjUyMzIxNV0gIF9f
dWJzYW5faGFuZGxlX2NmaV9jaGVja19mYWlsX2Fib3J0KzB4MC8weDE0DQpbICAgMjMuNTIzODk2
XSAgcGVyZl9wcm9jX3VwZGF0ZV9oYW5kbGVyKzB4MC8weGNjDQpbICAgMjMuNTI0NDYwXSAgX19j
ZmlfY2hlY2srMHg2MTBjYy8weDY4ZWYwDQpbICAgMjMuNTI0OTU5XSAgbWVkaWFfZGV2aWNlX2lv
Y3RsKzB4MjE4LzB4MjM4DQpbICAgMjMuNTI1NDg4XSAgbWVkaWFfZGV2aWNlX2NvbXBhdF9pb2N0
bCsweDYwLzB4N2MNClsgICAyMy41MjYwNzJdICBtZWRpYV9jb21wYXRfaW9jdGwrMHg1OC8weDlj
DQpbICAgMjMuNTI2NTgxXSAgX19hcm02NF9jb21wYXRfc3lzX2lvY3RsKzB4MTBjLzB4NDM0DQpb
ICAgMjMuNTI3MTc2XSAgZWwwX3N2Y19jb21tb24rMHhiNC8weDE4Yw0KWyAgIDIzLjUyNzY1MV0g
IGVsMF9zdmNfY29tcGF0X2hhbmRsZXIrMHgxYy8weDI4DQpbICAgMjMuNTI4MjAyXSAgZWwwX3N2
Y19jb21wYXQrMHg4LzB4MjQNClsgICAyMy41Mjg2NTldIFNNUDogc3RvcHBpbmcgc2Vjb25kYXJ5
IENQVXMNClsgICAyMy41MjkxNjFdIEtlcm5lbCBPZmZzZXQ6IDB4MjRiOGMwMDAwMCBmcm9tIDB4
ZmZmZmZmYzAxMDAwMDAwMA0KWyAgIDIzLjUyOTkwNl0gUEhZU19PRkZTRVQ6IDB4ZmZmZmZmZGQw
MDAwMDAwMA0KWyAgIDIzLjUzMDQzNF0gQ1BVIGZlYXR1cmVzOiAweDAwMDAwMDA2LDJhODBhMjM4
DQpbICAgMjMuNTMwOTgzXSBNZW1vcnkgTGltaXQ6IG5vbmUNClBQTF9MT0dfU1RPUkU6IGNoZWNr
IG9uY2UsIHNpZyB2YWx1ZSAweDI3LCBhZGRyIDB4MTE2MDAwLg0KDQoNCkZyZWRlcmljIENoZW4g
KDEpOg0KICBtZWRpYTogbWMtZGV2aWNlLmM6IGNoYW5nZSBtZWRpYV9kZXZpY2VfcmVxdWVzdF9h
bGxvYyB0byBtYXRjaA0KICAgIG1lZGlhX2lvY3RsX2luZm8NCg0KIGRyaXZlcnMvbWVkaWEvbWMv
bWMtZGV2aWNlLmMgfCA1ICsrKy0tDQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwg
MiBkZWxldGlvbnMoLSkNCg0K

