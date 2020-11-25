Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DCCF2C36F9
	for <lists+linux-media@lfdr.de>; Wed, 25 Nov 2020 04:11:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726868AbgKYCys (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Tue, 24 Nov 2020 21:54:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725921AbgKYCyr (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Tue, 24 Nov 2020 21:54:47 -0500
Received: from mail-ej1-x644.google.com (mail-ej1-x644.google.com [IPv6:2a00:1450:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4891C0613D4
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 18:54:34 -0800 (PST)
Received: by mail-ej1-x644.google.com with SMTP id lv15so852013ejb.12
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 18:54:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7dQmAVJ9OckwzlsSurqMxYhM29m2a8+zop97yPgBPXE=;
        b=is2GV9Ek/3+TGGREZr6N5mvtJvamdlWs9daD92dvW95+w6beQEyLcxiISgdLMGkXgy
         5bMZ+gwNfMqbTv08fpW4D3FqybduxqI/zRiy2q18DN5f7QWmDIY308p4r4X8YuGc+WJ+
         VUn7mq2EvDUHE4BE6O9j4CulfiId7FWuYBkD8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7dQmAVJ9OckwzlsSurqMxYhM29m2a8+zop97yPgBPXE=;
        b=RsVa4vSn2Myy/dXfRqyS1s4tHu9kk/sCUbPrtHOaUZ4dsyR/ZuGLYjZG0ewOhABX+L
         SxScrbCo7XqgJv5c6fixm2KzMKIr1DIOmh4CMbBL4vlJyY9dftiujNUNNlOcZdTV+vMm
         1TvgzLpmfF/zhhYCefCwYLXBkC5x3RXOUGkWy6POrbaE375wdlAdmv79NEFgNxxd6MqS
         vygeu+mRgovTIwaGZ5dVk/CrW2jy9x2Q/+UyXzwEhlWmQD/EUTI6F0xxJ+TSiBa47k6+
         gkJXW2Lt1rgZ5BlSkfikXU0avI/y8gtZBdlgALWCKIsxu9pOpKxWcx0I+Q3jfX43T4Sf
         O0vA==
X-Gm-Message-State: AOAM533LSVf3YpX9S8zgIXNTfR1ESyMj0RBOrXIFSm+Ord2laD1Kvmza
        9MLlGcjYz+o8fLG8v6LLYkLUglMyyHX+wg==
X-Google-Smtp-Source: ABdhPJxwdB41/shoSz4Miz9pyIBhjMvEYZjtTTRg86j1cbyqQkD4mvxmv4SMl91IdeOxAxJDAeb/kg==
X-Received: by 2002:a17:906:1804:: with SMTP id v4mr1282188eje.201.1606272873373;
        Tue, 24 Nov 2020 18:54:33 -0800 (PST)
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com. [209.85.208.42])
        by smtp.gmail.com with ESMTPSA id rv19sm408267ejb.38.2020.11.24.18.54.33
        for <linux-media@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 18:54:33 -0800 (PST)
Received: by mail-ed1-f42.google.com with SMTP id q16so937861edv.10
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2020 18:54:33 -0800 (PST)
X-Received: by 2002:a2e:8115:: with SMTP id d21mr434973ljg.379.1606272410338;
 Tue, 24 Nov 2020 18:46:50 -0800 (PST)
MIME-Version: 1.0
References: <20201029011721.6705-1-irui.wang@mediatek.com>
In-Reply-To: <20201029011721.6705-1-irui.wang@mediatek.com>
From:   Alexandre Courbot <acourbot@chromium.org>
Date:   Wed, 25 Nov 2020 11:46:39 +0900
X-Gmail-Original-Message-ID: <CAPBb6MXQadf+0xP3VXAWwaew-OFrFGu-yPZfjXNtMqcfpjzQGg@mail.gmail.com>
Message-ID: <CAPBb6MXQadf+0xP3VXAWwaew-OFrFGu-yPZfjXNtMqcfpjzQGg@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: mtk-vpu: VPU should be in idle state before
 system is suspended
To:     Irui Wang <irui.wang@mediatek.com>
Cc:     hverkuil@xs4all.nl, mchehab@kernel.org, matthias.bgg@gmail.com,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        Maoguang.Meng@mediatek.com, Longfei.Wang@mediatek.com,
        Yunfei.Dong@mediatek.com, Andrew-CT.Chen@mediatek.com,
        erin.lo@mediatek.com, PoChun.Lin@mediatek.com,
        houlong.wei@mediatek.com, hsinyi@google.com,
        srv_heupstream@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, Oct 29, 2020 at 10:17 AM Irui Wang <irui.wang@mediatek.com> wrote:
>
> VPU should be in idle state before system is suspended
> or it will work abnormally like VPU program counter not
> in a correct address or VPU reset
>
> Signed-off-by: Irui Wang <irui.wang@mediatek.com>

FWIW,

Reviewed-by: Alexandre Courbot <acourbot@chromium.org>
