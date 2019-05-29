Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA712E310
	for <lists+linux-media@lfdr.de>; Wed, 29 May 2019 19:21:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725990AbfE2RVC (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 29 May 2019 13:21:02 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:40626 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbfE2RVC (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 29 May 2019 13:21:02 -0400
Received: by mail-ot1-f68.google.com with SMTP id u11so2813946otq.7
        for <linux-media@vger.kernel.org>; Wed, 29 May 2019 10:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KqHz0zio9QhnAFc51fdzWt0Aei5kATunWAP2X5eVO5I=;
        b=QAUGS7M/p9cxyrDqygGom415KnYrzwQVywXDTfzmMKGdLMNTjFy4RmqWuUEKTZ8HRj
         4Mtkp/Ghnv0JpfWguOpKOkh2Kd33T0q4po+1xWErR2OQwChEJ3drtze4ha6EJPwT5y13
         6chhqSjt2sWh1gYiNn7UYcuRx33J3BuV1CcX0usvo06gtCeyc2h71u/WFL3cPjrB/peC
         ZcfX70x27DLwLWqYfdr9AhfiHzNyFl9HPwprs27SsP/TOBuLpFHzHA9n+gLrMTNZJu1k
         rcavhhFe6t+n9BEM+3suij9VJp/B0Df034d7eC4Tfi3364XqJy1faYTufR+9P5PSKkgR
         HiLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KqHz0zio9QhnAFc51fdzWt0Aei5kATunWAP2X5eVO5I=;
        b=hHN+jSUuufL89UqEIFH/5KePHGRgp3oaFPdsPSMj9LBD7EYdG5GpiFsTiPRvjoslyx
         lDyb5E0pqUKALKc8/jy2vwYY8MBPN0x+IdT8NBceYn9S9+ylANNmOI9bP6wYhJ1yS3FI
         pm8H3ZSeFomlzmDxM3Kqh/syAJHeaTofQNEzaoC3JSX4P9BtxhYO/gkvuxFtdAsMn0Q7
         NvVc5e16nCrFe8Btj8H1PScCkmp8zRr6jWXKsYtDSO9w97y3Q37Y3ILY5VyyYZbNyCi0
         6oZHWMC7OF5O5RYWkVvsMKZufJKDKN72XxGw/BpuoCQqAS7smcHDYnO1TXE6aCfOGinv
         jokA==
X-Gm-Message-State: APjAAAXfPzhjI0QEHcZoT6SBjtvHXRnYM8zYUu+ZeoXCxQJfdrbGw+1p
        daKTDSDq2Akr7zrIV1cGNE9aqv9n7cVWWh4BL9E=
X-Google-Smtp-Source: APXvYqw8dr1RlpqRSOZEpjg7FqyAZiNTJea9iDyDca76CGK9n2/HHFCJ09azKEVbMtMbv3c0boS15h+dUiOXu21qN1A=
X-Received: by 2002:a05:6830:209a:: with SMTP id y26mr51782020otq.232.1559150456598;
 Wed, 29 May 2019 10:20:56 -0700 (PDT)
MIME-Version: 1.0
References: <20190418164414.29373-1-p.zabel@pengutronix.de>
 <20190529154431.11177-1-TheSven73@gmail.com> <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
In-Reply-To: <CAOMZO5BeEMyEPUbPB8vAbJb1OoUuPxGLh=EBGif12uAMG4=qoQ@mail.gmail.com>
From:   Sven Van Asbroeck <thesven73@gmail.com>
Date:   Wed, 29 May 2019 13:20:45 -0400
Message-ID: <CAGngYiVPOy3V0BZp32UX6kuDjT94W2iKC+dWYKRvtBFBw6Dh4A@mail.gmail.com>
Subject: Re: [v8] media: imx: add mem2mem device
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>,
        linux-media <linux-media@vger.kernel.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Tim Harvey <tharvey@gateworks.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Hi Fabio,

On Wed, May 29, 2019 at 12:53 PM Fabio Estevam <festevam@gmail.com> wrote:
>
> Does this patch from Philipp fix the problem?
> https://git.pengutronix.de/cgit/pza/linux/commit/?h=imx-drm/fixes&id=137caa702f2308f7ef03876e164b0d0f3300712a

Thank you so much for the suggestion ! It does like a really good candidate.

Unfortunately that patch doesn't apply to my 4.19, I am missing too many of
the latest patches. I will have to port our system to latest mainline first.
