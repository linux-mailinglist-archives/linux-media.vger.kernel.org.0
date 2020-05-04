Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404131C3C67
	for <lists+linux-media@lfdr.de>; Mon,  4 May 2020 16:08:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728663AbgEDOIl (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 4 May 2020 10:08:41 -0400
Received: from mx2.suse.de ([195.135.220.15]:49188 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726404AbgEDOIl (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 4 May 2020 10:08:41 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id DCE4DAD2C;
        Mon,  4 May 2020 14:08:40 +0000 (UTC)
Message-ID: <1588601290.13662.6.camel@suse.com>
Subject: Re: general protection fault in go7007_usb_probe
From:   Oliver Neukum <oneukum@suse.com>
To:     syzbot <syzbot+cabfa4b5b05ff6be4ef0@syzkaller.appspotmail.com>,
        andreyknvl@google.com, hverkuil-cisco@xs4all.nl,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-usb@vger.kernel.org, mchehab@kernel.org,
        syzkaller-bugs@googlegroups.com
Date:   Mon, 04 May 2020 16:08:10 +0200
In-Reply-To: <0000000000003cbf8e05a3d57b98@google.com>
References: <0000000000003cbf8e05a3d57b98@google.com>
Content-Type: multipart/mixed; boundary="=-NgPzncis5hgzBhPmjfxz"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org


--=-NgPzncis5hgzBhPmjfxz
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

--=-NgPzncis5hgzBhPmjfxz
Content-Disposition: attachment; filename="0001-go7007-add-sanity-checking-for-endpoints.patch"
Content-Transfer-Encoding: base64
Content-Type: text/x-patch; name="0001-go7007-add-sanity-checking-for-endpoints.patch";
	charset="UTF-8"

RnJvbSBhNDAxYjllZjg5YzRjZmJkZWIzOTkzZDY4YjUxNDIzZTkwOGJlN2E1IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBPbGl2ZXIgTmV1a3VtIDxvbmV1a3VtQHN1c2UuY29tPgpEYXRl
OiBXZWQsIDIyIEFwciAyMDIwIDEzOjQ5OjU1ICswMjAwClN1YmplY3Q6IFtQQVRDSF0gZ283MDA3
OiBhZGQgc2FuaXR5IGNoZWNraW5nIGZvciBlbmRwb2ludHMKCkEgbWFsaWNpb3VzIFVTQiBkZXZp
Y2UgbWF5IGxhY2sgZW5kcG9pbnRzIHRoZSBkcml2ZXIgYXNzdW1lcyB0byBleGlzdApBY2Nlc3Np
bmcgdGhlbSBsZWFkcyB0byBOVUxMIHBvaW50ZXIgYWNjZXNzZXMuIFRoaXMgcGF0Y2ggaW50cm9k
dWNlcwpzYW5pdHkgY2hlY2tpbmcuCgpTaWduZWQtb2ZmLWJ5OiBPbGl2ZXIgTmV1a3VtIDxvbmV1
a3VtQHN1c2UuY29tPgpGaXhlczogODY2Yjg2OTVkNjdlOCAoIlN0YWdpbmc6IGFkZCB0aGUgZ283
MDA3IHZpZGVvIGRyaXZlciIpCi0tLQogZHJpdmVycy9tZWRpYS91c2IvZ283MDA3L2dvNzAwNy11
c2IuYyB8IDExICsrKysrKysrKystCiAxIGZpbGUgY2hhbmdlZCwgMTAgaW5zZXJ0aW9ucygrKSwg
MSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcw
MDctdXNiLmMgYi9kcml2ZXJzL21lZGlhL3VzYi9nbzcwMDcvZ283MDA3LXVzYi5jCmluZGV4IGY4
ODljOWQ3NDBjZC4uZGJmMDQ1NWQ1ZDUwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21lZGlhL3VzYi9n
bzcwMDcvZ283MDA3LXVzYi5jCisrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL2dvNzAwNy9nbzcwMDct
dXNiLmMKQEAgLTExMzIsNiArMTEzMiwxMCBAQCBzdGF0aWMgaW50IGdvNzAwN191c2JfcHJvYmUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJCWdvLT5ocGlfb3BzID0gJmdvNzAwN191c2Jf
b25ib2FyZF9ocGlfb3BzOwogCWdvLT5ocGlfY29udGV4dCA9IHVzYjsKIAorCWVwID0gdXNiLT51
c2JkZXYtPmVwX2luWzRdOworCWlmICghZXApCisJCXJldHVybiAtRU5PREVWOworCiAJLyogQWxs
b2NhdGUgdGhlIFVSQiBhbmQgYnVmZmVyIGZvciByZWNlaXZpbmcgaW5jb21pbmcgaW50ZXJydXB0
cyAqLwogCXVzYi0+aW50cl91cmIgPSB1c2JfYWxsb2NfdXJiKDAsIEdGUF9LRVJORUwpOwogCWlm
ICh1c2ItPmludHJfdXJiID09IE5VTEwpCkBAIC0xMTQxLDcgKzExNDUsNiBAQCBzdGF0aWMgaW50
IGdvNzAwN191c2JfcHJvYmUoc3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAJaWYgKHVzYi0+
aW50cl91cmItPnRyYW5zZmVyX2J1ZmZlciA9PSBOVUxMKQogCQlnb3RvIGFsbG9jZmFpbDsKIAot
CWVwID0gdXNiLT51c2JkZXYtPmVwX2luWzRdOwogCWlmICh1c2JfZW5kcG9pbnRfdHlwZSgmZXAt
PmRlc2MpID09IFVTQl9FTkRQT0lOVF9YRkVSX0JVTEspCiAJCXVzYl9maWxsX2J1bGtfdXJiKHVz
Yi0+aW50cl91cmIsIHVzYi0+dXNiZGV2LAogCQkJdXNiX3JjdmJ1bGtwaXBlKHVzYi0+dXNiZGV2
LCA0KSwKQEAgLTEyNjMsOSArMTI2NiwxMyBAQCBzdGF0aWMgaW50IGdvNzAwN191c2JfcHJvYmUo
c3RydWN0IHVzYl9pbnRlcmZhY2UgKmludGYsCiAKIAkvKiBBbGxvY2F0ZSB0aGUgVVJCcyBhbmQg
YnVmZmVycyBmb3IgcmVjZWl2aW5nIHRoZSB2aWRlbyBzdHJlYW0gKi8KIAlpZiAoYm9hcmQtPmZs
YWdzICYgR083MDA3X1VTQl9FWlVTQikgeworCQlpZiAoIXVzYi0+dXNiZGV2LT5lcF9pbls2XSkK
KwkJCWdvdG8gYWxsb2NmYWlsOwogCQl2X3VyYl9sZW4gPSAxMDI0OwogCQl2aWRlb19waXBlID0g
dXNiX3JjdmJ1bGtwaXBlKHVzYi0+dXNiZGV2LCA2KTsKIAl9IGVsc2UgeworCQlpZiAoIXVzYi0+
dXNiZGV2LT5lcF9pblsxXSkKKwkJCWdvdG8gYWxsb2NmYWlsOwogCQl2X3VyYl9sZW4gPSA1MTI7
CiAJCXZpZGVvX3BpcGUgPSB1c2JfcmN2YnVsa3BpcGUodXNiLT51c2JkZXYsIDEpOwogCX0KQEAg
LTEyODUsNiArMTI5Miw4IEBAIHN0YXRpYyBpbnQgZ283MDA3X3VzYl9wcm9iZShzdHJ1Y3QgdXNi
X2ludGVyZmFjZSAqaW50ZiwKIAkvKiBBbGxvY2F0ZSB0aGUgVVJCcyBhbmQgYnVmZmVycyBmb3Ig
cmVjZWl2aW5nIHRoZSBhdWRpbyBzdHJlYW0gKi8KIAlpZiAoKGJvYXJkLT5mbGFncyAmIEdPNzAw
N19VU0JfRVpVU0IpICYmCiAJICAgIChib2FyZC0+bWFpbl9pbmZvLmZsYWdzICYgR083MDA3X0JP
QVJEX0hBU19BVURJTykpIHsKKwkJaWYgKCF1c2ItPnVzYmRldi0+ZXBfaW5bOF0pCisJCQlnb3Rv
IGFsbG9jZmFpbDsKIAkJZm9yIChpID0gMDsgaSA8IDg7ICsraSkgewogCQkJdXNiLT5hdWRpb191
cmJzW2ldID0gdXNiX2FsbG9jX3VyYigwLCBHRlBfS0VSTkVMKTsKIAkJCWlmICh1c2ItPmF1ZGlv
X3VyYnNbaV0gPT0gTlVMTCkKLS0gCjIuMTYuNAoK


--=-NgPzncis5hgzBhPmjfxz--

