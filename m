Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BD53A38C84B
	for <lists+linux-media@lfdr.de>; Fri, 21 May 2021 15:37:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235925AbhEUNi4 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Fri, 21 May 2021 09:38:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235931AbhEUNiv (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Fri, 21 May 2021 09:38:51 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7423C061763
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:26 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id b25so1816425iot.5
        for <linux-media@vger.kernel.org>; Fri, 21 May 2021 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
        b=NaZTtxcuBTlfaQI35LwHalM5DvO/FZwwhLZjRS7/FQdrOAtExKGt13R/NExTU//cQO
         3mcxfG1eN1ewoWzCRO/DxANKbfA8EnOqjsglH18Lj6wiS48ArQq6uLO8CAf8sRJgnkwm
         br20HeMG4mjA5VdvTfBOhrU4n9n07WGTKAOoHr54h/MLvlw/O7oR9DUPT11D1f4Ptj4s
         +yP0SJhcgYgVvs1c2UsG+idQzTnwZYfkxiQPlAg7Btf7EVYIMzQ7SlknsvAhZWdK4ZCg
         r1fbv9Qmq+oT5Ikvdjs7uyVrzLYW5lmrN8TXVv7SWNqUr4vaBYz7a941jQkeffMLbZ9J
         PRCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=enWZHbTX+1ralsrB94tU0j8mRNIc2ViVpX6p57Tm5zE=;
        b=Rz9K26vPi19AcUAsomhGzoNaanRvIxL4dpOvrWsqQ4DwRFwuuKlXoFwYCRmASfbdu/
         Fs8Q6GqQ/EEVgma42/uG9ENzuwn3NHTg9JjlWR3VGdizr4rrtizpZyRdZ+zrW+aPuU8+
         ATqdxUnLozrRQjg0ZATiPgQpiZ7uX9swZ16rXmSgVo3g7fScBNU//tg++qephLD4Mlqn
         IQdKdi2fOgqW0/z7pLALG3x2KaTk5en30YOCUkns8N4p8E26PsbWHjK1wvmJee8AnB1r
         50ZHSaDe55jfLDsETM3a7LizH33lGdTZPav+/409YYoVWDxJq2WO7cFN/sP61dDwCaPc
         4eOQ==
X-Gm-Message-State: AOAM530/1epnJ0Zw9Cwxnf2NQ6ZFT56+jchoQMaMa9GobwKahgTdsyQv
        dcZGocI4zDePxtoU/GRKIafUV9NA192odH5vtT9iiQ==
X-Google-Smtp-Source: ABdhPJy9RIIy/dIbfHJJ+7svOf8eeI6VuDWRGhsHg+X4dKcXZPvG6VAJrWtvnvLALF0dNjytfTjlmvzM7zYFfkhhM2c=
X-Received: by 2002:a05:6638:3010:: with SMTP id r16mr4595070jak.126.1621604245913;
 Fri, 21 May 2021 06:37:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210519143011.1175546-1-acourbot@chromium.org> <20210519143011.1175546-5-acourbot@chromium.org>
In-Reply-To: <20210519143011.1175546-5-acourbot@chromium.org>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Fri, 21 May 2021 21:37:15 +0800
Message-ID: <CA+Px+wXuyWv53Hwk8zo_3R4mRJzm-ShZQ_qiJ8jupSfzLWaZgA@mail.gmail.com>
Subject: Re: [PATCH v5 04/14] media: mtk-vcodec: make flush buffer reusable by encoder
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
