Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4671353A57D
	for <lists+linux-media@lfdr.de>; Wed,  1 Jun 2022 14:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352254AbiFAMyu (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Jun 2022 08:54:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348566AbiFAMyt (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Jun 2022 08:54:49 -0400
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com [IPv6:2607:f8b0:4864:20::e34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A2C57035E
        for <linux-media@vger.kernel.org>; Wed,  1 Jun 2022 05:54:48 -0700 (PDT)
Received: by mail-vs1-xe34.google.com with SMTP id f13so1591287vsp.1
        for <linux-media@vger.kernel.org>; Wed, 01 Jun 2022 05:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=eKAmjKrGtOOkUQ3MCOAS+AupfVMD7Ww7tROVMEmgtsg=;
        b=BSYLCnMDizyJ7+B2ODgfxNHAXNKmcFCAf5aM8zr5CjSW+9Lchmnj7PQveAVor7P+oz
         xLWHZFT0HJgUuCK1Svig2fwF6tlxFNX8mojXw6kb1EMrOO67zGPnqmsRVIlxX2HQfrBB
         V+vpIo3Gkp45EQ8N0JQRIBMPTl77CZRi1ZCFZG5Qzawkwr8nPal7o85sc9m9EXlgHtgh
         nOqeEgk6LcdYZxLHbF3aU/qjXIps/+ryjEHeMG4S6EQgnuOhKNCY1aQxvz43QcTLTrNV
         IOgbVmzdDAjZ7rnfFqWVcPn+mLVSY+KZenT3kfhD1NTD7nvQhs6UjX6ph0fvGi5YXx8S
         PyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=eKAmjKrGtOOkUQ3MCOAS+AupfVMD7Ww7tROVMEmgtsg=;
        b=Rc06++NbCzCLW3aEqmuQ5n8fzZhLoqJBI/RBRWPYy90pFbG0LE0UtShNVqkCSSdX/A
         ft/W5h9Zpu9uUgHVokHSrzORDY2iNLmxMxYO/TWS+NB6Feb31S2yrQMSpyPZy9QkdEPx
         Fc8Hky+m13EHJJ6v8DlSE72yFa3FJjzARnpAVQXWAPcpi0CGouBDMoC7pWjA3EwtriM+
         vnlhwEZT8s7IGtJhPZgNwVfT74ePvz/Lh70yb8BjlstTvkrX9+/squHb7f0z694Wo8MP
         FRjN4yFU/e8pmFgYSMs+F3AQTmIMhsmgHEB2CHQb5gfALb+hlWfdQ1TutOnSsV0DIacS
         phBA==
X-Gm-Message-State: AOAM532sT4etVRFBdAjsJOlNFCsGVg90zYfMJJm3PzH89zVOZtEXQC16
        CKd7EfOBgKC1dXuFegGJqO1uIkdCOOOQqFQDHZUJYIi7ISE=
X-Google-Smtp-Source: ABdhPJxjvVvxJN9lcOAH9LQTyZyL5z20uF6YjdyUvWNLafuV6ovbBzY2hl7KSYKzQ8YfaPNJlxUbc4NHJ+WzI+OKCy8=
X-Received: by 2002:a67:70c4:0:b0:349:d442:f287 with SMTP id
 l187-20020a6770c4000000b00349d442f287mr3307284vsc.2.1654088087083; Wed, 01
 Jun 2022 05:54:47 -0700 (PDT)
MIME-Version: 1.0
References: <CANXPkT6mYusYe8O0dbq3vW+24SsUZ19PqhOL+wLFRnbFXwu0Zg@mail.gmail.com>
In-Reply-To: <CANXPkT6mYusYe8O0dbq3vW+24SsUZ19PqhOL+wLFRnbFXwu0Zg@mail.gmail.com>
From:   =?UTF-8?B?7Jyg7Jqp7IiY?= <yongsuyoo0215@gmail.com>
Date:   Wed, 1 Jun 2022 21:54:36 +0900
Message-ID: <CANXPkT7nOhH+5bD0ycyRBT9FKQBBszCVuWkqp4tFtVRf2+8DFg@mail.gmail.com>
Subject: Fwd: [PATCH] media: dvb_ringbuffer : Fix a bug in dvb_ringbuffer.c
To:     linux-media@vger.kernel.org, mchehab@kernel.org,
        =?UTF-8?B?7Jyg7Jqp7IiY?= <yongsuyoo0215@gmail.com>
Content-Type: multipart/mixed; boundary="000000000000dbb58e05e0626427"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

--000000000000dbb58e05e0626427
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dear Alls

Can you check the Below E-mail ?
Can you share how is the below patch going ?

---------- Forwarded message ---------
=EB=B3=B4=EB=82=B8=EC=82=AC=EB=9E=8C: =EC=9C=A0=EC=9A=A9=EC=88=98 <yongsuyo=
o0215@gmail.com>
Date: 2022=EB=85=84 5=EC=9B=94 22=EC=9D=BC (=EC=9D=BC) =EC=98=A4=ED=9B=84 3=
:36
Subject: [PATCH] media: dvb_ringbuffer : Fix a bug in dvb_ringbuffer.c
To: <mchehab@kernel.org>
Cc: <0215yys@hanmail.net>, <yongsu.yoo@lge.com>, =EC=9C=A0=EC=9A=A9=EC=88=
=98 <yongsuyoo0215@gmail.com>


Dear Mauro Carvalho Chehab
My name is YongSu Yoo

I found an incorrect logic at the function of dvb_ringbuffer_pkt_next in
/linux-next/drviers/media/dvb-core/dvb_ringbuffer.c.
I correct the bug like the attached file (
0001-media-dvb_ringbuffer-Fix-a-bug-in-dvb_ringbuffer.c.patch ).
Please check the attached file.

Thank you

--000000000000dbb58e05e0626427
Content-Type: application/x-patch; 
	name="0001-media-dvb_ringbuffer-Fix-a-bug-in-dvb_ringbuffer.c.patch"
Content-Disposition: attachment; 
	filename="0001-media-dvb_ringbuffer-Fix-a-bug-in-dvb_ringbuffer.c.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_l3gxbga20>
X-Attachment-Id: f_l3gxbga20

RnJvbSAxMDhjNmFjYjJjYzRiYzQzMTRiOTZmNmYyNTRhMDRiMjg3M2EwOTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBZb25nU3UgWW9vIDx5b25nc3V5b28wMjE1QGdtYWlsLmNvbT4K
RGF0ZTogU3VuLCAyMiBNYXkgMjAyMiAwNDo1MzoxMiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIG1l
ZGlhOiBkdmJfcmluZ2J1ZmZlciA6IEZpeCBhIGJ1ZyBpbiBkdmJfcmluZ2J1ZmZlci5jCgpTaWdu
ZWQtb2ZmLWJ5OllvbmdzdSBZb28gPHlvbmdzdXlvbzAyMTVAZ21haWwuY29tPgoKVGhlIGZ1bmN0
aW9uIGR2Yl9yaW5nYnVmZmVyX3BrdF9uZXh0IGluCi9saW51eC1uZXh0L2RydmllcnMvbWVkaWEv
ZHZiLWNvcmUvZHZiX3JpbmdidWZmZXIuYywKd2hpY2ggc2VhcmNoZXMgdGhlIGlkeCBvZiB0aGUg
bmV4dCB2YWxpZCBwYWNrZXQgaW4gdGhlIHJpbmcKYnVmZmVyIG9mIHRoZSBjYS0+c2xvdF9pbmZv
W3Nsb3RdLnJ4X2J1ZmZlciBhdAovbGludXgtbmV4dC9kcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2R2
Yl9jYV9lbjUwMjIxLmMsCmhhcyB0aGUgZm9sbG93aW5nIHByb2JsZW0uCkluIGNhbGN1bGF0aW5n
IHRoZSBhbW91bnRzIG9mIHRoZSBjb25zdW1lZCBhZGRyZXNzIG9mIHRoZSByaW5nCmJ1ZmZlciwg
aWYgdGhlIHJlYWQgYWRkcmVzcyhyYnVmLT5wcmVhZCkgb2YgdGhlIHJpbmcgYnVmZmVyIGlzCnNt
YWxsZXIgdGhhbiB0aGUgaWR4LCB0aGUgYW1vdW50cyBvZiB0aGUgc2VhcmNoZWQgYWRkcmVzcwpz
aG91bGQgYmUgKGlkeCAtIHJidWYtPnByZWFkKSwKd2hlcmVhcyBpZiB0aGUgcmVhZCBhZGRyZXNz
KHJidWYtPnByZWFkKSBvZiB0aGUgcmluZyBidWZmZXIgaXMKbGFyZ2VyIHRoYW4gdGhlIGlkeCwg
dGhlIGFtb3VudHMgb2YgdGhlIGNvbnN1bWVkIGFkZHJlc3Mgc2hvdWxkCmJlIChpZHggLSByYnVm
LT5wcmVhZCArIHJidWctPnNpemUpLiBCdXQgdGhlcmUgZXhpc3RzIGFuCmluY29ycmVjdCBsb2dp
YyB0aGF0IHRoZSByYnVnLXNpemUgd2FzIG5vdCBwcm9wZXJseSBhZGRlZCBvbgooaWR4IC0gcmJ1
Zy0+cHJlYWQpIGluIHRoZSBsYXRlciBjYXNlLiBXaXRoIHRoaXMgY29tbWl0LCB3ZQpmaXhlZCB0
aGlzIGJ1Zy4KLS0tCiBkcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2R2Yl9yaW5nYnVmZmVyLmMgfCA0
ICsrKy0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2R2Yl9yaW5nYnVmZmVyLmMgYi9kcml2
ZXJzL21lZGlhL2R2Yi1jb3JlL2R2Yl9yaW5nYnVmZmVyLmMKaW5kZXggZDFkNDcxYWYwNjM2Li43
ZDQ1NThkZThlODMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbWVkaWEvZHZiLWNvcmUvZHZiX3Jpbmdi
dWZmZXIuYworKysgYi9kcml2ZXJzL21lZGlhL2R2Yi1jb3JlL2R2Yl9yaW5nYnVmZmVyLmMKQEAg
LTMzNSw3ICszMzUsOSBAQCBzc2l6ZV90IGR2Yl9yaW5nYnVmZmVyX3BrdF9uZXh0KHN0cnVjdCBk
dmJfcmluZ2J1ZmZlciAqcmJ1Ziwgc2l6ZV90IGlkeCwgc2l6ZV90KgogCQlpZHggPSAoaWR4ICsg
Y3VycGt0bGVuICsgRFZCX1JJTkdCVUZGRVJfUEtUSERSU0laRSkgJSByYnVmLT5zaXplOwogCX0K
IAotCWNvbnN1bWVkID0gKGlkeCAtIHJidWYtPnByZWFkKSAlIHJidWYtPnNpemU7CisJY29uc3Vt
ZWQgPSAoaWR4IC0gcmJ1Zi0+cHJlYWQpOworCWlmIChjb25zdW1lZCA8IDApCisJCWNvbnN1bWVk
ICs9IHJidWYtPnNpemU7CiAKIAl3aGlsZSgoZHZiX3JpbmdidWZmZXJfYXZhaWwocmJ1ZikgLSBj
b25zdW1lZCkgPiBEVkJfUklOR0JVRkZFUl9QS1RIRFJTSVpFKSB7CiAKLS0gCjIuMTcuMQoK
--000000000000dbb58e05e0626427--
