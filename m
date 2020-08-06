Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBAB223DF9B
	for <lists+linux-media@lfdr.de>; Thu,  6 Aug 2020 19:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729125AbgHFRvG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Aug 2020 13:51:06 -0400
Received: from mailgw02.mediatek.com ([210.61.82.184]:38380 "EHLO
        mailgw02.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728751AbgHFQdf (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Aug 2020 12:33:35 -0400
X-UUID: 0d2511c30ab54283b397c23470cd2c7e-20200806
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=OtJd/yRRZV8IvkNBbGFYLaPgoO8DWoAzhEC+fs64370=;
        b=T6rsCij1uCd9/OEjGIssBIhMIxwXMYtiMCMd0VsqyWPgrdzoU3Pe+aoAClLqm2LzQgHAgmKVANH3COsw6Bulk1eSLcjyZThm98tfPtbttAq7nDOcWwwijoU+Hdh3rvVLIgENNDwMoB92hgjk5VU5Z6+7QgCxoLcnJf1dJ166uvs=;
X-UUID: 0d2511c30ab54283b397c23470cd2c7e-20200806
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
        (envelope-from <frederic.chen@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 1127826263; Thu, 06 Aug 2020 23:58:32 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n1.mediatek.inc (172.21.101.15) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 6 Aug 2020 23:58:28 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 6 Aug 2020 23:58:29 +0800
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
Subject: [PATCH V2,0/1] media: change media_device_request_alloc to match media_ioctl_info
Date:   Thu, 6 Aug 2020 23:58:21 +0800
Message-ID: <20200806155822.3772-1-frederic.chen@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGVsbG8sDQoNClRoaXMgcGF0Y2ggaXMgdG8gbW9kaWZ5IG1lZGlhX2RldmljZV9yZXF1ZXN0X2Fs
bG9jKCkgc28gdGhhdCBpdCBjYW4gcGFzcw0KQ0ZJKENvbnRyb2wgRmxvdyBJbnRlZ3JpdHkpIGNo
ZWNrLiBJIHdvdWxkIGxpa2Ugc29tZSByZXZpZXcgY29tbWVudHMuDQoNCm1lZGlhX2RldmljZV9y
ZXF1ZXN0X2FsbG9jKCkgaXMgc2F2ZWQgaW4gZm4gb2YgbWVkaWFfaW9jdGxfaW5mbyBzdHJ1Y3Qs
DQp3aGljaCBpcyBkZWZpbmVkIGFzIGxvbmcgKCpmbikoc3RydWN0IG1lZGlhX2RldmljZSAqZGV2
LCB2b2lkICphcmcpLiBUaGUNCnR5cGUgb2YgdGhlIHNlY29uZCBwYXJhbWV0ZXIgb2YgbWVkaWFf
ZGV2aWNlX3JlcXVlc3RfYWxsb2MoKSBpcyBpbnQqIG5vdywNCmJ1dCBpdCBpcyB2b2lkKiBpbiBm
biBvZiBtZWRpYV9pb2N0bF9pbmZvLiBXZSBnb3Qgc29tZSBBQkkgdmlvbGF0aW9uIGhlcmUuDQpU
aGVyZWZvcmUsIHdlIHdvdWxkIGxpa2UgdG8gdXNlIHZvaWQqIGluc3RlYWQgb2YgaW50KiBmb3Ig
dGhlIHNlY29uZA0KcGFyYW1ldGVyIG9mIG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKCkuDQoN
CnN0YXRpYyBsb25nIG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKHN0cnVjdCBtZWRpYV9kZXZp
Y2UgKm1kZXYsDQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBpbnQgKmFs
bG9jX2ZkKTsNCg0Kc3RydWN0IG1lZGlhX2lvY3RsX2luZm8gew0KICAgICAgICB1bnNpZ25lZCBp
bnQgY21kOw0KICAgICAgICB1bnNpZ25lZCBzaG9ydCBmbGFnczsNCiAgICAgICAgbG9uZyAoKmZu
KShzdHJ1Y3QgbWVkaWFfZGV2aWNlICpkZXYsIHZvaWQgKmFyZyk7DQogICAgICAgIGxvbmcgKCph
cmdfZnJvbV91c2VyKSh2b2lkICprYXJnLCB2b2lkIF9fdXNlciAqdWFyZywgdW5zaWduZWQgaW50
IGNtZCk7DQogICAgICAgIGxvbmcgKCphcmdfdG9fdXNlcikodm9pZCBfX3VzZXIgKnVhcmcsIHZv
aWQgKmthcmcsIHVuc2lnbmVkIGludCBjbWQpOw0KfTsNCg0KDQpIZXJlIGlzIGFuIGV4YW1wbGUu
IFdpdGggQW5kcm9pZOKAmXMgQ0ZJIGNoZWNraW5nLCB3ZSBnb3QgdGhlIGZvbGxvd2luZyBlcnJv
cg0Kd2l0aG91dCB0aGlzIGNoYW5nZS4NCg0KWyAgIDIzLjUwMjQ3N10gbXRrLWNhbSBzb2M6Y2Ft
aXNwOiBzZDptdGstY2FtIHJhdy0wIHBhZDoyIHNldCBmb3JtYXQgdy9oL2NvZGUgMjMyOC8xNzQ4
LzB4MzAwNw0KWyAgIDIzLjUxODY5MF0gS2VybmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IENGSSBm
YWlsdXJlICh0YXJnZXQ6IG1lZGlhX2RldmljZV9yZXF1ZXN0X2FsbG9jKzB4MC8weDQpDQpbICAg
MjMuNTE5ODA0XSBDUFU6IDcgUElEOiA4MTggQ29tbTogbXRrdjRsMl91dCBUYWludGVkOiBHIFMg
ICAgICAgICBPICAgICAgNS40LjM5LWcwMmMwYTQ4NThiZWQtZGlydHkgIzQ1DQpbICAgMjMuNTIx
NTUzXSBDYWxsIHRyYWNlOg0KWyAgIDIzLjUyMTg2OF0gIGR1bXBfYmFja3RyYWNlLmNmaV9qdCsw
eDAvMHg0DQpbICAgMjMuNTIyMzg5XSAgZHVtcF9zdGFjaysweGI4LzB4MTE0DQpbICAgMjMuNTIy
ODI0XSAgcGFuaWMrMHgxNzAvMHgzZTANClsgICAyMy41MjMyMTVdICBfX3Vic2FuX2hhbmRsZV9j
ZmlfY2hlY2tfZmFpbF9hYm9ydCsweDAvMHgxNA0KWyAgIDIzLjUyMzg5Nl0gIHBlcmZfcHJvY191
cGRhdGVfaGFuZGxlcisweDAvMHhjYw0KWyAgIDIzLjUyNDQ2MF0gIF9fY2ZpX2NoZWNrKzB4NjEw
Y2MvMHg2OGVmMA0KWyAgIDIzLjUyNDk1OV0gIG1lZGlhX2RldmljZV9pb2N0bCsweDIxOC8weDIz
OA0KWyAgIDIzLjUyNTQ4OF0gIG1lZGlhX2RldmljZV9jb21wYXRfaW9jdGwrMHg2MC8weDdjDQpb
ICAgMjMuNTI2MDcyXSAgbWVkaWFfY29tcGF0X2lvY3RsKzB4NTgvMHg5Yw0KWyAgIDIzLjUyNjU4
MV0gIF9fYXJtNjRfY29tcGF0X3N5c19pb2N0bCsweDEwYy8weDQzNA0KWyAgIDIzLjUyNzE3Nl0g
IGVsMF9zdmNfY29tbW9uKzB4YjQvMHgxOGMNClsgICAyMy41Mjc2NTFdICBlbDBfc3ZjX2NvbXBh
dF9oYW5kbGVyKzB4MWMvMHgyOA0KWyAgIDIzLjUyODIwMl0gIGVsMF9zdmNfY29tcGF0KzB4OC8w
eDI0DQpbICAgMjMuNTI4NjU5XSBTTVA6IHN0b3BwaW5nIHNlY29uZGFyeSBDUFVzDQpbICAgMjMu
NTI5MTYxXSBLZXJuZWwgT2Zmc2V0OiAweDI0YjhjMDAwMDAgZnJvbSAweGZmZmZmZmMwMTAwMDAw
MDANClsgICAyMy41Mjk5MDZdIFBIWVNfT0ZGU0VUOiAweGZmZmZmZmRkMDAwMDAwMDANClsgICAy
My41MzA0MzRdIENQVSBmZWF0dXJlczogMHgwMDAwMDAwNiwyYTgwYTIzOA0KWyAgIDIzLjUzMDk4
M10gTWVtb3J5IExpbWl0OiBub25lDQpQUExfTE9HX1NUT1JFOiBjaGVjayBvbmNlLCBzaWcgdmFs
dWUgMHgyNywgYWRkciAweDExNjAwMC4NCg0KPT09PT09PT09PT09PT09PT09DQogQ2hhbmdlcyBp
biB2Mg0KPT09PT09PT09PT09PT09PT09DQpXZSBhbHNvIHJlbW92ZWQgdGhlIHR5cGUgY2FzdCBp
biB0aGUgTUVESUFfSU9DX0FSRyBkZWZpbmUgLg0KDQoNCkZyZWRlcmljIENoZW4gKDEpOg0KICBt
ZWRpYTogbWMtZGV2aWNlLmM6IGNoYW5nZSBtZWRpYV9kZXZpY2VfcmVxdWVzdF9hbGxvYyB0byBt
YXRjaA0KICAgIG1lZGlhX2lvY3RsX2luZm8NCg0KIGRyaXZlcnMvbWVkaWEvbWMvbWMtZGV2aWNl
LmMgfCA3ICsrKystLS0NCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0
aW9ucygtKQ0KDQo=

