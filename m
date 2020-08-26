Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 161B12529CB
	for <lists+linux-media@lfdr.de>; Wed, 26 Aug 2020 11:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727991AbgHZJOo (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 26 Aug 2020 05:14:44 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:35760 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727811AbgHZJOo (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 26 Aug 2020 05:14:44 -0400
Received: by ajax-webmail-mail-app2 (Coremail) ; Wed, 26 Aug 2020 17:14:35
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.184]
Date:   Wed, 26 Aug 2020 17:14:35 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Hans Verkuil" <hverkuil-cisco@xs4all.nl>
Cc:     kjlu@umn.edu, "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        "Fabio Estevam" <fabio.estevam@nxp.com>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: mx2_emmaprp: Fix memleak in emmaprp_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.12 build 20200616(0f5d8152)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <72bb447e-f888-6182-7328-316551b50a24@xs4all.nl>
References: <20200825093934.10585-1-dinghao.liu@zju.edu.cn>
 <72bb447e-f888-6182-7328-316551b50a24@xs4all.nl>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <5db38faf.8f4c.1742a0c2f43.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: by_KCgBnEJ77J0Zf6JAzAg--.52837W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0EBlZdtPrBDAACsH
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXvS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVW8uwCS07vEc2IjII80xcxEwVAKI48JMI
        AIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_JF0_Jw1lV2xY6IIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04
        k26cxKx2IYs7xG6rWUJVWrZr1UMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAI
        cVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUU==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiBPbiAyNS8wOC8yMDIwIDExOjM5LCBEaW5naGFvIExpdSB3cm90ZToKPiA+IFdoZW4gcGxhdGZv
cm1fZ2V0X2lycSgpIGZhaWxzLCB3ZSBzaG91bGQgcmVsZWFzZQo+ID4gdmZkIGFuZCB1bnJlZ2lz
dGVyIHBjZGV2LT52NGwyX2RldiBqdXN0IGxpa2UgdGhlCj4gPiBzdWJzZXF1ZW50IGVycm9yIHBh
dGhzLgo+ID4gCj4gPiBGaXhlczogZDRlMTkyY2M0NDkxNCAoIm1lZGlhOiBteDJfZW1tYXBycDog
Q2hlY2sgZm9yIHBsYXRmb3JtX2dldF9pcnEoKSBlcnJvciIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBE
aW5naGFvIExpdSA8ZGluZ2hhby5saXVAemp1LmVkdS5jbj4KPiA+IC0tLQo+ID4gIGRyaXZlcnMv
bWVkaWEvcGxhdGZvcm0vbXgyX2VtbWFwcnAuYyB8IDIgKy0KPiA+ICAxIGZpbGUgY2hhbmdlZCwg
MSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvbWVkaWEvcGxhdGZvcm0vbXgyX2VtbWFwcnAuYyBiL2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0v
bXgyX2VtbWFwcnAuYwo+ID4gaW5kZXggZGY3OGRmNTlkYTQ1Li4yZmQzMWVkODYwMDUgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL21lZGlhL3BsYXRmb3JtL214Ml9lbW1hcHJwLmMKPiA+ICsrKyBi
L2RyaXZlcnMvbWVkaWEvcGxhdGZvcm0vbXgyX2VtbWFwcnAuYwo+ID4gQEAgLTg1Myw3ICs4NTMs
NyBAQCBzdGF0aWMgaW50IGVtbWFwcnBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRl
dikKPiA+ICAKPiA+ICAJaXJxID0gcGxhdGZvcm1fZ2V0X2lycShwZGV2LCAwKTsKPiA+ICAJaWYg
KGlycSA8IDApCj4gPiAtCQlyZXR1cm4gaXJxOwo+ID4gKwkJZ290byByZWxfdmRldjsKPiAKPiBZ
b3UgbmVlZCB0byBhZGQgJ3JldCA9IGlycTsnIGhlcmUsIG90aGVyd2lzZSB0aGUgcGxhdGZvcm1f
Z2V0X2lycSBlcnJvciBjb2RlCj4gaXMgbm90IGNvcnJlY3RseSBwcm9wYWdhdGVkLgo+IAoKVGhh
bmtzIGZvciBwb2ludGluZyBvdXQgdGhhdCEgSSdsbCBmaXggdGhpcyBhbmQgcmVzZW5kIHRoZSBw
YXRjaCBzb29uLgoKUmVnYXJkcywKRGluZ2hhbwo=
