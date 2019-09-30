Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 50FE6C2056
	for <lists+linux-media@lfdr.de>; Mon, 30 Sep 2019 14:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730352AbfI3MGb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 30 Sep 2019 08:06:31 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:39970 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728214AbfI3MGa (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 30 Sep 2019 08:06:30 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8UC6R0p096091;
        Mon, 30 Sep 2019 07:06:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1569845188;
        bh=zfTEs4ijJTUqGGuCuLCj2ZRBbvInnJColLZXtXR91xc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=eiGf6nnC/e6TuIhw9868LrR/8FIVxqvLagovzrJt4K9BXszIvTjvvVH9zL4aLzPu0
         DDCOylveIYEIVgi99HT51YnvuYDaeTFh1AMvvopJgpju46YA9WMVQL5nc7poYkAc54
         5EXu7W8oxM6NqfzXZwDZJGQY8CV7SdP6OaPApuuQ=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8UC6R0L052716
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 30 Sep 2019 07:06:27 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 30
 Sep 2019 07:06:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 30 Sep 2019 07:06:18 -0500
Received: from ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with SMTP id x8UC6R1P026246;
        Mon, 30 Sep 2019 07:06:27 -0500
Date:   Mon, 30 Sep 2019 07:08:38 -0500
From:   Benoit Parrot <bparrot@ti.com>
To:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC:     Hans Verkuil <hverkuil@xs4all.nl>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [Patch v4 4/8] media: i2c: ov2659: fix s_stream return value
Message-ID: <20190930120838.vdmmglkbp226hhfq@ti.com>
References: <20190927184722.31989-1-bparrot@ti.com>
 <20190927184722.31989-5-bparrot@ti.com>
 <CA+V-a8t3h6+2a8QWKWNwROJRz546rGbUyXs5ez9wtH6AQ-euPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CA+V-a8t3h6+2a8QWKWNwROJRz546rGbUyXs5ez9wtH6AQ-euPA@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Lad, Prabhakar <prabhakar.csengg@gmail.com> wrote on Fri [2019-Sep-27 21:33:28 +0100]:
> Hi Benoit,
> 
> thank you for the patch.
> 
> On Fri, Sep 27, 2019 at 7:46 PM Benoit Parrot <bparrot@ti.com> wrote:
> >
> > In ov2659_s_stream() return value for invoked function should be checked
> > and propagated.
> >
> > Signed-off-by: Benoit Parrot <bparrot@ti.com>
> > ---
> >  drivers/media/i2c/ov2659.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/media/i2c/ov2659.c b/drivers/media/i2c/ov2659.c
> > index f77320e8a60d..cd4625432264 100644
> > --- a/drivers/media/i2c/ov2659.c
> > +++ b/drivers/media/i2c/ov2659.c
> > @@ -1187,10 +1187,13 @@ static int ov2659_s_stream(struct v4l2_subdev *sd, int on)
> >                 goto unlock;
> >         }
> >
> > -       ov2659_set_pixel_clock(ov2659);
> > -       ov2659_set_frame_size(ov2659);
> > -       ov2659_set_format(ov2659);
> > -       ov2659_set_streaming(ov2659, 1);
> > +       ret = ov2659_set_pixel_clock(ov2659);
> > +       if (!ret)
> > +               ret = ov2659_set_frame_size(ov2659);
> > +       if (!ret)
> > +               ret = ov2659_set_format(ov2659);
> > +       if (!ret)
> > +               ov2659_set_streaming(ov2659, 1);
> >         ov2659->streaming = on;
> >
> the "ov2659->streaming = on;" should only be set if above calls
> succeed, otherwise we might hit -EBUSY during set_fmt.

Thanks, good catch.

Benoit

> 
> Cheers,
> --Prabhakar Lad
> 
> >  unlock:
> > --
> > 2.17.1
> >
