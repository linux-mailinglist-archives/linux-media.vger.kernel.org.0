Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4966938C857
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236299AbhEUNjb (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235903AbhEUNj1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:39:27 -0400
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF0AEC061763
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:03 -0700 (PDT)
Received: by mail-io1-xd35.google.com with SMTP id n10so20153818ion.8
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:38:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
        b=KtETHqZDAe0bJjmaAIYzTN/XHe7zUKB4VbFuegX6nBkxmWG5ohFKpBq8WIAM4LXtdS
         7QemHJe42YQXMZdex6MBXYh5wnhr363+ZnRQBUyg/UDkHhdTqJKaR0BBPhsjIGBU7dRd
         nhzszn98cpFyveOVBYMaiBR25mix2cYwQlxzgxlnIMUyVp7QMgG6RamNqkyCsU8HyRF5
         NiL2J9z+S9m++uMBY2ci8baBBo7xNe5pz0utcvSR9g/2y3oYoB8LndiQzNguoMIpTHo1
         H+NRK4f3O9T4nOkH8ZYODufUe7qifKUTQtVP+hB8i6JNA4jfYOX9ZK7LMZrUgfKLn1bz
         Gshw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
        b=d4c9T8QvjLgtgkT1wcDGiZ814CrqHDWL/9P0nf5mAaUEAy5UiCq96nWL/RKJYYQbM4
         3NyJL3w73n5z3LCbQLELTmTsJOg8jf2Frx+vrK7Zq+DYSTrscRh18mPJfHtfxCIzxacP
         g7tB+nhztaYmiQh5974Abyj0YR1CMZiEoALeefEFBoYY9iSAFRKM3HLAZvK+8WAJG5iN
         1NptR4hpq8XKJ4Kn2kXsU+Cb8MbvR2sK0V0Mqp2xbiees0jOOxRHrcEv3Vz/sXgwejwo
         tP/5KSwqbpdMpRnErVrkav2bmyoiMWrd+TPG5u2sgBCPWIj0qamUPCfEgI36S4wf6w1i
         4xvw==
X-Gm-Message-State: AOAM5331v3tqdxyLoKKoZC/iB6rOlDWwf17UMJFG1DeOBER4teQ2QdlV
        BSXQXQNJkClxjHJVnj/6x0/unjym5+ljz1qK7PNU/w==
X-Google-Smtp-Source: ABdhPJxjJ3OhiEaMgnj0+LP0FY7WxmjA9Xv80M0Ki+88S6bhxNx6ra6pMlVDuKgWNIA6QOd4QDCiQsFR0wThZxSrLtI=
X-Received: by 2002:a05:6638:44b:: with SMTP id r11mr4423545jap.85.1621604283084;
 Fri, 21 May 2021 06:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-9-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-9-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:52 +0800
Message-ID: <CA+Px+wWod_E9_UcytNwybrvPGujMVV+XUkJQXQKJsUjO9t1yNQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/14] media: mtk-vcodec: support version 2 of decoder
 firmware ABI
To:     Alexandre Courbot <acourbot@chromium.org>
Cc:     Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Yunfei Dong <yunfei.dong@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "moderated list:ARM/Mediatek SoC support" 
        <linux-mediatek@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, May 19, 2021 at 10:31 PM Alexandre Courbot
<acourbot@chromium.org> wrote:
> Signed-off-by: Alexandre Courbot <acourbot@chromium.org>

Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
