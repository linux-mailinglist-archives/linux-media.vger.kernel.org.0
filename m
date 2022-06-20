Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D29A5550FAF
	for <lists+linux-media@lfdr.de>; Mon, 20 Jun 2022 07:25:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbiFTFZg (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Mon, 20 Jun 2022 01:25:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237006AbiFTFZg (ORCPT
        <rfc822;linux-media@vger.kernel.org>);
        Mon, 20 Jun 2022 01:25:36 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04B8EDF37
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 22:25:35 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id b8so13450833edj.11
        for <linux-media@vger.kernel.org>; Sun, 19 Jun 2022 22:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=;
        b=hr/i+COcpVsTSVEVRXmn8BToF7wohakO0101jRn9kRrjM38xXFv36ueZmUYFeF7tMs
         MhQf0KBvD+ufRlJDSD8p+HhwOg1IatNHX5ROaL5G3WIA4Bc/XVrN1sotSR3iUwscYf9w
         zs6/fyN9LhYXinNOiVjFzKY1HepGVgu2Gb5jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=iTyxMGysFvLVjw1ty4gwMbVdKBXhcL1xQssE1M7jQRs=;
        b=F8iOLgvXHUmK/4z+PD0+E2V6+yvx1523N5G9OOYTbaymLvaJ9F/T5AnDpNPErzEED5
         xuMldBaOWavMBkvTj7Lmx+2B1H5MUUwexHCQpvnscej8XPInyZZzcHGQExHGpN+oC89w
         0rkHgpZPI7pYvvRYpaEWiD1duNltJ3lRIP0qGwE6BD+L9goa5sAeXZ3DaED+ht3Y6Lrl
         NtTymTd8m50wsoM9fPUUOJ5CX52r2Cv2yGbGa3n6QiQ7AP8UVf7NbKyR6IOM/oszuiuu
         tZh7PD7DIfb86ZUb25GNKJNu6W2Qzr1W3wuhODJAcBIA96VntTYE11pFtGkhwIOoVO8c
         Ce9g==
X-Gm-Message-State: AJIora9y9n0F7RWC+AQkbFuT3Jeospea8DGR1vob3THQ+aBdtLzZgT67
        PVqfruV+Tw7kc+oxEeTPxlObFufDLaPhxCalcLgLTA==
X-Google-Smtp-Source: AGRyM1ve6GEVbjnEdneKcnH6buKWIMD7xtxtHnE/K2tR9nDrr6cM5g2g7pzOhyL1GqvCL7sj+U4/HpOoO6q4bsSD2TU=
X-Received: by 2002:a05:6402:4303:b0:435:833a:16ed with SMTP id
 m3-20020a056402430300b00435833a16edmr2517462edc.248.1655702733588; Sun, 19
 Jun 2022 22:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220618072929.28783-1-yunfei.dong@mediatek.com> <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
In-Reply-To: <CAGXv+5EFkZ6-bvu68dV4hr795+N3tAwbXYg5WCJp+Zd+pf1Aqw@mail.gmail.com>
From:   Chen-Yu Tsai <wenst@chromium.org>
Date:   Mon, 20 Jun 2022 13:25:22 +0800
Message-ID: <CAGXv+5E2wULkB7_u_H7jFAi6Jk2AvUcfOJdzOp_5m2b4n3shww@mail.gmail.com>
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
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Mon, Jun 20, 2022 at 12:54 PM Chen-Yu Tsai <wenst@chromium.org> wrote:
>
> On Sat, Jun 18, 2022 at 3:29 PM Yunfei Dong <yunfei.dong@mediatek.com> wrote:
> >
> > Need to get dec_capability from scp first, then initialize decoder
> > supported format and other parameters according to dec_capability value.
> >
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
>
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
>
> Tested on MT8183 on mainline 20220617-next with the vcodec-dec DT node
> copied from the ChromeOS v5.10 kernel.
>
> This fixes an issue where the first attempt to enumerate formats on the
> device right after boot returns an empty list.

BTW, this should have a Fixes tag.

Either

Fixes: 7a7ae26fd458 ("media: mediatek: vcodec: support stateless VP8 decoding")

which looks like the first instance of when firmware capability really is
considered, or

Fixes: fd00d90330d1 ("media: mtk-vcodec: vdec: move stateful ops into
their own file")

which matches when ctx->dev->vdec_pdata->init_vdec_params(ctx) was first added.


ChenYu
