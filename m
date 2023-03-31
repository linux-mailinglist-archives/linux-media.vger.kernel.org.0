Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C414E6D2A06
	for <lists+linux-media@lfdr.de>; Fri, 31 Mar 2023 23:35:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232932AbjCaVfH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 31 Mar 2023 17:35:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229998AbjCaVfG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 31 Mar 2023 17:35:06 -0400
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC3B1EFE8
        for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023 14:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net; s=s31663417;
        t=1680298504; i=ps.report@gmx.net;
        bh=nYQwD9PTnIV16rk+6rCYGfdwng+QWXHUl9sOdkX4DZw=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=tnufBGG22rR1LoM8PQLsaWyowt1I3ZdMzPc+gAE6XsnH6o9kzsKd2CXD0myn58Vhg
         2Q5IXsDJ6HfsBcyY7ujCuSh8PTVG9EZIubRMVL0wpKmeZ+ZeZe6ee68MLaBBy4KgtM
         Tr1brm21wz4y9hx8VCsahhyKo9vENwN6zKt6lZcrVJUf5PMZQF3uboFbyzyONYWRcA
         CWFlt8P/7NyEgQmmJ1GtQqJ6JoVevMjsDPcnD9HF5QG+hQwri+0HSQUkRtMpJCQQGl
         WOrZaUgo5GfFfl2PjJCe9LHufkMLMqB6ht+RVN9zyZpXDRpC/CSl+jqNmWicZPFQms
         nCEtDzTd0PVVA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.135]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N9MpS-1qTkSx3Hz2-015JtD for <linux-media@vger.kernel.org>; Fri, 31 Mar 2023
 23:35:03 +0200
From:   Peter Seiderer <ps.report@gmx.net>
To:     linux-media@vger.kernel.org
Subject: [PATCH v4l-utils v1 1/2] v4l2-tracer: wrap open64/mmap64 functions only if linux && __GLIBC__
Date:   Fri, 31 Mar 2023 23:35:02 +0200
Message-Id: <20230331213503.24082-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: base64
X-Provags-ID: V03:K1:K81SeGxUXxoWqJxeWBsr8LidD3xlAkKtWymuZMWgJIK9v42j7Eg
 LNplLmQb4cZ942/eH7tUPNZYo8DD+lSQzuZFlvFr/I69YCs7NqsFdMPm/d0wwLpEgOvr/QV
 pfCidFGBFgrXvLtelt68YRwKOeZec15sshWr0+rfAKWrZae9bSqT957TZOEFN+MsWZobYUR
 SdS1Q66sV8s0RwrPi/1jg==
UI-OutboundReport: notjunk:1;M01:P0:8iTC5RhBV40=;IXTzJlq+rDoWG30UgARvv4BK56+
 odzmHrbzV9wQi1zUyZVZzuVC/GhAxvR2zsUHOBz5PlEmuYOi4fj7l7sk4mOHz6arBeGXNEJ4Q
 cGTCxXVA3OLQTYudqdjo50nBb5klaQPUCUxewMGWVom/WB2kA2XjnGzTbscjIaiKrhm2wRwHH
 ZDf1RW/jhvL9moz0yzkbbzavz4UB/ez+yx3WQi4HPR1aGabws+8bqW2+e6D5rt0dmFGoTFrOC
 tV0FvmNquk8nGjuvt/3L3DJWGEmkK8wza1/ICXPUb7q0lJOF2i9GcR+FaXQovRYYos9lqUdXH
 44Vt/ToKrWpIuE6R26BMZ9tEDyBMLBnDqSrBGrJdjQF+v3Z9uBpZTX1gGzWjNrJT9bNqvQUTL
 8T38IwXNudUrZhxto6UYySY+TusXVOR+VO/f0b/7+Xs5ubE3Uv03tkTrWFWCfeLpNBOsO0aHf
 Tp1qV6KpdS6w8LB7gY4BBrowUWA/z3j7IoTL3ORyTmk+zY1TZwpbvGgPoQzfrOqV5gmGce8qR
 H73kmXIzSMhKIDpLFrfg1BI3AVvEUXI1vPtgij07PxJU9OHpUl6DLGmdRVzHtbkJOFbEkTVbq
 KGZ5zHjrnuwoeqJNeFX4AtiYdxmOxdFPGPYEmRN0Op79YPE31U6w2m3hFyRJoGjsf64FlQRbg
 OLPHid73xnv1HySjDldp1E78vTJfRBjv9YMp6PwxM/fs1uwGXYHVVJqa8Xpi6odWxZkl0lNlQ
 ts5kl0pm+Et1UBPbE0TPma0/GhXmFbfNTrV8NZge1HHNva6841KJubtSzHdkdz/zS5VT3UB+D
 MgYKkhRv7Ulr3sKEfpErxsrJpv9XQ0ciffSqA591CugWx9oQfMzBPwSmBBUuGAA4bAGax8R0A
 fvmgAhKDnmuGrFBlPgUkH4X4/JC530KjThdd4N4EN5IxBsQDZb2bYf4ApkYW7RKWTO59jh6OT
 4I4DNVAk7E0l6Z12vz00Qy9udF4=
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,MIME_BASE64_TEXT,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V3JhcCBvcGVuNjQvbW1hcDY0IGZ1bmN0aW9ucyBvbmx5IGlmIGxpbnV4ICYmIF9fR0xJQkNfXywg
YXMgZG9uZQppbiBsaWIvbGlidjRsMS92NGwxY29tYXB0LmMgYW5kIGxpYi9saWJ2NGwyL3Y0bDJj
b252ZXJ0LmMgc2luY2UKY29tbWl0ICdsaWJ2NGw6IFdyYXAgTEZTNjQgZnVuY3Rpb25zIG9ubHkg
aWYgbGludXggJiYgX19HTElCQ19fJwooNDAzYTRlMjY5N2ExZmY5NmZlMmZhMTY1ODkwMzk1OTVm
MjFjYWRmMCksIHNob3VsZCBmaXggbXVzbCBsaWJjCmNvbXBpbGUuCgpTaWduZWQtb2ZmLWJ5OiBQ
ZXRlciBTZWlkZXJlciA8cHMucmVwb3J0QGdteC5uZXQ+Ci0tLQogdXRpbHMvdjRsMi10cmFjZXIv
bGlidjRsMnRyYWNlci5jcHAgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS91dGlscy92NGwyLXRyYWNlci9saWJ2NGwydHJhY2VyLmNwcCBiL3V0
aWxzL3Y0bDItdHJhY2VyL2xpYnY0bDJ0cmFjZXIuY3BwCmluZGV4IGE5ZjAzOWM3Li42OGY2MzA0
YSAxMDA2NDQKLS0tIGEvdXRpbHMvdjRsMi10cmFjZXIvbGlidjRsMnRyYWNlci5jcHAKKysrIGIv
dXRpbHMvdjRsMi10cmFjZXIvbGlidjRsMnRyYWNlci5jcHAKQEAgLTg5LDYgKzg5LDcgQEAgaW50
IG9wZW4oY29uc3QgY2hhciAqcGF0aCwgaW50IG9mbGFnLCAuLi4pCiAJcmV0dXJuIGZkOwogfQog
CisjaWYgZGVmaW5lZChsaW51eCkgJiYgZGVmaW5lZChfX0dMSUJDX18pCiBpbnQgb3BlbjY0KGNv
bnN0IGNoYXIgKnBhdGgsIGludCBvZmxhZywgLi4uKQogewogCWVycm5vID0gMDsKQEAgLTEyNCw2
ICsxMjUsNyBAQCBpbnQgb3BlbjY0KGNvbnN0IGNoYXIgKnBhdGgsIGludCBvZmxhZywgLi4uKQog
CiAJcmV0dXJuIGZkOwogfQorI2VuZGlmCiAKIGludCBjbG9zZShpbnQgZmQpCiB7CkBAIC0xNzcs
NiArMTc5LDcgQEAgdm9pZCAqbW1hcCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBpbnQgcHJvdCwg
aW50IGZsYWdzLCBpbnQgZmlsZGVzLCBvZmZfdCBvZmYpCiAJcmV0dXJuIGJ1Zl9hZGRyZXNzX3Bv
aW50ZXI7CiB9CiAKKyNpZiBkZWZpbmVkKGxpbnV4KSAmJiBkZWZpbmVkKF9fR0xJQkNfXykKIHZv
aWQgKm1tYXA2NCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBpbnQgcHJvdCwgaW50IGZsYWdzLCBp
bnQgZmlsZGVzLCBvZmZfdCBvZmYpCiB7CiAJZXJybm8gPSAwOwpAQCAtMTkxLDYgKzE5NCw3IEBA
IHZvaWQgKm1tYXA2NCh2b2lkICphZGRyLCBzaXplX3QgbGVuLCBpbnQgcHJvdCwgaW50IGZsYWdz
LCBpbnQgZmlsZGVzLCBvZmZfdCBvZmYpCiAKIAlyZXR1cm4gYnVmX2FkZHJlc3NfcG9pbnRlcjsK
IH0KKyNlbmRpZgogCiBpbnQgbXVubWFwKHZvaWQgKnN0YXJ0LCBzaXplX3QgbGVuZ3RoKQogewot
LSAKMi40MC4wCgo=
