Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B9B6A54596F
	for <lists+linux-media@lfdr.de>; Fri, 10 Jun 2022 03:05:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237266AbiFJBFK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 9 Jun 2022 21:05:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233224AbiFJBFI (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 9 Jun 2022 21:05:08 -0400
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 860A1149D9D
        for <linux-media@vger.kernel.org>; Thu,  9 Jun 2022 18:05:03 -0700 (PDT)
Received: by mail-yb1-xb29.google.com with SMTP id r3so10413269ybr.6
        for <linux-media@vger.kernel.org>; Thu, 09 Jun 2022 18:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A9jI9xKuSs8kyGwkMTPAsk9n3+h1tMqAOr2WacyZCj0=;
        b=kPphBGaiUFEStzGP54SqAffVYW5j/M5sLQsnK0x/R8/SlyjvlfyDJuGeHL0o/OJNH3
         Kbgqxhk6UeIhDCzPmRwfT9MPgbP+QfZlZQIIkji/fVGS7oeeBkRmz9oYwPaiYHmh5hHL
         uecRQYFz3+/GIOFKDtmammg4GiyDYbmnbkVQU58pYKzOuYX4uzkOpcWR4uENY0byqZBJ
         N1ha55ozQ+Ay+mC/Xsox4nHg/+U5Y5DgskSesWBuSeOZISpb9FsO3Bl/7F4DiBtu4bci
         UYGTq6of0Y4UI1MW0FIiUoZsOWa2Bm6fVBv5LS/Y8iQe3ovAOvQBje7if07RuYQiHG/0
         4UiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A9jI9xKuSs8kyGwkMTPAsk9n3+h1tMqAOr2WacyZCj0=;
        b=CR9IxMIGbsYH3WXu7H74UUFrf5A5J3BUcXRB4tYg+CIx87GKysimBauVgxD+u/hJM0
         8iVrKtP8vkfAzaetIFwOA4EDzcbmkHUwDIDuNUNqQ17BNu6N58G66iOkcZY67ZfsRLSp
         2L0/fCbbl3GYcmClkmbitCX/U+x69V8lTnrd02OjF1byhgZUUywQm4PcVpveygp9jhh4
         sT1GE7Cg2O+AJQ79sD92STy4ldd7Yb3O+vovwzTvJWjZTmvy/8QZn3jS+B3UkSjVJnHA
         An0tPkOFHk2xjU7soNv0N/NW1AcHqfcndBjz0ye4JdSQ1QawXRfh93+P90lIpRk1q1bB
         /Bnw==
X-Gm-Message-State: AOAM533JzO8CwaxVeoUU/I4uncKmMOkpY7MjiW1gKcDZRMWsfxyYS4Sg
        x/+YArhrRoIWFe7c9gKvj3lGfIslpsJSmfGXo4JQLQ==
X-Google-Smtp-Source: ABdhPJwsQ8EVq62zPE7Ys6VjwvfZzSbinUHh2urr59Uscd8GXFRDQZSv81y2kzXxI3sihJL7tu1DF0SOBCHRUbreUg8=
X-Received: by 2002:a25:5343:0:b0:663:df98:9efe with SMTP id
 h64-20020a255343000000b00663df989efemr15298469ybb.460.1654823102451; Thu, 09
 Jun 2022 18:05:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220415023855.2568366-1-yunkec@google.com> <20220415023855.2568366-2-yunkec@google.com>
 <165037056336.2548121.16870543641391713634@Monstersaurus> <CANqU6Fc63UJ8rwr5v0Yz7OVgDZynFC5pn-RGLcw94B2MzW5j1w@mail.gmail.com>
 <26aac3e9-7a83-0d47-20d0-40f848d3908e@linuxfoundation.org>
In-Reply-To: <26aac3e9-7a83-0d47-20d0-40f848d3908e@linuxfoundation.org>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 10 Jun 2022 10:04:51 +0900
Message-ID: <CANqU6FdqJCRoOf-fSY3JfY5SZ=sBXgevKr9u1j1h6f2S5bkBYg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] media: vimc: add ancillary lens
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Scally <djrscally@gmail.com>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Shuah. I just resent the patch.

Best,
Yunke

On Fri, Jun 10, 2022 at 1:04 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/8/22 6:57 PM, Yunke Cao wrote:
> > Hi Kieran,
> >
> > Thanks for the review!
> > I wonder what's the status of this. Will this patch get merged?
> >
> > Best,
> > Yunke
> >
> > On Tue, Apr 19, 2022 at 9:16 PM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >>
> >> Hi Yunke,
> >>
> >> This is a very interesting development!
> >>
> >> Quoting Yunke Cao (2022-04-15 03:38:54)
> >>> Add a basic version of vimc lens.
> >>> Link lens with sensors using ancillary links.
> >>>
> >>> Signed-off-by: Yunke Cao <yunkec@google.com>
> >>> ---
> >>>   drivers/media/test-drivers/vimc/Makefile      |   2 +-
> >>>   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
> >>>   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
> >>>   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
> >>>   4 files changed, 170 insertions(+), 21 deletions(-)
> >>>   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
> >>>
>
> Hmm. Couldn't find this patch in my Inbox and spam folder. Explains the
> delay on my side.
>
> Please resend so I can do a proper review.
>
> thanks,
> -- Shuah
>
