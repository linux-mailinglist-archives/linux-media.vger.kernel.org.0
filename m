Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B5D41DCC4C
	for <lists+linux-media@lfdr.de>; Thu, 21 May 2020 13:43:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729073AbgEULnY (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 21 May 2020 07:43:24 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:10160 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729027AbgEULnY (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Thu, 21 May 2020 07:43:24 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Thu, 21 May 2020 19:42:56
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.77.158]
Date:   Thu, 21 May 2020 19:42:56 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Dan Carpenter" <dan.carpenter@oracle.com>
Cc:     kjlu@umn.edu, devel@driverdev.osuosl.org,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        linux-kernel@vger.kernel.org,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        "Thierry Reding" <thierry.reding@gmail.com>,
        linux-tegra@vger.kernel.org, "Dmitry Osipenko" <digetx@gmail.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org
Subject: Re: Re: [PATCH] [v2] media: staging: tegra-vde: fix runtime pm
 imbalance on error
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200521112131.GG30374@kadam>
References: <20200521062746.6656-1-dinghao.liu@zju.edu.cn>
 <20200521112131.GG30374@kadam>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <4b400526.bbc83.172370b23a0.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgCnjwpAacZerVjtAQ--.39871W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0HBlZdtOPdcwAAs8
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbK0S07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8Jr0_Cr1UMIAIbVA2z4x0Y4vEx4A2jsIE14v26r
        xl6s0DMIAIbVA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1lV2xY62AIxVAIcxkEcVAq
        07x20xvEncxIr21lV2xY6c02F40EFcxC0VAKzVAqx4xG6I80ewCS07vEYx0E2Ix0cI8IcV
        AFwI0_Jr0_Jr4lV2xY6cIj6I8E87Iv67AKxVW8JVWxJwCS07vEOx8S6xCaFVCjc4AY6r1j
        6r4UMIAIbVACI402YVCY1x02628vn2kIc2xKxwCS07vE7I0Y64k_MIAIbVCY02Avz4vE14
        v_Gw4lV2xY6xkI7II2jI8vz4vEwIxGrwCS07vE42xK82IY6x8ErcxFaVAv8VW8uw4UJr1U
        MIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lV2xY6I8I3I0E5I8CrV
        AFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14v26r106r1rMIAIbVC2zVAF1VAY17CE14v2
        6r1q6r43MIAIbVCI42IY6xIIjxv20xvE14v26r1j6r1xMIAIbVCI42IY6xIIjxv20xvEc7
        CjxVAFwI0_Gr0_Cr1lV2xY6IIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCS07vEIxAI
        cVC2z280aVAFwI0_Gr0_Cr1lV2xY6IIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCT
        nIWIevJa73U
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

V2UgbmVlZCB0byBtYWtlIHN1cmUgaWYgcG1fcnVudGltZV9nZXRfc3luYygpIGlzIGRlc2lnbmVk
IHdpdGgKc3VjaCBiZWhhdmlvciBiZWZvcmUgbW9kaWZ5aW5nIGl0LiAgCgpJIHJlY2VpdmVkIGEg
cmVzcG9uc2UgZnJvbSBSYWZhZWwgd2hlbiBJIGNvbW1pdGVkIGEgc2ltaWxhciBwYXRjaDoKaHR0
cHM6Ly9sa21sLm9yZy9sa21sLzIwMjAvNS8yMC8xMTAwCkl0IHNlZW1zIHRoYXQgdGhpcyBiZWhh
dmlvciBpcyBpbnRlbnRpb25hbCBhbmQgbmVlZHMgdG8gYmUga2VwdC4KClJlZ2FyZHMsCkRpbmdo
YW8KCiZxdW90O0RhbiBDYXJwZW50ZXImcXVvdDsgJmx0O2Rhbi5jYXJwZW50ZXJAb3JhY2xlLmNv
bSZndDvlhpnpgZPvvJoKPiBPbiBUaHUsIE1heSAyMSwgMjAyMCBhdCAwMjoyNzo0NVBNICswODAw
LCBEaW5naGFvIExpdSB3cm90ZToNCj4gPiBwbV9ydW50aW1lX2dldF9zeW5jKCkgaW5jcmVtZW50
cyB0aGUgcnVudGltZSBQTSB1c2FnZSBjb3VudGVyIGV2ZW4NCj4gPiB0aGUgY2FsbCByZXR1cm5z
IGFuIGVycm9yIGNvZGUuIFRodXMgYSBwYWlyaW5nIGRlY3JlbWVudCBpcyBuZWVkZWQNCj4gPiBv
biB0aGUgZXJyb3IgaGFuZGxpbmcgcGF0aCB0byBrZWVwIHRoZSBjb3VudGVyIGJhbGFuY2VkLg0K
PiA+IA0KPiA+IFNpZ25lZC1vZmYtYnk6IERpbmdoYW8gTGl1IDxkaW5naGFvLmxpdUB6anUuZWR1
LmNuPg0KPiANCj4gTGV0J3Mgc3RvcCB3b3JraW5nIGFyb3VuZCB0aGUgYnVnIGluIHBtX3J1bnRp
bWVfZ2V0X3N5bmMoKSBhbmQgd3JpdGUNCj4gYSByZXBsYWNlbWVudCBmb3IgaXQgaW5zdGVhZC4N
Cj4gDQo+IHJlZ2FyZHMsDQo+IGRhbiBjYXJwZW50ZXINCg==
