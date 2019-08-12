Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E053F895E5
	for <lists+linux-media@lfdr.de>; Mon, 12 Aug 2019 06:00:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725800AbfHLEA1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 12 Aug 2019 00:00:27 -0400
Received: from mail-ot1-f66.google.com ([209.85.210.66]:38086 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725648AbfHLEA0 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 12 Aug 2019 00:00:26 -0400
Received: by mail-ot1-f66.google.com with SMTP id r20so4377014ota.5
        for <linux-media@vger.kernel.org>; Sun, 11 Aug 2019 21:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nKjP0YfGl8MC1i199LOWjH7Zkadb76qmeZDha6eBTuY=;
        b=Ex9vrkO1TTeHnBeX59ygYbswVxrP9KhrOJcbSTqbRWSWDrffYwywTPuV4UN8dOJDhC
         Kl/ASBZOGUuIoJnLshJFGONuKyDnsSo+e+dLoZ48qrESTdlDMuqdYhvN14uBgdbNcuwF
         IqICA6WhUNeH3zo/Wsudzafet6h+nGI+Fd5Gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nKjP0YfGl8MC1i199LOWjH7Zkadb76qmeZDha6eBTuY=;
        b=IqUVw37nHw6SOM+WbjjSJ86wd2yTULFRzMRnZn1DnX8jWYbXKfBXAI4wZBEa9JEMWo
         eoXEDuBUSSyMXVvamOHTDLMw88hzxSIfLFvQl9NzqdD/t4+k1KntK5EYNWcQRtHMprKG
         mX9Fu5+Sk628y4/y9U5PYC9lbiKmFcFmNHQzV7D/WXwXvwBhWyZauf1rAiuXWsqZkB9u
         FQsMR5PZuxhxqAOgObiVqQjVKwSWmJWN/06Jw2kNIrb0gCLL+8Luvh+mt77YKM5nbY72
         AU+qgVi8rP8D6WidUiKAS48AyifPw501l3JiMtgOrDQXuoGJ23bZBlcFsbTOWbh3OyHd
         BCKQ==
X-Gm-Message-State: APjAAAUIfGtNOHHy4RNvtP7UGneeSIRcO6mRtIyuy4HUYcjQjgPBIeys
        PBgVVQpjMBbVH6Whu5SroaDqH6diow4=
X-Google-Smtp-Source: APXvYqzrADMZFYMiTPbJxhv/IvC4OT78qUuzvEXBNnxeF6se5NttubvdElwAhtNPj0ZroD6NZuC1vQ==
X-Received: by 2002:a9d:7a4e:: with SMTP id z14mr20340411otm.258.1565582425838;
        Sun, 11 Aug 2019 21:00:25 -0700 (PDT)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id q24sm32216437otl.31.2019.08.11.21.00.24
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 11 Aug 2019 21:00:25 -0700 (PDT)
Received: by mail-ot1-f52.google.com with SMTP id r20so4376726ota.5
        for <linux-media@vger.kernel.org>; Sun, 11 Aug 2019 21:00:24 -0700 (PDT)
X-Received: by 2002:a05:6830:2094:: with SMTP id y20mr4285485otq.36.1565582424138;
 Sun, 11 Aug 2019 21:00:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190630134404.7ba170f0@coco.lan> <20190801093400.5c351754@coco.lan>
 <20190808095535.1ec92a1d@coco.lan>
In-Reply-To: <20190808095535.1ec92a1d@coco.lan>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Mon, 12 Aug 2019 13:00:11 +0900
X-Gmail-Original-Message-ID: <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
Message-ID: <CAPBb6MUknz7hOpG=hHF59QwvMxJR-=RxWvK2aTPo=97XKqPPQA@mail.gmail.com>
Subject: Re: [ANN] Media summit in Lisbon at September
To:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Tomasz Figa <tfiga@chromium.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Aug 8, 2019 at 9:55 PM Mauro Carvalho Chehab
<mchehab+samsung@kernel.org> wrote:
>
> Em Thu, 1 Aug 2019 09:34:00 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
>
> > Em Sun, 30 Jun 2019 13:44:04 -0300
> > Mauro Carvalho Chehab <mchehab+samsung@kernel.org> escreveu:
> >
> > > Hi all,
> > >
> > > We are organizing a media mini-summit in Lisbon to happen in September,
> > > at the same week as the Linux Plumber Conference and the Kernel Summit.
> > >
> > > We're still discussing the details about that.
> >
> > Gently reminder.
> >
> > Right now, we have just one extra theme proposal from Sean:
> >
> >       - possible dvb improvements.
> >
> > If we don't have more proposals, we may end skipping the Media
> > Summit this year.
>
> It sounds that we won't have material to have a media summit this year.
> So, let's cancel the media summit this year.

Loosely related, but are there people planning to go to ELCE on
10/28-30? Tomasz and I may attend if there is a chance to discuss
libcamera/V4L2 codecs.
