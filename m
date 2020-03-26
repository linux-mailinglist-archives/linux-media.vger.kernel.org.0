Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0587B193A06
	for <lists+linux-media@lfdr.de>; Thu, 26 Mar 2020 08:59:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726354AbgCZH7W (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 26 Mar 2020 03:59:22 -0400
Received: from mail-vs1-f68.google.com ([209.85.217.68]:45135 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726279AbgCZH7W (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 26 Mar 2020 03:59:22 -0400
Received: by mail-vs1-f68.google.com with SMTP id x82so3235516vsc.12
        for <linux-media@vger.kernel.org>; Thu, 26 Mar 2020 00:59:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vAZVBkLRGJv2oi7jAEMUOJOw1QJGaYnHQ3j5Oreu2eQ=;
        b=HIBSzf0kp1JOCdIHwbzrxJIp0gczavqFHolfxguS51Vchs+kq69J+0W5f1aZMEQBHO
         NY+6LWD9XAQlVhK3LcG5TwDSoKVlUpyV489LMU8SDyAkECnM+PP78uEATInZ6c2TnaqU
         0zw/OTx7zDJWQPZz9ApysvJeTYe62MwzrL872Qht+YfliPdS7U3julxjT9PXUba3wgUt
         j0pWCG4u1M97aa7iaUL79sGFLWduK24EXo0SXEiM6pAA1PUs6I13wWkrubu7s9yG0GXn
         hFvPnUdTicQ0fcaVtjwoLdfBshHAslg1xx6cp2+URy8ECGly24YHbfqWaG9rTC8/16A1
         zJUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vAZVBkLRGJv2oi7jAEMUOJOw1QJGaYnHQ3j5Oreu2eQ=;
        b=rzj5rnvNsiZcuapyrN/C0RG1DuQtft6fFyGN9ChsXfgDuJNclIuGwChtwIV2424ypn
         tVDOL0HfAWCNt7JH/B6jHJxlYqXF3iJAeTHc8ZiM6ft6oWgReC4eJR3NgVN0B3ZoRngT
         B3QgTmTB1RKS3gh5C5sPpQPH3IoIN1vbqJ9qSmNbgp8lWoIJHII1nQZ/k+WHEbN8lyQy
         /Xppky4fqfrXE5d6RaGiqwd+clxejSTPYHBDzqOyt922+vOH1BV0wpVNa5CYDhejUI6F
         pOaKe5kd/iM7BBA238Ubhwx6mSdjgCaNF1bbySx80weXFkCPBmn409yBAdP3N2+YbSr/
         fqYw==
X-Gm-Message-State: ANhLgQ11bOFZw5oxz9OFUCa81yATrPaK5FzO/i6ZDHdAbe/l1Ns5OxFp
        uSMIc0MPEN6CmBwNXUJEP4hAjSulA61BChm6Q2Rln7MvGWb+uw==
X-Google-Smtp-Source: ADFU+vv/iFVGhwlsjW0K//ZMHGngT1zNGabMUSLzJvS065QB3oQR4Nu5hcEEObb2LGivsMgaPCf3lXNcGM0O7mkZq5U=
X-Received: by 2002:a67:fad8:: with SMTP id g24mr5490268vsq.136.1585209560880;
 Thu, 26 Mar 2020 00:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
 <20200325212704.29862-2-dafna.hirschfeld@collabora.com> <20200325222621.GX19171@pendragon.ideasonboard.com>
In-Reply-To: <20200325222621.GX19171@pendragon.ideasonboard.com>
From:   Dafna Hirschfeld <dafna3@gmail.com>
Date:   Thu, 26 Mar 2020 08:59:04 +0100
Message-ID: <CAJ1myNS5jdqCXAtueA_j+ULkiioDxhegfCLQWFXrvL6_AYPwFg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: media.h: Add a pad flag MEDIA_PAD_FL_METADATA
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        sakari.ailus@linux.intel.com, linux-rockchip@lists.infradead.org,
        mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Mar 25, 2020 at 11:26 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Dafna,
>
> Thank you for the patch.
>
> On Wed, Mar 25, 2020 at 10:27:03PM +0100, Dafna Hirschfeld wrote:
> > Add a flag to the flags field of 'struct media_pad_desc'
> > that indicates that the data transmitted by the pad is
> > metadata.
> >
> > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > ---
> >  Documentation/media/uapi/mediactl/media-types.rst | 4 ++++
> >  include/uapi/linux/media.h                        | 1 +
> >  2 files changed, 5 insertions(+)
> >
> > diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
> > index 3af6a414b501..4ca902478971 100644
> > --- a/Documentation/media/uapi/mediactl/media-types.rst
> > +++ b/Documentation/media/uapi/mediactl/media-types.rst
> > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> >  .. _MEDIA-PAD-FL-SINK:
> >  .. _MEDIA-PAD-FL-SOURCE:
> >  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > +.. _MEDIA-PAD-FL-METADATA:
> >
> >  .. flat-table:: Media pad flags
> >      :header-rows:  0
> > @@ -381,6 +382,9 @@ Types and flags used to represent the media graph elements
> >         configuration dependent) for the pad to need enabled links even
> >         when this flag isn't set; the absence of the flag doesn't imply
> >         there is none.
> > +    *  -  ``MEDIA_PAD_FL_METADATA``
> > +       -  This flag indicates that the data transmitted by the pad is of
> > +          type metadata.
> >
> >
> >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > index 383ac7b7d8f0..ae37226eb5c9 100644
> > --- a/include/uapi/linux/media.h
> > +++ b/include/uapi/linux/media.h
> > @@ -210,6 +210,7 @@ struct media_entity_desc {
> >  #define MEDIA_PAD_FL_SINK                    (1 << 0)
> >  #define MEDIA_PAD_FL_SOURCE                  (1 << 1)
> >  #define MEDIA_PAD_FL_MUST_CONNECT            (1 << 2)
> > +#define MEDIA_PAD_FL_METADATA                        (1 << 3)
>
> I think we need to reserve a few bits here. We'll have more than
> metadata. Audio comes to mind, there will likely be more. Having
> independent flags would not only waste a bit of space in the bitfield
> (not that we're about to run out of bits, but still), but would make it
> possible to specify invalid configurations such as MEDIA_PAD_FL_METADATA
> | MEDIA_PAD_FL_AUDIO. And now that I've written this, I realize that
> audio metadata could be a thing, so maybe a metadata flag is actually
> the best option :-)
hehe, ok, but drivers that set the METADATA flag should also set the media
bus code to MEDIA_BUS_FMT_FIXED ? If yes then setting
the METADATA flag with a different media bus is also an invalid configuration.

>
> There are pros and cons for both options, so I won't recommend one.
>
> >  struct media_pad_desc {
> >       __u32 entity;           /* entity ID */
>
> --
> Regards,
>
> Laurent Pinchart
