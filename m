Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 121E6192B94
	for <lists+linux-media@lfdr.de>; Wed, 25 Mar 2020 15:56:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727537AbgCYO4F (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 25 Mar 2020 10:56:05 -0400
Received: from lb1-smtp-cloud8.xs4all.net ([194.109.24.21]:52995 "EHLO
        lb1-smtp-cloud8.xs4all.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726969AbgCYO4E (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 25 Mar 2020 10:56:04 -0400
Received: from [192.168.2.10] ([46.9.234.233])
        by smtp-cloud8.xs4all.net with ESMTPA
        id H7RnjfQn0Br2bH7RrjI86c; Wed, 25 Mar 2020 15:56:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
        t=1585148163; bh=VCLnT6/fw3X1OKas/RpOgBQ+sH13O0uMTxUHMp/nWQg=;
        h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
         Subject;
        b=vtoG0cyzTHwQGnZV1dz5erMCz5Erl3egz9Rcd0lT2p36s5uei4l8TmEZqHF1sYZgV
         CrMyBesZg8I9g5ruyNDR8JXV6o0EqZaHpBe/ANEXu8+MOoSxtVrB7Llu1WFL7rCz6z
         7OcTJxPWc3gHpztI+fKPmNj3NrvtcASRRFthaWjOIBOlsxuAd2swbpLS9IKsJxLqQY
         v9fcd45cofnG+O5c7k3FsjNqz3NK7QyFPk4vYPK8266RZlriwqX4NX74xw8N5j2WvV
         pPxjiktZj/wX9W//rftKVd1IpL44NeABRUGx8K5sScJod93ZpkQrks6G4ZLpqsQZGu
         c4WQ1gCbGKtow==
Subject: Re: [GIT PULL FOR v5.7] ti-vpe/cal and imx7-mipi-csis cleanups/fixes
To:     Tomi Valkeinen <tomi.valkeinen@ti.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
References: <64c740ae-3ebd-cec3-14f4-e65f2cb53af3@xs4all.nl>
 <20200325142733.GG19171@pendragon.ideasonboard.com>
 <f31a478a-8975-e507-6b56-3d07a0d1c814@ti.com>
From:   Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <6fa2da33-55e0-3e74-dd70-658db86f6f3c@xs4all.nl>
Date:   Wed, 25 Mar 2020 15:55:59 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <f31a478a-8975-e507-6b56-3d07a0d1c814@ti.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-CMAE-Envelope: MS4wfI1RO6MjlyqSHtiFJc6tziji9OQIcBN/zrnh/bQswMzzeqgsqsWQiKh4SCTXl2aG8MRQCZXjwOkuQUzo46/pKknljhi4pDgjbssXC1fbeu4B487db6l2
 7Edc30TAtR2HiNkkZhilYHv+tWztSFv+P2zkcxcmtuXqN80bjgjxY6fPl43jk0SyQYK05nFLmIx6DotXG4uNirUufR2YT0vUee2qSMbuPOMKWg8CC1ANFZLS
 obdZMvEZQGadCKDCcQs44+DsOLwGgXjSU0Z1xVaDIdI=
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On 3/25/20 3:40 PM, Tomi Valkeinen wrote:
> On 25/03/2020 16:27, Laurent Pinchart wrote:
> 
>>> Tomi Valkeinen (19):
>>>        media: ti-vpe: cal: fix DMA memory corruption
>>>        media: ti-vpe: cal: improve enable_irqs
>>>        media: ti-vpe: cal: fix use of wrong macro
>>>        media: ti-vpe: cal: use runtime_resume for errata handling
>>>        media: ti-vpe: cal: drop cal_runtime_get/put
>>>        media: ti-vpe: cal: catch error irqs and print errors
>>>        media: ti-vpe: cal: print errors on timeouts
>>>        media: ti-vpe: cal: simplify irq handling
>>>        media: ti-vpe: cal: remove useless CAL_GEN_* macros
>>>        media: ti-vpe: cal: remove useless IRQ defines
>>>        media: ti-vpe: cal: use reg_write_field
>>>        media: ti-vpe: cal: cleanup CIO power enable/disable
>>>        media: ti-vpe: cal: fix dummy read to phy
>>>        media: ti-vpe: cal: program number of lines properly
>>>        media: ti-vpe: cal: set DMA max seg size
>>>        media: ti-vpe: cal: move code to separate functions
>>>        media: ti-vpe: cal: improve wait for CIO resetdone
>>>        media: ti-vpe: cal: improve wait for stop-state
>>>        media: ti-vpe: cal: fix stop state timeout
>>
>> Tomi has posted v3, is that what the pull request contains ?
> 
> Yes, looks like v3.

I was 15 minutes away from posting the PR with v2 when I saw v3 arrive :-)

So yes, this is with v3.

Regards,

	Hans
