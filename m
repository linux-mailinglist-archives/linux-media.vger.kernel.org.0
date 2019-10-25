Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C31A1E433B
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 08:08:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394231AbfJYGIX (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 02:08:23 -0400
Received: from mail-qt1-f171.google.com ([209.85.160.171]:44127 "EHLO
        mail-qt1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2393713AbfJYGIX (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 02:08:23 -0400
Received: by mail-qt1-f171.google.com with SMTP id z22so1579975qtq.11
        for <linux-media@vger.kernel.org>; Thu, 24 Oct 2019 23:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=IjVW0UoKbvk/FdLd+rUL0/Cl1ISGq7hKZI5b/En9zb4=;
        b=mXux+90k0K5r5wKf9KAXj3IVGSUfRVt0XlApVV7+lvR2yVXlwCtjyQO/A1JtllV5MF
         1wyI3wGjFKq80dZMClcQGqLJ9j0CcLpXWXHCTT5q2qF/uqMZvq6w/yWzKCv12Znvnlj0
         fXoo6XB4xYUSE3rMJauSO3AyZzdPrdfcV78M1L+Jzy4EP8KKOTlgC/5Ftrj5lJV5X3mS
         7R+BqdkbPwMy4vGy4LYAHUGLdPUrmfhFGzIxL3dZG4UCE+DD/LDFTdiLF3SU1j7JDa+0
         cuBoYAzKolgMg0keWqopTiXPf2/llgrYNnzJ3VvrqXFZj6LDDY78lPQQCvdn0QBtpY1O
         U8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=IjVW0UoKbvk/FdLd+rUL0/Cl1ISGq7hKZI5b/En9zb4=;
        b=aMHuvFTYfgxT9m9eOEUHgUuAMwe2rCwQmuZ3TBPO7bQ3NMrd645ljxV1wKVJ5bbv8A
         gs5uTtzJyngQHmap7Pi8YNH7P/czIP5HhMhQkIulza62F9B2bbLea3spYHjdg4QpRNVb
         BpbFdxs7AABXigq/qxSUH7I53qtOPqt0YMeN7cfuaSol7cpYmArtPexwd5oi3hDPmF53
         Rkxo0ldvYd+OR0mRZh8I3LG1V/VaBl66CmBfeQOB+i08p0j10lr18Gfwf4tcQjZP7+HT
         9wwIiaTjQ5V2tMMtGirRdV7mmh258njITVvI68G2T1dQVPCGwOHjFnevnP4OVcroXo4P
         g8gw==
X-Gm-Message-State: APjAAAWyjAU2avylYhfLyGv+VXxUTdjA7P4aktgEJ2Ol+/Ods99mQqhT
        q+kzE1NLPkr9J15Qr8Ht1X4YUrNZRJKANfkfd1Vi2Ku/
X-Google-Smtp-Source: APXvYqwIWWp+JhF6dDeTchTA/u8Ebbr6YQUFK/uLodPag2pavriA6XRrD6WnPEIcHrOM4c3foflAgiF+wjekR9yOBSQ=
X-Received: by 2002:a0c:f704:: with SMTP id w4mr1605213qvn.167.1571983702314;
 Thu, 24 Oct 2019 23:08:22 -0700 (PDT)
MIME-Version: 1.0
From:   Omer Shalev <omerdeshalev@gmail.com>
Date:   Fri, 25 Oct 2019 09:08:09 +0300
Message-ID: <CANBBnAaSWMT5ALoDyA7mL=tEGUE6GtGc4B6x7Gvs1Sup-Qe6ZA@mail.gmail.com>
Subject: usb:cpia2: Properly check framebuffer mmap offsets
To:     linux-media@vger.kernel.org
Content-Type: multipart/mixed; boundary="0000000000002b6f880595b5fa82"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--0000000000002b6f880595b5fa82
Content-Type: text/plain; charset="UTF-8"

Hello,
I've found an integer overflow vulnerability in the cpia2 driver's
mmap implementation , allowing an attacker to map area outside of the
frame's buffer,  giving him  a primitive that possibly can be used to
privilege escalations.  The security list confirmed the bug and asked
me to suggest a patch, and send it to you. I'm attaching the patch
file here.

If you would like to get the exploit code , or the explanations I sent
to the security list , please let me know.

I look forward to receiving your updates.
Best regards,
Omer Shalev.

--0000000000002b6f880595b5fa82
Content-Type: text/x-patch; charset="US-ASCII"; name="cpia2_patch.patch"
Content-Disposition: attachment; filename="cpia2_patch.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k25qhxew0>
X-Attachment-Id: f_k25qhxew0

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvdXNiL2NwaWEyL2NwaWEyX2NvcmUuYyBiL2RyaXZl
cnMvbWVkaWEvdXNiL2NwaWEyL2NwaWEyX2NvcmUuYwppbmRleCAyMGM1MGMyZDA0MmUuLjk3ZTYx
MGViMzg5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9tZWRpYS91c2IvY3BpYTIvY3BpYTJfY29yZS5j
CisrKyBiL2RyaXZlcnMvbWVkaWEvdXNiL2NwaWEyL2NwaWEyX2NvcmUuYwpAQCAtMjM5MCw4ICsy
MzkwLDggQEAgaW50IGNwaWEyX3JlbWFwX2J1ZmZlcihzdHJ1Y3QgY2FtZXJhX2RhdGEgKmNhbSwg
c3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEpCiB7CiAJY29uc3QgY2hhciAqYWRyID0gKGNvbnN0
IGNoYXIgKil2bWEtPnZtX3N0YXJ0OwogCXVuc2lnbmVkIGxvbmcgc2l6ZSA9IHZtYS0+dm1fZW5k
LXZtYS0+dm1fc3RhcnQ7Ci0JdW5zaWduZWQgbG9uZyBzdGFydF9vZmZzZXQgPSB2bWEtPnZtX3Bn
b2ZmIDw8IFBBR0VfU0hJRlQ7CiAJdW5zaWduZWQgbG9uZyBzdGFydCA9ICh1bnNpZ25lZCBsb25n
KSBhZHI7CisJdW5zaWduZWQgbG9uZyBzdGFydF9vZmZzZXQ7CiAJdW5zaWduZWQgbG9uZyBwYWdl
LCBwb3M7CiAKIAlEQkcoIm1tYXAgb2Zmc2V0OiVsZCBzaXplOiVsZFxuIiwgc3RhcnRfb2Zmc2V0
LCBzaXplKTsKQEAgLTIzOTksOSArMjM5OSwxNCBAQCBpbnQgY3BpYTJfcmVtYXBfYnVmZmVyKHN0
cnVjdCBjYW1lcmFfZGF0YSAqY2FtLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSkKIAlpZiAo
IXZpZGVvX2lzX3JlZ2lzdGVyZWQoJmNhbS0+dmRldikpCiAJCXJldHVybiAtRU5PREVWOwogCisJ
aWYgKHZtYS0+dm1fcGdvZmYgPiAofjBVTCA+PiBQQUdFX1NISUZUKSkKKwkJcmV0dXJuIC1FSU5W
QUw7CisKKwlzdGFydF9vZmZzZXQgPSB2bWEtPnZtX3Bnb2ZmIDw8IFBBR0VfU0hJRlQ7CisKIAlp
ZiAoc2l6ZSA+IGNhbS0+ZnJhbWVfc2l6ZSpjYW0tPm51bV9mcmFtZXMgIHx8CiAJICAgIChzdGFy
dF9vZmZzZXQgJSBjYW0tPmZyYW1lX3NpemUpICE9IDAgfHwKLQkgICAgKHN0YXJ0X29mZnNldCtz
aXplID4gY2FtLT5mcmFtZV9zaXplKmNhbS0+bnVtX2ZyYW1lcykpCisJICAgIChzdGFydF9vZmZz
ZXQgPiBjYW0tPmZyYW1lX3NpemUqY2FtLT5udW1fZnJhbWVzIC1zaXplKSkKIAkJcmV0dXJuIC1F
SU5WQUw7CiAKIAlwb3MgPSAoKHVuc2lnbmVkIGxvbmcpIChjYW0tPmZyYW1lX2J1ZmZlcikpICsg
c3RhcnRfb2Zmc2V0Owo=
--0000000000002b6f880595b5fa82--
