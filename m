Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD5FA71680
	for <lists+linux-media@lfdr.de>; Tue, 23 Jul 2019 12:47:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729365AbfGWKre convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-media@lfdr.de>); Tue, 23 Jul 2019 06:47:34 -0400
Received: from mail-qt1-f173.google.com ([209.85.160.173]:36327 "EHLO
        mail-qt1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726343AbfGWKrb (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 23 Jul 2019 06:47:31 -0400
Received: by mail-qt1-f173.google.com with SMTP id z4so41437541qtc.3
        for <linux-media@vger.kernel.org>; Tue, 23 Jul 2019 03:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=wF9w9R25zyNBF6vNfN1cmSUaCysQdjcWUcUV740Wuqs=;
        b=IygxHY90yIe7lvRBr7XjM0+KtbRz9s1I90Ja4N86iBi1bFfVqleR35Mq52Me20wrZT
         hS5zyY/RctAai4inw0D54DuRxeo8cYdJlPEjeP16hjSRoFLak1X6I0oqxLInkEjt03e3
         YoTHuYKsREQqC42OGr9/y7acIWr8QyllOX/ciSXHw5bkqBKAYBnl5Avzz25vRqSrWkjA
         PcEuQ1fptNkqM67iY3/9raS9c2anFZbg36/KjWM4V9x+FwepTn3w5UV7I32q4KtQJitA
         M59lGE0ZnRmLQClGabDyzFqYTZq2FeIyMncX9bVmG+zBcugRrevhzfCCA6UjDB1og/D0
         az1A==
X-Gm-Message-State: APjAAAVX0T1CE0W1u+700mVa4qD/ktW68auQ/53J6xkj4opBeiqlVs/E
        3FyDBy1ugOZQNiGLMFqXMBcWjuXAVlk52O9P/tg=
X-Google-Smtp-Source: APXvYqzMla3mXKBASQGgbj50kW6t+ILXkCO4Tr2H2WYKNeypD5TAKlx06rYJFkdIWS1dU4pWdqK6O/Q5NbDokAKSDLE=
X-Received: by 2002:ac8:f99:: with SMTP id b25mr45901620qtk.142.1563878849577;
 Tue, 23 Jul 2019 03:47:29 -0700 (PDT)
MIME-Version: 1.0
References: <93050d86-ec75-8394-4fdb-6a06ebb5ce6b@xs4all.nl>
 <cc1790b8-4199-e0ef-afb9-36eca9fd5c0a@xs4all.nl> <CA+V-a8tK+YGf7ww27OzM6FuO_4hwbz0eOvqFKgGe2cdiULzb6A@mail.gmail.com>
 <88fa0656-e819-3558-7d16-478cf8be75fc@xs4all.nl>
In-Reply-To: <88fa0656-e819-3558-7d16-478cf8be75fc@xs4all.nl>
From:   Arnd Bergmann <arnd@arndb.de>
Date:   Tue, 23 Jul 2019 12:47:12 +0200
Message-ID: <CAK8P3a3pVDMsbQM0scrho0WvtVW0UykbgS_Fjpz87ObZUA3kNg@mail.gmail.com>
Subject: Re: [RFC] Removal of drivers/staging/media/davinci_vpfe
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     "Lad, Prabhakar" <prabhakar.csengg@gmail.com>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Sekhar Nori <nsekhar@ti.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Tue, Jul 23, 2019 at 11:25 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 7/23/19 11:06 AM, Lad, Prabhakar wrote:
> > Hi Hans,
> >
> > On Tue, Jul 23, 2019 at 9:48 AM Hans Verkuil <hverkuil@xs4all.nl> wrote:
> >>
> >> +Laurent Pinchart
> >>
> >> On 7/23/19 10:46 AM, Hans Verkuil wrote:
> >>> Hi Prabhakar,
> >>>
> >>> This staging driver is now almost 7 years old, but hasn't seen any real
> >>> development for a long time.
> >>>
> >>> I think it is time to remove it, unless you plan to do work on this.
> >>>
> >>> What do you think?
> >>>
> > I don’t have any plans to work on it anytime soon, and also referring
> > to Sekhar's email
> > on Arnd's patch he's OK too drop the driver from staging.
> >
> > shall I create a patch doing this ?
>
> Arnd mentioned he was going to post a patch for that.

Sent a patch now, I had not seen this thread before creating that.

      Arnd
