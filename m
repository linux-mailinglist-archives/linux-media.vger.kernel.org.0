Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6740B206C47
	for <lists+linux-media@lfdr.de>; Wed, 24 Jun 2020 08:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389059AbgFXGSe (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 24 Jun 2020 02:18:34 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:9278 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2388815AbgFXGSe (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 24 Jun 2020 02:18:34 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Wed, 24 Jun 2020 14:18:21
 +0800 (GMT+08:00)
X-Originating-IP: [210.32.144.65]
Date:   Wed, 24 Jun 2020 14:18:21 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Stanimir Varbanov" <stanimir.varbanov@linaro.org>
Cc:     kjlu@umn.edu, "Andy Gross" <agross@kernel.org>,
        "Bjorn Andersson" <bjorn.andersson@linaro.org>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: venus: core: Fix runtime PM imbalance in
 venus_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <42a2a6cc-d873-1ec6-daaa-a4d5aebe619f@linaro.org>
References: <20200524052933.10529-1-dinghao.liu@zju.edu.cn>
 <42a2a6cc-d873-1ec6-daaa-a4d5aebe619f@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <28ec484e.24c89.172e4fa332d.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgDX3uIt8PJeE+01AQ--.21839W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAggBBlZdtOzhhgAAs5
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGCS07vEb7Iv0x
        C_JF4lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUGVWUXwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r47MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUtVW8ZwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_Zr0_Wr1UMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAIcVC2
        z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUU==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

PiAKPiBDb3VsZCB5b3UganVzdCByZW9yZGVyIGVycm9yIGxhYmVscyBiZWxvdyBpbnN0ZWFkIG9m
IHJlbGVhc2luZwo+IGV2ZXJ5dGhpbmcgaGVyZT8KClRoYW5rIHlvdSBmb3IgeW91ciBhZHZpY2Uh
IEknbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbiBvZiBwYXRjaC4KClJlZ2FyZHMsCkRp
bmdoYW8KCg==
