Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1599B3CD522
	for <lists+linux-media@lfdr.de>; Mon, 19 Jul 2021 14:52:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236968AbhGSML0 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 19 Jul 2021 08:11:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbhGSMLV (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 19 Jul 2021 08:11:21 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 830CBC061574;
        Mon, 19 Jul 2021 05:10:15 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id g8so24114795lfh.8;
        Mon, 19 Jul 2021 05:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PvBLALQjjkFO7n8nkLkm6Sa7k4UfvgwzBwzDklxjuoc=;
        b=HLIsSJE3JBL7NlCP6Db/1QSS5Fa1x5ZhSk186mLKC8CQ6xKI9zEqv6UBRDOp7rCedo
         J0i6yY0T1evYYZ4phEUUsS2pVwwPg6EGyU0Hcxhj6M6hdfLKqQn6aC0FT0wKWd2aZgHr
         EIeAYIQEwi7P1ZyuwaU2LX1I/xrOLC3hYnYYfZTJqYr4HzPvizrZo/yRd/pTTkXAFsse
         slDK+6TN5zxEWF170aiqhPMDILu+Ml1aNb+HU7geKEkaTOnxiAyr6MslyyhJ2YqLG1n4
         HX2X5t5N7q0YJJUj4w8I2nkSjEx+aVFvIDSY+9/xbzEK7UiDOzJhsJ4yp2vJobDG2l4Z
         H/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PvBLALQjjkFO7n8nkLkm6Sa7k4UfvgwzBwzDklxjuoc=;
        b=I+ZBb7b7X/OkDTvbhoZOGmPbfeSG6tpXGt6aRPfhPq217huu+VskHzEo+okE7rc3fm
         0KjrB4yJTAsSpwZ+lrZ7YtYu1jKaf1BeyDJH4LO76s4ciml0w0oS7JQf3Bk903DUFAVL
         ZU1h9lfEf1N1zY4FHwqbuDiWJLIcF1lhcup0MrRAk7DrXwKMIGPHubblvwGttANkvHHw
         iLtxR7T9eiDleyi0owKmc2qeAJb7d41YueTiUfDFADZX9dfwgs2aWxrejF3x2uRpX3hx
         BEAvRoYuvP0Gczkg87e6E9FyAXJqqRUpbLNHutidE33I8hvssRG10ENy3g9H+ucsDwLC
         55eQ==
X-Gm-Message-State: AOAM530tfVJqHN4enNxhpR2cMeftYXG1rmQI+uTF8ZMGSdSVG6HhGqun
        t4xQBdA9TnusFvWP9rZemCbbDYNYkbvI8Qi5elY=
X-Google-Smtp-Source: ABdhPJw+OhM9x3XjOfnF7oD3tvF3B7/LQMtBCWFcTTcxDEXRCTh+4YYd4uoQn4FjOskLB43mSuSGqJsIxQiwlAW90V0=
X-Received: by 2002:a19:4341:: with SMTP id m1mr17525382lfj.443.1626699118296;
 Mon, 19 Jul 2021 05:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210604212217.70518-1-festevam@gmail.com> <20210604212217.70518-2-festevam@gmail.com>
 <CAJ+vNU35+U=pupo3bzKFnWuZgUKPe_C-0yGrcWnZH1R+PvbbWg@mail.gmail.com> <CAOMZO5CsBjW5RM0FESTeUSs6EONC+GV4VXVpLUxwnnRj1wYNog@mail.gmail.com>
In-Reply-To: <CAOMZO5CsBjW5RM0FESTeUSs6EONC+GV4VXVpLUxwnnRj1wYNog@mail.gmail.com>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Mon, 19 Jul 2021 09:51:47 -0300
Message-ID: <CAOMZO5CGQ035hiaDjAq4WqbiS5fF6_TdM57r0ZaKjB9+g1U1jA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] media: i2c: adv7180: fix adv7280 BT.656-4 compatibility
To:     Tim Harvey <tharvey@gateworks.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Matthew Michilot <matthew.michilot@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Rob Herring <robh+dt@kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jul 12, 2021 at 12:59 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Hi Hans,
>
> On Thu, Jul 1, 2021 at 3:29 PM Tim Harvey <tharvey@gateworks.com> wrote:
>
> > Fabio,
> >
> > Thanks for the submission. This does resolve NTSC capture on a
> > GW5410-G with an adv7280.
> >
> > Reviewed-by: Tim Harvey <tharvey@gateworks.com>
> > Tested-by: Tim Harvey <tharvey@gateworks.com>
>
> Do you think this series could be applied?

A gentle ping.

Thanks
