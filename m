Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F18DD1540A9
	for <lists+linux-media@lfdr.de>; Thu,  6 Feb 2020 09:52:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728088AbgBFIwE (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 6 Feb 2020 03:52:04 -0500
Received: from mail-ed1-f68.google.com ([209.85.208.68]:44450 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726673AbgBFIwE (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 6 Feb 2020 03:52:04 -0500
Received: by mail-ed1-f68.google.com with SMTP id g19so5050676eds.11
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 00:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=We7DoVh7zLbEobTGikMeJVx0fJF9wa4d1jWsJYX+VpE=;
        b=V53GVGtE+FiWi1Ic1qjEMrk3/vEvAhXyW5H0b0fxm+6774kxmE8OyeaawuPxs1gH4b
         c+0FT6j2HTkSaJT6uEthX7ZOUXERC0g8efQ01yJ78SbJsqPTMPOADs6e2eP5V0D4MgrQ
         5mxhqpf+6HI1BZDpX71QwLwNyugqDu8duGIlY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=We7DoVh7zLbEobTGikMeJVx0fJF9wa4d1jWsJYX+VpE=;
        b=Thk3pZQi72b19ye50UDKUpXJapddFnlxNKydiFywYb+dEpAPvu5PvKH1NAZfhw43Lj
         na0G2OxSpcvbuyve2gTV6UcoexsE8RR6sNxhPlmU4iVYvoU/5Ie29UZddsyqlqj5EbyQ
         YrFWzlFu0bylpfO7OcD54mWsLm5TOxLOx9CvNhtjhMuM9T4y81+O0Pl2/7p+ugJkcrqg
         JN49f5gvqko2307yF5QmsEZCklpoMnRVIqUlJ7ip8/+AbviyhwXUYEiu186ee+6fvjz9
         I/jXBinU61/up+eoJmfm1eCzznpBBAWBNzACA8Kxwvt3Zz5uSSl0mZjHS35wpgjXXwWY
         SY1g==
X-Gm-Message-State: APjAAAVuOLa8XGpG7/DL9NOmE1LdrhggoAYQ/Tw3JpqwwTwcysCnucJN
        L4KQIU0FrDxLSDiNKzjy9iX3jUtSDNF6Lg==
X-Google-Smtp-Source: APXvYqzVxQvERejE5QcAW2qDeFm5U0616b4pao+GGzadBYUDLpgo5ntXO1sfZaJBUT+3k3ho9qTj3g==
X-Received: by 2002:a17:907:426e:: with SMTP id nx22mr2284672ejb.162.1580979121836;
        Thu, 06 Feb 2020 00:52:01 -0800 (PST)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a12sm307769eje.70.2020.02.06.00.52.00
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2020 00:52:00 -0800 (PST)
Received: by mail-wr1-f48.google.com with SMTP id y17so6102637wrh.5
        for <linux-media@vger.kernel.org>; Thu, 06 Feb 2020 00:52:00 -0800 (PST)
X-Received: by 2002:adf:f58a:: with SMTP id f10mr2727400wro.105.1580979119629;
 Thu, 06 Feb 2020 00:51:59 -0800 (PST)
MIME-Version: 1.0
References: <20191217032034.54897-1-senozhatsky@chromium.org>
 <20191217032034.54897-13-senozhatsky@chromium.org> <1c5198dc-db4e-47d6-0d8b-259fbbb6372f@xs4all.nl>
 <CAAFQd5DN0FSJ=pXG3J32AXocnbkR+AB8yKKDk0tZS4s7K04Z9Q@mail.gmail.com>
 <560ba621-5396-1ea9-625e-a9f83622e052@xs4all.nl> <CAAFQd5D27xaKhxg8UuPH6XXdzgBBsCeDL8wYw37r6AK+6sWcbg@mail.gmail.com>
 <c23618a9-4bf8-1d9a-6e52-d616c79ff289@xs4all.nl> <CAAFQd5BGA-mnirgwQJP_UHkNzpVvf19xeRu-n7GLQci8nYGB2A@mail.gmail.com>
 <20200204025021.GF41358@google.com>
In-Reply-To: <20200204025021.GF41358@google.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Thu, 6 Feb 2020 17:51:46 +0900
X-Gmail-Original-Message-ID: <CAAFQd5B1cDCHexRR7UaqhHuxOgbAZDFHrZEVA1E2bcH14Ve5_A@mail.gmail.com>
Message-ID: <CAAFQd5B1cDCHexRR7UaqhHuxOgbAZDFHrZEVA1E2bcH14Ve5_A@mail.gmail.com>
Subject: Re: [RFC][PATCH 12/15] videobuf2: add begin/end cpu_access callbacks
 to dma-sg
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sakari Ailus <sakari.ailus@iki.fi>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Pawel Osciak <posciak@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Feb 4, 2020 at 11:50 AM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (20/02/03 19:04), Tomasz Figa wrote:
> [..]
> > > I very much agree with that. But this should be very clearly documented.
> > > Should V4L2_CAP_MEMORY_NON_CONSISTENT always be set in this case?
> > >
> >
> > Yes, IMHO that would make sense. My understanding is that currently
> > the consistency of allocated memory is unspecified, so it can be
> > either. With V4L2_FLAG_MEMORY_NON_CONSISTENT, the userspace can
> > explicitly ask for inconsistent memory.
> >
> > Moreover, I'd vote for setting V4L2_CAP_MEMORY_NON_CONSISTENT when
> > V4L2_FLAG_MEMORY_NON_CONSISTENT is guaranteed to return inconsistent
> > memory to avoid "optional" features or "hints" without guaranteed
> > behavior.
>
> Documentation/DMA-attributes.txt says the following
>
>   DMA_ATTR_NON_CONSISTENT
>   -----------------------
>
>   DMA_ATTR_NON_CONSISTENT lets the platform to choose to return either
>   consistent or non-consistent memory as it sees fit.  By using this API,
>   you are guaranteeing to the platform that you have all the correct and
>   necessary sync points for this memory in the driver.

Good point. And I also realized that some platforms just have no way
to make the memory inconsistent, because they may have hardware
coherency.

Then we need to keep it a hint only.

Best regards,
Tomasz
