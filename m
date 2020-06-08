Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCCA1F119D
	for <lists+linux-media@lfdr.de>; Mon,  8 Jun 2020 05:04:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728677AbgFHDDk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 7 Jun 2020 23:03:40 -0400
Received: from mail.zju.edu.cn ([61.164.42.155]:17220 "EHLO zju.edu.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728065AbgFHDDk (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Sun, 7 Jun 2020 23:03:40 -0400
Received: by ajax-webmail-mail-app4 (Coremail) ; Mon, 8 Jun 2020 11:03:26
 +0800 (GMT+08:00)
X-Originating-IP: [222.205.62.26]
Date:   Mon, 8 Jun 2020 11:03:26 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From:   dinghao.liu@zju.edu.cn
To:     "Laurent Pinchart" <laurent.pinchart@ideasonboard.com>
Cc:     kjlu@umn.edu,
        "Kieran Bingham" <kieran.bingham+renesas@ideasonboard.com>,
        "Mauro Carvalho Chehab" <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH] media: vsp1: Fix runtime PM imbalance in vsp1_probe
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.10 build 20190906(84e8bf8f)
 Copyright (c) 2002-2020 www.mailtech.cn zju.edu.cn
In-Reply-To: <20200608015753.GK22208@pendragon.ideasonboard.com>
References: <20200523115426.19285-1-dinghao.liu@zju.edu.cn>
 <20200608015456.GJ22208@pendragon.ideasonboard.com>
 <20200608015753.GK22208@pendragon.ideasonboard.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <7b79863f.f636d.17291e1ff94.Coremail.dinghao.liu@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cS_KCgCXQQV+qt1eqQvVAA--.20695W
X-CM-SenderInfo: qrrzjiaqtzq6lmxovvfxof0/1tbiAg0FBlZdtOhc5QABsj
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJTRUUUbGCS07vEb7Iv0x
        C_Ar1lV2xY67kC6x804xWlV2xY67CY07I20VC2zVCF04k26cxKx2IYs7xG6rWj6s0DMIAI
        bVAFxVCF77xC64kEw24lV2xY67C26IkvcIIF6IxKo4kEV4ylV2xY628lY4IE4IxF12IF4w
        CS07vE84x0c7CEj48ve4kI8wCS07vE84ACjcxK6xIIjxv20xvE14v26w1j6s0DMIAIbVA2
        z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWxJr0_GcWlV2xY628EF7xvwVC2z280aVAFwI0_Gc
        CE3s1lV2xY628EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wCS07vEe2I262IYc4CY6c8I
        j28IcVAaY2xG8wCS07vE5I8CrVACY4xI64kE6c02F40Ex7xfMIAIbVAv7VC0I7IYx2IY67
        AKxVWUJVWUGwCS07vEYx0Ex4A2jsIE14v26r1j6r4UMIAIbVAm72CE4IkC6x0Yz7v_Jr0_
        Gr1lV2xY6x02cVAKzwCS07vEc2xSY4AK67AK6r48MIAIbVCY0x0Ix7I2Y4AK64vIr41lV2
        xY6xAIw28IcVCjz48v1sIEY20_GFWkJr1UJwCS07vE4x8a6x804xWlV2xY6xC20s026xCa
        FVCjc4AY6r1j6r4UMIAIbVC20s026c02F40E14v26r1j6r18MIAIbVC20s026x8GjcxK67
        AKxVWUGVWUWwCS07vEx4CE17CEb7AF67AKxVWUAVWUtwCS07vEIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCS07vEIxAIcVC0I7IYx2IY6xkF7I0E14v26r1j6r4UMIAIbVCI42IY6xAIw2
        0EY4v20xvaj40_WFyUJVCq3wCS07vEIxAIcVC2z280aVAFwI0_Jr0_Gr1lV2xY6IIF0xvE
        x4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUU==
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

SGkgTGF1cmVudCwKCj4gPiAKPiA+IEkgd29uZGVyIGhvdyBtYW55IGJ1Z3Mgd2UgaGF2ZSB0b2Rh
eSwgYW5kIGhvdyBtYW55IGJ1Z3Mgd2lsbCBrZWVwCj4gPiBhcHBlYXJpbmcgaW4gdGhlIGZ1dHVy
ZSwgZHVlIHRvIHRoaXMgaGlzdG9yaWNhbCBkZXNpZ24gbWlzdGFrZSA6LSggCj4gPiAKCkdvb2Qg
cXVlc3Rpb24uIEl0J3MgaGFyZCB0byBzYXkgaWYgdGhpcyBpcyBhIGRlc2lnbiBtaXN0YWtlIChz
b21lIHVzZQpvZiB0aGlzIEFQSSBkb2VzIG5vdCBjaGVjayBpdHMgcmV0dXJuIHZhbHVlIGFuZCBl
eHBlY3RzIGl0IGFsd2F5cyB0bwppbmNyZW1lbnQgdGhlIHVzYWdlIGNvdW50ZXIpLiBCdXQgaXQg
ZG9lcyBtYWtlIGRldmVsb3BlcnMgbWlzdXNlIGl0IGVhc2llci4KCj4gPiAKPiA+IFRoaXMgY2hh
bmdlIGxvb2tzIGdvb2QgdG8gbWUsIGJ1dCB3ZSBhbHNvIG5lZWQgYSBzaW1pbGFyIGNoYW5nZSBp
biB0aGUKPiA+IHZzcDFfZGV2aWNlX2dldCgpIGZ1bmN0aW9uIGlmIEknbSBub3QgbWlzdGFrZW4u
IENvdWxkIHlvdSBjb21iaW5lIGJvdGgKPiA+IGluIHRoZSBzYW1lIHBhdGNoID8KPiAKClRoYW5r
IHlvdSBmb3IgeW91ciBhZHZpY2UhIEkgdGhpbmsgeW91IGFyZSByaWdodCBhbmQgSSB3aWxsIGZp
eCB0aGlzIGluIHRoZQpuZXh0IHZlcnNpb24gb2YgcGF0Y2guIAoKPiBBbmQgYWN0dWFsbHksIGFm
dGVyIGZpeGluZyB2c3AxX2RldmljZV9nZXQoKSwgd2Ugc2hvdWxkIHJlcGxhY2UgdGhlCj4gcG1f
cnVudGltZV9nZXRfc3luYygpIGNhbGwgaGVyZSB3aXRoIHZzcDFfZGV2aWNlX2dldCgpLCBhbmQg
dGhlCj4gcG1fcnVudGltZV9wdXRfc3luYygpIGJlbG93IHdpdGggdnNwMV9kZXZpY2VfcHV0KCks
IHNvIHRoZXJlIHdvdWxkIGJlIG5vCj4gbmVlZCB0byBjYWxsIHBtX3J1bnRpbWVfcHV0X3N5bmMo
KSBtYW51YWxseSBpbiB0aGUgZXJyb3IgcGF0aCBoZXJlLgo+IAoKVGhlIHBhcmFtZXRlciB0eXBl
IG9mIHZzcDFfZGV2aWNlX2dldCgpIGFuZCB2c3AxX2RldmljZV9wdXQoKSBpcyAic3RydWN0IAp2
c3AxX2RldmljZSIuIElmIHdlIHdhbnQgdG8gdXNlIHRoZXNlIHR3byB3cmFwcGVycywgd2UgbmVl
ZCB0byBhZGp1c3QgdGhlaXIgCnBhcmFtZXRlciB0eXBlIHRvICJzdHJ1Y3QgcGxhdGZvcm1fZGV2
aWNlIiBvciAic3RydWN0IGRldmljZSIsIHdoaWNoIG1heSAKbGVhZCB0byBlcnJvcnMgaW4gb3Ro
ZXIgY2FsbGVycy4gTWF5YmUgd2Ugc2hvdWxkIGxlYXZlIGl0IGFzIGl0IGlzLgoKUmVnYXJkcywK
RGluZ2hhbwo=
