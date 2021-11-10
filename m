Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4742A44BE9E
	for <lists+linux-media@lfdr.de>; Wed, 10 Nov 2021 11:30:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231169AbhKJKcp (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 10 Nov 2021 05:32:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231151AbhKJKcp (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Wed, 10 Nov 2021 05:32:45 -0500
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFD7FC061767
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:29:57 -0800 (PST)
Received: by mail-pl1-x62b.google.com with SMTP id k4so2581601plx.8
        for <linux-media@vger.kernel.org>; Wed, 10 Nov 2021 02:29:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gSFvUJLaZR+mAVPFBcPx1oudAViqkL4IwyGNB8LdK80=;
        b=eZ9Whpt501+2K7l26U4wtjldeo6V0MKg+IPh8nJFxzg+klzAvlhvUlX5uL9FGT/dEK
         ojkFp0NnQHczMBoADFUXVAU/qQyUOXo+5+KLWMv8gABEsMPWVDyurFkliVDOH9YEvoc9
         4QebnxuMUulAfKSS2P7FsdGLV2EGOTowxGCKkcDVKp76t0Hu0boOwos3GlvDg48jOxzC
         cbtKSl55U8seclKFJsrrZiKepcOuv2XvwmCmExMnFSekL4Ejhh0VN6fddzdRVLdxzJJC
         zEScDfB9Uwz7QGYIXR5l60zIehXlOZNSan/aU1SZpgLVK3zo/GK1e31s8jAjTxx449DX
         1XTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gSFvUJLaZR+mAVPFBcPx1oudAViqkL4IwyGNB8LdK80=;
        b=2xaEOW67wahB2i5DUJKt8voLUIbvYT1oJRdSEq4M2q2KoIBQTHDwVQo0NOD5nV7/Dh
         hPp+ksQf3Bf6FI+5p6bIW+Zr36pS7bKC0R7HjG0qYA+llMDJxsyY6ozhehZzz4rLvXAu
         Sjsa2GwietFBBcksTe7+i368OG3UCw6gdCq1KnMRInCzzw5L4Qx7Ck+R/lQ4QhF/PS4t
         JGxQtRZ7n+I3IPbeLBBf9MjADfzMqdgA9EKOyPIOnAnXonYVGbQwNXXf+2wMqICnXCDk
         Wo+I5XGG463LacE6TpzYSV7efIpqNisDwZbCWVQxex3jOueqUxSEoZ3y96+RP+3+Ra/D
         iHsA==
X-Gm-Message-State: AOAM532FJwzcDaJytGkxyPVmedNvp8nFIoGnzflfnVdapdj82usL1EyI
        40OP2KUto+K39qUTIFoDmvjz4aZVpIjcZRE/9dgwMA==
X-Google-Smtp-Source: ABdhPJx+7Gq0bm/h5nRmAWFRad83G/chU5WO/BoJHnti7WjK4AP/ZWkCcRzV6CRZ8T8FumyHzs27HMxGy7nk1YEJlzM=
X-Received: by 2002:a17:902:7289:b0:142:805f:e2c with SMTP id
 d9-20020a170902728900b00142805f0e2cmr14239605pll.42.1636540196956; Wed, 10
 Nov 2021 02:29:56 -0800 (PST)
MIME-Version: 1.0
References: <20211109125030.26299-1-yunfei.dong@mediatek.com> <20211109125030.26299-3-yunfei.dong@mediatek.com>
In-Reply-To: <20211109125030.26299-3-yunfei.dong@mediatek.com>
From:   Tzung-Bi Shih <tzungbi@google.com>
Date:   Wed, 10 Nov 2021 18:29:45 +0800
Message-ID: <CA+Px+wWNg060xNcBSnu696OHPcp5Mqy=ovbAW_dtBTnoVXLMmg@mail.gmail.com>
Subject: Re: [PATCH v9, 02/19] media: mtk-vcodec: Align vcodec wake up
 interrupt interface
To:     Yunfei Dong <Yunfei.Dong@mediatek.com>
Cc:     Alexandre Courbot <acourbot@chromium.org>,
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

On Tue, Nov 09, 2021 at 08:50:13PM +0800, Yunfei Dong wrote:
> Reviewed-By: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

s/B/b/, the suggested tag name is "Reviewed-by"[1].

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#using-reported-by-tested-by-reviewed-by-suggested-by-and-fixes
