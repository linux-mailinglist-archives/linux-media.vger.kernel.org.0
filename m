Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10CDE25C9B5
	for <lists+linux-media@lfdr.de>; Thu,  3 Sep 2020 21:51:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729096AbgICTvx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 3 Sep 2020 15:51:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727065AbgICTvx (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 3 Sep 2020 15:51:53 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D80D3C061244;
        Thu,  3 Sep 2020 12:51:52 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id g4so4485194wrs.5;
        Thu, 03 Sep 2020 12:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UJXkuGnmcBOgj+bnSd2ENQnkJY+HuqruxJn1a8ox8ZU=;
        b=dVJ4WqXKgwqsuWswxxUvPuOq4sVszIzMmm9k4Vboij0EDdTJgWIn7HBG2fOcFd9usX
         EiGhwfvM5BOWtMUmr+MOousCLUhgH3yii4JZE5vKkkSQpYjBccsRuJ7vBUq2erR613F5
         I+yo7SPC3TVaRb57dHI3efCiIXHC4D0tRCA0quceAJwE61I5e7pdMw3e1ly4t+83S2vT
         LtGpG5OonGQ6C5Dukrljj4vZzBxUew+VZ5plIblr6hiTnutxF6Ex1hL5FdHd4V81tA4l
         /V2OdsQN88dhcNY3y7H45y6c6xn2/b2tBMlmTLgIwnRZJBo386OAsj3bfDerDGzki7zR
         4iRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UJXkuGnmcBOgj+bnSd2ENQnkJY+HuqruxJn1a8ox8ZU=;
        b=nBEkY0TDJQniLcPRq0aVVmT0UKGOvkiPzY/a86jEwcO+H6NgaWzGjF1cGlmeAuKE0p
         8gSgq2aWpLV6FK7+kG6A5BpVPRBUbQFaW1q/u6dLSQowuv0joBsCCmYDMs+c9I6bYUv7
         E/+2x9WILP9y4ZsCu9PXYLKq08HeuhmxKRF8f1tJopmnZI167FgcZgs974QSXEyRrRku
         8WcVGQpb7k+3wfuvW5ec7ZkW0Hm8Qnh+UjuxEVLpg+UHUVe7AH6yKBoBKHLT+Q/0j+Tw
         qfry/+dkyj71XfGvFq2zqT9FWup/gc1L/UM0DXTPNCisw4IBo7SxE33GpoSfNEA0FePX
         V2RQ==
X-Gm-Message-State: AOAM532g38NpkV0bfkHbbN7zSL9f6yMrI7u35KRpciy50DO2ifxcKtjk
        rbqIJ+MgqvLyTqjaNsKxiSvbgGPUc7HEjOCkX3MZKS2GkWMvyNF1
X-Google-Smtp-Source: ABdhPJxNwAz9QDKbLTzH13VmNQpjqfEC0r/8i75sdOOflICkdzE8RpNfhAf75QFw08wOd95a3E8ThxWBGRz2HUJkZOQ=
X-Received: by 2002:a05:6000:110b:: with SMTP id z11mr4234815wrw.426.1599162711516;
 Thu, 03 Sep 2020 12:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200831220601.20794-1-santiagohssl@gmail.com>
 <20200831220601.20794-3-santiagohssl@gmail.com> <6b225c10b6c71ffbc79c236b64dcc83fc33cc21b.camel@perches.com>
In-Reply-To: <6b225c10b6c71ffbc79c236b64dcc83fc33cc21b.camel@perches.com>
From:   Santiago Hormazabal <santiagohssl@gmail.com>
Date:   Thu, 3 Sep 2020 16:51:13 -0300
Message-ID: <CAHkAS4ZME-iFCuqTOkZT8r7UUEaB-Wp49Btq5HEWtS4pFGFD2Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] media: Add support for the AM/FM radio chip KT0913
 from KT Micro.
To:     Joe Perches <joe@perches.com>
Cc:     linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Joe,
Thanks for the feedback.

On Thu, 3 Sep 2020 at 13:45, Joe Perches <joe@perches.com> wrote:
>
> On Mon, 2020-08-31 at 19:06 -0300, Santiago Hormazabal wrote:
> > This chip requires almost no support components and can used over I2C.
> > The driver uses the I2C bus and exposes the controls as a V4L2 radio.
> > Tested with a module that contains this chip (from SZZSJDZ.com,
> > part number ZJ-801B, even tho the company seems defunct now), and an H2+
> > AllWinner SoC running a kernel built off 07d999f of the media_tree.
>
> Thanks.
>
> style trivia:
>
> []
> > diff --git a/drivers/media/radio/radio-kt0913.c b/drivers/media/radio/radio-kt0913.c
> []
> > +static const struct reg_sequence kt0913_init_regs_to_defaults[] = {
> > +     /* Standby disabled, volume 0dB */
> > +     { KT0913_REG_RXCFG, 0x881f },
>
> These might be more legible on single lines,
> ignoring the 80 column limits.
>
> > +     /* FM Channel spacing = 50kHz, Right & Left unmuted */
> > +     { KT0913_REG_SEEK, 0x000b },
>
> etc...
>
I agree, didn't know I could exceed the limit in these situations.

> []
>
> > +static int __kt0913_set_fm_frequency(struct kt0913_device *radio,
> > +                                  unsigned int frequency)
> > +{
> > +     return regmap_write(radio->regmap, KT0913_REG_TUNE,
> > +             KT0913_TUNE_FMTUNE_ON | (frequency / KT0913_FMCHAN_MUL));
>
> It might be nicer to align multi-line statements to the
> open parenthesis.
>
Yes, that's totally true. What about these cases where the other part
of the lines would exceed 80 chars? For instance, if I align the
second line to the open parenthesis of the first line, I'll be past
the 80 chars limit. Splitting it back again to fit that would make the
code not so much readable.

> []
>
> > +static int __kt0913_set_au_gain(struct kt0913_device *radio, s32 gain)
> > +{
> > +     switch (gain) {
> > +     case 6:
> > +             return regmap_update_bits(radio->regmap,
> > +                     KT0913_REG_AMSYSCFG, KT0913_AMSYSCFG_AU_GAIN_MASK,
> > +                     KT0913_AMSYSCFG_AU_GAIN_6DB);
> > +     case 3:
> > +             return regmap_update_bits(radio->regmap,
> > +                     KT0913_REG_AMSYSCFG, KT0913_AMSYSCFG_AU_GAIN_MASK,
> > +                     KT0913_AMSYSCFG_AU_GAIN_3DB);
> > +     case 0:
> > +             return regmap_update_bits(radio->regmap,
> > +                     KT0913_REG_AMSYSCFG, KT0913_AMSYSCFG_AU_GAIN_MASK,
> > +                     KT0913_AMSYSCFG_AU_GAIN_0DB);
> > +     case -3:
> > +             return regmap_update_bits(radio->regmap,
> > +                     KT0913_REG_AMSYSCFG, KT0913_AMSYSCFG_AU_GAIN_MASK,
> > +                     KT0913_AMSYSCFG_AU_GAIN_MIN_3DB);
> > +     default:
> > +             return -EINVAL;
> > +     }
> > +}
>
> It's generally more legible to write this with an intermediate
> variable holding the changed value.  It's also most commonly
> smaller object code.
>
> static int __kt0913_set_au_gain(struct kt0913_device *radio, s32 gain)
> {
>         int val;
>
>         switch (gain) {
>         case 6:
>                 val = KT0913_AMSYSCFG_AU_GAIN_6DB;
>                 break;
>         case 3:
>                 val = KT0913_AMSYSCFG_AU_GAIN_3DB;
>                 break;
>         case 0:
>                 val = KT0913_AMSYSCFG_AU_GAIN_0DB;
>                 break;
>         case -3:
>                 val = KT0913_AMSYSCFG_AU_GAIN_MIN_3DB;
>                 break;
>         default:
>                 return -EINVAL;
>         }
>
>         return regmap_update_bits(radio->regmap, KT0913_REG_AMSYSCFG,
>                                   KT0913_AMSYSCFG_AU_GAIN_MASK, val);
> }
>
>
I agree, thanks for your feedback.

I'll wait for your reply to fix the other issue you've mentioned, and
I'll fix the others in the meantime.

Thanks!

- Santiago H.
