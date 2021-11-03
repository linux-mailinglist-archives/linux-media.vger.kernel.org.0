Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1B474443B1
	for <lists+linux-media@lfdr.de>; Wed,  3 Nov 2021 15:35:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231343AbhKCOiO (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 3 Nov 2021 10:38:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230282AbhKCOiM (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 3 Nov 2021 10:38:12 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F918C061714;
        Wed,  3 Nov 2021 07:35:34 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id f4so9872120edx.12;
        Wed, 03 Nov 2021 07:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CByJ2uWF6xZdqY/Jyt0Y0rDuvjgikIkxQadq3PJ48O0=;
        b=dQvabTYVGPVKpaBRsU5ZArappxUZv1uP7hFP0poaqFaon4o++HOqzaJ2l3Aq+LDSaH
         cjkjlSdDTuCDfz7YJ3fk6OSLPTDp22nMO12ilF/0tFPiAFx3BLAtbKe/jEjmmlR0DsZ3
         vIa+Gti119IsH9bDtwTnw6NM27rUsyJLrjgR9Hk1Y04rWj093463cnaGv2bwfFJN6n8/
         I/StKulMIQZNRCIcOVu2/YDMNaEqaQCWCtFaxVsc5/PkKXI4e72fEfGvI5hELW/Armyj
         +ZnKZv3ffc0gvsu4n2NlCIyQJrWpxuBQ1HvA4qYO9TqqVAVJBZpmKYNCchkHyA9rV4/h
         d1Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CByJ2uWF6xZdqY/Jyt0Y0rDuvjgikIkxQadq3PJ48O0=;
        b=H+1hrg02P0jheC1xGF34MAf4IIed8EB7MpGakDmgSia9HQB7b5hO94TS+OH8PjZn68
         +mFDgkQGl9QyMt11AmkO1JNqHzA31QiDvExYhOVopFEQitcso7J1HExebR1x8IN+WpIO
         MWbtm5ieGopvuOckxu8Kx69v/LzGIqMqpoie4h4UQ3zj1Vj5qP3/0uQgXI1uu4zqkt8Q
         cVzyR4w1iD6vFPgcwmD8wON0y75iizbP1LS2N2tqXg4SgJO7LUvyDNmere2773LR+ak8
         hedfQwIz5t8u5YaKeSm0OlVlgEb/gYkN0I5dHJOYlkW8/uc8RSZKGUjWNJkOjEt/ggcB
         /GzA==
X-Gm-Message-State: AOAM533WavRwHkt2YXskfzPraXqCu85EoSyYDs15d6fLORvspa63ipZM
        JGEVlckdkarl1BS3hW0J0l+7rRLOfdvjpZQQ3Bg=
X-Google-Smtp-Source: ABdhPJzq9+wLGi9ITQa0cEXGEipuMzevr5v2gchEoOPbk3TiU5aGmIfc2OL8lygajTbjcfLuPWykgMiSRdPk4KsIr30=
X-Received: by 2002:a17:906:9f21:: with SMTP id fy33mr54543559ejc.567.1635950129415;
 Wed, 03 Nov 2021 07:35:29 -0700 (PDT)
MIME-Version: 1.0
References: <20211103135418.496f75d5@sal.lan>
In-Reply-To: <20211103135418.496f75d5@sal.lan>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 3 Nov 2021 16:34:39 +0200
Message-ID: <CAHp75VehnnD7VPYCH0YaB43_UvWL=FzfgDkYJ3PhgrK8PhQKtQ@mail.gmail.com>
Subject: Re: atomisp current issues
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Patrik Gfeller <patrik.gfeller@gmail.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Kaixu Xia <kaixuxia@tencent.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Yang Li <abaci-bugfix@linux.alibaba.com>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Alex Dewar <alex.dewar90@gmail.com>,
        Aline Santana Cordeiro <alinesantanacordeiro@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>, Alan <alan@linux.intel.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@kernel.org>, linux-staging@lists.linux.dev,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Nov 3, 2021 at 3:54 PM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:

...

> Currently, 10 video? devices are created:
>
>         $ for i in $(ls /dev/video*|sort -k2 -to -n); do echo -n $i:; v4l2-ctl -D -d $i|grep Name; done
>         /dev/video0:    Name             : ATOMISP ISP CAPTURE output
>         /dev/video1:    Name             : ATOMISP ISP VIEWFINDER output
>         /dev/video2:    Name             : ATOMISP ISP PREVIEW output
>         /dev/video3:    Name             : ATOMISP ISP VIDEO output
>         /dev/video4:    Name             : ATOMISP ISP ACC
>         /dev/video5:    Name             : ATOMISP ISP MEMORY input
>         /dev/video6:    Name             : ATOMISP ISP CAPTURE output
>         /dev/video7:    Name             : ATOMISP ISP VIEWFINDER output
>         /dev/video8:    Name             : ATOMISP ISP PREVIEW output
>         /dev/video9:    Name             : ATOMISP ISP VIDEO output
>         /dev/video10:   Name             : ATOMISP ISP ACC
>
> That seems to be written to satisfy some Android-based app, but we don't
> really need all of those.
>
> I'm thinking to comment out the part of the code which creates all of those,
> keeping just "ATOMISP ISP PREVIEW output", as I don't think we need all
> of those.

Are they using the same microprograms (named routines) in the firmware?

-- 
With Best Regards,
Andy Shevchenko
