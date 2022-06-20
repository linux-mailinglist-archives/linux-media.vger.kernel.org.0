Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9FFF7550F89
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 06:54:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235858AbiFTEya (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 00:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232921AbiFTEy2 (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 00:54:28 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40055DE9C
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 21:54:25 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id es26so11722698edb.4
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 21:54:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=;
        b=UKNKFhdL+7ivgne6rJC21mSSfiaLKZHX9yoOuIh9UmqiDzzaewQHD7yYJipRMbN5SI
         sqMO9Scex5fT2OG4s3idcHiBshzVzr83BQRiz9MclD5AgLHLh9ef6R0EaL7PWErhcE/g
         wKYAz5furNCnzUMXK/fAv/VmQ0Psdwl6aMHDw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mukyLCtBBbCJ6QLdWGYeYZEZ9YqINwpy/ZdfkORqBZE=;
        b=kLI0PHo+fFJ+Dj8q3nQqLHqie8AsExj7LgAfsvFTyQVkek+gUEigccOVWuelEbaCnM
         fWYFl/hxNrqvRsigdXLIOhe1nzPmHNg6f9yF6Hup4b36RcfDAfNO4Tkzmf1vekAnW+Bo
         KgWDPvZ1PiQZ8wb8v62dv70a/gfiv6reJZTe9AgZrU2Mp1ZhmAH8uBzkypoo96jOxbTL
         8BuCNI2yfu21a14OtxFyFqeRwXIDW7r8pJPB4pUKA6qO+w/FeGm8NusvR2m1AZ3BxNB6
         yYBYpIBoRcajjZknBeJykxRai1MGyr71/9P6pLfkQsDqk6XBK+++xKztkrgRTIkLvUpJ
         Iasw==
X-Gm-Message-State: AJIora8+HXZdrbeK23rwVfcpUs+OX3ES8MOPzlhSgbGxubW2DTj4RdqH
        XT/oiEfMr0MSfqn/FmT2SEucN1rbKu3Mx0+cxNX/Sw==
X-Google-Smtp-Source: AGRyM1uRThNT8XmE57SQVNixL8TMkzT1S2u9lzIBzMfvygATaLlCkuFrLWUz2Cy72NYhPuNYT7dU009axLMuI9/ox2A=
X-Received: by 2002:a05:6402:3785:b0:435:5d0e:2a2e with SMTP id
 et5-20020a056402378500b004355d0e2a2emr19724945edb.307.1655700863894; Sun, 19
 Jun 2022 21:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220618072929.28783-1-yunfei.dong@mediatek.com>
In-Reply-To: <20220618072929.28783-1-yunfei.dong@mediatek.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 20 Jun 2022 12:54:12 +0800
Message-ID: <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
Subject: Re: [PATCH] media: mediatek: vcodec: Initialize decoder parameters
 after getting dec_capability
To:     Yunfei Dong <yunfei.dong@mediatek.com>,
        Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc:     Nicolas Dufresne <nicolas@ndufresne.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Benjamin Gaignard <benjamin.gaignard@collabora.com>,
        Tiffany Lin <tiffany.lin@mediatek.com>,
        Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Tomasz Figa <tfiga@google.com>,
        George Sun <george.sun@mediatek.com>,
        Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
        Hsin-Yi Wang <hsinyi@chromium.org>,
        Fritz Koenig <frkoenig@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Irui Wang <irui.wang@mediatek.com>,
        Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
>
> Need to get dec_capability from scp first, then initialize decoder
> supported format and other parameters according to dec_capability value.
>
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
Tested-by: Chen-Yu Tsai <wenst@chromium.org>

Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT node
copied from the ChromeOS v5.10 kernel.

This fixes an issue where the first attempt to enumerate formats on the
device right after boot returns an empty list.
