Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F9C94451A9
	for <lists+linux-media@lfdr.de>; Thu,  4 Nov 2021 11:44:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230407AbhKDKqv (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Thu, 4 Nov 2021 06:46:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhKDKqu (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Thu, 4 Nov 2021 06:46:50 -0400
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com [IPv6:2a00:1450:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CBA3CC061714;
        Thu,  4 Nov 2021 03:44:12 -0700 (PDT)
Received: by mail-ed1-x532.google.com with SMTP id b15so469942edd.7;
        Thu, 04 Nov 2021 03:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xkDBHnMYJ6iDT5g1nlO8at1+WyWlzlz85OsTSxEVvzM=;
        b=AlI02xwYo8DFhlhGbqyW2zNsV2RGiNjJlStiRhG3QdMwFW7ySI/1CNNoMR9FR9wJyt
         URVjE0yxnWYSVUhFsUZqy7T3GtCJKUUHdUW/hH/tzYjfdFC6ms9WYiJhCBdHSIoMAvvy
         2z0EYn4aPfTS9TVxvuFSNP5v5IQJoDyIPd9OOyb7t+LKGsY8FvoJbdEw9G0PIVTheT6v
         BhpE+pqmte+5QVa5ht8G0lw1t5jeWlyVO/Rx//Z/KncMlzz5HGAxwI5f7dMwiFVXlqwH
         0LczcH7OQGIiBxa7Ujwokzuhijdod2n8s63LK4+7TIsfx9ll3Hr6UdFTVIeaMFzJ+qqG
         p8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xkDBHnMYJ6iDT5g1nlO8at1+WyWlzlz85OsTSxEVvzM=;
        b=iD6dwhEh8DfpcyvaM+5IdeKv/CmHsY7DpGXV7OR+rs50d/Uiq6H1zu4fG3W0CnJP0r
         GbD2nV92qZUrZjCgvwvxPDqT3gUZfxaiFuvMieWpHNJ5uhv5/DWUvqOAhEcWvptNC3K8
         H7FarYr4zYCKQZfudyyvdIDL9SYUy0HxCKdJFfhLyhBwif9pOOvj8LPcPbdu0NnaGEhd
         KzRM1tmDfrlzT381ViDgUMfV9d/LscOADvOjumDrVhExR6ZVY1zTpY6cwH49079FQfly
         YMz4SBjCJN+g4KF+ALQBZt1tVOYqRrOB+16b5Az21LcmusVSVGmI1K7A47a/vvhxhUWj
         +D+Q==
X-Gm-Message-State: AOAM531aDFVQrBzQ8JyrK7Lc+IJyUOWgBrKaWGvdq6I6awRqtuMK/GHf
        ztesD0ykebmwhCQB3ClFkJWy+cj058s3RTrn7Wc=
X-Google-Smtp-Source: ABdhPJwDDWLhQsNsoTOxXL8P3Td/iS+592b0dsuIPQ/M4thnBT8d4vlLMvsKBZL1fh7E3lBy+HacFhGhXZ9fZNFOZKY=
X-Received: by 2002:a17:906:d553:: with SMTP id cr19mr59904770ejc.128.1636022651440;
 Thu, 04 Nov 2021 03:44:11 -0700 (PDT)
MIME-Version: 1.0
References: <20211103083337.387083-1-yang.guang5@zte.com.cn>
In-Reply-To: <20211103083337.387083-1-yang.guang5@zte.com.cn>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 4 Nov 2021 12:43:23 +0200
Message-ID: <CAHp75VdZLdJS2SLijO+Ff-8OM+fBvS-R1er5ByYuw38qrRXRwA@mail.gmail.com>
Subject: Re: [PATCH] media: use swap() to make code cleaner
To:     davidcomponentone@gmail.com
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Arnd Bergmann <arnd@arndb.de>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Julia Lawall <Julia.Lawall@inria.fr>,
        Yang Guang <yang.guang5@zte.com.cn>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 3, 2021 at 10:34 AM <davidcomponentone@gmail.com> wrote:
> Use the macro 'swap()' defined in 'include/linux/minmax.h' to avoid
> opencoding it.

Same comments as per all your valuable contributions: just think more
about the code that you are dealing with!

>                 if (dev->fmt->uvswap) {
> -                       tmp = base2;
> -                       base2 = base3;
> -                       base3 = tmp;
> +                       swap(base2, base3);
>                 }

Have you run checkpatch? What did it say?

-- 
With Best Regards,
Andy Shevchenko
