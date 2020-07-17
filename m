Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F037B224451
	for <lists+linux-media@lfdr.de>; Fri, 17 Jul 2020 21:38:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728422AbgGQTgQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 17 Jul 2020 15:36:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727999AbgGQTgP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 17 Jul 2020 15:36:15 -0400
X-Greylist: delayed 322 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Jul 2020 12:36:15 PDT
Received: from forward500o.mail.yandex.net (forward500o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::610])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6879BC0619D2;
        Fri, 17 Jul 2020 12:36:15 -0700 (PDT)
Received: from mxback13o.mail.yandex.net (mxback13o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::64])
        by forward500o.mail.yandex.net (Yandex) with ESMTP id 800F660A6A;
        Fri, 17 Jul 2020 22:30:48 +0300 (MSK)
Received: from localhost (localhost [::1])
        by mxback13o.mail.yandex.net (mxback/Yandex) with ESMTP id zew1qFiGlB-Ulri2CAh;
        Fri, 17 Jul 2020 22:30:48 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1595014248;
        bh=neFvZqFNmZb2bdWawLymjbFJjg/MqakFYDFRHvN10qQ=;
        h=Message-Id:Cc:Subject:In-Reply-To:Date:References:To:From;
        b=RUv2iy5Hz4T0CGQ9CnRVPwv0jr47nvr2H7Qs01eUgUKmlSRZXQMEnZoOw9iACledj
         fri84ZLf2yKuog7mnxyn8R7j/nl1pQvVhagLBwXtxnkSUzyzetN+MOEN8Qq5Nv3pJN
         lFeC8qoxMEapvFsEhJwS5YWruAx/3rMNIp0VBWIY=
Authentication-Results: mxback13o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva1-e3ac85a63903.qloud-c.yandex.net with HTTP;
        Fri, 17 Jul 2020 22:30:48 +0300
From:   Evgeny Novikov <novikov@ispras.ru>
Envelope-From: eugenenovikov@yandex.ru
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        "ldv-project@linuxtesting.org" <ldv-project@linuxtesting.org>
In-Reply-To: <CA+V-a8sekdRDqahs-Zi-KiSbdv0sRHy7KuHraTRtuE6mz2+beg@mail.gmail.com>
References: <20200714172049.27738-1-novikov@ispras.ru> <CA+V-a8sekdRDqahs-Zi-KiSbdv0sRHy7KuHraTRtuE6mz2+beg@mail.gmail.com>
Subject: Re: [PATCH] media: isif: reset global state
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date:   Fri, 17 Jul 2020 22:30:48 +0300
Message-Id: <170261594993608@mail.yandex.ru>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Lad,

I will try to answer your question below.

17.07.2020, 12:55, "Lad, Prabhakar" <prabhakar.csengg@gmail.com>:
> HI Evgeny,
>
> Thank you for the patch.
>
> On Tue, Jul 14, 2020 at 6:20 PM Evgeny Novikov <novikov@ispras.ru> wrote:
>>  isif_probe() invokes iounmap() on error handling paths, but it does not
>>  reset the global state. So, later it can invoke iounmap() even when
>>  ioremap() fails. This is the case also for isif_remove(). The patch
>>  resets the global state after invoking iounmap() to avoid this.
>>
>>  Found by Linux Driver Verification project (linuxtesting.org).
>>
>>  Signed-off-by: Evgeny Novikov <novikov@ispras.ru>
>>  ---
>>   drivers/media/platform/davinci/isif.c | 11 +++++++++--
>>   1 file changed, 9 insertions(+), 2 deletions(-)
>>
>>  diff --git a/drivers/media/platform/davinci/isif.c b/drivers/media/platform/davinci/isif.c
>>  index c98edb67cfb2..c53cecd072b1 100644
>>  --- a/drivers/media/platform/davinci/isif.c
>>  +++ b/drivers/media/platform/davinci/isif.c
>>  @@ -1075,10 +1075,14 @@ static int isif_probe(struct platform_device *pdev)
>>          release_mem_region(res->start, resource_size(res));
>>          i--;
>>   fail_nobase_res:
>>  - if (isif_cfg.base_addr)
>>  + if (isif_cfg.base_addr) {
>>                  iounmap(isif_cfg.base_addr);
>>  - if (isif_cfg.linear_tbl0_addr)
>>  + isif_cfg.base_addr = NULL;
>>  + }
>>  + if (isif_cfg.linear_tbl0_addr) {
>>                  iounmap(isif_cfg.linear_tbl0_addr);
>>  + isif_cfg.linear_tbl0_addr = NULL;
>>  + }
>
> As the probe itself is failing I don't see a benefit in setting the
> pointers to NULL. Unless I'm missing something.

Unfortunately, I can not provide you easily with a nice visualization of a corresponding error trace, but I will try to explain it in a text form. Our environment model for device drivers infinitely invokes their probe and remove callbacks. In particular, when probe fails, it does not invoke remove, but it can call probe again.

Before the fix the global state (isif_cfg.base_addr and isif_cfg.linear_tbl0_addr) was not set to NULL when first probe fails. Assuming some failures during the second invocation of probe, e.g. ioremap_nocache() can fail, the driver proceeds to iounmap() because corresponding pointers are not NULL. Of course, one can hardly imagine that this is possible in practice but static analysis treats all possible paths.

Perhaps, our environment model is not accurate enough in this aspect. But our tool does not report many similar warnings when we check thousands of drivers, so, we can assume that everything is okay. If you have another opinion, I would be glad to hear it.  

-- 
Evgeny Novikov
Linux Verification Center, ISP RAS
http://linuxtesting.org

>
> Cheers,
> --Prabhakar
>
>>          while (i >= 0) {
>>                  res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>>  @@ -1096,8 +1100,11 @@ static int isif_remove(struct platform_device *pdev)
>>          int i = 0;
>>
>>          iounmap(isif_cfg.base_addr);
>>  + isif_cfg.base_addr = NULL;
>>          iounmap(isif_cfg.linear_tbl0_addr);
>>  + isif_cfg.linear_tbl0_addr = NULL;
>>          iounmap(isif_cfg.linear_tbl1_addr);
>>  + isif_cfg.linear_tbl1_addr = NULL;
>>          while (i < 3) {
>>                  res = platform_get_resource(pdev, IORESOURCE_MEM, i);
>>                  if (res)
>>  --
>>  2.16.4
