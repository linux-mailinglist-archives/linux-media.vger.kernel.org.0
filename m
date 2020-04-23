Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 253221B5CE4
	for <lists+linux-media@lfdr.de>; Thu, 23 Apr 2020 15:48:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728604AbgDWNsi (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 23 Apr 2020 09:48:38 -0400
Received: from mx2.suse.de ([195.135.220.15]:53800 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728277AbgDWNsi (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 23 Apr 2020 09:48:38 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 156F4ABEC;
        Thu, 23 Apr 2020 13:48:36 +0000 (UTC)
Message-ID: <1587649702.23108.10.camel@suse.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Thu, 23 Apr 2020 15:48:22 +0200
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
References: <0000000000003cbf8e05a3d57b98@google.com>
Content-Type: multipart/mixed; boundary="=-iLs55rpxhBtu80GHb/g1"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-iLs55rpxhBtu80GHb/g1
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

--=-iLs55rpxhBtu80GHb/g1
Content-Disposition: attachment; filename="0001-go7007-add-only-insanity-checking.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-go7007-add-only-insanity-checking.patch";
	charset="UTF-8"

RnJvbSBjMjEyMzI2Yzk4MmUxM2EzMGNhMzE4NzhjYzJhNWE4OGViYjBjMTA2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDEzOjQ5OjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSCAxLzFdIGdv
NzAwNzogYWRkIG9ubHkgaW5zYW5pdHkgY2hlY2tpbmcKCkEgbWFsaWNpb3VzIFVTQiBkZXZpY2Ug
bWF5IGxhY2sgZW5kcG9pbnRzIHRoZSBkcml2ZXIgYXNzdW1lcyB0byBleGlzdApBY2Nlc3Npbmcg
dGhlbSBsZWFkcyB0byBOVUxMIHBvaW50ZXIgYWNjZXNzZXMuIFRoaXMgcGF0Y2ggaW50cm9kdWNl
cwpzYW5pdHkgY2hlY2tpbmcuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3Vt
QHN1c2UuY29tPgpGaXhlczogODY2Yjg2OTVkNjdlOCAoIlN0YWdpbmc6IGFkZCB0aGUgZ283MDA3
IHZpZGVvIGRyaXZlciIpCi0tLQogZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11c2Iu
YyB8IDE5ICsrKysrKysrKysrKysrKysrKy0KIDEgZmlsZSBjaGFuZ2VkLCAxOCBpbnNlcnRpb25z
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3
L2dvNzAwNy11c2IuYyBiL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDctdXNiLmMKaW5k
ZXggZjg4OWM5ZDc0MGNkLi5hNDkyZDgzZjY5YjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEv
dXNiL2dvNzAwNy9nbzcwMDctdXNiLmMKKysrIGIvZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dv
NzAwNy11c2IuYwpAQCAtMTA1MCw2ICsxMDUwLDEwIEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9w
cm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAlpbnQgdmlkZW9fcGlwZSwgaSwgdl91
cmJfbGVuOwogCiAJcHJfZGVidWcoInByb2JpbmcgbmV3IEdPNzAwNyBVU0IgYm9hcmRcbiIpOwor
ICAgIGlmICghaW50ZikKKyAgICAgICAgcHJpbnRrKEtFUk5fRVJSIkRhdmUsIHdpbGwgSSBkcmVh
bT9cbiIpOworICAgIGlmICghdXNiZGV2KQorICAgICAgICBwcmludGsoS0VSTl9FUlIiU2hhaSBI
dWx1ZCFcbiIpOwogCiAJc3dpdGNoIChpZC0+ZHJpdmVyX2luZm8pIHsKIAljYXNlIEdPNzAwN19C
T0FSRElEX01BVFJJWF9JSToKQEAgLTExMjEsNiArMTEyNSwxNCBAQCBzdGF0aWMgaW50IGdvNzAw
N191c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJCXJldHVybiAtRU5PTUVN
OwogCX0KIAorCS8qIHNhbml0eSBjaGVja3MgKi8KKyAgICAvL2lmICh1c2IgJiYgdXNiLT51c2Jk
ZXYpCisgICAgICAgIGVwID0gdXNiLT51c2JkZXYtPmVwX2luWzRdOworICAgIC8vZWxzZQorICAg
IC8vICAgIGVwID0gTlVMTDsKKwlpZiAoIWVwKQorCQlyZXR1cm4gLUVOT0RFVjsKKwogCXVzYi0+
Ym9hcmQgPSBib2FyZDsKIAl1c2ItPnVzYmRldiA9IHVzYmRldjsKIAl1c2JfbWFrZV9wYXRoKHVz
YmRldiwgZ28tPmJ1c19pbmZvLCBzaXplb2YoZ28tPmJ1c19pbmZvKSk7CkBAIC0xMTQxLDcgKzEx
NTMsNiBAQCBzdGF0aWMgaW50IGdvNzAwN191c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2Ug
KmludGYsCiAJaWYgKHVzYi0+aW50cl91cmItPnRyYW5zZmVyX2J1ZmZlciA9PSBOVUxMKQogCQln
b3RvIGFsbG9jZmFpbDsKIAotCWVwID0gdXNiLT51c2JkZXYtPmVwX2luWzRdOwogCWlmICh1c2Jf
ZW5kcG9pbnRfdHlwZSgmZXAtPmRlc2MpID09IFVTQl9FTkRQT0lOVF9YRkVSX0JVTEspCiAJCXVz
Yl9maWxsX2J1bGtfdXJiKHVzYi0+aW50cl91cmIsIHVzYi0+dXNiZGV2LAogCQkJdXNiX3JjdmJ1
bGtwaXBlKHVzYi0+dXNiZGV2LCA0KSwKQEAgLTEyNjMsOSArMTI3NCwxMyBAQCBzdGF0aWMgaW50
IGdvNzAwN191c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAKIAkvKiBBbGxv
Y2F0ZSB0aGUgVVJCcyBhbmQgYnVmZmVycyBmb3IgcmVjZWl2aW5nIHRoZSB2aWRlbyBzdHJlYW0g
Ki8KIAlpZiAoYm9hcmQtPmZsYWdzICYgR083MDA3X1VTQl9FWlVTQikgeworCQlpZiAoIXVzYi0+
dXNiZGV2LT5lcF9pbls2XSkKKwkJCWdvdG8gYWxsb2NmYWlsOwogCQl2X3VyYl9sZW4gPSAxMDI0
OwogCQl2aWRlb19waXBlID0gdXNiX3JjdmJ1bGtwaXBlKHVzYi0+dXNiZGV2LCA2KTsKIAl9IGVs
c2UgeworCQlpZiAoIXVzYi0+dXNiZGV2LT5lcF9pblsxXSkKKwkJCWdvdG8gYWxsb2NmYWlsOwog
CQl2X3VyYl9sZW4gPSA1MTI7CiAJCXZpZGVvX3BpcGUgPSB1c2JfcmN2YnVsa3BpcGUodXNiLT51
c2JkZXYsIDEpOwogCX0KQEAgLTEyODUsNiArMTMwMCw4IEBAIHN0YXRpYyBpbnQgZ283MDA3X3Vz
Yl9wcm9iZShzdHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwKIAkvKiBBbGxvY2F0ZSB0aGUgVVJC
cyBhbmQgYnVmZmVycyBmb3IgcmVjZWl2aW5nIHRoZSBhdWRpbyBzdHJlYW0gKi8KIAlpZiAoKGJv
YXJkLT5mbGFncyAmIEdPNzAwN19VU0JfRVpVU0IpICYmCiAJICAgIChib2FyZC0+bWFpbl9pbmZv
LmZsYWdzICYgR083MDA3X0JPQVJEX0hBU19BVURJTykpIHsKKwkJaWYgKCF1c2ItPnVzYmRldi0+
ZXBfaW5bOF0pCisJCQlnb3RvIGFsbG9jZmFpbDsKIAkJZm9yIChpID0gMDsgaSA8IDg7ICsraSkg
ewogCQkJdXNiLT5hdWRpb191cmJzW2ldID0gdXNiX2FsbG9jX3VyYigwLCBHRlBfS0VSTkVMKTsK
IAkJCWlmICh1c2ItPmF1ZGlvX3VyYnNbaV0gPT0gTlVMTCkKLS0gCjIuMTYuNAoK


--=-iLs55rpxhBtu80GHb/g1--

