Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98501643EF7
	for <lists+linux-media@lfdr.de>; Tue,  6 Dec 2022 09:45:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234316AbiLFIpp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Dec 2022 03:45:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234250AbiLFIpc (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Dec 2022 03:45:32 -0500
Received: from mail-qv1-xf30.google.com (mail-qv1-xf30.google.com [IPv6:2607:f8b0:4864:20::f30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D192E1C91E
        for <linux-media@vger.kernel.org>; Tue,  6 Dec 2022 00:45:28 -0800 (PST)
Received: by mail-qv1-xf30.google.com with SMTP id c14so9987863qvq.0
        for <linux-media@vger.kernel.org>; Tue, 06 Dec 2022 00:45:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hMm0TOg4ASHFudex9FXouIDNCR8vrKXdoxs0J9clcl0=;
        b=NgsLdK/9saytgt37gvcebkklijmgTa0nF32gomwQ5VS6zoMxG91ygUM1vx3at1+LoJ
         QGvvOocK/eK8kQ1+c/wJYwaLYk/L54QhldlzBIixZYWi0lziLkTMKLFfl2q8wn3bVzvc
         iB5vm6SmCKUWq5o1Y2jJdbEv4QpTMOkbQpDnQMXTmWKBn2WKgfZ93i3nHNfMe62f+W9H
         e6tCX/GSaucvx3T+s5O1aOxDW/oftdXzUZv4/qn4EWQMnfDp3InzPdwmjcPSsNr1lumu
         ujcSfZcsNizzgWXvohH4gIsqmtlk8EF3/1F/dy2w7YtR6qvJsCubyFNpr9GwnSWATt66
         sQZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMm0TOg4ASHFudex9FXouIDNCR8vrKXdoxs0J9clcl0=;
        b=oSW/Fl02tU/zkZ3HTpIRd74aE74kPvrXfeRbDXBe4ckfTs/VPz8VjdaPsVr0pWzNha
         UD9O8m3unILBJm3Hnpq59p0HuEEZotqKZIzXGPdoBiQRYHligoEPvAQwUNWj2lIe8QG4
         eBhABb6tpZGdgNiQuaSMuO2rZ68yzIBB22MGbYM/efGU6O/YhsOAoMQaLVxZGujFlIUg
         ML3tf/HViwWSkpuaLd4WoSSbZmFgJ1D8CF8y0jCQfmRuf005nOd6NgvEF99j5tI6h/7+
         DGw0ULWkNw40pK+jc1xSe+LPRXDrxxMat9KJIZ7TauzWy/izt/kt/Eu1HhzcQ+FaYe9P
         fGnw==
X-Gm-Message-State: ANoB5pmnjBRmewWVYd3pstU1wUe/du5V+U4TWNqMh9aQWzbD4UaocW7g
        U9iNfYMLXfTb/3SiRfoD9K9au50/1S08N4PHe2aU3w==
X-Google-Smtp-Source: AA0mqf7OI1CCnPZdjUzj46MUpIxZHt95MZ3R4HBJ6hWJMzieACmc+S24PRCVGMBf8tLAl+Z2gC09EM8HctdHY+cUQDw=
X-Received: by 2002:a0c:9045:0:b0:4c7:74da:55ab with SMTP id
 o63-20020a0c9045000000b004c774da55abmr4933946qvo.59.1670316327667; Tue, 06
 Dec 2022 00:45:27 -0800 (PST)
MIME-Version: 1.0
References: <20221201023204.2177458-1-yunkec@google.com> <20221201023204.2177458-10-yunkec@google.com>
 <Y4gmqThuXxDiAHTC@google.com>
In-Reply-To: <Y4gmqThuXxDiAHTC@google.com>
From:   Yunke Cao <yunkec@google.com>
Date:   Tue, 6 Dec 2022 17:45:16 +0900
Message-ID: <CANqU6Fcqx7cXrq9K=+DzYvM8rtLfhPsrbQkaeEzTnNou_B6jGQ@mail.gmail.com>
Subject: Re: [PATCH v10 09/11 RESEND] media: v4l2: document the usage of
 min/max for V4L2_CTRL_TYPE_RECT
To:     Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Ricardo Ribalda <ribalda@chromium.org>,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks for the review!

On Thu, Dec 1, 2022 at 12:59 PM Sergey Senozhatsky
<senozhatsky@chromium.org> wrote:
>
> On (22/12/01 11:32), Yunke Cao wrote:
> > +++ b/Documentation/userspace-api/media/v4l/vidioc-queryctrl.rst
> > @@ -447,7 +447,11 @@ See also the examples in :ref:`control`.
> >        - n/a
> >        - A struct :c:type:`v4l2_rect`, containing a rectangle described by
> >       the position of its top-left corner, the width and the height. Units
> > -     depend on the use case.
> > +     depend on the use case. Use ``V4L2_CTRL_WHICH_MIN_VAL`` and
> > +     ``V4L2_CTRL_WHICH_MAX_VAL`` to query the range of rectangle sizes. The
> > +     top-left corner of the minimum and maximum rectangles should be the
> > +     same. For example, a control can have a minimum rectangle of 1x1@0x0 and
> > +     a maximum of 640x480@0x0.
>
> I assume that examples use width-height@top-left convention. Is this common
> or should it be 0x0@1x1 and 0x0@640x480?

It is width-height@left-top. I'm not sure how common it is.
I used the same format in code in patch 01/10, which was suggested by
Hans in a previous version.

case V4L2_CTRL_TYPE_RECT:
        pr_cont("%ux%u@%dx%d",
                     ptr.p_rect->width, ptr.p_rect->height,
                     ptr.p_rect->left, ptr.p_rect->top);
       break;

Let me know if you have any suggestions :) .

Best,
Yunke
