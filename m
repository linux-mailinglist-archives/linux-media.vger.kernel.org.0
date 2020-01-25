Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AD1614930D
	for <lists+linux-media@lfdr.de>; Sat, 25 Jan 2020 04:06:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387717AbgAYDFx (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 24 Jan 2020 22:05:53 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:36351 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387699AbgAYDFx (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 24 Jan 2020 22:05:53 -0500
Received: by mail-ed1-f66.google.com with SMTP id j17so4769168edp.3;
        Fri, 24 Jan 2020 19:05:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TTa+L2/mCEHdcfSemar+ubHNRvfrI19X4+IUtB5uVqs=;
        b=RmMELfsUtkmnjP0uHEXY1Oq+5d5vvxvA7romG3q9bAQnJzWuokV4oogzh3eE1Fof1l
         LZpE4Ymsfsz2PBPFn+g/pF+ifMuGWHgeFkxqhlt2wze8PjOzphWHJWahHTMgKQdNqtnL
         C2vz9lCsYcYU0XyTAOQrFH3wIxI2EoyorRgZQhU3EjVz90dgVlsL0FNW2ztoPSWMli1r
         FQTaX1LJNzJpFbaA5dl0pKzJeNH0hyfGFGDjxmLla5Xj6h1rVMzwO64W/DTB6VqULVqf
         GULgVPOrk2qTD5lxesR55llvVCyFoxeY/xunpcEPZH14Tf8WGPJhXAiJijUQORp9Ip0N
         RVtA==
X-Gm-Message-State: APjAAAWtBilzhq0yefrwIcvBqm0jORRdqE48Dtsy8xLLSWNgQf+2UXfU
        J6EsclC3Mfa06t4ADBVeNiTfJVV3H04=
X-Google-Smtp-Source: APXvYqyZCD29IfKcDxRjqjMRDpZI9qwH8jj+kzAtPbqOz79Pp2d6uST0pnDIz7y0noOQio+LiByM/w==
X-Received: by 2002:a05:6402:22c1:: with SMTP id dm1mr5030775edb.21.1579921550712;
        Fri, 24 Jan 2020 19:05:50 -0800 (PST)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com. [209.85.221.54])
        by smtp.gmail.com with ESMTPSA id u13sm175545ejz.69.2020.01.24.19.05.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2020 19:05:50 -0800 (PST)
Received: by mail-wr1-f54.google.com with SMTP id q10so4432308wrm.11;
        Fri, 24 Jan 2020 19:05:49 -0800 (PST)
X-Received: by 2002:a5d:44cd:: with SMTP id z13mr7944610wrr.104.1579921549086;
 Fri, 24 Jan 2020 19:05:49 -0800 (PST)
MIME-Version: 1.0
References: <20200124232014.574989-1-jernej.skrabec@siol.net> <20200124232014.574989-2-jernej.skrabec@siol.net>
In-Reply-To: <20200124232014.574989-2-jernej.skrabec@siol.net>
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sat, 25 Jan 2020 11:05:33 +0800
X-Gmail-Original-Message-ID: <CAGb2v6680yWT8KtjK0uKM00+6ed4NoPpsMaDyfYERwOXgb8Vbg@mail.gmail.com>
Message-ID: <CAGb2v6680yWT8KtjK0uKM00+6ed4NoPpsMaDyfYERwOXgb8Vbg@mail.gmail.com>
Subject: Re: [linux-sunxi] [PATCH 1/8] clk: sunxi-ng: sun8i-de2: Swap A64 and
 H6 definitions
To:     Jernej Skrabec <jernej.skrabec@siol.net>
Cc:     Maxime Ripard <mripard@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        devicetree <devicetree@vger.kernel.org>,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        linux-sunxi <linux-sunxi@googlegroups.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-media-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jan 25, 2020 at 7:20 AM Jernej Skrabec <jernej.skrabec@siol.net> wrote:
>
> For some reason, A64 and H6 have swapped clocks and resets definitions.
> H6 doesn't have rotation unit while A64 has. Swap around to correct the
> issue.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@siol.net>

Could you add Fixes tags for this one?

ChenYu
