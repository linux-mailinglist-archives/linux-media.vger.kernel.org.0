Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7734157E02
	for <lists+linux-media@lfdr.de>; Mon, 10 Feb 2020 15:59:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728456AbgBJO7K (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Feb 2020 09:59:10 -0500
Received: from mail-vk1-f195.google.com ([209.85.221.195]:33540 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727347AbgBJO7J (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Feb 2020 09:59:09 -0500
Received: by mail-vk1-f195.google.com with SMTP id i78so1864491vke.0
        for <linux-media@vger.kernel.org>; Mon, 10 Feb 2020 06:59:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BeQBOQvCB6XIPARt3WwEMO3Q9k1XbFIIU7Fr59gB6/U=;
        b=mM9KbXERFGKlG4rCG2gxmo+zqYEHbo2STfNxI4BJhN0XZC6z7KG4qOj3rQVOqldG/x
         7ztodOJ1WtblVfVkH0G3Y08sHzKv7mhy1lISToi3L5tJKZRfM3jhtU0LgKHlB6eWrApM
         yFoOZQBw1ElzhYHksIzkOpJAqJonsg2kpKgCvtFZttCo41bNgq1KH+pJBMH75D0WgeZP
         gvZY9YDqdzhXRIWC5yLjUkwZlCsgYhgwYedDMl4Hr9DFo3lMwV7n3N/fjNu9knzjfviB
         IbifS3iIk+etklC0+L6SUOzLob9MMVVC1Cn6T995HHpSqmeM0wo/+UznVgZwzxp4SJjj
         CDhQ==
X-Gm-Message-State: APjAAAU8+jc3lXwygGVgMsdqsvGGYY0BdraxYZEuKfkdNblG7BGtFWIu
        uZ35VAWa/wzR0ULH0cefok9/32zuI9+OQBmZFbU=
X-Google-Smtp-Source: APXvYqymD3dsBQ1Eab25XpL+otfwau70M3nQnbuKBpibxBbcMSSvC7Z0hGtt/s2KENiHGQrOMxQBhJRu01ACLEHvVXQ=
X-Received: by 2002:a1f:ea04:: with SMTP id i4mr931385vkh.94.1581346748803;
 Mon, 10 Feb 2020 06:59:08 -0800 (PST)
MIME-Version: 1.0
References: <20200209174937.22844-1-imirkin@alum.mit.edu> <20200209174937.22844-2-imirkin@alum.mit.edu>
 <3e56402b-9841-99a3-730c-b1fd2bc2cc5d@xs4all.nl>
In-Reply-To: <3e56402b-9841-99a3-730c-b1fd2bc2cc5d@xs4all.nl>
From:   Ilia Mirkin <imirkin@alum.mit.edu>
Date:   Mon, 10 Feb 2020 09:58:57 -0500
Message-ID: <CAKb7Uvj2XV0+tr48EetVE1e_Vqpr-2zQCnR7NCWagWnbCEcyeQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] edid-decode: add function to enable usage as a library
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Feb 10, 2020 at 6:23 AM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:
>
> Hi Ilia,
>
> I pushed my patch to initialize edid_state in the constructor to the
> edid-decode git repo.

Hmm... I thought it should already work before that. Things should get
zero-initialized in C++ constructors. There are some subtleties with
PODs though, but I don't think they apply here. But it's been a while
since I've looked at those C++ details, and your update constructor
definitely doesn't hurt.

>
> I've also split off the 'write to a file' part from edid_from_file into
> a separate edid_to_file function, so you'll have to rebase your patch.

Will do.

>
> Two comments below:
>
> On 2/9/20 6:49 PM, Ilia Mirkin wrote:
> > This is helpful for an emscripten setup, as there's no great way to
> > reinitialize the object from scratch.
> >
> > Signed-off-by: Ilia Mirkin <imirkin@alum.mit.edu>
> > ---
> >  edid-decode.cpp | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> >
> > diff --git a/edid-decode.cpp b/edid-decode.cpp
> > index ef50da2..fd17bc6 100644
> > --- a/edid-decode.cpp
> > +++ b/edid-decode.cpp
> > @@ -1005,3 +1005,21 @@ int main(int argc, char **argv)
> >               return edid_from_file(argv[optind], argv[optind + 1], out_fmt);
> >       return ret ? ret : state.parse_edid();
> >  }
> > +
> > +#ifdef __EMSCRIPTEN__
> > +/*
> > + * The surrounding JavaScript implementation will call this function
> > + * each time it wants to decode an EDID. So this should reset all the
> > + * state and start over.
> > + */
> > +extern "C" int parse_edid(const char *input) {
>
> '{' should start on the next line. Let's keep the coding style consistent.

Right, my bad.

>
> > +     for (unsigned i = 0; i < EDID_MAX_BLOCKS + 1; i++) {
> > +             s_msgs[i][0].clear();
> > +             s_msgs[i][1].clear();
> > +     }
>
> I'm pretty sure that this for loop is not necessary. Can you drop this
> for loop and see if it works?

The current code has:

static void show_msgs(bool is_warn)
{
  printf("\n%s:\n\n", is_warn ? "Warnings" : "Failures");
  for (unsigned i = 0; i < state.num_blocks; i++) {
    if (s_msgs[i][is_warn].empty())
      continue;
    print-the-error

What would prevent an error from a previous run to appear without an
explicit clearing of s_msgs?

>
> > +     options[OptCheck] = 1;
> > +     state = edid_state();
> > +     int ret = edid_from_file(input, NULL, OUT_FMT_DEFAULT);
> > +     return ret ? ret : state.parse_edid();
> > +}
> > +#endif
> >
>
> Regards,
>
>         Hans
