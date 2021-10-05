Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E541A422279
	for <lists+linux-media@lfdr.de>; Tue,  5 Oct 2021 11:38:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233592AbhJEJj5 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 5 Oct 2021 05:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233290AbhJEJj5 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 5 Oct 2021 05:39:57 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB190C061745
        for <linux-media@vger.kernel.org>; Tue,  5 Oct 2021 02:38:06 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j8so5788882wro.7
        for <linux-media@vger.kernel.org>; Tue, 05 Oct 2021 02:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gRlbJ3s6hyVWZAt2O8o2hhgDTp/D87nA5RAh8rjtcSw=;
        b=IzSwSAFLlvjlZBKvpY/l994+2bpMMX48NUCNMvMvRLgbfbE7Xfoi+S0T3liemsClhU
         1AdfDgbQ/m0weaNaCOFM1sQPBj2lpGohq/11UsAAesH/EtCMFbWGsmEnPcSqG3IEBjYX
         VmoiyR//Q0LeX8C5nv5kz+hgref8rGbb3M9ruYtgndsn31L819BhiNUrezfNm+VxhAhp
         kYER6uVdazkeuRAbQcEU20CdjCq9TbuzDlFvSIPBB+CM/2rfG8LTJt+3GwS+DgY1xrsL
         amWY6+cJM2t4wPDKqyXX9+0H9arEPLSt7C8OloiBCqyIHMimaqffVn21YxMbf8uuosvX
         Z2ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gRlbJ3s6hyVWZAt2O8o2hhgDTp/D87nA5RAh8rjtcSw=;
        b=4RudaBKsjDr3e82Zhy9cABj8NKDNNDFCMHFLOE1KY+XCAMx7BWyeNH2ib61/Yg/5Rr
         nMZBNtbEAd2lJRE9CfQv39Zv6cXNt32jLDD8/MoAra8wVJmewYspcdjqaNwfyYo4FCJA
         aQutTF1inpNcG48ryjQ9507ZWAHOrosTOd9lIGPTDodajDrviy4Qwl9J04A1ld2JmpEB
         u2KcfPvIpkpsPjc918Sq+9DjkQvyqUSIrkrtXIfR4rMKRSo5Aixm1bvo64T5HQj01Ys2
         RfcDWY1pUCLLvKXV7NAD8l1rNcHnNXGqM6OZJppdG6v1C/YWMwudN0IzUSr6cT6rZE5h
         fZiQ==
X-Gm-Message-State: AOAM530wp7Hh6Yw602oXJJw2eCKZf9wnuzlIf0VGIl8NLip8m6xzvW3c
        zV1nhq0s5MOspOXPFKbgJ7yniboxKB0q+RG2TzjIpX4Pj8j3GQ==
X-Google-Smtp-Source: ABdhPJzJ8qA+95lgRR1O82v9cADSlfheOug8zbi08pBT8Igmp9OFyVMV5eTWmmnbRQfzJstcnp+JkWJ2kz0ZNt78njk=
X-Received: by 2002:adf:a402:: with SMTP id d2mr20158136wra.266.1633426685292;
 Tue, 05 Oct 2021 02:38:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210816113909.234872-1-david.plowman@raspberrypi.com> <YTdp9Ux0p38F+hfz@pendragon.ideasonboard.com>
In-Reply-To: <YTdp9Ux0p38F+hfz@pendragon.ideasonboard.com>
From:   David Plowman <david.plowman@raspberrypi.com>
Date:   Tue, 5 Oct 2021 10:37:54 +0100
Message-ID: <CAHW6GYJ8cSDJ+DMejrm3EjwGRWoebVsM1OuUfwH-YBP5gO6qTQ@mail.gmail.com>
Subject: Re: [PATCH v6 0/2] New V4L2 control V4L2_CID_NOTIFY_GAINS
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     linux-media@vger.kernel.org, Sakari Ailus <sakari.ailus@iki.fi>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Laurent, Sakari, everyone

I was wondering whether I might give this another little nudge just so
that it doesn't get lost.

Thanks again and best regards

David

On Tue, 7 Sept 2021 at 14:32, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hello,
>
> I've reviewed this series and it looks good to me. Sakari, would you
> like to have a look, or should I send a pull request ?
>
> On Mon, Aug 16, 2021 at 12:39:07PM +0100, David Plowman wrote:
> > Hi again everyone
> >
> > Thanks for last round of feedback, leading to this v6 pair of
> > patches. I've made the documentation improvements that were suggested,
> > and accordingly added Laurent's "Reviewed-by" tags.
> >
> > Thanks and best regards
> >
> > David
> >
> > David Plowman (2):
> >   media: v4l2-ctrls: Add V4L2_CID_NOTIFY_GAINS control
> >   media: v4l2-ctrls: Document V4L2_CID_NOTIFY_GAINS control
> >
> >  .../media/v4l/ext-ctrls-image-source.rst      | 20 +++++++++++++++++++
> >  drivers/media/v4l2-core/v4l2-ctrls-defs.c     |  1 +
> >  include/uapi/linux/v4l2-controls.h            |  1 +
> >  3 files changed, 22 insertions(+)
>
> --
> Regards,
>
> Laurent Pinchart
