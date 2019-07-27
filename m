Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09FF77BCF
	for <lists+linux-media@lfdr.de>; Sat, 27 Jul 2019 22:29:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388280AbfG0U34 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sat, 27 Jul 2019 16:29:56 -0400
Received: from mail-ua1-f66.google.com ([209.85.222.66]:43302 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388274AbfG0U34 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sat, 27 Jul 2019 16:29:56 -0400
Received: by mail-ua1-f66.google.com with SMTP id o2so22568345uae.10
        for <linux-media@vger.kernel.org>; Sat, 27 Jul 2019 13:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P0kuq3Qcl/t5feCvD04GUnaID7C/svzTRr4x4STVhpI=;
        b=YlKWBZRNnzeY6D89CUfRzcI1WF1sQCEmBEEq8FWJptMHipqS05o+WDiQWBdRsnpHVw
         UzFSRnQuzQ3g7P1q52w59a26FoiQdLUvVafkSWeX8z4vQXter8ReKUa2lHDoUnivDeNG
         vwjQN8y0CRMTbKh4UUtHKoSuu/1DTb/NMOqQWyZSsxlDFzYqOqJmcyqXT+ogjbY5Vt0P
         e/UzrY+bCj5DrG9C5kqLm+/CPYpY/UBEs1Rv2HNCgV0NHRh/q5mYyKewWX7jX9wyZuX2
         GVeqC4JRiDtEvPonLoPthPneHmuVyQ/Q9o27lV5oE2t0XW4LNRfnyf7F8twUJ2AjO7vm
         ALfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P0kuq3Qcl/t5feCvD04GUnaID7C/svzTRr4x4STVhpI=;
        b=MTNjgtcvRdrdrPHbRMw52hxCV6tzdwql3iNUmE0i6ucrtIc9niK24XqMwq+Z6aIREB
         5WLrk42Oul7u8tlVJltHKHi6b+5k/hkK9pn75N5xGVDlVhR3NyFB8dHKZu0yXnvXFhWi
         ebWk+SN4ScUvBA1oq/4nU9/+viCDcBlIOaQr0aAmGl0sa2Ivp1cQztwXZEUjeTErHxpe
         SMFWaJ9d5AnSAZLWFTq2UGuNW9m45QKovXL1OMlTQjR0M8JNWKY/VP8GgKQdEvvM4pvi
         CYyv7XPBsF6ZDhteryQ9lVW+60HTNZ3pWeY9z3OcwdSopov0Pe27pJOJfIDCnK9eRKJk
         9M6g==
X-Gm-Message-State: APjAAAUhPTf92pILMccl9p//JmWUB/7kVgMMULu/59w2VwtwsXlqHR3a
        cqfnW2EviYbFYI2kCTrIM8WwaHe4maq6wc1yLUc=
X-Google-Smtp-Source: APXvYqyDmf6HcgIgyvqXo3jCZHIGEbehMbXao2Pzu46SZPIZza4y6MHWxkTGMHKjOomZ/+KIqSVa9JGE55rcJMIMmM8=
X-Received: by 2002:ab0:290a:: with SMTP id v10mr36128803uap.74.1564259395076;
 Sat, 27 Jul 2019 13:29:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190726204123.30384-1-mbalant3@gmail.com>
In-Reply-To: <20190726204123.30384-1-mbalant3@gmail.com>
From:   Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date:   Sat, 27 Jul 2019 17:29:44 -0300
Message-ID: <CAAEAJfDX-2jxArh+HLW6A-=Fjh0rO1U3dnnOD7bwvfRhYiuQ-Q@mail.gmail.com>
Subject: Re: [PATCH] media input infrastructure:tw686x: Added custom function
 for video device release functionality in tw686x driver
To:     Mark Balantzyan <mbalant3@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Mark,

On Fri, 26 Jul 2019 at 17:41, Mark Balantzyan <mbalant3@gmail.com> wrote:
>
> Signed-off-by: Mark Balantzyan <mbalant3@gmail.com>
> Reported-by: kbuild test robot <lkp@intel.com>
> ---
> This patch adds a custom function for releasing the video device for the tw686x video device driver.
>
>  drivers/media/pci/tw686x/tw686x-video.c | 23 ++++++++++++++++++-----
>  1 file changed, 18 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/media/pci/tw686x/tw686x-video.c b/drivers/media/pci/tw686x/tw686x-video.c
> index 3a06c000..cabc4f89 100644
> --- a/drivers/media/pci/tw686x/tw686x-video.c
> +++ b/drivers/media/pci/tw686x/tw686x-video.c
> @@ -1151,18 +1151,32 @@ void tw686x_video_irq(struct tw686x_dev *dev, unsigned long requests,
>         }
>  }
>
> +void tw686x_video_device_release(struct tw686x_video_channel *vc) {
> +

Who's calling this ^ ?

Regards,
Eze
