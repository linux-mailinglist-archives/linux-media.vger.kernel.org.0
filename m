Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1B15195297
	for <lists+linux-media@lfdr.de>; Fri, 27 Mar 2020 09:09:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726168AbgC0IJJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 27 Mar 2020 04:09:09 -0400
Received: from mga12.intel.com ([192.55.52.136]:5075 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725946AbgC0IJJ (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 27 Mar 2020 04:09:09 -0400
IronPort-SDR: byQVSpgGCJSypZfLSkPIEm0ZWH110YDTn7InO0r1uWuNNmyXEBavycJUvLdc3BZIb3oQe430Fd
 lxd8CMAtuu0w==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2020 01:09:09 -0700
IronPort-SDR: 5J/RwyflbWm32w71GF4z5lmYGOl2kbe497SSuaCuBRRLLps1quezNfpbggSyq9bGdKLmHglGB0
 ujwe7da4WDxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; 
   d="scan'208";a="236561315"
Received: from jmikkola-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.252.32.179])
  by orsmga007.jf.intel.com with ESMTP; 27 Mar 2020 01:09:05 -0700
Received: by kekkonen.fi.intel.com (Postfix, from userid 1000)
        id DB1CE21F8C; Fri, 27 Mar 2020 10:08:58 +0200 (EET)
Date:   Fri, 27 Mar 2020 10:08:58 +0200
From:   Sakari Ailus <sakari.ailus@linux.intel.com>
To:     Dafna Hirschfeld <dafna3@gmail.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        linux-rockchip@lists.infradead.org, mchehab@kernel.org
Subject: Re: [PATCH 1/2] media: media.h: Add a pad flag MEDIA_PAD_FL_METADATA
Message-ID: <20200327080858.GB23713@kekkonen.localdomain>
References: <20200325212704.29862-1-dafna.hirschfeld@collabora.com>
 <20200325212704.29862-2-dafna.hirschfeld@collabora.com>
 <20200325222621.GX19171@pendragon.ideasonboard.com>
 <CAJ1myNS5jdqCXAtueA_j+ULkiioDxhegfCLQWFXrvL6_AYPwFg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJ1myNS5jdqCXAtueA_j+ULkiioDxhegfCLQWFXrvL6_AYPwFg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Dafna, Laurent,

On Thu, Mar 26, 2020 at 08:59:04AM +0100, Dafna Hirschfeld wrote:
> On Wed, Mar 25, 2020 at 11:26 PM Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
> >
> > Hi Dafna,
> >
> > Thank you for the patch.
> >
> > On Wed, Mar 25, 2020 at 10:27:03PM +0100, Dafna Hirschfeld wrote:
> > > Add a flag to the flags field of 'struct media_pad_desc'
> > > that indicates that the data transmitted by the pad is
> > > metadata.
> > >
> > > Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> > > ---
> > >  Documentation/media/uapi/mediactl/media-types.rst | 4 ++++
> > >  include/uapi/linux/media.h                        | 1 +
> > >  2 files changed, 5 insertions(+)
> > >
> > > diff --git a/Documentation/media/uapi/mediactl/media-types.rst b/Documentation/media/uapi/mediactl/media-types.rst
> > > index 3af6a414b501..4ca902478971 100644
> > > --- a/Documentation/media/uapi/mediactl/media-types.rst
> > > +++ b/Documentation/media/uapi/mediactl/media-types.rst
> > > @@ -361,6 +361,7 @@ Types and flags used to represent the media graph elements
> > >  .. _MEDIA-PAD-FL-SINK:
> > >  .. _MEDIA-PAD-FL-SOURCE:
> > >  .. _MEDIA-PAD-FL-MUST-CONNECT:
> > > +.. _MEDIA-PAD-FL-METADATA:
> > >
> > >  .. flat-table:: Media pad flags
> > >      :header-rows:  0
> > > @@ -381,6 +382,9 @@ Types and flags used to represent the media graph elements
> > >         configuration dependent) for the pad to need enabled links even
> > >         when this flag isn't set; the absence of the flag doesn't imply
> > >         there is none.
> > > +    *  -  ``MEDIA_PAD_FL_METADATA``
> > > +       -  This flag indicates that the data transmitted by the pad is of
> > > +          type metadata.
> > >
> > >
> > >  One and only one of ``MEDIA_PAD_FL_SINK`` and ``MEDIA_PAD_FL_SOURCE``
> > > diff --git a/include/uapi/linux/media.h b/include/uapi/linux/media.h
> > > index 383ac7b7d8f0..ae37226eb5c9 100644
> > > --- a/include/uapi/linux/media.h
> > > +++ b/include/uapi/linux/media.h
> > > @@ -210,6 +210,7 @@ struct media_entity_desc {
> > >  #define MEDIA_PAD_FL_SINK                    (1 << 0)
> > >  #define MEDIA_PAD_FL_SOURCE                  (1 << 1)
> > >  #define MEDIA_PAD_FL_MUST_CONNECT            (1 << 2)
> > > +#define MEDIA_PAD_FL_METADATA                        (1 << 3)
> >
> > I think we need to reserve a few bits here. We'll have more than
> > metadata. Audio comes to mind, there will likely be more. Having
> > independent flags would not only waste a bit of space in the bitfield
> > (not that we're about to run out of bits, but still), but would make it
> > possible to specify invalid configurations such as MEDIA_PAD_FL_METADATA
> > | MEDIA_PAD_FL_AUDIO. And now that I've written this, I realize that
> > audio metadata could be a thing, so maybe a metadata flag is actually
> > the best option :-)
> hehe, ok, but drivers that set the METADATA flag should also set the media
> bus code to MEDIA_BUS_FMT_FIXED ? If yes then setting
> the METADATA flag with a different media bus is also an invalid configuration.

That may be currently the case, but not all non-image data (metadata in
practice) will be using MEDIA_BUS_FMT_FIXED, for instance sensor embedded
data when we support that in upstream.

Note that whether metadata flows over a pad is dynamic configuration. I
wonder if it is useful to tell this to the user, as the user, in many
cases, will be making the configuration affecting this. There definitely
are devices where this configuration would be static, but many of those
cases (ISPs in particular) have DMAs (i.e. video nodes) directly connected
over a link, where you'll find this information on the video node.

-- 
Regards,

Sakari Ailus
