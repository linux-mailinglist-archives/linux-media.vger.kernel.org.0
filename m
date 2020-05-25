Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69A7E1E0EB7
	for <lists+linux-media@lfdr.de>; Mon, 25 May 2020 14:53:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390585AbgEYMxB (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 25 May 2020 08:53:01 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:11326 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2390567AbgEYMxB (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 25 May 2020 08:53:01 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 25 May 2020 20:52:49
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.77.158]
Date:   Mon, 25 May 2020 20:52:49 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Philipp Zabel" <pza@pengutronix.de>
Cc:     kjlu@umn.edu, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: coda: Fix runtime PM imbalance in coda_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200525123838.GA12983@pengutronix.de>
References: <20200523100332.32626-1-dinghao.liu@zju.edu.cn>
 <20200525123838.GA12983@pengutronix.de>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <1c556c11.c8944.1724be4906f.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgDn7wehv8teYMsHAA--.1843W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgsLBlZdtOTA+QABsn
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXIS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r4j6F4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6ryUMIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUAVWUtwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_Wr1j6rW3Jr1lV2xY6IIF0xvEx4A2jsIE14v26r4j6F4UMIAIbVCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBIaSBEaW5naGFvLAo+IAo+IHRoYW5rIHlvdSBmb3IgdGhlIHBhdGNoISBUaGUgZmlyc3QgcGFy
dCBpcyBmaW5lLCBidXQgSSB0aGluayB0aGUgc2Vjb25kCj4gcGFydCBpcyBub3QgbmVjZXNzYXJ5
LCBzZWUgYmVsb3c6Cj4gCj4gT24gU2F0LCBNYXkgMjMsIDIwMjAgYXQgMDY6MDM6MzJQTSArMDgw
MCwgRGluZ2hhbyBMaXUgd3JvdGU6Cj4gPiBXaGVuIGNvZGFfZmlybXdhcmVfcmVxdWVzdCgpIHJl
dHVybnMgYW4gZXJyb3IgY29kZSwKPiA+IGEgcGFpcmluZyBydW50aW1lIFBNIHVzYWdlIGNvdW50
ZXIgZGVjcmVtZW50IGlzIG5lZWRlZAo+ID4gdG8ga2VlcCB0aGUgY291bnRlciBiYWxhbmNlZC4K
PiA+IAo+ID4gQWxzbywgdGhlIGNhbGxlciBleHBlY3RzIGNvZGFfcHJvYmUoKSB0byBpbmNyZWFz
ZSBQTQo+ID4gdXNhZ2UgY291bnRlciwgdGhlcmUgc2hvdWxkIGJlIGEgcmVmY291bnQgZGVjcmVt
ZW50Cj4gPiBpbiBjb2RhX3JlbW92ZSgpIHRvIGtlZXAgdGhlIGNvdW50ZXIgYmFsYW5jZWQuCj4g
Cj4gY29kYV9wcm9iZSgpIGluY3JlbWVudHMgdGhlIHVzYWdlIGNvdW50ZXIgb25seSB1bnRpbCBj
b2RhX2Z3X2NhbGxiYWNrKCkKPiBkZWNyZW1lbnRzIGl0IGFnYWluLiBXaGVyZSBpcyB0aGUgaW1i
YWxhbmNlPwo+IAoKWW91IGFyZSByaWdodCwgSSBtaXNzZWQgY29kYV9maXJtd2FyZV9yZXF1ZXN0
KCkgYmVmb3JlIGFuZCAKdGhhbmsgeW91IGZvciB5b3VyIGNvcnJlY3Rpb24hIEkgd2lsbCBmaXgg
dGhpcyBpbiB0aGUgbmV4dAplZGl0aW9uIG9mIHBhdGNoLgoKUmVnYXJkcywKRGluZ2hhbwoKPiA+
IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1LmNuPgo+ID4g
LS0tCj4gPiAgZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEtY29tbW9uLmMgfCAzICsr
Kwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9jb2RhLWNvbW1vbi5jIGIvZHJpdmVycy9t
ZWRpYS9wbGF0Zm9ybS9jb2RhL2NvZGEtY29tbW9uLmMKPiA+IGluZGV4IGQwZDA5M2RkOGY3Yy4u
NTUwZTlhMTI2NmRhIDEwMDY0NAo+ID4gLS0tIGEvZHJpdmVycy9tZWRpYS9wbGF0Zm9ybS9jb2Rh
L2NvZGEtY29tbW9uLmMKPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vY29kYS9jb2Rh
LWNvbW1vbi5jCj4gPiBAQCAtMzExOSw2ICszMTE5LDggQEAgc3RhdGljIGludCBjb2RhX3Byb2Jl
KHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gPiAgCXJldHVybiAwOwo+ID4gIAo+ID4g
IGVycl9hbGxvY193b3JrcXVldWU6Cj4gPiArCXBtX3J1bnRpbWVfZGlzYWJsZSgmcGRldi0+ZGV2
KTsKPiA+ICsJcG1fcnVudGltZV9wdXRfbm9pZGxlKCZwZGV2LT5kZXYpOwo+IAo+IFRoZXNlIHNl
ZW0gcmlnaHQsIHRoZXkgYmFsYW5jZSBvdXQgdGhlIHBtX3J1bnRpbWVfZW5hYmxlKCkKPiBhbmQg
cG1fcnVudGltZV9nZXRfbm9yZXN1bWUoKSByaWdodCBiZWZvcmUgdGhlIGVycm9yLgo+IAo+ID4g
IAlkZXN0cm95X3dvcmtxdWV1ZShkZXYtPndvcmtxdWV1ZSk7Cj4gPiAgZXJyX3Y0bDJfcmVnaXN0
ZXI6Cj4gPiAgCXY0bDJfZGV2aWNlX3VucmVnaXN0ZXIoJmRldi0+djRsMl9kZXYpOwo+ID4gQEAg
LTMxMzYsNiArMzEzOCw3IEBAIHN0YXRpYyBpbnQgY29kYV9yZW1vdmUoc3RydWN0IHBsYXRmb3Jt
X2RldmljZSAqcGRldikKPiA+ICAJfQo+ID4gIAlpZiAoZGV2LT5tMm1fZGV2KQo+ID4gIAkJdjRs
Ml9tMm1fcmVsZWFzZShkZXYtPm0ybV9kZXYpOwo+ID4gKwlwbV9ydW50aW1lX3B1dF9ub2lkbGUo
JnBkZXYtPmRldik7Cj4gCj4gSSB0aGluayB0aGlzIGlzIGluY29ycmVjdC4gVGhlcmUgaXMgb25l
IHBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKCkgaW4KPiBjb2RhX3Byb2JlKCksIGFuZCBvbmUgcG1f
cnVudGltZV9wdXRfc3luYygpIGluIGNvZGFfZndfY2FsbGJhY2soKS4KPiBCeSB0aGUgdGltZSBj
b2RhX3JlbW92ZSgpIGlzIGNhbGxlZCwgYmFsYW5jZSBpcyBhbHJlYWR5IHJlc3RvcmVkLgo+IAo+
IHJlZ2FyZHMKPiBQaGlsaXBwCg==
