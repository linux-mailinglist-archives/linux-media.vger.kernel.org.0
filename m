Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30D431D3060
	for <lists+linux-media@lfdr.de>; Thu, 14 May 2020 14:54:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726763AbgENMya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 14 May 2020 08:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725955AbgENMy3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 14 May 2020 08:54:29 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFA13C061A0C
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:54:27 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id z5so2697944ejb.3
        for <linux-media@vger.kernel.org>; Thu, 14 May 2020 05:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fjip1Ie1htf9qxDq8PCAKqJG1NaLpqgyInPG5lEcjjg=;
        b=s8j+sgJ6VjR22Fhk0hmQnYiI52B9LgCrmNqp/umlpWvHENy9Oq4RIOO2LNU9//ScHp
         Jb65xAd2K6Tzz9RZEmY0zr+grD2ZBPGhMRGxJwYl/2iruqAHnF9bQClTGLkjKLh4BoiW
         7xOD1/BOSbpjAYVkS8kNx/XXtgVhMQ4tipFy7E4CmWOHFHzlKcK5mXuq1X9a0nr/1Bsj
         4XWSneNtstIuLpZqYN/7+J5/NiCjPFmqGBtLlPjQF3GpEMeETzIdHDO132MEjN899nnh
         xMLkJTrKgRqhFZdTIMn6UyJpPTaisk6Fiv3JpDKAdaY1OsUZjrZ6zmMw7mZFd/TNB4WQ
         K/7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fjip1Ie1htf9qxDq8PCAKqJG1NaLpqgyInPG5lEcjjg=;
        b=LWyCzevB8LgysG6jyf8Ob+mTlHt+s8EL4K+WbM59KfBA8o0LBP8lPwBPahIa0lBHi6
         DQNxtdO85LAwoxJOLkYjHbUn9FErukljFgTlV30uNDOCgoFBfFTRVm0i1blXxD8aqZud
         q4ioTCfgh7Wpjsa5xgmxDfDPWdEDu/Dspr5CFJZv+XTUIP5Q4W8t2l9qAw24SE573esT
         D9iCJU3yzR+ln2TnOKePm4uvlnwYs43Zqvr0TRrWrglKSLztE4oU++VFiJ8kIxZHwI7y
         XLMZag6enVEKOz7LU8aFtD9cH9B1aBU8Xd2em7WZFl+IYNYL1MKdptalaUa57zAr4JCK
         xGLA==
X-Gm-Message-State: AOAM532ZvGI7Na9Cuhm87elUJlMSLZJ8Zeq1TNKw9nye5ZftIDNHa64O
        laywsvKWw2OoEc7McO75pGvVvsBaKD5oOIAqxHkq3Q==
X-Google-Smtp-Source: ABdhPJwyK75E3zgY3ai+dbAXBTla0/niGFZdQptXrtrQo8yu9wj/ixxYRWOqkFmu+4YypqvLYsbQbHt+3lz4tNXGjjo=
X-Received: by 2002:a17:906:390a:: with SMTP id f10mr3647685eje.74.1589460866379;
 Thu, 14 May 2020 05:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <1589186626-17243-1-git-send-email-wangxiongfeng2@huawei.com>
 <CAAEAJfAzcRTLE3HWHJqWvuENYnPCU-E6TdaDWXc+WNHOaUqdyA@mail.gmail.com> <c8b781aa-da2b-5aa7-aadc-a1980c84bd0d@huawei.com>
In-Reply-To: <c8b781aa-da2b-5aa7-aadc-a1980c84bd0d@huawei.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Thu, 14 May 2020 09:54:15 -0300
Message-ID: <CAAEAJfC2=z+jWE=qvUu5PXiD=O5+iFzwshYDdG+6XyT-7e6Ofg@mail.gmail.com>
Subject: Re: [PATCH] [media] tw686x: add a missing newline when printing
 parameter 'dma_mode'
To:     Xiongfeng Wang <wangxiongfeng2@huawei.com>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, 13 May 2020 at 22:32, Xiongfeng Wang <wangxiongfeng2@huawei.com> wrote:
>
> Hi Ezequiel,
>
> Thanks for your reply !
>
> On 2020/5/14 3:32, Ezequiel Garcia wrote:
> > On Mon, 11 May 2020 at 05:49, Xiongfeng Wang <wangxiongfeng2@huawei.com> wrote:
> >>
> >> When I cat module parameter 'dma_mode' by sysfs, it displays as follows.
> >> It is better to add a newline for easy reading.
> >>
> >> [root@hulk-202 ~]# cat /sys/module/tw686x/parameters/dma_mode
> >> memcpy[root@hulk-202 ~]#
> >>
> >> Signed-off-by: Xiongfeng Wang <wangxiongfeng2@huawei.com>
> >
> > I don't mind this change, but I don't think this is standard.
> > The lack of newline follows what other drivers are doing.
> >
> > # hexdump -c /sys/module/acpi/parameters/ec_event_clearing
> > 0000000   q   u   e   r   y
> > 0000005
> >
> > Is it really an issue for you?
>
> It's not an issue for me. It's just that if the result is in a separate line, it
> reads more easily. I am also planning to fix the parameters below
> '/sys/module/acpi/parameters'.
>

If you don't have a real reason behind this, such as a documented
expectation or something breaking due to this, but just readability,
then I don't think it's worth going through _all_ the module parameters
fixing this.

While I appreciate your effort, this cleanup exceeds the level
of nitpicking I care for.

Thanks!
Ezequiel

> Thanks,
> Xiongfeng
>
> >
> > Thanks,
> > Ezequiel
> >
> >> ---
> >>  drivers/media/pci/tw686x/tw686x-core.c | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/media/pci/tw686x/tw686x-core.c b/drivers/media/pci/tw686x/tw686x-core.c
> >> index 74ae4f0..bfc61da 100644
> >> --- a/drivers/media/pci/tw686x/tw686x-core.c
> >> +++ b/drivers/media/pci/tw686x/tw686x-core.c
> >> @@ -71,7 +71,7 @@ static const char *dma_mode_name(unsigned int mode)
> >>
> >>  static int tw686x_dma_mode_get(char *buffer, const struct kernel_param *kp)
> >>  {
> >> -       return sprintf(buffer, "%s", dma_mode_name(dma_mode));
> >> +       return sprintf(buffer, "%s\n", dma_mode_name(dma_mode));
> >>  }
> >>
> >>  static int tw686x_dma_mode_set(const char *val, const struct kernel_param *kp)
> >> --
> >> 1.7.12.4
> >>
> >
>
