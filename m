Return-Path: <linux-media-owner@vger.kernel.org>
X-Original-To: lists+linux-media@lfdr.de
Delivered-To: lists+linux-media@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4252366CCD
	for <lists+linux-media@lfdr.de>; Wed, 21 Apr 2021 15:28:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241961AbhDUN33 (ORCPT <rfc822;lists+linux-media@lfdr.de>);
        Wed, 21 Apr 2021 09:29:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:44970 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241823AbhDUN32 (ORCPT <rfc822;linux-media@vger.kernel.org>);
        Wed, 21 Apr 2021 09:29:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 91A7E6144B;
        Wed, 21 Apr 2021 13:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1619011735;
        bh=d8/vfSwddK+Y8TdODqYGvDFDCm4JKJqzn5GUmGaiiRs=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TMzg7+28zsUnQ+CclYA+mOcApaUmH6AyNm5wjWaRSdO4UqDz6JXxrBm/8Jk4pufWp
         JePteHPwuyXkLUKa96DqrmM/KdTM50NYENHUXKhURWPH7eOwtRRK4vjjaFkaWK/ULV
         4KzjMaTrJnDj3ATietOM/xTYKW64qu8FXOR7YnBeBuHrGH8XqLc4m/OXE/YJQCDXVH
         b+Ct89HECfm4km7HCK5q6C3zFIpD45+mIe0YRhDp/SN2e92A6I1zkH/ypSpR5qDPRf
         q3KykO+mod3BTTsNDD0jBkQvvF3nGsN2BUrc/yGdieeFjRq4ha9tCYu02s+8Ejvuj5
         P8Iwt/9V9uMmA==
Received: by mail-ed1-f44.google.com with SMTP id y3so13086201eds.5;
        Wed, 21 Apr 2021 06:28:55 -0700 (PDT)
X-Gm-Message-State: AOAM532AmiWHzdmD4eSI+2l8FFbjfrAsMo858t450gswbld5WNNttZVK
        7umMiNETXbNuTaGj5gUx9GQjeyiWz9PTkTRTro0=
X-Google-Smtp-Source: ABdhPJz6OX7rMgPGwizBBew3o4+66Oh3pVG75DbAo2FbGBZ8AAN8Btk4MTW1VJSRLyd2GBNubITN+56xYYrxhhNj60o=
X-Received: by 2002:a50:e607:: with SMTP id y7mr39234129edm.18.1619011734066;
 Wed, 21 Apr 2021 06:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200613230843.14109-1-wu000273@umn.edu> <19432e4d-dcc4-5056-17ef-a6d2dd7b6fb4@xs4all.nl>
In-Reply-To: <19432e4d-dcc4-5056-17ef-a6d2dd7b6fb4@xs4all.nl>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Wed, 21 Apr 2021 15:28:42 +0200
X-Gmail-Original-Message-ID: <CAJKOXPeQZWZpeStxwEhOGoFuPQzRxNHkanEZ=8nrfg7DUccoEQ@mail.gmail.com>
Message-ID: <CAJKOXPeQZWZpeStxwEhOGoFuPQzRxNHkanEZ=8nrfg7DUccoEQ@mail.gmail.com>
Subject: Re: [PATCH] media: mtk-jpeg: Fix a reference count leak.
To:     Hans Verkuil <hverkuil@xs4all.nl>
Cc:     wu000273@umn.edu, kjlu@umn.edu,
        Rick Chang <rick.chang@mediatek.com>,
        Bin Liu <bin.liu@mediatek.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Ricky Liang <jcliang@chromium.org>,
        Hans Verkuil <hans.verkuil@cisco.com>,
        Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
        linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-media.vger.kernel.org>
X-Mailing-List: linux-media@vger.kernel.org

On Thu, 17 Sept 2020 at 13:48, Hans Verkuil <hverkuil@xs4all.nl> wrote:
>
> On 14/06/2020 01:08, wu000273@umn.edu wrote:
> > From: Qiushi Wu <wu000273@umn.edu>
> >
> > pm_runtime_get_sync() increments the runtime PM usage counter even
> > when it returns an error code. Thus call pm_runtime_put_noidle()
> > if pm_runtime_get_sync() fails.
> >
> > Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
> > Signed-off-by: Qiushi Wu <wu000273@umn.edu>
> > ---
> >  drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > index f82a81a3bdee..097f0b050f67 100644
> > --- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > +++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
> > @@ -710,8 +710,10 @@ static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
> >       int ret = 0;
> >
> >       ret = pm_runtime_get_sync(ctx->jpeg->dev);
> > -     if (ret < 0)
> > +     if (ret < 0) {
> > +             pm_runtime_put_noidle(ctx->jpeg->dev);
> >               goto err;
> > +     }
> >
> >       return 0;
> >  err:
> >
>
> This patch no longer applies, can you rebase this?

This patch might be harmful, might be not. Probably should be skipped
due to uncertain intentions:
https://lore.kernel.org/linux-nfs/YH+7ZydHv4+Y1hlx@kroah.com/

Best regards,
Krzysztof
