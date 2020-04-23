Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E880F1B59E6
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 13:01:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728009AbgDWLBq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 07:01:46 -0400
Received: from mx2.suse.de ([195.135.220.15]:44222 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727883AbgDWLBq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 07:01:46 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id EB86BB0B7;
        Thu, 23 Apr 2020 11:01:43 +0000 (UTC)
Message-ID: <1587639690.23108.2.camel@suse.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Thu, 23 Apr 2020 13:01:30 +0200
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
References: <0000000000003cbf8e05a3d57b98@google.com>
Content-Type: multipart/mixed; boundary="=-q2m0MxcCOOFn1/lZrA+P"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-q2m0MxcCOOFn1/lZrA+P
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Am Dienstag, den 21.04.2020, 16:36 -0700 schrieb syzbot:
> Hello,
> 
> syzbot found the following crash on:
> 
> HEAD commit:    e9010320 usb: cdns3: gadget: make a bunch of functions sta..
> git tree:       https://github.com/google/kasan.git usb-fuzzer
> console output: https://syzkaller.appspot.com/x/log.txt?x=1263a930100000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=bd14feb44652cfaf
> dashboard link: https://syzkaller.appspot.com/bug?extid=cabfa4b5b05ff6be4ef0
> compiler:       gcc (GCC) 9.0.0 20181231 (experimental)
> 
> Unfortunately, I don't have any reproducer for this crash yet.
> 
> IMPORTANT: if you fix the bug, please add the following tag to the commit:
> Reported-by: syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com

#syz test: https://github.com/google/kasan.git e9010320

--=-q2m0MxcCOOFn1/lZrA+P
Content-Disposition: attachment; filename="0001-go7007-add-sanity-checking.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-go7007-add-sanity-checking.patch";
	charset="UTF-8"

RnJvbSA1ZjFhNmJkMGJmMDEzNzkyYjg2YTAxYjU4ZjlmNmU1N2YxYzlkMDY1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDEzOjQ5OjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZ283MDA3
OiBhZGQgc2FuaXR5IGNoZWNraW5nCgpBIG1hbGljaW91cyBVU0IgZGV2aWNlIG1heSBsYWNrIGVu
ZHBvaW50cyB0aGUgZHJpdmVyIGFzc3VtZXMgdG8gZXhpc3QKQWNjZXNzaW5nIHRoZW0gbGVhZHMg
dG8gTlVMTCBwb2ludGVyIGFjY2Vzc2VzLiBUaGlzIHBhdGNoIGludHJvZHVjZXMKc2FuaXR5IGNo
ZWNraW5nLgoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4K
Rml4ZXM6IDg2NmI4Njk1ZDY3ZTggKCJTdGFnaW5nOiBhZGQgdGhlIGdvNzAwNyB2aWRlbyBkcml2
ZXIiKQotLS0KIGRyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDctdXNiLmMgfCAxNSArKysr
KysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11c2IuYyBi
L2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDctdXNiLmMKaW5kZXggZjg4OWM5ZDc0MGNk
Li5hNGY0ZmQyMzBhNjcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcw
MDctdXNiLmMKKysrIGIvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11c2IuYwpAQCAt
MTEyMSw2ICsxMTIxLDE0IEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNi
X2ludGVyZmFjZSAqaW50ZiwKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQogCisJLyogc2FuaXR5IGNo
ZWNrcyAqLworICAgIGlmICh1c2IgJiYgdXNiLT51c2JkZXYpCisgICAgICAgIGVwID0gdXNiLT51
c2JkZXYtPmVwX2luWzRdOworICAgIGVsc2UKKyAgICAgICAgZXAgPSBOVUxMOworCWlmICghZXAp
CisJCXJldHVybiAtRU5PREVWOworCiAJdXNiLT5ib2FyZCA9IGJvYXJkOwogCXVzYi0+dXNiZGV2
ID0gdXNiZGV2OwogCXVzYl9tYWtlX3BhdGgodXNiZGV2LCBnby0+YnVzX2luZm8sIHNpemVvZihn
by0+YnVzX2luZm8pKTsKQEAgLTExNDEsNyArMTE0OSw2IEBAIHN0YXRpYyBpbnQgZ283MDA3X3Vz
Yl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAlpZiAodXNiLT5pbnRyX3VyYi0+
dHJhbnNmZXJfYnVmZmVyID09IE5VTEwpCiAJCWdvdG8gYWxsb2NmYWlsOwogCi0JZXAgPSB1c2It
PnVzYmRldi0+ZXBfaW5bNF07CiAJaWYgKHVzYl9lbmRwb2ludF90eXBlKCZlcC0+ZGVzYykgPT0g
VVNCX0VORFBPSU5UX1hGRVJfQlVMSykKIAkJdXNiX2ZpbGxfYnVsa191cmIodXNiLT5pbnRyX3Vy
YiwgdXNiLT51c2JkZXYsCiAJCQl1c2JfcmN2YnVsa3BpcGUodXNiLT51c2JkZXYsIDQpLApAQCAt
MTI2Myw5ICsxMjcwLDEzIEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNi
X2ludGVyZmFjZSAqaW50ZiwKIAogCS8qIEFsbG9jYXRlIHRoZSBVUkJzIGFuZCBidWZmZXJzIGZv
ciByZWNlaXZpbmcgdGhlIHZpZGVvIHN0cmVhbSAqLwogCWlmIChib2FyZC0+ZmxhZ3MgJiBHTzcw
MDdfVVNCX0VaVVNCKSB7CisJCWlmICghdXNiLT51c2JkZXYtPmVwX2luWzZdKQorCQkJZ290byBh
bGxvY2ZhaWw7CiAJCXZfdXJiX2xlbiA9IDEwMjQ7CiAJCXZpZGVvX3BpcGUgPSB1c2JfcmN2YnVs
a3BpcGUodXNiLT51c2JkZXYsIDYpOwogCX0gZWxzZSB7CisJCWlmICghdXNiLT51c2JkZXYtPmVw
X2luWzFdKQorCQkJZ290byBhbGxvY2ZhaWw7CiAJCXZfdXJiX2xlbiA9IDUxMjsKIAkJdmlkZW9f
cGlwZSA9IHVzYl9yY3ZidWxrcGlwZSh1c2ItPnVzYmRldiwgMSk7CiAJfQpAQCAtMTI4NSw2ICsx
Mjk2LDggQEAgc3RhdGljIGludCBnbzcwMDdfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNl
ICppbnRmLAogCS8qIEFsbG9jYXRlIHRoZSBVUkJzIGFuZCBidWZmZXJzIGZvciByZWNlaXZpbmcg
dGhlIGF1ZGlvIHN0cmVhbSAqLwogCWlmICgoYm9hcmQtPmZsYWdzICYgR083MDA3X1VTQl9FWlVT
QikgJiYKIAkgICAgKGJvYXJkLT5tYWluX2luZm8uZmxhZ3MgJiBHTzcwMDdfQk9BUkRfSEFTX0FV
RElPKSkgeworCQlpZiAoIXVzYi0+dXNiZGV2LT5lcF9pbls4XSkKKwkJCWdvdG8gYWxsb2NmYWls
OwogCQlmb3IgKGkgPSAwOyBpIDwgODsgKytpKSB7CiAJCQl1c2ItPmF1ZGlvX3VyYnNbaV0gPSB1
c2JfYWxsb2NfdXJiKDAsIEdGUF9LRVJORUwpOwogCQkJaWYgKHVzYi0+YXVkaW9fdXJic1tpXSA9
PSBOVUxMKQotLSAKMi4xNi40Cgo=


--=-q2m0MxcCOOFn1/lZrA+P--

