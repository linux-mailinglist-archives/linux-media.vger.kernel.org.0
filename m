Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 954A91F5BF3
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 21:28:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgFJT2S (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 15:28:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726828AbgFJT2R (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 15:28:17 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 262C0C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:28:16 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id p20so3849880ejd.13
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5e8lB/A/P9Ex4LqZYnCtNcCafDSvzA9cq73cxO5JAxY=;
        b=dAmLY/VclUMP/ZQH3aZAD64rv42wM9O9MwoV1/8fmaVJ9Ui5aW4LUTr7KRuMlkct36
         JfIez8imV19Wh/01gR+hMHbYRe4m1kGtpxDzzr8bMr40AKgdK0VM7ykbpiB+UGqqNRR3
         q0GxmvQlfa3bRY3TAIYcVDreYAgk00KS8HHHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5e8lB/A/P9Ex4LqZYnCtNcCafDSvzA9cq73cxO5JAxY=;
        b=jQt07Of5PvpvMJimq1+0nnhmB1VXyhtyOhA9ppgHzePlGpcbJwCTGkOshUWuHabag+
         Ot780nFghl6q7Kj4CC7ppTd3WEp5Q4okt/zmiak1amNoCbgmlw/tuEfwHsqJAkBIM3DS
         U9v4JkHS/F3gI6/Id5rxpIZQV7XdRsLHfe62N2t5RfSgs+7eFA4SffYCaPRfcL9Makx8
         NOXhjYIyk/dGeTjpUgOE2HzUgZJl8QaPXGaO60CXaB0avjbd+sttn36LqM2CEclMwJO7
         zuSXYid4YYJ2YLq/Dz6RtxR3jy3xF8mfDfomwnpxpIufp8twpK/aOXBs89Ejq16WcIfG
         hB+A==
X-Gm-Message-State: AOAM5338juAsRMy9sPvOMKVgRca86EIZkbCyyUIQTdppvK0wqSIAsxM8
        QC6nkJ2VzKEZMIUPbLkx0ReAPIaiEvrUxw==
X-Google-Smtp-Source: ABdhPJwLgcTXyinKVZkqmNy8/4PdXQhU5nuaiKVEw35j5G2qHH3uJ2ukSLGM05XZnG1VwQa8vznNgQ==
X-Received: by 2002:a17:906:138b:: with SMTP id f11mr4823301ejc.288.1591817294324;
        Wed, 10 Jun 2020 12:28:14 -0700 (PDT)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id b24sm317168edw.70.2020.06.10.12.28.13
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 12:28:13 -0700 (PDT)
Received: by mail-wm1-f54.google.com with SMTP id l26so2892027wme.3
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 12:28:13 -0700 (PDT)
X-Received: by 2002:a7b:c2a9:: with SMTP id c9mr4028401wmk.11.1591817293038;
 Wed, 10 Jun 2020 12:28:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200609152825.24772-1-dafna.hirschfeld@collabora.com>
 <20200609152825.24772-2-dafna.hirschfeld@collabora.com> <20200610171511.GD201868@chromium.org>
 <bf42a283-7aa5-330e-8a50-8bf7680cbd1f@collabora.com> <bb5576b1-7bfb-7911-004c-8fa1b4e1603c@collabora.com>
In-Reply-To: <bb5576b1-7bfb-7911-004c-8fa1b4e1603c@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 21:28:00 +0200
X-Gmail-Original-Message-ID: <CAAFQd5BMHX_kTr4CWnjB=Lbdzmg+8uFEeW5qVKitMQZ8EkZf5g@mail.gmail.com>
Message-ID: <CAAFQd5BMHX_kTr4CWnjB=Lbdzmg+8uFEeW5qVKitMQZ8EkZf5g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: staging: rkisp1: rsz: supported formats are
 the isp's src formats, not sink formats
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 9:00 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 10.06.20 20:36, Dafna Hirschfeld wrote:
> >
> >
> > On 10.06.20 19:15, Tomasz Figa wrote:
> >> Hi Dafna,
> >>
> >> On Tue, Jun 09, 2020 at 05:28:22PM +0200, Dafna Hirschfeld wrote:
> >>> The rkisp1_resizer's enum callback 'rkisp1_rsz_enum_mbus_code'
> >>> calls the enum callback of the 'rkisp1_isp' on it's video sink pad.
> >>> This is a bug, the resizer should support the same formats
> >>> supported by the 'rkisp1_isp' on the source pad (not the sink pad).
> >>>
> >>> Fixes: 56e3b29f9f6b "media: staging: rkisp1: add streaming paths"
> >>>
> >>> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> >>> Acked-by: Helen Koike <helen.koike@collabora.com>
> >>> ---
> >>>   drivers/staging/media/rkisp1/rkisp1-resizer.c | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>
> >> Thank you for the patch. Please see my comments inline.
> >>
> >>> diff --git a/drivers/staging/media/rkisp1/rkisp1-resizer.c b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >>> index d049374413dc..d64c064bdb1d 100644
> >>> --- a/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >>> +++ b/drivers/staging/media/rkisp1/rkisp1-resizer.c
> >>> @@ -437,8 +437,8 @@ static int rkisp1_rsz_enum_mbus_code(struct v4l2_subdev *sd,
> >>>       u32 pad = code->pad;
> >>>       int ret;
> >>> -    /* supported mbus codes are the same in isp sink pad */
> >>> -    code->pad = RKISP1_ISP_PAD_SINK_VIDEO;
> >>> +    /* supported mbus codes are the same in isp video src pad */
> >>> +    code->pad = RKISP1_ISP_PAD_SOURCE_VIDEO;
> >>>       ret = v4l2_subdev_call(&rsz->rkisp1->isp.sd, pad, enum_mbus_code,
> >>>                      &dummy_cfg, code);
> >>
> >> Actually, is this really the true? AFAIR the ISP itself can only output
> >> either Bayer or YUV 4:2:2. The resizer can take YUV 4:2:2 at its input
> >> and output YUV 4:4:4, 4:2:2 and 4:2:0. Bayer capture is handled with
> >> resizer bypass mode. We haven't tested that, but if implemented, it
> >> should probably be done by exposing a link between the ISP entity and a
> >> video node directly, without the resizer involved.
> >>
> >> WDYT?
> >
> > We can also implement it that way. Only the mainpath needs
> > a direct link from the isp since selfpath does not support bayer formats.
> > It makes it easier on userspace for bayer formats since it does not have to
> > configure the resizer.
> > On the other hand if the format is YUV it has the option
> > to either use the the resizer or not.
> >
> > Thanks,
> > Dafna
>
> Anyway, this is a two line bug fix, so I think this patch can first be
> accepted and then if we choose to change the topology this can be done
> in a separate patchset.

Makes sense. Feel free to add my Reviewed-by.

Best regards,
Tomasz
