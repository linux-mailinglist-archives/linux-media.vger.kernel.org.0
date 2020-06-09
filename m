Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B7CE1F3204
	for <lists+linux-media@lfdr.de>; Tue,  9 Jun 2020 03:31:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726967AbgFIBaL (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 8 Jun 2020 21:30:11 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:25652 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726848AbgFIBaK (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Mon, 8 Jun 2020 21:30:10 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Tue, 9 Jun 2020 09:30:01
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.62.26]
Date:   Tue, 9 Jun 2020 09:30:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Hans Verkuil" <hverkuil@xs4all.nl>
Cc:     kjlu@umn.edu,
        "Jean-Christophe Trotin" <jean-christophe.trotin@st.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: platform: sti: hva: Fix runtime PM imbalance
 on error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <6d640a38-fc51-6a20-371c-336b246669a3@xs4all.nl>
References: <20200521100503.13454-1-dinghao.liu@zju.edu.cn>
 <6d640a38-fc51-6a20-371c-336b246669a3@xs4all.nl>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <2bf52890.fac17.17296b2d470.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgC3WeQZ5t5e7HbmAA--.22782W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg4FBlZdtOiPIgAFsw
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGvS07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6w4lV2xY6xkI7II2jI8vz4vEwIxGrwCS07
        vE42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC
        6x0Yz7v_Jr0_Gr1lV2xY6I8I3I0E5I8CrVAFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14
        v26r106r1rMIAIbVC2zVAF1VAY17CE14v26r126r1DMIAIbVCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIAIbVCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lV2xY6IIF0xvE42xK8V
        AvwI8IcIk0rVWrZr1j6s0DMIAIbVCI42IY6I8E87Iv67AKxVWUJVW8JwCS07vEIxAIcVC2
        z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73U
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgSGFucywKPiBlcnJfcG06Cj4gICAgICAgICBwbV9ydW50aW1lX3B1dChkZXYpOwo+IAo+IFNo
b3VsZG4ndCB0aGF0IGJlIHBtX3J1bnRpbWVfcHV0X3N5bmMoKT8KPiAKPiBJJ20gbm90IHBtIGV4
cGVydCwgYnV0IGl0IGRvZXMgbG9vayBvZGQuCj4gCgpJIGNoZWNrZWQgdGhlIGltcGxlbWVudGF0
aW9uIG9mIHRoZXNlIHR3byBBUElzIGJlZm9yZQphbmQgZm91bmQgdGhleSB3ZXJlIGV4YWN0bHkg
dGhlIHNhbWUuIFNvIEkgdGhpbmsgaXQncwpmaW5lIHRvIGtlZXAgdXNpbmcgcG1fcnVudGltZV9w
dXQoKS4KClJlZ2FyZHMsCkRpbmdoYW8K
