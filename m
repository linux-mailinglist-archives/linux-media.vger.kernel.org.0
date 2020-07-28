Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BA4C231004
	for <lists+linux-media@lfdr.de>; Tue, 28 Jul 2020 18:43:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731408AbgG1Qng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 28 Jul 2020 12:43:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726548AbgG1Qng (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 28 Jul 2020 12:43:36 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ED521C061794;
        Tue, 28 Jul 2020 09:43:35 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id j7so1660685oij.9;
        Tue, 28 Jul 2020 09:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=o9m50VK1lLtc7nqDyGrRl3rlBYyarY0M7UxRlCvTi7I=;
        b=kasojJKthl+GEvqSoBsCRID44wuGMn+EsMrib6445AcUxFCXTdk+LV+UutBeNLeKMy
         wQHv2tfVgg5xO85/Sz0BF+RFh6ScEtqDtW5vfEGtUHwCRw7Lt7X+EuZ6tJbeYOObJxNQ
         aVqyb0tE9vVtp2WJCkZwM05lwmmYciFa20/jjPrao7IfnG/03b/CQUYbJJFnnUuviZmL
         Zt3OJDLvvKx4yvdDctSfYv8c6BJ4Ms8WrKLtw0SBuBrwPR+MAped04fEvFFqx+Mk9ccQ
         My2cDrwkdpvLRhZGOAX51mwn2KMe2azsvTahatIf9qxmUVqCg3pRSGkBIr+XjnZVpQzA
         yTMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=o9m50VK1lLtc7nqDyGrRl3rlBYyarY0M7UxRlCvTi7I=;
        b=P8/8yDmj73oqqcQKiuymZ9Oc0IYmWEQI7CGnPu7LGbNrDrTa812FbxBpaQpHns+enW
         yLIXIxZcvyYxUXJBj9KrYwV6iditk9WGSfshzVnKGIlJfR5sfriEF8URrJFtRHKtun6v
         Qp9BgQySG7ypWuDQmliyP9lLHD1vUMmfz2ZyTLpKmv4y77skmqbRwitoORxqPrLnaHUZ
         XqK22zf092ompzqAhVe10rcg6fuKEbgmqa/x7SKmg2cF6ugP8XFST80JJ92qgaySIW/w
         yxY5WF6ExB3VoOaJYh0D/uhd8bjqgUMaAdm2i8lHGaQ31iZez+9J52pS8iE9lFxI2W+Z
         rKrQ==
X-Gm-Message-State: AOAM531F96Kr5dBz7VqpFPBKXPvIy+gtcaGr01bdKdSrZSDU61Xq3RsL
        MisuCNpWcOz7nlHva6nGOzfJX3o0LbE+RhpzqLHxuLBIaTg=
X-Google-Smtp-Source: ABdhPJwU8sW/xnW2NBa1NBhKNrTCmmvZt+59DdL3+fpJrB75Cl9bvxj94xoZl+PaI/NK6YOpUnLYafHbsXqa6ov1Jtc=
X-Received: by 2002:aca:c5d6:: with SMTP id v205mr4466193oif.143.1595954615271;
 Tue, 28 Jul 2020 09:43:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200728143004.3228-1-dhiraj.sharma0024@gmail.com>
 <20200728145419.GA3537020@kroah.com> <CAPRy4h1Xs1JpQinnWm04dOi07Ch0RLL0U4Z5DDCKHmombXE0sA@mail.gmail.com>
 <20200728155311.GA4178776@kroah.com>
In-Reply-To: <20200728155311.GA4178776@kroah.com>
From:   Dhiraj Sharma <dhiraj.sharma0024@gmail.com>
Date:   Tue, 28 Jul 2020 22:13:22 +0530
Message-ID: <CAPRy4h2Zbw=QwJ7=0+FzGnK_o1esn2GTRSuv5ZE30Vu=Oj=x=Q@mail.gmail.com>
Subject: Re: [PATCH] media: usbvision: fixed coding style
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     devel@driverdev.osuosl.org, arnd@arndb.de,
        linux-kernel@vger.kernel.org, Hans Verkuil <hverkuil@xs4all.nl>,
        stern@rowland.harvard.edu, jrdr.linux@gmail.com,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

> As the bot said, only do one type of thing per patch, and "fix all
> checkpatch errors/warnings" is not one type of thing.

So should I send a fresh patch with minimal fixes? instead of replying
to this mail with [PATCH 01]
