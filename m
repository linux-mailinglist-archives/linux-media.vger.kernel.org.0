Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC0842D11E
	for <lists+linux-media@lfdr.de>; Thu, 14 Oct 2021 05:42:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229879AbhJNDok (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 13 Oct 2021 23:44:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbhJNDof (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 13 Oct 2021 23:44:35 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C94AC061570
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 20:42:31 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id e3so14798815wrc.11
        for <linux-media@vger.kernel.org>; Wed, 13 Oct 2021 20:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m2aRTXe2s81klySchIi3SE+VhuabQcj8xs794ppICSA=;
        b=cUSlLRP8lX9uh6dlrvhQ042jvEuIFDQLBHOF/Ut0bzxBSiFdln0tt2BdTGN981nZFh
         TteYR0FqjBYnpK426cqp6pD1XrmgXGrV8YNJXu9NrDrJ0S8KGQc/vfUt+xYK0BPFfqQH
         WdG+Y1jyB9NIfE/+1iNBo466/yI7Y3aH0Fi2twBsoxb+kBwtKjhCO34smrqwWIoqjrZn
         q0porxQvUyJDxTQ8qKCG0n+SHS0fdxx1/f1LLLZsIc73deHTI8nT6Bn5Hma6a0jCNhWO
         mmga10IQbOtVKYOmZXrXQw62tSxpyajL1ExG38kTCvHr2XH+fiy1FCmK5M3XAGALFceb
         13dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m2aRTXe2s81klySchIi3SE+VhuabQcj8xs794ppICSA=;
        b=V+N+lnuV0zikJbG208qWuupzsgOWTKGy0eOqoYBMbj9Vqqx3sx2GSr+G+NsufkyHKy
         xocIuP8rDdDlf96SUp/h8qv5DvgbQgwzC0q/sfZDu1AtG1aQz/cbNDQFsarTRhdaNNIg
         Jl9dwuUafga5UBO0G3VgbEG7FwC+MDIDIKZ+xTtnh0GEEyqlqIQegWr+CF7ijS7Ea2ws
         hSqhXpEX23+hTvhBvq1MLOG8bQajX/q5qdzNF7J+v+X3ZLOfP9nhDMZusIIvTNDr0ZIf
         iVYr99v66yMRU6pZu8CQdNW2RJMQzNjDNhZeQULudwkmQyx3yQ7p5Nyxq72qENLkCBXr
         S0YA==
X-Gm-Message-State: AOAM530/S8+aRfnbNYHxh753oWEe3uBQXCCVH/ZItngGZ1pyMSWrk+/U
        9U9UtCB9e5bUHU9GtqNCUq/WC1dG+rjenOPdL9RKZnl8Hm8=
X-Google-Smtp-Source: ABdhPJxkbcebIEeA9LQUfEFP0MTDB020zRGlrGe5Xy3AwBESpQB3Rbm7r1n3xFGQ2jH0wOP1fX7Z/inrNJGoEvb55Wo=
X-Received: by 2002:a05:600c:19d0:: with SMTP id u16mr3225174wmq.154.1634182949844;
 Wed, 13 Oct 2021 20:42:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211005202019.253353-1-jeanmichel.hautbois@ideasonboard.com>
 <YVy7U7rzUU/+PMaa@pendragon.ideasonboard.com> <DM8PR11MB5653A4E1236537665228B14299B59@DM8PR11MB5653.namprd11.prod.outlook.com>
In-Reply-To: <DM8PR11MB5653A4E1236537665228B14299B59@DM8PR11MB5653.namprd11.prod.outlook.com>
From:   Tomasz Figa <tfiga@google.com>
Date:   Thu, 14 Oct 2021 12:42:13 +0900
Message-ID: <CAAFQd5Do85AxDrdQARaKgMjhN1fq-zFdYostFL1bO-KLOmiHBg@mail.gmail.com>
Subject: Re: [PATCH v2] media: staging: ipu3-imgu: add the AWB memory layout
To:     "Cao, Bingbu" <bingbu.cao@intel.com>
Cc:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>,
        "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
        "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Oct 11, 2021 at 12:30 PM Cao, Bingbu <bingbu.cao@intel.com> wrote:
>
> All,
>
> ________________________
> BRs,
> Bingbu Cao
>
> > -----Original Message-----
> > From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Sent: Wednesday, October 6, 2021 4:54 AM
> > To: Jean-Michel Hautbois <jeanmichel.hautbois@ideasonboard.com>
> > Cc: linux-media@vger.kernel.org; sakari.ailus@linux.intel.com; Cao,
> > Bingbu <bingbu.cao@intel.com>; tfiga@google.com; Qiu, Tian Shu
> > <tian.shu.qiu@intel.com>
> > Subject: Re: [PATCH v2] media: staging: ipu3-imgu: add the AWB memory
> > layout
> >
> > Hi Jean-Michel,
> >
> > Thank you for the patch.
> >
> > On Tue, Oct 05, 2021 at 10:20:19PM +0200, Jean-Michel Hautbois wrote:
> > > While parsing the RAW AWB metadata, the AWB layout was missing to
> > > fully understand which byte corresponds to which feature. Make the
> > > field names and usage explicit, as it is used by the userspace
> > applications.
> > >
> > > Signed-off-by: Jean-Michel Hautbois
> > > <jeanmichel.hautbois@ideasonboard.com>
> > > ---
> > >  .../media/ipu3/include/uapi/intel-ipu3.h      | 32 ++++++++++++++++---
> > >  1 file changed, 27 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > > b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > > index 585f55981c86..ad116a912e44 100644
> > > --- a/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > > +++ b/drivers/staging/media/ipu3/include/uapi/intel-ipu3.h
> > > @@ -61,17 +61,39 @@ struct ipu3_uapi_grid_config {
> > >     __u16 y_end;
> > >  } __packed;
> > >
> > > +/**
> > > + * struct ipu3_uapi_awb_set_item - Memory layout for each cell in AWB
> > > + *
> > > + * @Gr_avg:        Green average for red lines in the cell.
> > > + * @R_avg: Red average in the cell.
> > > + * @B_avg: Blue average in the cell.
> > > + * @Gb_avg:        Green average for blue lines in the cell.
> > > + * @sat_ratio:  Percentage of pixels over a given threshold set in
> >
> > s/over a given threshold set in/over the thresholds specified in/
> >
> > Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >
> > I would still like a review from someone knowledgeable with the hardware
> > and firmware, as we're partly guessing here.
>
> Reviewed-by: Bingbu Cao <bingbu.cao@intel.com>
>
> I have no concern on this patch, I think it has minor impact on user-space
> implementation from this change. Tomasz, do you have any comment on this?
>

No, looks fine to me as well. Thanks!
(We'll have to update our userspace when we pick this, but it should
be trivial.)

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

>
> >
> > > + *                 ipu3_uapi_awb_config_s, coded from 0 to 255.
> > > + * @padding0:   Unused byte for padding.
> > > + * @padding1:   Unused byte for padding.
> > > + * @padding2:   Unused byte for padding.
> > > + */
> > > +struct ipu3_uapi_awb_set_item {
> > > +   __u8 Gr_avg;
> > > +   __u8 R_avg;
> > > +   __u8 B_avg;
> > > +   __u8 Gb_avg;
> > > +   __u8 sat_ratio;
> > > +   __u8 padding0;
> > > +   __u8 padding1;
> > > +   __u8 padding2;
> > > +} __attribute__((packed));
> > > +
> > >  /*
> > >   * The grid based data is divided into "slices" called set, each slice
> > of setX
> > >   * refers to ipu3_uapi_grid_config width * height_per_slice.
> > >   */
> > >  #define IPU3_UAPI_AWB_MAX_SETS                             60
> > >  /* Based on grid size 80 * 60 and cell size 16 x 16 */
> > > -#define IPU3_UAPI_AWB_SET_SIZE                             1280
> > > -#define IPU3_UAPI_AWB_MD_ITEM_SIZE                 8
> > > +#define IPU3_UAPI_AWB_SET_SIZE                             160
> > >  #define IPU3_UAPI_AWB_SPARE_FOR_BUBBLES \
> > > -   (IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES * \
> > > -    IPU3_UAPI_AWB_MD_ITEM_SIZE)
> > > +   (IPU3_UAPI_MAX_BUBBLE_SIZE * IPU3_UAPI_MAX_STRIPES)
> > >  #define IPU3_UAPI_AWB_MAX_BUFFER_SIZE \
> > >     (IPU3_UAPI_AWB_MAX_SETS * \
> > >      (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES)) @@
> > > -83,7 +105,7 @@ struct ipu3_uapi_grid_config {
> > >   *         the average values for each color channel.
> > >   */
> > >  struct ipu3_uapi_awb_raw_buffer {
> > > -   __u8 meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> > > +   struct ipu3_uapi_awb_set_item
> > > +meta_data[IPU3_UAPI_AWB_MAX_BUFFER_SIZE]
> > >             __attribute__((aligned(32)));
> > >  } __packed;
> > >
> >
> > --
> > Regards,
> >
> > Laurent Pinchart
