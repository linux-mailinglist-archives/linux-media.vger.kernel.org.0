Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7C6AA8CE93
	for <lists+linux-media@lfdr.de>; Wed, 14 Aug 2019 10:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726373AbfHNIgC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 14 Aug 2019 04:36:02 -0400
Received: from mail-ot1-f67.google.com ([209.85.210.67]:43454 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725265AbfHNIgC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 14 Aug 2019 04:36:02 -0400
Received: by mail-ot1-f67.google.com with SMTP id e12so36233669otp.10
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 01:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/o/cT1ICfJaxPM6fH7buuil/8DvoYp2xlNCjpESVvuY=;
        b=ZZyo7C7ly0jQSE2RN4WhEb6i4w8ibawWKvN9arx8bRlDDbX/3HRbu2ow4p8mPPwc3K
         DaPGRxbaf8MHpT1xu8CI30GwEC6/Z6QzRYkbt8S7EIXxd53Lu2m/UbnHGt4CJocY16D/
         Xe+aoN/F9giVj26yfFmJF69GIgSOhA5Dlnv1I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/o/cT1ICfJaxPM6fH7buuil/8DvoYp2xlNCjpESVvuY=;
        b=Ki8IWscWAo/e7NAiooAAEybKa35Io4OKPyBBeSzET06Ksd8pPOOuHKDPA34+EKSfy/
         fZBk/7UpQqJdBiC1KwMw3RRZzDdJkG0osAcMRJV4pBFCfQuMbSUviFHqE842edRCc3Qt
         6kKBjm//DHYqMEVu5R7vYN0KUUqqL13d8hRSQ0fj2VIKaHqoFslKrXDBQANtMVrddSmN
         FMWWztieX0dHGMB0WcG2ewVAy2LqKt+svYB31B/oUYSOeA3DJ+cVmepYqPQFY4SZJ1Iw
         ku2MDUNcNKjNkl8hSLsXcBI+XfXyzp0cdyWtUeJlf5QRHfQiv9HshlA4YJI5cQqQGZMh
         hE6A==
X-Gm-Message-State: APjAAAVVGjY9rZjn4nHU2V6Km2NM8y9NQhx4qtRVu/cnGE7J4+FmJnkQ
        oK/1RyfEKnNNLmTTgBrUolFGVQHo1Lk=
X-Google-Smtp-Source: APXvYqwHfzetOTG0ty7B1Qj5r9nvdI75SBKqyjyY0JgAsCV0deMMin0Vfr3UGYJtELDXt5zB1uEiwg==
X-Received: by 2002:a9d:72c3:: with SMTP id d3mr5560711otk.149.1565771761408;
        Wed, 14 Aug 2019 01:36:01 -0700 (PDT)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id p3sm38270331otk.47.2019.08.14.01.35.59
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 14 Aug 2019 01:36:00 -0700 (PDT)
Received: by mail-oi1-f171.google.com with SMTP id y8so2612368oih.10
        for <linux-media@vger.kernel.org>; Wed, 14 Aug 2019 01:35:59 -0700 (PDT)
X-Received: by 2002:aca:40d5:: with SMTP id n204mr4023184oia.94.1565771759262;
 Wed, 14 Aug 2019 01:35:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190630134404.7ba170f0@coco.lan> <20190801093400.5c351754@coco.lan>
 <20190808095535.1ec92a1d@coco.lan> <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
 <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl>
In-Reply-To: <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 14 Aug 2019 17:35:48 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
Message-ID: <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
Subject: Re: [ANN] Media summit in Lisbon at September
To:     Hans Verkuil <hverkuil@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

That could be nice. Of course something more informal is also fine.
Anyone else planning to attend? I suspect Laurent and people living in
France might be there?

On Mon, Aug 12, 2019 at 4:28 PM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 8/12/19 6:00 AM, Alexandre Courbot wrote:
> > On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab
> > <mchehab+samsung@kernel.org> wrote:
> >>
> >> Em Thu, 1 Aug 2019 09:34:00 -0300
> >> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> >>
> >>> Em Sun, 30 Jun 2019 13:44:04 -0300
> >>> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> >>>
> >>>> Hi all,
> >>>>
> >>>> We are organizing a media mini-summit in Lisbon to happen in September,
> >>>> at the same week as the Linux Plumber Conference and the Kernel Summit.
> >>>>
> >>>> We're still discussing the details about that.
> >>>
> >>> Gently reminder.
> >>>
> >>> Right now, we have just one extra theme proposal from Sean:
> >>>
> >>>       - possible dvb improvements.
> >>>
> >>> If we don't have more proposals, we may end skipping the Media
> >>> Summit this year.
> >>
> >> It sounds that we won't have material to have a media summit this year.
> >> So, let's cancel the media summit this year.
> >
> > Loosely related, but are there people planning to go to ELCE on
> > 10/28-30? Tomasz and I may attend if there is a chance to discuss
> > libcamera/V4L2 codecs.
>
> I'll be there and if there is enough interest in setting up a meeting
> to discuss this, then I can ask the LF to set a room aside for us for,
> say, half a day or so.
>
> Regards,
>
>         Hans
