Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0FB53AD430
	for <lists+linux-media@lfdr.de>; Mon,  9 Sep 2019 09:54:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388480AbfIIHyG (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 9 Sep 2019 03:54:06 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53928 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388470AbfIIHyF (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Mon, 9 Sep 2019 03:54:05 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x897rGEC046111;
        Mon, 9 Sep 2019 02:53:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1568015596;
        bh=PJzWMa6p8MTEkwFPcIePn/KpuFAu5Gxuc4FeHI2OLsU=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=sPytFT56SwsM5xY3ut6akJIHVkQyNKskE6ehkQbXhhNt5mmb00dC5deHY0Eed85rU
         bC4kwhmnL+tpRHv85gLv8SP1erEvicU7ieKjzoHTgD+2/yZviUUik4DbBOgzafH3hv
         bro35PT7KUAabAqhz7mnosZfwnIPBmppHPNH0cGI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x897rGZQ085681
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 9 Sep 2019 02:53:16 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 9 Sep
 2019 02:53:16 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE110.ent.ti.com
 (10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 9 Sep 2019 02:53:15 -0500
Received: from [172.24.190.212] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x897rCrV088897;
        Mon, 9 Sep 2019 02:53:12 -0500
Subject: Re: [PATCH v2 0/5] ARM: make DaVinci part of the ARM v5 multiplatform
 build
To:     Bartosz Golaszewski <brgl@bgdev.pl>, Arnd Bergmann <arnd@arndb.de>
CC:     Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Kevin Hilman <khilman@kernel.org>,
        David Lechner <david@lechnology.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>
References: <20190725131257.6142-1-brgl@bgdev.pl>
 <CAK8P3a1FXyRRi5q48h-=egFjgoRJvy6_zuO9MQaAOMA-bsJKRA@mail.gmail.com>
 <CAMRc=Me_7aw_RvU_tZnVUgduN2wWYGqJ7hQirQ2RLzxGiPujvQ@mail.gmail.com>
 <CAMRc=MdCviMA4gakqFS3+F-nU2XkdmmZbCb-m1mBJdGRHufKGg@mail.gmail.com>
 <27eb964a-bc6c-3a0d-c2c4-48e908465986@ti.com>
 <CAMpxmJX7osgdzx1Lc=627RpHZDs+ha8a6=AnhaQJ5HkLVp-xKg@mail.gmail.com>
 <CAK8P3a0+kfDbGrcFi5TLxNNpoOM6u6KRW+PaLFNSQJ9BTxX=-w@mail.gmail.com>
 <CAMRc=Mdsfbh1nF1a23Anig=w42s7=WzS3Uz7KK1P1aRNP2kFvg@mail.gmail.com>
From:   Sekhar Nori <nsekhar@ti.com>
Message-ID: <d579c29c-6e30-8e2f-cbc0-0c4820ed6a72@ti.com>
Date:   Mon, 9 Sep 2019 13:23:11 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMRc=Mdsfbh1nF1a23Anig=w42s7=WzS3Uz7KK1P1aRNP2kFvg@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 08/09/19 7:01 PM, Bartosz Golaszewski wrote:
> sob., 7 wrz 2019 o 10:21 Arnd Bergmann <arnd@arndb.de> napisał(a):
>>
>> On Wed, Aug 28, 2019 at 9:55 AM Bartosz Golaszewski
>> <bgolaszewski@baylibre.com> wrote:
>>> śr., 28 sie 2019 o 09:44 Sekhar Nori <nsekhar@ti.com> napisał(a):
>>>
>>> Actually I tested this without the clocksource conversion and it works
>>> - the previous driver still selects relevant config options. But I
>>> think you're right - it's worth picking up all the bug fixes from this
>>> series and then merging the rest once dm365 issue is fixed.
>>
>> I just had another look at the series and found that the driver fixes
>> (patches 1 and 2) are queued in linux-next, and patch 3 was merged.
>>
>> If you like, I could put the remaining two patches into the arm/late branch
>> and send that after the media and staging trees are merged into mainline.
>>
>>       Arnd
> 
> Sure! Makes sense.
> 
> Sekhar: this series doesn't break current mainline (i.e. without the
> clocksource series) so I think we're safe even for dm365.

Yes, I boot/NFS tested the two patches applied on latest linux-next on
on all 6 DaVinci SoCs.

I have acked the patches in case Arnd will apply them directly to ARM-SoC.

Thanks,
Sekhar
