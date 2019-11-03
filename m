Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF8C7ED3E3
	for <lists+linux-media@lfdr.de>; Sun,  3 Nov 2019 17:45:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727771AbfKCQpq (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Sun, 3 Nov 2019 11:45:46 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:41233 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727682AbfKCQpp (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Sun, 3 Nov 2019 11:45:45 -0500
Received: by mail-lj1-f195.google.com with SMTP id m9so15008013ljh.8
        for <linux-media@vger.kernel.org>; Sun, 03 Nov 2019 08:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ksEu0A0KjLwy1M0pwU6CUlXpOlz1Dc+D61V1TG3xX/c=;
        b=Puv7vmSp8hqtr7dTSpIERhXWbuCG6m92q8NpW8kfcLLCpTj2WmtgknmsiAhxP7lWV6
         7+Vkeqs7gpDvpz9+OB1fTJzaOGKN3uQHkO587f1Z9kaGu38OIBzIX2T6wxkdCPz+6XAO
         iIYgAnhZTNw8f+CmIl6V01mf3+EqjV1hHwUwk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ksEu0A0KjLwy1M0pwU6CUlXpOlz1Dc+D61V1TG3xX/c=;
        b=n4Gp8ymstyJMFf87vDXXQkNh24lpIy03pVSerMq3ZTcM3QKAcWaEi8vAPwQqkESYiE
         suD545yr/KefJzuAot5gjR++oe7LZKFfSnIVVp8jF5Wi34oZ+Kjxh+FR4Q1TxoR2sefs
         ea8cJcvGsbEG04t2MdlJ6G3H5PEEBV/GFhvhfWoctgF4gbAP8R7cKA2bYJNwwcieauCx
         qqKMuoUoKhpDIcJ0qvQipqpgU7rgkYcevvNJS2pEMNOlYBNzKPCwq392GOCiK1fr7ucO
         FpwahLnxqg8NB7ylxGXDPkLUSW/lzFyuuUaPwCEc3L3R17X6nOHNV4Ywf7AmAoN04wyx
         T3nw==
X-Gm-Message-State: APjAAAWyZOtJ8e8br3VdHM1bU38ZrK0xWCGaqTPSxSfEVgqAJnj7Fb9t
        A8KMmTqcXvObfJl5EmNLCbP+GcIY+x0=
X-Google-Smtp-Source: APXvYqww8kvo6QiMWz9DxsqUBlsCHoPQLLs+VnxslbBq9N77Tz0Mk9oFeGG5DuTDA8JlP263yD1pEA==
X-Received: by 2002:a2e:868d:: with SMTP id l13mr15348088lji.136.1572799543213;
        Sun, 03 Nov 2019 08:45:43 -0800 (PST)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com. [209.85.167.47])
        by smtp.gmail.com with ESMTPSA id t26sm5067708lji.4.2019.11.03.08.45.41
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Nov 2019 08:45:42 -0800 (PST)
Received: by mail-lf1-f47.google.com with SMTP id 195so10451493lfj.6
        for <linux-media@vger.kernel.org>; Sun, 03 Nov 2019 08:45:41 -0800 (PST)
X-Received: by 2002:ac2:4c86:: with SMTP id d6mr13812625lfl.106.1572799541430;
 Sun, 03 Nov 2019 08:45:41 -0800 (PST)
MIME-Version: 1.0
References: <20191102190327.24903-1-alex.popov@linux.com>
In-Reply-To: <20191102190327.24903-1-alex.popov@linux.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Sun, 3 Nov 2019 08:45:25 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgE-veRb7+mw9oMmsD97BLnL+q8Gxu0QRrK65S2yQfMdQ@mail.gmail.com>
Message-ID: <CAHk-=wgE-veRb7+mw9oMmsD97BLnL+q8Gxu0QRrK65S2yQfMdQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] media: vivid: Fix wrong locking that causes race
 conditions on streaming stop
To:     Alexander Popov <alex.popov@linux.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Security Officers <security@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Nov 2, 2019 at 12:03 PM Alexander Popov <alex.popov@linux.com> wrote:
>
> -               mutex_lock(&dev->mutex);
> +               if (!mutex_trylock(&dev->mutex)) {
> +                       schedule_timeout(1);
> +                       continue;
> +               }
> +

I just realized that this too is wrong. It _works_, but because it
doesn't actually set the task state to anything particular before
scheduling, it's basically pointless. It calls the scheduler, but it
won't delay anything, because the task stays runnable.

So what you presumably want to use is either "cond_resched()" (to make
sure others get to run with no delay) or
"schedule_timeout_uninterruptible(1)" which actually sets the process
state to TASK_UNINTERRUPTIBLE.

The above works, but it's basically nonsensical. My bad for not
noticing earlier.

               Linus
