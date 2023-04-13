Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B21FE6E087C
	for <lists+linux-media@lfdr.de>; Thu, 13 Apr 2023 09:59:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229951AbjDMH7i (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 13 Apr 2023 03:59:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbjDMH7h (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 13 Apr 2023 03:59:37 -0400
Received: from aposti.net (aposti.net [89.234.176.197])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E1AD170F;
        Thu, 13 Apr 2023 00:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
        s=mail; t=1681372772;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vfxzlRNk1KGWBdOj5P/K6fuwrIfAfru/Dnxni0GJhqM=;
        b=ICUcBYBU4Bf7+mQJ5Ux1mcB5R2xdiuY5KtFa/XbsgF+hRunFUSdeGERUNyysZhU+UUv85o
        YpNkFgjTNfabOwPHhplu5VolRCE+cLMyvO4F9kL8/QX35ojd8S7tRH7lnL3Hst1w4zEWQ+
        uutqswBtqhSp4JvUD5Qpu+quNM+y9KE=
Message-ID: <259fbfaafbceb6b57c0c4426be994ed08140af5c.camel@crapouillou.net>
Subject: Re: [PATCH v3 01/11] dmaengine: Add API function
 dmaengine_prep_slave_dma_array()
From:   Paul Cercueil <paul@crapouillou.net>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Jonathan Cameron <jic23@kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
        linux-kernel@vger.kernel.org, dmaengine@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-media@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Date:   Thu, 13 Apr 2023 09:59:29 +0200
In-Reply-To: <ZDbpDptOcuBLFctc@matsya>
References: <20230403154800.215924-1-paul@crapouillou.net>
         <20230403154800.215924-2-paul@crapouillou.net> <ZDbpDptOcuBLFctc@matsya>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgVmlub2QsCgpMZSBtZXJjcmVkaSAxMiBhdnJpbCAyMDIzIMOgIDIyOjUzICswNTMwLCBWaW5v
ZCBLb3VsIGEgw6ljcml0wqA6Cj4gT24gMDMtMDQtMjMsIDE3OjQ3LCBQYXVsIENlcmN1ZWlsIHdy
b3RlOgo+ID4gVGhpcyBmdW5jdGlvbiBjYW4gYmUgdXNlZCB0byBpbml0aWF0ZSBhIHNjYXR0ZXIt
Z2F0aGVyIERNQSB0cmFuc2Zlcgo+ID4gd2hlcmUgdGhlIERNQSBhZGRyZXNzZXMgYW5kIGxlbmd0
aHMgYXJlIGxvY2F0ZWQgaW5zaWRlIGFycmF5cy4KPiA+IAo+ID4gVGhlIG1ham9yIGRpZmZlcmVu
Y2Ugd2l0aCBkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zZygpIGlzIHRoYXQgaXQKPiA+IHN1cHBvcnRz
Cj4gPiBzcGVjaWZ5aW5nIHRoZSBsZW5ndGhzIG9mIGVhY2ggRE1BIHRyYW5zZmVyOyBhcyB0cnlp
bmcgdG8gb3ZlcnJpZGUKPiA+IHRoZQo+ID4gbGVuZ3RoIG9mIHRoZSB0cmFuc2ZlciB3aXRoIGRt
YWVuZ2luZV9wcmVwX3NsYXZlX3NnKCkgaXMgYSB2ZXJ5Cj4gPiB0ZWRpb3VzCj4gPiBwcm9jZXNz
LiBUaGUgaW50cm9kdWN0aW9uIG9mIGEgbmV3IEFQSSBmdW5jdGlvbiBpcyBhbHNvIGp1c3RpZmll
ZAo+ID4gYnkgdGhlCj4gPiBmYWN0IHRoYXQgc2NhdHRlcmxpc3RzIGFyZSBvbiB0aGVpciB3YXkg
b3V0Lgo+IAo+IERvIHdlIG5lZWQgYSBuZXcgQVBJIGZvciB0aGlzPyB3aHkgbm90IHVzZQo+IGRl
dmljZV9wcmVwX2ludGVybGVhdmVkX2RtYT8KCkkgYWRtaXQgdGhhdCBJIGRpc2NhcmRlZCB0aGUg
aW50ZXJsZWF2ZWQgRE1BIHdpdGhvdXQgdHJ5aW5nIGl0LCBiZWNhdXNlCnJlYWRpbmcgdGhlIGRv
YywgZS5nLiB0aGUgb25lIGZvciAic3RydWN0IGRhdGFfY2h1bmsiLCBJdCBsb29rZWQgbGlrZQpp
dCB3YXMgbm90IHVzYWJsZSBmb3Igd2hlbiB0aGUgRE1BIGFkZHJlc3NlcyBhcmUgc2NhdHRlcmVk
IGluIG1lbW9yeTsKaXQgYXNzdW1lcyB0aGF0IHRoZSBmb2xsb3dpbmcgRE1BIGFkZHJlc3NlcyB3
aWxsIGFsd2F5cyBjb21lIGFmdGVyIHRoZQpwcmV2aW91cyBvbmUuCgpDaGVlcnMsCi1QYXVsIAoK
PiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogUGF1bCBDZXJjdWVpbCA8cGF1bEBjcmFwb3VpbGxvdS5u
ZXQ+Cj4gPiAKPiA+IC0tLQo+ID4gdjM6IE5ldyBwYXRjaAo+ID4gLS0tCj4gPiDCoGluY2x1ZGUv
bGludXgvZG1hZW5naW5lLmggfCAxNiArKysrKysrKysrKysrKysrCj4gPiDCoDEgZmlsZSBjaGFu
Z2VkLCAxNiBpbnNlcnRpb25zKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4
L2RtYWVuZ2luZS5oIGIvaW5jbHVkZS9saW51eC9kbWFlbmdpbmUuaAo+ID4gaW5kZXggYzM2NTZl
NTkwMjEzLi42MmVmYTI4YzAwOWEgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2RtYWVu
Z2luZS5oCj4gPiArKysgYi9pbmNsdWRlL2xpbnV4L2RtYWVuZ2luZS5oCj4gPiBAQCAtOTEyLDYg
KzkxMiwxMSBAQCBzdHJ1Y3QgZG1hX2RldmljZSB7Cj4gPiDCoMKgwqDCoMKgwqDCoMKgc3RydWN0
IGRtYV9hc3luY190eF9kZXNjcmlwdG9yCj4gPiAqKCpkZXZpY2VfcHJlcF9kbWFfaW50ZXJydXB0
KSgKPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9jaGFuICpj
aGFuLCB1bnNpZ25lZCBsb25nIGZsYWdzKTsKPiA+IMKgCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1
Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IKPiA+ICooKmRldmljZV9wcmVwX3NsYXZlX2RtYV9h
cnJheSkoCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgc3RydWN0IGRtYV9jaGFu
ICpjaGFuLCBkbWFfYWRkcl90ICphZGRycywKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqBzaXplX3QgKmxlbmd0aHMsIHNpemVfdCBuYiwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqBlbnVtIGRtYV90cmFuc2Zlcl9kaXJlY3Rpb24gZGlyZWN0aW9uLAo+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGxvbmcgZmxhZ3MpOwo+ID4gwqDC
oMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfYXN5bmNfdHhfZGVzY3JpcHRvciAqKCpkZXZpY2VfcHJl
cF9zbGF2ZV9zZykoCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBk
bWFfY2hhbiAqY2hhbiwgc3RydWN0IHNjYXR0ZXJsaXN0ICpzZ2wsCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoHVuc2lnbmVkIGludCBzZ19sZW4sIGVudW0gZG1hX3RyYW5zZmVy
X2RpcmVjdGlvbgo+ID4gZGlyZWN0aW9uLAo+ID4gQEAgLTk3NCw2ICs5NzksMTcgQEAgc3RhdGlj
IGlubGluZSBzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IKPiA+ICpkbWFlbmdpbmVfcHJl
cF9zbGF2ZV9zaW5nbGUoCj4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBkaXIsIGZsYWdzLAo+ID4gTlVMTCk7Cj4gPiDCoH0KPiA+IMKgCj4gPiArc3RhdGljIGlu
bGluZSBzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rlc2NyaXB0b3IKPiA+ICpkbWFlbmdpbmVfcHJlcF9z
bGF2ZV9kbWFfYXJyYXkoCj4gPiArwqDCoMKgwqDCoMKgwqBzdHJ1Y3QgZG1hX2NoYW4gKmNoYW4s
IGRtYV9hZGRyX3QgKmFkZHJzLCBzaXplX3QgKmxlbmd0aHMsCj4gPiArwqDCoMKgwqDCoMKgwqBz
aXplX3QgbmIsIGVudW0gZG1hX3RyYW5zZmVyX2RpcmVjdGlvbiBkaXIsIHVuc2lnbmVkIGxvbmcK
PiA+IGZsYWdzKQo+ID4gK3sKPiA+ICvCoMKgwqDCoMKgwqDCoGlmICghY2hhbiB8fCAhY2hhbi0+
ZGV2aWNlIHx8ICFjaGFuLT5kZXZpY2UtCj4gPiA+ZGV2aWNlX3ByZXBfc2xhdmVfZG1hX2FycmF5
KQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBOVUxMOwo+ID4gKwo+
ID4gK8KgwqDCoMKgwqDCoMKgcmV0dXJuIGNoYW4tPmRldmljZS0+ZGV2aWNlX3ByZXBfc2xhdmVf
ZG1hX2FycmF5KGNoYW4sCj4gPiBhZGRycywgbGVuZ3RocywKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBuYiwgZGlyLAo+ID4gZmxhZ3Mp
Owo+ID4gK30KPiA+ICsKPiA+IMKgc3RhdGljIGlubGluZSBzdHJ1Y3QgZG1hX2FzeW5jX3R4X2Rl
c2NyaXB0b3IKPiA+ICpkbWFlbmdpbmVfcHJlcF9zbGF2ZV9zZygKPiA+IMKgwqDCoMKgwqDCoMKg
wqBzdHJ1Y3QgZG1hX2NoYW4gKmNoYW4sIHN0cnVjdCBzY2F0dGVybGlzdCAqc2dsLMKgdW5zaWdu
ZWQKPiA+IGludCBzZ19sZW4sCj4gPiDCoMKgwqDCoMKgwqDCoMKgZW51bSBkbWFfdHJhbnNmZXJf
ZGlyZWN0aW9uIGRpciwgdW5zaWduZWQgbG9uZyBmbGFncykKPiA+IC0tIAo+ID4gMi4zOS4yCj4g
Cgo=

