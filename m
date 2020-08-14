Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 616C024455E
	for <lists+linux-media@lfdr.de>; Fri, 14 Aug 2020 09:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726848AbgHNHNd (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 14 Aug 2020 03:13:33 -0400
Received: from mailgw01.mediatek.com ([210.61.82.183]:63215 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726820AbgHNHNa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 14 Aug 2020 03:13:30 -0400
X-UUID: cf7ddae9de15463da80ecfcbff1b0679-20200814
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
        h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=ZQxsYXMiSFwPrZ111f4m+gouEH0cxDJ3i9R7i1HIQcc=;
        b=L7jxCr1/bJOKYh+cISDJnPf2CRH2hpLvRqLN+ls1u5uZdEKPJgiDkG3O3+Ls3A8cf3suRx+JQWlxPRwIOmMZ1TJJxg35UYWwFEx+2Xjki0cOC4BBwXzOLKui2/qRjtHUVC4OIGedjL+P0nEbNqqJK5qQ53b62wrwWFlzh2pwzGg=;
X-UUID: cf7ddae9de15463da80ecfcbff1b0679-20200814
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw01.mediatek.com
        (envelope-from <xia.jiang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.10 Build 0809 with TLS)
        with ESMTP id 700050356; Fri, 14 Aug 2020 15:13:23 +0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 14 Aug 2020 15:13:20 +0800
Received: from localhost.localdomain (10.17.3.153) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 15:13:19 +0800
From:   Xia Jiang <xia.jiang@mediatek.com>
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rick Chang <rick.chang@mediatek.com>
CC:     <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        <srv_heupstream@mediatek.com>, <senozhatsky@chromium.org>,
        <mojahsu@chromium.org>, <drinkcat@chromium.org>,
        <maoguang.meng@mediatek.com>, Xia Jiang <xia.jiang@mediatek.com>
Subject: [PATCH v12 15/29] media: platform: Delete redundant code and add annotation for an enum
Date:   Fri, 14 Aug 2020 15:11:48 +0800
Message-ID: <20200814071202.25067-17-xia.jiang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20200814071202.25067-1-xia.jiang@mediatek.com>
References: <20200814071202.25067-1-xia.jiang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Content-Transfer-Encoding: base64
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

RGVsZXRlIHVudXNlZCBtZW1iZXIgdmFyaWFibGVzIGFubm90YXRpb24uDQpEZWxldGUgdW51c2Vk
IHZhcmlhYmxlIGRlZmluaXRpb24uDQpEZWxldGUgcmVkdW5kYW50IGxvZyBwcmludCwgYmVjYXVz
ZSBWNEwyIGRlYnVnIGxvZ3MgYWxyZWFkeSBwcmludCBpdC4NCkFkZCBhbm5vdGF0aW9uIGZvciBl
bnVtIG10a19qcGVnX2N0eF9zdGF0ZS4NCg0KUmV2aWV3ZWQtYnk6IFRvbWFzeiBGaWdhIDx0Zmln
YUBjaHJvbWl1bS5vcmc+DQpTaWduZWQtb2ZmLWJ5OiBYaWEgSmlhbmcgPHhpYS5qaWFuZ0BtZWRp
YXRlay5jb20+DQotLS0NCnYxMjogbm8gY2hhbmdlcw0KLS0tDQogZHJpdmVycy9tZWRpYS9wbGF0
Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMgfCAxNSArKy0tLS0tLS0tLS0tLS0NCiBkcml2
ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaCB8ICA4ICsrKysrKy0t
DQogMiBmaWxlcyBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKyksIDE1IGRlbGV0aW9ucygtKQ0KDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KaW5k
ZXggOTgwNTAwYmUwMjdiLi5kYjNhOGIyMmRjY2QgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuYw0KKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmMNCkBAIC0xNzYsMTQgKzE3NiwxMyBAQCBz
dGF0aWMgaW50IG10a19qcGVnX3RyeV9mbXRfbXBsYW5lKHN0cnVjdCB2NGwyX2Zvcm1hdCAqZiwN
CiAJCQkJICAgc3RydWN0IG10a19qcGVnX2N0eCAqY3R4LCBpbnQgcV90eXBlKQ0KIHsNCiAJc3Ry
dWN0IHY0bDJfcGl4X2Zvcm1hdF9tcGxhbmUgKnBpeF9tcCA9ICZmLT5mbXQucGl4X21wOw0KLQlz
dHJ1Y3QgbXRrX2pwZWdfZGV2ICpqcGVnID0gY3R4LT5qcGVnOw0KIAlpbnQgaTsNCiANCiAJcGl4
X21wLT5maWVsZCA9IFY0TDJfRklFTERfTk9ORTsNCiANCiAJaWYgKGN0eC0+c3RhdGUgIT0gTVRL
X0pQRUdfSU5JVCkgew0KIAkJbXRrX2pwZWdfYWRqdXN0X2ZtdF9tcGxhbmUoY3R4LCBmKTsNCi0J
CWdvdG8gZW5kOw0KKwkJcmV0dXJuIDA7DQogCX0NCiANCiAJcGl4X21wLT5udW1fcGxhbmVzID0g
Zm10LT5jb2xwbGFuZXM7DQpAQCAtMjAyLDcgKzIwMSw3IEBAIHN0YXRpYyBpbnQgbXRrX2pwZWdf
dHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KIAkJcGZtdC0+c2l6ZWltYWdl
ID0gcm91bmRfdXAocGZtdC0+c2l6ZWltYWdlLCAxMjgpOw0KIAkJaWYgKHBmbXQtPnNpemVpbWFn
ZSA9PSAwKQ0KIAkJCXBmbXQtPnNpemVpbWFnZSA9IE1US19KUEVHX0RFRkFVTFRfU0laRUlNQUdF
Ow0KLQkJZ290byBlbmQ7DQorCQlyZXR1cm4gMDsNCiAJfQ0KIA0KIAkvKiB0eXBlIGlzIE1US19K
UEVHX0ZNVF9UWVBFX0NBUFRVUkUgKi8NCkBAIC0yMTksMTYgKzIxOCw2IEBAIHN0YXRpYyBpbnQg
bXRrX2pwZWdfdHJ5X2ZtdF9tcGxhbmUoc3RydWN0IHY0bDJfZm9ybWF0ICpmLA0KIAkJcGZtdC0+
Ynl0ZXNwZXJsaW5lID0gc3RyaWRlOw0KIAkJcGZtdC0+c2l6ZWltYWdlID0gc3RyaWRlICogaDsN
CiAJfQ0KLWVuZDoNCi0JdjRsMl9kYmcoMiwgZGVidWcsICZqcGVnLT52NGwyX2RldiwgInd4aDol
dXgldVxuIiwNCi0JCSBwaXhfbXAtPndpZHRoLCBwaXhfbXAtPmhlaWdodCk7DQotCWZvciAoaSA9
IDA7IGkgPCBwaXhfbXAtPm51bV9wbGFuZXM7IGkrKykgew0KLQkJdjRsMl9kYmcoMiwgZGVidWcs
ICZqcGVnLT52NGwyX2RldiwNCi0JCQkgInBsYW5lWyVkXSBicGw9JXUsIHNpemU9JXVcbiIsDQot
CQkJIGksDQotCQkJIHBpeF9tcC0+cGxhbmVfZm10W2ldLmJ5dGVzcGVybGluZSwNCi0JCQkgcGl4
X21wLT5wbGFuZV9mbXRbaV0uc2l6ZWltYWdlKTsNCi0JfQ0KIAlyZXR1cm4gMDsNCiB9DQogDQpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3Jl
LmggYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KaW5k
ZXggNGQ2MjQzODk2M2MwLi45YjQ2YjA1MDcxODcgMTAwNjQ0DQotLS0gYS9kcml2ZXJzL21lZGlh
L3BsYXRmb3JtL210ay1qcGVnL210a19qcGVnX2NvcmUuaA0KKysrIGIvZHJpdmVycy9tZWRpYS9w
bGF0Zm9ybS9tdGstanBlZy9tdGtfanBlZ19jb3JlLmgNCkBAIC0zMiw2ICszMiwxMiBAQA0KIA0K
ICNkZWZpbmUgTVRLX0pQRUdfSFdfVElNRU9VVF9NU0VDIDEwMDANCiANCisvKioNCisgKiBlbnVt
IG10a19qcGVnX2N0eF9zdGF0ZSAtIHN0YXRlcyBvZiB0aGUgY29udGV4dCBzdGF0ZSBtYWNoaW5l
DQorICogQE1US19KUEVHX0lOSVQ6CQljdXJyZW50IHN0YXRlIGlzIGluaXRpYWxpemVkDQorICog
QE1US19KUEVHX1JVTk5JTkc6CQljdXJyZW50IHN0YXRlIGlzIHJ1bm5pbmcNCisgKiBATVRLX0pQ
RUdfU09VUkNFX0NIQU5HRToJY3VycmVudCBzdGF0ZSBpcyBzb3VyY2UgcmVzb2x1dGlvbiBjaGFu
Z2UNCisgKi8NCiBlbnVtIG10a19qcGVnX2N0eF9zdGF0ZSB7DQogCU1US19KUEVHX0lOSVQgPSAw
LA0KIAlNVEtfSlBFR19SVU5OSU5HLA0KQEAgLTExMyw5ICsxMTksNyBAQCBzdHJ1Y3QgbXRrX2pw
ZWdfcV9kYXRhIHsNCiAgKiBAb3V0X3E6CQlzb3VyY2UgKG91dHB1dCkgcXVldWUgaW5mb3JtYXRp
b24NCiAgKiBAY2FwX3E6CQlkZXN0aW5hdGlvbiAoY2FwdHVyZSkgcXVldWUgcXVldWUgaW5mb3Jt
YXRpb24NCiAgKiBAZmg6CQkJVjRMMiBmaWxlIGhhbmRsZQ0KLSAqIEBkZWNfcGFyYW0JCXBhcmFt
ZXRlcnMgZm9yIEhXIGRlY29kaW5nDQogICogQHN0YXRlOgkJc3RhdGUgb2YgdGhlIGNvbnRleHQN
Ci0gKiBAaGVhZGVyX3ZhbGlkOglzZXQgaWYgaGVhZGVyIGhhcyBiZWVuIHBhcnNlZCBhbmQgdmFs
aWQNCiAgKiBAY29sb3JzcGFjZTogZW51bSB2NGwyX2NvbG9yc3BhY2U7IHN1cHBsZW1lbnRhbCB0
byBwaXhlbGZvcm1hdA0KICAqIEB5Y2Jjcl9lbmM6IGVudW0gdjRsMl95Y2Jjcl9lbmNvZGluZywg
WSdDYkNyIGVuY29kaW5nDQogICogQHF1YW50aXphdGlvbjogZW51bSB2NGwyX3F1YW50aXphdGlv
biwgY29sb3JzcGFjZSBxdWFudGl6YXRpb24NCi0tIA0KMi4xOC4wDQo=

