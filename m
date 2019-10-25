Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 692A2E47AA
	for <lists+linux-media@lfdr.de>; Fri, 25 Oct 2019 11:44:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439011AbfJYJoy (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 25 Oct 2019 05:44:54 -0400
Received: from mail.kernel.org ([198.145.29.99]:44482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2438753AbfJYJoy (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Fri, 25 Oct 2019 05:44:54 -0400
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5C77121D7B;
        Fri, 25 Oct 2019 09:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571996693;
        bh=q1UznsEKUTO8DreF7BRcK2/bVfkBTIWE2k+BAoSlRi0=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=j+4cL/VoDsMzQnNkvnWFhzyhskY08i846+9LMot9YhK5Si2KUxJomhBF7ay8BnXAf
         oqAIGsXK+pMPjEkVcK49yAL2m7EjsSdVpc9rexdQZGi02Hy4P1NpHjWNUQx5q7oWVX
         Jlg5ZvB94p6aFLiUaTA4BS+HKvumJ9FhRte/EFY0=
Received: by mail-lj1-f175.google.com with SMTP id a22so1987535ljd.0;
        Fri, 25 Oct 2019 02:44:53 -0700 (PDT)
X-Gm-Message-State: APjAAAXiv030t4yoPoDNs38/6uD9B6zomXoYzlHrqprrsi+hoKBlVBGI
        EW8u+bNYvnNGDWVYCdsDg4L4p8RzFEfRKnEoNLA=
X-Google-Smtp-Source: APXvYqwl+DBfLhBQ3kOA031iJfAqOQBIuEDEfqQNNhf7s01GbbN0ZPVErIek93n4uOnjRPsK+uuAcxbVUt9hgJE7Qb8=
X-Received: by 2002:a2e:9e85:: with SMTP id f5mr1545540ljk.235.1571996691460;
 Fri, 25 Oct 2019 02:44:51 -0700 (PDT)
MIME-Version: 1.0
References: <20191025085617.23132-1-ribalda@kernel.org> <20191025094319.GO5433@paasikivi.fi.intel.com>
In-Reply-To: <20191025094319.GO5433@paasikivi.fi.intel.com>
From:   Ricardo Ribalda Delgado <ribalda@kernel.org>
Date:   Fri, 25 Oct 2019 11:44:35 +0200
X-Gmail-Original-Message-ID: <CAPybu_34jx0HBjnpS8hbwYniymG_E+SGf+ezZAusYhKhHqPEBQ@mail.gmail.com>
Message-ID: <CAPybu_34jx0HBjnpS8hbwYniymG_E+SGf+ezZAusYhKhHqPEBQ@mail.gmail.com>
Subject: Re: [PATCH v3] Documentation: media: *_DEFAULT targets for subdevs
To:     Sakari Ailus <sakari.ailus@linux.intel.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        linux-media <linux-media@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

No, I am retarded on friday :)

Sorry about that

On Fri, Oct 25, 2019 at 11:43 AM Sakari Ailus
<sakari.ailus@linux.intel.com> wrote:
>
> On Fri, Oct 25, 2019 at 10:56:16AM +0200, Ricardo Ribalda Delgado wrote:
> > Some sensors have optical blanking areas, this is, pixels that are
> > painted and do not account for light, only noise.
> >
> > These special pixels are very useful for calibrating the sensor, but
> > should not be displayed on a DEFAULT target.
> >
> > Acked-by: Sakari Ailus <sakari.ailus@linux.intel.com>
> > Signed-off-by: Ricardo Ribalda Delgado <ribalda@kernel.org>
> > ---
> >  Documentation/media/uapi/v4l/v4l2-selection-targets.rst | 6 ++++--
> >  1 file changed, 4 insertions(+), 2 deletions(-)
> >
> > diff --git a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> > index f74f239b0510..a69571308a45 100644
> > --- a/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> > +++ b/Documentation/media/uapi/v4l/v4l2-selection-targets.rst
> > @@ -38,8 +38,10 @@ of the two interfaces they are used.
> >      * - ``V4L2_SEL_TGT_CROP_DEFAULT``
> >        - 0x0001
> >        - Suggested cropping rectangle that covers the "whole picture".
> > +        This includes only active pixels and excludes other non-active
> > +        pixels such as black pixels.
> > +      - Yes
> >        - Yes
> > -      - No
> >      * - ``V4L2_SEL_TGT_CROP_BOUNDS``
> >        - 0x0002
> >        - Bounds of the crop rectangle. All valid crop rectangles fit inside
> > @@ -60,8 +62,8 @@ of the two interfaces they are used.
> >      * - ``V4L2_SEL_TGT_COMPOSE_DEFAULT``
> >        - 0x0101
> >        - Suggested composition rectangle that covers the "whole picture".
> > -      - Yes
> >        - No
> > +      - Yes
>
> Was this intended?
>
> v4?
>
> >      * - ``V4L2_SEL_TGT_COMPOSE_BOUNDS``
> >        - 0x0102
> >        - Bounds of the compose rectangle. All valid compose rectangles fit
>
> --
> Sakari Ailus
