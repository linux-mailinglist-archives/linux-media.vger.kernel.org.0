Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72F7720C646
	for <lists+linux-media@lfdr.de>; Sun, 28 Jun 2020 07:38:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726075AbgF1FiS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 28 Jun 2020 01:38:18 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:52054 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725965AbgF1FiS (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 28 Jun 2020 01:38:18 -0400
Received: by ajax-webmail-mail-app3 (Coremail) ; Sun, 28 Jun 2020 13:38:05
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.85.18]
Date:   Sun, 28 Jun 2020 13:38:05 +0800 (GMT+08:00)
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
In-Reply-To: <f49040ee-a5c5-c106-2b51-cd48646306b0@linaro.org>
References: <20200624063024.17059-1-dinghao.liu@zju.edu.cn>
 <812ead80-766b-1dad-1447-ffab5d7d2ee8@linaro.org>
 <35c749cf.28af7.172ee1e4ac3.Coremail.dinghao.liu@zju.edu.cn>
 <f49040ee-a5c5-c106-2b51-cd48646306b0@linaro.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <54284223.2ce40.172f96ec3b3.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgCH_0K9LPhegiVmAQ--.47661W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgoDBlZdtO0x6gAfsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUblvS07vEb7Iv0x
        C_Jr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2IjII80xcxEwVAKI48JMIAIbVCF04k20xvE74AGY7Cv6c
        x26r4fKr1UJr1lV2xY6xCjnVCjjxCrMIAIbVCFx2IqxVCFs4IE7xkEbVWUJVW8JwCS07vE
        x2IqxVAqx4xG67AKxVWUJVWUGwCS07vEx2IqxVCjr7xvwVAFwI0_JrI_JrWlV2xY6I8E67
        AF67kF1VAFwI0_Jw0_GFylV2xY6IIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lV2xY6IIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCS07vEIxAIcVCF04k26cxKx2IYs7xG6rW3Jr0E3s
        1lV2xY6IIF0xvEx4A2jsIE14v26r1j6r4UMIAIbVCI42IY6I8E87Iv6xkF7I0E14v26r1j
        6r4UYxBIdaVFxhVjvjDU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

CgoKPiAKPiBDb3VsZCB5b3UgcmV3b3JkIHRoaXMgYW5kIGFkZCBpdCB0byB0aGUgcGF0Y2ggZGVz
Y3JpcHRpb24uCj4gCgpGaW5lLiBJIHdpbGwgZml4IHRoaXMgaW4gdGhlIG5leHQgdmVyc2lvbiBv
ZiBwYXRjaC4KClJlZ2FyZHMsCkRpbmdoYW8=
