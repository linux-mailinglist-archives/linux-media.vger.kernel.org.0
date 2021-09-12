Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A1D12407F67
	for <lists+linux-media@lfdr.de>; Sun, 12 Sep 2021 20:26:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234185AbhILS1p (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 12 Sep 2021 14:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232959AbhILS1p (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 12 Sep 2021 14:27:45 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9AC85C061574
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 11:26:30 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id g14so12981586ljk.5
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 11:26:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+afOWtVRu3Y6MbtiEQhJ1O4o34THJRuSUm2FoLGYhQ=;
        b=dJiEKU6U5HlUY0/fZxvMQ0MwVcQgZ9mHD49wijwJ7g8WQIt+oEEanwybXhL+gMnV2h
         rdGbi3TcU9sHXbgl7bYFZLadVKxgiTt9JF7A1HIUOfy896/tfkJXRrg7hC5KxeDv1rlh
         Z5zEFBTqf1Fs6wJeryPCuUaOMixNyfobh7DGk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+afOWtVRu3Y6MbtiEQhJ1O4o34THJRuSUm2FoLGYhQ=;
        b=t5RM0inMGd69+BamNcyHdixRQa13eR1eZTZCQbxd/PPb/q0X+1Aa+yCid9dVXaGuhD
         brPeO79DhbKWlFQaPZfJbsfZFXnCg9bGS71m9Ey55EWK9xllj3CL9ZDmoLRHt6C1lyEX
         h0pQZzrehl1CZnuvNfFtT2eiMyg6Gk/jsYMbff6c2kRtDV6bS9HVexMmeTZjs9qIMFl+
         ryEMiP0t8PEKwkcAreh/0W40PvoU+3TryVAVWWgOaUF0/x6GHwLA9Wtkj4nN6Y17iGZH
         wVXNczFsb85eJ8945fdAN84f0RlYvschPmXMsYgqZxjEXPziPgk9W5JDHQZ4ffgz8DJs
         JQyw==
X-Gm-Message-State: AOAM533g7oDIWgbuofHkfw/hgubAv33PZlIO/DwK4CI1+1cxeCuYZBm3
        vvJJgYhzimrcbh7YZDbz4pplr2tc9b+IYGdUxco=
X-Google-Smtp-Source: ABdhPJz1niobgFBQdKDh/6v/Bi9+8YjG3mNaWNcsetIhbHVms2/mHtKhhrCdbAA3dQDQzdRxTDi1sg==
X-Received: by 2002:a05:651c:10ba:: with SMTP id k26mr6815737ljn.319.1631471188114;
        Sun, 12 Sep 2021 11:26:28 -0700 (PDT)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com. [209.85.208.178])
        by smtp.gmail.com with ESMTPSA id bi7sm582782lfb.86.2021.09.12.11.26.26
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Sep 2021 11:26:26 -0700 (PDT)
Received: by mail-lj1-f178.google.com with SMTP id j12so12977041ljg.10
        for <linux-media@vger.kernel.org>; Sun, 12 Sep 2021 11:26:26 -0700 (PDT)
X-Received: by 2002:a2e:8107:: with SMTP id d7mr7284623ljg.68.1631471186006;
 Sun, 12 Sep 2021 11:26:26 -0700 (PDT)
MIME-Version: 1.0
References: <YRoNTX3Krtw9NdkI@eldamar.lan> <20210816072721.GA10534@kili>
 <20210901104026.GB2129@kadam> <YT39LBTgGL/b/V5N@eldamar.lan>
In-Reply-To: <YT39LBTgGL/b/V5N@eldamar.lan>
From:   Linus Torvalds <torvalds@linuxfoundation.org>
Date:   Sun, 12 Sep 2021 11:26:10 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
Message-ID: <CAHk-=wjOW3Fx8td1Snezd1_9sf8q7KuQx8TyQNR0ypS2rVBHtg@mail.gmail.com>
Subject: Re: [PATCH v2 RESEND] media: firewire: firedtv-avc: fix a buffer
 overflow in avc_ca_pmt()
To:     Salvatore Bonaccorso <carnil@debian.org>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Stefan Richter <stefanr@s5r6.in-berlin.de>,
        Luo Likang <luolikang@nsfocus.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        linux1394-devel@lists.sourceforge.net,
        Yang Yanchao <yangyanchao6@huawei.com>,
        Security Officers <security@kernel.org>,
        linux-distros@vs.openwall.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sun, Sep 12, 2021 at 6:14 AM Salvatore Bonaccorso <carnil@debian.org> wrote:
>
> On Wed, Sep 01, 2021 at 01:40:26PM +0300, Dan Carpenter wrote:
> > On Mon, Aug 16, 2021 at 10:27:22AM +0300, Dan Carpenter wrote:
> > > The bounds checking in avc_ca_pmt() is not strict enough.  It should
> > > be checking "read_pos + 4" because it's reading 5 bytes.  If the
> > > "es_info_length" is non-zero then it reads a 6th byte so there needs to
> > > be an additional check for that.
> > >
> > > I also added checks for the "write_pos".  I don't think these are
> > > required because "read_pos" and "write_pos" are tied together so
> > > checking one ought to be enough.

They may be in sync at a fixed offset, but the buffer length of the
read ("int length") is not in sync with the buffer length for the
write ("sizeof(c->operand)").

So I do think the write pos limit checking is actually necessary and needed.

> > > RESEND: this patch got lost somehow.
> >
> > What the heck?  Someone on patchwork just marked this patch as obsolete
> > again!!!

Can we please make sure patchwork has some logging so that that kind
of thing shows _who_ did this?

> Someone knows what is going on here, i.e. what is the problem?

Dan, can you just send that fix to me directly, with the fixed commit
message (see above), and we can close this.

That still leaves the "who closes things on patchwork" question, but
that's something I can't do anything about.

                Linus
