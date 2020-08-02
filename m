Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 883BE2359EE
	for <lists+linux-media@lfdr.de>; Sun,  2 Aug 2020 20:38:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726841AbgHBSig (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 2 Aug 2020 14:38:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725910AbgHBSif (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 2 Aug 2020 14:38:35 -0400
Received: from forward500o.mail.yandex.net (forward500o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39FFAC06174A;
        Sun,  2 Aug 2020 11:38:34 -0700 (PDT)
Received: from mxback7o.mail.yandex.net (mxback7o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::21])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id 69E4460054;
        Sun,  2 Aug 2020 21:38:32 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback7o.mail.yandex.net (mxback/Yandex) with ESMTP id ZYUtAIGnwd-cVDSDtTX;
        Sun, 02 Aug 2020 21:38:31 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1596393511;
        bh=9Xpoz3PFFbPffZdHaYnv+jiyMQH/CQukz3eO2Np1tvY=;
        h=Message-Id:Cc:Subject:Date:References:To:From;
        b=o30OIc8ljvbdNE8zTXLiQjS5DpI1OdstfFF8re7kjUpkeTWNeaCspMlH8EUwjmCmP
         a09+5ilYEYN8zazr7aK4mrzdfrOBTqvjjbWOrY3CNy1R8uO4DXEVnXiXe3eJAD9+u8
         KQvtevP/SQuvV6QTyQutUyvEpdWU+0DeFiHskcTQ=
Authentication-Results: mxback7o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by myt1-5b550442eff4.qloud-c.yandex.net with HTTP;
        Sun, 02 Aug 2020 21:38:31 +0300
From:   Evgeny Novikov <novikov@ispras.ru>
Envelope-From: eugenenovikov@yandex.ru
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>
References: <20200723170453.432-1-novikov@ispras.ru> <CA+V-a8uNfscxiM1fMjfdvZstZkkzxW41p40jpBXT3NeyiS9-Qw@mail.gmail.com>
         <20927111595619342@mail.yandex.ru> <CA+V-a8tUmMnb8x=GPXJ8QGLJg5qGP+DP+F9EbUrDfUbrxWnkag@mail.gmail.com>
Subject: Re: [PATCH] media: davinci: vpif_capture: fix potential double free
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Sun, 02 Aug 2020 21:38:31 +0300
Message-Id: <220911596048246@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

25.07.2020, 01:06, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>:
> Hi Evgeny,
>
> On Fri, Jul 24, 2020 at 9:00 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>>  Hi Lad,
>>
>>  Yet again I can not demonstrate you a nice error trace corresponding to the bug fixed by the patch. Indeed, there is a branch in vpif_probe() that explicitly invokes vpif_probe_complete() and the patch targets the possible issue that can happen during this.
>>
>>  When I developed the patch I saw on vpif_display.ko. It looks very similar regarding things touched by the patch. In particular, it does not free vpif_obj.sd in its vpif_probe_complete(). But now I see that it does this in vpif_remove()!
>
> Makes sense.
>
>>  Do you think that vpif_capture.ko should do the same? If so, I guess that I should fix the patch appropriately since likely it just replaces one (very rare) bug with another one (on a typical execution path).
>
> Yes it should.

vpif_remove() from vpif_capture.ko already both frees vpif_obj.sd and unregisters the V4L2 device. So, there is no need to fix the patch.

BTW, other drivers, e.g. drivers/media/platform/renesas-ceu.c, do not clean up memory allocated by probe within v4l2_async_notifier_operations.complete as well. 

--
Best regards,
Evgeny Novikov

> Cheers,
> --Prabhakar
>
>>  --
>>  Evgeny Novikov
>>  Linux Verification Center, ISP RAS
>>  http://linuxtesting.org
>>
>>  24.07.2020, 17:17, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>:
>>  > Hi Evgeny,
>>  >
>>  > Thank you for the patch.
>>  >
>>  > On Thu, Jul 23, 2020 at 6:04 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>>  >> In case of errors vpif_probe_complete() releases memory for vpif_obj.sd
>>  >> and unregisters the V4L2 device. But then this is done again by
>>  >> vpif_probe() itself. The patch removes the cleaning from
>>  >> vpif_probe_complete().
>>  >>
>>  >> Found by Linux Driver Verification project (linuxtesting.org).
>>  >>
>>  >> Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
>>  >> ---
>>  >> drivers/media/platform/davinci/vpif_capture.c | 2 --
>>  >> 1 file changed, 2 deletions(-)
>>  >>
>>  >> diff --git a/drivers/media/platform/davinci/vpif_capture.c b/drivers/media/platform/davinci/vpif_capture.c
>>  >> index d9ec439faefa..72a0e94e2e21 100644
>>  >> --- a/drivers/media/platform/davinci/vpif_capture.c
>>  >> +++ b/drivers/media/platform/davinci/vpif_capture.c
>>  >> @@ -1482,8 +1482,6 @@ static int vpif_probe_complete(void)
>>  >> /* Unregister video device */
>>  >> video_unregister_device(&ch->video_dev);
>>  >> }
>>  >> - kfree(vpif_obj.sd);
>>  >> - v4l2_device_unregister(&vpif_obj.v4l2_dev);
>>  >
>>  > vpif_probe_complete() is a async callback and probe() should have
>>  > already completed by then.
>>  >
>>  > Cheers,
>>  > --Prabhakar
>>  >
>>  >> return err;
>>  >> }
>>  >> --
>>  >> 2.16.4
