Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A41B01127EC
	for <lists+linux-media@lfdr.de>; Wed,  4 Dec 2019 10:41:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726508AbfLDJlE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 4 Dec 2019 04:41:04 -0500
Received: from mail-lf1-f49.google.com ([209.85.167.49]:44960 "EHLO
        mail-lf1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725922AbfLDJlD (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 4 Dec 2019 04:41:03 -0500
Received: by mail-lf1-f49.google.com with SMTP id v201so5543732lfa.11
        for <linux-media@vger.kernel.org>; Wed, 04 Dec 2019 01:41:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=jbiXI6vS7d7EhfTynB3nTWNQczHrKIoPGqbiygTNF6o=;
        b=FnKnReY7BKwule+ObxnOA7HD2Y2HQAtERxyJdrXw6SXUzuBvmiL2yzX6q6ARzqhVIb
         HZKpZfcd2cPVjW4KfiQiNKEQiuT2ToFG0ym7Ry+OQXuianxcPQ1hpmlaL3hFk0BdDeey
         8g2CPRQ/pzvYGyEKd17KtX+5xTS1fikXq4WCpt0kWr4hECOTUk7XYQte0ceOTw7LGWxP
         b2KuSMQKYpSh4GuOh5yLhgabcksoNLGon6MEVCXqARj0CqXjwPMV6YTwowlv9TTXRWfw
         F1JP4y3c1tRUSjHbtwNHmtAYwHmRHq/yGuIVQqIZw1k2xKbm/8LqR1h2UweGbMS+xdx1
         uuJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=jbiXI6vS7d7EhfTynB3nTWNQczHrKIoPGqbiygTNF6o=;
        b=H6Vldy/yKO3lKneooExMeRg87kDFe3xuPhtMZeg3VZwC6PUnbG83NDVJ50IWoHhQ93
         H5A3KWBpM6kpCcx+ON3pSxImS6dKh6c0uw7mo160xAA6DyIu80uBAlBjyU40RcwrmU3n
         fBjvY+cdRxSraNcHuRUWjwNNDhM88+G1+DNDo1axCW4oXtPjMav4cEUSBGkChOE4aogi
         lBHWFITo07WvAYm8eF1DE9oQLD0VxekgkLP3/QWokZwgibUZzvf2GgXQU8DMSEPwzBvx
         Z1suNrijvR4UgpPjJm6IyzA/JaxdkBTVC7o2zh9+Adx31EjnJuhGjyap7epjPYfO3nGM
         boaA==
X-Gm-Message-State: APjAAAXdWKaAscJrinTveCk/xn20XX3dODZsVIrRscAcLJZT0CPVjp63
        r2iJALKVaSpogyCfJnsROkFryuDV+jHXKFkWO4qE6w==
X-Google-Smtp-Source: APXvYqwDILL23XisNDvfxogf6BSzpK51KV+7P/r+txZrTQ0xGLuXVd1FGZJxKUUo/yQ9vJne45kqCb17iFXVm6QsRfk=
X-Received: by 2002:ac2:498e:: with SMTP id f14mr1497336lfl.172.1575452460600;
 Wed, 04 Dec 2019 01:41:00 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a19:ef0a:0:0:0:0:0 with HTTP; Wed, 4 Dec 2019 01:40:59 -0800 (PST)
From:   Vincent McIntyre <vincent.mcintyre@gmail.com>
Date:   Wed, 4 Dec 2019 20:40:59 +1100
Message-ID: <CAEsFdVOUq4gyue+EZjbE_J_D=W=XnsJBTYGwfk9rV50DJmY+3Q@mail.gmail.com>
Subject: patchowork parsing issue?
To:     linux-media <linux-media@vger.kernel.org>
Content-Type: multipart/mixed; boundary="000000000000478a760598dd9c9a"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000478a760598dd9c9a
Content-Type: text/plain; charset="UTF-8"

Hello

I've submitted this patch a couple of times:

  [PATCH] media_build: support building against a specific kernel

I formatted it with git-format-patch and it makes it into patchwork:

  https://patchwork.linuxtv.org/patch/60186/
  https://patchwork.linuxtv.org/patch/59979/

but it doesn't look right when it gets there. For some reason,
the last hunk of the patch is included with the patch description.
This was why I resent it the first time, I thought I must have
messed up the formatting.

Admittedly I'm sending from gmail's web interface but I have taken
some care to get the text correctly formatted and patchwork did the
same thing with it twice, so I'm starting to wonder if there's an issue
with patchwork.

I've attached my copy of the last outgoing email attempt in case
that's useful. The only thing that looks suspicous to me is on the
signed-off-by line I did not enclose my email address in '< >' markers,
while that last hunk happens to have those characters in it.

Kind regards
Vince

--000000000000478a760598dd9c9a
Content-Type: text/plain; charset="US-ASCII"; name="original-email.txt"
Content-Disposition: attachment; filename="original-email.txt"
Content-Transfer-Encoding: base64
X-Attachment-Id: file0

RnJvbSB2aW5jZW50Lm1jaW50eXJlQGdtYWlsLmNvbSBGcmkgTm92IDE1IDIyOjExOjE0IDIwMTkK
TUlNRS1WZXJzaW9uOiAxLjAKUmVjZWl2ZWQ6IGJ5IDIwMDI6YTE5OjkwNTowOjA6MDowOjAgd2l0
aCBIVFRQOyBGcmksIDE1IE5vdiAyMDE5IDAzOjExOjE0IC0wODAwIChQU1QpCkRhdGU6IEZyaSwg
MTUgTm92IDIwMTkgMjI6MTE6MTQgKzExMDAKRGVsaXZlcmVkLVRvOiB2aW5jZW50Lm1jaW50eXJl
QGdtYWlsLmNvbQpNZXNzYWdlLUlEOiA8Q0FFc0ZkVlA5Rmt2Rzgrb1BMa01VdWF4UE5ZbmMyVWcx
ZEJnbkFBeFpxU19mVUdmNzdRQG1haWwuZ21haWwuY29tPgpTdWJqZWN0OiBbUEFUQ0hdIG1lZGlh
X2J1aWxkOiBzdXBwb3J0IGJ1aWxkaW5nIGFnYWluc3QgYSBzcGVjaWZpYyBrZXJuZWwuCkZyb206
IFZpbmNlbnQgTWNJbnR5cmUgPHZpbmNlbnQubWNpbnR5cmVAZ21haWwuY29tPgpUbzogbGludXgt
bWVkaWEgPGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4KQ29udGVudC1UeXBlOiB0ZXh0L3Bs
YWluOyBjaGFyc2V0PSJVVEYtOCIKU3RhdHVzOiBSTwpDb250ZW50LUxlbmd0aDogMjE4OApMaW5l
czogNzMKCkkgZmluZCBpdCBoZWxwZnVsIHRvIGJlIGFibGUgdG8gYnVpbGQgdGhlIGxpbnV4LW1l
ZGlhIG1vZHVsZXMKZm9yIGEga2VybmVsIG90aGVyIHRoYW4gdGhlIG9uZSBJIGFtIGN1cnJlbnRs
eSBydW5uaW5nLgoKVGhpcyBpcyBhIHJlc2VuZCBvZiB0aGUgcGF0Y2ggdGhhdCBhcHBlYXJlZCBh
dAogIGh0dHBzOi8vcGF0Y2h3b3JrLmxpbnV4dHYub3JnL3BhdGNoLzU5OTc5LwphbmQgY29tcGxl
dGVseSBzdXBlcmNlZGVzIHRoYXQgcGF0Y2guClRoZXJlIGFyZSBubyBkaWZmZXJlbmNlcyBpbiB0
aGUgcGF0Y2gsIGp1c3QgdGhlIGZvcm1hdHRpbmcgb2YgdGhlCnN1Ym1pc3Npb24gZW1haWwuCgpT
aWduZWQtb2ZmLWJ5OiB2aW5jZW50Lm1jaW50eXJlQGdtYWlsLmNvbQoKLS0tCiBidWlsZCB8IDE2
ICsrKysrKysrKysrKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAyIGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2J1aWxkIGIvYnVpbGQKaW5kZXggMmY2YjNmNC4uYzIw
NjdlNyAxMDA3NTUKLS0tIGEvYnVpbGQKKysrIGIvYnVpbGQKQEAgLTE0LDYgKzE0LDcgQEAgbXkg
JGNoZWNrX29ubHkgPSAwOwogbXkgJG1haW5fZ2l0ID0gMDsKIG15ICRkZXB0aDsKIG15IEBnaXQ7
CitteSAka2VybmVsX3ZlcnNpb24gPSAnJzsKCiBteSAkbWFpbl9naXRfdXJsID0gImdpdDovL2xp
bnV4dHYub3JnL21lZGlhX3RyZWUuZ2l0IjsKIG15ICRtYWluX2JyYW5jaCA9ICJtYXN0ZXIiOwpA
QCAtMjcsNiArMjgsNyBAQCBHZXRPcHRpb25zKCd2fHZlcmJvc2UnID0+IFwkbGV2ZWwsCiAgICAg
ICAgICAgJ21haW5fZ2l0fG1haW4tZ2l0JyA9PiBcJG1haW5fZ2l0LAogICAgICAgICAgICdkZXB0
aD1pJyA9PiBcJGRlcHRoLAogICAgICAgICAgICdnaXQ9c3syfScgPT4gXEBnaXQsCisgICAgICAg
ICAgJ3ZlcnNpb249cycgPT4gXCRrZXJuZWxfdmVyc2lvbiwKICAgICAgICAgICkgb3IgcG9kMnVz
YWdlKDIpOwogcG9kMnVzYWdlKDEpIGlmICRoZWxwOwogcG9kMnVzYWdlKC1leGl0c3RhdHVzID0+
IDAsIC12ZXJib3NlID0+IDIpIGlmICRtYW47CkBAIC01MjIsNyArNTI0LDEyIEBAIHByaW50ICIq
KioqKioqKioqKioqKioqKipcbiI7CiBwcmludCAiKiBTdGFydCBidWlsZGluZyAqXG4iOwogcHJp
bnQgIioqKioqKioqKioqKioqKioqKlxuIjsKCi1ydW4oIm1ha2UgYWxseWVzY29uZmlnIiwgImNh
bid0IHNlbGVjdCBhbGwgZHJpdmVycyIpOworaWYgKCRrZXJuZWxfdmVyc2lvbiA9fiAvXFMvKSB7
CisgICAgcHJpbnQgIkJ1aWxkaW5nIGZvciBrZXJuZWwgdmVyc2lvbiAka2VybmVsX3ZlcnNpb25c
biI7CisgICAgcnVuKCJtYWtlIGFsbHllc2NvbmZpZyBWRVI9JGtlcm5lbF92ZXJzaW9uIiwgImNh
bid0IHNlbGVjdCBhbGwgZHJpdmVycyIpOworfSBlbHNlIHsKKyAgICBydW4oIm1ha2UgYWxseWVz
Y29uZmlnIiwgImNhbid0IHNlbGVjdCBhbGwgZHJpdmVycyIpOworfQogcnVuKCJtYWtlIiwgImJ1
aWxkIGZhaWxlZCIpOwoKIHByaW50ICIqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioqKioq
KioqKioqKioqKioqKioqKioqKioqKioqXG4iOwpAQCAtNTM5LDcgKzU0Niw3IEBAIGJ1aWxkIC0g
QnVpbGRzIHRoZSBtZWRpYSBkcml2ZXJzIHdpdGhvdXQgbmVlZGluZwp0byBjb21waWxlIGEgbmV3
IGtlcm5lbAogPWhlYWQxIFNZTk9QU0lTCgogYnVpbGQgWy0taGVscF0gWy0tbWFuXSBbLS12ZXJi
b3NlXSBbLS1jaGVjay1vbmx5XSBbPC0tZ2l0PiBbVVJMXSBbQlJBTkNIXV0KLSBbLS1tYWluLWdp
dF0gWy0tZGVwdGggW0RFUFRIXV0KKyBbLS1tYWluLWdpdF0gWy0tZGVwdGggW0RFUFRIXV0gWy0t
dmVyc2lvbiBbS0VSTkVMVkVSU0lPTl1dCgogPWhlYWQxIE9QVElPTlMKCkBAIC01NzksNiArNTg2
LDExIEBAIGRlcHRoIHBhcmFtZXRlciwgaW4gb3JkZXIgdG8gZ2V0IGEgc21hbGxlciB0cmVlLgoK
IFRoYXQgaGVscHMgdG8gcmVkdWNlIGRpc2sgc3RvcmFnZSBhbmQgZG93bmxvYWQgdGltZS4KCis9
aXRlbSBCPC0tdmVyc2lvbj4gW0tFUk5FTFZFUlNJT05dCisKK1RyeSB0byBidWlsZCBmb3IgYSBw
YXJ0aWN1bGFyIGtlcm5lbCB2ZXJzaW9uLiBUaGUgZm9ybWF0IG9mIHRoZQordmVyc2lvbiBzdHJp
bmcgaXMgdGhlIHNhbWUgYXMgdGhlIG91dHB1dCBmcm9tICd1bmFtZSAtcicuCisKID1iYWNrCgog
PWhlYWQxIERFU0NSSVBUSU9OCi0tIAoyLjcuNAoK
--000000000000478a760598dd9c9a--
