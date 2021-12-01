Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2840A465A18
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 00:58:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353910AbhLBABm (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 19:01:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344148AbhLBABm (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 19:01:42 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3428C061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 15:58:20 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id s9so23326646qvk.12
        for <linux-media@vger.kernel.org>; Wed, 01 Dec 2021 15:58:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RQT5LaKuLpVbjom//RaF2AtN8bjf4gP/+BsDdSre8KU=;
        b=lp4L8B9l+jnHbFKIcbcvNkHjhTK1O6mbofLkPamQb5VBj/MIHd93OExtstUQdeEOqM
         UMQPvKud8dsr3AfHXo6gMpBMwENnXFj/+ikud6r2xfl608m0EjGMEKAeJLoL5VaCPY52
         dUaOIBZ8X7EGC5cw5gsgz1GpdesgTzTFmLImw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RQT5LaKuLpVbjom//RaF2AtN8bjf4gP/+BsDdSre8KU=;
        b=nhWxz2GhMb1XPpmHQGJiXUTEeIZ5Jp5AA6dfxMEjx6vmb+qTrpyeTkPG78mld9nrTG
         TynPbE2dv9K+KHFyOETkobGnn1HnrmZPhVh6TJ9t2mdB4o7wQPqvyzokbd/FXa4Ncvj2
         yiJI2NykOaXJ977VbVDKd5A7m2xYt4qP6cZrtuAkKfeodyU4aVP0DKL90tS00VInlU2i
         zV7okMqw2K8mnDA24UGa579HqzaGzvQHafmAIT7fGv5E/yJ2dOtKUaLWAGzNIMErS3E4
         qIL9eskgdMAuhH8i1BORlcx8Q3aWeTzArnR2zmydywAxnlwogmgFKx3QAPgyAmarLFMR
         j/UA==
X-Gm-Message-State: AOAM532mnOoJkbE2DjQjN/3U+1OPrxa9B0E0Z1huDiBB1CrR0QfAWNfW
        N50ATMlVS8fFuCi3Zar0dJBKW8Molq6UUFl+CrEP1Q==
X-Google-Smtp-Source: ABdhPJzlpgZXsoQfRBzDzE58VVCzidR0RvngXil7sYYYYjvo4+YcwcrLBGNoEy/KBUtLRTFiMMMi5pjug9dEP26Q0DQ=
X-Received: by 2002:a05:6214:17cc:: with SMTP id cu12mr10393249qvb.66.1638403100004;
 Wed, 01 Dec 2021 15:58:20 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-6-yunfei.dong@mediatek.com> <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
In-Reply-To: <3fb4e348-295d-9ec4-43b4-0fad06b33010@collabora.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Wed, 1 Dec 2021 15:58:09 -0800
Message-ID: <CAC-pXoOgyTRqYpA9U2ze840moLQ+gTT4EnLq-Pn9H4PHd9ttTg@mail.gmail.com>
Subject: Re: [PATCH v11, 05/19] media: mtk-vcodec: Support MT8192
To:     AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Alexandre Courbot <acourbot@chromium.org>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>,
        Tzung-Bi Shih <tzungbi@chromium.org>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        srv_heupstream@mediatek.com, linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

Reviewed-by: Steve Cho <stevecho@chromium.org>

On Wed, Dec 1, 2021 at 4:10 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/11/21 04:41, Yunfei Dong ha scritto:
> > From: Yunfei Dong <yunfei.dong@mediatek.corp-partner.google.com>
> >
> > Adds MT8192's compatible "mediatek,mt8192-vcodec-dec".
> > Adds MT8192's device private data mtk_lat_sig_core_pdata.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
