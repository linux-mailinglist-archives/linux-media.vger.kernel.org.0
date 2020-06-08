Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D72421F11BC
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 05:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728938AbgFHDdq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 23:33:46 -0400
Received: from spam.zju.edu.cn ([61.164.42.155]:21694 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728065AbgFHDdq (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Jun 2020 23:33:46 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 8 Jun 2020 11:33:34
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.62.26]
Date:   Mon, 8 Jun 2020 11:33:34 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     kjlu@umn.edu,
        "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: Re: [PATCH] media: vsp1: Fix runtime PM imbalance in
 vsp1_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200608031134.GO22208@pendragon.ideasonboard.com>
References: <20200523115426.19285-1-dinghao.liu@zju.edu.cn>
 <20200608015456.GJ22208@pendragon.ideasonboard.com>
 <20200608015753.GK22208@pendragon.ideasonboard.com>
 <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
 <20200608031134.GO22208@pendragon.ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <769e1fbf.f668c.17291fd9673.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgC3WeSOsd1ewnfVAA--.20728W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAgYFBlZdtOhd1AACsb
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbX0S07vEb7Iv0x
        C_Cr1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wCS07vE84ACjcxK6I8E87Iv67AKxVW0oV
        Cq3wCS07vE84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DMIAIbVAS0I0E0xvYzxvE52x0
        82IY62kv0487MIAIbVAqx4xG64xvF2IEw4CE5I8CrVC2j2WlV2xY6cIj6xIIjxv20xvE14
        v26r1j6r18MIAIbVAv7VC2z280aVAFwI0_Jr0_Gr1lV2xY6cvjeVCFs4IE7xkEbVWUJVW8
        JwCS07vE7I0Y64k_MIAIbVCY02Avz4vE14v_Gr4lV2xY6xkI7II2jI8vz4vEwIxGrwCS07
        vE42xK82IY6x8ErcxFaVAv8VW8uw4UJr1UMIAIbVCF72vE77IF4wCS07vE4I8I3I0E4IkC
        6x0Yz7v_Jr0_Gr1lV2xY6I8I3I0E5I8CrVAFwI0_Jr0_Jr4lV2xY6I8I3I0E7480Y4vE14
        v26r106r1rMIAIbVC2zVAF1VAY17CE14v26r126r1DMIAIbVCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIAIbVCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lV2xY6IIF0xvE42xK8V
        AvwI8IcIk0rVWrJr0_WFyUJwCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
        x4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Cj4gCj4gVGhlIHZzcDFfcHJvYmUoKSBmdW5jdGlvbiBoYXMgYSBzdHJ1Y3QgdnNwMV9kZXZpY2Ug
d2hvc2UgZGV2IGZpZWxkIGlzCj4gcG9wdWxhdGVkIGJ5IHRoZSB0aW1lIGl0IG5lZWRzIHRvIGNh
bGwgcG1fcnVudGltZV9nZXRfc3luYygpIGFuZAo+IHBtX3J1bnRpbWVfZ2V0X3B1dCgpLCBzbyBJ
IHRoaW5rIHlvdSBjYW4gdXNlIHZzcDFfZGV2aWNlX2dldCgpIGFuZAo+IHZzcDFfZGV2aWNlX3B1
dCgpIGFzIGRyb3AtaW4gcmVwbGFjZW1lbnRzIHdpdGhvdXQgY2hhbmdpbmcgdGhlCj4gcGFyYW1l
dGVycyB0byB0aGVzZSB0d28gZnVuY3Rpb25zLgo+IAoKSXQncyBjbGVhciB0byBtZSwgdGhhbmtz
IQoKUmVnYXJkcywKRGluZ2hhbwo=
