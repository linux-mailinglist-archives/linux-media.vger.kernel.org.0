Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7D8CB8FA7F
	for <lists+linux-media@lfdr.de>; Fri, 16 Aug 2019 07:52:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726571AbfHPFw2 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 16 Aug 2019 01:52:28 -0400
Received: from mail-ot1-f47.google.com ([209.85.210.47]:35316 "EHLO
        mail-ot1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbfHPFw1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 16 Aug 2019 01:52:27 -0400
Received: by mail-ot1-f47.google.com with SMTP id g17so7823826otl.2
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 22:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/g26ZPq4jmS15vmX8MHUgZOj9UYbBjjHPJiILEWQ1Tw=;
        b=Alx0h3Ffszz156D5s7qosyECQqIF+4qhbEABn1kIWzKY/btrfc9QVhr4DglStZhRgC
         DbkacERj3qXLFsQ788ww7CSE0JyeqZ6iVYAduoHJpcRQpDGuRHyVnWzJcQX71eDwPFko
         QASLIyUsjb8UMhv0bk3Aqa8H1ABiNAYRBq3M4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/g26ZPq4jmS15vmX8MHUgZOj9UYbBjjHPJiILEWQ1Tw=;
        b=iY2jGarD5AdBvkXl5PbTg+bEI3BziAKuJjAiOf0QJtWu+6cvYDf5kB39gyJF36YXX6
         69R+ph0q3wNsEuB2Dg+D0GYm97c8wCmCWRM260kBg0t6jPNh0Sd8rfqxW56bkD/RtKuA
         DYiF5rc/9c/8dE+59HxZE/eoP/taY02sOW6Nb6hozDAUOLdKl5h4NCfJrD4Wwf3RJp8x
         jrJqWilbeIIFCV9jJbH/t+DpckL5t/yABpxT3KsUiC74BX7Ax7YdbAlG4nY61Xa/05RY
         IkY1sNKqRrfk6hwgeHrZY30As4rlHXzJqKGJPb8TeASIjLr/cvBuAt6UgdpW3TuCAUpl
         q5kQ==
X-Gm-Message-State: APjAAAXKGJkltbSjjzNMrhdzxMr4k8On5iKw4AVFVHVCgOItMzJJYChL
        srbJIT5HKGAk76uD++UOc767iR/fJZw=
X-Google-Smtp-Source: APXvYqzj/H38j7C7gzFeDlTaSaOoSANESYIUerZ7yAhM6+t7uMRWvdQZNMjUlvzGf3Dxq2np7woRsg==
X-Received: by 2002:a9d:6289:: with SMTP id x9mr2568432otk.82.1565934746825;
        Thu, 15 Aug 2019 22:52:26 -0700 (PDT)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com. [209.85.210.44])
        by smtp.gmail.com with ESMTPSA id 11sm1838367otc.45.2019.08.15.22.52.25
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Aug 2019 22:52:26 -0700 (PDT)
Received: by mail-ot1-f44.google.com with SMTP id o101so8603957ota.8
        for <linux-media@vger.kernel.org>; Thu, 15 Aug 2019 22:52:25 -0700 (PDT)
X-Received: by 2002:a9d:76da:: with SMTP id p26mr4201755otl.311.1565934745316;
 Thu, 15 Aug 2019 22:52:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190630134404.7ba170f0@coco.lan> <20190801093400.5c351754@coco.lan>
 <20190808095535.1ec92a1d@coco.lan> <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
 <e450c395-cc9d-ee5a-c02f-821807c48947@xs4all.nl> <CAPBb6MUHX1DUid+6rDaB_yFS8xrPQKmHGnRSa1F_R0YbmNfvXw@mail.gmail.com>
 <20190814094046.GA5009@pendragon.ideasonboard.com>
In-Reply-To: <20190814094046.GA5009@pendragon.ideasonboard.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Fri, 16 Aug 2019 14:52:13 +0900
X-Gmail-Original-Message-ID: <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
Message-ID: <CAPBb6MVUrVshUZ6OWEkadVS7oS4q4uWw7ZbxcurVWZ50aGSckg@mail.gmail.com>
Subject: Re: [ANN] Media summit in Lisbon at September
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Aug 14, 2019 at 6:40 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> On Wed, Aug 14, 2019 at 05:35:48PM +0900, Alexandre Courbot wrote:
> > That could be nice. Of course something more informal is also fine.
> > Anyone else planning to attend? I suspect Laurent and people living in
> > France might be there?
>
> I will, and so should the whole libcamera team.

It seems to be confirmed that Tomasz and I will be attending. Maybe we
can come with a list of topics to discuss for all people present?

If Collabora/Bootlin is there, I'd certainly want to discuss stateless
codecs, in particular m2m codec helpers and finalize the specification
in general.

>
> > On Mon, Aug 12, 2019 at 4:28 PM Hans Verkuil wrote:
> > > On 8/12/19 6:00 AM, Alexandre Courbot wrote:
> > > > On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab wrote:
> > > >> Em Thu, 1 Aug 2019 09:34:00 -0300 Mauro Carvalho Chehab escreveu:
> > > >>> Em Sun, 30 Jun 2019 13:44:04 -0300 Mauro Carvalho Chehab escreveu:
> > > >>>
> > > >>>> Hi all,
> > > >>>>
> > > >>>> We are organizing a media mini-summit in Lisbon to happen in September,
> > > >>>> at the same week as the Linux Plumber Conference and the Kernel Summit.
> > > >>>>
> > > >>>> We're still discussing the details about that.
> > > >>>
> > > >>> Gently reminder.
> > > >>>
> > > >>> Right now, we have just one extra theme proposal from Sean:
> > > >>>
> > > >>>       - possible dvb improvements.
> > > >>>
> > > >>> If we don't have more proposals, we may end skipping the Media
> > > >>> Summit this year.
> > > >>
> > > >> It sounds that we won't have material to have a media summit this year.
> > > >> So, let's cancel the media summit this year.
> > > >
> > > > Loosely related, but are there people planning to go to ELCE on
> > > > 10/28-30? Tomasz and I may attend if there is a chance to discuss
> > > > libcamera/V4L2 codecs.
> > >
> > > I'll be there and if there is enough interest in setting up a meeting
> > > to discuss this, then I can ask the LF to set a room aside for us for,
> > > say, half a day or so.
>
> --
> Regards,
>
> Laurent Pinchart
