Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2717E1E088C
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 10:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731270AbgEYIOc (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 04:14:32 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:46348 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1731228AbgEYIOc (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 04:14:32 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 25 May 2020 16:14:17
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.77.158]
Date:   Mon, 25 May 2020 16:14:17 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Sakari Ailus" <sakari.ailus@linux.intel.com>
Cc:     kjlu@umn.edu, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: smiapp: Fix runtime PM imbalance on error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200525080902.GC7618@paasikivi.fi.intel.com>
References: <20200522090313.10634-1-dinghao.liu@zju.edu.cn>
 <20200525080902.GC7618@paasikivi.fi.intel.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <142e32cb.c76d2.1724ae58dd9.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgDn7wdZfstemTQEAA--.1084W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgEJBlZdtORShQAvsv
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXIS07vEb7Iv0x
        C_Ar1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r43MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUAVWUtwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_Wr1j6rW3Jr1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBIaSBEaW5naGFvLAo+IAo+IFRoYW5rcyBmb3IgdGhlIHBhdGNoLgo+IAo+IE9uIEZyaSwgTWF5
IDIyLCAyMDIwIGF0IDA1OjAzOjEzUE0gKzA4MDAsIERpbmdoYW8gTGl1IHdyb3RlOgo+ID4gV2hl
biB2NGwyX2FzeW5jX3JlZ2lzdGVyX3N1YmRldl9zZW5zb3JfY29tbW9uKCkgcmV0dXJucwo+ID4g
YW4gZXJyb3IgY29kZSwgYSBwYWlyaW5nIHJ1bnRpbWUgUE0gdXNhZ2UgY291bnRlcgo+ID4gZGVj
cmVtZW50IGlzIG5lZWRlZCB0byBrZWVwIHRoZSBjb3VudGVyIGJhbGFuY2VkLgo+ID4gCj4gPiBT
aWduZWQtb2ZmLWJ5OiBEaW5naGFvIExpdSA8ZGluZ2hhby5saXVAemp1LmVkdS5jbj4KPiA+IC0t
LQo+ID4gIGRyaXZlcnMvbWVkaWEvaTJjL3NtaWFwcC9zbWlhcHAtY29yZS5jIHwgMSArCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL21lZGlhL2kyYy9zbWlhcHAvc21pYXBwLWNvcmUuYyBiL2RyaXZlcnMvbWVkaWEvaTJjL3Nt
aWFwcC9zbWlhcHAtY29yZS5jCj4gPiBpbmRleCA1ZTRmNmEyZWY3OGUuLjQzYmE2M2M0OGE4NyAx
MDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWVkaWEvaTJjL3NtaWFwcC9zbWlhcHAtY29yZS5jCj4g
PiArKysgYi9kcml2ZXJzL21lZGlhL2kyYy9zbWlhcHAvc21pYXBwLWNvcmUuYwo+ID4gQEAgLTMx
MDMsNiArMzEwMyw3IEBAIHN0YXRpYyBpbnQgc21pYXBwX3Byb2JlKHN0cnVjdCBpMmNfY2xpZW50
ICpjbGllbnQpCj4gPiAgCXJldHVybiAwOwo+ID4gIAo+ID4gIG91dF9kaXNhYmxlX3J1bnRpbWVf
cG06Cj4gPiArCXBtX3J1bnRpbWVfcHV0X2F1dG9zdXNwZW5kKCZjbGllbnQtPmRldik7Cj4gCj4g
Q2FuIHlvdSB1c2UgcG1fcnVudGltZV9wdXRfbm9pZGxlKCksIGFzIHRoZSBkZXZpY2UgbXVzbid0
IGJlIHBvd2VyZWQgb2ZmCj4gaGVyZSB5ZXQ/Cj4gCj4gPiAgCXBtX3J1bnRpbWVfZGlzYWJsZSgm
Y2xpZW50LT5kZXYpOwo+ID4gIAo+ID4gIG91dF9tZWRpYV9lbnRpdHlfY2xlYW51cDoKPiAKPiAt
LSAKPiBSZWdhcmRzLAo+IAo+IFNha2FyaSBBaWx1cwoKT0suIEkgd2lsbCBmaXggdGhpcyBpbiB0
aGUgbmV4dCB2ZXJzaW9uIG9mIHBhdGNoLgoKUmVnYXJkcywKRGluZ2hhbwo=
