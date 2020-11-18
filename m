Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 454992B7DB9
	for <lists+linux-media@lfdr.de>; Wed, 18 Nov 2020 13:41:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726471AbgKRMla (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 18 Nov 2020 07:41:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725747AbgKRMla (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 18 Nov 2020 07:41:30 -0500
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2074C0613D4
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 04:41:29 -0800 (PST)
Received: by mail-ej1-x643.google.com with SMTP id i19so2521734ejx.9
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 04:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XjgSpKsybF+/Za+ily1WERPP10qpRz/pppr8H6cmNGs=;
        b=NOJvKeXs5dfcv6RuTVQoU9FopPHDU6b7njngpNcrKYYMk+G99EpD7DqC1QegCT6uD/
         JgFVaAR2QbQLq0a6sxBYt/vitwAJEVtSj3vye4ewoNf5VnDDB5QP6PeyrQFgOAaJa9JV
         dXdc+vf5NG3+VavRWNHr6Tw/ECSJax1F9ad44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XjgSpKsybF+/Za+ily1WERPP10qpRz/pppr8H6cmNGs=;
        b=YlyOypeJHnZOykM+pSdKztcH+aa4uGPFRPKzgN4xiMvzu0rMptd+j1nReTfPyngk6Q
         l8f6lue7yV3jDn1zYvH7JKQDH76yh+sqBL8gZgHRJH/i2HKBbTAUN+nJHy8v5QuJSqmK
         sFqNBYuUHTbshQwVEWuZDpu2lbqdbiNuQncIsF/Q4gdE3fhCWI9mLJ4op4UI3b8TANb+
         VgFxZNobpj180+X03LFzVVahrbekWgirzEOj4JgscqZsOAgd6+CpCHyhLzYcHL1zGOL4
         HdHoiKR2GsO50FcjGQvjwJebSzFYlLuieUjr6xtPmVOrIOzBKnCrfjAbcTshGo1qHwKD
         ciSw==
X-Gm-Message-State: AOAM531qBQg4FsnKMpBlFYHvPWul1NWaLGJU3zSLNFV/HbtHOsM6g4w7
        oJWsOZgGpo2mpyj7Csv/fOU87Fbadl72jw==
X-Google-Smtp-Source: ABdhPJwFU7rPhr1I48YdbUjZOh/yv2fWDbxaD0PlwSXuF5fXw1jjeWoY89MitfIybRUf4C9TYj1LAw==
X-Received: by 2002:a17:906:7f10:: with SMTP id d16mr23356219ejr.104.1605703288153;
        Wed, 18 Nov 2020 04:41:28 -0800 (PST)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com. [209.85.128.51])
        by smtp.gmail.com with ESMTPSA id d23sm13303060edy.57.2020.11.18.04.41.23
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2020 04:41:26 -0800 (PST)
Received: by mail-wm1-f51.google.com with SMTP id 23so4059157wmg.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2020 04:41:23 -0800 (PST)
X-Received: by 2002:a7b:cd11:: with SMTP id f17mr4322839wmj.127.1605703283521;
 Wed, 18 Nov 2020 04:41:23 -0800 (PST)
MIME-Version: 1.0
References: <1603940341-25224-1-git-send-email-bingbu.cao@intel.com>
 <X7OEysbnAhTXEmUq@jagdpanzerIV.localdomain> <X7OLuFejNyAPJEfB@jagdpanzerIV.localdomain>
In-Reply-To: <X7OLuFejNyAPJEfB@jagdpanzerIV.localdomain>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 18 Nov 2020 21:41:11 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AyJz1bcMZXQLjCbUGS_wMxC0WViHynDPA4KowTLK_V0A@mail.gmail.com>
Message-ID: <CAAFQd5AyJz1bcMZXQLjCbUGS_wMxC0WViHynDPA4KowTLK_V0A@mail.gmail.com>
Subject: Re: [PATCH] media: i2c: Add ov9734 image sensor driver
To:     Sergey Senozhatsky <sergey.senozhatsky@gmail.com>
Cc:     Bingbu Cao <bingbu.cao@intel.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Bingbu Cao <bingbu.cao@linux.intel.com>,
        "Qiu, Tian Shu" <tian.shu.qiu@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Nov 17, 2020 at 5:37 PM Sergey Senozhatsky
<sergey.senozhatsky@gmail.com> wrote:
>
> On (20/11/17 17:07), Sergey Senozhatsky wrote:
> > > +static int ov9734_set_stream(struct v4l2_subdev *sd, int enable)
> > > +{
> > > +   struct ov9734 *ov9734 = to_ov9734(sd);
> > > +   struct i2c_client *client = v4l2_get_subdevdata(sd);
> > > +   int ret = 0;
> > > +
> > > +   if (ov9734->streaming == enable)
> > > +           return 0;
> > > +
> > > +   mutex_lock(&ov9734->mutex);
> > > +   if (enable) {
> > > +           ret = pm_runtime_get_sync(&client->dev);
> > > +           if (ret < 0) {
> > > +                   pm_runtime_put_noidle(&client->dev);
> > > +                   mutex_unlock(&ov9734->mutex);
> > > +                   return ret;
> > > +           }
> > > +
> > > +           ret = ov9734_start_streaming(ov9734);
> > > +           if (ret) {
> > > +                   enable = 0;
> > > +                   ov9734_stop_streaming(ov9734);
> > > +                   pm_runtime_put(&client->dev);
> > > +           }
> > > +   } else {
> > > +           ov9734_stop_streaming(ov9734);
> > > +           pm_runtime_put(&client->dev);
> > > +   }
> >
> > I assume that we will never see erroneous ->s_stream(0) calls or
> >  ->s_stream(0) after unsuccessful ->s_stream(1). Otherwise we will
> > do extra pm_runtime_put(), not matched by pm_runtime_get().
>
> Oh, no. There is (unprotected) if (ov9734->streaming) check
> at the very top, so we are probably fine.

Hmm, should it be protected?
