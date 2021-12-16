Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5319B47683B
	for <lists+linux-media@lfdr.de>; Thu, 16 Dec 2021 03:43:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231207AbhLPCng (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 15 Dec 2021 21:43:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231202AbhLPCnf (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 15 Dec 2021 21:43:35 -0500
Received: from mail-oi1-x22d.google.com (mail-oi1-x22d.google.com [IPv6:2607:f8b0:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E288C06173E
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 18:43:35 -0800 (PST)
Received: by mail-oi1-x22d.google.com with SMTP id m6so34460165oim.2
        for <linux-media@vger.kernel.org>; Wed, 15 Dec 2021 18:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SZBQ577Z00Gsm2ELBgWvaGZ7PZo29hRdVb3EOpEKqss=;
        b=eYYmyBfqnAYpsCbL05z+3k3G5fpCc4Z/EeMS545DBILp9csCvzNnATnPqIYfAIsA1q
         o/z32a3YKosoDTl6zOn5P4YNabxqk2HrAazzugbLevahDvtQOZlQJYCUxIQ2HzqOYbhN
         B6uaoUlX8+2BIU1r5fYRWqyTTO60K53uxM/gmmGB+qAt6sG5H6i45RED7qun3fB1pLjj
         IDabNWFLkpni+lkFUomfbEint9i1AUqmeQEFPhIx1RRMhjj8O7x1EyT2grotjvcQjgIA
         OAXDTq++AGqZiWfTpiRwT6EMWvM4RRguxMkSNsSdRK/nzbezmjdjXwTZFUFGHK/hNLGG
         fqXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SZBQ577Z00Gsm2ELBgWvaGZ7PZo29hRdVb3EOpEKqss=;
        b=5roYjnu4I5eWZXAG2oLOToP8MMz+FBrI/vEf2DZCIwEP1ML0nt54O5ootOO57dlFet
         xxEJMW8YJRaftHFrQbt/eJVzKx1gi/A/So6XMzmJdpxclNRUmxZZ5OaKeWDoBWnJk7Ij
         M5+pT7zOwrnuDy5mB77DKE3pOwmzPhARxckk1e3LJe02JZQ3gVrEWKD0hGsxfXB1KgW/
         1RkSpxnfCG73AqHZT8o2wwnbPzfRzdyY/YP7z7SBeV51BpSwRe6gkWfeLIUcx9YsiEfQ
         SIDLDQBx2YJNfoOmdgYLrAme9egiWqG8oTyY/AxcR3LRNmQ/We9wTiFKP9bqSCxYysDz
         LpQg==
X-Gm-Message-State: AOAM533mMQ/soWw/0f4PpGPdmSLFk1/X7Jq+BhpJsWalpi1bLQHo4Cx+
        6SCbRV3ETrJhNH7roMCKqbMUH8vKum2i1olN8FSzNw==
X-Google-Smtp-Source: ABdhPJwNJgqrfeC5CN/Gvm+NgkvRXKGZS2NCxanweRecHxOftNdIweNOo08zNh4qiNSFqwGqnz/kOIrsGlbo0tpzaB4=
X-Received: by 2002:aca:120f:: with SMTP id 15mr2525146ois.132.1639622614228;
 Wed, 15 Dec 2021 18:43:34 -0800 (PST)
MIME-Version: 1.0
References: <20211206131648.1521868-1-hverkuil-cisco@xs4all.nl> <20211206131648.1521868-3-hverkuil-cisco@xs4all.nl>
In-Reply-To: <20211206131648.1521868-3-hverkuil-cisco@xs4all.nl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Dec 2021 03:43:22 +0100
Message-ID: <CACRpkdbsGekjw78jmR1yy5xRbup3L67Xga12zd1LJiyHmaEs7A@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] pinctrl-bcm2835: don't call pinctrl_gpio_direction()
To:     Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     linux-media@vger.kernel.org, linux-gpio@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>,
        Florian Fainelli <f.fainelli@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Dec 6, 2021 at 2:16 PM Hans Verkuil <hverkuil-cisco@xs4all.nl> wrote:

> Set the direction directly without calling pinctrl_gpio_direction().
> This avoids the mutex_lock() calls in that function, which would
> invalid the can_sleep = false.
>
> Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Patch applied.

Yours,
Linus Walleij
