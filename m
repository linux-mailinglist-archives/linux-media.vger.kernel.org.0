Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3ABAF2EFE43
	for <lists+linux-media@lfdr.de>; Sat,  9 Jan 2021 08:23:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbhAIHWy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 9 Jan 2021 02:22:54 -0500
Received: from mail.zju.edu.cn ([61.164.42.155]:56214 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726593AbhAIHWy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sat, 9 Jan 2021 02:22:54 -0500
Received: by ajax-webmail-mail-app2 (Coremail) ; Sat, 9 Jan 2021 15:20:53
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date:   Sat, 9 Jan 2021 15:20:53 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Hans Verkuil" <hverkuil@xs4all.nl>
Cc:     kjlu@umn.edu, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Laurent Dufour" <ldufour@linux.ibm.com>,
        "Andrew Morton" <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        "Vlastimil Babka" <vbabka@suse.cz>,
        "Michel Lespinasse" <walken@google.com>,
        "Ricardo Cerqueira" <v4l@cerqueira.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: v4l2: Fix memleak in videobuf_read_one
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20200917(3e19599d)
 Copyright (c) 2002-2021 www.mailtech.cn zju.edu.cn
In-Reply-To: <05d5b8b5-9758-17ea-4e54-3fe1a0ad2a09@xs4all.nl>
References: <20210105075904.27102-1-dinghao.liu@zju.edu.cn>
 <05d5b8b5-9758-17ea-4e54-3fe1a0ad2a09@xs4all.nl>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6315d2ab.2d7f0.176e604f759.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgA3HVhVWflfK1o1AA--.10755W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoABlZdtR6GKAAAsA
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBPbiAwNS8wMS8yMDIxIDA4OjU5LCBEaW5naGFvIExpdSB3cm90ZToKPiA+IFdoZW4gdmlkZW9i
dWZfd2FpdG9uKCkgZmFpbHMsIHdlIHNob3VsZCBleGVjdXRlIGNsZWFuCj4gPiBmdW5jdGlvbnMg
dG8gcHJldmVudCBtZW1sZWFrLiBJdCdzIHRoZSBzYW1lIHdoZW4KPiA+IF9fdmlkZW9idWZfY29w
eV90b191c2VyKCkgZmFpbHMuCj4gPiAKPiA+IEZpeGVzOiA3YTdkOWE4OWQwMzA3ICgiVjRML0RW
QiAoNjI1MSk6IFJlcGxhY2UgdmlkZW8tYnVmIHRvIGEgbW9yZSBnZW5lcmljIGFwcHJvYWNoIikK
PiA+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1LmNuPgo+
ID4gLS0tCj4gPiAgZHJpdmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtY29yZS5jIHwgMTIg
KysrKysrKysrKy0tCj4gPiAgMSBmaWxlIGNoYW5nZWQsIDEwIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92
aWRlb2J1Zi1jb3JlLmMgYi9kcml2ZXJzL21lZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1jb3JlLmMK
PiA+IGluZGV4IDYwNmEyNzFiZGQyZC4uMDcwOWI3NWQxMWNkIDEwMDY0NAo+ID4gLS0tIGEvZHJp
dmVycy9tZWRpYS92NGwyLWNvcmUvdmlkZW9idWYtY29yZS5jCj4gPiArKysgYi9kcml2ZXJzL21l
ZGlhL3Y0bDItY29yZS92aWRlb2J1Zi1jb3JlLmMKPiA+IEBAIC05MjQsOCArOTI0LDEyIEBAIHNz
aXplX3QgdmlkZW9idWZfcmVhZF9vbmUoc3RydWN0IHZpZGVvYnVmX3F1ZXVlICpxLAo+ID4gIAo+
ID4gIAkvKiB3YWl0IHVudGlsIGNhcHR1cmUgaXMgZG9uZSAqLwo+ID4gIAlyZXR2YWwgPSB2aWRl
b2J1Zl93YWl0b24ocSwgcS0+cmVhZF9idWYsIG5vbmJsb2NraW5nLCAxKTsKPiA+IC0JaWYgKDAg
IT0gcmV0dmFsKQo+ID4gKwlpZiAocmV0dmFsICE9IDApIHsKPiA+ICsJCXEtPm9wcy0+YnVmX3Jl
bGVhc2UocSwgcS0+cmVhZF9idWYpOwo+ID4gKwkJa2ZyZWUocS0+cmVhZF9idWYpOwo+ID4gKwkJ
cS0+cmVhZF9idWYgPSBOVUxMOwo+ID4gIAkJZ290byBkb25lOwo+ID4gKwl9Cj4gCj4gSSdtIGZh
aXJseSBjZXJ0YWluIHRoYXQgdGhpcyBpcyB3cm9uZzogaWYgd2FpdG9uIHJldHVybnMgYW4gZXJy
b3IsIHRoZW4KPiB0aGF0IG1lYW5zIHRoYXQgdGhlIHdhaXQgaXMgZWl0aGVyIGludGVycnVwdGVk
IG9yIHRoYXQgd2UgYXJlIGluIG5vbi1ibG9ja2luZwo+IG1vZGUgYW5kIG5vIGJ1ZmZlciBoYXMg
YXJyaXZlZCB5ZXQuIEluIHRoYXQgY2FzZSB5b3UganVzdCBnbyB0byBkb25lIHNpbmNlCj4gdGhl
cmUgaXMgbm90aGluZyB0byBjbGVhbiB1cC4KPiAKCkkgZm91bmQgdGhlcmUgd2FzIGEgc2ltaWxh
ciBlcnJvciBoYW5kbGluZyBpbiB2aWRlb2J1Zl9yZWFkX3plcm9jb3B5KCksIHdoZXJlCnEtPnJl
YWRfYnVmIHdhcyBmcmVlZCBvbiBmYWlsdXJlIG9mIHZpZGVvYnVmX3dhaXRvbigpLCB0aHVzIEkg
cmVwb3J0ZWQgdGhpcyBhcwphIG1lbWxlYWsuIERvIHlvdSB0aGluayB0aGUgZXJyb3IgaGFuZGxp
bmcgaW4gdmlkZW9idWZfcmVhZF96ZXJvY29weSgpIGlzIHJpZ2h0PwoKPiA+ICAKPiA+ICAJQ0FM
TChxLCBzeW5jLCBxLCBxLT5yZWFkX2J1Zik7Cj4gPiAgCj4gPiBAQCAtOTQwLDggKzk0NCwxMiBA
QCBzc2l6ZV90IHZpZGVvYnVmX3JlYWRfb25lKHN0cnVjdCB2aWRlb2J1Zl9xdWV1ZSAqcSwKPiA+
ICAKPiA+ICAJLyogQ29weSB0byB1c2Vyc3BhY2UgKi8KPiA+ICAJcmV0dmFsID0gX192aWRlb2J1
Zl9jb3B5X3RvX3VzZXIocSwgcS0+cmVhZF9idWYsIGRhdGEsIGNvdW50LCBub25ibG9ja2luZyk7
Cj4gPiAtCWlmIChyZXR2YWwgPCAwKQo+ID4gKwlpZiAocmV0dmFsIDwgMCkgewo+ID4gKwkJcS0+
b3BzLT5idWZfcmVsZWFzZShxLCBxLT5yZWFkX2J1Zik7Cj4gPiArCQlrZnJlZShxLT5yZWFkX2J1
Zik7Cj4gPiArCQlxLT5yZWFkX2J1ZiA9IE5VTEw7Cj4gPiAgCQlnb3RvIGRvbmU7Cj4gCj4gSSdt
IG5vdCBzdXJlIGFib3V0IHRoaXMgZWl0aGVyOiBpZiB1c2Vyc3BhY2UgZ2F2ZSBhIGNyYXBweSBw
b2ludGVyIGFuZCB0aGlzCj4gY29weV90b191c2VyIGZhaWxzLCB0aGVuIHRoYXQgZG9lc24ndCBt
ZWFuIHlvdSBzaG91bGQgcmVsZWFzZSB0aGUgYnVmZmVyLgo+IFRoZSBuZXh0IHJlYWQoKSBtaWdo
dCBoYXZlIGEgdmFsaWQgcG9pbnRlciBvciwgbW9yZSBsaWtlbHksIHRoZSBhcHBsaWNhdGlvbgo+
IGV4aXRzIG9yIGNyYXNoZXMgYW5kIGV2ZXJ5dGhpbmcgaXMgY2xlYW5lZCB1cCB3aGVuIHRoZSBm
aWxlaGFuZGxlIGlzIGNsb3NlZC4KPiAKCllvdSBhcmUgcmlnaHQuIExldCdzIGtlZXAgdGhpcyBw
YXJ0IGFzIGl0IHdhcyBmb3Igc2VjdXJpdHkuCgpSZWdhcmRzLApEaW5naGFvCg==
