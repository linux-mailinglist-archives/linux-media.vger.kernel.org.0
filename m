Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77B341B43B9
	for <lists+linux-media@lfdr.de>; Wed, 22 Apr 2020 14:00:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728455AbgDVMAD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Apr 2020 08:00:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:53172 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727791AbgDVMAD (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Apr 2020 08:00:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id A9C23AE79;
        Wed, 22 Apr 2020 12:00:00 +0000 (UTC)
Message-ID: <1587556788.26476.13.camel@suse.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Wed, 22 Apr 2020 13:59:48 +0200
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
References: <0000000000003cbf8e05a3d57b98@google.com>
Content-Type: multipart/mixed; boundary="=-McCpIkgPwCqlblO8/Hrv"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-McCpIkgPwCqlblO8/Hrv
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
--=-McCpIkgPwCqlblO8/Hrv
Content-Disposition: attachment; filename="0001-go7007-add-sanity-checking.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-go7007-add-sanity-checking.patch";
	charset="UTF-8"

RnJvbSBlZjEzZjM1NWQ2MWNmODhjOTYyOWM5ZTBiMzI5OTNiMzE1MjBmMzYyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDEzOjQ5OjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZ283MDA3
OiBhZGQgc2FuaXR5IGNoZWNraW5nCgpBIG1hbGljaW91cyBVU0IgZGV2aWNlIG1heSBsYWNrIGVu
ZHBvaW50cyB0aGUgZHJpdmVyIGFzc3VtZXMgdG8gZXhpc3QKQWNjZXNzaW5nIHRoZW0gbGVhZHMg
dG8gTlVMTCBwb2ludGVyIGFjY2Vzc2VzLiBUaGlzIHBhdGNoIGludHJvZHVjZXMKc2FuaXR5IGNo
ZWNraW5nLgoKU2lnbmVkLW9mZi1ieTogT2xpdmVyIE5ldWt1bSA8b25ldWt1bUBzdXNlLmNvbT4K
Rml4ZXM6IDg2NmI4Njk1ZDY3ZTggKCJTdGFnaW5nOiBhZGQgdGhlIGdvNzAwNyB2aWRlbyBkcml2
ZXIiKQotLS0KIGRyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDctdXNiLmMgfCAxMiArKysr
KysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11c2IuYyBiL2Ry
aXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDctdXNiLmMKaW5kZXggZjg4OWM5ZDc0MGNkLi5l
YWU5ZTRlNTU1Y2YgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDct
dXNiLmMKKysrIGIvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11c2IuYwpAQCAtMTEy
MSw2ICsxMTIxLDExIEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2lu
dGVyZmFjZSAqaW50ZiwKIAkJcmV0dXJuIC1FTk9NRU07CiAJfQogCisJLyogc2FuaXR5IGNoZWNr
cyAqLworCWVwID0gdXNiLT51c2JkZXYtPmVwX2luWzRdOworCWlmICghZXApCisJCXJldHVybiAt
RU5PREVWOworCiAJdXNiLT5ib2FyZCA9IGJvYXJkOwogCXVzYi0+dXNiZGV2ID0gdXNiZGV2Owog
CXVzYl9tYWtlX3BhdGgodXNiZGV2LCBnby0+YnVzX2luZm8sIHNpemVvZihnby0+YnVzX2luZm8p
KTsKQEAgLTExNDEsNyArMTE0Niw2IEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1
Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAlpZiAodXNiLT5pbnRyX3VyYi0+dHJhbnNmZXJfYnVm
ZmVyID09IE5VTEwpCiAJCWdvdG8gYWxsb2NmYWlsOwogCi0JZXAgPSB1c2ItPnVzYmRldi0+ZXBf
aW5bNF07CiAJaWYgKHVzYl9lbmRwb2ludF90eXBlKCZlcC0+ZGVzYykgPT0gVVNCX0VORFBPSU5U
X1hGRVJfQlVMSykKIAkJdXNiX2ZpbGxfYnVsa191cmIodXNiLT5pbnRyX3VyYiwgdXNiLT51c2Jk
ZXYsCiAJCQl1c2JfcmN2YnVsa3BpcGUodXNiLT51c2JkZXYsIDQpLApAQCAtMTI2Myw5ICsxMjY3
LDEzIEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAq
aW50ZiwKIAogCS8qIEFsbG9jYXRlIHRoZSBVUkJzIGFuZCBidWZmZXJzIGZvciByZWNlaXZpbmcg
dGhlIHZpZGVvIHN0cmVhbSAqLwogCWlmIChib2FyZC0+ZmxhZ3MgJiBHTzcwMDdfVVNCX0VaVVNC
KSB7CisJCWlmICghdXNiLT51c2JkZXYtPmVwX2luWzZdKQorCQkJZ290byBhbGxvY2ZhaWw7CiAJ
CXZfdXJiX2xlbiA9IDEwMjQ7CiAJCXZpZGVvX3BpcGUgPSB1c2JfcmN2YnVsa3BpcGUodXNiLT51
c2JkZXYsIDYpOwogCX0gZWxzZSB7CisJCWlmICghdXNiLT51c2JkZXYtPmVwX2luWzFdKQorCQkJ
Z290byBhbGxvY2ZhaWw7CiAJCXZfdXJiX2xlbiA9IDUxMjsKIAkJdmlkZW9fcGlwZSA9IHVzYl9y
Y3ZidWxrcGlwZSh1c2ItPnVzYmRldiwgMSk7CiAJfQpAQCAtMTI4NSw2ICsxMjkzLDggQEAgc3Rh
dGljIGludCBnbzcwMDdfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCS8q
IEFsbG9jYXRlIHRoZSBVUkJzIGFuZCBidWZmZXJzIGZvciByZWNlaXZpbmcgdGhlIGF1ZGlvIHN0
cmVhbSAqLwogCWlmICgoYm9hcmQtPmZsYWdzICYgR083MDA3X1VTQl9FWlVTQikgJiYKIAkgICAg
KGJvYXJkLT5tYWluX2luZm8uZmxhZ3MgJiBHTzcwMDdfQk9BUkRfSEFTX0FVRElPKSkgeworCQlp
ZiAoIXVzYi0+dXNiZGV2LT5lcF9pbls4XSkKKwkJCWdvdG8gYWxsb2NmYWlsOwogCQlmb3IgKGkg
PSAwOyBpIDwgODsgKytpKSB7CiAJCQl1c2ItPmF1ZGlvX3VyYnNbaV0gPSB1c2JfYWxsb2NfdXJi
KDAsIEdGUF9LRVJORUwpOwogCQkJaWYgKHVzYi0+YXVkaW9fdXJic1tpXSA9PSBOVUxMKQotLSAK
Mi4xNi40Cgo=


--=-McCpIkgPwCqlblO8/Hrv--

