Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 43DAB15B61C
	for <lists+linux-media@lfdr.de>; Thu, 13 Feb 2020 01:48:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729428AbgBMAsQ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 12 Feb 2020 19:48:16 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:35753 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729103AbgBMAsP (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 12 Feb 2020 19:48:15 -0500
Received: by mail-vs1-f66.google.com with SMTP id x123so2842257vsc.2
        for <linux-media@vger.kernel.org>; Wed, 12 Feb 2020 16:48:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=etgnyDP0JhwByes0FkH9VjqAFbGnVuZCHaN9A7IERGE=;
        b=YAtGd5pbARBosER19TYDP6Dg2z2lMUUEtkvwJMw6zP1Uc42T3Yijun+bbQ6zEELW3y
         9Z4sybKlG12dvBgrXZT6bNhcdyPMnNjwI6r+3jGfxV+pyFMSenAQQPNZo/dNQ0qyTSaz
         b3BihOfWiAKVBmVH9UlT1HmzBXK2di/D/i3s7aqZMaET5TZu96ihMHmZhZw/PCFjYjJY
         nKrvsbjMo7tRCDAMGHs2Wb0ZUVySSxALo1eVrhyPw0mYyRL83jYrHKigUZd4zBELkqCn
         6716aCqC+n93E/nLTqdsYFbWmky9ZEopjSGKAvwdGbateX/nM2kXClZYN9Ntix43D6AJ
         G5JQ==
X-Gm-Message-State: APjAAAUG1pw6JWTXnx/UwutPNY/xKlnUgZalXFTuNMmSyJBPbdHpux3L
        1pGxKoko7O9V6BGvvsJYc9UiXtsWg1eiJOcuc6W1aLGg
X-Google-Smtp-Source: APXvYqxyLrMRahjmqKlywAUlwuEiKnatbf9XTuAHLPIGa7lzpNd+yjxbwMxtdex2DkLVIsbw24IzoYUO9Yx+8Mhm/RA=
X-Received: by 2002:a05:6102:3024:: with SMTP id v4mr772396vsa.220.1581554894555;
 Wed, 12 Feb 2020 16:48:14 -0800 (PST)
MIME-Version: 1.0
References: <20200209174937.22844-1-imirkin@alum.mit.edu> <20200209174937.22844-2-imirkin@alum.mit.edu>
 <3e56402b-9841-99a3-730c-b1fd2bc2cc5d@xs4all.nl> <CAKb7Uvj2XV0+tr48EetVE1e_Vqpr-2zQCnR7NCWagWnbCEcyeQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvj2XV0+tr48EetVE1e_Vqpr-2zQCnR7NCWagWnbCEcyeQ@mail.gmail.com>
From:   Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Wed, 12 Feb 2020 19:48:03 -0500
Message-ID: <CAKb7Uvh7XGK+y5rXdFVSA+JkYYNW7Pp1P1=0x0Yy6L0hgv0Rhg@mail.gmail.com>
Subject: Re: [PATCH 1/2] edid-decode: add function to enable usage as a library
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 10, 2020 at 9:58 AM Ilia Mirkin <imirkin@alum.mit.edu> wrote:
> On Mon, Feb 10, 2020 at 6:23 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
> > > +     for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
> > > +             s_msgs[i][0].clear();
> > > +             s_msgs[i][1].clear();
> > > +     }
> >
> > I'm pretty sure that this for loop is not necessary. Can you drop this
> > for loop and see if it works?
>
> The current code has:
>
> static void show_msgs(bool is_warn)
> {
>   printf("\n%s:\n\n", is_warn ? "Warnings" : "Failures");
>   for (unsigned i = 0; i < state.num_blocks; i++) {
>     if (s_msgs[i][is_warn].empty())
>       continue;
>     print-the-error
>
> What would prevent an error from a previous run to appear without an
> explicit clearing of s_msgs?

Hi Hans,

Do you agree with my assessment above?

  -ilia
