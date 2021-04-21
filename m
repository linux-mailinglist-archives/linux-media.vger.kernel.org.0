Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A234366CD9
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 15:29:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242141AbhDUNaJ (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 09:30:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:45568 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241644AbhDUNaH (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 09:30:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F3F46008E;
        Wed, 21 Apr 2021 13:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619011774;
        bh=rUnHKzP2RJ+ynrTW2RlaXW0lo2URfY8WXPco0RHrmhA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=WmOMr47J7IUhfxH30sb0ENh/Y5r04C5SSNWqfNlcKXehPbaisPYnTtTymP7jFdkdK
         S3WBcYogZuBO0Ga/GA/W9KzsfYZd4t+AAHyVLk4DXtAvMDwRD6FwieCvr7xRCQyXm8
         yIYgQR9X+EexcF19O/3cMud8LGJXXxPBMkf/RXJJ9WZsippbIj236iaknYuyUk+a8f
         kPHXwgvt48cwt3zGKK7yvULanP/IN2xJcVyZIK4p4fdaPLkZ2rUZNhBF0LqS/No8cZ
         ys3Snv48iGu2vEcAi8/KxUingyaMJw3W48sFrgCivwWdzib1Qg9+2ViyxZ6iMYWQo5
         +TlLNtw1G2PGQ==
Received: by mail-ej1-f44.google.com with SMTP id u21so63547003ejo.13;
        Wed, 21 Apr 2021 06:29:34 -0700 (PDT)
X-Gm-Message-State: AOAM530RXfMwClKsswEOVpSl/UafQzP14nlC1UYduGVMzcOlXw8xTV44
        Pb5vSNH2vNDRZPc2gugKpLJ3mphAqJtbkZvY3Ho=
X-Google-Smtp-Source: ABdhPJzMMViUuqtQ9pug04qjkPSYYz7pojO/DjCrp5ViV8Ea+sF18hev3n7o3ZUu4TY3HK36SWIvvE4DjLKH0lKbbO0=
X-Received: by 2002:a17:906:4e93:: with SMTP id v19mr32199993eju.215.1619011772820;
 Wed, 21 Apr 2021 06:29:32 -0700 (PDT)
MIME-Version: 1.0
References: <20200614033106.426-1-wu000273@umn.edu> <013fba3b-2451-855b-08d4-87682464b8bf@xs4all.nl>
In-Reply-To: <013fba3b-2451-855b-08d4-87682464b8bf@xs4all.nl>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 21 Apr 2021 15:29:21 +0200
X-Gmail-Original-Message-ID: <CAJKOXPc2_J-_m_e0+xGW=RHgx6p67yMTTfQhjVkEHUmVB5DGzQ@mail.gmail.com>
Message-ID: <CAJKOXPc2_J-_m_e0+xGW=RHgx6p67yMTTfQhjVkEHUmVB5DGzQ@mail.gmail.com>
Subject: Re: [PATCH] media: sti: Fix reference count leaks
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     Jean-Christophe Trotin <jean-christophe.trotin@st.com>,
        wu000273@umn.edu, kjlu@umn.edu,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Sept 2020 at 13:45, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> Hi Jean-Christophe,
>
> I'll take this patch, but while reviewing it I noticed something else:
>
> On 14/06/2020 05:31, wu000273@umn.edu wrote:
> > From: Qiushi Wu <wu000273@umn.edu>
> >
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code, causing incorrect ref count if
> > pm_runtime_put_noidle() is not called in error handling paths.
> > Thus call pm_runtime_put_noidle() if pm_runtime_get_sync() fails.
> >
> > Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> > ---
> >  drivers/media/platform/sti/hva/hva-hw.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/media/platform/sti/hva/hva-hw.c b/drivers/media/platform/sti/hva/hva-hw.c
> > index 401aaafa1710..bb13348be083 100644
> > --- a/drivers/media/platform/sti/hva/hva-hw.c
> > +++ b/drivers/media/platform/sti/hva/hva-hw.c
> > @@ -272,6 +272,7 @@ static unsigned long int hva_hw_get_ip_version(struct hva_dev *hva)
> >
> >       if (pm_runtime_get_sync(dev) < 0) {
> >               dev_err(dev, "%s     failed to get pm_runtime\n", HVA_PREFIX);
> > +             pm_runtime_put_noidle(dev);
> >               mutex_unlock(&hva->protect_mutex);
>
> This appears to be a spurious mutex_unlock() since I don't see a corresponding mutex_lock.
>
> Jean-Christophe, can you check this and, if I am right, post a patch fixing this?

Probably patch should be skipped due to uncertain intentions:
https://lore.kernel.org/linux-nfs/YH+7ZydHv4+Y1hlx@kroah.com/

Best regards,
Krzysztof
