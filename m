Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DFE39197C20
	for <lists+linux-media@lfdr.de>; Mon, 30 Mar 2020 14:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730159AbgC3Mmz (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Mar 2020 08:42:55 -0400
Received: from mail-ua1-f67.google.com ([209.85.222.67]:39936 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729596AbgC3Mmz (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Mar 2020 08:42:55 -0400
Received: by mail-ua1-f67.google.com with SMTP id t20so6180024uao.7
        for <linux-media@vger.kernel.org>; Mon, 30 Mar 2020 05:42:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=P3f4QjzoEWzmPU05IvrxEoxBeA07POXomzrQs7ckUag=;
        b=qQiSZlqtGJ+OAaLNVbDwPrvmGxTADLHjhq1QYUlzJju4zAaUV58ZMjk5h3nS7Yqbij
         GgkJ4RTDf3uqyu1E7d66PIM1OaVY08dxlJnyoZ+8nJ123L9ILH4z/FbdIFriO4/thubV
         Pqipl11ocX3Cv1QL69rxRRr4B5q6n7NSnpAJEzJ1w8z+T6rsnGHhxDwAQT9eT9BGJHib
         /IUQ/v3Dus7D2i1vB3B1V3JZFnkNOLAub7ze/fFPbYtFkwB6XgsBT1nN/eeIP5cCKSm7
         zHjI9AmfVIKw0dhNUr5zDrN+iGB0T7Ej8hRbvWBxSzaseGo5IOj/5Hqdh3VoIiVNNDH1
         iPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=P3f4QjzoEWzmPU05IvrxEoxBeA07POXomzrQs7ckUag=;
        b=LGKaYma+QgIl1I6GVp2+TpAdSM3eMQPpdHVguZPZSzMqWM/GrWtOfayBoq5bLmS7bS
         +RKnZjXcrsYmeyyj/uLRkQY370gmUxBBYf5kC8Z6DwTn1GDZBsBXJCl79F5a1CSlZ5eX
         lgC7WiWEx6J5d0KeUsHE3D81bNSitMo3/RyI3sIn9SOghV2uzOYK1TERDQWbY7hhWqk5
         tt040FrX01qRkFyGzwXT6XhWBj04LKp3tQWMNUb5oC49vwKf4jL16eRrieiA+Q4q8riy
         cSzzAuzhLVYIAFosK+qlNYJclGCIyAzU5sYeJr/bxHLZjmoHqRuzbvf/Fcz2UTxmuBzF
         HGlg==
X-Gm-Message-State: AGi0PubyPMYbbRZsQlbbUx7FSleUPC4v+cVjM7uqsksqqwJJfyjA/Vsk
        9tonHdZpi2McGwQ2esui8s9U6sndy/wKfV0OZwA=
X-Google-Smtp-Source: APiQypIW7gw0WKHdd0Vi7T7ZBRFpFLq8eGa1tFtQDMXmL2dpB7wRKz3+sDskCORE9TPjj1DN9S+CfVLOt1G5Z/3RwIM=
X-Received: by 2002:a9f:300a:: with SMTP id h10mr7430092uab.91.1585572174156;
 Mon, 30 Mar 2020 05:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
 <20200325212704.29862-2-dafna.hirschfeld@collabora.com> <20200325222621.GX19171@pendragon.ideasonboard.com>
 <CAJ1myNS5jdqCXAtueA_j+ULkiioDxhegfCLQWFXrvL6_AYPwFg@mail.gmail.com> <20200327080858.GB23713@kekkonen.localdomain>
In-Reply-To: <20200327080858.GB23713@kekkonen.localdomain>
From:   Dafna Hirschfeld <dafna3@gmail.com>
Date:   Mon, 30 Mar 2020 14:42:37 +0200
Message-ID: <CAJ1myNTT8NGNpSU10pwjd6wTES22g28dNFLwRPjrYkNsXd_D5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: media.h: Add a pad flag MEDIA_PAD_FL_METADATA
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Fri, Mar 27, 2020 at 9:09 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> Dafna, Laurent,
>
> On Thu, Mar 26, 2020 at 08:59:04AM +0100, Dafna Hirschfeld wrote:
> > On Wed, Mar 25, 2020 at 11:26 PM Laurent Pinchart
> > <laurent.pinchart@ideasonboard.com> wrote:
> > >
> > > Hi Dafna,
> > >
> > > Thank you for the patch.
> > >
> > > On Wed, Mar 25, 2020 at 10:27:03PM +0100, Dafna Hirschfeld wrote:
> > > > Add a flag to the flags field of 'struct media_pad_desc'
> > > > that indicates that the data transmitted by the pad is
> > > > metadata.
> > > >
> > > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > > ---
> > > >  Documentation/media/uapi/mediactl/media-types.rst | 4 ++++
> > > >  include/uapi/linux/media.h                        | 1 +
> > > >  2 files changed, 5 insertions(+)
> > > >
> > > > diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
> > > > index 3af6a414b501..4ca902478971 100644
> > > > --- a/Documentation/media/uapi/mediactl/media-types.rst
> > > > +++ b/Documentation/media/uapi/mediactl/media-types.rst
> > > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > > >  .. _MEDIA-PAD-FL-SINK:
> > > >  .. _MEDIA-PAD-FL-SOURCE:
> > > >  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > > +.. _MEDIA-PAD-FL-METADATA:
> > > >
> > > >  .. flat-table:: Media pad flags
> > > >      :header-rows:  0
> > > > @@ -381,6 +382,9 @@ Types and flags used to represent the media graph elements
> > > >         configuration dependent) for the pad to need enabled links even
> > > >         when this flag isn't set; the absence of the flag doesn't imply
> > > >         there is none.
> > > > +    *  -  ``MEDIA_PAD_FL_METADATA``
> > > > +       -  This flag indicates that the data transmitted by the pad is of
> > > > +          type metadata.
> > > >
> > > >
> > > >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > > > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > > > index 383ac7b7d8f0..ae37226eb5c9 100644
> > > > --- a/include/uapi/linux/media.h
> > > > +++ b/include/uapi/linux/media.h
> > > > @@ -210,6 +210,7 @@ struct media_entity_desc {
> > > >  #define MEDIA_PAD_FL_SINK                    (1 << 0)
> > > >  #define MEDIA_PAD_FL_SOURCE                  (1 << 1)
> > > >  #define MEDIA_PAD_FL_MUST_CONNECT            (1 << 2)
> > > > +#define MEDIA_PAD_FL_METADATA                        (1 << 3)
> > >
> > > I think we need to reserve a few bits here. We'll have more than
> > > metadata. Audio comes to mind, there will likely be more. Having
> > > independent flags would not only waste a bit of space in the bitfield
> > > (not that we're about to run out of bits, but still), but would make it
> > > possible to specify invalid configurations such as MEDIA_PAD_FL_METADATA
> > > | MEDIA_PAD_FL_AUDIO. And now that I've written this, I realize that
> > > audio metadata could be a thing, so maybe a metadata flag is actually
> > > the best option :-)
> > hehe, ok, but drivers that set the METADATA flag should also set the media
> > bus code to MEDIA_BUS_FMT_FIXED ? If yes then setting
> > the METADATA flag with a different media bus is also an invalid configuration.
>
> That may be currently the case, but not all non-image data (metadata in
> practice) will be using MEDIA_BUS_FMT_FIXED, for instance sensor embedded
> data when we support that in upstream.
>
> Note that whether metadata flows over a pad is dynamic configuration. I
> wonder if it is useful to tell this to the user, as the user, in many
> cases, will be making the configuration affecting this. There definitely

Hi, you mean that there might be pads that can either support metadata
or non-metadata?
Currently there is no media bus for METDATA so with the flag userspace
knows it is metadata.

> are devices where this configuration would be static, but many of those
> cases (ISPs in particular) have DMAs (i.e. video nodes) directly connected
> over a link, where you'll find this information on the video node.

>
> --
> Regards,
>
> Sakari Ailus
