Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCF1A3BCB3A
	for <lists+linux-media@lfdr.de>; Tue,  6 Jul 2021 13:00:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231293AbhGFLDH (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 6 Jul 2021 07:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231216AbhGFLDH (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Tue, 6 Jul 2021 07:03:07 -0400
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com [IPv6:2607:f8b0:4864:20::d30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9856C061574
        for <linux-media@vger.kernel.org>; Tue,  6 Jul 2021 04:00:28 -0700 (PDT)
Received: by mail-io1-xd30.google.com with SMTP id g22so24461873iom.1
        for <linux-media@vger.kernel.org>; Tue, 06 Jul 2021 04:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=85+RRGhjODs6lcH6FGoMJhqGI1UPU1GAYsHb+vDqTGI=;
        b=kcovIMeHxj6d6wLhZ9CMLTwalFGptJT2AhB7Kp8+N3lEiQHjcOsi4c2/ggoM58tdcA
         S39evUYCjLYP/6eY51tHdYzEl7GOPaCwr4GDqXkXsPX8vcgOnyZayFPvuuHaqGicqH61
         hz/Nd9JWKB44kz3d3Ng4CIVm8WfbT8v4gGRO0MY0A/XoVjyEgchrXD/v3OQ221bUbNYi
         NLK8xNdebbXAGR9KxoKq23Bz2yrx34YbloODkjeLElxtCbe6P/joEzomSRM0tCH4xJYt
         cIXImUDQsVOe6upPw/A9lDbU7dRsRQjbq6yJYUCpzbGrNfMzTILlcc6ydf2sg7pNfe8X
         wlkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=85+RRGhjODs6lcH6FGoMJhqGI1UPU1GAYsHb+vDqTGI=;
        b=Au4ChYdJfgmE/y+zzrcC42AGt+vrAY2z3YuXinsevgXkg8EE7pPwemc954FS3zg2pb
         eMr2BorXwQ4Z8EO99UZhNl5pvGvFApNPmej0Emmrj3EuBUdQzlRM4U2cznjg20zsbNtZ
         7JjeOjFWWa7rbD3jxr3541yzdijvhh8zd/L+1HIWee9qPZWbloi5Com8uxvUuqBdT1R6
         Vr2Q80Li/KaTueWByz/NjZ3NhZs5Y8JogLYX2/0p2gSw1jCSCICo2oPINySuElAC0xeU
         0YOn2U1cMMAALFbi8yxoZ0EoZ2rsgNB6WCjgtW0aoXDUMj8sv3jT+aczLjgGehFPJR2f
         36fQ==
X-Gm-Message-State: AOAM531VMjLQaU2iv/qCJjxlW1I14Xn7TAZdt3j56nORNiWHR6K6U6XN
        uk2iEozyEwit+0uBdhM21bbZFwNZT2m1zz4EY4QDKg==
X-Google-Smtp-Source: ABdhPJwYqdX4uXaVnVQi0XP4/rzQ+1UfhvfYjksjrP95PYtkRwbQIPBuuu2IAg0m0BTSZ7BHhytyyXcXKrSXS2nUkA0=
X-Received: by 2002:a5d:87d0:: with SMTP id q16mr15428748ios.109.1625569227924;
 Tue, 06 Jul 2021 04:00:27 -0700 (PDT)
MIME-Version: 1.0
References: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
In-Reply-To: <1625038079-25815-1-git-send-email-kyrie.wu@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Tue, 6 Jul 2021 19:00:17 +0800
Message-ID: <CA+Px+wVQFK1MXbq6=x7gSfRu8uRp5hbiNgSWtJ-9ok3Lt+vz8A@mail.gmail.com>
Subject: Re: [PATCH v2,0/9] Support jpeg encode for MT8195
To:     "kyrie.wu" <kyrie.wu@mediatek.com>
Cc:     Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bin Liu <bin.liu@mediatek.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Tomasz Figa <tfiga@chromium.org>, xia.jiang@mediatek.com,
        maoguang.meng@mediatek.com, srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Wed, Jun 30, 2021 at 3:28 PM kyrie.wu <kyrie.wu@mediatek.com> wrote:
> add component framework to using multi-HW for MT8195 jpeg encode.
Could you add some summary for each patch for getting an overview of the series?

>   dt-bindings: mediatek: Add mediatek, mt8195-jpgenc compatible
>   media: mtk-jpegenc: Add MT8195 JPEG venc driver
>   media: mtk-jpegenc: remove redundant code of irq
>   media: mtk-jpegenc: Refactor jpeg clock interface
>   media: mtk-jpegenc: Generalize jpeg encode irq interfaces
>   media: mtk-jpegenc: Generalize jpegenc HW timeout interfaces
>   media: mtk-jpegenc: Use component framework to manage each hardware
>     information
>   media: mtk-jpegenc: Generalize jpegenc HW operations interfaces
>   media: mtk-jpegenc: Refactor jpegenc device run interface
The series has some consistency issues which would make readers feel
uncomfortable.

For example:
- Whether to capitalize the first characters in the commit messages/titles.
- Whether to add a period at the end of English sentences.
