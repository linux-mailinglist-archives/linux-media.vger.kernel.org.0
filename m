Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DAADB7A4E5B
	for <lists+linux-media@lfdr.de>; Mon, 18 Sep 2023 18:11:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229883AbjIRQL3 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 18 Sep 2023 12:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229948AbjIRQLO (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 18 Sep 2023 12:11:14 -0400
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com [IPv6:2607:f8b0:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D2C92735
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:08:57 -0700 (PDT)
Received: by mail-ot1-x334.google.com with SMTP id 46e09a7af769-6c0b8f42409so2827421a34.0
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695053336; x=1695658136; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=btWAW5LfQ4zX4uPWHEvhYv653NKJ8tpmpeDql9QQxlg=;
        b=AKRMatTBCKwuq66iVQ+043W8LkZSAP92Cr6Sz+0jSqZSlBrrN9NyGYSpX7ch8futLX
         qBBeQeRxonIGfy7OAvtbdxKH48+kqKGpKNvABSUrD5k3wMl6bTWXWOYYK94Vf7XJZzA5
         NRyxbb94Tus1ldq2Q90TInAgHpMSXmkpvBWuM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695053336; x=1695658136;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=btWAW5LfQ4zX4uPWHEvhYv653NKJ8tpmpeDql9QQxlg=;
        b=vN/6M83/9+m8aW+Ca7kpQOvsQb7KBF0m8SuNEoe2vzKOVrxd98giEXC6P2WjXEkptV
         djNolYM53vu4NmXja41SqxNBkajeP/Z11+6KiLri1nPqySLnRrFCoGRFPatboqh6ctVb
         g2U/3VEF5PQoRcqQSVYfePuA8ZxPDWE8VjQnMcPv4SG2TtLXD67NHBZ/tXxbIr8K38M2
         AXRE6Bs9pTkJc3b+Yqnc4mSaaVmvL8u29VdpKMPYLP2yTW3aKLA/7ZrYADsuJ4e6vAy7
         ztL626uVsYi74Mf9jd/f5+BPHVufx8+X32+/N8fRwxbQu3nLsQLOoX+3teiBnWTlBYjD
         fkfw==
X-Gm-Message-State: AOJu0YzpACrF+oOV6DAJVF78UcvY+3w31o5O1733w0EfpGYRTcU4dtx7
        e12o2fpcn9pRrsvtAGNUOZMtt/FHqnRTizFm2VlWRQ==
X-Google-Smtp-Source: AGHT+IE68P55xvVLM+BSfmWQfbh7+/93buvx/ITGDO+lH5p9lYcpdG14GbwIKW6/PmntBSzskvR80A==
X-Received: by 2002:a05:6830:1642:b0:6bd:b28:fa1 with SMTP id h2-20020a056830164200b006bd0b280fa1mr10492544otr.32.1695053336150;
        Mon, 18 Sep 2023 09:08:56 -0700 (PDT)
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com. [209.85.167.178])
        by smtp.gmail.com with ESMTPSA id w14-20020a4aa98e000000b00573c4ea8668sm4230366oom.47.2023.09.18.09.08.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 Sep 2023 09:08:47 -0700 (PDT)
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3ade1c7ffcfso128209b6e.3
        for <linux-media@vger.kernel.org>; Mon, 18 Sep 2023 09:08:41 -0700 (PDT)
X-Received: by 2002:a05:6358:5bca:b0:143:4ff5:c08a with SMTP id
 i10-20020a0563585bca00b001434ff5c08amr82424rwf.25.1695053316375; Mon, 18 Sep
 2023 09:08:36 -0700 (PDT)
MIME-Version: 1.0
References: <CAMfZQbzh+o2hn6VgbMsAyjOuMG8PLwwk15neit0t1zC0b-YVKQ@mail.gmail.com>
 <20230916223736.GA8524@pendragon.ideasonboard.com>
In-Reply-To: <20230916223736.GA8524@pendragon.ideasonboard.com>
From:   Fritz Koenig <frkoenig@chromium.org>
Date:   Mon, 18 Sep 2023 09:08:23 -0700
X-Gmail-Original-Message-ID: <CAMfZQbwghyQAR78iuNdCfUda_uUxG+85yXMnwg4Kn+GNHddcVw@mail.gmail.com>
Message-ID: <CAMfZQbwghyQAR78iuNdCfUda_uUxG+85yXMnwg4Kn+GNHddcVw@mail.gmail.com>
Subject: Re: MEDIA_IOC_REQUEST_ALLOC performance question
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Fritz Koenig <frkoenig@chromium.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Thanks Laurent!
On Sat, Sep 16, 2023 at 3:37=E2=80=AFPM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Fritz,
>
> On Fri, Sep 15, 2023 at 03:07:38PM -0700, Fritz Koenig wrote:
> > Hi,
> >
> > Looking at the documentation[1] it states that the fd returned from
> > MEDIA_IOC_REQUEST_ALLOC can be close()ed and the kernel will take care
> > of making sure it is ref counted correctly.
> >
> > Because MEDIA_REQUEST_IOC_REINIT needs to be called on an fd before it
> > can be reused, is there a performance penalty to allocating a new fd
> > (with MEDIA_IOC_REQUEST_ALLOC) for every frame instead of having a
> > pool of fd's that are reused, and then immediately after queuing the
> > buffer, close the file descriptor?
> >
> > I have a proof of concept that works, but I haven't tested it for
> > performance yet.
> >
> > It would seem that maybe there is a latency penalty because the
> > MEDIA_REQUEST_IOC_REINIT is called at the end of a frame while
> > MEDIA_IOC_REQUEST_ALLOC would be called at the start of a frame.
>
> That's up to userspace to decide, you could also call
> MEDIA_IOC_REQUEST_ALLOC at the end of a frame. That would likely defeit
> the point though, as you would need to put that fd in a pool to be used
> later.
>
> Allocating a new fd isn't very expensive. The reason why the reinit
> mechanism was implemented is to avoid fd allocation errors at runtime.
> By pre-allocating a pool of requests and reusing them, you are
> guaranteed that you will always have a request available, even if the
> system runs out of fds.
>
This makes sense.  However, I'm not sure decoding video is my highest
priority if I run out of fd's ;)

> > [1]: https://docs.kernel.org/userspace-api/media/mediactl/request-api.h=
tml#recycling-and-destruction
>
> --
> Regards,
>
> Laurent Pinchart
