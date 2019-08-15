Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 242B28E4E2
	for <lists+linux-media@lfdr.de>; Thu, 15 Aug 2019 08:23:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730126AbfHOGXS (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 15 Aug 2019 02:23:18 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:40389 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725911AbfHOGXR (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Thu, 15 Aug 2019 02:23:17 -0400
Received: by mail-ot1-f67.google.com with SMTP id c34so3739627otb.7
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 23:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YhbveJcP6PkgFbxwU3BvY00ChQpLTy3VBnXOG+ET2bw=;
        b=r75MN8yQhWGnGqYQvj9EbcoYFIqqpgmp8EozgacGeNUA+JAlzZ+rIu86wCEuVkYRgK
         MGlkCOm5YKj99raaxj0DHWSTcFSlveEIHaYQNsGdrl0xsBONOnk0UxMs56Qy7if9Zmwe
         z2+w+umzeg/EioY3rlBaoLVzvPHrS446dd2AY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YhbveJcP6PkgFbxwU3BvY00ChQpLTy3VBnXOG+ET2bw=;
        b=kcXvyaBNTaD1UrsHeqVSd4EsW7dD1sxgi+gErM22KtQMz0o0xHV4pIAH2eD5e/20kL
         BRLIrciWCLSItWqXqiIpC8VGUb28eXW1MXbh1aO2EHyipgeS8YsJtcNxLaNMvSAIv4LT
         +MTS8hoQ43EXCvWJe0jtTFw4hCA4wqwuuutuYyTwBRz6p2muugVA0nZUKcp+8QO2a3aQ
         xBSIfqTWPVBqBwQ5ScAvfCi8N1RlJpOppGdA5Qz0NfpYmzQ/ZFI8DTDerxEF8ZtW0KjY
         oLGmx7SOZQI64KzG/cfOnqzgHUGYDZF1c3MYf5LnIjp2uhRD60gja5Rseh5t7OD2JySQ
         vazA==
X-Gm-Message-State: APjAAAXZ1blpb6FqBb/Pca03iwwkIeQnFHQq/lR32+DGuZAYPotDj/7T
        yknczV7ns5xctoEsK3zwmRwneDC5yiEHYuTLZ2xOqA==
X-Google-Smtp-Source: APXvYqzBww6lyZ7Gv8UarsURKp6CcI2wcE4J/QPbAQwTRnZ0v9og3HWYO4iIxfqh3X6/EvgxEaVZPECH6dctosCu2YU=
X-Received: by 2002:a6b:8ed7:: with SMTP id q206mr3881230iod.120.1565850196671;
 Wed, 14 Aug 2019 23:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190811071015.3303-1-matt.ranostay@konsulko.com> <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
In-Reply-To: <0630c968-1d47-a2c7-cc47-964a08085f13@xs4all.nl>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Wed, 14 Aug 2019 23:23:05 -0700
Message-ID: <CAJCx=g=XOU72ZETpOHCdFfhC-9vkxAk09nTjaap4yGKB9+RKBA@mail.gmail.com>
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

Probably can make it more verbose if requested.

But simple overview is that all the frame data is from 0x400 read but
there is a some status register data that is from 0x8000
that needs to be read.

So mostly from the latter read (which can have an unlikely race
condition and be incorrect) is to confirm which sub frame that is
being read which can be one or two. You need the previous subpage
magic values to process that respective frame temperature data.

>
> mlx90640_xfer() reads the buffer data from the i2c device, but
> that data is split over two different addresses? Or does
> 0x8000 contain something else with a different meaning compared
> to what is read from 0x400?
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

Yes that is true but don't see in datasheet that you can just not read
the last two bytes of the transaction.
Probably totally fine to not do so but who knows.

- Matt

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
