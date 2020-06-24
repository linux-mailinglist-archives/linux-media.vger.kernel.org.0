Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 062DF206C3E
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 08:14:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388998AbgFXGO0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 02:14:26 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:8768 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387817AbgFXGOZ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 02:14:25 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Wed, 24 Jun 2020 14:14:14
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.65]
Date:   Wed, 24 Jun 2020 14:14:14 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Stanimir Varbanov" <stanimir.varbanov@linaro.org>
Cc:     kjlu@umn.edu, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: venus: vdec: Fix runtime PM imbalance in
 vdec_open
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <5d88210d-db4c-e171-5d4b-5dffe22d4d48@linaro.org>
References: <20200522111357.2613-1-dinghao.liu@zju.edu.cn>
 <5d88210d-db4c-e171-5d4b-5dffe22d4d48@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <516b94f.24c29.172e4f66de8.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgBXwng27_Jekt81AQ--.45803W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgUBBlZdtOzhLwABsc
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbXIS07vEb7Iv0x
        C_JF4lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVWUJVW8JwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVCjxxvEw4WlV2xY6xkIecxEwVAFwVW8AwCS07vEc2IjII80xcxEwVAKI48JMI
        AIbVCF04k20xvE74AGY7Cv6cx26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCF
        s4IE7xkEbVWUJVW8JwCS07vEx2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwV
        AFwI0_JrI_JrWlV2xY6I8E67AF67kF1VAFwI0_Jw0_GFylV2xY6IIF0xvE2Ix0cI8IcVAF
        wI0_Jr0_JF4lV2xY6IIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04
        k26cxKx2IYs7xG6rW3Jr0E3s1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY
        6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73U
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgU3RhbmltaXIsCgo+IAo+IFRoaXMgcGF0Y2ggaXMgbm90IGFwcGxpY2FibGUgYW55bW9yZSBh
ZnRlciBbMV0uCj4gCj4gWzFdIDYzMzQyYWZlYTY1ZSAoIm1lZGlhOiB2ZW51czogdmRlYzogVXNl
IHBtcnVudGltZSBhdXRvc3VzcGVuZCIpCj4gCgpTaW5jZSBwbV9ydW50aW1lX2dldF9zeW5jKCkg
aGFzIGJlZW4gcmVtb3ZlZCBmcm9tIHZkZWNfb3BlbigpLCAKdGhpcyBwYXRjaCBpcyBubyBsb25n
ZXIgbmVlZGVkLgoKUmVnYXJkcywKRGluZ2hhbw==
