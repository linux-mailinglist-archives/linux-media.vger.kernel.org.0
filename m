Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED3D1B5BB2
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 14:46:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728387AbgDWMqy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 08:46:54 -0400
Received: from mx2.suse.de ([195.135.220.15]:42052 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728340AbgDWMqx (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 08:46:53 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 393FCAC50;
        Thu, 23 Apr 2020 12:46:51 +0000 (UTC)
Message-ID: <1587645997.23108.9.camel@suse.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Thu, 23 Apr 2020 14:46:37 +0200
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
References: <0000000000003cbf8e05a3d57b98@google.com>
Content-Type: multipart/mixed; boundary="=-Rm6ymNblYIvvzcF60Ug/"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-Rm6ymNblYIvvzcF60Ug/
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

--=-Rm6ymNblYIvvzcF60Ug/
Content-Disposition: attachment;
	filename="0001-go7007-add-sanity-checking-and-insanity-checking.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch;
	name="0001-go7007-add-sanity-checking-and-insanity-checking.patch";
	charset="UTF-8"

RnJvbSAxYzNiM2Y1ODYwOGUyYzc1ZTAyNjRhMWI3ZWFlMjEyNDVkNDQ2ZDc4IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDEzOjQ5OjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZ283MDA3
OiBhZGQgc2FuaXR5IGNoZWNraW5nIGFuZCBpbnNhbml0eSBjaGVja2luZwoKQSBtYWxpY2lvdXMg
VVNCIGRldmljZSBtYXkgbGFjayBlbmRwb2ludHMgdGhlIGRyaXZlciBhc3N1bWVzIHRvIGV4aXN0
CkFjY2Vzc2luZyB0aGVtIGxlYWRzIHRvIE5VTEwgcG9pbnRlciBhY2Nlc3Nlcy4gVGhpcyBwYXRj
aCBpbnRyb2R1Y2VzCnNhbml0eSBjaGVja2luZy4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVr
dW0gPG9uZXVrdW1Ac3VzZS5jb20+CkZpeGVzOiA4NjZiODY5NWQ2N2U4ICgiU3RhZ2luZzogYWRk
IHRoZSBnbzcwMDcgdmlkZW8gZHJpdmVyIikKLS0tCiBkcml2ZXJzL21lZGlhL3VzYi9nbzcwMDcv
Z283MDA3LXVzYi5jIHwgMTkgKysrKysrKysrKysrKysrKysrLQogMSBmaWxlIGNoYW5nZWQsIDE4
IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL21lZGlh
L3VzYi9nbzcwMDcvZ283MDA3LXVzYi5jIGIvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAw
Ny11c2IuYwppbmRleCBmODg5YzlkNzQwY2QuLjQzYjJmMDE4ZGY1NCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11c2IuYworKysgYi9kcml2ZXJzL21lZGlhL3Vz
Yi9nbzcwMDcvZ283MDA3LXVzYi5jCkBAIC0xMDUwLDYgKzEwNTAsMTAgQEAgc3RhdGljIGludCBn
bzcwMDdfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCWludCB2aWRlb19w
aXBlLCBpLCB2X3VyYl9sZW47CiAKIAlwcl9kZWJ1ZygicHJvYmluZyBuZXcgR083MDA3IFVTQiBi
b2FyZFxuIik7CisgICAgaWYgKCFpbnRmKQorICAgICAgICBwcmludGsoS0VSTl9FUlIiRGF2ZSwg
d2lsbCBJIGRyZWFtP1xuIik7CisgICAgaWYgKCF1c2JkZXYpCisgICAgICAgIHByaW50ayhLRVJO
X0VSUiJTaGFpIEh1bHVkIVxuIik7CiAKIAlzd2l0Y2ggKGlkLT5kcml2ZXJfaW5mbykgewogCWNh
c2UgR083MDA3X0JPQVJESURfTUFUUklYX0lJOgpAQCAtMTEyMSw2ICsxMTI1LDE0IEBAIHN0YXRp
YyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAkJcmV0
dXJuIC1FTk9NRU07CiAJfQogCisJLyogc2FuaXR5IGNoZWNrcyAqLworICAgIGlmICh1c2IgJiYg
dXNiLT51c2JkZXYpCisgICAgICAgIGVwID0gdXNiLT51c2JkZXYtPmVwX2luWzRdOworICAgIGVs
c2UKKyAgICAgICAgZXAgPSBOVUxMOworCWlmICghZXApCisJCXJldHVybiAtRU5PREVWOworCiAJ
dXNiLT5ib2FyZCA9IGJvYXJkOwogCXVzYi0+dXNiZGV2ID0gdXNiZGV2OwogCXVzYl9tYWtlX3Bh
dGgodXNiZGV2LCBnby0+YnVzX2luZm8sIHNpemVvZihnby0+YnVzX2luZm8pKTsKQEAgLTExNDEs
NyArMTE1Myw2IEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVy
ZmFjZSAqaW50ZiwKIAlpZiAodXNiLT5pbnRyX3VyYi0+dHJhbnNmZXJfYnVmZmVyID09IE5VTEwp
CiAJCWdvdG8gYWxsb2NmYWlsOwogCi0JZXAgPSB1c2ItPnVzYmRldi0+ZXBfaW5bNF07CiAJaWYg
KHVzYl9lbmRwb2ludF90eXBlKCZlcC0+ZGVzYykgPT0gVVNCX0VORFBPSU5UX1hGRVJfQlVMSykK
IAkJdXNiX2ZpbGxfYnVsa191cmIodXNiLT5pbnRyX3VyYiwgdXNiLT51c2JkZXYsCiAJCQl1c2Jf
cmN2YnVsa3BpcGUodXNiLT51c2JkZXYsIDQpLApAQCAtMTI2Myw5ICsxMjc0LDEzIEBAIHN0YXRp
YyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAogCS8q
IEFsbG9jYXRlIHRoZSBVUkJzIGFuZCBidWZmZXJzIGZvciByZWNlaXZpbmcgdGhlIHZpZGVvIHN0
cmVhbSAqLwogCWlmIChib2FyZC0+ZmxhZ3MgJiBHTzcwMDdfVVNCX0VaVVNCKSB7CisJCWlmICgh
dXNiLT51c2JkZXYtPmVwX2luWzZdKQorCQkJZ290byBhbGxvY2ZhaWw7CiAJCXZfdXJiX2xlbiA9
IDEwMjQ7CiAJCXZpZGVvX3BpcGUgPSB1c2JfcmN2YnVsa3BpcGUodXNiLT51c2JkZXYsIDYpOwog
CX0gZWxzZSB7CisJCWlmICghdXNiLT51c2JkZXYtPmVwX2luWzFdKQorCQkJZ290byBhbGxvY2Zh
aWw7CiAJCXZfdXJiX2xlbiA9IDUxMjsKIAkJdmlkZW9fcGlwZSA9IHVzYl9yY3ZidWxrcGlwZSh1
c2ItPnVzYmRldiwgMSk7CiAJfQpAQCAtMTI4NSw2ICsxMzAwLDggQEAgc3RhdGljIGludCBnbzcw
MDdfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCS8qIEFsbG9jYXRlIHRo
ZSBVUkJzIGFuZCBidWZmZXJzIGZvciByZWNlaXZpbmcgdGhlIGF1ZGlvIHN0cmVhbSAqLwogCWlm
ICgoYm9hcmQtPmZsYWdzICYgR083MDA3X1VTQl9FWlVTQikgJiYKIAkgICAgKGJvYXJkLT5tYWlu
X2luZm8uZmxhZ3MgJiBHTzcwMDdfQk9BUkRfSEFTX0FVRElPKSkgeworCQlpZiAoIXVzYi0+dXNi
ZGV2LT5lcF9pbls4XSkKKwkJCWdvdG8gYWxsb2NmYWlsOwogCQlmb3IgKGkgPSAwOyBpIDwgODsg
KytpKSB7CiAJCQl1c2ItPmF1ZGlvX3VyYnNbaV0gPSB1c2JfYWxsb2NfdXJiKDAsIEdGUF9LRVJO
RUwpOwogCQkJaWYgKHVzYi0+YXVkaW9fdXJic1tpXSA9PSBOVUxMKQotLSAKMi4xNi40Cgo=


--=-Rm6ymNblYIvvzcF60Ug/--

