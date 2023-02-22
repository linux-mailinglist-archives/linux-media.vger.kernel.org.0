Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8C56269F52A
	for <lists+linux-media@lfdr.de>; Wed, 22 Feb 2023 14:15:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231622AbjBVNPK (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 22 Feb 2023 08:15:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231735AbjBVNPG (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 22 Feb 2023 08:15:06 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D9CC38EA7
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 05:15:00 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id u10so8852350pjc.5
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LXwDDYUk3+Q4/nNJtasmLY4w5AET06sCuMInR3j34Fk=;
        b=WVUUpyjOVVsoYXGoEZoyfG1Mdqsy+Exa2PxS+69m0zj35qS5THqNyXOfJtB0m5eCY+
         dGp0oHsLLr2vWjikDNF2/YRZNgBg5aRPV3dpW2KdjaOsK7E7UHpBcaDjWA9JYyJS7YA9
         2kIyhkYv8OqfnXcY2sXz+p/qhUSkiOqKu4jTw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LXwDDYUk3+Q4/nNJtasmLY4w5AET06sCuMInR3j34Fk=;
        b=zX4XO1wwuOnVjFbv+f8wieuunTWcJj/J6/Bxrc67a/ywJ4fP7MmGejsFhGY2Gh7tJh
         m6KEkUShW3dbaXvExKQsUdlUIOYdrF5XD7238uZQIn7t0ti+ud1aHmNqSq4iv7dZIYEr
         JWq7LDsIOa8+f2pgJ/MKxzCFxYC4hfN5hE/bpaKirGsqi2sykcl25X+DO7hCO+5mMEOr
         liEL2/ICH1BVXWXTxGiEE8r50r34o0dGa5CYK7fkcssagCpL5IRusO24zJyX9oboCSPu
         Gnlh7RDNa4rW+MOVacABRC3Gdubwd/9zvyPNhmPMoXHC6R8c9R0se4cWZYBrI18UFGMX
         m9/A==
X-Gm-Message-State: AO0yUKVtrw4KXuNiSn8TuJinbib3KKlmkOqvfE3PIlMXXwN/c8VBtJ3E
        VcD0sqderaMuW04ODl8ueY2NyxqvkNy00LDd
X-Google-Smtp-Source: AK7set8Yrra+NCscUdf4kWZdZSyceDlD4w8eaT/4YmB6qqi37E8NiesJqzqj5pxCwImwd2vw2OW1xQ==
X-Received: by 2002:a17:902:f90e:b0:19c:1450:887b with SMTP id kw14-20020a170902f90e00b0019c1450887bmr8775696plb.56.1677071699299;
        Wed, 22 Feb 2023 05:14:59 -0800 (PST)
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com. [209.85.210.174])
        by smtp.gmail.com with ESMTPSA id iz17-20020a170902ef9100b001962858f990sm5021454plb.164.2023.02.22.05.14.58
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Feb 2023 05:14:58 -0800 (PST)
Received: by mail-pf1-f174.google.com with SMTP id fb30so4331213pfb.13
        for <linux-media@vger.kernel.org>; Wed, 22 Feb 2023 05:14:58 -0800 (PST)
X-Received: by 2002:a62:c143:0:b0:593:d4cb:dba2 with SMTP id
 i64-20020a62c143000000b00593d4cbdba2mr1125866pfg.13.1677071697448; Wed, 22
 Feb 2023 05:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20230106061659.never.817-kees@kernel.org> <CANiDSCtTz4mpTz4RHBzNXL=yBvXNXHBZQ-HYMFegLytoScW4eA@mail.gmail.com>
 <202301061217.816FC0313D@keescook> <Y7jODnbUqCwfwwHI@pendragon.ideasonboard.com>
 <CANiDSCvB8vRp43A1J4BpNZveCvG66XbDmnkKZykbWSFCLX1XUQ@mail.gmail.com> <Y+LLeYF7CtLjeLbt@smile.fi.intel.com>
In-Reply-To: <Y+LLeYF7CtLjeLbt@smile.fi.intel.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 22 Feb 2023 14:14:46 +0100
X-Gmail-Original-Message-ID: <CANiDSCtjX6+xZn=YkSfqY8xTi7e=OZWbUNtuJ_d=OreFbrgaog@mail.gmail.com>
Message-ID: <CANiDSCtjX6+xZn=YkSfqY8xTi7e=OZWbUNtuJ_d=OreFbrgaog@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Silence memcpy() run-time false positive warnings
To:     Andy Shevchenko <andriy.shevchenko@intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <keescook@chromium.org>, ionut_n2001@yahoo.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Andy

On Tue, 7 Feb 2023 at 23:07, Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Mon, Jan 09, 2023 at 11:46:00AM +0100, Ricardo Ribalda wrote:
> > Hi Laurent
> >
> > I was thinking about something on the line of the attached patch,
> >
> > uvc_frame_header->data could also be replaced with a union.
> >
> > Warning, not tested ;)
>
> ...
>
> > +struct uvc_frame_header {
> > +     u8 length;
> > +     u8 flags;
> > +     u8 data[];
> > +} __packed;
>
> __packed! (See below)
>
> ...
>
> > +             pts = (u32 *) header->data;
>
> Ai-ai-ai.
> Here is just a yellow flag...
>
> ...
>
> >       uvc_dbg(stream->dev, FRAME,
> >               "%s(): t-sys %lluns, SOF %u, len %u, flags 0x%x, PTS %u, STC %u frame SOF %u\n",
> >               __func__, ktime_to_ns(time), meta->sof, meta->length,
> >               meta->flags,
> > +             has_pts ? *pts : 0,
>
> ...and here is a red flag. What you need to have is

Thanks! you are absolutely right :)

Luckily  Laurent merged the original patch not mine.

Regards!

>
>         void *pts;
>         u32 pts_val;
>
>         pts_val = get_unaligned_be32(); // or le32
>
>         ...use pts_val...
>
> > +             has_scr ? scr->scr : 0,
> > +             has_scr ? scr->frame_sof & 0x7ff : 0);
>
>
> --
> With Best Regards,
> Andy Shevchenko
>
>


-- 
Ricardo Ribalda
