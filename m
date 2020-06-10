Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEBB1F58DB
	for <lists+linux-media@lfdr.de>; Wed, 10 Jun 2020 18:16:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728599AbgFJQQH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Jun 2020 12:16:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728157AbgFJQQE (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Jun 2020 12:16:04 -0400
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8B215C03E96B
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 09:16:04 -0700 (PDT)
Received: by mail-ej1-x644.google.com with SMTP id mb16so3249727ejb.4
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 09:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9vzAB6y83+KIuXqPLjKbE8fsh9ovocfCe1ei0OzrjcA=;
        b=C+c87DqJTTIPulj52HRAtCi4B2XMOhPjV9OW7P/pJZ/1aQe33XqhSiY3k1tN/kiRc1
         Hi8jOdzkLgKbhC4eoYYC904fb8JUVE8rhVepxVbxVW8Ai8tm6gHI7SZTC0vmdE3sERS3
         4exq42M+LOB0hff+C/FzO9DLze9LDRTbiEUdI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9vzAB6y83+KIuXqPLjKbE8fsh9ovocfCe1ei0OzrjcA=;
        b=golVU/uKzTNl3/Y0cys9j7y2cxrw7FHr2nCXWR6/2j19abqBE288LvWmouvzA4z/cN
         RMa/9pdth2X8FDWTdhu+5XTBHXQKh0aKVm2EDOADy3//lFYGi9axaSHYCP8XCGZ/ymBH
         OEosuW007E60iZRrYKznjDOE1y286kJKnnwgAad2CFXpAFvvwP6FjgKoGO0qCzvqHUe1
         hDwuFgSNsOQoRoJNZVxhGQV08XTNZUpL5YMjK39onkYoxL1+SDFFrznmGzxlq70QbAkf
         g66XaxPAO+KPbjN0Jw5fgxF1ZgcZ3q4W+KEGxcf5H1Oe+pKKdCYQFAfkroao8mGtVnL6
         qFZg==
X-Gm-Message-State: AOAM533PoaX7n57GQVB4ADVTLbgGRN0gmzVqv0Bvd00+jocuqxTXqRy5
        p1rXG0KPtHhPV6EN06MN9e3qvRKaQR3KiA==
X-Google-Smtp-Source: ABdhPJwAv9tV2ZONFE24AbypphW3vJ0jFhI8BeRwlujxh8QPFntWL6Hd2hOyVsw5sDIELkZIG8y90w==
X-Received: by 2002:a17:906:c828:: with SMTP id dd8mr4265701ejb.550.1591805762822;
        Wed, 10 Jun 2020 09:16:02 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id i9sm175303ejv.44.2020.06.10.09.16.01
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Jun 2020 09:16:02 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id l10so2916774wrr.10
        for <linux-media@vger.kernel.org>; Wed, 10 Jun 2020 09:16:01 -0700 (PDT)
X-Received: by 2002:a5d:6750:: with SMTP id l16mr4527306wrw.295.1591805761310;
 Wed, 10 Jun 2020 09:16:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200515142952.20163-1-dafna.hirschfeld@collabora.com>
 <20200515142952.20163-2-dafna.hirschfeld@collabora.com> <CAHD77H=LhYV31Jw_-cTvXPh0K2ocr6o97ymJ2KkmCdkH_DE7gg@mail.gmail.com>
 <b70dfcd2-6623-d1c9-78eb-d22b38434c73@collabora.com>
In-Reply-To: <b70dfcd2-6623-d1c9-78eb-d22b38434c73@collabora.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 10 Jun 2020 18:15:48 +0200
X-Gmail-Original-Message-ID: <CAAFQd5D4N9_WkQmwA-BVkk6aHUpsNOY0i8fvgbqL3+OiiLQ+kw@mail.gmail.com>
Message-ID: <CAAFQd5D4N9_WkQmwA-BVkk6aHUpsNOY0i8fvgbqL3+OiiLQ+kw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] media: staging: rkisp1: cap: change RGB24 format
 to XBGR32
To:     Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Helen Koike <helen.koike@collabora.com>,
        Ezequiel Garcia <ezequiel@collabora.com>,
        Hans Verkuil <hverkuil@xs4all.nl>, kernel@collabora.com,
        Dafna Hirschfeld <dafna3@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 10, 2020 at 6:11 PM Dafna Hirschfeld
<dafna.hirschfeld@collabora.com> wrote:
>
>
>
> On 27.05.20 01:04, Tomasz Figa wrote:
> > Hi Dafna,
> >
> > On Fri, May 15, 2020 at 4:30 PM Dafna Hirschfeld
> > <dafna.hirschfeld@collabora.com> wrote:
> >>
> >> According to the TRM, the YUV->RGB conversion outputs
> >> "24 bit word". What it means is that 4 bytes are used with
> >> 24bit for the RGB and the last byte is ignored.
> >
> > I don't see this mentioned in the datasheets I have. On the other
> > hand, XBGR32 indeed makes much more sense, as the 3-byte RGB isn't a
> > very popular format. Have you validated that the hardware behavior
> > indeed matches that?
>
> Hi, yes I validated it, I also found it mentioned here:
>
> http://rockchip.fr/RK3288%20TRM/rk3288-chapter-31-image-signal-processing-(isp).pdf
>
> under section "31.3.9 YCbCr to RGB Conversion"

Okay, great. Thanks!

Feel free to add my Reviewed-by after addressing Helen's comments.

Best regards,
Tomasz
