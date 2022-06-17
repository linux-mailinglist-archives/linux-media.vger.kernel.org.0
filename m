Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 345B654EF08
	for <lists+linux-media@lfdr.de>; Fri, 17 Jun 2022 04:00:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1379448AbiFQCAS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 16 Jun 2022 22:00:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230220AbiFQCAR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 16 Jun 2022 22:00:17 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA30A60BBD
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 19:00:16 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-31780ad7535so3624387b3.8
        for <linux-media@vger.kernel.org>; Thu, 16 Jun 2022 19:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=guQb2Hg3X4ULk1F2/TqyJ3mAW7Fpt3z7yEloQ3J27Nc=;
        b=de+F17Ur1s6eUxqh8NBJ7pToqMvEDZHMT3+sTivV+OizhJ+ZXCZQkpZBMMSyMXcgHj
         IqThUK2Zo7+SMZCo6Gd/vGh/kWstr/49dXQYLWasTxQ1mzxv28ly1lD096iO6eGvwAJ4
         mXf2NSkJayrAaw4qroAAVW8Z/TyJKiESgfaP9cMZarCpDq75IKnz+pOhqBfqPLaErWSS
         UyEMWmQeLBUHarAS0aiEg1Kvv04aXXDpdvB52g8afpPQecIVLKK2joMm2TirKjqgK0uo
         gOG13Nr1A4YiFng91cj80/iDT3Hh2wFdgRQc70A5T3zJS+MdmeWQgsmKgY/OagdgULuc
         Sgbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=guQb2Hg3X4ULk1F2/TqyJ3mAW7Fpt3z7yEloQ3J27Nc=;
        b=mMyoPaa2U4gHb936rhx4t0P3dHd6JhyCtyK/vrjniQRkJvTxYkUEYUxa7pW9VLgrEa
         MA83Y7h5O75Ayna0U85p/TgUXGnQodTFXp4jDKK43zOnoVHpKTKB5ppWXmrPqrhTACAl
         NTvNikq0NMrYzqknI2ZI2TT0IZCMm8TZUfZIjYKX/Q/30SgGazzKp4c1xl1b/BGiB5/n
         oUsxq8wfan8G1zRHl07xVIAmlrBlUbz11B5JfhYizbnW+jis7ClYokEhYWmkXCBGa/oT
         cxOMqFXrgnDy5KD4iqbOVeEF+zB5ODCFb7LvWZYB4Y7HctsTSsbja+kqcxrNf0pe+yHz
         Oubw==
X-Gm-Message-State: AJIora/o2FfPMaH6m6Mbrnap702/BE9XhQgZGYsGXPZeeLSjWvKaMEO2
        rxlqOJ3+0IMoWue00ZWqEpp5s2H/a8O5YltQKAuCcQ==
X-Google-Smtp-Source: AGRyM1sSFXneMYHMxzF/UIPCTEG5BDIg9EJK/wJ+COEVQhHFqqI3RXy7bZZLvUPoP939u+eeLWafql9GT6anqgR6RXQ=
X-Received: by 2002:a81:de4a:0:b0:30f:d89a:f025 with SMTP id
 o10-20020a81de4a000000b0030fd89af025mr9215214ywl.228.1655431215891; Thu, 16
 Jun 2022 19:00:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220610010111.3418214-1-yunkec@google.com> <60301e64-6a74-8395-875a-13f917643baa@linuxfoundation.org>
In-Reply-To: <60301e64-6a74-8395-875a-13f917643baa@linuxfoundation.org>
From:   Yunke Cao <yunkec@google.com>
Date:   Fri, 17 Jun 2022 11:00:05 +0900
Message-ID: <CANqU6FddgSHUMVSGPBgjmD-SdpsZnTu2Ekopv53A+2qA8-8CAw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2 RESEND] media: vimc: add ancillary lens
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
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

Hi Shuah,

Thanks for the review!
I just sent out v2.

Changelog from v1:
-Better commit log.
-A bit more detailed documentation in 2/2.

On Thu, Jun 16, 2022 at 11:40 PM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/9/22 7:01 PM, Yunke Cao wrote:
> > Add a basic version of vimc lens.
> > Link lens with sensors using ancillary links.
> > Update vimc documentation to reflect this change.
> >
> > Yunke Cao (2):
> >    media: vimc: add ancillary lens
> >    media: vimc: documentation for lens
> >
> >   Documentation/admin-guide/media/vimc.dot      |   4 +
> >   Documentation/admin-guide/media/vimc.rst      |   3 +
> >   drivers/media/test-drivers/vimc/Makefile      |   2 +-
> >   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
> >   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
> >   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
> >   6 files changed, 177 insertions(+), 21 deletions(-)
> >   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
> >
>
> Reviewed all three patches
>
> Mauro,
>
> Would you like me to send a pull request for these patches?
>
> Yunke, please make sure to run get_maintainers.pl and include everybody
> the scripts asks you to. Leaving out people causes delays in patch
> reviews and acceptance.

Thank you, I will do it in the future.

Best,
Yunke

>
> thanks,
> -- Shuah
