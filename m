Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7311C465A1F
	for <lists+linux-media@lfdr.de>; Thu,  2 Dec 2021 01:00:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353902AbhLBAD1 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 1 Dec 2021 19:03:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235746AbhLBAD1 (ORCPT
        <rfc822;linux-media@vger.kernel.org>); Wed, 1 Dec 2021 19:03:27 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E32AFC061574
        for <linux-media@vger.kernel.org>; Wed,  1 Dec 2021 16:00:05 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id q14so25826204qtx.10
        for <linux-media@vger.kernel.org>; Wed, 01 Dec 2021 16:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YzFMI5oWE2o+jFyOP5vbILw8vGd41FKbBUY66oRdEQk=;
        b=HVyEG20SBKF/jqmTGVh7Dh/M0D4FVk1nCzH++iKpmlf4sjOzLgIFju63Hl9Ed9BGhp
         m/HR14Jg/zzhVH6f8hsABaAUF0TrZGvGQ7qOxJWv1GPxlYKLiMTwAiS1Ujvt8ReOCeBW
         Zk0Wf82z+4aMUjNuedm8E4Rft/118UNq0bX0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YzFMI5oWE2o+jFyOP5vbILw8vGd41FKbBUY66oRdEQk=;
        b=YTWn9xifJlJBOt17RNW9YLqXPvsPZdfmQ0VDyEQUWlodrBi0liLI8BxNEyBAlfx1ES
         sgmUSkVQF/kVW+MRU5PiFQt83aWuQ/W0Rfh54F/G4YT1AaN/jbnZAPutFCudgPGJKR2U
         RTPTna0yL7hmUxEMsz/5dIa/B2ibwOPZbJNx3qFeg7MfKcDiu6K2oycht/3KcITPy0Vr
         rnNNBqLvCwO5Z57DGJuv6KqDSEJ0gwccDlwG6q6pb5lvBkwRaxElcGj3p0ny9eaptlGH
         t/6oZZ01s17oIkERAiOHLsSKg9+ktFA/I+bd8Zg7RGux92CC+w1mj1IFpcGExFQJP/m9
         qSjg==
X-Gm-Message-State: AOAM530rDeULqCxB5pdtXSoDWFWSwWFE9vPbZsjH6hVMFSr211x+3cl8
        F/Uj4Hsfsvazp8NRKVAt1yCjKLS7O026bj6GtjNFIA==
X-Google-Smtp-Source: ABdhPJwuwORHr25rSusAmz6Rw8B8e2m0YmLSJeSuvEmJ4pbHkBNQlMFlJSCM9HXMUs06MfzXrMPJl/3J77nepYoci9c=
X-Received: by 2002:ac8:5a10:: with SMTP id n16mr10785131qta.278.1638403205087;
 Wed, 01 Dec 2021 16:00:05 -0800 (PST)
MIME-Version: 1.0
References: <20211129034201.5767-1-yunfei.dong@mediatek.com>
 <20211129034201.5767-5-yunfei.dong@mediatek.com> <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
In-Reply-To: <8a5afa81-71b7-ba42-d1ce-2bbf82a7e557@collabora.com>
From:   Steve Cho <stevecho@chromium.org>
Date:   Wed, 1 Dec 2021 15:59:54 -0800
Message-ID: <CAC-pXoP2nn-DdSJTWDES19UdMp9A5unj9u7Bs=Qw+ex9=HvyVw@mail.gmail.com>
Subject: Re: [PATCH v11, 04/19] media: mtk-vcodec: export decoder pm functions
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

On Wed, Dec 1, 2021 at 4:09 AM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Il 29/11/21 04:41, Yunfei Dong ha scritto:
> > Register each hardware as platform device, need to call pm functions
> > to open/close power and clock from module mtk-vcodec-dec, export these
> > functions.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > Reviewed-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
>
>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
