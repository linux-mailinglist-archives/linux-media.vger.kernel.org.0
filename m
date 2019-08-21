Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 863B0971D8
	for <lists+linux-media@lfdr.de>; Wed, 21 Aug 2019 07:59:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726907AbfHUF7Q (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Aug 2019 01:59:16 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34047 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725385AbfHUF7P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Aug 2019 01:59:15 -0400
Received: by mail-io1-f65.google.com with SMTP id s21so2296625ioa.1
        for <linux-media@vger.kernel.org>; Tue, 20 Aug 2019 22:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cBn5K8WHzt4CFF+A8X41FtdQeL4dd8AeZa2tSVRJCWI=;
        b=txHtg1z8BOnBz/Kl9ZfeMAciuUIm0KbGNS8DB56ZIkTk47y3CKrucRbE6qGkZzdBRM
         SPcoCqENAsLMrQHm6eKva5Q57SQNGACax8/RypJ+6VSK3GQuXfEF8I72/W6BqZc6jvpm
         LjvlIoSbdC2oZvYt16niwRoy30LTOdgd0uYbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cBn5K8WHzt4CFF+A8X41FtdQeL4dd8AeZa2tSVRJCWI=;
        b=KkFxp6D2n8sC7n6vpEpeVXDqnOUn4nyPQD/UPzNz1VqBo4xXIuNjHfiqzFNb+xUuHr
         NeuvYU2Uwf0ztQHmHl+tqlkHy8GcaZrdey3wB+Z497jA1plrOOw5zYgVFxFXL2iNpK/S
         n9BdgTNLQaXM/eXMqpxJ1KpGl7bgR6qAA7cz4ckAJqCkvI+R4qUV5ENKZgyiskWURQDU
         EvZ5O6meD1j9m5SbmbNoDYmx9Dbnik8x+bC5XiqqzUpdM4sdyZwFqwnQkAS9XEZrZEph
         tUGjs5Q16nrsmHMO65/NIqJOBzAJHmmgBeJstOL6WLJYnzC0a+IsM3NKp383D99ubzw9
         vacQ==
X-Gm-Message-State: APjAAAVXqF7O4i2AVSGxzFEUQ0Sh6LcWBcJ3Jmjv61ET/xokAS0iUg1F
        7+9YIibTM31q8Gm3Uj+wa5cjV1VJBrpdVsK98o8ZaQ==
X-Google-Smtp-Source: APXvYqyzHbR8vWrFlkfp3Olkz8sVqDTQveMA8IkCcJTn0wOccNfnWogPwzGchSCf798wdRujdv1p8Y8oKswMMDTHitk=
X-Received: by 2002:a5e:c914:: with SMTP id z20mr10658838iol.272.1566367154899;
 Tue, 20 Aug 2019 22:59:14 -0700 (PDT)
MIME-Version: 1.0
References: <20190811071015.3303-1-matt.ranostay@konsulko.com> <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
In-Reply-To: <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Tue, 20 Aug 2019 22:59:04 -0700
Message-ID: <CAJCx=g=A7qEq4jpGzHNiCbngCXoM4d3epGVSVKggdBT1qpSYqg@mail.gmail.com>
Subject: Re: [PATCH] media: video-i2c: add mlx90640 subpage data to output
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Aug 12, 2019 at 6:05 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Matt,
>
> On 8/11/19 9:10 AM, Matt Ranostay wrote:
> > Add current subpage data via the status register to the video
> > frame in the last word of data, which seems to be unused
> > undocumented reserved data.
>
> I don't really understand from this description what is going on
> here.
>
> mlx90640_xfer() reads the buffer data from the i2c device, but
> that data is split over two different addresses? Or does
> 0x8000 contain something else with a different meaning compared
> to what is read from 0x400?

So the status register contains the bit on if subpage one or two is in
the reading, so in reality a 8 fps reading in v4l2
space is only a 4 fps processed images.

This is important for userspace processing because it needs to know it
has a subpage one and two to process the thermal data.
Can't do it with subpage two and one in that order per the algorithms,
and also since it is polling it is possible a frame will be dropped.

- Matt

>
> >
> > Signed-off-by: Matt Ranostay <matt.ranostay@konsulko.com>
> > ---
> >  drivers/media/i2c/video-i2c.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/media/i2c/video-i2c.c b/drivers/media/i2c/video-i2c.c
> > index 078141712c88..8bc7b228ba40 100644
> > --- a/drivers/media/i2c/video-i2c.c
> > +++ b/drivers/media/i2c/video-i2c.c
> > @@ -168,8 +168,16 @@ static int amg88xx_xfer(struct video_i2c_data *data, char *buf)
> >
> >  static int mlx90640_xfer(struct video_i2c_data *data, char *buf)
> >  {
> > -     return regmap_bulk_read(data->regmap, 0x400, buf,
> > -                             data->chip->buffer_size);
> > +     int ret = regmap_bulk_read(data->regmap, 0x400, buf,
> > +                                data->chip->buffer_size);
>
> Shouldn't this be data->chip->buffer_size - size, since the last
> 'size' bytes will be overwritten anyway?
>
> > +     int size = data->chip->bpp / 8;
> > +
> > +     if (ret)
> > +             return ret;
> > +
> > +     /* read status register, which contains subpage that is read */
> > +     return regmap_bulk_read(data->regmap, 0x8000,
> > +                             &buf[data->chip->buffer_size - size], size);
> >  }
> >
> >  static int amg88xx_setup(struct video_i2c_data *data)
> >
>
> Regards,
>
>         Hans
