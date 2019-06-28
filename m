Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5025E59A60
	for <lists+linux-media@lfdr.de>; Fri, 28 Jun 2019 14:15:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbfF1MPD (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 28 Jun 2019 08:15:03 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33211 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726542AbfF1MPC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 28 Jun 2019 08:15:02 -0400
Received: by mail-qk1-f196.google.com with SMTP id r6so4587553qkc.0;
        Fri, 28 Jun 2019 05:15:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=1TAwC61JS4eXqZ82OujM9dlobazLqVa1FIeOqHjXlt0=;
        b=Yhs8q16ww190EQsZo2yQwQr8JXW0IK8KDmoshG9U73ABjiE+FENH8UCQH4MKnQnRzp
         vUGK55+3w5xZMPiHlwxnIXWzYEsnLspqvchDdXAoQxk91klCmy+3peLowrsE3iqzrj3A
         dgnBp/WuyJNTYIcv9PuEX9IcrKGhmvpj6pB/tT7SU6hBwRWfJQC/Qa//y5ZjCqCp82/f
         9tjQ2pnBU8zJkhkP3DwIRYYB9rw9BL1ANvcoAZj/1uSSqlcigg28PufETdzUkVpFKLYf
         0OMODFSWoj6w6ifhDW62rdNjjB1NoZ/ubZOuefC/3lVcGTAWcONuNEAA6qrLSvPMT6BJ
         pWGg==
X-Gm-Message-State: APjAAAU0qa7x1iyRAUMBISbgF33ea5/UCXbjgKeEYRV9pF04boZ6/cPQ
        yDruNcCdlGNcnK1o41/ywn81Xaj7K9Mmpln6AjzZUr+N
X-Google-Smtp-Source: APXvYqwNxgHRzw4z0Rr9Q4yX5hm7cI8WvoLsLEbd5pABPHANQdawqiZmtxqhSSYgYnw4qgfGuspgeXqzbjHf70WenTY=
X-Received: by 2002:a37:ad12:: with SMTP id f18mr8197153qkm.3.1561724101537;
 Fri, 28 Jun 2019 05:15:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190313211709.486583-1-arnd@arndb.de> <20190403163444.2psjymq5kb3c6ok6@gofer.mess.org>
In-Reply-To: <20190403163444.2psjymq5kb3c6ok6@gofer.mess.org>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Fri, 28 Jun 2019 14:14:42 +0200
Message-ID: <CAK8P3a0w0AWCotSSDpLORgOPHq-Cmy7u+AWzs1thU7V_bqNRNw@mail.gmail.com>
Subject: Re: [PATCH] media: dib0700: fix link error for dibx000_i2c_set_speed
To:     Sean Young <sean@mess.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
        Colin Ian King <colin.king@canonical.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Apr 3, 2019 at 6:34 PM Sean Young <sean@mess.org> wrote:
>
> On Wed, Mar 13, 2019 at 10:16:53PM +0100, Arnd Bergmann wrote:
> > When CONFIG_DVB_DIB9000 is disabled, we can still compile code that
> > now fails to link against dibx000_i2c_set_speed:
> >
> > drivers/media/usb/dvb-usb/dib0700_devices.o: In function `dib01x0_pmu_update.constprop.7':
> > dib0700_devices.c:(.text.unlikely+0x1c9c): undefined reference to `dibx000_i2c_set_speed'
> >
> > The call sites are both through dib01x0_pmu_update(), which gets
> > passed an 'i2c' pointer from dib9000_get_i2c_master(), which has
> > returned NULL. Checking this pointer seems to be a good idea
> > anyway, and it avoids the link failure.
>
> So I reproduced the link failure with attached config, and your patch
> does not fix it.

I ran into the old problem I reported once more, and checked my
original patch, as well as your configuration file, which indeed shows
the same symptom.

Interestingly, the link error after my patch appears to be the result
of a compiler bug, as the function reference is from dead code that
should have been eliminated. Sending a replacement patch now.

        Arnd
