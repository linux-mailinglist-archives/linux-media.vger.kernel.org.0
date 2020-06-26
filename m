Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE8820A9EC
	for <lists+linux-media@lfdr.de>; Fri, 26 Jun 2020 02:54:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726576AbgFZAyb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 25 Jun 2020 20:54:31 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:39628 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725834AbgFZAyb (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 25 Jun 2020 20:54:31 -0400
Received: by ajax-webmail-mail-app2 (Coremail) ; Fri, 26 Jun 2020 08:54:22
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.65]
Date:   Fri, 26 Jun 2020 08:54:22 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Stanimir Varbanov" <stanimir.varbanov@linaro.org>
Cc:     kjlu@umn.edu, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] [v2] media: venus: core: Fix runtime PM imbalance
 in venus_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <812ead80-766b-1dad-1447-ffab5d7d2ee8@linaro.org>
References: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
 <812ead80-766b-1dad-1447-ffab5d7d2ee8@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <35c749cf.28af7.172ee1e4ac3.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgBXITQ+R_Ve_Rt9AA--.16565W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgMDBlZdtO0wNAABsT
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGCS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVWDMIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUU==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cj4gSGkgRGluZ2hhbywKPiAKPiBPbiA2LzI0LzIwIDk6MzAgQU0sIERpbmdoYW8gTGl1IHdyb3Rl
Ogo+ID4gcG1fcnVudGltZV9nZXRfc3luYygpIGluY3JlbWVudHMgdGhlIHJ1bnRpbWUgUE0gdXNh
Z2UgY291bnRlciBldmVuCj4gPiB3aGVuIGl0IHJldHVybnMgYW4gZXJyb3IgY29kZS4gVGh1cyBh
IHBhaXJpbmcgZGVjcmVtZW50IGlzIG5lZWRlZCBvbgo+ID4gdGhlIGVycm9yIGhhbmRsaW5nIHBh
dGggdG8ga2VlcCB0aGUgY291bnRlciBiYWxhbmNlZC4gRm9yIG90aGVyIGVycm9yCj4gPiBwYXRo
cyBhZnRlciB0aGlzIGNhbGwsIHRoaW5ncyBhcmUgdGhlIHNhbWUuCj4gPiAKPiA+IFNpZ25lZC1v
ZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1LmNuPgo+ID4gLS0tCj4gPiAK
PiA+IENoYW5nZWxvZzoKPiA+IAo+ID4gdjI6IC0gQWRkIHBtX3J1bnRpbWVfZ2V0X25vcmVzdW1l
KCkgb24gZmFpbHVyZSBvZgo+ID4gICAgICAgcG1fcnVudGltZV9wdXRfc3luYygpIHRvIGJhbGFu
Y2UgUE0gY291bnRlciBpbnN0ZWFkIG9mCj4gPiAgICAgICByZWxlYXNpbmcgZXZlcnl0aGluZyBo
ZXJlLgo+IAo+IFlvdSBhcmUgYWRkaW5nIHBtX3J1bnRpbWVfZ2V0X25vcmVzdW1lIGluIHBtX3J1
bnRpbWVfcHV0X3N5bmMgZXJyb3IgcGF0aAo+IGJ1dCB0aGUgcGF0Y2ggZGVzY3JpcHRpb24gaXMg
cmVmZXJyaW5nIHRvIHBtX3J1bnRpbWVfZ2V0X3N5bmMuIEknbSBjb25mdXNlZC4KPiAKCldoZW4g
cG1fcnVudGltZV9wdXRfc3luYyBmYWlsZWQsIHRoZSBjb250cm9sIGZsb3cgd2lsbCBqdW1wIHRv
IAplcnJfZGV2X3VucmVnaXN0ZXIsIHdoZXJlIGhhcyBhbHJlYWR5IGJlZW4gYSBwbV9ydW50aW1l
X3B1dF9ub2lkbGUuIApJZiB3ZSBkb24ndCBhZGQgYW4gZXh0cmEgcG1fcnVudGltZV9nZXRfbm9y
ZXN1bWUgaGVyZSwgd2Ugd2lsbCAKZGVjcmVhc2UgUE0gdXNhZ2UgY291bnRlciB0d2ljZS4gCgpB
bnl3YXksIHRoaXMgbWF5IHNlZW0gYSBsaXR0bGUgc3RyYW5nZS4gRG8geW91IGhhdmUgYSBiZXR0
ZXIKc3RyYXRlZ3kgdG8gcmVvcmRlciB0aGUgbGFiZWxzPyAKClJlZ2FyZHMsCkRpbmdoYW8KCj4g
PiAtLS0KPiA+ICBkcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vdmVudXMvY29yZS5jIHwgNSAr
KysrLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
PiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vcWNvbS92ZW51cy9j
b3JlLmMgYi9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL3Fjb20vdmVudXMvY29yZS5jCj4gPiBpbmRl
eCAyMDNjNjUzODA0NGYuLmIwYjkzMmJmOGMwMiAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMvbWVk
aWEvcGxhdGZvcm0vcWNvbS92ZW51cy9jb3JlLmMKPiA+ICsrKyBiL2RyaXZlcnMvbWVkaWEvcGxh
dGZvcm0vcWNvbS92ZW51cy9jb3JlLmMKPiA+IEBAIC0yODcsOCArMjg3LDEwIEBAIHN0YXRpYyBp
bnQgdmVudXNfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKPiA+ICAJCWdvdG8g
ZXJyX2NvcmVfZGVpbml0Owo+ID4gIAo+ID4gIAlyZXQgPSBwbV9ydW50aW1lX3B1dF9zeW5jKGRl
dik7Cj4gPiAtCWlmIChyZXQpCj4gPiArCWlmIChyZXQpIHsKPiA+ICsJCXBtX3J1bnRpbWVfZ2V0
X25vcmVzdW1lKGRldik7Cj4gPiAgCQlnb3RvIGVycl9kZXZfdW5yZWdpc3RlcjsKPiA+ICsJfQo+
ID4gIAo+ID4gIAlyZXR1cm4gMDsKPiA+ICAKPiA+IEBAIC0yOTksNiArMzAxLDcgQEAgc3RhdGlj
IGludCB2ZW51c19wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQo+ID4gIGVycl92
ZW51c19zaHV0ZG93bjoKPiA+ICAJdmVudXNfc2h1dGRvd24oY29yZSk7Cj4gPiAgZXJyX3J1bnRp
bWVfZGlzYWJsZToKPiA+ICsJcG1fcnVudGltZV9wdXRfbm9pZGxlKGRldik7Cj4gPiAgCXBtX3J1
bnRpbWVfc2V0X3N1c3BlbmRlZChkZXYpOwo+ID4gIAlwbV9ydW50aW1lX2Rpc2FibGUoZGV2KTsK
PiA+ICAJaGZpX2Rlc3Ryb3koY29yZSk7Cj4gPiAKPiAKPiAtLSAKPiByZWdhcmRzLAo+IFN0YW4K

