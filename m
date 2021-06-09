Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC3053A0D42
	for <lists+linux-media@lfdr.de>; Wed,  9 Jun 2021 09:08:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233692AbhFIHKk (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 9 Jun 2021 03:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235091AbhFIHK3 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 9 Jun 2021 03:10:29 -0400
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3148C061789
        for <linux-media@vger.kernel.org>; Wed,  9 Jun 2021 00:08:22 -0700 (PDT)
Received: by mail-il1-x136.google.com with SMTP id j26so13789208ila.4
        for <linux-media@vger.kernel.org>; Wed, 09 Jun 2021 00:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=quU0T4l76YjjJD2tLl8ioG0gxR7mjWeZchunD1LV6j8=;
        b=FZQHIcx4mqI8FjD/OsLe8kzV6NpR/5wLWtR3xiHCTqpkHuoFtuNAX8ehB8vxjRWu6n
         4jiUYVBeJoac5hJ2KMvk6Rzj6hbNJnGJ30iXqgvn2S16UhdPyruq2+Wo43VDsk2NWl1W
         OuR+AQHmf6lbCtaPNiaTtEXvws7UztpZKhtsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=quU0T4l76YjjJD2tLl8ioG0gxR7mjWeZchunD1LV6j8=;
        b=apx9yjcoirW0Xsz9J4Km08E9/NzQnnYMziqR9F06K+z/bUJZtbAvmqhxVFVAXzxTdz
         wlK3TsDUGbza3Pw8iTwI04nEJXGG+qAoy4Y6RKx6b08wlaHy5grVszQnhPcO+/BLWby9
         7issZyjU4C6m7mQ969s/eBJ5UrdznE2rbdZyeRgfGHlchQp4Wu5rbG+x98fTk0c6WxjU
         72WDVafUTyX2+eZMmTweVU8+SFG+JRE2sig0uEDsPCQXxYxxND6oDz9avkGZZ1lJhlq5
         OxM6ccu4h9FQZJEHyEUu7aaPH1huLso1xpHkT1mP6HEXhy2RfWvASdoFKwcXuxJC6b5J
         BuCw==
X-Gm-Message-State: AOAM533LOTc5tNnQYy1vSBZk1juYsbymUjbKV55bHObekZCB1acUmQM7
        PlGheTlFfPNeG7T3J8VRzx4ZEJJ7gjIIh6g2cacTHQ==
X-Google-Smtp-Source: ABdhPJzRGgzxR2Bn0m7opScFPW47CvBdn9Rn4FimpjgS3Ys10OwbVRbBoTXyoiXgFfZByGv6kWwtv5MFrohIffrgc6c=
X-Received: by 2002:a02:3304:: with SMTP id c4mr24456956jae.68.1623222502221;
 Wed, 09 Jun 2021 00:08:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210608152451.14730-1-euphoriccatface@gmail.com>
In-Reply-To: <20210608152451.14730-1-euphoriccatface@gmail.com>
From:   Matt Ranostay <matt.ranostay@konsulko.com>
Date:   Wed, 9 Jun 2021 00:08:11 -0700
Message-ID: <CAJCx=gkS3Jycvi_jfp6E7-11go+xCi7YFu0p1aEMMfHWEkamNw@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] media: video-i2c: additional support for Melexis MLX90640
To:     Seongyong Park <euphoriccatface@gmail.com>
Cc:     linux-media <linux-media@vger.kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jun 8, 2021 at 8:25 AM Seongyong Park <euphoriccatface@gmail.com> wrote:
>
> Thanks to Matt Ranostay and Mauro Carvalho Chehab (mchehab) for guidance
>

Just one nitpick on future revisions. It is helpful to mention the
changes from from v1 to v2 makes it easier
for a quicker review.

- Matt

> Seongyong Park (2):
>   media: video-i2c: more precise intervals between frames
>   media: video-i2c: append register data on MLX90640's frame
>
>  drivers/media/i2c/video-i2c.c | 34 +++++++++++++++++++++-------------
>  1 file changed, 21 insertions(+), 13 deletions(-)
>
> --
> 2.31.1
>
