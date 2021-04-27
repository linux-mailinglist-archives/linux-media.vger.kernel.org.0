Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05CDB36C738
	for <lists+linux-media@lfdr.de>; Tue, 27 Apr 2021 15:48:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236460AbhD0Nsr (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 27 Apr 2021 09:48:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234429AbhD0Nsq (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 27 Apr 2021 09:48:46 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24A9CC061574
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:48:02 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id a13so14399275ljp.2
        for <linux-media@vger.kernel.org>; Tue, 27 Apr 2021 06:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nXO54wJzrr64si2OY2sg9nabbM6qht5N6+Hpyzx+Is4=;
        b=ZQ56k0VH6ujwHb1BequjqgqsKtR9j+clqSMDpLBd4zby+Z2NnVRwfGrYstIRF7lUr5
         lQHtFXMqPWGnb58m5Q84yB3KV4Qx1IsXffbTkbcNcHSlKTV1Sg89+1mzdU0KE+jokknB
         R8tpv9BbDkhRC/iz4Cq/icrJ85FaQ/pFCIKllp5q9ocu6g4/JMe2qcRDGt9gsUdk5jw9
         bRrrHo6fZKO8tJUpbv/I/2EVKgMwn0TYzEciXEsxQlokz008TTmhgBrnzVL0PWStc9T9
         xeV6eB+nLsq+r8RddZA4GtTI4NXQQcJ+Ml0P3CVT3rs8Wkrt18SHu2qrImIOkK3lXNTg
         Ax0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nXO54wJzrr64si2OY2sg9nabbM6qht5N6+Hpyzx+Is4=;
        b=dqUd5ZRFCOdsYPT4xJe0aZNoOwxq8XaLiYKdqqJJIbRX8cKDqWoD10uBQB6tEN0Ap6
         kJ1+HOYeJ3BnRLXE1laBuo7a9HV8of4qPA+ThOZ2hfLepU4YaPKggseN8hmRLrG9W7O2
         P+/+W4+j7789mXqhpcRRwT96rOVqenmhTqu0GDZImp0YbkrCUy92xp18WaPq95hCb1Hd
         AUz5pah0iND0LOekmLl7LCxWhyU+eyEHEzQgV7x4enovQVJlkWI9xbElOw8vG2XrCICT
         gi11tdglCvSg+57LC37xZ+QSt3T5hLOOhgzJOYWhuofyb7FXtfun4iCc8rvevbPtAnd6
         /JPA==
X-Gm-Message-State: AOAM532iVw+salvFLZtr/f/2YsDuy6/ztHgravlpADCExVPCtrWXscWg
        UDkQsOn7VD/FXu+lB4gAwxb/JmH2EjGeCugku+E=
X-Google-Smtp-Source: ABdhPJyRQbqz0vkMOGcd/mN5Xs3Kq4cH0TRTeYI/QUhSZkwwJKyXbxKGMujM3W6Dd9knmavqml1Dsiuz0oylXE+BE18=
X-Received: by 2002:a2e:3303:: with SMTP id d3mr2678739ljc.264.1619531280648;
 Tue, 27 Apr 2021 06:48:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAOMZO5CacHaESju9XQU1C7NU41Myk1-2_+7sju1dnCZuqRv98Q@mail.gmail.com>
 <CAOMZO5BEre9=se1yAxr7QTmfV_N=GMKZeanr+jYfRNrSO551hg@mail.gmail.com> <4ea17a0c-b442-1ca2-1ae3-7a305d53273f@kontron.de>
In-Reply-To: <4ea17a0c-b442-1ca2-1ae3-7a305d53273f@kontron.de>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Tue, 27 Apr 2021 10:47:49 -0300
Message-ID: <CAOMZO5Bztrpm4aB9=DmR=3PNfZUoM_niT_+nVE-ZOQm5aUEWBA@mail.gmail.com>
Subject: Re: adv7280: Scrolling images on imx6
To:     Frieder Schrempf <frieder.schrempf@kontron.de>
Cc:     Tim Harvey <tharvey@gateworks.com>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Nicolas Dufresne <nicolas@ndufresne.ca>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Frieder,

On Tue, Apr 27, 2021 at 10:33 AM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:

> I don't know much about the v4l/media subsystem, but in my case I was
> able to switch to PAL like this:
>
> v4l2-ctl --device /dev/v4l-subdev2 --set-standard PAL
>
> Though your subdev is probably a different one as I was running this on
> i.MX8MM without IPU.

Thanks, this does the trick!

I will try to upstream Steve's patch then.

Thanks a lot
