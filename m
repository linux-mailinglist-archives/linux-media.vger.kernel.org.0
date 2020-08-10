Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 87881240264
	for <lists+linux-media@lfdr.de>; Mon, 10 Aug 2020 09:23:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726089AbgHJHXU (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 10 Aug 2020 03:23:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbgHJHXT (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 10 Aug 2020 03:23:19 -0400
Received: from mail-yb1-xb41.google.com (mail-yb1-xb41.google.com [IPv6:2607:f8b0:4864:20::b41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BCA8C061756;
        Mon, 10 Aug 2020 00:23:19 -0700 (PDT)
Received: by mail-yb1-xb41.google.com with SMTP id g3so1637642ybc.3;
        Mon, 10 Aug 2020 00:23:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ANR7+RLPKBGxOqXxxUQUqxXFiaO4oBpzGIQRW0WVM/k=;
        b=Uw4kJBVyINzL3H5dzKs85M7fDr0bvtu6awqtjBDuZIsjYfXLKFhgADett+saqb9aWG
         lyKe2Q0105n9PALpQnBOd/YtWCPBlrIMiVMcnkcllbhg6fO9/pxlu9E1+jMiLBY5wyLe
         BfRubpIMVYZHSrT/ymfkm2fVIN7zGKHGNuGOMA5snbKSpjld1Sv2i/Oovf1uId1qFImM
         +saHUMOOHqMwf8ccSSn1nPO9oF+SiqIU28rQdNxjMID2L+db27qW0R4HzMAPi0NctH7y
         kRBS5gsT10qOYlelQYDNd88uTHZoip41ZkxzknYpJCAe+2Kcm9404zS9/lE8ippXel0e
         ZIQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ANR7+RLPKBGxOqXxxUQUqxXFiaO4oBpzGIQRW0WVM/k=;
        b=FMZsQKO9JCm41Lk0fB3DwOsoFnYsckM65mYspIHuxr5q0dpW9TAEe+t5NgcT1Bb1rJ
         yarniw1NLNbYt7GHepsAOEqf8cJ0PWLF+HdZpryiWSb9ngW7UOkIGhl9ei2v9vOyJ6ps
         H8WQIAL0vM8PIJCZZbqLA4uIO+BK2xl2UnqQzBJ5jRkRzFw/MiKKYh5LGYbZAtrkLJ8K
         7mGYWR4fhm8LLtgFIX1iJdd+if3Xjn+AWPwE2Q5ympDcH0P3eNMvcSnLyIMo2YnHNxRV
         pTsSndKXvUjpDDKzLuYnXl8d2pjcjAKubIwcXoWke/wG468pFqsuQ8637l1YJsNpZBpU
         2yiQ==
X-Gm-Message-State: AOAM530v58M4OQPIagA3qUhz8vPi6Jw4qevrFFtG3OEeg1muZVy9s2Ah
        2doHjzFSLUFxzYQy/naaQUjFgoZ1eM4NMvBEII0=
X-Google-Smtp-Source: ABdhPJz9YtA5r0gyeWQ8/utyl5iTIa8cD2BpJQiEbgb1iOpQ3xsq68SsenTlc0sjjfhVV6DdyVh8fCEIeOZ5xY6D3BI=
X-Received: by 2002:a25:6ad6:: with SMTP id f205mr38529089ybc.76.1597044198696;
 Mon, 10 Aug 2020 00:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <1596454753-13612-1-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <1596454753-13612-2-git-send-email-prabhakar.mahadev-lad.rj@bp.renesas.com> <20200806143559.ha6amfa4gq2o4jbi@uno.localdomain>
In-Reply-To: <20200806143559.ha6amfa4gq2o4jbi@uno.localdomain>
From:   "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date:   Mon, 10 Aug 2020 08:22:52 +0100
Message-ID: <CA+V-a8tk_KNoie0=aLBnj31RYoeHqHp8jnxqyJcPxWbkq6xTRA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] dt-bindings: media: ov772x: Document endpoint properties
To:     Jacopo Mondi <jacopo@jmondi.org>
Cc:     Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        linux-media <linux-media@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>,
        Biju Das <biju.das.jz@bp.renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Jacopo,

Thank you for the review.

On Thu, Aug 6, 2020 at 3:32 PM Jacopo Mondi <jacopo@jmondi.org> wrote:
>
> Hi Prabhakar,
>
> On Mon, Aug 03, 2020 at 12:39:11PM +0100, Lad Prabhakar wrote:
> > Document endpoint properties required for parallel interface
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../devicetree/bindings/media/i2c/ov772x.txt     | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/media/i2c/ov772x.txt b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > index 0b3ede5b8e6a..1f4153484717 100644
> > --- a/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > +++ b/Documentation/devicetree/bindings/media/i2c/ov772x.txt
> > @@ -21,6 +21,22 @@ subnode for its digital output video port, in accordance with the video
> >  interface bindings defined in Documentation/devicetree/bindings/media/
> >  video-interfaces.txt.
> >
> > +Endpoint node required properties for parallel connection are:
> > +- remote-endpoint: a phandle to the bus receiver's endpoint node.
>
> we allow endpoints without a remote end connected usually. They can be
> filled in later, in example, with an overlay.
>
Agreed.

> > +- bus-width: shall be set to <8> for 8 bits parallel bus
> > +          or <10> for 10 bits parallel bus
> > +- data-shift: shall be set to <2> for 8 bits parallel bus
> > +           (lines 9:2 are used) or <0> for 10 bits parallel bus
>
> defining what is required or optional might be hard. I don't see the
> driver enforcing their presence and I assume they have safe default.
> Maybe make them optional and specify what the defaul value is ?
>
Will do.

>
> > +- hsync-active: active state of the HSYNC signal, 0/1 for LOW/HIGH respectively.
> > +             (Not required for bus-type equal 6)
> > +- vsync-active: active state of the VSYNC signal, 0/1 for LOW/HIGH respectively.
> > +             (Not required for bus-type equal 6)
>
> If they're not required, they're optional, aren't they ? :)
>
Agreed.

> > +- pclk-sample: sample data on rising (1) or falling (0) edge of the pixel clock
> > +            signal. (Not required for bus-type equal 6)
>
> Why the pclk polarity is does not apply to BT.656 ?
>
No it should apply.

> > +- bus-type: data bus type. Possible values are:
> > +         5 - Parallel
> > +         6 - Bt.656
>
> Are we making this required, or do we expect this to be deduced
> depending on which other properties have been specified ? Sakari it
> seems you would like this to become a properties that has to be
> specified most of the times, right ? (I tend to agree with that FWIW),
> but does it impact retro-compatibility ?
>
Agreed can be deduced from other properties. But shall wait for Sakari
to comment.

Cheers,
Prabhakar

> > +
> >  Example:
> >
> >  &i2c0 {
> > --
> > 2.17.1
> >
