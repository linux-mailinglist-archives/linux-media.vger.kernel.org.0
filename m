Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8242063058
	for <lists+linux-media@lfdr.de>; Tue,  9 Jul 2019 08:15:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbfGIGPV (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 9 Jul 2019 02:15:21 -0400
Received: from mail-ed1-f43.google.com ([209.85.208.43]:46782 "EHLO
        mail-ed1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725818AbfGIGPV (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 9 Jul 2019 02:15:21 -0400
Received: by mail-ed1-f43.google.com with SMTP id d4so16578663edr.13
        for <linux-media@vger.kernel.org>; Mon, 08 Jul 2019 23:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GDzjMWxwokXwvdx7TqR3+5NdbnOSDiEOotLEa/Zg7Nk=;
        b=K8xZ2RJnipyWngJ53bOuctxIW7TEMd/MljxkcYd6t7879ub/ZQHx6ZxQZy8GuM0iwI
         Q5Xa5YlgWnVqTQW6ZlzrLxzHSRhystAdkSKYbgzd6bTh6hbXMwUvVRiwdEvqPESnJnGH
         9JJjZVW0WbeXMlXKAWelEJw+GYI5HoFrFU06k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GDzjMWxwokXwvdx7TqR3+5NdbnOSDiEOotLEa/Zg7Nk=;
        b=mfYe3pe2F9rKJHjC0PnhsQk/abR9a5OaUnOJ4ZY1LaEX9Dd6kV5vs1gT2VV4CR2jE2
         +TWAvY9BtNQ8XKTOJfkM24ovFO2IsnRoglKxE7z4Qw5j9jMlJBLgRPUM7lAUAna+FnGf
         Zvj9GAsb48cacVi8EmeWGDBsGMcKSm7bfOYKtzKYsFjl4y88Z8PkNV4yIue8KEQNQKTZ
         NtW+Nzg6zRR+gGapUD2V6iSE3VyzKyGsGmL9tDStPAUeLT/R9ikV47lBnVHY1ngF212o
         L1zPCyzw11gtBqknCUY7c/r83jR/d72uEkyFjhfom9tl63JwyZiq1A+KE/mRHLhBuBi1
         NEYA==
X-Gm-Message-State: APjAAAVxKvPlaaMNE5HjsXU+/etVHUEXkCtuVyRBHGMdJwTalTRj8BtC
        9NldpLHK4qE4ewXw2bjUx1dg8u3cYRE=
X-Google-Smtp-Source: APXvYqwq4XFEjh4ObSx5x2UMvOfAOEU4R51GQOUWSH5NMenRE+YFmWXIhsH9FzhVcboJDu89E/LzAw==
X-Received: by 2002:a17:906:4a0d:: with SMTP id w13mr20122326eju.103.1562652919105;
        Mon, 08 Jul 2019 23:15:19 -0700 (PDT)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id j7sm6312224eda.97.2019.07.08.23.15.18
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Jul 2019 23:15:18 -0700 (PDT)
Received: by mail-wr1-f43.google.com with SMTP id x4so19569191wrt.6
        for <linux-media@vger.kernel.org>; Mon, 08 Jul 2019 23:15:18 -0700 (PDT)
X-Received: by 2002:a5d:5012:: with SMTP id e18mr12159590wrt.166.1562652917666;
 Mon, 08 Jul 2019 23:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190620073505.33819-1-acourbot@chromium.org>
In-Reply-To: <20190620073505.33819-1-acourbot@chromium.org>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 9 Jul 2019 15:15:05 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Cn9GzXEj+tBtJsL8GXouJEyj+HSUng5StqNsCxKZK9yw@mail.gmail.com>
Message-ID: <CAAFQd5Cn9GzXEj+tBtJsL8GXouJEyj+HSUng5StqNsCxKZK9yw@mail.gmail.com>
Subject: Re: [PATCH v5] media: docs-rst: Document m2m stateless video decoder interface
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Nicolas Dufresne <nicolas@ndufresne.ca>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Jun 20, 2019 at 4:35 PM Alexandre Courbot <acourbot@chromium.org> wrote:
[snip]
> +Initialization
> +==============
> +
[snip]
> +5. *[optional]* Choose a different ``CAPTURE`` format than suggested via
> +   :c:func:`VIDIOC_S_FMT` on ``CAPTURE`` queue. It is possible for the client to
> +   choose a different format than selected/suggested by the driver in
> +   :c:func:`VIDIOC_G_FMT`.
> +
> +    * **Required fields:**
> +
> +      ``type``
> +          a ``V4L2_BUF_TYPE_*`` enum appropriate for ``CAPTURE``.
> +
> +      ``pixelformat``
> +          a raw pixel format.

We should be able to set different width and height as well, to allow
strided and padded frame buffers. Otherwise we wouldn't be able to
import DMA-bufs allocated from some other sources.

(FYI, I've posted a similar comment to the stateful interface too.)

Best regards,
Tomasz
