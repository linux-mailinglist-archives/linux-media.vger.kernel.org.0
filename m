Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5B312550E75
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 03:58:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234941AbiFTB6T (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 19 Jun 2022 21:58:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231530AbiFTB6P (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Sun, 19 Jun 2022 21:58:15 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3174D278
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 18:58:05 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-3178acf2a92so52339217b3.6
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 18:58:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/favDYB+UkaS/f9DgZSEjIPuGCfWycrdA8DD+CPeWxc=;
        b=tFVqSFQxBf7fy0B//xprnvBTPJasTwnPG/2wAJY8yHLS6DAU1cs8LP1OXEP4txa7KL
         osoXs0Ur2DlfwR5RYnzq9myYQbULsN9xipuh9P2gb5a5n0GP2gCikbHGyK1HSCJccjna
         MQV93epej8cJuZ1hnNcOf9PD/YOuBBKe9+TYuebc1QBstYp7e/pOHhUXvDCcUFVhJTO0
         4igPny6aqzu2w6sjhAnrqy1m4BDsACg7pSVoZbAu6Mqmc0KYK9DBuTYWVKlKVj4ISPpB
         8mlfz4EVKSVpmnBoyS/elOLqWyLEa66Uf21WPSVcVXZ4N4cm+8sjMM9tZUBNdeUQh7Uu
         RehA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/favDYB+UkaS/f9DgZSEjIPuGCfWycrdA8DD+CPeWxc=;
        b=Mrp7t9g4+VtjXXWDpjrtQODByHfSP+QK+tE307EE+0mjUAk+sN4PY73WWHwW9Q/t+z
         GuCDphQcotd8bH8o+KW3/zQ6WO/5n6VF+hCJ4lJVySco6ac9qltyBF90xMje3V0jgO05
         30cmz801YvTa0m6e/0Fs5xjwFjCqTlTCDqOlCLNjTZLBRrV65j1Vl8C0gZF2vYfR2p+l
         M5dWDPzDYZBVjIgid8JGn82zXhonqCVB2e4bHZGb9qVakIGrwugt1cjhPSneICQR0K+5
         jRL1DQpa33Tzk9oZV2wrwSal8W1OIYuy8wnIE+O7L9OCvotTOypq+OhxnQbBkCbpihsx
         D0Kw==
X-Gm-Message-State: AJIora/E/aYwtEpDmjcdt4/CiRhr7PvL9eyuNznPSEP9egmLB0MJ3OtE
        SQcebaScYODOVE1lxCSchhR6gGnvti2RoLUHyaIgUA==
X-Google-Smtp-Source: AGRyM1vt6GCuCS8mo5gzBJIUhdr5TfvAbhvvCff50+Lbn2w4PX3J+fgOcaBytfC/4GBt4aBdPAdJxRlMxDXp9OvJLx8=
X-Received: by 2002:a05:690c:3a1:b0:317:7c2d:a81a with SMTP id
 bh33-20020a05690c03a100b003177c2da81amr19771122ywb.380.1655690284901; Sun, 19
 Jun 2022 18:58:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220617015745.3950197-1-yunkec@google.com> <20220617015745.3950197-2-yunkec@google.com>
 <177345ff-f601-e440-31e0-2c967736af6b@linuxfoundation.org>
In-Reply-To: <177345ff-f601-e440-31e0-2c967736af6b@linuxfoundation.org>
From:   Yunke Cao <yunkec@google.com>
Date:   Mon, 20 Jun 2022 10:57:54 +0900
Message-ID: <CANqU6Fed=E1ogvR1ccwJA9bR_9VxU4QPd6PjvBAyRrMeQuRWfg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] media: vimc: add ancillary lens
To:     Shuah Khan <skhan@linuxfoundation.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        Tomasz Figa <tfiga@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Shuah,

Thanks for the review.

On Sat, Jun 18, 2022 at 5:01 AM Shuah Khan <skhan@linuxfoundation.org> wrote:
>
> On 6/16/22 7:57 PM, Yunke Cao wrote:
> > Add a basic version of vimc lens.
> > The lens supports V4L2_CID_FOCUS_ABSOLUTE control.
> > Link the lens with vimc sensors using media-controller
> > ancillary links.
> >
>
> Commit log lines are usually ~75 charracters long. Make it easier
> to read.
That's good to know. Thanks!
Should I send v3 and trim the commit log?
I'm thinking something like this:

The lens supports FOCUS_ABSOLUTE control.
Link the lens with sensors using ancillary links.

>
> > This change can be used to test the recently added ancillary
> > links.
> >
>
> Care to add instructions on how one would test ancillary with
> this feature?

The lens shows up in the media topology. I documented it in 2/2.
Not sure what else is necessary here.

Best,
Yunke

>
> > Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>
> > Reviewed-by: Kieran Bingham <kieran.bingham@ideasonboard.com>
> > Signed-off-by: Yunke Cao <yunkec@google.com>
> > ---
> >   drivers/media/test-drivers/vimc/Makefile      |   2 +-
> >   drivers/media/test-drivers/vimc/vimc-common.h |   1 +
> >   drivers/media/test-drivers/vimc/vimc-core.c   |  86 +++++++++++----
> >   drivers/media/test-drivers/vimc/vimc-lens.c   | 102 ++++++++++++++++++
> >   4 files changed, 170 insertions(+), 21 deletions(-)
> >   create mode 100644 drivers/media/test-drivers/vimc/vimc-lens.c
> >
>
> thanks,
> -- Shuah
