Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B1841BF8F3
	for <lists+linux-media@lfdr.de>; Thu, 30 Apr 2020 15:10:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726784AbgD3NKR (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 30 Apr 2020 09:10:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:53122 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726520AbgD3NKQ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 30 Apr 2020 09:10:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 19F2BAB3D;
        Thu, 30 Apr 2020 13:10:14 +0000 (UTC)
Message-ID: <1588252185.16510.12.camel@suse.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Thu, 30 Apr 2020 15:09:45 +0200
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
References: <0000000000003cbf8e05a3d57b98@google.com>
Content-Type: multipart/mixed; boundary="=-+D+L3gse/YsCAM2iZJV0"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-+D+L3gse/YsCAM2iZJV0
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

--=-+D+L3gse/YsCAM2iZJV0
Content-Disposition: attachment; filename="0001-go7007-add-only-insanity-checking.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-go7007-add-only-insanity-checking.patch";
	charset="UTF-8"

RnJvbSBhMDA2YTcyNDg4MWJmYjU5MmRiNjFiYTE3ZGIxZTIxN2I5NjE1Y2M0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDEzOjQ5OjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZ283MDA3
OiBhZGQgb25seSBpbnNhbml0eSBjaGVja2luZwoKQSBtYWxpY2lvdXMgVVNCIGRldmljZSBtYXkg
bGFjayBlbmRwb2ludHMgdGhlIGRyaXZlciBhc3N1bWVzIHRvIGV4aXN0CkFjY2Vzc2luZyB0aGVt
IGxlYWRzIHRvIE5VTEwgcG9pbnRlciBhY2Nlc3Nlcy4gVGhpcyBwYXRjaCBpbnRyb2R1Y2VzCnNh
bml0eSBjaGVja2luZy4KClNpZ25lZC1vZmYtYnk6IE9saXZlciBOZXVrdW0gPG9uZXVrdW1Ac3Vz
ZS5jb20+CkZpeGVzOiA4NjZiODY5NWQ2N2U4ICgiU3RhZ2luZzogYWRkIHRoZSBnbzcwMDcgdmlk
ZW8gZHJpdmVyIikKLS0tCiBkcml2ZXJzL21lZGlhL3VzYi9nbzcwMDcvZ283MDA3LXVzYi5jIHwg
MjEgKysrKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMjAgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9n
bzcwMDctdXNiLmMgYi9kcml2ZXJzL21lZGlhL3VzYi9nbzcwMDcvZ283MDA3LXVzYi5jCmluZGV4
IGY4ODljOWQ3NDBjZC4uYTQ1YWYxNDljYWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3Vz
Yi9nbzcwMDcvZ283MDA3LXVzYi5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcw
MDctdXNiLmMKQEAgLTExMzIsNiArMTEzMiwyMCBAQCBzdGF0aWMgaW50IGdvNzAwN191c2JfcHJv
YmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJCWdvLT5ocGlfb3BzID0gJmdvNzAwN191
c2Jfb25ib2FyZF9ocGlfb3BzOwogCWdvLT5ocGlfY29udGV4dCA9IHVzYjsKIAorCWlmICghdXNi
LT51c2JkZXYpIHsKKwkJcHJpbnRrKEtFUk5fRVJSIkl0IGlzIGZ1bGwgb2Ygc3RhcnMhXG4iKTsK
KwkJQlVHKCk7CisJfQorCisJaWYgKCF1c2ItPnVzYmRldi0+ZXBfaW4pIHsKKwkJcHJpbnRrKEtF
Uk5fRVJSIkl0IGlzIGFsc28gZnVsbCBvZiBzdGFycyFcbiIpOworCQlCVUcoKTsKKwl9CisKKwll
cCA9IHVzYi0+dXNiZGV2LT5lcF9pbls0XTsKKwlpZiAoIWVwKQorCQlyZXR1cm4gLUVOT0RFVjsK
KwogCS8qIEFsbG9jYXRlIHRoZSBVUkIgYW5kIGJ1ZmZlciBmb3IgcmVjZWl2aW5nIGluY29taW5n
IGludGVycnVwdHMgKi8KIAl1c2ItPmludHJfdXJiID0gdXNiX2FsbG9jX3VyYigwLCBHRlBfS0VS
TkVMKTsKIAlpZiAodXNiLT5pbnRyX3VyYiA9PSBOVUxMKQpAQCAtMTE0MSw3ICsxMTU1LDYgQEAg
c3RhdGljIGludCBnbzcwMDdfdXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAog
CWlmICh1c2ItPmludHJfdXJiLT50cmFuc2Zlcl9idWZmZXIgPT0gTlVMTCkKIAkJZ290byBhbGxv
Y2ZhaWw7CiAKLQllcCA9IHVzYi0+dXNiZGV2LT5lcF9pbls0XTsKIAlpZiAodXNiX2VuZHBvaW50
X3R5cGUoJmVwLT5kZXNjKSA9PSBVU0JfRU5EUE9JTlRfWEZFUl9CVUxLKQogCQl1c2JfZmlsbF9i
dWxrX3VyYih1c2ItPmludHJfdXJiLCB1c2ItPnVzYmRldiwKIAkJCXVzYl9yY3ZidWxrcGlwZSh1
c2ItPnVzYmRldiwgNCksCkBAIC0xMjYzLDkgKzEyNzYsMTMgQEAgc3RhdGljIGludCBnbzcwMDdf
dXNiX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLAogCiAJLyogQWxsb2NhdGUgdGhl
IFVSQnMgYW5kIGJ1ZmZlcnMgZm9yIHJlY2VpdmluZyB0aGUgdmlkZW8gc3RyZWFtICovCiAJaWYg
KGJvYXJkLT5mbGFncyAmIEdPNzAwN19VU0JfRVpVU0IpIHsKKwkJaWYgKCF1c2ItPnVzYmRldi0+
ZXBfaW5bNl0pCisJCQlnb3RvIGFsbG9jZmFpbDsKIAkJdl91cmJfbGVuID0gMTAyNDsKIAkJdmlk
ZW9fcGlwZSA9IHVzYl9yY3ZidWxrcGlwZSh1c2ItPnVzYmRldiwgNik7CiAJfSBlbHNlIHsKKwkJ
aWYgKCF1c2ItPnVzYmRldi0+ZXBfaW5bMV0pCisJCQlnb3RvIGFsbG9jZmFpbDsKIAkJdl91cmJf
bGVuID0gNTEyOwogCQl2aWRlb19waXBlID0gdXNiX3JjdmJ1bGtwaXBlKHVzYi0+dXNiZGV2LCAx
KTsKIAl9CkBAIC0xMjg1LDYgKzEzMDIsOCBAQCBzdGF0aWMgaW50IGdvNzAwN191c2JfcHJvYmUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJLyogQWxsb2NhdGUgdGhlIFVSQnMgYW5kIGJ1
ZmZlcnMgZm9yIHJlY2VpdmluZyB0aGUgYXVkaW8gc3RyZWFtICovCiAJaWYgKChib2FyZC0+Zmxh
Z3MgJiBHTzcwMDdfVVNCX0VaVVNCKSAmJgogCSAgICAoYm9hcmQtPm1haW5faW5mby5mbGFncyAm
IEdPNzAwN19CT0FSRF9IQVNfQVVESU8pKSB7CisJCWlmICghdXNiLT51c2JkZXYtPmVwX2luWzhd
KQorCQkJZ290byBhbGxvY2ZhaWw7CiAJCWZvciAoaSA9IDA7IGkgPCA4OyArK2kpIHsKIAkJCXVz
Yi0+YXVkaW9fdXJic1tpXSA9IHVzYl9hbGxvY191cmIoMCwgR0ZQX0tFUk5FTCk7CiAJCQlpZiAo
dXNiLT5hdWRpb191cmJzW2ldID09IE5VTEwpCi0tIAoyLjE2LjQKCg==


--=-+D+L3gse/YsCAM2iZJV0--

