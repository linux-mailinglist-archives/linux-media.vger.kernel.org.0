Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 035D41B0075
	for <lists+linux-media@lfdr.de>; Mon, 20 Apr 2020 06:10:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgDTEJ6 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Apr 2020 00:09:58 -0400
Received: from smtp37.cstnet.cn ([159.226.251.37]:40264 "EHLO cstnet.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725815AbgDTEJ5 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Apr 2020 00:09:57 -0400
X-Greylist: delayed 367 seconds by postgrey-1.27 at vger.kernel.org; Mon, 20 Apr 2020 00:09:57 EDT
Received: by ajax-webmail-APP-12 (Coremail) ; Mon, 20 Apr 2020 12:03:40
 +0800 (GMT+08:00)
X-Originating-IP: [36.157.253.18]
Date:   Mon, 20 Apr 2020 12:03:40 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   =?UTF-8?B?5piT5p6X?= <yilin@iie.ac.cn>
To:     narmstrong@baylibre.com
Cc:     linux-media@vger.kernel.org
Subject: drivers: media: platform/meson:  does there exist a refcount error
 in function  meson_ao_cec_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190723(4416cd1d)
 Copyright (c) 2002-2020 www.mailtech.cn cnic.cn-demo
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <6b9a925c.28b10.17195c18621.Coremail.yilin@iie.ac.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: tgCowACn1nQcH51e1zkDAA--.36157W
X-CM-SenderInfo: p1lox0o6llvhldfou0/1tbiCwIMAFz4jOB4qAABsc
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWxJw
        CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
        daVFxhVjvjDU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGnvvIxhbGw6CndoZW4gcmV2aWV3aW5nIGNvZGUgb2YgZnVuY3Rpb24gbWVzb25fYW9fY2VjX3By
b2JlOgpJbiBMaW51eCBrZXJuZWwgdmVyc2lvbiBiZWZvcmUgdjUuNCwgZnVuY3Rpb24gbWVzb25f
YW9fY2VjX3Byb2JlIGhvbGQgYSBub3RpZnkgIHJlZmVyZW5jZSBieSBjZWNfbm90aWZpZXJfZ2V0
LCB3aGVuIGVyciBoYXBwZW5zLCBpdCB3aWxsIHJlbGVhc2Ugbm90aWZ5IAp0d2ljZSBieSBjZWNf
bm90aWZpZXJfcHV0LCBkb2VzIGhlcmUgZXhpc3QgYSByZWR1bmRhbnQgcHV0IGluIGVycm9yIGhh
bmRsaW5nIG9mIGNlY19yZWdpc3Rlcl9hZGFwdGVyIHJldHVybiB2YWx1ZT8KICAgIHN0YXRpYyBp
bnQgbWVzb25fYW9fY2VjX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCnsKICAg
ICAgICBhb19jZWMtJmd0O25vdGlmeSA9IGNlY19ub3RpZmllcl9nZXQoaGRtaV9kZXYpOwoJaWYg
KCFhb19jZWMtJmd0O25vdGlmeSkKCQlyZXR1cm4gLUVOT01FTTsKCWlmIChyZXQpIHsKCQlkZXZf
ZXJyKCZhbXA7cGRldi0mZ3Q7ZGV2LCAiY29yZSBjbG9jayBzZXQgcmF0ZSBmYWlsZWRcbiIpOwoJ
CWdvdG8gb3V0X3Byb2JlX2NsazsKCX0KCglkZXZpY2VfcmVzZXRfb3B0aW9uYWwoJmFtcDtwZGV2
LSZndDtkZXYpOwoKCWFvX2NlYy0mZ3Q7cGRldiA9IHBkZXY7CglwbGF0Zm9ybV9zZXRfZHJ2ZGF0
YShwZGV2LCBhb19jZWMpOwoKCXJldCA9IGNlY19yZWdpc3Rlcl9hZGFwdGVyKGFvX2NlYy0mZ3Q7
YWRhcCwgJmFtcDtwZGV2LSZndDtkZXYpOwoJaWYgKHJldCAmbHQ7IDApIHsKCQljZWNfbm90aWZp
ZXJfcHV0KGFvX2NlYy0mZ3Q7bm90aWZ5KTsgLy8gYSByZWR1bmRhbnQgcHV0IGhlcmUgPwoJCWdv
dG8gb3V0X3Byb2JlX2NsazsKCX0KCS4uLgpvdXRfcHJvYmVfY2xrOgoJY2xrX2Rpc2FibGVfdW5w
cmVwYXJlKGFvX2NlYy0mZ3Q7Y29yZSk7CgpvdXRfcHJvYmVfYWRhcHRlcjoKCWNlY19kZWxldGVf
YWRhcHRlcihhb19jZWMtJmd0O2FkYXApOwoKb3V0X3Byb2JlX25vdGlmeToKCWNlY19ub3RpZmll
cl9wdXQoYW9fY2VjLSZndDtub3RpZnkpOwoKCWRldl9lcnIoJmFtcDtwZGV2LSZndDtkZXYsICJD
RUMgY29udHJvbGxlciByZWdpc3RyYXRpb24gZmFpbGVkXG4iKTsKCglyZXR1cm4gcmV0Owp9
